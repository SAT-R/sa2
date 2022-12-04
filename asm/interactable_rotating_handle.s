.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_RotatingHandle
initSprite_Interactable_RotatingHandle: @ 0x0805E998
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
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0805EA5E
	ldr r0, _0805EA70 @ =sub_805EA94
	ldr r2, _0805EA74 @ =0x00002010
	ldr r1, _0805EA78 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r1, _0805EA7C @ =IWRAM_START + 0xC
	adds r4, r5, r1
	movs r6, #0
	mov r2, sb
	strh r2, [r0, #4]
	mov r1, sl
	strh r1, [r0, #6]
	str r7, [r0]
	ldrb r1, [r7]
	strb r1, [r0, #8]
	mov r2, r8
	strb r2, [r0, #9]
	strh r6, [r0, #0x3c]
	strh r6, [r0, #0x3e]
	ldr r1, _0805EA80 @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r2, #0
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0805EA84 @ =0x00000222
	strh r0, [r4, #0xa]
	ldr r2, _0805EA88 @ =IWRAM_START + 0x2C
	adds r0, r5, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	adds r2, #1
	adds r1, r5, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805EA8C @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0805EA90 @ =IWRAM_START + 0x31
	adds r5, r5, r1
	movs r2, #0
	strb r2, [r5]
	subs r0, #0x11
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
_0805EA5E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA70: .4byte sub_805EA94
_0805EA74: .4byte 0x00002010
_0805EA78: .4byte TaskDestructor_80095E8
_0805EA7C: .4byte IWRAM_START + 0xC
_0805EA80: .4byte IWRAM_START + 0x40
_0805EA84: .4byte 0x00000222
_0805EA88: .4byte IWRAM_START + 0x2C
_0805EA8C: .4byte IWRAM_START + 0x2E
_0805EA90: .4byte IWRAM_START + 0x31

	thumb_func_start sub_805EA94
sub_805EA94: @ 0x0805EA94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0805EB78 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, sb
	adds r7, r1, r0
	ldr r6, _0805EB7C @ =IWRAM_START + 0xC
	add r6, sb
	ldr r2, [r7]
	str r2, [sp, #8]
	ldrb r1, [r7, #8]
	lsls r1, r1, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov sl, r1
	ldr r1, _0805EB80 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0xc]
	subs r0, r2, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	mov r1, sl
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	ldr r5, _0805EB84 @ =gPlayer
	ldr r4, [r5, #0x20]
	ldr r0, _0805EB88 @ =0x00400080
	ands r4, r0
	cmp r4, #0
	beq _0805EAF0
	b _0805EC4C
_0805EAF0:
	str r5, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	mov r2, sl
	movs r3, #0
	bl sub_800C204
	mov r8, r0
	cmp r0, #1
	beq _0805EB08
	b _0805EC4C
_0805EB08:
	adds r0, r5, #0
	bl sub_80218E4
	strh r4, [r7, #0x3c]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0805EB1A
	rsbs r0, r0, #0
_0805EB1A:
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	cmp r1, #0
	bge _0805EB24
	rsbs r1, r1, #0
_0805EB24:
	adds r0, r0, r1
	strh r0, [r7, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xdf
	bgt _0805EB34
	movs r0, #0xe0
	strh r0, [r7, #0x3e]
_0805EB34:
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	movs r1, #0xc0
	lsls r1, r1, #1
	cmp r0, r1
	ble _0805EB42
	strh r1, [r7, #0x3e]
_0805EB42:
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0805EBB4
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	cmp r0, sl
	ble _0805EB90
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2d
	strh r0, [r1]
	ldr r1, _0805EB8C @ =IWRAM_START + 0x40
	add r1, sb
	movs r0, #0
	b _0805EBFC
	.align 2, 0
_0805EB78: .4byte gCurTask
_0805EB7C: .4byte IWRAM_START + 0xC
_0805EB80: .4byte gCamera
_0805EB84: .4byte gPlayer
_0805EB88: .4byte 0x00400080
_0805EB8C: .4byte IWRAM_START + 0x40
_0805EB90:
	ldr r0, [r6, #0x10]
	ldr r1, _0805EBAC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2e
	strh r0, [r1]
	ldr r0, _0805EBB0 @ =IWRAM_START + 0x40
	add r0, sb
	mov r1, r8
	strb r1, [r0]
	b _0805EBFE
	.align 2, 0
_0805EBAC: .4byte 0xFFFFFBFF
_0805EBB0: .4byte IWRAM_START + 0x40
_0805EBB4:
	ldr r0, [r5, #0x20]
	mov r2, r8
	orrs r0, r2
	str r0, [r5, #0x20]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	cmp r0, sl
	ble _0805EBE4
	ldr r0, [r6, #0x10]
	ldr r1, _0805EBDC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2d
	strh r0, [r1]
	ldr r1, _0805EBE0 @ =IWRAM_START + 0x40
	add r1, sb
	movs r0, #2
	b _0805EBFC
	.align 2, 0
_0805EBDC: .4byte 0xFFFFFBFF
_0805EBE0: .4byte IWRAM_START + 0x40
_0805EBE4:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2e
	strh r0, [r1]
	ldr r1, _0805EC3C @ =IWRAM_START + 0x40
	add r1, sb
	movs r0, #3
_0805EBFC:
	strb r0, [r1]
_0805EBFE:
	ldr r5, _0805EC40 @ =gPlayer
	ldr r1, [sp, #0xc]
	lsls r0, r1, #8
	str r0, [r5, #8]
	mov r2, sl
	lsls r0, r2, #8
	str r0, [r5, #0xc]
	adds r1, r5, #0
	adds r1, #0x6a
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x9b
	bl m4aSongNumStart
	adds r0, r5, #0
	adds r0, #0x62
	strb r4, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x20]
	ldr r0, _0805EC44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805EC48 @ =sub_805ECA0
	str r0, [r1, #8]
	b _0805EC84
	.align 2, 0
_0805EC3C: .4byte IWRAM_START + 0x40
_0805EC40: .4byte gPlayer
_0805EC44: .4byte gCurTask
_0805EC48: .4byte sub_805ECA0
_0805EC4C:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805EC70
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805EC70
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805EC84
_0805EC70:
	ldrb r0, [r7, #8]
	ldr r1, [sp, #8]
	strb r0, [r1]
	ldr r0, _0805EC80 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805EC90
	.align 2, 0
_0805EC80: .4byte gCurTask
_0805EC84:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805EC90:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805ECA0
sub_805ECA0: @ 0x0805ECA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805ED20 @ =gCurTask
	ldr r2, [r0]
	ldrh r7, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sl, r0
	ldr r1, _0805ED24 @ =IWRAM_START + 0xC
	adds r1, r1, r7
	mov sb, r1
	ldr r3, [r0]
	str r3, [sp]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	mov r3, sl
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #8]
	ldrh r0, [r3, #0x3e]
	ldrh r1, [r3, #0x3c]
	adds r0, r0, r1
	ldr r3, _0805ED28 @ =0x00003FF0
	adds r1, r3, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1, #0x3c]
	ldr r3, _0805ED2C @ =0x000003FF
	mov r8, r3
	lsrs r6, r0, #4
	ldr r1, _0805ED30 @ =gCamera
	ldr r0, [r1]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	mov r3, sb
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	strh r0, [r3, #0x18]
	ldr r5, _0805ED34 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805ED3C
	ldr r0, _0805ED38 @ =sub_805EF90
	str r0, [r2, #8]
	mov r0, sb
	bl sub_80051E8
	b _0805EF80
	.align 2, 0
_0805ED20: .4byte gCurTask
_0805ED24: .4byte IWRAM_START + 0xC
_0805ED28: .4byte 0x00003FF0
_0805ED2C: .4byte 0x000003FF
_0805ED30: .4byte gCamera
_0805ED34: .4byte gPlayer
_0805ED38: .4byte sub_805EF90
_0805ED3C:
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0805ED98 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r4, [r0]
	ands r4, r1
	cmp r4, #0
	bne _0805ED4E
	b _0805EEC8
_0805ED4E:
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	mov r2, sl
	ldrb r0, [r2, #8]
	ldr r3, [sp]
	strb r0, [r3]
	adds r0, r5, #0
	bl sub_80218E4
	adds r0, r5, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	ldr r1, _0805ED9C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r0, _0805EDA0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805EDA4 @ =sub_805EF90
	str r0, [r1, #8]
	ldr r1, _0805EDA8 @ =IWRAM_START + 0x40
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805EDEC
	cmp r0, #1
	bgt _0805EDAC
	cmp r0, #0
	beq _0805EDB6
	b _0805EE80
	.align 2, 0
_0805ED98: .4byte gPlayerControls
_0805ED9C: .4byte 0xFFBFFFFF
_0805EDA0: .4byte gCurTask
_0805EDA4: .4byte sub_805EF90
_0805EDA8: .4byte IWRAM_START + 0x40
_0805EDAC:
	cmp r0, #2
	beq _0805EE0C
	cmp r0, #3
	beq _0805EE44
	b _0805EE80
_0805EDB6:
	movs r0, #0x20
	subs r4, r0, r6
	mov r2, r8
	ands r4, r2
	ldr r2, _0805EDE8 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	b _0805EE76
	.align 2, 0
_0805EDE8: .4byte gSineTable
_0805EDEC:
	adds r4, r6, #0
	adds r4, #0x20
	mov r0, r8
	ands r4, r0
	ldr r2, _0805EE08 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	adds r0, r0, r1
	b _0805EE60
	.align 2, 0
_0805EE08: .4byte gSineTable
_0805EE0C:
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r4, r6, r0
	mov r1, r8
	ands r4, r1
	ldr r2, _0805EE40 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	b _0805EE76
	.align 2, 0
_0805EE40: .4byte gSineTable
_0805EE44:
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r1, #0
	subs r4, r0, r6
	mov r2, r8
	ands r4, r2
	ldr r2, _0805EE7C @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	subs r0, r0, r1
_0805EE60:
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
_0805EE76:
	str r0, [r5, #0xc]
	adds r6, r2, #0
	b _0805EE84
	.align 2, 0
_0805EE7C: .4byte gSineTable
_0805EE80:
	movs r4, #0
	ldr r6, _0805EEC0 @ =gSineTable
_0805EE84:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	movs r1, #0x11
	bl Div
	ldr r5, _0805EEC4 @ =gPlayer
	strh r0, [r5, #0x10]
	lsls r4, r4, #1
	adds r4, r4, r6
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	movs r1, #0x11
	bl Div
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r5, #0x6c
	movs r0, #1
	strb r0, [r5]
	b _0805EF2A
	.align 2, 0
_0805EEC0: .4byte gSineTable
_0805EEC4: .4byte gPlayer
_0805EEC8:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x2d
	bne _0805EEE6
	adds r0, r6, #0
	movs r1, #0x56
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EEF8
	b _0805EEF6
_0805EEE6:
	adds r0, r6, #0
	movs r1, #0x56
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EEF8
_0805EEF6:
	movs r2, #0xb
_0805EEF8:
	ldr r0, _0805EF64 @ =0x00000222
	mov r3, sb
	strh r0, [r3, #0xa]
	ldr r1, _0805EF68 @ =IWRAM_START + 0x2C
	adds r0, r7, r1
	strb r2, [r0]
	ldr r3, _0805EF6C @ =IWRAM_START + 0x2D
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x6c
	movs r0, #1
	strb r0, [r1]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r5, #8]
	ldr r2, [sp, #8]
	lsls r0, r2, #8
	str r0, [r5, #0xc]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
_0805EF2A:
	mov r3, sb
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805EF50
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805EF50
	movs r2, #0x18
	ldrsh r1, [r3, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805EF74
_0805EF50:
	mov r3, sl
	ldrb r0, [r3, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0805EF70 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805EF80
	.align 2, 0
_0805EF64: .4byte 0x00000222
_0805EF68: .4byte IWRAM_START + 0x2C
_0805EF6C: .4byte IWRAM_START + 0x2D
_0805EF70: .4byte gCurTask
_0805EF74:
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
_0805EF80:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805EF90
sub_805EF90: @ 0x0805EF90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0805F04C @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _0805F050 @ =IWRAM_START + 0xC
	adds r6, r5, r1
	ldr r2, [r4]
	mov sb, r2
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r7, r1, r0
	ldrh r0, [r4, #0x3e]
	subs r0, #1
	strh r0, [r4, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xdf
	bgt _0805EFD8
	movs r0, #0xe0
	strh r0, [r4, #0x3e]
_0805EFD8:
	ldrh r0, [r4, #0x3e]
	ldrh r3, [r4, #0x3c]
	adds r0, r0, r3
	ldr r2, _0805F054 @ =0x00003FF0
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4, #0x3c]
	lsrs r0, r0, #4
	movs r1, #0x55
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EFF8
	movs r2, #0xb
_0805EFF8:
	ldr r0, _0805F058 @ =0x00000222
	strh r0, [r6, #0xa]
	ldr r3, _0805F05C @ =IWRAM_START + 0x2C
	adds r0, r5, r3
	strb r2, [r0]
	ldr r0, _0805F060 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0805F064 @ =gCamera
	ldr r0, [r1]
	mov r3, r8
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r1, [r1, #4]
	subs r3, r7, r1
	strh r3, [r6, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805F03A
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805F03A
	lsls r1, r3, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0805F068
_0805F03A:
	ldrb r0, [r4, #8]
	mov r2, sb
	strb r0, [r2]
	ldr r0, _0805F04C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805F084
	.align 2, 0
_0805F04C: .4byte gCurTask
_0805F050: .4byte IWRAM_START + 0xC
_0805F054: .4byte 0x00003FF0
_0805F058: .4byte 0x00000222
_0805F05C: .4byte IWRAM_START + 0x2C
_0805F060: .4byte IWRAM_START + 0x2D
_0805F064: .4byte gCamera
_0805F068:
	cmp r2, #0
	bne _0805F078
	strh r2, [r4, #0x3c]
	strh r2, [r4, #0x3e]
	mov r3, sl
	ldr r1, [r3]
	ldr r0, _0805F094 @ =sub_805EA94
	str r0, [r1, #8]
_0805F078:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805F084:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F094: .4byte sub_805EA94
