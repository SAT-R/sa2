.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, lr}
	ldr r3, _08027640 @ =gCurTask
	ldr r2, [r3]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	mov ip, r4
	ldr r5, _08027644 @ =0x03000030
	adds r4, r0, r5
	ldrh r0, [r2]
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	movs r1, #0
	strh r1, [r4]
	ldr r1, _08027648 @ =0x03000094
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r5, r3, #0
	cmp r0, #0
	bge _08027650
	ldr r3, _0802764C @ =0xFFFFFE00
	adds r0, r3, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08027658
	strh r1, [r4]
	b _08027658
	.align 2, 0
_08027640: .4byte gCurTask
_08027644: .4byte 0x03000030
_08027648: .4byte 0x03000094
_0802764C: .4byte 0xFFFFFE00
_08027650:
	cmp r0, #0
	ble _08027658
	rsbs r0, r1, #0
	strh r0, [r4]
_08027658:
	ldr r1, _080276C0 @ =gSpriteTransformRotation
	ldrh r0, [r1]
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
	ldr r3, _080276C4 @ =gSineTable
	ldrh r2, [r1]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r2, r0, #1
	adds r2, r2, r0
	ldr r3, _080276C8 @ =gSpriteTransformX
	ldr r4, _080276CC @ =gCamera
	ldrh r0, [r4]
	ldrh r3, [r3]
	adds r0, r0, r3
	asrs r1, r1, #9
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _080276D0 @ =gSpriteTransformY
	ldrh r0, [r4, #2]
	ldrh r3, [r3]
	adds r0, r0, r3
	asrs r2, r2, #9
	adds r2, r2, r0
	mov r0, ip
	strh r1, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, #0x78
	cmp r1, r0
	bge _080276D4
	mov r1, ip
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #2
	b _080276DC
	.align 2, 0
_080276C0: .4byte gSpriteTransformRotation
_080276C4: .4byte gSineTable
_080276C8: .4byte gSpriteTransformX
_080276CC: .4byte gCamera
_080276D0: .4byte gSpriteTransformY
_080276D4:
	mov r1, ip
	adds r1, #0x4c
	movs r0, #0xfe
	lsls r0, r0, #8
_080276DC:
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x4e
	movs r1, #0
	movs r0, #0xfa
	lsls r0, r0, #8
	strh r0, [r2]
	mov r3, ip
	str r1, [r3, #0x44]
	str r1, [r3, #0x48]
	mov r0, ip
	adds r0, #0x40
	strh r1, [r0]
	mov r1, ip
	adds r1, #0x42
	movs r0, #0x2a
	strh r0, [r1]
	ldr r1, [r5]
	ldr r0, _08027710 @ =Task_8027714
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027710: .4byte Task_8027714

.syntax divided
