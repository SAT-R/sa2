.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08016340 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	adds r7, r6, #0
	adds r0, #0x38
	adds r0, r5, r0
	str r0, [sp]
	ldr r1, _08016344 @ =IWRAM_START + 0x56
	adds r3, r5, r1
	ldrb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _08016348 @ =gMultiSioRecv
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0801634C @ =gMultiSioStatusFlags
	mov sb, r4
	movs r4, #1
	adds r1, r4, #0
	lsls r1, r2
	mov r2, sb
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08016284
	b _0801666C
_08016284:
	ldr r0, _08016350 @ =IWRAM_START + 0x61
	adds r2, r5, r0
	movs r1, #0
	mov ip, r1
	mov r0, ip
	strb r0, [r2]
	adds r1, r4, #0
	ldrb r3, [r3]
	lsls r1, r3
	mov r3, sb
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _080162A2
	b _0801666C
_080162A2:
	mov r4, r8
	ldrh r1, [r4]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	beq _080162B0
	b _0801666C
_080162B0:
	mov r0, ip
	strb r0, [r2]
	ldr r0, _08016354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _080162BE
	b _080163C0
_080162BE:
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r3, _08016358 @ =IWRAM_START + 0x50
	adds r3, r3, r5
	mov ip, r3
	movs r4, #0
	ldrsh r0, [r3, r4]
	subs r4, r1, r0
	str r4, [r6, #0x44]
	mov r0, r8
	movs r1, #4
	ldrsh r0, [r0, r1]
	mov sb, r0
	ldr r3, _0801635C @ =IWRAM_START + 0x52
	adds r2, r5, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r3, sb
	subs r1, r3, r0
	str r1, [r6, #0x48]
	adds r0, r4, #0
	cmp r4, #0
	bge _080162EE
	rsbs r0, r4, #0
_080162EE:
	mov r3, ip
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0xf
	ble _080163A6
	adds r0, r1, #0
	cmp r1, #0
	bge _08016300
	rsbs r0, r1, #0
_08016300:
	ldr r2, _08016358 @ =IWRAM_START + 0x50
	adds r2, r5, r2
	str r2, [sp, #4]
	ldr r3, _0801635C @ =IWRAM_START + 0x52
	adds r3, r5, r3
	str r3, [sp, #8]
	cmp r0, #0xf
	ble _080163A6
	cmp r4, #0
	ble _08016368
	cmp r1, #0
	ble _08016368
	mov r4, r8
	movs r5, #2
	ldrsh r0, [r4, r5]
	ldr r1, _08016360 @ =0xFFFFFA60
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	ldr r4, [sp, #8]
	movs r5, #0
	ldrsh r1, [r4, r5]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	ldr r4, _08016364 @ =0xFFFFFCA0
	adds r0, r0, r4
	subs r1, r1, r0
	str r1, [r6, #0x48]
	b _080163A6
	.align 2, 0
_08016340: .4byte gCurTask
_08016344: .4byte IWRAM_START + 0x56
_08016348: .4byte gMultiSioRecv
_0801634C: .4byte gMultiSioStatusFlags
_08016350: .4byte IWRAM_START + 0x61
_08016354: .4byte gGameMode
_08016358: .4byte IWRAM_START + 0x50
_0801635C: .4byte IWRAM_START + 0x52
_08016360: .4byte 0xFFFFFA60
_08016364: .4byte 0xFFFFFCA0
_08016368:
	ldr r0, [r7, #0x44]
	adds r5, r7, #0
	adds r5, #0x50
	str r5, [sp, #4]
	adds r1, r7, #0
	adds r1, #0x52
	str r1, [sp, #8]
	cmp r0, #0
	bge _080163A6
	ldr r0, [r7, #0x48]
	cmp r0, #0
	bge _080163A6
	mov r2, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r4, #0
	ldrsh r0, [r5, r4]
	ldr r5, _080163B8 @ =0xFFFFFA60
	adds r0, r0, r5
	subs r1, r1, r0
	str r1, [r7, #0x44]
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r3, _080163BC @ =0xFFFFFCA0
	adds r0, r0, r3
	mov r4, r8
	movs r5, #4
	ldrsh r1, [r4, r5]
	subs r0, r0, r1
	str r0, [r7, #0x48]
_080163A6:
	mov r1, r8
	ldrh r0, [r1, #2]
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldrh r0, [r1, #4]
	ldr r3, [sp, #8]
	strh r0, [r3]
	b _080163F2
	.align 2, 0
_080163B8: .4byte 0xFFFFFA60
_080163BC: .4byte 0xFFFFFCA0
_080163C0:
	mov r4, r8
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r2, _0801641C @ =IWRAM_START + 0x50
	adds r3, r5, r2
	movs r4, #0
	ldrsh r1, [r3, r4]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	ldr r4, _08016420 @ =IWRAM_START + 0x52
	adds r2, r5, r4
	movs r5, #0
	ldrsh r1, [r2, r5]
	subs r0, r0, r1
	str r0, [r6, #0x48]
	mov r1, r8
	ldrh r0, [r1, #2]
	strh r0, [r3]
	ldrh r0, [r1, #4]
	strh r0, [r2]
	str r3, [sp, #4]
	str r2, [sp, #8]
_080163F2:
	ldr r0, [r7, #0x44]
	adds r1, r0, #0
	cmp r0, #0
	bge _080163FC
	rsbs r1, r0, #0
_080163FC:
	cmp r1, #0x40
	bgt _0801640C
	ldr r1, [r7, #0x48]
	cmp r1, #0
	bge _08016408
	rsbs r1, r1, #0
_08016408:
	cmp r1, #0x40
	ble _08016424
_0801640C:
	adds r0, r7, #0
	adds r0, #0x66
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _08016434
	.align 2, 0
_0801641C: .4byte IWRAM_START + 0x50
_08016420: .4byte IWRAM_START + 0x52
_08016424:
	lsls r0, r0, #8
	adds r1, r7, #0
	adds r1, #0x66
	strh r0, [r1]
	ldr r0, [r7, #0x48]
	lsls r0, r0, #8
	adds r1, #2
	strh r0, [r1]
_08016434:
	adds r2, r7, #0
	adds r2, #0x57
	ldrb r3, [r2]
	mov r4, r8
	ldrb r0, [r4, #0xa]
	adds r4, r0, #0
	bics r4, r3
	ldr r0, _080164C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	adds r1, r7, #0
	adds r1, #0x56
	lsrs r0, r0, #0x1e
	mov sb, r2
	mov sl, r1
	ldrb r5, [r1]
	cmp r0, r5
	bne _08016490
	movs r1, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08016474
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _08016474
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl CreateItemTask_Invincibility
_08016474:
	movs r0, #0x50
	ands r4, r0
	cmp r4, #0
	beq _08016490
	mov r2, sb
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08016490
	mov r3, sl
	movs r0, #0
	ldrsb r0, [r3, r0]
	bl CreateItemTask_Confusion
_08016490:
	mov r4, r8
	ldrb r0, [r4, #0xa]
	mov r5, sb
	strb r0, [r5]
	ldrh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x54
	strh r1, [r0]
	ldr r3, _080164C0 @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, sl
	ldrb r2, [r2]
	cmp r0, r2
	beq _080164C4
	movs r0, #0xc0
	lsls r0, r0, #3
	ands r0, r1
	lsrs r0, r0, #9
	adds r1, r7, #0
	adds r1, #0x64
	strb r0, [r1]
	b _08016576
	.align 2, 0
_080164C0: .4byte 0x04000128
_080164C4:
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	adds r4, r7, #0
	adds r4, #0x64
	ldrb r2, [r4]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08016576
	ldr r1, _080165A8 @ =gMultiplayerPlayerTasks
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	ldr r2, _080165AC @ =IWRAM_START + 0x64
	adds r1, r1, r2
	lsrs r0, r0, #0x1e
	ldrb r1, [r1]
	cmp r0, r1
	bne _08016576
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r4]
	ldr r4, _080165B0 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	movs r3, #5
	rsbs r3, r3, #0
	mov sb, r3
	ands r0, r3
	adds r1, #0x10
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080165B4 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _080165B8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
	ldr r0, _080165BC @ =Player_TouchGround
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r2, _080165C0 @ =0xFFBFFFFF
	ands r0, r2
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	mov r3, sb
	ands r0, r3
	str r0, [r7, #0x5c]
	ldr r0, [r5, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016576
	ldr r0, [r4, #0x20]
	ands r0, r2
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x5c]
	ands r0, r3
	str r0, [r5, #0x5c]
_08016576:
	ldr r0, _080165C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080165D0
	mov r4, r8
	ldrh r1, [r4, #6]
	ldrb r3, [r4, #6]
	ldr r2, _080165C8 @ =gMultiplayerCharRings
	mov r5, sl
	ldrb r0, [r5]
	adds r0, r0, r2
	lsrs r1, r1, #8
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x6a
	strh r3, [r0]
	ldr r1, _080165CC @ =gPlayerCharacterIdleAnims
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _080165D4
	.align 2, 0
_080165A8: .4byte gMultiplayerPlayerTasks
_080165AC: .4byte IWRAM_START + 0x64
_080165B0: .4byte gPlayer
_080165B4: .4byte 0xFFFFFBFF
_080165B8: .4byte 0xFFFFFEFF
_080165BC: .4byte Player_TouchGround
_080165C0: .4byte 0xFFBFFFFF
_080165C4: .4byte gGameMode
_080165C8: .4byte gMultiplayerCharRings
_080165CC: .4byte gPlayerCharacterIdleAnims
_080165D0:
	mov r0, r8
	ldrh r3, [r0, #6]
_080165D4:
	mov r1, r8
	ldrb r0, [r1, #0xb]
	movs r5, #0xf
	ands r5, r0
	ldrh r0, [r6, #0xa]
	adds r4, r6, #0
	adds r4, #0x20
	cmp r0, r3
	bne _080165EC
	ldrb r0, [r4]
	cmp r0, r5
	beq _080165F4
_080165EC:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x30]
_080165F4:
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08016642
	ldr r0, [r7, #0x5c]
	ands r0, r2
	ldr r2, _08016664 @ =gPlayer
	mov ip, r2
	cmp r0, #0
	beq _08016622
	ldr r0, [r2, #0x20]
	ldr r1, _08016668 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
_08016622:
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016642
	mov r2, ip
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08016642
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08016642:
	strh r3, [r6, #0xa]
	strb r5, [r4]
	mov r3, r8
	ldrb r0, [r3, #0xb]
	lsrs r0, r0, #4
	adds r1, r7, #0
	adds r1, #0x58
	strb r0, [r1]
	ldrb r0, [r3, #0xc]
	adds r1, r6, #0
	adds r1, #0x22
	strb r0, [r1]
	ldrb r0, [r3, #0xd]
	lsls r0, r0, #2
	ldr r4, [sp]
	strh r0, [r4]
	b _080166F0
	.align 2, 0
_08016664: .4byte gPlayer
_08016668: .4byte 0xFFBFFFFF
_0801666C:
	adds r3, r7, #0
	adds r3, #0x50
	adds r0, r7, #0
	adds r0, #0x66
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r5, [r3]
	adds r0, r0, r5
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x52
	adds r0, r7, #0
	adds r0, #0x68
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x61
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0x1e
	bls _080166F0
	ldr r1, _080166D4 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _080166D8 @ =gBackgroundsCopyQueueCursor
	ldr r0, _080166DC @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080166E0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080166E4 @ =gVramGraphicsCopyCursor
	ldr r0, _080166E8 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080166EC @ =gGameMode
	ldrb r0, [r0]
	bl LinkCommunicationError
	b _08016D08
	.align 2, 0
_080166D4: .4byte 0x0000FFFF
_080166D8: .4byte gBackgroundsCopyQueueCursor
_080166DC: .4byte gBackgroundsCopyQueueIndex
_080166E0: .4byte gUnknown_03005390
_080166E4: .4byte gVramGraphicsCopyCursor
_080166E8: .4byte gVramGraphicsCopyQueueIndex
_080166EC: .4byte gGameMode
_080166F0:
	movs r2, #3
	ldr r3, _0801688C @ =gPlayerCharacterIdleAnims
	movs r4, #6
	ldrsh r0, [r3, r4]
	ldrh r1, [r6, #0xa]
	adds r5, r7, #0
	adds r5, #0x54
	str r5, [sp, #0xc]
	ldr r4, _08016890 @ =gCamera
	cmp r0, r1
	ble _08016722
_08016706:
	lsls r0, r2, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08016722
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r0, r1
	bgt _08016706
_08016722:
	ldr r1, [r4]
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r1, [r4]
	ldrh r0, [r2]
	subs r0, r0, r1
	ldr r5, [sp]
	strh r0, [r5, #6]
	ldr r1, [r4, #4]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08016766
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x30]
_08016766:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	ldr r0, _08016894 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _0801680C
	ldr r1, _08016898 @ =gUnknown_030054B4
	ldr r2, _0801689C @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801680C
	movs r1, #1
	mov sl, r1
	movs r5, #0
	ldr r1, _080168A0 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	cmp r0, #0
	beq _080167FE
	ldr r0, _080168A4 @ =gMultiplayerConnections
	ldrb r0, [r0]
	mov r8, r0
	movs r3, #0x10
	mov ip, r3
	mov sb, r2
	adds r4, r1, #0
_080167A8:
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	str r0, [sp, #0x10]
	mov r2, ip
	lsls r2, r5
	mov r0, r8
	ands r2, r0
	adds r0, r5, #4
	asrs r2, r0
	mov r1, sb
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r1, ip
	lsls r1, r0
	mov r3, r8
	ands r1, r3
	mov r3, sb
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r1, r0
	cmp r2, r1
	bne _080167F0
	ldr r1, [sp, #0x10]
	ldr r2, _080168A8 @ =IWRAM_START + 0x54
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080167F0
	movs r3, #0
	mov sl, r3
_080167F0:
	adds r4, #4
	adds r5, #1
	cmp r5, #3
	bhi _080167FE
	ldr r0, [r4]
	cmp r0, #0
	bne _080167A8
_080167FE:
	mov r4, sl
	cmp r4, #0
	beq _0801680C
	bl CreateRoomEvent
	movs r1, #7
	strb r1, [r0]
_0801680C:
	ldr r0, _080168AC @ =gStageFlags
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	ldr r5, _080168B0 @ =gPlayer
	mov ip, r5
	cmp r0, #0
	bne _08016910
	ldr r0, [r7, #0x54]
	ldr r1, _080168B4 @ =0x80000004
	ands r0, r1
	cmp r0, #0
	bne _08016910
	mov r0, ip
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08016838
	b _08016956
_08016838:
	ldr r0, [r7, #0x5c]
	ands r0, r2
	cmp r0, #0
	bne _08016910
	mov r1, ip
	movs r2, #0x2c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08016910
	ldr r0, [r1, #0x20]
	ldr r1, _080168B8 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _08016910
	ldr r0, _08016894 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _080168F0
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r1, [r0]
	ldr r0, _0801689C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bne _08016870
	b _08016A1A
_08016870:
	ldr r0, _080168BC @ =gMultiplayerCharacters
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bls _08016880
	b _08016A1A
_08016880:
	lsls r0, r0, #2
	ldr r1, _080168C0 @ =_080168C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801688C: .4byte gPlayerCharacterIdleAnims
_08016890: .4byte gCamera
_08016894: .4byte gGameMode
_08016898: .4byte gUnknown_030054B4
_0801689C: .4byte 0x04000128
_080168A0: .4byte gMultiplayerPlayerTasks
_080168A4: .4byte gMultiplayerConnections
_080168A8: .4byte IWRAM_START + 0x54
_080168AC: .4byte gStageFlags
_080168B0: .4byte gPlayer
_080168B4: .4byte 0x80000004
_080168B8: .4byte 0x00400080
_080168BC: .4byte gMultiplayerCharacters
_080168C0: .4byte _080168C4
_080168C4: @ jump table
	.4byte _080168E4 @ case 0
	.4byte _080168E4 @ case 1
	.4byte _080168D8 @ case 2
	.4byte _080168DE @ case 3
	.4byte _080168EA @ case 4
_080168D8:
	bl sub_801707C
	b _08016A1A
_080168DE:
	bl sub_8017670
	b _08016A1A
_080168E4:
	bl sub_8016D20
	b _08016A1A
_080168EA:
	bl sub_8017C28
	b _08016A1A
_080168F0:
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _0801690C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bne _08016904
	b _08016A1A
_08016904:
	bl sub_8018120
	b _08016A1A
	.align 2, 0
_0801690C: .4byte 0x04000128
_08016910:
	mov r0, ip
	adds r0, #0x37
	ldrb r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08016956
	adds r0, r7, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08016956
	mov r3, ip
	movs r4, #0x2c
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bne _08016956
	ldr r0, [r3, #0x20]
	ands r0, r2
	cmp r0, #0
	bne _08016956
	ldr r1, _080169DC @ =gUnknown_030054B4
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08016A1A
_08016956:
	ldr r0, _080169E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _080169F4
	adds r4, r7, #0
	adds r4, #0x56
	ldrb r1, [r4]
	ldr r0, _080169E4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _080169BC
	ldr r0, _080169E8 @ =gMultiplayerCharacters
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bgt _080169BC
	cmp r0, #2
	blt _080169BC
	ldr r1, [r7, #0x5c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080169BC
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r7, #0x5c]
	ldr r2, _080169EC @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080169AC
	ldr r0, [r2, #0x20]
	ldr r1, _080169F0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
_080169AC:
	bl CreateRoomEvent
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldrb r1, [r4]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_080169BC:
	ldr r2, _080169EC @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016A1A
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08016A1A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
	b _08016A12
	.align 2, 0
_080169DC: .4byte gUnknown_030054B4
_080169E0: .4byte gGameMode
_080169E4: .4byte 0x04000128
_080169E8: .4byte gMultiplayerCharacters
_080169EC: .4byte gPlayer
_080169F0: .4byte 0xFFBFFFFF
_080169F4:
	mov r5, ip
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016A1A
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08016A1A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08016A12:
	adds r1, r7, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_08016A1A:
	ldr r0, [sp, #0xc]
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016A86
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08016A5C @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016A60
	movs r0, #0xff
	lsls r0, r0, #8
	ldr r3, [sp]
	strh r0, [r3, #2]
	b _08016A68
	.align 2, 0
_08016A5C: .4byte gUnknown_030054B8
_08016A60:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r4, [sp]
	strh r0, [r4, #2]
_08016A68:
	ldr r5, [sp, #0xc]
	ldrh r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016A7C
	ldr r1, [sp]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_08016A7C:
	adds r0, r6, #0
	ldr r1, [sp]
	bl TransformSprite
	b _08016ACC
_08016A86:
	ldr r2, [r6, #0x10]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r6, #0x10]
	ldr r3, [sp, #0xc]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016AA4
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	b _08016AA8
_08016AA4:
	ldr r0, _08016AC0 @ =0xFFFFFBFF
	ands r2, r0
_08016AA8:
	str r2, [r6, #0x10]
	ldr r4, [sp, #0xc]
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016AC4
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08016ACA
	.align 2, 0
_08016AC0: .4byte 0xFFFFFBFF
_08016AC4:
	ldr r0, [r6, #0x10]
	ldr r1, _08016C0C @ =0xFFFFF7FF
	ands r0, r1
_08016ACA:
	str r0, [r6, #0x10]
_08016ACC:
	ldr r1, [r6, #0x10]
	ldr r0, _08016C10 @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r6, #0x10]
	ldr r5, [sp, #0xc]
	ldrh r2, [r5]
	movs r0, #0x30
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r6, #0x10]
	ldrh r3, [r5]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08016AEE
	b _08016CE8
_08016AEE:
	ldr r0, _08016C14 @ =gStageTime
	ldr r0, [r0]
	movs r4, #2
	ands r0, r4
	movs r1, #0x57
	adds r1, r1, r7
	mov sb, r1
	cmp r0, #0
	bne _08016B48
	ldrb r1, [r1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08016B48
	ldr r2, [r7, #0x5c]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08016B48
	ldr r1, _08016C18 @ =gUnknown_030054B4
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08016B48
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016B36
	b _08016CE8
_08016B36:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08016B40
	b _08016CE8
_08016B40:
	ands r2, r4
	cmp r2, #0
	beq _08016B48
	b _08016CE8
_08016B48:
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	cmp r0, #0
	beq _08016B60
	movs r4, #0x88
	lsls r4, r4, #3
	adds r1, r4, #0
_08016B60:
	strh r1, [r6, #0x1a]
	ldr r5, [r6, #0x10]
	ldr r0, _08016C1C @ =0xFFFFFE7F
	ands r5, r0
	str r5, [r6, #0x10]
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08016BE6
	ldr r0, _08016C20 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08016BAE
	ldr r0, _08016C24 @ =gMultiplayerConnections
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
	ldr r4, _08016C28 @ =0x04000128
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
	beq _08016BE6
_08016BAE:
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016BE6
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _08016C28 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08016BE6
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r5, r0
	str r5, [r6, #0x10]
	ldr r2, _08016C2C @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08016C30 @ =gWinRegs
	ldr r0, _08016C34 @ =0x0000083F
	strh r0, [r1, #0xa]
_08016BE6:
	ldrh r0, [r6, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08016C38
	movs r4, #0x18
	ldrsh r1, [r6, r4]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08016C38
	cmp r1, #0xdf
	bgt _08016C38
	adds r0, r6, #0
	bl DisplaySprite
	b _08016CE8
	.align 2, 0
_08016C0C: .4byte 0xFFFFF7FF
_08016C10: .4byte 0xFFFFCFFF
_08016C14: .4byte gStageTime
_08016C18: .4byte gUnknown_030054B4
_08016C1C: .4byte 0xFFFFFE7F
_08016C20: .4byte gGameMode
_08016C24: .4byte gMultiplayerConnections
_08016C28: .4byte 0x04000128
_08016C2C: .4byte gDispCnt
_08016C30: .4byte gWinRegs
_08016C34: .4byte 0x0000083F
_08016C38:
	ldr r0, _08016C78 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08016CE8
	ldr r0, _08016C7C @ =gCamera
	movs r5, #0x16
	ldrsh r1, [r6, r5]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #2
	cmp r0, r1
	ble _08016C88
	ldr r1, _08016C80 @ =0xFFFFFA60
	adds r0, r1, #0
	ldrh r2, [r6, #0x16]
	adds r1, r0, r2
	strh r1, [r6, #0x16]
	ldr r3, [sp]
	ldrh r3, [r3, #6]
	adds r0, r0, r3
	ldr r4, [sp]
	strh r0, [r4, #6]
	ldr r5, _08016C84 @ =0xFFFFFCA0
	adds r0, r5, #0
	ldrh r2, [r6, #0x18]
	adds r1, r0, r2
	strh r1, [r6, #0x18]
	ldrh r3, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	b _08016CB0
	.align 2, 0
_08016C78: .4byte gGameMode
_08016C7C: .4byte gCamera
_08016C80: .4byte 0xFFFFFA60
_08016C84: .4byte 0xFFFFFCA0
_08016C88:
	movs r4, #0xb4
	lsls r4, r4, #3
	adds r0, r4, #0
	ldrh r5, [r6, #0x16]
	adds r1, r0, r5
	strh r1, [r6, #0x16]
	ldr r1, [sp]
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ldr r2, [sp]
	strh r0, [r2, #6]
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r4, [r6, #0x18]
	adds r1, r0, r4
	strh r1, [r6, #0x18]
	ldrh r5, [r2, #8]
	adds r0, r0, r5
	strh r0, [r2, #8]
_08016CB0:
	ldrh r0, [r6, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08016CE8
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08016CE8
	cmp r1, #0xdf
	bgt _08016CE8
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016CE2
	adds r0, r6, #0
	ldr r1, [sp]
	bl TransformSprite
_08016CE2:
	adds r0, r6, #0
	bl DisplaySprite
_08016CE8:
	ldr r4, _08016D18 @ =gShouldSpawnMPAttackEffect
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016CF8
	bl CreateMPAttackEffect
	movs r0, #0
	strb r0, [r4]
_08016CF8:
	ldr r4, _08016D1C @ =gShouldSpawnMPAttack2Effect
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016D08
	bl CreateMPAttack2Effect
	movs r0, #0
	strb r0, [r4]
_08016D08:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016D18: .4byte gShouldSpawnMPAttackEffect
_08016D1C: .4byte gShouldSpawnMPAttack2Effect

	
.syntax divided
