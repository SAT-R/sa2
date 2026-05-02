.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r4, r1, #0
	movs r1, #0x64
	adds r2, r0, #0
	muls r2, r1, r2
	mov sl, r2
	ldr r3, _08057434 @ =gLoadedSaveGame
	movs r6, #0x85
	lsls r6, r6, #3
	adds r2, r3, r6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r2, _08057438 @ =gStageFlags
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0805743C @ =gCurrentLevel
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0xa
	bne _08057420
	ldr r2, _08057440 @ =gCamera
	ldrh r1, [r2, #0x26]
	movs r6, #0x80
	lsls r6, r6, #6
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r2, #0x26]
_08057420:
	ldr r0, _08057444 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bne _08057448
	adds r0, r4, #0
	bl CreateTimeAttackResult
	movs r0, #0
	b _08057844
	.align 2, 0
_08057434: .4byte gLoadedSaveGame
_08057438: .4byte gStageFlags
_0805743C: .4byte gCurrentLevel
_08057440: .4byte gCamera
_08057444: .4byte gGameMode
_08057448:
	movs r2, #0
	ldr r0, _080574E0 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0805748E
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xb
	ble _0805748E
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x7f
	bne _0805748E
	ldrh r1, [r3, #8]
	cmp r1, #0xc
	bls _0805748E
	ldrh r0, [r3, #0xa]
	cmp r0, #0xc
	bls _0805748E
	ldrh r0, [r3, #0xc]
	cmp r0, #0xc
	bls _0805748E
	ldrh r0, [r3, #0xe]
	cmp r0, #0xc
	bls _0805748E
	cmp r1, #0xf
	bne _0805748C
	ldr r0, _080574E4 @ =gMultiplayerCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xc
	beq _0805748E
_0805748C:
	movs r2, #1
_0805748E:
	str r2, [sp, #0x1c]
	cmp r2, #0
	bne _080574B6
	ldr r0, _080574E8 @ =gPlayer
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #8
	adds r1, r0, r1
	ldrh r2, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, #1
	cmp r0, r2
	bge _080574B4
	adds r0, r2, #0
_080574B4:
	strh r0, [r1]
_080574B6:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xa
	bne _080574CE
	ldr r0, _080574EC @ =gCheckpointTime
	ldr r0, [r0]
	ldr r1, _080574F0 @ =0x00002A30
	ldr r2, _080574F4 @ =0xFFFFD5D0
	adds r4, r0, r2
	cmp r0, r1
	bhi _080574CE
	movs r4, #1
_080574CE:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0xd
	bne _080574F8
	movs r0, #0x24      @ MUS_EXTRA_CLEAR
	bl m4aSongNumStart
	b _0805751A
	.align 2, 0
_080574E0: .4byte gSelectedCharacter
_080574E4: .4byte gMultiplayerCurrentLevel
_080574E8: .4byte gPlayer
_080574EC: .4byte gCheckpointTime
_080574F0: .4byte 0x00002A30
_080574F4: .4byte 0xFFFFD5D0
_080574F8:
	cmp r0, #0xc
	bne _08057504
	movs r0, #0x23      @ MUS_FINAL_CLEAR
	bl m4aSongNumStart
	b _0805751A
_08057504:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08057514
	movs r0, #0x22      @ MUS_BOSS_CLEAR
	bl m4aSongNumStart
	b _0805751A
_08057514:
	movs r0, #0x21      @ MUS_ACT_CLEAR
	bl m4aSongNumStart
_0805751A:
	ldr r0, _0805752C @ =gMusicManagerState
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _08057530 @ =0x0000545F
	cmp r4, r0
	bls _08057534
	movs r6, #0
	b _080575BA
	.align 2, 0
_0805752C: .4byte gMusicManagerState
_08057530: .4byte 0x0000545F
_08057534:
	ldr r0, _08057540 @ =0x0000464F
	cmp r4, r0
	bls _08057544
	movs r6, #0xfa
	lsls r6, r6, #1
	b _080575BA
	.align 2, 0
_08057540: .4byte 0x0000464F
_08057544:
	ldr r0, _08057550 @ =0x0000383F
	cmp r4, r0
	bls _08057554
	movs r6, #0xfa
	lsls r6, r6, #2
	b _080575BA
	.align 2, 0
_08057550: .4byte 0x0000383F
_08057554:
	ldr r0, _08057560 @ =0x00002A2F
	cmp r4, r0
	bls _08057564
	movs r6, #0xfa
	lsls r6, r6, #3
	b _080575BA
	.align 2, 0
_08057560: .4byte 0x00002A2F
_08057564:
	ldr r0, _08057570 @ =0x00001C1F
	cmp r4, r0
	bls _08057578
	ldr r6, _08057574 @ =0x00000BB8
	b _080575BA
	.align 2, 0
_08057570: .4byte 0x00001C1F
_08057574: .4byte 0x00000BB8
_08057578:
	ldr r0, _08057584 @ =0x00001517
	cmp r4, r0
	bls _08057588
	movs r6, #0xfa
	lsls r6, r6, #4
	b _080575BA
	.align 2, 0
_08057584: .4byte 0x00001517
_08057588:
	ldr r0, _08057594 @ =0x00000E0F
	cmp r4, r0
	bls _0805759C
	ldr r6, _08057598 @ =0x00001388
	b _080575BA
	.align 2, 0
_08057594: .4byte 0x00000E0F
_08057598: .4byte 0x00001388
_0805759C:
	ldr r0, _080575A8 @ =0x00000BB7
	cmp r4, r0
	bls _080575B0
	ldr r6, _080575AC @ =0x00002710
	b _080575BA
	.align 2, 0
_080575A8: .4byte 0x00000BB7
_080575AC: .4byte 0x00002710
_080575B0:
	ldr r0, _080575C4 @ =0x00000707
	ldr r6, _080575C8 @ =0x00013880
	cmp r4, r0
	bls _080575BA
	ldr r6, _080575CC @ =0x0000C350
_080575BA:
	cmp sl, r6
	bls _080575D0
	mov r0, sl
	b _080575D2
	.align 2, 0
_080575C4: .4byte 0x00000707
_080575C8: .4byte 0x00013880
_080575CC: .4byte 0x0000C350
_080575D0:
	adds r0, r6, #0
_080575D2:
	movs r1, #0x64
	bl Div
	adds r0, #0x4b
	str r0, [sp, #0x10]
	mov r0, sl
	str r0, [sp, #0x18]
	str r6, [sp, #0x14]
	bl UiGfxStackInit
	ldr r0, _08057854 @ =Task_8057B74
	ldr r1, _08057858 @ =0x00002120
	mov r8, r1
	movs r4, #0
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0xc]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r7, r0, r2
	strh r4, [r7, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r7, #0x30]
	strh r4, [r7, #0x1e]
	movs r0, #0xf0
	strh r0, [r7, #0xa]
	movs r0, #0x7e
	strh r0, [r7, #0xc]
	movs r0, #8
	strh r0, [r7, #0xe]
	strh r0, [r7, #0x10]
	movs r1, #6
	strh r1, [r7, #0x12]
	movs r5, #1
	strb r5, [r7, #0x16]
	movs r0, #0xa
	strh r0, [r7, #8]
	ldr r0, _0805785C @ =Task_8057C3C
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r7, r0, r2
	strh r4, [r7, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r7, #0x30]
	strh r4, [r7, #0x1e]
	movs r1, #0x80
	lsls r1, r1, #1
	mov sb, r1
	mov r2, sb
	strh r2, [r7, #0xa]
	movs r0, #0x80
	strh r0, [r7, #0xc]
	movs r0, #9
	strh r0, [r7, #0xe]
	movs r0, #2
	strh r0, [r7, #0x10]
	movs r0, #0xc
	strh r0, [r7, #0x12]
	strb r5, [r7, #0x16]
	strh r4, [r7, #8]
	ldr r0, _08057860 @ =Task_8057D30
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #8]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r2, [sp, #0x18]
	str r2, [r7, #0x18]
	strh r4, [r7, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r7, #0x30]
	strh r4, [r7, #0x1e]
	mov r2, sb
	strh r2, [r7, #0xa]
	movs r0, #0x66
	strh r0, [r7, #0xc]
	movs r0, #0x10
	strh r0, [r7, #0xe]
	movs r0, #4
	strh r0, [r7, #0x10]
	movs r0, #6
	strh r0, [r7, #0x12]
	strb r5, [r7, #0x16]
	strh r4, [r7, #8]
	movs r5, #0xf
	ldr r2, _08057864 @ =0x03000020
	adds r2, r2, r1
	mov r8, r2
_080576A8:
	mov r0, sl
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	adds r3, r7, #0
	adds r3, #0x20
	adds r3, r3, r2
	lsls r0, r4, #3
	lsls r1, r4, #1
	adds r0, r0, r1
	mov r1, sl
	subs r0, r1, r0
	adds r0, #0x20
	strb r0, [r3]
	mov sl, r4
	subs r2, #1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r2, #0
	bge _080576A8
	movs r5, #0xb
	ldr r7, _08057868 @ =Task_805803C
	mov r3, r8
	movs r4, #0x2b
_080576DE:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _080576F8
	strb r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	ble _080576DE
_080576F8:
	movs r5, #0
	mov r3, r8
	ldr r4, _0805786C @ =gUnknown_08688404
_080576FE:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r2, r3, r0
	adds r1, r0, r4
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080576FE
	ldr r2, _08057858 @ =0x00002120
	movs r4, #0
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	str r6, [r7, #0x18]
	strh r4, [r7, #0x1c]
	ldr r2, [sp, #0x10]
	str r2, [r7, #0x30]
	strh r4, [r7, #0x1e]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	movs r0, #0x50
	strh r0, [r7, #0xc]
	movs r0, #0x10
	strh r0, [r7, #0xe]
	movs r0, #4
	strh r0, [r7, #0x10]
	movs r0, #6
	strh r0, [r7, #0x12]
	movs r0, #1
	strb r0, [r7, #0x16]
	strh r4, [r7, #8]
	movs r5, #0xf
	ldr r0, _08057864 @ =0x03000020
	adds r0, r0, r1
	mov r8, r0
_0805775E:
	adds r0, r6, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	adds r3, r7, #0
	adds r3, #0x20
	adds r3, r3, r2
	lsls r0, r4, #3
	lsls r1, r4, #1
	adds r0, r0, r1
	subs r0, r6, r0
	adds r0, #0x20
	strb r0, [r3]
	adds r6, r4, #0
	subs r2, #1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r2, #0
	bge _0805775E
	movs r5, #0xb
	ldr r7, _08057870 @ =Task_8057888
	ldr r6, _08057874 @ =TaskDestructor_8058344
	mov r3, r8
	movs r4, #0x2b
_08057794:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _080577AE
	strb r4, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	ble _08057794
_080577AE:
	movs r5, #0
	mov r3, r8
	ldr r4, _08057878 @ =gUnknown_0868840F
_080577B4:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r2, r3, r0
	adds r1, r0, r4
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080577B4
	movs r2, #0x84
	lsls r2, r2, #6
	str r6, [sp]
	adds r0, r7, #0
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r1, #0
	strh r1, [r4, #0x24]
	ldr r2, [sp, #0x18]
	str r2, [r4, #0x2c]
	ldr r6, [sp, #0x14]
	str r6, [r4, #0x30]
	movs r0, #0x2d
	strh r0, [r4, #0x34]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x28]
	ldr r2, [sp, #0xc]
	str r2, [r4, #0x14]
	mov r6, sb
	str r6, [r4, #0x18]
	ldr r0, [sp, #4]
	str r0, [r4, #0x10]
	ldr r2, [sp, #8]
	str r2, [r4, #0xc]
	strh r1, [r4]
	strh r1, [r4, #2]
	movs r2, #1
	movs r0, #1
	strh r0, [r4, #4]
	strh r1, [r4, #6]
	adds r0, #0xff
	strh r0, [r4, #8]
	strb r2, [r4, #0xa]
	ldr r6, _0805787C @ =0x03000036
	adds r0, r5, r6
	mov r1, sp
	ldrb r1, [r1, #0x1c]
	strb r1, [r0]
	movs r0, #0x80
	bl VramMalloc
	str r0, [r4, #0x1c]
	movs r0, #0x1e
	bl VramMalloc
	str r0, [r4, #0x20]
	ldr r2, _08057880 @ =0x0300001C
	adds r5, r5, r2
	adds r0, r5, #0
	bl sub_8056FE4
	ldr r6, [sp, #0x10]
	ldr r1, _08057884 @ =0x0000011D
	adds r0, r6, r1
_08057844:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08057854: .4byte Task_8057B74
_08057858: .4byte 0x00002120
_0805785C: .4byte Task_8057C3C
_08057860: .4byte Task_8057D30
_08057864: .4byte 0x03000020
_08057868: .4byte Task_805803C
_0805786C: .4byte gUnknown_08688404
_08057870: .4byte Task_8057888
_08057874: .4byte TaskDestructor_8058344
_08057878: .4byte gUnknown_0868840F
_0805787C: .4byte 0x03000036
_08057880: .4byte 0x0300001C
_08057884: .4byte 0x0000011D

.syntax divided
