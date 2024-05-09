#bubble sort implemented as function in assembly

main:
    addi s0, zero, -15
	addi s1, zero, 42
	addi s2, zero, 73
	addi s3, zero, 19
	addi s4, zero, -8
	addi s5, zero, 24
	addi s6, zero, 16
	addi s7, zero, -2
	addi s8, zero, 99
	addi s9, zero, -78 # storing the values of the array into the registers
	addi s10, zero, -21
    addi s11, zero, 23
    addi t0, zero, -88
    addi t1, zero, 49
    addi t2, zero, -101
	
	sw s0, 1024(zero)
	sw s1, 1028(zero)
	sw s2, 1032(zero)
	sw s3, 1036(zero)
	sw s4, 1040(zero)
	sw s5, 1044(zero)
	sw s6, 1048(zero)
	sw s7, 1052(zero)
	sw s8, 1056(zero)
	sw s9, 1060(zero) # storing all of these values into the memory
    sw s10, 1064(zero)
    sw s11, 1068(zero)
    sw t0, 1072(zero)
    sw t1, 1076(zero)
    sw t2, 1080(zero)

	# sortarray starts at 0x400
	# s0 = array base address
	addi s0, zero, 0x00000400   # s0 = 0x400
	addi s1, zero, 0x00000404 # s1 = 0x404 next address
	addi s2, zero, 0   # i = 0
	addi s3, zero, 0 # j = 0
	addi t0, zero, 14  # t0 = 14 (size - 1)
	sub t1, t0, s2 # t1 = (size - i - 1)
	addi t2, zero, 4 # t2 = 4
    jal bubblesort
    bge s2, t2, done2

bubblesort:
	outloop:
		bge s2, t0, done # if i >= size - 1, done
    	addi s2, s2, 1
    	addi s3, zero, 0
    	addi s0, zero, 0x00000400   # s0 = 0x400
		addi s1, zero, 0x00000404 # s1 = 0x404
    	j innerloop
    
    
	innerloop:
		bge s3, t1, outloop # if j > size - i - 1, outloop
    	lw s4, 0(s0) # s4 = sortarray[j]
    	lw s5, 0(s1) # s5 = sortarray[j+1]
    	bgt s4, s5, swap # if sortarray[j] > sortarray[j + 1], swap
    	addi s3, s3, 1 
    	add s0, s0, t2
    	add s1, s1, t2
    	j innerloop
    
	swap:
    	sw s4, 0(s1)# sortarray[j] = sortarray[j+1]
    	sw s5, 0(s0) # sortarray[j+1] = sortarray[j]
    	addi s3, s3, 1 # j = j + 1
   	 	add s0, s0, t2 
   	 	add s1, s1, t2
    j innerloop
    
	done:
		jr ra

done2:


