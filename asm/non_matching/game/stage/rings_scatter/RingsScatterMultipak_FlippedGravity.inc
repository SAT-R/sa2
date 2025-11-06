.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _08020694 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020698 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, _0802069C @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080206A0 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r1, #0
	mov sl, r1
_08020554:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0802055C
	b _0802068A
_0802055C:
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
	asrs r6, r1, #8
	asrs r7, r0, #8
	ldr r1, _080206A4 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	str r0, [sp, #0x14]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r2, _080206A8 @ =gPlayer
	mov ip, r2
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	ldrh r4, [r5, #0xc]
	mov r8, r4
	mov r0, sl
	adds r0, #1
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r8, r1
	ble _080205A4
	b _080207E8
_080205A4:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _080205BC
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080205BC
	b _080206C0
_080205BC:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080205CA
	b _080206C0
_080205CA:
	adds r4, r2, #0
	adds r4, #0x38
	adds r2, r6, #0
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080205EC
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _080205F8
	cmp r2, r1
	blt _080206C0
_080205EC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_080205F8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020614
	cmp r7, r1
	bge _08020620
	cmp r2, r1
	blt _080206C0
_08020614:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_08020620:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _080206AC @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _080206B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020672
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020672
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020672
	ldr r1, _080206B8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802066A
	movs r0, #0xff
_0802066A:
	strb r0, [r1]
	ldr r1, _080206BC @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_08020672:
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020686
	ldr r1, _080206AC @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020686
	movs r0, #0xff
	strh r0, [r1]
_08020686:
	movs r0, #0
	strh r0, [r5, #0xc]
_0802068A:
	adds r5, #0x14
	mov r2, sl
	adds r2, #1
	str r2, [sp, #0x1c]
	b _08020966
	.align 2, 0
_08020694: .4byte gCurTask
_08020698: .4byte IWRAM_START + 0x30
_0802069C: .4byte IWRAM_START + 0x2B0
_080206A0: .4byte IWRAM_START + 0x2B4
_080206A4: .4byte gCamera
_080206A8: .4byte gPlayer
_080206AC: .4byte gRingCount
_080206B0: .4byte gCurrentLevel
_080206B4: .4byte gGameMode
_080206B8: .4byte gNumLives
_080206BC: .4byte gMusicManagerState
_080206C0:
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	mov r4, sl
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	cmp r8, r0
	ble _080206D4
	b _080207E8
_080206D4:
	movs r1, #0
	mov r8, r1
_080206D8:
	ldr r0, _08020708 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r8, r0
	beq _080207D8
	ldr r1, _0802070C @ =gMultiplayerPlayerTasks
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080207D8
	ldrh r4, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r3, r4
	mov ip, r3
	ldr r0, _08020710 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020714
	ldrb r0, [r3, #0xa]
	b _08020738
	.align 2, 0
_08020708: .4byte 0x04000128
_0802070C: .4byte gMultiplayerPlayerTasks
_08020710: .4byte gGameMode
_08020714:
	mov r0, ip
	ldrb r1, [r0, #0xa]
	ldr r2, _080207CC @ =gPlayerCharacterIdleAnims
	mov sl, r2
	ldr r2, _080207D0 @ =gMultiplayerCharacters
	ldr r3, _080207D4 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020738:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020750
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080207D8
_08020750:
	adds r3, r6, #0
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020774
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _08020786
	cmp r3, r1
	blt _080207D8
_08020774:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_08020786:
	adds r3, r7, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _080207A8
	cmp r7, r1
	bge _080207BA
	cmp r3, r1
	blt _080207D8
_080207A8:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_080207BA:
	lsls r0, r6, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _08020962
	.align 2, 0
_080207CC: .4byte gPlayerCharacterIdleAnims
_080207D0: .4byte gMultiplayerCharacters
_080207D4: .4byte IWRAM_START + 0x56
_080207D8:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080207E8
	b _080206D8
_080207E8:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020826
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020826
	adds r0, r7, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _080208D0 @ =sub_801EC3C
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020826
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020826:
	ldr r4, [sp, #4]
	ldr r1, _080208D4 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020870
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020870
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020870
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _080208D0 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020870
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020870:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	subs r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x14]
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802094A
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	cmp r1, r0
	ble _0802094A
	cmp r1, #0xa7
	bgt _0802094A
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080208A0
	ldr r0, _080208D8 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802094A
_080208A0:
	mov r2, sb
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _080208B2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080208DC
_080208B2:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x14]
	mov r4, sb
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x18]
	strh r1, [r4, #0x18]
	mov r0, sb
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x10]
	b _0802094A
	.align 2, 0
_080208D0: .4byte sub_801EC3C
_080208D4: .4byte 0x000002B6
_080208D8: .4byte gStageTime
_080208DC:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020980 @ =gOamMallocBuffer
	adds r4, r0, r1
	mov r3, sb
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08020984 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0802094A
	ldr r1, _08020988 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0802098C @ =0x80000003
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
	ldr r4, [sp, #0x18]
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
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r4, _08020990 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_0802094A:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020994 @ =0x0000FFFC
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
_08020962:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x20]
_08020966:
	ldr r3, [sp, #0x1c]
	mov sl, r3
	cmp r3, #0x1f
	bgt _08020970
	b _08020554
_08020970:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020980: .4byte gOamMallocBuffer
_08020984: .4byte iwram_end
_08020988: .4byte 0x040000D4
_0802098C: .4byte 0x80000003
_08020990: .4byte 0x000001FF
_08020994: .4byte 0x0000FFFC

.syntax divided
