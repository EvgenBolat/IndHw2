#
# Example library of macros.
# 

   .macro print_int (%x)
   li a7, 1
   mv a0, %x
   ecall
   .end_macro

   .macro print_imm_int (%x)
   li a7, 1
   li a0, %x
   ecall
   .end_macro
   
   .macro print_double(%x)
   	li	a7, 3
	fmv.d 	fa0, %x
	ecall
   .end_macro 

   .macro read_int(%x)
   li a7, 5
   ecall
   mv %x, a0
   .end_macro
   
   .macro read_double(%answer)
	li a7, 7
	ecall
	fmv.d %answer, fa0
   .end_macro 

   .macro print_str (%x)
   .data
str:
   .asciz %x
   .text
   li a7, 4
   la a0, str
   ecall
   .end_macro

   .macro print_char(%x)
   li a7, 11
   li a0, %x
   ecall
   .end_macro

   .macro newline
   print_char('\n')
   .end_macro
   
.data
a: .double 2.5
right: .double 0.001 #left range accurancy boundery
left: .double 0.00000001 #right range accurancy boundery
errText: .asciz "\nAccuracy should be in the range of 0.001 to 0.00000001"

.macro F(%x, %answer)
	addi 	sp, sp, -8
	fsd	%x, (sp)
	fld 	ft3, (sp)
	fmul.d 	ft0, ft3, ft3
	fmul.d 	ft0, ft0, ft3 # x^3
	fcvt.d.w ft4, zero
	fadd.d 	ft1, ft4, ft0 # save x^3
	fmul.d 	ft0, ft0, ft3 # x^4
	fsub.d 	ft0, ft0, ft1 # x^4-x^3
	fld	ft1, a, t0
	fsub.d 	ft0, ft0, ft1 # ^x4-x^3-2.5
	fmv.d 	%answer, ft0
	addi	sp, sp, 8
.end_macro 

.macro RetX(%acurr, %a, %b, %root)
	addi	sp, sp, -40
	fsd	%acurr, 32(sp)
	fsd	%a, 24(sp)
	fsd	%b, 16(sp)
	loop:
	fld	ft0, 24(sp)
	F(ft0, ft2)
	fsd	ft2, 8(sp) #f(a)
	fld	ft1, 16(sp)
	F(ft1, ft3) # f(b)
	fsd	ft3, (sp)
	fsub.d	ft2, ft2, ft3 # f(a)-f(b)
	fcvt.d.w ft3, zero
	flt.d 	t0, ft2, ft3
	beqz	t0, GrZero
	fsub.d	ft2, ft3, ft2 #abs
	GrZero:
	fld 	ft3, 32(sp) #acurr
	fgt.d	t0, ft2, ft3
	beqz	t0, end
	#new_a
	fld	ft0, 24(sp) #a ft0
	fld	ft1, 16(sp) #b ft1
	fld	ft2, 8(sp)
	fld	ft3, (sp)
	fsub.d	ft1, ft1, ft0
	fmul.d	ft1, ft1, ft2 # ft1 = (b-a) * f(a)
	fsub.d 	ft4, ft3, ft2 # ft4 = f(b) - f(a)
	fdiv.d 	ft1, ft1, ft4
	fsub.d 	ft0, ft0, ft1
	fsd	ft0, 24(sp)
	#new_b
	fld	ft0, 24(sp) #a ft0
	fld	ft1, 16(sp) #b ft1
	fld	ft2, 8(sp)
	fld	ft3, (sp)
	fsub.d	ft0, ft0, ft1
	fmul.d	ft0, ft0, ft3 # ft0 = (a-b) * f(b)
	fsub.d 	ft4, ft2, ft3# ft4 = f(a) - f(b)
	fdiv.d 	ft0, ft0, ft4
	fsub.d 	ft1, ft1, ft0
	fsd	ft1, 16(sp)
	j	loop
	end:
	fld	ft0, 16(sp)
	fmv.d	%root, ft0 
	addi	sp, sp, 40
.end_macro 

.macro IsCorrectInterv(%X)
	addi 	sp, sp, -8
	fsd 	%X, (sp)
	fld 	ft0, (sp)
	fld 	ft1, right, t0 
	fgt.d	t0, ft0, ft1
	bnez  	t0, error
	fld 	ft1, left, t0
	flt.d	t0, ft0, ft1
	bnez 	t0, error
	j	isCorrect
	error:
	li a7, 4
   	la a0, errText
   	ecall
	li	a7, 10
	ecall
	isCorrect:
	addi 	sp, sp, 8
.end_macro
