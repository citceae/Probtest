#include<stdio.h>
#include <stdlib.h>
void getgrade(int score){
    int x;
    if(score>=9000)
      x=1;
    else if(score >= 8000)
      x=2;
    else if(score>=7000)
      x=3;
    else if(score>=6000)
      x=4;
    else if(score>=5000)
      x=5;
    else x=6;
    return;
}
int main(int argc, char* argv[])
{
    int score;
    //printf("Enter score: ");
    score = atoi(argv[1]);
    getgrade(score);
    /*if (score > 0)
      score = score + 1;
    else
      score = score - 1;*/
    return 0;
}

//似乎和模型不太适合，进一步原因待思考

