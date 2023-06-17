.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8056AF4
sub_8056AF4: @ 0x08056AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08056B5C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r3, _08056B60 @ =IWRAM_START + 0xC
	adds r7, r1, r3
	ldr r0, [r6]
	mov sl, r0
	ldr r2, [r6, #0x44]
	ldr r0, [r6, #0x4c]
	adds r2, r2, r0
	str r2, [r6, #0x44]
	ldr r3, [r6, #0x48]
	ldr r0, [r6, #0x50]
	adds r3, r3, r0
	str r3, [r6, #0x48]
	ldr r1, [r6, #0x3c]
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r1, #0
	ldr r2, [r6, #0x40]
	adds r2, r2, r3
	asrs r2, r2, #8
	adds r5, r2, #0
	ldr r3, _08056B64 @ =gCamera
	mov r8, r3
	ldr r0, [r3]
	subs r0, r4, r0
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	subs r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08056B68
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08056BE8
	.align 2, 0
_08056B5C: .4byte gCurTask
_08056B60: .4byte IWRAM_START + 0xC
_08056B64: .4byte gCamera
_08056B68:
	ldr r0, [r6, #0x3c]
	asrs r2, r0, #8
	mov r3, r8
	ldr r1, [r3]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056B9A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08056B9A
	ldr r0, [r6, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	ldr r1, [r0, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08056B9A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08056BD4
_08056B9A:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08056BBE
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08056BBE
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08056BD4
_08056BBE:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08056BD0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08056BE8
	.align 2, 0
_08056BD0: .4byte gCurTask
_08056BD4:
	lsls r0, r4, #8
	lsls r1, r5, #8
	bl sub_80122DC
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08056BE8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
