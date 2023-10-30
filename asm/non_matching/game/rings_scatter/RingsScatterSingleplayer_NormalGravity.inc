.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0802032C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020330 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _08020334 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _08020338 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r2, #0x1f
	str r2, [sp, #0x14]
_080201F8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020200
	b _080204DC
_08020200:
	movs r4, #8
	ldrsh r1, [r5, r4]
	ldr r0, _0802033C @ =gUnknown_030054FC
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r2, [r5]
	adds r2, r2, r1
	str r2, [r5]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	ldr r0, _08020340 @ =gUnknown_030054E0
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	asrs r2, r2, #8
	mov r8, r2
	mov ip, r8
	asrs r7, r0, #8
	ldr r1, _08020344 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov sl, r0
	ldr r4, _08020348 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _08020248
	b _08020360
_08020248:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0802025E
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0802025E
	b _08020360
_0802025E:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802026A
	b _08020360
_0802026A:
	adds r6, r2, #0
	adds r6, #0x38
	mov r2, r8
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0802028C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020298
	cmp r2, r1
	blt _08020360
_0802028C:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_08020298:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080202B2
	cmp r7, r1
	bge _080202BE
	cmp r2, r1
	blt _08020360
_080202B2:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_080202BE:
	mov r2, ip
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _0802034C @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020350 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020312
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020312
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020312
	ldr r1, _08020358 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802030A
	movs r0, #0xff
_0802030A:
	strb r0, [r1]
	ldr r1, _0802035C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020312:
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020326
	ldr r1, _0802034C @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020326
	movs r0, #0xff
	strh r0, [r1]
_08020326:
	movs r0, #0
	b _080204DA
	.align 2, 0
_0802032C: .4byte gCurTask
_08020330: .4byte IWRAM_START + 0x30
_08020334: .4byte IWRAM_START + 0x2B0
_08020338: .4byte IWRAM_START + 0x2B4
_0802033C: .4byte gUnknown_030054FC
_08020340: .4byte gUnknown_030054E0
_08020344: .4byte gCamera
_08020348: .4byte gPlayer
_0802034C: .4byte gRingCount
_08020350: .4byte gCurrentLevel
_08020354: .4byte gGameMode
_08020358: .4byte gNumLives
_0802035C: .4byte gUnknown_030054A8
_08020360:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	ble _0802039A
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802039A
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	ldr r0, _08020448 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802039A
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802039A:
	ldr r1, [sp, #4]
	ldr r2, _0802044C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080203E8
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _080203E8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080203E8
	adds r0, r7, #0
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _08020448 @ =sub_801EC3C
	str r1, [sp]
	mov r1, r8
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080203E8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080203E8:
	ldrh r0, [r5, #0xa]
	ldr r2, [sp, #8]
	adds r0, r0, r2
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _080204C2
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _080204C2
	mov r4, sl
	cmp r4, #0xa7
	bgt _080204C2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020418
	ldr r0, _08020450 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080204C2
_08020418:
	mov r2, sb
	adds r2, #0x23
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0802042A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020454
_0802042A:
	movs r0, #0xff
	strb r0, [r2]
	mov r1, sp
	ldrh r2, [r1, #0x18]
	mov r1, sb
	strh r2, [r1, #0x16]
	mov r4, sl
	strh r4, [r1, #0x18]
	mov r0, sb
	bl DisplaySprite
	movs r0, #1
	str r0, [sp, #0x10]
	b _080204C2
	.align 2, 0
_08020448: .4byte sub_801EC3C
_0802044C: .4byte 0x000002B6
_08020450: .4byte gStageTime
_08020454:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080204FC @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08020500 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _080204C2
	ldr r1, _08020504 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020508 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
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
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _0802050C @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_080204C2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020510 @ =0x0000FFFC
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
_080204DA:
	strh r0, [r5, #0xc]
_080204DC:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _080204EA
	b _080201F8
_080204EA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080204FC: .4byte gUnknown_030022D0
_08020500: .4byte iwram_end
_08020504: .4byte 0x040000D4
_08020508: .4byte 0x80000003
_0802050C: .4byte 0x000001FF
_08020510: .4byte 0x0000FFFC

.syntax divided
