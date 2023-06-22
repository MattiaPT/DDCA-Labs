#
# Calculate sum from A to B.
#
# Authors: 
#	Simon Belt, Maximilian Lipowsky, Mattia Taiana
#
# Group: ...
#

.text
main:
	#
	# Your code goes here...
	# A -> $t0, B -> $t1, toadd -> $t3, res -> $t2, b+1 -> $t0
	
	addi $t0, $zero, 0
	addi $t1, $zero, 2
	
	
	addi $t3, $t0, 0
	addi $t2, $zero, 0
	
	slt $t4, $t1, $t0
	beq $t4, 1, end
	
	addi $t4, $t1, 1
	
loop:
	add $t2, $t2, $t3
	addi $t3, $t3, 1
	
	beq $t4, $t3, end
	j loop
	  
	

	# Put your sum S into register $t2
end:	
	j	end	# Infinite loop at the end of the program. 
