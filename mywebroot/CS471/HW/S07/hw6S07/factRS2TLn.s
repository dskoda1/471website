	.file	"factRTLn.c"
	.text
	.p2align 4,,15
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	testl	%edx, %edx
	je	.L3
	.p2align 4,,7
.L6:
	imull	%edx, %eax
	subl	$1, %edx
	jne	.L6
.L3:
	popl	%ebp
	ret
	.size	fact, .-fact
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$20, %esp
	movl	$1, 4(%esp)
	movl	$4, (%esp)
	call	fact
	movl	%eax, (%esp)
	call	fun
	addl	$20, %esp
	xorl	%eax, %eax
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
