.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08027268 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r7, r0
	adds r5, r6, #0
	ldr r2, _0802726C @ =0x03000030
	adds r1, r7, r2
	movs r0, #0
	strh r0, [r1]
	ldr r3, _08027270 @ =0x03000050
	adds r3, r3, r7
	mov ip, r3
	ldrb r4, [r3]
	ldr r2, _08027274 @ =gSineTable
	ldr r0, _08027278 @ =gSpriteTransformRotation
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #4
	adds r3, r4, #0
	muls r3, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r2, r4, #0
	muls r2, r0, r2
	ldr r1, _0802727C @ =gSpriteTransformX
	ldr r4, _08027280 @ =gCamera
	ldrh r0, [r4]
	ldrh r1, [r1]
	adds r0, r0, r1
	asrs r3, r3, #0xe
	adds r3, r3, r0
	ldr r1, _08027284 @ =gSpriteTransformY
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	asrs r2, r2, #0xe
	adds r2, r2, r0
	strh r3, [r6, #0x3c]
	strh r2, [r6, #0x3e]
	mov r3, ip
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	mov r3, r8
	cmp r0, #0
	beq _0802728C
	ldr r0, _08027288 @ =0x0300004C
	adds r1, r7, r0
	movs r0, #0x80
	lsls r0, r0, #2
	b _08027294
	.align 2, 0
_08027268: .4byte gCurTask
_0802726C: .4byte 0x03000030
_08027270: .4byte 0x03000050
_08027274: .4byte gSineTable
_08027278: .4byte gSpriteTransformRotation
_0802727C: .4byte gSpriteTransformX
_08027280: .4byte gCamera
_08027284: .4byte gSpriteTransformY
_08027288: .4byte 0x0300004C
_0802728C:
	ldr r2, _080272C8 @ =0x0300004C
	adds r1, r7, r2
	movs r0, #0xfe
	lsls r0, r0, #8
_08027294:
	strh r0, [r1]
	adds r2, r5, #0
	adds r2, #0x4e
	movs r1, #0
	movs r0, #0xfa
	lsls r0, r0, #8
	strh r0, [r2]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	adds r0, r5, #0
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, [r6, #0x10]
	subs r1, #0x21
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r1, [r3]
	ldr r0, _080272CC @ =Task_80272D0
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080272C8: .4byte 0x0300004C
_080272CC: .4byte Task_80272D0

.syntax divided
