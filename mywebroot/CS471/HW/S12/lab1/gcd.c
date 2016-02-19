#include <stdio.h>
/* Imperative style modification of example 1.20 p27  */

    int gcdI(int i, int j) {
       while ( i != j) { 
           if (i > j) {
              i = i - j;
           } else {
              j = j - i;
           }
       }      
       return i;
    }
    
/* Imperative using Mod (%) --exercise 1.4 p37  */
    int gcdM(int i, int j) {
       while ( i != j) { 
           if (i > j) {
              i = i % j;
           } else {
              j = j % i;
           }
        }
        return i;
    }

  
/* Functional style  */

int gcdF (int i, int j){
   if ( i != j) {
      if (i > j) {
        return gcdF(i-j, j); 
      } else {
        return gcdF(i,j-i);
      }
    } else {
      return i;
    }
    
 }
        
     
 
int main(void) { 
   int ans;
   printf("\n\n");
   ans = gcdI(56,14 );
   printf("gcdI of 56,14 is %d\n", ans);
   printf("\n");
   ans = gcdF(56,14);
   printf("gcdF of 56,14 is %d\n", ans);
   printf("\n");
   printf("\n\n");
   printf("\n");

   
   return 0;
}
