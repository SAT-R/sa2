.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r3, _08072C98 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0		@ r7 = drisame
	adds r0, #0xc
	adds r0, r0, r1
	mov sb, r0			@ sb = s
	ldr r5, [r7]
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r2, #0x10
	mov ip, r4			@ ip = r4 = worldX
	asrs r2, r2, #0x10
	str r2, [r7, #0x4c]
	lsrs r6, r1, #0x10
	mov r8, r6			@ r = worldY
	asrs r1, r1, #0x10
	str r1, [r7, #0x50]
	ldr r4, _08072C9C @ =gCamera
	ldrh r0, [r4]
	subs r0, r2, r0
	mov r6, sb
	strh r0, [r6, #0x16]
	ldrh r0, [r4, #2]
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	movs r6, #0
	ldrsh r0, [r4, r6]
	mov sl, r0
	movs r0, #0xb8
	lsls r0, r0, #1
	add r0, sl
	cmp r2, r0
	bgt _08072C66
	mov r0, sl
	subs r0, #0x80
	cmp r2, r0
	blt _08072C66
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r4, #0x90
	lsls r4, r4, #1
	adds r0, r2, r4
	cmp r1, r0
	bgt _08072C66
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	bge _08072CA0
_08072C66:
	mov r6, sb
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08072C8C
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08072C8C
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08072CA0
_08072C8C:
	ldrb r0, [r7, #8]
	strb r0, [r5]
	ldr r0, [r3]
	bl TaskDestroy
	b _08072E58
	.align 2, 0
_08072C98: .4byte gCurTask
_08072C9C: .4byte gCamera
_08072CA0:
	ldr r6, _08072D40 @ =gPlayer
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	mov r3, r8
	lsls r5, r3, #0x10
	asrs r4, r5, #0x10
	mov sl, r4
	subs r0, r0, r4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6]
	asrs r1, r1, #8
	mov r2, ip
	lsls r4, r2, #0x10
	asrs r3, r4, #0x10
	mov r8, r3
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sa2__sub_8004418
	ldr r1, _08072D44 @ =0x000003FF
	ands r1, r0
	str r1, [sp]
	adds r2, r1, #0
	ldr r3, _08072D48 @ =0xFFFFFE7F
	adds r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r4, [sp, #4]
	str r5, [sp, #8]
	cmp r0, #0xfe
	bhi _08072D8A
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	mov r4, sl
	subs r0, r0, r4
	adds r5, r0, #0
	muls r5, r0, r5
	ldr r0, [r6]
	asrs r0, r0, #8
	mov r6, r8
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r5, r5, r0
	ldr r0, _08072D4C @ =0x000018FF
	cmp r5, r0
	bgt _08072D8A
	ldr r0, [r7, #0x54]
	ldrh r0, [r0, #6]
	ldr r3, _08072D50 @ =0x030000BD
	adds r0, r0, r3
	movs r1, #1
	strb r1, [r0]
	mov r4, sb
	ldr r0, [r4, #0x10]
	ldr r1, _08072D54 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	ldr r1, _08072D58 @ =gSineTable
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x23
	bl Div
	cmp r0, #0
	bge _08072D5C
	adds r0, r4, #0
	movs r1, #0x23
	bl Div
	b _08072D66
	.align 2, 0
_08072D40: .4byte gPlayer
_08072D44: .4byte 0x000003FF
_08072D48: .4byte 0xFFFFFE7F
_08072D4C: .4byte 0x000018FF
_08072D50: .4byte 0x030000BD
_08072D54: .4byte 0xFFFFFBFF
_08072D58: .4byte gSineTable
_08072D5C:
	adds r0, r4, #0
	movs r1, #0x23
	bl Div
	rsbs r0, r0, #0
_08072D66:
	str r0, [r7, #0x3c]
	ldr r1, _08072E34 @ =gSineTable
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r1, #0x23
	bl Div
	str r0, [r7, #0x40]
	movs r0, #0
	str r0, [r7, #0x44]
	str r0, [r7, #0x48]
	ldr r0, _08072E38 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08072E3C @ =sub_8072E68
	str r0, [r1, #8]
_08072D8A:
	ldr r4, [sp]
	mov r8, r4
	mov r0, r8
	subs r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _08072E18
	ldr r2, _08072E40 @ =gPlayer
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	ldr r6, [sp, #8]
	asrs r1, r6, #0x10
	subs r0, r0, r1
	adds r5, r0, #0
	muls r5, r0, r5
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r2, [sp, #4]
	asrs r1, r2, #0x10
	subs r0, r0, r1
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	adds r5, r5, r0
	ldr r0, _08072E44 @ =0x000018FF
	cmp r5, r0
	bgt _08072E18
	ldr r0, [r7, #0x54]
	ldrh r0, [r0, #6]
	ldr r4, _08072E48 @ =0x030000BD
	adds r0, r0, r4
	movs r6, #0
	movs r1, #1
	strb r1, [r0]
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	mov r2, sb
	str r0, [r2, #0x10]
	ldr r5, _08072E34 @ =gSineTable
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r0, [r0, r3]
	movs r4, #0x23
	adds r1, r4, #0
	bl Div
	str r0, [r7, #0x3c]
	mov r1, r8
	lsls r0, r1, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r4, #0
	bl Div
	str r0, [r7, #0x40]
	str r6, [r7, #0x44]
	str r6, [r7, #0x48]
	ldr r0, _08072E38 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08072E3C @ =sub_8072E68
	str r0, [r1, #8]
_08072E18:
	ldr r3, [sp, #4]
	asrs r1, r3, #0x10
	ldr r4, [sp, #8]
	asrs r2, r4, #0x10
	mov r0, sb
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	beq _08072E4C
	ldr r0, _08072E38 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08072E58
	.align 2, 0
_08072E34: .4byte gSineTable
_08072E38: .4byte gCurTask
_08072E3C: .4byte sub_8072E68
_08072E40: .4byte gPlayer
_08072E44: .4byte 0x000018FF
_08072E48: .4byte 0x030000BD
_08072E4C:
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
_08072E58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
