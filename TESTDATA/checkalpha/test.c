#include<stdio.h>
#include <stdlib.h>
void checkalpha(int ch){
    if(ch >=97){
        if(ch <= 122)
            printf("Lower case character.");
        return ;
    }
    else if(ch >=65){
        if(ch <= 90)
            printf("Upper case character.");
        return ;
    }   
    else if(ch >=48 ){
        if(ch <= 57)
            printf("Digit");
        return ;
    }   
    else{
        printf("Special character.");
        return ;
    }
}
int main(int argc, char* argv[]){
    int ch;

    //printf("Enter a character: ");
    //scanf("%c",&ch);
    ch = atoi(argv[1]);

    checkalpha(ch);

    return 0;
 }