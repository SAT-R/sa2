.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
.if 1
	thumb_func_start Task_Interactable_044
Task_Interactable_044: @ 0x08010598
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08010644 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0         @ r4 = object
	ldr r5, [r4]            @ r5 = ia
	ldrb r0, [r4, #8]
	mov r8, r0              @ r8 = spriteX
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	mov r6, r8
	lsls r2, r6, #3
	lsls r0, r0, #8
	adds r2, r2, r0         @ r2 = screenX
	mov ip, r2              @ ip = r2
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r7, r0, r1         @ r7 = screenY
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r2, r2, r0         @ r2 = width
	ldr r6, _08010648 @ =gPlayer
	ldr r0, [r6, #8]
	asrs r1, r0, #8         @ r1 = gPlayer.x
	cmp r2, r1
	bgt _08010650
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08010650
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	ldr r0, [r6, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08010650
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08010650
	ldr r1, [r6, #0x20]
	ldr r0, _0801064C @ =0x00040002
	ands r0, r1
	cmp r0, #2
	bne _08010654
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _08010654
	movs r2, #0x80
	lsls r2, r2, #0x15
	ands r1, r2
	cmp r1, #0
	beq _08010624
	movs r0, #1
	strb r0, [r4, #9]
	ldr r0, [r6, #0x20]
	ands r0, r2
	cmp r0, #0
	bne _08010654
_08010624:
	ldrb r1, [r4, #9]
	cmp r1, #0
	bne _08010654
	adds r4, r6, #0
	adds r4, #0x6d
	movs r0, #0x17
	strb r0, [r4]
	adds r4, #1
	strb r1, [r4]
	ldrb r0, [r5, #2]
	cmp r0, #0x2c
	beq _08010654
	movs r0, #1
	strb r0, [r4]
	b _08010654
	.align 2, 0
_08010644: .4byte gCurTask
_08010648: .4byte gPlayer
_0801064C: .4byte 0x00040002
_08010650:
	movs r0, #0
	strb r0, [r4, #9]
_08010654:
	ldr r1, _08010694 @ =gCamera
	ldr r0, [r1]
	mov r6, ip
	subs r6, r6, r0     @ r6 = screenX - cam.x
	mov ip, r6
	ldr r0, [r1, #4]
	subs r7, r7, r0     @ r7 = screenY - cam.y
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801067E
	adds r0, r7, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0801067E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r7, r0
	ble _08010688
_0801067E:
	mov r0, r8
	strb r0, [r5]
	ldr r0, [r3]
	bl TaskDestroy
_08010688:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010694: .4byte gCamera
.endif
