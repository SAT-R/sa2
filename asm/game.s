.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D57DC
gUnknown_080D57DC:
    .incbin "baserom.gba", 0x000D57DC, 0x88

    .global gUnknown_080D5864
gUnknown_080D5864:
    .incbin "baserom.gba", 0x000D5864, 0x100

    .global gUnknown_080D5964
gUnknown_080D5964:
    .incbin "baserom.gba", 0x000D5964, 0x24

    .global gUnknown_080D5988
gUnknown_080D5988:
    .incbin "baserom.gba", 0x000D5988, 0x88

    .global gUnknown_080D5A10
gUnknown_080D5A10:
    .incbin "baserom.gba", 0x000D5A10, 0x88

    .global gUnknown_080D5A98
gUnknown_080D5A98:
    .incbin "baserom.gba", 0x000D5A98, 0x88

    .global gUnknown_080D5B20
gUnknown_080D5B20:
    .byte 14

    .global gUnknown_080D5B21
gUnknown_080D5B21:
    .byte 0

    .global gUnknown_080D5B22
gUnknown_080D5B22:
    .incbin "baserom.gba", 0x000D5B22, 0x2E

    .global gUnknown_080D5B50
gUnknown_080D5B50:
    .incbin "baserom.gba", 0x000D5B50, 0xA0

    .global gUnknown_080D5BF0
gUnknown_080D5BF0:
    .incbin "baserom.gba", 0x000D5BF0, 0x12

    .global gUnknown_080D5C02
gUnknown_080D5C02:
    .incbin "baserom.gba", 0x000D5C02, 0x2

    .global gUnknown_080D5C04
gUnknown_080D5C04:
    .incbin "baserom.gba", 0x000D5C04, 0x5E

    .global gUnknown_080D5C62
gUnknown_080D5C62:
    .incbin "baserom.gba", 0x000D5C62, 0x20

    .global gUnknown_080D5C82
gUnknown_080D5C82:
    .incbin "baserom.gba", 0x000D5C82, 0x20

    .global gUnknown_080D5CA2
gUnknown_080D5CA2:
    .incbin "baserom.gba", 0x000D5CA2, 0x20

    .global gUnknown_080D5CC2
gUnknown_080D5CC2:
    .incbin "baserom.gba", 0x000D5CC2, 0x22

@; Not sure whether the size is correct, here.
@; It should be (2 MapHeader pointers + 1 Background-Map pointer) * number_of_maps (which is 31)
    .global gMapHeaders
gMapHeaders:
    .incbin "baserom.gba", 0x000D5CE4, 0x5F4

    .global gUnknown_080D62D8
gUnknown_080D62D8:
    .incbin "baserom.gba", 0x000D62D8, 0x7C

    .global gUnknown_080D6354
gUnknown_080D6354:
    .incbin "baserom.gba", 0x000D6354, 0x20

@; Spawn positions are (count from the top-left of the map):
@;   .2byte xPixels
@;   .2byte yPixels
    .global gSpawnPositions
gSpawnPositions:
    .incbin "baserom.gba", 0x000D6374, 0x88

    @ Referenced by Interactable "Checkpoint"
    .global gUnknown_080D63FC
gUnknown_080D63FC:
    .incbin "baserom.gba", 0x000D63FC, 0x110

    .global gUnknown_080D650C
gUnknown_080D650C:
    .incbin "baserom.gba", 0x000D650C, 0x110

    .global gUnknown_080D661C
gUnknown_080D661C:
    .incbin "baserom.gba", 0x000D661C, 0x110

    .global gUnknown_080D672C
gUnknown_080D672C:
    .2byte 0, 0x5B, 0xB6, 0x111, 0x16C

    .global gUnknown_080D6736
gUnknown_080D6736:
    .incbin "baserom.gba", 0x000D6736, 0x1CC

    .global gUnknown_080D6902
gUnknown_080D6902:
    .incbin "baserom.gba", 0x000D6902, 0x14

    .global gUnknown_080D6916
gUnknown_080D6916:
    .incbin "baserom.gba", 0x000D6916, 0xA

    .global gUnknown_080D6920
gUnknown_080D6920:
    .incbin "baserom.gba", 0x000D6920, 0x12

    .global gUnknown_080D6932
gUnknown_080D6932:
    .incbin "baserom.gba", 0x000D6932, 0x8

    .global gUnknown_080D693A
gUnknown_080D693A:
    .incbin "baserom.gba", 0x000D693A, 0x50

    .global gUnknown_080D698A
gUnknown_080D698A:
    .incbin "baserom.gba", 0x000D698A, 0x8

    .global gUnknown_080D6992
gUnknown_080D6992:
    .incbin "baserom.gba", 0x000D6992, 0x14

    .global gUnknown_080D69A6
gUnknown_080D69A6:
    .incbin "baserom.gba", 0x000D69A6, 0xC

    .global gUnknown_080D69B2
gUnknown_080D69B2:
    .incbin "baserom.gba", 0x000D69B2, 0x8

    .global gUnknown_080D69BA
gUnknown_080D69BA:
    .incbin "baserom.gba", 0x000D69BA, 0x8

    .global gUnknown_080D69C2
gUnknown_080D69C2:
    .incbin "baserom.gba", 0x000D69C2, 0x6

    .global gUnknown_080D69C8
gUnknown_080D69C8:
    .incbin "baserom.gba", 0x000D69C8, 0xB8

    .global gUnknown_080D6A80
gUnknown_080D6A80:
    .incbin "baserom.gba", 0x000D6A80, 0x30

    .global gUnknown_080D6AB0
gUnknown_080D6AB0:
    .incbin "baserom.gba", 0x000D6AB0, 0x1E

    .global gUnknown_080D6ACE
gUnknown_080D6ACE:
    .incbin "baserom.gba", 0x000D6ACE, 0x22

    .global gUnknown_080D6AF0
gUnknown_080D6AF0:
    .incbin "baserom.gba", 0x000D6AF0, 0x18

.text
.syntax unified
.arm

	thumb_func_start sub_801AF14
sub_801AF14: @ 0x0801AF14
	push {lr}
	movs r0, #0x83
	lsls r0, r0, #4
	ldr r1, _0801AF68 @ =0x7F207F20
	movs r2, #0
	bl sub_80115D0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, _0801AF6C @ =0x00000381
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801AF70 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801AF74 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801AF98
	ldr r0, _0801AF78 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801AF84
	ldr r0, _0801AF7C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801AF84
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801AF84
	ldr r1, _0801AF80 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801AF9E
	.align 2, 0
_0801AF68: .4byte 0x7F207F20
_0801AF6C: .4byte 0x00000381
_0801AF70: .4byte gCurrentLevel
_0801AF74: .4byte gGameMode
_0801AF78: .4byte gSelectedCharacter
_0801AF7C: .4byte gLoadedSaveGame
_0801AF80: .4byte gUnknown_030054A8
_0801AF84:
	ldr r0, _0801AF94 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801AF9E
	.align 2, 0
_0801AF94: .4byte gLevelSongs
_0801AF98:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801AF9E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801AFA4
sub_801AFA4: @ 0x0801AFA4
	push {r4, r5, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	movs r5, #0xe1
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B008 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B00C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B030
	ldr r0, _0801B010 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B01C
	ldr r0, _0801B014 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B01C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B01C
	ldr r1, _0801B018 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B036
	.align 2, 0
_0801B008: .4byte gCurrentLevel
_0801B00C: .4byte gGameMode
_0801B010: .4byte gSelectedCharacter
_0801B014: .4byte gLoadedSaveGame
_0801B018: .4byte gUnknown_030054A8
_0801B01C:
	ldr r0, _0801B02C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B036
	.align 2, 0
_0801B02C: .4byte gLevelSongs
_0801B030:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B036:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801B03C
sub_801B03C: @ 0x0801B03C
	push {r4, r5, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	movs r5, #0xe1
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B0A0 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B0A4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B0C8
	ldr r0, _0801B0A8 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B0B4
	ldr r0, _0801B0AC @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B0B4
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B0B4
	ldr r1, _0801B0B0 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B0CE
	.align 2, 0
_0801B0A0: .4byte gCurrentLevel
_0801B0A4: .4byte gGameMode
_0801B0A8: .4byte gSelectedCharacter
_0801B0AC: .4byte gLoadedSaveGame
_0801B0B0: .4byte gUnknown_030054A8
_0801B0B4:
	ldr r0, _0801B0C4 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B0CE
	.align 2, 0
_0801B0C4: .4byte gLevelSongs
_0801B0C8:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B0CE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801B0D4
sub_801B0D4: @ 0x0801B0D4
	push {r4, r5, lr}
	movs r5, #0x80
	lsls r5, r5, #6
	ldr r4, _0801B144 @ =0x0000038A
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	movs r3, #0
	bl sub_8009628
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B148 @ =0x00000385
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B14C @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B150 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B174
	ldr r0, _0801B154 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B160
	ldr r0, _0801B158 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B160
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B160
	ldr r1, _0801B15C @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B17A
	.align 2, 0
_0801B144: .4byte 0x0000038A
_0801B148: .4byte 0x00000385
_0801B14C: .4byte gCurrentLevel
_0801B150: .4byte gGameMode
_0801B154: .4byte gSelectedCharacter
_0801B158: .4byte gLoadedSaveGame
_0801B15C: .4byte gUnknown_030054A8
_0801B160:
	ldr r0, _0801B170 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B17A
	.align 2, 0
_0801B170: .4byte gLevelSongs
_0801B174:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B17A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801B180
sub_801B180: @ 0x0801B180
	push {r4, r5, lr}
	movs r5, #0x80
	lsls r5, r5, #6
	ldr r4, _0801B1F0 @ =0x0000038A
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	movs r3, #0
	bl sub_8009628
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B1F4 @ =0x00000385
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B1F8 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B1FC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B220
	ldr r0, _0801B200 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B20C
	ldr r0, _0801B204 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B20C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B20C
	ldr r1, _0801B208 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B226
	.align 2, 0
_0801B1F0: .4byte 0x0000038A
_0801B1F4: .4byte 0x00000385
_0801B1F8: .4byte gCurrentLevel
_0801B1FC: .4byte gGameMode
_0801B200: .4byte gSelectedCharacter
_0801B204: .4byte gLoadedSaveGame
_0801B208: .4byte gUnknown_030054A8
_0801B20C:
	ldr r0, _0801B21C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B226
	.align 2, 0
_0801B21C: .4byte gLevelSongs
_0801B220:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B226:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801B22C
sub_801B22C: @ 0x0801B22C
	push {r4, r5, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	movs r5, #0xeb
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xb
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B2F0 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B2F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B318
	ldr r0, _0801B2F8 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B304
	ldr r0, _0801B2FC @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B304
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B304
	ldr r1, _0801B300 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B31E
	.align 2, 0
_0801B2F0: .4byte gCurrentLevel
_0801B2F4: .4byte gGameMode
_0801B2F8: .4byte gSelectedCharacter
_0801B2FC: .4byte gLoadedSaveGame
_0801B300: .4byte gUnknown_030054A8
_0801B304:
	ldr r0, _0801B314 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B31E
	.align 2, 0
_0801B314: .4byte gLevelSongs
_0801B318:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B31E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801B324
sub_801B324: @ 0x0801B324
	push {r4, r5, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	movs r5, #0xeb
	lsls r5, r5, #2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #7
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0
	bl sub_8009628
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xb
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B3E8 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B3EC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B410
	ldr r0, _0801B3F0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B3FC
	ldr r0, _0801B3F4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B3FC
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B3FC
	ldr r1, _0801B3F8 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B416
	.align 2, 0
_0801B3E8: .4byte gCurrentLevel
_0801B3EC: .4byte gGameMode
_0801B3F0: .4byte gSelectedCharacter
_0801B3F4: .4byte gLoadedSaveGame
_0801B3F8: .4byte gUnknown_030054A8
_0801B3FC:
	ldr r0, _0801B40C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B416
	.align 2, 0
_0801B40C: .4byte gLevelSongs
_0801B410:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B416:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_801B41C
sub_801B41C: @ 0x0801B41C
	push {r4, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	ldr r1, _0801B4A4 @ =0x000003AD
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B4A8 @ =0x000003AE
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B4AC @ =0x000003AF
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B4B0 @ =0x000003B1
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B4B4 @ =0x000003B2
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B4B8 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B4BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B4E0
	ldr r0, _0801B4C0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B4CC
	ldr r0, _0801B4C4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B4CC
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B4CC
	ldr r1, _0801B4C8 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B4E6
	.align 2, 0
_0801B4A4: .4byte 0x000003AD
_0801B4A8: .4byte 0x000003AE
_0801B4AC: .4byte 0x000003AF
_0801B4B0: .4byte 0x000003B1
_0801B4B4: .4byte 0x000003B2
_0801B4B8: .4byte gCurrentLevel
_0801B4BC: .4byte gGameMode
_0801B4C0: .4byte gSelectedCharacter
_0801B4C4: .4byte gLoadedSaveGame
_0801B4C8: .4byte gUnknown_030054A8
_0801B4CC:
	ldr r0, _0801B4DC @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B4E6
	.align 2, 0
_0801B4DC: .4byte gLevelSongs
_0801B4E0:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B4E6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_801B4EC
sub_801B4EC: @ 0x0801B4EC
	push {r4, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	ldr r1, _0801B574 @ =0x000003AD
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B578 @ =0x000003AE
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B57C @ =0x000003AF
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B580 @ =0x000003B1
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B584 @ =0x000003B2
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B588 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B58C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B5B0
	ldr r0, _0801B590 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B59C
	ldr r0, _0801B594 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B59C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B59C
	ldr r1, _0801B598 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B5B6
	.align 2, 0
_0801B574: .4byte 0x000003AD
_0801B578: .4byte 0x000003AE
_0801B57C: .4byte 0x000003AF
_0801B580: .4byte 0x000003B1
_0801B584: .4byte 0x000003B2
_0801B588: .4byte gCurrentLevel
_0801B58C: .4byte gGameMode
_0801B590: .4byte gSelectedCharacter
_0801B594: .4byte gLoadedSaveGame
_0801B598: .4byte gUnknown_030054A8
_0801B59C:
	ldr r0, _0801B5AC @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B5B6
	.align 2, 0
_0801B5AC: .4byte gLevelSongs
_0801B5B0:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B5B6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_801B5BC
sub_801B5BC: @ 0x0801B5BC
	push {r4, lr}
	movs r4, #0x80
	lsls r4, r4, #6
	ldr r1, _0801B644 @ =0x000003AD
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B648 @ =0x000003AE
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B64C @ =0x000003AF
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	movs r1, #0xec
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B650 @ =0x000003B1
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r1, _0801B654 @ =0x000003B2
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B658 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B65C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B680
	ldr r0, _0801B660 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B66C
	ldr r0, _0801B664 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B66C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B66C
	ldr r1, _0801B668 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B686
	.align 2, 0
_0801B644: .4byte 0x000003AD
_0801B648: .4byte 0x000003AE
_0801B64C: .4byte 0x000003AF
_0801B650: .4byte 0x000003B1
_0801B654: .4byte 0x000003B2
_0801B658: .4byte gCurrentLevel
_0801B65C: .4byte gGameMode
_0801B660: .4byte gSelectedCharacter
_0801B664: .4byte gLoadedSaveGame
_0801B668: .4byte gUnknown_030054A8
_0801B66C:
	ldr r0, _0801B67C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B686
	.align 2, 0
_0801B67C: .4byte gLevelSongs
_0801B680:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B686:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_801B68C
sub_801B68C: @ 0x0801B68C
	push {r4, lr}
	ldr r4, _0801B6AC @ =gGameStageTask
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	ldr r0, _0801B6B0 @ =gPlayer
	bl sub_80299FC
	bl sub_801E028
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B6AC: .4byte gGameStageTask
_0801B6B0: .4byte gPlayer

	thumb_func_start sub_801B6B4
sub_801B6B4: @ 0x0801B6B4
	push {lr}
	ldr r2, _0801B6F8 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801B6FC @ =gGameMode
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0801B71C
	ldr r1, _0801B700 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0801B704 @ =gUnknown_03002AE4
	ldr r0, _0801B708 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0801B70C @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0801B710 @ =gVramGraphicsCopyCursor
	ldr r0, _0801B714 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTimeAttackLobbyScreen
	ldr r1, _0801B718 @ =gNumLives
	movs r0, #2
	strb r0, [r1]
	b _0801B73E
	.align 2, 0
_0801B6F8: .4byte gUnknown_03005424
_0801B6FC: .4byte gGameMode
_0801B700: .4byte 0x0000FFFF
_0801B704: .4byte gUnknown_03002AE4
_0801B708: .4byte gUnknown_0300287C
_0801B70C: .4byte gUnknown_03005390
_0801B710: .4byte gVramGraphicsCopyCursor
_0801B714: .4byte gVramGraphicsCopyQueueIndex
_0801B718: .4byte gNumLives
_0801B71C:
	ldr r1, _0801B734 @ =gNumLives
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B738
	movs r0, #1
	bl CreateGameOverScreen
	b _0801B73E
	.align 2, 0
_0801B734: .4byte gNumLives
_0801B738:
	movs r0, #2
	bl CreateGameOverScreen
_0801B73E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801B744
sub_801B744: @ 0x0801B744
	push {lr}
	ldr r1, _0801B788 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0801B78C @ =gUnknown_03002AE4
	ldr r0, _0801B790 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0801B794 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0801B798 @ =gVramGraphicsCopyCursor
	ldr r0, _0801B79C @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl WriteSaveGame
	ldr r0, _0801B7A0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B784
	ldr r1, _0801B7A4 @ =gCurrentLevel
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x21
	bgt _0801B784
	bl GameStageStart
_0801B784:
	pop {r0}
	bx r0
	.align 2, 0
_0801B788: .4byte 0x0000FFFF
_0801B78C: .4byte gUnknown_03002AE4
_0801B790: .4byte gUnknown_0300287C
_0801B794: .4byte gUnknown_03005390
_0801B798: .4byte gVramGraphicsCopyCursor
_0801B79C: .4byte gVramGraphicsCopyQueueIndex
_0801B7A0: .4byte gGameMode
_0801B7A4: .4byte gCurrentLevel

	thumb_func_start sub_801B7A8
sub_801B7A8: @ 0x0801B7A8
	push {lr}
	ldr r1, _0801B7B8 @ =gGameStageTask
	movs r0, #0
	str r0, [r1]
	bl m4aMPlayAllStop
	pop {r0}
	bx r0
	.align 2, 0
_0801B7B8: .4byte gGameStageTask

	thumb_func_start sub_801B7BC
sub_801B7BC: @ 0x0801B7BC
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, _0801B804 @ =0x00000381
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801B808 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B80C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B830
	ldr r0, _0801B810 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B81C
	ldr r0, _0801B814 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B81C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B81C
	ldr r1, _0801B818 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B836
	.align 2, 0
_0801B804: .4byte 0x00000381
_0801B808: .4byte gCurrentLevel
_0801B80C: .4byte gGameMode
_0801B810: .4byte gSelectedCharacter
_0801B814: .4byte gLoadedSaveGame
_0801B818: .4byte gUnknown_030054A8
_0801B81C:
	ldr r0, _0801B82C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B836
	.align 2, 0
_0801B82C: .4byte gLevelSongs
_0801B830:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B836:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801B83C
sub_801B83C: @ 0x0801B83C
	push {lr}
	ldr r3, _0801B874 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B878 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B89C
	ldr r0, _0801B87C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B888
	ldr r0, _0801B880 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B888
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B888
	ldr r1, _0801B884 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B8A2
	.align 2, 0
_0801B874: .4byte gCurrentLevel
_0801B878: .4byte gGameMode
_0801B87C: .4byte gSelectedCharacter
_0801B880: .4byte gLoadedSaveGame
_0801B884: .4byte gUnknown_030054A8
_0801B888:
	ldr r0, _0801B898 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B8A2
	.align 2, 0
_0801B898: .4byte gLevelSongs
_0801B89C:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B8A2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801B8A8
sub_801B8A8: @ 0x0801B8A8
	push {lr}
	ldr r3, _0801B8E0 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B8E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B908
	ldr r0, _0801B8E8 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B8F4
	ldr r0, _0801B8EC @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B8F4
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B8F4
	ldr r1, _0801B8F0 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B90E
	.align 2, 0
_0801B8E0: .4byte gCurrentLevel
_0801B8E4: .4byte gGameMode
_0801B8E8: .4byte gSelectedCharacter
_0801B8EC: .4byte gLoadedSaveGame
_0801B8F0: .4byte gUnknown_030054A8
_0801B8F4:
	ldr r0, _0801B904 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B90E
	.align 2, 0
_0801B904: .4byte gLevelSongs
_0801B908:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B90E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801B914
sub_801B914: @ 0x0801B914
	push {lr}
	ldr r3, _0801B94C @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B950 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B974
	ldr r0, _0801B954 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B960
	ldr r0, _0801B958 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B960
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B960
	ldr r1, _0801B95C @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B97A
	.align 2, 0
_0801B94C: .4byte gCurrentLevel
_0801B950: .4byte gGameMode
_0801B954: .4byte gSelectedCharacter
_0801B958: .4byte gLoadedSaveGame
_0801B95C: .4byte gUnknown_030054A8
_0801B960:
	ldr r0, _0801B970 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B97A
	.align 2, 0
_0801B970: .4byte gLevelSongs
_0801B974:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B97A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801B980
sub_801B980: @ 0x0801B980
	push {lr}
	ldr r3, _0801B9B8 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801B9BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801B9E0
	ldr r0, _0801B9C0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801B9CC
	ldr r0, _0801B9C4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801B9CC
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801B9CC
	ldr r1, _0801B9C8 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801B9E6
	.align 2, 0
_0801B9B8: .4byte gCurrentLevel
_0801B9BC: .4byte gGameMode
_0801B9C0: .4byte gSelectedCharacter
_0801B9C4: .4byte gLoadedSaveGame
_0801B9C8: .4byte gUnknown_030054A8
_0801B9CC:
	ldr r0, _0801B9DC @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801B9E6
	.align 2, 0
_0801B9DC: .4byte gLevelSongs
_0801B9E0:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801B9E6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801B9EC
sub_801B9EC: @ 0x0801B9EC
	push {lr}
	ldr r3, _0801BA24 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BA28 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BA4C
	ldr r0, _0801BA2C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BA38
	ldr r0, _0801BA30 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BA38
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BA38
	ldr r1, _0801BA34 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BA52
	.align 2, 0
_0801BA24: .4byte gCurrentLevel
_0801BA28: .4byte gGameMode
_0801BA2C: .4byte gSelectedCharacter
_0801BA30: .4byte gLoadedSaveGame
_0801BA34: .4byte gUnknown_030054A8
_0801BA38:
	ldr r0, _0801BA48 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BA52
	.align 2, 0
_0801BA48: .4byte gLevelSongs
_0801BA4C:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BA52:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BA58
sub_801BA58: @ 0x0801BA58
	push {lr}
	ldr r3, _0801BA90 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BA94 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BAB8
	ldr r0, _0801BA98 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BAA4
	ldr r0, _0801BA9C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BAA4
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BAA4
	ldr r1, _0801BAA0 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BABE
	.align 2, 0
_0801BA90: .4byte gCurrentLevel
_0801BA94: .4byte gGameMode
_0801BA98: .4byte gSelectedCharacter
_0801BA9C: .4byte gLoadedSaveGame
_0801BAA0: .4byte gUnknown_030054A8
_0801BAA4:
	ldr r0, _0801BAB4 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BABE
	.align 2, 0
_0801BAB4: .4byte gLevelSongs
_0801BAB8:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BABE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BAC4
sub_801BAC4: @ 0x0801BAC4
	push {lr}
	ldr r3, _0801BAFC @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BB00 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BB24
	ldr r0, _0801BB04 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BB10
	ldr r0, _0801BB08 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BB10
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BB10
	ldr r1, _0801BB0C @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BB2A
	.align 2, 0
_0801BAFC: .4byte gCurrentLevel
_0801BB00: .4byte gGameMode
_0801BB04: .4byte gSelectedCharacter
_0801BB08: .4byte gLoadedSaveGame
_0801BB0C: .4byte gUnknown_030054A8
_0801BB10:
	ldr r0, _0801BB20 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BB2A
	.align 2, 0
_0801BB20: .4byte gLevelSongs
_0801BB24:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BB2A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BB30
sub_801BB30: @ 0x0801BB30
	push {lr}
	ldr r3, _0801BB68 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BB6C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BB90
	ldr r0, _0801BB70 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BB7C
	ldr r0, _0801BB74 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BB7C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BB7C
	ldr r1, _0801BB78 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BB96
	.align 2, 0
_0801BB68: .4byte gCurrentLevel
_0801BB6C: .4byte gGameMode
_0801BB70: .4byte gSelectedCharacter
_0801BB74: .4byte gLoadedSaveGame
_0801BB78: .4byte gUnknown_030054A8
_0801BB7C:
	ldr r0, _0801BB8C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BB96
	.align 2, 0
_0801BB8C: .4byte gLevelSongs
_0801BB90:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BB96:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BB9C
sub_801BB9C: @ 0x0801BB9C
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, _0801BBE4 @ =0x000002AE
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801BBE8 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BBEC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BC10
	ldr r0, _0801BBF0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BBFC
	ldr r0, _0801BBF4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BBFC
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BBFC
	ldr r1, _0801BBF8 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BC16
	.align 2, 0
_0801BBE4: .4byte 0x000002AE
_0801BBE8: .4byte gCurrentLevel
_0801BBEC: .4byte gGameMode
_0801BBF0: .4byte gSelectedCharacter
_0801BBF4: .4byte gLoadedSaveGame
_0801BBF8: .4byte gUnknown_030054A8
_0801BBFC:
	ldr r0, _0801BC0C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BC16
	.align 2, 0
_0801BC0C: .4byte gLevelSongs
_0801BC10:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BC16:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BC1C
sub_801BC1C: @ 0x0801BC1C
	push {lr}
	ldr r3, _0801BC54 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BC58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BC7C
	ldr r0, _0801BC5C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BC68
	ldr r0, _0801BC60 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BC68
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BC68
	ldr r1, _0801BC64 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BC82
	.align 2, 0
_0801BC54: .4byte gCurrentLevel
_0801BC58: .4byte gGameMode
_0801BC5C: .4byte gSelectedCharacter
_0801BC60: .4byte gLoadedSaveGame
_0801BC64: .4byte gUnknown_030054A8
_0801BC68:
	ldr r0, _0801BC78 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BC82
	.align 2, 0
_0801BC78: .4byte gLevelSongs
_0801BC7C:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BC82:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BC88
sub_801BC88: @ 0x0801BC88
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, _0801BCD0 @ =0x000002AE
	movs r2, #0
	movs r3, #0
	bl sub_8009628
	ldr r3, _0801BCD4 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BCD8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BCFC
	ldr r0, _0801BCDC @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BCE8
	ldr r0, _0801BCE0 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BCE8
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BCE8
	ldr r1, _0801BCE4 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BD02
	.align 2, 0
_0801BCD0: .4byte 0x000002AE
_0801BCD4: .4byte gCurrentLevel
_0801BCD8: .4byte gGameMode
_0801BCDC: .4byte gSelectedCharacter
_0801BCE0: .4byte gLoadedSaveGame
_0801BCE4: .4byte gUnknown_030054A8
_0801BCE8:
	ldr r0, _0801BCF8 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BD02
	.align 2, 0
_0801BCF8: .4byte gLevelSongs
_0801BCFC:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BD02:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BD08
sub_801BD08: @ 0x0801BD08
	push {lr}
	ldr r3, _0801BD40 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BD44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BD68
	ldr r0, _0801BD48 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BD54
	ldr r0, _0801BD4C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BD54
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BD54
	ldr r1, _0801BD50 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BD6E
	.align 2, 0
_0801BD40: .4byte gCurrentLevel
_0801BD44: .4byte gGameMode
_0801BD48: .4byte gSelectedCharacter
_0801BD4C: .4byte gLoadedSaveGame
_0801BD50: .4byte gUnknown_030054A8
_0801BD54:
	ldr r0, _0801BD64 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BD6E
	.align 2, 0
_0801BD64: .4byte gLevelSongs
_0801BD68:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BD6E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BD74
sub_801BD74: @ 0x0801BD74
	push {lr}
	ldr r3, _0801BDAC @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BDB0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BDD4
	ldr r0, _0801BDB4 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BDC0
	ldr r0, _0801BDB8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BDC0
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BDC0
	ldr r1, _0801BDBC @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BDDA
	.align 2, 0
_0801BDAC: .4byte gCurrentLevel
_0801BDB0: .4byte gGameMode
_0801BDB4: .4byte gSelectedCharacter
_0801BDB8: .4byte gLoadedSaveGame
_0801BDBC: .4byte gUnknown_030054A8
_0801BDC0:
	ldr r0, _0801BDD0 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BDDA
	.align 2, 0
_0801BDD0: .4byte gLevelSongs
_0801BDD4:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BDDA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BDE0
sub_801BDE0: @ 0x0801BDE0
	push {lr}
	ldr r3, _0801BE18 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BE1C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BE40
	ldr r0, _0801BE20 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BE2C
	ldr r0, _0801BE24 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BE2C
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BE2C
	ldr r1, _0801BE28 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BE46
	.align 2, 0
_0801BE18: .4byte gCurrentLevel
_0801BE1C: .4byte gGameMode
_0801BE20: .4byte gSelectedCharacter
_0801BE24: .4byte gLoadedSaveGame
_0801BE28: .4byte gUnknown_030054A8
_0801BE2C:
	ldr r0, _0801BE3C @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BE46
	.align 2, 0
_0801BE3C: .4byte gLevelSongs
_0801BE40:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BE46:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BE4C
sub_801BE4C: @ 0x0801BE4C
	push {lr}
	ldr r3, _0801BE84 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BE88 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BEAC
	ldr r0, _0801BE8C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BE98
	ldr r0, _0801BE90 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BE98
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BE98
	ldr r1, _0801BE94 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BEB2
	.align 2, 0
_0801BE84: .4byte gCurrentLevel
_0801BE88: .4byte gGameMode
_0801BE8C: .4byte gSelectedCharacter
_0801BE90: .4byte gLoadedSaveGame
_0801BE94: .4byte gUnknown_030054A8
_0801BE98:
	ldr r0, _0801BEA8 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BEB2
	.align 2, 0
_0801BEA8: .4byte gLevelSongs
_0801BEAC:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BEB2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BEB8
sub_801BEB8: @ 0x0801BEB8
	push {lr}
	ldr r3, _0801BEF0 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BEF4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BF18
	ldr r0, _0801BEF8 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BF04
	ldr r0, _0801BEFC @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BF04
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BF04
	ldr r1, _0801BF00 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BF1E
	.align 2, 0
_0801BEF0: .4byte gCurrentLevel
_0801BEF4: .4byte gGameMode
_0801BEF8: .4byte gSelectedCharacter
_0801BEFC: .4byte gLoadedSaveGame
_0801BF00: .4byte gUnknown_030054A8
_0801BF04:
	ldr r0, _0801BF14 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BF1E
	.align 2, 0
_0801BF14: .4byte gLevelSongs
_0801BF18:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BF1E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BF24
sub_801BF24: @ 0x0801BF24
	push {lr}
	ldr r3, _0801BF5C @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BF60 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BF84
	ldr r0, _0801BF64 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BF70
	ldr r0, _0801BF68 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BF70
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BF70
	ldr r1, _0801BF6C @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BF8A
	.align 2, 0
_0801BF5C: .4byte gCurrentLevel
_0801BF60: .4byte gGameMode
_0801BF64: .4byte gSelectedCharacter
_0801BF68: .4byte gLoadedSaveGame
_0801BF6C: .4byte gUnknown_030054A8
_0801BF70:
	ldr r0, _0801BF80 @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BF8A
	.align 2, 0
_0801BF80: .4byte gLevelSongs
_0801BF84:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BF8A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BF90
sub_801BF90: @ 0x0801BF90
	push {lr}
	ldr r3, _0801BFC8 @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r3, r2]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0801BFCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801BFF0
	ldr r0, _0801BFD0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801BFDC
	ldr r0, _0801BFD4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	cmp r0, r2
	bgt _0801BFDC
	adds r0, r2, #0
	cmp r0, #0x12
	bne _0801BFDC
	ldr r1, _0801BFD8 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801BFF6
	.align 2, 0
_0801BFC8: .4byte gCurrentLevel
_0801BFCC: .4byte gGameMode
_0801BFD0: .4byte gSelectedCharacter
_0801BFD4: .4byte gLoadedSaveGame
_0801BFD8: .4byte gUnknown_030054A8
_0801BFDC:
	ldr r0, _0801BFEC @ =gLevelSongs
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801BFF6
	.align 2, 0
_0801BFEC: .4byte gLevelSongs
_0801BFF0:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801BFF6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801BFFC
sub_801BFFC: @ 0x0801BFFC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0801C034 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801C05C
	ldr r0, _0801C038 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801C048
	ldr r0, _0801C03C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	ldr r2, _0801C040 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0801C048
	cmp r0, #0x12
	bne _0801C048
	ldr r1, _0801C044 @ =gUnknown_030054A8
	movs r0, #0x1e
	strb r0, [r1, #1]
	b _0801C062
	.align 2, 0
_0801C034: .4byte gGameMode
_0801C038: .4byte gSelectedCharacter
_0801C03C: .4byte gLoadedSaveGame
_0801C040: .4byte gCurrentLevel
_0801C044: .4byte gUnknown_030054A8
_0801C048:
	ldr r0, _0801C058 @ =gLevelSongs
	lsls r1, r3, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0801C062
	.align 2, 0
_0801C058: .4byte gLevelSongs
_0801C05C:
	movs r0, #0x3a
	bl m4aSongNumStart
_0801C062:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801C068
sub_801C068: @ 0x0801C068
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r6, _0801C1CC @ =gCamera
	lsls r0, r0, #2
	str r0, [sp, #4]
	ldr r0, _0801C1D0 @ =gUnknown_080D5A98
	ldr r1, [sp, #4]
	adds r1, r1, r0
	mov r8, r1
	ldr r4, _0801C1D4 @ =gDispCnt
	movs r2, #0xf9
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r4]
	mov r3, sl
	cmp r3, #0x1d
	bne _0801C09A
	ldr r1, _0801C1D8 @ =0x00003741
	adds r0, r1, #0
	strh r0, [r4]
_0801C09A:
	ldr r3, _0801C1DC @ =gBgCntRegs
	movs r2, #0
	mov sb, r2
	ldr r0, _0801C1E0 @ =0x00001E01
	strh r0, [r3, #2]
	ldr r0, _0801C1E4 @ =0x00001F02
	strh r0, [r3, #4]
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #0x1f
	asrs r1, r1, #6
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x1f
	asrs r0, r0, #6
	lsls r0, r0, #1
	orrs r1, r0
	lsls r1, r1, #0xe
	mov r2, r8
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	movs r2, #3
	orrs r0, r2
	orrs r1, r0
	mov r2, r8
	movs r0, #2
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	orrs r1, r0
	strh r1, [r3, #6]
	mov r3, sl
	cmp r3, #0x1d
	bne _0801C0E8
	ldr r1, _0801C1E8 @ =0x00003641
	adds r0, r1, #0
	strh r0, [r4]
_0801C0E8:
	ldr r7, _0801C1EC @ =gUnknown_03005850
	ldr r5, _0801C1F0 @ =gUnknown_080D5864
	ldr r0, _0801C1F4 @ =gUnknown_03005890
	adds r1, r5, #0
	movs r2, #0x40
	bl memcpy
	mov r2, sl
	lsls r4, r2, #1
	add r4, sl
	adds r0, r7, #0
	adds r0, #0x5c
	strh r4, [r0]
	adds r1, r5, #0
	adds r1, #0x40
	ldr r0, _0801C1F8 @ =gUnknown_030058D0
	movs r2, #0x40
	bl memcpy
	adds r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x9c
	strh r1, [r0]
	adds r5, #0x80
	ldr r0, _0801C1FC @ =gUnknown_03005910
	adds r1, r5, #0
	movs r2, #0x40
	bl memcpy
	adds r4, #2
	adds r0, r7, #0
	adds r0, #0xdc
	strh r4, [r0]
	adds r2, r7, #0
	adds r2, #0xc4
	mov r3, r8
	movs r0, #2
	ldrsb r0, [r3, r0]
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2]
	adds r2, #8
	movs r0, #3
	ldrsb r0, [r3, r0]
	lsls r0, r0, #0xb
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r7, #0
	adds r1, #0xe6
	strh r0, [r1]
	movs r1, #1
	ldrsb r1, [r3, r1]
	adds r0, r7, #0
	adds r0, #0xe8
	strh r1, [r0]
	ldr r3, _0801C200 @ =gUnknown_03004D80
	mov r0, sb
	strb r0, [r3, #1]
	ldr r0, _0801C204 @ =gUnknown_03002280
	mov r1, sb
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	movs r1, #0xff
	strb r1, [r0, #6]
	movs r2, #0x20
	strb r2, [r0, #7]
	mov r1, sb
	strb r1, [r3, #2]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	ldr r4, _0801C208 @ =gGameMode
	ldrb r0, [r4]
	cmp r0, #5
	bne _0801C1A4
	adds r1, r7, #0
	adds r1, #0x6e
	ldrh r0, [r1]
	movs r3, #0x82
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x40
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
_0801C1A4:
	mov r0, sl
	cmp r0, #0x1d
	beq _0801C1BC
	ldr r0, _0801C1F4 @ =gUnknown_03005890
	bl sub_8002A3C
	ldr r0, _0801C1F8 @ =gUnknown_030058D0
	bl sub_8002A3C
	ldr r0, _0801C1FC @ =gUnknown_03005910
	bl sub_8002A3C
_0801C1BC:
	ldrb r0, [r4]
	cmp r0, #5
	beq _0801C214
	ldr r0, _0801C20C @ =gUnknown_030059C8
	ldr r1, _0801C210 @ =gUnknown_080D62D8
	ldr r2, [sp, #4]
	adds r1, r2, r1
	b _0801C218
	.align 2, 0
_0801C1CC: .4byte gCamera
_0801C1D0: .4byte gUnknown_080D5A98
_0801C1D4: .4byte gDispCnt
_0801C1D8: .4byte 0x00003741
_0801C1DC: .4byte gBgCntRegs
_0801C1E0: .4byte 0x00001E01
_0801C1E4: .4byte 0x00001F02
_0801C1E8: .4byte 0x00003641
_0801C1EC: .4byte gUnknown_03005850
_0801C1F0: .4byte gUnknown_080D5864
_0801C1F4: .4byte gUnknown_03005890
_0801C1F8: .4byte gUnknown_030058D0
_0801C1FC: .4byte gUnknown_03005910
_0801C200: .4byte gUnknown_03004D80
_0801C204: .4byte gUnknown_03002280
_0801C208: .4byte gGameMode
_0801C20C: .4byte gUnknown_030059C8
_0801C210: .4byte gUnknown_080D62D8
_0801C214:
	ldr r0, _0801C288 @ =gUnknown_030059C8
	ldr r1, _0801C28C @ =EWRAM_START + 0x33004
_0801C218:
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	str r3, [r6, #0x28]
	ldr r1, [r0]
	ldr r0, [r1, #0x20]
	str r0, [r6, #0x2c]
	str r3, [r6, #0x30]
	ldr r0, [r1, #0x1c]
	str r0, [r6, #0x34]
	ldr r1, _0801C290 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #2
	beq _0801C24E
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0801C24A
	ldr r0, _0801C294 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801C24E
_0801C24A:
	cmp r1, #0x1d
	bne _0801C2D0
_0801C24E:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1d
	bne _0801C2AC
	ldr r0, _0801C298 @ =gPlayer
	adds r0, #8
	ldr r1, _0801C298 @ =gPlayer
	adds r1, #0xc
	bl sub_802C668
	ldr r1, _0801C29C @ =gUnknown_03005440
	ldr r2, _0801C2A0 @ =gUnknown_080D5964
	ldrh r0, [r2, #0x20]
	strh r0, [r1]
	ldr r1, _0801C2A4 @ =gUnknown_030054BC
	ldrh r0, [r2, #0x22]
	strh r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #2
	str r0, [r6]
	movs r0, #0x78
	str r0, [r6, #0x10]
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #4]
	adds r1, r6, #0
	adds r1, #0x64
	ldr r0, _0801C2A8 @ =0x0000FFFC
	b _0801C304
	.align 2, 0
_0801C288: .4byte gUnknown_030059C8
_0801C28C: .4byte EWRAM_START + 0x33004
_0801C290: .4byte gCurrentLevel
_0801C294: .4byte gUnknown_030054B0
_0801C298: .4byte gPlayer
_0801C29C: .4byte gUnknown_03005440
_0801C2A0: .4byte gUnknown_080D5964
_0801C2A4: .4byte gUnknown_030054BC
_0801C2A8: .4byte 0x0000FFFC
_0801C2AC:
	ldr r3, _0801C2C8 @ =gPlayer
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	str r0, [r6]
	ldr r1, _0801C2CC @ =0xFFFFFE20
	adds r0, r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, #0x54
	str r0, [r6, #4]
	str r0, [r6, #0x14]
	b _0801C2FA
	.align 2, 0
_0801C2C8: .4byte gPlayer
_0801C2CC: .4byte 0xFFFFFE20
_0801C2D0:
	ldr r2, _0801C380 @ =gPlayer
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	subs r1, #0x78
	str r1, [r6]
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	subs r0, #0x54
	str r0, [r6, #4]
	cmp r1, #0
	bge _0801C2E8
	str r3, [r6]
_0801C2E8:
	ldr r0, [r6, #4]
	cmp r0, #0
	bge _0801C2F0
	str r3, [r6, #4]
_0801C2F0:
	ldr r0, [r6]
	str r0, [r6, #0x10]
	ldr r0, [r6, #4]
	str r0, [r6, #0x14]
	ldr r3, _0801C380 @ =gPlayer
_0801C2FA:
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	subs r0, #4
	adds r1, r6, #0
	adds r1, #0x64
_0801C304:
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #8]
	movs r0, #0xc
	str r0, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strh r0, [r1]
	str r0, [r6, #0x18]
	str r0, [r6, #0x1c]
	str r0, [r6, #0x20]
	str r0, [r6, #0x24]
	subs r1, #0x16
	strh r0, [r1]
	movs r1, #8
	str r1, [r6, #0x44]
	str r0, [r6, #0x48]
	str r0, [r6, #0x4c]
	adds r1, r6, #0
	adds r1, #0x50
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #0xc
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	ldr r0, _0801C384 @ =sub_801E0A8
	movs r2, #0xf0
	lsls r2, r2, #4
	ldr r1, _0801C388 @ =sub_801E040
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r0, [r6, #0x5c]
	ldr r0, _0801C38C @ =gUnknown_080D5A10
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r6, #0x58]
	ldr r0, _0801C390 @ =gUnknown_080D5988
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0801C370
	bl _call_via_r0
_0801C370:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C380: .4byte gPlayer
_0801C384: .4byte sub_801E0A8
_0801C388: .4byte sub_801E040
_0801C38C: .4byte gUnknown_080D5A10
_0801C390: .4byte gUnknown_080D5988

	thumb_func_start sub_801C394
sub_801C394: @ 0x0801C394
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0801C414 @ =gPlayer
	mov r8, r0
	ldr r5, _0801C418 @ =gCamera
	ldr r6, [r5]
	ldr r7, [r5, #4]
	str r6, [r5, #0x38]
	str r7, [r5, #0x3c]
	ldr r0, [r5, #0x30]
	adds r3, r5, #0
	cmp r6, r0
	blt _0801C3BE
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf1
	adds r0, r6, #0
	cmp r0, r1
	ble _0801C3BE
	adds r0, r1, #0
_0801C3BE:
	adds r6, r0, #0
	ldr r0, [r5, #0x28]
	cmp r7, r0
	blt _0801C3D0
	ldr r0, [r5, #0x2c]
	subs r0, #0xa1
	adds r1, r7, #0
	cmp r1, r0
	ble _0801C3D2
_0801C3D0:
	adds r1, r0, #0
_0801C3D2:
	adds r7, r1, #0
	ldr r0, _0801C41C @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0801C3F6
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0801C3F0
	ldr r0, _0801C420 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801C3F6
_0801C3F0:
	cmp r1, #0x1d
	beq _0801C3F6
	b _0801C508
_0801C3F6:
	mov r1, r8
	ldr r4, [r1, #0x20]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	beq _0801C424
	ldr r2, [r5, #0x58]
	cmp r2, #0
	bne _0801C40A
	b _0801C6FE
_0801C40A:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	bl _call_via_r2
	b _0801C6FE
	.align 2, 0
_0801C414: .4byte gPlayer
_0801C418: .4byte gCamera
_0801C41C: .4byte gCurrentLevel
_0801C420: .4byte gUnknown_030054B0
_0801C424:
	ldr r0, _0801C468 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0801C43C
	mov r0, r8
	adds r0, #8
	mov r1, r8
	adds r1, #0xc
	bl sub_802C668
_0801C43C:
	ldr r2, [r5, #0x10]
	mov ip, r2
	mov r3, ip
	adds r3, #5
	str r3, [r5, #0x10]
	adds r6, #5
	adds r1, r6, #0
	adds r1, #0x79
	mov r2, r8
	ldr r0, [r2, #8]
	asrs r2, r0, #8
	cmp r1, r2
	bge _0801C472
	mov r0, ip
	adds r0, #0x55
	cmp r0, r6
	ble _0801C46C
	adds r0, r2, #0
	subs r0, #0x78
	subs r0, r0, r6
	str r0, [r5, #0x18]
	b _0801C486
	.align 2, 0
_0801C468: .4byte gCurrentLevel
_0801C46C:
	adds r6, r0, #0
	str r4, [r5, #0x18]
	b _0801C486
_0801C472:
	str r4, [r5, #0x18]
	adds r0, r6, #0
	adds r0, #0x60
	cmp r0, r2
	ble _0801C486
	adds r6, r2, #0
	subs r6, #0x60
	cmp r6, r3
	bge _0801C486
	adds r6, r3, #0
_0801C486:
	mov r3, r8
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r1, r0, r7
	ldr r0, _0801C4B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0801C4B8
	cmp r1, #0x30
	ble _0801C4BC
	ldr r0, _0801C4B4 @ =gUnknown_030054BC
	ldrh r0, [r0]
	subs r0, #0xd0
	cmp r1, r0
	blt _0801C4CA
	adds r0, r7, #0
	subs r0, #0x70
	b _0801C4C0
	.align 2, 0
_0801C4B0: .4byte gCurrentLevel
_0801C4B4: .4byte gUnknown_030054BC
_0801C4B8:
	cmp r1, #0x30
	bgt _0801C4C8
_0801C4BC:
	adds r0, r7, #0
	subs r0, #0x30
_0801C4C0:
	adds r7, r1, r0
	movs r0, #0
	str r0, [r5, #0x1c]
	b _0801C4CA
_0801C4C8:
	adds r7, #2
_0801C4CA:
	ldr r0, _0801C500 @ =gUnknown_03005440
	ldrh r0, [r0]
	cmp r7, r0
	blt _0801C4DE
	ldr r0, _0801C504 @ =gUnknown_030054BC
	ldrh r0, [r0]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0801C4E0
_0801C4DE:
	adds r1, r0, #0
_0801C4E0:
	ldr r0, [r5, #0x18]
	adds r6, r6, r0
	ldr r0, [r5, #0x1c]
	adds r7, r1, r0
	adds r0, r5, #0
	adds r0, #0x60
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r6, r0
	adds r0, r5, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r7, r0
	b _0801C6D8
	.align 2, 0
_0801C500: .4byte gUnknown_03005440
_0801C504: .4byte gUnknown_030054BC
_0801C508:
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0801C51C
	subs r0, r2, #1
	strh r0, [r1]
	b _0801C5B6
_0801C51C:
	adds r4, r5, #0
	adds r4, #0x50
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801C55A
	mov r0, r8
	ldrh r1, [r0, #0x10]
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	ldr r2, [r5, #0x18]
	adds r0, r0, r2
	subs r0, #0x78
	str r0, [r5, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r3, r5, #0
	adds r3, #0x56
	movs r0, #0
	ldrsh r2, [r3, r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	adds r1, r1, r0
	asrs r1, r1, #4
	strh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0x10]
_0801C55A:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0801C5B6
	adds r2, r5, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r4, [r2, r1]
	mov r3, r8
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	subs r3, r0, #4
	ldr r0, _0801C594 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801C582
	rsbs r3, r3, #0
_0801C582:
	cmp r4, r3
	beq _0801C5A2
	cmp r4, r3
	bge _0801C598
	adds r4, #5
	cmp r4, r3
	ble _0801C5A0
	b _0801C59E
	.align 2, 0
_0801C594: .4byte gUnknown_03005424
_0801C598:
	subs r4, #5
	cmp r4, r3
	bge _0801C5A0
_0801C59E:
	adds r4, r3, #0
_0801C5A0:
	strh r4, [r2]
_0801C5A2:
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #0x1c]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	subs r1, #0x50
	adds r0, r0, r1
	adds r0, r0, r4
	str r0, [r5, #0x14]
_0801C5B6:
	ldr r0, [r5, #0x10]
	subs r1, r0, r6
	ldr r0, [r5, #0x44]
	cmp r1, r0
	ble _0801C5D2
	subs r2, r1, r0
	ldr r0, [r5, #8]
	asrs r1, r0, #8
	adds r3, r0, #0
	cmp r1, r2
	ble _0801C5CE
	adds r1, r2, #0
_0801C5CE:
	adds r6, r6, r1
	b _0801C5E6
_0801C5D2:
	ldr r3, [r5, #8]
	cmn r1, r0
	bge _0801C5E6
	adds r1, r1, r0
	asrs r0, r3, #8
	rsbs r0, r0, #0
	cmp r0, r1
	bge _0801C5E4
	adds r0, r1, #0
_0801C5E4:
	adds r6, r6, r0
_0801C5E6:
	ldr r4, [r5, #0x30]
	cmp r6, r4
	bge _0801C5F0
	adds r0, r4, #0
	b _0801C5FE
_0801C5F0:
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf0
	adds r0, r6, #0
	cmp r0, r1
	ble _0801C5FE
	adds r0, r1, #0
_0801C5FE:
	adds r6, r0, #0
	ldr r0, _0801C644 @ =0x00000FFF
	cmp r3, r0
	bgt _0801C60C
	adds r0, r3, #0
	adds r0, #0x20
	str r0, [r5, #8]
_0801C60C:
	mov r2, r8
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C648
	mov r0, r8
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0801C634
	mov r0, r8
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _0801C648
_0801C634:
	ldr r0, [r5, #0x48]
	adds r0, #4
	str r0, [r5, #0x48]
	cmp r0, #0x18
	ble _0801C654
	movs r0, #0x18
	b _0801C654
	.align 2, 0
_0801C644: .4byte 0x00000FFF
_0801C648:
	ldr r0, [r5, #0x48]
	subs r0, #4
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _0801C654
	movs r0, #0
_0801C654:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x14]
	subs r1, r0, r7
	ldr r0, [r5, #0x48]
	cmp r1, r0
	ble _0801C66E
	subs r0, r1, r0
	ldr r1, [r5, #0xc]
	cmp r1, r0
	ble _0801C66A
	adds r1, r0, #0
_0801C66A:
	adds r7, r7, r1
	b _0801C680
_0801C66E:
	cmn r1, r0
	bge _0801C680
	adds r1, r1, r0
	ldr r0, [r5, #0xc]
	rsbs r0, r0, #0
	cmp r0, r1
	bge _0801C67E
	adds r0, r1, #0
_0801C67E:
	adds r7, r7, r0
_0801C680:
	ldr r2, [r5, #0x28]
	cmp r7, r2
	bge _0801C68A
	adds r1, r2, #0
	b _0801C696
_0801C68A:
	ldr r0, [r5, #0x2c]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0801C696
	adds r1, r0, #0
_0801C696:
	adds r7, r1, #0
	cmp r6, r4
	bge _0801C6A0
	adds r0, r4, #0
	b _0801C6AE
_0801C6A0:
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf0
	adds r0, r6, #0
	cmp r0, r1
	ble _0801C6AE
	adds r0, r1, #0
_0801C6AE:
	adds r6, r0, #0
	cmp r7, r2
	bge _0801C6B8
	adds r1, r2, #0
	b _0801C6C4
_0801C6B8:
	ldr r0, [r5, #0x2c]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0801C6C4
	adds r1, r0, #0
_0801C6C4:
	adds r0, r5, #0
	adds r0, #0x60
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r6, r6, r0
	adds r0, r5, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r1, r0
_0801C6D8:
	str r6, [r5]
	str r7, [r5, #4]
	ldr r0, [r5, #0x38]
	subs r0, r0, r6
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x3c]
	subs r0, r0, r7
	str r0, [r5, #0x3c]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_801C708
	ldr r2, [r5, #0x58]
	cmp r2, #0
	beq _0801C6FE
	adds r0, r6, #0
	adds r1, r7, #0
	bl _call_via_r2
_0801C6FE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_801C708
sub_801C708: @ 0x0801C708
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov sb, r1
	ldr r0, _0801C768 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0801C75C
	ldr r4, _0801C76C @ =gUnknown_03005890
	ldr r0, _0801C770 @ =gBgScrollRegs
	mov r8, r0
	movs r0, #7
	adds r6, r7, #0
	ands r6, r0
	mov r1, r8
	strh r6, [r1, #4]
	mov r5, sb
	ands r5, r0
	strh r5, [r1, #6]
	strh r7, [r4, #0x30]
	mov r0, sb
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_8002A3C
	adds r0, r4, #0
	bl UpdateBgAnimationTiles
	adds r4, #0x40
	mov r1, r8
	strh r6, [r1, #8]
	strh r5, [r1, #0xa]
	strh r7, [r4, #0x30]
	mov r0, sb
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_8002A3C
_0801C75C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C768: .4byte gCurrentLevel
_0801C76C: .4byte gUnknown_03005890
_0801C770: .4byte gBgScrollRegs

	thumb_func_start sub_801C774
sub_801C774: @ 0x0801C774
	push {r4, lr}
	ldr r4, _0801C7B4 @ =gUnknown_03005850
	ldr r2, _0801C7B8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801C7BC @ =gBgCntRegs
	ldr r0, _0801C7C0 @ =0x00001B0F
	strh r0, [r1]
	ldr r0, _0801C7C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801C7D4
	ldr r1, _0801C7C8 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0x71
	strh r0, [r4, #0x1c]
	ldr r0, _0801C7CC @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801C7D0 @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	b _0801C7F2
	.align 2, 0
_0801C7B4: .4byte gUnknown_03005850
_0801C7B8: .4byte gDispCnt
_0801C7BC: .4byte gBgCntRegs
_0801C7C0: .4byte 0x00001B0F
_0801C7C4: .4byte gGameMode
_0801C7C8: .4byte gUnknown_080D5864
_0801C7CC: .4byte 0x0600C000
_0801C7D0: .4byte 0x0600D800
_0801C7D4:
	ldr r1, _0801C808 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #2
	strh r0, [r4, #0x1c]
	ldr r0, _0801C80C @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801C810 @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	movs r0, #0x1e
_0801C7F2:
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r1, _0801C814 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C808: .4byte gUnknown_080D5864
_0801C80C: .4byte 0x0600C000
_0801C810: .4byte 0x0600D800
_0801C814: .4byte gBgScrollRegs

	thumb_func_start sub_801C818
sub_801C818: @ 0x0801C818
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801C868 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801C824
	b _0801C944
_0801C824:
	ldr r1, _0801C86C @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	beq _0801C880
	ldr r0, _0801C870 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801C880
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r2, r0
	movs r4, #0xf
	cmp r2, #0
	beq _0801C84A
	movs r4, #7
_0801C84A:
	ldr r1, _0801C874 @ =gBgScrollRegs
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, _0801C878 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r4
	adds r5, r1, #0
	cmp r0, r4
	bne _0801C85E
	adds r3, #1
_0801C85E:
	movs r0, #0xff
	ands r3, r0
	strh r3, [r5]
	ldr r4, _0801C87C @ =gCamera
	b _0801C892
	.align 2, 0
_0801C868: .4byte gGameMode
_0801C86C: .4byte gPlayer
_0801C870: .4byte gUnknown_030054F4
_0801C874: .4byte gBgScrollRegs
_0801C878: .4byte gUnknown_03005590
_0801C87C: .4byte gCamera
_0801C880:
	ldr r2, _0801C8F0 @ =gBgScrollRegs
	ldr r3, _0801C8F4 @ =gCamera
	ldr r0, [r3]
	asrs r0, r0, #6
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2]
	adds r5, r2, #0
	adds r4, r3, #0
_0801C892:
	ldr r0, [r4, #4]
	asrs r0, r0, #9
	strh r0, [r5, #2]
	ldr r1, _0801C8F8 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0801C8FC @ =gUnknown_03002878
	ldr r0, _0801C900 @ =0x0400001C
	str r0, [r1]
	ldr r0, _0801C904 @ =gUnknown_03002A80
	strb r2, [r0]
	ldr r0, _0801C908 @ =gUnknown_03001884
	ldr r2, [r0]
	movs r6, #0
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801C914
	ldr r0, _0801C90C @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801C914
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	movs r3, #0x1f
	cmp r1, #0
	beq _0801C8D4
	movs r3, #0xf
_0801C8D4:
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	ldr r0, _0801C910 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r3
	cmp r0, r3
	bne _0801C8E4
	adds r1, #1
_0801C8E4:
	movs r0, #0xff
	ands r1, r0
	strh r1, [r5, #0xc]
	ldrh r3, [r5, #0xc]
	b _0801C91C
	.align 2, 0
_0801C8F0: .4byte gBgScrollRegs
_0801C8F4: .4byte gCamera
_0801C8F8: .4byte gFlags
_0801C8FC: .4byte gUnknown_03002878
_0801C900: .4byte 0x0400001C
_0801C904: .4byte gUnknown_03002A80
_0801C908: .4byte gUnknown_03001884
_0801C90C: .4byte gUnknown_030054F4
_0801C910: .4byte gUnknown_03005590
_0801C914:
	ldr r0, [r4]
	lsls r0, r0, #9
	lsrs r3, r0, #0x10
	strh r3, [r5, #0xc]
_0801C91C:
	ldr r0, [r4, #4]
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	movs r4, #0
	movs r1, #0x47
_0801C926:
	strh r6, [r2]
	adds r2, #2
	strh r4, [r2]
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0801C926
	movs r1, #0x56
_0801C936:
	strh r3, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0801C936
_0801C944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801C94C
sub_801C94C: @ 0x0801C94C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r2, r1, #0
	movs r0, #0
	mov sb, r0
	ldr r3, _0801C9C0 @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801C992
	ldr r0, _0801C9C4 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801C992
	ldr r1, _0801C9C8 @ =gBgScrollRegs
	movs r4, #0xc
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _0801C982
	strh r6, [r1, #0xc]
_0801C982:
	ldrh r0, [r3, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r7, [r1, #0xc]
	adds r0, r0, r7
	strh r0, [r1, #0xc]
	movs r0, #0xc
	ldrsh r6, [r1, r0]
_0801C992:
	ldr r0, _0801C9CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801C9D0
	ldr r4, _0801C9C8 @ =gBgScrollRegs
	asrs r0, r6, #4
	strh r0, [r4, #0xc]
	adds r0, r2, #0
	movs r1, #0x10
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _0801C9BA
	mov r8, r1
_0801C9BA:
	mov r2, r8
	strh r2, [r4, #0xe]
	b _0801CB58
	.align 2, 0
_0801C9C0: .4byte gPlayer
_0801C9C4: .4byte gUnknown_030054F4
_0801C9C8: .4byte gBgScrollRegs
_0801C9CC: .4byte gGameMode
_0801C9D0:
	adds r0, r2, #0
	movs r1, #0x10
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r8, r3
	asrs r0, r0, #0x10
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	ble _0801C9EA
	mov r8, r4
_0801C9EA:
	adds r0, r6, #0
	movs r1, #0x69
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r4
	ble _0801C9FE
	adds r3, r4, #0
_0801C9FE:
	ldr r1, _0801CA5C @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0801CA60 @ =gUnknown_03002878
	ldr r0, _0801CA64 @ =0x0400001C
	str r0, [r1]
	ldr r0, _0801CA68 @ =gUnknown_03002A80
	strb r2, [r0]
	ldr r0, _0801CA6C @ =gUnknown_03001884
	ldr r4, [r0]
	ldr r0, _0801CA70 @ =gUnknown_03005590
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	str r0, [sp]
	movs r5, #0
	mov r7, r8
	lsls r0, r7, #0x10
	lsls r3, r3, #0x10
	str r3, [sp, #0xc]
	asrs r2, r6, #3
	str r2, [sp, #8]
	asrs r2, r0, #0x10
	movs r3, #0xff
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #1
	asrs r0, r0, #5
	ands r0, r3
	lsls r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x13
	asrs r1, r1, #0x10
	mov sl, r1
_0801CA48:
	adds r1, r2, r5
	adds r0, r1, #0
	subs r0, #0x6f
	cmp r0, #9
	bhi _0801CA74
	adds r0, #1
	muls r0, r6, r0
	asrs r0, r0, #5
	ands r0, r3
	b _0801CA82
	.align 2, 0
_0801CA5C: .4byte gFlags
_0801CA60: .4byte gUnknown_03002878
_0801CA64: .4byte 0x0400001C
_0801CA68: .4byte gUnknown_03002A80
_0801CA6C: .4byte gUnknown_03001884
_0801CA70: .4byte gUnknown_03005590
_0801CA74:
	cmp r1, #0x78
	ble _0801CA7E
	mov r7, ip
	lsrs r0, r7, #0x10
	b _0801CA82
_0801CA7E:
	ldr r1, [sp, #0xc]
	lsrs r0, r1, #0x10
_0801CA82:
	strh r0, [r4]
	adds r4, #2
	mov r7, r8
	strh r7, [r4]
	adds r4, #2
	adds r0, r2, r5
	lsls r1, r5, #3
	add r1, sl
	ldr r7, _0801CB68 @ =0x000003FF
	ands r1, r7
	lsls r1, r1, #1
	ldr r7, _0801CB6C @ =gSineTable
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	adds r0, r0, r1
	cmp r0, #0xb1
	bgt _0801CAB2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x9e
	bls _0801CA48
_0801CAB2:
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	mov ip, r2
	cmp r5, #0x9e
	bhi _0801CB58
	ldr r6, _0801CB6C @ =gSineTable
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r3, #0x80
	lsls r3, r3, #1
	mov sl, r3
_0801CACE:
	movs r7, #8
	add sb, r7
	ldr r1, _0801CB68 @ =0x000003FF
	adds r0, r1, #0
	mov r2, sb
	ands r2, r0
	mov sb, r2
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r3, [r0]
	lsls r3, r3, #0x10
	asrs r1, r3, #0x1d
	ldr r7, [sp, #4]
	adds r1, r7, r1
	ldr r7, _0801CB70 @ =gUnknown_03005590
	ldr r0, [r7]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r2, _0801CB68 @ =0x000003FF
	ands r0, r2
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1b
	adds r1, r1, r0
	lsls r0, r5, #6
	ldr r7, [sp]
	adds r0, r7, r0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1d
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	mov r0, ip
	lsrs r2, r0, #1
	add r2, r8
	asrs r3, r3, #0x1c
	adds r2, r2, r3
	lsls r0, r5, #3
	ldr r3, _0801CB70 @ =gUnknown_03005590
	ldr r1, [r3]
	adds r0, r0, r1
	ldr r7, _0801CB68 @ =0x000003FF
	ands r0, r7
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r2, r2, r0
	strh r2, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r5, #0x9e
	bls _0801CACE
_0801CB58:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CB68: .4byte 0x000003FF
_0801CB6C: .4byte gSineTable
_0801CB70: .4byte gUnknown_03005590

	thumb_func_start sub_801CB74
sub_801CB74: @ 0x0801CB74
	push {r4, r5, lr}
	ldr r4, _0801CBC4 @ =gUnknown_03005850
	ldr r2, _0801CBC8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801CBCC @ =gBgCntRegs
	movs r5, #0
	ldr r0, _0801CBD0 @ =0x00001B0F
	strh r0, [r1]
	ldr r1, _0801CBD4 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	ldr r0, _0801CBD8 @ =0x00000171
	strh r0, [r4, #0x1c]
	ldr r0, _0801CBDC @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801CBE0 @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r0, _0801CBE4 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #0xc]
	strh r5, [r0, #0xe]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CBC4: .4byte gUnknown_03005850
_0801CBC8: .4byte gDispCnt
_0801CBCC: .4byte gBgCntRegs
_0801CBD0: .4byte 0x00001B0F
_0801CBD4: .4byte gUnknown_080D5864
_0801CBD8: .4byte 0x00000171
_0801CBDC: .4byte 0x0600C000
_0801CBE0: .4byte 0x0600D800
_0801CBE4: .4byte gBgScrollRegs

	thumb_func_start sub_801CBE8
sub_801CBE8: @ 0x0801CBE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	mov r8, r0
	adds r0, r1, #0
	movs r1, #0
	mov sl, r1
	ldr r1, _0801CC54 @ =gUnknown_03001884
	ldr r5, [r1]
	movs r1, #0x3c
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0801CC58 @ =gBgScrollRegs
	strh r3, [r0, #2]
	strh r3, [r0, #0xe]
	ldr r0, _0801CC5C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801CC1A
	b _0801CD4C
_0801CC1A:
	ldr r2, _0801CC60 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801CC6C
	ldr r0, _0801CC64 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801CC6C
	ldr r1, _0801CC68 @ =IWRAM_START + 0x408
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _0801CC3E
	mov r7, r8
	strh r7, [r1]
_0801CC3E:
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	movs r7, #0
	ldrsh r4, [r1, r7]
	mov r8, r4
	b _0801CC72
	.align 2, 0
_0801CC54: .4byte gUnknown_03001884
_0801CC58: .4byte gBgScrollRegs
_0801CC5C: .4byte gGameMode
_0801CC60: .4byte gPlayer
_0801CC64: .4byte gUnknown_030054F4
_0801CC68: .4byte IWRAM_START + 0x408
_0801CC6C:
	ldr r1, _0801CD5C @ =IWRAM_START + 0x408
	movs r0, #0
	strh r0, [r1]
_0801CC72:
	movs r4, #0
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldr r1, _0801CD60 @ =gUnknown_080D5B20
	adds r6, r0, #0
	mov sb, r1
	mov r0, sp
	adds r0, #2
	str r0, [sp, #0x44]
	lsls r3, r3, #0x18
	str r3, [sp, #0x40]
	ldrb r1, [r1]
	cmp r2, r1
	blt _0801CCA6
_0801CC8E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bhi _0801CCA8
	asrs r1, r6, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	add r0, sb
	ldrb r0, [r0]
	cmp r1, r0
	bge _0801CC8E
_0801CCA6:
	mov sl, r4
_0801CCA8:
	movs r4, #0
	mov r2, sl
	lsls r2, r2, #0x10
	mov sl, r2
	movs r6, #0xff
	ldr r3, _0801CD64 @ =gUnknown_080D5B22
	mov ip, r3
_0801CCB6:
	lsls r2, r4, #2
	mov r7, sp
	adds r3, r7, r2
	lsls r1, r4, #1
	adds r1, r1, r4
	ldr r7, _0801CD68 @ =gUnknown_080D5B21
	adds r0, r1, r7
	ldrb r0, [r0]
	mov r7, r8
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #5
	ands r0, r6
	strh r0, [r3]
	ldr r0, [sp, #0x44]
	adds r2, r0, r2
	add r1, ip
	ldrb r0, [r1]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #5
	ands r0, r6
	strh r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0801CCB6
	mov r2, sl
	asrs r0, r2, #0x10
	lsls r1, r0, #2
	mov r3, sp
	adds r2, r3, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	add r1, sb
	movs r4, #0
	ldr r7, [sp, #0x40]
	lsrs r3, r7, #0x18
_0801CD06:
	ldrh r0, [r2, #2]
	strh r0, [r5]
	adds r5, #2
	ldrh r0, [r2]
	strh r0, [r5]
	adds r5, #2
	ldrb r0, [r1]
	cmp r3, r0
	blo _0801CD1C
	adds r1, #3
	adds r2, #4
_0801CD1C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x9e
	bls _0801CD06
	ldr r1, _0801CD6C @ =gNumHBlankCallbacks
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r2, _0801CD6C @ =gNumHBlankCallbacks
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r3, _0801CD70 @ =gHBlankCallbacks
	adds r0, r0, r3
	ldr r4, _0801CD74 @ =sub_801E454
	str r4, [r0]
	ldr r7, _0801CD78 @ =gFlags
	ldr r0, [r7]
	movs r1, #8
	orrs r0, r1
	str r0, [r7]
_0801CD4C:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801CD5C: .4byte IWRAM_START + 0x408
_0801CD60: .4byte gUnknown_080D5B20
_0801CD64: .4byte gUnknown_080D5B22
_0801CD68: .4byte gUnknown_080D5B21
_0801CD6C: .4byte gNumHBlankCallbacks
_0801CD70: .4byte gHBlankCallbacks
_0801CD74: .4byte sub_801E454
_0801CD78: .4byte gFlags

	thumb_func_start sub_801CD7C
sub_801CD7C: @ 0x0801CD7C
	push {r4, r5, lr}
	ldr r4, _0801CDCC @ =gUnknown_03005850
	ldr r1, _0801CDD0 @ =gBgCntRegs
	movs r5, #0
	ldr r0, _0801CDD4 @ =0x00001B0F
	strh r0, [r1]
	ldr r1, _0801CDD8 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	ldr r0, _0801CDDC @ =0x00000173
	strh r0, [r4, #0x1c]
	ldr r0, _0801CDE0 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801CDE4 @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	movs r0, #0x13
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r0, _0801CDE8 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #0xc]
	strh r5, [r0, #0xe]
	ldr r0, _0801CDEC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0801CDC6
	bl sub_800A6A8
_0801CDC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CDCC: .4byte gUnknown_03005850
_0801CDD0: .4byte gBgCntRegs
_0801CDD4: .4byte 0x00001B0F
_0801CDD8: .4byte gUnknown_080D5864
_0801CDDC: .4byte 0x00000173
_0801CDE0: .4byte 0x0600C000
_0801CDE4: .4byte 0x0600D800
_0801CDE8: .4byte gBgScrollRegs
_0801CDEC: .4byte gGameMode

	thumb_func_start sub_801CDF0
sub_801CDF0: @ 0x0801CDF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r2, _0801CE2C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801CE38
	ldr r0, _0801CE30 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801CE38
	ldr r1, _0801CE34 @ =IWRAM_START + 0x40A
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0801CE18
	strh r5, [r1]
_0801CE18:
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	movs r3, #0
	ldrsh r5, [r1, r3]
	b _0801CE3E
	.align 2, 0
_0801CE2C: .4byte gPlayer
_0801CE30: .4byte gUnknown_030054F4
_0801CE34: .4byte IWRAM_START + 0x40A
_0801CE38:
	ldr r1, _0801CEB8 @ =IWRAM_START + 0x40A
	movs r0, #0
	strh r0, [r1]
_0801CE3E:
	ldr r0, _0801CEBC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0801CE78
	ldr r0, _0801CEC0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801CE78
	ldr r1, _0801CEC4 @ =gWinRegs
	movs r0, #0x3e
	strh r0, [r1, #0xa]
	ldr r0, _0801CEC8 @ =0x00003F3F
	strh r0, [r1, #8]
	movs r2, #0xf0
	strh r2, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	strh r2, [r1, #2]
	strh r0, [r1, #6]
	ldr r1, _0801CECC @ =gBldRegs
	movs r0, #7
	strh r0, [r1, #4]
	ldr r0, _0801CED0 @ =0x00003F41
	strh r0, [r1]
	ldr r0, _0801CED4 @ =0x00000C0C
	strh r0, [r1, #2]
_0801CE78:
	ldr r4, _0801CED8 @ =gUnknown_03005850
	adds r0, r4, #0
	bl sub_8002A3C
	adds r0, r4, #0
	bl UpdateBgAnimationTiles
	ldr r0, _0801CEDC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0801CEA6
	ldr r1, _0801CEE0 @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #1
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r2
	strh r0, [r1, #2]
_0801CEA6:
	ldr r0, _0801CEE0 @ =gBgScrollRegs
	asrs r1, r5, #4
	strh r1, [r0, #0xc]
	asrs r1, r6, #6
	strh r1, [r0, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801CEB8: .4byte IWRAM_START + 0x40A
_0801CEBC: .4byte gGameMode
_0801CEC0: .4byte gUnknown_03005424
_0801CEC4: .4byte gWinRegs
_0801CEC8: .4byte 0x00003F3F
_0801CECC: .4byte gBldRegs
_0801CED0: .4byte 0x00003F41
_0801CED4: .4byte 0x00000C0C
_0801CED8: .4byte gUnknown_03005850
_0801CEDC: .4byte gUnknown_03005590
_0801CEE0: .4byte gBgScrollRegs

	thumb_func_start sub_801CEE4
sub_801CEE4: @ 0x0801CEE4
	push {r4, lr}
	ldr r4, _0801CF3C @ =gUnknown_03005850
	ldr r0, _0801CF40 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0801CF2A
	ldr r2, _0801CF44 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801CF48 @ =gBgCntRegs
	ldr r0, _0801CF4C @ =0x00001B0C
	strh r0, [r1]
	ldr r1, _0801CF50 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xb9
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _0801CF54 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801CF58 @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
_0801CF2A:
	ldr r1, _0801CF5C @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801CF3C: .4byte gUnknown_03005850
_0801CF40: .4byte gGameMode
_0801CF44: .4byte gDispCnt
_0801CF48: .4byte gBgCntRegs
_0801CF4C: .4byte 0x00001B0C
_0801CF50: .4byte gUnknown_080D5864
_0801CF54: .4byte 0x0600C000
_0801CF58: .4byte 0x0600D800
_0801CF5C: .4byte gBgScrollRegs

	thumb_func_start sub_801CF60
sub_801CF60: @ 0x0801CF60
	push {r4, r5, r6, lr}
	ldr r1, _0801D0C8 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #1
	movs r2, #0
	strh r0, [r1]
	strh r2, [r1, #0xc]
	ldr r0, _0801D0CC @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r6, r0, #1
	ldr r0, _0801D0D0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801CF7E
	b _0801D0C2
_0801CF7E:
	ldr r2, _0801D0D4 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801D0D8 @ =gUnknown_03002878
	ldr r0, _0801D0DC @ =0x0400001C
	str r0, [r1]
	ldr r1, _0801D0E0 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801D0E4 @ =gUnknown_03001884
	ldr r4, [r0]
	ldr r0, _0801D0E8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x12
	beq _0801CFDE
	ldr r2, _0801D0EC @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801D0F0 @ =gWinRegs
	movs r0, #0x3f
	strh r0, [r1, #0xa]
	ldr r0, _0801D0F4 @ =0x00003F3F
	strh r0, [r1, #8]
	movs r2, #0xf0
	strh r2, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	strh r2, [r1, #2]
	strh r0, [r1, #6]
	ldr r1, _0801D0F8 @ =gBldRegs
	movs r0, #7
	strh r0, [r1, #4]
	ldr r0, _0801D0FC @ =0x00003F41
	strh r0, [r1]
	ldr r0, _0801D100 @ =0x00001010
	strh r0, [r1, #2]
_0801CFDE:
	movs r5, #0
	movs r1, #0
_0801CFE2:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x5f
	bls _0801CFE2
	adds r0, r6, #0
	movs r1, #8
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x63
	bhi _0801D00E
_0801D000:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x63
	bls _0801D000
_0801D00E:
	adds r0, r6, #0
	movs r1, #7
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x67
	bhi _0801D02C
_0801D01E:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x67
	bls _0801D01E
_0801D02C:
	adds r0, r6, #0
	movs r1, #6
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x6f
	bhi _0801D04A
_0801D03C:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x6f
	bls _0801D03C
_0801D04A:
	adds r0, r6, #0
	movs r1, #5
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x77
	bhi _0801D068
_0801D05A:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x77
	bls _0801D05A
_0801D068:
	adds r0, r6, #0
	movs r1, #4
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x7f
	bhi _0801D086
_0801D078:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x7f
	bls _0801D078
_0801D086:
	adds r0, r6, #0
	movs r1, #3
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x8f
	bhi _0801D0A4
_0801D096:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x8f
	bls _0801D096
_0801D0A4:
	adds r0, r6, #0
	movs r1, #2
	bl Div
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r5, #0x9e
	bhi _0801D0C2
_0801D0B4:
	strh r1, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x9e
	bls _0801D0B4
_0801D0C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D0C8: .4byte gBgScrollRegs
_0801D0CC: .4byte gUnknown_03005590
_0801D0D0: .4byte gGameMode
_0801D0D4: .4byte gFlags
_0801D0D8: .4byte gUnknown_03002878
_0801D0DC: .4byte 0x0400001C
_0801D0E0: .4byte gUnknown_03002A80
_0801D0E4: .4byte gUnknown_03001884
_0801D0E8: .4byte gCurrentLevel
_0801D0EC: .4byte gDispCnt
_0801D0F0: .4byte gWinRegs
_0801D0F4: .4byte 0x00003F3F
_0801D0F8: .4byte gBldRegs
_0801D0FC: .4byte 0x00003F41
_0801D100: .4byte 0x00001010

	thumb_func_start sub_801D104
sub_801D104: @ 0x0801D104
	push {r4, r5, lr}
	sub sp, #4
	ldr r2, _0801D178 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r5, _0801D17C @ =gBgCntRegs
	movs r4, #0
	movs r2, #0
	ldr r0, _0801D180 @ =0x00001A0F
	strh r0, [r5]
	ldr r0, _0801D184 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _0801D188 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	str r2, [sp]
	ldr r1, _0801D18C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0801D190 @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _0801D194 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801D198 @ =gBgScrollRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	ldr r1, _0801D19C @ =gUnknown_03005590
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [r1]
	ldr r0, _0801D1A0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801D162
	bl sub_801D1A8
_0801D162:
	ldrh r0, [r5, #6]
	ldr r1, _0801D1A4 @ =0x0000FFFC
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strh r1, [r5, #6]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D178: .4byte gDispCnt
_0801D17C: .4byte gBgCntRegs
_0801D180: .4byte 0x00001A0F
_0801D184: .4byte gUnknown_03004D80
_0801D188: .4byte gUnknown_03002280
_0801D18C: .4byte 0x040000D4
_0801D190: .4byte 0x0600C000
_0801D194: .4byte 0x85000010
_0801D198: .4byte gBgScrollRegs
_0801D19C: .4byte gUnknown_03005590
_0801D1A0: .4byte gGameMode
_0801D1A4: .4byte 0x0000FFFC

	thumb_func_start sub_801D1A8
sub_801D1A8: @ 0x0801D1A8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _0801D21C @ =gUnknown_03005850
	ldr r2, _0801D220 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801D224 @ =gBgCntRegs
	movs r2, #0
	movs r3, #0
	ldr r0, _0801D228 @ =0x00001A0F
	strh r0, [r1]
	ldr r0, _0801D22C @ =gUnknown_03004D80
	strb r2, [r0]
	ldr r1, _0801D230 @ =gUnknown_03002280
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r5, #0x20
	strb r5, [r1, #3]
	str r3, [sp]
	ldr r1, _0801D234 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r6, _0801D238 @ =0x0600C000
	str r6, [r1, #4]
	ldr r0, _0801D23C @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0801D240 @ =gBgScrollRegs
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #0xc]
	strh r3, [r0, #0xe]
	ldr r1, _0801D244 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa8
	strh r0, [r4, #0x1c]
	str r6, [r4, #4]
	ldr r0, _0801D248 @ =0x0600D000
	str r0, [r4, #0xc]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D21C: .4byte gUnknown_03005850
_0801D220: .4byte gDispCnt
_0801D224: .4byte gBgCntRegs
_0801D228: .4byte 0x00001A0F
_0801D22C: .4byte gUnknown_03004D80
_0801D230: .4byte gUnknown_03002280
_0801D234: .4byte 0x040000D4
_0801D238: .4byte 0x0600C000
_0801D23C: .4byte 0x85000010
_0801D240: .4byte gBgScrollRegs
_0801D244: .4byte gUnknown_080D5864
_0801D248: .4byte 0x0600D000

	thumb_func_start sub_801D24C
sub_801D24C: @ 0x0801D24C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	ldr r4, _0801D374 @ =gFlags
	ldr r0, [r4]
	movs r3, #4
	orrs r0, r3
	str r0, [r4]
	ldr r2, _0801D378 @ =gUnknown_03002878
	ldr r0, _0801D37C @ =0x04000010
	str r0, [r2]
	ldr r0, _0801D380 @ =gUnknown_03002A80
	strb r3, [r0]
	ldr r2, _0801D384 @ =gWinRegs
	movs r0, #0
	mov sl, r0
	movs r0, #0x3f
	strh r0, [r2, #0xa]
	ldr r3, _0801D388 @ =gBldRegs
	mov r8, r3
	ldr r0, _0801D38C @ =0x00003F41
	strh r0, [r3]
	movs r0, #0x81
	lsls r0, r0, #4
	strh r0, [r3, #2]
	movs r0, #0xa0
	strh r0, [r2, #4]
	ldr r0, _0801D390 @ =gUnknown_03001884
	ldr r3, [r0]
	ldr r0, _0801D394 @ =gUnknown_03005590
	ldr r0, [r0]
	ldr r5, _0801D398 @ =0x000003FF
	mov ip, r5
	adds r5, r0, #0
	mov r6, ip
	ands r5, r6
	lsrs r7, r0, #1
	ands r7, r6
	lsls r2, r1, #0x10
	asrs r1, r2, #0xf
	asrs r0, r2, #0x11
	adds r1, r1, r0
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0801D2C2
	movs r6, #0x9f
_0801D2C2:
	mov r0, sb
	cmp r0, #0
	bne _0801D2CA
	b _0801D3D6
_0801D2CA:
	asrs r0, r2, #0x14
	movs r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #8
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	movs r4, #0
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	mov sl, r0
	cmp r4, r1
	bge _0801D312
	movs r2, #0
	mov sb, r2
	movs r6, #0xf
	rsbs r6, r6, #0
	mov r8, r6
	movs r6, #0xff
	adds r2, r1, #0
_0801D2F2:
	mov r0, sb
	strh r0, [r3]
	adds r3, #2
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	subs r0, r4, r1
	ands r0, r6
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r2
	blt _0801D2F2
_0801D312:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D31C
	b _0801D498
_0801D31C:
	ldr r6, _0801D39C @ =gSineTable
	mov ip, r6
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0801D398 @ =0x000003FF
	mov sb, r0
	movs r2, #0xff
	mov r8, r2
	mov r6, sl
	asrs r5, r6, #0x10
_0801D332:
	asrs r1, r1, #0x10
	lsls r0, r1, #4
	adds r0, r0, r7
	ldr r2, [sp, #4]
	adds r0, r0, r2
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	lsls r2, r1, #1
	subs r0, r0, r2
	mov r6, r8
	ands r0, r6
	strh r0, [r3]
	adds r3, #2
	adds r0, r1, #0
	subs r0, #0xf
	cmp r0, r5
	bge _0801D3A0
	movs r0, #1
	subs r0, r0, r1
	subs r1, r1, r5
	subs r1, #0xf
	lsls r1, r1, #3
	subs r0, r0, r1
	movs r1, #0xfe
	ands r0, r1
	b _0801D3BE
	.align 2, 0
_0801D374: .4byte gFlags
_0801D378: .4byte gUnknown_03002878
_0801D37C: .4byte 0x04000010
_0801D380: .4byte gUnknown_03002A80
_0801D384: .4byte gWinRegs
_0801D388: .4byte gBldRegs
_0801D38C: .4byte 0x00003F41
_0801D390: .4byte gUnknown_03001884
_0801D394: .4byte gUnknown_03005590
_0801D398: .4byte 0x000003FF
_0801D39C: .4byte gSineTable
_0801D3A0:
	lsls r0, r1, #2
	adds r0, r7, r0
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	subs r0, r0, r2
	ldr r2, [sp, #4]
	adds r0, r2, r0
	mov r6, r8
	ands r0, r6
_0801D3BE:
	strh r0, [r3]
	adds r3, #2
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D332
	b _0801D498
_0801D3D6:
	asrs r0, r2, #0x15
	movs r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #8
	orrs r0, r1
	mov r2, r8
	strh r0, [r2, #2]
	lsls r6, r6, #0x10
	movs r4, #0
	mov sl, r6
	cmp r6, #0
	ble _0801D44C
	ldr r0, _0801D478 @ =gSineTable
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	mov r8, ip
	movs r1, #0xff
	mov ip, r1
_0801D3FC:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #4
	adds r0, r0, r7
	adds r0, r0, r5
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	lsls r2, r1, #1
	subs r0, r0, r2
	mov r4, ip
	ands r0, r4
	strh r0, [r3]
	adds r3, #2
	lsls r0, r1, #2
	adds r0, r7, r0
	mov r4, r8
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	subs r0, r0, r2
	adds r0, r5, r0
	mov r2, ip
	ands r0, r2
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r1, r6
	blt _0801D3FC
_0801D44C:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	bgt _0801D498
	mov r5, sl
	asrs r2, r5, #0x10
	movs r5, #0xff
_0801D45A:
	movs r0, #0
	strh r0, [r3]
	adds r3, #2
	asrs r1, r1, #0x10
	adds r0, r1, #0
	subs r0, #0xf
	cmp r0, r2
	bge _0801D47C
	subs r0, r1, r2
	subs r0, #0xf
	lsls r0, r0, #3
	subs r1, #1
	subs r0, r0, r1
	b _0801D480
	.align 2, 0
_0801D478: .4byte gSineTable
_0801D47C:
	rsbs r0, r1, #0
	adds r0, #1
_0801D480:
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	lsls r0, r4, #0x10
	movs r6, #0x80
	lsls r6, r6, #9
	adds r0, r0, r6
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D45A
_0801D498:
	ldr r0, [sp]
	cmp r0, #0x10
	bls _0801D4A2
	movs r1, #0x10
	str r1, [sp]
_0801D4A2:
	movs r5, #0
	ldr r6, _0801D528 @ =gUnknown_080D5C02
	movs r2, #0x1f
	mov ip, r2
	movs r3, #0x32
	adds r3, r3, r6
	mov sb, r3
	ldr r4, _0801D52C @ =gBgPalette
	mov r8, r4
_0801D4B4:
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r1, r3, #1
	adds r1, r1, r3
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrb r7, [r0]
	ldr r5, [sp]
	adds r4, r7, #0
	muls r4, r5, r4
	asrs r4, r4, #4
	mov r0, ip
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x31
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	asrs r2, r2, #4
	mov r5, ip
	ands r2, r5
	add r1, sb
	ldrb r0, [r1]
	ldr r1, [sp]
	muls r0, r1, r0
	asrs r0, r0, #4
	ands r0, r5
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	adds r0, r0, r2
	adds r4, r4, r0
	strh r4, [r1]
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0xf
	ble _0801D4B4
	ldr r2, _0801D530 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D528: .4byte gUnknown_080D5C02
_0801D52C: .4byte gBgPalette
_0801D530: .4byte gFlags

	thumb_func_start sub_801D534
sub_801D534: @ 0x0801D534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0801D568 @ =gUnknown_03005850
	ldr r1, _0801D56C @ =gBgScrollRegs
	asrs r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, _0801D570 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd0
	lsls r1, r1, #3
	bl Mod
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #0
	movs r2, #7
	ldr r0, _0801D574 @ =gUnknown_080D5BF0
	ldrh r0, [r0, #0xe]
	cmp r6, r0
	bls _0801D578
	movs r5, #7
	b _0801D598
	.align 2, 0
_0801D568: .4byte gUnknown_03005850
_0801D56C: .4byte gBgScrollRegs
_0801D570: .4byte gUnknown_03005590
_0801D574: .4byte gUnknown_080D5BF0
_0801D578:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	lsls r3, r2, #0x18
	asrs r0, r3, #0x18
	cmp r0, #0
	blt _0801D598
	ldr r1, _0801D5C4 @ =gUnknown_080D5BF0
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r6, r0
	bls _0801D578
	lsrs r5, r3, #0x18
_0801D598:
	ldr r0, _0801D5C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801D5A2
	movs r5, #5
_0801D5A2:
	ldr r1, _0801D5CC @ =gBgPalette
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0801D5D0 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	mov sl, r2
	cmp r5, #7
	bls _0801D5BA
	b _0801D942
_0801D5BA:
	lsls r0, r5, #2
	ldr r1, _0801D5D4 @ =_0801D5D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D5C4: .4byte gUnknown_080D5BF0
_0801D5C8: .4byte gGameMode
_0801D5CC: .4byte gBgPalette
_0801D5D0: .4byte gFlags
_0801D5D4: .4byte _0801D5D8
_0801D5D8: @ jump table
	.4byte _0801D5F8 @ case 0
	.4byte _0801D680 @ case 1
	.4byte _0801D68C @ case 2
	.4byte _0801D6D0 @ case 3
	.4byte _0801D718 @ case 4
	.4byte _0801D7F8 @ case 5
	.4byte _0801D86C @ case 6
	.4byte _0801D90C @ case 7
_0801D5F8:
	cmp r6, #1
	bne _0801D630
	ldr r1, _0801D624 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa7
	strh r0, [r4, #0x1c]
	ldr r0, _0801D628 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D62C @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	b _0801D942
	.align 2, 0
_0801D624: .4byte gUnknown_080D5864
_0801D628: .4byte 0x0600C000
_0801D62C: .4byte 0x0600D000
_0801D630:
	cmp r6, #1
	bhi _0801D636
	b _0801D942
_0801D636:
	ldr r2, _0801D674 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801D678 @ =gBgCntRegs
	ldrh r3, [r2]
	ldr r1, _0801D67C @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r3
	movs r3, #3
	orrs r0, r3
	strh r0, [r2]
	ldrh r0, [r2, #6]
	ands r1, r0
	orrs r1, r3
	strh r1, [r2, #6]
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3f
	bls _0801D666
	movs r2, #0x3f
_0801D666:
	lsrs r6, r6, #2
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3f
	subs r1, r1, r2
	b _0801D684
	.align 2, 0
_0801D674: .4byte gDispCnt
_0801D678: .4byte gBgCntRegs
_0801D67C: .4byte 0x0000FFFC
_0801D680:
	movs r0, #0xf
	movs r1, #0
_0801D684:
	movs r2, #0
	bl sub_801D24C
	b _0801D942
_0801D68C:
	ldr r1, _0801D6B4 @ =0xFFFFFDBF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsls r1, r0, #8
	lsrs r2, r1, #0x18
	lsrs r6, r0, #0x12
	movs r0, #0xf
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0801D6B8
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x3f
	subs r1, r1, r2
	movs r2, #1
	bl sub_801D24C
	b _0801D942
	.align 2, 0
_0801D6B4: .4byte 0xFFFFFDBF
_0801D6B8:
	mov r2, sl
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0801D6CC @ =gBldRegs
	strh r6, [r0]
	b _0801D942
	.align 2, 0
_0801D6CC: .4byte gBldRegs
_0801D6D0:
	ldr r3, _0801D70C @ =gBgCntRegs
	ldrh r2, [r3]
	ldr r1, _0801D710 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	movs r2, #3
	orrs r0, r2
	strh r0, [r3]
	ldrh r0, [r3, #6]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strh r1, [r3, #6]
	movs r2, #0
	ldr r4, _0801D714 @ =gBgPalette
	movs r3, #0
_0801D6F0:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0xf
	ble _0801D6F0
	b _0801D8EE
	.align 2, 0
_0801D70C: .4byte gBgCntRegs
_0801D710: .4byte 0x0000FFFC
_0801D714: .4byte gBgPalette
_0801D718:
	ldr r0, _0801D744 @ =0x00000381
	cmp r6, r0
	bne _0801D754
	ldr r1, _0801D748 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xa8
	strh r0, [r4, #0x1c]
	ldr r0, _0801D74C @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D750 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	b _0801D76C
	.align 2, 0
_0801D744: .4byte 0x00000381
_0801D748: .4byte gUnknown_080D5864
_0801D74C: .4byte 0x0600C000
_0801D750: .4byte 0x0600D000
_0801D754:
	ldr r2, _0801D7D8 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801D7DC @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
_0801D76C:
	ldr r1, _0801D7E0 @ =0xFFFFFC7F
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r3, _0801D7E4 @ =gBgScrollRegs
	mov r8, r3
	ldr r0, _0801D7E8 @ =gFlags
	mov sl, r0
	ldr r1, _0801D7EC @ =gUnknown_080D5C02
	mov ip, r1
	movs r7, #0x1f
	ldr r3, _0801D7F0 @ =gBgPalette
	mov sb, r3
_0801D788:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r1, r3, #1
	adds r1, r1, r3
	mov r2, ip
	adds r0, r1, r2
	ldrb r4, [r0]
	muls r4, r6, r4
	asrs r4, r4, #5
	ands r4, r7
	mov r0, ip
	adds r0, #1
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r2, r5, #0
	muls r2, r6, r2
	asrs r2, r2, #5
	ands r2, r7
	ldr r0, _0801D7F4 @ =gUnknown_080D5C04
	adds r1, r1, r0
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #5
	ands r0, r7
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, sb
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D788
	b _0801D83C
	.align 2, 0
_0801D7D8: .4byte gDispCnt
_0801D7DC: .4byte gBgCntRegs
_0801D7E0: .4byte 0xFFFFFC7F
_0801D7E4: .4byte gBgScrollRegs
_0801D7E8: .4byte gFlags
_0801D7EC: .4byte gUnknown_080D5C02
_0801D7F0: .4byte gBgPalette
_0801D7F4: .4byte gUnknown_080D5C04
_0801D7F8:
	movs r2, #0
	ldr r0, _0801D860 @ =gBgScrollRegs
	mov r8, r0
	ldr r6, _0801D864 @ =gUnknown_080D5C02
	adds r1, r6, #2
	mov sb, r1
	ldr r3, _0801D868 @ =gBgPalette
	mov ip, r3
	adds r7, r6, #1
_0801D80A:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r0, r3, #1
	adds r0, r0, r3
	adds r1, r0, r6
	ldrb r4, [r1]
	adds r1, r0, r7
	ldrb r5, [r1]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0xf0
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r0, #0xa
	lsls r1, r5, #5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D80A
_0801D83C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	str r0, [r2]
	mov r3, r8
	ldrh r0, [r3]
	subs r0, #2
	movs r1, #0xff
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r3, #2]
	adds r0, #1
	ands r0, r1
	strh r0, [r3, #2]
	b _0801D942
	.align 2, 0
_0801D860: .4byte gBgScrollRegs
_0801D864: .4byte gUnknown_080D5C02
_0801D868: .4byte gBgPalette
_0801D86C:
	ldr r1, _0801D8FC @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	ldr r1, _0801D900 @ =0xFFFFFA5F
	adds r0, r6, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x1f
	subs r0, r0, r6
	lsls r0, r0, #0xf
	lsrs r6, r0, #0x10
	movs r2, #0
	ldr r3, _0801D904 @ =gUnknown_080D5C02
	mov ip, r3
	movs r7, #0x1f
	movs r0, #2
	add r0, ip
	mov sb, r0
	ldr r1, _0801D908 @ =gBgPalette
	mov r8, r1
_0801D8A2:
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r1, r3, #1
	adds r1, r1, r3
	mov r2, ip
	adds r0, r1, r2
	ldrb r4, [r0]
	muls r4, r6, r4
	asrs r4, r4, #4
	ands r4, r7
	mov r0, ip
	adds r0, #1
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r2, r5, #0
	muls r2, r6, r2
	asrs r2, r2, #4
	ands r2, r7
	add r1, sb
	ldrb r0, [r1]
	muls r0, r6, r0
	asrs r0, r0, #4
	ands r0, r7
	adds r1, r3, #0
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r3, #1
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	asrs r3, r3, #0x18
	cmp r3, #0xf
	ble _0801D8A2
_0801D8EE:
	mov r3, sl
	ldr r0, [r3]
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	b _0801D942
	.align 2, 0
_0801D8FC: .4byte gBgScrollRegs
_0801D900: .4byte 0xFFFFFA5F
_0801D904: .4byte gUnknown_080D5C02
_0801D908: .4byte gBgPalette
_0801D90C:
	movs r2, #0
	ldr r5, _0801D950 @ =gDispCnt
	ldr r4, _0801D954 @ =gBgPalette
	movs r3, #0
_0801D914:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r3, [r0]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0xf
	ble _0801D914
	mov r1, sl
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	str r0, [r2]
	ldrh r1, [r5]
	ldr r0, _0801D958 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r5]
_0801D942:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D950: .4byte gDispCnt
_0801D954: .4byte gBgPalette
_0801D958: .4byte 0x0000FEFF

	thumb_func_start sub_801D95C
sub_801D95C: @ 0x0801D95C
	push {r4, r5, r6, lr}
	ldr r4, _0801D9B0 @ =gUnknown_03005850
	ldr r1, _0801D9B4 @ =gDispCnt
	movs r2, #0xb2
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r5, _0801D9B8 @ =gBgCntRegs
	movs r6, #0
	ldr r0, _0801D9BC @ =0x0000160F
	strh r0, [r5]
	ldr r1, _0801D9C0 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xd1
	strh r0, [r4, #0x1c]
	ldr r0, _0801D9C4 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D9C8 @ =0x0600B000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	ldrh r1, [r5, #6]
	ldr r0, _0801D9CC @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r5, #6]
	ldr r0, _0801D9D0 @ =gBgScrollRegs
	strh r6, [r0]
	strh r6, [r0, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D9B0: .4byte gUnknown_03005850
_0801D9B4: .4byte gDispCnt
_0801D9B8: .4byte gBgCntRegs
_0801D9BC: .4byte 0x0000160F
_0801D9C0: .4byte gUnknown_080D5864
_0801D9C4: .4byte 0x0600C000
_0801D9C8: .4byte 0x0600B000
_0801D9CC: .4byte 0x0000FFFC
_0801D9D0: .4byte gBgScrollRegs

	thumb_func_start sub_801D9D4
sub_801D9D4: @ 0x0801D9D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r5, r1, #0
	ldr r2, _0801DB80 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801DA1A
	ldr r0, _0801DB84 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801DA1A
	ldr r1, _0801DB88 @ =gBgScrollRegs
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0801DA08
	mov r0, sl
	strh r0, [r1, #0xc]
_0801DA08:
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	movs r0, #0xc
	ldrsh r3, [r1, r0]
	mov sl, r3
_0801DA1A:
	ldr r2, _0801DB8C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DB90 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801DB94 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0801DB98 @ =gUnknown_03002878
	ldr r0, _0801DB9C @ =0x0400001C
	str r0, [r1]
	ldr r0, _0801DBA0 @ =gUnknown_03002A80
	strb r2, [r0]
	ldr r0, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r0, #0x2a
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0xc8
	lsls r1, r1, #1
	bl Div
	mov r2, sl
	lsls r0, r2, #1
	asrs r3, r5, #4
	str r3, [sp, #0xc]
	asrs r5, r5, #1
	str r5, [sp, #4]
	asrs r2, r2, #4
	str r2, [sp, #8]
	movs r2, #8
	movs r1, #0x10
	movs r3, #0x27
_0801DA6A:
	strh r2, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DA6A
	add r0, sl
	lsls r0, r0, #3
	add r0, sl
	movs r1, #0xc8
	lsls r1, r1, #1
	bl Div
	mov ip, r0
	movs r0, #0xff
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r0, #0x11
	movs r3, #0x76
_0801DA94:
	mov r2, ip
	strh r2, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DA94
	movs r1, #0
_0801DAA6:
	ldr r3, _0801DBA8 @ =gUnknown_03005590
	ldr r0, [r3]
	add r0, sl
	lsrs r0, r0, #3
	mov ip, r0
	movs r0, #0xff
	mov r2, ip
	ands r2, r0
	mov ip, r2
	movs r0, #0x64
	muls r0, r1, r0
	adds r0, #0x40
	ldr r3, [sp, #0xc]
	subs r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xef
	bhi _0801DBAC
	lsls r0, r5, #2
	mov sb, r0
	adds r1, #1
	str r1, [sp]
	cmp r5, #0x50
	bls _0801DB1C
	ldr r1, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r1]
	adds r0, r5, #0
	subs r0, #0x50
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	subs r0, r5, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r3, r5, #0
	movs r2, #0
	adds r7, r1, #0
	adds r7, #0xa0
	cmp r3, r7
	bge _0801DB1C
	cmp r2, r1
	bhs _0801DB1C
	movs r0, #0
	mov r8, r0
	movs r0, #0xd0
	subs r6, r0, r3
_0801DB02:
	mov r0, r8
	strh r0, [r4]
	adds r4, #2
	strh r6, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, r7
	bge _0801DB1C
	cmp r2, r1
	blo _0801DB02
_0801DB1C:
	ldr r1, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r1]
	add r4, sb
	adds r3, r5, #0
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DB48
	movs r0, #0xf0
	subs r1, r0, r3
_0801DB2E:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DB48
	cmp r2, #0xf
	bls _0801DB2E
_0801DB48:
	cmp r3, #0x4f
	bgt _0801DBEE
	movs r0, #0x50
	subs r0, r0, r3
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DBEE
	cmp r2, r1
	bhs _0801DBEE
	movs r6, #0
	movs r0, #0xb8
	subs r5, r0, r5
_0801DB66:
	strh r6, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DBEE
	cmp r2, r1
	blo _0801DB66
	b _0801DBEE
	.align 2, 0
_0801DB80: .4byte gPlayer
_0801DB84: .4byte gUnknown_030054F4
_0801DB88: .4byte gBgScrollRegs
_0801DB8C: .4byte gDispCnt
_0801DB90: .4byte 0x0000FEFF
_0801DB94: .4byte gFlags
_0801DB98: .4byte gUnknown_03002878
_0801DB9C: .4byte 0x0400001C
_0801DBA0: .4byte gUnknown_03002A80
_0801DBA4: .4byte gUnknown_03001884
_0801DBA8: .4byte gUnknown_03005590
_0801DBAC:
	ldr r2, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r2]
	movs r0, #0xff
	subs r3, r0, r5
	adds r1, #1
	str r1, [sp]
	cmp r3, #0xf
	bgt _0801DBD2
	ldr r1, _0801DCD0 @ =0x000001EF
	adds r0, r1, #0
	subs r0, r0, r5
_0801DBC2:
	mov r2, ip
	strh r2, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _0801DBC2
_0801DBD2:
	movs r2, #0
	movs r3, #0
	ldr r1, _0801DCD4 @ =0x000001B7
	adds r0, r1, #0
	subs r1, r0, r5
_0801DBDC:
	strh r3, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0801DBDC
_0801DBEE:
	ldr r2, [sp]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bhi _0801DBFA
	b _0801DAA6
_0801DBFA:
	ldr r3, _0801DCD8 @ =gUnknown_03005590
	ldr r0, [r3]
	add r0, sl
	lsrs r0, r0, #1
	mov ip, r0
	movs r0, #0xff
	mov r1, ip
	ands r1, r0
	mov ip, r1
	ldr r2, [sp, #4]
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xdf
	bhi _0801DCDC
	lsls r3, r5, #2
	mov sb, r3
	cmp r5, #0x50
	bls _0801DC66
	ldr r0, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r0]
	adds r0, r5, #0
	subs r0, #0x50
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	subs r0, r5, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r3, r5, #0
	movs r2, #0
	adds r6, r1, #0
	adds r6, #0xa0
	cmp r3, r6
	bge _0801DC66
	cmp r2, r1
	bhs _0801DC66
	movs r0, #0
	mov r8, r0
	movs r0, #0xd0
	subs r7, r0, r3
_0801DC4C:
	mov r0, r8
	strh r0, [r4]
	adds r4, #2
	strh r7, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, r6
	bge _0801DC66
	cmp r2, r1
	blo _0801DC4C
_0801DC66:
	ldr r1, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r1]
	add r4, sb
	adds r3, r5, #0
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DC92
	movs r0, #0xd0
	subs r1, r0, r3
_0801DC78:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DC92
	cmp r2, #0x1f
	bls _0801DC78
_0801DC92:
	cmp r3, #0x4f
	bgt _0801DD1A
	movs r0, #0x50
	subs r0, r0, r3
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DD1A
	cmp r2, r1
	bhs _0801DD1A
	movs r6, #0
	movs r0, #0xa8
	subs r5, r0, r5
_0801DCB0:
	strh r6, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DD1A
	cmp r2, r1
	blo _0801DCB0
	b _0801DD1A
	.align 2, 0
_0801DCCC: .4byte gUnknown_03001884
_0801DCD0: .4byte 0x000001EF
_0801DCD4: .4byte 0x000001B7
_0801DCD8: .4byte gUnknown_03005590
_0801DCDC:
	ldr r1, _0801DD64 @ =gUnknown_03001884
	ldr r4, [r1]
	movs r0, #0xff
	subs r3, r0, r5
	cmp r3, #0x1f
	bgt _0801DCFE
	ldr r2, _0801DD68 @ =0x000001CF
	adds r0, r2, #0
	subs r0, r0, r5
_0801DCEE:
	mov r1, ip
	strh r1, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _0801DCEE
_0801DCFE:
	movs r2, #0
	movs r3, #0
	ldr r1, _0801DD6C @ =0x000001A7
	adds r0, r1, #0
	subs r1, r0, r5
_0801DD08:
	strh r3, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0801DD08
_0801DD1A:
	ldr r2, [sp, #8]
	lsls r1, r2, #0x10
	movs r6, #7
	ldr r5, _0801DD70 @ =gUnknown_080D5C82
	ldr r0, _0801DD74 @ =gBgPalette
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r4, r0, r3
	lsrs r1, r1, #0x10
	movs r3, #7
_0801DD2E:
	adds r0, r1, #0
	ands r0, r6
	adds r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0801DD2E
	ldr r1, _0801DD78 @ =gFlags
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	ldr r2, _0801DD78 @ =gFlags
	str r0, [r2]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD64: .4byte gUnknown_03001884
_0801DD68: .4byte 0x000001CF
_0801DD6C: .4byte 0x000001A7
_0801DD70: .4byte gUnknown_080D5C82
_0801DD74: .4byte gBgPalette
_0801DD78: .4byte gFlags

	thumb_func_start sub_801DD7C
sub_801DD7C: @ 0x0801DD7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r2, _0801DED8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DEDC @ =0x0000F7FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801DEE0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801DEE4 @ =gUnknown_03002878
	ldr r0, _0801DEE8 @ =0x04000010
	str r0, [r1]
	ldr r1, _0801DEEC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801DEF0 @ =gUnknown_03001884
	ldr r4, [r0]
	ldr r0, _0801DEF4 @ =gUnknown_03005590
	ldr r5, [r0]
	lsrs r1, r5, #3
	movs r2, #0x1f
	ands r1, r2
	mov sb, r0
	cmp r1, #0xf
	bls _0801DDCA
	subs r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0801DDCA:
	movs r3, #0
	ldr r6, _0801DEF8 @ =gUnknown_080D5C62
	adds r7, r6, #2
	mov r8, r7
	movs r0, #7
	mov ip, r0
	movs r1, #0xff
	mov sl, r1
_0801DDDA:
	lsls r0, r3, #1
	mov r7, sp
	adds r2, r7, r0
	adds r1, r3, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #2
	adds r0, r1, r6
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	add r1, r8
	lsrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, sl
	ands r0, r1
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0801DDDA
	ldr r6, _0801DEFC @ =0x0000507F
	movs r3, #0
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE10:
	mov r7, sb
	ldr r0, [r7]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x4f
	bls _0801DE10
	cmp r3, #0x9e
	bhi _0801DEC6
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE6E:
	mov r1, sb
	ldr r0, [r1]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xa0
	subs r0, r0, r3
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x9e
	bls _0801DE6E
_0801DEC6:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DED8: .4byte gDispCnt
_0801DEDC: .4byte 0x0000F7FF
_0801DEE0: .4byte gFlags
_0801DEE4: .4byte gUnknown_03002878
_0801DEE8: .4byte 0x04000010
_0801DEEC: .4byte gUnknown_03002A80
_0801DEF0: .4byte gUnknown_03001884
_0801DEF4: .4byte gUnknown_03005590
_0801DEF8: .4byte gUnknown_080D5C62
_0801DEFC: .4byte 0x0000507F
_0801DF00: .4byte gSineTable
_0801DF04: .4byte 0x000003FF

	thumb_func_start sub_801DF08
sub_801DF08: @ 0x0801DF08
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r1, _0801DFE0 @ =gDispCnt
	ldr r2, _0801DFE4 @ =0x00001141
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0801DFE8 @ =gUnknown_03004D80
	movs r5, #0
	strb r5, [r0, #2]
	ldr r1, _0801DFEC @ =gUnknown_03002280
	strb r5, [r1, #8]
	strb r5, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	mov sb, r0
	mov r2, sb
	strb r2, [r1, #0xb]
	ldr r4, _0801DFF0 @ =gUnknown_030058D0
	ldr r0, _0801DFF4 @ =gBgCntRegs
	mov r8, r0
	ldr r0, _0801DFF8 @ =0x00001A89
	mov r1, r8
	strh r0, [r1, #4]
	ldr r6, _0801DFFC @ =gUnknown_080D5864
	adds r1, r6, #0
	adds r1, #0x80
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	ldr r0, _0801E000 @ =0x00000177
	strh r0, [r4, #0x1c]
	ldr r0, _0801E004 @ =0x06008000
	str r0, [r4, #4]
	ldr r0, _0801E008 @ =0x0600D000
	str r0, [r4, #0xc]
	movs r0, #0xa
	strh r0, [r4, #0x26]
	movs r0, #9
	strh r0, [r4, #0x28]
	ldrh r0, [r4, #0x2e]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	subs r4, #0x80
	ldr r0, _0801E00C @ =0x00001E07
	mov r2, r8
	strh r0, [r2]
	adds r6, #0xc0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xba
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _0801E010 @ =0x06004000
	str r0, [r4, #4]
	ldr r0, _0801E014 @ =0x0600F000
	str r0, [r4, #0xc]
	mov r0, sb
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	strh r5, [r4, #0x2e]
	adds r0, r4, #0
	bl sub_8002A3C
	ldr r0, _0801E018 @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	strh r5, [r0, #0xc]
	strh r5, [r0, #0xe]
	movs r2, #0
	ldr r4, _0801E01C @ =gBgPalette
	ldr r3, _0801E020 @ =gUnknown_080D5CC2
_0801DFB6:
	lsls r0, r2, #1
	adds r1, r0, r4
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0801DFB6
	ldr r0, _0801E024 @ =gFlags
	ldr r1, [r0]
	movs r2, #1
	orrs r1, r2
	str r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFE0: .4byte gDispCnt
_0801DFE4: .4byte 0x00001141
_0801DFE8: .4byte gUnknown_03004D80
_0801DFEC: .4byte gUnknown_03002280
_0801DFF0: .4byte gUnknown_030058D0
_0801DFF4: .4byte gBgCntRegs
_0801DFF8: .4byte 0x00001A89
_0801DFFC: .4byte gUnknown_080D5864
_0801E000: .4byte 0x00000177
_0801E004: .4byte 0x06008000
_0801E008: .4byte 0x0600D000
_0801E00C: .4byte 0x00001E07
_0801E010: .4byte 0x06004000
_0801E014: .4byte 0x0600F000
_0801E018: .4byte gBgScrollRegs
_0801E01C: .4byte gBgPalette
_0801E020: .4byte gUnknown_080D5CC2
_0801E024: .4byte gFlags

	thumb_func_start sub_801E028
sub_801E028: @ 0x0801E028
	push {r4, lr}
	ldr r4, _0801E03C @ =gCamera
	ldr r0, [r4, #0x5c]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E03C: .4byte gCamera

	thumb_func_start sub_801E040
sub_801E040: @ 0x0801E040
	push {r4, lr}
	ldr r1, _0801E090 @ =gCamera
	movs r0, #0
	str r0, [r1, #0x5c]
	ldr r4, _0801E094 @ =gCurrentLevel
	ldr r3, _0801E098 @ =gFlags
	movs r2, #0
	ldr r0, _0801E09C @ =gBgScrollRegs
	movs r1, #3
_0801E052:
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0801E052
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1d
	bne _0801E080
	ldr r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0801E080
	ldr r1, _0801E0A0 @ =gIntrTable
	ldr r0, _0801E0A4 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r3]
_0801E080:
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E090: .4byte gCamera
_0801E094: .4byte gCurrentLevel
_0801E098: .4byte gFlags
_0801E09C: .4byte gBgScrollRegs
_0801E0A0: .4byte gIntrTable
_0801E0A4: .4byte gIntrTableTemplate

	thumb_func_start sub_801E0A8
sub_801E0A8: @ 0x0801E0A8
	push {lr}
	ldr r2, _0801E0E8 @ =gDispCnt
	ldrh r1, [r2]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0801E0EC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0801E0CA
	ldr r0, _0801E0F0 @ =0x0000F7FF
	ands r1, r0
	strh r1, [r2]
_0801E0CA:
	ldr r0, _0801E0F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801E0DA
	ldrh r1, [r2]
	ldr r0, _0801E0F8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
_0801E0DA:
	ldr r0, _0801E0FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801E100 @ =sub_801E104
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0801E0E8: .4byte gDispCnt
_0801E0EC: .4byte gCurrentLevel
_0801E0F0: .4byte 0x0000F7FF
_0801E0F4: .4byte gGameMode
_0801E0F8: .4byte 0x0000DFFF
_0801E0FC: .4byte gCurTask
_0801E100: .4byte sub_801E104

	thumb_func_start sub_801E104
sub_801E104: @ 0x0801E104
	push {lr}
	bl sub_801C394
	ldr r1, _0801E114 @ =gUnknown_030054B8
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E114: .4byte gUnknown_030054B8

	thumb_func_start sub_801E118
sub_801E118: @ 0x0801E118
	ldr r1, _0801E128 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0801E128: .4byte gBgScrollRegs
_0801E12C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start nullsub_8002A34_1
nullsub_8002A34_1: @ 0x0801E130
	bx lr
	.align 2, 0

	thumb_func_start sub_801E134
sub_801E134: @ 0x0801E134
	push {lr}
	ldr r3, _0801E184 @ =gCamera
	ldr r0, _0801E188 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E18C @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E14C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E14C:
	ldr r2, _0801E190 @ =gBgScrollRegs
	ldr r0, [r1]
	adds r0, #4
	lsrs r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r3, #4]
	asrs r0, r0, #9
	strh r0, [r2, #2]
	ldr r3, _0801E194 @ =gHBlankCallbacks
	ldr r2, _0801E198 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E19C @ =sub_801E434
	str r1, [r0]
	ldr r2, _0801E1A0 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E184: .4byte gCamera
_0801E188: .4byte gPlayer
_0801E18C: .4byte gUnknown_03005590
_0801E190: .4byte gBgScrollRegs
_0801E194: .4byte gHBlankCallbacks
_0801E198: .4byte gNumHBlankCallbacks
_0801E19C: .4byte sub_801E434
_0801E1A0: .4byte gFlags

	thumb_func_start sub_801E1A4
sub_801E1A4: @ 0x0801E1A4
	push {lr}
	ldr r0, _0801E1C8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E1CC @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E1BA
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E1BA:
	ldr r0, [r1]
	movs r1, #0xfa
	lsls r1, r1, #4
	bl sub_801C94C
	pop {r0}
	bx r0
	.align 2, 0
_0801E1C8: .4byte gPlayer
_0801E1CC: .4byte gUnknown_03005590

	thumb_func_start sub_801E1D0
sub_801E1D0: @ 0x0801E1D0
	ldr r1, _0801E1E0 @ =gBgScrollRegs
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #0xe]
	strh r0, [r1]
	strh r0, [r1, #0xc]
	bx lr
	.align 2, 0
_0801E1E0: .4byte gBgScrollRegs

	thumb_func_start sub_801E1E4
sub_801E1E4: @ 0x0801E1E4
	ldr r2, _0801E218 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801E21C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0801E220 @ =gBgScrollRegs
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0801E224 @ =gHBlankCallbacks
	ldr r2, _0801E228 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E22C @ =sub_801E498
	str r1, [r0]
	ldr r2, _0801E230 @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0801E218: .4byte gDispCnt
_0801E21C: .4byte 0x0000FDFF
_0801E220: .4byte gBgScrollRegs
_0801E224: .4byte gHBlankCallbacks
_0801E228: .4byte gNumHBlankCallbacks
_0801E22C: .4byte sub_801E498
_0801E230: .4byte gFlags

	thumb_func_start sub_801E234
sub_801E234: @ 0x0801E234
	ldr r2, _0801E260 @ =gBgCntRegs
	ldrh r1, [r2]
	movs r0, #3
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2, #6]
	ldr r0, _0801E264 @ =0x0000FFFC
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2, #6]
	ldr r1, _0801E268 @ =gBgScrollRegs
	ldrh r0, [r1]
	subs r0, #2
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_0801E260: .4byte gBgCntRegs
_0801E264: .4byte 0x0000FFFC
_0801E268: .4byte gBgScrollRegs

	thumb_func_start sub_801E26C
sub_801E26C: @ 0x0801E26C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r7, r1, #0
	ldr r0, _0801E2C0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r4, #0
	movs r2, #0
	ldr r5, _0801E2C4 @ =gUnknown_080D5CA2
	lsls r1, r1, #4
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r3, r0
	blt _0801E2B2
	adds r6, r5, #0
	movs r5, #1
_0801E298:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bhi _0801E2B2
	lsls r0, r2, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r3, r0
	bge _0801E298
	adds r4, r5, #0
	ands r4, r2
_0801E2B2:
	cmp r4, #0
	bne _0801E2C8
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801D9D4
	b _0801E2D0
	.align 2, 0
_0801E2C0: .4byte gCurrentLevel
_0801E2C4: .4byte gUnknown_080D5CA2
_0801E2C8:
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801DD7C
_0801E2D0:
	ldr r0, _0801E2DC @ =gPlayer
	adds r0, #0xa8
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E2DC: .4byte gPlayer

	thumb_func_start sub_801E2E0
sub_801E2E0: @ 0x0801E2E0
	push {lr}
	ldr r0, _0801E304 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	ldr r1, _0801E308 @ =gUnknown_03005590
	cmp r0, #0
	beq _0801E2F6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E2F6:
	ldr r0, [r1]
	ldr r1, _0801E30C @ =0x000003B1
	bl sub_801D9D4
	pop {r0}
	bx r0
	.align 2, 0
_0801E304: .4byte gPlayer
_0801E308: .4byte gUnknown_03005590
_0801E30C: .4byte 0x000003B1

	thumb_func_start sub_801E310
sub_801E310: @ 0x0801E310
	push {lr}
	ldr r0, _0801E348 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801E326
	ldr r1, _0801E34C @ =gUnknown_03005590
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
_0801E326:
	ldr r3, _0801E350 @ =gHBlankCallbacks
	ldr r2, _0801E354 @ =gNumHBlankCallbacks
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _0801E358 @ =sub_801E4C4
	str r1, [r0]
	ldr r2, _0801E35C @ =gFlags
	ldr r0, [r2]
	movs r1, #8
	orrs r0, r1
	str r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0801E348: .4byte gPlayer
_0801E34C: .4byte gUnknown_03005590
_0801E350: .4byte gHBlankCallbacks
_0801E354: .4byte gNumHBlankCallbacks
_0801E358: .4byte sub_801E4C4
_0801E35C: .4byte gFlags

	thumb_func_start sub_801E360
sub_801E360: @ 0x0801E360
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r0, _0801E3CC @ =gUnknown_03005B4C
	ldr r0, [r0]
	cmp r0, #0
	beq _0801E37A
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	movs r1, #1
	ands r1, r0
_0801E37A:
	cmp r1, #0
	beq _0801E3C4
	ldr r2, _0801E3D0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801E3D4 @ =gUnknown_03002878
	ldr r0, _0801E3D8 @ =0x04000014
	str r0, [r1]
	ldr r1, _0801E3DC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801E3E0 @ =gUnknown_03001884
	ldr r3, [r0]
	movs r2, #0
	ldr r6, _0801E3E4 @ =gSineTable
	ldr r5, _0801E3E8 @ =gUnknown_03005590
	ldr r4, _0801E3EC @ =0x000003FF
_0801E3A0:
	ldr r1, [r5]
	adds r1, r2, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	strh r0, [r3]
	adds r3, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x9e
	bls _0801E3A0
_0801E3C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E3CC: .4byte gUnknown_03005B4C
_0801E3D0: .4byte gFlags
_0801E3D4: .4byte gUnknown_03002878
_0801E3D8: .4byte 0x04000014
_0801E3DC: .4byte gUnknown_03002A80
_0801E3E0: .4byte gUnknown_03001884
_0801E3E4: .4byte gSineTable
_0801E3E8: .4byte gUnknown_03005590
_0801E3EC: .4byte 0x000003FF

	thumb_func_start sub_801E3F0
sub_801E3F0: @ 0x0801E3F0
	push {lr}
	ldr r3, _0801E420 @ =gCamera
	ldr r0, _0801E424 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801E41A
	ldr r2, _0801E428 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801E42C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801E430 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r0, r1
	lsrs r0, r0, #0x10
	subs r0, #8
	str r0, [r3, #0x1c]
_0801E41A:
	pop {r0}
	bx r0
	.align 2, 0
_0801E420: .4byte gCamera
_0801E424: .4byte gUnknown_03005590
_0801E428: .4byte gPseudoRandom
_0801E42C: .4byte 0x00196225
_0801E430: .4byte 0x3C6EF35F

	thumb_func_start sub_801E434
sub_801E434: @ 0x0801E434
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x49
	bne _0801E448
	ldr r1, _0801E44C @ =0x0400001C
	ldr r0, _0801E450 @ =gUnknown_03005590
	ldr r0, [r0]
	lsrs r0, r0, #4
	strh r0, [r1]
_0801E448:
	pop {r0}
	bx r0
	.align 2, 0
_0801E44C: .4byte 0x0400001C
_0801E450: .4byte gUnknown_03005590

	thumb_func_start sub_801E454
sub_801E454: @ 0x0801E454
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0801E482
	ldr r0, _0801E488 @ =gUnknown_030022AC
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r1, r0, r1
	subs r0, r1, #2
	ldrh r2, [r1, #2]
	ldrh r0, [r0]
	cmp r2, r0
	beq _0801E474
	ldr r0, _0801E48C @ =0x0400001C
	strh r2, [r0]
_0801E474:
	subs r0, r1, #4
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0801E482
	ldr r0, _0801E490 @ =0x04000010
	strh r1, [r0]
_0801E482:
	pop {r0}
	bx r0
	.align 2, 0
_0801E488: .4byte gUnknown_030022AC
_0801E48C: .4byte 0x0400001C
_0801E490: .4byte 0x04000010

	thumb_func_start sub_801E494
sub_801E494: @ 0x0801E494
	bx lr
	.align 2, 0

	thumb_func_start sub_801E498
sub_801E498: @ 0x0801E498
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x69
	bls _0801E4B4
	ldr r3, _0801E4B8 @ =0x0400001C
	ldr r2, _0801E4BC @ =gUnknown_03005490
	ldr r0, _0801E4C0 @ =gUnknown_080D5B50
	adds r0, r1, r0
	ldrb r1, [r0]
	subs r1, #1
	ldr r0, [r2]
	lsrs r0, r1
	strh r0, [r3]
_0801E4B4:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4B8: .4byte 0x0400001C
_0801E4BC: .4byte gUnknown_03005490
_0801E4C0: .4byte gUnknown_080D5B50

	thumb_func_start sub_801E4C4
sub_801E4C4: @ 0x0801E4C4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x58
	bne _0801E4D6
	ldr r0, _0801E4DC @ =0x0400001C
	ldr r1, _0801E4E0 @ =gUnknown_03005590
	ldrb r1, [r1]
	strh r1, [r0]
_0801E4D6:
	pop {r0}
	bx r0
	.align 2, 0
_0801E4DC: .4byte 0x0400001C
_0801E4E0: .4byte gUnknown_03005590

	thumb_func_start sub_801E4E4
sub_801E4E4: @ 0x0801E4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r7, [sp, #0x28]
	cmp r7, #0
	bne _0801E500
	mov r7, sp
_0801E500:
	mov r4, sp
	adds r4, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E5DA
	mov r1, r8
	adds r0, r6, r1
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E59C
	mov r5, r8
	lsls r5, r5, #1
	adds r0, r6, r5
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E55C
	mov r0, r8
	cmp r0, #0
	ble _0801E554
	movs r0, #7
	ands r0, r6
	movs r1, #0x18
	subs r0, r1, r0
	b _0801E6C4
_0801E554:
	movs r0, #7
	ands r0, r6
	adds r0, #0x11
	b _0801E6C4
_0801E55C:
	cmp r1, #8
	bne _0801E57C
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, r8
	cmp r1, #0
	ble _0801E574
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0801E6C4
_0801E574:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0801E6C4
_0801E57C:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E592
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0801E6C4
_0801E592:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0801E6C4
_0801E59C:
	cmp r1, #8
	bne _0801E5BA
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0801E5B4
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0801E6C4
_0801E5B4:
	movs r0, #7
	ands r0, r6
	b _0801E6C4
_0801E5BA:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E5D0
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0801E6C4
_0801E5D0:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0801E6C4
_0801E5DA:
	cmp r1, #8
	bne _0801E6AC
	ldrb r0, [r4]
	strb r0, [r7]
	mov r0, r8
	rsbs r0, r0, #0
	str r0, [sp, #4]
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E672
	ldrb r0, [r4]
	strb r0, [r7]
	ldr r0, [sp, #4]
	mov r1, r8
	subs r0, r0, r1
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl _call_via_r5
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E634
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0801E62C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x10
	b _0801E6C4
_0801E62C:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0801E6C4
_0801E634:
	cmp r1, #0
	bne _0801E652
	mov r0, r8
	cmp r0, #0
	ble _0801E64A
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801E6C4
_0801E64A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801E6C4
_0801E652:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E668
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0801E6C4
_0801E668:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801E6C4
_0801E672:
	cmp r1, #0
	bne _0801E68C
	mov r1, r8
	cmp r1, #0
	ble _0801E684
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0801E6C4
_0801E684:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0801E6C4
_0801E68C:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6A2
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0801E6C4
_0801E6A2:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0801E6C4
_0801E6AC:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0801E6BE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0801E6C4
_0801E6BE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0801E6C4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801E6D4
sub_801E6D4: @ 0x0801E6D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0801E6F2
	mov r1, sp
	str r1, [sp, #0x24]
_0801E6F2:
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r4, [sp, #0x28]
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E70C
	b _0801E8E0
_0801E70C:
	mov r7, r8
	adds r0, r6, r7
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r4
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E722
	b _0801E89E
_0801E722:
	lsls r4, r7, #1
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	beq _0801E73A
	b _0801E85A
_0801E73A:
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E816
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E7D2
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801E78E
	mov r0, r8
	cmp r0, #0
	ble _0801E786
	movs r0, #7
	ands r0, r6
	movs r1, #0x30
	subs r0, r1, r0
	b _0801EB34
_0801E786:
	movs r0, #7
	ands r0, r6
	adds r0, #0x29
	b _0801EB34
_0801E78E:
	cmp r1, #8
	bne _0801E7B0
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	cmp r2, #0
	ble _0801E7A8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x28
	b _0801EB34
_0801E7A8:
	movs r0, #7
	ands r0, r6
	adds r0, #0x20
	b _0801EB34
_0801E7B0:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	cmp r1, #0
	ble _0801E7C8
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x28
	b _0801EB34
_0801E7C8:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x28
	b _0801EB34
_0801E7D2:
	cmp r1, #8
	bne _0801E7F4
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	cmp r0, #0
	ble _0801E7EC
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x20
	b _0801EB34
_0801E7EC:
	movs r0, #7
	ands r0, r6
	adds r0, #0x18
	b _0801EB34
_0801E7F4:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E80C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x20
	b _0801EB34
_0801E80C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x20
	b _0801EB34
_0801E816:
	cmp r1, #8
	bne _0801E838
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E830
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x18
	b _0801EB34
_0801E830:
	movs r0, #7
	ands r0, r6
	adds r0, #0x10
	b _0801EB34
_0801E838:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E850
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x18
	b _0801EB34
_0801E850:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x18
	b _0801EB34
_0801E85A:
	cmp r1, #8
	bne _0801E87C
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E874
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0801EB34
_0801E874:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0801EB34
_0801E87C:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E894
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0801EB34
_0801E894:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0801EB34
_0801E89E:
	cmp r1, #8
	bne _0801E8BE
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E8B8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0801EB34
_0801E8B8:
	movs r0, #7
	ands r0, r6
	b _0801EB34
_0801E8BE:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E8D6
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0801EB34
_0801E8D6:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0801EB34
_0801E8E0:
	cmp r1, #8
	beq _0801E8E6
	b _0801EB1A
_0801E8E6:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	rsbs r4, r7, #0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E906
	b _0801EADE
_0801E906:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E924
	b _0801EAB8
_0801E924:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	beq _0801E944
	b _0801EA78
_0801E944:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801EA38
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E9F8
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #8
	bne _0801E9B8
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0801E9B0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x28
	b _0801EB34
_0801E9B0:
	movs r0, #7
	ands r0, r6
	subs r0, #0x30
	b _0801EB34
_0801E9B8:
	cmp r1, #0
	bne _0801E9D6
	mov r0, r8
	cmp r0, #0
	ble _0801E9CE
	movs r0, #7
	ands r0, r6
	movs r1, #0x21
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801E9CE:
	movs r0, #7
	ands r0, r6
	subs r0, #0x28
	b _0801EB34
_0801E9D6:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801E9EE
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x28
	b _0801EB34
_0801E9EE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x28
	b _0801EB34
_0801E9F8:
	cmp r1, #0
	bne _0801EA16
	mov r4, r8
	cmp r4, #0
	ble _0801EA0E
	movs r0, #7
	ands r0, r6
	movs r1, #0x19
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA0E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x20
	b _0801EB34
_0801EA16:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EA2E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x20
	b _0801EB34
_0801EA2E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x20
	b _0801EB34
_0801EA38:
	cmp r1, #0
	bne _0801EA56
	mov r0, r8
	cmp r0, #0
	ble _0801EA4E
	movs r0, #7
	ands r0, r6
	movs r1, #0x11
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA4E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0801EB34
_0801EA56:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801EA6E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x18
	b _0801EB34
_0801EA6E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x18
	b _0801EB34
_0801EA78:
	cmp r1, #0
	bne _0801EA96
	mov r4, r8
	cmp r4, #0
	ble _0801EA8E
_0801EA82:
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0801EB34
_0801EA8E:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801EB34
_0801EA96:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EAAE
_0801EAA0:
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0801EB34
_0801EAAE:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801EB34
_0801EAB8:
	cmp r1, #0
	bne _0801EACA
	mov r0, r8
	cmp r0, #0
	bgt _0801EA82
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0801EB34
_0801EACA:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	bgt _0801EAA0
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0801EB34
_0801EADE:
	cmp r1, #0
	bne _0801EAF8
	mov r4, r8
	cmp r4, #0
	ble _0801EAF0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0801EB34
_0801EAF0:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0801EB34
_0801EAF8:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0801EB10
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0801EB34
_0801EB10:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0801EB34
_0801EB1A:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0801EB2E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0801EB34
_0801EB2E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0801EB34:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801EB44
sub_801EB44: @ 0x0801EB44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	blt _0801EB6C
	ldr r0, _0801EB68 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0801EB6E
	adds r0, r1, #0
	b _0801EB6E
	.align 2, 0
_0801EB68: .4byte gUnknown_030059C8
_0801EB6C:
	movs r0, #0
_0801EB6E:
	adds r3, r0, #0
	cmp r4, #0
	blt _0801EB8C
	ldr r0, _0801EB88 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r4, #0
	cmp r1, r0
	bls _0801EB8E
	adds r1, r0, #0
	b _0801EB8E
	.align 2, 0
_0801EB88: .4byte gUnknown_030059C8
_0801EB8C:
	movs r1, #0
_0801EB8E:
	adds r4, r1, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r3, #0
	bl sub_801EF94
	adds r5, r0, #0
	ldr r3, _0801EC24 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0801EBB6
	subs r2, r6, r2
_0801EBB6:
	ldr r0, _0801EC28 @ =gUnknown_030059C8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #0xf
	ands r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0801EBD8
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r2, r0
_0801EBD8:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0801EBE2
	movs r2, #8
_0801EBE2:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0801EC04
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EC04
	movs r2, #0
_0801EC04:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0801EC30
	cmp r2, #8
	beq _0801EC2C
	cmp r2, #0
	beq _0801EC2C
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0801EC2E
	subs r0, #0x10
	b _0801EC2E
	.align 2, 0
_0801EC24: .4byte 0x000003FF
_0801EC28: .4byte gUnknown_030059C8
_0801EC2C:
	adds r0, r2, #0
_0801EC2E:
	adds r2, r0, #0
_0801EC30:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801EC3C
sub_801EC3C: @ 0x0801EC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r4, #0
	blt _0801EC64
	ldr r0, _0801EC60 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801EC66
	adds r0, r1, #0
	b _0801EC66
	.align 2, 0
_0801EC60: .4byte gUnknown_030059C8
_0801EC64:
	movs r0, #0
_0801EC66:
	adds r4, r0, #0
	cmp r3, #0
	blt _0801EC84
	ldr r0, _0801EC80 @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0801EC86
	adds r0, r1, #0
	b _0801EC86
	.align 2, 0
_0801EC80: .4byte gUnknown_030059C8
_0801EC84:
	movs r0, #0
_0801EC86:
	adds r3, r0, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_801EF94
	adds r5, r0, #0
	ldr r3, _0801ED0C @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0801ECB0
	subs r2, r6, r2
_0801ECB0:
	ldr r0, _0801ED10 @ =gUnknown_030059C8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	asrs r2, r2, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0801ECCC
	movs r2, #8
_0801ECCC:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0801ECEE
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801ECEE
	movs r2, #0
_0801ECEE:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0801ED18
	cmp r2, #8
	beq _0801ED14
	cmp r2, #0
	beq _0801ED14
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0801ED16
	subs r0, #0x10
	b _0801ED16
	.align 2, 0
_0801ED0C: .4byte 0x000003FF
_0801ED10: .4byte gUnknown_030059C8
_0801ED14:
	adds r0, r2, #0
_0801ED16:
	adds r2, r0, #0
_0801ED18:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_801ED24
sub_801ED24: @ 0x0801ED24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r4, #0
	blt _0801ED50
	ldr r0, _0801ED4C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801ED52
	adds r0, r1, #0
	b _0801ED52
	.align 2, 0
_0801ED4C: .4byte gUnknown_030059C8
_0801ED50:
	movs r0, #0
_0801ED52:
	adds r4, r0, #0
	cmp r5, #0
	blt _0801ED70
	ldr r0, _0801ED6C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r5, #0
	cmp r1, r0
	bls _0801ED72
	adds r1, r0, #0
	b _0801ED72
	.align 2, 0
_0801ED6C: .4byte gUnknown_030059C8
_0801ED70:
	movs r1, #0
_0801ED72:
	adds r5, r1, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r4, #0
	bl sub_801EF94
	adds r4, r0, #0
	ldr r6, _0801EE0C @ =0x000003FF
	ands r6, r4
	movs r7, #7
	adds r3, r7, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801ED9A
	subs r3, r7, r3
_0801ED9A:
	ldr r2, _0801EE10 @ =gUnknown_030059C8
	ldr r5, [r2]
	lsls r0, r6, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r0, #0xf
	ands r3, r0
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0801EDBC
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r3, r0
_0801EDBC:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801EDC6
	movs r3, #8
_0801EDC6:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EDEC
	lsrs r0, r6, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r7
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0801EDEC
	movs r3, #0
_0801EDEC:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EE18
	cmp r3, #8
	beq _0801EE14
	cmp r3, #0
	beq _0801EE14
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0801EE16
	subs r0, #0x10
	b _0801EE16
	.align 2, 0
_0801EE0C: .4byte 0x000003FF
_0801EE10: .4byte gUnknown_030059C8
_0801EE14:
	adds r0, r3, #0
_0801EE16:
	adds r3, r0, #0
_0801EE18:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EE34
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0801EE34:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EE4E
	cmp r3, #0
	beq _0801EE4A
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801EE4C
_0801EE4A:
	adds r0, r2, #0
_0801EE4C:
	adds r2, r0, #0
_0801EE4E:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801EE64
sub_801EE64: @ 0x0801EE64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r5, #0
	blt _0801EE90
	ldr r0, _0801EE8C @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	bls _0801EE92
	adds r0, r1, #0
	b _0801EE92
	.align 2, 0
_0801EE8C: .4byte gUnknown_030059C8
_0801EE90:
	movs r0, #0
_0801EE92:
	adds r5, r0, #0
	cmp r4, #0
	blt _0801EEB0
	ldr r0, _0801EEAC @ =gUnknown_030059C8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0801EEB2
	adds r0, r1, #0
	b _0801EEB2
	.align 2, 0
_0801EEAC: .4byte gUnknown_030059C8
_0801EEB0:
	movs r0, #0
_0801EEB2:
	adds r4, r0, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801EF94
	adds r4, r0, #0
	ldr r7, _0801EF3C @ =0x000003FF
	ands r7, r4
	movs r6, #7
	adds r3, r6, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EEDC
	subs r3, r6, r3
_0801EEDC:
	ldr r2, _0801EF40 @ =gUnknown_030059C8
	ldr r5, [r2]
	lsls r0, r7, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	asrs r3, r3, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0801EEF8
	movs r3, #8
_0801EEF8:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0801EF1E
	lsrs r0, r7, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r6
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0801EF1E
	movs r3, #0
_0801EF1E:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EF48
	cmp r3, #8
	beq _0801EF44
	cmp r3, #0
	beq _0801EF44
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0801EF46
	subs r0, #0x10
	b _0801EF46
	.align 2, 0
_0801EF3C: .4byte 0x000003FF
_0801EF40: .4byte gUnknown_030059C8
_0801EF44:
	adds r0, r3, #0
_0801EF46:
	adds r3, r0, #0
_0801EF48:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r7
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0801EF60
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0801EF60:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0801EF7E
	cmp r3, #0
	beq _0801EF7A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0801EF7C
_0801EF7A:
	adds r0, r2, #0
_0801EF7C:
	adds r2, r0, #0
_0801EF7E:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801EF94
sub_801EF94: @ 0x0801EF94
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	mov sb, r2
	asrs r4, r0, #3
	ldr r5, _0801EFB0 @ =IWRAM_START + 0x410
	ldr r0, [r5]
	cmp r0, r4
	bne _0801EFB4
	ldr r7, [r5, #8]
	ldr r0, [r5, #4]
	b _0801EFCC
	.align 2, 0
_0801EFB0: .4byte IWRAM_START + 0x410
_0801EFB4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	str r4, [r5]
	str r0, [r5, #4]
	str r1, [r5, #8]
	adds r7, r1, #0
_0801EFCC:
	mov r8, r0
	asrs r4, r6, #3
	ldr r6, _0801EFE0 @ =IWRAM_START + 0x420
	ldr r0, [r6]
	cmp r0, r4
	bne _0801EFE4
	ldr r5, [r6, #8]
	ldr r3, [r6, #4]
	b _0801EFFE
	.align 2, 0
_0801EFE0: .4byte IWRAM_START + 0x420
_0801EFE4:
	adds r0, r4, #0
	movs r1, #0xc
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	adds r3, r0, #0
	str r4, [r6]
	str r3, [r6, #4]
	str r1, [r6, #8]
	adds r5, r1, #0
_0801EFFE:
	ldr r0, _0801F040 @ =gUnknown_030059C8
	ldr r4, [r0]
	mov r1, sb
	lsls r0, r1, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r1, r1, r0
	ldrh r0, [r4, #0x18]
	muls r0, r3, r0
	add r0, r8
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r1, r5, #3
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r3, r2, #8
	lsls r2, r2, #5
	lsls r1, r1, #1
	ldr r0, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F040: .4byte gUnknown_030059C8

	thumb_func_start sub_801F044
sub_801F044: @ 0x0801F044
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	ldr r0, _0801F06C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _0801F070 @ =IWRAM_START + 0x410
	str r1, [r0, #4]
	ldr r2, _0801F074 @ =0x85000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _0801F078 @ =IWRAM_START + 0x420
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0801F06C: .4byte 0x040000D4
_0801F070: .4byte IWRAM_START + 0x410
_0801F074: .4byte 0x85000003
_0801F078: .4byte IWRAM_START + 0x420

	thumb_func_start sub_801F07C
sub_801F07C: @ 0x0801F07C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r3
	ldr r6, [sp, #0x1c]
	cmp r6, #0
	bne _0801F090
	mov r6, sp
_0801F090:
	mov r4, sp
	adds r4, #1
	adds r0, r5, #0
	adds r3, r4, #0
	ldr r7, [sp, #0x20]
	bl _call_via_r7
	adds r1, r0, #0
	cmp r1, #0
	bne _0801F0BC
	mov r0, r8
	cmp r0, #0
	ble _0801F0B4
	movs r0, #7
	ands r0, r5
	movs r1, #8
	subs r0, r1, r0
	b _0801F0F2
_0801F0B4:
	movs r0, #7
	ands r0, r5
	adds r0, #1
	b _0801F0F2
_0801F0BC:
	cmp r1, #8
	bne _0801F0DA
	ldrb r0, [r4]
	strb r0, [r6]
	mov r7, r8
	cmp r7, #0
	ble _0801F0D2
	movs r0, #7
	ands r0, r5
	mvns r0, r0
	b _0801F0F2
_0801F0D2:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r5
	b _0801F0F2
_0801F0DA:
	ldrb r0, [r4]
	strb r0, [r6]
	cmp r1, #0
	ble _0801F0EC
	subs r1, #1
	movs r0, #7
	ands r0, r5
	subs r0, r1, r0
	b _0801F0F2
_0801F0EC:
	movs r0, #7
	ands r0, r5
	adds r0, r1, r0
_0801F0F2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801F100
sub_801F100: @ 0x0801F100
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r3, [sp, #0xc]
	bl _call_via_r3
	adds r1, r0, #0
	cmp r1, #0
	bne _0801F128
	cmp r5, #0
	ble _0801F120
	movs r0, #7
	ands r0, r4
	movs r1, #8
	subs r0, r1, r0
	b _0801F154
_0801F120:
	movs r0, #7
	ands r0, r4
	adds r0, #1
	b _0801F154
_0801F128:
	cmp r1, #8
	bne _0801F140
	cmp r5, #0
	ble _0801F138
	movs r0, #7
	ands r0, r4
	mvns r0, r0
	b _0801F154
_0801F138:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r4
	b _0801F154
_0801F140:
	cmp r1, #0
	ble _0801F14E
	subs r1, #1
	movs r0, #7
	ands r0, r4
	subs r0, r1, r0
	b _0801F154
_0801F14E:
	movs r0, #7
	ands r0, r4
	adds r0, r1, r0
_0801F154:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_801F15C
sub_801F15C: @ 0x0801F15C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	mov sb, r2
	mov sl, r3
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r2, _0801F1FC @ =0x00004001
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r6, r1
	ldr r2, _0801F200 @ =IWRAM_START + 0x1C
	adds r2, r2, r6
	mov r8, r2
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r1, #4]
	movs r4, #0
	movs r2, #0
	mov r3, sb
	strh r3, [r1, #0x14]
	mov r3, sl
	strb r3, [r1, #0x1a]
	strh r2, [r1, #0x16]
	strh r2, [r1, #0x18]
	mov r1, r8
	str r2, [r1, #4]
	strh r2, [r1, #8]
	strh r2, [r1, #0xa]
	ldr r3, _0801F204 @ =IWRAM_START + 0x3C
	adds r1, r6, r3
	strb r4, [r1]
	ldr r1, _0801F208 @ =IWRAM_START + 0x3D
	adds r3, r6, r1
	movs r1, #0xff
	strb r1, [r3]
	mov r3, r8
	strh r2, [r3, #0x1a]
	strh r2, [r3, #0x1c]
	ldr r1, _0801F20C @ =IWRAM_START + 0x3E
	adds r3, r6, r1
	movs r1, #0x10
	strb r1, [r3]
	ldr r3, _0801F210 @ =IWRAM_START + 0x41
	adds r6, r6, r3
	strb r4, [r6]
	mov r1, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F1FC: .4byte 0x00004001
_0801F200: .4byte IWRAM_START + 0x1C
_0801F204: .4byte IWRAM_START + 0x3C
_0801F208: .4byte IWRAM_START + 0x3D
_0801F20C: .4byte IWRAM_START + 0x3E
_0801F210: .4byte IWRAM_START + 0x41

	thumb_func_start sub_801F214
sub_801F214: @ 0x0801F214
	push {r4, r5, r6, lr}
	ldr r2, _0801F25C @ =gCurTask
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x1c
	adds r5, r1, r0
	ldr r3, _0801F260 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _0801F254
	ldrh r1, [r4, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801F264
	adds r1, r3, #0
	adds r1, #0x68
	ldrh r0, [r4, #0x16]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801F254
	adds r1, r3, #0
	adds r1, #0x6a
	ldrh r0, [r4, #0x18]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0801F264
_0801F254:
	adds r0, r6, #0
	bl TaskDestroy
	b _0801F398
	.align 2, 0
_0801F25C: .4byte gCurTask
_0801F260: .4byte gPlayer
_0801F264:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F278
	ldr r0, [r2]
	bl TaskDestroy
	b _0801F398
_0801F278:
	ldrh r1, [r4, #0x14]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	beq _0801F310
	cmp r0, #1
	bgt _0801F28C
	cmp r0, #0
	beq _0801F292
	b _0801F334
_0801F28C:
	cmp r0, #2
	beq _0801F32C
	b _0801F334
_0801F292:
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	beq _0801F2EC
	cmp r0, #0x20
	bne _0801F2F4
	ldr r0, _0801F2CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F2E0
	ldr r0, _0801F2D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldr r1, _0801F2D4 @ =gMultiplayerPlayerTasks
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0801F2D8 @ =IWRAM_START + 0x50
	adds r1, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r4]
	ldr r1, _0801F2DC @ =IWRAM_START + 0x52
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0801F2F2
	.align 2, 0
_0801F2CC: .4byte gGameMode
_0801F2D0: .4byte 0x04000128
_0801F2D4: .4byte gMultiplayerPlayerTasks
_0801F2D8: .4byte IWRAM_START + 0x50
_0801F2DC: .4byte IWRAM_START + 0x52
_0801F2E0:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	str r0, [r4]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	b _0801F2F2
_0801F2EC:
	ldr r0, _0801F308 @ =gUnknown_03005660
	movs r1, #4
	ldrsh r0, [r0, r1]
_0801F2F2:
	str r0, [r4, #4]
_0801F2F4:
	ldr r2, _0801F30C @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F308: .4byte gUnknown_03005660
_0801F30C: .4byte gCamera
_0801F310:
	ldr r2, _0801F328 @ =gCamera
	ldr r0, [r4]
	adds r1, r2, #0
	adds r1, #0x52
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	adds r2, #0x54
	ldrh r1, [r2]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F328: .4byte gCamera
_0801F32C:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
_0801F332:
	strh r0, [r5, #0x18]
_0801F334:
	ldrh r1, [r4, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801F35A
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F352
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F358
_0801F352:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F37C @ =0xFFFFFBFF
	ands r0, r1
_0801F358:
	str r0, [r5, #0x10]
_0801F35A:
	ldrh r1, [r4, #0x14]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F38C
	ldr r0, _0801F380 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F384
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F38A
	.align 2, 0
_0801F37C: .4byte 0xFFFFFBFF
_0801F380: .4byte gUnknown_03005424
_0801F384:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F3A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F38A:
	str r0, [r5, #0x10]
_0801F38C:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0801F398:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3A0: .4byte 0xFFFFF7FF

	thumb_func_start sub_801F3A4
sub_801F3A4: @ 0x0801F3A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r7, #0x64
	beq _0801F3D6
	cmp r7, #0xc8
	beq _0801F3D6
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F3D6
	adds r0, #0xc8
	cmp r7, r0
	beq _0801F3D6
	movs r0, #0xc8
	lsls r0, r0, #2
	cmp r7, r0
	beq _0801F3D6
	movs r0, #0
	b _0801F474
_0801F3D6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F410 @ =sub_801F214
	str r2, [sp]
	ldr r2, _0801F414 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0
	bl sub_801F15C
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F432
	cmp r7, r0
	bgt _0801F418
	cmp r7, #0x64
	beq _0801F42A
	cmp r7, #0xc8
	beq _0801F42E
	b _0801F43C
	.align 2, 0
_0801F410: .4byte sub_801F214
_0801F414: .4byte sub_801F550
_0801F418:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F436
	movs r0, #0xc8
	lsls r0, r0, #2
	cmp r7, r0
	beq _0801F43A
	b _0801F43C
_0801F42A:
	movs r7, #0
	b _0801F43C
_0801F42E:
	movs r7, #1
	b _0801F43C
_0801F432:
	movs r7, #2
	b _0801F43C
_0801F436:
	movs r7, #3
	b _0801F43C
_0801F43A:
	movs r7, #4
_0801F43C:
	mov r6, r8
	adds r6, #0x1c
	ldr r5, _0801F484 @ =gUnknown_080D6354
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	mov r0, r8
	adds r0, #0x3c
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
_0801F474:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F484: .4byte gUnknown_080D6354

	thumb_func_start sub_801F488
sub_801F488: @ 0x0801F488
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, _0801F52C @ =gPlayer
	ldr r0, _0801F530 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0801F524
	movs r4, #0x17
	ldrsb r4, [r5, r4]
	ldr r0, _0801F534 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801F4AC
	rsbs r4, r4, #0
_0801F4AC:
	ldr r2, _0801F538 @ =gSineTable
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r3, r4, #0
	muls r3, r0, r3
	asrs r3, r3, #8
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r0, r0, r3
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F53C @ =sub_801F214
	str r2, [sp]
	ldr r2, _0801F540 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xc0
	movs r3, #0
	bl sub_801F15C
	ldrh r4, [r0, #6]
	ldr r0, _0801F544 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0x14
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _0801F548 @ =0x00000351
	strh r0, [r5, #0xa]
	ldr r0, _0801F54C @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_0801F524:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F52C: .4byte gPlayer
_0801F530: .4byte gUnknown_03005590
_0801F534: .4byte gUnknown_03005424
_0801F538: .4byte gSineTable
_0801F53C: .4byte sub_801F214
_0801F540: .4byte sub_801F550
_0801F544: .4byte IWRAM_START + 0x1C
_0801F548: .4byte 0x00000351
_0801F54C: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_801F550
sub_801F550: @ 0x0801F550
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _0801F564 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0801F564: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_801F568
sub_801F568: @ 0x0801F568
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F5B8 @ =sub_801F214
	str r2, [sp]
	ldr r2, _0801F5BC @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xc0
	movs r3, #0
	bl sub_801F15C
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	ldr r0, _0801F5C0 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0x14
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _0801F5C4 @ =0x00000351
	strh r0, [r5, #0xa]
	ldr r0, _0801F5C8 @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F5B8: .4byte sub_801F214
_0801F5BC: .4byte sub_801F550
_0801F5C0: .4byte IWRAM_START + 0x1C
_0801F5C4: .4byte 0x00000351
_0801F5C8: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_801F5CC
sub_801F5CC: @ 0x0801F5CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r1, _0801F5F0 @ =gUnknown_030059D0
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0801F5EC
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0801F5F4
_0801F5EC:
	movs r0, #0
	b _0801F6BE
	.align 2, 0
_0801F5F0: .4byte gUnknown_030059D0
_0801F5F4:
	subs r0, r2, #1
	movs r4, #0
	strb r0, [r1]
	ldr r0, _0801F650 @ =sub_801F6E0
	ldr r2, _0801F654 @ =0x00004001
	ldr r1, _0801F658 @ =sub_801F7B8
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	movs r1, #0
	mov r8, r1
	strh r6, [r0]
	strh r7, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0801F65C @ =IWRAM_START + 0x8
	adds r4, r5, r0
	ldr r0, _0801F660 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801F668
	movs r0, #0xf
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xda
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _0801F664 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #6
	b _0801F696
	.align 2, 0
_0801F650: .4byte sub_801F6E0
_0801F654: .4byte 0x00004001
_0801F658: .4byte sub_801F7B8
_0801F65C: .4byte IWRAM_START + 0x8
_0801F660: .4byte gPlayer
_0801F664: .4byte IWRAM_START + 0x28
_0801F668:
	ldr r0, _0801F6CC @ =0x06012300
	str r0, [r4, #4]
	movs r0, #0xd4
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _0801F6D0 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r4, #0x10]
	ldr r2, _0801F6D4 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801F6D8 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801F6DC @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #4
	ands r0, r1
	orrs r0, r3
_0801F696:
	str r0, [r4, #0x10]
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #8]
	adds r3, r4, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	mov r0, sb
_0801F6BE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F6CC: .4byte 0x06012300
_0801F6D0: .4byte IWRAM_START + 0x28
_0801F6D4: .4byte gPseudoRandom
_0801F6D8: .4byte 0x00196225
_0801F6DC: .4byte 0x3C6EF35F

	thumb_func_start sub_801F6E0
sub_801F6E0: @ 0x0801F6E0
	push {r4, r5, lr}
	ldr r2, _0801F714 @ =gUnknown_030059D0
	ldr r0, _0801F718 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #8
	adds r5, r1, r0
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0801F706
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F71C
_0801F706:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r3, #0
	bl TaskDestroy
	b _0801F74A
	.align 2, 0
_0801F714: .4byte gUnknown_030059D0
_0801F718: .4byte gCurTask
_0801F71C:
	ldr r2, _0801F750 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #2]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #6]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
_0801F74A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F750: .4byte gCamera

	thumb_func_start sub_801F754
sub_801F754: @ 0x0801F754
	push {r4, lr}
	sub sp, #4
	ldr r4, _0801F780 @ =gUnknown_030059D0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0801F778
	ldr r0, _0801F784 @ =sub_801F7B4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _0801F788 @ =sub_801F7A8
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r0, [r4, #4]
	movs r0, #0x14
	strb r0, [r4]
_0801F778:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F780: .4byte gUnknown_030059D0
_0801F784: .4byte sub_801F7B4
_0801F788: .4byte sub_801F7A8

	thumb_func_start sub_801F78C
sub_801F78C: @ 0x0801F78C
	push {r4, lr}
	ldr r4, _0801F7A4 @ =gUnknown_030059D0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801F79E
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #4]
_0801F79E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F7A4: .4byte gUnknown_030059D0

	thumb_func_start sub_801F7A8
sub_801F7A8: @ 0x0801F7A8
	ldr r1, _0801F7B0 @ =gUnknown_030059D0
	movs r0, #0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_0801F7B0: .4byte gUnknown_030059D0

	thumb_func_start sub_801F7B4
sub_801F7B4: @ 0x0801F7B4
	bx lr
	.align 2, 0

	thumb_func_start sub_801F7B8
sub_801F7B8: @ 0x0801F7B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r0, #0xda
	lsls r0, r0, #2
	cmp r1, r0
	bne _0801F7D6
	ldr r0, [r2, #0xc]
	bl VramFree
_0801F7D6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801F7DC
sub_801F7DC: @ 0x0801F7DC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0801F840 @ =sub_801F860
	ldr r2, _0801F844 @ =0x00004001
	ldr r1, _0801F848 @ =sub_801FAE8
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0x14
	bl VramMalloc
	str r0, [r4, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #8]
	ldr r0, _0801F84C @ =0x0000034E
	strh r0, [r4, #0xa]
	ldr r1, _0801F850 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	strb r3, [r0]
	ldr r0, _0801F854 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	ldr r0, _0801F858 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801F85C @ =IWRAM_START + 0x25
	adds r5, r5, r1
	strb r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F840: .4byte sub_801F860
_0801F844: .4byte 0x00004001
_0801F848: .4byte sub_801FAE8
_0801F84C: .4byte 0x0000034E
_0801F850: .4byte IWRAM_START + 0x20
_0801F854: .4byte IWRAM_START + 0x21
_0801F858: .4byte IWRAM_START + 0x22
_0801F85C: .4byte IWRAM_START + 0x25

	thumb_func_start sub_801F860
sub_801F860: @ 0x0801F860
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801F888 @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F87C
	ldr r0, [r5, #0x20]
	movs r1, #0x90
	lsls r1, r1, #3
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _0801F890
_0801F87C:
	ldr r0, _0801F88C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801F998
	.align 2, 0
_0801F888: .4byte gPlayer
_0801F88C: .4byte gCurTask
_0801F890:
	ldr r3, _0801F908 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	ble _0801F8C2
	movs r1, #0
	ldr r0, _0801F90C @ =0x0000034F
	strh r0, [r4, #0xa]
	ldr r6, _0801F910 @ =IWRAM_START + 0x20
	adds r0, r2, r6
	strb r1, [r0]
	ldr r0, _0801F914 @ =IWRAM_START + 0x21
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, _0801F918 @ =sub_801F9A4
	str r0, [r1, #8]
_0801F8C2:
	ldr r6, _0801F91C @ =gCamera
	movs r3, #0x17
	ldrsb r3, [r5, r3]
	ldr r2, _0801F920 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0801F8D8
	rsbs r3, r3, #0
_0801F8D8:
	ldr r0, _0801F924 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F938
	ldr r1, _0801F928 @ =gMultiplayerPlayerTasks
	ldr r0, _0801F92C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0801F930 @ =IWRAM_START + 0x50
	adds r0, r1, r2
	ldr r2, [r6]
	ldrh r0, [r0]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, _0801F934 @ =IWRAM_START + 0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0801F946
	.align 2, 0
_0801F908: .4byte gCurTask
_0801F90C: .4byte 0x0000034F
_0801F910: .4byte IWRAM_START + 0x20
_0801F914: .4byte IWRAM_START + 0x21
_0801F918: .4byte sub_801F9A4
_0801F91C: .4byte gCamera
_0801F920: .4byte gUnknown_03005424
_0801F924: .4byte gGameMode
_0801F928: .4byte gMultiplayerPlayerTasks
_0801F92C: .4byte 0x04000128
_0801F930: .4byte IWRAM_START + 0x50
_0801F934: .4byte IWRAM_START + 0x52
_0801F938:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
_0801F946:
	adds r0, r0, r3
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F962
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F968
_0801F962:
	ldr r0, [r4, #0x10]
	ldr r1, _0801F980 @ =0xFFFFFBFF
	ands r0, r1
_0801F968:
	str r0, [r4, #0x10]
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801F984
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F98A
	.align 2, 0
_0801F980: .4byte 0xFFFFFBFF
_0801F984:
	ldr r0, [r4, #0x10]
	ldr r1, _0801F9A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F98A:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801F998:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F9A0: .4byte 0xFFFFF7FF

	thumb_func_start sub_801F9A4
sub_801F9A4: @ 0x0801F9A4
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801F9CC @ =gPlayer
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801F9C0
	ldr r0, [r5, #0x20]
	movs r1, #0x90
	lsls r1, r1, #3
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _0801F9D4
_0801F9C0:
	ldr r0, _0801F9D0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801FADC
	.align 2, 0
_0801F9CC: .4byte gPlayer
_0801F9D0: .4byte gCurTask
_0801F9D4:
	ldr r3, _0801FA4C @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r0, #0x26
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bgt _0801FA06
	movs r1, #0
	ldr r0, _0801FA50 @ =0x0000034E
	strh r0, [r4, #0xa]
	ldr r6, _0801FA54 @ =IWRAM_START + 0x20
	adds r0, r2, r6
	strb r1, [r0]
	ldr r0, _0801FA58 @ =IWRAM_START + 0x21
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, [r3]
	ldr r0, _0801FA5C @ =sub_801F860
	str r0, [r1, #8]
_0801FA06:
	ldr r6, _0801FA60 @ =gCamera
	movs r3, #0x17
	ldrsb r3, [r5, r3]
	ldr r2, _0801FA64 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0801FA1C
	rsbs r3, r3, #0
_0801FA1C:
	ldr r0, _0801FA68 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801FA7C
	ldr r1, _0801FA6C @ =gMultiplayerPlayerTasks
	ldr r0, _0801FA70 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0801FA74 @ =IWRAM_START + 0x50
	adds r0, r1, r2
	ldr r2, [r6]
	ldrh r0, [r0]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, _0801FA78 @ =IWRAM_START + 0x52
	adds r1, r1, r0
	ldrh r0, [r1]
	b _0801FA8A
	.align 2, 0
_0801FA4C: .4byte gCurTask
_0801FA50: .4byte 0x0000034E
_0801FA54: .4byte IWRAM_START + 0x20
_0801FA58: .4byte IWRAM_START + 0x21
_0801FA5C: .4byte sub_801F860
_0801FA60: .4byte gCamera
_0801FA64: .4byte gUnknown_03005424
_0801FA68: .4byte gGameMode
_0801FA6C: .4byte gMultiplayerPlayerTasks
_0801FA70: .4byte 0x04000128
_0801FA74: .4byte IWRAM_START + 0x50
_0801FA78: .4byte IWRAM_START + 0x52
_0801FA7C:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
_0801FA8A:
	adds r0, r0, r3
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801FAA6
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801FAAC
_0801FAA6:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FAC4 @ =0xFFFFFBFF
	ands r0, r1
_0801FAAC:
	str r0, [r4, #0x10]
	ldrh r1, [r7]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801FAC8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801FACE
	.align 2, 0
_0801FAC4: .4byte 0xFFFFFBFF
_0801FAC8:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FAE4 @ =0xFFFFF7FF
	ands r0, r1
_0801FACE:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801FADC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FAE4: .4byte 0xFFFFF7FF

	thumb_func_start sub_801FAE8
sub_801FAE8: @ 0x0801FAE8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_801FAFC
sub_801FAFC: @ 0x0801FAFC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0801FB60 @ =sub_801FB80
	ldr r2, _0801FB64 @ =0x00002001
	ldr r1, _0801FB68 @ =sub_801FC18
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0x14
	bl VramMalloc
	str r0, [r4, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #8]
	ldr r0, _0801FB6C @ =0x00000351
	strh r0, [r4, #0xa]
	ldr r1, _0801FB70 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	strb r3, [r0]
	ldr r0, _0801FB74 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	ldr r0, _0801FB78 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801FB7C @ =IWRAM_START + 0x25
	adds r5, r5, r1
	strb r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801FB60: .4byte sub_801FB80
_0801FB64: .4byte 0x00002001
_0801FB68: .4byte sub_801FC18
_0801FB6C: .4byte 0x00000351
_0801FB70: .4byte IWRAM_START + 0x20
_0801FB74: .4byte IWRAM_START + 0x21
_0801FB78: .4byte IWRAM_START + 0x22
_0801FB7C: .4byte IWRAM_START + 0x25

	thumb_func_start sub_801FB80
sub_801FB80: @ 0x0801FB80
	push {r4, lr}
	ldr r3, _0801FBA4 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801FB9A
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _0801FBAC
_0801FB9A:
	ldr r0, _0801FBA8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801FC0C
	.align 2, 0
_0801FBA4: .4byte gPlayer
_0801FBA8: .4byte gCurTask
_0801FBAC:
	ldr r0, [r3, #0x68]
	cmp r0, #0x37
	bne _0801FC0C
	ldr r0, _0801FBF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _0801FBF4 @ =gCamera
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801FBF8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801FBFE
	.align 2, 0
_0801FBF0: .4byte gCurTask
_0801FBF4: .4byte gCamera
_0801FBF8:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FC14 @ =0xFFFFFBFF
	ands r0, r1
_0801FBFE:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801FC0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC14: .4byte 0xFFFFFBFF

	thumb_func_start sub_801FC18
sub_801FC18: @ 0x0801FC18
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_801FC2C
sub_801FC2C: @ 0x0801FC2C
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _0801FC44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801FC60
	cmp r0, #2
	bhi _0801FC50
	ldr r4, _0801FC48 @ =gUnknown_030059D8
	ldr r0, _0801FC4C @ =sub_8021368
	b _0801FC64
	.align 2, 0
_0801FC44: .4byte gGameMode
_0801FC48: .4byte gUnknown_030059D8
_0801FC4C: .4byte sub_8021368
_0801FC50:
	ldr r4, _0801FC58 @ =gUnknown_030059D8
	ldr r0, _0801FC5C @ =sub_8021388
	b _0801FC64
	.align 2, 0
_0801FC58: .4byte gUnknown_030059D8
_0801FC5C: .4byte sub_8021388
_0801FC60:
	ldr r4, _0801FCF0 @ =gUnknown_030059D8
	ldr r0, _0801FCF4 @ =sub_80213A8
_0801FC64:
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _0801FCF8 @ =0x00002001
	ldr r3, _0801FCFC @ =sub_80213B4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _0801FD00 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	ldr r0, _0801FD04 @ =0x000002D6
	strh r0, [r1, #0xa]
	ldr r2, _0801FD08 @ =IWRAM_START + 0x20
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0801FD0C @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0801FD10 @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _0801FD14 @ =IWRAM_START + 0x25
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _0801FD18 @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _0801FD1C @ =IWRAM_START + 0x2B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _0801FD20 @ =IWRAM_START + 0x2B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _0801FD24 @ =IWRAM_START + 0x2B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _0801FD28 @ =IWRAM_START + 0x30
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _0801FD2C @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _0801FD30 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FCF0: .4byte gUnknown_030059D8
_0801FCF4: .4byte sub_80213A8
_0801FCF8: .4byte 0x00002001
_0801FCFC: .4byte sub_80213B4
_0801FD00: .4byte 0x06011F00
_0801FD04: .4byte 0x000002D6
_0801FD08: .4byte IWRAM_START + 0x20
_0801FD0C: .4byte IWRAM_START + 0x21
_0801FD10: .4byte IWRAM_START + 0x22
_0801FD14: .4byte IWRAM_START + 0x25
_0801FD18: .4byte 0x00042200
_0801FD1C: .4byte IWRAM_START + 0x2B6
_0801FD20: .4byte IWRAM_START + 0x2B4
_0801FD24: .4byte IWRAM_START + 0x2B0
_0801FD28: .4byte IWRAM_START + 0x30
_0801FD2C: .4byte 0x040000D4
_0801FD30: .4byte 0x81000140

	thumb_func_start sub_801FD34
sub_801FD34: @ 0x0801FD34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _0801FDB8 @ =gUnknown_030059D8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0801FDBC @ =IWRAM_START + 0x30
	adds r4, r0, r1
	ldr r6, _0801FDC0 @ =gPlayer
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	bne _0801FD5E
	b _0801FE5A
_0801FD5E:
	cmp r7, #0x20
	ble _0801FD64
	movs r7, #0x20
_0801FD64:
	ldr r0, _0801FDC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801FD72
	cmp r7, #0x10
	ble _0801FD72
	movs r7, #0x10
_0801FD72:
	movs r0, #0x76
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _0801FDC8 @ =gSineTable
	mov sl, r1
	ldr r0, _0801FDCC @ =gPseudoRandom
	mov sb, r0
_0801FD8A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0801FE4E
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _0801FE00
	asrs r2, r3, #8
	cmp r2, #5
	ble _0801FDD0
	rsbs r0, r2, #0
	adds r0, #9
	b _0801FDD2
	.align 2, 0
_0801FDB8: .4byte gUnknown_030059D8
_0801FDBC: .4byte IWRAM_START + 0x30
_0801FDC0: .4byte gPlayer
_0801FDC4: .4byte gGameMode
_0801FDC8: .4byte gSineTable
_0801FDCC: .4byte gPseudoRandom
_0801FDD0:
	adds r0, r2, #0
_0801FDD2:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r1, #0x80
	orrs r3, r1
_0801FE00:
	movs r2, #0
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	ldr r0, _0801FE6C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801FE16
	rsbs r0, r6, #0
	strh r0, [r4, #0xa]
_0801FE16:
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	strh r2, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0801FE70 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801FE74 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _0801FE3A
	movs r0, #4
	strh r0, [r4, #0x10]
_0801FE3A:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _0801FE5A
_0801FE4E:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _0801FD8A
_0801FE5A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE6C: .4byte gUnknown_03005424
_0801FE70: .4byte 0x00196225
_0801FE74: .4byte 0x3C6EF35F

	thumb_func_start sub_801FE78
sub_801FE78: @ 0x0801FE78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0801FFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _0801FFE0 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _0801FFE4 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _0801FFE8 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl sub_8004558
	movs r2, #0x1f
	str r2, [sp, #0x14]
_0801FEB8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0801FEC0
	b _08020180
_0801FEC0:
	movs r4, #8
	ldrsh r0, [r5, r4]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r0, #0xa
	ldrsh r2, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r7, r1, #8
	asrs r0, r0, #8
	mov r8, r0
	ldr r1, _0801FFEC @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	mov r2, r8
	subs r2, r2, r0
	mov sl, r2
	ldr r4, _0801FFF0 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _0801FEFC
	b _08020008
_0801FEFC:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0801FF12
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801FF12
	b _08020008
_0801FF12:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020008
	adds r6, r2, #0
	adds r6, #0x38
	adds r2, r7, #0
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF3E
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _0801FF4A
	cmp r2, r1
	blt _08020008
_0801FF3E:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF4A:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF64
	cmp r8, r1
	bge _0801FF70
	cmp r2, r1
	blt _08020008
_0801FF64:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF70:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	ldr r1, _0801FFF4 @ =gCourseTime
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _0801FFF8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0801FFC4
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0801FFC4
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801FFC4
	ldr r1, _08020000 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0801FFBC
	movs r0, #0xff
_0801FFBC:
	strb r0, [r1]
	ldr r1, _08020004 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0801FFC4:
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801FFD8
	ldr r1, _0801FFF4 @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0801FFD8
	movs r0, #0xff
	strh r0, [r1]
_0801FFD8:
	movs r0, #0
	b _0802017E
	.align 2, 0
_0801FFDC: .4byte gCurTask
_0801FFE0: .4byte IWRAM_START + 0x30
_0801FFE4: .4byte IWRAM_START + 0x2B0
_0801FFE8: .4byte IWRAM_START + 0x2B4
_0801FFEC: .4byte gCamera
_0801FFF0: .4byte gPlayer
_0801FFF4: .4byte gCourseTime
_0801FFF8: .4byte gCurrentLevel
_0801FFFC: .4byte gGameMode
_08020000: .4byte gNumLives
_08020004: .4byte gUnknown_030054A8
_08020008:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _08020046
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020046
	mov r0, r8
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _080200EC @ =sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020046
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020046:
	ldr r2, [sp, #4]
	ldr r4, _080200F0 @ =0x000002B6
	adds r0, r2, r4
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020090
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _08020090
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020090
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _080200EC @ =sub_801EC3C
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020090
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020090:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020166
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _08020166
	mov r2, sl
	cmp r2, #0xa7
	bgt _08020166
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080200C0
	ldr r0, _080200F4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020166
_080200C0:
	mov r2, sb
	adds r2, #0x23
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _080200D2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080200F8
_080200D2:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0, #0x18]
	mov r0, sb
	strh r1, [r0, #0x16]
	mov r2, sl
	strh r2, [r0, #0x18]
	bl sub_80051E8
	movs r4, #1
	str r4, [sp, #0x10]
	b _08020166
	.align 2, 0
_080200EC: .4byte sub_801EC3C
_080200F0: .4byte 0x000002B6
_080200F4: .4byte gUnknown_03005590
_080200F8:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080201A0 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _080201A4 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020166
	ldr r1, _080201A8 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _080201AC @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _080201B0 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020166:
	ldrh r1, [r5, #0x10]
	ldr r2, _080201B4 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802017E:
	strh r0, [r5, #0xc]
_08020180:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _0802018E
	b _0801FEB8
_0802018E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080201A0: .4byte gUnknown_030022D0
_080201A4: .4byte iwram_end
_080201A8: .4byte 0x040000D4
_080201AC: .4byte 0x80000003
_080201B0: .4byte 0x000001FF
_080201B4: .4byte 0x0000FFFC

	thumb_func_start sub_80201B8
sub_80201B8: @ 0x080201B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0802032C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020330 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _08020334 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _08020338 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl sub_8004558
	movs r2, #0x1f
	str r2, [sp, #0x14]
_080201F8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020200
	b _080204DC
_08020200:
	movs r4, #8
	ldrsh r1, [r5, r4]
	ldr r0, _0802033C @ =gUnknown_030054FC
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r2, [r5]
	adds r2, r2, r1
	str r2, [r5]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	ldr r0, _08020340 @ =gUnknown_030054E0
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	asrs r2, r2, #8
	mov r8, r2
	mov ip, r8
	asrs r7, r0, #8
	ldr r1, _08020344 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov sl, r0
	ldr r4, _08020348 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _08020248
	b _08020360
_08020248:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0802025E
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0802025E
	b _08020360
_0802025E:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802026A
	b _08020360
_0802026A:
	adds r6, r2, #0
	adds r6, #0x38
	mov r2, r8
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0802028C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020298
	cmp r2, r1
	blt _08020360
_0802028C:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_08020298:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080202B2
	cmp r7, r1
	bge _080202BE
	cmp r2, r1
	blt _08020360
_080202B2:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_080202BE:
	mov r2, ip
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	ldr r1, _0802034C @ =gCourseTime
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020350 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020312
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020312
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020312
	ldr r1, _08020358 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802030A
	movs r0, #0xff
_0802030A:
	strb r0, [r1]
	ldr r1, _0802035C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020312:
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020326
	ldr r1, _0802034C @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020326
	movs r0, #0xff
	strh r0, [r1]
_08020326:
	movs r0, #0
	b _080204DA
	.align 2, 0
_0802032C: .4byte gCurTask
_08020330: .4byte IWRAM_START + 0x30
_08020334: .4byte IWRAM_START + 0x2B0
_08020338: .4byte IWRAM_START + 0x2B4
_0802033C: .4byte gUnknown_030054FC
_08020340: .4byte gUnknown_030054E0
_08020344: .4byte gCamera
_08020348: .4byte gPlayer
_0802034C: .4byte gCourseTime
_08020350: .4byte gCurrentLevel
_08020354: .4byte gGameMode
_08020358: .4byte gNumLives
_0802035C: .4byte gUnknown_030054A8
_08020360:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	ble _0802039A
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802039A
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	ldr r0, _08020448 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802039A
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802039A:
	ldr r1, [sp, #4]
	ldr r2, _0802044C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080203E8
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _080203E8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080203E8
	adds r0, r7, #0
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _08020448 @ =sub_801EC3C
	str r1, [sp]
	mov r1, r8
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080203E8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080203E8:
	ldrh r0, [r5, #0xa]
	ldr r2, [sp, #8]
	adds r0, r0, r2
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _080204C2
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _080204C2
	mov r4, sl
	cmp r4, #0xa7
	bgt _080204C2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020418
	ldr r0, _08020450 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080204C2
_08020418:
	mov r2, sb
	adds r2, #0x23
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0802042A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020454
_0802042A:
	movs r0, #0xff
	strb r0, [r2]
	mov r1, sp
	ldrh r2, [r1, #0x18]
	mov r1, sb
	strh r2, [r1, #0x16]
	mov r4, sl
	strh r4, [r1, #0x18]
	mov r0, sb
	bl sub_80051E8
	movs r0, #1
	str r0, [sp, #0x10]
	b _080204C2
	.align 2, 0
_08020448: .4byte sub_801EC3C
_0802044C: .4byte 0x000002B6
_08020450: .4byte gUnknown_03005590
_08020454:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080204FC @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _08020500 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _080204C2
	ldr r1, _08020504 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020508 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _0802050C @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_080204C2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020510 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_080204DA:
	strh r0, [r5, #0xc]
_080204DC:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _080204EA
	b _080201F8
_080204EA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080204FC: .4byte gUnknown_030022D0
_08020500: .4byte iwram_end
_08020504: .4byte 0x040000D4
_08020508: .4byte 0x80000003
_0802050C: .4byte 0x000001FF
_08020510: .4byte 0x0000FFFC

	thumb_func_start sub_8020514
sub_8020514: @ 0x08020514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _08020694 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020698 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, _0802069C @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080206A0 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sb
	bl sub_8004558
	movs r1, #0
	mov sl, r1
_08020554:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0802055C
	b _0802068A
_0802055C:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r6, r1, #8
	asrs r7, r0, #8
	ldr r1, _080206A4 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	str r0, [sp, #0x14]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r2, _080206A8 @ =gPlayer
	mov ip, r2
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	ldrh r4, [r5, #0xc]
	mov r8, r4
	mov r0, sl
	adds r0, #1
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r8, r1
	ble _080205A4
	b _080207E8
_080205A4:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _080205BC
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080205BC
	b _080206C0
_080205BC:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080205CA
	b _080206C0
_080205CA:
	adds r4, r2, #0
	adds r4, #0x38
	adds r2, r6, #0
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080205EC
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _080205F8
	cmp r2, r1
	blt _080206C0
_080205EC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_080205F8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020614
	cmp r7, r1
	bge _08020620
	cmp r2, r1
	blt _080206C0
_08020614:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_08020620:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	ldr r1, _080206AC @ =gCourseTime
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _080206B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020672
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020672
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020672
	ldr r1, _080206B8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802066A
	movs r0, #0xff
_0802066A:
	strb r0, [r1]
	ldr r1, _080206BC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020672:
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020686
	ldr r1, _080206AC @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020686
	movs r0, #0xff
	strh r0, [r1]
_08020686:
	movs r0, #0
	strh r0, [r5, #0xc]
_0802068A:
	adds r5, #0x14
	mov r2, sl
	adds r2, #1
	str r2, [sp, #0x1c]
	b _08020966
	.align 2, 0
_08020694: .4byte gCurTask
_08020698: .4byte IWRAM_START + 0x30
_0802069C: .4byte IWRAM_START + 0x2B0
_080206A0: .4byte IWRAM_START + 0x2B4
_080206A4: .4byte gCamera
_080206A8: .4byte gPlayer
_080206AC: .4byte gCourseTime
_080206B0: .4byte gCurrentLevel
_080206B4: .4byte gGameMode
_080206B8: .4byte gNumLives
_080206BC: .4byte gUnknown_030054A8
_080206C0:
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	mov r4, sl
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	cmp r8, r0
	ble _080206D4
	b _080207E8
_080206D4:
	movs r1, #0
	mov r8, r1
_080206D8:
	ldr r0, _08020708 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r8, r0
	beq _080207D8
	ldr r1, _0802070C @ =gMultiplayerPlayerTasks
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080207D8
	ldrh r4, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r3, r4
	mov ip, r3
	ldr r0, _08020710 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020714
	ldrb r0, [r3, #0xa]
	b _08020738
	.align 2, 0
_08020708: .4byte 0x04000128
_0802070C: .4byte gMultiplayerPlayerTasks
_08020710: .4byte gGameMode
_08020714:
	mov r0, ip
	ldrb r1, [r0, #0xa]
	ldr r2, _080207CC @ =gUnknown_080D672C
	mov sl, r2
	ldr r2, _080207D0 @ =gMultiplayerCharacters
	ldr r3, _080207D4 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020738:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020750
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080207D8
_08020750:
	adds r3, r6, #0
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020774
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _08020786
	cmp r3, r1
	blt _080207D8
_08020774:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_08020786:
	adds r3, r7, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _080207A8
	cmp r7, r1
	bge _080207BA
	cmp r3, r1
	blt _080207D8
_080207A8:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_080207BA:
	lsls r0, r6, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0
	b _08020962
	.align 2, 0
_080207CC: .4byte gUnknown_080D672C
_080207D0: .4byte gMultiplayerCharacters
_080207D4: .4byte IWRAM_START + 0x56
_080207D8:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080207E8
	b _080206D8
_080207E8:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020826
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020826
	adds r0, r7, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _080208D0 @ =sub_801EC3C
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020826
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020826:
	ldr r4, [sp, #4]
	ldr r1, _080208D4 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020870
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020870
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020870
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _080208D0 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020870
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020870:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	subs r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x14]
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802094A
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	cmp r1, r0
	ble _0802094A
	cmp r1, #0xa7
	bgt _0802094A
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080208A0
	ldr r0, _080208D8 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802094A
_080208A0:
	mov r2, sb
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _080208B2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080208DC
_080208B2:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x14]
	mov r4, sb
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x18]
	strh r1, [r4, #0x18]
	mov r0, sb
	bl sub_80051E8
	movs r2, #1
	str r2, [sp, #0x10]
	b _0802094A
	.align 2, 0
_080208D0: .4byte sub_801EC3C
_080208D4: .4byte 0x000002B6
_080208D8: .4byte gUnknown_03005590
_080208DC:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020980 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r3, sb
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _08020984 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0802094A
	ldr r1, _08020988 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0802098C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x18]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r4, _08020990 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_0802094A:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020994 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08020962:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x20]
_08020966:
	ldr r3, [sp, #0x1c]
	mov sl, r3
	cmp r3, #0x1f
	bgt _08020970
	b _08020554
_08020970:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020980: .4byte gUnknown_030022D0
_08020984: .4byte iwram_end
_08020988: .4byte 0x040000D4
_0802098C: .4byte 0x80000003
_08020990: .4byte 0x000001FF
_08020994: .4byte 0x0000FFFC

	thumb_func_start sub_8020998
sub_8020998: @ 0x08020998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _080209E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _080209EC @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sl, r2
	ldr r3, _080209F0 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080209F4 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sl
	bl sub_8004558
	movs r1, #0
	str r1, [sp, #0x14]
_080209D8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _080209F8
	adds r5, #0x14
	ldr r2, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_080209E8: .4byte gCurTask
_080209EC: .4byte IWRAM_START + 0x30
_080209F0: .4byte IWRAM_START + 0x2B0
_080209F4: .4byte IWRAM_START + 0x2B4
_080209F8:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r1, r1, #8
	mov sb, r1
	mov r8, sb
	asrs r6, r0, #8
	ldr r1, _08020B34 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	str r0, [sp, #0x1c]
	ldr r3, _08020B38 @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020A44
	b _08020C70
_08020A44:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020A5C
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020A5C
	b _08020B50
_08020A5C:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020B50
	adds r4, r2, #0
	adds r4, #0x38
	mov r2, sb
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020A8A
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08020A96
	cmp r2, r1
	blt _08020B50
_08020A8A:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020A96:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020AB2
	cmp r6, r1
	bge _08020ABE
	cmp r2, r1
	blt _08020B50
_08020AB2:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020ABE:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	ldr r1, _08020B3C @ =gCourseTime
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020B40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020B12
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020B12
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020B12
	ldr r1, _08020B48 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020B0A
	movs r0, #0xff
_08020B0A:
	strb r0, [r1]
	ldr r1, _08020B4C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020B12:
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020B26
	ldr r1, _08020B3C @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020B26
	movs r0, #0xff
	strh r0, [r1]
_08020B26:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_08020B34: .4byte gCamera
_08020B38: .4byte gPlayer
_08020B3C: .4byte gCourseTime
_08020B40: .4byte gCurrentLevel
_08020B44: .4byte gGameMode
_08020B48: .4byte gNumLives
_08020B4C: .4byte gUnknown_030054A8
_08020B50:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020B64
	b _08020C70
_08020B64:
	movs r7, #0
_08020B66:
	ldr r0, _08020B94 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08020C64
	ldr r1, _08020B98 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08020C64
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08020B9C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020BA0
	ldrb r0, [r2, #0xa]
	b _08020BC2
	.align 2, 0
_08020B94: .4byte 0x04000128
_08020B98: .4byte gMultiplayerPlayerTasks
_08020B9C: .4byte gGameMode
_08020BA0:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _08020C58 @ =gMultiplayerCharacters
	ldr r3, _08020C5C @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08020C60 @ =gUnknown_080D672C
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020BC2:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020BDA
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08020C64
_08020BDA:
	mov r3, r8
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020BFE
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020C10
	cmp r3, r1
	blt _08020C64
_08020BFE:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C10:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08020C32
	cmp r6, r1
	bge _08020C44
	cmp r3, r1
	blt _08020C64
_08020C32:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C44:
	mov r1, r8
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0
	b _08020DEA
	.align 2, 0
_08020C58: .4byte gMultiplayerCharacters
_08020C5C: .4byte IWRAM_START + 0x56
_08020C60: .4byte gUnknown_080D672C
_08020C64:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08020C70
	b _08020B66
_08020C70:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020CAA
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CAA
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08020D58 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sb
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020CAA
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CAA:
	ldr r4, [sp, #4]
	ldr r1, _08020D5C @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020CF8
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020CF8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CF8
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08020D58 @ =sub_801EC3C
	str r1, [sp]
	mov r1, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020CF8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CF8:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020DD2
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	ble _08020DD2
	cmp r1, #0xa7
	bgt _08020DD2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020D28
	ldr r0, _08020D60 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020DD2
_08020D28:
	mov r2, sl
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _08020D3A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020D64
_08020D3A:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x18]
	mov r4, sl
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x1c]
	strh r1, [r4, #0x18]
	mov r0, sl
	bl sub_80051E8
	movs r2, #1
	str r2, [sp, #0x10]
	b _08020DD2
	.align 2, 0
_08020D58: .4byte sub_801EC3C
_08020D5C: .4byte 0x000002B6
_08020D60: .4byte gUnknown_03005590
_08020D64:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020E08 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r3, sl
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _08020E0C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020DD2
	ldr r1, _08020E10 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020E14 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sl
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x1c]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sl
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _08020E18 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020DD2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020E1C @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08020DEA:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_08020DEE:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x14]
	cmp r3, #0x1f
	bgt _08020DF8
	b _080209D8
_08020DF8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020E08: .4byte gUnknown_030022D0
_08020E0C: .4byte iwram_end
_08020E10: .4byte 0x040000D4
_08020E14: .4byte 0x80000003
_08020E18: .4byte 0x000001FF
_08020E1C: .4byte 0x0000FFFC

	thumb_func_start sub_8020E20
sub_8020E20: @ 0x08020E20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _08020E70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020E74 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _08020E78 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _08020E7C @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl sub_8004558
	movs r1, #0
	str r1, [sp, #0x18]
_08020E60:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020E80
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08020E70: .4byte gCurTask
_08020E74: .4byte IWRAM_START + 0x30
_08020E78: .4byte IWRAM_START + 0x2B0
_08020E7C: .4byte IWRAM_START + 0x2B4
_08020E80:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _08020EAE
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _0802131E
_08020EAE:
	ldr r0, _08020ECC @ =0x0000EFFF
	cmp r2, r0
	bgt _08020ED4
	ldr r0, _08020ED0 @ =0x00011FFF
	cmp r3, r0
	bgt _08020ED4
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _08020EF2
	.align 2, 0
_08020ECC: .4byte 0x0000EFFF
_08020ED0: .4byte 0x00011FFF
_08020ED4:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _08020EF4
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08020EF4
	ldr r3, _08021020 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _08021024 @ =0xFFFCA000
	adds r0, r1, r4
_08020EF2:
	str r0, [r5, #4]
_08020EF4:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r6, r0, #8
	ldr r1, _08021028 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r6, r0
	mov r8, r0
	ldr r3, _0802102C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08020F30
	b _08021164
_08020F30:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020F48
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020F48
	b _08021044
_08020F48:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08021044
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F76
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _08020F82
	cmp r2, r1
	blt _08021044
_08020F76:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020F82:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F9E
	cmp r6, r1
	bge _08020FAA
	cmp r2, r1
	blt _08021044
_08020F9E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020FAA:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	ldr r1, _08021030 @ =gCourseTime
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08021034 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020FFE
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020FFE
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020FFE
	ldr r1, _0802103C @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020FF6
	movs r0, #0xff
_08020FF6:
	strb r0, [r1]
	ldr r1, _08021040 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020FFE:
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021012
	ldr r1, _08021030 @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08021012
	movs r0, #0xff
	strh r0, [r1]
_08021012:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08021020: .4byte 0xFFFA6000
_08021024: .4byte 0xFFFCA000
_08021028: .4byte gCamera
_0802102C: .4byte gPlayer
_08021030: .4byte gCourseTime
_08021034: .4byte gCurrentLevel
_08021038: .4byte gGameMode
_0802103C: .4byte gNumLives
_08021040: .4byte gUnknown_030054A8
_08021044:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08021058
	b _08021164
_08021058:
	movs r7, #0
_0802105A:
	ldr r0, _08021088 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08021158
	ldr r1, _0802108C @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08021158
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08021090 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021094
	ldrb r0, [r2, #0xa]
	b _080210B6
	.align 2, 0
_08021088: .4byte 0x04000128
_0802108C: .4byte gMultiplayerPlayerTasks
_08021090: .4byte gGameMode
_08021094:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _0802114C @ =gMultiplayerCharacters
	ldr r3, _08021150 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08021154 @ =gUnknown_080D672C
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_080210B6:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080210CE
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08021158
_080210CE:
	mov r3, sb
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _080210F2
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08021104
	cmp r3, r1
	blt _08021158
_080210F2:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021104:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08021126
	cmp r6, r1
	bge _08021138
	cmp r3, r1
	blt _08021158
_08021126:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021138:
	mov r1, sb
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0
	b _0802131A
	.align 2, 0
_0802114C: .4byte gMultiplayerCharacters
_08021150: .4byte IWRAM_START + 0x56
_08021154: .4byte gUnknown_080D672C
_08021158:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08021164
	b _0802105A
_08021164:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0802119E
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802119E
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08021220 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802119E
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802119E:
	ldr r4, [sp, #4]
	ldr r1, _08021224 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080211EC
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _080211EC
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080211EC
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08021220 @ =sub_801EC3C
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080211EC
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080211EC:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #0xc]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802120A
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _0802120A
	mov r0, r8
	cmp r0, #0xa7
	ble _0802123C
_0802120A:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08021230
	ldr r1, _08021228 @ =0xFFFFFA60
	add sl, r1
	ldr r2, _0802122C @ =0xFFFFFCA0
	add r8, r2
	b _0802123C
	.align 2, 0
_08021220: .4byte sub_801EC3C
_08021224: .4byte 0x000002B6
_08021228: .4byte 0xFFFFFA60
_0802122C: .4byte 0xFFFFFCA0
_08021230:
	movs r3, #0xb4
	lsls r3, r3, #3
	add sl, r3
	movs r4, #0xd8
	lsls r4, r4, #2
	add r8, r4
_0802123C:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _08021302
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _08021302
	mov r0, r8
	cmp r0, #0xa7
	bgt _08021302
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08021264
	ldr r0, _08021290 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021302
_08021264:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _08021276
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08021294
_08021276:
	movs r0, #0xff
	strb r0, [r2]
	mov r3, sl
	ldr r2, [sp, #8]
	strh r3, [r2, #0x16]
	mov r4, r8
	strh r4, [r2, #0x18]
	ldr r0, [sp, #8]
	bl sub_80051E8
	movs r0, #1
	str r0, [sp, #0x14]
	b _08021302
	.align 2, 0
_08021290: .4byte gUnknown_03005590
_08021294:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08021338 @ =gUnknown_030022D0
	adds r4, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0802133C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08021302
	ldr r1, _08021340 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08021344 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _08021348 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08021302:
	ldrh r1, [r5, #0x10]
	ldr r2, _0802134C @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802131A:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_0802131E:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _08021328
	b _08020E60
_08021328:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021338: .4byte gUnknown_030022D0
_0802133C: .4byte iwram_end
_08021340: .4byte 0x040000D4
_08021344: .4byte 0x80000003
_08021348: .4byte 0x000001FF
_0802134C: .4byte 0x0000FFFC

	thumb_func_start sub_8021350
sub_8021350: @ 0x08021350
	push {r4, lr}
	ldr r4, _08021364 @ =gUnknown_030059D8
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021364: .4byte gUnknown_030059D8

	thumb_func_start sub_8021368
sub_8021368: @ 0x08021368
	push {lr}
	ldr r0, _0802137C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021380
	bl sub_801FE78
	b _08021384
	.align 2, 0
_0802137C: .4byte gUnknown_03005424
_08021380:
	bl sub_80201B8
_08021384:
	pop {r0}
	bx r0

	thumb_func_start sub_8021388
sub_8021388: @ 0x08021388
	push {lr}
	ldr r0, _0802139C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080213A0
	bl sub_8020514
	b _080213A4
	.align 2, 0
_0802139C: .4byte gUnknown_03005424
_080213A0:
	bl sub_8020998
_080213A4:
	pop {r0}
	bx r0

	thumb_func_start sub_80213A8
sub_80213A8: @ 0x080213A8
	push {lr}
	bl sub_8020E20
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80213B4
sub_80213B4: @ 0x080213B4
	ldr r1, _080213BC @ =gUnknown_030059D8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080213BC: .4byte gUnknown_030059D8

	thumb_func_start sub_80213C0
sub_80213C0: @ 0x080213C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r2, #0
	adds r0, r5, #0
	adds r0, #0x60
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, _08021408 @ =sub_8023FC0
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _0802140C @ =sub_802A07C
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0
	strb r4, [r0]
	str r1, [r0, #4]
	ldr r0, _08021410 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802141C
	cmp r0, #5
	beq _08021418
	ldr r1, _08021414 @ =gCourseTime
	movs r0, #1
	strh r0, [r1]
	b _0802141C
	.align 2, 0
_08021408: .4byte sub_8023FC0
_0802140C: .4byte sub_802A07C
_08021410: .4byte gGameMode
_08021414: .4byte gCourseTime
_08021418:
	ldr r0, _08021474 @ =gCourseTime
	strh r1, [r0]
_0802141C:
	adds r0, r5, #0
	bl sub_8021694
	ldr r1, _08021478 @ =gPlayer
	ldr r0, _0802147C @ =sub_8025318
	str r0, [r1]
	bl sub_801F754
	bl sub_801FC2C
	ldr r6, _08021480 @ =gInputRecorder
	ldrb r4, [r6, #8]
	cmp r4, #1
	beq _0802143C
	cmp r4, #2
	bne _08021442
_0802143C:
	bl InputRecorderLoadTape
	strb r4, [r6, #8]
_08021442:
	ldr r0, _08021484 @ =gUnknown_030054D0
	movs r1, #0
	str r1, [r0]
	ldr r0, _08021488 @ =gUnknown_030054FC
	str r1, [r0]
	ldr r0, _0802148C @ =gUnknown_030054E0
	str r1, [r0]
	bl sub_800E16C
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8021490
	adds r0, r5, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8021554
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021474: .4byte gCourseTime
_08021478: .4byte gPlayer
_0802147C: .4byte sub_8025318
_08021480: .4byte gInputRecorder
_08021484: .4byte gUnknown_030054D0
_08021488: .4byte gUnknown_030054FC
_0802148C: .4byte gUnknown_030054E0

	thumb_func_start sub_8021490
sub_8021490: @ 0x08021490
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, #0x60
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r6, #0
	adds r4, #0xc
	cmp r7, #0
	bne _080214AC
	ldr r0, _080214A8 @ =0x06010000
	b _080214B2
	.align 2, 0
_080214A8: .4byte 0x06010000
_080214AC:
	movs r0, #0x40
	bl VramMalloc
_080214B2:
	str r0, [r4, #4]
	movs r2, #0
	strh r2, [r4, #8]
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r7, #0
	adds r0, #0x10
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08021508 @ =gGameMode
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #2
	bls _08021510
	ldr r0, _0802150C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r4, #0
	adds r1, #0x25
	b _08021516
	.align 2, 0
_08021508: .4byte gGameMode
_0802150C: .4byte 0x04000128
_08021510:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_08021516:
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r4, #0x10]
	ldrb r0, [r2]
	cmp r0, #2
	bls _0802152C
	movs r0, #0xc0
	lsls r0, r0, #0xc
	orrs r0, r1
	str r0, [r4, #0x10]
_0802152C:
	ldr r0, [r4, #0x10]
	movs r1, #0x20
	orrs r0, r1
	orrs r0, r7
	str r0, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021554
sub_8021554: @ 0x08021554
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, r1, #0
	adds r4, r0, #0
	adds r4, #0xc
	adds r6, r0, #0
	adds r0, r7, #0
	adds r0, #0x85
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #1
	bne _08021580
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0x5f
	strh r0, [r4, #0xa]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r5, [r0]
	b _08021598
_08021580:
	cmp r5, #2
	bne _080215F8
	movs r0, #0x10
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xba
	strh r0, [r4, #0xa]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
_08021598:
	movs r1, #0
	strh r1, [r4, #8]
	adds r2, r4, #0
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080215D4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080215DC
	ldr r0, _080215D8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #3
	b _080215E2
	.align 2, 0
_080215D4: .4byte gGameMode
_080215D8: .4byte 0x04000128
_080215DC:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_080215E2:
	strb r0, [r1]
	ldr r0, _08021600 @ =0x00042024
	str r0, [r4, #0x10]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
_080215F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021600: .4byte 0x00042024

	thumb_func_start sub_8021604
sub_8021604: @ 0x08021604
	push {r4, lr}
	adds r4, r1, #0
	mov ip, r3
	mov r1, ip
	adds r1, #0x60
	strb r2, [r1]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _08021638 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08021640
	ldr r1, _0802163C @ =gSpawnPositions
	lsls r2, r4, #2
	adds r0, r2, r1
	ldrh r3, [r0]
	mov r0, ip
	adds r0, #0x74
	strh r3, [r0]
	adds r1, #2
	adds r2, r2, r1
	ldrh r0, [r2]
	mov r3, ip
	adds r3, #0x76
	strh r0, [r3]
	b _0802166A
	.align 2, 0
_08021638: .4byte gGameMode
_0802163C: .4byte gSpawnPositions
_08021640:
	ldr r0, _08021688 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x74
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb1
	strh r0, [r1]
	subs r0, #0xb2
	mov r1, ip
	str r0, [r1, #8]
	str r0, [r1, #0xc]
_0802166A:
	mov r1, ip
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
	mov r2, ip
	str r0, [r2, #0x78]
	subs r1, #8
	ldr r0, _0802168C @ =gUnknown_03005AF0
	str r0, [r1]
	adds r1, #4
	ldr r0, _08021690 @ =gUnknown_03005AA0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021688: .4byte 0x04000128
_0802168C: .4byte gUnknown_03005AF0
_08021690: .4byte gUnknown_03005AA0

	thumb_func_start sub_8021694
sub_8021694: @ 0x08021694
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080216B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080216B8
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ands r0, r1
	adds r0, #1
	cmp r0, #0
	beq _080216B8
	movs r0, #0xe6
	lsls r0, r0, #9
	b _080216C2
	.align 2, 0
_080216B4: .4byte gGameMode
_080216B8:
	adds r0, r5, #0
	adds r0, #0x74
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
_080216C2:
	str r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x76
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _0802181C @ =sub_8025318
	str r0, [r5]
	ldr r0, _08021820 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	orrs r2, r1
	ldrh r0, [r0, #4]
	orrs r2, r0
	adds r0, r5, #0
	adds r0, #0x5c
	movs r3, #0
	movs r4, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
	strh r4, [r5, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xe
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	strb r3, [r0]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	strh r4, [r5, #0x26]
	adds r0, r5, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #4
	str r0, [r5, #0x40]
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r5, #0x44]
	movs r0, #8
	str r0, [r5, #0x48]
	movs r0, #0x40
	str r0, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, #0x2e
	ldr r0, _08021824 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	strh r4, [r5, #0x30]
	strh r4, [r5, #0x32]
	str r4, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r3, [r0]
	strh r4, [r5, #0x2a]
	adds r1, #8
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0x23
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r5, #0
	adds r1, #0x86
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6d
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0x15
	strb r3, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #0x14
	strb r3, [r0]
	adds r0, #5
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	subs r0, #0x3a
	strb r3, [r0]
	bl sub_8015750
	bl sub_801561C
	adds r0, r5, #0
	bl sub_802989C
	adds r1, r5, #0
	adds r1, #0x99
	movs r2, #3
	adds r6, r1, #0
	adds r4, r5, #0
	adds r4, #0x60
	movs r0, #0x85
	adds r0, r0, r5
	mov ip, r0
	movs r3, #0
_080217EA:
	stm r1!, {r3}
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080217EA
	movs r0, #0x7f
	strb r0, [r6]
	movs r2, #0
	ldrsb r2, [r4, r2]
	cmp r2, #0
	bne _08021840
	ldr r0, _08021828 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08021840
	ldr r3, _0802182C @ =gUnknown_03005490
	ldr r1, [r3]
	ldr r0, _08021830 @ =0x00008C9F
	cmp r1, r0
	bls _08021838
	ldr r0, _08021834 @ =gUnknown_030053E4
	str r2, [r0]
	str r2, [r3]
	str r2, [r5, #0x78]
	b _08021840
	.align 2, 0
_0802181C: .4byte sub_8025318
_08021820: .4byte gPlayerControls
_08021824: .4byte 0x0000FFFF
_08021828: .4byte gGameMode
_0802182C: .4byte gUnknown_03005490
_08021830: .4byte 0x00008C9F
_08021834: .4byte gUnknown_030053E4
_08021838:
	ldr r1, _08021854 @ =gUnknown_030053E4
	ldr r0, [r5, #0x78]
	str r0, [r1]
	str r0, [r3]
_08021840:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #4
	bhi _080218C2
	lsls r0, r0, #2
	ldr r1, _08021858 @ =_0802185C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08021854: .4byte gUnknown_030053E4
_08021858: .4byte _0802185C
_0802185C: @ jump table
	.4byte _08021870 @ case 0
	.4byte _08021882 @ case 1
	.4byte _08021896 @ case 2
	.4byte _080218A8 @ case 3
	.4byte _080218BA @ case 4
_08021870:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080218C2
_08021882:
	adds r0, r5, #0
	adds r0, #0xae
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
	b _080218C2
_08021896:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #4
	str r1, [r0]
	subs r0, #3
	strb r1, [r0]
	b _080218C2
_080218A8:
	adds r0, r5, #0
	adds r0, #0xac
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080218C2
_080218BA:
	adds r1, r5, #0
	adds r1, #0xac
	movs r0, #0
	strb r0, [r1]
_080218C2:
	ldr r1, _080218D8 @ =IWRAM_START + 0x5B7C
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080218DC @ =gUnknown_03005840
	movs r1, #0
	str r1, [r0]
	ldr r0, _080218E0 @ =gUnknown_0300583C
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080218D8: .4byte IWRAM_START + 0x5B7C
_080218DC: .4byte gUnknown_03005840
_080218E0: .4byte gUnknown_0300583C

	thumb_func_start sub_80218E4
sub_80218E4: @ 0x080218E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080218FA
	ldr r0, _08021950 @ =0x00000119
	bl m4aSongNumStop
_080218FA:
	ldr r0, [r4, #0x20]
	ldr r1, _08021954 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x85
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _0802192C
	movs r0, #0x78
	bl m4aSongNumStop
_0802192C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _0802193A
	movs r0, #0xe3
	bl m4aSongNumStop
_0802193A:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802194A
	ldr r0, [r4, #0x20]
	ldr r1, _08021958 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
_0802194A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08021950: .4byte 0x00000119
_08021954: .4byte 0xCEF118CF
_08021958: .4byte 0xFDFFFFFF

	thumb_func_start sub_802195C
sub_802195C: @ 0x0802195C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021974
	add r6, sp, #8
_08021974:
	cmp r7, #0
	bne _0802197A
	add r7, sp, #0xc
_0802197A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021A10 @ =0x000002FF
	cmp r0, r5
	bgt _080219A6
	movs r0, #0x80
	orrs r2, r0
_080219A6:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021A14 @ =sub_801ED24
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021A10 @ =0x000002FF
	cmp r0, r3
	bgt _080219EA
	movs r0, #0x80
	orrs r2, r0
_080219EA:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021A18
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021A20
	.align 2, 0
_08021A10: .4byte 0x000002FF
_08021A14: .4byte sub_801ED24
_08021A18:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021A20:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021A34
sub_8021A34: @ 0x08021A34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021A4C
	add r6, sp, #8
_08021A4C:
	cmp r7, #0
	bne _08021A52
	add r7, sp, #0xc
_08021A52:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021AE4 @ =0x000002FF
	cmp r0, r5
	bgt _08021A7E
	movs r0, #0x80
	orrs r2, r0
_08021A7E:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021AE8 @ =sub_801ED24
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021AE4 @ =0x000002FF
	cmp r0, r3
	bgt _08021AC0
	movs r0, #0x80
	orrs r2, r0
_08021AC0:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021AEC
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021AF4
	.align 2, 0
_08021AE4: .4byte 0x000002FF
_08021AE8: .4byte sub_801ED24
_08021AEC:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021AF4:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021B08
sub_8021B08: @ 0x08021B08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08021B20
	add r6, sp, #8
_08021B20:
	cmp r7, #0
	bne _08021B26
	add r7, sp, #0xc
_08021B26:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _08021BBC @ =0x000002FF
	cmp r0, r5
	bgt _08021B52
	movs r0, #0x80
	orrs r2, r0
_08021B52:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08021BC0 @ =sub_801EE64
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021BBC @ =0x000002FF
	cmp r0, r3
	bgt _08021B96
	movs r0, #0x80
	orrs r2, r0
_08021B96:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08021BC4
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08021BCC
	.align 2, 0
_08021BBC: .4byte 0x000002FF
_08021BC0: .4byte sub_801EE64
_08021BC4:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08021BCC:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8021BE0
sub_8021BE0: @ 0x08021BE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _08021C34
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08021C08
	ldr r0, _08021C2C @ =gPlayer
	ldr r1, _08021C30 @ =sub_8025318
	str r1, [r0]
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08021C08:
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08021C22
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
_08021C22:
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _08021C3C
	.align 2, 0
_08021C2C: .4byte gPlayer
_08021C30: .4byte sub_8025318
_08021C34:
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08021C3C:
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021C4C
sub_8021C4C: @ 0x08021C4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021CF8 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _08021C7E
	movs r2, #0x80
	orrs r2, r5
_08021C7E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _08021CFC @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021CA2
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021CA2:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _08021CC0
	movs r0, #0x80
	orrs r2, r0
_08021CC0:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021CDE
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021CDE:
	add r2, sp, #0xc
	ldr r0, _08021D00 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021D04
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
	b _08021D0C
	.align 2, 0
_08021CF8: .4byte 0x000002FF
_08021CFC: .4byte sub_801ED24
_08021D00: .4byte gUnknown_03005424
_08021D04:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
_08021D0C:
	adds r2, r0, #0
	cmp r2, #0
	bge _08021DAA
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	adds r1, #6
	rsbs r1, r1, #0
	cmp r2, r1
	bge _08021D26
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _08021DAA
_08021D26:
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _08021D70 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021D3E
	rsbs r2, r2, #0
_08021D3E:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8021BE0
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08021D74
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xbd
	lsls r1, r1, #4
	cmp r0, r1
	ble _08021D8E
	strh r1, [r4, #0x12]
	b _08021D8E
	.align 2, 0
_08021D70: .4byte gUnknown_03005424
_08021D74:
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08021D86
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	b _08021DA8
_08021D86:
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_08021D8E:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08021D98
	rsbs r1, r1, #0
_08021D98:
	strh r1, [r4, #0x14]
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08021DAA
	rsbs r0, r1, #0
_08021DA8:
	strh r0, [r4, #0x14]
_08021DAA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8021DB8
sub_8021DB8: @ 0x08021DB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08021E64 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _08021DEA
	movs r2, #0x80
	orrs r2, r5
_08021DEA:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _08021E68 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021E0E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021E0E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _08021E2C
	movs r0, #0x80
	orrs r2, r0
_08021E2C:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021E4A
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_08021E4A:
	add r2, sp, #0xc
	ldr r0, _08021E6C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021E70
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
	b _08021E78
	.align 2, 0
_08021E64: .4byte 0x000002FF
_08021E68: .4byte sub_801ED24
_08021E6C: .4byte gUnknown_03005424
_08021E70:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
_08021E78:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021ED4
	ldr r0, _08021ECC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021E8C
	rsbs r2, r2, #0
_08021E8C:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08021ED0
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #0x40
	cmp r0, #0
	ble _08021ED0
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_8021BE0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08021EC8
	rsbs r0, r0, #0
_08021EC8:
	strh r0, [r4, #0x14]
	b _08021ED4
	.align 2, 0
_08021ECC: .4byte gUnknown_03005424
_08021ED0:
	movs r0, #0
	strh r0, [r4, #0x12]
_08021ED4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8021EE4
sub_8021EE4: @ 0x08021EE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov ip, r0
	ldr r0, _08021F20 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08021F28
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r3, #0x88
	movs r2, #0
	str r2, [sp]
	ldr r2, _08021F24 @ =sub_801ED24
	str r2, [sp, #4]
	mov r2, ip
	b _08021F54
	.align 2, 0
_08021F20: .4byte gUnknown_03005424
_08021F24: .4byte sub_801ED24
_08021F28:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r7, r0, r1
	ldr r0, [r5, #0xc]
	asrs r6, r0, #8
	mov r2, ip
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _08021F88 @ =0x000002FF
	cmp r1, r0
	bgt _08021F46
	orrs r2, r3
_08021F46:
	movs r3, #8
	rsbs r3, r3, #0
	str r4, [sp]
	ldr r0, _08021F8C @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
_08021F54:
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021F6E
	lsls r1, r2, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
_08021F6E:
	ldr r0, _08021F90 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r4, sp, #0xc
	cmp r0, #0
	beq _08021F94
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
	b _08021F9E
	.align 2, 0
_08021F88: .4byte 0x000002FF
_08021F8C: .4byte sub_801ED24
_08021F90: .4byte gUnknown_03005424
_08021F94:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
_08021F9E:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08021FCC
	ldr r0, _08021FC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021FB2
	rsbs r2, r2, #0
_08021FB2:
	lsls r0, r2, #8
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	str r1, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0802202E
	movs r0, #0
	strh r0, [r5, #0x12]
	b _0802202E
	.align 2, 0
_08021FC8: .4byte gUnknown_03005424
_08021FCC:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0802202E
	ldr r0, _08021FEC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021FF0
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
	b _08021FFA
	.align 2, 0
_08021FEC: .4byte gUnknown_03005424
_08021FF0:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
_08021FFA:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802202E
	ldr r0, _08022038 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802200E
	rsbs r2, r2, #0
_0802200E:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0802202E:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022038: .4byte gUnknown_03005424

	thumb_func_start sub_802203C
sub_802203C: @ 0x0802203C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r7, [r0]
	ldr r0, _08022074 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	mov ip, r0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0802207C
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	str r2, [sp]
	ldr r2, _08022078 @ =sub_801ED24
	str r2, [sp, #4]
	adds r2, r7, #0
	b _080220A6
	.align 2, 0
_08022074: .4byte gUnknown_03005424
_08022078: .4byte sub_801ED24
_0802207C:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r6, r0, r1
	ldr r0, [r5, #0xc]
	asrs r4, r0, #8
	adds r2, r7, #0
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _080220DC @ =0x000002FF
	cmp r1, r0
	bgt _0802209C
	mov r1, ip
	orrs r2, r1
_0802209C:
	str r3, [sp]
	ldr r0, _080220E0 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
_080220A6:
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _080220C2
	lsls r1, r2, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
_080220C2:
	ldr r0, _080220E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r4, sp, #0xc
	cmp r0, #0
	beq _080220E8
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
	b _080220F2
	.align 2, 0
_080220DC: .4byte 0x000002FF
_080220E0: .4byte sub_801ED24
_080220E4: .4byte gUnknown_03005424
_080220E8:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
_080220F2:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022120
	ldr r0, _0802211C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022106
	rsbs r2, r2, #0
_08022106:
	lsls r0, r2, #8
	ldr r1, [r5, #0xc]
	subs r1, r1, r0
	str r1, [r5, #0xc]
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08022182
	movs r0, #0
	strh r0, [r5, #0x12]
	b _08022182
	.align 2, 0
_0802211C: .4byte gUnknown_03005424
_08022120:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _08022182
	ldr r0, _08022140 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022144
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029AC0
	b _0802214E
	.align 2, 0
_08022140: .4byte gUnknown_03005424
_08022144:
	adds r0, r5, #0
	add r1, sp, #8
	adds r2, r4, #0
	bl sub_8029B0C
_0802214E:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022182
	ldr r0, _0802218C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022162
	rsbs r2, r2, #0
_08022162:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_08022182:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802218C: .4byte gUnknown_03005424

	thumb_func_start sub_8022190
sub_8022190: @ 0x08022190
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r3, [r4, #0x12]
	adds r5, r3, #0
	ldr r0, _080221E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	asrs r0, r0, #0x1f
	ands r0, r2
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bne _080221B8
	cmp r3, #0
	beq _080221C6
_080221B8:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
_080221C6:
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08022202
	cmp r0, #1
	bgt _080221E8
	cmp r0, #0
	beq _080221F2
	b _08022210
	.align 2, 0
_080221E4: .4byte gUnknown_03005424
_080221E8:
	cmp r0, #2
	beq _080221FA
	cmp r0, #3
	beq _0802220A
	b _08022210
_080221F2:
	adds r0, r4, #0
	bl sub_8021C4C
	b _08022210
_080221FA:
	adds r0, r4, #0
	bl sub_8021DB8
	b _08022210
_08022202:
	adds r0, r4, #0
	bl sub_8021EE4
	b _08022210
_0802220A:
	adds r0, r4, #0
	bl sub_802203C
_08022210:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8022218
sub_8022218: @ 0x08022218
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r2, sp, #4
	ldr r0, _08022238 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802223C
	adds r0, r5, #0
	mov r1, sp
	bl sub_8029AC0
	b _08022244
	.align 2, 0
_08022238: .4byte gUnknown_03005424
_0802223C:
	adds r0, r5, #0
	mov r1, sp
	bl sub_8029B0C
_08022244:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022278
	ldr r0, _08022280 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022258
	rsbs r2, r2, #0
_08022258:
	lsls r1, r2, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_8021BE0
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_08022278:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022280: .4byte gUnknown_03005424

	thumb_func_start sub_8022284
sub_8022284: @ 0x08022284
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	ldr r0, _080222A4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080222A8
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029B0C
	b _080222B0
	.align 2, 0
_080222A4: .4byte gUnknown_03005424
_080222A8:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029AC0
_080222B0:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802230A
	ldr r0, _08022314 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080222C4
	rsbs r2, r2, #0
_080222C4:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8021BE0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _080222E6
	rsbs r1, r1, #0
_080222E6:
	strh r1, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080222F8
	rsbs r0, r1, #0
	strh r0, [r4, #0x14]
_080222F8:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802230A
	ldr r0, [r4, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #0x20]
_0802230A:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022314: .4byte gUnknown_03005424

	thumb_func_start sub_8022318
sub_8022318: @ 0x08022318
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08022334
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #0xe
	strb r0, [r3, #0x17]
	adds r2, r3, #0
	adds r2, #0x64
	b _0802237A
_08022334:
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r3, #0x20]
	adds r2, r3, #0
	adds r2, #0x64
	movs r0, #0
	strh r0, [r2]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	adds r4, r0, #0
	subs r4, #0xe
	ldr r0, _080223B8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802235A
	rsbs r4, r4, #0
_0802235A:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0802236A
	rsbs r4, r4, #0
_0802236A:
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #0xe
	strb r0, [r3, #0x17]
	lsls r1, r4, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
_0802237A:
	ldr r0, [r3, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1e
	ands r0, r1
	adds r1, #0x10
	ands r0, r1
	subs r1, #0xf0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r0, r3, #0
	adds r0, #0x84
	movs r4, #0
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x61
	strb r4, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x5b
	ble _080223B0
	strh r4, [r2]
_080223B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080223B8: .4byte gUnknown_03005424

	thumb_func_start sub_80223BC
sub_80223BC: @ 0x080223BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _08022480 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _080223EE
	movs r2, #0x80
	orrs r2, r5
_080223EE:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _08022484 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802241E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0802241E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0802243C
	movs r0, #0x80
	orrs r2, r0
_0802243C:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022466
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022466:
	add r2, sp, #0xc
	ldr r0, _08022488 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802248C
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
	b _08022494
	.align 2, 0
_08022480: .4byte 0x000002FF
_08022484: .4byte sub_801ED24
_08022488: .4byte gUnknown_03005424
_0802248C:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
_08022494:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080224CA
	ldr r0, _080224D8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080224A8
	rsbs r2, r2, #0
_080224A8:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_080224CA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080224D8: .4byte gUnknown_03005424

	thumb_func_start sub_80224DC
sub_80224DC: @ 0x080224DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _080225A0 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0802250E
	movs r2, #0x80
	orrs r2, r5
_0802250E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _080225A4 @ =sub_801ED24
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802253E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0802253E:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0802255C
	movs r0, #0x80
	orrs r2, r0
_0802255C:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022586
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022586:
	add r2, sp, #0xc
	ldr r0, _080225A8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080225AC
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029B0C
	b _080225B4
	.align 2, 0
_080225A0: .4byte 0x000002FF
_080225A4: .4byte sub_801ED24
_080225A8: .4byte gUnknown_03005424
_080225AC:
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_8029AC0
_080225B4:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080225D4
	ldr r0, _080225E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080225C8
	rsbs r2, r2, #0
_080225C8:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
_080225D4:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080225E4: .4byte gUnknown_03005424

	thumb_func_start sub_80225E8
sub_80225E8: @ 0x080225E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r5, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0802265C @ =0x000002FF
	cmp r1, r0
	bgt _08022612
	movs r0, #0x80
	orrs r2, r0
_08022612:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _08022660 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022642
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022642:
	ldr r0, _08022664 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r5, sp, #0xc
	cmp r0, #0
	beq _08022668
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
	b _08022672
	.align 2, 0
_0802265C: .4byte 0x000002FF
_08022660: .4byte sub_801ED24
_08022664: .4byte gUnknown_03005424
_08022668:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
_08022672:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080226A0
	ldr r0, _0802269C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022686
	rsbs r2, r2, #0
_08022686:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08022704
	movs r0, #0
	strh r0, [r4, #0x12]
	b _08022704
	.align 2, 0
_0802269C: .4byte gUnknown_03005424
_080226A0:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022704
	ldr r0, _080226C0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080226C4
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
	b _080226CE
	.align 2, 0
_080226C0: .4byte gUnknown_03005424
_080226C4:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
_080226CE:
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022704
	ldr r0, _0802270C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080226E2
	rsbs r2, r2, #0
_080226E2:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_08022704:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802270C: .4byte gUnknown_03005424

	thumb_func_start sub_8022710
sub_8022710: @ 0x08022710
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r5, r0, r1
	ldr r0, [r4, #0xc]
	asrs r3, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _08022784 @ =0x000002FF
	cmp r1, r0
	bgt _0802273A
	movs r0, #0x80
	orrs r2, r0
_0802273A:
	movs r6, #0
	str r6, [sp]
	ldr r0, _08022788 @ =sub_801ED24
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	cmp r2, #0
	bgt _08022768
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08022768:
	ldr r0, _0802278C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	add r5, sp, #0xc
	cmp r0, #0
	beq _08022790
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
	b _0802279A
	.align 2, 0
_08022784: .4byte 0x000002FF
_08022788: .4byte sub_801ED24
_0802278C: .4byte gUnknown_03005424
_08022790:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
_0802279A:
	adds r2, r0, #0
	cmp r2, #0
	bgt _080227C8
	ldr r0, _080227C4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080227AE
	rsbs r2, r2, #0
_080227AE:
	lsls r0, r2, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802282C
	movs r0, #0
	strh r0, [r4, #0x12]
	b _0802282C
	.align 2, 0
_080227C4: .4byte gUnknown_03005424
_080227C8:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802282C
	ldr r0, _080227E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080227EC
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029AC0
	b _080227F6
	.align 2, 0
_080227E8: .4byte gUnknown_03005424
_080227EC:
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_8029B0C
_080227F6:
	adds r2, r0, #0
	cmp r2, #0
	bgt _0802282C
	ldr r0, _08022834 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802280A
	rsbs r2, r2, #0
_0802280A:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r2, [r0]
	strh r1, [r4, #0x12]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
_0802282C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08022834: .4byte gUnknown_03005424

	thumb_func_start sub_8022838
sub_8022838: @ 0x08022838
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x10]
	ldrh r5, [r4, #0x12]
	movs r3, #0
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08022864
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	b _080228BA
_08022864:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080228AC
	cmp r0, #1
	bgt _08022892
	cmp r0, #0
	beq _0802289C
	b _080228BA
_08022892:
	cmp r0, #2
	beq _080228A4
	cmp r0, #3
	beq _080228B4
	b _080228BA
_0802289C:
	adds r0, r4, #0
	bl sub_80223BC
	b _080228BA
_080228A4:
	adds r0, r4, #0
	bl sub_80224DC
	b _080228BA
_080228AC:
	adds r0, r4, #0
	bl sub_80225E8
	b _080228BA
_080228B4:
	adds r0, r4, #0
	bl sub_8022710
_080228BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80228C0
sub_80228C0: @ 0x080228C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	mov r1, sl
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	adds r2, r7, #0
	adds r2, #0x28
	str r2, [sp, #8]
	str r2, [sp]
	ldr r3, _08022954 @ =sub_801EE64
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022954 @ =sub_801EE64
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022936
	adds r1, r6, #0
_08022936:
	cmp r1, #0
	beq _08022996
	cmp r1, #0
	bge _0802295E
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080229D6
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _08022958
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	b _080229A4
	.align 2, 0
_08022954: .4byte sub_801EE64
_08022958:
	mov r3, sb
	ldrb r0, [r3]
	b _080229A4
_0802295E:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022968
	rsbs r0, r0, #0
_08022968:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022972
	movs r0, #0xb
_08022972:
	cmp r1, r0
	bgt _08022988
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _08022982
	ldr r1, [sp, #8]
	b _080229A2
_08022982:
	mov r2, sb
	ldrb r0, [r2]
	b _080229A4
_08022988:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _080229D6
_08022996:
	cmp r6, r2
	bge _080229A0
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	b _080229A4
_080229A0:
	mov r1, sb
_080229A2:
	ldrb r0, [r1]
_080229A4:
	adds r1, r0, #0
	mov r2, sl
	str r2, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080229D6
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _080229E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080229D6
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_080229D6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080229E8: .4byte gUnknown_03005424

	thumb_func_start sub_80229EC
sub_80229EC: @ 0x080229EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _08022A84 @ =sub_801EE64
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _08022A84 @ =sub_801EE64
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022A66
	adds r1, r6, #0
_08022A66:
	cmp r1, #0
	beq _08022AC4
	cmp r1, #0
	bge _08022A88
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022B04
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022AC8
	b _08022ACE
	.align 2, 0
_08022A84: .4byte sub_801EE64
_08022A88:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022A92
	rsbs r0, r0, #0
_08022A92:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022A9C
	movs r0, #0xb
_08022A9C:
	cmp r1, r0
	bgt _08022AB6
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022AB0
	mov r2, r8
	b _08022AD0
_08022AB0:
	mov r3, sl
	ldrb r0, [r3]
	b _08022AD2
_08022AB6:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022B04
_08022AC4:
	cmp r6, r2
	bge _08022ACE
_08022AC8:
	mov r1, r8
	ldrb r0, [r1]
	b _08022AD2
_08022ACE:
	mov r2, sl
_08022AD0:
	ldrb r0, [r2]
_08022AD2:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022B04
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022B14 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022B04
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022B04:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022B14: .4byte gUnknown_03005424

	thumb_func_start sub_8022B18
sub_8022B18: @ 0x08022B18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _08022BB0 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _08022BB0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022B92
	adds r1, r6, #0
_08022B92:
	cmp r1, #0
	beq _08022BF0
	cmp r1, #0
	bge _08022BB4
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022C30
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022BF4
	b _08022BFA
	.align 2, 0
_08022BB0: .4byte sub_801ED24
_08022BB4:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022BBE
	rsbs r0, r0, #0
_08022BBE:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022BC8
	movs r0, #0xb
_08022BC8:
	cmp r1, r0
	bgt _08022BE2
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022BDC
	mov r2, r8
	b _08022BFC
_08022BDC:
	mov r3, sl
	ldrb r0, [r3]
	b _08022BFE
_08022BE2:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022C30
_08022BF0:
	cmp r6, r2
	bge _08022BFA
_08022BF4:
	mov r1, r8
	ldrb r0, [r1]
	b _08022BFE
_08022BFA:
	mov r2, sl
_08022BFC:
	ldrb r0, [r2]
_08022BFE:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022C30
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022C40 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022C30
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022C30:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022C40: .4byte gUnknown_03005424

	thumb_func_start sub_8022C44
sub_8022C44: @ 0x08022C44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov sl, r2
	str r2, [sp]
	ldr r3, _08022CD8 @ =sub_801ED24
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _08022CD8 @ =sub_801ED24
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _08022CBA
	adds r1, r6, #0
_08022CBA:
	cmp r1, #0
	beq _08022D18
	cmp r1, #0
	bge _08022CDC
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08022D58
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _08022D1C
	b _08022D22
	.align 2, 0
_08022CD8: .4byte sub_801ED24
_08022CDC:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08022CE6
	rsbs r0, r0, #0
_08022CE6:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _08022CF0
	movs r0, #0xb
_08022CF0:
	cmp r1, r0
	bgt _08022D0A
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _08022D04
	mov r2, sl
	b _08022D24
_08022D04:
	mov r3, sb
	ldrb r0, [r3]
	b _08022D26
_08022D0A:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _08022D58
_08022D18:
	cmp r6, r2
	bge _08022D22
_08022D1C:
	mov r1, sl
	ldrb r0, [r1]
	b _08022D26
_08022D22:
	mov r2, sb
_08022D24:
	ldrb r0, [r2]
_08022D26:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022D58
	adds r2, r7, #0
	adds r2, #0x24
	strb r1, [r2]
	ldr r0, _08022D68 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022D58
	ldrb r1, [r2]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x18
	adds r0, r1, #0
	subs r0, #0x40
	strb r0, [r2]
_08022D58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022D68: .4byte gUnknown_03005424

	thumb_func_start sub_8022D6C
sub_8022D6C: @ 0x08022D6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r1, #0
	ldr r3, [r4, #0x20]
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08022D8C
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	b _08022F4E
_08022D8C:
	ldr r0, _08022E40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r4, #0
	adds r7, #0x24
	cmp r0, #0
	bne _08022E90
	ldr r0, _08022E44 @ =gUnknown_03005660
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #1
	bne _08022E90
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	asrs r5, r0, #0x10
	movs r2, #4
	rsbs r2, r2, #0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	mov r8, r1
	mov r6, ip
	movs r1, #4
	ldrsh r0, [r6, r1]
	mov r6, r8
	subs r0, r0, r6
	ands r0, r2
	lsls r0, r0, #0x10
	ands r5, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r5, r0
	bne _08022E78
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08022E78
	ldrb r0, [r7]
	adds r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	bhi _08022E78
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08022E78
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08022DF4
	rsbs r1, r1, #0
_08022DF4:
	ldr r0, _08022E48 @ =0x000005FF
	cmp r1, r0
	ble _08022E78
	adds r0, r4, #0
	bl sub_80228C0
	lsls r1, r5, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	blt _08022E54
	ldr r1, [r4, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xa
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08022E26
	orrs r1, r2
	str r1, [r4, #0x20]
	ldr r0, _08022E4C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08022E26
	bl sub_80117F0
_08022E26:
	ldr r0, _08022E50 @ =0x00000119
	bl m4aSongNumStartOrContinue
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strb r0, [r7]
	ldr r0, [r4, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	b _08022E6A
	.align 2, 0
_08022E40: .4byte gCurrentLevel
_08022E44: .4byte gUnknown_03005660
_08022E48: .4byte 0x000005FF
_08022E4C: .4byte gGameMode
_08022E50: .4byte 0x00000119
_08022E54:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E66
	ldr r0, _08022E70 @ =0x00000119
	bl m4aSongNumStop
_08022E66:
	ldr r0, [r4, #0x20]
	ldr r1, _08022E74 @ =0xFFFDFFFF
_08022E6A:
	ands r0, r1
	str r0, [r4, #0x20]
	b _08022F4E
	.align 2, 0
_08022E70: .4byte 0x00000119
_08022E74: .4byte 0xFFFDFFFF
_08022E78:
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08022E90
	ldr r0, _08022EC0 @ =0xFFFDFFFF
	ands r1, r0
	str r1, [r4, #0x20]
	ldr r0, _08022EC4 @ =0x00000119
	bl m4aSongNumStop
_08022E90:
	ldr r0, _08022EC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08022EF4
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r0, r0, #0x18
	subs r0, #0x40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022ECC
	cmp r0, #0
	bgt _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
	.align 2, 0
_08022EC0: .4byte 0xFFFDFFFF
_08022EC4: .4byte 0x00000119
_08022EC8: .4byte gUnknown_03005424
_08022ECC:
	cmp r0, #0
	ble _08022ED4
	lsls r0, r1, #0x18
	b _08022ED8
_08022ED4:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022ED8:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	ble _08022F20
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	bne _08022F4E
	adds r0, r4, #0
	bl sub_8022C44
	b _08022F4E
_08022EF4:
	movs r0, #0
	ldrsb r0, [r7, r0]
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _08022F08
	cmp r0, #0
	bgt _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F08:
	cmp r0, #0
	ble _08022F10
	lsls r0, r1, #0x18
	b _08022F14
_08022F10:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08022F14:
	lsrs r1, r0, #0x18
	lsrs r0, r1, #6
	cmp r0, #1
	beq _08022F40
	cmp r0, #1
	bgt _08022F26
_08022F20:
	cmp r0, #0
	beq _08022F30
	b _08022F4E
_08022F26:
	cmp r0, #2
	beq _08022F38
	cmp r0, #3
	beq _08022F48
	b _08022F4E
_08022F30:
	adds r0, r4, #0
	bl sub_80228C0
	b _08022F4E
_08022F38:
	adds r0, r4, #0
	bl sub_80229EC
	b _08022F4E
_08022F40:
	adds r0, r4, #0
	bl sub_8022B18
	b _08022F4E
_08022F48:
	adds r0, r4, #0
	bl sub_8022C44
_08022F4E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8022F58
sub_8022F58: @ 0x08022F58
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	adds r1, #0x29
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r4, r0, #6
	cmp r4, #1
	beq _08022FA6
	cmp r4, #1
	bgt _08022F82
	cmp r4, #0
	beq _08022F8C
	b _0802301C
_08022F82:
	cmp r4, #2
	beq _08022FDC
	cmp r4, #3
	beq _08022FEA
	b _0802301C
_08022F8C:
	mov r4, sp
	add r2, sp, #4
	adds r0, r3, #0
	mov r1, sp
	bl sub_8029BB8
_08022F98:
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08023002
	b _08023006
_08022FA6:
	mov r5, sp
	add r2, sp, #8
	adds r0, r3, #0
	mov r1, sp
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r5]
	ands r4, r2
	cmp r4, #0
	beq _08022FC0
	strb r6, [r5]
	b _0802301A
_08022FC0:
	ldr r0, _08022FD8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802301A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r5]
	b _0802301A
	.align 2, 0
_08022FD8: .4byte gUnknown_03005424
_08022FDC:
	mov r4, sp
	add r2, sp, #0xc
	adds r0, r3, #0
	mov r1, sp
	bl sub_8021B08
	b _08022F98
_08022FEA:
	mov r4, sp
	add r2, sp, #0x10
	adds r0, r3, #0
	mov r1, sp
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08023006
_08023002:
	strb r6, [r4]
	b _0802301A
_08023006:
	ldr r0, _08023028 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802301A
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r4]
_0802301A:
	adds r6, r3, #0
_0802301C:
	adds r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023028: .4byte gUnknown_03005424

	thumb_func_start sub_802302C
sub_802302C: @ 0x0802302C
	push {r4, r5, lr}
	sub sp, #8
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	ldr r0, [r1, #0xc]
	asrs r4, r0, #8
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	lsls r0, r2, #0x18
	asrs r3, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802305E
	cmp r3, #0
	bgt _08023062
	b _08023068
_0802305E:
	cmp r3, #0
	bgt _08023068
_08023062:
	adds r0, r2, #0
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08023068:
	lsrs r2, r0, #0x18
	lsrs r3, r2, #6
	cmp r3, #1
	beq _080230CC
	cmp r3, #1
	bgt _0802307A
	cmp r3, #0
	beq _08023084
	b _0802311C
_0802307A:
	cmp r3, #2
	beq _080230A4
	cmp r3, #3
	beq _080230F4
	b _0802311C
_08023084:
	adds r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	str r3, [sp]
	ldr r1, _080230A0 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	b _0802310E
	.align 2, 0
_080230A0: .4byte sub_801EE64
_080230A4:
	subs r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230C8 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230C8: .4byte sub_801EE64
_080230CC:
	subs r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230F0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230F0: .4byte sub_801ED24
_080230F4:
	adds r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, _08023118 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
_0802310E:
	movs r3, #8
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_08023118: .4byte sub_801ED24
_0802311C:
	movs r0, #0
_0802311E:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8023128
sub_8023128: @ 0x08023128
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080231BA
	movs r1, #0x40
	cmp r0, #0
	blt _0802313C
	movs r1, #0xc0
_0802313C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _080231BA
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _08023182
	cmp r1, #1
	bgt _0802316E
	cmp r1, #0
	beq _08023178
	b _080231AE
_0802316E:
	cmp r1, #2
	beq _08023188
	cmp r1, #3
	beq _0802319A
	b _080231AE
_08023178:
	ldr r0, [r4, #0xc]
	adds r0, r0, r2
	str r0, [r4, #0xc]
	strh r1, [r4, #0x12]
	b _080231AE
_08023182:
	ldr r0, [r4, #8]
	subs r0, r0, r2
	b _0802319E
_08023188:
	ldr r0, [r4, #0xc]
	subs r0, r0, r2
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	orrs r0, r1
	str r0, [r4, #0x20]
	b _080231AE
_0802319A:
	ldr r0, [r4, #8]
	adds r0, r0, r2
_0802319E:
	str r0, [r4, #8]
	movs r2, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	strh r2, [r4, #0x14]
_080231AE:
	adds r0, r4, #0
	adds r0, #0x62
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_080231BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80231C0
sub_80231C0: @ 0x080231C0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08023258
	movs r1, #0x40
	cmp r0, #0
	blt _080231D4
	movs r1, #0xc0
_080231D4:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _08023258
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0802321A
	cmp r1, #1
	bgt _08023206
	cmp r1, #0
	beq _08023210
	b _08023258
_08023206:
	cmp r1, #2
	beq _08023220
	cmp r1, #3
	beq _08023232
	b _08023258
_08023210:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	strh r1, [r5, #0x12]
	b _08023258
_0802321A:
	ldr r0, [r5, #8]
	subs r0, r0, r2
	b _08023236
_08023220:
	ldr r0, [r5, #0xc]
	subs r0, r0, r2
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	orrs r0, r1
	str r0, [r5, #0x20]
	b _08023258
_08023232:
	ldr r0, [r5, #8]
	adds r0, r0, r2
_08023236:
	str r0, [r5, #8]
	movs r4, #0
	strh r4, [r5, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r4, [r5, #0x14]
_08023258:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023260
sub_8023260: @ 0x08023260
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x40]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	ble _08023276
	strh r4, [r2, #0x14]
	b _08023282
_08023276:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmn r0, r3
	bge _08023282
	rsbs r0, r4, #0
	strh r0, [r2, #0x14]
_08023282:
	movs r0, #0x14
	ldrsh r4, [r2, r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldr r5, _080232CC @ =gSineTable
	ldrb r3, [r0]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x10]
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080232B0
	strh r1, [r2, #0x12]
_080232B0:
	lsls r0, r3, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	ldrh r1, [r2, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080232CC: .4byte gSineTable

	thumb_func_start sub_80232D0
sub_80232D0: @ 0x080232D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080233A0 @ =gCamera
	ldr r0, [r7, #8]
	mov r8, r0
	ldr r1, [r7, #0xc]
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080232F4
	b _08023486
_080232F4:
	ldr r1, _080233A4 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _08023316
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08023312
	ldr r0, _080233A8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023316
_08023312:
	cmp r1, #0x1d
	bne _080233C4
_08023316:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023324
	b _08023486
_08023324:
	ldr r0, _080233AC @ =gUnknown_080D650C
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r0, r2, r0
	ldr r1, [r0]
	cmp r1, #0
	bge _08023336
	b _08023486
_08023336:
	lsls r0, r1, #8
	cmp r8, r0
	bge _0802333E
	b _08023486
_0802333E:
	ldr r0, _080233B0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r5, [r1]
	adds r0, #4
	adds r0, r2, r0
	ldr r6, [r0]
	lsls r3, r5, #8
	add r8, r3
	lsls r1, r6, #8
	add sb, r1
	ldr r0, _080233B4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023366
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_08023366:
	ldr r0, _080233B8 @ =gUnknown_030054FC
	str r3, [r0]
	ldr r0, _080233BC @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r3, #0
	bl sub_8039F14
	ldr r1, _080233C0 @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r5
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r5
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	adds r0, r0, r6
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r6
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x14]
	adds r0, r0, r6
	str r0, [r4, #0x14]
	b _08023486
	.align 2, 0
_080233A0: .4byte gCamera
_080233A4: .4byte gCurrentLevel
_080233A8: .4byte gUnknown_030054B0
_080233AC: .4byte gUnknown_080D650C
_080233B0: .4byte gUnknown_080D661C
_080233B4: .4byte gUnknown_030056A4
_080233B8: .4byte gUnknown_030054FC
_080233BC: .4byte gUnknown_030054E0
_080233C0: .4byte gUnknown_03005430
_080233C4:
	ldr r0, _080234B4 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08023486
	ldr r0, _080234B8 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08023486
	ldr r0, _080234BC @ =gUnknown_080D650C
	mov r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r1, r2, r0
	ldr r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	blt _08023432
	lsls r0, r1, #8
	cmp r8, r0
	blt _08023432
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08023432
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08023432
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, #8
	add r8, r3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, _080234C4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023432
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
_08023432:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #3
	adds r0, r5, #4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	blt _08023486
	lsls r0, r0, #8
	cmp sb, r0
	blt _08023486
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08023486
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023486
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	lsls r1, r0, #8
	lsls r3, r0, #0x10
	add sb, r3
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0x24]
	ldr r0, _080234C4 @ =gUnknown_030056A4
	ldr r2, [r0]
	cmp r2, #0
	beq _08023486
	ldr r0, [r2, #4]
	adds r0, r0, r3
	str r0, [r2, #4]
_08023486:
	ldr r1, [r7, #0x20]
	ldr r0, _080234C8 @ =0x80000080
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0x80
	bne _08023494
	b _08023604
_08023494:
	ldr r5, _080234CC @ =gCamera
	ldr r3, [r7, #0xc]
	cmp r6, #0
	blt _0802351C
	ldr r2, _080234D0 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234D4
	ldr r0, [r5, #0x28]
	lsls r0, r0, #8
	cmp r3, r0
	bgt _080234E0
	b _080234E6
	.align 2, 0
_080234B4: .4byte gPlayer
_080234B8: .4byte gUnknown_030054F4
_080234BC: .4byte gUnknown_080D650C
_080234C0: .4byte gUnknown_080D661C
_080234C4: .4byte gUnknown_030056A4
_080234C8: .4byte 0x80000080
_080234CC: .4byte gCamera
_080234D0: .4byte gUnknown_03005424
_080234D4:
	ldr r0, [r5, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	movs r1, #1
	cmp r3, r0
	bge _080234E2
_080234E0:
	movs r1, #0
_080234E2:
	cmp r1, #0
	beq _0802351C
_080234E6:
	movs r0, #0x80
	orrs r0, r6
	str r0, [r7, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080234FC
	ldr r0, _080234F8 @ =0x0000FD60
	b _080234FE
	.align 2, 0
_080234F8: .4byte 0x0000FD60
_080234FC:
	ldr r0, _08023510 @ =0x0000FB20
_080234FE:
	strh r0, [r7, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023514
	ldr r0, [r4, #0x28]
	lsls r0, r0, #8
	b _0802351A
	.align 2, 0
_08023510: .4byte 0x0000FB20
_08023514:
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
_0802351A:
	mov sb, r0
_0802351C:
	ldr r1, _08023548 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _0802353E
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802353A
	ldr r0, _0802354C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802353E
_0802353A:
	cmp r1, #0x1d
	bne _08023558
_0802353E:
	ldr r0, _08023550 @ =gUnknown_03005440
	ldrh r2, [r0]
	ldr r0, _08023554 @ =gUnknown_030054BC
	ldrh r3, [r0]
	b _0802355C
	.align 2, 0
_08023548: .4byte gCurrentLevel
_0802354C: .4byte gUnknown_030054B0
_08023550: .4byte gUnknown_03005440
_08023554: .4byte gUnknown_030054BC
_08023558:
	ldr r2, [r4, #0x28]
	ldr r3, [r4, #0x2c]
_0802355C:
	mov r5, r8
	mov r6, sb
	ldr r0, [r4, #0x30]
	lsls r0, r0, #8
	cmp r8, r0
	blt _08023576
	ldr r0, [r4, #0x34]
	lsls r0, r0, #8
	subs r1, r0, #1
	mov r0, r8
	cmp r0, r1
	ble _08023576
	adds r0, r1, #0
_08023576:
	mov r8, r0
	lsls r0, r2, #8
	cmp sb, r0
	blt _0802358A
	lsls r0, r3, #8
	subs r1, r0, #1
	mov r0, sb
	cmp r0, r1
	ble _0802358A
	adds r0, r1, #0
_0802358A:
	mov sb, r0
	cmp r8, r5
	beq _08023596
	movs r0, #0
	strh r0, [r7, #0x10]
	strh r0, [r7, #0x14]
_08023596:
	cmp sb, r6
	beq _080235A0
	movs r0, #0
	strh r0, [r7, #0x12]
	strh r0, [r7, #0x14]
_080235A0:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080235C0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080235BC
	ldr r0, _080235E4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080235C0
_080235BC:
	cmp r1, #0x1d
	bne _080235FC
_080235C0:
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r8, r1
	bge _080235E8
	mov r8, r1
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x20]
	b _080235FC
	.align 2, 0
_080235E4: .4byte gUnknown_030054B0
_080235E8:
	movs r1, #0x9c
	lsls r1, r1, #9
	adds r0, r0, r1
	cmp r8, r0
	ble _080235FC
	mov r8, r0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
_080235FC:
	mov r2, r8
	str r2, [r7, #8]
	mov r0, sb
	str r0, [r7, #0xc]
_08023604:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8023610
sub_8023610: @ 0x08023610
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, [r0, #0x48]
	lsls r5, r0, #1
	mov r0, ip
	ldr r6, [r0, #0x44]
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #0x14
	beq _080236C0
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r7, #0x10
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _080236C0
	mov r0, ip
	ldrh r2, [r0, #0x10]
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0802367C
	cmp r4, #0x3f
	beq _0802365A
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0802365A
	movs r0, #1
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0802365A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r6, #0
	cmp r0, r1
	bge _080236BC
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _080236BC
	lsls r0, r1, #0x10
	b _080236BA
_0802367C:
	adds r0, r7, #0
	ands r0, r3
	cmp r0, #0
	beq _080236BC
	cmp r4, #0x3f
	beq _0802369C
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0802369C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0802369C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _080236BC
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	bge _080236BC
	lsls r0, r6, #0x10
_080236BA:
	lsrs r2, r0, #0x10
_080236BC:
	mov r1, ip
	strh r2, [r1, #0x10]
_080236C0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80236C8
sub_80236C8: @ 0x080236C8
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _080236EC @ =0x0000BCFF
	cmp r1, r0
	bls _08023702
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x15
	cmp r0, #0
	bge _080236F0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08023700
	b _080236FE
	.align 2, 0
_080236EC: .4byte 0x0000BCFF
_080236F0:
	cmp r0, #0
	ble _08023702
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08023700
_080236FE:
	movs r1, #0
_08023700:
	strh r1, [r2, #0x10]
_08023702:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023708
sub_8023708: @ 0x08023708
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0802372C @ =0x0000BCFF
	cmp r1, r0
	bls _08023742
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _08023730
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _08023740
	b _0802373E
	.align 2, 0
_0802372C: .4byte 0x0000BCFF
_08023730:
	cmp r0, #0
	ble _08023742
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08023740
_0802373E:
	movs r1, #0
_08023740:
	strh r1, [r2, #0x10]
_08023742:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023748
sub_8023748: @ 0x08023748
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x37
	ldrb r1, [r4]
	cmp r1, #0
	beq _08023850
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0802377C
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802377C
	ldr r0, _080237E0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	ldrb r1, [r4]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r4]
_0802377C:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _080237AA
	ldrh r0, [r5, #0x30]
	subs r0, #1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080237AA
	ldr r0, _080237E0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4]
_080237AA:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023822
	ldrh r0, [r5, #0x2e]
	subs r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08023822
	ldrb r0, [r4]
	movs r1, #0xfd
	ands r1, r0
	strb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080237E8
	ldr r0, _080237E4 @ =gPlayer
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A7A8
	b _080237FE
	.align 2, 0
_080237E0: .4byte gMPlayInfo_BGM
_080237E4: .4byte gPlayer
_080237E8:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080237FE
	ldr r0, _08023858 @ =gPlayer
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A8F8
_080237FE:
	ldr r0, _0802385C @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08023860 @ =gSongTable
	adds r0, #0xe8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08023822
	ldr r1, _08023864 @ =gLevelSongs
	ldr r0, _08023868 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08023822:
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08023850
	ldrh r0, [r5, #0x34]
	subs r0, #1
	strh r0, [r5, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08023850
	ldrb r1, [r4]
	movs r0, #0xdf
	ands r0, r1
	strb r0, [r4]
	ldr r2, _0802386C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08023870 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08023874 @ =gWinRegs
	movs r0, #0x3f
	strh r0, [r1, #0xa]
_08023850:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023858: .4byte gPlayer
_0802385C: .4byte gMPlayTable
_08023860: .4byte gSongTable
_08023864: .4byte gLevelSongs
_08023868: .4byte gCurrentLevel
_0802386C: .4byte gDispCnt
_08023870: .4byte 0x00007FFF
_08023874: .4byte gWinRegs

	thumb_func_start sub_8023878
sub_8023878: @ 0x08023878
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	ldr r0, _08023944 @ =0xFFFFEFFF
	ands r2, r0
	str r2, [r4, #0x20]
	ldr r0, _08023948 @ =gUnknown_03005660
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	beq _08023890
	b _08023A60
_08023890:
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _0802389A
	b _08023A60
_0802389A:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	subs r0, #4
	movs r5, #4
	ldrsh r1, [r3, r5]
	cmp r0, r1
	bge _080238AA
	b _08023A60
_080238AA:
	movs r1, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x88
	cmp r0, #0
	bne _08023912
	orrs r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
	str r2, [r4, #0x20]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _080238EE
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _08023912
_080238EE:
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bgt _08023912
	movs r0, #0xa
	strb r0, [r5]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #4
	ldrsh r1, [r3, r2]
	bl sub_80118FC
	movs r0, #0x9c
	bl m4aSongNumStart
_08023912:
	adds r1, r4, #0
	adds r1, #0x87
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	adds r7, r1, #0
	cmp r0, #0
	bgt _08023A00
	adds r0, r4, #0
	adds r0, #0x86
	ldrb r1, [r0]
	subs r2, r1, #1
	strb r2, [r0]
	subs r1, #2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r6, r0, #0
	cmp r1, #0xa
	bhi _080239D2
	lsls r0, r1, #2
	ldr r1, _0802394C @ =_08023950
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023944: .4byte 0xFFFFEFFF
_08023948: .4byte gUnknown_03005660
_0802394C: .4byte _08023950
_08023950: @ jump table
	.4byte _080239CA @ case 0
	.4byte _080239D2 @ case 1
	.4byte _080239C0 @ case 2
	.4byte _080239D2 @ case 3
	.4byte _080239B6 @ case 4
	.4byte _080239D2 @ case 5
	.4byte _080239AC @ case 6
	.4byte _080239D2 @ case 7
	.4byte _080239A2 @ case 8
	.4byte _0802397C @ case 9
	.4byte _08023998 @ case 10
_0802397C:
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080239D2
	ldr r1, _08023994 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #4]
	b _080239D2
	.align 2, 0
_08023994: .4byte gUnknown_030054A8
_08023998:
	adds r0, r4, #0
	movs r1, #5
	bl sub_802AF60
	b _080239D2
_080239A2:
	adds r0, r4, #0
	movs r1, #4
	bl sub_802AF60
	b _080239D2
_080239AC:
	adds r0, r4, #0
	movs r1, #3
	bl sub_802AF60
	b _080239D2
_080239B6:
	adds r0, r4, #0
	movs r1, #2
	bl sub_802AF60
	b _080239D2
_080239C0:
	adds r0, r4, #0
	movs r1, #1
	bl sub_802AF60
	b _080239D2
_080239CA:
	adds r0, r4, #0
	movs r1, #0
	bl sub_802AF60
_080239D2:
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bge _080239FC
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, _08023A48 @ =0xFFFFF400
	adds r1, r1, r2
	movs r2, #0
	movs r3, #1
	bl sub_802B018
	adds r0, r4, #0
	bl sub_802B3BC
_080239FC:
	movs r0, #0x3c
	strb r0, [r7]
_08023A00:
	ldr r0, _08023A4C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023B02
	ldr r2, _08023A50 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08023A54 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08023A58 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08023B02
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r0, #0
	beq _08023A34
	ldr r1, _08023A5C @ =0xFFFFFC00
_08023A34:
	ldr r0, [r4, #8]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	ldr r2, _08023A5C @ =0xFFFFFC00
	adds r1, r1, r2
	movs r2, #0
	movs r3, #0
	bl sub_802B018
	b _08023B02
	.align 2, 0
_08023A48: .4byte 0xFFFFF400
_08023A4C: .4byte gUnknown_03005590
_08023A50: .4byte gPseudoRandom
_08023A54: .4byte 0x00196225
_08023A58: .4byte 0x3C6EF35F
_08023A5C: .4byte 0xFFFFFC00
_08023A60:
	ldr r1, [r4, #0x20]
	movs r0, #0x40
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x88
	cmp r0, #0
	beq _08023AC2
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r1, r0
	str r1, [r4, #0x20]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _08023A9E
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _08023AC2
_08023A9E:
	adds r0, r4, #0
	adds r0, #0x88
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bgt _08023AC2
	movs r0, #0xa
	strb r0, [r5]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #4
	ldrsh r1, [r3, r2]
	bl sub_80118FC
	movs r0, #0x9c
	bl m4aSongNumStart
_08023AC2:
	adds r1, r4, #0
	adds r1, #0x87
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08023B1C @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08023B20 @ =gSongTable
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08023B02
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08023B02
	ldr r1, _08023B24 @ =gLevelSongs
	ldr r0, _08023B28 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08023B02:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08023B2C
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	lsls r0, r0, #1
	b _08023B44
	.align 2, 0
_08023B1C: .4byte gMPlayTable
_08023B20: .4byte gSongTable
_08023B24: .4byte gLevelSongs
_08023B28: .4byte gCurrentLevel
_08023B2C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08023B46
	ldr r0, [r4, #0x40]
	asrs r0, r0, #2
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #2
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #2
_08023B44:
	str r0, [r4, #0x4c]
_08023B46:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08023B54
	subs r0, r1, #1
	strb r0, [r5]
_08023B54:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023B5C
sub_8023B5C: @ 0x08023B5C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	cmp r0, r4
	beq _08023C0A
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r2, [r0]
	ldr r0, _08023BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023B8E
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08023B8E:
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0
	ble _08023BA8
	cmp r2, #0
	beq _08023BA4
	subs r0, #1
	b _08023BAC
	.align 2, 0
_08023BA0: .4byte gUnknown_03005424
_08023BA4:
	movs r2, #0x20
	b _08023BB4
_08023BA8:
	cmp r2, #0
	beq _08023BB2
_08023BAC:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08023BB4
_08023BB2:
	movs r2, #0x1f
_08023BB4:
	lsrs r0, r2, #6
	cmp r0, #1
	beq _08023BEE
	cmp r0, #1
	bgt _08023BC4
	cmp r0, #0
	beq _08023BCE
	b _08023C0A
_08023BC4:
	cmp r0, #2
	beq _08023BDE
	cmp r0, #3
	beq _08023BFC
	b _08023C0A
_08023BCE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BDE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r3, #0xc]
	b _08023C0A
_08023BEE:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	b _08023C08
_08023BFC:
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r1, r4, r1
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	subs r0, r0, r1
_08023C08:
	str r0, [r3, #8]
_08023C0A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8023C10
sub_8023C10: @ 0x08023C10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bge _08023CFE
	movs r0, #0x14
	ldrsh r3, [r4, r0]
	ldr r2, _08023C40 @ =gInput
	ldrh r1, [r2]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08023C4A
	adds r3, #0x20
	cmp r3, #0
	blt _08023C44
	adds r0, r3, #0
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	ble _08023C46
	adds r0, r1, #0
	b _08023C46
	.align 2, 0
_08023C40: .4byte gInput
_08023C44:
	movs r0, #0
_08023C46:
	adds r3, r0, #0
	b _08023C4C
_08023C4A:
	movs r3, #0
_08023C4C:
	strh r3, [r4, #0x14]
	ldrh r0, [r2]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _08023C60
	cmp r1, #0x20
	bne _08023C64
	rsbs r0, r3, #0
	b _08023C66
_08023C60:
	strh r3, [r4, #0x10]
	b _08023C68
_08023C64:
	movs r0, #0
_08023C66:
	strh r0, [r4, #0x10]
_08023C68:
	ldrh r0, [r2]
	movs r1, #0xc0
	ands r1, r0
	cmp r1, #0x40
	beq _08023C7C
	cmp r1, #0x80
	beq _08023C82
	movs r0, #0
	strh r0, [r4, #0x12]
	b _08023C84
_08023C7C:
	rsbs r0, r3, #0
	strh r0, [r4, #0x12]
	b _08023C84
_08023C82:
	strh r3, [r4, #0x12]
_08023C84:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08023CCC @ =gUnknown_03005424
	ldr r1, _08023CD0 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023CA6
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08023CA6:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08023CB6
	adds r2, r1, #0
_08023CB6:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023CD4
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08023CDC
	.align 2, 0
_08023CCC: .4byte gUnknown_03005424
_08023CD0: .4byte gUnknown_0300544C
_08023CD4:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08023CDC:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, _08023D04 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023CFE
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_801FD34
_08023CFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023D04: .4byte gPressedKeys

	thumb_func_start sub_8023D08
sub_8023D08: @ 0x08023D08
	push {r4, r5, r6, lr}
	ldr r0, _08023D70 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r5, [r1, #4]
	cmp r5, #0
	beq _08023D1E
	b _08023E84
_08023D1E:
	ldr r0, _08023D74 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08023DA0
	adds r0, r2, #0
	bl TaskDestroy
	ldr r0, _08023D78 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08023D50
	ldr r0, _08023D7C @ =gUnknown_03005490
	ldr r2, [r0]
	ldr r0, _08023D80 @ =0x00008CA0
	cmp r2, r0
	bhi _08023D68
	ldr r0, _08023D84 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08023D50
	cmp r2, #0
	beq _08023D68
_08023D50:
	ldr r0, _08023D74 @ =gGameMode
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08023D88
	ldr r0, _08023D7C @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _08023D80 @ =0x00008CA0
	cmp r1, r0
	bls _08023D88
_08023D68:
	bl sub_801B6B4
	b _08023E88
	.align 2, 0
_08023D70: .4byte gCurTask
_08023D74: .4byte gGameMode
_08023D78: .4byte gLoadedSaveGame
_08023D7C: .4byte gUnknown_03005490
_08023D80: .4byte 0x00008CA0
_08023D84: .4byte gUnknown_03005424
_08023D88:
	ldr r0, _08023D98 @ =gCourseTime
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08023D9C @ =gUnknown_030054F4
	strb r1, [r0]
	bl sub_801AE48
	b _08023E88
	.align 2, 0
_08023D98: .4byte gCourseTime
_08023D9C: .4byte gUnknown_030054F4
_08023DA0:
	ldr r1, _08023E50 @ =gCourseTime
	strh r5, [r1]
	cmp r0, #3
	bne _08023DAC
	movs r0, #1
	strh r0, [r1]
_08023DAC:
	ldr r1, _08023E54 @ =gUnknown_030054F4
	movs r0, #0
	strb r0, [r1]
	ldr r6, _08023E58 @ =gPlayer
	adds r0, r6, #0
	bl sub_8021694
	ldr r4, _08023E5C @ =gCamera
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r4]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r4, #4]
	ldr r0, _08023E60 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r5, [r6, #0x20]
	ldr r2, _08023E64 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08023E68 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r2, r6, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r5, _08023E6C @ =0xFFFFCFFF
	ands r0, r5
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #6
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r2, #4
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ands r0, r5
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r4, #0x50
	ldrh r1, [r4]
	ldr r0, _08023E70 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08023E3E
	ldr r0, _08023E74 @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _08023E3E
	ldr r0, [r6, #8]
	str r0, [r1]
	ldr r0, [r6, #0xc]
	str r0, [r1, #4]
_08023E3E:
	ldr r0, _08023E78 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08023E7C @ =sub_8023FC0
	str r0, [r1, #8]
	ldr r1, _08023E58 @ =gPlayer
	ldr r0, _08023E80 @ =sub_8025318
	str r0, [r1]
	b _08023E88
	.align 2, 0
_08023E50: .4byte gCourseTime
_08023E54: .4byte gUnknown_030054F4
_08023E58: .4byte gPlayer
_08023E5C: .4byte gCamera
_08023E60: .4byte gMPlayInfo_BGM
_08023E64: .4byte gUnknown_03005424
_08023E68: .4byte 0x0000FF7F
_08023E6C: .4byte 0xFFFFCFFF
_08023E70: .4byte 0x0000FFFC
_08023E74: .4byte gUnknown_030056A4
_08023E78: .4byte gCurTask
_08023E7C: .4byte sub_8023FC0
_08023E80: .4byte sub_8025318
_08023E84:
	subs r5, #1
	str r5, [r1, #4]
_08023E88:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023E90
sub_8023E90: @ 0x08023E90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08023EB4 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r6, [r0]
	adds r0, #4
	ldr r0, [r0]
	mov r8, r0
	ldr r5, _08023EB8 @ =gCamera
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x20]
	adds r7, r4, #0
	cmp r0, #0
	bge _08023EC0
	ldr r2, _08023EBC @ =gUnknown_03005424
	b _08023F34
	.align 2, 0
_08023EB4: .4byte gPlayer
_08023EB8: .4byte gCamera
_08023EBC: .4byte gUnknown_03005424
_08023EC0:
	ldr r2, _08023ED8 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023EDC
	ldr r0, [r5, #4]
	subs r0, #0x50
	lsls r0, r0, #8
	cmp r3, r0
	bgt _08023EEA
	b _08023EF0
	.align 2, 0
_08023ED8: .4byte gUnknown_03005424
_08023EDC:
	ldr r0, [r5, #4]
	lsls r0, r0, #8
	ldr r1, _08023F24 @ =0x0000EFFF
	adds r0, r0, r1
	movs r1, #1
	cmp r3, r0
	bge _08023EEC
_08023EEA:
	movs r1, #0
_08023EEC:
	cmp r1, #0
	beq _08023F34
_08023EF0:
	ldr r5, _08023F28 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0x3c
	str r1, [r0, #4]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r7, #0x20]
	ldr r0, _08023F2C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08023F1A
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8024B10
_08023F1A:
	ldr r1, [r5]
	ldr r0, _08023F30 @ =sub_8023D08
	str r0, [r1, #8]
	b _08023FB6
	.align 2, 0
_08023F24: .4byte 0x0000EFFF
_08023F28: .4byte gCurTask
_08023F2C: .4byte gGameMode
_08023F30: .4byte sub_8023D08
_08023F34:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023F44
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08023F48
_08023F44:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08023F48:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r1, _08023F90 @ =gUnknown_0300544C
	ldrh r0, [r2]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023F6A
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08023F6A:
	ldrh r3, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08023F7A
	adds r3, r1, #0
_08023F7A:
	strh r3, [r4, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023F94
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08023F9C
	.align 2, 0
_08023F90: .4byte gUnknown_0300544C
_08023F94:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08023F9C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_802486C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8024B10
	adds r0, r4, #0
	mov r1, r8
	bl sub_8024F74
_08023FB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8023FC0
sub_8023FC0: @ 0x08023FC0
	push {r4, r5, r6, r7, lr}
	ldr r5, _08024014 @ =gPlayer
	adds r0, r5, #0
	bl sub_802989C
	adds r0, r5, #0
	bl sub_80298DC
	adds r0, r5, #0
	bl sub_802A1C8
	adds r0, r5, #0
	bl sub_8029990
	ldr r0, _08024018 @ =gUnknown_030054FC
	movs r1, #0
	str r1, [r0]
	ldr r0, _0802401C @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r5, #0
	bl sub_802460C
	adds r0, r5, #0
	bl sub_800DF8C
	adds r0, r5, #0
	bl sub_8023878
	adds r0, r5, #0
	bl sub_8024228
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08024020
	ldr r1, [r5]
	adds r0, r5, #0
	bl _call_via_r1
	b _08024046
	.align 2, 0
_08024014: .4byte gPlayer
_08024018: .4byte gUnknown_030054FC
_0802401C: .4byte gUnknown_030054E0
_08024020:
	ldr r0, _080240EC @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08024040
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802403C
	ldr r0, _080240F0 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024040
_0802403C:
	cmp r1, #0x1d
	bne _08024046
_08024040:
	adds r0, r5, #0
	bl sub_80232D0
_08024046:
	adds r4, r5, #0
	adds r4, #0x90
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_802486C
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_8024B10
	adds r0, r5, #0
	adds r0, #0x94
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_8024F74
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0x14
	beq _08024082
	ldrh r1, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08024082
	subs r0, r1, #1
	strh r0, [r5, #0x2c]
_08024082:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08024094
	subs r0, r2, #1
	strb r0, [r1]
_08024094:
	adds r0, r5, #0
	bl sub_8023748
	bl sub_8015790
	bl sub_80156D0
	ldr r2, [r5, #0x20]
	ldr r0, _080240F4 @ =0xFFFFF7FF
	ands r2, r0
	str r2, [r5, #0x20]
	ldr r1, _080240F8 @ =gUnknown_030054C0
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1]
	movs r3, #0
	strh r3, [r1, #4]
	ldr r1, _080240FC @ =gUnknown_03005498
	ldr r0, _08024100 @ =0x00009C40
	str r0, [r1]
	str r3, [r1, #4]
	movs r0, #0x80
	ands r2, r0
	cmp r2, #0
	bne _080240C8
	b _08024222
_080240C8:
	ldr r7, _08024104 @ =gCamera
	ldr r0, _08024108 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802410C @ =sub_8023E90
	str r0, [r1, #8]
	movs r0, #0x16
	strh r0, [r6]
	strh r3, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _08024110 @ =0xFFFFFC00
	cmp r1, r0
	bge _08024114
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0802411A
	.align 2, 0
_080240EC: .4byte gCurrentLevel
_080240F0: .4byte gUnknown_030054B0
_080240F4: .4byte 0xFFFFF7FF
_080240F8: .4byte gUnknown_030054C0
_080240FC: .4byte gUnknown_03005498
_08024100: .4byte 0x00009C40
_08024104: .4byte gCamera
_08024108: .4byte gCurTask
_0802410C: .4byte sub_8023E90
_08024110: .4byte 0xFFFFFC00
_08024114:
	cmp r1, #0
	ble _0802411A
	strh r3, [r5, #0x12]
_0802411A:
	movs r1, #0
	movs r2, #0
	movs r0, #2
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
	adds r2, r7, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08024200 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024156
	ldr r0, _08024204 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #1
	orrs r1, r2
	strh r1, [r0]
_08024156:
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	ldr r1, _08024208 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r6, _0802420C @ =gMPlayTable
	ldr r1, [r6]
	ldr r4, _08024210 @ =gSongTable
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _080241A0
	ldr r1, _08024214 @ =gLevelSongs
	ldr r0, _08024218 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_080241A0:
	ldr r0, [r6]
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bne _080241C2
	ldr r1, _08024214 @ =gLevelSongs
	ldr r0, _08024218 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_080241C2:
	movs r0, #0x1f
	bl m4aSongNumStop
	adds r4, r5, #0
	adds r4, #0x85
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #2
	bne _080241DA
	movs r0, #0x78
	bl m4aSongNumStop
_080241DA:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _080241E8
	movs r0, #0xe3
	bl m4aSongNumStop
_080241E8:
	adds r0, r5, #0
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0802421C
	movs r0, #0x9d
	bl m4aSongNumStart
	b _08024222
	.align 2, 0
_08024200: .4byte gGameMode
_08024204: .4byte gUnknown_03005424
_08024208: .4byte 0xFFFFCFFF
_0802420C: .4byte gMPlayTable
_08024210: .4byte gSongTable
_08024214: .4byte gLevelSongs
_08024218: .4byte gCurrentLevel
_0802421C:
	movs r0, #0x77
	bl m4aSongNumStart
_08024222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8024228
sub_8024228: @ 0x08024228
	push {lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x6d
	ldrb r0, [r1]
	cmp r0, #0
	bne _08024238
	b _080245EE
_08024238:
	subs r0, #1
	cmp r0, #0x1b
	bls _08024240
	b _080245EE
_08024240:
	lsls r0, r0, #2
	ldr r1, _0802424C @ =_08024250
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802424C: .4byte _08024250
_08024250: @ jump table
	.4byte _080242C0 @ case 0
	.4byte _080242D0 @ case 1
	.4byte _080242E0 @ case 2
	.4byte _08024300 @ case 3
	.4byte _0802434C @ case 4
	.4byte _08024330 @ case 5
	.4byte _08024320 @ case 6
	.4byte _08024368 @ case 7
	.4byte _08024378 @ case 8
	.4byte _08024388 @ case 9
	.4byte _08024578 @ case 10
	.4byte _08024588 @ case 11
	.4byte _08024598 @ case 12
	.4byte _080243E8 @ case 13
	.4byte _08024414 @ case 14
	.4byte _08024440 @ case 15
	.4byte _0802445C @ case 16
	.4byte _08024478 @ case 17
	.4byte _080244B0 @ case 18
	.4byte _080244E8 @ case 19
	.4byte _08024520 @ case 20
	.4byte _08024558 @ case 21
	.4byte _080245A8 @ case 22
	.4byte _08024568 @ case 23
	.4byte _080245B8 @ case 24
	.4byte _080245D8 @ case 25
	.4byte _080245E8 @ case 26
	.4byte _080245C8 @ case 27
_080242C0:
	ldr r1, _080242C8 @ =gPlayer
	ldr r0, _080242CC @ =sub_8025318
	b _080245EC
	.align 2, 0
_080242C8: .4byte gPlayer
_080242CC: .4byte sub_8025318
_080242D0:
	ldr r1, _080242D8 @ =gPlayer
	ldr r0, _080242DC @ =sub_8025A0C
	b _080245EC
	.align 2, 0
_080242D8: .4byte gPlayer
_080242DC: .4byte sub_8025A0C
_080242E0:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _080242F4 @ =0xFF9FFFFF
	ands r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _080242F8 @ =gPlayer
	ldr r0, _080242FC @ =sub_8025D00
	b _080245EC
	.align 2, 0
_080242F4: .4byte 0xFF9FFFFF
_080242F8: .4byte gPlayer
_080242FC: .4byte sub_8025D00
_08024300:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _08024314 @ =0xFF9FFFFF
	ands r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024318 @ =gPlayer
	ldr r0, _0802431C @ =sub_8025F84
	b _080245EC
	.align 2, 0
_08024314: .4byte 0xFF9FFFFF
_08024318: .4byte gPlayer
_0802431C: .4byte sub_8025F84
_08024320:
	ldr r1, _08024328 @ =gPlayer
	ldr r0, _0802432C @ =sub_8028D74
	b _080245EC
	.align 2, 0
_08024328: .4byte gPlayer
_0802432C: .4byte sub_8028D74
_08024330:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024344 @ =gPlayer
	ldr r0, _08024348 @ =sub_8026060
	b _080245EC
	.align 2, 0
_08024344: .4byte gPlayer
_08024348: .4byte sub_8026060
_0802434C:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #0x20]
	ldr r1, _08024360 @ =gPlayer
	ldr r0, _08024364 @ =sub_802611C
	b _080245EC
	.align 2, 0
_08024360: .4byte gPlayer
_08024364: .4byte sub_802611C
_08024368:
	ldr r1, _08024370 @ =gPlayer
	ldr r0, _08024374 @ =sub_801225C
	b _080245EC
	.align 2, 0
_08024370: .4byte gPlayer
_08024374: .4byte sub_801225C
_08024378:
	ldr r1, _08024380 @ =gPlayer
	ldr r0, _08024384 @ =sub_8027250
	b _080245EC
	.align 2, 0
_08024380: .4byte gPlayer
_08024384: .4byte sub_8027250
_08024388:
	ldr r0, _080243C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802439E
	ldr r0, _080243C8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_0802439E:
	mov r0, ip
	ldr r1, [r0, #0x20]
	ldr r0, _080243CC @ =0x3000200A
	ands r0, r1
	cmp r0, #0
	beq _080243D0
	movs r0, #0x82
	lsls r0, r0, #0x14
	orrs r1, r0
	mov r3, ip
	str r1, [r3, #0x20]
	mov r0, ip
	adds r0, #0x5c
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _080245EE
	.align 2, 0
_080243C4: .4byte gGameMode
_080243C8: .4byte gUnknown_03005424
_080243CC: .4byte 0x3000200A
_080243D0:
	movs r0, #0x80
	lsls r0, r0, #0x14
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
	ldr r1, _080243E0 @ =gPlayer
	ldr r0, _080243E4 @ =sub_80273D0
	b _080245EC
	.align 2, 0
_080243E0: .4byte gPlayer
_080243E4: .4byte sub_80273D0
_080243E8:
	ldr r0, _08024408 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024400
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_08024400:
	ldr r1, _0802440C @ =gPlayer
	ldr r0, _08024410 @ =sub_8028E24
	b _080245EC
	.align 2, 0
_08024408: .4byte gUnknown_03005424
_0802440C: .4byte gPlayer
_08024410: .4byte sub_8028E24
_08024414:
	ldr r0, _08024434 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802442C
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
_0802442C:
	ldr r1, _08024438 @ =gPlayer
	ldr r0, _0802443C @ =sub_8028E24
	b _080245EC
	.align 2, 0
_08024434: .4byte gUnknown_03005424
_08024438: .4byte gPlayer
_0802443C: .4byte sub_8028E24
_08024440:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024454 @ =gPlayer
	ldr r0, _08024458 @ =sub_8028E24
	b _080245EC
	.align 2, 0
_08024454: .4byte gPlayer
_08024458: .4byte sub_8028E24
_0802445C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x30
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024470 @ =gPlayer
	ldr r0, _08024474 @ =sub_8028E24
	b _080245EC
	.align 2, 0
_08024470: .4byte gPlayer
_08024474: .4byte sub_8028E24
_08024478:
	ldr r0, _08024490 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024494
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
	b _0802449C
	.align 2, 0
_08024490: .4byte gUnknown_03005424
_08024494:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
_0802449C:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080244A8 @ =gPlayer
	ldr r0, _080244AC @ =sub_8028E24
	b _080245EC
	.align 2, 0
_080244A8: .4byte gPlayer
_080244AC: .4byte sub_8028E24
_080244B0:
	ldr r0, _080244C8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080244CC
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
	b _080244D4
	.align 2, 0
_080244C8: .4byte gUnknown_03005424
_080244CC:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
_080244D4:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080244E0 @ =gPlayer
	ldr r0, _080244E4 @ =sub_8028E24
	b _080245EC
	.align 2, 0
_080244E0: .4byte gPlayer
_080244E4: .4byte sub_8028E24
_080244E8:
	ldr r0, _08024500 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024504
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
	b _0802450C
	.align 2, 0
_08024500: .4byte gUnknown_03005424
_08024504:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
_0802450C:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024518 @ =gPlayer
	ldr r0, _0802451C @ =sub_8028E24
	b _080245EC
	.align 2, 0
_08024518: .4byte gPlayer
_0802451C: .4byte sub_8028E24
_08024520:
	ldr r0, _08024538 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802453C
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
	b _08024544
	.align 2, 0
_08024538: .4byte gUnknown_03005424
_0802453C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
_08024544:
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08024550 @ =gPlayer
	ldr r0, _08024554 @ =sub_8028E24
	b _080245EC
	.align 2, 0
_08024550: .4byte gPlayer
_08024554: .4byte sub_8028E24
_08024558:
	ldr r1, _08024560 @ =gPlayer
	ldr r0, _08024564 @ =sub_8029158
	b _080245EC
	.align 2, 0
_08024560: .4byte gPlayer
_08024564: .4byte sub_8029158
_08024568:
	ldr r1, _08024570 @ =gPlayer
	ldr r0, _08024574 @ =sub_802A300
	b _080245EC
	.align 2, 0
_08024570: .4byte gPlayer
_08024574: .4byte sub_802A300
_08024578:
	ldr r1, _08024580 @ =gPlayer
	ldr r0, _08024584 @ =sub_8026764
	b _080245EC
	.align 2, 0
_08024580: .4byte gPlayer
_08024584: .4byte sub_8026764
_08024588:
	ldr r1, _08024590 @ =gPlayer
	ldr r0, _08024594 @ =sub_80269C0
	b _080245EC
	.align 2, 0
_08024590: .4byte gPlayer
_08024594: .4byte sub_80269C0
_08024598:
	ldr r1, _080245A0 @ =gPlayer
	ldr r0, _080245A4 @ =sub_8026A4C
	b _080245EC
	.align 2, 0
_080245A0: .4byte gPlayer
_080245A4: .4byte sub_8026A4C
_080245A8:
	ldr r1, _080245B0 @ =gPlayer
	ldr r0, _080245B4 @ =sub_802A258
	b _080245EC
	.align 2, 0
_080245B0: .4byte gPlayer
_080245B4: .4byte sub_802A258
_080245B8:
	ldr r1, _080245C0 @ =gPlayer
	ldr r0, _080245C4 @ =sub_8026E24
	b _080245EC
	.align 2, 0
_080245C0: .4byte gPlayer
_080245C4: .4byte sub_8026E24
_080245C8:
	ldr r1, _080245D0 @ =gPlayer
	ldr r0, _080245D4 @ =sub_8026F10
	b _080245EC
	.align 2, 0
_080245D0: .4byte gPlayer
_080245D4: .4byte sub_8026F10
_080245D8:
	ldr r1, _080245E0 @ =gPlayer
	ldr r0, _080245E4 @ =sub_8026FC8
	b _080245EC
	.align 2, 0
_080245E0: .4byte gPlayer
_080245E4: .4byte sub_8026FC8
_080245E8:
	ldr r1, _08024604 @ =gPlayer
	ldr r0, _08024608 @ =sub_8027114
_080245EC:
	str r0, [r1]
_080245EE:
	mov r3, ip
	adds r3, #0x6d
	ldrb r0, [r3]
	mov r1, ip
	adds r1, #0x6f
	movs r2, #0
	strb r0, [r1]
	strb r2, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08024604: .4byte gPlayer
_08024608: .4byte sub_8027114

	thumb_func_start sub_802460C
sub_802460C: @ 0x0802460C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _0802463C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024648
	ldr r0, _08024640 @ =0x04000128
	ldr r1, [r0]
	lsls r1, r1, #0x1a
	ldr r0, _08024644 @ =gCamera
	adds r0, #0x66
	lsrs r1, r1, #0x1e
	ldrb r0, [r0]
	cmp r1, r0
	beq _08024648
	adds r1, r3, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	movs r6, #0
	adds r5, r1, #0
	b _080246BE
	.align 2, 0
_0802463C: .4byte gGameMode
_08024640: .4byte 0x04000128
_08024644: .4byte gCamera
_08024648:
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r6, [r0]
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xe
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _080246BE
	ldr r0, _080246D0 @ =gInput
	ldrh r4, [r0]
	strh r4, [r5]
	ldrb r0, [r7]
	cmp r0, #2
	bls _080246BE
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080246BE
	movs r0, #0xf0
	ands r0, r4
	lsrs r2, r0, #4
	ldr r0, _080246D4 @ =gUnknown_03005590
	ldr r1, [r0]
	ldrh r0, [r3, #0x32]
	adds r1, r0, r1
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _08024690
	movs r1, #1
_08024690:
	lsls r2, r1
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x1c
	lsrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x18
	ldr r0, _080246D8 @ =0x0000FF0F
	ands r0, r4
	orrs r0, r2
	strh r0, [r5]
	ldrh r0, [r3, #0x32]
	subs r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080246BE
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xbf
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
_080246BE:
	ldrh r0, [r5]
	eors r6, r0
	ands r6, r0
	adds r0, r3, #0
	adds r0, #0x5e
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080246D0: .4byte gInput
_080246D4: .4byte gUnknown_03005590
_080246D8: .4byte 0x0000FF0F

	thumb_func_start sub_80246DC
sub_80246DC: @ 0x080246DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r5, [r0]
	mov sb, r5
	movs r0, #0x68
	adds r0, r0, r4
	mov r8, r0
	ldrh r3, [r0]
	movs r1, #0x6a
	adds r1, r1, r4
	mov ip, r1
	ldrh r2, [r1]
	mov sl, r2
	ldr r1, _0802476C @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	subs r0, r3, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080247CC
	cmp r2, #0
	bne _08024770
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08024770
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08024770
	movs r0, #1
	mov r1, ip
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	b _0802485C
	.align 2, 0
_0802476C: .4byte gUnknown_080D672C
_08024770:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	adds r5, r4, #0
	adds r5, #0x6a
	ldrh r0, [r5]
	cmp r0, #1
	bne _0802485C
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802485C
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080247C4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E6D4
	adds r1, r0, #0
	ldr r0, _080247C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802485C
	cmp r1, #0x20
	bgt _0802485C
	movs r0, #2
	strh r0, [r5]
	b _0802485C
	.align 2, 0
_080247C4: .4byte sub_801EE64
_080247C8: .4byte gGameMode
_080247CC:
	cmp r5, #0x26
	bne _080247EA
	cmp r3, #0x34
	bne _0802485C
	cmp r2, #0
	bne _080247E4
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_080247E4:
	cmp r2, #1
	bne _0802485C
	b _0802484A
_080247EA:
	cmp r5, #0x27
	bne _0802480C
	cmp r3, #0x35
	bne _0802485C
	cmp r2, #0
	bne _0802485C
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802485C
	adds r0, r7, #0
	adds r0, #0x34
	mov r1, r8
	strh r0, [r1]
	b _08024856
_0802480C:
	cmp r5, #0x25
	bne _0802482A
	cmp r3, #0x41
	bne _0802485C
	cmp r2, #0
	bne _08024824
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_08024824:
	cmp r2, #1
	bne _0802485C
	b _0802484A
_0802482A:
	mov r0, sb
	cmp r0, #0x39
	bne _0802485C
	cmp r3, #0x42
	bne _0802485C
	cmp r2, #0
	bne _08024844
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802485C
	movs r0, #1
	b _08024858
_08024844:
	mov r0, sl
	cmp r0, #1
	bne _0802485C
_0802484A:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802485C
_08024856:
	movs r0, #2
_08024858:
	mov r1, ip
	strh r0, [r1]
_0802485C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802486C
sub_802486C: @ 0x0802486C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080248E0
	adds r0, r3, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	beq _080248E0
	ldr r7, _08024908 @ =gUnknown_080D6736
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r5, r3, #0
	adds r5, #0x68
	strh r4, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _080248C6
	ldr r0, _0802490C @ =gUnknown_080D672C
	adds r1, r3, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r4, r0
	strh r0, [r5]
_080248C6:
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r1, r7, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_080248E0:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r1
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #0x34
	bls _080248FC
	b _08024A96
_080248FC:
	lsls r0, r0, #2
	ldr r1, _08024910 @ =_08024914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024908: .4byte gUnknown_080D6736
_0802490C: .4byte gUnknown_080D672C
_08024910: .4byte _08024914
_08024914: @ jump table
	.4byte _080249E8 @ case 0
	.4byte _08024A96 @ case 1
	.4byte _08024A96 @ case 2
	.4byte _08024A96 @ case 3
	.4byte _08024A96 @ case 4
	.4byte _08024A96 @ case 5
	.4byte _08024A96 @ case 6
	.4byte _08024A3A @ case 7
	.4byte _08024A96 @ case 8
	.4byte _08024A96 @ case 9
	.4byte _08024A96 @ case 10
	.4byte _08024A96 @ case 11
	.4byte _08024A96 @ case 12
	.4byte _08024A96 @ case 13
	.4byte _08024A96 @ case 14
	.4byte _08024A96 @ case 15
	.4byte _08024A96 @ case 16
	.4byte _08024A96 @ case 17
	.4byte _08024A96 @ case 18
	.4byte _08024A96 @ case 19
	.4byte _08024A96 @ case 20
	.4byte _08024A96 @ case 21
	.4byte _08024A96 @ case 22
	.4byte _08024A96 @ case 23
	.4byte _08024A96 @ case 24
	.4byte _08024A96 @ case 25
	.4byte _08024A96 @ case 26
	.4byte _08024A96 @ case 27
	.4byte _08024A96 @ case 28
	.4byte _08024A96 @ case 29
	.4byte _08024A96 @ case 30
	.4byte _08024A96 @ case 31
	.4byte _08024A96 @ case 32
	.4byte _08024A96 @ case 33
	.4byte _08024A96 @ case 34
	.4byte _08024A96 @ case 35
	.4byte _08024A96 @ case 36
	.4byte _08024A96 @ case 37
	.4byte _08024A96 @ case 38
	.4byte _08024A96 @ case 39
	.4byte _08024A96 @ case 40
	.4byte _08024A96 @ case 41
	.4byte _08024A70 @ case 42
	.4byte _08024A70 @ case 43
	.4byte _08024A76 @ case 44
	.4byte _08024A76 @ case 45
	.4byte _08024A96 @ case 46
	.4byte _08024A96 @ case 47
	.4byte _08024A96 @ case 48
	.4byte _08024A96 @ case 49
	.4byte _08024A10 @ case 50
	.4byte _08024A10 @ case 51
	.4byte _08024A10 @ case 52
_080249E8:
	ldr r1, _08024A2C @ =gUnknown_080D672C
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #9
	adds r1, r3, #0
	adds r1, #0x68
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r4, r1, #0
_08024A10:
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A20
	rsbs r0, r0, #0
_08024A20:
	cmp r0, #7
	ble _08024A30
	cmp r0, #0x80
	ble _08024A32
	movs r0, #0x80
	b _08024A32
	.align 2, 0
_08024A2C: .4byte gUnknown_080D672C
_08024A30:
	movs r0, #8
_08024A32:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	b _08024A96
_08024A3A:
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #1
	bne _08024A96
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A60
	rsbs r0, r0, #0
_08024A60:
	cmp r0, #7
	ble _08024A6C
	cmp r0, #0x80
	ble _08024A88
	movs r0, #0x80
	b _08024A88
_08024A6C:
	movs r0, #8
	b _08024A88
_08024A70:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	b _08024A7A
_08024A76:
	movs r4, #0x14
	ldrsh r0, [r3, r4]
_08024A7A:
	cmp r0, #0
	bge _08024A80
	rsbs r0, r0, #0
_08024A80:
	asrs r1, r0, #8
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #8
_08024A88:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
_08024A96:
	ldr r0, _08024B0C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024AA8
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
_08024AA8:
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r1, [r0]
	adds r6, r0, #0
	mov r5, ip
	adds r5, #0x20
	cmp r1, #0
	bne _08024ACA
	mov r1, ip
	ldrh r0, [r1, #0xa]
	ldrh r1, [r4]
	cmp r0, r1
	bne _08024ACA
	ldrb r0, [r5]
	ldrh r1, [r2]
	cmp r0, r1
	beq _08024AF6
_08024ACA:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r2]
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	ldrb r0, [r7]
	cmp r0, #2
	bls _08024AF6
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #1
	strb r0, [r1]
_08024AF6:
	mov r0, r8
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024B0C: .4byte gGameMode

	thumb_func_start sub_8024B10
sub_8024B10: @ 0x08024B10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r5, #0xc
	adds r6, r1, #0
	ldr r0, _08024BBC @ =gCamera
	ldrh r3, [r0]
	ldrh r4, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08024B3A
	ldrh r1, [r5, #0x1e]
	ldr r0, _08024BC0 @ =0x0000FFFF
	cmp r1, r0
	bne _08024B3C
_08024B3A:
	movs r2, #1
_08024B3C:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _08024B84
	cmp r0, #0x29
	beq _08024B84
	cmp r0, #0x3e
	beq _08024B84
	cmp r0, #0x3f
	beq _08024B84
	cmp r0, #0x57
	bne _08024C68
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08024C68
_08024B84:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r5, #0x10]
	ldr r0, _08024BC4 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024BC8
	movs r0, #0xff
	lsls r0, r0, #8
	b _08024BCC
	.align 2, 0
_08024BBC: .4byte gCamera
_08024BC0: .4byte 0x0000FFFF
_08024BC4: .4byte 0xFFFFF3FF
_08024BC8:
	movs r0, #0x80
	lsls r0, r0, #1
_08024BCC:
	strh r0, [r6, #2]
	ldr r2, _08024C14 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024BE2
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
_08024BE2:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08024BF0
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_08024BF0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldrh r1, [r6]
	adds r1, r1, r0
	ldr r2, _08024C18 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _08024C1C @ =0x000003FF
	ands r0, r1
	strh r0, [r6]
	b _08024C26
	.align 2, 0
_08024C14: .4byte gUnknown_03005424
_08024C18: .4byte 0xFFFFFF00
_08024C1C: .4byte 0x000003FF
_08024C20:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
_08024C26:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08024C64 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08024CC2
	.align 2, 0
_08024C64: .4byte gGameMode
_08024C68:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r5, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024C88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r5, #0x10]
	b _08024C94
_08024C88:
	ldr r0, _08024CAC @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r5, #0x10]
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
_08024C94:
	ldr r0, _08024CB0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024CB4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08024CBA
	.align 2, 0
_08024CAC: .4byte 0xFFFFFBFF
_08024CB0: .4byte gUnknown_03005424
_08024CB4:
	ldr r0, [r5, #0x10]
	ldr r1, _08024D9C @ =0xFFFFF7FF
	ands r0, r1
_08024CBA:
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
_08024CC2:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08024CF2
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08024CF8
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024CF2
	ldr r0, _08024DA4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08024CF8
_08024CF2:
	adds r0, r5, #0
	bl sub_80051E8
_08024CF8:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	b _08024F5C
_08024D02:
	ldr r4, _08024DA8 @ =gMultiSioSend
	ldr r2, _08024DAC @ =gMultiplayerPlayerTasks
	ldr r0, _08024DB0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r4]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #4]
	ldrh r3, [r5, #0xa]
	strh r3, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #5
	bne _08024D6C
	ldr r1, _08024DB4 @ =gUnknown_080D672C
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, r3, r1
	ldr r0, _08024DB8 @ =gCourseTime
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4, #6]
_08024D6C:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r4, #0xb]
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024DBC
	ldrh r0, [r4, #8]
	movs r1, #1
	orrs r0, r1
	b _08024DC2
	.align 2, 0
_08024D9C: .4byte 0xFFFFF7FF
_08024DA0: .4byte gGameMode
_08024DA4: .4byte gUnknown_03005590
_08024DA8: .4byte gMultiSioSend
_08024DAC: .4byte gMultiplayerPlayerTasks
_08024DB0: .4byte 0x04000128
_08024DB4: .4byte gUnknown_080D672C
_08024DB8: .4byte gCourseTime
_08024DBC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DD8 @ =0x0000FFFE
	ands r0, r1
_08024DC2:
	strh r0, [r4, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	bne _08024DDC
	ldrh r1, [r4, #8]
	movs r0, #2
	orrs r0, r1
	b _08024DE2
	.align 2, 0
_08024DD8: .4byte 0x0000FFFE
_08024DDC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DF8 @ =0x0000FFFD
	ands r0, r1
_08024DE2:
	strh r0, [r4, #8]
	ldr r0, _08024DFC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024E00
	ldrh r1, [r4, #8]
	movs r0, #8
	orrs r0, r1
	b _08024E06
	.align 2, 0
_08024DF8: .4byte 0x0000FFFD
_08024DFC: .4byte gUnknown_03005424
_08024E00:
	ldrh r1, [r4, #8]
	ldr r0, _08024E38 @ =0x0000FFF7
	ands r0, r1
_08024E06:
	strh r0, [r4, #8]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024E2E
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024E3C
_08024E2E:
	ldrh r1, [r4, #8]
	movs r0, #4
	orrs r0, r1
	b _08024E42
	.align 2, 0
_08024E38: .4byte 0x0000FFF7
_08024E3C:
	ldrh r1, [r4, #8]
	ldr r0, _08024E5C @ =0x0000FFFB
	ands r0, r1
_08024E42:
	strh r0, [r4, #8]
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08024E60
	ldrh r1, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	b _08024E66
	.align 2, 0
_08024E5C: .4byte 0x0000FFFB
_08024E60:
	ldrh r1, [r4, #8]
	ldr r0, _08024E7C @ =0x0000FEFF
	ands r0, r1
_08024E66:
	strh r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08024E80
	ldrh r1, [r4, #8]
	movs r0, #0x40
	orrs r0, r1
	b _08024E86
	.align 2, 0
_08024E7C: .4byte 0x0000FEFF
_08024E80:
	ldrh r1, [r4, #8]
	ldr r0, _08024EB8 @ =0x0000FFBF
	ands r0, r1
_08024E86:
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldr r2, _08024EBC @ =0x0000FFCF
	ands r2, r0
	strh r2, [r4, #8]
	ldr r3, _08024EC0 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024EC4
	movs r0, #0x80
	orrs r1, r0
	b _08024EC8
	.align 2, 0
_08024EB8: .4byte 0x0000FFBF
_08024EBC: .4byte 0x0000FFCF
_08024EC0: .4byte gPlayer
_08024EC4:
	ldr r0, _08024EDC @ =0x0000FF7F
	ands r1, r0
_08024EC8:
	strh r1, [r4, #8]
	mov r0, sb
	cmp r0, #0
	beq _08024EE0
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _08024EE6
	.align 2, 0
_08024EDC: .4byte 0x0000FF7F
_08024EE0:
	ldrh r1, [r4, #8]
	ldr r0, _08024F68 @ =0x0000F7FF
	ands r0, r1
_08024EE6:
	strh r0, [r4, #8]
	ldr r6, _08024F6C @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08024F4C
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08024F2C
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _08024F4C
_08024F16:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _08024F2C
	strb r2, [r5]
_08024F2C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08024F4C
	ldr r0, _08024F6C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08024F2C
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _08024F16
_08024F4C:
	ldrh r0, [r4, #8]
	ldr r1, _08024F70 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r4, #8]
	ldrb r0, [r5]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r4, #8]
_08024F5C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F68: .4byte 0x0000F7FF
_08024F6C: .4byte 0x04000128
_08024F70: .4byte 0x0000F9FF

	thumb_func_start sub_8024F74
sub_8024F74: @ 0x08024F74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r6, #0xc
	adds r4, r1, #0
	ldr r0, _08024FB4 @ =gCamera
	ldrh r3, [r0]
	ldrh r7, [r0, #4]
	ldr r0, _08024FB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08024FC4
	ldr r0, _08024FBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08024FC0 @ =gMultiSioRecv
	adds r1, r1, r0
	ldrh r2, [r1, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #6]
	ldrh r1, [r1, #4]
	b _08024FD4
	.align 2, 0
_08024FB4: .4byte gCamera
_08024FB8: .4byte gGameMode
_08024FBC: .4byte 0x04000128
_08024FC0: .4byte gMultiSioRecv
_08024FC4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #6]
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
_08024FD4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #8]
	adds r2, r6, #0
	adds r2, #0x22
	movs r0, #0x10
	strb r0, [r2]
	ldr r1, [r5, #0x20]
	movs r0, #0x40
	ands r0, r1
	mov sl, r1
	cmp r0, #0
	beq _08024FF4
	movs r0, #8
	strb r0, [r2]
_08024FF4:
	adds r0, r5, #0
	adds r0, #0x85
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #4
	bls _08025004
	b _08025306
_08025004:
	lsls r0, r1, #2
	ldr r1, _08025010 @ =_08025014
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025010: .4byte _08025014
_08025014: @ jump table
	.4byte _08025306 @ case 0
	.4byte _08025028 @ case 1
	.4byte _08025180 @ case 2
	.4byte _08025306 @ case 3
	.4byte _08025306 @ case 4
_08025028:
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov ip, r2
	ldr r1, _080250B0 @ =gUnknown_080D672C
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08025058
	cmp r2, #1
	beq _0802506E
_08025058:
	cmp r1, #4
	bne _08025060
	cmp r2, #0
	beq _0802506E
_08025060:
	cmp r3, #0x46
	beq _08025066
	b _08025306
_08025066:
	mov r0, ip
	cmp r0, #0
	beq _0802506E
	b _08025306
_0802506E:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0xb0
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _080250B4 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080250B8
	movs r0, #0xff
	lsls r0, r0, #8
	b _080250BC
	.align 2, 0
_080250B0: .4byte gUnknown_080D672C
_080250B4: .4byte gUnknown_030054B8
_080250B8:
	movs r0, #0x80
	lsls r0, r0, #1
_080250BC:
	strh r0, [r4, #2]
	ldr r2, _08025104 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080250D2
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_080250D2:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080250E0
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_080250E0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025110
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025108 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802510C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _08025116
	.align 2, 0
_08025104: .4byte gUnknown_03005424
_08025108: .4byte 0xFFFFFF00
_0802510C: .4byte 0x000003FF
_08025110:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_08025116:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025174
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	beq _0802515E
	b _08025306
_0802515E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025174
	ldr r0, _0802517C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025174
	b _08025306
_08025174:
	adds r0, r6, #0
	bl sub_80051E8
	b _08025306
	.align 2, 0
_0802517C: .4byte gUnknown_03005590
_08025180:
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	mov ip, r2
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	mov sb, r0
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov r8, r2
	ldr r1, _080251F4 @ =gUnknown_080D672C
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080251BC
	cmp r2, #1
	beq _080251D2
_080251BC:
	cmp r1, #4
	bne _080251C4
	cmp r2, #0
	beq _080251D2
_080251C4:
	cmp r3, #0x46
	beq _080251CA
	b _08025306
_080251CA:
	mov r2, r8
	cmp r2, #0
	beq _080251D2
	b _08025306
_080251D2:
	mov r3, ip
	cmp r3, #0
	bne _080251DE
	mov r0, sb
	cmp r0, #0
	beq _080251F8
_080251DE:
	mov r0, ip
	mov r1, sb
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08025208
	.align 2, 0
_080251F4: .4byte gUnknown_080D672C
_080251F8:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	movs r1, #0x40
	cmp r0, #0
	beq _08025206
	movs r1, #0xc0
_08025206:
	adds r0, r1, #0
_08025208:
	adds r1, r5, #0
	adds r1, #0xad
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08025244 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08025248
	movs r0, #0xff
	lsls r0, r0, #8
	b _0802524C
	.align 2, 0
_08025244: .4byte gUnknown_030054B8
_08025248:
	movs r0, #0x80
	lsls r0, r0, #1
_0802524C:
	strh r0, [r4, #2]
	ldr r2, _08025294 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025262
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_08025262:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08025270
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_08025270:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080252A0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025298 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802529C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _080252A6
	.align 2, 0
_08025294: .4byte gUnknown_03005424
_08025298: .4byte 0xFFFFFF00
_0802529C: .4byte 0x000003FF
_080252A0:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_080252A6:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025300
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08025306
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025300
	ldr r0, _08025314 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025306
_08025300:
	adds r0, r6, #0
	bl sub_80051E8
_08025306:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025314: .4byte gUnknown_03005590

	thumb_func_start sub_8025318
sub_8025318: @ 0x08025318
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025350 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0802533E
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0x1c
	bne _08025338
	ldr r0, _08025354 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802533E
_08025338:
	ldr r1, [r4, #0x20]
	cmp r2, #0x1d
	bne _08025358
_0802533E:
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08025358
	adds r0, r4, #0
	bl sub_8025F84
	b _080253B4
	.align 2, 0
_08025350: .4byte gCurrentLevel
_08025354: .4byte gUnknown_030054B0
_08025358:
	ldr r0, _0802536C @ =0x0000080A
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bne _08025370
	adds r0, r4, #0
	bl sub_802A360
	b _080253B4
	.align 2, 0
_0802536C: .4byte 0x0000080A
_08025370:
	adds r0, r4, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #7
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _080253A2
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	b _080253A8
_080253A2:
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
_080253A8:
	ldr r0, _080253BC @ =gPlayer
	ldr r1, _080253C0 @ =sub_80253C4
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_080253B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080253BC: .4byte gPlayer
_080253C0: .4byte sub_80253C4

	thumb_func_start sub_80253C4
sub_80253C4: @ 0x080253C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	ldr r0, _080253E0 @ =0x800000A
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0x14
	cmp r0, r1
	bne _080253E4
	adds r0, r4, #0
	bl sub_80273D0
	b _0802553A
	.align 2, 0
_080253E0: .4byte 0x800000A
_080253E4:
	ldr r0, _080253F8 @ =0x0000080A
	ands r2, r0
	subs r0, #0xa
	cmp r2, r0
	bne _080253FC
	adds r0, r4, #0
	bl sub_802A360
	b _0802553A
	.align 2, 0
_080253F8: .4byte 0x0000080A
_080253FC:
	adds r0, r4, #0
	bl sub_802A0C8
	cmp r0, #0
	beq _08025408
	b _0802553A
_08025408:
	adds r0, r4, #0
	bl sub_802A0FC
	cmp r0, #0
	beq _08025414
	b _0802553A
_08025414:
	adds r0, r4, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _08025420
	b _0802553A
_08025420:
	adds r0, r4, #0
	bl sub_802A2A8
	cmp r0, #0
	beq _0802542C
	b _0802553A
_0802542C:
	adds r0, r4, #0
	bl sub_802966C
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _08025466
	ldr r1, _080254BC @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08025466
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_08025466:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080254C0 @ =gUnknown_03005424
	ldr r1, _080254C4 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025494
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08025494:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080254A4
	adds r2, r1, #0
_080254A4:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080254C8
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080254D0
	.align 2, 0
_080254BC: .4byte gSineTable
_080254C0: .4byte gUnknown_03005424
_080254C4: .4byte gUnknown_0300544C
_080254C8:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080254D0:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _080254E6
	subs r0, #1
	b _0802550E
_080254E6:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08025510
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _080254FC
	rsbs r1, r1, #0
_080254FC:
	ldr r0, _08025528 @ =0x000001DF
	cmp r1, r0
	bgt _08025510
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0802550E:
	strh r0, [r4, #0x2a]
_08025510:
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802552C
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	b _0802553A
	.align 2, 0
_08025528: .4byte 0x000001DF
_0802552C:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802553A
	ldr r1, _08025540 @ =gPlayer
	ldr r0, _08025544 @ =sub_8025E18
	str r0, [r1]
_0802553A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025540: .4byte gPlayer
_08025544: .4byte sub_8025E18

	thumb_func_start sub_8025548
sub_8025548: @ 0x08025548
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_802A0FC
	cmp r0, #0
	beq _08025556
	b _08025688
_08025556:
	adds r0, r4, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _08025562
	b _08025688
_08025562:
	ldr r0, _08025618 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08025576
	adds r0, r4, #0
	bl sub_802A2A8
	cmp r0, #0
	beq _08025576
	b _08025688
_08025576:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802558E
	ldr r1, _0802561C @ =gPlayer
	ldr r0, _08025620 @ =sub_8025318
	str r0, [r1]
_0802558E:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _080255C2
	ldr r1, _08025624 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080255C2
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_080255C2:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08025628 @ =gUnknown_03005424
	ldr r1, _0802562C @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080255F0
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080255F0:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08025600
	adds r2, r1, #0
_08025600:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025630
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08025638
	.align 2, 0
_08025618: .4byte gGameMode
_0802561C: .4byte gPlayer
_08025620: .4byte sub_8025318
_08025624: .4byte gSineTable
_08025628: .4byte gUnknown_03005424
_0802562C: .4byte gUnknown_0300544C
_08025630:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08025638:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0802564E
	subs r0, #1
	b _08025676
_0802564E:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08025678
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08025664
	rsbs r1, r1, #0
_08025664:
	ldr r0, _08025690 @ =0x000001DF
	cmp r1, r0
	bgt _08025678
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08025676:
	strh r0, [r4, #0x2a]
_08025678:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025688
	ldr r1, _08025694 @ =gPlayer
	ldr r0, _08025698 @ =sub_8025E18
	str r0, [r1]
_08025688:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025690: .4byte 0x000001DF
_08025694: .4byte gPlayer
_08025698: .4byte sub_8025E18

	thumb_func_start sub_802569C
sub_802569C: @ 0x0802569C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x90
	ldr r0, [r6]
	adds r7, r0, #0
	adds r7, #0xc
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _08025718 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r4, #0
	bl sub_802A0FC
	cmp r0, #0
	beq _080256D4
	b _08025840
_080256D4:
	adds r0, r4, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _080256E0
	b _08025840
_080256E0:
	adds r0, r4, #0
	bl sub_802A2A8
	cmp r0, #0
	beq _080256EC
	b _08025840
_080256EC:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _08025720
	cmp r5, #1
	bne _0802574A
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _0802572A
	strh r5, [r1]
	ldr r0, [r6]
	ldr r1, [r0, #0x1c]
	ldr r2, _0802571C @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r0, #0x1c]
	b _0802572A
	.align 2, 0
_08025718: .4byte gUnknown_080D672C
_0802571C: .4byte 0xFFFFBFFF
_08025720:
	cmp r1, #0x40
	beq _0802572A
	ldr r1, _080257D4 @ =gPlayer
	ldr r0, _080257D8 @ =sub_8025318
	str r0, [r1]
_0802572A:
	cmp r5, #1
	bne _0802574A
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #1
	bne _0802574A
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802574A
	ldr r1, _080257D4 @ =gPlayer
	ldr r0, _080257D8 @ =sub_8025318
	str r0, [r1]
_0802574A:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0802577E
	ldr r1, _080257DC @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0802577E
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0802577E:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080257E0 @ =gUnknown_03005424
	ldr r1, _080257E4 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080257AC
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080257AC:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080257BC
	adds r2, r1, #0
_080257BC:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080257E8
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080257F0
	.align 2, 0
_080257D4: .4byte gPlayer
_080257D8: .4byte sub_8025318
_080257DC: .4byte gSineTable
_080257E0: .4byte gUnknown_03005424
_080257E4: .4byte gUnknown_0300544C
_080257E8:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080257F0:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08025806
	subs r0, #1
	b _0802582E
_08025806:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08025830
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0802581C
	rsbs r1, r1, #0
_0802581C:
	ldr r0, _08025848 @ =0x000001DF
	cmp r1, r0
	bgt _08025830
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0802582E:
	strh r0, [r4, #0x2a]
_08025830:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025840
	ldr r1, _0802584C @ =gPlayer
	ldr r0, _08025850 @ =sub_8025E18
	str r0, [r1]
_08025840:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025848: .4byte 0x000001DF
_0802584C: .4byte gPlayer
_08025850: .4byte sub_8025E18

	thumb_func_start sub_8025854
sub_8025854: @ 0x08025854
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x90
	ldr r0, [r6]
	adds r7, r0, #0
	adds r7, #0xc
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _080258D0 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r4, #0
	bl sub_802A184
	cmp r0, #0
	beq _0802588C
	b _080259F8
_0802588C:
	adds r0, r4, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _08025898
	b _080259F8
_08025898:
	adds r0, r4, #0
	bl sub_802A2A8
	cmp r0, #0
	beq _080258A4
	b _080259F8
_080258A4:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _080258D8
	cmp r5, #2
	bne _08025902
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _080258E2
	movs r0, #1
	strh r0, [r1]
	ldr r2, [r6]
	ldr r0, [r2, #0x1c]
	ldr r1, _080258D4 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	b _080258E2
	.align 2, 0
_080258D0: .4byte gUnknown_080D672C
_080258D4: .4byte 0xFFFFBFFF
_080258D8:
	cmp r1, #0x80
	beq _080258E2
	ldr r1, _0802598C @ =gPlayer
	ldr r0, _08025990 @ =sub_8025318
	str r0, [r1]
_080258E2:
	cmp r5, #2
	bne _08025902
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #1
	bne _08025902
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08025902
	ldr r1, _0802598C @ =gPlayer
	ldr r0, _08025990 @ =sub_8025318
	str r0, [r1]
_08025902:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _08025936
	ldr r1, _08025994 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08025936
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_08025936:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08025998 @ =gUnknown_03005424
	ldr r1, _0802599C @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025964
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08025964:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08025974
	adds r2, r1, #0
_08025974:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080259A0
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080259A8
	.align 2, 0
_0802598C: .4byte gPlayer
_08025990: .4byte sub_8025318
_08025994: .4byte gSineTable
_08025998: .4byte gUnknown_03005424
_0802599C: .4byte gUnknown_0300544C
_080259A0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080259A8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _080259BE
	subs r0, #1
	b _080259E6
_080259BE:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080259E8
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _080259D4
	rsbs r1, r1, #0
_080259D4:
	ldr r0, _08025A00 @ =0x000001DF
	cmp r1, r0
	bgt _080259E8
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_080259E6:
	strh r0, [r4, #0x2a]
_080259E8:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080259F8
	ldr r1, _08025A04 @ =gPlayer
	ldr r0, _08025A08 @ =sub_8025E18
	str r0, [r1]
_080259F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025A00: .4byte 0x000001DF
_08025A04: .4byte gPlayer
_08025A08: .4byte sub_8025E18

	thumb_func_start sub_8025A0C
sub_8025A0C: @ 0x08025A0C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08025A44 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08025A32
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0x1c
	bne _08025A2C
	ldr r0, _08025A48 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025A32
_08025A2C:
	ldr r1, [r6, #0x20]
	cmp r2, #0x1d
	bne _08025A4C
_08025A32:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08025A4C
	adds r0, r6, #0
	bl sub_8025F84
	b _08025AA4
	.align 2, 0
_08025A44: .4byte gCurrentLevel
_08025A48: .4byte gUnknown_030054B0
_08025A4C:
	ldr r0, _08025A60 @ =0x0000080A
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bne _08025A64
	adds r0, r6, #0
	bl sub_802A360
	b _08025AA4
	.align 2, 0
_08025A60: .4byte 0x0000080A
_08025A64:
	adds r0, r6, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08025AAC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r6, #0
	adds r0, #0x64
	movs r5, #0
	movs r4, #4
	strh r4, [r0]
	adds r0, r6, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #9
	strb r0, [r6, #0x17]
	ldr r0, [r6, #0x20]
	orrs r0, r4
	str r0, [r6, #0x20]
	adds r0, r6, #0
	adds r0, #0x99
	strb r5, [r0]
	ldr r0, _08025AB0 @ =gPlayer
	ldr r1, _08025AB4 @ =sub_8025AB8
	str r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
_08025AA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025AAC: .4byte 0xFFFFBFFF
_08025AB0: .4byte gPlayer
_08025AB4: .4byte sub_8025AB8

	thumb_func_start sub_8025AB8
sub_8025AB8: @ 0x08025AB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	ldr r0, _08025AD4 @ =0x800000A
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0x14
	cmp r0, r1
	bne _08025AD8
	adds r0, r4, #0
	bl sub_80273D0
	b _08025CEC
	.align 2, 0
_08025AD4: .4byte 0x800000A
_08025AD8:
	ldr r0, _08025AEC @ =0x0000080A
	ands r2, r0
	subs r0, #0xa
	cmp r2, r0
	bne _08025AF0
	adds r0, r4, #0
	bl sub_802A360
	b _08025CEC
	.align 2, 0
_08025AEC: .4byte 0x0000080A
_08025AF0:
	adds r1, r4, #0
	adds r1, #0x99
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08025B04
	subs r0, r2, #1
	strb r0, [r1]
	b _08025B66
_08025B04:
	adds r0, r4, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _08025B10
	b _08025CEC
_08025B10:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08025B66
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _08025B48
	cmp r1, #0x20
	bne _08025B66
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _08025B3C
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _08025B66
_08025B3C:
	subs r0, #0x18
	cmp r0, #0
	bge _08025B64
	movs r0, #0x60
	rsbs r0, r0, #0
	b _08025B64
_08025B48:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08025B5C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _08025B66
_08025B5C:
	adds r0, #0x18
	cmp r0, #0
	ble _08025B64
	movs r0, #0x60
_08025B64:
	strh r0, [r4, #0x14]
_08025B66:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08025B76
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	b _08025B8E
_08025B76:
	cmp r0, #0
	bge _08025B88
	adds r1, r4, #0
	adds r1, #0x50
	ldr r0, _08025B84 @ =0x0000FFF8
	b _08025B8E
	.align 2, 0
_08025B84: .4byte 0x0000FFF8
_08025B88:
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
_08025B8E:
	strh r0, [r1]
	adds r2, r1, #0
	ldrh r0, [r4, #0x14]
	ldrh r1, [r2]
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bhi _08025BAA
	strh r1, [r2]
	strh r1, [r4, #0x14]
_08025BAA:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08025BC8
	ldr r0, _08025BC0 @ =gPlayer
	ldr r1, _08025BC4 @ =sub_8025318
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _08025CEC
	.align 2, 0
_08025BC0: .4byte gPlayer
_08025BC4: .4byte sub_8025318
_08025BC8:
	movs r0, #0x14
	ldrsh r3, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r5, [r0]
	adds r1, r5, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0xbf
	bgt _08025C12
	cmp r3, #0
	beq _08025C12
	ldr r1, _08025C04 @ =gSineTable
	lsls r0, r5, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _08025C08
	cmp r2, #0
	bgt _08025C0E
	b _08025C0C
	.align 2, 0
_08025C04: .4byte gSineTable
_08025C08:
	cmp r2, #0
	blt _08025C0E
_08025C0C:
	asrs r2, r0, #0xa
_08025C0E:
	adds r3, r3, r2
	strh r3, [r4, #0x14]
_08025C12:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	adds r0, r4, #0
	bl sub_8023128
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08025C42
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08025C3C
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08025C40
_08025C3C:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08025C40:
	strh r0, [r4, #0x12]
_08025C42:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08025C8C @ =gUnknown_03005424
	ldr r1, _08025C90 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025C64
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08025C64:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08025C74
	adds r2, r1, #0
_08025C74:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025C94
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08025C9C
	.align 2, 0
_08025C8C: .4byte gUnknown_03005424
_08025C90: .4byte gUnknown_0300544C
_08025C94:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08025C9C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08025CB2
	subs r0, #1
	b _08025CDA
_08025CB2:
	ldrb r0, [r6]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08025CDC
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08025CC8
	rsbs r1, r1, #0
_08025CC8:
	ldr r0, _08025CF4 @ =0x000001DF
	cmp r1, r0
	bgt _08025CDC
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08025CDA:
	strh r0, [r4, #0x2a]
_08025CDC:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025CEC
	ldr r1, _08025CF8 @ =gPlayer
	ldr r0, _08025CFC @ =sub_8025E18
	str r0, [r1]
_08025CEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025CF4: .4byte 0x000001DF
_08025CF8: .4byte gPlayer
_08025CFC: .4byte sub_8025E18

	thumb_func_start sub_8025D00
sub_8025D00: @ 0x08025D00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r1, [r4, #0x20]
	movs r0, #0x81
	lsls r0, r0, #1
	orrs r1, r0
	ldr r0, _08025D3C @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08025D24
	movs r0, #0x10
	orrs r1, r0
	str r1, [r4, #0x20]
_08025D24:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08025D2E
	rsbs r1, r1, #0
_08025D2E:
	ldr r0, _08025D40 @ =0x0000013F
	cmp r1, r0
	bgt _08025D44
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xa
	b _08025D4A
	.align 2, 0
_08025D3C: .4byte 0xFEFFFFDF
_08025D40: .4byte 0x0000013F
_08025D44:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
_08025D4A:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x70
	movs r0, #1
	strb r0, [r1]
	ldr r3, [r4, #0x20]
	movs r0, #0x40
	ands r0, r3
	movs r5, #0x9c
	lsls r5, r5, #3
	cmp r0, #0
	beq _08025D66
	movs r5, #0xa8
	lsls r5, r5, #2
_08025D66:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	subs r1, #0x40
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08025DFC @ =gSineTable
	lsls r0, r1, #3
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r0, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldrh r6, [r4, #0x10]
	adds r0, r0, r6
	strh r0, [r4, #0x10]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	strh r0, [r4, #0x12]
	movs r0, #8
	ands r3, r0
	cmp r3, #0
	beq _08025DD6
	ldr r0, _08025E00 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08025DCA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08025DC6
	ldr r0, _08025E04 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025DCA
_08025DC6:
	cmp r1, #0x1d
	bne _08025DD6
_08025DCA:
	ldr r0, _08025E08 @ =gCamera
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r4, #0x10]
_08025DD6:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08025E0C @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0x74
	bl m4aSongNumStart
	ldr r0, _08025E10 @ =gPlayer
	ldr r1, _08025E14 @ =sub_8025E18
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025DFC: .4byte gSineTable
_08025E00: .4byte gCurrentLevel
_08025E04: .4byte gUnknown_030054B0
_08025E08: .4byte gCamera
_08025E0C: .4byte 0xFFFFBFFF
_08025E10: .4byte gPlayer
_08025E14: .4byte sub_8025E18

	thumb_func_start sub_8025E18
sub_8025E18: @ 0x08025E18
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0xfd
	lsls r5, r5, #8
	ldr r1, [r4, #0x20]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08025E2C
	ldr r5, _08025EBC @ =0x0000FE80
_08025E2C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08025E74
	ldr r0, _08025EC0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08025E56
	adds r0, r4, #0
	bl sub_801251C
	cmp r0, #0
	beq _08025E4A
	b _08025F74
_08025E4A:
	adds r0, r4, #0
	bl sub_80294F4
	cmp r0, #0
	beq _08025E56
	b _08025F74
_08025E56:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08025E74
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _08025EC4 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _08025E74
	strh r5, [r4, #0x12]
_08025E74:
	adds r0, r4, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl sub_8023610
	ldr r0, _08025EC8 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08025EA6
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08025E9C
	ldr r0, _08025ECC @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025EA6
_08025E9C:
	cmp r1, #0x1d
	beq _08025EA6
	adds r0, r4, #0
	bl sub_80236C8
_08025EA6:
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08025ED0
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08025ED4
	.align 2, 0
_08025EBC: .4byte 0x0000FE80
_08025EC0: .4byte gGameMode
_08025EC4: .4byte gPlayerControls
_08025EC8: .4byte gCurrentLevel
_08025ECC: .4byte gUnknown_030054B0
_08025ED0:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08025ED4:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08025F20 @ =gUnknown_03005424
	ldr r1, _08025F24 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025EF8
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08025EF8:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08025F08
	adds r2, r1, #0
_08025F08:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08025F28
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08025F30
	.align 2, 0
_08025F20: .4byte gUnknown_03005424
_08025F24: .4byte gUnknown_0300544C
_08025F28:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08025F30:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08025F48
	adds r1, #2
	cmp r1, #0
	ble _08025F54
	b _08025F52
_08025F48:
	cmp r1, #0
	ble _08025F54
	subs r1, #2
	cmp r1, #0
	bge _08025F54
_08025F52:
	movs r1, #0
_08025F54:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08025F74
	ldr r1, _08025F7C @ =gPlayer
	ldr r0, _08025F80 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08025F74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025F7C: .4byte gPlayer
_08025F80: .4byte sub_8025318

	thumb_func_start sub_8025F84
sub_8025F84: @ 0x08025F84
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _08025FE8 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _08025FAA
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _08026000
_08025FAA:
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _08025FEC @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	beq _08025FD8
	cmp r1, #0xa
	beq _08025FD8
	cmp r1, #0xb
	beq _08025FD8
	cmp r1, #0x46
	bne _08025FF0
_08025FD8:
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	b _08025FFE
	.align 2, 0
_08025FE8: .4byte 0xFEFFFFDF
_08025FEC: .4byte gUnknown_080D672C
_08025FF0:
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
_08025FFE:
	strb r0, [r4, #0x17]
_08026000:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0802600A
	rsbs r1, r1, #0
_0802600A:
	ldr r0, _08026018 @ =0x0000013F
	cmp r1, r0
	bgt _0802601C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xa
	b _08026022
	.align 2, 0
_08026018: .4byte 0x0000013F
_0802601C:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
_08026022:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x70
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026054 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0x74
	bl m4aSongNumStart
	ldr r0, _08026058 @ =gPlayer
	ldr r1, _0802605C @ =sub_8025E18
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026054: .4byte 0xFFFFBFFF
_08026058: .4byte gPlayer
_0802605C: .4byte sub_8025E18

	thumb_func_start sub_8026060
sub_8026060: @ 0x08026060
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _080260C4 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _08026084
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _080260DC
_08026084:
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _080260C8 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	beq _080260B2
	cmp r1, #0xa
	beq _080260B2
	cmp r1, #0xb
	beq _080260B2
	cmp r1, #0x46
	bne _080260CC
_080260B2:
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	b _080260DA
	.align 2, 0
_080260C4: .4byte 0xFEFFFFDF
_080260C8: .4byte gUnknown_080D672C
_080260CC:
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
_080260DA:
	strb r0, [r4, #0x17]
_080260DC:
	adds r1, r4, #0
	adds r1, #0x70
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026110 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x24
	strb r3, [r0]
	ldr r0, _08026114 @ =gPlayer
	ldr r1, _08026118 @ =sub_80261D8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026110: .4byte 0xFFFFBFFF
_08026114: .4byte gPlayer
_08026118: .4byte sub_80261D8

	thumb_func_start sub_802611C
sub_802611C: @ 0x0802611C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _08026180 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _08026140
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _08026198
_08026140:
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _08026184 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	beq _0802616E
	cmp r1, #0xa
	beq _0802616E
	cmp r1, #0xb
	beq _0802616E
	cmp r1, #0x46
	bne _08026188
_0802616E:
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	b _08026196
	.align 2, 0
_08026180: .4byte 0xFEFFFFDF
_08026184: .4byte gUnknown_080D672C
_08026188:
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
_08026196:
	strb r0, [r4, #0x17]
_08026198:
	adds r1, r4, #0
	adds r1, #0x70
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	strb r3, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080261CC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x24
	strb r3, [r0]
	ldr r0, _080261D0 @ =gPlayer
	ldr r1, _080261D4 @ =sub_80261D8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080261CC: .4byte 0xFFFFBFFF
_080261D0: .4byte gPlayer
_080261D4: .4byte sub_80261D8

	thumb_func_start sub_80261D8
sub_80261D8: @ 0x080261D8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #1
	bne _080261F2
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08026220
_080261F2:
	adds r0, r4, #0
	bl sub_8023610
	ldr r0, _0802625C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08026220
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08026220
	adds r0, r4, #0
	bl sub_801251C
	cmp r0, #0
	bne _0802630C
	adds r0, r4, #0
	bl sub_80294F4
	cmp r0, #0
	bne _0802630C
_08026220:
	ldr r0, _08026260 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08026246
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802623C
	ldr r0, _08026264 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08026246
_0802623C:
	cmp r1, #0x1d
	beq _08026246
	adds r0, r4, #0
	bl sub_80236C8
_08026246:
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08026268
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _0802626C
	.align 2, 0
_0802625C: .4byte gGameMode
_08026260: .4byte gCurrentLevel
_08026264: .4byte gUnknown_030054B0
_08026268:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_0802626C:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080262B8 @ =gUnknown_03005424
	ldr r1, _080262BC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026290
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08026290:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080262A0
	adds r2, r1, #0
_080262A0:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080262C0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080262C8
	.align 2, 0
_080262B8: .4byte gUnknown_03005424
_080262BC: .4byte gUnknown_0300544C
_080262C0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080262C8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080262E0
	adds r1, #2
	cmp r1, #0
	ble _080262EC
	b _080262EA
_080262E0:
	cmp r1, #0
	ble _080262EC
	subs r1, #2
	cmp r1, #0
	bge _080262EC
_080262EA:
	movs r1, #0
_080262EC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0802630C
	ldr r1, _08026314 @ =gPlayer
	ldr r0, _08026318 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0802630C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026314: .4byte gPlayer
_08026318: .4byte sub_8025318

	thumb_func_start sub_802631C
sub_802631C: @ 0x0802631C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _0802636C @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	movs r0, #0x6d
	bl m4aSongNumStart
	bl sub_801F7DC
	ldr r0, _08026370 @ =gPlayer
	ldr r1, _08026374 @ =sub_8026378
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802636C: .4byte 0x00000404
_08026370: .4byte gPlayer
_08026374: .4byte sub_8026378

	thumb_func_start sub_8026378
sub_8026378: @ 0x08026378
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov r8, r0
	adds r2, r6, #0
	adds r2, #0x68
	ldr r1, _080263F4 @ =gUnknown_080D672C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08026408
	ldr r2, [r6, #0x20]
	ldr r0, _080263F8 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r6, #0x20]
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080263CE
	movs r1, #8
_080263CE:
	ldr r0, _080263FC @ =gUnknown_080D6920
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _080263E4
	rsbs r1, r1, #0
_080263E4:
	strh r1, [r6, #0x14]
	ldr r1, _08026400 @ =gPlayer
	ldr r0, _08026404 @ =sub_8025A0C
	str r0, [r1]
	movs r0, #0x6e
	bl m4aSongNumStart
	b _080264B2
	.align 2, 0
_080263F4: .4byte gUnknown_080D672C
_080263F8: .4byte 0xFFFFFBFF
_080263FC: .4byte gUnknown_080D6920
_08026400: .4byte gPlayer
_08026404: .4byte sub_8025A0C
_08026408:
	ldrh r4, [r6, #0x26]
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08026420
	asrs r0, r0, #0x15
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bgt _08026420
	movs r4, #0
_08026420:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _080264D8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08026490
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r2, _080264DC @ =gMPlayTable
	ldr r0, _080264E0 @ =gSongTable
	movs r1, #0xdb
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _080264E4 @ =0x0000FFFF
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x80
	rsbs r2, r2, #0
	ands r2, r4
	adds r0, r5, #0
	bl m4aMPlayPitchControl
	movs r0, #0x80
	lsls r0, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bge _0802647E
	adds r2, r1, #0
_0802647E:
	adds r4, r2, #0
	adds r2, r6, #0
	adds r2, #0x6a
	movs r0, #1
	movs r1, #1
	strh r1, [r2]
	adds r1, r6, #0
	adds r1, #0x6c
	strb r0, [r1]
_08026490:
	strh r4, [r6, #0x26]
	cmp r7, #3
	bne _080264B2
	adds r2, r6, #0
	adds r2, #0x6a
	ldrh r0, [r2]
	cmp r0, #1
	bne _080264B2
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080264B2
	movs r0, #0
	strh r0, [r2]
_080264B2:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08026598
	adds r0, r6, #0
	bl sub_80236C8
	adds r0, r6, #0
	bl sub_80232D0
	ldr r0, [r6, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080264E8
	ldrh r0, [r6, #0x12]
	adds r0, #0xc
	b _080264EC
	.align 2, 0
_080264D8: .4byte gPlayerControls
_080264DC: .4byte gMPlayTable
_080264E0: .4byte gSongTable
_080264E4: .4byte 0x0000FFFF
_080264E8:
	ldrh r0, [r6, #0x12]
	adds r0, #0x2a
_080264EC:
	strh r0, [r6, #0x12]
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r3, _08026538 @ =gUnknown_03005424
	ldr r1, _0802653C @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026510
	ldrh r0, [r6, #0x12]
	rsbs r0, r0, #0
	strh r0, [r6, #0x12]
_08026510:
	ldrh r2, [r6, #0x12]
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08026520
	adds r2, r1, #0
_08026520:
	strh r2, [r6, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026540
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	b _08026548
	.align 2, 0
_08026538: .4byte gUnknown_03005424
_0802653C: .4byte gUnknown_0300544C
_08026540:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
_08026548:
	str r0, [r6, #0xc]
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08026560
	adds r1, #2
	cmp r1, #0
	ble _0802656C
	b _0802656A
_08026560:
	cmp r1, #0
	ble _0802656C
	subs r1, #2
	cmp r1, #0
	bge _0802656C
_0802656A:
	movs r1, #0
_0802656C:
	strb r1, [r5]
	adds r0, r6, #0
	bl sub_8022190
	ldr r0, [r6, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	beq _08026580
	b _0802668C
_08026580:
	ldr r1, _08026590 @ =gPlayer
	ldr r0, _08026594 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r6, #0x10]
	movs r1, #0
	strh r0, [r6, #0x14]
	strb r1, [r5]
	b _0802668C
	.align 2, 0
_08026590: .4byte gPlayer
_08026594: .4byte sub_8025318
_08026598:
	movs r1, #0x14
	ldrsh r3, [r6, r1]
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r4, [r0]
	adds r1, r4, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _080265E2
	cmp r3, #0
	beq _080265E2
	ldr r1, _080265D4 @ =gSineTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _080265D8
	cmp r2, #0
	bgt _080265DE
	b _080265DC
	.align 2, 0
_080265D4: .4byte gSineTable
_080265D8:
	cmp r2, #0
	blt _080265DE
_080265DC:
	asrs r2, r0, #0xa
_080265DE:
	adds r3, r3, r2
	strh r3, [r6, #0x14]
_080265E2:
	adds r0, r6, #0
	bl sub_80232D0
	adds r0, r6, #0
	bl sub_8023260
	adds r0, r6, #0
	bl sub_8023128
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r3, _0802663C @ =gUnknown_03005424
	ldr r1, _08026640 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026616
	ldrh r0, [r6, #0x12]
	rsbs r0, r0, #0
	strh r0, [r6, #0x12]
_08026616:
	ldrh r2, [r6, #0x12]
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08026626
	adds r2, r1, #0
_08026626:
	strh r2, [r6, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026644
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	b _0802664C
	.align 2, 0
_0802663C: .4byte gUnknown_03005424
_08026640: .4byte gUnknown_0300544C
_08026644:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
_0802664C:
	str r0, [r6, #0xc]
	adds r0, r6, #0
	bl sub_8022D6C
	ldrh r0, [r6, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r6, r1]
	cmp r2, #0
	beq _08026662
	subs r0, #1
	b _0802668A
_08026662:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0802668C
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _08026678
	rsbs r1, r1, #0
_08026678:
	ldr r0, _08026698 @ =0x000001DF
	cmp r1, r0
	bgt _0802668C
	strh r2, [r6, #0x14]
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x1e
_0802668A:
	strh r0, [r6, #0x2a]
_0802668C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026698: .4byte 0x000001DF

	thumb_func_start sub_802669C
sub_802669C: @ 0x0802669C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	movs r6, #0
	strb r6, [r4]
	adds r0, #0x24
	strb r6, [r0]
	adds r3, r5, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802670C @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08026710 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08026718
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	ldrb r2, [r4]
	movs r3, #8
	rsbs r3, r3, #0
	str r6, [sp]
	ldr r4, _08026714 @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801E6D4
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	b _0802673A
	.align 2, 0
_0802670C: .4byte 0xFFFFCFFF
_08026710: .4byte gUnknown_03005424
_08026714: .4byte sub_801EE64
_08026718:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	ldrb r2, [r4]
	str r3, [sp]
	ldr r3, _0802675C @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E6D4
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
_0802673A:
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r2, _08026760 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r2, #0x20]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802675C: .4byte sub_801EE64
_08026760: .4byte gPlayer

	thumb_func_start sub_8026764
sub_8026764: @ 0x08026764
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #0x11
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x29
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080267C4
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	ldr r2, _080267C0 @ =0xFFFFFF00
	cmp r0, r2
	ble _080267B4
	adds r1, r2, #0
_080267B4:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _080267E8
	b _080267E6
	.align 2, 0
_080267C0: .4byte 0xFFFFFF00
_080267C4:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	asrs r2, r5, #0x10
	cmp r0, r2
	bge _080267DC
	adds r1, r2, #0
_080267DC:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bge _080267E8
_080267E6:
	adds r1, r2, #0
_080267E8:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_802669C
	movs r0, #0x72
	bl m4aSongNumStart
	ldr r0, _08026808 @ =gPlayer
	ldr r1, _0802680C @ =sub_8026810
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026808: .4byte gPlayer
_0802680C: .4byte sub_8026810

	thumb_func_start sub_8026810
sub_8026810: @ 0x08026810
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _08026868
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802685C @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08026860 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _08026864 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	b _080269B4
	.align 2, 0
_0802685C: .4byte 0xFFFFCFFF
_08026860: .4byte gPlayer
_08026864: .4byte 0xBFFFFFFF
_08026868:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, #0x14]
	cmp r0, #0
	blt _0802687C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _08026882
_0802687C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_08026882:
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _080268AC
	ldr r1, _080268D0 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	adds r0, r3, r0
	strh r0, [r4, #0x14]
_080268AC:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080268DA
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080268D4
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080268D8
	.align 2, 0
_080268D0: .4byte gSineTable
_080268D4:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080268D8:
	strh r0, [r4, #0x12]
_080268DA:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08026924 @ =gUnknown_03005424
	ldr r1, _08026928 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080268FC
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080268FC:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0802690C
	adds r2, r1, #0
_0802690C:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802692C
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08026934
	.align 2, 0
_08026924: .4byte gUnknown_03005424
_08026928: .4byte gUnknown_0300544C
_0802692C:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08026934:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	movs r0, #0x72
	bl m4aSongNumStartOrContinue
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080269A8
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026998 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0802699C @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _080269A0 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	ldr r0, _080269A4 @ =sub_8025E18
	str r0, [r4]
	b _080269B4
	.align 2, 0
_08026998: .4byte 0xFFFFCFFF
_0802699C: .4byte gPlayer
_080269A0: .4byte 0xBFFFFFFF
_080269A4: .4byte sub_8025E18
_080269A8:
	ldr r0, _080269BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080269B4
	bl sub_801F488
_080269B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080269BC: .4byte gGameMode

	thumb_func_start sub_80269C0
sub_80269C0: @ 0x080269C0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_80218E4
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xfe
	ands r0, r1
	str r0, [r5, #0x20]
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
	adds r3, r5, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026A3C @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08026A40 @ =gPlayer
	ldr r0, [r4, #0x20]
	ldr r1, _08026A44 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	ldr r1, _08026A48 @ =sub_80253C4
	str r1, [r4]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026A3C: .4byte 0xFFFFCFFF
_08026A40: .4byte gPlayer
_08026A44: .4byte 0xBFFFFFFF
_08026A48: .4byte sub_80253C4

	thumb_func_start sub_8026A4C
sub_8026A4C: @ 0x08026A4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _08026AAC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08026AB8
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _08026AB0 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08026AB8
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08026A9E
	cmp r0, #4
	bne _08026AB8
_08026A9E:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x2a
	strh r1, [r0]
	ldr r0, _08026AB4 @ =0x0000F880
	b _08026AC2
	.align 2, 0
_08026AAC: .4byte gGameMode
_08026AB0: .4byte gPlayerControls
_08026AB4: .4byte 0x0000F880
_08026AB8:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x27
	strh r1, [r0]
	ldr r0, _08026B50 @ =0x0000FB20
_08026AC2:
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08026ADA
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x12]
_08026ADA:
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026B54 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x38
	movs r6, #1
	strb r6, [r0]
	ldr r5, _08026B58 @ =gPlayer
	ldr r0, [r5, #0x20]
	ldr r1, _08026B5C @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08026B2A
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_08026B2A:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08026B38
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
_08026B38:
	movs r0, #0x74
	bl m4aSongNumStart
	ldr r1, _08026B60 @ =sub_8029074
	str r1, [r5]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026B50: .4byte 0x0000FB20
_08026B54: .4byte 0xFFFFCFFF
_08026B58: .4byte gPlayer
_08026B5C: .4byte 0xBFFFFFFF
_08026B60: .4byte sub_8029074

	thumb_func_start sub_8026B64
sub_8026B64: @ 0x08026B64
	push {r4, lr}
	adds r4, r0, #0
	ldrh r3, [r4, #0x14]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08026BB6
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	beq _08026BB6
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08026B98
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldr r0, [r4, #0x44]
	cmp r2, r0
	bge _08026B98
	adds r0, r2, #0
	adds r0, #8
	b _08026BB2
_08026B98:
	ldrh r1, [r1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08026BB6
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	ble _08026BB6
	adds r0, r1, #0
	subs r0, #8
_08026BB2:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08026BB6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	bgt _08026BC4
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08026BC4:
	strh r3, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8026BCC
sub_8026BCC: @ 0x08026BCC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _08026BDA
	b _08026D18
_08026BDA:
	adds r0, r4, #0
	bl sub_8026B64
	adds r0, r4, #0
	bl sub_8023128
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _08026C1A
	ldr r1, _08026C40 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08026C1A
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_08026C1A:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08026C4A
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08026C44
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08026C48
	.align 2, 0
_08026C40: .4byte gSineTable
_08026C44:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08026C48:
	strh r0, [r4, #0x12]
_08026C4A:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08026C94 @ =gUnknown_03005424
	ldr r1, _08026C98 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026C6C
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08026C6C:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08026C7C
	adds r2, r1, #0
_08026C7C:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026C9C
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08026CA4
	.align 2, 0
_08026C94: .4byte gUnknown_03005424
_08026C98: .4byte gUnknown_0300544C
_08026C9C:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08026CA4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08026CBA
	subs r0, #1
	b _08026CE2
_08026CBA:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08026CE4
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08026CD0
	rsbs r1, r1, #0
_08026CD0:
	ldr r0, _08026CFC @ =0x000001DF
	cmp r1, r0
	bgt _08026CE4
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08026CE2:
	strh r0, [r4, #0x2a]
_08026CE4:
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08026D08
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r1, _08026D00 @ =gPlayer
	ldr r0, _08026D04 @ =sub_8025E18
	b _08026D16
	.align 2, 0
_08026CFC: .4byte 0x000001DF
_08026D00: .4byte gPlayer
_08026D04: .4byte sub_8025E18
_08026D08:
	ldr r0, _08026D20 @ =0x00000808
	ands r1, r0
	subs r0, #8
	cmp r1, r0
	beq _08026D18
	ldr r1, _08026D24 @ =gPlayer
	ldr r0, _08026D28 @ =sub_8025318
_08026D16:
	str r0, [r1]
_08026D18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026D20: .4byte 0x00000808
_08026D24: .4byte gPlayer
_08026D28: .4byte sub_8025318

	thumb_func_start sub_8026D2C
sub_8026D2C: @ 0x08026D2C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08026D56
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08026D5A
_08026D56:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08026D5A:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08026DA4 @ =gUnknown_03005424
	ldr r1, _08026DA8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026D7E
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08026D7E:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08026D8E
	adds r2, r1, #0
_08026D8E:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026DAC
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08026DB4
	.align 2, 0
_08026DA4: .4byte gUnknown_03005424
_08026DA8: .4byte gUnknown_0300544C
_08026DAC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08026DB4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08026DCC
	adds r1, #2
	cmp r1, #0
	ble _08026DD8
	b _08026DD6
_08026DCC:
	cmp r1, #0
	ble _08026DD8
	subs r1, #2
	cmp r1, #0
	bge _08026DD8
_08026DD6:
	movs r1, #0
_08026DD8:
	strb r1, [r5]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08026DF0
	adds r0, r4, #0
	bl sub_8022218
	adds r0, r4, #0
	bl sub_8022284
	b _08026DFC
_08026DF0:
	adds r0, r4, #0
	bl sub_8022284
	adds r0, r4, #0
	bl sub_8022218
_08026DFC:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08026E14
	ldr r1, _08026E1C @ =gPlayer
	ldr r0, _08026E20 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08026E14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026E1C: .4byte gPlayer
_08026E20: .4byte sub_8025318

	thumb_func_start sub_8026E24
sub_8026E24: @ 0x08026E24
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	ldr r1, _08026E74 @ =0x00080204
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r3, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x24
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	ldr r1, [r4, #0x20]
	subs r0, #6
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	movs r2, #0x30
	ands r2, r0
	cmp r2, #0x10
	beq _08026E96
	cmp r2, #0x10
	bgt _08026E78
	cmp r2, #0
	beq _08026E82
	b _08026ECA
	.align 2, 0
_08026E74: .4byte 0x00080204
_08026E78:
	cmp r2, #0x20
	beq _08026EA6
	cmp r2, #0x30
	beq _08026EB8
	b _08026ECA
_08026E82:
	movs r0, #2
	orrs r1, r0
	str r1, [r4, #0x20]
	strh r3, [r4, #0x10]
	movs r0, #0xf4
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	movs r0, #0xc0
	lsls r0, r0, #4
	b _08026EC8
_08026E96:
	movs r0, #2
	orrs r1, r0
	str r1, [r4, #0x20]
	strh r3, [r4, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #4
	strh r0, [r4, #0x12]
	b _08026EC8
_08026EA6:
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0x20]
	movs r0, #0xf4
	lsls r0, r0, #8
	b _08026EC4
_08026EB8:
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #4
_08026EC4:
	strh r0, [r4, #0x10]
	strh r3, [r4, #0x12]
_08026EC8:
	strh r0, [r4, #0x14]
_08026ECA:
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026F04 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x93
	bl m4aSongNumStart
	ldr r0, _08026F08 @ =gPlayer
	ldr r1, _08026F0C @ =sub_802A3B8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026F04: .4byte 0xFFFFCFFF
_08026F08: .4byte gPlayer
_08026F0C: .4byte sub_802A3B8

	thumb_func_start sub_8026F10
sub_8026F10: @ 0x08026F10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	ldr r1, _08026F68 @ =0x0000080A
	ands r0, r1
	subs r1, #0xa
	cmp r0, r1
	bne _08026F74
	adds r0, r5, #0
	bl sub_80218E4
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x3e
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0x92
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08026F6C @ =gPlayer
	ldr r1, _08026F70 @ =sub_8026BCC
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _08026FB4
	.align 2, 0
_08026F68: .4byte 0x0000080A
_08026F6C: .4byte gPlayer
_08026F70: .4byte sub_8026BCC
_08026F74:
	adds r0, r5, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08026FBC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x64
	movs r4, #4
	strh r4, [r0]
	adds r0, r5, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	orrs r0, r4
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x99
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08026FC0 @ =gPlayer
	ldr r1, _08026FC4 @ =sub_8025AB8
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_08026FB4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026FBC: .4byte 0xFFFFBFFF
_08026FC0: .4byte gPlayer
_08026FC4: .4byte sub_8025AB8

	thumb_func_start sub_8026FC8
sub_8026FC8: @ 0x08026FC8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0x5c
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08027000
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_08027000:
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08027014
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_08027014:
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x3f
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, _08027038 @ =gPlayer
	ldr r1, _0802703C @ =sub_8027040
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027038: .4byte gPlayer
_0802703C: .4byte sub_8027040

	thumb_func_start sub_8027040
sub_8027040: @ 0x08027040
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08027058
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	subs r0, #4
	b _08027060
_08027058:
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	adds r0, #4
_08027060:
	strb r0, [r1]
	adds r5, r1, #0
	adds r0, r4, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027086
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _0802708A
_08027086:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_0802708A:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080270D4 @ =gUnknown_03005424
	ldr r1, _080270D8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080270AE
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080270AE:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080270BE
	adds r2, r1, #0
_080270BE:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080270DC
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080270E4
	.align 2, 0
_080270D4: .4byte gUnknown_03005424
_080270D8: .4byte gUnknown_0300544C
_080270DC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080270E4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08027104
	ldr r1, _0802710C @ =gPlayer
	ldr r0, _08027110 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08027104:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802710C: .4byte gPlayer
_08027110: .4byte sub_8025318

	thumb_func_start sub_8027114
sub_8027114: @ 0x08027114
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08027132
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	beq _08027154
_08027132:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x2f
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
_08027154:
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	strb r1, [r0]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0802716E
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _08027174
_0802716E:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_08027174:
	str r0, [r4, #0x20]
	ldr r0, _08027188 @ =gPlayer
	ldr r1, _0802718C @ =sub_8027190
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027188: .4byte gPlayer
_0802718C: .4byte sub_8027190

	thumb_func_start sub_8027190
sub_8027190: @ 0x08027190
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x48]
	ldr r5, [r4, #0x40]
	ldrh r1, [r4, #0x14]
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080271C8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r2, r5, #0
	cmp r0, r2
	bge _08027202
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _08027202
	lsls r0, r2, #0x10
	b _08027200
_080271C8:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080271F0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	ble _08027202
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bge _08027202
	lsls r0, r5, #0x10
	b _08027200
_080271F0:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _080271FC
	subs r0, #8
	b _080271FE
_080271FC:
	adds r0, #8
_080271FE:
	lsls r0, r0, #0x10
_08027200:
	lsrs r1, r0, #0x10
_08027202:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_80232D0
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08027218
	subs r0, #1
	b _08027244
_08027218:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08027246
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08027232
	rsbs r1, r1, #0
_08027232:
	ldr r0, _0802724C @ =0x000001DF
	cmp r1, r0
	bgt _08027246
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08027244:
	strh r0, [r4, #0x2a]
_08027246:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802724C: .4byte 0x000001DF

	thumb_func_start sub_8027250
sub_8027250: @ 0x08027250
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	movs r0, #0x78
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0802726A
	rsbs r1, r1, #0
_0802726A:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	bgt _080272A8
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0xa0
	bgt _08027298
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08027288
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0802729A
_08027288:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08027298
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0802729A
_08027298:
	ldr r0, _080272A4 @ =0x0000FE80
_0802729A:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	b _080272C0
	.align 2, 0
_080272A4: .4byte 0x0000FE80
_080272A8:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _080272B6
	movs r0, #0xc0
	lsls r0, r0, #1
	b _080272B8
_080272B6:
	ldr r0, _08027314 @ =0x0000FE80
_080272B8:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x15
_080272C0:
	strh r0, [r1]
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080272E0
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x10]
_080272E0:
	adds r0, r4, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _08027318 @ =0xFFFFFDF3
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _0802731C @ =gPlayer
	ldr r1, _08027320 @ =sub_8027324
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027314: .4byte 0x0000FE80
_08027318: .4byte 0xFFFFFDF3
_0802731C: .4byte gPlayer
_08027320: .4byte sub_8027324

	thumb_func_start sub_8027324
sub_8027324: @ 0x08027324
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802733C
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08027340
_0802733C:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08027340:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _0802738C @ =gUnknown_03005424
	ldr r1, _08027390 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027364
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027364:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08027374
	adds r2, r1, #0
_08027374:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027394
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _0802739C
	.align 2, 0
_0802738C: .4byte gUnknown_03005424
_08027390: .4byte gUnknown_0300544C
_08027394:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_0802739C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080273C0
	ldr r1, _080273C8 @ =gPlayer
	ldr r0, _080273CC @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
_080273C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080273C8: .4byte gPlayer
_080273CC: .4byte sub_8025318

	thumb_func_start sub_80273D0
sub_80273D0: @ 0x080273D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080273E4 @ =gGameMode
	ldrb r2, [r0]
	cmp r2, #2
	bls _080273E8
	adds r0, r4, #0
	bl sub_802A4B8
	b _080274A2
	.align 2, 0
_080273E4: .4byte gGameMode
_080273E8:
	ldr r0, _08027410 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08027408
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08027404
	ldr r0, _08027414 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027408
_08027404:
	cmp r1, #0x1d
	bne _08027418
_08027408:
	adds r0, r4, #0
	bl sub_802A468
	b _080274A2
	.align 2, 0
_08027410: .4byte gCurrentLevel
_08027414: .4byte gUnknown_030054B0
_08027418:
	cmp r2, #1
	bne _08027422
	ldr r1, _08027440 @ =gUnknown_030054F4
	movs r0, #7
	strb r0, [r1]
_08027422:
	ldr r0, _08027444 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08027448
	ldr r0, _08027440 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08027448
	adds r0, r4, #0
	bl sub_802A40C
	b _080274A2
	.align 2, 0
_08027440: .4byte gUnknown_030054F4
_08027444: .4byte gPlayer
_08027448:
	adds r0, r4, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #6
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _08027478
	adds r0, r4, #0
	bl sub_802785C
	b _080274A2
_08027478:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080274A8 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r4, #0x20]
	ldr r1, _080274AC @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _080274B0 @ =gPlayer
	ldr r1, _080274B4 @ =sub_80274B8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_080274A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080274A8: .4byte 0xFFFFBFFF
_080274AC: .4byte 0xFFDFFFFF
_080274B0: .4byte gPlayer
_080274B4: .4byte sub_80274B8

	thumb_func_start sub_80274B8
sub_80274B8: @ 0x080274B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, _08027514 @ =gUnknown_030054D0
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, _08027518 @ =0x000001FF
	cmp r1, r0
	ble _080274E2
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080274E8
_080274E2:
	ldr r0, _0802751C @ =0x00000579
	cmp r2, r0
	bls _0802752C
_080274E8:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x19
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08027520 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0xe8
	bl m4aSongNumStart
	ldr r0, _08027524 @ =gPlayer
	ldr r1, _08027528 @ =sub_8027620
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	b _08027614
	.align 2, 0
_08027514: .4byte gUnknown_030054D0
_08027518: .4byte 0x000001FF
_0802751C: .4byte 0x00000579
_08027520: .4byte 0xFFFFBFFF
_08027524: .4byte gPlayer
_08027528: .4byte sub_8027620
_0802752C:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08027544
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bgt _08027540
	movs r1, #0
_08027540:
	strh r1, [r4, #0x14]
	b _08027548
_08027544:
	movs r0, #0
	strh r0, [r4, #0x14]
_08027548:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _08027558
	adds r0, r4, #0
	bl sub_802785C
	b _08027614
_08027558:
	ldr r2, _080275BC @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08027568
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_08027568:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080275C0 @ =gUnknown_03005424
	ldr r1, _080275C4 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027596
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027596:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080275A6
	adds r2, r1, #0
_080275A6:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080275C8
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080275D0
	.align 2, 0
_080275BC: .4byte gCamera
_080275C0: .4byte gUnknown_03005424
_080275C4: .4byte gUnknown_0300544C
_080275C8:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080275D0:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _080275E6
	subs r0, #1
	b _08027612
_080275E6:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08027614
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08027600
	rsbs r1, r1, #0
_08027600:
	ldr r0, _0802761C @ =0x000001DF
	cmp r1, r0
	bgt _08027614
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08027612:
	strh r0, [r4, #0x2a]
_08027614:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802761C: .4byte 0x000001DF

	thumb_func_start sub_8027620
sub_8027620: @ 0x08027620
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x68
	ldr r1, _080276C8 @ =gUnknown_080D672C
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _080276CC @ =gCamera
	ldr r2, [r3, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r2, r0
	ble _08027656
	subs r0, r2, #1
	str r0, [r3, #0x1c]
_08027656:
	cmp r1, #0x1f
	beq _0802765C
	b _0802778C
_0802765C:
	adds r0, r6, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	mov sb, r0
	cmp r1, #0
	bne _08027680
	adds r0, #0x26
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08027680
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x1a
	strh r0, [r1]
_08027680:
	mov r1, sb
	ldrh r0, [r1]
	cmp r0, #1
	bne _08027752
	movs r2, #0x14
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bgt _08027752
	adds r1, r6, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x1b
	strh r0, [r1]
	strh r2, [r6, #0x14]
	movs r0, #0xe8
	bl m4aSongNumStop
	ldr r0, _080276D0 @ =gUnknown_030054D0
	ldr r1, [r0]
	cmp r1, #0
	beq _08027752
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, r1, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _080276D4 @ =0x000002DA
	cmp r1, r0
	bhi _080276D8
	movs r1, #0xc8
	lsls r1, r1, #2
	mov r8, r1
	b _080276FC
	.align 2, 0
_080276C8: .4byte gUnknown_080D672C
_080276CC: .4byte gCamera
_080276D0: .4byte gUnknown_030054D0
_080276D4: .4byte 0x000002DA
_080276D8:
	ldr r0, _080276E8 @ =0x0000045A
	cmp r1, r0
	bhi _080276EC
	movs r2, #0xfa
	lsls r2, r2, #1
	mov r8, r2
	b _080276FC
	.align 2, 0
_080276E8: .4byte 0x0000045A
_080276EC:
	ldr r0, _08027774 @ =0x00000579
	cmp r2, r0
	bhi _080276F6
	movs r0, #0x64
	mov r8, r0
_080276F6:
	mov r1, r8
	cmp r1, #0
	beq _08027752
_080276FC:
	ldr r1, _08027778 @ =gUnknown_03005450
	ldr r5, [r1]
	mov r2, r8
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0802777C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08027744
	ldr r0, _08027780 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08027744
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08027784 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0802773C
	movs r0, #0xff
_0802773C:
	strb r0, [r1]
	ldr r1, _08027788 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08027744:
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r2, r8
	bl sub_801F3A4
_08027752:
	mov r1, sb
	ldrh r0, [r1]
	cmp r0, #2
	bne _0802778C
	adds r0, r6, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802778C
	adds r0, r6, #0
	bl sub_802785C
	b _0802784C
	.align 2, 0
_08027774: .4byte 0x00000579
_08027778: .4byte gUnknown_03005450
_0802777C: .4byte 0x0000C350
_08027780: .4byte gGameMode
_08027784: .4byte gNumLives
_08027788: .4byte gUnknown_030054A8
_0802778C:
	ldrh r0, [r6, #0x14]
	subs r0, #0x20
	strh r0, [r6, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802779C
	movs r0, #0
	strh r0, [r6, #0x14]
_0802779C:
	adds r0, r6, #0
	bl sub_8029FA4
	adds r0, r6, #0
	bl sub_80232D0
	adds r0, r6, #0
	bl sub_8023260
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r3, _080277F8 @ =gUnknown_03005424
	ldr r1, _080277FC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080277D0
	ldrh r0, [r6, #0x12]
	rsbs r0, r0, #0
	strh r0, [r6, #0x12]
_080277D0:
	ldrh r2, [r6, #0x12]
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080277E0
	adds r2, r1, #0
_080277E0:
	strh r2, [r6, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027800
	movs r2, #0x12
	ldrsh r1, [r6, r2]
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	b _08027808
	.align 2, 0
_080277F8: .4byte gUnknown_03005424
_080277FC: .4byte gUnknown_0300544C
_08027800:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
_08027808:
	str r0, [r6, #0xc]
	adds r0, r6, #0
	bl sub_8022D6C
	ldrh r0, [r6, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r6, r1]
	cmp r2, #0
	beq _0802781E
	subs r0, #1
	b _0802784A
_0802781E:
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0802784C
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _08027838
	rsbs r1, r1, #0
_08027838:
	ldr r0, _08027858 @ =0x000001DF
	cmp r1, r0
	bgt _0802784C
	strh r2, [r6, #0x14]
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x1e
_0802784A:
	strh r0, [r6, #0x2a]
_0802784C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027858: .4byte 0x000001DF

	thumb_func_start sub_802785C
sub_802785C: @ 0x0802785C
	push {lr}
	adds r1, r0, #0
	ldr r3, _08027898 @ =gCamera
	ldr r2, [r3, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r2, r0
	ble _08027870
	subs r0, r2, #1
	str r0, [r3, #0x1c]
_08027870:
	adds r2, r1, #0
	adds r2, #0x72
	movs r0, #0x5a
	strh r0, [r2]
	ldr r0, _0802789C @ =gCurrentLevel
	ldrb r2, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1b
	bgt _080278CA
	movs r0, #3
	ands r0, r2
	cmp r0, #1
	beq _080278AC
	cmp r0, #1
	bgt _080278A0
	cmp r0, #0
	beq _080278A6
	b _080278D0
	.align 2, 0
_08027898: .4byte gCamera
_0802789C: .4byte gCurrentLevel
_080278A0:
	cmp r0, #2
	beq _080278C4
	b _080278D0
_080278A6:
	adds r1, #0x64
	movs r0, #0x1c
	b _080278B0
_080278AC:
	adds r1, #0x64
	movs r0, #0x1d
_080278B0:
	strh r0, [r1]
	ldr r1, _080278BC @ =gPlayer
	ldr r0, _080278C0 @ =sub_80278D4
	str r0, [r1]
	b _080278D0
	.align 2, 0
_080278BC: .4byte gPlayer
_080278C0: .4byte sub_80278D4
_080278C4:
	adds r1, #0x64
	movs r0, #0x20
	b _080278CE
_080278CA:
	adds r1, #0x64
	movs r0, #0x1c
_080278CE:
	strh r0, [r1]
_080278D0:
	pop {r0}
	bx r0

	thumb_func_start sub_80278D4
sub_80278D4: @ 0x080278D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0802790C @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _080278E8
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_080278E8:
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802792E
	ldr r0, _08027910 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _08027918
	ldr r0, _08027914 @ =gUnknown_03005490
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _08027928
	.align 2, 0
_0802790C: .4byte gCamera
_08027910: .4byte gGameMode
_08027914: .4byte gUnknown_03005490
_08027918:
	ldr r0, _08027984 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _08027988 @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _0802798C @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_08027928:
	ldr r1, _08027990 @ =gPlayer
	ldr r0, _08027994 @ =sub_802A3F0
	str r0, [r1]
_0802792E:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08027998 @ =gUnknown_03005424
	ldr r1, _0802799C @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802795C
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_0802795C:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0802796C
	adds r2, r1, #0
_0802796C:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080279A0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080279A8
	.align 2, 0
_08027984: .4byte gUnknown_03005490
_08027988: .4byte gCourseTime
_0802798C: .4byte gUnknown_030054F4
_08027990: .4byte gPlayer
_08027994: .4byte sub_802A3F0
_08027998: .4byte gUnknown_03005424
_0802799C: .4byte gUnknown_0300544C
_080279A0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080279A8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _080279BE
	subs r0, #1
	b _080279EA
_080279BE:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080279EC
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _080279D8
	rsbs r1, r1, #0
_080279D8:
	ldr r0, _080279F4 @ =0x000001DF
	cmp r1, r0
	bgt _080279EC
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_080279EA:
	strh r0, [r4, #0x2a]
_080279EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080279F4: .4byte 0x000001DF

	thumb_func_start sub_80279F8
sub_80279F8: @ 0x080279F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	movs r0, #0xb0
	lsls r0, r0, #3
	cmp r1, r0
	ble _08027A10
	adds r0, r2, #0
	subs r0, #0x80
	b _08027A28
_08027A10:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, _08027A20 @ =0x000004BF
	cmp r1, r0
	bgt _08027A24
	adds r0, r2, #0
	adds r0, #0x40
	b _08027A28
	.align 2, 0
_08027A20: .4byte 0x000004BF
_08027A24:
	movs r0, #0xa0
	lsls r0, r0, #3
_08027A28:
	strh r0, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x72
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _08027A68 @ =0x00007FFE
	cmp r1, r0
	bgt _08027A3E
	adds r0, r3, #1
	strh r0, [r2]
_08027A3E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x78
	bne _08027A4E
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x20
	strh r0, [r1]
_08027A4E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0xb4
	bne _08027A84
	ldr r0, _08027A6C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _08027A74
	ldr r0, _08027A70 @ =gUnknown_03005490
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _08027A84
	.align 2, 0
_08027A68: .4byte 0x00007FFE
_08027A6C: .4byte gGameMode
_08027A70: .4byte gUnknown_03005490
_08027A74:
	ldr r0, _08027AD8 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _08027ADC @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _08027AE0 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_08027A84:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08027AE4 @ =gUnknown_03005424
	ldr r1, _08027AE8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027AB2
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027AB2:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08027AC2
	adds r2, r1, #0
_08027AC2:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027AEC
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08027AF4
	.align 2, 0
_08027AD8: .4byte gUnknown_03005490
_08027ADC: .4byte gCourseTime
_08027AE0: .4byte gUnknown_030054F4
_08027AE4: .4byte gUnknown_03005424
_08027AE8: .4byte gUnknown_0300544C
_08027AEC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08027AF4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08027B0A
	subs r0, #1
	b _08027B36
_08027B0A:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08027B38
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08027B24
	rsbs r1, r1, #0
_08027B24:
	ldr r0, _08027B84 @ =0x000001DF
	cmp r1, r0
	bgt _08027B38
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08027B36:
	strh r0, [r4, #0x2a]
_08027B38:
	ldr r2, _08027B88 @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08027B48
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_08027B48:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08027B7E
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #1
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #4
	strh r0, [r4, #0x14]
	adds r1, #8
	movs r0, #9
	strh r0, [r1]
	bl sub_801583C
	ldr r1, _08027B8C @ =gPlayer
	ldr r0, _08027B90 @ =sub_8027B98
	str r0, [r1]
	ldr r0, _08027B94 @ =0x00000111
	bl m4aSongNumStart
_08027B7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027B84: .4byte 0x000001DF
_08027B88: .4byte gCamera
_08027B8C: .4byte gPlayer
_08027B90: .4byte sub_8027B98
_08027B94: .4byte 0x00000111

	thumb_func_start sub_8027B98
sub_8027B98: @ 0x08027B98
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08027BF0 @ =gUnknown_03005424
	ldr r1, _08027BF4 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027BC8
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027BC8:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08027BD8
	adds r2, r1, #0
_08027BD8:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027BF8
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08027C00
	.align 2, 0
_08027BF0: .4byte gUnknown_03005424
_08027BF4: .4byte gUnknown_0300544C
_08027BF8:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08027C00:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08027C16
	subs r0, #1
	b _08027C42
_08027C16:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08027C44
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08027C30
	rsbs r1, r1, #0
_08027C30:
	ldr r0, _08027C54 @ =0x000001DF
	cmp r1, r0
	bgt _08027C44
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08027C42:
	strh r0, [r4, #0x2a]
_08027C44:
	ldr r1, _08027C58 @ =gCamera
	ldr r0, [r1, #8]
	subs r0, #0x38
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027C54: .4byte 0x000001DF
_08027C58: .4byte gCamera

	thumb_func_start sub_8027C5C
sub_8027C5C: @ 0x08027C5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, _08027C74 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	cmp r0, #0x78
	ble _08027C78
	movs r0, #0x90
	lsls r0, r0, #3
	b _08027C86
	.align 2, 0
_08027C74: .4byte gCamera
_08027C78:
	cmp r0, #0x77
	bgt _08027C82
	movs r0, #0xb0
	lsls r0, r0, #3
	b _08027C86
_08027C82:
	movs r0, #0xa0
	lsls r0, r0, #3
_08027C86:
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08027CDC @ =gUnknown_03005424
	ldr r1, _08027CE0 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027CB6
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027CB6:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08027CC6
	adds r2, r1, #0
_08027CC6:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027CE4
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08027CEC
	.align 2, 0
_08027CDC: .4byte gUnknown_03005424
_08027CE0: .4byte gUnknown_0300544C
_08027CE4:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08027CEC:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08027D02
	subs r0, #1
	b _08027D2E
_08027D02:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08027D30
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08027D1C
	rsbs r1, r1, #0
_08027D1C:
	ldr r0, _08027D38 @ =0x000001DF
	cmp r1, r0
	bgt _08027D30
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08027D2E:
	strh r0, [r4, #0x2a]
_08027D30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D38: .4byte 0x000001DF

	thumb_func_start sub_8027D3C
sub_8027D3C: @ 0x08027D3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r1, _08027D78 @ =gUnknown_030054B4
	ldr r0, _08027D7C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08027D80 @ =gUnknown_030054D0
	mov r2, r8
	lsls r1, r2, #5
	adds r1, #0x40
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r5, r0, #8
	ldr r0, [r4, #8]
	cmp r0, r5
	bhs _08027D84
	adds r1, r4, #0
	adds r1, #0x5c
	movs r0, #0x10
	b _08027D96
	.align 2, 0
_08027D78: .4byte gUnknown_030054B4
_08027D7C: .4byte 0x04000128
_08027D80: .4byte gUnknown_030054D0
_08027D84:
	cmp r0, r5
	bls _08027D90
	adds r1, r4, #0
	adds r1, #0x5c
	movs r0, #0x20
	b _08027D96
_08027D90:
	adds r1, r4, #0
	adds r1, #0x5c
	movs r0, #0
_08027D96:
	strh r0, [r1]
	adds r6, r1, #0
	adds r0, r4, #0
	bl sub_802966C
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0xbf
	bgt _08027DD4
	ldr r1, _08027E28 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08027DD4
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_08027DD4:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08027E2C @ =gUnknown_03005424
	ldr r1, _08027E30 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027E02
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027E02:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08027E12
	adds r2, r1, #0
_08027E12:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027E34
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08027E3C
	.align 2, 0
_08027E28: .4byte gSineTable
_08027E2C: .4byte gUnknown_03005424
_08027E30: .4byte gUnknown_0300544C
_08027E34:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08027E3C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08027E52
	subs r0, #1
	b _08027E7A
_08027E52:
	ldrb r0, [r7]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08027E7C
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08027E68
	rsbs r1, r1, #0
_08027E68:
	ldr r0, _08027EB8 @ =0x000001DF
	cmp r1, r0
	bgt _08027E7C
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08027E7A:
	strh r0, [r4, #0x2a]
_08027E7C:
	ldr r1, [r4, #8]
	cmp r1, r5
	bls _08027E88
	ldrh r0, [r6]
	cmp r0, #0x10
	beq _08027E96
_08027E88:
	cmp r1, r5
	bhs _08027E92
	ldrh r0, [r6]
	cmp r0, #0x20
	beq _08027E96
_08027E92:
	cmp r1, r5
	bne _08027EDC
_08027E96:
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0
	strb r1, [r0]
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	strh r1, [r4, #0x14]
	str r5, [r4, #8]
	mov r0, r8
	cmp r0, #3
	bhi _08027EBC
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x1c
	strh r0, [r1]
	b _08027EC2
	.align 2, 0
_08027EB8: .4byte 0x000001DF
_08027EBC:
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
_08027EC2:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0
	strh r0, [r1]
	strh r0, [r6]
	ldr r1, _08027EE8 @ =gPlayer
	ldr r0, _08027EEC @ =sub_802A4FC
	str r0, [r1]
_08027EDC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027EE8: .4byte gPlayer
_08027EEC: .4byte sub_802A4FC

	thumb_func_start sub_8027EF0
sub_8027EF0: @ 0x08027EF0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08027FD0
	adds r0, r4, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027F20
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _08027F24
_08027F20:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_08027F24:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08027F70 @ =gUnknown_03005424
	ldr r1, _08027F74 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027F48
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08027F48:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08027F58
	adds r2, r1, #0
_08027F58:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08027F78
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08027F80
	.align 2, 0
_08027F70: .4byte gUnknown_03005424
_08027F74: .4byte gUnknown_0300544C
_08027F78:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08027F80:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08027F98
	adds r1, #2
	cmp r1, #0
	ble _08027FA4
	b _08027FA2
_08027F98:
	cmp r1, #0
	ble _08027FA4
	subs r1, #2
	cmp r1, #0
	bge _08027FA4
_08027FA2:
	movs r1, #0
_08027FA4:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08028080
	ldr r1, _08027FC8 @ =gPlayer
	ldr r0, _08027FCC @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
	b _08028080
	.align 2, 0
_08027FC8: .4byte gPlayer
_08027FCC: .4byte sub_8025318
_08027FD0:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_80231C0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _0802802C @ =gUnknown_03005424
	ldr r1, _08028030 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028004
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08028004:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028014
	adds r2, r1, #0
_08028014:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028034
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _0802803C
	.align 2, 0
_0802802C: .4byte gUnknown_03005424
_08028030: .4byte gUnknown_0300544C
_08028034:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_0802803C:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _08028052
	subs r0, #1
	b _0802807E
_08028052:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08028080
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0802806C
	rsbs r1, r1, #0
_0802806C:
	ldr r0, _08028088 @ =0x000001DF
	cmp r1, r0
	bgt _08028080
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0802807E:
	strh r0, [r4, #0x2a]
_08028080:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028088: .4byte 0x000001DF

	thumb_func_start sub_802808C
sub_802808C: @ 0x0802808C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08028148
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080280E8 @ =gUnknown_03005424
	ldr r1, _080280EC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080280C2
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080280C2:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080280D2
	adds r2, r1, #0
_080280D2:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080280F0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080280F8
	.align 2, 0
_080280E8: .4byte gUnknown_03005424
_080280EC: .4byte gUnknown_0300544C
_080280F0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080280F8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028110
	adds r1, #2
	cmp r1, #0
	ble _0802811C
	b _0802811A
_08028110:
	cmp r1, #0
	ble _0802811C
	subs r1, #2
	cmp r1, #0
	bge _0802811C
_0802811A:
	movs r1, #0
_0802811C:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080281F8
	ldr r1, _08028140 @ =gPlayer
	ldr r0, _08028144 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
	b _080281F8
	.align 2, 0
_08028140: .4byte gPlayer
_08028144: .4byte sub_8025318
_08028148:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_80231C0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080281A4 @ =gUnknown_03005424
	ldr r1, _080281A8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802817C
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_0802817C:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0802818C
	adds r2, r1, #0
_0802818C:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080281AC
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080281B4
	.align 2, 0
_080281A4: .4byte gUnknown_03005424
_080281A8: .4byte gUnknown_0300544C
_080281AC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080281B4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _080281CA
	subs r0, #1
	b _080281F6
_080281CA:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080281F8
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _080281E4
	rsbs r1, r1, #0
_080281E4:
	ldr r0, _08028200 @ =0x000001DF
	cmp r1, r0
	bgt _080281F8
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_080281F6:
	strh r0, [r4, #0x2a]
_080281F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028200: .4byte 0x000001DF

	thumb_func_start sub_8028204
sub_8028204: @ 0x08028204
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _08028226
	movs r1, #0xc
_08028226:
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _08028238
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08028238:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, r2
	strh r2, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08028288 @ =gUnknown_03005424
	ldr r1, _0802828C @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028260
	rsbs r0, r2, #0
	strh r0, [r4, #0x12]
_08028260:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028270
	adds r2, r1, #0
_08028270:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028290
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028298
	.align 2, 0
_08028288: .4byte gUnknown_03005424
_0802828C: .4byte gUnknown_0300544C
_08028290:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028298:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080282B0
	adds r1, #2
	cmp r1, #0
	ble _080282BC
	b _080282BA
_080282B0:
	cmp r1, #0
	ble _080282BC
	subs r1, #2
	cmp r1, #0
	bge _080282BC
_080282BA:
	movs r1, #0
_080282BC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080282DC
	ldr r1, _080282E4 @ =gPlayer
	ldr r0, _080282E8 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080282DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080282E4: .4byte gPlayer
_080282E8: .4byte sub_8025318

	thumb_func_start sub_80282EC
sub_80282EC: @ 0x080282EC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	asrs r0, r0, #1
	str r0, [r4, #0x48]
	adds r0, r4, #0
	bl sub_8023610
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _08028310
	adds r0, r4, #0
	bl sub_80236C8
_08028310:
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08028360 @ =gUnknown_03005424
	ldr r1, _08028364 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028338
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08028338:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028348
	adds r2, r1, #0
_08028348:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028368
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028370
	.align 2, 0
_08028360: .4byte gUnknown_03005424
_08028364: .4byte gUnknown_0300544C
_08028368:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028370:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028388
	adds r1, #2
	cmp r1, #0
	ble _08028394
	b _08028392
_08028388:
	cmp r1, #0
	ble _08028394
	subs r1, #2
	cmp r1, #0
	bge _08028394
_08028392:
	movs r1, #0
_08028394:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080283B4
	ldr r1, _080283BC @ =gPlayer
	ldr r0, _080283C0 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080283B4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080283BC: .4byte gPlayer
_080283C0: .4byte sub_8025318

	thumb_func_start sub_80283C4
sub_80283C4: @ 0x080283C4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08028414 @ =gUnknown_03005424
	ldr r1, _08028418 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080283EE
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080283EE:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080283FE
	adds r2, r1, #0
_080283FE:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802841C
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028424
	.align 2, 0
_08028414: .4byte gUnknown_03005424
_08028418: .4byte gUnknown_0300544C
_0802841C:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028424:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0802843C
	adds r1, #2
	cmp r1, #0
	ble _08028448
	b _08028446
_0802843C:
	cmp r1, #0
	ble _08028448
	subs r1, #2
	cmp r1, #0
	bge _08028448
_08028446:
	movs r1, #0
_08028448:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08028468
	ldr r1, _08028470 @ =gPlayer
	ldr r0, _08028474 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08028468:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028470: .4byte gPlayer
_08028474: .4byte sub_8025318

	thumb_func_start sub_8028478
sub_8028478: @ 0x08028478
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08028550
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080284A2
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080284A6
_080284A2:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080284A6:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080284F0 @ =gUnknown_03005424
	ldr r1, _080284F4 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080284CA
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080284CA:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080284DA
	adds r2, r1, #0
_080284DA:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080284F8
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028500
	.align 2, 0
_080284F0: .4byte gUnknown_03005424
_080284F4: .4byte gUnknown_0300544C
_080284F8:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028500:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028518
	adds r1, #2
	cmp r1, #0
	ble _08028524
	b _08028522
_08028518:
	cmp r1, #0
	ble _08028524
	subs r1, #2
	cmp r1, #0
	bge _08028524
_08028522:
	movs r1, #0
_08028524:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	beq _08028538
	b _08028634
_08028538:
	ldr r1, _08028548 @ =gPlayer
	ldr r0, _0802854C @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
	b _08028634
	.align 2, 0
_08028548: .4byte gPlayer
_0802854C: .4byte sub_8025318
_08028550:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _08028584
	ldr r1, _080285E0 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _08028584
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_08028584:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_80231C0
	adds r0, r4, #0
	bl sub_8023260
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080285E4 @ =gUnknown_03005424
	ldr r1, _080285E8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080285B8
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080285B8:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080285C8
	adds r2, r1, #0
_080285C8:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080285EC
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080285F4
	.align 2, 0
_080285E0: .4byte gSineTable
_080285E4: .4byte gUnknown_03005424
_080285E8: .4byte gUnknown_0300544C
_080285EC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080285F4:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022D6C
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0802860A
	subs r0, #1
	b _08028632
_0802860A:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08028634
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _08028620
	rsbs r1, r1, #0
_08028620:
	ldr r0, _0802863C @ =0x000001DF
	cmp r1, r0
	bgt _08028634
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_08028632:
	strh r0, [r4, #0x2a]
_08028634:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802863C: .4byte 0x000001DF

	thumb_func_start sub_8028640
sub_8028640: @ 0x08028640
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	lsls r2, r2, #0x10
	mov r8, r2
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _080286D8 @ =gPlayer
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _080286DC @ =sub_801F214
	str r2, [sp]
	ldr r2, _080286E0 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov sb, r0
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r1, #0x16]
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r1, #0x18]
	ldr r0, _080286E4 @ =IWRAM_START + 0x1C
	adds r6, r2, r0
	ldr r5, _080286E8 @ =gUnknown_080D69A6
	mov r1, r8
	lsls r4, r1, #1
	add r4, r8
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	str r2, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r2, [sp, #8]
	ldr r1, _080286EC @ =IWRAM_START + 0x3C
	adds r2, r2, r1
	strb r0, [r2]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080286D8: .4byte gPlayer
_080286DC: .4byte sub_801F214
_080286E0: .4byte sub_801F550
_080286E4: .4byte IWRAM_START + 0x1C
_080286E8: .4byte gUnknown_080D69A6
_080286EC: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_80286F0
sub_80286F0: @ 0x080286F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x5b
	ldrb r6, [r0]
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08028740 @ =gUnknown_080D6992
	lsls r0, r6, #2
	adds r0, r0, r6
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r5, [r1]
	adds r0, r4, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	ldr r1, _08028744 @ =0x00002102
	orrs r0, r1
	ldr r1, _08028748 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0802874C
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0xa
	b _0802875A
	.align 2, 0
_08028740: .4byte gUnknown_080D6992
_08028744: .4byte 0x00002102
_08028748: .4byte 0xFEFFFFDF
_0802874C:
	movs r0, #8
	ands r5, r0
	cmp r5, #0
	beq _0802875C
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0x2d
_0802875A:
	strh r0, [r1]
_0802875C:
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	ldr r1, _0802879C @ =gUnknown_080D698A
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	adds r0, #0x2c
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080287A0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0x74
	bl m4aSongNumStart
	movs r0, #0xe6
	bl m4aSongNumStart
	ldr r0, _080287A4 @ =gPlayer
	ldr r1, _080287A8 @ =sub_80287AC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802879C: .4byte gUnknown_080D698A
_080287A0: .4byte 0xFFFFBFFF
_080287A4: .4byte gPlayer
_080287A8: .4byte sub_80287AC

	thumb_func_start sub_80287AC
sub_80287AC: @ 0x080287AC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08028848
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r5, [r0]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08028898 @ =gUnknown_080D693A
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r3, [r1]
	strh r3, [r4, #0x10]
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08028802
	rsbs r0, r3, #0
	strh r0, [r4, #0x10]
_08028802:
	ldr r1, _0802889C @ =gPlayer
	ldr r0, _080288A0 @ =sub_802890C
	str r0, [r1]
	ldr r0, _080288A4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08028848
	cmp r5, #2
	bne _08028826
	cmp r6, #0
	bne _08028826
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	bl sub_8028640
_08028826:
	cmp r5, #0
	bne _0802883C
	cmp r6, #3
	bne _0802883C
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8028640
_0802883C:
	cmp r5, #2
	bne _08028848
	cmp r6, #4
	bne _08028848
	bl sub_8086998
_08028848:
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080288A8 @ =gUnknown_03005424
	ldr r1, _080288AC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028870
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08028870:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028880
	adds r2, r1, #0
_08028880:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080288B0
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080288B8
	.align 2, 0
_08028898: .4byte gUnknown_080D693A
_0802889C: .4byte gPlayer
_080288A0: .4byte sub_802890C
_080288A4: .4byte gGameMode
_080288A8: .4byte gUnknown_03005424
_080288AC: .4byte gUnknown_0300544C
_080288B0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080288B8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080288D0
	adds r1, #2
	cmp r1, #0
	ble _080288DC
	b _080288DA
_080288D0:
	cmp r1, #0
	ble _080288DC
	subs r1, #2
	cmp r1, #0
	bge _080288DC
_080288DA:
	movs r1, #0
_080288DC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080288FC
	ldr r1, _08028904 @ =gPlayer
	ldr r0, _08028908 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080288FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028904: .4byte gPlayer
_08028908: .4byte sub_8025318

	thumb_func_start sub_802890C
sub_802890C: @ 0x0802890C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x5b
	ldrb r3, [r0]
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0802895C @ =gUnknown_080D6992
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r1, r1, r0
	adds r1, r1, r2
	ldrb r5, [r1]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08028948
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #1
	bne _08028948
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08028948
	movs r0, #2
	strh r0, [r1]
_08028948:
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08028960
	subs r0, r2, #1
	b _08028982
	.align 2, 0
_0802895C: .4byte gUnknown_080D6992
_08028960:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0802896C
	movs r0, #0xfb
	ands r5, r0
_0802896C:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08028984
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xe
	beq _08028984
	movs r0, #0xe
_08028982:
	strh r0, [r1]
_08028984:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08028994
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	ble _0802899A
_08028994:
	adds r0, r4, #0
	bl sub_8023610
_0802899A:
	movs r0, #4
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _080289AC
	adds r0, r4, #0
	bl sub_80236C8
_080289AC:
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _080289E2
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _080289C8
	movs r1, #0xc
_080289C8:
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _080289DA
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080289DA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	b _080289FA
_080289E2:
	cmp r6, #0
	bne _080289FC
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080289F6
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080289FA
_080289F6:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080289FA:
	strh r0, [r4, #0x12]
_080289FC:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08028A44 @ =gUnknown_03005424
	ldr r1, _08028A48 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028A1E
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08028A1E:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08028A2E
	adds r2, r1, #0
_08028A2E:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08028A4C
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08028A54
	.align 2, 0
_08028A44: .4byte gUnknown_03005424
_08028A48: .4byte gUnknown_0300544C
_08028A4C:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08028A54:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028A6C
	adds r1, #2
	cmp r1, #0
	ble _08028A78
	b _08028A76
_08028A6C:
	cmp r1, #0
	ble _08028A78
	subs r1, #2
	cmp r1, #0
	bge _08028A78
_08028A76:
	movs r1, #0
_08028A78:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08028A98
	ldr r1, _08028AD0 @ =gPlayer
	ldr r0, _08028AD4 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08028A98:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08028ACA
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _08028ACA
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	cmp r0, #2
	bne _08028ACA
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08028AD0 @ =gPlayer
	ldr r0, _08028AD8 @ =sub_802A3C4
	str r0, [r1]
_08028ACA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028AD0: .4byte gPlayer
_08028AD4: .4byte sub_8025318
_08028AD8: .4byte sub_802A3C4

	thumb_func_start sub_8028ADC
sub_8028ADC: @ 0x08028ADC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08028B74 @ =gGameMode
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #5
	bne _08028AF0
	b _08028D48
_08028AF0:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08028B00
	b _08028D48
_08028B00:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _08028B78 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028B12
	b _08028D48
_08028B12:
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08028B90
	ldr r1, _08028B7C @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028B80 @ =gUnknown_080D6932
	ldrh r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028B84 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028B6A
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08028B6A
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028B88 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028B62
	movs r0, #0xff
_08028B62:
	strb r0, [r1]
	ldr r1, _08028B8C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028B6A:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #0
	b _08028D40
	.align 2, 0
_08028B74: .4byte gGameMode
_08028B78: .4byte gPlayerControls
_08028B7C: .4byte gUnknown_03005450
_08028B80: .4byte gUnknown_080D6932
_08028B84: .4byte 0x0000C350
_08028B88: .4byte gNumLives
_08028B8C: .4byte gUnknown_030054A8
_08028B90:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08028C68
	ldr r1, _08028BFC @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028C00 @ =gUnknown_080D6932
	ldrh r0, [r0, #6]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028C04 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028BE2
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08028BE2
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028C08 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028BDA
	movs r0, #0xff
_08028BDA:
	strb r0, [r1]
	ldr r1, _08028C0C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028BE2:
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	beq _08028C30
	cmp r0, #3
	bgt _08028C10
	cmp r0, #0
	beq _08028C16
	b _08028C60
	.align 2, 0
_08028BFC: .4byte gUnknown_03005450
_08028C00: .4byte gUnknown_080D6932
_08028C04: .4byte 0x0000C350
_08028C08: .4byte gNumLives
_08028C0C: .4byte gUnknown_030054A8
_08028C10:
	cmp r0, #4
	beq _08028C48
	b _08028C60
_08028C16:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r1, _08028C28 @ =gPlayer
	ldr r0, _08028C2C @ =sub_8011F1C
	b _08028D46
	.align 2, 0
_08028C28: .4byte gPlayer
_08028C2C: .4byte sub_8011F1C
_08028C30:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r1, _08028C40 @ =gPlayer
	ldr r0, _08028C44 @ =sub_8013D18
	b _08028D46
	.align 2, 0
_08028C40: .4byte gPlayer
_08028C44: .4byte sub_8013D18
_08028C48:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r1, _08028C58 @ =gPlayer
	ldr r0, _08028C5C @ =sub_8011F1C
	b _08028D46
	.align 2, 0
_08028C58: .4byte gPlayer
_08028C5C: .4byte sub_8011F1C
_08028C60:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #1
	b _08028D40
_08028C68:
	ldr r0, [r6, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08028C7C
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08028C84
	b _08028CF0
_08028C7C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08028CF0
_08028C84:
	ldr r1, _08028CD8 @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028CDC @ =gUnknown_080D6932
	ldrh r0, [r0, #4]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028CE0 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028CCE
	ldr r0, _08028CE4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08028CCE
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028CE8 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028CC6
	movs r0, #0xff
_08028CC6:
	strb r0, [r1]
	ldr r1, _08028CEC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028CCE:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #2
	b _08028D40
	.align 2, 0
_08028CD8: .4byte gUnknown_03005450
_08028CDC: .4byte gUnknown_080D6932
_08028CE0: .4byte 0x0000C350
_08028CE4: .4byte gGameMode
_08028CE8: .4byte gNumLives
_08028CEC: .4byte gUnknown_030054A8
_08028CF0:
	ldr r1, _08028D54 @ =gUnknown_03005450
	ldr r5, [r1]
	ldr r0, _08028D58 @ =gUnknown_080D6932
	ldrh r0, [r0, #2]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08028D5C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _08028D3A
	ldr r0, _08028D60 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08028D3A
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _08028D64 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08028D32
	movs r0, #0xff
_08028D32:
	strb r0, [r1]
	ldr r1, _08028D68 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08028D3A:
	adds r1, r6, #0
	adds r1, #0x5b
	movs r0, #3
_08028D40:
	strb r0, [r1]
	ldr r1, _08028D6C @ =gPlayer
	ldr r0, _08028D70 @ =sub_80286F0
_08028D46:
	str r0, [r1]
_08028D48:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028D54: .4byte gUnknown_03005450
_08028D58: .4byte gUnknown_080D6932
_08028D5C: .4byte 0x0000C350
_08028D60: .4byte gGameMode
_08028D64: .4byte gNumLives
_08028D68: .4byte gUnknown_030054A8
_08028D6C: .4byte gPlayer
_08028D70: .4byte sub_80286F0

	thumb_func_start sub_8028D74
sub_8028D74: @ 0x08028D74
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _08028DD8 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _08028D9A
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _08028DF0
_08028D9A:
	adds r2, r4, #0
	adds r2, #0x68
	ldr r1, _08028DDC @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	beq _08028DC8
	cmp r1, #0xa
	beq _08028DC8
	cmp r1, #0xb
	beq _08028DC8
	cmp r1, #0x46
	bne _08028DE0
_08028DC8:
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	b _08028DEE
	.align 2, 0
_08028DD8: .4byte 0xFEFFFFDF
_08028DDC: .4byte gUnknown_080D672C
_08028DE0:
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
_08028DEE:
	strb r0, [r4, #0x17]
_08028DF0:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08028E18 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08028E1C @ =gPlayer
	ldr r1, _08028E20 @ =sub_8029074
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08028E18: .4byte 0xFFFFBFFF
_08028E1C: .4byte gPlayer
_08028E20: .4byte sub_8029074

	thumb_func_start sub_8028E24
sub_8028E24: @ 0x08028E24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	lsrs r5, r0, #4
	movs r6, #3
	ands r6, r0
	adds r0, r4, #0
	bl sub_80218E4
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08028E58
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08028E58
	ldr r0, _08028E54 @ =0xFFFFFEFD
	ands r1, r0
	str r1, [r4, #0x20]
	b _08028E62
	.align 2, 0
_08028E54: .4byte 0xFFFFFEFD
_08028E58:
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_08028E62:
	ldr r0, [r4, #0x20]
	ldr r1, _08028E90 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _08028E94 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08028E98
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x25
	b _08028EBA
	.align 2, 0
_08028E90: .4byte 0xFEFFFFDF
_08028E94: .4byte gCurrentLevel
_08028E98:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08028EA2
	rsbs r1, r1, #0
_08028EA2:
	ldr r0, _08028EB0 @ =0x0000027F
	cmp r1, r0
	bgt _08028EB4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x26
	b _08028EBA
	.align 2, 0
_08028EB0: .4byte 0x0000027F
_08028EB4:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
_08028EBA:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x66
	ldr r0, _08028ED4 @ =0x0000FFFF
	strh r0, [r1]
	cmp r5, #7
	bls _08028ECA
	b _08028FCE
_08028ECA:
	lsls r0, r5, #2
	ldr r1, _08028ED8 @ =_08028EDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028ED4: .4byte 0x0000FFFF
_08028ED8: .4byte _08028EDC
_08028EDC: @ jump table
	.4byte _08028EFC @ case 0
	.4byte _08028F0C @ case 1
	.4byte _08028F18 @ case 2
	.4byte _08028F44 @ case 3
	.4byte _08028F70 @ case 4
	.4byte _08028F90 @ case 5
	.4byte _08028FAC @ case 6
	.4byte _08028FBC @ case 7
_08028EFC:
	ldr r0, _08028F08 @ =gUnknown_080D69B2
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _08028FCC
	.align 2, 0
_08028F08: .4byte gUnknown_080D69B2
_08028F0C:
	ldr r0, _08028F14 @ =gUnknown_080D69B2
	lsls r1, r6, #1
	b _08028FC8
	.align 2, 0
_08028F14: .4byte gUnknown_080D69B2
_08028F18:
	ldr r1, _08028F3C @ =gUnknown_080D69BA
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r2, r0, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08028FCE
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08028F40 @ =0xFFFFF700
	cmp r0, r1
	bge _08028FCE
	b _08028F62
	.align 2, 0
_08028F3C: .4byte gUnknown_080D69BA
_08028F40: .4byte 0xFFFFF700
_08028F44:
	ldr r1, _08028F6C @ =gUnknown_080D69BA
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08028FCE
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x14
	cmp r1, r0
	ble _08028FCE
_08028F62:
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #1
	strb r0, [r1]
	b _08028FCE
	.align 2, 0
_08028F6C: .4byte gUnknown_080D69BA
_08028F70:
	ldr r0, _08028F88 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _08028F8C @ =gUnknown_080D69B2
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _08028FCC
	.align 2, 0
_08028F88: .4byte gUnknown_080D69BA
_08028F8C: .4byte gUnknown_080D69B2
_08028F90:
	ldr r0, _08028FA4 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	ldr r0, _08028FA8 @ =gUnknown_080D69B2
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _08028FCC
	.align 2, 0
_08028FA4: .4byte gUnknown_080D69BA
_08028FA8: .4byte gUnknown_080D69B2
_08028FAC:
	ldr r0, _08028FB8 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	b _08028FC4
	.align 2, 0
_08028FB8: .4byte gUnknown_080D69BA
_08028FBC:
	ldr r0, _08029058 @ =gUnknown_080D69BA
	lsls r1, r6, #1
	adds r0, r1, r0
	ldrh r0, [r0]
_08028FC4:
	strh r0, [r4, #0x10]
	ldr r0, _0802905C @ =gUnknown_080D69B2
_08028FC8:
	adds r1, r1, r0
	ldrh r0, [r1]
_08028FCC:
	strh r0, [r4, #0x12]
_08028FCE:
	ldr r0, _08029060 @ =gUnknown_080D69C2
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x36
	strb r0, [r2]
	ldr r0, _08029064 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802900C
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08028FF6
	adds r0, #3
_08028FF6:
	asrs r0, r0, #2
	strh r0, [r4, #0x10]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bge _08029008
	adds r0, #3
_08029008:
	asrs r0, r0, #2
	strh r0, [r4, #0x12]
_0802900C:
	ldr r2, [r4, #0x20]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08029022
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r4, #0x12]
_08029022:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _08029036
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_08029036:
	ldr r0, _08029068 @ =0xFFFFFEC0
	cmp r1, r0
	bge _08029044
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_08029044:
	ldr r0, _0802906C @ =gPlayer
	ldr r1, _08029070 @ =sub_8029074
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029058: .4byte gUnknown_080D69BA
_0802905C: .4byte gUnknown_080D69B2
_08029060: .4byte gUnknown_080D69C2
_08029064: .4byte gCurrentLevel
_08029068: .4byte 0xFFFFFEC0
_0802906C: .4byte gPlayer
_08029070: .4byte sub_8029074

	thumb_func_start sub_8029074
sub_8029074: @ 0x08029074
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl sub_8028ADC
	adds r0, r4, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_80236C8
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080290A4
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _080290A8
_080290A4:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_080290A8:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080290F4 @ =gUnknown_03005424
	ldr r1, _080290F8 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080290CC
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_080290CC:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _080290DC
	adds r2, r1, #0
_080290DC:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080290FC
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _08029104
	.align 2, 0
_080290F4: .4byte gUnknown_03005424
_080290F8: .4byte gUnknown_0300544C
_080290FC:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_08029104:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0802911C
	adds r1, #2
	cmp r1, #0
	ble _08029128
	b _08029126
_0802911C:
	cmp r1, #0
	ble _08029128
	subs r1, #2
	cmp r1, #0
	bge _08029128
_08029126:
	movs r1, #0
_08029128:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _08029148
	ldr r1, _08029150 @ =gPlayer
	ldr r0, _08029154 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_08029148:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029150: .4byte gPlayer
_08029154: .4byte sub_8025318

	thumb_func_start sub_8029158
sub_8029158: @ 0x08029158
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _080291C8 @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080291CC @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _080291A0
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_080291A0:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, _080291D0 @ =0xFFFFFEC0
	cmp r1, r0
	bge _080291B2
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_080291B2:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #5
	bls _080291BE
	b _080292CC
_080291BE:
	lsls r0, r0, #2
	ldr r1, _080291D4 @ =_080291D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080291C8: .4byte 0xFEFFFFD7
_080291CC: .4byte 0x0000FFFF
_080291D0: .4byte 0xFFFFFEC0
_080291D4: .4byte _080291D8
_080291D8: @ jump table
	.4byte _080291F0 @ case 0
	.4byte _0802922C @ case 1
	.4byte _0802922C @ case 2
	.4byte _08029268 @ case 3
	.4byte _08029294 @ case 4
	.4byte _08029294 @ case 5
_080291F0:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _080291FE
	adds r0, #7
_080291FE:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _0802920A
	rsbs r0, r0, #0
_0802920A:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08029228 @ =0xFFFFFC40
	b _080292C8
	.align 2, 0
_08029228: .4byte 0xFFFFFC40
_0802922C:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _0802923A
	adds r0, #7
_0802923A:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _08029246
	rsbs r0, r0, #0
_08029246:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08029264 @ =0xFFFFF880
	b _080292C8
	.align 2, 0
_08029264: .4byte 0xFFFFF880
_08029268:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _08029276
	adds r0, #7
_08029276:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _08029282
	rsbs r0, r0, #0
_08029282:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #3
	b _080292BE
_08029294:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _080292A2
	adds r0, #7
_080292A2:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _080292AE
	rsbs r0, r0, #0
_080292AE:
	rsbs r0, r0, #0
	movs r1, #6
	bl __divsi3
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #4
_080292BE:
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _08029308 @ =0xFFFFFD80
_080292C8:
	adds r0, r0, r1
	strh r0, [r4, #0x12]
_080292CC:
	ldr r1, [r4, #0x20]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080292DE
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_080292DE:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080292EC
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_080292EC:
	movs r0, #0x8a
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0802930C @ =gPlayer
	ldr r1, _08029310 @ =sub_8029314
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029308: .4byte 0xFFFFFD80
_0802930C: .4byte gPlayer
_08029310: .4byte sub_8029314

	thumb_func_start sub_8029314
sub_8029314: @ 0x08029314
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x28
	bne _08029338
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08029338
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08029338
	movs r0, #1
	strh r0, [r1]
_08029338:
	adds r0, r4, #0
	bl sub_8028ADC
	adds r0, r4, #0
	bl sub_8023708
	adds r0, r4, #0
	bl sub_80232D0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802935A
	ldrh r0, [r4, #0x12]
	adds r0, #0xc
	b _0802935E
_0802935A:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
_0802935E:
	strh r0, [r4, #0x12]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _080293A8 @ =gUnknown_03005424
	ldr r1, _080293AC @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029382
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08029382:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029392
	adds r2, r1, #0
_08029392:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080293B0
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080293B8
	.align 2, 0
_080293A8: .4byte gUnknown_03005424
_080293AC: .4byte gUnknown_0300544C
_080293B0:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080293B8:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080293D0
	adds r1, #2
	cmp r1, #0
	ble _080293DC
	b _080293DA
_080293D0:
	cmp r1, #0
	ble _080293DC
	subs r1, #2
	cmp r1, #0
	bge _080293DC
_080293DA:
	movs r1, #0
_080293DC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080293FC
	ldr r1, _08029404 @ =gPlayer
	ldr r0, _08029408 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080293FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029404: .4byte gPlayer
_08029408: .4byte sub_8025318

	thumb_func_start sub_802940C
sub_802940C: @ 0x0802940C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0802942C
	ldr r1, _08029488 @ =gPlayer
	ldr r0, _0802948C @ =sub_8029074
	str r0, [r1]
_0802942C:
	adds r0, r4, #0
	bl sub_80246DC
	adds r0, r4, #0
	bl sub_8028ADC
	adds r0, r4, #0
	bl sub_80232D0
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r3, _08029490 @ =gUnknown_03005424
	ldr r1, _08029494 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029460
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
_08029460:
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029470
	adds r2, r1, #0
_08029470:
	strh r2, [r4, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029498
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _080294A0
	.align 2, 0
_08029488: .4byte gPlayer
_0802948C: .4byte sub_8029074
_08029490: .4byte gUnknown_03005424
_08029494: .4byte gUnknown_0300544C
_08029498:
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_080294A0:
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _080294B8
	adds r1, #2
	cmp r1, #0
	ble _080294C4
	b _080294C2
_080294B8:
	cmp r1, #0
	ble _080294C4
	subs r1, #2
	cmp r1, #0
	bge _080294C4
_080294C2:
	movs r1, #0
_080294C4:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_8022190
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _080294E4
	ldr r1, _080294EC @ =gPlayer
	ldr r0, _080294F0 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_080294E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080294EC: .4byte gPlayer
_080294F0: .4byte sub_8025318

	thumb_func_start sub_80294F4
sub_80294F4: @ 0x080294F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	beq _08029506
	b _08029664
_08029506:
	adds r2, r4, #0
	adds r2, #0x5e
	ldr r3, _08029530 @ =gPlayerControls
	ldrh r1, [r2]
	ldrh r0, [r3, #2]
	ands r0, r1
	cmp r0, #0
	beq _0802956E
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0802953E
	cmp r0, #1
	bgt _08029534
	cmp r0, #0
	beq _08029566
	b _0802956E
	.align 2, 0
_08029530: .4byte gPlayerControls
_08029534:
	cmp r0, #3
	beq _0802955C
	cmp r0, #4
	beq _08029566
	b _0802956E
_0802953E:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _08029554
	adds r0, r4, #0
	bl sub_8012888
	b _08029562
_08029554:
	adds r0, r4, #0
	bl sub_80128E0
	b _08029562
_0802955C:
	adds r0, r4, #0
	bl sub_8013D18
_08029562:
	movs r0, #1
	b _08029666
_08029566:
	adds r0, r4, #0
	bl sub_8011F1C
	b _08029562
_0802956E:
	ldrh r1, [r2]
	ldrh r0, [r3]
	ands r0, r1
	cmp r0, #0
	beq _08029664
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _08029664
	lsls r0, r0, #2
	ldr r1, _08029590 @ =_08029594
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08029590: .4byte _08029594
_08029594: @ jump table
	.4byte _080295A8 @ case 0
	.4byte _08029610 @ case 1
	.4byte _08029618 @ case 2
	.4byte _08029634 @ case 3
	.4byte _08029646 @ case 4
_080295A8:
	ldr r0, _080295DC @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080295EC
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080295C4
	ldr r0, _080295E0 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080295EC
_080295C4:
	cmp r1, #0x1d
	beq _080295EC
	ldr r0, _080295E4 @ =gUnknown_030054C0
	ldr r1, [r0]
	ldr r0, _080295E8 @ =0x00003FFF
	cmp r1, r0
	bgt _080295EC
	adds r0, r4, #0
	bl sub_8012194
	b _08029562
	.align 2, 0
_080295DC: .4byte gCurrentLevel
_080295E0: .4byte gUnknown_030054B0
_080295E4: .4byte gUnknown_030054C0
_080295E8: .4byte 0x00003FFF
_080295EC:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x12
	strh r0, [r1]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8011B88
	movs r0, #0x71
	b _08029660
_08029610:
	adds r0, r4, #0
	bl sub_8012644
	b _08029562
_08029618:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08029664
	adds r0, r4, #0
	bl sub_8012BC0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	b _08029562
_08029634:
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08029664
	adds r0, r4, #0
	bl sub_8013AD8
	b _08029562
_08029646:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x12
	strh r0, [r1]
	movs r0, #2
	bl sub_8015BD4
	movs r0, #0x81
_08029660:
	bl m4aSongNumStart
_08029664:
	movs r0, #0
_08029666:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_802966C
sub_802966C: @ 0x0802966C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0xff
	ldr r5, [r4, #0x48]
	ldr r7, [r4, #0x4c]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08029680
	b _0802980C
_08029680:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _08029690
	b _0802980C
_08029690:
	ldrh r3, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov ip, r3
	cmp r1, #0
	ble _08029734
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080296D2
	adds r0, r1, #0
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bge _080296BC
	adds r0, r3, r5
	strh r0, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, r1
	ble _080296C6
	strh r1, [r4, #0x14]
	b _080296C6
_080296BC:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_080296C6:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _0802983C
_080296D2:
	ldr r0, _080296F0 @ =0x000001FF
	cmp r1, r0
	ble _08029708
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080296F4
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _08029702
	.align 2, 0
_080296F0: .4byte 0x000001FF
_080296F4:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _08029702
	movs r6, #8
_08029702:
	mov r3, ip
	subs r0, r3, r7
	b _080297A2
_08029708:
	subs r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08029714
	b _0802983C
_08029714:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029720
	b _0802983C
_08029720:
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080297FA
	movs r6, #7
	b _080297FA
_08029734:
	cmp r1, #0
	bge _080297C8
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08029770
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x44]
	rsbs r2, r0, #0
	cmp r1, r2
	ble _0802975C
	subs r0, r3, r5
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08029766
	strh r2, [r4, #0x14]
	b _08029766
_0802975C:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_08029766:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0802983C
_08029770:
	ldr r0, _0802978C @ =0xFFFFFE00
	cmp r1, r0
	bgt _080297B2
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08029790
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _0802979E
	.align 2, 0
_0802978C: .4byte 0xFFFFFE00
_08029790:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _0802979E
	movs r6, #8
_0802979E:
	mov r2, ip
	adds r0, r2, r7
_080297A2:
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl sub_8029FA4
	movs r0, #0x73
	bl m4aSongNumStart
	b _0802983C
_080297B2:
	adds r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802983C
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802983C
	b _08029720
_080297C8:
	ldr r1, [r4, #0x20]
	movs r0, #1
	ands r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	cmp r1, r0
	beq _080297FA
	cmp r1, #0
	beq _080297E2
	subs r0, r3, r5
	b _080297E4
_080297E2:
	adds r0, r3, r5
_080297E4:
	strh r0, [r4, #0x14]
	movs r6, #9
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _0802983C
_080297FA:
	ldr r1, _08029804 @ =gPlayer
	ldr r0, _08029808 @ =sub_802A5C4
	str r0, [r1]
	b _0802983C
	.align 2, 0
_08029804: .4byte gPlayer
_08029808: .4byte sub_802A5C4
_0802980C:
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	ble _08029820
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0802982E
	b _08029834
_08029820:
	cmp r0, #0
	bge _0802983A
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	blt _08029834
_0802982E:
	movs r1, #0
	movs r6, #0
	b _08029836
_08029834:
	movs r6, #9
_08029836:
	strh r1, [r4, #0x14]
	b _0802983C
_0802983A:
	movs r6, #0
_0802983C:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08029860
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r2, #0xf9
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08029890
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08029890
_08029860:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0802987C
	adds r2, r4, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _08029890
	strh r1, [r2]
	b _08029890
_0802987C:
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08029890
	movs r0, #9
	strh r0, [r1]
_08029890:
	adds r0, r4, #0
	bl sub_8023128
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802989C
sub_802989C: @ 0x0802989C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080298B0 @ =gCourseTime
	ldrh r0, [r0]
	cmp r0, #0x95
	bls _080298B4
	adds r1, #0x52
	movs r0, #4
	b _080298D6
	.align 2, 0
_080298B0: .4byte gCourseTime
_080298B4:
	cmp r0, #0x63
	bls _080298BE
	adds r1, #0x52
	movs r0, #3
	b _080298D6
_080298BE:
	cmp r0, #0x31
	bls _080298C8
	adds r1, #0x52
	movs r0, #2
	b _080298D6
_080298C8:
	cmp r0, #0xa
	bls _080298D2
	adds r1, #0x52
	movs r0, #1
	b _080298D6
_080298D2:
	adds r1, #0x52
	movs r0, #0
_080298D6:
	strh r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_80298DC
sub_80298DC: @ 0x080298DC
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x5a
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	cmp r2, #0
	beq _0802992C
	ldr r4, [r3, #0x20]
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	bne _0802998A
	ldr r0, _08029924 @ =gUnknown_080D6916
	adds r1, r3, #0
	adds r1, #0x52
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0x14
	ldrsh r2, [r3, r0]
	cmp r2, #0
	bge _08029914
	rsbs r2, r2, #0
_08029914:
	ldr r0, _08029928 @ =0x0000047F
	cmp r2, r0
	bgt _0802998A
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	strh r4, [r1]
	b _0802998A
	.align 2, 0
_08029924: .4byte gUnknown_080D6916
_08029928: .4byte 0x0000047F
_0802992C:
	ldr r0, [r3, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08029984
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _08029940
	rsbs r1, r1, #0
_08029940:
	ldr r0, [r3, #0x44]
	cmp r1, r0
	blt _08029984
	adds r2, r3, #0
	adds r2, #0x58
	ldr r1, _0802997C @ =gUnknown_080D6916
	adds r0, r3, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0802998A
	movs r0, #1
	mov r3, ip
	strb r0, [r3]
	ldr r1, _08029980 @ =gCamera
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	bl CreateBoostModeParticles
	movs r0, #0xdd
	bl m4aSongNumStart
	b _0802998A
	.align 2, 0
_0802997C: .4byte gUnknown_080D6916
_08029980: .4byte gCamera
_08029984:
	adds r0, r3, #0
	adds r0, #0x58
	strh r2, [r0]
_0802998A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029990
sub_8029990: @ 0x08029990
	push {lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0802999E
	rsbs r2, r2, #0
_0802999E:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	bgt _080299AC
	adds r1, #0x54
	movs r0, #0
	b _080299E8
_080299AC:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r2, r0
	bgt _080299BA
	adds r1, #0x54
	movs r0, #1
	b _080299E8
_080299BA:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080299C8
	adds r1, #0x54
	movs r0, #2
	b _080299E8
_080299C8:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080299D6
	adds r1, #0x54
	movs r0, #3
	b _080299E8
_080299D6:
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _080299E4
	adds r1, #0x54
	movs r0, #4
	b _080299E8
_080299E4:
	adds r1, #0x54
	movs r0, #5
_080299E8:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80299F0
sub_80299F0: @ 0x080299F0
	push {lr}
	bl sub_8021604
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80299FC
sub_80299FC: @ 0x080299FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x8c
	ldr r0, [r5]
	bl TaskDestroy
	movs r0, #0
	str r0, [r5]
	adds r4, #0x60
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08029A20
	bl sub_801F78C
	bl sub_8021350
_08029A20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029A28
sub_8029A28: @ 0x08029A28
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029A34
	mov r4, sp
_08029A34:
	cmp r2, #0
	bne _08029A3A
	add r2, sp, #4
_08029A3A:
	adds r1, r4, #0
	bl sub_802195C
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029A50
	movs r0, #0
	b _08029A62
_08029A50:
	ldr r0, _08029A70 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029A64
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029A62:
	strb r0, [r4]
_08029A64:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029A70: .4byte gUnknown_03005424

	thumb_func_start sub_8029A74
sub_8029A74: @ 0x08029A74
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029A80
	mov r4, sp
_08029A80:
	cmp r2, #0
	bne _08029A86
	add r2, sp, #4
_08029A86:
	adds r1, r4, #0
	bl sub_8021A34
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029A9C
	movs r0, #0
	b _08029AAE
_08029A9C:
	ldr r0, _08029ABC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029AB0
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029AAE:
	strb r0, [r4]
_08029AB0:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029ABC: .4byte gUnknown_03005424

	thumb_func_start sub_8029AC0
sub_8029AC0: @ 0x08029AC0
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029ACC
	mov r4, sp
_08029ACC:
	cmp r2, #0
	bne _08029AD2
	add r2, sp, #4
_08029AD2:
	adds r1, r4, #0
	bl sub_8021B08
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029AE8
	movs r0, #0
	b _08029AFA
_08029AE8:
	ldr r0, _08029B08 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029AFC
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029AFA:
	strb r0, [r4]
_08029AFC:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029B08: .4byte gUnknown_03005424

	thumb_func_start sub_8029B0C
sub_8029B0C: @ 0x08029B0C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _08029B18
	mov r4, sp
_08029B18:
	cmp r2, #0
	bne _08029B1E
	add r2, sp, #4
_08029B1E:
	adds r1, r4, #0
	bl sub_8029BB8
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08029B34
	movs r0, #0
	b _08029B46
_08029B34:
	ldr r0, _08029B54 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029B48
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_08029B46:
	strb r0, [r4]
_08029B48:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029B54: .4byte gUnknown_03005424

	thumb_func_start sub_8029B58
sub_8029B58: @ 0x08029B58
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08029B74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029B78
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029B0C
	b _08029B80
	.align 2, 0
_08029B74: .4byte gUnknown_03005424
_08029B78:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029AC0
_08029B80:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029B88
sub_8029B88: @ 0x08029B88
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _08029BA4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029BA8
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029AC0
	b _08029BB0
	.align 2, 0
_08029BA4: .4byte gUnknown_03005424
_08029BA8:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_8029B0C
_08029BB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029BB8
sub_8029BB8: @ 0x08029BB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _08029BD0
	add r6, sp, #8
_08029BD0:
	cmp r7, #0
	bne _08029BD6
	add r7, sp, #0xc
_08029BD6:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _08029C00
	movs r0, #0x80
	orrs r2, r0
_08029C00:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _08029C64 @ =sub_801EE64
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_801E4E4
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _08029C40
	movs r0, #0x80
	orrs r2, r0
_08029C40:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r5, r1
	bge _08029C68
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _08029C70
	.align 2, 0
_08029C64: .4byte sub_801EE64
_08029C68:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_08029C70:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029C84
sub_8029C84: @ 0x08029C84
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0x7f
	ble _08029C9A
	movs r0, #0
	strh r0, [r2, #0x14]
_08029C9A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029CA0
sub_8029CA0: @ 0x08029CA0
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029CD4
	ldr r1, _08029CDC @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r2, r0, #5
	ldrh r1, [r3, #0x14]
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _08029CD4
	adds r0, r1, r2
	strh r0, [r3, #0x14]
_08029CD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029CDC: .4byte gSineTable

	thumb_func_start sub_8029CE0
sub_8029CE0: @ 0x08029CE0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029D0C
	ldr r1, _08029D10 @ =gSineTable
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	ldrh r1, [r3, #0x14]
	adds r0, r0, r1
	strh r0, [r3, #0x14]
_08029D0C:
	pop {r0}
	bx r0
	.align 2, 0
_08029D10: .4byte gSineTable

	thumb_func_start sub_8029D14
sub_8029D14: @ 0x08029D14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _08029D5E
	cmp r2, #0
	beq _08029D5E
	ldr r1, _08029D50 @ =gSineTable
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r1, r0, #8
	cmp r2, #0
	ble _08029D54
	cmp r1, #0
	bgt _08029D5A
	b _08029D58
	.align 2, 0
_08029D50: .4byte gSineTable
_08029D54:
	cmp r1, #0
	blt _08029D5A
_08029D58:
	asrs r1, r0, #0xa
_08029D5A:
	adds r2, r2, r1
	strh r2, [r4, #0x14]
_08029D5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029D64
sub_8029D64: @ 0x08029D64
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0x10
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r4, _08029DB0 @ =gUnknown_03005424
	ldr r1, _08029DB4 @ =gUnknown_0300544C
	ldrh r0, [r4]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029D8A
	ldrh r0, [r2, #0x12]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
_08029D8A:
	ldrh r3, [r2, #0x12]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08029D9A
	adds r3, r1, #0
_08029D9A:
	strh r3, [r2, #0x12]
	ldrh r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029DB8
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	b _08029DC0
	.align 2, 0
_08029DB0: .4byte gUnknown_03005424
_08029DB4: .4byte gUnknown_0300544C
_08029DB8:
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
_08029DC0:
	str r0, [r2, #0xc]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8029DC8
sub_8029DC8: @ 0x08029DC8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08029DDC
	ldrh r0, [r2, #0x12]
	adds r0, #0xc
	b _08029DE0
_08029DDC:
	ldrh r0, [r2, #0x12]
	adds r0, #0x2a
_08029DE0:
	strh r0, [r2, #0x12]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8029DE8
sub_8029DE8: @ 0x08029DE8
	push {lr}
	ldr r3, _08029E0C @ =gCamera
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _08029E1E
	ldr r0, _08029E10 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029E14
	ldr r0, [r3, #0x28]
	lsls r0, r0, #8
	cmp r2, r0
	bgt _08029E1E
_08029E08:
	movs r0, #1
	b _08029E20
	.align 2, 0
_08029E0C: .4byte gCamera
_08029E10: .4byte gUnknown_03005424
_08029E14:
	ldr r0, [r3, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	cmp r2, r0
	bge _08029E08
_08029E1E:
	movs r0, #0
_08029E20:
	pop {r1}
	bx r1

	thumb_func_start sub_8029E24
sub_8029E24: @ 0x08029E24
	push {lr}
	ldr r3, _08029E4C @ =gCamera
	ldr r2, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _08029E60
	ldr r0, _08029E50 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029E54
	ldr r0, [r3, #4]
	subs r0, #0x50
	lsls r0, r0, #8
	cmp r2, r0
	bgt _08029E60
_08029E46:
	movs r0, #1
	b _08029E62
	.align 2, 0
_08029E4C: .4byte gCamera
_08029E50: .4byte gUnknown_03005424
_08029E54:
	ldr r0, [r3, #4]
	lsls r0, r0, #8
	ldr r1, _08029E68 @ =0x0000EFFF
	adds r0, r0, r1
	cmp r2, r0
	bge _08029E46
_08029E60:
	movs r0, #0
_08029E62:
	pop {r1}
	bx r1
	.align 2, 0
_08029E68: .4byte 0x0000EFFF

	thumb_func_start sub_8029E6C
sub_8029E6C: @ 0x08029E6C
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08029EC0 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08029ED0
	ldr r0, _08029EC4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029EA2
	adds r0, r2, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08029EA2:
	adds r0, r2, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r3, #0
	bl sub_8022F58
	cmp r0, #3
	ble _08029ED0
	ldr r1, _08029EC8 @ =gPlayer
	ldr r0, _08029ECC @ =sub_8025D00
	str r0, [r1]
	movs r0, #1
	b _08029ED2
	.align 2, 0
_08029EC0: .4byte gPlayerControls
_08029EC4: .4byte gUnknown_03005424
_08029EC8: .4byte gPlayer
_08029ECC: .4byte sub_8025D00
_08029ED0:
	movs r0, #0
_08029ED2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8029ED8
sub_8029ED8: @ 0x08029ED8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _08029EEA
	subs r0, #1
	b _08029F16
_08029EEA:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08029F18
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08029F04
	rsbs r1, r1, #0
_08029F04:
	ldr r0, _08029F1C @ =0x000001DF
	cmp r1, r0
	bgt _08029F18
	strh r3, [r2, #0x14]
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1e
_08029F16:
	strh r0, [r2, #0x2a]
_08029F18:
	pop {r0}
	bx r0
	.align 2, 0
_08029F1C: .4byte 0x000001DF

	thumb_func_start sub_8029F20
sub_8029F20: @ 0x08029F20
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _08029F36
	adds r1, #2
	cmp r1, #0
	ble _08029F42
	b _08029F40
_08029F36:
	cmp r1, #0
	ble _08029F42
	subs r1, #2
	cmp r1, #0
	bge _08029F42
_08029F40:
	movs r1, #0
_08029F42:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	pop {r0}
	bx r0

	thumb_func_start sub_8029F4C
sub_8029F4C: @ 0x08029F4C
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x87
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08029F94 @ =gMPlayTable
	ldr r1, [r0]
	ldr r0, _08029F98 @ =gSongTable
	adds r0, #0xf8
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bne _08029F90
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08029F90
	ldr r1, _08029F9C @ =gLevelSongs
	ldr r0, _08029FA0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
_08029F90:
	pop {r0}
	bx r0
	.align 2, 0
_08029F94: .4byte gMPlayTable
_08029F98: .4byte gSongTable
_08029F9C: .4byte gLevelSongs
_08029FA0: .4byte gCurrentLevel

	thumb_func_start sub_8029FA4
sub_8029FA4: @ 0x08029FA4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	movs r1, #3
	cmp r0, #0
	beq _08029FB8
	movs r1, #7
_08029FB8:
	ldr r0, _08029FE8 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08029FE2
	movs r2, #0x17
	ldrsb r2, [r3, r2]
	ldr r0, _08029FEC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08029FD4
	rsbs r2, r2, #0
_08029FD4:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	adds r1, r1, r2
	bl sub_801F5CC
_08029FE2:
	pop {r0}
	bx r0
	.align 2, 0
_08029FE8: .4byte gUnknown_03005590
_08029FEC: .4byte gUnknown_03005424

	thumb_func_start sub_8029FF0
sub_8029FF0: @ 0x08029FF0
	ldr r0, _0802A000 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0x17
	orrs r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0802A000: .4byte gPlayer

	thumb_func_start sub_802A004
sub_802A004: @ 0x0802A004
	ldr r0, _0802A010 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802A014 @ =0xBFFFFFFF
	ands r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_0802A010: .4byte gPlayer
_0802A014: .4byte 0xBFFFFFFF

	thumb_func_start sub_802A018
sub_802A018: @ 0x0802A018
	push {lr}
	ldr r0, _0802A044 @ =gPlayer
	adds r0, #0x6d
	movs r1, #0xa
	strb r1, [r0]
	ldr r2, _0802A048 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x23
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0802A04C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802A03E
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0802A03E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A044: .4byte gPlayer
_0802A048: .4byte gUnknown_03005424
_0802A04C: .4byte gGameMode

	thumb_func_start sub_802A050
sub_802A050: @ 0x0802A050
	push {lr}
	ldr r2, _0802A074 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x23
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0802A078 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802A06E
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0802A06E:
	pop {r0}
	bx r0
	.align 2, 0
_0802A074: .4byte gUnknown_03005424
_0802A078: .4byte gGameMode

	thumb_func_start sub_802A07C
sub_802A07C: @ 0x0802A07C
	push {r4, lr}
	ldr r4, _0802A0C4 @ =gPlayer
	adds r1, r4, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802A0A2
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0A2:
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802A0BE
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl VramFree
_0802A0BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A0C4: .4byte gPlayer

	thumb_func_start sub_802A0C8
sub_802A0C8: @ 0x0802A0C8
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _0802A0F4
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A0F4
	ldr r1, _0802A0EC @ =gPlayer
	ldr r0, _0802A0F0 @ =sub_802A620
	str r0, [r1]
	movs r0, #1
	b _0802A0F6
	.align 2, 0
_0802A0EC: .4byte gPlayer
_0802A0F0: .4byte sub_802A620
_0802A0F4:
	movs r0, #0
_0802A0F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A0FC
sub_802A0FC: @ 0x0802A0FC
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0802A17C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _0802A148
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r0, [r2, #0x20]
	ldr r1, _0802A13C @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A148
	ldr r1, _0802A140 @ =gPlayer
	ldr r0, _0802A144 @ =sub_802A228
	str r0, [r1]
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A13C: .4byte 0x01000006
_0802A140: .4byte gPlayer
_0802A144: .4byte sub_802A228
_0802A148:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0802A17C
	ldr r0, [r2, #0x20]
	ldr r1, _0802A170 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0802A17C
	ldr r1, _0802A174 @ =gPlayer
	ldr r0, _0802A178 @ =sub_8025A0C
	str r0, [r1]
	movs r0, #0x6d
	bl m4aSongNumStart
	movs r0, #1
	b _0802A17E
	.align 2, 0
_0802A170: .4byte 0x01000006
_0802A174: .4byte gPlayer
_0802A178: .4byte sub_8025A0C
_0802A17C:
	movs r0, #0
_0802A17E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A184
sub_802A184: @ 0x0802A184
	push {lr}
	adds r2, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0802A1C0
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _0802A1B4 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0802A1C0
	ldr r0, _0802A1B8 @ =gPlayer
	ldr r1, _0802A1BC @ =sub_802631C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	movs r0, #1
	b _0802A1C2
	.align 2, 0
_0802A1B4: .4byte gPlayerControls
_0802A1B8: .4byte gPlayer
_0802A1BC: .4byte sub_802631C
_0802A1C0:
	movs r0, #0
_0802A1C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802A1C8
sub_802A1C8: @ 0x0802A1C8
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A1E4
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1E4:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A1FA
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _0802A204
_0802A1FA:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_0802A204:
	str r0, [r3, #0x40]
	ldr r1, _0802A224 @ =gUnknown_080D6902
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [r3, #0x48]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	str r0, [r3, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A224: .4byte gUnknown_080D6902

	thumb_func_start sub_802A228
sub_802A228: @ 0x0802A228
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #2
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A250 @ =gPlayer
	ldr r2, _0802A254 @ =sub_8025854
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A250: .4byte gPlayer
_0802A254: .4byte sub_8025854

	thumb_func_start sub_802A258
sub_802A258: @ 0x0802A258
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A27E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0802A276
	adds r0, r2, #0
	bl sub_8025A0C
	b _0802A296
_0802A276:
	adds r0, r2, #0
	bl sub_8025318
	b _0802A296
_0802A27E:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _0802A29C @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r2, #0x20]
	ldr r0, _0802A2A0 @ =gPlayer
	ldr r1, _0802A2A4 @ =sub_8026D2C
	str r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
_0802A296:
	pop {r0}
	bx r0
	.align 2, 0
_0802A29C: .4byte 0xFEFFFFDF
_0802A2A0: .4byte gPlayer
_0802A2A4: .4byte sub_8026D2C

	thumb_func_start sub_802A2A8
sub_802A2A8: @ 0x0802A2A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802A2E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0802A2DE
	ldr r0, [r2, #0x20]
	movs r1, #0x84
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0802A2DE
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802A2DE
	adds r0, r2, #0
	adds r0, #0x5e
	ldr r1, _0802A2E8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A2EC
_0802A2DE:
	movs r0, #0
	b _0802A2F4
	.align 2, 0
_0802A2E4: .4byte gGameMode
_0802A2E8: .4byte gPlayerControls
_0802A2EC:
	ldr r1, _0802A2F8 @ =gPlayer
	ldr r0, _0802A2FC @ =sub_802A714
	str r0, [r1]
	movs r0, #1
_0802A2F4:
	pop {r1}
	bx r1
	.align 2, 0
_0802A2F8: .4byte gPlayer
_0802A2FC: .4byte sub_802A714

	thumb_func_start sub_802A300
sub_802A300: @ 0x0802A300
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0802A34C @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0x66
	ldr r0, _0802A350 @ =0x0000FFFF
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _0802A354 @ =0x00000115
	bl m4aSongNumStart
	ldr r0, _0802A358 @ =gPlayer
	ldr r1, _0802A35C @ =sub_802940C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A34C: .4byte 0xFEFFFFD7
_0802A350: .4byte 0x0000FFFF
_0802A354: .4byte 0x00000115
_0802A358: .4byte gPlayer
_0802A35C: .4byte sub_802940C

	thumb_func_start sub_802A360
sub_802A360: @ 0x0802A360
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x3e
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x92
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0802A3B0 @ =gPlayer
	ldr r1, _0802A3B4 @ =sub_8026BCC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3B0: .4byte gPlayer
_0802A3B4: .4byte sub_8026BCC

	thumb_func_start sub_802A3B8
sub_802A3B8: @ 0x0802A3B8
	push {lr}
	bl sub_802808C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802A3C4
sub_802A3C4: @ 0x0802A3C4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	adds r4, #0x90
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0802A3E2
	ldr r1, _0802A3E8 @ =gPlayer
	ldr r0, _0802A3EC @ =sub_8025A0C
	str r0, [r1]
_0802A3E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E8: .4byte gPlayer
_0802A3EC: .4byte sub_8025A0C

	thumb_func_start sub_802A3F0
sub_802A3F0: @ 0x0802A3F0
	push {lr}
	ldr r2, _0802A408 @ =gCamera
	ldr r1, [r2, #0x1c]
	movs r0, #0x38
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0802A402
	subs r0, r1, #1
	str r0, [r2, #0x1c]
_0802A402:
	pop {r0}
	bx r0
	.align 2, 0
_0802A408: .4byte gCamera

	thumb_func_start sub_802A40C
sub_802A40C: @ 0x0802A40C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x72
	strh r2, [r0]
	ldr r0, _0802A460 @ =gPlayer
	ldr r1, _0802A464 @ =sub_80279F8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A460: .4byte gPlayer
_0802A464: .4byte sub_80279F8

	thumb_func_start sub_802A468
sub_802A468: @ 0x0802A468
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0802A4B0 @ =gPlayer
	ldr r1, _0802A4B4 @ =sub_8027C5C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4B0: .4byte gPlayer
_0802A4B4: .4byte sub_8027C5C

	thumb_func_start sub_802A4B8
sub_802A4B8: @ 0x0802A4B8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _0802A4F4 @ =gPlayer
	ldr r1, _0802A4F8 @ =sub_8027D3C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4F4: .4byte gPlayer
_0802A4F8: .4byte sub_8027D3C

	thumb_func_start sub_802A4FC
sub_802A4FC: @ 0x0802A4FC
	bx lr
	.align 2, 0

	thumb_func_start sub_802A500
sub_802A500: @ 0x0802A500
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0802A51A
	adds r0, r4, #0
	bl sub_8022218
	adds r0, r4, #0
	bl sub_8022284
	b _0802A526
_0802A51A:
	adds r0, r4, #0
	bl sub_8022284
	adds r0, r4, #0
	bl sub_8022218
_0802A526:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_802A52C
sub_802A52C: @ 0x0802A52C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0802A54C
	ldr r1, _0802A550 @ =gPlayer
	ldr r0, _0802A554 @ =sub_8025318
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_0802A54C:
	pop {r0}
	bx r0
	.align 2, 0
_0802A550: .4byte gPlayer
_0802A554: .4byte sub_8025318

	thumb_func_start sub_802A558
sub_802A558: @ 0x0802A558
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x40
	ands r0, r1
	movs r1, #0x2a
	cmp r0, #0
	beq _0802A56A
	movs r1, #0xc
_0802A56A:
	ldrh r3, [r2, #0x12]
	movs r4, #0x12
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _0802A57C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0802A57C:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	strh r0, [r2, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802A58C
sub_802A58C: @ 0x0802A58C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _0802A5A8
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _0802A5A8
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_0802A5A8:
	pop {r0}
	bx r0

	thumb_func_start sub_802A5AC
sub_802A5AC: @ 0x0802A5AC
	push {lr}
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802A5C0
	subs r0, r2, #1
	strb r0, [r1]
_0802A5C0:
	pop {r0}
	bx r0

	thumb_func_start sub_802A5C4
sub_802A5C4: @ 0x0802A5C4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802A5E6
	movs r0, #6
	b _0802A5E8
_0802A5E6:
	movs r0, #5
_0802A5E8:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A614 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _0802A618 @ =gPlayer
	ldr r1, _0802A61C @ =sub_8025548
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0802A614: .4byte 0xFFFFBFFF
_0802A618: .4byte gPlayer
_0802A61C: .4byte sub_8025548

	thumb_func_start sub_802A620
sub_802A620: @ 0x0802A620
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x90
	ldr r3, [r1]
	ldr r1, [r3, #0x1c]
	ldr r2, _0802A654 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _0802A658 @ =gPlayer
	ldr r2, _0802A65C @ =sub_802569C
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0802A654: .4byte 0xFFFFBFFF
_0802A658: .4byte gPlayer
_0802A65C: .4byte sub_802569C

	thumb_func_start sub_802A660
sub_802A660: @ 0x0802A660
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _0802A6BA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _0802A69C
	cmp r1, #0x20
	bne _0802A6BA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0802A690
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A690:
	subs r0, #0x18
	cmp r0, #0
	bge _0802A6B8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _0802A6B8
_0802A69C:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0802A6B0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _0802A6BA
_0802A6B0:
	adds r0, #0x18
	cmp r0, #0
	ble _0802A6B8
	movs r0, #0x60
_0802A6B8:
	strh r0, [r2, #0x14]
_0802A6BA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802A6C0
sub_802A6C0: @ 0x0802A6C0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0802A708 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r2, ip
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0802A70C @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802A710 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x72
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_0802A708: .4byte 0xFFFFCFFF
_0802A70C: .4byte gPlayer
_0802A710: .4byte 0xBFFFFFFF

	thumb_func_start sub_802A714
sub_802A714: @ 0x0802A714
	push {lr}
	adds r2, r0, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bhi _0802A7A4
	lsls r0, r0, #2
	ldr r1, _0802A730 @ =_0802A734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A730: .4byte _0802A734
_0802A734: @ jump table
	.4byte _0802A748 @ case 0
	.4byte _0802A750 @ case 1
	.4byte _0802A76A @ case 2
	.4byte _0802A772 @ case 3
	.4byte _0802A78C @ case 4
_0802A748:
	adds r0, r2, #0
	bl sub_8011D48
	b _0802A7A4
_0802A750:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A762
	adds r0, r2, #0
	bl sub_8012548
	b _0802A7A4
_0802A762:
	adds r0, r2, #0
	bl sub_8012830
	b _0802A7A4
_0802A76A:
	adds r0, r2, #0
	bl sub_8012D3C
	b _0802A7A4
_0802A772:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A784
	adds r0, r2, #0
	bl sub_8012EEC
	b _0802A7A4
_0802A784:
	adds r0, r2, #0
	bl sub_8013070
	b _0802A7A4
_0802A78C:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A79E
	adds r0, r2, #0
	bl sub_8013F04
	b _0802A7A4
_0802A79E:
	adds r0, r2, #0
	bl sub_8011D48
_0802A7A4:
	pop {r0}
	bx r0

	thumb_func_start sub_802A7A8
sub_802A7A8: @ 0x0802A7A8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802A830 @ =sub_802AA48
	ldr r2, _0802A834 @ =0x00004001
	ldr r1, _0802A838 @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r1, _0802A83C @ =IWRAM_START + 0x30
	adds r0, r4, r1
	movs r1, #0
	mov r8, r1
	strb r6, [r0]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	ldr r0, _0802A840 @ =0x00000352
	strh r0, [r5, #0xa]
	ldr r1, _0802A844 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802A848 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802A84C @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802A850 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0x97
	bl m4aSongNumStart
	mov r0, sb
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802A830: .4byte sub_802AA48
_0802A834: .4byte 0x00004001
_0802A838: .4byte sub_802AE58
_0802A83C: .4byte IWRAM_START + 0x30
_0802A840: .4byte 0x00000352
_0802A844: .4byte IWRAM_START + 0x20
_0802A848: .4byte IWRAM_START + 0x21
_0802A84C: .4byte IWRAM_START + 0x22
_0802A850: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802A854
sub_802A854: @ 0x0802A854
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802A8D8 @ =sub_802AC60
	ldr r2, _0802A8DC @ =0x00004001
	ldr r1, _0802A8E0 @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldr r1, _0802A8E4 @ =IWRAM_START + 0x30
	adds r0, r4, r1
	movs r1, #0
	mov r8, r1
	strb r6, [r0]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	movs r0, #0xd5
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r1, _0802A8E8 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802A8EC @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802A8F0 @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802A8F4 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	mov r0, sb
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802A8D8: .4byte sub_802AC60
_0802A8DC: .4byte 0x00004001
_0802A8E0: .4byte sub_802AE58
_0802A8E4: .4byte IWRAM_START + 0x30
_0802A8E8: .4byte IWRAM_START + 0x20
_0802A8EC: .4byte IWRAM_START + 0x21
_0802A8F0: .4byte IWRAM_START + 0x22
_0802A8F4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802A8F8
sub_802A8F8: @ 0x0802A8F8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0802A980 @ =sub_802AB04
	ldr r2, _0802A984 @ =0x00004001
	ldr r1, _0802A988 @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r0, [r6, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r1, _0802A98C @ =IWRAM_START + 0x30
	adds r0, r0, r1
	movs r1, #0
	mov r8, r1
	strb r4, [r0]
	ldrh r4, [r6, #6]
	adds r5, r4, r5
	movs r0, #0x24
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	ldr r0, _0802A990 @ =0x00000353
	strh r0, [r5, #0xa]
	ldr r1, _0802A994 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802A998 @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802A99C @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802A9A0 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	movs r0, #0x97
	bl m4aSongNumStart
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802A980: .4byte sub_802AB04
_0802A984: .4byte 0x00004001
_0802A988: .4byte sub_802AE58
_0802A98C: .4byte IWRAM_START + 0x30
_0802A990: .4byte 0x00000353
_0802A994: .4byte IWRAM_START + 0x20
_0802A998: .4byte IWRAM_START + 0x21
_0802A99C: .4byte IWRAM_START + 0x22
_0802A9A0: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802A9A4
sub_802A9A4: @ 0x0802A9A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0802AA24 @ =sub_802AD60
	ldr r2, _0802AA28 @ =0x00004001
	ldr r1, _0802AA2C @ =sub_802AE58
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r0, [r6, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r1, _0802AA30 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	movs r1, #0
	mov r8, r1
	strb r4, [r0]
	ldrh r4, [r6, #6]
	adds r5, r4, r5
	movs r0, #8
	bl VramMalloc
	str r0, [r5, #4]
	movs r2, #0
	mov r0, r8
	strh r0, [r5, #8]
	ldr r0, _0802AA34 @ =0x00000371
	strh r0, [r5, #0xa]
	ldr r1, _0802AA38 @ =IWRAM_START + 0x20
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, _0802AA3C @ =IWRAM_START + 0x21
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	mov r1, r8
	strh r1, [r5, #0x1c]
	ldr r0, _0802AA40 @ =IWRAM_START + 0x22
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802AA44 @ =IWRAM_START + 0x25
	adds r4, r4, r1
	strb r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802AA24: .4byte sub_802AD60
_0802AA28: .4byte 0x00004001
_0802AA2C: .4byte sub_802AE58
_0802AA30: .4byte IWRAM_START + 0x30
_0802AA34: .4byte 0x00000371
_0802AA38: .4byte IWRAM_START + 0x20
_0802AA3C: .4byte IWRAM_START + 0x21
_0802AA40: .4byte IWRAM_START + 0x22
_0802AA44: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802AA48
sub_802AA48: @ 0x0802AA48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802AA7C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	ldr r3, _0802AA80 @ =IWRAM_START + 0x30
	adds r0, r1, r3
	ldrb r7, [r0]
	orrs r4, r1
	ldr r6, _0802AA84 @ =gCamera
	ldr r3, _0802AA88 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r5, #3
	ands r5, r1
	cmp r5, #1
	beq _0802AA8C
	adds r0, r2, #0
	bl TaskDestroy
	b _0802AAFA
	.align 2, 0
_0802AA7C: .4byte gCurTask
_0802AA80: .4byte IWRAM_START + 0x30
_0802AA84: .4byte gCamera
_0802AA88: .4byte gPlayer
_0802AA8C:
	movs r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _0802AAFA
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r6]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802AAE8 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r1, r5, #0
	ands r1, r7
	ldr r0, _0802AAEC @ =gUnknown_03005590
	ldr r0, [r0]
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _0802AAF0
	cmp r1, r5
	bne _0802AAF4
	b _0802AAFA
	.align 2, 0
_0802AAE8: .4byte 0xFFFFCFFF
_0802AAEC: .4byte gUnknown_03005590
_0802AAF0:
	cmp r1, #0
	beq _0802AAFA
_0802AAF4:
	adds r0, r4, #0
	bl sub_80051E8
_0802AAFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802AB04
sub_802AB04: @ 0x0802AB04
	push {r4, r5, r6, lr}
	ldr r0, _0802AB3C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	ldr r3, _0802AB40 @ =IWRAM_START + 0x30
	adds r0, r1, r3
	ldrb r6, [r0]
	orrs r4, r1
	ldr r5, _0802AB44 @ =gCamera
	ldr r0, _0802AB48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AB8E
	ldr r3, _0802AB4C @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #8
	beq _0802AB50
	adds r0, r2, #0
	bl TaskDestroy
	b _0802ABC2
	.align 2, 0
_0802AB3C: .4byte gCurTask
_0802AB40: .4byte IWRAM_START + 0x30
_0802AB44: .4byte gCamera
_0802AB48: .4byte gGameMode
_0802AB4C: .4byte gPlayer
_0802AB50:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ABC2
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r5]
	adds r2, r3, #0
	adds r2, #0x7c
	subs r0, r0, r1
	ldrh r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0x16]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r2, [r4, #0x10]
	ldr r0, _0802ABB0 @ =0xFFFFCFFF
	ands r2, r0
	str r2, [r4, #0x10]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	orrs r2, r0
	str r2, [r4, #0x10]
_0802AB8E:
	adds r0, r4, #0
	bl sub_8004558
	lsls r0, r6, #0x18
	asrs r2, r0, #0x18
	movs r3, #1
	ands r2, r3
	ldr r0, _0802ABB4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802ABB8
	cmp r2, r3
	bne _0802ABBC
	b _0802ABC2
	.align 2, 0
_0802ABB0: .4byte 0xFFFFCFFF
_0802ABB4: .4byte gUnknown_03005590
_0802ABB8:
	cmp r2, #0
	beq _0802ABC2
_0802ABBC:
	adds r0, r4, #0
	bl sub_80051E8
_0802ABC2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_802ABC8
sub_802ABC8: @ 0x0802ABC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ABEC @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r7, _0802ABF0 @ =gCamera
	ldr r3, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r3
	cmp r0, #0
	beq _0802ABF4
	adds r0, r2, #0
	bl TaskDestroy
	b _0802AC4E
	.align 2, 0
_0802ABEC: .4byte gCurTask
_0802ABF0: .4byte gCamera
_0802ABF4:
	movs r5, #0
	movs r6, #0
	movs r2, #0
	ldr r0, _0802AC54 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802AC26
	ldr r1, _0802AC58 @ =gPlayer
	ldr r0, [r1, #8]
	adds r2, r1, #0
	adds r2, #0x7c
	asrs r0, r0, #8
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r1, #0xc]
	lsls r0, r0, #8
	lsrs r6, r0, #0x10
	adds r1, #0x90
	ldr r0, [r1]
	ldr r2, [r0, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
_0802AC26:
	ldr r1, [r7]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r7, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, _0802AC5C @ =0xFFFFCFFF
	ands r3, r0
	orrs r3, r2
	str r3, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802AC4E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AC54: .4byte gGameMode
_0802AC58: .4byte gPlayer
_0802AC5C: .4byte 0xFFFFCFFF

	thumb_func_start sub_802AC60
sub_802AC60: @ 0x0802AC60
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ACB0 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r2, _0802ACB4 @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldrb r7, [r0]
	orrs r5, r1
	ldr r0, _0802ACB8 @ =gCamera
	mov ip, r0
	ldr r0, _0802ACBC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802ACC8
	ldr r1, _0802ACC0 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #0x18
	asrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r2, r1
	adds r1, #0x57
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802ACD8
	ldr r1, _0802ACC4 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	ldrh r4, [r0]
	adds r1, #2
	adds r0, r2, r1
	ldrh r3, [r0]
	ldr r2, [r6, #0x10]
	b _0802AD02
	.align 2, 0
_0802ACB0: .4byte gCurTask
_0802ACB4: .4byte IWRAM_START + 0x30
_0802ACB8: .4byte gCamera
_0802ACBC: .4byte gGameMode
_0802ACC0: .4byte gMultiplayerPlayerTasks
_0802ACC4: .4byte IWRAM_START + 0x50
_0802ACC8:
	ldr r2, _0802ACE0 @ =gPlayer
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802ACE4
_0802ACD8:
	adds r0, r3, #0
	bl TaskDestroy
	b _0802AD5A
	.align 2, 0
_0802ACE0: .4byte gPlayer
_0802ACE4:
	ldr r0, [r2, #8]
	adds r1, r2, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r2, #0xc]
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r2, [r0, #0x1c]
_0802AD02:
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
	mov r0, ip
	ldr r1, [r0]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r0, ip
	ldr r1, [r0, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, [r5, #0x10]
	ldr r1, _0802AD48 @ =0xFFFFCFFF
	ands r0, r1
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r3, #1
	adds r2, r3, #0
	bics r2, r7
	ldr r0, _0802AD4C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AD50
	cmp r2, r3
	bne _0802AD54
	b _0802AD5A
	.align 2, 0
_0802AD48: .4byte 0xFFFFCFFF
_0802AD4C: .4byte gUnknown_03005590
_0802AD50:
	cmp r2, #0
	beq _0802AD5A
_0802AD54:
	adds r0, r5, #0
	bl sub_80051E8
_0802AD5A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802AD60
sub_802AD60: @ 0x0802AD60
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802ADAC @ =gCurTask
	ldr r4, [r0]
	ldrh r1, [r4, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	ldr r2, _0802ADB0 @ =IWRAM_START + 0x30
	adds r0, r1, r2
	ldrb r2, [r0]
	orrs r5, r1
	ldr r0, _0802ADB4 @ =gCamera
	mov ip, r0
	ldr r0, _0802ADB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802AE4C
	ldr r1, _0802ADBC @ =gMultiplayerPlayerTasks
	lsls r2, r2, #0x18
	asrs r0, r2, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r3, r1
	adds r1, #0x57
	adds r0, r3, r1
	ldrb r1, [r0]
	movs r0, #0x50
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _0802ADC0
	adds r0, r4, #0
	bl TaskDestroy
	b _0802AE52
	.align 2, 0
_0802ADAC: .4byte gCurTask
_0802ADB0: .4byte IWRAM_START + 0x30
_0802ADB4: .4byte gCamera
_0802ADB8: .4byte gGameMode
_0802ADBC: .4byte gMultiplayerPlayerTasks
_0802ADC0:
	ldr r2, _0802AE04 @ =IWRAM_START + 0x50
	adds r0, r3, r2
	mov r2, ip
	ldr r1, [r2]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, _0802AE08 @ =IWRAM_START + 0x52
	adds r0, r3, r1
	ldr r1, [r2, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r5, #0x10]
	ldr r0, _0802AE0C @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r5, #0x10]
	ldr r2, [r6, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r2, r0
	orrs r2, r1
	str r2, [r5, #0x10]
	ldr r0, _0802AE10 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802AE14
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	b _0802AE18
	.align 2, 0
_0802AE04: .4byte IWRAM_START + 0x50
_0802AE08: .4byte IWRAM_START + 0x52
_0802AE0C: .4byte 0xFFFFCFFF
_0802AE10: .4byte gUnknown_03005424
_0802AE14:
	ldr r0, _0802AE38 @ =0xFFFFF7FF
	ands r2, r0
_0802AE18:
	str r2, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	asrs r2, r7, #0x18
	movs r3, #1
	ands r2, r3
	ldr r0, _0802AE3C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AE40
	cmp r2, r3
	bne _0802AE44
	b _0802AE52
	.align 2, 0
_0802AE38: .4byte 0xFFFFF7FF
_0802AE3C: .4byte gUnknown_03005590
_0802AE40:
	cmp r2, #0
	beq _0802AE52
_0802AE44:
	adds r0, r5, #0
	bl sub_80051E8
	b _0802AE52
_0802AE4C:
	adds r0, r4, #0
	bl TaskDestroy
_0802AE52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802AE58
sub_802AE58: @ 0x0802AE58
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_802AE6C
sub_802AE6C: @ 0x0802AE6C
	push {r4, r5, r6, r7, lr}
	ldr r2, _0802AEF0 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x1c
	adds r6, r0, r1
	adds r1, #0x30
	adds r5, r0, r1
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r5, #6]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	strh r0, [r5, #8]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r3, r0, #3
	movs r7, #0x80
	lsls r7, r7, #1
	cmp r3, r7
	ble _0802AEA0
	adds r3, r7, #0
_0802AEA0:
	strh r3, [r5, #2]
	strh r3, [r5, #4]
	ldrh r1, [r4, #0x14]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802AEB2
	rsbs r0, r3, #0
	strh r0, [r5, #2]
_0802AEB2:
	ldrh r1, [r4, #0x14]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802AEC2
	ldrh r0, [r5, #4]
	rsbs r0, r0, #0
	strh r0, [r5, #4]
_0802AEC2:
	ldrh r0, [r5, #6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802AEE6
	ldrh r0, [r5, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0802AEE6
	ldrh r3, [r4, #0x10]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0x80
	ble _0802AEF4
_0802AEE6:
	ldr r0, [r2]
	bl TaskDestroy
	b _0802AF50
	.align 2, 0
_0802AEF0: .4byte gCurTask
_0802AEF4:
	cmp r0, #0x40
	bgt _0802AF1C
	ldr r1, _0802AF58 @ =gSineTable
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	rsbs r0, r0, #0
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
_0802AF1C:
	adds r0, r3, #1
	strh r0, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r2, _0802AF5C @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_0802AF50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF58: .4byte gSineTable
_0802AF5C: .4byte gUnknown_030054B8

	thumb_func_start sub_802AF60
sub_802AF60: @ 0x0802AF60
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	ldr r4, _0802AFFC @ =gCamera
	ldr r0, _0802B000 @ =sub_802AE6C
	str r0, [sp]
	ldr r0, _0802B004 @ =sub_801F550
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F15C
	mov r8, r0
	ldrh r5, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r5, r2
	ldr r1, [r4]
	lsls r1, r1, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r2]
	ldr r1, [r4, #4]
	lsls r1, r1, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r2, #4]
	movs r4, #0
	strh r4, [r2, #8]
	movs r0, #0x90
	lsls r0, r0, #1
	strh r0, [r2, #0xa]
	strh r4, [r2, #0x10]
	adds r6, #0x60
	ldrb r0, [r6]
	strb r0, [r2, #0x1a]
	ldr r0, _0802B008 @ =IWRAM_START + 0x1C
	adds r6, r5, r0
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0802B00C @ =0x00000366
	strh r0, [r6, #0xa]
	movs r0, #5
	mov r1, sb
	subs r0, r0, r1
	ldr r2, _0802B010 @ =IWRAM_START + 0x3C
	adds r1, r5, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	ldr r0, _0802B014 @ =IWRAM_START + 0x4C
	adds r5, r5, r0
	strh r4, [r5]
	strh r4, [r5, #2]
	strh r4, [r5, #4]
	strh r4, [r5, #6]
	strh r4, [r5, #8]
	mov r0, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802AFFC: .4byte gCamera
_0802B000: .4byte sub_802AE6C
_0802B004: .4byte sub_801F550
_0802B008: .4byte IWRAM_START + 0x1C
_0802B00C: .4byte 0x00000366
_0802B010: .4byte IWRAM_START + 0x3C
_0802B014: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_802B018
sub_802B018: @ 0x0802B018
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r1, _0802B03C @ =gUnknown_03005B34
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0xb
	ble _0802B040
	movs r0, #0
	b _0802B0F2
	.align 2, 0
_0802B03C: .4byte gUnknown_03005B34
_0802B040:
	adds r0, r2, #1
	strb r0, [r1]
	ldr r0, _0802B09C @ =sub_802B1AC
	str r0, [sp]
	ldr r0, _0802B0A0 @ =sub_802B3EC
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_801F15C
	mov ip, r0
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	adds r0, #0x1c
	adds r4, r2, r0
	ldr r1, _0802B0A4 @ =IWRAM_START + 0x4C
	adds r5, r2, r1
	str r6, [r3]
	str r7, [r3, #4]
	movs r6, #0
	movs r1, #0
	mov r0, r8
	strh r0, [r3, #8]
	ldr r0, _0802B0A8 @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r1, [r3, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	strh r1, [r3, #0x14]
	mov r1, sb
	cmp r1, #0
	bne _0802B0B8
	ldr r0, _0802B0AC @ =0x06012A40
	str r0, [r4, #4]
	ldr r0, _0802B0B0 @ =0x00000355
	strh r0, [r4, #0xa]
	ldr r1, _0802B0B4 @ =IWRAM_START + 0x3C
	adds r0, r2, r1
	strb r6, [r0]
	b _0802B0DE
	.align 2, 0
_0802B09C: .4byte sub_802B1AC
_0802B0A0: .4byte sub_802B3EC
_0802B0A4: .4byte IWRAM_START + 0x4C
_0802B0A8: .4byte 0x0000FF80
_0802B0AC: .4byte 0x06012A40
_0802B0B0: .4byte 0x00000355
_0802B0B4: .4byte IWRAM_START + 0x3C
_0802B0B8:
	ldr r0, _0802B100 @ =0x06012AC0
	str r0, [r4, #4]
	ldr r0, _0802B104 @ =0x00000356
	strh r0, [r4, #0xa]
	ldr r1, _0802B108 @ =IWRAM_START + 0x3C
	adds r0, r2, r1
	strb r6, [r0]
	ldr r2, _0802B10C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0802B110 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0802B114 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r0, r1
	lsrs r0, r0, #0x10
	strh r0, [r3, #0x14]
_0802B0DE:
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r1, [r5]
	strh r1, [r5, #2]
	strh r1, [r5, #4]
	strh r1, [r5, #6]
	strh r1, [r5, #8]
	mov r0, ip
_0802B0F2:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B100: .4byte 0x06012AC0
_0802B104: .4byte 0x00000356
_0802B108: .4byte IWRAM_START + 0x3C
_0802B10C: .4byte gPseudoRandom
_0802B110: .4byte 0x00196225
_0802B114: .4byte 0x3C6EF35F

	thumb_func_start sub_802B118
sub_802B118: @ 0x0802B118
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r2, #0
	ldr r0, _0802B19C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B192
	ldr r7, _0802B1A0 @ =gPseudoRandom
	ldr r0, [r7]
	ldr r6, _0802B1A4 @ =0x00196225
	muls r0, r6, r0
	ldr r1, _0802B1A8 @ =0x3C6EF35F
	mov ip, r1
	adds r1, r0, r1
	str r1, [r7]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802B192
	muls r1, r6, r1
	ldr r3, _0802B1A8 @ =0x3C6EF35F
	adds r1, r1, r3
	movs r2, #0xf0
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	lsrs r4, r0, #8
	adds r0, r1, #0
	muls r0, r6, r0
	adds r3, r0, r3
	str r3, [r7]
	adds r0, r3, #0
	ands r0, r2
	lsrs r0, r0, #8
	adds r2, r0, #0
	subs r2, #8
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B172
	rsbs r4, r4, #0
_0802B172:
	ldr r0, [r5, #8]
	subs r0, r0, r4
	ldr r1, [r5, #0xc]
	subs r1, r1, r2
	movs r4, #0x10
	ldrsh r2, [r5, r4]
	muls r3, r6, r3
	add r3, ip
	str r3, [r7]
	movs r4, #0x80
	lsls r4, r4, #1
	ands r3, r4
	lsrs r3, r3, #8
	bl sub_802B018
	movs r2, #1
_0802B192:
	adds r0, r2, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B19C: .4byte gUnknown_03005590
_0802B1A0: .4byte gPseudoRandom
_0802B1A4: .4byte 0x00196225
_0802B1A8: .4byte 0x3C6EF35F

	thumb_func_start sub_802B1AC
sub_802B1AC: @ 0x0802B1AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802B268 @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	adds r1, #0x1c
	adds r5, r0, r1
	ldr r4, _0802B26C @ =IWRAM_START + 0x4C
	adds r7, r0, r4
	ldr r1, [r6]
	ldr r4, [r6, #4]
	movs r0, #0x10
	ldrsh r2, [r6, r0]
	ldr r3, _0802B270 @ =gSineTable
	movs r0, #0xff
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r1, r1, r0
	ldr r3, _0802B274 @ =gCamera
	asrs r1, r1, #8
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r7, #6]
	asrs r4, r4, #8
	ldr r0, [r3, #4]
	subs r0, r4, r0
	strh r0, [r7, #8]
	adds r2, #1
	lsls r2, r2, #4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r3, ip
	cmp r2, r0
	ble _0802B200
	adds r2, r0, #0
_0802B200:
	strh r2, [r7, #2]
	strh r2, [r7, #4]
	ldrh r1, [r6, #0x14]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802B212
	rsbs r0, r2, #0
	strh r0, [r7, #2]
_0802B212:
	ldrh r1, [r6, #0x14]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B222
	ldrh r0, [r7, #4]
	rsbs r0, r0, #0
	strh r0, [r7, #4]
_0802B222:
	ldrh r0, [r7, #6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802B260
	ldrh r0, [r7, #8]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bhi _0802B260
	ldr r2, _0802B278 @ =gUnknown_03005660
	ldrb r0, [r2]
	cmp r0, #1
	bne _0802B260
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _0802B260
	subs r1, r4, #3
	cmp r1, r0
	blt _0802B260
	ldrh r2, [r6, #0x10]
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802B27C
_0802B260:
	ldr r0, [r3]
	bl TaskDestroy
	b _0802B2CE
	.align 2, 0
_0802B268: .4byte gCurTask
_0802B26C: .4byte IWRAM_START + 0x4C
_0802B270: .4byte gSineTable
_0802B274: .4byte gCamera
_0802B278: .4byte gUnknown_03005660
_0802B27C:
	movs r4, #8
	ldrsh r1, [r6, r4]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	movs r0, #0xa
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r6, #4]
	ldrh r1, [r6, #8]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x13
	subs r1, r1, r0
	strh r1, [r6, #8]
	adds r0, r2, #1
	strh r0, [r6, #0x10]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	ldr r2, _0802B2D4 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_0802B2CE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2D4: .4byte gUnknown_030054B8

	thumb_func_start sub_802B2D8
sub_802B2D8: @ 0x0802B2D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0802B304 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r7, [r0]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802B308
	adds r0, r2, #0
	bl TaskDestroy
	b _0802B392
	.align 2, 0
_0802B304: .4byte gCurTask
_0802B308:
	ldr r0, _0802B3A0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0802B392
	ldr r2, _0802B3A4 @ =gPseudoRandom
	ldr r0, [r2]
	ldr r3, _0802B3A8 @ =0x00196225
	muls r0, r3, r0
	ldr r5, _0802B3AC @ =0x3C6EF35F
	adds r1, r0, r5
	str r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802B392
	adds r0, r1, #0
	muls r0, r3, r0
	adds r0, r0, r5
	str r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	lsrs r4, r0, #8
	mov sl, r2
	adds r6, r3, #0
	ldr r0, _0802B3B0 @ =0x0007FF00
	mov sb, r0
	ldr r1, _0802B3B4 @ =0xFFFFFC00
	mov r8, r1
_0802B348:
	mov r2, sl
	ldr r0, [r2]
	muls r0, r6, r0
	adds r0, r0, r5
	adds r1, r0, #0
	mov r3, sb
	ands r1, r3
	lsrs r1, r1, #8
	add r1, r8
	muls r0, r6, r0
	adds r0, r0, r5
	adds r2, r0, #0
	ands r2, r3
	lsrs r2, r2, #8
	add r2, r8
	adds r3, r0, #0
	muls r3, r6, r3
	adds r3, r3, r5
	mov r0, sl
	str r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r3, r0
	lsrs r3, r3, #8
	ldr r0, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	adds r1, r1, r2
	ldr r2, _0802B3B8 @ =0xFFFFF400
	adds r1, r1, r2
	movs r2, #0
	bl sub_802B018
	adds r0, r4, #0
	subs r4, #1
	cmp r0, #0
	bne _0802B348
_0802B392:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B3A0: .4byte gUnknown_03005590
_0802B3A4: .4byte gPseudoRandom
_0802B3A8: .4byte 0x00196225
_0802B3AC: .4byte 0x3C6EF35F
_0802B3B0: .4byte 0x0007FF00
_0802B3B4: .4byte 0xFFFFFC00
_0802B3B8: .4byte 0xFFFFF400

	thumb_func_start sub_802B3BC
sub_802B3BC: @ 0x0802B3BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802B3E4 @ =sub_802B2D8
	ldr r2, _0802B3E8 @ =0x00004001
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r4, [r1]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802B3E4: .4byte sub_802B2D8
_0802B3E8: .4byte 0x00004001

	thumb_func_start sub_802B3EC
sub_802B3EC: @ 0x0802B3EC
	ldr r1, _0802B3F8 @ =gUnknown_03005B34
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0802B3F8: .4byte gUnknown_03005B34

	thumb_func_start sub_802B3FC
sub_802B3FC: @ 0x0802B3FC
	push {r4, r5, lr}
	ldr r0, _0802B420 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq _0802B416
	ldr r0, [r3]
	cmp r0, #0
	bgt _0802B424
_0802B416:
	adds r0, r2, #0
	bl TaskDestroy
	b _0802B4EA
	.align 2, 0
_0802B420: .4byte gCurTask
_0802B424:
	ldr r5, _0802B448 @ =gCamera
	ldr r0, [r3, #0x10]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802B458
	ldr r2, _0802B44C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0802B450 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0802B454 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x17
	adds r1, r0, #0
	subs r1, #0xff
	b _0802B466
	.align 2, 0
_0802B448: .4byte gCamera
_0802B44C: .4byte gPseudoRandom
_0802B450: .4byte 0x00196225
_0802B454: .4byte 0x3C6EF35F
_0802B458:
	ldr r0, _0802B480 @ =gSineTable
	ldr r1, [r3, #0x14]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
_0802B466:
	ldr r0, [r3]
	muls r0, r1, r0
	asrs r2, r0, #0x10
	ldr r0, [r3, #0x10]
	movs r1, #3
	ands r1, r0
	adds r4, r0, #0
	cmp r1, #1
	beq _0802B484
	cmp r1, #2
	beq _0802B48C
	b _0802B496
	.align 2, 0
_0802B480: .4byte gSineTable
_0802B484:
	cmp r2, #0
	bge _0802B496
	rsbs r2, r2, #0
	b _0802B496
_0802B48C:
	adds r0, r2, #0
	cmp r2, #0
	bge _0802B494
	rsbs r0, r2, #0
_0802B494:
	rsbs r2, r0, #0
_0802B496:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _0802B4AA
	ldr r0, _0802B4F0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0802B4C8
_0802B4AA:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0802B4B8
	adds r0, r5, #0
	adds r0, #0x60
	strh r2, [r0]
_0802B4B8:
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802B4C8
	adds r0, r5, #0
	adds r0, #0x62
	strh r2, [r0]
_0802B4C8:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	ble _0802B4D2
	subs r0, #1
	str r0, [r3, #0xc]
_0802B4D2:
	ldr r1, [r3]
	cmp r1, #0
	ble _0802B4DE
	ldr r0, [r3, #4]
	subs r0, r1, r0
	str r0, [r3]
_0802B4DE:
	ldr r0, [r3, #0x14]
	ldr r1, [r3, #8]
	adds r0, r0, r1
	ldr r1, _0802B4F4 @ =0x000003FF
	ands r0, r1
	str r0, [r3, #0x14]
_0802B4EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B4F0: .4byte gUnknown_03005590
_0802B4F4: .4byte 0x000003FF

	thumb_func_start sub_802B4F8
sub_802B4F8: @ 0x0802B4F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	ldr r0, _0802B540 @ =sub_802B3FC
	ldr r2, _0802B544 @ =0x00000EFF
	ldr r1, _0802B548 @ =sub_802B54C
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r4, [r1]
	str r5, [r1, #4]
	str r6, [r1, #8]
	movs r2, #0
	str r2, [r1, #0x14]
	mov r2, r8
	str r2, [r1, #0xc]
	str r7, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B540: .4byte sub_802B3FC
_0802B544: .4byte 0x00000EFF
_0802B548: .4byte sub_802B54C

	thumb_func_start sub_802B54C
sub_802B54C: @ 0x0802B54C
	push {lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r3, _0802B580 @ =gCamera
	ldr r0, [r2, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802B56A
	adds r1, r3, #0
	adds r1, #0x60
	movs r0, #0
	strh r0, [r1]
_0802B56A:
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802B57C
	adds r1, r3, #0
	adds r1, #0x62
	movs r0, #0
	strh r0, [r1]
_0802B57C:
	pop {r0}
	bx r0
	.align 2, 0
_0802B580: .4byte gCamera

	thumb_func_start sub_802B584
sub_802B584: @ 0x0802B584
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _0802B5BC @ =gPlayerControls
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	ldr r7, _0802B5C0 @ =gLoadedSaveGame
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_0802B5A0:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _0802B5DA
	cmp r1, #1
	bgt _0802B5C4
	cmp r1, #0
	beq _0802B5CA
	b _0802B5F6
	.align 2, 0
_0802B5BC: .4byte gPlayerControls
_0802B5C0: .4byte gLoadedSaveGame
_0802B5C4:
	cmp r1, #2
	beq _0802B5E8
	b _0802B5F6
_0802B5CA:
	cmp r2, #2
	bne _0802B5D2
	strh r5, [r4]
	b _0802B5F6
_0802B5D2:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _0802B5F6
_0802B5DA:
	cmp r2, #2
	bne _0802B5E2
	strh r5, [r4, #2]
	b _0802B5F6
_0802B5E2:
	lsls r1, r2
	strh r1, [r4, #2]
	b _0802B5F6
_0802B5E8:
	cmp r2, #2
	bne _0802B5F0
	strh r5, [r4, #4]
	b _0802B5F6
_0802B5F0:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_0802B5F6:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0802B5A0
	ldr r1, [r7]
	ldrh r0, [r4]
	strh r0, [r1, #0x2c]
	ldrh r0, [r4, #2]
	strh r0, [r1, #0x2e]
	ldrh r0, [r4, #4]
	strh r0, [r1, #0x30]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802B61C
sub_802B61C: @ 0x0802B61C
	ldr r3, _0802B628 @ =gPlayerControls
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_0802B628: .4byte gPlayerControls

	thumb_func_start sub_802B62C
sub_802B62C: @ 0x0802B62C
	ldr r3, _0802B704 @ =gPlayer
	movs r2, #0
	movs r0, #0
	strh r0, [r3, #4]
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	strh r0, [r3, #0x10]
	strh r0, [r3, #0x12]
	strh r0, [r3, #0x14]
	strb r2, [r3, #0x16]
	strb r2, [r3, #0x17]
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x24
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	strh r0, [r3, #0x26]
	strh r0, [r3, #0x2a]
	strh r0, [r3, #0x2c]
	strh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	strh r0, [r3, #0x32]
	strh r0, [r3, #0x34]
	adds r1, #0x11
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	str r0, [r3, #0x3c]
	str r0, [r3, #0x40]
	str r0, [r3, #0x44]
	str r0, [r3, #0x48]
	str r0, [r3, #0x4c]
	adds r1, #0x18
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	adds r1, #1
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	str r0, [r3, #0x78]
	adds r1, #6
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x84
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0802B704: .4byte gPlayer

	thumb_func_start sub_802B708
sub_802B708: @ 0x0802B708
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	bl sub_802B62C
	ldr r1, _0802B7D8 @ =gCourseTime
	movs r0, #0x32
	strh r0, [r1]
	ldr r0, _0802B7DC @ =gPlayer
	movs r4, #0
	str r4, [r0, #0x20]
	str r4, [r0, #0x78]
	movs r5, #0
	movs r6, #0x80
	lsls r6, r6, #2
	strh r6, [r0, #0x10]
	strh r6, [r0, #0x14]
	ldr r0, _0802B7E0 @ =gUnknown_03005490
	str r4, [r0]
	ldr r0, _0802B7E4 @ =sub_802BC10
	movs r1, #0xc0
	lsls r1, r1, #1
	ldr r2, _0802B7E8 @ =0x00004040
	str r4, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _0802B7EC @ =gUnknown_03005B40
	str r0, [r1]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r0, #0x20
	str r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #0xa
	str r0, [r1, #4]
	movs r0, #0x90
	lsls r0, r0, #9
	str r0, [r1, #8]
	str r4, [r1, #0x10]
	str r4, [r1, #0x14]
	strh r4, [r1, #0x1a]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x20]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r1, #0xc]
	ldr r2, _0802B7F0 @ =IWRAM_START + 0x22
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _0802B7F4 @ =sub_802C828
	str r0, [r1, #0x24]
	ldr r7, _0802B7F8 @ =IWRAM_START + 0x128
	adds r0, r3, r7
	strb r5, [r0]
	ldr r0, _0802B7FC @ =gInput
	ldrh r0, [r0]
	strh r0, [r1, #0x1c]
	ldr r0, _0802B800 @ =gPressedKeys
	ldrh r0, [r0]
	strh r0, [r1, #0x1e]
	ldr r1, _0802B804 @ =IWRAM_START + 0x129
	adds r0, r3, r1
	strb r5, [r0]
	ldr r2, _0802B808 @ =IWRAM_START + 0x134
	adds r1, r3, r2
	ldr r0, _0802B80C @ =0x06010000
	str r0, [r1, #4]
	ldr r2, _0802B810 @ =gUnknown_080D69C8
	ldrh r0, [r2, #4]
	strh r0, [r1, #0xa]
	ldrb r2, [r2, #6]
	adds r7, #0x2c
	adds r0, r3, r7
	strb r2, [r0]
	strh r6, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0802B814 @ =IWRAM_START + 0x155
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r7, #2
	adds r2, r3, r7
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802B818 @ =IWRAM_START + 0x159
	adds r3, r3, r0
	strb r5, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B7D8: .4byte gCourseTime
_0802B7DC: .4byte gPlayer
_0802B7E0: .4byte gUnknown_03005490
_0802B7E4: .4byte sub_802BC10
_0802B7E8: .4byte 0x00004040
_0802B7EC: .4byte gUnknown_03005B40
_0802B7F0: .4byte IWRAM_START + 0x22
_0802B7F4: .4byte sub_802C828
_0802B7F8: .4byte IWRAM_START + 0x128
_0802B7FC: .4byte gInput
_0802B800: .4byte gPressedKeys
_0802B804: .4byte IWRAM_START + 0x129
_0802B808: .4byte IWRAM_START + 0x134
_0802B80C: .4byte 0x06010000
_0802B810: .4byte gUnknown_080D69C8
_0802B814: .4byte IWRAM_START + 0x155
_0802B818: .4byte IWRAM_START + 0x159

	thumb_func_start sub_802B81C
sub_802B81C: @ 0x0802B81C
	push {r4, r5, r6, lr}
	ldr r0, _0802B880 @ =gUnknown_03005B40
	ldr r2, [r0]
	cmp r2, #0
	beq _0802B878
	ldrh r1, [r2, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r1, r5
	ldr r0, _0802B884 @ =sub_802C7E8
	str r0, [r2, #8]
	ldr r0, _0802B888 @ =sub_802C8A0
	str r0, [r5, #0x24]
	ldr r0, _0802B88C @ =IWRAM_START + 0x23
	adds r2, r1, r0
	movs r4, #0
	movs r0, #2
	strb r0, [r2]
	ldr r3, _0802B890 @ =gUnknown_080D69C8
	ldrh r2, [r3, #0x14]
	ldr r6, _0802B894 @ =IWRAM_START + 0x13E
	adds r0, r1, r6
	movs r6, #0
	strh r2, [r0]
	ldrb r2, [r3, #0x16]
	ldr r3, _0802B898 @ =IWRAM_START + 0x154
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0802B89C @ =IWRAM_START + 0x155
	adds r2, r1, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r2, _0802B8A0 @ =IWRAM_START + 0x13C
	adds r0, r1, r2
	strh r4, [r0]
	subs r3, #0xc
	adds r0, r1, r3
	strh r4, [r0]
	adds r2, #0x14
	adds r0, r1, r2
	strh r4, [r0]
	str r4, [r5, #0x10]
	str r4, [r5, #0x14]
	ldr r3, _0802B8A4 @ =IWRAM_START + 0x22
	adds r1, r1, r3
	strb r6, [r1]
_0802B878:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B880: .4byte gUnknown_03005B40
_0802B884: .4byte sub_802C7E8
_0802B888: .4byte sub_802C8A0
_0802B88C: .4byte IWRAM_START + 0x23
_0802B890: .4byte gUnknown_080D69C8
_0802B894: .4byte IWRAM_START + 0x13E
_0802B898: .4byte IWRAM_START + 0x154
_0802B89C: .4byte IWRAM_START + 0x155
_0802B8A0: .4byte IWRAM_START + 0x13C
_0802B8A4: .4byte IWRAM_START + 0x22

	thumb_func_start sub_802B8A8
sub_802B8A8: @ 0x0802B8A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r0, [r4]
	movs r5, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0802B8BA
	b _0802BA72
_0802B8BA:
	ldr r0, _0802B944 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0802B8CC
	b _0802BA72
_0802B8CC:
	ldr r0, _0802B948 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802B94C @ =0x00008C9F
	cmp r1, r0
	bls _0802B964
	ldr r0, _0802B950 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0802B964
	ldr r1, _0802B954 @ =gPlayer
	movs r0, #0x80
	str r0, [r1, #0x20]
	ldr r0, _0802B958 @ =sub_802C8EC
	str r0, [r4, #0x24]
	movs r0, #0x3c
	str r0, [r4, #0xc]
	movs r2, #0
	strh r6, [r4, #0x1a]
	strh r3, [r4, #0x18]
	str r5, [r4]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #0x15
	strb r0, [r1]
	ldr r1, _0802B95C @ =gUnknown_080D69C8
	adds r0, r1, #0
	adds r0, #0xac
	ldrh r0, [r0]
	movs r5, #0x9f
	lsls r5, r5, #1
	adds r3, r4, r5
	strh r0, [r3]
	adds r1, #0xae
	ldrb r1, [r1]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802B960 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r6, [r0]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r6, [r0]
	adds r5, #0x12
	adds r0, r4, r5
	strh r6, [r0]
	str r6, [r4, #0x10]
	str r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	b _0802BA72
	.align 2, 0
_0802B944: .4byte gUnknown_03005424
_0802B948: .4byte gUnknown_03005490
_0802B94C: .4byte 0x00008C9F
_0802B950: .4byte gLoadedSaveGame
_0802B954: .4byte gPlayer
_0802B958: .4byte sub_802C8EC
_0802B95C: .4byte gUnknown_080D69C8
_0802B960: .4byte 0x00000155
_0802B964:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802BA0E
	ldr r0, _0802B9F4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _0802BA72
	ldr r1, _0802B9F8 @ =gCourseTime
	ldrh r0, [r1]
	adds r5, r0, #0
	cmp r5, #0
	bne _0802BA08
	ldr r1, _0802B9FC @ =gPlayer
	movs r0, #0x80
	str r0, [r1, #0x20]
	movs r1, #0x10
	ldr r0, _0802BA00 @ =sub_802C8EC
	str r0, [r4, #0x24]
	movs r0, #0x3c
	str r0, [r4, #0xc]
	movs r2, #0
	strh r5, [r4, #0x1a]
	adds r0, #0xc4
	strh r0, [r4, #0x18]
	str r1, [r4]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #0x15
	strb r0, [r1]
	ldr r1, _0802BA04 @ =gUnknown_080D69C8
	adds r0, r1, #0
	adds r0, #0xac
	ldrh r0, [r0]
	movs r7, #0x9f
	lsls r7, r7, #1
	adds r3, r4, r7
	strh r0, [r3]
	adds r1, #0xae
	ldrb r1, [r1]
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	adds r7, #0x17
	adds r1, r4, r7
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r5, [r0]
	subs r3, #0xc
	adds r0, r4, r3
	strh r5, [r0]
	subs r7, #5
	adds r0, r4, r7
	strh r5, [r0]
	str r5, [r4, #0x10]
	str r5, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
	movs r0, #0x77
	bl m4aSongNumStart
	b _0802BA72
	.align 2, 0
_0802B9F4: .4byte gUnknown_03005590
_0802B9F8: .4byte gCourseTime
_0802B9FC: .4byte gPlayer
_0802BA00: .4byte sub_802C8EC
_0802BA04: .4byte gUnknown_080D69C8
_0802BA08:
	subs r0, #1
	strh r0, [r1]
	b _0802BA72
_0802BA0E:
	bl sub_8050BB0
	cmp r0, #1
	bne _0802BA72
	ldr r2, _0802BA7C @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0802BA80 @ =sub_802C8A0
	str r0, [r4, #0x24]
	adds r1, r4, #0
	adds r1, #0x23
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802BA84 @ =gUnknown_080D69C8
	ldrh r0, [r1, #0x14]
	movs r3, #0x9f
	lsls r3, r3, #1
	adds r3, r3, r4
	mov ip, r3
	movs r3, #0
	mov r5, ip
	strh r0, [r5]
	ldrb r1, [r1, #0x16]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802BA88 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r2, [r0]
	movs r5, #0xa4
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r2, [r0]
	subs r7, #4
	adds r0, r4, r7
	strh r2, [r0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r3, [r0]
_0802BA72:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802BA7C: .4byte gUnknown_03005424
_0802BA80: .4byte sub_802C8A0
_0802BA84: .4byte gUnknown_080D69C8
_0802BA88: .4byte 0x00000155

	thumb_func_start sub_802BA8C
sub_802BA8C: @ 0x0802BA8C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802BB2C @ =gUnknown_03005B40
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	bl sub_8050BB0
	cmp r0, #1
	beq _0802BB4C
	ldr r1, [r6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BB4C
	movs r7, #0x80
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _0802BB4C
	movs r2, #0x80
	lsls r2, r2, #2
	adds r4, r1, #0
	ands r4, r2
	cmp r4, #0
	bne _0802BB4C
	ldr r0, _0802BB30 @ =sub_802C480
	str r0, [r6, #0x24]
	movs r3, #0
	movs r0, #0x78
	strh r0, [r6, #0x20]
	movs r0, #0x30
	str r0, [r6, #0xc]
	strh r2, [r6, #0x18]
	subs r0, #0x32
	ands r1, r0
	subs r0, #1
	ands r1, r0
	subs r0, #6
	ands r1, r0
	subs r0, #0x38
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r7
	str r1, [r6]
	ldr r0, _0802BB34 @ =IWRAM_START + 0x23
	adds r1, r5, r0
	movs r0, #3
	strb r0, [r1]
	ldr r2, _0802BB38 @ =gUnknown_080D69C8
	ldrh r1, [r2, #0x1c]
	ldr r7, _0802BB3C @ =IWRAM_START + 0x13E
	adds r0, r5, r7
	strh r1, [r0]
	ldrb r1, [r2, #0x1e]
	ldr r2, _0802BB40 @ =IWRAM_START + 0x154
	adds r0, r5, r2
	strb r1, [r0]
	adds r7, #0x17
	adds r1, r5, r7
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0802BB44 @ =IWRAM_START + 0x13C
	adds r0, r5, r1
	strh r4, [r0]
	subs r2, #0xc
	adds r0, r5, r2
	strh r4, [r0]
	subs r7, #5
	adds r0, r5, r7
	strh r4, [r0]
	str r4, [r6, #0x10]
	str r4, [r6, #0x14]
	ldr r1, _0802BB48 @ =IWRAM_START + 0x22
	adds r0, r5, r1
	strb r3, [r0]
	movs r0, #1
	b _0802BB4E
	.align 2, 0
_0802BB2C: .4byte gUnknown_03005B40
_0802BB30: .4byte sub_802C480
_0802BB34: .4byte IWRAM_START + 0x23
_0802BB38: .4byte gUnknown_080D69C8
_0802BB3C: .4byte IWRAM_START + 0x13E
_0802BB40: .4byte IWRAM_START + 0x154
_0802BB44: .4byte IWRAM_START + 0x13C
_0802BB48: .4byte IWRAM_START + 0x22
_0802BB4C:
	movs r0, #0
_0802BB4E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_802BB54
sub_802BB54: @ 0x0802BB54
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802BBF0 @ =gUnknown_03005B40
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	bl sub_8050BB0
	cmp r0, #1
	beq _0802BBE8
	ldr r1, [r6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BBE8
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802BBE8
	movs r2, #8
	adds r4, r1, #0
	ands r4, r2
	cmp r4, #0
	bne _0802BBE8
	ldr r0, _0802BBF4 @ =sub_802C55C
	str r0, [r6, #0x24]
	movs r3, #0
	strh r4, [r6, #0x1a]
	movs r0, #0x96
	lsls r0, r0, #1
	str r0, [r6, #0xc]
	strh r4, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #1
	ands r1, r0
	orrs r1, r2
	str r1, [r6]
	ldr r0, _0802BBF8 @ =IWRAM_START + 0x23
	adds r1, r5, r0
	movs r0, #0x14
	strb r0, [r1]
	ldr r1, _0802BBFC @ =gUnknown_080D69C8
	adds r0, r1, #0
	adds r0, #0xa4
	ldrh r2, [r0]
	ldr r7, _0802BC00 @ =IWRAM_START + 0x13E
	adds r0, r5, r7
	strh r2, [r0]
	adds r1, #0xa6
	ldrb r1, [r1]
	ldr r2, _0802BC04 @ =IWRAM_START + 0x154
	adds r0, r5, r2
	strb r1, [r0]
	adds r7, #0x17
	adds r1, r5, r7
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0802BC08 @ =IWRAM_START + 0x13C
	adds r0, r5, r1
	strh r4, [r0]
	subs r2, #0xc
	adds r0, r5, r2
	strh r4, [r0]
	subs r7, #5
	adds r0, r5, r7
	strh r4, [r0]
	str r4, [r6, #0x10]
	str r4, [r6, #0x14]
	ldr r1, _0802BC0C @ =IWRAM_START + 0x22
	adds r0, r5, r1
	strb r3, [r0]
_0802BBE8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BBF0: .4byte gUnknown_03005B40
_0802BBF4: .4byte sub_802C55C
_0802BBF8: .4byte IWRAM_START + 0x23
_0802BBFC: .4byte gUnknown_080D69C8
_0802BC00: .4byte IWRAM_START + 0x13E
_0802BC04: .4byte IWRAM_START + 0x154
_0802BC08: .4byte IWRAM_START + 0x13C
_0802BC0C: .4byte IWRAM_START + 0x22

	thumb_func_start sub_802BC10
sub_802BC10: @ 0x0802BC10
	push {r4, r5, lr}
	ldr r0, _0802BC84 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_802BCCC
	ldr r1, [r5, #0x24]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_802C9B0
	adds r0, r5, #0
	bl sub_802B8A8
	ldr r0, _0802BC88 @ =IWRAM_START + 0x129
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802BCBE
	ldr r1, _0802BC8C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0802BC90 @ =gUnknown_03002AE4
	ldr r0, _0802BC94 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802BC98 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0802BC9C @ =gVramGraphicsCopyCursor
	ldr r0, _0802BCA0 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0802BCA4 @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802BCB6
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802BCB6
	ldr r0, _0802BCA8 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802BCAC @ =0x00008C9F
	cmp r1, r0
	bls _0802BCB0
	movs r0, #2
	bl CreateGameOverScreen
	b _0802BCC4
	.align 2, 0
_0802BC84: .4byte gCurTask
_0802BC88: .4byte IWRAM_START + 0x129
_0802BC8C: .4byte 0x0000FFFF
_0802BC90: .4byte gUnknown_03002AE4
_0802BC94: .4byte gUnknown_0300287C
_0802BC98: .4byte gUnknown_03005390
_0802BC9C: .4byte gVramGraphicsCopyCursor
_0802BCA0: .4byte gVramGraphicsCopyQueueIndex
_0802BCA4: .4byte gNumLives
_0802BCA8: .4byte gUnknown_03005490
_0802BCAC: .4byte 0x00008C9F
_0802BCB0:
	bl GameStageStart
	b _0802BCC4
_0802BCB6:
	movs r0, #1
	bl CreateGameOverScreen
	b _0802BCC4
_0802BCBE:
	adds r0, r5, #0
	bl sub_802BE1C
_0802BCC4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802BCCC
sub_802BCCC: @ 0x0802BCCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [r6]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802BCEE
	ldr r0, [r6, #4]
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r6, #4]
_0802BCEE:
	ldr r7, [r6, #4]
	ldrh r1, [r6, #0x20]
	movs r2, #0x20
	ldrsh r0, [r6, r2]
	cmp r0, #0
	beq _0802BD04
	subs r0, r1, #1
	strh r0, [r6, #0x20]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802BD0E
_0802BD04:
	ldr r0, [r6]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6]
_0802BD0E:
	ldr r1, _0802BDC8 @ =gUnknown_080D650C
	ldr r0, _0802BDCC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #3
	adds r1, r2, r1
	ldr r0, [r1]
	lsls r0, r0, #8
	adds r3, r6, #0
	adds r3, #0x28
	str r3, [sp, #4]
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp, #8]
	movs r3, #0x94
	lsls r3, r3, #1
	adds r3, r6, r3
	str r3, [sp]
	cmp r7, r0
	blt _0802BDAA
	ldr r0, _0802BDD0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r1, [r1]
	mov r8, r1
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	mov sb, r0
	lsls r4, r1, #8
	adds r7, r7, r4
	lsls r5, r0, #8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804D594
	movs r3, #0
	ldr r0, [sp, #4]
	mov sl, r0
	mov ip, r4
	ldr r4, [sp, #8]
_0802BD60:
	lsls r1, r3, #3
	mov r0, sl
	adds r2, r0, r1
	ldr r0, [r2]
	add r0, ip
	str r0, [r2]
	adds r1, r4, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0802BD60
	ldr r1, _0802BDD4 @ =gUnknown_03005430
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802BDD8 @ =gCamera
	ldr r0, [r1]
	add r0, r8
	str r0, [r1]
	ldr r0, [r1, #0x20]
	add r0, r8
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	add r0, r8
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	add r0, sb
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	add r0, sb
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	add r0, sb
	str r0, [r1, #0x14]
_0802BDAA:
	ldr r1, [r6, #0x24]
	ldr r0, _0802BDDC @ =sub_802C8A0
	cmp r1, r0
	beq _0802BDEC
	ldr r0, _0802BDD8 @ =gCamera
	ldr r0, [r0, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r7, r1
	bge _0802BDE0
	adds r7, r1, #0
	b _0802BDEC
	.align 2, 0
_0802BDC8: .4byte gUnknown_080D650C
_0802BDCC: .4byte gCurrentLevel
_0802BDD0: .4byte gUnknown_080D661C
_0802BDD4: .4byte gUnknown_03005430
_0802BDD8: .4byte gCamera
_0802BDDC: .4byte sub_802C8A0
_0802BDE0:
	movs r3, #0x9c
	lsls r3, r3, #9
	adds r0, r0, r3
	cmp r7, r0
	ble _0802BDEC
	adds r7, r0, #0
_0802BDEC:
	str r7, [r6, #4]
	ldr r0, [sp]
	ldrb r2, [r0]
	lsls r0, r2, #3
	ldr r3, [sp, #4]
	adds r1, r3, r0
	str r7, [r1]
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldr r1, [r6, #8]
	str r1, [r0]
	adds r2, #1
	movs r0, #0x1f
	ands r2, r0
	ldr r3, [sp]
	strb r2, [r3]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802BE1C
sub_802BE1C: @ 0x0802BE1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802BE30
	b _0802BF96
_0802BE30:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0x80
	bne _0802BE46
	ldr r0, _0802BEB8 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802BE46
	b _0802BF96
_0802BE46:
	movs r3, #4
	ands r2, r3
	cmp r2, #0
	beq _0802BE5A
	ldr r0, _0802BEB8 @ =gUnknown_03005590
	ldr r0, [r0]
	ands r0, r3
	cmp r0, #0
	beq _0802BE5A
	b _0802BF96
_0802BE5A:
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r4, r6, r1
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r2, _0802BEBC @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r0, [r6, #0x10]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	ldr r0, [r6, #0x14]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	movs r2, #0
	cmp r0, #0
	beq _0802BE98
	movs r2, #3
_0802BE98:
	ands r1, r3
	cmp r1, #0
	beq _0802BEC4
	lsls r2, r2, #0xc
	ldr r3, _0802BEC0 @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	movs r0, #0x60
	orrs r2, r0
	str r2, [r5, #0x10]
	b _0802BECE
	.align 2, 0
_0802BEB8: .4byte gUnknown_03005590
_0802BEBC: .4byte gCamera
_0802BEC0: .4byte gUnknown_030054B8
_0802BEC4:
	lsls r0, r2, #0xc
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r5, #0x10]
_0802BECE:
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, [r6]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802BF24
	ldr r3, _0802BF1C @ =gSineTable
	ldr r1, [r6, #0xc]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0802BF20 @ =0x000003FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	ands r0, r2
	strh r0, [r4]
	strh r1, [r4, #2]
	strh r1, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	b _0802BF96
	.align 2, 0
_0802BF1C: .4byte gSineTable
_0802BF20: .4byte 0x000003FF
_0802BF24:
	adds r0, r5, #0
	bl sub_80051E8
	ldr r1, [r6]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0x80
	beq _0802BF96
	movs r0, #0x86
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0802BF96
	movs r4, #0
	subs r0, #0xf0
	adds r0, r0, r6
	mov r8, r0
	ldr r7, _0802BFA0 @ =gCamera
_0802BF48:
	ldr r0, _0802BFA4 @ =gUnknown_03005590
	ldr r0, [r0]
	adds r1, r4, #2
	bl Mod
	adds r4, #1
	cmp r0, #0
	bne _0802BF8E
	lsls r0, r4, #1
	adds r0, r0, r4
	mov r1, r8
	ldrb r2, [r1]
	subs r2, r2, r0
	movs r0, #0x1f
	ands r2, r0
	lsls r2, r2, #3
	adds r0, r6, #0
	adds r0, #0x28
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_0802BF8E:
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0802BF48
_0802BF96:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802BFA0: .4byte gCamera
_0802BFA4: .4byte gUnknown_03005590

	thumb_func_start sub_802BFA8
sub_802BFA8: @ 0x0802BFA8
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802BFD4 @ =gInput
	ldrh r1, [r0]
	strh r1, [r2, #0x1c]
	ldr r0, _0802BFD8 @ =gPressedKeys
	ldrh r0, [r0]
	strh r0, [r2, #0x1e]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802BFF8
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802BFDC
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #0x10
	b _0802C052
	.align 2, 0
_0802BFD4: .4byte gInput
_0802BFD8: .4byte gPressedKeys
_0802BFDC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802BFEE
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #0x18]
	movs r0, #0xc
	b _0802C052
_0802BFEE:
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #6
	b _0802C052
_0802BFF8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802C02C
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802C012
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #0x12
	b _0802C052
_0802C012:
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0802C026
	strh r3, [r2, #0x18]
	movs r0, #0xe
	b _0802C052
_0802C026:
	strh r0, [r2, #0x18]
	movs r0, #4
	b _0802C052
_0802C02C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802C03E
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r2, #0x18]
	movs r0, #8
	b _0802C052
_0802C03E:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802C050
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x18]
	movs r0, #0xa
	b _0802C052
_0802C050:
	movs r0, #0
_0802C052:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802C058
sub_802C058: @ 0x0802C058
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x30]
	adds r0, r4, #0
	bl sub_802BFA8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	bne _0802C078
	b _0802C1BC
_0802C078:
	movs r1, #0x1a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802C082
	rsbs r0, r0, #0
_0802C082:
	movs r2, #0
	mov ip, r2
	movs r7, #0
	adds r0, #0x40
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #2
	cmp r0, r1
	ble _0802C09A
	strh r1, [r4, #0x1a]
_0802C09A:
	ldrh r1, [r4, #0x1c]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0802C0FC
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r3, r4, r5
	ldrb r0, [r3]
	cmp r0, #1
	bne _0802C0B6
	b _0802C236
_0802C0B6:
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802C0F4 @ =gUnknown_080D69C8
	ldrh r0, [r1, #0xc]
	subs r5, #0x16
	adds r2, r4, r5
	strh r0, [r2]
	ldrb r0, [r1, #0xe]
	strb r0, [r3]
	ldr r0, _0802C0F8 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r7, [r0]
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r7, [r0]
	movs r3, #0xa8
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r7, [r0]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	b _0802C150
	.align 2, 0
_0802C0F4: .4byte gUnknown_080D69C8
_0802C0F8: .4byte 0x00000155
_0802C0FC:
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0802C164
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r3, r4, r7
	ldrb r0, [r3]
	cmp r0, #3
	bne _0802C116
	b _0802C236
_0802C116:
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802C15C @ =gUnknown_080D69C8
	ldrh r0, [r1, #0x14]
	subs r7, #0x16
	adds r2, r4, r7
	strh r0, [r2]
	ldrb r0, [r1, #0x16]
	strb r0, [r3]
	ldr r0, _0802C160 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r5, [r0]
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r5, [r0]
	movs r3, #0xa8
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r5, [r0]
	str r5, [r4, #0x10]
	str r5, [r4, #0x14]
_0802C150:
	adds r0, r4, #0
	adds r0, #0x22
	mov r5, ip
	strb r5, [r0]
	b _0802C236
	.align 2, 0
_0802C15C: .4byte gUnknown_080D69C8
_0802C160: .4byte 0x00000155
_0802C164:
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r5, r4, r7
	ldrb r0, [r5]
	cmp r0, #2
	beq _0802C236
	adds r0, r4, #0
	adds r0, #0x23
	mov r1, ip
	strb r1, [r0]
	ldr r1, _0802C1B4 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	subs r7, #0x16
	adds r2, r4, r7
	strh r0, [r2]
	ldrb r0, [r1, #6]
	strb r0, [r5]
	ldr r0, _0802C1B8 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r3, [r0]
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r3, [r0]
	movs r5, #0xa8
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r3, [r0]
	str r3, [r4, #0x10]
	str r3, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	mov r7, ip
	strb r7, [r0]
	b _0802C236
	.align 2, 0
_0802C1B4: .4byte gUnknown_080D69C8
_0802C1B8: .4byte 0x00000155
_0802C1BC:
	ldrh r0, [r4, #0x1a]
	movs r2, #0x1a
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bge _0802C1D2
	adds r0, #0x40
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0802C1E4
	b _0802C1E0
_0802C1D2:
	cmp r1, #0
	ble _0802C1E4
	subs r0, #0x40
	strh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0802C1E4
_0802C1E0:
	strh r6, [r4, #0x1a]
	strh r6, [r4, #0x18]
_0802C1E4:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r5, r4, r3
	ldrb r0, [r5]
	cmp r0, #2
	beq _0802C230
	adds r0, r4, #0
	adds r0, #0x23
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0802C2B4 @ =gUnknown_080D69C8
	ldrh r0, [r2, #4]
	movs r7, #0x9f
	lsls r7, r7, #1
	movs r3, #0
	strh r0, [r7, r4]
	ldrb r0, [r2, #6]
	strb r0, [r5]
	ldr r0, _0802C2B8 @ =0x00000155
	adds r2, r4, r0
	movs r0, #0xff
	strb r0, [r2]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r0, r4, r2
	strh r1, [r0]
	movs r5, #0xa4
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r1, [r0]
	adds r7, #0x12
	adds r0, r4, r7
	strh r1, [r0]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r3, [r0]
_0802C230:
	ldr r0, [r4, #4]
	subs r0, #0x80
	str r0, [r4, #4]
_0802C236:
	ldrh r1, [r4, #0x1e]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802C30C
	ldr r0, _0802C2BC @ =sub_802C358
	str r0, [r4, #0x24]
	movs r0, #0x14
	str r0, [r4, #0xc]
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x82
	orrs r0, r1
	str r0, [r4]
	movs r0, #0x70
	bl m4aSongNumStart
	cmp r6, #0
	beq _0802C2C0
	adds r0, r4, #0
	adds r0, #0x23
	movs r2, #0
	strb r6, [r0]
	ldr r1, _0802C2B4 @ =gUnknown_080D69C8
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	movs r3, #0x9f
	lsls r3, r3, #1
	adds r3, r3, r4
	mov ip, r3
	movs r3, #0
	mov r5, ip
	strh r1, [r5]
	ldrb r1, [r0, #6]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802C2B8 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r2, [r0]
	movs r5, #0xa4
	lsls r5, r5, #1
	adds r0, r4, r5
	strh r2, [r0]
	subs r7, #4
	adds r0, r4, r7
	strh r2, [r0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r3, [r0]
	b _0802C30C
	.align 2, 0
_0802C2B4: .4byte gUnknown_080D69C8
_0802C2B8: .4byte 0x00000155
_0802C2BC: .4byte sub_802C358
_0802C2C0:
	movs r2, #0
	strh r6, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0802C34C @ =gUnknown_080D69C8
	ldrh r1, [r0, #0x24]
	movs r5, #0x9f
	lsls r5, r5, #1
	adds r3, r4, r5
	strh r1, [r3]
	adds r0, #0x26
	ldrb r1, [r0]
	movs r7, #0xaa
	lsls r7, r7, #1
	adds r0, r4, r7
	strb r1, [r0]
	ldr r0, _0802C350 @ =0x00000155
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	strh r6, [r0]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r4, r3
	strh r6, [r0]
	adds r5, #0x12
	adds r0, r4, r5
	strh r6, [r0]
	str r6, [r4, #0x10]
	str r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r2, [r0]
_0802C30C:
	ldr r2, _0802C354 @ =gSineTable
	ldrh r0, [r4, #0x18]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r5, #0x1a
	ldrsh r0, [r4, r5]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldrh r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r2, #0x1a
	ldrsh r0, [r4, r2]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C34C: .4byte gUnknown_080D69C8
_0802C350: .4byte 0x00000155
_0802C354: .4byte gSineTable

	thumb_func_start sub_802C358
sub_802C358: @ 0x0802C358
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r4, r0, #1
	str r4, [r3, #0xc]
	cmp r4, #0
	bne _0802C3CC
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r2, r3, r0
	ldr r0, _0802C410 @ =sub_802C058
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x30]
	adds r0, r3, #0
	adds r0, #0x23
	strb r4, [r0]
	ldr r1, _0802C414 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	movs r2, #0x9f
	lsls r2, r2, #1
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r5, ip
	strh r0, [r5]
	ldrb r1, [r1, #6]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r0, r3, r5
	strb r1, [r0]
	ldr r0, _0802C418 @ =0x00000155
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r3, r1
	strh r4, [r0]
	subs r5, #0xc
	adds r0, r3, r5
	strh r4, [r0]
	adds r1, #0x14
	adds r0, r3, r1
	strh r4, [r0]
	str r4, [r3, #0x10]
	str r4, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x22
	strb r2, [r0]
_0802C3CC:
	ldr r0, [r3, #0xc]
	cmp r0, #8
	bne _0802C41C
	ldr r1, _0802C414 @ =gUnknown_080D69C8
	adds r4, r3, #0
	adds r4, #0x23
	ldrb r0, [r4]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	movs r5, #0x9f
	lsls r5, r5, #1
	adds r2, r3, r5
	strh r0, [r2]
	ldrb r0, [r4]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #6]
	movs r2, #0xaa
	lsls r2, r2, #1
	adds r0, r3, r2
	strb r1, [r0]
	ldr r4, _0802C418 @ =0x00000155
	adds r1, r3, r4
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, #0x81
	rsbs r1, r1, #0
	ands r0, r1
	b _0802C426
	.align 2, 0
_0802C410: .4byte sub_802C058
_0802C414: .4byte gUnknown_080D69C8
_0802C418: .4byte 0x00000155
_0802C41C:
	cmp r0, #8
	ble _0802C428
	ldr r0, [r3]
	movs r1, #0x80
	orrs r0, r1
_0802C426:
	str r0, [r3]
_0802C428:
	ldr r2, _0802C47C @ =gSineTable
	ldr r1, [r3, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #5
	strh r0, [r3, #0x1a]
	ldrh r0, [r3, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r5, #0x1a
	ldrsh r0, [r3, r5]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r4, #0x1a
	ldrsh r0, [r3, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C47C: .4byte gSineTable

	thumb_func_start sub_802C480
sub_802C480: @ 0x0802C480
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r4, r0, #1
	str r4, [r3, #0xc]
	cmp r4, #0
	bne _0802C4E8
	ldr r0, _0802C54C @ =sub_802C058
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r3]
	adds r0, r3, #0
	adds r0, #0x23
	strb r4, [r0]
	ldr r1, _0802C550 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	movs r2, #0x9f
	lsls r2, r2, #1
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r5, ip
	strh r0, [r5]
	ldrb r1, [r1, #6]
	movs r5, #0xaa
	lsls r5, r5, #1
	adds r0, r3, r5
	strb r1, [r0]
	ldr r0, _0802C554 @ =0x00000155
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r3, r1
	strh r4, [r0]
	subs r5, #0xc
	adds r0, r3, r5
	strh r4, [r0]
	adds r1, #0x14
	adds r0, r3, r1
	strh r4, [r0]
	str r4, [r3, #0x10]
	str r4, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x22
	strb r2, [r0]
_0802C4E8:
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r1, r3, r2
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	ldr r2, _0802C558 @ =gSineTable
	ldr r1, [r3, #0xc]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #5
	strh r0, [r3, #0x1a]
	ldrh r0, [r3, #0x18]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	movs r5, #0x1a
	ldrsh r0, [r3, r5]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r4, #0x1a
	ldrsh r0, [r3, r4]
	muls r1, r0, r1
	asrs r1, r1, #0xe
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C54C: .4byte sub_802C058
_0802C550: .4byte gUnknown_080D69C8
_0802C554: .4byte 0x00000155
_0802C558: .4byte gSineTable

	thumb_func_start sub_802C55C
sub_802C55C: @ 0x0802C55C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_802BFA8
	ldr r1, [r7, #0x10]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	asrs r0, r0, #7
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	asrs r0, r0, #7
	str r0, [r7, #0x14]
	ldr r2, [r7, #0xc]
	subs r4, r2, #1
	str r4, [r7, #0xc]
	cmp r4, #0
	bne _0802C5F8
	ldr r0, _0802C5EC @ =sub_802C058
	str r0, [r7, #0x24]
	ldr r0, [r7]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r7]
	adds r0, r7, #0
	adds r0, #0x23
	strb r4, [r0]
	ldr r1, _0802C5F0 @ =gUnknown_080D69C8
	ldrh r0, [r1, #4]
	movs r2, #0x9f
	lsls r2, r2, #1
	adds r3, r7, r2
	movs r2, #0
	strh r0, [r3]
	ldrb r1, [r1, #6]
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r7, r3
	strb r1, [r0]
	ldr r0, _0802C5F4 @ =0x00000155
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r4, [r0]
	subs r3, #0xc
	adds r0, r7, r3
	strh r4, [r0]
	adds r1, #0x14
	adds r0, r7, r1
	strh r4, [r0]
	str r4, [r7, #0x10]
	str r4, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x22
	strb r2, [r0]
	b _0802C64C
	.align 2, 0
_0802C5EC: .4byte sub_802C058
_0802C5F0: .4byte gUnknown_080D69C8
_0802C5F4: .4byte 0x00000155
_0802C5F8:
	ldrh r1, [r7, #0x1e]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0802C64C
	cmp r4, #4
	bgt _0802C60A
	movs r0, #1
	b _0802C60C
_0802C60A:
	subs r0, r2, #5
_0802C60C:
	str r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	ble _0802C64C
	movs r0, #0
	strb r0, [r1]
	ldr r6, _0802C654 @ =gPseudoRandom
	ldr r0, [r6]
	ldr r5, _0802C658 @ =0x00196225
	adds r1, r0, #0
	muls r1, r5, r1
	ldr r3, _0802C65C @ =0x3C6EF35F
	adds r1, r1, r3
	ldr r4, _0802C660 @ =0x00000FFF
	adds r0, r1, #0
	ands r0, r4
	ldr r2, _0802C664 @ =0xFFFFF801
	adds r0, r0, r2
	str r0, [r7, #0x10]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r3
	str r0, [r6]
	ands r0, r4
	adds r0, r0, r2
	str r0, [r7, #0x14]
_0802C64C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C654: .4byte gPseudoRandom
_0802C658: .4byte 0x00196225
_0802C65C: .4byte 0x3C6EF35F
_0802C660: .4byte 0x00000FFF
_0802C664: .4byte 0xFFFFF801

	thumb_func_start sub_802C668
sub_802C668: @ 0x0802C668
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0802C698 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C6A0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r1, #4]
	str r0, [r2]
	ldr r0, [r1, #8]
	str r0, [r3]
	ldr r1, [r1]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0802C6A4
	ldr r0, _0802C69C @ =gPlayer
	str r1, [r0, #0x20]
	b _0802C6AA
	.align 2, 0
_0802C698: .4byte gUnknown_03005B40
_0802C69C: .4byte gPlayer
_0802C6A0:
	str r0, [r2]
	str r0, [r3]
_0802C6A4:
	ldr r1, _0802C6B0 @ =gPlayer
	movs r0, #0x80
	str r0, [r1, #0x20]
_0802C6AA:
	pop {r0}
	bx r0
	.align 2, 0
_0802C6B0: .4byte gPlayer

	thumb_func_start sub_802C6B4
sub_802C6B4: @ 0x0802C6B4
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, _0802C6E0 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C6D8
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802C6D8
	str r3, [r2, #4]
	str r4, [r2, #8]
_0802C6D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6E0: .4byte gUnknown_03005B40

	thumb_func_start sub_802C6E4
sub_802C6E4: @ 0x0802C6E4
	push {lr}
	movs r1, #0
	ldr r0, _0802C700 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C6FA
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
_0802C6FA:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C700: .4byte gUnknown_03005B40

	thumb_func_start sub_802C704
sub_802C704: @ 0x0802C704
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0802C740 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C73A
	ldrh r2, [r0, #6]
	ldr r1, _0802C744 @ =IWRAM_START + 0x128
	adds r0, r2, r1
	ldrb r1, [r0]
	subs r1, r1, r3
	movs r0, #0x1f
	ands r1, r0
	lsls r1, r1, #3
	ldr r3, _0802C748 @ =IWRAM_START + 0x28
	adds r0, r2, r3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _0802C74C @ =IWRAM_START + 0x2C
	adds r2, r2, r0
	adds r2, r2, r1
	ldr r0, [r2]
	str r0, [r5]
_0802C73A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C740: .4byte gUnknown_03005B40
_0802C744: .4byte IWRAM_START + 0x128
_0802C748: .4byte IWRAM_START + 0x28
_0802C74C: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_802C750
sub_802C750: @ 0x0802C750
	push {lr}
	movs r1, #0
	ldr r0, _0802C768 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C762
	ldrh r0, [r0, #6]
	ldr r2, _0802C76C @ =IWRAM_START + 0x134
	adds r1, r0, r2
_0802C762:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C768: .4byte gUnknown_03005B40
_0802C76C: .4byte IWRAM_START + 0x134

	thumb_func_start sub_802C770
sub_802C770: @ 0x0802C770
	push {lr}
	movs r1, #0
	ldr r0, _0802C790 @ =gUnknown_03005B40
	ldr r0, [r0]
	cmp r0, #0
	beq _0802C78A
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	ldr r1, _0802C794 @ =0x000003FF
	ands r1, r0
_0802C78A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802C790: .4byte gUnknown_03005B40
_0802C794: .4byte 0x000003FF

	thumb_func_start sub_802C798
sub_802C798: @ 0x0802C798
	push {r4, lr}
	ldr r0, _0802C7E0 @ =gUnknown_03005B40
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	bl sub_8050BB0
	cmp r0, #1
	beq _0802C7DA
	ldr r1, [r4]
	movs r2, #0x10
	ands r2, r1
	cmp r2, #0
	bne _0802C7DA
	ldr r0, _0802C7E4 @ =sub_802C92C
	str r0, [r4, #0x24]
	movs r0, #0x14
	str r0, [r4, #0xc]
	strh r2, [r4, #0x18]
	subs r0, #0x16
	ands r1, r0
	subs r0, #1
	ands r1, r0
	subs r0, #6
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	movs r0, #0x80
	orrs r1, r0
	str r1, [r4]
_0802C7DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C7E0: .4byte gUnknown_03005B40
_0802C7E4: .4byte sub_802C92C

	thumb_func_start sub_802C7E8
sub_802C7E8: @ 0x0802C7E8
	push {r4, lr}
	ldr r0, _0802C820 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802BCCC
	ldr r0, [r4, #0x24]
	ldr r1, _0802C824 @ =sub_802C8A0
	cmp r0, r1
	beq _0802C806
	str r1, [r4, #0x24]
_0802C806:
	ldr r1, [r4, #0x24]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_802C9B0
	adds r0, r4, #0
	bl sub_802BE1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C820: .4byte gCurTask
_0802C824: .4byte sub_802C8A0

	thumb_func_start sub_802C828
sub_802C828: @ 0x0802C828
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802C894 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802C88C
	ldr r0, [r5, #0xc]
	subs r0, #1
	str r0, [r5, #0xc]
	cmp r0, #0
	bne _0802C856
	ldr r0, _0802C898 @ =sub_802C058
	str r0, [r5, #0x24]
	ldr r0, [r5]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	str r0, [r5]
_0802C856:
	ldr r0, _0802C89C @ =gCamera
	ldr r1, [r0]
	adds r1, #0x50
	lsls r1, r1, #8
	ldr r4, [r0, #4]
	adds r4, #0x5a
	lsls r4, r4, #8
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #4]
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r5, #8]
	subs r4, r4, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #8]
	adds r1, r1, r0
	str r1, [r5, #8]
_0802C88C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C894: .4byte gUnknown_03005424
_0802C898: .4byte sub_802C058
_0802C89C: .4byte gCamera

	thumb_func_start sub_802C8A0
sub_802C8A0: @ 0x0802C8A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5]
	ldr r1, _0802C8E8 @ =gCamera
	ldr r0, [r1]
	movs r2, #0x9e
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #8
	ldr r4, [r1, #4]
	adds r4, #0x50
	lsls r4, r4, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #4]
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r5, #8]
	subs r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x64
	bl Div
	ldr r1, [r5, #8]
	adds r1, r1, r0
	str r1, [r5, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8E8: .4byte gCamera

	thumb_func_start sub_802C8EC
sub_802C8EC: @ 0x0802C8EC
	push {lr}
	adds r2, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	ldrh r0, [r2, #0x1a]
	adds r0, #0x20
	strh r0, [r2, #0x1a]
	movs r0, #0x1a
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, _0802C924 @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	cmp r0, #0xa0
	ble _0802C920
	ldr r0, _0802C928 @ =0x00000129
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
_0802C920:
	pop {r0}
	bx r0
	.align 2, 0
_0802C924: .4byte gCamera
_0802C928: .4byte 0x00000129

	thumb_func_start sub_802C92C
sub_802C92C: @ 0x0802C92C
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	subs r0, #1
	str r0, [r3, #0xc]
	cmp r0, #0
	bne _0802C94A
	ldr r0, _0802C980 @ =sub_802C988
	str r0, [r3, #0x24]
	ldr r0, [r3]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x64
	str r0, [r3, #0xc]
_0802C94A:
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3, #0x1a]
	ldr r2, _0802C984 @ =gSineTable
	ldrh r0, [r3, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	asrs r1, r1, #6
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r3, #4]
	ldrh r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	asrs r1, r1, #6
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C980: .4byte sub_802C988
_0802C984: .4byte gSineTable

	thumb_func_start sub_802C988
sub_802C988: @ 0x0802C988
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	subs r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0
	bne _0802C9A8
	ldr r0, [r2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _0802C9AC @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r2]
	bl sub_802BA8C
_0802C9A8:
	pop {r0}
	bx r0
	.align 2, 0
_0802C9AC: .4byte 0xFFFFFDFF

	thumb_func_start sub_802C9B0
sub_802C9B0: @ 0x0802C9B0
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0802C9D6
	ldr r1, [r2, #8]
	ldr r0, _0802C9DC @ =0x000031FF
	cmp r1, r0
	bgt _0802C9CA
	adds r0, #1
	str r0, [r2, #8]
_0802C9CA:
	ldr r0, [r2, #8]
	movs r1, #0xfe
	lsls r1, r1, #8
	cmp r0, r1
	ble _0802C9D6
	str r1, [r2, #8]
_0802C9D6:
	pop {r0}
	bx r0
	.align 2, 0
_0802C9DC: .4byte 0x000031FF

	thumb_func_start sub_802C9E0
sub_802C9E0: @ 0x0802C9E0
	movs r0, #0
	bx lr

	thumb_func_start sub_802C9E4
sub_802C9E4: @ 0x0802C9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0802CA40 @ =sub_802CCE0
	movs r1, #0xbc
	lsls r1, r1, #2
	ldr r2, _0802CA44 @ =0x00002102
	ldr r3, _0802CA48 @ =sub_802D25C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _0802CA4C @ =gUnknown_03005B44
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	movs r5, #0
	movs r6, #0
	adds r0, #0xb2
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0802CA50 @ =gUnknown_080D6A80
	mov sb, r2
	ldr r7, _0802CA54 @ =IWRAM_START + 0x94
	adds r4, r1, r7
	mov sl, r6
	ldr r0, _0802CA58 @ =IWRAM_START + 0x90
	adds r0, r1, r0
	str r0, [sp, #0xc]
_0802CA28:
	strh r6, [r4, #0x12]
	strh r6, [r4, #0x14]
	cmp r5, #0
	bne _0802CA5C
	movs r0, #0x18
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r4]
	ldr r3, [sp, #8]
	b _0802CA68
	.align 2, 0
_0802CA40: .4byte sub_802CCE0
_0802CA44: .4byte 0x00002102
_0802CA48: .4byte sub_802D25C
_0802CA4C: .4byte gUnknown_03005B44
_0802CA50: .4byte gUnknown_080D6A80
_0802CA54: .4byte IWRAM_START + 0x94
_0802CA58: .4byte IWRAM_START + 0x90
_0802CA5C:
	adds r0, r3, #0
	adds r0, #0x94
	lsls r1, r5, #6
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4]
_0802CA68:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r2, r3, r1
	add r2, sl
	ldr r0, [r4]
	ldr r7, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r7
	lsrs r0, r0, #5
	ldr r1, _0802CCAC @ =0x000003FF
	ands r0, r1
	movs r7, #0xc0
	lsls r7, r7, #7
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2]
	strh r6, [r4, #0x16]
	strh r6, [r4, #4]
	mov r1, sb
	ldrh r0, [r1]
	strh r0, [r4, #6]
	ldrh r0, [r1, #2]
	strb r0, [r4, #0x1c]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x18]
	movs r7, #1
	rsbs r7, r7, #0
	mov r2, sp
	strb r7, [r2, #4]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	mov r1, r8
	strb r6, [r1, #3]
	adds r2, r7, #0
	str r2, [r4, #0x24]
	movs r0, #0x80
	lsls r0, r0, #0xb
	str r0, [r4, #0xc]
	cmp r5, #0xb
	beq _0802CAC4
	ldr r0, [sp, #0xc]
	str r3, [sp, #8]
	bl sub_8004558
	ldr r3, [sp, #8]
_0802CAC4:
	movs r7, #0x30
	add r8, r7
	movs r0, #4
	add sb, r0
	adds r4, #0x30
	movs r1, #2
	add sl, r1
	ldr r2, [sp, #0xc]
	adds r2, #0x30
	str r2, [sp, #0xc]
	adds r5, #1
	cmp r5, #0xb
	bls _0802CA28
	ldr r4, _0802CCB0 @ =gGameMode
	mov sb, r4
	ldrb r0, [r4]
	cmp r0, #2
	bhi _0802CBA4
	adds r7, r3, #0
	adds r7, #0x60
	movs r5, #0
	mov r8, r5
	movs r6, #0
	movs r0, #6
	strh r0, [r7, #0x16]
	movs r0, #0x8e
	strh r0, [r7, #0x18]
	ldr r4, _0802CCB4 @ =gUnknown_080D6AB0
	ldr r5, _0802CCB8 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldr r2, _0802CCAC @ =0x000003FF
	ands r0, r2
	ldr r3, [sp, #8]
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r2, r3, r1
	strh r0, [r2]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x80
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r3, #0
	adds r1, #0x81
	ldrb r0, [r1]
	mov r4, sp
	ldrb r4, [r4, #4]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x82
	movs r5, #0x10
	strb r5, [r0]
	adds r1, #4
	mov r0, r8
	strb r0, [r1]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	mov r5, sb
	ldrb r0, [r5]
	cmp r0, #2
	bls _0802CB9A
	ldr r0, _0802CCBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
	lsls r0, r0, #0xc
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0802CB9A:
	adds r0, r7, #0
	str r3, [sp, #8]
	bl sub_8004558
	ldr r3, [sp, #8]
_0802CBA4:
	adds r7, r3, #0
	adds r7, #0x30
	movs r4, #0
	strh r4, [r7, #0x16]
	movs r0, #1
	strh r0, [r7, #0x18]
	movs r0, #0x20
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldr r2, _0802CCAC @ =0x000003FF
	mov sl, r2
	mov r5, sl
	ands r0, r5
	ldr r3, [sp, #8]
	ldr r2, _0802CCC0 @ =0x000002D6
	adds r1, r3, r2
	movs r5, #0xc0
	lsls r5, r5, #7
	mov sb, r5
	movs r5, #0
	mov r2, sb
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _0802CCC4 @ =0x00000466
	strh r0, [r7, #0xa]
	adds r0, r3, #0
	adds r0, #0x50
	strb r5, [r0]
	movs r0, #0xc0
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r3, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x52
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #8]
	bl sub_8004558
	movs r0, #7
	ldr r3, [sp, #8]
	strh r0, [r3, #0x16]
	movs r0, #9
	strh r0, [r3, #0x18]
	movs r0, #4
	str r3, [sp, #8]
	bl VramMalloc
	ldr r3, [sp, #8]
	str r0, [r3, #4]
	ldr r7, _0802CCA8 @ =0xF9FF0000
	adds r0, r0, r7
	lsrs r0, r0, #5
	mov r1, sl
	ands r0, r1
	ldr r2, _0802CCC8 @ =0x000002D2
	adds r1, r3, r2
	mov r7, sb
	orrs r0, r7
	strh r0, [r1]
	ldr r0, _0802CCCC @ =0x00000467
	strh r0, [r3, #0xa]
	adds r0, r3, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r3, #0x1a]
	strh r4, [r3, #8]
	strh r4, [r3, #0x14]
	strh r4, [r3, #0x1c]
	adds r1, r3, #0
	adds r1, #0x21
	adds r0, r6, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x22
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	strb r5, [r0]
	str r6, [r3, #0x28]
	str r4, [r3, #0x10]
	subs r2, #2
	adds r0, r3, r2
	strh r4, [r0]
	movs r5, #0
	ldr r0, _0802CCD0 @ =gObjPalette
	ldr r2, _0802CCD4 @ =gUnknown_080D6ACE
	adds r1, r0, #0
	adds r1, #0xe0
_0802CC7C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xf
	bls _0802CC7C
	ldr r2, _0802CCD8 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
	ldr r0, _0802CCDC @ =gUnknown_03005B44
	ldr r0, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802CCA8: .4byte 0xF9FF0000
_0802CCAC: .4byte 0x000003FF
_0802CCB0: .4byte gGameMode
_0802CCB4: .4byte gUnknown_080D6AB0
_0802CCB8: .4byte gSelectedCharacter
_0802CCBC: .4byte 0x04000128
_0802CCC0: .4byte 0x000002D6
_0802CCC4: .4byte 0x00000466
_0802CCC8: .4byte 0x000002D2
_0802CCCC: .4byte 0x00000467
_0802CCD0: .4byte gObjPalette
_0802CCD4: .4byte gUnknown_080D6ACE
_0802CCD8: .4byte gFlags
_0802CCDC: .4byte gUnknown_03005B44

	thumb_func_start sub_802CCE0
sub_802CCE0: @ 0x0802CCE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0802CD34 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0802CCFC
	b _0802D138
_0802CCFC:
	ldr r0, _0802CD38 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _0802CD3C @ =IWRAM_START + 0x90
	adds r0, r2, r0
	str r0, [sp]
	ldr r0, _0802CD40 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802CD1A
	b _0802CE6A
_0802CD1A:
	ldr r0, _0802CD44 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0802CD74
	ldr r1, _0802CD48 @ =IWRAM_START + 0x2A0
	adds r7, r2, r1
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0
	b _0802CD6C
	.align 2, 0
_0802CD34: .4byte gUnknown_03005424
_0802CD38: .4byte gCurTask
_0802CD3C: .4byte IWRAM_START + 0x90
_0802CD40: .4byte gGameMode
_0802CD44: .4byte gCurrentLevel
_0802CD48: .4byte IWRAM_START + 0x2A0
_0802CD4C:
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x1f
	strh r0, [r3]
	lsls r0, r7, #3
	adds r0, #4
	strh r0, [r3, #2]
	ldr r0, _0802CE18 @ =0x000002EE
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0802CD6C:
	ldr r0, _0802CE1C @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r7, r0
	blo _0802CD4C
_0802CD74:
	ldr r0, _0802CE20 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0802CD9A
	ldr r0, _0802CE24 @ =gUnknown_03005490
	ldr r1, [r0]
	ldr r0, _0802CE28 @ =0x000087EF
	cmp r1, r0
	bls _0802CD9A
	adds r0, r1, #0
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _0802CD9A
	movs r0, #0x8b
	bl m4aSongNumStart
_0802CD9A:
	ldr r0, _0802CE2C @ =gUnknown_03005450
	ldr r6, [r0]
	ldr r0, _0802CE30 @ =0x000F423F
	cmp r6, r0
	ble _0802CDA6
	adds r6, r0, #0
_0802CDA6:
	movs r7, #0
	ldr r2, _0802CE34 @ =0x0000800E
	mov r8, r2
_0802CDAC:
	ldr r1, _0802CE38 @ =gUnknown_080D6AF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl Div
	adds r4, r0, #0
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r3]
	lsls r0, r7, #3
	adds r0, #0x1c
	strh r0, [r3, #2]
	lsls r1, r4, #1
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #4]
	adds r0, r4, #0
	muls r0, r5, r0
	subs r6, r6, r0
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #5
	bls _0802CDAC
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x8e
	strh r0, [r3]
	ldr r0, _0802CE3C @ =0x00004006
	strh r0, [r3, #2]
	movs r0, #0xb5
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	ldr r1, _0802CE40 @ =gNumLives
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802CE44
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	b _0802CE46
	.align 2, 0
_0802CE18: .4byte 0x000002EE
_0802CE1C: .4byte gUnknown_030054F4
_0802CE20: .4byte gLoadedSaveGame
_0802CE24: .4byte gUnknown_03005490
_0802CE28: .4byte 0x000087EF
_0802CE2C: .4byte gUnknown_03005450
_0802CE30: .4byte 0x000F423F
_0802CE34: .4byte 0x0000800E
_0802CE38: .4byte gUnknown_080D6AF0
_0802CE3C: .4byte 0x00004006
_0802CE40: .4byte gNumLives
_0802CE44:
	movs r7, #0
_0802CE46:
	cmp r7, #9
	bls _0802CE4C
	movs r7, #9
_0802CE4C:
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0802CF04 @ =0x0000808C
	strh r0, [r3]
	movs r0, #0x1e
	strh r0, [r3, #2]
	lsls r1, r7, #1
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sb
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #4]
_0802CE6A:
	movs r0, #4
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r3]
	ldr r0, _0802CF08 @ =0x0000C1FD
	strh r0, [r3, #2]
	ldr r0, _0802CF0C @ =0x000002D6
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r2, #0xb4
	lsls r2, r2, #2
	add r2, sb
	ldr r0, _0802CF10 @ =gPlayer
	ldrh r0, [r0, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r0, #0x40
	ldrh r1, [r2]
	adds r0, r0, r1
	ldr r1, _0802CF14 @ =0x000007FF
	ands r0, r1
	strh r0, [r2]
	lsrs r0, r0, #8
	mov r1, sb
	adds r1, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	bl sub_8004558
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r0, #8
	strh r0, [r3]
	ldr r0, _0802CF18 @ =0x00004007
	strh r0, [r3, #2]
	ldr r0, _0802CF1C @ =0x000002D2
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r3, #4]
	ldr r0, _0802CF20 @ =gCourseTime
	ldrh r1, [r0]
	ldr r0, _0802CF24 @ =0x000003E7
	cmp r1, r0
	bls _0802CF28
	ldr r2, [sp]
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r7, r2, r0
	movs r4, #0x10
	strh r4, [r7, #0x18]
	movs r0, #0x20
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	strh r4, [r7, #0x18]
	movs r0, #0x28
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	strh r4, [r7, #0x18]
	movs r0, #0x30
	strh r0, [r7, #0x16]
	adds r0, r7, #0
	bl sub_80051E8
	b _0802CFDC
	.align 2, 0
_0802CF04: .4byte 0x0000808C
_0802CF08: .4byte 0x0000C1FD
_0802CF0C: .4byte 0x000002D6
_0802CF10: .4byte gPlayer
_0802CF14: .4byte 0x000007FF
_0802CF18: .4byte 0x00004007
_0802CF1C: .4byte 0x000002D2
_0802CF20: .4byte gCourseTime
_0802CF24: .4byte 0x000003E7
_0802CF28:
	movs r2, #0
	mov sl, r2
	cmp r1, #0
	bne _0802CF42
	ldr r0, _0802D148 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802CF42
	movs r0, #0xe0
	lsls r0, r0, #7
	mov sl, r0
_0802CF42:
	ldr r7, _0802D14C @ =gCourseTime
	ldrh r0, [r7]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #8
	mov r8, r1
	mov r2, r8
	strh r2, [r3]
	movs r0, #0x1c
	strh r0, [r3, #2]
	lsls r0, r4, #1
	movs r6, #0xb6
	lsls r6, r6, #2
	add r6, sb
	adds r0, r6, r0
	ldrh r1, [r0]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #0x64
	adds r5, r4, #0
	muls r5, r0, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r0, [r7]
	subs r0, r0, r5
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r3]
	movs r0, #0x24
	strh r0, [r3, #2]
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r1, [r0]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r5, r5, r0
	ldrh r4, [r7]
	subs r4, r4, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	mov r1, r8
	strh r1, [r3]
	movs r0, #0x2c
	strh r0, [r3, #2]
	lsls r4, r4, #1
	adds r6, r6, r4
	ldrh r0, [r6]
	mov r2, sl
	orrs r2, r0
	strh r2, [r3, #4]
_0802CFDC:
	ldr r7, _0802D150 @ =gUnknown_03005490
	ldr r0, _0802D154 @ =0x00008C9F
	ldr r6, [r7]
	cmp r6, r0
	bls _0802CFE8
	adds r6, r0, #0
_0802CFE8:
	ldr r0, _0802D158 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802CFF8
	b _0802D138
_0802CFF8:
	movs r0, #0xc0
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	movs r5, #0x80
	lsls r5, r5, #8
	strh r5, [r3]
	movs r0, #0x63
	strh r0, [r3, #2]
	movs r4, #0xbb
	lsls r4, r4, #2
	add r4, sb
	ldrh r1, [r4]
	mov r0, sl
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #3
	bl sub_80058B4
	adds r3, r0, #0
	strh r5, [r3]
	movs r0, #0x7b
	strh r0, [r3, #2]
	ldrh r0, [r4]
	mov r1, sl
	orrs r1, r0
	strh r1, [r3, #4]
	adds r0, r6, #0
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	movs r1, #0x3c
	bl Div
	str r0, [sp, #4]
	ldr r1, _0802D15C @ =gUnknown_080D6BF8
	adds r2, r0, #0
	lsls r2, r2, #1
	mov sb, r2
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #1
	mov r8, r4
	add r1, r8
	movs r0, #0
	ldrsh r1, [r1, r0]
	subs r1, r6, r1
	ldr r0, _0802D160 @ =gUnknown_080D6C72
	add r0, sb
	ldrh r0, [r0]
	subs r5, r1, r0
	ldr r1, [r7]
	ldr r0, _0802D164 @ =0x00007E90
	movs r2, #0
	mov sl, r2
	cmp r1, r0
	bls _0802D084
	ldr r0, _0802D148 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sl, r0
_0802D084:
	ldr r4, _0802D168 @ =gMillisUnpackTable
	lsls r5, r5, #1
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [sp]
	adds r7, r1, r0
	movs r0, #0x88
	strh r0, [r7, #0x16]
	movs r6, #0x10
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	adds r5, r5, r4
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r1, [sp]
	adds r7, r1, r0
	movs r0, #0x90
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r4, _0802D16C @ =gSecondsTable
	mov r1, r8
	adds r0, r1, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x70
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	add r4, r8
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x78
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [sp, #4]
	add r0, sb
	lsls r0, r0, #4
	ldr r2, [sp]
	adds r7, r2, r0
	movs r0, #0x60
	strh r0, [r7, #0x16]
	strh r6, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_80051E8
_0802D138:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D148: .4byte gUnknown_03005590
_0802D14C: .4byte gCourseTime
_0802D150: .4byte gUnknown_03005490
_0802D154: .4byte 0x00008C9F
_0802D158: .4byte gUnknown_03005424
_0802D15C: .4byte gUnknown_080D6BF8
_0802D160: .4byte gUnknown_080D6C72
_0802D164: .4byte 0x00007E90
_0802D168: .4byte gMillisUnpackTable
_0802D16C: .4byte gSecondsTable

	thumb_func_start sub_802D170
sub_802D170: @ 0x0802D170
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _0802D1A8 @ =gUnknown_03005B44
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D1AC @ =IWRAM_START + 0x90
	adds r2, r2, r0
	mov sb, r2
	movs r0, #0xa
	mov r8, r0
	movs r7, #1
	cmp r4, #9
	bhi _0802D1B0
	movs r6, #1
	b _0802D1F2
	.align 2, 0
_0802D1A8: .4byte gUnknown_03005B44
_0802D1AC: .4byte IWRAM_START + 0x90
_0802D1B0:
	cmp r4, #0x63
	bhi _0802D1B8
	movs r6, #2
	b _0802D1F2
_0802D1B8:
	ldr r0, _0802D1C4 @ =0x000003E7
	cmp r4, r0
	bhi _0802D1C8
	movs r6, #3
	b _0802D1F2
	.align 2, 0
_0802D1C4: .4byte 0x000003E7
_0802D1C8:
	ldr r0, _0802D1D4 @ =0x0000270F
	cmp r4, r0
	bhi _0802D1D8
	movs r6, #4
	b _0802D1F2
	.align 2, 0
_0802D1D4: .4byte 0x0000270F
_0802D1D8:
	ldr r0, _0802D1E4 @ =0x0001869F
	cmp r4, r0
	bhi _0802D1E8
	movs r6, #5
	b _0802D1F2
	.align 2, 0
_0802D1E4: .4byte 0x0001869F
_0802D1E8:
	ldr r0, _0802D258 @ =0x000F423F
	movs r6, #7
	cmp r4, r0
	bhi _0802D1F2
	movs r6, #6
_0802D1F2:
	cmp r7, #0
	beq _0802D246
	cmp r6, #0
	beq _0802D246
	adds r5, r1, #0
_0802D1FC:
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r7, r0, #0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	add r0, sb
	mov r2, r8
	muls r2, r7, r2
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r5, [r0, #0x16]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, #0x18]
	adds r1, r0, #0
	adds r1, #0x25
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r0, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x10]
	bl sub_80051E8
	adds r4, r7, #0
	subs r5, #8
	subs r6, #1
	cmp r4, #0
	beq _0802D246
	cmp r6, #0
	bne _0802D1FC
_0802D246:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D258: .4byte 0x000F423F

	thumb_func_start sub_802D25C
sub_802D25C: @ 0x0802D25C
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	ldr r0, _0802D290 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802D280
	ldr r0, [r4, #0x64]
	bl VramFree
_0802D280:
	ldr r1, _0802D294 @ =IWRAM_START + 0x94
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D290: .4byte gGameMode
_0802D294: .4byte IWRAM_START + 0x94

	thumb_func_start sub_802D298
sub_802D298: @ 0x0802D298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0802D2E4 @ =sub_802D4B4
	movs r1, #0x8d
	lsls r1, r1, #5
	movs r2, #0xe1
	lsls r2, r2, #8
	ldr r3, _0802D2E8 @ =sub_802D4B8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	movs r6, #0
	movs r5, #0
	ldr r0, _0802D2EC @ =IWRAM_START + 0x22
	adds r7, r1, r0
	ldr r2, _0802D2F0 @ =IWRAM_START+4
	adds r4, r1, r2
	ldr r0, _0802D2F4 @ =0x0000045F
	mov sl, r0
_0802D2D4:
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	cmp r6, #0
	bne _0802D2F8
	movs r0, #0xbc
	bl VramMalloc
	b _0802D300
	.align 2, 0
_0802D2E4: .4byte sub_802D4B4
_0802D2E8: .4byte sub_802D4B8
_0802D2EC: .4byte IWRAM_START + 0x22
_0802D2F0: .4byte IWRAM_START+4
_0802D2F4: .4byte 0x0000045F
_0802D2F8:
	lsls r1, r6, #6
	mov r2, sb
	ldr r0, [r2, #4]
	adds r0, r0, r1
_0802D300:
	str r0, [r4]
	strh r5, [r4, #0x16]
	strh r5, [r4, #4]
	mov r0, sl
	strh r0, [r4, #6]
	adds r1, r6, #1
	strb r1, [r4, #0x1c]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x18]
	movs r0, #0xff
	strb r0, [r4, #0x1d]
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	strb r5, [r7, #3]
	subs r0, #0x11
	str r0, [r4, #0x24]
	str r5, [r4, #0xc]
	adds r7, #0x30
	adds r4, #0x30
	adds r6, r1, #0
	cmp r6, #0x5d
	bls _0802D2D4
	ldr r0, _0802D344 @ =gUnknown_03005B48
	mov r1, r8
	str r1, [r0]
	mov r0, r8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D344: .4byte gUnknown_03005B48

	thumb_func_start sub_802D348
sub_802D348: @ 0x0802D348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	ldr r0, _0802D37C @ =gUnknown_03005B48
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0802D380 @ =IWRAM_START + 0x2D0
	adds r2, r2, r0
	mov sl, r2
	movs r0, #0xa
	mov sb, r0
	movs r2, #1
	mov r8, r2
	cmp r5, #9
	bhi _0802D384
	movs r7, #1
	b _0802D3C6
	.align 2, 0
_0802D37C: .4byte gUnknown_03005B48
_0802D380: .4byte IWRAM_START + 0x2D0
_0802D384:
	cmp r5, #0x63
	bhi _0802D38C
	movs r7, #2
	b _0802D3C6
_0802D38C:
	ldr r0, _0802D398 @ =0x000003E7
	cmp r5, r0
	bhi _0802D39C
	movs r7, #3
	b _0802D3C6
	.align 2, 0
_0802D398: .4byte 0x000003E7
_0802D39C:
	ldr r0, _0802D3A8 @ =0x0000270F
	cmp r5, r0
	bhi _0802D3AC
	movs r7, #4
	b _0802D3C6
	.align 2, 0
_0802D3A8: .4byte 0x0000270F
_0802D3AC:
	ldr r0, _0802D3B8 @ =0x0001869F
	cmp r5, r0
	bhi _0802D3BC
	movs r7, #5
	b _0802D3C6
	.align 2, 0
_0802D3B8: .4byte 0x0001869F
_0802D3BC:
	ldr r0, _0802D430 @ =0x000F423F
	movs r7, #7
	cmp r5, r0
	bhi _0802D3C6
	movs r7, #6
_0802D3C6:
	mov r0, r8
	cmp r0, #0
	beq _0802D41E
	cmp r7, #0
	beq _0802D41E
	adds r6, r1, #0
_0802D3D2:
	adds r0, r5, #0
	mov r1, sb
	bl Div
	mov r8, r0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	add r4, sl
	mov r2, sb
	mov r1, r8
	muls r1, r2, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	subs r4, r4, r0
	strh r6, [r4, #0x16]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	mov r5, r8
	subs r6, #8
	subs r7, #1
	cmp r5, #0
	beq _0802D41E
	cmp r7, #0
	bne _0802D3D2
_0802D41E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D430: .4byte 0x000F423F

	thumb_func_start sub_802D434
sub_802D434: @ 0x0802D434
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _0802D4AC @ =gUnknown_03005B48
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0802D4B0 @ =0x2FFF9D0
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	ldrb r0, [r7]
	cmp r0, #0
	beq _0802D4A0
_0802D45C:
	adds r1, r7, r5
	ldrb r0, [r1]
	cmp r0, #0x20
	bls _0802D488
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #4
	add r4, r8
	strh r6, [r4, #0x16]
	mov r0, sb
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
_0802D488:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xc
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802D45C
_0802D4A0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4AC: .4byte gUnknown_03005B48
_0802D4B0: .4byte 0x2FFF9D0

	thumb_func_start sub_802D4B4
sub_802D4B4: @ 0x0802D4B4
	bx lr
	.align 2, 0

	thumb_func_start sub_802D4B8
sub_802D4B8: @ 0x0802D4B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_802D4CC
sub_802D4CC: @ 0x0802D4CC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D504
	ldr r2, _0802D4FC @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D500 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D520
	.align 2, 0
_0802D4FC: .4byte gDispCnt
_0802D500: .4byte gWinRegs
_0802D504:
	ldr r2, _0802D54C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D550 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D520:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D554 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D558
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D562
	.align 2, 0
_0802D54C: .4byte gDispCnt
_0802D550: .4byte gWinRegs
_0802D554: .4byte gBldRegs
_0802D558:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D562:
	strh r0, [r2, #4]
	ldrh r4, [r3, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D572
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D572:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r3, #6]
	adds r0, r4, r0
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	ldr r1, _0802D58C @ =0x1FFF0000
	cmp r0, r1
	bgt _0802D590
	movs r0, #0
	b _0802D598
	.align 2, 0
_0802D58C: .4byte 0x1FFF0000
_0802D590:
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #4]
	movs r0, #1
_0802D598:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_802D5A0
sub_802D5A0: @ 0x0802D5A0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _0802D5D8
	ldr r2, _0802D5D0 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D5D4 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1, #2]
	movs r0, #0xa0
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	movs r4, #0xfc
	lsls r4, r4, #6
	adds r0, r4, #0
	b _0802D5F4
	.align 2, 0
_0802D5D0: .4byte gDispCnt
_0802D5D4: .4byte gWinRegs
_0802D5D8:
	ldr r2, _0802D620 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0802D624 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #0xa0
	strh r0, [r1, #4]
	ldrh r2, [r1, #8]
	movs r0, #0x3f
_0802D5F4:
	orrs r0, r2
	strh r0, [r1, #8]
	ldrh r2, [r1, #0xa]
	movs r0, #0x1f
	orrs r0, r2
	strh r0, [r1, #0xa]
	ldr r1, _0802D628 @ =gBldRegs
	ldrh r0, [r3, #8]
	strh r0, [r1]
	ldrh r0, [r3, #0xa]
	strh r0, [r1, #2]
	ldrh r2, [r3, #2]
	movs r0, #1
	ands r0, r2
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D62C
	ldrh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	b _0802D636
	.align 2, 0
_0802D620: .4byte gDispCnt
_0802D624: .4byte gWinRegs
_0802D628: .4byte gBldRegs
_0802D62C:
	ldrh r1, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r0, #0x20
	subs r0, r0, r1
_0802D636:
	strh r0, [r2, #4]
	adds r1, r2, #0
	ldrh r0, [r1, #4]
	cmp r0, #0x1f
	bls _0802D644
	movs r0, #0x20
	strh r0, [r1, #4]
_0802D644:
	ldrh r0, [r2, #4]
	lsrs r0, r0, #1
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_802D650
sub_802D650: @ 0x0802D650
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D6E4 @ =sub_802D6FC
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x3c
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #0x90
	lsls r0, r0, #2
	strh r0, [r1, #0x38]
	ldr r0, _0802D6E8 @ =IWRAM_START + 0x3A
	adds r2, r3, r0
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D6EC @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D6F0 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D6F4 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D6F8 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D6E4: .4byte sub_802D6FC
_0802D6E8: .4byte IWRAM_START + 0x3A
_0802D6EC: .4byte 0x06010000
_0802D6F0: .4byte IWRAM_START + 0x20
_0802D6F4: .4byte IWRAM_START + 0x21
_0802D6F8: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D6FC
sub_802D6FC: @ 0x0802D6FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802D738 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r7, r6, #0
	ldr r5, [r6, #0x30]
	ldr r0, [r6, #0x34]
	mov r8, r0
	ldr r0, _0802D73C @ =IWRAM_START + 0x3A
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0802D740
	ldrh r0, [r6, #0x38]
	adds r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x12
	cmp r0, r1
	ble _0802D752
	movs r0, #0
	b _0802D750
	.align 2, 0
_0802D738: .4byte gCurTask
_0802D73C: .4byte IWRAM_START + 0x3A
_0802D740:
	ldrh r0, [r6, #0x38]
	subs r0, #6
	strh r0, [r6, #0x38]
	lsls r0, r0, #0x10
	ldr r1, _0802D7D0 @ =0x01FF0000
	cmp r0, r1
	bgt _0802D752
	movs r0, #1
_0802D750:
	strb r0, [r2]
_0802D752:
	ldr r1, _0802D7D4 @ =gSineTable
	mov sb, r1
	ldrh r1, [r7, #0x38]
	ldr r4, _0802D7D8 @ =0x000003FF
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #3
	adds r5, r5, r0
	ldrh r0, [r7, #0x38]
	ands r4, r0
	lsls r4, r4, #1
	add r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0x14
	bl Div
	asrs r0, r0, #1
	add r8, r0
	str r5, [r7, #0x30]
	mov r0, r8
	str r0, [r7, #0x34]
	asrs r0, r5, #8
	ldr r3, _0802D7DC @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	mov r1, r8
	asrs r2, r1, #8
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r6, #0x18]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0802D7C4
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D7C4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D7E4
_0802D7C4:
	ldr r0, _0802D7E0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D7F0
	.align 2, 0
_0802D7D0: .4byte 0x01FF0000
_0802D7D4: .4byte gSineTable
_0802D7D8: .4byte 0x000003FF
_0802D7DC: .4byte gCamera
_0802D7E0: .4byte gCurTask
_0802D7E4:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0802D7F0:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802D7FC
sub_802D7FC: @ 0x0802D7FC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802D89C @ =sub_802D8B8
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	movs r0, #1
	strh r0, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r2, _0802D8A0 @ =IWRAM_START + 0x3C
	adds r0, r3, r2
	strb r6, [r0]
	ldr r0, _0802D8A4 @ =IWRAM_START + 0x3D
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802D8A8 @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802D8AC @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802D8B0 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802D8B4 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D89C: .4byte sub_802D8B8
_0802D8A0: .4byte IWRAM_START + 0x3C
_0802D8A4: .4byte IWRAM_START + 0x3D
_0802D8A8: .4byte 0x06010000
_0802D8AC: .4byte IWRAM_START + 0x20
_0802D8B0: .4byte IWRAM_START + 0x21
_0802D8B4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802D8B8
sub_802D8B8: @ 0x0802D8B8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802D8F8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r5, r0, r1
	str r5, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802D8FC @ =IWRAM_START + 0x3D
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r2, r0, #0
	cmp r2, #0
	beq _0802D900
	subs r0, #1
	strb r0, [r3]
	b _0802D93A
	.align 2, 0
_0802D8F8: .4byte gCurTask
_0802D8FC: .4byte IWRAM_START + 0x3D
_0802D900:
	asrs r0, r5, #8
	asrs r1, r1, #8
	str r2, [sp]
	ldr r2, _0802D978 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r5, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802D93A
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r4, #0x3a]
	str r1, [r4, #0x34]
	ldr r0, _0802D97C @ =IWRAM_START + 0x3C
	adds r1, r6, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D936
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r4, #0x38]
_0802D936:
	movs r0, #1
	strb r0, [r1]
_0802D93A:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802D980 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802D96E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802D96E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802D988
_0802D96E:
	ldr r0, _0802D984 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802D994
	.align 2, 0
_0802D978: .4byte sub_801EE64
_0802D97C: .4byte IWRAM_START + 0x3C
_0802D980: .4byte gCamera
_0802D984: .4byte gCurTask
_0802D988:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802D994:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802D99C
sub_802D99C: @ 0x0802D99C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0802DA34 @ =sub_802DA4C
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r5, #0
	str r5, [sp]
	movs r1, #0x40
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, [r4, #0xc]
	lsls r0, r0, #8
	str r0, [r1, #0x30]
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	str r0, [r1, #0x34]
	movs r6, #0
	strh r5, [r1, #0x38]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1, #0x3a]
	ldr r0, _0802DA38 @ =IWRAM_START + 0x3C
	adds r2, r3, r0
	movs r0, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0xc]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #0x10]
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	lsls r0, r0, #5
	ldr r2, _0802DA3C @ =0x06010000
	adds r0, r0, r2
	str r0, [r1, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	ldr r0, [r4, #4]
	strh r0, [r1, #0xa]
	ldr r2, [r4, #8]
	ldr r4, _0802DA40 @ =IWRAM_START + 0x20
	adds r0, r3, r4
	strb r2, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _0802DA44 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r4, #2
	adds r2, r3, r4
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0802DA48 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r6, [r3]
	mov r2, r8
	str r2, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DA34: .4byte sub_802DA4C
_0802DA38: .4byte IWRAM_START + 0x3C
_0802DA3C: .4byte 0x06010000
_0802DA40: .4byte IWRAM_START + 0x20
_0802DA44: .4byte IWRAM_START + 0x21
_0802DA48: .4byte IWRAM_START + 0x25

	thumb_func_start sub_802DA4C
sub_802DA4C: @ 0x0802DA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802DA8C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	adds r7, r4, #0
	ldrh r0, [r4, #0x3a]
	adds r0, #0x30
	strh r0, [r4, #0x3a]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x34]
	adds r6, r0, r1
	str r6, [r4, #0x34]
	movs r0, #0x38
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x30]
	ldr r0, _0802DA90 @ =IWRAM_START + 0x3C
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	beq _0802DA94
	subs r0, #1
	strb r0, [r2]
	b _0802DAB4
	.align 2, 0
_0802DA8C: .4byte gCurTask
_0802DA90: .4byte IWRAM_START + 0x3C
_0802DA94:
	asrs r0, r6, #8
	asrs r1, r1, #8
	str r5, [sp]
	ldr r2, _0802DAF4 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	adds r1, r6, r0
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bgt _0802DAB4
	strh r5, [r4, #0x3a]
	str r1, [r4, #0x34]
_0802DAB4:
	ldr r1, [r7, #0x30]
	asrs r1, r1, #8
	ldr r2, _0802DAF8 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r7, #0x34]
	asrs r0, r0, #8
	ldr r2, [r2, #4]
	subs r2, r0, r2
	strh r2, [r4, #0x18]
	adds r1, #0x20
	lsls r1, r1, #0x10
	movs r0, #0x98
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0802DAE8
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x20
	cmp r0, #0
	blt _0802DAE8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc0
	ble _0802DB00
_0802DAE8:
	ldr r0, _0802DAFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0802DB0C
	.align 2, 0
_0802DAF4: .4byte sub_801EE64
_0802DAF8: .4byte gCamera
_0802DAFC: .4byte gCurTask
_0802DB00:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0802DB0C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802DB14
sub_802DB14: @ 0x0802DB14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0802DBB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #6
	ble _0802DB34
	movs r2, #6
_0802DB34:
	ldr r3, _0802DBB4 @ =gUnknown_080D6C88
	ldr r4, _0802DBB8 @ =gUnknown_03005444
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	adds r1, r1, r2
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldrb r5, [r0]
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [sp]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r1, r3, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r2
	adds r3, #8
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	ble _0802DB96
	movs r0, #0
	strb r0, [r4]
_0802DB96:
	ldr r0, _0802DBBC @ =gUnknown_080D6DD8
	lsls r1, r5, #0x18
	asrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov r0, sp
	bl _call_via_r1
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBB0: .4byte gCurrentLevel
_0802DBB4: .4byte gUnknown_080D6C88
_0802DBB8: .4byte gUnknown_03005444
_0802DBBC: .4byte gUnknown_080D6DD8

	thumb_func_start sub_802DBC0
sub_802DBC0: @ 0x0802DBC0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DC0C @ =gUnknown_03001884
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DC10 @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DCBE
	cmp r6, #1
	bhi _0802DC14
	lsls r0, r7, #1
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0xa0
	subs r0, r0, r7
	cmp r1, r0
	bge _0802DCBE
	movs r3, #0xf0
	adds r2, r0, #0
_0802DBF4:
	adds r4, #1
	strb r3, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0802DBF4
	b _0802DCBE
	.align 2, 0
_0802DC0C: .4byte gUnknown_03001884
_0802DC10: .4byte 0xFFFFFF00
_0802DC14:
	ldr r2, _0802DC44 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DC48
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DC4A
	.align 2, 0
_0802DC44: .4byte gSineTable
_0802DC48:
	mov r3, ip
_0802DC4A:
	cmp r3, #0
	bge _0802DC50
	rsbs r3, r3, #0
_0802DC50:
	ldr r0, _0802DC8C @ =0x000001FF
	cmp r6, r0
	bhi _0802DC90
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DCBE
_0802DC60:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DC72
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DC72:
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DC60
	b _0802DCBE
	.align 2, 0
_0802DC8C: .4byte 0x000001FF
_0802DC90:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DCBE
_0802DC9C:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DCAE
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DCAE:
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802DCC4 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DC9C
_0802DCBE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCC4: .4byte 0xFFFF0000

	thumb_func_start sub_802DCC8
sub_802DCC8: @ 0x0802DCC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802DD08 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r5, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DD0C @ =0xFFFFFF00
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _0802DDBC
	cmp r6, #1
	bhi _0802DD14
	lsls r0, r7, #1
	adds r4, r4, r0
	lsls r1, r7, #0x10
	cmp r1, #0
	beq _0802DDBC
	movs r2, #0xf0
_0802DCF6:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	ldr r3, _0802DD10 @ =0xFFFF0000
	adds r1, r1, r3
	asrs r0, r1, #0x10
	cmp r0, #0
	bgt _0802DCF6
	b _0802DDBC
	.align 2, 0
_0802DD08: .4byte gUnknown_03001884
_0802DD0C: .4byte 0xFFFFFF00
_0802DD10: .4byte 0xFFFF0000
_0802DD14:
	ldr r2, _0802DD80 @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802DD46
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	cmp r3, #0
	bge _0802DD46
	rsbs r3, r3, #0
_0802DD46:
	ldr r0, _0802DD84 @ =0x000001FF
	cmp r6, r0
	bhi _0802DD8C
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DDBC
_0802DD58:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DD6A
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DD6A:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DD88 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DD58
	b _0802DDBC
	.align 2, 0
_0802DD80: .4byte gSineTable
_0802DD84: .4byte 0x000001FF
_0802DD88: .4byte 0xFFFF0000
_0802DD8C:
	lsls r0, r7, #1
	adds r4, r4, r0
	adds r1, r7, #0
	cmp r1, #0x9f
	bgt _0802DDBC
_0802DD96:
	adds r5, r5, r3
	lsls r0, r5, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DDA8
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802DDA8:
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DD96
_0802DDBC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802DDC4
sub_802DDC4: @ 0x0802DDC4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DE1C @ =gUnknown_03001884
	ldr r4, [r0]
	movs r6, #0
	lsls r1, r1, #0x16
	lsrs r7, r1, #0x16
	ldr r1, _0802DE20 @ =0xFFFFFEFF
	adds r0, r7, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DDE4
	b _0802DF0A
_0802DDE4:
	ldr r3, _0802DE24 @ =0xFFFFFE00
	adds r0, r7, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DE28
	lsls r0, r5, #1
	adds r4, r4, r0
	movs r1, #0
	movs r0, #0xa0
	subs r0, r0, r5
	cmp r1, r0
	blt _0802DE00
	b _0802DF0A
_0802DE00:
	movs r3, #0xf0
	adds r2, r0, #0
_0802DE04:
	adds r4, #1
	strb r3, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	blt _0802DE04
	b _0802DF0A
	.align 2, 0
_0802DE1C: .4byte gUnknown_03001884
_0802DE20: .4byte 0xFFFFFEFF
_0802DE24: .4byte 0xFFFFFE00
_0802DE28:
	ldr r2, _0802DE64 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r7, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r7, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DE50
	rsbs r3, r3, #0
_0802DE50:
	cmp r1, #0
	bge _0802DE56
	rsbs r1, r1, #0
_0802DE56:
	cmp r3, #0
	beq _0802DE68
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DE6A
	.align 2, 0
_0802DE64: .4byte gSineTable
_0802DE68:
	mov r3, ip
_0802DE6A:
	ldr r0, _0802DEA8 @ =0x000001FF
	cmp r7, r0
	bhi _0802DEAC
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802DF0A
	movs r2, #0xf0
_0802DE7C:
	adds r6, r6, r3
	lsls r0, r6, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DE8E
	movs r3, #0
	movs r6, #0xf0
	lsls r6, r6, #8
	movs r0, #0xf0
_0802DE8E:
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DE7C
	b _0802DF0A
	.align 2, 0
_0802DEA8: .4byte 0x000001FF
_0802DEAC:
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0xa0
	ldr r0, _0802DF10 @ =gUnknown_03001884
	mov ip, r0
	lsls r7, r5, #1
	cmp r1, r5
	ble _0802DED4
	movs r2, #0xf0
_0802DEC0:
	subs r4, #1
	strb r2, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DF14 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	bgt _0802DEC0
_0802DED4:
	mov r0, ip
	ldr r4, [r0]
	adds r4, r4, r7
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802DF0A
	movs r2, #0xf0
_0802DEE4:
	adds r6, r6, r3
	lsls r0, r6, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802DEF6
	movs r3, #0
	movs r6, #0xf0
	lsls r6, r6, #8
	movs r0, #0xf0
_0802DEF6:
	subs r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	ldr r1, _0802DF14 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802DEE4
_0802DF0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF10: .4byte gUnknown_03001884
_0802DF14: .4byte 0xFFFF0000

	thumb_func_start sub_802DF18
sub_802DF18: @ 0x0802DF18
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0802DF64 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r7, #0
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	ldr r1, _0802DF68 @ =0xFFFFFEFF
	adds r0, r6, r1
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802DF38
	b _0802E03A
_0802DF38:
	ldr r3, _0802DF6C @ =0xFFFFFE00
	adds r0, r6, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0802DF70
	movs r1, #0
	cmp r1, r5
	bge _0802E03A
	movs r2, #0xf0
_0802DF4C:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DF4C
	b _0802E03A
	.align 2, 0
_0802DF64: .4byte gUnknown_03001884
_0802DF68: .4byte 0xFFFFFEFF
_0802DF6C: .4byte 0xFFFFFE00
_0802DF70:
	ldr r2, _0802DFAC @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	mov ip, r3
	adds r0, r6, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	bge _0802DF98
	rsbs r3, r3, #0
_0802DF98:
	cmp r1, #0
	bge _0802DF9E
	rsbs r1, r1, #0
_0802DF9E:
	cmp r3, #0
	beq _0802DFB0
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802DFB2
	.align 2, 0
_0802DFAC: .4byte gSineTable
_0802DFB0:
	mov r3, ip
_0802DFB2:
	ldr r0, _0802E004 @ =0x000001FF
	cmp r6, r0
	bhi _0802E008
	movs r1, #0
	cmp r1, r5
	bge _0802DFD6
	movs r2, #0xf0
_0802DFC0:
	adds r4, #1
	strb r2, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0802DFC0
_0802DFD6:
	adds r1, r5, #0
	cmp r1, #0x9f
	bgt _0802E03A
	movs r2, #0xf0
_0802DFDE:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bhi _0802E03A
	adds r4, #1
	subs r0, r2, r0
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802DFDE
	b _0802E03A
	.align 2, 0
_0802E004: .4byte 0x000001FF
_0802E008:
	lsls r0, r5, #1
	adds r4, r4, r0
	adds r1, r5, #0
	adds r0, r1, #0
	cmp r0, #0
	blt _0802E03A
	movs r2, #0xf0
_0802E016:
	adds r7, r7, r3
	lsls r0, r7, #8
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _0802E028
	movs r3, #0
	movs r7, #0xf0
	lsls r7, r7, #8
	movs r0, #0xf0
_0802E028:
	subs r0, r2, r0
	strb r0, [r4]
	subs r4, #2
	lsls r0, r1, #0x10
	ldr r1, _0802E040 @ =0xFFFF0000
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0802E016
_0802E03A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E040: .4byte 0xFFFF0000

	thumb_func_start sub_802E044
sub_802E044: @ 0x0802E044
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0802E08C @ =gUnknown_03001884
	ldr r6, [r0]
	lsls r1, r1, #0x16
	lsrs r5, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r5, r0
	bls _0802E0CC
	ldr r2, _0802E090 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E096
	cmp r1, #0
	beq _0802E094
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E096
	.align 2, 0
_0802E08C: .4byte gUnknown_03001884
_0802E090: .4byte gSineTable
_0802E094:
	adds r3, r7, #0
_0802E096:
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r6, r6, r0
	movs r1, #0
_0802E09E:
	subs r4, r4, r3
	asrs r0, r4, #8
	cmp r0, #0xf0
	ble _0802E0AE
	movs r3, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r0, #0xf0
_0802E0AE:
	cmp r0, #0
	bge _0802E0B8
	movs r3, #0
	movs r4, #0
	movs r0, #0
_0802E0B8:
	strb r0, [r6]
	subs r6, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E09E
_0802E0CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E0D4
sub_802E0D4: @ 0x0802E0D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E11C @ =gUnknown_03001884
	ldr r4, [r0]
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r6, r0
	bls _0802E15E
	ldr r2, _0802E120 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E126
	cmp r1, #0
	beq _0802E124
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E126
	.align 2, 0
_0802E11C: .4byte gUnknown_03001884
_0802E120: .4byte gSineTable
_0802E124:
	adds r3, r7, #0
_0802E126:
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0
_0802E12E:
	subs r5, r5, r3
	asrs r0, r5, #8
	cmp r0, #0xf0
	ble _0802E13E
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802E13E:
	cmp r0, #0
	bge _0802E148
	movs r3, #0
	movs r5, #0
	movs r0, #0
_0802E148:
	subs r4, #1
	strb r0, [r4]
	subs r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E12E
_0802E15E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E164
sub_802E164: @ 0x0802E164
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0802E1AC @ =gUnknown_03001884
	ldr r6, [r0]
	lsls r1, r1, #0x16
	lsrs r5, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r5, r0
	bhi _0802E1E6
	ldr r2, _0802E1B0 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E1B6
	cmp r1, #0
	beq _0802E1B4
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E1B6
	.align 2, 0
_0802E1AC: .4byte gUnknown_03001884
_0802E1B0: .4byte gSineTable
_0802E1B4:
	adds r3, r7, #0
_0802E1B6:
	movs r1, #0
_0802E1B8:
	adds r4, r4, r3
	asrs r0, r4, #8
	cmp r0, #0xf0
	ble _0802E1C8
	movs r3, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r0, #0xf0
_0802E1C8:
	cmp r0, #0
	bge _0802E1D2
	movs r3, #0
	movs r4, #0
	movs r0, #0
_0802E1D2:
	strb r0, [r6]
	adds r6, #2
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E1B8
_0802E1E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E1EC
sub_802E1EC: @ 0x0802E1EC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E234 @ =gUnknown_03001884
	ldr r4, [r0]
	lsls r1, r1, #0x16
	lsrs r6, r1, #0x16
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r6, r0
	bhi _0802E270
	ldr r2, _0802E238 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r6, r7
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r3, r0, #2
	lsls r0, r6, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	cmp r3, #0
	beq _0802E23E
	cmp r1, #0
	beq _0802E23C
	adds r0, r3, #0
	bl Div
	adds r3, r0, #0
	b _0802E23E
	.align 2, 0
_0802E234: .4byte gUnknown_03001884
_0802E238: .4byte gSineTable
_0802E23C:
	adds r3, r7, #0
_0802E23E:
	movs r1, #0
_0802E240:
	adds r5, r5, r3
	asrs r0, r5, #8
	cmp r0, #0xf0
	ble _0802E250
	movs r3, #0
	movs r5, #0xf0
	lsls r5, r5, #8
	movs r0, #0xf0
_0802E250:
	cmp r0, #0
	bge _0802E25A
	movs r3, #0
	movs r5, #0
	movs r0, #0
_0802E25A:
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	lsls r0, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0802E240
_0802E270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E278
sub_802E278: @ 0x0802E278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r3, #0
	cmp r3, r5
	bge _0802E2B6
	mov r6, sp
	adds r6, #2
_0802E294:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E294
_0802E2B6:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E374
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E2C6:
	ldr r0, _0802E310 @ =gUnknown_03001884
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E314
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E320
	.align 2, 0
_0802E310: .4byte gUnknown_03001884
_0802E314:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E320:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E366
_0802E340:
	asrs r0, r6, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	ble _0802E34C
	movs r0, #0xf0
_0802E34C:
	strb r0, [r5]
	adds r5, #2
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E340
_0802E366:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E2C6
_0802E374:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E384
sub_802E384: @ 0x0802E384
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #0
	cmp r3, r5
	bge _0802E3C2
	mov r6, sp
	adds r6, #2
_0802E3A0:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	mov r0, sp
	adds r4, r0, r2
	adds r3, r7, r2
	ldrh r0, [r3]
	strh r0, [r4]
	adds r2, r6, r2
	ldrh r0, [r3, #2]
	strh r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r5
	blt _0802E3A0
_0802E3C2:
	movs r4, #0
	subs r5, #1
	mov sb, r5
	cmp r4, sb
	bge _0802E48A
	movs r1, #2
	add r1, sp
	mov sl, r1
_0802E3D2:
	ldr r0, _0802E41C @ =gUnknown_03001884
	ldr r5, [r0]
	lsls r4, r4, #0x10
	asrs r1, r4, #0x10
	lsls r2, r1, #2
	mov r3, sl
	adds r0, r3, r2
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #1
	adds r5, r5, r0
	mov r7, sp
	adds r0, r7, r2
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r6, r2, #8
	adds r1, #1
	lsls r1, r1, #2
	mov r7, sl
	adds r0, r7, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r3, r3, r0
	mov r8, r4
	cmp r3, #0
	beq _0802E420
	mov r4, sp
	adds r0, r4, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	subs r0, r2, r0
	lsls r0, r0, #8
	adds r1, r3, #0
	bl Div
	adds r4, r0, #0
	b _0802E42C
	.align 2, 0
_0802E41C: .4byte gUnknown_03001884
_0802E420:
	mov r3, sp
	adds r0, r3, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	subs r0, r2, r0
	lsls r4, r0, #8
_0802E42C:
	mov r7, r8
	asrs r0, r7, #0x10
	lsls r1, r0, #2
	add r1, sl
	adds r0, #1
	lsls r0, r0, #2
	mov r3, sl
	adds r2, r3, r0
	ldrh r3, [r1]
	movs r0, #0
	ldrsh r7, [r1, r0]
	mov ip, r7
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp ip, r0
	bgt _0802E47C
_0802E44C:
	lsls r0, r6, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E458
	movs r1, #0xf0
_0802E458:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E460
	movs r1, #0
_0802E460:
	adds r5, #1
	strb r1, [r5]
	adds r5, #1
	adds r6, r6, r4
	lsls r0, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r2, r7]
	cmp r0, r1
	ble _0802E44C
_0802E47C:
	movs r0, #0x80
	lsls r0, r0, #9
	add r0, r8
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, sb
	blt _0802E3D2
_0802E48A:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802E49C
sub_802E49C: @ 0x0802E49C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x12c
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	cmp r1, #8
	bls _0802E4B6
	b _0802E774
_0802E4B6:
	cmp r1, #2
	bhi _0802E4BC
	b _0802E774
_0802E4BC:
	movs r4, #0
	movs r0, #2
	add r0, sp
	mov r8, r0
	subs r1, #1
	str r1, [sp, #0x118]
	mov r2, sp
	adds r2, #0x60
	str r2, [sp, #0x10c]
	mov r3, sp
	adds r3, #0x64
	str r3, [sp, #0x110]
	mov r5, sb
	subs r5, #2
	str r5, [sp, #0x114]
	mov r7, sp
	adds r7, #0x20
	str r7, [sp, #0x120]
	mov r0, sp
	adds r0, #0x40
	str r0, [sp, #0x124]
	cmp r4, sb
	bhs _0802E508
	mov r5, r8
_0802E4EC:
	lsls r1, r4, #2
	mov r2, sp
	adds r3, r2, r1
	adds r2, r6, r1
	ldrh r0, [r2]
	strh r0, [r3]
	adds r1, r5, r1
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E4EC
_0802E508:
	movs r4, #0
	ldr r3, [sp, #0x118]
	cmp r4, r3
	bge _0802E588
_0802E510:
	adds r1, r4, #1
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	str r1, [sp, #0x11c]
	cmp r5, sb
	bhs _0802E57C
	lsls r4, r4, #2
	mov ip, r4
	mov r4, r8
	str r4, [sp, #0x108]
	mov r7, r8
	add r7, ip
	str r7, [sp, #0x128]
	mov r0, sp
	add r0, ip
	mov sl, r0
_0802E530:
	lsls r0, r5, #2
	ldr r1, [sp, #0x108]
	adds r6, r1, r0
	ldr r2, [sp, #0x128]
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r7, #0
	ldrsh r1, [r6, r7]
	cmp r3, r1
	blt _0802E572
	mov r4, sp
	add r4, ip
	mov r7, sp
	adds r2, r7, r0
	cmp r3, r1
	bne _0802E55E
	mov r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	blt _0802E572
_0802E55E:
	ldrh r1, [r4]
	ldrh r0, [r2]
	strh r0, [r4]
	strh r1, [r2]
	ldr r0, [sp, #0x128]
	ldrh r1, [r0]
	ldrh r0, [r6]
	ldr r2, [sp, #0x128]
	strh r0, [r2]
	strh r1, [r6]
_0802E572:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, sb
	blo _0802E530
_0802E57C:
	ldr r3, [sp, #0x11c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x118]
	cmp r4, r5
	blt _0802E510
_0802E588:
	ldr r7, [sp, #0x10c]
	mov r0, sp
	ldrh r0, [r0]
	adds r1, r7, #0
	strh r0, [r1]
	mov r0, sp
	ldrh r1, [r0, #2]
	ldr r2, [sp, #0x10c]
	strh r1, [r2, #2]
	movs r4, #1
	cmp r4, sb
	bhs _0802E5EE
	mov r6, r8
	adds r0, #6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0802E5EE
_0802E5B0:
	adds r2, r7, #0
	lsls r3, r4, #2
	mov r5, sp
	adds r0, r5, r3
	movs r5, #0
	ldrsh r1, [r2, r5]
	ldrh r5, [r0]
	mov sl, r5
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _0802E5D2
	mov r0, sl
	strh r0, [r2]
	adds r0, r6, r3
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E5D2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	bhs _0802E5EE
	lsls r0, r4, #2
	mov r6, r8
	add r0, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	beq _0802E5B0
_0802E5EE:
	ldr r6, [sp, #0x110]
	ldr r7, [sp, #0x118]
	lsls r1, r7, #2
	mov r2, sp
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r6]
	mov sl, r8
	add r1, r8
	ldrh r1, [r1]
	ldr r3, [sp, #0x110]
	strh r1, [r3, #2]
	ldr r4, [sp, #0x114]
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov r7, r8
	adds r0, r7, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	b _0802E650
_0802E61C:
	adds r2, r6, #0
	mov r3, sp
	adds r0, r3, r5
	movs r7, #0
	ldrsh r1, [r2, r7]
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _0802E63A
	strh r3, [r2]
	mov r1, sl
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2, #2]
_0802E63A:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0802E658
	lsls r5, r4, #2
	mov sl, r8
	mov r3, r8
	adds r0, r3, r5
	movs r7, #2
	ldrsh r1, [r2, r7]
_0802E650:
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0802E61C
_0802E658:
	ldr r3, [sp, #0x10c]
	movs r4, #0
	ldrsh r2, [r3, r4]
	lsls r5, r2, #8
	ldr r7, [sp, #0x110]
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r1, r1, r0
	cmp r1, #0
	beq _0802E682
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, r0, r2
	lsls r0, r0, #8
	adds r0, #0x80
	bl Div
	adds r2, r0, #0
	b _0802E68C
_0802E682:
	ldr r4, [sp, #0x110]
	movs r7, #0
	ldrsh r0, [r4, r7]
	subs r0, r0, r2
	lsls r2, r0, #8
_0802E68C:
	ldr r1, [sp, #0x10c]
	ldrh r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x110]
	movs r7, #2
	ldrsh r0, [r3, r7]
	cmp r4, r0
	bgt _0802E6C8
	add r6, sp, #0x68
_0802E6A0:
	lsls r0, r5, #8
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0802E6AC
	movs r1, #0xf0
_0802E6AC:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0802E6B4
	movs r1, #0
_0802E6B4:
	adds r0, r6, r4
	strb r1, [r0]
	adds r5, r5, r2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r4, r0
	ble _0802E6A0
_0802E6C8:
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E716
	add r2, sp, #0x68
	mov ip, r2
	ldr r3, [sp, #0x120]
	mov sl, r3
	mov r7, r8
_0802E6DA:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bgt _0802E70C
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x22
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E70C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E6DA
_0802E716:
	ldr r0, [sp, #0x120]
	adds r1, r5, #0
	bl sub_802E278
	movs r4, #0
	movs r5, #0
	cmp r5, sb
	bhs _0802E76C
	add r1, sp, #0x68
	mov ip, r1
	ldr r2, [sp, #0x124]
	mov sl, r2
	mov r7, r8
_0802E730:
	lsls r2, r4, #2
	adds r6, r7, r2
	movs r3, #0
	ldrsh r0, [r6, r3]
	add r0, ip
	ldrb r1, [r0]
	mov r0, sp
	adds r3, r0, r2
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r1, r0
	blt _0802E762
	lsls r2, r5, #2
	mov r0, sl
	adds r1, r0, r2
	ldrh r0, [r3]
	strh r0, [r1]
	mov r0, sp
	adds r0, #0x42
	adds r0, r0, r2
	ldrh r1, [r6]
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0802E762:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sb
	blo _0802E730
_0802E76C:
	ldr r0, [sp, #0x124]
	adds r1, r5, #0
	bl sub_802E384
_0802E774:
	add sp, #0x12c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_802E784
sub_802E784: @ 0x0802E784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r4, [sp, #0x58]
	ldr r5, [sp, #0x5c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x24]
	lsls r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x28]
	movs r0, #0
	mov sl, r0
	ldr r1, _0802E80C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802E810 @ =gUnknown_03002878
	ldr r0, _0802E814 @ =0x04000040
	str r0, [r1]
	ldr r2, _0802E818 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	lsrs r1, r3, #0x10
	mov ip, r1
	asrs r2, r3, #0x10
	ldr r5, _0802E81C @ =0xFFFF0000
	adds r3, r3, r5
	lsrs r3, r3, #0x10
	cmp r3, #0xee
	bls _0802E7DC
	b _0802EABC
_0802E7DC:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r5, r0, #0
	cmp r1, #0x9f
	ble _0802E7E8
	b _0802EABC
_0802E7E8:
	cmp r2, #0
	bgt _0802E7EE
	b _0802EABC
_0802E7EE:
	ldr r0, _0802E820 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802E824 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802E830
	add r1, sp, #0x1c
	mov r6, sl
	strh r6, [r1]
	ldr r0, _0802E828 @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802E82C @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802E848
	.align 2, 0
_0802E80C: .4byte gUnknown_03002A80
_0802E810: .4byte gUnknown_03002878
_0802E814: .4byte 0x04000040
_0802E818: .4byte gFlags
_0802E81C: .4byte 0xFFFF0000
_0802E820: .4byte gUnknown_03001884
_0802E824: .4byte gUnknown_03001B60
_0802E828: .4byte 0x040000D4
_0802E82C: .4byte 0x81000140
_0802E830:
	add r0, sp, #0x1c
	mov r1, sl
	strh r1, [r0]
	ldr r1, _0802E938 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802E93C @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802E848:
	ldr r4, [sp, #0x20]
	ldr r6, _0802E940 @ =0xFFFFFF00
	adds r1, r4, r6
	ldr r2, _0802E944 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldr r4, _0802E948 @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	str r3, [sp, #0x34]
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r6, r0, #0xf
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r8, r0
	mov r0, r8
	muls r0, r7, r0
	asrs r7, r0, #0xf
	mov r1, sp
	mov r0, ip
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	adds r0, r3, r6
	strh r0, [r1, #4]
	asrs r5, r5, #0x10
	adds r0, r5, r7
	strh r0, [r1, #6]
	subs r0, r3, r6
	strh r0, [r1]
	subs r0, r5, r7
	strh r0, [r1, #2]
	ldr r1, [sp, #0x20]
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r6, [r2, r0]
	mov ip, r6
	ldr r1, [sp, #0x28]
	mov r0, ip
	muls r0, r1, r0
	asrs r6, r0, #0xe
	ldr r0, [sp, #0x20]
	lsls r2, r0, #1
	adds r2, r2, r4
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r4, [sp, #0x28]
	muls r0, r4, r0
	asrs r7, r0, #0xe
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #4]
	adds r0, r0, r6
	strh r0, [r1, #4]
	mov r0, sp
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	strh r0, [r1, #6]
	mov r0, sp
	ldrh r0, [r0]
	adds r0, r0, r6
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	adds r0, r0, r7
	strh r0, [r1, #2]
	mov r0, sp
	ldrh r0, [r0, #4]
	str r0, [sp, #0x2c]
	mov r0, sp
	ldrh r0, [r0, #6]
	str r0, [sp, #0x30]
	mov r0, sp
	ldrh r4, [r0]
	ldrh r0, [r0, #2]
	mov sb, r0
	ldr r6, [sp, #0x34]
	ldr r1, [sp, #0x24]
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r6, r0, #0xf
	mov r0, r8
	muls r0, r1, r0
	asrs r7, r0, #0xf
	mov r1, sp
	adds r0, r3, r6
	strh r0, [r1, #8]
	adds r0, r5, r7
	strh r0, [r1, #0xa]
	mov r0, sp
	subs r3, r3, r6
	strh r3, [r0, #0xc]
	subs r5, r5, r7
	strh r5, [r0, #0xe]
	mov r3, ip
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r6, r0, #2
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x16
	cmp r6, #0
	beq _0802E950
	cmp r7, #0
	beq _0802E94C
	adds r0, r6, #0
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	b _0802E950
	.align 2, 0
_0802E938: .4byte 0x040000D4
_0802E93C: .4byte 0x81000140
_0802E940: .4byte 0xFFFFFF00
_0802E944: .4byte 0x000003FF
_0802E948: .4byte gSineTable
_0802E94C:
	movs r6, #0xf0
	lsls r6, r6, #8
_0802E950:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #0x10
	asrs r1, r0, #8
	ldr r0, _0802E968 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802E996
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r5, sb
	lsls r3, r5, #0x10
	b _0802E972
	.align 2, 0
_0802E968: .4byte 0x000001FF
_0802E96C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E972:
	cmp r2, #0x9e
	bhi _0802E9C0
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E98A
	cmp r0, #0
	bge _0802E96C
	b _0802E9BC
_0802E98A:
	movs r1, #0xf0
	mov sl, r1
	b _0802E9C0
_0802E990:
	movs r5, #0xf0
	mov sl, r5
	b _0802E9C0
_0802E996:
	ldr r2, [sp, #0x30]
	lsls r4, r4, #0x10
	mov r0, sb
	lsls r3, r0, #0x10
	b _0802E9A6
_0802E9A0:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0802E9A6:
	cmp r2, #0
	beq _0802E9C0
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802E990
	cmp r0, #0
	bge _0802E9A0
_0802E9BC:
	movs r0, #0
	mov sl, r0
_0802E9C0:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	asrs r1, r4, #8
	ldr r0, _0802EA08 @ =0x000001FF
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bhi _0802EA18
	lsrs r2, r3, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	blt _0802EA30
_0802E9EA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9e
	bhi _0802EA56
	adds r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA0C
	cmp r0, #0
	bge _0802E9EA
	b _0802EA52
	.align 2, 0
_0802EA08: .4byte 0x000001FF
_0802EA0C:
	movs r0, #0xf0
	mov sl, r0
	b _0802EA56
_0802EA12:
	movs r1, #0xf0
	mov sl, r1
	b _0802EA56
_0802EA18:
	lsrs r2, r3, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA30:
	movs r4, #0
	mov sl, r4
	b _0802EA56
_0802EA36:
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0802EA56
	subs r1, r1, r6
	lsls r0, r1, #8
	lsrs r5, r0, #0x10
	mov sl, r5
	asrs r0, r0, #0x10
	cmp r0, #0xef
	bgt _0802EA12
	cmp r0, #0
	bge _0802EA36
_0802EA52:
	movs r6, #0
	mov sl, r6
_0802EA56:
	mov r0, sp
	mov r1, sl
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	mov r1, sp
	ldrh r6, [r0, #0x14]
	movs r3, #0x14
	ldrsh r4, [r0, r3]
	ldrh r5, [r1, #0x10]
	movs r0, #0x10
	ldrsh r3, [r1, r0]
	cmp r4, r3
	beq _0802EAB2
	mov r0, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x12
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0802EAB2
	cmp r3, #0
	bne _0802EA8C
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA8C:
	cmp r4, #0
	beq _0802EA9E
	cmp r3, #0xf0
	bne _0802EA9E
	mov r0, sp
	strh r5, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x16]
	b _0802EAA6
_0802EA9E:
	mov r0, sp
	strh r6, [r0, #0x18]
	mov r1, sp
	ldrh r0, [r0, #0x12]
_0802EAA6:
	strh r0, [r1, #0x1a]
	mov r0, sp
	movs r1, #7
	bl sub_802E49C
	b _0802ED86
_0802EAB2:
	mov r0, sp
	movs r1, #6
	bl sub_802E49C
	b _0802ED86
_0802EABC:
	lsrs r0, r7, #1
	adds r2, r0, #0
	mov r8, r2
	cmp r2, #0
	bne _0802EB14
	ldr r0, _0802EAE4 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r3, _0802EAE8 @ =gUnknown_03001B60
	cmp r0, r3
	bne _0802EAF4
	add r1, sp, #0x1c
	strh r2, [r1]
	ldr r0, _0802EAEC @ =0x040000D4
	str r1, [r0]
	str r3, [r0, #4]
	ldr r1, _0802EAF0 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED86
	.align 2, 0
_0802EAE4: .4byte gUnknown_03001884
_0802EAE8: .4byte gUnknown_03001B60
_0802EAEC: .4byte 0x040000D4
_0802EAF0: .4byte 0x81000140
_0802EAF4:
	add r0, sp, #0x1c
	strh r2, [r0]
	ldr r1, _0802EB0C @ =0x040000D4
	str r0, [r1]
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r0, r3, r4
	str r0, [r1, #4]
	ldr r0, _0802EB10 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0802ED86
	.align 2, 0
_0802EB0C: .4byte 0x040000D4
_0802EB10: .4byte 0x81000140
_0802EB14:
	ldr r5, [sp, #0x20]
	ldr r6, _0802EB6C @ =0xFFFFFEFF
	adds r0, r5, r6
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	lsls r5, r4, #0x10
	cmp r0, r1
	bhi _0802EBE8
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0xef
	ble _0802EBE8
	ldr r1, _0802EB70 @ =gSineTable
	ldr r3, [sp, #0x20]
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r2, #0
	subs r0, #0xf0
	muls r0, r1, r0
	asrs r7, r0, #0xe
	asrs r0, r5, #0x10
	adds r7, r7, r0
	subs r0, r7, #1
	cmp r0, #0x9e
	bhi _0802EBE8
	movs r3, #0xf1
	ldr r0, _0802EB74 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802EB78 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EB84
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EB7C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EB80 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EB9A
	.align 2, 0
_0802EB6C: .4byte 0xFFFFFEFF
_0802EB70: .4byte gSineTable
_0802EB74: .4byte gUnknown_03001884
_0802EB78: .4byte gUnknown_03001B60
_0802EB7C: .4byte 0x040000D4
_0802EB80: .4byte 0x81000140
_0802EB84:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EBAC @ =0x040000D4
	str r0, [r1]
	movs r5, #0xa0
	lsls r5, r5, #2
	adds r0, r2, r5
	str r0, [r1, #4]
	ldr r0, _0802EBB0 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EB9A:
	mov r6, r8
	subs r0, r7, r6
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBB4
	movs r3, #0
	b _0802EBBA
	.align 2, 0
_0802EBAC: .4byte 0x040000D4
_0802EBB0: .4byte 0x81000140
_0802EBB4:
	cmp r0, #0xa0
	ble _0802EBBA
	movs r3, #0xa0
_0802EBBA:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DF18
	mov r1, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EBD6
	movs r3, #0
	b _0802EBDC
_0802EBD6:
	cmp r0, #0xa0
	ble _0802EBDC
	movs r3, #0xa0
_0802EBDC:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [sp, #0x20]
	bl sub_802DDC4
	b _0802ED86
_0802EBE8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, [sp, #0x20]
	cmp r2, r0
	bls _0802ECC2
	asrs r2, r5, #0x10
	cmp r2, #0x9f
	ble _0802ECB8
	ldr r1, _0802EC40 @ =gSineTable
	ldr r3, [sp, #0x20]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r3, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, r2, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ECB8
	movs r3, #0xf1
	ldr r0, _0802EC44 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802EC48 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802EC54
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802EC4C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802EC50 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802EC6A
	.align 2, 0
_0802EC40: .4byte gSineTable
_0802EC44: .4byte gUnknown_03001884
_0802EC48: .4byte gUnknown_03001B60
_0802EC4C: .4byte 0x040000D4
_0802EC50: .4byte 0x81000140
_0802EC54:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802EC7C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802EC80 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802EC6A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802EC84
	movs r4, #0
	b _0802EC8A
	.align 2, 0
_0802EC7C: .4byte 0x040000D4
_0802EC80: .4byte 0x81000140
_0802EC84:
	cmp r0, #0xf0
	ble _0802EC8A
	movs r4, #0xf0
_0802EC8A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E0D4
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ECA6
	movs r4, #0
	b _0802ECAC
_0802ECA6:
	cmp r0, #0xf0
	ble _0802ECAC
	movs r4, #0xf0
_0802ECAC:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E044
	b _0802ED86
_0802ECB8:
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r6, [sp, #0x20]
	cmp r6, r0
	bhi _0802ED86
_0802ECC2:
	asrs r5, r5, #0x10
	cmp r5, #0
	bge _0802ED86
	ldr r1, _0802ED10 @ =gSineTable
	ldr r2, [sp, #0x20]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r5, #0
	subs r0, #0xa0
	muls r0, r1, r0
	asrs r6, r0, #0xe
	mov r5, ip
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r6, r6, r0
	subs r0, r6, #1
	cmp r0, #0xee
	bhi _0802ED86
	movs r3, #0xf1
	ldr r0, _0802ED14 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802ED18 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802ED24
	add r1, sp, #0x1c
	strh r3, [r1]
	ldr r0, _0802ED1C @ =0x040000D4
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802ED20 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802ED3A
	.align 2, 0
_0802ED10: .4byte gSineTable
_0802ED14: .4byte gUnknown_03001884
_0802ED18: .4byte gUnknown_03001B60
_0802ED1C: .4byte 0x040000D4
_0802ED20: .4byte 0x81000140
_0802ED24:
	add r0, sp, #0x1c
	strh r3, [r0]
	ldr r1, _0802ED4C @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802ED50 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802ED3A:
	mov r4, r8
	subs r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED54
	movs r4, #0
	b _0802ED5A
	.align 2, 0
_0802ED4C: .4byte 0x040000D4
_0802ED50: .4byte 0x81000140
_0802ED54:
	cmp r0, #0xf0
	ble _0802ED5A
	movs r4, #0xf0
_0802ED5A:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E1EC
	mov r5, r8
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0802ED76
	movs r4, #0
	b _0802ED7C
_0802ED76:
	cmp r0, #0xf0
	ble _0802ED7C
	movs r4, #0xf0
_0802ED7C:
	lsls r0, r4, #0x10
	asrs r0, r0, #8
	ldr r1, [sp, #0x20]
	bl sub_802E164
_0802ED86:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802ED98
sub_802ED98: @ 0x0802ED98
	push {r4, lr}
	ldr r4, _0802EDCC @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802EE64
	ldr r0, [r4]
	bl TaskDestroy
	ldr r0, _0802EDD0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0802EDD8
	ldr r0, _0802EDD4 @ =gUnknown_03005490
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _0802EE64
	.align 2, 0
_0802EDCC: .4byte gCurTask
_0802EDD0: .4byte gGameMode
_0802EDD4: .4byte gUnknown_03005490
_0802EDD8:
	ldr r3, _0802EE0C @ =gCurrentLevel
	ldrb r0, [r3]
	lsls r2, r0, #0x18
	cmp r0, #0x1c
	beq _0802EE64
	ldr r0, _0802EE10 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802EE54
	ldr r0, _0802EE14 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bgt _0802EE54
	asrs r0, r2, #0x1a
	cmp r0, #2
	beq _0802EE26
	cmp r0, #2
	bgt _0802EE18
	cmp r0, #0
	beq _0802EE1E
	b _0802EE36
	.align 2, 0
_0802EE0C: .4byte gCurrentLevel
_0802EE10: .4byte gSelectedCharacter
_0802EE14: .4byte gLoadedSaveGame
_0802EE18:
	cmp r0, #4
	beq _0802EE2E
	b _0802EE36
_0802EE1E:
	movs r0, #0
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE26:
	movs r0, #1
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE2E:
	movs r0, #2
	bl CreateCourseResultsCutScene
	b _0802EE64
_0802EE36:
	ldr r0, _0802EE48 @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0802EE4C @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _0802EE50 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	b _0802EE64
	.align 2, 0
_0802EE48: .4byte gUnknown_03005490
_0802EE4C: .4byte gCourseTime
_0802EE50: .4byte gUnknown_030054F4
_0802EE54:
	ldr r0, _0802EE6C @ =gUnknown_03005490
	ldr r0, [r0]
	ldr r1, _0802EE70 @ =gCourseTime
	ldrh r1, [r1]
	ldr r2, _0802EE74 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0802EE64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE6C: .4byte gUnknown_03005490
_0802EE70: .4byte gCourseTime
_0802EE74: .4byte gUnknown_030054F4

	thumb_func_start sub_802EE78
sub_802EE78: @ 0x0802EE78
	push {r4, r5, r6, lr}
	ldr r0, _0802EF44 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0802EF3C
	strh r1, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	strh r1, [r4, #6]
	movs r0, #0xbf
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r3, _0802EF48 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1a
	beq _0802EEC0
	ldr r0, _0802EF4C @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
_0802EEC0:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1c
	bne _0802EF34
	ldr r2, _0802EF50 @ =gUnknown_080D6DE4
	ldrb r1, [r4, #0x11]
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrh r5, [r0]
	ldr r4, _0802EF54 @ =gPlayer
	ldr r3, [r4, #8]
	asrs r0, r3, #8
	subs r5, r5, r0
	adds r2, #2
	adds r1, r1, r2
	ldrh r2, [r1]
	ldr r1, [r4, #0xc]
	asrs r0, r1, #8
	subs r2, r2, r0
	lsls r6, r5, #8
	adds r3, r3, r6
	str r3, [r4, #8]
	lsls r3, r2, #8
	adds r1, r1, r3
	str r1, [r4, #0xc]
	ldr r1, _0802EF58 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	adds r0, r0, r2
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	adds r0, r0, r2
	str r0, [r1, #0x14]
	ldr r0, _0802EF5C @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _0802EF2C
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r3
	str r0, [r1, #4]
_0802EF2C:
	ldr r1, _0802EF60 @ =gUnknown_030055B0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802EF34:
	ldr r0, _0802EF44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0802EF64 @ =sub_802F06C
	str r0, [r1, #8]
_0802EF3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF44: .4byte gCurTask
_0802EF48: .4byte gCurrentLevel
_0802EF4C: .4byte gFlags
_0802EF50: .4byte gUnknown_080D6DE4
_0802EF54: .4byte gPlayer
_0802EF58: .4byte gCamera
_0802EF5C: .4byte gUnknown_030056A4
_0802EF60: .4byte gUnknown_030055B0
_0802EF64: .4byte sub_802F06C

	thumb_func_start sub_802EF68
sub_802EF68: @ 0x0802EF68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0802EFD4 @ =sub_802EE78
	movs r2, #0xc1
	lsls r2, r2, #7
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	mov r1, r8
	strb r1, [r0, #0x10]
	strh r4, [r0, #0xc]
	strh r5, [r0, #0xe]
	strb r6, [r0, #0x11]
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r0, #4]
	movs r1, #1
	strh r1, [r0, #2]
	movs r1, #0xc0
	strh r1, [r0, #6]
	movs r1, #0xbf
	strh r1, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xa]
	ldr r0, _0802EFD8 @ =0x0000014D
	bl m4aSongNumStart
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EFD4: .4byte sub_802EE78
_0802EFD8: .4byte 0x0000014D

	thumb_func_start sub_802EFDC
sub_802EFDC: @ 0x0802EFDC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0802F004 @ =gUnknown_03001884
	ldr r0, [r0]
	ldr r2, _0802F008 @ =gUnknown_03001B60
	cmp r0, r2
	bne _0802F014
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0802F00C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, _0802F010 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	b _0802F02A
	.align 2, 0
_0802F004: .4byte gUnknown_03001884
_0802F008: .4byte gUnknown_03001B60
_0802F00C: .4byte 0x040000D4
_0802F010: .4byte 0x81000140
_0802F014:
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0802F030 @ =0x040000D4
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r0, r2, r3
	str r0, [r1, #4]
	ldr r0, _0802F034 @ =0x81000140
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0802F02A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802F030: .4byte 0x040000D4
_0802F034: .4byte 0x81000140

	thumb_func_start sub_802F038
sub_802F038: @ 0x0802F038
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0802F068 @ =gUnknown_03001884
	ldr r3, [r0]
	lsls r0, r1, #1
	adds r3, r3, r0
	cmp r1, r2
	bhs _0802F060
_0802F052:
	strh r4, [r3]
	adds r3, #2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0802F052
_0802F060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F068: .4byte gUnknown_03001884

	thumb_func_start sub_802F06C
sub_802F06C: @ 0x0802F06C
	push {r4, r5, lr}
	ldr r5, _0802F0A0 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _0802F098
	movs r0, #0x3c
	strh r0, [r4, #6]
	ldr r1, [r5]
	ldr r0, _0802F0A4 @ =sub_802ED98
	str r0, [r1, #8]
_0802F098:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F0A0: .4byte gCurTask
_0802F0A4: .4byte sub_802ED98

	thumb_func_start sub_802F0A8
sub_802F0A8: @ 0x0802F0A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r2, _0802F200 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r7, _0802F204 @ =gPlayer
	adds r0, r7, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	orrs r0, r2
	str r0, [r1, #0x1c]
	adds r0, r7, #0
	adds r0, #0x94
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _0802F208 @ =gUnknown_03005B4C
	movs r4, #0
	str r4, [r0]
	ldr r0, _0802F20C @ =sub_802F75C
	movs r2, #0x88
	lsls r2, r2, #6
	ldr r1, _0802F210 @ =sub_80303CC
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r0, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r0, r0, r5
	str r0, [sp, #8]
	movs r6, #2
	str r6, [r0]
	strb r4, [r0, #4]
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r7, #0x20]
	ldr r0, _0802F214 @ =sub_802F9F8
	ldr r2, _0802F218 @ =0x00002210
	ldr r1, _0802F21C @ =sub_8030458
	mov r8, r1
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r3, _0802F220 @ =IWRAM_START+4
	adds r0, r0, r3
	strh r4, [r0]
	strh r4, [r0, #4]
	strh r6, [r0, #2]
	strh r4, [r0, #6]
	ldr r1, _0802F224 @ =0x00003FFF
	strh r1, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_802D4CC
	ldr r0, _0802F228 @ =sub_802FD34
	ldr r2, _0802F22C @ =0x00002220
	mov r1, r8
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r3, _0802F230 @ =IWRAM_START + 0x10
	adds r1, r0, r3
	strh r4, [r1]
	strh r4, [r1, #2]
	ldr r2, _0802F234 @ =IWRAM_START + 0x14
	adds r1, r0, r2
	strh r4, [r1]
	strh r4, [r1, #2]
	ldr r0, _0802F238 @ =sub_802FF94
	movs r1, #0xc4
	lsls r1, r1, #2
	ldr r2, _0802F23C @ =0x00002230
	ldr r3, _0802F240 @ =sub_803045C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r0, r0, r5
	mov r8, r0
	ldr r3, [sp, #8]
	str r3, [r0]
	ldr r0, _0802F244 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F260
	ldr r2, _0802F248 @ =gUnknown_080D6E00
	ldr r0, _0802F24C @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F250 @ =gUnknown_080D6E1E
	ldr r1, _0802F254 @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r1, r4, #3
	adds r1, r1, r5
	ldrh r6, [r1]
	lsls r2, r2, #2
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r6
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r3, r2, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r3, [r1]
	adds r2, #3
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802F258 @ =gUnknown_080D6F0E
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, _0802F25C @ =gUnknown_080D6F44
	ldrh r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	b _0802F2BE
	.align 2, 0
_0802F200: .4byte gUnknown_03005424
_0802F204: .4byte gPlayer
_0802F208: .4byte gUnknown_03005B4C
_0802F20C: .4byte sub_802F75C
_0802F210: .4byte sub_80303CC
_0802F214: .4byte sub_802F9F8
_0802F218: .4byte 0x00002210
_0802F21C: .4byte sub_8030458
_0802F220: .4byte IWRAM_START+4
_0802F224: .4byte 0x00003FFF
_0802F228: .4byte sub_802FD34
_0802F22C: .4byte 0x00002220
_0802F230: .4byte IWRAM_START + 0x10
_0802F234: .4byte IWRAM_START + 0x14
_0802F238: .4byte sub_802FF94
_0802F23C: .4byte 0x00002230
_0802F240: .4byte sub_803045C
_0802F244: .4byte gGameMode
_0802F248: .4byte gUnknown_080D6E00
_0802F24C: .4byte gSelectedCharacter
_0802F250: .4byte gUnknown_080D6E1E
_0802F254: .4byte gCurrentLevel
_0802F258: .4byte gUnknown_080D6F0E
_0802F25C: .4byte gUnknown_080D6F44
_0802F260:
	ldr r2, _0802F3E0 @ =gUnknown_080D6E00
	ldr r0, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F3E8 @ =gUnknown_080D6E1E
	ldr r1, _0802F3EC @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r4, r2, #1
	adds r4, r4, r2
	lsls r1, r4, #3
	adds r1, r1, r5
	ldrh r6, [r1]
	lsls r2, r2, #2
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r6
	ldrh r1, [r1]
	adds r0, r0, r1
	adds r3, r2, #2
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r3, [r1]
	adds r2, #3
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0802F3F0 @ =gUnknown_080D6F0E
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
_0802F2BE:
	adds r0, r0, r1
	bl VramMalloc
	adds r6, r0, #0
	movs r5, #0xda
	lsls r5, r5, #1
	add r5, r8
	movs r4, #0
	movs r7, #0
	strh r7, [r5, #0x16]
	strh r7, [r5, #0x18]
	str r6, [r5, #4]
	ldr r2, _0802F3E0 @ =gUnknown_080D6E00
	ldr r3, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r7, [r5, #8]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, r8
	strb r1, [r0]
	strh r7, [r5, #0x14]
	strh r7, [r5, #0x1c]
	ldr r1, _0802F3F4 @ =0x000001D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0xeb
	lsls r1, r1, #1
	add r1, r8
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802F3F8 @ =0x000001D9
	add r1, r8
	strb r4, [r1]
	ldr r0, _0802F3FC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802F34C
	ldr r0, _0802F400 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r1]
_0802F34C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r7, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r7, #0
	movs r4, #0xb1
	lsls r4, r4, #2
	add r4, r8
	str r4, [sp, #0x20]
	ldr r0, _0802F404 @ =0x000002C5
	add r0, r8
	str r0, [sp, #0x24]
	ldr r1, _0802F408 @ =0x000002C6
	add r1, r8
	str r1, [sp, #0x28]
	ldr r2, _0802F40C @ =0x000002C9
	add r2, r8
	str r2, [sp, #0x2c]
	movs r3, #0xbd
	lsls r3, r3, #2
	add r3, r8
	str r3, [sp, #0x10]
	ldr r4, _0802F410 @ =0x000002F5
	add r4, r8
	str r4, [sp, #0x14]
	ldr r0, _0802F414 @ =0x000002F6
	add r0, r8
	str r0, [sp, #0x18]
	ldr r1, _0802F418 @ =0x000002F9
	add r1, r8
	str r1, [sp, #0x1c]
	movs r2, #0
	ldr r3, _0802F3E8 @ =gUnknown_080D6E1E
	adds r4, r3, #2
	mov sl, r4
	adds r0, r3, #4
	mov ip, r0
_0802F39C:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r4, r8
	adds r5, r4, r0
	strh r2, [r5, #0x16]
	strh r2, [r5, #0x18]
	ldr r0, _0802F3EC @ =gCurrentLevel
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0802F41C
	str r6, [r5, #4]
	adds r0, r7, #0
	adds r0, #0x20
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r4, r1, #0
	add r4, sl
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	add r1, ip
	ldrh r1, [r1]
	b _0802F47E
	.align 2, 0
_0802F3E0: .4byte gUnknown_080D6E00
_0802F3E4: .4byte gSelectedCharacter
_0802F3E8: .4byte gUnknown_080D6E1E
_0802F3EC: .4byte gCurrentLevel
_0802F3F0: .4byte gUnknown_080D6F0E
_0802F3F4: .4byte 0x000001D5
_0802F3F8: .4byte 0x000001D9
_0802F3FC: .4byte gGameMode
_0802F400: .4byte 0x04000128
_0802F404: .4byte 0x000002C5
_0802F408: .4byte 0x000002C6
_0802F40C: .4byte 0x000002C9
_0802F410: .4byte 0x000002F5
_0802F414: .4byte 0x000002F6
_0802F418: .4byte 0x000002F9
_0802F41C:
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _0802F446
	str r6, [r5, #4]
	adds r0, r7, #0
	adds r0, #0x24
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r4, r1, #0
	add r4, sl
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	add r1, ip
	ldrh r1, [r1]
	b _0802F47E
_0802F446:
	str r6, [r5, #4]
	ldr r1, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #2
	adds r0, r0, r7
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	add r1, sl
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldr r4, _0802F5D8 @ =gCurrentLevel
	ldrb r1, [r4]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r1, r1, #2
	adds r1, r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, ip
	ldrh r1, [r0]
_0802F47E:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	movs r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	mov r4, sp
	strb r0, [r4, #0xc]
	movs r0, #0xff
	strb r0, [r1, r5]
	adds r0, r5, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	strb r2, [r0]
	movs r4, #1
	rsbs r4, r4, #0
	mov sb, r4
	str r4, [r5, #0x28]
	str r2, [r5, #0x10]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _0802F4C0
	b _0802F39C
_0802F4C0:
	movs r5, #0xa9
	lsls r5, r5, #2
	add r5, r8
	movs r7, #0
	movs r4, #0
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	movs r0, #0x90
	lsls r0, r0, #3
	adds r6, r6, r0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r5, #0x1a]
	strh r4, [r5, #8]
	subs r0, #0x25
	strh r0, [r5, #0xa]
	ldr r2, [sp, #0x20]
	strb r7, [r2]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	movs r0, #0x20
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldr r2, [sp, #0x2c]
	strb r7, [r2]
	mov r3, sb
	str r3, [r5, #0x28]
	str r4, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, r8
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	ldr r3, _0802F5DC @ =gUnknown_080D6F0E
	ldr r2, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r0, r3, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5, #0xa]
	ldrb r1, [r2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r3, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1d
	bne _0802F558
	ldrh r0, [r3, #0x32]
	strh r0, [r5, #0xa]
	ldrh r0, [r3, #0x34]
	strb r0, [r1]
_0802F558:
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	mov r4, sp
	ldrb r4, [r4, #0xc]
	orrs r0, r4
	strb r0, [r3]
	movs r1, #0x10
	ldr r0, [sp, #0x18]
	strb r1, [r0]
	ldr r2, [sp, #0x1c]
	strb r7, [r2]
	mov r3, sb
	str r3, [r5, #0x28]
	ldr r2, _0802F5E0 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _0802F5E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F652
	movs r7, #0
	movs r4, #0
	mov sb, r4
	movs r3, #0
	ldr r4, _0802F5E8 @ =gUnknown_080D6F44
_0802F5A8:
	lsls r0, r7, #1
	adds r1, r0, r7
	lsls r0, r1, #4
	adds r0, #4
	mov r2, r8
	adds r5, r2, r0
	strh r3, [r5, #0x16]
	ldr r0, _0802F5EC @ =0x0000FFE0
	strh r0, [r5, #0x18]
	str r6, [r5, #4]
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r6, r6, r0
	ldr r0, _0802F5D8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	cmp r0, #0x1d
	bne _0802F5F0
	cmp r7, #8
	bne _0802F5FE
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0x3a]
	b _0802F60E
	.align 2, 0
_0802F5D8: .4byte gCurrentLevel
_0802F5DC: .4byte gUnknown_080D6F0E
_0802F5E0: .4byte gUnknown_030054B8
_0802F5E4: .4byte gGameMode
_0802F5E8: .4byte gUnknown_080D6F44
_0802F5EC: .4byte 0x0000FFE0
_0802F5F0:
	asrs r0, r2, #0x1a
	cmp r7, r0
	bne _0802F5FE
	ldrh r0, [r4, #0x38]
	strh r0, [r5, #0xa]
	ldrh r1, [r4, #0x3a]
	b _0802F60E
_0802F5FE:
	lsls r1, r1, #1
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r0, r4, #4
	adds r1, r1, r0
	ldrh r1, [r1]
_0802F60E:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r3, [r5, #0x10]
	adds r0, r5, #0
	str r3, [sp, #0x30]
	bl sub_8004558
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #8
	bls _0802F5A8
_0802F652:
	ldr r0, _0802F73C @ =sub_80302AC
	movs r2, #0x89
	lsls r2, r2, #6
	ldr r1, _0802F740 @ =sub_8030474
	str r1, [sp]
	movs r1, #0xc4
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #8]
	str r2, [r1]
	ldr r4, _0802F744 @ =gUnknown_080D6F80
	ldrh r0, [r4]
	lsls r0, r0, #2
	bl VramMalloc
	adds r6, r0, #0
	movs r7, #0
	movs r3, #0
	mov sl, r3
	movs r3, #0
	mov sb, r4
_0802F688:
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r0, r1, #4
	adds r0, #4
	mov r2, r8
	adds r5, r2, r0
	strh r3, [r5, #0x16]
	ldr r0, _0802F748 @ =0x0000FFE0
	strh r0, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r0, r4, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r2, r5, #0
	adds r2, #0x20
	strb r0, [r2]
	cmp r7, #3
	bne _0802F6C8
	ldr r0, _0802F74C @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802F6C8
	ldrh r0, [r4, #0x1a]
	strh r0, [r5, #0xa]
	ldrh r0, [r4, #0x1c]
	strb r0, [r2]
_0802F6C8:
	str r6, [r5, #4]
	mov r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r0, #0x80
	strh r0, [r5, #0x1a]
	strh r3, [r5, #8]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r2, sl
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r3, [r5, #0x10]
	adds r0, r5, #0
	str r3, [sp, #0x30]
	bl sub_8004558
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #3
	bls _0802F688
	ldr r0, _0802F750 @ =sub_8030404
	ldr r2, _0802F754 @ =0x000022F0
	ldr r1, _0802F758 @ =sub_8030458
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r3, [sp, #8]
	str r3, [r1]
	ldr r0, [sp, #4]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802F73C: .4byte sub_80302AC
_0802F740: .4byte sub_8030474
_0802F744: .4byte gUnknown_080D6F80
_0802F748: .4byte 0x0000FFE0
_0802F74C: .4byte gCurrentLevel
_0802F750: .4byte sub_8030404
_0802F754: .4byte 0x000022F0
_0802F758: .4byte sub_8030458

	thumb_func_start sub_802F75C
sub_802F75C: @ 0x0802F75C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802F7E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r5, [r6]
	adds r5, #1
	ldr r0, _0802F7E4 @ =gGameMode
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #2
	bhi _0802F7BA
	ldr r0, _0802F7E8 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r2, #3
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #2
	beq _0802F7BA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802F796
	ldr r0, _0802F7EC @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F7BA
_0802F796:
	cmp r1, #0x1d
	beq _0802F7BA
	ldr r0, _0802F7F0 @ =gPressedKeys
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0802F7BA
	ldr r2, _0802F7F4 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802F7F8 @ =0xFFEFFFFF
	ands r0, r1
	ldr r1, _0802F7FC @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r5, #0xc8
	movs r0, #1
	strb r0, [r6, #4]
_0802F7BA:
	str r5, [r6]
	ldr r0, _0802F800 @ =gUnknown_03005AF0
	ldr r1, [r0, #0x1c]
	ldr r2, _0802F804 @ =0xFFFFFE7F
	ands r1, r2
	str r1, [r0, #0x1c]
	cmp r5, #0x95
	bhi _0802F808
	ldr r2, _0802F7F4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	b _0802F82E
	.align 2, 0
_0802F7E0: .4byte gCurTask
_0802F7E4: .4byte gGameMode
_0802F7E8: .4byte gCurrentLevel
_0802F7EC: .4byte gUnknown_030054B0
_0802F7F0: .4byte gPressedKeys
_0802F7F4: .4byte gPlayer
_0802F7F8: .4byte 0xFFEFFFFF
_0802F7FC: .4byte 0xFFBFFFFF
_0802F800: .4byte gUnknown_03005AF0
_0802F804: .4byte 0xFFFFFE7F
_0802F808:
	cmp r5, #0x97
	bne _0802F81C
	ldr r0, _0802F814 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802F818 @ =0xFFEFFFFF
	b _0802F82A
	.align 2, 0
_0802F814: .4byte gPlayer
_0802F818: .4byte 0xFFEFFFFF
_0802F81C:
	adds r0, r5, #0
	subs r0, #0x96
	cmp r0, #0x10
	bhi _0802F82E
	ldr r0, _0802F8B0 @ =gPlayer
	ldr r1, [r0, #0x20]
	ldr r2, _0802F8B4 @ =0xFFBFFFFF
_0802F82A:
	ands r1, r2
	str r1, [r0, #0x20]
_0802F82E:
	ldr r0, _0802F8B8 @ =gUnknown_080D6FF0
	ldr r7, _0802F8BC @ =gSelectedCharacter
	movs r4, #0
	ldrsb r4, [r7, r4]
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, #0xc8
	subs r0, r0, r1
	cmp r5, r0
	bne _0802F8D8
	ldr r0, _0802F8C0 @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F8D8
	ldr r0, _0802F8C4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0802F8D8
	ldr r3, _0802F8B0 @ =gPlayer
	ldr r2, _0802F8C8 @ =gUnknown_080D6FA0
	lsls r0, r4, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #6]
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x90
	ldr r1, [r4]
	ldr r0, [r1, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #0xb
	orrs r0, r2
	str r0, [r1, #0x1c]
	adds r0, r3, #0
	adds r0, #0x94
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	orrs r0, r2
	str r0, [r1, #0x1c]
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #2
	bls _0802F8D0
	ldr r1, [r4]
	ldr r0, _0802F8CC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #0x31
	strb r0, [r1]
	b _0802F8D8
	.align 2, 0
_0802F8B0: .4byte gPlayer
_0802F8B4: .4byte 0xFFBFFFFF
_0802F8B8: .4byte gUnknown_080D6FF0
_0802F8BC: .4byte gSelectedCharacter
_0802F8C0: .4byte gUnknown_030055B0
_0802F8C4: .4byte gCurrentLevel
_0802F8C8: .4byte gUnknown_080D6FA0
_0802F8CC: .4byte 0x04000128
_0802F8D0:
	ldr r0, [r4]
	adds r0, #0x31
	movs r1, #0
	strb r1, [r0]
_0802F8D8:
	cmp r5, #0xc8
	bhi _0802F8DE
	b _0802F9E6
_0802F8DE:
	ldr r4, _0802F924 @ =gUnknown_03005424
	ldrh r0, [r4]
	ldr r3, _0802F928 @ =0x0000FEFF
	ands r3, r0
	strh r3, [r4]
	ldr r1, _0802F92C @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #2
	beq _0802F90A
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802F906
	ldr r0, _0802F930 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F90A
_0802F906:
	cmp r1, #0x1d
	bne _0802F988
_0802F90A:
	ldrb r0, [r5]
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0x1c
	bne _0802F938
	ldr r0, _0802F934 @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F962
	movs r0, #0
	bl sub_8039EA4
	b _0802F962
	.align 2, 0
_0802F924: .4byte gUnknown_03005424
_0802F928: .4byte 0x0000FEFF
_0802F92C: .4byte gCurrentLevel
_0802F930: .4byte gUnknown_030054B0
_0802F934: .4byte gUnknown_030055B0
_0802F938:
	cmp r2, #0x1d
	bne _0802F958
	movs r0, #8
	bl sub_8039EA4
	ldr r0, _0802F954 @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0802F962
	.align 2, 0
_0802F954: .4byte gDispCnt
_0802F958:
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_8039EA4
_0802F962:
	ldr r2, _0802F978 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802F97C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r2, _0802F980 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _0802F984 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2]
	b _0802F9AC
	.align 2, 0
_0802F978: .4byte gPlayer
_0802F97C: .4byte 0xFFDFFFFF
_0802F980: .4byte gUnknown_03005424
_0802F984: .4byte 0x0000FFFE
_0802F988:
	ldr r0, _0802F998 @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F99C
	ldrb r0, [r6, #4]
	bl CreateCourseStartCountdown
	b _0802F9AC
	.align 2, 0
_0802F998: .4byte gUnknown_030055B0
_0802F99C:
	ldr r2, _0802F9BC @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0802F9C0 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, _0802F9C4 @ =0x0000FFFE
	ands r0, r3
	strh r0, [r4]
_0802F9AC:
	ldr r0, _0802F9C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0802F9CC
	bl sub_8018818
	b _0802F9D6
	.align 2, 0
_0802F9BC: .4byte gPlayer
_0802F9C0: .4byte 0xFFDFFFFF
_0802F9C4: .4byte 0x0000FFFE
_0802F9C8: .4byte gGameMode
_0802F9CC:
	ldr r0, _0802F9EC @ =gUnknown_03005AF0
	ldr r1, [r0, #0x1c]
	ldr r2, _0802F9F0 @ =0xFFFBFFFF
	ands r1, r2
	str r1, [r0, #0x1c]
_0802F9D6:
	bl sub_802C9E4
	ldr r0, _0802F9F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_801583C
_0802F9E6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F9EC: .4byte gUnknown_03005AF0
_0802F9F0: .4byte 0xFFFBFFFF
_0802F9F4: .4byte gCurTask

	thumb_func_start sub_802F9F8
sub_802F9F8: @ 0x0802F9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0802FB04 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _0802FB08 @ =IWRAM_START+4
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp]
	ldr r5, [r1]
	ldr r2, _0802FB0C @ =gDispCnt
	ldrh r1, [r2]
	ldr r3, _0802FB10 @ =0x00001FFF
	adds r0, r3, #0
	ands r0, r1
	strh r0, [r2]
	cmp r5, #0x95
	bhi _0802FA30
	b _0802FC5C
_0802FA30:
	subs r5, #0x96
	cmp r5, #0xf
	bls _0802FA38
	movs r5, #0x10
_0802FA38:
	lsls r0, r5, #9
	ldr r1, [sp, #4]
	strh r0, [r1, #4]
	lsls r0, r5, #0x19
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _0802FA4C
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1, #4]
_0802FA4C:
	ldr r0, _0802FB14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802FB28
	movs r6, #0
	ldr r3, _0802FB18 @ =gUnknown_080D6FF5
	mov ip, r3
	ldr r0, _0802FB1C @ =gObjPalette
	mov sb, r0
	mov r8, ip
	movs r1, #2
	add r1, ip
	mov sl, r1
_0802FA66:
	lsls r3, r6, #1
	adds r7, r3, r6
	ldr r1, _0802FB20 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #4
	adds r2, r7, r2
	mov r1, r8
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r8
	adds r0, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r5, r1
	lsrs r1, r1, #4
	lsls r1, r1, #0x18
	add r2, sl
	ldrb r0, [r2]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	add r3, sb
	lsrs r0, r0, #0xe
	lsrs r1, r1, #0x13
	orrs r0, r1
	orrs r0, r4
	strh r0, [r3]
	ldr r3, _0802FB24 @ =gUnknown_030056A4
	ldr r0, [r3]
	cmp r0, #0
	beq _0802FAF8
	mov r0, ip
	adds r0, #0xf0
	adds r0, r7, r0
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, ip
	adds r0, #0xf1
	adds r0, r7, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	mov r0, ip
	adds r0, #0xf2
	adds r0, r7, r0
	ldrb r0, [r0]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0xe0
	lsls r1, r1, #1
	add r1, sb
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
_0802FAF8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FA66
	b _0802FC12
	.align 2, 0
_0802FB04: .4byte gCurTask
_0802FB08: .4byte IWRAM_START+4
_0802FB0C: .4byte gDispCnt
_0802FB10: .4byte 0x00001FFF
_0802FB14: .4byte gGameMode
_0802FB18: .4byte gUnknown_080D6FF5
_0802FB1C: .4byte gObjPalette
_0802FB20: .4byte gSelectedCharacter
_0802FB24: .4byte gUnknown_030056A4
_0802FB28:
	movs r2, #0
_0802FB2A:
	ldr r0, _0802FC34 @ =gMultiplayerConnections
	ldrb r1, [r0]
	asrs r1, r2
	movs r0, #1
	ands r1, r0
	adds r3, r2, #1
	mov sb, r3
	cmp r1, #0
	beq _0802FBA8
	movs r6, #0
	ldr r0, _0802FC38 @ =gUnknown_080D6FF5
	mov ip, r0
	lsls r1, r2, #4
	mov r8, r1
	mov r7, ip
	ldr r0, _0802FC3C @ =gMultiplayerCharacters
	adds r2, r2, r0
	mov ip, r2
	ldr r3, _0802FC40 @ =gObjPalette
	mov sl, r3
_0802FB52:
	lsls r3, r6, #1
	adds r3, r3, r6
	mov r0, ip
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r0, r3, r7
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r7, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	ldr r1, _0802FC44 @ =gUnknown_080D6FF7
	adds r3, r3, r1
	ldrb r0, [r3]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	mov r3, r8
	adds r1, r3, r6
	lsls r1, r1, #1
	add r1, sl
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FB52
_0802FBA8:
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0802FB2A
	ldr r3, _0802FC48 @ =gUnknown_030056A4
	ldr r0, [r3]
	cmp r0, #0
	beq _0802FC12
	movs r6, #0
	ldr r3, _0802FC38 @ =gUnknown_080D6FF5
	movs r0, #0xf2
	adds r0, r0, r3
	mov r8, r0
	ldr r7, _0802FC40 @ =gObjPalette
_0802FBC6:
	lsls r1, r6, #1
	adds r1, r1, r6
	adds r0, r3, #0
	adds r0, #0xf0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r4, #0
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r3, #0
	adds r0, #0xf1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	lsrs r2, r2, #4
	lsls r2, r2, #0x18
	add r1, r8
	ldrb r0, [r1]
	muls r0, r5, r0
	lsrs r0, r0, #4
	lsls r0, r0, #0x18
	adds r1, r6, #0
	adds r1, #0xe0
	lsls r1, r1, #1
	adds r1, r1, r7
	lsrs r0, r0, #0xe
	lsrs r2, r2, #0x13
	orrs r0, r2
	orrs r0, r4
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0802FBC6
_0802FC12:
	ldr r1, _0802FC4C @ =gFlags
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	ldr r3, _0802FC4C @ =gFlags
	str r0, [r3]
	ldr r0, _0802FC50 @ =0x00003FCF
	ldr r1, [sp, #4]
	strh r0, [r1, #8]
	ldr r0, [sp, #4]
	bl sub_802D4CC
	ldr r1, _0802FC54 @ =gWinRegs
	ldr r0, _0802FC58 @ =0x00001F3F
	strh r0, [r1, #8]
	movs r0, #0x1f
	b _0802FC70
	.align 2, 0
_0802FC34: .4byte gMultiplayerConnections
_0802FC38: .4byte gUnknown_080D6FF5
_0802FC3C: .4byte gMultiplayerCharacters
_0802FC40: .4byte gObjPalette
_0802FC44: .4byte gUnknown_080D6FF7
_0802FC48: .4byte gUnknown_030056A4
_0802FC4C: .4byte gFlags
_0802FC50: .4byte 0x00003FCF
_0802FC54: .4byte gWinRegs
_0802FC58: .4byte 0x00001F3F
_0802FC5C:
	ldr r0, _0802FCC0 @ =0x000030EF
	ldr r3, [sp, #4]
	strh r0, [r3, #8]
	ldr r0, [sp, #4]
	bl sub_802D4CC
	ldr r1, _0802FCC4 @ =gWinRegs
	ldr r0, _0802FCC8 @ =0x00003F3F
	strh r0, [r1, #8]
	ldr r0, _0802FCCC @ =0x00001010
_0802FC70:
	strh r0, [r1, #0xa]
	ldr r5, _0802FCD0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1d
	bne _0802FC86
	ldr r2, _0802FCC4 @ =gWinRegs
	ldrh r1, [r2, #8]
	ldr r0, _0802FCD4 @ =0x0000FFF9
	ands r0, r1
	strh r0, [r2, #8]
_0802FC86:
	ldr r1, [sp]
	ldr r0, [r1]
	cmp r0, #0xc7
	bls _0802FD0C
	ldr r4, _0802FCD8 @ =gBldRegs
	movs r0, #0
	strh r0, [r4, #4]
	strh r0, [r4]
	strh r0, [r4, #2]
	ldr r3, _0802FCC4 @ =gWinRegs
	ldr r2, _0802FCDC @ =0x0000F0F0
	strh r2, [r3]
	ldr r1, _0802FCE0 @ =0x0000A0A0
	strh r1, [r3, #4]
	strh r2, [r3, #2]
	strh r1, [r3, #6]
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1d
	beq _0802FCEC
	ldr r2, _0802FCE4 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0802FCE8 @ =0x00001FFF
	ands r0, r1
	strh r0, [r2]
	b _0802FD04
	.align 2, 0
_0802FCC0: .4byte 0x000030EF
_0802FCC4: .4byte gWinRegs
_0802FCC8: .4byte 0x00003F3F
_0802FCCC: .4byte 0x00001010
_0802FCD0: .4byte gCurrentLevel
_0802FCD4: .4byte 0x0000FFF9
_0802FCD8: .4byte gBldRegs
_0802FCDC: .4byte 0x0000F0F0
_0802FCE0: .4byte 0x0000A0A0
_0802FCE4: .4byte gDispCnt
_0802FCE8: .4byte 0x00001FFF
_0802FCEC:
	ldr r2, _0802FD1C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0802FD20 @ =0x000099FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0802FD24 @ =0x00003735
	strh r0, [r3, #0xa]
	ldr r0, _0802FD28 @ =0x00001346
	strh r0, [r4]
	ldr r0, _0802FD2C @ =0x00000404
	strh r0, [r4, #2]
	strh r0, [r4, #4]
_0802FD04:
	ldr r0, _0802FD30 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0802FD0C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FD1C: .4byte gDispCnt
_0802FD20: .4byte 0x000099FF
_0802FD24: .4byte 0x00003735
_0802FD28: .4byte 0x00001346
_0802FD2C: .4byte 0x00000404
_0802FD30: .4byte gCurTask

	thumb_func_start sub_802FD34
sub_802FD34: @ 0x0802FD34
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802FD90 @ =gCurTask
	ldr r0, [r0]
	mov ip, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0802FD94 @ =IWRAM_START + 0x10
	adds r4, r1, r2
	ldr r3, _0802FD98 @ =IWRAM_START + 0x14
	adds r6, r1, r3
	ldr r5, [r0]
	cmp r5, #1
	bls _0802FE1C
	subs r2, r5, #1
	movs r3, #0
	strh r3, [r4, #2]
	movs r0, #0xa0
	strh r0, [r4]
	movs r7, #0x80
	lsls r7, r7, #2
	strh r7, [r6, #2]
	strh r3, [r6]
	cmp r2, #9
	bhi _0802FD9C
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	rsbs r0, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r4, #2]
	movs r0, #0x58
	strh r0, [r4]
	cmp r2, #6
	bls _0802FE1C
	subs r2, r5, #7
	strh r7, [r6, #2]
	lsls r0, r2, #2
	adds r0, r0, r2
	strh r0, [r6]
	b _0802FE1C
	.align 2, 0
_0802FD90: .4byte gCurTask
_0802FD94: .4byte IWRAM_START + 0x10
_0802FD98: .4byte IWRAM_START + 0x14
_0802FD9C:
	cmp r5, #0x77
	bhi _0802FDB4
	ldr r0, _0802FDB0 @ =0x0000021E
	strh r0, [r4, #2]
	movs r0, #0x89
	strh r0, [r4]
	strh r7, [r6, #2]
	movs r0, #0x10
	strh r0, [r6]
	b _0802FE1C
	.align 2, 0
_0802FDB0: .4byte 0x0000021E
_0802FDB4:
	cmp r5, #0x87
	bhi _0802FDE4
	adds r2, r5, #0
	subs r2, #0x78
	lsls r1, r2, #3
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r3, _0802FDE0 @ =0x0000021E
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r4, #2]
	lsls r0, r2, #1
	rsbs r0, r0, #0
	adds r0, #0x89
	strh r0, [r4]
	lsls r0, r2, #4
	subs r0, r7, r0
	strh r0, [r6, #2]
	adds r0, r5, #0
	subs r0, #0x68
	strh r0, [r6]
	b _0802FE1C
	.align 2, 0
_0802FDE0: .4byte 0x0000021E
_0802FDE4:
	cmp r5, #0x95
	bls _0802FE00
	ldr r0, _0802FDFC @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	mov r0, ip
	bl TaskDestroy
	b _0802FE70
	.align 2, 0
_0802FDFC: .4byte gFlags
_0802FE00:
	adds r2, r5, #0
	subs r2, #0x88
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	movs r7, #0x88
	lsls r7, r7, #2
	adds r1, r7, #0
	subs r1, r1, r0
	strh r1, [r4, #2]
	lsls r0, r2, #3
	subs r0, r0, r2
	strh r0, [r4]
	strh r3, [r6, #2]
_0802FE1C:
	ldr r1, _0802FE50 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0802FE54 @ =gUnknown_03002878
	ldr r0, _0802FE58 @ =0x04000040
	str r0, [r1]
	ldr r2, _0802FE5C @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	cmp r5, #0xa
	bls _0802FE60
	ldrb r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_802DDC4
	ldrb r0, [r6]
	ldrh r1, [r6, #2]
	bl sub_802DF18
	b _0802FE70
	.align 2, 0
_0802FE50: .4byte gUnknown_03002A80
_0802FE54: .4byte gUnknown_03002878
_0802FE58: .4byte 0x04000040
_0802FE5C: .4byte gFlags
_0802FE60:
	ldrb r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_802DBC0
	ldrb r0, [r6]
	ldrh r1, [r6, #2]
	bl sub_802DF18
_0802FE70:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802FE78
sub_802FE78: @ 0x0802FE78
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0802FF70 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _0802FF74 @ =IWRAM_START + 0x1B4
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80051E8
	movs r6, #0
	ldr r1, _0802FF78 @ =IWRAM_START + 0x205
	adds r5, r4, r1
	ldr r0, _0802FF7C @ =IWRAM_START + 0x1E4
	adds r4, r4, r0
_0802FEA6:
	movs r0, #0xff
	strb r0, [r5]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r5, #0x30
	adds r4, #0x30
	adds r6, #1
	cmp r6, #3
	bls _0802FEA6
	ldr r0, _0802FF80 @ =gGameMode
	ldrb r0, [r0]
	mov r1, r8
	lsls r1, r1, #1
	mov sb, r1
	cmp r0, #2
	bhi _0802FEE0
	movs r6, #0
	adds r4, r7, #4
_0802FED2:
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r6, #1
	cmp r6, #8
	bls _0802FED2
_0802FEE0:
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r5, r7, r0
	mov r1, r8
	cmp r1, #0x1d
	bls _0802FF0C
	cmp r1, #0x1e
	bne _0802FF06
	ldr r0, _0802FF84 @ =0x0000045B
	strh r0, [r5, #0xa]
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0802FF88 @ =0x000002C5
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
_0802FF06:
	adds r0, r5, #0
	bl sub_8004558
_0802FF0C:
	adds r0, r5, #0
	bl sub_80051E8
	movs r1, #0xb5
	lsls r1, r1, #2
	adds r5, r7, r1
	movs r0, #0xc1
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r2, _0802FF8C @ =gSineTable
	mov r0, sb
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _0802FF90 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x16
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r1, r2
	bne _0802FF3E
	movs r1, #0xff
_0802FF3E:
	cmp r1, #0
	bne _0802FF44
	movs r1, #4
_0802FF44:
	movs r0, #0
	strh r0, [r4]
	strh r1, [r4, #2]
	strh r2, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF70: .4byte gCurTask
_0802FF74: .4byte IWRAM_START + 0x1B4
_0802FF78: .4byte IWRAM_START + 0x205
_0802FF7C: .4byte IWRAM_START + 0x1E4
_0802FF80: .4byte gGameMode
_0802FF84: .4byte 0x0000045B
_0802FF88: .4byte 0x000002C5
_0802FF8C: .4byte gSineTable
_0802FF90: .4byte 0x000003FF

	thumb_func_start sub_802FF94
sub_802FF94: @ 0x0802FF94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0802FFC8 @ =gCurTask
	ldr r1, [r0]
	ldrh r6, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0
	ldr r0, [r0]
	ldr r3, [r0]
	adds r0, r3, #0
	subs r0, #0xa
	cmp r0, #0x7c
	bls _0803004E
	cmp r3, #0xc7
	bls _0802FFCC
	adds r0, r1, #0
	bl TaskDestroy
	b _0803029C
	.align 2, 0
_0802FFC8: .4byte gCurTask
_0802FFCC:
	cmp r3, #0x95
	bhi _0802FFD2
	b _0803029C
_0802FFD2:
	ldr r0, _08030018 @ =IWRAM_START + 0x1B4
	adds r5, r6, r0
	cmp r3, #0x96
	bne _08030030
	ldr r2, _0803001C @ =gUnknown_080D6FC8
	ldr r1, _08030020 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	movs r3, #0
	movs r4, #0
	strh r0, [r5, #0xa]
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r1, [r0, #6]
	ldr r2, _08030024 @ =IWRAM_START + 0x1D4
	adds r0, r6, r2
	strb r1, [r0]
	ldr r7, _08030028 @ =IWRAM_START + 0x1D9
	adds r0, r6, r7
	strb r3, [r0]
	ldr r0, _0803002C @ =IWRAM_START + 0x1D5
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xf0
	strh r0, [r5, #0x16]
	movs r0, #0xa0
	strh r0, [r5, #0x18]
	str r4, [r5, #0x10]
	b _08030040
	.align 2, 0
_08030018: .4byte IWRAM_START + 0x1B4
_0803001C: .4byte gUnknown_080D6FC8
_08030020: .4byte gSelectedCharacter
_08030024: .4byte IWRAM_START + 0x1D4
_08030028: .4byte IWRAM_START + 0x1D9
_0803002C: .4byte IWRAM_START + 0x1D5
_08030030:
	cmp r3, #0xbd
	bls _08030040
	ldrh r0, [r5, #0x16]
	adds r0, #4
	strh r0, [r5, #0x16]
	ldrh r0, [r5, #0x18]
	adds r0, #4
	strh r0, [r5, #0x18]
_08030040:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	b _0803029C
_0803004E:
	subs r3, #9
	ldr r1, _08030074 @ =IWRAM_START + 0x1B4
	adds r5, r6, r1
	cmp r3, #0xc
	bhi _08030078
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r1, #0xfe
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	b _080300A4
	.align 2, 0
_08030074: .4byte IWRAM_START + 0x1B4
_08030078:
	cmp r3, #0x64
	bhi _08030086
	movs r0, #0x18
	strh r0, [r5, #0x16]
	movs r0, #0x4a
	strh r0, [r5, #0x18]
	b _080300AE
_08030086:
	adds r2, r3, #0
	subs r2, #0x58
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r1, #0xfe
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
_080300A4:
	lsls r0, r0, #3
	lsrs r0, r0, #8
	movs r1, #0x79
	subs r1, r1, r0
	strh r1, [r5, #0x18]
_080300AE:
	movs r4, #0
	lsls r2, r3, #0x18
	str r2, [sp, #8]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	lsrs r0, r0, #8
	movs r7, #0x8e
	lsls r7, r7, #1
	mov r8, r7
	mov r1, r8
	subs r0, r1, r0
	mov sl, r0
	movs r6, #0
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #2
	subs r0, r0, r3
	lsls r0, r0, #3
	lsrs r0, r0, #8
	movs r7, #0x7f
	subs r0, r7, r0
	mov sb, r0
	adds r2, r3, #0
	subs r2, #0x58
_080300E4:
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r6, r1
	mov r1, ip
	adds r5, r1, r0
	cmp r3, #0xc
	bhi _080300FC
	mov r0, sl
	strh r0, [r5, #0x16]
	mov r1, sb
	strh r1, [r5, #0x18]
	b _0803012A
_080300FC:
	cmp r3, #0x64
	bhi _08030108
	movs r0, #0x36
	strh r0, [r5, #0x16]
	movs r0, #0x50
	b _08030128
_08030108:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #6
	lsrs r1, r1, #8
	mov r0, r8
	subs r1, r0, r1
	strh r1, [r5, #0x16]
	lsls r0, r2, #5
	subs r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	lsls r0, r0, #3
	lsrs r0, r0, #8
	subs r0, r7, r0
_08030128:
	strh r0, [r5, #0x18]
_0803012A:
	cmp r4, #3
	bne _08030134
	ldrh r0, [r5, #0x16]
	subs r0, #0x18
	strh r0, [r5, #0x16]
_08030134:
	adds r6, #0x30
	adds r4, #1
	cmp r4, #3
	bls _080300E4
	ldr r1, [sp, #8]
	lsrs r2, r1, #0x18
	movs r4, #0
	movs r7, #1
	mov r8, r7
	movs r0, #0x14
	mov sl, r0
	movs r1, #0xc
	mov sb, r1
	adds r0, r3, #0
	subs r0, #0x64
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #1
	subs r1, #0x16
	str r1, [sp, #0xc]
	adds r6, r2, #0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r7, sl
	subs r7, r7, r1
	str r7, [sp]
	mov r0, sb
	subs r0, r0, r1
	str r0, [sp, #4]
_08030170:
	movs r0, #8
	subs r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, #4
	mov r7, ip
	adds r5, r7, r1
	lsls r1, r0, #4
	adds r1, r1, r0
	adds r1, #0x43
	strh r1, [r5, #0x16]
	movs r0, #0x16
	rsbs r0, r0, #0
	strh r0, [r5, #0x18]
	cmp r2, #0x31
	bhi _080301C8
	lsls r1, r4, #1
	cmp r2, r1
	blo _080301F8
	adds r0, r4, #0
	mov r7, r8
	ands r0, r7
	cmp r0, #0
	bne _080301B2
	cmp r6, #4
	bhi _080301AC
	mov r0, sp
	ldrh r0, [r0, #0xc]
	b _080301F6
_080301AC:
	mov r1, sl
	strh r1, [r5, #0x18]
	b _080301F8
_080301B2:
	subs r1, r2, r1
	cmp r1, #4
	bhi _080301C2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0x16
	b _080301F6
_080301C2:
	mov r7, sb
	strh r7, [r5, #0x18]
	b _080301F8
_080301C8:
	cmp r3, #0x63
	bhi _080301E0
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080301DC
	mov r7, sl
	strh r7, [r5, #0x18]
	b _080301F8
_080301DC:
	mov r0, sb
	b _080301F6
_080301E0:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080301F2
	mov r7, sp
	ldrh r7, [r7]
	strh r7, [r5, #0x18]
	b _080301F8
_080301F2:
	mov r0, sp
	ldrh r0, [r0, #4]
_080301F6:
	strh r0, [r5, #0x18]
_080301F8:
	ldr r1, [sp, #0xc]
	subs r1, #0x14
	str r1, [sp, #0xc]
	subs r6, #2
	adds r4, #1
	cmp r4, #8
	bls _08030170
	movs r5, #0xa9
	lsls r5, r5, #2
	add r5, ip
	movs r0, #0x24
	strh r0, [r5, #0x16]
	cmp r3, #0x10
	bhi _0803021C
	ldr r0, _08030218 @ =0x0000FFD0
	b _08030240
	.align 2, 0
_08030218: .4byte 0x0000FFD0
_0803021C:
	cmp r3, #0x19
	bhi _0803022C
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	subs r0, #0x28
	b _08030240
_0803022C:
	cmp r3, #0x64
	bhi _08030234
	movs r0, #0x20
	b _08030240
_08030234:
	adds r1, r3, #0
	subs r1, #0x64
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	movs r0, #0x20
	subs r0, r0, r1
_08030240:
	strh r0, [r5, #0x18]
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, ip
	ldr r2, _08030268 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	movs r0, #0x23
	strh r0, [r5, #0x16]
	cmp r3, #0x10
	bhi _08030270
	ldr r0, _0803026C @ =0x0000FFCF
	b _08030296
	.align 2, 0
_08030268: .4byte gUnknown_030054B8
_0803026C: .4byte 0x0000FFCF
_08030270:
	cmp r3, #0x19
	bhi _08030280
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	subs r0, #0x29
	b _08030296
_08030280:
	cmp r3, #0x64
	bhi _0803028A
	strh r0, [r5, #0x16]
	movs r0, #0x20
	b _08030296
_0803028A:
	adds r1, r3, #0
	subs r1, #0x64
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x15
	movs r0, #0x20
	subs r0, r0, r1
_08030296:
	strh r0, [r5, #0x18]
	bl sub_802FE78
_0803029C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80302AC
sub_80302AC: @ 0x080302AC
	push {r4, r5, r6, r7, lr}
	ldr r1, _080302D4 @ =gCurTask
	ldr r2, [r1]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r3, [r0]
	adds r0, r3, #0
	subs r0, #0x97
	mov ip, r1
	cmp r0, #0x27
	bls _080302D8
	cmp r3, #0xc7
	bls _080303BA
	adds r0, r2, #0
	bl TaskDestroy
	b _080303BA
	.align 2, 0
_080302D4: .4byte gCurTask
_080302D8:
	subs r3, #0x96
	cmp r3, #0xd
	bhi _0803031C
	movs r4, #0
	ldr r7, _08030310 @ =gCurrentLevel
	ldr r0, _08030314 @ =IWRAM_START + 0x1A
	adds r1, r5, r0
	ldr r5, _08030318 @ =gUnknown_080D7120
	movs r6, #0
_080302EA:
	subs r2, r3, r6
	cmp r2, #3
	ble _080302F2
	movs r2, #4
_080302F2:
	lsls r2, r2, #3
	ldrh r0, [r5]
	strh r0, [r1]
	adds r0, r2, #0
	subs r0, #0x20
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r5, #4
	adds r6, #3
	adds r4, #1
	cmp r4, #3
	bls _080302EA
	b _08030378
	.align 2, 0
_08030310: .4byte gCurrentLevel
_08030314: .4byte IWRAM_START + 0x1A
_08030318: .4byte gUnknown_080D7120
_0803031C:
	cmp r3, #0x11
	bhi _0803035C
	subs r3, #0xd
	ldr r1, _0803034C @ =gUnknown_080D7130
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r4, #0
	ldr r7, _08030350 @ =gCurrentLevel
	ldr r0, _08030354 @ =IWRAM_START + 0x1A
	adds r1, r5, r0
	ldr r3, _08030358 @ =gUnknown_080D7120
_08030336:
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r3, #4
	adds r4, #1
	cmp r4, #3
	bls _08030336
	b _08030378
	.align 2, 0
_0803034C: .4byte gUnknown_080D7130
_08030350: .4byte gCurrentLevel
_08030354: .4byte IWRAM_START + 0x1A
_08030358: .4byte gUnknown_080D7120
_0803035C:
	movs r4, #0
	ldr r7, _080303C0 @ =gCurrentLevel
	ldr r2, _080303C4 @ =IWRAM_START + 0x1A
	adds r1, r5, r2
	ldr r2, _080303C8 @ =gUnknown_080D7120
_08030366:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r2, #4
	adds r4, #1
	cmp r4, #3
	bls _08030366
_08030378:
	ldrb r1, [r7]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080303BA
	lsls r0, r1, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #7
	beq _080303BA
	mov r1, ip
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r5, r0, r2
	movs r4, #0
_08030398:
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r0, [r0]
	subs r0, #0x96
	cmp r1, r0
	bhs _080303B0
	lsls r0, r1, #4
	adds r0, #4
	adds r0, r5, r0
	bl sub_80051E8
_080303B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08030398
_080303BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080303C0: .4byte gCurrentLevel
_080303C4: .4byte IWRAM_START + 0x1A
_080303C8: .4byte gUnknown_080D7120

	thumb_func_start sub_80303CC
sub_80303CC: @ 0x080303CC
	push {lr}
	ldr r0, _080303F4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080303DE
	bl sub_8011328
_080303DE:
	ldr r0, _080303F8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080303F0
	ldr r2, _080303FC @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08030400 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
_080303F0:
	pop {r0}
	bx r0
	.align 2, 0
_080303F4: .4byte gCurrentLevel
_080303F8: .4byte gGameMode
_080303FC: .4byte gUnknown_03005424
_08030400: .4byte 0x0000FFDF

	thumb_func_start sub_8030404
sub_8030404: @ 0x08030404
	push {r4, lr}
	ldr r0, _08030444 @ =gCurTask
	ldr r4, [r0]
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	ldr r2, _08030448 @ =gBgPalette
	ldr r1, _0803044C @ =gUnknown_080D7116
	ldr r0, _08030450 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _08030454 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	cmp r3, #0xc7
	bls _0803043E
	adds r0, r4, #0
	bl TaskDestroy
_0803043E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030444: .4byte gCurTask
_08030448: .4byte gBgPalette
_0803044C: .4byte gUnknown_080D7116
_08030450: .4byte gSelectedCharacter
_08030454: .4byte gFlags

	thumb_func_start sub_8030458
sub_8030458: @ 0x08030458
	bx lr
	.align 2, 0

	thumb_func_start sub_803045C
sub_803045C: @ 0x0803045C
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08030470 @ =IWRAM_START + 0x1B8
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_08030470: .4byte IWRAM_START + 0x1B8

	thumb_func_start sub_8030474
sub_8030474: @ 0x08030474
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #8]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8030488
sub_8030488: @ 0x08030488
	push {r4, r5, lr}
	ldr r0, _080304D4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080304CE
	lsls r0, r1, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #7
	beq _080304CE
	ldr r0, _080304D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_080304AC:
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r0, [r0]
	subs r0, #0x96
	cmp r1, r0
	bhs _080304C4
	lsls r0, r1, #4
	adds r0, #4
	adds r0, r5, r0
	bl sub_80051E8
_080304C4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080304AC
_080304CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080304D4: .4byte gCurrentLevel
_080304D8: .4byte gCurTask

	thumb_func_start sub_80304DC
sub_80304DC: @ 0x080304DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	movs r7, #0
	ldr r0, _0803056C @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08030570 @ =gCourseTime
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08030574 @ =sub_8030A4C
	movs r1, #0xba
	lsls r1, r1, #1
	movs r2, #0xc1
	lsls r2, r2, #8
	ldr r3, _08030578 @ =sub_8031370
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r2, _0803057C @ =IWRAM_START + 0x168
	adds r1, r0, r2
	str r7, [r1]
	ldr r3, _08030580 @ =IWRAM_START + 0x170
	adds r0, r0, r3
	strb r7, [r0]
	mov r0, sl
	strh r7, [r0]
	movs r0, #1
	mov r1, sl
	strh r0, [r1, #2]
	adds r0, #0xff
	strh r0, [r1, #6]
	strh r7, [r1, #4]
	ldr r0, _08030584 @ =0x00003FFF
	strh r0, [r1, #8]
	strh r7, [r1, #0xa]
	ldr r0, _08030588 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08030594
	ldr r0, _0803058C @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08030594
	movs r0, #0x40
	mov r2, sl
	strh r0, [r2, #6]
	ldr r0, _08030590 @ =0x00003FBF
	strh r0, [r2, #8]
	b _080305B4
	.align 2, 0
_0803056C: .4byte gLoadedSaveGame
_08030570: .4byte gCourseTime
_08030574: .4byte sub_8030A4C
_08030578: .4byte sub_8031370
_0803057C: .4byte IWRAM_START + 0x168
_08030580: .4byte IWRAM_START + 0x170
_08030584: .4byte 0x00003FFF
_08030588: .4byte gPlayer
_0803058C: .4byte gUnknown_030054F4
_08030590: .4byte 0x00003FBF
_08030594:
	ldr r0, _080305C4 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080305B4
	ldr r0, _080305C8 @ =0x00003FAF
	mov r3, sl
	strh r0, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #4]
	mov r0, sl
	bl sub_802D4CC
_080305B4:
	ldr r0, _080305CC @ =0x00000707
	cmp r4, r0
	bhi _080305D4
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080305D0 @ =0x00013880
	b _0803069C
	.align 2, 0
_080305C4: .4byte gCurrentLevel
_080305C8: .4byte 0x00003FAF
_080305CC: .4byte 0x00000707
_080305D0: .4byte 0x00013880
_080305D4:
	ldr r0, _080305E4 @ =0x00000BB7
	cmp r4, r0
	bhi _080305EC
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080305E8 @ =0x0000C350
	b _0803069C
	.align 2, 0
_080305E4: .4byte 0x00000BB7
_080305E8: .4byte 0x0000C350
_080305EC:
	ldr r0, _080305FC @ =0x00000E0F
	cmp r4, r0
	bhi _08030604
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08030600 @ =0x00002710
	b _0803069C
	.align 2, 0
_080305FC: .4byte 0x00000E0F
_08030600: .4byte 0x00002710
_08030604:
	ldr r0, _08030614 @ =0x00001517
	cmp r4, r0
	bhi _0803061C
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08030618 @ =0x00001388
	b _0803069C
	.align 2, 0
_08030614: .4byte 0x00001517
_08030618: .4byte 0x00001388
_0803061C:
	ldr r0, _08030630 @ =0x00001C1F
	cmp r4, r0
	bhi _08030634
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #4
	b _0803069C
	.align 2, 0
_08030630: .4byte 0x00001C1F
_08030634:
	ldr r0, _08030644 @ =0x00002A2F
	cmp r4, r0
	bhi _0803064C
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _08030648 @ =0x00000BB8
	b _0803069C
	.align 2, 0
_08030644: .4byte 0x00002A2F
_08030648: .4byte 0x00000BB8
_0803064C:
	ldr r0, _08030660 @ =0x0000383F
	cmp r4, r0
	bhi _08030664
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #3
	b _0803069C
	.align 2, 0
_08030660: .4byte 0x0000383F
_08030664:
	ldr r0, _08030678 @ =0x0000464F
	cmp r4, r0
	bhi _0803067C
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #2
	b _0803069C
	.align 2, 0
_08030678: .4byte 0x0000464F
_0803067C:
	ldr r0, _08030690 @ =0x0000545F
	cmp r4, r0
	bhi _08030694
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xfa
	lsls r0, r0, #1
	b _0803069C
	.align 2, 0
_08030690: .4byte 0x0000545F
_08030694:
	movs r1, #0xae
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0
_0803069C:
	str r0, [r1]
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0x64
	muls r1, r6, r1
	str r1, [r0]
	cmp r5, #7
	bne _080306BC
	movs r1, #0xb2
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080306B8 @ =0x00002710
	b _080306CC
	.align 2, 0
_080306B8: .4byte 0x00002710
_080306BC:
	movs r1, #0xb2
	lsls r1, r1, #1
	add r1, sl
	lsls r0, r5, #5
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #3
_080306CC:
	str r0, [r1]
	movs r0, #0xb2
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0xb0
	lsls r1, r1, #1
	add r1, sl
	ldr r2, [r0]
	ldr r1, [r1]
	cmp r2, r1
	bls _080306F2
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sl
	ldr r0, [r0]
	cmp r2, r0
	bls _08030700
	adds r0, r2, #0
	b _08030700
_080306F2:
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sl
	ldr r0, [r0]
	cmp r1, r0
	bls _08030700
	adds r0, r1, #0
_08030700:
	movs r1, #0x64
	bl Div
	movs r1, #0xb6
	lsls r1, r1, #1
	add r1, sl
	str r0, [r1]
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, sl
	movs r0, #0
	mov sb, r0
	movs r6, #0
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	mov r2, r8
	strh r2, [r7, #0x16]
	movs r0, #0x50
	strh r0, [r7, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0x8c
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #0xa6
	lsls r0, r0, #1
	add r0, sl
	mov r3, sb
	strb r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	ldr r1, _08030888 @ =0x0000014D
	add r1, sl
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0x4f
	add r0, sl
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _0803088C @ =0x00000151
	add r0, sl
	strb r3, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	mov r7, sl
	adds r7, #0xc
	mov r3, r8
	strh r3, [r7, #0x16]
	movs r0, #0x29
	strh r0, [r7, #0x18]
	ldr r4, _08030890 @ =gUnknown_080D713C
	ldr r5, _08030894 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	mov r0, sl
	adds r0, #0x2c
	strb r1, [r0]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	mov r1, sl
	adds r1, #0x2d
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0x2e
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	mov r2, sb
	strb r2, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r5, _08030898 @ =gCurrentLevel
	ldrb r1, [r5]
	movs r0, #3
	ands r0, r1
	lsrs r0, r0, #1
	mov sb, r0
	adds r7, #0x30
	mov r0, r8
	strh r0, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r6, _0803089C @ =gUnknown_080D715A
	mov r1, sb
	lsls r4, r1, #1
	add r4, sb
	lsls r4, r4, #1
	adds r0, r4, r6
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r6, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r6, #4
	adds r4, r4, r0
	ldrh r0, [r4]
	mov r1, sl
	adds r1, #0x5c
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0x1c
	beq _08030836
	cmp r0, #0x1d
	bne _0803083E
_08030836:
	ldrh r0, [r6, #2]
	strh r0, [r7, #0xa]
	ldrh r0, [r6, #4]
	strb r0, [r1]
_0803083E:
	movs r2, #0
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, r7, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	mov r2, sb
	cmp r2, #0
	beq _080308A0
	ldr r0, _08030898 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _080308A8
	.align 2, 0
_08030888: .4byte 0x0000014D
_0803088C: .4byte 0x00000151
_08030890: .4byte gUnknown_080D713C
_08030894: .4byte gSelectedCharacter
_08030898: .4byte gCurrentLevel
_0803089C: .4byte gUnknown_080D715A
_080308A0:
	ldr r0, _080308F0 @ =gCurrentLevel
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
_080308A8:
	mov r7, sl
	adds r7, #0x6c
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r5, _080308F4 @ =gUnknown_080D7178
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r5, #4
	adds r4, r4, r0
	ldrh r0, [r4]
	mov r1, sl
	adds r1, #0x8c
	strb r0, [r1]
	ldr r0, _080308F0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _080308F8
	ldrh r0, [r5, #0x38]
	strh r0, [r7, #0xa]
	ldrh r0, [r5, #0x3a]
	b _08030906
	.align 2, 0
_080308F0: .4byte gCurrentLevel
_080308F4: .4byte gUnknown_080D7178
_080308F8:
	cmp r0, #0x1d
	bne _08030908
	ldrh r0, [r5, #0x3e]
	strh r0, [r7, #0xa]
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r0, [r0]
_08030906:
	strb r0, [r1]
_08030908:
	movs r2, #0
	movs r1, #0
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, r7, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r5, #0
	movs r6, #0
	mov sb, r4
	ldr r3, _080309DC @ =gUnknown_080D71BA
	mov r8, r3
_08030944:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r0, r4, #4
	adds r0, #0x9c
	mov r1, sl
	adds r7, r1, r0
	mov r2, sb
	strh r2, [r7, #0x16]
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, #0x4a
	strh r0, [r7, #0x18]
	lsls r4, r4, #1
	mov r3, r8
	adds r0, r4, r3
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r7, #4]
	mov r0, r8
	adds r0, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r0, _080309E0 @ =gUnknown_080D71BE
	adds r4, r4, r0
	ldrh r1, [r4]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	mov r1, sb
	strh r1, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r2, #1
	rsbs r2, r2, #0
	adds r4, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	movs r3, #0
	strb r3, [r0]
	adds r0, r2, #0
	str r0, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08030944
	ldr r0, _080309E4 @ =gUnknown_030054A8
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	ldr r0, _080309E8 @ =gCurrentLevel
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _080309F0
	ldr r0, _080309EC @ =0x00000193
	bl m4aSongNumStart
	b _08030A2E
	.align 2, 0
_080309DC: .4byte gUnknown_080D71BA
_080309E0: .4byte gUnknown_080D71BE
_080309E4: .4byte gUnknown_030054A8
_080309E8: .4byte gCurrentLevel
_080309EC: .4byte 0x00000193
_080309F0:
	cmp r0, #0x1d
	bne _080309FE
	movs r0, #0xca
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _08030A2E
_080309FE:
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _08030A28
	movs r0, #0xc9
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08030A24 @ =gPlayer
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #9
	bne _08030A2E
	movs r0, #0x20
	strh r0, [r1]
	b _08030A2E
	.align 2, 0
_08030A24: .4byte gPlayer
_08030A28:
	ldr r0, _08030A48 @ =0x00000191
	bl m4aSongNumStart
_08030A2E:
	movs r0, #0xb6
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08030A48: .4byte 0x00000191

	thumb_func_start sub_8030A4C
sub_8030A4C: @ 0x08030A4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08030CF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r0, _08030CF4 @ =IWRAM_START + 0x168
	adds r3, r2, r0
	ldr r1, [r3]
	mov r8, r1
	movs r4, #1
	add r8, r4
	ldr r1, _08030CF8 @ =IWRAM_START + 0x16C
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r4, _08030CFC @ =0x00000135
	adds r0, r1, r4
	cmp r8, r0
	bls _08030A80
	movs r0, #0x9b
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
_08030A80:
	mov r1, r8
	str r1, [r3]
	ldr r0, _08030D00 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _08030A96
	ldr r1, _08030D04 @ =gBldRegs
	ldr r0, _08030D08 @ =0x00003FAF
	strh r0, [r1]
_08030A96:
	mov r3, r8
	cmp r3, #0x95
	bhi _08030A9E
	b _08030D3E
_08030A9E:
	ldr r4, _08030D0C @ =IWRAM_START + 0x160
	adds r1, r2, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _08030AEE
	subs r0, #0x64
	str r0, [r1]
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030AEE
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030AEE
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030AEC
	movs r0, #0xff
_08030AEC:
	strb r0, [r1]
_08030AEE:
	movs r3, #0xb2
	lsls r3, r3, #1
	adds r1, r7, r3
	ldr r0, [r1]
	cmp r0, #0
	beq _08030B40
	subs r0, #0x64
	str r0, [r1]
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030B40
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030B40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030B3E
	movs r0, #0xff
_08030B3E:
	strb r0, [r1]
_08030B40:
	movs r0, #0xae
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _08030B92
	subs r0, #0x64
	str r0, [r1]
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030B92
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030B92
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030B90
	movs r0, #0xff
_08030B90:
	strb r0, [r1]
_08030B92:
	ldr r0, _08030D00 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08030BA2
	b _08030CB8
_08030BA2:
	ldr r0, _08030D20 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08030BB0
	b _08030CB8
_08030BB0:
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r3, #0xb0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030BF8
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030BF8
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r4, [r1]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030BF6
	movs r0, #0xff
_08030BF6:
	strb r0, [r1]
_08030BF8:
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xb2
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030C40
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030C40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030C3E
	movs r0, #0xff
_08030C3E:
	strb r0, [r1]
_08030C40:
	ldr r1, _08030D10 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r0, [r0]
	adds r0, r5, r0
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08030C88
	ldr r0, _08030D18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08030C88
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08030D1C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08030C86
	movs r0, #0xff
_08030C86:
	strb r0, [r1]
_08030C88:
	movs r3, #0xb0
	lsls r3, r3, #1
	adds r0, r7, r3
	movs r1, #0
	str r1, [r0]
	movs r4, #0xb2
	lsls r4, r4, #1
	adds r0, r7, r4
	str r1, [r0]
	movs r2, #0xae
	lsls r2, r2, #1
	adds r0, r7, r2
	str r1, [r0]
	adds r3, #0xc
	adds r0, r7, r3
	ldr r0, [r0]
	adds r0, #0x95
	cmp r8, r0
	bhs _08030CB8
	mov r8, r0
	adds r4, #4
	adds r0, r7, r4
	mov r1, r8
	str r1, [r0]
_08030CB8:
	ldr r0, _08030D24 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08030D3E
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _08030CE8
	movs r3, #0xb2
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	cmp r0, #0
	bne _08030CE8
	movs r4, #0xae
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _08030D28
_08030CE8:
	movs r0, #0x8c
	bl m4aSongNumStart
	b _08030D3E
	.align 2, 0
_08030CF0: .4byte gCurTask
_08030CF4: .4byte IWRAM_START + 0x168
_08030CF8: .4byte IWRAM_START + 0x16C
_08030CFC: .4byte 0x00000135
_08030D00: .4byte gCurrentLevel
_08030D04: .4byte gBldRegs
_08030D08: .4byte 0x00003FAF
_08030D0C: .4byte IWRAM_START + 0x160
_08030D10: .4byte gUnknown_03005450
_08030D14: .4byte 0x0000C350
_08030D18: .4byte gGameMode
_08030D1C: .4byte gNumLives
_08030D20: .4byte gPressedKeys
_08030D24: .4byte gUnknown_03005590
_08030D28:
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08030D3E
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x8d
	bl m4aSongNumStart
_08030D3E:
	movs r1, #0xb6
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	ldr r2, _08030DA4 @ =0x00000135
	adds r0, r0, r2
	cmp r8, r0
	bhi _08030D50
	b _0803109C
_08030D50:
	ldr r4, _08030DA8 @ =gCurrentLevel
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	bne _08030DD0
	ldr r0, _08030DAC @ =gMPlayInfo_BGM
	ldr r5, _08030DB0 @ =0x0000FFFF
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _08030D68
	b _0803106C
_08030D68:
	ldr r0, _08030DB4 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _08030DB8 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	movs r1, #0x1d
	strb r1, [r0]
	bl WriteSaveGame
	movs r0, #0
	adds r1, r5, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08030DBC @ =gUnknown_03002AE4
	ldr r0, _08030DC0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08030DC4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08030DC8 @ =gVramGraphicsCopyCursor
	ldr r0, _08030DCC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl StartEndingCutScenes
	b _080310E6
	.align 2, 0
_08030DA4: .4byte 0x00000135
_08030DA8: .4byte gCurrentLevel
_08030DAC: .4byte gMPlayInfo_BGM
_08030DB0: .4byte 0x0000FFFF
_08030DB4: .4byte gLoadedSaveGame
_08030DB8: .4byte gSelectedCharacter
_08030DBC: .4byte gUnknown_03002AE4
_08030DC0: .4byte gUnknown_0300287C
_08030DC4: .4byte gUnknown_03005390
_08030DC8: .4byte gVramGraphicsCopyCursor
_08030DCC: .4byte gVramGraphicsCopyQueueIndex
_08030DD0:
	cmp r0, #0x1d
	bne _08030E40
	ldr r0, _08030E1C @ =gMPlayInfo_BGM
	ldr r3, _08030E20 @ =0x0000FFFF
	ldrh r5, [r0, #4]
	cmp r5, #0
	beq _08030DE0
	b _0803106C
_08030DE0:
	adds r2, #1
	strb r2, [r4]
	ldr r0, _08030E24 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _08030E28 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	strb r2, [r0]
	movs r0, #0
	adds r1, r3, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08030E2C @ =gUnknown_03002AE4
	ldr r0, _08030E30 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08030E34 @ =gUnknown_03005390
	strb r5, [r0]
	ldr r1, _08030E38 @ =gVramGraphicsCopyCursor
	ldr r0, _08030E3C @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl StartEndingCutScenes
_08030E16:
	bl WriteSaveGame
	b _080310E6
	.align 2, 0
_08030E1C: .4byte gMPlayInfo_BGM
_08030E20: .4byte 0x0000FFFF
_08030E24: .4byte gLoadedSaveGame
_08030E28: .4byte gSelectedCharacter
_08030E2C: .4byte gUnknown_03002AE4
_08030E30: .4byte gUnknown_0300287C
_08030E34: .4byte gUnknown_03005390
_08030E38: .4byte gVramGraphicsCopyCursor
_08030E3C: .4byte gVramGraphicsCopyQueueIndex
_08030E40:
	adds r0, r7, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08030E50
	b _0803106C
_08030E50:
	ldr r6, _08030ED0 @ =gBldRegs
	movs r3, #0
	mov r8, r3
	movs r7, #0x10
	strh r7, [r6, #4]
	ldr r5, _08030ED4 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r5, #0x20]
	ldrb r1, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08030E72
	b _08030F74
_08030E72:
	ldr r1, _08030ED8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08030EDC @ =gUnknown_03002AE4
	ldr r0, _08030EE0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08030EE4 @ =gUnknown_03005390
	movs r7, #0
	mov r1, r8
	strb r1, [r0]
	ldr r1, _08030EE8 @ =gVramGraphicsCopyCursor
	ldr r0, _08030EEC @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r4]
	adds r5, r0, #1
	strb r5, [r4]
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldr r6, _08030EF0 @ =gLoadedSaveGame
	ldr r0, [r6]
	ldr r3, _08030EF4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, #7
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	ble _08030F6A
	strb r5, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08030F54
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r0, #1
	asrs r0, r0, #2
	cmp r0, #2
	beq _08030F10
	cmp r0, #2
	bgt _08030EF8
	cmp r0, #0
	beq _08030EFE
	b _08030F34
	.align 2, 0
_08030ED0: .4byte gBldRegs
_08030ED4: .4byte gPlayer
_08030ED8: .4byte 0x0000FFFF
_08030EDC: .4byte gUnknown_03002AE4
_08030EE0: .4byte gUnknown_0300287C
_08030EE4: .4byte gUnknown_03005390
_08030EE8: .4byte gVramGraphicsCopyCursor
_08030EEC: .4byte gVramGraphicsCopyQueueIndex
_08030EF0: .4byte gLoadedSaveGame
_08030EF4: .4byte gSelectedCharacter
_08030EF8:
	cmp r0, #4
	beq _08030F22
	b _08030F34
_08030EFE:
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #0
	bl CreateCharacterUnlockCutScene
	b _08030E16
_08030F10:
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	movs r2, #4
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #2
	bl CreateCharacterUnlockCutScene
	b _08030E16
_08030F22:
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #1
	bl CreateCharacterUnlockCutScene
	b _08030E16
_08030F34:
	ldr r0, _08030F48 @ =gCurrentLevel
	ldrb r0, [r0]
	ldr r1, _08030F4C @ =gLoadedSaveGame
	ldr r1, [r1]
	ldr r2, _08030F50 @ =gSelectedCharacter
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	b _08030F5C
	.align 2, 0
_08030F48: .4byte gCurrentLevel
_08030F4C: .4byte gLoadedSaveGame
_08030F50: .4byte gSelectedCharacter
_08030F54:
	ldrb r0, [r4]
	ldr r1, [r6]
	movs r2, #0
	ldrsb r2, [r3, r2]
_08030F5C:
	adds r1, #7
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #1
	bl CreateCourseSelectionScreen
	b _08030E16
_08030F6A:
	ldrb r0, [r4]
	movs r2, #4
	bl CreateCourseSelectionScreen
	b _08030E16
_08030F74:
	adds r3, r1, #1
	strb r3, [r4]
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldr r0, _08031000 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r1, _08031004 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #7
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r2, r4
	ble _08030F94
	strb r3, [r0]
_08030F94:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08031030
	ldr r0, _08031008 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _08031030
	ldr r1, _0803100C @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08031010 @ =gUnknown_03002AE4
	ldr r0, _08031014 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08031018 @ =gUnknown_03005390
	mov r1, r8
	strb r1, [r0]
	ldr r1, _0803101C @ =gVramGraphicsCopyCursor
	ldr r0, _08031020 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	bl CreateSpecialStage
	ldr r2, _08031024 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _08031028 @ =gWinRegs
	movs r0, #0xf0
	strh r0, [r2]
	movs r0, #0xa0
	strh r0, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0x3f
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r2, #0xa]
	ldr r0, _0803102C @ =0x00003FBF
	strh r0, [r6]
	strh r7, [r6, #4]
	b _08030E16
	.align 2, 0
_08031000: .4byte gLoadedSaveGame
_08031004: .4byte gSelectedCharacter
_08031008: .4byte gUnknown_030054F4
_0803100C: .4byte 0x0000FFFF
_08031010: .4byte gUnknown_03002AE4
_08031014: .4byte gUnknown_0300287C
_08031018: .4byte gUnknown_03005390
_0803101C: .4byte gVramGraphicsCopyCursor
_08031020: .4byte gVramGraphicsCopyQueueIndex
_08031024: .4byte gDispCnt
_08031028: .4byte gWinRegs
_0803102C: .4byte 0x00003FBF
_08031030:
	ldr r1, _08031054 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08031058 @ =gUnknown_03002AE4
	ldr r0, _0803105C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08031060 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08031064 @ =gVramGraphicsCopyCursor
	ldr r0, _08031068 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl GameStageStart
	b _08030E16
	.align 2, 0
_08031054: .4byte 0x0000FFFF
_08031058: .4byte gUnknown_03002AE4
_0803105C: .4byte gUnknown_0300287C
_08031060: .4byte gUnknown_03005390
_08031064: .4byte gVramGraphicsCopyCursor
_08031068: .4byte gVramGraphicsCopyQueueIndex
_0803106C:
	ldr r4, _08031094 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0803109C
	ldr r0, _08031098 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0803109C
	bl sub_80313D0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r4, #0x20]
	b _080310E6
	.align 2, 0
_08031094: .4byte gPlayer
_08031098: .4byte gUnknown_030054F4
_0803109C:
	bl sub_80310F0
	bl sub_8031314
	ldr r0, _080310D4 @ =gCurrentLevel
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080310E0
	movs r4, #0xb6
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0xf5
	cmp r8, r0
	bls _080310D8
	mov r0, r8
	subs r0, #0xf5
	subs r0, r0, r1
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	bl sub_8031138
	b _080310E6
	.align 2, 0
_080310D4: .4byte gCurrentLevel
_080310D8:
	movs r0, #0
	bl sub_8031138
	b _080310E6
_080310E0:
	movs r0, #0
	bl sub_8031138
_080310E6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80310F0
sub_80310F0: @ 0x080310F0
	push {lr}
	ldr r0, _08031114 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _08031118 @ =IWRAM_START + 0x168
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _0803111C @ =IWRAM_START + 0x12C
	adds r3, r1, r0
	cmp r2, #0xf
	bhi _08031120
	movs r0, #0x10
	subs r0, r0, r2
	lsls r1, r0, #4
	subs r1, r1, r0
	strh r1, [r3, #0x16]
	movs r0, #0x64
	b _08031130
	.align 2, 0
_08031114: .4byte gCurTask
_08031118: .4byte IWRAM_START + 0x168
_0803111C: .4byte IWRAM_START + 0x12C
_08031120:
	cmp r2, #0x17
	bhi _08031128
	movs r0, #0x64
	b _08031130
_08031128:
	cmp r2, #0x1c
	bhi _08031132
	ldrh r0, [r3, #0x18]
	subs r0, #7
_08031130:
	strh r0, [r3, #0x18]
_08031132:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8031138
sub_8031138: @ 0x08031138
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803118C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r2, _08031190 @ =IWRAM_START + 0x168
	adds r0, r1, r2
	ldr r7, [r0]
	cmp r7, #0x17
	bhi _08031198
	ldr r0, _08031194 @ =IWRAM_START + 0x12C
	adds r5, r1, r0
	movs r0, #0
	cmp r7, #0x10
	bhi _08031174
	movs r1, #0x10
	subs r1, r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
_08031174:
	movs r6, #0
	mov r1, r8
	subs r4, r0, r1
_0803117A:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _0803117A
	b _080311B2
	.align 2, 0
_0803118C: .4byte gCurTask
_08031190: .4byte IWRAM_START + 0x168
_08031194: .4byte IWRAM_START + 0x12C
_08031198:
	ldr r2, _08031214 @ =IWRAM_START + 0x12C
	adds r5, r1, r2
	movs r6, #0
	mov r0, r8
	rsbs r4, r0, #0
_080311A2:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _080311A2
_080311B2:
	cmp r7, #0x1c
	bls _080311F4
	ldr r0, _08031218 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r1, #3
	cmp r0, #2
	bne _080311C6
	movs r1, #2
_080311C6:
	movs r6, #0
	cmp r6, r1
	bhs _080311F4
	mov r4, sb
	adds r4, #0x22
	mov r0, sb
	adds r0, #0xc
_080311D4:
	adds r5, r0, #0
	ldrh r0, [r4]
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r4]
	adds r0, r5, #0
	str r1, [sp]
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r5, #0
	adds r0, #0x30
	adds r6, #1
	ldr r1, [sp]
	cmp r6, r1
	blo _080311D4
_080311F4:
	cmp r7, #0x26
	bls _0803124C
	mov r5, sb
	adds r5, #0x9c
	cmp r7, #0x37
	bhi _0803121C
	adds r0, r7, #0
	subs r0, #0x27
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803121E
	.align 2, 0
_08031214: .4byte IWRAM_START + 0x12C
_08031218: .4byte gCurrentLevel
_0803121C:
	movs r4, #0x30
_0803121E:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xae
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x5a
	movs r3, #0
	bl sub_802D170
_0803124C:
	cmp r7, #0x30
	bls _0803129C
	mov r5, sb
	adds r5, #0xcc
	cmp r7, #0x41
	bhi _0803126C
	adds r0, r7, #0
	subs r0, #0x31
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803126E
_0803126C:
	movs r4, #0x30
_0803126E:
	mov r2, r8
	subs r0, r4, r2
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x6e
	movs r3, #0
	bl sub_802D170
_0803129C:
	ldr r0, _080312D0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08031304
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1b
	bgt _08031304
	cmp r7, #0x3a
	bls _08031304
	mov r5, sb
	adds r5, #0xfc
	cmp r7, #0x4b
	bhi _080312D4
	adds r0, r7, #0
	subs r0, #0x3b
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080312D6
	.align 2, 0
_080312D0: .4byte gCurrentLevel
_080312D4:
	movs r4, #0x30
_080312D6:
	mov r2, r8
	subs r0, r4, r2
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb2
	lsls r0, r0, #1
	add r0, sb
	ldr r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	subs r2, #0x90
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x82
	movs r3, #0
	bl sub_802D170
_08031304:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8031314
sub_8031314: @ 0x08031314
	push {r4, r5, lr}
	ldr r0, _08031340 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _08031344 @ =IWRAM_START + 0x168
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0x1c
	bls _08031366
	cmp r0, #0x2c
	bhi _08031348
	subs r0, #0x1d
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r0, #0xf0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0803134A
	.align 2, 0
_08031340: .4byte gCurTask
_08031344: .4byte IWRAM_START + 0x168
_08031348:
	movs r0, #3
_0803134A:
	movs r3, #0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	ldr r2, _0803136C @ =gUnknown_080D71CC
	adds r1, r5, #0
	adds r1, #0xc
_08031356:
	ldrh r0, [r2]
	adds r0, r4, r0
	strh r0, [r1, #0x16]
	adds r2, #2
	adds r1, #0x30
	adds r3, #1
	cmp r3, #2
	bls _08031356
_08031366:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803136C: .4byte gUnknown_080D71CC

	thumb_func_start sub_8031370
sub_8031370: @ 0x08031370
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _080313C0 @ =IWRAM_START + 0x130
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080313B8
	bl VramFree
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	ldr r1, _080313C4 @ =IWRAM_START + 0xA0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080313C8 @ =IWRAM_START + 0xD0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080313CC @ =IWRAM_START + 0x100
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
_080313B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080313C0: .4byte IWRAM_START + 0x130
_080313C4: .4byte IWRAM_START + 0xA0
_080313C8: .4byte IWRAM_START + 0xD0
_080313CC: .4byte IWRAM_START + 0x100

	thumb_func_start sub_80313D0
sub_80313D0: @ 0x080313D0
	push {r4, r5, r6, lr}
	ldr r0, _08031428 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0803142C @ =IWRAM_START + 0x130
	adds r6, r5, r0
	ldr r0, [r6]
	cmp r0, #0
	beq _08031420
	bl VramFree
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x70]
	bl VramFree
	ldr r1, _08031430 @ =IWRAM_START + 0xA0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08031434 @ =IWRAM_START + 0xD0
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08031438 @ =IWRAM_START + 0x100
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	movs r0, #0
	str r0, [r6]
_08031420:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031428: .4byte gCurTask
_0803142C: .4byte IWRAM_START + 0x130
_08031430: .4byte IWRAM_START + 0xA0
_08031434: .4byte IWRAM_START + 0xD0
_08031438: .4byte IWRAM_START + 0x100
