.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start CreateMultiplayerFinishHandler
CreateMultiplayerFinishHandler: @ 0x0200A27C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0200A2A4 @ =Task_801A04C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200A2A4: .4byte Task_801A04C

	thumb_func_start sub_0200A2A8
sub_0200A2A8: @ 0x0200A2A8
	push {r4, r5, r6, r7, lr}
	ldr r3, _0200A308 @ =gCurTask
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldrb r7, [r0, #8]
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	lsls r0, r7, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r4, r0, r2
	ldr r1, _0200A30C @ =gPlayer
	ldr r0, [r1, #8]
	asrs r2, r0, #8
	mov ip, r1
	cmp r5, r2
	bgt _0200A328
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r2
	blt _0200A328
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0200A328
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r4, r0
	cmp r0, r1
	blt _0200A328
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _0200A310
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	b _0200A31A
	.align 2, 0
_0200A308: .4byte gCurTask
_0200A30C: .4byte gPlayer
_0200A310:
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
_0200A31A:
	strb r0, [r2]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _0200A35C @ =0xFEFFFFFF
	ands r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
_0200A328:
	ldr r1, _0200A360 @ =gCamera
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0200A34E
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200A34E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _0200A356
_0200A34E:
	strb r7, [r6]
	ldr r0, [r3]
	bl TaskDestroy
_0200A356:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A35C: .4byte 0xFEFFFFFF
_0200A360: .4byte gCamera

	thumb_func_start CreateEntity_Toggle_PlayerLayer
CreateEntity_Toggle_PlayerLayer: @ 0x0200A364
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0200A3AC @ =sub_0200A2A8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200A3AC: .4byte sub_0200A2A8

	thumb_func_start sub_0200A3B0
sub_0200A3B0: @ 0x0200A3B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0200A4C4 @ =sub_0200A4F0
	ldr r2, _0200A4C8 @ =0x00002010
	ldr r1, _0200A4CC @ =sub_0200A6A4
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	ldr r7, _0200A4D0 @ =gUnknown_0300000C
	add r7, r8
	movs r3, #0
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	strb r6, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r1, _0200A4D4 @ =gUnknown_0300002D
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0200A4D8 @ =gUnknown_0300002E
	add r1, r8
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0200A4DC @ =gUnknown_03000031
	add r0, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0x66
	strh r0, [r7, #0xa]
	ldr r1, _0200A4E0 @ =gUnknown_02015B24
	mov r0, sl
	lsls r2, r0, #1
	adds r0, r2, r1
	ldrb r3, [r0]
	ldr r0, _0200A4E4 @ =gUnknown_0300002C
	add r0, r8
	strb r3, [r0]
	adds r1, #1
	adds r2, r2, r1
	ldrb r2, [r2]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0200A486
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0200A486:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0200A498
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r7, #0x10]
_0200A498:
	ldr r0, _0200A4E8 @ =gUnknown_0300003C
	add r0, r8
	mov r1, sl
	strb r1, [r0]
	mov r6, sb
	ldrb r1, [r6, #3]
	movs r0, #3
	ands r0, r1
	ldr r1, _0200A4EC @ =gUnknown_0300003D
	add r1, r8
	strb r0, [r1]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A4C4: .4byte sub_0200A4F0
_0200A4C8: .4byte 0x00002010
_0200A4CC: .4byte sub_0200A6A4
_0200A4D0: .4byte gUnknown_0300000C
_0200A4D4: .4byte gUnknown_0300002D
_0200A4D8: .4byte gUnknown_0300002E
_0200A4DC: .4byte gUnknown_03000031
_0200A4E0: .4byte gUnknown_02015B24
_0200A4E4: .4byte gUnknown_0300002C
_0200A4E8: .4byte gUnknown_0300003C
_0200A4EC: .4byte gUnknown_0300003D

	thumb_func_start sub_0200A4F0
sub_0200A4F0: @ 0x0200A4F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0200A55C @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0xc
	adds r5, r4, r0
	ldr r1, [r6]
	mov r8, r1
	ldr r3, _0200A560 @ =gPlayer
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_0200A61C
	cmp r0, #0
	beq _0200A528
	ldr r1, [r7]
	ldr r0, _0200A564 @ =sub_0200A57C
	str r0, [r1, #8]
	ldr r0, _0200A568 @ =gUnknown_0300002C
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0200A528:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0200A54C
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0200A54C
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200A56C
_0200A54C:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0200A55C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0200A572
	.align 2, 0
_0200A55C: .4byte gCurTask
_0200A560: .4byte gPlayer
_0200A564: .4byte sub_0200A57C
_0200A568: .4byte gUnknown_0300002C
_0200A56C:
	adds r0, r5, #0
	bl DisplaySprite
_0200A572:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A57C
sub_0200A57C: @ 0x0200A57C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0200A5D4 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	ldr r1, _0200A5D8 @ =gUnknown_0300000C
	adds r4, r6, r1
	ldr r7, [r5]
	ldr r3, _0200A5DC @ =gPlayer
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0200A61C
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0200A5C6
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0200A5C6
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200A5E0
_0200A5C6:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, _0200A5D4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0200A608
	.align 2, 0
_0200A5D4: .4byte gCurTask
_0200A5D8: .4byte gUnknown_0300000C
_0200A5DC: .4byte gPlayer
_0200A5E0:
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _0200A602
	ldr r0, _0200A614 @ =gUnknown_0300002C
	adds r1, r6, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0200A618 @ =sub_0200A4F0
	str r0, [r1, #8]
_0200A602:
	adds r0, r4, #0
	bl DisplaySprite
_0200A608:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A614: .4byte gUnknown_0300002C
_0200A618: .4byte sub_0200A4F0

	thumb_func_start sub_0200A61C
sub_0200A61C: @ 0x0200A61C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldrb r2, [r4, #8]
	lsls r2, r2, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _0200A694 @ =gCamera
	ldr r0, [r3]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0200A69C
	adds r0, r6, #0
	adds r1, r7, #0
	adds r3, r5, #0
	bl Coll_Player_Interactable
	cmp r0, #0
	beq _0200A69C
	ldr r1, _0200A698 @ =gUnknown_02015B38
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x14
	bl m4aSongNumStart
	movs r0, #1
	b _0200A69E
	.align 2, 0
_0200A694: .4byte gCamera
_0200A698: .4byte gUnknown_02015B38
_0200A69C:
	movs r0, #0
_0200A69E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200A6A4
sub_0200A6A4: @ 0x0200A6A4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Big_DownLeft
CreateEntity_Spring_Big_DownLeft: @ 0x0200A6B8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #6
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Normal_Down
CreateEntity_Spring_Normal_Down: @ 0x0200A6E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Big_DownRight
CreateEntity_Spring_Big_DownRight: @ 0x0200A710
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #7
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Normal_Left
CreateEntity_Spring_Normal_Left: @ 0x0200A73C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Normal_Right
CreateEntity_Spring_Normal_Right: @ 0x0200A768
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Big_UpLeft
CreateEntity_Spring_Big_UpLeft: @ 0x0200A794
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Normal_Up
CreateEntity_Spring_Normal_Up: @ 0x0200A7C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Big_UpRight
CreateEntity_Spring_Big_UpRight: @ 0x0200A7EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #5
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Small_UpLeft
CreateEntity_Spring_Small_UpLeft: @ 0x0200A818
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spring_Small_UpRight
CreateEntity_Spring_Small_UpRight: @ 0x0200A844
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #9
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Ramp
CreateEntity_Ramp: @ 0x0200A870
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0200A95C @ =sub_0200A974
	ldr r2, _0200A960 @ =0x00002010
	ldr r1, _0200A964 @ =sub_0200ACA4
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r6, r1
	ldr r2, _0200A968 @ =gUnknown_0300000C
	adds r7, r6, r2
	movs r0, #0
	mov sl, r0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r2, sb
	str r2, [r1]
	ldrb r0, [r2]
	strb r0, [r1, #8]
	mov r0, r8
	strb r0, [r1, #9]
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r2, sb
	strb r0, [r2]
	ldrb r0, [r2, #3]
	movs r4, #3
	ands r4, r0
	strh r4, [r1, #0x3c]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0x67
	strh r0, [r7, #0xa]
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r2, _0200A96C @ =gUnknown_0300002C
	adds r1, r6, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #1
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0200A970 @ =gUnknown_0300002E
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r2, #4
	adds r6, r6, r2
	movs r0, #0
	strb r0, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0200A944
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0200A944:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A95C: .4byte sub_0200A974
_0200A960: .4byte 0x00002010
_0200A964: .4byte sub_0200ACA4
_0200A968: .4byte gUnknown_0300000C
_0200A96C: .4byte gUnknown_0300002C
_0200A970: .4byte gUnknown_0300002E

	thumb_func_start sub_0200A974
sub_0200A974: @ 0x0200A974
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r6, _0200AA64 @ =gPlayer
	ldr r0, _0200AA68 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _0200AA6C @ =gUnknown_0300000C
	adds r0, r0, r1
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp]
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _0200AA70 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, r8
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	str r2, [sp, #8]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r4, r8
	strh r1, [r4, #0x18]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0200A9E2
	b _0200AC42
_0200A9E2:
	movs r5, #0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0200A9F4
	ldr r0, [r6, #0x3c]
	cmp r0, r8
	bne _0200A9F4
	movs r5, #1
_0200A9F4:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #8]
	lsls r4, r2, #0x10
	asrs r2, r4, #0x10
	mov r0, r8
	adds r3, r6, #0
	bl Coll_Player_Interactable
	adds r1, r0, #0
	cmp r1, #0
	bne _0200AA10
	b _0200ABB6
_0200AA10:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	mov r3, sb
	ldrh r5, [r3, #0x3c]
	cmp r0, #0
	beq _0200AA2E
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200AA2E
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0200AA4A
_0200AA2E:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0200AA74
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200AA42
	b _0200AC42
_0200AA42:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bgt _0200AA74
_0200AA4A:
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	b _0200AC42
	.align 2, 0
_0200AA64: .4byte gPlayer
_0200AA68: .4byte gCurTask
_0200AA6C: .4byte gUnknown_0300000C
_0200AA70: .4byte gCamera
_0200AA74:
	movs r0, #2
	mov sl, r0
	ands r0, r5
	cmp r0, #0
	beq _0200AA80
	b _0200AC42
_0200AA80:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r2
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r7, r0, r1
	cmp r7, #0
	bgt _0200AAA6
	b _0200ABAA
_0200AAA6:
	cmp r7, r2
	ble _0200AAE6
	ldr r0, [r6, #0x20]
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	bne _0200AADA
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0200AADA
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r0, sb
	ldrh r1, [r0, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
_0200AADA:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	b _0200ABA4
_0200AAE6:
	ldr r5, [r6, #0xc]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	asrs r1, r4, #0x10
	subs r0, r0, r1
	str r0, [sp, #0xc]
	mov r0, r8
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r7, #8
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl __divsi3
	muls r0, r4, r0
	asrs r3, r0, #8
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, r3
	blt _0200AB9A
	ldr r0, [r6, #0x20]
	mov r4, sl
	ands r0, r4
	cmp r0, #0
	bne _0200AB78
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0200AB78
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0200AB5C @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0200AB78
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	cmp r7, r0
	bge _0200AB60
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	b _0200AC18
	.align 2, 0
_0200AB5C: .4byte gUnknown_030057C8
_0200AB60:
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r3, sb
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	b _0200AC18
_0200AB78:
	ldr r4, [sp, #0xc]
	subs r0, r3, r4
	lsls r0, r0, #8
	adds r0, r5, r0
	str r0, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r0, r8
	b _0200AC40
_0200AB9A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, sl
_0200ABA4:
	orrs r0, r1
	str r0, [r6, #0x20]
	b _0200AC42
_0200ABAA:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	b _0200AC42
_0200ABB6:
	cmp r5, #0
	beq _0200AC42
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #2
	ands r0, r1
	adds r5, r1, #0
	cmp r0, #0
	beq _0200ABDE
	ldr r0, [r6, #8]
	asrs r3, r0, #8
	mov r4, r8
	movs r1, #0x16
	ldrsh r2, [r4, r1]
	adds r4, r0, #0
	cmp r3, r2
	blt _0200ABEE
	cmp r3, r2
	bgt _0200AC34
	b _0200AC20
_0200ABDE:
	ldr r0, [r6, #8]
	asrs r2, r0, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r1, [r3, r4]
	adds r4, r0, #0
	cmp r2, r1
	ble _0200AC28
_0200ABEE:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0200AC42
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0200AC42
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
_0200AC18:
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
	b _0200AC42
_0200AC20:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _0200AC42
_0200AC28:
	asrs r1, r4, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bge _0200AC42
_0200AC34:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
_0200AC40:
	str r0, [r6, #0x3c]
_0200AC42:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0200AC84 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0200AC72
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200AC72
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200AC8C
_0200AC72:
	mov r4, sb
	ldrb r0, [r4, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0200AC88 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0200AC92
	.align 2, 0
_0200AC84: .4byte gCamera
_0200AC88: .4byte gCurTask
_0200AC8C:
	mov r0, r8
	bl DisplaySprite
_0200AC92:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200ACA4
sub_0200ACA4: @ 0x0200ACA4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_Spikes_Up
CreateEntity_Spikes_Up: @ 0x0200ACB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0200AD84 @ =sub_0200ADA0
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0200AD88 @ =gUnknown_0300000C
	adds r0, r3, r2
	mov r7, r8
	str r7, [r1, #0x40]
	str r7, [r1, #0x3c]
	movs r2, #0
	mov sl, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, sb
	str r7, [r1]
	ldrb r2, [r7]
	strb r2, [r1, #8]
	strb r6, [r1, #9]
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r4, r4, #8
	adds r1, r1, r4
	strh r1, [r0, #0x16]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	lsls r5, r5, #8
	adds r1, r1, r5
	strh r1, [r0, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r7]
	ldr r1, _0200AD8C @ =0x06011000
	str r1, [r0, #4]
	movs r1, #0x88
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	mov r7, r8
	strh r7, [r0, #8]
	movs r1, #0x65
	strh r1, [r0, #0xa]
	ldr r2, _0200AD90 @ =gUnknown_0300002C
	adds r1, r3, r2
	mov r7, sl
	strb r7, [r1]
	mov r1, r8
	strh r1, [r0, #0x14]
	strh r1, [r0, #0x1c]
	ldr r7, _0200AD94 @ =gUnknown_0300002D
	adds r2, r3, r7
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _0200AD98 @ =gUnknown_0300002E
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _0200AD9C @ =gUnknown_03000031
	adds r3, r3, r2
	mov r7, sl
	strb r7, [r3]
	subs r1, #0x11
	str r1, [r0, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	bl UpdateSpriteAnimation
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200AD84: .4byte sub_0200ADA0
_0200AD88: .4byte gUnknown_0300000C
_0200AD8C: .4byte 0x06011000
_0200AD90: .4byte gUnknown_0300002C
_0200AD94: .4byte gUnknown_0300002D
_0200AD98: .4byte gUnknown_0300002E
_0200AD9C: .4byte gUnknown_03000031

	thumb_func_start sub_0200ADA0
sub_0200ADA0: @ 0x0200ADA0
	push {r4, r5, r6, lr}
	ldr r0, _0200AE1C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r4, r1, r0
	ldr r6, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0200AE20 @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r4, #0x18]
	ldr r3, _0200AE24 @ =gPlayer
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0200AE34
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0200AE0E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0200AE0E
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200AE28
_0200AE0E:
	ldrb r0, [r5, #8]
	strb r0, [r6]
	ldr r0, _0200AE1C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0200AE2E
	.align 2, 0
_0200AE1C: .4byte gCurTask
_0200AE20: .4byte gCamera
_0200AE24: .4byte gPlayer
_0200AE28:
	adds r0, r4, #0
	bl DisplaySprite
_0200AE2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200AE34
sub_0200AE34: @ 0x0200AE34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _0200AF04 @ =gCamera
	ldr r0, [r2]
	lsrs r7, r3, #0x10
	mov sl, r7
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r2, r1, #0x10
	mov sb, r2
	asrs r7, r1, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	ldr r0, _0200AF08 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200AF38
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0200AF38
	ldr r0, _0200AF0C @ =gUnknown_030053A0
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0200AF38
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl Coll_Player_Platform
	mov r8, r0
	cmp r0, #0
	beq _0200AF38
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200AEE0
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
_0200AEE0:
	ldr r0, _0200AF10 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0200AF14
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _0200AF2A
	.align 2, 0
_0200AF04: .4byte gCamera
_0200AF08: .4byte gGameMode
_0200AF0C: .4byte gUnknown_030053A0
_0200AF10: .4byte gStageFlags
_0200AF14:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_0200AF2A:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl Coll_DamagePlayer
	cmp r0, #0
	bne _0200B002
_0200AF38:
	ldr r1, [r5, #0x20]
	lsrs r7, r1, #3
	movs r0, #1
	ands r7, r0
	lsrs r1, r1, #1
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	ldr r0, [r5, #0x3c]
	str r0, [sp, #8]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl Coll_Player_Platform
	adds r2, r0, #0
	cmp r2, #0
	beq _0200B068
	movs r3, #0xc0
	lsls r3, r3, #0xa
	ands r3, r2
	cmp r3, #0
	beq _0200B040
	ldr r0, _0200AFC4 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	beq _0200AFC8
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0200B068
	movs r0, #0
	strh r0, [r5, #0x12]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r4, r0
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
	b _0200AFF8
	.align 2, 0
_0200AFC4: .4byte gStageFlags
_0200AFC8:
	movs r0, #0x80
	lsls r0, r0, #9
	mov sb, r0
	ands r2, r0
	cmp r2, #0
	beq _0200B068
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200B090
	adds r2, r0, #0
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _0200B00C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	ldr r1, [r5, #0xc]
	adds r1, r1, r0
	str r1, [r5, #0xc]
	mov r2, sl
	strh r2, [r5, #0x12]
_0200AFF8:
	adds r0, r5, #0
	bl Coll_DamagePlayer
	cmp r0, #0
	beq _0200B068
_0200B002:
	movs r0, #0x15
	bl m4aSongNumStart
	movs r0, #1
	b _0200B06A
_0200B00C:
	cmp r7, #0
	beq _0200B018
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	b _0200B020
_0200B018:
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
_0200B020:
	str r0, [r5, #0x20]
	mov r7, r8
	cmp r7, #0
	beq _0200B030
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	b _0200B038
_0200B030:
	ldr r0, [r5, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
_0200B038:
	str r0, [r5, #0x20]
	ldr r0, [sp, #8]
	str r0, [r5, #0x3c]
	b _0200B068
_0200B040:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0200B068
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0200B068:
	movs r0, #0
_0200B06A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200B07C
sub_0200B07C: @ 0x0200B07C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_0200B090
sub_0200B090: @ 0x0200B090
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r4, [r5]
	adds r4, #1
	strb r4, [r5]
	adds r6, r0, #0
	adds r6, #0x2e
	ldrb r4, [r6]
	subs r4, #1
	strb r4, [r6]
	bl Coll_Player_Platform
	ldrb r1, [r5]
	subs r1, #1
	strb r1, [r5]
	ldrb r1, [r6]
	adds r1, #1
	strb r1, [r6]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0200B0BC
sub_0200B0BC: @ 0x0200B0BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0200B1FC @ =gPlayer
	mov ip, r0
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	mov r2, ip
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0200B200 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov sb, r0
	ldr r3, _0200B204 @ =gUnknown_03000008
	adds r0, r1, r3
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, _0200B208 @ =gUnknown_03000004
	adds r0, r1, r2
	ldrh r2, [r0]
	subs r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]
	ldr r0, _0200B20C @ =gUnknown_03000009
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp, #4]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r2, sb
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, ip
	ldr r3, [r0, #0x20]
	adds r0, r3, #0
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B132
	b _0200B30A
_0200B132:
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	movs r2, #3
	ldrsb r2, [r1, r2]
	lsls r1, r2, #3
	adds r4, r0, r1
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r7, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #0x10]
	cmp r4, r7
	ble _0200B152
	b _0200B2F8
_0200B152:
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r6, r0, #3
	adds r1, r4, r6
	str r0, [sp, #0xc]
	cmp r1, r7
	bge _0200B162
	b _0200B2F8
_0200B162:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r1, r2, r0
	cmp r1, r8
	ble _0200B178
	b _0200B2F8
_0200B178:
	mov r0, sb
	ldrb r0, [r0, #6]
	lsls r0, r0, #3
	str r0, [sp, #0x14]
	adds r1, r1, r0
	cmp r1, r8
	bge _0200B188
	b _0200B2F8
_0200B188:
	movs r1, #0
	cmp r8, r2
	bgt _0200B190
	movs r1, #1
_0200B190:
	mov r2, ip
	movs r0, #0x12
	ldrsh r2, [r2, r0]
	cmp r2, #0
	bge _0200B19C
	b _0200B2E4
_0200B19C:
	cmp r1, #0
	bne _0200B1A2
	b _0200B2E4
_0200B1A2:
	adds r0, r5, #0
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B1AE
	b _0200B2E4
_0200B1AE:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	bne _0200B1BA
	b _0200B2B0
_0200B1BA:
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0200B238
	ands r3, r1
	cmp r3, #0
	beq _0200B230
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	blt _0200B1EA
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B210 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B230
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B230
_0200B1EA:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B214
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B21A
	.align 2, 0
_0200B1FC: .4byte gPlayer
_0200B200: .4byte gCurTask
_0200B204: .4byte gUnknown_03000008
_0200B208: .4byte gUnknown_03000004
_0200B20C: .4byte gUnknown_03000009
_0200B210: .4byte gUnknown_030057C8
_0200B214:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B21A:
	strb r0, [r1]
	ldr r2, _0200B228 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r3, _0200B22C @ =gUnknown_03000009
	adds r1, r1, r3
	b _0200B29E
	.align 2, 0
_0200B228: .4byte gCurTask
_0200B22C: .4byte gUnknown_03000009
_0200B230:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0200B2E4
_0200B238:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200B2E4
	ldr r3, [sp, #0x10]
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r3, [sp, #0xc]
	lsls r1, r3, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _0200B276
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B288 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B2E4
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B2E4
_0200B276:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B28C
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B292
	.align 2, 0
_0200B288: .4byte gUnknown_030057C8
_0200B28C:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B292:
	strb r0, [r1]
	ldr r1, _0200B2A8 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0200B2AC @ =gUnknown_03000009
	adds r1, r1, r2
_0200B29E:
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	b _0200B2E4
	.align 2, 0
_0200B2A8: .4byte gCurTask
_0200B2AC: .4byte gUnknown_03000009
_0200B2B0:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0200B2C2
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	blt _0200B2CA
	b _0200B2E4
_0200B2C2:
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	ble _0200B2E4
_0200B2CA:
	mov r2, ip
	adds r2, #0x6d
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x6e
	strb r1, [r0]
	movs r1, #1
	ands r5, r1
	cmp r5, #0
	beq _0200B2E4
	strb r1, [r0]
_0200B2E4:
	ldr r3, _0200B2F0 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r0, _0200B2F4 @ =gUnknown_03000009
	adds r1, r1, r0
	b _0200B302
	.align 2, 0
_0200B2F0: .4byte gCurTask
_0200B2F4: .4byte gUnknown_03000009
_0200B2F8:
	ldr r1, _0200B36C @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0200B370 @ =gUnknown_03000009
	adds r1, r1, r2
_0200B302:
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
_0200B30A:
	ldr r2, _0200B374 @ =gCamera
	ldr r0, [r2]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0200B34C
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200B34C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200B35C
_0200B34C:
	mov r2, sp
	ldrb r3, [r2, #4]
	mov r2, sb
	strb r3, [r2]
	ldr r1, _0200B36C @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
_0200B35C:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B36C: .4byte gCurTask
_0200B370: .4byte gUnknown_03000009
_0200B374: .4byte gCamera

	thumb_func_start sub_0200B378
sub_0200B378: @ 0x0200B378
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0200B47C @ =gPlayer
	mov ip, r0
	ldr r4, _0200B480 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	ldr r2, _0200B484 @ =gUnknown_03000008
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldr r3, _0200B488 @ =gUnknown_03000004
	adds r0, r1, r3
	ldrh r2, [r0]
	ldr r7, _0200B48C @ =gUnknown_03000006
	adds r0, r1, r7
	ldrh r3, [r0]
	ldr r0, _0200B490 @ =gUnknown_03000009
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, r8
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r7, ip
	ldr r3, [r7, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0200B3DE
	b _0200B4FC
_0200B3DE:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r6, r0, r1
	ldr r0, [r7, #8]
	asrs r4, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #4]
	cmp r6, r4
	ble _0200B3FC
	b _0200B4FC
_0200B3FC:
	mov r2, r8
	ldrb r0, [r2, #5]
	lsls r7, r0, #3
	str r7, [sp, #0x10]
	adds r1, r6, r7
	str r0, [sp, #0xc]
	cmp r1, r4
	blt _0200B4FC
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	ldrsb r1, [r2, r1]
	lsls r1, r1, #3
	adds r2, r0, r1
	mov r7, ip
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _0200B4FC
	mov r7, r8
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _0200B4FC
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	beq _0200B4FC
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0200B4A0
	ands r3, r1
	cmp r3, #0
	beq _0200B498
	ldr r1, [sp, #0x10]
	asrs r0, r1, #1
	adds r0, r6, r0
	cmp r4, r0
	blt _0200B46C
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B494 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B498
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B498
_0200B46C:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B4F4
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B4FA
	.align 2, 0
_0200B47C: .4byte gPlayer
_0200B480: .4byte gCurTask
_0200B484: .4byte gUnknown_03000008
_0200B488: .4byte gUnknown_03000004
_0200B48C: .4byte gUnknown_03000006
_0200B490: .4byte gUnknown_03000009
_0200B494: .4byte gUnknown_030057C8
_0200B498:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0200B4FC
_0200B4A0:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200B4FC
	ldr r3, [sp, #4]
	asrs r2, r3, #8
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	lsls r1, r7, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _0200B4DE
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B4F0 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B4FC
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B4FC
_0200B4DE:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B4F4
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B4FA
	.align 2, 0
_0200B4F0: .4byte gUnknown_030057C8
_0200B4F4:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B4FA:
	strb r0, [r1]
_0200B4FC:
	ldr r2, _0200B560 @ =gCamera
	ldr r0, [r2]
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r7, sb
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0200B53E
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200B53E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200B54E
_0200B53E:
	mov r2, sp
	ldrb r3, [r2]
	mov r2, r8
	strb r3, [r2]
	ldr r7, _0200B564 @ =gCurTask
	ldr r0, [r7]
	bl TaskDestroy
_0200B54E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B560: .4byte gCamera
_0200B564: .4byte gCurTask

	thumb_func_start sub_0200B568
sub_0200B568: @ 0x0200B568
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0200B5D8 @ =sub_0200B0BC
	ldr r2, _0200B5DC @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _0200B5E0 @ =gUnknown_03000009
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _0200B5E4 @ =gUnknown_03000008
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200B5D8: .4byte sub_0200B0BC
_0200B5DC: .4byte 0x00002010
_0200B5E0: .4byte gUnknown_03000009
_0200B5E4: .4byte gUnknown_03000008

	thumb_func_start sub_0200B5E8
sub_0200B5E8: @ 0x0200B5E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0200B658 @ =sub_0200B378
	ldr r2, _0200B65C @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _0200B660 @ =gUnknown_03000009
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _0200B664 @ =gUnknown_03000008
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200B658: .4byte sub_0200B378
_0200B65C: .4byte 0x00002010
_0200B660: .4byte gUnknown_03000009
_0200B664: .4byte gUnknown_03000008

	thumb_func_start sub_0200B668
sub_0200B668: @ 0x0200B668
	push {r4, lr}
	sub sp, #4
	ldr r0, _0200B690 @ =sub_0200B698
	ldr r2, _0200B694 @ =0x00002010
	movs r4, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200B690: .4byte sub_0200B698
_0200B694: .4byte 0x00002010

	thumb_func_start sub_0200B698
sub_0200B698: @ 0x0200B698
	push {r4, lr}
	ldr r4, _0200B6C8 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0200B6C0
	movs r0, #0x1a
	bl m4aSongNumStart
	ldr r0, [r4]
	bl TaskDestroy
_0200B6C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200B6C8: .4byte gCurTask

	thumb_func_start CreateEntity_GrindRail_StartAir
CreateEntity_GrindRail_StartAir: @ 0x0200B6CC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_End_ForcedJump
CreateEntity_GrindRail_End_ForcedJump: @ 0x0200B6EC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_Start
CreateEntity_GrindRail_Start: @ 0x0200B70C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_EndGround
CreateEntity_GrindRail_EndGround: @ 0x0200B72C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_EndAir
CreateEntity_GrindRail_EndAir: @ 0x0200B74C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_EndAir_Left
CreateEntity_GrindRail_EndAir_Left: @ 0x0200B76C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_EndAlternate
CreateEntity_GrindRail_EndAlternate: @ 0x0200B78C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_GrindRail_EndGround_Left
CreateEntity_GrindRail_EndGround_Left: @ 0x0200B7AC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CreateEntity_MultiplayerTeleport
CreateEntity_MultiplayerTeleport: @ 0x0200B7CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _0200B858 @ =sub_0200BB44
	ldr r2, _0200B85C @ =0x00002010
	movs r5, #0
	str r5, [sp]
	movs r1, #0x24
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	str r5, [r2, #0x14]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	str r5, [r2, #0x1c]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200B858: .4byte sub_0200BB44
_0200B85C: .4byte 0x00002010

	thumb_func_start sub_0200B860
sub_0200B860: @ 0x0200B860
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #8
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	bge _0200B964
	ldr r0, _0200B8B8 @ =gPlayer
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	adds r1, r2, r1
	lsls r1, r1, #8
	ldr r0, [r0, #8]
	cmp r0, r1
	ble _0200B964
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0200B94C
	ldrh r0, [r5, #0x18]
	adds r2, r0, #1
	strh r2, [r5, #0x18]
	movs r0, #0x1a
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0200B956
	strh r2, [r5, #0x1a]
	ldr r0, _0200B8BC @ =gUnknown_030053A4
	ldr r0, [r0]
	ldr r1, [r5, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xe1
	lsls r0, r0, #3
	cmp r7, r0
	bls _0200B8C0
	movs r1, #5
	b _0200B8CC
	.align 2, 0
_0200B8B8: .4byte gPlayer
_0200B8BC: .4byte gUnknown_030053A4
_0200B8C0:
	movs r0, #0x96
	lsls r0, r0, #3
	movs r1, #0xf
	cmp r7, r0
	bls _0200B8CC
	movs r1, #0xa
_0200B8CC:
	ldr r2, _0200B934 @ =gRingCount
	ldrh r6, [r2]
	adds r0, r1, r6
	strh r0, [r2]
	ldr r0, _0200B938 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0200B90A
	ldrh r0, [r2]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0200B90A
	ldr r0, _0200B93C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200B90A
	ldr r1, _0200B940 @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _0200B90A
	adds r0, #1
	strb r0, [r1]
_0200B90A:
	ldr r0, _0200B93C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200B91E
	ldr r1, _0200B934 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0200B91E
	movs r0, #0xff
	strh r0, [r1]
_0200B91E:
	movs r0, #4
	bl m4aSongNumStart
	bl sub_0200BAB8
	ldr r0, _0200B944 @ =gUnknown_030053A4
	ldr r0, [r0]
	str r0, [r5, #0x14]
	ldr r0, _0200B948 @ =gUnknown_03005B6C
	str r7, [r0]
	b _0200B956
	.align 2, 0
_0200B934: .4byte gRingCount
_0200B938: .4byte gCurrentLevel
_0200B93C: .4byte gGameMode
_0200B940: .4byte gNumLives
_0200B944: .4byte gUnknown_030053A4
_0200B948: .4byte gUnknown_03005B6C
_0200B94C:
	movs r0, #1
	str r0, [r5, #0x1c]
	ldr r0, _0200B95C @ =gUnknown_030053A4
	ldr r0, [r0]
	str r0, [r5, #0x14]
_0200B956:
	ldr r0, _0200B960 @ =gPlayer
	ldr r0, [r0, #8]
	b _0200B992
	.align 2, 0
_0200B95C: .4byte gUnknown_030053A4
_0200B960: .4byte gPlayer
_0200B964:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	ble _0200B994
	ldr r3, _0200B9A4 @ =gPlayer
	movs r1, #8
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	bge _0200B994
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0200B990
	ldrh r0, [r5, #0x18]
	subs r0, #1
	strh r0, [r5, #0x18]
_0200B990:
	ldr r0, [r3, #8]
_0200B992:
	str r0, [r5, #0x20]
_0200B994:
	ldr r0, _0200B9A8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0200B9AC @ =sub_0200BB44
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B9A4: .4byte gPlayer
_0200B9A8: .4byte gCurTask
_0200B9AC: .4byte sub_0200BB44

	thumb_func_start sub_0200B9B0
sub_0200B9B0: @ 0x0200B9B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _0200BA14 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0200BA18 @ =gPlayer
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r4, #8
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0200BA1C
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r1, r0
	bgt _0200BA1C
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0200BA1C
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r1, r0
	bgt _0200BA1C
	movs r0, #1
	b _0200BA1E
	.align 2, 0
_0200BA14: .4byte gCamera
_0200BA18: .4byte gPlayer
_0200BA1C:
	movs r0, #0
_0200BA1E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0200BA24
sub_0200BA24: @ 0x0200BA24
	push {r4, lr}
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0200BAA6
	ldr r0, _0200BA4C @ =gPlayer
	ldr r2, [r0, #8]
	ldr r1, _0200BA50 @ =0x0000EFFF
	adds r3, r0, #0
	cmp r2, r1
	bgt _0200BA58
	ldr r1, [r3, #0xc]
	ldr r0, _0200BA54 @ =0x00011FFF
	cmp r1, r0
	bgt _0200BA58
	movs r2, #0xb4
	lsls r2, r2, #0xb
	movs r4, #0xd8
	lsls r4, r4, #0xa
	b _0200BA70
	.align 2, 0
_0200BA4C: .4byte gPlayer
_0200BA50: .4byte 0x0000EFFF
_0200BA54: .4byte 0x00011FFF
_0200BA58:
	ldr r1, [r3, #8]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r1, r0
	ble _0200BAA6
	ldr r1, [r3, #0xc]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _0200BAA6
	ldr r2, _0200BAAC @ =0xFFFA6000
	ldr r4, _0200BAB0 @ =0xFFFCA000
_0200BA70:
	ldr r0, [r3, #8]
	adds r0, r0, r2
	str r0, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r0, r0, r4
	str r0, [r3, #0xc]
	asrs r2, r2, #8
	asrs r4, r4, #8
	ldr r1, _0200BAB4 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r2
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r2
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
_0200BAA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BAAC: .4byte 0xFFFA6000
_0200BAB0: .4byte 0xFFFCA000
_0200BAB4: .4byte gCamera

	thumb_func_start sub_0200BAB8
sub_0200BAB8: @ 0x0200BAB8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0200BB28 @ =sub_0200BBA0
	ldr r2, _0200BB2C @ =0x00002010
	ldr r1, _0200BB30 @ =sub_0200BBE0
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r6, #0
	movs r1, #0
	movs r0, #0x78
	strh r0, [r4, #0x30]
	movs r0, #0x40
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _0200BB34 @ =gUnknown_03000021
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0200BB38 @ =gUnknown_03000022
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0200BB3C @ =gUnknown_03000025
	adds r0, r5, r1
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	movs r0, #0x1a
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x70
	strh r0, [r4, #0xa]
	ldr r0, _0200BB40 @ =gUnknown_03000020
	adds r5, r5, r0
	strb r6, [r5]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200BB28: .4byte sub_0200BBA0
_0200BB2C: .4byte 0x00002010
_0200BB30: .4byte sub_0200BBE0
_0200BB34: .4byte gUnknown_03000021
_0200BB38: .4byte gUnknown_03000022
_0200BB3C: .4byte gUnknown_03000025
_0200BB40: .4byte gUnknown_03000020

	thumb_func_start sub_0200BB44
sub_0200BB44: @ 0x0200BB44
	push {r4, r5, lr}
	ldr r0, _0200BB74 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _0200BB78 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200BB62
	ldrh r0, [r4, #0x1a]
	strh r0, [r4, #0x18]
_0200BB62:
	adds r0, r4, #0
	bl sub_0200B9B0
	cmp r0, #0
	beq _0200BB7C
	adds r0, r4, #0
	bl sub_0200BB8C
	b _0200BB80
	.align 2, 0
_0200BB74: .4byte gCurTask
_0200BB78: .4byte gPlayer
_0200BB7C:
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
_0200BB80:
	adds r0, r4, #0
	bl sub_0200BA24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0200BB8C
sub_0200BB8C: @ 0x0200BB8C
	ldr r0, _0200BB98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0200BB9C @ =sub_0200BBF4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0200BB98: .4byte gCurTask
_0200BB9C: .4byte sub_0200BBF4

	thumb_func_start sub_0200BBA0
sub_0200BBA0: @ 0x0200BBA0
	push {lr}
	ldr r0, _0200BBC4 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	ldr r1, _0200BBC8 @ =0xFFFF0000
	cmp r0, r1
	bne _0200BBCC
	adds r0, r3, #0
	bl TaskDestroy
	b _0200BBDA
	.align 2, 0
_0200BBC4: .4byte gCurTask
_0200BBC8: .4byte 0xFFFF0000
_0200BBCC:
	movs r0, #0x78
	strh r0, [r2, #0x16]
	movs r0, #0x30
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl DisplaySprite
_0200BBDA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200BBE0
sub_0200BBE0: @ 0x0200BBE0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_0200BBF4
sub_0200BBF4: @ 0x0200BBF4
	push {r4, lr}
	ldr r0, _0200BC18 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_0200B9B0
	cmp r0, #0
	bne _0200BC12
	adds r0, r4, #0
	bl sub_0200B860
_0200BC12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BC18: .4byte gCurTask

	thumb_func_start CreateDustCloud
CreateDustCloud: @ 0x0200BC1C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0200BCA0 @ =sub_0200BCB8
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	movs r6, #0
	str r6, [sp]
	movs r1, #0x30
	mov r2, sb
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r3, #0
	mov r8, r3
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0200BCA4 @ =0x06013240
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	movs r0, #0x6c
	strh r0, [r1, #0xa]
	ldr r3, _0200BCA8 @ =gUnknown_03000020
	adds r0, r2, r3
	mov r3, r8
	strb r3, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0200BCAC @ =gUnknown_03000021
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _0200BCB0 @ =gUnknown_03000022
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _0200BCB4 @ =gUnknown_03000025
	adds r2, r2, r3
	mov r0, r8
	strb r0, [r2]
	mov r3, sb
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200BCA0: .4byte sub_0200BCB8
_0200BCA4: .4byte 0x06013240
_0200BCA8: .4byte gUnknown_03000020
_0200BCAC: .4byte gUnknown_03000021
_0200BCB0: .4byte gUnknown_03000022
_0200BCB4: .4byte gUnknown_03000025

	thumb_func_start sub_0200BCB8
sub_0200BCB8: @ 0x0200BCB8
	push {r4, r5, r6, r7, lr}
	ldr r7, _0200BD04 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x16]
	adds r5, r0, #0
	ldrh r6, [r4, #0x18]
	ldr r1, _0200BD08 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _0200BCF2
	adds r0, r4, #0
	bl DisplaySprite
	ldr r0, [r7]
	bl TaskDestroy
_0200BCF2:
	adds r0, r4, #0
	bl DisplaySprite
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BD04: .4byte gCurTask
_0200BD08: .4byte gCamera

	thumb_func_start sub_0200BD0C
sub_0200BD0C: @ 0x0200BD0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0200BDC0 @ =gSpecialRingCount
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0200BE1E
	ldr r0, _0200BDC4 @ =sub_0200BE3C
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r4, #0
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0200BDC8 @ =gUnknown_03000031
	adds r0, r3, r2
	strb r4, [r0]
	movs r5, #0
	strh r6, [r1, #0x16]
	strh r7, [r1, #0x18]
	ldr r0, _0200BDCC @ =0x06013040
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	movs r0, #0x6b
	strh r0, [r1, #0xa]
	subs r2, #0x11
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0200BDD0 @ =gUnknown_03000021
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0200BDD4 @ =gUnknown_03000022
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0200BDD8 @ =gUnknown_03000025
	adds r0, r3, r2
	strb r5, [r0]
	mov r0, r8
	str r0, [r1, #0x10]
	ldr r0, _0200BDDC @ =gRingCount
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r1, _0200BDE0 @ =gUnknown_03000030
	adds r3, r3, r1
	strb r0, [r3]
	cmp r0, #0
	beq _0200BDF0
	ldr r4, _0200BDE4 @ =0x0201F2F0
	ldr r1, _0200BDE8 @ =gUnknown_0201C7C0
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0200BDEC @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	b _0200BE16
	.align 2, 0
_0200BDC0: .4byte gSpecialRingCount
_0200BDC4: .4byte sub_0200BE3C
_0200BDC8: .4byte gUnknown_03000031
_0200BDCC: .4byte 0x06013040
_0200BDD0: .4byte gUnknown_03000021
_0200BDD4: .4byte gUnknown_03000022
_0200BDD8: .4byte gUnknown_03000025
_0200BDDC: .4byte gRingCount
_0200BDE0: .4byte gUnknown_03000030
_0200BDE4: .4byte 0x0201F2F0
_0200BDE8: .4byte gUnknown_0201C7C0
_0200BDEC: .4byte 0x0000FFFF
_0200BDF0:
	ldr r4, _0200BE2C @ =0x0201F2B0
	ldr r1, _0200BE30 @ =gUnknown_0201C7C0
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0200BE34 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl m4aMPlayPanpotControl
_0200BE16:
	ldr r1, _0200BE38 @ =gSpecialRingCount
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0200BE1E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BE2C: .4byte 0x0201F2B0
_0200BE30: .4byte gUnknown_0201C7C0
_0200BE34: .4byte 0x0000FFFF
_0200BE38: .4byte gSpecialRingCount

	thumb_func_start sub_0200BE3C
sub_0200BE3C: @ 0x0200BE3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0200BE9C @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r5, r4, #0
	ldrh r0, [r4, #0x16]
	adds r6, r0, #0
	ldrh r7, [r4, #0x18]
	ldr r1, _0200BEA0 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _0200BE88
	adds r0, r4, #0
	bl DisplaySprite
	ldr r0, _0200BEA4 @ =gSpecialRingCount
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	bl TaskDestroy
_0200BE88:
	adds r0, r5, #0
	bl DisplaySprite
	strh r6, [r5, #0x16]
	strh r7, [r5, #0x18]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BE9C: .4byte gCurTask
_0200BEA0: .4byte gCamera
_0200BEA4: .4byte gSpecialRingCount

	thumb_func_start sub_0200BEA8
sub_0200BEA8: @ 0x0200BEA8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0200BEE4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200BF3C
	ldr r0, _0200BEE8 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200BF3C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200BED0
	ldr r0, _0200BEEC @ =gUnknown_03005428
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200BF3C
_0200BED0:
	cmp r1, #0x1d
	beq _0200BF3C
	ldr r5, _0200BEF0 @ =gUnknown_03005548
	ldr r4, [r5]
	cmp r4, #0
	beq _0200BEF4
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r4, #2]
	b _0200BF3C
	.align 2, 0
_0200BEE4: .4byte gGameMode
_0200BEE8: .4byte gCurrentLevel
_0200BEEC: .4byte gUnknown_03005428
_0200BEF0: .4byte gUnknown_03005548
_0200BEF4:
	ldr r0, _0200BF44 @ =sub_0200BF54
	movs r2, #0xe0
	lsls r2, r2, #8
	ldr r1, _0200BF48 @ =sub_0200BFFC
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [r5]
	strh r4, [r0]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0200BF4C @ =gMosaicReg
	strh r4, [r0]
	ldr r1, _0200BF50 @ =gBgCntRegs
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0200BF3C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200BF44: .4byte sub_0200BF54
_0200BF48: .4byte sub_0200BFFC
_0200BF4C: .4byte gMosaicReg
_0200BF50: .4byte gBgCntRegs

	thumb_func_start sub_0200BF54
sub_0200BF54: @ 0x0200BF54
	push {r4, lr}
	ldr r0, _0200BF90 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r4, r0, #0
	cmp r4, #0
	beq _0200BF9A
	ldrh r2, [r1, #6]
	cmp r2, #0xe
	bhi _0200BF94
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0200BFBC
	adds r0, r2, #1
	strh r0, [r1, #6]
	movs r0, #0
	strh r0, [r1, #4]
	b _0200BFBC
	.align 2, 0
_0200BF90: .4byte gCurTask
_0200BF94:
	subs r0, #1
	strh r0, [r1, #2]
	b _0200BFBC
_0200BF9A:
	ldrh r2, [r1, #6]
	cmp r2, #0
	bne _0200BFA8
	adds r0, r3, #0
	bl TaskDestroy
	b _0200BFEE
_0200BFA8:
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0200BFBC
	subs r0, r2, #1
	strh r0, [r1, #6]
	strh r4, [r1, #4]
_0200BFBC:
	ldrh r1, [r1, #6]
	movs r0, #0xf
	ands r0, r1
	ldr r3, _0200BFF4 @ =gMosaicReg
	lsls r1, r0, #0xc
	lsls r2, r0, #8
	orrs r1, r2
	lsls r2, r0, #4
	orrs r1, r2
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0200BFF8 @ =gBgCntRegs
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0200BFEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BFF4: .4byte gMosaicReg
_0200BFF8: .4byte gBgCntRegs

	thumb_func_start sub_0200BFFC
sub_0200BFFC: @ 0x0200BFFC
	push {r4, lr}
	ldr r0, _0200C030 @ =gUnknown_03005548
	movs r4, #0
	str r4, [r0]
	ldr r2, _0200C034 @ =gBgCntRegs
	ldrh r3, [r2]
	ldr r1, _0200C038 @ =0x0000FFBF
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2, #2]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #2]
	ldrh r3, [r2, #4]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	ands r1, r0
	strh r1, [r2, #6]
	ldr r0, _0200C03C @ =gMosaicReg
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200C030: .4byte gUnknown_03005548
_0200C034: .4byte gBgCntRegs
_0200C038: .4byte 0x0000FFBF
_0200C03C: .4byte gMosaicReg

	thumb_func_start InitCamera
InitCamera: @ 0x0200C040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r7, _0200C220 @ =gCamera
	lsls r0, r0, #2
	str r0, [sp, #4]
	ldr r6, _0200C224 @ =gUnknown_02015C4C
	adds r6, r0, r6
	ldr r1, _0200C228 @ =gDispCnt
	movs r2, #0xf9
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _0200C22C @ =gBgCntRegs
	movs r0, #0
	mov sb, r0
	ldr r0, _0200C230 @ =0x00001E01
	strh r0, [r3, #2]
	ldr r0, _0200C234 @ =0x00001F02
	strh r0, [r3, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x1f
	asrs r1, r1, #6
	movs r0, #1
	ldrsb r0, [r6, r0]
	adds r0, #0x1f
	asrs r0, r0, #6
	lsls r0, r0, #1
	orrs r1, r0
	lsls r1, r1, #0xe
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #8
	movs r2, #3
	orrs r0, r2
	orrs r1, r0
	movs r0, #2
	ldrsb r0, [r6, r0]
	lsls r0, r0, #2
	orrs r1, r0
	strh r1, [r3, #6]
	ldr r1, _0200C238 @ =gUnknown_03005550
	mov sl, r1
	ldr r5, _0200C23C @ =gUnknown_02015B44
	mov r0, sl
	adds r0, #0x40
	adds r1, r5, #0
	movs r2, #0x40
	bl memcpy
	mov r2, r8
	lsls r4, r2, #1
	add r4, r8
	mov r0, sl
	adds r0, #0x5c
	strh r4, [r0]
	adds r0, #0x24
	adds r1, r5, #0
	adds r1, #0x40
	movs r2, #0x40
	bl memcpy
	adds r1, r4, #1
	mov r0, sl
	adds r0, #0x9c
	strh r1, [r0]
	adds r0, #0x24
	adds r5, #0x80
	adds r1, r5, #0
	movs r2, #0x40
	bl memcpy
	adds r4, #2
	mov r0, sl
	adds r0, #0xdc
	strh r4, [r0]
	mov r2, sl
	adds r2, #0xc4
	movs r0, #2
	ldrsb r0, [r6, r0]
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2]
	adds r2, #8
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #0xb
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0
	ldrsb r0, [r6, r0]
	mov r1, sl
	adds r1, #0xe6
	strh r0, [r1]
	movs r1, #1
	ldrsb r1, [r6, r1]
	mov r0, sl
	adds r0, #0xe8
	strh r1, [r0]
	ldr r3, _0200C240 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r3, #1]
	ldr r0, _0200C244 @ =gUnknown_03002280
	movs r1, #0
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	movs r1, #0xff
	strb r1, [r0, #6]
	movs r2, #0x20
	strb r2, [r0, #7]
	movs r1, #0
	strb r1, [r3, #2]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	mov r1, sl
	adds r1, #0x6e
	ldrh r0, [r1]
	movs r3, #0x82
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x40
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r2, _0200C248 @ =gUnknown_030056B8
	ldr r0, _0200C24C @ =0x02033004
	ldr r1, [r0]
	str r1, [r2]
	mov r0, sb
	str r0, [r7, #0x28]
	ldr r0, [r1, #0x20]
	str r0, [r7, #0x2c]
	mov r2, sb
	str r2, [r7, #0x30]
	ldr r0, [r1, #0x1c]
	str r0, [r7, #0x34]
	ldr r3, _0200C250 @ =gPlayer
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	subs r1, #0x78
	str r1, [r7]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, #0x54
	str r0, [r7, #4]
	cmp r1, #0
	bge _0200C182
	str r2, [r7]
_0200C182:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0200C18C
	mov r0, sb
	str r0, [r7, #4]
_0200C18C:
	ldr r0, [r7]
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	str r0, [r7, #0x14]
	ldr r1, _0200C250 @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	subs r0, #4
	adds r1, r7, #0
	adds r1, #0x64
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #8]
	movs r0, #0xc
	str r0, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x56
	mov r2, sb
	strh r2, [r0]
	mov r3, sb
	str r3, [r7, #0x18]
	str r3, [r7, #0x1c]
	str r3, [r7, #0x20]
	str r3, [r7, #0x24]
	subs r0, #0x16
	strh r3, [r0]
	movs r0, #8
	str r0, [r7, #0x44]
	str r3, [r7, #0x48]
	str r3, [r7, #0x4c]
	adds r0, r7, #0
	adds r0, #0x50
	mov r1, sb
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _0200C254 @ =sub_0200C5C4
	movs r2, #0xf0
	lsls r2, r2, #4
	ldr r1, _0200C258 @ =sub_0200C58C
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r0, [r7, #0x5c]
	ldr r0, _0200C25C @ =gUnknown_02015C48
	ldr r2, [sp, #4]
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r7, #0x58]
	ldr r0, _0200C260 @ =gUnknown_02015C44
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _0200C20E
	bl _call_via_r0
_0200C20E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200C220: .4byte gCamera
_0200C224: .4byte gUnknown_02015C4C
_0200C228: .4byte gDispCnt
_0200C22C: .4byte gBgCntRegs
_0200C230: .4byte 0x00001E01
_0200C234: .4byte 0x00001F02
_0200C238: .4byte gUnknown_03005550
_0200C23C: .4byte gUnknown_02015B44
_0200C240: .4byte gUnknown_03004D80
_0200C244: .4byte gUnknown_03002280
_0200C248: .4byte gUnknown_030056B8
_0200C24C: .4byte 0x02033004
_0200C250: .4byte gPlayer
_0200C254: .4byte sub_0200C5C4
_0200C258: .4byte sub_0200C58C
_0200C25C: .4byte gUnknown_02015C48
_0200C260: .4byte gUnknown_02015C44

	thumb_func_start sub_0200C264
sub_0200C264: @ 0x0200C264
	push {r4, r5, r6, r7, lr}
	ldr r0, _0200C2B4 @ =gPlayer
	mov ip, r0
	ldr r5, _0200C2B8 @ =gCamera
	ldr r6, [r5]
	ldr r7, [r5, #4]
	str r6, [r5, #0x38]
	str r7, [r5, #0x3c]
	ldr r0, [r5, #0x30]
	cmp r6, r0
	blt _0200C288
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf1
	adds r0, r6, #0
	cmp r0, r1
	ble _0200C288
	adds r0, r1, #0
_0200C288:
	adds r6, r0, #0
	ldr r0, [r5, #0x28]
	cmp r7, r0
	blt _0200C29A
	ldr r0, [r5, #0x2c]
	subs r0, #0xa1
	adds r1, r7, #0
	cmp r1, r0
	ble _0200C29C
_0200C29A:
	adds r1, r0, #0
_0200C29C:
	adds r7, r1, #0
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0200C2BC
	subs r0, r2, #1
	strh r0, [r1]
	b _0200C356
	.align 2, 0
_0200C2B4: .4byte gPlayer
_0200C2B8: .4byte gCamera
_0200C2BC:
	adds r4, r5, #0
	adds r4, #0x50
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200C2FA
	mov r0, ip
	ldrh r1, [r0, #0x10]
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	ldr r2, [r5, #0x18]
	adds r0, r0, r2
	subs r0, #0x78
	str r0, [r5, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r3, r5, #0
	adds r3, #0x56
	movs r0, #0
	ldrsh r2, [r3, r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	adds r1, r1, r0
	asrs r1, r1, #4
	strh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0x10]
_0200C2FA:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0200C356
	adds r2, r5, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r4, [r2, r1]
	mov r3, ip
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	subs r3, r0, #4
	ldr r0, _0200C334 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200C322
	rsbs r3, r3, #0
_0200C322:
	cmp r4, r3
	beq _0200C342
	cmp r4, r3
	bge _0200C338
	adds r4, #5
	cmp r4, r3
	ble _0200C340
	b _0200C33E
	.align 2, 0
_0200C334: .4byte gStageFlags
_0200C338:
	subs r4, #5
	cmp r4, r3
	bge _0200C340
_0200C33E:
	adds r4, r3, #0
_0200C340:
	strh r4, [r2]
_0200C342:
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #0x1c]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	subs r1, #0x50
	adds r0, r0, r1
	adds r0, r0, r4
	str r0, [r5, #0x14]
_0200C356:
	ldr r0, [r5, #0x10]
	subs r1, r0, r6
	ldr r0, [r5, #0x44]
	cmp r1, r0
	ble _0200C372
	subs r2, r1, r0
	ldr r0, [r5, #8]
	asrs r1, r0, #8
	adds r3, r0, #0
	cmp r1, r2
	ble _0200C36E
	adds r1, r2, #0
_0200C36E:
	adds r6, r6, r1
	b _0200C386
_0200C372:
	ldr r3, [r5, #8]
	cmn r1, r0
	bge _0200C386
	adds r1, r1, r0
	asrs r0, r3, #8
	rsbs r0, r0, #0
	cmp r0, r1
	bge _0200C384
	adds r0, r1, #0
_0200C384:
	adds r6, r6, r0
_0200C386:
	ldr r4, [r5, #0x30]
	cmp r6, r4
	bge _0200C390
	adds r0, r4, #0
	b _0200C39E
_0200C390:
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf0
	adds r0, r6, #0
	cmp r0, r1
	ble _0200C39E
	adds r0, r1, #0
_0200C39E:
	adds r6, r0, #0
	ldr r0, _0200C3E4 @ =0x00000FFF
	cmp r3, r0
	bgt _0200C3AC
	adds r0, r3, #0
	adds r0, #0x20
	str r0, [r5, #8]
_0200C3AC:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200C3E8
	mov r0, ip
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0200C3D4
	mov r0, ip
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _0200C3E8
_0200C3D4:
	ldr r0, [r5, #0x48]
	adds r0, #4
	str r0, [r5, #0x48]
	cmp r0, #0x18
	ble _0200C3F4
	movs r0, #0x18
	b _0200C3F4
	.align 2, 0
_0200C3E4: .4byte 0x00000FFF
_0200C3E8:
	ldr r0, [r5, #0x48]
	subs r0, #4
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _0200C3F4
	movs r0, #0
_0200C3F4:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x14]
	subs r1, r0, r7
	ldr r0, [r5, #0x48]
	cmp r1, r0
	ble _0200C40E
	subs r0, r1, r0
	ldr r1, [r5, #0xc]
	cmp r1, r0
	ble _0200C40A
	adds r1, r0, #0
_0200C40A:
	adds r7, r7, r1
	b _0200C420
_0200C40E:
	cmn r1, r0
	bge _0200C420
	adds r1, r1, r0
	ldr r0, [r5, #0xc]
	rsbs r0, r0, #0
	cmp r0, r1
	bge _0200C41E
	adds r0, r1, #0
_0200C41E:
	adds r7, r7, r0
_0200C420:
	ldr r2, [r5, #0x28]
	cmp r7, r2
	bge _0200C42A
	adds r1, r2, #0
	b _0200C436
_0200C42A:
	ldr r0, [r5, #0x2c]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0200C436
	adds r1, r0, #0
_0200C436:
	adds r7, r1, #0
	cmp r6, r4
	bge _0200C440
	adds r0, r4, #0
	b _0200C44E
_0200C440:
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf0
	adds r0, r6, #0
	cmp r0, r1
	ble _0200C44E
	adds r0, r1, #0
_0200C44E:
	adds r6, r0, #0
	cmp r7, r2
	bge _0200C458
	adds r1, r2, #0
	b _0200C464
_0200C458:
	ldr r0, [r5, #0x2c]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0200C464
	adds r1, r0, #0
_0200C464:
	adds r0, r5, #0
	adds r0, #0x60
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r6, r6, r0
	adds r0, r5, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r1, r0
	str r6, [r5]
	str r7, [r5, #4]
	ldr r0, [r5, #0x38]
	subs r0, r0, r6
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x3c]
	subs r0, r0, r7
	str r0, [r5, #0x3c]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0200C4A4
	ldr r2, [r5, #0x58]
	cmp r2, #0
	beq _0200C49E
	adds r0, r6, #0
	adds r1, r7, #0
	bl _call_via_r2
_0200C49E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200C4A4
sub_0200C4A4: @ 0x0200C4A4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sb, r0
	mov sl, r1
	ldr r4, _0200C500 @ =gUnknown_03005590
	ldr r0, _0200C504 @ =gBgScrollRegs
	mov r8, r0
	movs r0, #7
	mov r6, sb
	ands r6, r0
	mov r1, r8
	strh r6, [r1, #4]
	mov r5, sl
	ands r5, r0
	strh r5, [r1, #6]
	mov r0, sb
	strh r0, [r4, #0x30]
	mov r1, sl
	strh r1, [r4, #0x32]
	adds r0, r4, #0
	bl DrawBackground
	adds r0, r4, #0
	bl UpdateBgAnimationTiles
	adds r4, #0x40
	mov r0, r8
	strh r6, [r0, #8]
	strh r5, [r0, #0xa]
	mov r1, sb
	strh r1, [r4, #0x30]
	mov r0, sl
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl DrawBackground
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200C500: .4byte gUnknown_03005590
_0200C504: .4byte gBgScrollRegs

	thumb_func_start sub_0200C508
sub_0200C508: @ 0x0200C508
	push {r4, r5, lr}
	ldr r4, _0200C554 @ =gUnknown_03005550
	ldr r2, _0200C558 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0200C55C @ =gBgCntRegs
	movs r5, #0
	ldr r0, _0200C560 @ =0x00001B0F
	strh r0, [r1]
	ldr r1, _0200C564 @ =gUnknown_02015B44
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #2
	strh r0, [r4, #0x1c]
	ldr r0, _0200C568 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0200C56C @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	movs r0, #0x1e
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl DrawBackground
	ldr r0, _0200C570 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200C554: .4byte gUnknown_03005550
_0200C558: .4byte gDispCnt
_0200C55C: .4byte gBgCntRegs
_0200C560: .4byte 0x00001B0F
_0200C564: .4byte gUnknown_02015B44
_0200C568: .4byte 0x0600C000
_0200C56C: .4byte 0x0600D800
_0200C570: .4byte gBgScrollRegs

	thumb_func_start sub_0200C574
sub_0200C574: @ 0x0200C574
	push {r4, lr}
	ldr r4, _0200C588 @ =gCamera
	ldr r0, [r4, #0x5c]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200C588: .4byte gCamera

	thumb_func_start sub_0200C58C
sub_0200C58C: @ 0x0200C58C
	push {lr}
	ldr r1, _0200C5B8 @ =gCamera
	movs r0, #0
	str r0, [r1, #0x5c]
	ldr r3, _0200C5BC @ =gFlags
	movs r2, #0
	ldr r0, _0200C5C0 @ =gBgScrollRegs
	movs r1, #3
_0200C59C:
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0200C59C
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_0200C5B8: .4byte gCamera
_0200C5BC: .4byte gFlags
_0200C5C0: .4byte gBgScrollRegs

	thumb_func_start sub_0200C5C4
sub_0200C5C4: @ 0x0200C5C4
	push {lr}
	ldr r2, _0200C5F0 @ =gDispCnt
	ldrh r1, [r2]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0200C5F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200C5E2
	ldr r0, _0200C5F8 @ =0x0000DFFF
	ands r1, r0
	strh r1, [r2]
_0200C5E2:
	ldr r0, _0200C5FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0200C600 @ =sub_0200C604
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0200C5F0: .4byte gDispCnt
_0200C5F4: .4byte gGameMode
_0200C5F8: .4byte 0x0000DFFF
_0200C5FC: .4byte gCurTask
_0200C600: .4byte sub_0200C604

	thumb_func_start sub_0200C604
sub_0200C604: @ 0x0200C604
	push {lr}
	bl sub_0200C264
	ldr r1, _0200C614 @ =gUnknown_030054B8
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0200C614: .4byte gUnknown_030054B8

	thumb_func_start sub_0200C618
sub_0200C618: @ 0x0200C618
	bx lr
	.align 2, 0

	thumb_func_start sub_0200C61C
sub_0200C61C: @ 0x0200C61C
	push {lr}
	ldr r3, _0200C64C @ =gCamera
	ldr r0, _0200C650 @ =gStageTime
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200C646
	ldr r2, _0200C654 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0200C658 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0200C65C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r0, r1
	lsrs r0, r0, #0x10
	subs r0, #8
	str r0, [r3, #0x1c]
_0200C646:
	pop {r0}
	bx r0
	.align 2, 0
_0200C64C: .4byte gCamera
_0200C650: .4byte gStageTime
_0200C654: .4byte gPseudoRandom
_0200C658: .4byte 0x00196225
_0200C65C: .4byte 0x3C6EF35F

	thumb_func_start sub_0200C660
sub_0200C660: @ 0x0200C660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r7, [sp, #0x28]
	cmp r7, #0
	bne _0200C67C
	mov r7, sp
_0200C67C:
	mov r4, sp
	adds r4, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C756
	mov r1, r8
	adds r0, r6, r1
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C718
	mov r5, r8
	lsls r5, r5, #1
	adds r0, r6, r5
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C6D8
	mov r0, r8
	cmp r0, #0
	ble _0200C6D0
	movs r0, #7
	ands r0, r6
	movs r1, #0x18
	subs r0, r1, r0
	b _0200C840
_0200C6D0:
	movs r0, #7
	ands r0, r6
	adds r0, #0x11
	b _0200C840
_0200C6D8:
	cmp r1, #8
	bne _0200C6F8
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, r8
	cmp r1, #0
	ble _0200C6F0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0200C840
_0200C6F0:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0200C840
_0200C6F8:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C70E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0200C840
_0200C70E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0200C840
_0200C718:
	cmp r1, #8
	bne _0200C736
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0200C730
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0200C840
_0200C730:
	movs r0, #7
	ands r0, r6
	b _0200C840
_0200C736:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C74C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0200C840
_0200C74C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0200C840
_0200C756:
	cmp r1, #8
	bne _0200C828
	ldrb r0, [r4]
	strb r0, [r7]
	mov r0, r8
	rsbs r0, r0, #0
	str r0, [sp, #4]
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0200C7EE
	ldrb r0, [r4]
	strb r0, [r7]
	ldr r0, [sp, #4]
	mov r1, r8
	subs r0, r0, r1
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0200C7B0
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0200C7A8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x10
	b _0200C840
_0200C7A8:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0200C840
_0200C7B0:
	cmp r1, #0
	bne _0200C7CE
	mov r0, r8
	cmp r0, #0
	ble _0200C7C6
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200C840
_0200C7C6:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0200C840
_0200C7CE:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C7E4
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0200C840
_0200C7E4:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0200C840
_0200C7EE:
	cmp r1, #0
	bne _0200C808
	mov r1, r8
	cmp r1, #0
	ble _0200C800
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0200C840
_0200C800:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0200C840
_0200C808:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C81E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0200C840
_0200C81E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0200C840
_0200C828:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C83A
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0200C840
_0200C83A:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0200C840:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200C850
sub_0200C850: @ 0x0200C850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0200C86E
	mov r1, sp
	str r1, [sp, #0x24]
_0200C86E:
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r4, [sp, #0x28]
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0200C888
	b _0200CA5C
_0200C888:
	mov r7, r8
	adds r0, r6, r7
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0200C89E
	b _0200CA1A
_0200C89E:
	lsls r4, r7, #1
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	beq _0200C8B6
	b _0200C9D6
_0200C8B6:
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C992
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C94E
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C90A
	mov r0, r8
	cmp r0, #0
	ble _0200C902
	movs r0, #7
	ands r0, r6
	movs r1, #0x30
	subs r0, r1, r0
	b _0200CCB0
_0200C902:
	movs r0, #7
	ands r0, r6
	adds r0, #0x29
	b _0200CCB0
_0200C90A:
	cmp r1, #8
	bne _0200C92C
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	cmp r2, #0
	ble _0200C924
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x28
	b _0200CCB0
_0200C924:
	movs r0, #7
	ands r0, r6
	adds r0, #0x20
	b _0200CCB0
_0200C92C:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	cmp r1, #0
	ble _0200C944
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x28
	b _0200CCB0
_0200C944:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x28
	b _0200CCB0
_0200C94E:
	cmp r1, #8
	bne _0200C970
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	cmp r0, #0
	ble _0200C968
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x20
	b _0200CCB0
_0200C968:
	movs r0, #7
	ands r0, r6
	adds r0, #0x18
	b _0200CCB0
_0200C970:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200C988
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x20
	b _0200CCB0
_0200C988:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x20
	b _0200CCB0
_0200C992:
	cmp r1, #8
	bne _0200C9B4
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200C9AC
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x18
	b _0200CCB0
_0200C9AC:
	movs r0, #7
	ands r0, r6
	adds r0, #0x10
	b _0200CCB0
_0200C9B4:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200C9CC
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x18
	b _0200CCB0
_0200C9CC:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x18
	b _0200CCB0
_0200C9D6:
	cmp r1, #8
	bne _0200C9F8
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200C9F0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0200CCB0
_0200C9F0:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0200CCB0
_0200C9F8:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CA10
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0200CCB0
_0200CA10:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0200CCB0
_0200CA1A:
	cmp r1, #8
	bne _0200CA3A
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200CA34
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0200CCB0
_0200CA34:
	movs r0, #7
	ands r0, r6
	b _0200CCB0
_0200CA3A:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CA52
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0200CCB0
_0200CA52:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0200CCB0
_0200CA5C:
	cmp r1, #8
	beq _0200CA62
	b _0200CC96
_0200CA62:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	rsbs r4, r7, #0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0200CA82
	b _0200CC5A
_0200CA82:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0200CAA0
	b _0200CC34
_0200CAA0:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0200CAC0
	b _0200CBF4
_0200CAC0:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0200CBB4
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0200CB74
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0200CB34
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200CB2C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x28
	b _0200CCB0
_0200CB2C:
	movs r0, #7
	ands r0, r6
	subs r0, #0x30
	b _0200CCB0
_0200CB34:
	cmp r1, #0
	bne _0200CB52
	mov r0, r8
	cmp r0, #0
	ble _0200CB4A
	movs r0, #7
	ands r0, r6
	movs r1, #0x21
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CB4A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x28
	b _0200CCB0
_0200CB52:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CB6A
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x28
	b _0200CCB0
_0200CB6A:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x28
	b _0200CCB0
_0200CB74:
	cmp r1, #0
	bne _0200CB92
	mov r4, r8
	cmp r4, #0
	ble _0200CB8A
	movs r0, #7
	ands r0, r6
	movs r1, #0x19
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CB8A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x20
	b _0200CCB0
_0200CB92:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0200CBAA
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x20
	b _0200CCB0
_0200CBAA:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x20
	b _0200CCB0
_0200CBB4:
	cmp r1, #0
	bne _0200CBD2
	mov r0, r8
	cmp r0, #0
	ble _0200CBCA
	movs r0, #7
	ands r0, r6
	movs r1, #0x11
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CBCA:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0200CCB0
_0200CBD2:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CBEA
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x18
	b _0200CCB0
_0200CBEA:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x18
	b _0200CCB0
_0200CBF4:
	cmp r1, #0
	bne _0200CC12
	mov r4, r8
	cmp r4, #0
	ble _0200CC0A
_0200CBFE:
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CC0A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0200CCB0
_0200CC12:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0200CC2A
_0200CC1C:
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0200CCB0
_0200CC2A:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0200CCB0
_0200CC34:
	cmp r1, #0
	bne _0200CC46
	mov r0, r8
	cmp r0, #0
	bgt _0200CBFE
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0200CCB0
_0200CC46:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	bgt _0200CC1C
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0200CCB0
_0200CC5A:
	cmp r1, #0
	bne _0200CC74
	mov r4, r8
	cmp r4, #0
	ble _0200CC6C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0200CCB0
_0200CC6C:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0200CCB0
_0200CC74:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0200CC8C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0200CCB0
_0200CC8C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0200CCB0
_0200CC96:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CCAA
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0200CCB0
_0200CCAA:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0200CCB0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200CCC0
sub_0200CCC0: @ 0x0200CCC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	blt _0200CCE8
	ldr r0, _0200CCE4 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0200CCEA
	adds r0, r1, #0
	b _0200CCEA
	.align 2, 0
_0200CCE4: .4byte gUnknown_030056B8
_0200CCE8:
	movs r0, #0
_0200CCEA:
	adds r3, r0, #0
	cmp r4, #0
	blt _0200CD08
	ldr r0, _0200CD04 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r4, #0
	cmp r1, r0
	bls _0200CD0A
	adds r1, r0, #0
	b _0200CD0A
	.align 2, 0
_0200CD04: .4byte gUnknown_030056B8
_0200CD08:
	movs r1, #0
_0200CD0A:
	adds r4, r1, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r3, #0
	bl sub_0200D110
	adds r5, r0, #0
	ldr r3, _0200CDA0 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0200CD32
	subs r2, r6, r2
_0200CD32:
	ldr r0, _0200CDA4 @ =gUnknown_030056B8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #0xf
	ands r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0200CD54
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r2, r0
_0200CD54:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0200CD5E
	movs r2, #8
_0200CD5E:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0200CD80
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200CD80
	movs r2, #0
_0200CD80:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0200CDAC
	cmp r2, #8
	beq _0200CDA8
	cmp r2, #0
	beq _0200CDA8
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0200CDAA
	subs r0, #0x10
	b _0200CDAA
	.align 2, 0
_0200CDA0: .4byte 0x000003FF
_0200CDA4: .4byte gUnknown_030056B8
_0200CDA8:
	adds r0, r2, #0
_0200CDAA:
	adds r2, r0, #0
_0200CDAC:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200CDB8
sub_0200CDB8: @ 0x0200CDB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r4, #0
	blt _0200CDE0
	ldr r0, _0200CDDC @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0200CDE2
	adds r0, r1, #0
	b _0200CDE2
	.align 2, 0
_0200CDDC: .4byte gUnknown_030056B8
_0200CDE0:
	movs r0, #0
_0200CDE2:
	adds r4, r0, #0
	cmp r3, #0
	blt _0200CE00
	ldr r0, _0200CDFC @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0200CE02
	adds r0, r1, #0
	b _0200CE02
	.align 2, 0
_0200CDFC: .4byte gUnknown_030056B8
_0200CE00:
	movs r0, #0
_0200CE02:
	adds r3, r0, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_0200D110
	adds r5, r0, #0
	ldr r3, _0200CE88 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0200CE2C
	subs r2, r6, r2
_0200CE2C:
	ldr r0, _0200CE8C @ =gUnknown_030056B8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	asrs r2, r2, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0200CE48
	movs r2, #8
_0200CE48:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0200CE6A
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200CE6A
	movs r2, #0
_0200CE6A:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0200CE94
	cmp r2, #8
	beq _0200CE90
	cmp r2, #0
	beq _0200CE90
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0200CE92
	subs r0, #0x10
	b _0200CE92
	.align 2, 0
_0200CE88: .4byte 0x000003FF
_0200CE8C: .4byte gUnknown_030056B8
_0200CE90:
	adds r0, r2, #0
_0200CE92:
	adds r2, r0, #0
_0200CE94:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200CEA0
sub_0200CEA0: @ 0x0200CEA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r4, #0
	blt _0200CECC
	ldr r0, _0200CEC8 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0200CECE
	adds r0, r1, #0
	b _0200CECE
	.align 2, 0
_0200CEC8: .4byte gUnknown_030056B8
_0200CECC:
	movs r0, #0
_0200CECE:
	adds r4, r0, #0
	cmp r5, #0
	blt _0200CEEC
	ldr r0, _0200CEE8 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r5, #0
	cmp r1, r0
	bls _0200CEEE
	adds r1, r0, #0
	b _0200CEEE
	.align 2, 0
_0200CEE8: .4byte gUnknown_030056B8
_0200CEEC:
	movs r1, #0
_0200CEEE:
	adds r5, r1, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r4, #0
	bl sub_0200D110
	adds r4, r0, #0
	ldr r6, _0200CF88 @ =0x000003FF
	ands r6, r4
	movs r7, #7
	adds r3, r7, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200CF16
	subs r3, r7, r3
_0200CF16:
	ldr r2, _0200CF8C @ =gUnknown_030056B8
	ldr r5, [r2]
	lsls r0, r6, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r0, #0xf
	ands r3, r0
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0200CF38
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r3, r0
_0200CF38:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0200CF42
	movs r3, #8
_0200CF42:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200CF68
	lsrs r0, r6, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r7
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0200CF68
	movs r3, #0
_0200CF68:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200CF94
	cmp r3, #8
	beq _0200CF90
	cmp r3, #0
	beq _0200CF90
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0200CF92
	subs r0, #0x10
	b _0200CF92
	.align 2, 0
_0200CF88: .4byte 0x000003FF
_0200CF8C: .4byte gUnknown_030056B8
_0200CF90:
	adds r0, r3, #0
_0200CF92:
	adds r3, r0, #0
_0200CF94:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200CFB0
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0200CFB0:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200CFCA
	cmp r3, #0
	beq _0200CFC6
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0200CFC8
_0200CFC6:
	adds r0, r2, #0
_0200CFC8:
	adds r2, r0, #0
_0200CFCA:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200CFE0
sub_0200CFE0: @ 0x0200CFE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r5, #0
	blt _0200D00C
	ldr r0, _0200D008 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	bls _0200D00E
	adds r0, r1, #0
	b _0200D00E
	.align 2, 0
_0200D008: .4byte gUnknown_030056B8
_0200D00C:
	movs r0, #0
_0200D00E:
	adds r5, r0, #0
	cmp r4, #0
	blt _0200D02C
	ldr r0, _0200D028 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0200D02E
	adds r0, r1, #0
	b _0200D02E
	.align 2, 0
_0200D028: .4byte gUnknown_030056B8
_0200D02C:
	movs r0, #0
_0200D02E:
	adds r4, r0, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0200D110
	adds r4, r0, #0
	ldr r7, _0200D0B8 @ =0x000003FF
	ands r7, r4
	movs r6, #7
	adds r3, r6, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200D058
	subs r3, r6, r3
_0200D058:
	ldr r2, _0200D0BC @ =gUnknown_030056B8
	ldr r5, [r2]
	lsls r0, r7, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	asrs r3, r3, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0200D074
	movs r3, #8
_0200D074:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200D09A
	lsrs r0, r7, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r6
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0200D09A
	movs r3, #0
_0200D09A:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200D0C4
	cmp r3, #8
	beq _0200D0C0
	cmp r3, #0
	beq _0200D0C0
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0200D0C2
	subs r0, #0x10
	b _0200D0C2
	.align 2, 0
_0200D0B8: .4byte 0x000003FF
_0200D0BC: .4byte gUnknown_030056B8
_0200D0C0:
	adds r0, r3, #0
_0200D0C2:
	adds r3, r0, #0
_0200D0C4:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r7
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200D0DC
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0200D0DC:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200D0FA
	cmp r3, #0
	beq _0200D0F6
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0200D0F8
_0200D0F6:
	adds r0, r2, #0
_0200D0F8:
	adds r2, r0, #0
_0200D0FA:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D110
sub_0200D110: @ 0x0200D110
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	mov sb, r2
	asrs r4, r0, #3
	ldr r5, _0200D12C @ =gUnknown_03000400
	ldr r0, [r5]
	cmp r0, r4
	bne _0200D130
	ldr r7, [r5, #8]
	ldr r0, [r5, #4]
	b _0200D148
	.align 2, 0
_0200D12C: .4byte gUnknown_03000400
_0200D130:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	str r4, [r5]
	str r0, [r5, #4]
	str r1, [r5, #8]
	adds r7, r1, #0
_0200D148:
	mov r8, r0
	asrs r4, r6, #3
	ldr r6, _0200D15C @ =gUnknown_03000410
	ldr r0, [r6]
	cmp r0, r4
	bne _0200D160
	ldr r5, [r6, #8]
	ldr r3, [r6, #4]
	b _0200D17A
	.align 2, 0
_0200D15C: .4byte gUnknown_03000410
_0200D160:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	adds r3, r0, #0
	str r4, [r6]
	str r3, [r6, #4]
	str r1, [r6, #8]
	adds r5, r1, #0
_0200D17A:
	ldr r0, _0200D1BC @ =gUnknown_030056B8
	ldr r4, [r0]
	mov r1, sb
	lsls r0, r1, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r1, r1, r0
	ldrh r0, [r4, #0x18]
	muls r0, r3, r0
	add r0, r8
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r1, r5, #3
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r3, r2, #8
	lsls r2, r2, #5
	lsls r1, r1, #1
	ldr r0, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200D1BC: .4byte gUnknown_030056B8

	thumb_func_start sub_0200D1C0
sub_0200D1C0: @ 0x0200D1C0
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	ldr r0, _0200D1E8 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _0200D1EC @ =gUnknown_03000400
	str r1, [r0, #4]
	ldr r2, _0200D1F0 @ =0x85000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _0200D1F4 @ =gUnknown_03000410
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0200D1E8: .4byte 0x040000D4
_0200D1EC: .4byte gUnknown_03000400
_0200D1F0: .4byte 0x85000003
_0200D1F4: .4byte gUnknown_03000410

	thumb_func_start sub_0200D1F8
sub_0200D1F8: @ 0x0200D1F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r3
	ldr r6, [sp, #0x1c]
	cmp r6, #0
	bne _0200D20C
	mov r6, sp
_0200D20C:
	mov r4, sp
	adds r4, #1
	adds r0, r5, #0
	adds r3, r4, #0
	ldr r7, [sp, #0x20]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0200D238
	mov r0, r8
	cmp r0, #0
	ble _0200D230
	movs r0, #7
	ands r0, r5
	movs r1, #8
	subs r0, r1, r0
	b _0200D26E
_0200D230:
	movs r0, #7
	ands r0, r5
	adds r0, #1
	b _0200D26E
_0200D238:
	cmp r1, #8
	bne _0200D256
	ldrb r0, [r4]
	strb r0, [r6]
	mov r7, r8
	cmp r7, #0
	ble _0200D24E
	movs r0, #7
	ands r0, r5
	mvns r0, r0
	b _0200D26E
_0200D24E:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r5
	b _0200D26E
_0200D256:
	ldrb r0, [r4]
	strb r0, [r6]
	cmp r1, #0
	ble _0200D268
	subs r1, #1
	movs r0, #7
	ands r0, r5
	subs r0, r1, r0
	b _0200D26E
_0200D268:
	movs r0, #7
	ands r0, r5
	adds r0, r1, r0
_0200D26E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D27C
sub_0200D27C: @ 0x0200D27C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r3, [sp, #0xc]
	bl _call_via_r3
	adds r1, r0, #0
	cmp r1, #0
	bne _0200D2A4
	cmp r5, #0
	ble _0200D29C
	movs r0, #7
	ands r0, r4
	movs r1, #8
	subs r0, r1, r0
	b _0200D2D0
_0200D29C:
	movs r0, #7
	ands r0, r4
	adds r0, #1
	b _0200D2D0
_0200D2A4:
	cmp r1, #8
	bne _0200D2BC
	cmp r5, #0
	ble _0200D2B4
	movs r0, #7
	ands r0, r4
	mvns r0, r0
	b _0200D2D0
_0200D2B4:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r4
	b _0200D2D0
_0200D2BC:
	cmp r1, #0
	ble _0200D2CA
	subs r1, #1
	movs r0, #7
	ands r0, r4
	subs r0, r1, r0
	b _0200D2D0
_0200D2CA:
	movs r0, #7
	ands r0, r4
	adds r0, r1, r0
_0200D2D0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D2D8
sub_0200D2D8: @ 0x0200D2D8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, #0x60
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r6, #0
	adds r4, #0xc
	cmp r7, #0
	bne _0200D2F4
	ldr r0, _0200D2F0 @ =0x06010000
	b _0200D2FA
	.align 2, 0
_0200D2F0: .4byte 0x06010000
_0200D2F4:
	movs r0, #0x40
	bl VramMalloc
_0200D2FA:
	str r0, [r4, #4]
	movs r2, #0
	strh r2, [r4, #8]
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r7, #0
	adds r0, #0x10
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0200D34C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200D354
	ldr r0, _0200D350 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #3
	b _0200D35A
	.align 2, 0
_0200D34C: .4byte gGameMode
_0200D350: .4byte 0x04000128
_0200D354:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_0200D35A:
	strb r0, [r1]
	ldr r0, _0200D380 @ =0x000C2020
	orrs r0, r7
	str r0, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200D380: .4byte 0x000C2020

	thumb_func_start sub_0200D384
sub_0200D384: @ 0x0200D384
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ands r0, r1
	adds r0, #1
	cmp r0, #0
	beq _0200D39A
	movs r0, #0xe6
	lsls r0, r0, #9
	b _0200D3A4
_0200D39A:
	adds r0, r5, #0
	adds r0, #0x74
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
_0200D3A4:
	str r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x76
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _0200D4D8 @ =sub_0200F2BC
	str r0, [r5]
	ldr r0, _0200D4DC @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	orrs r2, r1
	ldrh r0, [r0, #4]
	orrs r2, r0
	adds r0, r5, #0
	adds r0, #0x5c
	movs r3, #0
	movs r4, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
	strh r4, [r5, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xe
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	strb r3, [r0]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	strh r4, [r5, #0x26]
	adds r0, r5, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #4
	str r0, [r5, #0x40]
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r5, #0x44]
	movs r0, #8
	str r0, [r5, #0x48]
	movs r0, #0x40
	str r0, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, #0x2e
	ldr r0, _0200D4E0 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	strh r4, [r5, #0x30]
	strh r4, [r5, #0x32]
	str r4, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r3, [r0]
	strh r4, [r5, #0x2a]
	adds r1, #8
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0x23
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r5, #0
	adds r1, #0x86
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6d
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0x15
	strb r3, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #0x14
	strb r3, [r0]
	adds r0, #5
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	subs r0, #0x3a
	strb r3, [r0]
	adds r0, r5, #0
	bl sub_02010FF4
	adds r0, r5, #0
	adds r0, #0x99
	movs r1, #3
	adds r4, r0, #0
	movs r3, #0
_0200D4BA:
	stm r0!, {r3}
	adds r2, r1, #0
	subs r1, #1
	cmp r2, #0
	bne _0200D4BA
	movs r0, #0x7f
	strb r0, [r4]
	ldr r0, _0200D4E4 @ =gUnknown_03005548
	str r2, [r0]
	ldr r0, _0200D4E8 @ =gShouldSpawnMPAttack2Effect
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200D4D8: .4byte sub_0200F2BC
_0200D4DC: .4byte gUnknown_030057C8
_0200D4E0: .4byte 0x0000FFFF
_0200D4E4: .4byte gUnknown_03005548
_0200D4E8: .4byte gShouldSpawnMPAttack2Effect

	thumb_func_start sub_0200D4EC
sub_0200D4EC: @ 0x0200D4EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _0200D504
	add r6, sp, #8
_0200D504:
	cmp r7, #0
	bne _0200D50A
	add r7, sp, #0xc
_0200D50A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _0200D5A0 @ =0x000002FF
	cmp r0, r5
	bgt _0200D536
	movs r0, #0x80
	orrs r2, r0
_0200D536:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _0200D5A4 @ =sub_0200CEA0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D5A0 @ =0x000002FF
	cmp r0, r3
	bgt _0200D57A
	movs r0, #0x80
	orrs r2, r0
_0200D57A:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _0200D5A8
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0200D5B0
	.align 2, 0
_0200D5A0: .4byte 0x000002FF
_0200D5A4: .4byte sub_0200CEA0
_0200D5A8:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0200D5B0:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D5C4
sub_0200D5C4: @ 0x0200D5C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _0200D5DC
	add r6, sp, #8
_0200D5DC:
	cmp r7, #0
	bne _0200D5E2
	add r7, sp, #0xc
_0200D5E2:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _0200D674 @ =0x000002FF
	cmp r0, r5
	bgt _0200D60E
	movs r0, #0x80
	orrs r2, r0
_0200D60E:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _0200D678 @ =sub_0200CEA0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D674 @ =0x000002FF
	cmp r0, r3
	bgt _0200D650
	movs r0, #0x80
	orrs r2, r0
_0200D650:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _0200D67C
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0200D684
	.align 2, 0
_0200D674: .4byte 0x000002FF
_0200D678: .4byte sub_0200CEA0
_0200D67C:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0200D684:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D698
sub_0200D698: @ 0x0200D698
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _0200D6B0
	add r6, sp, #8
_0200D6B0:
	cmp r7, #0
	bne _0200D6B6
	add r7, sp, #0xc
_0200D6B6:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _0200D74C @ =0x000002FF
	cmp r0, r5
	bgt _0200D6E2
	movs r0, #0x80
	orrs r2, r0
_0200D6E2:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _0200D750 @ =sub_0200CFE0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D74C @ =0x000002FF
	cmp r0, r3
	bgt _0200D726
	movs r0, #0x80
	orrs r2, r0
_0200D726:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _0200D754
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0200D75C
	.align 2, 0
_0200D74C: .4byte 0x000002FF
_0200D750: .4byte sub_0200CFE0
_0200D754:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0200D75C:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D770
sub_0200D770: @ 0x0200D770
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0200D7C4
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0200D798
	ldr r0, _0200D7BC @ =gPlayer
	ldr r1, _0200D7C0 @ =sub_0200F2BC
	str r1, [r0]
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_0200D798:
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0200D7B2
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
_0200D7B2:
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _0200D7CC
	.align 2, 0
_0200D7BC: .4byte gPlayer
_0200D7C0: .4byte sub_0200F2BC
_0200D7C4:
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_0200D7CC:
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200D7DC
sub_0200D7DC: @ 0x0200D7DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D8CC @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0200D80E
	movs r2, #0x80
	orrs r2, r5
_0200D80E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _0200D8D0 @ =sub_0200CEA0
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_0200C660
	adds r2, r0, #0
	cmp r2, #0
	bgt _0200D832
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
_0200D832:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0200D850
	movs r0, #0x80
	orrs r2, r0
_0200D850:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	adds r2, r0, #0
	cmp r2, #0
	bgt _0200D86E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
_0200D86E:
	add r2, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_02011370
	adds r2, r0, #0
	cmp r2, #0
	bge _0200D90A
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	adds r1, #6
	rsbs r1, r1, #0
	cmp r2, r1
	bge _0200D892
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _0200D90A
_0200D892:
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200D770
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200D8D4
	strh r7, [r4, #0x10]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xbd
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200D8EE
	strh r1, [r4, #0x12]
	b _0200D8EE
	.align 2, 0
_0200D8CC: .4byte 0x000002FF
_0200D8D0: .4byte sub_0200CEA0
_0200D8D4:
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0200D8E6
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	b _0200D908
_0200D8E6:
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_0200D8EE:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200D8F8
	rsbs r1, r1, #0
_0200D8F8:
	strh r1, [r4, #0x14]
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0200D90A
	rsbs r0, r1, #0
_0200D908:
	strh r0, [r4, #0x14]
_0200D90A:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200D918
sub_0200D918: @ 0x0200D918
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D9F4 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0200D94A
	movs r2, #0x80
	orrs r2, r5
_0200D94A:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _0200D9F8 @ =sub_0200CEA0
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_0200C660
	cmp r0, #0
	bgt _0200D96C
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_0200D96C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0200D98A
	movs r0, #0x80
	orrs r2, r0
_0200D98A:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	cmp r0, #0
	bgt _0200D9A6
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_0200D9A6:
	add r2, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_02011324
	cmp r0, #0
	bgt _0200DA00
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200D9FC
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #0x40
	cmp r0, #0
	ble _0200D9FC
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0200D9F0
	rsbs r0, r0, #0
_0200D9F0:
	strh r0, [r4, #0x14]
	b _0200DA00
	.align 2, 0
_0200D9F4: .4byte 0x000002FF
_0200D9F8: .4byte sub_0200CEA0
_0200D9FC:
	movs r0, #0
	strh r0, [r4, #0x12]
_0200DA00:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DA10
sub_0200DA10: @ 0x0200DA10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r5, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0200DA84 @ =0x000002FF
	cmp r1, r0
	bgt _0200DA3A
	movs r0, #0x80
	orrs r2, r0
_0200DA3A:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _0200DA88 @ =sub_0200CEA0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0200C660
	cmp r0, #0
	bgt _0200DA60
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	subs r1, r1, r0
	str r1, [r4, #8]
	strh r7, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_0200DA60:
	add r5, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011324
	cmp r0, #0
	bgt _0200DA8C
	lsls r0, r0, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0200DAC0
	strh r7, [r4, #0x12]
	b _0200DAC0
	.align 2, 0
_0200DA84: .4byte 0x000002FF
_0200DA88: .4byte sub_0200CEA0
_0200DA8C:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0200DAC0
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011370
	cmp r0, #0
	bgt _0200DAC0
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	strh r7, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0200DAC0:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DAC8
sub_0200DAC8: @ 0x0200DAC8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r5, r0, r1
	ldr r0, [r4, #0xc]
	asrs r3, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0200DB3C @ =0x000002FF
	cmp r1, r0
	bgt _0200DAF2
	movs r0, #0x80
	orrs r2, r0
_0200DAF2:
	movs r6, #0
	str r6, [sp]
	ldr r0, _0200DB40 @ =sub_0200CEA0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #8
	bl sub_0200C660
	cmp r0, #0
	bgt _0200DB16
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	strh r6, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_0200DB16:
	add r5, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011324
	cmp r0, #0
	bgt _0200DB44
	lsls r0, r0, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0200DB78
	strh r6, [r4, #0x12]
	b _0200DB78
	.align 2, 0
_0200DB3C: .4byte 0x000002FF
_0200DB40: .4byte sub_0200CEA0
_0200DB44:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0200DB78
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011370
	cmp r0, #0
	bgt _0200DB78
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	strh r6, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0200DB78:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DB80
sub_0200DB80: @ 0x0200DB80
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	mov r1, sp
	bl sub_02011324
	cmp r0, #0
	bgt _0200DBD8
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0200DBB4
	rsbs r1, r1, #0
_0200DBB4:
	strh r1, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0200DBC6
	rsbs r0, r1, #0
	strh r0, [r4, #0x14]
_0200DBC6:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200DBD8
	ldr r0, [r4, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #0x20]
_0200DBD8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DBE0
sub_0200DBE0: @ 0x0200DBE0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0200DC24
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl sub_02011370
	cmp r0, #0
	bgt _0200DC1C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0200D770
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0200DC1C:
	adds r0, r5, #0
	bl sub_0200DB80
	b _0200DC58
_0200DC24:
	adds r0, r5, #0
	bl sub_0200DB80
	add r2, sp, #8
	adds r0, r5, #0
	mov r1, sp
	bl sub_02011370
	cmp r0, #0
	bgt _0200DC58
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0200D770
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0200DC58:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DC60
sub_0200DC60: @ 0x0200DC60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	mov r1, sl
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	adds r2, r7, #0
	adds r2, #0x28
	str r2, [sp, #8]
	str r2, [sp]
	ldr r3, _0200DCF4 @ =sub_0200CFE0
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _0200DCF4 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DCD6
	adds r1, r6, #0
_0200DCD6:
	cmp r1, #0
	beq _0200DD36
	cmp r1, #0
	bge _0200DCFE
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200DD58
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _0200DCF8
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	b _0200DD44
	.align 2, 0
_0200DCF4: .4byte sub_0200CFE0
_0200DCF8:
	mov r3, sb
	ldrb r0, [r3]
	b _0200DD44
_0200DCFE:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200DD08
	rsbs r0, r0, #0
_0200DD08:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200DD12
	movs r0, #0xb
_0200DD12:
	cmp r1, r0
	bgt _0200DD28
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _0200DD22
	ldr r1, [sp, #8]
	b _0200DD42
_0200DD22:
	mov r2, sb
	ldrb r0, [r2]
	b _0200DD44
_0200DD28:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200DD58
_0200DD36:
	cmp r6, r2
	bge _0200DD40
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	b _0200DD44
_0200DD40:
	mov r1, sb
_0200DD42:
	ldrb r0, [r1]
_0200DD44:
	adds r1, r0, #0
	mov r2, sl
	str r2, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200DD58
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200DD58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DD68
sub_0200DD68: @ 0x0200DD68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _0200DE00 @ =sub_0200CFE0
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _0200DE00 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DDE2
	adds r1, r6, #0
_0200DDE2:
	cmp r1, #0
	beq _0200DE40
	cmp r1, #0
	bge _0200DE04
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200DE62
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _0200DE44
	b _0200DE4A
	.align 2, 0
_0200DE00: .4byte sub_0200CFE0
_0200DE04:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200DE0E
	rsbs r0, r0, #0
_0200DE0E:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200DE18
	movs r0, #0xb
_0200DE18:
	cmp r1, r0
	bgt _0200DE32
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _0200DE2C
	mov r2, r8
	b _0200DE4C
_0200DE2C:
	mov r3, sl
	ldrb r0, [r3]
	b _0200DE4E
_0200DE32:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200DE62
_0200DE40:
	cmp r6, r2
	bge _0200DE4A
_0200DE44:
	mov r1, r8
	ldrb r0, [r1]
	b _0200DE4E
_0200DE4A:
	mov r2, sl
_0200DE4C:
	ldrb r0, [r2]
_0200DE4E:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200DE62
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200DE62:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DE74
sub_0200DE74: @ 0x0200DE74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _0200DF0C @ =sub_0200CEA0
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _0200DF0C @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DEEE
	adds r1, r6, #0
_0200DEEE:
	cmp r1, #0
	beq _0200DF4C
	cmp r1, #0
	bge _0200DF10
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200DF6E
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _0200DF50
	b _0200DF56
	.align 2, 0
_0200DF0C: .4byte sub_0200CEA0
_0200DF10:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200DF1A
	rsbs r0, r0, #0
_0200DF1A:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200DF24
	movs r0, #0xb
_0200DF24:
	cmp r1, r0
	bgt _0200DF3E
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _0200DF38
	mov r2, r8
	b _0200DF58
_0200DF38:
	mov r3, sl
	ldrb r0, [r3]
	b _0200DF5A
_0200DF3E:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200DF6E
_0200DF4C:
	cmp r6, r2
	bge _0200DF56
_0200DF50:
	mov r1, r8
	ldrb r0, [r1]
	b _0200DF5A
_0200DF56:
	mov r2, sl
_0200DF58:
	ldrb r0, [r2]
_0200DF5A:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200DF6E
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200DF6E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DF80
sub_0200DF80: @ 0x0200DF80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov sl, r2
	str r2, [sp]
	ldr r3, _0200E014 @ =sub_0200CEA0
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _0200E014 @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DFF6
	adds r1, r6, #0
_0200DFF6:
	cmp r1, #0
	beq _0200E054
	cmp r1, #0
	bge _0200E018
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200E076
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _0200E058
	b _0200E05E
	.align 2, 0
_0200E014: .4byte sub_0200CEA0
_0200E018:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200E022
	rsbs r0, r0, #0
_0200E022:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200E02C
	movs r0, #0xb
_0200E02C:
	cmp r1, r0
	bgt _0200E046
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _0200E040
	mov r2, sl
	b _0200E060
_0200E040:
	mov r3, sb
	ldrb r0, [r3]
	b _0200E062
_0200E046:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200E076
_0200E054:
	cmp r6, r2
	bge _0200E05E
_0200E058:
	mov r1, sl
	ldrb r0, [r1]
	b _0200E062
_0200E05E:
	mov r2, sb
_0200E060:
	ldrb r0, [r2]
_0200E062:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200E076
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200E076:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E088
sub_0200E088: @ 0x0200E088
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0200E0A4
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	b _0200E104
_0200E0A4:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _0200E0BE
	cmp r0, #0
	bgt _0200E0C6
	lsls r0, r1, #0x18
	b _0200E0CA
_0200E0BE:
	cmp r0, #0
	ble _0200E0C6
	lsls r0, r1, #0x18
	b _0200E0CA
_0200E0C6:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_0200E0CA:
	lsrs r2, r0, #0x18
	lsrs r0, r2, #6
	cmp r0, #1
	beq _0200E0F6
	cmp r0, #1
	bgt _0200E0DC
	cmp r0, #0
	beq _0200E0E6
	b _0200E104
_0200E0DC:
	cmp r0, #2
	beq _0200E0EE
	cmp r0, #3
	beq _0200E0FE
	b _0200E104
_0200E0E6:
	adds r0, r3, #0
	bl sub_0200DC60
	b _0200E104
_0200E0EE:
	adds r0, r3, #0
	bl sub_0200DD68
	b _0200E104
_0200E0F6:
	adds r0, r3, #0
	bl sub_0200DE74
	b _0200E104
_0200E0FE:
	adds r0, r3, #0
	bl sub_0200DF80
_0200E104:
	pop {r0}
	bx r0

	thumb_func_start sub_0200E108
sub_0200E108: @ 0x0200E108
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	adds r1, #0x29
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r4, r0, #6
	cmp r4, #1
	beq _0200E156
	cmp r4, #1
	bgt _0200E132
	cmp r4, #0
	beq _0200E13C
	b _0200E1CC
_0200E132:
	cmp r4, #2
	beq _0200E18C
	cmp r4, #3
	beq _0200E19A
	b _0200E1CC
_0200E13C:
	mov r4, sp
	add r2, sp, #4
	adds r0, r3, #0
	mov r1, sp
	bl sub_020113D4
_0200E148:
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0200E1B2
	b _0200E1B6
_0200E156:
	mov r5, sp
	add r2, sp, #8
	adds r0, r3, #0
	mov r1, sp
	bl sub_0200D4EC
	adds r3, r0, #0
	ldrb r2, [r5]
	ands r4, r2
	cmp r4, #0
	beq _0200E170
	strb r6, [r5]
	b _0200E1CA
_0200E170:
	ldr r0, _0200E188 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200E1CA
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r5]
	b _0200E1CA
	.align 2, 0
_0200E188: .4byte gStageFlags
_0200E18C:
	mov r4, sp
	add r2, sp, #0xc
	adds r0, r3, #0
	mov r1, sp
	bl sub_0200D698
	b _0200E148
_0200E19A:
	mov r4, sp
	add r2, sp, #0x10
	adds r0, r3, #0
	mov r1, sp
	bl sub_0200D5C4
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0200E1B6
_0200E1B2:
	strb r6, [r4]
	b _0200E1CA
_0200E1B6:
	ldr r0, _0200E1D8 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200E1CA
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r4]
_0200E1CA:
	adds r6, r3, #0
_0200E1CC:
	adds r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0200E1D8: .4byte gStageFlags

	thumb_func_start sub_0200E1DC
sub_0200E1DC: @ 0x0200E1DC
	push {r4, r5, lr}
	sub sp, #8
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	ldr r0, [r1, #0xc]
	asrs r4, r0, #8
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	lsls r0, r2, #0x18
	asrs r3, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0200E20E
	cmp r3, #0
	bgt _0200E212
	b _0200E218
_0200E20E:
	cmp r3, #0
	bgt _0200E218
_0200E212:
	adds r0, r2, #0
	adds r0, #0x1f
	lsls r0, r0, #0x18
_0200E218:
	lsrs r2, r0, #0x18
	lsrs r3, r2, #6
	cmp r3, #1
	beq _0200E27C
	cmp r3, #1
	bgt _0200E22A
	cmp r3, #0
	beq _0200E234
	b _0200E2CC
_0200E22A:
	cmp r3, #2
	beq _0200E254
	cmp r3, #3
	beq _0200E2A4
	b _0200E2CC
_0200E234:
	adds r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	str r3, [sp]
	ldr r1, _0200E250 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r1, r5, #0
	b _0200E2BE
	.align 2, 0
_0200E250: .4byte sub_0200CFE0
_0200E254:
	subs r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _0200E278 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r1, r5, #0
	bl sub_0200C660
	b _0200E2CE
	.align 2, 0
_0200E278: .4byte sub_0200CFE0
_0200E27C:
	subs r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _0200E2A0 @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_0200C660
	b _0200E2CE
	.align 2, 0
_0200E2A0: .4byte sub_0200CEA0
_0200E2A4:
	adds r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, _0200E2C8 @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r1, r4, #0
_0200E2BE:
	movs r3, #8
	bl sub_0200C660
	b _0200E2CE
	.align 2, 0
_0200E2C8: .4byte sub_0200CEA0
_0200E2CC:
	movs r0, #0
_0200E2CE:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200E2D8
sub_0200E2D8: @ 0x0200E2D8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0200E36A
	movs r1, #0x40
	cmp r0, #0
	blt _0200E2EC
	movs r1, #0xc0
_0200E2EC:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0200E1DC
	lsls r2, r0, #8
	cmp r2, #0
	bgt _0200E36A
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0200E332
	cmp r1, #1
	bgt _0200E31E
	cmp r1, #0
	beq _0200E328
	b _0200E35E
_0200E31E:
	cmp r1, #2
	beq _0200E338
	cmp r1, #3
	beq _0200E34A
	b _0200E35E
_0200E328:
	ldr r0, [r4, #0xc]
	adds r0, r0, r2
	str r0, [r4, #0xc]
	strh r1, [r4, #0x12]
	b _0200E35E
_0200E332:
	ldr r0, [r4, #8]
	subs r0, r0, r2
	b _0200E34E
_0200E338:
	ldr r0, [r4, #0xc]
	subs r0, r0, r2
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0200E35E
_0200E34A:
	ldr r0, [r4, #8]
	adds r0, r0, r2
_0200E34E:
	str r0, [r4, #8]
	movs r2, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	strh r2, [r4, #0x14]
_0200E35E:
	adds r0, r4, #0
	adds r0, #0x62
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0200E36A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0200E370
sub_0200E370: @ 0x0200E370
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0200E408
	movs r1, #0x40
	cmp r0, #0
	blt _0200E384
	movs r1, #0xc0
_0200E384:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200E1DC
	lsls r2, r0, #8
	cmp r2, #0
	bgt _0200E408
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0200E3CA
	cmp r1, #1
	bgt _0200E3B6
	cmp r1, #0
	beq _0200E3C0
	b _0200E408
_0200E3B6:
	cmp r1, #2
	beq _0200E3D0
	cmp r1, #3
	beq _0200E3E2
	b _0200E408
_0200E3C0:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	strh r1, [r5, #0x12]
	b _0200E408
_0200E3CA:
	ldr r0, [r5, #8]
	subs r0, r0, r2
	b _0200E3E6
_0200E3D0:
	ldr r0, [r5, #0xc]
	subs r0, r0, r2
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	orrs r0, r1
	str r0, [r5, #0x20]
	b _0200E408
_0200E3E2:
	ldr r0, [r5, #8]
	adds r0, r0, r2
_0200E3E6:
	str r0, [r5, #8]
	movs r4, #0
	strh r4, [r5, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r4, [r5, #0x14]
_0200E408:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E410
sub_0200E410: @ 0x0200E410
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x40]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	ble _0200E426
	strh r4, [r2, #0x14]
	b _0200E432
_0200E426:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmn r0, r3
	bge _0200E432
	rsbs r0, r4, #0
	strh r0, [r2, #0x14]
_0200E432:
	movs r0, #0x14
	ldrsh r4, [r2, r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldr r5, _0200E47C @ =gSineTable
	ldrb r3, [r0]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x10]
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0200E460
	strh r1, [r2, #0x12]
_0200E460:
	lsls r0, r3, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	ldrh r1, [r2, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200E47C: .4byte gSineTable

	thumb_func_start sub_0200E480
sub_0200E480: @ 0x0200E480
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r7, _0200E4E4 @ =gCamera
	ldr r5, [r2, #8]
	ldr r3, [r2, #0xc]
	ldr r1, [r2, #0x20]
	ldr r0, _0200E4E8 @ =0x80000080
	ands r0, r1
	cmp r0, #0x80
	beq _0200E54C
	cmp r1, #0
	blt _0200E4BA
	ldr r0, [r7, #0x2c]
	lsls r0, r0, #8
	subs r4, r0, #1
	movs r0, #0
	cmp r3, r4
	blt _0200E4AA
	movs r0, #1
_0200E4AA:
	cmp r0, #0
	beq _0200E4BA
	movs r0, #0x80
	orrs r1, r0
	str r1, [r2, #0x20]
	ldr r0, _0200E4EC @ =0x0000FB20
	strh r0, [r2, #0x12]
	adds r3, r4, #0
_0200E4BA:
	ldr r0, _0200E4F0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200E4DA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200E4D6
	ldr r0, _0200E4F4 @ =gUnknown_03005428
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200E4DA
_0200E4D6:
	cmp r1, #0x1d
	bne _0200E500
_0200E4DA:
	ldr r0, _0200E4F8 @ =gUnknown_030053F4
	ldrh r4, [r0]
	ldr r0, _0200E4FC @ =gUnknown_03005434
	ldrh r6, [r0]
	b _0200E504
	.align 2, 0
_0200E4E4: .4byte gCamera
_0200E4E8: .4byte 0x80000080
_0200E4EC: .4byte 0x0000FB20
_0200E4F0: .4byte gCurrentLevel
_0200E4F4: .4byte gUnknown_03005428
_0200E4F8: .4byte gUnknown_030053F4
_0200E4FC: .4byte gUnknown_03005434
_0200E500:
	ldr r4, [r7, #0x28]
	ldr r6, [r7, #0x2c]
_0200E504:
	mov ip, r5
	mov r8, r3
	ldr r0, [r7, #0x30]
	lsls r0, r0, #8
	cmp r5, r0
	blt _0200E51E
	ldr r0, [r7, #0x34]
	lsls r0, r0, #8
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	ble _0200E51E
	adds r0, r1, #0
_0200E51E:
	adds r5, r0, #0
	lsls r0, r4, #8
	cmp r3, r0
	blt _0200E530
	lsls r0, r6, #8
	subs r0, #1
	adds r1, r3, #0
	cmp r1, r0
	ble _0200E532
_0200E530:
	adds r1, r0, #0
_0200E532:
	adds r3, r1, #0
	cmp r5, ip
	beq _0200E53E
	movs r0, #0
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x14]
_0200E53E:
	cmp r3, r8
	beq _0200E548
	movs r0, #0
	strh r0, [r2, #0x12]
	strh r0, [r2, #0x14]
_0200E548:
	str r5, [r2, #8]
	str r3, [r2, #0xc]
_0200E54C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E558
sub_0200E558: @ 0x0200E558
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, [r0, #0x48]
	lsls r5, r0, #1
	mov r0, ip
	ldr r6, [r0, #0x44]
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #0x14
	beq _0200E608
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r7, #0x10
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _0200E608
	mov r0, ip
	ldrh r2, [r0, #0x10]
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0200E5C4
	cmp r4, #0x3f
	beq _0200E5A2
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0200E5A2
	movs r0, #1
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0200E5A2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r6, #0
	cmp r0, r1
	bge _0200E604
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _0200E604
	lsls r0, r1, #0x10
	b _0200E602
_0200E5C4:
	adds r0, r7, #0
	ands r0, r3
	cmp r0, #0
	beq _0200E604
	cmp r4, #0x3f
	beq _0200E5E4
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0200E5E4
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0200E5E4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _0200E604
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	bge _0200E604
	lsls r0, r6, #0x10
_0200E602:
	lsrs r2, r0, #0x10
_0200E604:
	mov r1, ip
	strh r2, [r1, #0x10]
_0200E608:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E610
sub_0200E610: @ 0x0200E610
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0200E634 @ =0x0000BCFF
	cmp r1, r0
	bls _0200E64A
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x15
	cmp r0, #0
	bge _0200E638
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0200E648
	b _0200E646
	.align 2, 0
_0200E634: .4byte 0x0000BCFF
_0200E638:
	cmp r0, #0
	ble _0200E64A
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0200E648
_0200E646:
	movs r1, #0
_0200E648:
	strh r1, [r2, #0x10]
_0200E64A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E650
sub_0200E650: @ 0x0200E650
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0200E674 @ =0x0000BCFF
	cmp r1, r0
	bls _0200E68A
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _0200E678
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0200E688
	b _0200E686
	.align 2, 0
_0200E674: .4byte 0x0000BCFF
_0200E678:
	cmp r0, #0
	ble _0200E68A
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0200E688
_0200E686:
	movs r1, #0
_0200E688:
	strh r1, [r2, #0x10]
_0200E68A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Player_HandleSpriteYOffsetChange
Player_HandleSpriteYOffsetChange: @ 0x0200E690
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	cmp r0, r3
	beq _0200E71E
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _0200E6BC
	cmp r0, #0
	beq _0200E6B8
	adds r0, #0x1f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0200E6C8
_0200E6B8:
	movs r0, #0x20
	b _0200E6C8
_0200E6BC:
	cmp r0, #0
	beq _0200E6C6
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _0200E6C8
_0200E6C6:
	movs r0, #0x1f
_0200E6C8:
	lsrs r0, r0, #6
	cmp r0, #1
	beq _0200E702
	cmp r0, #1
	bgt _0200E6D8
	cmp r0, #0
	beq _0200E6E2
	b _0200E71E
_0200E6D8:
	cmp r0, #2
	beq _0200E6F2
	cmp r0, #3
	beq _0200E710
	b _0200E71E
_0200E6E2:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	str r0, [r2, #0xc]
	b _0200E71E
_0200E6F2:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	b _0200E71E
_0200E702:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	b _0200E71C
_0200E710:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	subs r0, r0, r1
_0200E71C:
	str r0, [r2, #8]
_0200E71E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E724
sub_0200E724: @ 0x0200E724
	push {r4, r5, r6, r7, lr}
	ldr r7, _0200E7BC @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r6, [r1, #4]
	cmp r6, #0
	bne _0200E7EC
	ldr r0, _0200E7C0 @ =gRingCount
	movs r1, #0
	strh r6, [r0]
	ldr r0, _0200E7C4 @ =gUnknown_030054B0
	strb r1, [r0]
	ldr r5, _0200E7C8 @ =gPlayer
	adds r0, r5, #0
	bl sub_0200D384
	ldr r4, _0200E7CC @ =gCamera
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r4]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r4, #4]
	ldr r0, _0200E7D0 @ =0x0201F270
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r6, [r5, #0x20]
	ldr r2, _0200E7D4 @ =gStageFlags
	ldrh r1, [r2]
	ldr r0, _0200E7D8 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r2, r5, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r6, _0200E7DC @ =0xFFFFCFFF
	ands r0, r6
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #6
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r2, #4
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ands r0, r6
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r4, #0x50
	ldrh r1, [r4]
	ldr r0, _0200E7E0 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r4]
	ldr r1, [r7]
	ldr r0, _0200E7E4 @ =sub_0200E8B0
	str r0, [r1, #8]
	ldr r0, _0200E7E8 @ =sub_0200F2BC
	str r0, [r5]
	b _0200E7F0
	.align 2, 0
_0200E7BC: .4byte gCurTask
_0200E7C0: .4byte gRingCount
_0200E7C4: .4byte gUnknown_030054B0
_0200E7C8: .4byte gPlayer
_0200E7CC: .4byte gCamera
_0200E7D0: .4byte 0x0201F270
_0200E7D4: .4byte gStageFlags
_0200E7D8: .4byte 0x0000FF7F
_0200E7DC: .4byte 0xFFFFCFFF
_0200E7E0: .4byte 0x0000FFFC
_0200E7E4: .4byte sub_0200E8B0
_0200E7E8: .4byte sub_0200F2BC
_0200E7EC:
	subs r6, #1
	str r6, [r1, #4]
_0200E7F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E7F8
sub_0200E7F8: @ 0x0200E7F8
	push {r4, r5, r6, lr}
	ldr r4, _0200E854 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r5, [r0]
	ldr r1, _0200E858 @ =gCamera
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	blt _0200E86C
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	ldr r1, _0200E85C @ =0x0000EFFF
	adds r0, r0, r1
	movs r1, #0
	cmp r2, r0
	blt _0200E81C
	movs r1, #1
_0200E81C:
	cmp r1, #0
	beq _0200E86C
	ldr r6, _0200E860 @ =gCurTask
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0x3c
	str r1, [r0, #4]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0200E864 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200E84A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200EF5C
_0200E84A:
	ldr r1, [r6]
	ldr r0, _0200E868 @ =sub_0200E724
	str r0, [r1, #8]
	b _0200E8A8
	.align 2, 0
_0200E854: .4byte gPlayer
_0200E858: .4byte gCamera
_0200E85C: .4byte 0x0000EFFF
_0200E860: .4byte gCurTask
_0200E864: .4byte gGameMode
_0200E868: .4byte sub_0200E724
_0200E86C:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200E88C
	adds r2, r1, #0
_0200E88C:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200EE40
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200EF5C
_0200E8A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E8B0
sub_0200E8B0: @ 0x0200E8B0
	push {r4, r5, r6, lr}
	ldr r5, _0200E8F8 @ =gPlayer
	adds r0, r5, #0
	bl sub_02010FF4
	adds r0, r5, #0
	bl sub_02011034
	adds r0, r5, #0
	bl sub_02011814
	adds r0, r5, #0
	bl sub_020110E0
	ldr r0, _0200E8FC @ =gUnknown_03005474
	movs r1, #0
	str r1, [r0]
	ldr r0, _0200E900 @ =gUnknown_03005458
	str r1, [r0]
	adds r0, r5, #0
	bl sub_0200EC28
	adds r0, r5, #0
	bl sub_0200EA00
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0200E904
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	b _0200E92A
	.align 2, 0
_0200E8F8: .4byte gPlayer
_0200E8FC: .4byte gUnknown_03005474
_0200E900: .4byte gUnknown_03005458
_0200E904:
	ldr r0, _0200E988 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200E924
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200E920
	ldr r0, _0200E98C @ =gUnknown_03005428
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200E924
_0200E920:
	cmp r1, #0x1d
	bne _0200E92A
_0200E924:
	adds r0, r5, #0
	bl sub_0200E480
_0200E92A:
	adds r4, r5, #0
	adds r4, #0x90
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_0200EE40
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_0200EF5C
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0x14
	beq _0200E95A
	ldrh r1, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0200E95A
	subs r0, r1, #1
	strh r0, [r5, #0x2c]
_0200E95A:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200E9F4
	ldr r6, _0200E990 @ =gCamera
	ldr r0, _0200E994 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0200E998 @ =sub_0200E7F8
	str r0, [r1, #8]
	movs r2, #0
	movs r0, #0x16
	strh r0, [r3]
	strh r2, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _0200E99C @ =0xFFFFFC00
	cmp r1, r0
	bge _0200E9A0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0200E9A6
	.align 2, 0
_0200E988: .4byte gCurrentLevel
_0200E98C: .4byte gUnknown_03005428
_0200E990: .4byte gCamera
_0200E994: .4byte gCurTask
_0200E998: .4byte sub_0200E7F8
_0200E99C: .4byte 0xFFFFFC00
_0200E9A0:
	cmp r1, #0
	ble _0200E9A6
	strh r2, [r5, #0x12]
_0200E9A6:
	movs r1, #0
	movs r2, #0
	movs r0, #2
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
	adds r2, r6, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200E9FC @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_0200E9F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200E9FC: .4byte 0xFFFFCFFF

	thumb_func_start sub_0200EA00
sub_0200EA00: @ 0x0200EA00
	push {lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x6d
	ldrb r0, [r1]
	cmp r0, #0
	bne _0200EA10
	b _0200EC0A
_0200EA10:
	subs r0, #1
	cmp r0, #0x16
	bls _0200EA18
	b _0200EC0A
_0200EA18:
	lsls r0, r0, #2
	ldr r1, _0200EA24 @ =_0200EA28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200EA24: .4byte _0200EA28
_0200EA28: @ jump table
	.4byte _0200EA84 @ case 0
	.4byte _0200EA94 @ case 1
	.4byte _0200EAA4 @ case 2
	.4byte _0200EC0A @ case 3
	.4byte _0200EAC4 @ case 4
	.4byte _0200EAC4 @ case 5
	.4byte _0200EAC4 @ case 6
	.4byte _0200EC0A @ case 7
	.4byte _0200EAE0 @ case 8
	.4byte _0200EC0A @ case 9
	.4byte _0200EBD4 @ case 10
	.4byte _0200EBE4 @ case 11
	.4byte _0200EBF4 @ case 12
	.4byte _0200EAF0 @ case 13
	.4byte _0200EB00 @ case 14
	.4byte _0200EB1C @ case 15
	.4byte _0200EB38 @ case 16
	.4byte _0200EB54 @ case 17
	.4byte _0200EB70 @ case 18
	.4byte _0200EB8C @ case 19
	.4byte _0200EBA8 @ case 20
	.4byte _0200EBC4 @ case 21
	.4byte _0200EC04 @ case 22
_0200EA84:
	ldr r1, _0200EA8C @ =gPlayer
	ldr r0, _0200EA90 @ =sub_0200F2BC
	b _0200EC08
	.align 2, 0
_0200EA8C: .4byte gPlayer
_0200EA90: .4byte sub_0200F2BC
_0200EA94:
	ldr r1, _0200EA9C @ =gPlayer
	ldr r0, _0200EAA0 @ =sub_02011874
	b _0200EC08
	.align 2, 0
_0200EA9C: .4byte gPlayer
_0200EAA0: .4byte sub_02011874
_0200EAA4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _0200EAB8 @ =0xFF9FFFFF
	ands r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
	ldr r1, _0200EABC @ =gPlayer
	ldr r0, _0200EAC0 @ =sub_0200F9B8
	b _0200EC08
	.align 2, 0
_0200EAB8: .4byte 0xFF9FFFFF
_0200EABC: .4byte gPlayer
_0200EAC0: .4byte sub_0200F9B8
_0200EAC4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
	ldr r1, _0200EAD8 @ =gPlayer
	ldr r0, _0200EADC @ =sub_0200FC04
	b _0200EC08
	.align 2, 0
_0200EAD8: .4byte gPlayer
_0200EADC: .4byte sub_0200FC04
_0200EAE0:
	ldr r1, _0200EAE8 @ =gPlayer
	ldr r0, _0200EAEC @ =sub_020105EC
	b _0200EC08
	.align 2, 0
_0200EAE8: .4byte gPlayer
_0200EAEC: .4byte sub_020105EC
_0200EAF0:
	ldr r1, _0200EAF8 @ =gPlayer
	ldr r0, _0200EAFC @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EAF8: .4byte gPlayer
_0200EAFC: .4byte sub_02010788
_0200EB00:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB14 @ =gPlayer
	ldr r0, _0200EB18 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB14: .4byte gPlayer
_0200EB18: .4byte sub_02010788
_0200EB1C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB30 @ =gPlayer
	ldr r0, _0200EB34 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB30: .4byte gPlayer
_0200EB34: .4byte sub_02010788
_0200EB38:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x30
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB4C @ =gPlayer
	ldr r0, _0200EB50 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB4C: .4byte gPlayer
_0200EB50: .4byte sub_02010788
_0200EB54:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB68 @ =gPlayer
	ldr r0, _0200EB6C @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB68: .4byte gPlayer
_0200EB6C: .4byte sub_02010788
_0200EB70:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB84 @ =gPlayer
	ldr r0, _0200EB88 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB84: .4byte gPlayer
_0200EB88: .4byte sub_02010788
_0200EB8C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EBA0 @ =gPlayer
	ldr r0, _0200EBA4 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EBA0: .4byte gPlayer
_0200EBA4: .4byte sub_02010788
_0200EBA8:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EBBC @ =gPlayer
	ldr r0, _0200EBC0 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EBBC: .4byte gPlayer
_0200EBC0: .4byte sub_02010788
_0200EBC4:
	ldr r1, _0200EBCC @ =gPlayer
	ldr r0, _0200EBD0 @ =sub_02010A78
	b _0200EC08
	.align 2, 0
_0200EBCC: .4byte gPlayer
_0200EBD0: .4byte sub_02010A78
_0200EBD4:
	ldr r1, _0200EBDC @ =gPlayer
	ldr r0, _0200EBE0 @ =sub_02010110
	b _0200EC08
	.align 2, 0
_0200EBDC: .4byte gPlayer
_0200EBE0: .4byte sub_02010110
_0200EBE4:
	ldr r1, _0200EBEC @ =gPlayer
	ldr r0, _0200EBF0 @ =sub_02010334
	b _0200EC08
	.align 2, 0
_0200EBEC: .4byte gPlayer
_0200EBF0: .4byte sub_02010334
_0200EBF4:
	ldr r1, _0200EBFC @ =gPlayer
	ldr r0, _0200EC00 @ =sub_020103E0
	b _0200EC08
	.align 2, 0
_0200EBFC: .4byte gPlayer
_0200EC00: .4byte sub_020103E0
_0200EC04:
	ldr r1, _0200EC20 @ =gPlayer
	ldr r0, _0200EC24 @ =sub_020104BC
_0200EC08:
	str r0, [r1]
_0200EC0A:
	mov r3, ip
	adds r3, #0x6d
	ldrb r0, [r3]
	mov r1, ip
	adds r1, #0x6f
	movs r2, #0
	strb r0, [r1]
	strb r2, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_0200EC20: .4byte gPlayer
_0200EC24: .4byte sub_020104BC

	thumb_func_start sub_0200EC28
sub_0200EC28: @ 0x0200EC28
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _0200EC58 @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _0200EC64
	ldr r0, _0200EC5C @ =0x04000128
	ldr r1, [r0]
	lsls r1, r1, #0x1a
	ldr r0, _0200EC60 @ =gCamera
	adds r0, #0x66
	lsrs r1, r1, #0x1e
	ldrb r0, [r0]
	cmp r1, r0
	beq _0200EC64
	adds r1, r3, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	movs r6, #0
	adds r5, r1, #0
	b _0200ECDA
	.align 2, 0
_0200EC58: .4byte gGameMode
_0200EC5C: .4byte 0x04000128
_0200EC60: .4byte gCamera
_0200EC64:
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r6, [r0]
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xe
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0200ECDA
	ldr r0, _0200ECEC @ =gInput
	ldrh r4, [r0]
	strh r4, [r5]
	ldrb r0, [r7]
	cmp r0, #2
	bls _0200ECDA
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200ECDA
	movs r0, #0xf0
	ands r0, r4
	lsrs r2, r0, #4
	ldr r0, _0200ECF0 @ =gStageTime
	ldr r1, [r0]
	ldrh r0, [r3, #0x32]
	adds r1, r0, r1
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _0200ECAC
	movs r1, #1
_0200ECAC:
	lsls r2, r1
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x1c
	lsrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x18
	ldr r0, _0200ECF4 @ =0x0000FF0F
	ands r0, r4
	orrs r0, r2
	strh r0, [r5]
	ldrh r0, [r3, #0x32]
	subs r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0200ECDA
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xbf
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
_0200ECDA:
	ldrh r0, [r5]
	eors r6, r0
	ands r6, r0
	adds r0, r3, #0
	adds r0, #0x5e
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200ECEC: .4byte gInput
_0200ECF0: .4byte gStageTime
_0200ECF4: .4byte 0x0000FF0F

	thumb_func_start sub_0200ECF8
sub_0200ECF8: @ 0x0200ECF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r2, [r0]
	mov sb, r2
	movs r0, #0x68
	adds r0, r0, r4
	mov sl, r0
	ldrh r5, [r0]
	movs r1, #0x6a
	adds r1, r1, r4
	mov ip, r1
	ldrh r1, [r1]
	mov r8, r1
	ldr r0, _0200ED7C @ =gUnknown_02015C50
	ldrh r7, [r0]
	subs r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r3, #0
	adds r0, r2, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0200EDDC
	cmp r1, #0
	bne _0200ED80
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200ED80
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0200ED80
	movs r0, #1
	mov r1, ip
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	b _0200EE30
	.align 2, 0
_0200ED7C: .4byte gUnknown_02015C50
_0200ED80:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0200EE30
	adds r6, r4, #0
	adds r6, #0x6a
	ldrh r0, [r6]
	cmp r0, #1
	bne _0200EE30
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0200EE30
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _0200EDD4 @ =sub_0200CFE0
	str r3, [sp, #4]
	movs r3, #8
	bl sub_0200C850
	adds r1, r0, #0
	ldr r0, _0200EDD8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0200EE30
	cmp r1, #0x20
	bgt _0200EE30
	movs r0, #2
	strh r0, [r6]
	b _0200EE30
	.align 2, 0
_0200EDD4: .4byte sub_0200CFE0
_0200EDD8: .4byte gGameMode
_0200EDDC:
	cmp r2, #0x26
	bne _0200EE06
	cmp r3, #0x34
	bne _0200EE30
	cmp r1, #0
	bne _0200EDF4
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0200EE30
	movs r0, #1
	b _0200EE2C
_0200EDF4:
	cmp r1, #1
	bne _0200EE30
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200EE30
	b _0200EE2A
_0200EE06:
	mov r0, sb
	cmp r0, #0x27
	bne _0200EE30
	cmp r5, #0x35
	bne _0200EE30
	mov r1, r8
	cmp r1, #0
	bne _0200EE30
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200EE30
	adds r0, r7, #0
	adds r0, #0x34
	mov r1, sl
	strh r0, [r1]
_0200EE2A:
	movs r0, #2
_0200EE2C:
	mov r1, ip
	strh r0, [r1]
_0200EE30:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200EE40
sub_0200EE40: @ 0x0200EE40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0200EEA6
	adds r0, r3, #0
	adds r0, #0x66
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	beq _0200EEA6
	ldr r5, _0200EEE8 @ =gUnknown_02015C52
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r4, r3, #0
	adds r4, #0x68
	strh r1, [r4]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0x4f
	bgt _0200EE8C
	ldr r0, _0200EEEC @ =gUnknown_02015C50
	ldrh r0, [r0]
	adds r0, r1, r0
	strh r0, [r4]
_0200EE8C:
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r1, r5, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_0200EEA6:
	adds r0, r3, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	adds r4, r3, #0
	adds r4, #0x68
	adds r5, r3, #0
	adds r5, #0x6a
	cmp r1, #9
	bne _0200EEF8
	ldr r0, _0200EEEC @ =gUnknown_02015C50
	ldrh r0, [r0]
	adds r0, #9
	strh r0, [r4]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	strh r0, [r5]
	movs r7, #0x14
	ldrsh r0, [r3, r7]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _0200EEDC
	rsbs r0, r0, #0
_0200EEDC:
	cmp r0, #7
	ble _0200EEF0
	cmp r0, #0x80
	ble _0200EEF2
	movs r0, #0x80
	b _0200EEF2
	.align 2, 0
_0200EEE8: .4byte gUnknown_02015C52
_0200EEEC: .4byte gUnknown_02015C50
_0200EEF0:
	movs r0, #8
_0200EEF2:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
_0200EEF8:
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r2, [r0]
	adds r7, r1, #0
	adds r6, r0, #0
	mov r1, ip
	adds r1, #0x20
	cmp r2, #0
	bne _0200EF24
	mov r2, ip
	ldrh r0, [r2, #0xa]
	ldrh r2, [r4]
	cmp r0, r2
	bne _0200EF24
	ldrb r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	beq _0200EF46
_0200EF24:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r5]
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r0, #1
	strb r0, [r7]
_0200EF46:
	mov r7, r8
	ldrh r1, [r7]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200EF5C
sub_0200EF5C: @ 0x0200EF5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r4, #0xc
	adds r6, r1, #0
	ldr r0, _0200EFF0 @ =gCamera
	ldrh r3, [r0]
	ldrh r5, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0200EF86
	ldrh r1, [r4, #0x1e]
	ldr r0, _0200EFF4 @ =0x0000FFFF
	cmp r1, r0
	bne _0200EF88
_0200EF86:
	movs r2, #1
_0200EF88:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _0200EFB6
	cmp r0, #0x29
	bne _0200F03C
_0200EFB6:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r4, #0x10]
	ldr r0, _0200EFF8 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r4, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200EFFC
	movs r0, #0xff
	lsls r0, r0, #8
	b _0200F000
	.align 2, 0
_0200EFF0: .4byte gCamera
_0200EFF4: .4byte 0x0000FFFF
_0200EFF8: .4byte 0xFFFFF3FF
_0200EFFC:
	movs r0, #0x80
	lsls r0, r0, #1
_0200F000:
	strh r0, [r6, #2]
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0200F010
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_0200F010:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	b _0200F076
_0200F03C:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r4, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r4, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200F05C
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r4, #0x10]
	b _0200F068
_0200F05C:
	ldr r0, _0200F100 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r4, #0x10]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
_0200F068:
	ldr r0, [r4, #0x10]
	ldr r1, _0200F104 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
_0200F076:
	ldr r0, _0200F108 @ =gGameMode
	ldrb r3, [r0]
	cmp r3, #2
	bhi _0200F080
	b _0200F2A4
_0200F080:
	ldr r5, _0200F10C @ =gMultiSioSend
	ldr r2, _0200F110 @ =gMultiplayerPlayerTasks
	ldr r0, _0200F114 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r5]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r5, #4]
	ldrh r1, [r4, #0xa]
	strh r1, [r5, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r5, #0xa]
	mov r8, r2
	cmp r3, #5
	bne _0200F0D2
	ldr r0, _0200F118 @ =gRingCount
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r5, #6]
_0200F0D2:
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r5, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r5, #0xd]
	ldr r0, [r4, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0200F11C
	ldrh r0, [r5, #8]
	movs r1, #1
	orrs r0, r1
	b _0200F122
	.align 2, 0
_0200F100: .4byte 0xFFFFFBFF
_0200F104: .4byte 0xFFFFF7FF
_0200F108: .4byte gGameMode
_0200F10C: .4byte gMultiSioSend
_0200F110: .4byte gMultiplayerPlayerTasks
_0200F114: .4byte 0x04000128
_0200F118: .4byte gRingCount
_0200F11C:
	ldrh r1, [r5, #8]
	ldr r0, _0200F138 @ =0x0000FFFE
	ands r0, r1
_0200F122:
	strh r0, [r5, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	bne _0200F13C
	ldrh r1, [r5, #8]
	movs r0, #2
	orrs r0, r1
	b _0200F142
	.align 2, 0
_0200F138: .4byte 0x0000FFFE
_0200F13C:
	ldrh r1, [r5, #8]
	ldr r0, _0200F17C @ =0x0000FFFD
	ands r0, r1
_0200F142:
	strh r0, [r5, #8]
	ldrh r0, [r5, #8]
	ldr r2, _0200F180 @ =0x0000FFF7
	ands r2, r0
	strh r2, [r5, #8]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0200F172
	mov r1, ip
	ldr r0, [r1, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200F172
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	bne _0200F172
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0200F184
_0200F172:
	ldrh r1, [r5, #8]
	movs r0, #4
	orrs r0, r1
	b _0200F188
	.align 2, 0
_0200F17C: .4byte 0x0000FFFD
_0200F180: .4byte 0x0000FFF7
_0200F184:
	ldr r0, _0200F1A4 @ =0x0000FFFB
	ands r0, r2
_0200F188:
	strh r0, [r5, #8]
	mov r2, ip
	ldr r0, [r2, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200F1A8
	ldrh r1, [r5, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	b _0200F1AE
	.align 2, 0
_0200F1A4: .4byte 0x0000FFFB
_0200F1A8:
	ldrh r1, [r5, #8]
	ldr r0, _0200F1C4 @ =0x0000FEFF
	ands r0, r1
_0200F1AE:
	strh r0, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	beq _0200F1C8
	ldrh r1, [r5, #8]
	movs r0, #0x40
	orrs r0, r1
	b _0200F1CE
	.align 2, 0
_0200F1C4: .4byte 0x0000FEFF
_0200F1C8:
	ldrh r1, [r5, #8]
	ldr r0, _0200F200 @ =0x0000FFBF
	ands r0, r1
_0200F1CE:
	strh r0, [r5, #8]
	ldrh r0, [r5, #8]
	ldr r2, _0200F204 @ =0x0000FFCF
	ands r2, r0
	strh r2, [r5, #8]
	ldr r3, _0200F208 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r5, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200F20C
	movs r0, #0x80
	orrs r1, r0
	b _0200F210
	.align 2, 0
_0200F200: .4byte 0x0000FFBF
_0200F204: .4byte 0x0000FFCF
_0200F208: .4byte gPlayer
_0200F20C:
	ldr r0, _0200F224 @ =0x0000FF7F
	ands r1, r0
_0200F210:
	strh r1, [r5, #8]
	mov r0, sb
	cmp r0, #0
	beq _0200F228
	ldrh r1, [r5, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _0200F22E
	.align 2, 0
_0200F224: .4byte 0x0000FF7F
_0200F228:
	ldrh r1, [r5, #8]
	ldr r0, _0200F2B0 @ =0x0000F7FF
	ands r0, r1
_0200F22E:
	strh r0, [r5, #8]
	ldr r6, _0200F2B4 @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0200F294
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _0200F274
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _0200F294
_0200F25E:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _0200F274
	strb r2, [r4]
_0200F274:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0200F294
	ldr r0, _0200F2B4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _0200F274
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _0200F25E
_0200F294:
	ldrh r0, [r5, #8]
	ldr r1, _0200F2B8 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r5, #8]
	ldrb r0, [r4]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r5, #8]
_0200F2A4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F2B0: .4byte 0x0000F7FF
_0200F2B4: .4byte 0x04000128
_0200F2B8: .4byte 0x0000F9FF

	thumb_func_start sub_0200F2BC
sub_0200F2BC: @ 0x0200F2BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200F30C @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _0200F310
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	b _0200F316
	.align 2, 0
_0200F30C: .4byte 0xCEF118CF
_0200F310:
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
_0200F316:
	ldr r0, _0200F328 @ =gPlayer
	ldr r1, _0200F32C @ =sub_0200F330
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200F328: .4byte gPlayer
_0200F32C: .4byte sub_0200F330

	thumb_func_start sub_0200F330
sub_0200F330: @ 0x0200F330
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_02011758
	cmp r0, #0
	bne _0200F40E
	adds r0, r4, #0
	bl sub_0201178C
	cmp r0, #0
	bne _0200F40E
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	bne _0200F40E
	adds r0, r4, #0
	bl sub_02010DD0
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F38A
	ldr r1, _0200F3D0 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F38A
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F38A:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F3B0
	adds r2, r1, #0
_0200F3B0:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F3D4
	subs r0, #1
	b _0200F3FC
	.align 2, 0
_0200F3D0: .4byte gSineTable
_0200F3D4:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F3FE
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F3EA
	rsbs r1, r1, #0
_0200F3EA:
	ldr r0, _0200F414 @ =0x000001DF
	cmp r1, r0
	bgt _0200F3FE
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F3FC:
	strh r0, [r4, #0x2a]
_0200F3FE:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F40E
	ldr r1, _0200F418 @ =gPlayer
	ldr r0, _0200F41C @ =sub_0200FADC
	str r0, [r1]
_0200F40E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200F414: .4byte 0x000001DF
_0200F418: .4byte gPlayer
_0200F41C: .4byte sub_0200FADC

	thumb_func_start sub_0200F420
sub_0200F420: @ 0x0200F420
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0201178C
	cmp r0, #0
	bne _0200F50E
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	bne _0200F50E
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200F44E
	ldr r1, _0200F4C8 @ =gPlayer
	ldr r0, _0200F4CC @ =sub_0200F2BC
	str r0, [r1]
_0200F44E:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F482
	ldr r1, _0200F4D0 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F482
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F482:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F4A8
	adds r2, r1, #0
_0200F4A8:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F4D4
	subs r0, #1
	b _0200F4FC
	.align 2, 0
_0200F4C8: .4byte gPlayer
_0200F4CC: .4byte sub_0200F2BC
_0200F4D0: .4byte gSineTable
_0200F4D4:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F4FE
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F4EA
	rsbs r1, r1, #0
_0200F4EA:
	ldr r0, _0200F514 @ =0x000001DF
	cmp r1, r0
	bgt _0200F4FE
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F4FC:
	strh r0, [r4, #0x2a]
_0200F4FE:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F50E
	ldr r1, _0200F518 @ =gPlayer
	ldr r0, _0200F51C @ =sub_0200FADC
	str r0, [r1]
_0200F50E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200F514: .4byte 0x000001DF
_0200F518: .4byte gPlayer
_0200F51C: .4byte sub_0200FADC

	thumb_func_start sub_0200F520
sub_0200F520: @ 0x0200F520
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x90
	ldr r0, [r6]
	adds r7, r0, #0
	adds r7, #0xc
	adds r0, r4, #0
	adds r0, #0x68
	ldr r1, _0200F580 @ =gUnknown_02015C50
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl sub_0201178C
	cmp r0, #0
	beq _0200F54A
	b _0200F672
_0200F54A:
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	beq _0200F556
	b _0200F672
_0200F556:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _0200F588
	cmp r5, #1
	bne _0200F5B2
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _0200F592
	strh r5, [r1]
	ldr r0, [r6]
	ldr r1, [r0, #0x1c]
	ldr r2, _0200F584 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r0, #0x1c]
	b _0200F592
	.align 2, 0
_0200F580: .4byte gUnknown_02015C50
_0200F584: .4byte 0xFFFFBFFF
_0200F588:
	cmp r1, #0x40
	beq _0200F592
	ldr r1, _0200F62C @ =gPlayer
	ldr r0, _0200F630 @ =sub_0200F2BC
	str r0, [r1]
_0200F592:
	cmp r5, #1
	bne _0200F5B2
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #1
	bne _0200F5B2
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200F5B2
	ldr r1, _0200F62C @ =gPlayer
	ldr r0, _0200F630 @ =sub_0200F2BC
	str r0, [r1]
_0200F5B2:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F5E6
	ldr r1, _0200F634 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F5E6
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F5E6:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F60C
	adds r2, r1, #0
_0200F60C:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F638
	subs r0, #1
	b _0200F660
	.align 2, 0
_0200F62C: .4byte gPlayer
_0200F630: .4byte sub_0200F2BC
_0200F634: .4byte gSineTable
_0200F638:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F662
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F64E
	rsbs r1, r1, #0
_0200F64E:
	ldr r0, _0200F678 @ =0x000001DF
	cmp r1, r0
	bgt _0200F662
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F660:
	strh r0, [r4, #0x2a]
_0200F662:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F672
	ldr r1, _0200F67C @ =gPlayer
	ldr r0, _0200F680 @ =sub_0200FADC
	str r0, [r1]
_0200F672:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F678: .4byte 0x000001DF
_0200F67C: .4byte gPlayer
_0200F680: .4byte sub_0200FADC

	thumb_func_start sub_0200F684
sub_0200F684: @ 0x0200F684
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x90
	ldr r0, [r5]
	adds r7, r0, #0
	adds r7, #0xc
	adds r0, r4, #0
	adds r0, #0x68
	ldr r1, _0200F6E8 @ =gUnknown_02015C50
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	bl sub_02010D4C
	cmp r0, #0
	beq _0200F6AE
	b _0200F7DA
_0200F6AE:
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	beq _0200F6BA
	b _0200F7DA
_0200F6BA:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _0200F6F0
	cmp r6, #2
	bne _0200F71A
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _0200F6FA
	movs r0, #1
	strh r0, [r1]
	ldr r2, [r5]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200F6EC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	b _0200F6FA
	.align 2, 0
_0200F6E8: .4byte gUnknown_02015C50
_0200F6EC: .4byte 0xFFFFBFFF
_0200F6F0:
	cmp r1, #0x80
	beq _0200F6FA
	ldr r1, _0200F794 @ =gPlayer
	ldr r0, _0200F798 @ =sub_0200F2BC
	str r0, [r1]
_0200F6FA:
	cmp r6, #2
	bne _0200F71A
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #1
	bne _0200F71A
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200F71A
	ldr r1, _0200F794 @ =gPlayer
	ldr r0, _0200F798 @ =sub_0200F2BC
	str r0, [r1]
_0200F71A:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F74E
	ldr r1, _0200F79C @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F74E
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F74E:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F774
	adds r2, r1, #0
_0200F774:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F7A0
	subs r0, #1
	b _0200F7C8
	.align 2, 0
_0200F794: .4byte gPlayer
_0200F798: .4byte sub_0200F2BC
_0200F79C: .4byte gSineTable
_0200F7A0:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F7CA
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F7B6
	rsbs r1, r1, #0
_0200F7B6:
	ldr r0, _0200F7E0 @ =0x000001DF
	cmp r1, r0
	bgt _0200F7CA
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F7C8:
	strh r0, [r4, #0x2a]
_0200F7CA:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F7DA
	ldr r1, _0200F7E4 @ =gPlayer
	ldr r0, _0200F7E8 @ =sub_0200FADC
	str r0, [r1]
_0200F7DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F7E0: .4byte 0x000001DF
_0200F7E4: .4byte gPlayer
_0200F7E8: .4byte sub_0200FADC

	thumb_func_start sub_0200F7EC
sub_0200F7EC: @ 0x0200F7EC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x99
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0200F804
	subs r0, r2, #1
	strb r0, [r1]
	b _0200F866
_0200F804:
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	beq _0200F810
	b _0200F9A6
_0200F810:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0200F866
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _0200F848
	cmp r1, #0x20
	bne _0200F866
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0200F83C
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0200F866
_0200F83C:
	subs r0, #0x18
	cmp r0, #0
	bge _0200F864
	movs r0, #0x60
	rsbs r0, r0, #0
	b _0200F864
_0200F848:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0200F85C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _0200F866
_0200F85C:
	adds r0, #0x18
	cmp r0, #0
	ble _0200F864
	movs r0, #0x60
_0200F864:
	strh r0, [r4, #0x14]
_0200F866:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0200F876
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	b _0200F88E
_0200F876:
	cmp r0, #0
	bge _0200F888
	adds r1, r4, #0
	adds r1, #0x50
	ldr r0, _0200F884 @ =0x0000FFF8
	b _0200F88E
	.align 2, 0
_0200F884: .4byte 0x0000FFF8
_0200F888:
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
_0200F88E:
	strh r0, [r1]
	adds r2, r1, #0
	ldrh r0, [r4, #0x14]
	ldrh r1, [r2]
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bhi _0200F8AA
	strh r1, [r2]
	strh r1, [r4, #0x14]
_0200F8AA:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0200F8C8
	ldr r0, _0200F8C0 @ =gPlayer
	ldr r1, _0200F8C4 @ =sub_0200F2BC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _0200F9A6
	.align 2, 0
_0200F8C0: .4byte gPlayer
_0200F8C4: .4byte sub_0200F2BC
_0200F8C8:
	movs r0, #0x14
	ldrsh r3, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r5, [r0]
	adds r1, r5, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0xbf
	bgt _0200F912
	cmp r3, #0
	beq _0200F912
	ldr r1, _0200F904 @ =gSineTable
	lsls r0, r5, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _0200F908
	cmp r2, #0
	bgt _0200F90E
	b _0200F90C
	.align 2, 0
_0200F904: .4byte gSineTable
_0200F908:
	cmp r2, #0
	blt _0200F90E
_0200F90C:
	asrs r2, r0, #0xa
_0200F90E:
	adds r3, r3, r2
	strh r3, [r4, #0x14]
_0200F912:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	adds r0, r4, #0
	bl sub_0200E2D8
	ldr r0, [r4, #0x20]
	movs r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0200F934
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
_0200F934:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F94E
	adds r2, r1, #0
_0200F94E:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F96E
	subs r0, #1
	b _0200F994
_0200F96E:
	ldrb r0, [r6]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F996
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0200F984
	rsbs r1, r1, #0
_0200F984:
	ldr r0, _0200F9AC @ =0x000001DF
	cmp r1, r0
	bgt _0200F996
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F994:
	strh r0, [r4, #0x2a]
_0200F996:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F9A6
	ldr r1, _0200F9B0 @ =gPlayer
	ldr r0, _0200F9B4 @ =sub_0200FADC
	str r0, [r1]
_0200F9A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200F9AC: .4byte 0x000001DF
_0200F9B0: .4byte gPlayer
_0200F9B4: .4byte sub_0200FADC

	thumb_func_start sub_0200F9B8
sub_0200F9B8: @ 0x0200F9B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200FA10 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #0xe
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	ldr r1, [r4, #0x20]
	movs r0, #0x81
	lsls r0, r0, #1
	orrs r1, r0
	ldr r0, _0200FA14 @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0200F9F8
	movs r0, #0x10
	orrs r1, r0
	str r1, [r4, #0x20]
_0200F9F8:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0200FA02
	rsbs r1, r1, #0
_0200FA02:
	ldr r0, _0200FA18 @ =0x0000013F
	cmp r1, r0
	bgt _0200FA1C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xa
	b _0200FA22
	.align 2, 0
_0200FA10: .4byte 0xCEF118CF
_0200FA14: .4byte 0xFEFFFFDF
_0200FA18: .4byte 0x0000013F
_0200FA1C:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
_0200FA22:
	strh r0, [r1]
	movs r3, #0x9c
	lsls r3, r3, #3
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	subs r1, #0x40
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0200FAC0 @ =gSineTable
	lsls r0, r1, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	ldrh r5, [r4, #0x10]
	adds r0, r0, r5
	strh r0, [r4, #0x10]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0200FA9A
	ldr r0, _0200FAC4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200FA8E
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200FA8A
	ldr r0, _0200FAC8 @ =gUnknown_03005428
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200FA8E
_0200FA8A:
	cmp r1, #0x1d
	bne _0200FA9A
_0200FA8E:
	ldr r0, _0200FACC @ =gCamera
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r4, #0x10]
_0200FA9A:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200FAD0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0xe
	bl m4aSongNumStart
	ldr r0, _0200FAD4 @ =gPlayer
	ldr r1, _0200FAD8 @ =sub_0200FADC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200FAC0: .4byte gSineTable
_0200FAC4: .4byte gCurrentLevel
_0200FAC8: .4byte gUnknown_03005428
_0200FACC: .4byte gCamera
_0200FAD0: .4byte 0xFFFFBFFF
_0200FAD4: .4byte gPlayer
_0200FAD8: .4byte sub_0200FADC

	thumb_func_start sub_0200FADC
sub_0200FADC: @ 0x0200FADC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200FB0E
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xfd
	lsls r0, r0, #8
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	bge _0200FB0E
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _0200FB68 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0200FB0E
	strh r3, [r4, #0x12]
_0200FB0E:
	adds r0, r4, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FB46
	adds r2, r1, #0
_0200FB46:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FB6C
	adds r1, #2
	cmp r1, #0
	ble _0200FB78
	b _0200FB76
	.align 2, 0
_0200FB68: .4byte gUnknown_030057C8
_0200FB6C:
	cmp r1, #0
	ble _0200FB78
	subs r1, #2
	cmp r1, #0
	bge _0200FB78
_0200FB76:
	movs r1, #0
_0200FB78:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _0200FB8C
	cmp r2, #0
	beq _0200FB98
_0200FB8C:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FB98:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FBD0
	cmp r0, #1
	bgt _0200FBB6
	cmp r0, #0
	beq _0200FBC0
	b _0200FBDE
_0200FBB6:
	cmp r0, #2
	beq _0200FBC8
	cmp r0, #3
	beq _0200FBD8
	b _0200FBDE
_0200FBC0:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _0200FBDE
_0200FBC8:
	adds r0, r4, #0
	bl sub_0200D918
	b _0200FBDE
_0200FBD0:
	adds r0, r4, #0
	bl sub_0200DA10
	b _0200FBDE
_0200FBD8:
	adds r0, r4, #0
	bl sub_0200DAC8
_0200FBDE:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0200FBF6
	ldr r1, _0200FBFC @ =gPlayer
	ldr r0, _0200FC00 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0200FBF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200FBFC: .4byte gPlayer
_0200FC00: .4byte sub_0200F2BC

	thumb_func_start sub_0200FC04
sub_0200FC04: @ 0x0200FC04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200FC88 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0200FC8C @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _0200FC44
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _0200FC54
_0200FC44:
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
_0200FC54:
	adds r1, r4, #0
	adds r1, #0x70
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	strb r3, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200FC90 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x24
	strb r3, [r0]
	ldr r0, _0200FC94 @ =gPlayer
	ldr r1, _0200FC98 @ =sub_0200FC9C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200FC88: .4byte 0xCEF118CF
_0200FC8C: .4byte 0xFEFFFFDF
_0200FC90: .4byte 0xFFFFBFFF
_0200FC94: .4byte gPlayer
_0200FC98: .4byte sub_0200FC9C

	thumb_func_start sub_0200FC9C
sub_0200FC9C: @ 0x0200FC9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FCD6
	adds r2, r1, #0
_0200FCD6:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FCF8
	adds r1, #2
	cmp r1, #0
	ble _0200FD04
	b _0200FD02
_0200FCF8:
	cmp r1, #0
	ble _0200FD04
	subs r1, #2
	cmp r1, #0
	bge _0200FD04
_0200FD02:
	movs r1, #0
_0200FD04:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _0200FD18
	cmp r2, #0
	beq _0200FD24
_0200FD18:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FD24:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FD5C
	cmp r0, #1
	bgt _0200FD42
	cmp r0, #0
	beq _0200FD4C
	b _0200FD6A
_0200FD42:
	cmp r0, #2
	beq _0200FD54
	cmp r0, #3
	beq _0200FD64
	b _0200FD6A
_0200FD4C:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _0200FD6A
_0200FD54:
	adds r0, r4, #0
	bl sub_0200D918
	b _0200FD6A
_0200FD5C:
	adds r0, r4, #0
	bl sub_0200DA10
	b _0200FD6A
_0200FD64:
	adds r0, r4, #0
	bl sub_0200DAC8
_0200FD6A:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0200FD82
	ldr r1, _0200FD88 @ =gPlayer
	ldr r0, _0200FD8C @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0200FD82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200FD88: .4byte gPlayer
_0200FD8C: .4byte sub_0200F2BC

	thumb_func_start sub_0200FD90
sub_0200FD90: @ 0x0200FD90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x68
	ldr r1, _0200FE00 @ =gUnknown_02015C50
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0200FE14
	ldr r2, [r6, #0x20]
	ldr r0, _0200FE04 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r6, #0x20]
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0200FDD8
	movs r1, #8
_0200FDD8:
	ldr r0, _0200FE08 @ =gUnknown_02015E3C
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _0200FDEE
	rsbs r1, r1, #0
_0200FDEE:
	strh r1, [r6, #0x14]
	ldr r1, _0200FE0C @ =gPlayer
	ldr r0, _0200FE10 @ =sub_02011874
	str r0, [r1]
	movs r0, #0xc
	bl m4aSongNumStart
	b _0200FEBA
	.align 2, 0
_0200FE00: .4byte gUnknown_02015C50
_0200FE04: .4byte 0xFFFFFBFF
_0200FE08: .4byte gUnknown_02015E3C
_0200FE0C: .4byte gPlayer
_0200FE10: .4byte sub_02011874
_0200FE14:
	ldrh r4, [r6, #0x26]
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0200FE2C
	asrs r0, r0, #0x15
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bgt _0200FE2C
	movs r4, #0
_0200FE2C:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0200FF14 @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0200FE98
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r2, _0200FF18 @ =gMPlayTable
	ldr r0, _0200FF1C @ =gSongTable
	adds r0, #0x5c
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _0200FF20 @ =0x0000FFFF
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x80
	rsbs r2, r2, #0
	ands r2, r4
	adds r0, r5, #0
	bl m4aMPlayPitchControl
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bge _0200FE86
	adds r2, r1, #0
_0200FE86:
	adds r4, r2, #0
	adds r2, r6, #0
	adds r2, #0x6a
	movs r0, #1
	movs r1, #1
	strh r1, [r2]
	adds r1, r6, #0
	adds r1, #0x6c
	strb r0, [r1]
_0200FE98:
	strh r4, [r6, #0x26]
	cmp r7, #3
	bne _0200FEBA
	adds r2, r6, #0
	adds r2, #0x6a
	ldrh r0, [r2]
	cmp r0, #1
	bne _0200FEBA
	mov r4, r8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200FEBA
	movs r0, #0
	strh r0, [r2]
_0200FEBA:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200FFB8
	adds r0, r6, #0
	bl sub_0200E610
	adds r0, r6, #0
	bl sub_0200E480
	ldrh r0, [r6, #0x12]
	adds r0, #0x2a
	strh r0, [r6, #0x12]
	movs r1, #0x10
	ldrsh r2, [r6, r1]
	ldr r1, [r6, #8]
	adds r1, r1, r2
	str r1, [r6, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FEF0
	adds r2, r1, #0
_0200FEF0:
	strh r2, [r6, #0x12]
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FF24
	adds r1, #2
	cmp r1, #0
	ble _0200FF30
	b _0200FF2E
	.align 2, 0
_0200FF14: .4byte gUnknown_030057C8
_0200FF18: .4byte gMPlayTable
_0200FF1C: .4byte gSongTable
_0200FF20: .4byte 0x0000FFFF
_0200FF24:
	cmp r1, #0
	ble _0200FF30
	subs r1, #2
	cmp r1, #0
	bge _0200FF30
_0200FF2E:
	movs r1, #0
_0200FF30:
	strb r1, [r5]
	ldrh r2, [r6, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r4, #0x10
	ldrsh r0, [r6, r4]
	cmp r0, #0
	bne _0200FF44
	cmp r2, #0
	beq _0200FF50
_0200FF44:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FF50:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FF88
	cmp r0, #1
	bgt _0200FF6E
	cmp r0, #0
	beq _0200FF78
	b _0200FF96
_0200FF6E:
	cmp r0, #2
	beq _0200FF80
	cmp r0, #3
	beq _0200FF90
	b _0200FF96
_0200FF78:
	adds r0, r6, #0
	bl sub_0200D7DC
	b _0200FF96
_0200FF80:
	adds r0, r6, #0
	bl sub_0200D918
	b _0200FF96
_0200FF88:
	adds r0, r6, #0
	bl sub_0200DA10
	b _0200FF96
_0200FF90:
	adds r0, r6, #0
	bl sub_0200DAC8
_0200FF96:
	ldr r0, [r6, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010078
	ldr r1, _0200FFB0 @ =gPlayer
	ldr r0, _0200FFB4 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r6, #0x10]
	movs r1, #0
	strh r0, [r6, #0x14]
	strb r1, [r5]
	b _02010078
	.align 2, 0
_0200FFB0: .4byte gPlayer
_0200FFB4: .4byte sub_0200F2BC
_0200FFB8:
	movs r4, #0x14
	ldrsh r3, [r6, r4]
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r4, [r0]
	adds r1, r4, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _02010002
	cmp r3, #0
	beq _02010002
	ldr r1, _0200FFF4 @ =gSineTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _0200FFF8
	cmp r2, #0
	bgt _0200FFFE
	b _0200FFFC
	.align 2, 0
_0200FFF4: .4byte gSineTable
_0200FFF8:
	cmp r2, #0
	blt _0200FFFE
_0200FFFC:
	asrs r2, r0, #0xa
_0200FFFE:
	adds r3, r3, r2
	strh r3, [r6, #0x14]
_02010002:
	adds r0, r6, #0
	bl sub_0200E480
	adds r0, r6, #0
	bl sub_0200E410
	adds r0, r6, #0
	bl sub_0200E2D8
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	ldrh r2, [r6, #0x12]
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0201002E
	adds r2, r1, #0
_0201002E:
	strh r2, [r6, #0x12]
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	adds r0, r6, #0
	bl sub_0200E088
	ldrh r0, [r6, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r6, r1]
	cmp r2, #0
	beq _0201004E
	subs r0, #1
	b _02010076
_0201004E:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _02010078
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _02010064
	rsbs r1, r1, #0
_02010064:
	ldr r0, _02010084 @ =0x000001DF
	cmp r1, r0
	bgt _02010078
	strh r2, [r6, #0x14]
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x1e
_02010076:
	strh r0, [r6, #0x2a]
_02010078:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02010084: .4byte 0x000001DF

	thumb_func_start sub_02010088
sub_02010088: @ 0x02010088
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x38
	movs r4, #0
	strb r4, [r5]
	adds r0, #0x24
	strb r4, [r0]
	adds r3, r6, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010104 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r6, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldrb r2, [r5]
	str r4, [sp]
	ldr r3, _02010108 @ =sub_0200CFE0
	str r3, [sp, #4]
	movs r3, #8
	bl sub_0200C850
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r2, _0201010C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r2, #0x20]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010104: .4byte 0xFFFFCFFF
_02010108: .4byte sub_0200CFE0
_0201010C: .4byte gPlayer

	thumb_func_start sub_02010110
sub_02010110: @ 0x02010110
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _02010188 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #5
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #0x11
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x29
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _02010190
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	ldr r2, _0201018C @ =0xFFFFFF00
	cmp r0, r2
	ble _0201017A
	adds r1, r2, #0
_0201017A:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _020101B4
	b _020101B2
	.align 2, 0
_02010188: .4byte 0xCEF118CF
_0201018C: .4byte 0xFFFFFF00
_02010190:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	asrs r2, r5, #0x10
	cmp r0, r2
	bge _020101A8
	adds r1, r2, #0
_020101A8:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bge _020101B4
_020101B2:
	adds r1, r2, #0
_020101B4:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_02010088
	movs r0, #0x1a
	bl m4aSongNumStart
	ldr r0, _020101D4 @ =gPlayer
	ldr r1, _020101D8 @ =sub_020101DC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020101D4: .4byte gPlayer
_020101D8: .4byte sub_020101DC

	thumb_func_start sub_020101DC
sub_020101DC: @ 0x020101DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_020115F0
	cmp r0, #0
	beq _02010234
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010228 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0201022C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02010230 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	b _02010318
	.align 2, 0
_02010228: .4byte 0xFFFFCFFF
_0201022C: .4byte gPlayer
_02010230: .4byte 0xBFFFFFFF
_02010234:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, #0x14]
	cmp r0, #0
	blt _02010248
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0201024E
_02010248:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_0201024E:
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _02010278
	ldr r1, _02010320 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	adds r0, r3, r0
	strh r0, [r4, #0x14]
_02010278:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	ldr r0, [r4, #0x20]
	movs r5, #2
	ands r0, r5
	cmp r0, #0
	beq _02010294
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
_02010294:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020102AE
	adds r2, r1, #0
_020102AE:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	movs r0, #0x1a
	bl m4aSongNumStartOrContinue
	ldr r0, [r4, #0x20]
	ands r0, r5
	cmp r0, #0
	beq _02010318
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010324 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _02010328 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _0201032C @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	ldr r0, _02010330 @ =sub_0200FADC
	str r0, [r4]
_02010318:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010320: .4byte gSineTable
_02010324: .4byte 0xFFFFCFFF
_02010328: .4byte gPlayer
_0201032C: .4byte 0xBFFFFFFF
_02010330: .4byte sub_0200FADC

	thumb_func_start sub_02010334
sub_02010334: @ 0x02010334
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	ldr r1, _020103CC @ =0xCEF118CF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	subs r1, #5
	ands r0, r1
	subs r1, #0xfe
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r3, r5, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _020103D0 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _020103D4 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _020103D8 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	ldr r1, _020103DC @ =sub_0200F330
	str r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020103CC: .4byte 0xCEF118CF
_020103D0: .4byte 0xFFFFCFFF
_020103D4: .4byte gPlayer
_020103D8: .4byte 0xBFFFFFFF
_020103DC: .4byte sub_0200F330

	thumb_func_start sub_020103E0
sub_020103E0: @ 0x020103E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _020104A4 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #5
	ands r0, r1
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
	strh r0, [r1]
	ldr r0, _020104A8 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _020104AC @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x38
	movs r6, #1
	strb r6, [r0]
	ldr r5, _020104B0 @ =gPlayer
	ldr r0, [r5, #0x20]
	ldr r1, _020104B4 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0201047E
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_0201047E:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0201048C
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
_0201048C:
	movs r0, #0xe
	bl m4aSongNumStart
	ldr r1, _020104B8 @ =sub_02010984
	str r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020104A4: .4byte 0xCEF118CF
_020104A8: .4byte 0x0000FB20
_020104AC: .4byte 0xFFFFCFFF
_020104B0: .4byte gPlayer
_020104B4: .4byte 0xBFFFFFFF
_020104B8: .4byte sub_02010984

	thumb_func_start sub_020104BC
sub_020104BC: @ 0x020104BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02010528
	movs r6, #4
	ands r1, r6
	cmp r1, #0
	beq _02010520
	adds r0, r5, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010514 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x64
	movs r4, #0
	strh r6, [r0]
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	orrs r0, r6
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x99
	strb r4, [r0]
	ldr r0, _02010518 @ =gPlayer
	ldr r1, _0201051C @ =sub_0200F7EC
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _02010540
	.align 2, 0
_02010514: .4byte 0xFFFFBFFF
_02010518: .4byte gPlayer
_0201051C: .4byte sub_0200F7EC
_02010520:
	adds r0, r5, #0
	bl sub_0200F2BC
	b _02010540
_02010528:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _02010548 @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r5, #0x20]
	ldr r0, _0201054C @ =gPlayer
	ldr r1, _02010550 @ =sub_02010554
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_02010540:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010548: .4byte 0xFEFFFFDF
_0201054C: .4byte gPlayer
_02010550: .4byte sub_02010554

	thumb_func_start sub_02010554
sub_02010554: @ 0x02010554
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0201058E
	adds r2, r1, #0
_0201058E:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _020105B0
	adds r1, #2
	cmp r1, #0
	ble _020105BC
	b _020105BA
_020105B0:
	cmp r1, #0
	ble _020105BC
	subs r1, #2
	cmp r1, #0
	bge _020105BC
_020105BA:
	movs r1, #0
_020105BC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_0200DBE0
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _020105DC
	ldr r1, _020105E4 @ =gPlayer
	ldr r0, _020105E8 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_020105DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020105E4: .4byte gPlayer
_020105E8: .4byte sub_0200F2BC

	thumb_func_start sub_020105EC
sub_020105EC: @ 0x020105EC
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	movs r0, #0x78
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02010606
	rsbs r1, r1, #0
_02010606:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	bgt _02010644
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0xa0
	bgt _02010634
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	bge _02010624
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010636
_02010624:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010634
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010636
_02010634:
	ldr r0, _02010640 @ =0x0000FE80
_02010636:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	b _0201065C
	.align 2, 0
_02010640: .4byte 0x0000FE80
_02010644:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _02010652
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010654
_02010652:
	ldr r0, _020106B4 @ =0x0000FE80
_02010654:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x15
_0201065C:
	strh r0, [r1]
	movs r2, #0
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	ldr r1, _020106B8 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #0xe
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _020106BC @ =0xFFFFFDF3
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _020106C0 @ =gPlayer
	ldr r1, _020106C4 @ =sub_020106C8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020106B4: .4byte 0x0000FE80
_020106B8: .4byte 0xCEF118CF
_020106BC: .4byte 0xFFFFFDF3
_020106C0: .4byte gPlayer
_020106C4: .4byte sub_020106C8

	thumb_func_start sub_020106C8
sub_020106C8: @ 0x020106C8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020106F0
	adds r2, r1, #0
_020106F0:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r1, [r4, #0x12]
	movs r2, #0
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0201070C
	cmp r1, #0
	beq _02010718
_0201070C:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x18
_02010718:
	adds r0, r2, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010750
	cmp r0, #1
	bgt _02010736
	cmp r0, #0
	beq _02010740
	b _0201075E
_02010736:
	cmp r0, #2
	beq _02010748
	cmp r0, #3
	beq _02010758
	b _0201075E
_02010740:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _0201075E
_02010748:
	adds r0, r4, #0
	bl sub_0200D918
	b _0201075E
_02010750:
	adds r0, r4, #0
	bl sub_0200DA10
	b _0201075E
_02010758:
	adds r0, r4, #0
	bl sub_0200DAC8
_0201075E:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0201077A
	ldr r1, _02010780 @ =gPlayer
	ldr r0, _02010784 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
_0201077A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02010780: .4byte gPlayer
_02010784: .4byte sub_0200F2BC

	thumb_func_start sub_02010788
sub_02010788: @ 0x02010788
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	lsrs r6, r0, #4
	movs r5, #3
	ands r5, r0
	ldr r0, [r4, #0x20]
	ldr r1, _020107D4 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _020107DC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _020107DC
	ldr r0, _020107D8 @ =0xFFFFFEFD
	ands r1, r0
	str r1, [r4, #0x20]
	b _020107E6
	.align 2, 0
_020107D4: .4byte 0xCEF118CF
_020107D8: .4byte 0xFFFFFEFD
_020107DC:
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_020107E6:
	ldr r0, [r4, #0x20]
	ldr r1, _02010818 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02010808
	rsbs r1, r1, #0
_02010808:
	ldr r0, _0201081C @ =0x0000027F
	cmp r1, r0
	bgt _02010820
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x26
	b _02010826
	.align 2, 0
_02010818: .4byte 0xFEFFFFDF
_0201081C: .4byte 0x0000027F
_02010820:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
_02010826:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x66
	ldr r0, _02010840 @ =0x0000FFFF
	strh r0, [r1]
	cmp r6, #7
	bls _02010836
	b _0201093A
_02010836:
	lsls r0, r6, #2
	ldr r1, _02010844 @ =_02010848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010840: .4byte 0x0000FFFF
_02010844: .4byte _02010848
_02010848: @ jump table
	.4byte _02010868 @ case 0
	.4byte _02010878 @ case 1
	.4byte _02010884 @ case 2
	.4byte _020108B0 @ case 3
	.4byte _020108DC @ case 4
	.4byte _020108FC @ case 5
	.4byte _02010918 @ case 6
	.4byte _02010928 @ case 7
_02010868:
	ldr r0, _02010874 @ =gUnknown_02015E56
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_02010874: .4byte gUnknown_02015E56
_02010878:
	ldr r0, _02010880 @ =gUnknown_02015E56
	lsls r1, r5, #1
	b _02010934
	.align 2, 0
_02010880: .4byte gUnknown_02015E56
_02010884:
	ldr r1, _020108A8 @ =gUnknown_02015E5E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r2, r0, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0201093A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r1, _020108AC @ =0xFFFFF700
	cmp r0, r1
	bge _0201093A
	b _020108CE
	.align 2, 0
_020108A8: .4byte gUnknown_02015E5E
_020108AC: .4byte 0xFFFFF700
_020108B0:
	ldr r1, _020108D8 @ =gUnknown_02015E5E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0201093A
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x14
	cmp r1, r0
	ble _0201093A
_020108CE:
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #1
	strb r0, [r1]
	b _0201093A
	.align 2, 0
_020108D8: .4byte gUnknown_02015E5E
_020108DC:
	ldr r0, _020108F4 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _020108F8 @ =gUnknown_02015E56
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_020108F4: .4byte gUnknown_02015E5E
_020108F8: .4byte gUnknown_02015E56
_020108FC:
	ldr r0, _02010910 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	ldr r0, _02010914 @ =gUnknown_02015E56
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_02010910: .4byte gUnknown_02015E5E
_02010914: .4byte gUnknown_02015E56
_02010918:
	ldr r0, _02010924 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	b _02010930
	.align 2, 0
_02010924: .4byte gUnknown_02015E5E
_02010928:
	ldr r0, _02010970 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
_02010930:
	strh r0, [r4, #0x10]
	ldr r0, _02010974 @ =gUnknown_02015E56
_02010934:
	adds r1, r1, r0
	ldrh r0, [r1]
_02010938:
	strh r0, [r4, #0x12]
_0201093A:
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	ble _02010950
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_02010950:
	ldr r0, _02010978 @ =0xFFFFFEC0
	cmp r2, r0
	bge _0201095E
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_0201095E:
	ldr r0, _0201097C @ =gPlayer
	ldr r1, _02010980 @ =sub_02010984
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010970: .4byte gUnknown_02015E5E
_02010974: .4byte gUnknown_02015E56
_02010978: .4byte 0xFFFFFEC0
_0201097C: .4byte gPlayer
_02010980: .4byte sub_02010984

	thumb_func_start sub_02010984
sub_02010984: @ 0x02010984
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020109BE
	adds r2, r1, #0
_020109BE:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _020109E0
	adds r1, #2
	cmp r1, #0
	ble _020109EC
	b _020109EA
_020109E0:
	cmp r1, #0
	ble _020109EC
	subs r1, #2
	cmp r1, #0
	bge _020109EC
_020109EA:
	movs r1, #0
_020109EC:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _02010A00
	cmp r2, #0
	beq _02010A0C
_02010A00:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_02010A0C:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010A44
	cmp r0, #1
	bgt _02010A2A
	cmp r0, #0
	beq _02010A34
	b _02010A52
_02010A2A:
	cmp r0, #2
	beq _02010A3C
	cmp r0, #3
	beq _02010A4C
	b _02010A52
_02010A34:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _02010A52
_02010A3C:
	adds r0, r4, #0
	bl sub_0200D918
	b _02010A52
_02010A44:
	adds r0, r4, #0
	bl sub_0200DA10
	b _02010A52
_02010A4C:
	adds r0, r4, #0
	bl sub_0200DAC8
_02010A52:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010A6A
	ldr r1, _02010A70 @ =gPlayer
	ldr r0, _02010A74 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_02010A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010A70: .4byte gPlayer
_02010A74: .4byte sub_0200F2BC

	thumb_func_start sub_02010A78
sub_02010A78: @ 0x02010A78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _02010B04 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _02010B08 @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	adds r1, #2
	ldr r0, _02010B0C @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _02010ADC
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_02010ADC:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, _02010B10 @ =0xFFFFFEC0
	cmp r1, r0
	bge _02010AEE
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_02010AEE:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #5
	bls _02010AFA
	b _02010C0C
_02010AFA:
	lsls r0, r0, #2
	ldr r1, _02010B14 @ =_02010B18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010B04: .4byte 0xCEF118CF
_02010B08: .4byte 0xFEFFFFD7
_02010B0C: .4byte 0x0000FFFF
_02010B10: .4byte 0xFFFFFEC0
_02010B14: .4byte _02010B18
_02010B18: @ jump table
	.4byte _02010B30 @ case 0
	.4byte _02010B6C @ case 1
	.4byte _02010B6C @ case 2
	.4byte _02010BA8 @ case 3
	.4byte _02010BD4 @ case 4
	.4byte _02010BD4 @ case 5
_02010B30:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010B3E
	adds r0, #7
_02010B3E:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010B4A
	rsbs r0, r0, #0
_02010B4A:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010B68 @ =0xFFFFFC40
	b _02010C08
	.align 2, 0
_02010B68: .4byte 0xFFFFFC40
_02010B6C:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010B7A
	adds r0, #7
_02010B7A:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010B86
	rsbs r0, r0, #0
_02010B86:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010BA4 @ =0xFFFFF880
	b _02010C08
	.align 2, 0
_02010BA4: .4byte 0xFFFFF880
_02010BA8:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010BB6
	adds r0, #7
_02010BB6:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010BC2
	rsbs r0, r0, #0
_02010BC2:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #3
	b _02010BFE
_02010BD4:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010BE2
	adds r0, #7
_02010BE2:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010BEE
	rsbs r0, r0, #0
_02010BEE:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #4
_02010BFE:
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010C34 @ =0xFFFFFD80
_02010C08:
	adds r0, r0, r1
	strh r0, [r4, #0x12]
_02010C0C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010C1C
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_02010C1C:
	movs r0, #0x19
	bl m4aSongNumStart
	ldr r0, _02010C38 @ =gPlayer
	ldr r1, _02010C3C @ =sub_02010C40
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010C34: .4byte 0xFFFFFD80
_02010C38: .4byte gPlayer
_02010C3C: .4byte sub_02010C40

	thumb_func_start sub_02010C40
sub_02010C40: @ 0x02010C40
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x28
	bne _02010C64
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _02010C64
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _02010C64
	movs r0, #1
	strh r0, [r1]
_02010C64:
	adds r0, r4, #0
	bl sub_0200E650
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r6, #0x10
	ldrsh r2, [r4, r6]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _02010C90
	adds r2, r1, #0
_02010C90:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _02010CB2
	adds r1, #2
	cmp r1, #0
	ble _02010CBE
	b _02010CBC
_02010CB2:
	cmp r1, #0
	ble _02010CBE
	subs r1, #2
	cmp r1, #0
	bge _02010CBE
_02010CBC:
	movs r1, #0
_02010CBE:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _02010CD2
	cmp r2, #0
	beq _02010CDE
_02010CD2:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_02010CDE:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010D16
	cmp r0, #1
	bgt _02010CFC
	cmp r0, #0
	beq _02010D06
	b _02010D24
_02010CFC:
	cmp r0, #2
	beq _02010D0E
	cmp r0, #3
	beq _02010D1E
	b _02010D24
_02010D06:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _02010D24
_02010D0E:
	adds r0, r4, #0
	bl sub_0200D918
	b _02010D24
_02010D16:
	adds r0, r4, #0
	bl sub_0200DA10
	b _02010D24
_02010D1E:
	adds r0, r4, #0
	bl sub_0200DAC8
_02010D24:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010D3C
	ldr r1, _02010D44 @ =gPlayer
	ldr r0, _02010D48 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_02010D3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010D44: .4byte gPlayer
_02010D48: .4byte sub_0200F2BC

	thumb_func_start sub_02010D4C
sub_02010D4C: @ 0x02010D4C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r2, r5, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #2
	bne _02010DC8
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _02010DB4 @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02010DC8
	ldr r4, _02010DB8 @ =gPlayer
	ldr r0, _02010DBC @ =sub_020118F8
	str r0, [r4]
	movs r0, #3
	strh r0, [r2]
	ldr r0, [r5, #0x20]
	ldr r1, _02010DC0 @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x26]
	strh r6, [r5, #0x10]
	strh r6, [r5, #0x12]
	strh r6, [r5, #0x14]
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r1, _02010DC4 @ =sub_0200FD90
	str r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
	movs r0, #1
	b _02010DCA
	.align 2, 0
_02010DB4: .4byte gUnknown_030057C8
_02010DB8: .4byte gPlayer
_02010DBC: .4byte sub_020118F8
_02010DC0: .4byte 0x00000404
_02010DC4: .4byte sub_0200FD90
_02010DC8:
	movs r0, #0
_02010DCA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_02010DD0
sub_02010DD0: @ 0x02010DD0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0xff
	ldr r5, [r4, #0x48]
	ldr r7, [r4, #0x4c]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _02010DE4
	b _02010F80
_02010DE4:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _02010DF4
	b _02010F80
_02010DF4:
	ldrh r3, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov ip, r3
	cmp r1, #0
	ble _02010E8A
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _02010E36
	adds r0, r1, #0
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bge _02010E20
	adds r0, r3, r5
	strh r0, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, r1
	ble _02010E2A
	strh r1, [r4, #0x14]
	b _02010E2A
_02010E20:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_02010E2A:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _02010FBA
_02010E36:
	ldr r0, _02010E54 @ =0x000001FF
	cmp r1, r0
	ble _02010E6C
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r0, r2, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #1
	bhi _02010E58
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _02010E66
	.align 2, 0
_02010E54: .4byte 0x000001FF
_02010E58:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _02010E66
	movs r6, #8
_02010E66:
	mov r1, ip
	subs r0, r1, r7
	b _02010EFA
_02010E6C:
	subs r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, #0
	bgt _02010E7C
	b _02010FBE
_02010E7C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010E88
	b _02010FBE
_02010E88:
	b _02010F1C
_02010E8A:
	cmp r1, #0
	bge _02010F3C
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _02010EC6
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0x44]
	rsbs r2, r0, #0
	cmp r1, r2
	ble _02010EB2
	subs r0, r3, r5
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _02010EBC
	strh r2, [r4, #0x14]
	b _02010EBC
_02010EB2:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_02010EBC:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _02010FBA
_02010EC6:
	ldr r0, _02010EE4 @ =0xFFFFFE00
	cmp r1, r0
	bgt _02010F04
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r0, r2, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #1
	bhi _02010EE8
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _02010EF6
	.align 2, 0
_02010EE4: .4byte 0xFFFFFE00
_02010EE8:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _02010EF6
	movs r6, #8
_02010EF6:
	mov r2, ip
	adds r0, r2, r7
_02010EFA:
	strh r0, [r4, #0x14]
	movs r0, #0xd
	bl m4aSongNumStart
	b _02010FBE
_02010F04:
	adds r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, #0
	bge _02010FBE
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010FBE
_02010F1C:
	ldrh r0, [r5]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02010F2A
	movs r6, #7
_02010F2A:
	ldr r1, _02010F34 @ =gPlayer
	ldr r0, _02010F38 @ =sub_020119F4
	str r0, [r1]
	b _02010FBE
	.align 2, 0
_02010F34: .4byte gPlayer
_02010F38: .4byte sub_020119F4
_02010F3C:
	ldr r1, [r4, #0x20]
	movs r0, #1
	ands r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	cmp r1, r0
	beq _02010F6E
	cmp r1, #0
	beq _02010F56
	subs r0, r3, r5
	b _02010F58
_02010F56:
	adds r0, r3, r5
_02010F58:
	strh r0, [r4, #0x14]
	movs r6, #9
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _02010FBA
_02010F6E:
	ldr r1, _02010F78 @ =gPlayer
	ldr r0, _02010F7C @ =sub_020119F4
	str r0, [r1]
	b _02010FBA
	.align 2, 0
_02010F78: .4byte gPlayer
_02010F7C: .4byte sub_020119F4
_02010F80:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _02010F9E
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bgt _02010F98
	movs r1, #0
	movs r6, #0
	b _02010F9A
_02010F98:
	movs r6, #9
_02010F9A:
	strh r1, [r4, #0x14]
	b _02010FBA
_02010F9E:
	cmp r0, #0
	bge _02010FB8
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	blt _02010FB2
	movs r1, #0
	movs r6, #0
	b _02010FB4
_02010FB2:
	movs r6, #9
_02010FB4:
	strh r1, [r4, #0x14]
	b _02010FBA
_02010FB8:
	movs r6, #0
_02010FBA:
	adds r5, r4, #0
	adds r5, #0x64
_02010FBE:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _02010FD6
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r1
	beq _02010FE6
	strh r1, [r5]
	b _02010FE6
_02010FD6:
	ldrh r0, [r5]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02010FE6
	movs r0, #9
	strh r0, [r5]
_02010FE6:
	adds r0, r4, #0
	bl sub_0200E2D8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02010FF4
sub_02010FF4: @ 0x02010FF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _02011008 @ =gRingCount
	ldrh r0, [r0]
	cmp r0, #0x95
	bls _0201100C
	adds r1, #0x52
	movs r0, #4
	b _0201102E
	.align 2, 0
_02011008: .4byte gRingCount
_0201100C:
	cmp r0, #0x63
	bls _02011016
	adds r1, #0x52
	movs r0, #3
	b _0201102E
_02011016:
	cmp r0, #0x31
	bls _02011020
	adds r1, #0x52
	movs r0, #2
	b _0201102E
_02011020:
	cmp r0, #0xa
	bls _0201102A
	adds r1, #0x52
	movs r0, #1
	b _0201102E
_0201102A:
	adds r1, #0x52
	movs r0, #0
_0201102E:
	strh r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_02011034
sub_02011034: @ 0x02011034
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x5a
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	cmp r2, #0
	beq _02011084
	ldr r4, [r3, #0x20]
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	bne _020110DA
	ldr r0, _0201107C @ =gUnknown_02015E32
	adds r1, r3, #0
	adds r1, #0x52
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0x14
	ldrsh r2, [r3, r0]
	cmp r2, #0
	bge _0201106C
	rsbs r2, r2, #0
_0201106C:
	ldr r0, _02011080 @ =0x0000047F
	cmp r2, r0
	bgt _020110DA
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	strh r4, [r1]
	b _020110DA
	.align 2, 0
_0201107C: .4byte gUnknown_02015E32
_02011080: .4byte 0x0000047F
_02011084:
	ldr r0, [r3, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020110D4
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _02011098
	rsbs r1, r1, #0
_02011098:
	ldr r0, [r3, #0x44]
	cmp r1, r0
	blt _020110D4
	adds r2, r3, #0
	adds r2, #0x58
	ldr r1, _020110CC @ =gUnknown_02015E32
	adds r0, r3, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _020110DA
	movs r0, #1
	mov r3, ip
	strb r0, [r3]
	ldr r1, _020110D0 @ =gCamera
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	b _020110DA
	.align 2, 0
_020110CC: .4byte gUnknown_02015E32
_020110D0: .4byte gCamera
_020110D4:
	adds r0, r3, #0
	adds r0, #0x58
	strh r2, [r0]
_020110DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_020110E0
sub_020110E0: @ 0x020110E0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _020110EE
	rsbs r2, r2, #0
_020110EE:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	bgt _020110FC
	adds r1, #0x54
	movs r0, #0
	b _02011138
_020110FC:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r2, r0
	bgt _0201110A
	adds r1, #0x54
	movs r0, #1
	b _02011138
_0201110A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _02011118
	adds r1, #0x54
	movs r0, #2
	b _02011138
_02011118:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	bgt _02011126
	adds r1, #0x54
	movs r0, #3
	b _02011138
_02011126:
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _02011134
	adds r1, #0x54
	movs r0, #4
	b _02011138
_02011134:
	adds r1, #0x54
	movs r0, #5
_02011138:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011140
sub_02011140: @ 0x02011140
	push {lr}
	bl sub_02011704
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201114C
sub_0201114C: @ 0x0201114C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r2, #0
	adds r0, r5, #0
	adds r0, #0x60
	movs r6, #0
	ldrsb r6, [r0, r6]
	ldr r0, _020111B0 @ =sub_0200E8B0
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _020111B4 @ =sub_020116D4
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r4, #0
	strb r6, [r0]
	str r4, [r0, #4]
	adds r0, r5, #0
	bl sub_0200D384
	ldr r1, _020111B8 @ =gPlayer
	ldr r0, _020111BC @ =sub_0200F2BC
	str r0, [r1]
	bl sub_02011B44
	ldr r0, _020111C0 @ =gUnknown_03005448
	str r4, [r0]
	ldr r0, _020111C4 @ =gUnknown_03005474
	str r4, [r0]
	ldr r0, _020111C8 @ =gUnknown_03005458
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_0200D2D8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020111B0: .4byte sub_0200E8B0
_020111B4: .4byte sub_020116D4
_020111B8: .4byte gPlayer
_020111BC: .4byte sub_0200F2BC
_020111C0: .4byte gUnknown_03005448
_020111C4: .4byte gUnknown_03005474
_020111C8: .4byte gUnknown_03005458

	thumb_func_start sub_020111CC
sub_020111CC: @ 0x020111CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x8c
	ldr r0, [r5]
	bl TaskDestroy
	movs r0, #0
	str r0, [r5]
	adds r4, #0x60
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _020111EC
	bl sub_02012248
_020111EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020111F4
sub_020111F4: @ 0x020111F4
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	ldr r1, _02011218 @ =0xCEF118CF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_02011218: .4byte 0xCEF118CF

	thumb_func_start sub_0201121C
sub_0201121C: @ 0x0201121C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bne _02011232
	cmp r2, #0
	beq _0201123E
_02011232:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0201123E:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02011276
	cmp r0, #1
	bgt _0201125C
	cmp r0, #0
	beq _02011266
	b _02011284
_0201125C:
	cmp r0, #2
	beq _0201126E
	cmp r0, #3
	beq _0201127E
	b _02011284
_02011266:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _02011284
_0201126E:
	adds r0, r4, #0
	bl sub_0200D918
	b _02011284
_02011276:
	adds r0, r4, #0
	bl sub_0200DA10
	b _02011284
_0201127E:
	adds r0, r4, #0
	bl sub_0200DAC8
_02011284:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201128C
sub_0201128C: @ 0x0201128C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _02011298
	mov r4, sp
_02011298:
	cmp r2, #0
	bne _0201129E
	add r2, sp, #4
_0201129E:
	adds r1, r4, #0
	bl sub_0200D4EC
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _020112B4
	movs r0, #0
	b _020112C6
_020112B4:
	ldr r0, _020112D4 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020112C8
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_020112C6:
	strb r0, [r4]
_020112C8:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020112D4: .4byte gStageFlags

	thumb_func_start sub_020112D8
sub_020112D8: @ 0x020112D8
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _020112E4
	mov r4, sp
_020112E4:
	cmp r2, #0
	bne _020112EA
	add r2, sp, #4
_020112EA:
	adds r1, r4, #0
	bl sub_0200D5C4
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _02011300
	movs r0, #0
	b _02011312
_02011300:
	ldr r0, _02011320 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02011314
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_02011312:
	strb r0, [r4]
_02011314:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02011320: .4byte gStageFlags

	thumb_func_start sub_02011324
sub_02011324: @ 0x02011324
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _02011330
	mov r4, sp
_02011330:
	cmp r2, #0
	bne _02011336
	add r2, sp, #4
_02011336:
	adds r1, r4, #0
	bl sub_0200D698
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0201134C
	movs r0, #0
	b _0201135E
_0201134C:
	ldr r0, _0201136C @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02011360
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_0201135E:
	strb r0, [r4]
_02011360:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0201136C: .4byte gStageFlags

	thumb_func_start sub_02011370
sub_02011370: @ 0x02011370
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _0201137C
	mov r4, sp
_0201137C:
	cmp r2, #0
	bne _02011382
	add r2, sp, #4
_02011382:
	adds r1, r4, #0
	bl sub_020113D4
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _02011398
	movs r0, #0
	b _020113AA
_02011398:
	ldr r0, _020113B8 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020113AC
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_020113AA:
	strb r0, [r4]
_020113AC:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020113B8: .4byte gStageFlags

	thumb_func_start sub_020113BC
sub_020113BC: @ 0x020113BC
	push {lr}
	bl sub_02011324
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020113C8
sub_020113C8: @ 0x020113C8
	push {lr}
	bl sub_02011370
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020113D4
sub_020113D4: @ 0x020113D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _020113EC
	add r6, sp, #8
_020113EC:
	cmp r7, #0
	bne _020113F2
	add r7, sp, #0xc
_020113F2:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _0201141C
	movs r0, #0x80
	orrs r2, r0
_0201141C:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _02011480 @ =sub_0200CFE0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _0201145C
	movs r0, #0x80
	orrs r2, r0
_0201145C:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _02011484
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0201148C
	.align 2, 0
_02011480: .4byte sub_0200CFE0
_02011484:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0201148C:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020114A0
sub_020114A0: @ 0x020114A0
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _020114D4
	ldr r1, _020114DC @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r2, r0, #5
	ldrh r1, [r3, #0x14]
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _020114D4
	adds r0, r1, r2
	strh r0, [r3, #0x14]
_020114D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020114DC: .4byte gSineTable

	thumb_func_start sub_020114E0
sub_020114E0: @ 0x020114E0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _0201150C
	ldr r1, _02011510 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	ldrh r1, [r3, #0x14]
	adds r0, r0, r1
	strh r0, [r3, #0x14]
_0201150C:
	pop {r0}
	bx r0
	.align 2, 0
_02011510: .4byte gSineTable

	thumb_func_start sub_02011514
sub_02011514: @ 0x02011514
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _0201155E
	cmp r2, #0
	beq _0201155E
	ldr r1, _02011550 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r1, r0, #8
	cmp r2, #0
	ble _02011554
	cmp r1, #0
	bgt _0201155A
	b _02011558
	.align 2, 0
_02011550: .4byte gSineTable
_02011554:
	cmp r1, #0
	blt _0201155A
_02011558:
	asrs r1, r0, #0xa
_0201155A:
	adds r2, r2, r1
	strh r2, [r4, #0x14]
_0201155E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_02011564
sub_02011564: @ 0x02011564
	push {lr}
	adds r2, r0, #0
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	ldr r1, [r2, #8]
	adds r1, r1, r0
	str r1, [r2, #8]
	ldrh r3, [r2, #0x12]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _02011582
	adds r3, r1, #0
_02011582:
	strh r3, [r2, #0x12]
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011594
sub_02011594: @ 0x02011594
	ldrh r1, [r0, #0x12]
	adds r1, #0x2a
	strh r1, [r0, #0x12]
	bx lr

	thumb_func_start sub_0201159C
sub_0201159C: @ 0x0201159C
	push {lr}
	ldr r2, _020115B8 @ =gCamera
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _020115B2
	ldr r0, [r2, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	cmp r1, r0
	bge _020115BC
_020115B2:
	movs r0, #0
	b _020115BE
	.align 2, 0
_020115B8: .4byte gCamera
_020115BC:
	movs r0, #1
_020115BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020115C4
sub_020115C4: @ 0x020115C4
	push {lr}
	ldr r2, _020115E0 @ =gCamera
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _020115DC
	ldr r0, [r2, #4]
	lsls r0, r0, #8
	ldr r2, _020115E4 @ =0x0000EFFF
	adds r0, r0, r2
	cmp r1, r0
	bge _020115E8
_020115DC:
	movs r0, #0
	b _020115EA
	.align 2, 0
_020115E0: .4byte gCamera
_020115E4: .4byte 0x0000EFFF
_020115E8:
	movs r0, #1
_020115EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020115F0
sub_020115F0: @ 0x020115F0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _02011624 @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02011630
	adds r0, r3, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	bl sub_0200E108
	cmp r0, #3
	ble _02011630
	ldr r1, _02011628 @ =gPlayer
	ldr r0, _0201162C @ =sub_0200F9B8
	str r0, [r1]
	movs r0, #1
	b _02011632
	.align 2, 0
_02011624: .4byte gUnknown_030057C8
_02011628: .4byte gPlayer
_0201162C: .4byte sub_0200F9B8
_02011630:
	movs r0, #0
_02011632:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011638
sub_02011638: @ 0x02011638
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _0201164A
	subs r0, #1
	b _02011676
_0201164A:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _02011678
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _02011664
	rsbs r1, r1, #0
_02011664:
	ldr r0, _0201167C @ =0x000001DF
	cmp r1, r0
	bgt _02011678
	strh r3, [r2, #0x14]
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1e
_02011676:
	strh r0, [r2, #0x2a]
_02011678:
	pop {r0}
	bx r0
	.align 2, 0
_0201167C: .4byte 0x000001DF

	thumb_func_start sub_02011680
sub_02011680: @ 0x02011680
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _02011696
	adds r1, #2
	cmp r1, #0
	ble _020116A2
	b _020116A0
_02011696:
	cmp r1, #0
	ble _020116A2
	subs r1, #2
	cmp r1, #0
	bge _020116A2
_020116A0:
	movs r1, #0
_020116A2:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	pop {r0}
	bx r0

	thumb_func_start sub_020116AC
sub_020116AC: @ 0x020116AC
	ldr r0, _020116BC @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0x17
	orrs r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020116BC: .4byte gPlayer

	thumb_func_start sub_020116C0
sub_020116C0: @ 0x020116C0
	ldr r0, _020116CC @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _020116D0 @ =0xBFFFFFFF
	ands r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020116CC: .4byte gPlayer
_020116D0: .4byte 0xBFFFFFFF

	thumb_func_start sub_020116D4
sub_020116D4: @ 0x020116D4
	push {lr}
	ldr r2, _02011700 @ =gPlayer
	adds r1, r2, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _020116FA
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_020116FA:
	pop {r0}
	bx r0
	.align 2, 0
_02011700: .4byte gPlayer

	thumb_func_start sub_02011704
sub_02011704: @ 0x02011704
	mov ip, r3
	mov r1, ip
	adds r1, #0x60
	movs r3, #0
	strb r2, [r1]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _02011750 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x74
	movs r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb1
	strh r0, [r1]
	subs r0, #0xb2
	mov r1, ip
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	mov r0, ip
	adds r0, #0x98
	strb r2, [r0]
	str r3, [r1, #0x78]
	adds r1, #0x90
	ldr r0, _02011754 @ =gUnknown_03005780
	str r0, [r1]
	bx lr
	.align 2, 0
_02011750: .4byte 0x04000128
_02011754: .4byte gUnknown_03005780

	thumb_func_start sub_02011758
sub_02011758: @ 0x02011758
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _02011784
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02011784
	ldr r1, _0201177C @ =gPlayer
	ldr r0, _02011780 @ =sub_02011A50
	str r0, [r1]
	movs r0, #1
	b _02011786
	.align 2, 0
_0201177C: .4byte gPlayer
_02011780: .4byte sub_02011A50
_02011784:
	movs r0, #0
_02011786:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0201178C
sub_0201178C: @ 0x0201178C
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0201180C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _020117D8
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _020117D8
	ldr r0, [r2, #0x20]
	ldr r1, _020117CC @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _020117D8
	ldr r1, _020117D0 @ =gPlayer
	ldr r0, _020117D4 @ =sub_020118C8
	str r0, [r1]
	movs r0, #1
	b _0201180E
	.align 2, 0
_020117CC: .4byte 0x01000006
_020117D0: .4byte gPlayer
_020117D4: .4byte sub_020118C8
_020117D8:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0201180C
	ldr r0, [r2, #0x20]
	ldr r1, _02011800 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0201180C
	ldr r1, _02011804 @ =gPlayer
	ldr r0, _02011808 @ =sub_02011874
	str r0, [r1]
	movs r0, #0xb
	bl m4aSongNumStart
	movs r0, #1
	b _0201180E
	.align 2, 0
_02011800: .4byte 0x01000006
_02011804: .4byte gPlayer
_02011808: .4byte sub_02011874
_0201180C:
	movs r0, #0
_0201180E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011814
sub_02011814: @ 0x02011814
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _02011830
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _02011850
_02011830:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _02011846
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _02011850
_02011846:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_02011850:
	str r0, [r3, #0x40]
	ldr r1, _02011870 @ =gUnknown_02015E1E
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [r3, #0x48]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	str r0, [r3, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02011870: .4byte gUnknown_02015E1E

	thumb_func_start sub_02011874
sub_02011874: @ 0x02011874
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _020118BC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x64
	movs r6, #0
	movs r5, #4
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x99
	strb r6, [r0]
	ldr r0, _020118C0 @ =gPlayer
	ldr r1, _020118C4 @ =sub_0200F7EC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020118BC: .4byte 0xFFFFBFFF
_020118C0: .4byte gPlayer
_020118C4: .4byte sub_0200F7EC

	thumb_func_start sub_020118C8
sub_020118C8: @ 0x020118C8
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #2
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _020118F0 @ =gPlayer
	ldr r2, _020118F4 @ =sub_0200F684
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_020118F0: .4byte gPlayer
_020118F4: .4byte sub_0200F684

	thumb_func_start sub_020118F8
sub_020118F8: @ 0x020118F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _02011944 @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r0, _02011948 @ =gPlayer
	ldr r1, _0201194C @ =sub_0200FD90
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011944: .4byte 0x00000404
_02011948: .4byte gPlayer
_0201194C: .4byte sub_0200FD90

	thumb_func_start sub_02011950
sub_02011950: @ 0x02011950
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r2, sp, #4
	mov r1, sp
	bl sub_02011370
	cmp r0, #0
	bgt _02011982
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0200D770
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_02011982:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201198C
sub_0201198C: @ 0x0201198C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _020119AC
	ldr r1, _020119B0 @ =gPlayer
	ldr r0, _020119B4 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_020119AC:
	pop {r0}
	bx r0
	.align 2, 0
_020119B0: .4byte gPlayer
_020119B4: .4byte sub_0200F2BC

	thumb_func_start sub_020119B8
sub_020119B8: @ 0x020119B8
	push {r4, lr}
	adds r1, r0, #0
	movs r3, #0x2a
	ldrh r2, [r1, #0x12]
	movs r4, #0x12
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bge _020119CA
	movs r3, #0x15
_020119CA:
	adds r0, r2, r3
	strh r0, [r1, #0x12]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_020119D4
sub_020119D4: @ 0x020119D4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _020119F0
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _020119F0
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_020119F0:
	pop {r0}
	bx r0

	thumb_func_start sub_020119F4
sub_020119F4: @ 0x020119F4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02011A16
	movs r0, #6
	b _02011A18
_02011A16:
	movs r0, #5
_02011A18:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _02011A44 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _02011A48 @ =gPlayer
	ldr r1, _02011A4C @ =sub_0200F420
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_02011A44: .4byte 0xFFFFBFFF
_02011A48: .4byte gPlayer
_02011A4C: .4byte sub_0200F420

	thumb_func_start sub_02011A50
sub_02011A50: @ 0x02011A50
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x90
	ldr r3, [r1]
	ldr r1, [r3, #0x1c]
	ldr r2, _02011A84 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _02011A88 @ =gPlayer
	ldr r2, _02011A8C @ =sub_0200F520
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_02011A84: .4byte 0xFFFFBFFF
_02011A88: .4byte gPlayer
_02011A8C: .4byte sub_0200F520

	thumb_func_start sub_02011A90
sub_02011A90: @ 0x02011A90
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02011AEA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _02011ACC
	cmp r1, #0x20
	bne _02011AEA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _02011AC0
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _02011AEA
_02011AC0:
	subs r0, #0x18
	cmp r0, #0
	bge _02011AE8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _02011AE8
_02011ACC:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _02011AE0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _02011AEA
_02011AE0:
	adds r0, #0x18
	cmp r0, #0
	ble _02011AE8
	movs r0, #0x60
_02011AE8:
	strh r0, [r2, #0x14]
_02011AEA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011AF0
sub_02011AF0: @ 0x02011AF0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02011B38 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r2, ip
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _02011B3C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02011B40 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_02011B38: .4byte 0xFFFFCFFF
_02011B3C: .4byte gPlayer
_02011B40: .4byte 0xBFFFFFFF

	thumb_func_start sub_02011B44
sub_02011B44: @ 0x02011B44
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _02011BD8 @ =gUnknown_030057C4
	ldr r0, _02011BDC @ =sub_02012260
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _02011BE0 @ =0x00002001
	ldr r3, _02011BE4 @ =sub_0201226C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _02011BE8 @ =0x06012E40
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	movs r0, #0x6a
	strh r0, [r1, #0xa]
	ldr r2, _02011BEC @ =gUnknown_03000020
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _02011BF0 @ =gUnknown_03000021
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _02011BF4 @ =gUnknown_03000022
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _02011BF8 @ =gUnknown_03000025
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _02011BFC @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _02011C00 @ =gUnknown_030002B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _02011C04 @ =gUnknown_030002B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _02011C08 @ =gUnknown_030002B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _02011C0C @ =gUnknown_03000030
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _02011C10 @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _02011C14 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011BD8: .4byte gUnknown_030057C4
_02011BDC: .4byte sub_02012260
_02011BE0: .4byte 0x00002001
_02011BE4: .4byte sub_0201226C
_02011BE8: .4byte 0x06012E40
_02011BEC: .4byte gUnknown_03000020
_02011BF0: .4byte gUnknown_03000021
_02011BF4: .4byte gUnknown_03000022
_02011BF8: .4byte gUnknown_03000025
_02011BFC: .4byte 0x00042200
_02011C00: .4byte gUnknown_030002B6
_02011C04: .4byte gUnknown_030002B4
_02011C08: .4byte gUnknown_030002B0
_02011C0C: .4byte gUnknown_03000030
_02011C10: .4byte 0x040000D4
_02011C14: .4byte 0x81000140

	thumb_func_start InitScatteringRings
InitScatteringRings: @ 0x02011C18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _02011C9C @ =gUnknown_030057C4
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _02011CA0 @ =gUnknown_03000030
	adds r4, r0, r1
	ldr r6, _02011CA4 @ =gPlayer
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	beq _02011D2E
	cmp r7, #0x20
	ble _02011C46
	movs r7, #0x20
_02011C46:
	ldr r0, _02011CA8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _02011C54
	cmp r7, #0x10
	ble _02011C54
	movs r7, #0x10
_02011C54:
	movs r0, #0x10
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _02011CAC @ =gSineTable
	mov sl, r1
	ldr r0, _02011CB0 @ =gPseudoRandom
	mov sb, r0
_02011C6C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _02011D22
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _02011CE4
	asrs r2, r3, #8
	cmp r2, #5
	ble _02011CB4
	rsbs r0, r2, #0
	adds r0, #9
	b _02011CB6
	.align 2, 0
_02011C9C: .4byte gUnknown_030057C4
_02011CA0: .4byte gUnknown_03000030
_02011CA4: .4byte gPlayer
_02011CA8: .4byte gGameMode
_02011CAC: .4byte gSineTable
_02011CB0: .4byte gPseudoRandom
_02011CB4:
	adds r0, r2, #0
_02011CB6:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r0, #0x80
	orrs r3, r0
_02011CE4:
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	movs r1, #0
	strh r1, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _02011D40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02011D44 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _02011D0E
	movs r0, #4
	strh r0, [r4, #0x10]
_02011D0E:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _02011D2E
_02011D22:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _02011C6C
_02011D2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02011D40: .4byte 0x00196225
_02011D44: .4byte 0x3C6EF35F

	thumb_func_start sub_02011D48
sub_02011D48: @ 0x02011D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _02011D98 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _02011D9C @ =gUnknown_03000030
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _02011DA0 @ =gUnknown_030002B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _02011DA4 @ =gUnknown_030002B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x18]
_02011D88:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _02011DA8
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011D98: .4byte gCurTask
_02011D9C: .4byte gUnknown_03000030
_02011DA0: .4byte gUnknown_030002B0
_02011DA4: .4byte gUnknown_030002B4
_02011DA8:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _02011DD6
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _02012216
_02011DD6:
	ldr r0, _02011DF4 @ =0x0000EFFF
	cmp r2, r0
	bgt _02011DFC
	ldr r0, _02011DF8 @ =0x00011FFF
	cmp r3, r0
	bgt _02011DFC
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _02011E1A
	.align 2, 0
_02011DF4: .4byte 0x0000EFFF
_02011DF8: .4byte 0x00011FFF
_02011DFC:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _02011E1C
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02011E1C
	ldr r3, _02011F40 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _02011F44 @ =0xFFFCA000
	adds r0, r1, r4
_02011E1A:
	str r0, [r5, #4]
_02011E1C:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r7, r0, #8
	ldr r1, _02011F48 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov r8, r0
	ldr r3, _02011F4C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	ble _02011E58
	b _0201205E
_02011E58:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _02011E6E
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _02011F60
_02011E6E:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02011F60
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011E9C
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _02011EA8
	cmp r2, r1
	blt _02011F60
_02011E9C:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011EA8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011EC4
	cmp r7, r1
	bge _02011ED0
	cmp r2, r1
	blt _02011F60
_02011EC4:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011ED0:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BD0C
	ldr r1, _02011F50 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _02011F54 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02011F1C
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _02011F1C
	ldr r0, _02011F58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _02011F1C
	ldr r1, _02011F5C @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _02011F1C
	adds r0, #1
	strb r0, [r1]
_02011F1C:
	ldr r0, _02011F58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02011F30
	ldr r1, _02011F50 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _02011F30
	movs r0, #0xff
	strh r0, [r1]
_02011F30:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011F40: .4byte 0xFFFA6000
_02011F44: .4byte 0xFFFCA000
_02011F48: .4byte gCamera
_02011F4C: .4byte gPlayer
_02011F50: .4byte gRingCount
_02011F54: .4byte gCurrentLevel
_02011F58: .4byte gGameMode
_02011F5C: .4byte gNumLives
_02011F60:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	bgt _0201205E
	movs r2, #0
	mov ip, r2
_02011F76:
	ldr r0, _02012034 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp ip, r0
	beq _02012050
	ldr r1, _02012038 @ =gMultiplayerPlayerTasks
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _02012050
	ldrh r2, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r6, r2, r4
	ldr r1, _0201203C @ =gUnknown_0300006A
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02011FB6
	ldr r3, _02012040 @ =gUnknown_03000054
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _02012050
_02011FB6:
	mov r4, sb
	subs r4, #8
	ldr r1, _02012044 @ =gUnknown_03000050
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _02012048 @ =gUnknown_0300002C
	adds r0, r2, r3
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r1, r1, r3
	cmp r4, r1
	bgt _02011FDC
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _02011FEC
	cmp r4, r1
	blt _02012050
_02011FDC:
	ldr r0, _0201204C @ =gUnknown_0300002E
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r4
	blt _02012050
_02011FEC:
	adds r3, r7, #0
	subs r3, #0x10
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _0201200E
	cmp r7, r1
	bge _02012020
	cmp r3, r1
	blt _02012050
_0201200E:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _02012050
_02012020:
	mov r2, sb
	lsls r0, r2, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BD0C
	movs r0, #0
	b _02012212
	.align 2, 0
_02012034: .4byte 0x04000128
_02012038: .4byte gMultiplayerPlayerTasks
_0201203C: .4byte gUnknown_0300006A
_02012040: .4byte gUnknown_03000054
_02012044: .4byte gUnknown_03000050
_02012048: .4byte gUnknown_0300002C
_0201204C: .4byte gUnknown_0300002E
_02012050:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #3
	bls _02011F76
_0201205E:
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _02012098
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _02012098
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _02012118 @ =sub_0200CDB8
	str r0, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_0200D27C
	cmp r0, #0
	bgt _02012098
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_02012098:
	ldr r1, [sp, #4]
	ldr r2, _0201211C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _020120E6
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bge _020120E6
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _020120E6
	adds r0, r7, #0
	subs r0, #0x10
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r1, _02012118 @ =sub_0200CDB8
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200D27C
	cmp r0, #0
	bgt _020120E6
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_020120E6:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _02012104
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _02012104
	mov r2, r8
	cmp r2, #0xa7
	ble _02012134
_02012104:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02012128
	ldr r3, _02012120 @ =0xFFFFFA60
	add sl, r3
	ldr r4, _02012124 @ =0xFFFFFCA0
	add r8, r4
	b _02012134
	.align 2, 0
_02012118: .4byte sub_0200CDB8
_0201211C: .4byte 0x000002B6
_02012120: .4byte 0xFFFFFA60
_02012124: .4byte 0xFFFFFCA0
_02012128:
	movs r0, #0xb4
	lsls r0, r0, #3
	add sl, r0
	movs r1, #0xd8
	lsls r1, r1, #2
	add r8, r1
_02012134:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _020121FA
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _020121FA
	mov r2, r8
	cmp r2, #0xa7
	bgt _020121FA
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _0201215C
	ldr r0, _02012188 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020121FA
_0201215C:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r3, [sp, #0x14]
	cmp r3, #0
	beq _0201216E
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0201218C
_0201216E:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sl
	ldr r4, [sp, #8]
	strh r0, [r4, #0x16]
	mov r1, r8
	strh r1, [r4, #0x18]
	ldr r0, [sp, #8]
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x14]
	b _020121FA
	.align 2, 0
_02012188: .4byte gStageTime
_0201218C:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _02012230 @ =gOamBuffer2
	adds r4, r0, r1
	ldr r3, [sp, #8]
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _02012234 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _020121FA
	ldr r1, _02012238 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0201223C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _02012240 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_020121FA:
	ldrh r1, [r5, #0x10]
	ldr r2, _02012244 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_02012212:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_02012216:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _02012220
	b _02011D88
_02012220:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012230: .4byte gOamBuffer2
_02012234: .4byte iwram_end
_02012238: .4byte 0x040000D4
_0201223C: .4byte 0x80000003
_02012240: .4byte 0x000001FF
_02012244: .4byte 0x0000FFFC

	thumb_func_start sub_02012248
sub_02012248: @ 0x02012248
	push {r4, lr}
	ldr r4, _0201225C @ =gUnknown_030057C4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0201225C: .4byte gUnknown_030057C4

	thumb_func_start sub_02012260
sub_02012260: @ 0x02012260
	push {lr}
	bl sub_02011D48
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201226C
sub_0201226C: @ 0x0201226C
	ldr r1, _02012274 @ =gUnknown_030057C4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012274: .4byte gUnknown_030057C4

	thumb_func_start sub_02012278
sub_02012278: @ 0x02012278
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _020122AC @ =gUnknown_030057C8
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_02012292:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _020122C6
	cmp r1, #1
	bgt _020122B0
	cmp r1, #0
	beq _020122B6
	b _020122E2
	.align 2, 0
_020122AC: .4byte gUnknown_030057C8
_020122B0:
	cmp r1, #2
	beq _020122D4
	b _020122E2
_020122B6:
	cmp r2, #2
	bne _020122BE
	strh r5, [r4]
	b _020122E2
_020122BE:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _020122E2
_020122C6:
	cmp r2, #2
	bne _020122CE
	strh r5, [r4, #2]
	b _020122E2
_020122CE:
	lsls r1, r2
	strh r1, [r4, #2]
	b _020122E2
_020122D4:
	cmp r2, #2
	bne _020122DC
	strh r5, [r4, #4]
	b _020122E2
_020122DC:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_020122E2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _02012292
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_020122F8
sub_020122F8: @ 0x020122F8
	ldr r3, _02012304 @ =gUnknown_030057C8
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_02012304: .4byte gUnknown_030057C8

	thumb_func_start CreateGameStage
CreateGameStage: @ 0x02012308
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _02012424 @ =Task_GameStage
	movs r2, #0xff
	lsls r2, r2, #8
	ldr r1, _02012428 @ =TaskDestructor_GameStage
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _0201242C @ =gActiveCollectRingEffectCount
	str r0, [r1]
	ldr r0, _02012430 @ =gSpecialRingCount
	movs r4, #0
	strb r4, [r0]
	ldr r0, _02012434 @ =gUnknown_030054B0
	strb r4, [r0]
	ldr r0, _02012438 @ =gUnknown_03005428
	strb r4, [r0]
	ldr r5, _0201243C @ =gStageFlags
	ldrh r0, [r5]
	movs r1, #0x21
	orrs r0, r1
	ldr r1, _02012440 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r5]
	ldr r0, _02012444 @ =gUnknown_030053E4
	strb r4, [r0]
	ldr r1, _02012448 @ =gUnknown_030053E0
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _0201244C @ =gUnknown_03005530
	strb r4, [r0]
	bl sub_0200D1C0
	ldr r0, _02012450 @ =gUnknown_030053A0
	strb r4, [r0]
	ldr r1, _02012454 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012372
	ldr r0, _02012458 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0201245C @ =gPlayer
	bl sub_0201114C
_02012372:
	movs r0, #0
	bl InitCamera
	bl StageInit_CollectRings
	bl CreateCollectRingsTimeDisplay
	ldr r2, _0201245C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _02012460 @ =0xFF9FFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrh r0, [r5]
	ldr r2, _02012464 @ =0x0000FFFE
	ands r2, r0
	ldr r0, _02012468 @ =0x0000FFFD
	ands r2, r0
	subs r0, #2
	ands r2, r0
	strh r2, [r5]
	ldr r6, _0201246C @ =gGameMode
	ldrb r0, [r6]
	cmp r0, #5
	bne _020123AA
	movs r1, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_020123AA:
	bl CreateStageRingsManager
	bl CreateStageEntitiesManager
	ldr r0, _02012470 @ =gUnknown_03001944
	movs r4, #0
	strh r4, [r0]
	ldr r0, _02012474 @ =gUnknown_030017F0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _02012478 @ =gUnknown_03005394
	strh r1, [r0]
	ldr r0, _0201247C @ =gUnknown_03002A8C
	movs r2, #0x78
	strh r2, [r0]
	ldr r0, _02012480 @ =gUnknown_03004D58
	movs r1, #0x50
	strh r1, [r0]
	ldr r0, _02012484 @ =gUnknown_0300194C
	strh r2, [r0]
	ldr r0, _02012488 @ =gUnknown_03002820
	strh r1, [r0]
	ldr r1, _0201248C @ =gUnknown_03005398
	movs r0, #0x80
	strh r0, [r1]
	ldrb r0, [r6]
	cmp r0, #2
	bls _020124D6
	bl CreateMultiplayerReceiveEventMgr
	bl CreateMultiplayerSendEventMgr
	ldr r0, _02012490 @ =gRandomItemBox
	strb r4, [r0]
	movs r4, #0
_020123F4:
	ldr r0, _02012494 @ =gMultiplayerCharRings
	adds r0, r4, r0
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012498 @ =gMultiplayerConnections
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020124A4
	adds r0, r4, #0
	bl CreateMultiplayerPlayer
	ldr r0, _0201249C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _020124A0
	adds r0, r4, #0
	bl CreateOpponentPositionIndicator
	b _020124A4
	.align 2, 0
_02012424: .4byte Task_GameStage
_02012428: .4byte TaskDestructor_GameStage
_0201242C: .4byte gActiveCollectRingEffectCount
_02012430: .4byte gSpecialRingCount
_02012434: .4byte gUnknown_030054B0
_02012438: .4byte gUnknown_03005428
_0201243C: .4byte gStageFlags
_02012440: .4byte 0x0000FF7F
_02012444: .4byte gUnknown_030053E4
_02012448: .4byte gUnknown_030053E0
_0201244C: .4byte gUnknown_03005530
_02012450: .4byte gUnknown_030053A0
_02012454: .4byte gCurrentLevel
_02012458: .4byte gSelectedCharacter
_0201245C: .4byte gPlayer
_02012460: .4byte 0xFF9FFFFF
_02012464: .4byte 0x0000FFFE
_02012468: .4byte 0x0000FFFD
_0201246C: .4byte gGameMode
_02012470: .4byte gUnknown_03001944
_02012474: .4byte gUnknown_030017F0
_02012478: .4byte gUnknown_03005394
_0201247C: .4byte gUnknown_03002A8C
_02012480: .4byte gUnknown_03004D58
_02012484: .4byte gUnknown_0300194C
_02012488: .4byte gUnknown_03002820
_0201248C: .4byte gUnknown_03005398
_02012490: .4byte gRandomItemBox
_02012494: .4byte gMultiplayerCharRings
_02012498: .4byte gMultiplayerConnections
_0201249C: .4byte 0x04000128
_020124A0:
	bl CreateSelfPositionIndicator
_020124A4:
	ldr r0, _020124E0 @ =gUnknown_030054B4
	adds r0, r4, r0
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, _020124E4 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #5
	bne _020124BA
	ldr r0, _020124E8 @ =gMultiplayerCharacters
	adds r0, r4, r0
	strb r4, [r0]
_020124BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _020123F4
	ldrb r0, [r1]
	cmp r0, #5
	beq _020124D6
	ldr r0, _020124EC @ =gPlayer
	adds r0, #0x37
	ldrb r2, [r0]
	movs r1, #0x80
	orrs r1, r2
	strb r1, [r0]
_020124D6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020124E0: .4byte gUnknown_030054B4
_020124E4: .4byte gGameMode
_020124E8: .4byte gMultiplayerCharacters
_020124EC: .4byte gPlayer

	thumb_func_start Task_GameStage
Task_GameStage: @ 0x020124F0
	push {r4, r5, r6, r7, lr}
	ldr r0, _02012564 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1e
	ldr r0, _02012568 @ =gFrameCount
	ldr r1, _0201256C @ =gUnknown_03005418
	ldr r2, [r0]
	ldr r0, [r1]
	subs r3, r2, r0
	ldr r1, _02012570 @ =gStageTime
	ldr r0, [r1]
	subs r0, r3, r0
	mov ip, r0
	str r3, [r1]
	ldr r0, _02012574 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02012590
	ldr r2, _02012578 @ =0xFFFFFE00
	adds r1, r3, #0
	ands r1, r2
	mov r0, ip
	subs r4, r3, r0
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r5, _0201257C @ =gMultiplayerPseudoRandom
	ldr r1, [r5]
	ldr r0, _02012580 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02012584 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, _02012588 @ =0xFFFFF000
	ands r3, r0
	ands r4, r0
	ldr r6, _0201258C @ =gRandomItemBox
	cmp r3, r4
	beq _02012552
	ldrb r2, [r6]
	lsrs r1, r2, #4
	adds r1, #1
	movs r0, #0xf
	ands r0, r2
	lsls r1, r1, #4
	orrs r0, r1
	strb r0, [r6]
_02012552:
	ldr r1, [r5]
	movs r3, #7
	ldrb r2, [r6]
	movs r0, #0xf8
	ands r0, r2
	ands r1, r3
	orrs r0, r1
	strb r0, [r6]
	b _020125B0
	.align 2, 0
_02012564: .4byte 0x04000128
_02012568: .4byte gFrameCount
_0201256C: .4byte gUnknown_03005418
_02012570: .4byte gStageTime
_02012574: .4byte gGameMode
_02012578: .4byte 0xFFFFFE00
_0201257C: .4byte gMultiplayerPseudoRandom
_02012580: .4byte 0x00196225
_02012584: .4byte 0x3C6EF35F
_02012588: .4byte 0xFFFFF000
_0201258C: .4byte gRandomItemBox
_02012590:
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r3, #0
	ands r1, r2
	mov r4, ip
	subs r0, r3, r4
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r2, _020125E0 @ =gMultiplayerPseudoRandom
	ldr r1, [r2]
	ldr r0, _020125E4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _020125E8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
_020125B0:
	ldr r2, _020125EC @ =gCamera
	adds r0, r2, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0201262E
	ldr r0, _020125F0 @ =gInput
	ldrh r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r3
	cmp r0, r1
	bne _020125F4
	cmp r7, #3
	beq _0201261A
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #3
	strb r0, [r1]
	b _02012634
	.align 2, 0
_020125E0: .4byte gMultiplayerPseudoRandom
_020125E4: .4byte 0x00196225
_020125E8: .4byte 0x3C6EF35F
_020125EC: .4byte gCamera
_020125F0: .4byte gInput
_020125F4:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0201260C
	cmp r7, #0
	beq _02012624
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	b _02012634
_0201260C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0201262E
	cmp r7, #1
	bhi _02012624
_0201261A:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #2
	strb r0, [r1]
	b _02012634
_02012624:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #1
	strb r0, [r1]
	b _02012634
_0201262E:
	adds r0, r2, #0
	adds r0, #0x66
	strb r7, [r0]
_02012634:
	ldr r0, _02012694 @ =gMultiplayerConnections
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x66
	ldrb r2, [r1]
	asrs r0, r2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _0201264A
	strb r7, [r1]
_0201264A:
	ldr r1, _02012698 @ =gUnknown_030053A0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02012656
	subs r0, #1
	strb r0, [r1]
_02012656:
	ldr r0, _0201269C @ =gUnknown_03005400
	ldr r4, _020126A0 @ =gStageFlags
	ldrh r2, [r4]
	strh r2, [r0]
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	bne _0201268E
	ldr r0, _020126A4 @ =gUnknown_030053A4
	ldr r1, [r0]
	add r1, ip
	str r1, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0201268E
	ldr r1, _020126A8 @ =gCourseTime
	ldr r0, [r1]
	mov r3, ip
	subs r0, r0, r3
	str r0, [r1]
	cmp r0, #0
	bgt _0201268E
	movs r0, #1
	orrs r0, r2
	strh r0, [r4]
	bl CreateMultiplayerFinishHandler
_0201268E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012694: .4byte gMultiplayerConnections
_02012698: .4byte gUnknown_030053A0
_0201269C: .4byte gUnknown_03005400
_020126A0: .4byte gStageFlags
_020126A4: .4byte gUnknown_030053A4
_020126A8: .4byte gCourseTime

	thumb_func_start sub_020126AC
sub_020126AC: @ 0x020126AC
	push {lr}
	ldr r0, _020126DC @ =gUnknown_03005404
	movs r1, #0
	str r1, [r0]
	ldr r0, _020126E0 @ =gUnknown_03005428
	strb r1, [r0]
	ldr r1, _020126E4 @ =gNumLives
	movs r0, #3
	strb r0, [r1]
	ldr r0, _020126E8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _020126CA
	movs r0, #1
	strb r0, [r1]
_020126CA:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #1
	movs r1, #2
	bl sub_020122F8
	pop {r0}
	bx r0
	.align 2, 0
_020126DC: .4byte gUnknown_03005404
_020126E0: .4byte gUnknown_03005428
_020126E4: .4byte gNumLives
_020126E8: .4byte gGameMode

	thumb_func_start GameStageStart
GameStageStart: @ 0x020126EC
	push {lr}
	ldr r0, _02012750 @ =gUnknown_030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012754 @ =gUnknown_03005520
	strb r1, [r0]
	ldr r1, _02012758 @ =gRingCount
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0201275C @ =gUnknown_03005470
	movs r0, #1
	strb r0, [r1]
	ldr r1, _02012760 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012724
	ldr r0, _02012764 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _02012768 @ =gPlayer
	movs r2, #0
	bl sub_02011140
_02012724:
	ldr r0, _0201276C @ =gStageTime
	movs r3, #0
	str r3, [r0]
	ldr r2, _02012770 @ =gStageFlags
	ldrh r1, [r2]
	ldr r0, _02012774 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _02012778 @ =gUnknown_03005418
	ldr r0, _0201277C @ =gFrameCount
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _02012780 @ =gUnknown_030053A4
	str r3, [r0]
	ldr r1, _02012784 @ =gCourseTime
	ldr r0, _02012788 @ =0x00002A30
	str r0, [r1]
	bl CreateGameStage
	pop {r0}
	bx r0
	.align 2, 0
_02012750: .4byte gUnknown_030053F8
_02012754: .4byte gUnknown_03005520
_02012758: .4byte gRingCount
_0201275C: .4byte gUnknown_03005470
_02012760: .4byte gCurrentLevel
_02012764: .4byte gSelectedCharacter
_02012768: .4byte gPlayer
_0201276C: .4byte gStageTime
_02012770: .4byte gStageFlags
_02012774: .4byte 0x0000FF7F
_02012778: .4byte gUnknown_03005418
_0201277C: .4byte gFrameCount
_02012780: .4byte gUnknown_030053A4
_02012784: .4byte gCourseTime
_02012788: .4byte 0x00002A30

	thumb_func_start sub_0201278C
sub_0201278C: @ 0x0201278C
	push {r4, lr}
	ldr r4, _020127AC @ =gActiveCollectRingEffectCount
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	ldr r0, _020127B0 @ =gPlayer
	bl sub_020111CC
	bl sub_0200C574
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020127AC: .4byte gActiveCollectRingEffectCount
_020127B0: .4byte gPlayer

	thumb_func_start TaskDestructor_GameStage
TaskDestructor_GameStage: @ 0x020127B4
	ldr r1, _020127BC @ =gActiveCollectRingEffectCount
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_020127BC: .4byte gActiveCollectRingEffectCount

	thumb_func_start StageInit_CollectRings
StageInit_CollectRings: @ 0x020127C0
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start sub_020127CC
sub_020127CC: @ 0x020127CC
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start MultiPakCommunicationError
MultiPakCommunicationError: @ 0x020127D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _020128D0 @ =gMultiplayerMissingHeartbeats
	movs r4, #0
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	ldr r0, _020128D4 @ =gMultiSioEnabled
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r0, _020128D8 @ =0x0201299D
	movs r2, #0x80
	lsls r2, r2, #5
	str r4, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sb, r0
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r2, _020128DC @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _020128E0 @ =gDispCnt
	movs r2, #0x8d
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020128E4 @ =gBldRegs
	movs r6, #0
	strh r4, [r0]
	strh r4, [r0, #4]
	str r4, [sp, #4]
	ldr r2, _020128E8 @ =0x040000D4
	add r0, sp, #4
	str r0, [r2]
	ldr r1, _020128EC @ =gBgCntRegs
	mov r8, r1
	ldrh r1, [r1]
	movs r0, #0xc
	ands r0, r1
	lsls r0, r0, #0xc
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	str r0, [r2, #4]
	ldr r0, _020128F0 @ =0x85000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _020128F4 @ =gUnknown_03004D80
	strb r6, [r0]
	ldr r1, _020128F8 @ =gUnknown_03002280
	strb r6, [r1]
	strb r6, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _020128FC @ =0x00001E01
	mov r2, r8
	strh r0, [r2]
	ldr r7, _02012900 @ =gBgScrollRegs
	strh r4, [r7]
	strh r4, [r7, #2]
	ldr r0, _02012904 @ =gUnknown_03000040
	adds r2, r5, r0
	str r3, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _02012908 @ =0x0600F000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	movs r0, #4
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	ldr r1, _0201290C @ =gUnknown_0300006A
	adds r5, r5, r1
	strb r6, [r5]
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r0, _02012910 @ =0x00001F04
	mov r2, r8
	strh r0, [r2, #2]
	strh r4, [r7, #4]
	strh r4, [r7, #6]
	ldr r0, _02012914 @ =gMultiplayerLanguage
	ldrb r0, [r0]
	cmp r0, #1
	beq _0201291C
	cmp r0, #1
	bgt _02012928
	cmp r0, #0
	bne _02012928
	ldr r0, _02012918 @ =0x0000FFF8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_020128D0: .4byte gMultiplayerMissingHeartbeats
_020128D4: .4byte gMultiSioEnabled
_020128D8: .4byte 0x0201299D
_020128DC: .4byte gFlags
_020128E0: .4byte gDispCnt
_020128E4: .4byte gBldRegs
_020128E8: .4byte 0x040000D4
_020128EC: .4byte gBgCntRegs
_020128F0: .4byte 0x85000010
_020128F4: .4byte gUnknown_03004D80
_020128F8: .4byte gUnknown_03002280
_020128FC: .4byte 0x00001E01
_02012900: .4byte gBgScrollRegs
_02012904: .4byte gUnknown_03000040
_02012908: .4byte 0x0600F000
_0201290C: .4byte gUnknown_0300006A
_02012910: .4byte 0x00001F04
_02012914: .4byte gMultiplayerLanguage
_02012918: .4byte 0x0000FFF8
_0201291C:
	ldr r0, _02012924 @ =0x0000FFC8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_02012924: .4byte 0x0000FFC8
_02012928:
	ldr r1, _02012984 @ =gBgScrollRegs
	ldr r0, _02012988 @ =0x0000FFF8
	strh r0, [r1, #6]
_0201292E:
	mov r2, sb
	ldr r0, _0201298C @ =0x06004000
	str r0, [r2, #4]
	movs r4, #0
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _02012990 @ =0x0600F800
	str r1, [r2, #0xc]
	strh r0, [r2, #0x18]
	strh r0, [r2, #0x1a]
	movs r5, #3
	strh r5, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r0, [r2, #0x22]
	strh r0, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0xc
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r4, [r0]
	movs r4, #1
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r1, _02012994 @ =gWinRegs
	strh r5, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _02012998 @ =0x00003868
	strh r0, [r1, #4]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012984: .4byte gBgScrollRegs
_02012988: .4byte 0x0000FFF8
_0201298C: .4byte 0x06004000
_02012990: .4byte 0x0600F800
_02012994: .4byte gWinRegs
_02012998: .4byte 0x00003868
_0201299C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_8081200
sub_8081200: @ 0x020129A0
	push {lr}
	ldr r1, _020129F8 @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r0, _020129FC @ =gUnknown_030057C4
	movs r1, #0
	str r1, [r0]
	ldr r0, _02012A00 @ =gUnknown_030057D4
	str r1, [r0]
	ldr r0, _02012A04 @ =gActiveCollectRingEffectCount
	str r1, [r0]
	ldr r0, _02012A08 @ =gPlayer
	adds r0, #0x8c
	str r1, [r0]
	ldr r0, _02012A0C @ =gCamera
	str r1, [r0, #0x5c]
	ldr r0, _02012A10 @ =gUnknown_030053F0
	strb r1, [r0]
	ldr r0, _02012A14 @ =gEntitiesManagerTask
	str r1, [r0]
	ldr r3, _02012A18 @ =gMultiplayerPlayerTasks
	movs r2, #0
_020129CC:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _020129CC
	bl sub_020126AC
	ldr r2, _02012A08 @ =gPlayer
	adds r2, #0x5c
	ldr r1, _02012A1C @ =gUnknown_030057C8
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_020129F8: .4byte gGameMode
_020129FC: .4byte gUnknown_030057C4
_02012A00: .4byte gUnknown_030057D4
_02012A04: .4byte gActiveCollectRingEffectCount
_02012A08: .4byte gPlayer
_02012A0C: .4byte gCamera
_02012A10: .4byte gUnknown_030053F0
_02012A14: .4byte gEntitiesManagerTask
_02012A18: .4byte gMultiplayerPlayerTasks
_02012A1C: .4byte gUnknown_030057C8

	thumb_func_start GameInit
GameInit: @ 0x02012A20
	push {r4, r5, r6, r7, lr}
	ldr r1, _02012A7C @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02012A80 @ =gUnknown_03004D54
	ldr r0, _02012A84 @ =gBgOffsetsBuffer
	str r0, [r1]
	ldr r1, _02012A88 @ =gUnknown_030022C0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #0
	ldr r7, _02012A8C @ =gMultiSioEnabled
	ldr r0, _02012A90 @ =gMultiSioStatusFlags
	mov ip, r0
	ldr r6, _02012A94 @ =gMultiplayerCharacters
	movs r2, #0
	ldr r5, _02012A98 @ =gMPRingCollectWins
	ldr r4, _02012A9C @ =gUnknown_030054B4
	ldr r3, _02012AA0 @ =gMultiplayerMissingHeartbeats
_02012A4A:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r1, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _02012A4A
	movs r0, #1
	strb r0, [r7]
	mov r1, ip
	ldr r0, [r1]
	bl MultiSioInit
	bl MultiSioStart
	movs r0, #0
	bl CreateMultiplayerSinglePakResultsScreen
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012A7C: .4byte gGameMode
_02012A80: .4byte gUnknown_03004D54
_02012A84: .4byte gBgOffsetsBuffer
_02012A88: .4byte gUnknown_030022C0
_02012A8C: .4byte gMultiSioEnabled
_02012A90: .4byte gMultiSioStatusFlags
_02012A94: .4byte gMultiplayerCharacters
_02012A98: .4byte gMPRingCollectWins
_02012A9C: .4byte gUnknown_030054B4
_02012AA0: .4byte gMultiplayerMissingHeartbeats

	thumb_func_start sub_02012AA4
sub_02012AA4: @ 0x02012AA4
	push {lr}
	sub sp, #4
	ldr r0, _02012AC4 @ =sub_02012AE8
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, _02012AC8 @ =sub_02012AEC
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _02012ACC @ =gUnknown_030057D4
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02012AC4: .4byte sub_02012AE8
_02012AC8: .4byte sub_02012AEC
_02012ACC: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AD0
sub_02012AD0: @ 0x02012AD0
	push {r4, lr}
	ldr r4, _02012AE4 @ =gUnknown_030057D4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02012AE4: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AE8
sub_02012AE8: @ 0x02012AE8
	bx lr
	.align 2, 0

	thumb_func_start sub_02012AEC
sub_02012AEC: @ 0x02012AEC
	ldr r1, _02012AF4 @ =gUnknown_030057D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012AF4: .4byte gUnknown_030057D4
