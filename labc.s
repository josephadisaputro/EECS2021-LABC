# this is labc 
# done by Yusuf Adisaputro, 213533088
# it is asking 3 integers input
# calling 1 function/ procedure called "sumdiff" 
# it sums first two input and differentiate second and third input
# and calling another procedure called "printinln" to print the result, one by one.
# by the way, printinln can only accept one input argument at a time

	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer for isprime
        syscall         
        add      $t0, $0, $v0 

	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer for isprime
        syscall         
        add      $t1, $0, $v0

	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer for isprime
        syscall         
        add      $t2, $0, $v0
#-----------------------------
	add	$a0, $0, $t0
	add	$a1, $0, $t1
	add	$a2, $0, $t2
	jal	sumdiff
#-----------------------------
	add	$a0, $0, $v0
	jal	printinln
	add	$a0, $0, $v1
	jal	printinln



	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
