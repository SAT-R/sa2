.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80897E8
sub_80897E8: @ 0x080897E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08089834 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r1, _08089838 @ =IWRAM_START + 0x168
	adds r0, r3, r1
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0x17
	bhi _08089840
	ldr r2, _0808983C @ =IWRAM_START + 0x12C
	adds r5, r3, r2
	movs r0, #0
	mov r3, r8
	cmp r3, #0x10
	bhi _0808981C
	movs r1, #0x10
	subs r1, r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
_0808981C:
	movs r6, #0
	adds r4, r0, #0
_08089820:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _08089820
	b _08089856
	.align 2, 0
_08089834: .4byte gCurTask
_08089838: .4byte IWRAM_START + 0x168
_0808983C: .4byte IWRAM_START + 0x12C
_08089840:
	ldr r0, _08089910 @ =IWRAM_START + 0x12C
	adds r5, r3, r0
	movs r6, #0
_08089846:
	lsls r0, r6, #5
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r6, #1
	cmp r6, #7
	bls _08089846
_08089856:
	mov r1, r8
	cmp r1, #0x1c
	bls _08089886
	ldr r0, _08089914 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r4, #3
	cmp r0, #2
	bne _0808986C
	movs r4, #2
_0808986C:
	movs r6, #0
	cmp r6, r4
	bhs _08089886
	adds r0, r7, #0
	adds r0, #0xc
_08089876:
	adds r5, r0, #0
	bl sub_80051E8
	adds r0, r5, #0
	adds r0, #0x30
	adds r6, #1
	cmp r6, r4
	blo _08089876
_08089886:
	mov r2, r8
	cmp r2, #0x59
	bls _080898A8
	adds r5, r7, #0
	adds r5, #0x9c
	mov r0, r8
	subs r0, #0x5a
	cmp r0, #0xa
	bhi _080898A2
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x28
	strh r0, [r5, #0x16]
_080898A2:
	adds r0, r5, #0
	bl sub_80051E8
_080898A8:
	mov r3, r8
	cmp r3, #0x77
	bls _080899A6
	mov r0, r8
	subs r0, #0x7f
	cmp r0, #0x10
	ble _08089964
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08089944
	adds r5, r7, #0
	adds r5, #0xcc
	ldr r1, _08089918 @ =gSineTable
	ldr r3, _0808991C @ =0x000002D6
	adds r2, r7, r3
	ldrh r0, [r2]
	lsrs r0, r0, #8
	lsls r0, r0, #3
	subs r3, #0xd6
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r3, #0xca
	adds r1, r7, r3
	strh r0, [r1]
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r3, r7, r0
	ldrh r0, [r3]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _08089922
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bne _08089920
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r3]
	b _08089922
	.align 2, 0
_08089910: .4byte IWRAM_START + 0x12C
_08089914: .4byte gCurrentLevel
_08089918: .4byte gSineTable
_0808991C: .4byte 0x000002D6
_08089920:
	strh r2, [r3]
_08089922:
	ldr r2, _080899B0 @ =0x000002CA
	adds r1, r7, r2
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08089932
	movs r0, #0x10
	strh r0, [r1]
_08089932:
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r0, r5, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_08089944:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089964
	movs r0, #0x20
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08089964
	adds r5, r7, #0
	adds r5, #0xfc
	adds r0, r5, #0
	bl sub_80051E8
_08089964:
	movs r6, #0
	mov r0, r8
	subs r0, #0x78
	cmp r0, #0
	blt _080899A6
	adds r4, r0, #0
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r5, r7, r3
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r7, r7, r0
_0808997C:
	cmp r4, #0x13
	bhi _08089990
	ldr r0, _080899B4 @ =gUnknown_080E05C4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
_08089990:
	adds r0, r7, #0
	bl sub_80051E8
	subs r4, #1
	adds r5, #0x30
	adds r7, #0x30
	adds r6, #1
	cmp r6, #6
	bhi _080899A6
	cmp r4, #0
	bge _0808997C
_080899A6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080899B0: .4byte 0x000002CA
_080899B4: .4byte gUnknown_080E05C4

	thumb_func_start sub_80899B8
sub_80899B8: @ 0x080899B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov ip, r0
	ldr r0, _08089A84 @ =gSelectedCharacter
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, _08089A88 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #0
	bge _080899E8
	adds r0, r1, #3
_080899E8:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	movs r3, #0
	mov r1, r8
	lsls r1, r1, #3
	mov sb, r1
	ldr r2, [sp, #0xc]
	lsls r2, r2, #6
	mov sl, r2
	ldr r7, _08089A8C @ =gLoadedSaveGame
	ldr r2, [r7]
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	str r0, [sp, #0x18]
	mov r0, sb
	add r0, r8
	lsls r5, r0, #1
	adds r4, r2, #0
	adds r4, #0x34
	mov r2, sl
	ldr r7, [sp, #0xc]
	subs r0, r2, r7
	lsls r2, r0, #1
	str r1, [sp, #0x14]
_08089A24:
	lsls r0, r3, #2
	mov r7, sp
	adds r1, r7, r0
	lsls r0, r3, #1
	ldr r7, [sp, #0x18]
	adds r0, r0, r7
	adds r0, r0, r5
	adds r0, r0, r2
	adds r0, r4, r0
	ldrh r0, [r0]
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089A24
	movs r3, #0
	ldr r1, [sp, #0x14]
	adds r0, r1, r6
	lsls r5, r0, #1
	mov r0, sb
	add r0, r8
	lsls r4, r0, #1
	mov r2, sl
	ldr r7, [sp, #0xc]
	subs r0, r2, r7
	lsls r2, r0, #1
_08089A5A:
	lsls r0, r3, #2
	add r0, sp
	ldr r0, [r0]
	cmp ip, r0
	bhs _08089A90
	ldr r1, _08089A8C @ =gLoadedSaveGame
	ldr r0, [r1]
	lsls r1, r3, #1
	adds r1, r1, r5
	adds r1, r1, r4
	adds r1, r1, r2
	adds r0, #0x34
	adds r0, r0, r1
	mov r2, ip
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	adds r3, r0, #0
	b _08089A9A
	.align 2, 0
_08089A84: .4byte gSelectedCharacter
_08089A88: .4byte gCurrentLevel
_08089A8C: .4byte gLoadedSaveGame
_08089A90:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089A5A
_08089A9A:
	cmp r3, #2
	bhi _08089AD6
	ldr r7, [sp, #0x14]
	adds r0, r7, r6
	lsls r5, r0, #1
	mov r0, sb
	add r0, r8
	lsls r4, r0, #1
	mov r1, sl
	ldr r2, [sp, #0xc]
	subs r0, r1, r2
	lsls r2, r0, #1
	ldr r6, _08089AE8 @ =gLoadedSaveGame
_08089AB4:
	ldr r1, [r6]
	lsls r0, r3, #1
	adds r0, r0, r5
	adds r0, r0, r4
	adds r0, r0, r2
	adds r1, #0x34
	adds r1, r1, r0
	subs r0, r3, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089AB4
_08089AD6:
	ldr r0, [sp, #0x10]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089AE8: .4byte gLoadedSaveGame

	thumb_func_start sub_8089AEC
sub_8089AEC: @ 0x08089AEC
	push {r4, lr}
	ldr r0, _08089B30 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08089B34 @ =IWRAM_START + 0x168
	adds r0, r0, r1
	ldr r4, [r0]
	adds r4, #1
	str r4, [r0]
	bl sub_80310F0
	bl sub_8031314
	bl sub_80897E8
	cmp r4, #0xa0
	bls _08089B1A
	ldr r0, _08089B38 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _08089B22
_08089B1A:
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r4, r0
	bls _08089B2A
_08089B22:
	ldr r0, _08089B30 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08089B3C @ =sub_8089B40
	str r0, [r1, #8]
_08089B2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089B30: .4byte gCurTask
_08089B34: .4byte IWRAM_START + 0x168
_08089B38: .4byte gPressedKeys
_08089B3C: .4byte sub_8089B40

	thumb_func_start sub_8089B40
sub_8089B40: @ 0x08089B40
	push {lr}
	ldr r0, _08089B84 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08089BA0
	bl WriteSaveGame
	ldr r1, _08089B88 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08089B8C @ =gUnknown_03002AE4
	ldr r0, _08089B90 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08089B94 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08089B98 @ =gUnknown_03004D5C
	ldr r0, _08089B9C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTimeAttackLobbyScreen
	b _08089BAC
	.align 2, 0
_08089B84: .4byte gCurTask
_08089B88: .4byte 0x0000FFFF
_08089B8C: .4byte gUnknown_03002AE4
_08089B90: .4byte gUnknown_0300287C
_08089B94: .4byte gUnknown_03005390
_08089B98: .4byte gUnknown_03004D5C
_08089B9C: .4byte gUnknown_03002A84
_08089BA0:
	bl sub_80310F0
	bl sub_8031314
	bl sub_80897E8
_08089BAC:
	pop {r0}
	bx r0

	thumb_func_start sub_8089BB0
sub_8089BB0: @ 0x08089BB0
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _08089C14 @ =IWRAM_START + 0x130
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	movs r5, #0
	ldr r0, _08089C18 @ =IWRAM_START + 0x10
	adds r4, r4, r0
_08089BCA:
	ldr r0, [r4]
	bl VramFree
	adds r4, #0x30
	adds r5, #1
	cmp r5, #2
	bls _08089BCA
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0xa0
_08089BDE:
	ldr r0, [r4]
	bl VramFree
	adds r4, #0x30
	adds r5, #1
	cmp r5, #2
	bls _08089BDE
	movs r5, #0
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r4, r6, r1
_08089BF4:
	ldr r0, [r4]
	bl VramFree
	adds r4, #0x30
	adds r5, #1
	cmp r5, #6
	bls _08089BF4
	ldr r2, _08089C1C @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08089C20 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089C14: .4byte IWRAM_START + 0x130
_08089C18: .4byte IWRAM_START + 0x10
_08089C1C: .4byte gUnknown_03005424
_08089C20: .4byte 0x0000FDFF

	thumb_func_start sub_8089C24
sub_8089C24: @ 0x08089C24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08089D64 @ =sub_8089E54
	ldr r2, _08089D68 @ =0x00005050
	ldr r1, _08089D6C @ =sub_808A234
	str r1, [sp]
	movs r1, #0xe8
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r5, r0
	ldr r1, _08089D70 @ =IWRAM_START + 0x60
	adds r0, r5, r1
	movs r2, #0
	mov r8, r2
	movs r6, #0
	strh r6, [r0]
	movs r0, #1
	bl VramMalloc
	str r0, [r7, #4]
	ldr r3, _08089D74 @ =0x00000369
	strh r3, [r7, #0xa]
	ldr r1, _08089D78 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	mov r2, r8
	strb r2, [r0]
	strh r6, [r7, #8]
	ldr r3, _08089D7C @ =IWRAM_START + 0x21
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	movs r1, #0x80
	lsls r1, r1, #6
	mov sl, r1
	str r1, [r7, #0x10]
	strh r6, [r7, #0x1c]
	ldr r2, _08089D80 @ =IWRAM_START + 0x22
	adds r0, r5, r2
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	strb r1, [r0]
	adds r2, #3
	adds r0, r5, r2
	mov r3, r8
	strb r3, [r0]
	adds r0, r7, #0
	bl sub_8004558
	ldr r0, _08089D84 @ =IWRAM_START + 0x30
	adds r4, r5, r0
	movs r0, #1
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _08089D74 @ =0x00000369
	strh r1, [r4, #0xa]
	ldr r2, _08089D88 @ =IWRAM_START + 0x50
	adds r1, r5, r2
	movs r0, #1
	strb r0, [r1]
	strh r6, [r4, #8]
	ldr r3, _08089D8C @ =IWRAM_START + 0x51
	adds r1, r5, r3
	subs r0, #2
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	mov r1, sl
	str r1, [r4, #0x10]
	strh r6, [r4, #0x1c]
	adds r2, #2
	adds r0, r5, r2
	mov r3, sb
	strb r3, [r0]
	ldr r0, _08089D90 @ =IWRAM_START + 0x55
	adds r5, r5, r0
	mov r1, r8
	strb r1, [r5]
	ldr r4, _08089D94 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	ldr r1, _08089D98 @ =gUnknown_03005960
	ldr r1, [r1]
	bl SeedRng
	ldr r2, _08089D94 @ =gUnknown_030059E0
	adds r2, #0x24
	mov r8, r2
	ldr r4, _08089D9C @ =gSineTable
	movs r3, #0xff
	mov sl, r3
	movs r0, #0xf
	mov sb, r0
_08089CF6:
	bl Random
	adds r1, r7, #0
	adds r1, #0x64
	adds r3, r1, r6
	ldr r2, _08089DA0 @ =0x000007FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08089D94 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08089DA4
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	adds r2, #0x62
	adds r2, r2, r6
	mov ip, r2
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #0x80
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #0x80
	mov r1, sl
	ands r0, r1
	b _08089DD8
	.align 2, 0
_08089D64: .4byte sub_8089E54
_08089D68: .4byte 0x00005050
_08089D6C: .4byte sub_808A234
_08089D70: .4byte IWRAM_START + 0x60
_08089D74: .4byte 0x00000369
_08089D78: .4byte IWRAM_START + 0x20
_08089D7C: .4byte IWRAM_START + 0x21
_08089D80: .4byte IWRAM_START + 0x22
_08089D84: .4byte IWRAM_START + 0x30
_08089D88: .4byte IWRAM_START + 0x50
_08089D8C: .4byte IWRAM_START + 0x51
_08089D90: .4byte IWRAM_START + 0x55
_08089D94: .4byte gUnknown_030059E0
_08089D98: .4byte gUnknown_03005960
_08089D9C: .4byte gSineTable
_08089DA0: .4byte 0x000007FF
_08089DA4:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	adds r2, #0x62
	adds r2, r2, r6
	mov ip, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
_08089DD8:
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	bl Random
	ldr r3, _08089E50 @ =0x000003FF
	mov ip, r3
	adds r2, r7, #0
	adds r2, #0xa2
	adds r2, r2, r6
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov r3, ip
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	muls r1, r0, r1
	asrs r1, r1, #8
	strh r1, [r2]
	adds r2, r7, #0
	adds r2, #0xa4
	adds r2, r2, r6
	lsls r1, r5, #3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r6, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	blt _08089E40
	b _08089CF6
_08089E40:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089E50: .4byte 0x000003FF

	thumb_func_start sub_8089E54
sub_8089E54: @ 0x08089E54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08089EB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	mov sl, r0
	mov r8, r0
_08089E78:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08089EBC
	adds r5, r7, #0
	adds r5, #0x62
	mov r2, r8
	adds r1, r5, r2
	adds r4, r7, #0
	adds r4, #0xa2
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	adds r3, r7, #0
	adds r3, #0x64
	adds r1, r3, r2
	adds r2, r7, #0
	adds r2, #0xa4
	mov r6, r8
	adds r0, r2, r6
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	adds r6, r5, #0
	mov sb, r4
	adds r4, r3, #0
	adds r5, r2, #0
	b _08089EEC
	.align 2, 0
_08089EB8: .4byte gCurTask
_08089EBC:
	adds r6, r7, #0
	adds r6, #0x62
	mov r0, r8
	adds r2, r6, r0
	adds r5, r7, #0
	adds r5, #0xa2
	adds r1, r5, r0
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x64
	mov r1, r8
	adds r2, r4, r1
	adds r3, r7, #0
	adds r3, #0xa4
	adds r1, r3, r1
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	mov sb, r5
	adds r5, r3, #0
_08089EEC:
	mov r1, sb
	add r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #0xc8
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r1]
	mov r0, r8
	adds r1, r5, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r1]
	ldr r3, _08089FF0 @ =gUnknown_030059E0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	ldr r2, _08089FF4 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	mov r3, r8
	adds r0, r6, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r7, #0x16]
	ldr r6, _08089FF0 @ =gUnknown_030059E0
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #4
	add r8, r0
	movs r1, #1
	add sl, r1
	mov r2, sl
	cmp r2, #7
	ble _08089E78
	adds r0, r7, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #8
	bhi _08089F62
	b _0808A082
_08089F62:
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08089FF0 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	ldr r1, _08089FF4 @ =gUnknown_03005960
	ldr r1, [r1]
	bl SeedRng
	adds r3, r7, #0
	adds r3, #0xe2
	str r3, [sp]
	adds r7, #0xe4
	mov r8, r7
	ldr r4, _08089FF8 @ =gSineTable
	adds r6, r5, #0
	mov r5, sb
	movs r0, #0xff
	mov sb, r0
	movs r1, #0xf
	mov sl, r1
_08089F8E:
	movs r1, #0
	movs r0, #0x80
	ldr r2, [sp]
	strh r0, [r2]
	mov r3, r8
	strh r1, [r3]
	ldr r1, _08089FF0 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A000
	bl Random
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x17
	adds r0, r0, r2
	lsrs r7, r0, #0x18
	ldr r3, _08089FFC @ =gUnknown_03005A04
	ldrb r0, [r3]
	adds r0, #0x80
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r3, [sp]
	strh r0, [r3]
	ldr r1, _08089FFC @ =gUnknown_03005A04
	ldrb r0, [r1]
	adds r0, #0x80
	mov r2, sb
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	mov r3, r8
	strh r0, [r3]
	b _0808A034
	.align 2, 0
_08089FF0: .4byte gUnknown_030059E0
_08089FF4: .4byte gUnknown_03005960
_08089FF8: .4byte gSineTable
_08089FFC: .4byte gUnknown_03005A04
_0808A000:
	bl Random
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0808A094 @ =gUnknown_03005A04
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r3, [sp]
	strh r0, [r3]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
_0808A034:
	bl Random
	ldr r3, _0808A098 @ =0x000003FF
	adds r2, r3, #0
	lsls r1, r7, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r0, r2
	muls r1, r0, r1
	asrs r1, r1, #8
	strh r1, [r5]
	lsls r1, r7, #3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	adds r6, #4
	adds r5, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08089F8E
	ldr r0, _0808A09C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808A0A0 @ =sub_808A0A4
	str r0, [r1, #8]
_0808A082:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A094: .4byte gUnknown_03005A04
_0808A098: .4byte 0x000003FF
_0808A09C: .4byte gCurTask
_0808A0A0: .4byte sub_808A0A4

	thumb_func_start sub_808A0A4
sub_808A0A4: @ 0x0808A0A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0808A0DC @ =gCurTask
	ldr r4, [r0]
	ldrh r3, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov sb, r0
	mov r1, sb
	orrs r1, r3
	mov sb, r1
	adds r0, #0x60
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x18
	bls _0808A0E0
	adds r0, r4, #0
	bl TaskDestroy
	b _0808A222
	.align 2, 0
_0808A0DC: .4byte gCurTask
_0808A0E0:
	movs r1, #0
	mov r8, r1
	ldr r0, _0808A1C4 @ =IWRAM_START + 0x62
	adds r0, r3, r0
	str r0, [sp, #8]
	ldr r1, _0808A1C8 @ =IWRAM_START + 0xA2
	adds r1, r3, r1
	str r1, [sp]
	ldr r0, _0808A1CC @ =IWRAM_START + 0x64
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _0808A1D0 @ =IWRAM_START + 0xA4
	adds r1, r3, r1
	str r1, [sp, #4]
	ldr r0, _0808A1D4 @ =IWRAM_START + 0xE2
	adds r7, r3, r0
	ldr r1, _0808A1D8 @ =IWRAM_START + 0xE4
	adds r6, r3, r1
	movs r0, #0xc8
	mov sl, r0
_0808A108:
	mov r1, r8
	lsls r2, r1, #2
	ldr r0, [sp, #8]
	adds r4, r0, r2
	ldr r1, [sp]
	adds r5, r1, r2
	ldrh r0, [r5]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	mov r0, ip
	adds r3, r0, r2
	ldr r1, [sp, #4]
	adds r2, r1, r2
	ldrh r0, [r2]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r4]
	ldrh r1, [r7]
	subs r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r6]
	subs r0, r0, r1
	strh r0, [r3]
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r7]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r6]
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0xf
	ble _0808A108
	mov sl, sb
	ldr r7, _0808A1DC @ =gUnknown_030059E0
	ldr r6, _0808A1E0 @ =gUnknown_03005960
	mov r5, ip
	ldr r4, [sp, #8]
	movs r1, #7
	mov r8, r1
_0808A188:
	mov r0, sl
	adds r0, #0x60
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A1E4
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r6]
	subs r1, r1, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	ldr r0, [r6, #4]
	subs r1, r1, r0
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x18]
	bl sub_8004558
	b _0808A20C
	.align 2, 0
_0808A1C4: .4byte IWRAM_START + 0x62
_0808A1C8: .4byte IWRAM_START + 0xA2
_0808A1CC: .4byte IWRAM_START + 0x64
_0808A1D0: .4byte IWRAM_START + 0xA4
_0808A1D4: .4byte IWRAM_START + 0xE2
_0808A1D8: .4byte IWRAM_START + 0xE4
_0808A1DC: .4byte gUnknown_030059E0
_0808A1E0: .4byte gUnknown_03005960
_0808A1E4:
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r6]
	subs r1, r1, r0
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	ldr r0, [r6, #4]
	subs r1, r1, r0
	ldrh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x18]
_0808A20C:
	mov r0, sl
	bl sub_80051E8
	adds r5, #4
	adds r4, #4
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r0, r8
	cmp r0, #0
	bge _0808A188
_0808A222:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808A234
sub_808A234: @ 0x0808A234
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl VramFree
	ldr r0, _0808A254 @ =IWRAM_START + 0x30
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A254: .4byte IWRAM_START + 0x30
