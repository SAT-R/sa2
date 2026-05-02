.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0804E6EC @ =gPlayer
	mov sl, r0
	ldr r0, _0804E6F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r1, _0804E6F4 @ =0x0300000C
	adds r1, r1, r6
	mov sb, r1
	ldr r2, _0804E6F8 @ =0x03000044
	adds r2, r6, r2
	str r2, [sp]
	mov r3, sl
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804E5DE
	ldr r2, _0804E6FC @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0804E700 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	mov r1, sb
	ldr r0, [r1, #0x10]
	ldr r1, _0804E704 @ =0xFFFFFE7F
	ands r0, r1
	mov r2, sb
	str r0, [r2, #0x10]
_0804E5DE:
	ldr r2, _0804E708 @ =sBoss5ProcData
	ldr r3, _0804E70C @ =0x0300009A
	adds r0, r6, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r4, #0
	mov r1, sl
	bl _call_via_r2
	str r0, [sp, #4]
	adds r0, r4, #0
	bl sub_804EB04
	ldr r0, _0804E710 @ =0x03000088
	adds r5, r6, r0
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ands r0, r1
	cmp r0, #0
	bne _0804E618
	adds r0, r4, #0
	bl sub_804FDD4
_0804E618:
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	bne _0804E62A
	adds r0, r4, #0
	bl sub_804EB90
_0804E62A:
	ldr r1, _0804E714 @ =0x0300008C
	adds r1, r1, r6
	mov r8, r1
	ldr r1, [r1]
	ldr r0, [r4, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0804E718 @ =0x03000090
	adds r7, r6, r2
	ldr r2, [r7]
	ldr r0, [r4, #0x78]
	asrs r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	mov r3, sl
	bl sub_800BFEC
	adds r5, r0, #0
	ldr r3, _0804E71C @ =gNumSingleplayerCharacters
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	bne _0804E684
	mov r0, r8
	ldr r1, [r0]
	ldr r0, [r4, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, [r7]
	ldr r0, [r4, #0x78]
	asrs r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0804E720 @ =gPartner
	mov r0, sb
	bl sub_800BFEC
	orrs r5, r0
_0804E684:
	cmp r5, #0
	beq _0804E68A
	b _0804E7D0
_0804E68A:
	ldr r1, _0804E724 @ =0x03000097
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0804E69A
	b _0804E7DE
_0804E69A:
	mov r2, r8
	ldr r1, [r2]
	ldr r0, [r4, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, [r7]
	ldr r0, [r4, #0x78]
	asrs r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	mov r3, sl
	bl sub_800C0E0
	adds r5, r0, #0
	ldr r3, _0804E71C @ =gNumSingleplayerCharacters
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	bne _0804E728
	mov r0, r8
	ldr r1, [r0]
	ldr r0, [r4, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, [r7]
	ldr r0, [r4, #0x78]
	asrs r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0804E720 @ =gPartner
	mov r0, sb
	bl sub_800C0E0
	b _0804E72A
	.align 2, 0
_0804E6EC: .4byte gPlayer
_0804E6F0: .4byte gCurTask
_0804E6F4: .4byte 0x0300000C
_0804E6F8: .4byte 0x03000044
_0804E6FC: .4byte gDispCnt
_0804E700: .4byte 0x00007FFF
_0804E704: .4byte 0xFFFFFE7F
_0804E708: .4byte sBoss5ProcData
_0804E70C: .4byte 0x0300009A
_0804E710: .4byte 0x03000088
_0804E714: .4byte 0x0300008C
_0804E718: .4byte 0x03000090
_0804E71C: .4byte gNumSingleplayerCharacters
_0804E720: .4byte gPartner
_0804E724: .4byte 0x03000097
_0804E728:
	movs r0, #0
_0804E72A:
	cmp r5, #0
	beq _0804E764
	adds r0, r4, #0
	adds r0, #0x9a
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #5
	beq _0804E73E
	cmp r2, #0xa
	bne _0804E75E
_0804E73E:
	mov r1, sl
	ldr r0, [r1, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804E75E
	cmp r2, #0xa
	beq _0804E7D0
	movs r2, #0
	str r2, [sp, #4]
	adds r1, r4, #0
	adds r1, #0x9b
	movs r0, #0xa
	strb r0, [r1]
	mov r3, sl
	b _0804E794
_0804E75E:
	movs r0, #0
	str r0, [sp, #4]
	b _0804E7AC
_0804E764:
	cmp r0, #0
	beq _0804E7D0
	adds r0, r4, #0
	adds r0, #0x9a
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #5
	beq _0804E778
	cmp r2, #0xa
	bne _0804E7A8
_0804E778:
	ldr r3, _0804E7A4 @ =gPartner
	ldr r0, [r3, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804E7A8
	cmp r2, #0xa
	beq _0804E7D0
	movs r1, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r1, #0x9b
	movs r0, #0xa
	strb r0, [r1]
_0804E794:
	ldrh r0, [r3, #8]
	rsbs r0, r0, #0
	strh r0, [r3, #8]
	ldrh r0, [r3, #0xc]
	rsbs r0, r0, #0
	strh r0, [r3, #0xc]
	b _0804E7D0
	.align 2, 0
_0804E7A4: .4byte gPartner
_0804E7A8:
	movs r2, #0
	str r2, [sp, #4]
_0804E7AC:
	adds r2, r4, #0
	adds r2, #0x9b
	movs r0, #0x11
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x95
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0804E7C8
	movs r0, #0x13
	strb r0, [r2]
_0804E7C8:
	adds r1, r4, #0
	adds r1, #0x97
	movs r0, #0x20
	strb r0, [r1]
_0804E7D0:
	adds r0, r4, #0
	adds r0, #0x97
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804E82E
_0804E7DE:
	ldr r0, _0804E8BC @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804E814
	ldr r0, _0804E8C0 @ =gPlayer
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804E814
	mov r3, sb
	ldr r0, [r3, #0x10]
	adds r1, #0x80
	orrs r0, r1
	str r0, [r3, #0x10]
	ldr r2, _0804E8C4 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0804E8C8 @ =gWinRegs
	ldr r0, _0804E8CC @ =0x00003F3F
	strh r0, [r1, #0xa]
_0804E814:
	adds r0, r4, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	subs r0, #0x11
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0804E82E
	adds r1, r4, #0
	adds r1, #0x97
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0804E82E:
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r1, [r0]
	ldr r0, [r4, #0x74]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0804E8D0 @ =gCamera
	ldrh r0, [r2]
	subs r1, r1, r0
	ldr r3, [sp]
	strh r1, [r3, #0x16]
	mov r0, sb
	strh r1, [r0, #0x16]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, [r4, #0x78]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldrh r0, [r2, #2]
	subs r1, r1, r0
	strh r1, [r3, #0x18]
	mov r2, sb
	strh r1, [r2, #0x18]
	adds r5, r4, #0
	adds r5, #0x88
	ldr r0, [r5]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804E878
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
_0804E878:
	ldr r0, [r5]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804E88E
	ldr r0, [sp]
	bl UpdateSpriteAnimation
	ldr r0, [sp]
	bl DisplaySprite
_0804E88E:
	ldr r3, [sp, #4]
	cmp r3, #0
	bne _0804E8AC
	adds r0, r4, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x9a
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_804E8D4
_0804E8AC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E8BC: .4byte gStageTime
_0804E8C0: .4byte gPlayer
_0804E8C4: .4byte gDispCnt
_0804E8C8: .4byte gWinRegs
_0804E8CC: .4byte 0x00003F3F
_0804E8D0: .4byte gCamera

.syntax divided
