#include <stdio.h>  
int a[10];
int j;
int& f(int i) { return (a[i]); }

void main () {
  for(j = 0; j < 10; j++) a[j] = 1; 
  f(5) = 17;
  for(j = 0; j < 10; j++) printf("%d\n", a[j]);
}

bingsun2% g++ littleex.c
bingsun2% a.out
1
1
1
1
1
17
1
1
1
1

