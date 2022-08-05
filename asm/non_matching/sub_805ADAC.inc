.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r4, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r2, #1
	str r2, [sp, #0x14]
	ldr r0, _0805AE30 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, r6, #0
	bl sub_802D4CC
	ldr r0, _0805AE34 @ =gMultiSioStatusFlags
	ldr r2, [r0]
	movs r0, #0x81
	ands r0, r2
	cmp r0, #0
	beq _0805AE60
	ldr r3, _0805AE38 @ =0x04000128
	ldr r1, [r3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	ldr r0, [sp, #0x14]
	lsls r0, r1
	ands r2, r0
	cmp r2, #0
	bne _0805AE50
	ldr r1, _0805AE3C @ =gUnknown_030054D4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r2, r1, #1
	strb r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xb4
	bls _0805AE60
	ldr r1, _0805AE40 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805AE44 @ =gUnknown_03002AE4
	ldr r0, _0805AE48 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805AE4C @ =gUnknown_03005390
	mov r1, sp
	ldrb r1, [r1, #8]
	strb r1, [r0]
	b _0805B1F6
	.align 2, 0
_0805AE30: .4byte gCurTask
_0805AE34: .4byte gMultiSioStatusFlags
_0805AE38: .4byte 0x04000128
_0805AE3C: .4byte gUnknown_030054D4
_0805AE40: .4byte 0x0000FFFF
_0805AE44: .4byte gUnknown_03002AE4
_0805AE48: .4byte gUnknown_0300287C
_0805AE4C: .4byte gUnknown_03005390
_0805AE50:
	ldr r1, _0805AEBC @ =gUnknown_030054D4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
_0805AE60:
	ldr r1, _0805AEC0 @ =gMultiSioStatusFlags
	ldr r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0805AE70
	movs r4, #1
_0805AE70:
	ldr r0, _0805AEC4 @ =gMultiSioRecv
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	bne _0805AE92
	cmp r4, #0
	beq _0805AED8
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0805AED8
	ldr r1, _0805AEC4 @ =gMultiSioRecv
	ldrh r0, [r1]
	cmp r0, #0
	beq _0805AED8
_0805AE92:
	adds r1, r6, #0
	adds r1, #0xfd
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0805AEE0
	ldr r1, _0805AEC8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805AECC @ =gUnknown_03002AE4
	ldr r0, _0805AED0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805AED4 @ =gUnknown_03005390
	movs r0, #0
	b _0805B1F4
	.align 2, 0
_0805AEBC: .4byte gUnknown_030054D4
_0805AEC0: .4byte gMultiSioStatusFlags
_0805AEC4: .4byte gMultiSioRecv
_0805AEC8: .4byte 0x0000FFFF
_0805AECC: .4byte gUnknown_03002AE4
_0805AED0: .4byte gUnknown_0300287C
_0805AED4: .4byte gUnknown_03005390
_0805AED8:
	adds r1, r6, #0
	adds r1, #0xfd
	movs r0, #0
	strb r0, [r1]
_0805AEE0:
	movs r5, #0
	adds r2, r6, #0
	adds r2, #0xfa
	str r2, [sp, #0x20]
	movs r7, #1
	adds r4, r6, #0
	adds r4, #0xee
	movs r0, #0xf2
	adds r0, r0, r6
	mov ip, r0
	movs r1, #0
	str r1, [sp, #0x28]
	movs r2, #0
	str r2, [sp, #0x2c]
	mov sl, r2
	ldr r0, _0805AF98 @ =gUnknown_03005460
	mov sb, r0
_0805AF02:
	lsls r1, r5, #2
	str r1, [sp, #0x30]
	ldr r3, _0805AF9C @ =gMultiSioRecv
	add r3, sl
	ldrb r0, [r4]
	lsls r0, r0, #1
	strb r0, [r4]
	mov r2, ip
	ldrb r0, [r2]
	lsls r0, r0, #1
	strb r0, [r2]
	ldr r0, _0805AFA0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r5, r0
	beq _0805AF3A
	adds r1, r7, #0
	lsls r1, r5
	ldr r2, _0805AFA4 @ =gMultiSioStatusFlags
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0805AFB8
	ldrh r0, [r3]
	ldr r1, _0805AFA8 @ =0x0000400F
	cmp r0, r1
	bls _0805AFB8
_0805AF3A:
	ldrb r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4]
	ldr r2, [sp]
	adds r2, #1
	str r2, [sp]
	adds r0, r7, #0
	lsls r0, r5
	ldr r1, [sp, #8]
	orrs r1, r0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0805AF60
	movs r0, #1
	str r0, [sp, #0x10]
_0805AF60:
	ldr r0, _0805AFAC @ =gUnknown_03005410
	ldr r1, [sp, #0x30]
	adds r0, r1, r0
	ldr r1, [r3, #4]
	str r1, [r0]
	ldrh r0, [r3, #8]
	mov r2, sb
	strh r0, [r2]
	ldr r0, _0805AF98 @ =gUnknown_03005460
	adds r0, #2
	ldr r1, [sp, #0x2c]
	adds r0, r1, r0
	ldrh r1, [r3, #0xa]
	strh r1, [r0]
	ldrh r0, [r3, #0xc]
	strh r0, [r2, #4]
	ldr r2, _0805AFB0 @ =gUnknown_03005594
	ldrb r0, [r2]
	ldrb r1, [r3, #0xe]
	orrs r0, r1
	strb r0, [r2]
	ldr r2, _0805AFB4 @ =gUnknown_030054D8
	ldrb r1, [r3, #0xf]
	ldrb r0, [r2]
	cmp r0, r1
	bhs _0805B01E
	strb r1, [r2]
	b _0805B01E
	.align 2, 0
_0805AF98: .4byte gUnknown_03005460
_0805AF9C: .4byte gMultiSioRecv
_0805AFA0: .4byte 0x04000128
_0805AFA4: .4byte gMultiSioStatusFlags
_0805AFA8: .4byte 0x0000400F
_0805AFAC: .4byte gUnknown_03005410
_0805AFB0: .4byte gUnknown_03005594
_0805AFB4: .4byte gUnknown_030054D8
_0805AFB8:
	ldr r2, [sp, #0x28]
	ldr r1, _0805AFF0 @ =0x04000120
	adds r0, r2, r1
	ldrh r0, [r0]
	str r0, [sp, #0x30]
	movs r2, #1
	str r2, [sp, #0xc]
	adds r1, r2, #0
	lsls r1, r5
	ldr r2, _0805AFF4 @ =gMultiSioStatusFlags
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _0805AFF8
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _0805AFF8
	movs r1, #1
	str r1, [sp, #0x10]
	mov r2, ip
	ldrb r0, [r2]
	adds r1, r7, #0
	orrs r1, r0
	strb r1, [r2]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805B024
	b _0805B01A
	.align 2, 0
_0805AFF0: .4byte 0x04000120
_0805AFF4: .4byte gMultiSioStatusFlags
_0805AFF8:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805B016
	adds r1, r7, #0
	lsls r1, r5
	ldr r2, _0805B08C @ =gMultiSioStatusFlags
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0805B01E
	ldrh r0, [r3]
	ldr r1, _0805B090 @ =0x0000400F
	cmp r0, r1
	bhi _0805B01E
_0805B016:
	movs r2, #1
	str r2, [sp, #0x10]
_0805B01A:
	movs r0, #0
	str r0, [sp, #0x14]
_0805B01E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0805B02A
_0805B024:
	ldr r1, [sp, #4]
	adds r1, #1
	str r1, [sp, #4]
_0805B02A:
	adds r4, #1
	movs r2, #1
	add ip, r2
	ldr r0, [sp, #0x28]
	adds r0, #2
	str r0, [sp, #0x28]
	movs r1, #0xc
	add sb, r1
	ldr r2, [sp, #0x2c]
	adds r2, #0xc
	str r2, [sp, #0x2c]
	movs r0, #0x14
	add sl, r0
	adds r5, #1
	cmp r5, #3
	bgt _0805B04C
	b _0805AF02
_0805B04C:
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _0805B056
	movs r2, #1
	str r2, [sp, #4]
_0805B056:
	ldr r0, [sp, #0x20]
	ldrb r4, [r0]
	cmp r4, #0
	bne _0805B0AE
	ldr r1, _0805B08C @ =gMultiSioStatusFlags
	ldr r0, [r1]
	movs r1, #0x81
	ands r0, r1
	cmp r0, #1
	bne _0805B0A8
	mov r2, r8
	ldrh r1, [r2]
	ldr r0, _0805B094 @ =0x00004010
	cmp r1, r0
	bls _0805B0A8
	ldr r1, _0805B098 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B09C @ =gUnknown_03002AE4
	ldr r0, _0805B0A0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0805B0A4 @ =gUnknown_03005390
	strb r4, [r0]
	b _0805B1F6
	.align 2, 0
_0805B08C: .4byte gMultiSioStatusFlags
_0805B090: .4byte 0x0000400F
_0805B094: .4byte 0x00004010
_0805B098: .4byte 0x0000FFFF
_0805B09C: .4byte gUnknown_03002AE4
_0805B0A0: .4byte gUnknown_0300287C
_0805B0A4: .4byte gUnknown_03005390
_0805B0A8:
	movs r0, #1
	ldr r1, [sp, #0x20]
	strb r0, [r1]
_0805B0AE:
	mov r2, r8
	ldrh r1, [r2]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0805B0BA
	b _0805B1D8
_0805B0BA:
	ldr r0, _0805B130 @ =0x00004011
	cmp r1, r0
	beq _0805B0C2
	b _0805B1D8
_0805B0C2:
	ldr r2, [sp, #0x20]
	ldrb r0, [r2]
	cmp r0, #0
	bne _0805B0CC
	b _0805B1D8
_0805B0CC:
	ldr r1, _0805B134 @ =gUnknown_03005434
	mov r2, r8
	ldr r0, [r2, #0x10]
	str r0, [r1]
	ldr r1, _0805B138 @ =gUnknown_030055B8
	ldrb r0, [r2, #2]
	strb r0, [r1]
	movs r5, #0
	adds r0, r6, #0
	adds r0, #0xe8
	str r0, [sp, #0x18]
	adds r1, r6, #0
	adds r1, #0xf6
	str r1, [sp, #0x1c]
	adds r6, #0xfb
	str r6, [sp, #0x24]
	ldr r6, _0805B13C @ =gUnknown_03005460
	ldr r7, _0805B140 @ =gUnknown_03005594
	adds r4, r6, #0
	mov sl, r5
	ldr r2, _0805B144 @ =gUnknown_03005410
	mov ip, r2
	mov sb, r5
_0805B0FA:
	ldr r1, _0805B138 @ =gUnknown_030055B8
	ldrb r0, [r1]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805B182
	cmp r5, #0
	bne _0805B14C
	mov r2, r8
	ldr r0, [r2, #4]
	ldr r1, _0805B144 @ =gUnknown_03005410
	str r0, [r1]
	ldrh r0, [r2, #8]
	strh r0, [r6]
	ldrh r0, [r2, #0xa]
	strh r0, [r6, #2]
	ldrh r0, [r2, #0xc]
	strh r0, [r6, #4]
	ldrb r0, [r7]
	ldrb r1, [r2, #0xe]
	orrs r0, r1
	strb r0, [r7]
	ldr r2, _0805B148 @ =gUnknown_030054D8
	mov r0, r8
	ldrb r1, [r0, #0xf]
	b _0805B17A
	.align 2, 0
_0805B130: .4byte 0x00004011
_0805B134: .4byte gUnknown_03005434
_0805B138: .4byte gUnknown_030055B8
_0805B13C: .4byte gUnknown_03005460
_0805B140: .4byte gUnknown_03005594
_0805B144: .4byte gUnknown_03005410
_0805B148: .4byte gUnknown_030054D8
_0805B14C:
	ldr r3, _0805B1C0 @ =gMultiSioRecv
	add r3, sb
	ldrh r0, [r3]
	ldr r1, _0805B1C4 @ =0x00004010
	cmp r0, r1
	bne _0805B182
	ldr r0, [r3, #4]
	mov r2, ip
	str r0, [r2]
	ldrh r0, [r3, #8]
	strh r0, [r4]
	adds r0, r6, #2
	add r0, sl
	ldrh r1, [r3, #0xa]
	strh r1, [r0]
	ldrh r0, [r3, #0xc]
	strh r0, [r4, #4]
	ldrb r0, [r7]
	ldrb r1, [r3, #0xe]
	orrs r0, r1
	strb r0, [r7]
	ldr r2, _0805B1C8 @ =gUnknown_030054D8
	ldrb r1, [r3, #0xf]
_0805B17A:
	ldrb r0, [r2]
	cmp r0, r1
	bhs _0805B182
	strb r1, [r2]
_0805B182:
	adds r4, #0xc
	movs r0, #0xc
	add sl, r0
	movs r1, #4
	add ip, r1
	movs r2, #0x14
	add sb, r2
	adds r5, #1
	cmp r5, #3
	ble _0805B0FA
	movs r0, #0
	movs r1, #0
	ldr r2, [sp, #0x18]
	strh r0, [r2]
	ldr r0, [sp, #0x1c]
	strb r1, [r0]
	ldr r2, _0805B1CC @ =gUnknown_030054D4
	strb r1, [r2, #3]
	strb r1, [r2, #2]
	strb r1, [r2, #1]
	strb r1, [r2]
	ldr r0, [sp, #0x24]
	strb r1, [r0]
	ldr r1, _0805B1D0 @ =gCurTask
	ldr r0, [r1]
	ldr r2, _0805B1D4 @ =sub_805B4C0
	str r2, [r0, #8]
	bl _call_via_r2
	b _0805B42A
	.align 2, 0
_0805B1C0: .4byte gMultiSioRecv
_0805B1C4: .4byte 0x00004010
_0805B1C8: .4byte gUnknown_030054D8
_0805B1CC: .4byte gUnknown_030054D4
_0805B1D0: .4byte gCurTask
_0805B1D4: .4byte sub_805B4C0
_0805B1D8:
	lsls r1, r1, #0x10
	ldr r0, _0805B204 @ =0x40120000
	cmp r1, r0
	bls _0805B220
	ldr r1, _0805B208 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805B20C @ =gUnknown_03002AE4
	ldr r0, _0805B210 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805B214 @ =gUnknown_03005390
	movs r0, #0
_0805B1F4:
	strb r0, [r1]
_0805B1F6:
	ldr r1, _0805B218 @ =gUnknown_03004D5C
	ldr r0, _0805B21C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _0805B42A
	.align 2, 0
_0805B204: .4byte 0x40120000
_0805B208: .4byte 0x0000FFFF
_0805B20C: .4byte gUnknown_03002AE4
_0805B210: .4byte gUnknown_0300287C
_0805B214: .4byte gUnknown_03005390
_0805B218: .4byte gUnknown_03004D5C
_0805B21C: .4byte gUnknown_03002A84
_0805B220:
	ldr r0, _0805B254 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805B2B0
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, _0805B258 @ =gMultiSioStatusFlags
	ldr r4, [r0]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	beq _0805B268
	ldr r7, _0805B25C @ =gMultiSioSend
	movs r1, #0
	strh r1, [r7]
	adds r0, r6, #0
	adds r0, #0xe8
	strh r1, [r0]
	ldr r0, _0805B260 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805B264 @ =sub_805B454
	str r0, [r1, #8]
	b _0805B42A
	.align 2, 0
_0805B254: .4byte gPressedKeys
_0805B258: .4byte gMultiSioStatusFlags
_0805B25C: .4byte gMultiSioSend
_0805B260: .4byte gCurTask
_0805B264: .4byte sub_805B454
_0805B268:
	ldr r0, _0805B29C @ =gMultiSioEnabled
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	ldr r7, _0805B2A0 @ =gMultiSioSend
	movs r2, #0
	strh r4, [r7]
	ldr r0, _0805B2A4 @ =gUnknown_03004D80
	strb r2, [r0]
	ldr r1, _0805B2A8 @ =gUnknown_03002280
	strb r2, [r1]
	strb r2, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	bl CreateMultiplayerModeSelectScreen
	ldr r0, _0805B2AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805B42A
	.align 2, 0
_0805B29C: .4byte gMultiSioEnabled
_0805B2A0: .4byte gMultiSioSend
_0805B2A4: .4byte gUnknown_03004D80
_0805B2A8: .4byte gUnknown_03002280
_0805B2AC: .4byte gCurTask
_0805B2B0:
	ldr r1, _0805B3AC @ =gMultiSioStatusFlags
	ldr r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805B2D8
	ldr r2, [sp, #4]
	cmp r2, #1
	ble _0805B302
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0805B2D8
	adds r4, r6, #0
	adds r4, #0x3c
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805B2D8:
	ldr r1, [sp, #4]
	cmp r1, #1
	ble _0805B302
	adds r4, r6, #0
	adds r4, #0x6c
	ldr r0, _0805B3B0 @ =0x00000432
	strh r0, [r4, #0xa]
	adds r1, #6
	adds r0, r6, #0
	adds r0, #0x8c
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x8d
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0805B302:
	adds r4, r6, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _0805B3AC @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	adds r2, r6, #0
	adds r2, #0xf6
	str r2, [sp, #0x1c]
	cmp r0, #0
	beq _0805B3CC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0805B336
	ldr r1, [sp]
	cmp r1, #1
	ble _0805B336
	ldr r0, _0805B3B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805B34E
_0805B336:
	adds r1, r6, #0
	adds r1, #0xf6
	ldrb r0, [r1]
	str r1, [sp, #0x1c]
	cmp r0, #0
	beq _0805B3EC
	ldr r2, [sp, #0x10]
	cmp r2, #0
	bne _0805B3CC
	ldr r0, [sp]
	cmp r0, #1
	ble _0805B3CC
_0805B34E:
	ldr r7, _0805B3B8 @ =gMultiSioSend
	ldr r0, _0805B3BC @ =0x00004011
	strh r0, [r7]
	mov r1, sp
	ldrb r1, [r1, #8]
	strb r1, [r7, #2]
	ldr r1, _0805B3C0 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r7, #4]
	adds r0, r6, #0
	adds r0, #0xdc
	ldr r0, [r0]
	str r0, [r7, #0x10]
	movs r2, #0
	ldr r0, _0805B3C4 @ =gUnknown_03005594
	mov r8, r0
	ldr r0, _0805B3C8 @ =gUnknown_030054D8
	mov sb, r0
	adds r4, r6, #0
	adds r4, #0xfc
	adds r5, r1, #0
	adds r3, r7, #0
	adds r3, #8
_0805B37E:
	lsls r0, r2, #1
	ldr r1, [r5]
	adds r1, #0x20
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #2
	ble _0805B37E
	mov r1, r8
	ldrb r0, [r1]
	movs r1, #0
	strb r0, [r7, #0xe]
	mov r2, sb
	ldrb r0, [r2]
	strb r0, [r7, #0xf]
	movs r0, #1
	ldr r2, [sp, #0x1c]
	strb r0, [r2]
	strb r1, [r4]
	b _0805B42A
	.align 2, 0
_0805B3AC: .4byte gMultiSioStatusFlags
_0805B3B0: .4byte 0x00000432
_0805B3B4: .4byte gPressedKeys
_0805B3B8: .4byte gMultiSioSend
_0805B3BC: .4byte 0x00004011
_0805B3C0: .4byte gLoadedSaveGame
_0805B3C4: .4byte gUnknown_03005594
_0805B3C8: .4byte gUnknown_030054D8
_0805B3CC:
	ldr r1, [sp, #0x1c]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805B3EC
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0805B43C @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805B3EC
	adds r1, r6, #0
	adds r1, #0xfc
	movs r0, #1
	strb r0, [r1]
_0805B3EC:
	ldr r7, _0805B440 @ =gMultiSioSend
	ldr r0, _0805B444 @ =0x00004010
	strh r0, [r7]
	ldr r1, _0805B448 @ =gLoadedSaveGame
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r7, #4]
	movs r2, #0
	ldr r0, _0805B44C @ =gUnknown_03005594
	mov r8, r0
	ldr r0, _0805B450 @ =gUnknown_030054D8
	mov sb, r0
	adds r4, r1, #0
	adds r3, r7, #0
	adds r3, #8
_0805B40A:
	lsls r0, r2, #1
	ldr r1, [r4]
	adds r1, #0x20
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #2
	ble _0805B40A
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r7, #0xe]
	mov r2, sb
	ldrb r0, [r2]
	strb r0, [r7, #0xf]
_0805B42A:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B43C: .4byte gMultiSioStatusFlags
_0805B440: .4byte gMultiSioSend
_0805B444: .4byte 0x00004010
_0805B448: .4byte gLoadedSaveGame
_0805B44C: .4byte gUnknown_03005594
_0805B450: .4byte gUnknown_030054D8

	
.syntax divided
