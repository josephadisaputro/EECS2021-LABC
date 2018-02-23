	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi     $v0, $0, 5        	# v0 = readInt # service 5 for read input integer for isprime
        syscall         
        add      $t0, $0, $v0 
	
	add	$a0, $0, $t0
	jal	isprime
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
