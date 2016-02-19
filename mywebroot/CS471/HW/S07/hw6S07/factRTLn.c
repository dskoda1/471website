#include <stdio.h>

int fun(int n);
int fact (int n, int acc) {

  return n==0?acc:fact(n-1, n*acc);
}


int main () {
  int f;
  f=fact(4,1);
  fun(f);
  return 0;
}
