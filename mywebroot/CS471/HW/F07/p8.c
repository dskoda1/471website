/***************************************************************
 To compile --at prompt type:
   gcc -o hw.exe -ansi p8.c

   To run --at prompt type:
   ./p8.exe

  This will work on the Suns, Linux box, mac  or cygwin gcc
***************************************************************/

#include <stdlib.h>
#include <stdio.h>

# Do you understand what a union is?
# Do you understand why I am using a union?
# Have you tried this on a Sun?

union {
  float f;
  int i;
} a, b, c, d, e;


float s;
float t;

void test() {
  printf("\nPART a*10 + b*10 ??? \n");
  a.f = 0.1;
/* Can you figure out what float number the encoding of b.i represents?*/
  b.i = 0xbdcccccc;  
  printf("a = %x(hex) %e(dec)\n", a.i, a.f);
  printf("b = %x(hex) %e(dec)\n", b.i, b.f);

  c.f = (float) (a.f + b.f);
  printf("a + b = %x(hex) %e\n", c.i, c.f);

  d.f = (float) (a.f * (float) 10.0);
  e.f = (float) (b.f * (float) 10.0);
  printf("a*10 = %x(hex) %e(dec)\n", d.i, d.f);
  printf("b*10 = %x(hex) %e(dec)\n", e.i, e.f);

  t = a.f + b.f;
  d.f = t * (float) 10.0;  
  printf("OUTPUT Line1: (a+b)*10 = %x(hex) (%e(dec))\n", d.i, d.f);

  s = a.f * (float) 10.0;
  t = b.f * (float) 10.0;
  e.f = s + t;  
  printf("OUTPUT Line2: (a*10) + (b*10) = %x(hex)(%e (dec))\n\n", e.i, e.f);
}


int main(void) { 
   test();
   return 0;
}
