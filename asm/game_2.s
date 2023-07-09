.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

	thumb_func_start Task_802AE6C
Task_802AE6C: @ 0x0802AE6C
	push {r4, r5, r6, r7, lr}
	ldr r2, _0802AEF0 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x1c
	adds r6, r0, r1
	adds r1, #0x30
	adds r5, r0, r1
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r5, #6]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #8]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r3, r0, #3
	movs r7, #0x80
	lsls r7, r7, #1
	cmp r3, r7
	ble _0802AEA0
	adds r3, r7, #0
_0802AEA0:
	strh r3, [r5, #2]
	strh r3, [r5, #4]
	ldrh r1, [r4, #0x14]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802AEB2
	rsbs r0, r3, #0
	strh r0, [r5, #2]
_0802AEB2:
	ldrh r1, [r4, #0x14]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AEC2
	ldrh r0, [r5, #4]
	rsbs r0, r0, #0
	strh r0, [r5, #4]
_0802AEC2:
	ldrh r0, [r5, #6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802AEE6
	ldrh r0, [r5, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0802AEE6
	ldrh r3, [r4, #0x10]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _0802AEF4
_0802AEE6:
	ldr r0, [r2]
	bl TaskDestroy
	b _0802AF50
	.align 2, 0
_0802AEF0: .4byte gCurTask
_0802AEF4:
	cmp r0, #0x40
	bgt _0802AF1C
	ldr r1, _0802AF58 @ =gSineTable
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	rsbs r0, r0, #0
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_0802AF1C:
	adds r0, r3, #1
	strh r0, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r2, _0802AF5C @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_0802AF50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF58: .4byte gSineTable
_0802AF5C: .4byte gUnknown_030054B8

	thumb_func_start sub_802AF60
sub_802AF60: @ 0x0802AF60
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	ldr r4, _0802AFFC @ =gCamera
	ldr r0, _0802B000 @ =Task_802AE6C
	str r0, [sp]
	ldr r0, _0802B004 @ =sub_801F550
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F15C
	mov r8, r0
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldr r1, [r4]
	lsls r1, r1, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r2]
	ldr r1, [r4, #4]
	lsls r1, r1, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r2, #4]
	movs r4, #0
	strh r4, [r2, #8]
	movs r0, #0x90
	lsls r0, r0, #1
	strh r0, [r2, #0xa]
	strh r4, [r2, #0x10]
	adds r6, #0x60
	ldrb r0, [r6]
	strb r0, [r2, #0x1a]
	ldr r0, _0802B008 @ =IWRAM_START + 0x1C
	adds r6, r5, r0
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0802B00C @ =0x00000366
	strh r0, [r6, #0xa]
	movs r0, #5
	mov r1, sb
	subs r0, r0, r1
	ldr r2, _0802B010 @ =IWRAM_START + 0x3C
	adds r1, r5, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r0, _0802B014 @ =IWRAM_START + 0x4C
	adds r5, r5, r0
	strh r4, [r5]
	strh r4, [r5, #2]
	strh r4, [r5, #4]
	strh r4, [r5, #6]
	strh r4, [r5, #8]
	mov r0, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802AFFC: .4byte gCamera
_0802B000: .4byte Task_802AE6C
_0802B004: .4byte sub_801F550
_0802B008: .4byte IWRAM_START + 0x1C
_0802B00C: .4byte 0x00000366
_0802B010: .4byte IWRAM_START + 0x3C
_0802B014: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_802B018
sub_802B018: @ 0x0802B018
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r1, _0802B03C @ =gUnknown_03005B34
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	ble _0802B040
	movs r0, #0
	b _0802B0F2
	.align 2, 0
_0802B03C: .4byte gUnknown_03005B34
_0802B040:
	adds r0, r2, #1
	strb r0, [r1]
	ldr r0, _0802B09C @ =Task_802B1AC
	str r0, [sp]
	ldr r0, _0802B0A0 @ =TaskDestructor_802B3EC
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F15C
	mov ip, r0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	adds r0, #0x1c
	adds r4, r2, r0
	ldr r1, _0802B0A4 @ =IWRAM_START + 0x4C
	adds r5, r2, r1
	str r6, [r3]
	str r7, [r3, #4]
	movs r6, #0
	movs r1, #0
	mov r0, r8
	strh r0, [r3, #8]
	ldr r0, _0802B0A8 @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r1, [r3, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	strh r1, [r3, #0x14]
	mov r1, sb
	cmp r1, #0
	bne _0802B0B8
	ldr r0, _0802B0AC @ =0x06012A40
	str r0, [r4, #4]
	ldr r0, _0802B0B0 @ =0x00000355
	strh r0, [r4, #0xa]
	ldr r1, _0802B0B4 @ =IWRAM_START + 0x3C
	adds r0, r2, r1
	strb r6, [r0]
	b _0802B0DE
	.align 2, 0
_0802B09C: .4byte Task_802B1AC
_0802B0A0: .4byte TaskDestructor_802B3EC
_0802B0A4: .4byte IWRAM_START + 0x4C
_0802B0A8: .4byte 0x0000FF80
_0802B0AC: .4byte 0x06012A40
_0802B0B0: .4byte 0x00000355
_0802B0B4: .4byte IWRAM_START + 0x3C
_0802B0B8:
	ldr r0, _0802B100 @ =0x06012AC0
	str r0, [r4, #4]
	ldr r0, _0802B104 @ =0x00000356
	strh r0, [r4, #0xa]
	ldr r1, _0802B108 @ =IWRAM_START + 0x3C
	adds r0, r2, r1
	strb r6, [r0]
	ldr r2, _0802B10C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0802B110 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0802B114 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r0, r1
	lsrs r0, r0, #0x10
	strh r0, [r3, #0x14]
_0802B0DE:
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r1, [r5]
	strh r1, [r5, #2]
	strh r1, [r5, #4]
	strh r1, [r5, #6]
	strh r1, [r5, #8]
	mov r0, ip
_0802B0F2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B100: .4byte 0x06012AC0
_0802B104: .4byte 0x00000356
_0802B108: .4byte IWRAM_START + 0x3C
_0802B10C: .4byte gPseudoRandom
_0802B110: .4byte 0x00196225
_0802B114: .4byte 0x3C6EF35F

@ Unused?
	thumb_func_start sub_802B118
sub_802B118: @ 0x0802B118
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r0, _0802B19C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B192
	ldr r7, _0802B1A0 @ =gPseudoRandom
	ldr r0, [r7]
	ldr r6, _0802B1A4 @ =0x00196225
	muls r0, r6, r0
	ldr r1, _0802B1A8 @ =0x3C6EF35F
	mov ip, r1
	adds r1, r0, r1
	str r1, [r7]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802B192
	muls r1, r6, r1
	ldr r3, _0802B1A8 @ =0x3C6EF35F
	adds r1, r1, r3
	movs r2, #0xf0
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	lsrs r4, r0, #8
	adds r0, r1, #0
	muls r0, r6, r0
	adds r3, r0, r3
	str r3, [r7]
	adds r0, r3, #0
	ands r0, r2
	lsrs r0, r0, #8
	adds r2, r0, #0
	subs r2, #8
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B172
	rsbs r4, r4, #0
_0802B172:
	ldr r0, [r5, #8]
	subs r0, r0, r4
	ldr r1, [r5, #0xc]
	subs r1, r1, r2
	movs r4, #0x10
	ldrsh r2, [r5, r4]
	muls r3, r6, r3
	add r3, ip
	str r3, [r7]
	movs r4, #0x80
	lsls r4, r4, #1
	ands r3, r4
	lsrs r3, r3, #8
	bl sub_802B018
	movs r2, #1
_0802B192:
	adds r0, r2, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B19C: .4byte gUnknown_03005590
_0802B1A0: .4byte gPseudoRandom
_0802B1A4: .4byte 0x00196225
_0802B1A8: .4byte 0x3C6EF35F
