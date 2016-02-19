/*  gcc -std=c99 hw7.c -o hw7.exe */
#include <stdio.h>

void loop() {
  int x[512];  
  int i=0;   
  while (i++ <512) {
    x[i] = 0;
  }
}


int main () {

  printf("\nCalling loop  -->>\n");
  loop();
  
}

