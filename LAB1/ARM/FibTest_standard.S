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
	.file	"FibTest.c"
	.text
	.global	memo
	.bss
	.align	2
	.type	memo, %object
	.size	memo, 40
memo:
	.space	40
	.text
	.align	1
	.global	fib
	.syntax unified
	.thumb
	.thumb_func
	.type	fib, %function
fib:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bgt	.L2
	movs	r3, #0
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L4
	movs	r3, #1
	b	.L3
.L4:
	ldr	r3, .L6
.LPIC0:
	add	r3, pc
	ldr	r2, [r7, #4]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #-1
	beq	.L5
	ldr	r3, .L6+4
.LPIC1:
	add	r3, pc
	ldr	r2, [r7, #4]
	ldr	r3, [r3, r2, lsl #2]
	b	.L3
.L5:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	mov	r0, r3
	bl	fib(PLT)
	mov	r4, r0
	ldr	r3, [r7, #4]
	subs	r3, r3, #2
	mov	r0, r3
	bl	fib(PLT)
	mov	r3, r0
	adds	r1, r4, r3
	ldr	r3, .L6+8
.LPIC2:
	add	r3, pc
	ldr	r2, [r7, #4]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, .L6+12
.LPIC3:
	add	r3, pc
	ldr	r2, [r7, #4]
	ldr	r3, [r3, r2, lsl #2]
.L3:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L7:
	.align	2
.L6:
	.word	memo-(.LPIC0+4)
	.word	memo-(.LPIC1+4)
	.word	memo-(.LPIC2+4)
	.word	memo-(.LPIC3+4)
	.size	fib, .-fib
	.section	.rodata
	.align	2
.LC0:
	.ascii	"The 5th Fibonacci numbers are: %d\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	movs	r2, #40
	mov	r1, #-1
	ldr	r3, .L10
.LPIC4:
	add	r3, pc
	mov	r0, r3
	bl	memset(PLT)
	movs	r0, #5
	bl	fib(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L10+4
.LPIC5:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
	mov	r0, r3
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	memo-(.LPIC4+4)
	.word	.LC0-(.LPIC5+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",%progbits
