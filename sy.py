import os
import sys
import random
import bisect
import subprocess

#python3 sy.py funcname.c sup inf iteration (可以考虑加上一个myfunc即内部函数名区分于func.c) 或者将func.c放在另一个workdir避免与opt得到的.c文件重名
#loop until ? several times

def randinitcase(start, stop, length):
    start, stop = (int(start), int(stop)) if start <= stop else (int(stop), int(start))
    length = int(abs(length)) if length else 0
    random_list = []
    for i in range(length):
        random_list.append(random.randint(start, stop))
    return random_list
        
#TODO：seems unneccessary to add case to cases due to the redivide process        
def sampling(reward:list,partition:list,cases:list,allcases:list,k):
    idxes=[i for i in range(len(reward))]
    for i in range(k):
        idx = random.choices(idxes,weights=reward)[0]
        new_case = random.randint(partition[idx],partition[idx+1])
        cases[idx].append(new_case)
        allcases.append(new_case)
        

def divide_part(reward:list,partition:list):
    if len(reward) == 0 and len(partition) == 2:
        start = partition[0]
        stop = partition[1]
        mid = int((stop + start)/2)
        partition.append(mid)
        partition.sort()
    else:
        idx = reward.index(max(reward))
        start = partition[idx]
        stop = partition[idx+1]
        mid = int((stop + start)/2)
        partition.append(mid)
        partition.sort()

#redivide seems time consuming
def divide_cases(allcases:list, cases:list, partition:list):
    cases.clear()
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

#loop of cases
def loop_cases(reward:list,cases:list,funcname):
    reward.clear()
    for i in range(len(cases)): #case[i] is some testcases in a partition
        recpile(funcname)
        for case in cases[i]:
            cmdstr = "./test {inp}".format(inp = case)
            #print(cmdstr)
            os.system(cmdstr)
        cmdstr = "gcov {filename} --json && gunzip -f {filename}.gcov.json.gz && python3 jsonread.py \
            && make reward".format(filename = funcname)
        print(cmdstr)
        os.system(cmdstr)
        micmd = "./reward"
        res = subprocess.Popen(micmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, close_fds=True)
        mi = res.stdout.readlines()
        reward.append(float(str(mi[0],encoding='utf-8')))

if __name__ == '__main__':
    args = sys.argv
    if len(args) < 3:
        print('''error''')
        exit()

    one_sample_k = 10

    partition=[]
    partition.append(int(args[2]))
    partition.append(int(args[3]))

    iteration = int(args[4])

    #rand sample for k=200 times
    allcases = randinitcase(args[2],args[3],200) #all cases
    #print(allcases)

    #init
    reward = [] #reward of different partition
    cases = [[]]

    #choose a partition and divide cases into different partition (half)
    divide_part(reward,partition)
    #print(partition)
    divide_cases(allcases,cases,partition)

    mvgraph_gen(args[1])
    for i in range(iteration):
        loop_cases(reward,cases,args[1])
        print("iteration",i,' partition:',partition,' reward:',reward)
        sampling(reward,partition,cases,allcases,one_sample_k)
        divide_part(reward,partition)
        divide_cases(allcases,cases,partition)

    print(list(map(len,cases)))
        
        


    


    
    