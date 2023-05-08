.include "asm/macros.inc"
.include "constants/constants.inc"

    .section .rodata

    .global gLevelSongs
gLevelSongs: @ 0x080D5204
    @.2byte MUS_LEAF_FOREST__ACT_1
    @.2byte MUS_LEAF_FOREST__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_HOT_CRATER__ACT_1
    @.2byte MUS_HOT_CRATER__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_MUSIC_PLANT__ACT_1
    @.2byte MUS_MUSIC_PLANT__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_ICE_PARADISE__ACT_1
    @.2byte MUS_ICE_PARADISE__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_SKY_CANYON__ACT_1
    @.2byte MUS_SKY_CANYON__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_TECHNO_BASE__ACT_1
    @.2byte MUS_TECHNO_BASE__ACT_2
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS_PINCH
    @.2byte MUS_EGG_UTOPIA__ACT_1
    @.2byte MUS_EGG_UTOPIA__ACT_2
    @.2byte MUS_7_BOSS
    @.2byte MUS_7_BOSS_PINCH
    @.2byte MUS_XX__FINAL_ZONE
    @.2byte MUS_TRUE_AREA_53
    @.2byte MUS_FINAL_BOSS
    @.2byte MUS_FINAL_BOSS_PINCH
    @.2byte MUS_BOSS_KNUCKLES
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_BOSS
    @.2byte MUS_DUMMY
    .incbin "baserom.gba", 0x000D5204, 0x50

    .global gUnknown_080D5254
gUnknown_080D5254:
    .incbin "baserom.gba", 0x000D5254, 0x0E

    .global gUnknown_080D5262
gUnknown_080D5262:
    .incbin "baserom.gba", 0x000D5262, 0x0E

    .global gUnknown_080D5270
gUnknown_080D5270:
    .incbin "baserom.gba", 0x000D5270, 0x0E

    .global gUnknown_080D527E
gUnknown_080D527E:
    .incbin "baserom.gba", 0x000D527E, 0x0E

    .global gUnknown_080D528C
gUnknown_080D528C:
    .incbin "baserom.gba", 0x000D528C, 0x0E

    .global gUnknown_080D529A
gUnknown_080D529A:
    .incbin "baserom.gba", 0x000D529A, 0x0E

    .global gUnknown_080D52A8
gUnknown_080D52A8:
    .incbin "baserom.gba", 0x000D52A8, 0x0E

    .global gUnknown_080D52B6
gUnknown_080D52B6:
    .incbin "baserom.gba", 0x000D52B6, 0x0E

    .global gUnknown_080D52C4
gUnknown_080D52C4:
    .incbin "baserom.gba", 0x000D52C4, 0x0E

    .global gUnknown_080D52D2
gUnknown_080D52D2:
    .incbin "baserom.gba", 0x000D52D2, 0x0E

.text
.syntax unified
.arm

	thumb_func_start sub_800B9B8
sub_800B9B8: @ 0x0800B9B8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BA3C @ =sub_800BA58
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	movs r6, #0
	str r6, [sp]
	movs r1, #0x30
	mov r2, sb
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r3, #0
	mov r8, r3
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BA40 @ =0x06011000
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	ldr r0, _0800BA44 @ =0x000001DD
	strh r0, [r1, #0xa]
	ldr r3, _0800BA48 @ =IWRAM_START + 0x20
	adds r0, r2, r3
	mov r3, r8
	strb r3, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BA4C @ =IWRAM_START + 0x21
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _0800BA50 @ =IWRAM_START + 0x22
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _0800BA54 @ =IWRAM_START + 0x25
	adds r2, r2, r3
	mov r0, r8
	strb r0, [r2]
	mov r3, sb
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sub_800BA58
_0800BA40: .4byte 0x06011000
_0800BA44: .4byte 0x000001DD
_0800BA48: .4byte IWRAM_START + 0x20
_0800BA4C: .4byte IWRAM_START + 0x21
_0800BA50: .4byte IWRAM_START + 0x22
_0800BA54: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BA58
sub_800BA58: @ 0x0800BA58
	push {r4, r5, r6, r7, lr}
	ldr r7, _0800BAA4 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x16]
	adds r5, r0, #0
	ldrh r6, [r4, #0x18]
	ldr r1, _0800BAA8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800BA92
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r7]
	bl TaskDestroy
_0800BA92:
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAA4: .4byte gCurTask
_0800BAA8: .4byte gCamera

	thumb_func_start sub_800BAAC
sub_800BAAC: @ 0x0800BAAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BB2C @ =sub_800BB44
	movs r2, #0x80
	lsls r2, r2, #6
	movs r6, #0
	str r6, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r0, #0
	mov r8, r0
	strh r6, [r1, #0x30]
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BB30 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	subs r0, #0xea
	strh r0, [r1, #0xa]
	ldr r2, _0800BB34 @ =IWRAM_START + 0x20
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BB38 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0800BB3C @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0800BB40 @ =IWRAM_START + 0x25
	adds r3, r3, r2
	mov r0, r8
	strb r0, [r3]
	movs r0, #0xc2
	lsls r0, r0, #0xc
	str r0, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB2C: .4byte sub_800BB44
_0800BB30: .4byte 0x06011F00
_0800BB34: .4byte IWRAM_START + 0x20
_0800BB38: .4byte IWRAM_START + 0x21
_0800BB3C: .4byte IWRAM_START + 0x22
_0800BB40: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BB44
sub_800BB44: @ 0x0800BB44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _0800BCB8 @ =gPlayer
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrh r0, [r5, #0x16]
	subs r1, r1, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldrh r2, [r5, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldrh r1, [r5, #0x30]
	adds r1, #0x40
	strh r1, [r5, #0x30]
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	ldr r3, _0800BCBC @ =gSineTable
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r0, r6
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	muls r1, r2, r1
	asrs r1, r1, #0x16
	ldrh r2, [r5, #0x16]
	adds r1, r1, r2
	strh r1, [r5, #0x16]
	movs r6, #0x30
	ldrsh r1, [r5, r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #0x16
	ldrh r3, [r5, #0x18]
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	ldrh r6, [r5, #0x18]
	mov r8, r6
	ldrh r0, [r5, #0x16]
	mov sl, r0
	movs r1, #0x16
	ldrsh r3, [r5, r1]
	adds r2, r3, #0
	subs r2, #8
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	adds r0, r6, #0
	adds r0, #0x38
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r2, r1
	bgt _0800BBE6
	adds r0, r3, #0
	adds r0, #8
	cmp r0, r1
	bge _0800BBF8
	cmp r2, r1
	blt _0800BCD8
_0800BBE6:
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800BCD8
_0800BBF8:
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r7, r2, #0x10
	adds r4, r7, #0
	subs r4, #0x10
	ldr r1, _0800BCB8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	mov ip, r6
	mov r3, ip
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	mov sb, r2
	cmp r4, r3
	bgt _0800BC24
	cmp r7, r3
	bge _0800BC36
	cmp r4, r3
	blt _0800BCD8
_0800BC24:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r4
	blt _0800BCD8
_0800BC36:
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800BCA8
	ldr r1, _0800BCC4 @ =gRingCount
	ldrh r5, [r1]
	adds r0, r5, #1
	strh r0, [r1]
	ldr r0, _0800BCC8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0800BC86
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0800BC86
	ldr r0, _0800BCCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800BC86
	ldr r1, _0800BCD0 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800BC7E
	movs r0, #0xff
_0800BC7E:
	strb r0, [r1]
	ldr r1, _0800BCD4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800BC86:
	ldr r0, _0800BCCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800BC9A
	ldr r1, _0800BCC4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0800BC9A
	movs r0, #0xff
	strh r0, [r1]
_0800BC9A:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	asrs r1, r2, #0x10
	bl CreateCollectRingEffect
_0800BCA8:
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800BCFE
	.align 2, 0
_0800BCB4: .4byte gCurTask
_0800BCB8: .4byte gPlayer
_0800BCBC: .4byte gSineTable
_0800BCC0: .4byte gUnknown_03005AF0
_0800BCC4: .4byte gRingCount
_0800BCC8: .4byte gCurrentLevel
_0800BCCC: .4byte gGameMode
_0800BCD0: .4byte gNumLives
_0800BCD4: .4byte gUnknown_030054A8
_0800BCD8:
	ldr r2, _0800BD0C @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r5, #0x18]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	mov r3, sl
	strh r3, [r5, #0x16]
	mov r6, r8
	strh r6, [r5, #0x18]
_0800BCFE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD0C: .4byte gCamera

	thumb_func_start sub_800BD10
sub_800BD10: @ 0x0800BD10
	push {r4, r5, r6, lr}
	ldr r0, _0800BD54 @ =gMPlayTable
	ldr r0, [r0]
	ldr r3, [r0]
	ldr r0, _0800BD58 @ =gUnknown_030054A8
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _0800BD24
	b _0800BEEA
_0800BD24:
	ldr r1, _0800BD5C @ =gPlayer
	ldr r4, [r1, #0x20]
	movs r0, #0x80
	ands r4, r0
	adds r6, r1, #0
	cmp r4, #0
	beq _0800BD34
	b _0800BEEA
_0800BD34:
	ldrb r1, [r5, #1]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	bne _0800BD64
	ldr r0, _0800BD60 @ =gMPlayInfo_BGM
	bl MPlayStop
	movs r0, #0xff
	strb r0, [r5]
	ldrb r1, [r5, #1]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r5, #1]
	b _0800BEEA
	.align 2, 0
_0800BD54: .4byte gMPlayTable
_0800BD58: .4byte gUnknown_030054A8
_0800BD5C: .4byte gPlayer
_0800BD60: .4byte gMPlayInfo_BGM
_0800BD64:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _0800BD7A
	bl sub_800BF74
	movs r0, #0xff
	strb r0, [r5]
	strh r4, [r5, #6]
	movs r0, #1
	strb r0, [r5, #5]
	b _0800BEEA
_0800BD7A:
	ldr r0, _0800BDA8 @ =gSongTable
	adds r1, r0, #0
	adds r1, #0xf8
	ldr r1, [r1]
	adds r4, r0, #0
	cmp r3, r1
	bne _0800BDB0
	ldr r0, _0800BDAC @ =gMPlayInfo_BGM
	ldr r2, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BDB0
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r2
	cmp r1, #0
	bne _0800BDB0
	movs r0, #1
	strb r0, [r5, #5]
	strb r1, [r5, #2]
	strb r1, [r5, #3]
	b _0800BEEA
	.align 2, 0
_0800BDA8: .4byte gSongTable
_0800BDAC: .4byte gMPlayInfo_BGM
_0800BDB0:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0800BDC6
	movs r0, #0
	strb r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1f
	bl m4aSongNumStart
	b _0800BEEA
_0800BDC6:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r3, r0
	bne _0800BDFC
	ldr r0, _0800BDF8 @ =gMPlayInfo_BGM
	ldr r1, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BDFC
	cmp r1, #0
	blt _0800BDFC
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BDFC
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	bl m4aSongNumStop
	b _0800BEEA
	.align 2, 0
_0800BDF8: .4byte gMPlayInfo_BGM
_0800BDFC:
	ldr r1, _0800BE30 @ =0x00000CB8
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r3, r0
	beq _0800BE34
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r3, r0
	beq _0800BE34
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BE34
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0800BE3C
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	b _0800BEB0
	.align 2, 0
_0800BE30: .4byte 0x00000CB8
_0800BE34:
	adds r2, r5, #0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800BE4C
_0800BE3C:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	bl m4aSongNumStart
	b _0800BEEA
_0800BE4C:
	ldrb r6, [r2, #3]
	cmp r6, #0
	beq _0800BE64
	strb r0, [r2, #3]
	movs r0, #1
	strb r0, [r2, #5]
	ldr r0, _0800BE60 @ =0x00000197
	bl m4aSongNumStart
	b _0800BEEA
	.align 2, 0
_0800BE60: .4byte 0x00000197
_0800BE64:
	ldrb r3, [r2, #1]
	movs r1, #0xf0
	ands r1, r3
	cmp r1, #0x10
	bne _0800BE94
	movs r1, #0xf
	ands r1, r3
	strb r1, [r2, #1]
	ldr r2, _0800BE8C @ =gLevelSongs
	ldr r0, _0800BE90 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStart
	b _0800BEEA
	.align 2, 0
_0800BE8C: .4byte gLevelSongs
_0800BE90: .4byte gCurrentLevel
_0800BE94:
	ldr r0, _0800BEBC @ =gMPlayInfo_BGM
	ldr r4, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BEA2
	cmp r4, #0
	bge _0800BEEA
_0800BEA2:
	cmp r1, #0x20
	bne _0800BEC4
	ldr r0, _0800BEC0 @ =gUnknown_080D5254
	ldrb r1, [r2, #1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0800BEB0:
	bl m4aSongNumStart
	bl sub_800BF30
	b _0800BEEA
	.align 2, 0
_0800BEBC: .4byte gMPlayInfo_BGM
_0800BEC0: .4byte gUnknown_080D5254
_0800BEC4:
	ldr r2, _0800BEF0 @ =gLevelSongs
	ldr r0, _0800BEF4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xf
	ands r1, r3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0800BEEA
	strb r6, [r5, #5]
	bl sub_800BF30
_0800BEEA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BEF0: .4byte gLevelSongs
_0800BEF4: .4byte gCurrentLevel

	thumb_func_start sub_800BEF8
sub_800BEF8: @ 0x0800BEF8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0800BF28 @ =sub_800BD10
	movs r2, #0x80
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r0, _0800BF2C @ =gUnknown_030054A8
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strh r4, [r0, #6]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF28: .4byte sub_800BD10
_0800BF2C: .4byte gUnknown_030054A8

	thumb_func_start sub_800BF30
sub_800BF30: @ 0x0800BF30
	push {r4, lr}
	ldr r4, _0800BF6C @ =gMPlayInfo_BGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #4
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	movs r1, #4
	bl m4aMPlayFadeIn
	ldr r0, _0800BF70 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF64
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF6C: .4byte gMPlayInfo_BGM
_0800BF70: .4byte gPlayer

	thumb_func_start sub_800BF74
sub_800BF74: @ 0x0800BF74
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r4, _0800BFA4 @ =gMPlayInfo_BGM
	lsrs r1, r1, #0x14
	adds r0, r4, #0
	bl m4aMPlayFadeOutTemporarily
	ldr r0, _0800BFA8 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF9C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFA4: .4byte gMPlayInfo_BGM
_0800BFA8: .4byte gPlayer

	thumb_func_start sub_800BFAC
sub_800BFAC: @ 0x0800BFAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	movs r7, #0
	ldr r1, [r0, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BFD2
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800BFD6
_0800BFD2:
	movs r0, #0
	b _0800C054
_0800BFD6:
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r4, #0
	ldrsb r4, [r6, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C004
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C010
	cmp r2, r1
	blt _0800C052
_0800C004:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C052
_0800C010:
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r4, #1
	ldrsb r4, [r6, r4]
	adds r3, r0, r4
	cmp r2, r3
	bgt _0800C040
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C04C
	cmp r2, r3
	blt _0800C052
_0800C040:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C052
_0800C04C:
	movs r0, #0x80
	lsls r0, r0, #0xc
	orrs r7, r0
_0800C052:
	adds r0, r7, #0
_0800C054:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

    @ Returns flags/a bitarray
    @ Maybe collision-hit test?
	thumb_func_start sub_800C060
sub_800C060: @ 0x0800C060
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r0, #0
	mov sl, r0
	mov ip, r0
	ldr r1, [r6, #0x28]
	subs r0, #1
	cmp r1, r0
	beq _0800C0AE
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C0B2
_0800C0AE:
	movs r0, #0
	b _0800C1F2
_0800C0B2:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800C0CC
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800C0CC
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r1, #1
	mov ip, r1
_0800C0CC:
	adds r0, r6, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r0, r3, r7
	lsls r2, r0, #8
	mov r0, sp
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r1, r0, r1
	cmp r2, r1
	bgt _0800C100
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	lsls r0, r0, #8
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C112
	cmp r2, r1
	blt _0800C1D4
_0800C100:
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #8
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C1D4
_0800C112:
	adds r2, r6, #0
	adds r2, #0x2d
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r1, r8
	adds r0, r4, r1
	lsls r3, r0, #8
	mov r0, sp
	movs r7, #1
	ldrsb r7, [r0, r7]
	lsls r1, r7, #8
	ldr r0, [r5, #0xc]
	adds r1, r0, r1
	mov sb, r2
	cmp r3, r1
	bgt _0800C14A
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #8
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C15C
	cmp r3, r1
	blt _0800C1D4
_0800C14A:
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	lsls r0, r0, #8
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C1D4
_0800C15C:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0800C1D4
	mov r2, sp
	ldrb r1, [r5, #0x17]
	rsbs r0, r1, #0
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #3]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	mov r0, sl
	orrs r0, r1
	mov sl, r0
	mov r1, ip
	cmp r1, #0
	bne _0800C18A
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
_0800C18A:
	str r6, [r5, #0x3c]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, _0800C1B4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C1B8
	adds r0, r6, #0
	adds r0, #0x2f
	movs r1, #0
	ldrsb r1, [r0, r1]
	add r1, r8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	b _0800C1CA
	.align 2, 0
_0800C1B4: .4byte gUnknown_03005424
_0800C1B8:
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	add r1, r8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
_0800C1CA:
	lsls r1, r1, #8
	ldrb r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800C1F0
_0800C1D4:
	mov r1, ip
	cmp r1, #0
	beq _0800C1F0
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C1F0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0800C1F0:
	mov r0, sl
_0800C1F2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C204
sub_800C204: @ 0x0800C204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sl, r1
	str r2, [sp]
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x2c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, ip
	adds r0, #0x90
	ldr r6, [r0]
	adds r1, r6, #0
	adds r1, #0xc
	str r1, [sp, #4]
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C30C
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r0
	cmp r1, r2
	beq _0800C30C
	lsls r0, r5, #0x10
	asrs r5, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x34
	adds r1, r1, r5
	ldr r1, [r1]
	mov r8, r0
	cmp r1, r2
	beq _0800C30C
	adds r3, r7, r4
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r6, sl
	adds r2, r6, r4
	mov r0, ip
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r6, [sp, #4]
	adds r5, r6, r5
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _0800C2A0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C2B2
	cmp r2, r1
	blt _0800C30C
_0800C2A0:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C30C
_0800C2B2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r5, [sp]
	adds r2, r5, r4
	mov r6, ip
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r5, r8
	asrs r0, r5, #0xd
	ldr r6, [sp, #4]
	adds r5, r6, r0
	adds r0, r5, #0
	adds r0, #0x2d
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _0800C2F6
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C308
	cmp r2, r1
	blt _0800C30C
_0800C2F6:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C30C
_0800C308:
	movs r0, #1
	b _0800C30E
_0800C30C:
	movs r0, #0
_0800C30E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C320
sub_800C320: @ 0x0800C320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x20]
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r7, ip
	adds r7, #0xc
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C406
	lsls r0, r3, #0x10
	asrs r2, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x28
	adds r1, r1, r2
	ldr r1, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r0
	cmp r1, r3
	beq _0800C406
	ldr r0, [r7, #0x30]
	cmp r0, r3
	beq _0800C406
	adds r3, r6, r2
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800C3A0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C3B2
	cmp r2, r1
	blt _0800C406
_0800C3A0:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C406
_0800C3B2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r6, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, sl
	adds r2, r0, r4
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r1, #0x35
	ldrsb r5, [r1, r7]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800C3EA
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C3FC
	cmp r2, r1
	blt _0800C406
_0800C3EA:
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C406
_0800C3FC:
	mov r0, r8
	bl sub_800CB18
	movs r0, #1
	b _0800C408
_0800C406:
	movs r0, #0
_0800C408:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C418
sub_800C418: @ 0x0800C418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, [sp, #0x18]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C4F0
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r5, #1
	rsbs r5, r5, #0
	mov ip, r0
	cmp r1, r5
	beq _0800C4F0
	ldr r0, _0800C4EC @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	beq _0800C4F0
	adds r3, r0, #0
	ldr r0, [r3, #0x4c]
	cmp r0, r5
	beq _0800C4F0
	adds r4, r7, r4
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r6, r5
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C48E
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C4A0
	cmp r2, r1
	blt _0800C4F0
_0800C48E:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C4F0
_0800C4A0:
	mov r1, ip
	asrs r0, r1, #0xd
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, r8
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C4D6
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C4E8
	cmp r2, r1
	blt _0800C4F0
_0800C4D6:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C4F0
_0800C4E8:
	movs r0, #1
	b _0800C4F2
	.align 2, 0
_0800C4EC: .4byte gUnknown_030056A4
_0800C4F0:
	movs r0, #0
_0800C4F2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C4FC
sub_800C4FC: @ 0x0800C4FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _0800C58C @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	lsls r1, r3, #3
	mov r0, sb
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C532
	b _0800C838
_0800C532:
	ldr r0, _0800C590 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r0, _0800C58C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r0, #0x80
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _0800C550
	b _0800C838
_0800C550:
	ldr r0, _0800C594 @ =gGameMode
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #2
	bls _0800C598
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C598
	mov r2, sl
	lsls r5, r2, #0x10
	asrs r5, r5, #0x10
	ldr r0, [sp]
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateTrappedAnimal
	movs r0, #1
	b _0800C83A
	.align 2, 0
_0800C58C: .4byte gPlayer
_0800C590: .4byte gCurTask
_0800C594: .4byte gGameMode
_0800C598:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	beq _0800C5A4
	b _0800C73A
_0800C5A4:
	ldr r1, [r6, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C674
	ldr r1, [sp, #4]
	lsls r2, r1, #3
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r1, sl
	adds r3, r1, r5
	ldr r1, _0800C670 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x34
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C5EC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C5FE
	cmp r3, r1
	blt _0800C674
_0800C5EC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C5FE:
	add r2, sb
	adds r0, r2, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp]
	adds r3, r0, r4
	ldr r1, _0800C670 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r3, r1
	bgt _0800C636
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C648
	cmp r3, r1
	blt _0800C674
_0800C636:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C648:
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #2
	bls _0800C666
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C666:
	ldr r0, _0800C670 @ =gPlayer
	bl sub_800CB18
	b _0800C802
	.align 2, 0
_0800C670: .4byte gPlayer
_0800C674:
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C73A
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, sl
	adds r3, r0, r5
	ldr r1, _0800C730 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C6BC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C6CE
	cmp r3, r1
	blt _0800C73A
_0800C6BC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C73A
_0800C6CE:
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, [sp]
	adds r2, r1, r5
	ldr r1, _0800C730 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C70A
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C71C
	cmp r2, r3
	blt _0800C73A
_0800C70A:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C73A
_0800C71C:
	ldr r0, _0800C730 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800C734
	mov r2, ip
	ldrb r0, [r2]
	b _0800C7E8
	.align 2, 0
_0800C730: .4byte gPlayer
_0800C734:
	ldr r0, _0800C82C @ =gPlayer
	bl sub_800CBA4
_0800C73A:
	ldr r0, _0800C830 @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	bne _0800C744
	b _0800C838
_0800C744:
	adds r3, r0, #0
	ldr r1, [r3, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C838
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r5, r1, r2
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	mov r0, sl
	adds r4, r0, r6
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r4, r1
	bgt _0800C78C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r4, r0
	cmp r0, r1
	bge _0800C79E
	cmp r4, r1
	blt _0800C838
_0800C78C:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r4
	blt _0800C838
_0800C79E:
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp]
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C7D2
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C7E4
	cmp r2, r1
	blt _0800C838
_0800C7D2:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C838
_0800C7E4:
	ldr r0, _0800C834 @ =gGameMode
	ldrb r0, [r0]
_0800C7E8:
	cmp r0, #2
	bls _0800C802
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C802:
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	ldr r1, [sp]
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateTrappedAnimal
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8009530
	movs r0, #1
	b _0800C83A
	.align 2, 0
_0800C82C: .4byte gPlayer
_0800C830: .4byte gUnknown_030056A4
_0800C834: .4byte gGameMode
_0800C838:
	movs r0, #0
_0800C83A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C84C
sub_800C84C: @ 0x0800C84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	ldr r4, _0800C898 @ =gPlayer
	ldr r3, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	bne _0800C894
	ldr r0, [r5, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800C934
	adds r7, r4, #0
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	movs r0, #0x80
	ands r3, r0
	cmp r3, #0
	bne _0800C894
	ldr r0, [r6, #0x28]
	cmp r0, r1
	bne _0800C89C
_0800C894:
	movs r0, #0
	b _0800C936
	.align 2, 0
_0800C898: .4byte gPlayer
_0800C89C:
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r2, r0, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C8D2
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C8E4
	cmp r2, r3
	blt _0800C934
_0800C8D2:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C934
_0800C8E4:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, sb
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C918
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C92A
	cmp r2, r1
	blt _0800C934
_0800C918:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C934
_0800C92A:
	adds r0, r7, #0
	bl sub_800CBA4
	movs r0, #1
	mov sl, r0
_0800C934:
	mov r0, sl
_0800C936:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C944
sub_800C944: @ 0x0800C944
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r3, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	ldr r7, _0800CA1C @ =gPlayer
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CA0C
	ldr r0, [r6, #0x30]
	subs r1, #0x81
	cmp r0, r1
	beq _0800CA0C
	ldr r0, [r5, #0x28]
	cmp r0, r1
	beq _0800CA0C
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r3, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C9B0
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C9C2
	cmp r2, r3
	blt _0800CA0C
_0800C9B0:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800CA0C
_0800C9C2:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C9F6
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CA08
	cmp r2, r1
	blt _0800CA0C
_0800C9F6:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CA0C
_0800CA08:
	movs r0, #1
	mov sb, r0
_0800CA0C:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CA1C: .4byte gPlayer

	thumb_func_start sub_800CA20
sub_800CA20: @ 0x0800CA20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x20]
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r7, ip
	adds r7, #0xc
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CB06
	lsls r0, r3, #0x10
	asrs r2, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x28
	adds r1, r1, r2
	ldr r1, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r0
	cmp r1, r3
	beq _0800CB06
	ldr r0, [r7, #0x28]
	cmp r0, r3
	beq _0800CB06
	adds r3, r6, r2
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800CAA0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CAB2
	cmp r2, r1
	blt _0800CB06
_0800CAA0:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CB06
_0800CAB2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r6, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, sl
	adds r2, r0, r4
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r1, #0x2d
	ldrsb r5, [r1, r7]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800CAEA
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CAFC
	cmp r2, r1
	blt _0800CB06
_0800CAEA:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CB06
_0800CAFC:
	mov r0, r8
	bl sub_800CBA4
	movs r0, #1
	b _0800CB08
_0800CB06:
	movs r0, #0
_0800CB08:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CB18
sub_800CB18: @ 0x0800CB18
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0800CB38
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0
	movs r0, #8
	strb r0, [r3]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	b _0800CB8E
_0800CB38:
	ldr r0, _0800CB74 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CB58
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CB54
	ldr r0, _0800CB78 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CB58
_0800CB54:
	cmp r1, #0x1d
	bne _0800CB80
_0800CB58:
	ldrh r1, [r2, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	rsbs r1, r1, #0
	ldrh r0, [r2, #0x12]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	ldr r0, _0800CB7C @ =gCamera
	ldr r0, [r0, #0x38]
	lsls r0, r0, #8
	subs r1, r1, r0
	strh r1, [r2, #0x10]
	b _0800CB8E
	.align 2, 0
_0800CB74: .4byte gCurrentLevel
_0800CB78: .4byte gUnknown_030054B0
_0800CB7C: .4byte gCamera
_0800CB80:
	ldrh r1, [r2, #0x12]
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0800CB8E
	rsbs r0, r1, #0
	strh r0, [r2, #0x12]
_0800CB8E:
	ldr r0, _0800CBA0 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0800CBA0: .4byte gPlayer

	thumb_func_start sub_800CBA4
sub_800CBA4: @ 0x0800CBA4
	push {r4, r5, lr}
	mov ip, r0
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0800CBBA
	mov r2, ip
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0800CBBE
_0800CBBA:
	movs r0, #0
	b _0800CCB0
_0800CBBE:
	movs r0, #0x78
	mov r2, ip
	strh r0, [r2, #0x2c]
	ldr r0, [r2, #0x20]
	movs r5, #0x80
	lsls r5, r5, #0x11
	ands r0, r5
	mov r4, ip
	adds r4, #0x37
	cmp r0, #0
	beq _0800CC10
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	ldr r1, _0800CC70 @ =0xFEFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0800CC74 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ands r0, r5
	cmp r0, #0
	bne _0800CC18
_0800CC10:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
_0800CC18:
	ldrb r0, [r4]
	movs r1, #0x7f
	ands r1, r0
	strb r1, [r4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0800CCA0
	ldr r2, _0800CC78 @ =gRingCount
	ldrh r0, [r2]
	cmp r0, #0
	beq _0800CC80
	adds r4, r0, #0
	ldr r0, _0800CC7C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800CC44
	adds r0, r4, #0
	cmp r4, #0xa
	bls _0800CC42
	movs r0, #0xa
_0800CC42:
	adds r4, r0, #0
_0800CC44:
	mov r2, ip
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldr r0, _0800CC7C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800CC66
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800CC66:
	ldr r1, _0800CC78 @ =gRingCount
	ldrh r0, [r1]
	subs r0, r0, r4
	strh r0, [r1]
	b _0800CCAE
	.align 2, 0
_0800CC70: .4byte 0xFEFFFFFF
_0800CC74: .4byte 0xFFFFCFFF
_0800CC78: .4byte gRingCount
_0800CC7C: .4byte gGameMode
_0800CC80:
	ldr r0, _0800CC9C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800CCAE
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	str r0, [r2, #0x20]
	b _0800CCAE
	.align 2, 0
_0800CC9C: .4byte gUnknown_03005424
_0800CCA0:
	movs r0, #0x77 @ SE_LIFE_LOST
	bl m4aSongNumStart
	ldrb r1, [r4]
	movs r0, #0xf6
	ands r0, r1
	strb r0, [r4]
_0800CCAE:
	movs r0, #1
_0800CCB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

@ Returns some flags
@ u32 sub_800CCB8 (Sprite*, s32 x, s32 y, Player*);
	thumb_func_start sub_800CCB8
sub_800CCB8: @ 0x0800CCB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800CD00
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CD04
_0800CD00:
	movs r0, #0
	b _0800CDA2
_0800CD04:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CD20
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800CD20
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0800CD20:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_800CE94
	adds r2, r0, #0
	cmp r2, #0
	beq _0800CD58
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800CDA0
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	cmp r4, #0
	bne _0800CDA0
	cmp r6, #0
	bne _0800CDA0
	ldrh r0, [r5, #0x10]
	b _0800CD9E
_0800CD58:
	cmp r4, #0
	beq _0800CDA0
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800CDA0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
	str r2, [r5, #0x3c]
	ldr r0, _0800CDB0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CD94
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CD90
	ldr r0, _0800CDB4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CD94
_0800CD90:
	cmp r1, #0x1d
	bne _0800CDA0
_0800CD94:
	ldr r0, _0800CDB8 @ =gCamera
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
_0800CD9E:
	strh r0, [r5, #0x14]
_0800CDA0:
	adds r0, r2, #0
_0800CDA2:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CDB0: .4byte gCurrentLevel
_0800CDB4: .4byte gUnknown_030054B0
_0800CDB8: .4byte gCamera

	thumb_func_start sub_800CDBC
sub_800CDBC: @ 0x0800CDBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800CE04
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CE08
_0800CE04:
	movs r0, #0
	b _0800CE7A
_0800CE08:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CE20
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800CE20
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
_0800CE20:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_800CE94
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800CE46
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	b _0800CE78
_0800CE46:
	cmp r4, #0
	beq _0800CE78
	str r0, [r5, #0x3c]
	ldr r0, _0800CE88 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CE6C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CE68
	ldr r0, _0800CE8C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CE6C
_0800CE68:
	cmp r1, #0x1d
	bne _0800CE78
_0800CE6C:
	ldr r0, _0800CE90 @ =gCamera
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
	strh r0, [r5, #0x14]
_0800CE78:
	adds r0, r2, #0
_0800CE7A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CE88: .4byte gCurrentLevel
_0800CE8C: .4byte gUnknown_030054B0
_0800CE90: .4byte gCamera

	thumb_func_start sub_800CE94
sub_800CE94: @ 0x0800CE94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	mov sl, r1
	str r2, [sp]
	adds r4, r3, #0
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	mov sb, r0
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [sp, #4]
	movs r5, #0
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r7, sl
	adds r2, r7, r3
	movs r6, #0
	ldrsb r6, [r4, r6]
	mov r0, sb
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800CEEC
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CEFA
	cmp r2, r1
	bge _0800CEEC
	b _0800D086
_0800CEEC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _0800CEFA
	b _0800D086
_0800CEFA:
	mov r1, ip
	adds r1, #0x2d
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r2, [sp]
	adds r3, r2, r6
	movs r0, #1
	ldrsb r0, [r4, r0]
	ldr r7, [sp, #4]
	adds r2, r7, r0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r3, r2
	bgt _0800CF2E
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r2
	bge _0800CF3E
	cmp r3, r2
	bge _0800CF2E
	b _0800D086
_0800CF2E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800CF3E
	b _0800D086
_0800CF3E:
	mov r0, ip
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r0, #2
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r2, r7, r6
	asrs r2, r2, #1
	add r2, sl
	ldr r3, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r3, r0]
	mov r3, ip
	adds r3, #0x2f
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [sp]
	adds r1, r1, r0
	mov ip, r1
	cmp r2, sb
	bgt _0800CF80
	mov r2, sl
	adds r0, r2, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xb
	b _0800CF90
_0800CF80:
	mov r1, sl
	adds r0, r1, r7
	movs r1, #2
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xc
_0800CF90:
	orrs r5, r0
	ldr r2, [sp, #4]
	cmp ip, r2
	ble _0800CFB8
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r7, [sp]
	adds r1, r7, r1
	movs r0, #3
	ldrsb r0, [r4, r0]
	adds r0, r2, r0
	subs r3, r1, r0
	adds r1, r3, #5
	cmp r1, #0
	ble _0800CFB2
	movs r1, #0
_0800CFB2:
	movs r0, #0x80
	lsls r0, r0, #9
	b _0800CFD4
_0800CFB8:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r1, r2, r3
	subs r3, r0, r1
	adds r1, r3, #2
	cmp r1, #0
	bge _0800CFD0
	movs r1, #0
_0800CFD0:
	movs r0, #0x80
	lsls r0, r0, #0xa
_0800CFD4:
	orrs r5, r0
	adds r2, r6, #0
	cmp r6, #0
	bge _0800CFDE
	rsbs r2, r6, #0
_0800CFDE:
	adds r0, r1, #0
	cmp r0, #0
	bge _0800CFE6
	rsbs r0, r0, #0
_0800CFE6:
	cmp r2, r0
	bge _0800CFF2
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r5, r0
	b _0800D04A
_0800CFF2:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r5, r0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r5
	cmp r0, #0
	beq _0800D04A
	ldr r0, _0800D01C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800D020
	mov r7, r8
	movs r1, #0x12
	ldrsh r0, [r7, r1]
	cmp r0, #0
	ble _0800D02A
_0800D018:
	movs r0, #0
	b _0800D088
	.align 2, 0
_0800D01C: .4byte gUnknown_03005424
_0800D020:
	mov r2, r8
	movs r7, #0x12
	ldrsh r0, [r2, r7]
	cmp r0, #0
	blt _0800D018
_0800D02A:
	mov r0, r8
	ldr r2, [r0, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0800D04A
	mov r0, r8
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800D04A
	mov r1, r8
	strh r2, [r1, #0x14]
_0800D04A:
	lsls r0, r6, #8
	movs r2, #0xff
	lsls r2, r2, #8
	ands r0, r2
	movs r1, #0xff
	ands r3, r1
	orrs r0, r3
	orrs r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _0800D074
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _0800D078
	ldr r0, _0800D070 @ =0xFFF300FF
	b _0800D076
	.align 2, 0
_0800D070: .4byte 0xFFF300FF
_0800D074:
	ldr r0, _0800D098 @ =0xFFFF00FF
_0800D076:
	ands r5, r0
_0800D078:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r5
	cmp r0, #0
	bne _0800D086
	ldr r0, _0800D09C @ =0xFFFFFF00
	ands r5, r0
_0800D086:
	adds r0, r5, #0
_0800D088:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D098: .4byte 0xFFFF00FF
_0800D09C: .4byte 0xFFFFFF00

	thumb_func_start sub_800D0A0
sub_800D0A0: @ 0x0800D0A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x2c]
	ldr r7, _0800D1D8 @ =gPlayer
	ldrb r3, [r7, #0x16]
	adds r3, #5
	rsbs r0, r3, #0
	add r1, sp, #8
	mov sb, r1
	strb r0, [r1]
	ldrb r1, [r7, #0x17]
	movs r6, #1
	subs r2, r6, r1
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r1, #1
	adds r0, #1
	strb r1, [r0]
	add r0, sp, #4
	mov r1, sb
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r2, sp, #0xc
	mov r8, r2
	strb r0, [r2]
	ldrb r2, [r7, #0x17]
	rsbs r1, r2, #0
	mov r0, sp
	adds r0, #0xd
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, sb
	mov r1, r8
	movs r2, #4
	bl memcpy
	movs r3, #0
	str r3, [sp, #0x30]
	movs r4, #0
	str r4, [sp, #0x34]
	ldr r0, _0800D1DC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r0, _0800D1E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0x16]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _0800D1E4 @ =IWRAM_START + 0x58
	adds r4, r4, r0
	ldrb r0, [r4]
	subs r6, r6, r0
	mov r0, sp
	adds r0, #0x11
	strb r6, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r4]
	subs r0, #1
	mov r1, sp
	adds r1, #0x13
	strb r0, [r1]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r1, sp, #0x14
	strb r0, [r1]
	ldrb r0, [r4]
	rsbs r0, r0, #0
	mov r2, sp
	adds r2, #0x15
	strb r0, [r2]
	mov r0, sp
	adds r0, #0x16
	strb r3, [r0]
	ldrb r2, [r4]
	adds r0, #1
	strb r2, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl memcpy
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800D1D2
	ldr r0, [r7, #0x20]
	movs r3, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0800D1D2
	ldr r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	str r0, [sp, #0x40]
	cmp r2, r1
	bne _0800D1E8
	ldr r0, [sp, #0x20]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	cmp r1, r0
	bne _0800D1E8
_0800D1D2:
	movs r0, #0
	bl _0800DA38
	.align 2, 0
_0800D1D8: .4byte gPlayer
_0800D1DC: .4byte gUnknown_03005424
_0800D1E0: .4byte gCurTask
_0800D1E4: .4byte IWRAM_START + 0x58
_0800D1E8:
	ldr r0, _0800D2CC @ =gPlayer
	ldr r1, [r0, #8]
	mov sb, r1
	ldr r2, [r0, #0xc]
	str r2, [sp, #0x38]
	adds r1, r0, #0
	adds r1, #0x38
	adds r6, r0, #0
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	cmp r3, r1
	beq _0800D204
	bl _0800DA36
_0800D204:
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D222
	ldr r0, [r6, #0x3c]
	ldr r4, [sp, #0x18]
	cmp r0, r4
	bne _0800D222
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	movs r0, #1
	str r0, [sp, #0x34]
_0800D222:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	ldr r2, [sp, #0x38]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _0800D236
	b _0800D580
_0800D236:
	ldr r3, [sp, #0x40]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r4, sb
	asrs r0, r4, #8
	mov r1, sp
	movs r4, #8
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov ip, r0
	cmp r2, r1
	bgt _0800D264
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D274
	cmp r2, r1
	bge _0800D264
	b _0800D580
_0800D264:
	mov r3, sp
	movs r0, #0xa
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D274
	b _0800D580
_0800D274:
	asrs r0, r7, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, sp
	movs r4, #9
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800D29C
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D2AC
	cmp r2, r1
	bge _0800D29C
	b _0800D580
_0800D29C:
	mov r3, sp
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D2AC
	b _0800D580
_0800D2AC:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D2D0
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D2BA
	b _0800D440
_0800D2BA:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D440
	.align 2, 0
_0800D2CC: .4byte gPlayer
_0800D2D0:
	asrs r0, r7, #0x10
	cmp r8, r0
	bgt _0800D2D8
	b _0800D43A
_0800D2D8:
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D43A
_0800D2EA:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0800D38E
	asrs r0, r7, #0x10
	movs r1, #1
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D35C @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D360 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D364
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	mov r5, sp
	ldrh r5, [r5, #0x3c]
	strh r5, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D35C: .4byte 0xFFFFFF00
_0800D360: .4byte sub_801EC3C
_0800D364:
	movs r0, #8
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	ldr r1, [r6, #0x20]
	orrs r1, r0
	subs r0, #0xb
	ands r1, r0
	str r1, [r6, #0x20]
	ldr r2, [sp, #0x18]
	str r2, [r6, #0x3c]
	mov r3, sp
	ldrh r3, [r3, #0x3c]
	strh r3, [r6, #0x12]
	ldr r4, [sp, #0x38]
	str r4, [r6, #0xc]
	ldr r5, [sp, #0x34]
	cmp r5, #0
	beq _0800D38C
	b _0800DA1E
_0800D38C:
	b _0800D426
_0800D38E:
	asrs r0, r7, #0x10
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D3F8 @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, _0800D3FC @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D400
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D3F8: .4byte 0xFFFFFF00
_0800D3FC: .4byte sub_801EC3C
_0800D400:
	movs r1, #8
	ldr r4, [sp, #0x30]
	orrs r4, r1
	str r4, [sp, #0x30]
	ldr r0, [r6, #0x20]
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r5, [sp, #0x18]
	str r5, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r0, [sp, #0x38]
	str r0, [r6, #0xc]
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800D426
	b _0800DA1E
_0800D426:
	adds r0, r6, #0
	bl sub_8021BE0
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	b _0800DA18
_0800D43A:
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	bne _0800D460
_0800D440:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D458
	movs r3, #0x12
	ldrsh r0, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
_0800D458:
	ldr r5, [sp, #0x3c]
	cmp r5, #0
	bne _0800D460
	b _0800D580
_0800D460:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D468
	b _0800D580
_0800D468:
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
	b _0800D580
_0800D47C:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D500
	ldr r5, _0800D4CC @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	add r0, r8
	ldr r1, _0800D4D0 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D4D4
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x3c]
	strh r0, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D4DC
	.align 2, 0
_0800D4CC: .4byte gPlayer
_0800D4D0: .4byte sub_801EC3C
_0800D4D4:
	mov r1, sb
	str r1, [r5, #8]
	ldr r2, [sp, #0x38]
	str r2, [r5, #0xc]
_0800D4DC:
	ldr r0, _0800D4FC @ =gPlayer
	movs r3, #0x12
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0x44]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D4FC: .4byte gPlayer
_0800D500:
	ldr r5, _0800D54C @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	mov r1, r8
	subs r0, r1, r0
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D550 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D554
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r1, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D55C
	.align 2, 0
_0800D54C: .4byte gPlayer
_0800D550: .4byte sub_801EC3C
_0800D554:
	mov r2, sb
	str r2, [r5, #8]
	ldr r3, [sp, #0x38]
	str r3, [r5, #0xc]
_0800D55C:
	ldr r0, _0800D57C @ =gPlayer
	movs r4, #0x12
	ldrsh r1, [r0, r4]
	ldr r5, [sp, #0x44]
	asrs r2, r5, #0x10
	adds r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D57C: .4byte gPlayer
_0800D580:
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D598
	b _0800DA18
_0800D598:
	ldr r2, [sp, #0x40]
	asrs r0, r2, #0x10
	mov r3, sp
	movs r4, #0xc
	ldrsb r4, [r3, r4]
	adds r3, r0, r4
	mov r5, sb
	asrs r1, r5, #8
	add r0, sp, #4
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r1, r5
	mov ip, r1
	cmp r3, r2
	bgt _0800D5CA
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0800D5DC
	cmp r3, r2
	bge _0800D5CA
	b _0800DA18
_0800D5CA:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800D5DC
	b _0800DA18
_0800D5DC:
	asrs r0, r7, #0x10
	mov r3, sp
	movs r2, #0xd
	ldrsb r2, [r3, r2]
	adds r1, r0, r2
	add r0, sp, #4
	movs r4, #1
	ldrsb r4, [r0, r4]
	mov r5, r8
	adds r3, r5, r4
	cmp r1, r3
	bgt _0800D608
	mov r5, sp
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _0800D61A
	cmp r1, r3
	bge _0800D608
	b _0800DA18
_0800D608:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800D61A
	b _0800DA18
_0800D61A:
	ldr r0, [sp, #0x40]
	asrs r1, r0, #0x10
	cmp ip, r1
	ble _0800D624
	b _0800D818
_0800D624:
	ldr r3, [r6, #0x20]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _0800D630
	b _0800D794
_0800D630:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r4, [sp, #0x30]
	orrs r4, r0
	str r4, [sp, #0x30]
	adds r7, r6, #0
	adds r7, #0x62
	movs r5, #0
	ldrsb r5, [r7, r5]
	cmp r5, #0
	beq _0800D64A
	strh r2, [r6, #0x10]
	b _0800DA18
_0800D64A:
	mov r2, sp
	movs r0, #0xc
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _0800D66A
	rsbs r1, r1, #0
_0800D66A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D6E0
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	mov r1, sl
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _0800D6CA
	ldr r2, [sp, #0x2c]
	cmp r2, #0
	beq _0800D6B8
	movs r4, #0
	strh r1, [r6, #0x14]
	mov r3, sl
	strh r3, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D6B4 @ =PlayerCB_8025318
	str r0, [r6]
	adds r0, r6, #0
	b _0800DA00
	.align 2, 0
_0800D6B4: .4byte PlayerCB_8025318
_0800D6B8:
	mov r4, sl
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r0, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	str r0, [r6, #8]
	b _0800DA18
_0800D6CA:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0x20]
	ldr r0, _0800D6DC @ =0x0000FE80
	strh r0, [r6, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r6, #0x12]
	b _0800DA18
	.align 2, 0
_0800D6DC: .4byte 0x0000FE80
_0800D6E0:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0800D6EA
	b _0800DA18
_0800D6EA:
	mov r2, sb
	asrs r0, r2, #8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	mov r3, r8
	subs r1, r3, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _0800D734 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D738
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r5, [r6, #0x10]
	lsls r1, r4, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	b _0800DA18
	.align 2, 0
_0800D734: .4byte sub_801EB44
_0800D738:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D770
	movs r0, #0x20
	orrs r1, r0
	ldr r4, [sp, #0x30]
	orrs r4, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r6, #0x20]
	ands r4, r0
	str r4, [sp, #0x30]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D790 @ =PlayerCB_8025318
	str r0, [r6]
_0800D770:
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [sp, #0x30]
	ands r0, r1
	str r0, [sp, #0x30]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x10]
	mov r1, sb
	str r1, [r6, #8]
	ldr r2, [sp, #0x38]
	str r2, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D790: .4byte PlayerCB_8025318
_0800D794:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r3, [sp, #0x30]
	orrs r3, r0
	str r3, [sp, #0x30]
	adds r5, r6, #0
	adds r5, #0x62
	movs r3, #0
	ldrsb r3, [r5, r3]
	cmp r3, #0
	beq _0800D7B0
	movs r0, #0
	strh r0, [r6, #0x10]
	b _0800DA18
_0800D7B0:
	mov r4, sl
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D7BE
	rsbs r2, r1, #0
_0800D7BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _0800D7C8
	b _0800DA18
_0800D7C8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	blt _0800D7D8
	b _0800DA14
_0800D7D8:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D810
	movs r4, #0
	mov r0, sl
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D80C @ =PlayerCB_8025318
	str r0, [r6]
	adds r0, r6, #0
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r5]
	b _0800DA18
	.align 2, 0
_0800D80C: .4byte PlayerCB_8025318
_0800D810:
	adds r0, r6, #0
	bl sub_800DE44
	b _0800DA18
_0800D818:
	adds r5, r6, #0
	ldr r3, [r5, #0x20]
	movs r7, #1
	adds r2, r3, #0
	ands r2, r7
	cmp r2, #0
	bne _0800D828
	b _0800D998
_0800D828:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	ldr r4, _0800D844 @ =gPlayer + 0x62
	movs r6, #0
	ldrsb r6, [r4, r6]
	cmp r6, #0
	beq _0800D848
	movs r0, #0
	strh r0, [r5, #0x10]
	b _0800DA18
	.align 2, 0
_0800D844: .4byte gPlayer + 0x62
_0800D848:
	mov r2, sp
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r5, r4]
	cmp r1, #0
	bge _0800D868
	rsbs r1, r1, #0
_0800D868:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D8E8
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	mov r2, sl
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800D8D4
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D8C0
	movs r4, #0
	strh r2, [r5, #0x14]
	mov r0, sl
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D8B8 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	ldr r1, _0800D8BC @ =gPlayer + 0x62
	strb r4, [r1]
	b _0800DA18
	.align 2, 0
_0800D8B8: .4byte PlayerCB_8025318
_0800D8BC: .4byte gPlayer + 0x62
_0800D8C0:
	mov r2, sl
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r3, _0800D8D0 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D8D0: .4byte 0xFFFFFF00
_0800D8D4:
	movs r0, #2
	orrs r3, r0
	str r3, [r5, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0800DA18
_0800D8E8:
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bne _0800D8F2
	b _0800DA18
_0800D8F2:
	mov r1, sb
	asrs r0, r1, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	add r1, r8
	ldr r2, _0800D938 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D93C
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x10]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D938: .4byte sub_801EB44
_0800D93C:
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D974
	movs r0, #0x20
	orrs r1, r0
	ldr r2, [sp, #0x30]
	orrs r2, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r5, #0x20]
	ands r2, r0
	str r2, [sp, #0x30]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D994 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
_0800D974:
	ldr r0, [r5, #0x20]
	orrs r0, r7
	str r0, [r5, #0x20]
	ldr r3, [sp, #0x30]
	orrs r3, r7
	str r3, [sp, #0x30]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	str r0, [r5, #8]
	ldr r4, [sp, #0x38]
	str r4, [r5, #0xc]
	b _0800DA18
	.align 2, 0
_0800D994: .4byte PlayerCB_8025318
_0800D998:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r5, #0x20]
	adds r7, r5, #0
	adds r7, #0x62
	movs r3, #0
	ldrsb r3, [r7, r3]
	cmp r3, #0
	beq _0800D9B0
	strh r2, [r5, #0x10]
	b _0800DA18
_0800D9B0:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D9BE
	rsbs r2, r1, #0
_0800D9BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	ble _0800DA18
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	ble _0800DA14
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800DA0C
	movs r4, #0
	mov r0, sl
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800DA08 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
_0800DA00:
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r7]
	b _0800DA18
	.align 2, 0
_0800DA08: .4byte PlayerCB_8025318
_0800DA0C:
	adds r0, r5, #0
	bl sub_800DE44
	b _0800DA18
_0800DA14:
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x10]
_0800DA18:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800DA36
_0800DA1E:
	ldr r2, _0800DA48 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DA36
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_0800DA36:
	ldr r0, [sp, #0x30]
_0800DA38:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA48: .4byte gPlayer

	thumb_func_start sub_800DA4C
sub_800DA4C: @ 0x0800DA4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r2, _0800DAB0 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800DAAA
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	bne _0800DAAA
	ldr r1, _0800DAB4 @ =gMultiplayerPlayerTasks
	ldr r0, _0800DAB8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	mov sb, r6
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r4, r0
	beq _0800DABC
_0800DAAA:
	movs r0, #0
	b _0800DD44
	.align 2, 0
_0800DAB0: .4byte gPlayer
_0800DAB4: .4byte gMultiplayerPlayerTasks
_0800DAB8: .4byte 0x04000128
_0800DABC:
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _0800DB70
	ldr r1, [r5, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800DB70
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	ldr r7, _0800DC50 @ =IWRAM_START + 0x50
	adds r0, r3, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r7, _0800DC54 @ =IWRAM_START + 0x2C
	adds r0, r3, r7
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	cmp r2, r1
	bgt _0800DB08
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB1A
	cmp r2, r1
	blt _0800DB70
_0800DB08:
	ldr r4, _0800DC58 @ =IWRAM_START + 0x2E
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB1A:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800DB56
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB68
	cmp r2, r1
	blt _0800DB70
_0800DB56:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB68:
	movs r0, #2
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DB70:
	ldr r0, [r6, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0800DB7C
	b _0800DC8C
_0800DB7C:
	ldr r0, [r5, #0x28]
	cmp r0, r1
	bne _0800DB84
	b _0800DC8C
_0800DB84:
	ldr r4, [sp]
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	adds r0, r5, #0
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r1, r7
	mov r2, sb
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	cmp r4, r1
	bgt _0800DBC8
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r4, r0
	cmp r0, r1
	bge _0800DBDC
	cmp r4, r1
	blt _0800DC8C
_0800DBC8:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r4
	blt _0800DC8C
_0800DBDC:
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r4, r0, r1
	mov r1, sb
	adds r1, #0x52
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r3, #0x35
	ldrsb r7, [r3, r6]
	mov ip, r7
	adds r3, r0, r7
	mov sl, r2
	adds r2, r1, #0
	cmp r4, r3
	bgt _0800DC20
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r4, r0
	cmp r0, r3
	bge _0800DC34
	cmp r4, r3
	blt _0800DC8C
_0800DC20:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _0800DC8C
_0800DC34:
	ldr r0, [sp, #8]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0xc]
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC5C
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC66
	.align 2, 0
_0800DC50: .4byte IWRAM_START + 0x50
_0800DC54: .4byte IWRAM_START + 0x2C
_0800DC58: .4byte IWRAM_START + 0x2E
_0800DC5C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC66:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r4, sl
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC7E
	movs r0, #0x80
	lsls r0, r0, #9
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC88
_0800DC7E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC88:
	movs r0, #1
	b _0800DD3C
_0800DC8C:
	ldr r0, [r6, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800DD42
	ldr r0, [r5, #0x30]
	cmp r0, r1
	beq _0800DD42
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r3, r0, r2
	mov r0, sb
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r6, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r3, r1
	bgt _0800DCD8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	bge _0800DCEA
	cmp r3, r1
	blt _0800DD42
_0800DCD8:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r3
	blt _0800DD42
_0800DCEA:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r3, r6, #0
	adds r3, #0x2d
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800DD28
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DD3A
	cmp r2, r1
	blt _0800DD42
_0800DD28:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DD42
_0800DD3A:
	movs r0, #2
_0800DD3C:
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DD42:
	mov r0, r8
_0800DD44:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

@ In:
@  r0: Player*
	thumb_func_start sub_800DD54
sub_800DD54: @ 0x0800DD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DD68
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DD6C
_0800DD68:
	movs r0, #0
	b _0800DE2A
_0800DD6C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DD80
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0800DD82
_0800DD80:
	ldr r0, _0800DE30 @ =0x0000FE80
_0800DD82:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DDA2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DDA2:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DE34 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DE38 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0800DE3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DE22
	ldr r6, _0800DE40 @ =gRingCount
	ldrh r4, [r6]
	cmp r4, #0xa
	bls _0800DE04
	movs r4, #0xa
_0800DE04:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DE22:
	movs r0, #0x77
	bl m4aSongNumStart
	movs r0, #1
_0800DE2A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DE30: .4byte 0x0000FE80
_0800DE34: .4byte 0xFFFFFBFF
_0800DE38: .4byte 0xFFFFFEFF
_0800DE3C: .4byte gGameMode
_0800DE40: .4byte gRingCount

@ In:
@  r0: Player*
	thumb_func_start sub_800DE44
sub_800DE44: @ 0x0800DE44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DE58
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DE5C
_0800DE58:
	movs r0, #0
	b _0800DF20
_0800DE5C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DE74
	ldr r0, _0800DE70 @ =0x0000FE80
	b _0800DE78
	.align 2, 0
_0800DE70: .4byte 0x0000FE80
_0800DE74:
	movs r0, #0xc0
	lsls r0, r0, #1
_0800DE78:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DE98
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DE98:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DF28 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DF2C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0800DF30 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DF18
	ldr r6, _0800DF34 @ =gRingCount
	ldrh r4, [r6]
	cmp r4, #5
	bls _0800DEFA
	movs r4, #5
_0800DEFA:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DF18:
	movs r0, #0x77
	bl m4aSongNumStart
	movs r0, #1
_0800DF20:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DF28: .4byte 0xFFFFFBFF
_0800DF2C: .4byte 0xFFFFFEFF
_0800DF30: .4byte gGameMode
_0800DF34: .4byte gRingCount

	thumb_func_start sub_800DF38
sub_800DF38: @ 0x0800DF38
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldrb r5, [r4, #0x16]
	rsbs r0, r5, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r4, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r4, #0
	bl sub_800BFAC
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@ In:
@  r0: Player*
	thumb_func_start sub_800DF8C
sub_800DF8C: @ 0x0800DF8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0800DFB0 @ =0x00200080
	ands r0, r1
	cmp r0, #0
	beq _0800DFB4
	movs r0, #0
	movs r1, #0
	bl sub_800E0C0
	b _0800E0AE
	.align 2, 0
_0800DFB0: .4byte 0x00200080
_0800DFB4:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_800E0C0
	adds r0, r4, #0
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800E0AE
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800E050 @ =gUnknown_08C871D4
	adds r1, r4, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp]
	ldr r5, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800E0AE
	ldrb r6, [r5]
	adds r5, #1
	ldrb r1, [r5]
	mov r8, r1
	adds r5, #1
	adds r2, r4, #0
	adds r2, #0x71
	ldrb r0, [r2]
	cmp r0, r8
	beq _0800E0AE
	str r2, [sp, #8]
_0800E002:
	ldr r0, _0800E054 @ =gUnknown_030055D4
	ldrb r4, [r0]
	cmp r6, #0
	beq _0800E07A
	movs r2, #0xff
	mov sl, r2
	movs r0, #0x1f
	mov sb, r0
_0800E012:
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r0, r0, r5
	ldrb r1, [r0]
	mov ip, r1
	ldrb r7, [r0, #1]
	ldrb r1, [r0, #2]
	mov r2, sl
	ands r1, r2
_0800E02A:
	lsls r0, r4, #2
	ldr r2, _0800E058 @ =gUnknown_030055E0
	adds r0, r0, r2
	ldrb r3, [r0]
	ands r3, r7
	ldrb r2, [r0, #1]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r1, sl
	ands r2, r1
	cmp r0, r2
	blt _0800E06C
	cmp ip, r3
	bne _0800E05C
	subs r4, #1
	mov r2, sb
	ands r4, r2
	b _0800E072
	.align 2, 0
_0800E050: .4byte gUnknown_08C871D4
_0800E054: .4byte gUnknown_030055D4
_0800E058: .4byte gUnknown_030055E0
_0800E05C:
	subs r4, #1
	mov r1, sb
	ands r4, r1
	subs r0, #1
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0800E02A
_0800E06C:
	movs r2, #0
	cmp r2, #0
	beq _0800E076
_0800E072:
	cmp r6, #0
	bne _0800E012
_0800E076:
	cmp r6, #0
	bne _0800E082
_0800E07A:
	mov r1, r8
	ldr r0, [sp, #8]
	strb r1, [r0]
	b _0800E0AE
_0800E082:
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r0, #2
	ldr r2, [sp]
	adds r0, r0, r2
	ldr r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800E0AE
	ldrb r6, [r5]
	adds r5, #1
	ldrb r0, [r5]
	mov r8, r0
	adds r5, #1
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	cmp r0, r8
	bne _0800E002
_0800E0AE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E0C0
sub_800E0C0: @ 0x0800E0C0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r4, #3
	adds r3, r1, #0
	ands r3, r4
	movs r2, #0x80
	lsls r2, r2, #1
	ands r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x16
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	orrs r3, r2
	movs r1, #0xf0
	adds r5, r0, #0
	ands r5, r1
	orrs r5, r3
	ldr r2, _0800E138 @ =gUnknown_030055D8
	ldrb r1, [r2]
	adds r1, #1
	ands r1, r4
	strb r1, [r2]
	ldr r3, _0800E13C @ =gUnknown_030055D0
	ldrb r1, [r2]
	adds r1, r1, r3
	strb r5, [r1]
	ldrb r2, [r2]
	subs r1, r2, #1
	ands r1, r4
	adds r1, r1, r3
	ldrb r1, [r1]
	orrs r5, r1
	subs r2, #2
	ands r2, r4
	adds r2, r2, r3
	ldrb r1, [r2]
	orrs r5, r1
	ands r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0800E140 @ =gUnknown_030055E0
	ldr r2, _0800E144 @ =gUnknown_030055D4
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, r5
	bne _0800E148
	ldrb r1, [r3, #1]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800E148
	adds r0, r1, #1
	strb r0, [r3, #1]
	b _0800E164
	.align 2, 0
_0800E138: .4byte gUnknown_030055D8
_0800E13C: .4byte gUnknown_030055D0
_0800E140: .4byte gUnknown_030055E0
_0800E144: .4byte gUnknown_030055D4
_0800E148:
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	strb r5, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r1, [r0, #1]
_0800E164:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E16C
sub_800E16C: @ 0x0800E16C
	sub sp, #4
	ldr r1, _0800E18C @ =gUnknown_030055D4
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	ldr r1, _0800E190 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800E194 @ =gUnknown_030055E0
	str r0, [r1, #4]
	ldr r0, _0800E198 @ =0x8500001F
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0800E18C: .4byte gUnknown_030055D4
_0800E190: .4byte 0x040000D4
_0800E194: .4byte gUnknown_030055E0
_0800E198: .4byte 0x8500001F
