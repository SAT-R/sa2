.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [r6, #0x14]
	asrs r0, r0, #0x1f
	mov sb, r0
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r2, #2
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, [r6, #0x18]
	asrs r3, r3, #0x1f
	mov sl, r3
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r7, #8
	ldrsh r4, [r5, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp]
	ldr r3, [sp, #4]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r3, [r6, #0x1c]
	mov r8, r3
	asrs r7, r3, #0x1f
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0xe
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp]
	ldr r3, [sp, #4]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x14]
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r3, #4
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r2, #0xa
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0x10
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x18]
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r3, #6
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r2, #0xc
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0x12
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x1c]
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r7, #8
	ldrsh r3, [r5, r7]
	movs r0, #0xe
	ldrsh r4, [r5, r0]
	movs r1, #2
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #8]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xe]
	movs r7, #4
	ldrsh r2, [r5, r7]
	movs r0, #0xa
	ldrsh r3, [r5, r0]
	movs r1, #0x10
	ldrsh r4, [r5, r1]
	movs r7, #2
	ldrsh r0, [r6, r7]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xa]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0x10]
	movs r7, #6
	ldrsh r2, [r5, r7]
	movs r0, #0xc
	ldrsh r3, [r5, r0]
	movs r1, #0x12
	ldrsh r4, [r5, r1]
	movs r7, #2
	ldrsh r0, [r6, r7]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #6]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xc]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0x12]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

    @ Unused
	
.syntax divided
