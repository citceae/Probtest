#include<stdio.h>

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

int main(){
    int a;
    //input range setting: [-10000,9999]
    freopen("input.txt","r",stdin);
    //while scanf
    while(scanf("%d",&a)!=EOF){
    	if(a<0)
            myfunc2(a);
    }
    printf("succeed\n");
    return 0;
}
