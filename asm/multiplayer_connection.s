.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    thumb_func_start sub_808129C
sub_808129C: @ 0x0808129C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0808151C @ =gUnknown_030054D4
	movs r5, #0
	strb r5, [r0, #3]
	strb r5, [r0, #2]
	strb r5, [r0, #1]
	strb r5, [r0]
	ldr r1, _08081520 @ =gDispCnt
	ldr r2, _08081524 @ =0x00001141
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08081528 @ =gBgCntRegs
	ldr r0, _0808152C @ =0x00001401
	strh r0, [r1]
	ldr r0, _08081530 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	movs r2, #0x80
	lsls r2, r2, #6
	str r5, [sp]
	ldr r0, _08081534 @ =sub_8081604
	movs r1, #0xfc
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r0, _08081538 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	ldr r3, _0808153C @ =IWRAM_START + 0xFA
	adds r3, r3, r6
	mov sl, r3
	strb r0, [r3]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08081300
	movs r0, #1
	strb r0, [r3]
_08081300:
	ldr r0, _08081540 @ =IWRAM_START + 0xDC
	adds r0, r6, r0
	str r0, [sp, #4]
	ldr r2, _08081544 @ =gUnknown_080E01E0
	mov r1, sl
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r3, [sp, #4]
	str r0, [r3]
	ldr r0, _08081548 @ =IWRAM_START + 0xE0
	adds r3, r6, r0
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r0, r2, #4
	adds r0, r1, r0
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _0808154C @ =IWRAM_START + 0xF0
	adds r0, r6, r1
	str r5, [r0]
	ldr r2, _08081550 @ =IWRAM_START + 0xF9
	adds r0, r6, r2
	movs r3, #0
	strb r3, [r0]
	subs r1, #0xc
	adds r0, r6, r1
	str r5, [r0]
	subs r2, #0x11
	adds r0, r6, r2
	str r5, [r0]
	ldr r3, _08081554 @ =IWRAM_START + 0xEC
	adds r0, r6, r3
	strh r5, [r0]
	movs r0, #1
	strh r0, [r4]
	strh r5, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	adds r0, #0xfe
	mov sb, r0
	mov r1, sb
	strh r1, [r4, #6]
	ldr r0, _08081558 @ =0x00003FFF
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	adds r0, r4, #0
	bl sub_802D4CC
	ldr r4, _0808155C @ =0x06010000
	ldr r2, _08081560 @ =IWRAM_START + 0xC
	adds r7, r6, r2
	movs r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0x18
	strh r0, [r7, #0x18]
	mov r3, sb
	strh r3, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r1, _08081564 @ =IWRAM_START + 0x2E
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _08081568 @ =IWRAM_START + 0x31
	adds r0, r6, r3
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r3, #0x80
	lsls r3, r3, #5
	mov r8, r3
	str r3, [r7, #0x10]
	ldr r2, _0808156C @ =gUnknown_080E018C
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	mov r3, sl
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _08081570 @ =IWRAM_START + 0x2C
	adds r0, r6, r3
	strb r1, [r0]
	ldr r0, _08081574 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	str r4, [r7, #4]
	mov r3, sl
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r4, r0, r4
	adds r0, r7, #0
	bl sub_8004558
	ldr r0, _08081578 @ =IWRAM_START + 0x3C
	adds r7, r6, r0
	movs r3, #0x78
	strh r3, [r7, #0x16]
	movs r0, #0x7a
	strh r0, [r7, #0x18]
	mov r1, sb
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r2, _0808157C @ =IWRAM_START + 0x5E
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, r8
	str r0, [r7, #0x10]
	ldr r2, _08081580 @ =gUnknown_080E01B6
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	mov ip, r0
	ldr r1, _08081584 @ =IWRAM_START + 0x5C
	adds r0, r6, r1
	mov r1, ip
	strb r1, [r0]
	ldr r0, _08081588 @ =IWRAM_START + 0x5D
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	str r4, [r7, #4]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r4, r4, r0
	ldr r1, _0808158C @ =IWRAM_START + 0x6C
	adds r7, r6, r1
	strh r3, [r7, #0x16]
	movs r0, #0x8c
	strh r0, [r7, #0x18]
	mov r2, sb
	strh r2, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r3, _08081590 @ =IWRAM_START + 0x8E
	adds r0, r6, r3
	movs r1, #0x10
	strb r1, [r0]
	ldr r2, _08081594 @ =IWRAM_START + 0x91
	adds r0, r6, r2
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r1, r8
	str r1, [r7, #0x10]
	ldr r0, _08081598 @ =0x00000432
	strh r0, [r7, #0xa]
	subs r2, #5
	adds r0, r6, r2
	movs r3, #8
	strb r3, [r0]
	ldr r0, _0808159C @ =IWRAM_START + 0x8D
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	str r4, [r7, #4]
	ldr r1, _080815A0 @ =IWRAM_START + 0x9C
	adds r0, r6, r1
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r5, [r0, #0xa]
	ldr r1, _080815A4 @ =0x0600A000
	str r1, [r0, #0xc]
	strh r5, [r0, #0x18]
	strh r5, [r0, #0x1a]
	movs r1, #0x72
	strh r1, [r0, #0x1c]
	strh r5, [r0, #0x1e]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	strh r5, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r2, #0x3a
	adds r1, r6, r2
	movs r3, #0
	strb r3, [r1]
	strh r5, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #0x3d
	bl m4aSongNumStart
	ldr r0, _080815A8 @ =0x04000128
	ldrb r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080815B8
	ldr r0, _080815AC @ =gUnknown_03001954
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080815B0 @ =gUnknown_03002A90
	ldr r2, [sp, #4]
	ldr r1, [r2]
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	movs r3, #0
	strb r3, [r1]
	bl MultiBootInit
	ldr r0, _080815B4 @ =gCurTask
	ldr r0, [r0]
	ldr r1, _08081534 @ =sub_8081604
	str r1, [r0, #8]
	b _080815DA
	.align 2, 0
_0808151C: .4byte gUnknown_030054D4
_08081520: .4byte gDispCnt
_08081524: .4byte 0x00001141
_08081528: .4byte gBgCntRegs
_0808152C: .4byte 0x00001401
_08081530: .4byte gBgScrollRegs
_08081534: .4byte sub_8081604
_08081538: .4byte gLoadedSaveGame
_0808153C: .4byte IWRAM_START + 0xFA
_08081540: .4byte IWRAM_START + 0xDC
_08081544: .4byte gUnknown_080E01E0
_08081548: .4byte IWRAM_START + 0xE0
_0808154C: .4byte IWRAM_START + 0xF0
_08081550: .4byte IWRAM_START + 0xF9
_08081554: .4byte IWRAM_START + 0xEC
_08081558: .4byte 0x00003FFF
_0808155C: .4byte 0x06010000
_08081560: .4byte IWRAM_START + 0xC
_08081564: .4byte IWRAM_START + 0x2E
_08081568: .4byte IWRAM_START + 0x31
_0808156C: .4byte gUnknown_080E018C
_08081570: .4byte IWRAM_START + 0x2C
_08081574: .4byte IWRAM_START + 0x2D
_08081578: .4byte IWRAM_START + 0x3C
_0808157C: .4byte IWRAM_START + 0x5E
_08081580: .4byte gUnknown_080E01B6
_08081584: .4byte IWRAM_START + 0x5C
_08081588: .4byte IWRAM_START + 0x5D
_0808158C: .4byte IWRAM_START + 0x6C
_08081590: .4byte IWRAM_START + 0x8E
_08081594: .4byte IWRAM_START + 0x91
_08081598: .4byte 0x00000432
_0808159C: .4byte IWRAM_START + 0x8D
_080815A0: .4byte IWRAM_START + 0x9C
_080815A4: .4byte 0x0600A000
_080815A8: .4byte 0x04000128
_080815AC: .4byte gUnknown_03001954
_080815B0: .4byte gUnknown_03002A90
_080815B4: .4byte gCurTask
_080815B8:
	ldr r1, _080815EC @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _080815F0 @ =gUnknown_03002AE4
	ldr r0, _080815F4 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080815F8 @ =gUnknown_03005390
	movs r2, #0
	strb r2, [r0]
	ldr r1, _080815FC @ =gUnknown_03004D5C
	ldr r0, _08081600 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
_080815DA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080815EC: .4byte 0x0000FFFF
_080815F0: .4byte gUnknown_03002AE4
_080815F4: .4byte gUnknown_0300287C
_080815F8: .4byte gUnknown_03005390
_080815FC: .4byte gUnknown_03004D5C
_08081600: .4byte gUnknown_03002A84

	thumb_func_start sub_8081604
sub_8081604: @ 0x08081604
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0808172C @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r6, r0
	adds r0, r7, #0
	bl sub_802D4CC
	ldr r1, _08081730 @ =IWRAM_START + 0xC
	adds r0, r6, r1
	bl sub_80051E8
	adds r0, r7, #0
	bl sub_8081D70
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08081734 @ =0x04000128
	ldrb r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0808165E
	ldr r1, _08081738 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0808173C @ =gUnknown_03002AE4
	ldr r0, _08081740 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08081744 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08081748 @ =gUnknown_03004D5C
	ldr r0, _0808174C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
_0808165E:
	ldr r2, _08081750 @ =gUnknown_03002A90
	mov r8, r2
	ldrb r0, [r2, #0x1e]
	movs r1, #0xe
	ands r1, r0
	cmp r1, #0
	bne _0808166E
	b _08081774
_0808166E:
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	beq _08081676
	b _0808178C
_08081676:
	lsls r1, r4, #0x18
	asrs r0, r1, #0x18
	cmp r0, #1
	bgt _08081680
	b _0808178C
_08081680:
	lsrs r1, r1, #0x18
	adds r0, r7, #0
	bl sub_8081DF0
	ldr r0, _08081754 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808178C
	ldr r1, _08081758 @ =IWRAM_START + 0xF0
	adds r0, r6, r1
	movs r5, #1
	str r5, [r0]
	ldr r4, _0808175C @ =gFlags
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4]
	bl m4aMPlayAllStop
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	bl m4aSoundVSyncOff
	ldr r1, _08081760 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _08081764 @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _08081768 @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _0808176C @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	ldr r2, _08081770 @ =IWRAM_START + 0xDC
	adds r0, r6, r2
	ldr r1, [r0]
	adds r1, #0xc0
	adds r2, #4
	adds r0, r6, r2
	ldr r2, [r0]
	subs r2, #0xc0
	str r5, [sp]
	mov r0, r8
	movs r3, #4
	bl MultiBootStartMaster
	b _0808178C
	.align 2, 0
_0808172C: .4byte gCurTask
_08081730: .4byte IWRAM_START + 0xC
_08081734: .4byte 0x04000128
_08081738: .4byte 0x0000FFFF
_0808173C: .4byte gUnknown_03002AE4
_08081740: .4byte gUnknown_0300287C
_08081744: .4byte gUnknown_03005390
_08081748: .4byte gUnknown_03004D5C
_0808174C: .4byte gUnknown_03002A84
_08081750: .4byte gUnknown_03002A90
_08081754: .4byte gPressedKeys
_08081758: .4byte IWRAM_START + 0xF0
_0808175C: .4byte gFlags
_08081760: .4byte 0x040000B0
_08081764: .4byte 0x0000C5FF
_08081768: .4byte 0x00007FFF
_0808176C: .4byte 0x040000D4
_08081770: .4byte IWRAM_START + 0xDC
_08081774:
	ldr r2, _080817BC @ =IWRAM_START + 0xF0
	adds r0, r6, r2
	str r1, [r0]
	ldr r2, _080817C0 @ =gFlags
	ldr r0, [r2]
	ldr r1, _080817C4 @ =0xFFFFBFFF
	ands r0, r1
	ldr r1, _080817C8 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	bl m4aSoundVSyncOn
_0808178C:
	adds r0, r7, #0
	adds r0, #0xf0
	ldr r0, [r0]
	cmp r0, #0
	bne _080817D4
	ldr r0, _080817CC @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080817D4
	movs r0, #0x3d
	bl m4aSongNumStop
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, _080817D0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_805A1CC
	b _08081896
	.align 2, 0
_080817BC: .4byte IWRAM_START + 0xF0
_080817C0: .4byte gFlags
_080817C4: .4byte 0xFFFFBFFF
_080817C8: .4byte 0xFFFF7FFF
_080817CC: .4byte gPressedKeys
_080817D0: .4byte gCurTask
_080817D4:
	ldr r4, _08081824 @ =gUnknown_03002A90
	adds r0, r4, #0
	bl MultiBootMain
	cmp r0, #0x50
	beq _080817EC
	cmp r0, #0x60
	beq _080817EC
	cmp r0, #0x70
	beq _080817EC
	cmp r0, #0x71
	bne _0808184C
_080817EC:
	ldr r1, _08081828 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0808182C @ =gUnknown_03002AE4
	ldr r0, _08081830 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08081834 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08081838 @ =gUnknown_03004D5C
	ldr r0, _0808183C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _08081840 @ =gFlags
	ldr r0, [r2]
	ldr r1, _08081844 @ =0xFFFFBFFF
	ands r0, r1
	ldr r1, _08081848 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	bl m4aSoundVSyncOn
	bl sub_805B9A4
	b _08081896
	.align 2, 0
_08081824: .4byte gUnknown_03002A90
_08081828: .4byte 0x0000FFFF
_0808182C: .4byte gUnknown_03002AE4
_08081830: .4byte gUnknown_0300287C
_08081834: .4byte gUnknown_03005390
_08081838: .4byte gUnknown_03004D5C
_0808183C: .4byte gUnknown_03002A84
_08081840: .4byte gFlags
_08081844: .4byte 0xFFFFBFFF
_08081848: .4byte 0xFFFF7FFF
_0808184C:
	adds r0, r4, #0
	bl MultiBootCheckComplete
	cmp r0, #0
	beq _08081896
	adds r0, r7, #0
	bl sub_8081AD4
	adds r1, r7, #0
	adds r1, #0xf9
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080818A4 @ =gMultiSioSend
	strb r0, [r2]
	ldr r5, _080818A8 @ =gMultiSioRecv
	strb r0, [r5]
	strb r0, [r5, #0x14]
	adds r4, r5, #0
	adds r4, #0x28
	strb r0, [r4]
	adds r3, r5, #0
	adds r3, #0x3c
	strb r0, [r3]
	strb r0, [r2, #2]
	movs r1, #0
	ldr r0, _080818AC @ =0x0000F001
	strh r0, [r2]
	strb r1, [r5, #2]
	adds r0, r5, #0
	adds r0, #0x14
	strb r1, [r0, #2]
	strb r1, [r4, #2]
	strb r1, [r3, #2]
	ldr r0, _080818B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080818B4 @ =sub_8081C50
	str r0, [r1, #8]
_08081896:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080818A4: .4byte gMultiSioSend
_080818A8: .4byte gMultiSioRecv
_080818AC: .4byte 0x0000F001
_080818B0: .4byte gCurTask
_080818B4: .4byte sub_8081C50

	thumb_func_start sub_80818B8
sub_80818B8: @ 0x080818B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08081978 @ =gCurTask
	ldr r4, [r0]
	ldrh r3, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r2, _0808197C @ =gMultiSioStatusFlags
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _080818E8
	ldr r1, _08081980 @ =IWRAM_START + 0xF9
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080818E8
	ldr r0, _08081984 @ =sub_8081D04
	str r0, [r4, #8]
_080818E8:
	adds r4, r5, #0
	ldr r0, [r4]
	movs r1, #0x10
	ands r0, r1
	adds r2, r6, #0
	adds r2, #0xf8
	cmp r0, #0
	beq _080818FC
	movs r0, #1
	strb r0, [r2]
_080818FC:
	ldr r0, _08081988 @ =gMultiSioSend
	adds r1, r6, #0
	adds r1, #0xfa
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r1, _0808198C @ =gMultiSioRecv
	ldrb r2, [r2]
	bl MultiSioMain
	str r0, [r4]
	adds r4, r6, #0
	adds r4, #0xf4
	ldr r0, [r4]
	cmp r0, #0
	bne _08081922
	bl MultiSioStart
	movs r0, #1
	str r0, [r4]
_08081922:
	ldr r0, [r5]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	mov r8, r0
	movs r5, #1
	ldr r7, _08081990 @ =gFlags
	ldr r0, _08081994 @ =0x00004010
	mov sb, r0
_08081936:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8081E38
	adds r4, r0, #0
	cmp r4, #0
	bne _080819B8
	movs r0, #0
	ldr r1, _08081998 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0808199C @ =gUnknown_03002AE4
	ldr r0, _080819A0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080819A4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080819A8 @ =gUnknown_03004D5C
	ldr r0, _080819AC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, [r7]
	ldr r0, _080819B0 @ =0xFFFFBFFF
	ands r1, r0
	ldr r0, _080819B4 @ =0xFFFF7FFF
	ands r1, r0
	str r1, [r7]
	bl m4aSoundVSyncOn
	bl sub_805B9A4
	b _08081A4C
	.align 2, 0
_08081978: .4byte gCurTask
_0808197C: .4byte gMultiSioStatusFlags
_08081980: .4byte IWRAM_START + 0xF9
_08081984: .4byte sub_8081D04
_08081988: .4byte gMultiSioSend
_0808198C: .4byte gMultiSioRecv
_08081990: .4byte gFlags
_08081994: .4byte 0x00004010
_08081998: .4byte 0x0000FFFF
_0808199C: .4byte gUnknown_03002AE4
_080819A0: .4byte gUnknown_0300287C
_080819A4: .4byte gUnknown_03005390
_080819A8: .4byte gUnknown_03004D5C
_080819AC: .4byte gUnknown_03002A84
_080819B0: .4byte 0xFFFFBFFF
_080819B4: .4byte 0xFFFF7FFF
_080819B8:
	mov r0, r8
	lsls r0, r5
	cmp r0, #0
	beq _08081A30
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08081A10 @ =gMultiSioRecv
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, sb
	bne _08081A30
	movs r1, #0
	ldr r0, _08081A14 @ =gCurTask
	mov r8, r0
	ldr r6, _08081A18 @ =gUnknown_030054B4
	ldr r5, _08081A1C @ =gUnknown_030054D4
	ldr r7, _08081A20 @ =sub_8081D58
	ldr r0, _08081A24 @ =gDispCnt
	mov ip, r0
	ldr r4, _08081A28 @ =gUnknown_03005500
	movs r2, #0
	ldr r3, _08081A2C @ =gUnknown_03005428
_080819E6:
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r6
	strb r1, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #3
	bls _080819E6
	mov r1, r8
	ldr r0, [r1]
	str r7, [r0, #8]
	movs r0, #0x40
	mov r1, ip
	strh r0, [r1]
	b _08081A4C
	.align 2, 0
_08081A10: .4byte gMultiSioRecv
_08081A14: .4byte gCurTask
_08081A18: .4byte gUnknown_030054B4
_08081A1C: .4byte gUnknown_030054D4
_08081A20: .4byte sub_8081D58
_08081A24: .4byte gDispCnt
_08081A28: .4byte gUnknown_03005500
_08081A2C: .4byte gUnknown_03005428
_08081A30:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bhi _08081A3C
	b _08081936
_08081A3C:
	adds r2, r6, #0
	adds r2, #0xf9
	ldr r0, _08081A58 @ =gMultiSioRecv
	ldrb r1, [r0, #2]
	ldrb r0, [r2]
	cmp r0, r1
	beq _08081A4C
	strb r1, [r2]
_08081A4C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081A58: .4byte gMultiSioRecv

	thumb_func_start sub_8081A5C
sub_8081A5C: @ 0x08081A5C
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r5, _08081A98 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	mov r0, sp
	bl Sio32MultiLoadMain
	cmp r0, #0
	beq _08081A80
	ldr r1, [r5]
	ldr r0, _08081A9C @ =sub_8081C8C
	str r0, [r1, #8]
_08081A80:
	ldr r0, _08081AA0 @ =IWRAM_START + 0xE8
	adds r5, r4, r0
	ldr r1, [sp]
	ldr r3, [r5]
	cmp r1, r3
	bls _08081AA4
	subs r0, #4
	adds r2, r4, r0
	subs r1, r1, r3
	ldr r0, [r2]
	b _08081ABA
	.align 2, 0
_08081A98: .4byte gCurTask
_08081A9C: .4byte sub_8081C8C
_08081AA0: .4byte IWRAM_START + 0xE8
_08081AA4:
	cmp r1, r3
	bhs _08081AC2
	ldr r1, _08081AD0 @ =IWRAM_START + 0xE4
	adds r2, r4, r1
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r0, r1
	subs r0, r0, r3
	str r0, [r2]
	ldr r1, [sp]
_08081ABA:
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [sp]
	str r0, [r5]
_08081AC2:
	adds r0, r6, #0
	bl sub_8081E90
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081AD0: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_8081AD4
sub_8081AD4: @ 0x08081AD4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, _08081BBC @ =gDispCnt
	mov r8, r0
	ldr r1, _08081BC0 @ =0x00000101
	adds r0, r1, #0
	mov r2, r8
	strh r0, [r2]
	ldr r0, _08081BC4 @ =gBgCntRegs
	mov sb, r0
	movs r5, #0
	movs r4, #0
	ldr r0, _08081BC8 @ =0x00001E02
	mov r1, sb
	strh r0, [r1]
	ldr r6, _08081BCC @ =gBgScrollRegs
	strh r4, [r6]
	strh r4, [r6, #2]
	adds r0, r3, #0
	adds r0, #0x9c
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08081BD0 @ =0x0600F000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r2, _08081BD4 @ =gUnknown_080E0218
	adds r1, r3, #0
	adds r1, #0xfa
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r1, r3, #0
	adds r1, #0xc6
	strb r5, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	mov r0, sp
	strh r4, [r0]
	ldr r5, _08081BD8 @ =gUnknown_030028A2
	ldr r2, _08081BDC @ =0x0100000F
	adds r1, r5, #0
	bl CpuSet
	mov r2, r8
	ldrh r0, [r2]
	movs r2, #0x88
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	ldr r2, _08081BE0 @ =0x00001F01
	strh r4, [r6, #4]
	strh r4, [r6, #6]
	ldr r1, _08081BE4 @ =gWinRegs
	ldr r0, _08081BE8 @ =0x00002828
	strh r0, [r1]
	ldr r0, _08081BEC @ =0x00008890
	strh r0, [r1, #4]
	movs r0, #2
	strh r0, [r1, #8]
	movs r4, #1
	strh r4, [r1, #0xa]
	mov r0, sb
	strh r2, [r0, #2]
	mov r0, sp
	adds r0, #2
	ldr r2, _08081BF0 @ =0x0000F3FF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08081BF4 @ =0x0600F800
	ldr r2, _08081BF8 @ =0x01000400
	bl CpuSet
	add r0, sp, #4
	ldr r2, _08081BFC @ =0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, _08081C00 @ =0x06007FE0
	ldr r2, _08081C04 @ =0x01000010
	bl CpuSet
	movs r0, #0xee
	lsls r0, r0, #1
	adds r5, r5, r0
	movs r0, #0x1f
	strh r0, [r5]
	ldr r1, _08081C08 @ =gFlags
	ldr r0, [r1]
	orrs r0, r4
	str r0, [r1]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081BBC: .4byte gDispCnt
_08081BC0: .4byte 0x00000101
_08081BC4: .4byte gBgCntRegs
_08081BC8: .4byte 0x00001E02
_08081BCC: .4byte gBgScrollRegs
_08081BD0: .4byte 0x0600F000
_08081BD4: .4byte gUnknown_080E0218
_08081BD8: .4byte gUnknown_030028A2
_08081BDC: .4byte 0x0100000F
_08081BE0: .4byte 0x00001F01
_08081BE4: .4byte gWinRegs
_08081BE8: .4byte 0x00002828
_08081BEC: .4byte 0x00008890
_08081BF0: .4byte 0x0000F3FF
_08081BF4: .4byte 0x0600F800
_08081BF8: .4byte 0x01000400
_08081BFC: .4byte 0x0000FFFF
_08081C00: .4byte 0x06007FE0
_08081C04: .4byte 0x01000010
_08081C08: .4byte gFlags

	thumb_func_start sub_8081C0C
sub_8081C0C: @ 0x08081C0C
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r6, _08081C40 @ =gUnknown_03005500
	movs r2, #0
	ldr r5, _08081C44 @ =gUnknown_03005428
	ldr r4, _08081C48 @ =gUnknown_030054B4
	ldr r3, _08081C4C @ =gUnknown_030054D4
_08081C1A:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r1, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _08081C1A
	bl MultiSioStart
	movs r0, #0
	bl sub_8081EC0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081C40: .4byte gUnknown_03005500
_08081C44: .4byte gUnknown_03005428
_08081C48: .4byte gUnknown_030054B4
_08081C4C: .4byte gUnknown_030054D4

	thumb_func_start sub_8081C50
sub_8081C50: @ 0x08081C50
	push {r4, lr}
	ldr r4, _08081C80 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r2, _08081C84 @ =gUnknown_030054D4
	movs r1, #0
	strb r1, [r2, #3]
	strb r1, [r2, #2]
	strb r1, [r2, #1]
	strb r1, [r2]
	bl sub_8081DB4
	ldr r1, [r4]
	ldr r0, _08081C88 @ =sub_80818B8
	str r0, [r1, #8]
	bl MultiSioStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081C80: .4byte gCurTask
_08081C84: .4byte gUnknown_030054D4
_08081C88: .4byte sub_80818B8

	thumb_func_start sub_8081C8C
sub_8081C8C: @ 0x08081C8C
	push {r4, lr}
	ldr r4, _08081CB8 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r2, _08081CBC @ =gUnknown_030054D4
	movs r1, #0
	strb r1, [r2, #3]
	strb r1, [r2, #2]
	strb r1, [r2, #1]
	strb r1, [r2]
	bl sub_8081DB4
	ldr r1, [r4]
	ldr r0, _08081CC0 @ =sub_8081CC4
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081CB8: .4byte gCurTask
_08081CBC: .4byte gUnknown_030054D4
_08081CC0: .4byte sub_8081CC4

	thumb_func_start sub_8081CC4
sub_8081CC4: @ 0x08081CC4
	push {lr}
	ldr r0, _08081CF4 @ =gMultiSioStatusFlags
	ldr r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081CEA
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08081CE2
	ldr r1, _08081CF8 @ =gMultiSioSend
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
_08081CE2:
	ldr r0, _08081CFC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08081D00 @ =sub_80818B8
	str r0, [r1, #8]
_08081CEA:
	bl sub_80818B8
	pop {r0}
	bx r0
	.align 2, 0
_08081CF4: .4byte gMultiSioStatusFlags
_08081CF8: .4byte gMultiSioSend
_08081CFC: .4byte gCurTask
_08081D00: .4byte sub_80818B8

	thumb_func_start sub_8081D04
sub_8081D04: @ 0x08081D04
	push {r4, r5, lr}
	ldr r5, _08081D3C @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	bl MultiSioStop
	ldr r1, _08081D40 @ =gIntrTable
	ldr r0, _08081D44 @ =Sio32MultiLoadIntr
	str r0, [r1]
	ldr r0, _08081D48 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	ldr r2, _08081D4C @ =gUnknown_080E0168
	ldr r1, _08081D50 @ =IWRAM_START + 0xF9
	adds r4, r4, r1
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl Sio32MultiLoadInit
	ldr r1, [r5]
	ldr r0, _08081D54 @ =sub_8081A5C
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081D3C: .4byte gCurTask
_08081D40: .4byte gIntrTable
_08081D44: .4byte Sio32MultiLoadIntr
_08081D48: .4byte gMultiSioStatusFlags
_08081D4C: .4byte gUnknown_080E0168
_08081D50: .4byte IWRAM_START + 0xF9
_08081D54: .4byte sub_8081A5C

	thumb_func_start sub_8081D58
sub_8081D58: @ 0x08081D58
	push {lr}
	ldr r0, _08081D6C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	movs r0, #0
	bl sub_8081EC0
	pop {r0}
	bx r0
	.align 2, 0
_08081D6C: .4byte gCurTask

	thumb_func_start sub_8081D70
sub_8081D70: @ 0x08081D70
	push {r4, r5, lr}
	movs r2, #1
	movs r1, #1
	ldr r4, _08081DB0 @ =gUnknown_03002A90
	ldrb r5, [r4, #0x1d]
	movs r3, #1
_08081D7C:
	adds r0, r5, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08081D9A
	ldrb r0, [r4, #0x1e]
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08081D9A
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r2, r0, #0x18
_08081D9A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08081D7C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08081DB0: .4byte gUnknown_03002A90

	thumb_func_start sub_8081DB4
sub_8081DB4: @ 0x08081DB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08081DE4 @ =gIntrTable
	ldr r0, _08081DE8 @ =gMultiSioIntrFuncBuf
	str r0, [r1]
	ldr r5, _08081DEC @ =gMultiSioStatusFlags
	ldr r0, [r5]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	bl MultiSioInit
	adds r1, r4, #0
	adds r1, #0xf8
	movs r0, #0
	strb r0, [r1]
	adds r4, #0xf4
	str r0, [r4]
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081DE4: .4byte gIntrTable
_08081DE8: .4byte gMultiSioIntrFuncBuf
_08081DEC: .4byte gMultiSioStatusFlags

	thumb_func_start sub_8081DF0
sub_8081DF0: @ 0x08081DF0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	adds r5, r6, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r1, r6, #0
	adds r1, #0x76
	ldr r0, _08081E34 @ =0x00000432
	strh r0, [r1]
	adds r4, #6
	adds r0, r6, #0
	adds r0, #0x8c
	strb r4, [r0]
	adds r1, #0x17
	movs r0, #0xff
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x6c
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081E34: .4byte 0x00000432

	thumb_func_start sub_8081E38
sub_8081E38: @ 0x08081E38
	push {r4, lr}
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	adds r4, r2, #0
	adds r1, r2, #0
	adds r1, #8
	movs r3, #1
	adds r0, r3, #0
	lsls r0, r1
	ldr r1, _08081E74 @ =gMultiSioStatusFlags
	ldr r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08081E84
	adds r0, r3, #0
	lsls r0, r2
	ands r0, r1
	cmp r0, #0
	bne _08081E7C
	ldr r0, _08081E78 @ =gUnknown_030054D4
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xb4
	bls _08081E84
	movs r0, #0
	b _08081E86
	.align 2, 0
_08081E74: .4byte gMultiSioStatusFlags
_08081E78: .4byte gUnknown_030054D4
_08081E7C:
	ldr r0, _08081E8C @ =gUnknown_030054D4
	adds r0, r4, r0
	movs r1, #0
	strb r1, [r0]
_08081E84:
	movs r0, #1
_08081E86:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08081E8C: .4byte gUnknown_030054D4

	thumb_func_start sub_8081E90
sub_8081E90: @ 0x08081E90
	push {lr}
	adds r0, #0xe4
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	movs r1, #0x90
	lsls r1, r1, #9
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08081EBC @ =gWinRegs
	adds r0, #0x28
	movs r3, #0xa0
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08081EBC: .4byte gWinRegs

	thumb_func_start sub_8081EC0
sub_8081EC0: @ 0x08081EC0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08081F5C @ =gUnknown_08C88408
	ldr r4, _08081F60 @ =gUnknown_08C92208
	ldr r1, _08081F64 @ =gUnknown_030054D4
	movs r0, #0
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	strb r0, [r1, #1]
	strb r0, [r1]
	ldr r1, _08081F68 @ =gWinRegs
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r1, _08081F6C @ =gUnknown_03005424
	strh r0, [r1]
	ldr r1, _08081F70 @ =gUnknown_03001954
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08081F74 @ =gFlags
	ldr r0, [r2]
	ldr r1, _08081F78 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2]
	bl m4aSoundVSyncOn
	ldr r1, _08081F7C @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r4, #0
	bl CpuFastSet
	ldr r4, _08081F80 @ =gUnknown_02033000
	movs r2, #0xd0
	lsls r2, r2, #6
	adds r0, r5, #0
	adds r1, r4, #0
	bl CpuFastSet
	ldr r1, _08081F84 @ =gUnknown_03002260
	ldr r0, [r4]
	str r0, [r1]
	ldr r1, _08081F88 @ =gUnknown_030053EC
	ldr r0, _08081F8C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	strb r0, [r1]
	bl sub_8081FB0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	bl sub_8082B1C
	adds r4, r0, #0
	bl sub_8082038
	adds r0, r4, #0
	bl sub_8082B80
	adds r0, r4, #0
	bl sub_8082BF8
	cmp r6, #0
	beq _08081F90
	adds r0, r4, #0
	bl sub_8082C58
	movs r0, #0x40
	bl m4aSongNumStart
	b _08081F9C
	.align 2, 0
_08081F5C: .4byte gUnknown_08C88408
_08081F60: .4byte gUnknown_08C92208
_08081F64: .4byte gUnknown_030054D4
_08081F68: .4byte gWinRegs
_08081F6C: .4byte gUnknown_03005424
_08081F70: .4byte gUnknown_03001954
_08081F74: .4byte gFlags
_08081F78: .4byte 0xFFFFBFFF
_08081F7C: .4byte gGameMode
_08081F80: .4byte gUnknown_02033000
_08081F84: .4byte gUnknown_03002260
_08081F88: .4byte gUnknown_030053EC
_08081F8C: .4byte gLoadedSaveGame
_08081F90:
	adds r0, r4, #0
	bl sub_8082CB4
	movs r0, #0x42
	bl m4aSongNumStart
_08081F9C:
	ldr r1, _08081FAC @ =gBldRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081FAC: .4byte gBldRegs

	thumb_func_start sub_8081FB0
sub_8081FB0: @ 0x08081FB0
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08082010 @ =gDispCnt
	movs r4, #0x40
	strh r4, [r0]
	ldr r1, _08082014 @ =gBgCntRegs
	movs r2, #0
	movs r5, #0
	ldr r0, _08082018 @ =0x00005E0B
	strh r0, [r1, #6]
	ldr r0, _0808201C @ =0x00001C0C
	strh r0, [r1, #4]
	ldr r3, _08082020 @ =gUnknown_03004D80
	movs r0, #0x7f
	strb r0, [r3, #2]
	ldr r0, _08082024 @ =gUnknown_03002280
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #0xff
	strb r1, [r0, #0xa]
	movs r1, #0x20
	strb r1, [r0, #0xb]
	subs r1, #0x21
	strb r1, [r3, #3]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r1, [r0, #0xe]
	strb r4, [r0, #0xf]
	str r5, [sp]
	ldr r0, _08082028 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _0808202C @ =0x06009FE0
	str r1, [r0, #4]
	ldr r2, _08082030 @ =0x85000010
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08082034 @ =0x0600CFE0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082010: .4byte gDispCnt
_08082014: .4byte gBgCntRegs
_08082018: .4byte 0x00005E0B
_0808201C: .4byte 0x00001C0C
_08082020: .4byte gUnknown_03004D80
_08082024: .4byte gUnknown_03002280
_08082028: .4byte 0x040000D4
_0808202C: .4byte 0x06009FE0
_08082030: .4byte 0x85000010
_08082034: .4byte 0x0600CFE0

	thumb_func_start sub_8082038
sub_8082038: @ 0x08082038
	push {lr}
	ldr r1, _08082074 @ =0x06008000
	str r1, [r0, #4]
	movs r3, #0
	movs r1, #0
	strh r1, [r0, #0xa]
	ldr r2, _08082078 @ =0x0600F000
	str r2, [r0, #0xc]
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	movs r2, #5
	strh r2, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	strh r1, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x19
	strh r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r3, [r1]
	movs r1, #3
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	pop {r0}
	bx r0
	.align 2, 0
_08082074: .4byte 0x06008000
_08082078: .4byte 0x0600F000

	thumb_func_start sub_808207C
sub_808207C: @ 0x0808207C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _080820FC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _08082100 @ =gUnknown_030055B8
	ldr r3, _08082104 @ =gMultiSioStatusFlags
	ldr r0, [r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r2]
	ldr r0, _08082108 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0808213E
	movs r6, #0
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808213E
	movs r7, #1
	ldr r5, _0808210C @ =gUnknown_030054D4
_080820BE:
	adds r0, r7, #0
	lsls r0, r6
	ldr r4, [r3]
	ands r4, r0
	cmp r4, #0
	bne _08082128
	ldrb r0, [r5]
	adds r1, r0, #1
	strb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0808212C
	movs r0, #0
	ldr r1, _08082110 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08082114 @ =gUnknown_03002AE4
	ldr r0, _08082118 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0808211C @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08082120 @ =gUnknown_03004D5C
	ldr r0, _08082124 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _080823EA
	.align 2, 0
_080820FC: .4byte gDispCnt
_08082100: .4byte gUnknown_030055B8
_08082104: .4byte gMultiSioStatusFlags
_08082108: .4byte gGameMode
_0808210C: .4byte gUnknown_030054D4
_08082110: .4byte 0x0000FFFF
_08082114: .4byte gUnknown_03002AE4
_08082118: .4byte gUnknown_0300287C
_0808211C: .4byte gUnknown_03005390
_08082120: .4byte gUnknown_03004D5C
_08082124: .4byte gUnknown_03002A84
_08082128:
	movs r0, #0
	strb r0, [r5]
_0808212C:
	adds r5, #1
	adds r6, #1
	cmp r6, #3
	bhi _0808213E
	ldrb r0, [r2]
	asrs r0, r6
	ands r0, r7
	cmp r0, #0
	bne _080820BE
_0808213E:
	ldr r2, _080821C8 @ =gMultiSioSend
	ldr r0, _080821CC @ =0x00004010
	strh r0, [r2]
	ldr r0, [r3]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08082154
	ldr r0, _080821D0 @ =gUnknown_030053EC
	ldrb r0, [r0]
	strb r0, [r2, #3]
_08082154:
	ldr r0, _080821D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov r8, r0
	ldr r1, _080821D8 @ =gBldRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #4]
	ldr r0, _080821DC @ =gTimerReg
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bhi _0808217E
	b _080822E8
_0808217E:
	ldr r2, _080821E0 @ =gFlags
	ldr r0, [r2]
	ldr r1, _080821E4 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	ldr r1, _080821E8 @ =gSavedIme
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08082234
	movs r6, #0
	movs r0, #0
	mov sl, r0
	movs r7, #0
	ldr r2, _080821EC @ =0x0000044C
	subs r1, #0xbc
	adds r4, r3, r1
	ldr r1, _080821F0 @ =0x06012500
	ldr r0, _080821F4 @ =IWRAM_START + 0x370
	adds r5, r3, r0
	ldr r3, _080821F8 @ =0x0000044B
	mov sb, r3
_080821AA:
	str r1, [r5, #4]
	strh r7, [r4, #0xe]
	strh r7, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	strh r7, [r4]
	ldr r0, _080821D0 @ =gUnknown_030053EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080821FC
	mov r0, sb
	strh r0, [r4, #2]
	b _080821FE
	.align 2, 0
_080821C8: .4byte gMultiSioSend
_080821CC: .4byte 0x00004010
_080821D0: .4byte gUnknown_030053EC
_080821D4: .4byte gCurTask
_080821D8: .4byte gBldRegs
_080821DC: .4byte gTimerReg
_080821E0: .4byte gFlags
_080821E4: .4byte 0xFFFF7FFF
_080821E8: .4byte gSavedIme
_080821EC: .4byte 0x0000044C
_080821F0: .4byte 0x06012500
_080821F4: .4byte IWRAM_START + 0x370
_080821F8: .4byte 0x0000044B
_080821FC:
	strh r2, [r4, #2]
_080821FE:
	strb r6, [r4, #0x18]
	strh r7, [r4, #0xc]
	strh r7, [r4, #0x14]
	movs r0, #0xff
	strb r0, [r4, #0x19]
	movs r0, #0x10
	strb r0, [r4, #0x1a]
	mov r3, sl
	strb r3, [r4, #0x1d]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #8]
	adds r0, r5, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl sub_8004558
	adds r4, #0x30
	ldr r1, [sp, #4]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r5, #0x30
	adds r6, #1
	ldr r2, [sp, #8]
	cmp r6, #2
	bls _080821AA
_08082234:
	ldr r0, _08082260 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080822C2
	movs r3, #0x80
	lsls r3, r3, #3
	add r3, r8
	movs r0, #0x78
	strh r0, [r3, #0x16]
	movs r0, #0x50
	strh r0, [r3, #0x18]
	ldr r0, _08082264 @ =0x00000434
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	beq _08082268
	movs r0, #0xf5
	lsls r0, r0, #2
	b _0808226C
	.align 2, 0
_08082260: .4byte gMultiSioStatusFlags
_08082264: .4byte 0x00000434
_08082268:
	movs r0, #0xd1
	lsls r0, r0, #2
_0808226C:
	add r0, r8
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3, #4]
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #0x1a]
	strh r0, [r3, #8]
	ldr r0, _0808228C @ =gUnknown_030053EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _08082294
	ldr r0, _08082290 @ =0x00000452
	b _08082296
	.align 2, 0
_0808228C: .4byte gUnknown_030053EC
_08082290: .4byte 0x00000452
_08082294:
	ldr r0, _080822DC @ =0x00000453
_08082296:
	strh r0, [r3, #0xa]
	adds r0, r3, #0
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	movs r2, #0
	strh r1, [r3, #0x14]
	strh r1, [r3, #0x1c]
	adds r4, r3, #0
	adds r4, #0x21
	movs r0, #0xff
	strb r0, [r4]
	adds r4, #1
	movs r0, #0x10
	strb r0, [r4]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	str r1, [r3, #0x10]
	adds r0, r3, #0
	bl sub_8004558
_080822C2:
	movs r1, #0x86
	lsls r1, r1, #3
	add r1, r8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080822E0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080822E4 @ =sub_80823FC
	str r0, [r1, #8]
	bl _call_via_r0
	b _080823EA
	.align 2, 0
_080822DC: .4byte 0x00000453
_080822E0: .4byte gCurTask
_080822E4: .4byte sub_80823FC
_080822E8:
	movs r6, #0
	movs r0, #1
	mov r8, r0
	ldr r1, _08082330 @ =gTimerReg
	adds r7, r3, r1
_080822F2:
	ldr r2, _08082334 @ =gMultiSioStatusFlags
	adds r0, r6, #0
	adds r0, #8
	mov r1, r8
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _0808236A
	ldr r0, _08082338 @ =gUnknown_030054B4
	adds r0, r6, r0
	ldrb r1, [r0]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _0808233C
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r5, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	adds r4, r6, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r0, [r7]
	movs r3, #0xf0
	subs r3, r3, r0
	b _08082354
	.align 2, 0
_08082330: .4byte gTimerReg
_08082334: .4byte gMultiSioStatusFlags
_08082338: .4byte gUnknown_030054B4
_0808233C:
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r5, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	adds r4, r6, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r3, [r7]
	subs r3, #0xf0
_08082354:
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0xa0
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_80078D4
	b _080823E2
_0808236A:
	ldr r0, _080823AC @ =gUnknown_030054B4
	adds r2, r6, r0
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080823B0
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r1, r4, #0x1b
	lsrs r1, r1, #0x18
	adds r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r0, [r7]
	movs r3, #0xf0
	subs r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r6, #2
	adds r0, r0, r6
	subs r0, r0, r4
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_80078D4
	b _080823E0
	.align 2, 0
_080823AC: .4byte gUnknown_030054B4
_080823B0:
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r1, r4, #0x1b
	lsrs r1, r1, #0x18
	adds r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r3, [r7]
	subs r3, #0xf0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r6, #2
	adds r0, r0, r6
	subs r0, r0, r4
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_80078D4
_080823E0:
	adds r4, r6, #1
_080823E2:
	adds r6, r4, #0
	cmp r6, #3
	bhi _080823EA
	b _080822F2
_080823EA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80823FC
sub_80823FC: @ 0x080823FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _08082484 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r4
	mov sb, r0
	ldr r1, _08082488 @ =gUnknown_030055B8
	mov r8, r1
	ldr r7, _0808248C @ =gMultiSioStatusFlags
	ldr r0, [r7]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	mov r3, r8
	strb r0, [r3]
	ldr r5, _08082490 @ =gMultiSioRecv
	ldrh r1, [r5]
	ldr r0, _08082494 @ =0x00004012
	cmp r1, r0
	beq _0808243C
	b _08082544
_0808243C:
	ldr r1, _08082498 @ =gSelectedCharacter
	ldr r0, _0808249C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
	ldr r5, _080824A0 @ =gSavedIme
	adds r0, r4, r5
	ldr r0, [r0]
	cmp r0, #0
	bne _080824E8
	ldr r0, _080824A4 @ =IWRAM_START + 0x40
	adds r2, r4, r0
	ldr r0, _080824A8 @ =gBgScrollRegs
	strh r6, [r0, #8]
	strh r6, [r0, #0xa]
	ldr r0, _080824AC @ =0x0600C000
	str r0, [r2, #4]
	strh r6, [r2, #0xa]
	ldr r0, _080824B0 @ =0x0600E000
	str r0, [r2, #0xc]
	strh r6, [r2, #0x18]
	strh r6, [r2, #0x1a]
	movs r0, #6
	strh r0, [r2, #0x1c]
	ldr r0, _080824B4 @ =gUnknown_030053EC
	ldrb r0, [r0]
	cmp r0, #1
	beq _080824B8
	cmp r0, #1
	bgt _080824BE
	cmp r0, #0
	bne _080824BE
	strh r6, [r2, #0x1e]
	b _080824C2
	.align 2, 0
_08082484: .4byte gCurTask
_08082488: .4byte gUnknown_030055B8
_0808248C: .4byte gMultiSioStatusFlags
_08082490: .4byte gMultiSioRecv
_08082494: .4byte 0x00004012
_08082498: .4byte gSelectedCharacter
_0808249C: .4byte 0x04000128
_080824A0: .4byte gSavedIme
_080824A4: .4byte IWRAM_START + 0x40
_080824A8: .4byte gBgScrollRegs
_080824AC: .4byte 0x0600C000
_080824B0: .4byte 0x0600E000
_080824B4: .4byte gUnknown_030053EC
_080824B8:
	strh r6, [r2, #0x1e]
	strh r6, [r2, #0x20]
	b _080824C6
_080824BE:
	movs r0, #0
	strh r0, [r2, #0x1e]
_080824C2:
	movs r0, #4
	strh r0, [r2, #0x20]
_080824C6:
	movs r1, #0
	movs r0, #6
	strh r0, [r2, #0x22]
	movs r0, #8
	strh r0, [r2, #0x24]
	movs r0, #0x12
	strh r0, [r2, #0x26]
	movs r0, #4
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r1, [r0]
	movs r0, #2
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	bl sub_8002A3C
_080824E8:
	ldr r2, _08082518 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x86
	lsls r1, r1, #3
	add r1, sb
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0808251C @ =0x00000434
	add r0, sb
	ldr r0, [r0]
	cmp r0, #0
	beq _0808252C
	ldr r1, _08082520 @ =gBldRegs
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08082524 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08082528 @ =sub_8082630
	b _08082532
	.align 2, 0
_08082518: .4byte gDispCnt
_0808251C: .4byte 0x00000434
_08082520: .4byte gBldRegs
_08082524: .4byte gCurTask
_08082528: .4byte sub_8082630
_0808252C:
	ldr r0, _0808253C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08082540 @ =sub_8082AA8
_08082532:
	str r0, [r1, #8]
	bl _call_via_r0
	b _08082606
	.align 2, 0
_0808253C: .4byte gCurTask
_08082540: .4byte sub_8082AA8
_08082544:
	bl sub_8082788
	ldr r0, [r7]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808255A
	ldr r1, _08082584 @ =gMultiBootRequiredData
	adds r0, r4, r1
	bl sub_80051E8
_0808255A:
	movs r2, #0
	mov r3, r8
	ldrb r1, [r3]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080825B8
	movs r3, #1
	ldr r4, [r7]
	ldr r0, _08082588 @ =0x00004010
	mov sl, r0
	mov ip, r5
	movs r1, #0
_08082574:
	adds r0, r3, #0
	lsls r0, r2
	ands r0, r4
	cmp r0, #0
	bne _0808258C
	movs r5, #1
	str r5, [sp]
	b _080825A4
	.align 2, 0
_08082584: .4byte gMultiBootRequiredData
_08082588: .4byte 0x00004010
_0808258C:
	mov r0, ip
	adds r5, r1, r0
	ldr r0, _08082618 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r2, r0
	beq _080825A2
	ldrh r0, [r5]
	cmp r0, sl
	bne _080825A4
_080825A2:
	adds r6, #1
_080825A4:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #3
	bhi _080825B8
	mov r5, r8
	ldrb r0, [r5]
	asrs r0, r2
	ands r0, r3
	cmp r0, #0
	bne _08082574
_080825B8:
	ldr r5, _0808261C @ =gMultiSioSend
	ldr r0, _08082620 @ =0x00004010
	strh r0, [r5]
	ldr r0, [r7]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080825EC
	ldr r0, _08082624 @ =gUnknown_030053EC
	ldrb r0, [r0]
	strb r0, [r5, #3]
	ldr r0, [r7]
	ands r0, r1
	cmp r0, #0
	beq _080825EC
	ldr r0, _08082628 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080825EC
	ldr r0, [sp]
	cmp r0, #0
	bne _080825EC
	cmp r6, #1
	bgt _080825F8
_080825EC:
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08082606
_080825F8:
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, sb
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0808262C @ =0x00004012
	strh r0, [r5]
_08082606:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082618: .4byte 0x04000128
_0808261C: .4byte gMultiSioSend
_08082620: .4byte 0x00004010
_08082624: .4byte gUnknown_030053EC
_08082628: .4byte gPressedKeys
_0808262C: .4byte 0x00004012

	thumb_func_start sub_8082630
sub_8082630: @ 0x08082630
	push {r4, r5, lr}
	ldr r5, _0808266C @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08082670 @ =gTimerReg
	adds r4, r0, r1
	ldrh r0, [r4]
	adds r0, #0x20
	strh r0, [r4]
	bl sub_8082788
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	bls _0808265E
	strh r1, [r4]
	ldr r1, _08082674 @ =gBldRegs
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r1, [r5]
	ldr r0, _08082678 @ =sub_808267C
	str r0, [r1, #8]
_0808265E:
	ldr r1, _08082674 @ =gBldRegs
	ldrh r0, [r4]
	lsrs r0, r0, #8
	strh r0, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808266C: .4byte gCurTask
_08082670: .4byte gTimerReg
_08082674: .4byte gBldRegs
_08082678: .4byte sub_808267C

	thumb_func_start sub_808267C
sub_808267C: @ 0x0808267C
	push {r4, r5, r6, r7, lr}
	ldr r2, _080826D8 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, _080826DC @ =gMultiSioRecv
	ldrh r1, [r3]
	movs r0, #0x81
	lsls r0, r0, #7
	adds r6, r2, #0
	cmp r1, r0
	bne _08082710
	ldr r1, _080826E0 @ =gUnknown_03005434
	ldr r0, [r3, #8]
	str r0, [r1]
	movs r1, #0
	ldr r5, _080826E4 @ =gFlags
	ldr r2, _080826E8 @ =gUnknown_03005500
	movs r4, #0
	ldr r3, _080826EC @ =gUnknown_030054B4
_080826A8:
	adds r0, r1, r2
	strb r4, [r0]
	adds r0, r1, r3
	strb r1, [r0]
	adds r1, #1
	cmp r1, #3
	bls _080826A8
	ldr r0, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5]
	ldr r1, _080826F0 @ =0x00000434
	adds r0, r7, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _080826F4
	ldr r0, [r6]
	bl TaskDestroy
	movs r0, #0
	bl sub_8081EC0
	b _08082768
	.align 2, 0
_080826D8: .4byte gCurTask
_080826DC: .4byte gMultiSioRecv
_080826E0: .4byte gUnknown_03005434
_080826E4: .4byte gFlags
_080826E8: .4byte gUnknown_03005500
_080826EC: .4byte gUnknown_030054B4
_080826F0: .4byte 0x00000434
_080826F4:
	ldr r0, [r6]
	bl TaskDestroy
	ldr r0, _0808270C @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #4]
	bl sub_8081200
	bl sub_801A770
	b _08082768
	.align 2, 0
_0808270C: .4byte gBldRegs
_08082710:
	bl sub_8082788
	ldr r3, _08082770 @ =gMultiSioSend
	movs r0, #0
	ldr r4, _08082774 @ =0x00004051
	strh r4, [r3]
	strb r0, [r3, #2]
	ldr r0, _08082778 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08082768
	movs r1, #0
	ldr r0, _0808277C @ =gUnknown_030055B8
	ldrb r2, [r0]
	adds r6, r4, #0
	movs r5, #1
	ldr r4, _08082780 @ =gMultiSioRecv
_08082736:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _0808274E
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldrh r0, [r3]
	cmp r0, r6
	bne _08082768
_0808274E:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08082736
	ldr r3, _08082770 @ =gMultiSioSend
	movs r0, #0x81
	lsls r0, r0, #7
	strh r0, [r3]
	ldr r1, _08082784 @ =0x0000043C
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [r3, #8]
_08082768:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082770: .4byte gMultiSioSend
_08082774: .4byte 0x00004051
_08082778: .4byte gMultiSioStatusFlags
_0808277C: .4byte gUnknown_030055B8
_08082780: .4byte gMultiSioRecv
_08082784: .4byte 0x0000043C

	thumb_func_start sub_8082788
sub_8082788: @ 0x08082788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080827EC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0808282A
	movs r5, #0
	ldr r2, _080827F0 @ =gUnknown_030055B8
	ldrb r1, [r2]
	movs r0, #1
	ands r1, r0
	ldr r7, _080827F4 @ =gMultiSioStatusFlags
	cmp r1, #0
	beq _0808282A
	movs r6, #1
	ldr r3, _080827F8 @ =gUnknown_030054D4
_080827B0:
	adds r0, r6, #0
	lsls r0, r5
	ldr r4, [r7]
	ands r4, r0
	cmp r4, #0
	bne _08082814
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08082818
	movs r0, #0
	ldr r1, _080827FC @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08082800 @ =gUnknown_03002AE4
	ldr r0, _08082804 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08082808 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0808280C @ =gUnknown_03004D5C
	ldr r0, _08082810 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08082A96
	.align 2, 0
_080827EC: .4byte gGameMode
_080827F0: .4byte gUnknown_030055B8
_080827F4: .4byte gMultiSioStatusFlags
_080827F8: .4byte gUnknown_030054D4
_080827FC: .4byte 0x0000FFFF
_08082800: .4byte gUnknown_03002AE4
_08082804: .4byte gUnknown_0300287C
_08082808: .4byte gUnknown_03005390
_0808280C: .4byte gUnknown_03004D5C
_08082810: .4byte gUnknown_03002A84
_08082814:
	movs r0, #0
	strb r0, [r3]
_08082818:
	adds r3, #1
	adds r5, #1
	cmp r5, #3
	bhi _0808282A
	ldrb r0, [r2]
	asrs r0, r5
	ands r0, r6
	cmp r0, #0
	bne _080827B0
_0808282A:
	ldr r0, _0808287C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sb, r1
	movs r0, #0
	mov r8, r0
_0808283C:
	ldr r2, _08082880 @ =gMultiSioStatusFlags
	mov r0, r8
	adds r0, #8
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08082884
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r3, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	mov r4, r8
	adds r4, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	movs r0, #0xa0
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r3, #0
	bl sub_80078D4
	b _08082A8E
	.align 2, 0
_0808287C: .4byte gCurTask
_08082880: .4byte gMultiSioStatusFlags
_08082884:
	ldr r0, _080829D8 @ =gUnknown_030054B4
	add r0, r8
	mov sl, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r3, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	adds r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	mov r5, r8
	lsls r4, r5, #2
	adds r0, r4, r5
	lsls r6, r0, #3
	subs r3, r6, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	movs r0, #3
	movs r3, #0
	bl sub_80078D4
	ldr r0, _080829DC @ =0x00000434
	add r0, sb
	ldr r0, [r0]
	cmp r0, #0
	bne _080828C8
	b _080829E8
_080828C8:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, #0x80
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0x78
	strh r0, [r5, #0x16]
	mov r2, sl
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _080829E0 @ =gUnknown_03005500
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xdc
	lsls r5, r5, #2
	adds r0, r0, r5
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0x34
	strh r0, [r5, #0x16]
	mov r2, sl
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _080829E4 @ =gUnknown_030053E8
	add r0, r8
	ldrb r0, [r0]
	bl sub_8004518
	lsls r4, r0, #0x10
	lsrs r5, r4, #0x10
	str r5, [sp, #4]
	lsrs r1, r4, #0x18
	movs r2, #0xf
	ands r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r7, #0xb0
	lsls r7, r7, #1
	adds r0, r0, r7
	mov r1, sb
	adds r5, r1, r0
	adds r6, r1, r7
	cmp r5, r6
	beq _08082970
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	mov r0, sl
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	str r2, [sp, #8]
	bl sub_80051E8
	ldr r2, [sp, #8]
_08082970:
	lsrs r1, r4, #0x14
	ands r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r7
	mov r1, sb
	adds r5, r1, r0
	cmp r5, r6
	bne _0808298A
	ldr r2, [sp, #4]
	cmp r2, #0xff
	bls _080829A4
_0808298A:
	movs r0, #0xab
	strh r0, [r5, #0x16]
	mov r0, sl
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_080829A4:
	movs r1, #0xf
	ldr r2, [sp, #4]
	ands r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xb0
	lsls r5, r5, #1
	adds r0, r0, r5
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0xb6
	strh r0, [r5, #0x16]
	ldr r0, _080829D8 @ =gUnknown_030054B4
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	b _08082A8A
	.align 2, 0
_080829D8: .4byte gUnknown_030054B4
_080829DC: .4byte 0x00000434
_080829E0: .4byte gUnknown_03005500
_080829E4: .4byte gUnknown_030053E8
_080829E8:
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x80
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0x78
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08082A1C @ =gUnknown_03005428
	mov r2, r8
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _08082A20
	movs r7, #0x63
	b _08082A2A
	.align 2, 0
_08082A1C: .4byte gUnknown_03005428
_08082A20:
	ldrb r0, [r1]
	bl sub_8004518
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08082A2A:
	lsrs r0, r7, #4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	movs r6, #0xb0
	lsls r6, r6, #1
	adds r1, r1, r6
	mov r0, sb
	adds r5, r0, r1
	adds r0, r0, r6
	cmp r5, r0
	beq _08082A56
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	mov r1, r8
	adds r0, r4, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_08082A56:
	movs r1, #0xf
	ands r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	mov r2, sb
	adds r5, r2, r0
	movs r0, #0xab
	strh r0, [r5, #0x16]
	add r4, r8
	lsls r4, r4, #3
	adds r4, #0x14
	strh r4, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	movs r5, #0xd0
	lsls r5, r5, #2
	add r5, sb
	movs r0, #0xc5
	strh r0, [r5, #0x16]
	strh r4, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_08082A8A:
	mov r4, r8
	adds r4, #1
_08082A8E:
	mov r8, r4
	cmp r4, #3
	bhi _08082A96
	b _0808283C
_08082A96:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8082AA8
sub_8082AA8: @ 0x08082AA8
	push {r4, r5, lr}
	ldr r5, _08082AFC @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	bl sub_8082788
	ldr r0, _08082B00 @ =gTimerReg
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _08082AF6
	movs r0, #0
	strh r0, [r4]
	ldr r0, _08082B04 @ =gMPlayInfo_BGM
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _08082B08 @ =gMPlayInfo_SE1
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _08082B0C @ =gMPlayInfo_SE2
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _08082B10 @ =gMPlayInfo_SE3
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r1, _08082B14 @ =gBldRegs
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, [r5]
	ldr r0, _08082B18 @ =sub_8082630
	str r0, [r1, #8]
_08082AF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082AFC: .4byte gCurTask
_08082B00: .4byte gTimerReg
_08082B04: .4byte gMPlayInfo_BGM
_08082B08: .4byte gMPlayInfo_SE1
_08082B0C: .4byte gMPlayInfo_SE2
_08082B10: .4byte gMPlayInfo_SE3
_08082B14: .4byte gBldRegs
_08082B18: .4byte sub_8082630

	thumb_func_start sub_8082B1C
sub_8082B1C: @ 0x08082B1C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08082B6C @ =sub_808207C
	movs r1, #0x88
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, _08082B70 @ =gSavedIme
	adds r1, r2, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r1]
	ldr r4, _08082B74 @ =gTimerReg
	adds r1, r2, r4
	movs r3, #0
	strh r5, [r1]
	adds r4, #8
	adds r1, r2, r4
	strb r3, [r1]
	ldr r1, _08082B78 @ =gUnknown_0300043C
	adds r2, r2, r1
	ldr r1, _08082B7C @ =gFrameCount
	ldr r1, [r1]
	str r1, [r2]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08082B6C: .4byte sub_808207C
_08082B70: .4byte gSavedIme
_08082B74: .4byte gTimerReg
_08082B78: .4byte gUnknown_0300043C
_08082B7C: .4byte gFrameCount

	thumb_func_start sub_8082B80
sub_8082B80: @ 0x08082B80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08082BF0 @ =gUnknown_080D672C
	mov r8, r0
_08082B90:
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	add r0, r8
	ldrh r2, [r0]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, #0x80
	adds r0, r6, r0
	lsls r1, r4, #0xb
	ldr r3, _08082BF4 @ =0x06010000
	adds r1, r1, r3
	movs r3, #0x78
	str r3, [sp]
	lsls r3, r4, #2
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r7, #0xa0
	lsls r7, r7, #0xd
	adds r3, r3, r7
	asrs r3, r3, #0x10
	str r3, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	str r3, [sp, #8]
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [sp, #0x10]
	movs r3, #0
	bl sub_8082CEC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _08082B90
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082BF0: .4byte gUnknown_080D672C
_08082BF4: .4byte 0x06010000

	thumb_func_start sub_8082BF8
sub_8082BF8: @ 0x08082BF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r3, #0
	movs r6, #0x80
	lsls r6, r6, #1
	movs r5, #0
_08082C06:
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	lsls r1, r4, #2
	adds r1, r1, r6
	lsls r1, r1, #5
	ldr r2, _08082C50 @ =0x06010000
	adds r1, r1, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	ldr r2, _08082C54 @ =0x00000451
	bl sub_8082CEC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #9
	ble _08082C06
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082C50: .4byte 0x06010000
_08082C54: .4byte 0x00000451

	thumb_func_start sub_8082C58
sub_8082C58: @ 0x08082C58
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r3, #0
	movs r5, #0
_08082C62:
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r6, r0
	lsls r1, r1, #6
	ldr r2, _08082CAC @ =0x06012500
	adds r1, r1, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	ldr r2, _08082CB0 @ =0x0000044B
	bl sub_8082CEC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #2
	ble _08082C62
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082CAC: .4byte 0x06012500
_08082CB0: .4byte 0x0000044B

	thumb_func_start sub_8082CB4
sub_8082CB4: @ 0x08082CB4
	push {r4, lr}
	sub sp, #0x14
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _08082CE4 @ =0x06012F00
	ldr r2, _08082CE8 @ =0x0000044B
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [sp, #0x10]
	movs r3, #3
	bl sub_8082CEC
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082CE4: .4byte 0x06012F00
_08082CE8: .4byte 0x0000044B

	thumb_func_start sub_8082CEC
sub_8082CEC: @ 0x08082CEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldr r0, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	ldr r4, [sp, #0x24]
	mov r8, r4
	movs r4, #0
	mov r7, ip
	strh r0, [r7, #0x16]
	strh r5, [r7, #0x18]
	str r1, [r7, #4]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r2, [r7, #0xa]
	mov r0, ip
	adds r0, #0x20
	strb r3, [r0]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	ldr r4, [sp, #0x28]
	str r4, [r7, #0x10]
	mov r0, ip
	bl sub_8004558
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8082D44
sub_8082D44: @ 0x08082D44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08082E08 @ =sub_808328C
	movs r1, #0x90
	lsls r1, r1, #2
	ldr r2, _08082E0C @ =0x00002102
	ldr r3, _08082E10 @ =sub_80832E0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _08082E14 @ =gUnknown_03005B6C
	movs r2, #0
	str r2, [r1]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	mov sl, r4
	movs r5, #0
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08082E18 @ =IWRAM_START + 0x21
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08082E1C @ =IWRAM_START + 0x22
	adds r1, r6, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08082E20 @ =IWRAM_START + 0x25
	adds r0, r6, r1
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xb
	str r0, [r4, #0x10]
	ldr r0, _08082E24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08082DB6
	movs r0, #9
	bl sub_8007C10
	str r0, [r4, #4]
	ldr r0, _08082E28 @ =0x000002D9
	strh r0, [r4, #0xa]
	ldr r2, _08082E2C @ =IWRAM_START + 0x20
	adds r0, r6, r2
	strb r5, [r0]
_08082DB6:
	adds r0, r4, #0
	bl sub_8004558
	movs r5, #0
	movs r7, #0
	ldr r0, _08082E30 @ =IWRAM_START + 0x34
	adds r4, r6, r0
	ldr r1, _08082E34 @ =IWRAM_START + 0x52
	adds r1, r1, r6
	mov r8, r1
	ldr r2, _08082E38 @ =IWRAM_START + 0x30
	adds r6, r6, r2
	ldr r0, _08082E3C @ =0x0000045F
	mov sb, r0
_08082DD2:
	strh r7, [r4, #0x12]
	strh r7, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x16]
	strh r7, [r4, #4]
	mov r1, sb
	strh r1, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x10
	strb r0, [r4, #0x1c]
	strh r7, [r4, #0x10]
	strh r7, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	movs r0, #0
	mov r2, r8
	strb r0, [r2, #3]
	str r7, [r4, #0xc]
	cmp r5, #0
	bne _08082E40
	movs r0, #0x16
	bl sub_8007C10
	b _08082E48
	.align 2, 0
_08082E08: .4byte sub_808328C
_08082E0C: .4byte 0x00002102
_08082E10: .4byte sub_80832E0
_08082E14: .4byte gUnknown_03005B6C
_08082E18: .4byte IWRAM_START + 0x21
_08082E1C: .4byte IWRAM_START + 0x22
_08082E20: .4byte IWRAM_START + 0x25
_08082E24: .4byte gGameMode
_08082E28: .4byte 0x000002D9
_08082E2C: .4byte IWRAM_START + 0x20
_08082E30: .4byte IWRAM_START + 0x34
_08082E34: .4byte IWRAM_START + 0x52
_08082E38: .4byte IWRAM_START + 0x30
_08082E3C: .4byte 0x0000045F
_08082E40:
	lsls r1, r5, #6
	mov r2, sl
	ldr r0, [r2, #0x34]
	adds r0, r0, r1
_08082E48:
	str r0, [r4]
	adds r0, r6, #0
	bl sub_8004558
	adds r4, #0x30
	movs r0, #0x30
	add r8, r0
	adds r6, #0x30
	adds r5, #1
	cmp r5, #0xa
	bls _08082DD2
	movs r5, #0
	ldr r3, _08082E90 @ =gFlags
	ldr r0, _08082E94 @ =gObjPalette
	ldr r2, _08082E98 @ =gUnknown_080E0270
	adds r1, r0, #0
	adds r1, #0xe0
_08082E6A:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xf
	bls _08082E6A
	ldr r0, [r3]
	movs r1, #2
	orrs r0, r1
	str r0, [r3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082E90: .4byte gFlags
_08082E94: .4byte gObjPalette
_08082E98: .4byte gUnknown_080E0270

	thumb_func_start sub_8082E9C
sub_8082E9C: @ 0x08082E9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _0808302C @ =gUnknown_03005490
	ldr r0, [r1]
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	ldr r0, _0808302C @ =gUnknown_03005490
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08083030 @ =gUnknown_080E0234
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	lsls r6, r0, #0x10
	lsrs r1, r6, #0x10
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	bl Div
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r5, r5, r1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	mov sl, r0
	ldr r0, _0808302C @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _08083034 @ =0x00000E0F
	cmp r1, r0
	bhi _08082F32
	ldr r0, _08083038 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sl, r0
_08082F32:
	movs r2, #8
	movs r5, #0x26
	movs r4, #0xf
	adds r1, r4, #0
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	movs r1, #0
	mov sb, r1
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x10
	movs r1, #0x84
	lsls r1, r1, #2
	mov r8, r1
	adds r3, r7, r1
	strh r0, [r3, #0x16]
	strh r5, [r3, #0x18]
	ldr r0, _0808303C @ =0x00000235
	adds r0, r7, r0
	str r0, [sp, #8]
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x18
	lsrs r1, r6, #0x14
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x20
	adds r1, r4, #0
	ldr r0, [sp, #4]
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x28
	mov r1, r8
	adds r3, r7, r1
	strh r0, [r3, #0x16]
	strh r5, [r3, #0x18]
	mov r1, sb
	ldr r0, [sp, #8]
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x30
	ldr r0, [sp]
	lsrs r1, r0, #4
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r1, #0x38
	ldr r0, [sp]
	ands r4, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r1, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808302C: .4byte gUnknown_03005490
_08083030: .4byte gUnknown_080E0234
_08083034: .4byte 0x00000E0F
_08083038: .4byte gUnknown_03005590
_0808303C: .4byte 0x00000235

	thumb_func_start sub_8083040
sub_8083040: @ 0x08083040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r2, #0
	ldr r0, _080830F8 @ =gUnknown_030055B8
	ldrb r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080830E6
	mov sl, r2
_0808305E:
	mov r4, sb
	movs r0, #0x1a
	muls r0, r2, r0
	strh r0, [r4, #0x16]
	mov r0, sl
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_80051E8
	ldr r0, _080830FC @ =gUnknown_030053E8
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_8004518
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x16]
	adds r0, #0x17
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r4, #0x18]
	adds r0, #0x13
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r2, [sp]
	adds r2, #1
	mov r8, r2
_0808309E:
	movs r0, #0xf
	ands r0, r5
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x30
	mov r0, sb
	adds r4, r0, r1
	strh r7, [r4, #0x16]
	strh r6, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80051E8
	lsls r0, r7, #0x10
	ldr r1, _08083100 @ =0xFFF80000
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	lsrs r5, r5, #4
	cmp r5, #0
	bne _0808309E
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #3
	bhi _080830E6
	ldr r0, _080830F8 @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0808305E
_080830E6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080830F8: .4byte gUnknown_030055B8
_080830FC: .4byte gUnknown_030053E8
_08083100: .4byte 0xFFF80000

	thumb_func_start sub_8083104
sub_8083104: @ 0x08083104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r5, _08083280 @ =gUnknown_03005B6C
	ldr r0, [r5]
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08083284 @ =gUnknown_080E0234
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	bl Div
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r5, r5, r1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	adds r0, r1, #0
	bl sub_8004518
	movs r2, #8
	movs r6, #0x36
	movs r5, #0xf
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	movs r2, #1
	mov sb, r2
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x10
	movs r7, #0x84
	lsls r7, r7, #2
	mov r2, r8
	adds r3, r2, r7
	strh r0, [r3, #0x16]
	strh r6, [r3, #0x18]
	ldr r0, _08083288 @ =0x00000235
	add r0, r8
	mov sl, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r1, #0x18
	lsrs r4, r4, #0x14
	ands r4, r5
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x30
	mov r2, r8
	adds r3, r2, r0
	strh r1, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x20
	adds r1, r5, #0
	ldr r0, [sp, #4]
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r0, #0x28
	mov r1, r8
	adds r3, r1, r7
	strh r0, [r3, #0x16]
	strh r6, [r3, #0x18]
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	adds r0, r3, #0
	bl sub_80051E8
	movs r2, #0x30
	ldr r0, [sp]
	lsrs r1, r0, #4
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	movs r1, #0x38
	ldr r0, [sp]
	ands r5, r0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x30
	mov r2, r8
	adds r3, r2, r0
	strh r1, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_80051E8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083280: .4byte gUnknown_03005B6C
_08083284: .4byte gUnknown_080E0234
_08083288: .4byte 0x00000235

	thumb_func_start sub_808328C
sub_808328C: @ 0x0808328C
	push {r4, lr}
	ldr r0, _080832D4 @ =gUnknown_03005424
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _080832CC
	ldr r0, _080832D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080832C6
	adds r0, r4, #0
	bl sub_8082E9C
	ldr r0, _080832DC @ =gUnknown_03005B6C
	ldr r0, [r0]
	cmp r0, #0
	beq _080832C6
	adds r0, r4, #0
	bl sub_8083104
_080832C6:
	adds r0, r4, #0
	bl sub_8083040
_080832CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080832D4: .4byte gUnknown_03005424
_080832D8: .4byte gCurTask
_080832DC: .4byte gUnknown_03005B6C

	thumb_func_start sub_80832E0
sub_80832E0: @ 0x080832E0
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl sub_8007CF0
	ldr r0, [r4, #0x34]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80832FC
sub_80832FC: @ 0x080832FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r6, [sp, #0x54]
	ldr r0, [sp, #0x58]
	mov sb, r0
	mov r1, sb
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	str r6, [sp, #8]
	asrs r2, r6, #0x1f
	str r2, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r1, #0
	adds r2, r0, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x14]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	str r3, [sp, #0x10]
	movs r4, #1
	mov r0, sb
	lsls r4, r0
	subs r4, r4, r6
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	str r0, [sp, #0x2c]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	mov r2, sl
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r2, r0, #0x1f
	mov r8, r2
	lsls r6, r1, #1
	mov r3, r8
	orrs r3, r6
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	mov r2, sb
	bl __ashrdi3
	ldr r2, [sp]
	asrs r3, r2, #0x1f
	bl __muldi3
	lsrs r5, r0, #0x1f
	lsls r4, r1, #1
	adds r3, r5, #0
	orrs r3, r4
	lsls r2, r0, #1
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	adds r0, r0, r2
	adcs r1, r3
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	asrs r1, r2, #0x1f
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	ldr r3, [sp, #0x24]
	ldr r4, [sp, #0x28]
	adds r3, r3, r0
	adcs r4, r1
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	adds r1, r4, #0
	adds r0, r3, #0
	mov r2, sb
	bl __ashrdi3
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_808343C
sub_808343C: @ 0x0808343C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r8, r0
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r4, [sp, #0x28]
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r6, r2, #0
	adds r0, r2, #0
	asrs r1, r6, #0x1f
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldi3
	mov r2, r8
	bl __ashrdi3
	adds r7, r0, #0
	mov r4, sb
	asrs r5, r4, #0x1f
	subs r2, r7, r6
	lsls r2, r2, #1
	subs r2, r2, r6
	movs r0, #1
	mov r3, r8
	lsls r0, r3
	adds r2, r2, r0
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, sl
	asrs r1, r0, #0x1f
	subs r2, r7, r6
	mov sb, r2
	subs r2, r2, r6
	ldr r3, [sp, #0x28]
	adds r2, r2, r3
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp, #4]
	asrs r1, r0, #0x1f
	lsls r2, r6, #1
	adds r2, r2, r6
	subs r2, r2, r7
	subs r2, r2, r7
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	ldr r0, [sp]
	asrs r1, r0, #0x1f
	mov r2, sb
	asrs r3, r2, #0x1f
	bl __muldi3
	adds r4, r4, r0
	adcs r5, r1
	adds r1, r5, #0
	adds r0, r4, #0
	mov r2, r8
	bl __ashrdi3
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8083504
sub_8083504: @ 0x08083504
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0808352E
	ldr r0, [r6, #8]
	muls r0, r1, r0
	asrs r3, r0, #0xa
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r7, #2]
	b _08083530
_0808352E:
	ldr r3, [r6, #8]
_08083530:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _0808354E
	ldr r0, [r6, #0xc]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #4
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r7, #4]
	b _08083550
_0808354E:
	ldr r4, [r6, #0xc]
_08083550:
	ldrh r0, [r5]
	cmp r0, #0
	beq _080835B8
	ldr r0, _080835B4 @ =gSineTable
	mov ip, r0
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r3, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r5, #8]
	adds r0, r0, r2
	str r0, [r7, #8]
	ldrh r1, [r5]
	lsls r0, r1, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r3, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	b _080835C2
	.align 2, 0
_080835B4: .4byte gSineTable
_080835B8:
	ldr r0, [r5, #8]
	adds r0, r0, r3
	str r0, [r7, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r4
_080835C2:
	str r0, [r7, #0xc]
	ldrh r0, [r5]
	ldrh r6, [r6]
	adds r0, r0, r6
	ldr r2, _080835DC @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080835DC: .4byte 0x000003FF

	thumb_func_start sub_80835E0
sub_80835E0: @ 0x080835E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083608
	ldr r0, [r5, #8]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	b _0808360A
_08083608:
	ldr r4, [r5, #8]
_0808360A:
	movs r0, #4
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083628
	ldr r0, [r5, #0xc]
	muls r0, r1, r0
	asrs r7, r0, #0xa
	movs r2, #4
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	b _0808362A
_08083628:
	ldr r7, [r5, #0xc]
_0808362A:
	ldrh r0, [r6]
	mov ip, r0
	mov r0, ip
	cmp r0, #0
	beq _08083694
	ldr r3, _08083690 @ =gSineTable
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r6, #8]
	adds r0, r0, r2
	str r0, [r5, #8]
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r6, #0xc]
	adds r0, r0, r2
	b _0808369E
	.align 2, 0
_08083690: .4byte gSineTable
_08083694:
	ldr r0, [r6, #8]
	adds r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r6, #0xc]
	adds r0, r0, r7
_0808369E:
	str r0, [r5, #0xc]
	ldrh r0, [r5]
	add r0, ip
	ldr r2, _080836B8 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080836B8: .4byte 0x000003FF

	thumb_func_start sub_80836BC
sub_80836BC: @ 0x080836BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _080836E4
	ldr r0, [r6, #8]
	muls r0, r1, r0
	asrs r4, r0, #0xa
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	b _080836E6
_080836E4:
	ldr r4, [r6, #8]
_080836E6:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	beq _08083704
	ldr r0, [r6, #0xc]
	muls r0, r1, r0
	asrs r7, r0, #0xa
	movs r2, #4
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	b _08083706
_08083704:
	ldr r7, [r6, #0xc]
_08083706:
	ldrh r0, [r5]
	mov ip, r0
	mov r0, ip
	cmp r0, #0
	beq _08083770
	ldr r3, _0808376C @ =gSineTable
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	ldr r0, [r5, #8]
	adds r0, r0, r2
	str r0, [r5, #8]
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	b _0808377A
	.align 2, 0
_0808376C: .4byte gSineTable
_08083770:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r7
_0808377A:
	str r0, [r5, #0xc]
	ldrh r0, [r6]
	add r0, ip
	ldr r2, _08083794 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083794: .4byte 0x000003FF

	thumb_func_start sub_8083798
sub_8083798: @ 0x08083798
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #2
	ldrsh r0, [r7, r1]
	movs r4, #0x80
	lsls r4, r4, #3
	cmp r0, r4
	beq _080837C2
	movs r0, #0x80
	lsls r0, r0, #0xd
	movs r2, #2
	ldrsh r1, [r7, r2]
	bl Div
	strh r0, [r7, #2]
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #8]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	str r0, [r7, #8]
_080837C2:
	movs r1, #4
	ldrsh r0, [r7, r1]
	cmp r0, r4
	beq _080837E4
	movs r0, #0x80
	lsls r0, r0, #0xd
	movs r2, #4
	ldrsh r1, [r7, r2]
	bl Div
	strh r0, [r7, #4]
	movs r0, #4
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #0xc]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	str r0, [r7, #0xc]
_080837E4:
	ldrh r0, [r7]
	subs r0, r4, r0
	ldr r2, _0808383C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r7]
	cmp r0, #0
	beq _08083844
	ldr r5, [r7, #8]
	rsbs r5, r5, #0
	ldr r6, _08083840 @ =gSineTable
	ldrh r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r3, [r0]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	adds r4, r5, #0
	muls r4, r3, r4
	asrs r4, r4, #8
	ldr r2, [r7, #0xc]
	rsbs r2, r2, #0
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r0, r2, #0
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r4, r4, r0
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r2, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r7, #0xc]
	str r4, [r7, #8]
	b _08083850
	.align 2, 0
_0808383C: .4byte 0x000003FF
_08083840: .4byte gSineTable
_08083844:
	ldr r0, [r7, #8]
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	rsbs r0, r0, #0
	str r0, [r7, #0xc]
_08083850:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083858
sub_8083858: @ 0x08083858
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #4]
	movs r2, #6
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80838CC
sub_80838CC: @ 0x080838CC
	push {r4, r5, r6, lr}
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #0
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #2
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #4
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #2]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #4
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #4
	ldrsh r5, [r0, r4]
	movs r6, #6
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	adds r3, r3, r4
	asrs r3, r3, #0xa
	strh r3, [r2, #4]
	movs r3, #6
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	movs r6, #0
	ldrsh r5, [r0, r6]
	movs r6, #0
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r6, #2
	ldrsh r4, [r1, r6]
	muls r4, r5, r4
	subs r3, r3, r4
	movs r5, #4
	ldrsh r4, [r0, r5]
	movs r6, #4
	ldrsh r0, [r1, r6]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xa
	strh r3, [r2, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_808399C
sub_808399C: @ 0x0808399C
	push {r4, r5, r6, r7, lr}
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #0
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r6, [r0, r7]
	movs r4, #6
	ldrsh r3, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r5, [r0, r7]
	movs r4, #4
	ldrsh r3, [r1, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #2
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #4
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #2]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #4
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #2
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r0, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r7, #6
	ldrsh r2, [r1, r7]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r1, r7]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r6, #2
	ldrsh r3, [r1, r6]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r7, #4
	ldrsh r1, [r1, r7]
	muls r1, r4, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	strh r2, [r0, #6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8083A48
sub_8083A48: @ 0x08083A48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r3, #6
	ldrsh r2, [r0, r3]
	movs r5, #0
	ldrsh r4, [r1, r5]
	mov r8, r4
	mov r7, r8
	muls r7, r2, r7
	adds r2, r7, #0
	movs r3, #0
	ldrsh r4, [r0, r3]
	movs r5, #6
	ldrsh r3, [r1, r5]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	movs r4, #4
	ldrsh r6, [r1, r4]
	muls r3, r6, r3
	adds r2, r2, r3
	movs r5, #4
	ldrsh r3, [r0, r5]
	movs r7, #2
	ldrsh r5, [r1, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r5, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r6, r3
	subs r2, r2, r3
	movs r7, #2
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	movs r4, #4
	ldrsh r3, [r0, r4]
	mov r7, r8
	muls r7, r3, r7
	adds r3, r7, #0
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #2]
	movs r3, #6
	ldrsh r2, [r0, r3]
	muls r2, r6, r2
	movs r4, #0
	ldrsh r3, [r0, r4]
	muls r3, r5, r3
	adds r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #4
	ldrsh r4, [r0, r7]
	movs r7, #6
	ldrsh r3, [r1, r7]
	muls r3, r4, r3
	adds r2, r2, r3
	asrs r2, r2, #0xa
	strh r2, [r1, #4]
	movs r2, #6
	ldrsh r3, [r0, r2]
	movs r4, #6
	ldrsh r2, [r1, r4]
	muls r2, r3, r2
	movs r7, #0
	ldrsh r3, [r0, r7]
	mov r4, r8
	muls r4, r3, r4
	adds r3, r4, #0
	subs r2, r2, r3
	movs r7, #2
	ldrsh r3, [r0, r7]
	muls r3, r5, r3
	subs r2, r2, r3
	movs r3, #4
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	subs r2, r2, r0
	asrs r2, r2, #0xa
	strh r2, [r1, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8083B10
sub_8083B10: @ 0x08083B10
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4]
	movs r2, #2
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #4]
	movs r2, #6
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #6]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8083B88
sub_8083B88: @ 0x08083B88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r6, r2]
	muls r0, r1, r0
	movs r3, #4
	ldrsh r2, [r5, r3]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #2]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #4]
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #4
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #6
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #6]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #8]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #8
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0xa
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0xc
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xc]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #8
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0xe
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0xe]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #4
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #0xa
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0x10
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x10]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	movs r3, #6
	ldrsh r0, [r6, r3]
	muls r0, r1, r0
	movs r1, #0x10
	ldrsh r2, [r5, r1]
	movs r3, #0xc
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0x12
	ldrsh r2, [r5, r1]
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x12]
	ldr r2, [r5, #0x14]
	mov sl, r2
	mov r3, sl
	asrs r3, r3, #0x1f
	str r3, [sp]
	mov r0, sl
	adds r1, r3, #0
	movs r2, #2
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r3, [r5, #0x18]
	mov sb, r3
	mov r0, sb
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r2, #8
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r5, [r5, #0x1c]
	asrs r7, r5, #0x1f
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0xe
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x14]
	mov r0, sl
	ldr r1, [sp]
	movs r2, #4
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r3, #0xa
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0x10
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x18]
	mov r0, sl
	ldr r1, [sp]
	movs r2, #6
	ldrsh r4, [r6, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	mov r0, sb
	ldr r1, [sp, #0xc]
	movs r3, #0xc
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0x12
	ldrsh r4, [r6, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r6, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x1c]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8083E44
sub_8083E44: @ 0x08083E44
	push {r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r1, #4
	ldrsh r4, [r6, r1]
	movs r3, #6
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #6]
	movs r0, #8
	ldrsh r2, [r6, r0]
	movs r1, #0xa
	ldrsh r4, [r6, r1]
	movs r3, #0xc
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #8]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xa]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xc]
	movs r0, #0xe
	ldrsh r2, [r6, r0]
	movs r1, #0x10
	ldrsh r4, [r6, r1]
	movs r3, #0x12
	ldrsh r7, [r6, r3]
	movs r1, #2
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0xe]
	movs r1, #4
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x10
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0x10]
	movs r1, #6
	ldrsh r0, [r5, r1]
	muls r0, r2, r0
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	muls r1, r4, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r5, r3]
	muls r1, r7, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #0x12]
	ldr r2, [r6, #0x14]
	ldr r4, [r6, #0x18]
	ldr r7, [r6, #0x1c]
	str r2, [sp]
	asrs r2, r2, #0x1f
	str r2, [sp, #4]
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	asrs r4, r4, #0x1f
	str r4, [sp, #0x14]
	movs r2, #8
	ldrsh r0, [r5, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r7, [sp, #0x18]
	asrs r7, r7, #0x1f
	str r7, [sp, #0x1c]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r6, #0x14]
	movs r3, #4
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x20]
	str r3, [sp, #0x24]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r6, #0x18]
	movs r3, #6
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl __muldi3
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x28]
	str r3, [sp, #0x2c]
	movs r3, #0x12
	ldrsh r0, [r5, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r6, #0x1c]
	add sp, #0x30
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8084090
sub_8084090: @ 0x08084090
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [r6, #0x14]
	asrs r0, r0, #0x1f
	mov sb, r0
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r2, #2
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, [r6, #0x18]
	asrs r3, r3, #0x1f
	mov sl, r3
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r7, #8
	ldrsh r4, [r5, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp]
	ldr r3, [sp, #4]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r3, [r6, #0x1c]
	mov r8, r3
	asrs r7, r3, #0x1f
	mov r0, r8
	adds r1, r7, #0
	movs r2, #0xe
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp]
	ldr r3, [sp, #4]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x14]
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r3, #4
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r2, #0xa
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0x10
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x18]
	ldr r0, [r6, #0x14]
	mov r1, sb
	movs r3, #6
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r6, #0x18]
	mov r1, sl
	movs r2, #0xc
	ldrsh r4, [r5, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0x12
	ldrsh r4, [r5, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	ldr r4, [r5, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	str r0, [r5, #0x1c]
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r7, #8
	ldrsh r3, [r5, r7]
	movs r0, #0xe
	ldrsh r4, [r5, r0]
	movs r1, #2
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #2]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #8]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xe]
	movs r7, #4
	ldrsh r2, [r5, r7]
	movs r0, #0xa
	ldrsh r3, [r5, r0]
	movs r1, #0x10
	ldrsh r4, [r5, r1]
	movs r7, #2
	ldrsh r0, [r6, r7]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #4]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xa]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0x10]
	movs r7, #6
	ldrsh r2, [r5, r7]
	movs r0, #0xc
	ldrsh r3, [r5, r0]
	movs r1, #0x12
	ldrsh r4, [r5, r1]
	movs r7, #2
	ldrsh r0, [r6, r7]
	muls r0, r2, r0
	movs r7, #4
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #6
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #6]
	movs r1, #8
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r7, #0xa
	ldrsh r1, [r6, r7]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r7, #0xc
	ldrsh r1, [r6, r7]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0xc]
	movs r1, #0xe
	ldrsh r0, [r6, r1]
	muls r0, r2, r0
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	muls r1, r3, r1
	adds r0, r0, r1
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r5, #0x12]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80842E4
sub_80842E4: @ 0x080842E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r0
	mov r8, r1
	str r2, [sp]
	ldr r7, [r0]
	asrs r0, r7, #0x1f
	str r0, [sp, #4]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sb
	ldr r0, [r0, #4]
	mov sl, r0
	mov r1, sl
	asrs r1, r1, #0x1f
	str r1, [sp, #8]
	mov r2, r8
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r0, [r0, #8]
	mov sb, r0
	mov r1, sb
	asrs r1, r1, #0x1f
	str r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x14]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #4
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r1, [sp, #8]
	mov r2, r8
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x18]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3, #4]
	adds r0, r7, #0
	ldr r1, [sp, #4]
	mov r2, r8
	movs r3, #6
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r1, [sp, #8]
	mov r2, r8
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	ldr r1, [sp, #0xc]
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	mov r2, r8
	ldr r4, [r2, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3, #8]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808442C
sub_808442C: @ 0x0808442C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, r8
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r0, [r0, #4]
	mov sb, r0
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, r8
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r0, [r0, #8]
	asrs r0, r0, #0x1f
	str r0, [sp]
	mov r2, sl
	ldr r0, [r2, #8]
	ldr r1, [sp]
	mov r3, r8
	movs r2, #0xe
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r4, r1, #0
	adds r3, r0, #0
	adds r3, r3, r5
	adcs r4, r6
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r3, r3, r0
	adcs r4, r1
	lsls r1, r4, #0x16
	lsrs r0, r3, #0xa
	orrs r1, r0
	str r1, [sp, #4]
	asrs r3, r4, #0xa
	str r3, [sp, #8]
	mov r2, sl
	str r1, [r2]
	ldr r3, [sp, #4]
	asrs r6, r3, #0x1f
	adds r0, r3, #0
	adds r1, r6, #0
	mov r2, r8
	movs r3, #4
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r3, sl
	ldr r0, [r3, #8]
	ldr r1, [sp]
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	adds r4, r4, r0
	adcs r5, r1
	mov r1, r8
	ldr r2, [r1, #0x18]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r4, r4, r0
	adcs r5, r1
	lsls r1, r5, #0x16
	lsrs r0, r4, #0xa
	adds r4, r1, #0
	orrs r4, r0
	mov r2, sl
	str r4, [r2, #4]
	ldr r0, [sp, #4]
	adds r1, r6, #0
	mov r3, r8
	movs r2, #6
	ldrsh r6, [r3, r2]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r4, #0
	asrs r1, r4, #0x1f
	mov r3, r8
	movs r2, #0xc
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r6, r0
	adcs r7, r1
	mov r3, sl
	ldr r0, [r3, #8]
	ldr r1, [sp]
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r6
	adcs r1, r7
	mov r2, r8
	ldr r4, [r2, #0x1c]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sl
	str r0, [r3, #8]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808458C
sub_808458C: @ 0x0808458C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	ldr r0, [r1]
	str r0, [sp, #4]
	asrs r0, r0, #0x1f
	str r0, [sp, #8]
	mov r1, sb
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r2, sl
	ldr r0, [r2, #4]
	str r0, [sp, #0xc]
	asrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	mov r3, sb
	ldr r0, [r3, #0x18]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r6, r6, r0
	adcs r7, r1
	mov r1, sl
	ldr r0, [r1, #8]
	adds r4, r0, #0
	asrs r5, r0, #0x1f
	mov r2, sb
	ldr r0, [r2, #0x1c]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r2, r2, r6
	adcs r3, r7
	ldr r1, _08084778 @ =0x00000000
	ldr r0, _08084774 @ =0x00100000
	adds r2, r2, r0
	adcs r3, r1
	lsls r6, r3, #0x16
	mov r8, r6
	lsrs r6, r2, #0xa
	mov r2, r8
	orrs r2, r6
	asrs r3, r3, #0xa
	bl __divdi3
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r6, [sp, #0x14]
	mov r1, sb
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	mov r3, sb
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x1c]
	str r3, [sp, #0x20]
	mov r3, sb
	movs r1, #6
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r3, [sp, #0x14]
	str r3, [sp, #0x24]
	asrs r6, r6, #0x1f
	str r6, [sp, #0x28]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6]
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #8
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r2, [r0, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r2, [r0, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6, #4]
	mov r0, sl
	ldr r2, [r0]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sl
	ldr r2, [r0, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sl
	ldr r2, [r0, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	mov r2, sb
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r6, [sp]
	str r0, [r6, #8]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084774: .4byte 0x00100000
_08084778: .4byte 0x00000000

	thumb_func_start sub_808477C
sub_808477C: @ 0x0808477C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	str r1, [sp]
	ldr r4, [r1]
	ldr r7, [r1, #4]
	ldr r0, [r0, #0x14]
	adds r1, r4, #0
	muls r1, r0, r1
	mov r2, r8
	ldr r0, [r2, #0x18]
	muls r0, r7, r0
	adds r1, r1, r0
	ldr r3, [sp]
	ldr r3, [r3, #8]
	mov sb, r3
	ldr r0, [r2, #0x1c]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r1, r1, r0
	asrs r1, r1, #0xa
	bl __divsi3
	mov sl, r0
	str r4, [sp, #4]
	asrs r4, r4, #0x1f
	str r4, [sp, #8]
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	str r7, [sp, #0xc]
	asrs r7, r7, #0x1f
	str r7, [sp, #0x10]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, r8
	movs r3, #6
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	mov r2, sl
	str r2, [sp, #0x14]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp]
	str r0, [r3]
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, r8
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r2, [sp]
	str r0, [r2, #4]
	mov r3, r8
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r2, r8
	movs r3, #0x10
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	adds r1, r7, #0
	mov r2, r8
	movs r3, #0x12
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	asrs r1, r1, #0xa
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl __muldi3
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	ldr r2, [sp]
	str r0, [r2, #8]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8084904
sub_8084904: @ 0x08084904
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084960 @ =gSineTable
	movs r3, #0
_08084914:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084914
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #0x10]
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084960: .4byte gSineTable

	thumb_func_start sub_8084964
sub_8084964: @ 0x08084964
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r3, #0
	movs r0, #0
	ldr r5, _080849C0 @ =gSineTable
	movs r2, #0
_08084974:
	stm r1!, {r2}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084974
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r3, #2]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r3, #6]
	strh r2, [r3, #0xe]
	strh r0, [r3, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080849C0: .4byte gSineTable

	thumb_func_start sub_80849C4
sub_80849C4: @ 0x080849C4
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r2, #0
	movs r0, #0
	ldr r5, _08084A20 @ =gSineTable
	movs r3, #0
_080849D4:
	stm r1!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _080849D4
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x12]
	strh r0, [r1, #0xa]
	strh r0, [r1, #2]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r4, r3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084A20: .4byte gSineTable

	thumb_func_start sub_8084A24
sub_8084A24: @ 0x08084A24
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r7, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r2, ip
	movs r0, #0
	ldr r4, _08084B50 @ =gSineTable
	movs r3, #0
_08084A3A:
	stm r2!, {r3}
	adds r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08084A3A
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
	mov r3, r8
	strh r3, [r2, #0x12]
	strh r3, [r2, #0xa]
	strh r3, [r2, #2]
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r5, r5, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r6, [r0]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x14
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #2
	ldrsh r4, [r7, r1]
	adds r0, r3, #0
	muls r0, r4, r0
	asrs r0, r0, #0xa
	mov r2, r8
	subs r2, r2, r6
	mov r8, r2
	mov r1, r8
	muls r1, r0, r1
	lsls r1, r1, #6
	movs r0, #4
	ldrsh r2, [r7, r0]
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r4, r8
	muls r4, r0, r4
	lsls r4, r4, #6
	adds r0, r3, #0
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	lsls r2, r2, #6
	adds r0, r3, #0
	muls r0, r3, r0
	asrs r0, r0, #0xa
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #2]
	movs r3, #4
	ldrsh r0, [r7, r3]
	asrs r5, r5, #0x14
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r1, r1, #0x10
	adds r0, r1, r0
	mov r3, ip
	strh r0, [r3, #4]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r2, r2, #0x10
	subs r0, r2, r0
	mov r3, ip
	strh r0, [r3, #6]
	movs r3, #4
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r1, r1, r0
	mov r0, ip
	strh r1, [r0, #8]
	movs r1, #2
	ldrsh r0, [r7, r1]
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xa
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	adds r0, r6, r0
	mov r3, ip
	strh r0, [r3, #0xa]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	asrs r4, r4, #0x10
	adds r0, r4, r0
	strh r0, [r3, #0xc]
	movs r3, #2
	ldrsh r0, [r7, r3]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	adds r2, r2, r0
	mov r0, ip
	strh r2, [r0, #0xe]
	movs r1, #0
	ldrsh r0, [r7, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r4, r4, r0
	mov r2, ip
	strh r4, [r2, #0x10]
	movs r3, #4
	ldrsh r0, [r7, r3]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xa
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xa
	adds r6, r6, r0
	mov r3, ip
	strh r6, [r3, #0x12]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B50: .4byte gSineTable

	thumb_func_start sub_8084B54
sub_8084B54: @ 0x08084B54
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r6, _08084C6C @ =gSineTable
	lsls r4, r2, #1
	adds r4, r4, r6
	ldrh r4, [r4]
	mov sl, r4
	mov r4, sl
	lsls r4, r4, #0x10
	mov sl, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov ip, r2
	mov r2, ip
	lsls r2, r2, #0x10
	mov ip, r2
	lsls r2, r1, #1
	adds r2, r2, r6
	ldrh r2, [r2]
	mov r8, r2
	mov r2, r8
	lsls r2, r2, #0x10
	mov r8, r2
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	mov sb, r1
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	lsls r1, r3, #1
	adds r1, r1, r6
	ldrh r5, [r1]
	lsls r5, r5, #0x10
	adds r3, r3, r4
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r4, [r3]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x14
	mov r2, sb
	asrs r2, r2, #0x14
	mov sb, r2
	mov r2, sb
	muls r2, r4, r2
	asrs r2, r2, #0xa
	asrs r5, r5, #0x14
	mov r1, sl
	asrs r1, r1, #0x14
	mov sl, r1
	mov r3, sl
	muls r3, r5, r3
	asrs r3, r3, #0xa
	mov r1, r8
	asrs r1, r1, #0x14
	mov r8, r1
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	movs r6, #0
	strh r2, [r0, #2]
	mov r2, ip
	asrs r2, r2, #0x14
	mov ip, r2
	mov r1, ip
	muls r1, r5, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #4]
	rsbs r1, r4, #0
	mov r2, r8
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #6]
	rsbs r1, r5, #0
	mov r2, sb
	muls r2, r1, r2
	asrs r2, r2, #0xa
	mov r3, sl
	muls r3, r4, r3
	asrs r3, r3, #0xa
	mov r1, r8
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #8]
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xa]
	mov r2, r8
	muls r2, r5, r2
	asrs r2, r2, #0xa
	mov r1, sb
	muls r1, r3, r1
	asrs r1, r1, #0xa
	adds r2, r2, r1
	strh r2, [r0, #0xc]
	mov r4, r8
	mov r1, ip
	muls r1, r4, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0xe]
	mov r1, sl
	rsbs r1, r1, #0
	strh r1, [r0, #0x10]
	mov r2, sb
	mov r1, ip
	muls r1, r2, r1
	asrs r1, r1, #0xa
	strh r1, [r0, #0x12]
	str r6, [r0, #0x1c]
	str r6, [r0, #0x18]
	str r6, [r0, #0x14]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084C6C: .4byte gSineTable

	thumb_func_start sub_8084C70
sub_8084C70: @ 0x08084C70
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r3, #0
	ldr r3, [r1]
	str r3, [r5, #0x14]
	ldr r4, [r1, #4]
	str r4, [r5, #0x18]
	ldr r1, [r1, #8]
	str r1, [r5, #0x1c]
	adds r6, r5, #0
	adds r6, #0xe
	ldr r0, [r2]
	subs r0, r0, r3
	movs r3, #0
	strh r0, [r5, #0xe]
	ldr r0, [r2, #4]
	subs r0, r0, r4
	strh r0, [r6, #2]
	ldr r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0x12
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084CB0
	rsbs r0, r0, #0
_08084CB0:
	cmp r0, #0x20
	ble _08084D02
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #0xe
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #0xe]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084D0C
_08084D02:
	strh r3, [r5, #0xe]
	strh r3, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0x12]
_08084D0C:
	adds r3, r5, #0
	adds r3, #0xe
	adds r4, r5, #2
	movs r6, #2
	ldrsh r1, [r7, r6]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r1, r0, r1
	movs r6, #4
	ldrsh r2, [r7, r6]
	movs r6, #2
	ldrsh r0, [r3, r6]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r0, #0
	mov ip, r0
	strh r1, [r5, #2]
	movs r2, #4
	ldrsh r1, [r7, r2]
	movs r6, #0xe
	ldrsh r0, [r5, r6]
	muls r0, r1, r0
	movs r1, #0
	ldrsh r2, [r7, r1]
	movs r6, #4
	ldrsh r1, [r3, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	movs r6, #2
	ldrsh r2, [r7, r6]
	movs r6, #0xe
	ldrsh r1, [r5, r6]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r1, #4
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r6, #6
	ldrsh r1, [r5, r6]
	adds r0, r0, r1
	adds r7, r3, #0
	cmp r0, #0
	bge _08084D7C
	rsbs r0, r0, #0
_08084D7C:
	cmp r0, #0x20
	ble _08084DCE
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r6, #4
	ldrsh r1, [r4, r6]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #2
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #2]
	movs r6, #2
	ldrsh r1, [r4, r6]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r4, #2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #4]
	b _08084DDA
_08084DCE:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #2]
	mov r3, ip
	strh r3, [r5, #4]
	strh r3, [r5, #6]
_08084DDA:
	adds r6, r5, #0
	adds r6, #8
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r2, #4
	ldrsh r0, [r4, r2]
	muls r1, r0, r1
	movs r3, #4
	ldrsh r2, [r7, r3]
	movs r3, #2
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	subs r1, r1, r0
	asrs r1, r1, #0xa
	movs r3, #0
	strh r1, [r5, #8]
	movs r0, #4
	ldrsh r1, [r7, r0]
	movs r2, #2
	ldrsh r0, [r5, r2]
	muls r0, r1, r0
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	mov ip, r1
	movs r2, #4
	ldrsh r1, [r4, r2]
	mov r2, ip
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #2]
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	movs r4, #2
	ldrsh r2, [r7, r4]
	movs r4, #2
	ldrsh r1, [r5, r4]
	muls r1, r2, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	movs r0, #8
	ldrsh r2, [r5, r0]
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	movs r4, #0xc
	ldrsh r1, [r5, r4]
	adds r0, r0, r1
	cmp r0, #0
	bge _08084E4A
	rsbs r0, r0, #0
_08084E4A:
	cmp r0, #0x20
	ble _08084E9C
	adds r0, r2, #0
	muls r0, r2, r0
	movs r2, #2
	ldrsh r1, [r6, r2]
	adds r3, r1, #0
	muls r3, r1, r3
	adds r1, r3, #0
	adds r0, r0, r1
	movs r4, #4
	ldrsh r1, [r6, r4]
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	movs r3, #8
	ldrsh r1, [r5, r3]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r5, #8]
	movs r4, #2
	ldrsh r1, [r6, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xa
	strh r1, [r6, #2]
	movs r2, #4
	ldrsh r1, [r6, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r6, #4]
	b _08084EA6
_08084E9C:
	strh r3, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r5, #0xa]
	strh r3, [r5, #0xc]
_08084EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8084EAC
sub_8084EAC: @ 0x08084EAC
	ldrh r2, [r0, #4]
	ldrh r3, [r0, #8]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #8]
	eors r2, r1
	strh r2, [r0, #4]
	ldrh r2, [r0, #6]
	ldrh r3, [r0, #0xe]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0xe]
	eors r2, r1
	strh r2, [r0, #6]
	ldrh r2, [r0, #0xc]
	ldrh r3, [r0, #0x10]
	eors r2, r3
	adds r1, r2, #0
	eors r1, r3
	strh r1, [r0, #0x10]
	eors r2, r1
	strh r2, [r0, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start sub_8084EE0
sub_8084EE0: @ 0x08084EE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r1, #2
	ldrsh r4, [r0, r1]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x20]
	movs r5, #0x12
	ldrsh r2, [r0, r5]
	ldr r7, [sp, #0x20]
	adds r0, r7, #0
	muls r0, r2, r0
	mov r1, r8
	movs r5, #0xc
	ldrsh r3, [r1, r5]
	movs r5, #0x10
	ldrsh r7, [r1, r5]
	str r7, [sp, #0x24]
	adds r1, r3, #0
	muls r1, r7, r1
	subs r0, r0, r1
	asrs r0, r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	mov r7, r8
	movs r0, #4
	ldrsh r6, [r7, r0]
	movs r4, #8
	ldrsh r5, [r7, r4]
	adds r0, r5, #0
	muls r0, r2, r0
	movs r2, #0xe
	ldrsh r4, [r7, r2]
	adds r2, r3, #0
	muls r2, r4, r2
	subs r0, r0, r2
	asrs r0, r0, #0xa
	muls r0, r6, r0
	subs r1, r1, r0
	movs r0, #6
	ldrsh r3, [r7, r0]
	ldr r2, [sp, #0x24]
	adds r0, r5, #0
	muls r0, r2, r0
	ldr r5, [sp, #0x20]
	adds r2, r5, #0
	muls r2, r4, r2
	subs r0, r0, r2
	asrs r0, r0, #0xa
	muls r0, r3, r0
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xd
	bl __divsi3
	mov r2, sp
	mov r1, r8
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
	ldm r1!, {r4, r5}
	stm r2!, {r4, r5}
	mov r1, sp
	movs r7, #0xa
	ldrsh r2, [r1, r7]
	movs r3, #0x12
	ldrsh r1, [r1, r3]
	muls r2, r1, r2
	mov r1, sp
	movs r4, #0xc
	ldrsh r3, [r1, r4]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #2]
	rsbs r4, r0, #0
	mov r1, sp
	movs r3, #4
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #4]
	mov r1, sp
	movs r3, #4
	ldrsh r2, [r1, r3]
	movs r5, #0xc
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0xa
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #6]
	mov r1, sp
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #0xc
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #8]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0x12
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xa]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0xc
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #6
	ldrsh r3, [r1, r7]
	movs r5, #8
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xc]
	mov r1, sp
	movs r3, #8
	ldrsh r2, [r1, r3]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #0xa
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0xe]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r5, #0x10
	ldrsh r1, [r1, r5]
	muls r2, r1, r2
	mov r1, sp
	movs r7, #4
	ldrsh r3, [r1, r7]
	movs r5, #0xe
	ldrsh r1, [r1, r5]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	adds r1, r4, #0
	muls r1, r2, r1
	asrs r1, r1, #0xa
	mov r7, r8
	strh r1, [r7, #0x10]
	mov r1, sp
	movs r3, #2
	ldrsh r2, [r1, r3]
	movs r4, #0xa
	ldrsh r1, [r1, r4]
	muls r2, r1, r2
	mov r1, sp
	movs r5, #4
	ldrsh r3, [r1, r5]
	movs r7, #8
	ldrsh r1, [r1, r7]
	muls r1, r3, r1
	subs r2, r2, r1
	asrs r2, r2, #0xa
	muls r0, r2, r0
	asrs r0, r0, #0xa
	mov r1, r8
	strh r0, [r1, #0x12]
	ldr r2, [sp, #0x14]
	asrs r2, r2, #0x1f
	mov sb, r2
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r3, #2
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r4, [sp, #0x18]
	asrs r4, r4, #0x1f
	mov sl, r4
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r7, #8
	ldrsh r4, [r2, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	mov r2, sp
	movs r3, #0xe
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r4, r8
	strh r0, [r4, #0x14]
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r5, #4
	ldrsh r4, [r2, r5]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r3, #0xa
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, sp
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r4, r8
	strh r0, [r4, #0x16]
	ldr r0, [sp, #0x14]
	mov r1, sb
	mov r2, sp
	movs r5, #6
	ldrsh r4, [r2, r5]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, sl
	mov r2, sp
	movs r3, #0xc
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	ldr r0, [sp, #0x1c]
	adds r1, r7, #0
	mov r2, sp
	movs r7, #0x12
	ldrsh r4, [r2, r7]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	adds r1, r6, #0
	adds r0, r5, #0
	bl __negdi2
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	strh r0, [r2, #0x18]
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80851E0
sub_80851E0: @ 0x080851E0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x10
	mov r8, r0
	bl sub_8084EAC
	mov r1, r8
	ldr r0, [r1, #0x14]
	rsbs r0, r0, #0
	str r0, [r1, #0x14]
	ldr r4, [r1, #0x18]
	rsbs r4, r4, #0
	str r4, [r1, #0x18]
	ldr r2, [r1, #0x1c]
	mov sb, r2
	mov r3, sb
	rsbs r3, r3, #0
	mov sb, r3
	str r3, [r1, #0x1c]
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	movs r2, #2
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	str r4, [sp, #8]
	asrs r4, r4, #0x1f
	str r4, [sp, #0xc]
	mov r3, r8
	movs r1, #8
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r2, sb
	asrs r2, r2, #0x1f
	mov sl, r2
	mov r0, sb
	mov r1, sl
	mov r3, r8
	movs r2, #0xe
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x14]
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r2, r8
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	mov r1, sl
	mov r2, r8
	movs r3, #0x10
	ldrsh r4, [r2, r3]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2, #0x18]
	movs r3, #6
	ldrsh r0, [r2, r3]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r1, r8
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	adds r5, r5, r0
	adcs r6, r1
	mov r0, sb
	mov r1, sl
	mov r3, r8
	movs r2, #0x12
	ldrsh r4, [r3, r2]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x16
	lsrs r2, r0, #0xa
	adds r0, r3, #0
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x1c]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8085314
sub_8085314: @ 0x08085314
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r2, #0
	ldrsh r3, [r1, r2]
	lsls r3, r3, #1
	movs r5, #2
	ldrsh r4, [r1, r5]
	lsls r4, r4, #1
	movs r7, #4
	ldrsh r6, [r1, r7]
	lsls r6, r6, #1
	movs r5, #6
	ldrsh r2, [r1, r5]
	adds r5, r3, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	str r5, [sp]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r5, r7, #0
	lsls r5, r5, #6
	mov ip, r5
	adds r7, r6, #0
	muls r7, r2, r7
	adds r2, r7, #0
	lsls r2, r2, #6
	mov sb, r2
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r7, r3, #0
	muls r7, r2, r7
	adds r3, r7, #0
	lsls r3, r3, #6
	mov r8, r3
	adds r3, r4, #0
	muls r3, r2, r3
	lsls r3, r3, #6
	adds r5, r6, #0
	muls r5, r2, r5
	lsls r5, r5, #6
	movs r7, #2
	ldrsh r2, [r1, r7]
	adds r7, r4, #0
	muls r7, r2, r7
	adds r4, r7, #0
	lsls r4, r4, #6
	mov sl, r4
	adds r4, r6, #0
	muls r4, r2, r4
	lsls r4, r4, #6
	movs r7, #4
	ldrsh r1, [r1, r7]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r2, r2, #6
	mov r1, sl
	asrs r1, r1, #0x10
	mov sl, r1
	asrs r2, r2, #0x10
	adds r1, r1, r2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r6, r7, #0
	subs r1, r6, r1
	movs r7, #0
	str r7, [r0, #0x14]
	strh r1, [r0, #2]
	asrs r3, r3, #0x10
	mov r1, sb
	asrs r1, r1, #0x10
	mov sb, r1
	subs r1, r3, r1
	strh r1, [r0, #4]
	asrs r5, r5, #0x10
	mov r7, ip
	asrs r7, r7, #0x10
	adds r1, r5, r7
	strh r1, [r0, #6]
	add r3, sb
	strh r3, [r0, #8]
	mov r1, r8
	asrs r1, r1, #0x10
	mov r8, r1
	add r2, r8
	subs r2, r6, r2
	strh r2, [r0, #0xa]
	asrs r4, r4, #0x10
	ldr r2, [sp]
	asrs r3, r2, #0x10
	subs r1, r4, r3
	strh r1, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	adds r4, r4, r3
	strh r4, [r0, #0x10]
	add r8, sl
	mov r3, r8
	subs r6, r6, r3
	strh r6, [r0, #0x12]
	ldr r4, [r0, #0x14]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80853F8
sub_80853F8: @ 0x080853F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _080854D2
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _080854CC
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r4, #0
	adds r1, #0x54
	ldrh r1, [r1]
	adds r2, r4, #0
	adds r2, #0x56
	ldrh r2, [r2]
	adds r3, r4, #0
	adds r3, #0x58
	ldrh r3, [r3]
	bl sub_8084B54
	adds r2, r4, #0
	adds r2, #0x5c
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r3, #0x36
	ldrsh r0, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x36]
	movs r6, #0
	ldrsh r1, [r2, r6]
	movs r3, #0x38
	ldrsh r0, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x38]
	movs r6, #0
	ldrsh r1, [r2, r6]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x3a]
	adds r2, r4, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r6, #0x3c
	ldrsh r0, [r4, r6]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x3c]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r3, #0x3e
	ldrsh r0, [r4, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r4, #0x3e]
	movs r6, #0
	ldrsh r2, [r2, r6]
	adds r1, r4, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #0xa
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0x60
	movs r6, #0
	ldrsh r1, [r3, r6]
	adds r2, r4, #0
	adds r2, #0x42
	movs r6, #0
	ldrsh r0, [r2, r6]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r2]
	movs r0, #0
	ldrsh r2, [r3, r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r6, #0
	ldrsh r0, [r1, r6]
	muls r0, r2, r0
	asrs r0, r0, #0xa
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r3, r0]
	adds r2, r4, #0
	adds r2, #0x46
	movs r3, #0
	ldrsh r0, [r2, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	strh r0, [r2]
	ldr r0, [r4, #0x64]
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x68]
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x6c]
	str r0, [r4, #0x50]
_080854CC:
	ldr r0, [r4, #0xc]
	orrs r0, r5
	str r0, [r4, #0xc]
_080854D2:
	adds r0, r4, #0
	adds r0, #0x34
	pop {r4, r5, r6}
	pop {r1}
	bx r1
