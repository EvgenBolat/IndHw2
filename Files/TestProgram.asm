.include "MyLib.s"
.data
	firstacurr: .double 0.001
	secondacurr: .double 0.0009
	thirdacurr: .double 0.000005
	fourthacurr: .double 0.00000002
	fifthacurr: .double 0.00000001
	sixthacurr: .double 0.000000009
.text 
	addi 		sp, sp, -24
	li		t1, 1
	fcvt.d.w	ft0, t1
	fsd		ft0, 16(sp)
	li		t1, 2
	fcvt.d.w	ft0, t1
	fsd		ft0, 8(sp)
	
	#first_test
	fld		ft0, firstacurr, t0
	IsCorrectInterv(ft0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
			     #Returns nothing or stops the program
	fsd 		ft0, (sp)
	fld 		ft1, 16(sp)
	fld		ft2, 8(sp)
	FindX(ft0, ft1, ft2, ft3) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	newline
	print_str("x = ")
	print_double(ft3) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	
	#second_test
	fld		ft0, secondacurr, t0
	IsCorrectInterv(ft0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
			     #Returns nothing or stops the program
	fsd 		ft0, (sp)
	fld 		ft1, 16(sp)
	fld		ft2, 8(sp)
	FindX(ft0, ft1, ft2, ft3) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	newline
	print_str("x = ")
	print_double(ft3) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	
	#third_test
	fld		ft0, thirdacurr, t0
	IsCorrectInterv(ft0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
			     #Returns nothing or stops the program
	fsd 		ft0, (sp)
	fld 		ft1, 16(sp)
	fld		ft2, 8(sp)
	FindX(ft0, ft1, ft2, ft3) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	newline
	print_str("x = ")
	print_double(ft3) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	#fourth_test
	fld		ft0, fourthacurr, t0
	IsCorrectInterv(ft0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
			     #Returns nothing or stops the program
	fsd 		ft0, (sp)
	fld 		ft1, 16(sp)
	fld		ft2, 8(sp)
	FindX(ft0, ft1, ft2, ft3) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	newline
	print_str("x = ")
	print_double(ft3) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
			  
	#fifth_test
	fld		ft0, fifthacurr, t0
	IsCorrectInterv(ft0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
			     #Returns nothing or stops the program
	fsd 		ft0, (sp)
	fld 		ft1, 16(sp)
	fld		ft2, 8(sp)
	FindX(ft0, ft1, ft2, ft3) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	newline
	print_str("x = ")
	print_double(ft3) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing
	#sixth_test
	fld		ft0, sixthacurr, t0
	IsCorrectInterv(ft0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
			     #Returns nothing or stops the program
	fsd 		ft0, (sp)
	fld 		ft1, 16(sp)
	fld		ft2, 8(sp)
	FindX(ft0, ft1, ft2, ft3) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	newline
	print_str("x = ")
	print_double(ft3) # first arg – an register from which we should print the double number into the console. 
			  #Returns nothing