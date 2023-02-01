.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
