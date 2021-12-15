

.text
.globl _main


_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str(%rip), %rdi
	callq _printf
	callq _exit



.data

str:
	.asciz "Hello, World\n"
