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
	.file	"Test.cpp"
	.text
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"The first 10 Fibonacci numbers are: \012\000"
	.align	2
.LC1:
	.ascii	" \000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	.fnstart
.LFB1719:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	.save {r4, r7, lr}
	.pad #12
	sub	sp, sp, #12
	.setfp r7, sp, #0
	add	r7, sp, #0
	ldr	r4, .L5
.LPIC1:
	add	r4, pc
	ldr	r3, .L5+4
.LPIC0:
	add	r3, pc
	mov	r1, r3
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(PLT)
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r0, [r7, #4]
	bl	_Z3fibi(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZNSolsEi(PLT)
	mov	r2, r0
	ldr	r3, .L5+12
.LPIC2:
	add	r3, pc
	mov	r1, r3
	mov	r0, r2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(PLT)
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #9
	ble	.L3
	ldr	r3, .L5+16
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZNSolsEPFRSoS_E(PLT)
	movs	r1, #5
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZNSolsEi(PLT)
	movs	r0, #10
	bl	_Z3fibi(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	mov	r0, r3
	bl	_ZNSolsEi(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	.LC0-(.LPIC0+4)
	.word	_ZSt4cout(GOT)
	.word	.LC1-(.LPIC2+4)
	.word	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(GOT)
	.fnend
	.size	main, .-main
	.align	1
	.global	_Z3fibi
	.syntax unified
	.thumb
	.thumb_func
	.type	_Z3fibi, %function
_Z3fibi:
	.fnstart
.LFB1720:
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
	bgt	.L8
	movs	r3, #0
	b	.L9
.L8:
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L10
	movs	r3, #1
	b	.L9
.L10:
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
	add	r3, r3, r4
.L9:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
	.fnend
	.size	_Z3fibi, .-_Z3fibi
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
	.fnstart
.LFB2226:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r4, .L14
.LPIC5:
	add	r4, pc
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L13
	ldr	r3, [r7]
	movw	r2, #65535
	cmp	r3, r2
	bne	.L13
	ldr	r3, .L14+4
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	_ZNSt8ios_base4InitC1Ev(PLT)
	ldr	r3, .L14+8
.LPIC4:
	add	r3, pc
	mov	r2, r3
	ldr	r3, .L14+12
	ldr	r3, [r4, r3]
	mov	r1, r3
	ldr	r3, .L14+16
.LPIC6:
	add	r3, pc
	mov	r0, r3
	bl	__aeabi_atexit(PLT)
.L13:
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+4)
	.word	_ZStL8__ioinit-(.LPIC3+4)
	.word	__dso_handle-(.LPIC4+4)
	.word	_ZNSt8ios_base4InitD1Ev(GOT)
	.word	_ZStL8__ioinit-(.LPIC6+4)
	.cantunwind
	.fnend
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.type	_GLOBAL__sub_I_main, %function
_GLOBAL__sub_I_main:
	.fnstart
.LFB2227:
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
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw",%init_array
	.align	2
	.word	_GLOBAL__sub_I_main(target1)
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",%progbits
