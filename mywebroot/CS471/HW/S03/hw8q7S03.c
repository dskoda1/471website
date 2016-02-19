#include <stdio.h>


int main() {
  int *p;
  int x = 5;
  int a,b,c;
  p = &x;
  printf("p = %d, x = %d\n",p,x);
  a = *p;
  printf("p = %d,*p = %d,  a = %d\n",p,*p,a);
  b = (int)&p;
  printf("p = %d, &p = %d,  b = %d\n",p,&p,b);
  c =(int) p;
  printf("p = %d,  c = %d\n",p,c);
  return 0;
}



  
