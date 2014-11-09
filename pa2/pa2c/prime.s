	.file	"prime.c"				#C file
	.text							#code
.globl square						#global fct square
	.type	square, @function		#define fct square
square:								#fct square
	pushl	%ebp					#set up
	movl	%esp, %ebp				#set up
	movl	8(%ebp), %eax			#eax = arg2
	imull	8(%ebp), %eax			#eax *= arg1
	popl	%ebp					#clean up
	ret								#clean up
	.size	square, .-square		#clean up
.globl isPrime						#global fct isPrime
	.type	isPrime, @function		#define fct isPrime
isPrime:							#fct isPrime
	pushl	%ebp					#set up
	movl	%esp, %ebp				#set up
	subl	$36, %esp				#allocate space
	movl	8(%ebp), %eax			#eax = n
	andl	$1, %eax				#eax = n & 1 (even/odd)
	testl	%eax, %eax				#test if eax == 0 (odd)
	jne	.L4							#if odd, goto L4
	cmpl	$2, 8(%ebp)				#compare n : 2
	jne	.L6							#if != goto L6 (for even != 2)
.L4:								#if 2 or odd: 
	movl	8(%ebp), %eax			#eax = n
	movl	%eax, -28(%ebp)			#x = n
	movl	$1431655766, -32(%ebp)	#y = 1431655766
	movl	-32(%ebp), %eax			#eax = y
	imull	-28(%ebp)				#x = y * x
	movl	%edx, %ecx				#ecx = edx
	movl	-28(%ebp), %eax			#eax = x
	sarl	$31, %eax				#eax = most significant bit of x
	movl	%ecx, %edx				#edx = ecx
	subl	%eax, %edx				#edx -= 1 or 0
	movl	%edx, -24(%ebp)			#z = edx
	movl	-24(%ebp), %eax			#eax = z
	addl	%eax, %eax				#z += z
	addl	-24(%ebp), %eax			#eax = z
	movl	-28(%ebp), %ecx			#ecx = x
	subl	%eax, %ecx				#x -= z
	movl	%ecx, -24(%ebp)			#z = ecx
	cmpl	$0, -24(%ebp)			#compare z : 0
	jne	.L7							#if != goto L7
	cmpl	$3, 8(%ebp)				#compare n : 3
	jne	.L6							#if != goto L6
.L7:
	cmpl	$1, 8(%ebp)				#compare n : 1
	jg	.L9							#if > goto L9
.L6:
	movl	$0, -20(%ebp)			#rval = 0 (return 0 if something is not prime)
	jmp	.L10						#goto L10
.L9:
	movl	$1, -8(%ebp)			#q = 1
	jmp	.L11						#goto L11
.L12:
	movl	-8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	subl	$1, %eax
	movl	8(%ebp), %edx
	movl	%eax, %ecx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L13
	movl	-4(%ebp), %eax
	subl	$1, %eax
	cmpl	8(%ebp), %eax
	je	.L13
	movl	$0, -20(%ebp)
	jmp	.L10
.L13:
	movl	-4(%ebp), %eax
	addl	$1, %eax
	movl	8(%ebp), %edx
	movl	%eax, %ecx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L16
	movl	-4(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	je	.L16
	movl	$0, -20(%ebp)
	jmp	.L10
.L16:
	addl	$1, -8(%ebp)
.L11:
	movl	-8(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	$7, %eax
	movl	%eax, (%esp)
	call	square
	cmpl	8(%ebp), %eax
	jl	.L12
	movl	$1, -20(%ebp)
.L10:
	movl	-20(%ebp), %eax			#eax = rval, to be returned
	leave							#clean up
	ret								#return
	.size	isPrime, .-isPrime
	.section	.rodata
.LC0:							
	.string	"Prime %d is %d\n"
	.text						
.globl main						
	.type	main, @function		
main:							
	leal	4(%esp), %ecx		#ecx = esp + 4 (ecx is above return address)
	andl	$-16, %esp			#align the stack, now lower than ret adr
	pushl	-4(%ecx)			#save return address under aligned esp
	pushl	%ebp				#save caller ebp in stack two under esp
	movl	%esp, %ebp			#set ebp to the base of this frame (esp)
	pushl	%ecx				#save ecx
	subl	$36, %esp			#subtract from esp to allocate 36bytes
	movl	4(%ecx), %eax		#eax = *(ecx + 4)
	addl	$4, %eax			#eax += 0
	movl	(%eax), %eax		#eax = *eax (eax = n at this point)
	movl	%eax, (%esp)		#prepare eax for atoi	
	call	atoi				#atoi(eax)
	movl	%eax, -16(%ebp)		#move atoi'd eax to 16 below ebp (n)	
	movl	$0, -12(%ebp)		#count = 0 (prime counter -> count)
	movl	$1, -8(%ebp)		#currPrime = 1 (current prime number to call -> currPrime)
	jmp	.L27					#goto L27
.L23:
	addl	$1, -8(%ebp)		#currPrime++ (increment the number we're looking to call isPrime on)
	movl	-8(%ebp), %eax		#eax = currPrime
	movl	%eax, (%esp)		#prepare currPrime for isPrime
	call	isPrime				#isPrime(eax)
	testl	%eax, %eax			#test if result is 0, above or below
	je	.L22					#if zero, goto L22
	addl	$1, -12(%ebp)		#count += 1 (increment number of primes found)
.L22:
.L27:
	movl	-12(%ebp), %eax		#eax = count
	cmpl	-16(%ebp), %eax		#compare count : n
	jl	.L23					#if less, goto L23
	movl	-8(%ebp), %eax		#else eax = currPrime
	movl	%eax, 8(%esp)		#prepare to print currPrime
	movl	-16(%ebp), %eax		#eax = n
	movl	%eax, 4(%esp)		#prepare to print n
	movl	$.LC0, (%esp)		#prepare LC0 for print
	call	printf				#call print on all this shit
	movl	$0, %eax			#eax = 0 (return successfully)
	addl	$36, %esp			#deallocate space
	popl	%ecx				#clean up
	popl	%ebp				#clean up
	leal	-4(%ecx), %esp		#clean up
	ret							#return
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.2 20080704 (Red Hat 4.1.2-51)"
	.section	.note.GNU-stack,"",@progbits
