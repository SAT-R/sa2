
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0801D568 @ =gStageBackgroundsRam
	ldr r1, _0801D56C @ =gBgScrollRegs
	asrs r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, _0801D570 @ =gStageTime
	ldr r0, [r0]
	movs r1, #0xd0
	lsls r1, r1, #3
	bl Mod
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	movs r2, #7
	ldr r0, _0801D574 @ =gUnknown_080D5BF0
	ldrh r0, [r0, #0xe]
	cmp r6, r0
	bls _0801D578
	movs r5, #7
	b _0801D598
	.align 2, 0
_0801D568: .4byte gStageBackgroundsRam
_0801D56C: .4byte gBgScrollRegs
_0801D570: .4byte gStageTime
_0801D574: .4byte gUnknown_080D5BF0
_0801D578:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	lsls r3, r2, #0x18
	asrs r0, r3, #0x18
	cmp r0, #0
	blt _0801D598
	ldr r1, _0801D5C4 @ =gUnknown_080D5BF0
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bls _0801D578
	lsrs r5, r3, #0x18
_0801D598:
	ldr r0, _0801D5C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801D5A2
	movs r5, #5
_0801D5A2:
	ldr r1, _0801D5CC @ =gBgPalette
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0801D5D0 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	mov sl, r2          @ sl = r2 = gFlags
	cmp r5, #7
	bls _0801D5BA
	b StageBgUpdate_Zone6Acts12_return
_0801D5BA:
	lsls r0, r5, #2
	ldr r1, _0801D5D4 @ =_0801D5D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D5C4: .4byte gUnknown_080D5BF0
_0801D5C8: .4byte gGameMode
_0801D5CC: .4byte gBgPalette
_0801D5D0: .4byte gFlags
_0801D5D4: .4byte _0801D5D8
_0801D5D8: @ jump table
	.4byte _0801D5F8_case0 @ case 0
	.4byte _0801D680_case1 @ case 1
	.4byte _0801D68C_case2 @ case 2
	.4byte _0801D6D0_case3 @ case 3
	.4byte _0801D718_case4 @ case 4
	.4byte _0801D7F8_case5 @ case 5
	.4byte _0801D86C_case6 @ case 6
	.4byte _0801D90C_case7 @ case 7
_0801D5F8_case0:
	cmp r6, #1
	bne _0801D630
	ldr r1, _0801D624 @ =gStageCameraBgTemplates
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa7
	strh r0, [r4, #0x1c]
	ldr r0, _0801D628 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D62C @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl InitBackground
	b StageBgUpdate_Zone6Acts12_return
	.align 2, 0
_0801D624: .4byte gStageCameraBgTemplates
_0801D628: .4byte 0x0600C000
_0801D62C: .4byte 0x0600D000
_0801D630:
	cmp r6, #1
	bhi _0801D636
	b StageBgUpdate_Zone6Acts12_return
_0801D636:
	ldr r2, _0801D674 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801D678 @ =gBgCntRegs
	ldrh r3, [r2]
	ldr r1, _0801D67C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r3
	movs r3, #3
	orrs r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #6]
	ands r1, r0
	orrs r1, r3
	strh r1, [r2, #6]
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _0801D666
	movs r2, #0x3f
_0801D666:
	lsrs r6, r6, #2
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3f
	subs r1, r1, r2
	b _0801D684
	.align 2, 0
_0801D674: .4byte gDispCnt
_0801D678: .4byte gBgCntRegs
_0801D67C: .4byte 0x0000FFFC
_0801D680_case1:
	movs r0, #0xf
	movs r1, #0
_0801D684:
	movs r2, #0
	bl sub_801D24C
	b StageBgUpdate_Zone6Acts12_return
_0801D68C_case2:
	ldr r1, _0801D6B4 @ =0xFFFFFDBF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsls r1, r0, #8
	lsrs r2, r1, #0x18
	lsrs r6, r0, #0x12
	movs r0, #0xf
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0801D6B8
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3f
	subs r1, r1, r2
	movs r2, #1
	bl sub_801D24C
	b StageBgUpdate_Zone6Acts12_return
	.align 2, 0
_0801D6B4: .4byte 0xFFFFFDBF
_0801D6B8:
	mov r2, sl
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801D6CC @ =gBldRegs
	strh r6, [r0]
	b StageBgUpdate_Zone6Acts12_return
	.align 2, 0
_0801D6CC: .4byte gBldRegs
_0801D6D0_case3:
	ldr r3, _0801D70C @ =gBgCntRegs
	ldrh r2, [r3]
	ldr r1, _0801D710 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	movs r2, #3
	orrs r0, r2
	strh r0, [r3]
	ldrh r0, [r3, #6]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strh r1, [r3, #6]
	movs r2, #0
	ldr r4, _0801D714 @ =
	movs r3, #0
_0801D6F0:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0xf
	ble _0801D6F0
	b _0801D8EE
	.align 2, 0
_0801D70C: .4byte gBgCntRegs
_0801D710: .4byte 0x0000FFFC
_0801D714: .4byte gBgPalette
_0801D718_case4:
	ldr r0, _0801D744 @ =0x00000381
	cmp r6, r0
	bne _0801D754
	ldr r1, _0801D748 @ =gStageCameraBgTemplates
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa8
	strh r0, [r4, #0x1c]
	ldr r0, _0801D74C @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D750 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl InitBackground
	b _0801D76C
	.align 2, 0
_0801D744: .4byte 0x00000381
_0801D748: .4byte gStageCameraBgTemplates
_0801D74C: .4byte 0x0600C000
_0801D750: .4byte 0x0600D000
_0801D754:
	ldr r2, _0801D7D8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801D7DC @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
_0801D76C:
	ldr r1, _0801D7E0 @ =0xFFFFFC7F
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r3, _0801D7E4 @ =gBgScrollRegs
	mov r8, r3
	ldr r0, _0801D7E8 @ =gFlags
	mov sl, r0
	ldr r1, _0801D7EC @ =gUnknown_080D5C02
	mov ip, r1
	movs r7, #0x1f
	ldr r3, _0801D7F0 @ =gBgPalette
	mov sb, r3
_0801D788:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r1, r3, #1
	adds r1, r1, r3
	mov r2, ip
	adds r0, r1, r2
	ldrb r4, [r0]
	muls r4, r6, r4
	asrs r4, r4, #5
	ands r4, r7     @ r4 = red
	mov r0, ip
	adds r0, #1
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r2, r5, #0
	muls r2, r6, r2
	asrs r2, r2, #5
	ands r2, r7     @ r2 = green
	ldr r0, _0801D7F4 @ =gUnknown_080D5C02+2
	adds r1, r1, r0
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #5
	ands r0, r7     @ r0 = blue
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, sb
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D788
	b _0801D83C
	.align 2, 0
_0801D7D8: .4byte gDispCnt
_0801D7DC: .4byte gBgCntRegs
_0801D7E0: .4byte 0xFFFFFC7F
_0801D7E4: .4byte gBgScrollRegs
_0801D7E8: .4byte gFlags
_0801D7EC: .4byte gUnknown_080D5C02
_0801D7F0: .4byte gBgPalette
_0801D7F4: .4byte gUnknown_080D5C02+2
_0801D7F8_case5:
	movs r2, #0
	ldr r0, _0801D860 @ =gBgScrollRegs
	mov r8, r0
	ldr r6, _0801D864 @ =gUnknown_080D5C02
	adds r1, r6, #2
	mov sb, r1
	ldr r3, _0801D868 @ =gBgPalette
	mov ip, r3
	adds r7, r6, #1
_0801D80A:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r0, r3, #1
	adds r0, r0, r3
	adds r1, r0, r6
	ldrb r4, [r1]
	adds r1, r0, r7
	ldrb r5, [r1]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0xf0
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r0, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D80A
_0801D83C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	str r0, [r2]
	mov r3, r8
	ldrh r0, [r3]
	subs r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r3, #2]
	adds r0, #1
	ands r0, r1
	strh r0, [r3, #2]
	b StageBgUpdate_Zone6Acts12_return
	.align 2, 0
_0801D860: .4byte gBgScrollRegs
_0801D864: .4byte gUnknown_080D5C02
_0801D868: .4byte gBgPalette
_0801D86C_case6:
	ldr r1, _0801D8FC @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	ldr r1, _0801D900 @ =0xFFFFFA5F
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x1f
	subs r0, r0, r6
	lsls r0, r0, #0xf
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r3, _0801D904 @ =gUnknown_080D5C02
	mov ip, r3
	movs r7, #0x1f
	movs r0, #2
	add r0, ip
	mov sb, r0
	ldr r1, _0801D908 @ =gBgPalette
	mov r8, r1
_0801D8A2:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r1, r3, #1
	adds r1, r1, r3
	mov r2, ip
	adds r0, r1, r2
	ldrb r4, [r0]
	muls r4, r6, r4
	asrs r4, r4, #4
	ands r4, r7
	mov r0, ip
	adds r0, #1
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r2, r5, #0
	muls r2, r6, r2
	asrs r2, r2, #4
	ands r2, r7
	add r1, sb
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #4
	ands r0, r7
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D8A2
_0801D8EE:
	mov r3, sl
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	b StageBgUpdate_Zone6Acts12_return
	.align 2, 0
_0801D8FC: .4byte gBgScrollRegs
_0801D900: .4byte 0xFFFFFA5F
_0801D904: .4byte gUnknown_080D5C02
_0801D908: .4byte gBgPalette
_0801D90C_case7:
	movs r2, #0
	ldr r5, _0801D950 @ =gDispCnt
	ldr r4, _0801D954 @ =gBgPalette
	movs r3, #0
_0801D914:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0xf
	ble _0801D914
	mov r1, sl
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	str r0, [r2]
	ldrh r1, [r5]
	ldr r0, _0801D958 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r5]
StageBgUpdate_Zone6Acts12_return:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D950: .4byte gDispCnt
_0801D954: .4byte gBgPalette
_0801D958: .4byte 0x0000FEFF

.syntax divided
