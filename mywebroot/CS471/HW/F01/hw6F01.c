/* To compile --at prompt type:
   gcc -o hw6F01.exe -ansi hw6F01.c

   To run --at prompt type:
   ./hw6F01.exe

This will work either on the Suns, Linux box, or cygwin gcc

*/

#include <stdlib.h>

float s;

void part1() {
  float sum=0;
  float one = 1.0F;
  int i;

  for (i=2000, sum=0.0; i<=100000; i++) {
    sum = sum + one/i;
    
  }
  printf ("Part 1A-- sum = %e\n", sum);
 
  for (i=100000,sum=0.0; i>=2000; i--) {
    sum = sum + one/i;
   
  }
  printf ("Part 1B -- sum = %e\n", sum);
}

void part2() {
  float f = 0.1F;
  float sum = 0;
  int i;
  for (i=0; i<10;i++){
    sum = sum + f;
  }
  printf("Part 2 -- f is %e,  sum is %e\n",f,sum);
  printf("Part 2B?  sum == 1.0F IS false (%d)\n",sum==1.0F);
}
int main(void) { 
   part1(); 
   part2();
 
}
