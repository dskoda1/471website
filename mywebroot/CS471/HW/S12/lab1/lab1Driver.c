#include <stdio.h>
#include "lab1_1.h"
int main(void) { 
   int ans;
   printf("\n\n");
   ans = gcdI(56,14 );
   printf("gcdI of 56,14 is %d\n", ans);
   /* gcdMc is my correct version of gcdM 
   ans = gcdMc(56,14);
   printf("gcdM of 56,14 is %d\n", ans);
   printf("\n");
   */
  ans = gcdR(56,14);
   printf("gcdR of 56,14 is %d\n", ans);
   printf("\n");
   printf("\n\n");
 
   printf("\n");

  
   return 0;
}
