#include <stdio.h>

int fact (int n) {
  if (0==n) {
    return 1;
  } else {
    return n * fact(n-1);
  } 

}
int main () {
  int f;
  f=fact(4);
  printf(" fact is  %d\n",f);
  return 0;
}
