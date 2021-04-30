import os
import sys
import random
import bisect
import copy
import subprocess

#isinstance(o, t)可以判断类型
class Partition:
    def __init__(self, partition = [[]], reward=[]):
        self.partition = partition
        self.reward = reward
    def divide(self):
        assert(self.reward)
        idx1 = self.reward.index(max(self.reward))
        to_divide_part = self.partition.pop(idx1)
        copy_part = copy.deepcopy(to_divide_part)
        to_varilen = len(to_divide_part)
        idx2 = random.randint(0,to_varilen-1)
        to_divide_part_x = to_divide_part.pop(idx2)
        assert(len(to_divide_part_x) == 2)

        mid = int((to_divide_part_x[0] + to_divide_part_x[1])/2)
        divided_part_x1 = [to_divide_part_x[0],mid]
        divided_part_x2 = [mid, to_divide_part_x[1]]
        to_divide_part.insert(idx2,divided_part_x1)
        self.partition.insert(idx1,to_divide_part)
        
        copy_part.pop(idx2)
        copy_part.insert(idx2,divided_part_x2)
        self.partition.insert(idx1,copy_part)
    def printp(self):
        print(self.partition)



    

a = [[[1,99],[2,100]],[[-9,100],[1,99]]]
reward = [1,2]
part = Partition(a,reward)
x = part.partition
print(x)
part.divide()
part.printp()
print(x)
x.append(1)
print(x)
part.printp()