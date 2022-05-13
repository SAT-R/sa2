.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80855F8
sub_80855F8: @ 0x080855F8
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsrs r2, r1, #0x10
	movs r3, #1
	lsls r3, r6
	subs r1, r3, #1
	subs r0, r2, r7
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r3, #1
	cmp r2, r0
	bls _0808562A
	subs r0, r2, r3
	lsls r0, r0, #0x10
	b _0808562C
_0808562A:
	lsls r0, r2, #0x10
_0808562C:
	asrs r1, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r1, #0
	muls r0, r1, r0
	asrs r0, r4
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, r7, r0
	movs r1, #1
	lsls r1, r6
	subs r1, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085654
sub_8085654: @ 0x08085654
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	ldr r0, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808566A:
	adds r0, r6, #0
	asrs r1, r6, #0x1f
	mov r3, r8
	subs r2, r4, r3
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r2, r7, #0
	bl __ashrdi3
	subs r4, r4, r0
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	bne _0808566A
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085698
sub_8085698: @ 0x08085698
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	ldr r0, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080856B0:
	adds r0, r6, #0
	asrs r1, r6, #0x1f
	subs r2, r7, r4
	asrs r3, r2, #0x1f
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	subs r4, r7, r0
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	bne _080856B0
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80856DC
sub_80856DC: @ 0x080856DC
	push {lr}
	adds r3, r0, #0
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r3, r1, #1
	adds r3, r3, r1
	lsls r3, r3, #1
	adds r0, r0, r3
	subs r0, r0, r2
	movs r1, #0xc
	bl __divsi3
	pop {r1}
	bx r1

	thumb_func_start sub_80856F8
sub_80856F8: @ 0x080856F8
	push {lr}
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, r0, r3
	lsls r1, r2, #3
	subs r1, r1, r2
	adds r0, r0, r1
	movs r1, #0xc
	bl __divsi3
	pop {r1}
	bx r1

	thumb_func_start sub_8085714
sub_8085714: @ 0x08085714
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, r0, r2
	asrs r0, r0, #3
	bx lr
	.align 2, 0

	thumb_func_start sub_8085720
sub_8085720: @ 0x08085720
	lsls r1, r1, #3
	subs r1, r1, r0
	adds r1, r1, r2
	asrs r1, r1, #3
	adds r0, r1, #0
	bx lr

	thumb_func_start sub_808572C
sub_808572C: @ 0x0808572C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r6, [sp, #0x14]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	subs r4, r4, r0
	asrs r5, r4, #0x1f
	movs r2, #1
	lsls r2, r6
	subs r2, r2, r1
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8085758
sub_8085758: @ 0x08085758
	subs r0, r1, r0
	bx lr

	thumb_func_start sub_808575C
sub_808575C: @ 0x0808575C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldr r6, [sp, #0x1c]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	subs r4, r2, r4
	asrs r0, r4, #1
	adds r4, r4, r0
	asrs r1, r1, #1
	subs r4, r4, r1
	asrs r5, r4, #0x1f
	movs r2, #1
	lsls r2, r6
	subs r2, r2, r3
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085798
sub_8085798: @ 0x08085798
	subs r0, r2, r0
	asrs r2, r0, #1
	adds r0, r0, r2
	asrs r1, r1, #1
	subs r0, r0, r1
	bx lr

	thumb_func_start sub_80857A4
sub_80857A4: @ 0x080857A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldr r6, [sp, #0x1c]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	subs r4, r2, r4
	asrs r0, r4, #1
	adds r4, r4, r0
	asrs r1, r1, #1
	subs r4, r4, r1
	asrs r5, r4, #0x1f
	movs r2, #1
	lsls r2, r6
	subs r2, r2, r3
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80857E0
sub_80857E0: @ 0x080857E0
	subs r0, r2, r0
	asrs r2, r0, #1
	adds r0, r0, r2
	asrs r1, r1, #1
	subs r0, r0, r1
	bx lr

	thumb_func_start sub_80857EC
sub_80857EC: @ 0x080857EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov sb, r1
	adds r7, r2, #0
	str r3, [sp]
	ldr r6, [sp, #0x34]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	subs r4, r1, r4
	asrs r5, r4, #0x1f
	movs r0, #1
	mov sl, r0
	mov r1, sl
	lsls r1, r6
	mov sl, r1
	ldr r2, [sp, #0x30]
	add r2, sl
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [sp, #4]
	mov r8, r2
	mov r3, sb
	subs r2, r7, r3
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r7, sl
	ldr r2, [sp, #0x30]
	subs r4, r7, r2
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp, #4]
	mov r7, r8
	asrs r5, r7, #0x1f
	subs r2, r2, r7
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	subs r2, r6, #1
	movs r3, #1
	lsls r3, r2
	ldr r7, [sp, #0x2c]
	asrs r2, r7, #1
	adds r7, r3, r2
	adds r2, r7, #0
	asrs r3, r7, #0x1f
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	adds r4, r4, r0
	adcs r5, r1
	mov r1, sl
	ldr r2, [sp]
	subs r0, r1, r2
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80858A4
sub_80858A4: @ 0x080858A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov sb, r1
	adds r7, r2, #0
	str r3, [sp]
	ldr r6, [sp, #0x34]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	subs r4, r1, r4
	asrs r5, r4, #0x1f
	movs r0, #1
	mov sl, r0
	mov r1, sl
	lsls r1, r6
	mov sl, r1
	ldr r2, [sp, #0x30]
	add r2, sl
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [sp, #4]
	mov r8, r2
	mov r3, sb
	subs r2, r7, r3
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r7, sl
	ldr r2, [sp, #0x30]
	subs r4, r7, r2
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp, #4]
	mov r7, r8
	asrs r5, r7, #0x1f
	subs r2, r2, r7
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	subs r2, r6, #1
	movs r3, #1
	lsls r3, r2
	ldr r7, [sp, #0x2c]
	asrs r2, r7, #1
	subs r7, r3, r2
	adds r2, r7, #0
	asrs r3, r7, #0x1f
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	adds r4, r4, r0
	adcs r5, r1
	mov r1, sl
	ldr r2, [sp]
	subs r0, r1, r2
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808595C
sub_808595C: @ 0x0808595C
	subs r0, r1, r0
	subs r2, r2, r1
	subs r2, r2, r0
	asrs r2, r2, #1
	adds r0, r0, r2
	bx lr

	thumb_func_start sub_8085968
sub_8085968: @ 0x08085968
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080859EC @ =0x00000FFF
	subs r7, r0, r1
	adds r0, r7, #0
	muls r0, r7, r0
	asrs r0, r0, #0xc
	muls r0, r7, r0
	asrs r7, r0, #0xc
	movs r2, #0
	ldrsh r0, [r4, r2]
	muls r0, r7, r0
	movs r5, #0xab
	mov r8, r5
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #0xa
	adds r4, #2
	adds r3, r1, #0
	muls r3, r1, r3
	asrs r3, r3, #0xc
	adds r2, r3, #0
	muls r2, r1, r2
	asrs r7, r2, #0xc
	movs r6, #0
	ldrsh r5, [r4, r6]
	mov ip, r5
	asrs r2, r2, #0xd
	ldr r6, _080859F0 @ =gUnknown_080E0290
	subs r2, r2, r3
	ldrh r5, [r6]
	adds r2, r2, r5
	mov r5, ip
	muls r5, r2, r5
	adds r2, r5, #0
	adds r0, r0, r2
	adds r4, #2
	movs r5, #0
	ldrsh r2, [r4, r5]
	adds r1, r1, r3
	subs r1, r1, r7
	asrs r1, r1, #1
	ldrh r6, [r6, #2]
	adds r1, r1, r6
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r7, r1
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	asrs r1, r1, #0xa
	adds r0, r0, r1
	lsls r0, r0, #4
	asrs r0, r0, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080859EC: .4byte 0x00000FFF
_080859F0: .4byte gUnknown_080E0290

	thumb_func_start sub_80859F4
sub_80859F4: @ 0x080859F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x1c
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, _08085A80 @ =0x00000FFF
	lsrs r1, r1, #0x10
	ands r1, r0
	subs r7, r0, r1
	adds r0, r7, #0
	muls r0, r7, r0
	asrs r0, r0, #0xc
	muls r0, r7, r0
	asrs r7, r0, #0xc
	movs r2, #0
	ldrsh r0, [r4, r2]
	muls r0, r7, r0
	movs r5, #0xab
	mov r8, r5
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #0xa
	adds r3, r1, #0
	muls r3, r1, r3
	asrs r3, r3, #0xc
	adds r2, r3, #0
	muls r2, r1, r2
	asrs r7, r2, #0xc
	movs r6, #2
	ldrsh r5, [r4, r6]
	mov ip, r5
	asrs r2, r2, #0xd
	ldr r6, _08085A84 @ =gUnknown_080E0290
	subs r2, r2, r3
	ldrh r5, [r6]
	adds r2, r2, r5
	mov r5, ip
	muls r5, r2, r5
	adds r2, r5, #0
	adds r0, r0, r2
	adds r4, #4
	movs r5, #0
	ldrsh r2, [r4, r5]
	adds r1, r1, r3
	subs r1, r1, r7
	asrs r1, r1, #1
	ldrh r6, [r6, #2]
	adds r1, r1, r6
	muls r1, r2, r1
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r7, r1
	mov r2, r8
	muls r2, r1, r2
	adds r1, r2, #0
	asrs r1, r1, #0xa
	adds r0, r0, r1
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x16
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08085A80: .4byte 0x00000FFF
_08085A84: .4byte gUnknown_080E0290

	thumb_func_start sub_8085A88
sub_8085A88: @ 0x08085A88
	movs r2, #0
	strh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_8085A9C
sub_8085A9C: @ 0x08085A9C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #1
	movs r0, #1
	lsls r0, r2
	bl __divsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r5
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r5
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r5
	strh r0, [r4, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085B00
sub_8085B00: @ 0x08085B00
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	ldrsh r3, [r5, r0]
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	movs r6, #2
	ldrsh r4, [r5, r6]
	movs r6, #2
	ldrsh r3, [r1, r6]
	muls r3, r4, r3
	adds r0, r0, r3
	movs r4, #4
	ldrsh r3, [r5, r4]
	movs r6, #4
	ldrsh r1, [r1, r6]
	muls r1, r3, r1
	adds r0, r0, r1
	asrs r0, r2
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085B34
sub_8085B34: @ 0x08085B34
	push {r4, r5, r6, r7, lr}
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	movs r7, #4
	ldrsh r6, [r0, r7]
	movs r7, #2
	ldrsh r5, [r1, r7]
	muls r5, r6, r5
	subs r4, r4, r5
	asrs r4, r3
	strh r4, [r2]
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	movs r7, #0
	ldrsh r6, [r0, r7]
	movs r7, #4
	ldrsh r5, [r1, r7]
	muls r5, r6, r5
	subs r4, r4, r5
	asrs r4, r3
	strh r4, [r2, #2]
	movs r4, #0
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	movs r7, #2
	ldrsh r5, [r0, r7]
	movs r6, #0
	ldrsh r0, [r1, r6]
	muls r0, r5, r0
	subs r4, r4, r0
	asrs r4, r3
	strh r4, [r2, #4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085B90
sub_8085B90: @ 0x08085B90
	movs r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0, #6]
	bx lr

	thumb_func_start sub_8085BA0
sub_8085BA0: @ 0x08085BA0
	ldrh r1, [r0]
	rsbs r1, r1, #0
	strh r1, [r0]
	ldrh r1, [r0, #2]
	rsbs r1, r1, #0
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	rsbs r1, r1, #0
	strh r1, [r0, #4]
	bx lr

	thumb_func_start sub_8085BB4
sub_8085BB4: @ 0x08085BB4
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r4, _08085BE8 @ =gSinLookup
	lsls r2, r1, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	movs r3, #0
	strh r2, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085BE8: .4byte gSinLookup

	thumb_func_start sub_8085BEC
sub_8085BEC: @ 0x08085BEC
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r4, _08085C20 @ =gSinLookup
	lsls r2, r1, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	movs r3, #0
	strh r3, [r0]
	strh r2, [r0, #2]
	strh r3, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085C20: .4byte gSinLookup

	thumb_func_start sub_8085C24
sub_8085C24: @ 0x08085C24
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r4, _08085C58 @ =gSinLookup
	lsls r2, r1, #1
	adds r2, r2, r4
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	movs r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085C58: .4byte gSinLookup

	thumb_func_start sub_8085C5C
sub_8085C5C: @ 0x08085C5C
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r5, _08085CA4 @ =gSinLookup
	lsls r3, r1, #1
	adds r3, r3, r5
	ldrh r4, [r3]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	movs r6, #0
	ldrsh r3, [r2, r6]
	muls r3, r4, r3
	asrs r3, r3, #0xa
	strh r3, [r0]
	movs r6, #2
	ldrsh r3, [r2, r6]
	muls r3, r4, r3
	asrs r3, r3, #0xa
	strh r3, [r0, #2]
	movs r3, #4
	ldrsh r2, [r2, r3]
	muls r2, r4, r2
	asrs r2, r2, #0xa
	strh r2, [r0, #4]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	strh r1, [r0, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085CA4: .4byte gSinLookup

	thumb_func_start sub_8085CA8
sub_8085CA8: @ 0x08085CA8
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	movs r2, #0
_08085CB0:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08085CB0
	pop {r0}
	bx r0

	thumb_func_start sub_8085CC0
sub_8085CC0: @ 0x08085CC0
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	movs r2, #0
_08085CC8:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08085CC8
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085CE4
sub_8085CE4: @ 0x08085CE4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r4, #0
	movs r0, #0
	movs r2, #0
_08085CF2:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08085CF2
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	str r5, [r4, #0x14]
	str r6, [r4, #0x18]
	str r3, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8085D14
sub_8085D14: @ 0x08085D14
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r4, #0
	movs r0, #0
	movs r2, #0
_08085D22:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08085D22
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	strh r5, [r4, #2]
	strh r6, [r4, #0xa]
	strh r3, [r4, #0x12]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8085D44
sub_8085D44: @ 0x08085D44
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_8085D50
sub_8085D50: @ 0x08085D50
	push {lr}
	adds r1, r0, #0
	b _08085D58
_08085D56:
	ldr r1, [r1]
_08085D58:
	ldr r0, [r1]
	cmp r0, #0
	bne _08085D56
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8085D64
sub_8085D64: @ 0x08085D64
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1]
	cmp r0, #0
	beq _08085D72
	bl sub_8085D98
_08085D72:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085D78
sub_8085D78: @ 0x08085D78
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08085D88
	bl sub_8085D98
_08085D88:
	str r5, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	str r4, [r5, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085D98
sub_8085D98: @ 0x08085D98
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #4]
	movs r2, #0
	cmp r0, #0
	beq _08085DC8
	movs r4, #0
_08085DA6:
	cmp r0, r1
	bne _08085DC0
	cmp r2, #0
	bne _08085DB4
	ldr r0, [r0, #8]
	str r0, [r3, #4]
	b _08085DB8
_08085DB4:
	ldr r0, [r0, #8]
	str r0, [r2, #8]
_08085DB8:
	str r4, [r1]
	str r4, [r1, #8]
	movs r0, #1
	b _08085DCA
_08085DC0:
	adds r2, r0, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08085DA6
_08085DC8:
	movs r0, #0
_08085DCA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_8085DD0
sub_8085DD0: @ 0x08085DD0
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _08085DE8
_08085DDC:
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _08085DDC
_08085DE8:
	pop {r1}
	bx r1

	thumb_func_start sub_8085DEC
sub_8085DEC: @ 0x08085DEC
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	ldr r2, [r2, #4]
	b _08085E00
_08085DF8:
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [r2, #8]
_08085E00:
	cmp r2, #0
	beq _08085E08
	cmp r0, #0
	bne _08085DF8
_08085E08:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085E10
sub_8085E10: @ 0x08085E10
	push {r4, lr}
	adds r0, #0x10
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085E24
sub_8085E24: @ 0x08085E24
	push {r4, lr}
	adds r0, #0x10
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085E38
sub_8085E38: @ 0x08085E38
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r1, #0x10
	ldm r1!, {r2, r3, r6}
	stm r0!, {r2, r3, r6}
	ldr r1, [r1]
	str r1, [r0]
	b _08085E58
_08085E4E:
	adds r1, r4, #0
	adds r1, #0x10
	adds r0, r5, #0
	bl sub_80835E0
_08085E58:
	ldr r4, [r4]
	cmp r4, #0
	bne _08085E4E
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8085E64
sub_8085E64: @ 0x08085E64
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2, #0x10]
	adds r1, r2, #0
	adds r1, #0x34
	movs r3, #0
_08085E72:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08085E72
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0

	thumb_func_start sub_8085E94
sub_8085E94: @ 0x08085E94
	adds r2, r0, #0
	movs r0, #1
	str r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x58
	movs r1, #0
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	str r1, [r2, #0x6c]
	str r1, [r2, #0x68]
	str r1, [r2, #0x64]
	adds r0, #0xc
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	bx lr
	.align 2, 0
