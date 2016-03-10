/***************************************************************
 To compile --at prompt type:
   gcc -o hw5F05.exe -ansi hw5F05.c

   To run --at prompt type:
   ./hw6F01.exe

  This will work either on the Suns, Linux box, or cygwin gcc or mingw gcc
***************************************************************/

#include <stdlib.h>
#include <stdio.h>

float s;

void part1() {
  float sum=0;
  float one = 1.0F;
  int i;

  for (i=20, sum=0.0; i<=100; i++) {
    sum = sum + one/i;
  }
  printf ("\nPart 1A --increasing i's-- sum = %e\n", sum);
 
  for (i=100,sum=0.0; i>=20; i--) {
    sum = sum + one/i;   
  }
  printf ("Part 1A --decreasing i's-- sum = %e\n", sum);

  for (i=2000, sum=0.0; i<=10000000; i++) {
    sum = sum + one/i;
  }
  printf ("\nPart 1B--increasing i's -- sum = %e\n", sum);
 
  for (i=10000000,sum=0.0; i>=2000; i--) {
    sum = sum + one/i;   
  }
  printf ("Part 1B -- decreasing i's -- sum = %e\n", sum);

}/* End of part1() */

void part2() {
  float f = 0.1F;
  float sum = 0;
  int i;
  for (i=0; i<10;i++){
    sum = sum + f;
  }
  printf("\nPart 2 -- f is %e,  sum is %e\n",f,sum);
  printf("Part 2B?  sum == 1.0F IS false (%d)\n",sum==1.0F);
}

union {
  float f;
  int i;
} a, b, c, d, e;

float s;
float t;

void part3() {
  printf("\nPART 3: \n");
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
  printf("Part3 Line1: (a+b)*10 = %x(hex) (%e(dec))\n", d.i, d.f);

  s = a.f * (float) 10.0;
  t = b.f * (float) 10.0;
  e.f = s + t;  
  printf("Part3 Line2: (a*10) + (b*10) = %x(hex)(%e (dec))\n\n", e.i, e.f);
}


int main(void) { 
   part1(); 
   part2();
   part3();
   return 0;
}
