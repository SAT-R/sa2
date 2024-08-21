
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	str r1, [sp]
	ldr r4, [r1]
	ldr r7, [r1, #4]
	ldr r0, [r0, #0x14]
	adds r1, r4, #0
	muls r1, r0, r1
	mov r2, r8
	ldr r0, [r2, #0x18]
	muls r0, r7, r0
	adds r1, r1, r0
	ldr r3, [sp]
	ldr r3, [r3, #8]
	mov sb, r3
	ldr r0, [r2, #0x1c]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r1, r1, r0
	asrs r1, r1, #0xa
	bl __divsi3
	mov sl, r0
	str r4, [sp, #4]
	asrs r4, r4, #0x1f
	str r4, [sp, #8]
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	str r7, [sp, #0xc]
	asrs r7, r7, #0x1f
	str r7, [sp, #0x10]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, r8
	movs r3, #6
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	mov r2, sl
	str r2, [sp, #0x14]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3]
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, r8
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r2, [sp]
	str r0, [r2, #4]
	mov r3, r8
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r2, r8
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r2, [sp]
	str r0, [r2, #8]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
    
    @ Unused
	
.syntax divided
