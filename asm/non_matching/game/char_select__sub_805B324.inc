.include "constants/constants.inc"

.syntax unified

.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0805B37C @ =gUnknown_08688602
	mov r0, sp
	movs r2, #6
	bl memcpy
	ldr r0, _0805B380 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	ldr r1, _0805B384 @ =0x030000C4
	adds r0, r2, r1
	ldrh r1, [r0]
	ldrb r0, [r0]
	lsrs r4, r0, #4
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #8
	mov sl, r0
	ldr r1, _0805B388 @ =0x030000C6
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0805B398
	ldr r0, _0805B38C @ =0x0000FFF8
	strh r0, [r5, #0x16]
	ldr r0, _0805B390 @ =0x03000046
	adds r1, r2, r0
	movs r0, #0x78
	strh r0, [r1]
	ldr r0, _0805B394 @ =0x03000076
	adds r1, r2, r0
	movs r0, #0xf8
	strh r0, [r1]
	movs r6, #0
	b _0805B434
	.align 2, 0
_0805B37C: .4byte gUnknown_08688602
_0805B380: .4byte gCurTask
_0805B384: .4byte 0x030000C4
_0805B388: .4byte 0x030000C6
_0805B38C: .4byte 0x0000FFF8
_0805B390: .4byte 0x03000046
_0805B394: .4byte 0x03000076
_0805B398:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805B3A6
	movs r3, #1
	movs r2, #0xff
	b _0805B3B6
_0805B3A6:
	movs r3, #0
	movs r2, #1
	movs r1, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
_0805B3B6:
	lsls r0, r4, #0x10
	asrs r7, r0, #0x10
	lsls r6, r2, #0x18
	cmp r7, #4
	bne _0805B416
	lsls r2, r3, #1
	adds r2, r2, r3
	mov r1, sp
	adds r0, r1, r2
	ldrb r0, [r0]
	add r0, sl
	movs r3, #3
	ands r0, r3
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	mov r0, sp
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	add r0, sl
	ands r0, r3
	lsls r0, r0, #1
	adds r1, #0x30
	strb r0, [r1]
	mov r0, sp
	adds r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	add r0, sl
	ands r0, r3
	lsls r0, r0, #1
	subs r1, #0x60
	strb r0, [r1]
	asrs r1, r6, #0x11
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r2, r5, #0
	adds r2, #0x46
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #0x30
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
_0805B416:
	cmp r7, #8
	bgt _0805B434
	asrs r1, r6, #0x14
	ldrh r0, [r5, #0x16]
	adds r0, r0, r1
	strh r0, [r5, #0x16]
	adds r2, r5, #0
	adds r2, #0x46
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #0x30
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
_0805B434:
	asrs r1, r6, #0x18
	cmp r1, #1
	bne _0805B448
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	cmp r0, #3
	bgt _0805B45C
	movs r2, #1
	b _0805B45C
_0805B448:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805B45A
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #1
	cmp r0, #3
	bgt _0805B45C
_0805B45A:
	movs r2, #0
_0805B45C:
	adds r7, r5, #0
	adds r7, #0xc8
	ldrb r1, [r7]
	adds r6, r2, #0
	subs r0, r6, #1
	add r0, sl
	movs r2, #3
	mov sb, r2
	ands r0, r2
	asrs r1, r0
	movs r0, #1
	mov r8, r0
	ands r1, r0
	cmp r1, #0
	beq _0805B490
	ldrh r0, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0xa6
	strh r0, [r1]
	ldrh r1, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0xa8
	strh r1, [r0]
	subs r0, #0x18
	bl DisplaySprite
_0805B490:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	ldrb r1, [r7]
	mov r2, sl
	adds r0, r2, r6
	mov r2, sb
	ands r0, r2
	asrs r1, r0
	mov r0, r8
	ands r1, r0
	cmp r1, #0
	beq _0805B4CC
	adds r0, r5, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0xa6
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r0, #0x60
	strh r1, [r0]
	subs r0, #0x18
	bl DisplaySprite
_0805B4CC:
	adds r4, r5, #0
	adds r4, #0x30
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	ldrb r1, [r7]
	adds r0, r6, #1
	add r0, sl
	mov r2, sb
	ands r0, r2
	asrs r1, r0
	mov r0, r8
	ands r1, r0
	cmp r1, #0
	beq _0805B50C
	adds r0, r5, #0
	adds r0, #0x76
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0xa6
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x78
	ldrh r1, [r0]
	adds r0, #0x30
	strh r1, [r0]
	subs r0, #0x18
	bl DisplaySprite
_0805B50C:
	adds r4, r5, #0
	adds r4, #0x60
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
