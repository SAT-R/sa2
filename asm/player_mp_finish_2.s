.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D57D8
gUnknown_080D57D8:
    .byte 0, 1, 2, 3

.text
.syntax unified
.arm

@; something to do with results
	thumb_func_start sub_8019F08
sub_8019F08: @ 0x08019F08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08019FAC @ =sub_801A04C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	ldr r3, _08019FB0 @ =gGameMode
	ldrb r0, [r3]
	cmp r0, #5
	bne _08019F36
	b _0801A038
_08019F36:
	ldr r1, _08019FB4 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08019FB8 @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08019FBC @ =gRingCount
	movs r4, #0
	ldrsh r2, [r0, r4]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08019FC0 @ =gCourseTime
	ldr r2, [r0]
	ldr r0, _08019FC4 @ =0x00008CA0
	cmp r2, r0
	bhi _08019F6C
	ldr r0, _08019FC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801A038
	cmp r2, #0
	bne _0801A038
_08019F6C:
	movs r2, #0
	ldrb r0, [r3]
	cmp r0, #4
	beq _08019FE4
	movs r4, #0
	ldr r0, _08019FCC @ =gMultiplayerPlayerTasks
	ldr r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _08019FA4
	ldr r5, _08019FD0 @ =gUnknown_030054B4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r7, #0
_08019F88:
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r3
	beq _08019F96
	adds r2, #1
_08019F96:
	adds r1, #4
	adds r4, #1
	cmp r4, #3
	bhi _08019FA4
	ldr r0, [r1]
	cmp r0, #0
	bne _08019F88
_08019FA4:
	cmp r2, #0
	bne _08019FD4
	movs r6, #4
	b _08019FE8
	.align 2, 0
_08019FAC: .4byte sub_801A04C
_08019FB0: .4byte gGameMode
_08019FB4: .4byte gUnknown_030054A8
_08019FB8: .4byte gLoadedSaveGame
_08019FBC: .4byte gRingCount
_08019FC0: .4byte gCourseTime
_08019FC4: .4byte 0x00008CA0
_08019FC8: .4byte gUnknown_03005424
_08019FCC: .4byte gMultiplayerPlayerTasks
_08019FD0: .4byte gUnknown_030054B4
_08019FD4:
	subs r0, r4, #1
	cmp r2, r0
	bne _08019FE0
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _08019FE8
_08019FE0:
	movs r6, #5
	b _08019FE8
_08019FE4:
	movs r6, #4
	ldr r7, _0801A044 @ =gMultiplayerPlayerTasks
_08019FE8:
	movs r4, #0
	ldr r0, [r7]
	cmp r0, #0
	beq _0801A038
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
_08019FF8:
	ldr r0, _0801A048 @ =gUnknown_030054B4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _0801A024
	adds r0, r5, r7
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [r2, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x5c]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_8019CCC
_0801A024:
	adds r5, #4
	adds r4, #1
	cmp r4, #3
	bhi _0801A038
	ldr r0, _0801A044 @ =gMultiplayerPlayerTasks
	adds r1, r5, r0
	ldr r1, [r1]
	adds r7, r0, #0
	cmp r1, #0
	bne _08019FF8
_0801A038:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A044: .4byte gMultiplayerPlayerTasks
_0801A048: .4byte gUnknown_030054B4

	thumb_func_start sub_801A04C
sub_801A04C: @ 0x0801A04C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _0801A0B8 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0801A0BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801A066
	movs r2, #0xf0
_0801A066:
	ldr r0, _0801A0C0 @ =gUnknown_03005438
	ldr r1, _0801A0C4 @ =gUnknown_03005420
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801A0B2
	ldrh r0, [r5]
	adds r1, r0, #1
	strh r1, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r2
	bls _0801A0B2
	ldr r1, _0801A0C8 @ =gBldRegs
	movs r4, #0
	movs r0, #0xbf
	strh r0, [r1]
	strh r4, [r1, #4]
	ldr r0, _0801A0CC @ =gMPlayInfo_BGM
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0801A0D0 @ =gMPlayInfo_SE1
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0801A0D4 @ =gMPlayInfo_SE2
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0801A0D8 @ =gMPlayInfo_SE3
	movs r1, #4
	bl m4aMPlayFadeOut
	strh r4, [r5]
	ldr r1, [r6]
	ldr r0, _0801A0DC @ =sub_801A0E0
	str r0, [r1, #8]
_0801A0B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801A0B8: .4byte gCurTask
_0801A0BC: .4byte gGameMode
_0801A0C0: .4byte gUnknown_03005438
_0801A0C4: .4byte gUnknown_03005420
_0801A0C8: .4byte gBldRegs
_0801A0CC: .4byte gMPlayInfo_BGM
_0801A0D0: .4byte gMPlayInfo_SE1
_0801A0D4: .4byte gMPlayInfo_SE2
_0801A0D8: .4byte gMPlayInfo_SE3
_0801A0DC: .4byte sub_801A0E0

	thumb_func_start sub_801A0E0
sub_801A0E0: @ 0x0801A0E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0801A1D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	ldr r2, _0801A1D4 @ =gBldRegs
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r2, #4]
	ldrh r1, [r1]
	ldr r0, _0801A1D8 @ =0x00000FFF
	cmp r1, r0
	bhi _0801A110
	b _0801A366
_0801A110:
	movs r0, #0xbf
	strh r0, [r2]
	movs r0, #0
	strh r0, [r2, #4]
	ldr r5, _0801A1DC @ =gGameMode
	ldrb r0, [r5]
	add r1, sp, #8
	mov sl, r1
	cmp r0, #5
	beq _0801A126
	b _0801A232
_0801A126:
	ldr r1, _0801A1E0 @ =gUnknown_080D57D8
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	bl m4aMPlayAllStop
	ldr r0, _0801A1E4 @ =gUnknown_030053E8
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r7, #0
	mov sb, r4
	movs r0, #3
	mov ip, r0
_0801A14E:
	movs r4, #0
	cmp r4, ip
	bhs _0801A196
	mov r6, sb
	mov r8, ip
_0801A158:
	adds r3, r6, r4
	adds r5, r4, #1
	adds r2, r6, r5
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bhs _0801A190
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	strb r0, [r3]
	mov r1, sp
	adds r3, r1, r4
	adds r2, r1, r5
	ldrb r1, [r3]
	ldrb r0, [r2]
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	strb r0, [r3]
_0801A190:
	adds r4, r5, #0
	cmp r4, r8
	blo _0801A158
_0801A196:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	adds r7, #1
	cmp r7, #3
	bls _0801A14E
	movs r7, #0
	mov r4, sb
	ldr r6, _0801A1E8 @ =gUnknown_030054B4
	ldr r5, _0801A1EC @ =gMultiplayerCharacters
	mov r3, sp
	mov r2, sp
	ldr r1, _0801A1F0 @ =gUnknown_03005428
	mov r8, r1
_0801A1B2:
	cmp r7, #0
	beq _0801A1F4
	adds r0, r4, r7
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0801A1FC
	ldrb r0, [r2]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r0, [r2]
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	b _0801A222
	.align 2, 0
_0801A1D0: .4byte gCurTask
_0801A1D4: .4byte gBldRegs
_0801A1D8: .4byte 0x00000FFF
_0801A1DC: .4byte gGameMode
_0801A1E0: .4byte gUnknown_080D57D8
_0801A1E4: .4byte gUnknown_030053E8
_0801A1E8: .4byte gUnknown_030054B4
_0801A1EC: .4byte gMultiplayerCharacters
_0801A1F0: .4byte gUnknown_03005428
_0801A1F4:
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	cmp r0, r1
	bne _0801A20C
_0801A1FC:
	ldrb r0, [r2]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r0, [r2]
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	b _0801A222
_0801A20C:
	ldrb r0, [r3]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r1, [r3]
	add r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r0, r5
	strb r7, [r0]
_0801A222:
	adds r2, #1
	adds r7, #1
	cmp r7, #3
	bls _0801A1B2
	ldr r1, _0801A278 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #5
	beq _0801A2DA
_0801A232:
	movs r6, #0
	movs r2, #0
_0801A236:
	ldr r0, _0801A27C @ =gMultiplayerConnections
	ldrb r1, [r0]
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	asrs r1, r3
	movs r0, #1
	ands r1, r0
	adds r5, r2, #0
	cmp r1, #0
	beq _0801A2C2
	ldr r4, _0801A280 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	beq _0801A2C2
	ldr r2, _0801A284 @ =gUnknown_030054B4
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bge _0801A288
	movs r3, #0
	b _0801A2A8
	.align 2, 0
_0801A278: .4byte gGameMode
_0801A27C: .4byte gMultiplayerConnections
_0801A280: .4byte 0x04000128
_0801A284: .4byte gUnknown_030054B4
_0801A288:
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	ble _0801A2A0
	movs r3, #1
	movs r6, #1
	b _0801A2A8
_0801A2A0:
	movs r3, #2
	cmp r6, #1
	beq _0801A2A8
	movs r6, #2
_0801A2A8:
	ldr r1, _0801A31C @ =gMultiplayerIds
	asrs r2, r5, #0x10
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _0801A320 @ =gMultiplayerNames
	adds r1, r1, r2
	adds r2, r3, #0
	bl RecordMultiplayerResult
_0801A2C2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0801A236
	adds r0, r6, #0
	bl RecordOwnMultiplayerResult
	bl WriteSaveGame
_0801A2DA:
	ldr r1, _0801A324 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0801A328 @ =gUnknown_03002AE4
	ldr r0, _0801A32C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0801A330 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0801A334 @ =gVramGraphicsCopyCursor
	ldr r0, _0801A338 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0801A33C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801A34C
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _0801A340 @ =0x040000D4
	mov r0, sl
	str r0, [r1]
	ldr r0, _0801A344 @ =gMultiSioSend
	str r0, [r1, #4]
	ldr r0, _0801A348 @ =0x85000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl CreateMultiplayerResultsScreen
	b _0801A366
	.align 2, 0
_0801A31C: .4byte gMultiplayerIds
_0801A320: .4byte gMultiplayerNames
_0801A324: .4byte 0x0000FFFF
_0801A328: .4byte gUnknown_03002AE4
_0801A32C: .4byte gUnknown_0300287C
_0801A330: .4byte gUnknown_03005390
_0801A334: .4byte gVramGraphicsCopyCursor
_0801A338: .4byte gVramGraphicsCopyQueueIndex
_0801A33C: .4byte gGameMode
_0801A340: .4byte 0x040000D4
_0801A344: .4byte gMultiSioSend
_0801A348: .4byte 0x85000005
_0801A34C:
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _0801A378 @ =0x040000D4
	mov r0, sl
	str r0, [r1]
	ldr r0, _0801A37C @ =gMultiSioSend
	str r0, [r1, #4]
	ldr r0, _0801A380 @ =0x85000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl CreateMultiplayerSinglePakResultsScreen
_0801A366:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A378: .4byte 0x040000D4
_0801A37C: .4byte gMultiSioSend
_0801A380: .4byte 0x85000005

@; new
