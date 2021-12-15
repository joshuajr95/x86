


.text
.globl _main


/* 
 * This is the main recursive function that implements
 * the search routine. The four arguments are, in order,
 * the number to search for, the base address of the array,
 * the starting index of the search, and the stop index of
 * the search. They will be in %edi, %rsi, %edx, and %ecx,
 * respectively.
 */
_binary_search:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movl %edi, -4(%rbp)	# push target number onto stack
	movq %rsi, -16(%rbp)	# push base pointer for array onto stack
	movl %edx, -20(%rbp)	# push start index onto stack
	movl %ecx, -24(%rbp)	# push stop index onto stack
	movl $0, -28(%rbp)	# make space for mid on stack
	cmpl %edx, %ecx		# compare start to stop
	jge elif1		# if start < stop jump to first else if
	movl $-1, %eax		# put -1 into %eax to return
	jmp endif		# jump to outro
elif1:
	addl %edx, %ecx		# add start and stop together
	shr $1, %ecx		# divide result by 2 using right shift to get mid
	movl %ecx, -28(%rbp)	# move mid onto stack
	shl $2, %ecx		# multiply by 4 using left shift to get offset into array
	movq -16(%rbp), %rsi
	addq %rcx, %rsi		# add array offset to array base to get address of array element to check
	movl (%rsi), %edx	# load array[(start + stop)/2] into %edx
	cmpl %edx, -4(%rbp)	# compare array[(start + stop)/2] to target number
	jne elif2		# if not equal, jump to next else if
	movl -28(%rbp), %eax	# move mid into %eax to return
	jmp endif
elif2:
	cmpl %edx, -4(%rbp)
	jge else
	movl -4(%rbp), %edi	# move target into first argument register
	movq -16(%rbp), %rsi	# move base address of array into second argument register
	movl -20(%rbp), %edx	# move original start index into third argument register for call
	movl -28(%rbp), %ecx	# move mid into fourth arg register for call
	subl $1, %ecx		# subtract 1 from mid for call
	callq _binary_search
	jmp endif
else:
	movl -4(%rbp), %edi
	movq -16(%rbp), %rsi
	movl -28(%rbp), %edx
	addl $1, %edx
	movl -24(%rbp), %ecx
	callq _binary_search
endif:
	addq $32, %rsp
	popq %rbp
	retq


_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movl %edi, -4(%rbp)	# push argc onto stack
	movq %rsi, -16(%rbp)	# push base of argv onto stack
	addq $8, %rsi		# get address of second element of argv
	movq (%rsi), %rdi	# get argv[1]
	callq _atoi		# convert argv[1] to integer
	movl %eax, %edi		# result is number to search for
	leaq array(%rip), %rsi	# move address of array into second arg register
	movl $0, %edx		# start index of search
	movl $5, %ecx		# stop index of search
	callq _binary_search
	leaq str(%rip), %rdi	# load address of string for printf
	movl %eax, %esi		# put return val into second arg register
	movb $0, %al
	callq _printf
	addq $16, %rsp
	popq %rbp
	retq




.data

str:
	.asciz "Index: %d\n"

array:
	.long 2, 3, 5, 8, 9, 11
