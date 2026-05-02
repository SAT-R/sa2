.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _08071AB0 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	ldr r2, _08071AB4 @ =0x0300000C
	adds r7, r3, r2
	ldr r4, _08071AB8 @ =0x03000048
	adds r4, r4, r3
	mov r8, r4
	ldr r0, [r5]
	mov sb, r0
	ldrb r2, [r5, #8]
	lsls r2, r2, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	mov r4, sb
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r1, r1, #0x10
	ldr r0, _08071ABC @ =0x0300007A
	adds r2, r3, r0
	ldr r4, _08071AC0 @ =0x03000078
	ldrh r0, [r4, r3]
	ldrh r4, [r2]
	adds r0, r0, r4
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x10
	asrs r2, r1, #0x10
	mov ip, r2
	ldr r4, _08071AC4 @ =0x0300007C
	adds r3, r3, r4
	ldr r2, _08071AC8 @ =0xFFFA0000
	adds r1, r1, r2
	asrs r1, r1, #0x10
	ldrh r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	ldr r3, _08071ACC @ =gCamera
	ldrh r4, [r3]
	mov sl, r4
	lsrs r2, r0, #0x10
	str r2, [sp, #0xc]
	asrs r0, r0, #0x10
	mov r4, sl
	subs r2, r0, r4
	strh r2, [r7, #0x16]
	lsrs r2, r1, #0x10
	mov sl, r2
	asrs r1, r1, #0x10
	ldrh r4, [r3, #2]
	subs r2, r1, r4
	strh r2, [r7, #0x18]
	ldrh r2, [r3]
	subs r0, r0, r2
	mov r2, r8
	strh r0, [r2, #0x16]
	ldrh r0, [r3, #2]
	subs r1, r1, r0
	strh r1, [r2, #0x18]
	movs r4, #0
	ldrsh r1, [r3, r4]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r4, _08071AB0 @ =gCurTask
	cmp r6, r0
	bgt _08071A7E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	blt _08071A7E
	movs r0, #2
	ldrsh r2, [r3, r0]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r2, r1
	cmp ip, r0
	bgt _08071A7E
	adds r0, r2, #0
	subs r0, #0x80
	cmp ip, r0
	bge _08071AD0
_08071A7E:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08071AA2
	movs r2, #0x18
	ldrsh r0, [r7, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08071AA2
	movs r3, #0x18
	ldrsh r1, [r7, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08071AD0
_08071AA2:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r0, [r4]
	bl TaskDestroy
	b _08071BDA
	.align 2, 0
_08071AB0: .4byte gCurTask
_08071AB4: .4byte 0x0300000C
_08071AB8: .4byte 0x03000048
_08071ABC: .4byte 0x0300007A
_08071AC0: .4byte 0x03000078
_08071AC4: .4byte 0x0300007C
_08071AC8: .4byte 0xFFFA0000
_08071ACC: .4byte gCamera
_08071AD0:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	beq _08071AF8
	ldr r0, _08071AF4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08071BDA
	.align 2, 0
_08071AF4: .4byte gCurTask
_08071AF8:
	add r0, sp, #8
	str r0, [sp]
	ldr r0, _08071B3C @ =sa2__sub_801EE64
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F07C
	adds r2, r5, #0
	adds r2, #0x7c
	ldrh r1, [r2]
	adds r1, r1, r0
	movs r3, #0
	mov ip, r3
	strh r1, [r2]
	adds r0, r5, #0
	adds r0, #0x7a
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x18
	mov r0, sb
	movs r1, #3
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _08071B40
	adds r1, r5, #0
	adds r1, #0x78
	movs r0, #0xa0
	strh r0, [r1]
	b _08071BAC
	.align 2, 0
_08071B3C: .4byte sa2__sub_801EE64
_08071B40:
	mov r3, sb
	ldrb r0, [r3, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _08071B5C
	adds r1, r5, #0
	adds r1, #0x78
	ldr r0, _08071B58 @ =0x0000FF60
	strh r0, [r1]
	b _08071BAC
	.align 2, 0
_08071B58: .4byte 0x0000FF60
_08071B5C:
	adds r2, r5, #0
	adds r2, #0x80
	ldrh r0, [r2]
	movs r1, #0
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _08071B70
	subs r0, #1
	strh r0, [r2]
	b _08071BAC
_08071B70:
	ldr r1, _08071BEC @ =gPlayer
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	cmp r0, r6
	bgt _08071BAC
	ldr r0, [r1]
	asrs r1, r0, #8
	adds r0, r4, #0
	adds r0, #8
	cmp r1, r0
	bgt _08071BAC
	subs r0, #0x10
	cmp r0, r1
	bgt _08071BAC
	movs r0, #0x3c
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x7e
	strh r3, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	mov r2, ip
	strb r2, [r0]
	mov r0, r8
	adds r0, #0x20
	strb r2, [r0]
	ldr r0, _08071BF0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08071BF4 @ =Task_8071BFC
	str r0, [r1, #8]
_08071BAC:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	mov r0, r8
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r3, #0x10]
	mov r0, r8
	bl DisplaySprite
	mov r4, r8
	ldr r0, [r4, #0x10]
	ldr r1, _08071BF8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
_08071BDA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071BEC: .4byte gPlayer
_08071BF0: .4byte gCurTask
_08071BF4: .4byte Task_8071BFC
_08071BF8: .4byte 0xFFFFFBFF

.syntax divided
