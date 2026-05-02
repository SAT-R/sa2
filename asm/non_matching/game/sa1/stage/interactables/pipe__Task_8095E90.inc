.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08095FD4 @ =gCurTask
	ldr r0, [r1]
	mov ip, r0
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r2, [r0]
	mov sl, r2
	ldr r3, _08095FD8 @ =0x0300000C
	adds r3, r4, r3
	str r3, [sp]
	ldr r2, _08095FDC @ =0x0300003C
	adds r0, r4, r2
	ldrb r0, [r0]
	ldr r7, _08095FE0 @ =gPlayer
	cmp r0, #0
	beq _08095EC4
	ldr r7, _08095FE4 @ =gPartner
_08095EC4:
	mov r3, r8
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	mov r0, sl
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _08095FE8 @ =gCamera
	ldrh r0, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	lsls r0, r2, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [sp]
	strh r2, [r0, #0x16]
	ldrh r0, [r3, #2]
	subs r1, r1, r0
	ldr r2, [sp]
	strh r1, [r2, #0x18]
	ldr r3, _08095FEC @ =0x03000058
	adds r3, r3, r4
	mov sb, r3
	ldrb r0, [r3]
	cmp r0, #0
	bne _08095F10
	b _08096054
_08095F10:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08095F1C
	b _08096040
_08095F1C:
	adds r0, r7, #0
	adds r0, #0x6d
	str r0, [sp, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, _08095FF0 @ =0x0300003D
	adds r1, r1, r4
	mov sl, r1
	ldrb r2, [r1]
	cmp r0, r2
	beq _08095F36
	b _08096038
_08095F36:
	ldr r3, _08095FF4 @ =0x0300003F
	adds r5, r4, r3
	ldrb r1, [r5]
	mov r2, r8
	ldr r0, [r2, #0x48]
	muls r0, r1, r0
	subs r3, #1
	adds r4, r4, r3
	ldrb r1, [r4]
	bl Div
	adds r6, r0, #0
	ldrb r1, [r5]
	mov r2, r8
	ldr r0, [r2, #0x4c]
	muls r0, r1, r0
	ldrb r1, [r4]
	bl Div
	mov r3, r8
	ldr r2, [r3, #0x40]
	adds r2, r2, r6
	lsls r2, r2, #8
	str r2, [r7]
	ldr r1, [r3, #0x44]
	adds r1, r1, r0
	lsls r1, r1, #8
	str r1, [r7, #4]
	ldr r0, [r3, #0x54]
	subs r1, r1, r0
	strh r1, [r7, #0xa]
	ldr r0, [r3, #0x50]
	subs r2, r2, r0
	strh r2, [r7, #0xc]
	strh r2, [r7, #8]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r2, [r7]
	asrs r2, r2, #8
	ldr r0, [r3, #0x40]
	ldr r1, [r3, #0x48]
	adds r0, r0, r1
	cmp r2, r0
	bne _08095FFC
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [r3, #0x44]
	ldr r2, [r3, #0x4c]
	adds r1, r1, r2
	cmp r0, r1
	bne _08095FFC
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	mov r2, sl
	ldrb r2, [r2]
	cmp r0, r2
	bne _08095FC0
	ldr r0, [r7, #0x10]
	ldr r1, _08095FF8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _08095FE0 @ =gPlayer
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08095FC0:
	movs r0, #0
	mov r3, sb
	strb r0, [r3]
	adds r2, r7, #0
	adds r2, #0x26
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	b _0809602C
	.align 2, 0
_08095FD4: .4byte gCurTask
_08095FD8: .4byte 0x0300000C
_08095FDC: .4byte 0x0300003C
_08095FE0: .4byte gPlayer
_08095FE4: .4byte gPartner
_08095FE8: .4byte gCamera
_08095FEC: .4byte 0x03000058
_08095FF0: .4byte 0x0300003D
_08095FF4: .4byte 0x0300003F
_08095FF8: .4byte 0xFFBFFFFF
_08095FFC:
	adds r0, r7, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x40
	movs r0, #5
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r7, #0xe]
	movs r0, #0xe
	strb r0, [r7, #0xf]
	mov r1, r8
	adds r1, #0x58
	movs r0, #1
	strb r0, [r1]
_0809602C:
	ldr r0, [r7]
	mov r1, r8
	str r0, [r1, #0x50]
	ldr r0, [r7, #4]
	str r0, [r1, #0x54]
	b _080960DC
_08096038:
	movs r3, #0
	mov r2, sb
	strb r3, [r2]
	b _080960DC
_08096040:
	movs r1, #0
	mov r0, sb
	strb r1, [r0]
	ldr r0, [r7, #0x10]
	ldr r1, _08096050 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r7, #0x10]
	b _080960DC
	.align 2, 0
_08096050: .4byte 0xFFBFFFFF
_08096054:
	ldr r0, _080960CC @ =Task_PipeEntrance
	mov r2, ip
	str r0, [r2, #8]
	lsls r0, r5, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x10
	adds r0, r0, r3
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809607E
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0809607E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080960DC
_0809607E:
	mov r0, r8
	adds r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	beq _080960B0
	adds r0, r7, #0
	adds r0, #0x6d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r0, r1
	bne _080960B0
	ldr r0, [r7, #0x10]
	ldr r1, _080960D0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _080960D4 @ =gPlayer
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_080960B0:
	mov r0, r8
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _080960C2
	mov r1, r8
	ldrb r0, [r1, #8]
	mov r2, sl
	strb r0, [r2]
_080960C2:
	ldr r3, _080960D8 @ =gCurTask
	ldr r0, [r3]
	bl TaskDestroy
	b _080960F2
	.align 2, 0
_080960CC: .4byte Task_PipeEntrance
_080960D0: .4byte 0xFFBFFFFF
_080960D4: .4byte gPlayer
_080960D8: .4byte gCurTask
_080960DC:
	ldr r0, [sp]
	bl UpdateSpriteAnimation
	mov r0, r8
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _080960F2
	ldr r0, [sp]
	bl DisplaySprite
_080960F2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
