


.text
.globl _main

_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movl %edi, -4(%rbp)	# push argc onto stack
	movq %rsi, -16(%rbp)	# push base of argv onto stack
	movq -16(%rbp), %rax	# place argv into %rax
	addq $8, %rax		# add 8 byte offset to get second element of argv
	movq (%rax), %rdi	# get the address of the first argv string
	callq _atoi		# use atoi to convert argv[1] to int
	movl %eax, -20(%rbp)	# save return value on stack
	movq -16(%rbp), %rax	# place base of argv into %rax
	addq $16, %rax		# add 16 byte offset to argv to get argv[2]
	movq (%rax), %rdi	# get third argv string
	callq _atoi
	movl %eax, %edi
	movl -20(%rbp), %esi
	jmp add
out:
	movl %eax, %esi
	leaq str(%rip), %rdi
	movb $0, %al
	callq _printf
	addq $32, %rsp
	popq %rbp
	retq




add:
	movl %edi, %eax
	addl %esi, %eax
	jmp out


.data

str:
	.asciz "Value: %d\n"
