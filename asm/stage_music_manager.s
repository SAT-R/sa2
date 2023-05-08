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

	thumb_func_start CreateStageMusicManager
CreateStageMusicManager: @ 0x0800BEF8
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
