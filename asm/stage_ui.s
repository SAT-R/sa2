.include "asm/macros.inc"
.include "constants/constants.inc"

@ NOTE: The name of this module is not final!
@       Make sure to split and/or rename the module accordingly.

.section .rodata

    .global sAnimsUiDigits
sAnimsUiDigits:
    .2byte 1119, 16     @ '0'
    .2byte 1119, 17     @ '1'
    .2byte 1119, 18     @ '2'
    .2byte 1119, 19     @ '3'
    .2byte 1119, 20     @ '4'
    .2byte 1119, 21     @ '5'
    .2byte 1119, 22     @ '6'
    .2byte 1119, 23     @ '7'
    .2byte 1119, 24     @ '8'
    .2byte 1119, 25     @ '9'
    .2byte 1119, 26     @ ':'
    .2byte 1128,  0     @ Icon - Special Ring collected

    .global sAnims1UpIcons
sAnims1UpIcons:
    .2byte 4, 1125, 0   @ Sonic
    .2byte 4, 1125, 3   @ Cream
    .2byte 4, 1125, 1   @ Tails
    .2byte 4, 1125, 2   @ Knuckles
    .2byte 4, 1125, 4   @ Amy

    @ This palette might be used for the 1-Up icons
    .global sPalette_080D6ACE
sPalette_080D6ACE:
    .2byte 0x0180, 0x00DF, 0x009B, 0x0053, 0x000C, 0x7FFF, 0x5F39, 0x39CE
    .2byte 0x0421, 0x7EA6, 0x6DC8, 0x5548, 0x4506, 0x03BF, 0x02FF, 0x023F

.align 2 , 0
    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .4byte 100000
    .4byte  10000
    .4byte   1000
    .4byte    100
    .4byte     10
    .4byte      1

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

	thumb_func_start sub_802D4CC
sub_802D4CC: @ 0x0802D4CC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D504
	ldr r2, _0802D4FC @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D500 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D520
	.align 2, 0
_0802D4FC: .4byte gDispCnt
_0802D500: .4byte gWinRegs
_0802D504:
	ldr r2, _0802D54C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D550 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D520:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D554 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D558
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D562
	.align 2, 0
_0802D54C: .4byte gDispCnt
_0802D550: .4byte gWinRegs
_0802D554: .4byte gBldRegs
_0802D558:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D562:
	strh r0, [r2, #4]
	ldrh r4, [r3, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D572
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D572:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r3, #6]
	adds r0, r4, r0
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	ldr r1, _0802D58C @ =0x1FFF0000
	cmp r0, r1
	bgt _0802D590
	movs r0, #0
	b _0802D598
	.align 2, 0
_0802D58C: .4byte 0x1FFF0000
_0802D590:
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #1
_0802D598:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802D5A0
sub_802D5A0: @ 0x0802D5A0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D5D8
	ldr r2, _0802D5D0 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D5D4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D5F4
	.align 2, 0
_0802D5D0: .4byte gDispCnt
_0802D5D4: .4byte gWinRegs
_0802D5D8:
	ldr r2, _0802D620 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D624 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D5F4:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D628 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D62C
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D636
	.align 2, 0
_0802D620: .4byte gDispCnt
_0802D624: .4byte gWinRegs
_0802D628: .4byte gBldRegs
_0802D62C:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D636:
	strh r0, [r2, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D644
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D644:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_802D650
sub_802D650: @ 0x0802D650
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D6E4 @ =sub_802D6FC
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x3c
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r1, #0x38]
	ldr r0, _0802D6E8 @ =IWRAM_START + 0x3A
	adds r2, r3, r0
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D6EC @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D6F0 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D6F4 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D6F8 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D6E4: .4byte sub_802D6FC
_0802D6E8: .4byte IWRAM_START + 0x3A
_0802D6EC: .4byte 0x06010000
_0802D6F0: .4byte IWRAM_START + 0x20
_0802D6F4: .4byte IWRAM_START + 0x21
_0802D6F8: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D6FC
sub_802D6FC: @ 0x0802D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802D738 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r7, r6, #0
	ldr r5, [r6, #0x30]
	ldr r0, [r6, #0x34]
	mov r8, r0
	ldr r0, _0802D73C @ =IWRAM_START + 0x3A
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0802D740
	ldrh r0, [r6, #0x38]
	adds r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x12
	cmp r0, r1
	ble _0802D752
	movs r0, #0
	b _0802D750
	.align 2, 0
_0802D738: .4byte gCurTask
_0802D73C: .4byte IWRAM_START + 0x3A
_0802D740:
	ldrh r0, [r6, #0x38]
	subs r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	ldr r1, _0802D7D0 @ =0x01FF0000
	cmp r0, r1
	bgt _0802D752
	movs r0, #1
_0802D750:
	strb r0, [r2]
_0802D752:
	ldr r1, _0802D7D4 @ =gSineTable
	mov sb, r1
	ldrh r1, [r7, #0x38]
	ldr r4, _0802D7D8 @ =0x000003FF
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #3
	adds r5, r5, r0
	ldrh r0, [r7, #0x38]
	ands r4, r0
	lsls r4, r4, #1
	add r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #1
	add r8, r0
	str r5, [r7, #0x30]
	mov r0, r8
	str r0, [r7, #0x34]
	asrs r0, r5, #8
	ldr r3, _0802D7DC @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	mov r1, r8
	asrs r2, r1, #8
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r6, #0x18]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802D7C4
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D7C4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D7E4
_0802D7C4:
	ldr r0, _0802D7E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D7F0
	.align 2, 0
_0802D7D0: .4byte 0x01FF0000
_0802D7D4: .4byte gSineTable
_0802D7D8: .4byte 0x000003FF
_0802D7DC: .4byte gCamera
_0802D7E0: .4byte gCurTask
_0802D7E4:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0802D7F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802D7FC
sub_802D7FC: @ 0x0802D7FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D89C @ =sub_802D8B8
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #1
	strh r0, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r2, _0802D8A0 @ =IWRAM_START + 0x3C
	adds r0, r3, r2
	strb r6, [r0]
	ldr r0, _0802D8A4 @ =IWRAM_START + 0x3D
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D8A8 @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D8AC @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D8B0 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D8B4 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D89C: .4byte sub_802D8B8
_0802D8A0: .4byte IWRAM_START + 0x3C
_0802D8A4: .4byte IWRAM_START + 0x3D
_0802D8A8: .4byte 0x06010000
_0802D8AC: .4byte IWRAM_START + 0x20
_0802D8B0: .4byte IWRAM_START + 0x21
_0802D8B4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D8B8
sub_802D8B8: @ 0x0802D8B8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802D8F8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r5, r0, r1
	str r5, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802D8FC @ =IWRAM_START + 0x3D
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r2, r0, #0
	cmp r2, #0
	beq _0802D900
	subs r0, #1
	strb r0, [r3]
	b _0802D93A
	.align 2, 0
_0802D8F8: .4byte gCurTask
_0802D8FC: .4byte IWRAM_START + 0x3D
_0802D900:
	asrs r0, r5, #8
	asrs r1, r1, #8
	str r2, [sp]
	ldr r2, _0802D978 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r5, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802D93A
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r4, #0x3a]
	str r1, [r4, #0x34]
	ldr r0, _0802D97C @ =IWRAM_START + 0x3C
	adds r1, r6, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D936
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0x38]
_0802D936:
	movs r0, #1
	strb r0, [r1]
_0802D93A:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802D980 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802D96E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D96E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D988
_0802D96E:
	ldr r0, _0802D984 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D994
	.align 2, 0
_0802D978: .4byte sub_801EE64
_0802D97C: .4byte IWRAM_START + 0x3C
_0802D980: .4byte gCamera
_0802D984: .4byte gCurTask
_0802D988:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802D994:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802D99C
sub_802D99C: @ 0x0802D99C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802DA34 @ =sub_802DA4C
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	strh r5, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r0, _0802DA38 @ =IWRAM_START + 0x3C
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802DA3C @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802DA40 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802DA44 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802DA48 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA34: .4byte sub_802DA4C
_0802DA38: .4byte IWRAM_START + 0x3C
_0802DA3C: .4byte 0x06010000
_0802DA40: .4byte IWRAM_START + 0x20
_0802DA44: .4byte IWRAM_START + 0x21
_0802DA48: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802DA4C
sub_802DA4C: @ 0x0802DA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802DA8C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r6, r0, r1
	str r6, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802DA90 @ =IWRAM_START + 0x3C
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	beq _0802DA94
	subs r0, #1
	strb r0, [r2]
	b _0802DAB4
	.align 2, 0
_0802DA8C: .4byte gCurTask
_0802DA90: .4byte IWRAM_START + 0x3C
_0802DA94:
	asrs r0, r6, #8
	asrs r1, r1, #8
	str r5, [sp]
	ldr r2, _0802DAF4 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r6, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802DAB4
	strh r5, [r4, #0x3a]
	str r1, [r4, #0x34]
_0802DAB4:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802DAF8 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802DAE8
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802DAE8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802DB00
_0802DAE8:
	ldr r0, _0802DAFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802DB0C
	.align 2, 0
_0802DAF4: .4byte sub_801EE64
_0802DAF8: .4byte gCamera
_0802DAFC: .4byte gCurTask
_0802DB00:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802DB0C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

    @ Maybe called "SpawnTrappedAnimal"?
	thumb_func_start sub_802DB14
sub_802DB14: @ 0x0802DB14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0802DBB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0802DB34
	movs r2, #6
_0802DB34:
	ldr r3, _0802DBB4 @ =gAnimsTrappedAnimals
	ldr r4, _0802DBB8 @ =gUnknown_03005444
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [sp]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r1, r3, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r3, #8
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0802DB96
	movs r0, #0
	strb r0, [r4]
_0802DB96:
	ldr r0, _0802DBBC @ =gUnknown_080D6DD8
	lsls r1, r5, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov r0, sp
	bl _call_via_r1
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBB0: .4byte gCurrentLevel
_0802DBB4: .4byte gAnimsTrappedAnimals
_0802DBB8: .4byte gUnknown_03005444
_0802DBBC: .4byte gUnknown_080D6DD8

	thumb_func_start sub_802DBC0
sub_802DBC0: @ 0x0802DBC0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DC0C @ =gUnknown_03001884
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DC10 @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DCBE
	cmp r6, #1
	bhi _0802DC14
	lsls r0, r7, #1
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0xa0
	subs r0, r0, r7
	cmp r1, r0
	bge _0802DCBE
	movs r3, #0xf0
	adds r2, r0, #0
_0802DBF4:
	adds r4, #1
	strb r3, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0802DBF4
	b _0802DCBE
	.align 2, 0
_0802DC0C: .4byte gUnknown_03001884
_0802DC10: .4byte 0xFFFFFF00
_0802DC14:
	ldr r2, _0802DC44 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DC48
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DC4A
	.align 2, 0
_0802DC44: .4byte gSineTable
_0802DC48:
	mov r3, ip
_0802DC4A:
	cmp r3, #0
	bge _0802DC50
	rsbs r3, r3, #0
_0802DC50:
	ldr r0, _0802DC8C @ =0x000001FF
	cmp r6, r0
	bhi _0802DC90
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DCBE
_0802DC60:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DC72
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DC72:
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DC60
	b _0802DCBE
	.align 2, 0
_0802DC8C: .4byte 0x000001FF
_0802DC90:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DCBE
_0802DC9C:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DCAE
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DCAE:
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802DCC4 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DC9C
_0802DCBE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCC4: .4byte 0xFFFF0000

	thumb_func_start sub_802DCC8
sub_802DCC8: @ 0x0802DCC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DD08 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DD0C @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DDBC
	cmp r6, #1
	bhi _0802DD14
	lsls r0, r7, #1
	adds r4, r4, r0
	lsls r1, r7, #0x10
	cmp r1, #0
	beq _0802DDBC
	movs r2, #0xf0
_0802DCF6:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	ldr r3, _0802DD10 @ =0xFFFF0000
	adds r1, r1, r3
	asrs r0, r1, #0x10
	cmp r0, #0
	bgt _0802DCF6
	b _0802DDBC
	.align 2, 0
_0802DD08: .4byte gUnknown_03001884
_0802DD0C: .4byte 0xFFFFFF00
_0802DD10: .4byte 0xFFFF0000
_0802DD14:
	ldr r2, _0802DD80 @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DD46
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	cmp r3, #0
	bge _0802DD46
	rsbs r3, r3, #0
_0802DD46:
	ldr r0, _0802DD84 @ =0x000001FF
	cmp r6, r0
	bhi _0802DD8C
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DDBC
_0802DD58:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DD6A
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DD6A:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DD88 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DD58
	b _0802DDBC
	.align 2, 0
_0802DD80: .4byte gSineTable
_0802DD84: .4byte 0x000001FF
_0802DD88: .4byte 0xFFFF0000
_0802DD8C:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DDBC
_0802DD96:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DDA8
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DDA8:
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DD96
_0802DDBC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802DDC4
sub_802DDC4: @ 0x0802DDC4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DE1C @ =gUnknown_03001884
	ldr r4, [r0]
	movs r6, #0
	lsls r1, r1, #0x16
	lsrs r7, r1, #0x16
	ldr r1, _0802DE20 @ =0xFFFFFEFF
	adds r0, r7, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DDE4
	b _0802DF0A
_0802DDE4:
	ldr r3, _0802DE24 @ =0xFFFFFE00
	adds r0, r7, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DE28
	lsls r0, r5, #1
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0xa0
	subs r0, r0, r5
	cmp r1, r0
	blt _0802DE00
	b _0802DF0A
_0802DE00:
	movs r3, #0xf0
	adds r2, r0, #0
_0802DE04:
	adds r4, #1
	strb r3, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0802DE04
	b _0802DF0A
	.align 2, 0
_0802DE1C: .4byte gUnknown_03001884
_0802DE20: .4byte 0xFFFFFEFF
_0802DE24: .4byte 0xFFFFFE00
_0802DE28:
	ldr r2, _0802DE64 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r7, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DE50
	rsbs r3, r3, #0
_0802DE50:
	cmp r1, #0
	bge _0802DE56
	rsbs r1, r1, #0
_0802DE56:
	cmp r3, #0
	beq _0802DE68
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DE6A
	.align 2, 0
_0802DE64: .4byte gSineTable
_0802DE68:
	mov r3, ip
_0802DE6A:
	ldr r0, _0802DEA8 @ =0x000001FF
	cmp r7, r0
	bhi _0802DEAC
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802DF0A
	movs r2, #0xf0
_0802DE7C:
	adds r6, r6, r3
	lsls r0, r6, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DE8E
	movs r3, #0
	movs r6, #0xf0
	lsls r6, r6, #8
	movs r0, #0xf0
_0802DE8E:
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DE7C
	b _0802DF0A
	.align 2, 0
_0802DEA8: .4byte 0x000001FF
_0802DEAC:
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0xa0
	ldr r0, _0802DF10 @ =gUnknown_03001884
	mov ip, r0
	lsls r7, r5, #1
	cmp r1, r5
	ble _0802DED4
	movs r2, #0xf0
_0802DEC0:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DF14 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bgt _0802DEC0
_0802DED4:
	mov r0, ip
	ldr r4, [r0]
	adds r4, r4, r7
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DF0A
	movs r2, #0xf0
_0802DEE4:
	adds r6, r6, r3
	lsls r0, r6, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DEF6
	movs r3, #0
	movs r6, #0xf0
	lsls r6, r6, #8
	movs r0, #0xf0
_0802DEF6:
	subs r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DF14 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DEE4
_0802DF0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF10: .4byte gUnknown_03001884
_0802DF14: .4byte 0xFFFF0000

	thumb_func_start sub_802DF18
sub_802DF18: @ 0x0802DF18
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DF64 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r7, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DF68 @ =0xFFFFFEFF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DF38
	b _0802E03A
_0802DF38:
	ldr r3, _0802DF6C @ =0xFFFFFE00
	adds r0, r6, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DF70
	movs r1, #0
	cmp r1, r5
	bge _0802E03A
	movs r2, #0xf0
_0802DF4C:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DF4C
	b _0802E03A
	.align 2, 0
_0802DF64: .4byte gUnknown_03001884
_0802DF68: .4byte 0xFFFFFEFF
_0802DF6C: .4byte 0xFFFFFE00
_0802DF70:
	ldr r2, _0802DFAC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DF98
	rsbs r3, r3, #0
_0802DF98:
	cmp r1, #0
	bge _0802DF9E
	rsbs r1, r1, #0
_0802DF9E:
	cmp r3, #0
	beq _0802DFB0
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DFB2
	.align 2, 0
_0802DFAC: .4byte gSineTable
_0802DFB0:
	mov r3, ip
_0802DFB2:
	ldr r0, _0802E004 @ =0x000001FF
	cmp r6, r0
	bhi _0802E008
	movs r1, #0
	cmp r1, r5
	bge _0802DFD6
	movs r2, #0xf0
_0802DFC0:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DFC0
_0802DFD6:
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802E03A
	movs r2, #0xf0
_0802DFDE:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bhi _0802E03A
	adds r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DFDE
	b _0802E03A
	.align 2, 0
_0802E004: .4byte 0x000001FF
_0802E008:
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802E03A
	movs r2, #0xf0
_0802E016:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802E028
	movs r3, #0
	movs r7, #0xf0
	lsls r7, r7, #8
	movs r0, #0xf0
_0802E028:
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802E040 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802E016
_0802E03A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E040: .4byte 0xFFFF0000

	thumb_func_start sub_802E044
sub_802E044: @ 0x0802E044
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0802E08C @ =gUnknown_03001884
	ldr r6, [r0]
	lsls r1, r1, #0x16
	lsrs r5, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r5, r0
	bls _0802E0CC
	ldr r2, _0802E090 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E096
	cmp r1, #0
	beq _0802E094
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E096
	.align 2, 0
_0802E08C: .4byte gUnknown_03001884
_0802E090: .4byte gSineTable
_0802E094:
	adds r3, r7, #0
_0802E096:
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r6, r6, r0
	movs r1, #0
_0802E09E:
	subs r4, r4, r3
	asrs r0, r4, #8
	cmp r0, #0xf0
	ble _0802E0AE
	movs r3, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r0, #0xf0
_0802E0AE:
	cmp r0, #0
	bge _0802E0B8
	movs r3, #0
	movs r4, #0
	movs r0, #0
_0802E0B8:
	strb r0, [r6]
	subs r6, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E09E
_0802E0CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E0D4
sub_802E0D4: @ 0x0802E0D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E11C @ =gUnknown_03001884
	ldr r4, [r0]
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r6, r0
	bls _0802E15E
	ldr r2, _0802E120 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E126
	cmp r1, #0
	beq _0802E124
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E126
	.align 2, 0
_0802E11C: .4byte gUnknown_03001884
_0802E120: .4byte gSineTable
_0802E124:
	adds r3, r7, #0
_0802E126:
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0
_0802E12E:
	subs r5, r5, r3
	asrs r0, r5, #8
	cmp r0, #0xf0
	ble _0802E13E
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802E13E:
	cmp r0, #0
	bge _0802E148
	movs r3, #0
	movs r5, #0
	movs r0, #0
_0802E148:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E12E
_0802E15E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E164
sub_802E164: @ 0x0802E164
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0802E1AC @ =gUnknown_03001884
	ldr r6, [r0]
	lsls r1, r1, #0x16
	lsrs r5, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r5, r0
	bhi _0802E1E6
	ldr r2, _0802E1B0 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E1B6
	cmp r1, #0
	beq _0802E1B4
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E1B6
	.align 2, 0
_0802E1AC: .4byte gUnknown_03001884
_0802E1B0: .4byte gSineTable
_0802E1B4:
	adds r3, r7, #0
_0802E1B6:
	movs r1, #0
_0802E1B8:
	adds r4, r4, r3
	asrs r0, r4, #8
	cmp r0, #0xf0
	ble _0802E1C8
	movs r3, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r0, #0xf0
_0802E1C8:
	cmp r0, #0
	bge _0802E1D2
	movs r3, #0
	movs r4, #0
	movs r0, #0
_0802E1D2:
	strb r0, [r6]
	adds r6, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E1B8
_0802E1E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E1EC
sub_802E1EC: @ 0x0802E1EC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E234 @ =gUnknown_03001884
	ldr r4, [r0]
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r6, r0
	bhi _0802E270
	ldr r2, _0802E238 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E23E
	cmp r1, #0
	beq _0802E23C
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E23E
	.align 2, 0
_0802E234: .4byte gUnknown_03001884
_0802E238: .4byte gSineTable
_0802E23C:
	adds r3, r7, #0
_0802E23E:
	movs r1, #0
_0802E240:
	adds r5, r5, r3
	asrs r0, r5, #8
	cmp r0, #0xf0
	ble _0802E250
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802E250:
	cmp r0, #0
	bge _0802E25A
	movs r3, #0
	movs r5, #0
	movs r0, #0
_0802E25A:
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E240
_0802E270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E278
sub_802E278: @ 0x0802E278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r3, #0
	cmp r3, r5
	bge _0802E2B6
	mov r6, sp
	adds r6, #2
_0802E294:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E294
_0802E2B6:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E374
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E2C6:
	ldr r0, _0802E310 @ =gUnknown_03001884
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E314
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E320
	.align 2, 0
_0802E310: .4byte gUnknown_03001884
_0802E314:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E320:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E366
_0802E340:
	asrs r0, r6, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	ble _0802E34C
	movs r0, #0xf0
_0802E34C:
	strb r0, [r5]
	adds r5, #2
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E340
_0802E366:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E2C6
_0802E374:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E384
sub_802E384: @ 0x0802E384
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #0
	cmp r3, r5
	bge _0802E3C2
	mov r6, sp
	adds r6, #2
_0802E3A0:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E3A0
_0802E3C2:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E48A
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E3D2:
	ldr r0, _0802E41C @ =gUnknown_03001884
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E420
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E42C
	.align 2, 0
_0802E41C: .4byte gUnknown_03001884
_0802E420:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E42C:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E47C
_0802E44C:
	lsls r0, r6, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E458
	movs r1, #0xf0
_0802E458:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E460
	movs r1, #0
_0802E460:
	adds r5, #1
	strb r1, [r5]
	adds r5, #1
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E44C
_0802E47C:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E3D2
_0802E48A:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E49C
sub_802E49C: @ 0x0802E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x12c
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	cmp r1, #8
	bls _0802E4B6
	b _0802E774
_0802E4B6:
	cmp r1, #2
	bhi _0802E4BC
	b _0802E774
_0802E4BC:
	movs r4, #0
	movs r0, #2
	add r0, sp
	mov r8, r0
	subs r1, #1
	str r1, [sp, #0x118]
	mov r2, sp
	adds r2, #0x60
	str r2, [sp, #0x10c]
	mov r3, sp
	adds r3, #0x64
	str r3, [sp, #0x110]
	mov r5, sb
	subs r5, #2
	str r5, [sp, #0x114]
	mov r7, sp
	adds r7, #0x20
	str r7, [sp, #0x120]
	mov r0, sp
	adds r0, #0x40
	str r0, [sp, #0x124]
	cmp r4, sb
	bhs _0802E508
	mov r5, r8
_0802E4EC:
	lsls r1, r4, #2
	mov r2, sp
	adds r3, r2, r1
	adds r2, r6, r1
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r5, r1
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E4EC
_0802E508:
	movs r4, #0
	ldr r3, [sp, #0x118]
	cmp r4, r3
	bge _0802E588
_0802E510:
	adds r1, r4, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	str r1, [sp, #0x11c]
	cmp r5, sb
	bhs _0802E57C
	lsls r4, r4, #2
	mov ip, r4
	mov r4, r8
	str r4, [sp, #0x108]
	mov r7, r8
	add r7, ip
	str r7, [sp, #0x128]
	mov r0, sp
	add r0, ip
	mov sl, r0
_0802E530:
	lsls r0, r5, #2
	ldr r1, [sp, #0x108]
	adds r6, r1, r0
	ldr r2, [sp, #0x128]
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r7, #0
	ldrsh r1, [r6, r7]
	cmp r3, r1
	blt _0802E572
	mov r4, sp
	add r4, ip
	mov r7, sp
	adds r2, r7, r0
	cmp r3, r1
	bne _0802E55E
	mov r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	blt _0802E572
_0802E55E:
	ldrh r1, [r4]
	ldrh r0, [r2]
	strh r0, [r4]
	strh r1, [r2]
	ldr r0, [sp, #0x128]
	ldrh r1, [r0]
	ldrh r0, [r6]
	ldr r2, [sp, #0x128]
	strh r0, [r2]
	strh r1, [r6]
_0802E572:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sb
	blo _0802E530
_0802E57C:
	ldr r3, [sp, #0x11c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x118]
	cmp r4, r5
	blt _0802E510
_0802E588:
	ldr r7, [sp, #0x10c]
	mov r0, sp
	ldrh r0, [r0]
	adds r1, r7, #0
	strh r0, [r1]
	mov r0, sp
	ldrh r1, [r0, #2]
	ldr r2, [sp, #0x10c]
	strh r1, [r2, #2]
	movs r4, #1
	cmp r4, sb
	bhs _0802E5EE
	mov r6, r8
	adds r0, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0802E5EE
_0802E5B0:
	adds r2, r7, #0
	lsls r3, r4, #2
	mov r5, sp
	adds r0, r5, r3
	movs r5, #0
	ldrsh r1, [r2, r5]
	ldrh r5, [r0]
	mov sl, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _0802E5D2
	mov r0, sl
	strh r0, [r2]
	adds r0, r6, r3
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E5D2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	bhs _0802E5EE
	lsls r0, r4, #2
	mov r6, r8
	add r0, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	beq _0802E5B0
_0802E5EE:
	ldr r6, [sp, #0x110]
	ldr r7, [sp, #0x118]
	lsls r1, r7, #2
	mov r2, sp
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r6]
	mov sl, r8
	add r1, r8
	ldrh r1, [r1]
	ldr r3, [sp, #0x110]
	strh r1, [r3, #2]
	ldr r4, [sp, #0x114]
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov r7, r8
	adds r0, r7, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	b _0802E650
_0802E61C:
	adds r2, r6, #0
	mov r3, sp
	adds r0, r3, r5
	movs r7, #0
	ldrsh r1, [r2, r7]
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _0802E63A
	strh r3, [r2]
	mov r1, sl
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E63A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov sl, r8
	mov r3, r8
	adds r0, r3, r5
	movs r7, #2
	ldrsh r1, [r2, r7]
_0802E650:
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0802E61C
_0802E658:
	ldr r3, [sp, #0x10c]
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r5, r2, #8
	ldr r7, [sp, #0x110]
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	cmp r1, #0
	beq _0802E682
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, #0x80
	bl Div
	adds r2, r0, #0
	b _0802E68C
_0802E682:
	ldr r4, [sp, #0x110]
	movs r7, #0
	ldrsh r0, [r4, r7]
	subs r0, r0, r2
	lsls r2, r0, #8
_0802E68C:
	ldr r1, [sp, #0x10c]
	ldrh r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x110]
	movs r7, #2
	ldrsh r0, [r3, r7]
	cmp r4, r0
	bgt _0802E6C8
	add r6, sp, #0x68
_0802E6A0:
	lsls r0, r5, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E6AC
	movs r1, #0xf0
_0802E6AC:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E6B4
	movs r1, #0
_0802E6B4:
	adds r0, r6, r4
	strb r1, [r0]
	adds r5, r5, r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r4, r0
	ble _0802E6A0
_0802E6C8:
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E716
	add r2, sp, #0x68
	mov ip, r2
	ldr r3, [sp, #0x120]
	mov sl, r3
	mov r7, r8
_0802E6DA:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bgt _0802E70C
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x22
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E70C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E6DA
_0802E716:
	ldr r0, [sp, #0x120]
	adds r1, r5, #0
	bl sub_802E278
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E76C
	add r1, sp, #0x68
	mov ip, r1
	ldr r2, [sp, #0x124]
	mov sl, r2
	mov r7, r8
_0802E730:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r3, #0
	ldrsh r0, [r6, r3]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	blt _0802E762
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x42
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E762:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E730
_0802E76C:
	ldr r0, [sp, #0x124]
	adds r1, r5, #0
	bl sub_802E384
_0802E774:
	add sp, #0x12c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E784
sub_802E784: @ 0x0802E784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x24]
	lsls r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x28]
	movs r0, #0
	mov sl, r0
	ldr r1, _0802E80C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802E810 @ =gUnknown_03002878
	ldr r0, _0802E814 @ =0x04000040
	str r0, [r1]
	ldr r2, _0802E818 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	lsrs r1, r3, #0x10
	mov ip, r1
	asrs r2, r3, #0x10
	ldr r5, _0802E81C @ =0xFFFF0000
	adds r3, r3, r5
	lsrs r3, r3, #0x10
	cmp r3, #0xee
	bls _0802E7DC
	b _0802EABC
_0802E7DC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x9f
	ble _0802E7E8
	b _0802EABC
_0802E7E8:
	cmp r2, #0
	bgt _0802E7EE
	b _0802EABC
_0802E7EE:
	ldr r0, _0802E820 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802E824 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802E830
	add r1, sp, #0x1c
	mov r6, sl
	strh r6, [r1]
	ldr r0, _0802E828 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802E82C @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802E848
	.align 2, 0
_0802E80C: .4byte gUnknown_03002A80
_0802E810: .4byte gUnknown_03002878
_0802E814: .4byte 0x04000040
_0802E818: .4byte gFlags
_0802E81C: .4byte 0xFFFF0000
_0802E820: .4byte gUnknown_03001884
_0802E824: .4byte gUnknown_03001B60
_0802E828: .4byte 0x040000D4
_0802E82C: .4byte 0x81000140
_0802E830:
	add r0, sp, #0x1c
	mov r1, sl
	strh r1, [r0]
	ldr r1, _0802E938 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802E93C @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802E848:
	ldr r4, [sp, #0x20]
	ldr r6, _0802E940 @ =0xFFFFFF00
	adds r1, r4, r6
	ldr r2, _0802E944 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldr r4, _0802E948 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	str r3, [sp, #0x34]
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r6, r0, #0xf
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r8, r0
	mov r0, r8
	muls r0, r7, r0
	asrs r7, r0, #0xf
	mov r1, sp
	mov r0, ip
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	adds r0, r3, r6
	strh r0, [r1, #4]
	asrs r5, r5, #0x10
	adds r0, r5, r7
	strh r0, [r1, #6]
	subs r0, r3, r6
	strh r0, [r1]
	subs r0, r5, r7
	strh r0, [r1, #2]
	ldr r1, [sp, #0x20]
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r6, [r2, r0]
	mov ip, r6
	ldr r1, [sp, #0x28]
	mov r0, ip
	muls r0, r1, r0
	asrs r6, r0, #0xe
	ldr r0, [sp, #0x20]
	lsls r2, r0, #1
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r4, [sp, #0x28]
	muls r0, r4, r0
	asrs r7, r0, #0xe
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #4]
	adds r0, r0, r6
	strh r0, [r1, #4]
	mov r0, sp
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	strh r0, [r1, #6]
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r0, r0, r7
	strh r0, [r1, #2]
	mov r0, sp
	ldrh r0, [r0, #4]
	str r0, [sp, #0x2c]
	mov r0, sp
	ldrh r0, [r0, #6]
	str r0, [sp, #0x30]
	mov r0, sp
	ldrh r4, [r0]
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r6, [sp, #0x34]
	ldr r1, [sp, #0x24]
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r6, r0, #0xf
	mov r0, r8
	muls r0, r1, r0
	asrs r7, r0, #0xf
	mov r1, sp
	adds r0, r3, r6
	strh r0, [r1, #8]
	adds r0, r5, r7
	strh r0, [r1, #0xa]
	mov r0, sp
	subs r3, r3, r6
	strh r3, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	mov r3, ip
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r6, r0, #2
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x16
	cmp r6, #0
	beq _0802E950
	cmp r7, #0
	beq _0802E94C
	adds r0, r6, #0
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	b _0802E950
	.align 2, 0
_0802E938: .4byte 0x040000D4
_0802E93C: .4byte 0x81000140
_0802E940: .4byte 0xFFFFFF00
_0802E944: .4byte 0x000003FF
_0802E948: .4byte gSineTable
_0802E94C:
	movs r6, #0xf0
	lsls r6, r6, #8
_0802E950:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #0x10
	asrs r1, r0, #8
	ldr r0, _0802E968 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802E996
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r5, sb
	lsls r3, r5, #0x10
	b _0802E972
	.align 2, 0
_0802E968: .4byte 0x000001FF
_0802E96C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E972:
	cmp r2, #0x9e
	bhi _0802E9C0
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E98A
	cmp r0, #0
	bge _0802E96C
	b _0802E9BC
_0802E98A:
	movs r1, #0xf0
	mov sl, r1
	b _0802E9C0
_0802E990:
	movs r5, #0xf0
	mov sl, r5
	b _0802E9C0
_0802E996:
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r0, sb
	lsls r3, r0, #0x10
	b _0802E9A6
_0802E9A0:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E9A6:
	cmp r2, #0
	beq _0802E9C0
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E990
	cmp r0, #0
	bge _0802E9A0
_0802E9BC:
	movs r0, #0
	mov sl, r0
_0802E9C0:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	asrs r1, r4, #8
	ldr r0, _0802EA08 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802EA18
	lsrs r2, r3, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	blt _0802EA30
_0802E9EA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	bge _0802E9EA
	b _0802EA52
	.align 2, 0
_0802EA08: .4byte 0x000001FF
_0802EA0C:
	movs r0, #0xf0
	mov sl, r0
	b _0802EA56
_0802EA12:
	movs r1, #0xf0
	mov sl, r1
	b _0802EA56
_0802EA18:
	lsrs r2, r3, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA30:
	movs r4, #0
	mov sl, r4
	b _0802EA56
_0802EA36:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA52:
	movs r6, #0
	mov sl, r6
_0802EA56:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	mov r1, sp
	ldrh r6, [r0, #0x14]
	movs r3, #0x14
	ldrsh r4, [r0, r3]
	ldrh r5, [r1, #0x10]
	movs r0, #0x10
	ldrsh r3, [r1, r0]
	cmp r4, r3
	beq _0802EAB2
	mov r0, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0802EAB2
	cmp r3, #0
	bne _0802EA8C
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA8C:
	cmp r4, #0
	beq _0802EA9E
	cmp r3, #0xf0
	bne _0802EA9E
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA9E:
	mov r0, sp
	strh r6, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x12]
_0802EAA6:
	strh r0, [r1, #0x1a]
	mov r0, sp
	movs r1, #7
	bl sub_802E49C
	b _0802ED86
_0802EAB2:
	mov r0, sp
	movs r1, #6
	bl sub_802E49C
	b _0802ED86
_0802EABC:
	lsrs r0, r7, #1
	adds r2, r0, #0
	mov r8, r2
	cmp r2, #0
	bne _0802EB14
	ldr r0, _0802EAE4 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r3, _0802EAE8 @ =gUnknown_03001B60
	cmp r0, r3
	bne _0802EAF4
	add r1, sp, #0x1c
	strh r2, [r1]
	ldr r0, _0802EAEC @ =0x040000D4
	str r1, [r0]
	str r3, [r0, #4]
	ldr r1, _0802EAF0 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED86
	.align 2, 0
_0802EAE4: .4byte gUnknown_03001884
_0802EAE8: .4byte gUnknown_03001B60
_0802EAEC: .4byte 0x040000D4
_0802EAF0: .4byte 0x81000140
_0802EAF4:
	add r0, sp, #0x1c
	strh r2, [r0]
	ldr r1, _0802EB0C @ =0x040000D4
	str r0, [r1]
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r0, r3, r4
	str r0, [r1, #4]
	ldr r0, _0802EB10 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0802ED86
	.align 2, 0
_0802EB0C: .4byte 0x040000D4
_0802EB10: .4byte 0x81000140
_0802EB14:
	ldr r5, [sp, #0x20]
	ldr r6, _0802EB6C @ =0xFFFFFEFF
	adds r0, r5, r6
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	lsls r5, r4, #0x10
	cmp r0, r1
	bhi _0802EBE8
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0xef
	ble _0802EBE8
	ldr r1, _0802EB70 @ =gSineTable
	ldr r3, [sp, #0x20]
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r2, #0
	subs r0, #0xf0
	muls r0, r1, r0
	asrs r7, r0, #0xe
	asrs r0, r5, #0x10
	adds r7, r7, r0
	subs r0, r7, #1
	cmp r0, #0x9e
	bhi _0802EBE8
	movs r3, #0xf1
	ldr r0, _0802EB74 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802EB78 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EB84
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EB7C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EB80 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EB9A
	.align 2, 0
_0802EB6C: .4byte 0xFFFFFEFF
_0802EB70: .4byte gSineTable
_0802EB74: .4byte gUnknown_03001884
_0802EB78: .4byte gUnknown_03001B60
_0802EB7C: .4byte 0x040000D4
_0802EB80: .4byte 0x81000140
_0802EB84:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EBAC @ =0x040000D4
	str r0, [r1]
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r0, r2, r5
	str r0, [r1, #4]
	ldr r0, _0802EBB0 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EB9A:
	mov r6, r8
	subs r0, r7, r6
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBB4
	movs r3, #0
	b _0802EBBA
	.align 2, 0
_0802EBAC: .4byte 0x040000D4
_0802EBB0: .4byte 0x81000140
_0802EBB4:
	cmp r0, #0xa0
	ble _0802EBBA
	movs r3, #0xa0
_0802EBBA:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DF18
	mov r1, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBD6
	movs r3, #0
	b _0802EBDC
_0802EBD6:
	cmp r0, #0xa0
	ble _0802EBDC
	movs r3, #0xa0
_0802EBDC:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DDC4
	b _0802ED86
_0802EBE8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bls _0802ECC2
	asrs r2, r5, #0x10
	cmp r2, #0x9f
	ble _0802ECB8
	ldr r1, _0802EC40 @ =gSineTable
	ldr r3, [sp, #0x20]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r3, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, r2, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ECB8
	movs r3, #0xf1
	ldr r0, _0802EC44 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802EC48 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EC54
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EC4C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EC50 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EC6A
	.align 2, 0
_0802EC40: .4byte gSineTable
_0802EC44: .4byte gUnknown_03001884
_0802EC48: .4byte gUnknown_03001B60
_0802EC4C: .4byte 0x040000D4
_0802EC50: .4byte 0x81000140
_0802EC54:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EC7C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802EC80 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EC6A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EC84
	movs r4, #0
	b _0802EC8A
	.align 2, 0
_0802EC7C: .4byte 0x040000D4
_0802EC80: .4byte 0x81000140
_0802EC84:
	cmp r0, #0xf0
	ble _0802EC8A
	movs r4, #0xf0
_0802EC8A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E0D4
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ECA6
	movs r4, #0
	b _0802ECAC
_0802ECA6:
	cmp r0, #0xf0
	ble _0802ECAC
	movs r4, #0xf0
_0802ECAC:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E044
	b _0802ED86
_0802ECB8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r6, [sp, #0x20]
	cmp r6, r0
	bhi _0802ED86
_0802ECC2:
	asrs r5, r5, #0x10
	cmp r5, #0
	bge _0802ED86
	ldr r1, _0802ED10 @ =gSineTable
	ldr r2, [sp, #0x20]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r5, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r5, ip
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ED86
	movs r3, #0xf1
	ldr r0, _0802ED14 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802ED18 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802ED24
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802ED1C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802ED20 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED3A
	.align 2, 0
_0802ED10: .4byte gSineTable
_0802ED14: .4byte gUnknown_03001884
_0802ED18: .4byte gUnknown_03001B60
_0802ED1C: .4byte 0x040000D4
_0802ED20: .4byte 0x81000140
_0802ED24:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802ED4C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802ED50 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802ED3A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED54
	movs r4, #0
	b _0802ED5A
	.align 2, 0
_0802ED4C: .4byte 0x040000D4
_0802ED50: .4byte 0x81000140
_0802ED54:
	cmp r0, #0xf0
	ble _0802ED5A
	movs r4, #0xf0
_0802ED5A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E1EC
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED76
	movs r4, #0
	b _0802ED7C
_0802ED76:
	cmp r0, #0xf0
	ble _0802ED7C
	movs r4, #0xf0
_0802ED7C:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E164
_0802ED86:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Task_802ED98
Task_802ED98: @ 0x0802ED98
	push {r4, lr}
	ldr r4, _0802EDCC @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802EE64
	ldr r0, [r4]
	bl TaskDestroy
	ldr r0, _0802EDD0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802EDD8
	ldr r0, _0802EDD4 @ =gUnknown_03005490
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _0802EE64
	.align 2, 0
_0802EDCC: .4byte gCurTask
_0802EDD0: .4byte gGameMode
_0802EDD4: .4byte gUnknown_03005490
_0802EDD8:
	ldr r3, _0802EE0C @ =gCurrentLevel
	ldrb r0, [r3]
	lsls r2, r0, #0x18
	cmp r0, #0x1c
	beq _0802EE64
	ldr r0, _0802EE10 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802EE54
	ldr r0, _0802EE14 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bgt _0802EE54
	asrs r0, r2, #0x1a
	cmp r0, #2
	beq _0802EE26
	cmp r0, #2
	bgt _0802EE18
	cmp r0, #0
	beq _0802EE1E
	b _0802EE36
	.align 2, 0
_0802EE0C: .4byte gCurrentLevel
_0802EE10: .4byte gSelectedCharacter
_0802EE14: .4byte gLoadedSaveGame
_0802EE18:
	cmp r0, #4
	beq _0802EE2E
	b _0802EE36
_0802EE1E:
	movs r0, #0
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE26:
	movs r0, #1
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE2E:
	movs r0, #2
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE36:
	ldr r0, _0802EE48 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0802EE4C @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0802EE50 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	b _0802EE64
	.align 2, 0
_0802EE48: .4byte gUnknown_03005490
_0802EE4C: .4byte gRingCount
_0802EE50: .4byte gUnknown_030054F4
_0802EE54:
	ldr r0, _0802EE6C @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0802EE70 @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0802EE74 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0802EE64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE6C: .4byte gUnknown_03005490
_0802EE70: .4byte gRingCount
_0802EE74: .4byte gUnknown_030054F4

	thumb_func_start Task_802EE78
Task_802EE78: @ 0x0802EE78
	push {r4, r5, r6, lr}
	ldr r0, _0802EF44 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0802EF3C
	strh r1, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	strh r1, [r4, #6]
	movs r0, #0xbf
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r3, _0802EF48 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1a
	beq _0802EEC0
	ldr r0, _0802EF4C @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
_0802EEC0:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1c
	bne _0802EF34
	ldr r2, _0802EF50 @ =gUnknown_080D6DE4
	ldrb r1, [r4, #0x11]
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrh r5, [r0]
	ldr r4, _0802EF54 @ =gPlayer
	ldr r3, [r4, #8]
	asrs r0, r3, #8
	subs r5, r5, r0
	adds r2, #2
	adds r1, r1, r2
	ldrh r2, [r1]
	ldr r1, [r4, #0xc]
	asrs r0, r1, #8
	subs r2, r2, r0
	lsls r6, r5, #8
	adds r3, r3, r6
	str r3, [r4, #8]
	lsls r3, r2, #8
	adds r1, r1, r3
	str r1, [r4, #0xc]
	ldr r1, _0802EF58 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	adds r0, r0, r2
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	adds r0, r0, r2
	str r0, [r1, #0x14]
	ldr r0, _0802EF5C @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _0802EF2C
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r3
	str r0, [r1, #4]
_0802EF2C:
	ldr r1, _0802EF60 @ =gUnknown_030055B0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802EF34:
	ldr r0, _0802EF44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802EF64 @ =Task_802F06C
	str r0, [r1, #8]
_0802EF3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF44: .4byte gCurTask
_0802EF48: .4byte gCurrentLevel
_0802EF4C: .4byte gFlags
_0802EF50: .4byte gUnknown_080D6DE4
_0802EF54: .4byte gPlayer
_0802EF58: .4byte gCamera
_0802EF5C: .4byte gUnknown_030056A4
_0802EF60: .4byte gUnknown_030055B0
_0802EF64: .4byte Task_802F06C

	thumb_func_start sub_802EF68
sub_802EF68: @ 0x0802EF68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802EFD4 @ =Task_802EE78
	movs r2, #0xc1
	lsls r2, r2, #7
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0, #0x10]
	strh r4, [r0, #0xc]
	strh r5, [r0, #0xe]
	strb r6, [r0, #0x11]
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #4]
	movs r1, #1
	strh r1, [r0, #2]
	movs r1, #0xc0
	strh r1, [r0, #6]
	movs r1, #0xbf
	strh r1, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xa]
	ldr r0, _0802EFD8 @ =0x0000014D
	bl m4aSongNumStart
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EFD4: .4byte Task_802EE78
_0802EFD8: .4byte 0x0000014D

	thumb_func_start sub_802EFDC
sub_802EFDC: @ 0x0802EFDC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0802F004 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802F008 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802F014
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0802F00C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802F010 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802F02A
	.align 2, 0
_0802F004: .4byte gUnknown_03001884
_0802F008: .4byte gUnknown_03001B60
_0802F00C: .4byte 0x040000D4
_0802F010: .4byte 0x81000140
_0802F014:
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0802F030 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802F034 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802F02A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802F030: .4byte 0x040000D4
_0802F034: .4byte 0x81000140

	thumb_func_start sub_802F038
sub_802F038: @ 0x0802F038
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0802F068 @ =gUnknown_03001884
	ldr r3, [r0]
	lsls r0, r1, #1
	adds r3, r3, r0
	cmp r1, r2
	bhs _0802F060
_0802F052:
	strh r4, [r3]
	adds r3, #2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0802F052
_0802F060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F068: .4byte gUnknown_03001884

	thumb_func_start Task_802F06C
Task_802F06C: @ 0x0802F06C
	push {r4, r5, lr}
	ldr r5, _0802F0A0 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _0802F098
	movs r0, #0x3c
	strh r0, [r4, #6]
	ldr r1, [r5]
	ldr r0, _0802F0A4 @ =Task_802ED98
	str r0, [r1, #8]
_0802F098:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F0A0: .4byte gCurTask
_0802F0A4: .4byte Task_802ED98
