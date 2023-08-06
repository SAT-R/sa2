.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZoneFinalActXX
StageBgUpdateZoneFinalActXX: @ 0x0801E310
	push {lr}
	ldr r0, _0801E348 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801E326
	ldr r1, _0801E34C @ =gUnknown_03005590
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E326:
	ldr r3, _0801E350 @ =gHBlankCallbacks
	ldr r2, _0801E354 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E358 @ =HBlankCB_BgUpdateZoneFinalActXX
	str r1, [r0]
	ldr r2, _0801E35C @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E348: .4byte gPlayer
_0801E34C: .4byte gUnknown_03005590
_0801E350: .4byte gHBlankCallbacks
_0801E354: .4byte gNumHBlankCallbacks
_0801E358: .4byte HBlankCB_BgUpdateZoneFinalActXX
_0801E35C: .4byte gFlags
