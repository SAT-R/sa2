.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start Task_GameStage
Task_GameStage: @ 0x020124F0
	push {r4, r5, r6, r7, lr}
	ldr r0, _02012564 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1e
	ldr r0, _02012568 @ =gFrameCount
	ldr r1, _0201256C @ =gUnknown_03005418
	ldr r2, [r0]
	ldr r0, [r1]
	subs r3, r2, r0
	ldr r1, _02012570 @ =gStageTime
	ldr r0, [r1]
	subs r0, r3, r0
	mov ip, r0
	str r3, [r1]
	ldr r0, _02012574 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _02012590
	ldr r2, _02012578 @ =0xFFFFFE00
	adds r1, r3, #0
	ands r1, r2
	mov r0, ip
	subs r4, r3, r0
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r5, _0201257C @ =gMultiplayerPseudoRandom
	ldr r1, [r5]
	ldr r0, _02012580 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02012584 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, _02012588 @ =0xFFFFF000
	ands r3, r0
	ands r4, r0
	ldr r6, _0201258C @ =gRandomItemBox
	cmp r3, r4
	beq _02012552
	ldrb r2, [r6]
	lsrs r1, r2, #4
	adds r1, #1
	movs r0, #0xf
	ands r0, r2
	lsls r1, r1, #4
	orrs r0, r1
	strb r0, [r6]
_02012552:
	ldr r1, [r5]
	movs r3, #7
	ldrb r2, [r6]
	movs r0, #0xf8
	ands r0, r2
	ands r1, r3
	orrs r0, r1
	strb r0, [r6]
	b _020125B0
	.align 2, 0
_02012564: .4byte 0x04000128
_02012568: .4byte gFrameCount
_0201256C: .4byte gUnknown_03005418
_02012570: .4byte gStageTime
_02012574: .4byte gGameMode
_02012578: .4byte 0xFFFFFE00
_0201257C: .4byte gMultiplayerPseudoRandom
_02012580: .4byte 0x00196225
_02012584: .4byte 0x3C6EF35F
_02012588: .4byte 0xFFFFF000
_0201258C: .4byte gRandomItemBox
_02012590:
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r3, #0
	ands r1, r2
	mov r4, ip
	subs r0, r3, r4
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r2, _020125E0 @ =gMultiplayerPseudoRandom
	ldr r1, [r2]
	ldr r0, _020125E4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _020125E8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
_020125B0:
	ldr r2, _020125EC @ =gCamera
	adds r0, r2, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0201262E
	ldr r0, _020125F0 @ =gInput
	ldrh r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r3
	cmp r0, r1
	bne _020125F4
	cmp r7, #3
	beq _0201261A
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #3
	strb r0, [r1]
	b _02012634
	.align 2, 0
_020125E0: .4byte gMultiplayerPseudoRandom
_020125E4: .4byte 0x00196225
_020125E8: .4byte 0x3C6EF35F
_020125EC: .4byte gCamera
_020125F0: .4byte gInput
_020125F4:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0201260C
	cmp r7, #0
	beq _02012624
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	b _02012634
_0201260C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0201262E
	cmp r7, #1
	bhi _02012624
_0201261A:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #2
	strb r0, [r1]
	b _02012634
_02012624:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #1
	strb r0, [r1]
	b _02012634
_0201262E:
	adds r0, r2, #0
	adds r0, #0x66
	strb r7, [r0]
_02012634:
	ldr r0, _02012694 @ =gMultiplayerConnections
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x66
	ldrb r2, [r1]
	asrs r0, r2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _0201264A
	strb r7, [r1]
_0201264A:
	ldr r1, _02012698 @ =gUnknown_030053E0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02012656
	subs r0, #1
	strb r0, [r1]
_02012656:
	ldr r0, _0201269C @ =gUnknown_03005400
	ldr r4, _020126A0 @ =gStageFlags
	ldrh r2, [r4]
	strh r2, [r0]
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	bne _0201268E
	ldr r0, _020126A4 @ =gCheckpointTime
	ldr r1, [r0]
	add r1, ip
	str r1, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0201268E
	ldr r1, _020126A8 @ =gCourseTime
	ldr r0, [r1]
	mov r3, ip
	subs r0, r0, r3
	str r0, [r1]
	cmp r0, #0
	bgt _0201268E
	movs r0, #1
	orrs r0, r2
	strh r0, [r4]
	bl CreateMultiplayerFinishHandler
_0201268E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012694: .4byte gMultiplayerConnections
_02012698: .4byte gUnknown_030053E0
_0201269C: .4byte gUnknown_03005400
_020126A0: .4byte gStageFlags
_020126A4: .4byte gCheckpointTime
_020126A8: .4byte gCourseTime

	thumb_func_start sub_020126AC
sub_020126AC: @ 0x020126AC
	push {lr}
	ldr r0, _020126DC @ =gLevelScore
	movs r1, #0
	str r1, [r0]
	ldr r0, _020126E0 @ =gUnknown_030054B0
	strb r1, [r0]
	ldr r1, _020126E4 @ =gNumLives
	movs r0, #3
	strb r0, [r1]
	ldr r0, _020126E8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _020126CA
	movs r0, #1
	strb r0, [r1]
_020126CA:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #1
	movs r1, #2
	bl SetPlayerControls
	pop {r0}
	bx r0
	.align 2, 0
_020126DC: .4byte gLevelScore
_020126E0: .4byte gUnknown_030054B0
_020126E4: .4byte gNumLives
_020126E8: .4byte gGameMode

	thumb_func_start GameStageStart
GameStageStart: @ 0x020126EC
	push {lr}
	ldr r0, _02012750 @ =gUnknown_030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012754 @ =gUnknown_03005520
	strb r1, [r0]
	ldr r1, _02012758 @ =gRingCount
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0201275C @ =gUnknown_03005470
	movs r0, #1
	strb r0, [r1]
	ldr r1, _02012760 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012724
	ldr r0, _02012764 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _02012768 @ =gPlayer
	movs r2, #0
	bl CallSetStageSpawnPos
_02012724:
	ldr r0, _0201276C @ =gStageTime
	movs r3, #0
	str r3, [r0]
	ldr r2, _02012770 @ =gStageFlags
	ldrh r1, [r2]
	ldr r0, _02012774 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _02012778 @ =gUnknown_03005418
	ldr r0, _0201277C @ =gFrameCount
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _02012780 @ =gCheckpointTime
	str r3, [r0]
	ldr r1, _02012784 @ =gCourseTime
	ldr r0, _02012788 @ =0x00002A30
	str r0, [r1]
	bl CreateGameStage
	pop {r0}
	bx r0
	.align 2, 0
_02012750: .4byte gUnknown_030053F8
_02012754: .4byte gUnknown_03005520
_02012758: .4byte gRingCount
_0201275C: .4byte gUnknown_03005470
_02012760: .4byte gCurrentLevel
_02012764: .4byte gSelectedCharacter
_02012768: .4byte gPlayer
_0201276C: .4byte gStageTime
_02012770: .4byte gStageFlags
_02012774: .4byte 0x0000FF7F
_02012778: .4byte gUnknown_03005418
_0201277C: .4byte gFrameCount
_02012780: .4byte gCheckpointTime
_02012784: .4byte gCourseTime
_02012788: .4byte 0x00002A30

	thumb_func_start sub_0201278C
sub_0201278C: @ 0x0201278C
	push {r4, lr}
	ldr r4, _020127AC @ =gGameStageTask
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	ldr r0, _020127B0 @ =gPlayer
	bl DestroyPlayerTasks
	bl DestroyCameraMovementTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020127AC: .4byte gGameStageTask
_020127B0: .4byte gPlayer

	thumb_func_start TaskDestructor_GameStage
TaskDestructor_GameStage: @ 0x020127B4
	ldr r1, _020127BC @ =gGameStageTask
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_020127BC: .4byte gGameStageTask

	thumb_func_start StageInit_CollectRings
StageInit_CollectRings: @ 0x020127C0
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start sub_020127CC
sub_020127CC: @ 0x020127CC
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start MultiPakCommunicationError
MultiPakCommunicationError: @ 0x020127D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _020128D0 @ =gMultiplayerMissingHeartbeats
	movs r4, #0
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	ldr r0, _020128D4 @ =gMultiSioEnabled
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r0, _020128D8 @ =0x0201299D
	movs r2, #0x80
	lsls r2, r2, #5
	str r4, [sp]
	movs r1, #0x80
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sb, r0
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r2, _020128DC @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _020128E0 @ =gDispCnt
	movs r2, #0x8d
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020128E4 @ =gBldRegs
	movs r6, #0
	strh r4, [r0]
	strh r4, [r0, #4]
	str r4, [sp, #4]
	ldr r2, _020128E8 @ =0x040000D4
	add r0, sp, #4
	str r0, [r2]
	ldr r1, _020128EC @ =gBgCntRegs
	mov r8, r1
	ldrh r1, [r1]
	movs r0, #0xc
	ands r0, r1
	lsls r0, r0, #0xc
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	str r0, [r2, #4]
	ldr r0, _020128F0 @ =0x85000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _020128F4 @ =gUnknown_03004D80
	strb r6, [r0]
	ldr r1, _020128F8 @ =gUnknown_03002280
	strb r6, [r1]
	strb r6, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _020128FC @ =0x00001E01
	mov r2, r8
	strh r0, [r2]
	ldr r7, _02012900 @ =gBgScrollRegs
	strh r4, [r7]
	strh r4, [r7, #2]
	ldr r0, _02012904 @ =gUnknown_03000040
	adds r2, r5, r0
	str r3, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _02012908 @ =0x0600F000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	movs r0, #4
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	ldr r1, _0201290C @ =gUnknown_0300006A
	adds r5, r5, r1
	strb r6, [r5]
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r0, _02012910 @ =0x00001F04
	mov r2, r8
	strh r0, [r2, #2]
	strh r4, [r7, #4]
	strh r4, [r7, #6]
	ldr r0, _02012914 @ =gMultiplayerLanguage
	ldrb r0, [r0]
	cmp r0, #1
	beq _0201291C
	cmp r0, #1
	bgt _02012928
	cmp r0, #0
	bne _02012928
	ldr r0, _02012918 @ =0x0000FFF8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_020128D0: .4byte gMultiplayerMissingHeartbeats
_020128D4: .4byte gMultiSioEnabled
_020128D8: .4byte 0x0201299D
_020128DC: .4byte gFlags
_020128E0: .4byte gDispCnt
_020128E4: .4byte gBldRegs
_020128E8: .4byte 0x040000D4
_020128EC: .4byte gBgCntRegs
_020128F0: .4byte 0x85000010
_020128F4: .4byte gUnknown_03004D80
_020128F8: .4byte gUnknown_03002280
_020128FC: .4byte 0x00001E01
_02012900: .4byte gBgScrollRegs
_02012904: .4byte gUnknown_03000040
_02012908: .4byte 0x0600F000
_0201290C: .4byte gUnknown_0300006A
_02012910: .4byte 0x00001F04
_02012914: .4byte gMultiplayerLanguage
_02012918: .4byte 0x0000FFF8
_0201291C:
	ldr r0, _02012924 @ =0x0000FFC8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_02012924: .4byte 0x0000FFC8
_02012928:
	ldr r1, _02012984 @ =gBgScrollRegs
	ldr r0, _02012988 @ =0x0000FFF8
	strh r0, [r1, #6]
_0201292E:
	mov r2, sb
	ldr r0, _0201298C @ =0x06004000
	str r0, [r2, #4]
	movs r4, #0
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _02012990 @ =0x0600F800
	str r1, [r2, #0xc]
	strh r0, [r2, #0x18]
	strh r0, [r2, #0x1a]
	movs r5, #3
	strh r5, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r0, [r2, #0x22]
	strh r0, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0xc
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r4, [r0]
	movs r4, #1
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl DrawBackground
	ldr r1, _02012994 @ =gWinRegs
	strh r5, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _02012998 @ =0x00003868
	strh r0, [r1, #4]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012984: .4byte gBgScrollRegs
_02012988: .4byte 0x0000FFF8
_0201298C: .4byte 0x06004000
_02012990: .4byte 0x0600F800
_02012994: .4byte gWinRegs
_02012998: .4byte 0x00003868
_0201299C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_8081200
sub_8081200: @ 0x020129A0
	push {lr}
	ldr r1, _020129F8 @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r0, _020129FC @ =gRingsScatterTask
	movs r1, #0
	str r1, [r0]
	ldr r0, _02012A00 @ =gUnknown_030057D4
	str r1, [r0]
	ldr r0, _02012A04 @ =gGameStageTask
	str r1, [r0]
	ldr r0, _02012A08 @ =gPlayer
	adds r0, #0x8c
	str r1, [r0]
	ldr r0, _02012A0C @ =gCamera
	str r1, [r0, #0x5c]
	ldr r0, _02012A10 @ =gUnknown_030053F0
	strb r1, [r0]
	ldr r0, _02012A14 @ =gEntitiesManagerTask
	str r1, [r0]
	ldr r3, _02012A18 @ =gMultiplayerPlayerTasks
	movs r2, #0
_020129CC:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _020129CC
	bl sub_020126AC
	ldr r2, _02012A08 @ =gPlayer
	adds r2, #0x5c
	ldr r1, _02012A1C @ =gPlayerControls
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_020129F8: .4byte gGameMode
_020129FC: .4byte gRingsScatterTask
_02012A00: .4byte gUnknown_030057D4
_02012A04: .4byte gGameStageTask
_02012A08: .4byte gPlayer
_02012A0C: .4byte gCamera
_02012A10: .4byte gUnknown_030053F0
_02012A14: .4byte gEntitiesManagerTask
_02012A18: .4byte gMultiplayerPlayerTasks
_02012A1C: .4byte gPlayerControls

	thumb_func_start GameInit
GameInit: @ 0x02012A20
	push {r4, r5, r6, r7, lr}
	ldr r1, _02012A7C @ =gGameMode
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02012A80 @ =gUnknown_03004D54
	ldr r0, _02012A84 @ =gBgOffsetsBuffer
	str r0, [r1]
	ldr r1, _02012A88 @ =gUnknown_030022C0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #0
	ldr r7, _02012A8C @ =gMultiSioEnabled
	ldr r0, _02012A90 @ =gMultiSioStatusFlags
	mov ip, r0
	ldr r6, _02012A94 @ =gMultiplayerCharacters
	movs r2, #0
	ldr r5, _02012A98 @ =gMPRingCollectWins
	ldr r4, _02012A9C @ =gUnknown_030054B4
	ldr r3, _02012AA0 @ =gMultiplayerMissingHeartbeats
_02012A4A:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r1, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _02012A4A
	movs r0, #1
	strb r0, [r7]
	mov r1, ip
	ldr r0, [r1]
	bl MultiSioInit
	bl MultiSioStart
	movs r0, #0
	bl CreateMultiplayerSinglePakResultsScreen
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012A7C: .4byte gGameMode
_02012A80: .4byte gUnknown_03004D54
_02012A84: .4byte gBgOffsetsBuffer
_02012A88: .4byte gUnknown_030022C0
_02012A8C: .4byte gMultiSioEnabled
_02012A90: .4byte gMultiSioStatusFlags
_02012A94: .4byte gMultiplayerCharacters
_02012A98: .4byte gMPRingCollectWins
_02012A9C: .4byte gUnknown_030054B4
_02012AA0: .4byte gMultiplayerMissingHeartbeats

	thumb_func_start sub_02012AA4
sub_02012AA4: @ 0x02012AA4
	push {lr}
	sub sp, #4
	ldr r0, _02012AC4 @ =sub_02012AE8
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, _02012AC8 @ =sub_02012AEC
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _02012ACC @ =gUnknown_030057D4
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02012AC4: .4byte sub_02012AE8
_02012AC8: .4byte sub_02012AEC
_02012ACC: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AD0
sub_02012AD0: @ 0x02012AD0
	push {r4, lr}
	ldr r4, _02012AE4 @ =gUnknown_030057D4
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02012AE4: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AE8
sub_02012AE8: @ 0x02012AE8
	bx lr
	.align 2, 0

	thumb_func_start sub_02012AEC
sub_02012AEC: @ 0x02012AEC
	ldr r1, _02012AF4 @ =gUnknown_030057D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012AF4: .4byte gUnknown_030057D4
