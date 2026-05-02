.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r0, _080879D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	str r0, [sp, #0x24] @ sp24 = hook
	ldr r0, _080879DC @ =0x0300000C
	adds r0, r0, r4
	mov sb, r0          @ sb = s1
	ldr r1, _080879E0 @ =0x0300009C
	adds r1, r4, r1
	str r1, [sp]        @ sp00 = transform
	ldr r2, _080879E4 @ =0x0300003C
	adds r7, r4, r2     @ r7 = s2
	ldr r3, _080879E8 @ =0x0300006C
	adds r3, r3, r4
	mov r8, r3          @ r8 = s3
	ldr r5, [sp, #0x24] @ r5 = sp24 = hook
	ldr r5, [r5]        @ r5 = me
	str r5, [sp, #0x20] @ sp20 = me
	movs r0, #0
	str r0, [sp, #0x18] @ sp18 = 0
	movs r1, #0
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x24] @ r2 = sp24 = hook
	ldrb r0, [r2, #8]
	lsls r0, r0, #3
	ldrh r1, [r2, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]    @ sp04 = worldX
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	ldrh r1, [r2, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]  @ sp0C = worldY
	ldr r3, [sp, #4]
	str r3, [sp, #8]    @ sp08 = worldX
	str r0, [sp, #0x10] @ sp10 = worldY
	ldr r0, _080879EC @ =gStageTime
	ldr r0, [r0]
	lsls r0, r0, #3
	movs r1, #3
	bl Div
	ldr r5, _080879F0 @ =0x030000B2
	adds r4, r4, r5
	ldrh r1, [r4]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	bl Mod
	adds r5, r0, #0 @ r5 = modRes = Mod(Div(gStageTime * 8, 3) + hook->qUnkB2, Q(2));
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	bls _080879FC
	ldr r1, _080879F4 @ =0xFFFFFF00
	adds r5, r5, r1
	subs r5, r0, r5
	ldr r0, _080879F8 @ =gSineTable
	lsls r1, r5, #2
	adds r1, r1, r0
	ldrh r1, [r1]
	lsrs r2, r1, #8
	adds r3, r0, #0     @ r3 = r0 = gSineTable
	b _08087A10
	.align 2, 0
_080879D8: .4byte gCurTask
_080879DC: .4byte 0x0300000C
_080879E0: .4byte 0x0300009C
_080879E4: .4byte 0x0300003C
_080879E8: .4byte 0x0300006C
_080879EC: .4byte gStageTime
_080879F0: .4byte 0x030000B2
_080879F4: .4byte 0xFFFFFF00
_080879F8: .4byte gSineTable
_080879FC:
	ldr r1, _08087A2C @ =gSineTable
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r3, r1, #0     @ r3 = r1 = gSineTable
_08087A10:
	adds r0, r5, #0
	subs r0, #0x7e
	ldr r1, _08087A30 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x17
	ands r5, r1
	cmp r5, #0xff
	bhi _08087A34
	lsrs r5, r5, #1
	b _08087A3E
	.align 2, 0
_08087A2C: .4byte gSineTable
_08087A30: .4byte 0x000001FF
_08087A34:
	movs r1, #0x80
	lsls r1, r1, #2
	subs r0, r1, r5
	lsrs r0, r0, #1
	subs r5, r1, r0
_08087A3E:
	lsls r5, r5, #1
	mov ip, r5          @ ip = r5 = modRes
	ldr r0, _08087B24 @ =0x000003FF
	ands r0, r5
	lsls r1, r0, #1
	adds r1, r1, r3
	movs r5, #0
	ldrsh r4, [r1, r5]
	str r4, [sp, #0x14] @ sp14 = sinVal = SIN(modRes & ONE_CYCLE)
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov sl, r1          @ sl = cosVal = SIN(modRes & ONE_CYCLE)
	ldr r6, _08087B28 @ =gCamera
	ldrh r0, [r6]
	ldr r5, [sp, #4]  @ r5 = sp04 = worldX
	lsls r4, r5, #0x10
	asrs r2, r4, #0x10
	subs r0, r2, r0
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #2]
	ldr r5, [sp, #0xc]  @ r5 = sp0C = worldY
	lsls r3, r5, #0x10
	asrs r1, r3, #0x10
	subs r0, r1, r0
	mov r5, sb
	strh r0, [r5, #0x18]
	ldrh r0, [r6]
	subs r2, r2, r0
	mov r0, r8          @ r0 = r8 = s3
	strh r2, [r0, #0x16]
	ldrh r0, [r6, #2]
	subs r1, r1, r0
	subs r1, #8
	mov r2, r8          @ r2 = r8 = s3
	strh r1, [r2, #0x18]
	ldr r5, [sp, #8]    @ r5 = sp08 = worldX
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	str r4, [sp, #0x2c] @ sp2C = worldX << 16
	str r3, [sp, #0x30] @ sp30 = worldY << 16
	mov r3, ip          @ r3 = ip = modRes
	str r3, [sp, #0x28]
	cmp r2, r0
	bgt _08087AD8
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08087AD8
	ldr r4, [sp, #0x10] @ r4 = sp10 = worldY
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	movs r5, #2
	ldrsh r1, [r6, r5]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08087AD8
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08087AD8
	b _08087CE4
_08087AD8:
	mov r4, sb
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08087B00
	movs r5, #0x18
	ldrsh r0, [r4, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _08087B00
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	bgt _08087B00
	b _08087CE4
_08087B00:
	movs r4, #0
	ldr r5, _08087B2C @ =gPartner
	ldr r6, _08087B30 @ =gPlayer
	movs r1, #0x59
	adds r1, r1, r5
	mov sl, r1          @ sl = &gPartner->character
	movs r2, #0x40
	adds r2, r2, r5
	mov r8, r2          @ r8 = &gPartner->charState
	movs r7, #0         @ r7 = 0
_08087B14_loop:
	cmp r4, #0
	beq _08087B34
	ldr r0, [r5, #0x10]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08087B40
	b _08087CB0
	.align 2, 0
_08087B24: .4byte 0x000003FF
_08087B28: .4byte gCamera
_08087B2C: .4byte gPartner
_08087B30: .4byte gPlayer
_08087B34:
	ldr r0, [r6, #0x10]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08087B40
	b _08087CB0
_08087B40:
	cmp r4, #0
	beq _08087B4C
	ldr r0, [r5, #0x28]
	cmp r0, sb
	beq _08087B54
	b _08087CB0
_08087B4C:
	ldr r0, [r6, #0x28]
	cmp r0, sb
	beq _08087B54
	b _08087CB0
_08087B54:
	ldr r0, _08087B70 @ =gPlayer
	cmp r4, #0
	beq _08087B5C
	ldr r0, _08087B74 @ =gPartner
_08087B5C:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r4, #0
	beq _08087B7C
	ldr r0, [r5, #0x10]
	ldr r1, _08087B78 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08087B84
	.align 2, 0
_08087B70: .4byte gPlayer
_08087B74: .4byte gPartner
_08087B78: .4byte 0xFFBFFFFF
_08087B7C:
	ldr r0, [r6, #0x10]
	ldr r1, _08087B94 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08087B84:
	ldr r3, _08087B98 @ =gPlayer
	cmp r4, #0
	beq _08087B9C
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08087BA4
	.align 2, 0
_08087B94: .4byte 0xFFBFFFFF
_08087B98: .4byte gPlayer
_08087B9C:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_08087BA4:
	cmp r4, #0
	beq _08087BB4
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _08087BBE
_08087BB4:
	ldr r0, [r6, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08087BBE:
	cmp r4, #0
	beq _08087BC6
	str r7, [r5, #0x28]
	b _08087BC8
_08087BC6:
	str r4, [r3, #0x28]
_08087BC8:
	cmp r4, #0
	beq _08087BD0
	strh r7, [r5, #8]
	b _08087BD2
_08087BD0:
	strh r4, [r3, #8]
_08087BD2:
	cmp r4, #0
	beq _08087BDA
	strh r7, [r5, #0xc]
	b _08087BDC
_08087BDA:
	strh r4, [r3, #0xc]
_08087BDC:
	cmp r4, #0
	beq _08087BE4
	strh r7, [r5, #0xa]
	b _08087BE6
_08087BE4:
	strh r4, [r3, #0xa]
_08087BE6:
	cmp r4, #0
	beq _08087BF6
	mov r1, sl          @ r1 = sl = gPartner->character
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	bne _08087C04
	b _08087C5C
_08087BF6:
	adds r0, r3, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _08087C5C
_08087C04:
	cmp r4, #0
	beq _08087C12
	ldr r0, [r5, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08087C1A
_08087C12:
	ldr r0, [r6, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_08087C1A:
	cmp r4, #0
	beq _08087C26
	movs r0, #5
	mov r2, r8
	strb r0, [r2]
	b _08087C2E
_08087C26:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #5
	strb r0, [r1]
_08087C2E:
	ldr r0, _08087C54 @ =gPlayer
	cmp r4, #0
	beq _08087C36
	ldr r0, _08087C58 @ =gPartner
_08087C36:
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08087C54 @ =gPlayer
	cmp r4, #0
	beq _08087C44
	ldr r1, _08087C58 @ =gPartner
_08087C44:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08087C54 @ =gPlayer
	cmp r4, #0
	beq _08087C50
	ldr r1, _08087C58 @ =gPartner
_08087C50:
	movs r0, #9
	b _08087CAE
	.align 2, 0
_08087C54: .4byte gPlayer
_08087C58: .4byte gPartner
_08087C5C:
	cmp r4, #0
	beq _08087C6C
	ldr r0, [r5, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _08087C76
_08087C6C:
	ldr r0, [r6, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08087C76:
	cmp r4, #0
	beq _08087C82
	movs r0, #0x55
	mov r3, r8
	strb r0, [r3]
	b _08087C8A
_08087C82:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #0x55
	strb r0, [r1]
_08087C8A:
	ldr r0, _08087CD4 @ =gPlayer
	cmp r4, #0
	beq _08087C92
	ldr r0, _08087CD8 @ =gPartner
_08087C92:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08087CD4 @ =gPlayer
	cmp r4, #0
	beq _08087CA0
	ldr r1, _08087CD8 @ =gPartner
_08087CA0:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08087CD4 @ =gPlayer
	cmp r4, #0
	beq _08087CAC
	ldr r1, _08087CD8 @ =gPartner
_08087CAC:
	movs r0, #0xe
_08087CAE:
	strb r0, [r1, #0xf]
_08087CB0:
	adds r4, #1
	ldr r0, _08087CDC @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bge _08087CC0
	b _08087B14_loop
_08087CC0:
	ldr r4, [sp, #0x24] @ r4 = sp24 = hook
	ldrb r0, [r4, #8]
	ldr r5, [sp, #0x20] @ r5 = sp20 = me
	strb r0, [r5]
	ldr r0, _08087CE0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08088350
	.align 2, 0
_08087CD4: .4byte gPlayer
_08087CD8: .4byte gPartner
_08087CDC: .4byte gNumSingleplayerCharacters
_08087CE0: .4byte gCurTask
_08087CE4:
	mov r0, r8
	bl DisplaySprite
	movs r4, #0
	ldr r0, [sp, #0x24] @ r0 = sp24 = hook
	adds r0, #0xb4
	mov r8, r0              @ r8 = &hook->unkB4
	movs r5, #0x5a          @ r5 = 90
	ldr r6, _08087D40 @ =gCamera
_08087CF6_loop:
	ldr r1, [sp, #0x14]     @ r1 = sp14 = sinVal
	adds r0, r1, #0
	muls r0, r5, r0
	movs r1, #0x64
	bl Div
	ldr r2, [sp, #0x18]
	adds r2, r2, r0
	str r2, [sp, #0x18] @ sp18 += Div(sinVal * 90, 100);
	mov r0, sl              @ r0 = sl = cosVal
	muls r0, r5, r0
	movs r1, #0x64
	bl Div
	ldr r3, [sp, #0x1c]
	adds r3, r3, r0
	str r3, [sp, #0x1c] @ sp1C += Div(cosVal * 90, 100);
	ldrh r1, [r6]
	ldr r2, [sp, #0x2c] @ r2 = sp2C = worldX << 16
	asrs r0, r2, #0x10
	subs r0, r0, r1
	ldr r3, [sp, #0x18]
	asrs r1, r3, #0xa
	adds r0, r0, r1
	strh r0, [r7, #0x16]
	ldrh r1, [r6, #2]
	ldr r2, [sp, #0x30] @ r2 = sp30 = worldY << 16
	asrs r0, r2, #0x10
	subs r0, r0, r1
	ldr r3, [sp, #0x1c]
	asrs r1, r3, #0xa
	adds r0, r0, r1
	strh r0, [r7, #0x18]
	cmp r4, #4
	bne _08087D44
	movs r0, #0xc0
	b _08087D48
	.align 2, 0
_08087D40: .4byte gCamera
_08087D44:
	movs r0, #0x90
	lsls r0, r0, #3
_08087D48:
	strh r0, [r7, #0x1a]
	adds r0, r7, #0
	bl DisplaySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08087CF6_loop
	movs r4, #0x6e
	ldr r5, [sp, #0x14]
	adds r0, r5, #0
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	ldr r1, [sp, #0x18]
	adds r1, r1, r0
	str r1, [sp, #0x18]
	mov r0, sl
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	ldr r2, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x1c]
	movs r5, #0
	ldr r4, _08087D90 @ =gPartner
	ldr r6, _08087D94 @ =gPlayer
	mov sl, r5      @ sl = r5 = 0
	movs r7, #1
_08087D88_loop:
	cmp r5, #0
	beq _08087D98
	ldr r0, [r4, #0x10]
	b _08087D9A
	.align 2, 0
_08087D90: .4byte gPartner
_08087D94: .4byte gPlayer
_08087D98:
	ldr r0, [r6, #0x10]
_08087D9A:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087DA4
	b _08088230
_08087DA4:
	mov r3, r8
	ldrb r0, [r3]
	asrs r0, r5
	ands r0, r7
	cmp r0, #0
	bne _08087DB2
	b _080880B2
_08087DB2:
	ldr r0, [sp, #0x18]
	movs r1, #0xc3
	lsls r1, r1, #2
	bl Div
	ldr r2, [sp, #0x2c] @ r2 = sp2C = worldX << 16
	asrs r1, r2, #0x10
	adds r1, r1, r0
	subs r1, #4
	lsls r1, r1, #8
	cmp r5, #0
	beq _08087DCE
	str r1, [r4]
	b _08087DD0
_08087DCE:
	str r1, [r6]
_08087DD0:
	cmp r5, #0
	beq _08087DDE
	ldr r0, [r4, #0x10]
	ands r0, r7
	cmp r0, #0
	bne _08087DE6
	b _08087E00
_08087DDE:
	ldr r0, [r6, #0x10]
	ands r0, r7
	cmp r0, #0
	beq _08087E00
_08087DE6:
	cmp r5, #0
	beq _08087DF6
	ldr r0, [r4]
	movs r3, #0xa0
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [r4]
	b _08087E00
_08087DF6:
	ldr r0, [r6]
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r6]
_08087E00:
	ldr r0, [sp, #0x1c]
	movs r1, #0xaa
	lsls r1, r1, #2
	bl Div
	ldr r2, [sp, #0x30] @ r2 = sp30 = worldY << 16
	asrs r1, r2, #0x10
	adds r1, r1, r0
	adds r1, #2
	lsls r1, r1, #8
	cmp r5, #0
	beq _08087E1C
	str r1, [r4, #4]
	b _08087E1E
_08087E1C:
	str r1, [r6, #4]
_08087E1E:
	cmp r5, #0
	beq _08087E28
	mov r3, sl          @ r3 = sl = 0
	strb r3, [r4, #0x14]
	b _08087E2A
_08087E28:
	strb r5, [r6, #0x14]
_08087E2A:
	ldr r0, _08087E3C @ =gPlayerControls
	ldrh r1, [r0]
	cmp r5, #0
	beq _08087E40
	ldrh r0, [r4, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _08087E4A
	b _080880A4
	.align 2, 0
_08087E3C: .4byte gPlayerControls
_08087E40:
	ldrh r0, [r6, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _08087E4A
	b _080880A4
_08087E4A:
	ldr r0, _08087E64 @ =gPlayer
	cmp r5, #0
	beq _08087E52
	ldr r0, _08087E68 @ =gPartner
_08087E52:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _08087E70
	ldr r0, [r4, #0x10]
	ldr r1, _08087E6C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08087E78
	.align 2, 0
_08087E64: .4byte gPlayer
_08087E68: .4byte gPartner
_08087E6C: .4byte 0xFFBFFFFF
_08087E70:
	ldr r0, [r6, #0x10]
	ldr r1, _08087E88 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08087E78:
	ldr r3, _08087E8C @ =gPlayer
	cmp r5, #0
	beq _08087E90
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08087E98
	.align 2, 0
_08087E88: .4byte 0xFFBFFFFF
_08087E8C: .4byte gPlayer
_08087E90:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_08087E98:
	cmp r5, #0
	beq _08087EA8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08087EB2
_08087EA8:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r6, #0x10]
_08087EB2:
	cmp r5, #0
	beq _08087EBE
	movs r0, #0xfb
	lsls r0, r0, #8
	strh r0, [r4, #0xa]
	b _08087EC4
_08087EBE:
	movs r0, #0xfb
	lsls r0, r0, #8
	strh r0, [r3, #0xa]
_08087EC4:
	cmp r5, #0
	beq _08087ECE
	mov r0, sl          @ r0 = sl = 0
	str r0, [r4, #0x28]
	b _08087ED0
_08087ECE:
	str r5, [r3, #0x28]
_08087ED0:
	cmp r5, #0
	beq _08087EE0
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _08087EEA
_08087EE0:
	ldr r0, [r6, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08087EEA:
	cmp r5, #0
	beq _08087EF8
	ldr r2, _08087EF4 @ =gPartner + 0x26
	b _08087EFC
	.align 2, 0
_08087EF4: .4byte gPartner + 0x26
_08087EF8:
	adds r2, r3, #0
	adds r2, #0x26
_08087EFC:
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	cmp r5, #0
	beq _08087F14
	ldrh r0, [r4, #0x38]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08087F1E
	b _08087FB0
_08087F14:
	ldrh r0, [r3, #0x38]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08087FB0
_08087F1E:
	cmp r5, #0
	beq _08087F2E
	ldrh r0, [r4, #0x38]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08087F38
	b _08087F70
_08087F2E:
	ldrh r0, [r3, #0x38]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08087F70
_08087F38:
	cmp r5, #0
	beq _08087F44
	ldr r0, [r4, #0x10]
	orrs r0, r7
	str r0, [r4, #0x10]
	b _08087F4A
_08087F44:
	ldr r0, [r6, #0x10]
	orrs r0, r7
	str r0, [r6, #0x10]
_08087F4A:
	cmp r5, #0
	beq _08087F56
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #8]
	b _08087F5C
_08087F56:
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r3, #8]
_08087F5C:
	cmp r5, #0
	beq _08087F68
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0xc]
	b _08087FC8
_08087F68:
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r3, #0xc]
	b _08087FC8
_08087F70:
	cmp r5, #0
	beq _08087F80
	ldr r0, [r4, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _08087F8A
_08087F80:
	ldr r0, [r6, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08087F8A:
	cmp r5, #0
	beq _08087F96
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #8]
	b _08087F9C
_08087F96:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3, #8]
_08087F9C:
	cmp r5, #0
	beq _08087FA8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0xc]
	b _08087FC8
_08087FA8:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r3, #0xc]
	b _08087FC8
_08087FB0:
	cmp r5, #0
	beq _08087FBA
	mov r0, sl          @ r0 = sl = 0
	strh r0, [r4, #8]
	b _08087FBC
_08087FBA:
	strh r5, [r3, #8]
_08087FBC:
	cmp r5, #0
	beq _08087FC6
	mov r1, sl          @ r1 = sl = 0
	strh r1, [r4, #0xc]
	b _08087FC8
_08087FC6:
	strh r5, [r3, #0xc]
_08087FC8:
	cmp r5, #0
	beq _08087FDC
	ldr r2, _08087FD8 @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #3
	bne _08087FEA
	b _08088048
	.align 2, 0
_08087FD8: .4byte gPartner + 0x59
_08087FDC:
	adds r0, r3, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _08088048
_08087FEA:
	cmp r5, #0
	beq _08087FF8
	ldr r0, [r4, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08088000
_08087FF8:
	ldr r0, [r6, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_08088000:
	cmp r5, #0
	beq _08088010
	movs r0, #5
	ldr r3, _0808800C @ =gPartner + 0x40
	strb r0, [r3]
	b _08088018
	.align 2, 0
_0808800C: .4byte gPartner + 0x40
_08088010:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #5
	strb r0, [r1]
_08088018:
	ldr r0, _08088040 @ =gPlayer
	cmp r5, #0
	beq _08088020
	ldr r0, _08088044 @ =gPartner
_08088020:
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08088040 @ =gPlayer
	cmp r5, #0
	beq _0808802E
	ldr r1, _08088044 @ =gPartner
_0808802E:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08088040 @ =gPlayer
	cmp r5, #0
	beq _0808803A
	ldr r1, _08088044 @ =gPartner
_0808803A:
	movs r0, #9
	b _08088084
	.align 2, 0
_08088040: .4byte gPlayer
_08088044: .4byte gPartner
_08088048:
	cmp r5, #0
	beq _08088058
	movs r0, #0x55
	ldr r1, _08088054 @ =gPartner + 0x40
	b _0808805E
	.align 2, 0
_08088054: .4byte gPartner + 0x40
_08088058:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #0x55
_0808805E:
	strb r0, [r1]
	ldr r0, _0808809C @ =gPlayer
	cmp r5, #0
	beq _08088068
	ldr r0, _080880A0 @ =gPartner
_08088068:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _0808809C @ =gPlayer
	cmp r5, #0
	beq _08088076
	ldr r1, _080880A0 @ =gPartner
_08088076:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _0808809C @ =gPlayer
	cmp r5, #0
	beq _08088082
	ldr r1, _080880A0 @ =gPartner
_08088082:
	movs r0, #0xe
_08088084:
	strb r0, [r1, #0xf]
	ldr r0, [sp, #0x24] @ r0 = sp24 = hook
	adds r0, #0xb0
	adds r0, r0, r5
	movs r1, #0x14
	strb r1, [r0]
	adds r1, r7, #0
	lsls r1, r5
	mov r2, r8
	ldrb r0, [r2]
	bics r0, r1
	b _08088292
	.align 2, 0
_0808809C: .4byte gPlayer
_080880A0: .4byte gPartner
_080880A4:
	cmp r5, #0
	beq _080880AE
	mov r3, sl          @ r3 = sl = 0
	strh r3, [r4, #0xa]
	b _08088294_continue
_080880AE:
	strh r5, [r6, #0xa]
	b _08088294_continue
_080880B2:
	ldr r0, [sp, #0x24] @ r0 = sp24 = hook
	adds r0, #0xb0
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _080880C4
	subs r0, #1
	strb r0, [r1]
	b _08088294_continue
_080880C4:
	ldr r0, [sp, #0x18]
	ldr r1, _080880E4 @ =950
	bl Div
	ldr r2, [sp, #0x2c] @ r2 = sp2C = worldX << 16
	asrs r1, r2, #0x10
	adds r1, r1, r0
	subs r1, #0x10
	cmp r5, #0
	beq _080880E8
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _080880F2
	b _08088294_continue
	.align 2, 0
_080880E4: .4byte 0x000003B6
_080880E8:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	ble _080880F2
	b _08088294_continue
_080880F2:
	ldr r0, [sp, #0x18]
	ldr r1, _08088110 @ =950
	bl Div
	ldr r3, [sp, #0x2c] @ r3 = sp2C = worldX << 16
	asrs r1, r3, #0x10
	adds r1, r1, r0
	adds r1, #0x10
	cmp r5, #0
	beq _08088114
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808811E
	b _08088294_continue
	.align 2, 0
_08088110: .4byte 0x000003B6
_08088114:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808811E
	b _08088294_continue
_0808811E:
	ldr r0, [sp, #0x1c]
	ldr r1, _0808813C @ =950
	bl Div
	ldr r2, [sp, #0x30] @ r2 = sp30 = worldY << 16
	asrs r1, r2, #0x10
	adds r1, r1, r0
	subs r1, #0x10
	cmp r5, #0
	beq _08088140
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _0808814A
	b _08088294_continue
	.align 2, 0
_0808813C: .4byte 0x000003B6
_08088140:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _0808814A
	b _08088294_continue
_0808814A:
	ldr r0, [sp, #0x1c]
	ldr r1, _08088168 @ =950
	bl Div
	ldr r3, [sp, #0x30] @ r3 = sp30 = worldY << 16
	asrs r1, r3, #0x10
	adds r1, r1, r0
	adds r1, #0x10
	cmp r5, #0
	beq _0808816C
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08088176
	b _08088294_continue
	.align 2, 0
_08088168: .4byte 0x000003B6
_0808816C:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08088176
	b _08088294_continue
_08088176:
	adds r0, r7, #0
	lsls r0, r5
	mov r2, r8
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08088198 @ =gPlayer
	cmp r5, #0
	beq _0808818A
	ldr r0, _0808819C @ =gPartner
_0808818A:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _080881A0
	mov r3, sb
	str r3, [r4, #0x28]
	b _080881A4
	.align 2, 0
_08088198: .4byte gPlayer
_0808819C: .4byte gPartner
_080881A0:
	mov r0, sb
	str r0, [r6, #0x28]
_080881A4:
	cmp r5, #0
	beq _080881B2
	ldr r0, [r4, #0x10]
	movs r1, #8
	orrs r0, r1
	str r0, [r4, #0x10]
	b _080881BA
_080881B2:
	ldr r0, [r6, #0x10]
	movs r1, #8
	orrs r0, r1
	str r0, [r6, #0x10]
_080881BA:
	cmp r5, #0
	beq _080881CA
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	b _080881D4
_080881CA:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x10]
_080881D4:
	cmp r5, #0
	beq _080881DE
	mov r1, sl          @ r1 = sl = 0
	strh r1, [r4, #8]
	b _080881E0
_080881DE:
	strh r5, [r6, #8]
_080881E0:
	cmp r5, #0
	beq _080881EA
	mov r2, sl          @ r2 = sl = 0
	strh r2, [r4, #0xc]
	b _080881EC
_080881EA:
	strh r5, [r6, #0xc]
_080881EC:
	cmp r5, #0
	beq _080881F6
	mov r3, sl          @ r3 = sl = 0
	strh r3, [r4, #0xa]
	b _080881F8
_080881F6:
	strh r5, [r6, #0xa]
_080881F8:
	cmp r5, #0
	beq _08088208
	movs r0, #0x26
	ldr r1, _08088204 @ =gPartner + 0x40
	b _0808820E
	.align 2, 0
_08088204: .4byte gPartner + 0x40
_08088208:
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0x26
_0808820E:
	strb r0, [r1]
	cmp r5, #0
	beq _08088224
	ldr r2, _08088220 @ =gPartner + 0x26
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	b _08088292
	.align 2, 0
_08088220: .4byte gPartner + 0x26
_08088224:
	adds r2, r6, #0
	adds r2, #0x26
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	b _08088292
_08088230:
	mov r3, r8
	ldrb r0, [r3]
	asrs r0, r5
	ands r0, r7
	cmp r0, #0
	beq _08088294_continue
	cmp r5, #0
	beq _08088250
	ldr r0, [r4, #0x10]
	ldr r1, _0808824C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08088258
	.align 2, 0
_0808824C: .4byte 0xFFBFFFFF
_08088250:
	ldr r0, [r6, #0x10]
	ldr r1, _08088280 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088258:
	ldr r0, [sp, #0x24] @ r0 = sp24 = hook
	adds r0, #0xb0
	adds r0, r0, r5
	movs r1, #0x14
	strb r1, [r0]
	adds r1, r7, #0
	lsls r1, r5
	mov r2, r8
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	cmp r5, #0
	beq _08088288
	ldr r3, _08088284 @ =gPartner + 0x26
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _08088294_continue
	.align 2, 0
_08088280: .4byte 0xFFBFFFFF
_08088284: .4byte gPartner + 0x26
_08088288:
	adds r2, r6, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
_08088292:
	strb r0, [r2]
_08088294_continue:
	adds r5, #1
	ldr r0, _080882FC @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bge _080882A4
	b _08087D88_loop
_080882A4:
	ldr r4, _08088300 @ =0x000003FF
	adds r0, r4, #0
	ldr r5, [sp, #0x28]
	bics r0, r5
	ldr r1, [sp]
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	ldr r2, _08088304 @ =gCamera
	ldrh r1, [r2]
	ldr r3, [sp, #0x2c] @ r2 = sp2C = worldX << 16
	asrs r0, r3, #0x10
	subs r0, r0, r1
	ldr r4, [sp, #0x18]
	asrs r1, r4, #0xa
	adds r0, r0, r1
	ldr r5, [sp]
	strh r0, [r5, #6]
	ldrh r1, [r2, #2]
	ldr r2, [sp, #0x30] @ r2 = sp30 = worldY << 16
	asrs r0, r2, #0x10
	subs r0, r0, r1
	ldr r3, [sp, #0x1c]
	asrs r1, r3, #0xa
	adds r0, r0, r1
	strh r0, [r5, #8]
	ldr r4, [sp, #0x20]
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0808830C
	ldr r2, _08088308 @ =gOamMatrixIndex
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0xc
	movs r1, #0x7e
	orrs r0, r1
	mov r5, sb
	str r0, [r5, #0x10]
	b _08088320
	.align 2, 0
_080882FC: .4byte gNumSingleplayerCharacters
_08088300: .4byte 0x000003FF
_08088304: .4byte gCamera
_08088308: .4byte gOamMatrixIndex
_0808830C:
	ldr r2, _08088360 @ =gOamMatrixIndex
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0xc
	movs r1, #0x7f
	orrs r0, r1
	mov r1, sb
	str r0, [r1, #0x10]
_08088320:
	mov r0, sb
	ldr r1, [sp]
	bl TransformSprite
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
	mov r2, sb
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	mov r0, sb
	bl DisplaySprite
	mov r3, sb
	ldr r0, [r3, #0x10]
	ldr r1, _08088364 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
_08088350:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088360: .4byte gOamMatrixIndex
_08088364: .4byte 0xFFFFFBFF

.syntax divided
