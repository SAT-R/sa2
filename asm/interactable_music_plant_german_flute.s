.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
	thumb_func_start sub_8076928
sub_8076928: @ 0x08076928
	push {r4, r5, r6, lr}
	ldr r0, _0807694C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _08076950 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08076954
	adds r0, r5, #0
	bl sub_8076CF4
	b _080769D8
	.align 2, 0
_0807694C: .4byte gCurTask
_08076950: .4byte gPlayer
_08076954:
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _08076964
	adds r0, r5, #0
	bl sub_8076D08
	b _080769D8
_08076964:
	ldr r0, [r5]        @ r5 = flute
	lsls r3, r0, #8
	ldr r0, [r5, #4]
	lsls r0, r0, #8
	movs r6, #0xc0
	lsls r6, r6, #5
	adds r4, r0, r6
	ldr r0, [r2, #8]    @ r2 = gPlayer
	cmp r0, r3
	beq _08076990
	cmp r0, r3
	ble _08076986
	subs r0, #0x80
	str r0, [r2, #8]
	cmp r0, r3
	bge _08076990
	b _0807698E
_08076986:
	adds r0, #0x80
	str r0, [r2, #8]
	cmp r0, r3
	ble _08076990
_0807698E:
	str r3, [r2, #8]
_08076990:
	ldr r0, [r2, #8]
	subs r1, r0, r3
	cmp r1, #0
	blt _080769A2
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	ble _080769AC
	b _080769C6
_080769A2:
	subs r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bgt _080769C6
_080769AC:
	ldr r1, [r2, #0xc]
	cmp r1, r4
	beq _080769C6
	ldrh r0, [r2, #0x12]
	adds r0, #0x2a
	strh r0, [r2, #0x12]
	movs r6, #0x12
	ldrsh r0, [r2, r6]
	adds r0, r1, r0
	str r0, [r2, #0xc]
	cmp r0, r4
	ble _080769C6
	str r4, [r2, #0xc]
_080769C6:
	ldr r0, [r2, #8]
	cmp r0, r3
	bne _080769D8
	ldr r0, [r2, #0xc]
	cmp r0, r4
	bne _080769D8
	adds r0, r5, #0
	bl sub_8076C58
_080769D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
.endif
