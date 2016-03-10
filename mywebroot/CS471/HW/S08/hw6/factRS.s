	.file	"factR.c"
	.global .umul
	.section	".text"
	.align 4
	.global fact
	.type	fact, #function
	.proc	04
fact:
	save	%sp, -120, %sp
	st	%i0, [%fp+68]
	ld	[%fp+68], %g1
	cmp	%g1, 0
	bne	.LL2
	 nop
	mov	1, %g1
	st	%g1, [%fp-20]
	b	.LL4
	 nop
.LL2:
	ld	[%fp+68], %g1
	add	%g1, -1, %g1
	mov	%g1, %o0
	call	fact, 0
	 nop
	mov	%o0, %g1
	mov	%g1, %o0
	ld	[%fp+68], %o1
	call	.umul, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-20]
.LL4:
	ld	[%fp-20], %g1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.size	fact, .-fact
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -120, %sp
	mov	4, %o0
	call	fact, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp-20]
	ld	[%fp-20], %o0
	call	fun, 0
	 nop
	mov	0, %g1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.3"
