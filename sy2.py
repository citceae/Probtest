import os
import sys
import random
import bisect
import copy
import subprocess
import jsonread as jread
from functools import reduce

#isinstance(o, t)可以判断类型
class Partition:
    def __init__(self, partition = [[]]):
        self.partition = partition  
    def fdivide(self):
        assert(len(self.partition) == 1)
        idx1 = 0
        to_divide_part = self.partition.pop(idx1)
        copy_part = copy.deepcopy(to_divide_part)
        to_varilen = len(to_divide_part)
        idx2 = random.randint(0,to_varilen-1)
        to_divide_part_x = to_divide_part.pop(idx2)
        assert(len(to_divide_part_x) == 2)

        mid = int((to_divide_part_x[0] + to_divide_part_x[1])/2)
        divided_part_x1 = [to_divide_part_x[0],mid]
        divided_part_x2 = [mid, to_divide_part_x[1]]

        to_divide_part.insert(idx2,divided_part_x2)
        self.partition.insert(idx1,to_divide_part)
        
        copy_part.pop(idx2)
        copy_part.insert(idx2,divided_part_x1)
        self.partition.insert(idx1,copy_part)

    def divide(self,reward:list,cases:list):#divide partitions and cases
        assert(reward)
        idx1 = reward.index(max(reward))
        to_divide_part = self.partition.pop(idx1)
        copy_part = copy.deepcopy(to_divide_part)
        to_varilen = len(to_divide_part)
        idx2 = random.randint(0,to_varilen-1)
        to_divide_part_x = to_divide_part.pop(idx2)
        assert(len(to_divide_part_x) == 2)

        mid = int((to_divide_part_x[0] + to_divide_part_x[1])/2)
        divided_part_x1 = [to_divide_part_x[0],mid]
        divided_part_x2 = [mid, to_divide_part_x[1]]

        to_divide_part.insert(idx2,divided_part_x2)
        self.partition.insert(idx1,to_divide_part)
        
        copy_part.pop(idx2)
        copy_part.insert(idx2,divided_part_x1)
        self.partition.insert(idx1,copy_part)

        #divide cases
        to_divide_cases = cases.pop(idx1) #will it be empty?
        case1 = []
        case2 = []
        for case in to_divide_cases:
            if(case[idx2] < mid):
                case1.append(case)
            else:
                case2.append(case)
        cases.insert(idx1,case2)
        cases.insert(idx1,case1)
    
    def prob_divide(self,reward:list,cases:list):#prob divide按照概率加权进行分割，会变好吗
        assert(reward)
        idxes=[i for i in range(len(reward))]
        idx1 = random.choices(idxes,weights=reward)[0]
        beidx = reward.index(max(reward))
        if idx1 != beidx:
            print("-----------------------------------------")
        to_divide_part = self.partition.pop(idx1)
        copy_part = copy.deepcopy(to_divide_part)
        to_varilen = len(to_divide_part)
        idx2 = random.randint(0,to_varilen-1)
        to_divide_part_x = to_divide_part.pop(idx2)
        assert(len(to_divide_part_x) == 2)

        mid = int((to_divide_part_x[0] + to_divide_part_x[1])/2)
        divided_part_x1 = [to_divide_part_x[0],mid]
        divided_part_x2 = [mid, to_divide_part_x[1]]

        to_divide_part.insert(idx2,divided_part_x2)
        self.partition.insert(idx1,to_divide_part)
        
        copy_part.pop(idx2)
        copy_part.insert(idx2,divided_part_x1)
        self.partition.insert(idx1,copy_part)

        #divide cases
        to_divide_cases = cases.pop(idx1) #will it be empty?
        case1 = []
        case2 = []
        for case in to_divide_cases:
            if(case[idx2] < mid):
                case1.append(case)
            else:
                case2.append(case)
        cases.insert(idx1,case2)
        cases.insert(idx1,case1)

    def fsampling(self,cases:list,K):
        assert(len(self.partition)==2)
        assert(len(cases)==2)
        for i in range(K):
            idx = random.randint(0, 1)
            selected_part = self.partition[idx]
            vari_num = len(selected_part)
            new_case = []
            for i in range(vari_num):#random sample non-int?
                start = selected_part[i][0]
                stop = selected_part[i][1]
                new_case.append(random.randint(start, stop))
            cases[idx].append(new_case)

    def sampling(self,reward:list,cases:list,k):
        idxes=[i for i in range(len(reward))]
        for i in range(k):
            idx = random.choices(idxes,weights=reward)[0]
            selected_part = self.partition[idx]
            vari_num = len(selected_part)
            new_case = []
            for i in range(vari_num):                               #random sample non-int?
                start = selected_part[i][0]
                stop = selected_part[i][1]
                new_case.append(random.randint(start, stop))
            cases[idx].append(new_case)
    
    def dsampling(self,reward:list,cases:list,k): #delete all used case
        for i in range(len(cases)):
            cases[i].clear()
        idxes=[i for i in range(len(reward))]
        for i in range(k):
            idx = random.choices(idxes,weights=reward)[0]
            selected_part = self.partition[idx]
            vari_num = len(selected_part)
            new_case = []
            for i in range(vari_num):                               #random sample non-int?
                start = selected_part[i][0]
                stop = selected_part[i][1]
                new_case.append(random.randint(start, stop))
            cases[idx].append(new_case)

    def printp(self):
        print(self.partition)

def puresampleite(vari,allcases_random,one_sample_k,iteration):
    ite = (iteration+1)*(iteration)/2
    for i in range(one_sample_k*(int)(ite)):
        new_case = []
        for j in range(len(vari)):
            start = vari[j][0]
            stop = vari[j][1]
            new_case.append(random.randint(start, stop))
        allcases_random.append(new_case)

def puresample(vari,allcases_random,one_sample_k,iteration):
    for i in range(one_sample_k*iteration):
        new_case = []
        for j in range(len(vari)):
            start = vari[j][0]
            stop = vari[j][1]
            new_case.append(random.randint(start, stop))
        allcases_random.append(new_case)

def utf8open(filename):
    return open(filename, encoding='utf-8', errors='ignore')

def mvgraph_gen(workpath):
    cmdstr = f"cd {workpath} && make test && make single.ll && opt -load ../../libMulCFGPass.so -MulCFG single.ll"
    os.system(cmdstr)
    cmdstr = f"mv {workpath}/single.ll.c graph_gen.c"
    os.system(cmdstr)

def gcov_zero(workpath):
    cmdstr = f"cd {workpath} && make zero"
    os.system(cmdstr)

def loop_cases(workpath,cases,filenames,reached,reward):
    gcov_zero(workpath)
    #loopall
    allcases = reduce(lambda x,y:x+y,cases)
    #print(allcases)
    for case in allcases:
        cmdstr = f" {workpath}/test"
        for x in case:
            cmdstr = cmdstr + ' ' + str(x)
        os.system(cmdstr)
    for filename in filenames:
        cmdstr = f"cd {workpath} && gcov {filename} --json && gunzip -f {filename}.gcov.json.gz "
        os.system(cmdstr)
        jread.readall(workpath,filename, reached)

    reward.clear()
    for i in range(len(cases)): #case[i] is some testcases in a partition
        gcov_zero(workpath)
        for case in cases[i]:
            cmdstr = f" {workpath}/test"
            for x in case:
                cmdstr = cmdstr + ' ' + str(x)
            os.system(cmdstr)
        outfile = ""
        for filename in filenames:
            cmdstr = f"cd {workpath} && gcov {filename} --json && gunzip -f {filename}.gcov.json.gz "
            os.system(cmdstr)
            outfile = jread.readjson(workpath,outfile,filename)
        jread.prtout(outfile, reached)
        cmdstr = "make reward"
        os.system(cmdstr)
        micmd = "./reward"
        res = subprocess.Popen(micmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, close_fds=True)
        mi = res.stdout.readlines()
        reward.append(float(str(mi[0],encoding='utf-8')))

def initreport(workpath,cases):
    gcov_zero(workpath)
    for case in cases:
        cmdstr = f" {workpath}/test"
        for x in case:
            cmdstr = cmdstr + ' ' + str(x)
        os.system(cmdstr)
    cmdstr = f"cd {workpath} && gcovr -r ."
    os.system(cmdstr)

def report(workpath,allcases_random,allcases_prob):
    gcov_zero(workpath)
    for case in allcases_random:
        cmdstr = f" {workpath}/test"
        for x in case:
            cmdstr = cmdstr + ' ' + str(x)
        os.system(cmdstr)
    cmdstr = f"cd {workpath} && gcovr -r ."
    os.system(cmdstr)

    gcov_zero(workpath)
    for case in allcases_prob:
        cmdstr = f" {workpath}/test"
        for x in case:
            cmdstr = cmdstr + ' ' + str(x)
        os.system(cmdstr)
    cmdstr = f"cd {workpath} && gcovr -r ."
    os.system(cmdstr)

#python3 sy2.py testexam
if __name__ == '__main__':
    args = sys.argv
    workpath = "./TESTDATA/"+args[1]

    inputpath = os.path.abspath(f'./TESTDATA/{args[1]}/input.txt')
    lines = utf8open(inputpath).readlines()

    vari_num = len(lines)
    vari=[]#vari = [[-10000,9999],[-10000,9999]]
    for i in range(len(lines)):
        if i == 0:
            filenames = lines[i].strip().split(' ')#input filenames
        else:
            splits = list(map(int,lines[i].split(' ')))
            vari.append(splits)
    assert(filenames)

    cases = [[],[]]
    reward = []
    reached = []
    K = 2
    one_sample_k = 1
    iteration = 3

    part = Partition([vari])   
    part.fdivide()
    part.fsampling(cases, K)

    #random
    allcases_random = reduce(lambda x,y:x+y,cases)
    #print(allcases_random)
    initreport(workpath, allcases_random)

    puresampleite(vari, allcases_random, one_sample_k, iteration)
    #puresample(vari, allcases_random, one_sample_k, iteration)

    mvgraph_gen(workpath)
    #cmdarg = f"cd {workpath} && make test "
    #os.system(cmdarg)
    
    for i in range(iteration):
        loop_cases(workpath, cases,filenames,reached,reward)
        print("iteration",i,' partition:',part.partition,' reward:',reward)
        print(list(map(len,cases)))
        print(reached)
        part.sampling(reward, cases, one_sample_k*(i+1))#增加单轮采样？
        #part.sampling(reward, cases, one_sample_k)#不增加单轮采样？
        #part.dsampling(reward,cases,one_sample_k*(i+1))
        part.prob_divide(reward, cases)
        if reward[0] == 0:
            break;

    allcases_prob = reduce(lambda x,y:x+y,cases)
    report(workpath, allcases_random, allcases_prob)

    print(len(allcases_random))
    print(len(allcases_prob))
    print(reached)
    part.printp()
    print(reward)
    