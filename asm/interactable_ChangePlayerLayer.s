.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Task_Interactable_ChangePlayerLayer
Task_Interactable_ChangePlayerLayer: @ 0x0805E890
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805E8F0 @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldrb r7, [r0, #8]
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	lsls r0, r7, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r4, r0, r2
	ldr r1, _0805E8F4 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r2, r0, #8
	mov ip, r1
	cmp r5, r2
	bgt _0805E910
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r2
	blt _0805E910
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0805E910
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r4, r0
	cmp r0, r1
	blt _0805E910
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _0805E8F8
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	b _0805E902
	.align 2, 0
_0805E8F0: .4byte gCurTask
_0805E8F4: .4byte gPlayer
_0805E8F8:
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
_0805E902:
	strb r0, [r2]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _0805E944 @ =0xFEFFFFFF
	ands r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
_0805E910:
	ldr r1, _0805E948 @ =gCamera
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805E936
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805E936
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _0805E93E
_0805E936:
	strb r7, [r6]
	ldr r0, [r3]
	bl TaskDestroy
_0805E93E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E944: .4byte 0xFEFFFFFF
_0805E948: .4byte gCamera
