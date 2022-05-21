.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsrs r2, r1, #0x10
	movs r3, #1
	lsls r3, r6
	subs r1, r3, #1
	subs r0, r2, r7
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r3, #1
	cmp r2, r0
	bls _0808562A
	subs r0, r2, r3
	lsls r0, r0, #0x10
	b _0808562C
_0808562A:
	lsls r0, r2, #0x10
_0808562C:
	asrs r1, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r1, #0
	muls r0, r1, r0
	asrs r0, r4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, r7, r0
	movs r1, #1
	lsls r1, r6
	subs r1, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

.syntax divided
