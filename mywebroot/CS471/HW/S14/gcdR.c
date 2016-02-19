#include <stdio.h>

/* 
gcd of A B
         is A if B = 0
         is gcd B (mod A B)
*/
int gcdR (int i, int j){
   if (j==0){
      return i;
   } else {
      return gcdR( j, i%j);
   }
}

    
        
