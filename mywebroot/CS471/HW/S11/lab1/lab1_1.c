
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
/* ADD code for the recursive style implementation
int  gcdR(int i, int j) {
}
*/

