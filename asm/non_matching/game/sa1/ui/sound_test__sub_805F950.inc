.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805F9A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _0805F9A4 @ =0x03000108
	adds r0, r5, r1
	ldr r6, [r0]
	ldr r2, _0805F9A8 @ =0x0300010D
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _0805F972
	cmp r6, #0x77
	bhi _0805F9B8
_0805F972:
	movs r7, #0
	movs r0, #0xb4
	strh r0, [r4, #0x16]
	movs r0, #0x78
	strh r0, [r4, #0x18]
	ldr r0, _0805F9AC @ =0x00000355
	strh r0, [r4, #0xa]
	ldr r0, _0805F9B0 @ =0x03000020
	adds r2, r5, r0
	strb r7, [r2]
	cmp r6, #0x77
	beq _0805F98C
	b _0805FAA8
_0805F98C:
	adds r0, #1
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	strb r0, [r3]
	ldr r0, _0805F9B4 @ =0x00000356
	strh r0, [r4, #0xa]
	strb r7, [r2]
	b _0805FAA8
	.align 2, 0
_0805F9A0: .4byte gCurTask
_0805F9A4: .4byte 0x03000108
_0805F9A8: .4byte 0x0300010D
_0805F9AC: .4byte 0x00000355
_0805F9B0: .4byte 0x03000020
_0805F9B4: .4byte 0x00000356
_0805F9B8:
	cmp r0, #1
	bne _0805F9DC
	movs r1, #0
	movs r0, #0xb4
	strh r0, [r4, #0x16]
	movs r0, #0x78
	strh r0, [r4, #0x18]
	ldr r0, _0805F9D4 @ =0x00000356
_0805F9C8:
	strh r0, [r4, #0xa]
	ldr r2, _0805F9D8 @ =0x03000020
	adds r0, r5, r2
	strb r1, [r0]
	b _0805FAA8
	.align 2, 0
_0805F9D4: .4byte 0x00000356
_0805F9D8: .4byte 0x03000020
_0805F9DC:
	cmp r0, #2
	bne _0805FA6C
	adds r0, r6, #0
	movs r1, #0xfa
	bl Mod
	cmp r0, #0x77
	bgt _0805FA00
	movs r1, #0
	movs r0, #0xa4
	strh r0, [r4, #0x16]
	movs r0, #0x78
	strh r0, [r4, #0x18]
	ldr r0, _0805F9FC @ =0x00000357
	b _0805F9C8
	.align 2, 0
_0805F9FC: .4byte 0x00000357
_0805FA00:
	adds r0, r6, #0
	movs r1, #0xfa
	bl Mod
	cmp r0, #0x7c
	ble _0805FA40
	adds r0, r6, #0
	movs r1, #0xfa
	bl Mod
	cmp r0, #0xf4
	bgt _0805FA40
	movs r1, #0
	movs r0, #0xc4
	strh r0, [r4, #0x16]
	movs r0, #0x78
	strh r0, [r4, #0x18]
	ldr r0, _0805FA38 @ =0x00000357
	strh r0, [r4, #0xa]
	ldr r2, _0805FA3C @ =0x03000020
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0805FAAE
	.align 2, 0
_0805FA38: .4byte 0x00000357
_0805FA3C: .4byte 0x03000020
_0805FA40:
	movs r0, #0xb4
	strh r0, [r4, #0x16]
	movs r0, #0x78
	strh r0, [r4, #0x18]
	ldr r0, _0805FA60 @ =0x00000357
	strh r0, [r4, #0xa]
	ldr r0, _0805FA64 @ =0x03000020
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0805FA68 @ =0x0300010E
	adds r1, r5, r2
	movs r0, #5
	strh r0, [r1]
	b _0805FAB0
	.align 2, 0
_0805FA60: .4byte 0x00000357
_0805FA64: .4byte 0x03000020
_0805FA68: .4byte 0x0300010E
_0805FA6C:
	cmp r0, #3
	bne _0805FAB0
	movs r6, #0
	movs r0, #0xb4
	strh r0, [r4, #0x16]
	movs r0, #0x78
	strh r0, [r4, #0x18]
	movs r0, #0xd6
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _0805FAC4 @ =0x03000020
	adds r2, r5, r0
	strb r6, [r2]
	adds r0, #0xee
	adds r1, r5, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805FAA8
	ldr r0, _0805FAC8 @ =0x03000021
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	strb r0, [r3]
	ldr r0, _0805FACC @ =0x00000356
	strh r0, [r4, #0xa]
	strb r6, [r2]
_0805FAA8:
	ldr r0, [r4, #0x10]
	ldr r1, _0805FAD0 @ =0xFFFFFBFF
	ands r0, r1
_0805FAAE:
	str r0, [r4, #0x10]
_0805FAB0:
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAC4: .4byte 0x03000020
_0805FAC8: .4byte 0x03000021
_0805FACC: .4byte 0x00000356
_0805FAD0: .4byte 0xFFFFFBFF

.syntax divided
