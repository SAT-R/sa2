
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0
	mov sl, r0
	ldr r1, _0801E874 @ =gCurTask
	mov sb, r1
	ldr r0, [r1]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0     @ r6 = itembox
	ldr r2, _0801E878 @ =0x0300000C
	adds r4, r5, r2     @ r4 = s
	ldr r3, [r6]
	str r3, [sp, #8]    @ sp08 = me
	ldrb r0, [r6, #8]
	lsls r0, r0, #3
	ldrh r1, [r6, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0          @ r8 = worldX
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	ldrh r1, [r6, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10  @ r7 = worldY
	ldr r0, _0801E87C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _0801E890
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801E890
	movs r0, #0xa7
	bl m4aSongNumStart
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r3, _0801E880 @ =0x0300006C
	adds r2, r5, r3
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CreateDustCloud
	mov r0, sb          @ r0 = sb = gCurTask
	ldr r1, [r0]
	ldr r0, _0801E884 @ =Task_Itembox3
	str r0, [r1, #8]
	ldr r1, _0801E888 @ =0x03000070
	adds r0, r5, r1
	mov r2, sl
	strb r2, [r0]
	ldr r2, _0801E88C @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0801E85E
	b _0801EC0A_return
_0801E85E:
	ldr r0, [r2, #0x28]
	cmp r0, r4
	beq _0801E866
	b _0801EC0A_return
_0801E866:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x10]
	b _0801EC0A_return
	.align 2, 0
_0801E874: .4byte gCurTask
_0801E878: .4byte 0x0300000C
_0801E87C: .4byte gGameMode
_0801E880: .4byte 0x0300006C
_0801E884: .4byte Task_Itembox3
_0801E888: .4byte 0x03000070
_0801E88C: .4byte gPlayer
_0801E890:
	adds r0, r6, #0     @ r0 = r6 = itembox
	adds r0, #0x70
	ldrb r1, [r0]
	mov r3, r8          @ r3 = r8 = worldX
	lsls r3, r3, #0x10
	mov r8, r3          @ r8 = worldX << 16
	lsls r7, r7, #0x10
	mov sb, r7          @ sb = r7 = worldY << 16
	str r0, [sp, #0xc]  @ sp0C = &itembox->unk70
	adds r7, r6, #0
	adds r7, #0x6c      @ r7 = &itembox->iconOffset
	cmp r1, #0
	beq _0801E8F0
	adds r1, r6, #0
	adds r1, #0x6e
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r5, [r7]
	adds r0, r0, r5
	movs r2, #0
	strh r0, [r7]
	ldrh r0, [r1]
	adds r0, #0x28
	strh r0, [r1]
	mov r1, sb          @ r1 = worldY
	asrs r0, r1, #0x10
	movs r3, #0
	ldrsh r1, [r7, r3]
	adds r0, r0, r1         @ r0 = worldY + iconOffset
	mov r5, r8
	asrs r1, r5, #0x10      @ r1 = worldX
	str r2, [sp]
	ldr r2, _0801E9DC @ =sa2__sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F07C
	adds r1, r0, #0
	cmp r1, #0
	bge _0801E8F0
	ldrh r0, [r7]
	adds r0, r0, r1
	strh r0, [r7]
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
_0801E8F0:
	ldr r2, _0801E9E0 @ =gCamera
	ldrh r1, [r2]
	mov r3, r8          @ r3 = r8 = worldX << 16
	asrs r0, r3, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldrh r1, [r2, #2]
	mov r5, sb          @ r5 = sb = worldY << 16
	asrs r0, r5, #0x10
	subs r0, r0, r1
	ldrh r1, [r7]
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, _0801E9E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _0801E916
	cmp r0, #5
	bne _0801E95E
_0801E916:
	movs r2, #0
	ldr r1, _0801E9E8 @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	cmp r0, #0
	beq _0801E95E
	adds r3, r1, #0
_0801E922:
	ldr r0, _0801E9EC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r2, r0
	beq _0801E94A
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801E94A
	movs r5, #1
	mov sl, r5
_0801E94A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0801E95E
	lsls r0, r2, #2
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	bne _0801E922
_0801E95E:
	ldr r5, _0801E9F0 @ =gPlayer
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801E974
	mov r0, sl
	cmp r0, #0
	bne _0801E974
	b _0801EADC
_0801E974:
	ldr r0, _0801E9F4 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _0801E998
	mov r2, r8          @ r2 = r8 = worldX << 16
	asrs r1, r2, #0x10
	mov r3, sb          @ r3 = sb = worldY << 16
	asrs r2, r3, #0x10
	ldrh r0, [r7]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0801E9F8 @ =gPartner
	adds r0, r4, #0
	bl Coll_Player_Platform
_0801E998:
	ldr r0, [r5, #0x10]
	movs r1, #8
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	beq _0801E9AA
	ldr r0, [r5, #0x28]
	cmp r0, r4
	beq _0801E9B6
_0801E9AA:
	ldr r0, [r5, #0x64]
	ldr r1, [r0, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801E9FC
_0801E9B6:
	mov r2, r8          @ r2 = r8 = worldX << 16
	asrs r1, r2, #0x10
	mov r3, sb          @ r3 = sb = worldY << 16
	asrs r2, r3, #0x10
	ldrh r5, [r7]
	adds r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0801E9F0 @ =gPlayer
	adds r0, r4, #0
	bl Coll_Player_Platform
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	bne _0801E9DA
	b _0801EADC
_0801E9DA:
	b _0801EA20
	.align 2, 0
_0801E9DC: .4byte sa2__sub_801EE64
_0801E9E0: .4byte gCamera
_0801E9E4: .4byte gGameMode
_0801E9E8: .4byte gMultiplayerPlayerTasks
_0801E9EC: .4byte 0x04000128
_0801E9F0: .4byte gPlayer
_0801E9F4: .4byte gNumSingleplayerCharacters
_0801E9F8: .4byte gPartner
_0801E9FC:
	mov r2, r8          @ r2 = r8 = worldX << 16
	asrs r1, r2, #0x10
	mov r3, sb          @ r3 = sb = worldY << 16
	asrs r2, r3, #0x10
	ldrh r0, [r7]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r3, r5, #0
	bl Coll_Player_Itembox
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0801EA32
_0801EA20:
	adds r1, r6, #0
	adds r1, #0x6e
	movs r0, #0xff
	lsls r0, r0, #8
	strh r0, [r1]
	movs r0, #0xff
	ldr r1, [sp, #0xc]  @ r1 = sp0C = &itembox->unk70
	strb r0, [r1]
	b _0801EADC
_0801EA32:
	movs r0, #0x28
	ands r0, r1
	cmp r0, #0
	beq _0801EADC
	ldr r2, _0801EAC8 @ =gPlayer
	ldr r1, [r2, #0x10]
	adds r0, r1, #0
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	beq _0801EA5E
	ldr r0, [r2, #0x28]
	cmp r0, r4
	bne _0801EA5E
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0x18
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x10]
_0801EA5E:
	ldr r2, _0801EACC @ =gPartner
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801EA80
	ldr r0, [r2, #0x28]
	cmp r0, r4
	bne _0801EA80
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0x18
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x10]
_0801EA80:      @ BreakItemBox() in SA2!
	movs r0, #0xa7
	bl m4aSongNumStart
	mov r5, r8          @ r5 = r8 = worldX << 16
	asrs r0, r5, #0x10
	mov r2, sb          @ r2 = sb = worldY << 16
	asrs r1, r2, #0x10
	ldrh r7, [r7]
	adds r1, r1, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl CreateDustCloud
	ldr r0, _0801EAD0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801EAD4 @ =Task_Itembox2
	str r0, [r1, #8]
	movs r0, #0
	ldr r3, [sp, #0xc]  @ r3 = sp0C = &itembox->unk70
	strb r0, [r3]
	ldr r0, _0801EAD8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0801EAB2
	b _0801EC0A_return
_0801EAB2:
	bl CreateRoomEvent
	movs r1, #2
	strb r1, [r0]
	ldrh r1, [r6, #4]
	strb r1, [r0, #1]
	ldrh r1, [r6, #6]
	strb r1, [r0, #2]
	ldrb r1, [r6, #9]
	strb r1, [r0, #3]
	b _0801EC0A_return
	.align 2, 0
_0801EAC8: .4byte gPlayer
_0801EACC: .4byte gPartner
_0801EAD0: .4byte gCurTask
_0801EAD4: .4byte Task_Itembox2
_0801EAD8: .4byte gGameMode
_0801EADC:
	mov r5, r8          @ r5 = r8 = worldX << 16
	asrs r2, r5, #0x10
	ldr r3, _0801EB4C @ =gCamera
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r1, r5
	cmp r2, r0
	bgt _0801EB12
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0801EB12
	mov r0, sb          @ r0 = sb = worldY << 16
	asrs r2, r0, #0x10
	movs r5, #2
	ldrsh r1, [r3, r5]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0801EB12
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0801EB54
_0801EB12:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0801EB3C
	movs r5, #0x18
	ldrsh r1, [r4, r5]
	movs r2, #0
	ldrsh r0, [r7, r2]
	adds r0, #0x80
	adds r1, r1, r0
	cmp r1, #0
	blt _0801EB3C
	movs r3, #0x18
	ldrsh r1, [r4, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0801EB54
_0801EB3C:
	ldrb r0, [r6, #8]
	ldr r5, [sp, #8]
	strb r0, [r5]
	ldr r0, _0801EB50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801EC0A_return
	.align 2, 0
_0801EB4C: .4byte gCamera
_0801EB50: .4byte gCurTask
_0801EB54:
	adds r0, r4, #0
	bl DisplaySprite
	adds r4, r6, #0     @ r4 = r6 = itembox
	adds r4, #0x3c      @ r4 = s
	ldr r0, _0801EBA8 @ =gGameMode
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0801EBEA
	ldr r0, _0801EBAC @ =gStageTime
	ldr r3, [r0]
	lsrs r0, r3, #5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801EBBC
	ldr r2, _0801EBB0 @ =gUnknown_080BB4F0
	ldr r0, _0801EBB4 @ =gMultiplayerPseudoRandom
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	adds r0, r0, r2
	ldrb r3, [r0]
	adds r1, r6, #0
	adds r1, #0x71
	strb r3, [r1]
	ldr r0, _0801EBB8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x19
	adds r2, r1, #0
	cmp r0, #5
	bne _0801EBD6
	cmp r3, #8
	bne _0801EBD6
	movs r0, #0xa
	strb r0, [r2]
	b _0801EBD6
	.align 2, 0
_0801EBA8: .4byte gGameMode
_0801EBAC: .4byte gStageTime
_0801EBB0: .4byte gUnknown_080BB4F0
_0801EBB4: .4byte gMultiplayerPseudoRandom
_0801EBB8: .4byte gCurrentLevel
_0801EBBC:
	ldr r2, _0801EC1C @ =gUnknown_080BB4E8
	lsrs r0, r3, #6
	ldr r1, [sp, #8]    @ r1 = sp08 = me
	ldrb r1, [r1, #2]
	adds r0, r0, r1
	movs r1, #7
	ands r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x71
	strb r1, [r0]   @ itembox->kind = 
	adds r2, r0, #0
_0801EBD6:
	ldr r1, _0801EC20 @ =gUnknown_080BB4D8
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]   @ s->variant = gUnknown_080BB4D8[itembox->kind];
	adds r0, r4, #0
	bl UpdateSpriteAnimation
_0801EBEA:
	ldr r2, _0801EC24 @ =gCamera
	ldrh r1, [r2]
	mov r3, r8          @ r3 = r8 = worldX << 16
	asrs r0, r3, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldrh r1, [r2, #2]
	mov r5, sb          @ r5 = sb = worldY << 16
	asrs r0, r5, #0x10
	subs r0, r0, r1
	ldrh r7, [r7]
	adds r0, r0, r7
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl DisplaySprite
_0801EC0A_return:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EC1C: .4byte gUnknown_080BB4E8
_0801EC20: .4byte gUnknown_080BB4D8
_0801EC24: .4byte gCamera

.syntax divided
