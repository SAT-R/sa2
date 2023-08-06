.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageInit_Zone2
StageInit_Zone2: @ 0x0801E118
	ldr r1, _0801E128 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801E128: .4byte gBgScrollRegs
