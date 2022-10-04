.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8036168
sub_8036168: @ 0x08036168
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080361B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080361B8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0803619E
	ldr r0, _080361BC @ =IWRAM_START + 0x68
	adds r2, r1, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0xb4
	ble _0803619E
	ldr r0, _080361C0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0803619E
	movs r0, #0xb4
	strh r0, [r2]
_0803619E:
	adds r0, r6, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0xb4
	bne _080361C4
	movs r0, #0xd0
	bl m4aSongNumStart
	b _080361DA
	.align 2, 0
_080361B4: .4byte gCurTask
_080361B8: .4byte gGameMode
_080361BC: .4byte IWRAM_START + 0x68
_080361C0: .4byte gPressedKeys
_080361C4:
	cmp r1, #0x78
	bne _080361D0
	movs r0, #0xd1
	bl m4aSongNumStart
	b _080361DA
_080361D0:
	cmp r1, #0x3c
	bne _080361DA
	movs r0, #0xd2
	bl m4aSongNumStart
_080361DA:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08036268
	ldr r3, _0803621C @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	ldr r1, _08036220 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	ldr r2, _08036224 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08036228 @ =0x0000FFFE
	ands r0, r1
	ldr r1, _0803622C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036230
	movs r0, #0x90
	lsls r0, r0, #4
	b _08036234
	.align 2, 0
_0803621C: .4byte gUnknown_030059E0
_08036220: .4byte 0xFFDFFFFF
_08036224: .4byte gUnknown_03005424
_08036228: .4byte 0x0000FFFE
_0803622C: .4byte 0x0000FEFF
_08036230:
	movs r0, #0x80
	lsls r0, r0, #3
_08036234:
	strh r0, [r3, #0x14]
	bl sub_8018818
	bl sub_8036400
	ldr r1, _0803625C @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	str r0, [r6, #0x60]
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [r6, #0x64]
	movs r0, #0xd3
	bl m4aSongNumStart
	ldr r0, _08036260 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08036264 @ =sub_8036398
	str r0, [r1, #8]
	b _080362A0
	.align 2, 0
_0803625C: .4byte gUnknown_030059E0
_08036260: .4byte gCurTask
_08036264: .4byte sub_8036398
_08036268:
	cmp r0, #4
	bgt _0803628C
	ldr r0, _08036288 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080362A0
	adds r0, r6, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080362A0
	adds r1, r6, #0
	adds r1, #0x6a
	b _0803629C
	.align 2, 0
_08036288: .4byte gPressedKeys
_0803628C:
	ldr r0, _08036364 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080362A0
	adds r1, r6, #0
	adds r1, #0x6b
_0803629C:
	movs r0, #1
	strb r0, [r1]
_080362A0:
	ldr r5, _08036368 @ =gUnknown_030059E0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r7, _0803636C @ =gUnknown_03005960
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb3
	bgt _0803630E
	adds r4, r6, #0
	adds r4, #0x30
	movs r1, #0x3c
	bl Div
	movs r1, #2
	subs r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x50
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	adds r0, #0x18
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	subs r0, #0x18
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803630E:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #0x46
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _0803638C
	ldr r3, _08036370 @ =gUnknown_080D7518
	ldr r2, _08036374 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #6]
	adds r1, r5, #0
	adds r1, #0x6a
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08036378 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08036380
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, _0803637C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #0x31
	strb r0, [r1]
	b _0803638C
	.align 2, 0
_08036364: .4byte gPressedKeys
_08036368: .4byte gUnknown_030059E0
_0803636C: .4byte gUnknown_03005960
_08036370: .4byte gUnknown_080D7518
_08036374: .4byte gSelectedCharacter
_08036378: .4byte gGameMode
_0803637C: .4byte 0x04000128
_08036380:
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x31
	movs r1, #0
	strb r1, [r0]
_0803638C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036398
sub_8036398: @ 0x08036398
	push {r4, r5, r6, lr}
	ldr r4, _080363E4 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r6, r5, #0
	ldr r0, [r5, #0x60]
	ldr r3, _080363E8 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r2, [r5, #0x64]
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r5, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080363DA
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080363DA
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080363EC
_080363DA:
	ldr r0, [r4]
	bl TaskDestroy
	b _080363F8
	.align 2, 0
_080363E4: .4byte gCurTask
_080363E8: .4byte gUnknown_03005960
_080363EC:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080363F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036400
sub_8036400: @ 0x08036400
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080364EC @ =sub_8036524
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _080364F0 @ =sub_8036654
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, _080364F4 @ =IWRAM_START + 0x78
	adds r1, r5, r0
	movs r0, #0
	mov r8, r0
	movs r0, #0x3c
	strh r0, [r1]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _080364F8 @ =0x0000046A
	strh r1, [r4, #0xa]
	ldr r1, _080364FC @ =IWRAM_START + 0x20
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08036500 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r1, _08036504 @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08036508 @ =IWRAM_START + 0x25
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	movs r7, #1
	rsbs r7, r7, #0
	str r7, [r4, #0x28]
	ldr r6, _0803650C @ =gUnknown_030054B8
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	movs r1, #0x60
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, _08036510 @ =IWRAM_START + 0x3C
	adds r4, r5, r0
	movs r0, #0x40
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _080364F8 @ =0x0000046A
	strh r1, [r4, #0xa]
	ldr r0, _08036514 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08036518 @ =IWRAM_START + 0x5D
	adds r1, r5, r0
	adds r0, r7, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r1, _0803651C @ =IWRAM_START + 0x5E
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	ldr r0, _08036520 @ =IWRAM_START + 0x61
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	str r7, [r4, #0x28]
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	mov r1, sl
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080364EC: .4byte sub_8036524
_080364F0: .4byte sub_8036654
_080364F4: .4byte IWRAM_START + 0x78
_080364F8: .4byte 0x0000046A
_080364FC: .4byte IWRAM_START + 0x20
_08036500: .4byte IWRAM_START + 0x21
_08036504: .4byte IWRAM_START + 0x22
_08036508: .4byte IWRAM_START + 0x25
_0803650C: .4byte gUnknown_030054B8
_08036510: .4byte IWRAM_START + 0x3C
_08036514: .4byte IWRAM_START + 0x5C
_08036518: .4byte IWRAM_START + 0x5D
_0803651C: .4byte IWRAM_START + 0x5E
_08036520: .4byte IWRAM_START + 0x61

	thumb_func_start sub_8036524
sub_8036524: @ 0x08036524
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803654C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0x78
	adds r3, r1, r0
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08036550
	adds r0, r2, #0
	bl TaskDestroy
	b _08036630
	.align 2, 0
_0803654C: .4byte gCurTask
_08036550:
	adds r6, r7, #0
	ldr r2, _08036594 @ =IWRAM_START + 0x30
	adds r5, r1, r2
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x28
	strh r0, [r6, #0x18]
	ldr r2, _08036598 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #0x10]
	movs r0, #0
	strh r0, [r5]
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0xf
	bgt _0803659C
	lsls r0, r1, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r3]
	adds r0, #1
	lsls r0, r0, #4
	b _080365A2
	.align 2, 0
_08036594: .4byte IWRAM_START + 0x30
_08036598: .4byte gUnknown_030054B8
_0803659C:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
_080365A2:
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x16]
	movs r4, #0
	strh r0, [r5, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	adds r6, #0x3c
	adds r5, r7, #0
	adds r5, #0x6c
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x28
	strh r0, [r6, #0x18]
	ldr r2, _08036608 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #0x10]
	strh r4, [r5]
	adds r2, r7, #0
	adds r2, #0x78
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xf
	bgt _0803660C
	lsls r0, r1, #4
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r2]
	adds r0, #1
	lsls r0, r0, #4
	b _08036612
	.align 2, 0
_08036608: .4byte gUnknown_030054B8
_0803660C:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
_08036612:
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r5, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_08036630:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036638
sub_8036638: @ 0x08036638
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8036654
sub_8036654: @ 0x08036654
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #4]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
