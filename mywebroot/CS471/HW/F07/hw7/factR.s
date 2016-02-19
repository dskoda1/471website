	.file	"factR.c"
	.text
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	cmpl	$0, 8(%ebp)
	jne	.L2
	movl	$1, -4(%ebp)
	jmp	.L4
.L2:
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	%eax, (%esp)
	call	fact
	movl	%eax, %edx
	imull	8(%ebp), %edx
	movl	%edx, -4(%ebp)
.L4:
	movl	-4(%ebp), %eax
	leave
	ret
	.size	fact, .-fact
	.section	.rodata
.LC0:
	.string	" fact is  %d"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	andl	$-16, %esp
	movl	$0, %eax
	addl	$15, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	subl	%eax, %esp
	movl	$4, (%esp)
	call	fact
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.3 (Ubuntu 4.0.3-1ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
