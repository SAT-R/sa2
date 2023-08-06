.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZone2ActBoss
StageBgUpdateZone2ActBoss: @ 0x0801E1A4
	push {lr}
	ldr r0, _0801E1C8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E1CC @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E1BA
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E1BA:
	ldr r0, [r1]
	movs r1, #0xfa
	lsls r1, r1, #4
	bl StageBgUpdateZone2Acts12
	pop {r0}
	bx r0
	.align 2, 0
_0801E1C8: .4byte gPlayer
_0801E1CC: .4byte gUnknown_03005590
