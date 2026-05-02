.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	ldr r0, _08035534 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1     @ r5 = boss_44
	ldrh r0, [r2]
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r3, r0, r1     @ r3 = boss
	adds r4, r5, #0     @ r4 = s
	ldrh r0, [r4, #0x30]
	subs r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08035538
	ldrh r0, [r4, #0x30]
	lsls r0, r0, #8
	asrs r0, r0, #6
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0x63
	asrs r0, r0, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _08035542
	.align 2, 0
_08035534: .4byte gCurTask
_08035538:
	movs r1, #0x63
	movs r0, #0x3c
	strh r0, [r4, #0x30]
	ldr r0, _08035580 @ =Task_8035588
	str r0, [r2, #8]
_08035542:
	adds r0, r3, #0
	adds r0, #0x80
	ldrh r0, [r0]
	strh r0, [r5, #0x3c]
	adds r0, r3, #0
	adds r0, #0x82
	ldrh r0, [r0]
	strh r0, [r5, #0x3e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	ldr r3, _08035584 @ =gCamera
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
_08035580: .4byte Task_8035588
_08035584: .4byte gCamera

.syntax divided
