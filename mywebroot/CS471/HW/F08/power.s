	.file	"power.c"
.globl n
	.data
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	3
	.text
.globl power
	.type	power, @function
power:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$1, -8(%ebp)
	movl	$5, -4(%ebp)
	jmp	.L2
.L3:
	movl	n, %eax
	movl	-8(%ebp), %edx
	imull	%edx, %eax
	movl	%eax, -8(%ebp)
	subl	$1, -4(%ebp)
.L2:
	cmpl	$0, -4(%ebp)
	jg	.L3
	movl	-8(%ebp), %eax
	leave
	ret
	.size	power, .-power
	.ident	"GCC: (GNU) 4.2.3 (Ubuntu 4.2.3-2ubuntu7)"
	.section	.note.GNU-stack,"",@progbits
