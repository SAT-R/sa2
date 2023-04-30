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

    .global gUnknown_080D71CC
gUnknown_080D71CC:
    .2byte 0, 69, 173, 0

.arm
.syntax unified
.text

@ <Character> "Got Through" <Stage> screen
    @ Seems to be a non-static procedure
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
_08030570: .4byte gRingCount
_08030574: .4byte Task_UpdateGotThroughScreen
_08030578: .4byte TaskDestructor_UpdateGotThroughScreen
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
	bl RunTransition
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


	thumb_func_start Task_UpdateGotThroughScreen
Task_UpdateGotThroughScreen: @ 0x08030A4C
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
	movs r0, #0x8d  @ SE_STAGE_RESULT_COUNTER
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
	bl RunTransition
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

	thumb_func_start TaskDestructor_UpdateGotThroughScreen
TaskDestructor_UpdateGotThroughScreen: @ 0x08031370
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
