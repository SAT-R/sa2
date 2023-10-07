.include "constants/gba_constants.inc"
.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0802FB04 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp]            @ sp00 = parent
	ldr r0, _0802FB08 @ =IWRAM_START+4
	adds r0, r1, r0
	str r0, [sp, #4]        @ sp04 = transition
	ldr r1, [sp]
	ldr r5, [r1]
	ldr r2, _0802FB0C @ =gDispCnt
	ldrh r1, [r2]
	ldr r3, _0802FB10 @ =0x00001FFF
	adds r0, r3, #0
	ands r0, r1
	strh r0, [r2]
	cmp r5, #0x95
	bhi _0802FA30
	b _0802FC5C
_0802FA30:
	subs r5, #0x96
	cmp r5, #0xf
	bls _0802FA38
	movs r5, #0x10
_0802FA38:
	lsls r0, r5, #9
	ldr r1, [sp, #4]
	strh r0, [r1, #4]
	lsls r0, r5, #0x19
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _0802FA4C
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1, #4]
_0802FA4C:
	ldr r0, _0802FB14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802FB28
	movs r6, #0
	ldr r3, _0802FB18 @ =gUnknown_080D6FF5
	mov ip, r3
	ldr r0, _0802FB1C @ =gObjPalette
	mov sb, r0      @ sb = gObjPalette
	mov r8, ip      @ r8 = ip = gUnknown_080D6FF5
	movs r1, #2
	add r1, ip
	mov sl, r1      @ sl = ip = gUnknown_080D6FF5+2
_0802FA66:
	lsls r3, r6, #1
	adds r7, r3, r6 @ r7 = i*3
	ldr r1, _0802FB20 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4     @ r2 = gSelChar*48
	adds r2, r7, r2     @ r2 += i*3
	mov r1, r8
	adds r0, r2, r1     @ r0 = gUnknown_080D6FF5[r2]
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r8
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r5, r1
	lsrs r1, r1, #4
	lsls r1, r1, #0x18
	add r2, sl
	ldrb r0, [r2]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	add r3, sb
	lsrs r0, r0, #0xe
	lsrs r1, r1, #0x13
	orrs r0, r1
	orrs r0, r4
	strh r0, [r3]
	ldr r3, _0802FB24 @ =gUnknown_030056A4
	ldr r0, [r3]
	cmp r0, #0
	beq _0802FAF8
	mov r0, ip
	adds r0, #0xf0
	adds r0, r7, r0
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, ip
	adds r0, #0xf1
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	mov r0, ip
	adds r0, #0xf2
	adds r0, r7, r0
	ldrb r0, [r0]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0xe0
	lsls r1, r1, #1
	add r1, sb
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
_0802FAF8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FA66
	b _0802FC12
	.align 2, 0
_0802FB04: .4byte gCurTask
_0802FB08: .4byte IWRAM_START+4
_0802FB0C: .4byte gDispCnt
_0802FB10: .4byte 0x00001FFF
_0802FB14: .4byte gGameMode
_0802FB18: .4byte gUnknown_080D6FF5
_0802FB1C: .4byte gObjPalette
_0802FB20: .4byte gSelectedCharacter
_0802FB24: .4byte gUnknown_030056A4
_0802FB28:
	movs r2, #0
_0802FB2A:
	ldr r0, _0802FC34 @ =gMultiplayerConnections
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r3, r2, #1
	mov sb, r3
	cmp r1, #0
	beq _0802FBA8
	movs r6, #0
	ldr r0, _0802FC38 @ =gUnknown_080D6FF5
	mov ip, r0
	lsls r1, r2, #4
	mov r8, r1
	mov r7, ip
	ldr r0, _0802FC3C @ =gMultiplayerCharacters
	adds r2, r2, r0
	mov ip, r2
	ldr r3, _0802FC40 @ =gObjPalette
	mov sl, r3
_0802FB52:
	lsls r3, r6, #1
	adds r3, r3, r6
	mov r0, ip
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r0, r3, r7
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	ldr r1, _0802FC44 @ =gUnknown_080D6FF5+2
	adds r3, r3, r1
	ldrb r0, [r3]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	mov r3, r8
	adds r1, r3, r6
	lsls r1, r1, #1
	add r1, sl
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FB52
_0802FBA8:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0802FB2A
	ldr r3, _0802FC48 @ =gUnknown_030056A4
	ldr r0, [r3]
	cmp r0, #0
	beq _0802FC12
	movs r6, #0
	ldr r3, _0802FC38 @ =gUnknown_080D6FF5
	movs r0, #0xf2
	adds r0, r0, r3
	mov r8, r0
	ldr r7, _0802FC40 @ =gObjPalette
_0802FBC6:
	lsls r1, r6, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0xf0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	adds r0, #0xf1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	add r1, r8
	ldrb r0, [r1]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0xe0
	lsls r1, r1, #1
	adds r1, r1, r7
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FBC6
_0802FC12:
	ldr r1, _0802FC4C @ =gFlags
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	ldr r3, _0802FC4C @ =gFlags
	str r0, [r3]
	ldr r0, _0802FC50 @ =0x00003FCF
	ldr r1, [sp, #4]
	strh r0, [r1, #8]
	ldr r0, [sp, #4]
	bl NextTransitionFrame
	ldr r1, _0802FC54 @ =gWinRegs
	ldr r0, _0802FC58 @ =0x00001F3F
	strh r0, [r1, #8]
	movs r0, #0x1f
	b _0802FC70
	.align 2, 0
_0802FC34: .4byte gMultiplayerConnections
_0802FC38: .4byte gUnknown_080D6FF5
_0802FC3C: .4byte gMultiplayerCharacters
_0802FC40: .4byte gObjPalette
_0802FC44: .4byte gUnknown_080D6FF5+2
_0802FC48: .4byte gUnknown_030056A4
_0802FC4C: .4byte gFlags
_0802FC50: .4byte 0x00003FCF
_0802FC54: .4byte gWinRegs
_0802FC58: .4byte 0x00001F3F
_0802FC5C:
	ldr r0, _0802FCC0 @ =0x000030EF
	ldr r3, [sp, #4]
	strh r0, [r3, #8]
	ldr r0, [sp, #4]
	bl NextTransitionFrame
	ldr r1, _0802FCC4 @ =gWinRegs
	ldr r0, _0802FCC8 @ =0x00003F3F
	strh r0, [r1, #8]
	ldr r0, _0802FCCC @ =0x00001010
_0802FC70:
	strh r0, [r1, #0xa]
	ldr r5, _0802FCD0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1d
	bne _0802FC86
	ldr r2, _0802FCC4 @ =gWinRegs
	ldrh r1, [r2, #8]
	ldr r0, _0802FCD4 @ =0x0000FFF9
	ands r0, r1
	strh r0, [r2, #8]
_0802FC86:
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0xc7
	bls _0802FD0C
	ldr r4, _0802FCD8 @ =gBldRegs
	movs r0, #0
	strh r0, [r4, #4]
	strh r0, [r4]
	strh r0, [r4, #2]
	ldr r3, _0802FCC4 @ =gWinRegs
	ldr r2, _0802FCDC @ =0x0000F0F0
	strh r2, [r3]
	ldr r1, _0802FCE0 @ =0x0000A0A0
	strh r1, [r3, #4]
	strh r2, [r3, #2]
	strh r1, [r3, #6]
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1d
	beq _0802FCEC
	ldr r2, _0802FCE4 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0802FCE8 @ =0x00001FFF
	ands r0, r1
	strh r0, [r2]
	b _0802FD04
	.align 2, 0
_0802FCC0: .4byte 0x000030EF
_0802FCC4: .4byte gWinRegs
_0802FCC8: .4byte 0x00003F3F
_0802FCCC: .4byte 0x00001010
_0802FCD0: .4byte gCurrentLevel
_0802FCD4: .4byte 0x0000FFF9
_0802FCD8: .4byte gBldRegs
_0802FCDC: .4byte 0x0000F0F0
_0802FCE0: .4byte 0x0000A0A0
_0802FCE4: .4byte gDispCnt
_0802FCE8: .4byte 0x00001FFF
_0802FCEC:
	ldr r2, _0802FD1C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0802FD20 @ =0x000099FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0802FD24 @ =0x00003735
	strh r0, [r3, #0xa]
	ldr r0, _0802FD28 @ =0x00001346
	strh r0, [r4]
	ldr r0, _0802FD2C @ =0x00000404
	strh r0, [r4, #2]
	strh r0, [r4, #4]
_0802FD04:
	ldr r0, _0802FD30 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0802FD0C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FD1C: .4byte gDispCnt
_0802FD20: .4byte 0x000099FF
_0802FD24: .4byte 0x00003735
_0802FD28: .4byte 0x00001346
_0802FD2C: .4byte 0x00000404
_0802FD30: .4byte gCurTask

.syntax divided
