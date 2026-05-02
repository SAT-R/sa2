.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r0, _0803534C @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldrh r0, [r2]
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r7, r0, r1
	adds r4, r3, #0
	ldrh r0, [r4, #0x30]
	cmp r0, #0
	beq _080352EA
	subs r0, #1
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #8
	lsrs r5, r0, #0xb
_080352EA:
	lsls r1, r5, #0x10
	rsbs r1, r1, #0
	adds r0, r7, #0
	adds r0, #0x80
	ldrh r0, [r0]
	strh r0, [r3, #0x3c]
	adds r0, r7, #0
	adds r0, #0x82
	ldrh r0, [r0]
	strh r0, [r3, #0x3e]
	asrs r1, r1, #0x10
	adds r1, r1, r0
	ldr r2, _08035350 @ =gCamera
	ldrh r0, [r2]
	movs r5, #0x3c
	ldrsh r6, [r3, r5]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldrh r0, [r2, #2]
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	adds r0, r7, #0
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08035346
	lsls r0, r6, #8
	adds r1, r5, #0
	adds r1, #0x14
	lsls r1, r1, #8
	bl sub_8017540
	ldr r0, _0803534C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08035346:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803534C: .4byte gCurTask
_08035350: .4byte gCamera

.syntax divided
