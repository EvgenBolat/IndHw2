.include "macrolib.s"

.text
.global FindX
FindX:
	addi 	sp, sp, -28
	sw	ra, 24(sp)
	fsd		fa0, 16(sp)
	li		t0, 1
	fcvt.d.w	ft0, t0
	fsd		ft0, 8(sp)
	li		t0, 2
	fcvt.d.w	ft0, t0
	fsd		ft0, (sp)
	IsCorrectInterv(fa0) #first arg – an accurancy, that we should check if it contains in the range [0.001;0.00000001]. 
				     #Returns nothing or stops the program
	fld 		ft0, 16(sp)
	fld 		ft1, 8(sp)
	fld		ft2, (sp)
	RetX(ft0, ft1, ft2, fa0) # first arg – accurancy; second arg – left range boundary;  
				  # third arg – right range boundary; 
				  #fourth arg - an register for answer returning. 
				  #Returns the equation root of x^4 - x^3 - 2.5 = 0 in the register of the fourth argument
	lw	ra, 24(sp)
	addi 	sp, sp, 28
	ret
