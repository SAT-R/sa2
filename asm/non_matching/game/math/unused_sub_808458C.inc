

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	ldr r0, [r1]
	str r0, [sp, #4]
	asrs r0, r0, #0x1f
	str r0, [sp, #8]
	mov r1, sb
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r2, sl
	ldr r0, [r2, #4]
	str r0, [sp, #0xc]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	mov r3, sb
	ldr r0, [r3, #0x18]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r6, r6, r0
	adcs r7, r1
	mov r1, sl
	ldr r0, [r1, #8]
	adds r4, r0, #0
	asrs r5, r0, #0x1f
	mov r2, sb
	ldr r0, [r2, #0x1c]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r2, r2, r6
	adcs r3, r7
	ldr r1, _08084778 @ =0x00000000
	ldr r0, _08084774 @ =0x00100000
	adds r2, r2, r0
	adcs r3, r1
	lsls r6, r3, #0x16
	mov r8, r6
	lsrs r6, r2, #0xa
	mov r2, r8
	orrs r2, r6
	asrs r3, r3, #0xa
	bl __divdi3
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r6, [sp, #0x14]
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x1c]
	str r3, [sp, #0x20]
	mov r3, sb
	movs r1, #6
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r3, [sp, #0x14]
	str r3, [sp, #0x24]
	asrs r6, r6, #0x1f
	str r6, [sp, #0x28]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6]
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r2, [r0, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r2, [r0, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
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
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6, #4]
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r2, [r0, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r2, [r0, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
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
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6, #8]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084774: .4byte 0x00100000
_08084778: .4byte 0x00000000

    @ Unused
	
.syntax divided
