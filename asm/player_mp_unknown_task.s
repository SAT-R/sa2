.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080D5744
gUnknown_080D5744:
    .4byte sub_8019240
    .4byte sub_80192A8
    .4byte sub_80192FC
    .4byte sub_8019350
    .4byte sub_8019368
    .4byte sub_8018AD8
    .4byte sub_8018E00
    .4byte VoidReturnSIOControl32
    .4byte 0

.text
.syntax unified
.arm

	thumb_func_start sub_80188FC
sub_80188FC: @ 0x080188FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080189B0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov sl, r0
	ldr r0, _080189B4 @ =gMultiSioSend
	mov r8, r0
	ldrh r5, [r0, #8]
	movs r3, #0x80
	lsls r3, r3, #5
	mov r1, sl
	lsls r3, r1
	ands r5, r3
	movs r4, #0
	ldr r2, _080189B8 @ =gMultiplayerConnections
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801898A
	ldr r0, _080189BC @ =gMultiSioStatusFlags
	movs r6, #1
	ldr r0, [r0]
	mov ip, r0
	movs r2, #0xa0
	lsls r2, r2, #7
	mov sb, r2
	adds r7, r3, #0
_08018940:
	adds r0, r6, #0
	lsls r0, r4
	mov r1, ip
	ands r0, r1
	cmp r0, #0
	beq _08018A06
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080189C0 @ =gMultiSioRecv
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, sb
	bne _08018974
	movs r2, #0
	cmp r5, #0
	bne _08018964
	movs r2, #1
_08018964:
	movs r3, #0
	ldrh r0, [r1, #8]
	ands r0, r7
	cmp r0, #0
	bne _08018970
	movs r3, #1
_08018970:
	cmp r2, r3
	bne _08018A06
_08018974:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _0801898A
	ldr r2, _080189B8 @ =gMultiplayerConnections
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	bne _08018940
_0801898A:
	ldr r0, _080189C4 @ =gUnknown_03005438
	ldr r3, _080189C8 @ =gUnknown_03005420
	ldrb r4, [r3]
	ldrb r0, [r0]
	cmp r0, r4
	bne _080189D8
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080189CC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080189D0 @ =gMultiSioSend + 0xE
	str r0, [r1, #4]
	ldr r0, _080189D4 @ =0x81000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08018A06
	.align 2, 0
_080189B0: .4byte 0x04000128
_080189B4: .4byte gMultiSioSend
_080189B8: .4byte gMultiplayerConnections
_080189BC: .4byte gMultiSioStatusFlags
_080189C0: .4byte gMultiSioRecv
_080189C4: .4byte gUnknown_03005438
_080189C8: .4byte gUnknown_03005420
_080189CC: .4byte 0x040000D4
_080189D0: .4byte gMultiSioSend + 0xE
_080189D4: .4byte 0x81000003
_080189D8:
	ldr r2, _08018A18 @ =0x040000D4
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08018A1C @ =gUnknown_03005510
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08018A20 @ =gMultiSioSend + 0xE
	str r0, [r2, #4]
	ldr r0, _08018A24 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	mov r1, sl
	lsls r0, r1
	mov r2, r8
	ldrh r1, [r2, #8]
	eors r0, r1
	strh r0, [r2, #8]
_08018A06:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018A18: .4byte 0x040000D4
_08018A1C: .4byte gUnknown_03005510
_08018A20: .4byte gMultiSioSend + 0xE
_08018A24: .4byte 0x80000003

	thumb_func_start sub_8018A28
sub_8018A28: @ 0x08018A28
	push {r4, r5, r6, r7, lr}
	ldr r0, _08018A40 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r6, r0, #0x1e
	ldr r7, _08018A44 @ =gMultiSioSend
	movs r5, #0
	cmp r5, r6
	beq _08018AA6
	ldr r0, _08018A48 @ =gMultiplayerConnections
	ldrb r0, [r0]
	b _08018ABA
	.align 2, 0
_08018A40: .4byte 0x04000128
_08018A44: .4byte gMultiSioSend
_08018A48: .4byte gMultiplayerConnections
_08018A4C:
	ldr r0, _08018AC8 @ =gMultiSioStatusFlags
	movs r1, #1
	lsls r1, r5
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08018AA6
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08018ACC @ =gMultiSioRecv
	adds r3, r0, r1
	ldrh r1, [r3]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bne _08018AA6
	ldrh r1, [r3, #8]
	movs r4, #0x80
	lsls r4, r4, #5
	lsls r4, r5
	ands r1, r4
	ldrh r0, [r7, #8]
	ands r0, r4
	cmp r1, r0
	beq _08018AA6
	ldrb r0, [r3, #0xe]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _08018AA0
	ldr r0, _08018AD0 @ =gUnknown_080D5744
	ldrb r1, [r3, #0xe]
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r5, #0
	bl _call_via_r2
_08018AA0:
	ldrh r0, [r7, #8]
	eors r4, r0
	strh r4, [r7, #8]
_08018AA6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _08018AC2
	cmp r5, r6
	beq _08018AA6
	ldr r0, _08018AD4 @ =gMultiplayerConnections
	ldrb r0, [r0]
	asrs r0, r5
_08018ABA:
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08018A4C
_08018AC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018AC8: .4byte gMultiSioStatusFlags
_08018ACC: .4byte gMultiSioRecv
_08018AD0: .4byte gUnknown_080D5744
_08018AD4: .4byte gMultiplayerConnections

	thumb_func_start sub_8018AD8
sub_8018AD8: @ 0x08018AD8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r2, _08018B48 @ =gMultiplayerPlayerTasks
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r3, _08018B4C @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08018B0E
	b _08018DEA
_08018B0E:
	ldr r2, _08018B50 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08018B1E
	b _08018DEA
_08018B1E:
	ldr r1, _08018B54 @ =gUnknown_030054B4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08018B36
	b _08018DEA
_08018B36:
	ldrb r0, [r7, #0xf]
	cmp r0, #4
	bls _08018B3E
	b _08018DEA
_08018B3E:
	lsls r0, r0, #2
	ldr r1, _08018B58 @ =_08018B5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018B48: .4byte gMultiplayerPlayerTasks
_08018B4C: .4byte 0x04000128
_08018B50: .4byte gPlayer
_08018B54: .4byte gUnknown_030054B4
_08018B58: .4byte _08018B5C
_08018B5C: @ jump table
	.4byte _08018B70 @ case 0
	.4byte _08018BD8 @ case 1
	.4byte _08018CD4 @ case 2
	.4byte _08018D5C @ case 3
	.4byte _08018DAC @ case 4
_08018B70:
	ldr r0, _08018BCC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018BA4
	ldr r0, _08018BD0 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018BD4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	bne _08018BA4
	b _08018DEA
_08018BA4:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A9A4
	movs r0, #0xd9
	bl m4aSongNumStart
	b _08018DEA
	.align 2, 0
_08018BCC: .4byte gGameMode
_08018BD0: .4byte gMultiplayerConnections
_08018BD4: .4byte 0x04000128
_08018BD8:
	ldr r0, _08018CBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r7, #0x10]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08018BE8
	b _08018DEA
_08018BE8:
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08018BF8
	b _08018DEA
_08018BF8:
	ldr r4, [r5, #0x20]
	ldr r0, _08018CC0 @ =0x40600000
	ands r4, r0
	cmp r4, #0
	beq _08018C04
	b _08018DEA
_08018C04:
	adds r0, r5, #0
	bl sub_8021694
	adds r0, r6, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #8]
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x58
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _08018CC4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r4, [r5, #0x20]
	adds r2, r5, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r4, _08018CC8 @ =0xFFFFCFFF
	ands r0, r4
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
	ands r0, r4
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	ldr r3, _08018CCC @ =gCamera
	adds r2, r3, #0
	adds r2, #0x50
	ldrh r1, [r2]
	ldr r0, _08018CD0 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r2]
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r3]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r3, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r3, #4]
	movs r0, #0xda
	bl m4aSongNumStart
	b _08018DEA
	.align 2, 0
_08018CBC: .4byte 0x04000128
_08018CC0: .4byte 0x40600000
_08018CC4: .4byte gMPlayInfo_BGM
_08018CC8: .4byte 0xFFFFCFFF
_08018CCC: .4byte gCamera
_08018CD0: .4byte 0x0000FFFC
_08018CD4:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x17
	ands r0, r1
	cmp r0, #0
	beq _08018CE2
	b _08018DEA
_08018CE2:
	ldr r0, _08018D4C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018D14
	ldr r0, _08018D50 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018D54 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08018DEA
_08018D14:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r5, #0x30]
	ldrb r1, [r2]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A9A4
	movs r0, #0xd9
	bl m4aSongNumStart
	ldr r0, _08018D58 @ =gMPlayInfo_BGM
	movs r1, #0x80
	bl m4aMPlayTempoControl
	b _08018DEA
	.align 2, 0
_08018D4C: .4byte gGameMode
_08018D50: .4byte gMultiplayerConnections
_08018D54: .4byte 0x04000128
_08018D58: .4byte gMPlayInfo_BGM
_08018D5C:
	ldr r0, _08018D9C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018D8E
	ldr r0, _08018DA0 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018DA4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08018DEA
_08018D8E:
	ldr r1, _08018DA8 @ =IWRAM_START + 0x5B7C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xdb
	bl m4aSongNumStart
	b _08018DEA
	.align 2, 0
_08018D9C: .4byte gGameMode
_08018DA0: .4byte gMultiplayerConnections
_08018DA4: .4byte 0x04000128
_08018DA8: .4byte IWRAM_START + 0x5B7C
_08018DAC:
	ldr r0, _08018DF0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018DDE
	ldr r0, _08018DF4 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018DF8 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08018DEA
_08018DDE:
	ldr r1, _08018DFC @ =gUnknown_0300583C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xd8
	bl m4aSongNumStart
_08018DEA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018DF0: .4byte gGameMode
_08018DF4: .4byte gMultiplayerConnections
_08018DF8: .4byte 0x04000128
_08018DFC: .4byte gUnknown_0300583C

	thumb_func_start sub_8018E00
sub_8018E00: @ 0x08018E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, _08018E84 @ =gMultiplayerPlayerTasks
	mov r1, r8
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp]
	movs r7, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08018ED8
	ldr r0, _08018E88 @ =gGameMode
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r2, #0
	movs r2, #0x10
	mov sb, r2
	ldr r6, _08018E8C @ =0x04000128
	ldr r4, _08018E90 @ =gUnknown_030054B4
_08018E4C:
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r2, ip
	cmp r2, #4
	beq _08018E94
	ldr r0, [r1, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08018EC8
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r1, #2
	cmp r0, r1
	beq _08018EC8
	movs r2, #1
	add sl, r2
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
	b _08018EC8
	.align 2, 0
_08018E84: .4byte gMultiplayerPlayerTasks
_08018E88: .4byte gGameMode
_08018E8C: .4byte 0x04000128
_08018E90: .4byte gUnknown_030054B4
_08018E94:
	ldr r1, _08018EF8 @ =gMultiplayerConnections
	ldrb r3, [r1]
	mov r2, sb
	lsls r2, r7
	ands r2, r3
	adds r0, r7, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	mov r0, sb
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	beq _08018EC8
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08018EC8
	movs r2, #1
	mov sl, r2
_08018EC8:
	adds r5, #4
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bhi _08018ED8
	ldr r0, [r5]
	cmp r0, #0
	bne _08018E4C
_08018ED8:
	ldr r0, _08018EFC @ =gUnknown_030054B4
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08018F00
	mov r0, sl
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl sub_8019CCC
	b _08018F04
	.align 2, 0
_08018EF8: .4byte gMultiplayerConnections
_08018EFC: .4byte gUnknown_030054B4
_08018F00:
	movs r1, #1
	str r1, [sp, #0xc]
_08018F04:
	ldr r0, _08019080 @ =gGameMode
	ldrb r0, [r0]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #0x14]
	ldr r1, [sp, #8]
	subs r1, #1
	str r1, [sp, #0x10]
	cmp r0, #4
	bne _08018FFE
	movs r7, #0
	ldr r0, _08019084 @ =gMultiplayerPlayerTasks
	ldr r0, [r0]
	cmp r0, #0
	beq _08018FFE
	movs r2, #0x10
	mov sb, r2
	mov r0, sb
	mov r1, r8
	lsls r0, r1
	mov sb, r0
	ldr r6, _08019088 @ =gPlayer
_08018F30:
	cmp r7, r8
	beq _08018FEC
	ldr r0, _0801908C @ =gUnknown_030054B4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _08018FEC
	ldr r0, _08019090 @ =gMultiplayerConnections
	ldrb r2, [r0]
	movs r0, #0x10
	lsls r0, r7
	ands r0, r2
	adds r1, r7, #4
	asrs r0, r1
	mov r1, sb
	ands r2, r1
	mov r1, r8
	adds r1, #4
	asrs r2, r1
	cmp r0, r2
	bne _08018FEC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r2, sl
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, _08019094 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	bne _08018FEC
	adds r0, r6, #0
	bl sub_80218E4
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	adds r1, #0x1c
	ands r0, r1
	subs r1, #0xc
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08019098 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _0801909C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
	movs r5, #0
	movs r4, #0
	movs r0, #0x14
	ldr r1, _080190A0 @ =gPlayer + 0x64
	strh r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r0, r6, #0
	adds r0, #0x61
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	adds r0, r6, #0
	adds r0, #0x5c
	strh r4, [r0]
	movs r0, #1
	orrs r1, r0
	movs r0, #0x1c
	ldr r2, _080190A0 @ =gPlayer + 0x64
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r6, #0x20]
_08018FEC:
	adds r7, #1
	cmp r7, #3
	bhi _08018FFE
	ldr r0, _08019084 @ =gMultiplayerPlayerTasks
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08018F30
_08018FFE:
	ldr r1, [sp]
	ldr r0, [r1, #0x5c]
	movs r2, #1
	orrs r0, r2
	str r0, [r1, #0x5c]
	mov r0, sl
	cmp r0, #0
	bne _08019028
	ldr r3, _080190A4 @ =gUnknown_03005424
	ldrh r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08019028
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _080190A8 @ =gCourseTime
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08019028:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bhs _08019038
	ldr r0, _08019080 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08019104
_08019038:
	movs r7, #0
	ldr r0, _08019084 @ =gMultiplayerPlayerTasks
	ldr r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _080190FA
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	ldr r5, _08019088 @ =gPlayer
	adds r6, r5, #0
	adds r6, #0x5c
_08019050:
	lsls r0, r7, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, _0801908C @ =gUnknown_030054B4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080190E6
	ldr r0, _08019080 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _080190AC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_8019CCC
	b _080190E6
	.align 2, 0
_08019080: .4byte gGameMode
_08019084: .4byte gMultiplayerPlayerTasks
_08019088: .4byte gPlayer
_0801908C: .4byte gUnknown_030054B4
_08019090: .4byte gMultiplayerConnections
_08019094: .4byte 0x04000128
_08019098: .4byte 0xFFFFFBFF
_0801909C: .4byte 0xFFFFFEFF
_080190A0: .4byte gPlayer + 0x64
_080190A4: .4byte gUnknown_03005424
_080190A8: .4byte gCourseTime
_080190AC:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x10]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x5c]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	strh r0, [r6]
	ldr r3, _08019114 @ =gUnknown_03005438
	ldrb r1, [r3]
	lsls r2, r1, #3
	ldr r0, _08019118 @ =gUnknown_03005510
	adds r2, r2, r0
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r3]
	movs r0, #7
	strb r0, [r2]
_080190E6:
	adds r7, #1
	cmp r7, #3
	bhi _080190FA
	ldr r0, _0801911C @ =gMultiplayerPlayerTasks
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _08019050
_080190FA:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08019104
	bl sub_8019F08
_08019104:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019114: .4byte gUnknown_03005438
_08019118: .4byte gUnknown_03005510
_0801911C: .4byte gMultiplayerPlayerTasks

@; New task
	thumb_func_start sub_8019120
sub_8019120: @ 0x08019120
	push {r4, lr}
	sub sp, #8
	ldr r0, _08019178 @ =sub_80188FC
	ldr r2, _0801917C @ =0x0000FFFE
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r4, [sp, #4]
	ldr r2, _08019180 @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019184 @ =gMultiSioSend
	str r1, [r2, #4]
	ldr r1, _08019188 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _0801918C @ =gMultiSioRecv
	str r1, [r2, #4]
	ldr r1, _08019190 @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019194 @ =gUnknown_03005510
	str r1, [r2, #4]
	ldr r1, _08019198 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r2, _0801919C @ =gUnknown_03005438
	ldr r1, _080191A0 @ =gUnknown_03005420
	strb r4, [r1]
	strb r4, [r2]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08019178: .4byte sub_80188FC
_0801917C: .4byte 0x0000FFFE
_08019180: .4byte 0x040000D4
_08019184: .4byte gMultiSioSend
_08019188: .4byte 0x85000005
_0801918C: .4byte gMultiSioRecv
_08019190: .4byte 0x85000014
_08019194: .4byte gUnknown_03005510
_08019198: .4byte 0x85000020
_0801919C: .4byte gUnknown_03005438
_080191A0: .4byte gUnknown_03005420

@; task
	thumb_func_start sub_80191A4
sub_80191A4: @ 0x080191A4
	push {r4, lr}
	sub sp, #8
	ldr r0, _080191FC @ =sub_8018A28
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl TaskCreate
	str r4, [sp, #4]
	ldr r2, _08019200 @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019204 @ =gMultiSioSend
	str r1, [r2, #4]
	ldr r1, _08019208 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _0801920C @ =gMultiSioRecv
	str r1, [r2, #4]
	ldr r1, _08019210 @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019214 @ =gUnknown_03005510
	str r1, [r2, #4]
	ldr r1, _08019218 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _0801921C @ =gUnknown_03005420
	strb r4, [r1]
	ldr r1, _08019220 @ =gUnknown_03005438
	strb r4, [r1]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080191FC: .4byte sub_8018A28
_08019200: .4byte 0x040000D4
_08019204: .4byte gMultiSioSend
_08019208: .4byte 0x85000005
_0801920C: .4byte gMultiSioRecv
_08019210: .4byte 0x85000014
_08019214: .4byte gUnknown_03005510
_08019218: .4byte 0x85000020
_0801921C: .4byte gUnknown_03005420
_08019220: .4byte gUnknown_03005438
