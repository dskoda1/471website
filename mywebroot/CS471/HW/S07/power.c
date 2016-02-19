#include <limits.h>
#include <stdio.h>		
/* 
   gcc -S power.c
   gcc -c power.c
*/

int  power() {
  int p;
  int n2p;
  int n;
  p = 3;
  n = 2;
  
  for (n2p=1;p > 0; p--) {
    n2p = n2p * n;
  }
  /**printf("\n n to the Power p is %d\n", n2p); **/
  return n2p;

}




