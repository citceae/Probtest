import random
import string
 
num = 0
while num < 100:
    word = random.randint(-10000,9999)
    txt=str(word)+'\n'
    num +=1
    with open("input.txt","a") as f:
        f.write(txt)
print(num)
