#divisible by 9 checker implemented as function in assembly

main:
	addi a0, zero, 81 # argument 0 = 81
    addi a2, zero, 1 # check if 1
    addi a3, zero, 0 # check if 0
    jal div9 # div9(81)
	add s7, a0, zero # s7 = return val 
    beq a0, a2, done 
    beq a0, a3, done
    
div9:
	addi t0, zero 9 # set t0 to 9, to perform repeated subtraction
	addi t1, zero 0 # set t1 to 0, to use as a reference later

	sub a1, a0, t0 # initial subtraction by 9

	while: beq a1, t1, divisible # while loop: if the number after subtraction is equal to 0, it is divisible
	   sub a1, a1, t0 # if not, subtract again by 9 
       blt a1, t1, notdivis # if it is negative, it is not divisible
       j while # repeat subtraction loop

	divisible:
		addi a0, s7, 1 # if divisble, make a0 1
        jr ra
        

	notdivis:
		add a0, s7, zero # if not divisble, make a0 0
        jr ra
       
    done:
    