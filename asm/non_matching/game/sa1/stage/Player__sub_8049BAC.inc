.include "constants/constants.inc"

.syntax unified
.text
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r3, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08049BC8
	subs r0, r3, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049C04
_08049BC8:
	ldr r0, _08049C00 @ =gPlayerControls
	ldrh r1, [r2, #0x3a]
	ldrh r0, [r0, #2]
	ands r0, r1
	cmp r0, #0
	beq _08049C04
	adds r3, r2, #0
	adds r3, #0x3d
	movs r1, #0
	movs r0, #8
	strb r0, [r3]
	adds r3, #1
	movs r0, #1
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2, #0xc]
	strh r1, [r2, #8]
	strh r1, [r2, #0xa]
	adds r0, r2, #0
	bl sub_804A854
	movs r0, #0x70
	bl m4aSongNumStart
	movs r0, #1
	b _08049C06
	.align 2, 0
_08049C00: .4byte gPlayerControls
_08049C04:
	movs r0, #0
_08049C06:
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
