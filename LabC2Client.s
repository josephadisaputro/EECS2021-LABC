	.text
main:	lw	$a0, MAX($0)		#how it works? lw (load word) $a0 is $0 + "whatever it is in address MAX"
	addi	$v0, $0, 1
	syscall				#this syscall will print the number inside address MAX

	addi     $v0, $0, 11      	# prints space 
        add      $a0, $0, ' '      
        syscall
	
	lb	$a0, SIZE($0)		#why lb not lbu? lbu can only print 32 bits size and lb can print negative number
	addi	$v0, $0, 1
	syscall
	jr	$ra
