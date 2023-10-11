.include "constants/gba_constants.inc"
.syntax unified
.text

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
	mov r8, r1          @ r8 = r1 = counter
	movs r4, #1
	add r8, r4
	ldr r1, _08030CF8 @ =IWRAM_START + 0x16C
	adds r0, r2, r1
	ldr r1, [r0]
	ldr r4, _08030CFC @ =309
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
	ldr r1, _08030D10 @ =gLevelScore
	ldr r5, [r1]
	adds r0, r5, #0
	adds r0, #0x64
	str r0, [r1]
	ldr r4, _08030D14 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0     @ r6 = div50K;
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
	ldr r1, _08030D10 @ =gLevelScore
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
	ldr r1, _08030D10 @ =gLevelScore
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
	ldr r1, _08030D10 @ =gLevelScore
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
	ldr r1, _08030D10 @ =gLevelScore
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
	ldr r1, _08030D10 @ =gLevelScore
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
	ldr r0, _08030D24 @ =gStageTime
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
_08030D10: .4byte gLevelScore
_08030D14: .4byte 0x0000C350
_08030D18: .4byte gGameMode
_08030D1C: .4byte gNumLives
_08030D20: .4byte gPressedKeys
_08030D24: .4byte gStageTime
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
	bl StartEndingCutscenes
	b Task_UpdateGotThroughScreen_return
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
	bl StartEndingCutscenes
_08030E16:
	bl WriteSaveGame
	b Task_UpdateGotThroughScreen_return
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
	bl NextTransitionFrame
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
	ldr r0, _08031008 @ =gSpecialRingCount
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
_08031008: .4byte gSpecialRingCount
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
	ldr r0, _08031098 @ =gSpecialRingCount
	ldrb r0, [r0]
	cmp r0, #6
	bls _0803109C
	bl sub_80313D0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x13
	orrs r0, r1
	str r0, [r4, #0x20]
	b Task_UpdateGotThroughScreen_return
	.align 2, 0
_08031094: .4byte gPlayer
_08031098: .4byte gSpecialRingCount
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
	b Task_UpdateGotThroughScreen_return
	.align 2, 0
_080310D4: .4byte gCurrentLevel
_080310D8:
	movs r0, #0
	bl sub_8031138
	b Task_UpdateGotThroughScreen_return
_080310E0:
	movs r0, #0
	bl sub_8031138
Task_UpdateGotThroughScreen_return:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
