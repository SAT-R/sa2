.include "asm/macros.inc"

.syntax unified
.arm

	thumb_func_start sub_08097178
sub_08097178: @ 0x08097178
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080971A8
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _08097194
	asrs r4, r6, #0x1f
	rsbs r0, r0, #0
	adds r3, r6, #0
	asrs r3, r0
	b _080971A4
_08097194:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	asrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_080971A4:
	adds r1, r4, #0
	adds r0, r3, #0
_080971A8:
	pop {r4, r5, r6, pc}
	.align 2, 0
