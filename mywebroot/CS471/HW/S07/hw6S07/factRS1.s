	.file	"factR.c"
	.text
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	movl	$1, %eax
	testl	%ebx, %ebx
	je	.L4
	leal	-1(%ebx), %eax
	movl	%eax, (%esp)
	call	fact
	imull	%ebx, %eax
.L4:
	addl	$4, %esp
	popl	%ebx
	popl	%ebp
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
	subl	$4, %esp
	movl	$4, (%esp)
	call	fact
	movl	%eax, (%esp)
	call	fun
	movl	$0, %eax
	addl	$4, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
