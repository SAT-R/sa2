.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	movs r3, #4
	ldrsh r2, [r5, r3]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #2]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #4]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #6]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #8]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xc]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xe]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x10]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x12]
	ldr r2, [r5, #0x14]
	mov sl, r2
	mov r3, sl
	asrs r3, r3, #0x1f
	str r3, [sp]
	mov r0, sl
	adds r1, r3, #0
	movs r2, #2
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [r5, #0x18]
	mov sb, r3
	mov r0, sb
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r2, #8
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r5, [r5, #0x1c]
	asrs r7, r5, #0x1f
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0xe
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x14]
	mov r0, sl
	ldr r1, [sp]
	movs r2, #4
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r3, #0xa
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0x10
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x18]
	mov r0, sl
	ldr r1, [sp]
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r3, #0xc
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0x12
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x1c]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
    
    @ Unused
	
.syntax divided
