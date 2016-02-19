#include <stdio.h>
 int xy; char c ; float rr;
 float arr[10];
 float new = 10.99;
 int _Bool = 0;
 int chg(int  flag)  {
     if (flag == 0) {
         xy = 33;   
         arr[10] = 10.9;
     } else {
          arr[10] = 1;
     }
     return flag;
 }
 int main (void){ 
     int sizeofA = 8;
     printf("Begin:: ");
     sizeofA = chg(xy);
     return 0;                                                                 
  }
