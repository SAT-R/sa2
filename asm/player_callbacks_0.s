.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

@ NOTE: We consider Player Callbacks to be all those procedures
@       that are passed to the first member of the Player struct.
@       So even if there are procedures that only take a Player,
@       if they are only called directly in the code, those are NOT callbacks.

.if 00
.endif

	thumb_func_start PlayerCB_80126B0
PlayerCB_80126B0: @ 0x080126B0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xac
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080126F0
	subs r0, r2, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _080126EC @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _080126F0
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x56
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r0, #0xe3
	bl m4aSongNumStop
	b _080127EA
	.align 2, 0
_080126EC: .4byte gPlayerControls
_080126F0:
	adds r2, r4, #0
	adds r2, #0x61
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _08012724
	ldrh r3, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0801271E
	adds r0, r3, #0
	subs r0, #0x18
	strh r0, [r4, #0x12]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x20
	bne _08012756
_0801271E:
	movs r0, #1
	strb r0, [r2]
	b _08012756
_08012724:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _080127A8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08012750
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08012750
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08012750
	movs r0, #2
	strb r0, [r2]
_08012750:
	ldrh r0, [r4, #0x12]
	adds r0, #8
	strh r0, [r4, #0x12]
_08012756:
	ldr r0, _080127AC @ =gCamera
	ldr r0, [r0, #0x28]
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	bge _08012770
	str r1, [r4, #0xc]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bge _08012770
	movs r0, #0
	strh r0, [r4, #0x12]
_08012770:
	adds r0, r4, #0
	bl sub_80125BC
	ldr r1, _080127B0 @ =gUnknown_080D552C
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0801278E
	rsbs r1, r1, #0
_0801278E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _080127BC
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080127B4
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	subs r0, r1, r0
	b _080127BA
	.align 2, 0
_080127A8: .4byte gPlayerControls
_080127AC: .4byte gCamera
_080127B0: .4byte gUnknown_080D552C
_080127B4:
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	adds r0, r1, r0
_080127BA:
	strh r0, [r4, #0x10]
_080127BC:
	adds r0, r4, #0
	bl sub_80282EC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080127D4
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	b _080127E8
_080127D4:
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080127EA
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
_080127E8:
	strb r0, [r1]
_080127EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_80127F0
PlayerCB_80127F0: @ 0x080127F0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012826
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801281E
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #9
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	b _08012824
_0801281E:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
_08012824:
	strb r0, [r1]
_08012826:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0

	thumb_func_start sub_8012830
sub_8012830: @ 0x08012830
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0801287C @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x11
	strh r0, [r1]
	ldr r0, _08012880 @ =gPlayer
	ldr r1, _08012884 @ =PlayerCB_8012938
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801287C: .4byte 0xFFFFBFFF
_08012880: .4byte gPlayer
_08012884: .4byte PlayerCB_8012938

	thumb_func_start sub_8012888
sub_8012888: @ 0x08012888
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080128D0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _080128D4 @ =0x20000102
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x12
	strh r0, [r1]
	ldr r0, _080128D8 @ =gPlayer
	ldr r1, _080128DC @ =PlayerCB_8012978
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080128D0: .4byte 0xFFFFBFFF
_080128D4: .4byte 0x20000102
_080128D8: .4byte gPlayer
_080128DC: .4byte PlayerCB_8012978

	thumb_func_start sub_80128E0
sub_80128E0: @ 0x080128E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012928 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _0801292C @ =0x20000102
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x13
	strh r0, [r1]
	ldr r0, _08012930 @ =gPlayer
	ldr r1, _08012934 @ =PlayerCB_80129BC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012928: .4byte 0xFFFFBFFF
_0801292C: .4byte 0x20000102
_08012930: .4byte gPlayer
_08012934: .4byte PlayerCB_80129BC

	thumb_func_start PlayerCB_8012938
PlayerCB_8012938: @ 0x08012938
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801296E
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08012966
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	b _0801296C
_08012966:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
_0801296C:
	strb r0, [r1]
_0801296E:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8012978
PlayerCB_8012978: @ 0x08012978
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801299C
	ldr r0, [r4, #0x68]
	cmp r0, #0x6c
	bne _0801299C
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0801299C:
	adds r0, r4, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080129B4
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_080129B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_80129BC
PlayerCB_80129BC: @ 0x080129BC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080129D6
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_080129D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80129DC
sub_80129DC: @ 0x080129DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, _080129F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080129F8
	movs r0, #0
	b _08012ABE
	.align 2, 0
_080129F4: .4byte gGameMode
_080129F8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r5, _08012A7C @ =gPlayer
	adds r2, r5, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _08012A80 @ =sub_801F214
	str r2, [sp]
	ldr r2, _08012A84 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov r8, r0
	ldrh r6, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r6, r3
	ldr r1, _08012A88 @ =PlayerCharacterIdleAnims
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r3, #0x16]
	ldr r2, _08012A8C @ =gUnknown_080D6736
	adds r4, r5, #0
	adds r4, #0x64
	movs r7, #0
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x18]
	ldr r7, _08012A90 @ =IWRAM_START + 0x1C
	adds r4, r6, r7
	adds r0, r5, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08012A9C
	movs r0, #0xf
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08012A94 @ =0x0000034D
	strh r0, [r4, #0xa]
	ldr r0, _08012A98 @ =IWRAM_START + 0x3C
	adds r1, r6, r0
	movs r0, #0
	b _08012AAE
	.align 2, 0
_08012A7C: .4byte gPlayer
_08012A80: .4byte sub_801F214
_08012A84: .4byte sub_801F550
_08012A88: .4byte PlayerCharacterIdleAnims
_08012A8C: .4byte gUnknown_080D6736
_08012A90: .4byte IWRAM_START + 0x1C
_08012A94: .4byte 0x0000034D
_08012A98: .4byte IWRAM_START + 0x3C
_08012A9C:
	movs r0, #0x18
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xc6
	strh r0, [r4, #0xa]
	ldr r7, _08012ACC @ =IWRAM_START + 0x3C
	adds r1, r6, r7
	movs r0, #1
_08012AAE:
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	mov r0, r8
_08012ABE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012ACC: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8012AD0
sub_8012AD0: @ 0x08012AD0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012B34 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x5b
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r1, [r4, #0x20]
	ldr r0, _08012B38 @ =0x20000102
	orrs r1, r0
	str r1, [r4, #0x20]
	movs r2, #0xfc
	lsls r2, r2, #8
	strh r2, [r4, #0x12]
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08012B1A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_08012B1A:
	movs r0, #0x74  @ SE_JUMP
	bl m4aSongNumStart
	ldr r0, _08012B3C @ =gPlayer
	ldr r1, _08012B40 @ =PlayerCB_8012D1C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012B34: .4byte 0xFFFFBFFF
_08012B38: .4byte 0x20000102
_08012B3C: .4byte gPlayer
_08012B40: .4byte PlayerCB_8012D1C

	thumb_func_start sub_8012B44
sub_8012B44: @ 0x08012B44
	push {lr}
	adds r2, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _08012B60
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x5a
	strh r0, [r1]
	movs r0, #0x78
	bl m4aSongNumStop
	b _08012BBC
_08012B60:
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08012B78
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012B8A
_08012B78:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08012B94
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012B94
_08012B8A:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x59
	strh r0, [r1]
	b _08012BB6
_08012B94:
	adds r3, r2, #0
	adds r3, #0x64
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0x59
	bne _08012BB2
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012BB6
_08012BB2:
	movs r0, #0x58
	strh r0, [r3]
_08012BB6:
	movs r0, #0x78
	bl m4aSongNumStartOrChange
_08012BBC:
	pop {r0}
	bx r0

	thumb_func_start sub_8012BC0
sub_8012BC0: @ 0x08012BC0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08012BEA
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
_08012BEA:
	adds r1, r4, #0
	adds r1, #0xb0
	movs r0, #0xf0
	str r0, [r1]
	adds r2, r4, #0
	adds r2, #0x61
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r1, [r0]
	subs r0, #2
	strh r1, [r0]
	ldr r2, _08012C24 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r2, #0x20]
	ldr r1, _08012C28 @ =PlayerCB_8012C2C
	str r1, [r2]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012C24: .4byte gPlayer
_08012C28: .4byte PlayerCB_8012C2C

	thumb_func_start PlayerCB_8012C2C
PlayerCB_8012C2C: @ 0x08012C2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08012C80 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012C4A
	adds r1, r4, #0
	adds r1, #0xb0
	ldr r0, [r1]
	cmp r0, #0
	beq _08012C4A
	subs r0, #1
	str r0, [r1]
_08012C4A:
	adds r2, r4, #0
	adds r2, #0x61
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _08012C84
	ldrh r3, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08012C78
	adds r0, r3, #0
	subs r0, #0x18
	strh r0, [r4, #0x12]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x20
	bne _08012CB4
_08012C78:
	movs r0, #1
	strb r0, [r2]
	b _08012CB4
	.align 2, 0
_08012C80: .4byte gUnknown_03005590
_08012C84:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08012CF8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08012CAE
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08012CAE
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _08012CAE
	movs r0, #2
	strb r0, [r2]
_08012CAE:
	ldrh r0, [r4, #0x12]
	adds r0, #8
	strh r0, [r4, #0x12]
_08012CB4:
	ldr r0, _08012CFC @ =gCamera
	ldr r0, [r0, #0x28]
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	bge _08012CCE
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08012CCE
	movs r0, #0
	strh r0, [r4, #0x12]
_08012CCE:
	adds r0, r4, #0
	bl sub_8012B44
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r4, #0x40]
	movs r0, #0x10
	str r0, [r4, #0x48]
	adds r0, r4, #0
	bl sub_80282EC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08012D00
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	b _08012D14
	.align 2, 0
_08012CF8: .4byte gPlayerControls
_08012CFC: .4byte gCamera
_08012D00:
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08012D16
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
_08012D14:
	strb r0, [r1]
_08012D16:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8012D1C
PlayerCB_8012D1C: @ 0x08012D1C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08012D32
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08012D32:
	adds r0, r2, #0
	bl sub_8028204
	pop {r0}
	bx r0

	thumb_func_start sub_8012D3C
sub_8012D3C: @ 0x08012D3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012D98 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	bl sub_80129DC
	movs r0, #0x79
	bl m4aSongNumStart
	ldr r0, _08012D9C @ =gPlayer
	ldr r1, _08012DA0 @ =PlayerCB_8012DA4
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012D98: .4byte 0xFFFFBFFF
_08012D9C: .4byte gPlayer
_08012DA0: .4byte PlayerCB_8012DA4

	thumb_func_start PlayerCB_8012DA4
PlayerCB_8012DA4: @ 0x08012DA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	cmp r1, #0
	ble _08012DBC
	subs r1, r1, r0
	cmp r1, #0
	bge _08012DC4
	b _08012DC2
_08012DBC:
	adds r1, r1, r0
	cmp r1, #0
	ble _08012DC4
_08012DC2:
	movs r1, #0
_08012DC4:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012DE4
	ldr r1, _08012DF0 @ =gPlayer
	ldr r0, _08012DF4 @ =PlayerCB_8025318
	str r0, [r1]
_08012DE4:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012DF0: .4byte gPlayer
_08012DF4: .4byte PlayerCB_8025318

	thumb_func_start sub_8012DF8
sub_8012DF8: @ 0x08012DF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _08012E18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08012E1C
	movs r0, #0
	b _08012EBE
	.align 2, 0
_08012E18: .4byte gGameMode
_08012E1C:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _08012ECC @ =gPlayer
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _08012ED0 @ =sub_801F214
	str r2, [sp]
	ldr r2, _08012ED4 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov r8, r0
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r7, r0
	ldr r1, _08012ED8 @ =gUnknown_080D6736
	adds r2, r4, #0
	adds r2, #0x64
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r5, [r0]
	strh r5, [r3, #0x16]
	movs r6, #0
	ldrsh r0, [r2, r6]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x18]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08012E84
	ldr r1, _08012EDC @ =PlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	strh r0, [r3, #0x16]
_08012E84:
	ldr r2, _08012EE0 @ =IWRAM_START + 0x1C
	adds r6, r7, r2
	ldr r5, _08012EE4 @ =gUnknown_080D553C
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	ldr r2, _08012EE8 @ =IWRAM_START + 0x3C
	adds r0, r7, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, r8
_08012EBE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012ECC: .4byte gPlayer
_08012ED0: .4byte sub_801F214
_08012ED4: .4byte sub_801F550
_08012ED8: .4byte gUnknown_080D6736
_08012EDC: .4byte PlayerCharacterIdleAnims
_08012EE0: .4byte IWRAM_START + 0x1C
_08012EE4: .4byte gUnknown_080D553C
_08012EE8: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8012EEC
sub_8012EEC: @ 0x08012EEC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012F44 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x16
	orrs r2, r0
	str r2, [r4, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08012F2E
	rsbs r1, r1, #0
_08012F2E:
	ldr r0, _08012F48 @ =0x000002FF
	cmp r1, r0
	bgt _08012F52
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _08012F4C
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08012F50
	.align 2, 0
_08012F44: .4byte 0xFFFFBFFF
_08012F48: .4byte 0x000002FF
_08012F4C:
	movs r0, #0xc0
	lsls r0, r0, #2
_08012F50:
	strh r0, [r4, #0x14]
_08012F52:
	ldr r0, _08012F64 @ =gPlayer
	ldr r1, _08012F68 @ =PlayerCB_8012F6C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012F64: .4byte gPlayer
_08012F68: .4byte PlayerCB_8012F6C

	thumb_func_start PlayerCB_8012F6C
PlayerCB_8012F6C: @ 0x08012F6C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08012F80
	subs r0, #0x60
	cmp r0, #0
	bge _08012F8C
	b _08012F8A
_08012F80:
	cmp r0, #0
	bge _08012F8E
	adds r0, #0x60
	cmp r0, #0
	ble _08012F8C
_08012F8A:
	movs r0, #0
_08012F8C:
	strh r0, [r2, #0x14]
_08012F8E:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012FFC
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08012FBC
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	b _08012FFC
_08012FBC:
	adds r1, r2, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x6c
	movs r3, #1
	strb r3, [r0]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08012FD8
	rsbs r1, r1, #0
_08012FD8:
	ldr r0, _08012FEC @ =0x000002FF
	cmp r1, r0
	bgt _08012FF6
	ldr r0, [r2, #0x20]
	ands r0, r3
	cmp r0, #0
	beq _08012FF0
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08012FF4
	.align 2, 0
_08012FEC: .4byte 0x000002FF
_08012FF0:
	movs r0, #0xc0
	lsls r0, r0, #2
_08012FF4:
	strh r0, [r2, #0x14]
_08012FF6:
	ldr r1, _08013008 @ =gPlayer
	ldr r0, _0801300C @ =PlayerCB_8013010
	str r0, [r1]
_08012FFC:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_08013008: .4byte gPlayer
_0801300C: .4byte PlayerCB_8013010

	thumb_func_start PlayerCB_8013010
PlayerCB_8013010: @ 0x08013010
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08013024
	subs r0, #0x60
	cmp r0, #0
	bge _08013030
	b _0801302E
_08013024:
	cmp r0, #0
	bge _08013032
	adds r0, #0x60
	cmp r0, #0
	ble _08013030
_0801302E:
	movs r0, #0
_08013030:
	strh r0, [r2, #0x14]
_08013032:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013066
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801305E
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	b _08013064
_0801305E:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
_08013064:
	strb r0, [r1]
_08013066:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0

	thumb_func_start sub_8013070
sub_8013070: @ 0x08013070
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080130D8 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x11
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	bl sub_8012DF8
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #0xe1
	bl m4aSongNumStart
	ldr r0, _080130DC @ =gPlayer
	ldr r1, _080130E0 @ =PlayerCB_80130E4
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080130D8: .4byte 0xFFFFBFFF
_080130DC: .4byte gPlayer
_080130E0: .4byte PlayerCB_80130E4

	thumb_func_start PlayerCB_80130E4
PlayerCB_80130E4: @ 0x080130E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #1
	cmp r1, #0
	ble _080130FC
	subs r1, r1, r0
	cmp r1, #0
	bge _08013108
	b _08013106
_080130FC:
	cmp r1, #0
	bge _0801310A
	adds r1, r1, r0
	cmp r1, #0
	ble _08013108
_08013106:
	movs r1, #0
_08013108:
	strh r1, [r4, #0x14]
_0801310A:
	adds r0, r4, #0
	bl sub_8029C84
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0801313C
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08013148 @ =gPlayer
	ldr r0, _0801314C @ =PlayerCB_8013B6C
	str r0, [r1]
_0801313C:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013148: .4byte gPlayer
_0801314C: .4byte PlayerCB_8013B6C

	thumb_func_start sub_8013150
sub_8013150: @ 0x08013150
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r0, #0xad
	ldrb r2, [r0]
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x1f
	ands r0, r1
	str r0, [r3, #0x20]
	lsls r4, r2, #0x18
	asrs r1, r4, #0x18
	movs r5, #0x7f
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _0801318C
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0x5c
	strh r1, [r0]
	lsrs r0, r4, #0x18
	cmp r0, #0x80
	bne _080131A8
	ldr r0, [r3, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r3, #0x20]
	b _080131A8
_0801318C:
	cmp r1, #0
	bge _08013196
	rsbs r0, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013196:
	ldr r1, _080131B0 @ =gUnknown_080D5538
	ands r2, r5
	lsrs r0, r2, #5
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r3, #0
	adds r0, #0x64
	strh r1, [r0]
_080131A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080131B0: .4byte gUnknown_080D5538

	thumb_func_start sub_80131B4
sub_80131B4: @ 0x080131B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	bl sub_8022838
	adds r7, r5, #0
	adds r7, #0xac
	ldrb r1, [r7]
	movs r0, #2
	mov r8, r0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08013258
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _080131E6
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _080131EE
_080131E6:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_080131EE:
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801323A
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0801321C
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _08013224
_0801321C:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08013224:
	str r0, [r5, #0x20]
	movs r0, #0
	strh r0, [r5, #0x12]
	adds r0, r5, #0
	bl sub_8022318
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
	b _0801348A
_0801323A:
	ldr r1, _08013250 @ =gPlayer
	ldr r0, _08013254 @ =PlayerCB_8013C18
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5f
	strh r0, [r1]
	movs r0, #0x6f
	bl m4aSongNumStart
	b _0801348A
	.align 2, 0
_08013250: .4byte gPlayer
_08013254: .4byte PlayerCB_8013C18
_08013258:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08013262
	b _08013424
_08013262:
	adds r0, r5, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013272
	b _080133FC
_08013272:
	adds r1, r5, #0
	adds r1, #0xad
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	mov sb, r1
	cmp r0, #0
	bgt _0801332C
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sub_8029A28
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _0801329E
	b _080133FC
_0801329E:
	cmp r6, #0
	bne _080132A4
	b _080133BA
_080132A4:
	ldr r0, _080132E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080132F0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _080132EC @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801E4E4
	cmp r0, #0
	bge _0801331E
	b _08013348
	.align 2, 0
_080132E8: .4byte gUnknown_03005424
_080132EC: .4byte sub_801EE64
_080132F0:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _08013328 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	blt _080133FC
_0801331E:
	lsls r1, r6, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	b _080133B8
	.align 2, 0
_08013328: .4byte sub_801EE64
_0801332C:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sub_8029A74
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08013370
_08013348:
	ldr r1, _08013368 @ =gPlayer
	ldr r0, _0801336C @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	ldrb r0, [r7]
	mov r2, r8
	orrs r0, r2
	strb r0, [r7]
	b _0801348A
	.align 2, 0
_08013368: .4byte gPlayer
_0801336C: .4byte PlayerCB_8013BD4
_08013370:
	cmp r6, #0
	beq _080133BA
	ldr r0, _080133EC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080133B2
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _080133F0 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	blt _080133FC
_080133B2:
	lsls r1, r6, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
_080133B8:
	str r0, [r5, #8]
_080133BA:
	movs r0, #0
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	ldr r1, _080133F4 @ =gPlayer
	ldr r0, _080133F8 @ =PlayerCB_8013C34
	str r0, [r1]
	movs r0, #3
	mov r2, sb
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xa
	strb r0, [r5, #0x17]
	b _0801348A
	.align 2, 0
_080133EC: .4byte gUnknown_03005424
_080133F0: .4byte sub_801EE64
_080133F4: .4byte gPlayer
_080133F8: .4byte PlayerCB_8013C34
_080133FC:
	ldr r1, _0801341C @ =gPlayer
	ldr r0, _08013420 @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	ldrb r0, [r7]
	mov r1, r8
	orrs r0, r1
	strb r0, [r7]
	b _0801348A
	.align 2, 0
_0801341C: .4byte gPlayer
_08013420: .4byte PlayerCB_8013BD4
_08013424:
	adds r0, r5, #0
	adds r0, #0x5c
	ldr r1, _0801345C @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0801343E
	ldr r0, [r5, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013484
_0801343E:
	ldr r1, _08013460 @ =gPlayer
	ldr r0, _08013464 @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bgt _08013468
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _08013470
	.align 2, 0
_0801345C: .4byte gPlayerControls
_08013460: .4byte gPlayer
_08013464: .4byte PlayerCB_8013BD4
_08013468:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08013470:
	str r0, [r5, #0x20]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r5, #0x10]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	b _0801348A
_08013484:
	adds r0, r5, #0
	bl sub_8013150
_0801348A:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8013498
sub_8013498: @ 0x08013498
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_8029DC8
	adds r0, r4, #0
	bl sub_8022838
	adds r0, r4, #0
	adds r0, #0xac
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080134FE
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	bl sub_8022318
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080134EC
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
	b _080134FE
_080134EC:
	movs r0, #0xf
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x5e
	strh r0, [r1]
	ldr r1, _08013504 @ =gPlayer
	ldr r0, _08013508 @ =PlayerCB_8013BF0
	str r0, [r1]
_080134FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013504: .4byte gPlayer
_08013508: .4byte PlayerCB_8013BF0

	thumb_func_start sub_801350C
sub_801350C: @ 0x0801350C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08013578 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0801353E
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	ldr r0, _0801357C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013530
	rsbs r2, r2, #0
_08013530:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r1, r1, r2
	bl sub_801F5CC
_0801353E:
	adds r0, r4, #0
	bl sub_8022838
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029B88
	adds r2, r0, #0
	cmp r2, #0xb
	bgt _08013580
	ldr r0, _0801357C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013562
	rsbs r2, r2, #0
_08013562:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	b _080135AC
	.align 2, 0
_08013578: .4byte gUnknown_03005590
_0801357C: .4byte gUnknown_03005424
_08013580:
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080135AC
	ldr r1, _080135B4 @ =gPlayer
	ldr r0, _080135B8 @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
_080135AC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080135B4: .4byte gPlayer
_080135B8: .4byte PlayerCB_8013BD4

	thumb_func_start sub_80135BC
sub_80135BC: @ 0x080135BC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	ldr r1, _080135E8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08013600
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _080135EC
	adds r0, r1, #0
	adds r0, #0x18
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08013600
	b _080135F8
	.align 2, 0
_080135E8: .4byte gPlayerControls
_080135EC:
	adds r0, r1, #0
	subs r0, #0x18
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08013600
_080135F8:
	adds r0, r4, #0
	bl sub_801350C
	b _08013638
_08013600:
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	adds r2, r0, #0
	subs r2, #0xe
	ldr r0, _08013640 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801361E
	rsbs r2, r2, #0
_0801361E:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022318
	movs r0, #0xf
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013638:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013640: .4byte gUnknown_03005424

	thumb_func_start sub_8013644
sub_8013644: @ 0x08013644
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	beq _08013694
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	add r4, sp, #8
	str r4, [sp]
	ldr r4, _08013690 @ =sub_801ED24
	str r4, [sp, #4]
	bl sub_801E4E4
	adds r2, r0, #0
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080136C6
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x40
	b _080136DA
	.align 2, 0
_08013690: .4byte sub_801ED24
_08013694:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	add r3, sp, #8
	str r3, [sp]
	ldr r3, _080136D0 @ =sub_801ED24
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080136D4
_080136C6:
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	b _080136DC
	.align 2, 0
_080136D0: .4byte sub_801ED24
_080136D4:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0xc0
_080136DA:
	strb r0, [r1]
_080136DC:
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80136E8
sub_80136E8: @ 0x080136E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013704
	b _08013934
_08013704:
	ldr r6, [r4, #0x20]
	movs r0, #8
	ands r6, r0
	cmp r6, #0
	beq _08013710
	b _080138CA
_08013710:
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r1, #0x64
	beq _08013728
	movs r0, #0x65
	strh r0, [r7]
_08013728:
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r0, #0x40
	mov sl, r0
	ands r0, r2
	str r1, [sp, #4]
	cmp r0, #0
	beq _080137FC
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r1, _08013774 @ =gUnknown_03005424
	mov r8, r1
	ldrh r1, [r1]
	movs r2, #0x80
	mov sb, r2
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08013754
	rsbs r5, r5, #0
_08013754:
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r3, r0, r5
	str r3, [r4, #0xc]
	cmp r2, #2
	ble _08013778
	adds r0, r4, #0
	bl sub_8013C50
	b _0801393A
	.align 2, 0
_08013774: .4byte gUnknown_03005424
_08013778:
	cmp r2, #0
	ble _080137A4
	adds r1, r4, #0
	adds r1, #0x24
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _0801379C @ =gPlayer
	ldr r0, _080137A0 @ =PlayerCB_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_0801379C: .4byte gPlayer
_080137A0: .4byte PlayerCB_8013BD4
_080137A4:
	cmp r2, #0
	bge _080137AA
	b _0801392C
_080137AA:
	movs r5, #0x90
	lsls r5, r5, #4
	mov r0, r8
	ldrh r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _080137BC
	rsbs r5, r5, #0
_080137BC:
	subs r0, r3, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bge _080137E4
	movs r0, #0x66
	strh r0, [r7]
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	b _080138D2
_080137E4:
	movs r0, #0x66
	strh r0, [r7]
	movs r1, #0xc0
	ldr r0, [r4, #0x20]
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080137F6
	movs r1, #0x80
_080137F6:
	rsbs r0, r1, #0
	strh r0, [r4, #0x12]
	b _080138D2
_080137FC:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080138BE
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r0, _0801384C @ =gUnknown_03005424
	mov r8, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801381C
	rsbs r5, r5, #0
_0801381C:
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bgt _080138CA
	mov r2, r8
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08013850
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	b _0801385A
	.align 2, 0
_0801384C: .4byte gUnknown_03005424
_08013850:
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
_0801385A:
	adds r2, r0, #0
	cmp r2, #0
	bge _080138A8
	ldr r0, _08013874 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013878
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _0801387E
	.align 2, 0
_08013874: .4byte gUnknown_03005424
_08013878:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_0801387E:
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r2, [r1]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _080138A0 @ =gPlayer
	ldr r0, _080138A4 @ =PlayerCB_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_080138A0: .4byte gPlayer
_080138A4: .4byte PlayerCB_8013BD4
_080138A8:
	movs r0, #0x67
	strh r0, [r7]
	movs r2, #0xc0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080138BA
	movs r2, #0x80
_080138BA:
	strh r2, [r4, #0x12]
	b _080138D2
_080138BE:
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	cmp r2, #0
	ble _080138D2
_080138CA:
	adds r0, r4, #0
	bl sub_8013CA0
	b _0801393A
_080138D2:
	movs r2, #1
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r5, #0xc0
	ands r5, r0
	cmp r5, #0
	bne _08013914
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
	adds r2, r0, #0
	cmp r2, #0
	bge _08013914
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
_0801390E:
	movs r0, #0x5d
	strh r0, [r7]
	b _0801393A
_08013914:
	cmp r2, #0
	beq _0801392C
	adds r1, r4, #0
	adds r1, #0xad
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801392C
	movs r0, #3
	strb r0, [r1]
_0801392C:
	adds r0, r4, #0
	bl sub_801394C
	b _0801393A
_08013934:
	adds r0, r4, #0
	bl sub_8013CA0
_0801393A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801394C
sub_801394C: @ 0x0801394C
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _080139A8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080139A2
	ldr r0, _080139AC @ =0x0000FD60
	strh r0, [r3, #0x12]
	movs r2, #0xc0
	lsls r2, r2, #2
	strh r2, [r3, #0x10]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ands r0, r1
	cmp r0, #0
	beq _0801397C
	rsbs r0, r2, #0
	strh r0, [r3, #0x10]
_0801397C:
	ldr r0, [r3, #0x20]
	movs r2, #4
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	adds r1, #0xfe
	orrs r0, r1
	str r0, [r3, #0x20]
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #9
	strb r0, [r3, #0x17]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6d
	strb r2, [r0]
_080139A2:
	pop {r0}
	bx r0
	.align 2, 0
_080139A8: .4byte gPlayerControls
_080139AC: .4byte 0x0000FD60

	thumb_func_start sub_80139B0
sub_80139B0: @ 0x080139B0
	push {r4, lr}
	mov ip, r0
	movs r1, #0x14
	ldrsh r3, [r0, r1]
	cmp r3, #0
	bge _080139BE
	rsbs r3, r3, #0
_080139BE:
	mov r0, ip
	adds r0, #0xad
	ldrb r2, [r0]
	ldr r1, _080139D0 @ =0x000002FF
	adds r4, r0, #0
	cmp r3, r1
	bgt _080139D4
	adds r3, #6
	b _080139E4
	.align 2, 0
_080139D0: .4byte 0x000002FF
_080139D4:
	ldr r0, _08013A14 @ =0x00000EFF
	cmp r3, r0
	bgt _080139E4
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0
	bne _080139E4
	adds r3, #3
_080139E4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013A00
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r3, r0
	ble _08013A00
	subs r3, #9
	cmp r3, r0
	bge _08013A00
	adds r3, r0, #0
_08013A00:
	ldrb r0, [r4]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08013A18
	rsbs r0, r3, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	b _08013A1C
	.align 2, 0
_08013A14: .4byte 0x00000EFF
_08013A18:
	mov r0, ip
	strh r3, [r0, #0x14]
_08013A1C:
	mov r0, ip
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013A48
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x80
	beq _08013A7E
	asrs r0, r1, #0x18
	cmp r0, #0
	bge _08013A3E
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013A3E:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	b _08013A7C
_08013A48:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013A6C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08013A7E
	cmp r0, #0
	ble _08013A62
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013A62:
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r0, r0, r2
	b _08013A7C
_08013A6C:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08013A7E
	adds r0, r1, #2
	lsls r0, r0, #0x18
_08013A7C:
	lsrs r2, r0, #0x18
_08013A7E:
	strb r2, [r4]
	ldr r1, _08013AAC @ =gSineTable
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x15
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	mov r3, ip
	strh r0, [r3, #0x10]
	ldrh r1, [r3, #0x12]
	movs r2, #0x12
	ldrsh r0, [r3, r2]
	cmp r0, #0x7f
	bgt _08013AB0
	adds r0, r1, #0
	adds r0, #0x18
	b _08013AB6
	.align 2, 0
_08013AAC: .4byte gSineTable
_08013AB0:
	adds r0, r1, #0
	subs r0, #0x18
	mov r3, ip
_08013AB6:
	strh r0, [r3, #0x12]
	ldr r1, _08013AC4 @ =gCamera
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	ble _08013AC8
	subs r0, #2
	b _08013ACE
	.align 2, 0
_08013AC4: .4byte gCamera
_08013AC8:
	cmp r0, #0
	bge _08013AD0
	adds r0, #4
_08013ACE:
	str r0, [r1, #0x4c]
_08013AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013AD8
sub_8013AD8: @ 0x08013AD8
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	movs r0, #6
	strb r0, [r3, #0x16]
	strb r0, [r3, #0x17]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #0x12]
	adds r0, r0, r1
	strh r0, [r3, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08013B02
	movs r0, #0
	strh r0, [r3, #0x12]
_08013B02:
	movs r2, #0xc0
	lsls r2, r2, #2
	strh r2, [r3, #0x14]
	ldr r1, [r3, #0x20]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013B16
	asrs r0, r2, #1
	strh r0, [r3, #0x14]
_08013B16:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08013B2E
	ldrh r0, [r3, #0x14]
	rsbs r0, r0, #0
	strh r0, [r3, #0x14]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0xad
	movs r0, #0x80
	b _08013B38
_08013B2E:
	ldrh r0, [r3, #0x14]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0xad
	movs r0, #0
_08013B38:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0xac
	strb r0, [r2]
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08013B64 @ =gPlayer
	ldr r1, _08013B68 @ =PlayerCB_8013BB4
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08013B64: .4byte gPlayer
_08013B68: .4byte PlayerCB_8013BB4

	thumb_func_start PlayerCB_8013B6C
PlayerCB_8013B6C: @ 0x08013B6C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013BA8
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08013BA0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	b _08013BA6
_08013BA0:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08013BA6:
	strb r0, [r1]
_08013BA8:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013BB4
PlayerCB_8013BB4: @ 0x08013BB4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80139B0
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_80131B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013BD4
PlayerCB_8013BD4: @ 0x08013BD4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_8013498
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013BF0
PlayerCB_8013BF0: @ 0x08013BF0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013C0C
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013C0C:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013C18
PlayerCB_8013C18: @ 0x08013C18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80135BC
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayerCB_8013C34
PlayerCB_8013C34: @ 0x08013C34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80136E8
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C50
sub_8013C50: @ 0x08013C50
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x68
	strh r0, [r1]
	ldr r0, _08013C74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013C78
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	b _08013C82
	.align 2, 0
_08013C74: .4byte gUnknown_03005424
_08013C78:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
_08013C82:
	str r0, [r2, #0xc]
	ldr r1, _08013C98 @ =gPlayer
	ldr r0, _08013C9C @ =PlayerCB_8013E64
	str r0, [r1]
	adds r1, r2, #0
	adds r1, #0xad
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013C98: .4byte gPlayer
_08013C9C: .4byte PlayerCB_8013E64

	thumb_func_start sub_8013CA0
sub_8013CA0: @ 0x08013CA0
	ldr r2, _08013CB8 @ =gPlayer
	ldr r1, _08013CBC @ =PlayerCB_8013BD4
	str r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0x64
	movs r1, #0x5d
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013CB8: .4byte gPlayer
_08013CBC: .4byte PlayerCB_8013BD4

	thumb_func_start sub_8013CC0
sub_8013CC0: @ 0x08013CC0
	push {lr}
	adds r2, r0, #0
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08013CCE
	rsbs r1, r1, #0
_08013CCE:
	ldr r0, _08013CE4 @ =0x000002FF
	cmp r1, r0
	bgt _08013CEE
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013CE8
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08013CEC
	.align 2, 0
_08013CE4: .4byte 0x000002FF
_08013CE8:
	movs r0, #0xc0
	lsls r0, r0, #2
_08013CEC:
	strh r0, [r2, #0x14]
_08013CEE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013CF4
sub_8013CF4: @ 0x08013CF4
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013D06
	subs r1, #0x60
	cmp r1, #0
	bge _08013D12
	b _08013D10
_08013D06:
	cmp r1, #0
	bge _08013D14
	adds r1, #0x60
	cmp r1, #0
	ble _08013D12
_08013D10:
	movs r1, #0
_08013D12:
	strh r1, [r0, #0x14]
_08013D14:
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013D18
PlayerCB_8013D18: @ 0x08013D18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r3, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _08013D6C @ =0x20000100
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013D70 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6a
	strh r0, [r1]
	strh r3, [r4, #0x10]
	strh r3, [r4, #0x12]
	movs r0, #0xe2
	bl m4aSongNumStart
	ldr r0, _08013D74 @ =gPlayer
	ldr r1, _08013D78 @ =PlayerCB_8013DA8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D6C: .4byte 0x20000100
_08013D70: .4byte 0xFFFFBFFF
_08013D74: .4byte gPlayer
_08013D78: .4byte PlayerCB_8013DA8

	thumb_func_start sub_8013D7C
sub_8013D7C: @ 0x08013D7C
	ldr r2, _08013DA0 @ =gPlayer
	ldr r1, _08013DA4 @ =PlayerCB_8013BD4
	str r1, [r2]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x5d
	strh r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0xac
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08013DA0: .4byte gPlayer
_08013DA4: .4byte PlayerCB_8013BD4

	thumb_func_start PlayerCB_8013DA8
PlayerCB_8013DA8: @ 0x08013DA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80283C4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013DEC
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x6b
	strh r0, [r1]
	strh r2, [r4, #0x10]
	adds r0, #0x95
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8012DF8
	ldr r0, _08013DF4 @ =gPlayer
	ldr r1, _08013DF8 @ =PlayerCB_8013DFC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_08013DEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DF4: .4byte gPlayer
_08013DF8: .4byte PlayerCB_8013DFC

	thumb_func_start PlayerCB_8013DFC
PlayerCB_8013DFC: @ 0x08013DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80283C4
	ldr r2, [r4, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _08013E26
	ldr r1, _08013E2C @ =gPlayer
	ldr r0, _08013E30 @ =PlayerCB_8013E34
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6c
	strh r0, [r1]
	strh r2, [r4, #0x12]
_08013E26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013E2C: .4byte gPlayer
_08013E30: .4byte PlayerCB_8013E34

	thumb_func_start PlayerCB_8013E34
PlayerCB_8013E34: @ 0x08013E34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013E5E
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013E5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start PlayerCB_8013E64
PlayerCB_8013E64: @ 0x08013E64
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013ECE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08013E98 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013E9C
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	b _08013EA6
	.align 2, 0
_08013E98: .4byte gUnknown_03005424
_08013E9C:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
_08013EA6:
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013EBC
	ldr r0, [r4, #8]
	ldr r1, _08013EB8 @ =0xFFFFF000
	b _08013EC2
	.align 2, 0
_08013EB8: .4byte 0xFFFFF000
_08013EBC:
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #5
_08013EC2:
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl PlayerCB_8025318
	b _08013EDA
_08013ECE:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
_08013EDA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013EE0
sub_8013EE0: @ 0x08013EE0
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013EF2
	subs r1, #0x60
	cmp r1, #0
	bge _08013EFE
	b _08013EFC
_08013EF2:
	cmp r1, #0
	bge _08013F00
	adds r1, #0x60
	cmp r1, #0
	ble _08013EFE
_08013EFC:
	movs r1, #0
_08013EFE:
	strh r1, [r0, #0x14]
_08013F00:
	pop {r0}
	bx r0

	thumb_func_start sub_8013F04
sub_8013F04: @ 0x08013F04
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013F54 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	bl sub_8015BD4
	ldr r0, _08013F58 @ =gPlayer
	ldr r1, _08013F5C @ =PlayerCB_8013F60
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F54: .4byte 0xFFFFBFFF
_08013F58: .4byte gPlayer
_08013F5C: .4byte PlayerCB_8013F60

	thumb_func_start PlayerCB_8013F60
PlayerCB_8013F60: @ 0x08013F60
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08013F74
	subs r0, #0x60
	cmp r0, #0
	bge _08013F80
	b _08013F7E
_08013F74:
	cmp r0, #0
	bge _08013F82
	adds r0, #0x60
	cmp r0, #0
	ble _08013F80
_08013F7E:
	movs r0, #0
_08013F80:
	strh r0, [r2, #0x14]
_08013F82:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013F9A
	ldr r1, _08013FA4 @ =gPlayer
	ldr r0, _08013FA8 @ =PlayerCB_8025318
	str r0, [r1]
_08013F9A:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_08013FA4: .4byte gPlayer
_08013FA8: .4byte PlayerCB_8025318
