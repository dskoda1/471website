#include <stdio.h>
 int xy; float rr;
 float arr[11];
 float rbr = 10.99;
 int chg(int  flag)  {
     float x;
     if (flag == 0) {
         x = 10.99;   
         arr[10] = 10.9;
     } else {
          arr[10] = 1.9;
     }
     return flag;
 }
 int main (void){ 
     int signofx = 8;
     printf("Begin:: ");
     signofx = chg(xy);
     return 0;                                                                 
  }
  

