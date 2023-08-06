.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZone6ActBoss
StageBgUpdateZone6ActBoss: @ 0x0801E234
	ldr r2, _0801E260 @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2, #6]
	ldr r0, _0801E264 @ =0x0000FFFC
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2, #6]
	ldr r1, _0801E268 @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0801E260: .4byte gBgCntRegs
_0801E264: .4byte 0x0000FFFC
_0801E268: .4byte gBgScrollRegs
