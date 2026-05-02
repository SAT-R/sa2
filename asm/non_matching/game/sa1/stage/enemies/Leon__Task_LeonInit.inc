.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, _0806EB90 @ =gCurTask
	ldr r0, [r4]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0     @ r5 = leon
	adds r0, #0xc
	adds r6, r3, r0     @ r6 = s
	ldr r1, [r5]
	mov sb, r1          @ sb = me
	ldrb r2, [r5, #8]
	lsls r2, r2, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r2, r2, r0     @ r2 = worldX
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0     @ r1 = worldY
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov ip, r1
	ldr r2, _0806EB94 @ =0x03000048
	adds r0, r3, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5, #0x44]
	adds r0, r0, r1
	str r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r0, r7, r0
	lsls r0, r0, #0x10
	ldr r1, _0806EB98 @ =0x0300004C
	adds r3, r3, r1
	ldrh r1, [r3]
	add r1, ip
	lsls r1, r1, #0x10
	ldr r3, _0806EB9C @ =gCamera
	ldrh r2, [r3]
	mov r8, r2
	lsrs r2, r0, #0x10
	mov sl, r2
	asrs r0, r0, #0x10
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r6, #0x16]
	ldrh r0, [r3, #2]
	lsrs r2, r1, #0x10
	mov r8, r2
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r7, r0
	bgt _0806EB5E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r7, r0
	blt _0806EB5E
	movs r0, #2
	ldrsh r2, [r3, r0]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r2, r1
	cmp ip, r0
	bgt _0806EB5E
	adds r0, r2, #0
	subs r0, #0x80
	cmp ip, r0
	bge _0806EBA0
_0806EB5E:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0806EB82
	movs r2, #0x18
	ldrsh r0, [r6, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _0806EB82
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0806EBA0
_0806EB82:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r0, [r4]
	bl TaskDestroy
	b _0806ED2C
	.align 2, 0
_0806EB90: .4byte gCurTask
_0806EB94: .4byte 0x03000048
_0806EB98: .4byte 0x0300004C
_0806EB9C: .4byte gCamera
_0806EBA0:
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl Coll_Player_Enemy_Attack
	mov r8, r0
	cmp r0, #0
	beq _0806EBCC
	ldr r0, _0806EBC8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0806ED2C
	.align 2, 0
_0806EBC8: .4byte gCurTask
_0806EBCC:
	adds r0, r4, #3
	add r1, sp, #8
	str r1, [sp]
	ldr r1, _0806EC34 @ =sa2__sub_801EE64
	str r1, [sp, #4]
	adds r1, r7, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F07C
	adds r2, r5, #0
	adds r2, #0x4c
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	ldr r0, [r5, #0x44]
	asrs r2, r0, #8
	mov r3, sb
	movs r1, #3
	ldrsb r1, [r3, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _0806EC40
	ldr r0, [r6, #0x10]
	mvns r0, r0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r0, r2
	cmp r0, #0
	bne _0806EC0A
	b _0806ED20
_0806EC0A:
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0xa0
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x4a
	mov r1, r8
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0806EC38 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806EC3C @ =Task_806ED3C
	str r0, [r1, #8]
	ldr r0, [r6, #0x10]
	orrs r0, r2
	str r0, [r6, #0x10]
	b _0806ED20
	.align 2, 0
_0806EC34: .4byte sa2__sub_801EE64
_0806EC38: .4byte gCurTask
_0806EC3C: .4byte Task_806ED3C
_0806EC40:
	mov r3, sb
	ldrb r0, [r3, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _0806EC94
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0806ED20
	adds r1, r5, #0
	adds r1, #0x48
	ldr r0, _0806EC84 @ =0x0000FF60
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x4a
	mov r1, r8
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	ldr r0, [r6, #0x10]
	ldr r1, _0806EC88 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r0, _0806EC8C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806EC90 @ =Task_806ED3C
	str r0, [r1, #8]
	b _0806ED20
	.align 2, 0
_0806EC84: .4byte 0x0000FF60
_0806EC88: .4byte 0xFFFFFBFF
_0806EC8C: .4byte gCurTask
_0806EC90: .4byte Task_806ED3C
_0806EC94:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrh r0, [r3]
	movs r1, #0
	ldrsh r2, [r3, r1]
	mov r8, r2
	cmp r2, #0
	bne _0806ED1C
	ldr r2, _0806ECE4 @ =gPlayer
	ldr r0, [r2, #4]
	asrs r1, r0, #8
	adds r0, r4, #0
	adds r0, #8
	cmp r1, r0
	bgt _0806ED20
	subs r0, #0x28
	cmp r0, r1
	bgt _0806ED20
	ldr r1, [r6, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _0806ECE8
	ldr r0, [r2]
	asrs r1, r0, #8
	cmp r1, r7
	blt _0806ED20
	adds r0, r7, #0
	adds r0, #0x50
	cmp r0, r1
	blt _0806ED20
	movs r0, #0x3c
	strh r0, [r3]
	adds r0, r5, #0
	adds r0, #0x4a
	mov r2, r8
	strh r2, [r0]
	b _0806ED02
	.align 2, 0
_0806ECE4: .4byte gPlayer
_0806ECE8:
	ldr r0, [r2]
	asrs r2, r0, #8
	cmp r2, r7
	bgt _0806ED20
	adds r0, r7, #0
	subs r0, #0x50
	cmp r0, r2
	bgt _0806ED20
	movs r0, #0x3c
	strh r0, [r3]
	adds r0, r5, #0
	adds r0, #0x4a
	strh r1, [r0]
_0806ED02:
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806ED14 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806ED18 @ =Task_806EEA4
	str r0, [r1, #8]
	b _0806ED20
	.align 2, 0
_0806ED14: .4byte gCurTask
_0806ED18: .4byte Task_806EEA4
_0806ED1C:
	subs r0, #1
	strh r0, [r3]
_0806ED20:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0806ED2C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
