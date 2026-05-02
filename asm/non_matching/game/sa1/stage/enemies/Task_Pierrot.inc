.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, _0806DE64 @ =gCurTask
	ldr r0, [r4]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov r8, r0          @ r8 = pierrot
	ldr r0, _0806DE68 @ =0x0300000C
	adds r5, r3, r0     @ r5 = s
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp, #0xc]  @ sp0C = me
	mov r6, r8          @ r6 = r8 = pierrot
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
	asrs r6, r2, #0x10  @ r6 = worldX
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10  @ r7 = worldY
	ldr r1, _0806DE6C @ =0x03000048
	adds r0, r3, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r2, r8          @ r2 = r8 = pierrot
	ldr r0, [r2, #0x44]
	adds r0, r0, r1
	str r0, [r2, #0x44] @ pierrot->unk44 += pierrot->unk48
	asrs r0, r0, #8
	adds r0, r6, r0
	lsls r0, r0, #0x10  @ r0 = newX = worldX + I(pierrot->qUnk44);
	ldr r1, _0806DE70 @ =0x0300004A
	adds r3, r3, r1
	ldrh r1, [r3]
	adds r1, r7, r1
	lsls r1, r1, #0x10
	ldr r2, _0806DE74 @ =0xFFD00000
	adds r1, r1, r2     @ r1 = newY = worldY + pierrot->unk4A - Q(0.1875);
	ldr r3, _0806DE78 @ =gCamera
	ldrh r2, [r3]
	mov sl, r2
	lsrs r2, r0, #0x10
	mov sb, r2          @ sb = newX
	asrs r0, r0, #0x10
	mov r2, sl
	subs r0, r0, r2
	strh r0, [r5, #0x16]    @ s->x = newX - gCamera.x
	ldrh r0, [r3, #2]
	lsrs r2, r1, #0x10
	mov sl, r2              @ sl = newY
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]    @ s->y =
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r6, r0
	bgt _0806DE30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r6, r0
	blt _0806DE30
	movs r6, #2
	ldrsh r2, [r3, r6]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r2, r1
	cmp r7, r0
	bgt _0806DE30
	adds r0, r2, #0
	subs r0, #0x80
	cmp r7, r0
	bge _0806DE7C
_0806DE30:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0806DE54
	movs r2, #0x18
	ldrsh r0, [r5, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _0806DE54
	movs r3, #0x18
	ldrsh r1, [r5, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0806DE7C
_0806DE54:
	mov r6, r8          @ r6 = r8 = pierrot
	ldrb r0, [r6, #8]
	ldr r1, [sp, #0xc]  @ r1 = sp0C = me
	strb r0, [r1]
	ldr r0, [r4]
	bl TaskDestroy
	b _0806E04C_return
	.align 2, 0
_0806DE64: .4byte gCurTask
_0806DE68: .4byte 0x0300000C
_0806DE6C: .4byte 0x03000048
_0806DE70: .4byte 0x0300004A
_0806DE74: .4byte 0xFFD00000
_0806DE78: .4byte gCamera
_0806DE7C:
	ldr r2, _0806DF60 @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	ands r1, r0
	mov r3, sb          @ r3 = sb = newX
	lsls r3, r3, #0x10
	str r3, [sp, #0x10] @ sp10 = r3 = sb = newX
	mov r6, sl
	lsls r6, r6, #0x10
	mov sb, r6          @ sb = newY
	cmp r1, #0
	beq _0806DE96
	b _0806DFD8
_0806DE96:
	ldr r1, [r5, #0x30]
	subs r0, #0x81
	cmp r1, r0
	bne _0806DEA0
	b _0806DFB6
_0806DEA0:
	asrs r1, r3, #0x10  @ r1 = newX
	adds r0, r5, #0
	adds r0, #0x34      @ 
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r4, r1, r6     @ r4 = left = newX + s->hitboxes[1].d.sData[0];
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r3, _0806DF64 @ =gPlayerBodyPSI
	adds r0, r3, #0
	adds r0, #0x38
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	mov ip, r3
	cmp r4, r1          @ (left <= playerLeft)
	bgt _0806DED8
	adds r0, r5, #0     @ r0 = r5 = s
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r4, r0
	cmp r0, r1
	bge _0806DEF0
	cmp r4, r1
	blt _0806DFB6
_0806DED8:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	mov r1, sl
	lsls r1, r1, #0x10
	mov sb, r1
	cmp r0, r4
	blt _0806DFB6
_0806DEF0:
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	adds r3, r5, #0
	adds r3, #0x35
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r4, r0, r6
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	mov r3, ip
	adds r3, #0x39
	movs r7, #0
	ldrsb r7, [r3, r7]
	adds r3, r0, r7
	mov sb, r1          @ sb = r1 = 
	cmp r4, r3
	bgt _0806DF2A
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r4, r0
	cmp r0, r3
	bge _0806DF3C
	cmp r4, r3
	blt _0806DFB6
_0806DF2A:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _0806DFB6
_0806DF3C:
	ldr r1, [r2, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806DFB0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0806DF7C
	movs r6, #0xc
	ldrsh r0, [r2, r6]
	cmp r0, #0
	ble _0806DF68
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	b _0806DF70
	.align 2, 0
_0806DF60: .4byte gPlayer
_0806DF64: .4byte gPlayerBodyPSI
_0806DF68:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	ldr r0, [r2]
	subs r0, r0, r1
_0806DF70:
	str r0, [r2]
	ldr r0, [r2, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0806DF9C
_0806DF7C:
	movs r6, #0xc
	ldrsh r0, [r2, r6]
	cmp r0, #0
	bge _0806DF8C
	adds r1, r0, #0
	ldr r0, [r2]
	adds r0, r0, r1
	b _0806DF94
_0806DF8C:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	ldr r0, [r2]
	subs r0, r0, r1
_0806DF94:
	str r0, [r2]
	ldr r0, [r2, #0x10]
	movs r1, #1
	orrs r0, r1
_0806DF9C:
	str r0, [r2, #0x10]
	movs r6, #0xc
	ldrsh r0, [r2, r6]
	rsbs r0, r0, #0
	strh r0, [r2, #0xc]
	movs r1, #8
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	strh r0, [r2, #8]
	b _0806DFB6
_0806DFB0:
	adds r0, r2, #0
	bl Coll_DamagePlayer
_0806DFB6:
	ldr r2, [sp, #0x10]     @ r2 = sp10 = newX
	asrs r1, r2, #0x10
	mov r3, sb              @ r3 = sb = 
	asrs r2, r3, #0x10
	adds r0, r5, #0
	bl Coll_Player_Enemy_Attack
	cmp r0, #0
	beq _0806DFD8
	ldr r0, _0806DFD4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0806E04C_return
	.align 2, 0
_0806DFD4: .4byte gCurTask
_0806DFD8:
	mov r6, sb
	asrs r0, r6, #0x10
	ldr r2, [sp, #0x10]     @ r2 = sp10 = newX
	asrs r1, r2, #0x10
	add r3, sp, #8
	str r3, [sp]
	ldr r2, _0806E020 @ =sa2__sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F07C
	mov r2, r8          @ r2 = r8 = pierrot
	adds r2, #0x4a
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	mov r6, r8          @ r6 = r8 = pierrot
	ldr r0, [r6, #0x44]
	asrs r2, r0, #8
	ldr r0, [sp, #0xc]  @ r0 = sp0C = me
	movs r1, #3
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	cmp r2, r0
	bgt _0806E024
	mov r1, r8          @ r1 = r8 = pierrot
	adds r1, #0x48
	movs r0, #0xa0
	strh r0, [r1]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0806E03E
	.align 2, 0
_0806E020: .4byte sa2__sub_801EE64
_0806E024:
	ldr r3, [sp, #0xc]  @ r3 = sp0C = me
	ldrb r0, [r3, #5]
	adds r0, r1, r0
	lsls r0, r0, #3
	cmp r2, r0
	blt _0806E040_upd_spr_and_return
	mov r1, r8          @ r1 = r8 = pierrot
	adds r1, #0x48
	ldr r0, _0806E05C @ =0x0000FF60
	strh r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _0806E060 @ =0xFFFFFBFF
	ands r0, r1
_0806E03E:
	str r0, [r5, #0x10]
_0806E040_upd_spr_and_return:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_0806E04C_return:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E05C: .4byte 0x0000FF60
_0806E060: .4byte 0xFFFFFBFF

.syntax divided
