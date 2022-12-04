.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807B3E4
sub_807B3E4: @ 0x0807B3E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0807B40C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _0807B410 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807B418
	ldr r0, _0807B414 @ =sub_807B89C
	str r0, [r2, #8]
	b _0807B4FE
	.align 2, 0
_0807B40C: .4byte gCurTask
_0807B410: .4byte gPlayer
_0807B414: .4byte sub_807B89C
_0807B418:
	adds r0, r5, #0
	bl sub_807B8FC
	ldr r0, [r4, #0xc]
	ldr r1, _0807B524 @ =0xFFFFFC00
	adds r0, r0, r1
	str r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #0x40]
	subs r1, #0x30
	cmp r0, r1
	bgt _0807B43A
	lsls r0, r1, #8
	str r0, [r4, #0xc]
	adds r0, r5, #0
	bl sub_807B74C
_0807B43A:
	adds r2, r4, #0
	adds r2, #0x5c
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807B44E
	ldr r0, [r4, #8]
	adds r0, #0x80
	str r0, [r4, #8]
_0807B44E:
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807B45E
	ldr r0, [r4, #8]
	subs r0, #0x80
	str r0, [r4, #8]
_0807B45E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r6, r4, #0
	adds r6, #0x38
	ldrb r2, [r6]
	ldr r7, _0807B528 @ =sub_801EB44
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B48A
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_0807B48A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	ldrb r2, [r6]
	movs r3, #8
	rsbs r3, r3, #0
	mov r8, r3
	str r7, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0807B4B4
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
_0807B4B4:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrb r2, [r6]
	ldr r7, _0807B52C @ =sub_801EC3C
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B4DA
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807B4DA:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrb r2, [r6]
	str r7, [sp]
	mov r3, r8
	bl sub_801F100
	cmp r0, #0
	bge _0807B4FE
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
_0807B4FE:
	adds r0, r5, #0
	bl sub_807B9A4
	cmp r0, #0
	bne _0807B50E
	adds r0, r5, #0
	bl sub_807B7BC
_0807B50E:
	bl sub_807BA70
	adds r0, r5, #0
	bl sub_807B930
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B524: .4byte 0xFFFFFC00
_0807B528: .4byte sub_801EB44
_0807B52C: .4byte sub_801EC3C

	thumb_func_start sub_807B530
sub_807B530: @ 0x0807B530
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0807B55C @ =gCurTask
	ldr r2, [r0]
	ldrh r6, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	ldr r4, _0807B560 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807B568
	ldr r0, _0807B564 @ =sub_807B89C
	str r0, [r2, #8]
	b _0807B730
	.align 2, 0
_0807B55C: .4byte gCurTask
_0807B560: .4byte gPlayer
_0807B564: .4byte sub_807B89C
_0807B568:
	adds r0, r5, #0
	bl sub_807B8FC
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807B5B8
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0807B5A4 @ =IWRAM_START + 0x44
	adds r1, r6, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	adds r0, #0x10
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r0, r2
	ble _0807B5A8
	strh r2, [r1]
	b _0807B5B8
	.align 2, 0
_0807B5A4: .4byte IWRAM_START + 0x44
_0807B5A8:
	adds r0, r3, #0
	adds r0, #0x2f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3e
	bhi _0807B5B8
	movs r0, #0x20
	strh r0, [r1]
_0807B5B8:
	ldr r2, _0807B5F0 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r7, r2, #0
	adds r6, r5, #0
	adds r6, #0x44
	cmp r0, #0
	beq _0807B608
	ldr r0, [r7, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r7, #0x20]
	ldrh r2, [r6]
	adds r0, r2, #0
	subs r0, #0x10
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0807B5F4 @ =0xFFFFFE00
	cmp r0, r1
	bge _0807B5F8
	movs r0, #0xfe
	lsls r0, r0, #8
	b _0807B606
	.align 2, 0
_0807B5F0: .4byte gPlayer
_0807B5F4: .4byte 0xFFFFFE00
_0807B5F8:
	adds r0, r2, #0
	adds r0, #0xf
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3e
	bhi _0807B608
	ldr r0, _0807B710 @ =0x0000FFE0
_0807B606:
	strh r0, [r6]
_0807B608:
	adds r4, r7, #0
	movs r2, #0
	ldrsh r1, [r6, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r3, r5, #0
	adds r3, #0x46
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	ldr r1, _0807B714 @ =gSineTable
	adds r2, r5, #0
	adds r2, #0x48
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	strh r0, [r3]
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r2]
	subs r0, #4
	strb r0, [r2]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0x38
	adds r2, r2, r4
	mov r8, r2
	ldrb r2, [r2]
	ldr r3, _0807B718 @ =sub_801EB44
	mov sb, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B67C
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r0, #0x20
	strh r0, [r6]
_0807B67C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	movs r3, #8
	rsbs r3, r3, #0
	mov sl, r3
	mov r3, sb
	str r3, [sp]
	mov r3, sl
	bl sub_801F100
	cmp r0, #0
	bge _0807B6B0
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	subs r1, r1, r0
	str r1, [r4, #8]
	ldr r0, _0807B710 @ =0x0000FFE0
	strh r0, [r6]
_0807B6B0:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	ldr r6, _0807B71C @ =sub_801EC3C
	str r6, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807B6D8
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807B6D8:
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	mov r3, r8
	ldrb r2, [r3]
	str r6, [sp]
	mov r3, sl
	bl sub_801F100
	cmp r0, #0
	bge _0807B6FE
	lsls r1, r0, #8
	ldr r0, [r7, #0xc]
	subs r0, r0, r1
	str r0, [r7, #0xc]
_0807B6FE:
	adds r0, r5, #0
	bl sub_807B9A4
	cmp r0, #0
	bne _0807B720
	adds r0, r5, #0
	bl sub_807B7BC
	b _0807B730
	.align 2, 0
_0807B710: .4byte 0x0000FFE0
_0807B714: .4byte gSineTable
_0807B718: .4byte sub_801EB44
_0807B71C: .4byte sub_801EC3C
_0807B720:
	adds r0, r5, #0
	bl sub_807B9F0
	cmp r0, #0
	bne _0807B730
	adds r0, r5, #0
	bl sub_807B7BC
_0807B730:
	bl sub_807BA70
	adds r0, r5, #0
	bl sub_807B930
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807B74C
sub_807B74C: @ 0x0807B74C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0807B77C @ =gSineTable
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	subs r1, #2
	strh r0, [r1]
	ldr r1, _0807B780 @ =gPlayer
	ldrh r0, [r1, #0x10]
	adds r2, #0x44
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _0807B784
	movs r0, #0x20
	strh r0, [r2]
	b _0807B7A8
	.align 2, 0
_0807B77C: .4byte gSineTable
_0807B780: .4byte gPlayer
_0807B784:
	cmp r0, #0
	bge _0807B794
	ldr r0, _0807B790 @ =0x0000FFE0
	strh r0, [r2]
	b _0807B7A8
	.align 2, 0
_0807B790: .4byte 0x0000FFE0
_0807B794:
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	movs r1, #0x20
	cmp r0, #0
	beq _0807B7A6
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r1, r0, #0
_0807B7A6:
	strh r1, [r2]
_0807B7A8:
	ldr r0, _0807B7B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B7B8 @ =sub_807B530
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807B7B4: .4byte gCurTask
_0807B7B8: .4byte sub_807B530

	thumb_func_start sub_807B7BC
sub_807B7BC: @ 0x0807B7BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0807B818 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807B81C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r5, #0
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x48
	ldrb r1, [r3]
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x7e
	bls _0807B7FC
	adds r1, #0x40
	movs r0, #0x80
	subs r0, r0, r1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #0xa
	rsbs r0, r0, #0
	asrs r0, r0, #7
	strh r0, [r2, #0x12]
	cmp r0, #0
	ble _0807B7FE
_0807B7FC:
	strh r5, [r2, #0x12]
_0807B7FE:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r2, #0x10]
	ldr r0, _0807B820 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B824 @ =sub_807B89C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B818: .4byte gPlayer
_0807B81C: .4byte 0xFFBFFFFF
_0807B820: .4byte gCurTask
_0807B824: .4byte sub_807B89C

	thumb_func_start sub_807B828
sub_807B828: @ 0x0807B828
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807B88C @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B894
	ldr r2, [r4, #0x3c]
	ldr r1, _0807B890 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x40]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x4a
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807B894
	adds r0, #0x94
	cmp r0, r1
	blt _0807B894
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x40
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807B894
	adds r0, r3, #0
	adds r0, #0x40
	cmp r0, r2
	blt _0807B894
	movs r0, #1
	b _0807B896
	.align 2, 0
_0807B88C: .4byte gPlayer
_0807B890: .4byte gCamera
_0807B894:
	movs r0, #0
_0807B896:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807B89C
sub_807B89C: @ 0x0807B89C
	push {r4, lr}
	ldr r0, _0807B8CC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807B828
	cmp r0, #0
	beq _0807B8BA
	adds r0, r4, #0
	bl sub_807B8E0
_0807B8BA:
	adds r0, r4, #0
	bl sub_807B95C
	cmp r0, #0
	beq _0807B8D0
	adds r0, r4, #0
	bl sub_807BA3C
	b _0807B8DA
	.align 2, 0
_0807B8CC: .4byte gCurTask
_0807B8D0:
	bl sub_807BA70
	adds r0, r4, #0
	bl sub_807B930
_0807B8DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807B8E0
sub_807B8E0: @ 0x0807B8E0
	push {lr}
	bl sub_807B8FC
	ldr r0, _0807B8F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B8F8 @ =sub_807B3E4
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807B8F4: .4byte gCurTask
_0807B8F8: .4byte sub_807B3E4

	thumb_func_start sub_807B8FC
sub_807B8FC: @ 0x0807B8FC
	push {r4, lr}
	ldr r4, _0807B92C @ =gPlayer
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r4, #0x64
	movs r0, #0x2c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B92C: .4byte gPlayer

	thumb_func_start sub_807B930
sub_807B930: @ 0x0807B930
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807BA54
	adds r0, #0x30
	ldr r1, [r4, #0x3c]
	ldr r3, _0807B958 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x16]
	ldr r1, [r4, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x18]
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B958: .4byte gCamera

	thumb_func_start sub_807B95C
sub_807B95C: @ 0x0807B95C
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B998 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
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
	bhi _0807B994
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B994
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B99C
_0807B994:
	movs r0, #1
	b _0807B99E
	.align 2, 0
_0807B998: .4byte gCamera
_0807B99C:
	movs r0, #0
_0807B99E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B9A4
sub_807B9A4: @ 0x0807B9A4
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807B9E0 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807B9E8
	ldr r1, [r2, #0x3c]
	ldr r0, _0807B9E4 @ =gCamera
	ldr r2, [r0]
	subs r1, r1, r2
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	adds r1, r3, #0
	subs r1, #0x4a
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807B9E8
	adds r0, r3, #0
	adds r0, #0x4a
	cmp r0, r2
	blt _0807B9E8
	movs r0, #1
	b _0807B9EA
	.align 2, 0
_0807B9E0: .4byte gPlayer
_0807B9E4: .4byte gCamera
_0807B9E8:
	movs r0, #0
_0807B9EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B9F0
sub_807B9F0: @ 0x0807B9F0
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807BA2C @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807BA34
	ldr r1, [r2, #0x40]
	ldr r0, _0807BA30 @ =gCamera
	ldr r2, [r0, #4]
	subs r1, r1, r2
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	adds r1, r3, #0
	subs r1, #0x60
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807BA34
	adds r0, r3, #0
	adds r0, #0x40
	cmp r0, r2
	blt _0807BA34
	movs r0, #1
	b _0807BA36
	.align 2, 0
_0807BA2C: .4byte gPlayer
_0807BA30: .4byte gCamera
_0807BA34:
	movs r0, #0
_0807BA36:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807BA3C
sub_807BA3C: @ 0x0807BA3C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807BA50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807BA50: .4byte gCurTask

	thumb_func_start sub_807BA54
sub_807BA54: @ 0x0807BA54
	ldr r0, _0807BA6C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807BA6C: .4byte gCurTask

	thumb_func_start sub_807BA70
sub_807BA70: @ 0x0807BA70
	ldr r0, _0807BA90 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r1, [r0, #6]
	ldr r0, _0807BA94 @ =IWRAM_START + 0x62
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807BA90: .4byte gCurTask
_0807BA94: .4byte IWRAM_START + 0x62

	thumb_func_start initSprite_Interactable_SkyCanyon_GiantPropeller
initSprite_Interactable_SkyCanyon_GiantPropeller: @ 0x0807BA98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807BB08 @ =sub_807B89C
	ldr r2, _0807BB0C @ =0x00002010
	ldr r1, _0807BB10 @ =sub_807BB14
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	strh r4, [r2, #4]
	strh r5, [r2, #6]
	mov r0, r8
	str r0, [r2]
	ldrb r0, [r0]
	strb r0, [r2, #8]
	strb r6, [r2, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB08: .4byte sub_807B89C
_0807BB0C: .4byte 0x00002010
_0807BB10: .4byte sub_807BB14

	thumb_func_start sub_807BB14
sub_807BB14: @ 0x0807BB14
	bx lr
	.align 2, 0

	thumb_func_start initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill
initSprite_Interactable_SkyCanyon_SmallSpinnyWindmill: @ 0x0807BB18
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807BBF4 @ =sub_807C068
	ldr r2, _0807BBF8 @ =0x00002010
	ldr r1, _0807BBFC @ =sub_807C178
	str r1, [sp]
	movs r1, #0x48
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	mov r3, sb
	ldrb r1, [r3, #3]
	ldr r3, _0807BC00 @ =IWRAM_START + 0x3C
	adds r0, r5, r3
	movs r3, #0
	strb r1, [r0]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x44]
	movs r0, #0
	mov sl, r0
	strh r4, [r2, #4]
	strh r6, [r2, #6]
	mov r1, sb
	str r1, [r2]
	ldrb r0, [r1]
	strb r0, [r2, #8]
	mov r0, r8
	strb r0, [r2, #9]
	ldr r1, _0807BC04 @ =IWRAM_START + 0xC
	adds r4, r5, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r3, [r4, #8]
	strh r3, [r4, #0x14]
	strh r3, [r4, #0x1c]
	ldr r3, _0807BC08 @ =IWRAM_START + 0x2D
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807BC0C @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807BC10 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r3, sl
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x20
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807BC14 @ =0x00000249
	strh r0, [r4, #0xa]
	ldr r0, _0807BC18 @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	movs r0, #2
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sb
	strb r0, [r3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBF4: .4byte sub_807C068
_0807BBF8: .4byte 0x00002010
_0807BBFC: .4byte sub_807C178
_0807BC00: .4byte IWRAM_START + 0x3C
_0807BC04: .4byte IWRAM_START + 0xC
_0807BC08: .4byte IWRAM_START + 0x2D
_0807BC0C: .4byte IWRAM_START + 0x2E
_0807BC10: .4byte IWRAM_START + 0x31
_0807BC14: .4byte 0x00000249
_0807BC18: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_807BC1C
sub_807BC1C: @ 0x0807BC1C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	bl sub_8029FF0
	ldr r2, _0807BC58 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x64
	movs r0, #4
	strh r0, [r2]
	movs r0, #0x6d
	bl m4aSongNumStart
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BCA0
	lsls r0, r0, #2
	ldr r1, _0807BC5C @ =_0807BC60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BC58: .4byte gPlayer
_0807BC5C: .4byte _0807BC60
_0807BC60: @ jump table
	.4byte _0807BC80 @ case 0
	.4byte _0807BC80 @ case 1
	.4byte _0807BC88 @ case 2
	.4byte _0807BC88 @ case 3
	.4byte _0807BC90 @ case 4
	.4byte _0807BC90 @ case 5
	.4byte _0807BC98 @ case 6
	.4byte _0807BC98 @ case 7
_0807BC80:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0xa0
	b _0807BC9E
_0807BC88:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0xe0
	b _0807BC9E
_0807BC90:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0x60
	b _0807BC9E
_0807BC98:
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0x20
_0807BC9E:
	strb r0, [r1]
_0807BCA0:
	movs r0, #0x3e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r3, _0807BD08 @ =gPlayer
	ldr r2, _0807BD0C @ =gSineTable
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r4, #0x40]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r3, #8]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r4, #0x44]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r3, #0xc]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BD50
	lsls r0, r0, #2
	ldr r1, _0807BD10 @ =_0807BD14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BD08: .4byte gPlayer
_0807BD0C: .4byte gSineTable
_0807BD10: .4byte _0807BD14
_0807BD14: @ jump table
	.4byte _0807BD34 @ case 0
	.4byte _0807BD44 @ case 1
	.4byte _0807BD34 @ case 2
	.4byte _0807BD44 @ case 3
	.4byte _0807BD34 @ case 4
	.4byte _0807BD44 @ case 5
	.4byte _0807BD34 @ case 6
	.4byte _0807BD44 @ case 7
_0807BD34:
	movs r0, #0
	ldr r1, _0807BD40 @ =0x00000249
	strh r1, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	b _0807BD4E
	.align 2, 0
_0807BD40: .4byte 0x00000249
_0807BD44:
	ldr r0, _0807BD70 @ =0x00000249
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
_0807BD4E:
	strb r0, [r1]
_0807BD50:
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_8004558
	ldr r0, _0807BD74 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807BD78 @ =sub_807C0B4
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD70: .4byte 0x00000249
_0807BD74: .4byte gCurTask
_0807BD78: .4byte sub_807C0B4

	thumb_func_start sub_807BD7C
sub_807BD7C: @ 0x0807BD7C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802A004
	ldr r1, _0807BDB4 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0807BE4E
	ldr r0, _0807BDB8 @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r1, #0x20]
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BE4E
	lsls r0, r0, #2
	ldr r1, _0807BDBC @ =_0807BDC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BDB4: .4byte gPlayer
_0807BDB8: .4byte 0xFFBFFFFF
_0807BDBC: .4byte _0807BDC0
_0807BDC0: @ jump table
	.4byte _0807BDF8 @ case 0
	.4byte _0807BDE0 @ case 1
	.4byte _0807BE38 @ case 2
	.4byte _0807BDF8 @ case 3
	.4byte _0807BE0C @ case 4
	.4byte _0807BE24 @ case 5
	.4byte _0807BE24 @ case 6
	.4byte _0807BE38 @ case 7
_0807BDE0:
	ldr r2, _0807BDF4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0xf8
	lsls r0, r0, #8
	b _0807BE4A
	.align 2, 0
_0807BDF4: .4byte gPlayer
_0807BDF8:
	ldr r0, _0807BE08 @ =gPlayer
	movs r1, #0
	strh r1, [r0, #0x10]
	movs r1, #0xf8
	lsls r1, r1, #8
	strh r1, [r0, #0x12]
	b _0807BE4E
	.align 2, 0
_0807BE08: .4byte gPlayer
_0807BE0C:
	ldr r2, _0807BE20 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0xf8
	lsls r0, r0, #8
	b _0807BE4A
	.align 2, 0
_0807BE20: .4byte gPlayer
_0807BE24:
	ldr r0, _0807BE34 @ =gPlayer
	movs r1, #0
	strh r1, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #0x12]
	b _0807BE4E
	.align 2, 0
_0807BE34: .4byte gPlayer
_0807BE38:
	ldr r2, _0807BE64 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #4
_0807BE4A:
	strh r0, [r2, #0x10]
	strh r1, [r2, #0x12]
_0807BE4E:
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0807BE68 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807BE6C @ =sub_807C110
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE64: .4byte gPlayer
_0807BE68: .4byte gCurTask
_0807BE6C: .4byte sub_807C110

	thumb_func_start sub_807BE70
sub_807BE70: @ 0x0807BE70
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _0807BEC0
	lsls r0, r0, #2
	ldr r1, _0807BE88 @ =_0807BE8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BE88: .4byte _0807BE8C
_0807BE8C: @ jump table
	.4byte _0807BEAC @ case 0
	.4byte _0807BEB6 @ case 1
	.4byte _0807BEAC @ case 2
	.4byte _0807BEB6 @ case 3
	.4byte _0807BEAC @ case 4
	.4byte _0807BEB6 @ case 5
	.4byte _0807BEAC @ case 6
	.4byte _0807BEB6 @ case 7
_0807BEAC:
	adds r1, r3, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	adds r0, #8
	b _0807BEBE
_0807BEB6:
	adds r1, r3, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	subs r0, #8
_0807BEBE:
	strb r0, [r1]
_0807BEC0:
	ldr r4, _0807BF2C @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	movs r1, #0x3f
	adds r1, r1, r3
	mov ip, r1
	cmp r0, #0
	bne _0807BF10
	ldr r2, _0807BF30 @ =gSineTable
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r3, #0x40]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r4, #8]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r3, #0x44]
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0807BF10:
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x3e
	mov r3, ip
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807BF22
	movs r2, #1
_0807BF22:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807BF2C: .4byte gPlayer
_0807BF30: .4byte gSineTable

	thumb_func_start sub_807BF34
sub_807BF34: @ 0x0807BF34
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0807BFC4 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807BF46
	b _0807C05E
_0807BF46:
	ldr r2, [r5, #0x40]
	ldr r0, _0807BFC8 @ =gCamera
	ldr r1, [r0]
	subs r2, r2, r1
	ldr r3, [r5, #0x44]
	ldr r4, [r0, #4]
	subs r3, r3, r4
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	subs r1, r1, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov ip, r2
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	subs r2, r2, r7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	subs r0, r3, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r2, #0
	muls r1, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _0807C05E
	cmp r7, ip
	bgt _0807BFFE
	cmp r4, r3
	bgt _0807BFD0
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807BFB2
	rsbs r1, r1, #0
_0807BFB2:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807BFBC
	rsbs r0, r0, #0
_0807BFBC:
	cmp r1, r0
	bgt _0807BFCC
	movs r0, #2
	b _0807C060
	.align 2, 0
_0807BFC4: .4byte gPlayer
_0807BFC8: .4byte gCamera
_0807BFCC:
	movs r0, #1
	b _0807C060
_0807BFD0:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807BFE8
	rsbs r1, r1, #0
_0807BFE8:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807BFF2
	rsbs r0, r0, #0
_0807BFF2:
	cmp r1, r0
	bgt _0807BFFA
	movs r0, #5
	b _0807C060
_0807BFFA:
	movs r0, #6
	b _0807C060
_0807BFFE:
	cmp r4, r3
	bgt _0807C030
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807C01A
	rsbs r1, r1, #0
_0807C01A:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807C024
	rsbs r0, r0, #0
_0807C024:
	cmp r1, r0
	bgt _0807C02C
	movs r0, #3
	b _0807C060
_0807C02C:
	movs r0, #4
	b _0807C060
_0807C030:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807C05E
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _0807C048
	rsbs r1, r1, #0
_0807C048:
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0807C052
	rsbs r0, r0, #0
_0807C052:
	cmp r1, r0
	bgt _0807C05A
	movs r0, #8
	b _0807C060
_0807C05A:
	movs r0, #7
	b _0807C060
_0807C05E:
	movs r0, #0
_0807C060:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C068
sub_807C068: @ 0x0807C068
	push {r4, r5, lr}
	ldr r0, _0807C0A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_807BF34
	ldr r1, _0807C0A4 @ =IWRAM_START + 0x3D
	adds r4, r4, r1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C08E
	adds r0, r5, #0
	bl sub_807BC1C
_0807C08E:
	adds r0, r5, #0
	bl sub_807C20C
	cmp r0, #0
	beq _0807C0A8
	adds r0, r5, #0
	bl sub_807C25C
	b _0807C0AE
	.align 2, 0
_0807C0A0: .4byte gCurTask
_0807C0A4: .4byte IWRAM_START + 0x3D
_0807C0A8:
	adds r0, r5, #0
	bl sub_807C1C0
_0807C0AE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807C0B4
sub_807C0B4: @ 0x0807C0B4
	push {r4, r5, r6, lr}
	ldr r0, _0807C100 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	adds r0, #0xc
	adds r4, r5, r0
	adds r0, r6, #0
	bl sub_807BE70
	cmp r0, #0
	beq _0807C0D6
	adds r0, r6, #0
	bl sub_807BD7C
_0807C0D6:
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0807C0F4
	ldr r0, _0807C104 @ =0xFFFFBFFF
	ands r1, r0
	str r1, [r4, #0x10]
	ldr r0, _0807C108 @ =0x0000FFFF
	strh r0, [r4, #0x1e]
	ldr r0, _0807C10C @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
_0807C0F4:
	adds r0, r6, #0
	bl sub_807C1C0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C100: .4byte gCurTask
_0807C104: .4byte 0xFFFFBFFF
_0807C108: .4byte 0x0000FFFF
_0807C10C: .4byte IWRAM_START + 0x2D

	thumb_func_start sub_807C110
sub_807C110: @ 0x0807C110
	push {r4, lr}
	ldr r0, _0807C164 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0xc
	adds r2, r3, r0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0807C156
	ldr r0, _0807C168 @ =0xFFFFBFFF
	ands r1, r0
	str r1, [r2, #0x10]
	ldr r0, _0807C16C @ =0x0000FFFF
	strh r0, [r2, #0x1e]
	ldr r0, _0807C170 @ =IWRAM_START + 0x2D
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807C174 @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	ldrb r0, [r1]
	subs r0, #8
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C156
	adds r0, r4, #0
	bl sub_807C18C
_0807C156:
	adds r0, r4, #0
	bl sub_807C1C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C164: .4byte gCurTask
_0807C168: .4byte 0xFFFFBFFF
_0807C16C: .4byte 0x0000FFFF
_0807C170: .4byte IWRAM_START + 0x2D
_0807C174: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_807C178
sub_807C178: @ 0x0807C178
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807C18C
sub_807C18C: @ 0x0807C18C
	push {lr}
	adds r3, r0, #0
	adds r0, #0xc
	ldr r1, _0807C1B4 @ =0x00000249
	strh r1, [r0, #0xa]
	adds r2, r3, #0
	adds r2, #0x2c
	movs r1, #2
	strb r1, [r2]
	adds r2, #2
	movs r1, #0x10
	strb r1, [r2]
	bl sub_8004558
	ldr r0, _0807C1B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C1BC @ =sub_807C068
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C1B4: .4byte 0x00000249
_0807C1B8: .4byte gCurTask
_0807C1BC: .4byte sub_807C068

	thumb_func_start sub_807C1C0
sub_807C1C0: @ 0x0807C1C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r5, #0x40]
	ldr r2, _0807C204 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x44]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	ldr r1, _0807C208 @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte gCamera
_0807C208: .4byte 0xFFFFF3FF

	thumb_func_start sub_807C20C
sub_807C20C: @ 0x0807C20C
	push {lr}
	ldr r1, [r0, #0x40]
	ldr r3, _0807C250 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x44]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x8c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _0807C24A
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C24A
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C254
_0807C24A:
	movs r0, #1
	b _0807C256
	.align 2, 0
_0807C250: .4byte gCamera
_0807C254:
	movs r0, #0
_0807C256:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C25C
sub_807C25C: @ 0x0807C25C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C270 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C270: .4byte gCurTask

	thumb_func_start sub_807C274
sub_807C274: @ 0x0807C274
	push {r4, lr}
	ldr r0, _0807C2C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0807C2C8 @ =gSineTable
	adds r0, #0x49
	adds r2, r1, r0
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	ldr r3, _0807C2CC @ =IWRAM_START + 0x46
	adds r1, r1, r3
	strh r0, [r1]
	ldrb r0, [r2]
	adds r0, #2
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_807C424
	cmp r0, #0
	beq _0807C2B2
	adds r0, r4, #0
	bl sub_807C4A0
_0807C2B2:
	adds r0, r4, #0
	bl sub_807C598
	cmp r0, #0
	beq _0807C2D0
	adds r0, r4, #0
	bl sub_807C5E0
	b _0807C2DA
	.align 2, 0
_0807C2C4: .4byte gCurTask
_0807C2C8: .4byte gSineTable
_0807C2CC: .4byte IWRAM_START + 0x46
_0807C2D0:
	bl sub_807C614
	adds r0, r4, #0
	bl sub_807C558
_0807C2DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807C2E0
sub_807C2E0: @ 0x0807C2E0
	push {r4, r5, lr}
	ldr r0, _0807C328 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0807C32C @ =gSineTable
	adds r0, #0x49
	adds r4, r1, r0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	ldr r2, _0807C330 @ =IWRAM_START + 0x46
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_807C52C
	ldrb r1, [r4]
	movs r0, #0x40
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807C334
	cmp r0, #6
	ble _0807C336
	movs r1, #6
	b _0807C336
	.align 2, 0
_0807C328: .4byte gCurTask
_0807C32C: .4byte gSineTable
_0807C330: .4byte IWRAM_START + 0x46
_0807C334:
	movs r1, #4
_0807C336:
	adds r2, r5, #0
	adds r2, #0x49
	ldrb r0, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _0807C34E
	adds r0, r5, #0
	bl sub_807C4EC
_0807C34E:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C360
sub_807C360: @ 0x0807C360
	push {r4, lr}
	ldr r0, _0807C388 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x49
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bne _0807C38C
	adds r0, r4, #0
	bl sub_807C504
	b _0807C3C4
	.align 2, 0
_0807C388: .4byte gCurTask
_0807C38C:
	cmp r0, #0x80
	bls _0807C3AC
	ldr r1, _0807C3A8 @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	b _0807C3BE
	.align 2, 0
_0807C3A8: .4byte gSineTable
_0807C3AC:
	ldr r1, _0807C3D4 @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
_0807C3BE:
	ldr r2, _0807C3D8 @ =IWRAM_START + 0x46
	adds r0, r3, r2
	strh r1, [r0]
_0807C3C4:
	bl sub_807C614
	adds r0, r4, #0
	bl sub_807C558
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C3D4: .4byte gSineTable
_0807C3D8: .4byte IWRAM_START + 0x46

	thumb_func_start sub_807C3DC
sub_807C3DC: @ 0x0807C3DC
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807C40C @ =gPlayer
	adds r0, #0x5e
	ldr r1, _0807C410 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807C41E
	adds r2, r3, #0
	adds r2, #0x48
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807C41E
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807C414
	movs r0, #1
	b _0807C41A
	.align 2, 0
_0807C40C: .4byte gPlayer
_0807C410: .4byte gPlayerControls
_0807C414:
	movs r0, #0xfe
	ands r0, r1
	movs r1, #2
_0807C41A:
	orrs r0, r1
	strb r0, [r2]
_0807C41E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C424
sub_807C424: @ 0x0807C424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807C490 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807C498
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0807C498
	ldr r2, [r4, #0x3c]
	ldr r1, _0807C494 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x40]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807C498
	adds r0, #0x28
	cmp r0, r1
	blt _0807C498
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0xc
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807C498
	adds r0, r3, #0
	adds r0, #0xc
	cmp r0, r2
	blt _0807C498
	movs r0, #1
	b _0807C49A
	.align 2, 0
_0807C490: .4byte gPlayer
_0807C494: .4byte gCamera
_0807C498:
	movs r0, #0
_0807C49A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807C4A0
sub_807C4A0: @ 0x0807C4A0
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807C4DC @ =gPlayer
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r0, _0807C4E0 @ =0x0000FA80
	strh r0, [r3, #0x12]
	adds r0, r2, #0
	adds r0, #0x49
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	movs r0, #0x8e
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807C4E4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C4E8 @ =sub_807C2E0
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C4DC: .4byte gPlayer
_0807C4E0: .4byte 0x0000FA80
_0807C4E4: .4byte gCurTask
_0807C4E8: .4byte sub_807C2E0

	thumb_func_start sub_807C4EC
sub_807C4EC: @ 0x0807C4EC
	adds r0, #0x49
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807C4FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C500 @ =sub_807C6E4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C4FC: .4byte gCurTask
_0807C500: .4byte sub_807C6E4

	thumb_func_start sub_807C504
sub_807C504: @ 0x0807C504
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x49
	strb r2, [r0]
	ldr r0, _0807C524 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C528 @ =sub_807C274
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C524: .4byte gCurTask
_0807C528: .4byte sub_807C274

	thumb_func_start sub_807C52C
sub_807C52C: @ 0x0807C52C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807C550 @ =gPlayer
	adds r0, #0x5e
	ldr r1, _0807C554 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807C54C
	adds r2, r3, #0
	adds r2, #0x48
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
_0807C54C:
	pop {r0}
	bx r0
	.align 2, 0
_0807C550: .4byte gPlayer
_0807C554: .4byte gPlayerControls

	thumb_func_start sub_807C558
sub_807C558: @ 0x0807C558
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807C5F8
	ldr r2, [r4, #0x3c]
	ldr r3, _0807C594 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r2, r2, r1
	strh r2, [r0, #0x16]
	ldr r2, [r4, #0x40]
	ldr r1, [r3, #4]
	subs r2, r2, r1
	adds r4, #0x46
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r2, r2, r1
	strh r2, [r0, #0x18]
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C594: .4byte gCamera

	thumb_func_start sub_807C598
sub_807C598: @ 0x0807C598
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807C5D4 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
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
	bhi _0807C5D0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C5D0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C5D8
_0807C5D0:
	movs r0, #1
	b _0807C5DA
	.align 2, 0
_0807C5D4: .4byte gCamera
_0807C5D8:
	movs r0, #0
_0807C5DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C5E0
sub_807C5E0: @ 0x0807C5E0
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C5F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C5F4: .4byte gCurTask

	thumb_func_start sub_807C5F8
sub_807C5F8: @ 0x0807C5F8
	ldr r0, _0807C610 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807C610: .4byte gCurTask

	thumb_func_start sub_807C614
sub_807C614: @ 0x0807C614
	ldr r0, _0807C634 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r1, [r0, #6]
	ldr r0, _0807C638 @ =IWRAM_START + 0x60
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807C634: .4byte gCurTask
_0807C638: .4byte IWRAM_START + 0x60

	thumb_func_start initSprite_Interactable085
initSprite_Interactable085: @ 0x0807C63C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807C6CC @ =sub_807C274
	ldr r2, _0807C6D0 @ =0x00002010
	ldr r1, _0807C6D4 @ =sub_807C728
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r7, sb
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	ldr r1, _0807C6D8 @ =IWRAM_START + 0x44
	adds r0, r3, r1
	movs r6, #0
	movs r1, #0
	strh r1, [r0]
	ldr r7, _0807C6DC @ =IWRAM_START + 0x46
	adds r0, r3, r7
	strh r1, [r0]
	ldr r0, _0807C6E0 @ =IWRAM_START + 0x49
	adds r3, r3, r0
	strb r6, [r3]
	strh r4, [r2, #4]
	strh r5, [r2, #6]
	mov r1, sb
	str r1, [r2]
	ldrb r0, [r1]
	strb r0, [r2, #8]
	mov r7, r8
	strb r7, [r2, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r7, sb
	strb r0, [r7]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C6CC: .4byte sub_807C274
_0807C6D0: .4byte 0x00002010
_0807C6D4: .4byte sub_807C728
_0807C6D8: .4byte IWRAM_START + 0x44
_0807C6DC: .4byte IWRAM_START + 0x46
_0807C6E0: .4byte IWRAM_START + 0x49

	thumb_func_start sub_807C6E4
sub_807C6E4: @ 0x0807C6E4
	push {r4, r5, lr}
	ldr r0, _0807C720 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_807C3DC
	ldr r0, _0807C724 @ =IWRAM_START + 0x49
	adds r4, r4, r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C70E
	adds r0, r5, #0
	bl sub_807C72C
_0807C70E:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C720: .4byte gCurTask
_0807C724: .4byte IWRAM_START + 0x49

	thumb_func_start sub_807C728
sub_807C728: @ 0x0807C728
	bx lr
	.align 2, 0

	thumb_func_start sub_807C72C
sub_807C72C: @ 0x0807C72C
	adds r0, #0x49
	movs r1, #0x40
	strb r1, [r0]
	ldr r0, _0807C73C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C740 @ =sub_807C744
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C73C: .4byte gCurTask
_0807C740: .4byte sub_807C744

	thumb_func_start sub_807C744
sub_807C744: @ 0x0807C744
	push {r4, r5, lr}
	ldr r0, _0807C794 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0807C798 @ =gSineTable
	adds r0, #0x49
	adds r4, r1, r0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	ldr r2, _0807C79C @ =IWRAM_START + 0x46
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_807C3DC
	ldrb r0, [r4]
	adds r0, #8
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0807C784
	adds r0, r5, #0
	bl sub_807C7A0
_0807C784:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C794: .4byte gCurTask
_0807C798: .4byte gSineTable
_0807C79C: .4byte IWRAM_START + 0x46

	thumb_func_start sub_807C7A0
sub_807C7A0: @ 0x0807C7A0
	adds r0, #0x49
	movs r1, #0x80
	strb r1, [r0]
	ldr r0, _0807C7B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C7B4 @ =sub_807C360
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C7B0: .4byte gCurTask
_0807C7B4: .4byte sub_807C360

	thumb_func_start sub_807C7B8
sub_807C7B8: @ 0x0807C7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x30]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0807C980 @ =sub_807D06C
	movs r1, #0x96
	lsls r1, r1, #2
	ldr r2, _0807C984 @ =0x00002010
	ldr r3, _0807C988 @ =sub_807D118
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r0, [sp, #4]
	ldr r1, _0807C98C @ =IWRAM_START + 0x228
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r1]
	ldr r3, _0807C990 @ =IWRAM_START + 0x22C
	adds r3, r3, r2
	mov sl, r3
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3]
	ldr r4, _0807C994 @ =IWRAM_START + 0x230
	adds r0, r2, r4
	strh r6, [r0]
	movs r0, #3
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r1, _0807C998 @ =IWRAM_START + 0x234
	adds r1, r1, r2
	mov r8, r1
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r3, _0807C99C @ =IWRAM_START + 0x236
	adds r6, r2, r3
	strh r0, [r6]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r4, [r1]
	adds r0, r0, r4
	ldr r1, _0807C9A0 @ =IWRAM_START + 0x238
	adds r5, r2, r1
	strh r0, [r5]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	ldrh r3, [r6]
	adds r0, r0, r3
	ldr r4, _0807C9A4 @ =IWRAM_START + 0x23A
	adds r3, r2, r4
	strh r0, [r3]
	ldr r0, _0807C9A8 @ =IWRAM_START + 0x23C
	adds r0, r2, r0
	str r0, [sp, #8]
	movs r4, #0
	ldrsh r1, [r5, r4]
	str r1, [sp, #0xc]
	mov r1, r8
	movs r4, #0
	ldrsh r0, [r1, r4]
	ldr r4, [sp, #0xc]
	adds r1, r4, r0
	asrs r1, r1, #1
	mov r4, ip
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r1, [sp, #8]
	str r0, [r1]
	ldr r4, _0807C9AC @ =IWRAM_START + 0x240
	adds r4, r4, r2
	mov ip, r4
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov r4, sl
	ldr r0, [r4]
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1]
	ldrh r0, [r3]
	ldrh r1, [r6]
	subs r0, r0, r1
	ldr r3, _0807C9B0 @ =IWRAM_START + 0x244
	adds r1, r2, r3
	strh r0, [r1]
	ldrh r0, [r5]
	mov r4, r8
	ldrh r1, [r4]
	subs r0, r0, r1
	adds r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	ldrh r0, [r1]
	lsrs r0, r0, #2
	ldr r4, _0807C9B4 @ =IWRAM_START + 0x248
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _0807C9B8 @ =IWRAM_START + 0x24C
	adds r0, r2, r1
	str r7, [r0]
	ldrb r1, [r7]
	adds r3, #0xa
	adds r0, r2, r3
	strb r1, [r0]
	adds r4, #9
	adds r2, r2, r4
	mov r0, sb
	strb r0, [r2]
	movs r4, #0
	movs r1, #0
_0807C8CA:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	ldr r2, [sp, #4]
	adds r0, r2, r0
	str r1, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0807C8CA
	movs r0, #4
	bl VramMalloc
	ldr r3, [sp, #4]
	movs r4, #0x95
	lsls r4, r4, #2
	adds r1, r3, r4
	str r0, [r1]
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	mov sl, r0
	movs r6, #0
	ldr r1, _0807C9BC @ =gUnknown_080E0124
	mov r8, r1
	movs r2, #4
	add r2, r8
	mov sb, r2
_0807C904:
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r0, r2, #4
	movs r3, #0xcc
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r1, [sp, #4]
	adds r3, r1, r0
	strh r6, [r3, #8]
	strh r6, [r3, #0x14]
	strh r6, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r3, #0x28]
	str r5, [r3, #4]
	lsls r2, r2, #1
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3, #0xa]
	mov r0, r8
	adds r0, #2
	adds r0, r2, r0
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	add r2, sb
	ldrh r0, [r2]
	lsls r0, r0, #5
	adds r5, r5, r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0807C904
	ldr r0, [sp, #4]
	bl sub_807D1BC
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r7]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C980: .4byte sub_807D06C
_0807C984: .4byte 0x00002010
_0807C988: .4byte sub_807D118
_0807C98C: .4byte IWRAM_START + 0x228
_0807C990: .4byte IWRAM_START + 0x22C
_0807C994: .4byte IWRAM_START + 0x230
_0807C998: .4byte IWRAM_START + 0x234
_0807C99C: .4byte IWRAM_START + 0x236
_0807C9A0: .4byte IWRAM_START + 0x238
_0807C9A4: .4byte IWRAM_START + 0x23A
_0807C9A8: .4byte IWRAM_START + 0x23C
_0807C9AC: .4byte IWRAM_START + 0x240
_0807C9B0: .4byte IWRAM_START + 0x244
_0807C9B4: .4byte IWRAM_START + 0x248
_0807C9B8: .4byte IWRAM_START + 0x24C
_0807C9BC: .4byte gUnknown_080E0124

	thumb_func_start sub_807C9C0
sub_807C9C0: @ 0x0807C9C0
	push {r4, lr}
	mov ip, r0
	ldr r2, _0807CA58 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x2c
	strh r0, [r1]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r1, [r2, #8]
	adds r4, r2, #0
	movs r1, #0xc1
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0x40
	strb r0, [r1]
	movs r1, #0xc2
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	movs r0, #0x80
	strh r0, [r1]
	ldrh r0, [r4, #0x12]
	movs r1, #0xc3
	lsls r1, r1, #1
	add r1, ip
	strh r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	add r0, ip
	strh r3, [r0]
	movs r2, #0xc4
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r2]
	movs r2, #0xc6
	lsls r2, r2, #1
	add r2, ip
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r2]
	movs r0, #0xc8
	lsls r0, r0, #1
	add r0, ip
	str r3, [r0]
	movs r0, #0xca
	lsls r0, r0, #1
	add r0, ip
	str r3, [r0]
	ldr r0, _0807CA5C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807CA60 @ =sub_807D0C4
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA58: .4byte gPlayer
_0807CA5C: .4byte gCurTask
_0807CA60: .4byte sub_807D0C4

	thumb_func_start sub_807CA64
sub_807CA64: @ 0x0807CA64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	subs r0, #0x10
	lsls r5, r0, #8
	movs r2, #0xc3
	lsls r2, r2, #1
	adds r1, r4, r2
	ldrh r0, [r1]
	movs r7, #0
	ldrsh r3, [r1, r7]
	cmp r3, #0
	bgt _0807CAA4
	movs r6, #1
	subs r0, #0x40
	strh r0, [r1]
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0807CAA0 @ =0xFFFFFD00
	cmp r0, r2
	bge _0807CA9A
	adds r3, r2, #0
_0807CA9A:
	strh r3, [r1]
	b _0807CAC8
	.align 2, 0
_0807CAA0: .4byte 0xFFFFFD00
_0807CAA4:
	adds r2, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	cmp r3, r0
	ble _0807CAB0
	adds r2, r0, #0
_0807CAB0:
	strh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	rsbs r0, r0, #0
	asrs r0, r0, #4
	movs r3, #0x40
	rsbs r3, r3, #0
	cmp r0, r3
	ble _0807CAC4
	adds r0, r3, #0
_0807CAC4:
	adds r0, r2, r0
	strh r0, [r1]
_0807CAC8:
	ldr r2, _0807CB20 @ =gPlayer
	movs r7, #0xc3
	lsls r7, r7, #1
	adds r0, r4, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2, #0xc]
	adds r1, r0, r1
	str r1, [r2, #0xc]
	adds r0, r5, #0
	cmp r0, r1
	ble _0807CAE2
	adds r0, r1, #0
_0807CAE2:
	str r0, [r2, #0xc]
	movs r7, #0xc2
	lsls r7, r7, #1
	adds r3, r4, r7
	ldrh r0, [r3]
	adds r0, #0x40
	movs r5, #0
	strh r0, [r3]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0807CB02
	adds r2, r1, #0
_0807CB02:
	strh r2, [r3]
	movs r0, #0xc4
	lsls r0, r0, #1
	adds r2, r4, r0
	ldr r1, [r2]
	cmp r1, #0
	ble _0807CB24
	movs r7, #0
	ldrsh r0, [r3, r7]
	subs r0, r1, r0
	str r0, [r2]
	cmp r0, #0
	bge _0807CB44
	str r5, [r2]
	b _0807CB44
	.align 2, 0
_0807CB20: .4byte gPlayer
_0807CB24:
	cmp r1, #0
	bge _0807CB38
	movs r7, #0
	ldrsh r0, [r3, r7]
	adds r0, r1, r0
	str r0, [r2]
	cmp r0, #0
	ble _0807CB44
	str r5, [r2]
	b _0807CB44
_0807CB38:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r4, #0
	bl sub_807CC28
_0807CB44:
	ldr r2, _0807CB74 @ =gPlayer
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	movs r7, #0xc8
	lsls r7, r7, #1
	adds r1, r4, r7
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r0, #0
	cmp r6, #2
	bne _0807CB6E
	movs r0, #1
_0807CB6E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807CB74: .4byte gPlayer

	thumb_func_start sub_807CB78
sub_807CB78: @ 0x0807CB78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r3, _0807CBD0 @ =gPlayer
	movs r0, #0x8b
	lsls r0, r0, #2
	adds r2, r4, r0
	ldr r1, _0807CBD4 @ =0x00000236
	adds r0, r4, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3, #0xc]
	cmp r1, r0
	ble _0807CBDC
	movs r0, #0xc3
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	subs r0, #0x10
	strh r0, [r1]
	adds r3, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0807CBD8 @ =0xFFFFFD00
	cmp r0, r2
	bge _0807CBB4
	adds r3, r2, #0
_0807CBB4:
	strh r3, [r1]
	movs r3, #0xc6
	lsls r3, r3, #1
	adds r2, r4, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r4, #0
	bl sub_807CC28
	b _0807CBDE
	.align 2, 0
_0807CBD0: .4byte gPlayer
_0807CBD4: .4byte 0x00000236
_0807CBD8: .4byte 0xFFFFFD00
_0807CBDC:
	movs r5, #1
_0807CBDE:
	ldr r2, _0807CC24 @ =gPlayer
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	movs r3, #0xc4
	lsls r3, r3, #1
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	movs r6, #0xc8
	lsls r6, r6, #1
	adds r1, r4, r6
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	adds r3, #4
	adds r1, r4, r3
	ldr r1, [r1]
	adds r0, r0, r1
	adds r6, #4
	adds r1, r4, r6
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807CC24: .4byte gPlayer

	thumb_func_start sub_807CC28
sub_807CC28: @ 0x0807CC28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrh r5, [r0]
	ldr r2, _0807CCB4 @ =0x00000246
	adds r0, r6, r2
	ldrh r4, [r0]
	subs r1, #0xbc
	adds r0, r6, r1
	ldr r0, [r0]
	rsbs r0, r0, #0
	subs r2, #2
	adds r1, r6, r2
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	movs r5, #0xc8
	lsls r5, r5, #1
	adds r3, r6, r5
	asrs r0, r0, #0x10
	ldr r2, _0807CCB8 @ =gSineTable
	movs r1, #0xc1
	lsls r1, r1, #1
	adds r4, r6, r1
	ldrb r1, [r4]
	lsls r1, r1, #3
	adds r5, #0x70
	adds r1, r1, r5
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, #0x80
	strh r0, [r1]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0xc0
	lsls r3, r3, #3
	cmp r0, r3
	bls _0807CCA2
	adds r2, r3, #0
_0807CCA2:
	strh r2, [r1]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	adds r0, r0, r1
	strb r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CCB4: .4byte 0x00000246
_0807CCB8: .4byte gSineTable

	thumb_func_start sub_807CCBC
sub_807CCBC: @ 0x0807CCBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
	ldr r0, _0807CD64 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807CCDC
	movs r1, #1
	mov sl, r1
_0807CCDC:
	movs r2, #0
	mov r8, r2
_0807CCE0:
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #4
	movs r2, #0xcc
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r0, r7, r0
	bl sub_8004558
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0807CCE0
	movs r0, #0
	mov r8, r0
	ldr r1, _0807CD68 @ =gSineTable
	mov sb, r1
_0807CD0A:
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #3
	adds r6, r7, r0
	ldr r4, [r6]
	cmp r4, #0
	bne _0807CD7E
	mov r0, sl
	cmp r0, #0
	bne _0807CD22
	b _0807CE74
_0807CD22:
	bl Random
	ldr r2, _0807CD6C @ =gUnknown_080E0136
	movs r5, #7
	adds r1, r5, #0
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	str r0, [r6]
	bl Random
	strb r0, [r6, #4]
	str r4, [r6, #8]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807CD70
	bl Random
	adds r1, r5, #0
	ands r1, r0
	rsbs r1, r1, #0
	lsls r1, r1, #8
	b _0807CD74
	.align 2, 0
_0807CD64: .4byte gUnknown_03005590
_0807CD68: .4byte gSineTable
_0807CD6C: .4byte gUnknown_080E0136
_0807CD70:
	movs r1, #0x80
	lsls r1, r1, #6
_0807CD74:
	str r1, [r6, #0xc]
	movs r0, #0
	str r0, [r6, #0x10]
	str r0, [r6, #0x14]
	mov sl, r0
_0807CD7E:
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807CD88
	rsbs r0, r1, #0
_0807CD88:
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0807CDA0
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	ble _0807CD9C
	adds r2, r3, #0
_0807CD9C:
	adds r0, r2, #0
	b _0807CDA2
_0807CDA0:
	movs r0, #0x40
_0807CDA2:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r1, r0
	str r3, [r6, #0xc]
	cmp r3, #0
	ble _0807CE12
	rsbs r0, r3, #0
	str r0, [r6, #0x14]
	asrs r1, r3, #5
	ldr r2, _0807CE04 @ =0x00000246
	adds r0, r7, r2
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r2, r0, #0x10
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrh r1, [r0]
	cmp r1, r2
	bge _0807CDCE
	adds r1, r2, #0
_0807CDCE:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	asrs r1, r3, #8
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0807CE08
	adds r1, r2, #0
	cmp r0, #8
	ble _0807CE0A
	movs r1, #8
	b _0807CE0A
	.align 2, 0
_0807CE04: .4byte 0x00000246
_0807CE08:
	movs r1, #2
_0807CE0A:
	ldrb r0, [r6, #4]
	adds r0, r0, r1
	strb r0, [r6, #4]
	b _0807CE74
_0807CE12:
	asrs r0, r3, #8
	rsbs r0, r0, #0
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrh r2, [r1]
	cmp r0, r2
	bge _0807CE70
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	str r0, [r6, #0x14]
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r5, [r0]
	subs r2, #2
	adds r0, r7, r2
	ldrh r4, [r0]
	rsbs r0, r3, #0
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	asrs r0, r0, #0x10
	ldrb r1, [r6, #4]
	lsls r1, r1, #3
	add r1, sb
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	ldrb r0, [r6, #4]
	adds r0, #8
	strb r0, [r6, #4]
	b _0807CE74
_0807CE70:
	movs r0, #0
	str r0, [r6]
_0807CE74:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bhi _0807CE84
	b _0807CD0A
_0807CE84:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807CE94
sub_807CE94: @ 0x0807CE94
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r7, _0807CEEC @ =gCamera
_0807CE9C:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r4, r6, r0
	ldr r3, [r4]
	cmp r3, #0
	beq _0807CF1A
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r7]
	subs r2, r2, r0
	strh r2, [r3, #0x16]
	ldr r3, [r4]
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r2, [r0]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r7, #4]
	subs r2, r2, r0
	strh r2, [r3, #0x18]
	ldrb r0, [r4, #4]
	cmp r0, #0x7b
	bhi _0807CEF0
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0807CEF6
	.align 2, 0
_0807CEEC: .4byte gCamera
_0807CEF0:
	ldr r1, [r4]
	movs r0, #0x90
	lsls r0, r0, #3
_0807CEF6:
	strh r0, [r1, #0x1a]
	ldr r1, [r4, #0xc]
	ldr r0, _0807CF08 @ =0xFFFFF000
	cmp r1, r0
	ble _0807CF0C
	ldr r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #6
	b _0807CF12
	.align 2, 0
_0807CF08: .4byte 0xFFFFF000
_0807CF0C:
	ldr r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
_0807CF12:
	str r0, [r1, #0x10]
	adds r0, r1, #0
	bl sub_80051E8
_0807CF1A:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0807CE9C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807CF2C
sub_807CF2C: @ 0x0807CF2C
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	ldr r2, [r0]
	ldr r1, _0807CFA4 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0x8b
	lsls r4, r4, #2
	adds r0, r3, r4
	ldr r0, [r0]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807CF9E
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r0, r3, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807CF9E
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0807CFA8 @ =0x0000023A
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807CF9E
	subs r2, #4
	adds r0, r3, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807CFAC
_0807CF9E:
	movs r0, #1
	b _0807CFAE
	.align 2, 0
_0807CFA4: .4byte gCamera
_0807CFA8: .4byte 0x0000023A
_0807CFAC:
	movs r0, #0
_0807CFAE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807CFB4
sub_807CFB4: @ 0x0807CFB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _0807D058 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D060
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r2, _0807D05C @ =gCamera
	ldr r3, [r2]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r1, #4
	adds r0, r4, r1
	ldr r1, [r0]
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r3, [r1]
	subs r2, r6, r3
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807D060
	adds r0, r2, r3
	cmp r0, r1
	blt _0807D060
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrh r5, [r0]
	subs r2, #2
	adds r0, r4, r2
	ldrh r4, [r0]
	subs r0, r6, r1
	lsls r0, r0, #8
	adds r1, r3, #0
	bl __divsi3
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsrs r0, r0, #0x11
	subs r1, r1, r0
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807D060
	adds r0, r1, r3
	cmp r0, r2
	blt _0807D060
	movs r0, #1
	b _0807D062
	.align 2, 0
_0807D058: .4byte gPlayer
_0807D05C: .4byte gCamera
_0807D060:
	movs r0, #0
_0807D062:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807D06C
sub_807D06C: @ 0x0807D06C
	push {r4, lr}
	ldr r0, _0807D0A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807CFB4
	cmp r0, #0
	beq _0807D090
	ldr r0, _0807D0A8 @ =0x0000011D
	bl m4aSongNumStart
	adds r0, r4, #0
	bl sub_807C9C0
_0807D090:
	adds r0, r4, #0
	bl sub_807CF2C
	cmp r0, #0
	beq _0807D0AC
	adds r0, r4, #0
	bl sub_807D188
	b _0807D0BE
	.align 2, 0
_0807D0A4: .4byte gCurTask
_0807D0A8: .4byte 0x0000011D
_0807D0AC:
	adds r0, r4, #0
	bl sub_807CCBC
	adds r0, r4, #0
	bl sub_807CE94
	adds r0, r4, #0
	bl sub_807D16C
_0807D0BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D0C4
sub_807D0C4: @ 0x0807D0C4
	push {r4, lr}
	ldr r0, _0807D0E4 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807D0E8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D0F0
	ldr r0, _0807D0EC @ =sub_807D06C
	str r0, [r2, #8]
	b _0807D100
	.align 2, 0
_0807D0E4: .4byte gCurTask
_0807D0E8: .4byte gPlayer
_0807D0EC: .4byte sub_807D06C
_0807D0F0:
	adds r0, r4, #0
	bl sub_807CA64
	cmp r0, #0
	beq _0807D100
	adds r0, r4, #0
	bl sub_807D130
_0807D100:
	adds r0, r4, #0
	bl sub_807CCBC
	adds r0, r4, #0
	bl sub_807CE94
	adds r0, r4, #0
	bl sub_807D16C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D118
sub_807D118: @ 0x0807D118
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _0807D12C @ =IWRAM_START + 0x254
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0807D12C: .4byte IWRAM_START + 0x254

	thumb_func_start sub_807D130
sub_807D130: @ 0x0807D130
	mov ip, r0
	movs r1, #0xc4
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0
	str r0, [r1]
	movs r3, #0xc6
	lsls r3, r3, #1
	add r3, ip
	ldr r2, _0807D160 @ =gPlayer
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, ip
	ldr r1, [r0]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	str r0, [r3]
	ldr r0, _0807D164 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D168 @ =sub_807D268
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D160: .4byte gPlayer
_0807D164: .4byte gCurTask
_0807D168: .4byte sub_807D268

	thumb_func_start sub_807D16C
sub_807D16C: @ 0x0807D16C
	push {lr}
	ldr r0, _0807D180 @ =gUnknown_03005590
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807D17C
	ldr r0, _0807D184 @ =0x0000011D
	bl m4aSongNumStartOrContinue
_0807D17C:
	pop {r0}
	bx r0
	.align 2, 0
_0807D180: .4byte gUnknown_03005590
_0807D184: .4byte 0x0000011D

	thumb_func_start sub_807D188
sub_807D188: @ 0x0807D188
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D1B4 @ =0x0000011D
	bl m4aSongNumStop
	movs r1, #0x93
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, [r0]
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807D1B8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D1B4: .4byte 0x0000011D
_0807D1B8: .4byte gCurTask

	thumb_func_start sub_807D1BC
sub_807D1BC: @ 0x0807D1BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _0807D224 @ =gUnknown_080E0136
	mov r8, r0
	movs r7, #0
_0807D1CC:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r6, r4
	bl Random
	movs r1, #7
	ands r1, r0
	add r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r6, r0
	str r0, [r4]
	bl Random
	strb r0, [r4, #4]
	str r7, [r4, #8]
	bl Random
	movs r1, #0x3f
	ands r1, r0
	lsls r1, r1, #8
	rsbs r1, r1, #0
	str r1, [r4, #0xc]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0807D1CC
	adds r0, r6, #0
	bl sub_807CCBC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D224: .4byte gUnknown_080E0136

	thumb_func_start initSprite_Interactable086
initSprite_Interactable086: @ 0x0807D228
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807C7B8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable104
initSprite_Interactable104: @ 0x0807D248
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807C7B8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D268
sub_807D268: @ 0x0807D268
	push {r4, lr}
	ldr r0, _0807D288 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807D28C @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807D294
	ldr r0, _0807D290 @ =sub_807D06C
	str r0, [r2, #8]
	b _0807D2A4
	.align 2, 0
_0807D288: .4byte gCurTask
_0807D28C: .4byte gPlayer
_0807D290: .4byte sub_807D06C
_0807D294:
	adds r0, r4, #0
	bl sub_807CB78
	cmp r0, #0
	beq _0807D2A4
	adds r0, r4, #0
	bl sub_807D2BC
_0807D2A4:
	adds r0, r4, #0
	bl sub_807CCBC
	adds r0, r4, #0
	bl sub_807CE94
	adds r0, r4, #0
	bl sub_807D16C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D2BC
sub_807D2BC: @ 0x0807D2BC
	ldr r2, _0807D2E4 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807D2E8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0
	movs r0, #7
	strb r0, [r3]
	strh r1, [r2, #0x10]
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	ldr r0, _0807D2EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D2F0 @ =sub_807D06C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D2E4: .4byte gPlayer
_0807D2E8: .4byte 0xFFBFFFFF
_0807D2EC: .4byte gCurTask
_0807D2F0: .4byte sub_807D06C

	thumb_func_start sub_807D2F4
sub_807D2F4: @ 0x0807D2F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #4]
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _0807D430 @ =sub_807D7B0
	ldr r2, _0807D434 @ =0x00002010
	ldr r1, _0807D438 @ =sub_807D7F8
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r3, _0807D43C @ =IWRAM_START + 0x44
	adds r0, r4, r3
	movs r5, #0
	mov sl, r5
	mov r6, sp
	ldrh r6, [r6, #0x28]
	strh r6, [r0]
	ldr r0, _0807D440 @ =IWRAM_START + 0x52
	adds r1, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	ldr r3, [sp, #4]
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r5, r8
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	movs r0, #3
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r6, _0807D444 @ =IWRAM_START + 0x48
	adds r3, r4, r6
	strh r0, [r3]
	movs r0, #4
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	ldr r5, _0807D448 @ =IWRAM_START + 0x4A
	adds r1, r4, r5
	strh r0, [r1]
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	ldrh r6, [r3]
	adds r0, r0, r6
	ldr r6, _0807D44C @ =IWRAM_START + 0x4C
	adds r5, r4, r6
	strh r0, [r5]
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r6, #2
	adds r1, r4, r6
	strh r0, [r1]
	ldrh r0, [r5]
	ldrh r1, [r3]
	subs r0, r0, r1
	ldr r3, _0807D450 @ =IWRAM_START + 0x50
	adds r1, r4, r3
	strh r0, [r1]
	mov r5, sp
	ldrh r5, [r5, #4]
	strh r5, [r2, #4]
	mov r6, r8
	strh r6, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r0, sb
	strb r0, [r2, #9]
	ldr r1, _0807D454 @ =IWRAM_START + 0xC
	adds r5, r4, r1
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	mov r3, sl
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r6, _0807D458 @ =IWRAM_START + 0x2D
	adds r1, r4, r6
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807D45C @ =IWRAM_START + 0x2E
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807D460 @ =IWRAM_START + 0x31
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807D464 @ =0x0000024F
	strh r0, [r5, #0xa]
	subs r6, #1
	adds r4, r4, r6
	movs r0, #2
	strb r0, [r4]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0807D40E
	cmp r0, #2
	bne _0807D418
_0807D40E:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807D418:
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D430: .4byte sub_807D7B0
_0807D434: .4byte 0x00002010
_0807D438: .4byte sub_807D7F8
_0807D43C: .4byte IWRAM_START + 0x44
_0807D440: .4byte IWRAM_START + 0x52
_0807D444: .4byte IWRAM_START + 0x48
_0807D448: .4byte IWRAM_START + 0x4A
_0807D44C: .4byte IWRAM_START + 0x4C
_0807D450: .4byte IWRAM_START + 0x50
_0807D454: .4byte IWRAM_START + 0xC
_0807D458: .4byte IWRAM_START + 0x2D
_0807D45C: .4byte IWRAM_START + 0x2E
_0807D460: .4byte IWRAM_START + 0x31
_0807D464: .4byte 0x0000024F

	thumb_func_start sub_807D468
sub_807D468: @ 0x0807D468
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807D478
	cmp r0, #2
	bne _0807D494
_0807D478:
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r2, _0807D490 @ =gPlayer
	ldr r1, [r2, #8]
	subs r3, r0, r1
	b _0807D4A8
	.align 2, 0
_0807D490: .4byte gPlayer
_0807D494:
	ldr r2, _0807D4CC @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x48
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r2, #8]
	subs r3, r1, r0
_0807D4A8:
	adds r6, r2, #0
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	lsls r0, r1, #8
	subs r0, r0, r3
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0
	blt _0807D4D0
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807D4D2
	adds r0, r1, #0
	b _0807D4D2
	.align 2, 0
_0807D4CC: .4byte gPlayer
_0807D4D0:
	movs r0, #0
_0807D4D2:
	lsls r0, r0, #4
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r4, #0
	adds r0, #0x52
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r5, [r0]
	cmp r5, #0
	beq _0807D4FA
	cmp r5, #2
	bne _0807D558
_0807D4FA:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _0807D516
	ldrh r0, [r6, #0x14]
	subs r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807D820
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x10]
	subs r0, #0x40
	b _0807D572
_0807D516:
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r6, #8]
	subs r2, r0, r1
	str r2, [r6, #8]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, _0807D554 @ =0xFFFFD000
	adds r3, r0, r1
	cmp r5, #2
	beq _0807D53C
	cmp r2, r3
	ble _0807D53C
	str r3, [r6, #8]
_0807D53C:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807D5C4
	ldr r0, [r6, #0x20]
	movs r1, #1
	orrs r0, r1
	b _0807D5BC
	.align 2, 0
_0807D554: .4byte 0xFFFFD000
_0807D558:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	ble _0807D57E
	ldrh r0, [r6, #0x14]
	adds r0, #0x40
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807D820
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x10]
	adds r0, #0x40
_0807D572:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_807D820
	strh r0, [r6, #0x10]
	b _0807D5C4
_0807D57E:
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r6, #8]
	adds r2, r0, r1
	str r2, [r6, #8]
	adds r0, r4, #0
	adds r0, #0x48
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r3, r0, r1
	cmp r5, #3
	beq _0807D5A6
	cmp r2, r3
	bge _0807D5A6
	str r3, [r6, #8]
_0807D5A6:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807D5C4
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_0807D5BC:
	str r0, [r6, #0x20]
	ldrh r0, [r6, #0x14]
	rsbs r0, r0, #0
	strh r0, [r6, #0x14]
_0807D5C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807D5CC
sub_807D5CC: @ 0x0807D5CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0xc
	adds r0, #0x44
	ldrh r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0807D698
	ldr r0, _0807D5FC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd2
	lsls r1, r1, #1
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x3b
	bhi _0807D600
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #0
	b _0807D67A
	.align 2, 0
_0807D5FC: .4byte gUnknown_03005590
_0807D600:
	cmp r1, #0x77
	bhi _0807D630
	subs r1, #0x3c
	lsls r0, r1, #8
	movs r1, #0x3c
	bl __udivsi3
	adds r2, r0, #0
	adds r1, r4, #0
	adds r1, #0x52
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0807D62C
	adds r0, r2, #0
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r3, r2
	ble _0807D67A
	adds r0, r2, #0
	b _0807D67A
_0807D62C:
	movs r0, #0
	b _0807D67A
_0807D630:
	ldr r0, _0807D640 @ =0x00000167
	cmp r1, r0
	bhi _0807D644
	adds r1, r4, #0
	adds r1, #0x52
	subs r0, #0x67
	b _0807D67A
	.align 2, 0
_0807D640: .4byte 0x00000167
_0807D644:
	ldr r0, _0807D66C @ =0xFFFFFE98
	adds r1, r1, r0
	lsls r0, r1, #8
	movs r1, #0x3c
	bl __udivsi3
	adds r2, r0, #0
	adds r1, r4, #0
	adds r1, #0x52
	strh r2, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0807D670
	movs r3, #0x80
	lsls r3, r3, #1
	cmp r0, r3
	ble _0807D672
	adds r2, r3, #0
	b _0807D672
	.align 2, 0
_0807D66C: .4byte 0xFFFFFE98
_0807D670:
	movs r2, #0
_0807D672:
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	subs r0, r0, r2
_0807D67A:
	strh r0, [r1]
	ldrh r0, [r1]
	lsrs r0, r0, #4
	adds r2, r5, #0
	adds r2, #0x22
	strb r0, [r2]
	ldr r0, _0807D694 @ =0x0000024F
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	b _0807D6A2
	.align 2, 0
_0807D694: .4byte 0x0000024F
_0807D698:
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_0807D6A2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807D6A8
sub_807D6A8: @ 0x0807D6A8
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807D6BC
	cmp r0, #2
	bne _0807D6C4
_0807D6BC:
	ldr r1, [r3, #0x3c]
	adds r0, r3, #0
	adds r0, #0x4c
	b _0807D6CA
_0807D6C4:
	ldr r1, [r3, #0x3c]
	adds r0, r3, #0
	adds r0, #0x48
_0807D6CA:
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r2, _0807D6F8 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #0x40]
	adds r1, r3, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D6F8: .4byte gCamera

	thumb_func_start sub_807D6FC
sub_807D6FC: @ 0x0807D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	ldr r5, _0807D798 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807D7A0
	mov r0, ip
	ldr r3, [r0, #0x3c]
	ldr r1, _0807D79C @ =gCamera
	ldr r4, [r1]
	subs r3, r3, r4
	ldr r0, [r0, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	subs r2, r2, r4
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r0, ip
	adds r0, #0x4c
	mov r4, ip
	adds r4, #0x48
	ldrh r0, [r0]
	ldrh r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	adds r0, #0x4e
	mov r5, ip
	adds r5, #0x4a
	ldrh r0, [r0]
	ldrh r1, [r5]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r3, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bgt _0807D7A0
	adds r0, r0, r6
	cmp r0, r2
	blt _0807D7A0
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r1, r0, r1
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807D7A0
	adds r0, r1, r7
	cmp r0, r2
	blt _0807D7A0
	movs r0, #1
	b _0807D7A2
	.align 2, 0
_0807D798: .4byte gPlayer
_0807D79C: .4byte gCamera
_0807D7A0:
	movs r0, #0
_0807D7A2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807D7B0
sub_807D7B0: @ 0x0807D7B0
	push {r4, lr}
	ldr r0, _0807D7E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807D6FC
	cmp r0, #0
	beq _0807D7CE
	adds r0, r4, #0
	bl sub_807D80C
_0807D7CE:
	adds r0, r4, #0
	bl sub_807D86C
	cmp r0, #0
	beq _0807D7E4
	adds r0, r4, #0
	bl sub_807D8E0
	b _0807D7F0
	.align 2, 0
_0807D7E0: .4byte gCurTask
_0807D7E4:
	adds r0, r4, #0
	bl sub_807D5CC
	adds r0, r4, #0
	bl sub_807D6A8
_0807D7F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807D7F8
sub_807D7F8: @ 0x0807D7F8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807D80C
sub_807D80C: @ 0x0807D80C
	ldr r0, _0807D818 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D81C @ =sub_807D978
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D818: .4byte gCurTask
_0807D81C: .4byte sub_807D978

	thumb_func_start sub_807D820
sub_807D820: @ 0x0807D820
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0807D840 @ =gPlayer
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807D844
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _0807D850
	b _0807D854
	.align 2, 0
_0807D840: .4byte gPlayer
_0807D844:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	ble _0807D854
_0807D850:
	adds r1, r0, #0
	b _0807D85E
_0807D854:
	ldr r0, _0807D868 @ =0xFFFFF100
	cmp r2, r0
	bge _0807D85E
	movs r1, #0xf1
	lsls r1, r1, #8
_0807D85E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_0807D868: .4byte 0xFFFFF100

	thumb_func_start sub_807D86C
sub_807D86C: @ 0x0807D86C
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807D8D4 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807D8CE
	adds r0, r3, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807D8CE
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807D8CE
	adds r0, r3, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807D8D8
_0807D8CE:
	movs r0, #1
	b _0807D8DA
	.align 2, 0
_0807D8D4: .4byte gCamera
_0807D8D8:
	movs r0, #0
_0807D8DA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807D8E0
sub_807D8E0: @ 0x0807D8E0
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807D8F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807D8F4: .4byte gCurTask

	thumb_func_start initSprite_Interactable087
initSprite_Interactable087: @ 0x0807D8F8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable088
initSprite_Interactable088: @ 0x0807D918
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable089
initSprite_Interactable089: @ 0x0807D938
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable090
initSprite_Interactable090: @ 0x0807D958
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_807D2F4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807D978
sub_807D978: @ 0x0807D978
	push {r4, lr}
	ldr r0, _0807D9B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807D468
	adds r0, r4, #0
	bl sub_807D6FC
	cmp r0, #0
	bne _0807D99C
	adds r0, r4, #0
	bl sub_807D9B4
_0807D99C:
	adds r0, r4, #0
	bl sub_807D5CC
	adds r0, r4, #0
	bl sub_807D6A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9B0: .4byte gCurTask

	thumb_func_start sub_807D9B4
sub_807D9B4: @ 0x0807D9B4
	ldr r0, _0807D9C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807D9C4 @ =sub_807D7B0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807D9C0: .4byte gCurTask
_0807D9C4: .4byte sub_807D7B0

	thumb_func_start sub_807D9C8
sub_807D9C8: @ 0x0807D9C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sl, r5
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0807DA8C @ =sub_807DE98
	ldr r2, _0807DA90 @ =0x00002010
	ldr r1, _0807DA94 @ =sub_807DF38
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r1, _0807DA98 @ =IWRAM_START + 0x44
	adds r3, r2, r1
	mov r5, sp
	ldrh r5, [r5, #0x30]
	strh r5, [r3]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	mov r5, ip
	str r0, [r5, #0x3c]
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r5, sl
	lsls r1, r5, #8
	adds r0, r0, r1
	mov r1, ip
	str r0, [r1, #0x40]
	mov r5, r8
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _0807DA9C @ =IWRAM_START + 0x4C
	adds r7, r2, r1
	strh r0, [r7]
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r5, _0807DAA0 @ =IWRAM_START + 0x4E
	adds r6, r2, r5
	strh r0, [r6]
	mov r1, r8
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	ldrh r5, [r7]
	adds r0, r0, r5
	ldr r5, _0807DAA4 @ =IWRAM_START + 0x50
	adds r1, r2, r5
	strh r0, [r1]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r5, [r6]
	adds r0, r0, r5
	ldr r5, _0807DAA8 @ =IWRAM_START + 0x52
	adds r2, r2, r5
	strh r0, [r2]
	mov r0, ip
	strh r4, [r0, #4]
	mov r4, sl
	strh r4, [r0, #6]
	mov r5, r8
	str r5, [r0]
	ldrb r0, [r5]
	mov r4, ip
	strb r0, [r4, #8]
	mov r5, sb
	strb r5, [r4, #9]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DABC
	cmp r0, #1
	bgt _0807DAAC
	cmp r0, #0
	beq _0807DAB6
	b _0807DB0E
	.align 2, 0
_0807DA8C: .4byte sub_807DE98
_0807DA90: .4byte 0x00002010
_0807DA94: .4byte sub_807DF38
_0807DA98: .4byte IWRAM_START + 0x44
_0807DA9C: .4byte IWRAM_START + 0x4C
_0807DAA0: .4byte IWRAM_START + 0x4E
_0807DAA4: .4byte IWRAM_START + 0x50
_0807DAA8: .4byte IWRAM_START + 0x52
_0807DAAC:
	cmp r0, #2
	beq _0807DAD8
	cmp r0, #3
	beq _0807DAF4
	b _0807DB0E
_0807DAB6:
	movs r0, #0
	ldrsh r1, [r1, r0]
	b _0807DAC0
_0807DABC:
	movs r5, #0
	ldrsh r1, [r7, r5]
_0807DAC0:
	mov r3, ip
	ldr r0, [r3, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x54]
	movs r4, #0
	ldrsh r1, [r2, r4]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x58]
	b _0807DB0E
_0807DAD8:
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov r2, ip
	ldr r0, [r2, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x54]
	movs r3, #0
	ldrsh r1, [r6, r3]
	ldr r0, [r2, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r2, #0x58]
	b _0807DB0E
_0807DAF4:
	movs r4, #0
	ldrsh r1, [r7, r4]
	mov r5, ip
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x54]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x58]
_0807DB0E:
	movs r3, #0
	mov r4, ip
	adds r4, #0xc
	mov r6, ip
	adds r6, #0x2d
	mov r7, ip
	adds r7, #0x2e
	movs r1, #0x31
	add r1, ip
	mov sb, r1
	movs r2, #0x2c
	add r2, ip
	mov sl, r2
	mov r5, ip
	adds r5, #0x44
	str r5, [sp, #0xc]
	mov r2, ip
	adds r2, #0x64
	mov r1, ip
	adds r1, #0x60
_0807DB36:
	mov r5, ip
	ldr r0, [r5, #0x54]
	str r0, [r1]
	ldr r0, [r5, #0x58]
	str r0, [r2]
	adds r2, #8
	adds r1, #8
	adds r3, #1
	cmp r3, #2
	bls _0807DB36
	adds r5, r4, #0
	movs r4, #0
	movs r1, #0
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	movs r0, #0xff
	strb r0, [r6]
	movs r0, #0x10
	strb r0, [r7]
	mov r0, sb
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0xf
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _0807DBA8 @ =0x00000266
	strh r0, [r5, #0xa]
	mov r1, sl
	strb r4, [r1]
	ldr r2, [sp, #0x30]
	cmp r2, #0
	bne _0807DB94
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DB94:
	ldr r3, [sp, #0xc]
	ldrh r0, [r3]
	cmp r0, #1
	beq _0807DBD0
	cmp r0, #1
	bgt _0807DBAC
	cmp r0, #0
	beq _0807DBB6
	b _0807DBD0
	.align 2, 0
_0807DBA8: .4byte 0x00000266
_0807DBAC:
	cmp r0, #2
	beq _0807DBBE
	cmp r0, #3
	beq _0807DBC6
	b _0807DBD0
_0807DBB6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807DBCC
_0807DBBE:
	ldr r0, [r5, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	b _0807DBCC
_0807DBC6:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
_0807DBCC:
	orrs r0, r1
	str r0, [r5, #0x10]
_0807DBD0:
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_807DBF0
sub_807DBF0: @ 0x0807DBF0
	push {r4, r5, lr}
	ldr r0, _0807DC38 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807DC3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DC0C
	adds r0, r4, #0
	bl sub_807E0D0
_0807DC0C:
	adds r0, r4, #0
	bl sub_807DF60
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807DC1E
	adds r0, r4, #0
	bl sub_807DD04
_0807DC1E:
	adds r0, r4, #0
	bl sub_807DFBC
	ldr r3, _0807DC40 @ =gPlayer
	ldr r2, [r3, #0x20]
	movs r5, #0x80
	ands r5, r2
	cmp r5, #0
	beq _0807DC44
	movs r0, #0
	str r0, [r4, #0x48]
	b _0807DC6C
	.align 2, 0
_0807DC38: .4byte gCurTask
_0807DC3C: .4byte gGameMode
_0807DC40: .4byte gPlayer
_0807DC44:
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	cmp r0, #0x78
	beq _0807DC64
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0807DC78 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807DC6C
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
_0807DC64:
	ldr r0, _0807DC7C @ =0xFFBFFFFF
	ands r2, r0
	str r2, [r3, #0x20]
	str r5, [r4, #0x48]
_0807DC6C:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DC78: .4byte gPlayerControls
_0807DC7C: .4byte 0xFFBFFFFF

	thumb_func_start sub_807DC80
sub_807DC80: @ 0x0807DC80
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x8f
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r4, _0807DCDC @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r2, r4, #0
	adds r2, #0x64
	movs r1, #0
	movs r0, #0x40
	strh r0, [r2]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r1, [r4, #0x20]
	subs r0, #0x13
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807DCD4
	cmp r0, #2
	bne _0807DCE0
_0807DCD4:
	movs r0, #1
	orrs r1, r0
	b _0807DCE6
	.align 2, 0
_0807DCDC: .4byte gPlayer
_0807DCE0:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
_0807DCE6:
	str r1, [r4, #0x20]
	movs r0, #1
	str r0, [r5, #0x48]
	ldr r0, _0807DCFC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DD00 @ =sub_807DBF0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DCFC: .4byte gCurTask
_0807DD00: .4byte sub_807DBF0

	thumb_func_start sub_807DD04
sub_807DD04: @ 0x0807DD04
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0807DD44 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807DD78
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _0807DD78
	ldr r0, _0807DD48 @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x41
	strh r0, [r1]
	adds r1, #9
	movs r0, #7
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807DD5C
	cmp r0, #1
	bgt _0807DD4C
	cmp r0, #0
	beq _0807DD56
	b _0807DD68
	.align 2, 0
_0807DD44: .4byte gPlayer
_0807DD48: .4byte 0xFFBFFFFF
_0807DD4C:
	cmp r0, #2
	beq _0807DD56
	cmp r0, #3
	beq _0807DD5C
	b _0807DD68
_0807DD56:
	movs r0, #0xf1
	lsls r0, r0, #8
	b _0807DD60
_0807DD5C:
	movs r0, #0xf0
	lsls r0, r0, #4
_0807DD60:
	strh r0, [r2, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
_0807DD68:
	movs r0, #0
	str r0, [r4, #0x48]
	ldr r0, _0807DD74 @ =0x0000011F
	bl m4aSongNumStart
	b _0807DD80
	.align 2, 0
_0807DD74: .4byte 0x0000011F
_0807DD78:
	movs r0, #0x8f
	lsls r0, r0, #1
	bl m4aSongNumStop
_0807DD80:
	adds r1, r4, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807DD98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DD9C @ =sub_807DEEC
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DD98: .4byte gCurTask
_0807DD9C: .4byte sub_807DEEC

	thumb_func_start sub_807DDA0
sub_807DDA0: @ 0x0807DDA0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807DDC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DDC8
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	ldr r2, _0807DDC4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x6c]
	b _0807DDD6
	.align 2, 0
_0807DDC0: .4byte gGameMode
_0807DDC4: .4byte gCamera
_0807DDC8:
	ldr r0, [r3, #0x54]
	asrs r0, r0, #8
	ldr r2, _0807DDEC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x58]
_0807DDD6:
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DDEC: .4byte gCamera

	thumb_func_start sub_807DDF0
sub_807DDF0: @ 0x0807DDF0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r1, _0807DE1C @ =gPlayer
	ldr r0, [r1, #0x20]
	movs r2, #0x80
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	bne _0807DE90
	ldr r0, _0807DE20 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807DE24
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
_0807DE14:
	cmp r0, #1
	bhi _0807DE32
	b _0807DE90
	.align 2, 0
_0807DE1C: .4byte gPlayer
_0807DE20: .4byte gUnknown_03005424
_0807DE24:
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0807DE14
_0807DE32:
	ldr r2, [r3, #0x54]
	asrs r2, r2, #8
	ldr r1, _0807DE8C @ =gCamera
	ldr r4, [r1]
	subs r2, r2, r4
	ldr r0, [r3, #0x58]
	asrs r0, r0, #8
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807DE90
	adds r0, #0x20
	cmp r0, r1
	blt _0807DE90
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x10
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807DE90
	adds r0, r3, #0
	adds r0, #0x10
	cmp r0, r2
	blt _0807DE90
	movs r0, #1
	b _0807DE92
	.align 2, 0
_0807DE8C: .4byte gCamera
_0807DE90:
	movs r0, #0
_0807DE92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807DE98
sub_807DE98: @ 0x0807DE98
	push {r4, lr}
	ldr r0, _0807DED8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807DEDC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DEB4
	adds r0, r4, #0
	bl sub_807E0D0
_0807DEB4:
	adds r0, r4, #0
	bl sub_807DDF0
	cmp r0, #0
	beq _0807DEC4
	adds r0, r4, #0
	bl sub_807DC80
_0807DEC4:
	adds r0, r4, #0
	bl sub_807E044
	cmp r0, #0
	beq _0807DEE0
	adds r0, r4, #0
	bl sub_807E0B8
	b _0807DEE6
	.align 2, 0
_0807DED8: .4byte gCurTask
_0807DEDC: .4byte gGameMode
_0807DEE0:
	adds r0, r4, #0
	bl sub_807DDA0
_0807DEE6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807DEEC
sub_807DEEC: @ 0x0807DEEC
	push {r4, r5, lr}
	ldr r0, _0807DF2C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807DF30 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807DF08
	adds r0, r4, #0
	bl sub_807E0D0
_0807DF08:
	ldr r0, _0807DF34 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0807DF20
	adds r0, r4, #0
	bl sub_807DF4C
_0807DF20:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF2C: .4byte gCurTask
_0807DF30: .4byte gGameMode
_0807DF34: .4byte IWRAM_START + 0x5C

	thumb_func_start sub_807DF38
sub_807DF38: @ 0x0807DF38
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807DF4C
sub_807DF4C: @ 0x0807DF4C
	ldr r0, _0807DF58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807DF5C @ =sub_807E16C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807DF58: .4byte gCurTask
_0807DF5C: .4byte sub_807E16C

	thumb_func_start sub_807DF60
sub_807DF60: @ 0x0807DF60
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807DF72
	cmp r0, #2
	bne _0807DF94
_0807DF72:
	ldr r1, [r3, #0x54]
	ldr r0, _0807DF90 @ =0xFFFFF100
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807DFB4
	b _0807DFB0
	.align 2, 0
_0807DF90: .4byte 0xFFFFF100
_0807DF94:
	ldr r1, [r3, #0x54]
	movs r0, #0xf0
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	blt _0807DFB4
_0807DFB0:
	str r0, [r3, #0x54]
	movs r4, #1
_0807DFB4:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807DFBC
sub_807DFBC: @ 0x0807DFBC
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807DFE8 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E040
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _0807E040
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	beq _0807E00C
	cmp r0, #1
	bgt _0807DFEC
	cmp r0, #0
	beq _0807DFF6
	b _0807E040
	.align 2, 0
_0807DFE8: .4byte gPlayer
_0807DFEC:
	cmp r0, #2
	beq _0807E020
	cmp r0, #3
	beq _0807E02C
	b _0807E040
_0807DFF6:
	ldr r0, [r2, #0x54]
	ldr r1, _0807E004 @ =0xFFFFF800
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	ldr r1, _0807E008 @ =0xFFFFF000
	b _0807E03C
	.align 2, 0
_0807E004: .4byte 0xFFFFF800
_0807E008: .4byte 0xFFFFF000
_0807E00C:
	ldr r0, [r2, #0x54]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	ldr r1, _0807E01C @ =0xFFFFF000
	b _0807E03C
	.align 2, 0
_0807E01C: .4byte 0xFFFFF000
_0807E020:
	ldr r0, [r2, #0x54]
	ldr r1, _0807E028 @ =0xFFFFF800
	b _0807E032
	.align 2, 0
_0807E028: .4byte 0xFFFFF800
_0807E02C:
	ldr r0, [r2, #0x54]
	movs r1, #0x80
	lsls r1, r1, #4
_0807E032:
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r0, [r2, #0x58]
	movs r1, #0x80
	lsls r1, r1, #5
_0807E03C:
	adds r0, r0, r1
	str r0, [r3, #0xc]
_0807E040:
	pop {r0}
	bx r0

	thumb_func_start sub_807E044
sub_807E044: @ 0x0807E044
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807E0AC @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807E0A6
	adds r0, r3, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807E0A6
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807E0A6
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807E0B0
_0807E0A6:
	movs r0, #1
	b _0807E0B2
	.align 2, 0
_0807E0AC: .4byte gCamera
_0807E0B0:
	movs r0, #0
_0807E0B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807E0B8
sub_807E0B8: @ 0x0807E0B8
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807E0CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807E0CC: .4byte gCurTask

	thumb_func_start sub_807E0D0
sub_807E0D0: @ 0x0807E0D0
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x58]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start initSprite_Interactable091
initSprite_Interactable091: @ 0x0807E0EC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable092
initSprite_Interactable092: @ 0x0807E10C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable101
initSprite_Interactable101: @ 0x0807E12C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable102
initSprite_Interactable102: @ 0x0807E14C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_807D9C8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E16C
sub_807E16C: @ 0x0807E16C
	push {r4, lr}
	ldr r0, _0807E1A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807E1AC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807E188
	adds r0, r4, #0
	bl sub_807E0D0
_0807E188:
	adds r0, r4, #0
	bl sub_807E1C4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807E19A
	adds r0, r4, #0
	bl sub_807E1B0
_0807E19A:
	adds r0, r4, #0
	bl sub_807DDA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1A8: .4byte gCurTask
_0807E1AC: .4byte gGameMode

	thumb_func_start sub_807E1B0
sub_807E1B0: @ 0x0807E1B0
	ldr r0, _0807E1BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E1C0 @ =sub_807DE98
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E1BC: .4byte gCurTask
_0807E1C0: .4byte sub_807DE98

	thumb_func_start sub_807E1C4
sub_807E1C4: @ 0x0807E1C4
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807E1D6
	cmp r0, #2
	bne _0807E1F4
_0807E1D6:
	ldr r1, [r3, #0x54]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	blt _0807E212
	b _0807E20E
_0807E1F4:
	ldr r1, [r3, #0x54]
	ldr r0, _0807E21C @ =0xFFFFFF00
	adds r1, r1, r0
	str r1, [r3, #0x54]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, [r3, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807E212
_0807E20E:
	str r0, [r3, #0x54]
	movs r4, #1
_0807E212:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807E21C: .4byte 0xFFFFFF00

	thumb_func_start initSprite_Interactable093
initSprite_Interactable093: @ 0x0807E220
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807E294 @ =sub_807E770
	ldr r2, _0807E298 @ =0x00002010
	ldr r1, _0807E29C @ =sub_807E830
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov ip, r0
	movs r0, #3
	ldrsb r0, [r7, r0]
	ldr r1, _0807E2A0 @ =IWRAM_START + 0x68
	adds r2, r3, r1
	strh r0, [r2]
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	mov r4, ip
	str r0, [r4, #0x60]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r4, #0x64]
	str r7, [r4, #0x70]
	ldrb r1, [r7]
	ldr r4, _0807E2A4 @ =IWRAM_START + 0x74
	adds r0, r3, r4
	strb r1, [r0]
	ldr r1, _0807E2A8 @ =IWRAM_START + 0x75
	adds r0, r3, r1
	strb r6, [r0]
	ldrh r0, [r2]
	cmp r0, #0
	bne _0807E2AC
	subs r4, #0xa
	adds r1, r3, r4
	movs r0, #0x80
	lsls r0, r0, #2
	b _0807E2B2
	.align 2, 0
_0807E294: .4byte sub_807E770
_0807E298: .4byte 0x00002010
_0807E29C: .4byte sub_807E830
_0807E2A0: .4byte IWRAM_START + 0x68
_0807E2A4: .4byte IWRAM_START + 0x74
_0807E2A8: .4byte IWRAM_START + 0x75
_0807E2AC:
	ldr r0, _0807E30C @ =IWRAM_START + 0x6A
	adds r1, r3, r0
	movs r0, #0
_0807E2B2:
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x30
	movs r3, #0
	movs r2, #0
	movs r1, #0xe0
	lsls r1, r1, #1
	strh r1, [r0, #0x1a]
	strh r2, [r0, #8]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x1c]
	mov r2, ip
	adds r2, #0x51
	movs r1, #0xff
	strb r1, [r2]
	adds r2, #1
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x55
	strb r3, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r1, _0807E310 @ =0x06012C80
	str r1, [r0, #4]
	movs r1, #0x9a
	lsls r1, r1, #2
	strh r1, [r0, #0xa]
	subs r2, #2
	movs r1, #1
	strb r1, [r2]
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E30C: .4byte IWRAM_START + 0x6A
_0807E310: .4byte 0x06012C80

	thumb_func_start sub_807E314
sub_807E314: @ 0x0807E314
	push {r4, lr}
	ldr r0, _0807E35C @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _0807E360 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E352
	ldr r1, _0807E364 @ =IWRAM_START + 0x6C
	adds r0, r3, r1
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	ldr r0, _0807E368 @ =0xFFFF0000
	cmp r1, r0
	beq _0807E352
	adds r2, #0x5e
	ldr r1, _0807E36C @ =gPlayerControls
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0807E370
_0807E352:
	adds r0, r4, #0
	bl sub_807E408
	b _0807E376
	.align 2, 0
_0807E35C: .4byte gCurTask
_0807E360: .4byte gPlayer
_0807E364: .4byte IWRAM_START + 0x6C
_0807E368: .4byte 0xFFFF0000
_0807E36C: .4byte gPlayerControls
_0807E370:
	adds r0, r4, #0
	bl sub_807E56C
_0807E376:
	adds r0, r4, #0
	bl sub_807E5F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807E384
sub_807E384: @ 0x0807E384
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_8029FF0
	ldr r4, _0807E3C8 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E3CC
	ldr r0, [r5, #0x60]
	adds r0, #0x28
	lsls r0, r0, #8
	str r0, [r4, #8]
	ldr r0, [r5, #0x64]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	b _0807E3E2
	.align 2, 0
_0807E3C8: .4byte gPlayer
_0807E3CC:
	ldr r0, [r5, #0x60]
	subs r0, #0x28
	lsls r0, r0, #8
	str r0, [r4, #8]
	ldr r0, [r5, #0x64]
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_0807E3E2:
	str r0, [r4, #0x20]
	ldr r1, _0807E3FC @ =gPlayer
	movs r0, #0
	strh r0, [r1, #0x14]
	strh r0, [r1, #0x10]
	strh r0, [r1, #0x12]
	ldr r0, _0807E400 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E404 @ =sub_807E7B0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3FC: .4byte gPlayer
_0807E400: .4byte gCurTask
_0807E404: .4byte sub_807E7B0

	thumb_func_start sub_807E408
sub_807E408: @ 0x0807E408
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_802A004
	ldr r0, _0807E4C8 @ =gPlayer
	mov ip, r0
	ldr r1, [r0, #0x20]
	movs r6, #0x80
	adds r0, r1, #0
	ands r0, r6
	cmp r0, #0
	bne _0807E4B0
	ldr r0, _0807E4CC @ =0xFFBFFFFF
	ands r1, r0
	mov r7, ip
	str r1, [r7, #0x20]
	mov r1, ip
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldr r2, _0807E4D0 @ =gSineTable
	adds r4, r5, #0
	adds r4, #0x6a
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r1, [r7, #8]
	adds r1, r1, r0
	str r1, [r7, #8]
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r1, [r7, #0xc]
	adds r1, r1, r0
	str r1, [r7, #0xc]
	ldrh r0, [r4]
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	strh r0, [r7, #0x10]
	ldrh r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #4
	subs r2, r1, r0
	strh r2, [r7, #0x12]
	ldr r0, _0807E4D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0807E49A
	rsbs r0, r2, #0
	strh r0, [r7, #0x12]
_0807E49A:
	ldrh r0, [r4]
	lsrs r0, r0, #2
	mov r1, ip
	adds r1, #0x24
	strb r0, [r1]
	movs r0, #4
	mov r1, ip
	strh r0, [r1, #0x2c]
	ldr r0, _0807E4D8 @ =0x00000121
	bl m4aSongNumStart
_0807E4B0:
	adds r1, r5, #0
	adds r1, #0x6e
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807E4DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E4E0 @ =sub_807E7F8
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4C8: .4byte gPlayer
_0807E4CC: .4byte 0xFFBFFFFF
_0807E4D0: .4byte gSineTable
_0807E4D4: .4byte gUnknown_03005424
_0807E4D8: .4byte 0x00000121
_0807E4DC: .4byte gCurTask
_0807E4E0: .4byte sub_807E7F8

	thumb_func_start sub_807E4E4
sub_807E4E4: @ 0x0807E4E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	ldr r0, [r4, #0x60]
	lsls r1, r0, #8
	ldr r0, _0807E508 @ =gPlayer
	ldr r2, [r0, #8]
	adds r3, r0, #0
	cmp r2, r1
	ble _0807E510
	ldr r6, _0807E50C @ =0xFFFFFF00
	adds r0, r2, r6
	str r0, [r3, #8]
	cmp r0, r1
	bge _0807E526
	str r1, [r3, #8]
	b _0807E526
	.align 2, 0
_0807E508: .4byte gPlayer
_0807E50C: .4byte 0xFFFFFF00
_0807E510:
	cmp r2, r1
	bge _0807E524
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	str r0, [r3, #8]
	cmp r0, r1
	ble _0807E526
	str r1, [r3, #8]
	b _0807E526
_0807E524:
	movs r5, #1
_0807E526:
	ldr r0, [r4, #0x64]
	lsls r1, r0, #8
	adds r2, r3, #0
	ldr r0, [r2, #0xc]
	cmp r0, r1
	ble _0807E544
	ldr r3, _0807E540 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r2, #0xc]
	cmp r0, r1
	bge _0807E55E
	str r1, [r2, #0xc]
	b _0807E55E
	.align 2, 0
_0807E540: .4byte 0xFFFFFF00
_0807E544:
	cmp r0, r1
	bge _0807E558
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	str r0, [r3, #0xc]
	cmp r0, r1
	ble _0807E55E
	str r1, [r3, #0xc]
	b _0807E55E
_0807E558:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0807E55E:
	movs r0, #0
	cmp r5, #2
	bne _0807E566
	movs r0, #1
_0807E566:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807E56C
sub_807E56C: @ 0x0807E56C
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E58E
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E5A0
	movs r3, #0xa0
	lsls r3, r3, #2
	b _0807E5A0
_0807E58E:
	adds r0, r2, #0
	adds r0, #0x6e
	ldrh r1, [r0]
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E5A0
	movs r3, #0x80
_0807E5A0:
	adds r4, r2, #0
	adds r4, #0x6a
	ldrh r0, [r4]
	adds r1, r3, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0
	bge _0807E5BC
	rsbs r1, r0, #0
_0807E5BC:
	cmp r1, #4
	ble _0807E5D0
	ldr r2, _0807E5CC @ =0x0000FFFC
	cmp r0, #0
	ble _0807E5D8
	movs r2, #4
	b _0807E5D8
	.align 2, 0
_0807E5CC: .4byte 0x0000FFFC
_0807E5D0:
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_0807E5D8:
	ldrh r0, [r4]
	adds r0, r0, r2
	ldr r2, _0807E5EC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5EC: .4byte 0x000003FF

	thumb_func_start sub_807E5F0
sub_807E5F0: @ 0x0807E5F0
	push {r4, lr}
	sub sp, #0xc
	mov ip, r0
	mov r4, ip
	adds r4, #0x30
	ldr r3, [r0, #0x60]
	ldr r1, _0807E660 @ =gCamera
	ldr r0, [r1]
	subs r3, r3, r0
	strh r3, [r4, #0x16]
	mov r0, ip
	ldr r2, [r0, #0x64]
	ldr r0, [r1, #4]
	subs r2, r2, r0
	strh r2, [r4, #0x18]
	mov r1, sp
	mov r0, ip
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r3, [r0, #6]
	strh r2, [r0, #8]
	ldr r2, _0807E664 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0807E668 @ =0x00002060
	orrs r1, r0
	str r1, [r4, #0x10]
	mov r0, ip
	adds r0, #0x68
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E64A
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	str r1, [r4, #0x10]
_0807E64A:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8004860
	adds r0, r4, #0
	bl sub_80051E8
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E660: .4byte gCamera
_0807E664: .4byte gUnknown_030054B8
_0807E668: .4byte 0x00002060

	thumb_func_start sub_807E66C
sub_807E66C: @ 0x0807E66C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r3, #0
	adds r6, #0x30
	ldr r0, _0807E758 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E764
	adds r0, r3, #0
	adds r0, #0x68
	ldrh r0, [r0]
	ldr r0, [r3, #0x60]
	ldr r2, _0807E75C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r3, #0x64]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r1, r2, #0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r3, r0, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, _0807E760 @ =gUnknown_03005AF0
	adds r0, r1, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r2, r5
	mov ip, r1
	cmp r3, r2
	bgt _0807E6F4
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0807E706
	cmp r3, r2
	blt _0807E764
_0807E6F4:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	blt _0807E764
_0807E706:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r3, ip
	adds r3, #0x39
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r0, r3
	cmp r1, r2
	bgt _0807E740
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0807E752
	cmp r1, r2
	blt _0807E764
_0807E740:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _0807E764
_0807E752:
	movs r0, #1
	b _0807E766
	.align 2, 0
_0807E758: .4byte gPlayer
_0807E75C: .4byte gCamera
_0807E760: .4byte gUnknown_03005AF0
_0807E764:
	movs r0, #0
_0807E766:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807E770
sub_807E770: @ 0x0807E770
	push {r4, lr}
	ldr r0, _0807E7A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807E66C
	cmp r0, #0
	beq _0807E78E
	adds r0, r4, #0
	bl sub_807E384
_0807E78E:
	adds r0, r4, #0
	bl sub_807E898
	cmp r0, #0
	beq _0807E7A4
	adds r0, r4, #0
	bl sub_807E8E0
	b _0807E7AA
	.align 2, 0
_0807E7A0: .4byte gCurTask
_0807E7A4:
	adds r0, r4, #0
	bl sub_807E5F0
_0807E7AA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E7B0
sub_807E7B0: @ 0x0807E7B0
	push {r4, lr}
	ldr r0, _0807E7D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807E7D8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807E7DC
	adds r0, r4, #0
	bl sub_807E86C
	b _0807E7EC
	.align 2, 0
_0807E7D4: .4byte gCurTask
_0807E7D8: .4byte gPlayer
_0807E7DC:
	adds r0, r4, #0
	bl sub_807E4E4
	cmp r0, #0
	beq _0807E7EC
	adds r0, r4, #0
	bl sub_807E834
_0807E7EC:
	adds r0, r4, #0
	bl sub_807E5F0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E7F8
sub_807E7F8: @ 0x0807E7F8
	push {r4, lr}
	ldr r0, _0807E82C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x6e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r2, r0, #1
	strh r2, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0807E81E
	adds r0, r4, #0
	bl sub_807E884
_0807E81E:
	adds r0, r4, #0
	bl sub_807E5F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E82C: .4byte gCurTask

	thumb_func_start sub_807E830
sub_807E830: @ 0x0807E830
	bx lr
	.align 2, 0

	thumb_func_start sub_807E834
sub_807E834: @ 0x0807E834
	push {lr}
	adds r2, r0, #0
	adds r0, #0x6c
	movs r1, #0x80
	lsls r1, r1, #2
	strh r1, [r0]
	subs r0, #4
	ldrh r1, [r0]
	cmp r1, #0
	bne _0807E84E
	adds r0, #6
	strh r1, [r0]
	b _0807E856
_0807E84E:
	adds r1, r2, #0
	adds r1, #0x6e
	movs r0, #1
	strh r0, [r1]
_0807E856:
	ldr r0, _0807E864 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E868 @ =sub_807E314
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807E864: .4byte gCurTask
_0807E868: .4byte sub_807E314

	thumb_func_start sub_807E86C
sub_807E86C: @ 0x0807E86C
	adds r0, #0x6e
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0807E87C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E880 @ =sub_807E7F8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E87C: .4byte gCurTask
_0807E880: .4byte sub_807E7F8

	thumb_func_start sub_807E884
sub_807E884: @ 0x0807E884
	ldr r0, _0807E890 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E894 @ =sub_807E8FC
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E890: .4byte gCurTask
_0807E894: .4byte sub_807E8FC

	thumb_func_start sub_807E898
sub_807E898: @ 0x0807E898
	push {lr}
	ldr r1, [r0, #0x60]
	ldr r3, _0807E8D4 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x64]
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
	bhi _0807E8D0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807E8D0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807E8D8
_0807E8D0:
	movs r0, #1
	b _0807E8DA
	.align 2, 0
_0807E8D4: .4byte gCamera
_0807E8D8:
	movs r0, #0
_0807E8DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807E8E0
sub_807E8E0: @ 0x0807E8E0
	push {lr}
	ldr r1, [r0, #0x70]
	adds r0, #0x74
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807E8F8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807E8F8: .4byte gCurTask

	thumb_func_start sub_807E8FC
sub_807E8FC: @ 0x0807E8FC
	push {r4, lr}
	ldr r0, _0807E930 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807E954
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807E91C
	adds r0, r4, #0
	bl sub_807E940
_0807E91C:
	adds r0, r4, #0
	bl sub_807E898
	cmp r0, #0
	beq _0807E934
	adds r0, r4, #0
	bl sub_807E8E0
	b _0807E93A
	.align 2, 0
_0807E930: .4byte gCurTask
_0807E934:
	adds r0, r4, #0
	bl sub_807E5F0
_0807E93A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807E940
sub_807E940: @ 0x0807E940
	ldr r0, _0807E94C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807E950 @ =sub_807E770
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807E94C: .4byte gCurTask
_0807E950: .4byte sub_807E770

	thumb_func_start sub_807E954
sub_807E954: @ 0x0807E954
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0
	cmp r0, #0
	bne _0807E968
	movs r1, #0x80
	lsls r1, r1, #2
_0807E968:
	adds r4, #0x6a
	ldrh r0, [r4]
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	cmp r0, #0
	bge _0807E980
	rsbs r1, r0, #0
_0807E980:
	cmp r1, #4
	ble _0807E994
	ldr r2, _0807E990 @ =0x0000FFFC
	cmp r0, #0
	ble _0807E996
	movs r2, #4
	b _0807E996
	.align 2, 0
_0807E990: .4byte 0x0000FFFC
_0807E994:
	movs r5, #1
_0807E996:
	ldrh r0, [r4]
	adds r0, r0, r2
	ldr r2, _0807E9AC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4]
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807E9AC: .4byte 0x000003FF

	thumb_func_start initSprite_Interactable094
initSprite_Interactable094: @ 0x0807E9B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r0, _0807EA78 @ =sub_807EC38
	ldr r2, _0807EA7C @ =0x00002010
	ldr r1, _0807EA80 @ =sub_807ECB4
	str r1, [sp]
	movs r1, #0x28
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sl, r0
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sl
	mov r0, r8
	ldrb r6, [r0]
	lsls r6, r6, #3
	lsls r4, r4, #8
	adds r6, r6, r4
	str r6, [r2]
	ldrb r1, [r0, #1]
	lsls r1, r1, #3
	mov sb, r1
	lsls r5, r5, #8
	add sb, r5
	mov r3, sb
	str r3, [r2, #4]
	movs r4, #3
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r0, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r0, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	ldrb r0, [r0, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r5, #8
	ldrsh r0, [r2, r5]
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r6
	str r0, [r2, #0x14]
	movs r5, #0xa
	ldrsh r0, [r2, r5]
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	asrs r0, r0, #1
	add r0, sb
	str r0, [r2, #0x18]
	mov r5, r8
	str r5, [r2, #0x20]
	ldrb r1, [r5]
	ldr r0, _0807EA84 @ =IWRAM_START + 0x24
	add r0, sl
	strb r1, [r0]
	ldr r0, _0807EA88 @ =IWRAM_START + 0x25
	add sl, r0
	mov r1, sl
	strb r7, [r1]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA78: .4byte sub_807EC38
_0807EA7C: .4byte 0x00002010
_0807EA80: .4byte sub_807ECB4
_0807EA84: .4byte IWRAM_START + 0x24
_0807EA88: .4byte IWRAM_START + 0x25

	thumb_func_start sub_807EA8C
sub_807EA8C: @ 0x0807EA8C
	push {r4, lr}
	ldr r0, _0807EAB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r1, _0807EAB4 @ =gPlayer
	ldr r0, [r1, #0x20]
	movs r3, #0x80
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq _0807EAB8
	adds r0, r4, #0
	bl sub_807ED68
	b _0807EB40
	.align 2, 0
_0807EAB0: .4byte gCurTask
_0807EAB4: .4byte gPlayer
_0807EAB8:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _0807EAC8
	adds r0, r4, #0
	bl sub_807ED88
	b _0807EB40
_0807EAC8:
	ldr r0, _0807EADC @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807EAE4
	ldr r0, [r2, #0xc]
	ldr r1, _0807EAE0 @ =0xFFFFFF00
	b _0807EAEA
	.align 2, 0
_0807EADC: .4byte gUnknown_03005424
_0807EAE0: .4byte 0xFFFFFF00
_0807EAE4:
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
_0807EAEA:
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0807EB1C @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807EB20
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0807EB12
	movs r0, #1
_0807EB12:
	str r0, [r4, #0x1c]
	adds r0, r4, #0
	bl sub_807EB48
	b _0807EB30
	.align 2, 0
_0807EB1C: .4byte gPlayerControls
_0807EB20:
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	bne _0807EB30
	adds r0, r4, #0
	bl sub_807ED00
_0807EB30:
	adds r0, r4, #0
	bl sub_807EDB8
	cmp r0, #0
	beq _0807EB40
	adds r0, r4, #0
	bl sub_807EE1C
_0807EB40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807EB48
sub_807EB48: @ 0x0807EB48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0807EB6C @ =gPlayer
	ldr r3, [r1, #0x20]
	movs r0, #0x80
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	bne _0807EBA4
	ldr r1, _0807EB70 @ =0xFFBFFFFF
	ands r1, r3
	str r1, [r2, #0x20]
	ldr r3, [r4, #0x1c]
	cmp r3, #0
	beq _0807EB74
	movs r0, #1
	orrs r1, r0
	b _0807EB7A
	.align 2, 0
_0807EB6C: .4byte gPlayer
_0807EB70: .4byte 0xFFBFFFFF
_0807EB74:
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
_0807EB7A:
	str r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #4
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	cmp r3, #0
	beq _0807EB96
	movs r0, #0xfb
	lsls r0, r0, #8
	b _0807EB9A
_0807EB96:
	movs r0, #0xa0
	lsls r0, r0, #3
_0807EB9A:
	strh r0, [r2, #0x10]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
_0807EBA4:
	ldr r0, _0807EBB4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807EBB8 @ =sub_807EC70
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EBB4: .4byte gCurTask
_0807EBB8: .4byte sub_807EC70

	thumb_func_start sub_807EBBC
sub_807EBBC: @ 0x0807EBBC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0807EC28 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807EC30
	ldr r2, [r5]
	ldrh r0, [r5, #8]
	adds r2, r2, r0
	ldr r3, _0807EC2C @ =gCamera
	ldr r4, [r3]
	subs r2, r2, r4
	ldr r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldr r3, [r3, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _0807EC30
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r0, r1
	blt _0807EC30
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _0807EC30
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r0, r1
	blt _0807EC30
	movs r0, #1
	b _0807EC32
	.align 2, 0
_0807EC28: .4byte gPlayer
_0807EC2C: .4byte gCamera
_0807EC30:
	movs r0, #0
_0807EC32:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_807EC38
sub_807EC38: @ 0x0807EC38
	push {r4, lr}
	ldr r0, _0807EC6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	beq _0807EC56
	adds r0, r4, #0
	bl sub_807ECB8
_0807EC56:
	adds r0, r4, #0
	bl sub_807EDB8
	cmp r0, #0
	beq _0807EC66
	adds r0, r4, #0
	bl sub_807EE1C
_0807EC66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC6C: .4byte gCurTask

	thumb_func_start sub_807EC70
sub_807EC70: @ 0x0807EC70
	push {r4, lr}
	ldr r0, _0807EC90 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807EC94 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807EC9C
	ldr r0, _0807EC98 @ =sub_807EC38
	str r0, [r2, #8]
	b _0807ECAC
	.align 2, 0
_0807EC90: .4byte gCurTask
_0807EC94: .4byte gPlayer
_0807EC98: .4byte sub_807EC38
_0807EC9C:
	adds r0, r4, #0
	bl sub_807EBBC
	cmp r0, #0
	bne _0807ECAC
	adds r0, r4, #0
	bl sub_807ED48
_0807ECAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807ECB4
sub_807ECB4: @ 0x0807ECB4
	bx lr
	.align 2, 0

	thumb_func_start sub_807ECB8
sub_807ECB8: @ 0x0807ECB8
	push {r4, lr}
	ldr r3, _0807ECF4 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xf
	orrs r1, r2
	str r1, [r3, #0x20]
	adds r4, r3, #0
	adds r4, #0x64
	movs r2, #0
	movs r1, #0x42
	strh r1, [r4]
	ldr r0, [r0, #0x14]
	lsls r0, r0, #8
	str r0, [r3, #8]
	strh r2, [r3, #0x14]
	strh r2, [r3, #0x10]
	strh r2, [r3, #0x12]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807ECF8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ECFC @ =sub_807EA8C
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ECF4: .4byte gPlayer
_0807ECF8: .4byte gCurTask
_0807ECFC: .4byte sub_807EA8C

	thumb_func_start sub_807ED00
sub_807ED00: @ 0x0807ED00
	push {lr}
	ldr r2, _0807ED38 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807ED2C
	ldr r0, _0807ED3C @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	adds r0, #0xfb
	strh r0, [r2, #0x12]
	adds r0, #0x22
	bl m4aSongNumStop
_0807ED2C:
	ldr r0, _0807ED40 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED44 @ =sub_807EC38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED38: .4byte gPlayer
_0807ED3C: .4byte 0xFFBFFFFF
_0807ED40: .4byte gCurTask
_0807ED44: .4byte sub_807EC38

	thumb_func_start sub_807ED48
sub_807ED48: @ 0x0807ED48
	push {lr}
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807ED60 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED64 @ =sub_807EC38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED60: .4byte gCurTask
_0807ED64: .4byte sub_807EC38

	thumb_func_start sub_807ED68
sub_807ED68: @ 0x0807ED68
	push {lr}
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807ED80 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807ED84 @ =sub_807EC38
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807ED80: .4byte gCurTask
_0807ED84: .4byte sub_807EC38

	thumb_func_start sub_807ED88
sub_807ED88: @ 0x0807ED88
	push {lr}
	ldr r2, _0807EDA8 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0807EDAC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x91
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807EDB0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807EDB4 @ =sub_807EC70
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807EDA8: .4byte gPlayer
_0807EDAC: .4byte 0xFFBFFFFF
_0807EDB0: .4byte gCurTask
_0807EDB4: .4byte sub_807EC70

	thumb_func_start sub_807EDB8
sub_807EDB8: @ 0x0807EDB8
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _0807EE10 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807EE0A
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807EE0A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807EE0A
	movs r2, #0xa
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807EE14
_0807EE0A:
	movs r0, #1
	b _0807EE16
	.align 2, 0
_0807EE10: .4byte gCamera
_0807EE14:
	movs r0, #0
_0807EE16:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807EE1C
sub_807EE1C: @ 0x0807EE1C
	push {lr}
	ldr r1, [r0, #0x20]
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0807EE34 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807EE34: .4byte gCurTask

	thumb_func_start initSprite_Interactable095
initSprite_Interactable095: @ 0x0807EE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807EF08 @ =sub_807F078
	ldr r2, _0807EF0C @ =0x00002010
	ldr r1, _0807EF10 @ =sub_807F0C4
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sb, r0
	movs r2, #0
	str r2, [r0, #0x44]
	str r2, [r0, #0x48]
	mov r1, sl
	str r1, [r0]
	movs r3, #0
	mov r8, r3
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	ldrb r0, [r1]
	mov r1, sb
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	ldr r3, _0807EF14 @ =IWRAM_START + 0xC
	adds r4, r7, r3
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _0807EF18 @ =IWRAM_START + 0x2D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r3, #0x22
	adds r1, r7, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0807EF1C @ =IWRAM_START + 0x31
	adds r0, r7, r1
	mov r3, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x12
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0807EF20 @ =0x0000026A
	strh r0, [r4, #0xa]
	ldr r1, _0807EF24 @ =IWRAM_START + 0x2C
	adds r0, r7, r1
	mov r3, r8
	strb r3, [r0]
	adds r0, r4, #0
	bl sub_8004558
	mov r1, sl
	ldrb r0, [r1, #5]
	ldr r2, [sp, #4]
	ldrb r3, [r1, #6]
	cmp r0, r3
	bls _0807EF54
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0807EF34
	ldr r0, _0807EF28 @ =IWRAM_START + 0x4C
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF2C @ =IWRAM_START + 0x4E
	adds r0, r7, r1
	strh r2, [r0]
	ldr r3, _0807EF30 @ =IWRAM_START + 0x50
	adds r0, r7, r3
	strh r2, [r0]
	b _0807EF96
	.align 2, 0
_0807EF08: .4byte sub_807F078
_0807EF0C: .4byte 0x00002010
_0807EF10: .4byte sub_807F0C4
_0807EF14: .4byte IWRAM_START + 0xC
_0807EF18: .4byte IWRAM_START + 0x2D
_0807EF1C: .4byte IWRAM_START + 0x31
_0807EF20: .4byte 0x0000026A
_0807EF24: .4byte IWRAM_START + 0x2C
_0807EF28: .4byte IWRAM_START + 0x4C
_0807EF2C: .4byte IWRAM_START + 0x4E
_0807EF30: .4byte IWRAM_START + 0x50
_0807EF34:
	ldr r0, _0807EF48 @ =IWRAM_START + 0x4C
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF4C @ =IWRAM_START + 0x4E
	adds r0, r7, r1
	strh r2, [r0]
	ldr r3, _0807EF50 @ =IWRAM_START + 0x50
	b _0807EF90
	.align 2, 0
_0807EF48: .4byte IWRAM_START + 0x4C
_0807EF4C: .4byte IWRAM_START + 0x4E
_0807EF50: .4byte IWRAM_START + 0x50
_0807EF54:
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0807EF80
	ldr r3, _0807EF74 @ =IWRAM_START + 0x4C
	adds r0, r7, r3
	strh r2, [r0]
	ldr r0, _0807EF78 @ =IWRAM_START + 0x4E
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0807EF7C @ =IWRAM_START + 0x50
	adds r0, r7, r1
	strh r2, [r0]
	b _0807EF96
	.align 2, 0
_0807EF74: .4byte IWRAM_START + 0x4C
_0807EF78: .4byte IWRAM_START + 0x4E
_0807EF7C: .4byte IWRAM_START + 0x50
_0807EF80:
	ldr r3, _0807EFBC @ =IWRAM_START + 0x4C
	adds r0, r7, r3
	strh r2, [r0]
	ldr r0, _0807EFC0 @ =IWRAM_START + 0x4E
	adds r1, r7, r0
	movs r0, #4
	strh r0, [r1]
	adds r3, #4
_0807EF90:
	adds r1, r7, r3
	movs r0, #0x80
	strh r0, [r1]
_0807EF96:
	mov r0, sb
	bl sub_807EFC4
	mov r0, sb
	bl sub_807F0D8
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, sl
	strb r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFBC: .4byte IWRAM_START + 0x4C
_0807EFC0: .4byte IWRAM_START + 0x4E

	thumb_func_start sub_807EFC4
sub_807EFC4: @ 0x0807EFC4
	push {r4, r5, r6, lr}
	mov ip, r0
	ldr r6, [r0]
	mov r1, ip
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807F004
	ldrb r3, [r6, #5]
	lsls r3, r3, #0xb
	ldr r5, _0807F06C @ =gSineTable
	adds r4, r0, #0
	ldr r2, _0807F070 @ =gUnknown_03005590
	mov r0, ip
	adds r0, #0x50
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _0807F074 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x44]
_0807F004:
	mov r1, ip
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0807F03E
	ldrb r3, [r6, #6]
	lsls r3, r3, #0xb
	ldr r5, _0807F06C @ =gSineTable
	adds r4, r0, #0
	ldr r2, _0807F070 @ =gUnknown_03005590
	mov r0, ip
	adds r0, #0x50
	ldrh r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _0807F074 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r3, r0
	asrs r0, r0, #0xf
	mov r2, ip
	str r0, [r2, #0x48]
_0807F03E:
	mov r0, ip
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r2, ip
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldrb r1, [r6, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r2, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F06C: .4byte gSineTable
_0807F070: .4byte gUnknown_03005590
_0807F074: .4byte 0x000003FF

	thumb_func_start sub_807F078
sub_807F078: @ 0x0807F078
	push {r4, lr}
	ldr r0, _0807F0B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807EFC4
	adds r0, r4, #0
	bl sub_807F17C
	cmp r0, #0
	beq _0807F09C
	ldr r0, _0807F0B4 @ =gPlayer
	bl sub_800CBA4
_0807F09C:
	adds r0, r4, #0
	bl sub_807F120
	cmp r0, #0
	beq _0807F0B8
	adds r0, r4, #0
	bl sub_807F1B4
	b _0807F0BE
	.align 2, 0
_0807F0B0: .4byte gCurTask
_0807F0B4: .4byte gPlayer
_0807F0B8:
	adds r0, r4, #0
	bl sub_807F0D8
_0807F0BE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807F0C4
sub_807F0C4: @ 0x0807F0C4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807F0D8
sub_807F0D8: @ 0x0807F0D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	ldr r2, _0807F118 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x22]
	ldr r0, [r4, #0x40]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x24]
	ldr r0, [r4, #0x1c]
	ldr r1, _0807F11C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x1c]
	adds r5, r4, #0
	adds r5, #0xc
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, [r4, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x1c]
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F118: .4byte gCamera
_0807F11C: .4byte 0xFFFFFBFF

	thumb_func_start sub_807F120
sub_807F120: @ 0x0807F120
	push {r4, r5, lr}
	ldr r4, [r0]
	ldr r2, [r0, #0x3c]
	ldr r3, _0807F170 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrb r0, [r4, #5]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _0807F16A
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _0807F16A
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldrb r0, [r4, #6]
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x80
	cmn r2, r0
	blt _0807F16A
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	ble _0807F174
_0807F16A:
	movs r0, #1
	b _0807F176
	.align 2, 0
_0807F170: .4byte gCamera
_0807F174:
	movs r0, #0
_0807F176:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807F17C
sub_807F17C: @ 0x0807F17C
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807F1A8 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F1A2
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	bl sub_800DF38
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _0807F1AC
_0807F1A2:
	movs r0, #0
	b _0807F1AE
	.align 2, 0
_0807F1A8: .4byte gPlayer
_0807F1AC:
	movs r0, #1
_0807F1AE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807F1B4
sub_807F1B4: @ 0x0807F1B4
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807F1C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807F1C8: .4byte gCurTask

	thumb_func_start initSprite_Interactable_SkyCanyon_FlyingHandle
initSprite_Interactable_SkyCanyon_FlyingHandle: @ 0x0807F1CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov sl, r6
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	ldr r0, _0807F32C @ =sub_807F694
	ldr r2, _0807F330 @ =0x00002010
	ldr r1, _0807F334 @ =sub_807F75C
	str r1, [sp]
	movs r1, #0x84
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r3, _0807F338 @ =IWRAM_START + 0x68
	adds r0, r2, r3
	movs r6, #0
	mov ip, r6
	mov r1, ip
	strb r1, [r0]
	subs r3, #0xc
	adds r0, r2, r3
	mov r6, ip
	strh r6, [r0]
	ldr r1, _0807F33C @ =IWRAM_START + 0x5E
	adds r0, r2, r1
	strh r6, [r0]
	mov r3, ip
	str r3, [r7, #0x60]
	ldrb r0, [r5]
	lsls r0, r0, #3
	mov r6, sl
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r7, #0x3c]
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r7, #0x40]
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r6, _0807F340 @ =IWRAM_START + 0x54
	adds r1, r2, r6
	strh r0, [r1]
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r3, _0807F344 @ =IWRAM_START + 0x56
	adds r4, r2, r3
	strh r0, [r4]
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	ldrh r6, [r1]
	adds r0, r0, r6
	ldr r6, _0807F348 @ =IWRAM_START + 0x58
	adds r3, r2, r6
	strh r0, [r3]
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	ldrh r4, [r4]
	adds r0, r0, r4
	adds r6, #2
	adds r4, r2, r6
	strh r0, [r4]
	movs r6, #0
	ldrsh r0, [r1, r6]
	movs r6, #0
	ldrsh r1, [r3, r6]
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [r7, #0x3c]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r7, #0x44]
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r7, #0x48]
	mov r1, ip
	str r1, [r7, #0x4c]
	str r1, [r7, #0x50]
	mov r3, sl
	strh r3, [r7, #4]
	mov r6, r8
	strh r6, [r7, #6]
	str r5, [r7]
	ldrb r0, [r5]
	strb r0, [r7, #8]
	mov r0, sb
	strb r0, [r7, #9]
	movs r1, #0
	ldr r3, _0807F34C @ =IWRAM_START + 0x6C
	adds r2, r2, r3
_0807F2B6:
	ldr r0, [r7, #0x44]
	str r0, [r2]
	ldr r0, [r7, #0x48]
	str r0, [r2, #4]
	adds r2, #8
	adds r1, #1
	cmp r1, #2
	bls _0807F2B6
	adds r4, r7, #0
	adds r4, #0xc
	movs r6, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x19
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x94
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r6, [r0]
	adds r0, r4, #0
	bl sub_8004558
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F32C: .4byte sub_807F694
_0807F330: .4byte 0x00002010
_0807F334: .4byte sub_807F75C
_0807F338: .4byte IWRAM_START + 0x68
_0807F33C: .4byte IWRAM_START + 0x5E
_0807F340: .4byte IWRAM_START + 0x54
_0807F344: .4byte IWRAM_START + 0x56
_0807F348: .4byte IWRAM_START + 0x58
_0807F34C: .4byte IWRAM_START + 0x6C

	thumb_func_start sub_807F350
sub_807F350: @ 0x0807F350
	push {r4, r5, lr}
	ldr r0, _0807F388 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807F38C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F36C
	adds r0, r4, #0
	bl sub_807F8B4
_0807F36C:
	adds r0, r4, #0
	bl sub_807F818
	ldr r3, _0807F390 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807F394
	adds r0, r4, #0
	bl sub_807F770
	b _0807F3DC
	.align 2, 0
_0807F388: .4byte gCurTask
_0807F38C: .4byte gGameMode
_0807F390: .4byte gPlayer
_0807F394:
	movs r1, #0x2c
	ldrsh r0, [r3, r1]
	cmp r0, #0x78
	bne _0807F3A4
	adds r0, r4, #0
	bl sub_807F798
	b _0807F3DC
_0807F3A4:
	ldr r1, _0807F408 @ =IWRAM_START + 0x69
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _0807F3E8
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0807F40C @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0807F3DC
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0807F3D4
	movs r0, #1
_0807F3D4:
	str r0, [r4, #0x64]
	adds r0, r4, #0
	bl sub_807F484
_0807F3DC:
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807F3EE
_0807F3E8:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0807F3EE:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F7D0
	adds r0, r4, #0
	bl sub_807F5C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F408: .4byte IWRAM_START + 0x69
_0807F40C: .4byte gPlayerControls

	thumb_func_start sub_807F410
sub_807F410: @ 0x0807F410
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0807F470 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #0x37
	strh r0, [r1]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x10]
	strh r5, [r2, #0x12]
	adds r0, r4, #0
	bl sub_807F7D0
	movs r0, #1
	str r0, [r4, #0x60]
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _0807F474 @ =0x0000FE80
	strh r0, [r1]
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x48]
	str r5, [r4, #0x4c]
	str r5, [r4, #0x50]
	adds r4, #0x69
	movs r0, #0x1e
	strb r0, [r4]
	ldr r0, _0807F478 @ =0x00000123
	bl m4aSongNumStart
	ldr r0, _0807F47C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F480 @ =sub_807F350
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F470: .4byte gPlayer
_0807F474: .4byte 0x0000FE80
_0807F478: .4byte 0x00000123
_0807F47C: .4byte gCurTask
_0807F480: .4byte sub_807F350

	thumb_func_start sub_807F484
sub_807F484: @ 0x0807F484
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0807F4DC @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _0807F4E0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x10]
	strh r2, [r4, #0x12]
	adds r5, #0x69
	movs r0, #0x1e
	strb r0, [r5]
	ldr r0, _0807F4E4 @ =0x00000123
	bl m4aSongNumStop
	ldr r0, _0807F4E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F4EC @ =sub_807F6F0
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F4DC: .4byte gPlayer
_0807F4E0: .4byte 0xFFBFFFFF
_0807F4E4: .4byte 0x00000123
_0807F4E8: .4byte gCurTask
_0807F4EC: .4byte sub_807F6F0

	thumb_func_start sub_807F4F0
sub_807F4F0: @ 0x0807F4F0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x60]
	cmp r0, #0
	beq _0807F58A
	adds r2, r3, #0
	adds r2, #0x56
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r3, #0x48]
	adds r5, r2, #0
	adds r4, r3, #0
	adds r4, #0x5e
	cmp r1, r0
	bgt _0807F540
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0807F540
	ldr r1, _0807F53C @ =gSineTable
	adds r2, #0x12
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r3, #0x50]
	ldrb r0, [r2]
	adds r0, #4
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4]
	b _0807F5B6
	.align 2, 0
_0807F53C: .4byte gSineTable
_0807F540:
	adds r1, r4, #0
	ldrh r0, [r1]
	adds r0, #0x10
	strh r0, [r1]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0807F558
	adds r2, r1, #0
_0807F558:
	strh r2, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r1, [r3, #0x48]
	subs r1, r1, r0
	str r1, [r3, #0x48]
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r0, [r3, #0x40]
	adds r0, r0, r2
	lsls r0, r0, #8
	cmp r1, r0
	bgt _0807F5B6
	movs r0, #0
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	adds r1, r3, #0
	adds r1, #0x68
	movs r0, #0x80
	b _0807F5B4
_0807F58A:
	adds r0, r3, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r3, #0x40]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r3, #0x48]
	ldr r2, _0807F5BC @ =gSineTable
	adds r1, r3, #0
	adds r1, #0x68
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	str r0, [r3, #0x50]
	ldrb r0, [r1]
	adds r0, #4
_0807F5B4:
	strb r0, [r1]
_0807F5B6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5BC: .4byte gSineTable

	thumb_func_start sub_807F5C0
sub_807F5C0: @ 0x0807F5C0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807F5E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F5E8
	ldr r0, [r3, #0x74]
	asrs r0, r0, #8
	ldr r2, _0807F5E4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x78]
	b _0807F5FE
	.align 2, 0
_0807F5E0: .4byte gGameMode
_0807F5E4: .4byte gCamera
_0807F5E8:
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r2, _0807F618 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0x48]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
_0807F5FE:
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F618: .4byte gCamera

	thumb_func_start sub_807F61C
sub_807F61C: @ 0x0807F61C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0807F684 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F680
	ldr r3, [r4, #0x44]
	ldr r0, [r4, #0x4c]
	adds r3, r3, r0
	asrs r3, r3, #8
	ldr r2, _0807F688 @ =gCamera
	ldr r5, [r2]
	subs r3, r3, r5
	ldr r1, [r4, #0x48]
	ldr r0, [r4, #0x50]
	adds r1, r1, r0
	asrs r1, r1, #8
	ldr r4, [r2, #4]
	subs r1, r1, r4
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r5
	ldr r2, [r6, #0xc]
	asrs r2, r2, #8
	subs r2, r2, r4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r3, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r1, r1, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r2, r3, #0
	muls r2, r3, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r1, r0
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	ble _0807F68C
_0807F680:
	movs r0, #0
	b _0807F68E
	.align 2, 0
_0807F684: .4byte gPlayer
_0807F688: .4byte gCamera
_0807F68C:
	movs r0, #1
_0807F68E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807F694
sub_807F694: @ 0x0807F694
	push {r4, lr}
	ldr r0, _0807F6D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807F6D8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F6B0
	adds r0, r4, #0
	bl sub_807F8B4
_0807F6B0:
	adds r0, r4, #0
	bl sub_807F61C
	cmp r0, #0
	beq _0807F6C0
	adds r0, r4, #0
	bl sub_807F410
_0807F6C0:
	adds r0, r4, #0
	bl sub_807F828
	cmp r0, #0
	beq _0807F6DC
	adds r0, r4, #0
	bl sub_807F89C
	b _0807F6E8
	.align 2, 0
_0807F6D4: .4byte gCurTask
_0807F6D8: .4byte gGameMode
_0807F6DC:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F5C0
_0807F6E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F6F0
sub_807F6F0: @ 0x0807F6F0
	push {r4, r5, lr}
	ldr r0, _0807F734 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807F738 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807F70C
	adds r0, r4, #0
	bl sub_807F8B4
_0807F70C:
	ldr r0, _0807F73C @ =IWRAM_START + 0x69
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0807F744
	ldr r0, _0807F740 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807F72C
	adds r0, r4, #0
	bl sub_807F61C
	cmp r0, #0
	bne _0807F748
_0807F72C:
	adds r0, r4, #0
	bl sub_807F784
	b _0807F748
	.align 2, 0
_0807F734: .4byte gCurTask
_0807F738: .4byte gGameMode
_0807F73C: .4byte IWRAM_START + 0x69
_0807F740: .4byte gPlayer
_0807F744:
	subs r0, #1
	strb r0, [r1]
_0807F748:
	adds r0, r4, #0
	bl sub_807F4F0
	adds r0, r4, #0
	bl sub_807F5C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807F75C
sub_807F75C: @ 0x0807F75C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807F770
sub_807F770: @ 0x0807F770
	ldr r0, _0807F77C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F780 @ =sub_807F694
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807F77C: .4byte gCurTask
_0807F780: .4byte sub_807F694

	thumb_func_start sub_807F784
sub_807F784: @ 0x0807F784
	ldr r0, _0807F790 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F794 @ =sub_807F694
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807F790: .4byte gCurTask
_0807F794: .4byte sub_807F694

	thumb_func_start sub_807F798
sub_807F798: @ 0x0807F798
	push {lr}
	ldr r3, _0807F7BC @ =gPlayer
	ldr r1, [r3, #0x20]
	ldr r2, _0807F7C0 @ =0xFFBFFFFF
	ands r1, r2
	str r1, [r3, #0x20]
	adds r0, #0x69
	movs r1, #0x1e
	strb r1, [r0]
	ldr r0, _0807F7C4 @ =0x00000123
	bl m4aSongNumStop
	ldr r0, _0807F7C8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F7CC @ =sub_807F6F0
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807F7BC: .4byte gPlayer
_0807F7C0: .4byte 0xFFBFFFFF
_0807F7C4: .4byte 0x00000123
_0807F7C8: .4byte gCurTask
_0807F7CC: .4byte sub_807F6F0

	thumb_func_start sub_807F7D0
sub_807F7D0: @ 0x0807F7D0
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807F7F0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	cmp r1, #0
	beq _0807F7F4
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	b _0807F7FC
	.align 2, 0
_0807F7F0: .4byte gPlayer
_0807F7F4:
	ldr r0, [r3, #0x44]
	ldr r1, [r3, #0x4c]
	adds r0, r0, r1
	ldr r1, _0807F814 @ =0xFFFFFC00
_0807F7FC:
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, [r3, #0x48]
	ldr r1, [r3, #0x50]
	adds r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #5
	adds r0, r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_0807F814: .4byte 0xFFFFFC00

	thumb_func_start sub_807F818
sub_807F818: @ 0x0807F818
	push {lr}
	ldr r0, _0807F824 @ =0x00000123
	bl m4aSongNumStartOrContinue
	pop {r0}
	bx r0
	.align 2, 0
_0807F824: .4byte 0x00000123

	thumb_func_start sub_807F828
sub_807F828: @ 0x0807F828
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x3c]
	ldr r1, _0807F890 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0x40]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r3, #0
	adds r0, #0x58
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _0807F88A
	adds r0, r3, #0
	adds r0, #0x54
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _0807F88A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x5a
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _0807F88A
	adds r0, r3, #0
	adds r0, #0x56
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _0807F894
_0807F88A:
	movs r0, #1
	b _0807F896
	.align 2, 0
_0807F890: .4byte gCamera
_0807F894:
	movs r0, #0
_0807F896:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807F89C
sub_807F89C: @ 0x0807F89C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807F8B0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807F8B0: .4byte gCurTask

	thumb_func_start sub_807F8B4
sub_807F8B4: @ 0x0807F8B4
	ldr r1, [r0, #0x74]
	str r1, [r0, #0x7c]
	adds r2, r0, #0
	adds r2, #0x80
	ldr r1, [r0, #0x78]
	str r1, [r2]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x70]
	str r1, [r0, #0x78]
	ldr r1, [r0, #0x44]
	ldr r2, [r0, #0x4c]
	adds r1, r1, r2
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x48]
	ldr r2, [r0, #0x50]
	adds r1, r1, r2
	str r1, [r0, #0x70]
	bx lr
	.align 2, 0

	thumb_func_start initSprite_Interactable097
initSprite_Interactable097: @ 0x0807F8DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0807F9D8 @ =sub_807FDCC
	ldr r2, _0807F9DC @ =0x00002010
	ldr r1, _0807F9E0 @ =sub_807FE20
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	movs r1, #0
	str r1, [r7, #0x54]
	ldr r3, _0807F9E4 @ =IWRAM_START + 0x58
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _0807F9E8 @ =IWRAM_START + 0x5E
	adds r1, r2, r0
	movs r0, #0x20
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r7, #0x3c]
	mov r3, r8
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r7, #0x40]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x44]
	movs r0, #0x90
	lsls r0, r0, #5
	str r0, [r7, #0x48]
	strh r4, [r7, #4]
	strh r5, [r7, #6]
	str r3, [r7]
	ldrb r0, [r3]
	strb r0, [r7, #8]
	strb r6, [r7, #9]
	movs r1, #0
	ldr r0, _0807F9EC @ =IWRAM_START + 0x60
	adds r2, r2, r0
_0807F964:
	ldr r0, [r7, #0x44]
	str r0, [r2]
	ldr r0, [r7, #0x48]
	str r0, [r2, #4]
	adds r2, #8
	adds r1, #1
	cmp r1, #2
	bls _0807F964
	adds r4, r7, #0
	adds r4, #0xc
	movs r5, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x99
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_8004558
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r3, r8
	strb r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F9D8: .4byte sub_807FDCC
_0807F9DC: .4byte 0x00002010
_0807F9E0: .4byte sub_807FE20
_0807F9E4: .4byte IWRAM_START + 0x58
_0807F9E8: .4byte IWRAM_START + 0x5E
_0807F9EC: .4byte IWRAM_START + 0x60

	thumb_func_start sub_807F9F0
sub_807F9F0: @ 0x0807F9F0
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0807FA74 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FA78 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FA0E
	adds r0, r4, #0
	bl sub_807FF04
_0807FA0E:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FA60
	ldr r1, _0807FA7C @ =IWRAM_START + 0x5A
	adds r0, r5, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _0807FA60
	ldr r1, [r4, #0x48]
	asrs r1, r1, #8
	ldr r0, [r4, #0x40]
	adds r0, r0, r1
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r2, _0807FA80 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0807FA60
	movs r3, #0
	str r3, [r4, #0x4c]
	ldr r2, _0807FA84 @ =gPlayer
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	str r3, [r2, #0x3c]
_0807FA60:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FA88
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FA8E
	.align 2, 0
_0807FA74: .4byte gCurTask
_0807FA78: .4byte gGameMode
_0807FA7C: .4byte IWRAM_START + 0x5A
_0807FA80: .4byte sub_801EC3C
_0807FA84: .4byte gPlayer
_0807FA88:
	adds r0, r4, #0
	bl sub_807FC20
_0807FA8E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807FA98
sub_807FA98: @ 0x0807FA98
	push {r4, lr}
	mov ip, r0
	ldr r0, _0807FB0C @ =0x00032E00
	mov r1, ip
	str r0, [r1, #0x44]
	movs r0, #0x90
	lsls r0, r0, #0xa
	str r0, [r1, #0x48]
	mov r4, ip
	adds r4, #0x5e
	movs r0, #0xe0
	strb r0, [r4]
	mov r2, ip
	adds r2, #0x5c
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r2]
	ldr r3, _0807FB10 @ =gSineTable
	ldrb r0, [r4]
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #3
	mov r1, ip
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x54]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStop
	ldr r0, _0807FB14 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FB18 @ =sub_807F9F0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB0C: .4byte 0x00032E00
_0807FB10: .4byte gSineTable
_0807FB14: .4byte gCurTask
_0807FB18: .4byte sub_807F9F0

	thumb_func_start sub_807FB1C
sub_807FB1C: @ 0x0807FB1C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807FB88
	adds r5, r4, #0
	adds r5, #0x5c
	ldrh r2, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0807FB3A
	adds r2, r1, #0
_0807FB3A:
	strh r2, [r5]
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _0807FB84 @ =gSineTable
	movs r0, #0x5e
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r4, #0
	adds r2, #0x58
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r5, ip
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r3, r1, #0
	b _0807FBAA
	.align 2, 0
_0807FB84: .4byte gSineTable
_0807FB88:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	adds r5, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #4
	adds r3, r1, #0
	cmp r0, r2
	ble _0807FBA4
	adds r5, r2, #0
_0807FBA4:
	strh r5, [r3]
	adds r2, r4, #0
	adds r2, #0x58
_0807FBAA:
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4, #0x44]
	adds r6, r0, r1
	str r6, [r4, #0x44]
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r4, #0x48]
	adds r7, r0, r1
	str r7, [r4, #0x48]
	ldr r5, _0807FC1C @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807FC0C
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FC0C
	adds r2, r4, #0
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	adds r0, r0, r6
	adds r1, r1, r0
	str r1, [r5, #8]
	adds r3, r4, #0
	adds r3, #0x52
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r4, #0x40]
	lsls r0, r0, #8
	adds r0, r0, r7
	adds r1, r1, r0
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	lsls r0, r0, #8
	subs r1, r1, r0
	str r1, [r5, #0xc]
	ldrh r0, [r5, #0x10]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r5, #0x12]
	ldrh r2, [r3]
	adds r0, r0, r2
	strh r0, [r3]
_0807FC0C:
	adds r0, r4, #0
	bl sub_807FC9C
	str r0, [r4, #0x4c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC1C: .4byte gPlayer

	thumb_func_start sub_807FC20
sub_807FC20: @ 0x0807FC20
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r0, _0807FC48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FC50
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x68]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC4C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x6c]
	b _0807FC64
	.align 2, 0
_0807FC48: .4byte gGameMode
_0807FC4C: .4byte gCamera
_0807FC50:
	ldr r1, [r3, #0x3c]
	ldr r0, [r3, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r2, _0807FC94 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r3, #0x48]
_0807FC64:
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	ldr r1, _0807FC98 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC94: .4byte gCamera
_0807FC98: .4byte 0xFFFFFBFF

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 0x0807FC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0807FD04
	ldr r5, _0807FCC0 @ =gPlayer
	ldr r1, [r5, #0x20]
	ldr r0, _0807FCC4 @ =0x01400082
	ands r0, r1
	cmp r0, #0
	beq _0807FCC8
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r0, #0
	str r0, [r5, #0x3c]
	b _0807FD06
	.align 2, 0
_0807FCC0: .4byte gPlayer
_0807FCC4: .4byte 0x01400082
_0807FCC8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	beq _0807FCFC
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, _0807FD00 @ =gCamera
	ldr r2, [r0]
	subs r1, r1, r2
	subs r1, #0x1b
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807FD04
	adds r0, r1, #0
	adds r0, #0x36
	cmp r0, r2
	blt _0807FD04
_0807FCFC:
	movs r0, #1
	b _0807FD06
	.align 2, 0
_0807FD00: .4byte gCamera
_0807FD04:
	movs r0, #0
_0807FD06:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_807FD0C
sub_807FD0C: @ 0x0807FD0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807FD58 @ =gPlayer
	ldr r6, [r5, #0x20]
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	bne _0807FDC4
	adds r0, r4, #0
	adds r0, #0xc
	ldr r2, [r4, #0x44]
	asrs r2, r2, #8
	ldr r1, [r4, #0x3c]
	adds r1, r1, r2
	ldr r3, [r4, #0x48]
	asrs r3, r3, #8
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807FDC4
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807FD5C
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r6, [r5, #0x12]
	movs r0, #2
	b _0807FDC6
	.align 2, 0
_0807FD58: .4byte gPlayer
_0807FD5C:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807FD7E
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0x14]
	b _0807FD9E
_0807FD7E:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807FDAA
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0807FD9E:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #1
	b _0807FDC6
_0807FDAA:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807FDC4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #1
	b _0807FDC6
_0807FDC4:
	movs r0, #0
_0807FDC6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807FDCC
sub_807FDCC: @ 0x0807FDCC
	push {r4, lr}
	ldr r0, _0807FE0C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FE10 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FDE8
	adds r0, r4, #0
	bl sub_807FF04
_0807FDE8:
	adds r0, r4, #0
	bl sub_807FD0C
	cmp r0, #2
	bne _0807FDF8
	adds r0, r4, #0
	bl sub_807FE34
_0807FDF8:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FE14
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FE1A
	.align 2, 0
_0807FE0C: .4byte gCurTask
_0807FE10: .4byte gGameMode
_0807FE14:
	adds r0, r4, #0
	bl sub_807FC20
_0807FE1A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807FE20
sub_807FE20: @ 0x0807FE20
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807FE34
sub_807FE34: @ 0x0807FE34
	push {r4, lr}
	mov ip, r0
	ldr r3, _0807FE84 @ =gPlayer
	ldr r2, [r3, #8]
	ldr r1, [r0, #0x3c]
	lsls r1, r1, #8
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	subs r2, r2, r0
	mov r0, ip
	adds r0, #0x50
	strh r2, [r0]
	ldr r2, [r3, #0xc]
	mov r0, ip
	ldr r1, [r0, #0x40]
	lsls r1, r1, #8
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	subs r2, r2, r0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	lsls r0, r0, #8
	adds r2, r2, r0
	mov r0, ip
	adds r0, #0x52
	strh r2, [r0]
	movs r0, #1
	mov r1, ip
	str r0, [r1, #0x4c]
	movs r0, #0x90
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807FE88 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FE8C @ =sub_807FF20
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE84: .4byte gPlayer
_0807FE88: .4byte gCurTask
_0807FE8C: .4byte sub_807FF20

	thumb_func_start sub_807FE90
sub_807FE90: @ 0x0807FE90
	push {lr}
	ldr r2, [r0, #0x3c]
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	adds r2, r2, r1
	ldr r3, _0807FEE0 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r1, [r0, #0x40]
	ldr r0, [r0, #0x48]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r3, #4]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r2, r2, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r2, r0
	bhi _0807FEDA
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807FEDA
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807FEE4
_0807FEDA:
	movs r0, #1
	b _0807FEE6
	.align 2, 0
_0807FEE0: .4byte gCamera
_0807FEE4:
	movs r0, #0
_0807FEE6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807FEEC
sub_807FEEC: @ 0x0807FEEC
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807FF00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gCurTask

	thumb_func_start sub_807FF04
sub_807FF04: @ 0x0807FF04
	ldr r1, [r0, #0x68]
	str r1, [r0, #0x70]
	ldr r1, [r0, #0x6c]
	str r1, [r0, #0x74]
	ldr r1, [r0, #0x60]
	str r1, [r0, #0x68]
	ldr r1, [r0, #0x64]
	str r1, [r0, #0x6c]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x48]
	str r1, [r0, #0x64]
	bx lr
	.align 2, 0

	thumb_func_start sub_807FF20
sub_807FF20: @ 0x0807FF20
	push {r4, r5, lr}
	ldr r0, _0807FF6C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0807FF70 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FF3C
	adds r0, r4, #0
	bl sub_807FF04
_0807FF3C:
	ldr r0, _0807FF74 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #0x20
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FF78 @ =0x00024DFF
	cmp r1, r0
	ble _0807FF5A
	adds r0, r4, #0
	bl sub_807FF88
_0807FF5A:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _0807FF7C
	adds r0, r4, #0
	bl sub_807FEEC
	b _0807FF82
	.align 2, 0
_0807FF6C: .4byte gCurTask
_0807FF70: .4byte gGameMode
_0807FF74: .4byte IWRAM_START + 0x5C
_0807FF78: .4byte 0x00024DFF
_0807FF7C:
	adds r0, r4, #0
	bl sub_807FC20
_0807FF82:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_807FF88
sub_807FF88: @ 0x0807FF88
	ldr r1, _0807FFA4 @ =0x00024E00
	str r1, [r0, #0x44]
	movs r1, #0x90
	lsls r1, r1, #0xa
	str r1, [r0, #0x48]
	adds r0, #0x5e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807FFA8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807FFAC @ =sub_807FFB0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807FFA4: .4byte 0x00024E00
_0807FFA8: .4byte gCurTask
_0807FFAC: .4byte sub_807FFB0

	thumb_func_start sub_807FFB0
sub_807FFB0: @ 0x0807FFB0
	push {r4, lr}
	ldr r0, _0807FFF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0807FFF8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0807FFCC
	adds r0, r4, #0
	bl sub_807FF04
_0807FFCC:
	adds r0, r4, #0
	bl sub_807FB1C
	ldr r1, [r4, #0x44]
	ldr r0, _0807FFFC @ =0x00032DFF
	cmp r1, r0
	ble _0807FFE0
	adds r0, r4, #0
	bl sub_807FA98
_0807FFE0:
	adds r0, r4, #0
	bl sub_807FE90
	cmp r0, #0
	beq _08080000
	adds r0, r4, #0
	bl sub_807FEEC
	b _08080006
	.align 2, 0
_0807FFF4: .4byte gCurTask
_0807FFF8: .4byte gGameMode
_0807FFFC: .4byte 0x00032DFF
_08080000:
	adds r0, r4, #0
	bl sub_807FC20
_08080006:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_808000C
sub_808000C: @ 0x0808000C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov sl, r3
	ldr r6, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, sl
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080800C0 @ =sub_80801F8
	ldr r2, _080800C4 @ =0x00002010
	ldr r1, _080800C8 @ =sub_8080230
	str r1, [sp]
	movs r1, #0x2c
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r2, #0xc0
	lsls r2, r2, #0x12
	add r2, sb
	strh r6, [r2, #0x14]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	str r5, [r2, #0x24]
	ldrb r1, [r5]
	ldr r0, _080800CC @ =IWRAM_START + 0x28
	add r0, sb
	strb r1, [r0]
	ldr r0, _080800D0 @ =IWRAM_START + 0x29
	add sb, r0
	mov r5, sl
	mov r1, sb
	strb r5, [r1]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r5, r8
	strb r0, [r5]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800C0: .4byte sub_80801F8
_080800C4: .4byte 0x00002010
_080800C8: .4byte sub_8080230
_080800CC: .4byte IWRAM_START + 0x28
_080800D0: .4byte IWRAM_START + 0x29

	thumb_func_start sub_80800D4
sub_80800D4: @ 0x080800D4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x14]
	cmp r0, #1
	beq _08080104
	cmp r0, #1
	bgt _080800E8
	cmp r0, #0
	beq _080800EE
	b _0808015E
_080800E8:
	cmp r0, #2
	beq _08080114
	b _0808015E
_080800EE:
	ldr r2, _080800FC @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08080100 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	b _0808015E
	.align 2, 0
_080800FC: .4byte gUnknown_03005424
_08080100: .4byte 0x0000FF7F
_08080104:
	ldr r0, _08080110 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	b _0808015C
	.align 2, 0
_08080110: .4byte gUnknown_03005424
_08080114:
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	cmp r1, #0
	ble _08080126
	ldr r0, _0808016C @ =gPlayer
	movs r3, #0x10
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bgt _08080154
_08080126:
	cmp r1, #0
	bge _08080134
	ldr r0, _0808016C @ =gPlayer
	movs r1, #0x10
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08080154
_08080134:
	movs r3, #0x1a
	ldrsh r1, [r2, r3]
	cmp r1, #0
	ble _08080146
	ldr r0, _0808016C @ =gPlayer
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bgt _08080154
_08080146:
	cmp r1, #0
	bge _0808015E
	ldr r0, _0808016C @ =gPlayer
	movs r3, #0x12
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0808015E
_08080154:
	ldr r0, _08080170 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	eors r1, r2
_0808015C:
	strh r1, [r0]
_0808015E:
	ldr r0, _08080174 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080178 @ =sub_80801F8
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0808016C: .4byte gPlayer
_08080170: .4byte gUnknown_03005424
_08080174: .4byte gCurTask
_08080178: .4byte sub_80801F8

	thumb_func_start sub_808017C
sub_808017C: @ 0x0808017C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _080801E8 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080801F0
	ldr r2, [r5]
	ldrh r0, [r5, #8]
	adds r2, r2, r0
	ldr r3, _080801EC @ =gCamera
	ldr r4, [r3]
	subs r2, r2, r4
	ldr r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	adds r0, r0, r1
	ldr r3, [r3, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _080801F0
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r0, r1
	blt _080801F0
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _080801F0
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r0, r1
	blt _080801F0
	movs r0, #1
	b _080801F2
	.align 2, 0
_080801E8: .4byte gPlayer
_080801EC: .4byte gCamera
_080801F0:
	movs r0, #0
_080801F2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80801F8
sub_80801F8: @ 0x080801F8
	push {r4, lr}
	ldr r0, _0808022C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_808017C
	cmp r0, #0
	beq _08080216
	adds r0, r4, #0
	bl sub_8080234
_08080216:
	adds r0, r4, #0
	bl sub_8080254
	cmp r0, #0
	beq _08080226
	adds r0, r4, #0
	bl sub_808029C
_08080226:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808022C: .4byte gCurTask

	thumb_func_start sub_8080230
sub_8080230: @ 0x08080230
	bx lr
	.align 2, 0

	thumb_func_start sub_8080234
sub_8080234: @ 0x08080234
	ldr r2, _08080248 @ =gPlayer
	ldrh r1, [r2, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [r2, #0x12]
	strh r1, [r0, #0x1a]
	ldr r0, _0808024C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080250 @ =sub_8080318
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08080248: .4byte gPlayer
_0808024C: .4byte gCurTask
_08080250: .4byte sub_8080318

	thumb_func_start sub_8080254
sub_8080254: @ 0x08080254
	push {lr}
	ldr r1, [r0]
	ldr r3, _08080290 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
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
	bhi _0808028C
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0808028C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08080294
_0808028C:
	movs r0, #1
	b _08080296
	.align 2, 0
_08080290: .4byte gCamera
_08080294:
	movs r0, #0
_08080296:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_808029C
sub_808029C: @ 0x0808029C
	push {lr}
	ldr r1, [r0, #0x24]
	adds r0, #0x28
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080802B4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080802B4: .4byte gCurTask

	thumb_func_start initSprite_Interactable098
initSprite_Interactable098: @ 0x080802B8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_808000C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable099
initSprite_Interactable099: @ 0x080802D8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_808000C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable100
initSprite_Interactable100: @ 0x080802F8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_808000C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8080318
sub_8080318: @ 0x08080318
	push {r4, lr}
	ldr r0, _08080360 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08080364 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08080338
	adds r0, r4, #0
	bl sub_80800D4
_08080338:
	adds r0, r4, #0
	bl sub_808017C
	cmp r0, #0
	bne _08080348
	adds r0, r4, #0
	bl sub_80800D4
_08080348:
	adds r0, r4, #0
	bl sub_8080254
	cmp r0, #0
	beq _08080358
	adds r0, r4, #0
	bl sub_808029C
_08080358:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080360: .4byte gCurTask
_08080364: .4byte gPlayer

	thumb_func_start sub_8080368
sub_8080368: @ 0x08080368
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080803F4 @ =sub_80806F4
	ldr r2, _080803F8 @ =0x00002010
	movs r5, #0
	str r5, [sp]
	movs r1, #0x24
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	str r5, [r2, #0x14]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	str r5, [r2, #0x1c]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080803F4: .4byte sub_80806F4
_080803F8: .4byte 0x00002010

	thumb_func_start sub_80803FC
sub_80803FC: @ 0x080803FC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #8
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	blt _08080412
	b _08080510
_08080412:
	ldr r0, _08080454 @ =gPlayer
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	adds r1, r2, r1
	lsls r1, r1, #8
	ldr r0, [r0, #8]
	cmp r0, r1
	ble _08080510
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _080804F8
	ldrh r0, [r5, #0x18]
	adds r2, r0, #1
	strh r2, [r5, #0x18]
	movs r0, #0x1a
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08080502
	strh r2, [r5, #0x1a]
	ldr r0, _08080458 @ =gUnknown_030053E4
	ldr r0, [r0]
	ldr r1, [r5, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xe1
	lsls r0, r0, #3
	cmp r7, r0
	bls _0808045C
	movs r1, #5
	b _08080468
	.align 2, 0
_08080454: .4byte gPlayer
_08080458: .4byte gUnknown_030053E4
_0808045C:
	movs r0, #0x96
	lsls r0, r0, #3
	movs r1, #0xf
	cmp r7, r0
	bls _08080468
	movs r1, #0xa
_08080468:
	ldr r2, _080804D8 @ =gCourseTime
	ldrh r6, [r2]
	adds r0, r1, r6
	strh r0, [r2]
	ldr r0, _080804DC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080804AE
	ldrh r0, [r2]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _080804AE
	ldr r0, _080804E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080804AE
	ldr r1, _080804E4 @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _080804A6
	movs r0, #0xff
_080804A6:
	strb r0, [r1]
	ldr r1, _080804E8 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_080804AE:
	ldr r0, _080804E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080804C2
	ldr r1, _080804D8 @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _080804C2
	movs r0, #0xff
	strh r0, [r1]
_080804C2:
	ldr r0, _080804EC @ =0x0000019B
	bl m4aSongNumStart
	bl sub_8080664
	ldr r0, _080804F0 @ =gUnknown_030053E4
	ldr r0, [r0]
	str r0, [r5, #0x14]
	ldr r0, _080804F4 @ =gUnknown_03005B6C
	str r7, [r0]
	b _08080502
	.align 2, 0
_080804D8: .4byte gCourseTime
_080804DC: .4byte gCurrentLevel
_080804E0: .4byte gGameMode
_080804E4: .4byte gUnknown_03005448
_080804E8: .4byte gUnknown_030054A8
_080804EC: .4byte 0x0000019B
_080804F0: .4byte gUnknown_030053E4
_080804F4: .4byte gUnknown_03005B6C
_080804F8:
	movs r0, #1
	str r0, [r5, #0x1c]
	ldr r0, _08080508 @ =gUnknown_030053E4
	ldr r0, [r0]
	str r0, [r5, #0x14]
_08080502:
	ldr r0, _0808050C @ =gPlayer
	ldr r0, [r0, #8]
	b _0808053E
	.align 2, 0
_08080508: .4byte gUnknown_030053E4
_0808050C: .4byte gPlayer
_08080510:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	ble _08080540
	ldr r3, _08080550 @ =gPlayer
	movs r1, #8
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	bge _08080540
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0808053C
	ldrh r0, [r5, #0x18]
	subs r0, #1
	strh r0, [r5, #0x18]
_0808053C:
	ldr r0, [r3, #8]
_0808053E:
	str r0, [r5, #0x20]
_08080540:
	ldr r0, _08080554 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080558 @ =sub_80806F4
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080550: .4byte gPlayer
_08080554: .4byte gCurTask
_08080558: .4byte sub_80806F4

	thumb_func_start sub_808055C
sub_808055C: @ 0x0808055C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _080805C0 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080805C4 @ =gPlayer
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r4, #8
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080805C8
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r1, r0
	bgt _080805C8
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080805C8
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r1, r0
	bgt _080805C8
	movs r0, #1
	b _080805CA
	.align 2, 0
_080805C0: .4byte gCamera
_080805C4: .4byte gPlayer
_080805C8:
	movs r0, #0
_080805CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_80805D0
sub_80805D0: @ 0x080805D0
	push {r4, lr}
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _08080652
	ldr r0, _080805F8 @ =gPlayer
	ldr r2, [r0, #8]
	ldr r1, _080805FC @ =0x0000EFFF
	adds r3, r0, #0
	cmp r2, r1
	bgt _08080604
	ldr r1, [r3, #0xc]
	ldr r0, _08080600 @ =0x00011FFF
	cmp r1, r0
	bgt _08080604
	movs r2, #0xb4
	lsls r2, r2, #0xb
	movs r4, #0xd8
	lsls r4, r4, #0xa
	b _0808061C
	.align 2, 0
_080805F8: .4byte gPlayer
_080805FC: .4byte 0x0000EFFF
_08080600: .4byte 0x00011FFF
_08080604:
	ldr r1, [r3, #8]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r1, r0
	ble _08080652
	ldr r1, [r3, #0xc]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08080652
	ldr r2, _08080658 @ =0xFFFA6000
	ldr r4, _0808065C @ =0xFFFCA000
_0808061C:
	ldr r0, [r3, #8]
	adds r0, r0, r2
	str r0, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r0, r0, r4
	str r0, [r3, #0xc]
	asrs r2, r2, #8
	asrs r4, r4, #8
	ldr r1, _08080660 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r2
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r2
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
_08080652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080658: .4byte 0xFFFA6000
_0808065C: .4byte 0xFFFCA000
_08080660: .4byte gCamera

	thumb_func_start sub_8080664
sub_8080664: @ 0x08080664
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _080806D4 @ =sub_8080750
	ldr r2, _080806D8 @ =0x00002010
	ldr r1, _080806DC @ =sub_8080790
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r6, #0
	movs r1, #0
	movs r0, #0x78
	strh r0, [r4, #0x30]
	movs r0, #0x40
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _080806E0 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080806E4 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080806E8 @ =IWRAM_START + 0x25
	adds r0, r5, r1
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	movs r0, #0x1a
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _080806EC @ =0x000002DF
	strh r0, [r4, #0xa]
	ldr r0, _080806F0 @ =IWRAM_START + 0x20
	adds r5, r5, r0
	strb r6, [r5]
	adds r0, r4, #0
	bl sub_8004558
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080806D4: .4byte sub_8080750
_080806D8: .4byte 0x00002010
_080806DC: .4byte sub_8080790
_080806E0: .4byte IWRAM_START + 0x21
_080806E4: .4byte IWRAM_START + 0x22
_080806E8: .4byte IWRAM_START + 0x25
_080806EC: .4byte 0x000002DF
_080806F0: .4byte IWRAM_START + 0x20

	thumb_func_start sub_80806F4
sub_80806F4: @ 0x080806F4
	push {r4, r5, lr}
	ldr r0, _08080724 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _08080728 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08080712
	ldrh r0, [r4, #0x1a]
	strh r0, [r4, #0x18]
_08080712:
	adds r0, r4, #0
	bl sub_808055C
	cmp r0, #0
	beq _0808072C
	adds r0, r4, #0
	bl sub_808073C
	b _08080730
	.align 2, 0
_08080724: .4byte gCurTask
_08080728: .4byte gPlayer
_0808072C:
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
_08080730:
	adds r0, r4, #0
	bl sub_80805D0
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_808073C
sub_808073C: @ 0x0808073C
	ldr r0, _08080748 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808074C @ =sub_80807A4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08080748: .4byte gCurTask
_0808074C: .4byte sub_80807A4

	thumb_func_start sub_8080750
sub_8080750: @ 0x08080750
	push {lr}
	ldr r0, _08080774 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	ldr r1, _08080778 @ =0xFFFF0000
	cmp r0, r1
	bne _0808077C
	adds r0, r3, #0
	bl TaskDestroy
	b _0808078A
	.align 2, 0
_08080774: .4byte gCurTask
_08080778: .4byte 0xFFFF0000
_0808077C:
	movs r0, #0x78
	strh r0, [r2, #0x16]
	movs r0, #0x30
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl sub_80051E8
_0808078A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080790
sub_8080790: @ 0x08080790
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80807A4
sub_80807A4: @ 0x080807A4
	push {r4, lr}
	ldr r0, _080807C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_808055C
	cmp r0, #0
	bne _080807C2
	adds r0, r4, #0
	bl sub_80803FC
_080807C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080807C8: .4byte gCurTask

	thumb_func_start sub_80807CC
sub_80807CC: @ 0x080807CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080808A0 @ =sub_80808DC
	ldr r2, _080808A4 @ =0x00002001
	movs r5, #0
	str r5, [sp]
	movs r1, #0x64
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _080808A8 @ =IWRAM_START + 0x60
	adds r1, r4, r2
	strh r5, [r1]
	adds r2, #2
	adds r1, r4, r2
	strh r5, [r1]
	movs r7, #0x90
	lsls r7, r7, #3
	strh r7, [r0, #0x1a]
	strh r5, [r0, #8]
	strh r5, [r0, #0x14]
	strh r5, [r0, #0x1c]
	ldr r1, _080808AC @ =IWRAM_START + 0x21
	adds r2, r4, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r2, _080808B0 @ =IWRAM_START + 0x22
	adds r1, r4, r2
	movs r2, #0x10
	mov sl, r2
	mov r2, sl
	strb r2, [r1]
	ldr r2, _080808B4 @ =IWRAM_START + 0x25
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	str r1, [r0, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	mov r8, r2
	str r2, [r0, #0x10]
	ldr r1, _080808B8 @ =0x06013040
	str r1, [r0, #4]
	ldr r1, _080808BC @ =0x0000024E
	strh r1, [r0, #0xa]
	ldr r2, _080808C0 @ =IWRAM_START + 0x20
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	bl sub_8004558
	ldr r1, _080808C4 @ =IWRAM_START + 0x30
	adds r0, r4, r1
	strh r7, [r0, #0x1a]
	strh r5, [r0, #8]
	strh r5, [r0, #0x14]
	strh r5, [r0, #0x1c]
	adds r1, #0x21
	adds r2, r4, r1
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r2]
	ldr r2, _080808C8 @ =IWRAM_START + 0x52
	adds r1, r4, r2
	mov r2, sl
	strb r2, [r1]
	ldr r2, _080808CC @ =IWRAM_START + 0x55
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	mov r1, sb
	str r1, [r0, #0x28]
	mov r2, r8
	str r2, [r0, #0x10]
	ldr r1, _080808D0 @ =0x06012980
	str r1, [r0, #4]
	ldr r1, _080808D4 @ =0x0000024D
	strh r1, [r0, #0xa]
	ldr r1, _080808D8 @ =IWRAM_START + 0x50
	adds r4, r4, r1
	movs r2, #0
	strb r2, [r4]
	bl sub_8004558
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080808A0: .4byte sub_80808DC
_080808A4: .4byte 0x00002001
_080808A8: .4byte IWRAM_START + 0x60
_080808AC: .4byte IWRAM_START + 0x21
_080808B0: .4byte IWRAM_START + 0x22
_080808B4: .4byte IWRAM_START + 0x25
_080808B8: .4byte 0x06013040
_080808BC: .4byte 0x0000024E
_080808C0: .4byte IWRAM_START + 0x20
_080808C4: .4byte IWRAM_START + 0x30
_080808C8: .4byte IWRAM_START + 0x52
_080808CC: .4byte IWRAM_START + 0x55
_080808D0: .4byte 0x06012980
_080808D4: .4byte 0x0000024D
_080808D8: .4byte IWRAM_START + 0x50

	thumb_func_start sub_80808DC
sub_80808DC: @ 0x080808DC
	push {r4, r5, r6, lr}
	ldr r0, _08080918 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r4, r0
	adds r0, #0x60
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, #0
	beq _080808FA
	adds r0, r1, #0
	bl sub_8004558
_080808FA:
	movs r6, #0
	strh r6, [r5]
	ldr r1, _0808091C @ =IWRAM_START + 0x62
	adds r5, r4, r1
	ldrh r0, [r5]
	cmp r0, #0
	beq _08080910
	subs r1, #0x32
	adds r0, r4, r1
	bl sub_8004558
_08080910:
	strh r6, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080918: .4byte gCurTask
_0808091C: .4byte IWRAM_START + 0x62

	thumb_func_start initSprite_Interactable105
initSprite_Interactable105: @ 0x08080920
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080809AC @ =sub_8080A5C
	ldr r2, _080809B0 @ =0x00001FF0
	ldr r1, _080809B4 @ =sub_8080A98
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r3]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #4]
	movs r1, #3
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	strh r1, [r3, #8]
	movs r2, #4
	ldrsb r2, [r6, r2]
	lsls r2, r2, #3
	strh r2, [r3, #0xa]
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #0xc]
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #0xe]
	str r6, [r3, #0x10]
	ldrb r0, [r6]
	strb r0, [r3, #0x14]
	mov r1, r8
	strb r1, [r3, #0x15]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080809AC: .4byte sub_8080A5C
_080809B0: .4byte 0x00001FF0
_080809B4: .4byte sub_8080A98

	thumb_func_start sub_80809B8
sub_80809B8: @ 0x080809B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r6, _08080A44 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08080A4C
	ldr r2, [r7]
	ldrh r0, [r7, #8]
	mov sb, r0
	add r2, sb
	ldr r1, _08080A48 @ =gCamera
	ldr r4, [r1]
	subs r2, r2, r4
	ldr r0, [r7, #4]
	ldrh r5, [r7, #0xa]
	adds r0, r0, r5
	ldr r3, [r1, #4]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldrh r0, [r7, #0xc]
	mov r3, sb
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r7, #0xe]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08080A4C
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r2, r0
	cmp r0, r1
	blt _08080A4C
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	bgt _08080A4C
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r2, r0
	cmp r0, r1
	blt _08080A4C
	movs r0, #1
	b _08080A4E
	.align 2, 0
_08080A44: .4byte gPlayer
_08080A48: .4byte gCamera
_08080A4C:
	movs r0, #0
_08080A4E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8080A5C
sub_8080A5C: @ 0x08080A5C
	push {r4, lr}
	ldr r0, _08080A90 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80809B8
	cmp r0, #0
	beq _08080A7A
	ldr r0, _08080A94 @ =gPlayer
	bl sub_800CBA4
_08080A7A:
	adds r0, r4, #0
	bl sub_8080A9C
	cmp r0, #0
	beq _08080A8A
	adds r0, r4, #0
	bl sub_8080AE4
_08080A8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080A90: .4byte gCurTask
_08080A94: .4byte gPlayer

	thumb_func_start sub_8080A98
sub_8080A98: @ 0x08080A98
	bx lr
	.align 2, 0

	thumb_func_start sub_8080A9C
sub_8080A9C: @ 0x08080A9C
	push {lr}
	ldr r1, [r0]
	ldr r3, _08080AD8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
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
	bhi _08080AD4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08080AD4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08080ADC
_08080AD4:
	movs r0, #1
	b _08080ADE
	.align 2, 0
_08080AD8: .4byte gCamera
_08080ADC:
	movs r0, #0
_08080ADE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8080AE4
sub_8080AE4: @ 0x08080AE4
	push {lr}
	ldr r1, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	strb r0, [r1]
	ldr r0, _08080AF8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08080AF8: .4byte gCurTask

	thumb_func_start sub_8080AFC
sub_8080AFC: @ 0x08080AFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp, #4]
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	mov r1, sb
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08080C00 @ =sub_8080DB8
	ldr r2, _08080C04 @ =0x00002010
	ldr r1, _08080C08 @ =sub_8080EF8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	str r6, [r7, #0x30]
	ldr r6, [sp, #4]
	str r6, [r7, #0x34]
	movs r3, #0
	str r3, [r7, #0x38]
	str r3, [r7, #0x3c]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r0, r4, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r6, _08080C0C @ =gSineTable
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r6, _08080C10 @ =IWRAM_START + 0x40
	adds r1, r2, r6
	movs r6, #0
	mov ip, r6
	strh r0, [r1]
	lsls r4, r4, #3
	ldr r0, _08080C0C @ =gSineTable
	adds r4, r4, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldr r4, _08080C14 @ =IWRAM_START + 0x42
	adds r1, r2, r4
	strh r0, [r1]
	ldr r6, _08080C18 @ =IWRAM_START + 0x44
	adds r0, r2, r6
	mov r1, r8
	strh r1, [r0]
	adds r4, #4
	adds r0, r2, r4
	mov r6, sb
	strh r6, [r0]
	ldr r1, _08080C1C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	mov r4, sl
	strb r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	ldr r6, _08080C20 @ =IWRAM_START + 0x21
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08080C24 @ =IWRAM_START + 0x22
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08080C28 @ =IWRAM_START + 0x25
	adds r2, r2, r1
	mov r4, ip
	strb r4, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	ldr r2, _08080C2C @ =gUnknown_080E0140
	mov r6, sl
	lsls r0, r6, #2
	add r0, sl
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	str r0, [r7, #0x10]
	adds r0, r2, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080C30
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	bl VramMalloc
	b _08080C3C
	.align 2, 0
_08080C00: .4byte sub_8080DB8
_08080C04: .4byte 0x00002010
_08080C08: .4byte sub_8080EF8
_08080C0C: .4byte gSineTable
_08080C10: .4byte IWRAM_START + 0x40
_08080C14: .4byte IWRAM_START + 0x42
_08080C18: .4byte IWRAM_START + 0x44
_08080C1C: .4byte IWRAM_START + 0x48
_08080C20: .4byte IWRAM_START + 0x21
_08080C24: .4byte IWRAM_START + 0x22
_08080C28: .4byte IWRAM_START + 0x25
_08080C2C: .4byte gUnknown_080E0140
_08080C30:
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08080C70 @ =0x06010000
	adds r0, r0, r1
_08080C3C:
	str r0, [r7, #4]
	ldr r2, _08080C74 @ =gUnknown_080E0140
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r7, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
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
_08080C70: .4byte 0x06010000
_08080C74: .4byte gUnknown_080E0140

	thumb_func_start sub_8080C78
sub_8080C78: @ 0x08080C78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	str r1, [sp, #4]
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _08080D4C @ =sub_8080E54
	ldr r2, _08080D50 @ =0x00002010
	ldr r1, _08080D54 @ =sub_8080EF8
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov r3, sb
	str r3, [r7, #0x30]
	ldr r0, [sp, #4]
	str r0, [r7, #0x34]
	movs r2, #0
	str r2, [r7, #0x38]
	str r2, [r7, #0x3c]
	ldr r3, _08080D58 @ =IWRAM_START + 0x40
	adds r0, r1, r3
	movs r3, #0
	strh r4, [r0]
	ldr r4, _08080D5C @ =IWRAM_START + 0x42
	adds r0, r1, r4
	strh r5, [r0]
	adds r4, #2
	adds r0, r1, r4
	strh r6, [r0]
	adds r4, #2
	adds r0, r1, r4
	mov r4, r8
	strh r4, [r0]
	ldr r4, _08080D60 @ =IWRAM_START + 0x48
	adds r0, r1, r4
	mov r4, sl
	strb r4, [r0]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _08080D64 @ =IWRAM_START + 0x21
	adds r2, r1, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r4, _08080D68 @ =IWRAM_START + 0x22
	adds r2, r1, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _08080D6C @ =IWRAM_START + 0x25
	adds r1, r1, r0
	strb r3, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	ldr r2, _08080D70 @ =gUnknown_080E0140
	mov r1, sl
	lsls r0, r1, #2
	add r0, sl
	lsls r1, r0, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #0xc
	str r0, [r7, #0x10]
	adds r0, r2, #6
	adds r0, r1, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080D74
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	bl VramMalloc
	b _08080D80
	.align 2, 0
_08080D4C: .4byte sub_8080E54
_08080D50: .4byte 0x00002010
_08080D54: .4byte sub_8080EF8
_08080D58: .4byte IWRAM_START + 0x40
_08080D5C: .4byte IWRAM_START + 0x42
_08080D60: .4byte IWRAM_START + 0x48
_08080D64: .4byte IWRAM_START + 0x21
_08080D68: .4byte IWRAM_START + 0x22
_08080D6C: .4byte IWRAM_START + 0x25
_08080D70: .4byte gUnknown_080E0140
_08080D74:
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08080DB0 @ =0x06010000
	adds r0, r0, r3
_08080D80:
	str r0, [r7, #4]
	ldr r2, _08080DB4 @ =gUnknown_080E0140
	mov r4, sl
	lsls r0, r4, #2
	add r0, sl
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r7, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080DB0: .4byte 0x06010000
_08080DB4: .4byte gUnknown_080E0140

	thumb_func_start sub_8080DB8
sub_8080DB8: @ 0x08080DB8
	push {r4, r5, r6, lr}
	ldr r0, _08080DE0 @ =gCurTask
	ldr r2, [r0]
	ldrh r6, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0x46
	adds r1, r6, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080DE4 @ =0xFFFF0000
	cmp r0, r1
	bne _08080DE8
	adds r0, r2, #0
	bl TaskDestroy
	b _08080E4C
	.align 2, 0
_08080DE0: .4byte gCurTask
_08080DE4: .4byte 0xFFFF0000
_08080DE8:
	ldr r1, _08080E38 @ =IWRAM_START + 0x40
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [r5, #0x38]
	adds r2, r2, r0
	str r2, [r5, #0x38]
	ldr r1, _08080E3C @ =IWRAM_START + 0x42
	adds r0, r6, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r3, [r5, #0x3c]
	adds r3, r3, r0
	str r3, [r5, #0x3c]
	ldr r0, [r5, #0x30]
	ldr r4, _08080E40 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	asrs r2, r2, #8
	adds r0, r0, r2
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	asrs r3, r3, #8
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08080E44 @ =IWRAM_START + 0x44
	adds r1, r6, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080E48
	adds r0, r5, #0
	bl sub_80051E8
	b _08080E4C
	.align 2, 0
_08080E38: .4byte IWRAM_START + 0x40
_08080E3C: .4byte IWRAM_START + 0x42
_08080E40: .4byte gCamera
_08080E44: .4byte IWRAM_START + 0x44
_08080E48:
	subs r0, #1
	strh r0, [r1]
_08080E4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080E54
sub_8080E54: @ 0x08080E54
	push {r4, r5, lr}
	ldr r0, _08080E7C @ =gCurTask
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x46
	adds r1, r5, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	ldr r1, _08080E80 @ =0xFFFF0000
	cmp r0, r1
	bne _08080E84
	adds r0, r2, #0
	bl TaskDestroy
	b _08080EF0
	.align 2, 0
_08080E7C: .4byte gCurTask
_08080E80: .4byte 0xFFFF0000
_08080E84:
	ldr r1, _08080EDC @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #0x38]
	adds r0, r0, r1
	str r0, [r4, #0x38]
	ldr r0, _08080EE0 @ =IWRAM_START + 0x42
	adds r1, r5, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x3c]
	adds r0, r0, r2
	str r0, [r4, #0x3c]
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	ldr r1, [r4, #0x30]
	ldr r2, _08080EE4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r0, [r4, #0x38]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r4, #0x34]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	ldr r0, [r4, #0x3c]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r2, _08080EE8 @ =IWRAM_START + 0x44
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _08080EEC
	adds r0, r4, #0
	bl sub_80051E8
	b _08080EF0
	.align 2, 0
_08080EDC: .4byte IWRAM_START + 0x40
_08080EE0: .4byte IWRAM_START + 0x42
_08080EE4: .4byte gCamera
_08080EE8: .4byte IWRAM_START + 0x44
_08080EEC:
	subs r0, #1
	strh r0, [r1]
_08080EF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8080EF8
sub_8080EF8: @ 0x08080EF8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r2, _08080F24 @ =gUnknown_080E0140
	adds r1, #0x48
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080F20
	ldr r0, [r3, #4]
	bl VramFree
_08080F20:
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_080E0140

	thumb_func_start initSprite_Interactable_SpecialRing
initSprite_Interactable_SpecialRing: @ 0x08080F28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r0, _08080FE8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08080FDA
	ldr r0, _08080FEC @ =sub_8081084
	ldr r2, _08080FF0 @ =0x00004040
	ldr r1, _08080FF4 @ =sub_80810E8
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldrb r0, [r7]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	movs r0, #0
	mov sb, r0
	movs r1, #0
	strh r6, [r2, #4]
	strh r4, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r0, r8
	strb r0, [r2, #9]
	ldr r0, _08080FF8 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _08080FFC @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08081000 @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08081004 @ =IWRAM_START + 0x31
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08081008 @ =0x000002DA
	strh r0, [r4, #0xa]
	ldr r0, _0808100C @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	mov r1, sb
	strb r1, [r5]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
_08080FDA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080FE8: .4byte gGameMode
_08080FEC: .4byte sub_8081084
_08080FF0: .4byte 0x00004040
_08080FF4: .4byte sub_80810E8
_08080FF8: .4byte IWRAM_START + 0xC
_08080FFC: .4byte IWRAM_START + 0x2D
_08081000: .4byte IWRAM_START + 0x2E
_08081004: .4byte IWRAM_START + 0x31
_08081008: .4byte 0x000002DA
_0808100C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_8081010
sub_8081010: @ 0x08081010
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08081040 @ =gUnknown_030056A4
	ldr r5, [r0]
	ldr r3, _08081044 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0808107C
	adds r0, r4, #0
	adds r0, #0xc
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	bl sub_800DF38
	adds r3, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r3, r0
	cmp r3, #0
	beq _08081048
	movs r0, #1
	b _0808107E
	.align 2, 0
_08081040: .4byte gUnknown_030056A4
_08081044: .4byte gPlayer
_08081048:
	ldr r1, [r5]
	asrs r1, r1, #8
	adds r1, #0x10
	ldr r0, [r4, #0x3c]
	subs r1, r1, r0
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	adds r0, #0x20
	ldr r2, [r4, #0x40]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bhi _0808107C
	cmp r0, #0x20
	bhi _0808107C
	ldr r0, _08081078 @ =gCurTask
	ldr r0, [r0]
	strb r3, [r0, #0x15]
	movs r0, #1
	b _0808107E
	.align 2, 0
_08081078: .4byte gCurTask
_0808107C:
	movs r0, #0
_0808107E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8081084
sub_8081084: @ 0x08081084
	push {r4, lr}
	ldr r0, _080810C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _080810C4 @ =gPlayer
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080810AC
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #8
	ldr r1, [r4, #0x40]
	lsls r1, r1, #8
	bl sub_80122DC
_080810AC:
	adds r0, r4, #0
	bl sub_8081010
	cmp r0, #0
	beq _080810C8
	adds r0, r4, #0
	bl sub_80810FC
	b _080810E2
	.align 2, 0
_080810C0: .4byte gCurTask
_080810C4: .4byte gPlayer
_080810C8:
	adds r0, r4, #0
	bl sub_8081164
	cmp r0, #0
	beq _080810DC
	adds r0, r4, #0
	movs r1, #1
	bl sub_80811A0
	b _080810E2
_080810DC:
	adds r0, r4, #0
	bl sub_8081134
_080810E2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80810E8
sub_80810E8: @ 0x080810E8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80810FC
sub_80810FC: @ 0x080810FC
	push {lr}
	ldr r2, _08081124 @ =gUnknown_030054F4
	ldrb r1, [r2]
	adds r1, #1
	strb r1, [r2]
	ldr r1, _08081128 @ =0x000002DA
	strh r1, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x95
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0808112C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08081130 @ =sub_80811BC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081124: .4byte gUnknown_030054F4
_08081128: .4byte 0x000002DA
_0808112C: .4byte gCurTask
_08081130: .4byte sub_80811BC

	thumb_func_start sub_8081134
sub_8081134: @ 0x08081134
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0xc
	ldr r1, [r0, #0x3c]
	ldr r3, _08081160 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r4, #0x16]
	ldr r0, [r0, #0x40]
	ldr r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081160: .4byte gCamera

	thumb_func_start sub_8081164
sub_8081164: @ 0x08081164
	push {lr}
	ldr r2, [r0, #0x3c]
	adds r2, #0x80
	ldr r3, _08081194 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	ldr r0, [r0, #0x40]
	adds r0, #0x80
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _0808118E
	movs r0, #0xd0
	lsls r0, r0, #1
	cmp r1, r0
	bls _08081198
_0808118E:
	movs r0, #1
	b _0808119A
	.align 2, 0
_08081194: .4byte gCamera
_08081198:
	movs r0, #0
_0808119A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80811A0
sub_80811A0: @ 0x080811A0
	push {lr}
	cmp r1, #0
	beq _080811AC
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
_080811AC:
	ldr r0, _080811B8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080811B8: .4byte gCurTask

	thumb_func_start sub_80811BC
sub_80811BC: @ 0x080811BC
	push {r4, lr}
	ldr r0, _080811F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _080811E4
	adds r0, r4, #0
	bl sub_8081164
	cmp r0, #0
	beq _080811F4
_080811E4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80811A0
	b _080811FA
	.align 2, 0
_080811F0: .4byte gCurTask
_080811F4:
	adds r0, r4, #0
	bl sub_8081134
_080811FA:
	pop {r4}
	pop {r0}
	bx r0
