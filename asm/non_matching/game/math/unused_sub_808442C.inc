

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r0, [r0, #4]
	mov sb, r0
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, r8
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r0, [r0, #8]
	asrs r0, r0, #0x1f
	str r0, [sp]
	mov r2, sl
	ldr r0, [r2, #8]
	ldr r1, [sp]
	mov r3, r8
	movs r2, #0xe
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r4, r1, #0
	adds r3, r0, #0
	adds r3, r3, r5
	adcs r4, r6
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r3, r3, r0
	adcs r4, r1
	lsls r1, r4, #0x16
	lsrs r0, r3, #0xa
	orrs r1, r0
	str r1, [sp, #4]
	asrs r3, r4, #0xa
	str r3, [sp, #8]
	mov r2, sl
	str r1, [r2]
	ldr r3, [sp, #4]
	asrs r6, r3, #0x1f
	adds r0, r3, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #4
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r3, sl
	ldr r0, [r3, #8]
	ldr r1, [sp]
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	adds r4, r4, r0
	adcs r5, r1
	mov r1, r8
	ldr r2, [r1, #0x18]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r4, r4, r0
	adcs r5, r1
	lsls r1, r5, #0x16
	lsrs r0, r4, #0xa
	adds r4, r1, #0
	orrs r4, r0
	mov r2, sl
	str r4, [r2, #4]
	ldr r0, [sp, #4]
	adds r1, r6, #0
	mov r3, r8
	movs r2, #6
	ldrsh r6, [r3, r2]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r4, #0
	asrs r1, r4, #0x1f
	mov r3, r8
	movs r2, #0xc
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r6, r0
	adcs r7, r1
	mov r3, sl
	ldr r0, [r3, #8]
	ldr r1, [sp]
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r6
	adcs r1, r7
	mov r2, r8
	ldr r4, [r2, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sl
	str r0, [r3, #8]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	
.syntax divided
