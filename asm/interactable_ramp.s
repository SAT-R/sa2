.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_Ramp
initSprite_Interactable_Ramp: @ 0x0800F9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0800FAD4 @ =sub_800FAF4
	ldr r2, _0800FAD8 @ =0x00002010
	ldr r1, _0800FADC @ =TaskDestructor_800FE24
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, _0800FAE0 @ =IWRAM_START + 0xC
	adds r7, r3, r0
	movs r2, #0
	mov sb, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r0, r8
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r2, [r2, #3]
	movs r0, #3
	ands r0, r2
	adds r4, r0, #0
	strh r4, [r1, #0x3c]
	movs r0, #0x14
	str r3, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0800FAE4 @ =0x0000021F
	strh r0, [r7, #0xa]
	ldr r0, _0800FAE8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	ldr r3, [sp, #4]
	cmp r0, #5
	bne _0800FA70
	movs r0, #0x98
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
_0800FA70:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r2, _0800FAEC @ =IWRAM_START + 0x2C
	adds r1, r3, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sb
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #1
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0800FAF0 @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r2, #4
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0800FABE
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0800FABE:
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FAD4: .4byte sub_800FAF4
_0800FAD8: .4byte 0x00002010
_0800FADC: .4byte TaskDestructor_800FE24
_0800FAE0: .4byte IWRAM_START + 0xC
_0800FAE4: .4byte 0x0000021F
_0800FAE8: .4byte gCurrentLevel
_0800FAEC: .4byte IWRAM_START + 0x2C
_0800FAF0: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_800FAF4
sub_800FAF4: @ 0x0800FAF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r6, _0800FBE4 @ =gPlayer
	ldr r0, _0800FBE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _0800FBEC @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp]
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _0800FBF0 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, r8
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	str r2, [sp, #8]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r4, r8
	strh r1, [r4, #0x18]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800FB62
	b _0800FDC2
_0800FB62:
	movs r5, #0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0800FB74
	ldr r0, [r6, #0x3c]
	cmp r0, r8
	bne _0800FB74
	movs r5, #1
_0800FB74:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #8]
	lsls r4, r2, #0x10
	asrs r2, r4, #0x10
	mov r0, r8
	adds r3, r6, #0
	bl sub_800CDBC
	adds r1, r0, #0
	cmp r1, #0
	bne _0800FB90
	b _0800FD36
_0800FB90:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	mov r3, sb
	ldrh r5, [r3, #0x3c]
	cmp r0, #0
	beq _0800FBAE
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FBAE
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0800FBCA
_0800FBAE:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0800FBF4
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FBC2
	b _0800FDC2
_0800FBC2:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bgt _0800FBF4
_0800FBCA:
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	b _0800FDC2
	.align 2, 0
_0800FBE4: .4byte gPlayer
_0800FBE8: .4byte gCurTask
_0800FBEC: .4byte IWRAM_START + 0xC
_0800FBF0: .4byte gCamera
_0800FBF4:
	movs r0, #2
	mov sl, r0
	ands r0, r5
	cmp r0, #0
	beq _0800FC00
	b _0800FDC2
_0800FC00:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r2
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r7, r0, r1
	cmp r7, #0
	bgt _0800FC26
	b _0800FD2A
_0800FC26:
	cmp r7, r2
	ble _0800FC66
	ldr r0, [r6, #0x20]
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	bne _0800FC5A
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FC5A
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r0, sb
	ldrh r1, [r0, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
_0800FC5A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	b _0800FD24
_0800FC66:
	ldr r5, [r6, #0xc]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	asrs r1, r4, #0x10
	subs r0, r0, r1
	str r0, [sp, #0xc]
	mov r0, r8
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r7, #8
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl __divsi3
	muls r0, r4, r0
	asrs r3, r0, #8
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, r3
	blt _0800FD1A
	ldr r0, [r6, #0x20]
	mov r4, sl
	ands r0, r4
	cmp r0, #0
	bne _0800FCF8
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FCF8
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0800FCDC @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0800FCF8
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	cmp r7, r0
	bge _0800FCE0
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	b _0800FD98
	.align 2, 0
_0800FCDC: .4byte gPlayerControls
_0800FCE0:
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r3, sb
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	b _0800FD98
_0800FCF8:
	ldr r4, [sp, #0xc]
	subs r0, r3, r4
	lsls r0, r0, #8
	adds r0, r5, r0
	str r0, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r0, r8
	b _0800FDC0
_0800FD1A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, sl
_0800FD24:
	orrs r0, r1
	str r0, [r6, #0x20]
	b _0800FDC2
_0800FD2A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	b _0800FDC2
_0800FD36:
	cmp r5, #0
	beq _0800FDC2
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #2
	ands r0, r1
	adds r5, r1, #0
	cmp r0, #0
	beq _0800FD5E
	ldr r0, [r6, #8]
	asrs r3, r0, #8
	mov r4, r8
	movs r1, #0x16
	ldrsh r2, [r4, r1]
	adds r4, r0, #0
	cmp r3, r2
	blt _0800FD6E
	cmp r3, r2
	bgt _0800FDB4
	b _0800FDA0
_0800FD5E:
	ldr r0, [r6, #8]
	asrs r2, r0, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r1, [r3, r4]
	adds r4, r0, #0
	cmp r2, r1
	ble _0800FDA8
_0800FD6E:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0800FDC2
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FDC2
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
_0800FD98:
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
	b _0800FDC2
_0800FDA0:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _0800FDC2
_0800FDA8:
	asrs r1, r4, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bge _0800FDC2
_0800FDB4:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
_0800FDC0:
	str r0, [r6, #0x3c]
_0800FDC2:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0800FE04 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800FDF2
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800FDF2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800FE0C
_0800FDF2:
	mov r4, sb
	ldrb r0, [r4, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0800FE08 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800FE12
	.align 2, 0
_0800FE04: .4byte gCamera
_0800FE08: .4byte gCurTask
_0800FE0C:
	mov r0, r8
	bl sub_80051E8
_0800FE12:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_800FE24
TaskDestructor_800FE24: @ 0x0800FE24
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
