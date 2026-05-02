.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]     @ sp10 = 0
	ldr r0, _080909D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0     @ r7 = barrel
	ldr r2, _080909DC @ =0x0300000C
	adds r2, r2, r1
	mov sb, r2          @ sb = s
	ldr r3, [r7]        @ r3 = me
	str r3, [sp, #8]    @ sp08 = r3 = me
	ldr r4, _080909E0 @ =0x03000050
	adds r2, r1, r4     @ r2 = unk50
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080909F4
	ldr r0, [r7, #0x48]
	mov r8, r0          @ r8 = barrel->unk48
	ldrb r3, [r3, #5]
	lsls r3, r3, #0xb
	ldr r5, _080909E4 @ =gSineTable
	movs r6, #0
	ldrsh r4, [r2, r6]  @ r4 = barrel->unk50
	ldr r2, _080909E8 @ =gStageTime
	ldr r6, _080909EC @ =0x03000044
	adds r0, r1, r6
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _080909F0 @ =0x000003FF
	ands r0, r1   @ theta = CLAMP_SIN_PERIOD(barrel->unk50 * ((gStageTime + barrel->unk44) & 0xFF));
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	str r0, [r7, #0x48]
	mov r2, r8
	subs r2, r0, r2
	str r2, [sp, #0xc]
	b _080909FC
	.align 2, 0
_080909D8: .4byte gCurTask
_080909DC: .4byte 0x0300000C
_080909E0: .4byte 0x03000050
_080909E4: .4byte gSineTable
_080909E8: .4byte gStageTime
_080909EC: .4byte 0x03000044
_080909F0: .4byte 0x000003FF
_080909F4:
	movs r3, #0
	str r3, [sp, #0xc]
	ldr r4, [sp, #0x10]
	str r4, [r7, #0x48]
_080909FC:
	adds r1, r7, #0
	adds r1, #0x52
	movs r6, #0
	ldrsh r0, [r1, r6]
	cmp r0, #0
	beq _08090A4C
	ldr r6, [r7, #0x4c]
	ldr r0, [sp, #8]
	ldrb r3, [r0, #6]
	lsls r3, r3, #0xb
	ldr r5, _08090A40 @ =gSineTable
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r2, _08090A44 @ =gStageTime
	adds r0, r7, #0
	adds r0, #0x44
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _08090A48 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	str r0, [r7, #0x4c]
	subs r6, r0, r6
	str r6, [sp, #0x10]
	b _08090A52
	.align 2, 0
_08090A40: .4byte gSineTable
_08090A44: .4byte gStageTime
_08090A48: .4byte 0x000003FF
_08090A4C:
	movs r6, #0
	str r6, [sp, #0x10]
	str r6, [r7, #0x4c]
_08090A52:
	ldrb r0, [r7, #8]
	lsls r0, r0, #3
	ldrh r1, [r7, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]        @ sp00 = worldX
	ldr r1, [sp, #8]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldrh r1, [r7, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]    @ sp04 = worldY
	ldr r0, [r7, #0x48]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	bl Div
	ldr r4, _08090D08 @ =gCamera
	ldrh r2, [r4]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	adds r1, r1, r0
	mov r6, sb
	strh r1, [r6, #0x16]
	ldr r0, [r7, #0x4c]
	adds r1, r5, #0
	bl Div
	ldrh r2, [r4, #2]
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	movs r4, #0
	str r4, [sp, #0x14]     @ sp14 = i;
	adds r6, r7, #0
	adds r6, #0x56
	str r6, [sp, #0x20]     @ sp20 = barrel->unk56
_08090AB2_loop:
	ldr r6, _08090D0C @ =gPlayer
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08090ABC
	ldr r6, _08090D10 @ =gPartner
_08090ABC:
	ldr r0, [r6, #0x10]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08090AE2
	ldr r0, [r6, #0x28]
	cmp r0, sb
	bne _08090AE2
	ldr r0, [r6]
	ldr r1, [sp, #0xc]  @ r1 = qSp0C
	adds r0, r0, r1
	str r0, [r6]
	ldr r0, [r6, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r3, [sp, #0x10] @ r3 = sp10
	adds r0, r0, r3
	str r0, [r6, #4]
_08090AE2:
	ldr r1, [r7, #0x48]
	asrs r1, r1, #8
	ldr r4, [sp]        @ r4 = sp00 = worldX
	lsls r5, r4, #0x10
	asrs r0, r5, #0x10
	mov r8, r0          @ r8 = worldX
	add r1, r8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0x4c]
	asrs r0, r0, #8
	ldr r2, [sp, #4]
	lsls r4, r2, #0x10
	asrs r2, r4, #0x10
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	adds r3, r6, #0
	bl Coll_Player_PlatformCrumbling
	ldr r3, [sp, #0x20] @ barrel->unk56
	ldrb r0, [r3]
	str r5, [sp, #0x18] @ sp18 = worldX << 16
	str r4, [sp, #0x1c] @ sp1C = worldY << 16
	cmp r0, #0
	beq _08090B1E
	cmp r0, #2
	beq _08090B1E
	b _08090C88
_08090B1E:
	mov r4, sb
	ldr r1, [r4, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08090B2C
	b _08090C88
_08090B2C:
	ldr r0, [r7, #0x48]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sl, r1          @ sl = 0x100
	bl Div
	add r0, r8
	mov r5, sb
	adds r5, #0x34
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r2, [r6]
	asrs r2, r2, #8
	ldr r1, [r6, #0x64]
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	cmp r0, r2
	bgt _08090B80
	ldr r0, [r7, #0x48]
	mov r1, sl
	bl Div
	add r0, r8
	mov r1, sb
	adds r1, #0x36
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r2, r2, r0
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r0, [r6, #0x64]
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _08090BC6
_08090B80:
	ldr r0, [r7, #0x48]
	mov r1, sl
	bl Div
	add r0, r8
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r2, [r6]
	asrs r2, r2, #8
	ldr r3, [r6, #0x64]
	adds r1, r3, #0
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	cmp r0, r2
	blt _08090C88
	adds r0, r3, #0
	adds r0, #0x3a
	movs r4, #0
	ldrsb r4, [r0, r4]
	subs r4, r4, r1
	adds r4, r2, r4
	ldr r0, [r7, #0x48]
	mov r1, sl
	bl Div
	add r0, r8
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	cmp r4, r0
	blt _08090C88
_08090BC6:
	ldr r0, [r7, #0x4c]
	movs r2, #0x80
	lsls r2, r2, #1
	mov sl, r2
	mov r1, sl
	bl Div
	ldr r3, [sp, #0x1c]
	asrs r5, r3, #0x10
	adds r0, r5, r0
	movs r4, #0x35
	add r4, sb
	mov r8, r4
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r2, [r6, #4]
	asrs r2, r2, #8
	ldr r1, [r6, #0x64]
	adds r1, #0x39
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	cmp r0, r2
	bgt _08090C22
	ldr r0, [r7, #0x4c]
	mov r1, sl
	bl Div
	adds r0, r5, r0
	mov r1, sb
	adds r1, #0x37
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r2, r2, r0
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #0x64]
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _08090C6C
_08090C22:
	ldr r0, [r7, #0x4c]
	mov r1, sl
	bl Div
	adds r0, r5, r0
	mov r2, r8
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r3, [r6, #0x64]
	adds r2, r3, #0
	adds r2, #0x39
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	cmp r0, r1
	blt _08090C88
	adds r0, r3, #0
	adds r0, #0x3b
	movs r4, #0
	ldrsb r4, [r0, r4]
	subs r4, r4, r2
	adds r4, r1, r4
	ldr r0, [r7, #0x4c]
	mov r1, sl
	bl Div
	adds r0, r5, r0
	mov r3, r8
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	cmp r4, r0
	blt _08090C88
_08090C6C:
	ldr r0, _08090D0C @ =gPlayer
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08090C88
	adds r0, r6, #0
	bl Coll_DamagePlayer
	cmp r0, #0
	beq _08090C88
	movs r0, #0xab
	bl m4aSongNumStart
_08090C88:
	ldr r4, [sp, #0x14]
	adds r4, #1
	str r4, [sp, #0x14]
	ldr r0, _08090D14 @ =gNumSingleplayerCharacters
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r4, r1
	bge _08090C9C
	b _08090AB2_loop
_08090C9C:
	ldr r6, [sp, #0x18]
	asrs r5, r6, #0x10  @ r5 = worldX
	ldr r2, _08090D08 @ =gCamera
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r5, r0
	bgt _08090CD2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	blt _08090CD2
	ldr r6, [sp, #0x1c]
	asrs r4, r6, #0x10  @r4 = worldY
	movs r0, #2
	ldrsh r1, [r2, r0]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r4, r0
	bgt _08090CD2
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	bge _08090D1C
_08090CD2:
	mov r4, sb
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08090CF8
	movs r6, #0x18
	ldrsh r0, [r4, r6]
	adds r0, #0x80
	cmp r0, #0
	blt _08090CF8
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08090D1C
_08090CF8:
	ldrb r0, [r7, #8]
	ldr r1, [sp, #8]
	strb r0, [r1]
	ldr r0, _08090D18 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08090DE0_return
	.align 2, 0
_08090D08: .4byte gCamera
_08090D0C: .4byte gPlayer
_08090D10: .4byte gPartner
_08090D14: .4byte gNumSingleplayerCharacters
_08090D18: .4byte gCurTask
_08090D1C:
	ldr r1, _08090D5C @ =gPlayer
	ldr r0, [r1, #0x10]
	movs r2, #8
	ands r0, r2
	cmp r0, #0
	beq _08090D2E
	ldr r0, [r1, #0x28]
	cmp r0, sb
	beq _08090D46
_08090D2E:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	bne _08090D64
	ldr r1, _08090D60 @ =gPartner
	ldr r0, [r1, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _08090D64
	ldr r0, [r1, #0x28]
	cmp r0, sb
	bne _08090D64
_08090D46:
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, #0
	cmp r3, r1
	beq _08090D76
	adds r0, r3, #0
	adds r0, #0x10
	b _08090D74
	.align 2, 0
_08090D5C: .4byte gPlayer
_08090D60: .4byte gPartner
_08090D64:
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _08090D76
	adds r0, r1, #0
	subs r0, #0x10
_08090D74:
	strh r0, [r2]
_08090D76:
	ldr r1, _08090DB0 @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	mov r2, sb
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	mov r3, sb
	strh r0, [r3, #0x18]
	adds r1, r7, #0
	adds r1, #0x57
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090DD4
	ldr r4, [sp, #0x20]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08090DAA
	cmp r0, #2
	bne _08090DB4
_08090DAA:
	movs r0, #0x30
	b _08090DB6
	.align 2, 0
_08090DB0: .4byte gSineTable
_08090DB4:
	movs r0, #0x10
_08090DB6:
	strb r0, [r1]
	ldr r6, [sp, #0x20]
	ldrb r0, [r6]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r6]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldrb r1, [r6]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
_08090DD4:
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
_08090DE0_return:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
