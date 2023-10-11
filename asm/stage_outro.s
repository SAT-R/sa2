.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global sAnimsGotThroughCharacterNames
sAnimsGotThroughCharacterNames: @ 0x080D713C
    .2byte 24, 1121, 0      @ "SONIC"
    .2byte 27, 1121, 4      @ "CREAM"
    .2byte 24, 1121, 1      @ "TAILS"
    .2byte 27, 1121, 2      @ "KNUCKLES"
    .2byte 18, 1121, 3      @ "AMY"

    .global gUnknown_080D715A
gUnknown_080D715A:
    .2byte 28, 1122, 0      @ "GOT THROUGH"
    .2byte 36, 1122, 1      @ "BOSS DESTROYED"
    .2byte 0, 0, 0
    .2byte 0, 0, 0
    .2byte 0, 0, 0

    .global sAnimsGotThroughZoneAndActNames
sAnimsGotThroughZoneAndActNames:    @ 0x080D7178
    .2byte 14, 1123, 0
    .2byte 14, 1123, 1
    .2byte 18, 1123, 4
    .2byte 18, 1123, 5
    .2byte 18, 1123, 6
    .2byte 18, 1123, 7
    .2byte 18, 1123, 8
    .2byte 18, 1123, 9
    .2byte 18, 1123, 10
    .2byte 16, 1123, 2
    .2byte 16, 1123, 3

    .global gUnknown_080D71BA
gUnknown_080D71BA:
    .2byte 26, 1124, 0  @ Time Bonus
    .2byte 26, 1124, 1  @ Ring Bonus
    .2byte 26, 1124, 2  @ Spring Bonus

.arm
.syntax unified
.text

@ <Character> "Got Through" <Stage> screen
    @ Seems to be a non-static procedure
    @ Returns u16(?)
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
	ldr r0, _08030570 @ =gRingCount
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08030574 @ =Task_UpdateGotThroughScreen
	movs r1, #0xba
	lsls r1, r1, #1
	movs r2, #0xc1
	lsls r2, r2, #8
	ldr r3, _08030578 @ =TaskDestructor_UpdateGotThroughScreen
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
	ldr r0, _0803058C @ =gSpecialRingCount
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
_08030570: .4byte gRingCount
_08030574: .4byte Task_UpdateGotThroughScreen
_08030578: .4byte TaskDestructor_UpdateGotThroughScreen
_0803057C: .4byte IWRAM_START + 0x168
_08030580: .4byte IWRAM_START + 0x170
_08030584: .4byte 0x00003FFF
_08030588: .4byte gPlayer
_0803058C: .4byte gSpecialRingCount
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
	bl NextTransitionFrame
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
	bl UpdateSpriteAnimation
	mov r7, sl
	adds r7, #0xc
	mov r3, r8
	strh r3, [r7, #0x16]
	movs r0, #0x29
	strh r0, [r7, #0x18]
	ldr r4, _08030890 @ =sAnimsGotThroughCharacterNames
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
	bl UpdateSpriteAnimation
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
	bl UpdateSpriteAnimation
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
_08030890: .4byte sAnimsGotThroughCharacterNames
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
	ldr r5, _080308F4 @ =sAnimsGotThroughZoneAndActNames
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
_080308F4: .4byte sAnimsGotThroughZoneAndActNames
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
	bl UpdateSpriteAnimation
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
	ldr r0, _080309E0 @ =gUnknown_080D71BA+4
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
	bl UpdateSpriteAnimation
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
_080309E0: .4byte gUnknown_080D71BA+4
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

.if 00
.endif
