.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _08050C44 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7, #8]
	mov ip, r0
	ldr r0, _08050C48 @ =gExtraBossTaskData
	ldr r0, [r0]
	mov sl, r0
	ldr r1, _08050C4C @ =0x03000018
	adds r1, r1, r4
	mov sb, r1      @ sb = s
	ldr r2, _08050C50 @ =0x0300000C
	adds r2, r4, r2
	str r2, [sp]
	ldr r5, _08050C54 @ =gSineTable
	mov r6, ip
	adds r6, #0x70
	ldrh r1, [r6]
	lsrs r1, r1, #6
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r2, [r7, #0x68]
	adds r3, r2, #0
	muls r3, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [r7, #0x6c]
	mov r8, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	subs r3, r3, r0
	asrs r3, r3, #8
	str r3, [r7, #0x60]
	ldrh r1, [r6]
	lsrs r1, r1, #6
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r2, r0, r2
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r2, r2, r0
	asrs r2, r2, #8
	str r2, [r7, #0x64]
	mov r1, ip
	ldr r0, [r1, #0x50]
	adds r3, r3, r0
	str r3, [r7, #0x50]
	ldr r0, [r1, #0x54]
	adds r2, r2, r0
	str r2, [r7, #0x54]
	ldr r2, _08050C58 @ =0x03000076
	adds r1, r4, r2
	ldrh r0, [r6]
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r3, _08050C5C @ =0x03000070
	adds r4, r4, r3
	strh r0, [r4]
	ldr r0, [r7, #0x50]
	asrs r1, r0, #8
	ldr r4, _08050C60 @ =gCamera
	movs r2, #0
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r7, #0x54]
	asrs r2, r0, #8
	movs r3, #2
	ldrsh r0, [r4, r3]
	subs r0, r2, r0
	str r0, [sp, #8]
	ldr r4, _08050C64 @ =gPlayer
	adds r4, #0x3e
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08050B62
	b _08050C8C
_08050B62:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r0, sb
	ldr r3, _08050C64 @ =gPlayer
	bl sub_800C0E0
	cmp r0, #0
	bne _08050B78
	b _08050C8C
_08050B78:
	mov r0, sl
	ldr r3, [r0, #0x58]
	movs r5, #0x80
	ands r3, r5
	movs r1, #0x69
	add r1, sl
	mov r8, r1
	adds r0, #0x6e
	str r0, [sp, #0xc]
	cmp r3, #0
	beq _08050B90
	b _08050CC2
_08050B90:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08050B9A
	b _08050CC2
_08050B9A:
	movs r0, #0x20
	strb r0, [r1]
	movs r0, #0
	strb r0, [r4]
	movs r0, #8
	ldr r2, _08050C64 @ =gPlayer
	strh r0, [r2, #0x1c]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r2, #8]
	strh r0, [r2, #0xc]
	mov r1, sl
	adds r1, #0x68
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _08050BC2
	b _08050CC2
_08050BC2:
	ldr r2, _08050C68 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050C6C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08050C70 @ =gBldRegs
	strh r3, [r0]
	ldr r2, _08050C74 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r0, #0xd
	ldr r4, [sp, #0xc]
	strb r0, [r4]
	mov r1, sl
	adds r1, #0x6f
	strb r0, [r1]
	subs r1, #0x23
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1]
	mov r1, sl
	ldr r0, [r1, #0x58]
	orrs r0, r5
	str r0, [r1, #0x58]
	mov r0, sl
	adds r0, #0x54
	strh r3, [r0]
	ldr r2, _08050C78 @ =gStageFlags
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08050C7C @ =gLevelScore
	ldr r6, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r6, r2
	str r0, [r1]
	ldr r4, _08050C80 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl Div
	cmp r5, r0
	beq _08050CC2
	ldr r0, _08050C84 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08050CC2
	ldr r1, _08050C88 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08050CC2
	.align 2, 0
_08050C44: .4byte gCurTask
_08050C48: .4byte gExtraBossTaskData
_08050C4C: .4byte 0x03000018
_08050C50: .4byte 0x0300000C
_08050C54: .4byte gSineTable
_08050C58: .4byte 0x03000076
_08050C5C: .4byte 0x03000070
_08050C60: .4byte gCamera
_08050C64: .4byte gPlayer
_08050C68: .4byte gDispCnt
_08050C6C: .4byte 0x0000DFFF
_08050C70: .4byte gBldRegs
_08050C74: .4byte gFlags
_08050C78: .4byte gStageFlags
_08050C7C: .4byte gLevelScore
_08050C80: .4byte 0x0000C350
_08050C84: .4byte gGameMode
_08050C88: .4byte gNumLives
_08050C8C:
	ldr r3, _08050DB0 @ =gPlayer
	movs r4, #0x1c
	ldrsh r0, [r3, r4]
	movs r1, #0x69
	add r1, sl
	mov r8, r1
	mov r2, sl
	adds r2, #0x6e
	str r2, [sp, #0xc]
	cmp r0, #0
	bne _08050CC2
	mov r3, sl
	ldr r0, [r3, #0x58]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08050CC2
	ldr r1, [r7, #0x50]
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	ldr r2, [r7, #0x54]
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	mov r0, sb
	ldr r3, _08050DB0 @ =gPlayer
	bl sub_800BFEC
_08050CC2:
	mov r4, sb
	ldr r0, [r4, #0x10]
	ldr r1, _08050DB4 @ =0xFFFFFE7F
	ands r0, r1
	str r0, [r4, #0x10]
	mov r1, sl
	ldr r0, [r1, #0x58]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08050CE2
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08050D46
_08050CE2:
	ldr r0, _08050DB0 @ =gPlayer
	ldr r3, [r0, #0x10]
	ands r3, r1
	cmp r3, #0
	bne _08050D00
	ldr r2, _08050DB8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050DBC @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08050DC0 @ =gWinRegs
	strh r3, [r0, #0xa]
	ldr r0, _08050DC4 @ =gBldRegs
	strh r3, [r0]
	strh r3, [r0, #4]
_08050D00:
	mov r3, r8
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _08050D46
	ldr r0, _08050DC8 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08050D3E
	mov r4, sb
	ldr r0, [r4, #0x10]
	adds r1, #0xfe
	orrs r0, r1
	str r0, [r4, #0x10]
	ldr r2, _08050DB8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08050DC0 @ =gWinRegs
	ldr r0, _08050DCC @ =0x00003F1F
	strh r0, [r1, #0xa]
	ldr r1, _08050DC4 @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	movs r0, #0x10
	strh r0, [r1, #4]
_08050D3E:
	mov r4, r8
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_08050D46:
	mov r0, sp
	ldrh r1, [r0, #4]
	ldr r0, [sp]
	strh r1, [r0, #6]
	mov r2, sp
	ldrh r2, [r2, #8]
	strh r2, [r0, #8]
	adds r0, r7, #0
	adds r0, #0x70
	ldrh r0, [r0]
	lsrs r0, r0, #6
	ldr r3, [sp]
	strh r0, [r3]
	mov r4, sb
	ldr r0, [r4, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r2, _08050DD0 @ =gOamMatrixIndex
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r4, #0x10]
	orrs r0, r1
	str r0, [r4, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	ldr r1, [sp]
	bl TransformSprite
	mov r0, sb
	bl DisplaySprite
	ldr r1, [sp, #0xc]
	ldrb r0, [r1]
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	bls _08050DA6
	b _08050F94
_08050DA6:
	lsls r0, r0, #2
	ldr r1, _08050DD4 @ =_08050DD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050DB0: .4byte gPlayer
_08050DB4: .4byte 0xFFFFFE7F
_08050DB8: .4byte gDispCnt
_08050DBC: .4byte 0x00007FFF
_08050DC0: .4byte gWinRegs
_08050DC4: .4byte gBldRegs
_08050DC8: .4byte gStageTime
_08050DCC: .4byte 0x00003F1F
_08050DD0: .4byte gOamMatrixIndex
_08050DD4: .4byte _08050DD8
_08050DD8: @ jump table
	.4byte _08050E0C @ case 0
	.4byte _08050E0C @ case 1
	.4byte _08050F94 @ case 2
	.4byte _08050F94 @ case 3
	.4byte _08050F94 @ case 4
	.4byte _08050F94 @ case 5
	.4byte _08050F94 @ case 6
	.4byte _08050F94 @ case 7
	.4byte _08050E1C @ case 8
	.4byte _08050E44 @ case 9
	.4byte _08050F30 @ case 10
	.4byte _08050F78 @ case 11
	.4byte _08050F82 @ case 12
_08050E0C:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #2
	movs r1, #0
	bl sub_804CFE0
	b _08050FA2
_08050E1C:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_804CFE0
	cmp r0, #0
	bne _08050E32
	b _08050FA2
_08050E32:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	lsls r1, r0
	mov r3, sl
	ldr r0, [r3, #0x5c]
	orrs r0, r1
	str r0, [r3, #0x5c]
	b _08050FA2
_08050E44:
	ldr r2, _08050EBC @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050EC0 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _08050E6E
	ldr r0, _08050EC4 @ =0x00000299
	mov r4, sb
	strh r0, [r4, #0xa]
	mov r1, sb
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x9b
	bl m4aSongNumStart
_08050E6E:
	ldr r0, [r7, #4]
	cmp r0, #0xa
	bne _08050E7A
	movs r0, #0x9b
	bl m4aSongNumStop
_08050E7A:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _08050ED0
	movs r1, #0
	ldrsh r0, [r7, r1]
	movs r1, #1
	lsls r1, r0
	mov r2, sl
	ldr r0, [r2, #0x5c]
	orrs r0, r1
	str r0, [r2, #0x5c]
	ldr r1, _08050EC8 @ =gBldRegs
	movs r3, #0
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08050ECC @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _08050EC4 @ =0x00000299
	mov r4, sb
	strh r0, [r4, #0xa]
	mov r0, sb
	adds r0, #0x20
	strb r3, [r0]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	b _08050FA2
	.align 2, 0
_08050EBC: .4byte gDispCnt
_08050EC0: .4byte 0x0000DFFF
_08050EC4: .4byte 0x00000299
_08050EC8: .4byte gBldRegs
_08050ECC: .4byte gFlags
_08050ED0:
	ldr r2, _08050F20 @ =gSineTable
	lsls r0, r0, #0xa
	asrs r0, r0, #6
	ldr r1, _08050F24 @ =0x000003FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r1, r1, r0
	lsls r1, r1, #0x15
	movs r0, #0xb8
	lsls r0, r0, #0x17
	adds r1, r1, r0
	lsrs r2, r1, #0x10
	ldr r0, _08050F28 @ =gPlayer
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08050F70
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r3, r7, #0
	bl sub_8052150
	cmp r0, #0
	bne _08050F70
	ldr r0, _08050F2C @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _08050F70
	.align 2, 0
_08050F20: .4byte gSineTable
_08050F24: .4byte 0x000003FF
_08050F28: .4byte gPlayer
_08050F2C: .4byte gFlags
_08050F30:
	ldr r1, [r7, #4]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08050F70
	lsls r0, r1, #0xa
	ldr r1, [r7, #0x50]
	subs r1, r1, r0
	ldr r3, _08050F5C @ =0xFFFF9C00
	adds r2, r1, r3
	ldr r0, _08050F60 @ =0xFFFFE000
	cmp r2, r0
	bge _08050F64
	movs r4, #0
	ldrsh r0, [r7, r4]
	movs r1, #1
	lsls r1, r0
	mov r2, sl
	ldr r0, [r2, #0x5c]
	orrs r0, r1
	str r0, [r2, #0x5c]
	b _08050F70
	.align 2, 0
_08050F5C: .4byte 0xFFFF9C00
_08050F60: .4byte 0xFFFFE000
_08050F64:
	mov r3, sl
	ldr r1, [r3, #0x64]
	lsls r1, r1, #8
	adds r0, r2, #0
	bl sub_804B570
_08050F70:
	ldr r0, [r7, #4]
	adds r0, #1
	str r0, [r7, #4]
	b _08050FA2
_08050F78:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0xc0
	lsls r1, r1, #5
	b _08050F8A
_08050F82:
	adds r0, r7, #0
	adds r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #6
_08050F8A:
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_804CFE0
	b _08050FA2
_08050F94:
	adds r0, r7, #0
	adds r0, #0x76
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl sub_804CFE0
_08050FA2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
