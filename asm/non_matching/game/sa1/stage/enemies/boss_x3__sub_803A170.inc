.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, lr}
	ldr r2, _0803A184 @ =gPlayer
	movs r1, #0x78
	strh r1, [r2, #0x1c]
	adds r5, r2, #0
	cmp r0, #0
	beq _0803A188
	movs r0, #0xfe
	lsls r0, r0, #8
	b _0803A18C
	.align 2, 0
_0803A184: .4byte gPlayer
_0803A188:
	movs r0, #0x80
	lsls r0, r0, #2
_0803A18C:
	strh r0, [r5, #8]
	movs r4, #0
	ldr r0, _0803A1D0 @ =0x0000FA20
	strh r0, [r5, #0xa]
	strb r4, [r5, #0x14]
	ldr r0, [r5, #0x10]
	ldr r1, _0803A1D4 @ =0xFF1FFAC3
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	adds r1, r5, #0
	adds r1, #0x3d
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3e
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A1D0: .4byte 0x0000FA20
_0803A1D4: .4byte 0xFF1FFAC3

.align 2, 0
.syntax divided
