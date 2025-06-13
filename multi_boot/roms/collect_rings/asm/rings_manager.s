.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start Task_RingsMgrMain
Task_RingsMgrMain: @ 0x02007DE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r5, _02008100 @ =gPlayer
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _02008104 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02007E2A
	b _02008418
_02007E2A:
	ldr r0, _02008108 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0200810C @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x14]
	adds r0, r1, #0
	bl UpdateSpriteAnimation
	ldr r3, [sp, #0x14]
	ldr r3, [r3, #0xc]
	str r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	adds r4, #4
	ldm r4!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldm r4!, {r0}
	str r4, [sp, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r6, _02008100 @ =gPlayChew
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r0, sp
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _02007E8C
	b _02008048
_02007E8C:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blo _02007E94
	b _02008048
_02007E94:
	mov r1, sp
	str r1, [sp, #0x20]
_02007E98:
	ldr r3, _02008100 @ =gPlayer
	ldr r2, [r3, #8]
	asrs r1, r2, #8
	ldr r4, [sp, #0x20]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	subs r0, #8
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	ldr r3, [r3, #0xc]
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x3c]
	cmp r7, r0
	ble _02007EC4
	b _02008026
_02007EC4:
	ldr r0, [sp, #8]
	cmp r7, r0
	blo _02007ECC
	b _02008026
_02007ECC:
	ldr r1, [sp, #8]
	mov r0, sl
	muls r0, r1, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r7, #1
	str r6, [sp, #0x38]
	cmp r0, #0
	bne _02007EE8
	b _02008006
_02007EE8:
	subs r0, #8
	adds r5, r4, r0
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _02007EF6
	b _02008006
_02007EF6:
	mov r0, sp
	str r0, [sp, #0x24]
_02007EFA:
	cmp r1, #0xfe
	beq _02007FF4
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	movs r3, #0
	cmp r3, #0
	bne _02007F32
	ldr r0, _02008110 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02007FF4
	ldr r4, _02008100 @ =gPlayer
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _02007FF4
_02007F32:
	mov r2, sb
	subs r2, #8
	ldr r6, _02008100 @ =gPlayer
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [sp, #0x24]
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02007F54
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _02007F62
	cmp r2, r1
	blt _02007FF4
_02007F54:
	ldr r4, [sp, #0x24]
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02007FF4
_02007F62:
	mov r2, r8
	subs r2, #0x10
	ldr r6, _02008100 @ =gPlayer
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	ldr r1, [sp, #0x24]
	movs r3, #1
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02007F80
	cmp r8, r1
	bge _02007F8E
	cmp r2, r1
	blt _02007FF4
_02007F80:
	ldr r4, [sp, #0x24]
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02007FF4
_02007F8E:
	ldr r1, _02008114 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _02008110 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02007FCC
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _02007FCC
	ldr r0, _02008118 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _02007FCC
	ldr r1, _0200811C @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _02007FCC
	adds r0, #1
	strb r0, [r1]
_02007FCC:
	ldr r0, _02008118 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02007FE0
	ldr r1, _02008114 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _02007FE0
	movs r0, #0xff
	strh r0, [r1]
_02007FE0:
	mov r6, sb
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0xfe
	strb r0, [r5]
_02007FF4:
	adds r5, #2
	ldrb r1, [r5]
	adds r0, r1, #0
	ldr r4, _02008100 @ =gPlayer
	ldr r3, [r4, #0xc]
	ldr r2, [r4, #8]
	cmp r0, #0xff
	beq _02008006
	b _02007EFA
_02008006:
	ldr r6, [sp, #0x38]
	lsls r0, r6, #0x10
	lsrs r7, r0, #0x10
	asrs r1, r2, #8
	ldr r4, [sp, #0x20]
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp r7, r0
	bgt _02008026
	ldr r6, [sp, #8]
	cmp r7, r6
	bhs _02008026
	b _02007ECC
_02008026:
	ldr r1, [sp, #0x3c]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	asrs r1, r3, #8
	ldr r2, [sp, #0x20]
	movs r0, #3
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _02008048
	ldr r3, [sp, #0xc]
	cmp sl, r3
	bhs _02008048
	b _02007E98
_02008048:
	ldr r0, _02008118 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _02008052
	b _0200827C
_02008052:
	movs r2, #0
_02008054:
	ldr r0, _02008120 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r4, r2, #1
	str r4, [sp, #0x30]
	cmp r2, r0
	bne _02008066
	b _02008270
_02008066:
	ldr r1, _02008124 @ =gMultiplayerPlayerTasks
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _02008074
	b _02008270
_02008074:
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r4, r2, r6
	ldr r1, _02008128 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r6, #0x2d
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r3, _0200812C @ =IWRAM_START + 0x2F
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _020080AC
	b _02008270
_020080AC:
	ldr r6, [sp, #0xc]
	cmp sl, r6
	blo _020080B4
	b _02008270
_020080B4:
	ldr r0, _02008130 @ =IWRAM_START + 0x50
	adds r0, r2, r0
	str r0, [sp, #0x28]
	ldr r1, _02008134 @ =IWRAM_START + 0x2C
	adds r1, r2, r1
	str r1, [sp, #0x2c]
	subs r3, #1
	adds r3, r2, r3
	str r3, [sp, #0x44]
_020080C6:
	ldr r6, [sp, #0x28]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	subs r1, #8
	lsls r1, r1, #8
	lsrs r7, r1, #0x10
	ldr r3, [sp, #0x44]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r1, r1, r0
	adds r1, #0x10
	asrs r1, r1, #8
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x3c]
	adds r0, r4, #0
	adds r0, #0x52
	str r0, [sp, #0x40]
	adds r2, r4, #0
	adds r2, #0x2f
	str r2, [sp, #0x34]
	cmp r7, r1
	ble _020080FE
	b _0200824A
_020080FE:
	b _02008242
	.align 2, 0
_02008100: .4byte gPlayer
_02008104: .4byte gStageFlags
_02008108: .4byte gCurTask
_0200810C: .4byte IWRAM_START + 0x30
_02008110: .4byte gCurrentLevel
_02008114: .4byte gRingCount
_02008118: .4byte gGameMode
_0200811C: .4byte gNumLives
_02008120: .4byte 0x04000128
_02008124: .4byte gMultiplayerPlayerTasks
_02008128: .4byte IWRAM_START + 0x52
_0200812C: .4byte IWRAM_START + 0x2F
_02008130: .4byte IWRAM_START + 0x50
_02008134: .4byte IWRAM_START + 0x2C
_02008138:
	ldr r6, [sp, #8]
	mov r0, sl
	muls r0, r6, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r3, r7, #1
	str r3, [sp, #0x38]
	cmp r0, #0
	beq _02008226
	subs r0, #8
	adds r5, r2, r0
	b _0200821E
_02008158:
	cmp r1, #0xfe
	beq _0200821C
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r6, sl
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	mov r2, sb
	subs r2, #8
	ldr r1, [sp, #0x28]
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r6, [sp, #0x2c]
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02008194
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _020081A2
	cmp r2, r1
	blt _0200821C
_02008194:
	ldr r6, [sp, #0x44]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0200821C
_020081A2:
	mov r2, r8
	subs r2, #0x10
	ldr r1, [sp, #0x40]
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _020081C2
	cmp r8, r1
	bge _020081D0
	cmp r2, r1
	blt _0200821C
_020081C2:
	ldr r6, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0200821C
_020081D0:
	ldrb r1, [r4, #0xa]
	ldr r3, _020082D0 @ =gPlayerCharacterIdleAnims
	ldr r2, _020082D4 @ =gMultiplayerCharacters
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0xe4
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _02008208
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0200821C
_02008208:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0xfe
	strb r0, [r5]
_0200821C:
	adds r5, #2
_0200821E:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _02008158
_02008226:
	ldr r3, [sp, #0x38]
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	ldr r6, [sp, #0x28]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, [sp, #0x44]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp r7, r0
	bgt _0200824A
_02008242:
	ldr r3, [sp, #8]
	cmp r7, r3
	bhs _0200824A
	b _02008138
_0200824A:
	ldr r6, [sp, #0x3c]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp, #0x40]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _02008270
	ldr r6, [sp, #0xc]
	cmp sl, r6
	bhs _02008270
	b _020080C6
_02008270:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0200827C
	b _02008054
_0200827C:
	ldr r2, _020082D8 @ =gCamera
	ldr r1, [r2, #4]
	lsls r0, r1, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #8
	adds r1, #0xa0
	cmp r0, r1
	blt _02008290
	b _02008418
_02008290:
	ldr r2, [sp, #0xc]
	cmp sl, r2
	blo _02008298
	b _02008418
_02008298:
	ldr r3, _020082D8 @ =gCamera
	ldr r0, [r3]
	lsls r1, r0, #8
	lsrs r7, r1, #0x10
	lsls r1, r7, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _020082AA
	b _020083FA
_020082AA:
	ldr r4, [sp, #8]
	cmp r7, r4
	blo _020082B2
	b _020083FA
_020082B2:
	ldr r6, [sp, #8]
	mov r0, sl
	muls r0, r6, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _020082CA
	b _020083E0
_020082CA:
	subs r0, #8
	adds r5, r2, r0
	b _020083D6
	.align 2, 0
_020082D0: .4byte gPlayerCharacterIdleAnims
_020082D4: .4byte gMultiplayerCharacters
_020082D8: .4byte gCamera
_020082DC:
	cmp r1, #0xfe
	beq _02008318
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r1, r1, r0
	mov r8, r1
	ldr r4, _0200831C @ =gCamera
	ldr r0, [r4]
	mov r6, sb
	subs r0, r6, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _02008318
	ldr r0, [r4, #4]
	mov r1, r8
	subs r0, r1, r0
	cmp r0, #0
	blt _02008318
	subs r0, #0x10
	cmp r0, #0xa0
	ble _02008320
_02008318:
	adds r5, #2
	b _020083D6
	.align 2, 0
_0200831C: .4byte gCamera
_02008320:
	adds r5, #2
	ldr r2, [sp, #0x14]
	adds r2, #0x23
	ldr r3, [sp, #0x18]
	cmp r3, #0
	beq _02008334
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _02008358
_02008334:
	movs r0, #0xff
	strb r0, [r2]
	ldr r4, _02008354 @ =gCamera
	ldr r0, [r4]
	mov r6, sb
	subs r0, r6, r0
	ldr r1, [sp, #0x14]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #4]
	mov r2, r8
	subs r0, r2, r0
	strh r0, [r1, #0x18]
	ldr r0, [sp, #0x14]
	bl DisplaySprite
	b _020083CC
	.align 2, 0
_02008354: .4byte gCamera
_02008358:
	ldrb r1, [r1]
	lsls r1, r1, #3
	ldr r0, _02008428 @ =gOamBuffer2
	adds r6, r1, r0
	ldr r3, [sp, #0x14]
	ldrh r0, [r3, #0x1a]
	movs r4, #0xf8
	lsls r4, r4, #3
	adds r1, r4, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r4, r0, #0
	ldr r0, _0200842C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	beq _02008418
	ldr r1, _02008430 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _02008434 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _02008438 @ =gCamera
	ldr r0, [r6, #4]
	mov r1, r8
	subs r0, r1, r0
	ldr r6, [sp, #0x1c]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _02008438 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _0200843C @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_020083CC:
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
_020083D6:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _020083E0
	b _020082DC
_020083E0:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r2, _02008438 @ =gCamera
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _020083FA
	ldr r3, [sp, #8]
	cmp r7, r3
	bhs _020083FA
	b _020082B2
_020083FA:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r4, _02008438 @ =gCamera
	ldr r0, [r4, #4]
	adds r0, #0xa0
	cmp r1, r0
	bge _02008418
	ldr r6, [sp, #0xc]
	cmp sl, r6
	bhs _02008418
	b _02008298
_02008418:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02008428: .4byte gOamBuffer2
_0200842C: .4byte iwram_end
_02008430: .4byte 0x040000D4
_02008434: .4byte 0x80000003
_02008438: .4byte gCamera
_0200843C: .4byte 0x000001FF
