 #include<stdio.h>
 #include <stdlib.h>
 int main(int argc, char* argv[])
 {
   int mark1, mark2, mark3, total;
   float avg;

   //printf("Enter marks of three subjects: ");
   //scanf("%d %d %d",&mark1, &mark2, &mark3);
   mark1 = atoi(argv[1]);
   mark2 = atoi(argv[2]);
   mark3 = atoi(argv[3]);
   int a=0;
   if(mark1>=35 && mark2>=35 && mark3>=35)
   {
     total = mark1 + mark2 + mark3;
     avg = total/3;

     //printf("Total marks = %d\n",total);
     //printf("Average mark = %.2f\n", avg);
     a++;

     if(avg>=60)
     {
       //printf("Result is first class.");
       a++;
     }
     else
     {
       //printf("Result is second class.");
       a++;
     }
   }
   else
   {
     //printf("Result is fail");
     a++;
   }

   return 0;
 }