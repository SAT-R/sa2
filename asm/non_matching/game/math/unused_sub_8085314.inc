

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r2, #0
	ldrsh r3, [r1, r2]
	lsls r3, r3, #1
	movs r5, #2
	ldrsh r4, [r1, r5]
	lsls r4, r4, #1
	movs r7, #4
	ldrsh r6, [r1, r7]
	lsls r6, r6, #1
	movs r5, #6
	ldrsh r2, [r1, r5]
	adds r5, r3, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	str r5, [sp]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r5, r7, #0
	lsls r5, r5, #6
	mov ip, r5
	adds r7, r6, #0
	muls r7, r2, r7
	adds r2, r7, #0
	lsls r2, r2, #6
	mov sb, r2
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r7, r3, #0
	muls r7, r2, r7
	adds r3, r7, #0
	lsls r3, r3, #6
	mov r8, r3
	adds r3, r4, #0
	muls r3, r2, r3
	lsls r3, r3, #6
	adds r5, r6, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	movs r7, #2
	ldrsh r2, [r1, r7]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r4, r7, #0
	lsls r4, r4, #6
	mov sl, r4
	adds r4, r6, #0
	muls r4, r2, r4
	lsls r4, r4, #6
	movs r7, #4
	ldrsh r1, [r1, r7]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r2, r2, #6
	mov r1, sl
	asrs r1, r1, #0x10
	mov sl, r1
	asrs r2, r2, #0x10
	adds r1, r1, r2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r6, r7, #0
	subs r1, r6, r1
	movs r7, #0
	str r7, [r0, #0x14]
	strh r1, [r0, #2]
	asrs r3, r3, #0x10
	mov r1, sb
	asrs r1, r1, #0x10
	mov sb, r1
	subs r1, r3, r1
	strh r1, [r0, #4]
	asrs r5, r5, #0x10
	mov r7, ip
	asrs r7, r7, #0x10
	adds r1, r5, r7
	strh r1, [r0, #6]
	add r3, sb
	strh r3, [r0, #8]
	mov r1, r8
	asrs r1, r1, #0x10
	mov r8, r1
	add r2, r8
	subs r2, r6, r2
	strh r2, [r0, #0xa]
	asrs r4, r4, #0x10
	ldr r2, [sp]
	asrs r3, r2, #0x10
	subs r1, r4, r3
	strh r1, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	adds r4, r4, r3
	strh r4, [r0, #0x10]
	add r8, sl
	mov r3, r8
	subs r6, r6, r3
	strh r6, [r0, #0x12]
	ldr r4, [r0, #0x14]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
