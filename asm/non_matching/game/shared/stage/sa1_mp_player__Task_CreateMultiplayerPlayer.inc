.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _080134CC @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	adds r6, r7, #0
	adds r0, #0x38
	adds r0, r4, r0
	str r0, [sp]
	ldr r1, _080134D0 @ =0x03000056
	adds r3, r4, r1
	ldrb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080134D4 @ =gMultiSioRecv
	adds r0, r0, r1
	mov r8, r0
	ldr r5, _080134D8 @ =gMultiSioStatusFlags
	mov sb, r5
	movs r5, #1
	adds r1, r5, #0
	lsls r1, r2
	mov r2, sb
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08013448
	b _08013810
_08013448:
	ldr r0, _080134DC @ =0x03000061
	adds r2, r4, r0
	movs r1, #0
	mov sl, r1
	mov r0, sl
	strb r0, [r2]
	adds r1, r5, #0
	ldrb r3, [r3]
	lsls r1, r3
	mov r3, sb
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _08013466
	b _08013810
_08013466:
	mov r5, r8
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r1, r0
	beq _08013474
	b _08013810
_08013474:
	mov r0, sl
	strb r0, [r2]
	movs r1, #2
	ldrsh r0, [r5, r1]
	ldr r2, _080134E0 @ =0x03000050
	adds r3, r4, r2
	movs r5, #0
	ldrsh r1, [r3, r5]
	subs r0, r0, r1
	str r0, [r7, #0x44]
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	ldr r5, _080134E4 @ =0x03000052
	adds r2, r4, r5
	movs r5, #0
	ldrsh r1, [r2, r5]
	subs r0, r0, r1
	str r0, [r7, #0x48]
	mov r1, r8
	ldrh r0, [r1, #2]
	strh r0, [r3]
	ldrh r0, [r1, #4]
	strh r0, [r2]
	ldr r0, [r7, #0x44]
	cmp r0, #0
	bge _080134AC
	rsbs r0, r0, #0
_080134AC:
	cmp r0, #0x40
	bgt _080134BC
	ldr r0, [r7, #0x48]
	cmp r0, #0
	bge _080134B8
	rsbs r0, r0, #0
_080134B8:
	cmp r0, #0x40
	ble _080134E8
_080134BC:
	adds r0, r6, #0
	adds r0, #0x66
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080134FC
	.align 2, 0
_080134CC: .4byte gCurTask
_080134D0: .4byte 0x03000056
_080134D4: .4byte gMultiSioRecv
_080134D8: .4byte gMultiSioStatusFlags
_080134DC: .4byte 0x03000061
_080134E0: .4byte 0x03000050
_080134E4: .4byte 0x03000052
_080134E8:
	ldr r0, [r7, #0x44]
	lsls r0, r0, #8
	ldr r2, _0801358C @ =0x03000066
	adds r1, r4, r2
	strh r0, [r1]
	ldr r0, [r7, #0x48]
	lsls r0, r0, #8
	ldr r3, _08013590 @ =0x03000068
	adds r1, r4, r3
	strh r0, [r1]
_080134FC:
	adds r2, r6, #0
	adds r2, #0x57
	ldrb r1, [r2]
	mov r4, r8
	ldrb r0, [r4, #0xa]
	adds r4, r0, #0
	bics r4, r1
	adds r5, r4, #0
	adds r0, r4, #0
	movs r1, #2
	ands r0, r1
	mov sl, r2
	movs r2, #0x56
	adds r2, r2, r6
	mov sb, r2
	cmp r0, #0
	beq _08013526
	movs r0, #0
	ldrsb r0, [r2, r0]
	bl CreateItemTask_Invincibility
_08013526:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08013538
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	bl CreateItemTask_Shield_Normal
_08013538:
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	beq _0801354A
	mov r4, sb
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl CreateItemTask_Shield_Magnetic
_0801354A:
	movs r0, #0x50
	ands r5, r0
	cmp r5, #0
	beq _0801355C
	mov r5, sb
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl CreateItemTask_Confusion
_0801355C:
	mov r1, r8
	ldrb r0, [r1, #0xa]
	mov r2, sl
	strb r0, [r2]
	ldrh r1, [r1, #8]
	adds r0, r6, #0
	adds r0, #0x54
	strh r1, [r0]
	ldr r3, _08013594 @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r4, sb
	ldrb r4, [r4]
	cmp r0, r4
	beq _08013598
	movs r0, #0xc0
	lsls r0, r0, #3
	ands r0, r1
	lsrs r0, r0, #9
	adds r1, r6, #0
	adds r1, #0x64
	strb r0, [r1]
	b _08013644
	.align 2, 0
_0801358C: .4byte 0x03000066
_08013590: .4byte 0x03000068
_08013594: .4byte 0x04000128
_08013598:
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	adds r4, r6, #0
	adds r4, #0x64
	ldrb r2, [r4]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08013644
	ldr r1, _08013674 @ =gMultiplayerPlayerTasks
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	ldr r2, _08013678 @ =0x03000064
	adds r1, r1, r2
	lsrs r0, r0, #0x1e
	ldrb r1, [r1]
	cmp r0, r1
	bne _08013644
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r4]
	ldr r4, _0801367C @ =gPlayer
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	movs r3, #5
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	adds r1, #0x10
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08013680 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _08013684 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x40
	movs r1, #4
	strb r1, [r0]
	movs r0, #0x3c
	strh r0, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r2, _08013688 @ =0xFFBFFFFF
	ands r0, r2
	str r0, [r4, #0x10]
	ldr r0, [r6, #0x5c]
	mov r3, sl
	ands r0, r3
	str r0, [r6, #0x5c]
	ldr r0, [r5, #0x5c]
	ands r0, r1
	cmp r0, #0
	beq _08013644
	ldr r0, [r4, #0x10]
	ands r0, r2
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x5c]
	ands r0, r3
	str r0, [r5, #0x5c]
_08013644:
	ldr r0, _0801368C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	bne _080136D4
	mov r4, r8
	ldrh r1, [r4, #6]
	ldrb r3, [r4, #6]
	ldr r2, _08013690 @ =gMultiplayerCharRings
	mov r5, sb
	ldrb r0, [r5]
	adds r0, r0, r2
	lsrs r1, r1, #8
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x6a
	strh r3, [r0]
	ldrb r0, [r5]
	cmp r0, #3
	bne _080136A0
	cmp r3, #8
	bne _08013694
	movs r3, #0xc4
	lsls r3, r3, #1
	b _080136B2
	.align 2, 0
_08013674: .4byte gMultiplayerPlayerTasks
_08013678: .4byte 0x03000064
_0801367C: .4byte gPlayer
_08013680: .4byte 0xFFFFFBFF
_08013684: .4byte 0xFFFFFEFF
_08013688: .4byte 0xFFBFFFFF
_0801368C: .4byte gGameMode
_08013690: .4byte gMultiplayerCharRings
_08013694:
	cmp r3, #0x12
	bne _080136A0
	ldr r3, _0801369C @ =0x00000189
	b _080136B2
	.align 2, 0
_0801369C: .4byte 0x00000189
_080136A0:
	ldr r0, _080136D0 @ =gPlayerCharacterIdleAnims
	mov r5, sb
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080136B2:
	adds r5, r7, #0
	adds r5, #0x20
	adds r0, r6, #0
	adds r0, #0x58
	str r0, [sp, #0x10]
	movs r1, #0x22
	adds r1, r1, r7
	mov sl, r1
	adds r2, r6, #0
	adds r2, #0x50
	movs r4, #0x52
	adds r4, r4, r6
	mov ip, r4
	b _0801377A
	.align 2, 0
_080136D0: .4byte gPlayerCharacterIdleAnims
_080136D4:
	subs r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0801375C
	movs r5, #0
	str r5, [sp, #8]
	mov r0, r8
	ldrh r1, [r0, #6]
	ldr r3, _08013750 @ =0x000003FF
	ands r3, r1
	ldr r0, _08013754 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, sb
	ldrb r2, [r2]
	cmp r0, r2
	beq _08013704
	lsrs r1, r1, #0xc
	lsls r1, r1, #0x10
	ldr r0, [r6, #0x5c]
	orrs r0, r1
	str r0, [r6, #0x5c]
_08013704:
	movs r1, #0
	adds r5, r7, #0
	adds r5, #0x20
	adds r4, r6, #0
	adds r4, #0x58
	str r4, [sp, #0x10]
	movs r0, #0x22
	adds r0, r0, r7
	mov sl, r0
	adds r2, r6, #0
	adds r2, #0x50
	movs r4, #0x52
	adds r4, r4, r6
	mov ip, r4
	ldr r4, [r6, #0x5c]
_08013722:
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08013738
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
_08013738:
	adds r1, #1
	cmp r1, #2
	bls _08013722
	mov r1, sb
	ldrb r0, [r1]
	ldr r4, _08013758 @ =gMultiplayerCharRings
	adds r0, r0, r4
	mov r1, sp
	ldrb r1, [r1, #8]
	strb r1, [r0]
	b _0801377A
	.align 2, 0
_08013750: .4byte 0x000003FF
_08013754: .4byte 0x04000128
_08013758: .4byte gMultiplayerCharRings
_0801375C:
	mov r2, r8
	ldrh r3, [r2, #6]
	adds r5, r7, #0
	adds r5, #0x20
	adds r4, r6, #0
	adds r4, #0x58
	str r4, [sp, #0x10]
	movs r0, #0x22
	adds r0, r0, r7
	mov sl, r0
	adds r2, r6, #0
	adds r2, #0x50
	movs r1, #0x52
	adds r1, r1, r6
	mov ip, r1
_0801377A:
	mov r4, r8
	ldrb r0, [r4, #0xb]
	movs r1, #7
	mov sb, r1
	mov r4, sb
	ands r4, r0
	mov sb, r4
	ldrh r0, [r7, #0xa]
	cmp r0, r3
	bne _08013794
	ldrb r0, [r5]
	cmp r0, sb
	beq _0801379C
_08013794:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r0, [r7, #0x30]
_0801379C:
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r4, #4
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080137E4
	ldr r0, [r6, #0x5c]
	ands r0, r4
	ldr r4, _08013808 @ =gPlayer
	cmp r0, #0
	beq _080137C8
	ldr r0, [r4, #0x10]
	ldr r1, _0801380C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r6, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x5c]
_080137C8:
	ldr r1, [r4, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080137E4
	ldr r0, [r4, #0x28]
	cmp r0, r7
	bne _080137E4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r4, #0x10]
_080137E4:
	strh r3, [r7, #0xa]
	mov r0, sb
	strb r0, [r5]
	mov r1, r8
	ldrb r0, [r1, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1b
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	ldrb r0, [r1, #0xc]
	mov r4, sl
	strb r0, [r4]
	ldrb r0, [r1, #0xd]
	lsls r0, r0, #2
	ldr r5, [sp]
	strh r0, [r5]
	b _08013890
	.align 2, 0
_08013808: .4byte gPlayer
_0801380C: .4byte 0xFFBFFFFF
_08013810:
	adds r2, r6, #0
	adds r2, #0x50
	adds r0, r6, #0
	adds r0, #0x66
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r4, r6, #0
	adds r4, #0x52
	adds r0, r6, #0
	adds r0, #0x68
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r3, [r4]
	adds r0, r0, r3
	strh r0, [r4]
	adds r3, r6, #0
	adds r3, #0x61
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r4
	cmp r0, #0x1e
	bls _08013890
	ldr r1, _08013874 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08013878 @ =gBackgroundsCopyQueueCursor
	ldr r0, _0801387C @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08013880 @ =gBgSpritesCount
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08013884 @ =gVramGraphicsCopyCursor
	ldr r0, _08013888 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0801388C @ =gGameMode
	ldrb r0, [r0]
	bl LinkCommunicationError
	b _08013DB4
	.align 2, 0
_08013874: .4byte 0x0000FFFF
_08013878: .4byte gBackgroundsCopyQueueCursor
_0801387C: .4byte gBackgroundsCopyQueueIndex
_08013880: .4byte gBgSpritesCount
_08013884: .4byte gVramGraphicsCopyCursor
_08013888: .4byte gVramGraphicsCopyQueueIndex
_0801388C: .4byte gGameMode
_08013890:
	movs r3, #3
	ldr r4, _08013A60 @ =gPlayerCharacterIdleAnims
	movs r5, #6
	ldrsh r0, [r4, r5]
	ldrh r1, [r7, #0xa]
	adds r5, r6, #0
	adds r5, #0x54
	str r5, [sp, #0xc]
	ldr r5, _08013A64 @ =gCamera
	cmp r0, r1
	ble _080138C4
	mov r8, r4
_080138A8:
	lsls r0, r3, #0x18
	movs r3, #0xff
	lsls r3, r3, #0x18
	adds r0, r0, r3
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080138C4
	lsls r0, r0, #1
	add r0, r8
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, r1
	bgt _080138A8
_080138C4:
	ldrh r0, [r2]
	ldrh r1, [r5]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	mov r1, ip
	ldrh r0, [r1]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldrh r0, [r2]
	ldrh r1, [r5]
	subs r0, r0, r1
	ldr r2, [sp]
	strh r0, [r2, #6]
	mov r3, ip
	ldrh r0, [r3]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #8]
	ldr r4, [sp, #0xc]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08013908
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r0, [r7, #0x30]
_08013908:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	ldr r3, _08013A68 @ =gMultiplayerPlayerTasks
	ldr r2, _08013A6C @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #4]
	ldr r0, _08013A70 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _08013934
	cmp r0, #5
	bne _080139C6
_08013934:
	ldr r1, _08013A74 @ =gMultiplayerRanks
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080139C6
	movs r5, #1
	mov sl, r5
	movs r4, #0
	ldr r0, [r3]
	cmp r0, #0
	beq _080139B8
	ldr r0, _08013A78 @ =gMultiplayerConnections
	ldrb r0, [r0]
	mov ip, r0
	movs r0, #0x10
	mov sb, r0
	mov r8, r2
	adds r5, r3, #0
_08013964:
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	str r0, [sp, #0x14]
	mov r2, sb
	lsls r2, r4
	mov r1, ip
	ands r2, r1
	adds r0, r4, #4
	asrs r2, r0
	mov r3, r8
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r1, sb
	lsls r1, r0
	mov r0, ip
	ands r1, r0
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r1, r0
	cmp r2, r1
	bne _080139AA
	ldr r1, [sp, #0x14]
	ldr r2, _08013A7C @ =0x03000054
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080139AA
	movs r3, #0
	mov sl, r3
_080139AA:
	adds r5, #4
	adds r4, #1
	cmp r4, #3
	bhi _080139B8
	ldr r0, [r5]
	cmp r0, #0
	bne _08013964
_080139B8:
	mov r4, sl
	cmp r4, #0
	beq _080139C6
	bl CreateRoomEvent
	movs r1, #7
	strb r1, [r0]
_080139C6:
	ldr r0, _08013A80 @ =gStageFlags
	ldrh r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	ldr r4, _08013A84 @ =gPlayer
	cmp r0, #0
	bne _08013ACC
	ldr r5, [sp, #0xc]
	ldrh r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08013ACC
	ldr r0, [sp, #4]
	adds r0, #0x57
	ldrb r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08013ACC
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08013A02
	b _08013B10
_08013A02:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08013ACC
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x5c]
	ands r0, r3
	cmp r0, #0
	bne _08013ACC
	movs r3, #0x1c
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _08013ACC
	ldr r0, [r4, #0x10]
	ands r0, r2
	cmp r0, #0
	bne _08013ACC
	ldr r0, _08013A70 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	beq _08013AAE
	adds r0, r6, #0
	adds r0, #0x56
	ldrb r1, [r0]
	ldr r0, _08013A6C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bne _08013A46
	b _08013BD4
_08013A46:
	ldr r0, _08013A88 @ =gMultiplayerCharacters
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08013A9C
	cmp r0, #1
	bgt _08013A8C
	cmp r0, #0
	beq _08013A96
	b _08013BD4
	.align 2, 0
_08013A60: .4byte gPlayerCharacterIdleAnims
_08013A64: .4byte gCamera
_08013A68: .4byte gMultiplayerPlayerTasks
_08013A6C: .4byte 0x04000128
_08013A70: .4byte gGameMode
_08013A74: .4byte gMultiplayerRanks
_08013A78: .4byte gMultiplayerConnections
_08013A7C: .4byte 0x03000054
_08013A80: .4byte gStageFlags
_08013A84: .4byte gPlayer
_08013A88: .4byte gMultiplayerCharacters
_08013A8C:
	cmp r0, #2
	beq _08013AA2
	cmp r0, #3
	beq _08013AA8
	b _08013BD4
_08013A96:
	bl sa2__sub_8016D20
	b _08013BD4
_08013A9C:
	bl sa2__sub_801707C
	b _08013BD4
_08013AA2:
	bl sa2__sub_8017670
	b _08013BD4
_08013AA8:
	bl sa2__sub_8017C28
	b _08013BD4
_08013AAE:
	adds r1, r6, #0
	adds r1, #0x56
	ldr r0, _08013AC8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bne _08013AC2
	b _08013BD4
_08013AC2:
	bl sa2__sub_8018120
	b _08013BD4
	.align 2, 0
_08013AC8: .4byte 0x04000128
_08013ACC:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08013B10
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08013B10
	movs r5, #0x1c
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bne _08013B10
	ldr r0, [r4, #0x10]
	ands r0, r2
	cmp r0, #0
	bne _08013B10
	ldr r1, _08013B98 @ =gMultiplayerRanks
	adds r0, r6, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08013BD4
_08013B10:
	ldr r0, _08013B9C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	beq _08013BB0
	adds r4, r6, #0
	adds r4, #0x56
	ldrb r1, [r4]
	ldr r0, _08013BA0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08013B76
	ldr r0, _08013BA4 @ =gMultiplayerCharacters
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bgt _08013B76
	cmp r0, #1
	blt _08013B76
	ldr r1, [r6, #0x5c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08013B76
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x5c]
	ldr r2, _08013BA8 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x26
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08013B66
	ldr r0, [r2, #0x10]
	ldr r1, _08013BAC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x10]
_08013B66:
	bl CreateRoomEvent
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldrb r1, [r4]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_08013B76:
	ldr r2, _08013BA8 @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013BD4
	ldr r0, [r2, #0x28]
	cmp r0, r7
	bne _08013BD4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x10]
	b _08013BCC
	.align 2, 0
_08013B98: .4byte gMultiplayerRanks
_08013B9C: .4byte gGameMode
_08013BA0: .4byte 0x04000128
_08013BA4: .4byte gMultiplayerCharacters
_08013BA8: .4byte gPlayer
_08013BAC: .4byte 0xFFBFFFFF
_08013BB0:
	ldr r1, [r4, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013BD4
	ldr r0, [r4, #0x28]
	cmp r0, r7
	bne _08013BD4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r4, #0x10]
_08013BCC:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_08013BD4:
	ldr r0, [sp, #0xc]
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08013C42
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _08013C18 @ =gOamMatrixIndex
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08013C1C
	movs r0, #0xff
	lsls r0, r0, #8
	ldr r3, [sp]
	strh r0, [r3, #2]
	b _08013C24
	.align 2, 0
_08013C18: .4byte gOamMatrixIndex
_08013C1C:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r4, [sp]
	strh r0, [r4, #2]
_08013C24:
	ldr r5, [sp, #0xc]
	ldrh r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013C38
	ldr r1, [sp]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_08013C38:
	adds r0, r7, #0
	ldr r1, [sp]
	bl TransformSprite
	b _08013C88
_08013C42:
	ldr r2, [r7, #0x10]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r7, #0x10]
	ldr r3, [sp, #0xc]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08013C60
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	b _08013C64
_08013C60:
	ldr r0, _08013C7C @ =0xFFFFFBFF
	ands r2, r0
_08013C64:
	str r2, [r7, #0x10]
	ldr r4, [sp, #0xc]
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013C80
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08013C86
	.align 2, 0
_08013C7C: .4byte 0xFFFFFBFF
_08013C80:
	ldr r0, [r7, #0x10]
	ldr r1, _08013DC4 @ =0xFFFFF7FF
	ands r0, r1
_08013C86:
	str r0, [r7, #0x10]
_08013C88:
	ldr r1, [r7, #0x10]
	ldr r0, _08013DC8 @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r7, #0x10]
	ldr r5, [sp, #0xc]
	ldrh r2, [r5]
	movs r0, #0x30
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r7, #0x10]
	ldrh r3, [r5]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08013CAA
	b _08013DB4
_08013CAA:
	ldr r0, _08013DCC @ =gStageTime
	ldr r0, [r0]
	movs r4, #2
	ands r0, r4
	movs r1, #0x57
	adds r1, r1, r6
	mov sl, r1
	cmp r0, #0
	bne _08013CFE
	ldrb r1, [r1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08013CFE
	ldr r2, [r6, #0x5c]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08013CFE
	ldr r1, _08013DD0 @ =gMultiplayerRanks
	adds r0, r6, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08013CFE
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	bne _08013DB4
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	bne _08013DB4
	ands r2, r4
	cmp r2, #0
	bne _08013DB4
_08013CFE:
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	cmp r0, #0
	beq _08013D16
	movs r4, #0x88
	lsls r4, r4, #3
	adds r1, r4, #0
_08013D16:
	strh r1, [r7, #0x1a]
	ldr r0, [r7, #0x10]
	ldr r1, _08013DD4 @ =0xFFFFFE7F
	ands r0, r1
	str r0, [r7, #0x10]
	mov r5, sl
	ldrb r1, [r5]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013DAE
	ldr r0, _08013DD8 @ =gGameMode
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #3
	beq _08013D3A
	cmp r1, #5
	bne _08013D6A
_08013D3A:
	ldr r0, _08013DDC @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r0, r6, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08013DE0 @ =0x04000128
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
	bne _08013D74
_08013D6A:
	ldrb r0, [r5]
	cmp r0, #3
	beq _08013DAE
	cmp r0, #5
	beq _08013DAE
_08013D74:
	adds r0, r6, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	bne _08013DAE
	adds r1, r6, #0
	adds r1, #0x56
	ldr r0, _08013DE0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08013DAE
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r2, _08013DE4 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08013DE8 @ =gWinRegs
	ldr r0, _08013DEC @ =0x0000083F
	strh r0, [r1, #0xa]
_08013DAE:
	adds r0, r7, #0
	bl DisplaySprite
_08013DB4:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013DC4: .4byte 0xFFFFF7FF
_08013DC8: .4byte 0xFFFFCFFF
_08013DCC: .4byte gStageTime
_08013DD0: .4byte gMultiplayerRanks
_08013DD4: .4byte 0xFFFFFE7F
_08013DD8: .4byte gGameMode
_08013DDC: .4byte gMultiplayerConnections
_08013DE0: .4byte 0x04000128
_08013DE4: .4byte gDispCnt
_08013DE8: .4byte gWinRegs
_08013DEC: .4byte 0x0000083F

.syntax divided
