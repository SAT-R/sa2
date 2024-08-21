.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r6, [sp, #0x54]
	ldr r0, [sp, #0x58]
	mov sb, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	str r6, [sp, #8]
	asrs r2, r6, #0x1f
	str r2, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r1, #0
	adds r2, r0, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x14]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	str r3, [sp, #0x10]
	movs r4, #1
	mov r0, sb
	lsls r4, r0
	subs r4, r4, r6
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x2c]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	mov r2, sl
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r2, r0, #0x1f
	mov r8, r2
	lsls r6, r1, #1
	mov r3, r8
	orrs r3, r6
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	ldr r2, [sp]
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r5, r0, #0x1f
	lsls r4, r1, #1
	adds r3, r5, #0
	orrs r3, r4
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	asrs r1, r2, #0x1f
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	ldr r3, [sp, #0x24]
	ldr r4, [sp, #0x28]
	adds r3, r3, r0
	adcs r4, r1
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	adds r1, r4, #0
	adds r0, r3, #0
	mov r2, sb
	bl __ashrdi3
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

    @ Unused
	
.syntax divided
