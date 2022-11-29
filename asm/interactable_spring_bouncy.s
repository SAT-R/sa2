.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
.if 0

	thumb_func_start Task_805E02C
Task_805E02C: @ 0x0805E02C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0805E0A0 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0         @ r5 = spring
	adds r0, #0xc
	adds r4, r6, r0         @ r4 = displayed
	ldr r1, [r5]
	mov ip, r1              @ ip = ia
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r0, ip
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805E0A4 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r0, #0
	mov r8, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r4, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	adds r3, r7, #0
	cmp r1, r0
	bhi _0805E090
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805E090
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0805E0A8
_0805E090:
	ldrb r0, [r5, #8]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r3]
	bl TaskDestroy
	b _0805E0FA
	.align 2, 0
_0805E0A0: .4byte gCurTask
_0805E0A4: .4byte gCamera
_0805E0A8:
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0805E0F4
	ldr r1, [r7]
	ldr r0, _0805E0C8 @ =Task_Interactable_BouncySpring
	str r0, [r1, #8]
	ldr r0, _0805E0CC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0805E0D4
	ldr r0, _0805E0D0 @ =0x0000023A
	b _0805E0E2
	.align 2, 0
_0805E0C8: .4byte Task_Interactable_BouncySpring
_0805E0CC: .4byte gCurrentLevel
_0805E0D0: .4byte 0x0000023A
_0805E0D4:
	cmp r0, #5
	bne _0805E0E0
	ldr r0, _0805E0DC @ =0x0000025B
	b _0805E0E2
	.align 2, 0
_0805E0DC: .4byte 0x0000025B
_0805E0E0:
	ldr r0, _0805E104 @ =0x00000219
_0805E0E2:
	strh r0, [r4, #0xa]
	ldr r1, _0805E108 @ =IWRAM_START + 0x2C
	adds r0, r6, r1
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0805E0F4:
	adds r0, r4, #0
	bl sub_80051E8
_0805E0FA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E104: .4byte 0x00000219
_0805E108: .4byte IWRAM_START + 0x2C

.endif

	thumb_func_start TaskDestructor_Interactable_BouncySpring
TaskDestructor_Interactable_BouncySpring: @ 0x0805E10C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
