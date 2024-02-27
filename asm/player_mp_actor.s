.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

	thumb_func_start Task_CreateMultiplayerPlayer
Task_CreateMultiplayerPlayer: @ 0x0801623C
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
	bl sub_8023B5C
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
	ldr r0, _080165BC @ =PlayerCB_8025318
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
_080165BC: .4byte PlayerCB_8025318
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
	ldr r1, _080166D8 @ =gUnknown_03002AE4
	ldr r0, _080166DC @ =gUnknown_0300287C
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
	bl MultiPakCommunicationError
	b _08016D08
	.align 2, 0
_080166D4: .4byte 0x0000FFFF
_080166D8: .4byte gUnknown_03002AE4
_080166DC: .4byte gUnknown_0300287C
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
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
_0801680C:
	ldr r0, _080168AC @ =gUnknown_03005424
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
_080168AC: .4byte gUnknown_03005424
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
	bl sub_8019224
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
	bl sub_8004860
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
	bl sub_8004860
_08016CE2:
	adds r0, r6, #0
	bl DisplaySprite
_08016CE8:
	ldr r4, _08016D18 @ =gUnknown_03005B7C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016CF8
	bl sub_8087368
	movs r0, #0
	strb r0, [r4]
_08016CF8:
	ldr r4, _08016D1C @ =gUnknown_0300583C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016D08
	bl sub_801A384
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
_08016D18: .4byte gUnknown_03005B7C
_08016D1C: .4byte gUnknown_0300583C

	thumb_func_start sub_8016D20
sub_8016D20: @ 0x08016D20
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r2, _08016DB8 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0xc
	ldr r0, _08016DBC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	mov r8, r6
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08016D58
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08016D58
	bl sub_8017F34
_08016D58:
	ldr r0, _08016DC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08016D90
	ldr r0, _08016DC4 @ =gMultiplayerConnections
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
	ldr r4, _08016DC8 @ =0x04000128
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
	beq _08016DCC
_08016D90:
	bl sub_8018300
	cmp r0, #0
	bne _08016D9A
	b _0801706A
_08016D9A:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08016DA6
	b _0801706A
_08016DA6:
	ldr r2, _08016DB8 @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r6, #0x4c]
	b _0801706A
	.align 2, 0
_08016DB8: .4byte gPlayer
_08016DBC: .4byte gCurTask
_08016DC0: .4byte gGameMode
_08016DC4: .4byte gMultiplayerConnections
_08016DC8: .4byte 0x04000128
_08016DCC:
	adds r1, r6, #0
	adds r1, #0x60
	ldrb r0, [r1]
	adds r4, r0, #0
	mov sb, r1
	cmp r4, #0
	beq _08016DDC
	b _08017002
_08016DDC:
	bl sub_80181E0
	cmp r0, #0
	beq _08016E9E
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08016DFC
	ldr r0, _08016E5C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	str r4, [r6, #0x4c]
_08016DFC:
	mov r1, r8
	ldrh r0, [r1, #0xa]
	cmp r0, #3
	beq _08016E06
	b _0801706A
_08016E06:
	ldr r3, _08016E5C @ =gPlayer
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08016E60 @ =PlayerCB_8025318
	str r0, [r3]
	adds r0, r3, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _08016E3E
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _08016E3E
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08016E3E:
	ldr r0, _08016E64 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08016E68
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x52
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	ble _08016E7A
	b _08016FBC
	.align 2, 0
_08016E5C: .4byte gPlayer
_08016E60: .4byte PlayerCB_8025318
_08016E64: .4byte gUnknown_03005424
_08016E68:
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x52
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	bge _08016E7A
	b _08016FBC
_08016E7A:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08016E8A
	b _08016FE6
_08016E8A:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1f
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #4
	b _08016FF6
_08016E9E:
	ldr r0, [r5, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08016EB2
	mov r3, r8
	ldr r0, [r3, #0x30]
	cmp r0, r1
	beq _08016EB2
	b _0801706A
_08016EB2:
	ldr r7, _08016FA0 @ =gPlayer
	adds r0, r7, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08016ED4
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08016ED4
	b _0801706A
_08016ED4:
	adds r0, r6, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r5, r6, #0
	adds r5, #0x52
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, r8
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08016F26
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08016F26
	ldr r0, [r7, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r7, #0x20]
_08016F26:
	str r2, [r6, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _08016F38
	movs r0, #0x1e
	mov r1, sb
	strb r0, [r1]
_08016F38:
	ldr r0, _08016FA4 @ =0x00010028
	ands r0, r2
	cmp r0, #0
	bne _08016F42
	b _0801706A
_08016F42:
	mov r2, r8
	ldrh r0, [r2, #0xa]
	cmp r0, #3
	beq _08016F4C
	b _0801706A
_08016F4C:
	ldr r3, _08016FA0 @ =gPlayer
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08016FA8 @ =PlayerCB_8025318
	str r0, [r3]
	adds r0, r3, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _08016F84
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _08016F84
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08016F84:
	ldr r0, _08016FAC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08016FB0
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r3, #0
	ldrsh r1, [r5, r3]
	cmp r0, r1
	ble _08016FC4
	b _08016FBC
	.align 2, 0
_08016FA0: .4byte gPlayer
_08016FA4: .4byte 0x00010028
_08016FA8: .4byte PlayerCB_8025318
_08016FAC: .4byte gUnknown_03005424
_08016FB0:
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r3, #0
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bge _08016FC4
_08016FBC:
	movs r0, #0x1e
	mov r4, sb
	strb r0, [r4]
	b _0801706A
_08016FC4:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08016FE6
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1f
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #4
	b _08016FF6
_08016FE6:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	subs r1, #0x22
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xf4
	lsls r0, r0, #8
_08016FF6:
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	movs r0, #0x1e
	mov r2, sb
	strb r0, [r2]
	b _0801706A
_08017002:
	subs r0, #1
	strb r0, [r1]
	ldr r5, _08017078 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801706A
	ldr r0, [r5, #0x3c]
	cmp r0, r8
	bne _0801706A
	adds r0, r6, #0
	adds r0, #0x50
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, #2
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	mov r0, r8
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017068
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08017068
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
_08017068:
	str r2, [r6, #0x4c]
_0801706A:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017078: .4byte gPlayer

	thumb_func_start sub_801707C
sub_801707C: @ 0x0801707C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r2, _08017128 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _0801712C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	str r7, [sp, #0x10]
	ldr r1, [r2, #0x20]
	lsrs r3, r1, #5
	movs r0, #1
	ands r3, r0
	str r3, [sp, #0x18]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080170C6
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _080170C6
	bl sub_8017F34
	movs r4, #1
	str r4, [sp, #0x14]
_080170C6:
	ldr r0, _08017130 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r0
	cmp r0, #4
	bne _08017102
	ldr r0, _08017134 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x56
	ldrb r0, [r5]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017138 @ =0x04000128
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
	str r5, [sp, #0x24]
	cmp r1, r3
	beq _0801713C
_08017102:
	bl sub_8018300
	cmp r0, #0
	bne _0801710C
	b _0801765E
_0801710C:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017118
	b _0801765E
_08017118:
	ldr r2, _08017128 @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _0801765E
	.align 2, 0
_08017128: .4byte gPlayer
_0801712C: .4byte gCurTask
_08017130: .4byte gGameMode
_08017134: .4byte gMultiplayerConnections
_08017138: .4byte 0x04000128
_0801713C:
	ldr r6, _080171A8 @ =gPlayer
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801715C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0801715C
	b _0801765E
_0801715C:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x28]
	cmp r0, #0
	beq _08017174
	ldr r5, [r7, #0x5c]
	mov r2, r8
	ands r5, r2
	cmp r5, #0
	bne _08017174
	b _080175F8
_08017174:
	movs r4, #0
	strb r4, [r1]
	ldr r3, [sp, #0x10]
	ldrh r0, [r3, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080171CE
	bl sub_80181E0
	cmp r0, #0
	beq _080171AC
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0801719A
	b _0801765E
_0801719A:
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
	str r4, [r7, #0x4c]
	b _0801765E
	.align 2, 0
_080171A8: .4byte gPlayer
_080171AC:
	ldr r4, [sp, #0x10]
	ldrh r0, [r4, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080171CE
	mov r5, sb
	ldr r0, [r5, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080171CE
	ldr r0, [r4, #0x30]
	cmp r0, r1
	beq _080171CE
	b _0801765E
_080171CE:
	ldr r0, _080172C8 @ =gPlayer
	mov sl, r0
	ldr r0, [r0, #0x20]
	lsrs r0, r0, #1
	mov sb, r0
	movs r4, #1
	mov r1, sb
	ands r1, r4
	mov sb, r1
	movs r2, #0x50
	adds r2, r2, r7
	mov r8, r2
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r6, r7, #0
	adds r6, #0x52
	movs r5, #0
	ldrsh r2, [r6, r5]
	adds r0, r7, #0
	adds r0, #0x66
	movs r5, #0
	ldrsh r3, [r0, r5]
	adds r0, #2
	movs r5, #0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0x10]
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	mov r3, r8
	str r3, [sp, #0x1c]
	str r5, [sp, #0x20]
	cmp r0, #0
	beq _0801723A
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801723A
	mov r4, sl
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
_0801723A:
	str r2, [r7, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _0801724C
	movs r0, #0x1e
	ldr r5, [sp, #0x28]
	strb r0, [r5]
_0801724C:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017258
	b _0801738A
_08017258:
	mov r0, sb
	cmp r0, #0
	bne _08017266
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _08017266
	b _0801737E
_08017266:
	ldr r0, _080172CC @ =0x00010028
	ands r0, r2
	cmp r0, #0
	bne _08017270
	b _0801737E
_08017270:
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08017280
	b _0801737E
_08017280:
	ldr r0, _080172D0 @ =gUnknown_03005424
	ldrh r3, [r0]
	lsrs r2, r3, #7
	movs r1, #1
	ands r2, r1
	ldr r4, [sp, #0x20]
	ldrh r0, [r4]
	lsrs r0, r0, #3
	bics r1, r0
	cmp r2, r1
	beq _0801737E
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _080172D8
	ldr r2, _080172C8 @ =gPlayer
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, r0
	bge _080172AE
	adds r1, r0, #0
_080172AE:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	adds r2, #0x38
	ldrb r2, [r2]
	add r3, sp, #0xc
	str r3, [sp]
	ldr r3, _080172D4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	b _08017302
	.align 2, 0
_080172C8: .4byte gPlayer
_080172CC: .4byte 0x00010028
_080172D0: .4byte gUnknown_03005424
_080172D4: .4byte sub_801EE64
_080172D8:
	ldr r2, _08017364 @ =gPlayer
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r4, #0
	ldrsh r1, [r6, r4]
	cmp r1, r0
	ble _080172E8
	adds r1, r0, #0
_080172E8:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	subs r0, r1, r0
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	add r5, sp, #0xc
	str r5, [sp]
	ldr r4, _08017368 @ =sub_801EE64
	str r4, [sp, #4]
_08017302:
	bl sub_801E4E4
	adds r1, r0, #0
	ldr r4, _08017364 @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	subs r0, r1, r0
	cmp r0, #0
	ble _0801737E
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x5c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	bl sub_8019224
	movs r1, #8
	strb r1, [r0]
	ldr r2, [sp, #0x24]
	ldrb r1, [r2]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	ldr r0, _0801736C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08017374
	ldr r0, [r7, #0x5c]
	ldr r1, _08017370 @ =0xFFFFFEFF
	ands r0, r1
	b _0801737C
	.align 2, 0
_08017364: .4byte gPlayer
_08017368: .4byte sub_801EE64
_0801736C: .4byte gUnknown_03005424
_08017370: .4byte 0xFFFFFEFF
_08017374:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
_0801737C:
	str r0, [r7, #0x5c]
_0801737E:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0801738A
	b _0801765E
_0801738A:
	ldr r3, _080173CC @ =gPlayer
	mov r8, r3
	mov r1, r8
	adds r1, #0x64
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080173D0 @ =PlayerCB_8025318
	mov r4, r8
	str r0, [r4]
	ldr r0, [r4, #0x20]
	movs r5, #2
	mov sb, r5
	orrs r0, r5
	str r0, [r4, #0x20]
	mov r0, r8
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, r8
	bl sub_8029E6C
	cmp r0, #0
	beq _080173D8
	movs r0, #0x1e
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _080173D4 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	b _0801749C
	.align 2, 0
_080173CC: .4byte gPlayer
_080173D0: .4byte PlayerCB_8025318
_080173D4: .4byte 0xFFBFFFFF
_080173D8:
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08017426
	mov r3, r8
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	ldr r2, _08017474 @ =gCamera
	ldr r0, [r2, #0x30]
	cmp r1, r0
	ble _08017426
	ldr r0, [r2, #0x34]
	cmp r1, r0
	bge _08017426
	ldr r0, _08017478 @ =gUnknown_03005424
	ldrh r5, [r0]
	lsrs r0, r5, #7
	movs r4, #1
	adds r2, r4, #0
	bics r2, r0
	ldr r0, [sp, #0x20]
	ldrh r1, [r0]
	lsrs r1, r1, #3
	adds r0, r4, #0
	bics r0, r1
	cmp r2, r0
	bne _08017426
	ldr r3, [r7, #0x5c]
	lsrs r1, r3, #8
	adds r0, r4, #0
	bics r0, r1
	cmp r0, r2
	bne _08017426
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _08017488
_08017426:
	ldr r4, _0801747C @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _08017480 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08017484 @ =PlayerCB_8025318
	str r0, [r4]
	ldr r0, _08017478 @ =gUnknown_03005424
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	ldr r5, [sp, #0x20]
	ldrh r1, [r5]
	lsrs r1, r1, #3
	adds r0, r3, #0
	bics r0, r1
	cmp r2, r0
	bne _0801746E
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _0801746E
	b _080175A4
_0801746E:
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
	b _080175A4
	.align 2, 0
_08017474: .4byte gCamera
_08017478: .4byte gUnknown_03005424
_0801747C: .4byte gPlayer
_08017480: .4byte 0xFFBFFFFF
_08017484: .4byte PlayerCB_8025318
_08017488:
	mov r0, r8
	ldr r1, [r0, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080174AC
	ldr r0, _080174A8 @ =0xFFBFFFFF
	ands r1, r0
	mov r2, r8
	str r1, [r2, #0x20]
_0801749C:
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	b _080175A4
	.align 2, 0
_080174A8: .4byte 0xFFBFFFFF
_080174AC:
	movs r0, #0x80
	ands r0, r5
	movs r1, #4
	orrs r3, r1
	str r3, [r7, #0x5c]
	ldr r3, [sp, #0x1c]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r5, r1, #8
	cmp r0, #0
	bne _0801751C
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r1, [sp, #0x10]
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	adds r0, #0x11
	lsls r6, r0, #8
	mov r2, r8
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	adds r2, #0x38
	ldrb r2, [r2]
	add r3, sp, #0xc
	str r3, [sp]
	ldr r3, _08017514 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bge _0801757A
	lsls r0, r1, #8
	adds r6, r6, r0
	mov r4, r8
	ldr r0, [r4, #0x20]
	ldr r1, _08017518 @ =0xFFBFFFFF
	ands r0, r1
	mov r1, sb
	orrs r0, r1
	str r0, [r4, #0x20]
	b _08017570
	.align 2, 0
_08017514: .4byte sub_801EE64
_08017518: .4byte 0xFFBFFFFF
_0801751C:
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldr r1, [sp, #0x10]
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	subs r0, #0x11
	lsls r6, r0, #8
	mov r3, r8
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r0, r0, r1
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	mov r2, r8
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	add r4, sp, #0xc
	str r4, [sp]
	ldr r4, _080175D8 @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bge _0801757A
	lsls r0, r1, #8
	subs r6, r6, r0
	mov r1, r8
	ldr r0, [r1, #0x20]
	ldr r1, _080175DC @ =0xFFBFFFFF
	ands r0, r1
	mov r2, sb
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x20]
_08017570:
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
_0801757A:
	ldr r0, _080175E0 @ =gPlayer
	str r5, [r0, #8]
	str r6, [r0, #0xc]
	ldr r1, [r7, #0x5c]
	movs r2, #4
	ands r1, r2
	adds r3, r0, #0
	cmp r1, #0
	beq _080175AE
	movs r2, #0
	strh r2, [r3, #0x10]
	ldr r0, _080175E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	strh r2, [r3, #0x12]
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
_080175A4:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080175C0
_080175AE:
	bl sub_8019224
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldr r4, [sp, #0x24]
	ldrb r1, [r4]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_080175C0:
	ldr r0, _080175E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080175EC
	ldr r0, [r7, #0x5c]
	ldr r1, _080175E8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r7, #0x5c]
	b _0801765E
	.align 2, 0
_080175D8: .4byte sub_801EE64
_080175DC: .4byte 0xFFBFFFFF
_080175E0: .4byte gPlayer
_080175E4: .4byte gUnknown_03005424
_080175E8: .4byte 0xFFFFFEFF
_080175EC:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x5c]
	b _0801765E
_080175F8:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801765E
	ldr r0, [r6, #0x3c]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _0801765E
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
	ldr r0, [sp, #0x10]
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801765C
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801765C
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
_0801765C:
	str r2, [r7, #0x4c]
_0801765E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8017670
sub_8017670: @ 0x08017670
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r2, _08017718 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov sl, r0
	ldr r0, _0801771C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov sb, r7
	ldr r1, [r2, #0x20]
	lsrs r0, r1, #5
	str r0, [sp, #0x14]
	movs r0, #1
	ldr r3, [sp, #0x14]
	ands r3, r0
	str r3, [sp, #0x14]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080176B6
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _080176B6
	bl sub_8017F34
_080176B6:
	ldr r0, _08017720 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r0
	cmp r0, #4
	bne _080176F2
	ldr r0, _08017724 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x56
	ldrb r0, [r5]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017728 @ =0x04000128
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
	str r5, [sp, #0x20]
	cmp r1, r3
	beq _0801772C
_080176F2:
	bl sub_8018300
	cmp r0, #0
	bne _080176FC
	b _08017C18
_080176FC:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017708
	b _08017C18
_08017708:
	ldr r2, _08017718 @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08017C18
	.align 2, 0
_08017718: .4byte gPlayer
_0801771C: .4byte gCurTask
_08017720: .4byte gGameMode
_08017724: .4byte gMultiplayerConnections
_08017728: .4byte 0x04000128
_0801772C:
	ldr r6, _0801779C @ =gPlayer
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801774C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _0801774C
	b _08017C18
_0801774C:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x24]
	cmp r0, #0
	beq _08017764
	ldr r5, [r7, #0x5c]
	mov r4, r8
	ands r5, r4
	cmp r5, #0
	bne _08017764
	b _08017BB4
_08017764:
	movs r5, #0
	strb r5, [r1]
	ldr r0, _080177A0 @ =0xFFFFFEDC
	adds r4, r0, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080177C8
	bl sub_80181E0
	cmp r0, #0
	beq _080177A4
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0801778E
	b _08017C18
_0801778E:
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
	str r5, [r7, #0x4c]
	b _08017C18
	.align 2, 0
_0801779C: .4byte gPlayer
_080177A0: .4byte 0xFFFFFEDC
_080177A4:
	mov r2, sb
	ldrh r2, [r2, #0xa]
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080177C8
	mov r3, sl
	ldr r0, [r3, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080177C8
	mov r4, sb
	ldr r0, [r4, #0x30]
	cmp r0, r1
	beq _080177C8
	b _08017C18
_080177C8:
	ldr r0, _080178D4 @ =gPlayer
	mov sl, r0
	ldrb r4, [r0, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #0x10
	strb r0, [r1]
	mov r2, sl
	ldrb r3, [r2, #0x17]
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
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	mov r3, r8
	str r3, [sp, #0x18]
	str r6, [sp, #0x1c]
	mov r8, r5
	cmp r0, #0
	beq _0801784E
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801784E
	mov r4, sl
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
_0801784E:
	str r2, [r7, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _08017860
	movs r0, #0x1e
	ldr r1, [sp, #0x24]
	strb r0, [r1]
_08017860:
	ldr r2, [sp, #0x18]
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r4, [sp, #0x1c]
	movs r0, #0
	ldrsh r2, [r4, r0]
	ldr r5, _080178D4 @ =gPlayer
	add r3, sp, #0xc
	str r3, [sp]
	mov r0, sb
	adds r3, r5, #0
	bl CheckRectCollision_SpritePlayer
	cmp r0, #0
	bne _08017880
	b _0801798E
_08017880:
	mov r4, r8
	ldrh r0, [r4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x17
	movs r4, #1
	ands r0, r4
	adds r1, r5, #0
	adds r1, #0x38
	ldrb r1, [r1]
	cmp r0, r1
	beq _08017898
	b _0801798E
_08017898:
	ldr r1, _080178D8 @ =0xFFFFFEDC
	adds r0, r1, #0
	mov r3, sb
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0801798E
	ldr r0, _080178DC @ =gUnknown_03005424
	ldrh r3, [r0]
	lsrs r1, r3, #7
	ands r1, r4
	lsrs r2, r2, #0x13
	adds r0, r4, #0
	bics r0, r2
	cmp r1, r0
	beq _0801798E
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _080178E0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, [sp, #0x1c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080178EE
	b _0801798E
	.align 2, 0
_080178D4: .4byte gPlayer
_080178D8: .4byte 0xFFFFFEDC
_080178DC: .4byte gUnknown_03005424
_080178E0:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r3, [sp, #0x1c]
	movs r4, #0
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _0801798E
_080178EE:
	ldr r4, _08017938 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r2, #0
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	subs r0, #3
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801793C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _08017942
	.align 2, 0
_08017938: .4byte gPlayer
_0801793C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_08017942:
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017986
	bl sub_8019224
	movs r1, #8
	strb r1, [r0]
	ldr r2, [sp, #0x20]
	ldrb r1, [r2]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	ldr r0, _08017974 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801797C
	ldr r0, [r7, #0x5c]
	ldr r1, _08017978 @ =0xFFFFFEFF
	ands r0, r1
	b _08017984
	.align 2, 0
_08017974: .4byte gUnknown_03005424
_08017978: .4byte 0xFFFFFEFF
_0801797C:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
_08017984:
	str r0, [r7, #0x5c]
_08017986:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x5c]
_0801798E:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0801799A
	b _08017C18
_0801799A:
	ldr r6, _080179BC @ =gPlayer
	adds r0, r6, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _080179C4
	movs r0, #0x1e
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	ldr r0, [r6, #0x20]
	ldr r1, _080179C0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	b _08017B9A
	.align 2, 0
_080179BC: .4byte gPlayer
_080179C0: .4byte 0xFFBFFFFF
_080179C4:
	ldr r4, _08017A5C @ =0xFFFFFEDC
	adds r0, r4, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _08017A60 @ =gUnknown_03005424
	cmp r0, #2
	bhi _08017A14
	ldr r0, [r6, #8]
	asrs r1, r0, #8
	ldr r2, _08017A64 @ =gCamera
	ldr r0, [r2, #0x30]
	cmp r1, r0
	ble _08017A14
	ldr r0, [r2, #0x34]
	cmp r1, r0
	bge _08017A14
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
	bne _08017A14
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08017A14
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _08017A70
_08017A14:
	ldr r2, _08017A68 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08017A6C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	adds r2, #0x64
	movs r0, #0
	strh r0, [r2]
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
	bne _08017A54
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08017A54
	b _08017C18
_08017A54:
	movs r0, #0x1e
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	b _08017C18
	.align 2, 0
_08017A5C: .4byte 0xFFFFFEDC
_08017A60: .4byte gUnknown_03005424
_08017A64: .4byte gCamera
_08017A68: .4byte gPlayer
_08017A6C: .4byte 0xFFBFFFFF
_08017A70:
	movs r2, #0x17
	ldrsb r2, [r6, r2]
	movs r0, #0x80
	ands r0, r4
	ldr r3, [sp, #0x18]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r1, r1, #8
	mov r8, r1
	cmp r0, #0
	bne _08017ACC
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
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08017AC8 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08017B1C
	lsls r0, r0, #8
	subs r5, r5, r0
	b _08017B08
	.align 2, 0
_08017AC8: .4byte sub_801EC3C
_08017ACC:
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
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _08017B5C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08017B1C
	lsls r0, r0, #8
	adds r5, r5, r0
_08017B08:
	ldr r0, [r6, #0x20]
	ldr r1, _08017B60 @ =0xFFBFFFFF
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x5c]
	subs r1, #7
	ands r0, r1
	str r0, [r7, #0x5c]
_08017B1C:
	ldr r3, _08017B64 @ =gPlayer
	mov r0, r8
	str r0, [r3, #8]
	str r5, [r3, #0xc]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017B78
	ldr r2, [r3, #0x20]
	movs r0, #8
	orrs r2, r0
	subs r0, #0xd
	ands r2, r0
	adds r0, #2
	ands r2, r0
	str r2, [r3, #0x20]
	mov r1, sb
	str r1, [r3, #0x3c]
	movs r0, #0
	strh r0, [r3, #0x12]
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08017B68
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	b _08017B6C
	.align 2, 0
_08017B5C: .4byte sub_801EC3C
_08017B60: .4byte 0xFFBFFFFF
_08017B64: .4byte gPlayer
_08017B68:
	movs r0, #1
	orrs r2, r0
_08017B6C:
	str r2, [r3, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017B8A
_08017B78:
	bl sub_8019224
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldr r3, [sp, #0x20]
	ldrb r1, [r3]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_08017B8A:
	ldr r0, _08017BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08017BA8
	ldr r0, [r7, #0x5c]
	ldr r1, _08017BA4 @ =0xFFFFFEFF
_08017B9A:
	ands r0, r1
	str r0, [r7, #0x5c]
	b _08017C18
	.align 2, 0
_08017BA0: .4byte gUnknown_03005424
_08017BA4: .4byte 0xFFFFFEFF
_08017BA8:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x5c]
	b _08017C18
_08017BB4:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017C18
	ldr r0, [r6, #0x3c]
	cmp r0, sb
	bne _08017C18
	adds r0, r7, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
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
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017C16
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08017C16
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
_08017C16:
	str r2, [r7, #0x4c]
_08017C18:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8017C28
sub_8017C28: @ 0x08017C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08017CB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	str r7, [sp, #0xc]
	ldr r2, _08017CBC @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017C58
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _08017C58
	bl sub_8017F34
_08017C58:
	ldr r0, _08017CC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08017C90
	ldr r0, _08017CC4 @ =gMultiplayerConnections
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
	ldr r4, _08017CC8 @ =0x04000128
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
	beq _08017CCC
_08017C90:
	bl sub_8018300
	cmp r0, #0
	bne _08017C9A
	b _08017F1E
_08017C9A:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017CA6
	b _08017F1E
_08017CA6:
	ldr r2, _08017CBC @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08017F1E
	.align 2, 0
_08017CB8: .4byte gCurTask
_08017CBC: .4byte gPlayer
_08017CC0: .4byte gGameMode
_08017CC4: .4byte gMultiplayerConnections
_08017CC8: .4byte 0x04000128
_08017CCC:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x14]
	cmp r0, #0
	beq _08017CDA
	b _08017EB4
_08017CDA:
	ldr r0, [sp, #0xc]
	ldr r1, [r0, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08017D3C
	ldr r5, _08017D38 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08017D08
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08017D08
	b _08017F1E
_08017D08:
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
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _08017EFA
	.align 2, 0
_08017D38: .4byte gPlayer
_08017D3C:
	ldr r0, _08017DD4 @ =gPlayer
	str r0, [sp, #0x10]
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08017D5E
	ldr r0, [sp, #0x10]
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08017D5E
	b _08017F1E
_08017D5E:
	movs r1, #0x50
	adds r1, r1, r7
	mov sl, r1
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r5, #0x66
	adds r5, r5, r7
	mov r8, r5
	movs r6, #0
	ldrsh r3, [r5, r6]
	adds r6, r7, #0
	adds r6, #0x68
	movs r4, #0
	ldrsh r0, [r6, r4]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	bl sub_800DA4C
	adds r3, r0, #0
	movs r1, #2
	ands r0, r1
	mov r2, sl
	mov sl, r6
	mov ip, r5
	cmp r0, #0
	beq _08017DF4
	ldr r5, [sp, #0x10]
	ldr r0, [r5, #0x20]
	ands r0, r1
	cmp r0, #0
	bne _08017DF4
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017DF4
	ldr r6, [sp, #0xc]
	ldrh r1, [r6, #0xa]
	movs r0, #0xbd
	lsls r0, r0, #1
	cmp r1, r0
	bne _08017DDC
	ldr r0, _08017DD8 @ =0xFFFFF880
	bl sub_80188A4
	b _08017E56
	.align 2, 0
_08017DD4: .4byte gPlayer
_08017DD8: .4byte 0xFFFFF880
_08017DDC:
	ldr r0, _08017DEC @ =0x0000017F
	cmp r1, r0
	bne _08017DF4
	ldr r0, _08017DF0 @ =0xFFFFF580
	bl sub_80188A4
	b _08017E56
	.align 2, 0
_08017DEC: .4byte 0x0000017F
_08017DF0: .4byte 0xFFFFF580
_08017DF4:
	movs r4, #1
	adds r0, r3, #0
	ands r0, r4
	cmp r0, #0
	beq _08017E64
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	cmp r0, #0
	beq _08017E1C
	ldr r1, _08017E18 @ =gPlayer
	ldrh r2, [r1, #0x10]
	movs r4, #0x10
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _08017E3C
	b _08017E32
	.align 2, 0
_08017E18: .4byte gPlayer
_08017E1C:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r3
	cmp r0, #0
	beq _08017E3C
	ldr r1, _08017E60 @ =gPlayer
	ldrh r2, [r1, #0x10]
	movs r5, #0x10
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge _08017E3C
_08017E32:
	rsbs r0, r2, #0
	strh r0, [r1, #0x10]
	ldrh r0, [r1, #0x14]
	rsbs r0, r0, #0
	strh r0, [r1, #0x14]
_08017E3C:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	beq _08017E56
	ldr r1, _08017E60 @ =gPlayer
	ldrh r2, [r1, #0x12]
	movs r6, #0x12
	ldrsh r0, [r1, r6]
	cmp r0, #0
	ble _08017E56
	rsbs r0, r2, #0
	strh r0, [r1, #0x12]
_08017E56:
	movs r0, #0x1e
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	b _08017F1E
	.align 2, 0
_08017E60: .4byte gPlayer
_08017E64:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r5, sb
	movs r6, #0
	ldrsh r2, [r5, r6]
	mov r0, r8
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov r6, sl
	movs r5, #0
	ldrsh r0, [r6, r5]
	str r0, [sp]
	mov r6, ip
	ldrh r0, [r6]
	lsrs r0, r0, #7
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	bl sub_800D0A0
	adds r3, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017F1C
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08017F1C
	ldr r0, _08017EB0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	b _08017F1C
	.align 2, 0
_08017EB0: .4byte gPlayer
_08017EB4:
	subs r0, #1
	strb r0, [r1]
	ldr r5, _08017F30 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017F1E
	ldr r0, [r5, #0x3c]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _08017F1E
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
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
_08017EFA:
	ldr r0, [sp, #0xc]
	bl sub_800D0A0
	adds r3, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017F1C
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08017F1C
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
_08017F1C:
	str r3, [r7, #0x4c]
_08017F1E:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017F30: .4byte gPlayer

	thumb_func_start sub_8017F34
sub_8017F34: @ 0x08017F34
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08017F78 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r0, [r6, #0x44]
	cmp r0, #0
	bge _08017F4C
	rsbs r0, r0, #0
_08017F4C:
	cmp r0, #0x80
	bgt _08017F5C
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bge _08017F58
	rsbs r0, r0, #0
_08017F58:
	cmp r0, #0x80
	ble _08017F80
_08017F5C:
	ldr r2, _08017F7C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	b _08018110
	.align 2, 0
_08017F78: .4byte gCurTask
_08017F7C: .4byte gPlayer
_08017F80:
	ldr r1, _08017FCC @ =gMultiplayerPlayerTasks
	ldr r0, _08017FD0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08017FD4 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r4, #0x80
	adds r1, r4, #0
	ands r1, r0
	ldr r2, _08017FD4 @ =IWRAM_START + 0x54
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _08017FE4
	ldr r2, _08017FD8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x3c]
	ldr r1, _08017FDC @ =IWRAM_START + 0x56
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r2, _08017FE0 @ =IWRAM_START + 0x64
	adds r0, r3, r2
	strb r1, [r0]
	b _08018110
	.align 2, 0
_08017FCC: .4byte gMultiplayerPlayerTasks
_08017FD0: .4byte 0x04000128
_08017FD4: .4byte IWRAM_START + 0x54
_08017FD8: .4byte gPlayer
_08017FDC: .4byte IWRAM_START + 0x56
_08017FE0: .4byte IWRAM_START + 0x64
_08017FE4:
	ldr r2, _08018008 @ =gPlayer
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, _0801800C @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _08018010
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	b _08018016
	.align 2, 0
_08018008: .4byte gPlayer
_0801800C: .4byte gUnknown_03005424
_08018010:
	ldr r1, [r5, #0xc]
	ldr r2, _08018050 @ =0xFFFFFE00
	adds r1, r1, r2
_08018016:
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r5, #0xc]
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bge _08018058
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08018054 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0801809C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	b _08018084
	.align 2, 0
_08018050: .4byte 0xFFFFFE00
_08018054: .4byte sub_801EC3C
_08018058:
	cmp r0, #0
	ble _0801809C
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _080180D4 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0801809C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
_08018084:
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_0801809C:
	ldr r1, [r6, #0x44]
	cmp r1, #0
	bge _080180E0
	ldr r5, _080180D8 @ =gPlayer
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _080180DC @ =sub_801EB44
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08018110
	lsls r1, r0, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	b _08018110
	.align 2, 0
_080180D4: .4byte sub_801EC3C
_080180D8: .4byte gPlayer
_080180DC: .4byte sub_801EB44
_080180E0:
	cmp r1, #0
	ble _08018110
	ldr r4, _08018118 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0801811C @ =sub_801EB44
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08018110
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_08018110:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018118: .4byte gPlayer
_0801811C: .4byte sub_801EB44

	thumb_func_start sub_8018120
sub_8018120: @ 0x08018120
	push {r4, r5, r6, r7, lr}
	ldr r0, _080181C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r3, _080181C8 @ =gPlayer
	ldr r4, [r3, #0x20]
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0801819C
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _0801819C
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r1, [r3, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3, #0xc]
	ldr r1, _080181CC @ =gMultiplayerPlayerTasks
	ldr r0, _080181D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _080181D4 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	adds r2, r0, #0
	ands r2, r1
	ldr r7, _080181D4 @ =IWRAM_START + 0x54
	adds r1, r5, r7
	ldrh r1, [r1]
	ands r0, r1
	cmp r2, r0
	beq _0801819C
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	str r4, [r3, #0x20]
	adds r0, #8
	str r0, [r3, #0x3c]
	ldr r1, _080181D8 @ =IWRAM_START + 0x56
	adds r0, r5, r1
	ldrb r1, [r0]
	ldr r2, _080181DC @ =IWRAM_START + 0x64
	adds r0, r5, r2
	strb r1, [r0]
_0801819C:
	bl sub_8018300
	cmp r0, #0
	beq _080181BC
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080181BC
	ldr r2, _080181C8 @ =gPlayer
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r6, #0x4c]
_080181BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080181C4: .4byte gCurTask
_080181C8: .4byte gPlayer
_080181CC: .4byte gMultiplayerPlayerTasks
_080181D0: .4byte 0x04000128
_080181D4: .4byte IWRAM_START + 0x54
_080181D8: .4byte IWRAM_START + 0x56
_080181DC: .4byte IWRAM_START + 0x64

	thumb_func_start sub_80181E0
sub_80181E0: @ 0x080181E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r5, _08018270 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, _08018274 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	mov r8, r6
	ldr r0, [r1, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080182D0
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _080182D0
	ldr r1, _08018278 @ =IWRAM_START + 0x50
	adds r0, r4, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, _0801827C @ =IWRAM_START + 0x52
	adds r0, r4, r3
	movs r7, #0
	ldrsh r2, [r0, r7]
	adds r3, #0x14
	adds r0, r4, r3
	movs r7, #0
	ldrsh r3, [r0, r7]
	ldr r7, _08018280 @ =IWRAM_START + 0x68
	adds r0, r4, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	str r0, [sp]
	ldr r7, _08018284 @ =IWRAM_START + 0x54
	adds r0, r4, r7
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_800DA4C
	adds r2, r0, #0
	ands r0, r4
	cmp r0, #0
	beq _080182D0
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080182A6
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08018288
	ldrh r1, [r5, #0x10]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _080182A6
	b _0801829C
	.align 2, 0
_08018270: .4byte gPlayer
_08018274: .4byte gCurTask
_08018278: .4byte IWRAM_START + 0x50
_0801827C: .4byte IWRAM_START + 0x52
_08018280: .4byte IWRAM_START + 0x68
_08018284: .4byte IWRAM_START + 0x54
_08018288:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _080182A6
	ldrh r1, [r5, #0x10]
	movs r7, #0x10
	ldrsh r0, [r5, r7]
	cmp r0, #0
	bge _080182A6
_0801829C:
	rsbs r0, r1, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x14]
	rsbs r0, r0, #0
	strh r0, [r5, #0x14]
_080182A6:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _080182C0
	ldr r1, _080182CC @ =gPlayer
	ldrh r2, [r1, #0x12]
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080182C0
	rsbs r0, r2, #0
	strh r0, [r1, #0x12]
_080182C0:
	mov r1, r8
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _080182F0
	.align 2, 0
_080182CC: .4byte gPlayer
_080182D0:
	ldr r2, _080182FC @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080182EE
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _080182EE
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_080182EE:
	movs r0, #0
_080182F0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080182FC: .4byte gPlayer

@ Out:
@  bool32 (hit?)
	thumb_func_start sub_8018300
sub_8018300: @ 0x08018300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r2, _080183A4 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, _080183A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	str r6, [sp, #0xc]
	adds r0, #0x60
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08018332
	b _08018634
_08018332:
	ldr r1, _080183AC @ =IWRAM_START + 0x50
	adds r5, r4, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _080183B0 @ =IWRAM_START + 0x52
	adds r7, r4, r3
	movs r2, #0
	ldrsh r0, [r7, r2]
	mov ip, r0
	adds r3, #0x14
	adds r3, r3, r4
	mov r8, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp, #0x20]
	ldr r3, _080183B4 @ =IWRAM_START + 0x68
	adds r3, r3, r4
	mov sb, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp]
	ldr r3, _080183B8 @ =IWRAM_START + 0x54
	adds r4, r4, r3
	ldrh r0, [r4]
	lsrs r0, r0, #7
	movs r2, #1
	mov sl, r2
	ands r0, r2
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800DA4C
	adds r2, r0, #0
	ldr r0, _080183BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08018400
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08018400
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080183C8
	ldr r5, _080183C0 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080183C4 @ =0xFFFFFCA0
	b _080183D6
	.align 2, 0
_080183A4: .4byte gPlayer
_080183A8: .4byte gCurTask
_080183AC: .4byte IWRAM_START + 0x50
_080183B0: .4byte IWRAM_START + 0x52
_080183B4: .4byte IWRAM_START + 0x68
_080183B8: .4byte IWRAM_START + 0x54
_080183BC: .4byte gGameMode
_080183C0: .4byte 0xFFFFFA60
_080183C4: .4byte 0xFFFFFCA0
_080183C8:
	movs r5, #0xb4
	lsls r5, r5, #3
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xd8
	lsls r0, r0, #2
_080183D6:
	adds r2, r0, #0
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldrh r0, [r4]
	lsrs r0, r0, #7
	mov r4, sl
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_800DA4C
	adds r2, r0, #0
_08018400:
	adds r0, r2, #0
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _08018492
	ldr r0, _08018440 @ =gPlayer
	adds r1, r0, #0
	adds r1, #0x61
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r0
	cmp r1, #0
	bne _08018464
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08018444
	mov r7, r8
	ldrh r1, [r7, #0x10]
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _08018464
	rsbs r0, r1, #0
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #0x14]
	rsbs r0, r0, #0
	strh r0, [r7, #0x14]
	b _08018464
	.align 2, 0
_08018440: .4byte gPlayer
_08018444:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _08018464
	mov r4, r8
	ldrh r1, [r4, #0x10]
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _08018464
	rsbs r0, r1, #0
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x14]
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_08018464:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _0801847E
	mov r7, r8
	ldrh r1, [r7, #0x12]
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _0801847E
	rsbs r0, r1, #0
	strh r0, [r7, #0x12]
_0801847E:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0801849E
	movs r0, #1
	b _0801874C
_08018492:
	movs r4, #2
	ands r4, r2
	ldr r5, _080184C4 @ =gPlayer
	mov r8, r5
	cmp r4, #0
	beq _08018512
_0801849E:
	movs r3, #1
	ands r2, r3
	cmp r2, #0
	beq _080184D8
	adds r0, r6, #0
	adds r0, #0x50
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r2, r8
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080184C8
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _080184D0
	.align 2, 0
_080184C4: .4byte gPlayer
_080184C8:
	mov r4, r8
	ldr r0, [r4, #0x20]
	orrs r0, r3
	str r0, [r4, #0x20]
_080184D0:
	mov r0, r8
	bl sub_800DE44
	b _08018506
_080184D8:
	adds r0, r6, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r1, [r0, r5]
	mov r7, r8
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080184F2
	ldr r0, [r7, #0x20]
	orrs r0, r3
	str r0, [r7, #0x20]
	b _08018500
_080184F2:
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	mov r2, r8
	str r0, [r2, #0x20]
_08018500:
	mov r0, r8
	bl sub_800DD54
_08018506:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _0801874C
_08018512:
	ldr r3, [sp, #0x10]
	ldr r1, [r3, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080185F4
	ldr r5, [sp, #0xc]
	ldr r0, [r5, #0x30]
	cmp r0, r1
	bne _080185F4
	mov r7, r8
	ldr r7, [r7, #0x20]
	str r7, [sp, #0x14]
	mov r0, r8
	ldr r0, [r0, #0x3c]
	str r0, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x50
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r7, r6, #0
	adds r7, #0x52
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	movs r2, #0x66
	adds r2, r2, r6
	mov sb, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x20]
	movs r2, #0x68
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	str r0, [sp, #0x1c]
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800D0A0
	adds r4, r0, #0
	ldr r0, _080185B0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08018584
	b _08018718
_08018584:
	cmp r4, #0
	beq _0801858A
	b _08018718
_0801858A:
	ldr r3, [sp, #0x14]
	mov r0, r8
	str r3, [r0, #0x20]
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x3c]
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080185BC
	ldr r5, _080185B4 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080185B8 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _080185CC
	.align 2, 0
_080185B0: .4byte gGameMode
_080185B4: .4byte 0xFFFFFA60
_080185B8: .4byte 0xFFFFFCA0
_080185BC:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_080185CC:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, sb
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sl
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldr r5, [sp, #0x1c]
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	b _08018712
_080185F4:
	ldr r1, _08018630 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	mov r8, r1
	cmp r0, #0
	beq _08018618
	ldr r0, [r1, #0x3c]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _08018618
	movs r0, #9
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	mov r3, r8
	str r2, [r3, #0x20]
_08018618:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08018624
	b _0801874A
_08018624:
	mov r4, r8
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
	b _0801874A
	.align 2, 0
_08018630: .4byte gPlayer
_08018634:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08018644
	b _0801874A
_08018644:
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	beq _0801864C
	b _0801874A
_0801864C:
	ldr r7, _080186C0 @ =IWRAM_START + 0x50
	adds r5, r4, r7
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, _080186C4 @ =IWRAM_START + 0x52
	adds r7, r4, r2
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	adds r2, #0x14
	adds r2, r2, r4
	mov r8, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x20]
	ldr r2, _080186C8 @ =IWRAM_START + 0x68
	adds r2, r2, r4
	mov sb, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	ldr r0, _080186CC @ =IWRAM_START + 0x54
	adds r0, r0, r4
	mov sl, r0
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800D0A0
	adds r4, r0, #0
	ldr r0, _080186D0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08018718
	cmp r4, #0
	bne _08018718
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080186DC
	ldr r5, _080186D4 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080186D8 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _080186EC
	.align 2, 0
_080186C0: .4byte IWRAM_START + 0x50
_080186C4: .4byte IWRAM_START + 0x52
_080186C8: .4byte IWRAM_START + 0x68
_080186CC: .4byte IWRAM_START + 0x54
_080186D0: .4byte gGameMode
_080186D4: .4byte 0xFFFFFA60
_080186D8: .4byte 0xFFFFFCA0
_080186DC:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_080186EC:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	mov r5, sl
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
_08018712:
	bl sub_800D0A0
	adds r4, r0, #0
_08018718:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08018736
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08018736
	ldr r0, _0801875C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_08018736:
	str r4, [r6, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r4
	cmp r0, #0
	beq _0801874A
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_0801874A:
	movs r0, #0
_0801874C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801875C: .4byte gPlayer

	thumb_func_start sub_8018760
sub_8018760: @ 0x08018760
	push {r4, r5, r6, lr}
	ldr r6, _080187D0 @ =gPlayer
	adds r0, r6, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080187E4
	ldr r5, _080187D4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r6, #0x20]
	ldr r1, _080187D8 @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _080187DC @ =0xFF7FFFFF
	ands r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080187E0 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	movs r0, #0x99
	bl m4aSongNumStart
	ldrh r0, [r4]
	strh r0, [r6, #0x12]
	ldr r0, [r5]
	bl TaskDestroy
	b _08018804
	.align 2, 0
_080187D0: .4byte gPlayer
_080187D4: .4byte gCurTask
_080187D8: .4byte 0xFFDFFFFF
_080187DC: .4byte 0xFF7FFFFF
_080187E0: .4byte 0xFFFFFEFF
_080187E4:
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	beq _08018804
	ldr r0, [r6, #0x20]
	ldr r1, _0801880C @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _08018810 @ =0xFF7FFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, _08018814 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08018804:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801880C: .4byte 0xFFDFFFFF
_08018810: .4byte 0xFF7FFFFF
_08018814: .4byte gCurTask

	thumb_func_start sub_8018818
sub_8018818: @ 0x08018818
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801886C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08018864
	ldr r1, _08018870 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	ldr r7, _08018874 @ =gPlayer
	cmp r0, #0
	beq _08018854
	movs r6, #0xc0
	lsls r6, r6, #0x12
	movs r5, #3
	rsbs r5, r5, #0
	adds r3, r1, #0
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0xc
_0801883C:
	ldm r2!, {r0}
	ldrh r1, [r0, #6]
	adds r1, r1, r6
	ldr r0, [r1, #0x5c]
	ands r0, r5
	str r0, [r1, #0x5c]
	adds r3, #4
	cmp r2, r4
	bhi _08018854
	ldr r0, [r3]
	cmp r0, #0
	bne _0801883C
_08018854:
	movs r0, #0x78
	strh r0, [r7, #0x2c]
	adds r2, r7, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08018864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801886C: .4byte gGameMode
_08018870: .4byte gMultiplayerPlayerTasks
_08018874: .4byte gPlayer

	thumb_func_start TaskDestructor_CreateMultiplayerPlayer
TaskDestructor_CreateMultiplayerPlayer: @ 0x08018878
	push {lr}
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r0, r2
	ldr r1, _0801889C @ =gMultiplayerPlayerTasks
	ldr r3, _080188A0 @ =IWRAM_START + 0x56
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0801889C: .4byte gMultiplayerPlayerTasks
_080188A0: .4byte IWRAM_START + 0x56

	thumb_func_start sub_80188A4
sub_80188A4: @ 0x080188A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080188F4 @ =sub_8018760
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r1, #2
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	ldr r3, _080188F8 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	adds r0, r3, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r2, r3, #0
	adds r2, #0x64
	movs r0, #0x6d
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r3, #0x20]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080188F4: .4byte sub_8018760
_080188F8: .4byte gPlayer
