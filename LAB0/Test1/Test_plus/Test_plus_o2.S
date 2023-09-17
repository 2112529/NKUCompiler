	.file	"Test_plus.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1565:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1565:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text._ZNSt6vectorIiSaIiEED2Ev,"axG",@progbits,_ZNSt6vectorIiSaIiEED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIiSaIiEED2Ev
	.type	_ZNSt6vectorIiSaIiEED2Ev, @function
_ZNSt6vectorIiSaIiEED2Ev:
.LFB2720:
	.cfi_startproc
	endbr64
	movq	(%rdi), %r8
	testq	%r8, %r8
	je	.L3
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	ret
	.cfi_endproc
.LFE2720:
	.size	_ZNSt6vectorIiSaIiEED2Ev, .-_ZNSt6vectorIiSaIiEED2Ev
	.weak	_ZNSt6vectorIiSaIiEED1Ev
	.set	_ZNSt6vectorIiSaIiEED1Ev,_ZNSt6vectorIiSaIiEED2Ev
	.text
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB2731:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %r12
	testq	%r12, %r12
	je	.L11
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L7
	movsbl	67(%r12), %esi
.L8:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L7:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L8
	movl	$10, %esi
	movq	%r12, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L8
.L11:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2731:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.globl	_Z3fibi
	.type	_Z3fibi, @function
_Z3fibi:
.LFB2167:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	testl	%edi, %edi
	jle	.L18
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$1, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	cmpl	$1, %edi
	je	.L12
	movq	memo(%rip), %rdx
	movslq	%edi, %rax
	leaq	(%rdx,%rax,4), %r12
	movl	(%r12), %eax
	cmpl	$-1, %eax
	je	.L21
.L12:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.cfi_offset 6, -24
	.cfi_offset 12, -16
	leal	-1(%rdi), %edi
	call	_Z3fibi
	leal	-2(%rbx), %edi
	movl	%eax, %ebp
	call	_Z3fibi
	addl	%ebp, %eax
	movl	%eax, (%r12)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2167:
	.size	_Z3fibi, .-_Z3fibi
	.p2align 4
	.type	_Z3fibi.part.0, @function
_Z3fibi.part.0:
.LFB2728:
	.cfi_startproc
	movq	memo(%rip), %rax
	movslq	%edi, %rdx
	leaq	(%rax,%rdx,4), %r8
	movl	(%r8), %eax
	cmpl	$-1, %eax
	je	.L28
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdx, %rcx
	leal	-1(%rdx), %edi
	call	_Z3fibi
	leal	-2(%rcx), %edi
	movl	%eax, %esi
	call	_Z3fibi
	addl	%esi, %eax
	movl	%eax, (%r8)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2728:
	.size	_Z3fibi.part.0, .-_Z3fibi.part.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"The first 10 Fibonacci numbers are: \n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	" "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2168:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$37, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	_ZSt4cout(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rbp, %rdi
	xorl	%ebx, %ebx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L43:
	cmpl	$1, %ebx
	je	.L30
	movl	%ebx, %edi
	call	_Z3fibi.part.0
	movq	%rbp, %rdi
	movl	%eax, %esi
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpl	$9, %ebx
	je	.L31
.L33:
	addl	$1, %ebx
.L32:
	testl	%ebx, %ebx
	jne	.L43
.L30:
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%rbp, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$10, %edi
	call	_Z3fibi.part.0
	movq	%rbp, %rdi
	movl	%eax, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2168:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_memo, @function
_GLOBAL__sub_I_memo:
.LFB2725:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	__dso_handle(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	__cxa_atexit@PLT
	movl	$400, %edi
	movq	$0, memo(%rip)
	movq	$0, 8+memo(%rip)
	movq	$0, 16+memo(%rip)
	call	_Znwm@PLT
	leaq	memo(%rip), %rsi
	leaq	8(%rax), %rdi
	leaq	400(%rax), %rdx
	movq	%rax, memo(%rip)
	andq	$-8, %rdi
	movq	%rdx, 16+memo(%rip)
	movq	$-1, (%rax)
	movq	$-1, 392(%rax)
	subq	%rdi, %rax
	leal	400(%rax), %ecx
	movq	$-1, %rax
	shrl	$3, %ecx
	rep stosq
	movq	%rdx, 8+memo(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%r12, %rdx
	leaq	_ZNSt6vectorIiSaIiEED1Ev(%rip), %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2725:
	.size	_GLOBAL__sub_I_memo, .-_GLOBAL__sub_I_memo
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_memo
	.globl	memo
	.bss
	.align 16
	.type	memo, @object
	.size	memo, 24
memo:
	.zero	24
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
