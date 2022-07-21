.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_805A1CC
sub_805A1CC: @ 0x0805A1CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805A460 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	mov sb, r0
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r1, _0805A464 @ =gDispCnt
	ldr r0, _0805A468 @ =0x00001341
	strh r0, [r1]
	movs r5, #0
	str r5, [sp, #4]
	ldr r0, _0805A46C @ =0x040000D4
	add r1, sp, #4
	str r1, [r0]
	ldr r1, _0805A470 @ =gMultiSioSend
	str r1, [r0, #4]
	ldr r1, _0805A474 @ =0x85000005
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [sp, #4]
	add r2, sp, #4
	str r2, [r0]
	ldr r1, _0805A478 @ =gMultiSioRecv
	str r1, [r0, #4]
	ldr r1, _0805A47C @ =0x85000014
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _0805A480 @ =gBgCntRegs
	ldr r0, _0805A484 @ =0x0000560C
	strh r0, [r1, #2]
	ldr r0, _0805A488 @ =0x00001401
	strh r0, [r1]
	ldr r0, _0805A48C @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	ldr r0, _0805A490 @ =sub_805A9B0
	movs r1, #0xa8
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r3, _0805A494 @ =sub_805AA94
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r8, r0
	add r8, r6
	ldr r1, _0805A498 @ =IWRAM_START + 0x14C
	adds r0, r6, r1
	movs r2, #0
	strb r2, [r0]
	adds r1, #1
	adds r0, r6, r1
	strb r2, [r0]
	ldr r2, _0805A49C @ =IWRAM_START + 0x14E
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	subs r2, #0xe
	adds r0, r6, r2
	movs r1, #1
	strh r1, [r0]
	strh r5, [r0, #4]
	movs r1, #2
	strh r1, [r0, #2]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #6]
	ldr r1, _0805A4A0 @ =0x00003FFF
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	bl sub_802D4CC
	ldr r0, _0805A4A4 @ =IWRAM_START + 0x80
	adds r7, r6, r0
	movs r0, #0x32
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _0805A4A8 @ =0x00000431
	strh r0, [r7, #0xa]
	ldr r1, _0805A4AC @ =IWRAM_START + 0xA0
	adds r0, r6, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _0805A4B0 @ =IWRAM_START + 0xA1
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r2, _0805A4B4 @ =IWRAM_START + 0xA2
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
	movs r0, #0x80
	lsls r0, r0, #5
	mov sl, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _0805A4B8 @ =IWRAM_START + 0xB0
	adds r7, r6, r1
	mov r2, sb
	lsls r4, r2, #3
	ldr r0, _0805A4BC @ =gUnknown_080D8F70
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _0805A4C0 @ =IWRAM_START + 0xD0
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _0805A4C4 @ =IWRAM_START + 0xD1
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
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
	mov r0, sl
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _0805A4C8 @ =IWRAM_START + 0xE0
	adds r7, r6, r1
	mov r4, sb
	adds r4, #1
	lsls r4, r4, #3
	ldr r2, _0805A4BC @ =gUnknown_080D8F70
	adds r4, r4, r2
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _0805A4CC @ =IWRAM_START + 0x100
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _0805A4D0 @ =IWRAM_START + 0x101
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
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
	mov r0, sl
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _0805A4D4 @ =IWRAM_START + 0x110
	adds r7, r6, r1
	movs r2, #2
	add sb, r2
	mov r0, sb
	lsls r0, r0, #3
	mov sb, r0
	ldr r1, _0805A4BC @ =gUnknown_080D8F70
	add sb, r1
	mov r2, sb
	ldr r0, [r2]
	bl sub_8007C10
	str r0, [r7, #4]
	mov r1, sb
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _0805A4D8 @ =IWRAM_START + 0x130
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _0805A4DC @ =IWRAM_START + 0x131
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0x67
	strh r0, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
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
	str r5, [r7, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, r8
	str r0, [r1, #4]
	strh r5, [r1, #0xa]
	ldr r0, _0805A4E0 @ =0x0600A000
	str r0, [r1, #0xc]
	strh r5, [r1, #0x18]
	strh r5, [r1, #0x1a]
	movs r0, #0x6e
	strh r0, [r1, #0x1c]
	strh r5, [r1, #0x1e]
	strh r5, [r1, #0x20]
	strh r5, [r1, #0x22]
	strh r5, [r1, #0x24]
	movs r4, #0x20
	strh r4, [r1, #0x26]
	strh r4, [r1, #0x28]
	ldr r2, _0805A4E4 @ =IWRAM_START + 0x2A
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	mov r2, r8
	strh r5, [r2, #0x2e]
	mov r0, r8
	bl sub_8002A3C
	ldr r1, _0805A4E8 @ =IWRAM_START + 0x40
	adds r0, r6, r1
	ldr r1, _0805A4EC @ =0x0600C000
	str r1, [r0, #4]
	strh r5, [r0, #0xa]
	ldr r1, _0805A4F0 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r5, [r0, #0x18]
	strh r5, [r0, #0x1a]
	movs r1, #0x6f
	strh r1, [r0, #0x1c]
	strh r5, [r0, #0x1e]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	strh r5, [r0, #0x24]
	strh r4, [r0, #0x26]
	strh r4, [r0, #0x28]
	ldr r2, _0805A4F4 @ =IWRAM_START + 0x6A
	adds r6, r6, r2
	movs r1, #0
	strb r1, [r6]
	movs r2, #1
	strh r2, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #0x42
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A460: .4byte gLoadedSaveGame
_0805A464: .4byte gDispCnt
_0805A468: .4byte 0x00001341
_0805A46C: .4byte 0x040000D4
_0805A470: .4byte gMultiSioSend
_0805A474: .4byte 0x85000005
_0805A478: .4byte gMultiSioRecv
_0805A47C: .4byte 0x85000014
_0805A480: .4byte gBgCntRegs
_0805A484: .4byte 0x0000560C
_0805A488: .4byte 0x00001401
_0805A48C: .4byte gBgScrollRegs
_0805A490: .4byte sub_805A9B0
_0805A494: .4byte sub_805AA94
_0805A498: .4byte IWRAM_START + 0x14C
_0805A49C: .4byte IWRAM_START + 0x14E
_0805A4A0: .4byte 0x00003FFF
_0805A4A4: .4byte IWRAM_START + 0x80
_0805A4A8: .4byte 0x00000431
_0805A4AC: .4byte IWRAM_START + 0xA0
_0805A4B0: .4byte IWRAM_START + 0xA1
_0805A4B4: .4byte IWRAM_START + 0xA2
_0805A4B8: .4byte IWRAM_START + 0xB0
_0805A4BC: .4byte gUnknown_080D8F70
_0805A4C0: .4byte IWRAM_START + 0xD0
_0805A4C4: .4byte IWRAM_START + 0xD1
_0805A4C8: .4byte IWRAM_START + 0xE0
_0805A4CC: .4byte IWRAM_START + 0x100
_0805A4D0: .4byte IWRAM_START + 0x101
_0805A4D4: .4byte IWRAM_START + 0x110
_0805A4D8: .4byte IWRAM_START + 0x130
_0805A4DC: .4byte IWRAM_START + 0x131
_0805A4E0: .4byte 0x0600A000
_0805A4E4: .4byte IWRAM_START + 0x2A
_0805A4E8: .4byte IWRAM_START + 0x40
_0805A4EC: .4byte 0x0600C000
_0805A4F0: .4byte 0x0600B000
_0805A4F4: .4byte IWRAM_START + 0x6A

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
