.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	ldr r0, _0802CB88 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [sp, #0x14]
	ldr r2, _0802CB8C @ =gUnknown_087BF8DC
	ldr r1, _0802CB90 @ =gUnknown_08487134
	ldr r0, _0802CB94 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r1, _0802CB98 @ =gUnknown_03005690
	str r1, [sp, #0xc]
	ldr r2, _0802CB9C @ =gUnknown_030055F0+0xC
	str r2, [sp, #0x10]
	ldr r4, _0802CBA0 @ =0x0300000C
	adds r4, r4, r3
	mov r8, r4
	ldr r5, [sp, #0x14]
	orrs r5, r3
	str r5, [sp, #0x14]
	movs r6, #0
	str r6, [sp, #0x20]
	mov r2, sp
	adds r2, #6
	ldr r7, _0802CBA4 @ =0x00007FFF
	adds r0, r7, #0
	strh r0, [r2]
	ldr r0, _0802CBA8 @ =0x040000D4
	str r2, [r0]
	ldr r1, _0802CBAC @ =gUnknown_03005670
	str r1, [r0, #4]
	ldr r1, _0802CBB0 @ =0x81000010
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	strh r6, [r2]
	str r2, [r0]
	ldr r1, _0802CBB4 @ =gUnknown_030057E0
	str r1, [r0, #4]
	ldr r1, _0802CBB8 @ =0x81000008
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r2, [r5, #0x3c]
	str r2, [sp, #0x1c]
	mov r0, r8
	bl UpdateSpriteAnimation
	ldr r3, [r4, #0xc]
	str r3, [sp, #0x18]
	ldr r4, [sp, #0xc]
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	movs r5, #0xc0
	lsls r5, r5, #2
	adds r3, r1, r5
	asrs r0, r3, #0xc
	lsls r0, r0, #0x18
	ldr r2, _0802CBBC @ =gUnknown_03005840
	lsrs r0, r0, #0x17
	adds r0, r0, r2
	ldrh r0, [r0]
	mov sb, r0
	subs r1, #0xc0
	str r1, [sp, #0x34]
	str r3, [sp, #0x38]
	lsls r0, r0, #1
	add r0, sb
	lsls r0, r0, #2
	ldr r6, [sp, #8]
	adds r0, r0, r6
	ldr r0, [r0, #4]
	cmp r0, r3
	blt _0802CB3E
	b _0802D12A
_0802CB3E:
	mov r7, sp
	adds r7, #4
	str r7, [sp, #0x3c]
_0802CB44:
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #2
	ldr r2, [sp, #8]
	adds r3, r0, r2
	ldrh r1, [r3, #8]
	ldr r0, _0802CBC0 @ =0x0000FFFF
	cmp r1, r0
	bne _0802CB5A
	b _0802D12A
_0802CB5A:
	cmp r1, #0
	bne _0802CB80
	ldr r4, [r3, #4]
	ldr r5, [sp, #0x34]
	cmp r4, r5
	blt _0802CB80
	mov r6, sb
	lsrs r2, r6, #3
	ldr r7, [sp, #0x1c]
	adds r0, r7, r2
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r6
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	str r2, [sp, #0x40]
	cmp r1, #0
	beq _0802CBC4
_0802CB80:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	b _0802CE5C
	.align 2, 0
_0802CB88: .4byte gCurTask
_0802CB8C: .4byte gUnknown_087BF8DC
_0802CB90: .4byte gUnknown_08487134
_0802CB94: .4byte gCurrentLevel
_0802CB98: .4byte gUnknown_03005690
_0802CB9C: .4byte gUnknown_030055F0+0xC
_0802CBA0: .4byte 0x0300000C
_0802CBA4: .4byte 0x00007FFF
_0802CBA8: .4byte 0x040000D4
_0802CBAC: .4byte gUnknown_03005670
_0802CBB0: .4byte 0x81000010
_0802CBB4: .4byte gUnknown_030057E0
_0802CBB8: .4byte 0x81000008
_0802CBBC: .4byte gUnknown_03005840
_0802CBC0: .4byte 0x0000FFFF
_0802CBC4:
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	str r0, [sp, #0x24]
	movs r2, #2
	ldrsh r0, [r3, r2]
	lsls r0, r0, #8
	str r0, [sp, #0x28]
	lsls r3, r4, #8
	str r3, [sp, #0x2c]
	ldr r5, [sp, #0xc]
	ldr r0, [r5, #8]
	asrs r7, r0, #8
	subs r0, r7, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	str r6, [sp, #0x30]
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r6, r0, r1
	asrs r6, r6, #3
	cmp r6, #0
	bne _0802CBF6
	movs r6, #1
_0802CBF6:
	adds r0, r6, #0
	muls r0, r6, r0
	muls r0, r6, r0
	muls r6, r0, r6
	adds r0, r6, #0
	movs r1, #0xcc
	lsls r1, r1, #1
	bl __divsi3
	adds r6, r0, #0
	adds r4, r6, #0
	cmp r6, #0
	bge _0802CC14
	ldr r2, _0802CE64 @ =0x000001FF
	adds r4, r6, r2
_0802CC14:
	asrs r4, r4, #9
	adds r4, #0x38
	ldr r3, [sp, #0x24]
	adds r0, r3, #0
	muls r0, r4, r0
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r1, r5, #0
	bl __divsi3
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r1, [sp, #0x28]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, [sp, #0xc]
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802CC50
	b _0802CEA0
_0802CC50:
	ldr r0, [sp, #0xc]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802CC5C
	b _0802CEA0
_0802CC5C:
	ldr r2, [sp, #0x2c]
	asrs r1, r2, #8
	adds r0, r1, #0
	subs r0, #0x20
	cmp r7, r0
	bge _0802CC6A
	b _0802CEA0
_0802CC6A:
	cmp r7, r1
	ble _0802CC70
	b _0802CEA0
_0802CC70:
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r1, r3
	ldr r4, [sp, #0xc]
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r2, r1
	bgt _0802CCAC
	mov r0, r8
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0802CCC0
	cmp r2, r1
	bge _0802CCAC
	b _0802CEA0
_0802CCAC:
	ldr r0, [sp, #0x10]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0802CCC0
	b _0802CEA0
_0802CCC0:
	mov r5, ip
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov r1, r8
	adds r1, #0x2d
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	ldr r7, [sp, #0xc]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r1, [sp, #0x10]
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0802CCFC
	mov r0, r8
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0802CD10
	cmp r2, r1
	bge _0802CCFC
	b _0802CEA0
_0802CCFC:
	ldr r0, [sp, #0x10]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0802CD10
	b _0802CEA0
_0802CD10:
	movs r0, #0
	str r0, [sp]
	ldr r0, _0802CE68 @ =sub_802D3E4
	movs r1, #0x74
	movs r2, #0xa8
	lsls r2, r2, #5
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	ldr r3, _0802CE6C @ =0x03000060
	adds r4, r2, r3
	movs r6, #1
	strh r6, [r4]
	ldr r7, [sp, #0x24]
	str r7, [r5, #0x3c]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x40]
	ldr r1, [sp, #0x2c]
	str r1, [r5, #0x44]
	subs r3, #0x10
	adds r0, r2, r3
	movs r6, #0
	strh r6, [r0]
	ldr r7, _0802CE70 @ =0x03000052
	adds r0, r2, r7
	strh r6, [r0]
	ldr r1, _0802CE74 @ =0x03000054
	adds r0, r2, r1
	strh r6, [r0]
	adds r3, #6
	adds r0, r2, r3
	strh r6, [r0]
	ldr r6, _0802CE78 @ =0x03000058
	adds r0, r2, r6
	movs r7, #0
	strh r7, [r0]
	adds r1, #6
	adds r0, r2, r1
	movs r3, #0
	strh r3, [r0]
	adds r6, #4
	adds r0, r2, r6
	strh r3, [r0]
	ldr r3, _0802CE7C @ =gUnknown_0848728C
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r1, [r0]
	ldr r7, _0802CE80 @ =0x03000062
	adds r0, r2, r7
	strh r1, [r0]
	ldrh r0, [r4]
	lsls r0, r0, #2
	adds r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _0802CE84 @ =0x03000064
	adds r2, r2, r1
	strh r0, [r2]
	ldr r2, [sp, #0x30]
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	movs r2, #0
	ldr r1, _0802CE88 @ =gUnknown_03005670
	movs r4, #0
	ldrsh r0, [r1, r4]
	mov r4, sb
	adds r4, #1
	ldr r6, _0802CE8C @ =0x00007FFF
	cmp r0, r6
	beq _0802CDCC
_0802CDA6:
	ldr r1, _0802CE88 @ =gUnknown_03005670
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r3
	beq _0802CDCE
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0802CDCE
	lsls r0, r2, #1
	adds r1, r0, r1
	movs r6, #0
	ldrsh r0, [r1, r6]
	ldr r7, _0802CE8C @ =0x00007FFF
	cmp r0, r7
	bne _0802CDA6
_0802CDCC:
	strh r3, [r1]
_0802CDCE:
	adds r0, r2, #1
	adds r3, r5, #0
	adds r3, #0x66
	strb r0, [r3]
	adds r0, r5, #0
	adds r0, #0x67
	movs r1, #1
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0xc
    @ inline of sub_802D6FC
	ldr r1, _0802CE90 @ =gUnknown_084872C4
	subs r0, #7
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r6, _0802CE94 @ =0x06010000
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r7, #0
	strh r7, [r2, #8]
	adds r0, r5, #0
	adds r0, #0x62
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r5, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, #0x38
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	movs r6, #0
	strh r6, [r2, #0x1c]
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	strb r7, [r0]
	ldrb r0, [r3]
	ldr r1, _0802CE98 @ =0x00002020
	orrs r0, r1
	str r0, [r2, #0x10]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	ldr r1, _0802CE9C @ =gSpecialStageCollectedRings
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bl SpStage_PlayRingSoundeffect
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x40]
	adds r2, r0, r1
	movs r0, #7
	mov r3, sb
	ands r3, r0
	movs r0, #1
	lsls r0, r3
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	lsls r0, r4, #0x10
_0802CE5C:
	lsrs r0, r0, #0x10
	mov sb, r0
	b _0802D114
	.align 2, 0
_0802CE64: .4byte 0x000001FF
_0802CE68: .4byte sub_802D3E4
_0802CE6C: .4byte 0x03000060
_0802CE70: .4byte 0x03000052
_0802CE74: .4byte 0x03000054
_0802CE78: .4byte 0x03000058
_0802CE7C: .4byte gUnknown_0848728C
_0802CE80: .4byte 0x03000062
_0802CE84: .4byte 0x03000064
_0802CE88: .4byte gUnknown_03005670
_0802CE8C: .4byte 0x00007FFF
_0802CE90: .4byte gUnknown_084872C4
_0802CE94: .4byte 0x06010000
_0802CE98: .4byte 0x00002020
_0802CE9C: .4byte gSpecialStageCollectedRings
_0802CEA0:
	ldr r4, [sp, #0x30]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	movs r2, #0
	ldr r0, _0802CECC @ =gUnknown_03005670
	movs r5, #0
	ldrsh r1, [r0, r5]
	adds r4, r0, #0
	mov r7, sl
	lsls r5, r7, #0x10
	mov r0, ip
	lsls r0, r0, #0x10
	mov ip, r0
	movs r7, #0x23
	add r7, r8
	mov sl, r7
	ldr r0, _0802CED0 @ =0x00007FFF
	cmp r1, r0
	bne _0802CED4
	strh r3, [r4]
	b _0802CEFA
	.align 2, 0
_0802CECC: .4byte gUnknown_03005670
_0802CED0: .4byte 0x00007FFF
_0802CED4:
	lsls r0, r2, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r3
	beq _0802CEFA
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0802CEFA
	lsls r0, r2, #1
	adds r1, r0, r4
	movs r7, #0
	ldrsh r0, [r1, r7]
	ldr r7, _0802D008 @ =0x00007FFF
	cmp r0, r7
	bne _0802CED4
	strh r3, [r1]
_0802CEFA:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	asrs r0, r5, #0x10
	ldr r1, _0802D00C @ =gUnknown_03005780
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	adds r0, #0x78
	ldr r2, [sp, #0x14]
	strh r0, [r2, #6]
	ldr r4, _0802D00C @ =gUnknown_03005780
	ldrh r1, [r4, #6]
	movs r0, #0x50
	subs r0, r0, r1
	mov r5, ip
	asrs r1, r5, #0x10
	subs r0, r0, r1
	strh r0, [r2, #8]
	adds r0, r6, #0
	cmp r0, #0
	bge _0802CF28
	ldr r6, _0802D010 @ =0x000003FF
	adds r0, r0, r6
_0802CF28:
	asrs r0, r0, #0xa
	adds r0, #0x40
	ldr r7, [sp, #0x14]
	strh r0, [r7, #2]
	strh r0, [r7, #4]
	ldr r2, _0802D014 @ =0x00002020
	orrs r2, r3
	mov r0, r8
	str r2, [r0, #0x10]
	movs r3, #2
	ldrsh r1, [r7, r3]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802CF4E
	movs r0, #0x40
	orrs r2, r0
	mov r4, r8
	str r2, [r4, #0x10]
_0802CF4E:
	ldr r5, [sp, #0x14]
	movs r6, #2
	ldrsh r2, [r5, r6]
	ldr r7, [sp, #0x18]
	movs r0, #8
	ldrsh r1, [r7, r0]
	ldrh r0, [r7, #4]
	lsrs r0, r0, #1
	subs r1, r1, r0
	muls r1, r2, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	ldrh r0, [r5, #6]
	subs r3, r0, r1
	mov r1, r8
	strh r3, [r1, #0x16]
	movs r4, #4
	ldrsh r2, [r5, r4]
	movs r5, #0xa
	ldrsh r1, [r7, r5]
	ldrh r0, [r7, #6]
	lsrs r0, r0, #1
	subs r1, r1, r0
	muls r1, r2, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	ldr r6, [sp, #0x14]
	ldrh r0, [r6, #8]
	subs r2, r0, r1
	mov r7, r8
	strh r2, [r7, #0x18]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0802CF9E
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0802D020
_0802CF9E:
	movs r3, #1
	rsbs r3, r3, #0
	adds r2, r3, #0
	movs r0, #0xff
	mov r4, sl
	strb r0, [r4]
	mov r5, r8
	ldr r0, [r5, #0x10]
	movs r1, #0x1f
	ands r0, r1
	ldr r6, [sp, #0x3c]
	strh r0, [r6]
	ldrh r0, [r6]
	ldr r7, _0802D018 @ =gUnknown_030057E0
	adds r0, r0, r7
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	bne _0802CFFE
	ldr r0, [sp, #0x3c]
	ldrh r1, [r0]
	adds r1, r1, r7
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r1, [sp, #0x3c]
	ldrh r0, [r1]
	lsls r0, r0, #5
	ldr r1, _0802D01C @ =gOamBuffer+0x6
	adds r5, r0, r1
	movs r4, #0x80
	lsls r4, r4, #9
	ldr r2, [sp, #0x14]
	movs r3, #2
	ldrsh r1, [r2, r3]
	adds r0, r4, #0
	bl Div
	strh r0, [r5]
	strh r6, [r5, #8]
	strh r6, [r5, #0x10]
	ldr r6, [sp, #0x14]
	movs r7, #4
	ldrsh r1, [r6, r7]
	adds r0, r4, #0
	bl Div
	strh r0, [r5, #0x18]
_0802CFFE:
	mov r0, r8
	bl DisplaySprite
	b _0802D100
	.align 2, 0
_0802D008: .4byte 0x00007FFF
_0802D00C: .4byte gUnknown_03005780
_0802D010: .4byte 0x000003FF
_0802D014: .4byte 0x00002020
_0802D018: .4byte gUnknown_030057E0
_0802D01C: .4byte gOamBuffer+0x6
_0802D020:
	mov r0, r8
	ldr r1, [r0, #0x10]
	adds r0, r1, #0
	movs r4, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0802D042
	ldr r5, [sp, #0x18]
	ldrh r0, [r5, #4]
	lsrs r0, r0, #1
	subs r0, r3, r0
	mov r6, r8
	strh r0, [r6, #0x16]
	ldrh r0, [r5, #6]
	lsrs r0, r0, #1
	subs r0, r2, r0
	strh r0, [r6, #0x18]
_0802D042:
	movs r7, #0x1f
	ands r1, r7
	ldr r0, [sp, #0x3c]
	strh r1, [r0]
	ldrh r0, [r0]
	ldr r1, _0802D13C @ =gUnknown_030057E0
	adds r0, r0, r1
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	bne _0802D08E
	ldr r2, [sp, #0x3c]
	ldrh r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldrh r0, [r2]
	lsls r0, r0, #5
	ldr r1, _0802D140 @ =gOamBuffer+0x6
	adds r5, r0, r1
	movs r4, #0x80
	lsls r4, r4, #9
	ldr r3, [sp, #0x14]
	movs r0, #2
	ldrsh r1, [r3, r0]
	adds r0, r4, #0
	bl Div
	strh r0, [r5]
	strh r6, [r5, #8]
	strh r6, [r5, #0x10]
	ldr r2, [sp, #0x14]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r4, #0
	bl Div
	strh r0, [r5, #0x18]
_0802D08E:
	mov r4, sl
	ldrb r0, [r4]
	lsls r0, r0, #3
	ldr r1, _0802D144 @ =gOamMallocBuffer
	adds r5, r0, r1
	mov r6, r8
	ldrh r0, [r6, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r4, r0, #0
	ldr r0, _0802D148 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	beq _0802D12A
	ldr r1, _0802D14C @ =0x040000D4
	str r5, [r1]
	str r4, [r1, #4]
	ldr r0, _0802D150 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r4]
	movs r3, #0xfd
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r2, r0
	strh r2, [r4]
	ldrh r3, [r4, #2]
	movs r5, #0xc0
	lsls r5, r5, #8
	adds r0, r5, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrb r1, [r6, #0x18]
	ldr r0, [r6, #0x10]
	movs r6, #0x40
	ands r0, r6
	lsls r0, r0, #3
	orrs r1, r0
	orrs r1, r2
	strh r1, [r4]
	mov r0, r8
	ldrh r1, [r0, #0x16]
	ldr r2, _0802D154 @ =0x000001FF
	adds r0, r2, #0
	ands r1, r0
	mov r5, r8
	ldr r0, [r5, #0x10]
	ands r0, r7
	lsls r0, r0, #9
	orrs r1, r0
	orrs r1, r3
	strh r1, [r4, #2]
_0802D100:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, [sp, #0x20]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
_0802D114:
	mov r6, sb
	lsls r0, r6, #1
	add r0, sb
	lsls r0, r0, #2
	ldr r7, [sp, #8]
	adds r0, r0, r7
	ldr r0, [r0, #4]
	ldr r1, [sp, #0x38]
	cmp r0, r1
	bge _0802D12A
	b _0802CB44
_0802D12A:
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D13C: .4byte gUnknown_030057E0
_0802D140: .4byte gOamBuffer+0x6
_0802D144: .4byte gOamMallocBuffer
_0802D148: .4byte iwram_end
_0802D14C: .4byte 0x040000D4
_0802D150: .4byte 0x80000003
_0802D154: .4byte 0x000001FF

.syntax divided
