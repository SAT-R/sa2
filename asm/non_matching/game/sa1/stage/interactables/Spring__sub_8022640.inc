.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0          @ r8 = s
	adds r7, r1, #0     @ r7 = me
	adds r4, r3, #0     @ r4 = p
	movs r0, #0         @ r2 = spring
	mov sb, r0          @ sb = sb = r0 = 0
	movs r6, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10  @ r3 = worldX
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _08022764 @ =gCamera
	ldrh r0, [r2]
	lsrs r5, r3, #0x10
	mov sl, r5          @ sl = worldX
	asrs r3, r3, #0x10
	subs r3, r3, r0
	mov r0, r8
	strh r3, [r0, #0x16]
	ldrh r0, [r2, #2]
	lsrs r2, r1, #0x10
	mov ip, r2          @ ip = worldY
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r5, r8          @ r5 = r8 = s
	strh r1, [r5, #0x18]
	ldr r0, _08022768 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _0802269A
	ldr r3, [r4, #0x10]
	cmp r0, #5
	bne _080226E2
_0802269A:
	movs r2, #0
	ldr r1, _0802276C @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	ldr r3, [r4, #0x10]
	cmp r0, #0
	beq _080226E2
	adds r5, r1, #0
_080226A8:
	ldr r0, _08022770 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r2, r0
	beq _080226CE   @ if(i != SIO_MULTI_CNT->id)
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080226CE
	movs r6, #1
_080226CE:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _080226E2
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	bne _080226A8
_080226E2:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r3, r0
	cmp r3, #0
	beq _080226F2
	cmp r6, #0
	bne _080226F2
	b _080227F2
_080226F2:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	mov r2, ip          @ r2 = ip = worldY
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl Coll_Player_Platform
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _08022724
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl Coll_AmyHammer_Spring
	mov sb, r0
	cmp r0, #0
	beq _080227F2
_08022724:
	ldr r0, _08022768 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _08022730
	cmp r0, #5
	bne _08022734
_08022730:
	movs r0, #2
	strh r0, [r4, #0x1c]
_08022734:
	adds r0, r4, #0
	bl sa2__sub_8021BE0
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08022774 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0
	strb r0, [r1]
	ldrb r2, [r7, #3]
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #3
	ble _08022778
	ldrb r0, [r7, #4]
	lsls r0, r0, #4
	b _08022784
	.align 2, 0
_08022764: .4byte gCamera
_08022768: .4byte gGameMode
_0802276C: .4byte gMultiplayerPlayerTasks
_08022770: .4byte 0x04000128
_08022774: .4byte 0xFFFFFEFF
_08022778:
	ldr r0, _080227B0 @ =sData0Accel
	movs r1, #3
	ands r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_08022784:
	rsbs r0, r0, #0
	strh r0, [r4, #0xa]
	mov r5, sb
	cmp r5, #0
	beq _08022798
	ldrh r1, [r4, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	adds r0, r0, r1
	strh r0, [r4, #0xa]
_08022798:
	ldrb r1, [r7, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080227B4
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x15
	b _080227C0
	.align 2, 0
_080227B0: .4byte sData0Accel
_080227B4:
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x11
_080227C0:
	strb r0, [r1]
	ldr r0, [r4, #0x64]
	adds r0, #0x2d
	movs r1, #0xff
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	movs r0, #0xaa
	bl m4aSongNumStart
	movs r0, #1
	b _080227F4
_080227F2:
	movs r0, #0
_080227F4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
