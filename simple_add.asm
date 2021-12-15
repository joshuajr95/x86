

.text
.globl _main

_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movl $5, -12(%rbp)
	movl $4, -16(%rbp)
	callq add
	leaq out_str(%rip), %rdi
	movl %eax, %esi
	movb $0, %al
	callq _printf
	addq $16, %rsp
	popq %rbp
	retq


add:
	pushq %rbp
	movq %rsp, %rbp
	movl 16(%rbp), %eax
	addl 20(%rbp), %eax
	popq %rbp
	retq






.data

out_str:
	.asciz "Result: %d\n"
