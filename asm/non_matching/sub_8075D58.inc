.include "asm/macros.inc"

.syntax unified
.text
	push {r4, lr}
	ldr r2, [r0, #0x3c]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r1, #0
	adds r2, r2, r4
	ldr r3, _08075D8C @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1

	ldr r0, [r0, #0x40]
	adds r0, r0, r4
	ldr r1, [r3, #4]
	subs r0, r0, r1

	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xbc
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _08075D88
	movs r0, #0xa8
	lsls r0, r0, #2
	cmp r1, r0
	bls _08075D90
_08075D88:
	movs r0, #1
	b _08075D92
	.align 2, 0
_08075D8C: .4byte gCamera
_08075D90:
	movs r0, #0
_08075D92:
	pop {r4}
	pop {r1}
	bx r1

.syntax divided
