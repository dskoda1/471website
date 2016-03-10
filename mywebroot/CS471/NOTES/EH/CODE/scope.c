#include <stdio.h>	
int z = 5;
void scope (void) {
	printf("\nz =%d",z);
	int u = z;
	printf("\nz =%d",z);
	float z = 5.5f;
	printf("\nz =%f",z);
	printf("\nu =%d\n \n",u);
}

	
int  main() {
     scope();
     return 1;

}
