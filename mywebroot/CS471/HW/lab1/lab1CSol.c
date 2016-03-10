#include <stdio.h>

  // char a1 = one ; // <<<
  int arr[10];
  long fr, nx; // <<<
  long a, l; // <<<
  int flag =0;

  int chg(char * f)  {
        if (f == 0) {  //<<<
       //    int x = 10;  //<<<
            arr[9] = 1; //<<<
        } else {
            arr[flag] = 1; //<<<
        }
       // x = ++flag ;  <<
        return flag;
  }
  int main (void){
      // char one ='1'; 
      int ARestrict = flag++ ; // <<<
      char * a = "abcd"; // <<<
      printf("Begin:: ");
      chg(a);
      if (ARestrict) return 0; else return 100; // <<<     
    }

