
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #0
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r6, [r0, r7]
	movs r4, #6
	ldrsh r3, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r5, [r0, r7]
	movs r4, #4
	ldrsh r3, [r1, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #2
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #4
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #2]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #4
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #6
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r6, #2
	ldrsh r3, [r1, r6]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #4
	ldrsh r1, [r1, r7]
	muls r1, r4, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	strh r2, [r0, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
    
    @ Unused
	
.syntax divided
