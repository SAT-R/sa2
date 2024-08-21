.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r1, #4
	ldrsh r4, [r6, r1]
	movs r3, #6
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #6]
	movs r0, #8
	ldrsh r2, [r6, r0]
	movs r1, #0xa
	ldrsh r4, [r6, r1]
	movs r3, #0xc
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #8]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xa]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xc]
	movs r0, #0xe
	ldrsh r2, [r6, r0]
	movs r1, #0x10
	ldrsh r4, [r6, r1]
	movs r3, #0x12
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xe]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0x10]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0x12]
	ldr r2, [r6, #0x14]
	ldr r4, [r6, #0x18]
	ldr r7, [r6, #0x1c]
	str r2, [sp]
	asrs r2, r2, #0x1f
	str r2, [sp, #4]
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	asrs r4, r4, #0x1f
	str r4, [sp, #0x14]
	movs r2, #8
	ldrsh r0, [r5, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r7, [sp, #0x18]
	asrs r7, r7, #0x1f
	str r7, [sp, #0x1c]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
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
	str r0, [r6, #0x14]
	movs r3, #4
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x20]
	str r3, [sp, #0x24]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
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
	str r0, [r6, #0x18]
	movs r3, #6
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x28]
	str r3, [sp, #0x2c]
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
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
	str r0, [r6, #0x1c]
	add sp, #0x30
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

    @ Unused
	
.syntax divided
