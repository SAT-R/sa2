.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8057BD4
sub_8057BD4: @ 0x08057BD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08057C8C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r1, _08057C90 @ =IWRAM_START + 0xC
	adds r7, r3, r1
	ldr r2, [r4]
	mov sl, r2
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _08057C94 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov r8, r2
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _08057C98 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08057C44
	lsls r0, r0, #8
	ldr r1, [r4, #0x48]
	adds r1, r1, r0
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r3, _08057C9C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057C44:
	cmp r0, #0
	ble _08057C50
	lsls r1, r0, #8
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x48]
_08057C50:
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x48]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r0, _08057CA0 @ =gCamera
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
	beq _08057CA4
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08057D6C
	.align 2, 0
_08057C8C: .4byte gCurTask
_08057C90: .4byte IWRAM_START + 0xC
_08057C94: .4byte IWRAM_START + 0x50
_08057C98: .4byte sub_801EE64
_08057C9C: .4byte sub_801EC3C
_08057CA0: .4byte gCamera
_08057CA4:
	ldr r0, [r4, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057CD6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057CD6
	ldr r0, [r4, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057CD6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057D10
_08057CD6:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08057CFA
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08057CFA
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057D10
_08057CFA:
	ldrb r0, [r4, #8]
	mov r3, sl
	strb r0, [r3]
	ldr r0, _08057D0C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057D6C
	.align 2, 0
_08057D0C: .4byte gCurTask
_08057D10:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _08057D66
	adds r0, r4, #0
	adds r0, #0x51
	strb r1, [r0]
	ldr r1, [r7, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08057D44
	ldr r0, _08057D40 @ =0xFFFFFBFF
	ands r1, r0
	b _08057D46
	.align 2, 0
_08057D40: .4byte 0xFFFFFBFF
_08057D44:
	orrs r1, r2
_08057D46:
	str r1, [r7, #0x10]
	movs r1, #0
	movs r0, #0xfa
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08057D7C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057D80 @ =sub_8057980
	str r0, [r1, #8]
_08057D66:
	adds r0, r7, #0
	bl sub_80051E8
_08057D6C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057D7C: .4byte gCurTask
_08057D80: .4byte sub_8057980
