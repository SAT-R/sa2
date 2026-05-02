.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08074648 @ =gCurTask
	ldr r0, [r1]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sb, r0
	ldr r2, _0807464C @ =0x0300000C
	adds r5, r7, r2
	ldr r3, [r0]
	str r3, [sp]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov sl, r1
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	mov r4, sb
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #4]
	mov r0, sl
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r6, [r4, #0x50]
	ldrb r2, [r3, #5]
	lsls r2, r2, #0xb
	ldr r1, _08074650 @ =gSineTable
	mov r8, r1
	ldr r3, _08074654 @ =0x03000058
	adds r0, r7, r3
	movs r4, #0
	ldrsh r3, [r0, r4]
	ldr r0, _08074658 @ =0x0300004E
	adds r4, r7, r0
	ldrh r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0807465C @ =0x000003FF
	mov ip, r1
	ands r0, r1
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	mov r1, sb
	str r0, [r1, #0x50]
	subs r6, r0, r6
	str r6, [sp, #0x10]
	ldr r6, [r1, #0x54]
	ldr r3, [sp]
	ldrb r2, [r3, #6]
	lsls r2, r2, #0xb
	ldr r1, _08074660 @ =0x0300005A
	adds r0, r7, r1
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldrh r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	muls r0, r3, r0
	mov r3, ip
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	mov r1, sb
	str r0, [r1, #0x54]
	subs r3, r0, r6
	ldrh r0, [r4]
	adds r0, #1
	movs r2, #0
	movs r1, #0
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x40
	beq _080745D4
	cmp r0, #0x80
	bne _080745E8
_080745D4:
	ldr r4, _08074664 @ =0x03000046
	adds r0, r7, r4
	strh r1, [r0]
	ldr r1, _08074668 @ =0x0300002C
	adds r0, r7, r1
	strb r2, [r0]
	ldr r2, _08074648 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _0807466C @ =sub_8074928
	str r0, [r1, #8]
_080745E8:
	mov r2, sb
	adds r2, #0x4e
	ldrh r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strh r0, [r2]
	ldr r7, _08074670 @ =gCamera
	ldrh r0, [r7]
	ldr r4, [sp, #8]
	subs r0, r4, r0
	ldr r1, [sp, #0x10]
	asrs r6, r1, #5
	adds r0, r0, r6
	strh r0, [r5, #0x16]
	asrs r4, r3, #4
	adds r0, r4, #0
	movs r1, #0x40
	bl Mod
	strh r0, [r5, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	beq _08074674
	adds r0, r4, #0
	movs r1, #0x40
	bl Mod
	ldrh r1, [r7, #2]
	ldr r2, [sp, #0xc]
	subs r1, r2, r1
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	mov r3, sl
	adds r1, r3, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #4]
	subs r2, r0, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	beq _08074694
	b _080746F2
	.align 2, 0
_08074648: .4byte gCurTask
_0807464C: .4byte 0x0300000C
_08074650: .4byte gSineTable
_08074654: .4byte 0x03000058
_08074658: .4byte 0x0300004E
_0807465C: .4byte 0x000003FF
_08074660: .4byte 0x0300005A
_08074664: .4byte 0x03000046
_08074668: .4byte 0x0300002C
_0807466C: .4byte sub_8074928
_08074670: .4byte gCamera
_08074674:
	mov r2, sl
	adds r1, r2, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	bne _080746F2
	ldrh r0, [r7, #2]
	ldr r4, [sp, #0xc]
	subs r0, r4, r0
	strh r0, [r5, #0x18]
_08074694:
	ldr r2, _080746FC @ =gCamera
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	ldr r4, [sp, #8]
	cmp r4, r0
	bgt _080746C6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r4, r0
	blt _080746C6
	movs r0, #2
	ldrsh r1, [r2, r0]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r3, [sp, #0xc]
	cmp r3, r0
	bgt _080746C6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r3, r0
	bge _08074704
_080746C6:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080746EA
	movs r4, #0x18
	ldrsh r0, [r5, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _080746EA
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08074704
_080746EA:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
_080746F2:
	ldr r0, _08074700 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08074728
	.align 2, 0
_080746FC: .4byte gCamera
_08074700: .4byte gCurTask
_08074704:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl DisplaySprite
	ldr r0, [r5, #0x10]
	ldr r1, _08074738 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
_08074728:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074738: .4byte 0xFFFFFBFF

.syntax divided
