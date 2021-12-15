


.text
.globl _main

_main:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rdi
	pushq %rsi
	movq %rdi, %rsi
	leaq str(%rip), %rdi
	movb $0, %al
	callq _printf
	popq %rsi
	popq %rdi
	popq %rbp
	retq








.data

str:
	.asciz "argc: %d\n"
