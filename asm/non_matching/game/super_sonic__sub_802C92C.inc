.include "constants/gba_constants.inc"

.syntax unified
.text

	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r0, #1
	str r0, [r3, #0xc]
	cmp r0, #0
	bne _0802C94A
	ldr r0, _0802C980 @ =sub_802C988
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x64
	str r0, [r3, #0xc]
_0802C94A:
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3, #0x1a]
	ldr r2, _0802C984 @ =gSineTable
	ldrh r0, [r3, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	asrs r1, r1, #6
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r1, r1, #6
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C980: .4byte sub_802C988
_0802C984: .4byte gSineTable

.syntax divided
