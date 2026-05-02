.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0801F360 @ =gGameMode
	ldrb r1, [r0]
	cmp r1, #1
	bls _0801F2C6
	ldr r1, _0801F364 @ =gMultiplayerPlayerTasks
	ldr r0, _0801F368 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sl, r1          @ sl = mpp
_0801F2C6:
	ldr r4, _0801F36C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0          @ sb = goal
	ldr r0, _0801F370 @ =0x0300000C
	adds r0, r0, r1
	mov r8, r0          @ r8 = s
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp, #4]    @ sp04 = me
	mov r2, sb
	ldrb r1, [r2, #8]
	lsls r1, r1, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10  @ r1 = worldX << 16
	ldr r3, [sp, #4]
	ldrb r2, [r3, #1]
	lsls r2, r2, #3
	mov r5, sb
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0     @ r2 = worldY
	ldr r3, _0801F374 @ =gCamera
	ldrh r0, [r3]
	lsrs r5, r1, #0x10
	str r5, [sp]        @ sp00 = worldX
	asrs r5, r1, #0x10  @ r5 = worldX
	subs r0, r5, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldrh r0, [r3, #2]
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10  @ r6 = worldY
	subs r0, r6, r0
	strh r0, [r1, #0x18] @ s->y = worldY - gCamera.y;
	ldr r2, _0801F360 @ =gGameMode
	ldrb r7, [r2]
	cmp r7, #3
	beq _0801F324
	cmp r7, #5
	beq _0801F324
	b _0801F4D8
_0801F324:
	movs r3, #1
	str r3, [sp, #8]
	ldr r1, _0801F378 @ =gPlayer
	ldr r0, [r1]
	asrs r3, r0, #8     @ r3 = playerWorldX
	adds r4, r1, #0     @ r4 = r1 = gPlayer
	cmp r3, r5
	bgt _0801F336
	b _0801F4B8
_0801F336:
	ldr r0, _0801F37C @ =gCurrentLevel
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #7
	bne _0801F34C
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	adds r1, r6, #0
	subs r1, #0x50      @ r1 = worldY - 80
	cmp r0, r1
	bgt _0801F3D2
_0801F34C:
	cmp r7, #1
	bls _0801F380
	cmp r2, #0xa
	bne _0801F3C4
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r0, r6
	blt _0801F3D2
	b _0801F3C4
	.align 2, 0
_0801F360: .4byte gGameMode
_0801F364: .4byte gMultiplayerPlayerTasks
_0801F368: .4byte 0x04000128
_0801F36C: .4byte gCurTask
_0801F370: .4byte 0x0300000C
_0801F374: .4byte gCamera
_0801F378: .4byte gPlayer
_0801F37C: .4byte gCurrentLevel
_0801F380:
	cmp r2, #0xa
	bne _0801F3C4
	ldr r1, [r4, #0x64]
	adds r0, r1, #0
	adds r0, #0x38
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r3, r3, r2
	cmp r3, r5
	bgt _0801F3C4
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r5
	blt _0801F3C4
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	movs r5, #0x39
	ldrsb r2, [r5, r1]
	adds r3, r0, r2
	cmp r3, r6
	bgt _0801F3C4
	adds r0, r1, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r6
	bge _0801F3D2
_0801F3C4:
	ldr r1, _0801F494 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #7
	beq _0801F4B8
	cmp r0, #0xa
	beq _0801F4B8
_0801F3D2:
	mov r2, sl          @ r2 = sl = mpp
	ldr r0, [r2, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x5c]
	ldr r3, [sp]        @ r3 = *sp00 = worldX
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, #0x78
	ldr r5, _0801F498 @ =gCamera
	strh r0, [r5, #0x1a]
	movs r4, #0
	ldr r1, _0801F49C @ =gMultiplayerPlayerTasks
	ldr r0, [r1]
	cmp r0, #0
	beq _0801F460
	ldr r6, _0801F4A0 @ =0x04000128
	adds r7, r1, #0
	movs r0, #0x10
	mov ip, r0
	ldr r1, _0801F4A4 @ =gMultiplayerConnections
	mov sl, r1          @ sl = gMultiplayerConnections
_0801F3FE:
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0801F44C
	lsls r0, r4, #2
	adds r0, r0, r7
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	mov r2, sl          @ r2 = sl = gMultiplayerConnections
	ldrb r3, [r2]
	mov r2, ip
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	mov r0, ip
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	bne _0801F44C
	ldr r3, _0801F4A8 @ =0x03000054
	adds r0, r5, r3
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F44C
	movs r5, #0
	str r5, [sp, #8]
_0801F44C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _0801F460
	lsls r0, r4, #2
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bne _0801F3FE
_0801F460:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0801F468
	b _0801F620
_0801F468:
	ldr r1, _0801F4AC @ =gMultiplayerRanks
	ldr r0, _0801F4A0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801F482
	b _0801F5DA
_0801F482:
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0801F4B0 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _0801F4B4 @ =Task_StageGoal3
	b _0801F606_callTaskMain
	.align 2, 0
_0801F494: .4byte gCurrentLevel
_0801F498: .4byte gCamera
_0801F49C: .4byte gMultiplayerPlayerTasks
_0801F4A0: .4byte 0x04000128
_0801F4A4: .4byte gMultiplayerConnections
_0801F4A8: .4byte 0x03000054
_0801F4AC: .4byte gMultiplayerRanks
_0801F4B0: .4byte gCurTask
_0801F4B4: .4byte Task_StageGoal3
_0801F4B8:
	ldr r0, _0801F4D0 @ =gRefCollision
	ldr r0, [r0]
	ldrh r0, [r0, #0x1c]
	ldr r1, _0801F4D4 @ =gCamera
	strh r0, [r1, #0x1a]
	mov r2, sl          @ r2 = sl = mpp
	ldr r0, [r2, #0x5c]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x5c]
	b _0801F620
	.align 2, 0
_0801F4D0: .4byte gRefCollision
_0801F4D4: .4byte gCamera
_0801F4D8:
	ldr r1, _0801F510 @ =gPlayer
	ldr r0, [r1]
	asrs r2, r0, #8
	adds r4, r1, #0
	cmp r2, r5
	bgt _0801F4E6
	b _0801F620
_0801F4E6:
	ldr r0, _0801F514 @ =gCurrentLevel
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #7
	bne _0801F4FC
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	adds r1, r6, #0
	subs r1, #0x50
	cmp r0, r1
	bgt _0801F572
_0801F4FC:
	cmp r7, #1
	bls _0801F518
	cmp r3, #0xa
	bne _0801F564
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r0, r6
	blt _0801F572
	b _0801F564
	.align 2, 0
_0801F510: .4byte gPlayer
_0801F514: .4byte gCurrentLevel
_0801F518:
	cmp r3, #0xa
	bne _0801F564
	ldr r3, [r4, #0x64]
	mov ip, r3
	mov r0, ip
	adds r0, #0x38
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r2, r1
	cmp r3, r5
	bgt _0801F564
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r5
	blt _0801F564
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	mov r3, ip
	adds r3, #0x39
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r1, r6
	bgt _0801F564
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r6
	bge _0801F572
_0801F564:
	ldr r5, _0801F594 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #7
	beq _0801F620
	cmp r0, #0xa
	beq _0801F620
_0801F572:
	ldr r1, _0801F598 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #1
	bls _0801F5A4
	ldr r1, _0801F59C @ =gMultiplayerRanks
	ldr r0, _0801F5A0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801F5B2
	b _0801F5DA
	.align 2, 0
_0801F594: .4byte gCurrentLevel
_0801F598: .4byte gGameMode
_0801F59C: .4byte gMultiplayerRanks
_0801F5A0: .4byte 0x04000128
_0801F5A4:
	ldr r0, _0801F5C4 @ =gMultiplayerRanks
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0801F5D0
_0801F5B2:
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0801F5C8 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _0801F5CC @ =Task_StageGoal3
	b _0801F606_callTaskMain
	.align 2, 0
_0801F5C4: .4byte gMultiplayerRanks
_0801F5C8: .4byte gCurTask
_0801F5CC: .4byte Task_StageGoal3
_0801F5D0:
	ldr r0, _0801F610 @ =gStageFlags
	ldrh r1, [r0]
	movs r2, #3
	orrs r1, r2
	strh r1, [r0]
_0801F5DA:
	ldr r3, _0801F614 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0xa
	beq _0801F5EA
	movs r0, #0x87
	bl m4aSongNumStart
_0801F5EA:
	movs r1, #0
	movs r0, #0
	mov r5, sb      @ r5 = sb = goal
	strh r0, [r5, #0x3c]
	mov r0, sb
	adds r0, #0x3e
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0801F618 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801F61C @ =Task_StageGoal2
_0801F606_callTaskMain:
	str r0, [r1, #8]
	bl _call_via_r0
	b _0801F670
	.align 2, 0
_0801F610: .4byte gStageFlags
_0801F614: .4byte gCurrentLevel
_0801F618: .4byte gCurTask
_0801F61C: .4byte Task_StageGoal2
_0801F620:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0801F648
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _0801F648
	movs r5, #0x18
	ldrsh r1, [r2, r5]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0801F660
_0801F648:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
	ldr r3, _0801F65C @ =gCurTask
	ldr r0, [r3]
	bl TaskDestroy
	b _0801F670
	.align 2, 0
_0801F65C: .4byte gCurTask
_0801F660:
	ldr r5, [sp, #4]
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0801F670
	mov r0, r8
	bl DisplaySprite
_0801F670:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
