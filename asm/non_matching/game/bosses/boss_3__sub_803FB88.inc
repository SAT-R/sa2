.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_804124C
	movs r7, #0             @ r7 = discY
	movs r6, #0             @ r6 = i
_0803FB96:
	lsls r2, r6, #3
	adds r0, r5, #0
	adds r0, #0xc
	adds r3, r0, r2
	ldr r1, _0803FC08 @ =gUnknown_080D7BDC
	lsls r0, r6, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r3]
	cmp r6, #0
	bne _0803FBB8
	ldr r0, [r5, #0x10]
	adds r0, #6
	str r0, [r5, #0x10]
_0803FBB8:
	adds r4, r5, #0
	adds r4, #0x10
	adds r4, r4, r2
	ldr r1, [r4]
	adds r7, r7, r1
	asrs r0, r1, #8
	subs r0, #1
	ldr r1, [r3]
	asrs r1, r1, #8
	ldr r2, _0803FC0C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r0, #1
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0803FB96
	adds r0, r7, #0
	movs r1, #3
	bl Div
	ldr r2, _0803FC10 @ =0xFFFFFE00
	adds r1, r0, r2
	ldr r0, [r5, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
	str r1, [r5, #4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FC08: .4byte gUnknown_080D7BDC
_0803FC0C: .4byte sub_801EC3C
_0803FC10: .4byte 0xFFFFFE00

.syntax divided
