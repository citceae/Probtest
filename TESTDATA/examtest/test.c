#include <stdlib.h>
#include <stdio.h>

void myfunc(int x,int y){
    if (x>=9900){
    	    if(x<y)
    	        return;
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
    b = atoi(argv[2]);
    myfunc(a,b);
    //printf("succeed\n");
    return 0;
}
