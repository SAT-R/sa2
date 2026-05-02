.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _0808696C @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0     @ r5 = hookRail
	ldr r2, _08086970 @ =0x0300000C
	adds r6, r1, r2     @ r6 = s
	ldr r3, [r5]
	str r3, [sp]        @ sp00 = r3 = me
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	ldrh r1, [r5, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0          @ sb = worldX
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	ldrh r1, [r5, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0          @ sl = worldY
	ldr r4, _08086974 @ =gPlayer
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	cmp r2, #0
	beq _080868D8
	b _08086A50
_080868D8:
	adds r7, r4, #0
	adds r7, #0x40
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #0x26
	beq _080868EE
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0x26
	strb r0, [r7]
_080868EE:
	mov r3, r8
	strh r3, [r4, #0xa]
	ldr r0, [r4]
	ldr r1, [r5, #0x48]
	subs r0, r0, r1
	asrs r0, r0, #8
	movs r1, #0xf0
	lsls r1, r1, #1
	cmp r0, r1
	ble _08086984
	movs r0, #0xb4
	bl m4aSongNumStop
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r0, [r4, #0x10]
	ldr r1, _08086978 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	movs r0, #4
	strb r0, [r7]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	ldr r0, _0808696C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808697C @ =Task_HookRail_Shared0
	str r0, [r1, #8]
	ldr r0, [r5, #0x40]
	movs r1, #0
	strh r0, [r4, #0xc]
	ldr r0, [r4, #4]
	ldr r2, _08086980 @ =0xFFFFF600
	adds r0, r0, r2
	str r0, [r4, #4]
	strb r1, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]   @ gPlayer.itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
	ldr r1, [r4, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080869BC
	ldr r0, [r4, #0x28]
	cmp r0, r6
	bne _080869BC
	mov r3, r8
	str r3, [r4, #0x28]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x10]
	b _080869BC
	.align 2, 0
_0808696C: .4byte gCurTask
_08086970: .4byte 0x0300000C
_08086974: .4byte gPlayer
_08086978: .4byte 0xFFBFFFFF
_0808697C: .4byte Task_HookRail_Shared0
_08086980: .4byte 0xFFFFF600
_08086984:
	ldr r0, [r5, #0x40]
	adds r0, #0x10
	str r0, [r5, #0x40]
	ldr r1, [r5, #0x4c]
	adds r1, r1, r0
	str r1, [r5, #0x4c]
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #8
	ldr r3, _080869F4 @ =0xFFFFFA00
	adds r0, r0, r3
	adds r0, r0, r1
	str r0, [r4]
	mov r1, sl          @ r1 = sl = worldY
	lsls r0, r1, #0x10
	asrs r0, r0, #8
	movs r2, #0x90
	lsls r2, r2, #6
	adds r0, r0, r2
	ldr r1, [r5, #0x4c]
	asrs r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0x26
	strb r0, [r7]
_080869BC:
	ldr r0, _080869F8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _08086A0C
	ldr r0, _080869FC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08086A00 @ =gMultiSioRecv
	adds r1, r1, r0
	ldr r3, _08086A04 @ =gCamera
	ldrh r0, [r1, #2]
	ldrh r2, [r3]
	subs r0, r0, r2
	adds r0, #5
	strh r0, [r6, #0x16]
	ldrh r0, [r1, #4]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	subs r0, #0x24
	strh r0, [r6, #0x18]
	ldr r4, _08086A08 @ =gPlayer
	adds r2, r3, #0
	b _08086A2A
	.align 2, 0
_080869F4: .4byte 0xFFFFFA00
_080869F8: .4byte gGameMode
_080869FC: .4byte 0x04000128
_08086A00: .4byte gMultiSioRecv
_08086A04: .4byte gCamera
_08086A08: .4byte gPlayer
_08086A0C:
	ldr r3, _08086A48 @ =gPlayer
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r2, _08086A4C @ =gCamera
	ldrh r1, [r2]
	subs r0, r0, r1
	adds r0, #5
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	subs r0, #0x24
	strh r0, [r6, #0x18]
	adds r4, r3, #0
_08086A2A:
	ldr r0, [r4]
	asrs r0, r0, #8
	ldrh r1, [r2]
	subs r0, r0, r1
	adds r0, #5
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08086AD2
	.align 2, 0
_08086A48: .4byte gPlayer
_08086A4C: .4byte gCamera
_08086A50:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08086A68
	ldr r0, [r4, #0x28]
	cmp r0, r6
	bne _08086A68
	movs r0, #0
	str r0, [r4, #0x28]
	subs r0, #9
	ands r1, r0
	str r1, [r4, #0x10]
_08086A68:
	ldr r0, [r5, #0x40]
	adds r0, #0x10
	str r0, [r5, #0x40]
	ldr r1, [r5, #0x4c]
	adds r1, r1, r0
	str r1, [r5, #0x4c]
	asrs r1, r1, #8
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	ldr r2, _08086B24 @ =gCamera
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r1, [r5, #0x4c]
	asrs r1, r1, #9
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldrh r7, [r6, #0x16]    @ r7 = screenX = s->x;
	ldrh r4, [r6, #0x18]    @ r4 = screenY = s->y;
	ldr r0, [r5, #0x4c]
	asrs r0, r0, #8
	movs r1, #0xf0
	lsls r1, r1, #1
	cmp r0, r1
	ble _08086AD2
	movs r0, #0xb4
	bl m4aSongNumStop
	ldr r0, _08086B28 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08086B2C @ =Task_HookRail_Shared0
	str r0, [r1, #8]
	ldr r2, _08086B30 @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08086AD2
	ldr r0, [r2, #0x28]
	cmp r0, r6
	bne _08086AD2
	movs r0, #0
	str r0, [r2, #0x28]
	subs r0, #9
	ands r1, r0
	str r1, [r2, #0x10]
_08086AD2:
	lsls r0, r7, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x10
	adds r0, r0, r1
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08086AF6
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08086AF6
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08086B34
_08086AF6:
	ldr r2, _08086B30 @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08086B12
	ldr r0, [r2, #0x28]
	cmp r0, r6
	bne _08086B12
	movs r0, #0
	str r0, [r2, #0x28]
	subs r0, #9
	ands r1, r0
	str r1, [r2, #0x10]
_08086B12:
	ldrb r0, [r5, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _08086B28 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08086B3A
	.align 2, 0
_08086B24: .4byte gCamera
_08086B28: .4byte gCurTask
_08086B2C: .4byte Task_HookRail_Shared0
_08086B30: .4byte gPlayer
_08086B34:
	adds r0, r6, #0
	bl DisplaySprite
_08086B3A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
