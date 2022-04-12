.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8085514
sub_8085514: @ 0x08085514
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	cmp r2, #0
	bge _08085520
	rsbs r2, r2, #0
_08085520:
	cmp r0, #0
	bge _08085526
	rsbs r0, r0, #0
_08085526:
	cmp r0, r2
	bge _0808552C
	adds r0, r2, #0
_0808552C:
	pop {r1}
	bx r1

	thumb_func_start sub_8085530
sub_8085530: @ 0x08085530
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	cmp r7, #0
	bge _0808553C
	rsbs r7, r7, #0
_0808553C:
	cmp r6, #0
	bge _08085542
	rsbs r6, r6, #0
_08085542:
	cmp r7, r6
	bgt _0808555C
	adds r0, r6, #0
	asrs r1, r6, #0x1f
	movs r2, #0xf6
	movs r3, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	asrs r1, r7, #0x1f
	b _08085570
_0808555C:
	adds r0, r7, #0
	asrs r1, r7, #0x1f
	movs r2, #0xf6
	movs r3, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	asrs r1, r6, #0x1f
_08085570:
	movs r2, #0x66
	movs r3, #0
	bl __muldi3
	adds r0, r0, r4
	adcs r1, r5
	lsls r3, r1, #0x18
	lsrs r2, r0, #8
	adds r0, r3, #0
	orrs r0, r2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808558C
sub_808558C: @ 0x0808558C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r4, #1
	lsls r4, r2
	subs r1, r4, #1
	subs r0, r3, r0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsrs r0, r4, #1
	cmp r3, r0
	bls _080855B4
	subs r0, r3, r4
	lsls r0, r0, #0x10
	b _080855B6
_080855B4:
	lsls r0, r3, #0x10
_080855B6:
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80855C0
sub_80855C0: @ 0x080855C0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r0, r2, #0
	lsls r6, r3, #0x18
	lsrs r6, r6, #0x18
	asrs r1, r0, #0x1f
	mov r2, r8
	subs r4, r2, r4
	asrs r5, r4, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	adds r2, r6, #0
	bl __ashrdi3
	mov r2, r8
	subs r2, r2, r0
	mov r8, r2
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

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
	ldr r4, _08085BE8 @ =gUnknown_08097AA4
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
_08085BE8: .4byte gUnknown_08097AA4

	thumb_func_start sub_8085BEC
sub_8085BEC: @ 0x08085BEC
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r4, _08085C20 @ =gUnknown_08097AA4
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
_08085C20: .4byte gUnknown_08097AA4

	thumb_func_start sub_8085C24
sub_8085C24: @ 0x08085C24
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r4, _08085C58 @ =gUnknown_08097AA4
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
_08085C58: .4byte gUnknown_08097AA4

	thumb_func_start sub_8085C5C
sub_8085C5C: @ 0x08085C5C
	push {r4, r5, r6, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	ldr r5, _08085CA4 @ =gUnknown_08097AA4
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
_08085CA4: .4byte gUnknown_08097AA4

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

	thumb_func_start sub_8085EC4
sub_8085EC4: @ 0x08085EC4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08085ED8
	adds r0, r4, #0
	bl sub_8085EC4
	adds r6, r0, #0
_08085ED8:
	ldr r1, [r4, #0xc]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _08085EEA
	cmp r6, #0
	bne _08085F04
	movs r0, #0
	b _08085F14
_08085EEA:
	movs r5, #1
	ands r1, r5
	cmp r1, #0
	bne _08085F04
	adds r0, r4, #0
	bl sub_80853F8
	ldr r0, [r4, #0xc]
	orrs r0, r5
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
_08085F04:
	adds r0, r4, #0
	adds r0, #0x34
	adds r4, #0x14
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_8083B88
	adds r0, r4, #0
_08085F14:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085F1C
sub_8085F1C: @ 0x08085F1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08085F30
	adds r0, r4, #0
	bl sub_8085EC4
	adds r6, r0, #0
_08085F30:
	ldr r1, [r4, #0xc]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _08085F50
	adds r5, r4, #0
	adds r5, #0x14
	cmp r6, #0
	beq _08085F7A
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_8083B88
	b _08085F7A
_08085F50:
	movs r5, #1
	ands r1, r5
	cmp r1, #0
	bne _08085F6A
	adds r0, r4, #0
	bl sub_80853F8
	ldr r0, [r4, #0xc]
	orrs r0, r5
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
_08085F6A:
	adds r0, r4, #0
	adds r0, #0x34
	adds r4, #0x14
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_8083B88
	adds r5, r4, #0
_08085F7A:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8085F84
sub_8085F84: @ 0x08085F84
	bx lr
	.align 2, 0

	thumb_func_start sub_8085F88
sub_8085F88: @ 0x08085F88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _08085FC8 @ =gUnknown_030054E8
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	movs r1, #3
	ldrsb r1, [r7, r1]
	cmp r0, r1
	bne _08085FD0
	movs r1, #4
	ldrsb r1, [r7, r1]
	lsrs r0, r2, #4
	cmp r1, r0
	bgt _08085FD0
	ldr r0, _08085FCC @ =sub_80865E4
	b _08085FD2
	.align 2, 0
_08085FC8: .4byte gUnknown_030054E8
_08085FCC: .4byte sub_80865E4
_08085FD0:
	ldr r0, _08086124 @ =sub_808673C
_08085FD2:
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08086128 @ =sub_80867E8
	str r1, [sp]
	movs r1, #0x88
	movs r3, #0
	bl TaskCreate
	adds r2, r0, #0
	movs r0, #4
	ldrsb r0, [r7, r0]
	ldr r1, _0808612C @ =gUnknown_030054E8
	ldrb r1, [r1]
	lsrs r1, r1, #4
	cmp r0, r1
	bgt _08085FF4
	strb r1, [r7, #4]
_08085FF4:
	ldrh r4, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, _08086130 @ =gUnknown_03005434
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _08086134 @ =gUnknown_080E029A
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r3, _08086138 @ =gUnknown_03000082
	adds r6, r4, r3
	movs r5, #0
	strb r0, [r6]
	ldr r1, _0808613C @ =gUnknown_03000080
	adds r0, r4, r1
	strh r5, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x78]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x7c]
	mov r0, sb
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r1, sl
	strb r1, [r2, #9]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r7]
	ldr r0, _08086140 @ =gUnknown_0300000C
	adds r7, r4, r0
	ldr r1, _08086144 @ =gUnknown_0300002E
	adds r0, r4, r1
	movs r3, #0x10
	mov sl, r3
	mov r1, sl
	strb r1, [r0]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r3, _08086148 @ =gUnknown_0300002D
	adds r1, r4, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0808614C @ =gUnknown_03000031
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	str r1, [r7, #0x10]
	movs r0, #0x10
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0xb5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r3, _08086150 @ =gUnknown_0300002C
	adds r0, r4, r3
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_8004558
	ldr r3, _08086154 @ =gUnknown_0300003C
	adds r7, r4, r3
	ldr r1, _08086158 @ =gUnknown_0300005E
	adds r0, r4, r1
	mov r3, sl
	strb r3, [r0]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _0808615C @ =gUnknown_0300005D
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08086160 @ =gUnknown_03000061
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sb
	str r0, [r7, #0x28]
	mov r1, r8
	str r1, [r7, #0x10]
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r2, _08086164 @ =gUnknown_080E02AA
	ldrb r0, [r6]
	lsls r0, r0, #1
	ldr r3, _08086134 @ =gUnknown_080E029A
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _08086168 @ =gUnknown_0300005C
	adds r4, r4, r1
	strb r0, [r4]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086124: .4byte sub_808673C
_08086128: .4byte sub_80867E8
_0808612C: .4byte gUnknown_030054E8
_08086130: .4byte gUnknown_03005434
_08086134: .4byte gUnknown_080E029A
_08086138: .4byte gUnknown_03000082
_0808613C: .4byte gUnknown_03000080
_08086140: .4byte gUnknown_0300000C
_08086144: .4byte gUnknown_0300002E
_08086148: .4byte gUnknown_0300002D
_0808614C: .4byte gUnknown_03000031
_08086150: .4byte gUnknown_0300002C
_08086154: .4byte gUnknown_0300003C
_08086158: .4byte gUnknown_0300005E
_0808615C: .4byte gUnknown_0300005D
_08086160: .4byte gUnknown_03000061
_08086164: .4byte gUnknown_080E02AA
_08086168: .4byte gUnknown_0300005C

	thumb_func_start sub_808616C
sub_808616C: @ 0x0808616C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, _0808621C @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov r8, r1
	add r8, r4
	ldr r6, _08086220 @ =gUnknown_080E029A
	ldr r0, _08086224 @ =gUnknown_03005434
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	ldr r2, _08086228 @ =gUnknown_03000082
	adds r3, r4, r2
	movs r1, #0
	mov sb, r1
	strb r0, [r3]
	subs r2, #0x46
	adds r0, r4, r2
	ldr r5, _0808622C @ =gUnknown_080E02AA
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r5, #2
	adds r1, r1, r5
	ldrh r2, [r1]
	ldr r3, _08086230 @ =gUnknown_0300005C
	adds r1, r4, r3
	strb r2, [r1]
	bl sub_8004558
	mov r1, r8
	ldr r0, [r1, #0x1c]
	movs r1, #0x20
	orrs r0, r1
	mov r2, r8
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x4c]
	orrs r0, r1
	str r0, [r2, #0x4c]
	ldr r3, _08086234 @ =gUnknown_0300006C
	adds r4, r4, r3
	mov r0, sb
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #2]
	mov r1, sb
	strh r1, [r4, #4]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	mov r2, sl
	ldr r1, [r2]
	ldr r0, _08086238 @ =sub_808623C
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808621C: .4byte gCurTask
_08086220: .4byte gUnknown_080E029A
_08086224: .4byte gUnknown_03005434
_08086228: .4byte gUnknown_03000082
_0808622C: .4byte gUnknown_080E02AA
_08086230: .4byte gUnknown_0300005C
_08086234: .4byte gUnknown_0300006C
_08086238: .4byte sub_808623C

	thumb_func_start sub_808623C
sub_808623C: @ 0x0808623C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080862B4 @ =gCurTask
	ldr r3, [r7]
	ldrh r4, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x6c
	adds r6, r4, r0
	ldr r0, [r5, #0x78]
	ldr r2, _080862B8 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #6]
	ldr r0, [r5, #0x7c]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r6, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0808630C
	ldr r0, [r5, #0x1c]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r1
	str r0, [r5, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldr r0, _080862BC @ =gUnknown_03000080
	adds r1, r4, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080862C0 @ =sub_80865E4
	str r0, [r3, #8]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r5, [r4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	ldr r0, _080862C4 @ =gUnknown_030054E8
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	beq _080862C8
	adds r0, r4, #0
	bl sub_8086804
	b _08086358
	.align 2, 0
_080862B4: .4byte gCurTask
_080862B8: .4byte gUnknown_03005960
_080862BC: .4byte gUnknown_03000080
_080862C0: .4byte sub_80865E4
_080862C4: .4byte gUnknown_030054E8
_080862C8:
	movs r1, #4
	ldrsb r1, [r5, r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	cmp r1, r0
	ble _080862DC
	adds r0, r4, #0
	bl sub_8086858
	b _08086358
_080862DC:
	adds r0, r4, #0
	bl sub_808693C
	cmp r0, #0
	beq _080862EC
	adds r0, r4, #0
	bl sub_8086474
_080862EC:
	adds r0, r4, #0
	bl sub_80868F4
	cmp r0, #0
	beq _08086302
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r7]
	bl TaskDestroy
	b _08086358
_08086302:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80868A8
	b _08086358
_0808630C:
	ldr r0, [r5, #0x1c]
	movs r3, #0x20
	rsbs r3, r3, #0
	ands r0, r3
	str r0, [r5, #0x1c]
	ldr r2, _08086360 @ =gUnknown_030054B8
	ldrb r1, [r2]
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r3
	str r0, [r5, #0x4c]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x4c]
	orrs r0, r1
	str r0, [r5, #0x4c]
	ldr r0, _08086364 @ =gUnknown_0300000C
	adds r5, r4, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	ldr r1, _08086368 @ =gUnknown_0300003C
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
_08086358:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086360: .4byte gUnknown_030054B8
_08086364: .4byte gUnknown_0300000C
_08086368: .4byte gUnknown_0300003C

	thumb_func_start sub_808636C
sub_808636C: @ 0x0808636C
	push {r4, r5, r6, r7, lr}
	ldr r7, _080863E4 @ =gCurTask
	ldr r3, [r7]
	ldrh r4, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x6c
	adds r6, r4, r0
	ldr r0, [r5, #0x78]
	ldr r2, _080863E8 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #6]
	ldr r0, [r5, #0x7c]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08086414
	ldr r0, [r5, #0x1c]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r1
	str r0, [r5, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldr r0, _080863EC @ =sub_808673C
	str r0, [r3, #8]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r4, [r5]
	movs r1, #3
	ldrsb r1, [r4, r1]
	ldr r0, _080863F0 @ =gUnknown_030054E8
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	bne _080863F8
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsrs r1, r2, #4
	cmp r0, r1
	bgt _080863F8
	strb r1, [r4, #4]
	ldr r1, [r7]
	ldr r0, _080863F4 @ =sub_808616C
	str r0, [r1, #8]
	b _08086460
	.align 2, 0
_080863E4: .4byte gCurTask
_080863E8: .4byte gUnknown_03005960
_080863EC: .4byte sub_808673C
_080863F0: .4byte gUnknown_030054E8
_080863F4: .4byte sub_808616C
_080863F8:
	adds r0, r5, #0
	bl sub_80868F4
	cmp r0, #0
	beq _08086460
	ldrb r0, [r5, #8]
	strb r0, [r4]
	ldr r0, _08086410 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08086460
	.align 2, 0
_08086410: .4byte gCurTask
_08086414:
	ldr r0, [r5, #0x1c]
	movs r3, #0x20
	rsbs r3, r3, #0
	ands r0, r3
	str r0, [r5, #0x1c]
	ldr r2, _08086468 @ =gUnknown_030054B8
	ldrb r1, [r2]
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r3
	str r0, [r5, #0x4c]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x4c]
	orrs r0, r1
	str r0, [r5, #0x4c]
	ldr r0, _0808646C @ =gUnknown_0300000C
	adds r5, r4, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	ldr r1, _08086470 @ =gUnknown_0300003C
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_80051E8
_08086460:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086468: .4byte gUnknown_030054B8
_0808646C: .4byte gUnknown_0300000C
_08086470: .4byte gUnknown_0300003C

	thumb_func_start sub_8086474
sub_8086474: @ 0x08086474
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldrb r0, [r0]
	ldr r2, _080864F4 @ =gUnknown_030059E0
	cmp r0, #1
	bne _0808648C
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080864A6
_0808648C:
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080864F8 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #7
	movs r0, #5
	strb r0, [r1]
_080864A6:
	ldr r1, [r5]
	ldrb r0, [r1, #4]
	adds r0, #1
	movs r4, #0
	strb r0, [r1, #4]
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r5, #0x78]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x7c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r0, r5, #0
	adds r0, #0x83
	strb r4, [r0]
	bl sub_8019224
	movs r1, #5
	strb r1, [r0]
	ldrh r1, [r5, #4]
	strb r1, [r0, #1]
	ldrh r1, [r5, #6]
	strb r1, [r0, #2]
	ldrb r1, [r5, #9]
	strb r1, [r0, #3]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0, #4]
	ldr r0, _080864FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08086500 @ =sub_808665C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080864F4: .4byte gUnknown_030059E0
_080864F8: .4byte 0x0000FFFF
_080864FC: .4byte gCurTask
_08086500: .4byte sub_808665C

	thumb_func_start sub_8086504
sub_8086504: @ 0x08086504
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	beq _08086516
	cmp r0, #1
	beq _080865B8
	b _080865C4
_08086516:
	ldr r4, _08086594 @ =gUnknown_080E0294
	ldr r2, _08086598 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0808659C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080865A0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #5
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _080865A4 @ =gUnknown_030053F0
	ldrh r5, [r1]
	adds r0, r5, r0
	strh r0, [r1]
	ldr r0, _080865A8 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08086576
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08086576
	ldr r0, _080865AC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086576
	ldr r1, _080865B0 @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0808656E
	movs r0, #0xff
_0808656E:
	strb r0, [r1]
	ldr r1, _080865B4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08086576:
	ldr r0, _080865AC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808658A
	ldr r1, _080865A4 @ =gUnknown_030053F0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0808658A
	movs r0, #0xff
	strh r0, [r1]
_0808658A:
	movs r0, #0x75
	bl m4aSongNumStart
	b _080865C4
	.align 2, 0
_08086594: .4byte gUnknown_080E0294
_08086598: .4byte gUnknown_030053B8
_0808659C: .4byte 0x00196225
_080865A0: .4byte 0x3C6EF35F
_080865A4: .4byte gUnknown_030053F0
_080865A8: .4byte gUnknown_030055B4
_080865AC: .4byte gUnknown_030054CC
_080865B0: .4byte gUnknown_03005448
_080865B4: .4byte gUnknown_030054A8
_080865B8:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
_080865C4:
	adds r1, r6, #0
	adds r1, #0x83
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080865DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080865E0 @ =sub_80866FC
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080865DC: .4byte gCurTask
_080865E0: .4byte sub_80866FC

	thumb_func_start sub_80865E4
sub_80865E4: @ 0x080865E4
	push {r4, r5, r6, lr}
	ldr r6, _0808660C @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	ldr r0, _08086610 @ =gUnknown_030054E8
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	beq _08086614
	adds r0, r4, #0
	bl sub_8086804
	b _08086656
	.align 2, 0
_0808660C: .4byte gCurTask
_08086610: .4byte gUnknown_030054E8
_08086614:
	movs r1, #4
	ldrsb r1, [r5, r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	cmp r1, r0
	ble _08086628
	adds r0, r4, #0
	bl sub_8086858
	b _08086656
_08086628:
	adds r0, r4, #0
	bl sub_808693C
	cmp r0, #0
	beq _08086638
	adds r0, r4, #0
	bl sub_8086474
_08086638:
	adds r0, r4, #0
	bl sub_80868F4
	cmp r0, #0
	beq _0808664E
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r6]
	bl TaskDestroy
	b _08086656
_0808664E:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80868A8
_08086656:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_808665C
sub_808665C: @ 0x0808665C
	push {r4, lr}
	ldr r0, _08086684 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x83
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _08086688
	adds r0, r4, #0
	bl sub_8086504
	b _08086696
	.align 2, 0
_08086684: .4byte gCurTask
_08086688:
	ldr r2, _080866A4 @ =gUnknown_03000080
	adds r1, r3, r2
	ldr r2, _080866A8 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_08086696:
	adds r0, r4, #0
	movs r1, #1
	bl sub_80868A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866A4: .4byte gUnknown_03000080
_080866A8: .4byte 0xFFFFFF00

	thumb_func_start sub_80866AC
sub_80866AC: @ 0x080866AC
	push {r4, lr}
	ldr r0, _080866D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x83
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _080866D8
	adds r0, r4, #0
	bl sub_8086890
	b _080866E6
	.align 2, 0
_080866D4: .4byte gCurTask
_080866D8:
	ldr r2, _080866F4 @ =gUnknown_03000080
	adds r1, r3, r2
	ldr r2, _080866F8 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_080866E6:
	adds r0, r4, #0
	movs r1, #1
	bl sub_80868A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866F4: .4byte gUnknown_03000080
_080866F8: .4byte 0xFFFFFF00

	thumb_func_start sub_80866FC
sub_80866FC: @ 0x080866FC
	push {r4, lr}
	ldr r4, _08086724 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x83
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _0808672C
	ldr r1, [r4]
	ldr r0, _08086728 @ =sub_808673C
	str r0, [r1, #8]
	b _08086734
	.align 2, 0
_08086724: .4byte gCurTask
_08086728: .4byte sub_808673C
_0808672C:
	adds r0, r3, #0
	movs r1, #1
	bl sub_80868A8
_08086734:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808673C
sub_808673C: @ 0x0808673C
	push {r4, r5, lr}
	ldr r3, _08086770 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, [r5]
	movs r1, #3
	ldrsb r1, [r4, r1]
	ldr r0, _08086774 @ =gUnknown_030054E8
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	bne _0808677C
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsrs r1, r2, #4
	cmp r0, r1
	bgt _0808677C
	strb r1, [r4, #4]
	ldr r1, [r3]
	ldr r0, _08086778 @ =sub_808616C
	str r0, [r1, #8]
	b _08086792
	.align 2, 0
_08086770: .4byte gCurTask
_08086774: .4byte gUnknown_030054E8
_08086778: .4byte sub_808616C
_0808677C:
	adds r0, r5, #0
	bl sub_80868F4
	cmp r0, #0
	beq _08086792
	ldrb r0, [r5, #8]
	strb r0, [r4]
	ldr r0, _08086798 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08086792:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086798: .4byte gCurTask

	thumb_func_start sub_808679C
sub_808679C: @ 0x0808679C
	push {r4, lr}
	ldr r0, _080867DC @ =gCurTask
	ldr r4, [r0]
	ldrh r2, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, [r1, #0x1c]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r1, #0x1c]
	ldr r0, [r1, #0x4c]
	orrs r0, r3
	str r0, [r1, #0x4c]
	ldr r0, _080867E0 @ =gUnknown_0300006C
	adds r2, r2, r0
	movs r1, #0
	strh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r1, [r2, #6]
	strh r1, [r2, #8]
	ldr r0, _080867E4 @ =sub_808636C
	str r0, [r4, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080867DC: .4byte gCurTask
_080867E0: .4byte gUnknown_0300006C
_080867E4: .4byte sub_808636C

	thumb_func_start sub_80867E8
sub_80867E8: @ 0x080867E8
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl sub_8007CF0
	ldr r0, [r4, #0x40]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8086804
sub_8086804: @ 0x08086804
	push {r4, lr}
	ldr r0, _08086848 @ =gCurTask
	ldr r4, [r0]
	ldr r0, _0808684C @ =sub_808679C
	str r0, [r4, #8]
	ldrh r1, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2, #0x1c]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x4c]
	orrs r0, r3
	str r0, [r2, #0x4c]
	ldr r0, _08086850 @ =gUnknown_0300006C
	adds r1, r1, r0
	movs r2, #0
	strh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	strh r2, [r1, #8]
	ldr r0, _08086854 @ =sub_808636C
	str r0, [r4, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086848: .4byte gCurTask
_0808684C: .4byte sub_808679C
_08086850: .4byte gUnknown_0300006C
_08086854: .4byte sub_808636C

	thumb_func_start sub_8086858
sub_8086858: @ 0x08086858
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x78]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x7c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r4, #0x83
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08086888 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808688C @ =sub_80866AC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086888: .4byte gCurTask
_0808688C: .4byte sub_80866AC

	thumb_func_start sub_8086890
sub_8086890: @ 0x08086890
	adds r0, #0x83
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080868A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080868A4 @ =sub_80866FC
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080868A0: .4byte gCurTask
_080868A4: .4byte sub_80866FC

	thumb_func_start sub_80868A8
sub_80868A8: @ 0x080868A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x78]
	ldr r2, _080868F0 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r3, r3, r0
	strh r3, [r4, #0x22]
	ldr r0, [r4, #0x7c]
	ldr r2, [r2, #4]
	subs r0, r0, r2
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x52
	strh r3, [r0]
	adds r0, #0x2e
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	cmp r1, #0
	bne _080868E2
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_080868E2:
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080868F0: .4byte gUnknown_03005960

	thumb_func_start sub_80868F4
sub_80868F4: @ 0x080868F4
	push {lr}
	ldr r1, [r0, #0x78]
	ldr r3, _08086930 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x7c]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0808692C
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0808692C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08086934
_0808692C:
	movs r0, #1
	b _08086936
	.align 2, 0
_08086930: .4byte gUnknown_03005960
_08086934:
	movs r0, #0
_08086936:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808693C
sub_808693C: @ 0x0808693C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _0808696C @ =gUnknown_030059E0
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08086984
	adds r6, r4, #0
	adds r6, #0xc
	ldr r1, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	adds r0, r6, #0
	bl sub_800C944
	adds r5, r0, #0
	cmp r5, #0
	beq _08086970
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #1
	strb r0, [r1]
	b _08086990
	.align 2, 0
_0808696C: .4byte gUnknown_030059E0
_08086970:
	ldr r1, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	bne _08086988
_08086984:
	movs r0, #0
	b _08086990
_08086988:
	adds r0, r4, #0
	adds r0, #0x84
	strb r5, [r0]
	movs r0, #1
_08086990:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8086998
sub_8086998: @ 0x08086998
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _080869FC @ =sub_8086A88
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _08086A00 @ =sub_8086CBC
	str r1, [sp]
	movs r1, #0xe8
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0xc2
	adds r2, r1, r0
	movs r3, #0
	movs r0, #0
	strh r0, [r2]
	ldr r2, _08086A04 @ =gUnknown_030000E4
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, #0x24
	adds r0, r1, r2
	strb r3, [r0]
	movs r2, #0
	ldr r0, _08086A08 @ =gUnknown_030000C4
	adds r5, r1, r0
	movs r3, #0
	adds r0, #0x10
	adds r4, r1, r0
_080869D8:
	lsls r1, r2, #2
	adds r0, r5, r1
	str r3, [r0]
	adds r1, r4, r1
	str r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080869D8
	adds r0, r6, #0
	bl sub_8086A0C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080869FC: .4byte sub_8086A88
_08086A00: .4byte sub_8086CBC
_08086A04: .4byte gUnknown_030000E4
_08086A08: .4byte gUnknown_030000C4

	thumb_func_start sub_8086A0C
sub_8086A0C: @ 0x08086A0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	movs r5, #0
	movs r7, #0
	movs r6, #0
	ldr r0, _08086A80 @ =0x0000035A
	mov sb, r0
_08086A20:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	mov r1, r8
	adds r4, r1, r0
	movs r0, #0xa
	bl sub_8007C10
	str r0, [r4, #4]
	mov r0, sb
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08086A84 @ =0x0000FFEC
	strh r0, [r4, #0x16]
	strh r6, [r4, #0x18]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r7, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08086A20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086A80: .4byte 0x0000035A
_08086A84: .4byte 0x0000FFEC

	thumb_func_start sub_8086A88
sub_8086A88: @ 0x08086A88
	push {r4, r5, lr}
	ldr r0, _08086B2C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r2, #0
	ldr r3, _08086B30 @ =gUnknown_03005A70
_08086A9A:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r1, [r3]
	ldrh r1, [r1, #0x22]
	strh r1, [r0, #0x16]
	ldr r1, [r3]
	ldrh r1, [r1, #0x24]
	strh r1, [r0, #0x18]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08086A9A
	adds r0, r4, #0
	bl sub_8086B38
	adds r0, r4, #0
	adds r0, #0xe4
	ldrb r1, [r0]
	adds r5, r0, #0
	adds r4, #0xc2
	cmp r1, #0
	bne _08086B04
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08086ADA
	movs r0, #0
	bl sub_8086BE8
_08086ADA:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _08086AE8
	movs r0, #1
	bl sub_8086BE8
_08086AE8:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bne _08086AF6
	movs r0, #2
	bl sub_8086BE8
_08086AF6:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xb
	bne _08086B04
	movs r0, #3
	bl sub_8086BE8
_08086B04:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08086B16
	movs r0, #0
	strh r0, [r4]
_08086B16:
	ldr r0, _08086B34 @ =gUnknown_030059E0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x22
	beq _08086B26
	movs r0, #1
	strb r0, [r5]
_08086B26:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086B2C: .4byte gCurTask
_08086B30: .4byte gUnknown_03005A70
_08086B34: .4byte gUnknown_030059E0

	thumb_func_start sub_8086B38
sub_8086B38: @ 0x08086B38
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	movs r0, #1
	mov r8, r0
	adds r0, r5, #0
	adds r0, #0xe4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08086B68
	adds r0, r5, #0
	adds r0, #0xc0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086B68
	ldr r0, _08086B64 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08086BDC
	.align 2, 0
_08086B64: .4byte gCurTask
_08086B68:
	movs r6, #0
	adds r7, r5, #0
	adds r7, #0xc0
	ldr r1, _08086BC0 @ =gUnknown_03005960
	mov sb, r1
_08086B72:
	ldrb r0, [r7]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08086BCA
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r4, r5, r0
	lsls r2, r6, #2
	adds r0, r5, #0
	adds r0, #0xc4
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0xd4
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08086BC4
	movs r1, #1
	lsls r1, r6
	ldrb r0, [r7]
	bics r0, r1
	strb r0, [r7]
	b _08086BCA
	.align 2, 0
_08086BC0: .4byte gUnknown_03005960
_08086BC4:
	adds r0, r4, #0
	bl sub_80051E8
_08086BCA:
	mov r1, r8
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _08086B72
_08086BDC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8086BE8
sub_8086BE8: @ 0x08086BE8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08086C70 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	lsls r2, r4, #2
	ldr r1, _08086C74 @ =gUnknown_030000C4
	adds r0, r3, r1
	adds r5, r0, r2
	ldr r1, _08086C78 @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	str r0, [r5]
	ldr r6, _08086C7C @ =gUnknown_030000D4
	adds r0, r3, r6
	adds r6, r0, r2
	ldr r0, [r1, #0xc]
	str r0, [r6]
	cmp r4, #1
	bne _08086C24
	ldr r0, _08086C80 @ =gUnknown_030000D8
	adds r1, r3, r0
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [r1]
_08086C24:
	cmp r4, #3
	bne _08086C34
	ldr r0, _08086C84 @ =gUnknown_030000E0
	adds r1, r3, r0
	ldr r0, [r1]
	ldr r2, _08086C88 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r1]
_08086C34:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r3, r7, r0
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r2, _08086C8C @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r3, #0x16]
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r3, #0x18]
	ldr r0, _08086C90 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08086C94
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08086C9A
	.align 2, 0
_08086C70: .4byte gCurTask
_08086C74: .4byte gUnknown_030000C4
_08086C78: .4byte gUnknown_030059E0
_08086C7C: .4byte gUnknown_030000D4
_08086C80: .4byte gUnknown_030000D8
_08086C84: .4byte gUnknown_030000E0
_08086C88: .4byte 0xFFFFF800
_08086C8C: .4byte gUnknown_03005960
_08086C90: .4byte gUnknown_03005424
_08086C94:
	ldr r0, [r3, #0x10]
	ldr r1, _08086CB8 @ =0xFFFFF7FF
	ands r0, r1
_08086C9A:
	str r0, [r3, #0x10]
	adds r0, r3, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r0, #0xc0
	movs r1, #1
	lsls r1, r4
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086CB8: .4byte 0xFFFFF7FF

	thumb_func_start sub_8086CBC
sub_8086CBC: @ 0x08086CBC
	push {r4, r5, lr}
	ldrh r0, [r0, #6]
	movs r4, #0
	ldr r1, _08086CE4 @ =IWRAM_START+4
	adds r5, r0, r1
_08086CC6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08086CC6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086CE4: .4byte IWRAM_START+4

	thumb_func_start sub_8086CE8
sub_8086CE8: @ 0x08086CE8
	push {r4, lr}
	sub sp, #4
	ldr r0, _08086D50 @ =sub_8086EDC
	movs r1, #0x92
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _08086D54 @ =sub_8086FC8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	ldr r0, _08086D58 @ =gUnknown_030055B4
	ldrb r3, [r0]
	lsls r1, r3, #0x18
	asrs r1, r1, #0x19
	movs r0, #1
	ands r0, r3
	adds r1, r1, r0
	ldr r0, _08086D5C @ =gUnknown_03000120
	adds r2, r2, r0
	strb r1, [r2]
	movs r1, #0
	ldr r2, _08086D60 @ =gUnknown_030055A0
	ldr r0, [r2]
	cmp r0, #0
	beq _08086D3A
_08086D26:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _08086D3A
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _08086D26
_08086D3A:
	ldr r2, _08086D64 @ =0x00000121
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8086D68
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086D50: .4byte sub_8086EDC
_08086D54: .4byte sub_8086FC8
_08086D58: .4byte gUnknown_030055B4
_08086D5C: .4byte gUnknown_03000120
_08086D60: .4byte gUnknown_030055A0
_08086D64: .4byte 0x00000121

	thumb_func_start sub_8086D68
sub_8086D68: @ 0x08086D68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r1, _08086DDC @ =gUnknown_080E02D4
	mov r0, sp
	movs r2, #6
	bl memcpy
	movs r4, #0
	ldr r0, _08086DE0 @ =0x00000121
	add r0, sl
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08086E20
	movs r5, #0
_08086D8E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _08086DE4 @ =0x00000465
	strh r0, [r7, #0xa]
	ldr r2, _08086DE8 @ =gUnknown_03005500
	adds r2, r4, r2
	movs r0, #0
	ldrsb r0, [r2, r0]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #6
	strh r0, [r7, #0x16]
	movs r0, #0x8e
	strh r0, [r7, #0x18]
	ldr r0, _08086DEC @ =gUnknown_030054F0
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08086DF0
	movs r0, #0x80
	b _08086DF2
	.align 2, 0
_08086DDC: .4byte gUnknown_080E02D4
_08086DE0: .4byte 0x00000121
_08086DE4: .4byte 0x00000465
_08086DE8: .4byte gUnknown_03005500
_08086DEC: .4byte gUnknown_030054F0
_08086DF0:
	movs r0, #0xc0
_08086DF2:
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r4, [r0]
	str r5, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08086ECC @ =0x00000121
	add r0, sl
	ldrb r0, [r0]
	cmp r4, r0
	blo _08086D8E
_08086E20:
	mov r7, sl
	adds r7, #0xc0
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	movs r5, #0
	movs r4, #0
	ldr r0, _08086ED0 @ =0x0000036F
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0xe0
	strb r5, [r0]
	mov r1, sl
	adds r1, #0xe1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xe
	strh r0, [r7, #0x16]
	movs r0, #0x96
	mov sb, r0
	mov r1, sb
	strh r1, [r7, #0x18]
	adds r0, #0xaa
	mov r8, r0
	mov r1, r8
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r0, sl
	adds r0, #0xe2
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	strb r5, [r0]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r7, #0x30
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0xdc
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	ldr r1, _08086ED4 @ =0x00000111
	add r1, sl
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0xe2
	strh r0, [r7, #0x16]
	mov r0, sb
	strh r0, [r7, #0x18]
	mov r1, r8
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x89
	lsls r0, r0, #1
	add r0, sl
	strb r6, [r0]
	ldr r0, _08086ED8 @ =0x00000115
	add r0, sl
	strb r5, [r0]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086ECC: .4byte 0x00000121
_08086ED0: .4byte 0x0000036F
_08086ED4: .4byte 0x00000111
_08086ED8: .4byte 0x00000115

	thumb_func_start sub_8086EDC
sub_8086EDC: @ 0x08086EDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08086F50 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r3, #0
	ldr r0, _08086F54 @ =0x00000121
	mov ip, r0
	ldr r1, _08086F58 @ =gUnknown_03000121
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r3, r0
	bhs _08086F40
	ldr r7, _08086F5C @ =gUnknown_030055A0
	mov r8, r7
	ldr r6, _08086F60 @ =gUnknown_080E02B8
	ldr r0, _08086F64 @ =gUnknown_03000120
	adds r5, r2, r0
_08086F08:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r4, r1
	lsls r0, r3, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _08086F68 @ =gUnknown_03000050
	adds r0, r0, r2
	movs r7, #0
	ldrsh r2, [r0, r7]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	adds r0, #6
	strh r0, [r1, #0x16]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, ip
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r3, r0
	blo _08086F08
_08086F40:
	adds r0, r4, #0
	bl sub_8086F6C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086F50: .4byte gCurTask
_08086F54: .4byte 0x00000121
_08086F58: .4byte gUnknown_03000121
_08086F5C: .4byte gUnknown_030055A0
_08086F60: .4byte gUnknown_080E02B8
_08086F64: .4byte gUnknown_03000120
_08086F68: .4byte gUnknown_03000050

	thumb_func_start sub_8086F6C
sub_8086F6C: @ 0x08086F6C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08086F84 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	bne _08086FBE
	movs r4, #0
	b _08086F9A
	.align 2, 0
_08086F84: .4byte gUnknown_030059E0
_08086F88:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08086F9A:
	ldr r1, _08086FC4 @ =0x00000121
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r4, r0
	blo _08086F88
	movs r4, #0
_08086FA6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xc0
	adds r0, r5, r0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08086FA6
_08086FBE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086FC4: .4byte 0x00000121

	thumb_func_start sub_8086FC8
sub_8086FC8: @ 0x08086FC8
	push {r4, r5, lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	movs r4, #0
	ldr r1, _08086FDC @ =gUnknown_03000121
	adds r0, r0, r1
	b _08086FFA
	.align 2, 0
_08086FDC: .4byte gUnknown_03000121
_08086FE0:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08087024 @ =0x00000121
	adds r0, r5, r1
_08086FFA:
	ldrb r0, [r0]
	cmp r4, r0
	blo _08086FE0
	movs r4, #0
	adds r5, #0xc4
_08087004:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08087004
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087024: .4byte 0x00000121

	thumb_func_start sub_8087028
sub_8087028: @ 0x08087028
	push {r4, r5, lr}
	ldr r3, _08087078 @ =gUnknown_030059E0
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r2, _0808707C @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r5, _08087080 @ =gCurTask
	ldr r2, [r5]
	ldrh r4, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r4, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r3, [r4]
	movs r2, #0xa0
	subs r2, r2, r3
	bl sub_80871C4
	ldrb r0, [r4]
	adds r0, #4
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bls _08087070
	ldr r1, [r5]
	ldr r0, _08087084 @ =sub_8087088
	str r0, [r1, #8]
_08087070:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087078: .4byte gUnknown_030059E0
_0808707C: .4byte gUnknown_03005960
_08087080: .4byte gCurTask
_08087084: .4byte sub_8087088

	thumb_func_start sub_8087088
sub_8087088: @ 0x08087088
	push {r4, r5, lr}
	ldr r3, _080870D8 @ =gUnknown_030059E0
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r2, _080870DC @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r5, _080870E0 @ =gCurTask
	ldr r2, [r5]
	ldrh r3, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r3, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x6e
	bl sub_80871C4
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _080870D0
	movs r0, #0x32
	strb r0, [r4]
	ldr r1, [r5]
	ldr r0, _080870E4 @ =sub_80870E8
	str r0, [r1, #8]
_080870D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080870D8: .4byte gUnknown_030059E0
_080870DC: .4byte gUnknown_03005960
_080870E0: .4byte gCurTask
_080870E4: .4byte sub_80870E8

	thumb_func_start sub_80870E8
sub_80870E8: @ 0x080870E8
	push {r4, r5, r6, lr}
	ldr r6, _080871A4 @ =gUnknown_030059E0
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r2, _080871A8 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r2, _080871AC @ =gCurTask
	ldr r2, [r2]
	ldrh r5, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r5, r5, r2
	ldr r4, _080871B0 @ =gUnknown_080E02DC
	ldrb r3, [r5]
	movs r2, #7
	ands r2, r3
	lsls r2, r2, #1
	adds r3, r2, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, #1
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r3, [r5]
	movs r2, #0xa0
	subs r2, r2, r3
	bl sub_80871C4
	ldr r1, _080871B4 @ =gBldRegs
	ldrb r0, [r5]
	lsrs r0, r0, #4
	adds r0, #4
	strh r0, [r1, #4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	bls _0808719C
	ldr r0, [r6, #0x20]
	ldr r1, _080871B8 @ =0x40600000
	ands r0, r1
	cmp r0, #0
	bne _08087184
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _08087184
	adds r0, r6, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _08087184
	movs r0, #0x9a
	bl m4aSongNumStart
_08087184:
	ldr r1, _080871B4 @ =gBldRegs
	movs r0, #0
	strh r0, [r1, #4]
	ldr r2, _080871BC @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080871C0 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080871AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808719C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080871A4: .4byte gUnknown_030059E0
_080871A8: .4byte gUnknown_03005960
_080871AC: .4byte gCurTask
_080871B0: .4byte gUnknown_080E02DC
_080871B4: .4byte gBldRegs
_080871B8: .4byte 0x40600000
_080871BC: .4byte gDispCnt
_080871C0: .4byte 0x0000DFFF

	thumb_func_start sub_80871C4
sub_80871C4: @ 0x080871C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	ldr r0, _08087270 @ =gUnknown_03001884
	ldr r5, [r0]
	ldr r3, _08087274 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r3]
	ldr r3, _08087278 @ =gUnknown_03002878
	ldr r0, _0808727C @ =0x04000040
	str r0, [r3]
	ldr r4, _08087280 @ =gUnknown_03001840
	ldr r0, [r4]
	movs r3, #4
	orrs r0, r3
	str r0, [r4]
	lsrs r0, r1, #0x10
	str r0, [sp, #4]
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r1, r2
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _0808721A
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0808721A:
	movs r3, #0
	mov ip, r3
	str r1, [sp, #0xc]
	ldr r4, [sp]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r7, #0
	movs r6, #0xef
	mov sb, r6
_0808722E:
	ldr r1, [sp, #0xc]
	asrs r0, r1, #0x10
	cmp ip, r0
	bge _08087238
	b _0808733E
_08087238:
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp ip, r0
	blt _08087244
	b _0808733E
_08087244:
	ldr r4, [sp, #4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp ip, r0
	bge _080872CC
	mov r6, r8
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	ldr r4, _08087284 @ =0xFFFF0000
	adds r0, r0, r4
	lsrs r0, r0, #0x10
	ldr r6, [sp]
	lsls r4, r6, #0x10
	adds r6, r1, #0
	cmp r0, #0xee
	bhi _08087288
	strb r2, [r5]
	b _08087294
	.align 2, 0
_08087270: .4byte gUnknown_03001884
_08087274: .4byte gUnknown_03002A80
_08087278: .4byte gUnknown_03002878
_0808727C: .4byte 0x04000040
_08087280: .4byte gUnknown_03001840
_08087284: .4byte 0xFFFF0000
_08087288:
	cmp r3, #0
	bgt _08087290
	strb r7, [r5]
	b _08087294
_08087290:
	mov r0, sb
	strb r0, [r5]
_08087294:
	adds r5, #1
	asrs r0, r4, #0x10
	asrs r1, r6, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	ldr r3, _080872B0 @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _080872B4
	strb r2, [r5]
	b _080872C0
	.align 2, 0
_080872B0: .4byte 0xFFFF0000
_080872B4:
	cmp r1, #0xef
	ble _080872BE
	mov r4, sb
	strb r4, [r5]
	b _080872C0
_080872BE:
	strb r7, [r5]
_080872C0:
	adds r5, #1
	asrs r0, r6, #0x10
	cmp r0, #0xef
	bgt _08087346
	adds r0, #1
	b _08087336
_080872CC:
	mov r6, r8
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	ldr r4, _080872F0 @ =0xFFFF0000
	adds r0, r0, r4
	lsrs r0, r0, #0x10
	ldr r6, [sp]
	lsls r4, r6, #0x10
	adds r6, r1, #0
	cmp r0, #0xee
	bhi _080872F4
	strb r2, [r5]
	b _08087300
	.align 2, 0
_080872F0: .4byte 0xFFFF0000
_080872F4:
	cmp r3, #0
	bgt _080872FC
	strb r7, [r5]
	b _08087300
_080872FC:
	mov r0, sb
	strb r0, [r5]
_08087300:
	adds r5, #1
	asrs r0, r4, #0x10
	asrs r1, r6, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0808731C @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _08087320
	strb r2, [r5]
	b _0808732C
	.align 2, 0
_0808731C: .4byte 0xFFFF0000
_08087320:
	cmp r1, #0xef
	ble _0808732A
	mov r4, sb
	strb r4, [r5]
	b _0808732C
_0808732A:
	strb r7, [r5]
_0808732C:
	adds r5, #1
	asrs r0, r6, #0x10
	cmp r0, #0
	ble _08087346
	subs r0, #1
_08087336:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _08087346
_0808733E:
	strb r7, [r5]
	adds r5, #1
	strb r7, [r5]
	adds r5, #1
_08087346:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #0x9f
	bhi _08087356
	b _0808722E
_08087356:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8087368
sub_8087368: @ 0x08087368
	push {lr}
	sub sp, #4
	ldr r0, _0808739C @ =sub_8087028
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r1, _080873A0 @ =sub_80873EC
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl sub_80873A4
	movs r0, #0xdb
	bl m4aSongNumStart
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808739C: .4byte sub_8087028
_080873A0: .4byte sub_80873EC

	thumb_func_start sub_80873A4
sub_80873A4: @ 0x080873A4
	push {r4, lr}
	ldr r3, _080873DC @ =gWinRegs
	movs r0, #0x1f
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r0, #0x3f
	orrs r0, r1
	strh r0, [r3, #0xa]
	ldr r1, _080873E0 @ =gBldRegs
	ldr r0, _080873E4 @ =0x00003FBF
	strh r0, [r1]
	movs r0, #4
	strh r0, [r1, #4]
	ldr r2, _080873E8 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xf0
	strh r0, [r3]
	movs r0, #0xa0
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080873DC: .4byte gWinRegs
_080873E0: .4byte gBldRegs
_080873E4: .4byte 0x00003FBF
_080873E8: .4byte gDispCnt

	thumb_func_start sub_80873EC
sub_80873EC: @ 0x080873EC
	ldr r0, _080873FC @ =gUnknown_03001840
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080873FC: .4byte gUnknown_03001840

	thumb_func_start sub_8087400
sub_8087400: @ 0x08087400
	push {r4, lr}
	sub sp, #4
	ldr r0, _08087460 @ =sub_8087644
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _08087464 @ =sub_8087F10
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _08087468 @ =gUnknown_0300010C
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _0808746C @ =gUnknown_0300010D
	adds r1, r4, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r4, r3
	movs r3, #0
	strh r2, [r1]
	ldr r2, _08087470 @ =gUnknown_03000110
	adds r1, r4, r2
	strb r3, [r1]
	adds r2, #1
	adds r1, r4, r2
	strb r3, [r1]
	bl sub_8087478
	ldr r3, _08087474 @ =gUnknown_03000100
	adds r4, r4, r3
	adds r0, r4, #0
	bl sub_802D4CC
	movs r0, #0x40
	bl m4aSongNumStart
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087460: .4byte sub_8087644
_08087464: .4byte sub_8087F10
_08087468: .4byte gUnknown_0300010C
_0808746C: .4byte gUnknown_0300010D
_08087470: .4byte gUnknown_03000110
_08087474: .4byte gUnknown_03000100

	thumb_func_start sub_8087478
sub_8087478: @ 0x08087478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08087618 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r0, #0
	bge _08087498
	movs r5, #0
_08087498:
	movs r7, #0
	ldr r1, _0808761C @ =gDispCnt
	ldr r0, _08087620 @ =0x00001141
	strh r0, [r1]
	ldr r1, _08087624 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08087628 @ =0x00001E01
	strh r0, [r1]
	ldr r2, _0808762C @ =gUnknown_03004D80
	strb r4, [r2]
	ldr r0, _08087630 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r3, #0x20
	strb r3, [r0, #3]
	strb r4, [r2, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r3, [r0, #7]
	strb r4, [r2, #2]
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	ldr r0, _08087634 @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	strh r7, [r0, #8]
	strh r7, [r0, #0xa]
	adds r0, r6, #0
	adds r0, #0xc0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _08087638 @ =0x0600F000
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	movs r1, #0x73
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	strh r3, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r1, r6, #0
	adds r1, #0xea
	strb r4, [r1]
	strh r7, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #0x38
	bl sub_8007C10
	str r0, [r6, #4]
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	subs r0, #4
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x6e
	strh r0, [r6, #0x18]
	movs r0, #0xc0
	strh r0, [r6, #0x1a]
	strh r7, [r6, #8]
	strh r7, [r6, #0x14]
	strh r7, [r6, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	lsls r1, r5, #0x18
	ldr r0, _0808763C @ =gUnknown_080E02EC
	mov sl, r0
	asrs r1, r1, #0x18
	mov sb, r4
	movs r2, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	mov r8, r0
_0808756A:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r0, #0x30
	adds r5, r6, r0
	mov r1, r8
	adds r4, r1, r7
	lsls r4, r4, #3
	add r4, sl
	ldr r0, [r4]
	str r2, [sp]
	bl sub_8007C10
	str r0, [r5, #4]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r5, #0x16]
	movs r0, #0x24
	strh r0, [r5, #0x18]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r5, #0x1a]
	ldr r2, [sp]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	str r2, [r5, #0x10]
	adds r0, r5, #0
	str r2, [sp]
	bl sub_8004558
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [sp]
	cmp r7, #2
	bls _0808756A
	adds r1, r6, r4
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #2
	strh r0, [r1]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, #0xfa
	strh r0, [r1]
	subs r0, #0xf8
	adds r1, r6, r0
	ldr r0, _08087640 @ =0x00003FFF
	strh r0, [r1]
	movs r1, #0x85
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087618: .4byte gUnknown_03005B64
_0808761C: .4byte gDispCnt
_08087620: .4byte 0x00001141
_08087624: .4byte gBgCntRegs
_08087628: .4byte 0x00001E01
_0808762C: .4byte gUnknown_03004D80
_08087630: .4byte gUnknown_03002280
_08087634: .4byte gBgScrollRegs
_08087638: .4byte 0x0600F000
_0808763C: .4byte gUnknown_080E02EC
_08087640: .4byte 0x00003FFF

	thumb_func_start sub_8087644
sub_8087644: @ 0x08087644
	push {r4, r5, r6, r7, lr}
	ldr r0, _080876AC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _080876B0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _080876EE
	movs r3, #0
	ldr r0, _080876B4 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _080876EE
	movs r6, #1
	ldr r2, _080876B8 @ =gUnknown_030054D4
_0808766E:
	ldr r1, _080876BC @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080876D8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080876DC
	movs r0, #0
	ldr r1, _080876C0 @ =0x0000FFFF
	bl sub_80029D0
	ldr r1, _080876C4 @ =gUnknown_03002AE4
	ldr r0, _080876C8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080876CC @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080876D0 @ =gUnknown_03004D5C
	ldr r0, _080876D4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087826
	.align 2, 0
_080876AC: .4byte gCurTask
_080876B0: .4byte gUnknown_030054CC
_080876B4: .4byte gUnknown_030055B8
_080876B8: .4byte gUnknown_030054D4
_080876BC: .4byte gMultiSioStatusFlags
_080876C0: .4byte 0x0000FFFF
_080876C4: .4byte gUnknown_03002AE4
_080876C8: .4byte gUnknown_0300287C
_080876CC: .4byte gUnknown_03005390
_080876D0: .4byte gUnknown_03004D5C
_080876D4: .4byte gUnknown_03002A84
_080876D8:
	movs r0, #0
	strb r0, [r2]
_080876DC:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _080876EE
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	bne _0808766E
_080876EE:
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087728
	ldr r0, _08087718 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087738
	ldr r1, _0808771C @ =gMultiSioSend
	movs r0, #0
	strb r0, [r1, #3]
	ldr r2, _08087720 @ =0x0000010D
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldr r0, _08087724 @ =0x000040A3
	b _08087736
	.align 2, 0
_08087718: .4byte gMultiSioStatusFlags
_0808771C: .4byte gMultiSioSend
_08087720: .4byte 0x0000010D
_08087724: .4byte 0x000040A3
_08087728:
	ldr r1, _080877C0 @ =gMultiSioSend
	strb r0, [r1, #3]
	ldr r2, _080877C4 @ =0x0000010D
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldr r0, _080877C8 @ =0x000040A0
_08087736:
	strh r0, [r1]
_08087738:
	movs r0, #0x87
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	bne _08087810
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08087820
	movs r0, #0x86
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080877FC
	ldr r0, _080877CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r1, _080877C4 @ =0x0000010D
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080877E4
	ldr r0, _080877D0 @ =gUnknown_03001954
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	bl sub_808D41C
	movs r1, #0
	ldr r3, _080877D4 @ =gUnknown_030055A0
	movs r2, #0
_0808778E:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0808778E
	movs r1, #0
	ldr r5, _080877D8 @ =gUnknown_03005500
	movs r2, #0
	ldr r4, _080877DC @ =gUnknown_030054B4
	ldr r3, _080877E0 @ =gUnknown_030054D4
_080877A8:
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080877A8
	b _08087826
	.align 2, 0
_080877C0: .4byte gMultiSioSend
_080877C4: .4byte 0x0000010D
_080877C8: .4byte 0x000040A0
_080877CC: .4byte gCurTask
_080877D0: .4byte gUnknown_03001954
_080877D4: .4byte gUnknown_030055A0
_080877D8: .4byte gUnknown_03005500
_080877DC: .4byte gUnknown_030054B4
_080877E0: .4byte gUnknown_030054D4
_080877E4:
	ldr r0, _080877F8 @ =gUnknown_03005594
	ldrb r0, [r0]
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_803143C
	b _08087826
	.align 2, 0
_080877F8: .4byte gUnknown_03005594
_080877FC:
	ldr r0, _08087808 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808780C @ =sub_808782C
	str r0, [r1, #8]
	strb r3, [r2]
	b _08087820
	.align 2, 0
_08087808: .4byte gCurTask
_0808780C: .4byte sub_808782C
_08087810:
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x78
	bls _08087820
	movs r0, #0x78
	strh r0, [r1]
_08087820:
	adds r0, r5, #0
	bl sub_8087E10
_08087826:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808782C
sub_808782C: @ 0x0808782C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08087898 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r7, r6, #0
	ldr r0, _0808789C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _080878DC
	movs r3, #0
	ldr r0, _080878A0 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _080878DC
	movs r5, #1
	ldr r2, _080878A4 @ =gUnknown_030054D4
_0808785A:
	ldr r1, _080878A8 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080878C4
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080878C8
	movs r0, #0
	ldr r1, _080878AC @ =0x0000FFFF
	bl sub_80029D0
	ldr r1, _080878B0 @ =gUnknown_03002AE4
	ldr r0, _080878B4 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080878B8 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080878BC @ =gUnknown_03004D5C
	ldr r0, _080878C0 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087AD0
	.align 2, 0
_08087898: .4byte gCurTask
_0808789C: .4byte gUnknown_030054CC
_080878A0: .4byte gUnknown_030055B8
_080878A4: .4byte gUnknown_030054D4
_080878A8: .4byte gMultiSioStatusFlags
_080878AC: .4byte 0x0000FFFF
_080878B0: .4byte gUnknown_03002AE4
_080878B4: .4byte gUnknown_0300287C
_080878B8: .4byte gUnknown_03005390
_080878BC: .4byte gUnknown_03004D5C
_080878C0: .4byte gUnknown_03002A84
_080878C4:
	movs r0, #0
	strb r0, [r2]
_080878C8:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _080878DC
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0808785A
_080878DC:
	ldr r4, _0808794C @ =gMultiSioRecv
	adds r0, r4, #0
	bl sub_8087F8C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080878EC
	b _08087AD0
_080878EC:
	ldr r1, _08087950 @ =gMultiSioStatusFlags
	ldr r2, [r1]
	movs r0, #0x80
	ands r2, r0
	adds r3, r1, #0
	cmp r2, #0
	bne _08087976
	ldr r1, _08087954 @ =0xFFFFBF60
	adds r0, r1, #0
	ldrh r1, [r4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08087976
	ldrb r0, [r4, #2]
	ldr r1, _08087958 @ =0x0000010D
	adds r5, r6, r1
	strb r0, [r5]
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _08087976
	adds r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	adds r1, #2
	adds r0, r6, r1
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x6c
	str r3, [sp]
	bl m4aSongNumStart
	ldrb r0, [r5]
	ldr r3, [sp]
	cmp r0, #0
	beq _0808795C
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #5
	beq _08087976
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #4
	b _0808796E
	.align 2, 0
_0808794C: .4byte gMultiSioRecv
_08087950: .4byte gMultiSioStatusFlags
_08087954: .4byte 0xFFFFBF60
_08087958: .4byte 0x0000010D
_0808795C:
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #3
	beq _08087976
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #6
_0808796E:
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08087976:
	ldr r4, _080879A0 @ =gMultiSioSend
	movs r0, #0
	strb r0, [r4, #3]
	movs r5, #0
	ldr r0, _080879A4 @ =0x000040A0
	strh r0, [r4]
	ldr r0, [r3]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087A3E
	ldr r0, _080879A8 @ =gPressedKeys
	ldrh r1, [r0]
	movs r2, #9
	ands r2, r1
	cmp r2, #0
	beq _080879B0
	ldr r0, _080879AC @ =0x000040A1
	strh r0, [r4]
	b _08087A3E
	.align 2, 0
_080879A0: .4byte gMultiSioSend
_080879A4: .4byte 0x000040A0
_080879A8: .4byte gPressedKeys
_080879AC: .4byte 0x000040A1
_080879B0:
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080879FA
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #7
	strb r1, [r0]
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	subs r1, #1
	adds r0, r6, r1
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #3
	beq _080879EE
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #6
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_080879EE:
	movs r0, #1
	strb r0, [r4, #3]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08087A3E
_080879FA:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08087A3E
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #7
	strb r1, [r0]
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r3, [r0]
	subs r1, #1
	adds r0, r6, r1
	movs r2, #1
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #5
	beq _08087A36
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #4
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08087A36:
	strb r2, [r4, #3]
	movs r0, #0x6c
	bl m4aSongNumStart
_08087A3E:
	ldr r1, _08087A8C @ =0x0000010D
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r4, #2]
	ldr r4, _08087A90 @ =gMultiSioRecv
	adds r0, r4, #0
	bl sub_8087F8C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08087AD0
	ldrh r1, [r4]
	ldr r0, _08087A94 @ =0x000040A1
	cmp r1, r0
	bne _08087AAC
	ldrb r0, [r4, #2]
	cmp r0, #1
	bls _08087A68
	movs r0, #1
	strb r0, [r4, #2]
_08087A68:
	movs r0, #0x6a
	bl m4aSongNumStart
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r5, [r0]
	ldr r0, _08087A98 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087AA4
	ldr r0, _08087A9C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087AA0 @ =sub_8087AE0
	b _08087AAA
	.align 2, 0
_08087A8C: .4byte 0x0000010D
_08087A90: .4byte gMultiSioRecv
_08087A94: .4byte 0x000040A1
_08087A98: .4byte gMultiSioStatusFlags
_08087A9C: .4byte gCurTask
_08087AA0: .4byte sub_8087AE0
_08087AA4:
	ldr r0, _08087AD8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087ADC @ =sub_8087C98
_08087AAA:
	str r0, [r1, #8]
_08087AAC:
	movs r0, #0x87
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x12
	cmp r0, r1
	bne _08087ACA
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_08087ACA:
	adds r0, r6, #0
	bl sub_8087E10
_08087AD0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AD8: .4byte gCurTask
_08087ADC: .4byte sub_8087C98

	thumb_func_start sub_8087AE0
sub_8087AE0: @ 0x08087AE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08087B50 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _08087B54 @ =gUnknown_030054CC
	ldrb r0, [r0]
	ldr r1, _08087B58 @ =gUnknown_030055B8
	mov ip, r1
	cmp r0, #2
	bls _08087B94
	movs r3, #0
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08087B94
	movs r5, #1
	ldr r2, _08087B5C @ =gUnknown_030054D4
_08087B10:
	ldr r1, _08087B60 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _08087B7C
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08087B80
	movs r0, #0
	ldr r1, _08087B64 @ =0x0000FFFF
	bl sub_80029D0
	ldr r1, _08087B68 @ =gUnknown_03002AE4
	ldr r0, _08087B6C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08087B70 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08087B74 @ =gUnknown_03004D5C
	ldr r0, _08087B78 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087C7A
	.align 2, 0
_08087B50: .4byte gCurTask
_08087B54: .4byte gUnknown_030054CC
_08087B58: .4byte gUnknown_030055B8
_08087B5C: .4byte gUnknown_030054D4
_08087B60: .4byte gMultiSioStatusFlags
_08087B64: .4byte 0x0000FFFF
_08087B68: .4byte gUnknown_03002AE4
_08087B6C: .4byte gUnknown_0300287C
_08087B70: .4byte gUnknown_03005390
_08087B74: .4byte gUnknown_03004D5C
_08087B78: .4byte gUnknown_03002A84
_08087B7C:
	movs r0, #0
	strb r0, [r2]
_08087B80:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08087B94
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08087B10
_08087B94:
	movs r5, #1
	movs r2, #1
	ldr r0, _08087C18 @ =0x000040A2
	mov r8, r0
	ldr r1, _08087C1C @ =0x00000111
	adds r6, r7, r1
_08087BA0:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r5
	ands r0, r2
	cmp r0, #0
	beq _08087BDC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08087C20 @ =gMultiSioRecv
	adds r4, r0, r1
	adds r0, r4, #0
	str r2, [sp]
	bl sub_8087F8C
	lsls r0, r0, #0x18
	ldr r2, [sp]
	cmp r0, #0
	bne _08087C7A
	ldrh r0, [r4]
	ldr r1, _08087C24 @ =gUnknown_030055B8
	mov ip, r1
	cmp r0, r8
	bne _08087BDC
	subs r0, r5, #1
	adds r1, r2, #0
	lsls r1, r0
	ldrb r0, [r6]
	orrs r1, r0
	strb r1, [r6]
_08087BDC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08087BA0
	ldr r2, _08087C1C @ =0x00000111
	adds r1, r7, r2
	mov r2, ip
	ldrb r0, [r2]
	ldrb r1, [r1]
	lsrs r0, r0, #1
	cmp r1, r0
	bne _08087C42
	ldr r4, _08087C28 @ =gMultiSioSend
	movs r0, #0
	strb r0, [r4, #3]
	ldr r0, _08087C2C @ =0x0000010D
	adds r1, r7, r0
	ldrb r0, [r1]
	strb r0, [r4, #2]
	ldr r0, _08087C30 @ =0x000040A3
	strh r0, [r4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08087C34
	adds r0, r7, #0
	bl sub_8087DA0
	b _08087C3A
	.align 2, 0
_08087C18: .4byte 0x000040A2
_08087C1C: .4byte 0x00000111
_08087C20: .4byte gMultiSioRecv
_08087C24: .4byte gUnknown_030055B8
_08087C28: .4byte gMultiSioSend
_08087C2C: .4byte 0x0000010D
_08087C30: .4byte 0x000040A3
_08087C34:
	adds r0, r7, #0
	bl sub_8087F48
_08087C3A:
	adds r0, r7, #0
	bl sub_8087E10
	b _08087C7A
_08087C42:
	ldr r4, _08087C88 @ =gMultiSioSend
	ldr r1, _08087C8C @ =0x0000010D
	adds r0, r7, r1
	ldrb r0, [r0]
	movs r1, #0
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	ldr r0, _08087C90 @ =0x000040A1
	strh r0, [r4]
	adds r0, r7, #0
	bl sub_8087E10
	movs r2, #0x87
	lsls r2, r2, #1
	adds r1, r7, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _08087C7A
	ldr r0, _08087C94 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_805B9A4
_08087C7A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087C88: .4byte gMultiSioSend
_08087C8C: .4byte 0x0000010D
_08087C90: .4byte 0x000040A1
_08087C94: .4byte gCurTask

	thumb_func_start sub_8087C98
sub_8087C98: @ 0x08087C98
	push {r4, r5, r6, r7, lr}
	ldr r0, _08087D00 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _08087D04 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08087D42
	movs r3, #0
	ldr r0, _08087D08 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _08087D42
	movs r5, #1
	ldr r2, _08087D0C @ =gUnknown_030054D4
_08087CC2:
	ldr r1, _08087D10 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _08087D2C
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08087D30
	movs r0, #0
	ldr r1, _08087D14 @ =0x0000FFFF
	bl sub_80029D0
	ldr r1, _08087D18 @ =gUnknown_03002AE4
	ldr r0, _08087D1C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08087D20 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08087D24 @ =gUnknown_03004D5C
	ldr r0, _08087D28 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087D90
	.align 2, 0
_08087D00: .4byte gCurTask
_08087D04: .4byte gUnknown_030054CC
_08087D08: .4byte gUnknown_030055B8
_08087D0C: .4byte gUnknown_030054D4
_08087D10: .4byte gMultiSioStatusFlags
_08087D14: .4byte 0x0000FFFF
_08087D18: .4byte gUnknown_03002AE4
_08087D1C: .4byte gUnknown_0300287C
_08087D20: .4byte gUnknown_03005390
_08087D24: .4byte gUnknown_03004D5C
_08087D28: .4byte gUnknown_03002A84
_08087D2C:
	movs r0, #0
	strb r0, [r2]
_08087D30:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08087D42
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08087CC2
_08087D42:
	ldr r4, _08087D6C @ =gMultiSioRecv
	adds r0, r4, #0
	bl sub_8087F8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08087D90
	ldrh r1, [r4]
	ldr r0, _08087D70 @ =0x000040A3
	cmp r1, r0
	bne _08087D7E
	ldr r1, _08087D74 @ =0x0000010D
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087D78
	adds r0, r6, #0
	bl sub_8087DA0
	b _08087D7E
	.align 2, 0
_08087D6C: .4byte gMultiSioRecv
_08087D70: .4byte 0x000040A3
_08087D74: .4byte 0x0000010D
_08087D78:
	adds r0, r6, #0
	bl sub_8087F48
_08087D7E:
	ldr r4, _08087D98 @ =gMultiSioSend
	movs r0, #0
	strb r0, [r4, #3]
	strb r0, [r4, #2]
	ldr r0, _08087D9C @ =0x000040A2
	strh r0, [r4]
	adds r0, r6, #0
	bl sub_8087E10
_08087D90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D98: .4byte gMultiSioSend
_08087D9C: .4byte 0x000040A2

	thumb_func_start sub_8087DA0
sub_8087DA0: @ 0x08087DA0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r2, r5, r0
	movs r0, #1
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #1
	adds r0, r5, r2
	strh r1, [r0]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r5, r0
	subs r0, #6
	strh r0, [r1]
	adds r2, #4
	adds r1, r5, r2
	movs r0, #0x78
	strh r0, [r1]
	movs r0, #0x40
	bl m4aSongNumStop
	movs r0, #0xce
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08087E04 @ =0x0000044F
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08087E08 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087E0C @ =sub_8087644
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087E04: .4byte 0x0000044F
_08087E08: .4byte gCurTask
_08087E0C: .4byte sub_8087644

	thumb_func_start sub_8087E10
sub_8087E10: @ 0x08087E10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08087E58
	ldr r1, _08087E38 @ =0x0000010D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087E40
	ldrh r1, [r4, #0xa]
	ldr r0, _08087E3C @ =0x0000044F
	cmp r1, r0
	bne _08087E40
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #1
	b _08087E56
	.align 2, 0
_08087E38: .4byte 0x0000010D
_08087E3C: .4byte 0x0000044F
_08087E40:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #6
	bne _08087E4E
	movs r0, #3
	strb r0, [r1]
_08087E4E:
	ldrb r0, [r1]
	cmp r0, #4
	bne _08087E58
	movs r0, #5
_08087E56:
	strb r0, [r1]
_08087E58:
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, r4, #0
	adds r5, #0x30
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, #0x30
	ldr r2, _08087E84 @ =0x0000010D
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087E88
	movs r0, #0x2c
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0x85
	movs r0, #1
	strb r0, [r1]
	b _08087EA6
	.align 2, 0
_08087E84: .4byte 0x0000010D
_08087E88:
	ldr r1, _08087EDC @ =gUnknown_080E037C
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x2c
	movs r1, #0
	strh r0, [r5, #0x16]
	adds r0, r4, #0
	adds r0, #0x85
	strb r1, [r0]
_08087EA6:
	movs r0, #0x6e
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, r4, #0
	adds r5, #0x90
	ldr r1, _08087EE0 @ =0x0000010D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087EE4
	ldr r1, _08087EDC @ =gUnknown_080E037C
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xc0
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0xb5
	movs r0, #0xf
	b _08087EEE
	.align 2, 0
_08087EDC: .4byte gUnknown_080E037C
_08087EE0: .4byte 0x0000010D
_08087EE4:
	movs r0, #0xc0
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0xb5
	movs r0, #0
_08087EEE:
	strb r0, [r1]
	movs r0, #0x6e
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08087F0A
	subs r0, #1
	strb r0, [r1]
_08087F0A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8087F10
sub_8087F10: @ 0x08087F10
	push {r4, r5, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl sub_8007CF0
	movs r5, #0
	ldr r0, _08087F44 @ =gUnknown_03000034
	adds r4, r4, r0
_08087F26:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08087F26
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087F44: .4byte gUnknown_03000034

	thumb_func_start sub_8087F48
sub_8087F48: @ 0x08087F48
	adds r2, r0, #0
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r2, r1
	movs r1, #0
	strh r1, [r0]
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r3, r2, r0
	movs r0, #1
	strh r0, [r3]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r0, #0xfa
	strh r0, [r3]
	movs r3, #0x85
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _08087F84 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087F88 @ =sub_8087644
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08087F84: .4byte gCurTask
_08087F88: .4byte sub_8087644

	thumb_func_start sub_8087F8C
sub_8087F8C: @ 0x08087F8C
	push {lr}
	ldrh r1, [r0]
	ldr r2, _08087FB0 @ =0xFFFFBF60
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _08087FB8
	cmp r1, #0
	beq _08087FB8
	ldr r0, _08087FB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_805B9A4
	movs r0, #1
	b _08087FBA
	.align 2, 0
_08087FB0: .4byte 0xFFFFBF60
_08087FB4: .4byte gCurTask
_08087FB8:
	movs r0, #0
_08087FBA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8087FC0
sub_8087FC0: @ 0x08087FC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08088260 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r0, #0
	bge _08087FDE
	movs r4, #0
_08087FDE:
	ldr r1, _08088264 @ =gDispCnt
	ldr r0, _08088268 @ =0x00001341
	strh r0, [r1]
	movs r5, #0
	str r5, [sp, #4]
	ldr r0, _0808826C @ =0x040000D4
	add r1, sp, #4
	str r1, [r0]
	ldr r1, _08088270 @ =gMultiSioSend
	str r1, [r0, #4]
	ldr r1, _08088274 @ =0x85000005
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [sp, #4]
	add r2, sp, #4
	str r2, [r0]
	ldr r1, _08088278 @ =gMultiSioRecv
	str r1, [r0, #4]
	ldr r1, _0808827C @ =0x85000014
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _08088280 @ =gBgCntRegs
	ldr r0, _08088284 @ =0x0000560C
	strh r0, [r1, #2]
	ldr r0, _08088288 @ =0x00001401
	strh r0, [r1]
	ldr r0, _0808828C @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	ldr r0, _08088290 @ =sub_8088800
	movs r1, #0xa8
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r3, _08088294 @ =sub_8088900
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov sb, r0
	add sb, r6
	ldr r1, _08088298 @ =gUnknown_0300014C
	adds r0, r6, r1
	movs r2, #0
	strb r2, [r0]
	adds r1, #1
	adds r0, r6, r1
	strb r2, [r0]
	ldr r2, _0808829C @ =gUnknown_0300014E
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	subs r2, #0xe
	adds r0, r6, r2
	movs r1, #1
	strh r1, [r0]
	strh r5, [r0, #4]
	movs r1, #2
	strh r1, [r0, #2]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #6]
	ldr r1, _080882A0 @ =0x00003FFF
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	bl sub_802D4CC
	ldr r0, _080882A4 @ =gUnknown_03000080
	adds r7, r6, r0
	movs r0, #0x6c
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _080882A8 @ =0x00000421
	strh r0, [r7, #0xa]
	ldr r1, _080882AC @ =gUnknown_030000A0
	adds r0, r6, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080882B0 @ =gUnknown_030000A1
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r2, _080882B4 @ =gUnknown_030000A2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	mov sl, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080882B8 @ =gUnknown_030000B0
	adds r7, r6, r1
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r4, r0, #3
	ldr r1, _080882BC @ =gUnknown_080E0384
	adds r4, r4, r1
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _080882C0 @ =gUnknown_030000D0
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080882C4 @ =gUnknown_030000D1
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sl
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080882C8 @ =gUnknown_030000E0
	adds r7, r6, r1
	mov r4, r8
	adds r4, #1
	lsls r4, r4, #3
	ldr r2, _080882BC @ =gUnknown_080E0384
	adds r4, r4, r2
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _080882CC @ =gUnknown_03000100
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080882D0 @ =gUnknown_03000101
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sl
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080882D4 @ =gUnknown_03000110
	adds r7, r6, r1
	movs r2, #2
	add r8, r2
	mov r0, r8
	lsls r0, r0, #3
	mov r8, r0
	ldr r1, _080882BC @ =gUnknown_080E0384
	add r8, r1
	mov r2, r8
	ldr r0, [r2]
	bl sub_8007C10
	str r0, [r7, #4]
	mov r1, r8
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080882D8 @ =gUnknown_03000130
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080882DC @ =gUnknown_03000131
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0x67
	strh r0, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r5, [r7, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, sb
	str r0, [r1, #4]
	strh r5, [r1, #0xa]
	ldr r0, _080882E0 @ =0x0600A000
	str r0, [r1, #0xc]
	strh r5, [r1, #0x18]
	strh r5, [r1, #0x1a]
	movs r0, #0x6e
	strh r0, [r1, #0x1c]
	strh r5, [r1, #0x1e]
	strh r5, [r1, #0x20]
	strh r5, [r1, #0x22]
	strh r5, [r1, #0x24]
	movs r4, #0x20
	strh r4, [r1, #0x26]
	strh r4, [r1, #0x28]
	ldr r2, _080882E4 @ =gUnknown_0300002A
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	mov r2, sb
	strh r5, [r2, #0x2e]
	mov r0, sb
	bl sub_8002A3C
	ldr r1, _080882E8 @ =gUnknown_03000040
	adds r0, r6, r1
	ldr r1, _080882EC @ =0x0600C000
	str r1, [r0, #4]
	strh r5, [r0, #0xa]
	ldr r1, _080882F0 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r5, [r0, #0x18]
	strh r5, [r0, #0x1a]
	movs r1, #0x70
	strh r1, [r0, #0x1c]
	strh r5, [r0, #0x1e]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	strh r5, [r0, #0x24]
	strh r4, [r0, #0x26]
	strh r4, [r0, #0x28]
	ldr r2, _080882F4 @ =gUnknown_0300006A
	adds r6, r6, r2
	movs r1, #0
	strb r1, [r6]
	movs r2, #1
	strh r2, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #7
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088260: .4byte gUnknown_03005B64
_08088264: .4byte gDispCnt
_08088268: .4byte 0x00001341
_0808826C: .4byte 0x040000D4
_08088270: .4byte gMultiSioSend
_08088274: .4byte 0x85000005
_08088278: .4byte gMultiSioRecv
_0808827C: .4byte 0x85000014
_08088280: .4byte gBgCntRegs
_08088284: .4byte 0x0000560C
_08088288: .4byte 0x00001401
_0808828C: .4byte gBgScrollRegs
_08088290: .4byte sub_8088800
_08088294: .4byte sub_8088900
_08088298: .4byte gUnknown_0300014C
_0808829C: .4byte gUnknown_0300014E
_080882A0: .4byte 0x00003FFF
_080882A4: .4byte gUnknown_03000080
_080882A8: .4byte 0x00000421
_080882AC: .4byte gUnknown_030000A0
_080882B0: .4byte gUnknown_030000A1
_080882B4: .4byte gUnknown_030000A2
_080882B8: .4byte gUnknown_030000B0
_080882BC: .4byte gUnknown_080E0384
_080882C0: .4byte gUnknown_030000D0
_080882C4: .4byte gUnknown_030000D1
_080882C8: .4byte gUnknown_030000E0
_080882CC: .4byte gUnknown_03000100
_080882D0: .4byte gUnknown_03000101
_080882D4: .4byte gUnknown_03000110
_080882D8: .4byte gUnknown_03000130
_080882DC: .4byte gUnknown_03000131
_080882E0: .4byte 0x0600A000
_080882E4: .4byte gUnknown_0300002A
_080882E8: .4byte gUnknown_03000040
_080882EC: .4byte 0x0600C000
_080882F0: .4byte 0x0600B000
_080882F4: .4byte gUnknown_0300006A

	thumb_func_start sub_80882F8
sub_80882F8: @ 0x080882F8
	push {r4, r5, r6, lr}
	ldr r5, _08088374 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _08088378 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0808837C @ =gUnknown_03002878
	ldr r0, _08088380 @ =0x04000042
	str r0, [r1]
	ldr r1, _08088384 @ =gWinRegs
	movs r6, #0
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _08088388 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	ldr r1, _0808838C @ =gUnknown_0300014C
	adds r4, r4, r1
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #0x12
	movs r2, #0xaf
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	bl sub_802E044
	ldr r0, _08088390 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808835A
	strb r6, [r4]
	ldr r1, [r5]
	ldr r0, _08088394 @ =sub_8088398
	str r0, [r1, #8]
_0808835A:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808836E
	strb r6, [r4]
	ldr r1, [r5]
	ldr r0, _08088394 @ =sub_8088398
	str r0, [r1, #8]
_0808836E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088374: .4byte gCurTask
_08088378: .4byte gUnknown_03002A80
_0808837C: .4byte gUnknown_03002878
_08088380: .4byte 0x04000042
_08088384: .4byte gWinRegs
_08088388: .4byte gUnknown_03001840
_0808838C: .4byte gUnknown_0300014C
_08088390: .4byte gPressedKeys
_08088394: .4byte sub_8088398

	thumb_func_start sub_8088398
sub_8088398: @ 0x08088398
	push {r4, r5, r6, lr}
	ldr r2, _08088420 @ =gCurTask
	ldr r0, [r2]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _08088424 @ =gUnknown_0300014C
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bne _080883C6
	ldr r0, _08088428 @ =gUnknown_0300014E
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r2]
	ldr r0, _0808842C @ =sub_80884C0
	str r0, [r1, #8]
_080883C6:
	ldr r0, _08088430 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080883D6
	movs r0, #0x1f
	strb r0, [r4]
_080883D6:
	ldr r1, _08088434 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08088438 @ =gUnknown_03002878
	ldr r0, _0808843C @ =0x04000042
	str r0, [r1]
	ldr r1, _08088440 @ =gWinRegs
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _08088444 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	ldr r1, _08088448 @ =gUnknown_03000080
	adds r2, r5, r1
	ldrb r0, [r4]
	cmp r0, #9
	bhi _0808844C
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0x32
	b _0808844E
	.align 2, 0
_08088420: .4byte gCurTask
_08088424: .4byte gUnknown_0300014C
_08088428: .4byte gUnknown_0300014E
_0808842C: .4byte sub_80884C0
_08088430: .4byte gPressedKeys
_08088434: .4byte gUnknown_03002A80
_08088438: .4byte gUnknown_03002878
_0808843C: .4byte 0x04000042
_08088440: .4byte gWinRegs
_08088444: .4byte gUnknown_03001840
_08088448: .4byte gUnknown_03000080
_0808844C:
	movs r0, #0x32
_0808844E:
	strh r0, [r2, #0x16]
	movs r0, #0xa
	strh r0, [r2, #0x18]
	adds r2, r6, #0
	adds r2, #0xb0
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0808846C
	ldr r0, _08088468 @ =0x0000FFB0
	b _0808847A
	.align 2, 0
_08088468: .4byte 0x0000FFB0
_0808846C:
	cmp r0, #0x13
	bhi _08088478
	ldrb r0, [r1]
	lsls r0, r0, #4
	subs r0, #0xfa
	b _0808847A
_08088478:
	movs r0, #0x46
_0808847A:
	strh r0, [r2, #0x16]
	movs r0, #0x3c
	strh r0, [r2, #0x18]
	adds r2, r6, #0
	adds r2, #0xe0
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0x13
	bhi _08088498
	ldr r0, _08088494 @ =0x0000FFA6
	b _080884AE
	.align 2, 0
_08088494: .4byte 0x0000FFA6
_08088498:
	cmp r0, #0x1d
	bhi _080884AC
	ldrb r0, [r1]
	lsls r0, r0, #4
	ldr r1, _080884A8 @ =0xFFFFFE70
	adds r0, r0, r1
	b _080884AE
	.align 2, 0
_080884A8: .4byte 0xFFFFFE70
_080884AC:
	movs r0, #0x50
_080884AE:
	strh r0, [r2, #0x16]
	movs r0, #0x4c
	strh r0, [r2, #0x18]
	adds r0, r6, #0
	bl sub_80888BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80884C0
sub_80884C0: @ 0x080884C0
	push {r4, r5, r6, lr}
	ldr r6, _080884F8 @ =gCurTask
	ldr r0, [r6]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	ldr r0, _080884FC @ =gPressedKeys
	ldrh r3, [r0]
	movs r4, #1
	adds r1, r4, #0
	ands r1, r3
	cmp r1, #0
	beq _0808853C
	ldr r1, _08088500 @ =gUnknown_0300014D
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088508
	ldr r0, _08088504 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	bne _08088508
	movs r0, #0x69
	bl m4aSongNumStart
	b _08088566
	.align 2, 0
_080884F8: .4byte gCurTask
_080884FC: .4byte gPressedKeys
_08088500: .4byte gUnknown_0300014D
_08088504: .4byte gUnknown_03005B64
_08088508:
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r2, r5, r0
	movs r1, #0
	movs r0, #1
	strh r0, [r2]
	strh r1, [r2, #4]
	strh r0, [r2, #2]
	adds r0, #0xff
	strh r0, [r2, #6]
	ldr r0, _08088530 @ =0x00003FFF
	strh r0, [r2, #8]
	strh r1, [r2, #0xa]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _08088534 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08088538 @ =sub_80886C8
	b _08088564
	.align 2, 0
_08088530: .4byte 0x00003FFF
_08088534: .4byte gCurTask
_08088538: .4byte sub_80886C8
_0808853C:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08088566
	ldr r0, _08088604 @ =gUnknown_03000140
	adds r2, r2, r0
	strh r4, [r2]
	strh r1, [r2, #4]
	strh r4, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	ldr r0, _08088608 @ =0x00003FFF
	strh r0, [r2, #8]
	strh r1, [r2, #0xa]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, [r6]
	ldr r0, _0808860C @ =sub_8088768
_08088564:
	str r0, [r1, #8]
_08088566:
	ldr r1, _08088610 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08088614 @ =gUnknown_03002878
	ldr r0, _08088618 @ =0x04000042
	str r0, [r1]
	ldr r1, _0808861C @ =gWinRegs
	movs r4, #0
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _08088620 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	ldr r0, _08088624 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080885BA
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r1, _08088628 @ =0x0000014D
	adds r2, r5, r1
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	strb r0, [r2]
_080885BA:
	ldr r2, _08088628 @ =0x0000014D
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088660
	ldr r4, _0808862C @ =gUnknown_03005B64
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _080885D6
	movs r1, #0
_080885D6:
	adds r2, r5, #0
	adds r2, #0xd5
	movs r0, #1
	strb r0, [r2]
	ldr r0, _08088630 @ =0x00000105
	adds r2, r5, r0
	movs r0, #0xff
	strb r0, [r2]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r3, r5, r2
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _08088638
	ldr r2, _08088634 @ =gUnknown_080E0384
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #3
	b _08088644
	.align 2, 0
_08088604: .4byte gUnknown_03000140
_08088608: .4byte 0x00003FFF
_0808860C: .4byte sub_8088768
_08088610: .4byte gUnknown_03002A80
_08088614: .4byte gUnknown_03002878
_08088618: .4byte 0x04000042
_0808861C: .4byte gWinRegs
_08088620: .4byte gUnknown_03001840
_08088624: .4byte gPressedKeys
_08088628: .4byte 0x0000014D
_0808862C: .4byte gUnknown_03005B64
_08088630: .4byte 0x00000105
_08088634: .4byte gUnknown_080E0384
_08088638:
	ldr r2, _0808865C @ =gUnknown_080E0384
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #4
_08088644:
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	strh r1, [r3, #0xa]
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x21
	b _080886A6
	.align 2, 0
_0808865C: .4byte gUnknown_080E0384
_08088660:
	ldr r0, _080886B8 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _08088672
	movs r1, #0
_08088672:
	adds r0, r5, #0
	adds r0, #0xd5
	strb r4, [r0]
	ldr r2, _080886BC @ =0x00000105
	adds r0, r5, r2
	strb r4, [r0]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r3, r5, r0
	ldr r2, _080886C0 @ =gUnknown_080E0384
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	strh r1, [r3, #0xa]
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080886C4 @ =0x00000131
	adds r1, r5, r0
_080886A6:
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_80888BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080886B8: .4byte gUnknown_03005B64
_080886BC: .4byte 0x00000105
_080886C0: .4byte gUnknown_080E0384
_080886C4: .4byte 0x00000131

	thumb_func_start sub_80886C8
sub_80886C8: @ 0x080886C8
	push {r4, r5, lr}
	ldr r4, _08088700 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _08088704 @ =gUnknown_03000140
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08088714
	ldr r2, _08088708 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0808870C @ =gUnknown_03001954
	strb r3, [r0]
	ldr r1, [r4]
	ldr r0, _08088710 @ =sub_808883C
	str r0, [r1, #8]
	b _0808874E
	.align 2, 0
_08088700: .4byte gCurTask
_08088704: .4byte gUnknown_03000140
_08088708: .4byte gUnknown_03001840
_0808870C: .4byte gUnknown_03001954
_08088710: .4byte sub_808883C
_08088714:
	ldr r1, _08088754 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08088758 @ =gUnknown_03002878
	ldr r0, _0808875C @ =0x04000042
	str r0, [r1]
	ldr r1, _08088760 @ =gWinRegs
	movs r0, #0xcc
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x31
	strh r0, [r1, #0xa]
	ldr r2, _08088764 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	adds r0, r5, #0
	bl sub_80888BC
_0808874E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088754: .4byte gUnknown_03002A80
_08088758: .4byte gUnknown_03002878
_0808875C: .4byte 0x04000042
_08088760: .4byte gWinRegs
_08088764: .4byte gUnknown_03001840

	thumb_func_start sub_8088768
sub_8088768: @ 0x08088768
	push {r4, r5, lr}
	ldr r4, _080887A0 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _080887A4 @ =gUnknown_03000140
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080887AC
	ldr r2, _080887A8 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	bl sub_808D49C
	ldr r0, [r4]
	bl TaskDestroy
	b _080887E6
	.align 2, 0
_080887A0: .4byte gCurTask
_080887A4: .4byte gUnknown_03000140
_080887A8: .4byte gUnknown_03001840
_080887AC:
	ldr r1, _080887EC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _080887F0 @ =gUnknown_03002878
	ldr r0, _080887F4 @ =0x04000042
	str r0, [r1]
	ldr r1, _080887F8 @ =gWinRegs
	movs r0, #0xcc
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x31
	strh r0, [r1, #0xa]
	ldr r2, _080887FC @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	adds r0, r5, #0
	bl sub_80888BC
_080887E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080887EC: .4byte gUnknown_03002A80
_080887F0: .4byte gUnknown_03002878
_080887F4: .4byte 0x04000042
_080887F8: .4byte gWinRegs
_080887FC: .4byte gUnknown_03001840

	thumb_func_start sub_8088800
sub_8088800: @ 0x08088800
	push {r4, r5, lr}
	ldr r5, _0808882C @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _08088830 @ =gUnknown_03000140
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088826
	ldr r0, _08088834 @ =gUnknown_0300014C
	adds r1, r4, r0
	movs r0, #0xf
	strb r0, [r1]
	ldr r1, [r5]
	ldr r0, _08088838 @ =sub_80882F8
	str r0, [r1, #8]
_08088826:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808882C: .4byte gCurTask
_08088830: .4byte gUnknown_03000140
_08088834: .4byte gUnknown_0300014C
_08088838: .4byte sub_80882F8

	thumb_func_start sub_808883C
sub_808883C: @ 0x0808883C
	push {lr}
	ldr r0, _08088854 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08088858 @ =gUnknown_0300014D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088860
	ldr r1, _0808885C @ =gUnknown_030054CC
	movs r0, #2
	b _08088864
	.align 2, 0
_08088854: .4byte gCurTask
_08088858: .4byte gUnknown_0300014D
_0808885C: .4byte gUnknown_030054CC
_08088860:
	ldr r1, _0808889C @ =gUnknown_030054CC
	movs r0, #1
_08088864:
	strb r0, [r1]
	ldr r1, _080888A0 @ =0x0000FFFF
	movs r0, #0
	bl sub_80029D0
	ldr r1, _080888A4 @ =gUnknown_03002AE4
	ldr r0, _080888A8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080888AC @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080888B0 @ =gUnknown_03004D5C
	ldr r0, _080888B4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080888B8 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_803143C
	pop {r0}
	bx r0
	.align 2, 0
_0808889C: .4byte gUnknown_030054CC
_080888A0: .4byte 0x0000FFFF
_080888A4: .4byte gUnknown_03002AE4
_080888A8: .4byte gUnknown_0300287C
_080888AC: .4byte gUnknown_03005390
_080888B0: .4byte gUnknown_03004D5C
_080888B4: .4byte gUnknown_03002A84
_080888B8: .4byte gUnknown_03005B64

	thumb_func_start sub_80888BC
sub_80888BC: @ 0x080888BC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x80
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080888F8
	movs r0, #0x88
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080888F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088900
sub_8088900: @ 0x08088900
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08088934 @ =gUnknown_03000084
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08088938 @ =gUnknown_030000B4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _0808893C @ =gUnknown_030000E4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r0, _08088940 @ =gUnknown_03000114
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088934: .4byte gUnknown_03000084
_08088938: .4byte gUnknown_030000B4
_0808893C: .4byte gUnknown_030000E4
_08088940: .4byte gUnknown_03000114

	thumb_func_start sub_8088944
sub_8088944: @ 0x08088944
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	ldr r0, _08088C74 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r0, #0
	bge _08088964
	movs r7, #0
_08088964:
	ldr r1, _08088C78 @ =gDispCnt
	ldr r0, _08088C7C @ =0x00001341
	strh r0, [r1]
	ldr r1, _08088C80 @ =gBgCntRegs
	movs r2, #0
	movs r5, #0
	ldr r0, _08088C84 @ =0x00001D05
	strh r0, [r1]
	ldr r0, _08088C88 @ =0x00000702
	strh r0, [r1, #2]
	ldr r4, _08088C8C @ =gUnknown_03004D80
	strb r2, [r4]
	ldr r0, _08088C90 @ =gUnknown_03002280
	strb r2, [r0]
	strb r2, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r3, #0x20
	strb r3, [r0, #3]
	strb r2, [r4, #1]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r3, [r0, #7]
	strb r2, [r4, #2]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	ldr r0, _08088C94 @ =gBgScrollRegs
	ldr r1, _08088C98 @ =0x0000FFF8
	strh r1, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	mov r0, r8
	adds r0, #0x80
	str r0, [sp, #0xc]
	mov r1, r8
	adds r1, #0xa0
	str r1, [sp, #0x10]
	mov r3, r8
	adds r3, #0xa1
	str r3, [sp, #0x14]
	mov r4, r8
	adds r4, #0xa2
	str r4, [sp, #0x18]
	adds r0, #0x25
	str r0, [sp, #0x1c]
	adds r1, #0x14
	str r1, [sp, #0x20]
	mov r6, r8
	adds r6, #0x40
	subs r3, #0x37
	str r3, [sp, #8]
	subs r4, #0x78
	str r4, [sp, #4]
	movs r0, #0xb0
	mov sb, r0
	movs r3, #0xe0
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
_080889EA:
	mov r1, r8
	adds r7, r1, r3
	cmp r5, #3
	beq _08088A94
	cmp r5, #3
	bls _080889FA
	mov r7, r8
	add r7, sb
_080889FA:
	cmp r5, #2
	bne _08088A1A
	ldr r0, _08088C9C @ =gUnknown_030054CC
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08088A1A
	movs r7, #0xa0
	lsls r7, r7, #1
	add r7, r8
	movs r3, #0xa0
	lsls r3, r3, #1
	mov sb, r3
	adds r3, #0x30
	movs r5, #3
_08088A1A:
	mov r0, sl
	lsls r4, r0, #2
	add r4, sl
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r1, _08088CA0 @ =gUnknown_080E04D4
	adds r4, r4, r1
	ldr r0, [r4]
	str r3, [sp, #0x28]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	movs r1, #0
	mov ip, r1
	movs r2, #0
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	lsls r1, r5, #4
	adds r0, r1, #0
	adds r0, #0x18
	strh r0, [r7, #0x18]
	ldr r3, [sp, #0x28]
	cmp r5, #2
	bls _08088A62
	subs r0, #0x10
	strh r0, [r7, #0x18]
_08088A62:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	mov r4, ip
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl sub_8004558
	ldr r3, [sp, #0x28]
_08088A94:
	movs r0, #0x30
	add sb, r0
	adds r3, #0x30
	adds r5, #1
	cmp r5, #4
	bls _080889EA
	ldr r7, [sp, #0xc]
	movs r2, #0
	str r2, [r7, #4]
	ldr r0, _08088CA4 @ =0x0000041B
	strh r0, [r7, #0xa]
	movs r0, #5
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	movs r0, #0xff
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	movs r0, #0x10
	mov sb, r0
	mov r3, sb
	ldr r1, [sp, #0x18]
	strb r3, [r1]
	movs r0, #0
	ldr r4, [sp, #0x1c]
	strb r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	str r1, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x24]
	bl sub_8004558
	ldr r4, _08088CA8 @ =gUnknown_080E0474
	ldr r5, _08088CAC @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xa]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	mov r4, sp
	strb r0, [r4]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	movs r0, #0x82
	strh r0, [r7, #0x18]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r7, #0x1a]
	ldr r2, [sp, #0x24]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	mov r0, sb
	ldr r4, [sp, #0x18]
	strb r0, [r4]
	movs r3, #0
	ldr r1, [sp, #0x1c]
	strb r3, [r1]
	mov r4, sl
	str r4, [r7, #0x28]
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x24]
	bl sub_8004558
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x20]
	str r2, [r1]
	movs r1, #0
	ldrsb r1, [r5, r1]
	cmp r1, #1
	bne _08088BD0
	movs r0, #0xd6
	lsls r0, r0, #1
	add r0, r8
	strb r1, [r0]
	mov r7, r8
	adds r7, #0xb0
	ldr r4, _08088CB0 @ =gUnknown_080E04C4
	ldr r0, [r4]
	str r2, [sp, #0x24]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	mov r0, r8
	adds r0, #0xd0
	strb r1, [r0]
	mov r1, r8
	adds r1, #0xd1
	ldrb r0, [r1]
	mov r3, sp
	ldrb r3, [r3]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x64
	strh r0, [r7, #0x16]
	movs r0, #0x6e
	strh r0, [r7, #0x18]
	adds r0, #0xd2
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x24]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	mov r0, r8
	adds r0, #0xd2
	mov r4, sb
	strb r4, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	mov r3, sl
	str r3, [r7, #0x28]
	movs r4, #0xa0
	lsls r4, r4, #5
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x24]
	bl sub_8004558
	ldr r2, [sp, #0x24]
_08088BD0:
	ldr r0, _08088CB4 @ =0x06004000
	str r0, [r6, #4]
	strh r2, [r6, #0xa]
	ldr r0, _08088CB8 @ =0x0600E800
	str r0, [r6, #0xc]
	strh r2, [r6, #0x18]
	strh r2, [r6, #0x1a]
	movs r0, #0x96
	strh r0, [r6, #0x1c]
	strh r2, [r6, #0x1e]
	strh r2, [r6, #0x20]
	strh r2, [r6, #0x22]
	strh r2, [r6, #0x24]
	movs r0, #0x1c
	strh r0, [r6, #0x26]
	movs r0, #0xc
	strh r0, [r6, #0x28]
	movs r1, #0
	ldr r0, [sp, #8]
	strb r1, [r0]
	strh r2, [r6, #0x2e]
	adds r0, r6, #0
	str r2, [sp, #0x24]
	bl sub_8002A3C
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r3, r8
	str r0, [r3, #4]
	ldr r2, [sp, #0x24]
	strh r2, [r3, #0xa]
	ldr r0, _08088CBC @ =0x06003800
	str r0, [r3, #0xc]
	strh r2, [r3, #0x18]
	strh r2, [r3, #0x1a]
	movs r0, #0x97
	strh r0, [r3, #0x1c]
	strh r2, [r3, #0x1e]
	strh r2, [r3, #0x20]
	strh r2, [r3, #0x22]
	strh r2, [r3, #0x24]
	movs r0, #0x20
	strh r0, [r3, #0x26]
	strh r0, [r3, #0x28]
	movs r0, #0
	ldr r4, [sp, #4]
	strb r0, [r4]
	movs r5, #1
	strh r5, [r3, #0x2e]
	mov r0, r8
	str r2, [sp, #0x24]
	bl sub_8002A3C
	movs r4, #0xd0
	lsls r4, r4, #1
	add r4, r8
	strh r5, [r4]
	ldr r2, [sp, #0x24]
	strh r2, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #6]
	ldr r0, _08088CC0 @ =0x00003FFF
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
	movs r0, #7
	bl m4aSongNumStart
	adds r0, r4, #0
	bl sub_802D4CC
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088C74: .4byte gUnknown_03005B64
_08088C78: .4byte gDispCnt
_08088C7C: .4byte 0x00001341
_08088C80: .4byte gBgCntRegs
_08088C84: .4byte 0x00001D05
_08088C88: .4byte 0x00000702
_08088C8C: .4byte gUnknown_03004D80
_08088C90: .4byte gUnknown_03002280
_08088C94: .4byte gBgScrollRegs
_08088C98: .4byte 0x0000FFF8
_08088C9C: .4byte gUnknown_030054CC
_08088CA0: .4byte gUnknown_080E04D4
_08088CA4: .4byte 0x0000041B
_08088CA8: .4byte gUnknown_080E0474
_08088CAC: .4byte gUnknown_030054F0
_08088CB0: .4byte gUnknown_080E04C4
_08088CB4: .4byte 0x06004000
_08088CB8: .4byte 0x0600E800
_08088CBC: .4byte 0x06003800
_08088CC0: .4byte 0x00003FFF

	thumb_func_start sub_8088CC4
sub_8088CC4: @ 0x08088CC4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08088CEC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	movs r6, #0
	ldr r0, _08088CF0 @ =gUnknown_03000105
	adds r4, r1, r0
	subs r0, #0x25
	adds r5, r1, r0
_08088CDC:
	ldr r1, _08088CF4 @ =0x000001AD
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r6, r0
	bne _08088CF8
	movs r0, #0
	b _08088CFA
	.align 2, 0
_08088CEC: .4byte gCurTask
_08088CF0: .4byte gUnknown_03000105
_08088CF4: .4byte 0x000001AD
_08088CF8:
	movs r0, #1
_08088CFA:
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #3
	bls _08088CDC
	adds r4, r7, #0
	adds r4, #0x80
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088D36
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08088D36:
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r7, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088D50
	ldr r0, _08088D58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08088D5C @ =sub_8088EB4
	str r0, [r1, #8]
_08088D50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088D58: .4byte gCurTask
_08088D5C: .4byte sub_8088EB4

	thumb_func_start sub_8088D60
sub_8088D60: @ 0x08088D60
	push {r4, r5, r6, r7, lr}
	ldr r6, _08088D98 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _08088D9C @ =gUnknown_030001A0
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08088E12
	ldr r0, [r6]
	bl TaskDestroy
	ldr r1, _08088DA0 @ =gUnknown_030001AD
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08088DB4
	cmp r0, #1
	bgt _08088DA4
	cmp r0, #0
	beq _08088DAE
	b _08088EAC
	.align 2, 0
_08088D98: .4byte gCurTask
_08088D9C: .4byte gUnknown_030001A0
_08088DA0: .4byte gUnknown_030001AD
_08088DA4:
	cmp r0, #2
	beq _08088DE0
	cmp r0, #3
	beq _08088E0C
	b _08088EAC
_08088DAE:
	bl sub_801A770
	b _08088EAC
_08088DB4:
	ldr r0, _08088DD4 @ =gUnknown_030054F0
	ldrb r0, [r0]
	ldr r1, _08088DD8 @ =gUnknown_03005B64
	ldr r1, [r1]
	ldrb r2, [r1, #0x13]
	movs r1, #0x10
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_803143C
	ldr r1, _08088DDC @ =gUnknown_030055B4
	movs r0, #0
	strb r0, [r1]
	b _08088EAC
	.align 2, 0
_08088DD4: .4byte gUnknown_030054F0
_08088DD8: .4byte gUnknown_03005B64
_08088DDC: .4byte gUnknown_030055B4
_08088DE0:
	ldr r0, _08088E00 @ =gUnknown_030054CC
	ldrb r0, [r0]
	lsrs r0, r0, #1
	ands r0, r5
	ldr r1, _08088E04 @ =gUnknown_030054F0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, _08088E08 @ =gUnknown_030055B4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_80637EC
	b _08088EAC
	.align 2, 0
_08088E00: .4byte gUnknown_030054CC
_08088E04: .4byte gUnknown_030054F0
_08088E08: .4byte gUnknown_030055B4
_08088E0C:
	bl sub_808D41C
	b _08088EAC
_08088E12:
	movs r5, #0
	ldr r0, _08088E40 @ =gUnknown_03000080
	adds r6, r4, r0
	ldr r1, _08088E44 @ =gUnknown_030000E0
	adds r4, r4, r1
_08088E1C:
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r5, #1
	cmp r5, #3
	bls _08088E1C
	adds r4, r6, #0
	ldr r1, _08088E48 @ =0x000001AD
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08088E52
	cmp r0, #1
	bgt _08088E4C
	cmp r0, #0
	beq _08088E58
	b _08088E5E
	.align 2, 0
_08088E40: .4byte gUnknown_03000080
_08088E44: .4byte gUnknown_030000E0
_08088E48: .4byte 0x000001AD
_08088E4C:
	cmp r0, #2
	beq _08088E58
	b _08088E5E
_08088E52:
	ldrh r0, [r4, #0x16]
	subs r0, #4
	b _08088E5C
_08088E58:
	ldrh r0, [r4, #0x16]
	adds r0, #4
_08088E5C:
	strh r0, [r4, #0x16]
_08088E5E:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088EAC
	adds r4, r7, #0
	adds r4, #0xb0
	adds r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08088E94
	cmp r0, #1
	bgt _08088E8E
	cmp r0, #0
	beq _08088E9A
	b _08088EA0
_08088E8E:
	cmp r0, #2
	beq _08088E9A
	b _08088EA0
_08088E94:
	ldrh r0, [r4, #0x16]
	subs r0, #2
	b _08088E9E
_08088E9A:
	ldrh r0, [r4, #0x16]
	adds r0, #3
_08088E9E:
	strh r0, [r4, #0x16]
_08088EA0:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08088EAC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088EB4
sub_8088EB4: @ 0x08088EB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08088EEC @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r2, _08088EF0 @ =gUnknown_030022B8
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08088EF8
	ldr r0, _08088EF4 @ =gUnknown_030001AD
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08088EF8
	subs r0, #1
	strb r0, [r3]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08088F16
	.align 2, 0
_08088EEC: .4byte gCurTask
_08088EF0: .4byte gUnknown_030022B8
_08088EF4: .4byte gUnknown_030001AD
_08088EF8:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08088F16
	ldr r2, _08088F34 @ =0x000001AD
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, #3
	beq _08088F16
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x6c
	bl m4aSongNumStart
_08088F16:
	movs r6, #0
	movs r0, #0x80
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _08088F38 @ =0x00000105
	adds r4, r7, r1
	adds r5, r7, #0
	adds r5, #0xe0
_08088F26:
	ldr r2, _08088F34 @ =0x000001AD
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r6, r0
	bne _08088F3C
	movs r0, #0
	b _08088F3E
	.align 2, 0
_08088F34: .4byte 0x000001AD
_08088F38: .4byte 0x00000105
_08088F3C:
	movs r0, #1
_08088F3E:
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #3
	bls _08088F26
	mov r6, sb
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r0, #0xd6
	lsls r0, r0, #1
	adds r0, r0, r7
	mov sl, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088F7C
	adds r6, r7, #0
	adds r6, #0xb0
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08088F7C:
	ldr r0, _08089098 @ =gUnknown_030022B8
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08088F8A
	b _08089088
_08088F8A:
	ldr r1, _0808909C @ =0x000001AD
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	cmp r0, #3
	beq _08089054
	mov r6, sb
	ldr r0, [r6, #4]
	bl sub_8007CF0
	ldr r5, _080890A0 @ =gUnknown_080E0474
	ldr r4, _080890A4 @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #5
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_8007C10
	str r0, [r6, #4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #5
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #5
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #6]
	adds r0, r7, #0
	adds r0, #0xa0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0xa1
	movs r2, #1
	rsbs r2, r2, #0
	adds r5, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xa2
	movs r1, #0x40
	mov sb, r1
	mov r2, sb
	strb r2, [r0]
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	bne _08088FFE
	ldr r0, [r6, #0x10]
	ldr r1, _080890A8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088FFE:
	adds r0, r6, #0
	bl sub_8004558
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0
	beq _08089054
	adds r6, r7, #0
	adds r6, #0xb0
	ldr r0, [r6, #4]
	bl sub_8007CF0
	ldr r4, _080890AC @ =gUnknown_080E04C4
	ldr r0, [r4, #8]
	bl sub_8007C10
	str r0, [r6, #4]
	ldrh r0, [r4, #0xc]
	strh r0, [r6, #0xa]
	ldrb r1, [r4, #0xe]
	adds r0, r7, #0
	adds r0, #0xd0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0xd1
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xd2
	mov r1, sb
	strb r1, [r0]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #1
	bne _0808904E
	ldr r0, [r6, #0x10]
	ldr r1, _080890A8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
_0808904E:
	adds r0, r6, #0
	bl sub_8004558
_08089054:
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r7, r1
	movs r1, #0
	strh r1, [r0]
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r7, r2
	strh r1, [r0]
	movs r0, #0xd1
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r0, #1
	strh r0, [r1]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _080890B0 @ =gUnknown_02002540
	movs r1, #0x80
	lsls r1, r1, #5
	bl m4aMPlayFadeOut
	ldr r0, _080890B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080890B8 @ =sub_8088D60
	str r0, [r1, #8]
_08089088:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089098: .4byte gUnknown_030022B8
_0808909C: .4byte 0x000001AD
_080890A0: .4byte gUnknown_080E0474
_080890A4: .4byte gUnknown_030054F0
_080890A8: .4byte 0xFFFFFBFF
_080890AC: .4byte gUnknown_080E04C4
_080890B0: .4byte gUnknown_02002540
_080890B4: .4byte gCurTask
_080890B8: .4byte sub_8088D60

	thumb_func_start sub_80890BC
sub_80890BC: @ 0x080890BC
	push {lr}
	sub sp, #4
	ldr r0, _080890F4 @ =sub_8088CC4
	movs r1, #0xd8
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _080890F8 @ =sub_8089104
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r3, _080890FC @ =gUnknown_030001AD
	adds r2, r1, r3
	movs r3, #0
	strb r3, [r2]
	ldr r2, _08089100 @ =gUnknown_030001AC
	adds r1, r1, r2
	strb r3, [r1]
	bl sub_8088944
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080890F4: .4byte sub_8088CC4
_080890F8: .4byte sub_8089104
_080890FC: .4byte gUnknown_030001AD
_08089100: .4byte gUnknown_030001AC

	thumb_func_start sub_8089104
sub_8089104: @ 0x08089104
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08089154 @ =gUnknown_030000E4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089158 @ =gUnknown_03000114
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _0808915C @ =gUnknown_03000144
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089160 @ =gUnknown_03000174
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089164 @ =gUnknown_03000084
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089168 @ =gUnknown_030001AC
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808914E
	subs r1, #0xf8
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
_0808914E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089154: .4byte gUnknown_030000E4
_08089158: .4byte gUnknown_03000114
_0808915C: .4byte gUnknown_03000144
_08089160: .4byte gUnknown_03000174
_08089164: .4byte gUnknown_03000084
_08089168: .4byte gUnknown_030001AC

	thumb_func_start sub_808916C
sub_808916C: @ 0x0808916C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	mov r8, r0
	movs r7, #0
	ldr r0, _08089240 @ =gUnknown_03005B64
	ldr r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08089244 @ =gUnknown_030053F0
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08089248 @ =sub_8089AEC
	movs r1, #0xb7
	lsls r1, r1, #2
	movs r2, #0xc1
	lsls r2, r2, #8
	ldr r3, _0808924C @ =sub_8089BB0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r1, _08089250 @ =gUnknown_03000168
	adds r0, r2, r1
	str r7, [r0]
	ldr r3, _08089254 @ =gUnknown_030002D4
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r1]
	ldr r0, _08089258 @ =gUnknown_030002D6
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r1]
	mov r1, sl
	strh r7, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	adds r0, #0xff
	strh r0, [r1, #6]
	strh r7, [r1, #4]
	ldr r0, _0808925C @ =0x00003FFF
	strh r0, [r1, #8]
	strh r7, [r1, #0xa]
	ldr r3, _08089260 @ =gUnknown_0300015C
	adds r5, r2, r3
	mov r0, r8
	str r0, [r5]
	ldr r0, _08089264 @ =0x00008C9F
	cmp r8, r0
	bhi _0808926C
	mov r0, r8
	movs r1, #0x3c
	bl __umodsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, r8
	subs r4, r1, r0
	str r4, [r5]
	ldr r3, _08089268 @ =gUnknown_080D6B80
	lsls r0, r0, #1
	adds r1, r0, r3
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r3, #1
	adds r0, r0, r3
	lsls r1, r1, #1
	ldrb r0, [r0]
	adds r5, r1, r0
	adds r0, r4, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x3c
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	b _08089272
	.align 2, 0
_08089240: .4byte gUnknown_03005B64
_08089244: .4byte gUnknown_030053F0
_08089248: .4byte sub_8089AEC
_0808924C: .4byte sub_8089BB0
_08089250: .4byte gUnknown_03000168
_08089254: .4byte gUnknown_030002D4
_08089258: .4byte gUnknown_030002D6
_0808925C: .4byte 0x00003FFF
_08089260: .4byte gUnknown_0300015C
_08089264: .4byte 0x00008C9F
_08089268: .4byte gUnknown_080D6B80
_0808926C:
	movs r5, #0x63
	movs r4, #0x3b
	movs r2, #9
_08089272:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080895C0 @ =0x00000171
	add r1, sl
	strb r0, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xb9
	lsls r1, r1, #1
	add r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080895C4 @ =0x00000173
	add r1, sl
	strb r0, [r1]
	adds r4, r5, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xba
	lsls r1, r1, #1
	add r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080895C8 @ =0x00000175
	add r1, sl
	strb r0, [r1]
	movs r4, #0
	movs r2, #0xa6
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x20]
	ldr r3, _080895CC @ =0x0000014D
	add r3, sl
	str r3, [sp, #0x24]
	movs r0, #0xa7
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x28]
	ldr r1, _080895D0 @ =0x00000151
	add r1, sl
	str r1, [sp, #0x2c]
	mov r2, sl
	adds r2, #0xc
	str r2, [sp, #0x1c]
	mov r3, sl
	adds r3, #0x2c
	str r3, [sp, #0x30]
	mov r0, sl
	adds r0, #0x2d
	str r0, [sp, #0x34]
	mov r1, sl
	adds r1, #0x2e
	str r1, [sp, #0x38]
	adds r2, #0x25
	str r2, [sp, #0x3c]
	adds r3, #0x10
	str r3, [sp, #0x40]
	adds r0, #0x2f
	str r0, [sp, #0x44]
	adds r1, #0x2f
	str r1, [sp, #0x48]
	adds r2, #0x2d
	str r2, [sp, #0x4c]
	adds r3, #0x25
	str r3, [sp, #0x50]
	adds r0, #0x10
	str r0, [sp, #0x54]
	adds r1, #0x2f
	str r1, [sp, #0x58]
	adds r2, #0x2f
	str r2, [sp, #0x5c]
	adds r3, #0x2d
	str r3, [sp, #0x60]
	adds r0, #0x25
	str r0, [sp, #0x64]
	adds r1, #0x10
	str r1, [sp, #0x68]
	adds r2, #0x2f
	str r2, [sp, #0x6c]
	adds r3, #0x2f
	str r3, [sp, #0x70]
	adds r0, #0x2d
	str r0, [sp, #0x74]
	adds r1, #0x25
	str r1, [sp, #0x78]
	adds r2, #0x10
	str r2, [sp, #0x7c]
	adds r3, #0x2f
	str r3, [sp, #4]
	adds r0, #0x3e
	str r0, [sp, #8]
	movs r1, #0x8e
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0xc]
	ldr r2, _080895D4 @ =0x0000011D
	add r2, sl
	str r2, [sp, #0x10]
	movs r3, #0x8f
	lsls r3, r3, #1
	add r3, sl
	str r3, [sp, #0x14]
	ldr r0, _080895D8 @ =0x00000121
	add r0, sl
	str r0, [sp, #0x18]
	movs r6, #0
	movs r5, #0
	ldr r1, _080895DC @ =0x00000417
	mov sb, r1
_0808936A:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r2, #0xbc
	lsls r2, r2, #1
	adds r0, r0, r2
	mov r3, sl
	adds r7, r3, r0
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #1
	adds r0, #0x48
	strh r0, [r7, #0x16]
	movs r0, #0x58
	strh r0, [r7, #0x18]
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	mov r0, sb
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r5, [r7, #0x10]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _0808936A
	movs r1, #0xcc
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080895C0 @ =0x00000171
	add r0, sl
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r0, #0xe4
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0xa
	strb r2, [r0]
	movs r1, #0xfc
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xb9
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r1, #0x8a
	lsls r1, r1, #2
	add r1, sl
	ldr r0, _080895C4 @ =0x00000173
	add r0, sl
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #2
	add r0, sl
	strb r2, [r0]
	movs r1, #0xa2
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0xba
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r1, #0xae
	lsls r1, r1, #2
	add r1, sl
	ldr r0, _080895C8 @ =0x00000175
	add r0, sl
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r4, #0
_0808943E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r0, r0, r1
	add r0, sl
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _0808943E
	mov r0, r8
	bl sub_80899B8
	movs r1, #0xb6
	lsls r1, r1, #2
	add r1, sl
	movs r2, #0
	mov r8, r2
	strb r0, [r1]
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, sl
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r7, #0x16]
	movs r0, #0x50
	strh r0, [r7, #0x18]
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0x8c
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r1, #0
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	mov r2, r8
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	movs r1, #0x10
	ldr r0, [sp, #0x28]
	strb r1, [r0]
	movs r3, #0
	ldr r2, [sp, #0x2c]
	strb r3, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r1, r8
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x16]
	movs r0, #0x29
	strh r0, [r7, #0x18]
	ldr r4, _080895E0 @ =gUnknown_080D713C
	ldr r5, _080895E4 @ =gUnknown_030054F0
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r3, [sp, #0x30]
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	mov r1, r8
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x34]
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, [sp, #0x38]
	strb r0, [r3]
	movs r2, #0
	ldr r1, [sp, #0x3c]
	strb r2, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	mov r0, r8
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080895E8 @ =gUnknown_030055B4
	mov sb, r1
	ldrb r0, [r1]
	movs r6, #3
	ands r6, r0
	lsrs r6, r6, #1
	ldr r7, [sp, #0x40]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r5, _080895EC @ =gUnknown_080D715A
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r3, [sp, #0x44]
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	mov r1, r8
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x48]
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, [sp, #0x4c]
	strb r0, [r3]
	movs r2, #0
	ldr r1, [sp, #0x50]
	strb r2, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	mov r0, r8
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	cmp r6, #0
	beq _080895F0
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _080895F8
	.align 2, 0
_080895C0: .4byte 0x00000171
_080895C4: .4byte 0x00000173
_080895C8: .4byte 0x00000175
_080895CC: .4byte 0x0000014D
_080895D0: .4byte 0x00000151
_080895D4: .4byte 0x0000011D
_080895D8: .4byte 0x00000121
_080895DC: .4byte 0x00000417
_080895E0: .4byte gUnknown_080D713C
_080895E4: .4byte gUnknown_030054F0
_080895E8: .4byte gUnknown_030055B4
_080895EC: .4byte gUnknown_080D715A
_080895F0:
	mov r2, sb
	ldrb r0, [r2]
	movs r1, #1
	ands r1, r0
_080895F8:
	ldr r7, [sp, #0x54]
	movs r6, #0
	movs r3, #0x80
	lsls r3, r3, #1
	mov r8, r3
	mov r0, r8
	strh r0, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r5, _080896C4 @ =gUnknown_080D7178
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r1, [sp, #0x58]
	strb r0, [r1]
	mov r2, r8
	strh r2, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x5c]
	strb r0, [r3]
	movs r5, #0x10
	ldr r0, [sp, #0x60]
	strb r5, [r0]
	movs r2, #0
	ldr r1, [sp, #0x64]
	strb r2, [r1]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x68]
	movs r0, #0x28
	strh r0, [r7, #0x16]
	movs r0, #0x5a
	strh r0, [r7, #0x18]
	movs r0, #8
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0x86
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #1
	ldr r3, [sp, #0x6c]
	strb r0, [r3]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r0, r4, #0
	ldr r1, [sp, #0x70]
	strb r0, [r1]
	ldr r2, [sp, #0x74]
	strb r5, [r2]
	movs r0, #0
	ldr r3, [sp, #0x78]
	strb r0, [r3]
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x7c]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	strh r0, [r7, #0x18]
	movs r0, #0x10
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _080896C8 @ =0x00000417
	strh r0, [r7, #0xa]
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _080896CC
	adds r0, #0xd
	ldr r1, [sp, #4]
	strb r0, [r1]
	b _080896D2
	.align 2, 0
_080896C4: .4byte gUnknown_080D7178
_080896C8: .4byte 0x00000417
_080896CC:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2]
_080896D2:
	movs r6, #0
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #1
	strh r5, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r3, #0x10
	strb r3, [r0]
	adds r0, #3
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	ldr r2, _080897B0 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r0, _080897B4 @ =0x000002CA
	add r0, sl
	strh r4, [r0]
	movs r0, #0xb3
	lsls r0, r0, #2
	add r0, sl
	strh r5, [r0]
	ldr r0, _080897B8 @ =0x000002CE
	add r0, sl
	movs r1, #0x78
	strh r1, [r0]
	movs r0, #0xb4
	lsls r0, r0, #2
	add r0, sl
	strh r1, [r0]
	movs r0, #0xb2
	lsls r0, r0, #2
	add r0, sl
	strh r4, [r0]
	ldr r7, [sp, #8]
	strh r1, [r7, #0x16]
	movs r0, #0x94
	strh r0, [r7, #0x18]
	movs r0, #0x16
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0x86
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0xc]
	strb r6, [r1]
	strh r5, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r1, [sp, #0x18]
	strb r6, [r1]
	mov r2, r8
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080897BC @ =gUnknown_030054A8
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _080897C0 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _08089798
	ldr r0, _080897C4 @ =gUnknown_030059E0
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
_08089798:
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #1
	bne _080897C8
	movs r0, #0xcb
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _080897CE
	.align 2, 0
_080897B0: .4byte gUnknown_030054B8
_080897B4: .4byte 0x000002CA
_080897B8: .4byte 0x000002CE
_080897BC: .4byte gUnknown_030054A8
_080897C0: .4byte gUnknown_030055B4
_080897C4: .4byte gUnknown_030059E0
_080897C8:
	ldr r0, _080897E4 @ =0x00000195
	bl m4aSongNumStart
_080897CE:
	movs r0, #0x96
	lsls r0, r0, #2
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080897E4: .4byte 0x00000195

	thumb_func_start sub_80897E8
sub_80897E8: @ 0x080897E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08089834 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r1, _08089838 @ =gUnknown_03000168
	adds r0, r3, r1
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0x17
	bhi _08089840
	ldr r2, _0808983C @ =gUnknown_0300012C
	adds r5, r3, r2
	movs r0, #0
	mov r3, r8
	cmp r3, #0x10
	bhi _0808981C
	movs r1, #0x10
	subs r1, r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
_0808981C:
	movs r6, #0
	adds r4, r0, #0
_08089820:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _08089820
	b _08089856
	.align 2, 0
_08089834: .4byte gCurTask
_08089838: .4byte gUnknown_03000168
_0808983C: .4byte gUnknown_0300012C
_08089840:
	ldr r0, _08089910 @ =gUnknown_0300012C
	adds r5, r3, r0
	movs r6, #0
_08089846:
	lsls r0, r6, #5
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r6, #1
	cmp r6, #7
	bls _08089846
_08089856:
	mov r1, r8
	cmp r1, #0x1c
	bls _08089886
	ldr r0, _08089914 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r4, #3
	cmp r0, #2
	bne _0808986C
	movs r4, #2
_0808986C:
	movs r6, #0
	cmp r6, r4
	bhs _08089886
	adds r0, r7, #0
	adds r0, #0xc
_08089876:
	adds r5, r0, #0
	bl sub_80051E8
	adds r0, r5, #0
	adds r0, #0x30
	adds r6, #1
	cmp r6, r4
	blo _08089876
_08089886:
	mov r2, r8
	cmp r2, #0x59
	bls _080898A8
	adds r5, r7, #0
	adds r5, #0x9c
	mov r0, r8
	subs r0, #0x5a
	cmp r0, #0xa
	bhi _080898A2
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x28
	strh r0, [r5, #0x16]
_080898A2:
	adds r0, r5, #0
	bl sub_80051E8
_080898A8:
	mov r3, r8
	cmp r3, #0x77
	bls _080899A6
	mov r0, r8
	subs r0, #0x7f
	cmp r0, #0x10
	ble _08089964
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08089944
	adds r5, r7, #0
	adds r5, #0xcc
	ldr r1, _08089918 @ =gUnknown_08097AA4
	ldr r3, _0808991C @ =0x000002D6
	adds r2, r7, r3
	ldrh r0, [r2]
	lsrs r0, r0, #8
	lsls r0, r0, #3
	subs r3, #0xd6
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r3, #0xca
	adds r1, r7, r3
	strh r0, [r1]
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r3, r7, r0
	ldrh r0, [r3]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _08089922
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bne _08089920
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r3]
	b _08089922
	.align 2, 0
_08089910: .4byte gUnknown_0300012C
_08089914: .4byte gUnknown_030055B4
_08089918: .4byte gUnknown_08097AA4
_0808991C: .4byte 0x000002D6
_08089920:
	strh r2, [r3]
_08089922:
	ldr r2, _080899B0 @ =0x000002CA
	adds r1, r7, r2
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08089932
	movs r0, #0x10
	strh r0, [r1]
_08089932:
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r0, r5, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_08089944:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089964
	movs r0, #0x20
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08089964
	adds r5, r7, #0
	adds r5, #0xfc
	adds r0, r5, #0
	bl sub_80051E8
_08089964:
	movs r6, #0
	mov r0, r8
	subs r0, #0x78
	cmp r0, #0
	blt _080899A6
	adds r4, r0, #0
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r5, r7, r3
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r7, r7, r0
_0808997C:
	cmp r4, #0x13
	bhi _08089990
	ldr r0, _080899B4 @ =gUnknown_080E05C4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
_08089990:
	adds r0, r7, #0
	bl sub_80051E8
	subs r4, #1
	adds r5, #0x30
	adds r7, #0x30
	adds r6, #1
	cmp r6, #6
	bhi _080899A6
	cmp r4, #0
	bge _0808997C
_080899A6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080899B0: .4byte 0x000002CA
_080899B4: .4byte gUnknown_080E05C4

	thumb_func_start sub_80899B8
sub_80899B8: @ 0x080899B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov ip, r0
	ldr r0, _08089A84 @ =gUnknown_030054F0
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, _08089A88 @ =gUnknown_030055B4
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #0
	bge _080899E8
	adds r0, r1, #3
_080899E8:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	movs r3, #0
	mov r1, r8
	lsls r1, r1, #3
	mov sb, r1
	ldr r2, [sp, #0xc]
	lsls r2, r2, #6
	mov sl, r2
	ldr r7, _08089A8C @ =gUnknown_03005B64
	ldr r2, [r7]
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	str r0, [sp, #0x18]
	mov r0, sb
	add r0, r8
	lsls r5, r0, #1
	adds r4, r2, #0
	adds r4, #0x34
	mov r2, sl
	ldr r7, [sp, #0xc]
	subs r0, r2, r7
	lsls r2, r0, #1
	str r1, [sp, #0x14]
_08089A24:
	lsls r0, r3, #2
	mov r7, sp
	adds r1, r7, r0
	lsls r0, r3, #1
	ldr r7, [sp, #0x18]
	adds r0, r0, r7
	adds r0, r0, r5
	adds r0, r0, r2
	adds r0, r4, r0
	ldrh r0, [r0]
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089A24
	movs r3, #0
	ldr r1, [sp, #0x14]
	adds r0, r1, r6
	lsls r5, r0, #1
	mov r0, sb
	add r0, r8
	lsls r4, r0, #1
	mov r2, sl
	ldr r7, [sp, #0xc]
	subs r0, r2, r7
	lsls r2, r0, #1
_08089A5A:
	lsls r0, r3, #2
	add r0, sp
	ldr r0, [r0]
	cmp ip, r0
	bhs _08089A90
	ldr r1, _08089A8C @ =gUnknown_03005B64
	ldr r0, [r1]
	lsls r1, r3, #1
	adds r1, r1, r5
	adds r1, r1, r4
	adds r1, r1, r2
	adds r0, #0x34
	adds r0, r0, r1
	mov r2, ip
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	adds r3, r0, #0
	b _08089A9A
	.align 2, 0
_08089A84: .4byte gUnknown_030054F0
_08089A88: .4byte gUnknown_030055B4
_08089A8C: .4byte gUnknown_03005B64
_08089A90:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089A5A
_08089A9A:
	cmp r3, #2
	bhi _08089AD6
	ldr r7, [sp, #0x14]
	adds r0, r7, r6
	lsls r5, r0, #1
	mov r0, sb
	add r0, r8
	lsls r4, r0, #1
	mov r1, sl
	ldr r2, [sp, #0xc]
	subs r0, r1, r2
	lsls r2, r0, #1
	ldr r6, _08089AE8 @ =gUnknown_03005B64
_08089AB4:
	ldr r1, [r6]
	lsls r0, r3, #1
	adds r0, r0, r5
	adds r0, r0, r4
	adds r0, r0, r2
	adds r1, #0x34
	adds r1, r1, r0
	subs r0, r3, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089AB4
_08089AD6:
	ldr r0, [sp, #0x10]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089AE8: .4byte gUnknown_03005B64

	thumb_func_start sub_8089AEC
sub_8089AEC: @ 0x08089AEC
	push {r4, lr}
	ldr r0, _08089B30 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08089B34 @ =gUnknown_03000168
	adds r0, r0, r1
	ldr r4, [r0]
	adds r4, #1
	str r4, [r0]
	bl sub_80310F0
	bl sub_8031314
	bl sub_80897E8
	cmp r4, #0xa0
	bls _08089B1A
	ldr r0, _08089B38 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _08089B22
_08089B1A:
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r4, r0
	bls _08089B2A
_08089B22:
	ldr r0, _08089B30 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08089B3C @ =sub_8089B40
	str r0, [r1, #8]
_08089B2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089B30: .4byte gCurTask
_08089B34: .4byte gUnknown_03000168
_08089B38: .4byte gPressedKeys
_08089B3C: .4byte sub_8089B40

	thumb_func_start sub_8089B40
sub_8089B40: @ 0x08089B40
	push {lr}
	ldr r0, _08089B84 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08089BA0
	bl sub_8072484
	ldr r1, _08089B88 @ =0x0000FFFF
	movs r0, #0
	bl sub_80029D0
	ldr r1, _08089B8C @ =gUnknown_03002AE4
	ldr r0, _08089B90 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08089B94 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08089B98 @ =gUnknown_03004D5C
	ldr r0, _08089B9C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_80890BC
	b _08089BAC
	.align 2, 0
_08089B84: .4byte gCurTask
_08089B88: .4byte 0x0000FFFF
_08089B8C: .4byte gUnknown_03002AE4
_08089B90: .4byte gUnknown_0300287C
_08089B94: .4byte gUnknown_03005390
_08089B98: .4byte gUnknown_03004D5C
_08089B9C: .4byte gUnknown_03002A84
_08089BA0:
	bl sub_80310F0
	bl sub_8031314
	bl sub_80897E8
_08089BAC:
	pop {r0}
	bx r0

	thumb_func_start sub_8089BB0
sub_8089BB0: @ 0x08089BB0
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _08089C14 @ =gUnknown_03000130
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	movs r5, #0
	ldr r0, _08089C18 @ =gUnknown_03000010
	adds r4, r4, r0
_08089BCA:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #2
	bls _08089BCA
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0xa0
_08089BDE:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #2
	bls _08089BDE
	movs r5, #0
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r4, r6, r1
_08089BF4:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #6
	bls _08089BF4
	ldr r2, _08089C1C @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08089C20 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089C14: .4byte gUnknown_03000130
_08089C18: .4byte gUnknown_03000010
_08089C1C: .4byte gUnknown_03005424
_08089C20: .4byte 0x0000FDFF

	thumb_func_start sub_8089C24
sub_8089C24: @ 0x08089C24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08089D64 @ =sub_8089E54
	ldr r2, _08089D68 @ =0x00005050
	ldr r1, _08089D6C @ =sub_808A234
	str r1, [sp]
	movs r1, #0xe8
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r5, r0
	ldr r1, _08089D70 @ =gUnknown_03000060
	adds r0, r5, r1
	movs r2, #0
	mov r8, r2
	movs r6, #0
	strh r6, [r0]
	movs r0, #1
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r3, _08089D74 @ =0x00000369
	strh r3, [r7, #0xa]
	ldr r1, _08089D78 @ =gUnknown_03000020
	adds r0, r5, r1
	mov r2, r8
	strb r2, [r0]
	strh r6, [r7, #8]
	ldr r3, _08089D7C @ =gUnknown_03000021
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	movs r1, #0x80
	lsls r1, r1, #6
	mov sl, r1
	str r1, [r7, #0x10]
	strh r6, [r7, #0x1c]
	ldr r2, _08089D80 @ =gUnknown_03000022
	adds r0, r5, r2
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	strb r1, [r0]
	adds r2, #3
	adds r0, r5, r2
	mov r3, r8
	strb r3, [r0]
	adds r0, r7, #0
	bl sub_8004558
	ldr r0, _08089D84 @ =gUnknown_03000030
	adds r4, r5, r0
	movs r0, #1
	bl sub_8007C10
	str r0, [r4, #4]
	ldr r1, _08089D74 @ =0x00000369
	strh r1, [r4, #0xa]
	ldr r2, _08089D88 @ =gUnknown_03000050
	adds r1, r5, r2
	movs r0, #1
	strb r0, [r1]
	strh r6, [r4, #8]
	ldr r3, _08089D8C @ =gUnknown_03000051
	adds r1, r5, r3
	subs r0, #2
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	mov r1, sl
	str r1, [r4, #0x10]
	strh r6, [r4, #0x1c]
	adds r2, #2
	adds r0, r5, r2
	mov r3, sb
	strb r3, [r0]
	ldr r0, _08089D90 @ =gUnknown_03000055
	adds r5, r5, r0
	mov r1, r8
	strb r1, [r5]
	ldr r4, _08089D94 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	ldr r1, _08089D98 @ =gUnknown_03005960
	ldr r1, [r1]
	bl sub_8085500
	ldr r2, _08089D94 @ =gUnknown_030059E0
	adds r2, #0x24
	mov r8, r2
	ldr r4, _08089D9C @ =gUnknown_08097AA4
	movs r3, #0xff
	mov sl, r3
	movs r0, #0xf
	mov sb, r0
_08089CF6:
	bl sub_80854DC
	adds r1, r7, #0
	adds r1, #0x64
	adds r3, r1, r6
	ldr r2, _08089DA0 @ =0x000007FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08089D94 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08089DA4
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	adds r2, #0x62
	adds r2, r2, r6
	mov ip, r2
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #0x80
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #0x80
	mov r1, sl
	ands r0, r1
	b _08089DD8
	.align 2, 0
_08089D64: .4byte sub_8089E54
_08089D68: .4byte 0x00005050
_08089D6C: .4byte sub_808A234
_08089D70: .4byte gUnknown_03000060
_08089D74: .4byte 0x00000369
_08089D78: .4byte gUnknown_03000020
_08089D7C: .4byte gUnknown_03000021
_08089D80: .4byte gUnknown_03000022
_08089D84: .4byte gUnknown_03000030
_08089D88: .4byte gUnknown_03000050
_08089D8C: .4byte gUnknown_03000051
_08089D90: .4byte gUnknown_03000055
_08089D94: .4byte gUnknown_030059E0
_08089D98: .4byte gUnknown_03005960
_08089D9C: .4byte gUnknown_08097AA4
_08089DA0: .4byte 0x000007FF
_08089DA4:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	adds r2, #0x62
	adds r2, r2, r6
	mov ip, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
_08089DD8:
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	bl sub_80854DC
	ldr r3, _08089E50 @ =0x000003FF
	mov ip, r3
	adds r2, r7, #0
	adds r2, #0xa2
	adds r2, r2, r6
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov r3, ip
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	muls r1, r0, r1
	asrs r1, r1, #8
	strh r1, [r2]
	adds r2, r7, #0
	adds r2, #0xa4
	adds r2, r2, r6
	lsls r1, r5, #3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r6, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	blt _08089E40
	b _08089CF6
_08089E40:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089E50: .4byte 0x000003FF

	thumb_func_start sub_8089E54
sub_8089E54: @ 0x08089E54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08089EB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	mov sl, r0
	mov r8, r0
_08089E78:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08089EBC
	adds r5, r7, #0
	adds r5, #0x62
	mov r2, r8
	adds r1, r5, r2
	adds r4, r7, #0
	adds r4, #0xa2
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	adds r3, r7, #0
	adds r3, #0x64
	adds r1, r3, r2
	adds r2, r7, #0
	adds r2, #0xa4
	mov r6, r8
	adds r0, r2, r6
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	adds r6, r5, #0
	mov sb, r4
	adds r4, r3, #0
	adds r5, r2, #0
	b _08089EEC
	.align 2, 0
_08089EB8: .4byte gCurTask
_08089EBC:
	adds r6, r7, #0
	adds r6, #0x62
	mov r0, r8
	adds r2, r6, r0
	adds r5, r7, #0
	adds r5, #0xa2
	adds r1, r5, r0
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x64
	mov r1, r8
	adds r2, r4, r1
	adds r3, r7, #0
	adds r3, #0xa4
	adds r1, r3, r1
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	mov sb, r5
	adds r5, r3, #0
_08089EEC:
	mov r1, sb
	add r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #0xc8
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r1]
	mov r0, r8
	adds r1, r5, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r1]
	ldr r3, _08089FF0 @ =gUnknown_030059E0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	ldr r2, _08089FF4 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	mov r3, r8
	adds r0, r6, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r7, #0x16]
	ldr r6, _08089FF0 @ =gUnknown_030059E0
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #4
	add r8, r0
	movs r1, #1
	add sl, r1
	mov r2, sl
	cmp r2, #7
	ble _08089E78
	adds r0, r7, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #8
	bhi _08089F62
	b _0808A082
_08089F62:
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08089FF0 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	ldr r1, _08089FF4 @ =gUnknown_03005960
	ldr r1, [r1]
	bl sub_8085500
	adds r3, r7, #0
	adds r3, #0xe2
	str r3, [sp]
	adds r7, #0xe4
	mov r8, r7
	ldr r4, _08089FF8 @ =gUnknown_08097AA4
	adds r6, r5, #0
	mov r5, sb
	movs r0, #0xff
	mov sb, r0
	movs r1, #0xf
	mov sl, r1
_08089F8E:
	movs r1, #0
	movs r0, #0x80
	ldr r2, [sp]
	strh r0, [r2]
	mov r3, r8
	strh r1, [r3]
	ldr r1, _08089FF0 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A000
	bl sub_80854DC
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x17
	adds r0, r0, r2
	lsrs r7, r0, #0x18
	ldr r3, _08089FFC @ =gUnknown_03005A04
	ldrb r0, [r3]
	adds r0, #0x80
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r3, [sp]
	strh r0, [r3]
	ldr r1, _08089FFC @ =gUnknown_03005A04
	ldrb r0, [r1]
	adds r0, #0x80
	mov r2, sb
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	mov r3, r8
	strh r0, [r3]
	b _0808A034
	.align 2, 0
_08089FF0: .4byte gUnknown_030059E0
_08089FF4: .4byte gUnknown_03005960
_08089FF8: .4byte gUnknown_08097AA4
_08089FFC: .4byte gUnknown_03005A04
_0808A000:
	bl sub_80854DC
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0808A094 @ =gUnknown_03005A04
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r3, [sp]
	strh r0, [r3]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
_0808A034:
	bl sub_80854DC
	ldr r3, _0808A098 @ =0x000003FF
	adds r2, r3, #0
	lsls r1, r7, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r0, r2
	muls r1, r0, r1
	asrs r1, r1, #8
	strh r1, [r5]
	lsls r1, r7, #3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	adds r6, #4
	adds r5, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08089F8E
	ldr r0, _0808A09C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808A0A0 @ =sub_808A0A4
	str r0, [r1, #8]
_0808A082:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A094: .4byte gUnknown_03005A04
_0808A098: .4byte 0x000003FF
_0808A09C: .4byte gCurTask
_0808A0A0: .4byte sub_808A0A4

	thumb_func_start sub_808A0A4
sub_808A0A4: @ 0x0808A0A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0808A0DC @ =gCurTask
	ldr r4, [r0]
	ldrh r3, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov sb, r0
	mov r1, sb
	orrs r1, r3
	mov sb, r1
	adds r0, #0x60
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x18
	bls _0808A0E0
	adds r0, r4, #0
	bl TaskDestroy
	b _0808A222
	.align 2, 0
_0808A0DC: .4byte gCurTask
_0808A0E0:
	movs r1, #0
	mov r8, r1
	ldr r0, _0808A1C4 @ =gUnknown_03000062
	adds r0, r3, r0
	str r0, [sp, #8]
	ldr r1, _0808A1C8 @ =gUnknown_030000A2
	adds r1, r3, r1
	str r1, [sp]
	ldr r0, _0808A1CC @ =gUnknown_03000064
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _0808A1D0 @ =gUnknown_030000A4
	adds r1, r3, r1
	str r1, [sp, #4]
	ldr r0, _0808A1D4 @ =gUnknown_030000E2
	adds r7, r3, r0
	ldr r1, _0808A1D8 @ =gUnknown_030000E4
	adds r6, r3, r1
	movs r0, #0xc8
	mov sl, r0
_0808A108:
	mov r1, r8
	lsls r2, r1, #2
	ldr r0, [sp, #8]
	adds r4, r0, r2
	ldr r1, [sp]
	adds r5, r1, r2
	ldrh r0, [r5]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	mov r0, ip
	adds r3, r0, r2
	ldr r1, [sp, #4]
	adds r2, r1, r2
	ldrh r0, [r2]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r4]
	ldrh r1, [r7]
	subs r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r6]
	subs r0, r0, r1
	strh r0, [r3]
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r7]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r6]
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0xf
	ble _0808A108
	mov sl, sb
	ldr r7, _0808A1DC @ =gUnknown_030059E0
	ldr r6, _0808A1E0 @ =gUnknown_03005960
	mov r5, ip
	ldr r4, [sp, #8]
	movs r1, #7
	mov r8, r1
_0808A188:
	mov r0, sl
	adds r0, #0x60
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A1E4
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r6]
	subs r1, r1, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	ldr r0, [r6, #4]
	subs r1, r1, r0
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x18]
	bl sub_8004558
	b _0808A20C
	.align 2, 0
_0808A1C4: .4byte gUnknown_03000062
_0808A1C8: .4byte gUnknown_030000A2
_0808A1CC: .4byte gUnknown_03000064
_0808A1D0: .4byte gUnknown_030000A4
_0808A1D4: .4byte gUnknown_030000E2
_0808A1D8: .4byte gUnknown_030000E4
_0808A1DC: .4byte gUnknown_030059E0
_0808A1E0: .4byte gUnknown_03005960
_0808A1E4:
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r6]
	subs r1, r1, r0
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	ldr r0, [r6, #4]
	subs r1, r1, r0
	ldrh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x18]
_0808A20C:
	mov r0, sl
	bl sub_80051E8
	adds r5, #4
	adds r4, #4
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r0, r8
	cmp r0, #0
	bge _0808A188
_0808A222:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808A234
sub_808A234: @ 0x0808A234
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl sub_8007CF0
	ldr r0, _0808A254 @ =gUnknown_03000030
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A254: .4byte gUnknown_03000030

	thumb_func_start sub_808A258
sub_808A258: @ 0x0808A258
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r0, _0808A35C @ =sub_808AF74
	ldr r1, _0808A360 @ =0x0000075C
	movs r2, #0xc0
	lsls r2, r2, #5
	ldr r3, _0808A364 @ =sub_808B2B0
	str r3, [sp]
	movs r3, #4
	bl TaskCreate
	mov r8, r0
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r0, _0808A368 @ =IWRAM_START+4
	adds r6, r4, r0
	ldr r1, _0808A36C @ =gUnknown_03000010
	adds r7, r4, r1
	bl m4aMPlayAllStop
	mov r2, sb
	str r2, [r5]
	ldr r3, _0808A370 @ =gUnknown_030006FC
	adds r0, r4, r3
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0808A374 @ =gUnknown_03000700
	adds r0, r4, r2
	str r1, [r0]
	adds r3, #8
	adds r2, r4, r3
	movs r0, #0x80
	lsls r0, r0, #9
	str r0, [r2]
	ldr r0, _0808A378 @ =gUnknown_0300070B
	adds r2, r4, r0
	movs r0, #1
	strb r0, [r2]
	ldr r2, _0808A37C @ =gUnknown_03000709
	adds r0, r4, r2
	strb r1, [r0]
	adds r3, #4
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _0808A380 @ =gUnknown_030002D8
	adds r2, r4, r0
	ldr r3, _0808A384 @ =gUnknown_03000278
	adds r0, r4, r3
	str r0, [r2]
	ldr r2, _0808A388 @ =gUnknown_0300070C
	adds r0, r4, r2
	strb r1, [r0]
	ldr r3, _0808A38C @ =gUnknown_0300070D
	adds r0, r4, r3
	strb r1, [r0]
	adds r2, #2
	adds r0, r4, r2
	movs r2, #0
	strh r1, [r0]
	adds r3, #3
	adds r0, r4, r3
	strh r1, [r0]
	ldr r1, _0808A390 @ =gUnknown_03000712
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _0808A394 @ =0x0000035B
	add r2, sb
	ldrb r1, [r2]
	adds r3, #0x48
	adds r0, r4, r3
	strb r1, [r0]
	movs r0, #0
	movs r1, #0
	ldr r2, _0808A398 @ =gUnknown_03000718
	adds r4, r4, r2
_0808A2FA:
	str r1, [r4]
	str r1, [r4, #0x20]
	adds r4, #4
	adds r0, #1
	cmp r0, #7
	bls _0808A2FA
	ldr r1, _0808A39C @ =gUnknown_03005B50
	ldr r0, _0808A3A0 @ =0x06010000
	str r0, [r1]
	ldr r0, _0808A3A4 @ =gUnknown_03005B54
	movs r4, #0
	str r4, [r0]
	mov r0, r8
	bl sub_808B2F4
	mov r0, r8
	bl sub_808A3B4
	movs r1, #0
	strh r4, [r6]
	movs r0, #2
	strh r0, [r6, #2]
	strh r4, [r6, #4]
	adds r0, #0xfe
	strh r0, [r6, #6]
	strh r4, [r6, #0xa]
	movs r0, #0xff
	strh r0, [r6, #8]
	strb r1, [r7]
	strb r1, [r7, #2]
	movs r0, #1
	strb r0, [r7, #0xc]
	strb r0, [r7, #0xd]
	strb r0, [r7, #0xe]
	strb r1, [r7, #1]
	ldr r0, _0808A3A8 @ =gUnknown_080E0C38
	str r0, [r7, #4]
	ldr r0, _0808A3AC @ =gUnknown_08C8796C
	str r0, [r7, #8]
	strh r4, [r7, #0x34]
	ldr r0, _0808A3B0 @ =gUnknown_03005B80
	str r7, [r0]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A35C: .4byte sub_808AF74
_0808A360: .4byte 0x0000075C
_0808A364: .4byte sub_808B2B0
_0808A368: .4byte IWRAM_START+4
_0808A36C: .4byte gUnknown_03000010
_0808A370: .4byte gUnknown_030006FC
_0808A374: .4byte gUnknown_03000700
_0808A378: .4byte gUnknown_0300070B
_0808A37C: .4byte gUnknown_03000709
_0808A380: .4byte gUnknown_030002D8
_0808A384: .4byte gUnknown_03000278
_0808A388: .4byte gUnknown_0300070C
_0808A38C: .4byte gUnknown_0300070D
_0808A390: .4byte gUnknown_03000712
_0808A394: .4byte 0x0000035B
_0808A398: .4byte gUnknown_03000718
_0808A39C: .4byte gUnknown_03005B50
_0808A3A0: .4byte 0x06010000
_0808A3A4: .4byte gUnknown_03005B54
_0808A3A8: .4byte gUnknown_080E0C38
_0808A3AC: .4byte gUnknown_08C8796C
_0808A3B0: .4byte gUnknown_03005B80

	thumb_func_start sub_808A3B4
sub_808A3B4: @ 0x0808A3B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	str r0, [sp, #0x18]
	ldr r1, _0808A52C @ =gUnknown_030000C8
	adds r0, r5, r1
	ldr r2, _0808A530 @ =gUnknown_030000F8
	adds r2, r5, r2
	str r2, [sp, #0x1c]
	ldr r3, _0808A534 @ =gUnknown_0300030C
	adds r3, r5, r3
	str r3, [sp, #0x20]
	adds r1, #0xf0
	adds r1, r5, r1
	str r1, [sp, #0x24]
	ldr r2, _0808A538 @ =gUnknown_0300033C
	adds r7, r5, r2
	ldr r3, _0808A53C @ =gUnknown_030002DC
	adds r3, r5, r3
	str r3, [sp, #0x28]
	ldr r1, _0808A540 @ =gUnknown_03000278
	adds r1, r5, r1
	str r1, [sp, #0x2c]
	ldr r2, _0808A544 @ =gUnknown_03000188
	adds r2, r5, r2
	str r2, [sp, #0x30]
	ldr r3, _0808A548 @ =gUnknown_030003CC
	adds r3, r5, r3
	str r3, [sp, #0x34]
	ldr r2, _0808A54C @ =gUnknown_03000758
	adds r1, r5, r2
	ldr r6, _0808A550 @ =gUnknown_080E0C44
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r3, r4, #2
	mov sl, r3
	adds r1, r3, r6
	ldr r2, [r1]
	adds r1, r4, #1
	lsls r1, r1, #2
	mov sb, r1
	adds r1, r1, r6
	ldrh r3, [r1]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #5
	str r1, [sp, #0xc]
	adds r1, r4, #2
	lsls r1, r1, #2
	mov r8, r1
	add r6, r8
	ldrb r1, [r6]
	str r1, [sp, #0x10]
	movs r6, #0
	str r6, [sp, #0x14]
	movs r1, #0
	bl sub_806A568
	ldr r3, _0808A554 @ =0x000003C9
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	movs r2, #0x60
	bl sub_806A568
	ldr r3, _0808A558 @ =gUnknown_03000128
	adds r3, r5, r3
	str r3, [sp, #0x1c]
	ldr r0, _0808A55C @ =gUnknown_080E0C8C
	add sl, r0
	mov r1, sl
	ldr r2, [r1]
	add sb, r0
	mov r1, sb
	ldrh r3, [r1]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	movs r1, #0x86
	mov sb, r1
	str r1, [sp, #8]
	movs r1, #5
	str r1, [sp, #0xc]
	add r8, r0
	mov r1, r8
	ldrb r0, [r1]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl sub_806A568
	ldr r1, _0808A560 @ =gUnknown_080E0CD4
	lsls r4, r4, #1
	adds r0, r4, #3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r0, r4, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r5, #0x5a
	str r5, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	adds r4, #5
	lsls r4, r4, #2
	adds r4, r4, r1
	ldrb r0, [r4]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x20]
	movs r1, #0
	bl sub_806A568
	ldr r3, _0808A564 @ =0x000003C5
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #5
	str r2, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x30]
	movs r1, #0
	movs r2, #1
	bl sub_806A568
	movs r5, #0
	movs r4, #0x50
	movs r6, #0x60
_0808A4FE:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _0808A56C
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x11
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #2
	ldr r3, _0808A568 @ =0x0000045F
	bl sub_806A568
	b _0808A592
	.align 2, 0
_0808A52C: .4byte gUnknown_030000C8
_0808A530: .4byte gUnknown_030000F8
_0808A534: .4byte gUnknown_0300030C
_0808A538: .4byte gUnknown_0300033C
_0808A53C: .4byte gUnknown_030002DC
_0808A540: .4byte gUnknown_03000278
_0808A544: .4byte gUnknown_03000188
_0808A548: .4byte gUnknown_030003CC
_0808A54C: .4byte gUnknown_03000758
_0808A550: .4byte gUnknown_080E0C44
_0808A554: .4byte 0x000003C9
_0808A558: .4byte gUnknown_03000128
_0808A55C: .4byte gUnknown_080E0C8C
_0808A560: .4byte gUnknown_080E0CD4
_0808A564: .4byte 0x000003C5
_0808A568: .4byte 0x0000045F
_0808A56C:
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #2
	ldr r3, _0808A708 @ =0x0000045F
	bl sub_806A568
_0808A592:
	lsls r1, r5, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r1, r3
	adds r7, #0x30
	ldr r2, _0808A70C @ =0xFFF80000
	adds r0, r4, r2
	lsrs r4, r0, #0x10
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	ble _0808A4FE
	movs r5, #0
	ldr r7, [sp, #0x2c]
	adds r7, #0x30
_0808A5B0:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r3, [sp, #0x24]
	adds r0, r3, r0
	movs r1, #0x83
	lsls r1, r1, #5
	adds r2, r1, #0
	adds r1, r4, #0
	orrs r1, r2
	str r1, [sp]
	movs r1, #0x4c
	str r1, [sp, #4]
	movs r1, #0x5a
	str r1, [sp, #8]
	movs r1, #6
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r2, #0x40
	ldr r3, _0808A710 @ =0x000003CE
	bl sub_806A568
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808A5B0
	movs r5, #0
	movs r3, #0x80
	lsls r3, r3, #1
	movs r6, #0x4c
	movs r4, #0x5a
_0808A5FA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r2, [sp, #0x34]
	adds r1, r1, r2
	lsls r2, r0, #8
	strh r2, [r1]
	strh r3, [r1, #2]
	strh r3, [r1, #4]
	strh r6, [r1, #6]
	strh r4, [r1, #8]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0808A5FA
	ldr r3, [sp, #0x34]
	ldrh r0, [r3, #0x12]
	subs r0, #1
	movs r6, #0
	strh r0, [r3, #0x12]
	ldrh r0, [r3, #0x20]
	subs r0, #1
	strh r0, [r3, #0x20]
	ldrh r0, [r3, #0x1e]
	subs r0, #1
	strh r0, [r3, #0x1e]
	ldrh r0, [r3, #0x2c]
	subs r0, #1
	strh r0, [r3, #0x2c]
	movs r3, #0xf3
	lsls r3, r3, #2
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [sp]
	movs r4, #0xb4
	str r4, [sp, #4]
	movs r0, #0x8c
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	movs r1, #0
	movs r2, #0x14
	bl sub_806A568
	ldr r3, _0808A714 @ =0x000003CA
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0x74
	mov sb, r0
	str r0, [sp, #8]
	movs r1, #5
	mov r8, r1
	str r1, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	movs r1, #0
	movs r2, #0x40
	bl sub_806A568
	str r7, [sp, #0x2c]
	movs r3, #0xf2
	lsls r3, r3, #2
	str r5, [sp]
	str r4, [sp, #4]
	mov r2, sb
	str r2, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x48
	bl sub_806A568
	movs r5, #0
	ldr r1, _0808A718 @ =gUnknown_080E05E4
	mov r8, r1
	ldr r0, _0808A71C @ =gUnknown_080E0BB8
	ldrb r0, [r0]
	lsls r7, r0, #4
_0808A6AE:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r2, #0xff
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r3, [sp, #0x18]
	adds r0, r3, r0
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	movs r1, #5
	str r1, [sp, #0xc]
	adds r1, r4, r7
	add r1, r8
	ldrb r1, [r1]
	subs r1, #0x20
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	movs r2, #2
	ldr r3, _0808A708 @ =0x0000045F
	bl sub_806A568
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0xf
	ble _0808A6AE
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A708: .4byte 0x0000045F
_0808A70C: .4byte 0xFFF80000
_0808A710: .4byte 0x000003CE
_0808A714: .4byte 0x000003CA
_0808A718: .4byte gUnknown_080E05E4
_0808A71C: .4byte gUnknown_080E0BB8

	thumb_func_start sub_808A720
sub_808A720: @ 0x0808A720
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0808A75C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r1, _0808A760 @ =gUnknown_0300033C
	adds r7, r0, r1
	ldr r2, _0808A764 @ =gUnknown_0300030C
	adds r2, r2, r0
	mov sb, r2
	ldr r3, _0808A768 @ =IWRAM_START+4
	adds r3, r3, r0
	mov sl, r3
	ldr r0, _0808A76C @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, #0x1d
	bls _0808A774
	ldr r0, _0808A770 @ =gUnknown_080E0BB8
	str r0, [sp]
	movs r1, #0x3f
	mov r8, r1
	b _0808A77C
	.align 2, 0
_0808A75C: .4byte gCurTask
_0808A760: .4byte gUnknown_0300033C
_0808A764: .4byte gUnknown_0300030C
_0808A768: .4byte IWRAM_START+4
_0808A76C: .4byte gUnknown_03005B64
_0808A770: .4byte gUnknown_080E0BB8
_0808A774:
	ldr r2, _0808A7E4 @ =gUnknown_080E0BF7
	str r2, [sp]
	movs r3, #0x39
	mov r8, r3
_0808A77C:
	bl sub_808B18C
	ldr r5, _0808A7E8 @ =gUnknown_030022B8
	ldrh r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0808A78E
	b _0808A912
_0808A78E:
	ldr r0, _0808A7EC @ =0x0000070B
	adds r4, r6, r0
	ldrb r1, [r4]
	str r1, [sp, #4]
	movs r0, #0x6c
	bl m4aSongNumStart
	ldrh r1, [r5]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808A7AC
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_0808A7AC:
	ldrh r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808A7BC
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0808A7BC:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808A7CC
	ldrb r0, [r4]
	adds r0, #0xa
	strb r0, [r4]
_0808A7CC:
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808A7F2
	ldrb r0, [r4]
	subs r0, #0xa
	cmp r0, #0
	bge _0808A7F0
	mov r2, r8
	strb r2, [r4]
	b _0808A7F2
	.align 2, 0
_0808A7E4: .4byte gUnknown_080E0BF7
_0808A7E8: .4byte gUnknown_030022B8
_0808A7EC: .4byte 0x0000070B
_0808A7F0:
	strb r0, [r4]
_0808A7F2:
	ldr r3, _0808A830 @ =0x0000070B
	adds r1, r6, r3
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808A800
	mov r0, r8
	strb r0, [r1]
_0808A800:
	ldrb r0, [r1]
	cmp r0, r8
	bls _0808A80A
	movs r0, #1
	strb r0, [r1]
_0808A80A:
	ldrb r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xa
	bl __umodsi3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bls _0808A838
	ldr r2, _0808A834 @ =0x0000070C
	adds r1, r6, r2
	movs r0, #0xf9
	b _0808A842
	.align 2, 0
_0808A830: .4byte 0x0000070B
_0808A834: .4byte 0x0000070C
_0808A838:
	cmp r4, r0
	bhs _0808A844
	ldr r3, _0808A884 @ =0x0000070C
	adds r1, r6, r3
	movs r0, #7
_0808A842:
	strb r0, [r1]
_0808A844:
	ldr r1, _0808A888 @ =0x0000070B
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	adds r4, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bls _0808A890
	ldr r2, _0808A88C @ =0x0000070D
	adds r1, r6, r2
	movs r0, #0xf9
	b _0808A89A
	.align 2, 0
_0808A884: .4byte 0x0000070C
_0808A888: .4byte 0x0000070B
_0808A88C: .4byte 0x0000070D
_0808A890:
	cmp r4, r0
	bhs _0808A89C
	ldr r3, _0808AA30 @ =0x0000070D
	adds r1, r6, r3
	movs r0, #7
_0808A89A:
	strb r0, [r1]
_0808A89C:
	ldr r0, _0808AA34 @ =0x0000070B
	adds r4, r6, r0
	ldrb r0, [r4]
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x10
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
	ldrb r0, [r4]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x10
	adds r1, r7, #0
	adds r1, #0x50
	strb r0, [r1]
	ldrb r0, [r4]
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x10
	adds r1, r7, #0
	adds r1, #0x80
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r0, #0x30
	bl sub_8004558
	adds r0, r7, #0
	adds r0, #0x60
	bl sub_8004558
	ldr r1, _0808AA38 @ =0x00000709
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808A912
	ldrb r0, [r4]
	ldr r2, [sp]
	adds r0, r0, r2
	subs r0, #1
	ldrb r0, [r0]
	bl sub_808B3A0
_0808A912:
	ldr r7, _0808AA38 @ =0x00000709
	adds r3, r6, r7
	ldrb r2, [r3]
	cmp r2, #1
	bne _0808A952
	ldr r0, _0808AA3C @ =gMPlayTable
	ldr r0, [r0]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	bne _0808A952
	movs r4, #0
	strb r4, [r3]
	mov r0, sb
	adds r0, #0x20
	strb r2, [r0]
	mov r0, sb
	bl sub_8004558
	bl m4aMPlayAllStop
	ldr r1, _0808AA40 @ =0x000006FC
	adds r0, r6, r1
	strb r4, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r6, r2
	str r4, [r0]
	movs r0, #5
	bl sub_808B030
_0808A952:
	ldr r3, _0808AA44 @ =gPressedKeys
	ldrh r1, [r3]
	movs r7, #1
	mov r8, r7
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A9EC
	ldr r0, _0808AA48 @ =0x00000704
	adds r2, r6, r0
	ldr r1, _0808AA4C @ =gUnknown_080E0AAC
	ldr r3, _0808AA34 @ =0x0000070B
	adds r5, r6, r3
	ldrb r0, [r5]
	ldr r7, [sp]
	adds r0, r0, r7
	subs r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	lsrs r0, r0, #0xc
	ldr r2, _0808AA50 @ =0x000002CA
	adds r1, r6, r2
	movs r4, #0
	strb r0, [r1]
	bl m4aMPlayAllStop
	ldr r0, _0808AA54 @ =gUnknown_02002540
	ldr r3, _0808AA58 @ =gSongTable
	ldr r2, _0808AA5C @ =gUnknown_080E0A24
	ldrb r1, [r5]
	adds r1, r1, r7
	subs r1, #1
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldr r1, [r1]
	bl MPlayStart
	ldr r3, _0808AA38 @ =0x00000709
	adds r0, r6, r3
	mov r7, r8
	strb r7, [r0]
	mov r0, sb
	adds r0, #0x20
	strb r4, [r0]
	ldr r1, _0808AA40 @ =0x000006FC
	adds r0, r6, r1
	strb r4, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r6, r2
	str r4, [r0]
	subs r3, #1
	adds r0, r6, r3
	strb r4, [r0]
	ldr r7, _0808AA60 @ =0x0000070A
	adds r0, r6, r7
	strb r4, [r0]
	mov r0, sb
	bl sub_8004558
	ldrb r0, [r5]
	ldr r1, [sp]
	adds r0, r0, r1
	subs r0, #1
	ldrb r0, [r0]
	bl sub_808B3A0
	movs r0, #2
	bl sub_808B030
_0808A9EC:
	ldr r2, _0808AA44 @ =gPressedKeys
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808AAA4
	ldr r3, _0808AA38 @ =0x00000709
	adds r5, r6, r3
	ldrb r0, [r5]
	cmp r0, #1
	bne _0808AA64
	movs r4, #0
	strb r4, [r5]
	mov r0, sb
	adds r0, #0x20
	mov r7, r8
	strb r7, [r0]
	mov r0, sb
	bl sub_8004558
	bl m4aMPlayAllStop
	ldr r1, _0808AA40 @ =0x000006FC
	adds r0, r6, r1
	strb r4, [r0]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r6, r2
	str r4, [r0]
	movs r0, #5
	bl sub_808B030
	b _0808AAA4
	.align 2, 0
_0808AA30: .4byte 0x0000070D
_0808AA34: .4byte 0x0000070B
_0808AA38: .4byte 0x00000709
_0808AA3C: .4byte gMPlayTable
_0808AA40: .4byte 0x000006FC
_0808AA44: .4byte gPressedKeys
_0808AA48: .4byte 0x00000704
_0808AA4C: .4byte gUnknown_080E0AAC
_0808AA50: .4byte 0x000002CA
_0808AA54: .4byte gUnknown_02002540
_0808AA58: .4byte gSongTable
_0808AA5C: .4byte gUnknown_080E0A24
_0808AA60: .4byte 0x0000070A
_0808AA64:
	movs r0, #0
	bl sub_808B030
	movs r0, #0x6b
	bl m4aSongNumStart
	movs r2, #0
	movs r1, #0
	mov r3, sl
	strh r1, [r3]
	movs r7, #1
	strh r7, [r3, #2]
	strh r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #6]
	strh r1, [r3, #0xa]
	movs r0, #0xff
	strh r0, [r3, #8]
	ldr r3, _0808AAF4 @ =0x000006FC
	adds r0, r6, r3
	strb r2, [r0]
	movs r7, #0xe0
	lsls r7, r7, #3
	adds r0, r6, r7
	str r1, [r0]
	movs r0, #2
	strb r0, [r5]
	ldr r0, _0808AAF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808AAFC @ =sub_808AF74
	str r0, [r1, #8]
_0808AAA4:
	ldr r0, _0808AB00 @ =0x0000070E
	adds r2, r6, r0
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xc8
	lsls r1, r1, #0x11
	cmp r0, r1
	ble _0808AABC
	movs r0, #0
	strh r0, [r2]
_0808AABC:
	ldr r1, _0808AB04 @ =0x0000070B
	adds r0, r6, r1
	ldrb r0, [r0]
	ldr r3, [sp]
	adds r0, r0, r3
	subs r0, #1
	ldrb r0, [r0]
	ldrh r2, [r2]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r7, #0
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x9e
	bl sub_808B350
	bl sub_808AB08
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAF4: .4byte 0x000006FC
_0808AAF8: .4byte gCurTask
_0808AAFC: .4byte sub_808AF74
_0808AB00: .4byte 0x0000070E
_0808AB04: .4byte 0x0000070B

	thumb_func_start sub_808AB08
sub_808AB08: @ 0x0808AB08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _0808ADAC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	adds r1, #0xc8
	adds r1, r0, r1
	str r1, [sp]
	ldr r2, _0808ADB0 @ =gUnknown_030000F8
	adds r6, r0, r2
	ldr r3, _0808ADB4 @ =gUnknown_0300030C
	adds r3, r3, r0
	mov sl, r3
	ldr r5, _0808ADB8 @ =gUnknown_0300033C
	adds r4, r0, r5
	ldr r1, _0808ADBC @ =gUnknown_030002DC
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0808ADC0 @ =gUnknown_030002D8
	adds r1, r0, r2
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r3, _0808ADC4 @ =gUnknown_03000188
	adds r3, r0, r3
	str r3, [sp, #8]
	ldr r5, _0808ADC8 @ =gUnknown_030001B8
	adds r5, r0, r5
	str r5, [sp, #0xc]
	ldr r1, _0808ADCC @ =gUnknown_030003CC
	adds r1, r0, r1
	str r1, [sp, #0x10]
	ldr r1, _0808ADD0 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	strh r0, [r1, #2]
	ldr r3, _0808ADD4 @ =gUnknown_030026E0
	ldr r2, _0808ADD8 @ =gUnknown_0300188C
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0808ADDC @ =sub_808DB2C
	str r1, [r0]
	ldr r2, _0808ADE0 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	movs r5, #0
	movs r2, #0x60
	mov sb, r2
	ldr r2, _0808ADE4 @ =gUnknown_080E0C30
_0808AB88:
	movs r0, #0x60
	strh r0, [r4, #0x18]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0808ADE8 @ =0x0000070C
	adds r1, r7, r3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0808ABC8
	cmp r0, #0
	ble _0808ABB0
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x60
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0808ABB0:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808ABC8
	subs r0, r2, r0
	ldrb r0, [r0]
	mov r3, sb
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0808ABC8:
	adds r0, r4, #0
	str r2, [sp, #0x20]
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r5, #0x80
	lsls r5, r5, #9
	adds r0, r0, r5
	adds r4, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x20]
	cmp r0, #1
	ble _0808AB88
	movs r5, #0
_0808ABE6:
	adds r0, r6, #0
	bl sub_80051E8
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	adds r6, #0x30
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0808ABE6
	mov r0, sl
	bl sub_80051E8
	ldr r0, [sp]
	bl sub_80051E8
	mov r0, r8
	bl sub_80051E8
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	mov r0, r8
	bl sub_80051E8
	mov r3, r8
	ldr r0, [r3, #0x10]
	ldr r1, _0808ADEC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldr r5, _0808ADF0 @ =0x00000709
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808AC38
	b _0808AE14
_0808AC38:
	movs r0, #0
	mov ip, r0
	mov sb, r0
	ldr r0, _0808ADF4 @ =0x04000062
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r0, r4
	lsrs r2, r0, #0xc
	adds r5, #0xa
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808AC68
	movs r1, #0x20
	movs r0, #0x20
	mov sb, r0
	subs r5, #1
	adds r0, r7, r5
	strb r1, [r0]
	strb r2, [r3]
	movs r0, #1
	mov ip, r0
_0808AC68:
	movs r2, #0
	ldr r1, _0808ADF8 @ =0x00000714
	adds r3, r7, r1
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808AC92
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r5, _0808ADFC @ =0x00000712
	adds r1, r7, r5
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808AC92:
	ldr r0, _0808AE00 @ =0x04000072
	movs r1, #0
	ldrsh r0, [r0, r1]
	ands r0, r4
	lsrs r2, r0, #0xc
	ldr r5, _0808AE04 @ =0x00000715
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808ACC4
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0808ADFC @ =0x00000712
	adds r1, r7, r0
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808ACC4:
	ldr r0, _0808AE08 @ =0x04000078
	movs r1, #0
	ldrsh r0, [r0, r1]
	ands r0, r4
	lsrs r2, r0, #0xc
	ldr r5, _0808AE0C @ =0x00000716
	adds r3, r7, r5
	ldrb r0, [r3]
	cmp r0, r2
	beq _0808ACF6
	mov r0, sb
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _0808ADFC @ =0x00000712
	adds r1, r7, r0
	movs r0, #0x20
	strb r0, [r1]
	strb r2, [r3]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808ACF6:
	ldr r1, _0808AE10 @ =gSoundInfo
	str r1, [sp, #0x14]
	movs r5, #0
	movs r2, #0xe7
	lsls r2, r2, #3
	adds r2, r7, r2
	str r2, [sp, #0x18]
	movs r3, #0xe3
	lsls r3, r3, #3
	adds r3, r7, r3
	str r3, [sp, #0x1c]
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r0, r0, r7
	mov r8, r0
	ldr r1, _0808ADFC @ =0x00000712
	adds r1, r1, r7
	mov sl, r1
_0808AD1A:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	ldr r3, [sp, #0x18]
	adds r6, r3, r2
	lsls r1, r1, #6
	ldr r0, [sp, #0x14]
	adds r0, #0x70
	adds r4, r0, r1
	ldr r1, [r6]
	ldr r0, [r4]
	cmp r1, r0
	beq _0808AD64
	subs r3, r1, r0
	ldr r0, [sp, #0x1c]
	adds r2, r0, r2
	ldr r0, [r2]
	subs r0, r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bls _0808AD5E
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	movs r0, #0x20
	mov r1, sl
	strb r0, [r1]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
_0808AD5E:
	str r3, [r2]
	ldr r0, [r4]
	str r0, [r6]
_0808AD64:
	lsls r0, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _0808AD1A
	mov r3, ip
	cmp r3, #0
	beq _0808AD8E
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r4, r7, r5
	mov r0, sb
	mov r1, ip
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
_0808AD8E:
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r1, r7, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xc0
	ble _0808AE26
	movs r0, #0xc0
	strh r0, [r1]
	ldr r3, _0808ADFC @ =0x00000712
	adds r1, r7, r3
	movs r0, #4
	strb r0, [r1]
	b _0808AE26
	.align 2, 0
_0808ADAC: .4byte gCurTask
_0808ADB0: .4byte gUnknown_030000F8
_0808ADB4: .4byte gUnknown_0300030C
_0808ADB8: .4byte gUnknown_0300033C
_0808ADBC: .4byte gUnknown_030002DC
_0808ADC0: .4byte gUnknown_030002D8
_0808ADC4: .4byte gUnknown_03000188
_0808ADC8: .4byte gUnknown_030001B8
_0808ADCC: .4byte gUnknown_030003CC
_0808ADD0: .4byte gBgScrollRegs
_0808ADD4: .4byte gUnknown_030026E0
_0808ADD8: .4byte gUnknown_0300188C
_0808ADDC: .4byte sub_808DB2C
_0808ADE0: .4byte gUnknown_03001840
_0808ADE4: .4byte gUnknown_080E0C30
_0808ADE8: .4byte 0x0000070C
_0808ADEC: .4byte 0xFFFFFBFF
_0808ADF0: .4byte 0x00000709
_0808ADF4: .4byte 0x04000062
_0808ADF8: .4byte 0x00000714
_0808ADFC: .4byte 0x00000712
_0808AE00: .4byte 0x04000072
_0808AE04: .4byte 0x00000715
_0808AE08: .4byte 0x04000078
_0808AE0C: .4byte 0x00000716
_0808AE10: .4byte gSoundInfo
_0808AE14:
	movs r5, #0xe2
	lsls r5, r5, #3
	adds r1, r7, r5
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808AF64 @ =0x00000712
	adds r0, r7, r1
	strb r2, [r0]
_0808AE26:
	movs r5, #0
	ldr r6, _0808AF68 @ =0x000003CA
_0808AE2A:
	ldr r2, [sp, #4]
	ldrh r0, [r2, #0xa]
	cmp r0, r6
	beq _0808AE58
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r0, r0, #8
	strh r0, [r1]
	movs r0, #0xe2
	lsls r0, r0, #3
	adds r2, r7, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_0808AE58:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	ldr r5, [sp, #0xc]
	adds r0, r5, r0
	lsls r1, r1, #2
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	bl sub_8004860
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808AE2A
	movs r3, #0xe2
	lsls r3, r3, #3
	adds r4, r7, r3
	ldr r2, _0808AF6C @ =gUnknown_08097AA4
	ldr r5, _0808AF64 @ =0x00000712
	adds r3, r7, r5
	ldrb r1, [r3]
	lsls r1, r1, #2
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808AEAC
	subs r0, #1
	strb r0, [r3]
_0808AEAC:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0808AEB8
	movs r0, #0
	strh r0, [r4]
_0808AEB8:
	movs r5, #0
_0808AEBA:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r2, [sp, #0xc]
	adds r0, r2, r0
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _0808AEBA
	ldr r0, [sp, #4]
	bl sub_80051E8
	ldr r3, _0808AF6C @ =gUnknown_08097AA4
	mov r8, r3
	movs r0, #0xe1
	lsls r0, r0, #3
	adds r5, r7, r0
	ldrb r1, [r5]
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #7
	adds r0, #0x5e
	ldr r1, [sp, #8]
	strh r0, [r1, #0x16]
	ldr r0, [sp, #8]
	bl sub_80051E8
	ldrb r0, [r5]
	ands r4, r0
	lsls r4, r4, #4
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #7
	movs r0, #0x3a
	subs r0, r0, r1
	ldr r2, [sp, #8]
	strh r0, [r2, #0x16]
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x10]
	ldr r0, [sp, #8]
	bl sub_80051E8
	ldr r3, [sp, #8]
	ldr r0, [r3, #0x10]
	ldr r1, _0808AF70 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF64: .4byte 0x00000712
_0808AF68: .4byte 0x000003CA
_0808AF6C: .4byte gUnknown_08097AA4
_0808AF70: .4byte 0xFFFFFBFF

	thumb_func_start sub_808AF74
sub_808AF74: @ 0x0808AF74
	push {r4, r5, r6, lr}
	ldr r0, _0808AFB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0808AFB4 @ =gUnknown_03000278
	adds r2, r5, r0
	ldr r1, _0808AFB8 @ =gUnknown_030006FC
	adds r4, r5, r1
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	ldr r3, _0808AFBC @ =gUnknown_03000709
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808AFC4
	adds r0, r2, #0
	bl sub_8004558
	ldrb r0, [r4]
	cmp r0, #0x2c
	bls _0808AFDA
	ldr r1, _0808AFC0 @ =IWRAM_START+4
	adds r0, r5, r1
	bl sub_802D4CC
	b _0808AFDA
	.align 2, 0
_0808AFB0: .4byte gCurTask
_0808AFB4: .4byte gUnknown_03000278
_0808AFB8: .4byte gUnknown_030006FC
_0808AFBC: .4byte gUnknown_03000709
_0808AFC0: .4byte IWRAM_START+4
_0808AFC4:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _0808AFD2
	adds r0, r2, #0
	bl sub_8004558
_0808AFD2:
	ldr r2, _0808AFF8 @ =IWRAM_START+4
	adds r0, r5, r2
	bl sub_802D4CC
_0808AFDA:
	ldr r3, _0808AFFC @ =0x000006FC
	adds r1, r6, r3
	ldrb r0, [r1]
	cmp r0, #0x3c
	bls _0808B01E
	ldr r2, _0808B000 @ =0x00000709
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808B00C
	ldr r0, _0808B004 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808B008 @ =sub_808B2C8
	b _0808B01C
	.align 2, 0
_0808AFF8: .4byte IWRAM_START+4
_0808AFFC: .4byte 0x000006FC
_0808B000: .4byte 0x00000709
_0808B004: .4byte gCurTask
_0808B008: .4byte sub_808B2C8
_0808B00C:
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	bl sub_808B030
	ldr r0, _0808B028 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808B02C @ =sub_808A720
_0808B01C:
	str r0, [r1, #8]
_0808B01E:
	bl sub_808AB08
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B028: .4byte gCurTask
_0808B02C: .4byte sub_808A720

	thumb_func_start sub_808B030
sub_808B030: @ 0x0808B030
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808B058 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	ldr r1, _0808B05C @ =gUnknown_030002D8
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r4, #5
	bls _0808B04E
	b _0808B178
_0808B04E:
	lsls r0, r4, #2
	ldr r1, _0808B060 @ =_0808B064
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B058: .4byte gCurTask
_0808B05C: .4byte gUnknown_030002D8
_0808B060: .4byte _0808B064
_0808B064: @ jump table
	.4byte _0808B07C @ case 0
	.4byte _0808B0A8 @ case 1
	.4byte _0808B0D4 @ case 2
	.4byte _0808B100 @ case 3
	.4byte _0808B12C @ case 4
	.4byte _0808B154 @ case 5
_0808B07C:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B0A0 @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B0A4 @ =0x000003CA
	b _0808B176
	.align 2, 0
_0808B0A0: .4byte 0x00000299
_0808B0A4: .4byte 0x000003CA
_0808B0A8:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B0CC @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B0D0 @ =0x000003CD
	b _0808B176
	.align 2, 0
_0808B0CC: .4byte 0x00000299
_0808B0D0: .4byte 0x000003CD
_0808B0D4:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	ldr r1, _0808B0FC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
	.align 2, 0
_0808B0FC: .4byte 0xFFFFFBFF
_0808B100:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	ldr r1, _0808B128 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
	.align 2, 0
_0808B128: .4byte 0xFFFFFBFF
_0808B12C:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x30
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r3, #0x10]
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xf2
	lsls r0, r0, #2
	b _0808B176
_0808B154:
	movs r3, #0xb6
	lsls r3, r3, #2
	adds r1, r2, r3
	subs r3, #0x60
	adds r0, r2, r3
	str r0, [r1]
	adds r3, r0, #0
	ldr r0, _0808B184 @ =0x00000299
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xa6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808B188 @ =0x000003CB
_0808B176:
	strh r0, [r3, #0xa]
_0808B178:
	adds r0, r3, #0
	bl sub_8004558
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B184: .4byte 0x00000299
_0808B188: .4byte 0x000003CB

	thumb_func_start sub_808B18C
sub_808B18C: @ 0x0808B18C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808B1B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _0808B1B4 @ =gUnknown_030002D8
	adds r0, r5, r1
	ldr r3, [r0]
	ldr r1, _0808B1B8 @ =gUnknown_03000709
	adds r0, r5, r1
	ldrb r7, [r0]
	cmp r7, #0
	beq _0808B1BC
	cmp r7, #1
	beq _0808B1E4
	b _0808B2A0
	.align 2, 0
_0808B1B0: .4byte gCurTask
_0808B1B4: .4byte gUnknown_030002D8
_0808B1B8: .4byte gUnknown_03000709
_0808B1BC:
	ldrh r1, [r3, #0xa]
	ldr r0, _0808B1D8 @ =0x000003CB
	cmp r1, r0
	bne _0808B1DC
	adds r0, r3, #0
	bl sub_8004558
	cmp r0, #0
	bne _0808B2A0
	movs r0, #1
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B1D8: .4byte 0x000003CB
_0808B1DC:
	adds r0, r3, #0
	bl sub_8004558
	b _0808B2A0
_0808B1E4:
	ldr r0, _0808B21C @ =gUnknown_03000700
	adds r2, r5, r0
	adds r0, #4
	adds r1, r5, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	lsrs r0, r0, #0x10
	ldr r1, _0808B220 @ =gUnknown_030006FC
	adds r4, r5, r1
	strb r0, [r4]
	adds r0, r3, #0
	bl sub_8004558
	ldrb r0, [r4]
	cmp r0, #0x36
	bls _0808B228
	ldr r0, _0808B224 @ =gUnknown_0300070A
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808B228
	strb r7, [r1]
	movs r0, #3
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B21C: .4byte gUnknown_03000700
_0808B220: .4byte gUnknown_030006FC
_0808B224: .4byte gUnknown_0300070A
_0808B228:
	ldr r1, _0808B248 @ =0x000006FC
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0808B250
	ldr r0, _0808B24C @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808B250
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B248: .4byte 0x000006FC
_0808B24C: .4byte 0x0000070A
_0808B250:
	ldr r1, _0808B270 @ =0x000006FC
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0x72
	bls _0808B278
	ldr r0, _0808B274 @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808B278
	movs r0, #3
	strb r0, [r1]
	bl sub_808B030
	b _0808B2A0
	.align 2, 0
_0808B270: .4byte 0x000006FC
_0808B274: .4byte 0x0000070A
_0808B278:
	ldr r1, _0808B2A8 @ =0x000006FC
	adds r5, r6, r1
	ldrb r0, [r5]
	cmp r0, #0x77
	bls _0808B2A0
	ldr r0, _0808B2AC @ =0x0000070A
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #3
	bne _0808B2A0
	movs r4, #0
	strb r4, [r1]
	movs r0, #2
	bl sub_808B030
	movs r1, #0xe0
	lsls r1, r1, #3
	adds r0, r6, r1
	str r4, [r0]
	strb r4, [r5]
_0808B2A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2A8: .4byte 0x000006FC
_0808B2AC: .4byte 0x0000070A

	thumb_func_start sub_808B2B0
sub_808B2B0: @ 0x0808B2B0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0808B2C4 @ =0x00000784
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_0808B2C4: .4byte 0x00000784

	thumb_func_start sub_808B2C8
sub_808B2C8: @ 0x0808B2C8
	push {lr}
	ldr r1, _0808B2E4 @ =gUnknown_03005B50
	ldr r0, _0808B2E8 @ =0x06010000
	str r0, [r1]
	ldr r1, _0808B2EC @ =gUnknown_03005B54
	movs r0, #0
	str r0, [r1]
	ldr r0, _0808B2F0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0808B2E4: .4byte gUnknown_03005B50
_0808B2E8: .4byte 0x06010000
_0808B2EC: .4byte gUnknown_03005B54
_0808B2F0: .4byte gCurTask

	thumb_func_start sub_808B2F4
sub_808B2F4: @ 0x0808B2F4
	push {lr}
	sub sp, #0x18
	ldrh r0, [r0, #6]
	ldr r2, _0808B338 @ =gDispCnt
	ldr r3, _0808B33C @ =0x00001141
	adds r1, r3, #0
	strh r1, [r2]
	ldr r3, _0808B340 @ =gBgCntRegs
	movs r2, #0
	ldr r1, _0808B344 @ =0x00000703
	strh r1, [r3]
	ldr r1, _0808B348 @ =gBgScrollRegs
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	ldr r1, _0808B34C @ =gUnknown_03000048
	adds r0, r0, r1
	movs r1, #0x20
	str r1, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r1, #0
	movs r2, #7
	movs r3, #0xa9
	bl sub_806B854
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0808B338: .4byte gDispCnt
_0808B33C: .4byte 0x00001141
_0808B340: .4byte gBgCntRegs
_0808B344: .4byte 0x00000703
_0808B348: .4byte gBgScrollRegs
_0808B34C: .4byte gUnknown_03000048

	thumb_func_start sub_808B350
sub_808B350: @ 0x0808B350
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _0808B394 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0
	ldr r2, _0808B398 @ =gUnknown_03000412
	adds r4, r0, r2
	lsrs r6, r1, #0x10
	ldr r1, _0808B39C @ =gUnknown_030003FC
	adds r5, r0, r1
_0808B370:
	strh r6, [r4]
	mov r2, r8
	strh r2, [r4, #2]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r6, #0xa
	adds r5, #0x30
	adds r7, #1
	cmp r7, #0xf
	bls _0808B370
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B394: .4byte gCurTask
_0808B398: .4byte gUnknown_03000412
_0808B39C: .4byte gUnknown_030003FC

	thumb_func_start sub_808B3A0
sub_808B3A0: @ 0x0808B3A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0808B3F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r6, #0
	ldr r1, _0808B3F4 @ =gUnknown_080E05E4
	mov r8, r1
	ldr r1, _0808B3F8 @ =gUnknown_0300041C
	adds r4, r0, r1
	subs r1, #0x20
	adds r5, r0, r1
_0808B3BE:
	lsls r0, r7, #4
	adds r0, r6, r0
	add r0, r8
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x20
	strb r0, [r4]
	movs r0, #0xff
	strb r0, [r4, #1]
	cmp r1, #0
	bne _0808B3D6
	strb r1, [r4]
_0808B3D6:
	adds r0, r5, #0
	bl sub_8004558
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #0xf
	bls _0808B3BE
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3F0: .4byte gCurTask
_0808B3F4: .4byte gUnknown_080E05E4
_0808B3F8: .4byte gUnknown_0300041C

	thumb_func_start sub_808B3FC_CreateIntro
sub_808B3FC_CreateIntro: @ 0x0808B3FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0808B518 @ =sub_808D598
	ldr r1, _0808B51C @ =0x00000F64
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0808B520 @ =gUnknown_03000F34
	adds r2, r1, r0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2]
	ldr r0, _0808B524 @ =gUnknown_03000F36
	adds r2, r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2]
	ldr r0, _0808B528 @ =gUnknown_03000F38
	adds r2, r1, r0
	movs r0, #2
	strh r0, [r2]
	ldr r2, _0808B52C @ =gUnknown_03000F42
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, #2
	adds r0, r1, r2
	strh r4, [r0]
	subs r2, #2
	adds r0, r1, r2
	strh r4, [r0]
	ldr r0, _0808B530 @ =gUnknown_03000F3A
	adds r2, r1, r0
	movs r0, #0x20
	strh r0, [r2]
	ldr r2, _0808B534 @ =gUnknown_03000F3C
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0808B538 @ =gUnknown_03000F3D
	adds r1, r1, r3
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #9
	mov r8, r0
	movs r7, #8
_0808B46C:
	adds r5, r4, #1
	mov r0, r8
	adds r1, r7, #0
	bl Div
	ldr r2, _0808B53C @ =0x00000F34
	adds r1, r6, r2
	ldrh r1, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	lsls r4, r4, #1
	movs r3, #0xad
	lsls r3, r3, #2
	adds r0, r6, r3
	adds r0, r0, r4
	strh r1, [r0]
	mov r0, r8
	bl Div
	ldr r2, _0808B540 @ =0x00000DF4
	adds r1, r6, r2
	adds r1, r1, r4
	strh r0, [r1]
	adds r7, #8
	adds r4, r5, #0
	cmp r4, #0x9f
	ble _0808B46C
	movs r3, #0x9c
	lsls r3, r3, #2
	adds r4, r6, r3
	movs r2, #0
	movs r1, #0
	movs r0, #1
	strh r0, [r4]
	strh r1, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	adds r0, #0xfe
	strh r0, [r4, #6]
	ldr r0, _0808B544 @ =0x00003FBF
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	movs r0, #0x9f
	lsls r0, r0, #2
	adds r1, r6, r0
	strb r2, [r1]
	strb r2, [r1, #2]
	ldr r3, _0808B548 @ =0x00000F38
	adds r0, r6, r3
	ldrh r0, [r0]
	strh r0, [r1, #0x34]
	movs r0, #0xe
	strb r0, [r1, #1]
	ldr r0, _0808B54C @ =gUnknown_080E1054
	str r0, [r1, #4]
	ldr r0, _0808B550 @ =gUnknown_080E0EF4
	str r0, [r1, #8]
	ldr r3, _0808B554 @ =0x000002B2
	adds r0, r6, r3
	strb r2, [r0]
	ldr r0, _0808B558 @ =gUnknown_03005B80
	str r1, [r0]
	str r6, [r0, #4]
	adds r0, r6, #0
	bl sub_808B768
	movs r0, #1
	bl m4aSongNumStart
	ldr r2, _0808B55C @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r2]
	adds r0, r4, #0
	bl sub_802D4CC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B518: .4byte sub_808D598
_0808B51C: .4byte 0x00000F64
_0808B520: .4byte gUnknown_03000F34
_0808B524: .4byte gUnknown_03000F36
_0808B528: .4byte gUnknown_03000F38
_0808B52C: .4byte gUnknown_03000F42
_0808B530: .4byte gUnknown_03000F3A
_0808B534: .4byte gUnknown_03000F3C
_0808B538: .4byte gUnknown_03000F3D
_0808B53C: .4byte 0x00000F34
_0808B540: .4byte 0x00000DF4
_0808B544: .4byte 0x00003FBF
_0808B548: .4byte 0x00000F38
_0808B54C: .4byte gUnknown_080E1054
_0808B550: .4byte gUnknown_080E0EF4
_0808B554: .4byte 0x000002B2
_0808B558: .4byte gUnknown_03005B80
_0808B55C: .4byte gUnknown_03001840

	thumb_func_start sub_808B560
sub_808B560: @ 0x0808B560
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0808B64C @ =0x00000F34
	adds r1, r7, r0
	movs r6, #0
	movs r4, #0
	movs r0, #0xa0
	lsls r0, r0, #4
	strh r0, [r1]
	ldr r3, _0808B650 @ =0x00000F36
	adds r1, r7, r3
	movs r0, #3
	strh r0, [r1]
	ldr r1, _0808B654 @ =0x00000F38
	adds r0, r7, r1
	movs r3, #2
	strh r3, [r0]
	adds r1, #0xa
	adds r0, r7, r1
	strb r6, [r0]
	subs r1, #2
	adds r0, r7, r1
	strh r4, [r0]
	subs r1, #2
	adds r0, r7, r1
	strh r4, [r0]
	ldr r0, _0808B658 @ =0x00000F3A
	adds r1, r7, r0
	movs r5, #0x20
	movs r0, #0x20
	strh r0, [r1]
	ldr r1, _0808B65C @ =0x00000F3C
	adds r0, r7, r1
	strb r6, [r0]
	adds r1, #1
	adds r0, r7, r1
	movs r2, #1
	strb r2, [r0]
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r1, r7, r0
	strh r2, [r1]
	strh r4, [r1, #4]
	strh r3, [r1, #2]
	movs r3, #0x80
	lsls r3, r3, #2
	mov r8, r3
	mov r0, r8
	strh r0, [r1, #6]
	ldr r0, _0808B660 @ =0x00003FBF
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	adds r0, r7, #0
	bl sub_808B884
	ldr r1, _0808B664 @ =gDispCnt
	ldr r0, _0808B668 @ =0x00001641
	strh r0, [r1]
	ldr r1, _0808B66C @ =gBgCntRegs
	ldr r0, _0808B670 @ =0x00001F04
	strh r0, [r1]
	ldr r0, _0808B674 @ =0x00009D0A
	strh r0, [r1, #2]
	ldr r0, _0808B678 @ =0x00005A81
	strh r0, [r1, #4]
	str r4, [sp]
	ldr r1, _0808B67C @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	str r3, [r1, #4]
	ldr r0, _0808B680 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0808B684 @ =gUnknown_03004D80
	strb r6, [r2]
	ldr r0, _0808B688 @ =gUnknown_03002280
	strb r6, [r0]
	strb r6, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	strb r5, [r0, #3]
	strb r6, [r2, #1]
	strb r6, [r0, #4]
	strb r6, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r5, [r0, #7]
	strb r6, [r2, #2]
	strb r6, [r0, #8]
	strb r6, [r0, #9]
	strb r1, [r0, #0xa]
	strb r5, [r0, #0xb]
	ldr r1, _0808B68C @ =gBgScrollRegs
	movs r0, #8
	strh r0, [r1, #4]
	mov r0, r8
	strh r0, [r1, #6]
	adds r1, r7, #0
	str r3, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808B690 @ =0x0600D000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r0, _0808B694 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bhi _0808B698
	movs r0, #0x84
	lsls r0, r0, #1
	b _0808B69A
	.align 2, 0
_0808B64C: .4byte 0x00000F34
_0808B650: .4byte 0x00000F36
_0808B654: .4byte 0x00000F38
_0808B658: .4byte 0x00000F3A
_0808B65C: .4byte 0x00000F3C
_0808B660: .4byte 0x00003FBF
_0808B664: .4byte gDispCnt
_0808B668: .4byte 0x00001641
_0808B66C: .4byte gBgCntRegs
_0808B670: .4byte 0x00001F04
_0808B674: .4byte 0x00009D0A
_0808B678: .4byte 0x00005A81
_0808B67C: .4byte 0x040000D4
_0808B680: .4byte 0x85004000
_0808B684: .4byte gUnknown_03004D80
_0808B688: .4byte gUnknown_03002280
_0808B68C: .4byte gBgScrollRegs
_0808B690: .4byte 0x0600D000
_0808B694: .4byte gUnknown_03005B64
_0808B698:
	ldr r0, _0808B73C @ =0x00000109
_0808B69A:
	strh r0, [r7, #0x1c]
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x1a
	strh r0, [r1, #0x26]
	movs r0, #0xa
	strh r0, [r1, #0x28]
	adds r0, r1, #0
	adds r0, #0x2a
	strb r5, [r0]
	movs r0, #6
	strh r0, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	ldr r2, _0808B740 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808B744 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0808B748 @ =gBgCntRegs
	ldrh r1, [r2, #4]
	ldr r0, _0808B74C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2, #4]
	ldr r0, _0808B750 @ =gBldRegs
	strh r4, [r0]
	ldr r2, _0808B754 @ =gUnknown_03001840
	ldr r0, [r2]
	ldr r1, _0808B758 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0808B75C @ =0x06008000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0808B760 @ =0x0600E800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _0808B764 @ =0x00000105
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x20
	strh r1, [r0, #0x26]
	movs r1, #0x40
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0x6a
	strb r5, [r1]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #2
	bl m4aSongNumStart
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r7, r1
	bl sub_802D4CC
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B73C: .4byte 0x00000109
_0808B740: .4byte gDispCnt
_0808B744: .4byte 0x0000FEFF
_0808B748: .4byte gBgCntRegs
_0808B74C: .4byte 0x0000DFFF
_0808B750: .4byte gBldRegs
_0808B754: .4byte gUnknown_03001840
_0808B758: .4byte 0xFFFF7FFF
_0808B75C: .4byte 0x06008000
_0808B760: .4byte 0x0600E800
_0808B764: .4byte 0x00000105

	thumb_func_start sub_808B768
sub_808B768: @ 0x0808B768
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, _0808B84C @ =gDispCnt
	ldr r0, _0808B850 @ =0x00001441
	strh r0, [r1]
	ldr r1, _0808B854 @ =gBgCntRegs
	movs r5, #0
	movs r4, #0
	ldr r0, _0808B858 @ =0x00001F04
	strh r0, [r1]
	ldr r0, _0808B85C @ =0x00009D0A
	strh r0, [r1, #2]
	ldr r0, _0808B860 @ =0x00007A81
	strh r0, [r1, #4]
	ldr r2, _0808B864 @ =gUnknown_03004D80
	strb r5, [r2]
	ldr r0, _0808B868 @ =gUnknown_03002280
	strb r5, [r0]
	strb r5, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r6, #0x20
	strb r6, [r0, #3]
	strb r5, [r2, #1]
	strb r5, [r0, #4]
	strb r5, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r6, [r0, #7]
	strb r5, [r2, #2]
	strb r5, [r0, #8]
	strb r5, [r0, #9]
	strb r1, [r0, #0xa]
	strb r6, [r0, #0xb]
	str r4, [sp]
	ldr r1, _0808B86C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r8, r0
	str r0, [r1, #4]
	ldr r0, _0808B870 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808B874 @ =gBgScrollRegs
	strh r4, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #8
	strh r0, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	strh r4, [r1]
	strh r4, [r1, #2]
	adds r0, r7, #0
	adds r0, #0x80
	ldr r1, _0808B878 @ =0x06004000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0808B87C @ =0x0600F800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0x60
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0xaa
	strb r5, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	mov r0, r8
	str r0, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808B880 @ =0x0600D000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	movs r0, #0x83
	lsls r0, r0, #1
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	strh r6, [r7, #0x26]
	strh r6, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r5, [r0]
	movs r0, #6
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B84C: .4byte gDispCnt
_0808B850: .4byte 0x00001441
_0808B854: .4byte gBgCntRegs
_0808B858: .4byte 0x00001F04
_0808B85C: .4byte 0x00009D0A
_0808B860: .4byte 0x00007A81
_0808B864: .4byte gUnknown_03004D80
_0808B868: .4byte gUnknown_03002280
_0808B86C: .4byte 0x040000D4
_0808B870: .4byte 0x85004000
_0808B874: .4byte gBgScrollRegs
_0808B878: .4byte 0x06004000
_0808B87C: .4byte 0x0600F800
_0808B880: .4byte 0x0600D000

	thumb_func_start sub_808B884
sub_808B884: @ 0x0808B884
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0808B98C @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r5, [r0, #6]
	ldr r0, _0808B990 @ =0x06010000
	mov sb, r0
	adds r3, r7, #0
	adds r3, #0xc0
	str r0, [r3, #4]
	movs r0, #0xb4
	lsls r0, r0, #4
	add sb, r0
	movs r1, #0
	mov r8, r1
	movs r4, #0
	ldr r0, _0808B994 @ =0x0000033E
	strh r0, [r3, #0xa]
	adds r1, r7, #0
	adds r1, #0xe0
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	strh r4, [r3, #0x16]
	movs r0, #0x82
	strh r0, [r3, #0x18]
	strh r4, [r3, #8]
	adds r0, #0x7e
	strh r0, [r3, #0x1a]
	strh r4, [r3, #0x1c]
	adds r0, r7, #0
	adds r0, #0xe2
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	mov r2, r8
	strb r2, [r0]
	str r4, [r3, #0x10]
	adds r0, r3, #0
	bl sub_8004558
	adds r3, r7, #0
	adds r3, #0xf0
	mov r0, sb
	str r0, [r3, #4]
	ldr r0, _0808B998 @ =gUnknown_080E0D64
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	lsls r1, r5, #3
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #5
	add sb, r0
	ldrh r0, [r1, #4]
	strh r0, [r3, #0xa]
	ldrb r1, [r1, #6]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	ldr r0, _0808B99C @ =0x00000111
	adds r1, r7, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r3, #0x16]
	movs r0, #0x6e
	strh r0, [r3, #0x18]
	strh r4, [r3, #8]
	movs r0, #0xc0
	strh r0, [r3, #0x1a]
	strh r4, [r3, #0x1c]
	movs r1, #0x89
	lsls r1, r1, #1
	adds r0, r7, r1
	strb r6, [r0]
	adds r2, #5
	adds r0, r7, r2
	mov r1, r8
	strb r1, [r0]
	str r4, [r3, #0x10]
	adds r0, r3, #0
	bl sub_8004558
	movs r2, #0
	movs r0, #0x94
	lsls r0, r0, #1
	adds r4, r7, r0
	movs r1, #0x40
	str r1, [sp]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [sp, #4]
	movs r1, #0x60
	mov r8, r1
	movs r0, #0x90
	lsls r0, r0, #1
	adds r6, r7, r0
	adds r3, r5, #0
_0808B95A:
	mov r1, sb
	str r1, [r6, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r2, r1
	lsls r1, r1, #3
	ldr r0, _0808B9A0 @ =gUnknown_080E0D9C
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #5
	add sb, r0
	ldrh r0, [r1, #4]
	strh r0, [r4, #2]
	ldrb r0, [r1, #6]
	strb r0, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x19]
	movs r0, #0x78
	strh r0, [r4, #0xe]
	cmp r2, #1
	bhi _0808B9A4
	mov r1, r8
	strh r1, [r4, #0x10]
	b _0808B9C2
	.align 2, 0
_0808B98C: .4byte gUnknown_03005B64
_0808B990: .4byte 0x06010000
_0808B994: .4byte 0x0000033E
_0808B998: .4byte gUnknown_080E0D64
_0808B99C: .4byte 0x00000111
_0808B9A0: .4byte gUnknown_080E0D9C
_0808B9A4:
	ldr r0, _0808B9B8 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _0808B9BC
	ldr r1, [sp, #4]
	lsls r0, r1, #4
	adds r0, #0x60
	b _0808B9C0
	.align 2, 0
_0808B9B8: .4byte gUnknown_03005B64
_0808B9BC:
	mov r0, sp
	ldrh r0, [r0]
_0808B9C0:
	strh r0, [r4, #0x10]
_0808B9C2:
	movs r5, #0
	strh r5, [r4]
	movs r0, #0xc0
	strh r0, [r4, #0x12]
	strh r5, [r4, #0x14]
	movs r1, #0x10
	mov sl, r1
	mov r0, sl
	strb r0, [r4, #0x1a]
	movs r1, #0
	strb r1, [r4, #0x1d]
	str r5, [r4, #8]
	adds r0, r6, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_8004558
	adds r4, #0x30
	ldr r0, [sp]
	adds r0, #0x12
	str r0, [sp]
	ldr r1, [sp, #4]
	adds r1, #1
	str r1, [sp, #4]
	movs r0, #0x12
	add r8, r0
	adds r6, #0x30
	ldr r2, [sp, #8]
	adds r2, #1
	ldr r3, [sp, #0xc]
	cmp r2, #5
	bls _0808B95A
	movs r1, #0x90
	lsls r1, r1, #2
	adds r3, r7, r1
	mov r2, sb
	str r2, [r3, #4]
	ldr r1, _0808BA6C @ =gUnknown_080E0D9C
	movs r4, #0xaa
	lsls r4, r4, #1
	adds r0, r1, r4
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r3, #0xa]
	adds r4, #2
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r4, #0x98
	lsls r4, r4, #2
	adds r0, r7, r4
	strb r1, [r0]
	ldr r0, _0808BA70 @ =0x00000261
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r3, #0x16]
	movs r0, #0x50
	strh r0, [r3, #0x18]
	strh r5, [r3, #8]
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r3, #0x1a]
	strh r5, [r3, #0x1c]
	ldr r1, _0808BA74 @ =0x00000262
	adds r0, r7, r1
	mov r4, sl
	strb r4, [r0]
	adds r1, #3
	adds r0, r7, r1
	strb r2, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [r3, #0x10]
	adds r0, r3, #0
	bl sub_8004558
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BA6C: .4byte gUnknown_080E0D9C
_0808BA70: .4byte 0x00000261
_0808BA74: .4byte 0x00000262

	thumb_func_start sub_808BA78
sub_808BA78: @ 0x0808BA78
	push {r4, r5, lr}
	ldr r5, _0808BAC4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r2, _0808BAC8 @ =gBldRegs
	ldr r0, _0808BACC @ =gUnknown_03000F3E
	adds r4, r4, r0
	ldrh r1, [r4]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r0, r1
	movs r1, #0
	strh r0, [r2, #2]
	ldrh r0, [r4]
	cmp r0, #0xf
	bls _0808BAB6
	strh r1, [r4]
	movs r0, #0x10
	strh r0, [r2, #2]
	ldr r0, _0808BAD0 @ =gBgScrollRegs
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r1, [r5]
	ldr r0, _0808BAD4 @ =sub_808D5FC
	str r0, [r1, #8]
_0808BAB6:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BAC4: .4byte gCurTask
_0808BAC8: .4byte gBldRegs
_0808BACC: .4byte gUnknown_03000F3E
_0808BAD0: .4byte gBgScrollRegs
_0808BAD4: .4byte sub_808D5FC

	thumb_func_start sub_808BAD8
sub_808BAD8: @ 0x0808BAD8
	push {r4, r5, lr}
	ldr r5, _0808BB34 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r3, _0808BB38 @ =gBldRegs
	ldr r0, _0808BB3C @ =gUnknown_03000F3E
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r2, r1, #1
	lsls r1, r1, #9
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r3, #2]
	ldrh r0, [r4]
	cmp r0, #7
	bls _0808BB28
	ldr r2, _0808BB40 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808BB44 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #2]
	movs r0, #0
	strh r0, [r4]
	ldr r2, _0808BB48 @ =gUnknown_03001840
	ldr r0, [r2]
	ldr r1, _0808BB4C @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	ldr r1, [r5]
	ldr r0, _0808BB50 @ =sub_808BB54
	str r0, [r1, #8]
_0808BB28:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BB34: .4byte gCurTask
_0808BB38: .4byte gBldRegs
_0808BB3C: .4byte gUnknown_03000F3E
_0808BB40: .4byte gDispCnt
_0808BB44: .4byte 0x0000FEFF
_0808BB48: .4byte gUnknown_03001840
_0808BB4C: .4byte 0xFFFF7FFF
_0808BB50: .4byte sub_808BB54

	thumb_func_start sub_808BB54
sub_808BB54: @ 0x0808BB54
	push {r4, r5, r6, lr}
	ldr r6, _0808BBD4 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r0, _0808BBD8 @ =gUnknown_03000F3E
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, #1
	bne _0808BBA8
	ldr r1, _0808BBDC @ =gUnknown_03000080
	adds r0, r4, r1
	ldr r1, _0808BBE0 @ =0x06004000
	str r1, [r0, #4]
	movs r3, #0
	movs r1, #0
	strh r1, [r0, #0xa]
	ldr r2, _0808BBE4 @ =0x0600F800
	str r2, [r0, #0xc]
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	movs r2, #0x61
	strh r2, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	strh r1, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r2, _0808BBE8 @ =gUnknown_030000AA
	adds r1, r4, r2
	strb r3, [r1]
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
_0808BBA8:
	ldrh r0, [r5]
	cmp r0, #2
	bls _0808BBC6
	movs r0, #0
	strh r0, [r5]
	ldr r2, _0808BBEC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r6]
	ldr r0, _0808BBF0 @ =sub_808BBF4
	str r0, [r1, #8]
_0808BBC6:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BBD4: .4byte gCurTask
_0808BBD8: .4byte gUnknown_03000F3E
_0808BBDC: .4byte gUnknown_03000080
_0808BBE0: .4byte 0x06004000
_0808BBE4: .4byte 0x0600F800
_0808BBE8: .4byte gUnknown_030000AA
_0808BBEC: .4byte gDispCnt
_0808BBF0: .4byte sub_808BBF4

	thumb_func_start sub_808BBF4
sub_808BBF4: @ 0x0808BBF4
	push {r4, r5, lr}
	ldr r5, _0808BC40 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r2, _0808BC44 @ =gBldRegs
	ldr r0, _0808BC48 @ =gUnknown_03000F3E
	adds r4, r4, r0
	ldrh r1, [r4]
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r0, r1
	movs r1, #0
	strh r0, [r2, #2]
	ldrh r0, [r4]
	cmp r0, #0xf
	bls _0808BC32
	strh r1, [r4]
	movs r0, #0x10
	strh r0, [r2, #2]
	ldr r0, _0808BC4C @ =gBgScrollRegs
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r1, [r5]
	ldr r0, _0808BC50 @ =sub_808D63C
	str r0, [r1, #8]
_0808BC32:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BC40: .4byte gCurTask
_0808BC44: .4byte gBldRegs
_0808BC48: .4byte gUnknown_03000F3E
_0808BC4C: .4byte gBgScrollRegs
_0808BC50: .4byte sub_808D63C

	thumb_func_start sub_808BC54
sub_808BC54: @ 0x0808BC54
	push {r4, r5, r6, lr}
	ldr r6, _0808BCA8 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r3, _0808BCAC @ =gBldRegs
	ldr r0, _0808BCB0 @ =gUnknown_03000F3E
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r2, r1, #1
	lsls r1, r1, #9
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	movs r5, #0
	strh r1, [r3, #2]
	ldrh r0, [r4]
	cmp r0, #7
	bls _0808BC9A
	ldr r1, [r6]
	ldr r0, _0808BCB4 @ =sub_808BCC4
	str r0, [r1, #8]
	strh r5, [r4]
	ldr r2, _0808BCB8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808BCBC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0808BCC0 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
_0808BC9A:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BCA8: .4byte gCurTask
_0808BCAC: .4byte gBldRegs
_0808BCB0: .4byte gUnknown_03000F3E
_0808BCB4: .4byte sub_808BCC4
_0808BCB8: .4byte gDispCnt
_0808BCBC: .4byte 0x0000FEFF
_0808BCC0: .4byte gBgScrollRegs

	thumb_func_start sub_808BCC4
sub_808BCC4: @ 0x0808BCC4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r7, _0808BCF0 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, r5, #0
	bl sub_808CBA4
	ldr r0, _0808BCF4 @ =gPressedKeys
	ldrh r0, [r0]
	movs r4, #9
	ands r4, r0
	cmp r4, #0
	beq _0808BCF8
	adds r0, r5, #0
	bl sub_808D4DC
	b _0808BD86
	.align 2, 0
_0808BCF0: .4byte gCurTask
_0808BCF4: .4byte gPressedKeys
_0808BCF8:
	ldr r0, _0808BD90 @ =gUnknown_03000F3E
	adds r5, r6, r0
	ldrh r0, [r5]
	cmp r0, #0x3b
	bne _0808BD38
	ldr r1, _0808BD94 @ =gUnknown_03000040
	adds r0, r6, r1
	ldr r1, _0808BD98 @ =0x06008000
	str r1, [r0, #4]
	movs r2, #0
	strh r4, [r0, #0xa]
	ldr r1, _0808BD9C @ =0x0600E800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _0808BDA0 @ =0x00000105
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x20
	strh r1, [r0, #0x26]
	movs r1, #0x40
	strh r1, [r0, #0x28]
	ldr r3, _0808BDA4 @ =gUnknown_0300006A
	adds r1, r6, r3
	strb r2, [r1]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
_0808BD38:
	ldrh r0, [r5]
	cmp r0, #0x8c
	bls _0808BD80
	ldr r1, [r7]
	ldr r0, _0808BDA8 @ =sub_808BDBC
	str r0, [r1, #8]
	strh r4, [r5]
	ldr r2, _0808BDAC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808BDB0 @ =gBldRegs
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1, #2]
	ldr r0, _0808BDB4 @ =0x00000241
	strh r0, [r1]
	movs r1, #0x3c
	rsbs r1, r1, #0
	ldr r3, _0808BDB8 @ =0x0000FFDF
	str r4, [sp]
	movs r0, #0x7c
	movs r2, #0
	bl sub_808CE00
	movs r1, #0x18
	rsbs r1, r1, #0
	str r4, [sp]
	movs r0, #0xb4
	movs r2, #3
	movs r3, #0x20
	bl sub_808CE00
_0808BD80:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
_0808BD86:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BD90: .4byte gUnknown_03000F3E
_0808BD94: .4byte gUnknown_03000040
_0808BD98: .4byte 0x06008000
_0808BD9C: .4byte 0x0600E800
_0808BDA0: .4byte 0x00000105
_0808BDA4: .4byte gUnknown_0300006A
_0808BDA8: .4byte sub_808BDBC
_0808BDAC: .4byte gDispCnt
_0808BDB0: .4byte gBldRegs
_0808BDB4: .4byte 0x00000241
_0808BDB8: .4byte 0x0000FFDF

	thumb_func_start sub_808BDBC
sub_808BDBC: @ 0x0808BDBC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0808BDE0 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r0, _0808BDE4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0808BDE8
	adds r0, r7, #0
	bl sub_808D4DC
	b _0808BF28
	.align 2, 0
_0808BDE0: .4byte gCurTask
_0808BDE4: .4byte gPressedKeys
_0808BDE8:
	ldr r2, _0808BE20 @ =gBgScrollRegs
	ldr r0, _0808BE24 @ =gUnknown_03000F3D
	adds r4, r3, r0
	ldrb r1, [r4]
	ldrh r0, [r2, #6]
	subs r0, r0, r1
	strh r0, [r2, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xae
	bgt _0808BE02
	movs r0, #0xaf
	strh r0, [r2, #6]
_0808BE02:
	movs r0, #6
	ldrsh r1, [r2, r0]
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0808BE34
	ldr r2, _0808BE28 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808BE2C @ =0x0000FBFF
	ands r0, r1
	ldr r1, _0808BE30 @ =0x0000BFFF
	ands r0, r1
	strh r0, [r2]
	b _0808BE46
	.align 2, 0
_0808BE20: .4byte gBgScrollRegs
_0808BE24: .4byte gUnknown_03000F3D
_0808BE28: .4byte gDispCnt
_0808BE2C: .4byte 0x0000FBFF
_0808BE30: .4byte 0x0000BFFF
_0808BE34:
	ldr r0, _0808BF30 @ =gUnknown_03000F38
	adds r1, r3, r0
	ldrh r0, [r1]
	ldrb r4, [r4]
	adds r0, r0, r4
	strh r0, [r1]
	adds r0, r7, #0
	bl sub_808CBA4
_0808BE46:
	ldr r1, _0808BF34 @ =0x00000F3E
	adds r3, r7, r1
	ldr r0, _0808BF38 @ =gUnknown_080E105E
	subs r1, #2
	adds r2, r7, r1
	ldrb r1, [r2]
	adds r1, r1, r0
	ldrh r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0808BE70
	movs r0, #0
	strh r0, [r3]
	ldr r0, _0808BF3C @ =0x00000F3D
	adds r1, r7, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_0808BE70:
	ldrh r0, [r3]
	cmp r0, #0x3c
	bls _0808BF1E
	ldrb r0, [r2]
	cmp r0, #2
	bls _0808BF1E
	ldr r2, _0808BF40 @ =gBgCntRegs
	ldrh r1, [r2, #4]
	ldr r0, _0808BF44 @ =0x0000DFFF
	ands r0, r1
	movs r5, #0
	movs r4, #0
	strh r0, [r2, #4]
	ldr r1, _0808BF48 @ =gUnknown_03004D80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0808BF4C @ =gUnknown_03002280
	strb r5, [r0]
	strb r5, [r0, #1]
	movs r1, #0x20
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	ldr r6, _0808BF50 @ =gBldRegs
	strh r4, [r6]
	ldr r0, _0808BF54 @ =0x06004000
	str r0, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808BF58 @ =0x0600F800
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r0, _0808BF5C @ =0x00000107
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	movs r0, #7
	strh r0, [r7, #0x26]
	movs r0, #0x10
	strh r0, [r7, #0x28]
	adds r1, r7, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	str r3, [sp]
	bl sub_8002A3C
	ldr r1, _0808BF60 @ =gBgScrollRegs
	movs r0, #0x4f
	strh r0, [r1, #2]
	ldr r0, _0808BF64 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808BF68 @ =sub_808BF7C
	str r0, [r1, #8]
	ldr r3, [sp]
	strh r4, [r3]
	ldr r2, _0808BF6C @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r2, #2]
	movs r0, #0xa0
	strh r0, [r2, #6]
	ldrh r0, [r2, #8]
	movs r3, #0xfc
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	movs r1, #0x3f
	orrs r0, r1
	strh r0, [r2, #0xa]
	ldr r0, _0808BF70 @ =0x00003FBF
	strh r0, [r6]
	strh r4, [r6, #4]
	ldr r1, _0808BF74 @ =gDispCnt
	ldrh r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r2, r3, #0
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _0808BF78 @ =0x04000128
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
_0808BF1E:
	ldr r0, _0808BF34 @ =0x00000F3E
	adds r1, r7, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0808BF28:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BF30: .4byte gUnknown_03000F38
_0808BF34: .4byte 0x00000F3E
_0808BF38: .4byte gUnknown_080E105E
_0808BF3C: .4byte 0x00000F3D
_0808BF40: .4byte gBgCntRegs
_0808BF44: .4byte 0x0000DFFF
_0808BF48: .4byte gUnknown_03004D80
_0808BF4C: .4byte gUnknown_03002280
_0808BF50: .4byte gBldRegs
_0808BF54: .4byte 0x06004000
_0808BF58: .4byte 0x0600F800
_0808BF5C: .4byte 0x00000107
_0808BF60: .4byte gBgScrollRegs
_0808BF64: .4byte gCurTask
_0808BF68: .4byte sub_808BF7C
_0808BF6C: .4byte gWinRegs
_0808BF70: .4byte 0x00003FBF
_0808BF74: .4byte gDispCnt
_0808BF78: .4byte 0x04000128

	thumb_func_start sub_808BF7C
sub_808BF7C: @ 0x0808BF7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r0, _0808BFA4 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r6, r0
	ldr r0, _0808BFA8 @ =gPressedKeys
	ldrh r0, [r0]
	movs r5, #9
	ands r5, r0
	cmp r5, #0
	beq _0808BFAC
	adds r0, r7, #0
	bl sub_808D4DC
	b _0808C178
	.align 2, 0
_0808BFA4: .4byte gCurTask
_0808BFA8: .4byte gPressedKeys
_0808BFAC:
	ldr r0, _0808C050 @ =gUnknown_03000F3E
	adds r0, r0, r6
	mov r8, r0
	ldrh r0, [r0]
	cmp r0, #2
	bne _0808BFBC
	bl sub_808D124
_0808BFBC:
	mov r3, r8
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808BFEC
	movs r4, #0x80
	lsls r4, r4, #1
	str r5, [sp]
	str r5, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	ldr r0, _0808C054 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r1, _0808C058 @ =gDispCnt
	ldrh r0, [r1]
	orrs r4, r0
	strh r4, [r1]
_0808BFEC:
	ldr r1, _0808C05C @ =gUnknown_03000F3C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #2
	bls _0808C084
	mov r3, r8
	ldrh r0, [r3]
	subs r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x76
	bhi _0808C084
	ldr r2, _0808C058 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808C060 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808C064 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r3, #0xfc
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r2, _0808C068 @ =gBldRegs
	ldr r0, _0808C06C @ =0x00003FBF
	strh r0, [r2]
	mov r1, r8
	ldrh r0, [r1]
	cmp r0, #0x1d
	bls _0808C070
	adds r1, r0, #0
	subs r1, #0x1e
	asrs r1, r1, #3
	movs r0, #0x10
	subs r0, r0, r1
	b _0808C072
	.align 2, 0
_0808C050: .4byte gUnknown_03000F3E
_0808C054: .4byte gBgAffineRegs
_0808C058: .4byte gDispCnt
_0808C05C: .4byte gUnknown_03000F3C
_0808C060: .4byte 0x0000FEFF
_0808C064: .4byte gWinRegs
_0808C068: .4byte gBldRegs
_0808C06C: .4byte 0x00003FBF
_0808C070:
	movs r0, #0x10
_0808C072:
	strh r0, [r2, #4]
	ldr r3, _0808C0E4 @ =0x00000F3E
	adds r0, r7, r3
	ldrh r0, [r0]
	cmp r0, #0x15
	bne _0808C084
	ldr r1, _0808C0E8 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1, #6]
_0808C084:
	ldr r1, _0808C0E4 @ =0x00000F3E
	adds r0, r7, r1
	ldrh r0, [r0]
	cmp r0, #0x8a
	bls _0808C16E
	adds r6, r7, #0
	movs r2, #0
	str r2, [sp, #0x10]
	ldr r1, _0808C0EC @ =0x040000D4
	add r3, sp, #0x10
	str r3, [r1]
	movs r5, #0xc0
	lsls r5, r5, #0x13
	str r5, [r1, #4]
	ldr r0, _0808C0F0 @ =0x85001000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _0808C0F4 @ =gUnknown_03004D80
	movs r0, #2
	strb r0, [r4]
	ldr r0, _0808C0F8 @ =gUnknown_03002280
	strb r2, [r0]
	strb r2, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r3, #0x20
	strb r3, [r0, #3]
	strb r2, [r4, #2]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	str r5, [r7, #4]
	strh r2, [r7, #0xa]
	ldr r0, _0808C0FC @ =0x0600D000
	str r0, [r7, #0xc]
	strh r2, [r7, #0x18]
	strh r2, [r7, #0x1a]
	ldr r0, _0808C100 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bhi _0808C104
	movs r0, #0x84
	lsls r0, r0, #1
	b _0808C106
	.align 2, 0
_0808C0E4: .4byte 0x00000F3E
_0808C0E8: .4byte gBgScrollRegs
_0808C0EC: .4byte 0x040000D4
_0808C0F0: .4byte 0x85001000
_0808C0F4: .4byte gUnknown_03004D80
_0808C0F8: .4byte gUnknown_03002280
_0808C0FC: .4byte 0x0600D000
_0808C100: .4byte gUnknown_03005B64
_0808C104:
	ldr r0, _0808C184 @ =0x00000109
_0808C106:
	strh r0, [r7, #0x1c]
	movs r1, #0
	movs r4, #0
	strh r4, [r6, #0x1e]
	strh r4, [r6, #0x20]
	strh r4, [r6, #0x22]
	strh r4, [r6, #0x24]
	movs r0, #0x1a
	strh r0, [r6, #0x26]
	movs r0, #0xa
	strh r0, [r6, #0x28]
	adds r0, r6, #0
	adds r0, #0x2a
	strb r1, [r0]
	movs r0, #6
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl sub_8002A3C
	ldr r2, _0808C188 @ =gBgCntRegs
	ldrh r1, [r2, #4]
	ldr r0, _0808C18C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2, #4]
	ldr r0, _0808C190 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C194 @ =sub_808C1AC
	str r0, [r1, #8]
	ldr r2, _0808C198 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldr r1, _0808C19C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0808C1A0 @ =gBldRegs
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1, #2]
	movs r0, #0x91
	lsls r0, r0, #2
	strh r0, [r1]
	ldr r1, _0808C1A4 @ =0x00000F3E
	adds r0, r7, r1
	strh r4, [r0]
	ldr r0, _0808C1A8 @ =gBgScrollRegs
	strh r4, [r0, #6]
	adds r0, r7, #0
	bl sub_808B884
_0808C16E:
	ldr r3, _0808C1A4 @ =0x00000F3E
	adds r1, r7, r3
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0808C178:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C184: .4byte 0x00000109
_0808C188: .4byte gBgCntRegs
_0808C18C: .4byte 0x0000DFFF
_0808C190: .4byte gCurTask
_0808C194: .4byte sub_808C1AC
_0808C198: .4byte gDispCnt
_0808C19C: .4byte 0x0000FEFF
_0808C1A0: .4byte gBldRegs
_0808C1A4: .4byte 0x00000F3E
_0808C1A8: .4byte gBgScrollRegs

	thumb_func_start sub_808C1AC
sub_808C1AC: @ 0x0808C1AC
	push {r4, r5, r6, lr}
	ldr r0, _0808C1D0 @ =gCurTask
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0808C1D4 @ =gPressedKeys
	ldrh r0, [r0]
	movs r3, #9
	ands r3, r0
	cmp r3, #0
	beq _0808C1D8
	adds r0, r6, #0
	bl sub_808D4DC
	b _0808C206
	.align 2, 0
_0808C1D0: .4byte gCurTask
_0808C1D4: .4byte gPressedKeys
_0808C1D8:
	ldr r5, _0808C20C @ =gBldRegs
	ldr r0, _0808C210 @ =gUnknown_03000F3E
	adds r2, r1, r0
	ldrh r0, [r2]
	lsrs r0, r0, #2
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #8
	orrs r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r2]
	cmp r0, #0x40
	bls _0808C1FA
	strh r3, [r5]
	strh r3, [r2]
	ldr r0, _0808C214 @ =sub_808D67C
	str r0, [r4, #8]
_0808C1FA:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	adds r0, r6, #0
	bl sub_808D740
_0808C206:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C20C: .4byte gBldRegs
_0808C210: .4byte gUnknown_03000F3E
_0808C214: .4byte sub_808D67C

	thumb_func_start sub_808C218
sub_808C218: @ 0x0808C218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0808C2A4 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov r8, r0
	ldr r0, _0808C2A8 @ =gUnknown_03000F3E
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #0x27
	bhi _0808C23E
	ldr r1, _0808C2AC @ =gUnknown_030000F0
	adds r0, r5, r1
	bl sub_80051E8
_0808C23E:
	ldrh r0, [r4]
	adds r0, #1
	movs r6, #0
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bls _0808C250
	strh r6, [r4]
_0808C250:
	ldr r1, _0808C2B0 @ =gUnknown_030000C0
	adds r0, r5, r1
	bl sub_80051E8
	ldr r0, _0808C2B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808C27A
	movs r0, #0x6a
	bl m4aSongNumStart
	strh r6, [r4]
	ldr r0, _0808C2B8 @ =gUnknown_03000F42
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0808C2BC @ =sub_808C2C8
	str r0, [r1, #8]
_0808C27A:
	mov r0, r8
	bl sub_808D740
	ldr r1, _0808C2C0 @ =gUnknown_03000F40
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	movs r0, #0xe1
	lsls r0, r0, #0x12
	cmp r1, r0
	bne _0808C29A
	ldr r1, [r7]
	ldr r0, _0808C2C4 @ =sub_808D6D4
	str r0, [r1, #8]
_0808C29A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C2A4: .4byte gCurTask
_0808C2A8: .4byte gUnknown_03000F3E
_0808C2AC: .4byte gUnknown_030000F0
_0808C2B0: .4byte gUnknown_030000C0
_0808C2B4: .4byte gPressedKeys
_0808C2B8: .4byte gUnknown_03000F42
_0808C2BC: .4byte sub_808C2C8
_0808C2C0: .4byte gUnknown_03000F40
_0808C2C4: .4byte sub_808D6D4

	thumb_func_start sub_808C2C8
sub_808C2C8: @ 0x0808C2C8
	push {r4, r5, r6, r7, lr}
	ldr r7, _0808C338 @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r0, _0808C33C @ =gUnknown_03000F3E
	adds r5, r4, r0
	ldrh r1, [r5]
	movs r0, #7
	ands r0, r1
	cmp r0, #3
	bls _0808C2EC
	ldr r1, _0808C340 @ =gUnknown_030000F0
	adds r0, r4, r1
	bl sub_80051E8
_0808C2EC:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, _0808C344 @ =gUnknown_030000C0
	adds r0, r4, r1
	bl sub_80051E8
	ldrh r0, [r5]
	cmp r0, #0xa
	bne _0808C314
	ldr r1, _0808C348 @ =gUnknown_03000120
	adds r0, r4, r1
	movs r1, #1
	bl sub_808D790
	ldr r1, _0808C34C @ =gUnknown_03000150
	adds r0, r4, r1
	movs r1, #1
	bl sub_808D790
_0808C314:
	ldrh r0, [r5]
	cmp r0, #0x10
	bls _0808C32C
	movs r0, #0
	strh r0, [r5]
	ldr r0, _0808C350 @ =gUnknown_03000F42
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _0808C354 @ =sub_808C358
	str r0, [r1, #8]
_0808C32C:
	adds r0, r6, #0
	bl sub_808D740
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C338: .4byte gCurTask
_0808C33C: .4byte gUnknown_03000F3E
_0808C340: .4byte gUnknown_030000F0
_0808C344: .4byte gUnknown_030000C0
_0808C348: .4byte gUnknown_03000120
_0808C34C: .4byte gUnknown_03000150
_0808C350: .4byte gUnknown_03000F42
_0808C354: .4byte sub_808C358

	thumb_func_start sub_808C358
sub_808C358: @ 0x0808C358
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808C3C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0xc0
	adds r0, r0, r1
	bl sub_80051E8
	adds r0, r5, #0
	bl sub_808D740
	movs r4, #0
_0808C376:
	movs r0, #1
	adds r1, r4, #0
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r0, r5, r0
	ldr r2, _0808C3C8 @ =0x00000F42
	adds r1, r5, r2
	ldrb r2, [r1]
	adds r1, r4, #0
	eors r1, r2
	adds r2, r0, #0
	adds r2, #0x25
	strb r1, [r2]
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0808C376
	ldr r0, _0808C3CC @ =gUnknown_030022B8
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0808C3DA
	ldr r0, _0808C3C8 @ =0x00000F42
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808C3D0
	movs r0, #0
	b _0808C3D2
	.align 2, 0
_0808C3C4: .4byte gCurTask
_0808C3C8: .4byte 0x00000F42
_0808C3CC: .4byte gUnknown_030022B8
_0808C3D0:
	movs r0, #1
_0808C3D2:
	strb r0, [r1]
	movs r0, #0x6c
	bl m4aSongNumStart
_0808C3DA:
	ldr r0, _0808C41C @ =gPressedKeys
	ldrh r2, [r0]
	movs r7, #1
	adds r1, r7, #0
	ands r1, r2
	cmp r1, #0
	beq _0808C46C
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0808C420 @ =0x00000F42
	adds r6, r5, r1
	ldrb r4, [r6]
	cmp r4, #0
	bne _0808C430
	movs r2, #0xb3
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x78
	strh r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0
	bl sub_808D790
	ldr r2, _0808C424 @ =0x00000F3E
	adds r0, r5, r2
	strh r4, [r0]
	ldr r0, _0808C428 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C42C @ =sub_808C498
	b _0808C488
	.align 2, 0
_0808C41C: .4byte gPressedKeys
_0808C420: .4byte 0x00000F42
_0808C424: .4byte 0x00000F3E
_0808C428: .4byte gCurTask
_0808C42C: .4byte sub_808C498
_0808C430:
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r4, r5, r0
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0
	bl sub_808D790
	movs r1, #0
	ldr r0, _0808C460 @ =0x00003FFF
	strh r0, [r4, #8]
	strh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #6]
	strh r7, [r4, #2]
	movs r0, #4
	strb r0, [r6]
	ldr r0, _0808C464 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C468 @ =sub_808C710
	b _0808C488
	.align 2, 0
_0808C460: .4byte 0x00003FFF
_0808C464: .4byte gCurTask
_0808C468: .4byte sub_808C710
_0808C46C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0808C48A
	movs r2, #0xf4
	lsls r2, r2, #4
	adds r0, r5, r2
	strh r1, [r0]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, _0808C490 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C494 @ =sub_808C218
_0808C488:
	str r0, [r1, #8]
_0808C48A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C490: .4byte gCurTask
_0808C494: .4byte sub_808C218

	thumb_func_start sub_808C498
sub_808C498: @ 0x0808C498
	push {r4, r5, r6, r7, lr}
	ldr r7, _0808C550 @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r0, _0808C554 @ =gUnknown_03000120
	adds r2, r4, r0
	ldr r1, _0808C558 @ =gUnknown_03000F3E
	adds r5, r4, r1
	ldrh r1, [r5]
	movs r0, #7
	ands r0, r1
	cmp r0, #3
	bls _0808C4BE
	adds r0, r2, #0
	bl sub_80051E8
_0808C4BE:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r2, _0808C55C @ =gUnknown_030000C0
	adds r0, r4, r2
	bl sub_80051E8
	ldr r0, _0808C560 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808C4EC
	ldr r0, _0808C564 @ =gUnknown_03000F42
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, [r7]
	ldr r0, _0808C568 @ =sub_808C358
	str r0, [r1, #8]
_0808C4EC:
	ldrh r0, [r5]
	cmp r0, #8
	bne _0808C524
	ldr r1, _0808C56C @ =gUnknown_03000180
	adds r0, r4, r1
	movs r1, #1
	bl sub_808D790
	ldr r2, _0808C570 @ =gUnknown_030001B0
	adds r0, r4, r2
	movs r1, #1
	bl sub_808D790
	ldr r1, _0808C574 @ =gUnknown_030001E0
	adds r0, r4, r1
	movs r1, #1
	bl sub_808D790
	ldr r0, _0808C578 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _0808C524
	ldr r2, _0808C57C @ =gUnknown_03000210
	adds r0, r4, r2
	movs r1, #1
	bl sub_808D790
_0808C524:
	ldr r0, _0808C580 @ =0x00000F3E
	adds r2, r6, r0
	ldrh r0, [r2]
	cmp r0, #0xc
	bls _0808C542
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	ldr r2, _0808C584 @ =0x00000F42
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _0808C550 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C588 @ =sub_808C58C
	str r0, [r1, #8]
_0808C542:
	adds r0, r6, #0
	bl sub_808D740
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C550: .4byte gCurTask
_0808C554: .4byte gUnknown_03000120
_0808C558: .4byte gUnknown_03000F3E
_0808C55C: .4byte gUnknown_030000C0
_0808C560: .4byte gPressedKeys
_0808C564: .4byte gUnknown_03000F42
_0808C568: .4byte sub_808C358
_0808C56C: .4byte gUnknown_03000180
_0808C570: .4byte gUnknown_030001B0
_0808C574: .4byte gUnknown_030001E0
_0808C578: .4byte gUnknown_03005B64
_0808C57C: .4byte gUnknown_03000210
_0808C580: .4byte 0x00000F3E
_0808C584: .4byte 0x00000F42
_0808C588: .4byte sub_808C58C

	thumb_func_start sub_808C58C
sub_808C58C: @ 0x0808C58C
	push {r4, r5, r6, lr}
	movs r6, #3
	ldr r0, _0808C5D0 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _0808C59C
	movs r6, #4
_0808C59C:
	ldr r0, _0808C5D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
	cmp r4, r6
	bhs _0808C5F4
_0808C5AE:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r5, r0
	ldr r1, _0808C5D8 @ =0x00000F42
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, r4
	bne _0808C5DC
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #1
	b _0808C5E2
	.align 2, 0
_0808C5D0: .4byte gUnknown_03005B64
_0808C5D4: .4byte gCurTask
_0808C5D8: .4byte 0x00000F42
_0808C5DC:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
_0808C5E2:
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0808C5AE
_0808C5F4:
	adds r0, r5, #0
	bl sub_808D740
	ldr r0, _0808C618 @ =gUnknown_030022B8
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0808C62C
	ldr r4, _0808C61C @ =0x00000F42
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808C620
	subs r0, #1
	b _0808C622
	.align 2, 0
_0808C618: .4byte gUnknown_030022B8
_0808C61C: .4byte 0x00000F42
_0808C620:
	subs r0, r6, #1
_0808C622:
	strb r0, [r1]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0808C654
_0808C62C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808C654
	ldr r0, _0808C648 @ =0x00000F42
	adds r1, r5, r0
	ldrb r2, [r1]
	subs r0, r6, #1
	cmp r2, r0
	bge _0808C64C
	adds r0, r2, #1
	strb r0, [r1]
	b _0808C64E
	.align 2, 0
_0808C648: .4byte 0x00000F42
_0808C64C:
	strb r3, [r1]
_0808C64E:
	movs r0, #0x6c
	bl m4aSongNumStart
_0808C654:
	ldr r0, _0808C67C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0808C68C
	ldr r4, _0808C680 @ =0x00000F42
	adds r1, r5, r4
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, _0808C684 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C688 @ =sub_808C358
	b _0808C6F2
	.align 2, 0
_0808C67C: .4byte gPressedKeys
_0808C680: .4byte 0x00000F42
_0808C684: .4byte gCurTask
_0808C688: .4byte sub_808C358
_0808C68C:
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0808C6F4
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _0808C6FC @ =0x00003FFF
	strh r0, [r1, #8]
	ldr r4, _0808C700 @ =0x00000F42
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0808C6AE
	ldr r0, _0808C704 @ =0x00003FBF
	strh r0, [r1, #8]
_0808C6AE:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #6]
	strh r2, [r1, #4]
	strh r3, [r1, #2]
	movs r4, #0
	cmp r4, r6
	bhs _0808C6E6
_0808C6BE:
	ldr r1, _0808C700 @ =0x00000F42
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r4, r0
	beq _0808C6DC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r5, r0
	movs r1, #0
	bl sub_808D790
_0808C6DC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0808C6BE
_0808C6E6:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _0808C708 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808C70C @ =sub_808C710
_0808C6F2:
	str r0, [r1, #8]
_0808C6F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C6FC: .4byte 0x00003FFF
_0808C700: .4byte 0x00000F42
_0808C704: .4byte 0x00003FBF
_0808C708: .4byte gCurTask
_0808C70C: .4byte sub_808C710

	thumb_func_start sub_808C710
sub_808C710: @ 0x0808C710
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808C754 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _0808C758 @ =gUnknown_03000270
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0808C730
	b _0808C838
_0808C730:
	ldr r0, _0808C75C @ =gUnknown_03005424
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0808C760 @ =gUnknown_030055B4
	strb r1, [r0]
	ldr r0, _0808C764 @ =gUnknown_030054F0
	strb r1, [r0]
	ldr r2, _0808C768 @ =gUnknown_03000F42
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0808C82A
	lsls r0, r0, #2
	ldr r1, _0808C76C @ =_0808C770
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808C754: .4byte gCurTask
_0808C758: .4byte gUnknown_03000270
_0808C75C: .4byte gUnknown_03005424
_0808C760: .4byte gUnknown_030055B4
_0808C764: .4byte gUnknown_030054F0
_0808C768: .4byte gUnknown_03000F42
_0808C76C: .4byte _0808C770
_0808C770: @ jump table
	.4byte _0808C784 @ case 0
	.4byte _0808C7BA @ case 1
	.4byte _0808C7E0 @ case 2
	.4byte _0808C7F4 @ case 3
	.4byte _0808C7FA @ case 4
_0808C784:
	ldr r1, _0808C7A8 @ =gUnknown_030054CC
	movs r0, #0
	strb r0, [r1]
	bl sub_801A6D8
	ldr r0, _0808C7AC @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r1, [r0, #0x13]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808C7B0
	movs r0, #0
	movs r1, #1
	bl sub_803143C
	b _0808C82A
	.align 2, 0
_0808C7A8: .4byte gUnknown_030054CC
_0808C7AC: .4byte gUnknown_03005B64
_0808C7B0:
	movs r0, #0
	movs r1, #0
	bl sub_803143C
	b _0808C82A
_0808C7BA:
	bl sub_801A6D8
	ldr r0, _0808C7D4 @ =gUnknown_030055B4
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0808C7D8 @ =gUnknown_030054F0
	strb r1, [r0]
	ldr r1, _0808C7DC @ =gUnknown_030054CC
	movs r0, #1
	strb r0, [r1]
	bl sub_8087FC0
	b _0808C82A
	.align 2, 0
_0808C7D4: .4byte gUnknown_030055B4
_0808C7D8: .4byte gUnknown_030054F0
_0808C7DC: .4byte gUnknown_030054CC
_0808C7E0:
	ldr r1, _0808C7F0 @ =gUnknown_030054CC
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	bl sub_8063730
	b _0808C82A
	.align 2, 0
_0808C7F0: .4byte gUnknown_030054CC
_0808C7F4:
	bl sub_808D35C
	b _0808C82A
_0808C7FA:
	ldr r1, _0808C818 @ =gUnknown_030054CC
	movs r0, #3
	strb r0, [r1]
	bl sub_801A6D8
	ldr r0, _0808C81C @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrh r1, [r0, #0x20]
	ldr r0, _0808C820 @ =0x0000FFFF
	cmp r1, r0
	beq _0808C824
	bl sub_805A1CC
	b _0808C82A
	.align 2, 0
_0808C818: .4byte gUnknown_030054CC
_0808C81C: .4byte gUnknown_03005B64
_0808C820: .4byte 0x0000FFFF
_0808C824:
	movs r0, #0
	bl sub_8063A00
_0808C82A:
	ldr r0, _0808C834 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0808C8DE
	.align 2, 0
_0808C834: .4byte gCurTask
_0808C838:
	adds r0, r6, #0
	bl sub_808D740
	ldr r3, _0808C898 @ =gUnknown_03000F42
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, #4
	bne _0808C8A8
	movs r5, #0
	ldr r0, _0808C89C @ =gUnknown_030000C0
	adds r7, r4, r0
	ldr r1, _0808C8A0 @ =gUnknown_03000F3E
	adds r4, r4, r1
_0808C852:
	movs r0, #1
	adds r1, r5, #0
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r2, r6, r0
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r3, _0808C8A4 @ =0x0000FFFF
	adds r1, r3, #0
	ands r0, r1
	movs r1, #7
	ands r0, r1
	cmp r0, #3
	bls _0808C886
	adds r0, r2, #0
	bl sub_80051E8
_0808C886:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0808C852
	adds r0, r7, #0
	bl sub_80051E8
	b _0808C8DE
	.align 2, 0
_0808C898: .4byte gUnknown_03000F42
_0808C89C: .4byte gUnknown_030000C0
_0808C8A0: .4byte gUnknown_03000F3E
_0808C8A4: .4byte 0x0000FFFF
_0808C8A8:
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r6, r0
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #1
	strb r0, [r1]
	ldr r3, _0808C8E4 @ =gUnknown_03000F3E
	adds r1, r4, r3
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0808C8E8 @ =0x0000FFFF
	adds r1, r3, #0
	ands r0, r1
	movs r1, #7
	ands r0, r1
	cmp r0, #3
	bls _0808C8DE
	adds r0, r2, #0
	bl sub_80051E8
_0808C8DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C8E4: .4byte gUnknown_03000F3E
_0808C8E8: .4byte 0x0000FFFF

	thumb_func_start sub_808C8EC
sub_808C8EC: @ 0x0808C8EC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0808C950 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r6, r7, #0
	movs r2, #0
	str r2, [sp]
	ldr r1, _0808C954 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r5, #0xc0
	lsls r5, r5, #0x13
	str r5, [r1, #4]
	ldr r0, _0808C958 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _0808C95C @ =gUnknown_03004D80
	strb r2, [r4]
	ldr r0, _0808C960 @ =gUnknown_03002280
	strb r2, [r0]
	strb r2, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r3, #0x20
	strb r3, [r0, #3]
	strb r2, [r4, #2]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	str r5, [r7, #4]
	strh r2, [r7, #0xa]
	ldr r0, _0808C964 @ =0x0600D000
	str r0, [r7, #0xc]
	strh r2, [r7, #0x18]
	strh r2, [r7, #0x1a]
	ldr r0, _0808C968 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bhi _0808C96C
	movs r0, #0x84
	lsls r0, r0, #1
	b _0808C96E
	.align 2, 0
_0808C950: .4byte gCurTask
_0808C954: .4byte 0x040000D4
_0808C958: .4byte 0x85004000
_0808C95C: .4byte gUnknown_03004D80
_0808C960: .4byte gUnknown_03002280
_0808C964: .4byte 0x0600D000
_0808C968: .4byte gUnknown_03005B64
_0808C96C:
	ldr r0, _0808CA30 @ =0x00000109
_0808C96E:
	strh r0, [r7, #0x1c]
	movs r5, #0
	movs r4, #0
	strh r4, [r6, #0x1e]
	strh r4, [r6, #0x20]
	strh r4, [r6, #0x22]
	strh r4, [r6, #0x24]
	movs r0, #0x1a
	strh r0, [r6, #0x26]
	movs r0, #0xa
	strh r0, [r6, #0x28]
	adds r0, r6, #0
	adds r0, #0x2a
	strb r5, [r0]
	movs r0, #6
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl sub_8002A3C
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _0808CA34 @ =0x06008000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0808CA38 @ =0x0600E800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _0808CA3C @ =0x00000105
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x20
	strh r1, [r0, #0x26]
	movs r1, #0x40
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0x6a
	strb r5, [r1]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r2, _0808CA40 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0808CA44 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808CA48 @ =gBgScrollRegs
	movs r0, #8
	strh r0, [r1, #4]
	strh r4, [r1, #6]
	ldr r2, _0808CA4C @ =gBgCntRegs
	ldrh r1, [r2, #4]
	ldr r0, _0808CA50 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2, #4]
	ldr r0, _0808CA54 @ =gBldRegs
	strh r4, [r0]
	ldr r2, _0808CA58 @ =gUnknown_03001840
	ldr r0, [r2]
	ldr r1, _0808CA5C @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r7, r1
	bl sub_802D4CC
	movs r0, #2
	bl m4aSongNumStart
	adds r0, r7, #0
	bl sub_808D740
	ldr r0, _0808CA60 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808CA64 @ =sub_808D53C
	str r0, [r1, #8]
	ldr r2, _0808CA68 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CA30: .4byte 0x00000109
_0808CA34: .4byte 0x06008000
_0808CA38: .4byte 0x0600E800
_0808CA3C: .4byte 0x00000105
_0808CA40: .4byte gDispCnt
_0808CA44: .4byte 0x0000FEFF
_0808CA48: .4byte gBgScrollRegs
_0808CA4C: .4byte gBgCntRegs
_0808CA50: .4byte 0x0000DFFF
_0808CA54: .4byte gBldRegs
_0808CA58: .4byte gUnknown_03001840
_0808CA5C: .4byte 0xFFFF7FFF
_0808CA60: .4byte gCurTask
_0808CA64: .4byte sub_808D53C
_0808CA68: .4byte 0x04000128

	thumb_func_start sub_808CA6C
sub_808CA6C: @ 0x0808CA6C
	push {r4, r5, lr}
	ldr r0, _0808CAEC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_0808CA7C:
	movs r0, #1
	adds r1, r4, #0
	eors r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r5, r0
	ldr r2, _0808CAF0 @ =0x00000F42
	adds r1, r5, r2
	ldrb r2, [r1]
	adds r1, r4, #0
	eors r1, r2
	adds r2, r0, #0
	adds r2, #0x25
	strb r1, [r2]
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0808CA7C
	adds r0, r5, #0
	adds r0, #0xc0
	bl sub_80051E8
	adds r0, r5, #0
	bl sub_808D740
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r5, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808CAE4
	movs r0, #0xc9
	bl m4aSongNumStart
	ldr r2, _0808CAF4 @ =0x00000F3E
	adds r1, r5, r2
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0808CAEC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808CAF8 @ =sub_808C358
	str r0, [r1, #8]
_0808CAE4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808CAEC: .4byte gCurTask
_0808CAF0: .4byte 0x00000F42
_0808CAF4: .4byte 0x00000F3E
_0808CAF8: .4byte sub_808C358

	thumb_func_start sub_808CAFC
sub_808CAFC: @ 0x0808CAFC
	push {r4, r5, r6, lr}
	movs r6, #3
	ldr r0, _0808CB40 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _0808CB0C
	movs r6, #4
_0808CB0C:
	ldr r0, _0808CB44 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
	cmp r4, r6
	bhs _0808CB64
_0808CB1E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r5, r0
	ldr r1, _0808CB48 @ =0x00000F42
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, r4
	bne _0808CB4C
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #1
	b _0808CB52
	.align 2, 0
_0808CB40: .4byte gUnknown_03005B64
_0808CB44: .4byte gCurTask
_0808CB48: .4byte 0x00000F42
_0808CB4C:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
_0808CB52:
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0808CB1E
_0808CB64:
	adds r0, r5, #0
	bl sub_808D740
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r5, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808CB92
	movs r0, #0xc9
	bl m4aSongNumStart
	ldr r0, _0808CB98 @ =0x00000F3E
	adds r1, r5, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0808CB9C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808CBA0 @ =sub_808C58C
	str r0, [r1, #8]
_0808CB92:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CB98: .4byte 0x00000F3E
_0808CB9C: .4byte gCurTask
_0808CBA0: .4byte sub_808C58C

	thumb_func_start sub_808CBA4
sub_808CBA4: @ 0x0808CBA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	ldr r2, _0808CCD8 @ =0x04000128
	ldrh r1, [r2]
	ldr r0, _0808CCDC @ =0x0000BFFF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0808CCE0 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0808CCE4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r2, #2]
	ldr r0, _0808CCE8 @ =0x00000F38
	add r0, ip
	mov r8, r0
	ldrh r0, [r0]
	subs r0, #2
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	ldrh r1, [r2, #8]
	movs r3, #0xfc
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r1, [r2, #0xa]
	movs r0, #0x13
	ands r0, r1
	strh r0, [r2, #0xa]
	ldr r7, _0808CCEC @ =0x00000F3A
	add r7, ip
	ldr r1, _0808CCF0 @ =0xFFFFFD00
	adds r0, r1, #0
	ldrh r3, [r7]
	adds r0, r0, r3
	strh r0, [r7]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808CC0E
	movs r0, #0xf0
	lsls r0, r0, #5
	strh r0, [r7]
_0808CC0E:
	ldr r3, _0808CCF4 @ =gUnknown_03001870
	ldr r2, _0808CCF8 @ =gUnknown_03004D50
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0808CCFC @ =sub_808D874
	str r1, [r0]
	ldr r5, _0808CD00 @ =gUnknown_03001840
	ldr r2, [r5]
	movs r6, #0x10
	orrs r2, r6
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #2
	movs r1, #0xac
	lsls r1, r1, #2
	add r1, ip
	strh r0, [r1]
	ldr r4, _0808CD04 @ =gUnknown_030026E0
	ldr r3, _0808CD08 @ =gUnknown_0300188C
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r1, _0808CD0C @ =sub_808DB2C
	str r1, [r0]
	movs r0, #8
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	str r2, [r5]
	ldr r0, _0808CD10 @ =gUnknown_03002A80
	strb r6, [r0]
	ldr r1, _0808CD14 @ =gUnknown_03002878
	ldr r0, _0808CD18 @ =0x04000020
	str r0, [r1]
	ldr r1, _0808CD1C @ =gUnknown_03001884
	movs r0, #0xfd
	lsls r0, r0, #2
	add r0, ip
	str r0, [r1]
	adds r2, r0, #0
	movs r4, #0
	mov sb, r4
	mov r6, r8
	movs r3, #0xad
	lsls r3, r3, #2
	add r3, ip
	mov sl, r3
	movs r5, #0
	ldr r0, _0808CD20 @ =0x00000DF4
	add r0, ip
	mov r8, r0
_0808CC82:
	ldrh r0, [r6]
	cmp r0, r4
	bhi _0808CD3A
	subs r0, r4, r0
	lsls r0, r0, #1
	add r0, sl
	ldrh r3, [r0]
	stm r2!, {r3}
	stm r2!, {r5}
	ldrh r0, [r6]
	subs r0, r4, r0
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #0xc
	asrs r1, r0, #8
	movs r0, #0xf0
	lsls r0, r0, #8
	subs r0, r0, r1
	asrs r1, r0, #1
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r1, r0, #8
	ldr r0, _0808CD24 @ =0x07FFFFFF
	cmp r1, r0
	ble _0808CCBC
	adds r1, r0, #0
_0808CCBC:
	rsbs r0, r1, #0
	stm r2!, {r0}
	mov r1, sb
	lsls r0, r1, #8
	muls r0, r3, r0
	asrs r1, r0, #8
	ldr r0, _0808CD28 @ =0x00001F7F
	cmp r1, r0
	ble _0808CD2C
	movs r3, #0
	mov sb, r3
	movs r0, #0
	ldrsh r1, [r7, r0]
	b _0808CD32
	.align 2, 0
_0808CCD8: .4byte 0x04000128
_0808CCDC: .4byte 0x0000BFFF
_0808CCE0: .4byte gDispCnt
_0808CCE4: .4byte gWinRegs
_0808CCE8: .4byte 0x00000F38
_0808CCEC: .4byte 0x00000F3A
_0808CCF0: .4byte 0xFFFFFD00
_0808CCF4: .4byte gUnknown_03001870
_0808CCF8: .4byte gUnknown_03004D50
_0808CCFC: .4byte sub_808D874
_0808CD00: .4byte gUnknown_03001840
_0808CD04: .4byte gUnknown_030026E0
_0808CD08: .4byte gUnknown_0300188C
_0808CD0C: .4byte sub_808DB2C
_0808CD10: .4byte gUnknown_03002A80
_0808CD14: .4byte gUnknown_03002878
_0808CD18: .4byte 0x04000020
_0808CD1C: .4byte gUnknown_03001884
_0808CD20: .4byte 0x00000DF4
_0808CD24: .4byte 0x07FFFFFF
_0808CD28: .4byte 0x00001F7F
_0808CD2C:
	movs r3, #0
	ldrsh r0, [r7, r3]
	adds r1, r1, r0
_0808CD32:
	stm r2!, {r1}
	movs r0, #1
	add sb, r0
	b _0808CD4E
_0808CD3A:
	stm r2!, {r5}
	stm r2!, {r5}
	stm r2!, {r5}
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r1, [r6]
	subs r0, r0, r1
	lsls r0, r0, #8
	stm r2!, {r0}
_0808CD4E:
	adds r4, #1
	cmp r4, #0x9f
	bls _0808CC82
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808CD64
sub_808CD64: @ 0x0808CD64
	push {r4, lr}
	movs r1, #0xf5
	lsls r1, r1, #4
	adds r2, r0, r1
	ldrh r4, [r2]
	subs r1, #2
	adds r3, r0, r1
	ldrh r1, [r3]
	strh r1, [r2]
	ldr r1, _0808CDA0 @ =0x00000F4C
	adds r2, r0, r1
	ldrh r1, [r2]
	strh r1, [r3]
	ldr r1, _0808CDA4 @ =0x00000F4A
	adds r3, r0, r1
	ldrh r1, [r3]
	strh r1, [r2]
	ldr r1, _0808CDA8 @ =0x00000F48
	adds r2, r0, r1
	ldrh r1, [r2]
	strh r1, [r3]
	ldr r1, _0808CDAC @ =0x00000F46
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CDA0: .4byte 0x00000F4C
_0808CDA4: .4byte 0x00000F4A
_0808CDA8: .4byte 0x00000F48
_0808CDAC: .4byte 0x00000F46

	thumb_func_start sub_808CDB0
sub_808CDB0: @ 0x0808CDB0
	push {r4, lr}
	lsls r1, r1, #0x18
	asrs r1, r1, #0x13
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	ldrh r3, [r1]
	ldr r4, _0808CDFC @ =0x00000F44
	adds r2, r0, r4
	strh r3, [r2]
	ldrh r3, [r1, #2]
	adds r4, #2
	adds r2, r0, r4
	strh r3, [r2]
	ldrh r3, [r1, #4]
	adds r4, #2
	adds r2, r0, r4
	strh r3, [r2]
	ldrh r3, [r1, #6]
	adds r4, #2
	adds r2, r0, r4
	strh r3, [r2]
	ldrh r3, [r1, #8]
	adds r4, #2
	adds r2, r0, r4
	strh r3, [r2]
	ldrh r3, [r1, #0xa]
	adds r4, #2
	adds r2, r0, r4
	strh r3, [r2]
	ldrh r1, [r1, #0xc]
	movs r2, #0xf5
	lsls r2, r2, #4
	adds r0, r0, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808CDFC: .4byte 0x00000F44

	thumb_func_start sub_808CE00
sub_808CE00: @ 0x0808CE00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	mov sl, r3
	ldr r0, [sp, #0x2c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r1, sl
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0808CED8 @ =sub_808CEFC
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #3
	bl sub_8007C10
	str r0, [r4, #4]
	movs r2, #0
	ldr r0, _0808CEDC @ =0x0000033F
	strh r0, [r4, #0xa]
	ldr r1, _0808CEE0 @ =gUnknown_03000020
	adds r0, r5, r1
	strb r2, [r0]
	ldr r0, _0808CEE4 @ =gUnknown_03000021
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r6, [r4, #0x16]
	mov r1, r8
	strh r1, [r4, #0x18]
	mov r0, sb
	strh r0, [r4, #8]
	movs r0, #0xc0
	strh r0, [r4, #0x1a]
	mov r1, sb
	strh r1, [r4, #0x1c]
	ldr r0, _0808CEE8 @ =gUnknown_03000022
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0808CEEC @ =gUnknown_03000025
	adds r0, r5, r1
	strb r2, [r0]
	mov r0, sb
	str r0, [r4, #0x10]
	adds r0, r4, #0
	str r2, [sp, #8]
	bl sub_8004558
	ldr r1, _0808CEF0 @ =gBgScrollRegs
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x30]
	ldrh r0, [r1, #6]
	strh r0, [r4, #0x32]
	lsls r6, r6, #7
	strh r6, [r4, #0x38]
	mov r1, r8
	lsls r1, r1, #7
	strh r1, [r4, #0x3a]
	mov r0, sl
	strh r0, [r4, #0x34]
	strh r7, [r4, #0x36]
	ldr r1, _0808CEF4 @ =gUnknown_0300003C
	adds r0, r5, r1
	ldr r2, [sp, #8]
	strb r2, [r0]
	adds r1, #1
	adds r0, r5, r1
	strb r2, [r0]
	ldr r0, _0808CEF8 @ =gUnknown_0300003E
	adds r5, r5, r0
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r5]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CED8: .4byte sub_808CEFC
_0808CEDC: .4byte 0x0000033F
_0808CEE0: .4byte gUnknown_03000020
_0808CEE4: .4byte gUnknown_03000021
_0808CEE8: .4byte gUnknown_03000022
_0808CEEC: .4byte gUnknown_03000025
_0808CEF0: .4byte gBgScrollRegs
_0808CEF4: .4byte gUnknown_0300003C
_0808CEF8: .4byte gUnknown_0300003E

	thumb_func_start sub_808CEFC
sub_808CEFC: @ 0x0808CEFC
	push {r4, r5, lr}
	ldr r0, _0808CF1C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r5, r4, #0
	ldr r1, _0808CF20 @ =gUnknown_0300003C
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808CF24
	cmp r0, #1
	beq _0808CF2A
	b _0808CF42
	.align 2, 0
_0808CF1C: .4byte gCurTask
_0808CF20: .4byte gUnknown_0300003C
_0808CF24:
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	b _0808CF40
_0808CF2A:
	ldr r1, _0808CF6C @ =gUnknown_08097AA4
	ldr r3, _0808CF70 @ =gUnknown_0300003D
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1a
	ldrh r0, [r4, #0x3a]
	subs r0, r0, r1
_0808CF40:
	strh r0, [r4, #0x3a]
_0808CF42:
	ldrh r0, [r4, #0x34]
	ldrh r1, [r4, #0x38]
	adds r2, r0, r1
	strh r2, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	ldrh r3, [r4, #0x3a]
	adds r0, r0, r3
	strh r0, [r4, #0x3a]
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0808CF78
	lsls r0, r2, #0x10
	asrs r0, r0, #0x17
	ldr r2, _0808CF74 @ =0xFFFFE000
	adds r1, r2, #0
	orrs r0, r1
	b _0808CF7C
	.align 2, 0
_0808CF6C: .4byte gUnknown_08097AA4
_0808CF70: .4byte gUnknown_0300003D
_0808CF74: .4byte 0xFFFFE000
_0808CF78:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x17
_0808CF7C:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #0x30]
	adds r0, r0, r3
	ldr r2, _0808CFAC @ =gBgScrollRegs
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	movs r1, #0x3a
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0808CFB4
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	ldr r3, _0808CFB0 @ =0xFFFFE000
	adds r1, r3, #0
	orrs r0, r1
	b _0808CFBA
	.align 2, 0
_0808CFAC: .4byte gBgScrollRegs
_0808CFB0: .4byte 0xFFFFE000
_0808CFB4:
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
_0808CFBA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x32]
	adds r0, r0, r1
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r5, #0x16]
	adds r0, #0x40
	lsls r0, r0, #0x10
	movs r1, #0xb8
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0808CFEA
	bl sub_808D76C
_0808CFEA:
	ldrh r0, [r5, #0x18]
	adds r0, #0x40
	lsls r0, r0, #0x10
	movs r1, #0x9a
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0808CFFC
	bl sub_808D76C
_0808CFFC:
	adds r3, r4, #0
	adds r3, #0x3d
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _0808D02A
	ldr r1, _0808D030 @ =gUnknown_080E10D4
	adds r2, r4, #0
	adds r2, #0x3e
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r0, #0
	strb r0, [r3]
_0808D02A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D030: .4byte gUnknown_080E10D4

	thumb_func_start sub_808D034
sub_808D034: @ 0x0808D034
	push {r4, r5, r6, lr}
	ldr r6, _0808D090 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	ldr r1, _0808D094 @ =gUnknown_080E1063
	ldrb r0, [r4, #0x10]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r3, _0808D098 @ =gBldRegs
	ldrb r1, [r4, #0x10]
	lsls r2, r1, #1
	lsls r1, r1, #9
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r3, #2]
	adds r0, r5, #0
	bl sub_80051E8
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0808D08A
	ldrh r0, [r4, #0x12]
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x10]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r0, [r6]
	bl TaskDestroy
_0808D08A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D090: .4byte gCurTask
_0808D094: .4byte gUnknown_080E1063
_0808D098: .4byte gBldRegs

	thumb_func_start sub_808D09C
sub_808D09C: @ 0x0808D09C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0808D118 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	movs r3, #0
	movs r2, #0
	ldrb r1, [r4, #0x10]
	movs r0, #7
	subs r0, r0, r1
	ldr r7, _0808D11C @ =gBldRegs
	cmp r3, r0
	bge _0808D0D0
	ldr r6, _0808D120 @ =gUnknown_080E1063
	adds r1, r0, #0
_0808D0C0:
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r2, #1
	cmp r2, r1
	blt _0808D0C0
_0808D0D0:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	strh r0, [r5, #0x16]
	ldrb r1, [r4, #0x10]
	lsls r1, r1, #1
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r7, #2]
	adds r0, r5, #0
	bl sub_80051E8
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0808D112
	ldrh r0, [r4, #0x12]
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x10]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r0, _0808D118 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808D112:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D118: .4byte gCurTask
_0808D11C: .4byte gBldRegs
_0808D120: .4byte gUnknown_080E1063

	thumb_func_start sub_808D124
sub_808D124: @ 0x0808D124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0808D21C @ =sub_808D23C
	movs r1, #0x82
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	movs r3, #0
	str r3, [sp]
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	movs r0, #0
	mov sb, r0
	ldr r4, _0808D220 @ =gUnknown_03000180
	adds r6, r1, r4
	ldr r0, _0808D224 @ =gUnknown_03000008
	adds r5, r1, r0
	ldr r4, _0808D228 @ =gUnknown_080E10F6
	mov sl, r4
	mov r7, r8
_0808D15E:
	mov r0, sb
	lsls r4, r0, #1
	movs r0, #0x40
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0xd0
	lsls r0, r0, #2
	strh r0, [r5, #2]
	ldr r0, _0808D22C @ =gUnknown_080E10E6
	adds r0, r4, r0
	ldrh r0, [r0]
	strb r0, [r5, #0x18]
	movs r0, #0xff
	strb r0, [r5, #0x19]
	movs r3, #0xf0
	lsls r3, r3, #1
	add r3, r8
	adds r3, r3, r4
	mov r0, sl
	ldrh r1, [r0]
	strh r1, [r3]
	movs r2, #0xf8
	lsls r2, r2, #1
	add r2, r8
	adds r2, r2, r4
	ldrh r0, [r0, #2]
	strh r0, [r2]
	movs r4, #0
	strh r4, [r5]
	movs r0, #8
	mov r4, sb
	subs r0, r0, r4
	lsls r0, r0, #6
	strh r0, [r5, #0x12]
	movs r0, #0
	strh r0, [r5, #0x14]
	movs r0, #0x10
	strb r0, [r5, #0x1a]
	movs r4, #0
	strb r4, [r5, #0x1d]
	movs r0, #0x60
	mov r4, sb
	orrs r0, r4
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r6]
	lsls r1, r1, #1
	adds r1, #0xb0
	strh r1, [r6, #2]
	strh r1, [r6, #4]
	ldrh r0, [r3]
	strh r0, [r6, #6]
	ldrh r0, [r2]
	strh r0, [r6, #8]
	adds r0, r7, #0
	bl sub_8004558
	adds r6, #0xc
	adds r5, #0x30
	movs r4, #4
	add sl, r4
	adds r7, #0x30
	movs r0, #1
	add sb, r0
	mov r4, sb
	cmp r4, #7
	bls _0808D15E
	ldr r2, _0808D230 @ =gBgScrollRegs
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, r8
	movs r3, #0
	strh r1, [r0]
	ldrh r1, [r2, #6]
	ldr r0, _0808D234 @ =0x00000202
	add r0, r8
	strh r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #2
	add r0, r8
	strb r3, [r0]
	ldr r0, _0808D238 @ =0x00000205
	add r0, r8
	strb r3, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D21C: .4byte sub_808D23C
_0808D220: .4byte gUnknown_03000180
_0808D224: .4byte gUnknown_03000008
_0808D228: .4byte gUnknown_080E10F6
_0808D22C: .4byte gUnknown_080E10E6
_0808D230: .4byte gBgScrollRegs
_0808D234: .4byte 0x00000202
_0808D238: .4byte 0x00000205

	thumb_func_start sub_808D23C
sub_808D23C: @ 0x0808D23C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0808D334 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r0, _0808D338 @ =gUnknown_03000202
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, #3
	strh r0, [r1]
	ldr r1, _0808D33C @ =gBgScrollRegs
	ldrh r0, [r1, #2]
	subs r0, #3
	strh r0, [r1, #2]
	ldr r1, _0808D340 @ =gBldRegs
	ldr r0, _0808D344 @ =0x00003F50
	strh r0, [r1]
	ldr r0, _0808D348 @ =0x00001F07
	strh r0, [r1, #2]
	ldr r1, _0808D34C @ =gUnknown_03000205
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0808D30C
	movs r3, #0
	mov sb, r3
	ldr r0, _0808D34C @ =gUnknown_03000205
	adds r0, r0, r2
	mov sl, r0
	ldr r1, _0808D350 @ =gUnknown_03000186
	adds r6, r2, r1
	ldr r3, _0808D354 @ =gUnknown_03000180
	adds r3, r3, r2
	mov r8, r3
	adds r5, r7, #0
_0808D294:
	mov r0, sb
	lsls r4, r0, #1
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r3, sl
	ldrb r2, [r3]
	lsls r2, r2, #4
	movs r1, #0
	str r1, [sp]
	subs r1, #0x14
	movs r3, #8
	bl sub_8085654
	strh r0, [r6]
	movs r2, #0xf8
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r2, #0x12
	adds r1, r7, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r0, r0, r1
	ldr r2, _0808D33C @ =gBgScrollRegs
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r0, r0, r2
	adds r2, #0x14
	subs r1, r1, r2
	mov r3, sl
	ldrb r2, [r3]
	lsls r2, r2, #4
	movs r3, #0
	str r3, [sp]
	movs r3, #8
	bl sub_8085654
	strh r0, [r6, #2]
	adds r0, r5, #0
	mov r1, r8
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	adds r6, #0xc
	movs r0, #0xc
	add r8, r0
	adds r5, #0x30
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #7
	bls _0808D294
_0808D30C:
	ldr r3, _0808D358 @ =0x00000205
	adds r1, r7, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x11
	bls _0808D322
	bl sub_808D7F0
_0808D322:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D334: .4byte gCurTask
_0808D338: .4byte gUnknown_03000202
_0808D33C: .4byte gBgScrollRegs
_0808D340: .4byte gBldRegs
_0808D344: .4byte 0x00003F50
_0808D348: .4byte 0x00001F07
_0808D34C: .4byte gUnknown_03000205
_0808D350: .4byte gUnknown_03000186
_0808D354: .4byte gUnknown_03000180
_0808D358: .4byte 0x00000205

	thumb_func_start sub_808D35C
sub_808D35C: @ 0x0808D35C
	push {r4, r5, lr}
	ldr r0, _0808D37C @ =gUnknown_03005B64
	ldr r1, [r0]
	movs r2, #0xdd
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r5, [r0]
	ldrb r1, [r1, #6]
	subs r0, r1, #1
	cmp r0, #5
	bhi _0808D3B0
	lsls r0, r0, #2
	ldr r1, _0808D380 @ =_0808D384
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D37C: .4byte gUnknown_03005B64
_0808D380: .4byte _0808D384
_0808D384: @ jump table
	.4byte _0808D39C @ case 0
	.4byte _0808D3AC @ case 1
	.4byte _0808D3A0 @ case 2
	.4byte _0808D3A4 @ case 3
	.4byte _0808D3A8 @ case 4
	.4byte _0808D3AC @ case 5
_0808D39C:
	movs r4, #0
	b _0808D3B4
_0808D3A0:
	movs r4, #3
	b _0808D3B4
_0808D3A4:
	movs r4, #2
	b _0808D3B4
_0808D3A8:
	movs r4, #4
	b _0808D3B4
_0808D3AC:
	movs r4, #1
	b _0808D3B4
_0808D3B0:
	movs r4, #1
	ands r4, r1
_0808D3B4:
	ldr r2, _0808D408 @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r2]
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r0, _0808D40C @ =gUnknown_080AED70
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UnCompWram
	ldr r0, _0808D410 @ =gUnknown_02000008
	str r5, [r0]
	adds r0, #4
	str r4, [r0]
	bl sub_80854DC
	adds r4, r0, #0
	bl sub_80854DC
	ldr r2, _0808D414 @ =gUnknown_02000010
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _0808D418 @ =gUnknown_03002264
	ldr r1, [r1]
	adds r4, r4, r1
	lsls r4, r4, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r4, r0
	str r4, [r2]
	movs r0, #0
	bl SoftResetExram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D408: .4byte gUnknown_03001840
_0808D40C: .4byte gUnknown_080AED70
_0808D410: .4byte gUnknown_02000008
_0808D414: .4byte gUnknown_02000010
_0808D418: .4byte gUnknown_03002264

	thumb_func_start sub_808D41C
sub_808D41C: @ 0x0808D41C
	push {lr}
	sub sp, #4
	ldr r2, _0808D450 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808D454 @ =sub_808D53C
	ldr r1, _0808D458 @ =0x00000F64
	movs r2, #0x80
	lsls r2, r2, #5
	movs r3, #0
	str r3, [sp]
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_808B560
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808D450: .4byte 0x04000128
_0808D454: .4byte sub_808D53C
_0808D458: .4byte 0x00000F64

	thumb_func_start sub_808D45C
sub_808D45C: @ 0x0808D45C
	push {lr}
	sub sp, #4
	ldr r2, _0808D490 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808D494 @ =sub_808CA6C
	ldr r1, _0808D498 @ =0x00000F64
	movs r2, #0x80
	lsls r2, r2, #5
	movs r3, #0
	str r3, [sp]
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_808B560
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808D490: .4byte 0x04000128
_0808D494: .4byte sub_808CA6C
_0808D498: .4byte 0x00000F64

	thumb_func_start sub_808D49C
sub_808D49C: @ 0x0808D49C
	push {lr}
	sub sp, #4
	ldr r2, _0808D4D0 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808D4D4 @ =sub_808CAFC
	ldr r1, _0808D4D8 @ =0x00000F64
	movs r2, #0x80
	lsls r2, r2, #5
	movs r3, #0
	str r3, [sp]
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_808B560
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808D4D0: .4byte 0x04000128
_0808D4D4: .4byte sub_808CAFC
_0808D4D8: .4byte 0x00000F64

	thumb_func_start sub_808D4DC
sub_808D4DC: @ 0x0808D4DC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x9c
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r3, _0808D52C @ =gUnknown_03001840
	ldr r1, [r3]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r3]
	movs r2, #0
	movs r1, #1
	strh r1, [r0]
	strh r2, [r0, #4]
	movs r1, #2
	strh r1, [r0, #2]
	adds r1, #0xfe
	strh r1, [r0, #6]
	ldr r1, _0808D530 @ =0x00003FBF
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bl sub_802D4CC
	bl m4aMPlayAllStop
	adds r0, r4, #0
	bl sub_808B884
	adds r0, r4, #0
	bl sub_808D740
	ldr r0, _0808D534 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808D538 @ =sub_808C8EC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D52C: .4byte gUnknown_03001840
_0808D530: .4byte 0x00003FBF
_0808D534: .4byte gCurTask
_0808D538: .4byte sub_808C8EC

	thumb_func_start sub_808D53C
sub_808D53C: @ 0x0808D53C
	push {r4, r5, r6, lr}
	ldr r6, _0808D584 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r1, _0808D588 @ =gUnknown_030000C0
	adds r0, r5, r1
	bl sub_80051E8
	adds r0, r4, #0
	bl sub_808D740
	ldr r1, _0808D58C @ =gUnknown_03000270
	adds r0, r5, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808D57C
	movs r0, #0xc9
	bl m4aSongNumStart
	ldr r0, _0808D590 @ =gUnknown_03000F3E
	adds r1, r5, r0
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r6]
	ldr r0, _0808D594 @ =sub_808C218
	str r0, [r1, #8]
_0808D57C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D584: .4byte gCurTask
_0808D588: .4byte gUnknown_030000C0
_0808D58C: .4byte gUnknown_03000270
_0808D590: .4byte gUnknown_03000F3E
_0808D594: .4byte sub_808C218

	thumb_func_start sub_808D598
sub_808D598: @ 0x0808D598
	push {r4, r5, lr}
	ldr r5, _0808D5E4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r0, _0808D5E8 @ =gUnknown_03000270
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808D5DC
	ldr r1, [r5]
	ldr r0, _0808D5EC @ =sub_808BA78
	str r0, [r1, #8]
	ldr r1, _0808D5F0 @ =gBldRegs
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1, #2]
	ldr r0, _0808D5F4 @ =0x00000441
	strh r0, [r1]
	ldr r2, _0808D5F8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0808D5DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D5E4: .4byte gCurTask
_0808D5E8: .4byte gUnknown_03000270
_0808D5EC: .4byte sub_808BA78
_0808D5F0: .4byte gBldRegs
_0808D5F4: .4byte 0x00000441
_0808D5F8: .4byte gDispCnt

	thumb_func_start sub_808D5FC
sub_808D5FC: @ 0x0808D5FC
	push {r4, r5, lr}
	ldr r5, _0808D630 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r0, _0808D634 @ =gUnknown_03000F3E
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0x78
	bls _0808D622
	movs r0, #0
	strh r0, [r4]
	ldr r1, [r5]
	ldr r0, _0808D638 @ =sub_808BAD8
	str r0, [r1, #8]
_0808D622:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D630: .4byte gCurTask
_0808D634: .4byte gUnknown_03000F3E
_0808D638: .4byte sub_808BAD8

	thumb_func_start sub_808D63C
sub_808D63C: @ 0x0808D63C
	push {r4, r5, lr}
	ldr r5, _0808D670 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_808CBA4
	ldr r0, _0808D674 @ =gUnknown_03000F3E
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0x78
	bls _0808D662
	ldr r0, [r5]
	ldr r1, _0808D678 @ =sub_808BC54
	str r1, [r0, #8]
	movs r0, #0
	strh r0, [r4]
_0808D662:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D670: .4byte gCurTask
_0808D674: .4byte gUnknown_03000F3E
_0808D678: .4byte sub_808BC54

	thumb_func_start sub_808D67C
sub_808D67C: @ 0x0808D67C
	push {r4, r5, r6, lr}
	ldr r6, _0808D6C4 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0808D6C8 @ =gUnknown_03000F3E
	adds r4, r1, r0
	ldrh r0, [r4]
	cmp r0, #0x3c
	bls _0808D6B0
	ldr r2, _0808D6CC @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	strh r0, [r4]
	movs r0, #0xc9
	bl m4aSongNumStart
	ldr r1, [r6]
	ldr r0, _0808D6D0 @ =sub_808C218
	str r0, [r1, #8]
_0808D6B0:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_808D740
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D6C4: .4byte gCurTask
_0808D6C8: .4byte gUnknown_03000F3E
_0808D6CC: .4byte gUnknown_03001840
_0808D6D0: .4byte sub_808C218

	thumb_func_start sub_808D6D4
sub_808D6D4: @ 0x0808D6D4
	push {lr}
	ldr r1, _0808D71C @ =gUnknown_030053C0
	movs r3, #0
	movs r0, #2
	strb r0, [r1, #8]
	ldr r1, _0808D720 @ =gUnknown_030053B0
	ldr r0, _0808D724 @ =gUnknown_08C87AAC
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0808D728 @ =gUnknown_030054F0
	strb r3, [r0]
	ldr r1, _0808D72C @ =gUnknown_030055B4
	ldr r0, _0808D730 @ =gUnknown_080E10DE
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _0808D734 @ =gUnknown_030054C8
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0808D738 @ =gUnknown_030054CC
	strb r3, [r0]
	bl sub_8009F94
	bl sub_801A6D8
	bl sub_801A770
	ldr r0, _0808D73C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0808D71C: .4byte gUnknown_030053C0
_0808D720: .4byte gUnknown_030053B0
_0808D724: .4byte gUnknown_08C87AAC
_0808D728: .4byte gUnknown_030054F0
_0808D72C: .4byte gUnknown_030055B4
_0808D730: .4byte gUnknown_080E10DE
_0808D734: .4byte gUnknown_030054C8
_0808D738: .4byte gUnknown_030054CC
_0808D73C: .4byte gCurTask

	thumb_func_start sub_808D740
sub_808D740: @ 0x0808D740
	push {lr}
	sub sp, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, _0808D768 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_8003EE4
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0808D768: .4byte gBgAffineRegs

	thumb_func_start sub_808D76C
sub_808D76C: @ 0x0808D76C
	push {r4, lr}
	ldr r4, _0808D78C @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D78C: .4byte gCurTask

	thumb_func_start sub_808D790
sub_808D790: @ 0x0808D790
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0
	bne _0808D7B4
	ldr r0, _0808D7B0 @ =sub_808D034
	movs r2, #0x80
	lsls r2, r2, #6
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	b _0808D7CA
	.align 2, 0
_0808D7B0: .4byte sub_808D034
_0808D7B4:
	cmp r1, #1
	bne _0808D7E4
	ldr r0, _0808D7EC @ =sub_808D09C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
_0808D7CA:
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r4, #0x10]
	str r4, [r2]
	ldrh r0, [r4, #0x16]
	movs r1, #0
	strh r0, [r2, #0x12]
	strb r1, [r2, #0x10]
_0808D7E4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D7EC: .4byte sub_808D09C

	thumb_func_start sub_808D7F0
sub_808D7F0: @ 0x0808D7F0
	push {r4, r5, lr}
	ldr r0, _0808D81C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r5, #0
	ldr r1, _0808D820 @ =IWRAM_START+4
	adds r4, r0, r1
_0808D7FE:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #7
	bls _0808D7FE
	ldr r0, _0808D81C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D81C: .4byte gCurTask
_0808D820: .4byte IWRAM_START+4

	thumb_func_start sub_808D824
sub_808D824: @ 0x0808D824
	push {r4, lr}
	sub sp, #4
	ldr r4, _0808D864 @ =gCurTask
	ldr r2, _0808D868 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808D86C @ =sub_808D53C
	movs r1, #0
	str r1, [sp]
	ldr r1, _0808D870 @ =0x00000F64
	movs r2, #0x80
	lsls r2, r2, #5
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_808B560
	ldr r0, [r4]
	bl TaskDestroy
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D864: .4byte gCurTask
_0808D868: .4byte 0x04000128
_0808D86C: .4byte sub_808D53C
_0808D870: .4byte 0x00000F64

	thumb_func_start sub_808D874
sub_808D874: @ 0x0808D874
	push {lr}
	ldr r0, _0808D894 @ =gUnknown_080E0EF4
	ldr r1, _0808D898 @ =0x050001C0
	movs r2, #1
	bl CpuFastSet
	ldr r2, _0808D89C @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0808D894: .4byte gUnknown_080E0EF4
_0808D898: .4byte 0x050001C0
_0808D89C: .4byte 0x04000128

	thumb_func_start sub_808D8A0
sub_808D8A0: @ 0x0808D8A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0808D984 @ =0xFFFFFE00
	add sp, r4
	adds r5, r0, #0
	movs r0, #0xc
	adds r0, r0, r5
	mov ip, r0
	movs r6, #0
	movs r1, #0xf8
	lsls r1, r1, #2
	mov sb, r1
	movs r2, #0xf8
	lsls r2, r2, #7
	mov r8, r2
_0808D8C2:
	movs r0, #1
	ands r0, r6
	lsls r1, r6, #1
	mov r2, ip
	adds r0, r1, r2
	ldrh r2, [r0]
	adds r7, r1, #0
	movs r0, #0x1f
	ands r0, r2
	movs r1, #6
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D8EA
	movs r1, #0x1f
_0808D8EA:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D8F2
	movs r1, #0
_0808D8F2:
	adds r4, r1, #0
	adds r0, r2, #0
	mov r1, sb
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #7
	ldrsb r1, [r5, r1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D910
	movs r1, #0x1f
_0808D910:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D918
	movs r1, #0
_0808D918:
	lsls r0, r1, #0x10
	asrs r0, r0, #0xb
	orrs r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, r8
	ands r2, r0
	lsrs r0, r2, #0xa
	movs r1, #8
	ldrsb r1, [r5, r1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D93C
	movs r1, #0x1f
_0808D93C:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D944
	movs r1, #0
_0808D944:
	lsls r0, r1, #0x10
	asrs r0, r0, #6
	orrs r0, r4
	mov r2, sp
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xff
	bls _0808D8C2
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	movs r2, #0x80
	bl CpuFastSet
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r5, #4]
	lsrs r0, r0, #8
	strb r0, [r5, #1]
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D984: .4byte 0xFFFFFE00

	thumb_func_start sub_808D988
sub_808D988: @ 0x0808D988
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0808D9E0 @ =gUnknown_03005B80
	ldr r4, [r0]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r0, r2
	cmp sb, r0
	beq _0808D9AA
	b _0808DAA8
_0808D9AA:
	ldrb r0, [r4]
	adds r7, r4, #0
	adds r7, #0x14
	cmp r0, #0
	bne _0808D9C4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r7, #0
	movs r2, #1
	bl CpuFastSet
	movs r0, #1
	strb r0, [r4]
_0808D9C4:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0808D9E4
	ldrb r1, [r4, #1]
	lsls r1, r1, #4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r7, #0
	movs r2, #1
	bl CpuFastSet
	b _0808DA72
	.align 2, 0
_0808D9E0: .4byte gUnknown_03005B80
_0808D9E4:
	movs r6, #0
	movs r0, #0xf8
	lsls r0, r0, #2
	mov r8, r0
	movs r1, #0xf8
	lsls r1, r1, #7
	mov ip, r1
_0808D9F2:
	lsls r5, r6, #1
	adds r0, r7, r5
	ldrh r2, [r0]
	movs r1, #0x1f
	ands r1, r2
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808DA0E
	movs r1, #0x1f
_0808DA0E:
	adds r3, r1, #0
	mov r1, r8
	ands r1, r2
	lsrs r1, r1, #5
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808DA28
	movs r1, #0x1f
_0808DA28:
	lsls r0, r1, #0x10
	asrs r0, r0, #0xb
	orrs r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #0xa
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808DA4A
	movs r1, #0x1f
_0808DA4A:
	lsls r0, r1, #0x10
	asrs r0, r0, #6
	orrs r0, r3
	mov r2, sp
	adds r1, r2, r5
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0808D9F2
	ldrb r1, [r4, #1]
	lsls r1, r1, #4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	mov r0, sp
	movs r2, #1
	bl CpuFastSet
_0808DA72:
	ldrb r0, [r4, #0xc]
	ldrb r1, [r4, #0xf]
	adds r0, r0, r1
	strb r0, [r4, #0xf]
	ldrb r0, [r4, #0xd]
	ldrb r2, [r4, #0x10]
	adds r0, r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0xe]
	ldrb r1, [r4, #0x11]
	adds r0, r0, r1
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #0x12]
	ldrb r2, [r4, #0x13]
	adds r0, r0, r2
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #2]
	adds r0, #1
	strb r0, [r4, #2]
	ldrb r1, [r4, #2]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0808DAA8
	movs r0, #0
	strb r0, [r4, #2]
_0808DAA8:
	mov r0, sb
	cmp r0, #0x9f
	bne _0808DABA
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #0xf]
	strb r0, [r4, #0x10]
	strb r0, [r4, #0x11]
	strb r0, [r4, #0x13]
_0808DABA:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808DAC8
sub_808DAC8: @ 0x0808DAC8
	push {r4, lr}
	movs r4, #0
	strb r4, [r3]
	strb r4, [r3, #2]
	strb r4, [r3, #0xc]
	strb r4, [r3, #0xd]
	strb r4, [r3, #0xe]
	strh r4, [r3, #0x34]
	strb r0, [r3, #1]
	str r1, [r3, #4]
	str r2, [r3, #8]
	ldr r0, _0808DAE8 @ =gUnknown_03005B80
	str r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DAE8: .4byte gUnknown_03005B80

	thumb_func_start sub_808DAEC
sub_808DAEC: @ 0x0808DAEC
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x14]
	movs r6, #0
	movs r5, #1
	strb r5, [r4]
	strb r6, [r4, #2]
	strb r1, [r4, #0xc]
	strb r2, [r4, #0xd]
	strb r3, [r4, #0xe]
	strb r6, [r4, #0xf]
	strb r6, [r4, #0x10]
	strb r6, [r4, #0x11]
	strb r6, [r4, #0x13]
	strh r6, [r4, #0x34]
	strb r0, [r4, #1]
	str r6, [r4, #4]
	str r6, [r4, #8]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r4, #0
	adds r1, #0x14
	movs r2, #1
	bl CpuFastSet
	ldr r0, _0808DB28 @ =gUnknown_03005B80
	str r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB28: .4byte gUnknown_03005B80

	thumb_func_start sub_808DB2C
sub_808DB2C: @ 0x0808DB2C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0808DB40 @ =gUnknown_03005B80
	ldr r4, [r0]
	cmp r3, #0x9e
	bls _0808DB44
	movs r0, #0
	b _0808DB70
	.align 2, 0
_0808DB40: .4byte gUnknown_03005B80
_0808DB44:
	ldrb r2, [r4, #2]
	ldr r1, [r4, #4]
	adds r1, r1, r2
	movs r5, #0x34
	ldrsh r0, [r4, r5]
	ldrb r1, [r1]
	adds r0, r0, r1
	cmp r3, r0
	blt _0808DB72
	lsls r1, r2, #5
	ldr r0, [r4, #8]
	adds r0, r0, r1
	ldrb r1, [r4, #1]
	lsls r1, r1, #5
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #1
	bl CpuFastSet
	ldrb r0, [r4, #2]
	adds r0, #1
_0808DB70:
	strb r0, [r4, #2]
_0808DB72:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808DB78
sub_808DB78: @ 0x0808DB78
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, [sp, #0xc]
	ldr r1, [sp, #0x10]
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strh r4, [r1, #2]
	strh r0, [r1, #4]
	strb r2, [r1, #6]
	strb r3, [r1, #7]
	strb r5, [r1, #8]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, #0xc
	movs r2, #0x80
	bl CpuFastSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808DBA4
sub_808DBA4: @ 0x0808DBA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x30]
	add r1, sp, #4
	ldr r0, _0808DCD0 @ =gUnknown_080E1208
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	add r6, sp, #0x10
	ldr r1, _0808DCD4 @ =gUnknown_080E1214
	adds r0, r6, #0
	movs r2, #0xc
	bl memcpy
	add r0, sp, #0x1c
	mov r8, r0
	ldr r1, _0808DCD8 @ =gUnknown_080E1220
	movs r2, #0xc
	bl memcpy
	mov r1, sp
	adds r1, #0x28
	str r1, [sp, #0x34]
	ldr r1, _0808DCDC @ =gUnknown_080E122C
	ldr r0, [sp, #0x34]
	movs r2, #6
	bl memcpy
	ldr r2, [sp, #0x30]
	lsls r4, r2, #2
	mov r0, sp
	adds r0, r0, r4
	adds r0, #4
	ldr r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #7
	ldr r1, _0808DCE0 @ =sub_808E890
	str r1, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sl, r0
	ldr r3, _0808DCE4 @ =gUnknown_03000078
	adds r0, r5, r3
	movs r1, #0
	movs r3, #0
	strh r3, [r0]
	ldr r2, _0808DCE8 @ =gUnknown_0300007A
	adds r0, r5, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	adds r0, r6, r4
	ldrh r1, [r0]
	subs r2, #0xc
	adds r0, r5, r2
	strh r1, [r0]
	ldr r0, [sp, #0x30]
	lsls r0, r0, #1
	mov sb, r0
	mov r1, sb
	adds r1, #1
	lsls r1, r1, #1
	adds r6, r6, r1
	ldrh r2, [r6]
	ldr r6, _0808DCEC @ =gUnknown_03000072
	adds r0, r5, r6
	strh r2, [r0]
	add r4, r8
	ldrh r2, [r4]
	ldr r4, _0808DCF0 @ =gUnknown_03000074
	adds r0, r5, r4
	strh r2, [r0]
	add r8, r1
	mov r6, r8
	ldrh r1, [r6]
	ldr r2, _0808DCF4 @ =gUnknown_03000076
	adds r0, r5, r2
	strh r1, [r0]
	ldr r0, _0808DCF8 @ =gUnknown_030059E0
	mov r4, sl
	str r0, [r4]
	ldr r6, _0808DCFC @ =IWRAM_START+4
	adds r7, r5, r6
	ldr r6, _0808DD00 @ =gUnknown_080E11E4
	ldr r4, [sp, #0x30]
	add r4, sb
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r3, [sp, #0x3c]
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	strh r0, [r7, #0xa]
	adds r4, #2
	lsls r4, r4, #2
	adds r4, r4, r6
	ldr r1, [r4]
	ldr r2, _0808DD04 @ =gUnknown_03000024
	adds r0, r5, r2
	strb r1, [r0]
	ldr r4, _0808DD08 @ =gUnknown_03000025
	adds r1, r5, r4
	movs r0, #0xff
	strb r0, [r1]
	ldr r3, [sp, #0x3c]
	strh r3, [r7, #0x16]
	strh r3, [r7, #0x18]
	strh r3, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r3, [r7, #0x1c]
	ldr r6, _0808DD0C @ =gUnknown_03000026
	adds r1, r5, r6
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, [sp, #0x34]
	add r0, sb
	ldrh r0, [r0]
	ldr r1, _0808DD10 @ =gUnknown_03000029
	adds r5, r5, r1
	strb r0, [r5]
	ldr r2, [sp, #0x30]
	cmp r2, #2
	beq _0808DD14
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r7, #0x10]
	b _0808DD16
	.align 2, 0
_0808DCD0: .4byte gUnknown_080E1208
_0808DCD4: .4byte gUnknown_080E1214
_0808DCD8: .4byte gUnknown_080E1220
_0808DCDC: .4byte gUnknown_080E122C
_0808DCE0: .4byte sub_808E890
_0808DCE4: .4byte gUnknown_03000078
_0808DCE8: .4byte gUnknown_0300007A
_0808DCEC: .4byte gUnknown_03000072
_0808DCF0: .4byte gUnknown_03000074
_0808DCF4: .4byte gUnknown_03000076
_0808DCF8: .4byte gUnknown_030059E0
_0808DCFC: .4byte IWRAM_START+4
_0808DD00: .4byte gUnknown_080E11E4
_0808DD04: .4byte gUnknown_03000024
_0808DD08: .4byte gUnknown_03000025
_0808DD0C: .4byte gUnknown_03000026
_0808DD10: .4byte gUnknown_03000029
_0808DD14:
	str r3, [r7, #0x10]
_0808DD16:
	adds r0, r7, #0
	bl sub_8004558
	movs r4, #0
	mov r3, sl
	str r4, [r3, #0x38]
	ldr r6, [sp, #0x30]
	cmp r6, #0
	bne _0808DD76
	mov r7, sl
	adds r7, #0x34
	movs r0, #6
	bl sub_8007C10
	str r0, [r7, #4]
	movs r1, #0
	movs r0, #0xea
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x54
	strb r1, [r0]
	mov r2, sl
	adds r2, #0x55
	movs r0, #0xff
	strb r0, [r2]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	strh r4, [r7, #8]
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r4, [r7, #0x1c]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	mov r0, sl
	adds r0, #0x59
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0xec
	bl m4aSongNumStart
_0808DD76:
	mov r0, sl
	adds r0, #0x64
	strh r4, [r0]
	movs r1, #0xff
	lsls r1, r1, #8
	strh r1, [r0, #2]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808DD9C
sub_808DD9C: @ 0x0808DD9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0808DF40 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #4
	adds r6, r4, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r2, _0808DF44 @ =gUnknown_03000064
	adds r2, r2, r4
	mov sl, r2
	adds r0, #0x6c
	adds r0, r0, r4
	mov ip, r0
	ldr r1, _0808DF48 @ =gUnknown_03000074
	adds r2, r4, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _0808DF4C @ =gUnknown_03000072
	adds r7, r4, r0
	ldr r1, _0808DF50 @ =gUnknown_03000076
	adds r3, r4, r1
	ldrh r0, [r3]
	ldrh r1, [r7]
	adds r0, r0, r1
	strh r0, [r7]
	ldrh r0, [r2]
	cmp r0, #0x60
	bls _0808DDF6
	adds r1, r0, #0
	lsls r0, r1, #8
	subs r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r2]
_0808DDF6:
	ldrh r1, [r3]
	ldr r0, _0808DF54 @ =0x000007FF
	cmp r1, r0
	bhi _0808DE0A
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
_0808DE0A:
	mov r2, ip
	ldrh r0, [r2]
	ldr r3, _0808DF58 @ =gUnknown_03005960
	ldr r1, [r3]
	lsls r1, r1, #8
	str r1, [sp, #4]
	mov r1, r8
	ldr r1, [r1, #8]
	mov sb, r1
	mov r2, sb
	ldr r1, [sp, #4]
	subs r2, r2, r1
	str r2, [sp]
	ldr r2, _0808DF5C @ =0xFFFFEC00
	mov sb, r2
	ldr r2, [sp]
	add r2, sb
	cmp r0, r2
	bge _0808DE34
	mov r0, ip
	strh r2, [r0]
_0808DE34:
	ldrh r1, [r7]
	str r1, [sp]
	ldr r1, [r3, #4]
	lsls r1, r1, #8
	mov r2, r8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	ldr r1, _0808DF60 @ =0xFFFFF600
	adds r0, r0, r1
	ldr r2, [sp]
	cmp r2, r0
	ble _0808DEAA
	strh r0, [r7]
	mov r1, r8
	ldr r0, [r1, #8]
	ldr r1, [r3]
	lsls r1, r1, #8
	subs r0, r0, r1
	add r0, sb
	mov r2, ip
	strh r0, [r2]
	ldr r0, _0808DF64 @ =gUnknown_0300007A
	adds r7, r4, r0
	ldrb r0, [r7]
	cmp r0, #0
	bne _0808DEAA
	mov r1, r8
	adds r1, #0x64
	movs r0, #0x52
	strh r0, [r1]
	ldr r0, [r5, #8]
	bl sub_8007CF0
	movs r0, #0x19
	bl sub_8007C10
	str r0, [r6, #4]
	movs r0, #0x82
	strh r0, [r6, #0xa]
	ldr r1, _0808DF68 @ =gUnknown_03000024
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _0808DF6C @ =gUnknown_03000025
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	strb r0, [r7]
	ldr r0, _0808DF70 @ =0x000001D3
	strh r0, [r5, #0x3e]
	ldr r1, _0808DF74 @ =gUnknown_03000054
	adds r0, r4, r1
	strb r2, [r0]
	ldr r2, _0808DF78 @ =gUnknown_03000055
	adds r1, r4, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_0808DEAA:
	adds r0, r5, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808DEC0
	ldr r0, [r5]
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov r1, sl
	strh r0, [r1]
_0808DEC0:
	adds r1, r5, #0
	adds r1, #0x70
	ldrh r0, [r1]
	lsrs r0, r0, #8
	strh r0, [r6, #0x16]
	adds r2, r5, #0
	adds r2, #0x72
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldrh r0, [r1]
	lsrs r0, r0, #8
	mov r1, sl
	strh r0, [r1, #6]
	ldrh r0, [r2]
	lsrs r0, r0, #8
	strh r0, [r1, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r0, [r6, #0x16]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r1, [r6, #0x18]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r1, r5, #0
	adds r1, #0x78
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc8
	bne _0808DF30
	ldr r0, _0808DF7C @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0808DF80 @ =gUnknown_030053F0
	ldrh r1, [r1]
	ldr r2, _0808DF84 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0808DF30:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DF40: .4byte gCurTask
_0808DF44: .4byte gUnknown_03000064
_0808DF48: .4byte gUnknown_03000074
_0808DF4C: .4byte gUnknown_03000072
_0808DF50: .4byte gUnknown_03000076
_0808DF54: .4byte 0x000007FF
_0808DF58: .4byte gUnknown_03005960
_0808DF5C: .4byte 0xFFFFEC00
_0808DF60: .4byte 0xFFFFF600
_0808DF64: .4byte gUnknown_0300007A
_0808DF68: .4byte gUnknown_03000024
_0808DF6C: .4byte gUnknown_03000025
_0808DF70: .4byte 0x000001D3
_0808DF74: .4byte gUnknown_03000054
_0808DF78: .4byte gUnknown_03000055
_0808DF7C: .4byte gUnknown_03005490
_0808DF80: .4byte gUnknown_030053F0
_0808DF84: .4byte gUnknown_030054F4

	thumb_func_start sub_808DF88
sub_808DF88: @ 0x0808DF88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0808E094 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #4
	adds r0, r0, r4
	mov r8, r0
	ldr r1, [r5]
	mov ip, r1
	ldr r2, _0808E098 @ =gUnknown_03000070
	adds r7, r4, r2
	ldr r0, _0808E09C @ =gUnknown_03000074
	adds r2, r4, r0
	ldrh r0, [r7]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r7]
	ldr r1, _0808E0A0 @ =gUnknown_03000072
	adds r6, r4, r1
	ldr r0, _0808E0A4 @ =gUnknown_03000076
	adds r3, r4, r0
	ldrh r0, [r3]
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r6]
	ldrh r0, [r2]
	cmp r0, #0x60
	bls _0808DFD8
	adds r1, r0, #0
	lsls r0, r1, #7
	subs r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
_0808DFD8:
	ldrh r0, [r3]
	cmp r0, #0x60
	bls _0808DFE8
	adds r1, r0, #0
	lsls r0, r1, #7
	subs r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r3]
_0808DFE8:
	ldrh r0, [r7]
	ldr r3, _0808E0A8 @ =gUnknown_03005960
	ldr r1, [r3]
	lsls r1, r1, #8
	mov r2, ip
	ldr r2, [r2, #8]
	mov sb, r2
	subs r2, r2, r1
	mov sl, r2
	ldr r1, _0808E0AC @ =0xFFFFE400
	mov sb, r1
	add r2, sb
	cmp r0, r2
	bge _0808E006
	strh r2, [r7]
_0808E006:
	ldrh r2, [r6]
	mov sl, r2
	ldr r1, [r3, #4]
	lsls r1, r1, #8
	mov r2, ip
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	ldr r1, _0808E0B0 @ =0xFFFFEC00
	adds r0, r0, r1
	cmp sl, r0
	ble _0808E052
	strh r0, [r6]
	ldr r0, [r2, #8]
	ldr r1, [r3]
	lsls r1, r1, #8
	subs r0, r0, r1
	add r0, sb
	strh r0, [r7]
	ldr r2, _0808E0B4 @ =gUnknown_0300007A
	adds r6, r4, r2
	ldrb r0, [r6]
	cmp r0, #0
	bne _0808E052
	ldr r0, [r5, #8]
	bl sub_8007CF0
	movs r0, #0x24
	bl sub_8007C10
	mov r1, r8
	str r0, [r1, #4]
	movs r0, #0xdf
	strh r0, [r1, #0xa]
	ldr r2, _0808E0B8 @ =gUnknown_03000024
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	strb r0, [r6]
_0808E052:
	adds r0, r5, #0
	adds r0, #0x70
	ldrh r0, [r0]
	lsrs r0, r0, #8
	mov r1, r8
	strh r0, [r1, #0x16]
	adds r0, r5, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808E0C0
	adds r2, r5, #0
	adds r2, #0x7b
	ldrb r0, [r2]
	adds r0, #4
	strb r0, [r2]
	ldr r1, _0808E0BC @ =gUnknown_08097AA4
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r5, #0
	adds r0, #0x72
	ldrh r0, [r0]
	lsrs r0, r0, #8
	adds r0, r0, r1
	mov r2, r8
	strh r0, [r2, #0x18]
	b _0808E0CC
	.align 2, 0
_0808E094: .4byte gCurTask
_0808E098: .4byte gUnknown_03000070
_0808E09C: .4byte gUnknown_03000074
_0808E0A0: .4byte gUnknown_03000072
_0808E0A4: .4byte gUnknown_03000076
_0808E0A8: .4byte gUnknown_03005960
_0808E0AC: .4byte 0xFFFFE400
_0808E0B0: .4byte 0xFFFFEC00
_0808E0B4: .4byte gUnknown_0300007A
_0808E0B8: .4byte gUnknown_03000024
_0808E0BC: .4byte gUnknown_08097AA4
_0808E0C0:
	adds r0, r5, #0
	adds r0, #0x72
	ldrh r0, [r0]
	lsrs r0, r0, #8
	mov r1, r8
	strh r0, [r1, #0x18]
_0808E0CC:
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
	adds r1, r5, #0
	adds r1, #0x78
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc8
	bne _0808E0FA
	ldr r0, _0808E108 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0808E10C @ =gUnknown_030053F0
	ldrh r1, [r1]
	ldr r2, _0808E110 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0808E0FA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E108: .4byte gUnknown_03005490
_0808E10C: .4byte gUnknown_030053F0
_0808E110: .4byte gUnknown_030054F4

	thumb_func_start sub_808E114
sub_808E114: @ 0x0808E114
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _0808E150 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	adds r0, #4
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [r6]
	mov sb, r1
	ldr r2, _0808E154 @ =gUnknown_03000078
	adds r1, r3, r2
	ldrh r0, [r1]
	cmp r0, #0x2d
	bhi _0808E15C
	ldr r4, _0808E158 @ =gUnknown_03000070
	adds r1, r3, r4
	subs r2, #4
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	b _0808E17E
	.align 2, 0
_0808E150: .4byte gCurTask
_0808E154: .4byte gUnknown_03000078
_0808E158: .4byte gUnknown_03000070
_0808E15C:
	ldr r2, _0808E254 @ =gUnknown_08097AA4
	ldrh r0, [r1]
	subs r0, #0x2d
	lsls r0, r0, #1
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #7
	ldr r2, _0808E258 @ =gUnknown_0300007C
	adds r0, r3, r2
	strb r1, [r0]
_0808E17E:
	adds r2, r6, #0
	adds r2, #0x74
	ldrh r0, [r2]
	cmp r0, #0x60
	bls _0808E192
	adds r1, r0, #0
	lsls r0, r1, #7
	subs r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
_0808E192:
	adds r5, r6, #0
	adds r5, #0x70
	ldrh r2, [r5]
	ldr r3, _0808E25C @ =gUnknown_03005960
	ldr r1, [r3]
	lsls r1, r1, #8
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, r0, r1
	ldr r1, _0808E260 @ =0xFFFFC000
	adds r0, r0, r1
	cmp r2, r0
	ble _0808E1AE
	strh r0, [r5]
_0808E1AE:
	adds r4, r6, #0
	adds r4, #0x72
	ldrh r0, [r4]
	lsrs r0, r0, #8
	ldr r1, [r3, #4]
	adds r0, r0, r1
	ldrh r1, [r5]
	lsrs r1, r1, #8
	ldr r2, [r3]
	adds r1, r1, r2
	adds r7, r6, #0
	adds r7, #0x7c
	movs r2, #0
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	ldr r2, _0808E264 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r1, r0, #0
	cmp r1, #0
	bge _0808E1E6
	lsls r0, r1, #8
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
_0808E1E6:
	cmp r1, #0
	ble _0808E1F6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4]
_0808E1F6:
	ldrh r1, [r5]
	lsrs r1, r1, #8
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r0, r0, r1
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r4]
	lsrs r0, r0, #8
	subs r0, #0xe
	strh r0, [r1, #0x18]
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
	adds r4, r6, #0
	adds r4, #0x78
	ldrh r0, [r4]
	cmp r0, #0x28
	bne _0808E22A
	mov r1, sb
	adds r1, #0x64
	movs r0, #0x52
	strh r0, [r1]
_0808E22A:
	ldrh r0, [r4]
	cmp r0, #0xc8
	bne _0808E240
	ldr r0, _0808E268 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0808E26C @ =gUnknown_030053F0
	ldrh r1, [r1]
	ldr r2, _0808E270 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0808E240:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E254: .4byte gUnknown_08097AA4
_0808E258: .4byte gUnknown_0300007C
_0808E25C: .4byte gUnknown_03005960
_0808E260: .4byte 0xFFFFC000
_0808E264: .4byte sub_801EC3C
_0808E268: .4byte gUnknown_03005490
_0808E26C: .4byte gUnknown_030053F0
_0808E270: .4byte gUnknown_030054F4

	thumb_func_start sub_808E274
sub_808E274: @ 0x0808E274
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r1, _0808E32C @ =gDispCnt
	movs r0, #0xb2
	lsls r0, r0, #5
	strh r0, [r1]
	ldr r1, _0808E330 @ =gBgCntRegs
	movs r4, #0
	movs r5, #0
	movs r0, #0xe0
	lsls r0, r0, #5
	strh r0, [r1]
	ldr r0, _0808E334 @ =0x00001D05
	strh r0, [r1, #2]
	ldr r0, _0808E338 @ =0x00005E0A
	strh r0, [r1, #4]
	str r5, [sp, #0x10]
	ldr r1, _0808E33C @ =0x040000D4
	add r0, sp, #0x10
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808E340 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0808E344 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _0808E348 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	strb r4, [r3, #2]
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	ldr r0, _0808E34C @ =gBgScrollRegs
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	strh r5, [r0, #4]
	ldr r1, _0808E350 @ =0x0000FF88
	strh r1, [r0, #6]
	strh r5, [r0]
	strh r5, [r0, #2]
	movs r4, #0x80
	lsls r4, r4, #1
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _0808E354 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8003EE4
	adds r0, r6, #0
	bl sub_808E35C
	adds r6, r6, r4
	movs r0, #1
	strh r0, [r6]
	strh r5, [r6, #4]
	movs r0, #2
	strh r0, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #6]
	ldr r0, _0808E358 @ =0x00003FFF
	strh r0, [r6, #8]
	strh r5, [r6, #0xa]
	adds r0, r6, #0
	bl sub_802D4CC
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E32C: .4byte gDispCnt
_0808E330: .4byte gBgCntRegs
_0808E334: .4byte 0x00001D05
_0808E338: .4byte 0x00005E0A
_0808E33C: .4byte 0x040000D4
_0808E340: .4byte 0x85004000
_0808E344: .4byte gUnknown_03004D80
_0808E348: .4byte gUnknown_03002280
_0808E34C: .4byte gBgScrollRegs
_0808E350: .4byte 0x0000FF88
_0808E354: .4byte gBgAffineRegs
_0808E358: .4byte 0x00003FFF

	thumb_func_start sub_808E35C
sub_808E35C: @ 0x0808E35C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0808E408 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r0, #0
	bge _0808E372
	movs r2, #0
_0808E372:
	adds r0, r7, #0
	adds r0, #0x80
	ldr r1, _0808E40C @ =0x06004000
	str r1, [r0, #4]
	movs r6, #0
	movs r4, #0
	strh r4, [r0, #0xa]
	ldr r1, _0808E410 @ =0x0600E800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r3, _0808E414 @ =gUnknown_080E1130
	movs r1, #0x87
	lsls r1, r1, #1
	adds r5, r7, r1
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #4
	subs r1, r1, r2
	ldrh r5, [r5]
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r5, #0x1e
	strh r5, [r0, #0x26]
	movs r1, #5
	strh r1, [r0, #0x28]
	adds r1, r7, #0
	adds r1, #0xaa
	strb r6, [r1]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r0, _0808E418 @ =0x06008000
	str r0, [r7, #4]
	strh r4, [r7, #0xa]
	ldr r0, _0808E41C @ =0x0600F000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r1, _0808E420 @ =gUnknown_080E1118
	movs r2, #0x86
	lsls r2, r2, #1
	adds r0, r7, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	strh r5, [r7, #0x26]
	movs r0, #0x14
	strh r0, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r6, [r0]
	movs r0, #2
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E408: .4byte gUnknown_03005B64
_0808E40C: .4byte 0x06004000
_0808E410: .4byte 0x0600E800
_0808E414: .4byte gUnknown_080E1130
_0808E418: .4byte 0x06008000
_0808E41C: .4byte 0x0600F000
_0808E420: .4byte gUnknown_080E1118

	thumb_func_start sub_808E424
sub_808E424: @ 0x0808E424
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r0, _0808E458 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _0808E45C @ =gUnknown_03000110
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _0808E476
	movs r0, #1
	strh r0, [r2]
	ldr r2, _0808E460 @ =gUnknown_03000112
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	beq _0808E470
	cmp r0, #1
	bgt _0808E464
	cmp r0, #0
	beq _0808E468
	b _0808E476
	.align 2, 0
_0808E458: .4byte gCurTask
_0808E45C: .4byte gUnknown_03000110
_0808E460: .4byte gUnknown_03000112
_0808E464:
	cmp r0, #2
	bne _0808E476
_0808E468:
	movs r0, #0x2d
	bl m4aSongNumStart
	b _0808E476
_0808E470:
	movs r0, #0x2e
	bl m4aSongNumStart
_0808E476:
	movs r4, #0x80
	lsls r4, r4, #1
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	ldr r0, _0808E4BC @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8003EE4
	adds r4, r6, r4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808E4B2
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r5, [r0]
	ldr r0, _0808E4C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808E4C4 @ =sub_808E4C8
	str r0, [r1, #8]
_0808E4B2:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E4BC: .4byte gBgAffineRegs
_0808E4C0: .4byte gCurTask
_0808E4C4: .4byte sub_808E4C8

	thumb_func_start sub_808E4C8
sub_808E4C8: @ 0x0808E4C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0808E5AC @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov r8, r1
	cmp r0, #0
	bge _0808E4EA
	movs r0, #0
	mov r8, r0
_0808E4EA:
	ldr r1, _0808E5B0 @ =gCurTask
	mov sb, r1
	ldr r0, [r1]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sl, r0
	movs r7, #0x80
	lsls r7, r7, #1
	movs r6, #0
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	ldr r0, _0808E5B4 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r0, _0808E5B8 @ =gUnknown_03000110
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xaa
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0808E600
	strh r6, [r2]
	ldr r1, _0808E5BC @ =gUnknown_0300010C
	adds r2, r5, r1
	ldrh r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _0808E5E4
	ldr r1, _0808E5C0 @ =gBgScrollRegs
	ldr r0, _0808E5C4 @ =0x0000FFDC
	strh r0, [r1, #2]
	ldr r1, _0808E5C8 @ =gUnknown_03000040
	adds r0, r5, r1
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r6, [r0, #0xa]
	ldr r1, _0808E5CC @ =0x0600E000
	str r1, [r0, #0xc]
	strh r6, [r0, #0x18]
	strh r6, [r0, #0x1a]
	ldr r4, _0808E5D0 @ =gUnknown_080E1130
	ldr r1, _0808E5D4 @ =gUnknown_0300010E
	adds r3, r5, r1
	mov r1, r8
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #4
	subs r1, r1, r2
	adds r1, #1
	ldrh r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	strh r6, [r0, #0x1e]
	strh r6, [r0, #0x20]
	strh r6, [r0, #0x22]
	strh r6, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #5
	strh r1, [r0, #0x28]
	ldr r1, _0808E5D8 @ =gUnknown_0300006A
	adds r2, r5, r1
	movs r1, #0
	strb r1, [r2]
	movs r1, #0x10
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r2, _0808E5DC @ =gDispCnt
	ldrh r1, [r2]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xcd
	lsls r0, r0, #1
	bl m4aSongNumStart
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0808E5E0 @ =sub_808E63C
	b _0808E5FE
	.align 2, 0
_0808E5AC: .4byte gUnknown_03005B64
_0808E5B0: .4byte gCurTask
_0808E5B4: .4byte gBgAffineRegs
_0808E5B8: .4byte gUnknown_03000110
_0808E5BC: .4byte gUnknown_0300010C
_0808E5C0: .4byte gBgScrollRegs
_0808E5C4: .4byte 0x0000FFDC
_0808E5C8: .4byte gUnknown_03000040
_0808E5CC: .4byte 0x0600E000
_0808E5D0: .4byte gUnknown_080E1130
_0808E5D4: .4byte gUnknown_0300010E
_0808E5D8: .4byte gUnknown_0300006A
_0808E5DC: .4byte gDispCnt
_0808E5E0: .4byte sub_808E63C
_0808E5E4:
	adds r0, r1, #1
	strh r0, [r2]
	ldr r0, _0808E630 @ =gUnknown_0300010E
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	mov r0, sl
	bl sub_808E35C
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0808E634 @ =sub_808E4C8
_0808E5FE:
	str r0, [r1, #8]
_0808E600:
	ldr r0, _0808E638 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808E61E
	movs r1, #0x88
	lsls r1, r1, #1
	add r1, sl
	ldrh r0, [r1]
	cmp r0, #8
	bls _0808E61E
	movs r0, #0xaa
	lsls r0, r0, #1
	strh r0, [r1]
_0808E61E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E630: .4byte gUnknown_0300010E
_0808E634: .4byte sub_808E4C8
_0808E638: .4byte gPressedKeys

	thumb_func_start sub_808E63C
sub_808E63C: @ 0x0808E63C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0808E698 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	ldr r0, _0808E69C @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r0, _0808E6A0 @ =gUnknown_03000110
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0808E68E
	strh r4, [r2]
	ldr r0, _0808E6A4 @ =gUnknown_03000100
	adds r1, r5, r0
	movs r2, #1
	strh r2, [r1]
	ldr r0, _0808E6A8 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r4, [r1, #4]
	strh r2, [r1, #2]
	strh r4, [r1, #0xa]
	ldr r1, [r6]
	ldr r0, _0808E6AC @ =sub_808E6B0
	str r0, [r1, #8]
_0808E68E:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E698: .4byte gCurTask
_0808E69C: .4byte gBgAffineRegs
_0808E6A0: .4byte gUnknown_03000110
_0808E6A4: .4byte gUnknown_03000100
_0808E6A8: .4byte 0x00003FFF
_0808E6AC: .4byte sub_808E6B0

	thumb_func_start sub_808E6B0
sub_808E6B0: @ 0x0808E6B0
	push {r4, lr}
	sub sp, #0x10
	ldr r0, _0808E70C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0808E710 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	movs r0, #0
	adds r1, r2, #0
	movs r3, #0
	bl sub_8003EE4
	ldr r0, _0808E714 @ =gUnknown_03000100
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808E734
	ldr r3, _0808E718 @ =gUnknown_030055B4
	movs r2, #0
	ldrsb r2, [r3, r2]
	ldr r0, _0808E71C @ =gUnknown_03005B64
	ldr r0, [r0]
	ldr r1, _0808E720 @ =gUnknown_030054F0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	blt _0808E724
	ldrb r0, [r3]
	movs r2, #1
	bl sub_80346C8
	b _0808E72C
	.align 2, 0
_0808E70C: .4byte gCurTask
_0808E710: .4byte gBgAffineRegs
_0808E714: .4byte gUnknown_03000100
_0808E718: .4byte gUnknown_030055B4
_0808E71C: .4byte gUnknown_03005B64
_0808E720: .4byte gUnknown_030054F0
_0808E724:
	ldrb r0, [r3]
	movs r2, #4
	bl sub_80346C8
_0808E72C:
	ldr r0, _0808E73C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808E734:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E73C: .4byte gCurTask

	thumb_func_start sub_808E740
sub_808E740: @ 0x0808E740
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0808E790 @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r5, #0
	str r5, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	lsls r2, r4, #2
	ldr r6, _0808E794 @ =gUnknown_0300010C
	adds r3, r1, r6
	strh r2, [r3]
	adds r2, r2, r4
	adds r6, #2
	adds r3, r1, r6
	strh r2, [r3]
	ldr r3, _0808E798 @ =gUnknown_03000110
	adds r2, r1, r3
	strh r5, [r2]
	adds r6, #4
	adds r1, r1, r6
	strb r4, [r1]
	bl sub_808E274
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E790: .4byte sub_808E424
_0808E794: .4byte gUnknown_0300010C
_0808E798: .4byte gUnknown_03000110

	thumb_func_start sub_808E79C
sub_808E79C: @ 0x0808E79C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808E7DC @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, _0808E7E0 @ =gUnknown_0300010C
	adds r1, r2, r3
	strh r4, [r1]
	adds r3, #2
	adds r1, r2, r3
	strh r4, [r1]
	ldr r1, _0808E7E4 @ =gUnknown_03000110
	adds r2, r2, r1
	strh r4, [r2]
	bl sub_808E274
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E7DC: .4byte sub_808E424
_0808E7E0: .4byte gUnknown_0300010C
_0808E7E4: .4byte gUnknown_03000110

	thumb_func_start sub_808E7E8
sub_808E7E8: @ 0x0808E7E8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808E82C @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _0808E830 @ =gUnknown_0300010C
	adds r3, r2, r1
	movs r1, #8
	strh r1, [r3]
	ldr r1, _0808E834 @ =gUnknown_0300010E
	adds r3, r2, r1
	movs r1, #0xa
	strh r1, [r3]
	ldr r1, _0808E838 @ =gUnknown_03000110
	adds r2, r2, r1
	strh r4, [r2]
	bl sub_808E274
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E82C: .4byte sub_808E424
_0808E830: .4byte gUnknown_0300010C
_0808E834: .4byte gUnknown_0300010E
_0808E838: .4byte gUnknown_03000110

	thumb_func_start sub_808E83C
sub_808E83C: @ 0x0808E83C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0808E880 @ =sub_808E424
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r4, #0
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _0808E884 @ =gUnknown_0300010C
	adds r3, r2, r1
	movs r1, #4
	strh r1, [r3]
	ldr r1, _0808E888 @ =gUnknown_0300010E
	adds r3, r2, r1
	movs r1, #5
	strh r1, [r3]
	ldr r1, _0808E88C @ =gUnknown_03000110
	adds r2, r2, r1
	strh r4, [r2]
	bl sub_808E274
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E880: .4byte sub_808E424
_0808E884: .4byte gUnknown_0300010C
_0808E888: .4byte gUnknown_0300010E
_0808E88C: .4byte gUnknown_03000110

	thumb_func_start sub_808E890
sub_808E890: @ 0x0808E890
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #8]
	bl sub_8007CF0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0808E8AA
	bl sub_8007CF0
_0808E8AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808E8B0
sub_808E8B0: @ 0x0808E8B0
	push {lr}
	sub sp, #4
	ldr r0, _0808E8E4 @ =sub_808E9AC
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _0808E8E8 @ =sub_808E9F8
	str r1, [sp]
	movs r1, #0x74
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _0808E8EC @ =gUnknown_0300006C
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0808E8F0 @ =gUnknown_0300006D
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0808E8F4 @ =gUnknown_0300006E
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808E8E4: .4byte sub_808E9AC
_0808E8E8: .4byte sub_808E9F8
_0808E8EC: .4byte gUnknown_0300006C
_0808E8F0: .4byte gUnknown_0300006D
_0808E8F4: .4byte gUnknown_0300006E

	thumb_func_start sub_808E8F8
sub_808E8F8: @ 0x0808E8F8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r6, r4, #0
	ldrh r5, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	beq _0808E916
	strh r2, [r3]
	b _0808E954
_0808E916:
	ldr r2, _0808E93C @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0808E940 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0808E944 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E948
	movs r1, #0x10
	subs r1, r1, r4
	adds r0, r2, #0
	asrs r0, r1
	adds r0, r5, r0
	b _0808E952
	.align 2, 0
_0808E93C: .4byte gUnknown_030053B8
_0808E940: .4byte 0x00196225
_0808E944: .4byte 0x3C6EF35F
_0808E948:
	movs r1, #8
	subs r1, r1, r6
	adds r0, r2, #0
	asrs r0, r1
	subs r0, r5, r0
_0808E952:
	strh r0, [r3]
_0808E954:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808E95C
sub_808E95C: @ 0x0808E95C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r3, [r4]
	cmp r3, r1
	beq _0808E96E
	str r1, [r4]
	b _0808E9A4
_0808E96E:
	ldr r2, _0808E994 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0808E998 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0808E99C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0808E9A0
	movs r1, #8
	subs r1, r1, r5
	adds r0, r2, #0
	asrs r0, r1
	adds r0, r3, r0
	b _0808E9A2
	.align 2, 0
_0808E994: .4byte gUnknown_030053B8
_0808E998: .4byte 0x00196225
_0808E99C: .4byte 0x3C6EF35F
_0808E9A0:
	subs r0, r3, r2
_0808E9A2:
	str r0, [r4]
_0808E9A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808E9AC
sub_808E9AC: @ 0x0808E9AC
	push {lr}
	ldr r0, _0808E9C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0808E9C8 @ =gUnknown_0300006E
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808E9CC
	subs r0, #1
	strh r0, [r1]
	b _0808E9F0
	.align 2, 0
_0808E9C4: .4byte gCurTask
_0808E9C8: .4byte gUnknown_0300006E
_0808E9CC:
	ldr r0, _0808E9E0 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _0808E9E4
	bl sub_808FC78
	b _0808E9E8
	.align 2, 0
_0808E9E0: .4byte gUnknown_030055B4
_0808E9E4:
	bl sub_8091684
_0808E9E8:
	ldr r0, _0808E9F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808E9F0:
	pop {r0}
	bx r0
	.align 2, 0
_0808E9F4: .4byte gCurTask

	thumb_func_start sub_808E9F8
sub_808E9F8: @ 0x0808E9F8
	bx lr
	.align 2, 0

	thumb_func_start sub_808E9FC
sub_808E9FC: @ 0x0808E9FC
	push {lr}
	ldr r2, _0808EA24 @ =gCurTask
	ldr r0, [r2]
	ldrh r3, [r0, #6]
	ldr r0, _0808EA28 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldr r1, _0808EA2C @ =gUnknown_030054F0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1d
	bls _0808EA34
	ldr r0, _0808EA30 @ =gUnknown_0300006D
	adds r1, r3, r0
	movs r0, #2
	b _0808EA3A
	.align 2, 0
_0808EA24: .4byte gCurTask
_0808EA28: .4byte gUnknown_03005B64
_0808EA2C: .4byte gUnknown_030054F0
_0808EA30: .4byte gUnknown_0300006D
_0808EA34:
	ldr r0, _0808EA48 @ =gUnknown_0300006D
	adds r1, r3, r0
	movs r0, #1
_0808EA3A:
	strb r0, [r1]
	ldr r1, [r2]
	ldr r0, _0808EA4C @ =sub_808E9AC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0808EA48: .4byte gUnknown_0300006D
_0808EA4C: .4byte sub_808E9AC

	thumb_func_start sub_808EA50
sub_808EA50: @ 0x0808EA50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r7, #0
	ldr r1, _0808EAE4 @ =gDispCnt
	movs r2, #0x8a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808EAE8 @ =gBgCntRegs
	movs r3, #0
	mov r8, r3
	movs r0, #0xb8
	lsls r0, r0, #7
	strh r0, [r1]
	ldr r0, _0808EAEC @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	ldr r0, _0808EAF0 @ =gUnknown_03004D80
	mov r1, r8
	strb r1, [r0]
	ldr r1, _0808EAF4 @ =gUnknown_03002280
	mov r2, r8
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _0808EAF8 @ =sub_808EBC4
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _0808EAFC @ =sub_808ED5C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	movs r1, #0x52
	strh r7, [r1]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r3, _0808EB00 @ =gUnknown_0300004C
	adds r1, r2, r3
	strb r4, [r1]
	adds r3, #2
	adds r0, r2, r3
	strb r5, [r0]
	adds r3, #1
	adds r0, r2, r3
	strb r6, [r0]
	movs r0, #0xb4
	str r0, [r7, #0x54]
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808EB08
	ldr r0, _0808EB04 @ =gUnknown_03000050
	adds r1, r2, r0
	movs r0, #5
	strb r0, [r1]
	b _0808EB10
	.align 2, 0
_0808EAE4: .4byte gDispCnt
_0808EAE8: .4byte gBgCntRegs
_0808EAEC: .4byte gBgScrollRegs
_0808EAF0: .4byte gUnknown_03004D80
_0808EAF4: .4byte gUnknown_03002280
_0808EAF8: .4byte sub_808EBC4
_0808EAFC: .4byte sub_808ED5C
_0808EB00: .4byte gUnknown_0300004C
_0808EB04: .4byte gUnknown_03000050
_0808EB08:
	ldr r1, _0808EB40 @ =gUnknown_03000050
	adds r0, r2, r1
	mov r2, r8
	strb r2, [r0]
_0808EB10:
	adds r0, r7, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #1
	bne _0808EB26
	ldr r0, _0808EB44 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	bne _0808EB36
_0808EB26:
	ldrb r1, [r2]
	cmp r1, #2
	bne _0808EB48
	ldr r0, _0808EB44 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _0808EB48
_0808EB36:
	adds r0, r7, #0
	adds r0, #0x4d
	strb r1, [r0]
	b _0808EB50
	.align 2, 0
_0808EB40: .4byte gUnknown_03000050
_0808EB44: .4byte gUnknown_03005B64
_0808EB48:
	adds r1, r7, #0
	adds r1, #0x4d
	movs r0, #0
	strb r0, [r1]
_0808EB50:
	adds r1, r7, #0
	adds r1, #0x40
	movs r4, #0
	movs r2, #0
	strh r2, [r1]
	strh r2, [r1, #4]
	strh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldr r0, _0808EBB8 @ =0x00003FFF
	strh r0, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r7, #4]
	strh r2, [r7, #0xa]
	ldr r0, _0808EBBC @ =0x0600E000
	str r0, [r7, #0xc]
	strh r2, [r7, #0x18]
	strh r2, [r7, #0x1a]
	ldr r3, _0808EBC0 @ =gUnknown_080E1244
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	adds r1, #0xe
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	strh r2, [r7, #0x1e]
	strh r2, [r7, #0x20]
	strh r2, [r7, #0x22]
	strh r2, [r7, #0x24]
	movs r0, #0x1e
	strh r0, [r7, #0x26]
	movs r0, #0x14
	strh r0, [r7, #0x28]
	adds r0, r7, #0
	adds r0, #0x2a
	strb r4, [r0]
	strh r2, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EBB8: .4byte 0x00003FFF
_0808EBBC: .4byte 0x0600E000
_0808EBC0: .4byte gUnknown_080E1244

	thumb_func_start sub_808EBC4
sub_808EBC4: @ 0x0808EBC4
	push {r4, lr}
	ldr r0, _0808EC10 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r1, _0808EC14 @ =gUnknown_03000040
	adds r4, r0, r1
	movs r1, #2
	strh r1, [r4, #2]
	ldr r1, _0808EC18 @ =gUnknown_0300004D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808EBEE
	ldr r0, _0808EC1C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808EBEE
	ldr r0, _0808EC20 @ =sub_808ECB4
	str r0, [r2, #8]
_0808EBEE:
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808EC08
	movs r0, #0
	strh r0, [r4, #4]
	ldr r0, _0808EC10 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808EC24 @ =sub_808EC64
	str r0, [r1, #8]
_0808EC08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC10: .4byte gCurTask
_0808EC14: .4byte gUnknown_03000040
_0808EC18: .4byte gUnknown_0300004D
_0808EC1C: .4byte gPressedKeys
_0808EC20: .4byte sub_808ECB4
_0808EC24: .4byte sub_808EC64

	thumb_func_start sub_808EC28
sub_808EC28: @ 0x0808EC28
	push {r4, r5, lr}
	ldr r5, _0808EC58 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _0808EC5C @ =gUnknown_03000040
	adds r4, r0, r1
	movs r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808EC50
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _0808EC60 @ =sub_808ED04
	str r0, [r1, #8]
_0808EC50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EC58: .4byte gCurTask
_0808EC5C: .4byte gUnknown_03000040
_0808EC60: .4byte sub_808ED04

	thumb_func_start sub_808EC64
sub_808EC64: @ 0x0808EC64
	push {r4, lr}
	ldr r2, _0808EC98 @ =gCurTask
	ldr r3, [r2]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x4d
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808EC8C
	ldr r0, _0808EC9C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808EC8C
	ldr r0, _0808ECA0 @ =sub_808ECB4
	str r0, [r3, #8]
_0808EC8C:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _0808ECA4
	subs r0, #1
	str r0, [r4, #0x54]
	b _0808ECAA
	.align 2, 0
_0808EC98: .4byte gCurTask
_0808EC9C: .4byte gPressedKeys
_0808ECA0: .4byte sub_808ECB4
_0808ECA4:
	ldr r1, [r2]
	ldr r0, _0808ECB0 @ =sub_808EC28
	str r0, [r1, #8]
_0808ECAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECB0: .4byte sub_808EC28

	thumb_func_start sub_808ECB4
sub_808ECB4: @ 0x0808ECB4
	push {r4, r5, r6, lr}
	ldr r6, _0808ECF4 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	ldr r0, _0808ECF8 @ =gUnknown_03000040
	adds r4, r5, r0
	movs r0, #1
	strh r0, [r4, #2]
	ldr r0, _0808ECFC @ =gUnknown_02002540
	movs r1, #0x18
	bl m4aMPlayFadeOutTemporarily
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808ECEE
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, _0808ED00 @ =gUnknown_0300004C
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_808F14C
	ldr r0, [r6]
	bl TaskDestroy
_0808ECEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808ECF4: .4byte gCurTask
_0808ECF8: .4byte gUnknown_03000040
_0808ECFC: .4byte gUnknown_02002540
_0808ED00: .4byte gUnknown_0300004C

	thumb_func_start sub_808ED04
sub_808ED04: @ 0x0808ED04
	push {r4, lr}
	ldr r0, _0808ED30 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r0, _0808ED34 @ =gUnknown_0300004E
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _0808ED38 @ =gUnknown_0300004F
	adds r3, r1, r4
	ldrb r0, [r3]
	cmp r0, #3
	bhi _0808ED3C
	subs r4, #3
	adds r0, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r2]
	ldrb r2, [r3]
	bl sub_808ED60
	b _0808ED46
	.align 2, 0
_0808ED30: .4byte gCurTask
_0808ED34: .4byte gUnknown_0300004E
_0808ED38: .4byte gUnknown_0300004F
_0808ED3C:
	ldr r2, _0808ED54 @ =gUnknown_0300004C
	adds r0, r1, r2
	ldrb r0, [r0]
	bl sub_808F14C
_0808ED46:
	ldr r0, _0808ED58 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ED54: .4byte gUnknown_0300004C
_0808ED58: .4byte gCurTask

	thumb_func_start sub_808ED5C
sub_808ED5C: @ 0x0808ED5C
	bx lr
	.align 2, 0

	thumb_func_start sub_808ED60
sub_808ED60: @ 0x0808ED60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r1, #0
	mov ip, r1
	ldr r1, _0808EE0C @ =gDispCnt
	ldr r2, _0808EE10 @ =0x00001241
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808EE14 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0808EE18 @ =0x00001C04
	strh r0, [r1, #2]
	ldr r0, _0808EE1C @ =gBgScrollRegs
	mov r3, ip
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	ldr r0, _0808EE20 @ =gUnknown_03004D80
	strb r4, [r0, #1]
	ldr r1, _0808EE24 @ =gUnknown_03002280
	strb r4, [r1, #4]
	strb r4, [r1, #5]
	movs r0, #0xff
	strb r0, [r1, #6]
	movs r0, #0x20
	strb r0, [r1, #7]
	ldr r0, _0808EE28 @ =sub_808F004
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _0808EE2C @ =sub_808F148
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r7, _0808EE30 @ =gUnknown_0300004C
	adds r1, r2, r7
	strb r5, [r1]
	ldr r3, _0808EE34 @ =gUnknown_0300004E
	adds r0, r2, r3
	strb r6, [r0]
	adds r7, #3
	adds r0, r2, r7
	mov r3, r8
	strb r3, [r0]
	adds r7, #3
	adds r0, r2, r7
	strb r4, [r0]
	movs r0, #0x96
	mov r3, ip
	str r0, [r3, #0x54]
	subs r7, #2
	adds r0, r2, r7
	strb r4, [r0]
	ldrb r1, [r1]
	cmp r1, #1
	bne _0808EE40
	ldr r0, _0808EE38 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _0808EE40
	ldr r3, _0808EE3C @ =gUnknown_0300004D
	adds r0, r2, r3
	strb r1, [r0]
	b _0808EE68
	.align 2, 0
_0808EE0C: .4byte gDispCnt
_0808EE10: .4byte 0x00001241
_0808EE14: .4byte gBgCntRegs
_0808EE18: .4byte 0x00001C04
_0808EE1C: .4byte gBgScrollRegs
_0808EE20: .4byte gUnknown_03004D80
_0808EE24: .4byte gUnknown_03002280
_0808EE28: .4byte sub_808F004
_0808EE2C: .4byte sub_808F148
_0808EE30: .4byte gUnknown_0300004C
_0808EE34: .4byte gUnknown_0300004E
_0808EE38: .4byte gUnknown_03005B64
_0808EE3C: .4byte gUnknown_0300004D
_0808EE40:
	mov r0, ip
	adds r0, #0x4c
	ldrb r1, [r0]
	cmp r1, #2
	bne _0808EE60
	ldr r0, _0808EE5C @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _0808EE60
	mov r0, ip
	adds r0, #0x4d
	strb r1, [r0]
	b _0808EE68
	.align 2, 0
_0808EE5C: .4byte gUnknown_03005B64
_0808EE60:
	mov r1, ip
	adds r1, #0x4d
	movs r0, #0
	strb r0, [r1]
_0808EE68:
	movs r3, #0
	mov r4, ip
	adds r4, #0x4f
	adds r1, r4, #0
	mov r5, ip
	adds r5, #0x50
	ldr r7, _0808EF24 @ =gUnknown_080E12AA
	mov sb, r7
	movs r0, #0x51
	add r0, ip
	mov r8, r0
	mov r2, ip
	adds r2, #0x40
	str r2, [sp, #4]
	ldr r7, _0808EF28 @ =gUnknown_080E1278
	mov sl, r7
	ldrb r0, [r4]
	cmp r3, r0
	bhs _0808EEA8
	adds r2, r5, #0
	mov r6, sb
_0808EE92:
	adds r0, r3, r6
	ldrb r0, [r0]
	ldrb r7, [r2]
	adds r0, r0, r7
	strb r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r4]
	cmp r3, r0
	blo _0808EE92
_0808EEA8:
	ldrb r0, [r1]
	add r0, sb
	ldrb r0, [r0]
	ldrb r1, [r5]
	adds r0, r0, r1
	movs r2, #0
	mov r3, r8
	strb r0, [r3]
	ldr r1, [sp, #4]
	movs r3, #1
	strh r3, [r1]
	strh r2, [r1, #4]
	strh r2, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1, #6]
	ldr r0, _0808EF2C @ =0x00003FFF
	strh r0, [r1, #8]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	cmp r0, #0
	beq _0808EF12
	ldr r0, _0808EF30 @ =0x06004000
	mov r7, ip
	str r0, [r7, #4]
	strh r2, [r7, #0xa]
	ldr r0, _0808EF34 @ =0x0600E000
	str r0, [r7, #0xc]
	strh r2, [r7, #0x18]
	strh r2, [r7, #0x1a]
	ldrb r0, [r5]
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	strh r2, [r7, #0x1e]
	strh r2, [r7, #0x20]
	strh r2, [r7, #0x22]
	strh r2, [r7, #0x24]
	movs r0, #0x1e
	strh r0, [r7, #0x26]
	movs r0, #0x14
	strh r0, [r7, #0x28]
	mov r1, ip
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r3, [r7, #0x2e]
	mov r0, ip
	bl sub_8002A3C
_0808EF12:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF24: .4byte gUnknown_080E12AA
_0808EF28: .4byte gUnknown_080E1278
_0808EF2C: .4byte 0x00003FFF
_0808EF30: .4byte 0x06004000
_0808EF34: .4byte 0x0600E000

	thumb_func_start sub_808EF38
sub_808EF38: @ 0x0808EF38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808EFCC @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r7, r0
	ldr r1, _0808EFD0 @ =gUnknown_03000040
	adds r5, r7, r1
	movs r6, #0
	movs r0, #1
	strh r0, [r5, #2]
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _0808EFF4
	strh r6, [r5, #4]
	ldr r5, _0808EFD4 @ =gUnknown_03000050
	adds r2, r7, r5
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r5, #1
	adds r1, r7, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhs _0808EFEC
	ldr r1, _0808EFD8 @ =gUnknown_080E1278
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0808EFC4
	ldr r0, _0808EFDC @ =0x06004000
	str r0, [r4, #4]
	strh r6, [r4, #0xa]
	ldr r0, _0808EFE0 @ =0x0600E000
	str r0, [r4, #0xc]
	strh r6, [r4, #0x18]
	strh r6, [r4, #0x1a]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x1c]
	strh r6, [r4, #0x1e]
	strh r6, [r4, #0x20]
	strh r6, [r4, #0x22]
	strh r6, [r4, #0x24]
	movs r0, #0x1e
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	ldr r0, _0808EFE4 @ =gUnknown_0300002A
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
	strh r3, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
_0808EFC4:
	mov r5, r8
	ldr r1, [r5]
	ldr r0, _0808EFE8 @ =sub_808F004
	b _0808EFF2
	.align 2, 0
_0808EFCC: .4byte gCurTask
_0808EFD0: .4byte gUnknown_03000040
_0808EFD4: .4byte gUnknown_03000050
_0808EFD8: .4byte gUnknown_080E1278
_0808EFDC: .4byte 0x06004000
_0808EFE0: .4byte 0x0600E000
_0808EFE4: .4byte gUnknown_0300002A
_0808EFE8: .4byte sub_808F004
_0808EFEC:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0808F000 @ =sub_808F10C
_0808EFF2:
	str r0, [r1, #8]
_0808EFF4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F000: .4byte sub_808F10C

	thumb_func_start sub_808F004
sub_808F004: @ 0x0808F004
	push {r4, lr}
	ldr r0, _0808F050 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r1, _0808F054 @ =gUnknown_03000040
	adds r4, r0, r1
	movs r1, #2
	strh r1, [r4, #2]
	ldr r1, _0808F058 @ =gUnknown_0300004D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F02E
	ldr r0, _0808F05C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808F02E
	ldr r0, _0808F060 @ =sub_808F0BC
	str r0, [r2, #8]
_0808F02E:
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F048
	movs r0, #0
	strh r0, [r4, #4]
	ldr r0, _0808F050 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F064 @ =sub_808F068
	str r0, [r1, #8]
_0808F048:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F050: .4byte gCurTask
_0808F054: .4byte gUnknown_03000040
_0808F058: .4byte gUnknown_0300004D
_0808F05C: .4byte gPressedKeys
_0808F060: .4byte sub_808F0BC
_0808F064: .4byte sub_808F068

	thumb_func_start sub_808F068
sub_808F068: @ 0x0808F068
	push {lr}
	ldr r2, _0808F084 @ =gCurTask
	ldr r3, [r2]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _0808F088
	subs r0, #1
	str r0, [r1, #0x54]
	b _0808F090
	.align 2, 0
_0808F084: .4byte gCurTask
_0808F088:
	movs r0, #0x96
	str r0, [r1, #0x54]
	ldr r0, _0808F0B0 @ =sub_808EF38
	str r0, [r3, #8]
_0808F090:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F0AC
	ldr r0, _0808F0B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808F0AC
	ldr r1, [r2]
	ldr r0, _0808F0B8 @ =sub_808F0BC
	str r0, [r1, #8]
_0808F0AC:
	pop {r0}
	bx r0
	.align 2, 0
_0808F0B0: .4byte sub_808EF38
_0808F0B4: .4byte gPressedKeys
_0808F0B8: .4byte sub_808F0BC

	thumb_func_start sub_808F0BC
sub_808F0BC: @ 0x0808F0BC
	push {r4, r5, r6, lr}
	ldr r6, _0808F0FC @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	ldr r0, _0808F100 @ =gUnknown_03000040
	adds r4, r5, r0
	movs r0, #1
	strh r0, [r4, #2]
	ldr r0, _0808F104 @ =gUnknown_02002540
	movs r1, #0x18
	bl m4aMPlayFadeOutTemporarily
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F0F6
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, _0808F108 @ =gUnknown_0300004C
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_808F14C
	ldr r0, [r6]
	bl TaskDestroy
_0808F0F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808F0FC: .4byte gCurTask
_0808F100: .4byte gUnknown_03000040
_0808F104: .4byte gUnknown_02002540
_0808F108: .4byte gUnknown_0300004C

	thumb_func_start sub_808F10C
sub_808F10C: @ 0x0808F10C
	push {r4, lr}
	ldr r4, _0808F13C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0808F140 @ =gUnknown_0300004F
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, _0808F144 @ =gUnknown_0300004C
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r3, #2
	adds r1, r1, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F13C: .4byte gCurTask
_0808F140: .4byte gUnknown_0300004F
_0808F144: .4byte gUnknown_0300004C

	thumb_func_start sub_808F148
sub_808F148: @ 0x0808F148
	bx lr
	.align 2, 0

	thumb_func_start sub_808F14C
sub_808F14C: @ 0x0808F14C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r0, #0
	mov sl, r0
	ldr r1, _0808F4BC @ =gDispCnt
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808F4C0 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0808F4C4 @ =0x0000160D
	strh r0, [r1]
	movs r0, #0xa9
	lsls r0, r0, #7
	strh r0, [r1, #2]
	ldr r0, _0808F4C8 @ =0x00001504
	strh r0, [r1, #4]
	mov r3, sl
	str r3, [sp, #4]
	ldr r2, _0808F4CC @ =0x040000D4
	add r7, sp, #4
	str r7, [r2]
	movs r6, #1
	lsls r0, r6, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _0808F4D0 @ =0x85001000
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _0808F4D4 @ =gUnknown_03004D80
	movs r0, #0x5a
	strb r0, [r3, #2]
	ldr r0, _0808F4D8 @ =gUnknown_03002280
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	movs r1, #0xff
	strb r1, [r0, #0xa]
	movs r2, #0x20
	strb r2, [r0, #0xb]
	strb r4, [r3]
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	strb r4, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	ldr r0, _0808F4DC @ =sub_808FB2C
	movs r1, #0xc4
	lsls r1, r1, #1
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _0808F4E0 @ =sub_808FBE4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _0808F4E4 @ =gUnknown_03000164
	adds r1, r2, r0
	movs r0, #0x87
	lsls r0, r0, #1
	str r0, [r1]
	ldr r1, _0808F4E8 @ =gUnknown_0300015C
	adds r0, r2, r1
	strb r5, [r0]
	ldr r3, _0808F4EC @ =gUnknown_0300015D
	adds r0, r2, r3
	strb r4, [r0]
	ldr r7, _0808F4F0 @ =gUnknown_0300015E
	adds r0, r2, r7
	strb r4, [r0]
	adds r1, #3
	adds r0, r2, r1
	strb r4, [r0]
	adds r3, #0xb
	adds r1, r2, r3
	movs r0, #0x1e
	strh r0, [r1]
	adds r7, #2
	adds r3, r2, r7
	strb r4, [r3]
	ldr r1, _0808F4F4 @ =gUnknown_03000161
	adds r0, r2, r1
	strb r4, [r0]
	adds r7, #2
	adds r1, r2, r7
	ldr r0, _0808F4F8 @ =0x0000FFFF
	strh r0, [r1]
	ldr r0, _0808F4FC @ =gUnknown_03005B64
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	beq _0808F22E
	strb r6, [r3]
_0808F22E:
	movs r3, #0
	ldr r0, _0808F500 @ =gUnknown_03000170
	adds r5, r2, r0
	ldr r1, _0808F504 @ =gUnknown_03000178
	adds r4, r2, r1
	ldr r7, _0808F508 @ =gUnknown_03000180
	adds r2, r2, r7
	mov r8, r3
	movs r0, #0xb4
	lsls r0, r0, #8
	mov sb, r0
	movs r6, #0xc8
	lsls r6, r6, #8
_0808F248:
	lsls r1, r3, #2
	adds r0, r5, r1
	mov r7, r8
	str r7, [r0]
	adds r0, r4, r1
	mov r7, sb
	str r7, [r0]
	adds r1, r2, r1
	str r6, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bls _0808F248
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, sl
	movs r7, #0
	movs r0, #1
	strh r0, [r1]
	strh r7, [r1, #4]
	movs r0, #2
	strh r0, [r1, #2]
	strh r7, [r1, #0xa]
	adds r0, #0xfe
	strh r0, [r1, #6]
	ldr r0, _0808F50C @ =0x00003FFF
	strh r0, [r1, #8]
	movs r6, #0xb6
	lsls r6, r6, #1
	add r6, sl
	ldr r0, _0808F510 @ =0x06010000
	str r0, [r6]
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #8]
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808F29A
	b _0808F448
_0808F29A:
	mov r4, sl
	adds r4, #0x40
	ldr r2, _0808F4BC @ =gDispCnt
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _0808F514 @ =gBgScrollRegs
	strh r7, [r3]
	strh r7, [r3, #2]
	ldr r0, _0808F518 @ =0x0600C000
	str r0, [r4, #4]
	strh r7, [r4, #0xa]
	ldr r1, _0808F51C @ =0x0600B000
	str r1, [r4, #0xc]
	strh r7, [r4, #0x18]
	strh r7, [r4, #0x1a]
	ldr r2, _0808F520 @ =gUnknown_080E12B0
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x1c]
	strh r7, [r4, #0x1e]
	strh r7, [r4, #0x20]
	strh r7, [r4, #0x22]
	strh r7, [r4, #0x24]
	movs r3, #0x1e
	strh r3, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	mov r1, sl
	adds r1, #0x6a
	str r1, [sp, #0xc]
	movs r2, #0
	strb r2, [r1]
	strh r7, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	mov r0, sl
	adds r0, #0xc0
	ldr r1, [r6]
	str r1, [r0, #4]
	ldr r5, _0808F524 @ =gUnknown_080E12D0
	ldr r2, [r5]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	str r1, [r6]
	ldrh r1, [r5, #4]
	strh r1, [r0, #0xa]
	ldrb r2, [r5, #6]
	mov r1, sl
	adds r1, #0xe0
	strb r2, [r1]
	mov r2, sl
	adds r2, #0xe1
	movs r1, #0xff
	strb r1, [r2]
	movs r3, #0x78
	strh r3, [r0, #0x16]
	ldr r1, _0808F528 @ =0x0000FFEC
	strh r1, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	mov r1, sl
	adds r1, #0xe2
	movs r2, #0x10
	mov r8, r2
	mov r3, r8
	strb r3, [r1]
	adds r1, #3
	movs r2, #0
	strb r2, [r1]
	str r7, [r0, #0x10]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r3
	str r3, [r0, #0x28]
	bl sub_8004558
	mov r0, sl
	adds r0, #0xf0
	ldr r1, [r6]
	str r1, [r0, #4]
	ldr r2, [r5, #8]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	str r1, [r6]
	ldrh r1, [r5, #0xc]
	strh r1, [r0, #0xa]
	ldrb r2, [r5, #0xe]
	movs r1, #0x88
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _0808F52C @ =0x00000111
	add r2, sl
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	movs r1, #0x78
	strh r1, [r0, #0x16]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x89
	lsls r1, r1, #1
	add r1, sl
	mov r3, r8
	strb r3, [r1]
	ldr r1, _0808F530 @ =0x00000115
	add r1, sl
	movs r2, #0
	strb r2, [r1]
	str r7, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r6]
	str r1, [r0, #4]
	ldr r2, [r5, #0x10]
	lsls r2, r2, #5
	ldr r1, [r6]
	adds r1, r1, r2
	str r1, [r6]
	ldrh r1, [r5, #0x14]
	strh r1, [r0, #0xa]
	ldrb r2, [r5, #0x16]
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _0808F534 @ =0x00000141
	add r2, sl
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	movs r1, #0x78
	strh r1, [r0, #0x16]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0xa1
	lsls r1, r1, #1
	add r1, sl
	mov r3, r8
	strb r3, [r1]
	ldr r1, _0808F538 @ =0x00000145
	add r1, sl
	movs r2, #0
	strb r2, [r1]
	str r7, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	ldr r0, _0808F4BC @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r0, r1
	ldr r1, _0808F4BC @ =gDispCnt
	strh r0, [r1]
	ldr r2, _0808F514 @ =gBgScrollRegs
	strh r7, [r2]
	strh r7, [r2, #2]
	ldr r3, _0808F518 @ =0x0600C000
	str r3, [r4, #4]
	strh r7, [r4, #0xa]
	ldr r0, _0808F51C @ =0x0600B000
	str r0, [r4, #0xc]
	strh r7, [r4, #0x18]
	strh r7, [r4, #0x1a]
	ldr r0, _0808F53C @ =0x0000015F
	add r0, sl
	ldrb r0, [r0]
	adds r0, #2
	lsls r0, r0, #1
	ldr r1, _0808F520 @ =gUnknown_080E12B0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x1c]
	strh r7, [r4, #0x1e]
	strh r7, [r4, #0x20]
	strh r7, [r4, #0x22]
	strh r7, [r4, #0x24]
	movs r2, #0x1e
	strh r2, [r4, #0x26]
	movs r3, #0x14
	strh r3, [r4, #0x28]
	movs r1, #0
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	strh r7, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	adds r0, r4, #0
	bl sub_8003638
_0808F448:
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	cmp r0, #1
	bne _0808F4AC
	ldr r2, _0808F4BC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808F514 @ =gBgScrollRegs
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, sl
	str r0, [r1, #4]
	strh r7, [r1, #0xa]
	ldr r0, _0808F540 @ =0x0600A000
	str r0, [r1, #0xc]
	strh r7, [r1, #0x18]
	strh r7, [r1, #0x1a]
	ldr r1, _0808F520 @ =gUnknown_080E12B0
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r2, sl
	strh r0, [r2, #0x1c]
	strh r7, [r2, #0x1e]
	strh r7, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r7, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	mov r0, sl
	adds r0, #0x2a
	movs r3, #0
	strb r3, [r0]
	movs r0, #5
	strh r0, [r2, #0x2e]
	mov r0, sl
	bl sub_8002A3C
_0808F4AC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F4BC: .4byte gDispCnt
_0808F4C0: .4byte gBgCntRegs
_0808F4C4: .4byte 0x0000160D
_0808F4C8: .4byte 0x00001504
_0808F4CC: .4byte 0x040000D4
_0808F4D0: .4byte 0x85001000
_0808F4D4: .4byte gUnknown_03004D80
_0808F4D8: .4byte gUnknown_03002280
_0808F4DC: .4byte sub_808FB2C
_0808F4E0: .4byte sub_808FBE4
_0808F4E4: .4byte gUnknown_03000164
_0808F4E8: .4byte gUnknown_0300015C
_0808F4EC: .4byte gUnknown_0300015D
_0808F4F0: .4byte gUnknown_0300015E
_0808F4F4: .4byte gUnknown_03000161
_0808F4F8: .4byte 0x0000FFFF
_0808F4FC: .4byte gUnknown_03005B64
_0808F500: .4byte gUnknown_03000170
_0808F504: .4byte gUnknown_03000178
_0808F508: .4byte gUnknown_03000180
_0808F50C: .4byte 0x00003FFF
_0808F510: .4byte 0x06010000
_0808F514: .4byte gBgScrollRegs
_0808F518: .4byte 0x0600C000
_0808F51C: .4byte 0x0600B000
_0808F520: .4byte gUnknown_080E12B0
_0808F524: .4byte gUnknown_080E12D0
_0808F528: .4byte 0x0000FFEC
_0808F52C: .4byte 0x00000111
_0808F530: .4byte 0x00000115
_0808F534: .4byte 0x00000141
_0808F538: .4byte 0x00000145
_0808F53C: .4byte 0x0000015F
_0808F540: .4byte 0x0600A000

	thumb_func_start sub_808F544
sub_808F544: @ 0x0808F544
	push {r4, r5, r6, r7, lr}
	ldr r7, _0808F5A0 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0808F5A4 @ =gUnknown_03000150
	adds r6, r5, r0
	movs r0, #1
	strh r0, [r6, #2]
	ldr r1, _0808F5A8 @ =gUnknown_0300015C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808F576
	adds r0, r4, #0
	bl sub_808FBE8
	adds r0, r4, #0
	bl sub_808FC00
	adds r0, r4, #0
	bl sub_808FC3C
_0808F576:
	adds r0, r4, #0
	bl sub_808FA24
	adds r0, r6, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F5BA
	movs r0, #0
	strh r0, [r6, #4]
	ldr r1, _0808F5AC @ =gUnknown_0300015D
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808F5B4
	ldr r1, [r7]
	ldr r0, _0808F5B0 @ =sub_808F5C4
	b _0808F5B8
	.align 2, 0
_0808F5A0: .4byte gCurTask
_0808F5A4: .4byte gUnknown_03000150
_0808F5A8: .4byte gUnknown_0300015C
_0808F5AC: .4byte gUnknown_0300015D
_0808F5B0: .4byte sub_808F5C4
_0808F5B4:
	ldr r1, [r7]
	ldr r0, _0808F5C0 @ =sub_808FB94
_0808F5B8:
	str r0, [r1, #8]
_0808F5BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F5C0: .4byte sub_808FB94

	thumb_func_start sub_808F5C4
sub_808F5C4: @ 0x0808F5C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0808F5E8 @ =gCurTask
	ldr r0, [r1]
	ldrh r6, [r0, #6]
	ldr r2, _0808F5EC @ =gUnknown_03000164
	adds r2, r2, r6
	mov sl, r2
	ldr r7, [r2]
	cmp r7, #0
	beq _0808F5F0
	subs r0, r7, #1
	str r0, [r2]
	b _0808F6B0
	.align 2, 0
_0808F5E8: .4byte gCurTask
_0808F5EC: .4byte gUnknown_03000164
_0808F5F0:
	ldr r3, _0808F6C0 @ =gUnknown_03000040
	adds r0, r6, r3
	ldr r5, _0808F6C4 @ =gDispCnt
	ldrh r2, [r5]
	ldr r1, _0808F6C8 @ =0x0000FDFF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5]
	ldr r4, _0808F6CC @ =gBgScrollRegs
	strh r7, [r4]
	strh r7, [r4, #2]
	ldr r1, _0808F6D0 @ =0x0600C000
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _0808F6D4 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	ldr r1, _0808F6D8 @ =gUnknown_080E12B0
	mov r8, r1
	ldrh r1, [r1, #0x1a]
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	movs r2, #0x1e
	mov sb, r2
	mov r3, sb
	strh r3, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r2, _0808F6DC @ =gUnknown_0300006A
	adds r1, r6, r2
	movs r3, #0
	strb r3, [r1]
	strh r7, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0808F6E0 @ =gUnknown_03000080
	adds r0, r6, r1
	ldrh r1, [r5]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5]
	strh r7, [r4, #8]
	ldr r1, _0808F6E4 @ =0x0000D190
	strh r1, [r4, #0xa]
	ldr r1, _0808F6E8 @ =0x06004000
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _0808F6EC @ =0x0600A800
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	mov r2, r8
	ldrh r1, [r2, #0x1c]
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	mov r3, sb
	strh r3, [r0, #0x26]
	movs r1, #3
	strh r1, [r0, #0x28]
	ldr r2, _0808F6F0 @ =gUnknown_030000AA
	adds r1, r6, r2
	movs r3, #0
	strb r3, [r1]
	movs r4, #2
	movs r1, #2
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0808F6F4 @ =gUnknown_0300015D
	adds r0, r6, r1
	strb r4, [r0]
	ldr r2, _0808F6F8 @ =gUnknown_0300015F
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x87
	lsls r0, r0, #1
	mov r3, sl
	str r0, [r3]
	ldr r0, _0808F6FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F700 @ =sub_808FB2C
	str r0, [r1, #8]
_0808F6B0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F6C0: .4byte gUnknown_03000040
_0808F6C4: .4byte gDispCnt
_0808F6C8: .4byte 0x0000FDFF
_0808F6CC: .4byte gBgScrollRegs
_0808F6D0: .4byte 0x0600C000
_0808F6D4: .4byte 0x0600B000
_0808F6D8: .4byte gUnknown_080E12B0
_0808F6DC: .4byte gUnknown_0300006A
_0808F6E0: .4byte gUnknown_03000080
_0808F6E4: .4byte 0x0000D190
_0808F6E8: .4byte 0x06004000
_0808F6EC: .4byte 0x0600A800
_0808F6F0: .4byte gUnknown_030000AA
_0808F6F4: .4byte gUnknown_0300015D
_0808F6F8: .4byte gUnknown_0300015F
_0808F6FC: .4byte gCurTask
_0808F700: .4byte sub_808FB2C

	thumb_func_start sub_808F704
sub_808F704: @ 0x0808F704
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808F750 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r1, _0808F754 @ =gUnknown_0300015C
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808F7B0
	mov r0, r8
	bl sub_808FBE8
	mov r0, r8
	bl sub_808FC00
	mov r0, r8
	bl sub_808FC3C
	ldr r0, _0808F758 @ =gUnknown_0300015F
	adds r6, r4, r0
	ldrb r0, [r6]
	cmp r0, #0xa
	bhi _0808F7B0
	ldr r1, _0808F75C @ =gUnknown_0300015E
	adds r7, r4, r1
	ldrb r0, [r7]
	adds r5, r0, #0
	cmp r5, #0
	beq _0808F760
	subs r0, #1
	strb r0, [r7]
	b _0808F7B0
	.align 2, 0
_0808F750: .4byte gCurTask
_0808F754: .4byte gUnknown_0300015C
_0808F758: .4byte gUnknown_0300015F
_0808F75C: .4byte gUnknown_0300015E
_0808F760:
	ldr r1, _0808F7C8 @ =gUnknown_03000040
	adds r0, r4, r1
	ldr r3, _0808F7CC @ =gDispCnt
	ldrh r1, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	ldr r1, _0808F7D0 @ =gBgScrollRegs
	strh r5, [r1]
	strh r5, [r1, #2]
	ldr r2, _0808F7D4 @ =gUnknown_080E12B0
	ldrb r1, [r6]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r0, #0x1c]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	strh r5, [r0, #0x2e]
	bl sub_8002A3C
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r1, _0808F7D8 @ =gUnknown_080E12F0
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r0, [r6]
	cmp r0, #9
	bne _0808F7B0
	movs r0, #0xd4
	bl m4aSongNumStart
_0808F7B0:
	mov r0, r8
	bl sub_808FA24
	movs r1, #0xb2
	lsls r1, r1, #1
	add r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _0808F7DC
	subs r0, #1
	str r0, [r1]
	b _0808F810
	.align 2, 0
_0808F7C8: .4byte gUnknown_03000040
_0808F7CC: .4byte gDispCnt
_0808F7D0: .4byte gBgScrollRegs
_0808F7D4: .4byte gUnknown_080E12B0
_0808F7D8: .4byte gUnknown_080E12F0
_0808F7DC:
	ldr r2, _0808F7F8 @ =0x0000015D
	add r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _0808F804
	movs r0, #1
	strb r0, [r2]
	movs r0, #0x1e
	str r0, [r1]
	ldr r0, _0808F7FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F800 @ =sub_808F544
	b _0808F80E
	.align 2, 0
_0808F7F8: .4byte 0x0000015D
_0808F7FC: .4byte gCurTask
_0808F800: .4byte sub_808F544
_0808F804:
	cmp r0, #2
	bne _0808F810
	ldr r0, _0808F81C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808F820 @ =sub_808F824
_0808F80E:
	str r0, [r1, #8]
_0808F810:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F81C: .4byte gCurTask
_0808F820: .4byte sub_808F824

	thumb_func_start sub_808F824
sub_808F824: @ 0x0808F824
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	ldr r0, _0808F930 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	mov r0, sp
	strh r7, [r0]
	ldr r1, _0808F934 @ =gUnknown_0300015C
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, #1
	beq _0808F848
	b _0808F9D0
_0808F848:
	ldr r4, _0808F938 @ =gUnknown_03005B64
	ldr r1, [r4]
	ldrb r0, [r1, #0x19]
	cmp r0, #0
	bne _0808F858
	strb r2, [r1, #0x19]
	bl sub_8072484
_0808F858:
	movs r1, #0
	adds r2, r4, #0
	ldr r0, [r2]
	adds r3, r0, #7
	movs r4, #1
_0808F862:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0x1c
	bls _0808F874
	adds r0, r4, #0
	lsls r0, r1
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_0808F874:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _0808F862
	cmp r5, #0xe
	bls _0808F89E
	ldr r2, [r2]
	ldrb r1, [r2, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808F89E
	ldrb r1, [r2, #0x1a]
	cmp r1, #0
	bne _0808F89E
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #0x1a]
	bl sub_8072484
_0808F89E:
	ldr r1, _0808F93C @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	bne _0808F8AA
	b _0808F9BC
_0808F8AA:
	ldr r2, _0808F938 @ =gUnknown_03005B64
	ldr r3, [r2]
	adds r4, r0, #0
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0808F99C
	adds r0, r3, #0
	adds r0, #0x15
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	movs r1, #0
	ldr r0, [r2]
	adds r3, r0, #0
	adds r3, #0x15
_0808F8D6:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F8E4
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0808F8E4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0808F8D6
	cmp r7, #1
	bne _0808F8FA
	ldr r0, [r2]
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _0808F91E
_0808F8FA:
	cmp r7, #2
	bne _0808F906
	ldr r0, [r2]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	bne _0808F91E
_0808F906:
	cmp r7, #3
	bne _0808F912
	ldr r0, [r2]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	bne _0808F91E
_0808F912:
	cmp r7, #3
	bls _0808F944
	ldr r0, [r2]
	ldrb r0, [r0, #0x13]
	cmp r0, #0xf
	bls _0808F944
_0808F91E:
	ldr r2, _0808F940 @ =0x00000161
	adds r1, r6, r2
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xb2
	lsls r0, r0, #1
	adds r1, r6, r0
	b _0808F9EE
	.align 2, 0
_0808F930: .4byte gCurTask
_0808F934: .4byte gUnknown_0300015C
_0808F938: .4byte gUnknown_03005B64
_0808F93C: .4byte gUnknown_030054F0
_0808F940: .4byte 0x00000161
_0808F944:
	cmp r7, #1
	bne _0808F94E
	ldr r0, [r2]
	strb r7, [r0, #0x14]
	b _0808F974
_0808F94E:
	cmp r7, #2
	bne _0808F95A
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #0x11]
	b _0808F974
_0808F95A:
	cmp r7, #3
	bne _0808F966
	ldr r1, [r2]
	movs r0, #1
	strb r0, [r1, #0x12]
	b _0808F974
_0808F966:
	cmp r7, #4
	bne _0808F974
	ldr r2, [r2]
	ldrb r1, [r2, #0x13]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2, #0x13]
_0808F974:
	bl sub_8072484
	ldr r2, _0808F994 @ =0x00000161
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xb2
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #0x69
	str r0, [r1]
	subs r2, #9
	adds r1, r6, r2
	ldr r0, _0808F998 @ =0x00003FFF
	strh r0, [r1]
	b _0808F9F2
	.align 2, 0
_0808F994: .4byte 0x00000161
_0808F998: .4byte 0x00003FFF
_0808F99C:
	ldr r2, _0808F9B4 @ =0x00000161
	adds r1, r6, r2
	strb r0, [r1]
	movs r0, #0xac
	lsls r0, r0, #1
	adds r1, r6, r0
	ldr r0, _0808F9B8 @ =0x00003FFF
	strh r0, [r1]
	adds r2, #3
	adds r1, r6, r2
	movs r0, #0x69
	b _0808F9F0
	.align 2, 0
_0808F9B4: .4byte 0x00000161
_0808F9B8: .4byte 0x00003FFF
_0808F9BC:
	ldr r0, _0808F9CC @ =0x00000161
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	movs r2, #0xb2
	lsls r2, r2, #1
	adds r1, r6, r2
	b _0808F9EE
	.align 2, 0
_0808F9CC: .4byte 0x00000161
_0808F9D0:
	ldr r0, _0808FA0C @ =gUnknown_03005B64
	ldr r1, [r0]
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	bne _0808F9E2
	movs r0, #1
	strb r0, [r1, #0x1b]
	bl sub_8072484
_0808F9E2:
	ldr r0, _0808FA10 @ =gUnknown_03000161
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0808FA14 @ =gUnknown_03000164
	adds r1, r4, r2
_0808F9EE:
	movs r0, #0xb4
_0808F9F0:
	str r0, [r1]
_0808F9F2:
	ldr r0, _0808FA18 @ =0x0000015D
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0808FA1C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808FA20 @ =sub_808F544
	str r0, [r1, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA0C: .4byte gUnknown_03005B64
_0808FA10: .4byte gUnknown_03000161
_0808FA14: .4byte gUnknown_03000164
_0808FA18: .4byte 0x0000015D
_0808FA1C: .4byte gCurTask
_0808FA20: .4byte sub_808F544

	thumb_func_start sub_808FA24
sub_808FA24: @ 0x0808FA24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _0808FB1E
	ldr r2, _0808FA88 @ =0x0000015F
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _0808FB1E
	movs r0, #0xb4
	lsls r0, r0, #1
	adds r4, r6, r0
	ldrh r1, [r4]
	movs r0, #0
	ldrsh r2, [r4, r0]
	cmp r2, #0
	ble _0808FA90
	adds r5, r6, #0
	adds r5, #0xc0
	ldr r1, _0808FA8C @ =gUnknown_080E12D0
	ldrh r0, [r1, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0xe0
	strb r1, [r0]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r5, #0x16]
	movs r2, #0xba
	lsls r2, r2, #1
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r4]
	subs r0, #1
	b _0808FAAA
	.align 2, 0
_0808FA88: .4byte 0x0000015F
_0808FA8C: .4byte gUnknown_080E12D0
_0808FA90:
	adds r0, r1, #0
	adds r0, #0xe
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe
	bhi _0808FAA0
	subs r0, r1, #1
	b _0808FAAA
_0808FAA0:
	movs r0, #0xf
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _0808FAAC
	movs r0, #0x1e
_0808FAAA:
	strh r0, [r4]
_0808FAAC:
	ldr r1, _0808FB24 @ =0x0000015F
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _0808FB1E
	adds r5, r6, #0
	adds r5, #0xf0
	ldr r4, _0808FB28 @ =gUnknown_080E12D0
	ldrh r0, [r4, #0xc]
	strh r0, [r5, #0xa]
	ldrb r1, [r4, #0xe]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r5, #0x16]
	adds r2, #0x6c
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x90
	lsls r0, r0, #1
	adds r5, r6, r0
	ldrh r0, [r4, #0x14]
	strh r0, [r5, #0xa]
	ldrb r1, [r4, #0x16]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r5, #0x16]
	adds r2, #0x44
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0808FB1E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808FB24: .4byte 0x0000015F
_0808FB28: .4byte gUnknown_080E12D0

	thumb_func_start sub_808FB2C
sub_808FB2C: @ 0x0808FB2C
	push {r4, r5, r6, lr}
	ldr r6, _0808FB84 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0808FB88 @ =gUnknown_03000150
	adds r5, r1, r0
	movs r0, #2
	strh r0, [r5, #2]
	ldr r0, _0808FB8C @ =gUnknown_0300015C
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808FB5E
	adds r0, r4, #0
	bl sub_808FBE8
	adds r0, r4, #0
	bl sub_808FC00
	adds r0, r4, #0
	bl sub_808FC3C
_0808FB5E:
	adds r0, r4, #0
	bl sub_808FA24
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808FB7C
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _0808FB90 @ =sub_808F704
	str r0, [r1, #8]
_0808FB7C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808FB84: .4byte gCurTask
_0808FB88: .4byte gUnknown_03000150
_0808FB8C: .4byte gUnknown_0300015C
_0808FB90: .4byte sub_808F704

	thumb_func_start sub_808FB94
sub_808FB94: @ 0x0808FB94
	push {r4, lr}
	ldr r4, _0808FBAC @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	ldr r0, _0808FBB0 @ =gUnknown_03000164
	adds r2, r1, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _0808FBB4
	subs r0, #1
	str r0, [r2]
	b _0808FBDE
	.align 2, 0
_0808FBAC: .4byte gCurTask
_0808FBB0: .4byte gUnknown_03000164
_0808FBB4:
	ldr r2, _0808FBCC @ =gUnknown_03000161
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808FBD0
	bl sub_8094118
	ldr r0, [r4]
	bl TaskDestroy
	b _0808FBDE
	.align 2, 0
_0808FBCC: .4byte gUnknown_03000161
_0808FBD0:
	cmp r0, #1
	bne _0808FBDE
	bl sub_808B3FC_CreateIntro
	ldr r0, [r4]
	bl TaskDestroy
_0808FBDE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808FBE4
sub_808FBE4: @ 0x0808FBE4
	bx lr
	.align 2, 0

	thumb_func_start sub_808FBE8
sub_808FBE8: @ 0x0808FBE8
	adds r2, r0, #0
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x78
	str r0, [r1]
	adds r0, #0xfc
	adds r1, r2, r0
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [r1]
	bx lr

	thumb_func_start sub_808FC00
sub_808FC00: @ 0x0808FC00
	push {lr}
	adds r2, r0, #0
	ldr r1, _0808FC34 @ =0x0000015F
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _0808FC2E
	movs r3, #0xbc
	lsls r3, r3, #1
	adds r0, r2, r3
	movs r1, #0x78
	str r1, [r0]
	movs r0, #0xbe
	lsls r0, r0, #1
	adds r2, r2, r0
	ldr r1, [r2]
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r1, r0
	ble _0808FC2E
	ldr r3, _0808FC38 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0808FC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0808FC34: .4byte 0x0000015F
_0808FC38: .4byte 0xFFFFFD00

	thumb_func_start sub_808FC3C
sub_808FC3C: @ 0x0808FC3C
	push {lr}
	adds r2, r0, #0
	ldr r1, _0808FC70 @ =0x0000015F
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _0808FC6A
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r2, r3
	movs r1, #0x78
	str r1, [r0]
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r2, r2, r0
	ldr r1, [r2]
	movs r0, #0x94
	lsls r0, r0, #8
	cmp r1, r0
	ble _0808FC6A
	ldr r3, _0808FC74 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0808FC6A:
	pop {r0}
	bx r0
	.align 2, 0
_0808FC70: .4byte 0x0000015F
_0808FC74: .4byte 0xFFFFFD00

	thumb_func_start sub_808FC78
sub_808FC78: @ 0x0808FC78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldr r1, _0808FE70 @ =0x0000FFFF
	bl sub_8085500
	ldr r1, _0808FE74 @ =gDispCnt
	movs r2, #0x8a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808FE78 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0808FE7C @ =0x00009C03
	strh r0, [r1]
	ldr r0, _0808FE80 @ =gBgScrollRegs
	mov r3, r8
	strh r3, [r0]
	strh r3, [r0, #2]
	ldr r0, _0808FE84 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _0808FE88 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x40
	strb r0, [r1, #3]
	bl m4aMPlayAllStop
	movs r0, #0x2b
	bl m4aSongNumStart
	ldr r0, _0808FE8C @ =sub_8090480
	ldr r1, _0808FE90 @ =0x000005CC
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _0808FE94 @ =sub_8091480
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r2, _0808FE98 @ =gUnknown_0300037C
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _0808FE9C @ =gUnknown_080E1514
	ldrh r2, [r1]
	ldr r3, _0808FEA0 @ =gUnknown_03000390
	adds r1, r0, r3
	strh r2, [r1]
	ldr r2, _0808FEA4 @ =gUnknown_03000398
	adds r1, r0, r2
	str r5, [r1]
	adds r3, #0xc
	adds r1, r0, r3
	str r5, [r1]
	ldr r1, _0808FEA8 @ =gUnknown_080E1530
	ldrh r2, [r1]
	subs r3, #0x1f
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0808FEAC @ =gUnknown_080E154A
	ldrb r2, [r1]
	adds r3, #2
	adds r1, r0, r3
	strb r2, [r1]
	ldr r2, _0808FEB0 @ =gUnknown_0300037E
	adds r1, r0, r2
	strb r4, [r1]
	adds r3, #1
	adds r2, r0, r3
	movs r1, #5
	strb r1, [r2]
	ldr r1, _0808FEB4 @ =gUnknown_0300038E
	adds r2, r0, r1
	movs r1, #3
	strh r1, [r2]
	adds r3, #0x12
	adds r2, r0, r3
	movs r1, #0xa0
	strh r1, [r2]
	ldr r2, _0808FEB8 @ =gUnknown_03000394
	adds r1, r0, r2
	strh r5, [r1]
	adds r3, #4
	adds r1, r0, r3
	strh r5, [r1]
	movs r4, #0
	ldr r1, _0808FEBC @ =gUnknown_03000040
	adds r1, r1, r0
	mov sb, r1
	ldr r2, _0808FEC0 @ =gUnknown_03000060
	adds r2, r0, r2
	str r2, [sp, #0x70]
	ldr r3, _0808FEC4 @ =gUnknown_03000061
	adds r3, r0, r3
	str r3, [sp, #0x74]
	ldr r1, _0808FEC8 @ =gUnknown_03000062
	adds r1, r0, r1
	str r1, [sp, #0x78]
	ldr r2, _0808FECC @ =gUnknown_03000065
	adds r2, r0, r2
	str r2, [sp, #0x7c]
	ldr r3, _0808FED0 @ =gUnknown_03000070
	adds r3, r3, r0
	mov sl, r3
	ldr r1, _0808FED4 @ =gUnknown_03000090
	adds r1, r0, r1
	str r1, [sp, #8]
	ldr r2, _0808FED8 @ =gUnknown_03000091
	adds r2, r0, r2
	str r2, [sp, #0xc]
	ldr r3, _0808FEDC @ =gUnknown_03000092
	adds r3, r0, r3
	str r3, [sp, #0x10]
	ldr r1, _0808FEE0 @ =gUnknown_03000095
	adds r1, r0, r1
	str r1, [sp, #0x14]
	ldr r2, _0808FEE4 @ =gUnknown_030000A0
	adds r2, r0, r2
	str r2, [sp, #0x28]
	ldr r3, _0808FEE8 @ =gUnknown_030000C0
	adds r3, r0, r3
	str r3, [sp, #0x3c]
	ldr r1, _0808FEEC @ =gUnknown_030000C1
	adds r1, r0, r1
	str r1, [sp, #0x40]
	ldr r2, _0808FEF0 @ =gUnknown_030000C2
	adds r2, r0, r2
	str r2, [sp, #0x44]
	ldr r3, _0808FEF4 @ =gUnknown_030000C5
	adds r3, r0, r3
	str r3, [sp, #0x48]
	ldr r1, _0808FEF8 @ =gUnknown_03000210
	adds r1, r0, r1
	str r1, [sp, #0x2c]
_0808FD9E:
	movs r5, #0
	lsls r3, r4, #2
	ldr r2, _0808FEFC @ =0x00000211
	add r2, r8
	str r2, [sp, #0x30]
	ldr r0, _0808FF00 @ =0x00000212
	add r0, r8
	str r0, [sp, #0x34]
	ldr r1, _0808FF04 @ =0x00000215
	add r1, r8
	str r1, [sp, #0x38]
	movs r2, #0x90
	lsls r2, r2, #2
	add r2, r8
	str r2, [sp, #0x4c]
	ldr r0, _0808FF08 @ =0x00000241
	add r0, r8
	str r0, [sp, #0x50]
	ldr r1, _0808FF0C @ =0x00000242
	add r1, r8
	str r1, [sp, #0x54]
	ldr r2, _0808FF10 @ =0x00000245
	add r2, r8
	str r2, [sp, #0x58]
	movs r0, #0xd8
	lsls r0, r0, #2
	add r0, r8
	str r0, [sp, #0x18]
	ldr r1, _0808FF14 @ =0x00000361
	add r1, r8
	str r1, [sp, #0x1c]
	ldr r2, _0808FF18 @ =0x00000362
	add r2, r8
	str r2, [sp, #0x20]
	ldr r0, _0808FF1C @ =0x00000365
	add r0, r8
	str r0, [sp, #0x24]
	movs r1, #0x9c
	lsls r1, r1, #2
	add r1, r8
	str r1, [sp, #0x5c]
	ldr r2, _0808FF20 @ =0x00000271
	add r2, r8
	str r2, [sp, #0x60]
	ldr r0, _0808FF24 @ =0x00000272
	add r0, r8
	str r0, [sp, #0x64]
	ldr r1, _0808FF28 @ =0x00000275
	add r1, r8
	str r1, [sp, #0x68]
	mov r2, r8
	adds r2, #0x2a
	str r2, [sp, #0x6c]
	adds r2, r3, #0
	movs r1, #0xe8
	lsls r1, r1, #2
	add r1, r8
	movs r6, #0
_0808FE12:
	lsls r0, r5, #3
	adds r0, r2, r0
	adds r0, r1, r0
	str r6, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0808FE12
	movs r0, #0xf8
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r3
	movs r1, #0
	str r1, [r0]
	movs r0, #0x8e
	lsls r0, r0, #3
	add r0, r8
	adds r0, r0, r3
	str r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0808FD9E
	movs r4, #0
	ldr r3, _0808FF2C @ =0x0000047C
	add r3, r8
	ldr r6, _0808FF30 @ =gUnknown_080E1484
_0808FE4C:
	movs r5, #0
	lsls r2, r4, #2
_0808FE50:
	cmp r4, #1
	bhi _0808FF34
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r3, r0
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, r2, r1
	adds r1, r1, r6
	ldr r1, [r1]
	lsls r1, r1, #8
	b _0808FF5C
	.align 2, 0
_0808FE70: .4byte 0x0000FFFF
_0808FE74: .4byte gDispCnt
_0808FE78: .4byte gBgCntRegs
_0808FE7C: .4byte 0x00009C03
_0808FE80: .4byte gBgScrollRegs
_0808FE84: .4byte gUnknown_03004D80
_0808FE88: .4byte gUnknown_03002280
_0808FE8C: .4byte sub_8090480
_0808FE90: .4byte 0x000005CC
_0808FE94: .4byte sub_8091480
_0808FE98: .4byte gUnknown_0300037C
_0808FE9C: .4byte gUnknown_080E1514
_0808FEA0: .4byte gUnknown_03000390
_0808FEA4: .4byte gUnknown_03000398
_0808FEA8: .4byte gUnknown_080E1530
_0808FEAC: .4byte gUnknown_080E154A
_0808FEB0: .4byte gUnknown_0300037E
_0808FEB4: .4byte gUnknown_0300038E
_0808FEB8: .4byte gUnknown_03000394
_0808FEBC: .4byte gUnknown_03000040
_0808FEC0: .4byte gUnknown_03000060
_0808FEC4: .4byte gUnknown_03000061
_0808FEC8: .4byte gUnknown_03000062
_0808FECC: .4byte gUnknown_03000065
_0808FED0: .4byte gUnknown_03000070
_0808FED4: .4byte gUnknown_03000090
_0808FED8: .4byte gUnknown_03000091
_0808FEDC: .4byte gUnknown_03000092
_0808FEE0: .4byte gUnknown_03000095
_0808FEE4: .4byte gUnknown_030000A0
_0808FEE8: .4byte gUnknown_030000C0
_0808FEEC: .4byte gUnknown_030000C1
_0808FEF0: .4byte gUnknown_030000C2
_0808FEF4: .4byte gUnknown_030000C5
_0808FEF8: .4byte gUnknown_03000210
_0808FEFC: .4byte 0x00000211
_0808FF00: .4byte 0x00000212
_0808FF04: .4byte 0x00000215
_0808FF08: .4byte 0x00000241
_0808FF0C: .4byte 0x00000242
_0808FF10: .4byte 0x00000245
_0808FF14: .4byte 0x00000361
_0808FF18: .4byte 0x00000362
_0808FF1C: .4byte 0x00000365
_0808FF20: .4byte 0x00000271
_0808FF24: .4byte 0x00000272
_0808FF28: .4byte 0x00000275
_0808FF2C: .4byte 0x0000047C
_0808FF30: .4byte gUnknown_080E1484
_0808FF34:
	cmp r4, #2
	bne _0808FF50
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, #8
	adds r0, r3, r0
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r1, #8
	adds r1, r1, r6
	ldr r1, [r1]
	b _0808FF5C
_0808FF50:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r3, r0
	movs r1, #0
_0808FF5C:
	str r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bhi _0808FF6A
	b _0808FE50
_0808FF6A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0808FF76
	b _0808FE4C
_0808FF76:
	movs r4, #0
	ldr r7, _080900FC @ =0x000004F4
	add r7, r8
	ldr r3, _08090100 @ =gUnknown_080E13AC
	mov ip, r3
_0808FF80:
	movs r5, #0
	lsls r3, r4, #2
	adds r2, r4, #1
	adds r4, r3, #0
_0808FF88:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r7, r0
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xb
	bls _0808FF88
	movs r5, #0
	adds r4, r3, #0
	ldr r3, _08090104 @ =0x00000584
	add r3, r8
	ldr r6, _08090108 @ =gUnknown_080E143C
_0808FFAE:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r3, r0
	adds r0, r0, r6
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _0808FFAE
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _0808FF80
	movs r5, #0
	lsls r3, r4, #2
	adds r4, r3, #0
	ldr r2, _080900FC @ =0x000004F4
	add r2, r8
	ldr r6, _08090100 @ =gUnknown_080E13AC
_0808FFDE:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r2, r0
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xb
	bls _0808FFDE
	movs r5, #0
	ldr r2, _08090104 @ =0x00000584
	add r2, r8
	ldr r4, _08090108 @ =gUnknown_080E143C
_08090000:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r1, r2, r0
	adds r0, r0, r4
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08090000
	movs r5, #0
	ldr r3, _0809010C @ =0x00000381
	add r3, r8
	movs r1, #0
	ldr r2, _08090110 @ =0x00000387
	add r2, r8
_08090026:
	adds r0, r3, r5
	strb r1, [r0]
	adds r0, r2, r5
	strb r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08090026
	movs r5, #0
_0809003A:
	bl sub_80854DC
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	movs r2, #0xfa
	lsls r2, r2, #2
	add r2, r8
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
	movs r0, #0xfb
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r4
	movs r6, #0
	str r6, [r0]
	bl sub_80854DC
	movs r2, #0xfc
	lsls r2, r2, #2
	add r2, r8
	adds r2, r2, r4
	movs r1, #3
	ands r1, r0
	adds r1, #0xb
	movs r3, #1
	adds r0, r3, #0
	lsls r0, r1
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _0809003A
	movs r1, #0x8f
	lsls r1, r1, #3
	add r1, r8
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
	movs r5, #0xdc
	lsls r5, r5, #2
	add r5, r8
	strh r3, [r5]
	strh r6, [r5, #4]
	movs r0, #0x80
	strh r0, [r5, #6]
	ldr r0, _08090114 @ =0x00003FBF
	strh r0, [r5, #8]
	strh r6, [r5, #0xa]
	movs r1, #0xe6
	lsls r1, r1, #2
	add r1, r8
	ldr r0, _08090118 @ =0x06010000
	str r0, [r1]
	movs r4, #0
	movs r6, #0xe6
	lsls r6, r6, #2
	add r6, r8
	movs r5, #0
_080900B6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r6]
	str r0, [r2, #4]
	ldr r0, [r6]
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r6]
	ldr r1, _0809011C @ =gUnknown_080E12FC
	adds r0, r4, #3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r2, #0x16]
	strh r5, [r2, #0x18]
	cmp r4, #1
	bhi _08090120
	adds r0, r4, #1
	b _08090124
	.align 2, 0
_080900FC: .4byte 0x000004F4
_08090100: .4byte gUnknown_080E13AC
_08090104: .4byte 0x00000584
_08090108: .4byte gUnknown_080E143C
_0809010C: .4byte 0x00000381
_08090110: .4byte 0x00000387
_08090114: .4byte 0x00003FBF
_08090118: .4byte 0x06010000
_0809011C: .4byte gUnknown_080E12FC
_08090120:
	adds r0, r4, #0
	adds r0, #0xa
_08090124:
	lsls r0, r0, #6
	strh r0, [r2, #0x1a]
	str r5, [r2, #0x10]
	strh r5, [r2, #8]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	adds r0, r2, #0
	adds r0, #0x22
	movs r3, #0x10
	strb r3, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080900B6
	movs r5, #0xe6
	lsls r5, r5, #2
	add r5, r8
	ldr r0, [r5]
	mov r1, sb
	str r0, [r1, #4]
	ldr r0, [r5]
	movs r2, #0xa8
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [r5]
	ldr r7, _08090478 @ =gUnknown_080E12FC
	ldrh r0, [r7, #4]
	movs r6, #0
	movs r4, #0
	strh r0, [r1, #0xa]
	ldrb r0, [r7, #6]
	ldr r3, [sp, #0x70]
	strb r0, [r3]
	movs r0, #0xff
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	mov r2, sb
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	adds r0, #1
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	movs r0, #0x10
	ldr r3, [sp, #0x78]
	strb r0, [r3]
	ldr r1, [sp, #0x7c]
	strb r6, [r1]
	str r4, [r2, #0x10]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r2, #0x28]
	mov r0, sb
	bl sub_8004558
	ldr r0, [r5]
	mov r1, sl
	str r0, [r1, #4]
	ldr r1, [r7, #0x38]
	lsls r1, r1, #5
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	ldrh r0, [r7, #0x3c]
	mov r2, sl
	strh r0, [r2, #0xa]
	adds r0, r7, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	ldr r3, [sp, #8]
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	movs r3, #0x10
	ldr r2, [sp, #0x10]
	strb r3, [r2]
	ldr r0, [sp, #0x14]
	strb r6, [r0]
	mov r1, sl
	str r4, [r1, #0x10]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	mov r0, sl
	bl sub_8004558
	ldr r0, [r5]
	ldr r3, [sp, #0x28]
	str r0, [r3, #4]
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r5]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #0x40]
	strb r0, [r3]
	ldr r0, [sp, #0x28]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r0, #0x90
	lsls r0, r0, #2
	ldr r1, [sp, #0x28]
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	movs r3, #0x10
	ldr r2, [sp, #0x44]
	strb r3, [r2]
	ldr r0, [sp, #0x48]
	strb r6, [r0]
	str r4, [r1, #0x10]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	ldr r0, [sp, #0x28]
	bl sub_8004558
	movs r6, #0xe6
	lsls r6, r6, #2
	add r6, r8
	movs r5, #0
_08090256:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xd0
	mov r1, r8
	adds r3, r1, r0
	ldr r0, [r6]
	str r0, [r3, #4]
	ldr r7, _08090478 @ =gUnknown_080E12FC
	adds r2, r4, #0
	adds r2, #0xd
	lsls r2, r2, #3
	adds r2, r2, r7
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r2, #4]
	strh r0, [r3, #0xa]
	ldrb r1, [r2, #6]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov r2, sp
	strb r0, [r2, #4]
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, #0x81
	strh r0, [r3, #0x1a]
	strh r5, [r3, #8]
	strh r5, [r3, #0x14]
	strh r5, [r3, #0x1c]
	adds r0, r3, #0
	adds r0, #0x22
	movs r1, #0x10
	mov sl, r1
	mov r2, sl
	strb r2, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	str r5, [r3, #0x10]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	str r2, [r3, #0x28]
	adds r0, r3, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bls _08090256
	movs r0, #0xf8
	lsls r0, r0, #1
	add r0, r8
	movs r5, #0xe6
	lsls r5, r5, #2
	add r5, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	adds r1, r7, #0
	adds r1, #0x98
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0x9c
	ldrh r1, [r1]
	movs r6, #0
	movs r4, #0
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0x9e
	ldrb r1, [r1]
	ldr r3, [sp, #0x2c]
	strb r1, [r3]
	ldr r2, [sp, #0x30]
	ldrb r1, [r2]
	mov r3, sp
	ldrb r3, [r3, #4]
	orrs r1, r3
	strb r1, [r2]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r1, #0xa0
	lsls r1, r1, #1
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r2, sl
	ldr r1, [sp, #0x34]
	strb r2, [r1]
	movs r1, #1
	ldr r3, [sp, #0x38]
	strb r1, [r3]
	str r4, [r0, #0x10]
	mov r1, sb
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x88
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	adds r1, r7, #0
	adds r1, #0xa0
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0xa4
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0xa6
	ldrb r1, [r1]
	ldr r2, [sp, #0x4c]
	strb r1, [r2]
	ldr r3, [sp, #0x50]
	ldrb r1, [r3]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r1, r2
	strb r1, [r3]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r1, #0xc0
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r1, sl
	ldr r3, [sp, #0x54]
	strb r1, [r3]
	ldr r2, [sp, #0x58]
	strb r6, [r2]
	str r4, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	ldr r2, [r7, #0x48]
	lsls r2, r2, #6
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0x4e
	ldrb r1, [r1]
	ldr r2, [sp, #0x18]
	strb r1, [r2]
	ldr r3, [sp, #0x1c]
	ldrb r1, [r3]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r1, r2
	strb r1, [r3]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r1, sl
	ldr r3, [sp, #0x20]
	strb r1, [r3]
	ldr r2, [sp, #0x24]
	strb r6, [r2]
	str r4, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x94
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r5]
	str r1, [r0, #4]
	ldr r2, [r7, #0x40]
	lsls r2, r2, #5
	ldr r1, [r5]
	adds r1, r1, r2
	str r1, [r5]
	adds r1, r7, #0
	adds r1, #0x44
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r1, r7, #0
	adds r1, #0x46
	ldrb r1, [r1]
	ldr r2, [sp, #0x5c]
	strb r1, [r2]
	ldr r3, [sp, #0x60]
	ldrb r1, [r3]
	mov r2, sp
	ldrb r2, [r2, #4]
	orrs r1, r2
	strb r1, [r3]
	strh r4, [r0, #0x16]
	strh r4, [r0, #0x18]
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	mov r1, sl
	ldr r3, [sp, #0x64]
	strb r1, [r3]
	ldr r2, [sp, #0x68]
	strb r6, [r2]
	str r4, [r0, #0x10]
	mov r3, sb
	str r3, [r0, #0x28]
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, r8
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0809047C @ =0x0600E000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0xaa
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x20
	strh r0, [r1, #0x26]
	movs r0, #0x40
	strh r0, [r1, #0x28]
	ldr r2, [sp, #0x6c]
	strb r6, [r2]
	strh r4, [r1, #0x2e]
	mov r0, r8
	bl sub_8002A3C
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090478: .4byte gUnknown_080E12FC
_0809047C: .4byte 0x0600E000

	thumb_func_start sub_8090480
sub_8090480: @ 0x08090480
	push {r4, r5, r6, r7, lr}
	ldr r7, _0809050C @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _08090510 @ =gUnknown_03000370
	adds r6, r5, r0
	movs r0, #2
	strh r0, [r6, #2]
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _08090514 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _080904B2
	adds r0, r4, #0
	bl sub_8090EB4
_080904B2:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r1, _08090518 @ =gUnknown_0300037C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _080904E0
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_080904E0:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r4, #0
	bl sub_8090F6C
	adds r0, r6, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08090504
	movs r0, #0
	strh r0, [r6, #4]
	ldr r1, [r7]
	ldr r0, _0809051C @ =sub_80913DC
	str r0, [r1, #8]
_08090504:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809050C: .4byte gCurTask
_08090510: .4byte gUnknown_03000370
_08090514: .4byte gBgScrollRegs
_08090518: .4byte gUnknown_0300037C
_0809051C: .4byte sub_80913DC

	thumb_func_start sub_8090520
sub_8090520: @ 0x08090520
	push {r4, r5, r6, r7, lr}
	ldr r7, _080905A8 @ =gCurTask
	ldr r0, [r7]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _080905AC @ =gUnknown_03000370
	adds r6, r5, r0
	ldr r0, _080905B0 @ =0x00003FFF
	strh r0, [r6, #8]
	movs r0, #1
	strh r0, [r6, #2]
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _080905B4 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _08090556
	adds r0, r4, #0
	bl sub_8090EB4
_08090556:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r1, _080905B8 @ =gUnknown_0300037C
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _08090584
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_08090584:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r6, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080905A2
	movs r0, #0
	strh r0, [r6, #4]
	ldr r1, [r7]
	ldr r0, _080905BC @ =sub_8091468
	str r0, [r1, #8]
_080905A2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080905A8: .4byte gCurTask
_080905AC: .4byte gUnknown_03000370
_080905B0: .4byte 0x00003FFF
_080905B4: .4byte gBgScrollRegs
_080905B8: .4byte gUnknown_0300037C
_080905BC: .4byte sub_8091468

	thumb_func_start sub_80905C0
sub_80905C0: @ 0x080905C0
	push {r4, r5, r6, r7, lr}
	ldr r7, _08090634 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _08090638 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _080905EA
	adds r0, r4, #0
	bl sub_8090EB4
_080905EA:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r0, _0809063C @ =gUnknown_0300037C
	adds r5, r6, r0
	ldrb r0, [r5]
	cmp r0, #0xe
	bhi _08090618
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_08090618:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r4, #0
	bl sub_8090F6C
	ldr r1, _08090640 @ =gUnknown_03000390
	adds r2, r6, r1
	ldrh r0, [r2]
	cmp r0, #0
	beq _08090644
	subs r0, #1
	strh r0, [r2]
	b _0809065C
	.align 2, 0
_08090634: .4byte gCurTask
_08090638: .4byte gBgScrollRegs
_0809063C: .4byte gUnknown_0300037C
_08090640: .4byte gUnknown_03000390
_08090644:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08090664 @ =gUnknown_080E1514
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r1, [r7]
	ldr r0, _08090668 @ =sub_80913DC
	str r0, [r1, #8]
_0809065C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090664: .4byte gUnknown_080E1514
_08090668: .4byte sub_80913DC

	thumb_func_start sub_809066C
sub_809066C: @ 0x0809066C
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #0xdf
	lsls r5, r5, #2
	add r5, ip
	ldrb r3, [r5]
	adds r2, r3, #0
	cmp r2, #0xc
	bhi _0809069E
	movs r1, #0xf8
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0x8c
	lsls r0, r0, #3
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	movs r1, #0xf9
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [r1]
	b _080907D0
_0809069E:
	cmp r2, #0xd
	bne _08090712
	movs r2, #0xf9
	lsls r2, r2, #2
	add r2, ip
	ldr r1, [r2]
	ldr r0, _080906EC @ =0xFFFFCE00
	cmp r1, r0
	ble _08090704
	ldr r3, _080906F0 @ =0xFFFFFF00
	adds r0, r1, r3
	str r0, [r2]
	movs r3, #0xf8
	lsls r3, r3, #2
	add r3, ip
	ldr r1, [r3]
	ldr r0, _080906F4 @ =0x0000A9FF
	cmp r1, r0
	ble _080906C6
	b _080907D0
_080906C6:
	ldr r2, _080906F8 @ =0x0000038E
	add r2, ip
	ldrh r1, [r2]
	ldr r0, _080906FC @ =0x000003FF
	cmp r1, r0
	bhi _080906D6
	adds r0, r1, #1
	strh r0, [r2]
_080906D6:
	ldr r1, _08090700 @ =gUnknown_08097AA4
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	b _080907D0
	.align 2, 0
_080906EC: .4byte 0xFFFFCE00
_080906F0: .4byte 0xFFFFFF00
_080906F4: .4byte 0x0000A9FF
_080906F8: .4byte 0x0000038E
_080906FC: .4byte 0x000003FF
_08090700: .4byte gUnknown_08097AA4
_08090704:
	movs r1, #0xf8
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
	b _0809078C
_08090712:
	cmp r2, #0xf
	bne _08090740
	movs r2, #0xf9
	lsls r2, r2, #2
	add r2, ip
	ldr r1, [r2]
	ldr r0, _0809072C @ =0x000054FF
	cmp r1, r0
	bgt _08090730
	adds r0, r1, #0
	adds r0, #0x50
	b _080907CE
	.align 2, 0
_0809072C: .4byte 0x000054FF
_08090730:
	adds r0, r3, #1
	strb r0, [r5]
	movs r1, #0xe5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #0x3c
	strh r0, [r1]
	b _080907D0
_08090740:
	cmp r2, #0x10
	bhi _08090794
	movs r6, #1
	movs r4, #0xe5
	lsls r4, r4, #2
	add r4, ip
	ldrh r0, [r4]
	cmp r0, #0xdb
	bls _08090754
	movs r6, #0
_08090754:
	movs r3, #0xf9
	lsls r3, r3, #2
	add r3, ip
	ldr r2, _08090784 @ =gUnknown_08097AA4
	ldrh r0, [r4]
	lsls r0, r0, #1
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	asrs r0, r6
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldrh r1, [r4]
	ldr r0, _08090788 @ =0x0000012B
	cmp r1, r0
	bhi _0809078C
	adds r0, r1, #1
	strh r0, [r4]
	b _080907D0
	.align 2, 0
_08090784: .4byte gUnknown_08097AA4
_08090788: .4byte 0x0000012B
_0809078C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _080907D0
_08090794:
	movs r1, #0xf9
	lsls r1, r1, #2
	add r1, ip
	ldr r0, _080907F4 @ =0x00000474
	add r0, ip
	ldr r0, [r0]
	ldr r4, _080907F8 @ =0xFFFFC400
	adds r0, r0, r4
	ldr r1, [r1]
	cmp r1, r0
	ble _080907B2
	cmp r2, #0x11
	bne _080907B2
	adds r0, r3, #1
	strb r0, [r5]
_080907B2:
	movs r2, #0xf9
	lsls r2, r2, #2
	add r2, ip
	ldr r0, _080907F4 @ =0x00000474
	add r0, ip
	ldr r0, [r0]
	ldr r1, _080907FC @ =0xFFFFD800
	adds r0, r0, r1
	ldr r1, [r2]
	cmp r1, r0
	bge _080907D0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
_080907CE:
	str r0, [r2]
_080907D0:
	movs r0, #0xdf
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _080907EC
	movs r0, #0xf8
	lsls r0, r0, #2
	add r0, ip
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r2, #2
	bl sub_808E95C
_080907EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080907F4: .4byte 0x00000474
_080907F8: .4byte 0xFFFFC400
_080907FC: .4byte 0xFFFFD800

	thumb_func_start sub_8090800
sub_8090800: @ 0x08090800
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0809082C
	movs r4, #0x8e
	lsls r4, r4, #3
	adds r1, r3, r4
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
	ldr r0, _08090828 @ =0x00000474
	adds r1, r3, r0
	movs r0, #0x8c
	lsls r0, r0, #7
	b _080908A4
	.align 2, 0
_08090828: .4byte 0x00000474
_0809082C:
	cmp r0, #0xd
	bne _0809084C
	ldr r1, _08090844 @ =0x00000474
	adds r2, r3, r1
	ldr r1, [r2]
	ldr r0, _08090848 @ =0x00008BFF
	cmp r1, r0
	bgt _0809084C
	adds r0, r1, #0
	adds r0, #0x80
	str r0, [r2]
	b _080908A6
	.align 2, 0
_08090844: .4byte 0x00000474
_08090848: .4byte 0x00008BFF
_0809084C:
	movs r4, #0xdf
	lsls r4, r4, #2
	adds r5, r3, r4
	ldrb r4, [r5]
	adds r0, r4, #0
	cmp r0, #0xe
	bne _0809087A
	ldr r0, _08090870 @ =0x00000474
	adds r2, r3, r0
	ldr r1, [r2]
	movs r0, #0xaa
	lsls r0, r0, #7
	cmp r1, r0
	ble _08090874
	adds r0, r1, #0
	subs r0, #0x40
	str r0, [r2]
	b _080908A6
	.align 2, 0
_08090870: .4byte 0x00000474
_08090874:
	adds r0, r4, #1
	strb r0, [r5]
	b _080908A6
_0809087A:
	cmp r0, #0x10
	bhi _0809089C
	ldr r1, _08090894 @ =0x00000474
	adds r2, r3, r1
	ldr r1, [r2]
	ldr r0, _08090898 @ =0x000086FF
	cmp r1, r0
	bgt _080908A6
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r2]
	b _080908A6
	.align 2, 0
_08090894: .4byte 0x00000474
_08090898: .4byte 0x000086FF
_0809089C:
	ldr r4, _080908C4 @ =0x00000474
	adds r1, r3, r4
	ldr r0, [r1]
	subs r0, #8
_080908A4:
	str r0, [r1]
_080908A6:
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _080908F0
	ldr r4, _080908C8 @ =0x00000396
	adds r1, r3, r4
	ldrh r2, [r1]
	ldr r0, _080908CC @ =0x000003FF
	cmp r2, r0
	bhi _080908D0
	adds r0, r2, #0
	adds r0, #0x20
	b _080908D2
	.align 2, 0
_080908C4: .4byte 0x00000474
_080908C8: .4byte 0x00000396
_080908CC: .4byte 0x000003FF
_080908D0:
	movs r0, #0
_080908D2:
	strh r0, [r1]
	ldr r0, _080908F8 @ =0x00000474
	adds r2, r3, r0
	ldr r1, _080908FC @ =gUnknown_08097AA4
	ldr r4, _08090900 @ =0x00000396
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_080908F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080908F8: .4byte 0x00000474
_080908FC: .4byte gUnknown_08097AA4
_08090900: .4byte 0x00000396

	thumb_func_start sub_8090904
sub_8090904: @ 0x08090904
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	movs r0, #0xdf
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	subs r0, #0xd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080909AC
	movs r7, #0
	ldr r0, _08090970 @ =0x0000047C
	add r0, r8
	mov sb, r0
	movs r1, #0x90
	lsls r1, r1, #3
	add r1, r8
	mov ip, r1
	ldr r5, _08090974 @ =0x00000484
	add r5, r8
	ldr r3, _08090978 @ =0x000103FE
	mov sl, r3
_0809093C:
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r3, r1, #2
	mov r6, sb
	adds r4, r6, r3
	ldr r2, [r4]
	ldr r6, _0809097C @ =0x000009FF
	adds r1, r2, r6
	adds r6, r0, #0
	cmp r1, sl
	bls _08090962
	mov r1, ip
	adds r0, r1, r3
	ldr r0, [r0]
	ldr r1, _0809097C @ =0x000009FF
	adds r0, r0, r1
	ldr r1, _08090980 @ =0x0000B3FE
	cmp r0, r1
	bhi _080909A2
_08090962:
	cmp r7, #2
	bhi _08090984
	adds r0, r5, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	subs r0, r2, r0
	b _0809098C
	.align 2, 0
_08090970: .4byte 0x0000047C
_08090974: .4byte 0x00000484
_08090978: .4byte 0x000103FE
_0809097C: .4byte 0x000009FF
_08090980: .4byte 0x0000B3FE
_08090984:
	adds r0, r5, r3
	ldr r0, [r0]
	lsls r0, r0, #8
	adds r0, r2, r0
_0809098C:
	str r0, [r4]
	adds r0, r6, r7
	lsls r0, r0, #2
	mov r3, ip
	adds r2, r3, r0
	adds r0, r5, r0
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r2]
	subs r0, r0, r1
	str r0, [r2]
_080909A2:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bls _0809093C
_080909AC:
	movs r0, #0xdf
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _080909BA
	b _08090C02
_080909BA:
	movs r7, #0
	ldr r4, _08090A28 @ =0x00000381
	add r4, r8
	mov sl, r4
	ldr r6, _08090A2C @ =0x0000047C
	add r6, r8
	str r6, [sp]
	ldr r0, _08090A30 @ =0x00000484
	add r0, r8
	mov sb, r0
	ldr r1, _08090A34 @ =0x00000474
	add r1, r8
	str r1, [sp, #0xc]
	movs r3, #0x8e
	lsls r3, r3, #3
	add r3, r8
	str r3, [sp, #4]
	movs r4, #0x90
	lsls r4, r4, #3
	add r4, r8
	str r4, [sp, #8]
	ldr r6, _08090A38 @ =0x00000387
	add r6, r8
	str r6, [sp, #0x10]
_080909EA:
	mov r0, sl
	adds r0, r0, r7
	mov ip, r0
	ldrb r5, [r0]
	cmp r5, #0x10
	bls _080909F8
	b _08090B0E
_080909F8:
	cmp r7, #2
	bhi _08090A90
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r4, r1, r2
	ldr r3, [sp, #4]
	ldr r1, [r3]
	movs r6, #0xf0
	lsls r6, r6, #6
	adds r1, r1, r6
	ldr r3, [r4]
	adds r6, r0, #0
	cmp r3, r1
	bge _08090A3C
	mov r1, sb
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #7
	adds r0, r3, r0
	str r0, [r4]
	b _08090A44
	.align 2, 0
_08090A28: .4byte 0x00000381
_08090A2C: .4byte 0x0000047C
_08090A30: .4byte 0x00000484
_08090A34: .4byte 0x00000474
_08090A38: .4byte 0x00000387
_08090A3C:
	movs r0, #0x10
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
_08090A44:
	mov r4, sl
	adds r5, r4, r7
	ldrb r4, [r5]
	movs r0, #1
	mov ip, r0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _08090B0E
	adds r0, r6, r7
	lsls r1, r0, #2
	ldr r3, [sp, #8]
	adds r2, r3, r1
	ldr r6, [sp, #0xc]
	ldr r0, [r6]
	ldr r3, _08090A7C @ =0xFFFFE200
	adds r0, r0, r3
	ldr r3, [r2]
	cmp r3, r0
	bge _08090A80
	mov r4, sb
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #7
	adds r0, r3, r0
	str r0, [r2]
	b _08090A86
	.align 2, 0
_08090A7C: .4byte 0xFFFFE200
_08090A80:
	mov r0, ip
	orrs r0, r4
	strb r0, [r5]
_08090A86:
	ldr r6, [sp, #0x10]
	adds r1, r6, r7
	movs r0, #2
	strb r0, [r1]
	b _08090B0E
_08090A90:
	lsls r0, r7, #2
	adds r1, r0, r7
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r4, r1, r2
	ldr r3, [sp, #4]
	ldr r1, [r3]
	ldr r6, _08090AB8 @ =0xFFFFC400
	adds r1, r1, r6
	ldr r3, [r4]
	adds r6, r0, #0
	cmp r3, r1
	ble _08090ABC
	mov r1, sb
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #7
	subs r0, r3, r0
	str r0, [r4]
	b _08090AC4
	.align 2, 0
_08090AB8: .4byte 0xFFFFC400
_08090ABC:
	movs r0, #0x10
	orrs r0, r5
	mov r3, ip
	strb r0, [r3]
_08090AC4:
	mov r4, sl
	adds r5, r4, r7
	ldrb r4, [r5]
	movs r0, #1
	mov ip, r0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	bne _08090B06
	adds r0, r6, r7
	lsls r1, r0, #2
	ldr r3, [sp, #8]
	adds r2, r3, r1
	ldr r6, [sp, #0xc]
	ldr r0, [r6]
	ldr r3, _08090AFC @ =0xFFFFE200
	adds r0, r0, r3
	ldr r3, [r2]
	cmp r3, r0
	bge _08090B00
	mov r4, sb
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #7
	adds r0, r3, r0
	str r0, [r2]
	b _08090B06
	.align 2, 0
_08090AFC: .4byte 0xFFFFE200
_08090B00:
	mov r0, ip
	orrs r0, r4
	strb r0, [r5]
_08090B06:
	ldr r6, [sp, #0x10]
	adds r0, r6, r7
	movs r1, #1
	strb r1, [r0]
_08090B0E:
	mov r3, sl
	adds r0, r3, r7
	ldrb r0, [r0]
	cmp r0, #0xf
	bls _08090BA4
	lsls r2, r7, #2
	adds r0, r2, r7
	lsls r0, r0, #2
	movs r1, #0x91
	lsls r1, r1, #3
	add r1, r8
	adds r3, r1, r0
	add r0, sb
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldr r0, _08090B64 @ =0x0003FF00
	adds r6, r2, #0
	cmp r1, r0
	ble _08090B3E
	movs r0, #0
	str r0, [r3]
_08090B3E:
	ldr r0, [r3]
	asrs r0, r0, #2
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r1, _08090B68 @ =gUnknown_08097AA4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08090B6C
	ldr r3, [sp, #0x10]
	adds r0, r3, r7
	movs r4, #1
	strb r4, [r0]
	b _08090B74
	.align 2, 0
_08090B64: .4byte 0x0003FF00
_08090B68: .4byte gUnknown_08097AA4
_08090B6C:
	ldr r0, [sp, #0x10]
	adds r1, r0, r7
	movs r0, #2
	strb r0, [r1]
_08090B74:
	adds r1, r6, r7
	lsls r1, r1, #2
	ldr r3, [sp]
	adds r2, r3, r1
	movs r0, #0x91
	lsls r0, r0, #3
	add r0, r8
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #2
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r0, r4
	ldr r6, _08090C14 @ =gUnknown_08097AA4
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08090BA4:
	mov r1, sl
	adds r0, r1, r7
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08090BF6
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #2
	ldr r0, _08090C18 @ =0x0000048C
	add r0, r8
	adds r3, r0, r2
	mov r4, sb
	adds r0, r4, r2
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r3]
	ldr r0, _08090C1C @ =0x0003FF00
	cmp r1, r0
	ble _08090BD6
	movs r0, #0
	str r0, [r3]
_08090BD6:
	ldr r6, [sp, #8]
	adds r2, r6, r2
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08090C14 @ =gUnknown_08097AA4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	ldr r3, _08090C20 @ =0xFFFFE200
	adds r0, r0, r3
	ldr r4, [sp, #0xc]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r2]
_08090BF6:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bhi _08090C02
	b _080909EA
_08090C02:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090C14: .4byte gUnknown_08097AA4
_08090C18: .4byte 0x0000048C
_08090C1C: .4byte 0x0003FF00
_08090C20: .4byte 0xFFFFE200

	thumb_func_start sub_8090C24
sub_8090C24: @ 0x08090C24
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xdf
	lsls r0, r0, #2
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0xc
	bhi _08090C74
	movs r0, #0x8c
	lsls r0, r0, #3
	adds r1, r4, r0
	movs r0, #0x78
	str r0, [r1]
	ldr r0, _08090C58 @ =0x00000464
	adds r1, r4, r0
	movs r0, #0x50
	str r0, [r1]
	movs r1, #0xe4
	lsls r1, r1, #2
	adds r2, r4, r1
	ldrh r0, [r2]
	cmp r0, #0
	beq _08090C5C
	subs r0, #1
	strh r0, [r2]
	b _08090C86
	.align 2, 0
_08090C58: .4byte 0x00000464
_08090C5C:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r1, _08090C70 @ =gUnknown_080E1514
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08090C86
	.align 2, 0
_08090C70: .4byte gUnknown_080E1514
_08090C74:
	ldr r0, _08090C9C @ =0x00000464
	adds r2, r4, r0
	ldr r1, [r2]
	movs r0, #0x32
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08090C86
	subs r0, r1, #1
	str r0, [r2]
_08090C86:
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r1, #0x78
	movs r2, #2
	bl sub_808E8F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090C9C: .4byte 0x00000464

	thumb_func_start sub_8090CA0
sub_8090CA0: @ 0x08090CA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _08090D52
	movs r5, #0
	ldr r6, _08090D08 @ =0x00000584
	adds r6, r6, r3
	mov r8, r6
	movs r0, #0xb1
	lsls r0, r0, #3
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _08090D0C @ =0x0000058C
	adds r7, r3, r1
	ldr r6, _08090D10 @ =0x000103FE
	mov sl, r6
	ldr r0, _08090D14 @ =gUnknown_080E1444
	mov sb, r0
_08090CD4:
	lsls r0, r5, #1
	adds r1, r0, r5
	lsls r3, r1, #2
	mov r1, r8
	adds r2, r1, r3
	ldr r4, [r2]
	ldr r6, _08090D18 @ =0x000009FF
	adds r1, r4, r6
	adds r6, r0, #0
	cmp r1, sl
	bls _08090CFA
	mov r1, ip
	adds r0, r1, r3
	ldr r0, [r0]
	ldr r1, _08090D18 @ =0x000009FF
	adds r0, r0, r1
	ldr r1, _08090D1C @ =0x0000B3FE
	cmp r0, r1
	bhi _08090D48
_08090CFA:
	cmp r5, #2
	bhi _08090D20
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #6
	subs r0, r4, r0
	b _08090D28
	.align 2, 0
_08090D08: .4byte 0x00000584
_08090D0C: .4byte 0x0000058C
_08090D10: .4byte 0x000103FE
_08090D14: .4byte gUnknown_080E1444
_08090D18: .4byte 0x000009FF
_08090D1C: .4byte 0x0000B3FE
_08090D20:
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #6
	adds r0, r4, r0
_08090D28:
	str r0, [r2]
	adds r2, r6, r5
	lsls r2, r2, #2
	mov r6, ip
	adds r4, r6, r2
	adds r3, r7, r2
	ldr r1, [r3]
	asrs r1, r1, #7
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	add r2, sb
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
_08090D48:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08090CD4
_08090D52:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8090D60
sub_8090D60: @ 0x08090D60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r1, r0, r2
	ldrb r3, [r1]
	cmp r3, #0xc
	bhi _08090E0A
	movs r5, #0
	cmp r5, r3
	bhs _08090E0A
	movs r2, #0x9f
	lsls r2, r2, #3
	adds r2, r2, r0
	mov sb, r2
	ldr r2, _08090DD4 @ =0x000004F4
	adds r2, r2, r0
	mov r8, r2
	ldr r7, _08090DD8 @ =gUnknown_080E13AC
	ldr r2, _08090DDC @ =0x000004FC
	adds r6, r0, r2
	adds r0, r7, #4
	mov sl, r0
	mov ip, r1
_08090D96:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r3, r0, #2
	mov r1, sb
	adds r4, r1, r3
	ldr r0, [r4]
	ldr r2, _08090DE0 @ =0x000009FF
	adds r0, r0, r2
	ldr r1, _08090DE4 @ =0x0000B3FE
	cmp r0, r1
	bhi _08090DEC
	mov r0, r8
	adds r1, r0, r3
	adds r0, r3, r7
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r1]
	adds r2, r6, r3
	ldr r1, [r2]
	asrs r1, r1, #3
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	ldr r0, _08090DE8 @ =gUnknown_080E13B4
	adds r1, r3, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	b _08090DFC
	.align 2, 0
_08090DD4: .4byte 0x000004F4
_08090DD8: .4byte gUnknown_080E13AC
_08090DDC: .4byte 0x000004FC
_08090DE0: .4byte 0x000009FF
_08090DE4: .4byte 0x0000B3FE
_08090DE8: .4byte gUnknown_080E13B4
_08090DEC:
	adds r1, r6, r3
	movs r0, #0
	str r0, [r1]
	mov r1, sl
	adds r0, r3, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	str r0, [r4]
_08090DFC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, ip
	ldrb r2, [r2]
	cmp r5, r2
	blo _08090D96
_08090E0A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8090E18
sub_8090E18: @ 0x08090E18
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	movs r1, #0xa
	mov sb, r1
	cmp r0, #0xd
	bne _08090E36
	movs r0, #4
	mov sb, r0
_08090E36:
	movs r6, #0
	cmp r6, sb
	bhs _08090EA2
	movs r1, #0xfc
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r8, r1
_08090E44:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r4, r0, #2
	movs r1, #0xfb
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r5, r0, r4
	ldr r1, [r5]
	ldr r0, _08090EB0 @ =0xFFFFA600
	cmp r1, r0
	bge _08090E8C
	movs r0, #0xe6
	lsls r0, r0, #8
	str r0, [r5]
	bl sub_80854DC
	mov r1, r8
	adds r2, r1, r4
	movs r1, #3
	ands r1, r0
	adds r1, #0xb
	movs r0, #1
	lsls r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2]
	bl sub_80854DC
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r2, r7, r1
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
_08090E8C:
	mov r0, r8
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, sb
	blo _08090E44
_08090EA2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090EB0: .4byte 0xFFFFA600

	thumb_func_start sub_8090EB4
sub_8090EB4: @ 0x08090EB4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r1, _08090F5C @ =gUnknown_080E15A8
	mov sb, r1
	movs r2, #0xe9
	lsls r2, r2, #2
	adds r6, r0, r2
	movs r1, #0xe8
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r8, r1
	subs r2, #0x28
	adds r2, r2, r0
	mov ip, r2
	ldr r1, _08090F60 @ =0x00000474
	adds r7, r0, r1
_08090EDA:
	lsls r0, r5, #3
	adds r3, r6, r0
	ldr r2, [r3]
	movs r1, #0x14
	rsbs r1, r1, #0
	adds r4, r0, #0
	cmp r2, r1
	bge _08090F06
	movs r0, #0xe6
	lsls r0, r0, #8
	str r0, [r3]
	mov r2, r8
	adds r1, r2, r4
	ldr r0, [r1]
	ldr r2, _08090F64 @ =0xFFFFB000
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _08090F06
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [r1]
_08090F06:
	adds r2, r6, r4
	lsls r0, r5, #2
	add r0, sb
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r2]
	subs r3, r1, r0
	str r3, [r2]
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0xe
	bne _08090F2E
	ldr r1, [r7]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	ble _08090F2E
	adds r0, r3, #0
	subs r0, #0x40
	str r0, [r2]
_08090F2E:
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #0xf
	bne _08090F46
	ldr r1, [r7]
	ldr r0, _08090F68 @ =0x00008BFF
	cmp r1, r0
	bgt _08090F46
	adds r1, r6, r4
	ldr r0, [r1]
	adds r0, #0x20
	str r0, [r1]
_08090F46:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08090EDA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090F5C: .4byte gUnknown_080E15A8
_08090F60: .4byte 0x00000474
_08090F64: .4byte 0xFFFFB000
_08090F68: .4byte 0x00008BFF

	thumb_func_start sub_8090F6C
sub_8090F6C: @ 0x08090F6C
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0809102C
	ldr r4, _08090F98 @ =0x0000037D
	adds r2, r3, r4
	ldrb r1, [r2]
	cmp r1, #0
	beq _08090F9C
	adds r4, #1
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08090F9C
	subs r0, r1, #1
	strb r0, [r2]
	b _0809102C
	.align 2, 0
_08090F98: .4byte 0x0000037D
_08090F9C:
	ldr r0, _08090FB8 @ =0x0000037F
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08090FF0
	subs r0, #1
	strb r0, [r2]
	ldr r2, _08090FBC @ =0x0000037E
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #3
	bhi _08090FC4
	ldr r2, _08090FC0 @ =0x040000D4
	b _08090FCC
	.align 2, 0
_08090FB8: .4byte 0x0000037F
_08090FBC: .4byte 0x0000037E
_08090FC0: .4byte 0x040000D4
_08090FC4:
	ldr r2, _08090FE0 @ =0x040000D4
	ldrb r1, [r1]
	movs r0, #6
	subs r0, r0, r1
_08090FCC:
	lsls r0, r0, #5
	ldr r1, _08090FE4 @ =gUnknown_080E15C8
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08090FE8 @ =gUnknown_030020C0
	str r0, [r2, #4]
	ldr r0, _08090FEC @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _08091008
	.align 2, 0
_08090FE0: .4byte 0x040000D4
_08090FE4: .4byte gUnknown_080E15C8
_08090FE8: .4byte gUnknown_030020C0
_08090FEC: .4byte 0x84000008
_08090FF0:
	ldr r4, _08091034 @ =0x0000037E
	adds r1, r3, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08091038 @ =gUnknown_080E154A
	subs r4, #2
	adds r0, r3, r4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
_08091008:
	ldr r0, _08091034 @ =0x0000037E
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #7
	bne _0809102C
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0809103C @ =gUnknown_080E1530
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r4, _08091040 @ =0x0000037D
	adds r0, r3, r4
	strb r1, [r0]
_0809102C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091034: .4byte 0x0000037E
_08091038: .4byte gUnknown_080E154A
_0809103C: .4byte gUnknown_080E1530
_08091040: .4byte 0x0000037D

	thumb_func_start sub_8091044
sub_8091044: @ 0x08091044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r7, #0xa
	cmp r0, #0xd
	bne _08091060
	movs r7, #4
_08091060:
	movs r2, #0xd0
	lsls r2, r2, #2
	adds r4, r6, r2
	movs r5, #0
	movs r0, #0x40
	adds r0, r0, r6
	mov sl, r0
	cmp r5, r7
	bhs _080910B6
	ldr r0, _08091140 @ =gUnknown_080E1348
	ldrh r1, [r0]
	mov sb, r1
	ldrb r0, [r0, #2]
	mov r8, r0
_0809107C:
	mov r2, sb
	strh r2, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	mov r1, r8
	strb r1, [r0]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _0809107C
_080910B6:
	ldr r0, _08091144 @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _08091124
	movs r7, #0
	movs r5, #0
_080910C4:
	movs r1, #3
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r4, r6, r0
	ldr r0, _08091148 @ =gUnknown_080E12FC
	adds r1, #3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	cmp r5, #4
	bls _080910F0
	movs r7, #1
_080910F0:
	lsls r2, r5, #3
	movs r1, #0xe8
	lsls r1, r1, #2
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r1, [r0]
	asrs r1, r1, #8
	movs r0, #0x64
	muls r0, r7, r0
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	movs r1, #0xe9
	lsls r1, r1, #2
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _080910C4
_08091124:
	mov r4, sl
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0xd
	bne _0809114C
	ldr r1, _08091148 @ =gUnknown_080E12FC
	ldrh r0, [r1, #0xc]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0xe]
	b _08091176
	.align 2, 0
_08091140: .4byte gUnknown_080E1348
_08091144: .4byte gBgScrollRegs
_08091148: .4byte gUnknown_080E12FC
_0809114C:
	subs r0, #0xe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08091164
	ldr r1, _08091160 @ =gUnknown_080E12FC
	ldrh r0, [r1, #0x14]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	b _08091176
	.align 2, 0
_08091160: .4byte gUnknown_080E12FC
_08091164:
	cmp r1, #0x10
	bls _0809117C
	ldr r0, _080911E4 @ =gUnknown_080E12FC
	adds r1, r0, #0
	adds r1, #0xac
	ldrh r1, [r1]
	strh r1, [r4, #0xa]
	adds r0, #0xae
	ldrb r1, [r0]
_08091176:
	adds r0, r6, #0
	adds r0, #0x60
	strb r1, [r0]
_0809117C:
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	movs r2, #0xf9
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r0, #0xdf
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0xd
	bhi _0809120C
	adds r4, r6, #0
	adds r4, #0xa0
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r0, r6, r2
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	strh r0, [r4, #0x18]
	ldrb r0, [r1]
	cmp r0, #0xa
	bne _080911E8
	ldr r0, _080911E4 @ =gUnknown_080E12FC
	adds r1, r0, #0
	adds r1, #0x5c
	ldrh r1, [r1]
	strh r1, [r4, #0xa]
	adds r0, #0x5e
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc0
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	b _08091206
	.align 2, 0
_080911E4: .4byte gUnknown_080E12FC
_080911E8:
	cmp r0, #0xd
	bne _08091206
	ldr r0, _08091264 @ =gUnknown_080E12FC
	adds r1, r0, #0
	adds r1, #0x64
	ldrh r1, [r1]
	strh r1, [r4, #0xa]
	adds r0, #0x66
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc0
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
_08091206:
	adds r0, r4, #0
	bl sub_80051E8
_0809120C:
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0809126C
	movs r2, #0xf8
	lsls r2, r2, #1
	adds r4, r6, r2
	movs r5, #0
	cmp r5, r0
	bhs _080912B8
_08091224:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _08091268 @ =0x000004F4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r5, r0
	blo _08091224
	b _080912B8
	.align 2, 0
_08091264: .4byte gUnknown_080E12FC
_08091268: .4byte 0x000004F4
_0809126C:
	movs r5, #0
	ldr r7, _080912FC @ =gUnknown_080E12FC
_08091270:
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r0, r2, #4
	adds r0, #0xd0
	adds r4, r6, r0
	adds r0, r5, #0
	adds r0, #0xd
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r2, #2
	ldr r1, _08091300 @ =0x00000584
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	adds r1, #4
	adds r0, r6, r1
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08091270
_080912B8:
	ldr r0, _08091304 @ =gBgScrollRegs
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x6d
	bgt _08091310
	movs r0, #0x88
	lsls r0, r0, #2
	adds r4, r6, r0
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	ldr r2, _08091308 @ =0x00000464
	adds r0, r6, r2
	ldr r0, [r0]
	adds r0, #0x1e
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	movs r0, #0xe0
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809130C
	subs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80051E8
	b _08091310
	.align 2, 0
_080912FC: .4byte gUnknown_080E12FC
_08091300: .4byte 0x00000584
_08091304: .4byte gBgScrollRegs
_08091308: .4byte 0x00000464
_0809130C:
	movs r0, #2
	strb r0, [r1]
_08091310:
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _080913C8
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0x70
_08091322:
	lsls r1, r5, #2
	adds r1, r1, r5
	lsls r1, r1, #2
	ldr r2, _08091360 @ =0x0000047C
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #0xdf
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _0809136E
	subs r2, #0xf9
	adds r0, r6, r2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #1
	bne _08091368
	ldr r0, [r4, #0x10]
	ldr r1, _08091364 @ =0xFFFFFBFF
	ands r0, r1
	b _08091388
	.align 2, 0
_08091360: .4byte 0x0000047C
_08091364: .4byte 0xFFFFFBFF
_08091368:
	cmp r0, #2
	bne _0809138A
	b _08091380
_0809136E:
	cmp r5, #2
	bhi _08091380
	ldr r0, [r4, #0x10]
	ldr r1, _0809137C @ =0xFFFFFBFF
	ands r0, r1
	b _08091388
	.align 2, 0
_0809137C: .4byte 0xFFFFFBFF
_08091380:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_08091388:
	str r0, [r4, #0x10]
_0809138A:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08091322
	movs r0, #0x94
	lsls r0, r0, #2
	adds r4, r6, r0
	movs r1, #0x8e
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r2, _080913D8 @ =0x00000474
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080913C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080913D8: .4byte 0x00000474

	thumb_func_start sub_80913DC
sub_80913DC: @ 0x080913DC
	push {r4, r5, r6, lr}
	ldr r6, _08091458 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8090E18
	adds r0, r4, #0
	bl sub_8091484
	ldr r0, _0809145C @ =gBgScrollRegs
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	ble _08091406
	adds r0, r4, #0
	bl sub_8090EB4
_08091406:
	adds r0, r4, #0
	bl sub_809066C
	adds r0, r4, #0
	bl sub_8090904
	adds r0, r4, #0
	bl sub_8090800
	ldr r0, _08091460 @ =gUnknown_0300037C
	adds r5, r5, r0
	ldrb r0, [r5]
	cmp r0, #0xe
	bhi _08091434
	adds r0, r4, #0
	bl sub_8090C24
	adds r0, r4, #0
	bl sub_8090CA0
	adds r0, r4, #0
	bl sub_8090D60
_08091434:
	adds r0, r4, #0
	bl sub_8091044
	adds r0, r4, #0
	bl sub_8090F6C
	ldrb r0, [r5]
	cmp r0, #0xd
	beq _08091450
	cmp r0, #0x12
	bne _08091450
	ldr r1, [r6]
	ldr r0, _08091464 @ =sub_8090520
	str r0, [r1, #8]
_08091450:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091458: .4byte gCurTask
_0809145C: .4byte gBgScrollRegs
_08091460: .4byte gUnknown_0300037C
_08091464: .4byte sub_8090520

	thumb_func_start sub_8091468
sub_8091468: @ 0x08091468
	push {lr}
	bl sub_80914B8
	ldr r0, _0809147C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0809147C: .4byte gCurTask

	thumb_func_start sub_8091480
sub_8091480: @ 0x08091480
	bx lr
	.align 2, 0

	thumb_func_start sub_8091484
sub_8091484: @ 0x08091484
	push {lr}
	adds r2, r0, #0
	ldr r3, _080914B0 @ =gBgScrollRegs
	movs r0, #2
	ldrsh r1, [r3, r0]
	ldr r0, _080914B4 @ =0x0000015F
	cmp r1, r0
	bgt _080914A0
	movs r0, #0xe7
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, #0x20
	str r0, [r1]
_080914A0:
	movs r1, #0xe7
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r3, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080914B0: .4byte gBgScrollRegs
_080914B4: .4byte 0x0000015F

	thumb_func_start sub_80914B8
sub_80914B8: @ 0x080914B8
	push {r4, r5, lr}
	sub sp, #4
	movs r2, #0
	ldr r1, _08091560 @ =gDispCnt
	movs r3, #0x8a
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _08091564 @ =gBgCntRegs
	movs r5, #0
	movs r4, #0
	movs r0, #0xb8
	lsls r0, r0, #7
	strh r0, [r1]
	ldr r0, _08091568 @ =gBgScrollRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	ldr r0, _0809156C @ =gUnknown_03004D80
	strb r5, [r0]
	ldr r1, _08091570 @ =gUnknown_03002280
	strb r5, [r1]
	strb r5, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _08091574 @ =sub_8091590
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _08091578 @ =sub_8091680
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	adds r2, r0, #0
	ldrh r3, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	ldr r1, _0809157C @ =gUnknown_0300004C
	adds r2, r3, r1
	movs r1, #0xf0
	strh r1, [r2]
	ldr r1, _08091580 @ =gUnknown_03000040
	adds r2, r3, r1
	movs r1, #1
	strh r1, [r2, #2]
	strh r1, [r2]
	strh r4, [r2, #4]
	movs r1, #0x80
	strh r1, [r2, #6]
	ldr r1, _08091584 @ =0x00003FFF
	strh r1, [r2, #8]
	strh r4, [r2, #0xa]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08091588 @ =0x0600E000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0xd2
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	ldr r1, _0809158C @ =gUnknown_0300002A
	adds r3, r3, r1
	strb r5, [r3]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091560: .4byte gDispCnt
_08091564: .4byte gBgCntRegs
_08091568: .4byte gBgScrollRegs
_0809156C: .4byte gUnknown_03004D80
_08091570: .4byte gUnknown_03002280
_08091574: .4byte sub_8091590
_08091578: .4byte sub_8091680
_0809157C: .4byte gUnknown_0300004C
_08091580: .4byte gUnknown_03000040
_08091584: .4byte 0x00003FFF
_08091588: .4byte 0x0600E000
_0809158C: .4byte gUnknown_0300002A

	thumb_func_start sub_8091590
sub_8091590: @ 0x08091590
	push {r4, r5, lr}
	ldr r5, _080915C0 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _080915C4 @ =gUnknown_03000040
	adds r4, r0, r1
	movs r0, #2
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080915B8
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _080915C8 @ =sub_8091608
	str r0, [r1, #8]
_080915B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080915C0: .4byte gCurTask
_080915C4: .4byte gUnknown_03000040
_080915C8: .4byte sub_8091608

	thumb_func_start sub_80915CC
sub_80915CC: @ 0x080915CC
	push {r4, r5, lr}
	ldr r5, _080915FC @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08091600 @ =gUnknown_03000040
	adds r4, r0, r1
	movs r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080915F4
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _08091604 @ =sub_8091638
	str r0, [r1, #8]
_080915F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080915FC: .4byte gCurTask
_08091600: .4byte gUnknown_03000040
_08091604: .4byte sub_8091638

	thumb_func_start sub_8091608
sub_8091608: @ 0x08091608
	push {lr}
	ldr r0, _08091620 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	ldr r3, _08091624 @ =gUnknown_0300004C
	adds r1, r0, r3
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091628
	subs r0, #1
	strh r0, [r1]
	b _08091630
	.align 2, 0
_08091620: .4byte gCurTask
_08091624: .4byte gUnknown_0300004C
_08091628:
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08091634 @ =sub_80915CC
	str r0, [r2, #8]
_08091630:
	pop {r0}
	bx r0
	.align 2, 0
_08091634: .4byte sub_80915CC

	thumb_func_start sub_8091638
sub_8091638: @ 0x08091638
	push {r4, lr}
	ldr r4, _08091660 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _08091664 @ =gUnknown_0300004C
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091668
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08091678
	movs r0, #0x2c
	bl m4aSongNumStart
	b _08091678
	.align 2, 0
_08091660: .4byte gCurTask
_08091664: .4byte gUnknown_0300004C
_08091668:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
_08091678:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8091680
sub_8091680: @ 0x08091680
	bx lr
	.align 2, 0

	thumb_func_start sub_8091684
sub_8091684: @ 0x08091684
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	movs r7, #0
	movs r5, #0
	ldr r1, _08091A6C @ =0x0000FFFF
	movs r0, #0
	bl sub_8085500
	ldr r1, _08091A70 @ =gDispCnt
	movs r2, #0x9a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08091A74 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08091A78 @ =0x00009C03
	strh r0, [r1]
	ldr r0, _08091A7C @ =0x00009805
	strh r0, [r1, #2]
	ldr r0, _08091A80 @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	ldr r3, _08091A84 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _08091A88 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	strb r4, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	bl m4aMPlayAllStop
	movs r0, #0x2a
	bl m4aSongNumStart
	ldr r0, _08091A8C @ =sub_8092690
	ldr r1, _08091A90 @ =0x0000049C
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _08091A94 @ =sub_8092800
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r3, _08091A98 @ =gUnknown_0300035C
	adds r1, r0, r3
	strb r4, [r1]
	ldr r6, _08091A9C @ =gUnknown_03000494
	adds r1, r0, r6
	str r5, [r1]
	ldr r2, _08091AA0 @ =gUnknown_03000470
	adds r1, r0, r2
	str r5, [r1]
	adds r3, #8
	adds r1, r0, r3
	strb r4, [r1]
	subs r6, #0x20
	adds r1, r0, r6
	str r5, [r1]
	ldr r1, _08091AA4 @ =gUnknown_0300036E
	adds r2, r0, r1
	movs r1, #0xa0
	strh r1, [r2]
	adds r3, #8
	adds r2, r0, r3
	movs r1, #0xc8
	strh r1, [r2]
	ldr r6, _08091AA8 @ =gUnknown_03000363
	adds r1, r0, r6
	strb r4, [r1]
	ldr r2, _08091AAC @ =gUnknown_03000370
	adds r1, r0, r2
	strh r5, [r1]
	adds r3, #8
	adds r1, r0, r3
	str r5, [r1]
	ldr r4, _08091AB0 @ =gUnknown_03000372
	adds r1, r0, r4
	strh r5, [r1]
	subs r6, #6
	adds r4, r0, r6
	movs r1, #0
	ldr r2, _08091AB4 @ =gUnknown_0300047C
	adds r3, r0, r2
	adds r6, #8
	adds r2, r0, r6
_08091754:
	adds r0, r4, r5
	strb r1, [r0]
	lsls r0, r5, #2
	adds r0, r3, r0
	str r1, [r0]
	strb r1, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08091754
	movs r6, #0
	movs r0, #0x80
	adds r0, r0, r7
	mov sl, r0
	adds r1, r7, #0
	adds r1, #0xa0
	str r1, [sp, #0x28]
	adds r2, r7, #0
	adds r2, #0xa1
	str r2, [sp, #0x2c]
	adds r3, r7, #0
	adds r3, #0xa2
	str r3, [sp, #0x34]
	adds r4, r7, #0
	adds r4, #0xa5
	str r4, [sp, #0x40]
	ldr r0, _08091AB8 @ =0x00000131
	adds r0, r7, r0
	str r0, [sp, #4]
	movs r1, #0x99
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #8]
	ldr r2, _08091ABC @ =0x00000135
	adds r2, r7, r2
	str r2, [sp, #0xc]
	ldr r3, _08091AC0 @ =0x00000161
	adds r3, r7, r3
	str r3, [sp, #0x18]
	movs r4, #0xb1
	lsls r4, r4, #1
	adds r4, r7, r4
	str r4, [sp, #0x1c]
	ldr r0, _08091AC4 @ =0x00000165
	adds r0, r7, r0
	str r0, [sp, #0x20]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #0x30]
	ldr r2, _08091AC8 @ =0x000001C1
	adds r2, r7, r2
	str r2, [sp, #0x38]
	movs r3, #0xe1
	lsls r3, r3, #1
	adds r3, r7, r3
	str r3, [sp, #0x3c]
	ldr r4, _08091ACC @ =0x000001C5
	adds r4, r7, r4
	str r4, [sp, #0x44]
	adds r0, r7, #0
	adds r0, #0x2a
	str r0, [sp, #0x10]
	adds r1, r7, #0
	adds r1, #0x40
	str r1, [sp, #0x14]
	adds r2, r7, #0
	adds r2, #0x6a
	str r2, [sp, #0x24]
	movs r3, #0xde
	lsls r3, r3, #2
	adds r3, r3, r7
	mov r8, r3
	mov sb, r6
	movs r0, #0xf2
	lsls r0, r0, #2
	adds r4, r7, r0
_080917F0:
	movs r5, #0
	adds r3, r6, #1
	lsls r2, r6, #2
_080917F6:
	lsls r0, r5, #3
	adds r0, r2, r0
	mov r6, r8
	adds r1, r6, r0
	mov r6, sb
	str r6, [r1]
	adds r0, r4, r0
	str r6, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080917F6
	lsls r0, r3, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080917F0
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0xd2
	str r0, [r1]
	movs r2, #0xf1
	lsls r2, r2, #2
	adds r1, r7, r2
	movs r0, #0xaa
	lsls r0, r0, #7
	str r0, [r1]
	movs r3, #0xea
	lsls r3, r3, #2
	adds r0, r7, r3
	movs r1, #0x78
	str r1, [r0]
	movs r4, #0xed
	lsls r4, r4, #2
	adds r0, r7, r4
	str r1, [r0]
	movs r6, #0xeb
	lsls r6, r6, #2
	adds r0, r7, r6
	movs r1, #0xa0
	lsls r1, r1, #7
	str r1, [r0]
	subs r2, #0xc
	adds r0, r7, r2
	str r1, [r0]
	adds r3, #8
	adds r0, r7, r3
	movs r1, #1
	str r1, [r0]
	adds r4, #8
	adds r0, r7, r4
	str r1, [r0]
	movs r5, #0
	movs r6, #1
_08091864:
	bl sub_80854DC
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r2, r7, r1
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
	movs r2, #0xff
	lsls r2, r2, #2
	adds r0, r7, r2
	adds r0, r0, r4
	movs r3, #0
	str r3, [r0]
	str r3, [sp, #0x48]
	bl sub_80854DC
	movs r1, #0x80
	lsls r1, r1, #3
	adds r2, r7, r1
	adds r2, r2, r4
	adds r1, r6, #0
	ands r1, r0
	adds r1, #0xc
	adds r0, r6, #0
	lsls r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0x48]
	cmp r5, #9
	bls _08091864
	movs r6, #0x93
	lsls r6, r6, #3
	adds r0, r7, r6
	strb r3, [r0]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r0, #2
	strh r0, [r5, #2]
	movs r0, #1
	strh r0, [r5]
	strh r3, [r5, #4]
	movs r1, #0x50
	mov sb, r1
	mov r2, sb
	strh r2, [r5, #6]
	ldr r0, _08091AD0 @ =0x00003FBF
	strh r0, [r5, #8]
	strh r3, [r5, #0xa]
	subs r6, #4
	adds r4, r7, r6
	ldr r0, _08091AD4 @ =0x06010000
	str r0, [r4]
	mov r1, sl
	str r0, [r1, #4]
	ldr r2, _08091AD8 @ =gUnknown_080E1650
	mov r8, r2
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r2, #4]
	mov r6, sl
	strh r0, [r6, #0xa]
	ldrb r0, [r2, #6]
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	movs r0, #0xff
	ldr r2, [sp, #0x2c]
	strb r0, [r2]
	strh r3, [r6, #0x16]
	strh r3, [r6, #0x18]
	strh r3, [r6, #0x1a]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	movs r5, #0x10
	ldr r6, [sp, #0x34]
	strb r5, [r6]
	movs r1, #0
	ldr r0, [sp, #0x40]
	strb r1, [r0]
	mov r2, sl
	str r3, [r2, #0x10]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r2, #0x28]
	mov r0, sl
	str r3, [sp, #0x48]
	bl sub_8004558
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1, #4]
	ldr r0, [r4]
	movs r2, #0xd0
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [r4]
	adds r0, r6, #0
	ldr r2, [sp, #4]
	strb r0, [r2]
	movs r0, #0x78
	mov ip, r0
	mov r2, ip
	strh r2, [r1, #0x16]
	mov r0, sb
	strh r0, [r1, #0x18]
	ldr r3, [sp, #0x48]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r2, [sp, #8]
	strb r5, [r2]
	movs r2, #0
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	str r3, [r1, #0x10]
	str r6, [r1, #0x28]
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1, #4]
	ldr r0, [r4]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [r4]
	adds r0, r6, #0
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	mov r0, ip
	strh r0, [r1, #0x16]
	mov r2, sb
	strh r2, [r1, #0x18]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r0, [sp, #0x1c]
	strb r5, [r0]
	movs r0, #0
	ldr r2, [sp, #0x20]
	strb r0, [r2]
	str r3, [r1, #0x10]
	str r6, [r1, #0x28]
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r1, [r4]
	str r1, [r0, #4]
	ldr r1, [r4]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r4]
	mov r2, r8
	ldrh r1, [r2, #0xc]
	strh r1, [r0, #0xa]
	ldrb r1, [r2, #0xe]
	ldr r2, [sp, #0x30]
	strb r1, [r2]
	adds r1, r6, #0
	ldr r2, [sp, #0x38]
	strb r1, [r2]
	strh r3, [r0, #0x16]
	strh r3, [r0, #0x18]
	movs r1, #0x80
	strh r1, [r0, #0x1a]
	strh r3, [r0, #8]
	strh r3, [r0, #0x14]
	strh r3, [r0, #0x1c]
	ldr r3, [sp, #0x3c]
	strb r5, [r3]
	movs r2, #2
	ldr r1, [sp, #0x44]
	strb r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	str r6, [r0, #0x28]
	bl sub_8004558
	movs r6, #0
	mov r5, r8
	movs r3, #0
_080919F6:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r7, r0
	ldr r0, [r4]
	str r0, [r2, #4]
	adds r0, r6, #3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	movs r0, #0x40
	strh r0, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _080919F6
	movs r6, #0
	ldr r2, _08091ADC @ =0x00000494
	adds r4, r7, r2
	ldr r0, _08091AD8 @ =gUnknown_080E1650
	ldr r0, [r0, #0x10]
	lsls r0, r0, #5
	mov sl, r0
	movs r3, #0
_08091A60:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	movs r1, #0x8c
	lsls r1, r1, #2
	b _08091AE0
	.align 2, 0
_08091A6C: .4byte 0x0000FFFF
_08091A70: .4byte gDispCnt
_08091A74: .4byte gBgCntRegs
_08091A78: .4byte 0x00009C03
_08091A7C: .4byte 0x00009805
_08091A80: .4byte gBgScrollRegs
_08091A84: .4byte gUnknown_03004D80
_08091A88: .4byte gUnknown_03002280
_08091A8C: .4byte sub_8092690
_08091A90: .4byte 0x0000049C
_08091A94: .4byte sub_8092800
_08091A98: .4byte gUnknown_0300035C
_08091A9C: .4byte gUnknown_03000494
_08091AA0: .4byte gUnknown_03000470
_08091AA4: .4byte gUnknown_0300036E
_08091AA8: .4byte gUnknown_03000363
_08091AAC: .4byte gUnknown_03000370
_08091AB0: .4byte gUnknown_03000372
_08091AB4: .4byte gUnknown_0300047C
_08091AB8: .4byte 0x00000131
_08091ABC: .4byte 0x00000135
_08091AC0: .4byte 0x00000161
_08091AC4: .4byte 0x00000165
_08091AC8: .4byte 0x000001C1
_08091ACC: .4byte 0x000001C5
_08091AD0: .4byte 0x00003FBF
_08091AD4: .4byte 0x06010000
_08091AD8: .4byte gUnknown_080E1650
_08091ADC: .4byte 0x00000494
_08091AE0:
	adds r0, r0, r1
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1, #4]
	ldr r0, [r4]
	add r0, sl
	str r0, [r4]
	adds r2, r1, #0
	adds r2, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, r0
	movs r0, #0xff
	strb r0, [r2]
	strh r3, [r1, #0x16]
	strh r3, [r1, #0x18]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	adds r0, r1, #0
	adds r0, #0x22
	movs r2, #0x10
	mov sb, r2
	mov r2, sb
	strb r2, [r0]
	adds r0, #3
	movs r2, #2
	mov r8, r2
	mov r2, r8
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	movs r5, #1
	rsbs r5, r5, #0
	str r5, [r1, #0x28]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08091A60
	ldr r3, _08091C8C @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bne _08091BA4
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r6, _08091C90 @ =0x00000494
	adds r3, r7, r6
	ldr r1, [r3]
	str r1, [r0, #4]
	ldr r4, _08091C94 @ =gUnknown_080E1650
	adds r1, r4, #0
	adds r1, #0xd8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r3]
	adds r1, r1, r2
	str r1, [r3]
	adds r1, r4, #0
	adds r1, #0xdc
	ldrh r1, [r1]
	movs r2, #0
	strh r1, [r0, #0xa]
	adds r1, r4, #0
	adds r1, #0xde
	ldrb r3, [r1]
	movs r4, #0xc8
	lsls r4, r4, #1
	adds r1, r7, r4
	strb r3, [r1]
	ldr r6, _08091C98 @ =0x00000191
	adds r3, r7, r6
	ldrb r1, [r3]
	mov r4, ip
	orrs r1, r4
	strb r1, [r3]
	strh r2, [r0, #0x16]
	strh r2, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	adds r6, #1
	adds r1, r7, r6
	mov r3, sb
	strb r3, [r1]
	ldr r4, _08091C9C @ =0x00000195
	adds r1, r7, r4
	mov r6, r8
	strb r6, [r1]
	str r2, [r0, #0x10]
	str r5, [r0, #0x28]
	bl sub_8004558
_08091BA4:
	movs r6, #0
	ldr r0, _08091C90 @ =0x00000494
	adds r5, r7, r0
	movs r1, #0
	mov r8, r1
	movs r4, #0
_08091BB0:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, #0xb0
	adds r2, r7, r0
	ldr r0, [r5]
	str r0, [r2, #4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, _08091C94 @ =gUnknown_080E1650
	adds r0, r6, #5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	mov r3, r8
	strb r3, [r0]
	str r4, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _08091BB0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r7, #4]
	movs r4, #0
	mov r8, r4
	movs r4, #0
	strh r4, [r7, #0xa]
	ldr r0, _08091CA0 @ =0x0600E000
	str r0, [r7, #0xc]
	strh r4, [r7, #0x18]
	strh r4, [r7, #0x1a]
	ldr r6, _08091CA4 @ =gUnknown_080E1648
	ldrh r0, [r6, #2]
	strh r0, [r7, #0x1c]
	strh r4, [r7, #0x1e]
	strh r4, [r7, #0x20]
	strh r4, [r7, #0x22]
	strh r4, [r7, #0x24]
	movs r5, #0x20
	strh r5, [r7, #0x26]
	strh r5, [r7, #0x28]
	mov r1, r8
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	strh r4, [r7, #0x2e]
	adds r0, r7, #0
	bl sub_8002A3C
	ldr r0, _08091CA8 @ =0x06004000
	ldr r2, [sp, #0x14]
	str r0, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _08091CAC @ =0x0600C000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	ldrh r0, [r6]
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	strh r5, [r2, #0x26]
	strh r5, [r2, #0x28]
	mov r4, r8
	ldr r3, [sp, #0x24]
	strb r4, [r3]
	movs r0, #1
	strh r0, [r2, #0x2e]
	ldr r0, [sp, #0x14]
	bl sub_8002A3C
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091C8C: .4byte gUnknown_030054F0
_08091C90: .4byte 0x00000494
_08091C94: .4byte gUnknown_080E1650
_08091C98: .4byte 0x00000191
_08091C9C: .4byte 0x00000195
_08091CA0: .4byte 0x0600E000
_08091CA4: .4byte gUnknown_080E1648
_08091CA8: .4byte 0x06004000
_08091CAC: .4byte 0x0600C000

	thumb_func_start sub_8091CB0
sub_8091CB0: @ 0x08091CB0
	push {r4, r5, lr}
	ldr r0, _08091CF8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	ldr r0, _08091CFC @ =gUnknown_0300036E
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091D00
	subs r0, #1
	strh r0, [r1]
	b _08091E50
	.align 2, 0
_08091CF8: .4byte gCurTask
_08091CFC: .4byte gUnknown_0300036E
_08091D00:
	ldr r3, _08091D5C @ =gUnknown_0300035C
	adds r5, r5, r3
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08091D74
	cmp r1, #9
	bhi _08091DE0
	ldr r2, _08091D60 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091D64 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r2, _08091D68 @ =gBldRegs
	ldr r0, _08091D6C @ =0x00003FBF
	strh r0, [r2]
	ldr r1, _08091D70 @ =gUnknown_080E1738
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _08091D58
	b _08091E50
_08091D58:
	b _08091E2E
	.align 2, 0
_08091D5C: .4byte gUnknown_0300035C
_08091D60: .4byte gDispCnt
_08091D64: .4byte gWinRegs
_08091D68: .4byte gBldRegs
_08091D6C: .4byte 0x00003FBF
_08091D70: .4byte gUnknown_080E1738
_08091D74:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08091DE0
	ldr r2, _08091DCC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091DD0 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r3, _08091DD4 @ =gBldRegs
	ldr r0, _08091DD8 @ =0x00003FBF
	strh r0, [r3]
	ldr r2, _08091DDC @ =gUnknown_080E1738
	ldrb r0, [r5]
	adds r0, r0, r2
	ldrb r1, [r0]
	ldrh r0, [r3, #4]
	subs r0, r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r5]
	adds r2, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2]
	cmp r0, r2
	bhi _08091E50
	adds r0, r1, #1
	strb r0, [r5]
	b _08091E50
	.align 2, 0
_08091DCC: .4byte gDispCnt
_08091DD0: .4byte gWinRegs
_08091DD4: .4byte gBldRegs
_08091DD8: .4byte 0x00003FBF
_08091DDC: .4byte gUnknown_080E1738
_08091DE0:
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, #0xa
	bne _08091E48
	adds r0, r4, #0
	bl sub_80928C8
	ldr r2, _08091E38 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091E3C @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _08091E40 @ =gBldRegs
	ldr r0, _08091E44 @ =0x00003FBF
	strh r0, [r1]
	ldrh r0, [r1, #4]
	subs r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08091E50
_08091E2E:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08091E50
	.align 2, 0
_08091E38: .4byte gDispCnt
_08091E3C: .4byte gWinRegs
_08091E40: .4byte gBldRegs
_08091E44: .4byte 0x00003FBF
_08091E48:
	ldr r0, _08091E58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08091E5C @ =sub_8091E60
	str r0, [r1, #8]
_08091E50:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091E58: .4byte gCurTask
_08091E5C: .4byte sub_8091E60

	thumb_func_start sub_8091E60
sub_8091E60: @ 0x08091E60
	push {r4, r5, r6, lr}
	ldr r6, _08091ED0 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, _08091ED4 @ =gUnknown_03000350
	adds r1, r5, r0
	movs r0, #0x50
	strh r0, [r1, #6]
	movs r0, #1
	strh r0, [r1, #2]
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	adds r0, r4, #0
	bl sub_809289C
	ldr r4, _08091ED8 @ =gUnknown_0300036C
	adds r1, r5, r4
	ldrh r0, [r1]
	cmp r0, #0
	beq _08091EEC
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x27
	bls _08091F5E
	ldr r0, _08091EDC @ =gUnknown_0300036E
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _08091EE0
	subs r0, #1
	strh r0, [r4]
	b _08091F5E
	.align 2, 0
_08091ED0: .4byte gCurTask
_08091ED4: .4byte gUnknown_03000350
_08091ED8: .4byte gUnknown_0300036C
_08091EDC: .4byte gUnknown_0300036E
_08091EE0:
	bl sub_80854DC
	movs r1, #0xf
	ands r1, r0
	strh r1, [r4]
	b _08091F5E
_08091EEC:
	ldr r3, _08091F30 @ =gBldRegs
	ldrh r0, [r3, #4]
	cmp r0, #0xf
	bhi _08091F44
	ldr r2, _08091F34 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _08091F38 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r2]
	movs r0, #0xf0
	strh r0, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0x3f
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0xa]
	ldr r0, _08091F3C @ =0x00003FBF
	strh r0, [r3]
	ldr r0, _08091F40 @ =gUnknown_03000374
	adds r1, r5, r0
	ldr r0, [r1]
	adds r0, #0x20
	str r0, [r1]
	asrs r0, r0, #8
	strh r0, [r3, #4]
	b _08091F5E
	.align 2, 0
_08091F30: .4byte gBldRegs
_08091F34: .4byte gDispCnt
_08091F38: .4byte gWinRegs
_08091F3C: .4byte 0x00003FBF
_08091F40: .4byte gUnknown_03000374
_08091F44:
	ldr r4, _08091F54 @ =gUnknown_0300036E
	adds r1, r5, r4
	ldrh r0, [r1]
	cmp r0, #0x63
	bhi _08091F58
	adds r0, #1
	strh r0, [r1]
	b _08091F5E
	.align 2, 0
_08091F54: .4byte gUnknown_0300036E
_08091F58:
	ldr r1, [r6]
	ldr r0, _08091F64 @ =sub_80927E8
	str r0, [r1, #8]
_08091F5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091F64: .4byte sub_80927E8

	thumb_func_start sub_8091F68
sub_8091F68: @ 0x08091F68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #1
	ldr r0, _08091F80 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0x37
	bgt _08091F88
	ldr r6, _08091F84 @ =0x00000474
	adds r2, r4, r6
	b _08091F90
	.align 2, 0
_08091F80: .4byte gBgScrollRegs
_08091F84: .4byte 0x00000474
_08091F88:
	cmp r1, #0x5f
	bgt _08091FAA
	ldr r0, _08092024 @ =0x00000474
	adds r2, r4, r0
_08091F90:
	ldr r1, _08092028 @ =gUnknown_080E1752
	movs r6, #0xd9
	lsls r6, r6, #2
	adds r0, r4, r6
	ldrb r0, [r0]
	adds r0, r0, r1
	adds r1, r5, #0
	ldrb r0, [r0]
	lsls r1, r0
	lsls r1, r1, #1
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08091FAA:
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0x87
	bgt _08092008
	movs r2, #0xd7
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08092014
	ldr r6, _08092024 @ =0x00000474
	adds r0, r4, r6
	ldr r2, [r0]
	cmp r2, #0
	ble _08091FE8
	ldrh r1, [r3, #6]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08091FE8
	asrs r1, r2, #8
	movs r2, #6
	ldrsh r0, [r3, r2]
	cmp r1, r0
	ble _08091FE8
	movs r3, #0xd9
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08091FE8:
	movs r6, #0x8e
	lsls r6, r6, #3
	adds r2, r4, r6
	ldr r1, _0809202C @ =gUnknown_080E1742
	movs r3, #0xd9
	lsls r3, r3, #2
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #1
	ldrb r0, [r0]
	lsls r1, r0
	lsls r1, r5
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08092008:
	movs r6, #0xd7
	lsls r6, r6, #2
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #9
	bls _08092034
_08092014:
	ldr r0, _08092030 @ =gBgScrollRegs
	ldrh r1, [r0, #6]
	strh r1, [r0, #2]
	movs r1, #0
	movs r2, #2
	bl sub_808E8F8
	b _08092042
	.align 2, 0
_08092024: .4byte 0x00000474
_08092028: .4byte gUnknown_080E1752
_0809202C: .4byte gUnknown_080E1742
_08092030: .4byte gBgScrollRegs
_08092034:
	ldr r1, _08092054 @ =gBgScrollRegs
	movs r2, #0x8e
	lsls r2, r2, #3
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #2]
_08092042:
	ldr r1, _08092054 @ =gBgScrollRegs
	ldr r3, _08092058 @ =0x00000474
	adds r0, r4, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092054: .4byte gBgScrollRegs
_08092058: .4byte 0x00000474

	thumb_func_start sub_809205C
sub_809205C: @ 0x0809205C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r6, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r0, r0, r7
	mov r8, r0
	movs r1, #1
	mov sb, r1
_08092074:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r4, r0, #2
	movs r1, #0xff
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r5, r0, r4
	ldr r1, [r5]
	ldr r0, _080920E0 @ =0xFFFFA600
	cmp r1, r0
	bge _080920BC
	movs r0, #0xe6
	lsls r0, r0, #8
	str r0, [r5]
	bl sub_80854DC
	mov r1, r8
	adds r2, r1, r4
	mov r1, sb
	ands r1, r0
	adds r1, #0xc
	mov r0, sb
	lsls r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2]
	bl sub_80854DC
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r2, r7, r1
	adds r2, r2, r4
	movs r1, #0xff
	ands r1, r0
	str r1, [r2]
_080920BC:
	mov r0, r8
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #9
	bls _08092074
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920E0: .4byte 0xFFFFA600

	thumb_func_start sub_80920E4
sub_80920E4: @ 0x080920E4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0xd7
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #9
	bls _08092130
	movs r2, #0xdb
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0x28
	bhi _0809215C
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r0, [r1]
	movs r1, #0x28
	subs r1, r1, r0
	lsls r1, r1, #3
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xea
	lsls r1, r1, #2
	adds r4, r5, r1
	adds r0, r4, #0
	movs r1, #0x52
	movs r2, #2
	bl sub_808E8F8
	movs r2, #0xed
	lsls r2, r2, #2
	adds r1, r5, r2
	ldr r0, [r4]
	str r0, [r1]
	b _080921CC
_08092130:
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r2, r5, r0
	ldr r1, [r2]
	ldr r0, _08092158 @ =0x00004FFF
	cmp r1, r0
	bgt _08092144
	adds r0, r1, #0
	adds r0, #0x40
	str r0, [r2]
_08092144:
	movs r1, #0xea
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x52
	str r1, [r0]
	movs r2, #0xed
	lsls r2, r2, #2
	adds r0, r5, r2
	str r1, [r0]
	b _08092176
	.align 2, 0
_08092158: .4byte 0x00004FFF
_0809215C:
	movs r0, #0xea
	lsls r0, r0, #2
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #0x52
	movs r2, #2
	bl sub_808E8F8
	movs r2, #0xed
	lsls r2, r2, #2
	adds r1, r5, r2
	ldr r0, [r4]
	str r0, [r1]
_08092176:
	movs r1, #0xeb
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [r0]
	ldr r0, _080921E4 @ =0x00004FFF
	cmp r1, r0
	ble _080921CC
	movs r0, #0x93
	lsls r0, r0, #3
	adds r2, r5, r0
	ldrb r0, [r2]
	cmp r0, #3
	beq _08092194
	cmp r0, #0
	bne _080921AA
_08092194:
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [r0]
	rsbs r1, r1, #0
	str r1, [r0]
	ldrb r0, [r2]
	cmp r0, #3
	bne _080921AA
	movs r0, #0
	strb r0, [r2]
_080921AA:
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r2, r5, r0
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r5, r1
	ldr r1, [r0]
	lsls r1, r1, #7
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r2, #0x93
	lsls r2, r2, #3
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080921CC:
	movs r1, #0xee
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r2, #0xeb
	lsls r2, r2, #2
	adds r1, r5, r2
	ldr r1, [r1]
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921E4: .4byte 0x00004FFF

	thumb_func_start sub_80921E8
sub_80921E8: @ 0x080921E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0xf1
	lsls r1, r1, #2
	adds r1, r1, r7
	mov sl, r1
	movs r2, #0xdf
	lsls r2, r2, #2
	adds r2, r2, r7
	mov sb, r2
_08092208:
	mov r3, sl
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r2, _08092270 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	cmp r0, #0xe3
	bgt _08092312
	ldr r1, _08092274 @ =0x0000035D
	adds r0, r7, r1
	mov r2, r8
	adds r6, r0, r2
	ldrb r0, [r6]
	cmp r0, #0
	beq _08092290
	lsls r4, r2, #3
	mov r3, sb
	adds r2, r3, r4
	mov r0, r8
	lsls r3, r0, #2
	ldr r1, _08092278 @ =0x0000047C
	adds r0, r7, r1
	adds r5, r0, r3
	ldr r0, [r2]
	ldr r1, [r5]
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, [r5]
	adds r0, #4
	str r0, [r5]
	ldrb r0, [r6]
	cmp r0, #1
	bne _08092250
	movs r0, #0
	str r0, [r5]
_08092250:
	ldrb r0, [r6]
	subs r1, r0, #1
	movs r2, #0
	strb r1, [r6]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe
	bhi _08092280
	ldr r2, _0809227C @ =0x00000365
	adds r0, r7, r2
	add r0, r8
	movs r1, #1
	strb r1, [r0]
	b _08092374
	.align 2, 0
_08092270: .4byte gBgScrollRegs
_08092274: .4byte 0x0000035D
_08092278: .4byte 0x0000047C
_0809227C: .4byte 0x00000365
_08092280:
	ldr r1, _0809228C @ =0x00000365
	adds r0, r7, r1
	add r0, r8
	strb r2, [r0]
	b _08092374
	.align 2, 0
_0809228C: .4byte 0x00000365
_08092290:
	bl sub_80854DC
	movs r1, #0x3f
	ands r1, r0
	adds r1, #0x3c
	strb r1, [r6]
	bl sub_80854DC
	mov r3, r8
	lsls r2, r3, #3
	movs r3, #0xde
	lsls r3, r3, #2
	adds r1, r7, r3
	adds r5, r1, r2
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r3, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	subs r0, #0xa
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r5]
	ldr r0, [r3]
	subs r0, #0xf
	adds r4, r2, #0
	cmp r1, r0
	bge _080922CA
	str r0, [r5]
_080922CA:
	ldr r0, [r3]
	subs r1, r0, #5
	ldr r0, [r5]
	cmp r0, r1
	bge _080922D6
	str r1, [r5]
_080922D6:
	ldr r2, _080922F8 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0x5f
	bgt _080922FC
	bl sub_80854DC
	mov r1, sb
	adds r2, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	mov r3, sl
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r2]
	b _08092370
	.align 2, 0
_080922F8: .4byte gBgScrollRegs
_080922FC:
	bl sub_80854DC
	mov r1, sb
	adds r2, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	mov r3, sl
	ldr r1, [r3]
	adds r1, r1, r0
	str r1, [r2]
	b _08092370
_08092312:
	ldr r1, _08092348 @ =0x00000365
	adds r0, r7, r1
	mov r3, r8
	adds r2, r0, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809232E
	subs r1, #8
	adds r0, r7, r1
	add r0, r8
	movs r1, #0xf
	strb r1, [r0]
	movs r0, #1
	strb r0, [r2]
_0809232E:
	ldr r2, _0809234C @ =0x0000035D
	adds r0, r7, r2
	mov r3, r8
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _08092350
	subs r0, #1
	strb r0, [r1]
	lsls r4, r3, #3
	lsls r3, r3, #2
	b _08092374
	.align 2, 0
_08092348: .4byte 0x00000365
_0809234C: .4byte 0x0000035D
_08092350:
	mov r0, r8
	lsls r2, r0, #3
	movs r3, #0xde
	lsls r3, r3, #2
	adds r1, r7, r3
	adds r1, r1, r2
	adds r3, #0x48
	adds r0, r7, r3
	ldr r0, [r0]
	str r0, [r1]
	mov r0, sb
	adds r1, r0, r2
	mov r3, sl
	ldr r0, [r3]
	str r0, [r1]
	adds r4, r2, #0
_08092370:
	mov r0, r8
	lsls r3, r0, #2
_08092374:
	movs r1, #0xde
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r7, r0
	ldr r1, _080923A8 @ =gUnknown_080E1782
	adds r1, r3, r1
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r2, #2
	bl sub_808E8F8
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #5
	bhi _0809239A
	b _08092208
_0809239A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080923A8: .4byte gUnknown_080E1782

	thumb_func_start sub_80923AC
sub_80923AC: @ 0x080923AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r4, r6, #0
	adds r4, #0x80
	movs r5, #0
	ldr r7, _0809267C @ =gUnknown_080E1650
	ldrb r1, [r7, #6]
	mov r8, r1
_080923CA:
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	mov r2, r8
	strb r2, [r0]
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	movs r2, #0xfe
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bls _080923CA
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r5, r6, r0
	ldrb r0, [r5]
	cmp r0, #8
	bls _0809241A
	movs r1, #1
	str r1, [sp]
_0809241A:
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r7, _0809267C @ =gUnknown_080E1650
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	adds r2, #0x20
	adds r0, r6, r2
	strb r1, [r0]
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	movs r2, #0xf1
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldrb r0, [r5]
	movs r1, #0x98
	lsls r1, r1, #1
	adds r1, r6, r1
	str r1, [sp, #8]
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r2, r6, r2
	str r2, [sp, #4]
	cmp r0, #9
	bhi _0809253C
	movs r5, #0
	mov r8, r7
_08092472:
	movs r1, #0xf1
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, _08092680 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r0, r2]
	adds r1, r1, r0
	cmp r1, #0xe3
	bgt _080924D2
	movs r1, #1
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r4, r6, r0
	adds r1, #3
	lsls r1, r1, #3
	add r1, r8
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r1, r5, #3
	movs r2, #0xde
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080924D2:
	ldr r1, _08092684 @ =0x00000365
	adds r0, r6, r1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08092532
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r4, r6, r0
	mov r1, r8
	ldrh r0, [r1, #0x14]
	movs r7, #0
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r1, r5, #3
	movs r2, #0xf2
	lsls r2, r2, #2
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	adds r2, #4
	adds r0, r6, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #1
	beq _0809252C
	strh r7, [r4, #0x14]
	strh r7, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _08092688 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_0809252C:
	adds r0, r4, #0
	bl sub_80051E8
_08092532:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08092472
_0809253C:
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _0809254E
	movs r1, #1
	str r1, [sp]
_0809254E:
	movs r2, #0x88
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r0, _0809267C @ =gUnknown_080E1650
	mov sl, r0
	ldr r1, _0809268C @ =gUnknown_030054F0
	mov r8, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r1, #7
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #8]
	strb r0, [r1]
	movs r2, #0xea
	lsls r2, r2, #2
	adds r0, r6, r2
	ldr r0, [r0]
	strh r0, [r4, #0x16]
	movs r1, #0xeb
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	mov r2, sb
	ldrb r0, [r2]
	cmp r0, #0xa
	bls _080925B2
	movs r0, #1
	str r0, [sp]
_080925B2:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r4, r6, r1
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r1, #0x11
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrb r0, [r0, #6]
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r2, #0xed
	lsls r2, r2, #2
	adds r7, r6, r2
	ldr r0, [r7]
	strh r0, [r4, #0x16]
	movs r0, #0xee
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0809263C
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r4, r6, r2
	ldr r0, [sp]
	adds r0, #0x1b
	lsls r0, r0, #3
	add r0, sl
	ldrh r1, [r0, #4]
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	adds r2, #0x20
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, [r7]
	strh r0, [r4, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0809263C:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0xa
	bls _0809266A
	movs r5, #0
_08092646:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0xb0
	adds r0, r6, r0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08092646
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r1, r6, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0809266A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809267C: .4byte gUnknown_080E1650
_08092680: .4byte gBgScrollRegs
_08092684: .4byte 0x00000365
_08092688: .4byte 0xFFFFBFFF
_0809268C: .4byte gUnknown_030054F0

	thumb_func_start sub_8092690
sub_8092690: @ 0x08092690
	push {r4, r5, r6, r7, lr}
	ldr r7, _080926F4 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	ldr r0, _080926F8 @ =gUnknown_03000350
	adds r5, r6, r0
	movs r0, #2
	strh r0, [r5, #2]
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809270A
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, _080926FC @ =gUnknown_0300035C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08092704
	ldr r1, [r7]
	ldr r0, _08092700 @ =sub_8092780
	b _08092708
	.align 2, 0
_080926F4: .4byte gCurTask
_080926F8: .4byte gUnknown_03000350
_080926FC: .4byte gUnknown_0300035C
_08092700: .4byte sub_8092780
_08092704:
	ldr r1, [r7]
	ldr r0, _08092710 @ =sub_8091CB0
_08092708:
	str r0, [r1, #8]
_0809270A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092710: .4byte sub_8091CB0

	thumb_func_start sub_8092714
sub_8092714: @ 0x08092714
	push {r4, r5, r6, lr}
	ldr r6, _08092774 @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08092778 @ =gUnknown_03000350
	adds r5, r0, r1
	movs r0, #1
	strh r0, [r5, #2]
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809276C
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _0809277C @ =sub_8091CB0
	str r0, [r1, #8]
_0809276C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092774: .4byte gCurTask
_08092778: .4byte gUnknown_03000350
_0809277C: .4byte sub_8091CB0

	thumb_func_start sub_8092780
sub_8092780: @ 0x08092780
	push {r4, r5, r6, lr}
	ldr r6, _080927D8 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	adds r0, r4, #0
	bl sub_8091F68
	adds r0, r4, #0
	bl sub_809205C
	adds r0, r4, #0
	bl sub_80920E4
	adds r0, r4, #0
	bl sub_8092804
	adds r0, r4, #0
	bl sub_80921E8
	adds r0, r4, #0
	bl sub_8092850
	adds r0, r4, #0
	bl sub_80923AC
	ldr r0, _080927DC @ =gUnknown_030003C4
	adds r5, r5, r0
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, _080927E0 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	cmp r0, #0xdb
	ble _080927D2
	ldr r1, [r6]
	ldr r0, _080927E4 @ =sub_8091CB0
	str r0, [r1, #8]
_080927D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080927D8: .4byte gCurTask
_080927DC: .4byte gUnknown_030003C4
_080927E0: .4byte gBgScrollRegs
_080927E4: .4byte sub_8091CB0

	thumb_func_start sub_80927E8
sub_80927E8: @ 0x080927E8
	push {r4, lr}
	ldr r4, _080927FC @ =gCurTask
	bl sub_80928F8
	ldr r0, [r4]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080927FC: .4byte gCurTask

	thumb_func_start sub_8092800
sub_8092800: @ 0x08092800
	bx lr
	.align 2, 0

	thumb_func_start sub_8092804
sub_8092804: @ 0x08092804
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r2, #0xd7
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08092844
	movs r5, #0xf0
	lsls r5, r5, #2
	adds r4, r1, r5
	movs r0, #0xd2
	str r0, [r4]
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r3, r1, r0
	ldr r2, [r3]
	asrs r0, r2, #8
	ldr r1, _0809284C @ =gBgScrollRegs
	movs r5, #6
	ldrsh r1, [r1, r5]
	adds r0, r0, r1
	cmp r0, #0xe6
	bgt _0809283A
	adds r0, r2, #0
	adds r0, #0x20
	str r0, [r3]
_0809283A:
	adds r0, r4, #0
	movs r1, #0xd2
	movs r2, #1
	bl sub_808E8F8
_08092844:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809284C: .4byte gBgScrollRegs

	thumb_func_start sub_8092850
sub_8092850: @ 0x08092850
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r1, _08092898 @ =0x00000365
	adds r1, r1, r0
	mov ip, r1
	movs r1, #0xf2
	lsls r1, r1, #2
	adds r7, r0, r1
	subs r1, #0x50
	adds r6, r0, r1
	adds r1, #0x54
	adds r5, r0, r1
	subs r1, #0x50
	adds r4, r0, r1
_0809286C:
	mov r1, ip
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08092888
	lsls r1, r3, #3
	adds r2, r7, r1
	adds r0, r6, r1
	ldr r0, [r0]
	str r0, [r2]
	adds r2, r5, r1
	adds r1, r4, r1
	ldr r0, [r1]
	str r0, [r2]
_08092888:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _0809286C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092898: .4byte 0x00000365

	thumb_func_start sub_809289C
sub_809289C: @ 0x0809289C
	push {lr}
	ldr r0, _080928B8 @ =0x05000300
	ldr r1, _080928BC @ =0x05000100
	movs r2, #1
	bl CpuFastSet
	ldr r0, _080928C0 @ =0x05000320
	ldr r1, _080928C4 @ =0x05000120
	movs r2, #1
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080928B8: .4byte 0x05000300
_080928BC: .4byte 0x05000100
_080928C0: .4byte 0x05000320
_080928C4: .4byte 0x05000120

	thumb_func_start sub_80928C8
sub_80928C8: @ 0x080928C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080928F4 @ =gUnknown_080E1648
	ldrh r0, [r5, #6]
	movs r1, #0
	strh r0, [r4, #0x1c]
	strh r1, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	adds r4, #0x40
	ldrh r0, [r5, #4]
	strh r0, [r4, #0x1c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080928F4: .4byte gUnknown_080E1648

	thumb_func_start sub_80928F8
sub_80928F8: @ 0x080928F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc4
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x24]
	ldr r1, _08092990 @ =gDispCnt
	movs r2, #0x9a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08092994 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08092998 @ =0x00009C03
	strh r0, [r1]
	ldr r0, _0809299C @ =0x00001806
	strh r0, [r1, #2]
	ldr r0, _080929A0 @ =gBgScrollRegs
	mov r3, sl
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	ldr r3, _080929A4 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _080929A8 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	strb r4, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	ldr r0, _080929AC @ =sub_8093EDC
	ldr r1, _080929B0 @ =0x0000061C
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _080929B4 @ =sub_8093F9C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r0, _080929B8 @ =gUnknown_03005B64
	ldr r0, [r0]
	ldr r1, _080929BC @ =gUnknown_030054F0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080929C4
	movs r0, #2
	str r0, [sp, #0x24]
	ldr r1, _080929C0 @ =gUnknown_0300033C
	adds r0, r2, r1
	strb r4, [r0]
	b _080929CC
	.align 2, 0
_08092990: .4byte gDispCnt
_08092994: .4byte gBgCntRegs
_08092998: .4byte 0x00009C03
_0809299C: .4byte 0x00001806
_080929A0: .4byte gBgScrollRegs
_080929A4: .4byte gUnknown_03004D80
_080929A8: .4byte gUnknown_03002280
_080929AC: .4byte sub_8093EDC
_080929B0: .4byte 0x0000061C
_080929B4: .4byte sub_8093F9C
_080929B8: .4byte gUnknown_03005B64
_080929BC: .4byte gUnknown_030054F0
_080929C0: .4byte gUnknown_0300033C
_080929C4:
	ldr r3, _08092A38 @ =gUnknown_0300033C
	adds r1, r2, r3
	movs r0, #0xa
	strb r0, [r1]
_080929CC:
	movs r0, #0xce
	lsls r0, r0, #2
	add r0, sl
	movs r2, #0
	strb r2, [r0]
	ldr r1, _08092A3C @ =0x00000339
	add r1, sl
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08092A40 @ =0x0000033A
	add r0, sl
	strb r2, [r0]
	ldr r0, _08092A44 @ =0x00000342
	add r0, sl
	movs r3, #0
	strh r2, [r0]
	ldr r0, _08092A48 @ =0x00000346
	add r0, sl
	strh r2, [r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	add r0, sl
	strh r2, [r0]
	movs r1, #0xd0
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r1, _08092A4C @ =0x0000034A
	add r1, sl
	movs r0, #0x32
	strh r0, [r1]
	movs r1, #0xd1
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08092A50 @ =0x0000033D
	add r0, sl
	strb r3, [r0]
	ldr r0, _08092A54 @ =0x0000033E
	add r0, sl
	strb r3, [r0]
	ldr r0, _08092A58 @ =gUnknown_030054F0
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #1
	bne _08092A60
	ldr r0, _08092A5C @ =0x0000033B
	add r0, sl
	strb r1, [r0]
	b _08092A66
	.align 2, 0
_08092A38: .4byte gUnknown_0300033C
_08092A3C: .4byte 0x00000339
_08092A40: .4byte 0x0000033A
_08092A44: .4byte 0x00000342
_08092A48: .4byte 0x00000346
_08092A4C: .4byte 0x0000034A
_08092A50: .4byte 0x0000033D
_08092A54: .4byte 0x0000033E
_08092A58: .4byte gUnknown_030054F0
_08092A5C: .4byte 0x0000033B
_08092A60:
	ldr r0, _08092E2C @ =0x0000033B
	add r0, sl
	strb r3, [r0]
_08092A66:
	movs r5, #0
	mov r0, sl
	adds r0, #0x80
	str r0, [sp, #0x84]
	mov r1, sl
	adds r1, #0xa0
	str r1, [sp, #0x88]
	mov r2, sl
	adds r2, #0xa1
	str r2, [sp, #0x8c]
	mov r3, sl
	adds r3, #0xa2
	str r3, [sp, #0x90]
	adds r0, #0x25
	str r0, [sp, #0x94]
	adds r1, #0x10
	str r1, [sp, #0xa8]
	adds r2, #0x2f
	str r2, [sp, #0xac]
	adds r3, #0x2f
	str r3, [sp, #0xb0]
	adds r0, #0x2d
	str r0, [sp, #0xb4]
	adds r1, #0x25
	str r1, [sp, #0xb8]
	movs r2, #0xe0
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x48]
	ldr r3, _08092E30 @ =0x000001C1
	add r3, sl
	str r3, [sp, #0x4c]
	movs r0, #0xe1
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x50]
	ldr r1, _08092E34 @ =0x000001C5
	add r1, sl
	str r1, [sp, #0x54]
	movs r2, #0xf8
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x60]
	ldr r3, _08092E38 @ =0x000001F1
	add r3, sl
	str r3, [sp, #0x64]
	movs r0, #0xf9
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x68]
	ldr r1, _08092E3C @ =0x000001F5
	add r1, sl
	str r1, [sp, #0x6c]
	movs r2, #0x88
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x74]
	ldr r3, _08092E40 @ =0x00000221
	add r3, sl
	str r3, [sp, #0x78]
	ldr r0, _08092E44 @ =0x00000222
	add r0, sl
	str r0, [sp, #0x7c]
	ldr r1, _08092E48 @ =0x00000225
	add r1, sl
	str r1, [sp, #0x80]
	movs r2, #0x94
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x98]
	ldr r3, _08092E4C @ =0x00000251
	add r3, sl
	str r3, [sp, #0x9c]
	ldr r0, _08092E50 @ =0x00000252
	add r0, sl
	str r0, [sp, #0xa0]
	ldr r1, _08092E54 @ =0x00000255
	add r1, sl
	str r1, [sp, #0xa4]
	mov r2, sl
	adds r2, #0xe0
	str r2, [sp, #0xbc]
	movs r3, #0x80
	lsls r3, r3, #1
	add r3, sl
	str r3, [sp, #0x30]
	ldr r0, _08092E58 @ =0x00000101
	add r0, sl
	str r0, [sp, #0x34]
	movs r1, #0x81
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x38]
	ldr r2, _08092E5C @ =0x00000105
	add r2, sl
	str r2, [sp, #0x3c]
	mov r3, sl
	adds r3, #0x40
	str r3, [sp, #0x5c]
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x40]
	mov r1, sl
	adds r1, #0x6a
	str r1, [sp, #0x70]
	ldr r2, [sp, #0x24]
	lsls r2, r2, #1
	str r2, [sp, #0x44]
	subs r3, #0x16
	str r3, [sp, #0x58]
	movs r6, #0xd3
	lsls r6, r6, #2
	add r6, sl
	movs r7, #0
_08092B4A:
	movs r4, #0
	lsls r2, r5, #2
	adds r1, r2, #0
_08092B50:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r0, r6, r0
	str r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08092B50
	movs r4, #0
	ldr r1, _08092E60 @ =0x000004DC
	add r1, sl
	movs r3, #0
_08092B6E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r1, r0
	str r3, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xc
	bls _08092B6E
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08092B4A
	movs r5, #0
	movs r0, #0xbc
	lsls r0, r0, #3
	add r0, sl
	str r0, [sp, #0x28]
	movs r3, #0
	movs r1, #0xbd
	lsls r1, r1, #3
	add r1, sl
	mov ip, r1
	movs r2, #0xbe
	lsls r2, r2, #3
	add r2, sl
	mov sb, r2
	movs r0, #0xbf
	lsls r0, r0, #3
	add r0, sl
	mov r8, r0
	movs r7, #0xc0
	lsls r7, r7, #3
	add r7, sl
	movs r6, #0xc1
	lsls r6, r6, #3
	add r6, sl
	movs r4, #0xc2
	lsls r4, r4, #3
	add r4, sl
_08092BC4:
	lsls r1, r5, #2
	ldr r2, [sp, #0x28]
	adds r0, r2, r1
	str r3, [r0]
	mov r2, ip
	adds r0, r2, r1
	str r3, [r0]
	mov r2, sb
	adds r0, r2, r1
	str r3, [r0]
	mov r0, r8
	adds r2, r0, r1
	movs r0, #0xb4
	lsls r0, r0, #8
	str r0, [r2]
	adds r2, r7, r1
	movs r0, #0xc8
	lsls r0, r0, #8
	str r0, [r2]
	adds r0, r6, r1
	str r3, [r0]
	adds r1, r4, r1
	str r3, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08092BC4
	movs r4, #0
_08092BFE:
	bl sub_80854DC
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #2
	ldr r2, _08092E60 @ =0x000004DC
	add r2, sl
	adds r2, r2, r1
	movs r1, #0x7f
	ands r1, r0
	str r1, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xc
	bls _08092BFE
	movs r7, #0xc3
	lsls r7, r7, #3
	add r7, sl
	ldr r0, _08092E64 @ =0x06010000
	str r0, [r7]
	movs r1, #0xcb
	lsls r1, r1, #2
	add r1, sl
	movs r2, #0
	mov sb, r2
	movs r0, #2
	strh r0, [r1, #2]
	movs r0, #1
	strh r0, [r1]
	mov r3, sb
	strh r3, [r1, #4]
	adds r0, #0xff
	strh r0, [r1, #6]
	ldr r0, _08092E68 @ =0x00003FBF
	strh r0, [r1, #8]
	ldr r1, _08092E6C @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	beq _08092C52
	b _08092D64
_08092C52:
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r7]
	str r1, [r0, #4]
	ldr r1, [r7]
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r1, r2
	str r1, [r7]
	ldr r6, _08092E70 @ =gUnknown_080E17A4
	movs r3, #0x82
	lsls r3, r3, #1
	adds r1, r6, r3
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r2, #0x83
	lsls r2, r2, #1
	adds r1, r6, r2
	ldrb r2, [r1]
	movs r1, #0x98
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _08092E74 @ =0x00000131
	add r2, sl
	movs r1, #0xff
	strb r1, [r2]
	movs r1, #0xc8
	strh r1, [r0, #0x16]
	movs r1, #0x64
	strh r1, [r0, #0x18]
	movs r1, #0x80
	strh r1, [r0, #0x1a]
	mov r3, sb
	strh r3, [r0, #8]
	strh r3, [r0, #0x14]
	strh r3, [r0, #0x1c]
	adds r1, #0xb2
	add r1, sl
	movs r5, #0x10
	strb r5, [r1]
	ldr r2, _08092E78 @ =0x00000135
	add r2, sl
	movs r1, #1
	strb r1, [r2]
	mov r1, sb
	str r1, [r0, #0x10]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r0, #0x28]
	bl sub_8004558
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	ldr r0, [r7]
	str r0, [r1, #4]
	ldr r0, [r7]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [r7]
	adds r2, #0x41
	add r2, sl
	adds r0, r4, #0
	strb r0, [r2]
	movs r0, #0x6e
	strh r0, [r1, #0x16]
	ldr r0, _08092E7C @ =0x0000FFEC
	strh r0, [r1, #0x18]
	movs r3, #0x40
	strh r3, [r1, #0x1a]
	mov r0, sb
	strh r0, [r1, #8]
	strh r0, [r1, #0x14]
	strh r0, [r1, #0x1c]
	movs r0, #0xb1
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	ldr r0, _08092E80 @ =0x00000165
	add r0, sl
	movs r2, #0
	strb r2, [r0]
	mov r0, sb
	str r0, [r1, #0x10]
	str r4, [r1, #0x28]
	movs r0, #0xb8
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r7]
	str r1, [r0, #4]
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r1, r6, r2
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r7]
	adds r1, r1, r2
	str r1, [r7]
	movs r2, #0xc6
	lsls r2, r2, #1
	adds r1, r6, r2
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	adds r2, #2
	adds r1, r6, r2
	ldrb r2, [r1]
	movs r1, #0xc8
	lsls r1, r1, #1
	add r1, sl
	strb r2, [r1]
	ldr r2, _08092E84 @ =0x00000191
	add r2, sl
	adds r1, r4, #0
	strb r1, [r2]
	mov r1, sb
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	strh r3, [r0, #0x1a]
	strh r1, [r0, #8]
	strh r1, [r0, #0x14]
	strh r1, [r0, #0x1c]
	movs r1, #0xc9
	lsls r1, r1, #1
	add r1, sl
	strb r5, [r1]
	ldr r2, _08092E88 @ =0x00000195
	add r2, sl
	movs r1, #2
	strb r1, [r2]
	mov r2, sb
	str r2, [r0, #0x10]
	str r4, [r0, #0x28]
	bl sub_8004558
_08092D64:
	ldr r0, [r7]
	ldr r3, [sp, #0x84]
	str r0, [r3, #4]
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r7]
	ldr r4, _08092E70 @ =gUnknown_080E17A4
	ldr r2, _08092E6C @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r3, #0xa]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	ldr r3, [sp, #0x88]
	strb r0, [r3]
	movs r0, #0xff
	ldr r1, [sp, #0x8c]
	strb r0, [r1]
	movs r0, #0x78
	ldr r2, [sp, #0x84]
	strh r0, [r2, #0x16]
	ldr r0, _08092E7C @ =0x0000FFEC
	strh r0, [r2, #0x18]
	movs r3, #0x40
	mov r8, r3
	mov r0, r8
	strh r0, [r2, #0x1a]
	mov r1, sb
	strh r1, [r2, #8]
	strh r1, [r2, #0x14]
	strh r1, [r2, #0x1c]
	movs r5, #0x10
	ldr r2, [sp, #0x90]
	strb r5, [r2]
	movs r0, #0
	ldr r3, [sp, #0x94]
	strb r0, [r3]
	mov r1, sb
	ldr r2, [sp, #0x84]
	str r1, [r2, #0x10]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r2, #0x28]
	ldr r0, [sp, #0x84]
	bl sub_8004558
	movs r2, #0xc8
	lsls r2, r2, #2
	add r2, sl
	ldr r0, [r7]
	ldr r3, [sp, #0xa8]
	str r0, [r3, #4]
	ldr r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r7]
	ldr r3, _08092E6C @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #0x14
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	ldr r1, [sp, #0xa8]
	strh r0, [r1, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #0x14
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	ldr r3, [sp, #0xac]
	strb r0, [r3]
	adds r0, r6, #0
	ldr r1, [sp, #0xb0]
	strb r0, [r1]
	mov r0, sb
	ldr r3, [sp, #0xa8]
	strh r0, [r3, #0x16]
	strh r0, [r3, #0x18]
	mov r1, r8
	strh r1, [r3, #0x1a]
	strh r0, [r3, #8]
	strh r0, [r3, #0x14]
	strh r0, [r3, #0x1c]
	ldr r3, [sp, #0xb4]
	strb r5, [r3]
	movs r1, #0
	ldr r0, [sp, #0xb8]
	b _08092E8C
	.align 2, 0
_08092E2C: .4byte 0x0000033B
_08092E30: .4byte 0x000001C1
_08092E34: .4byte 0x000001C5
_08092E38: .4byte 0x000001F1
_08092E3C: .4byte 0x000001F5
_08092E40: .4byte 0x00000221
_08092E44: .4byte 0x00000222
_08092E48: .4byte 0x00000225
_08092E4C: .4byte 0x00000251
_08092E50: .4byte 0x00000252
_08092E54: .4byte 0x00000255
_08092E58: .4byte 0x00000101
_08092E5C: .4byte 0x00000105
_08092E60: .4byte 0x000004DC
_08092E64: .4byte 0x06010000
_08092E68: .4byte 0x00003FBF
_08092E6C: .4byte gUnknown_030054F0
_08092E70: .4byte gUnknown_080E17A4
_08092E74: .4byte 0x00000131
_08092E78: .4byte 0x00000135
_08092E7C: .4byte 0x0000FFEC
_08092E80: .4byte 0x00000165
_08092E84: .4byte 0x00000191
_08092E88: .4byte 0x00000195
_08092E8C:
	strb r1, [r0]
	movs r0, #0x60
	ldr r3, [sp, #0xa8]
	str r0, [r3, #0x10]
	str r6, [r3, #0x28]
	mov r0, sb
	strh r0, [r2]
	movs r1, #0xd0
	lsls r1, r1, #2
	add r1, sl
	ldrh r0, [r1]
	strh r0, [r2, #2]
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldrh r0, [r3, #0x16]
	strh r0, [r2, #6]
	ldrh r0, [r3, #0x18]
	strh r0, [r2, #8]
	ldr r0, [sp, #0xa8]
	bl sub_8004558
	movs r5, #0
	movs r7, #0xc3
	lsls r7, r7, #3
	add r7, sl
	movs r6, #0
	movs r1, #0x93
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	mov sb, r0
	movs r2, #0x92
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrh r0, [r0]
	mov r8, r0
_08092ED4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r3, #0x98
	lsls r3, r3, #2
	adds r0, r0, r3
	mov r1, sl
	adds r2, r1, r0
	ldr r0, [r7]
	str r0, [r2, #4]
	adds r0, r5, #0
	adds r0, #0x24
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	mov r3, r8
	strh r3, [r2, #0xa]
	adds r0, r2, #0
	adds r0, #0x20
	mov r1, sb
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	strh r6, [r2, #0x16]
	strh r6, [r2, #0x18]
	movs r0, #0xc0
	strh r0, [r2, #0x1a]
	strh r6, [r2, #8]
	strh r6, [r2, #0x14]
	strh r6, [r2, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	movs r3, #0
	strb r3, [r0]
	str r6, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08092ED4
	movs r5, #0
	movs r6, #0xc3
	lsls r6, r6, #3
	add r6, sl
	ldr r7, _08093294 @ =gUnknown_080E17A4
	movs r4, #0
	movs r1, #0x9b
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	add r2, sp, #0x2c
	strb r0, [r2]
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r0, [r0]
	mov r8, r0
_08092F64:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sl
	adds r2, r3, r0
	ldr r0, [r6]
	str r0, [r2, #4]
	adds r0, r5, #0
	adds r0, #0x26
	lsls r0, r0, #3
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #5
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r0, r8
	strh r0, [r2, #0xa]
	adds r0, r2, #0
	adds r0, #0x20
	add r1, sp, #0x2c
	ldrb r1, [r1]
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #0x1e
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	movs r0, #0xc0
	strh r0, [r2, #0x1a]
	strh r4, [r2, #8]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	adds r0, r2, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	str r4, [r2, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	adds r0, r2, #0
	str r3, [sp, #0xc0]
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r3, [sp, #0xc0]
	cmp r5, #1
	bls _08092F64
	movs r0, #0xd0
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0xc3
	lsls r4, r4, #3
	add r4, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	ldr r1, _08093294 @ =gUnknown_080E17A4
	mov r8, r1
	movs r1, #0x8c
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0x8e
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	movs r7, #0
	strh r1, [r0, #0xa]
	movs r1, #0x8f
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x48]
	strb r1, [r2]
	ldr r2, [sp, #0x4c]
	ldrb r1, [r2]
	mov r2, sb
	orrs r1, r2
	ldr r2, [sp, #0x4c]
	strb r1, [r2]
	strh r7, [r0, #0x16]
	strh r3, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0x50]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0x54]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0xe8
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0xa2
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r1, #0xa3
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x60]
	strb r1, [r2]
	ldr r3, [sp, #0x64]
	ldrb r1, [r3]
	mov r2, sb
	orrs r1, r2
	strb r1, [r3]
	movs r5, #0x78
	strh r5, [r0, #0x16]
	ldr r1, _08093298 @ =0x0000FFEC
	strh r1, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0x68]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0x6c]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	movs r1, #0xa4
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0xa6
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r1, #0xa7
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x74]
	strb r1, [r2]
	ldr r3, [sp, #0x78]
	ldrb r1, [r3]
	mov r2, sb
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, #0x16]
	movs r6, #0x80
	lsls r6, r6, #1
	strh r6, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0x7c]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0x80]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	movs r0, #0x8c
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r4]
	str r1, [r0, #4]
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [r1]
	lsls r2, r2, #5
	ldr r1, [r4]
	adds r1, r1, r2
	str r1, [r4]
	movs r1, #0xaa
	lsls r1, r1, #1
	add r1, r8
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	movs r1, #0xab
	lsls r1, r1, #1
	add r1, r8
	ldrb r1, [r1]
	ldr r2, [sp, #0x98]
	strb r1, [r2]
	ldr r3, [sp, #0x9c]
	ldrb r1, [r3]
	mov r2, sb
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, #0x16]
	strh r6, [r0, #0x18]
	strh r7, [r0, #0x1a]
	strh r7, [r0, #8]
	strh r7, [r0, #0x14]
	strh r7, [r0, #0x1c]
	movs r1, #0x10
	ldr r3, [sp, #0xa0]
	strb r1, [r3]
	movs r3, #0
	ldr r2, [sp, #0xa4]
	strb r3, [r2]
	str r7, [r0, #0x10]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	bl sub_8004558
	ldr r0, [r4]
	ldr r2, [sp, #0xbc]
	str r0, [r2, #4]
	ldr r0, [r4]
	movs r3, #0xa8
	lsls r3, r3, #5
	adds r0, r0, r3
	str r0, [r4]
	ldr r6, _0809329C @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r0, #0x19
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #4]
	strh r0, [r2, #0xa]
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r0, #0x19
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0, #6]
	ldr r1, [sp, #0x30]
	strb r0, [r1]
	ldr r2, [sp, #0x34]
	ldrb r0, [r2]
	mov r3, sb
	orrs r0, r3
	strb r0, [r2]
	ldr r0, [sp, #0xbc]
	strh r5, [r0, #0x16]
	strh r7, [r0, #0x18]
	movs r0, #0x40
	ldr r1, [sp, #0xbc]
	strh r0, [r1, #0x1a]
	strh r7, [r1, #8]
	strh r7, [r1, #0x14]
	strh r7, [r1, #0x1c]
	movs r3, #0x10
	ldr r2, [sp, #0x38]
	strb r3, [r2]
	movs r0, #1
	mov r8, r0
	mov r2, r8
	ldr r1, [sp, #0x3c]
	strb r2, [r1]
	ldr r3, [sp, #0xbc]
	str r7, [r3, #0x10]
	subs r0, #2
	str r0, [r3, #0x28]
	ldr r0, [sp, #0xbc]
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	ldr r1, [sp, #0x5c]
	str r0, [r1, #4]
	strh r7, [r1, #0xa]
	ldr r0, _080932A0 @ =0x0600E000
	str r0, [r1, #0xc]
	strh r7, [r1, #0x18]
	strh r7, [r1, #0x1a]
	ldr r5, _080932A4 @ =gUnknown_080E179C
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	strh r7, [r1, #0x1e]
	strh r7, [r1, #0x20]
	strh r7, [r1, #0x22]
	strh r7, [r1, #0x24]
	movs r4, #0x20
	strh r4, [r1, #0x26]
	strh r4, [r1, #0x28]
	movs r0, #0
	ldr r3, [sp, #0x70]
	strb r0, [r3]
	strh r7, [r1, #0x2e]
	ldr r0, [sp, #0x5c]
	bl sub_8002A3C
	ldr r1, [sp, #0x24]
	cmp r1, #2
	bne _0809321E
	ldr r1, _080932A8 @ =gBgScrollRegs
	movs r0, #8
	strh r0, [r1, #4]
_0809321E:
	ldr r0, _080932AC @ =0x06004000
	mov r2, sl
	str r0, [r2, #4]
	strh r7, [r2, #0xa]
	ldr r0, _080932B0 @ =0x0600C000
	str r0, [r2, #0xc]
	strh r7, [r2, #0x18]
	strh r7, [r2, #0x1a]
	ldr r3, [sp, #0x44]
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	strh r7, [r2, #0x1e]
	strh r7, [r2, #0x20]
	strh r7, [r2, #0x22]
	strh r7, [r2, #0x24]
	strh r4, [r2, #0x26]
	strh r4, [r2, #0x28]
	movs r1, #0
	ldr r0, [sp, #0x58]
	strb r1, [r0]
	mov r3, r8
	strh r3, [r2, #0x2e]
	mov r0, sl
	bl sub_8002A3C
	ldr r0, _080932B4 @ =gUnknown_03005B64
	ldr r0, [r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08093282
	ldr r1, _080932B8 @ =gUnknown_080E1AF4
	add r0, sp, #4
	movs r2, #0x20
	bl memcpy
	ldr r1, _080932BC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _080932C0 @ =gUnknown_030028C0
	str r0, [r1, #4]
	ldr r0, _080932C4 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08093282:
	add sp, #0xc4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093294: .4byte gUnknown_080E17A4
_08093298: .4byte 0x0000FFEC
_0809329C: .4byte gUnknown_030054F0
_080932A0: .4byte 0x0600E000
_080932A4: .4byte gUnknown_080E179C
_080932A8: .4byte gBgScrollRegs
_080932AC: .4byte 0x06004000
_080932B0: .4byte 0x0600C000
_080932B4: .4byte gUnknown_03005B64
_080932B8: .4byte gUnknown_080E1AF4
_080932BC: .4byte 0x040000D4
_080932C0: .4byte gUnknown_030028C0
_080932C4: .4byte 0x84000008

	thumb_func_start sub_80932C8
sub_80932C8: @ 0x080932C8
	push {r4, r5, r6, lr}
	ldr r6, _0809333C @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08093340 @ =gUnknown_0300032C
	adds r5, r0, r1
	movs r0, #1
	strh r0, [r5, #2]
	ldr r0, _08093344 @ =0x00003FFF
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl sub_8093FA0
	adds r0, r4, #0
	bl sub_8093FF0
	adds r0, r4, #0
	bl sub_80934B8
	adds r0, r4, #0
	bl sub_8093638
	adds r0, r4, #0
	bl sub_8093740
	adds r0, r4, #0
	bl sub_809401C
	adds r0, r4, #0
	bl sub_8094044
	adds r0, r4, #0
	bl sub_8094060
	adds r0, r4, #0
	bl sub_80940BC
	adds r0, r4, #0
	bl sub_8093868
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08093336
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _08093348 @ =sub_8093F54
	str r0, [r1, #8]
_08093336:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809333C: .4byte gCurTask
_08093340: .4byte gUnknown_0300032C
_08093344: .4byte 0x00003FFF
_08093348: .4byte sub_8093F54

	thumb_func_start sub_809334C
sub_809334C: @ 0x0809334C
	push {r4, r5, r6, lr}
	ldr r0, _0809340C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8093FA0
	adds r0, r5, #0
	bl sub_8093FF0
	adds r0, r5, #0
	bl sub_80934B8
	adds r0, r5, #0
	bl sub_8093638
	adds r0, r5, #0
	bl sub_8093740
	adds r0, r5, #0
	bl sub_809401C
	adds r0, r5, #0
	bl sub_8094044
	adds r0, r5, #0
	bl sub_8094060
	adds r0, r5, #0
	bl sub_80940BC
	adds r0, r5, #0
	bl sub_8093868
	ldr r0, _08093410 @ =gUnknown_030005E4
	adds r3, r4, r0
	ldr r2, _08093414 @ =gUnknown_080E1944
	ldr r1, _08093418 @ =gUnknown_03000338
	adds r0, r4, r1
	ldrb r6, [r0]
	lsls r0, r6, #1
	adds r1, #3
	adds r4, r4, r1
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _0809341C @ =gBgScrollRegs
	movs r2, #6
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3]
	cmp r1, r0
	beq _080933D4
	adds r1, r4, #0
	cmp r1, #0
	bne _080933CC
	cmp r6, #3
	bhi _080933D4
_080933CC:
	cmp r1, #1
	bne _080934A8
	cmp r6, #4
	bls _080934A8
_080933D4:
	ldr r1, _08093420 @ =0x0000033B
	adds r0, r5, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080933EA
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #5
	bls _080933FA
_080933EA:
	cmp r1, #1
	bne _080934A0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #6
	bhi _080934A0
_080933FA:
	ldr r2, _08093424 @ =0x00000342
	adds r6, r5, r2
	ldrh r0, [r6]
	cmp r0, #0
	beq _08093428
	subs r0, #1
	strh r0, [r6]
	b _080934A8
	.align 2, 0
_0809340C: .4byte gCurTask
_08093410: .4byte gUnknown_030005E4
_08093414: .4byte gUnknown_080E1944
_08093418: .4byte gUnknown_03000338
_0809341C: .4byte gBgScrollRegs
_08093420: .4byte 0x0000033B
_08093424: .4byte 0x00000342
_08093428:
	ldr r3, _08093464 @ =gUnknown_080E1B14
	movs r0, #0xce
	lsls r0, r0, #2
	adds r2, r5, r0
	ldr r1, _08093468 @ =0x0000033B
	adds r4, r5, r1
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	ldrb r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6]
	ldrb r3, [r2]
	adds r1, r3, #1
	strb r1, [r2]
	ldrb r0, [r4]
	cmp r0, #0
	beq _080934A8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08093470
	ldr r2, _0809346C @ =0x0000033A
	adds r0, r5, r2
	strb r1, [r0]
	b _080934A8
	.align 2, 0
_08093464: .4byte gUnknown_080E1B14
_08093468: .4byte 0x0000033B
_0809346C: .4byte 0x0000033A
_08093470:
	subs r0, r3, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0809348C
	ldr r0, _08093488 @ =0x0000033A
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080934A8
	.align 2, 0
_08093488: .4byte 0x0000033A
_0809348C:
	cmp r1, #4
	bls _080934A8
	ldr r2, _0809349C @ =0x0000033A
	adds r1, r5, r2
	movs r0, #4
	strb r0, [r1]
	b _080934A8
	.align 2, 0
_0809349C: .4byte 0x0000033A
_080934A0:
	ldr r0, _080934B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080934B4 @ =sub_80932C8
	str r0, [r1, #8]
_080934A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080934B0: .4byte gCurTask
_080934B4: .4byte sub_80932C8

	thumb_func_start sub_80934B8
sub_80934B8: @ 0x080934B8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08093500 @ =0x000005E4
	adds r6, r4, r0
	ldr r3, _08093504 @ =gUnknown_080E1944
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r5, [r0]
	lsls r1, r5, #1
	ldr r2, _08093508 @ =0x0000033B
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	ldr r2, _0809350C @ =gBgScrollRegs
	movs r7, #6
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6]
	adds r7, r2, #0
	cmp r1, r0
	bge _08093510
	cmp r5, #0
	bne _08093518
	movs r2, #0xc8
	lsls r2, r2, #2
	adds r0, r1, r2
	str r0, [r6]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r1, r4, r3
	b _08093624
	.align 2, 0
_08093500: .4byte 0x000005E4
_08093504: .4byte gUnknown_080E1944
_08093508: .4byte 0x0000033B
_0809350C: .4byte gBgScrollRegs
_08093510:
	cmp r5, #0
	bne _08093518
	str r0, [r6]
	b _0809361E
_08093518:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
	cmp r1, #1
	bne _08093530
	ldr r5, _0809352C @ =0x000005E4
	adds r2, r4, r5
	b _08093604
	.align 2, 0
_0809352C: .4byte 0x000005E4
_08093530:
	ldr r0, _08093544 @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08093548
	cmp r1, #5
	beq _0809354C
	b _080935F8
	.align 2, 0
_08093544: .4byte gUnknown_030054F0
_08093548:
	cmp r1, #4
	bne _080935F8
_0809354C:
	ldr r7, _080935B8 @ =0x00000342
	adds r0, r4, r7
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08093596
	ldr r0, _080935BC @ =0x0000033E
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #0x22
	bhi _08093568
	adds r0, #1
	strb r0, [r3]
_08093568:
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r2, r4, r1
	ldr r1, _080935C0 @ =gUnknown_080E1B30
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	movs r5, #0xf0
	lsls r5, r5, #7
	adds r0, r0, r5
	str r0, [r2]
	ldr r7, _080935C4 @ =0x000005E4
	adds r2, r4, r7
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x82
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r2]
_08093596:
	ldr r2, _080935B8 @ =0x00000342
	adds r0, r4, r2
	ldrh r0, [r0]
	cmp r0, #0x31
	bhi _080935C8
	movs r3, #0xd0
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	movs r5, #0xc8
	lsls r5, r5, #2
	adds r1, r4, r5
	ldrh r0, [r1]
	adds r0, #3
	b _080935DE
	.align 2, 0
_080935B8: .4byte 0x00000342
_080935BC: .4byte 0x0000033E
_080935C0: .4byte gUnknown_080E1B30
_080935C4: .4byte 0x000005E4
_080935C8:
	movs r7, #0xd0
	lsls r7, r7, #2
	adds r1, r4, r7
	ldrh r0, [r1]
	adds r0, #8
	strh r0, [r1]
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #0x14
_080935DE:
	strh r0, [r1]
	ldr r1, _080935F4 @ =0x00000342
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, #1
	bne _0809362A
	movs r0, #0xd4
	bl m4aSongNumStart
	b _0809362A
	.align 2, 0
_080935F4: .4byte 0x00000342
_080935F8:
	ldr r5, _08093630 @ =0x000005E4
	adds r2, r4, r5
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
_08093604:
	lsls r1, r1, #1
	ldr r5, _08093634 @ =0x0000033B
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	movs r3, #6
	ldrsh r1, [r7, r3]
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2]
_0809361E:
	movs r5, #0xbc
	lsls r5, r5, #3
	adds r1, r4, r5
_08093624:
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [r1]
_0809362A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093630: .4byte 0x000005E4
_08093634: .4byte 0x0000033B

	thumb_func_start sub_8093638
sub_8093638: @ 0x08093638
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	movs r6, #0
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r6, r0
	bge _08093728
	movs r0, #0xd5
	lsls r0, r0, #2
	add r0, ip
	mov r8, r0
	movs r7, #0xd7
	lsls r7, r7, #2
	add r7, ip
	ldr r1, _0809369C @ =gUnknown_08097AA4
	mov sl, r1
	mov sb, r6
	movs r2, #0xd3
	lsls r2, r2, #2
	add r2, ip
	str r2, [sp]
_08093674:
	lsls r3, r6, #2
	adds r0, r3, r6
	lsls r4, r0, #2
	mov r0, r8
	adds r2, r0, r4
	ldr r1, _080936A0 @ =gUnknown_080E1964
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bhi _080936A4
	adds r0, r7, r4
	mov r2, sb
	str r2, [r0]
	b _080936AA
	.align 2, 0
_0809369C: .4byte gUnknown_08097AA4
_080936A0: .4byte gUnknown_080E1964
_080936A4:
	adds r1, r7, r4
	movs r0, #1
	str r0, [r1]
_080936AA:
	adds r0, r3, r6
	lsls r3, r0, #2
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r2]
	ldr r5, _08093738 @ =0x0003FFFF
	cmp r0, r5
	ble _080936BE
	mov r1, sb
	str r1, [r2]
_080936BE:
	ldr r0, [sp]
	adds r1, r0, r3
	ldr r0, [r2]
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	movs r0, #0xd6
	lsls r0, r0, #2
	add r0, ip
	adds r4, r0, r3
	ldr r1, _0809373C @ =gUnknown_080E1968
	adds r0, r3, r1
	ldr r1, [r0]
	lsls r1, r1, #3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	cmp r0, r5
	ble _080936F4
	mov r2, sb
	str r2, [r4]
_080936F4:
	movs r2, #0xd4
	lsls r2, r2, #2
	add r2, ip
	adds r2, r2, r3
	ldr r0, [r4]
	asrs r0, r0, #8
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r6, r0
	blt _08093674
_08093728:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093738: .4byte 0x0003FFFF
_0809373C: .4byte gUnknown_080E1968

	thumb_func_start sub_8093740
sub_8093740: @ 0x08093740
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	movs r5, #0
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r5, r0
	bge _0809384E
	movs r0, #0x9c
	lsls r0, r0, #3
	add r0, ip
	mov r8, r0
	ldr r1, _080937B4 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r1, r2]
	movs r3, #0xbe
	mov sl, r3
	subs r0, r3, r0
	lsls r0, r0, #8
	str r0, [sp]
	ldr r4, _080937B8 @ =gUnknown_030053B8
	mov sb, r4
	ldr r6, _080937BC @ =0x000004EC
	add r6, ip
	ldr r7, _080937C0 @ =0x000004DC
	add r7, ip
_08093786:
	lsls r1, r5, #2
	adds r0, r1, r5
	lsls r2, r0, #2
	mov r3, r8
	adds r0, r3, r2
	ldr r0, [r0]
	adds r4, r1, #0
	ldr r1, [sp]
	cmp r0, r1
	bne _080937D2
	mov r3, sb
	ldr r1, [r3]
	ldr r0, _080937C4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _080937C8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	cmp r0, #0
	bge _080937CC
	adds r1, r6, r2
	movs r0, #1
	rsbs r0, r0, #0
	b _080937D0
	.align 2, 0
_080937B4: .4byte gBgScrollRegs
_080937B8: .4byte gUnknown_030053B8
_080937BC: .4byte 0x000004EC
_080937C0: .4byte 0x000004DC
_080937C4: .4byte 0x00196225
_080937C8: .4byte 0x3C6EF35F
_080937CC:
	adds r1, r6, r2
	movs r0, #1
_080937D0:
	str r0, [r1]
_080937D2:
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r2, r7, r0
	adds r0, r6, r0
	ldr r0, [r0]
	lsls r0, r0, #7
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #9
	cmp r1, r3
	ble _080937F4
	movs r0, #0xa
	rsbs r0, r0, #0
	str r0, [r2]
	b _080937FE
_080937F4:
	movs r0, #0xa
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080937FE
	str r3, [r2]
_080937FE:
	adds r1, r4, r5
	lsls r1, r1, #2
	mov r2, r8
	adds r3, r2, r1
	ldr r4, _08093860 @ =gBgScrollRegs
	movs r2, #6
	ldrsh r0, [r4, r2]
	mov r4, sl
	subs r0, r4, r0
	lsls r2, r0, #8
	adds r1, r7, r1
	ldr r0, [r1]
	asrs r0, r0, #7
	lsls r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, _08093864 @ =gUnknown_08097AA4
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _08093830
	rsbs r0, r0, #0
_08093830:
	lsls r0, r0, #3
	subs r0, r2, r0
	str r0, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r0, #0xcf
	lsls r0, r0, #2
	add r0, ip
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r5, r0
	blt _08093786
_0809384E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093860: .4byte gBgScrollRegs
_08093864: .4byte gUnknown_08097AA4

	thumb_func_start sub_8093868
sub_8093868: @ 0x08093868
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r0, r0, r5
	mov ip, r0
	ldr r0, _08093894 @ =gUnknown_030054F0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #1
	bne _08093898
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #4
	bls _080938A4
	b _08093970
	.align 2, 0
_08093894: .4byte gUnknown_030054F0
_08093898:
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0809394E
_080938A4:
	adds r6, r5, #0
	adds r6, #0x80
	movs r3, #0xce
	lsls r3, r3, #2
	adds r4, r5, r3
	ldrb r1, [r4]
	cmp r1, #2
	bhi _080938C4
	ldr r3, _080938BC @ =gUnknown_080E17A4
	ldr r2, _080938C0 @ =gUnknown_080E1C48
	b _0809390E
	.align 2, 0
_080938BC: .4byte gUnknown_080E17A4
_080938C0: .4byte gUnknown_080E1C48
_080938C4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	bne _08093908
	cmp r1, #4
	bhi _080938F8
	ldr r2, _080938F0 @ =gUnknown_080E17A4
	ldr r1, _080938F4 @ =gUnknown_080E1C4E
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	b _08093930
	.align 2, 0
_080938F0: .4byte gUnknown_080E17A4
_080938F4: .4byte gUnknown_080E1C4E
_080938F8:
	ldr r3, _08093900 @ =gUnknown_080E17A4
	ldr r2, _08093904 @ =gUnknown_080E1C4E
	b _0809390C
	.align 2, 0
_08093900: .4byte gUnknown_080E17A4
_08093904: .4byte gUnknown_080E1C4E
_08093908:
	ldr r3, _08093964 @ =gUnknown_080E17A4
	ldr r2, _08093968 @ =gUnknown_080E1C48
_0809390C:
	ldrb r1, [r4]
_0809390E:
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r4]
	adds r1, r1, r2
	movs r0, #0
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
_08093930:
	ldrb r1, [r0, #6]
	adds r0, r5, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r2, _0809396C @ =0x000005E4
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
_0809394E:
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #1
	beq _08093970
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	beq _0809397C
	b _080939B6
	.align 2, 0
_08093964: .4byte gUnknown_080E17A4
_08093968: .4byte gUnknown_080E1C48
_0809396C: .4byte 0x000005E4
_08093970:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _080939B6
_0809397C:
	adds r6, r5, #0
	adds r6, #0xb0
	movs r2, #0xbc
	lsls r2, r2, #3
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r3, _080939DC @ =0x000005E4
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	movs r0, #0xd0
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	mov r2, ip
	strh r0, [r2, #2]
	ldrh r0, [r1]
	strh r0, [r2, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r2, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r2, #8]
	adds r0, r6, #0
	mov r1, ip
	bl sub_8004860
_080939B6:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, _080939E0 @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080939E4
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080939F0
	b _08093A7E
	.align 2, 0
_080939DC: .4byte 0x000005E4
_080939E0: .4byte gUnknown_030054F0
_080939E4:
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #5
	bls _08093A7E
_080939F0:
	adds r6, r5, #0
	adds r6, #0xe0
	ldr r3, _08093A28 @ =gUnknown_030054F0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	beq _08093A34
	ldr r2, _08093A2C @ =gUnknown_080E17A4
	ldr r0, _08093A30 @ =gUnknown_080E1C48
	ldrb r1, [r0, #5]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	b _08093A5A
	.align 2, 0
_08093A28: .4byte gUnknown_030054F0
_08093A2C: .4byte gUnknown_080E17A4
_08093A30: .4byte gUnknown_080E1C48
_08093A34:
	ldr r2, _08093B5C @ =gUnknown_080E17A4
	ldr r0, _08093B60 @ =gUnknown_080E1C4E
	ldrb r1, [r0, #6]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r1, [r1, #6]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r5, r3
_08093A5A:
	strb r1, [r0]
	movs r1, #0xbc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r2, _08093B64 @ =0x000005E4
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093A7E:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08093B00
	ldr r0, _08093B68 @ =0x0000033D
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093B00
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r1, _08093B5C @ =gUnknown_080E17A4
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r3, #0x8f
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrb r1, [r0]
	adds r2, #0xa4
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r7, r5, #0
	adds r7, #0x96
	ldrh r0, [r7]
	strh r0, [r6, #0x16]
	adds r4, r5, #0
	adds r4, #0x98
	ldrh r0, [r4]
	adds r0, #0x19
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	ldr r0, [r6, #0x10]
	ldr r1, _08093B6C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	ldrh r0, [r7]
	strh r0, [r6, #0x16]
	ldrh r0, [r4]
	adds r0, #0x19
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	cmp r0, #1
	beq _08093AFA
	movs r0, #1
	mov r3, r8
	strb r0, [r3]
_08093AFA:
	adds r0, r6, #0
	bl sub_80051E8
_08093B00:
	movs r4, #0
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r4, r0
	bge _08093BD4
	ldr r7, _08093B70 @ =gUnknown_080E1964
	movs r2, #0x10
	adds r2, r2, r7
	mov r8, r2
_08093B1A:
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r3, #0x98
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r5, r0
	ldr r0, _08093B5C @ =gUnknown_080E17A4
	adds r1, #0x24
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #2
	adds r3, #0xfc
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08093B74
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _08093B7A
	.align 2, 0
_08093B5C: .4byte gUnknown_080E17A4
_08093B60: .4byte gUnknown_080E1C4E
_08093B64: .4byte 0x000005E4
_08093B68: .4byte 0x0000033D
_08093B6C: .4byte 0xFFFFFBFF
_08093B70: .4byte gUnknown_080E1964
_08093B74:
	ldr r0, [r6, #0x10]
	ldr r1, _08093BE0 @ =0xFFFFFBFF
	ands r0, r1
_08093B7A:
	str r0, [r6, #0x10]
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r0, r7, #0
	adds r0, #0xc
	adds r0, r2, r0
	ldr r1, [r0]
	movs r3, #0xd3
	lsls r3, r3, #2
	adds r0, r5, r3
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x16]
	mov r1, r8
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r0, _08093BE4 @ =gBgScrollRegs
	ldrh r0, [r0, #6]
	subs r1, r1, r0
	adds r3, #4
	adds r0, r5, r3
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #0x14
	subs r0, r0, r1
	cmp r4, r0
	blt _08093B1A
_08093BD4:
	movs r4, #0
	movs r2, #0xcf
	lsls r2, r2, #2
	adds r0, r5, r2
	b _08093C72
	.align 2, 0
_08093BE0: .4byte 0xFFFFFBFF
_08093BE4: .4byte gBgScrollRegs
_08093BE8:
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r5, r0
	ldr r0, _08093C2C @ =gUnknown_080E17A4
	adds r1, #0x26
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	lsls r2, r4, #2
	adds r1, r2, r4
	lsls r1, r1, #2
	ldr r3, _08093C30 @ =0x000004EC
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	ble _08093C34
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _08093C3A
	.align 2, 0
_08093C2C: .4byte gUnknown_080E17A4
_08093C30: .4byte 0x000004EC
_08093C34:
	ldr r0, [r6, #0x10]
	ldr r1, _08093CD4 @ =0xFFFFFBFF
	ands r0, r1
_08093C3A:
	str r0, [r6, #0x10]
	adds r1, r2, r4
	lsls r1, r1, #2
	ldr r2, _08093CD8 @ =0x000004DC
	adds r0, r5, r2
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	movs r3, #0x9c
	lsls r3, r3, #3
	adds r0, r5, r3
	adds r0, r0, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r0, r5, r1
_08093C72:
	ldrb r1, [r0]
	lsrs r1, r1, #1
	movs r0, #0xd
	subs r0, r0, r1
	cmp r4, r0
	blt _08093BE8
	ldr r2, _08093CDC @ =0x0000034A
	adds r4, r5, r2
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r2, [r4, r3]
	cmp r2, #0
	ble _08093CE8
	movs r0, #0xe8
	lsls r0, r0, #1
	adds r6, r5, r0
	ldr r1, _08093CE0 @ =gUnknown_080E17A4
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r3, #0xa3
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrb r1, [r0]
	adds r2, #0xac
	adds r0, r5, r2
	strb r1, [r0]
	movs r3, #0xbe
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r1, _08093CE4 @ =0x000005F4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	ldrh r0, [r4]
	subs r0, #1
	b _08093D02
	.align 2, 0
_08093CD4: .4byte 0xFFFFFBFF
_08093CD8: .4byte 0x000004DC
_08093CDC: .4byte 0x0000034A
_08093CE0: .4byte gUnknown_080E17A4
_08093CE4: .4byte 0x000005F4
_08093CE8:
	adds r0, r1, #0
	adds r0, #0x1d
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bhi _08093CF8
	subs r0, r1, #1
	b _08093D02
_08093CF8:
	movs r0, #0x1e
	rsbs r0, r0, #0
	cmp r2, r0
	bgt _08093D04
	movs r0, #0x32
_08093D02:
	strh r0, [r4]
_08093D04:
	ldr r0, _08093D20 @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08093D24
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08093D30
	b _08093DBE
	.align 2, 0
_08093D20: .4byte gUnknown_030054F0
_08093D24:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #4
	bls _08093DB0
_08093D30:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r4, _08093E60 @ =gUnknown_080E17A4
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r2, #0xa7
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r1, [r0]
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r2, _08093E64 @ =0x000005FC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r3, #0x8c
	lsls r3, r3, #2
	adds r6, r5, r3
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r2, #0xab
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r3, #0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r2, _08093E68 @ =0x00000604
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093DB0:
	ldr r0, _08093E6C @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08093DBE
	b _08093EC8
_08093DBE:
	movs r3, #0x88
	lsls r3, r3, #1
	adds r6, r5, r3
	ldr r4, _08093E60 @ =gUnknown_080E17A4
	ldr r2, _08093E70 @ =gUnknown_080E1C55
	ldr r0, _08093E74 @ =0x0000033A
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	movs r3, #0xbd
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	strh r0, [r6, #0x16]
	ldr r1, _08093E78 @ =0x000005EC
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r2, #0xce
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #5
	bhi _08093E80
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r6, r5, r3
	adds r0, #0x2b
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	adds r0, #0x2b
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	subs r0, #0x14
	strh r0, [r6, #0x16]
	ldr r1, _08093E7C @ =0x000005E4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	subs r0, #0x14
	b _08093EBA
	.align 2, 0
_08093E60: .4byte gUnknown_080E17A4
_08093E64: .4byte 0x000005FC
_08093E68: .4byte 0x00000604
_08093E6C: .4byte gUnknown_030054F0
_08093E70: .4byte gUnknown_080E1C55
_08093E74: .4byte 0x0000033A
_08093E78: .4byte 0x000005EC
_08093E7C: .4byte 0x000005E4
_08093E80:
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r6, r5, r2
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r1, #0xc7
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r2, #0x20
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, [r6, #0x10]
	ldr r1, _08093ED4 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	movs r3, #0xbc
	lsls r3, r3, #3
	adds r0, r5, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, _08093ED8 @ =0x000005E4
	adds r0, r5, r1
	ldr r0, [r0]
	asrs r0, r0, #8
_08093EBA:
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08093EC8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08093ED4: .4byte 0xFFFFFBFF
_08093ED8: .4byte 0x000005E4

	thumb_func_start sub_8093EDC
sub_8093EDC: @ 0x08093EDC
	push {r4, r5, r6, lr}
	ldr r6, _08093F48 @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r0, r4
	ldr r1, _08093F4C @ =gUnknown_0300032C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8093FA0
	adds r0, r4, #0
	bl sub_8093FF0
	adds r0, r4, #0
	bl sub_80934B8
	adds r0, r4, #0
	bl sub_8093638
	adds r0, r4, #0
	bl sub_8093740
	adds r0, r4, #0
	bl sub_809401C
	adds r0, r4, #0
	bl sub_8094044
	adds r0, r4, #0
	bl sub_8094060
	adds r0, r4, #0
	bl sub_80940BC
	adds r0, r4, #0
	bl sub_8093868
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08093F42
	movs r0, #0
	strh r0, [r5, #4]
	ldr r1, [r6]
	ldr r0, _08093F50 @ =sub_809334C
	str r0, [r1, #8]
_08093F42:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093F48: .4byte gCurTask
_08093F4C: .4byte gUnknown_0300032C
_08093F50: .4byte sub_809334C

	thumb_func_start sub_8093F54
sub_8093F54: @ 0x08093F54
	push {r4, lr}
	ldr r4, _08093F7C @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _08093F80 @ =gUnknown_03000344
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _08093F84
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _08093F94
	movs r0, #0x2c
	bl m4aSongNumStart
	b _08093F94
	.align 2, 0
_08093F7C: .4byte gCurTask
_08093F80: .4byte gUnknown_03000344
_08093F84:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl sub_808EA50
	ldr r0, [r4]
	bl TaskDestroy
_08093F94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8093F9C
sub_8093F9C: @ 0x08093F9C
	bx lr
	.align 2, 0

	thumb_func_start sub_8093FA0
sub_8093FA0: @ 0x08093FA0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _08093FBC @ =gBgScrollRegs
	movs r3, #2
	ldrsh r1, [r0, r3]
	adds r3, r0, #0
	cmp r1, #0x4b
	bgt _08093FC4
	ldr r4, _08093FC0 @ =0x00000614
	adds r1, r2, r4
	ldr r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #2
	b _08093FCE
	.align 2, 0
_08093FBC: .4byte gBgScrollRegs
_08093FC0: .4byte 0x00000614
_08093FC4:
	ldr r0, _08093FEC @ =0x00000614
	adds r1, r2, r0
	ldr r0, [r1]
	movs r4, #0xc0
	lsls r4, r4, #1
_08093FCE:
	adds r0, r0, r4
	str r0, [r1]
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0x5f
	bgt _08093FE4
	ldr r4, _08093FEC @ =0x00000614
	adds r0, r2, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r3, #2]
_08093FE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093FEC: .4byte 0x00000614

	thumb_func_start sub_8093FF0
sub_8093FF0: @ 0x08093FF0
	push {lr}
	ldr r1, _08094014 @ =0x0000060C
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r0]
	ldr r2, _08094018 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0x41
	bgt _0809400E
	asrs r0, r1, #8
	strh r0, [r2, #6]
_0809400E:
	pop {r0}
	bx r0
	.align 2, 0
_08094014: .4byte 0x0000060C
_08094018: .4byte gBgScrollRegs

	thumb_func_start sub_809401C
sub_809401C: @ 0x0809401C
	movs r1, #0xbd
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x78
	str r1, [r2]
	ldr r3, _0809403C @ =0x000005EC
	adds r0, r0, r3
	ldr r1, _08094040 @ =gBgScrollRegs
	movs r3, #6
	ldrsh r2, [r1, r3]
	movs r1, #0xc2
	subs r1, r1, r2
	lsls r1, r1, #8
	str r1, [r0]
	bx lr
	.align 2, 0
_0809403C: .4byte 0x000005EC
_08094040: .4byte gBgScrollRegs

	thumb_func_start sub_8094044
sub_8094044: @ 0x08094044
	movs r1, #0xbe
	lsls r1, r1, #3
	adds r2, r0, r1
	movs r1, #0x78
	str r1, [r2]
	ldr r1, _0809405C @ =0x000005F4
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #4
	str r1, [r0]
	bx lr
	.align 2, 0
_0809405C: .4byte 0x000005F4

	thumb_func_start sub_8094060
sub_8094060: @ 0x08094060
	push {lr}
	adds r2, r0, #0
	ldr r0, _08094080 @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08094084
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _08094090
	b _080940AE
	.align 2, 0
_08094080: .4byte gUnknown_030054F0
_08094084:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _080940AE
_08094090:
	movs r1, #0xbf
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #0x78
	str r1, [r0]
	ldr r3, _080940B4 @ =0x000005FC
	adds r2, r2, r3
	ldr r1, [r2]
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r1, r0
	ble _080940AE
	ldr r3, _080940B8 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_080940AE:
	pop {r0}
	bx r0
	.align 2, 0
_080940B4: .4byte 0x000005FC
_080940B8: .4byte 0xFFFFFD00

	thumb_func_start sub_80940BC
sub_80940BC: @ 0x080940BC
	push {lr}
	adds r2, r0, #0
	ldr r0, _080940DC @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080940E0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _080940EC
	b _0809410A
	.align 2, 0
_080940DC: .4byte gUnknown_030054F0
_080940E0:
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #6
	bne _0809410A
_080940EC:
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #0x78
	str r1, [r0]
	ldr r3, _08094110 @ =0x00000604
	adds r2, r2, r3
	ldr r1, [r2]
	movs r0, #0x96
	lsls r0, r0, #8
	cmp r1, r0
	ble _0809410A
	ldr r3, _08094114 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_0809410A:
	pop {r0}
	bx r0
	.align 2, 0
_08094110: .4byte 0x00000604
_08094114: .4byte 0xFFFFFD00

	thumb_func_start sub_8094118
sub_8094118: @ 0x08094118
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	ldr r1, _08094204 @ =gDispCnt
	movs r2, #0x82
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08094208 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0809420C @ =0x00001E03
	strh r0, [r1]
	ldr r0, _08094210 @ =0x00001C05
	strh r0, [r1, #2]
	ldr r3, _08094214 @ =gUnknown_03004D80
	strb r4, [r3]
	ldr r0, _08094218 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r2, #0x20
	strb r2, [r0, #3]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r3, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strb r1, [r0, #6]
	strb r2, [r0, #7]
	str r6, [sp, #4]
	ldr r1, _0809421C @ =0x040000D4
	add r5, sp, #4
	str r5, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08094220 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08094224 @ =sub_8094360
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r1, _08094228 @ =sub_80945A0
	str r1, [sp]
	movs r1, #0xc8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	adds r0, #0xbc
	adds r2, r3, r0
	strb r4, [r2]
	ldr r5, _0809422C @ =gUnknown_030000C0
	adds r1, r3, r5
	movs r0, #0xf0
	str r0, [r1]
	ldr r1, _08094230 @ =gUnknown_030000BD
	adds r0, r3, r1
	strb r4, [r0]
	subs r5, #1
	adds r1, r3, r5
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	subs r5, #1
	adds r0, r3, r5
	strb r4, [r0]
	ldr r4, _08094234 @ =gUnknown_03005B64
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r1]
	ldr r0, [r4]
	ldr r1, _08094238 @ =gUnknown_030054F0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0xc
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080941EC
	movs r0, #1
	strb r0, [r2]
	movs r2, #0
	ldr r0, _08094230 @ =gUnknown_030000BD
	adds r1, r3, r0
_080941D0:
	ldr r0, [r4]
	adds r0, #0x15
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080941E2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080941E2:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080941D0
_080941EC:
	bl m4aMPlayAllStop
	adds r0, r6, #0
	adds r0, #0xbd
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _08094240
	ldr r0, _0809423C @ =0x0000019F
	bl m4aSongNumStart
	b _08094248
	.align 2, 0
_08094204: .4byte gDispCnt
_08094208: .4byte gBgCntRegs
_0809420C: .4byte 0x00001E03
_08094210: .4byte 0x00001C05
_08094214: .4byte gUnknown_03004D80
_08094218: .4byte gUnknown_03002280
_0809421C: .4byte 0x040000D4
_08094220: .4byte 0x85004000
_08094224: .4byte sub_8094360
_08094228: .4byte sub_80945A0
_0809422C: .4byte gUnknown_030000C0
_08094230: .4byte gUnknown_030000BD
_08094234: .4byte gUnknown_03005B64
_08094238: .4byte gUnknown_030054F0
_0809423C: .4byte 0x0000019F
_08094240:
	movs r0, #0xcc
	lsls r0, r0, #1
	bl m4aSongNumStart
_08094248:
	adds r1, r6, #0
	adds r1, #0xb0
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	strh r2, [r1, #4]
	movs r0, #0x80
	strh r0, [r1, #6]
	ldr r0, _08094290 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	adds r4, r6, #0
	adds r4, #0xc4
	ldr r0, _08094294 @ =0x06010000
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x80
	str r0, [r3, #4]
	ldrb r0, [r7]
	cmp r0, #3
	bhi _0809429C
	ldr r2, _08094298 @ =gUnknown_080E1CA0
	ldr r1, [r2]
	lsls r1, r1, #5
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r2, #4]
	strh r0, [r3, #0xa]
	ldrb r1, [r2, #6]
	adds r0, r6, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r0, #0x55
	b _080942B6
	.align 2, 0
_08094290: .4byte 0x00003FFF
_08094294: .4byte 0x06010000
_08094298: .4byte gUnknown_080E1CA0
_0809429C:
	ldr r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _08094338 @ =gUnknown_080E1CA0
	ldrh r0, [r1, #0xc]
	strh r0, [r3, #0xa]
	ldrb r1, [r1, #0xe]
	adds r0, r6, #0
	adds r0, #0xa0
	strb r1, [r0]
	movs r0, #0x5a
_080942B6:
	strh r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r5, #0
	movs r4, #0
	movs r0, #0x78
	strh r0, [r3, #0x16]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r5, [r0]
	str r4, [r3, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	adds r0, r3, #0
	bl sub_8004558
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r6, #4]
	strh r4, [r6, #0xa]
	ldr r0, _0809433C @ =0x0600F000
	str r0, [r6, #0xc]
	strh r4, [r6, #0x18]
	strh r4, [r6, #0x1a]
	strh r4, [r6, #0x1e]
	strh r4, [r6, #0x20]
	strh r4, [r6, #0x22]
	strh r4, [r6, #0x24]
	movs r1, #0x1e
	strh r1, [r6, #0x26]
	movs r0, #0x14
	strh r0, [r6, #0x28]
	adds r0, r6, #0
	adds r0, #0x2a
	strb r5, [r0]
	strh r4, [r6, #0x2e]
	adds r2, r6, #0
	adds r2, #0x40
	ldr r0, _08094340 @ =0x06004000
	str r0, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _08094344 @ =0x0600E000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	strh r1, [r2, #0x26]
	ldrb r0, [r7]
	cmp r0, #0
	beq _08094348
	movs r0, #7
	b _0809434A
	.align 2, 0
_08094338: .4byte gUnknown_080E1CA0
_0809433C: .4byte 0x0600F000
_08094340: .4byte 0x06004000
_08094344: .4byte 0x0600E000
_08094348:
	movs r0, #6
_0809434A:
	strh r0, [r2, #0x28]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	strh r0, [r2, #0x2e]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8094360
sub_8094360: @ 0x08094360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #0
	ldr r0, _080943E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov r8, r0
	ldr r0, _080943E8 @ =gUnknown_030000BD
	adds r6, r4, r0
	ldrb r5, [r6]
	cmp r5, #0
	bne _08094400
	ldr r1, _080943EC @ =gUnknown_030000BF
	adds r6, r4, r1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #1
	ble _080943BE
	ldr r2, _080943F0 @ =gDispCnt
	ldrh r0, [r2]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080943F4 @ =gBgScrollRegs
	strh r3, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	strh r0, [r1, #6]
	ldr r0, _080943F8 @ =gUnknown_03000040
	adds r3, r4, r0
	ldr r1, _080943FC @ =gUnknown_080E1C5C
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
_080943BE:
	ldr r2, _080943F0 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080943F4 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	mov r3, r8
	ldr r0, _080943FC @ =gUnknown_080E1C5C
	ldrh r0, [r0]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
	b _0809446E
	.align 2, 0
_080943E4: .4byte gCurTask
_080943E8: .4byte gUnknown_030000BD
_080943EC: .4byte gUnknown_030000BF
_080943F0: .4byte gDispCnt
_080943F4: .4byte gBgScrollRegs
_080943F8: .4byte gUnknown_03000040
_080943FC: .4byte gUnknown_080E1C5C
_08094400:
	ldr r7, _08094480 @ =gDispCnt
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r5, _08094484 @ =gBgScrollRegs
	strh r3, [r5]
	strh r3, [r5, #2]
	mov r3, r8
	ldr r0, _08094488 @ =gUnknown_080E1C5C
	mov r8, r0
	ldrh r0, [r0, #0xe]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
	ldrb r0, [r6]
	ldr r1, _0809448C @ =gUnknown_030000BF
	adds r2, r4, r1
	cmp r0, #1
	bhi _08094436
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	ble _0809446E
_08094436:
	ldrh r0, [r7]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7]
	movs r0, #0
	strh r0, [r5, #4]
	movs r0, #0xa0
	strh r0, [r5, #6]
	ldr r7, _08094490 @ =gUnknown_03000040
	adds r3, r4, r7
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, #6
	ldrb r2, [r6]
	subs r2, #1
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xf
	add r1, r8
	ldrh r0, [r1]
	strh r0, [r3, #0x1c]
	adds r0, r3, #0
	bl sub_8002A3C
_0809446E:
	ldr r0, _08094494 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08094498 @ =sub_809449C
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094480: .4byte gDispCnt
_08094484: .4byte gBgScrollRegs
_08094488: .4byte gUnknown_080E1C5C
_0809448C: .4byte gUnknown_030000BF
_08094490: .4byte gUnknown_03000040
_08094494: .4byte gCurTask
_08094498: .4byte sub_809449C

	thumb_func_start sub_809449C
sub_809449C: @ 0x0809449C
	push {r4, r5, r6, lr}
	ldr r6, _080944DC @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r1, _080944E0 @ =gUnknown_030000B0
	adds r4, r5, r1
	movs r1, #2
	strh r1, [r4, #2]
	bl sub_80945A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _080944D4
	movs r0, #0
	strh r0, [r4, #4]
	ldr r2, _080944E4 @ =gUnknown_030000BE
	adds r0, r5, r2
	strb r1, [r0]
	ldr r1, [r6]
	ldr r0, _080944E8 @ =sub_8094530
	str r0, [r1, #8]
_080944D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080944DC: .4byte gCurTask
_080944E0: .4byte gUnknown_030000B0
_080944E4: .4byte gUnknown_030000BE
_080944E8: .4byte sub_8094530

	thumb_func_start sub_80944EC
sub_80944EC: @ 0x080944EC
	push {r4, r5, lr}
	ldr r5, _08094524 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r2, _08094528 @ =gUnknown_030000B0
	adds r4, r1, r2
	movs r1, #1
	strh r1, [r4, #2]
	bl sub_80945A4
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809451E
	movs r0, #0
	strh r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, _0809452C @ =sub_8094570
	str r0, [r1, #8]
_0809451E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094524: .4byte gCurTask
_08094528: .4byte gUnknown_030000B0
_0809452C: .4byte sub_8094570

	thumb_func_start sub_8094530
sub_8094530: @ 0x08094530
	push {r4, r5, lr}
	ldr r5, _08094554 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	bl sub_80945A4
	ldr r0, _08094558 @ =gUnknown_030000C0
	adds r4, r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0809455C
	subs r0, #1
	str r0, [r4]
	b _08094566
	.align 2, 0
_08094554: .4byte gCurTask
_08094558: .4byte gUnknown_030000C0
_0809455C:
	movs r0, #0xb4
	str r0, [r4]
	ldr r1, [r5]
	ldr r0, _0809456C @ =sub_80944EC
	str r0, [r1, #8]
_08094566:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809456C: .4byte sub_80944EC

	thumb_func_start sub_8094570
sub_8094570: @ 0x08094570
	push {r4, lr}
	ldr r4, _08094588 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	ldr r2, _0809458C @ =gUnknown_030000C0
	adds r1, r0, r2
	ldr r0, [r1]
	cmp r0, #0
	beq _08094590
	subs r0, #1
	str r0, [r1]
	b _0809459A
	.align 2, 0
_08094588: .4byte gCurTask
_0809458C: .4byte gUnknown_030000C0
_08094590:
	bl sub_808B3FC_CreateIntro
	ldr r0, [r4]
	bl TaskDestroy
_0809459A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80945A0
sub_80945A0: @ 0x080945A0
	bx lr
	.align 2, 0

	thumb_func_start sub_80945A4
sub_80945A4: @ 0x080945A4
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0xbd
	ldrb r0, [r0]
	cmp r0, #0
	beq _080945DC
	adds r4, r2, #0
	adds r4, #0x80
	cmp r0, #3
	bls _080945D0
	adds r0, r2, #0
	adds r0, #0xbe
	ldrb r0, [r0]
	cmp r0, #0
	beq _080945D0
	ldr r1, _080945E4 @ =gUnknown_080E1CA0
	ldrh r0, [r1, #0x14]
	strh r0, [r4, #0xa]
	ldrb r1, [r1, #0x16]
	adds r0, r2, #0
	adds r0, #0xa0
	strb r1, [r0]
_080945D0:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080945DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080945E4: .4byte gUnknown_080E1CA0
