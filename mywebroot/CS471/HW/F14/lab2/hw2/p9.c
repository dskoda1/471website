/***************************************************************
 To compile --at prompt type:
   gcc -o hw2p9.exe -std=iso9899:1999 p9.c

   To run --at prompt type:
   ./hw2p9.exe

  This will work either on the Suns, Linux box, or cygwin gcc or mingw gcc
***************************************************************/

#include <stdlib.h>
#include <stdio.h>

float s;

void part1() {
  float sum=0;
  float one = 1.0F;
  int i;

  for (i=20, sum=0.0; i<=800; i++) {
    sum = sum + one/i;
  }
  printf ("\nPart 1A --increasing i's-- sum = %e\n", sum);
 
  for (i=800,sum=0.0; i>=20; i--) {
    sum = sum + one/i;   
  }
  printf ("Part 1A --decreasing i's-- sum = %e\n", sum);
  
  

  for (i=20, sum=0.0; i<=900; i++) {
    sum = sum + one/i;
  }
  printf ("\nPart 1B--increasing i's -- sum = %e\n", sum);
 
  for (i=900,sum=0.0; i>=20; i--) {
    sum = sum + one/i;   
  }
  printf ("Part 1B -- decreasing i's -- sum = %e\n", sum);
  printf("Why are the values the same in part 1a and different in part 2b?\n");

}/* End of part1() */

void part2() {
  float f = 0.1F;
  float sum = 0.0;
  int i;
  for (i=0; i<10;i++){
    sum = sum + f;
  }
  printf("\nPart 2 -- f is %e, 10*f = sum is %e\n",f,sum);
  printf("Part 2B?  sum == 1.0F IS false (%d)\n",sum==1.0F);
  printf("Since adding 0.1, 10 times is 1.0, why do we get False above?\n");
}




int main(void) { 
   part1(); 
   part2();
   return 0;
}
