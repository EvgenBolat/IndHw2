.include "macrolib.s"

.text
	addi 	sp, sp, -12
	sw	ra, 8(sp)
	print_str("Please, input the accurancy: ") #first arg – string to be output to the console. Returns nothing.
	read_double(fa0) # first arg – an register for answer returning. Returns an double number in the register of first argument
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0 or stopping the program if the accuracy isn't in the range.
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	newline
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
	addi	sp, sp, 12
	li 	a7, 10
	ecall

