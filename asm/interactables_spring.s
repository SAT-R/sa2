.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_800E19C
sub_800E19C: @ 0x0800E19C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x2c]
	lsls r0, r0, #0x18
	str r0, [sp, #8]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r1, #0
	mov sl, r1
	ldr r0, _0800E290 @ =sub_800E31C
	ldr r2, _0800E294 @ =0x00002010
	ldr r1, _0800E298 @ =TaskDestructor_Interactable_Spring
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0
	ldr r0, _0800E29C @ =IWRAM_START + 0xC
	adds r7, r2, r0
	movs r3, #0
	mov r1, r8
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	ldr r0, _0800E2A0 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0800E2A4 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0800E2A8 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	strb r3, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r0, _0800E2AC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E256
	movs r2, #1
	mov sl, r2
_0800E256:
	cmp r0, #5
	bne _0800E25E
	movs r0, #2
	mov sl, r0
_0800E25E:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	cmp r2, #1
	bne _0800E272
	ldr r1, [sp, #8]
	lsrs r0, r1, #0x19
	cmp r0, #0
	beq _0800E2B4
_0800E272:
	ldr r1, _0800E2B0 @ =gUnknown_080D52E0
	ldr r0, [sp, #4]
	lsls r4, r0, #3
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	b _0800E2BC
	.align 2, 0
_0800E290: .4byte sub_800E31C
_0800E294: .4byte 0x00002010
_0800E298: .4byte TaskDestructor_Interactable_Spring
_0800E29C: .4byte IWRAM_START + 0xC
_0800E2A0: .4byte IWRAM_START + 0x2D
_0800E2A4: .4byte IWRAM_START + 0x2E
_0800E2A8: .4byte IWRAM_START + 0x31
_0800E2AC: .4byte gCurrentLevel
_0800E2B0: .4byte gUnknown_080D52E0
_0800E2B4:
	ldr r0, _0800E314 @ =0x06012980
	str r0, [r7, #4]
	ldr r1, [sp, #4]
	lsls r4, r1, #3
_0800E2BC:
	ldr r3, _0800E318 @ =gUnknown_080D52E0
	asrs r0, r5, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r2, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r3, #6
	adds r1, r1, r3
	ldrh r1, [r1]
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	mov r0, r8
	adds r0, #0x3c
	mov r2, sp
	ldrb r2, [r2, #4]
	strb r2, [r0]
	mov r0, sb
	ldrb r1, [r0, #3]
	movs r0, #3
	ands r0, r1
	mov r1, r8
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E314: .4byte 0x06012980
_0800E318: .4byte gUnknown_080D52E0

	thumb_func_start sub_800E31C
sub_800E31C: @ 0x0800E31C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0800E3A4 @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0xc
	adds r5, r4, r0
	ldr r1, [r6]
	mov r8, r1
	ldr r3, _0800E3A8 @ =gPlayer
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_800E490
	cmp r0, #0
	beq _0800E370
	ldr r1, [r7]
	ldr r0, _0800E3AC @ =sub_800E3D0
	str r0, [r1, #8]
	ldr r0, _0800E3B0 @ =IWRAM_START + 0x2C
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0800E3B4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E370
	ldr r1, _0800E3B8 @ =IWRAM_START + 0x3C
	adds r0, r4, r1
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #0
	bne _0800E370
	ldr r0, _0800E3BC @ =0x06012B00
	str r0, [r5, #4]
_0800E370:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800E394
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800E394
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800E3C0
_0800E394:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0800E3A4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800E3C6
	.align 2, 0
_0800E3A4: .4byte gCurTask
_0800E3A8: .4byte gPlayer
_0800E3AC: .4byte sub_800E3D0
_0800E3B0: .4byte IWRAM_START + 0x2C
_0800E3B4: .4byte gCurrentLevel
_0800E3B8: .4byte IWRAM_START + 0x3C
_0800E3BC: .4byte 0x06012B00
_0800E3C0:
	adds r0, r5, #0
	bl sub_80051E8
_0800E3C6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800E3D0
sub_800E3D0: @ 0x0800E3D0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0800E424 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0xc
	adds r4, r6, r0
	ldr r7, [r5]
	ldr r3, _0800E428 @ =gPlayer
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_800E490
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800E414
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800E414
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800E42C
_0800E414:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, _0800E424 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800E470
	.align 2, 0
_0800E424: .4byte gCurTask
_0800E428: .4byte gPlayer
_0800E42C:
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800E46A
	ldr r0, _0800E478 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, _0800E47C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E45C
	ldr r1, _0800E480 @ =IWRAM_START + 0x3C
	adds r0, r6, r1
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #0
	bne _0800E45C
	ldr r0, _0800E484 @ =0x06012980
	str r0, [r4, #4]
_0800E45C:
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, _0800E488 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800E48C @ =sub_800E31C
	str r0, [r1, #8]
_0800E46A:
	adds r0, r4, #0
	bl sub_80051E8
_0800E470:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E478: .4byte IWRAM_START + 0x2C
_0800E47C: .4byte gCurrentLevel
_0800E480: .4byte IWRAM_START + 0x3C
_0800E484: .4byte 0x06012980
_0800E488: .4byte gCurTask
_0800E48C: .4byte sub_800E31C

.if 1
	thumb_func_start sub_800E490
sub_800E490: @ 0x0800E490
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldrb r2, [r4, #8]
	lsls r2, r2, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _0800E51C @ =gCamera
	ldr r0, [r3]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800E536
	adds r0, r6, #0
	adds r1, r7, #0
	adds r3, r5, #0
	bl sub_800CDBC
	cmp r0, #0
	beq _0800E536
	ldr r1, _0800E520 @ =gUnknown_080D53D0
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x3d
	ldrb r0, [r2]
	adds r1, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0800E524 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E52C
	ldr r0, _0800E528 @ =gUnknown_080D53DA
	ldrb r1, [r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0800E532
	.align 2, 0
_0800E51C: .4byte gCamera
_0800E520: .4byte gUnknown_080D53D0
_0800E524: .4byte gCurrentLevel
_0800E528: .4byte gUnknown_080D53DA
_0800E52C:
	movs r0, #0x99
	bl m4aSongNumStart
_0800E532:
	movs r0, #1
	b _0800E538
_0800E536:
	movs r0, #0
_0800E538:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.endif