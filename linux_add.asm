

.text
.globl _main


_main:
	pushq %rbp
	movl $4, %edi
	movl $5, %esi
	callq add
	leaq str(%rip), %rdi
	movl %eax, %esi
	movb $0, %al
	callq _printf
	popq %rbp
	retq



add:
	pushq %rbp
	movl %edi, %eax
	addl %esi, %eax
	popq %rbp
	retq




.data

str:
	.asciz "Return value: %d\n"
