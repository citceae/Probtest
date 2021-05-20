#include <stdlib.h>
#include <stdio.h>

void myfunc(int x){
    if(x>0){
		if(x>9900){
			if(x>9950){
				if(x>9990){
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
			if(x<100){
				if(x<50){
					if(x<10){
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
	}
	else{
		if(x<-9900){
			if(x<-9950){
				if(x<-9990){
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
			if(x>-100){
				if(x>-50){
					if(x>-10){
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
	}
}

int main(int argc, char* argv[]){
    int a,b;
    a = atoi(argv[1]);
    myfunc(a);
    return 0;
}
