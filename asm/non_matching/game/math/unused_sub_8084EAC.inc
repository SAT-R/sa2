
.syntax unified
.text
@ Called in math_0.s (unused sub_80851E0)
	ldrh r2, [r0, #4]
	ldrh r3, [r0, #8]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #8]
	eors r2, r1
	strh r2, [r0, #4]
	ldrh r2, [r0, #6]
	ldrh r3, [r0, #0xe]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0xe]
	eors r2, r1
	strh r2, [r0, #6]
	ldrh r2, [r0, #0xc]
	ldrh r3, [r0, #0x10]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0x10]
	eors r2, r1
	strh r2, [r0, #0xc]
	bx lr
	.align 2, 0

.syntax divided
