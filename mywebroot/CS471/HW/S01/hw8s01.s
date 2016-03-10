	.file	"hw8s01.c"
gcc2_compiled.:
.section	".text"
	.align 4
	.global loop
	.type	 loop,#function
	.proc	04
loop:
	!#PROLOGUE# 0
	save	%sp, -2168, %sp
	!#PROLOGUE# 1
	st	%g0, [%fp-2068]
.LL3:
	add	%fp, -2068, %o0
	ld	[%o0], %o1
	mov	%o1, %o2
	add	%o1, 1, %o1
	st	%o1, [%o0]
	cmp	%o2, 511
	ble	.LL5
	nop
	b	.LL4
	 nop
.LL5:
	ld	[%fp-2068], %o0
	mov	%o0, %o1
	sll	%o1, 2, %o0
	add	%fp, -2064, %o1
	st	%g0, [%o1+%o0]
	b	.LL3
	 nop
.LL4:
.LL2:
	ret
	restore
.LLfe1:
	.size	 loop,.LLfe1-loop
.section	".rodata"
	.align 8
.LLC0:
	.asciz	"\nCalling loop  -->>\n"
.section	".text"
	.align 4
	.global main
	.type	 main,#function
	.proc	04
main:
	!#PROLOGUE# 0
	save	%sp, -112, %sp
	!#PROLOGUE# 1
	sethi	%hi(.LLC0), %o1
	or	%o1, %lo(.LLC0), %o0
	call	printf, 0
	 nop
	call	loop, 0
	 nop
.LL6:
	ret
	restore
.LLfe2:
	.size	 main,.LLfe2-main
	.ident	"GCC: (GNU) 2.95.2 19991024 (release)"
