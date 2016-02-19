	.file	"factR.c"
	.text
.globl fact
	.type	fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %ecx
	movl	$1, %ebx
	testl	%ecx, %ecx
	je	.L5
	movl	$1, %ebx
	movl	$0, %edx
.L6:
	movl	%ecx, %eax
	subl	%edx, %eax
	imull	%eax, %ebx
	addl	$1, %edx
	cmpl	%edx, %ecx
	jne	.L6
.L5:
	movl	%ebx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.size	fact, .-fact
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" fact is  %d"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	subl	$16, %esp
	movl	$4, (%esp)
	call	fact
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.3 (Ubuntu 4.0.3-1ubuntu5)"
	.section	.note.GNU-stack,"",@progbits
