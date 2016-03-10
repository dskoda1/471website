	.file	"factRTLn.c"
	.text
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	testl	%edx, %edx
	je	.L2
	imull	%edx, %eax
	movl	%eax, 4(%esp)
	leal	-1(%edx), %eax
	movl	%eax, (%esp)
	call	fact
.L2:
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
	movl	$1, 4(%esp)
	movl	$4, (%esp)
	call	fact
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
