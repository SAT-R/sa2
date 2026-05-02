.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _08070BA0 @ =gCurTask
	ldr r0, [r4]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0     @ r6 = senbon
	adds r0, #0xc
	adds r5, r3, r0     @ r5 = s
	ldr r1, [r6]
	mov r8, r1          @ r8 = me
	ldrb r2, [r6, #8]
	lsls r2, r2, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r2, r2, r0     @ r2 = worldX
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10  @ r7 = worldX
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov ip, r1          @ ip = worldY
	ldr r2, _08070BA4 @ =0x03000048
	adds r3, r3, r2
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r6, #0x40]
	adds r0, r0, r1
	str r0, [r6, #0x40] @ senbon->unk40 += senbon->unk48
	asrs r0, r0, #8
	adds r0, r7, r0
	lsls r0, r0, #0x10
	ldrh r1, [r6, #0x3c]
	add r1, ip
	lsls r1, r1, #0x10
	ldr r3, _08070BA8 @ =gCamera
	ldrh r2, [r3]
	mov sb, r2
	lsrs r2, r0, #0x10
	mov sl, r2          @ sl = offsetWorldX = worldX + senbon->unk40;
	asrs r0, r0, #0x10
	mov r2, sb
	subs r0, r0, r2
	strh r0, [r5, #0x16]
	ldrh r0, [r3, #2]
	lsrs r2, r1, #0x10
	mov sb, r2
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r7, r0
	bgt _08070B6C
	adds r0, r1, #0
	subs r0, #0x80
	cmp r7, r0
	blt _08070B6C
	movs r0, #2
	ldrsh r2, [r3, r0]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r2, r1
	cmp ip, r0
	bgt _08070B6C
	adds r0, r2, #0
	subs r0, #0x80
	cmp ip, r0
	bge _08070BAC
_08070B6C:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08070B90
	movs r2, #0x18
	ldrsh r0, [r5, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08070B90
	movs r3, #0x18
	ldrsh r1, [r5, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08070BAC
_08070B90:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r4]
	bl TaskDestroy
	b _08070C98
	.align 2, 0
_08070BA0: .4byte gCurTask
_08070BA4: .4byte 0x03000048
_08070BA8: .4byte gCamera
_08070BAC:
	mov r2, sl          @ r2 = sl = offsetWorldX
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	mov r3, sb
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	beq _08070BD4
	ldr r0, _08070BD0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08070C98
	.align 2, 0
_08070BD0: .4byte gCurTask
_08070BD4:
	ldr r0, [r6, #0x40]
	asrs r2, r0, #8
	mov r0, r8
	movs r1, #3
	ldrsb r1, [r0, r1]
	adds r0, r1, #1
	lsls r0, r0, #3
	cmp r2, r0
	bgt _08070BFA
	adds r1, r6, #0
	adds r1, #0x48
	movs r0, #0xa0
	strh r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08070C8C
_08070BFA:
	mov r3, r8
	ldrb r0, [r3, #5]
	adds r0, r1, r0
	subs r0, #1
	lsls r0, r0, #3
	cmp r2, r0
	blt _08070C24
	adds r1, r6, #0
	adds r1, #0x48
	ldr r0, _08070C1C @ =0x0000FF60
	strh r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _08070C20 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08070C8C
	.align 2, 0
_08070C1C: .4byte 0x0000FF60
_08070C20: .4byte 0xFFFFFBFF
_08070C24:
	adds r1, r6, #0
	adds r1, #0x46
	ldrh r0, [r1]
	movs r3, #0
	ldrsh r2, [r1, r3]
	cmp r2, #0
	beq _08070C38
	subs r0, #1
	strh r0, [r1]
	b _08070C8C
_08070C38:
	ldr r1, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _08070C64
	ldr r0, _08070C60 @ =gPlayer
	ldr r0, [r0]
	asrs r1, r0, #8
	cmp r1, r4
	blt _08070C8C
	adds r0, r4, #0
	adds r0, #0x50
	cmp r0, r1
	blt _08070C8C
	adds r0, r6, #0
	adds r0, #0x44
	strh r2, [r0]
	b _08070C7C
	.align 2, 0
_08070C60: .4byte gPlayer
_08070C64:
	ldr r0, _08070CA8 @ =gPlayer
	ldr r0, [r0]
	asrs r2, r0, #8
	cmp r2, r4
	bgt _08070C8C
	adds r0, r4, #0
	subs r0, #0x50
	cmp r0, r2
	bgt _08070C8C
	adds r0, r6, #0
	adds r0, #0x44
	strh r1, [r0]
_08070C7C:
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08070CAC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08070CB0 @ =Task_8070CB4
	str r0, [r1, #8]
_08070C8C:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_08070C98:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070CA8: .4byte gPlayer
_08070CAC: .4byte gCurTask
_08070CB0: .4byte Task_8070CB4

.syntax divided
