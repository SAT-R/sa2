.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_805A4F8
sub_805A4F8: @ 0x0805A4F8
	push {r4, r5, r6, lr}
	ldr r5, _0805A574 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _0805A578 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0805A57C @ =gUnknown_03002878
	ldr r0, _0805A580 @ =0x04000042
	str r0, [r1]
	ldr r1, _0805A584 @ =gWinRegs
	movs r6, #0
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _0805A588 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	ldr r1, _0805A58C @ =IWRAM_START + 0x14C
	adds r4, r4, r1
	ldrb r1, [r4]
	movs r2, #0x10
	subs r2, r2, r1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #0x12
	lsrs r1, r1, #0x10
	bl sub_802E164
	ldr r0, _0805A590 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A558
	strb r6, [r4]
	ldr r1, [r5]
	ldr r0, _0805A594 @ =sub_805A598
	str r0, [r1, #8]
_0805A558:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A56C
	strb r6, [r4]
	ldr r1, [r5]
	ldr r0, _0805A594 @ =sub_805A598
	str r0, [r1, #8]
_0805A56C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A574: .4byte gCurTask
_0805A578: .4byte gUnknown_03002A80
_0805A57C: .4byte gUnknown_03002878
_0805A580: .4byte 0x04000042
_0805A584: .4byte gWinRegs
_0805A588: .4byte gFlags
_0805A58C: .4byte IWRAM_START + 0x14C
_0805A590: .4byte gPressedKeys
_0805A594: .4byte sub_805A598

	thumb_func_start sub_805A598
sub_805A598: @ 0x0805A598
	push {r4, r5, r6, lr}
	ldr r2, _0805A620 @ =gCurTask
	ldr r0, [r2]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _0805A624 @ =IWRAM_START + 0x14C
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bne _0805A5C6
	ldr r0, _0805A628 @ =IWRAM_START + 0x14E
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r2]
	ldr r0, _0805A62C @ =sub_805A6C0
	str r0, [r1, #8]
_0805A5C6:
	ldr r0, _0805A630 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A5D6
	movs r0, #0x1f
	strb r0, [r4]
_0805A5D6:
	ldr r1, _0805A634 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0805A638 @ =gUnknown_03002878
	ldr r0, _0805A63C @ =0x04000042
	str r0, [r1]
	ldr r1, _0805A640 @ =gWinRegs
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _0805A644 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xa0
	lsls r1, r1, #1
	bl sub_802E164
	ldr r1, _0805A648 @ =IWRAM_START + 0x80
	adds r2, r5, r1
	ldrb r0, [r4]
	cmp r0, #9
	bhi _0805A64C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, #0x14
	b _0805A64E
	.align 2, 0
_0805A620: .4byte gCurTask
_0805A624: .4byte IWRAM_START + 0x14C
_0805A628: .4byte IWRAM_START + 0x14E
_0805A62C: .4byte sub_805A6C0
_0805A630: .4byte gPressedKeys
_0805A634: .4byte gUnknown_03002A80
_0805A638: .4byte gUnknown_03002878
_0805A63C: .4byte 0x04000042
_0805A640: .4byte gWinRegs
_0805A644: .4byte gFlags
_0805A648: .4byte IWRAM_START + 0x80
_0805A64C:
	movs r0, #0x64
_0805A64E:
	strh r0, [r2, #0x16]
	movs r0, #0xa
	strh r0, [r2, #0x18]
	adds r2, r6, #0
	adds r2, #0xb0
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0805A66C
	ldr r0, _0805A668 @ =0x0000FFB0
	b _0805A67A
	.align 2, 0
_0805A668: .4byte 0x0000FFB0
_0805A66C:
	cmp r0, #0x13
	bhi _0805A678
	ldrb r0, [r1]
	lsls r0, r0, #4
	subs r0, #0xf0
	b _0805A67A
_0805A678:
	movs r0, #0x50
_0805A67A:
	strh r0, [r2, #0x16]
	movs r0, #0x3c
	strh r0, [r2, #0x18]
	adds r2, r6, #0
	adds r2, #0xe0
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0x13
	bhi _0805A698
	ldr r0, _0805A694 @ =0x0000FFA6
	b _0805A6AE
	.align 2, 0
_0805A694: .4byte 0x0000FFA6
_0805A698:
	cmp r0, #0x1d
	bhi _0805A6AC
	ldrb r0, [r1]
	lsls r0, r0, #4
	ldr r1, _0805A6A8 @ =0xFFFFFE66
	adds r0, r0, r1
	b _0805A6AE
	.align 2, 0
_0805A6A8: .4byte 0xFFFFFE66
_0805A6AC:
	movs r0, #0x46
_0805A6AE:
	strh r0, [r2, #0x16]
	movs r0, #0x55
	strh r0, [r2, #0x18]
	adds r0, r6, #0
	bl sub_805AA50
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_805A6C0
sub_805A6C0: @ 0x0805A6C0
	push {r4, r5, r6, lr}
	ldr r6, _0805A70C @ =gCurTask
	ldr r0, [r6]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	ldr r0, _0805A710 @ =gPressedKeys
	ldrh r3, [r0]
	movs r5, #1
	adds r1, r5, #0
	ands r1, r3
	cmp r1, #0
	beq _0805A720
	ldr r0, _0805A714 @ =IWRAM_START + 0x140
	adds r2, r2, r0
	movs r1, #0
	strh r5, [r2]
	strh r1, [r2, #4]
	strh r5, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	ldr r0, _0805A718 @ =0x00003FFF
	strh r0, [r2, #8]
	strh r1, [r2, #0xa]
	movs r0, #0x6a
	bl m4aSongNumStart
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r1, [r6]
	ldr r0, _0805A71C @ =sub_805A878
	b _0805A748
	.align 2, 0
_0805A70C: .4byte gCurTask
_0805A710: .4byte gPressedKeys
_0805A714: .4byte IWRAM_START + 0x140
_0805A718: .4byte 0x00003FFF
_0805A71C: .4byte sub_805A878
_0805A720:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0805A74A
	ldr r0, _0805A7E8 @ =IWRAM_START + 0x140
	adds r2, r2, r0
	strh r5, [r2]
	strh r1, [r2, #4]
	strh r5, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	ldr r0, _0805A7EC @ =0x00003FFF
	strh r0, [r2, #8]
	strh r1, [r2, #0xa]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, [r6]
	ldr r0, _0805A7F0 @ =sub_805A918
_0805A748:
	str r0, [r1, #8]
_0805A74A:
	ldr r1, _0805A7F4 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0805A7F8 @ =gUnknown_03002878
	ldr r0, _0805A7FC @ =0x04000042
	str r0, [r1]
	ldr r1, _0805A800 @ =gWinRegs
	movs r5, #0
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _0805A804 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xa0
	lsls r1, r1, #1
	bl sub_802E164
	ldr r0, _0805A808 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0805A79E
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r1, _0805A80C @ =0x0000014D
	adds r2, r4, r1
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	strb r0, [r2]
_0805A79E:
	ldr r2, _0805A80C @ =0x0000014D
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805A820
	ldr r0, _0805A810 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0xd5
	movs r1, #1
	strb r1, [r2]
	ldr r1, _0805A814 @ =0x00000105
	adds r2, r4, r1
	movs r1, #0xff
	strb r1, [r2]
	adds r1, #0x11
	adds r2, r4, r1
	ldr r1, _0805A818 @ =gUnknown_080D8F70
	adds r0, #3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _0805A81C @ =0x00000131
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	b _0805A858
	.align 2, 0
_0805A7E8: .4byte IWRAM_START + 0x140
_0805A7EC: .4byte 0x00003FFF
_0805A7F0: .4byte sub_805A918
_0805A7F4: .4byte gUnknown_03002A80
_0805A7F8: .4byte gUnknown_03002878
_0805A7FC: .4byte 0x04000042
_0805A800: .4byte gWinRegs
_0805A804: .4byte gFlags
_0805A808: .4byte gPressedKeys
_0805A80C: .4byte 0x0000014D
_0805A810: .4byte gLoadedSaveGame
_0805A814: .4byte 0x00000105
_0805A818: .4byte gUnknown_080D8F70
_0805A81C: .4byte 0x00000131
_0805A820:
	ldr r0, _0805A868 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0xd5
	strb r5, [r1]
	ldr r2, _0805A86C @ =0x00000105
	adds r1, r4, r2
	strb r5, [r1]
	movs r1, #0x88
	lsls r1, r1, #1
	adds r2, r4, r1
	ldr r1, _0805A870 @ =gUnknown_080D8F70
	adds r0, #2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	strh r1, [r2, #0xa]
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	ldr r0, _0805A874 @ =0x00000131
	adds r1, r4, r0
	movs r0, #0xff
_0805A858:
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_805AA50
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A868: .4byte gLoadedSaveGame
_0805A86C: .4byte 0x00000105
_0805A870: .4byte gUnknown_080D8F70
_0805A874: .4byte 0x00000131

	thumb_func_start sub_805A878
sub_805A878: @ 0x0805A878
	push {r4, r5, lr}
	ldr r4, _0805A8B0 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _0805A8B4 @ =IWRAM_START + 0x140
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _0805A8C4
	ldr r2, _0805A8B8 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0805A8BC @ =gUnknown_03001954
	strb r3, [r0]
	ldr r1, [r4]
	ldr r0, _0805A8C0 @ =sub_805A9EC
	str r0, [r1, #8]
	b _0805A8FE
	.align 2, 0
_0805A8B0: .4byte gCurTask
_0805A8B4: .4byte IWRAM_START + 0x140
_0805A8B8: .4byte gFlags
_0805A8BC: .4byte gUnknown_03001954
_0805A8C0: .4byte sub_805A9EC
_0805A8C4:
	ldr r1, _0805A904 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0805A908 @ =gUnknown_03002878
	ldr r0, _0805A90C @ =0x04000042
	str r0, [r1]
	ldr r1, _0805A910 @ =gWinRegs
	movs r0, #0xcc
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x31
	strh r0, [r1, #0xa]
	ldr r2, _0805A914 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xa0
	lsls r1, r1, #1
	bl sub_802E164
	adds r0, r5, #0
	bl sub_805AA50
_0805A8FE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A904: .4byte gUnknown_03002A80
_0805A908: .4byte gUnknown_03002878
_0805A90C: .4byte 0x04000042
_0805A910: .4byte gWinRegs
_0805A914: .4byte gFlags

	thumb_func_start sub_805A918
sub_805A918: @ 0x0805A918
	push {r4, r5, lr}
	ldr r4, _0805A950 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _0805A954 @ =IWRAM_START + 0x140
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805A95C
	ldr r2, _0805A958 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	bl CreateTitleScreenAtPlayModeMenu
	ldr r0, [r4]
	bl TaskDestroy
	b _0805A996
	.align 2, 0
_0805A950: .4byte gCurTask
_0805A954: .4byte IWRAM_START + 0x140
_0805A958: .4byte gFlags
_0805A95C:
	ldr r1, _0805A99C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0805A9A0 @ =gUnknown_03002878
	ldr r0, _0805A9A4 @ =0x04000042
	str r0, [r1]
	ldr r1, _0805A9A8 @ =gWinRegs
	movs r0, #0xcc
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x31
	strh r0, [r1, #0xa]
	ldr r2, _0805A9AC @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xa0
	lsls r1, r1, #1
	bl sub_802E164
	adds r0, r5, #0
	bl sub_805AA50
_0805A996:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A99C: .4byte gUnknown_03002A80
_0805A9A0: .4byte gUnknown_03002878
_0805A9A4: .4byte 0x04000042
_0805A9A8: .4byte gWinRegs
_0805A9AC: .4byte gFlags

	thumb_func_start sub_805A9B0
sub_805A9B0: @ 0x0805A9B0
	push {r4, r5, lr}
	ldr r5, _0805A9DC @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _0805A9E0 @ =IWRAM_START + 0x140
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805A9D6
	ldr r0, _0805A9E4 @ =IWRAM_START + 0x14C
	adds r1, r4, r0
	movs r0, #0xf
	strb r0, [r1]
	ldr r1, [r5]
	ldr r0, _0805A9E8 @ =sub_805A4F8
	str r0, [r1, #8]
_0805A9D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A9DC: .4byte gCurTask
_0805A9E0: .4byte IWRAM_START + 0x140
_0805A9E4: .4byte IWRAM_START + 0x14C
_0805A9E8: .4byte sub_805A4F8

	thumb_func_start sub_805A9EC
sub_805A9EC: @ 0x0805A9EC
	push {r4, lr}
	ldr r0, _0805AA24 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0805AA28 @ =IWRAM_START + 0x14D
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r1, _0805AA2C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805AA30 @ =gUnknown_03002AE4
	ldr r0, _0805AA34 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805AA38 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0805AA3C @ =gUnknown_03004D5C
	ldr r0, _0805AA40 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	cmp r4, #0
	bne _0805AA44
	bl sub_805AAD8
	b _0805AA48
	.align 2, 0
_0805AA24: .4byte gCurTask
_0805AA28: .4byte IWRAM_START + 0x14D
_0805AA2C: .4byte 0x0000FFFF
_0805AA30: .4byte gUnknown_03002AE4
_0805AA34: .4byte gUnknown_0300287C
_0805AA38: .4byte gUnknown_03005390
_0805AA3C: .4byte gUnknown_03004D5C
_0805AA40: .4byte gUnknown_03002A84
_0805AA44:
	bl sub_808129C
_0805AA48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_805AA50
sub_805AA50: @ 0x0805AA50
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x80
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805AA8C
	movs r0, #0x88
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805AA8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_805AA94
sub_805AA94: @ 0x0805AA94
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _0805AAC8 @ =IWRAM_START + 0x84
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _0805AACC @ =IWRAM_START + 0xB4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _0805AAD0 @ =IWRAM_START + 0xE4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r0, _0805AAD4 @ =IWRAM_START + 0x114
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AAC8: .4byte IWRAM_START + 0x84
_0805AACC: .4byte IWRAM_START + 0xB4
_0805AAD0: .4byte IWRAM_START + 0xE4
_0805AAD4: .4byte IWRAM_START + 0x114

	thumb_func_start sub_805AAD8
sub_805AAD8: @ 0x0805AAD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805AD44 @ =0x06010000
	str r0, [sp, #8]
	ldr r0, _0805AD48 @ =gUnknown_030054D4
	movs r3, #0
	strb r3, [r0, #3]
	strb r3, [r0, #2]
	strb r3, [r0, #1]
	strb r3, [r0]
	str r3, [sp, #4]
	ldr r0, _0805AD4C @ =0x040000D4
	add r1, sp, #4
	str r1, [r0]
	ldr r1, _0805AD50 @ =gMultiSioSend
	str r1, [r0, #4]
	ldr r1, _0805AD54 @ =0x85000005
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [sp, #4]
	add r2, sp, #4
	str r2, [r0]
	ldr r1, _0805AD58 @ =gMultiSioRecv
	str r1, [r0, #4]
	ldr r1, _0805AD5C @ =0x85000014
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _0805AD60 @ =gDispCnt
	ldr r5, _0805AD64 @ =0x00001141
	adds r0, r5, #0
	strh r0, [r1]
	ldr r1, _0805AD68 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0805AD6C @ =0x00001401
	strh r0, [r1]
	ldr r0, _0805AD70 @ =gBgScrollRegs
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	ldr r0, _0805AD74 @ =sub_805ADAC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #6
	str r3, [sp]
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sl, r0
	ldr r2, _0805AD78 @ =IWRAM_START + 0xEB
	adds r0, r1, r2
	strb r4, [r0]
	ldr r5, _0805AD7C @ =IWRAM_START + 0xFC
	adds r2, r1, r5
	movs r0, #1
	strb r0, [r2]
	ldr r2, _0805AD80 @ =IWRAM_START + 0xFD
	adds r0, r1, r2
	strb r4, [r0]
	movs r4, #0
	subs r5, #0xe
	adds r3, r1, r5
	movs r2, #0
	ldr r0, _0805AD84 @ =IWRAM_START + 0xF2
	adds r1, r1, r0
_0805AB6A:
	adds r0, r3, r4
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0805AB6A
	movs r4, #0
	movs r0, #1
	mov r1, sl
	strh r0, [r1]
	strh r4, [r1, #4]
	movs r0, #2
	strh r0, [r1, #2]
	movs r2, #0x80
	lsls r2, r2, #1
	mov sb, r2
	mov r5, sb
	strh r5, [r1, #6]
	ldr r0, _0805AD88 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	mov r0, sl
	bl sub_802D4CC
	mov r7, sl
	adds r7, #0xc
	ldr r0, [sp, #8]
	str r0, [r7, #4]
	ldr r3, _0805AD8C @ =gUnknown_080D9050
	ldr r1, _0805AD90 @ =gLoadedSaveGame
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldr r0, [r1]
	lsls r0, r0, #5
	ldr r5, [sp, #8]
	adds r5, r5, r0
	str r5, [sp, #8]
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	mov r0, sl
	adds r0, #0x2c
	strb r1, [r0]
	mov r1, sl
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0x18
	strh r0, [r7, #0x18]
	mov r0, sb
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r0, sl
	adds r0, #0x2e
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	movs r5, #0
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	movs r5, #0x80
	lsls r5, r5, #5
	str r5, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r7, #0x30
	ldr r0, [sp, #8]
	str r0, [r7, #4]
	ldr r3, _0805AD94 @ =gPressStartTiles
	ldr r1, _0805AD90 @ =gLoadedSaveGame
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldr r0, [r1]
	lsls r0, r0, #5
	mov ip, r0
	ldr r0, [sp, #8]
	add r0, ip
	str r0, [sp, #8]
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	mov r0, sl
	adds r0, #0x5c
	strb r1, [r0]
	mov r1, sl
	adds r1, #0x5d
	adds r0, r6, #0
	strb r0, [r1]
	movs r1, #0x78
	strh r1, [r7, #0x16]
	movs r0, #0x7a
	strh r0, [r7, #0x18]
	mov r2, sb
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r0, sl
	adds r0, #0x5e
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	movs r2, #0
	strb r2, [r0]
	str r6, [r7, #0x28]
	str r5, [r7, #0x10]
	adds r7, #0x30
	ldr r0, [sp, #8]
	str r0, [r7, #4]
	ldr r0, _0805AD98 @ =0x00000432
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0x8c
	movs r2, #8
	strb r2, [r0]
	mov r2, sl
	adds r2, #0x8d
	adds r0, r6, #0
	strb r0, [r2]
	strh r1, [r7, #0x16]
	movs r0, #0x8c
	strh r0, [r7, #0x18]
	mov r0, sb
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r0, sl
	adds r0, #0x8e
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	movs r2, #0
	strb r2, [r0]
	str r6, [r7, #0x28]
	str r5, [r7, #0x10]
	adds r0, #0xb
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _0805AD9C @ =0x0600A000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0x72
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	mov r1, sl
	adds r1, #0xc6
	strb r2, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	ldr r0, _0805ADA0 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805ACE8
	bl MultiSioStart
_0805ACE8:
	ldr r2, _0805ADA4 @ =gUnknown_03005594
	ldr r5, _0805AD90 @ =gLoadedSaveGame
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	movs r1, #0xf
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0805ADA8 @ =gUnknown_030054D8
	movs r0, #1
	strb r0, [r1]
	movs r4, #0
	mov r6, sl
	adds r6, #0xf6
	mov r7, sl
	adds r7, #0xfa
	adds r5, r1, #0
	ldr r2, _0805AD90 @ =gLoadedSaveGame
_0805AD0A:
	ldr r0, [r2]
	adds r0, #7
	adds r0, r0, r4
	ldrb r3, [r0]
	ldrb r0, [r5]
	cmp r0, r3
	bhs _0805AD1A
	strb r3, [r1]
_0805AD1A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0805AD0A
	ldrb r0, [r1]
	cmp r0, #0x1b
	bls _0805AD2E
	movs r0, #0x1b
	strb r0, [r1]
_0805AD2E:
	movs r0, #0
	strb r0, [r6]
	strb r0, [r7]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD44: .4byte 0x06010000
_0805AD48: .4byte gUnknown_030054D4
_0805AD4C: .4byte 0x040000D4
_0805AD50: .4byte gMultiSioSend
_0805AD54: .4byte 0x85000005
_0805AD58: .4byte gMultiSioRecv
_0805AD5C: .4byte 0x85000014
_0805AD60: .4byte gDispCnt
_0805AD64: .4byte 0x00001141
_0805AD68: .4byte gBgCntRegs
_0805AD6C: .4byte 0x00001401
_0805AD70: .4byte gBgScrollRegs
_0805AD74: .4byte sub_805ADAC
_0805AD78: .4byte IWRAM_START + 0xEB
_0805AD7C: .4byte IWRAM_START + 0xFC
_0805AD80: .4byte IWRAM_START + 0xFD
_0805AD84: .4byte IWRAM_START + 0xF2
_0805AD88: .4byte 0x00003FFF
_0805AD8C: .4byte gUnknown_080D9050
_0805AD90: .4byte gLoadedSaveGame
_0805AD94: .4byte gPressStartTiles
_0805AD98: .4byte 0x00000432
_0805AD9C: .4byte 0x0600A000
_0805ADA0: .4byte gMultiSioStatusFlags
_0805ADA4: .4byte gUnknown_03005594
_0805ADA8: .4byte gUnknown_030054D8

	thumb_func_start sub_805ADAC
sub_805ADAC: @ 0x0805ADAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r4, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r2, #1
	str r2, [sp, #0x14]
	ldr r0, _0805AE30 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, r6, #0
	bl sub_802D4CC
	ldr r0, _0805AE34 @ =gMultiSioStatusFlags
	ldr r2, [r0]
	movs r0, #0x81
	ands r0, r2
	cmp r0, #0
	beq _0805AE60
	ldr r3, _0805AE38 @ =0x04000128
	ldr r1, [r3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	ldr r0, [sp, #0x14]
	lsls r0, r1
	ands r2, r0
	cmp r2, #0
	bne _0805AE50
	ldr r1, _0805AE3C @ =gUnknown_030054D4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xb4
	bls _0805AE60
	ldr r1, _0805AE40 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805AE44 @ =gUnknown_03002AE4
	ldr r0, _0805AE48 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805AE4C @ =gUnknown_03005390
	mov r1, sp
	ldrb r1, [r1, #8]
	strb r1, [r0]
	b _0805B1F6
	.align 2, 0
_0805AE30: .4byte gCurTask
_0805AE34: .4byte gMultiSioStatusFlags
_0805AE38: .4byte 0x04000128
_0805AE3C: .4byte gUnknown_030054D4
_0805AE40: .4byte 0x0000FFFF
_0805AE44: .4byte gUnknown_03002AE4
_0805AE48: .4byte gUnknown_0300287C
_0805AE4C: .4byte gUnknown_03005390
_0805AE50:
	ldr r1, _0805AEBC @ =gUnknown_030054D4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
_0805AE60:
	ldr r1, _0805AEC0 @ =gMultiSioStatusFlags
	ldr r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0805AE70
	movs r4, #1
_0805AE70:
	ldr r0, _0805AEC4 @ =gMultiSioRecv
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	bne _0805AE92
	cmp r4, #0
	beq _0805AED8
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0805AED8
	ldr r1, _0805AEC4 @ =gMultiSioRecv
	ldrh r0, [r1]
	cmp r0, #0
	beq _0805AED8
_0805AE92:
	adds r1, r6, #0
	adds r1, #0xfd
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0805AEE0
	ldr r1, _0805AEC8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805AECC @ =gUnknown_03002AE4
	ldr r0, _0805AED0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805AED4 @ =gUnknown_03005390
	movs r0, #0
	b _0805B1F4
	.align 2, 0
_0805AEBC: .4byte gUnknown_030054D4
_0805AEC0: .4byte gMultiSioStatusFlags
_0805AEC4: .4byte gMultiSioRecv
_0805AEC8: .4byte 0x0000FFFF
_0805AECC: .4byte gUnknown_03002AE4
_0805AED0: .4byte gUnknown_0300287C
_0805AED4: .4byte gUnknown_03005390
_0805AED8:
	adds r1, r6, #0
	adds r1, #0xfd
	movs r0, #0
	strb r0, [r1]
_0805AEE0:
	movs r5, #0
	adds r2, r6, #0
	adds r2, #0xfa
	str r2, [sp, #0x20]
	movs r7, #1
	adds r4, r6, #0
	adds r4, #0xee
	movs r0, #0xf2
	adds r0, r0, r6
	mov ip, r0
	movs r1, #0
	str r1, [sp, #0x28]
	movs r2, #0
	str r2, [sp, #0x2c]
	mov sl, r2
	ldr r0, _0805AF98 @ =gUnknown_03005460
	mov sb, r0
_0805AF02:
	lsls r1, r5, #2
	str r1, [sp, #0x30]
	ldr r3, _0805AF9C @ =gMultiSioRecv
	add r3, sl
	ldrb r0, [r4]
	lsls r0, r0, #1
	strb r0, [r4]
	mov r2, ip
	ldrb r0, [r2]
	lsls r0, r0, #1
	strb r0, [r2]
	ldr r0, _0805AFA0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r5, r0
	beq _0805AF3A
	adds r1, r7, #0
	lsls r1, r5
	ldr r2, _0805AFA4 @ =gMultiSioStatusFlags
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0805AFB8
	ldrh r0, [r3]
	ldr r1, _0805AFA8 @ =0x0000400F
	cmp r0, r1
	bls _0805AFB8
_0805AF3A:
	ldrb r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp]
	adds r0, r7, #0
	lsls r0, r5
	ldr r1, [sp, #8]
	orrs r1, r0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0805AF60
	movs r0, #1
	str r0, [sp, #0x10]
_0805AF60:
	ldr r0, _0805AFAC @ =gUnknown_03005410
	ldr r1, [sp, #0x30]
	adds r0, r1, r0
	ldr r1, [r3, #4]
	str r1, [r0]
	ldrh r0, [r3, #8]
	mov r2, sb
	strh r0, [r2]
	ldr r0, _0805AF98 @ =gUnknown_03005460
	adds r0, #2
	ldr r1, [sp, #0x2c]
	adds r0, r1, r0
	ldrh r1, [r3, #0xa]
	strh r1, [r0]
	ldrh r0, [r3, #0xc]
	strh r0, [r2, #4]
	ldr r2, _0805AFB0 @ =gUnknown_03005594
	ldrb r0, [r2]
	ldrb r1, [r3, #0xe]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0805AFB4 @ =gUnknown_030054D8
	ldrb r1, [r3, #0xf]
	ldrb r0, [r2]
	cmp r0, r1
	bhs _0805B01E
	strb r1, [r2]
	b _0805B01E
	.align 2, 0
_0805AF98: .4byte gUnknown_03005460
_0805AF9C: .4byte gMultiSioRecv
_0805AFA0: .4byte 0x04000128
_0805AFA4: .4byte gMultiSioStatusFlags
_0805AFA8: .4byte 0x0000400F
_0805AFAC: .4byte gUnknown_03005410
_0805AFB0: .4byte gUnknown_03005594
_0805AFB4: .4byte gUnknown_030054D8
_0805AFB8:
	ldr r2, [sp, #0x28]
	ldr r1, _0805AFF0 @ =0x04000120
	adds r0, r2, r1
	ldrh r0, [r0]
	str r0, [sp, #0x30]
	movs r2, #1
	str r2, [sp, #0xc]
	adds r1, r2, #0
	lsls r1, r5
	ldr r2, _0805AFF4 @ =gMultiSioStatusFlags
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _0805AFF8
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _0805AFF8
	movs r1, #1
	str r1, [sp, #0x10]
	mov r2, ip
	ldrb r0, [r2]
	adds r1, r7, #0
	orrs r1, r0
	strb r1, [r2]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805B024
	b _0805B01A
	.align 2, 0
_0805AFF0: .4byte 0x04000120
_0805AFF4: .4byte gMultiSioStatusFlags
_0805AFF8:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805B016
	adds r1, r7, #0
	lsls r1, r5
	ldr r2, _0805B08C @ =gMultiSioStatusFlags
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0805B01E
	ldrh r0, [r3]
	ldr r1, _0805B090 @ =0x0000400F
	cmp r0, r1
	bhi _0805B01E
_0805B016:
	movs r2, #1
	str r2, [sp, #0x10]
_0805B01A:
	movs r0, #0
	str r0, [sp, #0x14]
_0805B01E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0805B02A
_0805B024:
	ldr r1, [sp, #4]
	adds r1, #1
	str r1, [sp, #4]
_0805B02A:
	adds r4, #1
	movs r2, #1
	add ip, r2
	ldr r0, [sp, #0x28]
	adds r0, #2
	str r0, [sp, #0x28]
	movs r1, #0xc
	add sb, r1
	ldr r2, [sp, #0x2c]
	adds r2, #0xc
	str r2, [sp, #0x2c]
	movs r0, #0x14
	add sl, r0
	adds r5, #1
	cmp r5, #3
	bgt _0805B04C
	b _0805AF02
_0805B04C:
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _0805B056
	movs r2, #1
	str r2, [sp, #4]
_0805B056:
	ldr r0, [sp, #0x20]
	ldrb r4, [r0]
	cmp r4, #0
	bne _0805B0AE
	ldr r1, _0805B08C @ =gMultiSioStatusFlags
	ldr r0, [r1]
	movs r1, #0x81
	ands r0, r1
	cmp r0, #1
	bne _0805B0A8
	mov r2, r8
	ldrh r1, [r2]
	ldr r0, _0805B094 @ =0x00004010
	cmp r1, r0
	bls _0805B0A8
	ldr r1, _0805B098 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B09C @ =gUnknown_03002AE4
	ldr r0, _0805B0A0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805B0A4 @ =gUnknown_03005390
	strb r4, [r0]
	b _0805B1F6
	.align 2, 0
_0805B08C: .4byte gMultiSioStatusFlags
_0805B090: .4byte 0x0000400F
_0805B094: .4byte 0x00004010
_0805B098: .4byte 0x0000FFFF
_0805B09C: .4byte gUnknown_03002AE4
_0805B0A0: .4byte gUnknown_0300287C
_0805B0A4: .4byte gUnknown_03005390
_0805B0A8:
	movs r0, #1
	ldr r1, [sp, #0x20]
	strb r0, [r1]
_0805B0AE:
	mov r2, r8
	ldrh r1, [r2]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0805B0BA
	b _0805B1D8
_0805B0BA:
	ldr r0, _0805B130 @ =0x00004011
	cmp r1, r0
	beq _0805B0C2
	b _0805B1D8
_0805B0C2:
	ldr r2, [sp, #0x20]
	ldrb r0, [r2]
	cmp r0, #0
	bne _0805B0CC
	b _0805B1D8
_0805B0CC:
	ldr r1, _0805B134 @ =gUnknown_03005434
	mov r2, r8
	ldr r0, [r2, #0x10]
	str r0, [r1]
	ldr r1, _0805B138 @ =gUnknown_030055B8
	ldrb r0, [r2, #2]
	strb r0, [r1]
	movs r5, #0
	adds r0, r6, #0
	adds r0, #0xe8
	str r0, [sp, #0x18]
	adds r1, r6, #0
	adds r1, #0xf6
	str r1, [sp, #0x1c]
	adds r6, #0xfb
	str r6, [sp, #0x24]
	ldr r6, _0805B13C @ =gUnknown_03005460
	ldr r7, _0805B140 @ =gUnknown_03005594
	adds r4, r6, #0
	mov sl, r5
	ldr r2, _0805B144 @ =gUnknown_03005410
	mov ip, r2
	mov sb, r5
_0805B0FA:
	ldr r1, _0805B138 @ =gUnknown_030055B8
	ldrb r0, [r1]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805B182
	cmp r5, #0
	bne _0805B14C
	mov r2, r8
	ldr r0, [r2, #4]
	ldr r1, _0805B144 @ =gUnknown_03005410
	str r0, [r1]
	ldrh r0, [r2, #8]
	strh r0, [r6]
	ldrh r0, [r2, #0xa]
	strh r0, [r6, #2]
	ldrh r0, [r2, #0xc]
	strh r0, [r6, #4]
	ldrb r0, [r7]
	ldrb r1, [r2, #0xe]
	orrs r0, r1
	strb r0, [r7]
	ldr r2, _0805B148 @ =gUnknown_030054D8
	mov r0, r8
	ldrb r1, [r0, #0xf]
	b _0805B17A
	.align 2, 0
_0805B130: .4byte 0x00004011
_0805B134: .4byte gUnknown_03005434
_0805B138: .4byte gUnknown_030055B8
_0805B13C: .4byte gUnknown_03005460
_0805B140: .4byte gUnknown_03005594
_0805B144: .4byte gUnknown_03005410
_0805B148: .4byte gUnknown_030054D8
_0805B14C:
	ldr r3, _0805B1C0 @ =gMultiSioRecv
	add r3, sb
	ldrh r0, [r3]
	ldr r1, _0805B1C4 @ =0x00004010
	cmp r0, r1
	bne _0805B182
	ldr r0, [r3, #4]
	mov r2, ip
	str r0, [r2]
	ldrh r0, [r3, #8]
	strh r0, [r4]
	adds r0, r6, #2
	add r0, sl
	ldrh r1, [r3, #0xa]
	strh r1, [r0]
	ldrh r0, [r3, #0xc]
	strh r0, [r4, #4]
	ldrb r0, [r7]
	ldrb r1, [r3, #0xe]
	orrs r0, r1
	strb r0, [r7]
	ldr r2, _0805B1C8 @ =gUnknown_030054D8
	ldrb r1, [r3, #0xf]
_0805B17A:
	ldrb r0, [r2]
	cmp r0, r1
	bhs _0805B182
	strb r1, [r2]
_0805B182:
	adds r4, #0xc
	movs r0, #0xc
	add sl, r0
	movs r1, #4
	add ip, r1
	movs r2, #0x14
	add sb, r2
	adds r5, #1
	cmp r5, #3
	ble _0805B0FA
	movs r0, #0
	movs r1, #0
	ldr r2, [sp, #0x18]
	strh r0, [r2]
	ldr r0, [sp, #0x1c]
	strb r1, [r0]
	ldr r2, _0805B1CC @ =gUnknown_030054D4
	strb r1, [r2, #3]
	strb r1, [r2, #2]
	strb r1, [r2, #1]
	strb r1, [r2]
	ldr r0, [sp, #0x24]
	strb r1, [r0]
	ldr r1, _0805B1D0 @ =gCurTask
	ldr r0, [r1]
	ldr r2, _0805B1D4 @ =sub_805B4C0
	str r2, [r0, #8]
	bl _call_via_r2
	b _0805B42A
	.align 2, 0
_0805B1C0: .4byte gMultiSioRecv
_0805B1C4: .4byte 0x00004010
_0805B1C8: .4byte gUnknown_030054D8
_0805B1CC: .4byte gUnknown_030054D4
_0805B1D0: .4byte gCurTask
_0805B1D4: .4byte sub_805B4C0
_0805B1D8:
	lsls r1, r1, #0x10
	ldr r0, _0805B204 @ =0x40120000
	cmp r1, r0
	bls _0805B220
	ldr r1, _0805B208 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B20C @ =gUnknown_03002AE4
	ldr r0, _0805B210 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805B214 @ =gUnknown_03005390
	movs r0, #0
_0805B1F4:
	strb r0, [r1]
_0805B1F6:
	ldr r1, _0805B218 @ =gUnknown_03004D5C
	ldr r0, _0805B21C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805B42A
	.align 2, 0
_0805B204: .4byte 0x40120000
_0805B208: .4byte 0x0000FFFF
_0805B20C: .4byte gUnknown_03002AE4
_0805B210: .4byte gUnknown_0300287C
_0805B214: .4byte gUnknown_03005390
_0805B218: .4byte gUnknown_03004D5C
_0805B21C: .4byte gUnknown_03002A84
_0805B220:
	ldr r0, _0805B254 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805B2B0
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, _0805B258 @ =gMultiSioStatusFlags
	ldr r4, [r0]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	beq _0805B268
	ldr r7, _0805B25C @ =gMultiSioSend
	movs r1, #0
	strh r1, [r7]
	adds r0, r6, #0
	adds r0, #0xe8
	strh r1, [r0]
	ldr r0, _0805B260 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805B264 @ =sub_805B454
	str r0, [r1, #8]
	b _0805B42A
	.align 2, 0
_0805B254: .4byte gPressedKeys
_0805B258: .4byte gMultiSioStatusFlags
_0805B25C: .4byte gMultiSioSend
_0805B260: .4byte gCurTask
_0805B264: .4byte sub_805B454
_0805B268:
	ldr r0, _0805B29C @ =gUnknown_03001954
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r7, _0805B2A0 @ =gMultiSioSend
	movs r2, #0
	strh r4, [r7]
	ldr r0, _0805B2A4 @ =gUnknown_03004D80
	strb r2, [r0]
	ldr r1, _0805B2A8 @ =gUnknown_03002280
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	bl sub_805A1CC
	ldr r0, _0805B2AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805B42A
	.align 2, 0
_0805B29C: .4byte gUnknown_03001954
_0805B2A0: .4byte gMultiSioSend
_0805B2A4: .4byte gUnknown_03004D80
_0805B2A8: .4byte gUnknown_03002280
_0805B2AC: .4byte gCurTask
_0805B2B0:
	ldr r1, _0805B3AC @ =gMultiSioStatusFlags
	ldr r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805B2D8
	ldr r2, [sp, #4]
	cmp r2, #1
	ble _0805B302
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0805B2D8
	adds r4, r6, #0
	adds r4, #0x3c
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805B2D8:
	ldr r1, [sp, #4]
	cmp r1, #1
	ble _0805B302
	adds r4, r6, #0
	adds r4, #0x6c
	ldr r0, _0805B3B0 @ =0x00000432
	strh r0, [r4, #0xa]
	adds r1, #6
	adds r0, r6, #0
	adds r0, #0x8c
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x8d
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805B302:
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _0805B3AC @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	adds r2, r6, #0
	adds r2, #0xf6
	str r2, [sp, #0x1c]
	cmp r0, #0
	beq _0805B3CC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0805B336
	ldr r1, [sp]
	cmp r1, #1
	ble _0805B336
	ldr r0, _0805B3B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805B34E
_0805B336:
	adds r1, r6, #0
	adds r1, #0xf6
	ldrb r0, [r1]
	str r1, [sp, #0x1c]
	cmp r0, #0
	beq _0805B3EC
	ldr r2, [sp, #0x10]
	cmp r2, #0
	bne _0805B3CC
	ldr r0, [sp]
	cmp r0, #1
	ble _0805B3CC
_0805B34E:
	ldr r7, _0805B3B8 @ =gMultiSioSend
	ldr r0, _0805B3BC @ =0x00004011
	strh r0, [r7]
	mov r1, sp
	ldrb r1, [r1, #8]
	strb r1, [r7, #2]
	ldr r1, _0805B3C0 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r7, #4]
	adds r0, r6, #0
	adds r0, #0xdc
	ldr r0, [r0]
	str r0, [r7, #0x10]
	movs r2, #0
	ldr r0, _0805B3C4 @ =gUnknown_03005594
	mov r8, r0
	ldr r0, _0805B3C8 @ =gUnknown_030054D8
	mov sb, r0
	adds r4, r6, #0
	adds r4, #0xfc
	adds r5, r1, #0
	adds r3, r7, #0
	adds r3, #8
_0805B37E:
	lsls r0, r2, #1
	ldr r1, [r5]
	adds r1, #0x20
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #2
	ble _0805B37E
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #0
	strb r0, [r7, #0xe]
	mov r2, sb
	ldrb r0, [r2]
	strb r0, [r7, #0xf]
	movs r0, #1
	ldr r2, [sp, #0x1c]
	strb r0, [r2]
	strb r1, [r4]
	b _0805B42A
	.align 2, 0
_0805B3AC: .4byte gMultiSioStatusFlags
_0805B3B0: .4byte 0x00000432
_0805B3B4: .4byte gPressedKeys
_0805B3B8: .4byte gMultiSioSend
_0805B3BC: .4byte 0x00004011
_0805B3C0: .4byte gLoadedSaveGame
_0805B3C4: .4byte gUnknown_03005594
_0805B3C8: .4byte gUnknown_030054D8
_0805B3CC:
	ldr r1, [sp, #0x1c]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805B3EC
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0805B43C @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805B3EC
	adds r1, r6, #0
	adds r1, #0xfc
	movs r0, #1
	strb r0, [r1]
_0805B3EC:
	ldr r7, _0805B440 @ =gMultiSioSend
	ldr r0, _0805B444 @ =0x00004010
	strh r0, [r7]
	ldr r1, _0805B448 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r7, #4]
	movs r2, #0
	ldr r0, _0805B44C @ =gUnknown_03005594
	mov r8, r0
	ldr r0, _0805B450 @ =gUnknown_030054D8
	mov sb, r0
	adds r4, r1, #0
	adds r3, r7, #0
	adds r3, #8
_0805B40A:
	lsls r0, r2, #1
	ldr r1, [r4]
	adds r1, #0x20
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #2
	ble _0805B40A
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r7, #0xe]
	mov r2, sb
	ldrb r0, [r2]
	strb r0, [r7, #0xf]
_0805B42A:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B43C: .4byte gMultiSioStatusFlags
_0805B440: .4byte gMultiSioSend
_0805B444: .4byte 0x00004010
_0805B448: .4byte gLoadedSaveGame
_0805B44C: .4byte gUnknown_03005594
_0805B450: .4byte gUnknown_030054D8

	thumb_func_start sub_805B454
sub_805B454: @ 0x0805B454
	push {r4, r5, lr}
	ldr r5, _0805B4A8 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	ldr r2, _0805B4AC @ =gMultiSioSend
	movs r4, #0
	movs r0, #0
	strh r0, [r2]
	ldr r0, _0805B4B0 @ =IWRAM_START + 0xE8
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bls _0805B4A0
	ldr r0, _0805B4B4 @ =gUnknown_03001954
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r0, _0805B4B8 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _0805B4BC @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	bl sub_805A1CC
	ldr r0, [r5]
	bl TaskDestroy
_0805B4A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B4A8: .4byte gCurTask
_0805B4AC: .4byte gMultiSioSend
_0805B4B0: .4byte IWRAM_START + 0xE8
_0805B4B4: .4byte gUnknown_03001954
_0805B4B8: .4byte gUnknown_03004D80
_0805B4BC: .4byte gUnknown_03002280

	thumb_func_start sub_805B4C0
sub_805B4C0: @ 0x0805B4C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	ldr r0, _0805B52C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r0, _0805B530 @ =gGameMode
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #2
	bls _0805B568
	movs r3, #0
	ldr r0, _0805B534 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _0805B568
	movs r5, #1
	ldr r2, _0805B538 @ =gUnknown_030054D4
_0805B4FA:
	ldr r1, _0805B53C @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805B550
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805B554
	movs r0, #0
	ldr r1, _0805B540 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B544 @ =gUnknown_03002AE4
	ldr r0, _0805B548 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805B54C @ =gUnknown_03005390
	strb r4, [r0]
	b _0805B7C0
	.align 2, 0
_0805B52C: .4byte gCurTask
_0805B530: .4byte gGameMode
_0805B534: .4byte gUnknown_030055B8
_0805B538: .4byte gUnknown_030054D4
_0805B53C: .4byte gMultiSioStatusFlags
_0805B540: .4byte 0x0000FFFF
_0805B544: .4byte gUnknown_03002AE4
_0805B548: .4byte gUnknown_0300287C
_0805B54C: .4byte gUnknown_03005390
_0805B550:
	movs r0, #0
	strb r0, [r2]
_0805B554:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805B568
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0805B4FA
_0805B568:
	ldr r6, _0805B5C4 @ =gMultiSioRecv
	ldrb r5, [r6, #2]
	ldrh r1, [r6]
	ldr r0, _0805B5C8 @ =0x00004012
	cmp r1, r0
	beq _0805B576
	b _0805B71C
_0805B576:
	ldr r0, _0805B5CC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	asrs r5, r0
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	bne _0805B5F0
	ldr r0, _0805B5D0 @ =gUnknown_03001954
	strb r5, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r2, _0805B5D4 @ =gMultiSioSend
	movs r4, #0
	strh r5, [r2]
	ldr r0, _0805B5D8 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _0805B5DC @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r1, _0805B5E0 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B5E4 @ =gUnknown_03002AE4
	ldr r0, _0805B5E8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805B5EC @ =gUnknown_03005390
	strb r4, [r0]
	b _0805B7C0
	.align 2, 0
_0805B5C4: .4byte gMultiSioRecv
_0805B5C8: .4byte 0x00004012
_0805B5CC: .4byte 0x04000128
_0805B5D0: .4byte gUnknown_03001954
_0805B5D4: .4byte gMultiSioSend
_0805B5D8: .4byte gUnknown_03004D80
_0805B5DC: .4byte gUnknown_03002280
_0805B5E0: .4byte 0x0000FFFF
_0805B5E4: .4byte gUnknown_03002AE4
_0805B5E8: .4byte gUnknown_0300287C
_0805B5EC: .4byte gUnknown_03005390
_0805B5F0:
	movs r0, #3
	mov r1, sb
	strb r0, [r1]
	movs r4, #3
	ldr r5, _0805B63C @ =gUnknown_03005460
	adds r7, r5, #0
	adds r7, #0x24
	movs r2, #0x24
	mov sl, r2
	ldr r0, _0805B640 @ =gUnknown_03005410
	adds r0, #0xc
	mov sb, r0
	movs r1, #0x3c
	str r1, [sp]
	ldr r2, _0805B644 @ =gUnknown_03005594
	mov r8, r2
_0805B610:
	ldr r0, _0805B648 @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805B6DE
	cmp r4, #0
	bne _0805B674
	ldr r0, _0805B640 @ =gUnknown_03005410
	ldr r1, [r0]
	ldr r0, [r6, #4]
	cmp r1, r0
	bne _0805B64C
	ldrh r0, [r6, #8]
	strh r0, [r5, #6]
	ldrh r0, [r6, #0xa]
	strh r0, [r5, #8]
	ldrh r0, [r6, #0xc]
	strh r0, [r5, #0xa]
	b _0805B650
	.align 2, 0
_0805B63C: .4byte gUnknown_03005460
_0805B640: .4byte gUnknown_03005410
_0805B644: .4byte gUnknown_03005594
_0805B648: .4byte gUnknown_030055B8
_0805B64C:
	ldr r0, _0805B66C @ =0x0000FFFF
	strh r0, [r5]
_0805B650:
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r6, #0xe]
	orrs r0, r1
	mov r2, r8
	strb r0, [r2]
	ldr r2, _0805B670 @ =gUnknown_030054D8
	ldrb r1, [r6, #0xf]
	ldrb r0, [r2]
	cmp r0, r1
	bhs _0805B6C8
	strb r1, [r2]
	b _0805B6C8
	.align 2, 0
_0805B66C: .4byte 0x0000FFFF
_0805B670: .4byte gUnknown_030054D8
_0805B674:
	ldr r0, _0805B6A4 @ =gMultiSioRecv
	ldr r1, [sp]
	adds r2, r1, r0
	ldrh r1, [r2]
	ldr r0, _0805B6A8 @ =0x00004011
	cmp r1, r0
	bne _0805B6C8
	mov r0, sb
	ldr r1, [r0]
	ldr r0, [r2, #4]
	cmp r1, r0
	bne _0805B6AC
	adds r0, r5, #6
	add r0, sl
	ldrh r1, [r2, #8]
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #8
	add r0, sl
	ldrh r1, [r2, #0xa]
	strh r1, [r0]
	ldrh r0, [r2, #0xc]
	strh r0, [r7, #0xa]
	b _0805B6B0
	.align 2, 0
_0805B6A4: .4byte gMultiSioRecv
_0805B6A8: .4byte 0x00004011
_0805B6AC:
	ldr r0, _0805B70C @ =0x0000FFFF
	strh r0, [r7]
_0805B6B0:
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r2, #0xe]
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	ldr r3, _0805B710 @ =gUnknown_030054D8
	ldrb r1, [r2, #0xf]
	ldrb r0, [r3]
	cmp r0, r1
	bhs _0805B6C8
	strb r1, [r3]
_0805B6C8:
	ldr r0, _0805B714 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0805B6DE
	mov r2, sb
	ldr r0, [r2]
	adds r1, r7, #0
	bl InsertMultiplayerProfile
_0805B6DE:
	subs r7, #0xc
	movs r0, #0xc
	rsbs r0, r0, #0
	add sl, r0
	movs r1, #4
	rsbs r1, r1, #0
	add sb, r1
	ldr r2, [sp]
	subs r2, #0x14
	str r2, [sp]
	subs r4, #1
	cmp r4, #0
	bge _0805B610
	bl WriteSaveGame
	ldr r0, _0805B718 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	movs r0, #0
	bl sub_805BA10
	b _0805B966
	.align 2, 0
_0805B70C: .4byte 0x0000FFFF
_0805B710: .4byte gUnknown_030054D8
_0805B714: .4byte 0x04000128
_0805B718: .4byte gCurTask
_0805B71C:
	ldr r0, _0805B768 @ =0x00004010
	cmp r1, r0
	bne _0805B78C
	ldr r1, _0805B76C @ =gUnknown_03001954
	movs r0, #0
	strb r0, [r1]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r0, _0805B770 @ =gMultiSioSend
	mov sl, r0
	movs r4, #0
	movs r0, #0
	mov r1, sl
	strh r0, [r1]
	ldr r0, _0805B774 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _0805B778 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r1, _0805B77C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B780 @ =gUnknown_03002AE4
	ldr r0, _0805B784 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805B788 @ =gUnknown_03005390
	strb r4, [r0]
	b _0805B7C0
	.align 2, 0
_0805B768: .4byte 0x00004010
_0805B76C: .4byte gUnknown_03001954
_0805B770: .4byte gMultiSioSend
_0805B774: .4byte gUnknown_03004D80
_0805B778: .4byte gUnknown_03002280
_0805B77C: .4byte 0x0000FFFF
_0805B780: .4byte gUnknown_03002AE4
_0805B784: .4byte gUnknown_0300287C
_0805B788: .4byte gUnknown_03005390
_0805B78C:
	ldr r0, _0805B7D0 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805B7EC
	mov r2, r8
	adds r2, #0xfb
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _0805B7EC
	ldr r1, _0805B7D4 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B7D8 @ =gUnknown_03002AE4
	ldr r0, _0805B7DC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805B7E0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
_0805B7C0:
	ldr r1, _0805B7E4 @ =gUnknown_03004D5C
	ldr r0, _0805B7E8 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805B966
	.align 2, 0
_0805B7D0: .4byte gMultiSioStatusFlags
_0805B7D4: .4byte 0x0000FFFF
_0805B7D8: .4byte gUnknown_03002AE4
_0805B7DC: .4byte gUnknown_0300287C
_0805B7E0: .4byte gUnknown_03005390
_0805B7E4: .4byte gUnknown_03004D5C
_0805B7E8: .4byte gUnknown_03002A84
_0805B7EC:
	movs r4, #0
	mov r3, r8
	adds r3, #0xee
_0805B7F2:
	adds r2, r3, r4
	ldrb r1, [r2]
	lsls r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x19
	cmp r1, #0
	beq _0805B802
	adds r7, #1
_0805B802:
	adds r4, #1
	cmp r4, #3
	ble _0805B7F2
	cmp r7, #0
	bne _0805B80E
	movs r7, #1
_0805B80E:
	cmp r7, #1
	ble _0805B836
	mov r4, r8
	adds r4, #0x6c
	ldr r0, _0805B8F8 @ =0x00000432
	strh r0, [r4, #0xa]
	adds r1, r7, #6
	mov r0, r8
	adds r0, #0x8c
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x8d
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805B836:
	ldr r0, _0805B8FC @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805B92A
	ldr r2, _0805B900 @ =gMultiSioSend
	mov sl, r2
	ldr r0, _0805B904 @ =0x00004012
	strh r0, [r2]
	strb r5, [r2, #2]
	ldr r1, _0805B908 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _0805B90C @ =gUnknown_030055B8
	mov ip, r0
	ldr r5, _0805B910 @ =gUnknown_03005594
	ldr r6, _0805B914 @ =gUnknown_030054D8
	movs r2, #8
	add r2, sl
	mov sb, r2
	movs r4, #6
	movs r3, #2
_0805B866:
	ldr r0, [r1]
	adds r0, #0x20
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0805B866
	ldrb r0, [r5]
	mov r1, sl
	strb r0, [r1, #0xe]
	ldrb r0, [r6]
	strb r0, [r1, #0xf]
	movs r4, #0
	movs r6, #1
	ldr r7, _0805B8FC @ =gMultiSioStatusFlags
	ldr r2, _0805B918 @ =0x00004011
	mov r8, r2
	movs r5, #0
_0805B890:
	movs r3, #0
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	bne _0805B8AC
	adds r1, r6, #0
	lsls r1, r4
	ldr r0, [r7]
	ands r0, r1
	cmp r0, #0
	beq _0805B920
	movs r3, #1
_0805B8AC:
	cmp r4, #0
	beq _0805B920
	cmp r3, #0
	bne _0805B8D6
	adds r1, r6, #0
	lsls r1, r4
	ldr r0, [r7]
	ands r0, r1
	cmp r0, #0
	bne _0805B8C2
	movs r3, #1
_0805B8C2:
	cmp r3, #0
	bne _0805B8D6
	ldr r0, _0805B91C @ =gMultiSioRecv
	adds r2, r5, r0
	ldrh r0, [r2]
	cmp r0, r8
	beq _0805B8D2
	movs r3, #1
_0805B8D2:
	cmp r3, #0
	beq _0805B920
_0805B8D6:
	mov r0, r8
	mov r2, sl
	strh r0, [r2]
	movs r3, #0
	ldr r4, _0805B908 @ =gLoadedSaveGame
	mov r2, sb
_0805B8E2:
	lsls r0, r3, #1
	ldr r1, [r4]
	adds r1, #0x20
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #2
	ble _0805B8E2
	b _0805B966
	.align 2, 0
_0805B8F8: .4byte 0x00000432
_0805B8FC: .4byte gMultiSioStatusFlags
_0805B900: .4byte gMultiSioSend
_0805B904: .4byte 0x00004012
_0805B908: .4byte gLoadedSaveGame
_0805B90C: .4byte gUnknown_030055B8
_0805B910: .4byte gUnknown_03005594
_0805B914: .4byte gUnknown_030054D8
_0805B918: .4byte 0x00004011
_0805B91C: .4byte gMultiSioRecv
_0805B920:
	adds r5, #0x14
	adds r4, #1
	cmp r4, #3
	ble _0805B890
	b _0805B966
_0805B92A:
	ldr r1, _0805B978 @ =gMultiSioSend
	mov sl, r1
	ldr r0, _0805B97C @ =0x00004011
	strh r0, [r1]
	strb r5, [r1, #2]
	ldr r1, _0805B980 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldr r0, [r0]
	mov r2, sl
	str r0, [r2, #4]
	ldr r5, _0805B984 @ =gUnknown_03005594
	ldr r6, _0805B988 @ =gUnknown_030054D8
	movs r4, #6
	adds r2, #8
	movs r3, #2
_0805B948:
	ldr r0, [r1]
	adds r0, #0x20
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0805B948
	ldrb r0, [r5]
	mov r1, sl
	strb r0, [r1, #0xe]
	ldrb r0, [r6]
	strb r0, [r1, #0xf]
_0805B966:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B978: .4byte gMultiSioSend
_0805B97C: .4byte 0x00004011
_0805B980: .4byte gLoadedSaveGame
_0805B984: .4byte gUnknown_03005594
_0805B988: .4byte gUnknown_030054D8

	thumb_func_start sub_805B98C
sub_805B98C: @ 0x0805B98C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xc
	bl sub_80051E8
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_805B9A4
sub_805B9A4: @ 0x0805B9A4
	push {lr}
	bl m4aMPlayAllStop
	ldr r2, _0805B9F0 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _0805B9F4 @ =gDispCnt
	movs r0, #0x40
	strh r0, [r1]
	ldr r1, _0805B9F8 @ =gUnknown_03001954
	movs r0, #0
	strb r0, [r1]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r1, _0805B9FC @ =gUnknown_03002260
	ldr r0, _0805BA00 @ =gUnknown_080D5CE4
	str r0, [r1]
	ldr r1, _0805BA04 @ =gUnknown_03002794
	ldr r0, _0805BA08 @ =gUnknown_080F40D4
	str r0, [r1]
	ldr r1, _0805BA0C @ =gUnknown_030054D4
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	movs r0, #1
	bl sub_805BA10
	pop {r0}
	bx r0
	.align 2, 0
_0805B9F0: .4byte gFlags
_0805B9F4: .4byte gDispCnt
_0805B9F8: .4byte gUnknown_03001954
_0805B9FC: .4byte gUnknown_03002260
_0805BA00: .4byte gMapHeaders
_0805BA04: .4byte gUnknown_03002794
_0805BA08: .4byte gUnknown_080F40D4
_0805BA0C: .4byte gUnknown_030054D4

@;multiplayer communication error
	thumb_func_start sub_805BA10
sub_805BA10: @ 0x0805BA10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _0805BBD4 @ =gDispCnt
	movs r2, #0xc5
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0805BBD8 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _0805BBDC @ =0x00000803
	strh r0, [r1]
	ldr r1, _0805BBE0 @ =gBgScrollRegs
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	strh r4, [r1, #2]
	ldr r1, _0805BBE4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	movs r0, #0x31
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	ldr r1, _0805BBE8 @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r0, _0805BBEC @ =sub_805BC40
	movs r1, #0x87
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov ip, r0
	ldr r6, _0805BBF0 @ =IWRAM_START + 0x203
	adds r0, r1, r6
	mov r2, sb
	strb r2, [r0]
	subs r6, #3
	adds r2, r1, r6
	movs r0, #0x78
	strh r0, [r2]
	ldr r0, _0805BBF4 @ =IWRAM_START + 0x1FC
	adds r1, r1, r0
	str r4, [r1]
	movs r1, #0
	movs r3, #0
	ldr r0, _0805BBF8 @ =gUnknown_030055B8
	ldrb r2, [r0]
	movs r4, #1
_0805BA94:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _0805BAA4
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_0805BAA4:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0805BA94
	ldr r0, _0805BBFC @ =0x00000206
	add r0, ip
	movs r2, #0
	strb r3, [r0]
	movs r7, #0x80
	lsls r7, r7, #1
	add r7, ip
	movs r3, #0x78
	strh r3, [r7, #0x16]
	movs r0, #0x8c
	strh r0, [r7, #0x18]
	ldr r0, _0805BC00 @ =0x06010000
	str r0, [r7, #4]
	movs r1, #0xf0
	lsls r1, r1, #2
	strh r1, [r7, #0x1a]
	strh r2, [r7, #8]
	ldr r0, _0805BC04 @ =0x00000432
	strh r0, [r7, #0xa]
	mov r1, sb
	adds r1, #6
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	strb r1, [r0]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r1, _0805BC08 @ =0x00000121
	add r1, ip
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0x23
	add r0, ip
	movs r5, #0x10
	strb r5, [r0]
	ldr r0, _0805BC0C @ =0x00000125
	add r0, ip
	movs r6, #0
	strb r6, [r0]
	movs r4, #0x80
	lsls r4, r4, #6
	str r4, [r7, #0x10]
	mov r7, ip
	adds r7, #0xd0
	strh r3, [r7, #0x16]
	movs r0, #0x24
	strh r0, [r7, #0x18]
	ldr r0, _0805BC10 @ =0x06012000
	str r0, [r7, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	ldr r1, _0805BC14 @ =gUnknown_080D9088
	mov r8, r1
	mov r6, sb
	lsls r0, r6, #1
	add r0, r8
	ldrh r0, [r0]
	mov r8, r0
	strh r0, [r7, #0xa]
	ldr r0, _0805BC18 @ =gUnknown_080D908C
	add r0, sb
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0xf0
	strb r1, [r0]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	movs r0, #0xf1
	add r0, ip
	movs r6, #1
	rsbs r6, r6, #0
	strb r6, [r0]
	mov r0, ip
	adds r0, #0xf2
	strb r5, [r0]
	movs r6, #0xf5
	add r6, ip
	movs r0, #0
	strb r0, [r6]
	str r4, [r7, #0x10]
	subs r7, #0x30
	strh r3, [r7, #0x16]
	strh r3, [r7, #0x18]
	ldr r0, _0805BC1C @ =0x06014000
	str r0, [r7, #4]
	movs r6, #0xf0
	lsls r6, r6, #2
	strh r6, [r7, #0x1a]
	strh r2, [r7, #8]
	mov r0, r8
	strh r0, [r7, #0xa]
	mov r0, ip
	adds r0, #0xc0
	strb r1, [r0]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	mov r1, ip
	adds r1, #0xc1
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0xc2
	strb r5, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	str r4, [r7, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r6, ip
	str r0, [r6, #4]
	strh r2, [r6, #0xa]
	ldr r0, _0805BC20 @ =0x06004000
	str r0, [r6, #0xc]
	strh r2, [r6, #0x18]
	strh r2, [r6, #0x1a]
	strh r2, [r6, #0x1e]
	strh r2, [r6, #0x20]
	strh r2, [r6, #0x22]
	strh r2, [r6, #0x24]
	movs r0, #0x1e
	strh r0, [r6, #0x26]
	movs r0, #0x14
	strh r0, [r6, #0x28]
	mov r0, ip
	adds r0, #0x2a
	strb r1, [r0]
	strh r2, [r6, #0x2e]
	movs r0, #0x73
	strh r0, [r6, #0x1c]
	mov r0, ip
	bl sub_8002A3C
	bl m4aMPlayAllStop
	mov r0, sb
	cmp r0, #0
	beq _0805BC24
	movs r0, #0xcf
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _0805BC2A
	.align 2, 0
_0805BBD4: .4byte gDispCnt
_0805BBD8: .4byte gBgCntRegs
_0805BBDC: .4byte 0x00000803
_0805BBE0: .4byte gBgScrollRegs
_0805BBE4: .4byte gWinRegs
_0805BBE8: .4byte gBldRegs
_0805BBEC: .4byte sub_805BC40
_0805BBF0: .4byte IWRAM_START + 0x203
_0805BBF4: .4byte IWRAM_START + 0x1FC
_0805BBF8: .4byte gUnknown_030055B8
_0805BBFC: .4byte 0x00000206
_0805BC00: .4byte 0x06010000
_0805BC04: .4byte 0x00000432
_0805BC08: .4byte 0x00000121
_0805BC0C: .4byte 0x00000125
_0805BC10: .4byte 0x06012000
_0805BC14: .4byte gUnknown_080D9088
_0805BC18: .4byte gUnknown_080D908C
_0805BC1C: .4byte 0x06014000
_0805BC20: .4byte 0x06004000
_0805BC24:
	ldr r0, _0805BC3C @ =0x0000019D
	bl m4aSongNumStart
_0805BC2A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC3C: .4byte 0x0000019D

	thumb_func_start sub_805BC40
sub_805BC40: @ 0x0805BC40
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805BCB0 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r5, r0
	adds r0, #0xa0
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	ldr r1, _0805BCB4 @ =IWRAM_START + 0x203
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BCD0
	ldr r2, _0805BCB8 @ =IWRAM_START + 0x206
	adds r0, r5, r2
	ldrb r3, [r0]
	ldr r0, _0805BCBC @ =IWRAM_START + 0xD0
	adds r4, r5, r0
	ldr r2, _0805BCC0 @ =gUnknown_080D9090
	ldr r0, _0805BCC4 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	adds r0, #7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	ldrb r0, [r1, #6]
	adds r0, #7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	adds r0, r0, r3
	subs r0, #2
	ldr r2, _0805BCC8 @ =IWRAM_START + 0xF0
	adds r1, r5, r2
	strb r0, [r1]
	ldr r0, _0805BCCC @ =IWRAM_START + 0xF1
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	b _0805BD06
	.align 2, 0
_0805BCB0: .4byte gCurTask
_0805BCB4: .4byte IWRAM_START + 0x203
_0805BCB8: .4byte IWRAM_START + 0x206
_0805BCBC: .4byte IWRAM_START + 0xD0
_0805BCC0: .4byte gUnknown_080D9090
_0805BCC4: .4byte gLoadedSaveGame
_0805BCC8: .4byte IWRAM_START + 0xF0
_0805BCCC: .4byte IWRAM_START + 0xF1
_0805BCD0:
	ldr r1, _0805BD38 @ =IWRAM_START + 0xD0
	adds r4, r5, r1
	ldr r2, _0805BD3C @ =gUnknown_080D9090
	ldr r0, _0805BD40 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldrb r0, [r1, #6]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	ldrb r0, [r1, #6]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	ldr r2, _0805BD44 @ =IWRAM_START + 0xF0
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _0805BD48 @ =IWRAM_START + 0xF1
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805BD06:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r7, r1
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrh r0, [r1]
	adds r6, r0, #0
	cmp r6, #0
	beq _0805BD50
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0805BD4C @ =gBldRegs
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _0805BDD8
	subs r0, #1
	strh r0, [r1, #4]
	b _0805BDD8
	.align 2, 0
_0805BD38: .4byte IWRAM_START + 0xD0
_0805BD3C: .4byte gUnknown_080D9090
_0805BD40: .4byte gLoadedSaveGame
_0805BD44: .4byte IWRAM_START + 0xF0
_0805BD48: .4byte IWRAM_START + 0xF1
_0805BD4C: .4byte gBldRegs
_0805BD50:
	ldr r1, _0805BD60 @ =gBldRegs
	ldrh r0, [r1, #4]
	adds r5, r0, #0
	cmp r5, #0x10
	beq _0805BD64
	adds r0, #1
	strh r0, [r1, #4]
	b _0805BDD8
	.align 2, 0
_0805BD60: .4byte gBldRegs
_0805BD64:
	ldr r1, _0805BD9C @ =0x00000203
	adds r0, r7, r1
	ldrb r4, [r0]
	ldr r1, _0805BDA0 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805BDA4 @ =gUnknown_03002AE4
	ldr r0, _0805BDA8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805BDAC @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _0805BDB0 @ =gUnknown_03004D5C
	ldr r0, _0805BDB4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	cmp r4, #0
	bne _0805BDC0
	ldr r0, _0805BDB8 @ =gSelectedCharacter
	ldrb r0, [r0]
	ldr r1, _0805BDBC @ =gUnknown_03005594
	ldrb r1, [r1]
	ands r5, r1
	adds r1, r5, #0
	bl sub_803143C
	b _0805BDD8
	.align 2, 0
_0805BD9C: .4byte 0x00000203
_0805BDA0: .4byte 0x0000FFFF
_0805BDA4: .4byte gUnknown_03002AE4
_0805BDA8: .4byte gUnknown_0300287C
_0805BDAC: .4byte gUnknown_03005390
_0805BDB0: .4byte gUnknown_03004D5C
_0805BDB4: .4byte gUnknown_03002A84
_0805BDB8: .4byte gSelectedCharacter
_0805BDBC: .4byte gUnknown_03005594
_0805BDC0:
	ldr r0, _0805BDE0 @ =gUnknown_03001954
	strb r6, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r1, _0805BDE4 @ =gUnknown_03002260
	ldr r0, _0805BDE8 @ =gMapHeaders
	str r0, [r1]
	bl CreateTitleScreenAndSkipIntro
_0805BDD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BDE0: .4byte gUnknown_03001954
_0805BDE4: .4byte gUnknown_03002260
_0805BDE8: .4byte gMapHeaders

@; MultiplayerCharactersSelected
	thumb_func_start sub_805BDEC
sub_805BDEC: @ 0x0805BDEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r0, _0805BE8C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	ldr r0, _0805BE90 @ =gWinRegs
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0, #6]
	ldr r0, _0805BE94 @ =gDispCnt
	movs r3, #0x40
	strh r3, [r0]
	ldr r1, _0805BE98 @ =gBgCntRegs
	ldr r0, _0805BE9C @ =0x00005E0B
	strh r0, [r1, #6]
	ldr r0, _0805BEA0 @ =gBldRegs
	mov r1, r8
	strh r1, [r0]
	strh r1, [r0, #4]
	ldr r0, _0805BEA4 @ =gUnknown_030054D4
	strb r2, [r0, #3]
	strb r2, [r0, #2]
	strb r2, [r0, #1]
	strb r2, [r0]
	ldr r0, _0805BEA8 @ =gUnknown_03004D80
	strb r2, [r0, #3]
	ldr r0, _0805BEAC @ =gUnknown_03002280
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	movs r1, #0xff
	strb r1, [r0, #0xe]
	strb r3, [r0, #0xf]
	mov r2, r8
	str r2, [sp, #4]
	ldr r1, _0805BEB0 @ =0x040000D4
	add r3, sp, #4
	str r3, [r1]
	ldr r0, _0805BEB4 @ =0x06009FE0
	str r0, [r1, #4]
	ldr r0, _0805BEB8 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0805BEBC @ =sub_805C0F0
	movs r1, #0x82
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #6
	mov r3, r8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _0805BEC0 @ =IWRAM_START + 0x200
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	movs r6, #0
	ldr r2, _0805BEC4 @ =gUnknown_030055B8
	ldrb r0, [r2]
	movs r1, #1
	b _0805BED2
	.align 2, 0
_0805BE8C: .4byte gLoadedSaveGame
_0805BE90: .4byte gWinRegs
_0805BE94: .4byte gDispCnt
_0805BE98: .4byte gBgCntRegs
_0805BE9C: .4byte 0x00005E0B
_0805BEA0: .4byte gBldRegs
_0805BEA4: .4byte gUnknown_030054D4
_0805BEA8: .4byte gUnknown_03004D80
_0805BEAC: .4byte gUnknown_03002280
_0805BEB0: .4byte 0x040000D4
_0805BEB4: .4byte 0x06009FE0
_0805BEB8: .4byte 0x85000010
_0805BEBC: .4byte sub_805C0F0
_0805BEC0: .4byte IWRAM_START + 0x200
_0805BEC4: .4byte gUnknown_030055B8
_0805BEC8:
	adds r6, #1
	cmp r6, #3
	bhi _0805BED8
	ldrb r0, [r2]
	asrs r0, r6
_0805BED2:
	ands r0, r1
	cmp r0, #0
	bne _0805BEC8
_0805BED8:
	ldr r3, _0805BEFC @ =0x00000202
	adds r0, r5, r3
	strb r6, [r0]
	ldr r1, _0805BF00 @ =0x00000203
	adds r0, r5, r1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _0805BF04
	movs r0, #0x81
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xde
	strb r0, [r1]
	b _0805BF10
	.align 2, 0
_0805BEFC: .4byte 0x00000202
_0805BF00: .4byte 0x00000203
_0805BF04:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r5, r1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
_0805BF10:
	ldr r0, _0805BFD8 @ =0x06008000
	str r0, [r5, #4]
	movs r3, #0
	movs r1, #0
	strh r1, [r5, #0xa]
	ldr r0, _0805BFDC @ =0x0600F000
	str r0, [r5, #0xc]
	strh r1, [r5, #0x18]
	strh r1, [r5, #0x1a]
	ldr r2, _0805BFE0 @ =gUnknown_080D92A8
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
	strh r1, [r5, #0x1e]
	strh r1, [r5, #0x20]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r0, #0x1e
	strh r0, [r5, #0x26]
	movs r0, #0x20
	strh r0, [r5, #0x28]
	adds r0, r5, #0
	adds r0, #0x2a
	strb r3, [r0]
	movs r0, #3
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl sub_8002A3C
	mov r3, r8
	cmp r3, #3
	bhi _0805BF7A
	ldr r2, _0805BFE4 @ =gUnknown_030054B4
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0805BF7A
_0805BF64:
	movs r0, #1
	add r8, r0
	mov r3, r8
	cmp r3, #3
	bhi _0805BF7A
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _0805BF64
_0805BF7A:
	movs r6, #0
	movs r7, #0
	ldr r1, _0805BFE8 @ =gUnknown_080D9100
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0
	mov sl, r0
	mov sb, r0
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #0xc]
_0805BF94:
	ldr r0, _0805BFEC @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0805BFA4
	b _0805C0B0
_0805BFA4:
	mov r0, sl
	adds r0, #0x80
	adds r2, r5, r0
	movs r0, #0xc8
	strh r0, [r2, #0x16]
	mov r0, sb
	adds r0, #0x33
	strh r0, [r2, #0x18]
	lsls r0, r6, #0xb
	ldr r3, _0805BFF0 @ =0x06010000
	adds r0, r0, r3
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r7, [r2, #8]
	ldr r0, _0805BFE4 @ =gUnknown_030054B4
	adds r0, r6, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #5
	bne _0805BFF4
	ldrh r0, [r4, #0xc]
	strh r0, [r2, #0xa]
	ldrb r1, [r4, #0xe]
	b _0805BFFE
	.align 2, 0
_0805BFD8: .4byte 0x06008000
_0805BFDC: .4byte 0x0600F000
_0805BFE0: .4byte gUnknown_080D92A8
_0805BFE4: .4byte gUnknown_030054B4
_0805BFE8: .4byte gUnknown_080D9100
_0805BFEC: .4byte gUnknown_030055B8
_0805BFF0: .4byte 0x06010000
_0805BFF4:
	cmp r1, #4
	bne _0805C006
	ldrh r0, [r4, #0x14]
	strh r0, [r2, #0xa]
	ldrb r1, [r4, #0x16]
_0805BFFE:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0805C02E
_0805C006:
	mov r0, r8
	cmp r0, #2
	beq _0805C014
	ldr r0, _0805C01C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _0805C020
_0805C014:
	ldrh r0, [r4, #4]
	strh r0, [r2, #0xa]
	ldrb r0, [r4, #6]
	b _0805C026
	.align 2, 0
_0805C01C: .4byte gGameMode
_0805C020:
	ldrh r0, [r4, #0x1c]
	strh r0, [r2, #0xa]
	ldrb r0, [r4, #0x1e]
_0805C026:
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x20
	strb r0, [r1]
_0805C02E:
	strh r7, [r2, #0x14]
	strh r7, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	movs r3, #0xff
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r7, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, sl
	adds r2, r5, r0
	strh r7, [r2, #0x16]
	mov r0, sb
	adds r0, #0x1f
	strh r0, [r2, #0x18]
	ldr r1, [sp, #0xc]
	ldr r3, _0805C0E8 @ =0x06010000
	adds r0, r1, r3
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r7, [r2, #8]
	ldr r0, _0805C0EC @ =gUnknown_080D9288
	lsls r1, r6, #3
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	strh r7, [r2, #0x14]
	strh r7, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	movs r3, #0xff
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r7, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	str r3, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
_0805C0B0:
	movs r0, #0x30
	add sl, r0
	movs r1, #0x20
	add sb, r1
	ldr r2, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #0xc]
	adds r6, #1
	cmp r6, #3
	bhi _0805C0CA
	b _0805BF94
_0805C0CA:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0805C0D6
	movs r0, #0x3b
	bl m4aSongNumStart
_0805C0D6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C0E8: .4byte 0x06010000
_0805C0EC: .4byte gUnknown_080D9288

	thumb_func_start sub_805C0F0
sub_805C0F0: @ 0x0805C0F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0805C168 @ =gUnknown_03001884
	ldr r3, [r0]
	ldr r2, _0805C16C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0805C170 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805C1B0
	movs r5, #0
	ldr r0, _0805C174 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov sl, r0
	cmp r1, #0
	beq _0805C1B0
	movs r6, #1
	ldr r2, _0805C178 @ =gUnknown_030054D4
_0805C12A:
	ldr r1, _0805C17C @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r5
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805C198
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805C19C
	movs r0, #0
	ldr r1, _0805C180 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805C184 @ =gUnknown_03002AE4
	ldr r0, _0805C188 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805C18C @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0805C190 @ =gUnknown_03004D5C
	ldr r0, _0805C194 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805C2FA
	.align 2, 0
_0805C168: .4byte gUnknown_03001884
_0805C16C: .4byte gDispCnt
_0805C170: .4byte gGameMode
_0805C174: .4byte gUnknown_030055B8
_0805C178: .4byte gUnknown_030054D4
_0805C17C: .4byte gMultiSioStatusFlags
_0805C180: .4byte 0x0000FFFF
_0805C184: .4byte gUnknown_03002AE4
_0805C188: .4byte gUnknown_0300287C
_0805C18C: .4byte gUnknown_03005390
_0805C190: .4byte gUnknown_03004D5C
_0805C194: .4byte gUnknown_03002A84
_0805C198:
	movs r0, #0
	strb r0, [r2]
_0805C19C:
	adds r2, #1
	adds r5, #1
	cmp r5, #3
	bhi _0805C1B0
	mov r1, sl
	ldrb r0, [r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, #0
	bne _0805C12A
_0805C1B0:
	ldr r0, _0805C1E0 @ =gCurTask
	ldr r5, [r0]
	ldrh r6, [r5, #6]
	ldr r2, _0805C1E4 @ =IWRAM_START + 0x200
	adds r4, r6, r2
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r1, [r4]
	adds r2, r0, r1
	strh r2, [r4]
	lsls r1, r2, #0x10
	movs r0, #0xf0
	lsls r0, r0, #0x18
	cmp r1, r0
	bls _0805C1EC
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0805C1E8 @ =sub_805C30C
	str r0, [r5, #8]
	bl _call_via_r0
	b _0805C2FA
	.align 2, 0
_0805C1E0: .4byte gCurTask
_0805C1E4: .4byte IWRAM_START + 0x200
_0805C1E8: .4byte sub_805C30C
_0805C1EC:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r1, _0805C264 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0805C268 @ =gUnknown_03002878
	ldr r0, _0805C26C @ =0x0400001C
	str r0, [r1]
	ldr r0, _0805C270 @ =gUnknown_03002A80
	strb r2, [r0]
	movs r1, #0
	movs r4, #0
	ldr r2, _0805C274 @ =gUnknown_030055B8
	mov sl, r2
	movs r5, #0
	ldr r0, _0805C278 @ =IWRAM_START + 0x204
	adds r2, r6, r0
_0805C214:
	strh r5, [r3]
	adds r3, #2
	ldrb r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r4, #0x1f
	bls _0805C214
	movs r4, #0
	movs r2, #1
	mov sb, r2
	ldr r6, _0805C27C @ =gUnknown_03005500
	mov r8, r6
_0805C234:
	mov r2, sl
	ldrb r0, [r2]
	asrs r0, r4
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	bne _0805C280
	movs r2, #0
	adds r7, r4, #1
	adds r5, r1, #0
	adds r5, #0x20
	movs r4, #0
	movs r0, #0xc0
	subs r1, r0, r1
_0805C250:
	strh r4, [r3]
	adds r3, #2
	strh r1, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _0805C250
	b _0805C2F0
	.align 2, 0
_0805C264: .4byte gFlags
_0805C268: .4byte gUnknown_03002878
_0805C26C: .4byte 0x0400001C
_0805C270: .4byte gUnknown_03002A80
_0805C274: .4byte gUnknown_030055B8
_0805C278: .4byte IWRAM_START + 0x204
_0805C27C: .4byte gUnknown_03005500
_0805C280:
	adds r0, r4, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0805C2C2
	movs r2, #0
	adds r7, r4, #1
	adds r5, r1, #0
	adds r5, #0x20
	lsls r1, r1, #0x10
	movs r0, #0xf0
	mov r6, ip
	subs r6, r0, r6
	str r6, [sp]
	add r4, r8
	asrs r1, r1, #0x10
_0805C2A0:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #5
	adds r0, #0x20
	subs r0, r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _0805C2A0
	b _0805C2F0
_0805C2C2:
	movs r2, #0
	adds r7, r4, #1
	adds r5, r1, #0
	adds r5, #0x20
	lsls r1, r1, #0x10
	mov r6, ip
	subs r6, #0xf0
	add r4, r8
	asrs r1, r1, #0x10
_0805C2D4:
	strh r6, [r3]
	adds r3, #2
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #5
	adds r0, #0x20
	subs r0, r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _0805C2D4
_0805C2F0:
	lsls r0, r5, #0x10
	lsrs r1, r0, #0x10
	adds r4, r7, #0
	cmp r4, #3
	bls _0805C234
_0805C2FA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_805C30C
sub_805C30C: @ 0x0805C30C
	push {r4, lr}
	ldr r0, _0805C33C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	movs r4, #0
	ldr r1, _0805C340 @ =IWRAM_START + 0x203
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805C348
	ldr r0, _0805C344 @ =IWRAM_START + 0x200
	adds r2, r2, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0805C35C
	b _0805C360
	.align 2, 0
_0805C33C: .4byte gCurTask
_0805C340: .4byte IWRAM_START + 0x203
_0805C344: .4byte IWRAM_START + 0x200
_0805C348:
	ldr r1, _0805C3A0 @ =IWRAM_START + 0x200
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x3c
	bls _0805C35C
	movs r4, #1
_0805C35C:
	cmp r4, #0
	beq _0805C3C0
_0805C360:
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0805C3A4 @ =gBldRegs
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0805C3A8 @ =gMPlayInfo_BGM
	movs r1, #0
	bl m4aMPlayFadeOut
	ldr r0, _0805C3AC @ =gMPlayInfo_SE1
	movs r1, #0
	bl m4aMPlayFadeOut
	ldr r0, _0805C3B0 @ =gMPlayInfo_SE2
	movs r1, #0
	bl m4aMPlayFadeOut
	ldr r0, _0805C3B4 @ =gMPlayInfo_SE3
	movs r1, #0
	bl m4aMPlayFadeOut
	ldr r0, _0805C3B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805C3BC @ =sub_805C3D0
	str r0, [r1, #8]
	bl _call_via_r0
	b _0805C3C8
	.align 2, 0
_0805C3A0: .4byte IWRAM_START + 0x200
_0805C3A4: .4byte gBldRegs
_0805C3A8: .4byte gMPlayInfo_BGM
_0805C3AC: .4byte gMPlayInfo_SE1
_0805C3B0: .4byte gMPlayInfo_SE2
_0805C3B4: .4byte gMPlayInfo_SE3
_0805C3B8: .4byte gCurTask
_0805C3BC: .4byte sub_805C3D0
_0805C3C0:
	bl sub_805C69C
	bl sub_805C504
_0805C3C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_805C3D0
sub_805C3D0: @ 0x0805C3D0
	push {r4, r5, r6, lr}
	ldr r0, _0805C438 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	ldr r0, _0805C43C @ =IWRAM_START + 0x200
	adds r4, r5, r0
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	bhi _0805C3F6
	b _0805C4EE
_0805C3F6:
	strh r1, [r4]
	ldr r1, _0805C440 @ =gBldRegs
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r2, _0805C444 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _0805C448 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805C44C @ =gUnknown_03002AE4
	ldr r0, _0805C450 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805C454 @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _0805C458 @ =gUnknown_03004D5C
	ldr r0, _0805C45C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805C460 @ =IWRAM_START + 0x203
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805C464
	bl sub_8087400
	b _0805C4FA
	.align 2, 0
_0805C438: .4byte gCurTask
_0805C43C: .4byte IWRAM_START + 0x200
_0805C440: .4byte gBldRegs
_0805C444: .4byte gFlags
_0805C448: .4byte 0x0000FFFF
_0805C44C: .4byte gUnknown_03002AE4
_0805C450: .4byte gUnknown_0300287C
_0805C454: .4byte gUnknown_03005390
_0805C458: .4byte gUnknown_03004D5C
_0805C45C: .4byte gUnknown_03002A84
_0805C460: .4byte IWRAM_START + 0x203
_0805C464:
	ldr r0, _0805C49C @ =gGameMode
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #3
	bne _0805C4A8
	movs r2, #0
	ldr r3, _0805C4A0 @ =gUnknown_030055B8
	ldrb r0, [r3]
	movs r1, #1
	ands r0, r1
	ldr r4, _0805C4A4 @ =gUnknown_030054D8
	cmp r0, #0
	beq _0805C492
_0805C47E:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0805C492
	ldrb r0, [r3]
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	bne _0805C47E
_0805C492:
	movs r0, #3
	strb r0, [r5]
	ldrb r1, [r4]
	b _0805C4E4
	.align 2, 0
_0805C49C: .4byte gGameMode
_0805C4A0: .4byte gUnknown_030055B8
_0805C4A4: .4byte gUnknown_030054D8
_0805C4A8:
	ldr r2, _0805C4CC @ =gLoadedSaveGame
	ldr r3, _0805C4D0 @ =gSelectedCharacter
	cmp r1, #0
	bne _0805C4D8
	ldr r0, [r2]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805C4D8
	ldr r0, _0805C4D4 @ =gCurrentLevel
	strb r6, [r0]
	bl sub_801A770
	b _0805C4FA
	.align 2, 0
_0805C4CC: .4byte gLoadedSaveGame
_0805C4D0: .4byte gSelectedCharacter
_0805C4D4: .4byte gCurrentLevel
_0805C4D8:
	ldr r0, [r2]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, #7
	adds r0, r0, r1
	ldrb r1, [r0]
_0805C4E4:
	movs r0, #0
	movs r2, #0
	bl sub_80346C8
	b _0805C4FA
_0805C4EE:
	bl sub_805C504
	ldr r1, _0805C500 @ =gBldRegs
	ldrh r0, [r4]
	lsrs r0, r0, #8
	strh r0, [r1, #4]
_0805C4FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C500: .4byte gBldRegs

	thumb_func_start sub_805C504
sub_805C504: @ 0x0805C504
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0805C568 @ =gUnknown_03001884
	ldr r5, [r0]
	ldr r0, _0805C56C @ =gGameMode
	ldrb r0, [r0]
	ldr r1, _0805C570 @ =gUnknown_030055B8
	mov r8, r1
	cmp r0, #2
	bls _0805C5AC
	movs r3, #0
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C5AC
	movs r6, #1
	ldr r2, _0805C574 @ =gUnknown_030054D4
_0805C52A:
	ldr r1, _0805C578 @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805C594
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805C598
	movs r0, #0
	ldr r1, _0805C57C @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805C580 @ =gUnknown_03002AE4
	ldr r0, _0805C584 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805C588 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0805C58C @ =gUnknown_03004D5C
	ldr r0, _0805C590 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805C692
	.align 2, 0
_0805C568: .4byte gUnknown_03001884
_0805C56C: .4byte gGameMode
_0805C570: .4byte gUnknown_030055B8
_0805C574: .4byte gUnknown_030054D4
_0805C578: .4byte gMultiSioStatusFlags
_0805C57C: .4byte 0x0000FFFF
_0805C580: .4byte gUnknown_03002AE4
_0805C584: .4byte gUnknown_0300287C
_0805C588: .4byte gUnknown_03005390
_0805C58C: .4byte gUnknown_03004D5C
_0805C590: .4byte gUnknown_03002A84
_0805C594:
	movs r0, #0
	strb r0, [r2]
_0805C598:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805C5AC
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	bne _0805C52A
_0805C5AC:
	ldr r0, _0805C614 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	ldr r2, _0805C618 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0805C61C @ =gUnknown_03002878
	ldr r0, _0805C620 @ =0x0400001E
	str r0, [r1]
	ldr r1, _0805C624 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	movs r4, #0
	movs r2, #0
	ldr r0, _0805C628 @ =IWRAM_START + 0x204
	adds r3, r3, r0
_0805C5D0:
	ldrb r0, [r3]
	strh r0, [r5]
	adds r5, #2
	adds r2, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0x1f
	bls _0805C5D0
	movs r2, #0
	movs r1, #1
	mov ip, r1
	ldr r7, _0805C62C @ =gUnknown_03005500
_0805C5EA:
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r2
	mov r1, ip
	ands r0, r1
	cmp r0, #0
	bne _0805C630
	movs r1, #0
	adds r6, r2, #1
	adds r3, r4, #0
	adds r3, #0x20
	movs r0, #0xc0
	subs r2, r0, r4
_0805C604:
	strh r2, [r5]
	adds r5, #2
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _0805C604
	b _0805C688
	.align 2, 0
_0805C614: .4byte gCurTask
_0805C618: .4byte gFlags
_0805C61C: .4byte gUnknown_03002878
_0805C620: .4byte 0x0400001E
_0805C624: .4byte gUnknown_03002A80
_0805C628: .4byte IWRAM_START + 0x204
_0805C62C: .4byte gUnknown_03005500
_0805C630:
	adds r0, r2, #0
	mov r1, ip
	ands r0, r1
	cmp r0, #0
	beq _0805C662
	movs r1, #0
	adds r6, r2, #1
	adds r3, r4, #0
	adds r3, #0x20
	lsls r0, r4, #0x10
	adds r4, r2, r7
	asrs r2, r0, #0x10
_0805C648:
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #5
	adds r0, #0x20
	subs r0, r0, r2
	strh r0, [r5]
	adds r5, #2
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _0805C648
	b _0805C688
_0805C662:
	movs r1, #0
	adds r6, r2, #1
	adds r3, r4, #0
	adds r3, #0x20
	lsls r0, r4, #0x10
	adds r4, r2, r7
	asrs r2, r0, #0x10
_0805C670:
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #5
	adds r0, #0x20
	subs r0, r0, r2
	strh r0, [r5]
	adds r5, #2
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _0805C670
_0805C688:
	lsls r0, r3, #0x10
	lsrs r4, r0, #0x10
	adds r2, r6, #0
	cmp r2, #3
	bls _0805C5EA
_0805C692:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805C69C
sub_805C69C: @ 0x0805C69C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805C6F8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805C736
	movs r3, #0
	ldr r0, _0805C6FC @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0805C736
	movs r5, #1
	ldr r2, _0805C700 @ =gUnknown_030054D4
_0805C6BA:
	ldr r1, _0805C704 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805C720
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805C724
	movs r0, #0
	ldr r1, _0805C708 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805C70C @ =gUnknown_03002AE4
	ldr r0, _0805C710 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805C714 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0805C718 @ =gUnknown_03004D5C
	ldr r0, _0805C71C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805C778
	.align 2, 0
_0805C6F8: .4byte gGameMode
_0805C6FC: .4byte gUnknown_030055B8
_0805C700: .4byte gUnknown_030054D4
_0805C704: .4byte gMultiSioStatusFlags
_0805C708: .4byte 0x0000FFFF
_0805C70C: .4byte gUnknown_03002AE4
_0805C710: .4byte gUnknown_0300287C
_0805C714: .4byte gUnknown_03005390
_0805C718: .4byte gUnknown_03004D5C
_0805C71C: .4byte gUnknown_03002A84
_0805C720:
	movs r0, #0
	strb r0, [r2]
_0805C724:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805C736
	ldrb r0, [r6]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0805C6BA
_0805C736:
	ldr r0, _0805C780 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r5, #0
	movs r7, #0x80
	movs r6, #0xa0
	lsls r6, r6, #1
_0805C74A:
	ldr r0, _0805C784 @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C76E
	adds r0, r4, r6
	bl sub_80051E8
	ldr r1, _0805C788 @ =0x00000203
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805C76E
	adds r0, r4, r7
	bl sub_80051E8
_0805C76E:
	adds r7, #0x30
	adds r6, #0x30
	adds r5, #1
	cmp r5, #3
	bls _0805C74A
_0805C778:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C780: .4byte gCurTask
_0805C784: .4byte gUnknown_030055B8
_0805C788: .4byte 0x00000203

@; CreateTeamPlayChoiceScreen
	thumb_func_start sub_805C78C
sub_805C78C: @ 0x0805C78C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r0, _0805CA9C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	mov sl, r0
	cmp r0, #6
	bls _0805C7A8
	movs r0, #1
	mov sl, r0
_0805C7A8:
	movs r4, #0
	str r4, [sp, #4]
	ldr r0, _0805CAA0 @ =0x040000D4
	add r1, sp, #4
	str r1, [r0]
	ldr r1, _0805CAA4 @ =gMultiSioSend
	str r1, [r0, #4]
	ldr r1, _0805CAA8 @ =0x85000005
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [sp, #4]
	add r2, sp, #4
	str r2, [r0]
	ldr r1, _0805CAAC @ =gMultiSioRecv
	str r1, [r0, #4]
	ldr r1, _0805CAB0 @ =0x85000014
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0805CAB4 @ =gUnknown_030054D4
	strb r4, [r0, #3]
	strb r4, [r0, #2]
	strb r4, [r0, #1]
	strb r4, [r0]
	ldr r1, _0805CAB8 @ =gDispCnt
	movs r0, #0xda
	lsls r0, r0, #5
	strh r0, [r1]
	ldr r1, _0805CABC @ =gBgCntRegs
	movs r5, #0
	ldr r0, _0805CAC0 @ =0x00001E0D
	strh r0, [r1, #6]
	ldr r0, _0805CAC4 @ =0x00009608
	strh r0, [r1, #4]
	ldr r0, _0805CAC8 @ =0x00008E06
	strh r0, [r1, #2]
	ldr r0, _0805CACC @ =0x00008603
	strh r0, [r1]
	ldr r0, _0805CAD0 @ =gBgScrollRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	ldr r0, _0805CAD4 @ =gUnknown_03004D80
	strb r5, [r0, #2]
	ldr r1, _0805CAD8 @ =gUnknown_03002280
	strb r5, [r1, #8]
	strb r5, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	strb r0, [r1, #0xb]
	ldr r0, _0805CADC @ =sub_805CB34
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0xc0
	lsls r2, r2, #6
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r3, _0805CAE0 @ =IWRAM_START + 0x310
	adds r1, r0, r3
	strh r4, [r1]
	ldr r2, _0805CAE4 @ =IWRAM_START + 0x312
	adds r1, r0, r2
	strh r4, [r1]
	adds r3, #4
	adds r1, r0, r3
	strh r4, [r1]
	ldr r1, _0805CAE8 @ =IWRAM_START + 0x316
	adds r2, r0, r1
	movs r1, #1
	strb r1, [r2]
	ldr r2, _0805CAEC @ =IWRAM_START + 0x317
	adds r0, r0, r2
	strb r5, [r0]
	ldr r3, _0805CAF0 @ =0x06010000
	mov r0, sl
	lsls r0, r0, #2
	str r0, [sp, #0x28]
	movs r6, #0
	movs r5, #0
_0805C85C:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r2, r7, r0
	strh r5, [r2, #0x16]
	strh r5, [r2, #0x18]
	str r3, [r2, #4]
	ldr r0, _0805CAF4 @ =gUnknown_080D92BC
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	adds r0, r2, #0
	str r3, [sp, #0x30]
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r4, #3
	bls _0805C85C
	movs r4, #0
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r1, r7, r1
	str r1, [sp, #0x14]
	ldr r2, _0805CAF8 @ =0x000001D1
	adds r2, r7, r2
	str r2, [sp, #0x18]
	movs r0, #0xe9
	lsls r0, r0, #1
	adds r0, r7, r0
	str r0, [sp, #0x1c]
	ldr r1, _0805CAFC @ =0x000001D5
	adds r1, r7, r1
	str r1, [sp, #0x20]
	ldr r2, _0805CB00 @ =0x0000023A
	adds r2, r7, r2
	str r2, [sp, #0xc]
	ldr r0, _0805CB04 @ =0x0000027A
	adds r0, r7, r0
	str r0, [sp, #0x24]
	ldr r1, _0805CB08 @ =0x000002BA
	adds r1, r7, r1
	str r1, [sp, #8]
	ldr r2, _0805CB0C @ =0x000002FA
	adds r2, r7, r2
	str r2, [sp, #0x10]
	movs r5, #0
_0805C8FA:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xc0
	adds r2, r7, r0
	strh r5, [r2, #0x16]
	strh r5, [r2, #0x18]
	str r3, [r2, #4]
	ldr r1, [sp, #0x28]
	add r1, sl
	adds r1, r4, r1
	lsls r1, r1, #3
	ldr r0, _0805CB10 @ =gUnknown_080D92DC
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r3, r3, r0
	movs r0, #0xc0
	mov r8, r0
	mov r0, r8
	strh r0, [r2, #0x1a]
	strh r5, [r2, #8]
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	strh r5, [r2, #0x14]
	strh r5, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r2, #0x28]
	str r5, [r2, #0x10]
	adds r0, r2, #0
	str r1, [sp, #0x2c]
	str r3, [sp, #0x30]
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	cmp r4, #4
	bls _0805C8FA
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r2, r7, r0
	movs r0, #0
	mov sl, r0
	movs r4, #0
	strh r4, [r2, #0x16]
	strh r4, [r2, #0x18]
	str r3, [r2, #4]
	mov r3, r8
	strh r3, [r2, #0x1a]
	strh r4, [r2, #8]
	ldr r0, _0805CB14 @ =0x00000434
	strh r0, [r2, #0xa]
	movs r0, #9
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	strh r4, [r2, #0x14]
	strh r4, [r2, #0x1c]
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	mov r3, sb
	orrs r0, r3
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	ldr r0, [sp, #0x1c]
	strb r6, [r0]
	mov r0, sl
	ldr r3, [sp, #0x20]
	strb r0, [r3]
	str r1, [r2, #0x28]
	str r4, [r2, #0x10]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r7, r2
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0805CB18 @ =0x06003000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0x7b
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r5, #0x1e
	strh r5, [r1, #0x26]
	movs r0, #0x14
	strh r0, [r1, #0x28]
	mov r0, sl
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	strh r4, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	movs r2, #0x94
	lsls r2, r2, #2
	adds r1, r7, r2
	ldr r0, _0805CB1C @ =0x06004000
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0805CB20 @ =0x06007000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0x7a
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	strh r5, [r1, #0x26]
	movs r0, #0x28
	strh r0, [r1, #0x28]
	mov r0, sl
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	movs r0, #1
	strh r0, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	movs r2, #0xa4
	lsls r2, r2, #2
	adds r1, r7, r2
	ldr r0, _0805CB24 @ =0x06008000
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0805CB28 @ =0x0600B000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0x7c
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	strh r5, [r1, #0x26]
	movs r0, #0xa
	strh r0, [r1, #0x28]
	mov r0, sl
	ldr r3, [sp, #8]
	strb r0, [r3]
	movs r5, #3
	strh r5, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	movs r2, #0xb4
	lsls r2, r2, #2
	adds r1, r7, r2
	ldr r0, _0805CB2C @ =0x0600C000
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0805CB30 @ =0x0600F000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0x7e
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x20
	strh r0, [r1, #0x26]
	strh r0, [r1, #0x28]
	mov r0, sl
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	strh r5, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA9C: .4byte gLoadedSaveGame
_0805CAA0: .4byte 0x040000D4
_0805CAA4: .4byte gMultiSioSend
_0805CAA8: .4byte 0x85000005
_0805CAAC: .4byte gMultiSioRecv
_0805CAB0: .4byte 0x85000014
_0805CAB4: .4byte gUnknown_030054D4
_0805CAB8: .4byte gDispCnt
_0805CABC: .4byte gBgCntRegs
_0805CAC0: .4byte 0x00001E0D
_0805CAC4: .4byte 0x00009608
_0805CAC8: .4byte 0x00008E06
_0805CACC: .4byte 0x00008603
_0805CAD0: .4byte gBgScrollRegs
_0805CAD4: .4byte gUnknown_03004D80
_0805CAD8: .4byte gUnknown_03002280
_0805CADC: .4byte sub_805CB34
_0805CAE0: .4byte IWRAM_START + 0x310
_0805CAE4: .4byte IWRAM_START + 0x312
_0805CAE8: .4byte IWRAM_START + 0x316
_0805CAEC: .4byte IWRAM_START + 0x317
_0805CAF0: .4byte 0x06010000
_0805CAF4: .4byte gUnknown_080D92BC
_0805CAF8: .4byte 0x000001D1
_0805CAFC: .4byte 0x000001D5
_0805CB00: .4byte 0x0000023A
_0805CB04: .4byte 0x0000027A
_0805CB08: .4byte 0x000002BA
_0805CB0C: .4byte 0x000002FA
_0805CB10: .4byte gUnknown_080D92DC
_0805CB14: .4byte 0x00000434
_0805CB18: .4byte 0x06003000
_0805CB1C: .4byte 0x06004000
_0805CB20: .4byte 0x06007000
_0805CB24: .4byte 0x06008000
_0805CB28: .4byte 0x0600B000
_0805CB2C: .4byte 0x0600C000
_0805CB30: .4byte 0x0600F000

	thumb_func_start sub_805CB34
sub_805CB34: @ 0x0805CB34
	push {r4, r5, r6, lr}
	ldr r0, _0805CB90 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805CBCE
	movs r3, #0
	ldr r0, _0805CB94 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0805CBCE
	movs r5, #1
	ldr r2, _0805CB98 @ =gUnknown_030054D4
_0805CB52:
	ldr r1, _0805CB9C @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805CBB8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805CBBC
	movs r0, #0
	ldr r1, _0805CBA0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805CBA4 @ =gUnknown_03002AE4
	ldr r0, _0805CBA8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805CBAC @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0805CBB0 @ =gUnknown_03004D5C
	ldr r0, _0805CBB4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805CC2A
	.align 2, 0
_0805CB90: .4byte gGameMode
_0805CB94: .4byte gUnknown_030055B8
_0805CB98: .4byte gUnknown_030054D4
_0805CB9C: .4byte gMultiSioStatusFlags
_0805CBA0: .4byte 0x0000FFFF
_0805CBA4: .4byte gUnknown_03002AE4
_0805CBA8: .4byte gUnknown_0300287C
_0805CBAC: .4byte gUnknown_03005390
_0805CBB0: .4byte gUnknown_03004D5C
_0805CBB4: .4byte gUnknown_03002A84
_0805CBB8:
	movs r0, #0
	strb r0, [r2]
_0805CBBC:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805CBCE
	ldrb r0, [r6]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0805CB52
_0805CBCE:
	ldr r0, _0805CC04 @ =gCurTask
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0805CC08 @ =gWinRegs
	movs r0, #0x3f
	strh r0, [r2, #0xa]
	ldr r1, _0805CC0C @ =gBldRegs
	ldr r0, _0805CC10 @ =0x00003F48
	strh r0, [r1]
	movs r0, #0x81
	lsls r0, r0, #4
	strh r0, [r1, #2]
	movs r3, #0xa0
	strh r3, [r2, #4]
	ldr r1, _0805CC14 @ =gBgScrollRegs
	ldrh r2, [r1, #6]
	movs r6, #6
	ldrsh r0, [r1, r6]
	cmp r0, #0x9f
	bgt _0805CC18
	adds r0, r2, #4
	strh r0, [r1, #6]
	b _0805CC1E
	.align 2, 0
_0805CC04: .4byte gCurTask
_0805CC08: .4byte gWinRegs
_0805CC0C: .4byte gBldRegs
_0805CC10: .4byte 0x00003F48
_0805CC14: .4byte gBgScrollRegs
_0805CC18:
	strh r3, [r1, #6]
	ldr r0, _0805CC30 @ =sub_805CC34
	str r0, [r4, #8]
_0805CC1E:
	adds r0, r5, #0
	bl sub_805D118
	adds r0, r5, #0
	bl sub_805D644
_0805CC2A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CC30: .4byte sub_805CC34

	thumb_func_start sub_805CC34
sub_805CC34: @ 0x0805CC34
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, _0805CCA4 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0805CCA8 @ =gGameMode
	ldrb r0, [r0]
	ldr r1, _0805CCAC @ =gMultiSioStatusFlags
	mov ip, r1
	cmp r0, #2
	bls _0805CCE6
	movs r5, #0
	ldr r2, _0805CCB0 @ =gUnknown_030055B8
	ldrb r1, [r2]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0805CCE6
	movs r6, #1
	ldr r3, _0805CCB4 @ =gUnknown_030054D4
_0805CC64:
	adds r0, r6, #0
	lsls r0, r5
	mov r1, ip
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805CCD0
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805CCD4
	movs r0, #0
	ldr r1, _0805CCB8 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805CCBC @ =gUnknown_03002AE4
	ldr r0, _0805CCC0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805CCC4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _0805CCC8 @ =gUnknown_03004D5C
	ldr r0, _0805CCCC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805D0FA
	.align 2, 0
_0805CCA4: .4byte gDispCnt
_0805CCA8: .4byte gGameMode
_0805CCAC: .4byte gMultiSioStatusFlags
_0805CCB0: .4byte gUnknown_030055B8
_0805CCB4: .4byte gUnknown_030054D4
_0805CCB8: .4byte 0x0000FFFF
_0805CCBC: .4byte gUnknown_03002AE4
_0805CCC0: .4byte gUnknown_0300287C
_0805CCC4: .4byte gUnknown_03005390
_0805CCC8: .4byte gUnknown_03004D5C
_0805CCCC: .4byte gUnknown_03002A84
_0805CCD0:
	movs r0, #0
	strb r0, [r3]
_0805CCD4:
	adds r3, #1
	adds r5, #1
	cmp r5, #3
	bhi _0805CCE6
	ldrb r0, [r2]
	asrs r0, r5
	ands r0, r6
	cmp r0, #0
	bne _0805CC64
_0805CCE6:
	ldr r0, _0805CD34 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	mov r2, ip
	ldr r0, [r2]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805CD66
	ldr r3, _0805CD38 @ =IWRAM_START + 0x317
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CD66
	ldr r0, _0805CD3C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0805CD48
	ldr r1, _0805CD40 @ =IWRAM_START + 0x31E
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CD28
	movs r0, #0x6c
	bl m4aSongNumStart
_0805CD28:
	ldr r2, _0805CD44 @ =IWRAM_START + 0x316
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	b _0805CD66
	.align 2, 0
_0805CD34: .4byte gCurTask
_0805CD38: .4byte IWRAM_START + 0x317
_0805CD3C: .4byte gPressedKeys
_0805CD40: .4byte IWRAM_START + 0x31E
_0805CD44: .4byte IWRAM_START + 0x316
_0805CD48:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0805CD66
	ldr r3, _0805CDE4 @ =IWRAM_START + 0x31E
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805CD60
	movs r0, #0x6c
	bl m4aSongNumStart
_0805CD60:
	ldr r1, _0805CDE8 @ =IWRAM_START + 0x316
	adds r0, r4, r1
	strb r5, [r0]
_0805CD66:
	movs r3, #1
	movs r6, #0
_0805CD6A:
	ldr r0, _0805CDEC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r6, r0
	beq _0805CDAA
	ldr r0, _0805CDF0 @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805CDAA
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r6, #0
	bne _0805CDAA
	ldr r4, _0805CDF4 @ =gMultiSioRecv
	ldr r2, _0805CDF8 @ =0x00000316
	adds r5, r7, r2
	ldrb r0, [r5]
	ldrb r1, [r4, #2]
	cmp r0, r1
	beq _0805CDA6
	movs r0, #0x6c
	str r3, [sp]
	bl m4aSongNumStart
	ldr r3, [sp]
_0805CDA6:
	ldrb r0, [r4, #2]
	strb r0, [r5]
_0805CDAA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #3
	bls _0805CD6A
	ldr r0, _0805CDFC @ =gMultiSioStatusFlags
	ldr r5, [r0]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0805CDC2
	b _0805CF3C
_0805CDC2:
	ldr r0, _0805CE00 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805CE08
	ldr r2, _0805CE04 @ =0x00000317
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805CE14
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0805D030
	.align 2, 0
_0805CDE4: .4byte IWRAM_START + 0x31E
_0805CDE8: .4byte IWRAM_START + 0x316
_0805CDEC: .4byte 0x04000128
_0805CDF0: .4byte gUnknown_030055B8
_0805CDF4: .4byte gMultiSioRecv
_0805CDF8: .4byte 0x00000316
_0805CDFC: .4byte gMultiSioStatusFlags
_0805CE00: .4byte gPressedKeys
_0805CE04: .4byte 0x00000317
_0805CE08:
	ldr r1, _0805CEC4 @ =0x00000317
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CE14
	b _0805D030
_0805CE14:
	movs r2, #1
	movs r6, #0
	cmp r6, r3
	bhs _0805CE5A
	ldr r0, _0805CEC8 @ =gUnknown_030055B8
	mov ip, r0
	ldr r5, _0805CECC @ =gMultiSioRecv
_0805CE22:
	ldr r0, _0805CED0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r6, r0
	beq _0805CE50
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805CE50
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r4, r0, r5
	ldrh r0, [r4]
	cmp r0, #1
	bls _0805CE50
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0805CE50:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r3
	blo _0805CE22
_0805CE5A:
	cmp r3, r2
	beq _0805CE60
	b _0805D030
_0805CE60:
	ldr r2, _0805CED4 @ =0x00000316
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805CEF4
	movs r3, #0xa4
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r1, _0805CED8 @ =gUnknown_03004D80
	movs r3, #0
	strb r3, [r1, #2]
	ldr r2, _0805CEDC @ =gUnknown_03002280
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	movs r1, #0xff
	strb r1, [r2, #0xa]
	movs r1, #0x20
	strb r1, [r2, #0xb]
	ldr r1, _0805CEE0 @ =0x06008000
	str r1, [r0, #4]
	movs r4, #0
	strh r3, [r0, #0xa]
	ldr r1, _0805CEE4 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r3, [r0, #0x18]
	strh r3, [r0, #0x1a]
	movs r1, #0x7d
	strh r1, [r0, #0x1c]
	strh r3, [r0, #0x1e]
	strh r3, [r0, #0x20]
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #7
	strh r1, [r0, #0x28]
	ldr r2, _0805CEE8 @ =0x000002BA
	adds r1, r7, r2
	strb r4, [r1]
	movs r1, #3
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0805CEEC @ =gMultiSioSend
	ldr r0, _0805CEF0 @ =0x00004035
	strh r0, [r1]
	ldr r3, _0805CEC4 @ =0x00000317
	adds r0, r7, r3
	b _0805CFA8
	.align 2, 0
_0805CEC4: .4byte 0x00000317
_0805CEC8: .4byte gUnknown_030055B8
_0805CECC: .4byte gMultiSioRecv
_0805CED0: .4byte 0x04000128
_0805CED4: .4byte 0x00000316
_0805CED8: .4byte gUnknown_03004D80
_0805CEDC: .4byte gUnknown_03002280
_0805CEE0: .4byte 0x06008000
_0805CEE4: .4byte 0x0600B000
_0805CEE8: .4byte 0x000002BA
_0805CEEC: .4byte gMultiSioSend
_0805CEF0: .4byte 0x00004035
_0805CEF4:
	ldr r0, _0805CF24 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _0805CF28 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _0805CF2C @ =gGameMode
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0805CF30 @ =gUnknown_030054D8
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80346C8
	ldr r1, _0805CF34 @ =gMultiSioSend
	ldr r0, _0805CF38 @ =0x00004035
	strh r0, [r1]
	b _0805D0FA
	.align 2, 0
_0805CF24: .4byte gCurTask
_0805CF28: .4byte gFlags
_0805CF2C: .4byte gGameMode
_0805CF30: .4byte gUnknown_030054D8
_0805CF34: .4byte gMultiSioSend
_0805CF38: .4byte 0x00004035
_0805CF3C:
	ldr r4, _0805CFBC @ =gMultiSioRecv
	ldrh r0, [r4]
	cmp r0, #1
	bne _0805D030
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0805CFC0 @ =0x00000316
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805CFF0
	movs r2, #0xa4
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r1, _0805CFC4 @ =gUnknown_03004D80
	strb r5, [r1, #2]
	ldr r2, _0805CFC8 @ =gUnknown_03002280
	strb r5, [r2, #8]
	strb r5, [r2, #9]
	movs r1, #0xff
	strb r1, [r2, #0xa]
	movs r1, #0x20
	strb r1, [r2, #0xb]
	ldr r1, _0805CFCC @ =0x06008000
	str r1, [r0, #4]
	movs r4, #0
	strh r5, [r0, #0xa]
	ldr r1, _0805CFD0 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r5, [r0, #0x18]
	strh r5, [r0, #0x1a]
	movs r1, #0x7d
	strh r1, [r0, #0x1c]
	strh r5, [r0, #0x1e]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	strh r5, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #7
	strh r1, [r0, #0x28]
	ldr r3, _0805CFD4 @ =0x000002BA
	adds r1, r7, r3
	strb r4, [r1]
	movs r1, #3
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0805CFD8 @ =gMultiSioSend
	ldr r0, _0805CFDC @ =0x00004035
	strh r0, [r1]
	ldr r1, _0805CFE0 @ =0x00000317
	adds r0, r7, r1
_0805CFA8:
	strb r4, [r0]
	ldr r1, _0805CFE4 @ =gGameMode
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0805CFE8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805CFEC @ =sub_805D5C8
	str r0, [r1, #8]
	b _0805D0FA
	.align 2, 0
_0805CFBC: .4byte gMultiSioRecv
_0805CFC0: .4byte 0x00000316
_0805CFC4: .4byte gUnknown_03004D80
_0805CFC8: .4byte gUnknown_03002280
_0805CFCC: .4byte 0x06008000
_0805CFD0: .4byte 0x0600B000
_0805CFD4: .4byte 0x000002BA
_0805CFD8: .4byte gMultiSioSend
_0805CFDC: .4byte 0x00004035
_0805CFE0: .4byte 0x00000317
_0805CFE4: .4byte gGameMode
_0805CFE8: .4byte gCurTask
_0805CFEC: .4byte sub_805D5C8
_0805CFF0:
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _0805D020 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _0805D024 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _0805D028 @ =gGameMode
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0805D02C @ =gUnknown_030054D8
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80346C8
	b _0805D0FA
	.align 2, 0
_0805D020: .4byte gCurTask
_0805D024: .4byte gFlags
_0805D028: .4byte gGameMode
_0805D02C: .4byte gUnknown_030054D8
_0805D030:
	adds r0, r7, #0
	bl sub_805D118
	adds r0, r7, #0
	bl sub_805D644
	adds r1, r7, #0
	adds r1, #0xc0
	movs r0, #0x78
	strh r0, [r1, #0x16]
	movs r0, #0x1c
	strh r0, [r1, #0x18]
	adds r0, r1, #0
	bl sub_80051E8
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r7, r2
	movs r0, #0x46
	strh r0, [r1, #0x16]
	movs r0, #0x34
	strh r0, [r1, #0x18]
	ldr r3, _0805D070 @ =0x00000316
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D078
	ldr r0, _0805D074 @ =0x00000145
	adds r2, r7, r0
	movs r0, #0
	b _0805D07E
	.align 2, 0
_0805D070: .4byte 0x00000316
_0805D074: .4byte 0x00000145
_0805D078:
	ldr r3, _0805D0A8 @ =0x00000145
	adds r2, r7, r3
	movs r0, #0xff
_0805D07E:
	strb r0, [r2]
	adds r0, r1, #0
	bl sub_80051E8
	movs r0, #0xa8
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r0, #0xaa
	strh r0, [r1, #0x16]
	movs r0, #0x34
	strh r0, [r1, #0x18]
	ldr r2, _0805D0AC @ =0x00000316
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D0B4
	ldr r3, _0805D0B0 @ =0x00000175
	adds r2, r7, r3
	movs r0, #0
	b _0805D0BA
	.align 2, 0
_0805D0A8: .4byte 0x00000145
_0805D0AC: .4byte 0x00000316
_0805D0B0: .4byte 0x00000175
_0805D0B4:
	ldr r0, _0805D104 @ =0x00000175
	adds r2, r7, r0
	movs r0, #1
_0805D0BA:
	strb r0, [r2]
	adds r0, r1, #0
	bl sub_80051E8
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r7, r2
	movs r0, #0x78
	strh r0, [r1, #0x16]
	movs r0, #0x34
	strh r0, [r1, #0x18]
	adds r0, r1, #0
	bl sub_80051E8
	ldr r0, _0805D108 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805D0FA
	ldr r1, _0805D10C @ =gMultiSioSend
	ldr r3, _0805D110 @ =0x00000317
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D0F0
	movs r0, #1
_0805D0F0:
	strh r0, [r1]
	ldr r2, _0805D114 @ =0x00000316
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
_0805D0FA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D104: .4byte 0x00000175
_0805D108: .4byte gMultiSioStatusFlags
_0805D10C: .4byte gMultiSioSend
_0805D110: .4byte 0x00000317
_0805D114: .4byte 0x00000316

	thumb_func_start sub_805D118
sub_805D118: @ 0x0805D118
	push {r4, r5, r6, r7, lr}
	ldr r1, _0805D1D4 @ =gUnknown_03001884
	ldr r6, [r1]
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r3, r0, r1
	ldrh r1, [r3]
	adds r1, #1
	ldr r4, _0805D1D8 @ =0x000003FF
	adds r2, r4, #0
	ands r1, r2
	strh r1, [r3]
	movs r1, #0xc4
	lsls r1, r1, #2
	adds r2, r0, r1
	ldr r5, _0805D1DC @ =gSineTable
	ldrh r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	ldrh r4, [r2]
	adds r1, r1, r4
	strh r1, [r2]
	ldr r1, _0805D1E0 @ =0x00000312
	adds r0, r0, r1
	ldrh r1, [r3]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	ldrh r4, [r0]
	adds r1, r1, r4
	strh r1, [r0]
	ldrh r4, [r2]
	lsls r4, r4, #0x10
	lsls r1, r1, #0x10
	ldr r2, _0805D1E4 @ =gFlags
	ldr r0, [r2]
	movs r3, #4
	orrs r0, r3
	str r0, [r2]
	ldr r0, _0805D1E8 @ =gUnknown_03002A80
	strb r3, [r0]
	ldr r2, _0805D1EC @ =gUnknown_03002878
	ldr r0, _0805D1F0 @ =0x0400001C
	str r0, [r2]
	movs r2, #0
	adds r7, r5, #0
	ldr r5, _0805D1F4 @ =gFrameCount
	ldr r3, _0805D1D8 @ =0x000003FF
	asrs r4, r4, #0x18
	mov ip, r4
	asrs r4, r1, #0x18
_0805D18E:
	lsls r1, r2, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1b
	add r0, ip
	strh r0, [r6]
	adds r6, #2
	lsls r1, r2, #1
	ldr r0, [r5]
	adds r0, r0, r1
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1b
	adds r0, r4, r0
	strh r0, [r6]
	adds r6, #2
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bls _0805D18E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1D4: .4byte gUnknown_03001884
_0805D1D8: .4byte 0x000003FF
_0805D1DC: .4byte gSineTable
_0805D1E0: .4byte 0x00000312
_0805D1E4: .4byte gFlags
_0805D1E8: .4byte gUnknown_03002A80
_0805D1EC: .4byte gUnknown_03002878
_0805D1F0: .4byte 0x0400001C
_0805D1F4: .4byte gFrameCount

	thumb_func_start sub_805D1F8
sub_805D1F8: @ 0x0805D1F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	movs r2, #2
	bl memset
	ldr r0, _0805D254 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0805D258 @ =IWRAM_START + 0x31F
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D27E
	ldr r0, _0805D25C @ =gRepeatedKeys
	ldrh r2, [r0]
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0805D264
	ldr r0, _0805D260 @ =IWRAM_START + 0x31E
	adds r4, r1, r0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805D24A
	movs r0, #0x6c
	bl m4aSongNumStart
_0805D24A:
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r4]
	b _0805D27E
	.align 2, 0
_0805D254: .4byte gCurTask
_0805D258: .4byte IWRAM_START + 0x31F
_0805D25C: .4byte gRepeatedKeys
_0805D260: .4byte IWRAM_START + 0x31E
_0805D264:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0805D27E
	ldr r2, _0805D2CC @ =IWRAM_START + 0x31E
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r0, #1
	bne _0805D27C
	movs r0, #0x6c
	bl m4aSongNumStart
_0805D27C:
	strb r5, [r4]
_0805D27E:
	ldr r0, _0805D2D0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805D306
	movs r3, #0
	ldr r0, _0805D2D4 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _0805D306
	movs r5, #1
	ldr r2, _0805D2D8 @ =gUnknown_030054D4
_0805D29A:
	ldr r1, _0805D2DC @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805D2F0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805D2F4
	movs r0, #0
	ldr r1, _0805D2E0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805D2E4 @ =gUnknown_03002AE4
	ldr r0, _0805D2E8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805D2EC @ =gUnknown_03005390
	strb r4, [r0]
	b _0805D52A
	.align 2, 0
_0805D2CC: .4byte IWRAM_START + 0x31E
_0805D2D0: .4byte gGameMode
_0805D2D4: .4byte gUnknown_030055B8
_0805D2D8: .4byte gUnknown_030054D4
_0805D2DC: .4byte gMultiSioStatusFlags
_0805D2E0: .4byte 0x0000FFFF
_0805D2E4: .4byte gUnknown_03002AE4
_0805D2E8: .4byte gUnknown_0300287C
_0805D2EC: .4byte gUnknown_03005390
_0805D2F0:
	movs r0, #0
	strb r0, [r2]
_0805D2F4:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805D306
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0805D29A
_0805D306:
	mov r4, r8
	adds r4, #0xf0
	movs r0, #0x78
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	movs r6, #0
	ldr r2, _0805D3A8 @ =gUnknown_030055B8
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D328
	b _0805D436
_0805D328:
	mov sb, r2
	mov r7, sp
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0x40
	mov sl, r1
	movs r2, #0
	str r2, [sp, #0xc]
_0805D338:
	ldr r0, _0805D3AC @ =gMultiSioRecv
	ldr r1, [sp, #0xc]
	adds r5, r1, r0
	cmp r6, #0
	bne _0805D34E
	movs r4, #0xd8
	lsls r4, r4, #1
	add r4, r8
	adds r0, r4, #0
	bl sub_8004558
_0805D34E:
	ldrh r1, [r5]
	ldr r2, _0805D3B0 @ =0xFFFFBFC0
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0805D40C
	ldr r0, _0805D3B4 @ =0x00004041
	cmp r1, r0
	beq _0805D3E2
	ldr r4, [sp, #8]
	add r4, r8
	mov r1, sl
	strh r1, [r4, #0x18]
	ldr r1, _0805D3B8 @ =gUnknown_080D92B8
	ldrb r0, [r5, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	bl sub_80051E8
	movs r4, #0xd8
	lsls r4, r4, #1
	add r4, r8
	mov r2, sl
	strh r2, [r4, #0x18]
	ldr r1, _0805D3BC @ =gUnknown_080D92BA
	ldrb r0, [r5, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	strh r0, [r4, #0x16]
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0805D3C4
	ldr r0, [r4, #0x10]
	ldr r1, _0805D3C0 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r4, #0x10]
	movs r1, #0x10
	lsls r1, r6
	mov r2, sb
	ldrb r0, [r2]
	bics r0, r1
	b _0805D3D8
	.align 2, 0
_0805D3A8: .4byte gUnknown_030055B8
_0805D3AC: .4byte gMultiSioRecv
_0805D3B0: .4byte 0xFFFFBFC0
_0805D3B4: .4byte 0x00004041
_0805D3B8: .4byte gUnknown_080D92B8
_0805D3BC: .4byte gUnknown_080D92BA
_0805D3C0: .4byte 0xFFFFFBFF
_0805D3C4:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r4, #0x10]
	movs r0, #0x10
	lsls r0, r6
	mov r2, sb
	ldrb r1, [r2]
	orrs r0, r1
_0805D3D8:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80051E8
	b _0805D40C
_0805D3E2:
	ldr r4, [sp, #8]
	add r4, r8
	adds r0, r4, #0
	bl sub_80051E8
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	ldr r0, _0805D400 @ =gUnknown_080D92B8
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805D404
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	b _0805D410
	.align 2, 0
_0805D400: .4byte gUnknown_080D92B8
_0805D404:
	ldrb r0, [r7, #1]
	adds r0, #1
	strb r0, [r7, #1]
	b _0805D410
_0805D40C:
	movs r0, #0
	str r0, [sp, #4]
_0805D410:
	ldr r1, [sp, #8]
	adds r1, #0x30
	str r1, [sp, #8]
	movs r2, #0x18
	add sl, r2
	ldr r0, [sp, #0xc]
	adds r0, #0x14
	str r0, [sp, #0xc]
	adds r6, #1
	cmp r6, #3
	bgt _0805D436
	mov r1, sb
	ldrb r0, [r1]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805D436
	b _0805D338
_0805D436:
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _0805D474
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D450
	mov r0, sp
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _0805D460
_0805D450:
	ldr r1, _0805D45C @ =0x0000031F
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	b _0805D474
	.align 2, 0
_0805D45C: .4byte 0x0000031F
_0805D460:
	ldr r0, _0805D46C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805D470 @ =sub_805D610
	str r0, [r1, #8]
	b _0805D59C
	.align 2, 0
_0805D46C: .4byte gCurTask
_0805D470: .4byte sub_805D610
_0805D474:
	mov r0, r8
	bl sub_805D118
	ldr r4, _0805D4FC @ =gPressedKeys
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805D494
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, _0805D500 @ =0x0000031F
	add r1, r8
	movs r0, #0
	strb r0, [r1]
_0805D494:
	ldr r0, _0805D504 @ =gInput
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0805D4CC
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805D4CC
	ldr r0, _0805D508 @ =0x0000031E
	add r0, r8
	ldrb r2, [r0]
	cmp r2, #0
	bne _0805D4BE
	subs r1, r5, #1
	mov r0, sp
	ldrb r0, [r0]
	cmp r1, r0
	bne _0805D4D6
_0805D4BE:
	cmp r2, #1
	bne _0805D4CC
	subs r0, r5, #1
	mov r1, sp
	ldrb r1, [r1, #1]
	cmp r0, r1
	bne _0805D4D6
_0805D4CC:
	ldr r0, _0805D500 @ =0x0000031F
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D550
_0805D4D6:
	ldr r4, _0805D500 @ =0x0000031F
	add r4, r8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805D4E6
	movs r0, #0x6a
	bl m4aSongNumStart
_0805D4E6:
	ldr r5, _0805D50C @ =gMultiSioSend
	ldr r0, _0805D510 @ =0x00004041
	strh r0, [r5]
	ldr r0, _0805D508 @ =0x0000031E
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r4]
	b _0805D55E
	.align 2, 0
_0805D4FC: .4byte gPressedKeys
_0805D500: .4byte 0x0000031F
_0805D504: .4byte gInput
_0805D508: .4byte 0x0000031E
_0805D50C: .4byte gMultiSioSend
_0805D510: .4byte 0x00004041
_0805D514:
	ldr r1, _0805D538 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805D53C @ =gUnknown_03002AE4
	ldr r0, _0805D540 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805D544 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
_0805D52A:
	ldr r1, _0805D548 @ =gUnknown_03004D5C
	ldr r0, _0805D54C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805D59C
	.align 2, 0
_0805D538: .4byte 0x0000FFFF
_0805D53C: .4byte gUnknown_03002AE4
_0805D540: .4byte gUnknown_0300287C
_0805D544: .4byte gUnknown_03005390
_0805D548: .4byte gUnknown_03004D5C
_0805D54C: .4byte gUnknown_03002A84
_0805D550:
	ldr r5, _0805D5AC @ =gMultiSioSend
	ldr r0, _0805D5B0 @ =0x00004040
	strh r0, [r5]
	ldr r0, _0805D5B4 @ =0x0000031E
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r5, #2]
_0805D55E:
	movs r6, #0
	ldr r0, _0805D5B8 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _0805D59C
	ldr r3, _0805D5BC @ =0x00004041
	movs r2, #0
_0805D572:
	ldr r0, _0805D5C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r6
	beq _0805D588
	ldr r0, _0805D5C4 @ =gMultiSioRecv
	adds r5, r2, r0
	ldrh r0, [r5]
	cmp r0, r3
	bhi _0805D514
_0805D588:
	adds r2, #0x14
	adds r6, #1
	cmp r6, #3
	bgt _0805D59C
	ldrb r0, [r7]
	asrs r0, r6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0805D572
_0805D59C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5AC: .4byte gMultiSioSend
_0805D5B0: .4byte 0x00004040
_0805D5B4: .4byte 0x0000031E
_0805D5B8: .4byte gUnknown_030055B8
_0805D5BC: .4byte 0x00004041
_0805D5C0: .4byte 0x04000128
_0805D5C4: .4byte gMultiSioRecv

	thumb_func_start sub_805D5C8
sub_805D5C8: @ 0x0805D5C8
	push {r4, lr}
	ldr r4, _0805D5FC @ =gCurTask
	ldr r0, [r4]
	ldrh r2, [r0, #6]
	ldr r0, _0805D600 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r1, r0
	ldr r3, _0805D604 @ =IWRAM_START + 0x31E
	adds r0, r2, r3
	movs r3, #0
	strb r1, [r0]
	ldr r0, _0805D608 @ =IWRAM_START + 0x31F
	adds r2, r2, r0
	strb r3, [r2]
	ldr r1, [r4]
	ldr r0, _0805D60C @ =sub_805D1F8
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5FC: .4byte gCurTask
_0805D600: .4byte 0x04000128
_0805D604: .4byte IWRAM_START + 0x31E
_0805D608: .4byte IWRAM_START + 0x31F
_0805D60C: .4byte sub_805D1F8

	thumb_func_start sub_805D610
sub_805D610: @ 0x0805D610
	push {lr}
	ldr r0, _0805D638 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _0805D63C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0805D640 @ =gUnknown_030054D8
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80346C8
	pop {r0}
	bx r0
	.align 2, 0
_0805D638: .4byte gCurTask
_0805D63C: .4byte gFlags
_0805D640: .4byte gUnknown_030054D8

	thumb_func_start sub_805D644
sub_805D644: @ 0x0805D644
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #1
	ldr r7, _0805D688 @ =gUnknown_080D92B8
_0805D64E:
	ldr r0, _0805D68C @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _0805D676
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r0, r2, #4
	adds r0, r6, r0
	adds r1, r4, #0
	ands r1, r5
	adds r1, r1, r7
	ldrb r1, [r1]
	strh r1, [r0, #0x16]
	lsls r2, r2, #3
	adds r2, #0x40
	strh r2, [r0, #0x18]
	bl sub_80051E8
_0805D676:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0805D64E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D688: .4byte gUnknown_080D92B8
_0805D68C: .4byte gUnknown_030055B8
