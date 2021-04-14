此处为手动构造cfg，利用邻接表实现有向无环图

10.27：
网上找到一个结构看似完整的dag实现，需要根据自身需求增加或者修改属性和方法的实现
思考：建出来的cfg的作用（决定要增加什么成员变量方法等） 如何建立接口使之与主要算法协调工作


`g++ -g graph_link.c linear_link.cpp graph_linkmain.cpp (你大爷的一个gcc一个g++我搞了这么久）

12.2:
`g++ -g graph_gen.c graph_link.c linear_link.cpp graph_linkmain.cpp 
graph_gen.c以后将有llvm的pass自动生成

TODO:
1.阅读已有pass代码学习如何利用其生成graph_gen.c(完成）
  子问题：llvm中获取行编号的方式（应当以每一个基本块的首行号命名各个基本块）（1.13完成）
2.Gcov的利用方式，除了文本方式之外，有什么更方便的方式得到（行号，运行次数）的pair
  以后的问题：涉及复杂调用时运行次数的计算（即#（s,t）之类的）
再以后的问题：在不同区间建DTMC的方法？区间分割方式？多函数跨过程调用的建图？

12.10：
感受到了由于对llvm的不熟练，因为后续需要根据行号决定运行的覆盖信息，这里如何得到行号有某种困难。应该可以通过查llvm ir的有关接口解决。
准备先写一个能跑的，按基本块编号而不是按行号编号的（完成）

opt -load libMyCFGPass.so -MyCFG test.bc
可以得到等价的根据基本块编号得到的生成cfg图的.c文件，利用其替换到graph_gen即可。
TODO：
需要读取每一个基本块的首行行号，将块编号替换为行号（研究llvm的功能）
（C,X）如何得到方便使用的（行号，运行次数）由于以后还会涉及求出目标区间后采样并重复计算的过程，似乎需要接口更加方便一些 研究gcov 搜索有无其他工具

12.22
问题：初步研究发现llvm ir似乎抹去了每一个BasicBlock对应的行号信息，但是gcov又必须需要这种行号进行定位
··解决思路：
	1.继续研究llvm功能了解更多相关信息
	2.由于自己给出的llvm基本块采取了某种自然编号，也许可以通过中间处理人为与源代码建立联系
主要问题是，建CFG图时是从Function.begin开始，每一个block遍历子节点的一种较随意的遍历方式，于是和源代码的联系相对就比较弱
··解决思路1的进展：可以找到.ll文件中含有DILocation包含了行号信息，暂时未能和BLock结合起来（或者说和BasicBlock类对应起来）
其实后面到底如何利用test.c.gcov文件才是更麻烦的事

1.13
https://stackoverflow.com/questions/64753937/why-i-am-not-getting-precise-line-column-debug-info-from-llvm
给出了如何利用.ll文件内包含的debuginfo信息，其中包含了行号
初步完成了利用行号替换自然编号建CFG图的功能，略微瑕疵是第一块的行号变成了函数行号，虽然也差不多。本文件下的MyCFGPass与llvm处的相同，.so文件在myllvm文件夹下经过了测验
`clang test.c -emit-llvm -c -o test.bc -g
`opt -load libMyCFGPass.so -MyCFG test.bc
得到myfunc.c即为建图所需的子部分，将其替换graph_gen.c即可。暂时认为这一部分的自动化已经完成。
下一个问题：对于gcov的覆盖信息的利用
暂时解决想法：按照愚蠢的文本读取获得运行次数信息，利用其改变CFG的边上的概率信息
(似乎对于reward重新有了一点问题，主要是因为引入了一个超级汇多了一些边）

2.12
reward的问题解决。
```梳理一下需要做的：
	1.获取运行次数信息，将一次运行流程基本自动化（需要对于gcov的理解或者先愚蠢读文本）
	2.探究抽象解释域的分割方式，以及在不同抽象域上运行比较的方式
	3.自动化运行脚本完成循环迭代的方式
	

2.18
gcov可以生成json格式报告，理论上可以一定程度上解决效率问题。方法参考主目录下gcov文件夹的readme

2.23
对于2.12的1，偷懒利用py读取json（在gcov文件夹下），需要在py和cpp之间进行信息传递，暂时的想法是利用py的数组生成一个cpp文件修改填入一个map

2.23
可以利用map结构完成自动化修改的后半部分，此处遗留计算#(s,t)+1 / #s + n的问题；
需要由py读取json后生成modify_map函数，此处文本打印代价应该较大，作为暂时处理方式。（直接cpp读取json似乎需要结构大改）

2.28
完成了#(s,t)+1 / #s + n的计算问题，抽象为DFA已知每个状态到达次数求转移函数发生次数，由于多对多的状态转移存在非确定解，此处仅为针对“顺序循环分支”简单结构下的处理。另外，由于生成CFG时生成了超级汇，但超级汇不能被自动识别为已到达，因此得到的reward会比标准定义的reward多1（已修复）
```遗留问题整理
	1.如果存在异常控制流导致存在多对多，该如何处理？
	(已修复）2.引入超级汇（llvm）后导致reward+1，数据较小时可能有精度问题（遇到后修复）。似乎可以直接修复。利用超级汇没有后继。
	
利用py生成modify_map

3.8
py生成modify_map完成
整理一下运行过程：(单次）
输入：目标程序test.c,及对应初始测试集input（此处为input.txt）
1.获取衍生文件：
	`clang test.c -emit-llvm -c -o test.bc -g （获得test.bc）
	`gcc -fprofile-arcs -ftest-coverage test.c -o test (生成test和test.gcno)
	`./test （生成test.gcda）
	`gcov test.c --json （生成test.c.gcov.json.gz）
	`gunzip test.c.gcov.json.gz (获得test.c.gcov.json)
2.根据衍生文件生成待补充代码：
	test.bc与test.c.gcov.json复制到主工作目录（后期可以通过指令解决）
	`opt -load libMyCFGPass.so -MyCFG test.bc (获得myfunc.c（待测目标函数，依赖于函数名）和main.c(不关注））
	用myfunc.c中内容替换掉graph_gen.c(注意函数名保留为graph_gen)
	`python3 jsonread.py (自动替换掉了modify_map.cpp中内容）
3.编译运行：
	`g++ -g graph_gen.c graph_link.c modify_map.cpp linear_link.cpp graph_linkmain.cpp （生成a.out）
	`./a.out 获得输出 关注reward

！Pass.so生成文件目前是追加写入，可能需要调整	
需要将二分区间的对比运行情况综合自动化完成
	
3.10
对于实验（真实实验）接口的不了解导致不确定人造测试的形式应该如何。
!gcov的计数是累计的
需要编写控制生成测试样例的程序，在此程序中决定不同区间（根据某一种区间分割方式）分别对不同区间的测试情况监测并建立DTMC获取reward，进而进一步生成新的测试样例（以及分割新的区间）

3.12
编写了用于整体命令行控制的sy.py 部分运行功能完成

修改了CFGpass，myfunc.c中函数名默认为graph_gen，故只需要将graph_gen.c内容直接替换为myfunc.c即可
在py整体运行过程中能否以某种方式获取可执行程序的输出？(已解决）

micmd = "./a.out"
import subprocess
res = subprocess.Popen(micmd, shell=True, stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE, close_fds=True)
mi = res.stdout.readlines()
#mi = float((mi[0].strip())) 
a = float(str(mi[0],encoding='utf-8'))
mi[0]即为第一行输出 byte格式

reward的表现与预期不太符合

3.20
采用了增量编译改进了修改后重编译的效率
gunzip取消了重名提问
目前运行方式：
`python3 sy.py test.c -10000 9999 (对于test.c中的funcname暂未做参数处理)

想要构造更好的程序覆盖的例子
完整化迭代过程 似乎需要额外保留所有测试样例

3.22
python3 sy.py test.c -10000 9999 4(iteration)
重复采样过程完成，但是由于例子不佳有些问题。
目前流程：
1.随机采样K次
2.初始时二分区间，并将输入分入对应区间；
(2)根据reward，找到reward最大的区间进行二分，并将输入重新分入对应区间
3.对每一个区间利用DTMC计算reward
4.根据reward，加权采样k次
5.repeat from (2)

存在的问题，由于二分区间后，得到的小区间的case数目较少，在大多数区间都无法获取reward的条件下，较少的case意味着DTMC上有较大的可能通向事实上无法到达的边（从而获取不存在的reward），容易导致一直在不可能的区间反复进行采样

目前使用单参数，多参数需要修改


4.3
修改了reward的计算，reached节点为公用，但需要注意先跑完第一次的所有测试再进行reached的记录,需要recompile(debug半小时orz)
对于test.c程序，在一开始确定平均rand的前提下，可以确定只有两个区间完全相同时将有在负数区间做无用功，否则有较大期望正常得到正数区间的结果

reward问题解决。
多参数未实现，需要参照benchmark进行
1.benchmark查看，暂时选定为DARPA cyber Grand Challenges binaries
2.多源文件的目标CFG生成
3.方法迁移到afl上，尝试用afl代替gcov
4.abstract interpretation查看，学习方法指导区间分割

python3 sy.py test.c -10000 9999 4
	
4.8
试图解决多源程序的cfg生成问题
1.stack信息提到需要特定的llvmgoldlinker链接生成单个.bc文件？不知道如何使他能使用
2.
generate all .ll files

`clang -S -emit-llvm *.c (-g)
link them into a single one

`llvm-link -S -v -o single.ll *.ll
(Optional) Optimise your code (maybe some alias analysis)

`opt -S -O3 -aa -basic-aa -tbaa -licm single.ll -o optimised.ll
Generate assembly (generates a optimised.s file)

`llc optimised.ll
Create executable (named a.out)

`clang optimised.s

通过方法2可以得到单个的.bc或者说.ll文件(阶段性胜利)
下一个问题是对于单个.bc（意味着会有多个函数）如何构造出单个的CFG图 
过程间的CFG图生成方式，虽然有过程间分析的理论基础，但是好像看不到合适的工具
方法上应该就是结合call graph和每个单个CFG，大不了自己写orz
引发的问题：作为唯一标识符的选择，需要和后面的afl工具（原gcov）给出的信息配合使用

4.10
应该尝试自己写
对afl的研究发现覆盖率数据仍然需要的是类gcov工具（afl-cov），似乎没有特别大的方便
可以利用gcov对多文件生成对应的覆盖率信息文件
暂时想法是将唯一标志符定位（filename，linenumber）
llvm自带的生成cfg和callgraph的有关命令为：
clang $1.c -emit-llvm -S
opt -dot-cfg $1.ll > /dev/null
opt -dot-callgraph $1.ll > /dev/null
dot -Tpng -o $1.png cfg.main.dot
rm cfg.main.dot
dot -Tpng -o $1.callgraph.png callgraph.dot
rm callgraph.dot

另：直接根据合成在一起的.ll文件做parse？

参考myllvm文件下的cfg.o的方式做遍历（X）

wpa PATH=/home/citceae/SVF/Release-build/bin:/home/citceae/SVF/llvm-10.0.0.obj/bin:/home/citceae/SVF/llvm-10.0.0.obj/bin:/home/citceae/SVF/llvm-10.0.0.obj/bin:
wpa和自带的callgraph都缺少行号信息

1.runonmodule方法！！！try
2.利用现有的runonfunction修改输出，记录图结构

4.13
runonmodule大成功！待细化
