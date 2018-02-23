	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	#lw	$a0, MAX($0)		#how it works? lw (load word) $a0 is $0 + "whatever it is in address MAX"
	#addi	$v0, $0, 1
	#syscall				#this syscall will print the number inside address MAX

	#addi     $v0, $0, 11      	# prints space 
        #add      $a0, $0, ' '      
        #syscall
	
	#lbu	$a0, SIZE($0)
	#addi	$v0, $0, 1
	#syscall

	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer
        syscall         
        add      $t0, $0, $v0 
#-----------------------------	
	add	$a0, $0, $t0		#first i wanna set the count then get the count
	jal	setCount
#-----------------------------
	jal	getCount
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
