.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080354D8 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r6, r1, r2
	ldrh r0, [r0]
	adds r0, r0, r2
	ldrh r4, [r0, #6]
	adds r2, #0x40
	adds r1, r1, r2
	ldrb r0, [r1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #0x11
	movs r3, #0xd0
	lsls r3, r3, #0xc
	adds r1, r1, r3
	asrs r1, r1, #0x10
	ldr r5, _080354DC @ =gSineTable
	ldr r0, _080354E0 @ =0x0300008A
	adds r3, r4, r0
	movs r2, #0
	ldrsh r0, [r3, r2]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r2, r1, #0
	muls r2, r0, r2
	lsls r2, r2, #2
	ldrh r3, [r3]
	ldr r0, _080354E4 @ =0x000001FF
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r5, _080354E8 @ =0x03000080
	adds r1, r4, r5
	ldrh r3, [r1]
	strh r3, [r6, #0x3c]
	adds r5, #2
	adds r1, r4, r5
	ldrh r1, [r1]
	strh r1, [r6, #0x3e]
	asrs r2, r2, #0x10
	adds r2, r2, r3
	asrs r0, r0, #0x10
	adds r0, #0x16
	adds r1, r1, r0
	ldr r3, _080354EC @ =gCamera
	ldrh r0, [r3]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	ldrh r0, [r3, #2]
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	ldr r0, _080354F0 @ =0x03000086
	adds r4, r4, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #3
	ble _080354CE
	ldrh r0, [r6, #0x30]
	subs r0, #1
	strh r0, [r6, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080354CE
	lsls r0, r7, #8
	lsls r1, r5, #8
	bl sub_8017540
	mov r1, r8
	ldr r0, [r1]
	bl TaskDestroy
_080354CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080354D8: .4byte gCurTask
_080354DC: .4byte gSineTable
_080354E0: .4byte 0x0300008A
_080354E4: .4byte 0x000001FF
_080354E8: .4byte 0x03000080
_080354EC: .4byte gCamera
_080354F0: .4byte 0x03000086

.syntax divided
