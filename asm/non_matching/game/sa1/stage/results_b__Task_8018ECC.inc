.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08018F3C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _08018F40 @ =0x03000234
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08018F44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _08018F7C
	movs r3, #0
	ldr r0, _08018F48 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _08018F7C
	movs r5, #1
	ldr r2, _08018F4C @ =gMultiplayerMissingHeartbeats
_08018F08:
	ldr r1, _08018F50 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _08018F64
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08018F68
	movs r0, #0
	ldr r1, _08018F54 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08018F58 @ =gBackgroundsCopyQueueCursor
	ldr r0, _08018F5C @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08018F60 @ =gBgSpritesCount
	strb r4, [r0]
	b _080190AC
	.align 2, 0
_08018F3C: .4byte gCurTask
_08018F40: .4byte 0x03000234
_08018F44: .4byte gGameMode
_08018F48: .4byte gMultiplayerConnections
_08018F4C: .4byte gMultiplayerMissingHeartbeats
_08018F50: .4byte gMultiSioStatusFlags
_08018F54: .4byte 0x0000FFFF
_08018F58: .4byte gBackgroundsCopyQueueCursor
_08018F5C: .4byte gBackgroundsCopyQueueIndex
_08018F60: .4byte gBgSpritesCount
_08018F64:
	movs r0, #0
	strb r0, [r2]
_08018F68:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08018F7C
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08018F08
_08018F7C:
	ldr r6, _08018FAC @ =gMultiSioRecv
	ldrh r2, [r6]
	cmp r2, #0x34
	bne _08018FB8
	ldr r2, _08018FB0 @ =0x00000246
	adds r4, r7, r2
	ldrb r0, [r4]
	ldrb r3, [r6, #2]
	cmp r0, r3
	bne _08018F92
	b _080190D4
_08018F92:
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r0, _08018FB4 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08018FA6
	b _080190E0
_08018FA6:
	ldrb r0, [r6, #2]
	strb r0, [r4]
	b _080190D4
	.align 2, 0
_08018FAC: .4byte gMultiSioRecv
_08018FB0: .4byte 0x00000246
_08018FB4: .4byte gMultiSioStatusFlags
_08018FB8:
	cmp r2, #0x35
	bne _08019092
	movs r3, #1
	ldr r0, _08018FFC @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08019004
	movs r5, #1
	ldr r1, _08019000 @ =gMultiplayerConnections
	ldrb r0, [r1]
	asrs r0, r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08019008
	adds r2, r6, #0
	adds r2, #0x14
	movs r4, #1
_08018FDE:
	ldrh r0, [r2]
	cmp r0, #0x34
	bhi _08018FE6
	movs r3, #0
_08018FE6:
	adds r2, #0x14
	adds r5, #1
	cmp r5, #3
	bgt _08019008
	ldrb r0, [r1]
	asrs r0, r5
	ands r0, r4
	cmp r0, #0
	bne _08018FDE
	b _08019008
	.align 2, 0
_08018FFC: .4byte gMultiSioStatusFlags
_08019000: .4byte gMultiplayerConnections
_08019004:
	ldr r4, _0801903C @ =gMultiSioSend
	strh r2, [r4]
_08019008:
	cmp r3, #0
	beq _080190D4
	ldr r0, _08019040 @ =0x00000246
	adds r4, r7, r0
	ldrb r0, [r4]
	ldrb r1, [r6, #2]
	cmp r0, r1
	beq _08019022
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrb r0, [r6, #2]
	strb r0, [r4]
_08019022:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrb r0, [r4]
	cmp r0, #0
	bne _08019060
	ldr r1, _08019044 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #2
	bne _08019048
	movs r0, #3
	b _0801904A
	.align 2, 0
_0801903C: .4byte gMultiSioSend
_08019040: .4byte 0x00000246
_08019044: .4byte gGameMode
_08019048:
	movs r0, #5
_0801904A:
	strb r0, [r1]
	ldr r0, _08019058 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801905C @ =Task_8019348
	str r0, [r1, #8]
	b _0801933A
	.align 2, 0
_08019058: .4byte gCurTask
_0801905C: .4byte Task_8019348
_08019060:
	ldr r1, _08019084 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #2
	beq _0801906A
	movs r0, #4
_0801906A:
	strb r0, [r1]
	ldr r0, _08019088 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r0, _08019084 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0801908C
	movs r0, #0
	bl CreateCourseSelect
	b _0801933A
	.align 2, 0
_08019084: .4byte gGameMode
_08019088: .4byte gCurTask
_0801908C:
	bl sub_8062F90
	b _0801933A
_08019092:
	cmp r2, #0x35
	bls _080190D4
	ldr r1, _080190BC @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _080190C0 @ =gBackgroundsCopyQueueCursor
	ldr r0, _080190C4 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080190C8 @ =gBgSpritesCount
	movs r0, #0
	strb r0, [r1]
_080190AC:
	ldr r1, _080190CC @ =gVramGraphicsCopyCursor
	ldr r0, _080190D0 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _0801933A
	.align 2, 0
_080190BC: .4byte 0x0000FFFF
_080190C0: .4byte gBackgroundsCopyQueueCursor
_080190C4: .4byte gBackgroundsCopyQueueIndex
_080190C8: .4byte gBgSpritesCount
_080190CC: .4byte gVramGraphicsCopyCursor
_080190D0: .4byte gVramGraphicsCopyQueueIndex
_080190D4:
	ldr r0, _08019108 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080191B8
_080190E0:
	movs r4, #1
	ldr r2, _0801910C @ =gMultiSioSend
	mov r8, r2
	movs r0, #0x34
	strh r0, [r2]
	ldr r3, _08019110 @ =0x00000247
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801912C
	ldr r0, _08019114 @ =gInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801911C
	ldr r1, _08019118 @ =0x00000246
	adds r0, r7, r1
	strb r4, [r0]
	b _0801912C
	.align 2, 0
_08019108: .4byte gMultiSioStatusFlags
_0801910C: .4byte gMultiSioSend
_08019110: .4byte 0x00000247
_08019114: .4byte gInput
_08019118: .4byte 0x00000246
_0801911C:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801912C
	ldr r2, _080191A4 @ =0x00000246
	adds r1, r7, r2
	movs r0, #0
	strb r0, [r1]
_0801912C:
	ldr r3, _080191A4 @ =0x00000246
	adds r0, r7, r3
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1, #2]
	movs r5, #1
	ldr r1, _080191A8 @ =gMultiplayerConnections
	ldrb r0, [r1]
	asrs r0, r0, #1
	ands r0, r5
	movs r2, #0x80
	adds r2, r2, r7
	mov sb, r2
	movs r3, #0xb0
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	beq _08019172
	ldr r0, _080191AC @ =gMultiSioRecv
	adds r2, r0, #0
	adds r2, #0x14
	movs r3, #1
_08019158:
	ldrh r0, [r2]
	cmp r0, #0x33
	bhi _08019160
	movs r4, #0
_08019160:
	adds r2, #0x14
	adds r5, #1
	cmp r5, #3
	bgt _08019172
	ldrb r0, [r1]
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	bne _08019158
_08019172:
	cmp r4, #0
	beq _08019182
	ldr r0, _080191B0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801918C
_08019182:
	ldr r4, _080191B4 @ =0x00000247
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080191DC
_0801918C:
	movs r0, #0x35
	mov r1, r8
	strh r0, [r1]
	ldr r2, _080191A4 @ =0x00000246
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldr r3, _080191B4 @ =0x00000247
	adds r1, r7, r3
	movs r0, #1
	strb r0, [r1]
	b _080191DC
	.align 2, 0
_080191A4: .4byte 0x00000246
_080191A8: .4byte gMultiplayerConnections
_080191AC: .4byte gMultiSioRecv
_080191B0: .4byte gPressedKeys
_080191B4: .4byte 0x00000247
_080191B8:
	ldr r4, _08019220 @ =gMultiSioSend
	movs r0, #0x34
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	adds r6, r7, r0
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	movs r1, #0x80
	adds r1, r1, r7
	mov sb, r1
	movs r2, #0xb0
	adds r2, r2, r7
	mov sl, r2
_080191DC:
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r6, r7, r3
	ldr r4, _08019224 @ =0x00000246
	adds r3, r7, r4
	ldrb r0, [r3]
	lsls r1, r0, #5
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	adds r1, #0x19
	strh r1, [r6, #0x16]
	ldr r0, _08019228 @ =0x00000236
	adds r1, r7, r0
	ldrh r0, [r1]
	adds r0, #0x10
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #3
	cmp r0, r2
	ble _0801920C
	strh r2, [r1]
_0801920C:
	ldrb r0, [r3]
	cmp r0, #0
	bne _0801922C
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrh r1, [r0]
	adds r1, #1
	b _08019236
	.align 2, 0
_08019220: .4byte gMultiSioSend
_08019224: .4byte 0x00000246
_08019228: .4byte 0x00000236
_0801922C:
	movs r4, #0x8e
	lsls r4, r4, #2
	adds r0, r7, r4
	ldrh r1, [r0]
	subs r1, #1
_08019236:
	ldr r3, _080192D8 @ =0x000003FF
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0]
	ldr r4, _080192DC @ =0x00000236
	adds r1, r7, r4
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r5, _080192E0 @ =gSineTable
	adds r4, #2
	adds r2, r7, r4
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	ldr r3, _080192E4 @ =0x0000023A
	adds r4, r7, r3
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r1, r0]
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r3, r7, r1
	strh r0, [r3]
	ldr r2, _080192E8 @ =0x0000023E
	adds r1, r7, r2
	ldrh r0, [r4]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #2
	adds r2, r7, r0
	ldrh r0, [r3]
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	ldr r3, _080192EC @ =gBgScrollRegs
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r3, #4]
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r3, #6]
	movs r4, #0x8c
	lsls r4, r4, #2
	adds r2, r7, r4
	ldr r3, [r2]
	adds r1, r3, #0
	adds r1, #0x80
	str r1, [r2]
	movs r0, #0x88
	lsls r0, r0, #8
	cmp r1, r0
	ble _080192CC
	ldr r1, _080192F0 @ =0xFFFF7880
	adds r0, r3, r1
	str r0, [r2]
_080192CC:
	mov r6, sb
	ldr r0, [r2]
	rsbs r0, r0, #0
	lsls r0, r0, #8
	lsrs r4, r0, #0x10
	b _08019304
	.align 2, 0
_080192D8: .4byte 0x000003FF
_080192DC: .4byte 0x00000236
_080192E0: .4byte gSineTable
_080192E4: .4byte 0x0000023A
_080192E8: .4byte 0x0000023E
_080192EC: .4byte gBgScrollRegs
_080192F0: .4byte 0xFFFF7880
_080192F4:
	strh r4, [r6, #0x16]
	movs r2, #0x88
	lsls r2, r2, #0x10
	adds r0, r1, r2
	lsrs r4, r0, #0x10
	adds r0, r6, #0
	bl DisplaySprite
_08019304:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xef
	ble _080192F4
	adds r4, r7, #0
	adds r4, #0xe0
	movs r5, #2
_08019312:
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	adds r4, #0x30
	subs r5, #1
	cmp r5, #0
	bge _08019312
	mov r6, sl
	movs r5, #0
_0801932A:
	lsls r0, r5, #5
	strh r0, [r6, #0x16]
	adds r0, r6, #0
	bl DisplaySprite
	adds r5, #1
	cmp r5, #7
	ble _0801932A
_0801933A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
