.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global zoneLoadingCharacterLogos
zoneLoadingCharacterLogos:
    .2byte 9, 1114, 0   @ [CHARACTER_SONIC]    (Blue)
    .2byte 9, 1114, 3   @ [CHARACTER_CREAM]    (Orange)
    .2byte 9, 1114, 1   @ [CHARACTER_TAILS]    (Yellow)
    .2byte 9, 1114, 2   @ [CHARACTER_KNUCKLES] (Red)
    .2byte 9, 1114, 4   @ [CHARACTER_AMY]      (Pink)

    .global zoneLoadingZoneNames
zoneLoadingZoneNames:
  @ LEAF FOREST
    .2byte 35, 1117, 0
    .2byte 20, 1117, 1
    .2byte 20, 1117, 2
    .2byte 35, 1117, 3
  @ HOT CRATER
    .2byte 35, 1117, 4
    .2byte 20, 1117, 5
    .2byte 20, 1117, 6
    .2byte 35, 1117, 7
  @ MUSIC PLANT
    .2byte 35, 1117, 8
    .2byte 20, 1117, 9
    .2byte 20, 1117, 10
    .2byte 35, 1117, 11
  @ ICE PARADISE
    .2byte 35, 1117, 12
    .2byte 20, 1117, 13
    .2byte 20, 1117, 14
    .2byte 35, 1117, 15
  @ SKY CANYON
    .2byte 35, 1117, 16
    .2byte 20, 1117, 17
    .2byte 20, 1117, 18
    .2byte 35, 1117, 19
  @ TECHNO BASE
    .2byte 35, 1117, 20
    .2byte 20, 1117, 21
    .2byte 20, 1117, 22
    .2byte 35, 1117, 23
  @ EGG UTOPIA
    .2byte 35, 1117, 24
    .2byte 20, 1117, 25
    .2byte 20, 1117, 26
    .2byte 35, 1117, 27
  @ XX
    .2byte 35, 1117, 28
    .2byte 20, 1117, 29 @ (empty image)
    .2byte 20, 1117, 30 @ (empty image)
    .2byte 35, 1117, 31 @ (empty image)
  @ TRUE AREA 53
    .2byte 35, 1117, 32
    .2byte 20, 1117, 33
    .2byte 20, 1117, 34
    .2byte 35, 1117, 35
  @ BOSS ATTACK!
    .2byte 35, 1117, 36
    .2byte 20, 1117, 37
    .2byte 20, 1117, 38
    .2byte 35, 1117, 39

    @ Big icon showing the current zone during the stage loading screen.
    @ It is positioned inside the rotating wheel displayed in the upper left screen corner.
    .global zoneLoadingIcons
zoneLoadingIcons:   @ 0x080D6F0E
    .2byte 64, 1116, 0
    .2byte 64, 1116, 1
    .2byte 64, 1116, 2
    .2byte 64, 1116, 3
    .2byte 64, 1116, 4
    .2byte 64, 1116, 5
    .2byte 64, 1116, 6
    .2byte 64, 1116, 7
    .2byte 64, 1116, 8
    
    @ Small icons showing the unlocked stages during the stage loading screen
    .global zoneUnlockedIcons
zoneUnlockedIcons:  @ 0x080D6F44
    .2byte 9, 1118, 1
    .2byte 9, 1118, 2
    .2byte 9, 1118, 3
    .2byte 9, 1118, 4
    .2byte 9, 1118, 5
    .2byte 9, 1118, 6
    .2byte 9, 1118, 7
    .2byte 9, 1118, 8
    .2byte 9, 1118, 9
    .2byte 9, 1118, 0

    .global sZoneLoadingActLetters
sZoneLoadingActLetters:
    .2byte 18, 1112, 0      @ A
    .2byte 18, 1112, 1      @ C
    .2byte 18, 1112, 2      @ T
    .2byte 18, 1112, 3      @ 1
    .2byte 18, 1112, 4      @ 2

    .align 2 , 0
    .global characterAnimsGettingReady
characterAnimsGettingReady: @ 0x080D6FA0
    @ CHARACTER_SONIC
    .4byte 0
    .2byte 30 + 91*0, 0
    @ CHARACTER_CREAM
    .4byte 0
    .2byte 30 + 91*1, 0
    @ CHARACTER_TAILS
    .4byte 0
    .2byte 30 + 91*2, 0
    @ CHARACTER_KNUCKLES
    .4byte 0
    .2byte 30 + 91*3, 0
    @ CHARACTER_AMY
    .4byte 0
    .2byte 30 + 91*4, 0

    @ Colored triangles used for each char
    @ [NUM_CHARACTERS]
    .global gUnknown_080D6FC8
gUnknown_080D6FC8:
    @ .4byte Unknown
    @ .2byte animId, variantId
    .4byte 0x54
    .2byte 1113, 0  @ 1113, [CHARACTER_SONIC]
    .4byte 0x54
    .2byte 1113, 4  @ 1113, [CHARACTER_CREAM]
    .4byte 0x54
    .2byte 1113, 1  @ 1113, [CHARACTER_TAILS]
    .4byte 0x54
    .2byte 1113, 2  @ 1113, [CHARACTER_KNUCKLES]
    .4byte 0x54
    .2byte 1113, 3  @ 1113, [CHARACTER_AMY]

    @ [NUM_CHARACTERS]
    .global gUnknown_080D6FF0
gUnknown_080D6FF0:
    .byte 40, 55, 52, 40, 40

    .global gUnknown_080D6FF5
gUnknown_080D6FF5:
    .byte 0x00, 0x17

    .global gUnknown_080D6FF7
gUnknown_080D6FF7:
    .byte 0x06, 0x16, 0x16, 0x16, 0x00, 0x04, 0x13, 0x00, 0x08, 0x1D, 0x00, 0x00, 0x0C, 0x00, 0x13, 0x00, 0x1F, 0x1F, 0x13, 0x1F, 0x1B, 0x00, 0x13, 0x0A, 0x02, 0x1F, 0x15, 0x0A, 0x15, 0x00, 0x00, 0x1F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x1F, 0x1F, 0x1F, 0x0E, 0x0E, 0x0E, 0x00, 0x13, 0x1F, 0x00, 0x19, 0x14, 0x19, 0x19, 0x19, 0x1F, 0x0B, 0x00, 0x1F, 0x12, 0x00, 0x19, 0x05, 0x00, 0x1C, 0x0B, 0x00, 0x13, 0x00, 0x00, 0x1F, 0x1C, 0x17, 0x1D, 0x18, 0x10, 0x13, 0x0F, 0x08, 0x1F, 0x1E, 0x00, 0x08, 0x11, 0x1F, 0x02, 0x02, 0x02, 0x1F, 0x1F, 0x1F, 0x0E, 0x0E, 0x0E, 0x1F, 0x00, 0x1F, 0x00, 0x17, 0x06, 0x1F, 0x00, 0x1F, 0x1D, 0x11, 0x04, 0x1F, 0x17, 0x04, 0x17, 0x0A, 0x02, 0x15, 0x19, 0x1B, 0x00, 0x13, 0x1F, 0x04, 0x08, 0x1F, 0x13, 0x13, 0x13, 0x0E, 0x0E, 0x0E, 0x15, 0x00, 0x00, 0x1F, 0x04, 0x04, 0x02, 0x02, 0x02, 0x1F, 0x1F, 0x1F, 0x1F, 0x00, 0x1F, 0x1F, 0x00, 0x1F, 0x00, 0x16, 0x14, 0x16, 0x16, 0x16, 0x17, 0x00, 0x00, 0x1F, 0x04, 0x00, 0x0E, 0x00, 0x00, 0x04, 0x08, 0x1F, 0x1F, 0x1F, 0x13, 0x1F, 0x1B, 0x00, 0x13, 0x0A, 0x00, 0x1F, 0x15, 0x0A, 0x00, 0x15, 0x02, 0x0E, 0x1F, 0x00, 0x04, 0x04, 0x04, 0x1F, 0x1F, 0x1F, 0x0E, 0x0E, 0x0E, 0x1F, 0x13, 0x00, 0x00, 0x17, 0x06, 0x15, 0x19, 0x1B, 0x1D, 0x08, 0x13, 0x1F, 0x13, 0x17, 0x17, 0x04, 0x0A, 0x00, 0x15, 0x00, 0x0E, 0x0E, 0x0E, 0x13, 0x13, 0x13, 0x13, 0x0A, 0x00, 0x1F, 0x15, 0x0A, 0x15, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x13, 0x1F, 0x1F, 0x00, 0x00, 0x12, 0x0B, 0x04, 0x06, 0x0A, 0x00, 0x1F, 0x00, 0x1F, 0x1F, 0x1F, 0x14, 0x1F, 0x1F, 0x10, 0x1C, 0x1E, 0x0C, 0x18, 0x19, 0x09, 0x14, 0x15, 0x00, 0x0E, 0x10, 0x00, 0x1F, 0x00, 0x1F, 0x16, 0x18, 0x1F, 0x0A, 0x10, 0x1F, 0x1E, 0x00, 0x19, 0x18, 0x00, 0x13, 0x0A, 0x00, 0x1F, 0x00, 0x00, 0x00

    @ Colors [NUM_CHARACTERS]
    .global sZoneLoadingCharacterColors
sZoneLoadingCharacterColors:
    RGB  0  0 31   @; Sonic
    RGB 31 18  0   @; Cream
    RGB 31 27  0   @; Tails
    RGB 31  3  0   @; Knuckles
    RGB 31 17 21   @; Amy

    .global sScreenPositions_ZoneLoadingActLetters
sScreenPositions_ZoneLoadingActLetters:
    .2byte DISPLAY_WIDTH-108, DISPLAY_HEIGHT-63     @ A
    .2byte DISPLAY_WIDTH-87,  DISPLAY_HEIGHT-59     @ C
    .2byte DISPLAY_WIDTH-66,  DISPLAY_HEIGHT-55     @ T
    .2byte DISPLAY_WIDTH-44,  DISPLAY_HEIGHT-51     @ 1|2

    .global gUnknown_080D7130
gUnknown_080D7130:
    .2byte 10, -8
    .2byte  6, -4
    .2byte  2,  0


.arm
.syntax unified
.text

.if 0
.endif

	thumb_func_start Task_802F75C
Task_802F75C: @ 0x0802F75C
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
	ldr r2, _0802F8C8 @ =characterAnimsGettingReady
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
_0802F8C8: .4byte characterAnimsGettingReady
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
	bl CreateZoneBoss
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
	bl CreateZoneBoss
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
	bl CreateZoneBoss
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
	bl CreateStageUI
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

	thumb_func_start Task_802F9F8
Task_802F9F8: @ 0x0802F9F8
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
	bl NextTransitionFrame
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
	bl NextTransitionFrame
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

	thumb_func_start Task_802FD34
Task_802FD34: @ 0x0802FD34
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
	bl DisplaySprite
	movs r6, #0
	ldr r1, _0802FF78 @ =IWRAM_START + 0x205
	adds r5, r4, r1
	ldr r0, _0802FF7C @ =IWRAM_START + 0x1E4
	adds r4, r4, r0
_0802FEA6:
	movs r0, #0xff
	strb r0, [r5]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
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
	bl DisplaySprite
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
	bl UpdateSpriteAnimation
_0802FF0C:
	adds r0, r5, #0
	bl DisplaySprite
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
	bl DisplaySprite
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

	thumb_func_start Task_802FF94
Task_802FF94: @ 0x0802FF94
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
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
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

	thumb_func_start Task_80302AC
Task_80302AC: @ 0x080302AC
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
	ldr r5, _08030318 @ =sScreenPositions_ZoneLoadingActLetters
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
_08030318: .4byte sScreenPositions_ZoneLoadingActLetters
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
	ldr r3, _08030358 @ =sScreenPositions_ZoneLoadingActLetters
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
_08030358: .4byte sScreenPositions_ZoneLoadingActLetters
_0803035C:
	movs r4, #0
	ldr r7, _080303C0 @ =gCurrentLevel
	ldr r2, _080303C4 @ =IWRAM_START + 0x1A
	adds r1, r5, r2
	ldr r2, _080303C8 @ =sScreenPositions_ZoneLoadingActLetters
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
@ inline of sub_8030488
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
	bl DisplaySprite
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
_080303C8: .4byte sScreenPositions_ZoneLoadingActLetters

	thumb_func_start TaskDestructor_80303CC
TaskDestructor_80303CC: @ 0x080303CC
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

	thumb_func_start Task_UpdateStageLoadingScreen
Task_UpdateStageLoadingScreen: @ 0x08030404
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
	ldr r1, _0803044C @ =sZoneLoadingCharacterColors
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
_0803044C: .4byte sZoneLoadingCharacterColors
_08030450: .4byte gSelectedCharacter
_08030454: .4byte gFlags

	thumb_func_start TaskDestructor_nop_8030458
TaskDestructor_nop_8030458: @ 0x08030458
	bx lr
	.align 2, 0

	thumb_func_start TaskDestructor_803045C
TaskDestructor_803045C: @ 0x0803045C
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

	thumb_func_start TaskDestructor_8030474
TaskDestructor_8030474: @ 0x08030474
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #8]
	bl VramFree
	pop {r0}
	bx r0

    @ inline
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
	bl DisplaySprite
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
