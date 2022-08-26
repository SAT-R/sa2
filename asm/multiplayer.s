.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_805D1F8
sub_805D1F8: @ 0x0805D1F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	movs r2, #2
	bl memset
	ldr r0, _0805D254 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0805D258 @ =IWRAM_START + 0x31F
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D27E
	ldr r0, _0805D25C @ =gRepeatedKeys
	ldrh r2, [r0]
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0805D264
	ldr r0, _0805D260 @ =IWRAM_START + 0x31E
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805D24A
	movs r0, #0x6c
	bl m4aSongNumStart
_0805D24A:
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r4]
	b _0805D27E
	.align 2, 0
_0805D254: .4byte gCurTask
_0805D258: .4byte IWRAM_START + 0x31F
_0805D25C: .4byte gRepeatedKeys
_0805D260: .4byte IWRAM_START + 0x31E
_0805D264:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0805D27E
	ldr r2, _0805D2CC @ =IWRAM_START + 0x31E
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r0, #1
	bne _0805D27C
	movs r0, #0x6c
	bl m4aSongNumStart
_0805D27C:
	strb r5, [r4]
_0805D27E:
	ldr r0, _0805D2D0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805D306
	movs r3, #0
	ldr r0, _0805D2D4 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _0805D306
	movs r5, #1
	ldr r2, _0805D2D8 @ =gUnknown_030054D4
_0805D29A:
	ldr r1, _0805D2DC @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805D2F0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805D2F4
	movs r0, #0
	ldr r1, _0805D2E0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805D2E4 @ =gUnknown_03002AE4
	ldr r0, _0805D2E8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805D2EC @ =gUnknown_03005390
	strb r4, [r0]
	b _0805D52A
	.align 2, 0
_0805D2CC: .4byte IWRAM_START + 0x31E
_0805D2D0: .4byte gGameMode
_0805D2D4: .4byte gUnknown_030055B8
_0805D2D8: .4byte gUnknown_030054D4
_0805D2DC: .4byte gMultiSioStatusFlags
_0805D2E0: .4byte 0x0000FFFF
_0805D2E4: .4byte gUnknown_03002AE4
_0805D2E8: .4byte gUnknown_0300287C
_0805D2EC: .4byte gUnknown_03005390
_0805D2F0:
	movs r0, #0
	strb r0, [r2]
_0805D2F4:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805D306
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0805D29A
_0805D306:
	mov r4, r8
	adds r4, #0xf0
	movs r0, #0x78
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	movs r6, #0
	ldr r2, _0805D3A8 @ =gUnknown_030055B8
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D328
	b _0805D436
_0805D328:
	mov sb, r2
	mov r7, sp
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0x40
	mov sl, r1
	movs r2, #0
	str r2, [sp, #0xc]
_0805D338:
	ldr r0, _0805D3AC @ =gMultiSioRecv
	ldr r1, [sp, #0xc]
	adds r5, r1, r0
	cmp r6, #0
	bne _0805D34E
	movs r4, #0xd8
	lsls r4, r4, #1
	add r4, r8
	adds r0, r4, #0
	bl sub_8004558
_0805D34E:
	ldrh r1, [r5]
	ldr r2, _0805D3B0 @ =0xFFFFBFC0
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0805D40C
	ldr r0, _0805D3B4 @ =0x00004041
	cmp r1, r0
	beq _0805D3E2
	ldr r4, [sp, #8]
	add r4, r8
	mov r1, sl
	strh r1, [r4, #0x18]
	ldr r1, _0805D3B8 @ =gUnknown_080D92B8
	ldrb r0, [r5, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_80051E8
	movs r4, #0xd8
	lsls r4, r4, #1
	add r4, r8
	mov r2, sl
	strh r2, [r4, #0x18]
	ldr r1, _0805D3BC @ =gUnknown_080D92BA
	ldrb r0, [r5, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x16]
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0805D3C4
	ldr r0, [r4, #0x10]
	ldr r1, _0805D3C0 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	movs r1, #0x10
	lsls r1, r6
	mov r2, sb
	ldrb r0, [r2]
	bics r0, r1
	b _0805D3D8
	.align 2, 0
_0805D3A8: .4byte gUnknown_030055B8
_0805D3AC: .4byte gMultiSioRecv
_0805D3B0: .4byte 0xFFFFBFC0
_0805D3B4: .4byte 0x00004041
_0805D3B8: .4byte gUnknown_080D92B8
_0805D3BC: .4byte gUnknown_080D92BA
_0805D3C0: .4byte 0xFFFFFBFF
_0805D3C4:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	movs r0, #0x10
	lsls r0, r6
	mov r2, sb
	ldrb r1, [r2]
	orrs r0, r1
_0805D3D8:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80051E8
	b _0805D40C
_0805D3E2:
	ldr r4, [sp, #8]
	add r4, r8
	adds r0, r4, #0
	bl sub_80051E8
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	ldr r0, _0805D400 @ =gUnknown_080D92B8
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805D404
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _0805D410
	.align 2, 0
_0805D400: .4byte gUnknown_080D92B8
_0805D404:
	ldrb r0, [r7, #1]
	adds r0, #1
	strb r0, [r7, #1]
	b _0805D410
_0805D40C:
	movs r0, #0
	str r0, [sp, #4]
_0805D410:
	ldr r1, [sp, #8]
	adds r1, #0x30
	str r1, [sp, #8]
	movs r2, #0x18
	add sl, r2
	ldr r0, [sp, #0xc]
	adds r0, #0x14
	str r0, [sp, #0xc]
	adds r6, #1
	cmp r6, #3
	bgt _0805D436
	mov r1, sb
	ldrb r0, [r1]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805D436
	b _0805D338
_0805D436:
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _0805D474
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D450
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0805D460
_0805D450:
	ldr r1, _0805D45C @ =0x0000031F
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	b _0805D474
	.align 2, 0
_0805D45C: .4byte 0x0000031F
_0805D460:
	ldr r0, _0805D46C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805D470 @ =sub_805D610
	str r0, [r1, #8]
	b _0805D59C
	.align 2, 0
_0805D46C: .4byte gCurTask
_0805D470: .4byte sub_805D610
_0805D474:
	mov r0, r8
	bl sub_805D118
	ldr r4, _0805D4FC @ =gPressedKeys
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805D494
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _0805D500 @ =0x0000031F
	add r1, r8
	movs r0, #0
	strb r0, [r1]
_0805D494:
	ldr r0, _0805D504 @ =gInput
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0805D4CC
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805D4CC
	ldr r0, _0805D508 @ =0x0000031E
	add r0, r8
	ldrb r2, [r0]
	cmp r2, #0
	bne _0805D4BE
	subs r1, r5, #1
	mov r0, sp
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805D4D6
_0805D4BE:
	cmp r2, #1
	bne _0805D4CC
	subs r0, r5, #1
	mov r1, sp
	ldrb r1, [r1, #1]
	cmp r0, r1
	bne _0805D4D6
_0805D4CC:
	ldr r0, _0805D500 @ =0x0000031F
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D550
_0805D4D6:
	ldr r4, _0805D500 @ =0x0000031F
	add r4, r8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805D4E6
	movs r0, #0x6a
	bl m4aSongNumStart
_0805D4E6:
	ldr r5, _0805D50C @ =gMultiSioSend
	ldr r0, _0805D510 @ =0x00004041
	strh r0, [r5]
	ldr r0, _0805D508 @ =0x0000031E
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r4]
	b _0805D55E
	.align 2, 0
_0805D4FC: .4byte gPressedKeys
_0805D500: .4byte 0x0000031F
_0805D504: .4byte gInput
_0805D508: .4byte 0x0000031E
_0805D50C: .4byte gMultiSioSend
_0805D510: .4byte 0x00004041
_0805D514:
	ldr r1, _0805D538 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805D53C @ =gUnknown_03002AE4
	ldr r0, _0805D540 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805D544 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
_0805D52A:
	ldr r1, _0805D548 @ =gUnknown_03004D5C
	ldr r0, _0805D54C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _0805D59C
	.align 2, 0
_0805D538: .4byte 0x0000FFFF
_0805D53C: .4byte gUnknown_03002AE4
_0805D540: .4byte gUnknown_0300287C
_0805D544: .4byte gUnknown_03005390
_0805D548: .4byte gUnknown_03004D5C
_0805D54C: .4byte gUnknown_03002A84
_0805D550:
	ldr r5, _0805D5AC @ =gMultiSioSend
	ldr r0, _0805D5B0 @ =0x00004040
	strh r0, [r5]
	ldr r0, _0805D5B4 @ =0x0000031E
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5, #2]
_0805D55E:
	movs r6, #0
	ldr r0, _0805D5B8 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _0805D59C
	ldr r3, _0805D5BC @ =0x00004041
	movs r2, #0
_0805D572:
	ldr r0, _0805D5C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r6
	beq _0805D588
	ldr r0, _0805D5C4 @ =gMultiSioRecv
	adds r5, r2, r0
	ldrh r0, [r5]
	cmp r0, r3
	bhi _0805D514
_0805D588:
	adds r2, #0x14
	adds r6, #1
	cmp r6, #3
	bgt _0805D59C
	ldrb r0, [r7]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D572
_0805D59C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5AC: .4byte gMultiSioSend
_0805D5B0: .4byte 0x00004040
_0805D5B4: .4byte 0x0000031E
_0805D5B8: .4byte gUnknown_030055B8
_0805D5BC: .4byte 0x00004041
_0805D5C0: .4byte 0x04000128
_0805D5C4: .4byte gMultiSioRecv

	thumb_func_start sub_805D5C8
sub_805D5C8: @ 0x0805D5C8
	push {r4, lr}
	ldr r4, _0805D5FC @ =gCurTask
	ldr r0, [r4]
	ldrh r2, [r0, #6]
	ldr r0, _0805D600 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r1, r0
	ldr r3, _0805D604 @ =IWRAM_START + 0x31E
	adds r0, r2, r3
	movs r3, #0
	strb r1, [r0]
	ldr r0, _0805D608 @ =IWRAM_START + 0x31F
	adds r2, r2, r0
	strb r3, [r2]
	ldr r1, [r4]
	ldr r0, _0805D60C @ =sub_805D1F8
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5FC: .4byte gCurTask
_0805D600: .4byte 0x04000128
_0805D604: .4byte IWRAM_START + 0x31E
_0805D608: .4byte IWRAM_START + 0x31F
_0805D60C: .4byte sub_805D1F8

	thumb_func_start sub_805D610
sub_805D610: @ 0x0805D610
	push {lr}
	ldr r0, _0805D638 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _0805D63C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0805D640 @ =gUnknown_030054D8
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80346C8
	pop {r0}
	bx r0
	.align 2, 0
_0805D638: .4byte gCurTask
_0805D63C: .4byte gFlags
_0805D640: .4byte gUnknown_030054D8

	thumb_func_start sub_805D644
sub_805D644: @ 0x0805D644
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #1
	ldr r7, _0805D688 @ =gUnknown_080D92B8
_0805D64E:
	ldr r0, _0805D68C @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _0805D676
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r0, r2, #4
	adds r0, r6, r0
	adds r1, r4, #0
	ands r1, r5
	adds r1, r1, r7
	ldrb r1, [r1]
	strh r1, [r0, #0x16]
	lsls r2, r2, #3
	adds r2, #0x40
	strh r2, [r0, #0x18]
	bl sub_80051E8
_0805D676:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0805D64E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D688: .4byte gUnknown_080D92B8
_0805D68C: .4byte gUnknown_030055B8
