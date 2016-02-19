#include <stdio.h>
/* example from Pointers On C
 */
/*
 * A function that works on some machines despite a major error.
 * This compiled and run using gcc
 * gcc returnErr.c -o testErr.exe
 */
int erroneous (int a, int b){
  int x;
  /*
  ** compute the answer and return it
  */
  x = a + b;
  printf("In erroneous - x is %d \n",x);
  return  ;
}

main(){
  printf("Test of bad code\n");
  printf("In main the return value is %d \n",erroneous(2,5));
}
