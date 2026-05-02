.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	ldr r0, _080353A0 @ =gCurTask
	ldr r3, [r0]
	ldrh r2, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	ldrh r0, [r3]
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r6, r0, r1
	adds r4, r5, #0
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080353A4
	adds r1, #0x40
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r2, r0, #1
	adds r1, r2, #0
	adds r1, #0x15
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #8
	asrs r0, r0, #6
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	subs r0, #0x23
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080353C0
	.align 2, 0
_080353A0: .4byte gCurTask
_080353A4:
	ldr r1, _08035400 @ =0x03000040
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x11
	movs r2, #0x8c
	lsls r2, r2, #0xe
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	adds r1, #8
	strh r1, [r4, #0x30]
	ldr r0, _08035404 @ =Task_803540C
	str r0, [r3, #8]
_080353C0:
	adds r0, r6, #0
	adds r0, #0x80
	ldrh r0, [r0]
	strh r0, [r5, #0x3c]
	adds r0, r6, #0
	adds r0, #0x82
	ldrh r0, [r0]
	strh r0, [r5, #0x3e]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	ldr r3, _08035408 @ =gCamera
	ldrh r2, [r3]
	movs r6, #0x3c
	ldrsh r0, [r5, r6]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldrh r0, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035400: .4byte 0x03000040
_08035404: .4byte Task_803540C
_08035408: .4byte gCamera

.syntax divided
