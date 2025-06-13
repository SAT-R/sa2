.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _02009210 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r7, r5, #0
	adds r0, #0x38
	adds r0, r6, r0
	str r0, [sp]
	ldr r1, _02009214 @ =IWRAM_START + 0x56
	adds r3, r6, r1
	ldrb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _02009218 @ =gMultiSioRecv
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0200921C @ =gMultiSioStatusFlags
	mov sb, r4
	movs r4, #1
	adds r1, r4, #0
	lsls r1, r2
	mov r2, sb
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _02009154
	b _02009608
_02009154:
	ldr r0, _02009220 @ =IWRAM_START + 0x61
	adds r2, r6, r0
	movs r1, #0
	mov ip, r1
	mov r0, ip
	strb r0, [r2]
	adds r1, r4, #0
	ldrb r3, [r3]
	lsls r1, r3
	mov r3, sb
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _02009172
	b _02009608
_02009172:
	mov r4, r8
	ldrh r1, [r4]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	beq _02009180
	b _02009608
_02009180:
	mov r0, ip
	strb r0, [r2]
	ldr r0, _02009224 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0200918E
	b _02009290
_0200918E:
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r3, _02009228 @ =IWRAM_START + 0x50
	adds r3, r3, r6
	mov ip, r3
	movs r4, #0
	ldrsh r0, [r3, r4]
	subs r4, r1, r0
	str r4, [r5, #0x44]
	mov r0, r8
	movs r1, #4
	ldrsh r0, [r0, r1]
	mov sb, r0
	ldr r3, _0200922C @ =IWRAM_START + 0x52
	adds r2, r6, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r3, sb
	subs r1, r3, r0
	str r1, [r5, #0x48]
	adds r0, r4, #0
	cmp r4, #0
	bge _020091BE
	rsbs r0, r4, #0
_020091BE:
	mov r3, ip
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0xf
	ble _02009276
	adds r0, r1, #0
	cmp r1, #0
	bge _020091D0
	rsbs r0, r1, #0
_020091D0:
	ldr r2, _02009228 @ =IWRAM_START + 0x50
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r3, _0200922C @ =IWRAM_START + 0x52
	adds r3, r6, r3
	str r3, [sp, #8]
	cmp r0, #0xf
	ble _02009276
	cmp r4, #0
	ble _02009238
	cmp r1, #0
	ble _02009238
	mov r4, r8
	movs r6, #2
	ldrsh r0, [r4, r6]
	ldr r1, _02009230 @ =0xFFFFFA60
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	str r0, [r5, #0x44]
	ldr r4, [sp, #8]
	movs r6, #0
	ldrsh r1, [r4, r6]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	ldr r4, _02009234 @ =0xFFFFFCA0
	adds r0, r0, r4
	subs r1, r1, r0
	str r1, [r5, #0x48]
	b _02009276
	.align 2, 0
_02009210: .4byte gCurTask
_02009214: .4byte IWRAM_START + 0x56
_02009218: .4byte gMultiSioRecv
_0200921C: .4byte gMultiSioStatusFlags
_02009220: .4byte IWRAM_START + 0x61
_02009224: .4byte gGameMode
_02009228: .4byte IWRAM_START + 0x50
_0200922C: .4byte IWRAM_START + 0x52
_02009230: .4byte 0xFFFFFA60
_02009234: .4byte 0xFFFFFCA0
_02009238:
	ldr r0, [r7, #0x44]
	adds r6, r7, #0
	adds r6, #0x50
	str r6, [sp, #4]
	adds r1, r7, #0
	adds r1, #0x52
	str r1, [sp, #8]
	cmp r0, #0
	bge _02009276
	ldr r0, [r7, #0x48]
	cmp r0, #0
	bge _02009276
	mov r2, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r4, #0
	ldrsh r0, [r6, r4]
	ldr r6, _02009288 @ =0xFFFFFA60
	adds r0, r0, r6
	subs r1, r1, r0
	str r1, [r7, #0x44]
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r3, _0200928C @ =0xFFFFFCA0
	adds r0, r0, r3
	mov r4, r8
	movs r6, #4
	ldrsh r1, [r4, r6]
	subs r0, r0, r1
	str r0, [r7, #0x48]
_02009276:
	mov r1, r8
	ldrh r0, [r1, #2]
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldrh r0, [r1, #4]
	ldr r3, [sp, #8]
	strh r0, [r3]
	b _020092C2
	.align 2, 0
_02009288: .4byte 0xFFFFFA60
_0200928C: .4byte 0xFFFFFCA0
_02009290:
	mov r4, r8
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r2, _020092EC @ =IWRAM_START + 0x50
	adds r3, r6, r2
	movs r4, #0
	ldrsh r1, [r3, r4]
	subs r0, r0, r1
	str r0, [r5, #0x44]
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	ldr r4, _020092F0 @ =IWRAM_START + 0x52
	adds r2, r6, r4
	movs r6, #0
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	str r0, [r5, #0x48]
	mov r1, r8
	ldrh r0, [r1, #2]
	strh r0, [r3]
	ldrh r0, [r1, #4]
	strh r0, [r2]
	str r3, [sp, #4]
	str r2, [sp, #8]
_020092C2:
	ldr r0, [r7, #0x44]
	adds r1, r0, #0
	cmp r0, #0
	bge _020092CC
	rsbs r1, r0, #0
_020092CC:
	cmp r1, #0x40
	bgt _020092DC
	ldr r1, [r7, #0x48]
	cmp r1, #0
	bge _020092D8
	rsbs r1, r1, #0
_020092D8:
	cmp r1, #0x40
	ble _020092F4
_020092DC:
	adds r0, r7, #0
	adds r0, #0x66
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _02009304
	.align 2, 0
_020092EC: .4byte IWRAM_START + 0x50
_020092F0: .4byte IWRAM_START + 0x52
_020092F4:
	lsls r0, r0, #8
	adds r1, r7, #0
	adds r1, #0x66
	strh r0, [r1]
	ldr r0, [r7, #0x48]
	lsls r0, r0, #8
	adds r1, #2
	strh r0, [r1]
_02009304:
	adds r1, r7, #0
	adds r1, #0x57
	mov r2, r8
	ldrb r0, [r2, #0xa]
	strb r0, [r1]
	ldrh r2, [r2, #8]
	adds r0, r7, #0
	adds r0, #0x54
	strh r2, [r0]
	ldr r3, _02009338 @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	subs r1, #1
	lsrs r0, r0, #0x1e
	adds r6, r1, #0
	ldrb r4, [r6]
	cmp r0, r4
	beq _0200933C
	movs r0, #0xc0
	lsls r0, r0, #3
	ands r0, r2
	lsrs r0, r0, #9
	adds r1, #0xe
	strb r0, [r1]
	b _020093F4
	.align 2, 0
_02009338: .4byte 0x04000128
_0200933C:
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	adds r4, r7, #0
	adds r4, #0x64
	ldrb r2, [r4]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _020093F4
	ldr r1, _0200943C @ =gMultiplayerPlayerTasks
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	ldr r2, _02009440 @ =IWRAM_START + 0x64
	adds r1, r1, r2
	lsrs r0, r0, #0x1e
	ldrb r1, [r1]
	cmp r0, r1
	bne _020093F4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r4]
	ldr r4, _02009444 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	movs r3, #5
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	adds r1, #0x10
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _02009448 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _0200944C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
	ldr r0, _02009450 @ =Player_TouchGround
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r2, _02009454 @ =0xFFBFFFFF
	ands r0, r2
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	mov r3, sl
	ands r0, r3
	str r0, [r7, #0x5c]
	mov r1, sb
	ldr r0, [r1, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _020093F4
	ldr r0, [r4, #0x20]
	ands r0, r2
	str r0, [r4, #0x20]
	mov r2, sb
	ldr r0, [r2, #0x5c]
	ands r0, r3
	str r0, [r2, #0x5c]
_020093F4:
	ldr r0, _02009458 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r2, [r6]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	bne _02009460
	ldr r1, _0200945C @ =gMultiplayerCharRings
	adds r1, r2, r1
	mov r3, r8
	ldrh r0, [r3, #6]
	lsrs r0, r0, #8
	strb r0, [r1]
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #0xb]
	movs r2, #0xf
	ands r2, r0
	ldrh r0, [r5, #0xa]
	adds r3, r5, #0
	adds r3, #0x20
	cmp r0, r1
	bne _02009426
	ldrb r0, [r3]
	cmp r0, r2
	beq _0200942E
_02009426:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_0200942E:
	adds r0, r7, #0
	adds r0, #0x6a
	strh r1, [r0]
	strh r1, [r5, #0xa]
	strb r2, [r3]
	b _020095E2
	.align 2, 0
_0200943C: .4byte gMultiplayerPlayerTasks
_02009440: .4byte IWRAM_START + 0x64
_02009444: .4byte gPlayer
_02009448: .4byte 0xFFFFFBFF
_0200944C: .4byte 0xFFFFFEFF
_02009450: .4byte Player_TouchGround
_02009454: .4byte 0xFFBFFFFF
_02009458: .4byte 0x04000128
_0200945C: .4byte gMultiplayerCharRings
_02009460:
	ldr r1, _02009488 @ =gMultiplayerCharRings
	adds r1, r2, r1
	mov r2, r8
	ldrh r0, [r2, #6]
	lsrs r0, r0, #8
	strb r0, [r1]
	ldrb r1, [r2, #6]
	adds r0, r7, #0
	adds r0, #0x6a
	strh r1, [r0]
	ldrh r2, [r5, #0xa]
	subs r0, r1, #2
	cmp r0, #0x35
	bls _0200947E
	b _020095C0
_0200947E:
	lsls r0, r0, #2
	ldr r1, _0200948C @ =_02009490
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02009488: .4byte gMultiplayerCharRings
_0200948C: .4byte _02009490
_02009490: @ jump table
	.4byte _02009568 @ case 0
	.4byte _0200957C @ case 1
	.4byte _0200957C @ case 2
	.4byte _020095C0 @ case 3
	.4byte _020095C0 @ case 4
	.4byte _020095C0 @ case 5
	.4byte _020095C0 @ case 6
	.4byte _02009590 @ case 7
	.4byte _0200957C @ case 8
	.4byte _0200957C @ case 9
	.4byte _020095C0 @ case 10
	.4byte _020095C0 @ case 11
	.4byte _020095C0 @ case 12
	.4byte _020095C0 @ case 13
	.4byte _020095C0 @ case 14
	.4byte _020095C0 @ case 15
	.4byte _020095C0 @ case 16
	.4byte _020095C0 @ case 17
	.4byte _020095C0 @ case 18
	.4byte _020095C0 @ case 19
	.4byte _020095C0 @ case 20
	.4byte _020095C0 @ case 21
	.4byte _020095C0 @ case 22
	.4byte _020095C0 @ case 23
	.4byte _020095C0 @ case 24
	.4byte _020095C0 @ case 25
	.4byte _020095C0 @ case 26
	.4byte _020095C0 @ case 27
	.4byte _020095C0 @ case 28
	.4byte _020095C0 @ case 29
	.4byte _020095C0 @ case 30
	.4byte _020095C0 @ case 31
	.4byte _020095C0 @ case 32
	.4byte _020095C0 @ case 33
	.4byte _020095C0 @ case 34
	.4byte _020095C0 @ case 35
	.4byte _020095C0 @ case 36
	.4byte _020095C0 @ case 37
	.4byte _020095C0 @ case 38
	.4byte _020095C0 @ case 39
	.4byte _020095C0 @ case 40
	.4byte _020095C0 @ case 41
	.4byte _020095C0 @ case 42
	.4byte _020095C0 @ case 43
	.4byte _020095C0 @ case 44
	.4byte _020095C0 @ case 45
	.4byte _020095C0 @ case 46
	.4byte _020095C0 @ case 47
	.4byte _020095C0 @ case 48
	.4byte _020095C0 @ case 49
	.4byte _020095C0 @ case 50
	.4byte _020095C0 @ case 51
	.4byte _020095C0 @ case 52
	.4byte _020095A4 @ case 53
_02009568:
	ldr r0, _02009578 @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	b _020095CA
	.align 2, 0
_02009578: .4byte gUnknown_02015B18
_0200957C:
	ldr r0, _0200958C @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #3
	b _020095CA
	.align 2, 0
_0200958C: .4byte gUnknown_02015B18
_02009590:
	ldr r0, _020095A0 @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #2
	b _020095CA
	.align 2, 0
_020095A0: .4byte gUnknown_02015B18
_020095A4:
	ldr r1, _020095B8 @ =gUnknown_02015B18
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #2
	strh r0, [r5, #0xa]
	ldr r0, _020095BC @ =0x0000FFFF
	strh r0, [r5, #0x1e]
	b _020095CC
	.align 2, 0
_020095B8: .4byte gUnknown_02015B18
_020095BC: .4byte 0x0000FFFF
_020095C0:
	ldr r0, _02009604 @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_020095CA:
	strh r0, [r5, #0xa]
_020095CC:
	ldrh r3, [r5, #0xa]
	cmp r2, r3
	beq _020095DA
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_020095DA:
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
_020095E2:
	mov r4, r8
	ldrb r0, [r4, #0xb]
	lsrs r0, r0, #4
	adds r1, r7, #0
	adds r1, #0x58
	strb r0, [r1]
	mov r6, r8
	ldrb r0, [r6, #0xc]
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	ldrb r0, [r6, #0xd]
	lsls r0, r0, #2
	ldr r1, [sp]
	strh r0, [r1]
	b _02009684
	.align 2, 0
_02009604: .4byte gUnknown_02015B18
_02009608:
	adds r3, r7, #0
	adds r3, #0x50
	adds r0, r7, #0
	adds r0, #0x66
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r3]
	adds r0, r0, r2
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x52
	adds r0, r7, #0
	adds r0, #0x68
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r2]
	adds r0, r0, r4
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x61
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0x1e
	bls _02009684
	ldr r1, _0200966C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _02009670 @ =gBackgroundsCopyQueueCursor
	ldr r0, _02009674 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02009678 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200967C @ =gVramGraphicsCopyCursor
	ldr r0, _02009680 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _02009AC8
	.align 2, 0
_0200966C: .4byte 0x0000FFFF
_02009670: .4byte gBackgroundsCopyQueueCursor
_02009674: .4byte gBackgroundsCopyQueueIndex
_02009678: .4byte gUnknown_03005390
_0200967C: .4byte gVramGraphicsCopyCursor
_02009680: .4byte gVramGraphicsCopyQueueIndex
_02009684:
	movs r2, #3
	ldr r3, _0200975C @ =gPlayerCharacterIdleAnims
	movs r6, #6
	ldrsh r0, [r3, r6]
	ldrh r1, [r5, #0xa]
	movs r4, #0x54
	adds r4, r4, r7
	mov r8, r4
	ldr r4, _02009760 @ =gCamera
	cmp r0, r1
	ble _020096B6
_0200969A:
	lsls r0, r2, #0x18
	movs r6, #0xff
	lsls r6, r6, #0x18
	adds r0, r0, r6
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _020096B6
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, r1
	bgt _0200969A
_020096B6:
	ldr r1, [r4]
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r4, #4]
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r4]
	ldrh r0, [r2]
	subs r0, r0, r1
	ldr r6, [sp]
	strh r0, [r6, #6]
	ldr r1, [r4, #4]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r6, #8]
	mov r0, r8
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _020096FA
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_020096FA:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	ldr r0, _02009764 @ =gStageFlags
	ldrh r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _02009778
	ldr r0, [r7, #0x54]
	ldr r1, _02009768 @ =0x80000004
	ands r0, r1
	cmp r0, #0
	bne _02009778
	ldr r2, _0200976C @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _020097BE
	ldr r0, [r7, #0x5c]
	ands r0, r3
	cmp r0, #0
	bne _02009778
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02009778
	ldr r0, [r2, #0x20]
	ldr r1, _02009770 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _02009778
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _02009774 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _020097E2
	bl sub_8018120
	b _020097E2
	.align 2, 0
_0200975C: .4byte gPlayerCharacterIdleAnims
_02009760: .4byte gCamera
_02009764: .4byte gStageFlags
_02009768: .4byte 0x80000004
_0200976C: .4byte gPlayer
_02009770: .4byte 0x00400080
_02009774: .4byte 0x04000128
_02009778:
	ldr r2, _02009824 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _020097BE
	adds r0, r7, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _020097BE
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bne _020097BE
	ldr r0, [r2, #0x20]
	ands r0, r3
	cmp r0, #0
	bne _020097BE
	ldr r1, _02009828 @ =gUnknown_030054B4
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _020097E2
_020097BE:
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _020097E2
	ldr r0, [r2, #0x3c]
	cmp r0, r5
	bne _020097E2
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r1, r7, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_020097E2:
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02009856
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r2, _0200982C @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	ldrh r1, [r6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02009830
	movs r0, #0xff
	lsls r0, r0, #8
	ldr r1, [sp]
	strh r0, [r1, #2]
	b _02009838
	.align 2, 0
_02009824: .4byte gPlayer
_02009828: .4byte gUnknown_030054B4
_0200982C: .4byte gUnknown_030054B8
_02009830:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp]
	strh r0, [r2, #2]
_02009838:
	mov r3, r8
	ldrh r1, [r3]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200984C
	ldr r4, [sp]
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_0200984C:
	adds r0, r5, #0
	ldr r1, [sp]
	bl TransformSprite
	b _0200989C
_02009856:
	ldr r2, [r5, #0x10]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r5, #0x10]
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02009874
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	b _02009878
_02009874:
	ldr r0, _02009890 @ =0xFFFFFBFF
	ands r2, r0
_02009878:
	str r2, [r5, #0x10]
	mov r0, r8
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _02009894
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0200989A
	.align 2, 0
_02009890: .4byte 0xFFFFFBFF
_02009894:
	ldr r0, [r5, #0x10]
	ldr r1, _020099D8 @ =0xFFFFF7FF
	ands r0, r1
_0200989A:
	str r0, [r5, #0x10]
_0200989C:
	ldr r1, [r5, #0x10]
	ldr r0, _020099DC @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r5, #0x10]
	mov r3, r8
	ldrh r2, [r3]
	movs r0, #0x30
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r5, #0x10]
	ldrh r3, [r3]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _020098BE
	b _02009AB8
_020098BE:
	ldr r0, _020099E0 @ =gStageTime
	ldr r0, [r0]
	movs r6, #2
	ands r0, r6
	adds r4, r7, #0
	adds r4, #0x57
	cmp r0, #0
	bne _02009916
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _02009916
	ldr r2, [r7, #0x5c]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _02009916
	ldr r1, _020099E4 @ =gUnknown_030054B4
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02009916
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _02009904
	b _02009AB8
_02009904:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _0200990E
	b _02009AB8
_0200990E:
	ands r2, r6
	cmp r2, #0
	beq _02009916
	b _02009AB8
_02009916:
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #0x80
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	cmp r0, #0
	beq _0200992E
	movs r3, #0x88
	lsls r3, r3, #3
	adds r1, r3, #0
_0200992E:
	strh r1, [r5, #0x1a]
	ldr r6, [r5, #0x10]
	ldr r0, _020099E8 @ =0xFFFFFE7F
	ands r6, r0
	str r6, [r5, #0x10]
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020099B2
	ldr r0, _020099EC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _0200997A
	ldr r0, _020099F0 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _020099F4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _020099B2
_0200997A:
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	bne _020099B2
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _020099F4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _020099B2
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r6, r0
	str r6, [r5, #0x10]
	ldr r2, _020099F8 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _020099FC @ =gWinRegs
	ldr r0, _02009A00 @ =0x0000083F
	strh r0, [r1, #0xa]
_020099B2:
	ldrh r0, [r5, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _02009A04
	movs r6, #0x18
	ldrsh r1, [r5, r6]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _02009A04
	cmp r1, #0xdf
	bgt _02009A04
	adds r0, r5, #0
	bl DisplaySprite
	b _02009AB8
	.align 2, 0
_020099D8: .4byte 0xFFFFF7FF
_020099DC: .4byte 0xFFFFCFFF
_020099E0: .4byte gStageTime
_020099E4: .4byte gUnknown_030054B4
_020099E8: .4byte 0xFFFFFE7F
_020099EC: .4byte gGameMode
_020099F0: .4byte gMultiplayerConnections
_020099F4: .4byte 0x04000128
_020099F8: .4byte gDispCnt
_020099FC: .4byte gWinRegs
_02009A00: .4byte 0x0000083F
_02009A04:
	ldr r0, _02009A48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02009AB8
	ldr r0, _02009A4C @ =gCamera
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #2
	cmp r0, r1
	ble _02009A58
	ldr r3, _02009A50 @ =0xFFFFFA60
	adds r0, r3, #0
	ldrh r4, [r5, #0x16]
	adds r1, r0, r4
	strh r1, [r5, #0x16]
	ldr r6, [sp]
	ldrh r6, [r6, #6]
	adds r0, r0, r6
	ldr r1, [sp]
	strh r0, [r1, #6]
	ldr r2, _02009A54 @ =0xFFFFFCA0
	adds r0, r2, #0
	ldrh r3, [r5, #0x18]
	adds r1, r0, r3
	strh r1, [r5, #0x18]
	ldr r4, [sp]
	ldrh r4, [r4, #8]
	adds r0, r0, r4
	ldr r6, [sp]
	strh r0, [r6, #8]
	b _02009A80
	.align 2, 0
_02009A48: .4byte gGameMode
_02009A4C: .4byte gCamera
_02009A50: .4byte 0xFFFFFA60
_02009A54: .4byte 0xFFFFFCA0
_02009A58:
	movs r1, #0xb4
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r2, [r5, #0x16]
	adds r1, r0, r2
	strh r1, [r5, #0x16]
	ldr r3, [sp]
	ldrh r3, [r3, #6]
	adds r0, r0, r3
	ldr r4, [sp]
	strh r0, [r4, #6]
	movs r6, #0xd8
	lsls r6, r6, #2
	adds r0, r6, #0
	ldrh r2, [r5, #0x18]
	adds r1, r0, r2
	strh r1, [r5, #0x18]
	ldrh r3, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
_02009A80:
	ldrh r0, [r5, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _02009AB8
	movs r4, #0x18
	ldrsh r1, [r5, r4]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _02009AB8
	cmp r1, #0xdf
	bgt _02009AB8
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02009AB2
	adds r0, r5, #0
	ldr r1, [sp]
	bl TransformSprite
_02009AB2:
	adds r0, r5, #0
	bl DisplaySprite
_02009AB8:
	ldr r4, _02009AD8 @ =gShouldSpawnMPAttack2Effect
	ldrb r0, [r4]
	cmp r0, #0
	beq _02009AC8
	bl CreateMPAttack2Effect
	movs r0, #0
	strb r0, [r4]
_02009AC8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009AD8: .4byte gShouldSpawnMPAttack2Effect

	
.syntax divided
