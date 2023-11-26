.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start sub_8023878
sub_8023878: @ 0x08023878
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	ldr r0, _08023944 @ =0xFFFFEFFF
	ands r2, r0
	str r2, [r4, #0x20]
	ldr r0, _08023948 @ =gWater
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
	bl CreateWaterfallSurfaceHitEffect
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
_08023948: .4byte gWater
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
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239A2:
	adds r0, r4, #0
	movs r1, #4
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239AC:
	adds r0, r4, #0
	movs r1, #3
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239B6:
	adds r0, r4, #0
	movs r1, #2
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239C0:
	adds r0, r4, #0
	movs r1, #1
	bl SpawnDrowningCountdownNum
	b _080239D2
_080239CA:
	adds r0, r4, #0
	movs r1, #0
	bl SpawnDrowningCountdownNum
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
	bl SpawnAirBubbles
	adds r0, r4, #0
	bl SpawnBubblesAfterDrowning
_080239FC:
	movs r0, #0x3c
	strb r0, [r7]
_08023A00:
	ldr r0, _08023A4C @ =gStageTime
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
	bl SpawnAirBubbles
	b _08023B02
	.align 2, 0
_08023A48: .4byte 0xFFFFF400
_08023A4C: .4byte gStageTime
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
	bl CreateWaterfallSurfaceHitEffect
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

    @ Input:
    @  r0 = Player*
    @  r1 = spriteOffsetY
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
	bl InitScatteringRings
_08023CFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023D04: .4byte gPressedKeys

	thumb_func_start Task_8023D08
Task_8023D08: @ 0x08023D08
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
	ldr r0, _08023D7C @ =gCourseTime
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
	ldr r0, _08023D7C @ =gCourseTime
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
_08023D7C: .4byte gCourseTime
_08023D80: .4byte 0x00008CA0
_08023D84: .4byte gUnknown_03005424
_08023D88:
	ldr r0, _08023D98 @ =gRingCount
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08023D9C @ =gSpecialRingCount
	strb r1, [r0]
	bl sub_801AE48
	b _08023E88
	.align 2, 0
_08023D98: .4byte gRingCount
_08023D9C: .4byte gSpecialRingCount
_08023DA0:
	ldr r1, _08023E50 @ =gRingCount
	strh r5, [r1]
	cmp r0, #3
	bne _08023DAC
	movs r0, #1
	strh r0, [r1]
_08023DAC:
	ldr r1, _08023E54 @ =gSpecialRingCount
	movs r0, #0
	strb r0, [r1]
	ldr r6, _08023E58 @ =gPlayer
	adds r0, r6, #0
	bl InitializePlayer
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
	ldr r0, _08023E74 @ =gCheese
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
	ldr r0, _08023E7C @ =Task_8023FC0
	str r0, [r1, #8]
	ldr r1, _08023E58 @ =gPlayer
	ldr r0, _08023E80 @ =PlayerCB_8025318
	str r0, [r1]
	b _08023E88
	.align 2, 0
_08023E50: .4byte gRingCount
_08023E54: .4byte gSpecialRingCount
_08023E58: .4byte gPlayer
_08023E5C: .4byte gCamera
_08023E60: .4byte gMPlayInfo_BGM
_08023E64: .4byte gUnknown_03005424
_08023E68: .4byte 0x0000FF7F
_08023E6C: .4byte 0xFFFFCFFF
_08023E70: .4byte 0x0000FFFC
_08023E74: .4byte gCheese
_08023E78: .4byte gCurTask
_08023E7C: .4byte Task_8023FC0
_08023E80: .4byte PlayerCB_8025318
_08023E84:
	subs r5, #1
	str r5, [r1, #4]
_08023E88:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Task_8023E90
Task_8023E90: @ 0x08023E90
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
	ldr r0, _08023F30 @ =Task_8023D08
	str r0, [r1, #8]
	b _08023FB6
	.align 2, 0
_08023F24: .4byte 0x0000EFFF
_08023F28: .4byte gCurTask
_08023F2C: .4byte gGameMode
_08023F30: .4byte Task_8023D08
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

	thumb_func_start Task_8023FC0
Task_8023FC0: @ 0x08023FC0
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
	bl CallPlayerTransition
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
	ldr r0, _0802410C @ =Task_8023E90
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
_0802410C: .4byte Task_8023E90
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
