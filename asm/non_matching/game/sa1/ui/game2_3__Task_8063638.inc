.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _080636AC @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r0, _080636B0 @ =gGameMode
	ldrb r0, [r0]
	mov sb, r2
	ldr r7, _080636B4 @ =gMultiSioStatusFlags
	cmp r0, #1
	bls _080636EE
	movs r5, #0
	ldr r2, _080636B8 @ =gMultiplayerConnections
	ldrb r1, [r2]
	movs r0, #1
	ands r1, r0
	adds r6, r2, #0
	cmp r1, #0
	beq _080636EE
	movs r2, #1
	ldr r3, _080636BC @ =gMultiplayerMissingHeartbeats
_0806366E:
	adds r0, r2, #0
	lsls r0, r5
	ldr r4, [r7]
	ands r4, r0
	cmp r4, #0
	bne _080636D8
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080636DC
	movs r0, #0
	ldr r1, _080636C0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080636C4 @ =gBackgroundsCopyQueueCursor
	ldr r0, _080636C8 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080636CC @ =gBgSpritesCount
	strb r4, [r0]
	ldr r1, _080636D0 @ =gVramGraphicsCopyCursor
	ldr r0, _080636D4 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _08063818
	.align 2, 0
_080636AC: .4byte gCurTask
_080636B0: .4byte gGameMode
_080636B4: .4byte gMultiSioStatusFlags
_080636B8: .4byte gMultiplayerConnections
_080636BC: .4byte gMultiplayerMissingHeartbeats
_080636C0: .4byte 0x0000FFFF
_080636C4: .4byte gBackgroundsCopyQueueCursor
_080636C8: .4byte gBackgroundsCopyQueueIndex
_080636CC: .4byte gBgSpritesCount
_080636D0: .4byte gVramGraphicsCopyCursor
_080636D4: .4byte gVramGraphicsCopyQueueIndex
_080636D8:
	movs r0, #0
	strb r0, [r3]
_080636DC:
	adds r3, #1
	adds r5, #1
	cmp r5, #3
	bhi _080636EE
	ldrb r0, [r6]
	asrs r0, r5
	ands r0, r2
	cmp r0, #0
	bne _0806366E
_080636EE:
	ldr r4, _080637BC @ =gMultiSioRecv
	ldrh r0, [r4]
	adds r5, r4, #0
	ldr r1, _080637C0 @ =gMultiSioSend
	mov r8, r1
	movs r1, #0x55
	add ip, r1
	cmp r0, #0x52
	bne _0806371A
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _080637C4 @ =Task_80638B0
	str r0, [r1, #8]
	movs r3, #0
	adds r1, r4, #3
	ldr r2, _080637C8 @ =gChaoTasks
_0806370E:
	adds r0, r1, r3
	ldrb r0, [r0]
	stm r2!, {r0}
	adds r3, #1
	cmp r3, #2
	bls _0806370E
_0806371A:
	ldr r0, [r7]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806380C
	movs r3, #1
	ldr r1, _080637CC @ =gMultiplayerConnections
	ldrb r0, [r1]
	asrs r0, r0, #1
	ands r0, r3
	adds r6, r1, #0
	cmp r0, #0
	beq _0806373A
	ldrh r0, [r5, #0x14]
	cmp r0, #0x51
	bne _0806375A
_0806373A:
	adds r3, #1
	cmp r3, #3
	bhi _0806375A
	ldrb r0, [r6]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806373A
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r4, r0, r5
	ldrh r0, [r4]
	cmp r0, #0x51
	beq _0806373A
_0806375A:
	cmp r3, #4
	bne _0806380C
	mov r4, r8
	movs r0, #0x52
	strh r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r4, #2]
	ldr r2, _080637D0 @ =gPseudoRandom
	ldr r0, [r2]
	ldr r1, _080637D4 @ =0x00196225
	mov ip, r1
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r7, _080637D8 @ =0x3C6EF35F
	adds r0, r0, r7
	str r0, [r2]
	adds r3, r0, #0
	movs r1, #7
	ands r0, r1
	strb r0, [r4, #3]
	lsrs r3, r3, #8
	ldrb r1, [r4, #3]
	movs r0, #7
	ands r0, r3
	adds r6, r2, #0
	cmp r1, r0
	bne _080637AE
	adds r5, r6, #0
	movs r2, #7
_08063798:
	ldr r0, [r5]
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r7
	str r0, [r5]
	adds r3, r0, #0
	ldrb r1, [r4, #3]
	ands r0, r2
	cmp r1, r0
	beq _08063798
_080637AE:
	movs r0, #7
	adds r1, r3, #0
	ands r1, r0
	strb r1, [r4, #4]
	lsrs r3, r3, #8
	b _080637EA
	.align 2, 0
_080637BC: .4byte gMultiSioRecv
_080637C0: .4byte gMultiSioSend
_080637C4: .4byte Task_80638B0
_080637C8: .4byte gChaoTasks
_080637CC: .4byte gMultiplayerConnections
_080637D0: .4byte gPseudoRandom
_080637D4: .4byte 0x00196225
_080637D8: .4byte 0x3C6EF35F
_080637DC:
	ldr r1, [r6]
	ldr r0, _08063804 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08063808 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r6]
	adds r3, r0, #0
_080637EA:
	ldrb r0, [r4, #3]
	movs r1, #7
	ands r1, r3
	cmp r0, r1
	beq _080637DC
	ldrb r0, [r4, #4]
	cmp r0, r1
	beq _080637DC
	movs r0, #7
	ands r3, r0
	strb r3, [r4, #5]
	b _08063818
	.align 2, 0
_08063804: .4byte 0x00196225
_08063808: .4byte 0x3C6EF35F
_0806380C:
	mov r4, r8
	movs r0, #0x51
	strh r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	strb r0, [r4, #2]
_08063818:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
