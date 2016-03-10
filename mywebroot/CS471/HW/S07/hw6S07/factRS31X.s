	.file	"factR1X.c"
	.text
	.p2align 4,,15
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	subl	$40, %esp
	movl	%ebx, -12(%ebp)
	movl	8(%ebp), %ebx
	movl	%esi, -8(%ebp)
	movl	%edi, -4(%ebp)
	testl	%ebx, %ebx
	jle	.L4
	movl	%ebx, %esi
	subl	$1, %esi
	jne	.L31
.L7:
	imull	%ebx, %eax
.L4:
	movl	-12(%ebp), %ebx
	movl	-8(%ebp), %esi
	movl	-4(%ebp), %edi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.p2align 4,,7
.L31:
	movl	%ebx, %edi
	subl	$2, %edi
	je	.L10
	movl	%ebx, %edx
	subl	$3, %edx
	movl	%edx, -36(%ebp)
	jne	.L32
.L13:
	imull	%edi, %eax
.L10:
	imull	%esi, %eax
	jmp	.L7
	.p2align 4,,7
.L32:
	movl	%ebx, %edx
	subl	$4, %edx
	movl	%edx, -32(%ebp)
	je	.L16
	movl	%ebx, %edx
	subl	$5, %edx
	movl	%edx, -28(%ebp)
	je	.L19
	movl	%ebx, %edx
	subl	$6, %edx
	movl	%edx, -24(%ebp)
	je	.L22
	movl	%ebx, %edx
	subl	$7, %edx
	movl	%edx, -20(%ebp)
	je	.L25
	movl	%ebx, %edx
	subl	$8, %edx
	movl	%edx, -16(%ebp)
	jne	.L33
.L28:
	imull	-20(%ebp), %eax
.L25:
	imull	-24(%ebp), %eax
.L22:
	imull	-28(%ebp), %eax
.L19:
	imull	-32(%ebp), %eax
.L16:
	imull	-36(%ebp), %eax
	jmp	.L13
.L33:
	leal	-9(%ebx), %eax
	movl	%eax, (%esp)
	call	fact
	imull	-16(%ebp), %eax
	jmp	.L28
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
	movl	$3, (%esp)
	call	fact
	sall	$2, %eax
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
