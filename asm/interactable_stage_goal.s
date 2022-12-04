.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_StageGoal
initSprite_Interactable_StageGoal: @ 0x080626DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080627B0 @ =sub_80627CC
	ldr r2, _080627B4 @ =0x00002010
	ldr r1, _080627B8 @ =TaskDestructor_8062E7C
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _080627BC @ =IWRAM_START + 0xC
	adds r5, r2, r1
	movs r7, #0
	movs r3, #0
	mov sl, r3
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r3, r8
	strb r3, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r1]
	movs r0, #4
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x85
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r0, _080627C0 @ =IWRAM_START + 0x2C
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r3, _080627C4 @ =IWRAM_START + 0x2D
	adds r1, r2, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #1
	strh r0, [r5, #0x1a]
	mov r0, sl
	strh r0, [r5, #8]
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x1c]
	adds r3, #1
	adds r1, r2, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080627C8 @ =IWRAM_START + 0x31
	adds r2, r2, r0
	strb r7, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080627B0: .4byte sub_80627CC
_080627B4: .4byte 0x00002010
_080627B8: .4byte TaskDestructor_8062E7C
_080627BC: .4byte IWRAM_START + 0xC
_080627C0: .4byte IWRAM_START + 0x2C
_080627C4: .4byte IWRAM_START + 0x2D
_080627C8: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80627CC
sub_80627CC: @ 0x080627CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08062840 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r5, r0
	ldr r1, _08062844 @ =IWRAM_START + 0xC
	adds r4, r5, r1
	ldr r7, [r3]
	ldrb r1, [r3, #8]
	lsls r1, r1, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov ip, r1
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r6, r1, r0
	ldr r1, _08062848 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r0, r2, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	subs r2, r6, r1
	strh r2, [r4, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	mov r8, sb
	cmp r0, r1
	bhi _08062832
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08062832
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0806284C
_08062832:
	ldrb r0, [r3, #8]
	strb r0, [r7]
	mov r2, r8
	ldr r0, [r2]
	bl TaskDestroy
	b _08062890
	.align 2, 0
_08062840: .4byte gCurTask
_08062844: .4byte IWRAM_START + 0xC
_08062848: .4byte gCamera
_0806284C:
	ldr r3, _080628A0 @ =gPlayer
	ldr r1, [r3, #0x20]
	ldr r0, _080628A4 @ =0x00400080
	ands r1, r0
	cmp r1, #0
	bne _0806288A
	str r3, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	mov r1, ip
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #1
	bne _0806288A
	movs r0, #0x85
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _080628A8 @ =IWRAM_START + 0x2C
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080628AC @ =IWRAM_START + 0x2D
	adds r1, r5, r2
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _080628B0 @ =sub_80628B4
	str r0, [r1, #8]
_0806288A:
	adds r0, r4, #0
	bl sub_80051E8
_08062890:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080628A0: .4byte gPlayer
_080628A4: .4byte 0x00400080
_080628A8: .4byte IWRAM_START + 0x2C
_080628AC: .4byte IWRAM_START + 0x2D
_080628B0: .4byte sub_80628B4

	thumb_func_start sub_80628B4
sub_80628B4: @ 0x080628B4
	push {r4, r5, r6, r7, lr}
	ldr r4, _08062918 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0806291C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r6, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0806290A
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0806290A
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08062920
_0806290A:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, [r4]
	bl TaskDestroy
	b _0806292C
	.align 2, 0
_08062918: .4byte gCurTask
_0806291C: .4byte gCamera
_08062920:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0806292C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8062934
sub_8062934: @ 0x08062934
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080629A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [sp]
	ldrb r2, [r0, #8]
	mov sl, r2
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, sl
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	ldr r1, [sp]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _080629A4 @ =gGameMode
	ldrb r5, [r0]
	cmp r5, #2
	bls _080629B4
	ldr r2, _080629A8 @ =gPlayer
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r7, r0
	ble _08062980
	b _08062A96
_08062980:
	ldr r0, [r2, #0x20]
	ldr r1, _080629AC @ =0x8000008
	ands r0, r1
	cmp r0, #0
	beq _0806298C
	b _08062A96
_0806298C:
	adds r0, r2, #0
	adds r0, #0x6d
	movs r1, #0xa
	strb r1, [r0]
	ldr r0, _080629B0 @ =gUnknown_030054D0
	str r7, [r0]
	bl sub_8062B00
	b _08062A96
	.align 2, 0
_080629A0: .4byte gCurTask
_080629A4: .4byte gGameMode
_080629A8: .4byte gPlayer
_080629AC: .4byte 0x8000008
_080629B0: .4byte gUnknown_030054D0
_080629B4:
	ldr r4, _08062A08 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	cmp r7, r0
	bgt _08062A96
	ldr r3, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r3
	cmp r0, #0
	bne _08062A96
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0xa
	strb r0, [r1]
	ldr r2, _08062A0C @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x21
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08062A10 @ =gUnknown_030054D0
	str r7, [r0]
	cmp r5, #0
	bne _08062A96
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08062A96
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	ble _08062A96
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08062A14
	movs r3, #0xc8
	mov r8, r3
	b _08062A3E
	.align 2, 0
_08062A08: .4byte gPlayer
_08062A0C: .4byte gUnknown_03005424
_08062A10: .4byte gUnknown_030054D0
_08062A14:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r1, r0
	bgt _08062A24
	movs r0, #0x96
	lsls r0, r0, #1
	mov r8, r0
	b _08062A3E
_08062A24:
	movs r0, #0xa0
	lsls r0, r0, #4
	movs r2, #0xc8
	lsls r2, r2, #2
	mov r8, r2
	cmp r1, r0
	bgt _08062A38
	movs r3, #0xfa
	lsls r3, r3, #1
	mov r8, r3
_08062A38:
	mov r0, r8
	cmp r0, #0
	beq _08062A96
_08062A3E:
	ldr r1, _08062AE0 @ =gUnknown_03005450
	ldr r5, [r1]
	mov r2, r8
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08062AE4 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08062A86
	ldr r0, _08062AE8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062A86
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08062AEC @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08062A7E
	movs r0, #0xff
_08062A7E:
	strb r0, [r1]
	ldr r1, _08062AF0 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08062A86:
	ldr r1, _08062AF4 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r1, #0xc]
	asrs r1, r1, #8
	mov r2, r8
	bl sub_801F3A4
_08062A96:
	ldr r1, _08062AF8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	mov r1, sb
	subs r1, r1, r0
	mov sb, r1
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08062AC0
	mov r0, sb
	adds r0, #0x80
	cmp r0, #0
	blt _08062AC0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp sb, r0
	ble _08062ACE
_08062AC0:
	mov r3, sl
	ldr r2, [sp]
	strb r3, [r2]
	ldr r0, _08062AFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08062ACE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062AE0: .4byte gUnknown_03005450
_08062AE4: .4byte 0x0000C350
_08062AE8: .4byte gGameMode
_08062AEC: .4byte gUnknown_03005448
_08062AF0: .4byte gUnknown_030054A8
_08062AF4: .4byte gPlayer
_08062AF8: .4byte gCamera
_08062AFC: .4byte gCurTask

	thumb_func_start sub_8062B00
sub_8062B00: @ 0x08062B00
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r6, _08062BB0 @ =gMultiplayerPlayerTasks
	ldr r0, _08062BB4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0xc0
	lsls r7, r7, #0x12
	adds r5, r0, r7
	ldr r2, _08062BB8 @ =gPlayer
	adds r3, r2, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r3]
	strh r4, [r2, #0x32]
	ldr r0, [r5, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08062BAA
	ldr r0, [r6]
	cmp r0, #0
	beq _08062B60
	adds r1, r6, #0
	adds r3, r1, #0
	adds r3, #0xc
	movs r2, #1
_08062B44:
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	ldr r0, [r0, #0x5c]
	ands r0, r2
	cmp r0, #0
	beq _08062B54
	adds r4, #1
_08062B54:
	adds r1, #4
	cmp r1, r3
	bhi _08062B60
	ldr r0, [r1]
	cmp r0, #0
	bne _08062B44
_08062B60:
	ldr r0, _08062BB4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, [r5, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x5c]
	cmp r4, #0
	bne _08062B8E
	ldr r2, _08062BBC @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08062BC0 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08062B8E:
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
	ldr r0, _08062BC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08062BC8 @ =sub_8062D44
	str r0, [r1, #8]
	ldr r1, _08062BCC @ =gCamera
	adds r1, #0x50
	ldrh r2, [r1]
	movs r0, #4
	orrs r0, r2
	strh r0, [r1]
_08062BAA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062BB0: .4byte gMultiplayerPlayerTasks
_08062BB4: .4byte 0x04000128
_08062BB8: .4byte gPlayer
_08062BBC: .4byte gUnknown_03005424
_08062BC0: .4byte gUnknown_03005490
_08062BC4: .4byte gCurTask
_08062BC8: .4byte sub_8062D44
_08062BCC: .4byte gCamera

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 0x08062BD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r3, _08062C44 @ =gMultiplayerPlayerTasks
	ldr r5, _08062C48 @ =0x04000128
	ldr r0, [r5]
	ldr r2, _08062C4C @ =gPlayer
	adds r4, r2, #0
	adds r4, #0x37
	ldrb r1, [r4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	strh r1, [r2, #0x32]
	movs r4, #0
	ldr r0, [r3]
	mov sb, r3
	cmp r0, #0
	beq _08062C66
	ldr r0, _08062C50 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r7, #0x10
	adds r6, r5, #0
	ldr r2, _08062C54 @ =gUnknown_030054B4
	mov ip, r2
	mov r5, sb
_08062C0C:
	adds r2, r7, #0
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r7, #0
	lsls r1, r0
	ands r1, r3
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r1, r0
	cmp r2, r1
	beq _08062C58
	mov r1, ip
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08062C58
	movs r2, #1
	mov r8, r2
	b _08062C66
	.align 2, 0
_08062C44: .4byte gMultiplayerPlayerTasks
_08062C48: .4byte 0x04000128
_08062C4C: .4byte gPlayer
_08062C50: .4byte gMultiplayerConnections
_08062C54: .4byte gUnknown_030054B4
_08062C58:
	adds r5, #4
	adds r4, #1
	cmp r4, #3
	bhi _08062C66
	ldr r0, [r5]
	cmp r0, #0
	bne _08062C0C
_08062C66:
	movs r4, #0
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	beq _08062CF4
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	movs r7, #0x10
	ldr r6, _08062CC0 @ =0x04000128
	movs r5, #0
_08062C7C:
	ldr r0, _08062CC4 @ =gUnknown_030054B4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _08062CDC
	ldr r0, _08062CC8 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r2, r7, #0
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	adds r0, r7, #0
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	bne _08062CCC
	lsrs r0, r5, #0x18
	mov r2, r8
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	b _08062CDC
	.align 2, 0
_08062CC0: .4byte 0x04000128
_08062CC4: .4byte gUnknown_030054B4
_08062CC8: .4byte gMultiplayerConnections
_08062CCC:
	lsrs r0, r5, #0x18
	movs r2, #1
	mov r1, r8
	eors r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
_08062CDC:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #3
	bhi _08062CF4
	ldr r0, _08062D2C @ =gMultiplayerPlayerTasks
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08062C7C
_08062CF4:
	ldr r1, _08062D30 @ =gUnknown_03005424
	ldrh r0, [r1]
	movs r4, #4
	orrs r0, r4
	strh r0, [r1]
	ldr r1, _08062D34 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
	ldr r0, _08062D38 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08062D3C @ =sub_8062D44
	str r0, [r1, #8]
	ldr r0, _08062D40 @ =gCamera
	adds r0, #0x50
	ldrh r1, [r0]
	orrs r4, r1
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062D2C: .4byte gMultiplayerPlayerTasks
_08062D30: .4byte gUnknown_03005424
_08062D34: .4byte gUnknown_03005490
_08062D38: .4byte gCurTask
_08062D3C: .4byte sub_8062D44
_08062D40: .4byte gCamera

	thumb_func_start sub_8062D44
sub_8062D44: @ 0x08062D44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08062E14 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	movs r4, #0
	ldr r1, _08062E18 @ =gUnknown_030054B4
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08062E08
	movs r3, #0
	ldr r0, _08062E1C @ =gMultiplayerPlayerTasks
	ldr r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08062D98
	movs r6, #0x80
	lsls r6, r6, #1
	adds r2, r5, #0
_08062D76:
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	ldr r1, _08062E20 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08062D8A
	adds r4, #1
_08062D8A:
	adds r2, #4
	adds r3, #1
	cmp r3, #3
	bhi _08062D98
	ldr r0, [r2]
	cmp r0, #0
	bne _08062D76
_08062D98:
	cmp r4, #0
	beq _08062E08
	subs r0, r3, #1
	cmp r4, r0
	bhs _08062DAA
	ldr r0, _08062E24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08062E08
_08062DAA:
	ldr r0, [r5]
	cmp r0, #0
	beq _08062DFC
	mov ip, r5
	movs r6, #1
	ldr r5, _08062E28 @ =gPlayer
	movs r0, #0x5c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, _08062E24 @ =gGameMode
	mov r4, ip
_08062DC0:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r2, [r1, #0x5c]
	adds r3, r2, #0
	ands r3, r6
	cmp r3, #0
	bne _08062DEC
	ldrb r0, [r7]
	cmp r0, #4
	beq _08062DEC
	orrs r2, r6
	str r2, [r1, #0x5c]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x20]
	mov r1, r8
	strh r3, [r1]
_08062DEC:
	adds r4, #4
	mov r0, ip
	adds r0, #0xc
	cmp r4, r0
	bhi _08062DFC
	ldr r0, [r4]
	cmp r0, #0
	bne _08062DC0
_08062DFC:
	bl sub_8019F08
	ldr r0, _08062E2C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08062E08:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062E14: .4byte 0x04000128
_08062E18: .4byte gUnknown_030054B4
_08062E1C: .4byte gMultiplayerPlayerTasks
_08062E20: .4byte IWRAM_START + 0x54
_08062E24: .4byte gGameMode
_08062E28: .4byte gPlayer
_08062E2C: .4byte gCurTask

	thumb_func_start initSprite_Interactable_Toggle_StageGoal
initSprite_Interactable_Toggle_StageGoal: @ 0x08062E30
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062E74 @ =sub_8062934
	ldr r2, _08062E78 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062E74: .4byte sub_8062934
_08062E78: .4byte 0x00002010

	thumb_func_start TaskDestructor_8062E7C
TaskDestructor_8062E7C: @ 0x08062E7C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
