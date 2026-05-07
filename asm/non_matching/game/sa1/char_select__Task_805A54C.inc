.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r0, sp
	movs r1, #0
	movs r2, #4
	bl memset
	ldr r0, _0805A5C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0805A5CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _0805A60C
	movs r3, #0
	ldr r0, _0805A5D0 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _0805A60C
	movs r6, #1
	ldr r2, _0805A5D4 @ =gMultiplayerMissingHeartbeats
_0805A58A:
	ldr r1, _0805A5D8 @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805A5F4
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805A5F8
	movs r0, #0
	ldr r1, _0805A5DC @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805A5E0 @ =gBackgroundsCopyQueueCursor
	ldr r0, _0805A5E4 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805A5E8 @ =gBgSpritesCount
	strb r4, [r0]
	ldr r1, _0805A5EC @ =gVramGraphicsCopyCursor
	ldr r0, _0805A5F0 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _0805A788
	.align 2, 0
_0805A5C8: .4byte gCurTask
_0805A5CC: .4byte gGameMode
_0805A5D0: .4byte gMultiplayerConnections
_0805A5D4: .4byte gMultiplayerMissingHeartbeats
_0805A5D8: .4byte gMultiSioStatusFlags
_0805A5DC: .4byte 0x0000FFFF
_0805A5E0: .4byte gBackgroundsCopyQueueCursor
_0805A5E4: .4byte gBackgroundsCopyQueueIndex
_0805A5E8: .4byte gBgSpritesCount
_0805A5EC: .4byte gVramGraphicsCopyCursor
_0805A5F0: .4byte gVramGraphicsCopyQueueIndex
_0805A5F4:
	movs r0, #0
	strb r0, [r2]
_0805A5F8:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805A60C
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	bne _0805A58A
_0805A60C:
	ldr r0, _0805A62C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A63C
	ldr r2, [r5, #0x1c]
	ldrh r1, [r2, #0x12]
	ldr r0, _0805A630 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0x12]
	ldr r0, _0805A634 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A638 @ =Task_805A060
	str r0, [r1, #8]
	b _0805A788
	.align 2, 0
_0805A62C: .4byte gPressedKeys
_0805A630: .4byte 0x0000FFFE
_0805A634: .4byte gCurTask
_0805A638: .4byte Task_805A060
_0805A63C:
	ldr r1, _0805A678 @ =gMultiSioRecv
	ldrh r0, [r1]
	adds r7, r1, #0
	cmp r0, #0x22
	bne _0805A68C
	movs r3, #0
	ldr r5, _0805A67C @ =gCurTask
	mov ip, r5
	ldr r7, _0805A680 @ =Task_805A798
	ldr r6, _0805A684 @ =gMultiplayerConnections
	movs r5, #1
	adds r2, r1, #0
	ldr r4, _0805A688 @ =gMultiplayerCharacters
_0805A656:
	ldrb r0, [r6]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _0805A666
	adds r1, r3, r4
	ldrb r0, [r2, #2]
	strb r0, [r1]
_0805A666:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #3
	bls _0805A656
	mov r1, ip
	ldr r0, [r1]
	str r7, [r0, #8]
	b _0805A788
	.align 2, 0
_0805A678: .4byte gMultiSioRecv
_0805A67C: .4byte gCurTask
_0805A680: .4byte Task_805A798
_0805A684: .4byte gMultiplayerConnections
_0805A688: .4byte gMultiplayerCharacters
_0805A68C:
	movs r3, #0
	ldr r0, _0805A750 @ =gMultiplayerConnections
	mov ip, r0
	ldr r1, _0805A754 @ =gMultiSioSend
	mov sl, r1
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _0805A758 @ =0x0000FFFE
	mov r8, r1
	movs r6, #0
_0805A6A2:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A6EE
	ldr r4, _0805A75C @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	beq _0805A6EE
	adds r1, r6, r7
	ldrh r0, [r1]
	cmp r0, #0x21
	bne _0805A6EE
	ldrb r2, [r1, #2]
	ldrh r1, [r5, #0x28]
	mov r0, sb
	ands r0, r1
	lsrs r0, r0, #8
	cmp r2, r0
	bne _0805A6EE
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	bhs _0805A6EE
	ldr r2, [r5, #0x1c]
	ldrh r1, [r2, #0x12]
	mov r0, r8
	ands r0, r1
	strh r0, [r2, #0x12]
	ldr r0, _0805A760 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A764 @ =Task_805A060
	str r0, [r1, #8]
_0805A6EE:
	adds r6, #0x14
	adds r3, #1
	cmp r3, #3
	bls _0805A6A2
	ldr r1, _0805A768 @ =gMultiSioStatusFlags
	ldr r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805A776
	mov r6, sl
	movs r0, #0x22
	strh r0, [r6]
	ldrh r1, [r5, #0x28]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r6, #2]
	movs r3, #0
	ldr r0, _0805A750 @ =gMultiplayerConnections
	ldrb r0, [r0]
	mov r8, r0
	movs r4, #0
_0805A71E:
	mov r0, r8
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A746
	adds r1, r4, r7
	ldrh r2, [r1]
	cmp r2, #0x21
	bne _0805A76C
	ldrb r0, [r1, #2]
	mov r5, sp
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0805A772
_0805A746:
	adds r4, #0x14
	adds r3, #1
	cmp r3, #3
	bls _0805A71E
	b _0805A788
	.align 2, 0
_0805A750: .4byte gMultiplayerConnections
_0805A754: .4byte gMultiSioSend
_0805A758: .4byte 0x0000FFFE
_0805A75C: .4byte 0x04000128
_0805A760: .4byte gCurTask
_0805A764: .4byte Task_805A060
_0805A768: .4byte gMultiSioStatusFlags
_0805A76C:
	movs r0, #0x21
	strh r0, [r6]
	b _0805A788
_0805A772:
	strh r2, [r6]
	b _0805A788
_0805A776:
	mov r6, sl
	movs r0, #0x21
	strh r0, [r6]
	ldrh r1, [r5, #0x28]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r6, #2]
_0805A788:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.syntax divided
