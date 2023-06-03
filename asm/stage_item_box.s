.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_800B580
sub_800B580: @ 0x0800B580
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _0800B59C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bls _0800B590
	b _0800B6FA
_0800B590:
	lsls r0, r0, #2
	ldr r1, _0800B5A0 @ =_0800B5A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B59C: .4byte gGameMode
_0800B5A0: .4byte _0800B5A4
_0800B5A4: @ jump table
	.4byte _0800B5BC @ case 0
	.4byte _0800B5BC @ case 1
	.4byte _0800B5BC @ case 2
	.4byte _0800B62C @ case 3
	.4byte _0800B62C @ case 4
	.4byte _0800B6C4 @ case 5
_0800B5BC:
	cmp r2, #0
	bne _0800B5C2
	b _0800B6FA
_0800B5C2:
	adds r3, r4, #0
	adds r3, #0x76
	ldrb r0, [r3]
	cmp r0, #0
	bne _0800B5F4
	ldr r2, _0800B5EC @ =ItemBox_1UpIcons
	ldr r3, _0800B5F0 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	movs r1, #0
	ldrsb r1, [r3, r1]
	b _0800B60A
	.align 2, 0
_0800B5EC: .4byte ItemBox_1UpIcons
_0800B5F0: .4byte gSelectedCharacter
_0800B5F4:
	ldr r2, _0800B628 @ =ItemBox_MysteryIcons
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r1, [r3]
_0800B60A:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_8004558
	b _0800B6FA
	.align 2, 0
_0800B628: .4byte ItemBox_MysteryIcons
_0800B62C:
	ldr r3, _0800B6AC @ =gUnknown_03005590
	cmp r2, #0
	bne _0800B63C
	ldr r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0800B6FA
_0800B63C:
	ldr r0, _0800B6B0 @ =gUnknown_080D51E4
	ldr r1, [r3]
	lsrs r1, r1, #5
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0xd
	bne _0800B680
	ldr r5, _0800B6B4 @ =gUnknown_080D51F4
	ldr r0, _0800B6B8 @ =gMultiplayerPseudoRandom
	ldr r2, [r0]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _0800B6BC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #6
	bne _0800B680
	cmp r1, #8
	bne _0800B680
	lsrs r0, r2, #2
	movs r1, #3
	bl __umodsi3
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
_0800B680:
	adds r0, r4, #0
	adds r0, #0x76
	strb r1, [r0]
	ldr r2, _0800B6C0 @ =ItemBox_MysteryIcons
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r3, r4, #0
	adds r3, #0x46
	strh r1, [r3]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
	b _0800B6FA
	.align 2, 0
_0800B6AC: .4byte gUnknown_03005590
_0800B6B0: .4byte gUnknown_080D51E4
_0800B6B4: .4byte gUnknown_080D51F4
_0800B6B8: .4byte gMultiplayerPseudoRandom
_0800B6BC: .4byte gCurrentLevel
_0800B6C0: .4byte ItemBox_MysteryIcons
_0800B6C4:
	cmp r2, #0
	beq _0800B6FA
	ldr r2, _0800B700 @ =ItemBox_MysteryIcons
	adds r3, r4, #0
	adds r3, #0x76
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
_0800B6FA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B700: .4byte ItemBox_MysteryIcons

	thumb_func_start Task_800B704
Task_800B704: @ 0x0800B704
	push {r4, lr}
	ldr r0, _0800B730 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0800B734 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B738
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B738
	adds r0, r4, #0
	bl sub_800B828
	b _0800B778
	.align 2, 0
_0800B730: .4byte gCurTask
_0800B734: .4byte gGameMode
_0800B738:
	adds r0, r4, #0
	bl sub_800B8F4
	cmp r0, #0
	beq _0800B74A
	adds r0, r4, #0
	bl sub_800B1AC
	b _0800B752
_0800B74A:
	adds r0, r4, #0
	movs r1, #0
	bl sub_800B580
_0800B752:
	adds r0, r4, #0
	bl sub_800B8AC
	cmp r0, #0
	beq _0800B770
	ldr r1, [r4]
	ldrb r0, [r4, #8]
	strb r0, [r1]
	ldr r0, _0800B76C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800B778
	.align 2, 0
_0800B76C: .4byte gCurTask
_0800B770:
	adds r0, r4, #0
	movs r1, #0
	bl sub_800B860
_0800B778:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Task_800B780
Task_800B780: @ 0x0800B780
	push {r4, lr}
	ldr r0, _0800B7A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x77
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0800B7AC
	adds r0, r4, #0
	bl ApplyItemboxEffect
	b _0800B7BA
	.align 2, 0
_0800B7A8: .4byte gCurTask
_0800B7AC:
	ldr r2, _0800B7C8 @ =IWRAM_START + 0x74
	adds r1, r3, r2
	ldr r2, _0800B7CC @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0800B7BA:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800B860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7C8: .4byte IWRAM_START + 0x74
_0800B7CC: .4byte 0xFFFFFF00

	thumb_func_start Task_800B7D0
Task_800B7D0: @ 0x0800B7D0
	push {r4, lr}
	ldr r4, _0800B7F8 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x77
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _0800B7FC
	ldr r0, [r4]
	bl TaskDestroy
	b _0800B804
	.align 2, 0
_0800B7F8: .4byte gCurTask
_0800B7FC:
	adds r0, r3, #0
	movs r1, #1
	bl sub_800B860
_0800B804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_800B80C
TaskDestructor_800B80C: @ 0x0800B80C
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_800B828
sub_800B828: @ 0x0800B828
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x70]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r4, #0x77
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800B858 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B85C @ =Task_800B950
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B858: .4byte gCurTask
_0800B85C: .4byte Task_800B950

	thumb_func_start sub_800B860
sub_800B860: @ 0x0800B860
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x6c]
	ldr r2, _0800B8A8 @ =gCamera
	ldr r0, [r2]
	subs r3, r3, r0
	strh r3, [r4, #0x22]
	ldr r0, [r4, #0x70]
	ldr r2, [r2, #4]
	subs r0, r0, r2
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x52
	strh r3, [r0]
	adds r0, #0x22
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	cmp r1, #0
	bne _0800B89A
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_0800B89A:
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B8A8: .4byte gCamera

	thumb_func_start sub_800B8AC
sub_800B8AC: @ 0x0800B8AC
	push {lr}
	ldr r1, [r0, #0x6c]
	ldr r3, _0800B8E8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x70]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0800B8E4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0800B8E4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800B8EC
_0800B8E4:
	movs r0, #1
	b _0800B8EE
	.align 2, 0
_0800B8E8: .4byte gCamera
_0800B8EC:
	movs r0, #0
_0800B8EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B8F4
sub_800B8F4: @ 0x0800B8F4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _0800B924 @ =gPlayer
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800B93C
	adds r6, r4, #0
	adds r6, #0xc
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	adds r0, r6, #0
	bl sub_800C944
	adds r5, r0, #0
	cmp r5, #0
	beq _0800B928
	adds r1, r4, #0
	adds r1, #0x78
	movs r0, #1
	strb r0, [r1]
	b _0800B948
	.align 2, 0
_0800B924: .4byte gPlayer
_0800B928:
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	bne _0800B940
_0800B93C:
	movs r0, #0
	b _0800B948
_0800B940:
	adds r0, r4, #0
	adds r0, #0x78
	strb r5, [r0]
	movs r0, #1
_0800B948:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_800B950
Task_800B950: @ 0x0800B950
	push {r4, lr}
	ldr r0, _0800B978 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x77
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0800B97C
	adds r0, r4, #0
	bl sub_800B9A0
	b _0800B98A
	.align 2, 0
_0800B978: .4byte gCurTask
_0800B97C:
	ldr r2, _0800B998 @ =IWRAM_START + 0x74
	adds r1, r3, r2
	ldr r2, _0800B99C @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0800B98A:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800B860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B998: .4byte IWRAM_START + 0x74
_0800B99C: .4byte 0xFFFFFF00

	thumb_func_start sub_800B9A0
sub_800B9A0: @ 0x0800B9A0
	adds r0, #0x77
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800B9B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B9B4 @ =Task_800B7D0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0800B9B0: .4byte gCurTask
_0800B9B4: .4byte Task_800B7D0
