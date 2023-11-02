.include "macrolib.s"

.data
	firstaccur: .double 0.001
	secondaccur: .double 0.0009
	thirdaccur: .double 0.000005
	fourthaccur: .double 0.00000002
	fifthaccur: .double 0.00000001
	sixthaccur: .double 0.000000009
.text 
	addi 		sp, sp, -12
	sw		ra, 8(sp)
	#first_test
	fld		fa0, firstaccur, t0
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0 or stopping the program if the accuracy isn't in the range.
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
	
	#second_test
	fld		fa0, secondaccur, t0
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	newline
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
	
	#third_test
	fld		fa0, thirdaccur, t0
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	newline
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
	
	#fourth_test
	fld		fa0, fourthaccur, t0
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	newline
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
			  
	#fifth_test
	fld		fa0, fifthaccur, t0
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	newline
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
	
	#sixth_test
	fld	fa0, sixthaccur, t0
	jal FindX #first arg – an accuracy, that we should check if it contains in the range [0.001;0.00000001]. 
		  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the fa0
	fsd	fa0, (sp) 
	lw	ra, 8(sp)
	newline
	print_str("x = ") #first arg – string to be output to the console
	fld	ft0, (sp)
	print_double(ft0) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	lw	ra, 8(sp)
	addi	sp, sp, 12
	li	a7, 10
