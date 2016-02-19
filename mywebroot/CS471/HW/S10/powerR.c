#include <stdio.h>		
/* 
   base to the nth power--
   
   gcc -S powerR.c -std=iso9899:1999
*/
long power(int n, int base) {
  if (0==n) {
    return 1;
  } else {
    return base * power(n-1, base);
  }
}


