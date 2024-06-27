.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    @ Used in math_0.c
	thumb_func_start sub_8084B54
sub_8084B54: @ 0x08084B54
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r6, _08084C6C @ =gSineTable
	lsls r4, r2, #1
	adds r4, r4, r6
	ldrh r4, [r4]
	mov sl, r4
	mov r4, sl
	lsls r4, r4, #0x10
	mov sl, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov ip, r2
	mov r2, ip
	lsls r2, r2, #0x10
	mov ip, r2
	lsls r2, r1, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov r8, r2
	mov r2, r8
	lsls r2, r2, #0x10
	mov r8, r2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	mov sb, r1
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	lsls r1, r3, #1
	adds r1, r1, r6
	ldrh r5, [r1]
	lsls r5, r5, #0x10
	adds r3, r3, r4
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r4, [r3]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	mov r2, sb
	asrs r2, r2, #0x14
	mov sb, r2
	mov r2, sb
	muls r2, r4, r2
	asrs r2, r2, #0xa
	asrs r5, r5, #0x14
	mov r1, sl
	asrs r1, r1, #0x14
	mov sl, r1
	mov r3, sl
	muls r3, r5, r3
	asrs r3, r3, #0xa
	mov r1, r8
	asrs r1, r1, #0x14
	mov r8, r1
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	movs r6, #0
	strh r2, [r0, #2]
	mov r2, ip
	asrs r2, r2, #0x14
	mov ip, r2
	mov r1, ip
	muls r1, r5, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #4]
	rsbs r1, r4, #0
	mov r2, r8
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #6]
	rsbs r1, r5, #0
	mov r2, sb
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r3, sl
	muls r3, r4, r3
	asrs r3, r3, #0xa
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #8]
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xa]
	mov r2, r8
	muls r2, r5, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #0xc]
	mov r4, r8
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xe]
	mov r1, sl
	rsbs r1, r1, #0
	strh r1, [r0, #0x10]
	mov r2, sb
	mov r1, ip
	muls r1, r2, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0x12]
	str r6, [r0, #0x1c]
	str r6, [r0, #0x18]
	str r6, [r0, #0x14]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084C6C: .4byte gSineTable

    @ Unused
	thumb_func_start sub_8084C70
sub_8084C70: @ 0x08084C70
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r3, #0
	ldr r3, [r1]
	str r3, [r5, #0x14]
	ldr r4, [r1, #4]
	str r4, [r5, #0x18]
	ldr r1, [r1, #8]
	str r1, [r5, #0x1c]
	adds r6, r5, #0
	adds r6, #0xe
	ldr r0, [r2]
	subs r0, r0, r3
	movs r3, #0
	strh r0, [r5, #0xe]
	ldr r0, [r2, #4]
	subs r0, r0, r4
	strh r0, [r6, #2]
	ldr r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0x12
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084CB0
	rsbs r0, r0, #0
_08084CB0:
	cmp r0, #0x20
	ble _08084D02
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #0xe]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084D0C
_08084D02:
	strh r3, [r5, #0xe]
	strh r3, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0x12]
_08084D0C:
	adds r3, r5, #0
	adds r3, #0xe
	adds r4, r5, #2
	movs r6, #2
	ldrsh r1, [r7, r6]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r1, r0, r1
	movs r6, #4
	ldrsh r2, [r7, r6]
	movs r6, #2
	ldrsh r0, [r3, r6]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r0, #0
	mov ip, r0
	strh r1, [r5, #2]
	movs r2, #4
	ldrsh r1, [r7, r2]
	movs r6, #0xe
	ldrsh r0, [r5, r6]
	muls r0, r1, r0
	movs r1, #0
	ldrsh r2, [r7, r1]
	movs r6, #4
	ldrsh r1, [r3, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	movs r6, #2
	ldrsh r2, [r7, r6]
	movs r6, #0xe
	ldrsh r1, [r5, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r1, #4
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r6, #6
	ldrsh r1, [r5, r6]
	adds r0, r0, r1
	adds r7, r3, #0
	cmp r0, #0
	bge _08084D7C
	rsbs r0, r0, #0
_08084D7C:
	cmp r0, #0x20
	ble _08084DCE
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #2
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #2]
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	b _08084DDA
_08084DCE:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #2]
	mov r3, ip
	strh r3, [r5, #4]
	strh r3, [r5, #6]
_08084DDA:
	adds r6, r5, #0
	adds r6, #8
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r2, #4
	ldrsh r0, [r4, r2]
	muls r1, r0, r1
	movs r3, #4
	ldrsh r2, [r7, r3]
	movs r3, #2
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r3, #0
	strh r1, [r5, #8]
	movs r0, #4
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	mov ip, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	mov r2, ip
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r4, #2
	ldrsh r2, [r7, r4]
	movs r4, #2
	ldrsh r1, [r5, r4]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r0, #8
	ldrsh r2, [r5, r0]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0xc
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084E4A
	rsbs r0, r0, #0
_08084E4A:
	cmp r0, #0x20
	ble _08084E9C
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #8]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084EA6
_08084E9C:
	strh r3, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0xa]
	strh r3, [r5, #0xc]
_08084EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
    
    @ Called in math_0.s (unused sub_80851E0)
	thumb_func_start sub_8084EAC
sub_8084EAC: @ 0x08084EAC
	ldrh r2, [r0, #4]
	ldrh r3, [r0, #8]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #8]
	eors r2, r1
	strh r2, [r0, #4]
	ldrh r2, [r0, #6]
	ldrh r3, [r0, #0xe]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0xe]
	eors r2, r1
	strh r2, [r0, #6]
	ldrh r2, [r0, #0xc]
	ldrh r3, [r0, #0x10]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0x10]
	eors r2, r1
	strh r2, [r0, #0xc]
	bx lr
	.align 2, 0

    @ Unused
	thumb_func_start sub_8084EE0
sub_8084EE0: @ 0x08084EE0
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
	thumb_func_start sub_80851E0
sub_80851E0: @ 0x080851E0
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
	thumb_func_start sub_8085314
sub_8085314: @ 0x08085314
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r2, #0
	ldrsh r3, [r1, r2]
	lsls r3, r3, #1
	movs r5, #2
	ldrsh r4, [r1, r5]
	lsls r4, r4, #1
	movs r7, #4
	ldrsh r6, [r1, r7]
	lsls r6, r6, #1
	movs r5, #6
	ldrsh r2, [r1, r5]
	adds r5, r3, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	str r5, [sp]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r5, r7, #0
	lsls r5, r5, #6
	mov ip, r5
	adds r7, r6, #0
	muls r7, r2, r7
	adds r2, r7, #0
	lsls r2, r2, #6
	mov sb, r2
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r7, r3, #0
	muls r7, r2, r7
	adds r3, r7, #0
	lsls r3, r3, #6
	mov r8, r3
	adds r3, r4, #0
	muls r3, r2, r3
	lsls r3, r3, #6
	adds r5, r6, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	movs r7, #2
	ldrsh r2, [r1, r7]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r4, r7, #0
	lsls r4, r4, #6
	mov sl, r4
	adds r4, r6, #0
	muls r4, r2, r4
	lsls r4, r4, #6
	movs r7, #4
	ldrsh r1, [r1, r7]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r2, r2, #6
	mov r1, sl
	asrs r1, r1, #0x10
	mov sl, r1
	asrs r2, r2, #0x10
	adds r1, r1, r2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r6, r7, #0
	subs r1, r6, r1
	movs r7, #0
	str r7, [r0, #0x14]
	strh r1, [r0, #2]
	asrs r3, r3, #0x10
	mov r1, sb
	asrs r1, r1, #0x10
	mov sb, r1
	subs r1, r3, r1
	strh r1, [r0, #4]
	asrs r5, r5, #0x10
	mov r7, ip
	asrs r7, r7, #0x10
	adds r1, r5, r7
	strh r1, [r0, #6]
	add r3, sb
	strh r3, [r0, #8]
	mov r1, r8
	asrs r1, r1, #0x10
	mov r8, r1
	add r2, r8
	subs r2, r6, r2
	strh r2, [r0, #0xa]
	asrs r4, r4, #0x10
	ldr r2, [sp]
	asrs r3, r2, #0x10
	subs r1, r4, r3
	strh r1, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	adds r4, r4, r3
	strh r4, [r0, #0x10]
	add r8, sl
	mov r3, r8
	subs r6, r6, r3
	strh r6, [r0, #0x12]
	ldr r4, [r0, #0x14]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
