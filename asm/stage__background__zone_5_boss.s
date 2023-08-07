.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZone5ActBoss
StageBgUpdateZone5ActBoss: @ 0x0801E1E4
	ldr r2, _0801E218 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801E21C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0801E220 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0801E224 @ =gHBlankCallbacks
	ldr r2, _0801E228 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E22C @ =HBlankCB_801E498
	str r1, [r0]
	ldr r2, _0801E230 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0801E218: .4byte gDispCnt
_0801E21C: .4byte 0x0000FDFF
_0801E220: .4byte gBgScrollRegs
_0801E224: .4byte gHBlankCallbacks
_0801E228: .4byte gNumHBlankCallbacks
_0801E22C: .4byte HBlankCB_801E498
_0801E230: .4byte gFlags
