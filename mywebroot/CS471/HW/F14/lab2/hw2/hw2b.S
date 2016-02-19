	.file	"p8.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"y = %e\n"
.LC3:
	.string	"x = %e\n"
.LC5:
	.string	"(x+y)*10 = %e\n"
.LC6:
	.string	"(x*10) + (y*10) = %e\n\n"
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1036831949
	.align 4
.LC4:
	.long	1092616192
	.text
.globl why
	.type	why, @function
why:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	flds	.LC0
	fsts	y
	movl	$0xbdccccca, x
	fstpl	4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	flds	x
	fstpl	4(%esp)
	movl	$.LC3, (%esp)
	call	printf
	flds	y
	flds	x
	fld	%st(1)
	fadd	%st(1), %st
	flds	.LC4
	fmul	%st, %st(1)
	fxch	%st(1)
	fsts	t
	fxch	%st(2)
	fmul	%st(1), %st
	fsts	x10
	fxch	%st(3)
	fmulp	%st, %st(1)
	fsts	y10
	faddp	%st, %st(2)
	fxch	%st(1)
	fstps	s
	fstpl	4(%esp)
	movl	$.LC5, (%esp)
	call	printf
	flds	s
	fstpl	4(%esp)
	movl	$.LC6, (%esp)
	call	printf
	leave
	ret
	.size	why, .-why
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
	call	why
	movl	$0, %eax
	addl	$4, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.comm	s,4,4
	.comm	t,4,4
	.comm	y,4,4
	.comm	x,4,4
	.comm	x10,4,4
	.comm	y10,4,4
	.ident	"GCC: (GNU) 4.1.2 (Ubuntu 4.1.2-0ubuntu4)"
	.section	.note.GNU-stack,"",@progbits
