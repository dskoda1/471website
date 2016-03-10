	.file	"gcd.c"
	.text
.globl gcd
	.type	gcd, @function
gcd:
	pushl	%ebp
	movl	%esp, %ebp
	jmp	.L2
.L3:
	movl	a, %edx
	movl	b, %eax
	cmpl	%eax, %edx
	jle	.L4
	movl	a, %eax
	movl	b, %edx
	subl	%edx, %eax
	movl	%eax, a
	jmp	.L2
.L4:
	movl	b, %eax
	movl	a, %edx
	subl	%edx, %eax
	movl	%eax, b
.L2:
	movl	a, %edx
	movl	b, %eax
	cmpl	%eax, %edx
	jne	.L3
	movl	a, %eax
	popl	%ebp
	ret
	.size	gcd, .-gcd
	.comm	a,4,4
	.comm	b,4,4
	.ident	"GCC: (GNU) 4.2.4 (Ubuntu 4.2.4-1ubuntu3)"
	.section	.note.GNU-stack,"",@progbits
