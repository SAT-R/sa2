.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start TaskDestructor_CreateStageUnknownTask
TaskDestructor_CreateStageUnknownTask: @ 0x08009DEC
	ldr r0, _08009DFC @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08009DFC: .4byte gFlags
