.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #0x14]
	ldr r0, _0804444C @ =gPlayerControls
	ldrh r1, [r4, #0x3a]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08044450
	movs r0, #0
	b _08044598
	.align 2, 0
_0804444C: .4byte gPlayerControls
_08044450:
	ldr r0, _08044498 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804446E
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0804446E:
	adds r5, r4, #0
	adds r5, #0x27
	ldrb r0, [r5]
	movs r6, #1
	eors r0, r6
	strb r0, [r5]
	adds r0, r2, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl sa2__sub_8022F58
	cmp r0, #3
	bgt _0804449C
	ldrb r0, [r5]
	eors r0, r6
	strb r0, [r5]
	movs r0, #0
	b _08044598
	.align 2, 0
_08044498: .4byte gStageFlags
_0804449C:
	ldr r0, _080444B4 @ =gPlayer
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _080444B8
	movs r0, #0x86
	bl m4aSongNumStop
	b _080444BE
	.align 2, 0
_080444B4: .4byte gPlayer
_080444B8:
	movs r0, #0x72
	bl m4aSongNumStop
_080444BE:
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	ldr r1, _080444F8 @ =0xFEFFFFDF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _080444FC @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r1, _08044500 @ =gPlayer
	adds r1, #0x26
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x59
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	blt _08044514
	cmp r1, #2
	ble _08044504
	cmp r1, #3
	beq _0804450C
	b _08044514
	.align 2, 0
_080444F8: .4byte 0xFEFFFFDF
_080444FC: .4byte 0xFFFFF7FF
_08044500: .4byte gPlayer
_08044504:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #5
	b _08044512
_0804450C:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0x55
_08044512:
	strb r0, [r1]
_08044514:
	ldr r0, [r4, #0x10]
	movs r1, #0x40
	ands r0, r1
	movs r2, #0x9c
	lsls r2, r2, #3
	cmp r0, #0
	beq _08044526
	movs r2, #0xa8
	lsls r2, r2, #2
_08044526:
	ldrb r0, [r4, #0x14]
	subs r0, #0x40
	lsls r0, r0, #0x18
	ldr r1, _08044588 @ =gSineTable
	lsrs r0, r0, #0x15
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r4, #0xa]
	movs r0, #0x74
	bl m4aSongNumStart
	ldr r1, [r4, #0x64]
	ldr r0, [r1, #0x1c]
	ldr r3, _0804458C @ =0xFFFFCFFF
	ands r0, r3
	movs r2, #0x80
	lsls r2, r2, #6
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r1, [r4, #0x68]
	ldr r0, [r1, #0x1c]
	ands r0, r3
	orrs r0, r2
	str r0, [r1, #0x1c]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #3
	beq _08044596
	ldr r1, [r4, #0x10]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08044590
	orrs r1, r2
	str r1, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #9
	strb r0, [r4, #0xf]
	b _08044596
	.align 2, 0
_08044588: .4byte gSineTable
_0804458C: .4byte 0xFFFFCFFF
_08044590:
	movs r0, #0x10
	orrs r1, r0
	str r1, [r4, #0x10]
_08044596:
	movs r0, #1
_08044598:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
