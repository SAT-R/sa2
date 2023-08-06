.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZone1ActBoss
StageBgUpdateZone1ActBoss: @ 0x0801E134
	push {lr}
	ldr r3, _0801E184 @ =gCamera
	ldr r0, _0801E188 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E18C @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E14C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E14C:
	ldr r2, _0801E190 @ =gBgScrollRegs
	ldr r0, [r1]
	adds r0, #4
	lsrs r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r3, #4]
	asrs r0, r0, #9
	strh r0, [r2, #2]
	ldr r3, _0801E194 @ =gHBlankCallbacks
	ldr r2, _0801E198 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E19C @ =HBlankCB_801E434
	str r1, [r0]
	ldr r2, _0801E1A0 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E184: .4byte gCamera
_0801E188: .4byte gPlayer
_0801E18C: .4byte gUnknown_03005590
_0801E190: .4byte gBgScrollRegs
_0801E194: .4byte gHBlankCallbacks
_0801E198: .4byte gNumHBlankCallbacks
_0801E19C: .4byte HBlankCB_801E434
_0801E1A0: .4byte gFlags
