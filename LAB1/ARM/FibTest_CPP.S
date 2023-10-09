	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"FibTest.cpp"
	.text
	.section	.text._ZSt17__size_to_integerj,"axG",%progbits,_ZSt17__size_to_integerj,comdat
	.align	1
	.weak	_ZSt17__size_to_integerj
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt17__size_to_integerj, %function
_ZSt17__size_to_integerj:
	.fnstart
.LFB367:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZSt17__size_to_integerj, .-_ZSt17__size_to_integerj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.global	memo
	.bss
	.align	2
	.type	memo, %object
	.size	memo, 12
memo:
	.space	12
	.text
	.align	1
	.global	_Z3fibi
	.syntax unified
	.thumb
	.thumb_func
	.type	_Z3fibi, %function
_Z3fibi:
	.fnstart
.LFB2074:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.save {r4, r7, lr}
	.pad #12
	sub	sp, sp, #12
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bgt	.L4
	movs	r3, #0
	b	.L5
.L4:
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L6
	movs	r3, #1
	b	.L5
.L6:
	ldr	r3, [r7, #4]
	mov	r1, r3
	ldr	r3, .L8
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	_ZNSt6vectorIiSaIiEEixEj(PLT)
	mov	r3, r0
	ldr	r3, [r3]
	cmp	r3, #-1
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L7
	ldr	r3, [r7, #4]
	mov	r1, r3
	ldr	r3, .L8+4
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	_ZNSt6vectorIiSaIiEEixEj(PLT)
	mov	r3, r0
	ldr	r3, [r3]
	b	.L5
.L7:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	mov	r0, r3
	bl	_Z3fibi(PLT)
	mov	r4, r0
	ldr	r3, [r7, #4]
	subs	r3, r3, #2
	mov	r0, r3
	bl	_Z3fibi(PLT)
	mov	r3, r0
	add	r4, r4, r3
	ldr	r3, [r7, #4]
	mov	r1, r3
	ldr	r3, .L8+8
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	_ZNSt6vectorIiSaIiEEixEj(PLT)
	mov	r3, r0
	str	r4, [r3]
	ldr	r3, [r7, #4]
	mov	r1, r3
	ldr	r3, .L8+12
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	_ZNSt6vectorIiSaIiEEixEj(PLT)
	mov	r3, r0
	ldr	r3, [r3]
.L5:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L9:
	.align	2
.L8:
	.word	memo-(.LPIC0+4)
	.word	memo-(.LPIC1+4)
	.word	memo-(.LPIC2+4)
	.word	memo-(.LPIC3+4)
	.fnend
	.size	_Z3fibi, .-_Z3fibi
	.section	.rodata
	.align	2
.LC0:
	.ascii	"The 5th Fibonacci numbers are: \012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	.fnstart
.LFB2075:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r3, r4, r7, lr}
	.save {r3, r4, r7, lr}
	.setfp r7, sp, #0
	add	r7, sp, #0
	ldr	r4, .L12
.LPIC5:
	add	r4, pc
	ldr	r3, .L12+4
.LPIC4:
	add	r3, pc
	mov	r1, r3
	ldr	r3, .L12+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(PLT)
	movs	r0, #5
	bl	_Z3fibi(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L12+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZNSolsEi(PLT)
	mov	r2, r0
	ldr	r3, .L12+12
	ldr	r3, [r4, r3]
	mov	r1, r3
	mov	r0, r2
	bl	_ZNSolsEPFRSoS_E(PLT)
	movs	r3, #0
	mov	r0, r3
	pop	{r3, r4, r7, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+4)
	.word	.LC0-(.LPIC4+4)
	.word	_ZSt4cout(GOT)
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(GOT)
	.fnend
	.size	main, .-main
	.section	.text._ZNSaIiEC2Ev,"axG",%progbits,_ZNSaIiEC5Ev,comdat
	.align	1
	.weak	_ZNSaIiEC2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSaIiEC2Ev, %function
_ZNSaIiEC2Ev:
	.fnstart
.LFB2340:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	_ZN9__gnu_cxx13new_allocatorIiEC2Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSaIiEC2Ev, .-_ZNSaIiEC2Ev
	.weak	_ZNSaIiEC1Ev
	.thumb_set _ZNSaIiEC1Ev,_ZNSaIiEC2Ev
	.section	.text._ZNSaIiED2Ev,"axG",%progbits,_ZNSaIiED5Ev,comdat
	.align	1
	.weak	_ZNSaIiED2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSaIiED2Ev, %function
_ZNSaIiED2Ev:
	.fnstart
.LFB2343:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	_ZN9__gnu_cxx13new_allocatorIiED2Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSaIiED2Ev, .-_ZNSaIiED2Ev
	.weak	_ZNSaIiED1Ev
	.thumb_set _ZNSaIiED1Ev,_ZNSaIiED2Ev
	.section	.text._ZNSt6vectorIiSaIiEEC2EjRKiRKS0_,"axG",%progbits,_ZNSt6vectorIiSaIiEEC5EjRKiRKS0_,comdat
	.align	1
	.weak	_ZNSt6vectorIiSaIiEEC2EjRKiRKS0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt6vectorIiSaIiEEC2EjRKiRKS0_, %function
_ZNSt6vectorIiSaIiEEC2EjRKiRKS0_:
	.fnstart
.LFB2346:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.save {r4, r7, lr}
	.pad #20
	sub	sp, sp, #20
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r4, [r7, #12]
	ldr	r1, [r7]
	ldr	r0, [r7, #8]
.LEHB0:
	bl	_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_(PLT)
	mov	r3, r0
	ldr	r2, [r7]
	mov	r1, r3
	mov	r0, r4
	bl	_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_(PLT)
.LEHE0:
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
.LEHB1:
	bl	_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi(PLT)
.LEHE1:
	ldr	r3, [r7, #12]
	b	.L22
.L21:
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEED2Ev(PLT)
.LEHB2:
	bl	__cxa_end_cleanup(PLT)
.LEHE2:
.L22:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
	.global	__gxx_personality_v0
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA2346:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2346-.LLSDACSB2346
.LLSDACSB2346:
	.uleb128 .LEHB0-.LFB2346
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2346
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L21-.LFB2346
	.uleb128 0
	.uleb128 .LEHB2-.LFB2346
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE2346:
	.section	.text._ZNSt6vectorIiSaIiEEC2EjRKiRKS0_,"axG",%progbits,_ZNSt6vectorIiSaIiEEC5EjRKiRKS0_,comdat
	.fnend
	.size	_ZNSt6vectorIiSaIiEEC2EjRKiRKS0_, .-_ZNSt6vectorIiSaIiEEC2EjRKiRKS0_
	.weak	_ZNSt6vectorIiSaIiEEC1EjRKiRKS0_
	.thumb_set _ZNSt6vectorIiSaIiEEC1EjRKiRKS0_,_ZNSt6vectorIiSaIiEEC2EjRKiRKS0_
	.section	.text._ZNSt6vectorIiSaIiEEixEj,"axG",%progbits,_ZNSt6vectorIiSaIiEEixEj,comdat
	.align	1
	.weak	_ZNSt6vectorIiSaIiEEixEj
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt6vectorIiSaIiEEixEj, %function
_ZNSt6vectorIiSaIiEEixEj:
	.fnstart
.LFB2348:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7]
	lsls	r3, r3, #2
	add	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt6vectorIiSaIiEEixEj, .-_ZNSt6vectorIiSaIiEEixEj
	.section	.text._ZN9__gnu_cxx13new_allocatorIiEC2Ev,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiEC5Ev,comdat
	.align	1
	.weak	_ZN9__gnu_cxx13new_allocatorIiEC2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx13new_allocatorIiEC2Ev, %function
_ZN9__gnu_cxx13new_allocatorIiEC2Ev:
	.fnstart
.LFB2430:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiEC2Ev, .-_ZN9__gnu_cxx13new_allocatorIiEC2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorIiEC1Ev
	.thumb_set _ZN9__gnu_cxx13new_allocatorIiEC1Ev,_ZN9__gnu_cxx13new_allocatorIiEC2Ev
	.section	.text._ZN9__gnu_cxx13new_allocatorIiED2Ev,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiED5Ev,comdat
	.align	1
	.weak	_ZN9__gnu_cxx13new_allocatorIiED2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx13new_allocatorIiED2Ev, %function
_ZN9__gnu_cxx13new_allocatorIiED2Ev:
	.fnstart
.LFB2433:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiED2Ev, .-_ZN9__gnu_cxx13new_allocatorIiED2Ev
	.weak	_ZN9__gnu_cxx13new_allocatorIiED1Ev
	.thumb_set _ZN9__gnu_cxx13new_allocatorIiED1Ev,_ZN9__gnu_cxx13new_allocatorIiED2Ev
	.section	.rodata
	.align	2
.LC1:
	.ascii	"cannot create std::vector larger than max_size()\000"
	.section	.text._ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_,"axG",%progbits,_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_,comdat
	.align	1
	.weak	_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_, %function
_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_:
	.fnstart
.LFB2435:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.save {r4, r7, lr}
	.pad #20
	sub	sp, sp, #20
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, .L33
.LPIC7:
	add	r2, pc
	ldr	r3, .L33+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	mov	r3, #0
	add	r3, r7, #8
	ldr	r1, [r7]
	mov	r0, r3
	bl	_ZNSaIiEC1ERKS_(PLT)
	add	r3, r7, #8
	mov	r0, r3
	bl	_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_(PLT)
	mov	r2, r0
	ldr	r3, [r7, #4]
	cmp	r3, r2
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	uxtb	r4, r3
	add	r3, r7, #8
	mov	r0, r3
	bl	_ZNSaIiED1Ev(PLT)
	cmp	r4, #0
	beq	.L30
	ldr	r3, .L33+8
.LPIC6:
	add	r3, pc
	mov	r0, r3
	bl	_ZSt20__throw_length_errorPKc(PLT)
.L30:
	ldr	r3, [r7, #4]
	ldr	r1, .L33+12
.LPIC8:
	add	r1, pc
	ldr	r2, .L33+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #12]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L32
	bl	__stack_chk_fail(PLT)
.L32:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L34:
	.align	2
.L33:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC7+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC1-(.LPIC6+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC8+4)
	.fnend
	.size	_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_, .-_ZNSt6vectorIiSaIiEE17_S_check_init_lenEjRKS0_
	.section	.text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD5Ev,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev, %function
_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev:
	.fnstart
.LFB2438:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	_ZNSaIiED2Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev, .-_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev
	.thumb_set _ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev,_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEEC5EjRKS0_,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_, %function
_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_:
	.fnstart
.LFB2440:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r1, [r7, #4]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1ERKS0_(PLT)
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
.LEHB3:
	bl	_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj(PLT)
.LEHE3:
	ldr	r3, [r7, #12]
	b	.L41
.L40:
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev(PLT)
.LEHB4:
	bl	__cxa_end_cleanup(PLT)
.LEHE4:
.L41:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA2440:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2440-.LLSDACSB2440
.LLSDACSB2440:
	.uleb128 .LEHB3-.LFB2440
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L40-.LFB2440
	.uleb128 0
	.uleb128 .LEHB4-.LFB2440
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE2440:
	.section	.text._ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEEC5EjRKS0_,comdat
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_, .-_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_
	.weak	_ZNSt12_Vector_baseIiSaIiEEC1EjRKS0_
	.thumb_set _ZNSt12_Vector_baseIiSaIiEEC1EjRKS0_,_ZNSt12_Vector_baseIiSaIiEEC2EjRKS0_
	.section	.text._ZNSt12_Vector_baseIiSaIiEED2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEED5Ev,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEED2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEED2Ev, %function
_ZNSt12_Vector_baseIiSaIiEED2Ev:
	.fnstart
.LFB2443:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r1, [r3]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	subs	r3, r2, r3
	asrs	r3, r3, #2
	mov	r2, r3
	ldr	r0, [r7, #4]
	bl	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implD1Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA2443:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2443-.LLSDACSB2443
.LLSDACSB2443:
.LLSDACSE2443:
	.section	.text._ZNSt12_Vector_baseIiSaIiEED2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEED5Ev,comdat
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEED2Ev, .-_ZNSt12_Vector_baseIiSaIiEED2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEED1Ev
	.thumb_set _ZNSt12_Vector_baseIiSaIiEED1Ev,_ZNSt12_Vector_baseIiSaIiEED2Ev
	.section	.text._ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi,"axG",%progbits,_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi,comdat
	.align	1
	.weak	_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi, %function
_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi:
	.fnstart
.LFB2445:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.save {r4, r7, lr}
	.pad #20
	sub	sp, sp, #20
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ldr	r4, [r3]
	ldr	r3, [r7, #12]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(PLT)
	mov	r3, r0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	mov	r0, r4
	bl	_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E(PLT)
	mov	r2, r0
	ldr	r3, [r7, #12]
	str	r2, [r3, #4]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
	.fnend
	.size	_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi, .-_ZNSt6vectorIiSaIiEE18_M_fill_initializeEjRKi
	.section	.text._ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_,"axG",%progbits,_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_,comdat
	.align	1
	.weak	_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_, %function
_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_:
	.fnstart
.LFB2483:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r2, .L48
.LPIC9:
	add	r2, pc
	ldr	r3, .L48+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3, #0
	mvn	r3, #-536870912
	str	r3, [r7, #12]
	ldr	r0, [r7, #4]
	bl	_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_(PLT)
	mov	r3, r0
	str	r3, [r7, #16]
	add	r2, r7, #16
	add	r3, r7, #12
	mov	r1, r2
	mov	r0, r3
	bl	_ZSt3minIjERKT_S2_S2_(PLT)
	mov	r3, r0
	ldr	r3, [r3]
	ldr	r1, .L48+8
.LPIC10:
	add	r1, pc
	ldr	r2, .L48+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #20]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L47
	bl	__stack_chk_fail(PLT)
.L47:
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L49:
	.align	2
.L48:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC9+4)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+4)
	.cantunwind
	.fnend
	.size	_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_, .-_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_
	.section	.text._ZNSaIiEC2ERKS_,"axG",%progbits,_ZNSaIiEC5ERKS_,comdat
	.align	1
	.weak	_ZNSaIiEC2ERKS_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSaIiEC2ERKS_, %function
_ZNSaIiEC2ERKS_:
	.fnstart
.LFB2485:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSaIiEC2ERKS_, .-_ZNSaIiEC2ERKS_
	.weak	_ZNSaIiEC1ERKS_
	.thumb_set _ZNSaIiEC1ERKS_,_ZNSaIiEC2ERKS_
	.section	.text._ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC5ERKS0_,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_, %function
_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_:
	.fnstart
.LFB2488:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	_ZNSaIiEC2ERKS_(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_, .-_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_
	.weak	_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1ERKS0_
	.thumb_set _ZNSt12_Vector_baseIiSaIiEE12_Vector_implC1ERKS0_,_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_
	.section	.text._ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj, %function
_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj:
	.fnstart
.LFB2490:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj(PLT)
	mov	r2, r0
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7]
	lsls	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj, .-_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEj
	.section	.text._ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij, %function
_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij:
	.fnstart
.LFB2491:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij(PLT)
.L57:
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij, .-_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPij
	.section	.text._ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv, %function
_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv:
	.fnstart
.LFB2492:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv, .-_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv
	.section	.text._ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E,"axG",%progbits,_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E,comdat
	.align	1
	.weak	_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E, %function
_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E:
	.fnstart
.LFB2493:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E, .-_ZSt24__uninitialized_fill_n_aIPijiiET_S1_T0_RKT1_RSaIT2_E
	.section	.text._ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_,"axG",%progbits,_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_,comdat
	.align	1
	.weak	_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_, %function
_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_:
	.fnstart
.LFB2537:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_, .-_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_
	.section	.text._ZSt3minIjERKT_S2_S2_,"axG",%progbits,_ZSt3minIjERKT_S2_S2_,comdat
	.align	1
	.weak	_ZSt3minIjERKT_S2_S2_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt3minIjERKT_S2_S2_, %function
_ZSt3minIjERKT_S2_S2_:
	.fnstart
.LFB2538:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bcs	.L65
	ldr	r3, [r7]
	b	.L66
.L65:
	ldr	r3, [r7, #4]
.L66:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZSt3minIjERKT_S2_S2_, .-_ZSt3minIjERKT_S2_S2_
	.section	.text._ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiEC5ERKS1_,comdat
	.align	1
	.weak	_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_, %function
_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_:
	.fnstart
.LFB2540:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_, .-_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_
	.weak	_ZN9__gnu_cxx13new_allocatorIiEC1ERKS1_
	.thumb_set _ZN9__gnu_cxx13new_allocatorIiEC1ERKS1_,_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_
	.section	.text._ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC5Ev,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev, %function
_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev:
	.fnstart
.LFB2543:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev, .-_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev
	.weak	_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC1Ev
	.thumb_set _ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC1Ev,_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev
	.section	.text._ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj,"axG",%progbits,_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj,comdat
	.align	1
	.weak	_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj, %function
_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj:
	.fnstart
.LFB2545:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L72
	ldr	r3, [r7, #4]
	ldr	r1, [r7]
	mov	r0, r3
	bl	_ZNSt16allocator_traitsISaIiEE8allocateERS0_j(PLT)
	mov	r3, r0
	b	.L74
.L72:
	movs	r3, #0
.L74:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj, .-_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEj
	.section	.text._ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij,"axG",%progbits,_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij,comdat
	.align	1
	.weak	_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij, %function
_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij:
	.fnstart
.LFB2546:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij(PLT)
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij, .-_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pij
	.section	.text._ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_,"axG",%progbits,_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_,comdat
	.align	1
	.weak	_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_, %function
_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_:
	.fnstart
.LFB2547:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #24
	sub	sp, sp, #24
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #1
	strb	r3, [r7, #23]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_, .-_ZSt20uninitialized_fill_nIPijiET_S1_T0_RKT1_
	.section	.text._ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv,"axG",%progbits,_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv,comdat
	.align	1
	.weak	_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv, %function
_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv:
	.fnstart
.LFB2592:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv, .-_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv
	.section	.text._ZNSt16allocator_traitsISaIiEE8allocateERS0_j,"axG",%progbits,_ZNSt16allocator_traitsISaIiEE8allocateERS0_j,comdat
	.align	1
	.weak	_ZNSt16allocator_traitsISaIiEE8allocateERS0_j
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt16allocator_traitsISaIiEE8allocateERS0_j, %function
_ZNSt16allocator_traitsISaIiEE8allocateERS0_j:
	.fnstart
.LFB2593:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r2, #0
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZNSt16allocator_traitsISaIiEE8allocateERS0_j, .-_ZNSt16allocator_traitsISaIiEE8allocateERS0_j
	.section	.text._ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij,comdat
	.align	1
	.weak	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij, %function
_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij:
	.fnstart
.LFB2594:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	mov	r1, r3
	ldr	r0, [r7, #8]
	bl	_ZdlPvj(PLT)
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij, .-_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPij
	.section	.text._ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_,"axG",%progbits,_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_,comdat
	.align	1
	.weak	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_, %function
_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_:
	.fnstart
.LFB2595:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZSt6fill_nIPijiET_S1_T0_RKT1_(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_, .-_ZNSt22__uninitialized_fill_nILb1EE15__uninit_fill_nIPijiEET_S3_T0_RKT1_
	.section	.text._ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv,"axG",%progbits,_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv,comdat
	.align	1
	.weak	_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv, %function
_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv:
	.fnstart
.LFB2620:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mvn	r3, #-536870912
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv, .-_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv
	.section	.text._ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv,"axG",%progbits,_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv,comdat
	.align	1
	.weak	_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv, %function
_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv:
	.fnstart
.LFB2621:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r0, [r7, #12]
	bl	_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv(PLT)
	mov	r2, r0
	ldr	r3, [r7, #8]
	cmp	r3, r2
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	uxtb	r3, r3
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L89
	ldr	r3, [r7, #8]
	cmp	r3, #1073741824
	bcc	.L90
	bl	_ZSt28__throw_bad_array_new_lengthv(PLT)
.L90:
	bl	_ZSt17__throw_bad_allocv(PLT)
.L89:
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	mov	r0, r3
	bl	_Znwj(PLT)
	mov	r3, r0
	nop
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv, .-_ZN9__gnu_cxx13new_allocatorIiE8allocateEjPKv
	.section	.text._ZSt6fill_nIPijiET_S1_T0_RKT1_,"axG",%progbits,_ZSt6fill_nIPijiET_S1_T0_RKT1_,comdat
	.align	1
	.weak	_ZSt6fill_nIPijiET_S1_T0_RKT1_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt6fill_nIPijiET_S1_T0_RKT1_, %function
_ZSt6fill_nIPijiET_S1_T0_RKT1_:
	.fnstart
.LFB2622:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #20
	sub	sp, sp, #20
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r4, [r7, #12]
	ldr	r0, [r7, #8]
	bl	_ZSt17__size_to_integerj(PLT)
	mov	r5, r0
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_(PLT)
	mov	r3, r6
	ldr	r2, [r7, #4]
	mov	r1, r5
	mov	r0, r4
	bl	_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
	.fnend
	.size	_ZSt6fill_nIPijiET_S1_T0_RKT1_, .-_ZSt6fill_nIPijiET_S1_T0_RKT1_
	.section	.text._ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_,"axG",%progbits,_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_,comdat
	.align	1
	.weak	_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_, %function
_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_:
	.fnstart
.LFB2635:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_, .-_ZSt19__iterator_categoryIPiENSt15iterator_traitsIT_E17iterator_categoryERKS2_
	.section	.text._ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag,"axG",%progbits,_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag,comdat
	.align	1
	.weak	_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag, %function
_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag:
	.fnstart
.LFB2636:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	strb	r3, [r7]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L97
	ldr	r3, [r7, #12]
	b	.L98
.L97:
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	ldr	r2, [r7, #4]
	mov	r1, r3
	ldr	r0, [r7, #12]
	bl	_ZSt8__fill_aIPiiEvT_S1_RKT0_(PLT)
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	add	r3, r3, r2
.L98:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag, .-_ZSt10__fill_n_aIPijiET_S1_T0_RKT1_St26random_access_iterator_tag
	.section	.text._ZSt8__fill_aIPiiEvT_S1_RKT0_,"axG",%progbits,_ZSt8__fill_aIPiiEvT_S1_RKT0_,comdat
	.align	1
	.weak	_ZSt8__fill_aIPiiEvT_S1_RKT0_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt8__fill_aIPiiEvT_S1_RKT0_, %function
_ZSt8__fill_aIPiiEvT_S1_RKT0_:
	.fnstart
.LFB2639:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_(PLT)
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZSt8__fill_aIPiiEvT_S1_RKT0_, .-_ZSt8__fill_aIPiiEvT_S1_RKT0_
	.section	.text._ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_,"axG",%progbits,_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_,comdat
	.align	1
	.weak	_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_, %function
_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_:
	.fnstart
.LFB2640:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	b	.L101
.L102:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #4
	str	r3, [r7, #12]
.L101:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.L102
	nop
	nop
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_, .-_ZSt9__fill_a1IPiiEN9__gnu_cxx11__enable_ifIXsrSt11__is_scalarIT0_E7__valueEvE6__typeET_S8_RKS4_
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB2641:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.save {r4, r7, lr}
	.pad #28
	sub	sp, sp, #28
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r4, .L108
.LPIC13:
	add	r4, pc
	ldr	r2, .L108+4
.LPIC18:
	add	r2, pc
	ldr	r3, .L108+8
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	mov	r3, #0
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L103
	ldr	r3, [r7]
	movw	r2, #65535
	cmp	r3, r2
	bne	.L103
	ldr	r3, .L108+12
.LPIC11:
	add	r3, pc
	mov	r0, r3
.LEHB5:
	bl	_ZNSt8ios_base4InitC1Ev(PLT)
.LEHE5:
	ldr	r3, .L108+16
.LPIC12:
	add	r3, pc
	mov	r2, r3
	ldr	r3, .L108+20
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L108+24
.LPIC14:
	add	r3, pc
	mov	r0, r3
	bl	__aeabi_atexit(PLT)
	mov	r3, #-1
	str	r3, [r7, #16]
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSaIiEC1Ev(PLT)
	add	r3, r7, #12
	add	r2, r7, #16
	movs	r1, #100
	ldr	r0, .L108+28
.LPIC15:
	add	r0, pc
.LEHB6:
	bl	_ZNSt6vectorIiSaIiEEC1EjRKiRKS0_(PLT)
.LEHE6:
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSaIiED1Ev(PLT)
	ldr	r3, .L108+32
.LPIC16:
	add	r3, pc
	mov	r2, r3
	ldr	r3, .L108+36
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L108+40
.LPIC17:
	add	r3, pc
	mov	r0, r3
	bl	__aeabi_atexit(PLT)
	b	.L103
.L107:
	add	r3, r7, #12
	mov	r0, r3
	bl	_ZNSaIiED1Ev(PLT)
.LEHB7:
	bl	__cxa_end_cleanup(PLT)
.LEHE7:
.L103:
	ldr	r2, .L108+44
.LPIC19:
	add	r2, pc
	ldr	r3, .L108+8
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	eors	r2, r3, r2
	mov	r3, #0
	beq	.L106
	bl	__stack_chk_fail(PLT)
.L106:
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC13+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC18+4)
	.word	__stack_chk_guard(GOT)
	.word	_ZStL8__ioinit-(.LPIC11+4)
	.word	__dso_handle-(.LPIC12+4)
	.word	_ZNSt8ios_base4InitD1Ev(GOT)
	.word	_ZStL8__ioinit-(.LPIC14+4)
	.word	memo-(.LPIC15+4)
	.word	__dso_handle-(.LPIC16+4)
	.word	_ZNSt6vectorIiSaIiEED1Ev(GOT)
	.word	memo-(.LPIC17+4)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC19+4)
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA2641:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2641-.LLSDACSB2641
.LLSDACSB2641:
	.uleb128 .LEHB5-.LFB2641
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB2641
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L107-.LFB2641
	.uleb128 0
	.uleb128 .LEHB7-.LFB2641
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE2641:
	.text
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.section	.text._ZNSt6vectorIiSaIiEED2Ev,"axG",%progbits,_ZNSt6vectorIiSaIiEED5Ev,comdat
	.align	1
	.weak	_ZNSt6vectorIiSaIiEED2Ev
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt6vectorIiSaIiEED2Ev, %function
_ZNSt6vectorIiSaIiEED2Ev:
	.fnstart
.LFB2643:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	.save {r4, r5, r7, lr}
	.pad #8
	sub	sp, sp, #8
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldr	r4, [r3]
	ldr	r3, [r7, #4]
	ldr	r5, [r3, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(PLT)
	mov	r3, r0
	mov	r2, r3
	mov	r1, r5
	mov	r0, r4
	bl	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	_ZNSt12_Vector_baseIiSaIiEED2Ev(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
	.personality	__gxx_personality_v0
	.handlerdata
.LLSDA2643:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2643-.LLSDACSB2643
.LLSDACSB2643:
.LLSDACSE2643:
	.section	.text._ZNSt6vectorIiSaIiEED2Ev,"axG",%progbits,_ZNSt6vectorIiSaIiEED5Ev,comdat
	.fnend
	.size	_ZNSt6vectorIiSaIiEED2Ev, .-_ZNSt6vectorIiSaIiEED2Ev
	.weak	_ZNSt6vectorIiSaIiEED1Ev
	.thumb_set _ZNSt6vectorIiSaIiEED1Ev,_ZNSt6vectorIiSaIiEED2Ev
	.section	.text._ZSt8_DestroyIPiiEvT_S1_RSaIT0_E,"axG",%progbits,_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E,comdat
	.align	1
	.weak	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E, %function
_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E:
	.fnstart
.LFB2645:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.save {r7, lr}
	.pad #16
	sub	sp, sp, #16
	.setfp r7, sp, #0
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	_ZSt8_DestroyIPiEvT_S1_(PLT)
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.fnend
	.size	_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E, .-_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E
	.section	.text._ZSt8_DestroyIPiEvT_S1_,"axG",%progbits,_ZSt8_DestroyIPiEvT_S1_,comdat
	.align	1
	.weak	_ZSt8_DestroyIPiEvT_S1_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZSt8_DestroyIPiEvT_S1_, %function
_ZSt8_DestroyIPiEvT_S1_:
	.fnstart
.LFB2646:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_(PLT)
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_ZSt8_DestroyIPiEvT_S1_, .-_ZSt8_DestroyIPiEvT_S1_
	.section	.text._ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_,"axG",%progbits,_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_,comdat
	.align	1
	.weak	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_
	.syntax unified
	.thumb
	.thumb_func
	.type	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_, %function
_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_:
	.fnstart
.LFB2647:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.cantunwind
	.fnend
	.size	_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_, .-_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_GLOBAL__sub_I_memo, %function
_GLOBAL__sub_I_memo:
	.fnstart
.LFB2648:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	movw	r1, #65535
	movs	r0, #1
	bl	_Z41__static_initialization_and_destruction_0ii(PLT)
	pop	{r7, pc}
	.cantunwind
	.fnend
	.size	_GLOBAL__sub_I_memo, .-_GLOBAL__sub_I_memo
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_memo(target1)
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",%progbits
