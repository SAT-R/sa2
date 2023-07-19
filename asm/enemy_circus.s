.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_8055D7C
Task_8055D7C: @ 0x08055D7C
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
	ldr r0, _08055E88 @ =Task_CircusMain
	str r0, [r1, #8]
	b _08055E92
	.align 2, 0
_08055E74: .4byte IWRAM_START + 0x84
_08055E78: .4byte 0x000001EF
_08055E7C: .4byte IWRAM_START + 0x2C
_08055E80: .4byte IWRAM_START + 0x2D
_08055E84: .4byte gCurTask
_08055E88: .4byte Task_CircusMain
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

	thumb_func_start TaskDestructor_Circus
TaskDestructor_Circus: @ 0x08055EC0
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
