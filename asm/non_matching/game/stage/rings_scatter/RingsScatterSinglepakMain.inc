.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _08020E70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020E74 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _08020E78 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _08020E7C @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x18]
_08020E60:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020E80
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08020E70: .4byte gCurTask
_08020E74: .4byte IWRAM_START + 0x30
_08020E78: .4byte IWRAM_START + 0x2B0
_08020E7C: .4byte IWRAM_START + 0x2B4
_08020E80:
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
	bls _08020EAE
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _0802131E
_08020EAE:
	ldr r0, _08020ECC @ =0x0000EFFF
	cmp r2, r0
	bgt _08020ED4
	ldr r0, _08020ED0 @ =0x00011FFF
	cmp r3, r0
	bgt _08020ED4
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _08020EF2
	.align 2, 0
_08020ECC: .4byte 0x0000EFFF
_08020ED0: .4byte 0x00011FFF
_08020ED4:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _08020EF4
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08020EF4
	ldr r3, _08021020 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _08021024 @ =0xFFFCA000
	adds r0, r1, r4
_08020EF2:
	str r0, [r5, #4]
_08020EF4:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r6, r0, #8
	ldr r1, _08021028 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r6, r0
	mov r8, r0
	ldr r3, _0802102C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08020F30
	b _08021164
_08020F30:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020F48
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020F48
	b _08021044
_08020F48:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08021044
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
	bgt _08020F76
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _08020F82
	cmp r2, r1
	blt _08021044
_08020F76:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020F82:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F9E
	cmp r6, r1
	bge _08020FAA
	cmp r2, r1
	blt _08021044
_08020F9E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020FAA:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08021030 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08021034 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020FFE
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020FFE
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020FFE
	ldr r1, _0802103C @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020FF6
	movs r0, #0xff
_08020FF6:
	strb r0, [r1]
	ldr r1, _08021040 @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_08020FFE:
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021012
	ldr r1, _08021030 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08021012
	movs r0, #0xff
	strh r0, [r1]
_08021012:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08021020: .4byte 0xFFFA6000
_08021024: .4byte 0xFFFCA000
_08021028: .4byte gCamera
_0802102C: .4byte gPlayer
_08021030: .4byte gRingCount
_08021034: .4byte gCurrentLevel
_08021038: .4byte gGameMode
_0802103C: .4byte gNumLives
_08021040: .4byte gMusicManagerState
_08021044:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08021058
	b _08021164
_08021058:
	movs r7, #0
_0802105A:
	ldr r0, _08021088 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08021158
	ldr r1, _0802108C @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08021158
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08021090 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021094
	ldrb r0, [r2, #0xa]
	b _080210B6
	.align 2, 0
_08021088: .4byte 0x04000128
_0802108C: .4byte gMultiplayerPlayerTasks
_08021090: .4byte gGameMode
_08021094:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _0802114C @ =gMultiplayerCharacters
	ldr r3, _08021150 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08021154 @ =gPlayerCharacterIdleAnims
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_080210B6:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080210CE
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08021158
_080210CE:
	mov r3, sb
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _080210F2
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08021104
	cmp r3, r1
	blt _08021158
_080210F2:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021104:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08021126
	cmp r6, r1
	bge _08021138
	cmp r3, r1
	blt _08021158
_08021126:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021138:
	mov r1, sb
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _0802131A
	.align 2, 0
_0802114C: .4byte gMultiplayerCharacters
_08021150: .4byte IWRAM_START + 0x56
_08021154: .4byte gPlayerCharacterIdleAnims
_08021158:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08021164
	b _0802105A
_08021164:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0802119E
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802119E
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08021220 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802119E
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802119E:
	ldr r4, [sp, #4]
	ldr r1, _08021224 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080211EC
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _080211EC
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080211EC
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08021220 @ =sub_801EC3C
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080211EC
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080211EC:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #0xc]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802120A
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _0802120A
	mov r0, r8
	cmp r0, #0xa7
	ble _0802123C
_0802120A:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08021230
	ldr r1, _08021228 @ =0xFFFFFA60
	add sl, r1
	ldr r2, _0802122C @ =0xFFFFFCA0
	add r8, r2
	b _0802123C
	.align 2, 0
_08021220: .4byte sub_801EC3C
_08021224: .4byte 0x000002B6
_08021228: .4byte 0xFFFFFA60
_0802122C: .4byte 0xFFFFFCA0
_08021230:
	movs r3, #0xb4
	lsls r3, r3, #3
	add sl, r3
	movs r4, #0xd8
	lsls r4, r4, #2
	add r8, r4
_0802123C:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _08021302
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _08021302
	mov r0, r8
	cmp r0, #0xa7
	bgt _08021302
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08021264
	ldr r0, _08021290 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021302
_08021264:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _08021276
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08021294
_08021276:
	movs r0, #0xff
	strb r0, [r2]
	mov r3, sl
	ldr r2, [sp, #8]
	strh r3, [r2, #0x16]
	mov r4, r8
	strh r4, [r2, #0x18]
	ldr r0, [sp, #8]
	bl DisplaySprite
	movs r0, #1
	str r0, [sp, #0x14]
	b _08021302
	.align 2, 0
_08021290: .4byte gStageTime
_08021294:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08021338 @ =gOamMallocBuffer
	adds r4, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _0802133C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08021302
	ldr r1, _08021340 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08021344 @ =0x80000003
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
	ldr r4, _08021348 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08021302:
	ldrh r1, [r5, #0x10]
	ldr r2, _0802134C @ =0x0000FFFC
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
_0802131A:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_0802131E:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _08021328
	b _08020E60
_08021328:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021338: .4byte gOamMallocBuffer
_0802133C: .4byte iwram_end
_08021340: .4byte 0x040000D4
_08021344: .4byte 0x80000003
_08021348: .4byte 0x000001FF
_0802134C: .4byte 0x0000FFFC

.syntax divided
