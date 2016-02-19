/* Use gcc -S hw7F03.c  */

int loop() {
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

