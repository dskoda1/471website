#include <stdlib.h>
#include <stdio.h>

void pass (int *p);

int main () {
	int i = 5;
	int *j;
	j = &i;
	pass(j);
	printf("after, j = %d\n", *j);
	return 0;
}

void pass (int *pt) {
	int k = 6;
	pt = &k;
	printf("p = %d\n", *p);
}
