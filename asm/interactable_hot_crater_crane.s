.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
.if 0
.endif

	thumb_func_start sub_8074138
sub_8074138: @ 0x08074138
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, _080741A4 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r4, #0x80
	ands r4, r1
	cmp r4, #0
	bne _08074178
	movs r0, #0xdc
	lsls r0, r0, #1
	adds r5, r3, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _08074178
	ldr r0, _080741A8 @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0x20]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #9
	movs r0, #7
	strb r0, [r1]
	strh r4, [r2, #0x10]
	movs r1, #0xde
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	str r4, [r5]
_08074178:
	movs r2, #0xde
	lsls r2, r2, #1
	adds r0, r3, r2
	ldrh r0, [r0]
	rsbs r0, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r2, r3, r1
	movs r1, #0
	strh r0, [r2]
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r3, r2
	strh r1, [r0]
	ldr r0, _080741AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080741B0 @ =Task_8073C6C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080741A4: .4byte gPlayer
_080741A8: .4byte 0xFFBFFFFF
_080741AC: .4byte gCurTask
_080741B0: .4byte Task_8073C6C

	thumb_func_start sub_80741B4
sub_80741B4: @ 0x080741B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	movs r7, #0
	ldr r2, _08074254 @ =gCamera
	ldr r0, [r0]
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	mov r1, sl
	ldr r0, [r1, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #8
	mov r8, r0
	movs r0, #0
	mov ip, r0
_080741DE:
	mov r1, ip
	lsls r3, r1, #5
	adds r3, #8
	add r3, sl
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r1, _08074258 @ =gSineTable
	adds r0, r0, r1
	ldrh r4, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x16
	ldr r6, [r3, #0xc]
	adds r2, r6, #0
	muls r2, r4, r2
	asrs r2, r2, #8
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r5, [r3, #0x10]
	adds r0, r5, #0
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	add sb, r2
	muls r1, r6, r1
	asrs r1, r1, #8
	adds r0, r5, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	add r8, r1
	ldrh r0, [r3, #8]
	adds r7, r7, r0
	ldr r1, _0807425C @ =0x000003FF
	adds r0, r1, #0
	ands r7, r0
	strh r7, [r3, #0x14]
	mov r0, sb
	str r0, [r3, #0x18]
	mov r1, r8
	str r1, [r3, #0x1c]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #8
	bls _080741DE
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074254: .4byte gCamera
_08074258: .4byte gSineTable
_0807425C: .4byte 0x000003FF

	thumb_func_start sub_8074260
sub_8074260: @ 0x08074260
	push {lr}
	adds r2, r0, #0
	adds r2, #8
	ldrh r0, [r2, #8]
	adds r1, r0, #0
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r1, r3
	bne _08074276
	movs r0, #1
	b _080742A2
_08074276:
	cmp r1, r3
	bls _08074288
	subs r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r3
	bhi _080742A0
	b _08074294
_08074288:
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	ldr r1, _0807429C @ =0x01FF0000
	cmp r0, r1
	bls _080742A0
_08074294:
	strh r3, [r2, #8]
	movs r0, #1
	b _080742A2
	.align 2, 0
_0807429C: .4byte 0x01FF0000
_080742A0:
	movs r0, #0
_080742A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80742A8
sub_80742A8: @ 0x080742A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	movs r6, #0
	mov r5, sp
_080742B2:
	lsls r0, r6, #5
	adds r0, #8
	adds r4, r7, r0
	ldrh r1, [r4, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08074310
	ldr r1, [r4]
	ldr r0, [r4, #0x18]
	asrs r0, r0, #8
	strh r0, [r1, #0x16]
	ldr r1, [r4]
	ldr r0, [r4, #0x1c]
	asrs r0, r0, #8
	strh r0, [r1, #0x18]
	ldrh r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807430A
	ldrh r0, [r4, #0x14]
	strh r0, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	ldr r0, [r4]
	ldrh r1, [r0, #0x16]
	strh r1, [r5, #6]
	ldrh r1, [r0, #0x18]
	strh r1, [r5, #8]
	ldr r3, _08074324 @ =gUnknown_030054B8
	ldrb r1, [r3]
	adds r2, r1, #1
	strb r2, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08074328 @ =0x00002060
	orrs r1, r2
	str r1, [r0, #0x10]
	mov r1, sp
	bl sub_8004860
_0807430A:
	ldr r0, [r4]
	bl sub_80051E8
_08074310:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #8
	bls _080742B2
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074324: .4byte gUnknown_030054B8
_08074328: .4byte 0x00002060

	thumb_func_start sub_807432C
sub_807432C: @ 0x0807432C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, _080743A8 @ =gPlayer
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080743B0
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080743B0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080743B0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r3, [r0]
	lsls r3, r3, #8
	adds r1, #4
	adds r0, r2, r1
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	ldr r1, _080743AC @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r3, r3, #0x10
	adds r0, r3, #0
	subs r0, #0x18
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r0, r2
	bgt _080743B0
	adds r0, #0x30
	cmp r0, r2
	blt _080743B0
	lsls r0, r5, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0x18
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080743B0
	adds r0, r3, #0
	adds r0, #0x18
	cmp r0, r2
	blt _080743B0
	movs r0, #1
	b _080743B2
	.align 2, 0
_080743A8: .4byte gPlayer
_080743AC: .4byte gCamera
_080743B0:
	movs r0, #0
_080743B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start TaskDestructor_80743B8
TaskDestructor_80743B8: @ 0x080743B8
	bx lr
	.align 2, 0

	thumb_func_start sub_80743BC
sub_80743BC: @ 0x080743BC
	ldrh r2, [r0, #0x10]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r2
	lsls r1, r1, #1
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r1, [r0]
	ldr r0, _080743DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080743E0 @ =Task_8073BD4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080743DC: .4byte gCurTask
_080743E0: .4byte Task_8073BD4

	thumb_func_start sub_80743E4
sub_80743E4: @ 0x080743E4
	movs r2, #0xdf
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080743F8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080743FC @ =Task_8073D48
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080743F8: .4byte gCurTask
_080743FC: .4byte Task_8073D48

	thumb_func_start sub_8074400
sub_8074400: @ 0x08074400
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0xdf
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r2, #0
	strh r2, [r0]
	adds r0, r3, #0
	adds r0, #0xf0
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r4, #0xc0
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, #0xe1
	lsls r1, r1, #1
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, #4
	adds r0, r3, r4
	strh r2, [r0]
	ldr r0, _08074440 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074444 @ =Task_8073E20
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074440: .4byte gCurTask
_08074444: .4byte Task_8073E20

	thumb_func_start sub_8074448
sub_8074448: @ 0x08074448
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0
	movs r3, #0
	cmp r2, r1
	bhi _08074470
	ldr r0, _08074478 @ =0x000003FF
	adds r5, r0, #0
_0807445C:
	lsls r0, r3, #5
	adds r0, r4, r0
	ldrh r0, [r0, #0x10]
	adds r2, r2, r0
	ands r2, r5
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r1
	bls _0807445C
_08074470:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08074478: .4byte 0x000003FF

@ Matched in src
	thumb_func_start sub_807447C
sub_807447C: @ 0x0807447C
	ldrh r2, [r0, #0x10]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	subs r1, r1, r2
	subs r3, #1
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0, #0x30]
	bx lr

	thumb_func_start sub_8074490
sub_8074490: @ 0x08074490
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #2
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	movs r1, #0xc0
	lsls r1, r1, #4
_0807449E:
	lsls r0, r4, #5
	adds r0, #8
	adds r2, r6, r0
	ldr r0, [r2, #0x10]
	adds r0, r0, r5
	str r0, [r2, #0x10]
	cmp r0, r1
	ble _080744B2
	str r1, [r2, #0x10]
	b _080744BA
_080744B2:
	ldr r3, _080744CC @ =0xFFFFF400
	cmp r0, r3
	bge _080744BA
	str r3, [r2, #0x10]
_080744BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0807449E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080744CC: .4byte 0xFFFFF400

	thumb_func_start sub_80744D0
sub_80744D0: @ 0x080744D0
	push {lr}
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	movs r1, #7
	bl sub_80744E0
	pop {r1}
	bx r1

	thumb_func_start sub_80744E0
sub_80744E0: @ 0x080744E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0         @ r6 = crane
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10      @ r4 = p1
	lsls r0, r4, #5
	adds r0, #8
	adds r1, r6, r0         @ r1 = crane->cs
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10      @ r5 = p2
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	adds r3, r0, #0
	cmp r0, #0
	bge _080744FE
	rsbs r3, r0, #0
_080744FE:
	movs r2, #0xc0
	lsls r2, r2, #4
	cmp r3, r2
	bgt _0807450C
	str r0, [r1, #0x10]
	movs r0, #1
	b _08074548
_0807450C:
	cmp r5, #0
	ble _08074520
	ldr r3, _0807451C @ =0xFFFFF400
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	str r2, [r1, #0x10]
	b _0807452A
	.align 2, 0
_0807451C: .4byte 0xFFFFF400
_08074520:
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08074538 @ =0xFFFFF400
	str r0, [r1, #0x10]
_0807452A:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #1
	bne _0807453C
	movs r0, #0
	b _08074548
	.align 2, 0
_08074538: .4byte 0xFFFFF400
_0807453C:
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80744E0
_08074548:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074550
sub_8074550: @ 0x08074550
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r5, _08074594 @ =gPlayer
	ldr r2, [r5, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080745AE
	movs r1, #0xdc
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080745AE
	subs r1, #0x94
	adds r0, r3, r1
	ldr r4, _08074598 @ =gCamera
	ldr r1, [r4, #4]
	adds r1, #0x18
	lsls r1, r1, #8
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _0807459C
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r1, [r4]
	adds r1, #6
	b _080745A6
	.align 2, 0
_08074594: .4byte gPlayer
_08074598: .4byte gCamera
_0807459C:
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r3, r1
	ldr r1, [r4]
	subs r1, #6
_080745A6:
	lsls r1, r1, #8
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r5, #8]
_080745AE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80745B4
sub_80745B4: @ 0x080745B4
	push {lr}
	ldr r1, [r0]
	ldr r3, _080745F8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _080745F2
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080745F2
	subs r1, #0x80
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080745FC
_080745F2:
	movs r0, #1
	b _080745FE
	.align 2, 0
_080745F8: .4byte gCamera
_080745FC:
	movs r0, #0
_080745FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074604
sub_8074604: @ 0x08074604
	push {lr}
	adds r2, r0, #0
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r0]
	movs r3, #0xe4
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08074628 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08074628: .4byte gCurTask
