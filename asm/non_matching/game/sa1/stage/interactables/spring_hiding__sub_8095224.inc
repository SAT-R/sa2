.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r1      @ sb = s
	str r2, [sp]    @ sp00 = worldX
	str r3, [sp, #4]@ sp04 = worldY
	movs r1, #0
	mov sl, r1      @ sl = result = FALSE
	ldr r0, [r0]
	str r0, [sp, #8]@ sp08 = me
	movs r2, #0
	str r2, [sp, #0xc]
	movs r5, #0
	ldr r7, _08095254 @ =gPartner
	ldr r0, _08095258 @ =gPlayer
	mov r8, r0
_0809524A_loop:
	cmp r5, #0
	beq _0809525C
	ldr r0, [r7, #0x10]
	b _08095260
	.align 2, 0
_08095254: .4byte gPartner
_08095258: .4byte gPlayer
_0809525C:
	mov r1, r8
	ldr r0, [r1, #0x10]
_08095260:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809526A
	b _08095456_continue
_0809526A:
	cmp r5, #0
	beq _08095272
	ldr r0, [r7, #0x10]
	b _08095276
_08095272:
	mov r2, r8
	ldr r0, [r2, #0x10]
_08095276:
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08095282
	b _08095456_continue
_08095282:  @ (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE))
	ldr r1, [sp]        @ r1 = worldX
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	ldr r2, [sp, #4]    @ r2 = worldY
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r3, _080952DC @ =gPlayer
	cmp r5, #0
	beq _08095296
	ldr r3, _080952E0 @ =gPartner
_08095296:
	mov r0, sb
	adds r1, r6, #0
	adds r2, r4, #0
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _080952BE
	ldr r3, _080952DC @ =gPlayer
	cmp r5, #0
	beq _080952AC
	ldr r3, _080952E0 @ =gPartner
_080952AC:
	mov r0, sb
	adds r1, r6, #0
	adds r2, r4, #0
	bl Coll_AmyHammer_Spring
	str r0, [sp, #0xc]  @ sp0C = Coll_AmyHammer_Spring()
	cmp r0, #0
	bne _080952BE
	b _08095456_continue
_080952BE:
	ldr r0, _080952DC @ =gPlayer
	cmp r5, #0
	beq _080952C6
	ldr r0, _080952E0 @ =gPartner
_080952C6:
	bl sa2__sub_8021BE0
	cmp r5, #0
	beq _080952E4
	ldr r0, [r7, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	b _080952F2
	.align 2, 0
_080952DC: .4byte gPlayer
_080952E0: .4byte gPartner
_080952E4:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r2, r8
	str r0, [r2, #0x10]
_080952F2:
	ldr r2, _08095304 @ =gPlayer
	cmp r5, #0
	beq _08095308
	ldr r0, [r7, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r7, #0x10]
	b _08095314
	.align 2, 0
_08095304: .4byte gPlayer
_08095308:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_08095314:
	cmp r5, #0
	beq _08095328
	ldr r0, [r7, #0x10]
	ldr r1, _08095324 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r7, #0x10]
	b _08095334
	.align 2, 0
_08095324: .4byte 0xFFFFFEFF
_08095328:
	mov r1, r8
	ldr r0, [r1, #0x10]
	ldr r1, _08095340 @ =0xFFFFFEFF
	ands r0, r1
	mov r1, r8
	str r0, [r1, #0x10]
_08095334:
	cmp r5, #0
	beq _08095348
	movs r0, #0
	ldr r1, _08095344 @ =gPartner + 0x3D
	strb r0, [r1]
	b _0809534E
	.align 2, 0
_08095340: .4byte 0xFFFFFEFF
_08095344: .4byte gPartner + 0x3D
_08095348:
	adds r0, r2, #0
	adds r0, #0x3d
	strb r5, [r0]
_0809534E:
	ldr r1, [sp, #8]    @ r1 = sp08 = me
	ldrb r0, [r1, #4]
	lsls r0, r0, #6
	rsbs r0, r0, #0
	cmp r5, #0
	beq _0809535E
	strh r0, [r7, #0xa]
	b _08095360
_0809535E:
	strh r0, [r2, #0xa]
_08095360:
	ldr r0, [sp, #0xc]  @ r0 = sp0C = 
	cmp r0, #0
	beq _08095390
	cmp r5, #0
	beq _08095370
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	b _08095374
_08095370:
	movs r1, #0xa
	ldrsh r0, [r2, r1]
_08095374:
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r5, #0
	beq _08095388
	ldrh r0, [r7, #0xa]
	adds r0, r0, r1
	strh r0, [r7, #0xa]
	b _08095390
_08095388:
	mov r2, r8
	ldrh r0, [r2, #0xa]
	adds r0, r0, r1
	strh r0, [r2, #0xa]
_08095390:
	ldr r0, [sp, #8]
	ldrb r1, [r0, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080953D0
	ldr r0, _080953B4 @ =gPlayer
	cmp r5, #0
	beq _080953A4
	ldr r0, _080953B8 @ =gPartner
_080953A4:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _080953C0
	movs r0, #0x15
	ldr r1, _080953BC @ =gPartner + 0x40
	strb r0, [r1]
	b _080953C6
	.align 2, 0
_080953B4: .4byte gPlayer
_080953B8: .4byte gPartner
_080953BC: .4byte gPartner + 0x40
_080953C0:
	movs r0, #0x15
	ldr r2, _080953CC @ =gPlayer + 0x40
	strb r0, [r2]
_080953C6:
	cmp r5, #0
	bne _080953FE
	b _08095410
	.align 2, 0
_080953CC: .4byte gPlayer + 0x40
_080953D0:
	ldr r0, _080953E8 @ =gPlayer
	cmp r5, #0
	beq _080953D8
	ldr r0, _080953EC @ =gPartner
_080953D8:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _080953F4
	movs r0, #0x11
	ldr r1, _080953F0 @ =gPartner + 0x40
	strb r0, [r1]
	b _080953FA
	.align 2, 0
_080953E8: .4byte gPlayer
_080953EC: .4byte gPartner
_080953F0: .4byte gPartner + 0x40
_080953F4:
	movs r0, #0x11
	ldr r2, _08095408 @ =gPlayer + 0x40
	strb r0, [r2]
_080953FA:
	cmp r5, #0
	beq _08095410
_080953FE:
	movs r0, #0xff
	ldr r1, _0809540C @ =gPartnerBodyPSI+0xC+0x21
	strb r0, [r1]
	b _08095416
	.align 2, 0
_08095408: .4byte gPlayer + 0x40
_0809540C: .4byte gPartnerBodyPSI+0xC+0x21
_08095410:
	movs r0, #0xff
	ldr r2, _08095478 @ =gPlayerBodyPSI+0xC+0x21
	strb r0, [r2]
_08095416:
	mov r0, sb
	adds r0, #0x20
	movs r1, #1
	strb r1, [r0]
	mov r1, sb
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0809547C @ =gPlayer
	cmp r5, #0
	beq _0809542E
	ldr r0, _08095480 @ =gPartner
_0809542E:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _0809547C @ =gPlayer
	cmp r5, #0
	beq _0809543C
	ldr r1, _08095480 @ =gPartner
_0809543C:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _0809547C @ =gPlayer
	cmp r5, #0
	beq _08095448
	ldr r1, _08095480 @ =gPartner
_08095448:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #0xaa
	bl m4aSongNumStart
	movs r0, #1
	mov sl, r0
_08095456_continue:
	adds r5, #1
	ldr r0, _08095484 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bge _08095466
	b _0809524A_loop
_08095466:
	mov r0, sl
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08095478: .4byte gPlayerBodyPSI+0xC+0x21
_0809547C: .4byte gPlayer
_08095480: .4byte gPartner
_08095484: .4byte gNumSingleplayerCharacters

.syntax divided
