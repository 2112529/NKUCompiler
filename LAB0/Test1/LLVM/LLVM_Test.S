	.text
	.file	"Test.cpp"
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$_ZStL8__ioinit, %edi
	callq	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movl	$_ZStL8__ioinit, %esi
	movl	$__dso_handle, %edx
	callq	__cxa_atexit@PLT
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
	.cfi_endproc
                                        # -- End function
	.text
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movabsq	$.L.str, %rsi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$0, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$10, -4(%rbp)
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %edi
	callq	_Z3fibi
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movl	%eax, %esi
	callq	_ZNSolsEi@PLT
	movabsq	$.L.str.1, %rsi
	movq	%rax, %rdi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	callq	_ZNSolsEPFRSoS_E@PLT
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movl	$5, %esi
	callq	_ZNSolsEi@PLT
	movl	$10, %edi
	callq	_Z3fibi
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movl	%eax, %esi
	callq	_ZNSolsEi@PLT
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.globl	_Z3fibi                         # -- Begin function _Z3fibi
	.p2align	4, 0x90
	.type	_Z3fibi,@function
_Z3fibi:                                # @_Z3fibi
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jg	.LBB2_2
# %bb.1:
	movl	$0, -16(%rbp)
	jmp	.LBB2_5
.LBB2_2:
	cmpl	$1, -12(%rbp)
	jne	.LBB2_4
# %bb.3:
	movl	$1, -16(%rbp)
	jmp	.LBB2_5
.LBB2_4:
	movl	-12(%rbp), %edi
	subl	$1, %edi
	callq	_Z3fibi
	movl	%eax, %ebx
	movl	-12(%rbp), %edi
	subl	$2, %edi
	callq	_Z3fibi
	addl	%eax, %ebx
	movl	%ebx, -16(%rbp)
.LBB2_5:
	movl	-16(%rbp), %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	_Z3fibi, .Lfunc_end2-_Z3fibi
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_Test.cpp
	.type	_GLOBAL__sub_I_Test.cpp,@function
_GLOBAL__sub_I_Test.cpp:                # @_GLOBAL__sub_I_Test.cpp
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	__cxx_global_var_init
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_GLOBAL__sub_I_Test.cpp, .Lfunc_end3-_GLOBAL__sub_I_Test.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"The first 10 Fibonacci numbers are: \n"
	.size	.L.str, 38

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	" "
	.size	.L.str.1, 2

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_Test.cpp
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
