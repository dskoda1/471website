/* 
   gcc -S numdigits.c
   gcc -c numdigits.c
*/

int  numdigits(int i) {
  int t=i, n = 1;
  while ( t>=10) {
    n++;
    t = t/10;
  }
  return n;
}
