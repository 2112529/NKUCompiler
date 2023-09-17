	.file	"Test_plus.cpp"
	.text
	.section	.text._ZNSt6vectorIiSaIiEED2Ev,"axG",@progbits,_ZNSt6vectorIiSaIiEED5Ev,comdat
	.align 2
	.weak	_ZNSt6vectorIiSaIiEED2Ev
	.type	_ZNSt6vectorIiSaIiEED2Ev, @function
_ZNSt6vectorIiSaIiEED2Ev:
.LFB2720:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.L4
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	16(%rdi), %rsi
	subq	%rax, %rsi
	movq	%rax, %rdi
	call	_ZdlPvm@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
.L4:
	ret
	.cfi_endproc
.LFE2720:
	.size	_ZNSt6vectorIiSaIiEED2Ev, .-_ZNSt6vectorIiSaIiEED2Ev
	.weak	_ZNSt6vectorIiSaIiEED1Ev
	.set	_ZNSt6vectorIiSaIiEED1Ev,_ZNSt6vectorIiSaIiEED2Ev
	.text
	.globl	_Z3fibi
	.type	_Z3fibi, @function
_Z3fibi:
.LFB2167:
	.cfi_startproc
	endbr64
	movl	$0, %eax
	testl	%edi, %edi
	jle	.L12
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	movl	%edi, %eax
	cmpl	$1, %edi
	je	.L7
	movslq	%edi, %rbp
	movq	memo(%rip), %rax
	movl	(%rax,%rbp,4), %eax
	cmpl	$-1, %eax
	je	.L15
.L7:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	leal	-1(%rdi), %edi
	call	_Z3fibi
	movl	%eax, %r12d
	leal	-2(%rbx), %edi
	call	_Z3fibi
	addl	%eax, %r12d
	movq	memo(%rip), %rax
	movl	%r12d, (%rax,%rbp,4)
	movq	memo(%rip), %rax
	movl	(%rax,%rbp,4), %eax
	jmp	.L7
.L12:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
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
	.text
	.globl	main
	.type	main, @function
main:
.LFB2168:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	.LC0(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$0, %ebx
	leaq	_ZSt4cout(%rip), %r12
	leaq	.LC1(%rip), %rbp
.L17:
	movl	%ebx, %edi
	call	_Z3fibi
	movl	%eax, %esi
	movq	%r12, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movl	$1, %edx
	movq	%rbp, %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	addl	$1, %ebx
	cmpl	$10, %ebx
	jne	.L17
	leaq	_ZSt4cout(%rip), %rbx
	movq	%rbx, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movl	$10, %edi
	call	_Z3fibi
	movl	%eax, %esi
	movq	%rbx, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movl	$0, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2168:
	.size	main, .-main
	.type	_GLOBAL__sub_I_memo, @function
_GLOBAL__sub_I_memo:
.LFB2725:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	_ZStL8__ioinit(%rip), %rbx
	movq	%rbx, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	movq	%rbx, %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	call	__cxa_atexit@PLT
	movq	$0, memo(%rip)
	movq	$0, 8+memo(%rip)
	movq	$0, 16+memo(%rip)
	movl	$400, %edi
	call	_Znwm@PLT
	movq	%rax, memo(%rip)
	leaq	400(%rax), %rdx
	movq	%rdx, 16+memo(%rip)
.L21:
	movl	$-1, (%rax)
	addq	$4, %rax
	cmpq	%rdx, %rax
	jne	.L21
	movq	%rdx, 8+memo(%rip)
	leaq	__dso_handle(%rip), %rdx
	leaq	memo(%rip), %rsi
	leaq	_ZNSt6vectorIiSaIiEED1Ev(%rip), %rdi
	call	__cxa_atexit@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
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
