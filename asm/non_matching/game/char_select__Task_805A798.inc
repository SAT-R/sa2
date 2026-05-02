.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0805A808 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0805A80C @ =gGameMode
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #1
	bls _0805A84C
	movs r3, #0
	ldr r0, _0805A810 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _0805A84C
	movs r5, #1
	ldr r2, _0805A814 @ =gMultiplayerMissingHeartbeats
_0805A7C8:
	ldr r1, _0805A818 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805A834
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805A838
	movs r0, #0
	ldr r1, _0805A81C @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805A820 @ =gBackgroundsCopyQueueCursor
	ldr r0, _0805A824 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805A828 @ =gBgSpritesCount
	strb r4, [r0]
	ldr r1, _0805A82C @ =gVramGraphicsCopyCursor
	ldr r0, _0805A830 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _0805A992
	.align 2, 0
_0805A808: .4byte gCurTask
_0805A80C: .4byte gGameMode
_0805A810: .4byte gMultiplayerConnections
_0805A814: .4byte gMultiplayerMissingHeartbeats
_0805A818: .4byte gMultiSioStatusFlags
_0805A81C: .4byte 0x0000FFFF
_0805A820: .4byte gBackgroundsCopyQueueCursor
_0805A824: .4byte gBackgroundsCopyQueueIndex
_0805A828: .4byte gBgSpritesCount
_0805A82C: .4byte gVramGraphicsCopyCursor
_0805A830: .4byte gVramGraphicsCopyQueueIndex
_0805A834:
	movs r0, #0
	strb r0, [r2]
_0805A838:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805A84C
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0805A7C8
_0805A84C:
	ldr r3, _0805A8A4 @ =gMultiSioRecv
	ldrh r0, [r3]
	adds r7, r3, #0
	cmp r0, #0x23
	bne _0805A8B8
	ldr r1, _0805A8A8 @ =gUnknown_03005140
	movs r0, #0
	strb r0, [r1]
	movs r2, #0
	ldr r0, _0805A8AC @ =gMultiplayerConnections
	mov ip, r0
	adds r5, r1, #0
	movs r4, #0
_0805A866:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A896
	adds r3, r4, r7
	ldrb r0, [r3, #3]
	ldrb r1, [r5]
	cmp r0, r1
	bhs _0805A880
	adds r0, r1, #0
_0805A880:
	strb r0, [r5]
	ldr r0, _0805A8B0 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805A896
	ldr r0, _0805A8B4 @ =gMultiplayerCharacters
	adds r0, r2, r0
	ldrb r1, [r3, #2]
	strb r1, [r0]
_0805A896:
	adds r4, #0x14
	adds r2, #1
	cmp r2, #3
	bls _0805A866
	bl sub_805A9A4
	b _0805A992
	.align 2, 0
_0805A8A4: .4byte gMultiSioRecv
_0805A8A8: .4byte gUnknown_03005140
_0805A8AC: .4byte gMultiplayerConnections
_0805A8B0: .4byte gMultiSioStatusFlags
_0805A8B4: .4byte gMultiplayerCharacters
_0805A8B8:
	cmp r0, #0x21
	bne _0805A8E4
	ldr r5, _0805A8D8 @ =gMultiSioSend
	movs r0, #0x20
	strh r0, [r5]
	ldr r2, [r6, #0x1c]
	ldrh r1, [r2, #0x12]
	ldr r0, _0805A8DC @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0x12]
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0805A8E0 @ =Task_805A060
	str r0, [r1, #8]
	b _0805A992
	.align 2, 0
_0805A8D8: .4byte gMultiSioSend
_0805A8DC: .4byte 0x0000FFFE
_0805A8E0: .4byte Task_805A060
_0805A8E4:
	ldr r0, _0805A950 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805A972
	ldr r5, _0805A954 @ =gMultiSioSend
	movs r0, #0x23
	strh r0, [r5]
	ldrh r1, [r6, #0x28]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r5, #2]
	ldr r1, _0805A958 @ =gLoadedSaveGame
	ldrb r0, [r5, #2]
	lsls r0, r0, #1
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	strb r0, [r5, #3]
	movs r2, #0
	ldr r1, _0805A95C @ =gMultiplayerConnections
	mov ip, r1
	movs r4, #0
_0805A918:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A968
	cmp r2, #0
	beq _0805A968
	adds r3, r4, r7
	ldr r0, _0805A960 @ =gMultiplayerCharacters
	adds r0, r2, r0
	ldrb r1, [r3, #2]
	strb r1, [r0]
	ldrh r0, [r3]
	cmp r0, #0x22
	beq _0805A968
	movs r0, #0x22
	strh r0, [r5]
	ldr r0, _0805A964 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A992
	movs r0, #0x21
	strh r0, [r5]
	b _0805A992
	.align 2, 0
_0805A950: .4byte gMultiSioStatusFlags
_0805A954: .4byte gMultiSioSend
_0805A958: .4byte gLoadedSaveGame
_0805A95C: .4byte gMultiplayerConnections
_0805A960: .4byte gMultiplayerCharacters
_0805A964: .4byte gPressedKeys
_0805A968:
	adds r4, #0x14
	adds r2, #1
	cmp r2, #3
	bls _0805A918
	b _0805A992
_0805A972:
	ldr r5, _0805A99C @ =gMultiSioSend
	movs r0, #0x22
	strh r0, [r5]
	ldrh r1, [r6, #0x28]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r5, #2]
	ldr r1, _0805A9A0 @ =gLoadedSaveGame
	ldrb r0, [r5, #2]
	lsls r0, r0, #1
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	strb r0, [r5, #3]
_0805A992:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A99C: .4byte gMultiSioSend
_0805A9A0: .4byte gLoadedSaveGame

.syntax divided
