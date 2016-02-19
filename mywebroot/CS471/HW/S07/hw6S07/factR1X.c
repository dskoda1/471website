#include <stdio.h>

int fun(int n);
int fact (int n) {
  int temp =1;
  if (0 < n) {
   temp = n * fact(n-1);
  } 
  return temp;
}


int main () {
  int f;
  f=fact(4);
  fun(f);
  return 0;
}
