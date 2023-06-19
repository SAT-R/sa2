.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

	thumb_func_start Task_802B3FC
Task_802B3FC: @ 0x0802B3FC
	push {r4, r5, lr}
	ldr r0, _0802B420 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq _0802B416
	ldr r0, [r3]
	cmp r0, #0
	bgt _0802B424
_0802B416:
	adds r0, r2, #0
	bl TaskDestroy
	b _0802B4EA
	.align 2, 0
_0802B420: .4byte gCurTask
_0802B424:
	ldr r5, _0802B448 @ =gCamera
	ldr r0, [r3, #0x10]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802B458
	ldr r2, _0802B44C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0802B450 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0802B454 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x17
	adds r1, r0, #0
	subs r1, #0xff
	b _0802B466
	.align 2, 0
_0802B448: .4byte gCamera
_0802B44C: .4byte gPseudoRandom
_0802B450: .4byte 0x00196225
_0802B454: .4byte 0x3C6EF35F
_0802B458:
	ldr r0, _0802B480 @ =gSineTable
	ldr r1, [r3, #0x14]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
_0802B466:
	ldr r0, [r3]
	muls r0, r1, r0
	asrs r2, r0, #0x10
	ldr r0, [r3, #0x10]
	movs r1, #3
	ands r1, r0
	adds r4, r0, #0
	cmp r1, #1
	beq _0802B484
	cmp r1, #2
	beq _0802B48C
	b _0802B496
	.align 2, 0
_0802B480: .4byte gSineTable
_0802B484:
	cmp r2, #0
	bge _0802B496
	rsbs r2, r2, #0
	b _0802B496
_0802B48C:
	adds r0, r2, #0
	cmp r2, #0
	bge _0802B494
	rsbs r0, r2, #0
_0802B494:
	rsbs r2, r0, #0
_0802B496:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _0802B4AA
	ldr r0, _0802B4F0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B4C8
_0802B4AA:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0802B4B8
	adds r0, r5, #0
	adds r0, #0x60
	strh r2, [r0]
_0802B4B8:
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802B4C8
	adds r0, r5, #0
	adds r0, #0x62
	strh r2, [r0]
_0802B4C8:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	ble _0802B4D2
	subs r0, #1
	str r0, [r3, #0xc]
_0802B4D2:
	ldr r1, [r3]
	cmp r1, #0
	ble _0802B4DE
	ldr r0, [r3, #4]
	subs r0, r1, r0
	str r0, [r3]
_0802B4DE:
	ldr r0, [r3, #0x14]
	ldr r1, [r3, #8]
	adds r0, r0, r1
	ldr r1, _0802B4F4 @ =0x000003FF
	ands r0, r1
	str r0, [r3, #0x14]
_0802B4EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B4F0: .4byte gUnknown_03005590
_0802B4F4: .4byte 0x000003FF

	thumb_func_start sub_802B4F8
sub_802B4F8: @ 0x0802B4F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	ldr r0, _0802B540 @ =Task_802B3FC
	ldr r2, _0802B544 @ =0x00000EFF
	ldr r1, _0802B548 @ =TaskDestructor_802B54C
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r4, [r1]
	str r5, [r1, #4]
	str r6, [r1, #8]
	movs r2, #0
	str r2, [r1, #0x14]
	mov r2, r8
	str r2, [r1, #0xc]
	str r7, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B540: .4byte Task_802B3FC
_0802B544: .4byte 0x00000EFF
_0802B548: .4byte TaskDestructor_802B54C

	thumb_func_start TaskDestructor_802B54C
TaskDestructor_802B54C: @ 0x0802B54C
	push {lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r3, _0802B580 @ =gCamera
	ldr r0, [r2, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802B56A
	adds r1, r3, #0
	adds r1, #0x60
	movs r0, #0
	strh r0, [r1]
_0802B56A:
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802B57C
	adds r1, r3, #0
	adds r1, #0x62
	movs r0, #0
	strh r0, [r1]
_0802B57C:
	pop {r0}
	bx r0
	.align 2, 0
_0802B580: .4byte gCamera
