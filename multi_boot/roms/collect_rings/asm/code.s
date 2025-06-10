.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start InitPlayerHitRingsScatter
InitPlayerHitRingsScatter: @ 0x02011B44
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _02011BD8 @ =gUnknown_030057C4
	ldr r0, _02011BDC @ =sub_02012260
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _02011BE0 @ =0x00002001
	ldr r3, _02011BE4 @ =sub_0201226C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _02011BE8 @ =0x06012E40
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	movs r0, #0x6a
	strh r0, [r1, #0xa]
	ldr r2, _02011BEC @ =gUnknown_03000020
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _02011BF0 @ =gUnknown_03000021
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _02011BF4 @ =gUnknown_03000022
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _02011BF8 @ =gUnknown_03000025
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _02011BFC @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _02011C00 @ =gUnknown_030002B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _02011C04 @ =gUnknown_030002B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _02011C08 @ =gUnknown_030002B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _02011C0C @ =gUnknown_03000030
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _02011C10 @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _02011C14 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011BD8: .4byte gUnknown_030057C4
_02011BDC: .4byte sub_02012260
_02011BE0: .4byte 0x00002001
_02011BE4: .4byte sub_0201226C
_02011BE8: .4byte 0x06012E40
_02011BEC: .4byte gUnknown_03000020
_02011BF0: .4byte gUnknown_03000021
_02011BF4: .4byte gUnknown_03000022
_02011BF8: .4byte gUnknown_03000025
_02011BFC: .4byte 0x00042200
_02011C00: .4byte gUnknown_030002B6
_02011C04: .4byte gUnknown_030002B4
_02011C08: .4byte gUnknown_030002B0
_02011C0C: .4byte gUnknown_03000030
_02011C10: .4byte 0x040000D4
_02011C14: .4byte 0x81000140

	thumb_func_start InitScatteringRings
InitScatteringRings: @ 0x02011C18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _02011C9C @ =gUnknown_030057C4
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _02011CA0 @ =gUnknown_03000030
	adds r4, r0, r1
	ldr r6, _02011CA4 @ =gPlayer
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	beq _02011D2E
	cmp r7, #0x20
	ble _02011C46
	movs r7, #0x20
_02011C46:
	ldr r0, _02011CA8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _02011C54
	cmp r7, #0x10
	ble _02011C54
	movs r7, #0x10
_02011C54:
	movs r0, #0x10
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _02011CAC @ =gSineTable
	mov sl, r1
	ldr r0, _02011CB0 @ =gPseudoRandom
	mov sb, r0
_02011C6C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _02011D22
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _02011CE4
	asrs r2, r3, #8
	cmp r2, #5
	ble _02011CB4
	rsbs r0, r2, #0
	adds r0, #9
	b _02011CB6
	.align 2, 0
_02011C9C: .4byte gUnknown_030057C4
_02011CA0: .4byte gUnknown_03000030
_02011CA4: .4byte gPlayer
_02011CA8: .4byte gGameMode
_02011CAC: .4byte gSineTable
_02011CB0: .4byte gPseudoRandom
_02011CB4:
	adds r0, r2, #0
_02011CB6:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r0, #0x80
	orrs r3, r0
_02011CE4:
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	movs r1, #0
	strh r1, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _02011D40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02011D44 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _02011D0E
	movs r0, #4
	strh r0, [r4, #0x10]
_02011D0E:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _02011D2E
_02011D22:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _02011C6C
_02011D2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02011D40: .4byte 0x00196225
_02011D44: .4byte 0x3C6EF35F

	thumb_func_start sub_02011D48
sub_02011D48: @ 0x02011D48
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
	ldr r0, _02011D9C @ =gUnknown_03000030
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _02011DA0 @ =gUnknown_030002B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _02011DA4 @ =gUnknown_030002B4
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
_02011D9C: .4byte gUnknown_03000030
_02011DA0: .4byte gUnknown_030002B0
_02011DA4: .4byte gUnknown_030002B4
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
	ldr r1, _0201203C @ =gUnknown_0300006A
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02011FB6
	ldr r3, _02012040 @ =gUnknown_03000054
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _02012050
_02011FB6:
	mov r4, sb
	subs r4, #8
	ldr r1, _02012044 @ =gUnknown_03000050
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _02012048 @ =gUnknown_0300002C
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
	ldr r0, _0201204C @ =gUnknown_0300002E
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
_0201203C: .4byte gUnknown_0300006A
_02012040: .4byte gUnknown_03000054
_02012044: .4byte gUnknown_03000050
_02012048: .4byte gUnknown_0300002C
_0201204C: .4byte gUnknown_0300002E
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

	thumb_func_start DestroyRingsScatterTask
DestroyRingsScatterTask: @ 0x02012248
	push {r4, lr}
	ldr r4, _0201225C @ =gUnknown_030057C4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0201225C: .4byte gUnknown_030057C4

	thumb_func_start sub_02012260
sub_02012260: @ 0x02012260
	push {lr}
	bl sub_02011D48
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201226C
sub_0201226C: @ 0x0201226C
	ldr r1, _02012274 @ =gUnknown_030057C4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012274: .4byte gUnknown_030057C4

	thumb_func_start sub_02012278
sub_02012278: @ 0x02012278
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _020122AC @ =gPlayerControls
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_02012292:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _020122C6
	cmp r1, #1
	bgt _020122B0
	cmp r1, #0
	beq _020122B6
	b _020122E2
	.align 2, 0
_020122AC: .4byte gPlayerControls
_020122B0:
	cmp r1, #2
	beq _020122D4
	b _020122E2
_020122B6:
	cmp r2, #2
	bne _020122BE
	strh r5, [r4]
	b _020122E2
_020122BE:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _020122E2
_020122C6:
	cmp r2, #2
	bne _020122CE
	strh r5, [r4, #2]
	b _020122E2
_020122CE:
	lsls r1, r2
	strh r1, [r4, #2]
	b _020122E2
_020122D4:
	cmp r2, #2
	bne _020122DC
	strh r5, [r4, #4]
	b _020122E2
_020122DC:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_020122E2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _02012292
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_020122F8
sub_020122F8: @ 0x020122F8
	ldr r3, _02012304 @ =gPlayerControls
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_02012304: .4byte gPlayerControls

	thumb_func_start CreateGameStage
CreateGameStage: @ 0x02012308
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _02012424 @ =Task_GameStage
	movs r2, #0xff
	lsls r2, r2, #8
	ldr r1, _02012428 @ =TaskDestructor_GameStage
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _0201242C @ =gUnknown_030057D0
	str r0, [r1]
	ldr r0, _02012430 @ =gActiveCollectRingEffectCount
	movs r4, #0
	strb r4, [r0]
	ldr r0, _02012434 @ =gSpecialRingCount
	strb r4, [r0]
	ldr r0, _02012438 @ =gUnknown_030054B0
	strb r4, [r0]
	ldr r5, _0201243C @ =gStageFlags
	ldrh r0, [r5]
	movs r1, #0x21
	orrs r0, r1
	ldr r1, _02012440 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r5]
	ldr r0, _02012444 @ =gUnknown_030053E4
	strb r4, [r0]
	ldr r1, _02012448 @ =gUnknown_030053E0_old
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _0201244C @ =gUnknown_03005530
	strb r4, [r0]
	bl sub_801F044
	ldr r0, _02012450 @ =gUnknown_030053E0
	strb r4, [r0]
	ldr r1, _02012454 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012372
	ldr r0, _02012458 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0201245C @ =gPlayer
	bl CreatePlayer
_02012372:
	movs r0, #0
	bl InitCamera
	bl StageInit_CollectRings
	bl CreateCollectRingsTimeDisplay
	ldr r2, _0201245C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02012460 @ =0xFF9FFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrh r0, [r5]
	ldr r2, _02012464 @ =0x0000FFFE
	ands r2, r0
	ldr r0, _02012468 @ =0x0000FFFD
	ands r2, r0
	subs r0, #2
	ands r2, r0
	strh r2, [r5]
	ldr r6, _0201246C @ =gGameMode
	ldrb r0, [r6]
	cmp r0, #5
	bne _020123AA
	movs r1, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_020123AA:
	bl CreateStageRingsManager
	bl CreateStageEntitiesManager
	ldr r0, _02012470 @ =gUnknown_03001944
	movs r4, #0
	strh r4, [r0]
	ldr r0, _02012474 @ =gUnknown_030017F0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _02012478 @ =gUnknown_03005394
	strh r1, [r0]
	ldr r0, _0201247C @ =gUnknown_03002A8C
	movs r2, #0x78
	strh r2, [r0]
	ldr r0, _02012480 @ =gUnknown_03004D58
	movs r1, #0x50
	strh r1, [r0]
	ldr r0, _02012484 @ =gUnknown_0300194C
	strh r2, [r0]
	ldr r0, _02012488 @ =gUnknown_03002820
	strh r1, [r0]
	ldr r1, _0201248C @ =gUnknown_03005398
	movs r0, #0x80
	strh r0, [r1]
	ldrb r0, [r6]
	cmp r0, #2
	bls _020124D6
	bl CreateMultiplayerReceiveEventMgr
	bl CreateMultiplayerSendEventMgr
	ldr r0, _02012490 @ =gRandomItemBox
	strb r4, [r0]
	movs r4, #0
_020123F4:
	ldr r0, _02012494 @ =gMultiplayerCharRings
	adds r0, r4, r0
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012498 @ =gMultiplayerConnections
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020124A4
	adds r0, r4, #0
	bl CreateMultiplayerPlayer
	ldr r0, _0201249C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _020124A0
	adds r0, r4, #0
	bl CreateOpponentPositionIndicator
	b _020124A4
	.align 2, 0
_02012424: .4byte Task_GameStage
_02012428: .4byte TaskDestructor_GameStage
_0201242C: .4byte gUnknown_030057D0
_02012430: .4byte gActiveCollectRingEffectCount
_02012434: .4byte gSpecialRingCount
_02012438: .4byte gUnknown_030054B0
_0201243C: .4byte gStageFlags
_02012440: .4byte 0x0000FF7F
_02012444: .4byte gUnknown_030053E4
_02012448: .4byte gUnknown_030053E0_old
_0201244C: .4byte gUnknown_03005530
_02012450: .4byte gUnknown_030053E0
_02012454: .4byte gCurrentLevel
_02012458: .4byte gSelectedCharacter
_0201245C: .4byte gPlayer
_02012460: .4byte 0xFF9FFFFF
_02012464: .4byte 0x0000FFFE
_02012468: .4byte 0x0000FFFD
_0201246C: .4byte gGameMode
_02012470: .4byte gUnknown_03001944
_02012474: .4byte gUnknown_030017F0
_02012478: .4byte gUnknown_03005394
_0201247C: .4byte gUnknown_03002A8C
_02012480: .4byte gUnknown_03004D58
_02012484: .4byte gUnknown_0300194C
_02012488: .4byte gUnknown_03002820
_0201248C: .4byte gUnknown_03005398
_02012490: .4byte gRandomItemBox
_02012494: .4byte gMultiplayerCharRings
_02012498: .4byte gMultiplayerConnections
_0201249C: .4byte 0x04000128
_020124A0:
	bl CreateSelfPositionIndicator
_020124A4:
	ldr r0, _020124E0 @ =gUnknown_030054B4
	adds r0, r4, r0
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, _020124E4 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #5
	bne _020124BA
	ldr r0, _020124E8 @ =gMultiplayerCharacters
	adds r0, r4, r0
	strb r4, [r0]
_020124BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _020123F4
	ldrb r0, [r1]
	cmp r0, #5
	beq _020124D6
	ldr r0, _020124EC @ =gPlayer
	adds r0, #0x37
	ldrb r2, [r0]
	movs r1, #0x80
	orrs r1, r2
	strb r1, [r0]
_020124D6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020124E0: .4byte gUnknown_030054B4
_020124E4: .4byte gGameMode
_020124E8: .4byte gMultiplayerCharacters
_020124EC: .4byte gPlayer

	thumb_func_start Task_GameStage
Task_GameStage: @ 0x020124F0
	push {r4, r5, r6, r7, lr}
	ldr r0, _02012564 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1e
	ldr r0, _02012568 @ =gFrameCount
	ldr r1, _0201256C @ =gUnknown_03005418
	ldr r2, [r0]
	ldr r0, [r1]
	subs r3, r2, r0
	ldr r1, _02012570 @ =gStageTime
	ldr r0, [r1]
	subs r0, r3, r0
	mov ip, r0
	str r3, [r1]
	ldr r0, _02012574 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02012590
	ldr r2, _02012578 @ =0xFFFFFE00
	adds r1, r3, #0
	ands r1, r2
	mov r0, ip
	subs r4, r3, r0
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r5, _0201257C @ =gMultiplayerPseudoRandom
	ldr r1, [r5]
	ldr r0, _02012580 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02012584 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, _02012588 @ =0xFFFFF000
	ands r3, r0
	ands r4, r0
	ldr r6, _0201258C @ =gRandomItemBox
	cmp r3, r4
	beq _02012552
	ldrb r2, [r6]
	lsrs r1, r2, #4
	adds r1, #1
	movs r0, #0xf
	ands r0, r2
	lsls r1, r1, #4
	orrs r0, r1
	strb r0, [r6]
_02012552:
	ldr r1, [r5]
	movs r3, #7
	ldrb r2, [r6]
	movs r0, #0xf8
	ands r0, r2
	ands r1, r3
	orrs r0, r1
	strb r0, [r6]
	b _020125B0
	.align 2, 0
_02012564: .4byte 0x04000128
_02012568: .4byte gFrameCount
_0201256C: .4byte gUnknown_03005418
_02012570: .4byte gStageTime
_02012574: .4byte gGameMode
_02012578: .4byte 0xFFFFFE00
_0201257C: .4byte gMultiplayerPseudoRandom
_02012580: .4byte 0x00196225
_02012584: .4byte 0x3C6EF35F
_02012588: .4byte 0xFFFFF000
_0201258C: .4byte gRandomItemBox
_02012590:
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r3, #0
	ands r1, r2
	mov r4, ip
	subs r0, r3, r4
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r2, _020125E0 @ =gMultiplayerPseudoRandom
	ldr r1, [r2]
	ldr r0, _020125E4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _020125E8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
_020125B0:
	ldr r2, _020125EC @ =gCamera
	adds r0, r2, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0201262E
	ldr r0, _020125F0 @ =gInput
	ldrh r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r3
	cmp r0, r1
	bne _020125F4
	cmp r7, #3
	beq _0201261A
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #3
	strb r0, [r1]
	b _02012634
	.align 2, 0
_020125E0: .4byte gMultiplayerPseudoRandom
_020125E4: .4byte 0x00196225
_020125E8: .4byte 0x3C6EF35F
_020125EC: .4byte gCamera
_020125F0: .4byte gInput
_020125F4:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0201260C
	cmp r7, #0
	beq _02012624
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	b _02012634
_0201260C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0201262E
	cmp r7, #1
	bhi _02012624
_0201261A:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #2
	strb r0, [r1]
	b _02012634
_02012624:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #1
	strb r0, [r1]
	b _02012634
_0201262E:
	adds r0, r2, #0
	adds r0, #0x66
	strb r7, [r0]
_02012634:
	ldr r0, _02012694 @ =gMultiplayerConnections
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x66
	ldrb r2, [r1]
	asrs r0, r2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _0201264A
	strb r7, [r1]
_0201264A:
	ldr r1, _02012698 @ =gUnknown_030053E0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02012656
	subs r0, #1
	strb r0, [r1]
_02012656:
	ldr r0, _0201269C @ =gUnknown_03005400
	ldr r4, _020126A0 @ =gStageFlags
	ldrh r2, [r4]
	strh r2, [r0]
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	bne _0201268E
	ldr r0, _020126A4 @ =gCheckpointTime
	ldr r1, [r0]
	add r1, ip
	str r1, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0201268E
	ldr r1, _020126A8 @ =gCourseTime
	ldr r0, [r1]
	mov r3, ip
	subs r0, r0, r3
	str r0, [r1]
	cmp r0, #0
	bgt _0201268E
	movs r0, #1
	orrs r0, r2
	strh r0, [r4]
	bl CreateMultiplayerFinishHandler
_0201268E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012694: .4byte gMultiplayerConnections
_02012698: .4byte gUnknown_030053E0
_0201269C: .4byte gUnknown_03005400
_020126A0: .4byte gStageFlags
_020126A4: .4byte gCheckpointTime
_020126A8: .4byte gCourseTime

	thumb_func_start sub_020126AC
sub_020126AC: @ 0x020126AC
	push {lr}
	ldr r0, _020126DC @ =gUnknown_03005404
	movs r1, #0
	str r1, [r0]
	ldr r0, _020126E0 @ =gUnknown_030054B0
	strb r1, [r0]
	ldr r1, _020126E4 @ =gNumLives
	movs r0, #3
	strb r0, [r1]
	ldr r0, _020126E8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _020126CA
	movs r0, #1
	strb r0, [r1]
_020126CA:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #1
	movs r1, #2
	bl sub_020122F8
	pop {r0}
	bx r0
	.align 2, 0
_020126DC: .4byte gUnknown_03005404
_020126E0: .4byte gUnknown_030054B0
_020126E4: .4byte gNumLives
_020126E8: .4byte gGameMode

	thumb_func_start GameStageStart
GameStageStart: @ 0x020126EC
	push {lr}
	ldr r0, _02012750 @ =gUnknown_030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012754 @ =gUnknown_03005520
	strb r1, [r0]
	ldr r1, _02012758 @ =gRingCount
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0201275C @ =gUnknown_03005470
	movs r0, #1
	strb r0, [r1]
	ldr r1, _02012760 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012724
	ldr r0, _02012764 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _02012768 @ =gPlayer
	movs r2, #0
	bl CallSetStageSpawnPos
_02012724:
	ldr r0, _0201276C @ =gStageTime
	movs r3, #0
	str r3, [r0]
	ldr r2, _02012770 @ =gStageFlags
	ldrh r1, [r2]
	ldr r0, _02012774 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _02012778 @ =gUnknown_03005418
	ldr r0, _0201277C @ =gFrameCount
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _02012780 @ =gCheckpointTime
	str r3, [r0]
	ldr r1, _02012784 @ =gCourseTime
	ldr r0, _02012788 @ =0x00002A30
	str r0, [r1]
	bl CreateGameStage
	pop {r0}
	bx r0
	.align 2, 0
_02012750: .4byte gUnknown_030053F8
_02012754: .4byte gUnknown_03005520
_02012758: .4byte gRingCount
_0201275C: .4byte gUnknown_03005470
_02012760: .4byte gCurrentLevel
_02012764: .4byte gSelectedCharacter
_02012768: .4byte gPlayer
_0201276C: .4byte gStageTime
_02012770: .4byte gStageFlags
_02012774: .4byte 0x0000FF7F
_02012778: .4byte gUnknown_03005418
_0201277C: .4byte gFrameCount
_02012780: .4byte gCheckpointTime
_02012784: .4byte gCourseTime
_02012788: .4byte 0x00002A30

	thumb_func_start sub_0201278C
sub_0201278C: @ 0x0201278C
	push {r4, lr}
	ldr r4, _020127AC @ =gUnknown_030057D0
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	ldr r0, _020127B0 @ =gPlayer
	bl DestroyPlayerTasks
	bl DestroyCameraMovementTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020127AC: .4byte gUnknown_030057D0
_020127B0: .4byte gPlayer

	thumb_func_start TaskDestructor_GameStage
TaskDestructor_GameStage: @ 0x020127B4
	ldr r1, _020127BC @ =gUnknown_030057D0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_020127BC: .4byte gUnknown_030057D0

	thumb_func_start StageInit_CollectRings
StageInit_CollectRings: @ 0x020127C0
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start sub_020127CC
sub_020127CC: @ 0x020127CC
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start MultiPakCommunicationError
MultiPakCommunicationError: @ 0x020127D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _020128D0 @ =gMultiplayerMissingHeartbeats
	movs r4, #0
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	ldr r0, _020128D4 @ =gMultiSioEnabled
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r0, _020128D8 @ =0x0201299D
	movs r2, #0x80
	lsls r2, r2, #5
	str r4, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sb, r0
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r2, _020128DC @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _020128E0 @ =gDispCnt
	movs r2, #0x8d
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020128E4 @ =gBldRegs
	movs r6, #0
	strh r4, [r0]
	strh r4, [r0, #4]
	str r4, [sp, #4]
	ldr r2, _020128E8 @ =0x040000D4
	add r0, sp, #4
	str r0, [r2]
	ldr r1, _020128EC @ =gBgCntRegs
	mov r8, r1
	ldrh r1, [r1]
	movs r0, #0xc
	ands r0, r1
	lsls r0, r0, #0xc
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	str r0, [r2, #4]
	ldr r0, _020128F0 @ =0x85000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _020128F4 @ =gUnknown_03004D80
	strb r6, [r0]
	ldr r1, _020128F8 @ =gUnknown_03002280
	strb r6, [r1]
	strb r6, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _020128FC @ =0x00001E01
	mov r2, r8
	strh r0, [r2]
	ldr r7, _02012900 @ =gBgScrollRegs
	strh r4, [r7]
	strh r4, [r7, #2]
	ldr r0, _02012904 @ =gUnknown_03000040
	adds r2, r5, r0
	str r3, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _02012908 @ =0x0600F000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	movs r0, #4
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	ldr r1, _0201290C @ =gUnknown_0300006A
	adds r5, r5, r1
	strb r6, [r5]
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r0, _02012910 @ =0x00001F04
	mov r2, r8
	strh r0, [r2, #2]
	strh r4, [r7, #4]
	strh r4, [r7, #6]
	ldr r0, _02012914 @ =gMultiplayerLanguage
	ldrb r0, [r0]
	cmp r0, #1
	beq _0201291C
	cmp r0, #1
	bgt _02012928
	cmp r0, #0
	bne _02012928
	ldr r0, _02012918 @ =0x0000FFF8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_020128D0: .4byte gMultiplayerMissingHeartbeats
_020128D4: .4byte gMultiSioEnabled
_020128D8: .4byte 0x0201299D
_020128DC: .4byte gFlags
_020128E0: .4byte gDispCnt
_020128E4: .4byte gBldRegs
_020128E8: .4byte 0x040000D4
_020128EC: .4byte gBgCntRegs
_020128F0: .4byte 0x85000010
_020128F4: .4byte gUnknown_03004D80
_020128F8: .4byte gUnknown_03002280
_020128FC: .4byte 0x00001E01
_02012900: .4byte gBgScrollRegs
_02012904: .4byte gUnknown_03000040
_02012908: .4byte 0x0600F000
_0201290C: .4byte gUnknown_0300006A
_02012910: .4byte 0x00001F04
_02012914: .4byte gMultiplayerLanguage
_02012918: .4byte 0x0000FFF8
_0201291C:
	ldr r0, _02012924 @ =0x0000FFC8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_02012924: .4byte 0x0000FFC8
_02012928:
	ldr r1, _02012984 @ =gBgScrollRegs
	ldr r0, _02012988 @ =0x0000FFF8
	strh r0, [r1, #6]
_0201292E:
	mov r2, sb
	ldr r0, _0201298C @ =0x06004000
	str r0, [r2, #4]
	movs r4, #0
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _02012990 @ =0x0600F800
	str r1, [r2, #0xc]
	strh r0, [r2, #0x18]
	strh r0, [r2, #0x1a]
	movs r5, #3
	strh r5, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r0, [r2, #0x22]
	strh r0, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0xc
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r4, [r0]
	movs r4, #1
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r1, _02012994 @ =gWinRegs
	strh r5, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _02012998 @ =0x00003868
	strh r0, [r1, #4]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012984: .4byte gBgScrollRegs
_02012988: .4byte 0x0000FFF8
_0201298C: .4byte 0x06004000
_02012990: .4byte 0x0600F800
_02012994: .4byte gWinRegs
_02012998: .4byte 0x00003868
_0201299C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_8081200
sub_8081200: @ 0x020129A0
	push {lr}
	ldr r1, _020129F8 @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r0, _020129FC @ =gUnknown_030057C4
	movs r1, #0
	str r1, [r0]
	ldr r0, _02012A00 @ =gUnknown_030057D4
	str r1, [r0]
	ldr r0, _02012A04 @ =gUnknown_030057D0
	str r1, [r0]
	ldr r0, _02012A08 @ =gPlayer
	adds r0, #0x8c
	str r1, [r0]
	ldr r0, _02012A0C @ =gCamera
	str r1, [r0, #0x5c]
	ldr r0, _02012A10 @ =gUnknown_030053F0
	strb r1, [r0]
	ldr r0, _02012A14 @ =gEntitiesManagerTask
	str r1, [r0]
	ldr r3, _02012A18 @ =gMultiplayerPlayerTasks
	movs r2, #0
_020129CC:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _020129CC
	bl sub_020126AC
	ldr r2, _02012A08 @ =gPlayer
	adds r2, #0x5c
	ldr r1, _02012A1C @ =gPlayerControls
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_020129F8: .4byte gGameMode
_020129FC: .4byte gUnknown_030057C4
_02012A00: .4byte gUnknown_030057D4
_02012A04: .4byte gUnknown_030057D0
_02012A08: .4byte gPlayer
_02012A0C: .4byte gCamera
_02012A10: .4byte gUnknown_030053F0
_02012A14: .4byte gEntitiesManagerTask
_02012A18: .4byte gMultiplayerPlayerTasks
_02012A1C: .4byte gPlayerControls

	thumb_func_start GameInit
GameInit: @ 0x02012A20
	push {r4, r5, r6, r7, lr}
	ldr r1, _02012A7C @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02012A80 @ =gUnknown_03004D54
	ldr r0, _02012A84 @ =gBgOffsetsBuffer
	str r0, [r1]
	ldr r1, _02012A88 @ =gUnknown_030022C0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #0
	ldr r7, _02012A8C @ =gMultiSioEnabled
	ldr r0, _02012A90 @ =gMultiSioStatusFlags
	mov ip, r0
	ldr r6, _02012A94 @ =gMultiplayerCharacters
	movs r2, #0
	ldr r5, _02012A98 @ =gMPRingCollectWins
	ldr r4, _02012A9C @ =gUnknown_030054B4
	ldr r3, _02012AA0 @ =gMultiplayerMissingHeartbeats
_02012A4A:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r1, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _02012A4A
	movs r0, #1
	strb r0, [r7]
	mov r1, ip
	ldr r0, [r1]
	bl MultiSioInit
	bl MultiSioStart
	movs r0, #0
	bl CreateMultiplayerSinglePakResultsScreen
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012A7C: .4byte gGameMode
_02012A80: .4byte gUnknown_03004D54
_02012A84: .4byte gBgOffsetsBuffer
_02012A88: .4byte gUnknown_030022C0
_02012A8C: .4byte gMultiSioEnabled
_02012A90: .4byte gMultiSioStatusFlags
_02012A94: .4byte gMultiplayerCharacters
_02012A98: .4byte gMPRingCollectWins
_02012A9C: .4byte gUnknown_030054B4
_02012AA0: .4byte gMultiplayerMissingHeartbeats

	thumb_func_start sub_02012AA4
sub_02012AA4: @ 0x02012AA4
	push {lr}
	sub sp, #4
	ldr r0, _02012AC4 @ =sub_02012AE8
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, _02012AC8 @ =sub_02012AEC
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _02012ACC @ =gUnknown_030057D4
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02012AC4: .4byte sub_02012AE8
_02012AC8: .4byte sub_02012AEC
_02012ACC: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AD0
sub_02012AD0: @ 0x02012AD0
	push {r4, lr}
	ldr r4, _02012AE4 @ =gUnknown_030057D4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02012AE4: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AE8
sub_02012AE8: @ 0x02012AE8
	bx lr
	.align 2, 0

	thumb_func_start sub_02012AEC
sub_02012AEC: @ 0x02012AEC
	ldr r1, _02012AF4 @ =gUnknown_030057D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012AF4: .4byte gUnknown_030057D4
