.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZone3ActBoss
StageBgUpdateZone3ActBoss: @ 0x0801E1D0
	ldr r1, _0801E1E0 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #0xe]
	strh r0, [r1]
	strh r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0801E1E0: .4byte gBgScrollRegs
