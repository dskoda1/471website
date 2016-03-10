	.file	"factR.c"
	.text
	.p2align 4,,15
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L6
	.p2align 4,,7
.L5:
	imull	%edx, %eax
	subl	$1, %edx
	jne	.L5
.L6:
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
	subl	$4, %esp
	movl	$4, (%esp)
	call	fact
	movl	%eax, (%esp)
	call	fun
	addl	$4, %esp
	xorl	%eax, %eax
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
