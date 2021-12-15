


.text
.globl _main


_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq %rdi, -8(%rbp)	# store argc on stack
	movq %rsi, -16(%rbp)	# store base address of argv on stack
	movq -16(%rbp), %rax	# base of argv is in -16(%rbp)
	addq $8, %rax		# add 8 byte offset to base of argv to get argv[1]
	movq (%rax), %rdi
	callq _atoi
	movl %eax, -24(%rbp)	# store return value of atoi in %eax onto the stack
	movq -16(%rbp), %rax
	addq $16, %rax		# add 16 byte offset to argv base pointer to get argv[2]
	movq (%rax), %rdi
	callq _atoi
	movl %eax, %edi		# return value goes to first param reg for call to add
	movl -24(%rbp), %esi	# previous return value in second param reg for call
	callq add
	leaq str(%rip), %rdi
	movl %eax, %esi
	movb $0, %al
	callq _printf
	addq $32, %rsp
	popq %rbp
	retq


add:
	pushq %rbp
	movq %rsp, %rbp
	movl %edi, %eax
	addl %esi, %eax
	popq %rbp
	retq


.data

test:
	.asciz "Got here!\n"

test2:
	.asciz "Op: %d\n"

str:
	.asciz "Value: %d\n"
