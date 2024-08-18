

.syntax unified
.text
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x10
	mov r8, r0
	bl sub_8084EAC
	mov r1, r8
	ldr r0, [r1, #0x14]
	rsbs r0, r0, #0
	str r0, [r1, #0x14]
	ldr r4, [r1, #0x18]
	rsbs r4, r4, #0
	str r4, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	mov sb, r2
	mov r3, sb
	rsbs r3, r3, #0
	mov sb, r3
	str r3, [r1, #0x1c]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	str r4, [sp, #8]
	asrs r4, r4, #0x1f
	str r4, [sp, #0xc]
	mov r3, r8
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r2, sb
	asrs r2, r2, #0x1f
	mov sl, r2
	mov r0, sb
	mov r1, sl
	mov r3, r8
	movs r2, #0xe
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x14]
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r2, r8
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	mov r1, sl
	mov r2, r8
	movs r3, #0x10
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
	mov r2, r8
	str r0, [r2, #0x18]
	movs r3, #6
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r1, r8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	mov r1, sl
	mov r3, r8
	movs r2, #0x12
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x1c]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
    
    @ Unused
	
.syntax divided
