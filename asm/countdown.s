.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
