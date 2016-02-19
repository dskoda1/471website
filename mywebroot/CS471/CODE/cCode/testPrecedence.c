#include <stdlib.h>
#include <string.h>

int fun (int a, int b){
  return a + b;
}

int main(void){
  int a =2;
  int x;

  /* Because of precedence "a++" is higher than, "++a" and */
  /* "++a" has higher precedence than "+" */
  /* These all calculate to the same value */

  x = ++a + a;
  printf("++a +a; x %d, a %d\n",x,a);

  a = 2;
  x = a + ++a;
  printf("a + ++a, x %d, a %d\n",x,a);

  a=2;
  x = ++a + a++;
  printf("++a + a++, x %d, z %d\n",x,a);

  a=2;
  x = a++ + ++a;
  printf("a++ + ++a: x %d, a %d\n\n",x,a);
  
  /* The order of evaluation of functions in C is not specified. */
  /* For GCC: */
  /*  fun(a,a++): x 5, a 3 */
  /* fun(a++,a): x 4, a 3 */
  
  a = 2;
  x = fun (a,a++);
  printf("fun(a,a++): x %d, a %d\n\n",x,a);

  a = 2;
  x = fun (a++,a);
  printf("fun(a++,a): x %d, a %d\n\n",x,a);
 }



