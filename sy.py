import os
import sys
import random
import bisect
import subprocess

#python3 sy.py funcname.c sup inf  (可以考虑加上一个myfunc即内部函数名区分于func.c) 或者将func.c放在另一个workdir避免与opt得到的.c文件重名
#loop until ? several times

def randinitcase(start, stop, length):
    start, stop = (int(start), int(stop)) if start <= stop else (int(stop), int(start))
    length = int(abs(length)) if length else 0
    random_list = []
    for i in range(length):
        random_list.append(random.randint(start, stop))
    return random_list
        

def dividepart(reward:list,partition:list):
    if len(reward) == 0 and len(partition) == 2:
        start = partition[0]
        stop = partition[1]
        mid = int((stop + start)/2)
        partition.append(mid)
        partition.sort()
    else:# TODO fix when reward is got
        return

def dividecases(allcases:list, cases:list, partition:list):
    for case in allcases:
        idx = bisect.bisect(partition,case)-1
        if idx < 0:
            print("idx error")
        while idx > len(cases)-1:
            cases.append([])
        cases[idx].append(case)
    

#also reset the count of gcov
def recpile(cmdarg):
    cmdstr = "gcc -fprofile-arcs -ftest-coverage {filename} -o test ".format(filename = cmdarg)
    print(cmdstr)
    os.system(cmdstr)

#generate {targetfunction}.c , which descripe CFG of the target function
def mvgraph_gen(cmdarg):
    cmdstr = "clang {filename} -emit-llvm -c -o test.bc -g && opt -load libMyCFGPass.so -MyCFG test.bc \
    && mv myfunc.c graph_gen.c".format(filename = cmdarg) #myfunc.c shoule be send to this function as a parameter?
    print(cmdstr)
    os.system(cmdstr)

if __name__ == '__main__':
    args = sys.argv
    if len(args) < 3:
        print('''error''')
        exit()

    partition=[]
    partition.append(int(args[2]))
    partition.append(int(args[3]))

    #rand sample for k=100 times
    allcases = randinitcase(args[2],args[3],200) #all cases
    #print(allcases)

    #init
    reward = [] #reward of different partition
    cases = [[]]

    #choose a partition and divide cases into different partition (half)
    dividepart(reward,partition)
    #print(partition)
    dividecases(allcases,cases,partition)

    mvgraph_gen(args[1])
    
    #loop of cases
    for i in range(len(cases)): #case[i] is some testcases in a partition
        recpile(args[1])
        for case in cases[i]:
            cmdstr = "./test {inp}".format(inp = case)
            #print(cmdstr)
            os.system(cmdstr)
        cmdstr = "gcov {filename} --json && gunzip -f {filename}.gcov.json.gz && python3 jsonread.py \
            && make reward".format(filename = args[1])
        print(cmdstr)
        os.system(cmdstr)
        micmd = "./reward"
        res = subprocess.Popen(micmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, close_fds=True)
        mi = res.stdout.readlines()
        reward.append(float(str(mi[0],encoding='utf-8')))
        print(reward)
        
        


    


    
    