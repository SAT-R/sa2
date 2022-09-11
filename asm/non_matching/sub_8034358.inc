.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _080343CC @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080343D0 @ =gGameMode
	ldrb r0, [r0]
	mov sl, r2
	ldr r1, _080343D4 @ =gUnknown_030055B8
	mov r8, r1
	cmp r0, #2
	bls _08034410
	movs r2, #0
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08034410
	movs r5, #1
	ldr r3, _080343D8 @ =gUnknown_030054D4
_0803438C:
	ldr r1, _080343DC @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r2
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080343F8
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080343FC
	movs r0, #0
	ldr r1, _080343E0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080343E4 @ =gUnknown_03002AE4
	ldr r0, _080343E8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080343EC @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080343F0 @ =gUnknown_03004D5C
	ldr r0, _080343F4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _08034614
	.align 2, 0
_080343CC: .4byte gCurTask
_080343D0: .4byte gGameMode
_080343D4: .4byte gUnknown_030055B8
_080343D8: .4byte gUnknown_030054D4
_080343DC: .4byte gMultiSioStatusFlags
_080343E0: .4byte 0x0000FFFF
_080343E4: .4byte gUnknown_03002AE4
_080343E8: .4byte gUnknown_0300287C
_080343EC: .4byte gUnknown_03005390
_080343F0: .4byte gUnknown_03004D5C
_080343F4: .4byte gUnknown_03002A84
_080343F8:
	movs r0, #0
	strb r0, [r3]
_080343FC:
	adds r3, #1
	adds r2, #1
	cmp r2, #3
	bhi _08034410
	mov r4, r8
	ldrb r0, [r4]
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	bne _0803438C
_08034410:
	movs r3, #0
	movs r4, #0
	ldr r0, _0803446C @ =gMultiSioRecv
	mov ip, r0
	ldr r0, _08034470 @ =gUnknown_030055B8
	ldrb r5, [r0]
	ldr r7, _08034474 @ =0x00004021
	mov r1, ip
	movs r2, #1
_08034422:
	adds r0, r5, #0
	asrs r0, r3
	ands r0, r2
	cmp r0, #0
	beq _08034434
	ldrh r0, [r1]
	cmp r0, r7
	bhi _08034434
	movs r4, #1
_08034434:
	adds r1, #0x14
	adds r3, #1
	cmp r3, #3
	bls _08034422
	cmp r4, #0
	beq _0803448C
	movs r4, #0xf3
	lsls r4, r4, #2
	adds r1, r6, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08034480
	lsls r0, r0, #1
	strb r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08034484
	ldr r0, _08034478 @ =gMultiSioSend
	mov sb, r0
	ldr r0, _08034474 @ =0x00004021
	mov r1, sb
	strh r0, [r1]
	mov r4, sl
	ldr r1, [r4]
	ldr r0, _0803447C @ =sub_8033F38
	str r0, [r1, #8]
	b _08034484
	.align 2, 0
_0803446C: .4byte gMultiSioRecv
_08034470: .4byte gUnknown_030055B8
_08034474: .4byte 0x00004021
_08034478: .4byte gMultiSioSend
_0803447C: .4byte sub_8033F38
_08034480:
	movs r0, #1
	strb r0, [r1]
_08034484:
	adds r0, r6, #0
	bl sub_8033C64
	b _08034614
_0803448C:
	movs r1, #0xf3
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
	mov r4, ip
	ldrh r1, [r4]
	ldr r3, _080344E4 @ =0x00004023
	cmp r1, r3
	bne _080344FC
	movs r3, #0
	ldr r0, _080344E8 @ =gUnknown_030055B8
	mov ip, r0
	movs r2, #0
	movs r7, #1
	adds r5, r4, #0
_080344AA:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r7
	cmp r0, #0
	beq _080344CC
	adds r4, r2, r5
	ldr r0, _080344EC @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080344CC
	ldr r0, _080344F0 @ =gUnknown_03005500
	adds r0, r3, r0
	ldrb r1, [r4, #2]
	strb r1, [r0]
_080344CC:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #3
	bls _080344AA
	adds r0, r6, #0
	bl sub_8033C64
	ldr r0, _080344F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080344F8 @ =sub_8032AF4
	str r0, [r1, #8]
	b _08034614
	.align 2, 0
_080344E4: .4byte 0x00004023
_080344E8: .4byte gUnknown_030055B8
_080344EC: .4byte gMultiSioStatusFlags
_080344F0: .4byte gUnknown_03005500
_080344F4: .4byte gCurTask
_080344F8: .4byte sub_8032AF4
_080344FC:
	ldr r0, _08034514 @ =0x00004021
	cmp r1, r0
	bne _08034520
	ldr r4, _08034518 @ =gMultiSioSend
	subs r0, #1
	strh r0, [r4]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0803451C @ =sub_8033F38
	str r0, [r1, #8]
	b _08034614
	.align 2, 0
_08034514: .4byte 0x00004021
_08034518: .4byte gMultiSioSend
_0803451C: .4byte sub_8033F38
_08034520:
	ldr r0, _08034598 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080345C2
	ldr r1, _0803459C @ =gMultiSioSend
	mov sb, r1
	strh r3, [r1]
	ldr r4, _080345A0 @ =0x000003C1
	adds r0, r6, r4
	ldrb r0, [r0]
	strb r0, [r1, #2]
	movs r2, #0
	movs r3, #0
	ldr r0, _080345A4 @ =gLoadedSaveGame
	ldr r0, [r0]
	adds r0, #7
_08034544:
	adds r1, r0, r3
	ldrb r4, [r1]
	cmp r2, r4
	bhs _0803454E
	ldrb r2, [r1]
_0803454E:
	adds r3, #1
	cmp r3, #4
	bls _08034544
	movs r3, #0
	ldr r5, _080345A8 @ =0x40220000
	ldr r7, _080345AC @ =0x00004021
	movs r2, #0
_0803455C:
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080345B8
	cmp r3, #0
	beq _080345B8
	mov r0, ip
	adds r4, r2, r0
	ldr r0, _080345B0 @ =gUnknown_03005500
	adds r0, r3, r0
	ldrb r1, [r4, #2]
	strb r1, [r0]
	ldrh r0, [r4]
	lsrs r1, r5, #0x10
	cmp r0, r1
	beq _080345B8
	mov r4, sb
	strh r1, [r4]
	ldr r0, _080345B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080345F2
	strh r7, [r4]
	b _080345F2
	.align 2, 0
_08034598: .4byte gMultiSioStatusFlags
_0803459C: .4byte gMultiSioSend
_080345A0: .4byte 0x000003C1
_080345A4: .4byte gLoadedSaveGame
_080345A8: .4byte 0x40220000
_080345AC: .4byte 0x00004021
_080345B0: .4byte gUnknown_03005500
_080345B4: .4byte gPressedKeys
_080345B8:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #3
	bls _0803455C
	b _080345F2
_080345C2:
	ldr r0, _08034624 @ =gMultiSioSend
	mov sb, r0
	ldr r0, _08034628 @ =0x00004022
	mov r1, sb
	strh r0, [r1]
	ldr r1, _0803462C @ =0x000003C1
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r4, #2]
	movs r2, #0
	movs r3, #0
	ldr r0, _08034630 @ =gLoadedSaveGame
	ldr r0, [r0]
	adds r0, #7
_080345DE:
	adds r1, r0, r3
	ldrb r4, [r1]
	cmp r2, r4
	bhs _080345E8
	ldrb r2, [r1]
_080345E8:
	adds r3, #1
	cmp r3, #4
	bls _080345DE
	mov r0, sb
	strb r2, [r0, #3]
_080345F2:
	adds r0, r6, #0
	bl sub_8033C64
	ldr r1, _08034634 @ =gBgScrollRegs
	ldrh r0, [r1, #2]
	subs r0, #1
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	subs r0, #1
	ands r0, r2
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #0xa]
_08034614:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034624: .4byte gMultiSioSend
_08034628: .4byte 0x00004022
_0803462C: .4byte 0x000003C1
_08034630: .4byte gLoadedSaveGame
_08034634: .4byte gBgScrollRegs

	
.syntax divided
