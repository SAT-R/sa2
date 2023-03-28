.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
	ldr r0, _0807B564 @ =Task_Interactable_SkyCanyon_GiantPropeller
	str r0, [r2, #8]
	b _0807B730
	.align 2, 0
_0807B55C: .4byte gCurTask
_0807B560: .4byte gPlayer
_0807B564: .4byte Task_Interactable_SkyCanyon_GiantPropeller
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
	ldr r0, _0807B824 @ =Task_Interactable_SkyCanyon_GiantPropeller
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B818: .4byte gPlayer
_0807B81C: .4byte 0xFFBFFFFF
_0807B820: .4byte gCurTask
_0807B824: .4byte Task_Interactable_SkyCanyon_GiantPropeller

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

	thumb_func_start Task_Interactable_SkyCanyon_GiantPropeller
Task_Interactable_SkyCanyon_GiantPropeller: @ 0x0807B89C
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
	ldr r0, _0807BB08 @ =Task_Interactable_SkyCanyon_GiantPropeller
	ldr r2, _0807BB0C @ =0x00002010
	ldr r1, _0807BB10 @ =TaskDestructor_Interactable_SkyCanyon_GiantPropeller
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
_0807BB08: .4byte Task_Interactable_SkyCanyon_GiantPropeller
_0807BB0C: .4byte 0x00002010
_0807BB10: .4byte TaskDestructor_Interactable_SkyCanyon_GiantPropeller

	thumb_func_start TaskDestructor_Interactable_SkyCanyon_GiantPropeller
TaskDestructor_Interactable_SkyCanyon_GiantPropeller: @ 0x0807BB14
	bx lr
	.align 2, 0
