.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

	thumb_func_start sub_8009E00
sub_8009E00: @ 0x08009E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _08009E98 @ =sub_8009EB0
	movs r2, #0x80
	lsls r2, r2, #6
	mov sl, r2
	ldr r1, _08009E9C @ =sub_8009F80
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r7, #0
	movs r6, #0
	strh r6, [r4, #0x30]
	mov r0, r8
	strh r0, [r4, #0x16]
	mov r1, sb
	strh r1, [r4, #0x18]
	movs r0, #2
	bl VramMalloc
	str r0, [r4, #4]
	strh r6, [r4, #0x1a]
	strh r6, [r4, #8]
	movs r0, #0xb6
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _08009EA0 @ =gPlayer
	adds r0, #0x84
	ldrb r1, [r0]
	ldr r2, _08009EA4 @ =IWRAM_START + 0x20
	adds r0, r5, r2
	strb r1, [r0]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _08009EA8 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08009EAC @ =IWRAM_START + 0x25
	adds r5, r5, r0
	strb r7, [r5]
	mov r1, sl
	str r1, [r4, #0x10]
	adds r0, r4, #0
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
_08009E98: .4byte sub_8009EB0
_08009E9C: .4byte sub_8009F80
_08009EA0: .4byte gPlayer
_08009EA4: .4byte IWRAM_START + 0x20
_08009EA8: .4byte IWRAM_START + 0x21
_08009EAC: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8009EB0
sub_8009EB0: @ 0x08009EB0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08009F00 @ =gCurTask
	ldr r5, [r0]
	ldrh r1, [r5, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r6, [r4, #0x16]
	ldrh r7, [r4, #0x18]
	ldrh r2, [r4, #0x30]
	adds r2, #1
	strh r2, [r4, #0x30]
	ldr r3, _08009F04 @ =gCamera
	ldr r1, [r3]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r3, #4]
	adds r1, r1, r2
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x3b
	ble _08009F0C
	ldr r0, _08009F08 @ =sub_8009F1C
	str r0, [r5, #8]
	adds r0, r4, #0
	bl sub_80051E8
	strh r6, [r4, #0x16]
	ldrh r1, [r4, #0x30]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	movs r0, #0
	strh r0, [r4, #0x30]
	b _08009F16
	.align 2, 0
_08009F00: .4byte gCurTask
_08009F04: .4byte gCamera
_08009F08: .4byte sub_8009F1C
_08009F0C:
	adds r0, r4, #0
	bl sub_80051E8
	strh r6, [r4, #0x16]
	strh r7, [r4, #0x18]
_08009F16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8009F1C
sub_8009F1C: @ 0x08009F1C
	push {r4, r5, r6, lr}
	ldr r0, _08009F54 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r5, [r4, #0x16]
	ldrh r6, [r4, #0x18]
	ldr r2, _08009F58 @ =gCamera
	ldr r0, [r2]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08009F5C
	adds r0, r3, #0
	bl TaskDestroy
	b _08009F7A
	.align 2, 0
_08009F54: .4byte gCurTask
_08009F58: .4byte gCamera
_08009F5C:
	ldr r1, [r2]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
_08009F7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8009F80
sub_8009F80: @ 0x08009F80
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
