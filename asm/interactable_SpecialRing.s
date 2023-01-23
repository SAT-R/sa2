.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

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
	ldr r0, _08081130 @ =Task_80811BC
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081124: .4byte gUnknown_030054F4
_08081128: .4byte 0x000002DA
_0808112C: .4byte gCurTask
_08081130: .4byte Task_80811BC

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

	thumb_func_start Task_80811BC
Task_80811BC: @ 0x080811BC
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
