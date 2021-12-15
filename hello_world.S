

.text
.globl main


main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str(%rip), %rdi
	callq _printf
	call _exit


.data

str:
	.asciz "Hello, World\n"
