	.file	"Test_plus.cpp"
	.text
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
	je	.L1
	movq	16(%rdi), %rsi
	movq	%r8, %rdi
	subq	%r8, %rsi
	jmp	_ZdlPvm@PLT
	.p2align 4,,10
	.p2align 3
.L1:
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
.LFB2729:
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
	je	.L9
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L6
	movsbl	67(%r12), %esi
.L7:
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
.L6:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	movq	%r12, %rdi
	call	*48(%rax)
	movsbl	%al, %esi
	jmp	.L7
.L9:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2729:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.type	_Z3fibi.part.0, @function
_Z3fibi.part.0:
.LFB2728:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%edi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rbp, %rbx
	salq	$2, %rbp
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	memo(%rip), %r13
	leaq	0(%r13,%rbp), %r14
	movl	(%r14), %r12d
	cmpl	$-1, %r12d
	je	.L38
.L10:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore_state
	movl	$1, %r12d
	cmpl	$2, %ebx
	je	.L12
	leaq	-4(%r13,%rbp), %rdx
	leal	-2(%rbx), %r15d
	movl	(%rdx), %r12d
	cmpl	$-1, %r12d
	je	.L39
	testl	%r15d, %r15d
	je	.L12
.L16:
	cmpl	$1, %r15d
	je	.L40
	leaq	-8(%r13,%rbp), %rbp
	movl	0(%rbp), %eax
	cmpl	$-1, %eax
	je	.L18
	addl	%eax, %r12d
.L12:
	movl	%r12d, (%r14)
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L40:
	addl	$1, %r12d
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L39:
	movl	$1, %r12d
	cmpl	$1, %r15d
	je	.L14
	movl	%r15d, %edi
	movq	%rdx, 8(%rsp)
	call	_Z3fibi.part.0
	movl	%ebx, %edi
	movq	8(%rsp), %rdx
	subl	$3, %edi
	movl	%eax, %r12d
	je	.L14
	cmpl	$1, %edi
	je	.L41
	movq	%rdx, 8(%rsp)
	call	_Z3fibi.part.0
	movq	8(%rsp), %rdx
	addl	%eax, %r12d
.L14:
	movl	%r12d, (%rdx)
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L18:
	leal	-3(%rbx), %r13d
	cmpl	$4, %ebx
	je	.L19
	movl	%r13d, %edi
	call	_Z3fibi.part.0
	subl	$4, %ebx
	movl	%eax, %r13d
	movl	%ebx, %edi
	je	.L19
	cmpl	$1, %ebx
	je	.L42
	call	_Z3fibi.part.0
	addl	%eax, %r13d
.L19:
	movl	%r13d, 0(%rbp)
	addl	%r13d, %r12d
	jmp	.L12
.L41:
	addl	$1, %r12d
	jmp	.L14
.L42:
	addl	$1, %r13d
	jmp	.L19
	.cfi_endproc
.LFE2728:
	.size	_Z3fibi.part.0, .-_Z3fibi.part.0
	.p2align 4
	.globl	_Z3fibi
	.type	_Z3fibi, @function
_Z3fibi:
.LFB2167:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	testl	%edi, %edi
	jle	.L64
	movl	%edi, %ecx
	movl	$1, %eax
	cmpl	$1, %edi
	je	.L64
	movq	memo(%rip), %r9
	movslq	%edi, %r8
	salq	$2, %r8
	leaq	(%r9,%r8), %r10
	movl	(%r10), %eax
	cmpl	$-1, %eax
	je	.L68
.L64:
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	movl	$1, %eax
	cmpl	$2, %edi
	je	.L65
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	-4(%r9,%r8), %rbx
	leal	-2(%rdi), %r11d
	movl	(%rbx), %esi
	cmpl	$-1, %esi
	je	.L69
.L46:
	leal	1(%rsi), %eax
	cmpl	$1, %r11d
	je	.L45
	leaq	-8(%r9,%r8), %r8
	movl	(%r8), %eax
	cmpl	$-1, %eax
	je	.L49
	addl	%esi, %eax
.L45:
	movl	%eax, (%r10)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	.cfi_restore 3
	movl	%eax, (%r10)
	ret
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	-3(%rcx), %edi
	cmpl	$4, %ecx
	je	.L50
	call	_Z3fibi.part.0
	leal	-4(%rcx), %edi
	movl	%eax, %r9d
	cmpl	$5, %ecx
	je	.L70
	call	_Z3fibi.part.0
	leal	(%rax,%r9), %edi
.L50:
	movl	%edi, (%r8)
	leal	(%rdi,%rsi), %eax
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L69:
	movl	$1, %esi
	cmpl	$1, %r11d
	je	.L47
	movl	%r11d, %edi
	call	_Z3fibi.part.0
	leal	-3(%rcx), %edi
	movl	%eax, %esi
	cmpl	$4, %ecx
	je	.L71
	call	_Z3fibi.part.0
	addl	%eax, %esi
.L47:
	movl	%esi, (%rbx)
	jmp	.L46
.L70:
	leal	1(%rax), %edi
	jmp	.L50
.L71:
	addl	$1, %esi
	movl	%esi, (%rbx)
	jmp	.L46
	.cfi_endproc
.LFE2167:
	.size	_Z3fibi, .-_Z3fibi
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	_ZSt4cout(%rip), %r15
	movl	$37, %edx
	leaq	.LC0(%rip), %rsi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r15, %rdi
	leaq	.LC1(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	$1, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$-3, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	$-8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$-4, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	$-5, 4(%rsp)
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L130:
	cmpl	$1, %esi
	je	.L73
	leaq	memo(%rip), %rax
	movq	(%rax), %r9
	leaq	8(%r9,%rbp), %r10
	movl	(%r10), %esi
	cmpl	$-1, %esi
	je	.L129
.L74:
	movq	%r15, %rdi
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	cmpl	$10, %r13d
	je	.L85
.L87:
	addl	$1, 4(%rsp)
	addl	$1, %r13d
	addq	$4, %rbp
	addl	$1, %ebx
	addl	$1, %r12d
.L86:
	movl	%ebx, %esi
	addl	$4, %esi
	jne	.L130
.L73:
	movq	%r15, %rdi
	call	_ZNSolsEi@PLT
	movl	$1, %edx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L129:
	cmpl	$-2, %ebx
	je	.L91
	leaq	4(%r9,%rbp), %rcx
	movl	(%rcx), %r11d
	cmpl	$-1, %r11d
	je	.L131
.L76:
	movl	$1, %ecx
	cmpl	$-1, %ebx
	je	.L75
	leaq	(%r9,%rbp), %rsi
	movl	(%rsi), %ecx
	cmpl	$-1, %ecx
	je	.L132
.L75:
	leal	(%r11,%rcx), %esi
	movl	%esi, (%r10)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L85:
	movq	%r15, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	$10, %edi
	call	_Z3fibi.part.0
	movq	%r15, %rdi
	movl	%eax, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L91:
	.cfi_restore_state
	movl	$1, %r11d
	xorl	%ecx, %ecx
	jmp	.L75
.L132:
	cmpl	$1, %r12d
	je	.L95
	leaq	-4(%r9,%rbp), %rdx
	movl	%ebx, %ecx
	movl	(%rdx), %r8d
	cmpl	$-1, %r8d
	je	.L133
.L82:
	cmpl	$1, %ebx
	je	.L81
	leaq	-8(%r9,%rbp), %r9
	movl	(%r9), %ecx
	cmpl	$-1, %ecx
	je	.L134
.L81:
	addl	%r8d, %ecx
	movl	%ecx, (%rsi)
	jmp	.L75
.L131:
	cmpl	$-1, %ebx
	je	.L92
	leaq	(%r9,%rbp), %r8
	movl	%r12d, %r11d
	movl	(%r8), %esi
	cmpl	$-1, %esi
	je	.L135
.L78:
	cmpl	$1, %r12d
	je	.L77
	leaq	-4(%r9,%rbp), %r8
	movl	(%r8), %r11d
	cmpl	$-1, %r11d
	je	.L136
.L77:
	addl	%esi, %r11d
	movl	%r11d, (%rcx)
	jmp	.L76
.L95:
	movl	$1, %r8d
	xorl	%ecx, %ecx
	jmp	.L81
.L92:
	movl	$1, %esi
	xorl	%r11d, %r11d
	jmp	.L77
.L136:
	movl	%ebx, %r11d
	cmpl	$1, %ebx
	je	.L94
	movl	%ebx, %edi
	call	_Z3fibi.part.0
	movl	4(%rsp), %edx
	movl	%eax, %r11d
	movl	%edx, %eax
	cmpl	$1, %edx
	je	.L80
	movl	%edx, %edi
	call	_Z3fibi.part.0
.L80:
	addl	%eax, %r11d
	movl	%r11d, (%r8)
	jmp	.L77
.L135:
	cmpl	$1, %r12d
	je	.L93
	movl	%r12d, %edi
	call	_Z3fibi.part.0
	movl	%eax, %esi
	movl	%ebx, %eax
	cmpl	$1, %ebx
	je	.L79
	movl	%ebx, %edi
	call	_Z3fibi.part.0
.L79:
	addl	%eax, %esi
	movl	%esi, (%r8)
	jmp	.L78
.L134:
	movl	4(%rsp), %edi
	movl	%edi, %ecx
	cmpl	$1, %edi
	je	.L97
	call	_Z3fibi.part.0
	leal	-2(%rbx), %edi
	movl	%eax, %ecx
	cmpl	$3, %ebx
	je	.L84
	call	_Z3fibi.part.0
	movl	%eax, %edi
.L84:
	addl	%edi, %ecx
	movl	%ecx, (%r9)
	jmp	.L81
.L133:
	cmpl	$1, %ebx
	je	.L96
	movl	%ebx, %edi
	movq	%rdx, 8(%rsp)
	call	_Z3fibi.part.0
	movl	4(%rsp), %edi
	movq	8(%rsp), %rdx
	movl	%eax, %r8d
	cmpl	$1, %edi
	movl	%edi, %eax
	je	.L83
	call	_Z3fibi.part.0
	movq	8(%rsp), %rdx
.L83:
	addl	%eax, %r8d
	movl	%r8d, (%rdx)
	jmp	.L82
.L96:
	movl	$1, %r8d
	xorl	%eax, %eax
	jmp	.L83
.L97:
	xorl	%edi, %edi
	jmp	.L84
.L93:
	movl	$1, %esi
	xorl	%eax, %eax
	jmp	.L79
.L94:
	xorl	%eax, %eax
	jmp	.L80
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
	pxor	%xmm0, %xmm0
	movl	$400, %edi
	movq	$0, 16+memo(%rip)
	movaps	%xmm0, memo(%rip)
	call	_Znwm@PLT
	leaq	memo(%rip), %rsi
	movq	%rax, %xmm0
	leaq	8(%rax), %rdi
	leaq	400(%rax), %rdx
	andq	$-8, %rdi
	punpcklqdq	%xmm0, %xmm0
	movq	%rdx, 16+memo(%rip)
	movaps	%xmm0, memo(%rip)
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
