#include <stdio.h>

int main() {
	int a = 0, b = 0, c = 0, d = 0;
	printf("++a&&b++=%d\n",++a&&b++);
        printf("c++&&++d=%d\n",c++&&++d); 
	printf("++a&&b++ a=%d b=%d\n",a,b);	
	printf("c++&&++d c=%d d=%d\n",c,d);
	return 0;
}
