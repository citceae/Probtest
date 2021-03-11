#include <stdlib.h>
#include <stdio.h>

void myfunc(int x){
    if (x>=9900){
    	    x=x;
    	    x=x;
    	    x=x;
	    if(x>=9950){
	        x=x;
	        x=x;
	        x=x;
	        if(x>=9990){
	            x=x;
	            x=x;
	            x=x;
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
    int a;
    a = atoi(argv[1]);
    myfunc(a);
    //printf("succeed\n");
    return 0;
}
