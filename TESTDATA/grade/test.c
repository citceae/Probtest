#include<stdio.h>
#include <stdlib.h>
void getgrade(int score){
    if(score>=90)
      return;
    else if(score >= 70)
      return;
    else if(score>=50)
      return;
    else if(score>=30)
      return;
    else if(score>=10)
      return;
    else return;
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

