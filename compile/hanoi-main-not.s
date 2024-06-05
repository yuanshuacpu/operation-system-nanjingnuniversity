	.file	"hanoi-main-not.c"
	.text
	.globl	hanoi
	.type	hanoi, @function
hanoi:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$864, %rsp
	movl	%edi, -852(%rbp)
	movl	%ecx, %eax
	movl	%esi, %ecx
	movb	%cl, -856(%rbp)
	movb	%dl, -860(%rbp)
	movb	%al, -864(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-784(%rbp), %rax
	subq	$12, %rax
	movq	%rax, -848(%rbp)
	addq	$12, -848(%rbp)
	movq	-848(%rbp), %rax
	movl	$0, (%rax)
	movq	-848(%rbp), %rax
	movl	-852(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-848(%rbp), %rax
	movzbl	-856(%rbp), %edx
	movb	%dl, 8(%rax)
	movq	-848(%rbp), %rax
	movzbl	-860(%rbp), %edx
	movb	%dl, 9(%rax)
	movq	-848(%rbp), %rax
	movzbl	-864(%rbp), %edx
	movb	%dl, 10(%rax)
	movq	-848(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, -832(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -824(%rbp)
	jmp	.L2
.L11:
	movq	-840(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -852(%rbp)
	movq	-840(%rbp), %rax
	movzbl	8(%rax), %eax
	movb	%al, -856(%rbp)
	movq	-840(%rbp), %rax
	movzbl	9(%rax), %eax
	movb	%al, -860(%rbp)
	movq	-840(%rbp), %rax
	movzbl	10(%rax), %eax
	movb	%al, -864(%rbp)
	movq	-840(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	ja	.L3
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L5(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L5(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L4-.L5
	.text
.L9:
	cmpl	$1, -852(%rbp)
	jne	.L13
	movq	-840(%rbp), %rax
	movl	$3, (%rax)
	jmp	.L13
.L8:
	addq	$12, -848(%rbp)
	movl	-852(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-848(%rbp), %rax
	movl	$0, (%rax)
	movq	-848(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-848(%rbp), %rax
	movzbl	-856(%rbp), %edx
	movb	%dl, 8(%rax)
	movq	-848(%rbp), %rax
	movzbl	-864(%rbp), %edx
	movb	%dl, 9(%rax)
	movq	-848(%rbp), %rax
	movzbl	-860(%rbp), %edx
	movb	%dl, 10(%rax)
	movq	-848(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, -820(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -812(%rbp)
	jmp	.L3
.L7:
	addq	$12, -848(%rbp)
	movq	-848(%rbp), %rax
	movl	$0, (%rax)
	movq	-848(%rbp), %rax
	movl	$1, 4(%rax)
	movq	-848(%rbp), %rax
	movzbl	-856(%rbp), %edx
	movb	%dl, 8(%rax)
	movq	-848(%rbp), %rax
	movzbl	-860(%rbp), %edx
	movb	%dl, 9(%rax)
	movq	-848(%rbp), %rax
	movzbl	-864(%rbp), %edx
	movb	%dl, 10(%rax)
	movq	-848(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, -808(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -800(%rbp)
	jmp	.L3
.L6:
	addq	$12, -848(%rbp)
	movl	-852(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-848(%rbp), %rax
	movl	$0, (%rax)
	movq	-848(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-848(%rbp), %rax
	movzbl	-864(%rbp), %edx
	movb	%dl, 8(%rax)
	movq	-848(%rbp), %rax
	movzbl	-860(%rbp), %edx
	movb	%dl, 9(%rax)
	movq	-848(%rbp), %rax
	movzbl	-856(%rbp), %edx
	movb	%dl, 10(%rax)
	movq	-848(%rbp), %rax
	movq	(%rax), %rdx
	movq	%rdx, -796(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -788(%rbp)
	jmp	.L3
.L4:
	subq	$12, -848(%rbp)
	jmp	.L3
.L13:
	nop
.L3:
	movq	-840(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-840(%rbp), %rax
	movl	%edx, (%rax)
.L2:
	movq	-848(%rbp), %rax
	movq	%rax, -840(%rbp)
	leaq	-784(%rbp), %rax
	cmpq	%rax, -840(%rbp)
	jnb	.L11
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	hanoi, .-hanoi
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$67, %ecx
	movl	$66, %edx
	movl	$65, %esi
	movl	$3, %edi
	call	hanoi
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
