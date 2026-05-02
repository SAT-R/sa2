.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, _080911B8 @ =gCurTask
	ldr r0, [r5]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov r8, r0          @ r8 = bubbles
	ldr r0, _080911BC @ =0x0300000C
	adds r7, r6, r0     @ r7 = s
	ldr r1, _080911C0 @ =0x03000040
	adds r0, r6, r1     @ r0 = unk40
	ldr r4, _080911C4 @ =gCamera
	ldrh r2, [r0]
	ldrh r0, [r4]
	subs r2, r2, r0
	ldr r3, _080911C8 @ =gSineTable
	mov r0, r8
	ldrh r1, [r0, #0x3e]
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r1, _080911CC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1b
	adds r2, r2, r0
	strh r2, [r7, #0x16]
	ldr r1, _080911D0 @ =0x03000042
	adds r3, r6, r1
	ldrh r1, [r3]
	ldrh r0, [r4, #2]
	subs r1, r1, r0
	mov r4, r8
	ldrh r0, [r4, #0x3e]
	lsrs r0, r0, #1
	subs r1, r1, r0
	strh r1, [r7, #0x18]
	adds r2, #0x80
	lsls r2, r2, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _080911AE
	movs r2, #0x18
	ldrsh r0, [r7, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _080911AE
	lsls r1, r1, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	bgt _080911AE
	ldr r2, _080911D4 @ =gWater
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	blt _080911AE
	movs r1, #0
	ldrsh r0, [r3, r1]
	mov r4, r8
	ldrh r3, [r4, #0x3e]
	lsrs r1, r3, #1
	subs r0, r0, r1
	movs r4, #2
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _080911D8
_080911AE:
	ldr r0, [r5]
	bl TaskDestroy
	b _08091400
	.align 2, 0
_080911B8: .4byte gCurTask
_080911BC: .4byte 0x0300000C
_080911C0: .4byte 0x03000040
_080911C4: .4byte gCamera
_080911C8: .4byte gSineTable
_080911CC: .4byte 0x000003FF
_080911D0: .4byte 0x03000042
_080911D4: .4byte gWater
_080911D8:
	ldr r0, _080911F8 @ =0x0300003C
	adds r2, r6, r0
	ldrb r1, [r2]
	lsls r1, r1, #3
	adds r0, r3, #1
	mov r3, r8
	strh r0, [r3, #0x3e]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	ble _080911FC
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	b _0809120A
	.align 2, 0
_080911F8: .4byte 0x0300003C
_080911FC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08091204
	b _080913FA_DisplaySprite_ret
_08091204:
	adds r0, r7, #0
	bl UpdateSpriteAnimation
_0809120A:
	mov r0, r8
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #4
	beq _08091216
	b _080913FA_DisplaySprite_ret
_08091216:
	mov r4, r8      @ r4 = r8 = bubbles
	ldrh r0, [r4, #0x3e]
	cmp r0, #0x4f
	bhi _08091220
	b _080913FA_DisplaySprite_ret
_08091220:
	movs r4, #0
	ldr r5, _08091274 @ r5 = gPartner
	ldr r6, _08091278 @ r6 = gPlayer
	movs r0, #0x5a
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x3c
	adds r1, r1, r6
	mov sb, r1
_08091232_loop:
	ldr r0, _0809127C @ =gCamera
	ldrh r1, [r0]
	ldrh r2, [r7, #0x16]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r0, #2]
	ldrh r3, [r7, #0x18]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, _08091278 @ =gPlayer
	cmp r4, #0
	beq _08091250
	ldr r3, _08091274 @ =gPartner
_08091250:
	adds r0, r7, #0
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _0809125C
	b _080913EA_continue
_0809125C:
	ldr r0, _08091278 @ =gPlayer
	cmp r4, #0
	beq _08091264
	ldr r0, _08091274 @ =gPartner
_08091264:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r4, #0
	beq _08091284
	movs r0, #0x1b
	ldr r1, _08091280 @ =gPartner + 0x40
	strb r0, [r1]
	b _0809128A
	.align 2, 0
_08091274: .4byte gPartner
_08091278: .4byte gPlayer
_0809127C: .4byte gCamera
_08091280: .4byte gPartner + 0x40
_08091284:
	movs r0, #0x1b
	ldr r2, _0809129C @ =gPlayer + 0x40
	strb r0, [r2]
_0809128A:
	cmp r4, #0
	beq _080912A0
	ldr r0, [r5, #0x10]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080912AA
	b _0809133A
	.align 2, 0
_0809129C: .4byte gPlayer + 0x40
_080912A0:
	ldr r0, [r6, #0x10]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0809133A
_080912AA:
	cmp r4, #0
	beq _080912BA
	ldr r0, [r5, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _080912C4
_080912BA:
	ldr r0, [r6, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_080912C4:
	ldr r2, _080912D8 @ =gPlayer
	cmp r4, #0
	beq _080912DC
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _080912E6
	.align 2, 0
_080912D8: .4byte gPlayer
_080912DC:
	ldr r0, [r6, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_080912E6:
	cmp r4, #0
	beq _080912F6
	ldr r0, [r5, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08091300
	b _08091314
_080912F6:
	ldr r0, [r2, #0x10]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08091314
_08091300:
	adds r1, r2, #0
	cmp r4, #0
	beq _08091308
	ldr r1, _08091310 @ =gPartner
_08091308:
	movs r0, #6
	strb r0, [r1, #0xe]
	adds r1, r2, #0
	b _08091330
	.align 2, 0
_08091310: .4byte gPartner
_08091314:
	ldr r0, _08091344 @ =gPlayer
	cmp r4, #0
	beq _0809131C
	ldr r0, _08091348 @ =gPartner
_0809131C:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08091344 @ =gPlayer
	cmp r4, #0
	beq _0809132A
	ldr r1, _08091348 @ =gPartner
_0809132A:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08091344 @ =gPlayer
_08091330:
	cmp r4, #0
	beq _08091336
	ldr r1, _08091348 @ =gPartner
_08091336:
	movs r0, #0xe
	strb r0, [r1, #0xf]
_0809133A:
	cmp r4, #0
	beq _0809134C
	movs r0, #0
	strh r0, [r5, #8]
	b _0809134E
	.align 2, 0
_08091344: .4byte gPlayer
_08091348: .4byte gPartner
_0809134C:
	strh r4, [r6, #8]
_0809134E:
	cmp r4, #0
	beq _08091358
	movs r0, #0
	strh r0, [r5, #0xa]
	b _0809135A
_08091358:
	strh r4, [r6, #0xa]
_0809135A:
	cmp r4, #0
	beq _08091364
	movs r0, #0
	strh r0, [r5, #0xc]
	b _08091366
_08091364:
	strh r4, [r6, #0xc]
_08091366:
	cmp r4, #0
	beq _08091376
	ldr r0, [r5, #0x10]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _08091380
_08091376:
	ldr r0, [r6, #0x10]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08091380:
	cmp r4, #0
	beq _08091390
	movs r0, #0x3c
	ldr r3, _0809138C @ =gPartner + 0x5B
	strb r0, [r3]
	b _08091396
	.align 2, 0
_0809138C: .4byte gPartner + 0x5B
_08091390:
	movs r0, #0x3c
	ldr r1, _080913A4 @ =gPlayer + 0x5B
	strb r0, [r1]
_08091396:
	cmp r4, #0
	beq _080913AC
	movs r0, #0x1e
	ldr r2, _080913A8 @ =gPartner + 0x5A
	strb r0, [r2]
	b _080913B2
	.align 2, 0
_080913A4: .4byte gPlayer + 0x5B
_080913A8: .4byte gPartner + 0x5A
_080913AC:
	movs r0, #0x1e
	mov r3, sl
	strb r0, [r3]
_080913B2:
	cmp r4, #0
	beq _080913C4
	ldr r1, _080913C0 @ =gPartner + 0x3C
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _080913CA
	.align 2, 0
_080913C0: .4byte gPartner + 0x3C
_080913C4:
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
_080913CA:
	cmp r0, #0
	bne _080913D4
	movs r0, #0x1b
	bl m4aSongNumStop
_080913D4:
	movs r0, #0xbf
	bl m4aSongNumStart
	ldr r0, _08091410 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08091414 @ =Task_809141C
	str r0, [r1, #8]
	mov r1, r8
	adds r1, #0x3d
	movs r0, #0x10
	strb r0, [r1]
_080913EA_continue:
	adds r4, #1
	ldr r0, _08091418 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bge _080913FA_DisplaySprite_ret
	b _08091232_loop
_080913FA_DisplaySprite_ret:
	adds r0, r7, #0
	bl DisplaySprite
_08091400:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091410: .4byte gCurTask
_08091414: .4byte Task_809141C
_08091418: .4byte gNumSingleplayerCharacters

.syntax divided
