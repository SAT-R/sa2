.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageBgUpdateZone7ActBoss
StageBgUpdateZone7ActBoss: @ 0x0801E2E0
	push {lr}
	ldr r0, _0801E304 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E308 @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E2F6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E2F6:
	ldr r0, [r1]
	ldr r1, _0801E30C @ =0x000003B1
	bl sub_801D9D4
	pop {r0}
	bx r0
	.align 2, 0
_0801E304: .4byte gPlayer
_0801E308: .4byte gUnknown_03005590
_0801E30C: .4byte 0x000003B1
