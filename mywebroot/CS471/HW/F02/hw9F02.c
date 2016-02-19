#include <stdio.h>

int f(int u, int v) {
   if (v > 0) return 5*u + 3*v;
   return u;
}

int main() {
   int j = 0;
   int k = 0;
   printf("j++ gives: %d\n",j++);
   j = 0; 
   j = j++; 
   printf("value of j after j = j++ is: %d\n",j);
   j = 0; 
   printf("++j gives: %d\n",++j);
   j = 0; 
   j = ++j; 
   printf("value of j after j = ++j is: %d\n",j);
   j = 0; 
   printf("j++ + j++ gives: %d\n",j++ + j++);
   j = 0; 
   j = j++  +  j++;
   printf("value of j after j = j++ + j++ is: %d\n",j);
   j = 0; 
   printf("++j + ++j gives: %d\n",++j + ++j);
   j = 0; 
   j = ++j  +  ++j;
   printf("value of j after j = ++j + ++j is: %d\n",j);
   j = 0; 
   printf("j++ + ++j gives: %d\n",j++ + ++j);
   j = 0; 
   j = j++  +  ++j;
   printf("value of j after j = j++ + ++j is: %d\n",j);
   j = 0; 
   printf("++j + j++ gives: %d\n",++j + j++);
   j = 0; 
   j = ++j  +  j++;
   printf("value of j after j = ++j + j++ is: %d\n",j);
   k = 0;
   printf("value of f(++k, ++k) is: %d (k = %d)\n", f(++k, ++k), k);
   k = 0;
   k = f(++k, ++k);
   printf("value of k after k = f(++k, ++k) is: %d\n",k);   
   k = 0;
   printf("value of f(k++, k++) is: %d (k = %d)\n", f(k++, k++), k);
   k = 0;
   k = f(k++, k++);
   printf("value of k after k = f(k++, k++) is: %d\n",k);   
   k = 0;
   printf("value of f(k++, ++k) is: %d (k = %d)\n", f(k++, ++k), k);
   k = 0;
   k = f(k++, ++k);
   printf("value of k after k = f(k++, ++k) is: %d\n",k);   
   k = 0;
   printf("value of f(++k, k++) is: %d (k = %d)\n", f(++k, k++), k);
   k = 0;
   k = f(++k, k++);
   printf("value of k after k = f(++k, k++) is: %d\n",k);   
   k = 0;
   printf("For k = %d, value of f(++k, k++) is: %d \n", k, f(++k, k++));
}



