#include <stdio.h>		
/* 
   2 to the nth power--
   
   gcc -S power2.c -std=iso9899:1999
*/
int power2(int n) {
  if (0==n) {
    return 1;
  } else {
    return 3 * power2(n-1);
  }
}

int value;
int test(void) {
   const int nth = 13;
   value = power2(nth);
 /*  printf("2 to the %dth is %d\n", nth, value); */
   return 0;
}
   
