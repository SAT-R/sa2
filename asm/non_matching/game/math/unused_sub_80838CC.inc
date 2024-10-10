

.syntax unified
.text
	push {r4, r5, r6, lr}
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #0
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #2
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #4
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #4]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r5, #4
	ldrsh r4, [r0, r5]
	movs r6, #4
	ldrsh r0, [r1, r6]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xa
	strh r3, [r2, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	
.syntax divided
