	.file	"factR1X.c"
	.text
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	$1, -4(%ebp)
	cmpl	$0, 8(%ebp)
	jle	.L2
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%eax, (%esp)
	call	fact
	imull	8(%ebp), %eax
	movl	%eax, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	leave
	ret
	.size	fact, .-fact
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
	movl	$4, (%esp)
	call	fact
	movl	%eax, -8(%ebp)
	movl	-8(%ebp), %eax
	movl	%eax, (%esp)
	call	fun
	movl	$0, %eax
	addl	$20, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
