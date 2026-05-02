.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _08056468 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	mov sl, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r3, sl
	adds r5, r3, r0     @ r5 = screen
	ldr r0, [r5, #0x78] @ r0 = frames
	ldr r6, _0805646C @ =0x0300003C
	add r6, sl          @ r6 = s2
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [sp, #0xc]  @ sp0C = frames
	ldr r3, _08056470 @ =0xFF880000
	adds r0, r0, r3
	lsrs r0, r0, #8
	lsls r2, r0, #0xc
	ldr r7, _08056474 @ =gOamMatrixIndex
	ldrb r0, [r7]
	adds r1, r0, #1
	strb r1, [r7]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0x80
	orrs r0, r3
	str r0, [r5, #0x10]
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	mov r1, sp
	ldr r0, _08056478 @ =gSineTable
	asrs r2, r2, #0x10
	adds r3, #0x80
	mov sb, r3
	add r2, sb
	lsls r2, r2, #1
	adds r2, r2, r0
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x16
	strh r4, [r1, #2]
	mov r8, r4
	cmp r4, #9
	bgt _080563B6
	movs r0, #0xa
	strh r0, [r1, #2]
_080563B6:
	mov r0, sp
	mov r1, sb
	strh r1, [r0, #4]
	mov r1, sp
	movs r0, #0x7f
	strh r0, [r1, #6]
	mov r0, sp
	movs r3, #0x3c
	strh r3, [r0, #8]
	adds r0, r5, #0
	bl TransformSprite
	ldrb r0, [r7]
	adds r1, r0, #1
	strb r1, [r7]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0x80
	orrs r0, r3
	str r0, [r6, #0x10]
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	strh r4, [r0, #2]
	mov r3, r8
	cmp r3, #9
	bgt _080563F6
	mov r1, sp
	movs r0, #0xa
	strh r0, [r1, #2]
_080563F6:
	mov r0, sp
	mov r1, sb
	strh r1, [r0, #4]
	mov r1, sp
	ldrh r0, [r0, #6]
	strh r0, [r1, #6]
	mov r0, sp
	movs r3, #0x3c
	strh r3, [r0, #8]
	adds r0, r6, #0
	bl TransformSprite
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r5, #0x78]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x87
	ble _08056458
	ldr r2, _0805647C @ =0x000002CB
	strh r2, [r5, #0xa]
	ldr r1, _08056480 @ =0x03000020
	add r1, sl
	movs r0, #2
	strb r0, [r1]
	strh r2, [r6, #0xa]
	ldr r1, _08056484 @ =0x0300005C
	add r1, sl
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08056468 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08056488 @ =Task_805648C
	str r0, [r1, #8]
_08056458:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056468: .4byte gCurTask
_0805646C: .4byte 0x0300003C
_08056470: .4byte 0xFF880000
_08056474: .4byte gOamMatrixIndex
_08056478: .4byte gSineTable
_0805647C: .4byte 0x000002CB
_08056480: .4byte 0x03000020
_08056484: .4byte 0x0300005C
_08056488: .4byte Task_805648C

.syntax divided
