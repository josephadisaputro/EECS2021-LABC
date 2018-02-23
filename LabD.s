# yusuf adisaputro 213533088
# it is a linkedlist all in one file

         .globl         Linkedlist         
         .globl         append         
         .globl         search                           
         .text  

main: 
#--------------------------------------------- 
	sw	$ra, 0($sp)
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

	addi	$a0, $0, 4
	jal	Linkedlist
	add	$s0, $0, $v0

	beq	$t0, $0, then1 
	j else1

else1:	add	$a0, $0, $t0
	add	$a1, $0, $s0
	jal	append

	beq	$t1, $0, then2 
	j else2

else2:	add	$a0, $0, $t1
	add	$a1, $0, $s0
	jal	append

	beq	$t1, $0, then3
	j else3

else3:	add	$a0, $0, $t2
	add	$a1, $0, $s0
	jal	append
	j fini

then1:	add	$a0, $0, $s0
	add	$a1, $0, $t0
	jal	search
	add	$a0, $0, $v0
	j fini

then2:	add	$a0, $0, $s0
	add	$a1, $0, $t1
	jal	search
	add	$a0, $0, $v0
	j fini
	
then3:	add	$a0, $0, $s0
	add	$a1, $0, $t2
	jal	search
	add	$a0, $0, $v0
	j fini

fini:	addi	$v0, $0, 1
	syscall

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr      $ra 

#---------------------------------------------
Linkedlist:      
	 #-------------------- 
         addi     $v0, $0, 9 
         syscall                
         sb       $0, 0($v0)    # null terminator  
         jr       $ra            
append:  #---------------------   
         lb         $t0,         0($a1)      
loop:	 beq	$t0, $0, appending
	 
	 add	$a1, $a1, 1  
	 lb         $t0,         0($a1)  
	 j loop
appending:	 
	 sb	$a0, 0($a1)
	 sb	$0, 1($a1)
         jr         $ra   
search:  #--------------------- 
         lb         $t0,         0($a0)    
	 beq	$t0, $a1, then
	 j else
then: 	 addi	$v0, $0, 1
	 j fini1
else:	 addi	$v0, $0, 0      
   

fini1:	jr         $ra 
	
 
