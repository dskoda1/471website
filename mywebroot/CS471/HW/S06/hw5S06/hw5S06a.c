/* Does (0.1 + x) * 10.0 equal 1.0 + ( x * 10.0) ?
     1) Compile the following code on an Intel platform twice as follows:
          gcc hw5S06a.c -o hw5S06a.exe
          gcc hw5S06a.c -o hw5S06b.exe -O
      2) Run both executables:
            ./hw5S06a.exe
      and
           ./hw5S06b.exe
     3)  Can you explain why the output is not the same.  You can use the
            -S option:
               gcc hw5S06a.c  -S 
               gcc hw5S06a.c -O -S
          or a debugger such as ddd or gdb 
       see:
           http://www.ferg.org/papers/ferg--debugger_introduction.html

       You might take this opportunity to create a Makefile to build
       the different executables.  You can use the Makefile supplied
       as an example.  You will need to put this code and your new
       Makefile in a different directory.

       If you have time try this same problem on the Sparc machines.
    
*/
  
#include <stdio.h>
float s;
float t;

float y;
float x;

float x10;
float y10;

void why() {
	y = 0.1;
	x = -9.999998e-02;
	printf("y = %e\n", y);
	printf("x = %e\n", x);
 
	t = (y + x)*10.0;

	x10 = (x* 10.0);
	y10 = (y * 10.0);
	s = x10+y10;

	printf("(x+y)*10 = %e\n", t);
	printf("(x*10) + (y*10) = %e\n\n", s);
}
int main(void) {
	why();
	return 0;
}
