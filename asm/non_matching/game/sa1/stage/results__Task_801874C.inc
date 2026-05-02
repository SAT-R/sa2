.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080187BC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080187C0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _080187FE
	movs r3, #0
	ldr r0, _080187C4 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _080187FE
	movs r5, #1
	ldr r2, _080187C8 @ =gMultiplayerMissingHeartbeats
_0801877E:
	ldr r1, _080187CC @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080187E8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080187EC
	movs r0, #0
	ldr r1, _080187D0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080187D4 @ =gBackgroundsCopyQueueCursor
	ldr r0, _080187D8 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080187DC @ =gBgSpritesCount
	strb r4, [r0]
	ldr r1, _080187E0 @ =gVramGraphicsCopyCursor
	ldr r0, _080187E4 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _08018AC2
	.align 2, 0
_080187BC: .4byte gCurTask
_080187C0: .4byte gGameMode
_080187C4: .4byte gMultiplayerConnections
_080187C8: .4byte gMultiplayerMissingHeartbeats
_080187CC: .4byte gMultiSioStatusFlags
_080187D0: .4byte 0x0000FFFF
_080187D4: .4byte gBackgroundsCopyQueueCursor
_080187D8: .4byte gBackgroundsCopyQueueIndex
_080187DC: .4byte gBgSpritesCount
_080187E0: .4byte gVramGraphicsCopyCursor
_080187E4: .4byte gVramGraphicsCopyQueueIndex
_080187E8:
	movs r0, #0
	strb r0, [r2]
_080187EC:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _080187FE
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0801877E
_080187FE:
	ldr r5, _0801882C @ =gMultiSioRecv
	ldrh r0, [r5]
	cmp r0, #0x30
	bne _08018838
	ldr r0, _08018830 @ =0x00000203
	adds r4, r6, r0
	ldrb r0, [r4]
	ldrb r1, [r5, #2]
	cmp r0, r1
	beq _080188DC
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r0, _08018834 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080188EA
	ldrb r0, [r5, #2]
	strb r0, [r4]
	b _080188DC
	.align 2, 0
_0801882C: .4byte gMultiSioRecv
_08018830: .4byte 0x00000203
_08018834: .4byte gMultiSioStatusFlags
_08018838:
	cmp r0, #0x31
	bne _080188DC
	ldr r3, _0801887C @ =0x00000203
	adds r4, r6, r3
	ldrb r0, [r4]
	ldrb r1, [r5, #2]
	cmp r0, r1
	beq _08018852
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrb r0, [r5, #2]
	strb r0, [r4]
_08018852:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldrb r0, [r4]
	cmp r0, #0
	bne _08018894
	ldr r1, _08018880 @ =gGameMode
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08018884 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _08018888 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801888C @ =0x00196225
	muls r0, r1, r0
	ldr r3, _08018890 @ =0x3C6EF35F
	adds r0, r0, r3
	b _080188AE
	.align 2, 0
_0801887C: .4byte 0x00000203
_08018880: .4byte gGameMode
_08018884: .4byte gCurTask
_08018888: .4byte gPseudoRandom
_0801888C: .4byte 0x00196225
_08018890: .4byte 0x3C6EF35F
_08018894:
	ldr r1, _080188C4 @ =gGameMode
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080188C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _080188CC @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _080188D0 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080188D4 @ =0x3C6EF35F
	adds r0, r0, r1
_080188AE:
	str r0, [r2]
	ldr r1, _080188D8 @ =0x04000128
	ldr r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	adds r0, r0, r1
	movs r1, #3
	ands r0, r1
	bl CreateCharacterSelectionScreen
	b _08018AC2
	.align 2, 0
_080188C4: .4byte gGameMode
_080188C8: .4byte gCurTask
_080188CC: .4byte gPseudoRandom
_080188D0: .4byte 0x00196225
_080188D4: .4byte 0x3C6EF35F
_080188D8: .4byte 0x04000128
_080188DC:
	ldr r0, _08018934 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080188EA
	b _08018A08
_080188EA:
	movs r3, #1
	mov r8, r3
	movs r0, #0x30
	ldr r1, _08018938 @ =gMultiSioSend
	strh r0, [r1]
	ldr r3, _0801893C @ =0x00000213
	adds r0, r6, r3
	ldrb r5, [r0]
	cmp r5, #0
	bne _08018974
	ldr r0, _08018940 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08018948
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r0, _08018944 @ =0x00000203
	adds r1, r6, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801892A
	mov r3, r8
	strb r3, [r1]
_0801892A:
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r0, r6, r1
	str r5, [r0]
	b _08018974
	.align 2, 0
_08018934: .4byte gMultiSioStatusFlags
_08018938: .4byte gMultiSioSend
_0801893C: .4byte 0x00000213
_08018940: .4byte gRepeatedKeys
_08018944: .4byte 0x00000203
_08018948:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08018974
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r3, _080189F0 @ =0x00000203
	adds r1, r6, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801896C
	movs r0, #0
	strb r0, [r1]
_0801896C:
	movs r1, #0xfe
	lsls r1, r1, #1
	adds r0, r6, r1
	str r4, [r0]
_08018974:
	ldr r3, _080189F0 @ =0x00000203
	adds r0, r6, r3
	ldrb r0, [r0]
	ldr r1, _080189F4 @ =gMultiSioSend
	strb r0, [r1, #2]
	movs r4, #1
	ldr r1, _080189F8 @ =gMultiplayerConnections
	ldrb r0, [r1]
	asrs r0, r0, #1
	ands r0, r4
	adds r7, r1, #0
	adds r5, r6, #0
	adds r5, #0x40
	movs r3, #0x60
	adds r3, r3, r6
	mov sb, r3
	movs r1, #0x70
	adds r1, r1, r6
	mov sl, r1
	cmp r0, #0
	beq _080189C4
	ldr r0, _080189FC @ =gMultiSioRecv
	adds r1, r7, #0
	adds r2, r0, #0
	adds r2, #0x14
	movs r3, #1
_080189A8:
	ldrh r0, [r2]
	cmp r0, #0x30
	beq _080189B2
	movs r0, #0
	mov r8, r0
_080189B2:
	adds r2, #0x14
	adds r4, #1
	cmp r4, #3
	bhi _080189C4
	ldrb r0, [r1]
	asrs r0, r4
	ands r0, r3
	cmp r0, #0
	bne _080189A8
_080189C4:
	mov r1, r8
	cmp r1, #0
	beq _080189D6
	ldr r0, _08018A00 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080189E0
_080189D6:
	ldr r3, _08018A04 @ =0x00000213
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08018A30
_080189E0:
	ldr r1, _08018A04 @ =0x00000213
	adds r0, r6, r1
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x31
	ldr r3, _080189F4 @ =gMultiSioSend
	strh r0, [r3]
	b _08018A30
	.align 2, 0
_080189F0: .4byte 0x00000203
_080189F4: .4byte gMultiSioSend
_080189F8: .4byte gMultiplayerConnections
_080189FC: .4byte gMultiSioRecv
_08018A00: .4byte gPressedKeys
_08018A04: .4byte 0x00000213
_08018A08:
	movs r0, #0x30
	ldr r1, _08018AD0 @ =gMultiSioSend
	strh r0, [r1]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r5, r6, r3
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	adds r5, r6, #0
	adds r5, #0x40
	movs r0, #0x60
	adds r0, r0, r6
	mov sb, r0
	movs r1, #0x70
	adds r1, r1, r6
	mov sl, r1
_08018A30:
	ldr r1, _08018AD4 @ =gUnknown_080BB48C
	ldr r3, _08018AD8 @ =0x00000203
	adds r2, r6, r3
	ldr r0, _08018ADC @ =gLoadedSaveGame
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #1
	ldrb r3, [r2]
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r7, [r0]
	movs r0, #0xfe
	lsls r0, r0, #1
	adds r4, r6, r0
	ldr r0, [r4]
	adds r0, #0x80
	str r0, [r4]
	lsls r1, r7, #8
	cmp r0, r1
	ble _08018A5A
	subs r0, r0, r1
	str r0, [r4]
_08018A5A:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x40
	strh r0, [r5, #0x18]
	ldrb r0, [r2]
	mov r1, sb
	strb r0, [r1]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	ldr r0, [r4]
	asrs r0, r0, #8
	subs r4, r0, r7
	movs r0, #0xe8
	subs r0, r0, r4
	cmp r0, #0
	ble _08018A9E
	movs r3, #0xe8
	mov sb, r3
	movs r0, #0xe8
	mov r8, r0
_08018A88:
	mov r1, sb
	subs r0, r1, r4
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	adds r4, r4, r7
	mov r3, r8
	subs r0, r3, r4
	cmp r0, #0
	bgt _08018A88
_08018A9E:
	mov r5, sl
	ldr r1, _08018AD8 @ =0x00000203
	adds r0, r6, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x36
	strh r0, [r5, #0x18]
	movs r4, #0
_08018AB2:
	lsls r0, r4, #5
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl DisplaySprite
	adds r4, #1
	cmp r4, #7
	bls _08018AB2
_08018AC2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018AD0: .4byte gMultiSioSend
_08018AD4: .4byte gUnknown_080BB48C
_08018AD8: .4byte 0x00000203
_08018ADC: .4byte gLoadedSaveGame

.syntax divided
