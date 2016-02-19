#include <stdio.h>
/* example from Pointers On C
 */



main(){
  char* ptChr =0; 
  short* ptShort =0;
  long* ptLong =0;
  int i;
  printf("Test of Unit and pointer\n");
  printf("               Index Char Short  Long\n");
  for ( i =0; i < 6; i++) {
    printf("Offset of Pointers %d    %d    %2d    %2d\n",
	   i, ptChr+i, ptShort+i, ptLong+i);
  }
  

  printf("The End");
}
