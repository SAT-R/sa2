.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

	thumb_func_start Task_802B2D8
Task_802B2D8: @ 0x0802B2D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0802B304 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r7, [r0]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802B308
	adds r0, r2, #0
	bl TaskDestroy
	b _0802B392
	.align 2, 0
_0802B304: .4byte gCurTask
_0802B308:
	ldr r0, _0802B3A0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0802B392
	ldr r2, _0802B3A4 @ =gPseudoRandom
	ldr r0, [r2]
	ldr r3, _0802B3A8 @ =0x00196225
	muls r0, r3, r0
	ldr r5, _0802B3AC @ =0x3C6EF35F
	adds r1, r0, r5
	str r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802B392
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r0, r5
	str r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	lsrs r4, r0, #8
	mov sl, r2
	adds r6, r3, #0
	ldr r0, _0802B3B0 @ =0x0007FF00
	mov sb, r0
	ldr r1, _0802B3B4 @ =0xFFFFFC00
	mov r8, r1
_0802B348:
	mov r2, sl
	ldr r0, [r2]
	muls r0, r6, r0
	adds r0, r0, r5
	adds r1, r0, #0
	mov r3, sb
	ands r1, r3
	lsrs r1, r1, #8
	add r1, r8
	muls r0, r6, r0
	adds r0, r0, r5
	adds r2, r0, #0
	ands r2, r3
	lsrs r2, r2, #8
	add r2, r8
	adds r3, r0, #0
	muls r3, r6, r3
	adds r3, r3, r5
	mov r0, sl
	str r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r3, r0
	lsrs r3, r3, #8
	ldr r0, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	adds r1, r1, r2
	ldr r2, _0802B3B8 @ =0xFFFFF400
	adds r1, r1, r2
	movs r2, #0
	bl sub_802B018
	adds r0, r4, #0
	subs r4, #1
	cmp r0, #0
	bne _0802B348
_0802B392:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3A0: .4byte gUnknown_03005590
_0802B3A4: .4byte gPseudoRandom
_0802B3A8: .4byte 0x00196225
_0802B3AC: .4byte 0x3C6EF35F
_0802B3B0: .4byte 0x0007FF00
_0802B3B4: .4byte 0xFFFFFC00
_0802B3B8: .4byte 0xFFFFF400

	thumb_func_start sub_802B3BC
sub_802B3BC: @ 0x0802B3BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802B3E4 @ =Task_802B2D8
	ldr r2, _0802B3E8 @ =0x00004001
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r4, [r1]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802B3E4: .4byte Task_802B2D8
_0802B3E8: .4byte 0x00004001

	thumb_func_start TaskDestructor_802B3EC
TaskDestructor_802B3EC: @ 0x0802B3EC
	ldr r1, _0802B3F8 @ =gUnknown_03005B34
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802B3F8: .4byte gUnknown_03005B34
