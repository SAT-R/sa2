.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    @ Used in math_1.c
	thumb_func_start sub_8083B88
sub_8083B88: @ 0x08083B88
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
	thumb_func_start sub_8083E44
sub_8083E44: @ 0x08083E44
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
	thumb_func_start sub_8084090
sub_8084090: @ 0x08084090
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
	thumb_func_start sub_80842E4
sub_80842E4: @ 0x080842E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	mov r8, r1
	str r2, [sp]
	ldr r7, [r0]
	asrs r0, r7, #0x1f
	str r0, [sp, #4]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sb
	ldr r0, [r0, #4]
	mov sl, r0
	mov r1, sl
	asrs r1, r1, #0x1f
	str r1, [sp, #8]
	mov r2, r8
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r0, [r0, #8]
	mov sb, r0
	mov r1, sb
	asrs r1, r1, #0x1f
	str r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #4
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r1, [sp, #8]
	mov r2, r8
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3, #4]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #6
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r1, [sp, #8]
	mov r2, r8
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
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
	ldr r3, [sp]
	str r0, [r3, #8]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

    @ Unused
	thumb_func_start sub_808442C
sub_808442C: @ 0x0808442C
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
    
    @ Unused
	thumb_func_start sub_808458C
sub_808458C: @ 0x0808458C
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
	thumb_func_start sub_808477C
sub_808477C: @ 0x0808477C
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
	thumb_func_start sub_8084904
sub_8084904: @ 0x08084904
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084960 @ =gSineTable
	movs r3, #0
_08084914:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084914
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #0x10]
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084960: .4byte gSineTable

    @ Unused
	thumb_func_start sub_8084964
sub_8084964: @ 0x08084964
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r3, #0
	movs r0, #0
	ldr r5, _080849C0 @ =gSineTable
	movs r2, #0
_08084974:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084974
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r3, #2]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r3, #6]
	strh r2, [r3, #0xe]
	strh r0, [r3, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080849C0: .4byte gSineTable

    @ Unused
	thumb_func_start sub_80849C4
sub_80849C4: @ 0x080849C4
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084A20 @ =gSineTable
	movs r3, #0
_080849D4:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080849D4
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084A20: .4byte gSineTable

    @ Unused
	thumb_func_start sub_8084A24
sub_8084A24: @ 0x08084A24
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r7, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, ip
	movs r0, #0
	ldr r4, _08084B50 @ =gSineTable
	movs r3, #0
_08084A3A:
	stm r2!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084A3A
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	mov r3, r8
	strh r3, [r2, #0x12]
	strh r3, [r2, #0xa]
	strh r3, [r2, #2]
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r5, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r6, [r0]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x14
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #2
	ldrsh r4, [r7, r1]
	adds r0, r3, #0
	muls r0, r4, r0
	asrs r0, r0, #0xa
	mov r2, r8
	subs r2, r2, r6
	mov r8, r2
	mov r1, r8
	muls r1, r0, r1
	lsls r1, r1, #6
	movs r0, #4
	ldrsh r2, [r7, r0]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r4, r8
	muls r4, r0, r4
	lsls r4, r4, #6
	adds r0, r3, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	lsls r2, r2, #6
	adds r0, r3, #0
	muls r0, r3, r0
	asrs r0, r0, #0xa
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #2]
	movs r3, #4
	ldrsh r0, [r7, r3]
	asrs r5, r5, #0x14
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r1, r1, #0x10
	adds r0, r1, r0
	mov r3, ip
	strh r0, [r3, #4]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r2, r2, #0x10
	subs r0, r2, r0
	mov r3, ip
	strh r0, [r3, #6]
	movs r3, #4
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r1, r1, r0
	mov r0, ip
	strh r1, [r0, #8]
	movs r1, #2
	ldrsh r0, [r7, r1]
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #0xa]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r4, r4, #0x10
	adds r0, r4, r0
	strh r0, [r3, #0xc]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0, #0xe]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r4, r4, r0
	mov r2, ip
	strh r4, [r2, #0x10]
	movs r3, #4
	ldrsh r0, [r7, r3]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xa
	adds r6, r6, r0
	mov r3, ip
	strh r6, [r3, #0x12]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B50: .4byte gSineTable
