



.text
.globl _main


_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movl $1, -4(%rbp)		# set counter variable to 1 on the stack
	movl %edi, -8(%rbp)		# push argc onto the stack
	movq %rsi, -16(%rbp)		# push base of argv onto the stack
	movl $0, -20(%rbp)		# set sum to be 0 to start
loop:
	cmpl %edi, -4(%rbp)		# test whether counter is greater than or equal to argc
	jge endloop			# if greater, then exit loop
	imull $8, -4(%rbp), %ecx	# multiply counter by 8 to get byte offset into argv
	movq -16(%rbp), %rax
	addq %rcx, %rax			# get address of argv[counter]
	movq (%rax), %rdi		# move argv[counter] into %rdi for atoi call
	callq _atoi			# convert argv[counter] to int

	addl %eax, -20(%rbp)		# add (int)argv[counter] to sum
	movl -8(%rbp), %edi		# place argc back into %edi
	addl $1, -4(%rbp)		# increment counter
	jmp loop
endloop:
	leaq str(%rip), %rdi		# load address of str into %rdi
	movl -20(%rbp), %esi		# move sum into %esi
	movb $0, %al
	callq _printf
	addq $32, %rsp
	popq %rbp
	retq




.data

test_str:
	.asciz "Val: %d\n"

str:
	.asciz "Sum: %d\n"
