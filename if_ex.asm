/* This code checks if the number of arguments passed in argv is
 * the correct number (3 including the name of the program) and if
 * it is, it adds the two together and prints the result. Otherwise
 * it prints an error message and returns immediately.
 */

.text
.globl _main


_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movl %edi, -4(%rbp)		# store argc on stack
	movq %rsi, -16(%rbp)		# store argv on stack
	cmpl $3, %edi			# test if argc == 3
	je endif			# jump out of if statement if correct number of args
	leaq err_str(%rip), %rdi	# load error message
	movb $0, %al
	callq _printf			# print error message
	jmp out				# jump to exit
endif:	
	movq -16(%rbp), %rax		# load base of argv
	addq $8, %rax			# add 8 byte offset to get address of argv[1]
	movq (%rax), %rdi		# load argv[1] into %rdi for _atoi call
	callq _atoi			# convert argv[1] to int
	movl %eax, -20(%rbp)		# save result to the stack
	movq -16(%rbp), %rax
	addq $16, %rax
	movq (%rax), %rdi
	callq _atoi
	movl %eax, -24(%rbp)		# save result onto stack
	movl -20(%rbp), %edi		# move first number into 1st arg register for _add function call
	movl -24(%rbp), %esi		# move second number into 2nd arg register
	callq _add
	movl %eax, -28(%rbp)		# save result onto the stack
	leaq str(%rip), %rdi
	movl -28(%rbp), %esi
	movb $0, %al
	callq _printf
out:
	addq $32, %rsp
	popq %rbp
	retq

_add:
	pushq %rbp
	movq %rsp, %rbp
	movl %edi, %eax
	addl %esi, %eax
	popq %rbp
	retq



.data

err_str:
	.asciz "Incorrect number of arguments\n"

str:
	.asciz "Value: %d\n"
