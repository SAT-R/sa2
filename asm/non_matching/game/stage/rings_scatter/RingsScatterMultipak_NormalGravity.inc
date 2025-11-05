.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _080209E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _080209EC @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sl, r2
	ldr r3, _080209F0 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080209F4 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sl
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x14]
_080209D8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _080209F8
	adds r5, #0x14
	ldr r2, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_080209E8: .4byte gCurTask
_080209EC: .4byte IWRAM_START + 0x30
_080209F0: .4byte IWRAM_START + 0x2B0
_080209F4: .4byte IWRAM_START + 0x2B4
_080209F8:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r1, r1, #8
	mov sb, r1
	mov r8, sb
	asrs r6, r0, #8
	ldr r1, _08020B34 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	str r0, [sp, #0x1c]
	ldr r3, _08020B38 @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020A44
	b _08020C70
_08020A44:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020A5C
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020A5C
	b _08020B50
_08020A5C:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020B50
	adds r4, r2, #0
	adds r4, #0x38
	mov r2, sb
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020A8A
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08020A96
	cmp r2, r1
	blt _08020B50
_08020A8A:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020A96:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020AB2
	cmp r6, r1
	bge _08020ABE
	cmp r2, r1
	blt _08020B50
_08020AB2:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020ABE:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08020B3C @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020B40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020B12
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020B12
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020B12
	ldr r1, _08020B48 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020B0A
	movs r0, #0xff
_08020B0A:
	strb r0, [r1]
	ldr r1, _08020B4C @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_08020B12:
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020B26
	ldr r1, _08020B3C @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020B26
	movs r0, #0xff
	strh r0, [r1]
_08020B26:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_08020B34: .4byte gCamera
_08020B38: .4byte gPlayer
_08020B3C: .4byte gRingCount
_08020B40: .4byte gCurrentLevel
_08020B44: .4byte gGameMode
_08020B48: .4byte gNumLives
_08020B4C: .4byte gMusicManagerState
_08020B50:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020B64
	b _08020C70
_08020B64:
	movs r7, #0
_08020B66:
	ldr r0, _08020B94 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08020C64
	ldr r1, _08020B98 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08020C64
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08020B9C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020BA0
	ldrb r0, [r2, #0xa]
	b _08020BC2
	.align 2, 0
_08020B94: .4byte 0x04000128
_08020B98: .4byte gMultiplayerPlayerTasks
_08020B9C: .4byte gGameMode
_08020BA0:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _08020C58 @ =gMultiplayerCharacters
	ldr r3, _08020C5C @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08020C60 @ =gPlayerCharacterIdleAnims
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020BC2:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020BDA
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08020C64
_08020BDA:
	mov r3, r8
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
	bgt _08020BFE
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020C10
	cmp r3, r1
	blt _08020C64
_08020BFE:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C10:
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
	bgt _08020C32
	cmp r6, r1
	bge _08020C44
	cmp r3, r1
	blt _08020C64
_08020C32:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C44:
	mov r1, r8
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _08020DEA
	.align 2, 0
_08020C58: .4byte gMultiplayerCharacters
_08020C5C: .4byte IWRAM_START + 0x56
_08020C60: .4byte gPlayerCharacterIdleAnims
_08020C64:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08020C70
	b _08020B66
_08020C70:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020CAA
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CAA
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08020D58 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sb
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020CAA
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CAA:
	ldr r4, [sp, #4]
	ldr r1, _08020D5C @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020CF8
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020CF8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CF8
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08020D58 @ =sub_801EC3C
	str r1, [sp]
	mov r1, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020CF8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CF8:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020DD2
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	ble _08020DD2
	cmp r1, #0xa7
	bgt _08020DD2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020D28
	ldr r0, _08020D60 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020DD2
_08020D28:
	mov r2, sl
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _08020D3A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020D64
_08020D3A:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x18]
	mov r4, sl
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x1c]
	strh r1, [r4, #0x18]
	mov r0, sl
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x10]
	b _08020DD2
	.align 2, 0
_08020D58: .4byte sub_801EC3C
_08020D5C: .4byte 0x000002B6
_08020D60: .4byte gStageTime
_08020D64:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020E08 @ =gOamMallocBuffer
	adds r4, r0, r1
	mov r3, sl
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08020E0C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020DD2
	ldr r1, _08020E10 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020E14 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sl
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x1c]
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
	mov r4, sl
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _08020E18 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020DD2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020E1C @ =0x0000FFFC
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
_08020DEA:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_08020DEE:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x14]
	cmp r3, #0x1f
	bgt _08020DF8
	b _080209D8
_08020DF8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020E08: .4byte gOamMallocBuffer
_08020E0C: .4byte iwram_end
_08020E10: .4byte 0x040000D4
_08020E14: .4byte 0x80000003
_08020E18: .4byte 0x000001FF
_08020E1C: .4byte 0x0000FFFC

.syntax divided
