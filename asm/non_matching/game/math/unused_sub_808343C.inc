.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r4, [sp, #0x28]
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r6, r2, #0
	adds r0, r2, #0
	asrs r1, r6, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r7, r0, #0
	mov r4, sb
	asrs r5, r4, #0x1f
	subs r2, r7, r6
	lsls r2, r2, #1
	subs r2, r2, r6
	movs r0, #1
	mov r3, r8
	lsls r0, r3
	adds r2, r2, r0
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, sl
	asrs r1, r0, #0x1f
	subs r2, r7, r6
	mov sb, r2
	subs r2, r2, r6
	ldr r3, [sp, #0x28]
	adds r2, r2, r3
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp, #4]
	asrs r1, r0, #0x1f
	lsls r2, r6, #1
	adds r2, r2, r6
	subs r2, r2, r7
	subs r2, r2, r7
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp]
	asrs r1, r0, #0x1f
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	adds r1, r5, #0
	adds r0, r4, #0
	mov r2, r8
	bl __ashrdi3
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

    @ Unused
	
.syntax divided
