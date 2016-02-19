	.file	"power2.c"
	.text
.globl power2
	.type	power2, @function
power2:
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
	call	power2
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
.L4:
	movl	-4(%ebp), %eax
	leave
	ret
	.size	power2, .-power2
.globl test
	.type	test, @function
test:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	$13, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	power2
	movl	%eax, value
	movl	$0, %eax
	leave
	ret
	.size	test, .-test
	.comm	value,4,4
	.ident	"GCC: (GNU) 4.1.3 20070929 (prerelease) (Ubuntu 4.1.2-16ubuntu2)"
	.section	.note.GNU-stack,"",@progbits
