.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, _0802A554 @ =gUnknown_030055F0+0xC
	mov sl, r0
	mov r7, sl
	subs r7, #0xc
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	mov r8, r1
	movs r5, #0x90
	lsls r5, r5, #2
	adds r1, r1, r5
	mov sb, r1
	ldr r0, [r6]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
	lsls r4, r4, #8
	lsrs r4, r4, #0x10
	ldr r0, [r6, #4]
	mov r3, sb
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r5, #0
	bl __divsi3
	lsls r0, r0, #8
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0
	movs r1, #0x50
	asrs r0, r0, #0x10
	subs r1, r1, r0
	adds r4, #0x78
	ldr r0, _0802A558 @ =gUnknown_03005780
	ldrh r0, [r0, #4]
	adds r4, r4, r0
	strh r4, [r6, #0xc]
	ldr r3, _0802A558 @ =gUnknown_03005780
	ldrh r0, [r3, #6]
	subs r1, r1, r0
	strh r1, [r6, #0xe]
	mov r0, sl
	strh r4, [r0, #0x16]
	strh r1, [r0, #0x18]
	strh r4, [r7, #6]
	strh r1, [r7, #8]
	strh r2, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	add r8, r1
	mov r3, r8
	strh r3, [r7, #2]
	strh r3, [r7, #4]
	ldr r0, _0802A55C @ =0x00002020
	mov r1, sl
	str r0, [r1, #0x10]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A554: .4byte gUnknown_030055F0+0xC
_0802A558: .4byte gUnknown_03005780
_0802A55C: .4byte 0x00002020

.syntax divided
