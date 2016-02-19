	.file	"fact.c"
gcc2_compiled.:
	.global .umul
.section	".text"
	.align 4
	.global fact
	.type	 fact,#function
	.proc	04
fact:
	!#PROLOGUE# 0
	save	%sp, -120, %sp
	!#PROLOGUE# 1
	sethi	%hi(n), %o1
	or	%o1, %lo(n), %o0
	ld	[%o0], %o1
	cmp	%o1, 1
	ble	.LL3
	nop
	sethi	%hi(n), %o1
	or	%o1, %lo(n), %o0
	ld	[%o0], %o1
	st	%o1, [%fp-20]
	add	%o1, -1, %o1
	st	%o1, [%o0]
	call	fact, 0
	 nop
	mov	%o0, %o1
	mov	%o1, %o0
	ld	[%fp-20], %o1
	call	.umul, 0
	 nop
	mov	%o0, %i0
	b	.LL2
	 nop
	b	.LL4
	 nop
.LL3:
	mov	1, %i0
	b	.LL2
	 nop
.LL4:
.LL2:
	ret
	restore
.LLfe1:
	.size	 fact,.LLfe1-fact
	.align 4
	.global main
	.type	 main,#function
	.proc	04
main:
	!#PROLOGUE# 0
	save	%sp, -112, %sp
	!#PROLOGUE# 1
	sethi	%hi(n), %o1
	or	%o1, %lo(n), %o0
	mov	3, %o1
	st	%o1, [%o0]
	sethi	%hi(n), %o1
	or	%o1, %lo(n), %o0
	ld	[%o0], %o1
	cmp	%o1, 0
	ble	.LL6
	nop
	call	fact, 0
	 nop
.LL6:
.LL5:
	ret
	restore
.LLfe2:
	.size	 main,.LLfe2-main
	.common	n,4,4
	.ident	"GCC: (GNU) 2.95.2 19991024 (release)"
