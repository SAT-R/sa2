.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r6, #1
	ldr r0, _0800F66C @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r0, _0800F670 @ =0x03000208
	adds r2, r3, r0
	ldrh r0, [r2]
	subs r0, #0x80
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800F61A
	movs r0, #0
	strh r0, [r2]
_0800F61A:
	ldr r1, _0800F674 @ =gBldRegs
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #4]
	movs r5, #1
	ldr r1, _0800F678 @ =gMultiBootParam
	ldrb r0, [r1, #0x1d]
	asrs r0, r0, #1
	ands r0, r6
	mov r8, r1
	ldr r1, _0800F67C @ =0x030000C0
	adds r3, r3, r1
	cmp r0, #0
	beq _0800F680
	mov r2, r8
	ldrb r0, [r2, #0x1e]
	asrs r0, r0, #1
	ands r0, r6
	cmp r0, #0
	beq _0800F680
	movs r6, #2
_0800F646:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _0800F680
	ldrb r0, [r2, #0x1d]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F680
	mov r4, r8
	ldrb r0, [r4, #0x1e]
	asrs r0, r5
	ands r0, r1
	cmp r0, #0
	beq _0800F680
	adds r6, #1
	b _0800F646
	.align 2, 0
_0800F66C: .4byte gCurTask
_0800F670: .4byte 0x03000208
_0800F674: .4byte gBldRegs
_0800F678: .4byte gMultiBootParam
_0800F67C: .4byte 0x030000C0
_0800F680:
	adds r0, r6, #3
	strb r0, [r3]
	movs r5, #0
_0800F686:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	adds r4, #0x40
	adds r4, r7, r4
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0800F686
	ldr r1, _0800F6D0 @ =gMultiBootParam
	ldrb r0, [r1, #0x1e]
	movs r2, #0xe
	ands r2, r0
	mov r8, r1
	cmp r2, #0
	beq _0800F6D4
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _0800F6F0
	cmp r6, #1
	ble _0800F6F0
	adds r4, r7, #0
	adds r4, #0xd0
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	b _0800F6EC
	.align 2, 0
_0800F6D0: .4byte gMultiBootParam
_0800F6D4:
	ldr r1, _0800F7BC @ =0x00000207
	adds r0, r7, r1
	strb r2, [r0]
	ldr r2, _0800F7C0 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800F7C4 @ =0xFFFFBFFF
	ands r0, r1
	ldr r1, _0800F7C8 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	bl m4aSoundVSyncOn
_0800F6EC:
	ldr r2, _0800F7CC @ =gMultiBootParam
	mov r8, r2
_0800F6F0:
	mov r4, r8
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _0800F796
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _0800F796
	ldr r0, _0800F7D0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F796
	ldr r1, _0800F7BC @ =0x00000207
	adds r0, r7, r1
	movs r5, #1
	strb r5, [r0]
	ldr r4, _0800F7C0 @ =gFlags
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4]
	bl m4aMPlayAllStop
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	bl m4aSoundVSyncOff
	ldr r1, _0800F7D4 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _0800F7D8 @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _0800F7DC @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _0800F7E0 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	ldr r1, _0800F7E4 @ =gMultiboot_087C0258 + 0xC0
	ldr r2, _0800F7E8 @ =gMultiboot_087C22F8
	subs r2, r2, r1
	str r5, [sp]
	mov r0, r8
	movs r3, #4
	bl MultiBootStartMaster
_0800F796:
	ldr r2, _0800F7BC @ =0x00000207
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800F7F0
	ldr r0, _0800F7D0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800F7F0
	ldr r0, _0800F7EC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl CreateMultiplayerModeSelectScreen
	b _0800F986
	.align 2, 0
_0800F7BC: .4byte 0x00000207
_0800F7C0: .4byte gFlags
_0800F7C4: .4byte 0xFFFFBFFF
_0800F7C8: .4byte 0xFFFF7FFF
_0800F7CC: .4byte gMultiBootParam
_0800F7D0: .4byte gPressedKeys
_0800F7D4: .4byte 0x040000B0
_0800F7D8: .4byte 0x0000C5FF
_0800F7DC: .4byte 0x00007FFF
_0800F7E0: .4byte 0x040000D4
_0800F7E4: .4byte gMultiboot_087C0258 + 0xC0
_0800F7E8: .4byte gMultiboot_087C22F8
_0800F7EC: .4byte gCurTask
_0800F7F0:
	ldr r4, _0800F840 @ =gMultiBootParam
	adds r0, r4, #0
	bl MultiBootMain
	cmp r0, #0x50
	beq _0800F808
	cmp r0, #0x60
	beq _0800F808
	cmp r0, #0x70
	beq _0800F808
	cmp r0, #0x71
	bne _0800F868
_0800F808:
	ldr r1, _0800F844 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800F848 @ =gBackgroundsCopyQueueCursor
	ldr r0, _0800F84C @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800F850 @ =gBgSpritesCount
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0800F854 @ =gVramGraphicsCopyCursor
	ldr r0, _0800F858 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _0800F85C @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800F860 @ =0xFFFFBFFF
	ands r0, r1
	ldr r1, _0800F864 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r2]
	bl m4aSoundVSyncOn
	bl LinkCommunicationError
	b _0800F986
	.align 2, 0
_0800F840: .4byte gMultiBootParam
_0800F844: .4byte 0x0000FFFF
_0800F848: .4byte gBackgroundsCopyQueueCursor
_0800F84C: .4byte gBackgroundsCopyQueueIndex
_0800F850: .4byte gBgSpritesCount
_0800F854: .4byte gVramGraphicsCopyCursor
_0800F858: .4byte gVramGraphicsCopyQueueIndex
_0800F85C: .4byte gFlags
_0800F860: .4byte 0xFFFFBFFF
_0800F864: .4byte 0xFFFF7FFF
_0800F868:
	adds r0, r4, #0
	bl MultiBootCheckComplete
	cmp r0, #0
	bne _0800F874
	b _0800F986
_0800F874:
	ldr r4, _0800F8FC @ =gDispCnt
	ldr r1, _0800F900 @ =0x00001341
	adds r0, r1, #0
	strh r0, [r4]
	ldr r1, _0800F904 @ =gBgCntRegs
	movs r5, #0
	movs r2, #0
	ldr r0, _0800F908 @ =0x00001E02
	strh r0, [r1]
	adds r0, #1
	strh r0, [r1, #2]
	ldr r0, _0800F90C @ =gBgScrollRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	movs r1, #0x80
	strh r1, [r0, #6]
	ldr r0, _0800F910 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r6, #4]
	strh r2, [r6, #0xa]
	ldr r0, _0800F914 @ =0x0600F000
	str r0, [r6, #0xc]
	strh r2, [r6, #0x18]
	strh r2, [r6, #0x1a]
	movs r0, #0x53
	strh r0, [r6, #0x1c]
	strh r2, [r6, #0x1e]
	strh r2, [r6, #0x20]
	strh r2, [r6, #0x22]
	strh r2, [r6, #0x24]
	movs r0, #0x1e
	strh r0, [r6, #0x26]
	movs r0, #0x1b
	strh r0, [r6, #0x28]
	ldr r0, _0800F918 @ =0x0300002A
	adds r1, r1, r0
	strb r5, [r1]
	strh r2, [r6, #0x2e]
	adds r0, r6, #0
	bl DrawBackground
	ldr r0, _0800F91C @ =gLoadedSaveGame
	ldrb r2, [r0, #0x19]
	cmp r2, #0
	beq _0800F928
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _0800F920 @ =gWinRegs
	movs r0, #2
	strh r0, [r1, #8]
	movs r0, #1
	strh r0, [r1, #0xa]
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _0800F924 @ =0x00002058
	strh r0, [r1, #4]
	b _0800F936
	.align 2, 0
_0800F8FC: .4byte gDispCnt
_0800F900: .4byte 0x00001341
_0800F904: .4byte gBgCntRegs
_0800F908: .4byte 0x00001E02
_0800F90C: .4byte gBgScrollRegs
_0800F910: .4byte gCurTask
_0800F914: .4byte 0x0600F000
_0800F918: .4byte 0x0300002A
_0800F91C: .4byte gLoadedSaveGame
_0800F920: .4byte gWinRegs
_0800F924: .4byte 0x00002058
_0800F928:
	ldrh r0, [r4]
	ldr r1, _0800F994 @ =0x0000DFFF
	ands r1, r0
	strh r1, [r4]
	ldr r0, _0800F998 @ =gWinRegs
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
_0800F936:
	ldr r2, _0800F99C @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add r0, sp, #4
	movs r4, #0
	strh r4, [r0]
	ldr r1, _0800F9A0 @ =gBgPalette+0x40
	ldr r2, _0800F9A4 @ =0x01000010
	bl CpuSet
	ldr r0, _0800F9A8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800F9AC @ =sa2__sub_8081C50
	str r0, [r1, #8]
	ldr r1, _0800F9B0 @ =gMultiSioSend
	strb r4, [r1]
	ldr r5, _0800F9B4 @ =gMultiSioRecv
	strb r4, [r5]
	strb r4, [r5, #0x14]
	adds r3, r5, #0
	adds r3, #0x28
	strb r4, [r3]
	adds r2, r5, #0
	adds r2, #0x3c
	strb r4, [r2]
	strb r4, [r1, #2]
	ldr r0, _0800F9B8 @ =0x0000F001
	strh r0, [r1]
	strb r4, [r5, #2]
	adds r0, r5, #0
	adds r0, #0x14
	strb r4, [r0, #2]
	strb r4, [r3, #2]
	strb r4, [r2, #2]
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
_0800F986:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F994: .4byte 0x0000DFFF
_0800F998: .4byte gWinRegs
_0800F99C: .4byte gFlags
_0800F9A0: .4byte gBgPalette+0x40
_0800F9A4: .4byte 0x01000010
_0800F9A8: .4byte gCurTask
_0800F9AC: .4byte sa2__sub_8081C50
_0800F9B0: .4byte gMultiSioSend
_0800F9B4: .4byte gMultiSioRecv
_0800F9B8: .4byte 0x0000F001

.syntax divided
