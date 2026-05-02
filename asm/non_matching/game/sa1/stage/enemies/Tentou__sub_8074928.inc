.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _08074A64 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov sl, r0
	ldr r2, _08074A68 @ =0x0300000C
	adds r7, r3, r2
	ldr r4, [r0]
	str r4, [sp]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #8]
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r5, sl
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #4]
	ldr r5, [sp, #8]
	mov ip, r1
	mov r6, sl
	ldr r0, [r6, #0x50]
	rsbs r0, r0, #0
	str r0, [sp, #0xc]
	ldrb r2, [r4, #5]
	lsls r2, r2, #0xb
	ldr r1, _08074A6C @ =0x03000058
	adds r0, r3, r1
	movs r6, #0
	ldrsh r4, [r0, r6]
	ldr r0, _08074A70 @ =0x0300004E
	adds r6, r3, r0
	ldrh r0, [r6]
	subs r0, #1
	movs r1, #0x7f
	ands r0, r1
	muls r0, r4, r0
	ldr r1, _08074A74 @ =0x000003FF
	mov sb, r1
	ands r0, r1
	lsls r0, r0, #1
	ldr r4, _08074A78 @ =gSineTable
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	mov r2, sl
	str r0, [r2, #0x50]
	ldr r4, [r2, #0x54]
	mov r8, r4
	ldr r0, [sp]
	ldrb r2, [r0, #6]
	lsls r2, r2, #0xb
	ldr r1, _08074A7C @ =0x0300005A
	adds r0, r3, r1
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldrh r0, [r6]
	subs r0, #1
	movs r1, #0x3f
	ands r0, r1
	muls r0, r4, r0
	mov r4, sb
	ands r0, r4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _08074A78 @ =gSineTable
	adds r0, r0, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	mov r6, sl
	str r0, [r6, #0x54]
	mov r1, r8
	subs r2, r0, r1
	ldr r4, _08074A80 @ =gCamera
	ldrh r0, [r4]
	subs r0, r5, r0
	ldr r6, [sp, #0xc]
	asrs r1, r6, #5
	adds r0, r0, r1
	strh r0, [r7, #0x16]
	ldrh r0, [r4, #2]
	mov r1, ip
	subs r0, r1, r0
	asrs r1, r2, #4
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldr r6, _08074A84 @ =0x03000046
	adds r3, r3, r6
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	ldr r3, _08074A64 @ =gCurTask
	cmp r5, r0
	bgt _08074A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r5, r0
	blt _08074A30
	movs r5, #2
	ldrsh r1, [r4, r5]
	movs r6, #0x90
	lsls r6, r6, #1
	adds r0, r1, r6
	cmp ip, r0
	bgt _08074A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp ip, r0
	bge _08074A88
_08074A30:
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08074A54
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08074A54
	movs r4, #0x18
	ldrsh r1, [r7, r4]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08074A88
_08074A54:
	mov r5, sl
	ldrb r0, [r5, #8]
	ldr r6, [sp]
	strb r0, [r6]
	ldr r0, [r3]
	bl TaskDestroy
	b _08074B62
	.align 2, 0
_08074A64: .4byte gCurTask
_08074A68: .4byte 0x0300000C
_08074A6C: .4byte 0x03000058
_08074A70: .4byte 0x0300004E
_08074A74: .4byte 0x000003FF
_08074A78: .4byte gSineTable
_08074A7C: .4byte 0x0300005A
_08074A80: .4byte gCamera
_08074A84: .4byte 0x03000046
_08074A88:
	ldr r0, [sp, #0xc]
	asrs r1, r0, #5
	ldr r3, [sp, #8]
	adds r1, r3, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #4
	ldr r4, [sp, #4]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r7, #0
	bl Coll_Player_Enemy_Attack
	adds r4, r0, #0
	cmp r4, #0
	beq _08074AB8
	ldr r0, _08074AB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08074B62
	.align 2, 0
_08074AB4: .4byte gCurTask
_08074AB8:
	ldr r3, _08074B0C @ =gPlayer
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r2, _08074B10 @ =gCamera
	movs r5, #0
	ldrsh r1, [r2, r5]
	subs r0, r0, r1
	movs r6, #0x16
	ldrsh r1, [r7, r6]
	subs r5, r0, r1
	adds r0, r5, #0
	muls r0, r5, r0
	adds r5, r0, #0
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r3, #2
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	movs r6, #0x18
	ldrsh r1, [r7, r6]
	subs r0, r0, r1
	mov ip, r0
	adds r1, r0, #0
	mov r0, ip
	muls r0, r1, r0
	adds r0, r0, r5
	mov ip, r0
	ldr r0, _08074B14 @ =0x000018FF
	cmp ip, r0
	bgt _08074B20
	mov r0, sl
	adds r0, #0x46
	strh r4, [r0]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08074B18 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074B1C @ =Task_807473C
	b _08074B3C
	.align 2, 0
_08074B0C: .4byte gPlayer
_08074B10: .4byte gCamera
_08074B14: .4byte 0x000018FF
_08074B18: .4byte gCurTask
_08074B1C: .4byte Task_807473C
_08074B20:
	mov r3, sl
	adds r3, #0x46
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0x3b
	ble _08074B3E
	strh r4, [r3]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08074B74 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08074B78 @ =Task_TentouMain
_08074B3C:
	str r0, [r1, #8]
_08074B3E:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl DisplaySprite
	ldr r0, [r7, #0x10]
	ldr r1, _08074B7C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r7, #0x10]
_08074B62:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074B74: .4byte gCurTask
_08074B78: .4byte Task_TentouMain
_08074B7C: .4byte 0xFFFFFBFF

.syntax divided
