	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 4
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$1, -20(%rbp)
	movl	$2, -24(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	LBB0_2
## %bb.1:
	movl	$1, -4(%rbp)
	jmp	LBB0_7
LBB0_2:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	LBB0_4
## %bb.3:
	movl	$2, -4(%rbp)
	jmp	LBB0_7
LBB0_4:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	LBB0_6
## %bb.5:
	movl	$3, -4(%rbp)
	jmp	LBB0_7
LBB0_6:
	movl	$-1, -4(%rbp)
LBB0_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
