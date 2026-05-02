.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, _08039AD0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r4, r1
	mov r8, r2
	ldrh r0, [r0]
	adds r0, r0, r1
	ldrh r3, [r0, #6]
	adds r1, r3, r1
	str r1, [sp]
	mov sl, r8
	ldr r0, _08039AD4 @ =0x03000030
	adds r0, r4, r0
	str r0, [sp, #4]
	ldr r1, _08039AD8 @ =0x03000094
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	bgt _08039AEA
	ldr r2, _08039ADC @ =0x0300008C
	adds r0, r3, r2
	ldrh r0, [r0]
	subs r1, #0x44
	adds r2, r4, r1
	strh r0, [r2]
	adds r1, #0x3e
	adds r0, r3, r1
	ldrh r1, [r0]
	ldr r3, _08039AE0 @ =0x03000052
	adds r0, r4, r3
	strh r1, [r0]
	mov r4, sl
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08039AE4
	ldrh r0, [r2]
	adds r0, #0x1a
	b _08039AE8
	.align 2, 0
_08039AD0: .4byte gCurTask
_08039AD4: .4byte 0x03000030
_08039AD8: .4byte 0x03000094
_08039ADC: .4byte 0x0300008C
_08039AE0: .4byte 0x03000052
_08039AE4:
	ldrh r0, [r2]
	subs r0, #0x1a
_08039AE8:
	strh r0, [r2]
_08039AEA:
	mov r3, r8
	adds r3, #0x48
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov r2, r8
	ldr r0, [r2, #0x40]
	adds r0, r0, r1
	str r0, [r2, #0x40]
	adds r2, #0x4a
	ldrh r0, [r2]
	mov r1, r8
	adds r1, #0x4e
	strh r0, [r1]
	ldrh r6, [r2]
	mov ip, r6
	mov r4, sl
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r3, [sp, #0xc]
	mov sb, r2
	cmp r1, #0
	beq _08039B38
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r2, _08039BD4 @ =0xFFFFFE00
	adds r1, r2, #0
	subs r6, r1, r0
	ldr r1, _08039BD8 @ =0x000003FF
	ands r6, r1
	mov r3, ip
	lsls r0, r3, #0x10
	rsbs r0, r0, #0
	asrs r0, r0, #0x10
	mov ip, r0
	mov r4, ip
	ands r4, r1
	mov ip, r4
_08039B38:
	ldr r2, _08039BDC @ =gSineTable
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r6, [r0, r4]
	asrs r6, r6, #6
	mov r3, r8
	ldr r0, [r3, #0x40]
	muls r6, r0, r6
	asrs r6, r6, #0x10
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r7, [r1, r4]
	asrs r7, r7, #6
	muls r7, r0, r7
	asrs r7, r7, #0x10
	mov r5, r8
	adds r5, #0x50
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r6, r6, r0
	mov r4, r8
	adds r4, #0x52
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r7, r7, r0
	ldr r1, _08039BE0 @ =gCamera
	ldrh r0, [r1]
	subs r0, r6, r0
	ldr r3, [sp, #4]
	strh r0, [r3, #6]
	ldrh r0, [r1, #2]
	subs r0, r7, r0
	strh r0, [r3, #8]
	mov r0, ip
	strh r0, [r3]
	mov r0, sl
	bl UpdateSpriteAnimation
	mov r0, sl
	ldr r1, [sp, #4]
	bl TransformSprite
	mov r0, sl
	bl DisplaySprite
	ldr r0, [sp]
	adds r0, #0x94
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _08039BEC
	movs r0, #0
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	lsls r0, r6, #8
	mov r2, r8
	str r0, [r2, #0x54]
	lsls r0, r7, #8
	str r0, [r2, #0x58]
	movs r0, #0xb8
	lsls r0, r0, #3
	mov r3, sl
	strh r0, [r3, #0x1a]
	movs r0, #0x50
	strh r0, [r2, #0x3c]
	ldr r0, _08039BE4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08039BE8 @ =Task_803A46C
	str r0, [r1, #8]
	b _0803A14A
	.align 2, 0
_08039BD4: .4byte 0xFFFFFE00
_08039BD8: .4byte 0x000003FF
_08039BDC: .4byte gSineTable
_08039BE0: .4byte gCamera
_08039BE4: .4byte gCurTask
_08039BE8: .4byte Task_803A46C
_08039BEC:
	mov r0, r8
	adds r0, #0x61
	ldrb r1, [r0]
	str r0, [sp, #0x10]
	cmp r1, #0
	blt _08039C1E
	cmp r1, #1
	ble _08039C02
	cmp r1, #2
	beq _08039C0E
	b _08039C1E
_08039C02:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	b _08039C18
_08039C0E:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
_08039C18:
	bl sub_8036F9C
	str r0, [sp, #8]
_08039C1E:
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	cmp r0, #9
	bls _08039C28
	b _0803A14A
_08039C28:
	lsls r0, r0, #2
	ldr r1, _08039C34 @ =_08039C38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039C34: .4byte _08039C38
_08039C38: @ jump table
	.4byte _08039C60 @ case 0
	.4byte _08039CDE @ case 1
	.4byte _08039E08 @ case 2
	.4byte _08039EE2 @ case 3
	.4byte _08039EFC @ case 4
	.4byte _08039F30 @ case 5
	.4byte _08039F94 @ case 6
	.4byte _08039FD4 @ case 7
	.4byte _0803A026 @ case 8
	.4byte _0803A084 @ case 9
_08039C60:
	mov r2, r8
	ldrh r0, [r2, #0x3c]
	subs r0, #1
	strh r0, [r2, #0x3c]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08039C72
	b _0803A14A
_08039C72:
	ldr r2, _08039CA8 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08039CAC @ =0x00196225
	muls r0, r1, r0
	ldr r4, _08039CB0 @ =0x3C6EF35F
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	strh r3, [r0]
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	movs r1, #0x64
	bl __modsi3
	adds r1, r0, #0
	subs r1, #0x23
	cmp r1, #0
	bgt _08039CB4
	movs r0, #0xb4
	mov r3, r8
	strh r0, [r3, #0x3c]
	b _0803A14A
	.align 2, 0
_08039CA8: .4byte gPseudoRandom
_08039CAC: .4byte 0x00196225
_08039CB0: .4byte 0x3C6EF35F
_08039CB4:
	adds r1, r0, #0
	subs r1, #0x46
	cmp r1, #0
	bgt _08039CC4
	movs r0, #0x3c
	mov r4, r8
	strh r0, [r4, #0x3c]
	b _0803A14A
_08039CC4:
	adds r1, r0, #0
	subs r1, #0x5a
	cmp r1, #0
	bgt _08039CD4
	movs r0, #0x12
	mov r1, r8
	strh r0, [r1, #0x3c]
	b _0803A14A
_08039CD4:
	movs r0, #0x96
	lsls r0, r0, #1
	mov r2, r8
	strh r0, [r2, #0x3c]
	b _0803A14A
_08039CDE:
	movs r3, #0
	ldrsh r1, [r5, r3]
	ldr r2, _08039D48 @ =gPlayer
	ldr r0, [r2]
	asrs r0, r0, #8
	subs r6, r1, r0
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	subs r7, r1, r0
	cmp r6, #0
	bge _08039CFA
	rsbs r6, r6, #0
_08039CFA:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sa2__sub_8004418
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08039D4C @ =0xFF1F0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	movs r1, #0x8f
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08039D1A
	movs r6, #0xe0
_08039D1A:
	lsls r0, r6, #0x10
	ldr r2, _08039D50 @ =0xFDFF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, r1
	bhi _08039D2A
	movs r6, #0xc8
	lsls r6, r6, #2
_08039D2A:
	mov r3, sb
	ldrh r2, [r3]
	lsls r0, r2, #0x16
	asrs r1, r0, #0x10
	lsls r0, r6, #0x16
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _08039D54
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r0, r3
	cmp r1, r0
	blt _08039D60
	subs r0, r2, #6
	b _08039D6E
	.align 2, 0
_08039D48: .4byte gPlayer
_08039D4C: .4byte 0xFF1F0000
_08039D50: .4byte 0xFDFF0000
_08039D54:
	cmp r1, r0
	bge _08039D72
	ldr r3, _08039D68 @ =0xFFFFFE80
	adds r0, r0, r3
	cmp r1, r0
	ble _08039D6C
_08039D60:
	mov r0, sb
	strh r6, [r0]
	b _08039D72
	.align 2, 0
_08039D68: .4byte 0xFFFFFE80
_08039D6C:
	adds r0, r2, #6
_08039D6E:
	mov r1, sb
	strh r0, [r1]
_08039D72:
	mov r2, sb
	ldrh r0, [r2]
	ldr r1, _08039DFC @ =0x000003FF
	ands r1, r0
	strh r1, [r2]
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	subs r0, #1
	strh r0, [r3, #0x3c]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08039D8C
	b _0803A14A
_08039D8C:
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r3, _08039E00 @ =gPlayer
	ldr r1, [r3]
	asrs r1, r1, #8
	subs r0, r0, r1
	movs r1, #0
	ldrsh r2, [r4, r1]
	ldr r1, [r3, #4]
	asrs r1, r1, #8
	subs r2, r2, r1
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	adds r4, r2, #0
	muls r4, r2, r4
	adds r2, r4, #0
	lsls r0, r0, #8
	lsls r2, r2, #8
	adds r0, r0, r2
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xc
	ldr r1, _08039E04 @ =0xFFFFF000
	subs r1, r1, r0
	mov r0, r8
	str r1, [r0, #0x44]
	movs r0, #0xfa
	lsls r0, r0, #8
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	mov r1, r8
	adds r1, #0x60
	movs r0, #0
	strb r0, [r1]
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r0, #0xf0
	lsls r0, r0, #2
	mov r3, sl
	strh r0, [r3, #0x1a]
	mov r1, sl
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xb3
	bl m4aSongNumStart
	b _0803A14A
	.align 2, 0
_08039DFC: .4byte 0x000003FF
_08039E00: .4byte gPlayer
_08039E04: .4byte 0xFFFFF000
_08039E08:
	mov r4, r8
	ldr r0, [r4, #0x40]
	rsbs r0, r0, #0
	asrs r0, r0, #8
	subs r0, #0x14
	asrs r0, r0, #4
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, r8
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, r2
	bhs _08039E2A
	strb r2, [r1]
	bl sub_803A1D8
_08039E2A:
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _08039EB8
	mov r1, r8
	adds r1, #0x62
	movs r0, #0xff
	strb r0, [r1]
	movs r4, #0
	ldr r1, [sp, #0xc]
	strh r4, [r1]
	movs r0, #7
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	mov r0, sl
	adds r0, #0x20
	mov r3, sp
	ldrb r3, [r3, #8]
	strb r3, [r0]
	mov r1, sl
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r5, _08039E90 @ =gPlayer
	adds r0, r5, #0
	bl Player_TransitionCancelFlyingAndBoost
	lsls r0, r6, #8
	str r0, [r5]
	lsls r0, r7, #8
	str r0, [r5, #4]
	strh r4, [r5, #8]
	strh r4, [r5, #0xa]
	strh r4, [r5, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, _08039E94 @ =0x00E00100
	orrs r0, r1
	str r0, [r5, #0x10]
	mov r4, sl
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08039E98
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	rsbs r0, r0, #0
	asrs r0, r0, #2
	b _08039E9E
	.align 2, 0
_08039E90: .4byte gPlayer
_08039E94: .4byte 0x00E00100
_08039E98:
	mov r3, sb
	ldrh r0, [r3]
	lsrs r0, r0, #2
_08039E9E:
	strb r0, [r5, #0x14]
	ldr r1, _08039EB4 @ =gPlayer
	adds r3, r1, #0
	adds r3, #0x40
	movs r2, #0
	movs r0, #0x28
	strb r0, [r3]
	strh r2, [r1, #0x38]
	strh r2, [r1, #0x3a]
	b _0803A14A
	.align 2, 0
_08039EB4: .4byte gPlayer
_08039EB8:
	mov r4, r8
	ldr r1, [r4, #0x40]
	ldr r0, [r4, #0x44]
	cmp r1, r0
	ble _08039EC4
	b _0803A14A
_08039EC4:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	mov r1, sl
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	b _0803A14A
_08039EE2:
	mov r3, sl
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _08039EF2
	b _0803A14A
_08039EF2:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r4, [sp, #0xc]
	strh r0, [r4]
	b _0803A076
_08039EFC:
	mov r2, r8
	ldr r0, [r2, #0x40]
	ldr r1, _08039F2C @ =0xFFFFEC00
	cmp r0, r1
	bge _08039F08
	b _0803A14A
_08039F08:
	str r1, [r2, #0x40]
	movs r1, #0
	movs r0, #0
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	movs r0, #0xb8
	lsls r0, r0, #3
	mov r4, sl
	strh r0, [r4, #0x1a]
	mov r0, sl
	adds r0, #0x20
	strb r1, [r0]
	mov r1, sl
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	b _0803A076
	.align 2, 0
_08039F2C: .4byte 0xFFFFEC00
_08039F30:
	mov r2, sb
	ldrh r0, [r2]
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r1, #0
	bne _08039F56
	movs r0, #0xb8
	lsls r0, r0, #3
	mov r4, sl
	strh r0, [r4, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _0803A14A
_08039F56:
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r1, r2
	ble _08039F78
	adds r0, #6
	ldr r3, _08039F74 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	mov r4, sb
	strh r0, [r4]
	cmp r0, #6
	ble _08039F70
	b _0803A14A
_08039F70:
	b _08039F8A
	.align 2, 0
_08039F74: .4byte 0x000003FF
_08039F78:
	subs r0, #6
	ldr r3, _08039F90 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	mov r4, sb
	strh r0, [r4]
	cmp r0, r2
	bgt _08039F8A
	b _0803A14A
_08039F8A:
	movs r0, #0
	strh r0, [r4]
	b _0803A14A
	.align 2, 0
_08039F90: .4byte 0x000003FF
_08039F94:
	mov r0, r8
	ldr r1, [r0, #0x40]
	ldr r0, _08039FB8 @ =0x00000DFF
	cmp r1, r0
	bgt _08039FA0
	b _0803A14A
_08039FA0:
	mov r0, r8
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #0
	bne _08039FBC
	ldr r1, [sp]
	adds r1, #0x99
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08039FC4
	.align 2, 0
_08039FB8: .4byte 0x00000DFF
_08039FBC:
	ldr r1, [sp]
	adds r1, #0x92
	movs r0, #1
	strh r0, [r1]
_08039FC4:
	ldr r0, _08039FD0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0803A14A
	.align 2, 0
_08039FD0: .4byte gCurTask
_08039FD4:
	ldr r2, _08039FF8 @ =gPlayer
	lsls r0, r6, #8
	str r0, [r2]
	lsls r0, r7, #8
	str r0, [r2, #4]
	mov r1, sl
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08039FFC
	mov r3, sb
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	asrs r0, r0, #2
	b _0803A002
	.align 2, 0
_08039FF8: .4byte gPlayer
_08039FFC:
	mov r1, sb
	ldrh r0, [r1]
	lsrs r0, r0, #2
_0803A002:
	strb r0, [r2, #0x14]
	mov r2, sl
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0803A014
	b _0803A14A
_0803A014:
	movs r0, #0xc0
	lsls r0, r0, #3
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r4, [sp, #0x10]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0803A14A
_0803A026:
	ldr r2, _0803A04C @ =gPlayer
	lsls r0, r6, #8
	str r0, [r2]
	lsls r0, r7, #8
	str r0, [r2, #4]
	mov r1, sl
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803A050
	mov r3, sb
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	asrs r0, r0, #2
	b _0803A056
	.align 2, 0
_0803A04C: .4byte gPlayer
_0803A050:
	mov r1, sb
	ldrh r0, [r1]
	lsrs r0, r0, #2
_0803A056:
	strb r0, [r2, #0x14]
	mov r2, r8
	ldr r0, [r2, #0x40]
	ldr r1, _0803A080 @ =0xFFFFDC00
	cmp r0, r1
	blt _0803A14A
	str r1, [r2, #0x40]
	movs r2, #0
	ldr r3, [sp, #0xc]
	strh r2, [r3]
	mov r1, r8
	adds r1, #0x4c
	movs r0, #0x10
	strh r0, [r1]
	mov r4, r8
	strh r2, [r4, #0x3c]
_0803A076:
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803A14A
	.align 2, 0
_0803A080: .4byte 0xFFFFDC00
_0803A084:
	ldr r2, _0803A0AC @ =gPlayer
	lsls r0, r6, #8
	str r0, [r2]
	lsls r0, r7, #8
	str r0, [r2, #4]
	mov r3, sl
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _0803A0B0
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	asrs r0, r0, #2
	b _0803A0B6
	.align 2, 0
_0803A0AC: .4byte gPlayer
_0803A0B0:
	mov r2, sb
	ldrh r0, [r2]
	lsrs r0, r0, #2
_0803A0B6:
	strb r0, [r3, #0x14]
	mov r2, r8
	adds r2, #0x4c
	ldrh r0, [r2]
	mov r4, sb
	ldrh r4, [r4]
	adds r0, r0, r4
	ldr r1, _0803A15C @ =0x000003FF
	ands r0, r1
	mov r1, sb
	strh r0, [r1]
	ldr r1, _0803A160 @ =0x000001FF
	adds r5, r2, #0
	cmp r0, r1
	ble _0803A102
	ldr r6, _0803A164 @ =gRingCount
	ldrh r4, [r6]
	cmp r4, #0
	beq _0803A0FE
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0803A0FE
	cmp r4, #5
	bls _0803A0EA
	movs r4, #5
_0803A0EA:
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl InitScatteringRings
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
_0803A0FE:
	movs r0, #0x10
	strh r0, [r5]
_0803A102:
	ldr r3, _0803A168 @ =0xFFFFFF00
	adds r0, r3, #0
	mov r4, sb
	ldrh r4, [r4]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bhi _0803A14A
	ldr r0, _0803A16C @ =0x0000FFF0
	strh r0, [r5]
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	adds r0, #1
	strh r0, [r1, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bne _0803A130
	ldr r1, [sp]
	adds r1, #0x99
	movs r0, #0x33
	strb r0, [r1]
_0803A130:
	mov r2, r8
	ldrh r4, [r2, #0x3c]
	cmp r4, #5
	bne _0803A14A
	mov r3, sl
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	bl sub_803A170
	ldr r0, [sp, #0x10]
	strb r4, [r0]
_0803A14A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A15C: .4byte 0x000003FF
_0803A160: .4byte 0x000001FF
_0803A164: .4byte gRingCount
_0803A168: .4byte 0xFFFFFF00
_0803A16C: .4byte 0x0000FFF0
.align 2, 0
.syntax divided
