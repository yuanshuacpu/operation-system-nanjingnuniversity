	.file	"hanoi-main.c"
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
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%ecx, %eax
	movl	%esi, %ecx
	movb	%cl, -8(%rbp)
	movb	%dl, -12(%rbp)
	movb	%al, -16(%rbp)
	cmpl	$1, -4(%rbp)
	je	.L3
	movsbl	-12(%rbp), %ecx
	movsbl	-16(%rbp), %edx
	movsbl	-8(%rbp), %eax
	movl	-4(%rbp), %esi
	leal	-1(%rsi), %edi
	movl	%eax, %esi
	call	hanoi
	movsbl	-16(%rbp), %ecx
	movsbl	-12(%rbp), %edx
	movsbl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	hanoi
	movsbl	-8(%rbp), %ecx
	movsbl	-12(%rbp), %edx
	movsbl	-16(%rbp), %eax
	movl	-4(%rbp), %esi
	leal	-1(%rsi), %edi
	movl	%eax, %esi
	call	hanoi
.L3:
	nop
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
