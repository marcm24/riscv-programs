#greatest common denominator assembly program

main:
	addi a0, zero, 71 # argument a = 25
    addi a1, zero, 9 # argument b = 15
    jal gcd # gcd(25, 15)
    add s0, a0, zero # s0 = return val
    beq a0, s6, done2


	gcd:
		add s5, s2, a0 #1st value unsigned, a 
		add s1, s2, a1 #2nd value unsigned, b 
		addi s2, zero, 0 # store 0 to compare to know when to stop looping

		# b = a * q + r
		divu s3, s1, s5 # s3 = q =  b/a
		remu s4, s1, s5 # s4 = r = b%a

		while: beq s4, s2, done 
    		add s6, s4, s2 # store r in another register
			# b = a * q + r
			# a = r * q' + r'
			add s1, s2, s5 # s1 = b = a
			divu s3, s1, s4 # q' = a/r
			remu s4, s1, s4 # r' = a%r may need to reference r', store in another register
			j while
        
		done:
			add a0, s6, s2 # a0 = GCD
            jr ra
            
        done2:
		