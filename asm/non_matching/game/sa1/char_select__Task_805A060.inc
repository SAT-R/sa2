.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0805A0FC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r0, [r5, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp]
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sl, r0
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r5, #0x20]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, _0805A100 @ =gGameMode
	ldrb r1, [r0]
	cmp r1, #1
	bls _0805A18E
	movs r3, #0
	ldr r0, _0805A104 @ =gMultiplayerConnections
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _0805A13E
	movs r6, #1
	ldr r2, _0805A108 @ =gMultiplayerMissingHeartbeats
_0805A0BC:
	ldr r1, _0805A10C @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _0805A128
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _0805A12C
	movs r0, #0
	ldr r1, _0805A110 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _0805A114 @ =gBackgroundsCopyQueueCursor
	ldr r0, _0805A118 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805A11C @ =gBgSpritesCount
	strb r4, [r0]
	ldr r1, _0805A120 @ =gVramGraphicsCopyCursor
	ldr r0, _0805A124 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl LinkCommunicationError
	b _0805A52C
	.align 2, 0
_0805A0FC: .4byte gCurTask
_0805A100: .4byte gGameMode
_0805A104: .4byte gMultiplayerConnections
_0805A108: .4byte gMultiplayerMissingHeartbeats
_0805A10C: .4byte gMultiSioStatusFlags
_0805A110: .4byte 0x0000FFFF
_0805A114: .4byte gBackgroundsCopyQueueCursor
_0805A118: .4byte gBackgroundsCopyQueueIndex
_0805A11C: .4byte gBgSpritesCount
_0805A120: .4byte gVramGraphicsCopyCursor
_0805A124: .4byte gVramGraphicsCopyQueueIndex
_0805A128:
	movs r0, #0
	strb r0, [r2]
_0805A12C:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _0805A13E
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	bne _0805A0BC
_0805A13E:
	ldr r1, _0805A1E8 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #1
	bls _0805A18E
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	movs r3, #0
	adds r4, r1, #0
	ldr r2, _0805A1EC @ =gMultiSioRecv
	mov r8, r2
	movs r6, #0
_0805A158:
	ldr r0, _0805A1F0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	beq _0805A186
	ldrb r0, [r7]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A186
	mov r0, r8
	adds r2, r6, r0
	ldrh r0, [r2]
	cmp r0, #0x20
	bls _0805A186
	adds r0, r1, #0
	ldrb r2, [r2, #2]
	lsls r0, r2
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
_0805A186:
	adds r6, #0x14
	adds r3, #1
	cmp r3, #3
	bls _0805A158
_0805A18E:
	adds r4, r5, #0
	adds r4, #0x2b
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	bl CheckCPUPartnerUnlock
	ldr r0, _0805A1F4 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	mov sb, r4
	adds r7, r5, #0
	adds r7, #0x2a
	cmp r0, #0
	beq _0805A1F8
	ldr r0, [r5, #0x24]
	cmp r0, #0x21
	bls _0805A1F8
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	ldrsb r1, [r7, r1]
	cmp r0, r1
	bne _0805A1F8
	ldr r0, _0805A1E8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0805A1F8
	movs r0, #0x6b
	bl m4aSongNumStart
	bl sub_805B858
	adds r2, r5, #0
	adds r2, #0x2f
	str r2, [sp, #0x10]
	adds r6, r5, #0
	adds r6, #0x2c
	adds r4, #2
	b _0805A358
	.align 2, 0
_0805A1E8: .4byte gGameMode
_0805A1EC: .4byte gMultiSioRecv
_0805A1F0: .4byte 0x04000128
_0805A1F4: .4byte gRepeatedKeys
_0805A1F8:
	ldr r2, _0805A244 @ =gRepeatedKeys
	ldrh r1, [r2]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x2f
	str r3, [sp, #0x10]
	mov r1, r8
	lsls r6, r1, #0x10
	cmp r0, #0
	beq _0805A270
	asrs r3, r6, #0x10
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r3, r0
	bne _0805A270
	ldr r0, [r5, #0x24]
	cmp r0, #0x21
	bls _0805A270
	ldr r0, [sp, #0x10]
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r3
	asrs r1, r0
	ands r1, r4
	cmp r1, #0
	bne _0805A270
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _0805A248 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0805A24C
	bl sub_805A9A4
	b _0805A25E
	.align 2, 0
_0805A244: .4byte gRepeatedKeys
_0805A248: .4byte gGameMode
_0805A24C:
	ldr r2, [r5, #0x1c]
	ldrh r0, [r2, #0x12]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2, #0x12]
	ldr r0, _0805A268 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805A26C @ =Task_805A54C
	str r0, [r1, #8]
_0805A25E:
	adds r6, r5, #0
	adds r6, #0x2c
	adds r4, r5, #0
	adds r4, #0x2d
	b _0805A358
	.align 2, 0
_0805A268: .4byte gCurTask
_0805A26C: .4byte Task_805A54C
_0805A270:
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805A290
	ldr r0, [r5, #0x24]
	cmp r0, #0x21
	bls _0805A290
	ldr r1, _0805A28C @ =0xFFFF0000
	adds r0, r6, r1
	lsrs r0, r0, #0x10
	mov r8, r0
	b _0805A2E8
	.align 2, 0
_0805A28C: .4byte 0xFFFF0000
_0805A290:
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0805A2C6
	ldr r0, [r5, #0x24]
	cmp r0, #0x21
	bls _0805A2C6
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r6, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r1, #0
	bne _0805A358
	movs r0, #1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x10
	b _0805A302
_0805A2C6:
	asrs r2, r6, #0x10
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r2, r0
	ble _0805A2E4
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r1, #0
	bne _0805A358
	movs r0, #1
	b _0805A2FA
_0805A2E4:
	cmp r2, r0
	bge _0805A30C
_0805A2E8:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r1, #0
	bne _0805A358
	movs r0, #2
_0805A2FA:
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x10
_0805A302:
	strb r0, [r1]
	movs r0, #0x67      @ SE_SHIFT
	bl m4aSongNumStart
	b _0805A358
_0805A30C:
	ldr r3, [sp, #0x10]
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r2
	asrs r1, r0
	movs r3, #1
	ands r1, r3
	adds r6, r5, #0
	adds r6, #0x2c
	adds r4, r5, #0
	adds r4, #0x2d
	cmp r1, #0
	beq _0805A358
	ldr r0, [r5, #0x24]
	cmp r0, #0x21
	bls _0805A358
	ldrb r1, [r4]
	cmp r1, #0
	beq _0805A348
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0805A33E
	adds r0, r2, #1
	b _0805A340
_0805A33E:
	subs r0, r2, #1
_0805A340:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _0805A358
_0805A348:
	strb r3, [r6]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #0x67      @ SE_SHIFT
	bl m4aSongNumStart
_0805A358:
	ldrb r0, [r6]
	strb r0, [r4]
	ldrb r1, [r6]
	cmp r1, #0
	beq _0805A39A
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A37A
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805A39A
	ldrh r0, [r5, #0x28]
	adds r0, #0x10
	b _0805A388
_0805A37A:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805A39A
	ldrh r0, [r5, #0x28]
	subs r0, #0x10
_0805A388:
	strh r0, [r5, #0x28]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A39A
	movs r0, #0
	strb r0, [r6]
_0805A39A:
	ldrh r1, [r5, #0x28]
	ldr r0, _0805A3BC @ =0x00003FFF
	ands r0, r1
	strh r0, [r5, #0x28]
	movs r0, #0x3f
	mov r1, r8
	ands r0, r1
	mov r2, sb
	strb r0, [r2]
	movs r1, #0
	ldrsb r1, [r7, r1]
	cmp r1, r0
	bgt _0805A3C0
	ldrh r0, [r5, #0x28]
	lsrs r0, r0, #8
	b _0805A3D4
	.align 2, 0
_0805A3BC: .4byte 0x00003FFF
_0805A3C0:
	ldrh r0, [r5, #0x28]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x18
	strb r2, [r7]
	ldrh r1, [r5, #0x28]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _0805A3D6
	adds r0, r2, #1
_0805A3D4:
	strb r0, [r7]
_0805A3D6:
	adds r2, r7, #0
	ldrb r1, [r7]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r7]
	cmp r0, #0x24
	ble _0805A458
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x24
	ble _0805A458
	movs r0, #0x28
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #6
	movs r3, #0xc4
	add r3, sl
	mov r8, r3
	movs r3, #0xc6
	add r3, sl
	mov ip, r3
	mov r3, sl
	adds r3, #0xc8
	str r3, [sp, #0x14]
	cmp r1, r0
	ble _0805A458
_0805A40C:
	ldrb r0, [r2]
	subs r0, #4
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x24
	bgt _0805A40C
	mov r4, sb
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x24
	ble _0805A432
_0805A424:
	ldrb r0, [r4]
	subs r0, #4
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x24
	bgt _0805A424
_0805A432:
	movs r1, #0x28
	ldrsh r0, [r5, r1]
	adds r1, r0, #0
	movs r2, #0x90
	lsls r2, r2, #6
	cmp r0, r2
	ble _0805A4D0
	ldr r0, _0805A454 @ =0xFFFFFC00
	adds r3, r0, #0
_0805A444:
	adds r0, r1, r3
	strh r0, [r5, #0x28]
	adds r1, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bgt _0805A444
	b _0805A4D0
	.align 2, 0
_0805A454: .4byte 0xFFFFFC00
_0805A458:
	adds r2, r7, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #0xc4
	add r1, sl
	mov r8, r1
	movs r3, #0xc6
	add r3, sl
	mov ip, r3
	mov r1, sl
	adds r1, #0xc8
	str r1, [sp, #0x14]
	cmp r0, #0x1b
	bgt _0805A4D0
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x1b
	bgt _0805A4D0
	movs r0, #0x28
	ldrsh r1, [r5, r0]
	ldr r0, _0805A53C @ =0x00001BFF
	cmp r1, r0
	bgt _0805A4D0
_0805A488:
	ldrb r0, [r2]
	adds r0, #4
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1b
	ble _0805A488
	mov r4, sb
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1b
	bgt _0805A4AE
_0805A4A0:
	ldrb r0, [r4]
	adds r0, #4
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1b
	ble _0805A4A0
_0805A4AE:
	movs r1, #0x28
	ldrsh r0, [r5, r1]
	adds r2, r0, #0
	ldr r1, _0805A53C @ =0x00001BFF
	cmp r0, r1
	bgt _0805A4D0
	movs r3, #0x80
	lsls r3, r3, #3
	adds r4, r3, #0
	adds r3, r1, #0
_0805A4C2:
	adds r1, r2, r4
	adds r2, r1, #0
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _0805A4C2
	strh r1, [r5, #0x28]
_0805A4D0:
	ldrh r2, [r5, #0x28]
	ldr r1, _0805A540 @ =0x000003FF
	adds r0, r1, #0
	ands r0, r2
	ldr r2, [sp, #8]
	strh r0, [r2, #0x1c]
	ldrh r2, [r5, #0x28]
	adds r0, r1, #0
	ands r0, r2
	ldr r3, [sp]
	strh r0, [r3, #0x1c]
	ldrh r2, [r5, #0x28]
	adds r0, r1, #0
	ands r0, r2
	mov r2, r8
	strh r0, [r2]
	ldrb r0, [r6]
	mov r3, ip
	strb r0, [r3]
	ldrh r0, [r5, #0x28]
	ands r1, r0
	ldr r0, [sp, #0xc]
	strh r1, [r0, #0x32]
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	ldr r0, [r5, #0x24]
	adds r0, #1
	str r0, [r5, #0x24]
	ldr r3, [sp, #4]
	str r0, [r3, #0x38]
	ldr r1, _0805A544 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #1
	bls _0805A52C
	ldr r2, _0805A548 @ =gMultiSioSend
	movs r0, #0x20
	strh r0, [r2]
	ldr r3, [sp, #8]
	ldrh r1, [r3, #0x1c]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r2, #2]
_0805A52C:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A53C: .4byte 0x00001BFF
_0805A540: .4byte 0x000003FF
_0805A544: .4byte gGameMode
_0805A548: .4byte gMultiSioSend

.syntax divided
