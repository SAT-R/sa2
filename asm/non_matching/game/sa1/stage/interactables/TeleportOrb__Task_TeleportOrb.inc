.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08084A78 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0     @ r7 = orb
	ldr r0, [r7]
	str r0, [sp, #0x10] @ sp10 = me
	ldrb r1, [r7, #8]
	lsls r1, r1, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10  @ r1 = worldX << 16
	ldr r5, [sp, #0x10] @ r5 = sp10 = me
	ldrb r2, [r5, #1]
	lsls r2, r2, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _08084A7C @ =gCamera
	ldrh r0, [r3]
	lsrs r5, r1, #0x10
	str r5, [sp]        @ sp00 = worldX
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]    @ sp08 = screenX
	ldrh r0, [r3, #2]
	lsrs r1, r2, #0x10
	str r1, [sp, #4]    @ sp04 = worldY
	asrs r2, r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0xc]  @ sp0C = screenY
	movs r5, #0
	mov ip, r3          @ ip = r3 = gCamera
	ldr r2, _08084A80 @ =0x03000044
	adds r2, r2, r4
	mov r8, r2          @ r8 = &orb->unk44
	ldr r4, _08084A84 @ =gPartner
	ldr r6, _08084A88 @ =gPlayer
	movs r0, #0x26
	adds r0, r0, r4
	mov sl, r0
	movs r1, #0x26
	adds r1, r1, r6
	mov sb, r1          @ sb = &gPlayer.itemEffect
	movs r3, #0
_08084A44_loop:
	adds r0, r7, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08084A58
	b _08084CCC
_08084A58:
	mov r0, ip          @ r0 = ip = gCamera
	ldr r1, [r0]
	ldr r0, [r7, #0x40]
	cmp r1, r0
	beq _08084A64
	b _08084B72
_08084A64:
	mov r2, ip          @ r2 = ip = gCamera
	movs r0, #0
	ldrsh r1, [r2, r0]
	cmp r5, #0
	beq _08084A8C
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _08084A94
	b _08084B72
	.align 2, 0
_08084A78: .4byte gCurTask
_08084A7C: .4byte gCamera
_08084A80: .4byte 0x03000044
_08084A84: .4byte gPartner
_08084A88: .4byte gPlayer
_08084A8C:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	bgt _08084B72
_08084A94:
	mov r1, ip          @ r1 = ip = gCamera
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r1, r0, #0
	adds r1, #0xf0
	cmp r5, #0
	beq _08084AAC
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08084AB4
	b _08084B72
_08084AAC:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	blt _08084B72
_08084AB4:
	mov r0, ip
	movs r2, #2
	ldrsh r1, [r0, r2]
	cmp r5, #0
	beq _08084AC8
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _08084AD0
	b _08084B72
_08084AC8:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bgt _08084B72
_08084AD0:
	mov r1, ip
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r1, r0, #0
	adds r1, #0xa0
	cmp r5, #0
	beq _08084AE8
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08084AF0
	b _08084B72
_08084AE8:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	blt _08084B72
_08084AF0:
	cmp r5, #0
	beq _08084B04
	ldr r0, [r4, #0x10]
	ldr r1, _08084B00 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08084B0C
	.align 2, 0
_08084B00: .4byte 0xFFBFFFFF
_08084B04:
	ldr r0, [r6, #0x10]
	ldr r1, _08084B1C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08084B0C:
	cmp r5, #0
	beq _08084B20
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08084B28
	.align 2, 0
_08084B1C: .4byte 0xFFBFFFFF
_08084B20:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_08084B28:
	movs r0, #1
	lsls r0, r5
	mov r2, r8      @ r2 = r8 = &orb->unk44
	ldrh r1, [r2]
	bics r1, r0
	movs r0, #0
	strh r1, [r2]
	cmp r5, #0
	beq _08084B3E
	strh r0, [r4, #0xa]
	b _08084B40
_08084B3E:
	strh r5, [r6, #0xa]
_08084B40:
	cmp r5, #0
	beq _08084B48
	strh r3, [r4, #8]
	b _08084B4A
_08084B48:
	strh r5, [r6, #8]
_08084B4A:
	cmp r5, #0
	beq _08084B52
	strh r3, [r4, #0xc]
	b _08084B54
_08084B52:
	strh r5, [r6, #0xc]
_08084B54:
	cmp r5, #0
	beq _08084B66
	mov r0, sl      @ r0 = sl = 
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	mov r1, sl
	strb r0, [r1]
	b _08084C1A
_08084B66:
	mov r2, sb
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	b _08084C1A
_08084B72:
	ldr r0, _08084B94 @ =gPlayer
	cmp r5, #0
	beq _08084B7A
	ldr r0, _08084B98 @ =gPartner
_08084B7A:
	str r3, [sp, #0x14]
	bl Player_TransitionCancelFlyingAndBoost
	ldr r3, [sp, #0x14]
	cmp r5, #0
	beq _08084B9C
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08084BA6
	.align 2, 0
_08084B94: .4byte gPlayer
_08084B98: .4byte gPartner
_08084B9C:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x10]
_08084BA6:
	ldr r2, _08084BB0 @ =gPlayer
	cmp r5, #0
	beq _08084BB4
	strh r3, [r4, #0xa]
	b _08084BB6
	.align 2, 0
_08084BB0: .4byte gPlayer
_08084BB4:
	strh r5, [r2, #0xa]
_08084BB6:
	cmp r5, #0
	beq _08084BBE
	strh r3, [r4, #8]
	b _08084BC0
_08084BBE:
	strh r5, [r2, #8]
_08084BC0:
	cmp r5, #0
	beq _08084BC8
	strh r3, [r4, #0xc]
	b _08084BCA
_08084BC8:
	strh r5, [r2, #0xc]
_08084BCA:
	cmp r5, #0
	beq _08084BD8
	movs r0, #5
	ldr r1, _08084BD4 @ =gPartner + 0x40
	b _08084BDE
	.align 2, 0
_08084BD4: .4byte gPartner + 0x40
_08084BD8:
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #5
_08084BDE:
	strb r0, [r1]
	ldr r0, _08084C2C @ =gPlayer
	cmp r5, #0
	beq _08084BE8
	ldr r0, _08084C30 @ =gPartner
_08084BE8:
	movs r1, #0xe
	str r3, [sp, #0x14]
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08084C2C @ =gPlayer
	ldr r3, [sp, #0x14]
	cmp r5, #0
	beq _08084BFA
	ldr r1, _08084C30 @ =gPartner
_08084BFA:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08084C2C @ =gPlayer
	cmp r5, #0
	beq _08084C06
	ldr r1, _08084C30 @ =gPartner
_08084C06:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #1
	lsls r0, r5
	mov r2, r8      @ r2 = r8 = &orb->unk44
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08084C34 @ =gCamera
	mov ip, r0
_08084C1A: @@@@@@@@@@@@@@
	cmp r5, #0
	beq _08084C38
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08084C42
	b _08084CB8
	.align 2, 0
_08084C2C: .4byte gPlayer
_08084C30: .4byte gPartner
_08084C34: .4byte gCamera
_08084C38:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08084CB8
_08084C42:
	movs r1, #1
	lsls r1, r5
	mov r2, r8      @ r2 = s8 = &orb->unk44
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	cmp r5, #0
	beq _08084C60
	ldr r0, [r4, #0x10]
	ldr r1, _08084C5C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08084C68
	.align 2, 0
_08084C5C: .4byte 0xFFBFFFFF
_08084C60:
	ldr r0, [r6, #0x10]
	ldr r1, _08084C74 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08084C68:
	cmp r5, #0
	beq _08084C7C
	ldr r1, _08084C78 @ =gPartner + 0x3C
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _08084C82
	.align 2, 0
_08084C74: .4byte 0xFFBFFFFF
_08084C78: .4byte gPartner + 0x3C
_08084C7C:
	ldr r2, _08084C98 @ =gPlayer + 0x3C
	movs r0, #0
	ldrsb r0, [r2, r0]
_08084C82:
	cmp r0, #0
	bne _08084CB8
	mov r1, ip
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r0, #0x50
	lsls r0, r0, #8
	cmp r5, #0
	beq _08084C9C
	str r0, [r4, #4]
	b _08084C9E
	.align 2, 0
_08084C98: .4byte gPlayer + 0x3C
_08084C9C:
	str r0, [r6, #4]
_08084C9E:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r0, #0x78
	lsls r0, r0, #8
	cmp r5, #0
	beq _08084CB0
	str r0, [r4]
	b _08084CB2
_08084CB0:
	str r0, [r6]
_08084CB2:
	mov r0, ip
	strh r3, [r0, #6]
	strh r3, [r0, #4]
_08084CB8:
	mov r1, ip
	ldrh r0, [r1]
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	mov r2, ip
	ldrh r0, [r2, #2]
	adds r1, #2
	strh r0, [r1]
	b _08084E8C_continue
_08084CCC:
	cmp r5, #0
	beq _08084CD4
	ldr r0, [r4, #0x10]
	b _08084CD6
_08084CD4:
	ldr r0, [r6, #0x10]
_08084CD6:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08084CE0
	b _08084E8C_continue
_08084CE0:
	ldr r0, [sp]    @ r0 = sp00 = worldX
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #0xc
	cmp r5, #0
	beq _08084CF8
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08084D02
	b _08084E8C_continue
_08084CF8:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08084D02
	b _08084E8C_continue
_08084D02:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0xc
	cmp r5, #0
	beq _08084D16
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08084D20
	b _08084E8C_continue
_08084D16:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08084D20
	b _08084E8C_continue
_08084D20:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #0xc
	cmp r5, #0
	beq _08084D38
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08084D42
	b _08084E8C_continue
_08084D38:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08084D42
	b _08084E8C_continue
_08084D42:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0xc
	cmp r5, #0
	beq _08084D56
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08084D60
	b _08084E8C_continue
_08084D56:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08084D60
	b _08084E8C_continue
_08084D60:
	ldr r0, _08084D80 @ =gPlayer
	cmp r5, #0
	beq _08084D68
	ldr r0, _08084D84 @ =gPartner
_08084D68:
	str r3, [sp, #0x14]
	bl Player_TransitionCancelFlyingAndBoost
	ldr r3, [sp, #0x14]
	cmp r5, #0
	beq _08084D88
	ldr r0, [r4, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08084D90
	.align 2, 0
_08084D80: .4byte gPlayer
_08084D84: .4byte gPartner
_08084D88:
	ldr r0, [r6, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_08084D90:
	ldr r2, _08084DA4 @ =gPlayer
	cmp r5, #0
	beq _08084DA8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08084DB2
	.align 2, 0
_08084DA4: .4byte gPlayer
_08084DA8:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x10]
_08084DB2:
	ldrh r0, [r7, #0x3c]
	adds r1, r7, #0
	adds r1, #0x46
	lsls r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	cmp r5, #0
	beq _08084DC6
	str r0, [r4]
	b _08084DC8
_08084DC6:
	str r0, [r2]
_08084DC8:
	ldrh r0, [r7, #0x3e]
	adds r1, r7, #0
	adds r1, #0x48
	lsls r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	cmp r5, #0
	beq _08084DDC
	str r0, [r4, #4]
	b _08084DDE
_08084DDC:
	str r0, [r2, #4]
_08084DDE:
	cmp r5, #0
	beq _08084DE6
	strh r3, [r4, #0xa]
	b _08084DE8
_08084DE6:
	strh r5, [r2, #0xa]
_08084DE8:
	cmp r5, #0
	beq _08084DF0
	strh r3, [r4, #8]
	b _08084DF2
_08084DF0:
	strh r5, [r2, #8]
_08084DF2:
	cmp r5, #0
	beq _08084DFA
	strh r3, [r4, #0xc]
	b _08084DFC
_08084DFA:
	strh r5, [r2, #0xc]
_08084DFC:
	cmp r5, #0
	beq _08084E0C
	movs r0, #5
	ldr r1, _08084E08 @ =gPartner + 0x40
	b _08084E12
	.align 2, 0
_08084E08: .4byte gPartner + 0x40
_08084E0C:
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #5
_08084E12:
	strb r0, [r1]
	ldr r0, _08084E64 @ =gPlayer
	cmp r5, #0
	beq _08084E1C
	ldr r0, _08084E68 @ =gPartner
_08084E1C:
	movs r1, #0xe
	str r3, [sp, #0x14]
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08084E64 @ =gPlayer
	ldr r3, [sp, #0x14]
	cmp r5, #0
	beq _08084E2E
	ldr r1, _08084E68 @ =gPartner
_08084E2E:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08084E64 @ =gPlayer
	cmp r5, #0
	beq _08084E3A
	ldr r1, _08084E68 @ =gPartner
_08084E3A:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #0xaa
	str r3, [sp, #0x14]
	bl m4aSongNumStart
	movs r0, #1
	lsls r0, r5
	mov r2, r8      @ r2 = r8 = &orb->unk44
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldr r3, [sp, #0x14] @ r3 = sp14 = 
	cmp r5, #0
	beq _08084E6C
	mov r1, sl
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	mov r2, sl
	b _08084E76
	.align 2, 0
_08084E64: .4byte gPlayer
_08084E68: .4byte gPartner
_08084E6C:
	mov r1, sb
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	mov r2, sb
_08084E76:
	strb r0, [r2]
	ldr r2, _08084EF0 @ =gCamera
	ldrh r1, [r2]
	adds r0, r7, #0
	adds r0, #0x40
	strh r1, [r0]
	ldrh r0, [r2, #2]
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	mov ip, r2
_08084E8C_continue:
	adds r5, #1
	ldr r0, _08084EF4 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bge _08084E9C
	b _08084A44_loop
_08084E9C:
	mov r5, r8      @ r5 = r8 = &orb->unk44
	ldrh r1, [r5]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08084EDE
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #0x10
	adds r0, r0, r2
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08084ED0
	ldr r5, [sp, #0xc]
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08084ED0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r2, r0
	ble _08084EDE
_08084ED0:
	ldrb r0, [r7, #8]
	ldr r1, [sp, #0x10] @ r1 = sp10 = me
	strb r0, [r1]
	ldr r0, _08084EF8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08084EDE:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084EF0: .4byte gCamera
_08084EF4: .4byte gNumSingleplayerCharacters
_08084EF8: .4byte gCurTask

.syntax divided
