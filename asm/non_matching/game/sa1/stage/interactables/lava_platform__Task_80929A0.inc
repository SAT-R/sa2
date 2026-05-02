.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08092A84 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov sl, r0          @ sl = platform
	ldr r1, [r0]        @ r1 = platform->base.me
	ldr r0, _08092A88 @ =0x0300000C
	adds r0, r0, r4
	mov sb, r0          @ sb = s
	ldr r2, _08092A8C @ =0x03000044
	adds r2, r4, r2
	str r2, [sp, #8]    @ sp08 = s2
	mov r5, sl          @ r5 = sl = platform
	ldrb r3, [r5, #8]
	lsls r3, r3, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10  @ r3 = worldX << 16
	ldrb r2, [r1, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10  @ r2 = worldY << 16
	ldr r1, [r5, #0x78]
	adds r1, #0x25
	str r1, [r5, #0x78] @ 
	ldr r0, [r5, #0x7c]
	adds r0, r0, r1
	str r0, [r5, #0x7c] @ platform->qUnk7C += platform->qUnk78;
	ldr r1, _08092A90 @ =gCamera
	ldrh r0, [r1]
	lsrs r5, r3, #0x10
	str r5, [sp]        @ sp00 = worldX
	asrs r3, r3, #0x10  @ r3 = worldX
	subs r0, r3, r0
	mov r5, sb
	strh r0, [r5, #0x16]
	ldrh r0, [r1, #2]
	lsrs r5, r2, #0x10
	str r5, [sp, #4]
	asrs r2, r2, #0x10
	subs r0, r2, r0
	subs r0, #3
	mov r5, sb
	strh r0, [r5, #0x18]
	ldrh r0, [r1]
	subs r3, r3, r0
	ldr r0, [sp, #8]
	strh r3, [r0, #0x16]
	ldrh r0, [r1, #2]
	subs r2, r2, r0
	mov r1, sl
	ldr r0, [r1, #0x7c]
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r3, [sp, #8]
	strh r2, [r3, #0x18]
	movs r6, #0
	ldr r5, _08092A94 @ =0x03000074
	adds r5, r5, r4
	mov r8, r5          @ r8 = r5 = &platform->unk74
	ldr r0, _08092A94 @ =0x03000074
	adds r0, r4, r0
	str r0, [sp, #0x10] @ sp10 = &platform->unk74
_08092A34_loop:
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r6
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	beq _08092AC8
	ldr r5, [sp]
	lsls r3, r5, #0x10
	asrs r7, r3, #0x10
	mov r0, sl
	ldr r1, [r0, #0x7c]
	asrs r1, r1, #8
	ldr r5, [sp, #4]
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r5, _08092A98 @ =gPlayer
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r6, #0
	beq _08092A66
	ldr r5, _08092A9C @ =gPartner
_08092A66:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _08092AA0
	movs r1, #1
	lsls r1, r6
	mov r2, r8
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	b _08092BE4_continue
	.align 2, 0
_08092A84: .4byte gCurTask
_08092A88: .4byte 0x0300000C
_08092A8C: .4byte 0x03000044
_08092A90: .4byte gCamera
_08092A94: .4byte 0x03000074
_08092A98: .4byte gPlayer
_08092A9C: .4byte gPartner
_08092AA0:
	mov r3, sl
	ldr r1, [r3, #0x78]
	cmp r6, #0
	beq _08092AB8
	ldr r5, _08092AB4 @ =gPartner
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	b _08092BE4_continue
	.align 2, 0
_08092AB4: .4byte gPartner
_08092AB8:
	ldr r2, _08092AC4 @ =gPlayer
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
	b _08092BE4_continue
	.align 2, 0
_08092AC4: .4byte gPlayer
_08092AC8:
	ldr r3, [sp]        @ r3 = sp00 = worldX
	lsls r0, r3, #0x10
	asrs r7, r0, #0x10  @ r7 = worldX
	mov r5, sl          @ r5 = sl = platform
	ldr r1, [r5, #0x7c]
	asrs r1, r1, #8
	ldr r3, [sp, #4]    @ r3 = worldY
	lsls r2, r3, #0x10
	asrs r4, r2, #0x10  @ r4 = worldY
	adds r1, r4, r1
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	ldr r5, _08092B14 @ =gPlayer
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r6, #0
	beq _08092AEC
	ldr r5, _08092B18 @ =gPartner
_08092AEC:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl Coll_Player_PlatformCrumbling
	cmp r0, #0
	beq _08092BD8
	mov r5, sl
	ldr r0, [r5, #0x7c]
	asrs r0, r0, #8
	adds r0, r4, r0
	subs r0, #0x1b
	lsls r0, r0, #8
	cmp r6, #0
	beq _08092B1C
	ldr r1, _08092B18 @ =gPartner
	str r0, [r1, #4]
	b _08092B20
	.align 2, 0
_08092B14: .4byte gPlayer
_08092B18: .4byte gPartner
_08092B1C:
	ldr r2, _08092B40 @ =gPlayer
	str r0, [r2, #4]
_08092B20:
	movs r0, #1
	lsls r0, r6
	ldr r3, [sp, #0x10] @ r3 = &platform->unk74
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	cmp r6, #0
	beq _08092B48
	ldr r5, _08092B44 @ =gPartner
	ldr r0, [r5, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08092B54
	b _08092B60
	.align 2, 0
_08092B40: .4byte gPlayer
_08092B44: .4byte gPartner
_08092B48:
	ldr r1, _08092B6C @ =gPlayer
	ldr r0, [r1, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08092B60
_08092B54:
	movs r1, #1
	lsls r1, r6
	ldr r2, [sp, #0x10] @ r2 = &platform->unk74
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_08092B60:
	cmp r6, #0
	beq _08092B74
	ldr r3, _08092B70 @ =gPartner
	movs r5, #0xa
	ldrsh r0, [r3, r5]
	b _08092B7A
	.align 2, 0
_08092B6C: .4byte gPlayer
_08092B70: .4byte gPartner
_08092B74:
	ldr r1, _08092B90 @ =gPlayer
	movs r2, #0xa
	ldrsh r0, [r1, r2]
_08092B7A:
	cmp r0, #0
	bne _08092BE4_continue
	cmp r6, #0
	beq _08092B98
	ldr r3, _08092B94 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #4
	bne _08092BA2
	b _08092BE4_continue
	.align 2, 0
_08092B90: .4byte gPlayer
_08092B94: .4byte gPartner + 0x40
_08092B98:
	ldr r5, _08092BBC @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #4
	beq _08092BE4_continue
_08092BA2:
	ldr r0, _08092BC0 @ =gPlayer
	cmp r6, #0
	beq _08092BAA
	ldr r0, _08092BC4 @ =gPartner
_08092BAA:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _08092BCC
	movs r0, #4
	ldr r1, _08092BC8 @ =gPartner + 0x40
	strb r0, [r1]
	b _08092BE4_continue
	.align 2, 0
_08092BBC: .4byte gPlayer + 0x40
_08092BC0: .4byte gPlayer
_08092BC4: .4byte gPartner
_08092BC8: .4byte gPartner + 0x40
_08092BCC:
	movs r0, #4
	ldr r2, _08092BD4 @ =gPlayer + 0x40
	strb r0, [r2]
	b _08092BE4_continue
	.align 2, 0
_08092BD4: .4byte gPlayer + 0x40
_08092BD8:
	movs r1, #1
	lsls r1, r6
	mov r3, r8
	ldrb r0, [r3]
	bics r0, r1
	strb r0, [r3]
_08092BE4_continue:
	adds r6, #1
	ldr r0, _08092C1C @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bge _08092BF4
	b _08092A34_loop
_08092BF4:
	mov r0, sl
	adds r0, #0x84
	ldr r2, [r0]
	subs r1, r2, #1
	str r1, [r0]
	cmp r1, #0x30
	bne _08092C24
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08092C20 @ =0x00000231
	mov r5, sb
	strh r0, [r5, #0xa]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
	b _08092E54
	.align 2, 0
_08092C1C: .4byte gNumSingleplayerCharacters
_08092C20: .4byte 0x00000231
_08092C24:
	adds r0, r2, #0
	subs r0, #0x32
	cmp r0, #0x2e
	bls _08092C2E
	b _08092E68
_08092C2E:
	movs r5, #0
	ldr r6, _08092C80 @ =gPlayerBodyPSI+0xC+0x28
	ldr r0, [sp, #0x14]
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r4, _08092C84 @ =gPartner
	ldr r7, _08092C88 @ =gPlayer
	ldr r1, [sp, #0x18]
	asrs r1, r1, #0x10
	mov r8, r1
_08092C42_loop:
	ldr r1, _08092C80 @ =gPlayerBodyPSI+0xC+0x28
	cmp r5, #0
	beq _08092C4A
	ldr r1, _08092C8C @ =gPartnerBodyPSI+0xC+0x28
_08092C4A:
	ldr r1, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08092C56
	b _08092E44_continue
_08092C56:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092C5E
	ldr r0, _08092C8C @ =gPartnerBodyPSI+0xC+0x28
_08092C5E:
	movs r3, #4
	ldrsb r3, [r0, r3]
	mov r1, sb          @ r1 = sb = s
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldr r0, [sp, #0xc]
	adds r2, r0, r2
	cmp r5, #0
	beq _08092C90
	ldr r0, [r4]
	asrs r0, r0, #8
	adds r0, r0, r3
	cmp r2, r0
	ble _08092C9A
	b _08092CCA
	.align 2, 0
_08092C80: .4byte gPlayerBodyPSI+0xC+0x28
_08092C84: .4byte gPartner
_08092C88: .4byte gPlayer
_08092C8C: .4byte gPartnerBodyPSI+0xC+0x28
_08092C90:
	ldr r0, [r7]
	asrs r0, r0, #8
	adds r0, r0, r3
	cmp r2, r0
	bgt _08092CCA
_08092C9A:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092CA2
	ldr r0, _08092CBC @ =gPartnerBodyPSI+0xC+0x28
_08092CA2:
	movs r3, #4
	ldrsb r3, [r0, r3]
	mov r0, sb
	adds r0, #0x36
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, [sp, #0xc]
	adds r2, r2, r0
	cmp r5, #0
	beq _08092CC0
	ldr r0, [r4]
	b _08092CC2
	.align 2, 0
_08092CBC: .4byte gPartnerBodyPSI+0xC+0x28
_08092CC0:
	ldr r0, [r7]
_08092CC2:
	asrs r0, r0, #8
	adds r0, r0, r3
	cmp r2, r0
	bge _08092D56
_08092CCA:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092CD2
	ldr r0, _08092CF0 @ =gPartnerBodyPSI+0xC+0x28
_08092CD2:
	movs r2, #4
	ldrsb r2, [r0, r2]
	movs r3, #0
	ldrsb r3, [r1, r3]
	ldr r0, [sp, #0xc]
	adds r3, r0, r3
	cmp r5, #0
	beq _08092CF4
	ldr r0, [r4]
	asrs r0, r0, #8
	adds r0, r0, r2
	cmp r3, r0
	bge _08092D00
	b _08092E44_continue
	.align 2, 0
_08092CF0: .4byte gPartnerBodyPSI+0xC+0x28
_08092CF4:
	ldr r0, [r7]
	asrs r0, r0, #8
	adds r0, r0, r2
	cmp r3, r0
	bge _08092D00
	b _08092E44_continue
_08092D00:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092D08
	ldr r0, _08092D44 @ =gPartnerBodyPSI+0xC+0x28
_08092D08:
	movs r3, #4
	ldrsb r3, [r0, r3]
	adds r0, r6, #0
	cmp r5, #0
	beq _08092D14
	ldr r0, _08092D44 @ =gPartnerBodyPSI+0xC+0x28
_08092D14:
	movs r2, #6
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	cmp r5, #0
	beq _08092D20
	ldr r0, _08092D44 @ =gPartnerBodyPSI+0xC+0x28
_08092D20:
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r2, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	cmp r5, #0
	beq _08092D48
	ldr r0, [r4]
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r2
	cmp r0, r1
	bge _08092D56
	b _08092E44_continue
	.align 2, 0
_08092D44: .4byte gPartnerBodyPSI+0xC+0x28
_08092D48:
	ldr r0, [r7]
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r2
	cmp r0, r1
	bge _08092D56
	b _08092E44_continue
_08092D56:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092D5E
	ldr r0, _08092D7C @ =gPartnerBodyPSI+0xC+0x28
_08092D5E:
	movs r3, #5
	ldrsb r3, [r0, r3]
	mov r1, sb
	adds r1, #0x35
	movs r2, #0
	ldrsb r2, [r1, r2]
	add r2, r8
	cmp r5, #0
	beq _08092D80
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, r0, r3
	cmp r2, r0
	ble _08092D8A
	b _08092DB6
	.align 2, 0
_08092D7C: .4byte gPartnerBodyPSI+0xC+0x28
_08092D80:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	adds r0, r0, r3
	cmp r2, r0
	bgt _08092DB6
_08092D8A:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092D92
	ldr r0, _08092DA8 @ =gPartnerBodyPSI+0xC+0x28
_08092D92:
	movs r3, #5
	ldrsb r3, [r0, r3]
	mov r0, sb
	adds r0, #0x37
	movs r2, #0
	ldrsb r2, [r0, r2]
	add r2, r8
	cmp r5, #0
	beq _08092DAC
	ldr r0, [r4, #4]
	b _08092DAE
	.align 2, 0
_08092DA8: .4byte gPartnerBodyPSI+0xC+0x28
_08092DAC:
	ldr r0, [r7, #4]
_08092DAE:
	asrs r0, r0, #8
	adds r0, r0, r3
	cmp r2, r0
	bge _08092E38
_08092DB6:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092DBE
	ldr r0, _08092DD8 @ =gPartnerBodyPSI+0xC+0x28
_08092DBE:
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r3, #0
	ldrsb r3, [r1, r3]
	add r3, r8
	cmp r5, #0
	beq _08092DDC
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, r0, r2
	cmp r3, r0
	bge _08092DE6
	b _08092E44_continue
	.align 2, 0
_08092DD8: .4byte gPartnerBodyPSI+0xC+0x28
_08092DDC:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	adds r0, r0, r2
	cmp r3, r0
	blt _08092E44_continue
_08092DE6:
	adds r0, r6, #0
	cmp r5, #0
	beq _08092DEE
	ldr r0, _08092E28 @ =gPartnerBodyPSI+0xC+0x28
_08092DEE:
	movs r3, #5
	ldrsb r3, [r0, r3]
	adds r0, r6, #0
	cmp r5, #0
	beq _08092DFA
	ldr r0, _08092E28 @ =gPartnerBodyPSI+0xC+0x28
_08092DFA:
	movs r2, #7
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	cmp r5, #0
	beq _08092E06
	ldr r0, _08092E28 @ =gPartnerBodyPSI+0xC+0x28
_08092E06:
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r2, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	add r1, r8
	cmp r5, #0
	beq _08092E2C
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r2
	cmp r0, r1
	bge _08092E38
	b _08092E44_continue
	.align 2, 0
_08092E28: .4byte gPartnerBodyPSI+0xC+0x28
_08092E2C:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	adds r0, r0, r3
	adds r0, r0, r2
	cmp r0, r1
	blt _08092E44_continue
_08092E38:
	ldr r0, _08092E5C @ =gPlayer
	cmp r5, #0
	beq _08092E40
	ldr r0, _08092E60 @ =gPartner
_08092E40:
	bl Coll_DamagePlayer
_08092E44_continue:
	adds r5, #1
	ldr r0, _08092E64 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bge _08092E54
	b _08092C42_loop
_08092E54:
	mov r0, sb
	bl UpdateSpriteAnimation
	b _08092E92
	.align 2, 0
_08092E5C: .4byte gPlayer
_08092E60: .4byte gPartner
_08092E64: .4byte gNumSingleplayerCharacters
_08092E68:
	cmp r1, #0x2f
	bgt _08092E92
	mov r0, sb
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _08092E8C
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08092EC4 @ =0x00000231
	mov r2, sb
	strh r0, [r2, #0xa]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
_08092E8C:
	mov r0, sb
	bl UpdateSpriteAnimation
_08092E92:
	mov r3, sl
	ldr r0, [r3, #0x7c]
	cmp r0, #0
	blt _08092EE6
	mov r1, sl
	adds r1, #0x80
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	cmp r0, #0
	beq _08092EC8
	ldr r0, [r3, #0x78]
	lsls r0, r0, #1
	movs r1, #5
	bl Div
	rsbs r0, r0, #0
	mov r5, sl
	str r0, [r5, #0x78]
	movs r0, #0
	ldr r1, [sp, #0x10] @ r1 = &platform->unk74
	strb r0, [r1]
	str r0, [r5, #0x7c]
	b _08092EE6
	.align 2, 0
_08092EC4: .4byte 0x00000231
_08092EC8:
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08092F08 @ =0x00000231
	mov r2, sb
	strh r0, [r2, #0xa]
	mov r0, sb
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _08092F0C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08092F10 @ =Task_UnderwaterLavaPlatform
	str r0, [r1, #8]
_08092EE6:
	mov r0, sb
	bl DisplaySprite
	ldr r0, [sp, #8]
	bl UpdateSpriteAnimation
	ldr r0, [sp, #8]
	bl DisplaySprite
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092F08: .4byte 0x00000231
_08092F0C: .4byte gCurTask
_08092F10: .4byte Task_UnderwaterLavaPlatform

.syntax divided
