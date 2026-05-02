.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r5, _0807EFC4 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0     @ r6 = balloon
	adds r0, #0xc
	adds r7, r1, r0     @ r7 = s
	ldr r1, [r6]
	mov sl, r1          @ sl = me
	ldrb r1, [r6, #8]
	lsls r1, r1, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r1, r1, r0     @ r1 = worldX
	mov r0, sl
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r2, r2, r0     @ r2 = worldY
	ldr r4, _0807EFC8 @ =gCamera
	ldrh r3, [r4]
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r0, r1, #0x10
	subs r0, r0, r3
	strh r0, [r7, #0x16]
	ldrh r3, [r4, #2]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	subs r3, r1, r3
	strh r3, [r7, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0807EFB6
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0807EFB6
	lsls r1, r3, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0807EFCC
_0807EFB6:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, [r5]
	bl TaskDestroy
	b _0807F1F8
	.align 2, 0
_0807EFC4: .4byte gCurTask
_0807EFC8: .4byte gCamera
_0807EFCC:
	movs r4, #0
	mov r0, r8
	str r0, [sp]        @ sp00 = worldX << 16
	str r2, [sp, #4]    @ sp04 = worldY << 16
	ldr r5, _0807F004 @ =gPartner
	ldr r1, _0807F008 @ =gPlayer
	mov r8, r1
	movs r0, #1
	mov sb, r0          @ sb = 1
_0807EFDE_loop:
	ldr r0, [sp]
	asrs r1, r0, #0x10  @ r1 = worldX
	ldr r0, [sp, #4]
	asrs r2, r0, #0x10  @ r2 = worldY
	ldr r3, _0807F008 @ =gPlayer
	cmp r4, #0
	beq _0807EFEE
	ldr r3, _0807F004 @ =gPartner
_0807EFEE:
	adds r0, r7, #0
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _0807EFFA
	b _0807F1A0
_0807EFFA:
	cmp r4, #0
	beq _0807F00C
	ldr r0, [r5, #0x10]
	b _0807F010
	.align 2, 0
_0807F004: .4byte gPartner
_0807F008: .4byte gPlayer
_0807F00C:
	mov r1, r8
	ldr r0, [r1, #0x10]
_0807F010:
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0807F01C
	b _0807F1A0
_0807F01C:
	ldr r0, _0807F038 @ =gPlayer
	cmp r4, #0
	beq _0807F024
	ldr r0, _0807F03C @ =gPartner
_0807F024:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r4, #0
	beq _0807F040
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _0807F04E
	.align 2, 0
_0807F038: .4byte gPlayer
_0807F03C: .4byte gPartner
_0807F040:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_0807F04E:
	cmp r4, #0
	beq _0807F05C
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
	b _0807F068
_0807F05C:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_0807F068:
	cmp r4, #0
	beq _0807F07C
	ldr r0, [r5, #0x10]
	ldr r1, _0807F078 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _0807F088
	.align 2, 0
_0807F078: .4byte 0xFFFFFEFF
_0807F07C:
	mov r1, r8
	ldr r0, [r1, #0x10]
	ldr r1, _0807F098 @ =0xFFFFFEFF
	ands r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_0807F088:
	cmp r4, #0
	beq _0807F09C
	ldr r0, [r5, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _0807F0AA
	.align 2, 0
_0807F098: .4byte 0xFFFFFEFF
_0807F09C:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_0807F0AA:
	cmp r4, #0
	beq _0807F0BA
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _0807F0C8
_0807F0BA:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_0807F0C8:
	ldr r0, _0807F0FC @ =gPlayer
	cmp r4, #0
	beq _0807F0D0
	ldr r0, _0807F100 @ =gPartner
_0807F0D0:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _0807F0FC @ =gPlayer
	cmp r4, #0
	beq _0807F0DE
	ldr r1, _0807F100 @ =gPartner
_0807F0DE:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _0807F0FC @ =gPlayer
	adds r2, r1, #0
	cmp r4, #0
	beq _0807F0EC
	ldr r2, _0807F100 @ =gPartner
_0807F0EC:
	movs r0, #0xe
	strb r0, [r2, #0xf]
	cmp r4, #0
	beq _0807F104
	movs r0, #0xfa
	lsls r0, r0, #8
	strh r0, [r5, #0xa]
	b _0807F10A
	.align 2, 0
_0807F0FC: .4byte gPlayer
_0807F100: .4byte gPartner
_0807F104:
	movs r0, #0xfa
	lsls r0, r0, #8
	strh r0, [r1, #0xa]
_0807F10A:
	cmp r4, #0
	beq _0807F118
	movs r0, #0x15
	ldr r1, _0807F114 @ =gPartner + 0x40
	b _0807F11C
	.align 2, 0
_0807F114: .4byte gPartner + 0x40
_0807F118:
	adds r1, #0x40
	movs r0, #0x15
_0807F11C:
	strb r0, [r1]
	cmp r4, #0
	beq _0807F12C
	ldr r0, _0807F128 @ =gPartnerBodyPSI
	b _0807F12E
	.align 2, 0
_0807F128: .4byte gPartnerBodyPSI
_0807F12C:
	ldr r0, _0807F208 @ =gPlayerBodyPSI
_0807F12E:
	adds r0, #0x2d
	movs r1, #0xff
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0x21
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x20
	mov r1, sb
	strb r1, [r0]
	ldr r0, _0807F20C @ =gPlayer
	cmp r4, #0
	beq _0807F154
	ldr r0, _0807F210 @ =gPartner
_0807F154:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _0807F20C @ =gPlayer
	cmp r4, #0
	beq _0807F162
	ldr r1, _0807F210 @ =gPartner
_0807F162:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _0807F20C @ =gPlayer
	cmp r4, #0
	beq _0807F16E
	ldr r1, _0807F210 @ =gPartner
_0807F16E:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #0xbd
	bl m4aSongNumStart
	ldr r0, _0807F214 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F218 @ =Task_PartyBalloonPopped
	str r0, [r1, #8]
	ldr r0, _0807F21C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _0807F1DC
	bl CreateRoomEvent
	mov r1, sb
	strb r1, [r0]
	ldrh r1, [r6, #4]
	strb r1, [r0, #1]
	ldrh r1, [r6, #6]
	strb r1, [r0, #2]
	ldrb r1, [r6, #9]
	strb r1, [r0, #3]
	mov r1, sb
	strb r1, [r0, #4]
_0807F1A0:
	ldr r0, _0807F21C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _0807F1DC
	mov r0, sl
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807F1DC
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0x21
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x20
	mov r1, sb
	strb r1, [r0]
	movs r0, #0xbd
	bl m4aSongNumStart
	ldr r0, _0807F214 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807F218 @ =Task_PartyBalloonPopped
	str r0, [r1, #8]
_0807F1DC:
	adds r4, #1
	ldr r0, _0807F220 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bge _0807F1EC
	b _0807EFDE_loop
_0807F1EC:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
_0807F1F8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F208: .4byte gPlayerBodyPSI
_0807F20C: .4byte gPlayer
_0807F210: .4byte gPartner
_0807F214: .4byte gCurTask
_0807F218: .4byte Task_PartyBalloonPopped
_0807F21C: .4byte gGameMode
_0807F220: .4byte gNumSingleplayerCharacters

.syntax divided
