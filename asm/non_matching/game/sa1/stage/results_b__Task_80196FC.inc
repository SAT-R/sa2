.include "constants/constants.inc"

.syntax unified

.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #8
	movs r1, #0
	movs r2, #2
	bl memset
	ldr r0, _08019758 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0801975C @ =0x03000247
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019782
	ldr r0, _08019760 @ =gRepeatedKeys
	ldrh r2, [r0]
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08019768
	ldr r3, _08019764 @ =0x03000246
	adds r4, r1, r3
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801974E
	movs r0, #0x6c
	bl m4aSongNumStart
_0801974E:
	mov r0, sp
	ldrb r0, [r0, #0xc]
	strb r0, [r4]
	b _08019782
	.align 2, 0
_08019758: .4byte gCurTask
_0801975C: .4byte 0x03000247
_08019760: .4byte gRepeatedKeys
_08019764: .4byte 0x03000246
_08019768:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08019782
	ldr r2, _080197D0 @ =0x03000246
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r0, #1
	bne _08019780
	movs r0, #0x6c
	bl m4aSongNumStart
_08019780:
	strb r5, [r4]
_08019782:
	ldr r0, _080197D4 @ =gGameMode
	ldrb r0, [r0]
	ldr r7, _080197D8 @ =gMultiplayerConnections
	cmp r0, #1
	bls _0801980A
	movs r3, #0
	ldrb r0, [r7]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801980A
	movs r5, #1
	ldr r2, _080197DC @ =gMultiplayerMissingHeartbeats
_0801979C:
	ldr r1, _080197E0 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080197F4
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080197F8
	movs r0, #0
	ldr r1, _080197E4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080197E8 @ =gBackgroundsCopyQueueCursor
	ldr r0, _080197EC @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080197F0 @ =gBgSpritesCount
	strb r4, [r0]
	b _08019B0E
	.align 2, 0
_080197D0: .4byte 0x03000246
_080197D4: .4byte gGameMode
_080197D8: .4byte gMultiplayerConnections
_080197DC: .4byte gMultiplayerMissingHeartbeats
_080197E0: .4byte gMultiSioStatusFlags
_080197E4: .4byte 0x0000FFFF
_080197E8: .4byte gBackgroundsCopyQueueCursor
_080197EC: .4byte gBackgroundsCopyQueueIndex
_080197F0: .4byte gBgSpritesCount
_080197F4:
	movs r0, #0
	strb r0, [r2]
_080197F8:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0801980A
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0801979C
_0801980A:
	movs r6, #0
	ldrb r0, [r7]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080198F2
	mov sb, r7
	add r7, sp, #8
	movs r3, #0xe0
	mov sl, r3
	movs r0, #0
	str r0, [sp, #0x10]
_08019822:
	ldr r0, _08019880 @ =gMultiSioRecv
	ldr r1, [sp, #0x10]
	adds r5, r1, r0
	ldrh r1, [r5]
	adds r0, r1, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080198D0
	cmp r1, #0x41
	beq _080198AE
	mov r4, r8
	add r4, sl
	ldrb r0, [r5, #2]
	lsls r0, r0, #7
	adds r0, #0x2b
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl DisplaySprite
	movs r4, #0xd0
	lsls r4, r4, #1
	add r4, r8
	ldr r0, _08019884 @ =gUnknown_080BB484
	adds r0, r6, r0
	ldrb r0, [r0]
	strh r0, [r4, #0x18]
	ldrb r1, [r5, #2]
	movs r0, #0x5e
	muls r0, r1, r0
	adds r0, #0x4b
	strh r0, [r4, #0x16]
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0801988C
	ldr r0, [r4, #0x10]
	ldr r1, _08019888 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	movs r1, #0x10
	lsls r1, r6
	mov r2, sb
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	b _080198A2
	.align 2, 0
_08019880: .4byte gMultiSioRecv
_08019884: .4byte gUnknown_080BB484
_08019888: .4byte 0xFFFFFBFF
_0801988C:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	movs r0, #0x10
	lsls r0, r6
	mov r3, sb
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
_080198A2:
	adds r0, r4, #0
	bl DisplaySprite
	movs r0, #0
	str r0, [sp, #0xc]
	b _080198D4
_080198AE:
	mov r4, r8
	add r4, sl
	adds r0, r4, #0
	bl DisplaySprite
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	cmp r0, #0x2b
	bne _080198C8
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _080198D4
_080198C8:
	ldrb r0, [r7, #1]
	adds r0, #1
	strb r0, [r7, #1]
	b _080198D4
_080198D0:
	movs r2, #0
	str r2, [sp, #0xc]
_080198D4:
	movs r3, #0x30
	add sl, r3
	ldr r0, [sp, #0x10]
	adds r0, #0x14
	str r0, [sp, #0x10]
	adds r6, #1
	cmp r6, #3
	bgt _080198F2
	mov r1, sb
	ldrb r0, [r1]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019822
_080198F2:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _08019952
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801990E
	add r0, sp, #8
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0801991C
_0801990E:
	ldr r1, _08019918 @ =0x00000247
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	b _08019952
	.align 2, 0
_08019918: .4byte 0x00000247
_0801991C:
	ldr r0, _08019940 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _08019944 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _08019948 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	bne _0801994C
	movs r0, #0
	bl CreateCourseSelect
	b _08019BEA
	.align 2, 0
_08019940: .4byte gCurTask
_08019944: .4byte gFlags
_08019948: .4byte gGameMode
_0801994C:
	bl sub_8062F90
	b _08019BEA
_08019952:
	movs r0, #8
	str r0, [sp]
	movs r4, #0xf0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0x74
	movs r2, #0
	movs r3, #0x7c
	bl sa2__sub_80064A8
	movs r0, #0x10
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0x7c
	movs r2, #8
	movs r3, #0x74
	bl sa2__sub_80064A8
	ldr r2, _08019AC0 @ =0x040000D4
	ldr r0, _08019AC4 @ =gBgOffsetsHBlankPrimary
	ldr r4, [r0]
	ldr r0, _08019AC8 @ =gHBlankCopySize
	ldrb r3, [r0]
	lsls r0, r3, #4
	adds r1, r0, r4
	movs r7, #0x84
	lsls r7, r7, #0x18
	adds r5, r0, #0
	movs r6, #0x80
_0801998E:
	str r4, [r2]
	str r1, [r2, #4]
	lsls r0, r3, #4
	asrs r0, r0, #2
	orrs r0, r7
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r1, r1, r5
	subs r6, #0x10
	cmp r6, #0
	bge _0801998E
	movs r2, #0x8e
	lsls r2, r2, #2
	add r2, r8
	ldrh r0, [r2]
	adds r0, #1
	ldr r3, _08019ACC @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08019AD0 @ =0x00000236
	add r0, r8
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r3, _08019AD4 @ =gSineTable
	ldrh r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r4, #0
	muls r1, r0, r1
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	ldr r3, _08019AD8 @ =0x0000023E
	add r3, r8
	ldrh r0, [r3]
	adds r0, r0, r2
	strh r0, [r3]
	movs r4, #0x90
	lsls r4, r4, #2
	add r4, r8
	ldrh r0, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldr r5, _08019ADC @ =0x00000242
	add r5, r8
	ldrh r0, [r5]
	subs r0, r0, r2
	strh r0, [r5]
	movs r2, #0x91
	lsls r2, r2, #2
	add r2, r8
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	ldr r1, _08019AE0 @ =gBgScrollRegs
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #4]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #6]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #8]
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #0xa]
	ldr r4, _08019AE4 @ =gPressedKeys
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019A54
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _08019AE8 @ =0x00000247
	add r1, r8
	movs r0, #0
	strb r0, [r1]
_08019A54:
	ldr r0, _08019AEC @ =gInput
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08019A90
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08019A90
	ldr r0, _08019AF0 @ =0x00000246
	add r0, r8
	ldrb r2, [r0]
	cmp r2, #0
	bne _08019A80
	mov r1, sb
	subs r1, #1
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r1, r0
	bne _08019A9A
_08019A80:
	cmp r2, #1
	bne _08019A90
	mov r0, sb
	subs r0, #1
	add r1, sp, #8
	ldrb r1, [r1, #1]
	cmp r0, r1
	bne _08019A9A
_08019A90:
	ldr r0, _08019AE8 @ =0x00000247
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019B34
_08019A9A:
	ldr r4, _08019AE8 @ =0x00000247
	add r4, r8
	ldrb r0, [r4]
	cmp r0, #0
	bne _08019AAA
	movs r0, #0x6a
	bl m4aSongNumStart
_08019AAA:
	ldr r5, _08019AF4 @ =gMultiSioSend
	movs r0, #0x41
	strh r0, [r5]
	ldr r0, _08019AF0 @ =0x00000246
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r4]
	b _08019B42
	.align 2, 0
_08019AC0: .4byte 0x040000D4
_08019AC4: .4byte gBgOffsetsHBlankPrimary
_08019AC8: .4byte gHBlankCopySize
_08019ACC: .4byte 0x000003FF
_08019AD0: .4byte 0x00000236
_08019AD4: .4byte gSineTable
_08019AD8: .4byte 0x0000023E
_08019ADC: .4byte 0x00000242
_08019AE0: .4byte gBgScrollRegs
_08019AE4: .4byte gPressedKeys
_08019AE8: .4byte 0x00000247
_08019AEC: .4byte gInput
_08019AF0: .4byte 0x00000246
_08019AF4: .4byte gMultiSioSend
_08019AF8:
	ldr r1, _08019B1C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08019B20 @ =gBackgroundsCopyQueueCursor
	ldr r0, _08019B24 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08019B28 @ =gBgSpritesCount
	movs r0, #0
	strb r0, [r1]
_08019B0E:
	ldr r1, _08019B2C @ =gVramGraphicsCopyCursor
	ldr r0, _08019B30 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _08019BEA
	.align 2, 0
_08019B1C: .4byte 0x0000FFFF
_08019B20: .4byte gBackgroundsCopyQueueCursor
_08019B24: .4byte gBackgroundsCopyQueueIndex
_08019B28: .4byte gBgSpritesCount
_08019B2C: .4byte gVramGraphicsCopyCursor
_08019B30: .4byte gVramGraphicsCopyQueueIndex
_08019B34:
	ldr r5, _08019BFC @ =gMultiSioSend
	movs r0, #0x40
	strh r0, [r5]
	ldr r0, _08019C00 @ =0x00000246
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5, #2]
_08019B42:
	movs r6, #0
	ldr r0, _08019C04 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _08019B7E
	movs r2, #0
_08019B54:
	ldr r0, _08019C08 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r6
	beq _08019B6A
	ldr r0, _08019C0C @ =gMultiSioRecv
	adds r5, r2, r0
	ldrh r0, [r5]
	cmp r0, #0x41
	bhi _08019AF8
_08019B6A:
	adds r2, #0x14
	adds r6, #1
	cmp r6, #3
	bgt _08019B7E
	ldrb r0, [r7]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019B54
_08019B7E:
	mov r4, r8
	adds r4, #0x80
	movs r2, #0x8c
	lsls r2, r2, #2
	add r2, r8
	ldr r3, [r2]
	adds r1, r3, #0
	adds r1, #0x80
	str r1, [r2]
	movs r0, #0xa4
	lsls r0, r0, #8
	cmp r1, r0
	ble _08019B9E
	ldr r1, _08019C10 @ =0xFFFF5C80
	adds r0, r3, r1
	str r0, [r2]
_08019B9E:
	ldr r0, [r2]
	rsbs r0, r0, #0
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	lsls r1, r5, #0x10
	asrs r0, r1, #0x10
	mov r6, r8
	adds r6, #0xb0
	cmp r0, #0xef
	bgt _08019BCA
_08019BB2:
	strh r5, [r4, #0x16]
	movs r2, #0xa4
	lsls r2, r2, #0x10
	adds r0, r1, r2
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl DisplaySprite
	lsls r1, r5, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xef
	ble _08019BB2
_08019BCA:
	movs r4, #0xe8
	lsls r4, r4, #1
	add r4, r8
	adds r0, r4, #0
	bl DisplaySprite
	adds r4, r6, #0
	movs r6, #0
_08019BDA:
	lsls r0, r6, #5
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl DisplaySprite
	adds r6, #1
	cmp r6, #7
	ble _08019BDA
_08019BEA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019BFC: .4byte gMultiSioSend
_08019C00: .4byte 0x00000246
_08019C04: .4byte gMultiplayerConnections
_08019C08: .4byte 0x04000128
_08019C0C: .4byte gMultiSioRecv
_08019C10: .4byte 0xFFFF5C80

.syntax divided
