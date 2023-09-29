.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

@; TODO: move all the above data into `stage_ui.c` and merge with `time.c`

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
  @ TRUE AREA 53
    .2byte 20, 1117, 29
    .2byte 20, 1117, 30
    .2byte 35, 1117, 31
    .2byte 35, 1117, 32
  @ BOSS ATTACK!
    .2byte 20, 1117, 33
    .2byte 20, 1117, 34
    .2byte 35, 1117, 35
    .2byte 35, 1117, 36
  @ TODO: 37-39 do not exist!?!?
    .2byte 20, 1117, 37
    .2byte 20, 1117, 38
    .2byte 35, 1117, 39

    @ Big icon showing the current zone during the stage loading screen.
    @ It is rotating and displayed in the upper left screen corner.
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

    .global gUnknown_080D6FC8
gUnknown_080D6FC8:
    .4byte 0x54
    .2byte 1113, 0  @ 1113, CHARACTER_SONIC
    .4byte 0x54
    .2byte 1113, 4  @ 1113, CHARACTER_CREAM
    .4byte 0x54
    .2byte 1113, 1  @ 1113, CHARACTER_TAILS
    .4byte 0x54
    .2byte 1113, 2  @ 1113, CHARACTER_KNUCKLES
    .4byte 0x54
    .2byte 1113, 3  @ 1113, CHARACTER_AMY

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

	thumb_func_start sub_802E0D4
sub_802E0D4: @ 0x0802E0D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0802E11C @ =gBgOffsetsHBlank
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
_0802E11C: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802E1AC @ =gBgOffsetsHBlank
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
_0802E1AC: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802E234 @ =gBgOffsetsHBlank
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
_0802E234: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802E310 @ =gBgOffsetsHBlank
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
_0802E310: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802E41C @ =gBgOffsetsHBlank
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
_0802E41C: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802E820 @ =gBgOffsetsHBlank
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
_0802E820: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802EAE4 @ =gBgOffsetsHBlank
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
_0802EAE4: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802EB74 @ =gBgOffsetsHBlank
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
_0802EB74: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802EC44 @ =gBgOffsetsHBlank
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
_0802EC44: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802ED14 @ =gBgOffsetsHBlank
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
_0802ED14: .4byte gBgOffsetsHBlank
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

	thumb_func_start Task_802ED98
Task_802ED98: @ 0x0802ED98
	push {r4, lr}
	ldr r4, _0802EDCC @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl NextTransitionFrame
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
	ldr r0, _0802EDD4 @ =gCourseTime
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _0802EE64
	.align 2, 0
_0802EDCC: .4byte gCurTask
_0802EDD0: .4byte gGameMode
_0802EDD4: .4byte gCourseTime
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
	ldr r0, _0802EE48 @ =gCourseTime
	ldr r0, [r0]
	ldr r1, _0802EE4C @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0802EE50 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
	b _0802EE64
	.align 2, 0
_0802EE48: .4byte gCourseTime
_0802EE4C: .4byte gRingCount
_0802EE50: .4byte gUnknown_030054F4
_0802EE54:
	ldr r0, _0802EE6C @ =gCourseTime
	ldr r0, [r0]
	ldr r1, _0802EE70 @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0802EE74 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0802EE64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE6C: .4byte gCourseTime
_0802EE70: .4byte gRingCount
_0802EE74: .4byte gUnknown_030054F4

	thumb_func_start Task_802EE78
Task_802EE78: @ 0x0802EE78
	push {r4, r5, r6, lr}
	ldr r0, _0802EF44 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl NextTransitionFrame
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
	ldr r0, _0802EF64 @ =Task_802F06C
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
_0802EF64: .4byte Task_802F06C

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
	ldr r0, _0802EFD4 @ =Task_802EE78
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
_0802EFD4: .4byte Task_802EE78
_0802EFD8: .4byte 0x0000014D

	thumb_func_start sub_802EFDC
sub_802EFDC: @ 0x0802EFDC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0802F004 @ =gBgOffsetsHBlank
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
_0802F004: .4byte gBgOffsetsHBlank
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
	ldr r0, _0802F068 @ =gBgOffsetsHBlank
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
_0802F068: .4byte gBgOffsetsHBlank

	thumb_func_start Task_802F06C
Task_802F06C: @ 0x0802F06C
	push {r4, r5, lr}
	ldr r5, _0802F0A0 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl NextTransitionFrame
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
	ldr r0, _0802F0A4 @ =Task_802ED98
	str r0, [r1, #8]
_0802F098:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F0A0: .4byte gCurTask
_0802F0A4: .4byte Task_802ED98

	thumb_func_start SetupStageIntro
SetupStageIntro: @ 0x0802F0A8
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
	ldr r0, _0802F208 @ =gActiveBossTask
	movs r4, #0
	str r4, [r0]
	ldr r0, _0802F20C @ =Task_802F75C
	movs r2, #0x88
	lsls r2, r2, #6
	ldr r1, _0802F210 @ =TaskDestructor_80303CC
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
	ldr r0, _0802F214 @ =Task_802F9F8
	ldr r2, _0802F218 @ =0x00002210
	ldr r1, _0802F21C @ =TaskDestructor_nop_8030458
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
	bl NextTransitionFrame
	ldr r0, _0802F228 @ =Task_802FD34
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
	ldr r0, _0802F238 @ =Task_802FF94
	movs r1, #0xc4
	lsls r1, r1, #2
	ldr r2, _0802F23C @ =0x00002230
	ldr r3, _0802F240 @ =TaskDestructor_803045C
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
	ldr r2, _0802F248 @ =zoneLoadingCharacterLogos
	ldr r0, _0802F24C @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F250 @ =zoneLoadingZoneNames
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
	ldr r1, _0802F258 @ =zoneLoadingIcons
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	adds r1, #0x24
	adds r0, r0, r1
	ldr r1, _0802F25C @ =zoneUnlockedIcons
	ldrh r2, [r1]
	lsls r1, r2, #3
	adds r1, r1, r2
	b _0802F2BE
	.align 2, 0
_0802F200: .4byte gUnknown_03005424
_0802F204: .4byte gPlayer
_0802F208: .4byte gActiveBossTask
_0802F20C: .4byte Task_802F75C
_0802F210: .4byte TaskDestructor_80303CC
_0802F214: .4byte Task_802F9F8
_0802F218: .4byte 0x00002210
_0802F21C: .4byte TaskDestructor_nop_8030458
_0802F220: .4byte IWRAM_START+4
_0802F224: .4byte 0x00003FFF
_0802F228: .4byte Task_802FD34
_0802F22C: .4byte 0x00002220
_0802F230: .4byte IWRAM_START + 0x10
_0802F234: .4byte IWRAM_START + 0x14
_0802F238: .4byte Task_802FF94
_0802F23C: .4byte 0x00002230
_0802F240: .4byte TaskDestructor_803045C
_0802F244: .4byte gGameMode
_0802F248: .4byte zoneLoadingCharacterLogos
_0802F24C: .4byte gSelectedCharacter
_0802F250: .4byte zoneLoadingZoneNames
_0802F254: .4byte gCurrentLevel
_0802F258: .4byte zoneLoadingIcons
_0802F25C: .4byte zoneUnlockedIcons
_0802F260:
	ldr r2, _0802F3E0 @ =zoneLoadingCharacterLogos
	ldr r0, _0802F3E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r5, _0802F3E8 @ =zoneLoadingZoneNames
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
	ldr r1, _0802F3F0 @ =zoneLoadingIcons
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
	ldr r2, _0802F3E0 @ =zoneLoadingCharacterLogos
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
	bl UpdateSpriteAnimation
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
	ldr r3, _0802F3E8 @ =zoneLoadingZoneNames
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
_0802F3E0: .4byte zoneLoadingCharacterLogos
_0802F3E4: .4byte gSelectedCharacter
_0802F3E8: .4byte zoneLoadingZoneNames
_0802F3EC: .4byte gCurrentLevel
_0802F3F0: .4byte zoneLoadingIcons
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
	bl UpdateSpriteAnimation
	movs r5, #0xb5
	lsls r5, r5, #2
	add r5, r8
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	str r6, [r5, #4]
	ldr r3, _0802F5DC @ =zoneLoadingIcons
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
	bl UpdateSpriteAnimation
	ldr r0, _0802F5E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802F652
	movs r7, #0
	movs r4, #0
	mov sb, r4
	movs r3, #0
	ldr r4, _0802F5E8 @ =zoneUnlockedIcons
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
_0802F5DC: .4byte zoneLoadingIcons
_0802F5E0: .4byte gUnknown_030054B8
_0802F5E4: .4byte gGameMode
_0802F5E8: .4byte zoneUnlockedIcons
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
	bl UpdateSpriteAnimation
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #8
	bls _0802F5A8
_0802F652:
	ldr r0, _0802F73C @ =Task_80302AC
	movs r2, #0x89
	lsls r2, r2, #6
	ldr r1, _0802F740 @ =TaskDestructor_8030474
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
	ldr r4, _0802F744 @ =sZoneLoadingActLetters
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
	bl UpdateSpriteAnimation
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r3, [sp, #0x30]
	cmp r7, #3
	bls _0802F688
	ldr r0, _0802F750 @ =Task_UpdateStageLoadingScreen
	ldr r2, _0802F754 @ =0x000022F0
	ldr r1, _0802F758 @ =TaskDestructor_nop_8030458
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
_0802F73C: .4byte Task_80302AC
_0802F740: .4byte TaskDestructor_8030474
_0802F744: .4byte sZoneLoadingActLetters
_0802F748: .4byte 0x0000FFE0
_0802F74C: .4byte gCurrentLevel
_0802F750: .4byte Task_UpdateStageLoadingScreen
_0802F754: .4byte 0x000022F0
_0802F758: .4byte TaskDestructor_nop_8030458

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
