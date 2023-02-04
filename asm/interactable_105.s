.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_8080A9C
sub_8080A9C: @ 0x08080A9C
	push {lr}
	ldr r1, [r0]
	ldr r3, _08080AD8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
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
	bhi _08080AD4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08080AD4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08080ADC
_08080AD4:
	movs r0, #1
	b _08080ADE
	.align 2, 0
_08080AD8: .4byte gCamera
_08080ADC:
	movs r0, #0
_08080ADE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8080AE4
sub_8080AE4: @ 0x08080AE4
	push {lr}
	ldr r1, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	strb r0, [r1]
	ldr r0, _08080AF8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08080AF8: .4byte gCurTask

	thumb_func_start sub_8080AFC
sub_8080AFC: @ 0x08080AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp, #4]
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08080C00 @ =sub_8080DB8
	ldr r2, _08080C04 @ =0x00002010
	ldr r1, _08080C08 @ =sub_8080EF8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	str r6, [r7, #0x30]
	ldr r6, [sp, #4]
	str r6, [r7, #0x34]
	movs r3, #0
	str r3, [r7, #0x38]
	str r3, [r7, #0x3c]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r0, r4, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r6, _08080C0C @ =gSineTable
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r6, _08080C10 @ =IWRAM_START + 0x40
	adds r1, r2, r6
	movs r6, #0
	mov ip, r6
	strh r0, [r1]
	lsls r4, r4, #3
	ldr r0, _08080C0C @ =gSineTable
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r4, _08080C14 @ =IWRAM_START + 0x42
	adds r1, r2, r4
	strh r0, [r1]
	ldr r6, _08080C18 @ =IWRAM_START + 0x44
	adds r0, r2, r6
	mov r1, r8
	strh r1, [r0]
	adds r4, #4
	adds r0, r2, r4
	mov r6, sb
	strh r6, [r0]
	ldr r1, _08080C1C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	mov r4, sl
	strb r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	ldr r6, _08080C20 @ =IWRAM_START + 0x21
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08080C24 @ =IWRAM_START + 0x22
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08080C28 @ =IWRAM_START + 0x25
	adds r2, r2, r1
	mov r4, ip
	strb r4, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	ldr r2, _08080C2C @ =gUnknown_080E0140
	mov r6, sl
	lsls r0, r6, #2
	add r0, sl
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	str r0, [r7, #0x10]
	adds r0, r2, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080C30
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	bl VramMalloc
	b _08080C3C
	.align 2, 0
_08080C00: .4byte sub_8080DB8
_08080C04: .4byte 0x00002010
_08080C08: .4byte sub_8080EF8
_08080C0C: .4byte gSineTable
_08080C10: .4byte IWRAM_START + 0x40
_08080C14: .4byte IWRAM_START + 0x42
_08080C18: .4byte IWRAM_START + 0x44
_08080C1C: .4byte IWRAM_START + 0x48
_08080C20: .4byte IWRAM_START + 0x21
_08080C24: .4byte IWRAM_START + 0x22
_08080C28: .4byte IWRAM_START + 0x25
_08080C2C: .4byte gUnknown_080E0140
_08080C30:
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08080C70 @ =0x06010000
	adds r0, r0, r1
_08080C3C:
	str r0, [r7, #4]
	ldr r2, _08080C74 @ =gUnknown_080E0140
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r7, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r7, #0
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
_08080C70: .4byte 0x06010000
_08080C74: .4byte gUnknown_080E0140

	thumb_func_start sub_8080C78
sub_8080C78: @ 0x08080C78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	str r1, [sp, #4]
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08080D4C @ =sub_8080E54
	ldr r2, _08080D50 @ =0x00002010
	ldr r1, _08080D54 @ =sub_8080EF8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov r3, sb
	str r3, [r7, #0x30]
	ldr r0, [sp, #4]
	str r0, [r7, #0x34]
	movs r2, #0
	str r2, [r7, #0x38]
	str r2, [r7, #0x3c]
	ldr r3, _08080D58 @ =IWRAM_START + 0x40
	adds r0, r1, r3
	movs r3, #0
	strh r4, [r0]
	ldr r4, _08080D5C @ =IWRAM_START + 0x42
	adds r0, r1, r4
	strh r5, [r0]
	adds r4, #2
	adds r0, r1, r4
	strh r6, [r0]
	adds r4, #2
	adds r0, r1, r4
	mov r4, r8
	strh r4, [r0]
	ldr r4, _08080D60 @ =IWRAM_START + 0x48
	adds r0, r1, r4
	mov r4, sl
	strb r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _08080D64 @ =IWRAM_START + 0x21
	adds r2, r1, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r4, _08080D68 @ =IWRAM_START + 0x22
	adds r2, r1, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _08080D6C @ =IWRAM_START + 0x25
	adds r1, r1, r0
	strb r3, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	ldr r2, _08080D70 @ =gUnknown_080E0140
	mov r1, sl
	lsls r0, r1, #2
	add r0, sl
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	str r0, [r7, #0x10]
	adds r0, r2, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080D74
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	bl VramMalloc
	b _08080D80
	.align 2, 0
_08080D4C: .4byte sub_8080E54
_08080D50: .4byte 0x00002010
_08080D54: .4byte sub_8080EF8
_08080D58: .4byte IWRAM_START + 0x40
_08080D5C: .4byte IWRAM_START + 0x42
_08080D60: .4byte IWRAM_START + 0x48
_08080D64: .4byte IWRAM_START + 0x21
_08080D68: .4byte IWRAM_START + 0x22
_08080D6C: .4byte IWRAM_START + 0x25
_08080D70: .4byte gUnknown_080E0140
_08080D74:
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08080DB0 @ =0x06010000
	adds r0, r0, r3
_08080D80:
	str r0, [r7, #4]
	ldr r2, _08080DB4 @ =gUnknown_080E0140
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r7, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080DB0: .4byte 0x06010000
_08080DB4: .4byte gUnknown_080E0140

	thumb_func_start sub_8080DB8
sub_8080DB8: @ 0x08080DB8
	push {r4, r5, r6, lr}
	ldr r0, _08080DE0 @ =gCurTask
	ldr r2, [r0]
	ldrh r6, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0x46
	adds r1, r6, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080DE4 @ =0xFFFF0000
	cmp r0, r1
	bne _08080DE8
	adds r0, r2, #0
	bl TaskDestroy
	b _08080E4C
	.align 2, 0
_08080DE0: .4byte gCurTask
_08080DE4: .4byte 0xFFFF0000
_08080DE8:
	ldr r1, _08080E38 @ =IWRAM_START + 0x40
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r5, #0x38]
	adds r2, r2, r0
	str r2, [r5, #0x38]
	ldr r1, _08080E3C @ =IWRAM_START + 0x42
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r3, [r5, #0x3c]
	adds r3, r3, r0
	str r3, [r5, #0x3c]
	ldr r0, [r5, #0x30]
	ldr r4, _08080E40 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	asrs r2, r2, #8
	adds r0, r0, r2
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	asrs r3, r3, #8
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08080E44 @ =IWRAM_START + 0x44
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080E48
	adds r0, r5, #0
	bl sub_80051E8
	b _08080E4C
	.align 2, 0
_08080E38: .4byte IWRAM_START + 0x40
_08080E3C: .4byte IWRAM_START + 0x42
_08080E40: .4byte gCamera
_08080E44: .4byte IWRAM_START + 0x44
_08080E48:
	subs r0, #1
	strh r0, [r1]
_08080E4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080E54
sub_8080E54: @ 0x08080E54
	push {r4, r5, lr}
	ldr r0, _08080E7C @ =gCurTask
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x46
	adds r1, r5, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080E80 @ =0xFFFF0000
	cmp r0, r1
	bne _08080E84
	adds r0, r2, #0
	bl TaskDestroy
	b _08080EF0
	.align 2, 0
_08080E7C: .4byte gCurTask
_08080E80: .4byte 0xFFFF0000
_08080E84:
	ldr r1, _08080EDC @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x38]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	ldr r0, _08080EE0 @ =IWRAM_START + 0x42
	adds r1, r5, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r2
	str r0, [r4, #0x3c]
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	ldr r1, [r4, #0x30]
	ldr r2, _08080EE4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r0, [r4, #0x38]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r4, #0x34]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r2, _08080EE8 @ =IWRAM_START + 0x44
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080EEC
	adds r0, r4, #0
	bl sub_80051E8
	b _08080EF0
	.align 2, 0
_08080EDC: .4byte IWRAM_START + 0x40
_08080EE0: .4byte IWRAM_START + 0x42
_08080EE4: .4byte gCamera
_08080EE8: .4byte IWRAM_START + 0x44
_08080EEC:
	subs r0, #1
	strh r0, [r1]
_08080EF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080EF8
sub_8080EF8: @ 0x08080EF8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r2, _08080F24 @ =gUnknown_080E0140
	adds r1, #0x48
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080F20
	ldr r0, [r3, #4]
	bl VramFree
_08080F20:
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_080E0140
