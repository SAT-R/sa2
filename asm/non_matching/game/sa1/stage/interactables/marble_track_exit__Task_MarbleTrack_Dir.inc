.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _080822D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [r1]
	str r0, [sp, #0x10]
	ldrb r1, [r1, #8]
	lsls r1, r1, #3
	mov r2, sl
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, [sp, #0x10]
	ldrb r2, [r3, #1]
	lsls r2, r2, #3
	mov r4, sl
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _080822D8 @ =gCamera
	ldrh r0, [r3]
	lsrs r5, r1, #0x10
	str r5, [sp]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	ldrh r0, [r3, #2]
	lsrs r1, r2, #0x10
	str r1, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0xc]
	movs r7, #0
	ldr r3, _080822DC @ =gPartner
	ldr r2, _080822E0 @ =gPlayer
	mov sb, r2
	movs r4, #0
	str r4, [sp, #0x1c]
_080822C2:
	cmp r7, #0
	beq _080822E4
	ldr r1, [r3, #0x10]
	movs r0, #0x80
	ands r1, r0
	mov r5, sl
	adds r5, #0x68
	str r5, [sp, #0x14]
	b _080822F2
	.align 2, 0
_080822D4: .4byte gCurTask
_080822D8: .4byte gCamera
_080822DC: .4byte gPartner
_080822E0: .4byte gPlayer
_080822E4:
	mov r0, sb
	ldr r1, [r0, #0x10]
	movs r0, #0x80
	ands r1, r0
	mov r2, sl
	adds r2, #0x68
	str r2, [sp, #0x14]
_080822F2:
	cmp r1, #0
	beq _080822F8
	b _0808280A
_080822F8:
	mov r1, sl
	adds r1, #0x68
	ldrb r2, [r1]
	adds r0, r2, #0
	asrs r0, r7
	movs r4, #1
	ands r0, r4
	str r1, [sp, #0x14]
	cmp r0, #0
	bne _0808230E
	b _080825E0
_0808230E:
	ldr r0, _08082370 @ =gPlayer + 0x6D
	cmp r7, #0
	beq _08082316
	ldr r0, _08082374 @ =gPartner + 0x6D
_08082316:
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, sl
	adds r0, #0x3c
	str r0, [sp, #0x18]
	ldrb r5, [r0]
	cmp r1, r5
	beq _08082328
	b _080825D4
_08082328:
	movs r0, #0x3e
	add r0, sl
	mov r8, r0
	adds r4, r0, r7
	ldrb r1, [r4]
	mov r2, sl
	ldr r0, [r2, #0x50]
	muls r0, r1, r0
	mov r5, sl
	adds r5, #0x3d
	ldrb r1, [r5]
	str r3, [sp, #0x20]
	bl Div
	adds r6, r0, #0
	ldrb r1, [r4]
	mov r4, sl
	ldr r0, [r4, #0x54]
	muls r0, r1, r0
	ldrb r1, [r5]
	bl Div
	adds r1, r0, #0
	mov r0, sl
	adds r0, #0x40
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r6
	lsls r0, r0, #8
	mov r4, r8
	ldr r3, [sp, #0x20]
	cmp r7, #0
	beq _08082378
	str r0, [r3]
	b _0808237C
	.align 2, 0
_08082370: .4byte gPlayer + 0x6D
_08082374: .4byte gPartner + 0x6D
_08082378:
	mov r2, sb
	str r0, [r2]
_0808237C:
	mov r0, sl
	adds r0, #0x48
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #8
	cmp r7, #0
	beq _08082392
	str r0, [r3, #4]
	b _08082396
_08082392:
	mov r1, sb
	str r0, [r1, #4]
_08082396:
	mov r1, sl
	adds r1, #0x58
	ldr r2, [sp, #0x1c]
	adds r0, r1, r2
	ldr r2, [r0]
	mov r8, r1
	cmp r7, #0
	beq _080823AA
	ldr r0, [r3]
	b _080823AE
_080823AA:
	mov r1, sb
	ldr r0, [r1]
_080823AE:
	subs r0, r0, r2
	cmp r7, #0
	beq _080823B8
	strh r0, [r3, #8]
	b _080823BC
_080823B8:
	mov r2, sb
	strh r0, [r2, #8]
_080823BC:
	mov r1, sl
	adds r1, #0x60
	ldr r2, [sp, #0x1c]
	adds r0, r1, r2
	ldr r2, [r0]
	adds r6, r1, #0
	cmp r7, #0
	beq _080823D0
	ldr r0, [r3, #4]
	b _080823D4
_080823D0:
	mov r1, sb
	ldr r0, [r1, #4]
_080823D4:
	subs r0, r0, r2
	cmp r7, #0
	beq _080823DE
	strh r0, [r3, #0xa]
	b _080823E2
_080823DE:
	mov r2, sb
	strh r0, [r2, #0xa]
_080823E2:
	adds r1, r4, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08082430 @ =gPlayer + 0x6D
	ldrb r5, [r5]
	cmp r0, r5
	bhs _0808240C
	adds r0, r2, #0
	cmp r7, #0
	beq _080823FE
	ldr r0, _08082434 @ =gPartner + 0x6D
_080823FE:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r4, [sp, #0x18]
	ldrb r4, [r4]
	cmp r0, r4
	ble _080824EA
_0808240C:
	adds r0, r2, #0
	cmp r7, #0
	beq _08082414
	ldr r0, _08082434 @ =gPartner + 0x6D
_08082414:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r5, [sp, #0x18]
	ldrb r5, [r5]
	cmp r0, r5
	bne _080824DC
	cmp r7, #0
	beq _0808243C
	ldr r0, [r3, #0x10]
	ldr r1, _08082438 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r3, #0x10]
	b _08082448
	.align 2, 0
_08082430: .4byte gPlayer + 0x6D
_08082434: .4byte gPartner + 0x6D
_08082438: .4byte 0xFFDFFFFF
_0808243C:
	mov r1, sb
	ldr r0, [r1, #0x10]
	ldr r1, _0808245C @ =0xFFDFFFFF
	ands r0, r1
	mov r2, sb
	str r0, [r2, #0x10]
_08082448:
	ldr r0, _08082460 @ =gPlayerControls
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	orrs r1, r0
	cmp r7, #0
	beq _08082464
	ldrh r0, [r3, #0x38]
	orrs r1, r0
	strh r1, [r3, #0x38]
	b _0808246C
	.align 2, 0
_0808245C: .4byte 0xFFDFFFFF
_08082460: .4byte gPlayerControls
_08082464:
	mov r4, sb
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	strh r1, [r4, #0x38]
_0808246C:
	cmp r7, #0
	beq _08082480
	ldr r0, [r3, #0x10]
	ldr r1, _0808247C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x10]
	b _0808248A
	.align 2, 0
_0808247C: .4byte 0xFFBFFFFF
_08082480:
	mov r5, sb
	ldr r0, [r5, #0x10]
	ldr r1, _0808249C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
_0808248A:
	cmp r7, #0
	beq _080824A4
	ldr r0, _080824A0 @ =gPartner + 0x26
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	ldr r1, _080824A0 @ =gPartner + 0x26
	strb r0, [r1]
	b _080824AE
	.align 2, 0
_0808249C: .4byte 0xFFBFFFFF
_080824A0: .4byte gPartner + 0x26
_080824A4:
	ldr r2, _080824B8 @ =gPlayer + 0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_080824AE:
	cmp r7, #0
	beq _080824BC
	movs r4, #0
	strh r4, [r3, #0xa]
	b _080824C0
	.align 2, 0
_080824B8: .4byte gPlayer + 0x26
_080824BC:
	mov r5, sb
	strh r7, [r5, #0xa]
_080824C0:
	cmp r7, #0
	beq _080824CA
	movs r0, #0
	strh r0, [r3, #8]
	b _080824CE
_080824CA:
	mov r1, sb
	strh r7, [r1, #8]
_080824CE:
	cmp r7, #0
	beq _080824D8
	movs r2, #0
	strh r2, [r3, #0xc]
	b _080824DC
_080824D8:
	mov r4, sb
	strh r7, [r4, #0xc]
_080824DC:
	movs r1, #1
	lsls r1, r7
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	bics r0, r1
	strb r0, [r5]
	b _080825A4
_080824EA:
	cmp r7, #0
	beq _080824FA
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r3, #0x10]
	b _08082508
_080824FA:
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	mov r4, sb
	str r0, [r4, #0x10]
_08082508:
	subs r2, #0x6d
	ldr r0, _08082520 @ =gPlayerControls
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	orrs r1, r0
	cmp r7, #0
	beq _08082524
	ldrh r0, [r3, #0x38]
	orrs r1, r0
	strh r1, [r3, #0x38]
	b _0808252C
	.align 2, 0
_08082520: .4byte gPlayerControls
_08082524:
	mov r5, sb
	ldrh r0, [r5, #0x38]
	orrs r1, r0
	strh r1, [r5, #0x38]
_0808252C:
	cmp r7, #0
	beq _0808253C
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r3, #0x10]
	b _0808254A
_0808253C:
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	mov r4, sb
	str r0, [r4, #0x10]
_0808254A:
	cmp r7, #0
	beq _08082554
	movs r5, #0
	strh r5, [r3, #0xc]
	b _08082556
_08082554:
	strh r7, [r2, #0xc]
_08082556:
	cmp r7, #0
	beq _08082560
	movs r0, #0
	strh r0, [r3, #0x38]
	b _08082562
_08082560:
	strh r7, [r2, #0x38]
_08082562:
	cmp r7, #0
	beq _0808256C
	movs r1, #0
	strh r1, [r3, #0x3a]
	b _0808256E
_0808256C:
	strh r7, [r2, #0x3a]
_0808256E:
	ldr r0, _080825B0 @ =gPlayer
	cmp r7, #0
	beq _08082576
	ldr r0, _080825B4 @ =gPartner
_08082576:
	movs r1, #0xe
	str r3, [sp, #0x20]
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _080825B0 @ =gPlayer
	ldr r3, [sp, #0x20]
	cmp r7, #0
	beq _08082588
	ldr r1, _080825B4 @ =gPartner
_08082588:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _080825B0 @ =gPlayer
	cmp r7, #0
	beq _08082594
	ldr r1, _080825B4 @ =gPartner
_08082594:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #1
	lsls r0, r7
	ldr r2, [sp, #0x14]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
_080825A4:
	ldr r1, [sp, #0x1c]
	add r1, r8
	cmp r7, #0
	beq _080825B8
	ldr r0, [r3]
	b _080825BC
	.align 2, 0
_080825B0: .4byte gPlayer
_080825B4: .4byte gPartner
_080825B8:
	mov r4, sb
	ldr r0, [r4]
_080825BC:
	str r0, [r1]
	ldr r5, [sp, #0x1c]
	adds r1, r6, r5
	cmp r7, #0
	beq _080825CC
	ldr r0, [r3, #4]
	str r0, [r1]
	b _0808280A
_080825CC:
	mov r2, sb
	ldr r0, [r2, #4]
	str r0, [r1]
	b _0808280A
_080825D4:
	adds r0, r4, #0
	lsls r0, r7
	bics r2, r0
	ldr r4, [sp, #0x14]
	strb r2, [r4]
	b _0808280A
_080825E0:
	cmp r7, #0
	beq _080825F8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0808260C
	mov r5, sl
	adds r5, #0x3c
	str r5, [sp, #0x18]
	b _08082624
_080825F8:
	mov r0, sb
	ldr r1, [r0, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	mov r2, sl
	adds r2, #0x3c
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _08082624
_0808260C:
	ldr r0, _08082648 @ =gPlayer + 0x6D
	cmp r7, #0
	beq _08082614
	ldr r0, _0808264C @ =gPartner + 0x6D
_08082614:
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, sl
	adds r0, #0x3c
	str r0, [sp, #0x18]
	ldrb r4, [r0]
	cmp r1, r4
	blt _0808262E
_08082624:
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0808262E
	b _0808280A
_0808262E:
	ldr r0, [sp]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #8
	cmp r7, #0
	beq _08082650
	ldr r0, [r3]
	asrs r0, r0, #8
	cmp r2, r0
	ble _0808265C
	b _0808280A
	.align 2, 0
_08082648: .4byte gPlayer + 0x6D
_0808264C: .4byte gPartner + 0x6D
_08082650:
	mov r4, sb
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _0808265C
	b _0808280A
_0808265C:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #8
	cmp r7, #0
	beq _08082670
	ldr r0, [r3]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808267C
	b _0808280A
_08082670:
	mov r5, sb
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808267C
	b _0808280A
_0808267C:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #0xa
	cmp r7, #0
	beq _08082694
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _080826A0
	b _0808280A
_08082694:
	mov r4, sb
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _080826A0
	b _0808280A
_080826A0:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0xa
	cmp r7, #0
	beq _080826B4
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080826C0
	b _0808280A
_080826B4:
	mov r5, sb
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080826C0
	b _0808280A
_080826C0:
	mov r0, sl
	adds r0, #0x3e
	adds r0, r0, r7
	movs r1, #0
	strb r1, [r0]
	cmp r7, #0
	beq _080826D8
	ldr r0, [r3, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r3, #0x10]
	b _080826E2
_080826D8:
	mov r2, sb
	ldr r0, [r2, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r2, #0x10]
_080826E2:
	ldr r2, _080826F4 @ =gPlayer
	cmp r7, #0
	beq _080826F8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r3, #0x10]
	b _08082704
	.align 2, 0
_080826F4: .4byte gPlayer
_080826F8:
	mov r4, sb
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x10]
_08082704:
	cmp r7, #0
	beq _08082714
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r3, #0x10]
	b _08082720
_08082714:
	mov r5, sb
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x10]
_08082720:
	mov r0, sl
	adds r0, #0x40
	ldr r4, [sp, #0x1c]
	adds r1, r0, r4
	cmp r7, #0
	beq _08082730
	ldr r0, [r3]
	b _08082732
_08082730:
	ldr r0, [r2]
_08082732:
	asrs r0, r0, #8
	str r0, [r1]
	mov r0, sl
	adds r0, #0x48
	ldr r5, [sp, #0x1c]
	adds r1, r0, r5
	cmp r7, #0
	beq _08082746
	ldr r0, [r3, #4]
	b _08082748
_08082746:
	ldr r0, [r2, #4]
_08082748:
	asrs r0, r0, #8
	str r0, [r1]
	cmp r7, #0
	beq _08082756
	movs r0, #0
	strh r0, [r3, #0xa]
	b _08082758
_08082756:
	strh r7, [r2, #0xa]
_08082758:
	cmp r7, #0
	beq _08082762
	movs r1, #0
	strh r1, [r3, #8]
	b _08082764
_08082762:
	strh r7, [r2, #8]
_08082764:
	cmp r7, #0
	beq _0808276E
	movs r4, #0
	strh r4, [r3, #0xc]
	b _08082770
_0808276E:
	strh r7, [r2, #0xc]
_08082770:
	cmp r7, #0
	beq _0808277A
	movs r5, #0
	strh r5, [r3, #0x38]
	b _0808277C
_0808277A:
	strh r7, [r2, #0x38]
_0808277C:
	cmp r7, #0
	beq _08082786
	movs r0, #0
	strh r0, [r3, #0x3a]
	b _08082788
_08082786:
	strh r7, [r2, #0x3a]
_08082788:
	ldr r0, _080827EC @ =gPlayer
	cmp r7, #0
	beq _08082790
	ldr r0, _080827F0 @ =gPartner
_08082790:
	movs r1, #0xe
	str r3, [sp, #0x20]
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _080827EC @ =gPlayer
	ldr r3, [sp, #0x20]
	cmp r7, #0
	beq _080827A2
	ldr r1, _080827F0 @ =gPartner
_080827A2:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _080827EC @ =gPlayer
	cmp r7, #0
	beq _080827AE
	ldr r1, _080827F0 @ =gPartner
_080827AE:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #0xaa
	str r3, [sp, #0x20]
	bl m4aSongNumStart
	movs r1, #1
	lsls r1, r7
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	orrs r1, r0
	movs r2, #0
	ldr r4, [sp, #0x14]
	strb r1, [r4]
	ldr r1, _080827F4 @ =gPlayer + 0x6D
	ldr r3, [sp, #0x20]
	cmp r7, #0
	beq _080827D4
	ldr r1, _080827F8 @ =gPartner + 0x6D
_080827D4:
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	strb r0, [r1]
	cmp r7, #0
	beq _08082800
	ldr r1, _080827FC @ =gPartner + 0x26
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	ldr r2, _080827FC @ =gPartner + 0x26
	strb r0, [r2]
	b _0808280A
	.align 2, 0
_080827EC: .4byte gPlayer
_080827F0: .4byte gPartner
_080827F4: .4byte gPlayer + 0x6D
_080827F8: .4byte gPartner + 0x6D
_080827FC: .4byte gPartner + 0x26
_08082800:
	ldr r4, _08082874 @ =gPlayer + 0x26
	ldrb r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4]
_0808280A:
	ldr r5, [sp, #0x1c]
	adds r5, #4
	str r5, [sp, #0x1c]
	adds r7, #1
	ldr r0, _08082878 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r7, r0
	bge _08082820
	b _080822C2
_08082820:
	ldr r0, [sp, #0x14]
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08082864
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #0x10
	adds r0, r0, r2
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08082854
	ldr r3, [sp, #0xc]
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08082854
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r2, r0
	ble _08082864
_08082854:
	mov r4, sl
	ldrb r0, [r4, #8]
	ldr r5, [sp, #0x10]
	strb r0, [r5]
	ldr r0, _0808287C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08082864:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082874: .4byte gPlayer + 0x26
_08082878: .4byte gNumSingleplayerCharacters
_0808287C: .4byte gCurTask

.syntax divided
