.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Create_Buzzer
Create_Buzzer: @ 0x08052F94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, _080530AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _08052FD0
	ldr r0, _080530B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bgt _08052FD0
	ldr r0, _080530B4 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805309A
_08052FD0:
	ldr r0, _080530B8 @ =sub_80530E0
	ldr r2, _080530BC @ =0x00004030
	ldr r1, _080530C0 @ =sub_8053770
	str r1, [sp]
	movs r1, #0x6c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r5, r1
	ldr r0, _080530C4 @ =IWRAM_START + 0xC
	adds r6, r5, r0
	movs r4, #0
	mov r2, sb
	strh r2, [r1, #4]
	mov r0, sl
	strh r0, [r1, #6]
	str r7, [r1]
	ldrb r0, [r7]
	strb r0, [r1, #8]
	mov r2, r8
	strb r2, [r1, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sb
	lsls r3, r2, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r1, #0x44]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov sb, r0
	mov r0, sl
	lsls r2, r0, #8
	add sb, r2
	mov r0, sb
	lsls r0, r0, #8
	str r0, [r1, #0x48]
	str r4, [r1, #0x4c]
	str r4, [r1, #0x50]
	str r4, [r1, #0x54]
	str r4, [r1, #0x58]
	str r4, [r1, #0x60]
	ldr r0, _080530C8 @ =IWRAM_START + 0x64
	strh r4, [r0, r5]
	adds r0, #2
	strh r4, [r0, r5]
	str r4, [r1, #0x5c]
	ldr r1, _080530CC @ =IWRAM_START + 0x68
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r6, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	ldr r1, _080530D0 @ =IWRAM_START + 0x2C
	adds r0, r5, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	ldr r0, _080530D4 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _080530D8 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080530DC @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
_0805309A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080530AC: .4byte gGameMode
_080530B0: .4byte gCurrentLevel
_080530B4: .4byte gUnknown_030054EC
_080530B8: .4byte sub_80530E0
_080530BC: .4byte 0x00004030
_080530C0: .4byte sub_8053770
_080530C4: .4byte IWRAM_START + 0xC
_080530C8: .4byte IWRAM_START + 0x64
_080530CC: .4byte IWRAM_START + 0x68
_080530D0: .4byte IWRAM_START + 0x2C
_080530D4: .4byte IWRAM_START + 0x2D
_080530D8: .4byte IWRAM_START + 0x2E
_080530DC: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80530E0
sub_80530E0: @ 0x080530E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805311C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r0, _08053120 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08053124
	mov r2, r8
	ldr r0, [r2, #0x4c]
	adds r0, #0xc0
	str r0, [r2, #0x4c]
	b _0805312C
	.align 2, 0
_0805311C: .4byte gCurTask
_08053120: .4byte IWRAM_START + 0xC
_08053124:
	mov r3, r8
	ldr r0, [r3, #0x4c]
	subs r0, #0xc0
	str r0, [r3, #0x4c]
_0805312C:
	mov r0, r8
	ldr r1, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	mov r3, r8
	ldr r2, [r3, #0x48]
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r4, _080531C8 @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r3, sb
	strh r0, [r3, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	mov r0, sb
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080531BE
	mov r1, r8
	ldr r0, [r1, #0x44]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805318E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805318E
	mov r1, r8
	ldr r0, [r1, #0x48]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805318E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080531D0
_0805318E:
	mov r1, sb
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080531B6
	mov r2, sb
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _080531B6
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080531D0
_080531B6:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
_080531BE:
	ldr r0, _080531CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805339C
	.align 2, 0
_080531C8: .4byte gCamera
_080531CC: .4byte gCurTask
_080531D0:
	mov r0, r8
	adds r0, #0x68
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _080531E8
	subs r0, r1, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080531E8
	b _080532FC
_080531E8:
	mov r3, sb
	ldr r1, [r3, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08053264
	ldr r3, _08053258 @ =gPlayer
	ldr r0, [r3, #8]
	asrs r2, r0, #8
	adds r0, r6, #0
	subs r0, #0x3c
	cmp r2, r0
	ble _08053264
	cmp r2, r6
	bge _08053264
	ldr r0, [r3, #0xc]
	asrs r2, r0, #8
	cmp r2, r7
	ble _08053264
	adds r0, r7, #0
	adds r0, #0x50
	cmp r2, r0
	bge _08053264
	ldr r0, _0805325C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08053260 @ =sub_80534F0
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	mov r1, sb
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3, #0xc]
	mov r2, r8
	str r0, [r2, #0x5c]
	lsls r5, r6, #8
	ldr r0, [r3, #8]
	subs r0, r0, r5
	movs r1, #0x20
	str r3, [sp, #4]
	bl Div
	mov r1, r8
	adds r1, #0x64
	strh r0, [r1]
	lsls r4, r7, #8
	ldr r3, [sp, #4]
	ldr r0, [r3, #0xc]
	b _080532E0
	.align 2, 0
_08053258: .4byte gPlayer
_0805325C: .4byte gCurTask
_08053260: .4byte sub_80534F0
_08053264:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080532FC
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080532FC
	ldr r3, _080532F0 @ =gPlayer
	mov sl, r3
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	cmp r1, r6
	ble _080532FC
	adds r0, r6, #0
	adds r0, #0x3c
	cmp r1, r0
	bge _080532FC
	ldr r0, [r3, #0xc]
	asrs r1, r0, #8
	cmp r1, r7
	ble _080532FC
	adds r0, r7, #0
	adds r0, #0x50
	cmp r1, r0
	bge _080532FC
	ldr r0, _080532F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080532F8 @ =sub_80534F0
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	mov r1, sb
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3, #0xc]
	mov r2, r8
	str r0, [r2, #0x5c]
	lsls r5, r6, #8
	ldr r0, [r3, #8]
	subs r0, r5, r0
	movs r1, #0x20
	bl Div
	mov r4, r8
	adds r4, #0x64
	strh r0, [r4]
	mov r3, sl
	ldr r0, [r3, #8]
	subs r0, r0, r5
	movs r1, #0x20
	bl Div
	strh r0, [r4]
	lsls r4, r7, #8
	mov r1, sl
	ldr r0, [r1, #0xc]
_080532E0:
	subs r0, r0, r4
	movs r1, #0x20
	bl Div
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	b _08053388
	.align 2, 0
_080532F0: .4byte gPlayer
_080532F4: .4byte gCurTask
_080532F8: .4byte sub_80534F0
_080532FC:
	mov r2, r8
	ldr r1, [r2, #0x4c]
	asrs r3, r1, #8
	ldr r2, [sp]
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _0805334C
	mov r3, sb
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0805334C
	ldr r0, _08053344 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08053348 @ =sub_80533B4
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	mov r1, sb
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	lsls r5, r6, #8
	lsls r4, r7, #8
	b _08053388
	.align 2, 0
_08053344: .4byte gCurTask
_08053348: .4byte sub_80533B4
_0805334C:
	asrs r1, r4, #8
	ldr r2, [sp]
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	lsls r5, r6, #8
	lsls r4, r7, #8
	cmp r1, r0
	blt _08053388
	mov r3, sb
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08053388
	ldr r0, _080533AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080533B0 @ =sub_80533B4
	str r0, [r1, #8]
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r3, #0xa]
	mov r1, sb
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08053388:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80122DC
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
_0805339C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080533AC: .4byte gCurTask
_080533B0: .4byte sub_80533B4

	thumb_func_start sub_80533B4
sub_80533B4: @ 0x080533B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0805340C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, _08053410 @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r0, [r7]
	mov sl, r0
	ldr r1, [r7, #0x44]
	ldr r0, [r7, #0x4c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r7, #0x48]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08053414 @ =gCamera
	mov r8, r3
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08053418
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _080534D8
	.align 2, 0
_0805340C: .4byte gCurTask
_08053410: .4byte IWRAM_START + 0xC
_08053414: .4byte gCamera
_08053418:
	ldr r0, [r7, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805344A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805344A
	ldr r0, [r7, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805344A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08053484
_0805344A:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805346E
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805346E
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08053484
_0805346E:
	ldrb r0, [r7, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08053480 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080534D8
	.align 2, 0
_08053480: .4byte gCurTask
_08053484:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _080534D2
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080534B0
	ldr r0, _080534AC @ =0xFFFFFBFF
	ands r1, r0
	b _080534B2
	.align 2, 0
_080534AC: .4byte 0xFFFFFBFF
_080534B0:
	orrs r1, r2
_080534B2:
	str r1, [r6, #0x10]
	movs r1, #0
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080534E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080534EC @ =sub_80530E0
	str r0, [r1, #8]
_080534D2:
	adds r0, r6, #0
	bl sub_80051E8
_080534D8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080534E8: .4byte gCurTask
_080534EC: .4byte sub_80530E0

	thumb_func_start sub_80534F0
sub_80534F0: @ 0x080534F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08053568 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r2, _0805356C @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r6]
	mov sl, r3
	adds r2, #0x58
	adds r0, r1, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r2, [r6, #0x54]
	adds r2, r2, r0
	str r2, [r6, #0x54]
	ldr r0, _08053570 @ =IWRAM_START + 0x66
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r3, [r6, #0x58]
	adds r3, r3, r0
	str r3, [r6, #0x58]
	ldr r1, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r1, r1, r0
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x48]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r0, _08053574 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08053578
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08053608
	.align 2, 0
_08053568: .4byte gCurTask
_0805356C: .4byte IWRAM_START + 0xC
_08053570: .4byte IWRAM_START + 0x66
_08053574: .4byte gCamera
_08053578:
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080535AA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080535AA
	ldr r0, [r6, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080535AA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080535E4
_080535AA:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080535CE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080535CE
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080535E4
_080535CE:
	ldrb r0, [r6, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _080535E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08053608
	.align 2, 0
_080535E0: .4byte gCurTask
_080535E4:
	lsls r0, r4, #8
	lsls r4, r5, #8
	adds r1, r4, #0
	bl sub_80122DC
	ldr r0, [r6, #0x5c]
	cmp r4, r0
	ble _080535FC
	ldr r0, _08053618 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805361C @ =sub_8053620
	str r0, [r1, #8]
_080535FC:
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08053608:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053618: .4byte gCurTask
_0805361C: .4byte sub_8053620

	thumb_func_start sub_8053620
sub_8053620: @ 0x08053620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08053698 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _0805369C @ =IWRAM_START + 0xC
	adds r7, r1, r2
	ldr r3, [r4]
	mov sl, r3
	adds r2, #0x58
	adds r0, r1, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r2, [r4, #0x54]
	subs r2, r2, r0
	str r2, [r4, #0x54]
	ldr r0, _080536A0 @ =IWRAM_START + 0x66
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r3, [r4, #0x58]
	subs r3, r3, r0
	str r3, [r4, #0x58]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r1, r1, r0
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r4, #0x48]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r0, _080536A4 @ =gCamera
	mov r8, r0
	ldr r0, [r0]
	subs r0, r5, r0
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080536A8
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _0805375A
	.align 2, 0
_08053698: .4byte gCurTask
_0805369C: .4byte IWRAM_START + 0xC
_080536A0: .4byte IWRAM_START + 0x66
_080536A4: .4byte gCamera
_080536A8:
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080536DA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080536DA
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080536DA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08053714
_080536DA:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080536FE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080536FE
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08053714
_080536FE:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08053710 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805375A
	.align 2, 0
_08053710: .4byte gCurTask
_08053714:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bgt _0805374E
	movs r0, #0
	str r0, [r4, #0x54]
	str r0, [r4, #0x58]
	movs r1, #0
	movs r0, #0xf1
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x68
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08053768 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805376C @ =sub_80530E0
	str r0, [r1, #8]
_0805374E:
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_0805375A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053768: .4byte gCurTask
_0805376C: .4byte sub_80530E0

	thumb_func_start sub_8053770
sub_8053770: @ 0x08053770
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
