.include "asm/macros.inc"
.include "constants/constants.inc"

@ NOTE: The name of this module is not final!
@       Make sure to split and/or rename the module accordingly.

.arm
.syntax unified
.text

	thumb_func_start sub_802C9E4
sub_802C9E4: @ 0x0802C9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0802CA40 @ =sub_802CCE0
	movs r1, #0xbc
	lsls r1, r1, #2
	ldr r2, _0802CA44 @ =0x00002102
	ldr r3, _0802CA48 @ =sub_802D25C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _0802CA4C @ =gUnknown_03005B44
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	movs r5, #0
	movs r6, #0
	adds r0, #0xb2
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0802CA50 @ =sAnimsUiDigits
	mov sb, r2
	ldr r7, _0802CA54 @ =IWRAM_START + 0x94
	adds r4, r1, r7
	mov sl, r6
	ldr r0, _0802CA58 @ =IWRAM_START + 0x90
	adds r0, r1, r0
	str r0, [sp, #0xc]
_0802CA28:
	strh r6, [r4, #0x12]
	strh r6, [r4, #0x14]
	cmp r5, #0
	bne _0802CA5C
	movs r0, #0x18
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r4]
	ldr r3, [sp, #8]
	b _0802CA68
	.align 2, 0
_0802CA40: .4byte sub_802CCE0
_0802CA44: .4byte 0x00002102
_0802CA48: .4byte sub_802D25C
_0802CA4C: .4byte gUnknown_03005B44
_0802CA50: .4byte sAnimsUiDigits
_0802CA54: .4byte IWRAM_START + 0x94
_0802CA58: .4byte IWRAM_START + 0x90
_0802CA5C:
	adds r0, r3, #0
	adds r0, #0x94
	lsls r1, r5, #6
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4]
_0802CA68:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r2, r3, r1
	add r2, sl
	ldr r0, [r4]
	ldr r7, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r7
	lsrs r0, r0, #5
	ldr r1, _0802CCAC @ =0x000003FF
	ands r0, r1
	movs r7, #0xc0
	lsls r7, r7, #7
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4, #0x16]
	strh r6, [r4, #4]
	mov r1, sb
	ldrh r0, [r1]
	strh r0, [r4, #6]
	ldrh r0, [r1, #2]
	strb r0, [r4, #0x1c]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x18]
	movs r7, #1
	rsbs r7, r7, #0
	mov r2, sp
	strb r7, [r2, #4]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	mov r1, r8
	strb r6, [r1, #3]
	adds r2, r7, #0
	str r2, [r4, #0x24]
	movs r0, #0x80
	lsls r0, r0, #0xb
	str r0, [r4, #0xc]
	cmp r5, #0xb
	beq _0802CAC4
	ldr r0, [sp, #0xc]
	str r3, [sp, #8]
	bl sub_8004558
	ldr r3, [sp, #8]
_0802CAC4:
	movs r7, #0x30
	add r8, r7
	movs r0, #4
	add sb, r0
	adds r4, #0x30
	movs r1, #2
	add sl, r1
	ldr r2, [sp, #0xc]
	adds r2, #0x30
	str r2, [sp, #0xc]
	adds r5, #1
	cmp r5, #0xb
	bls _0802CA28
	ldr r4, _0802CCB0 @ =gGameMode
	mov sb, r4
	ldrb r0, [r4]
	cmp r0, #2
	bhi _0802CBA4
	adds r7, r3, #0
	adds r7, #0x60
	movs r5, #0
	mov r8, r5
	movs r6, #0
	movs r0, #6
	strh r0, [r7, #0x16]
	movs r0, #0x8e
	strh r0, [r7, #0x18]
	ldr r4, _0802CCB4 @ =sAnims1UpIcons
	ldr r5, _0802CCB8 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldr r2, _0802CCAC @ =0x000003FF
	ands r0, r2
	ldr r3, [sp, #8]
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r2, r3, r1
	strh r0, [r2]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x80
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r3, #0
	adds r1, #0x81
	ldrb r0, [r1]
	mov r4, sp
	ldrb r4, [r4, #4]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x82
	movs r5, #0x10
	strb r5, [r0]
	adds r1, #4
	mov r0, r8
	strb r0, [r1]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	mov r5, sb
	ldrb r0, [r5]
	cmp r0, #2
	bls _0802CB9A
	ldr r0, _0802CCBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
	lsls r0, r0, #0xc
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0802CB9A:
	adds r0, r7, #0
	str r3, [sp, #8]
	bl sub_8004558
	ldr r3, [sp, #8]
_0802CBA4:
	adds r7, r3, #0
	adds r7, #0x30
	movs r4, #0
	strh r4, [r7, #0x16]
	movs r0, #1
	strh r0, [r7, #0x18]
	movs r0, #0x20
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldr r2, _0802CCAC @ =0x000003FF
	mov sl, r2
	mov r5, sl
	ands r0, r5
	ldr r3, [sp, #8]
	ldr r2, _0802CCC0 @ =0x000002D6
	adds r1, r3, r2
	movs r5, #0xc0
	lsls r5, r5, #7
	mov sb, r5
	movs r5, #0
	mov r2, sb
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _0802CCC4 @ =0x00000466
	strh r0, [r7, #0xa]
	adds r0, r3, #0
	adds r0, #0x50
	strb r5, [r0]
	movs r0, #0xc0
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r3, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x52
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #8]
	bl sub_8004558
	movs r0, #7
	ldr r3, [sp, #8]
	strh r0, [r3, #0x16]
	movs r0, #9
	strh r0, [r3, #0x18]
	movs r0, #4
	str r3, [sp, #8]
	bl VramMalloc
	ldr r3, [sp, #8]
	str r0, [r3, #4]
	ldr r7, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r7
	lsrs r0, r0, #5
	mov r1, sl
	ands r0, r1
	ldr r2, _0802CCC8 @ =0x000002D2
	adds r1, r3, r2
	mov r7, sb
	orrs r0, r7
	strh r0, [r1]
	ldr r0, _0802CCCC @ =0x00000467
	strh r0, [r3, #0xa]
	adds r0, r3, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	adds r0, r6, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x22
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	strb r5, [r0]
	str r6, [r3, #0x28]
	str r4, [r3, #0x10]
	subs r2, #2
	adds r0, r3, r2
	strh r4, [r0]
	movs r5, #0
	ldr r0, _0802CCD0 @ =gObjPalette
	ldr r2, _0802CCD4 @ =sPalette_080D6ACE
	adds r1, r0, #0
	adds r1, #0xe0
_0802CC7C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0802CC7C
	ldr r2, _0802CCD8 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
	ldr r0, _0802CCDC @ =gUnknown_03005B44
	ldr r0, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802CCA8: .4byte 0xF9FF0000
_0802CCAC: .4byte 0x000003FF
_0802CCB0: .4byte gGameMode
_0802CCB4: .4byte sAnims1UpIcons
_0802CCB8: .4byte gSelectedCharacter
_0802CCBC: .4byte 0x04000128
_0802CCC0: .4byte 0x000002D6
_0802CCC4: .4byte 0x00000466
_0802CCC8: .4byte 0x000002D2
_0802CCCC: .4byte 0x00000467
_0802CCD0: .4byte gObjPalette
_0802CCD4: .4byte sPalette_080D6ACE
_0802CCD8: .4byte gFlags
_0802CCDC: .4byte gUnknown_03005B44

	thumb_func_start sub_802CCE0
sub_802CCE0: @ 0x0802CCE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0802CD34 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802CCFC
	b _0802D138
_0802CCFC:
	ldr r0, _0802CD38 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _0802CD3C @ =IWRAM_START + 0x90
	adds r0, r2, r0
	str r0, [sp]
	ldr r0, _0802CD40 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802CD1A
	b _0802CE6A
_0802CD1A:
	ldr r0, _0802CD44 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0802CD74
	ldr r1, _0802CD48 @ =IWRAM_START + 0x2A0
	adds r7, r2, r1
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0
	b _0802CD6C
	.align 2, 0
_0802CD34: .4byte gUnknown_03005424
_0802CD38: .4byte gCurTask
_0802CD3C: .4byte IWRAM_START + 0x90
_0802CD40: .4byte gGameMode
_0802CD44: .4byte gCurrentLevel
_0802CD48: .4byte IWRAM_START + 0x2A0
_0802CD4C:
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x1f
	strh r0, [r3]
	lsls r0, r7, #3
	adds r0, #4
	strh r0, [r3, #2]
	ldr r0, _0802CE18 @ =0x000002EE
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0802CD6C:
	ldr r0, _0802CE1C @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r7, r0
	blo _0802CD4C
_0802CD74:
	ldr r0, _0802CE20 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0802CD9A
	ldr r0, _0802CE24 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802CE28 @ =0x000087EF
	cmp r1, r0
	bls _0802CD9A
	adds r0, r1, #0
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _0802CD9A
	movs r0, #0x8b
	bl m4aSongNumStart
_0802CD9A:
	ldr r0, _0802CE2C @ =gUnknown_03005450
	ldr r6, [r0]
	ldr r0, _0802CE30 @ =999999
	cmp r6, r0
	ble _0802CDA6
	adds r6, r0, #0
_0802CDA6:
	movs r7, #0
	ldr r2, _0802CE34 @ =0x0000800E
	mov r8, r2
_0802CDAC:
	ldr r1, _0802CE38 @ =gUnknown_080D6AF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl Div
	adds r4, r0, #0
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r3]
	lsls r0, r7, #3
	adds r0, #0x1c
	strh r0, [r3, #2]
	lsls r1, r4, #1
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #4]
	adds r0, r4, #0
	muls r0, r5, r0
	subs r6, r6, r0
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bls _0802CDAC
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x8e
	strh r0, [r3]
	ldr r0, _0802CE3C @ =0x00004006
	strh r0, [r3, #2]
	movs r0, #0xb5
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	ldr r1, _0802CE40 @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802CE44
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _0802CE46
	.align 2, 0
_0802CE18: .4byte 0x000002EE
_0802CE1C: .4byte gUnknown_030054F4
_0802CE20: .4byte gLoadedSaveGame
_0802CE24: .4byte gUnknown_03005490
_0802CE28: .4byte 0x000087EF
_0802CE2C: .4byte gUnknown_03005450
_0802CE30: .4byte 999999
_0802CE34: .4byte 0x0000800E
_0802CE38: .4byte gUnknown_080D6AF0
_0802CE3C: .4byte 0x00004006
_0802CE40: .4byte gNumLives
_0802CE44:
	movs r7, #0
_0802CE46:
	cmp r7, #9
	bls _0802CE4C
	movs r7, #9
_0802CE4C:
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0802CF04 @ =0x0000808C
	strh r0, [r3]
	movs r0, #0x1e
	strh r0, [r3, #2]
	lsls r1, r7, #1
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #4]
_0802CE6A:
	movs r0, #4
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r3]
	ldr r0, _0802CF08 @ =0x0000C1FD
	strh r0, [r3, #2]
	ldr r0, _0802CF0C @ =0x000002D6
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r2, #0xb4
	lsls r2, r2, #2
	add r2, sb
	ldr r0, _0802CF10 @ =gPlayer
	ldrh r0, [r0, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r0, #0x40
	ldrh r1, [r2]
	adds r0, r0, r1
	ldr r1, _0802CF14 @ =0x000007FF
	ands r0, r1
	strh r0, [r2]
	lsrs r0, r0, #8
	mov r1, sb
	adds r1, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	bl sub_8004558
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #8
	strh r0, [r3]
	ldr r0, _0802CF18 @ =0x00004007
	strh r0, [r3, #2]
	ldr r0, _0802CF1C @ =0x000002D2
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	ldr r0, _0802CF20 @ =gRingCount
	ldrh r1, [r0]
	ldr r0, _0802CF24 @ =0x000003E7
	cmp r1, r0
	bls _0802CF28
	ldr r2, [sp]
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r7, r2, r0
	movs r4, #0x10
	strh r4, [r7, #0x18]
	movs r0, #0x20
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	strh r4, [r7, #0x18]
	movs r0, #0x28
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	strh r4, [r7, #0x18]
	movs r0, #0x30
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	b _0802CFDC
	.align 2, 0
_0802CF04: .4byte 0x0000808C
_0802CF08: .4byte 0x0000C1FD
_0802CF0C: .4byte 0x000002D6
_0802CF10: .4byte gPlayer
_0802CF14: .4byte 0x000007FF
_0802CF18: .4byte 0x00004007
_0802CF1C: .4byte 0x000002D2
_0802CF20: .4byte gRingCount
_0802CF24: .4byte 0x000003E7
_0802CF28:
	movs r2, #0
	mov sl, r2
	cmp r1, #0
	bne _0802CF42
	ldr r0, _0802D148 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802CF42
	movs r0, #0xe0
	lsls r0, r0, #7
	mov sl, r0
_0802CF42:
	ldr r7, _0802D14C @ =gRingCount
	ldrh r0, [r7]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #8
	mov r8, r1
	mov r2, r8
	strh r2, [r3]
	movs r0, #0x1c
	strh r0, [r3, #2]
	lsls r0, r4, #1
	movs r6, #0xb6
	lsls r6, r6, #2
	add r6, sb
	adds r0, r6, r0
	ldrh r1, [r0]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #0x64
	adds r5, r4, #0
	muls r5, r0, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r0, [r7]
	subs r0, r0, r5
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r3]
	movs r0, #0x24
	strh r0, [r3, #2]
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r1, [r0]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	ldrh r4, [r7]
	subs r4, r4, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r1, r8
	strh r1, [r3]
	movs r0, #0x2c
	strh r0, [r3, #2]
	lsls r4, r4, #1
	adds r6, r6, r4
	ldrh r0, [r6]
	mov r2, sl
	orrs r2, r0
	strh r2, [r3, #4]
_0802CFDC:
	ldr r7, _0802D150 @ =gUnknown_03005490
	ldr r0, _0802D154 @ =0x00008C9F
	ldr r6, [r7]
	cmp r6, r0
	bls _0802CFE8
	adds r6, r0, #0
_0802CFE8:
	ldr r0, _0802D158 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802CFF8
	b _0802D138
_0802CFF8:
	movs r0, #0xc0
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r5, #0x80
	lsls r5, r5, #8
	strh r5, [r3]
	movs r0, #0x63
	strh r0, [r3, #2]
	movs r4, #0xbb
	lsls r4, r4, #2
	add r4, sb
	ldrh r1, [r4]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	strh r5, [r3]
	movs r0, #0x7b
	strh r0, [r3, #2]
	ldrh r0, [r4]
	mov r1, sl
	orrs r1, r0
	strh r1, [r3, #4]
	adds r0, r6, #0
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	movs r1, #0x3c
	bl Div
	str r0, [sp, #4]
	ldr r1, _0802D15C @ =gUnknown_080D6BF8
	adds r2, r0, #0
	lsls r2, r2, #1
	mov sb, r2
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #1
	mov r8, r4
	add r1, r8
	movs r0, #0
	ldrsh r1, [r1, r0]
	subs r1, r6, r1
	ldr r0, _0802D160 @ =gUnknown_080D6C72
	add r0, sb
	ldrh r0, [r0]
	subs r5, r1, r0
	ldr r1, [r7]
	ldr r0, _0802D164 @ =0x00007E90
	movs r2, #0
	mov sl, r2
	cmp r1, r0
	bls _0802D084
	ldr r0, _0802D148 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sl, r0
_0802D084:
	ldr r4, _0802D168 @ =gMillisUnpackTable
	lsls r5, r5, #1
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [sp]
	adds r7, r1, r0
	movs r0, #0x88
	strh r0, [r7, #0x16]
	movs r6, #0x10
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	adds r5, r5, r4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [sp]
	adds r7, r1, r0
	movs r0, #0x90
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r4, _0802D16C @ =gSecondsTable
	mov r1, r8
	adds r0, r1, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x70
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	add r4, r8
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x78
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [sp, #4]
	add r0, sb
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x60
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
_0802D138:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D148: .4byte gUnknown_03005590
_0802D14C: .4byte gRingCount
_0802D150: .4byte gUnknown_03005490
_0802D154: .4byte 0x00008C9F
_0802D158: .4byte gUnknown_03005424
_0802D15C: .4byte gUnknown_080D6BF8
_0802D160: .4byte gUnknown_080D6C72
_0802D164: .4byte 0x00007E90
_0802D168: .4byte gMillisUnpackTable
_0802D16C: .4byte gSecondsTable

	thumb_func_start sub_802D170
sub_802D170: @ 0x0802D170
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _0802D1A8 @ =gUnknown_03005B44
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D1AC @ =IWRAM_START + 0x90
	adds r2, r2, r0
	mov sb, r2
	movs r0, #0xa
	mov r8, r0
	movs r7, #1
	cmp r4, #9
	bhi _0802D1B0
	movs r6, #1
	b _0802D1F2
	.align 2, 0
_0802D1A8: .4byte gUnknown_03005B44
_0802D1AC: .4byte IWRAM_START + 0x90
_0802D1B0:
	cmp r4, #0x63
	bhi _0802D1B8
	movs r6, #2
	b _0802D1F2
_0802D1B8:
	ldr r0, _0802D1C4 @ =0x000003E7
	cmp r4, r0
	bhi _0802D1C8
	movs r6, #3
	b _0802D1F2
	.align 2, 0
_0802D1C4: .4byte 0x000003E7
_0802D1C8:
	ldr r0, _0802D1D4 @ =0x0000270F
	cmp r4, r0
	bhi _0802D1D8
	movs r6, #4
	b _0802D1F2
	.align 2, 0
_0802D1D4: .4byte 0x0000270F
_0802D1D8:
	ldr r0, _0802D1E4 @ =0x0001869F
	cmp r4, r0
	bhi _0802D1E8
	movs r6, #5
	b _0802D1F2
	.align 2, 0
_0802D1E4: .4byte 0x0001869F
_0802D1E8:
	ldr r0, _0802D258 @ =0x000F423F
	movs r6, #7
	cmp r4, r0
	bhi _0802D1F2
	movs r6, #6
_0802D1F2:
	cmp r7, #0
	beq _0802D246
	cmp r6, #0
	beq _0802D246
	adds r5, r1, #0
_0802D1FC:
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, sb
	mov r2, r8
	muls r2, r7, r2
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r5, [r0, #0x16]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x25
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x10]
	bl sub_80051E8
	adds r4, r7, #0
	subs r5, #8
	subs r6, #1
	cmp r4, #0
	beq _0802D246
	cmp r6, #0
	bne _0802D1FC
_0802D246:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D258: .4byte 0x000F423F

	thumb_func_start sub_802D25C
sub_802D25C: @ 0x0802D25C
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	ldr r0, _0802D290 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802D280
	ldr r0, [r4, #0x64]
	bl VramFree
_0802D280:
	ldr r1, _0802D294 @ =IWRAM_START + 0x94
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D290: .4byte gGameMode
_0802D294: .4byte IWRAM_START + 0x94

@ Appears to be unused/debug proc
@ The initted Task does not have any code in it.
	thumb_func_start sub_802D298
sub_802D298: @ 0x0802D298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0802D2E4 @ =Task_802D4B4
	movs r1, #0x8d
	lsls r1, r1, #5
	movs r2, #0xe1
	lsls r2, r2, #8
	ldr r3, _0802D2E8 @ =TaskDestructor_802D4B8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _0802D2EC @ =IWRAM_START + 0x22
	adds r7, r1, r0
	ldr r2, _0802D2F0 @ =IWRAM_START+4
	adds r4, r1, r2
	ldr r0, _0802D2F4 @ =0x0000045F
	mov sl, r0
_0802D2D4:
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	cmp r6, #0
	bne _0802D2F8
	movs r0, #0xbc
	bl VramMalloc
	b _0802D300
	.align 2, 0
_0802D2E4: .4byte Task_802D4B4
_0802D2E8: .4byte TaskDestructor_802D4B8
_0802D2EC: .4byte IWRAM_START + 0x22
_0802D2F0: .4byte IWRAM_START+4
_0802D2F4: .4byte 0x0000045F
_0802D2F8:
	lsls r1, r6, #6
	mov r2, sb
	ldr r0, [r2, #4]
	adds r0, r0, r1
_0802D300:
	str r0, [r4]
	strh r5, [r4, #0x16]
	strh r5, [r4, #4]
	mov r0, sl
	strh r0, [r4, #6]
	adds r1, r6, #1
	strb r1, [r4, #0x1c]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	strb r5, [r7, #3]
	subs r0, #0x11
	str r0, [r4, #0x24]
	str r5, [r4, #0xc]
	adds r7, #0x30
	adds r4, #0x30
	adds r6, r1, #0
	cmp r6, #0x5d
	bls _0802D2D4
	ldr r0, _0802D344 @ =gUnknown_03005B48
	mov r1, r8
	str r1, [r0]
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D344: .4byte gUnknown_03005B48

	thumb_func_start sub_802D348
sub_802D348: @ 0x0802D348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	ldr r0, _0802D37C @ =gUnknown_03005B48
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D380 @ =IWRAM_START + 0x2D0
	adds r2, r2, r0
	mov sl, r2
	movs r0, #0xa
	mov sb, r0
	movs r2, #1
	mov r8, r2
	cmp r5, #9
	bhi _0802D384
	movs r7, #1
	b _0802D3C6
	.align 2, 0
_0802D37C: .4byte gUnknown_03005B48
_0802D380: .4byte IWRAM_START + 0x2D0
_0802D384:
	cmp r5, #0x63
	bhi _0802D38C
	movs r7, #2
	b _0802D3C6
_0802D38C:
	ldr r0, _0802D398 @ =0x000003E7
	cmp r5, r0
	bhi _0802D39C
	movs r7, #3
	b _0802D3C6
	.align 2, 0
_0802D398: .4byte 0x000003E7
_0802D39C:
	ldr r0, _0802D3A8 @ =0x0000270F
	cmp r5, r0
	bhi _0802D3AC
	movs r7, #4
	b _0802D3C6
	.align 2, 0
_0802D3A8: .4byte 0x0000270F
_0802D3AC:
	ldr r0, _0802D3B8 @ =0x0001869F
	cmp r5, r0
	bhi _0802D3BC
	movs r7, #5
	b _0802D3C6
	.align 2, 0
_0802D3B8: .4byte 0x0001869F
_0802D3BC:
	ldr r0, _0802D430 @ =0x000F423F
	movs r7, #7
	cmp r5, r0
	bhi _0802D3C6
	movs r7, #6
_0802D3C6:
	mov r0, r8
	cmp r0, #0
	beq _0802D41E
	cmp r7, #0
	beq _0802D41E
	adds r6, r1, #0
_0802D3D2:
	adds r0, r5, #0
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	add r4, sl
	mov r2, sb
	mov r1, r8
	muls r1, r2, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	subs r4, r4, r0
	strh r6, [r4, #0x16]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	mov r5, r8
	subs r6, #8
	subs r7, #1
	cmp r5, #0
	beq _0802D41E
	cmp r7, #0
	bne _0802D3D2
_0802D41E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D430: .4byte 0x000F423F

	thumb_func_start sub_802D434
sub_802D434: @ 0x0802D434
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _0802D4AC @ =gUnknown_03005B48
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0802D4B0 @ =0x2FFF9D0
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	ldrb r0, [r7]
	cmp r0, #0
	beq _0802D4A0
_0802D45C:
	adds r1, r7, r5
	ldrb r0, [r1]
	cmp r0, #0x20
	bls _0802D488
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #4
	add r4, r8
	strh r6, [r4, #0x16]
	mov r0, sb
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_0802D488:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802D45C
_0802D4A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4AC: .4byte gUnknown_03005B48
_0802D4B0: .4byte 0x2FFF9D0

@ Uhh... why is this Task empty?
	thumb_func_start Task_802D4B4
Task_802D4B4: @ 0x0802D4B4
	bx lr
	.align 2, 0

	thumb_func_start TaskDestructor_802D4B8
TaskDestructor_802D4B8: @ 0x0802D4B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

@; screen_transition.c
