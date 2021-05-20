#include <stdlib.h>
#include <stdio.h>

void myfunc2(int x){
    if (x>=9900){
	    if(x>=9950){
	        if(x>=9990){
	    	    return;
	        }
	        else{
	            return;
	        }
	    }
	    else{
	        return;
	    }
    }
    else{
        return;
    }
}

int main(int argc, char* argv[]){
    int a,b;
    a = atoi(argv[1]);
    myfunc2(a);
    //printf("succeed\n");
    return 0;
}
