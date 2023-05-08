.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

@; these are used as tile offsets. Is this just coincidence?
    .global gUnknown_080D5128
gUnknown_080D5128:
    .asciz "STAGE"

.text
.syntax unified
.arm

    thumb_func_start sub_80096DC
sub_80096DC: @ 0x080096DC
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08009750 @ =sub_8009854
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldr r1, _08009754 @ =gMultiplayerMissingHeartbeats
	strb r4, [r1, #3]
	strb r4, [r1, #2]
	strb r4, [r1, #1]
	strb r4, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r5, _08009758 @ =gDispCnt
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r5]
	ldr r2, _0800975C @ =gBgCntRegs
	movs r3, #0
	ldr r0, _08009760 @ =0x00001F06
	strh r0, [r2]
	strh r4, [r1, #4]
	strb r3, [r1, #6]
	ldr r0, _08009764 @ =0x06004020
	str r0, [r1]
	ldr r0, _08009768 @ =gBldRegs
	strh r4, [r0, #4]
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _0800976C @ =gWinRegs
	ldr r2, _08009770 @ =0x0000F0F0
	strh r2, [r0]
	ldr r1, _08009774 @ =0x0000A0A0
	strh r1, [r0, #4]
	strh r2, [r0, #2]
	strh r1, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	ldrh r1, [r5]
	ldr r0, _08009778 @ =0x00001FFF
	ands r0, r1
	strh r0, [r5]
	ldr r0, _0800977C @ =gBgScrollRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009750: .4byte sub_8009854
_08009754: .4byte gMultiplayerMissingHeartbeats
_08009758: .4byte gDispCnt
_0800975C: .4byte gBgCntRegs
_08009760: .4byte 0x00001F06
_08009764: .4byte 0x06004020
_08009768: .4byte gBldRegs
_0800976C: .4byte gWinRegs
_08009770: .4byte 0x0000F0F0
_08009774: .4byte 0x0000A0A0
_08009778: .4byte 0x00001FFF
_0800977C: .4byte gBgScrollRegs

	thumb_func_start sub_8009780
sub_8009780: @ 0x08009780
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _080097C0 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _080097C4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r4, #9
	ands r4, r1
	cmp r4, #0
	beq _080097D4
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _080097C8 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080097CC @ =gUnknown_03002280
	strb r0, [r1]
	strb r0, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r1, [r6]
	ldr r0, _080097D0 @ =sub_80098C0
	str r0, [r1, #8]
	b _08009848
	.align 2, 0
_080097C0: .4byte gCurTask
_080097C4: .4byte gPressedKeys
_080097C8: .4byte gUnknown_03004D80
_080097CC: .4byte gUnknown_03002280
_080097D0: .4byte sub_80098C0
_080097D4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009804
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, [r6]
	bl TaskDestroy
	ldr r0, _080097FC @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _08009800 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	b _08009848
	.align 2, 0
_080097FC: .4byte gUnknown_03004D80
_08009800: .4byte gUnknown_03002280
_08009804:
	ldr r0, _08009818 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800981C
	ldrb r0, [r5, #6]
	subs r0, #1
	b _08009828
	.align 2, 0
_08009818: .4byte gRepeatedKeys
_0800981C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800982A
	ldrb r0, [r5, #6]
	adds r0, #1
_08009828:
	strb r0, [r5, #6]
_0800982A:
	ldrb r1, [r5, #6]
	add r0, sp, #0xc
	bl sub_80044D8
	ldr r0, [r5]
	ldr r1, _08009850 @ =Palette_Stage_LeafForest_Act1
	movs r2, #0
	str r2, [sp]
	add r3, sp, #0xc
	str r3, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xc
	movs r3, #0xe
	bl sub_8004274
_08009848:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009850: .4byte Palette_Stage_LeafForest_Act1

	thumb_func_start sub_8009854
sub_8009854: @ 0x08009854
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _080098A4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r1, _080098A8 @ =gBgPalette
	movs r3, #0
	ldr r0, _080098AC @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _080098B0 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4]
	ldr r1, _080098B4 @ =Palette_Stage_LeafForest_Act1
	str r3, [sp]
	ldr r2, _080098B8 @ =gUnknown_080D5128
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r2, #6
	movs r3, #0xe
	bl sub_8004274
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r1, [r5]
	ldr r0, _080098BC @ =sub_8009780
	str r0, [r1, #8]
	bl _call_via_r0
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080098A4: .4byte gCurTask
_080098A8: .4byte gBgPalette
_080098AC: .4byte 0x00007FFF
_080098B0: .4byte gFlags
_080098B4: .4byte Palette_Stage_LeafForest_Act1
_080098B8: .4byte gUnknown_080D5128
_080098BC: .4byte sub_8009780

	thumb_func_start sub_80098C0
sub_80098C0: @ 0x080098C0
	push {r4, r5, lr}
	ldr r0, _080098E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	ldrb r4, [r1, #6]
	adds r5, r4, #0
	bl TaskDestroy
	cmp r4, #0
	bne _080098EC
	ldr r0, _080098E8 @ =gCurrentLevel
	strb r4, [r0]
	bl GameStageStart
	b _08009900
	.align 2, 0
_080098E4: .4byte gCurTask
_080098E8: .4byte gCurrentLevel
_080098EC:
	cmp r5, #0x22
	bhi _08009900
	ldr r1, _08009908 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	ldr r1, _0800990C @ =gCurrentLevel
	subs r0, r5, #1
	strb r0, [r1]
	bl GameStageStart
_08009900:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009908: .4byte gUnknown_03005B4C
_0800990C: .4byte gCurrentLevel
_08009910:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start nullsub_8002A34_0
nullsub_8002A34_0: @ 0x08009914
	bx lr
	.align 2, 0
