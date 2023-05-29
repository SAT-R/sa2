.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80596C4
sub_80596C4: @ 0x080596C4
	push {r4, r5, lr}
	ldr r3, _0805970C @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	adds r1, #0xc
	adds r4, r0, r1
	ldr r5, _08059710 @ =IWRAM_START + 0x5A
	adds r1, r0, r5
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080596FA
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r2, #0x54]
	adds r0, #8
	ldr r1, _08059714 @ =0x000003FF
	ands r0, r1
	str r0, [r2, #0x54]
	ldr r1, [r3]
	ldr r0, _08059718 @ =sub_80594E0
	str r0, [r1, #8]
_080596FA:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805970C: .4byte gCurTask
_08059710: .4byte IWRAM_START + 0x5A
_08059714: .4byte 0x000003FF
_08059718: .4byte sub_80594E0
