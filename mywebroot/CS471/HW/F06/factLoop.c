#include <limits.h>
#include <stdio.h>		
/*
   gcc -S factLoop.c
*/

int  main() {
  int fact;
  fact = 1;
  int n;
  n = 4;
  for (;n> 0; n--) {
    fact = fact * n;
  }
  /** printf("factoroal  is %d", fact); **/
  return 0;

}




