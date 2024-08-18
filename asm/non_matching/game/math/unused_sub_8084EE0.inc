

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r1, #2
	ldrsh r4, [r0, r1]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x20]
	movs r5, #0x12
	ldrsh r2, [r0, r5]
	ldr r7, [sp, #0x20]
	adds r0, r7, #0
	muls r0, r2, r0
	mov r1, r8
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r5, #0x10
	ldrsh r7, [r1, r5]
	str r7, [sp, #0x24]
	adds r1, r3, #0
	muls r1, r7, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	mov r7, r8
	movs r0, #4
	ldrsh r6, [r7, r0]
	movs r4, #8
	ldrsh r5, [r7, r4]
	adds r0, r5, #0
	muls r0, r2, r0
	movs r2, #0xe
	ldrsh r4, [r7, r2]
	adds r2, r3, #0
	muls r2, r4, r2
	subs r0, r0, r2
	asrs r0, r0, #0xa
	muls r0, r6, r0
	subs r1, r1, r0
	movs r0, #6
	ldrsh r3, [r7, r0]
	ldr r2, [sp, #0x24]
	adds r0, r5, #0
	muls r0, r2, r0
	ldr r5, [sp, #0x20]
	adds r2, r5, #0
	muls r2, r4, r2
	subs r0, r0, r2
	asrs r0, r0, #0xa
	muls r0, r3, r0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	mov r2, sp
	mov r1, r8
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldm r1!, {r4, r5}
	stm r2!, {r4, r5}
	mov r1, sp
	movs r7, #0xa
	ldrsh r2, [r1, r7]
	movs r3, #0x12
	ldrsh r1, [r1, r3]
	muls r2, r1, r2
	mov r1, sp
	movs r4, #0xc
	ldrsh r3, [r1, r4]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #2]
	rsbs r4, r0, #0
	mov r1, sp
	movs r3, #4
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #4]
	mov r1, sp
	movs r3, #4
	ldrsh r2, [r1, r3]
	movs r5, #0xc
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0xa
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #6]
	mov r1, sp
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #0xc
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #8]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xa]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0xc
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #8
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xc]
	mov r1, sp
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #0xa
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xe]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #4
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0x10]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r4, #0xa
	ldrsh r1, [r1, r4]
	muls r2, r1, r2
	mov r1, sp
	movs r5, #4
	ldrsh r3, [r1, r5]
	movs r7, #8
	ldrsh r1, [r1, r7]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x12]
	ldr r2, [sp, #0x14]
	asrs r2, r2, #0x1f
	mov sb, r2
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r4, [sp, #0x18]
	asrs r4, r4, #0x1f
	mov sl, r4
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r7, #8
	ldrsh r4, [r2, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, sp
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r4, r8
	strh r0, [r4, #0x14]
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r5, #4
	ldrsh r4, [r2, r5]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, sp
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r4, r8
	strh r0, [r4, #0x16]
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r5, #6
	ldrsh r4, [r2, r5]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, sp
	movs r7, #0x12
	ldrsh r4, [r2, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	strh r0, [r2, #0x18]
	add sp, #0x28
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
