	.file	"p8.c"
	.section	.rodata
.LC2:
	.string	"y = %e\n"
.LC3:
	.string	"x = %e\n"
.LC5:
	.string	"(x+y)*10 = %e\n"
.LC6:
	.string	"(x*10) + (y*10) = %e\n\n"
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
	movl	$0x3dcccccd, %eax
	movl	%eax, y
	movl	$0xbdccccca, %eax
	movl	%eax, x
	flds	y
	fstpl	4(%esp)
	movl	$.LC2, (%esp)
	call	printf
	flds	x
	fstpl	4(%esp)
	movl	$.LC3, (%esp)
	call	printf
	flds	y
	flds	x
	faddp	%st, %st(1)
	flds	.LC4
	fmulp	%st, %st(1)
	fstps	t
	flds	x
	flds	.LC4
	fmulp	%st, %st(1)
	fstps	x10
	flds	y
	flds	.LC4
	fmulp	%st, %st(1)
	fstps	y10
	flds	x10
	flds	y10
	faddp	%st, %st(1)
	fstps	s
	flds	t
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
