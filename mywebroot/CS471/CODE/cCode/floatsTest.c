#include <stdio.h>
		
union {
	volatile float f;
	volatile int i;
} a, b, c, d, e;

volatile float s;
volatile float t;

void test() {
	a.f = 0.1;
	b.i = 0xbdcccccc;
	printf("a = %x %e\n", a.i, a.f);
	printf("b = %x %e\n", b.i, b.f);
	c.f = (float) (a.f + b.f);
	printf("a + b = %x %e\n", c.i, c.f);
	d.f = (float) (a.f * (float) 10.0);
	e.f = (float) (b.f * (float) 10.0);
	printf("a*10 = %x %e\n", d.i, d.f);
	printf("b*10 = %x %e\n", e.i, e.f);
	t = a.f + b.f;
	d.f = t * (float) 10.0;
	/*
	d.f = (float) (a.f + b.f) * (float) 10.0;
	*/
	printf("(a+b)*10 = %x %e\n", d.i, d.f);
	s = a.f * (float) 10.0;
	t = b.f * (float) 10.0;
	e.f = s + t;
	/*
	e.f = (float) (a.f * (float) 10.0) + (float) (b.f * (float) 10.0);
	*/
	printf("(a*10) + (b*10) = %x %e\n\n", e.i, e.f);
}
int main(void) {
	test();
	return 0;
}
