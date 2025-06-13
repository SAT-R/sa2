.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _02011D98 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _02011D9C @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _02011DA0 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _02011DA4 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x18]
_02011D88:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _02011DA8
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011D98: .4byte gCurTask
_02011D9C: .4byte IWRAM_START + 0x30
_02011DA0: .4byte IWRAM_START + 0x2B0
_02011DA4: .4byte IWRAM_START + 0x2B4
_02011DA8:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _02011DD6
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _02012216
_02011DD6:
	ldr r0, _02011DF4 @ =0x0000EFFF
	cmp r2, r0
	bgt _02011DFC
	ldr r0, _02011DF8 @ =0x00011FFF
	cmp r3, r0
	bgt _02011DFC
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _02011E1A
	.align 2, 0
_02011DF4: .4byte 0x0000EFFF
_02011DF8: .4byte 0x00011FFF
_02011DFC:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _02011E1C
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02011E1C
	ldr r3, _02011F40 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _02011F44 @ =0xFFFCA000
	adds r0, r1, r4
_02011E1A:
	str r0, [r5, #4]
_02011E1C:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r7, r0, #8
	ldr r1, _02011F48 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov r8, r0
	ldr r3, _02011F4C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	ble _02011E58
	b _0201205E
_02011E58:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _02011E6E
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _02011F60
_02011E6E:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02011F60
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011E9C
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _02011EA8
	cmp r2, r1
	blt _02011F60
_02011E9C:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011EA8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011EC4
	cmp r7, r1
	bge _02011ED0
	cmp r2, r1
	blt _02011F60
_02011EC4:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011ED0:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _02011F50 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _02011F54 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02011F1C
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _02011F1C
	ldr r0, _02011F58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _02011F1C
	ldr r1, _02011F5C @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _02011F1C
	adds r0, #1
	strb r0, [r1]
_02011F1C:
	ldr r0, _02011F58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02011F30
	ldr r1, _02011F50 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _02011F30
	movs r0, #0xff
	strh r0, [r1]
_02011F30:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011F40: .4byte 0xFFFA6000
_02011F44: .4byte 0xFFFCA000
_02011F48: .4byte gCamera
_02011F4C: .4byte gPlayer
_02011F50: .4byte gRingCount
_02011F54: .4byte gCurrentLevel
_02011F58: .4byte gGameMode
_02011F5C: .4byte gNumLives
_02011F60:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	bgt _0201205E
	movs r2, #0
	mov ip, r2
_02011F76:
	ldr r0, _02012034 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp ip, r0
	beq _02012050
	ldr r1, _02012038 @ =gMultiplayerPlayerTasks
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _02012050
	ldrh r2, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r6, r2, r4
	ldr r1, _0201203C @ =IWRAM_START + 0x6A
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02011FB6
	ldr r3, _02012040 @ =IWRAM_START + 0x54
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _02012050
_02011FB6:
	mov r4, sb
	subs r4, #8
	ldr r1, _02012044 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _02012048 @ =IWRAM_START + 0x2C
	adds r0, r2, r3
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r1, r1, r3
	cmp r4, r1
	bgt _02011FDC
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _02011FEC
	cmp r4, r1
	blt _02012050
_02011FDC:
	ldr r0, _0201204C @ =IWRAM_START + 0x2E
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r4
	blt _02012050
_02011FEC:
	adds r3, r7, #0
	subs r3, #0x10
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _0201200E
	cmp r7, r1
	bge _02012020
	cmp r3, r1
	blt _02012050
_0201200E:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _02012050
_02012020:
	mov r2, sb
	lsls r0, r2, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _02012212
	.align 2, 0
_02012034: .4byte 0x04000128
_02012038: .4byte gMultiplayerPlayerTasks
_0201203C: .4byte IWRAM_START + 0x6A
_02012040: .4byte IWRAM_START + 0x54
_02012044: .4byte IWRAM_START + 0x50
_02012048: .4byte IWRAM_START + 0x2C
_0201204C: .4byte IWRAM_START + 0x2E
_02012050:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #3
	bls _02011F76
_0201205E:
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _02012098
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _02012098
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _02012118 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _02012098
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_02012098:
	ldr r1, [sp, #4]
	ldr r2, _0201211C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _020120E6
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bge _020120E6
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _020120E6
	adds r0, r7, #0
	subs r0, #0x10
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r1, _02012118 @ =sub_801EC3C
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _020120E6
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_020120E6:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _02012104
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _02012104
	mov r2, r8
	cmp r2, #0xa7
	ble _02012134
_02012104:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02012128
	ldr r3, _02012120 @ =0xFFFFFA60
	add sl, r3
	ldr r4, _02012124 @ =0xFFFFFCA0
	add r8, r4
	b _02012134
	.align 2, 0
_02012118: .4byte sub_801EC3C
_0201211C: .4byte 0x000002B6
_02012120: .4byte 0xFFFFFA60
_02012124: .4byte 0xFFFFFCA0
_02012128:
	movs r0, #0xb4
	lsls r0, r0, #3
	add sl, r0
	movs r1, #0xd8
	lsls r1, r1, #2
	add r8, r1
_02012134:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _020121FA
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _020121FA
	mov r2, r8
	cmp r2, #0xa7
	bgt _020121FA
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _0201215C
	ldr r0, _02012188 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020121FA
_0201215C:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r3, [sp, #0x14]
	cmp r3, #0
	beq _0201216E
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0201218C
_0201216E:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sl
	ldr r4, [sp, #8]
	strh r0, [r4, #0x16]
	mov r1, r8
	strh r1, [r4, #0x18]
	ldr r0, [sp, #8]
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x14]
	b _020121FA
	.align 2, 0
_02012188: .4byte gStageTime
_0201218C:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _02012230 @ =gOamBuffer2
	adds r4, r0, r1
	ldr r3, [sp, #8]
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _02012234 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _020121FA
	ldr r1, _02012238 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0201223C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _02012240 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_020121FA:
	ldrh r1, [r5, #0x10]
	ldr r2, _02012244 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_02012212:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_02012216:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _02012220
	b _02011D88
_02012220:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012230: .4byte gOamBuffer2
_02012234: .4byte iwram_end
_02012238: .4byte 0x040000D4
_0201223C: .4byte 0x80000003
_02012240: .4byte 0x000001FF
_02012244: .4byte 0x0000FFFC

	
.syntax divided
