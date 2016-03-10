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
	movl	%edx, %ecx
	imull	%edx, %eax
	subl	$1, %ecx
	je	.L3
	imull	%ecx, %eax
	movl	%edx, %ecx
	subl	$2, %ecx
	je	.L3
	imull	%ecx, %eax
	movl	%edx, %ecx
	subl	$3, %ecx
	je	.L3
	imull	%ecx, %eax
	subl	$4, %edx
	jne	.L18
	jmp	.L3
	.p2align 4,,7
.L20:
	imull	%ecx, %eax
	cmpl	$2, %edx
	leal	-2(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	cmpl	$3, %edx
	leal	-3(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	cmpl	$4, %edx
	leal	-4(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	cmpl	$5, %edx
	leal	-5(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	cmpl	$6, %edx
	leal	-6(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	cmpl	$7, %edx
	leal	-7(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	cmpl	$8, %edx
	leal	-8(%edx), %ecx
	je	.L3
	imull	%ecx, %eax
	subl	$9, %edx
	je	.L3
.L18:
	imull	%edx, %eax
	cmpl	$1, %edx
	leal	-1(%edx), %ecx
	jne	.L20
	.p2align 4,,7
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
	movl	$4, 4(%esp)
	movl	$3, (%esp)
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
