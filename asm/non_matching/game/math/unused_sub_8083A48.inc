

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #6
	ldrsh r2, [r0, r3]
	movs r5, #0
	ldrsh r4, [r1, r5]
	mov r8, r4
	mov r7, r8
	muls r7, r2, r7
	adds r2, r7, #0
	movs r3, #0
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	movs r4, #4
	ldrsh r6, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r5, #4
	ldrsh r3, [r0, r5]
	movs r7, #2
	ldrsh r5, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r5, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #2
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r4, #4
	ldrsh r3, [r0, r4]
	mov r7, r8
	muls r7, r3, r7
	adds r3, r7, #0
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #2]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r6, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #6
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r3, #4
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	subs r2, r2, r0
	asrs r2, r2, #0xa
	strh r2, [r1, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
    
    @ Unused
	
.syntax divided
