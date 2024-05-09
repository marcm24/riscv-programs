# Check if a0 is divisible by 9
addi a0, zero 28 # set a0 to the number we want to check
addi t0, zero 9 # set t0 to 9, to perform repeated subtraction
addi t1, zero 0 # set t1 to 0, to use as a reference later

sub a1, a0, t0 # initial subtraction by 9

while: beq a1, t1, divisible # while loop: if the number after subtraction is equal to 0, it is divisible
	   sub a1, a1, t0 # if not, subtract again by 9 
       blt a1, t1, notdivis # if it is negative, it is not divisible
       j while # repeat subtraction loop

divisible:
	addi a0, zero 1 # if divisble, make a0 1

notdivis:
	addi a0, zero 0 # if not divisble, make a0 0