	.file	"conway.c"
	.text
.globl update
	.type	update, @function
update:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$36, %esp
	movl	$0, -12(%ebp)
	movl	16(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, -24(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L2
.L3:
	movl	-20(%ebp), %eax
	sall	$2, %eax
	movl	%eax, %ebx
	addl	-24(%ebp), %ebx
	movl	12(%ebp), %eax
	sall	$2, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, (%ebx)
	addl	$1, -20(%ebp)
.L2:
	movl	-20(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L3
	movl	$0, -20(%ebp)
	jmp	.L4
.L22:
	movl	$0, -16(%ebp)
	jmp	.L5
.L21:
	movl	-20(%ebp), %eax
	subl	$1, %eax
	testl	%eax, %eax
	js	.L6
	movl	-16(%ebp), %eax
	subl	$1, %eax
	testl	%eax, %eax
	js	.L6
	movl	-20(%ebp), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	subl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L6
	addl	$1, -12(%ebp)
.L6:
	movl	-20(%ebp), %eax
	subl	$1, %eax
	testl	%eax, %eax
	js	.L7
	movl	-20(%ebp), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L7
	addl	$1, -12(%ebp)
.L7:
	movl	-16(%ebp), %eax
	subl	$1, %eax
	testl	%eax, %eax
	js	.L8
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	subl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L8
	addl	$1, -12(%ebp)
.L8:
	movl	-20(%ebp), %eax
	addl	$1, %eax
	cmpl	16(%ebp), %eax
	jge	.L9
	movl	-16(%ebp), %eax
	addl	$1, %eax
	cmpl	12(%ebp), %eax
	jge	.L9
	movl	-20(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L9
	addl	$1, -12(%ebp)
.L9:
	movl	-20(%ebp), %eax
	addl	$1, %eax
	cmpl	16(%ebp), %eax
	jge	.L10
	movl	-20(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L10
	addl	$1, -12(%ebp)
.L10:
	movl	-16(%ebp), %eax
	addl	$1, %eax
	cmpl	12(%ebp), %eax
	jge	.L11
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L11
	addl	$1, -12(%ebp)
.L11:
	movl	-20(%ebp), %eax
	subl	$1, %eax
	testl	%eax, %eax
	js	.L12
	movl	-16(%ebp), %eax
	addl	$1, %eax
	cmpl	12(%ebp), %eax
	jge	.L12
	movl	-20(%ebp), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L12
	addl	$1, -12(%ebp)
.L12:
	movl	-20(%ebp), %eax
	addl	$1, %eax
	cmpl	16(%ebp), %eax
	jge	.L13
	movl	-16(%ebp), %eax
	subl	$1, %eax
	testl	%eax, %eax
	js	.L13
	movl	-20(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	subl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L13
	addl	$1, -12(%ebp)
.L13:
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L14
	cmpl	$2, -12(%ebp)
	je	.L15
	cmpl	$3, -12(%ebp)
	jne	.L16
.L15:
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$1, (%eax)
	nop
	jmp	.L19
.L16:
	cmpl	$1, -12(%ebp)
	jle	.L18
	cmpl	$3, -12(%ebp)
	jle	.L28
.L18:
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	jmp	.L19
.L14:
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L19
	cmpl	$3, -12(%ebp)
	jne	.L20
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$1, (%eax)
	jmp	.L19
.L20:
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	jmp	.L19
.L28:
	nop
.L19:
	movl	$0, -12(%ebp)
	addl	$1, -16(%ebp)
.L5:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L21
	addl	$1, -20(%ebp)
.L4:
	movl	-20(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L22
	movl	$0, -20(%ebp)
	jmp	.L23
.L26:
	movl	$0, -16(%ebp)
	jmp	.L24
finalLoop:
	pushl	%ecx
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	sall	$2, %edx
	leal	(%eax,%edx), %edx
	movl	-20(%ebp), %eax
	sall	$2, %eax
	addl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %ecx
	sall	$2, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	addl	$1, -16(%ebp)
	popl	%ecx
	loop finalLoop
.L24:
	movl	12(%ebp), %ecx
	jl	finalLoop
	addl	$1, -20(%ebp)
.L23:
	movl	-20(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L26
	movl	$0, %eax
	addl	$36, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	update, .-update
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
