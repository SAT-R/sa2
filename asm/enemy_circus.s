.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Enemy_Circus
initSprite_Enemy_Circus: @ 0x080557F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0805584C @ =sub_8055950
	ldr r2, _08055850 @ =0x00004090
	ldr r1, _08055854 @ =sub_8055EC0
	str r1, [sp]
	movs r1, #0x8c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sl, r0
	ldr r0, _08055858 @ =IWRAM_START + 0xC
	adds r7, r1, r0
	mov r2, sl
	strh r5, [r2, #4]
	mov r0, r8
	strh r0, [r2, #6]
	str r6, [r2]
	ldrb r0, [r6]
	strb r0, [r2, #8]
	strb r4, [r2, #9]
	movs r0, #4
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08055860
	ldr r2, _0805585C @ =IWRAM_START + 0x85
	adds r1, r1, r2
	movs r0, #1
	b _08055866
	.align 2, 0
_0805584C: .4byte sub_8055950
_08055850: .4byte 0x00004090
_08055854: .4byte sub_8055EC0
_08055858: .4byte IWRAM_START + 0xC
_0805585C: .4byte IWRAM_START + 0x85
_08055860:
	ldr r4, _08055948 @ =IWRAM_START + 0x85
	adds r1, r1, r4
	movs r0, #0
_08055866:
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r3, r5, #8
	adds r0, r0, r3
	lsls r0, r0, #8
	mov r1, sl
	str r0, [r1, #0x7c]
	adds r1, #0x80
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r4, r8
	lsls r2, r4, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r1]
	adds r1, #4
	movs r4, #0
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r5, #0
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r0, r0, r2
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0805594C @ =0x000001EF
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r2, #0x90
	lsls r2, r2, #3
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	mov sb, r1
	mov r2, sb
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r6, #0x80
	lsls r6, r6, #6
	str r6, [r7, #0x10]
	mov r7, sl
	adds r7, #0x44
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xf8
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r1, sl
	adds r1, #0x64
	movs r0, #2
	strb r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x65
	subs r0, #3
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x66
	mov r2, sb
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	mov r4, r8
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055948: .4byte IWRAM_START + 0x85
_0805594C: .4byte 0x000001EF

	thumb_func_start sub_8055950
sub_8055950: @ 0x08055950
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _080559B8 @ =gCurTask
	ldr r0, [r1]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov r8, r0
	ldr r2, _080559BC @ =IWRAM_START + 0xC
	adds r4, r5, r2
	ldr r0, _080559C0 @ =IWRAM_START + 0x44
	adds r0, r0, r5
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r2, r8
	ldr r0, [r2, #0x7c]
	asrs r0, r0, #8
	mov sl, r0
	mov r6, sl
	ldr r0, _080559C4 @ =IWRAM_START + 0x80
	adds r0, r5, r0
	str r0, [sp, #4]
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r1, _080559C8 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	mov r1, sl
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _080559CC
	ldr r1, _080559B8 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08055A86
	.align 2, 0
_080559B8: .4byte gCurTask
_080559BC: .4byte IWRAM_START + 0xC
_080559C0: .4byte IWRAM_START + 0x44
_080559C4: .4byte IWRAM_START + 0x80
_080559C8: .4byte gCamera
_080559CC:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080559F0
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _080559F0
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055A08
_080559F0:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055A04 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055A86
	.align 2, 0
_08055A04: .4byte gCurTask
_08055A08:
	ldr r0, _08055A98 @ =IWRAM_START + 0x84
	adds r2, r5, r0
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r3, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08055A50
	ldr r0, _08055A9C @ =IWRAM_START + 0x88
	adds r1, r5, r0
	movs r0, #0xfb
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r0, _08055AA0 @ =IWRAM_START + 0x86
	adds r1, r5, r0
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r1]
	movs r0, #0x1e
	strb r0, [r2]
	ldr r2, _08055AA4 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08055AA8 @ =sub_8055AB8
	str r0, [r1, #8]
	ldr r0, _08055AAC @ =0x000001EF
	strh r0, [r4, #0xa]
	ldr r0, _08055AB0 @ =IWRAM_START + 0x2C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08055AB4 @ =IWRAM_START + 0x2D
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_08055A50:
	mov r1, r8
	ldr r0, [r1, #0x7c]
	ldr r2, [sp, #4]
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r4, #0x16]
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r4, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, sb
	mov r1, sl
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08055A86:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055A98: .4byte IWRAM_START + 0x84
_08055A9C: .4byte IWRAM_START + 0x88
_08055AA0: .4byte IWRAM_START + 0x86
_08055AA4: .4byte gCurTask
_08055AA8: .4byte sub_8055AB8
_08055AAC: .4byte 0x000001EF
_08055AB0: .4byte IWRAM_START + 0x2C
_08055AB4: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_8055AB8
sub_8055AB8: @ 0x08055AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08055B20 @ =gCurTask
	ldr r0, [r1]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _08055B24 @ =IWRAM_START + 0xC
	adds r4, r7, r2
	ldr r0, _08055B28 @ =IWRAM_START + 0x44
	adds r0, r0, r7
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r2, r8
	ldr r0, [r2, #0x7c]
	asrs r0, r0, #8
	mov sl, r0
	mov r5, sl
	ldr r0, _08055B2C @ =IWRAM_START + 0x80
	adds r0, r7, r0
	str r0, [sp, #4]
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r1, _08055B30 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	mov r1, sl
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08055B34
	ldr r1, _08055B20 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08055BFC
	.align 2, 0
_08055B20: .4byte gCurTask
_08055B24: .4byte IWRAM_START + 0xC
_08055B28: .4byte IWRAM_START + 0x44
_08055B2C: .4byte IWRAM_START + 0x80
_08055B30: .4byte gCamera
_08055B34:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055B58
	movs r2, #0x18
	ldrsh r0, [r4, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08055B58
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055B70
_08055B58:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055B6C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055BFC
	.align 2, 0
_08055B6C: .4byte gCurTask
_08055B70:
	mov r1, r8
	ldr r0, [r1, #0x7c]
	ldr r2, [sp, #4]
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08055BD8
	adds r0, r4, #0
	bl sub_80051E8
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
	ldr r0, _08055BC0 @ =IWRAM_START + 0x84
	adds r1, r7, r0
	movs r0, #0x32
	strb r0, [r1]
	ldr r0, _08055BC4 @ =0x000001EF
	strh r0, [r4, #0xa]
	ldr r2, _08055BC8 @ =IWRAM_START + 0x2C
	adds r1, r7, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08055BCC @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08055BD0 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08055BD4 @ =sub_8055C0C
	str r0, [r1, #8]
	b _08055BFC
	.align 2, 0
_08055BC0: .4byte IWRAM_START + 0x84
_08055BC4: .4byte 0x000001EF
_08055BC8: .4byte IWRAM_START + 0x2C
_08055BCC: .4byte IWRAM_START + 0x2D
_08055BD0: .4byte gCurTask
_08055BD4: .4byte sub_8055C0C
_08055BD8:
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r4, #0x16]
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r4, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	adds r2, r6, #0
	subs r2, #0x20
	mov r0, sb
	mov r1, sl
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08055BFC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8055C0C
sub_8055C0C: @ 0x08055C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08055C98 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	str r0, [sp, #4]
	ldr r7, _08055C9C @ =IWRAM_START + 0xC
	add r7, r8
	ldr r2, _08055CA0 @ =IWRAM_START + 0x44
	add r2, r8
	mov sl, r2
	ldr r0, [r0]
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x7c]
	asrs r0, r0, #8
	mov sb, r0
	mov r4, sb
	ldr r2, _08055CA4 @ =IWRAM_START + 0x80
	add r2, r8
	str r2, [sp, #8]
	ldr r2, [r2]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r1, _08055CA8 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	ldr r0, _08055CAC @ =IWRAM_START + 0x88
	add r0, r8
	ldrh r1, [r0]
	adds r1, #0x31
	strh r1, [r0]
	ldr r6, _08055CB0 @ =IWRAM_START + 0x86
	add r6, r8
	ldrh r0, [r6]
	adds r0, r0, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r7, #0x18]
	adds r0, r0, r1
	subs r0, #0x20
	mov r1, sl
	strh r0, [r1, #0x18]
	ldrh r0, [r7, #0x16]
	strh r0, [r1, #0x16]
	adds r0, r7, #0
	mov r1, sb
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08055CB4
	ldr r2, _08055C98 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08055D54
	.align 2, 0
_08055C98: .4byte gCurTask
_08055C9C: .4byte IWRAM_START + 0xC
_08055CA0: .4byte IWRAM_START + 0x44
_08055CA4: .4byte IWRAM_START + 0x80
_08055CA8: .4byte gCamera
_08055CAC: .4byte IWRAM_START + 0x88
_08055CB0: .4byte IWRAM_START + 0x86
_08055CB4:
	ldrh r2, [r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	adds r2, r2, r5
	subs r2, #0x20
	mov r0, sl
	mov r1, sb
	bl sub_800C84C
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055CEA
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08055CEA
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055D00
_08055CEA:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055CFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055D54
	.align 2, 0
_08055CFC: .4byte gCurTask
_08055D00:
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x7c]
	ldr r2, [sp, #8]
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, sl
	bl sub_8004558
	mov r0, sl
	bl sub_80051E8
	ldr r1, _08055D64 @ =IWRAM_START + 0x84
	add r1, r8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08055D54
	ldr r0, _08055D68 @ =0x000001EF
	strh r0, [r7, #0xa]
	ldr r1, _08055D6C @ =IWRAM_START + 0x2C
	add r1, r8
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08055D70 @ =IWRAM_START + 0x2D
	add r1, r8
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08055D74 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08055D78 @ =sub_8055D7C
	str r0, [r1, #8]
_08055D54:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055D64: .4byte IWRAM_START + 0x84
_08055D68: .4byte 0x000001EF
_08055D6C: .4byte IWRAM_START + 0x2C
_08055D70: .4byte IWRAM_START + 0x2D
_08055D74: .4byte gCurTask
_08055D78: .4byte sub_8055D7C

	thumb_func_start sub_8055D7C
sub_8055D7C: @ 0x08055D7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08055DE0 @ =gCurTask
	ldr r0, [r1]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _08055DE4 @ =IWRAM_START + 0xC
	adds r6, r7, r2
	ldr r0, _08055DE8 @ =IWRAM_START + 0x44
	adds r0, r0, r7
	mov sb, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r2, r8
	ldr r1, [r2, #0x7c]
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r0, _08055DEC @ =IWRAM_START + 0x80
	adds r0, r0, r7
	mov sl, r0
	ldr r2, [r0]
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08055DF0 @ =gCamera
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
	beq _08055DF4
	ldr r1, _08055DE0 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08055EB0
	.align 2, 0
_08055DE0: .4byte gCurTask
_08055DE4: .4byte IWRAM_START + 0xC
_08055DE8: .4byte IWRAM_START + 0x44
_08055DEC: .4byte IWRAM_START + 0x80
_08055DF0: .4byte gCamera
_08055DF4:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08055E18
	movs r2, #0x18
	ldrsh r0, [r6, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08055E18
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08055E30
_08055E18:
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08055E2C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08055EB0
	.align 2, 0
_08055E2C: .4byte gCurTask
_08055E30:
	mov r1, r8
	ldr r0, [r1, #0x7c]
	mov r2, sl
	ldr r1, [r2]
	bl sub_80122DC
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #0
	bne _08055E8C
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, _08055E74 @ =IWRAM_START + 0x84
	adds r1, r7, r0
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08055E78 @ =0x000001EF
	strh r0, [r6, #0xa]
	ldr r2, _08055E7C @ =IWRAM_START + 0x2C
	adds r1, r7, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08055E80 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08055E84 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08055E88 @ =sub_8055950
	str r0, [r1, #8]
	b _08055E92
	.align 2, 0
_08055E74: .4byte IWRAM_START + 0x84
_08055E78: .4byte 0x000001EF
_08055E7C: .4byte IWRAM_START + 0x2C
_08055E80: .4byte IWRAM_START + 0x2D
_08055E84: .4byte gCurTask
_08055E88: .4byte sub_8055950
_08055E8C:
	adds r0, r6, #0
	bl sub_80051E8
_08055E92:
	ldrh r0, [r6, #0x16]
	mov r1, sb
	strh r0, [r1, #0x16]
	ldrh r0, [r6, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	adds r2, r5, #0
	subs r2, #0x20
	mov r0, sb
	adds r1, r4, #0
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08055EB0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8055EC0
sub_8055EC0: @ 0x08055EC0
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x48]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
