	.file	"collision_1.c"
	.text
	.p2align 4
	.globl	sub_800DE44
	.def	sub_800DE44;	.scl	2;	.type	32;	.endef
	.seh_proc	sub_800DE44
sub_800DE44:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	xorl	%eax, %eax
	cmpw	$0, 50(%rcx)
	movq	%rcx, %rbx
	jg	.L1
	cmpw	$0, 48(%rcx)
	jg	.L1
	movl	36(%rcx), %eax
	movl	$120, %r10d
	movw	%r10w, 48(%rcx)
	movl	%eax, %edx
	andl	$1, %edx
	cmpl	$1, %edx
	sbbl	%ecx, %ecx
	andw	$384, %cx
	subw	$192, %cx
	cmpl	$1, %edx
	sbbl	%edx, %edx
	andw	$768, %dx
	subw	$384, %dx
	movw	%dx, 20(%rbx)
	testb	$64, %al
	jne	.L4
	movl	$-768, %r9d
	movw	%r9w, 22(%rbx)
.L5:
	andl	$-1341, %eax
	movl	$14, %edx
	movq	%rbx, %rcx
	orl	$2, %eax
	movl	%eax, 36(%rbx)
	movl	$20, %eax
	movw	%ax, 108(%rbx)
	call	sub_8023B5C
	movl	$3590, %edx
	xorl	%ecx, %ecx
	movb	$9, 117(%rbx)
	movq	.refptr.gGameMode(%rip), %rax
	movw	%dx, 26(%rbx)
	movw	%cx, 105(%rbx)
	movzbl	(%rax), %esi
	cmpb	$5, %sil
	jne	.L6
	movq	.refptr.gRingCount(%rip), %rbp
	movl	$5, %eax
	movl	16(%rbx), %edx
	movl	12(%rbx), %ecx
	movzwl	0(%rbp), %r8d
	cmpl	$5, %r8d
	movl	%r8d, %edi
	cmova	%eax, %r8d
	cmovbe	%edi, %esi
	cmova	%eax, %edi
	sarl	$8, %edx
	sarl	$8, %ecx
	call	InitScatteringRings
	subw	%di, 0(%rbp)
	call	sub_8019224
	movb	$4, (%rax)
	movb	%sil, 1(%rax)
.L6:
	movl	$119, %ecx
	call	m4aSongNumStart
	movl	$1, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	movl	$-384, %r8d
	movw	%cx, 20(%rbx)
	movw	%r8w, 22(%rbx)
	jmp	.L5
	.seh_endproc
	.p2align 4
	.globl	sub_800DF38
	.def	sub_800DF38;	.scl	2;	.type	32;	.endef
	.seh_proc	sub_800DF38
sub_800DF38:
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movzbl	26(%r9), %r10d
	movl	%r10d, %eax
	negl	%eax
	movb	%al, 60(%rsp)
	movzbl	27(%r9), %eax
	movb	%r10b, 62(%rsp)
	movb	%al, 63(%rsp)
	movl	%eax, %r11d
	leaq	60(%rsp), %rax
	movq	%rax, 32(%rsp)
	negl	%r11d
	movb	%r11b, 61(%rsp)
	call	CheckRectCollision_SpritePlayer
	addq	$72, %rsp
	ret
	.seh_endproc
	.globl	gTilemapsRef
	.bss
	.align 8
gTilemapsRef:
	.space 8
	.ident	"GCC: (Rev1, Built by MSYS2 project) 10.2.0"
	.def	sub_8023B5C;	.scl	2;	.type	32;	.endef
	.def	InitScatteringRings;	.scl	2;	.type	32;	.endef
	.def	sub_8019224;	.scl	2;	.type	32;	.endef
	.def	m4aSongNumStart;	.scl	2;	.type	32;	.endef
	.def	CheckRectCollision_SpritePlayer;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.gRingCount, "dr"
	.globl	.refptr.gRingCount
	.linkonce	discard
.refptr.gRingCount:
	.quad	gRingCount
	.section	.rdata$.refptr.gGameMode, "dr"
	.globl	.refptr.gGameMode
	.linkonce	discard
.refptr.gGameMode:
	.quad	gGameMode
