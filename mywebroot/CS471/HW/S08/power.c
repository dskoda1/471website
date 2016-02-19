#include <limits.h>		
/* 
   gcc -S power.c
   gcc -c power.c
*/

int n = 3;

int  power() {
  int p;
  int acc; 
  for (acc=1,p=5;p > 0; p--) {
    acc = acc * n;
  }
  /**printf("\n 2 to the Power 3 is %d\n", acc); **/
  return acc;
}



