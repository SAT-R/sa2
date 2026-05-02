.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r2, _080147EC @ =gPlayer
	ldr r0, [r2, #0x64]
	adds r0, #0xc
	mov r8, r0
	ldr r0, _080147F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov sb, r7
	ldr r1, [r2, #0x10]
	lsrs r0, r1, #5
	str r0, [sp, #0x14]
	movs r0, #1
	ldr r3, [sp, #0x14]
	ands r3, r0
	str r3, [sp, #0x14]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0801477E
	ldr r0, [r2, #0x28]
	cmp r0, r7
	bne _0801477E
	bl sa2__sub_8017F34
_0801477E:
	ldr r0, _080147F4 @ =gGameMode
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #3
	beq _0801478C
	cmp r1, #5
	bne _080147BC
_0801478C:
	ldr r0, _080147F8 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _080147FC @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	bne _080147C6
_080147BC:
	ldrb r0, [r5]
	cmp r0, #3
	beq _08014800
	cmp r0, #5
	beq _08014800
_080147C6:
	bl sa2__sub_8018300
	cmp r0, #0
	bne _080147D0
	b _08014CFC
_080147D0:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080147DC
	b _08014CFC
_080147DC:
	ldr r2, _080147EC @ =gPlayer
	ldr r0, [r2, #0x10]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x10]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08014CFC
	.align 2, 0
_080147EC: .4byte gPlayer
_080147F0: .4byte gCurTask
_080147F4: .4byte gGameMode
_080147F8: .4byte gMultiplayerConnections
_080147FC: .4byte 0x04000128
_08014800:
	ldr r6, _08014870 @ =gPlayer
	adds r0, r6, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08014820
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08014820
	b _08014CFC
_08014820:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r2, [r1]
	str r1, [sp, #0x20]
	cmp r2, #0
	beq _08014838
	ldr r5, [r7, #0x5c]
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	bne _08014838
	b _08014C98
_08014838:
	movs r5, #0
	strb r5, [r1]
	ldr r0, _08014874 @ =0xFFFFFEFC
	adds r4, r0, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _0801489C
	bl sa2__sub_80181E0
	cmp r0, #0
	beq _08014878
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08014862
	b _08014CFC
_08014862:
	ldr r0, [r6, #0x10]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x10]
	str r5, [r7, #0x4c]
	b _08014CFC
	.align 2, 0
_08014870: .4byte gPlayer
_08014874: .4byte 0xFFFFFEFC
_08014878:
	mov r2, sb
	ldrh r2, [r2, #0xa]
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _0801489C
	mov r3, r8
	ldr r0, [r3, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801489C
	mov r4, sb
	ldr r0, [r4, #0x30]
	cmp r0, r1
	beq _0801489C
	b _08014CFC
_0801489C:
	ldr r0, _080149A8 @ =gPlayer
	mov sl, r0
	ldrb r4, [r0, #0xe]
	rsbs r0, r4, #0
	add r1, sp, #0x10
	strb r0, [r1]
	mov r2, sl
	ldrb r3, [r2, #0xf]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #0x11
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #0xc
	movs r2, #4
	bl memcpy
	movs r3, #0x50
	adds r3, r3, r7
	mov r8, r3
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r6, r7, #0
	adds r6, #0x52
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r7, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, sb
	bl sa2__sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	mov r3, r8
	str r3, [sp, #0x18]
	str r6, [sp, #0x1c]
	mov r8, r5
	cmp r0, #0
	beq _08014922
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08014922
	mov r4, sl
	ldr r0, [r4, #0x10]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x10]
_08014922:
	str r2, [r7, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _08014934
	movs r0, #0x1e
	ldr r1, [sp, #0x20]
	strb r0, [r1]
_08014934:
	ldr r2, [sp, #0x18]
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r4, [sp, #0x1c]
	movs r0, #0
	ldrsh r2, [r4, r0]
	ldr r5, _080149A8 @ =gPlayer
	add r3, sp, #0xc
	str r3, [sp]
	mov r0, sb
	adds r3, r5, #0
	bl Coll_Player_Entity_RectIntersection
	cmp r0, #0
	bne _08014954
	b _08014A6A
_08014954:
	mov r4, r8
	ldrh r0, [r4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x17
	movs r4, #1
	ands r0, r4
	adds r1, r5, #0
	adds r1, #0x27
	ldrb r1, [r1]
	cmp r0, r1
	beq _0801496C
	b _08014A6A
_0801496C:
	ldr r1, _080149AC @ =0xFFFFFEFC
	adds r0, r1, #0
	mov r3, sb
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08014A6A
	ldr r0, _080149B0 @ =gStageFlags
	ldrh r3, [r0]
	lsrs r1, r3, #7
	ands r1, r4
	lsrs r2, r2, #0x13
	adds r0, r4, #0
	bics r0, r2
	cmp r1, r0
	beq _08014A6A
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _080149B4
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	ldr r4, [sp, #0x1c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080149C2
	b _08014A6A
	.align 2, 0
_080149A8: .4byte gPlayer
_080149AC: .4byte 0xFFFFFEFC
_080149B0: .4byte gStageFlags
_080149B4:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	ldr r3, [sp, #0x1c]
	movs r4, #0
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _08014A6A
_080149C2:
	ldr r4, _08014A10 @ =gPlayer
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	adds r2, r4, #0
	movs r1, #0
	movs r0, #0
	strh r0, [r2, #0xc]
	strh r0, [r2, #8]
	adds r0, r2, #0
	adds r0, #0x40
	strb r1, [r0]
	subs r0, #3
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08014A14
	ldr r0, [r2, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x10]
	b _08014A1C
	.align 2, 0
_08014A10: .4byte gPlayer
_08014A14:
	ldr r0, [r4, #0x10]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x10]
_08014A1C:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08014A62
	bl CreateRoomEvent
	movs r1, #8
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x56
	ldrb r1, [r1]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	ldr r0, _08014A50 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08014A58
	ldr r0, [r7, #0x5c]
	ldr r1, _08014A54 @ =0xFFFFFEFF
	ands r0, r1
	b _08014A60
	.align 2, 0
_08014A50: .4byte gStageFlags
_08014A54: .4byte 0xFFFFFEFF
_08014A58:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
_08014A60:
	str r0, [r7, #0x5c]
_08014A62:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x5c]
_08014A6A:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08014A76
	b _08014CFC
_08014A76:
	ldr r6, _08014A98 @ =gPlayer
	adds r0, r6, #0
	bl Player_TryJump
	cmp r0, #0
	beq _08014AA0
	movs r0, #0x1e
	ldr r2, [sp, #0x20]
	strb r0, [r2]
	ldr r0, [r6, #0x10]
	ldr r1, _08014A9C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	b _08014C7C
	.align 2, 0
_08014A98: .4byte gPlayer
_08014A9C: .4byte 0xFFBFFFFF
_08014AA0:
	ldr r3, _08014B3C @ =0xFFFFFEFC
	adds r0, r3, #0
	mov r4, sb
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _08014B40 @ =gStageFlags
	cmp r0, #2
	bhi _08014AF4
	ldr r0, [r6]
	asrs r1, r0, #8
	ldr r2, _08014B44 @ =gCamera
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08014AF4
	movs r4, #0x1a
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bge _08014AF4
	ldrh r4, [r5]
	lsrs r0, r4, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	mov r1, r8
	ldrh r0, [r1]
	lsrs r0, r0, #3
	adds r1, r3, #0
	bics r1, r0
	cmp r2, r1
	bne _08014AF4
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08014AF4
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _08014B50
_08014AF4:
	ldr r2, _08014B48 @ =gPlayer
	ldr r0, [r2, #0x10]
	ldr r1, _08014B4C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x10]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	adds r2, #0x40
	movs r0, #0
	strb r0, [r2]
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	mov r4, r8
	ldrh r1, [r4]
	lsrs r1, r1, #3
	adds r0, r3, #0
	bics r0, r1
	cmp r2, r0
	bne _08014B34
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08014B34
	b _08014CFC
_08014B34:
	movs r0, #0x1e
	ldr r1, [sp, #0x20]
	strb r0, [r1]
	b _08014CFC
	.align 2, 0
_08014B3C: .4byte 0xFFFFFEFC
_08014B40: .4byte gStageFlags
_08014B44: .4byte gCamera
_08014B48: .4byte gPlayer
_08014B4C: .4byte 0xFFBFFFFF
_08014B50:
	movs r2, #0xf
	ldrsb r2, [r6, r2]
	movs r0, #0x80
	ands r0, r4
	ldr r3, [sp, #0x18]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r1, r1, #8
	mov r8, r1
	cmp r0, #0
	bne _08014BAC
	ldr r1, [sp, #0x1c]
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r1, sb
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	add r1, sp, #0xc
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r5, r0, #8
	subs r0, r0, r2
	mov r4, r8
	asrs r1, r4, #8
	adds r2, r6, #0
	adds r2, #0x27
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08014BA8 @ =sa2__sub_801EC3C
	str r4, [sp]
	bl sa2__sub_801F100
	cmp r0, #0
	bge _08014BFC
	lsls r0, r0, #8
	subs r5, r5, r0
	b _08014BE8
	.align 2, 0
_08014BA8: .4byte sa2__sub_801EC3C
_08014BAC:
	ldr r1, [sp, #0x1c]
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r1, sb
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	add r1, sp, #0xc
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r5, r0, #8
	adds r0, r0, r2
	mov r4, r8
	asrs r1, r4, #8
	adds r2, r6, #0
	adds r2, #0x27
	ldrb r2, [r2]
	ldr r3, _08014C3C @ =sa2__sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sa2__sub_801F100
	cmp r0, #0
	bge _08014BFC
	lsls r0, r0, #8
	adds r5, r5, r0
_08014BE8:
	ldr r0, [r6, #0x10]
	ldr r1, _08014C40 @ =0xFFBFFFFF
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r7, #0x5c]
	subs r1, #7
	ands r0, r1
	str r0, [r7, #0x5c]
_08014BFC:
	ldr r3, _08014C44 @ =gPlayer
	mov r0, r8
	str r0, [r3]
	str r5, [r3, #4]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08014C58
	ldr r2, [r3, #0x10]
	movs r0, #8
	orrs r2, r0
	subs r0, #0xd
	ands r2, r0
	adds r0, #2
	ands r2, r0
	str r2, [r3, #0x10]
	mov r1, sb
	str r1, [r3, #0x28]
	movs r0, #0
	strh r0, [r3, #0xa]
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08014C48
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	b _08014C4C
	.align 2, 0
_08014C3C: .4byte sa2__sub_801EC3C
_08014C40: .4byte 0xFFBFFFFF
_08014C44: .4byte gPlayer
_08014C48:
	movs r0, #1
	orrs r2, r0
_08014C4C:
	str r2, [r3, #0x10]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08014C6C
_08014C58:
	bl CreateRoomEvent
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x56
	ldrb r1, [r1]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_08014C6C:
	ldr r0, _08014C84 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08014C8C
	ldr r0, [r7, #0x5c]
	ldr r1, _08014C88 @ =0xFFFFFEFF
_08014C7C:
	ands r0, r1
	str r0, [r7, #0x5c]
	b _08014CFC
	.align 2, 0
_08014C84: .4byte gStageFlags
_08014C88: .4byte 0xFFFFFEFF
_08014C8C:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x5c]
	b _08014CFC
_08014C98:
	subs r0, r2, #1
	strb r0, [r1]
	ldr r0, [r6, #0x10]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08014CFC
	ldr r0, [r6, #0x28]
	cmp r0, sb
	bne _08014CFC
	adds r0, r7, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r5, [sp, #8]
	mov r0, sb
	bl sa2__sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08014CFA
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08014CFA
	ldr r0, [r6, #0x10]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x10]
_08014CFA:
	str r2, [r7, #0x4c]
_08014CFC:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
