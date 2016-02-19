	.file	"fact.c"
gcc2_compiled.:
___gnu_compiled_c:
.text
	.align 4
.globl _fact
	.def	_fact;	.scl	2;	.type	32;	.endef
_fact:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	cmpl $1,_n
	jle L3
	movl _n,%eax
	movl %eax,-4(%ebp)
	decl _n
	call _fact
	movl %eax,%eax
	movl %eax,%edx
	imull -4(%ebp),%edx
	movl %edx,%eax
	jmp L2
	jmp L4
	.align 4
L3:
	movl $1,%eax
	jmp L2
	.align 4
L4:
L2:
	movl %ebp,%esp
	popl %ebp
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.align 4
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	call ___main
	movl $3,_n
	cmpl $0,_n
	jle L6
	call _fact
L6:
L5:
	movl %ebp,%esp
	popl %ebp
	ret
	.comm	_n, 16	 # 4
