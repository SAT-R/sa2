.include "constants/constants.inc"

.syntax unified

.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov ip, r0
	adds r0, #0x54
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0803ABA8
	lsls r0, r0, #2
	ldr r1, _0803AB80 @ =_0803AB84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803AB80: .4byte _0803AB84
_0803AB84: @ jump table
	.4byte _0803ABA8 @ case 0
	.4byte _0803ABA8 @ case 1
	.4byte _0803AB98 @ case 2
	.4byte _0803ABA0 @ case 3
	.4byte _0803ABA8 @ case 4
_0803AB98:
	mov r1, ip
	adds r1, #0x50
	movs r0, #0x28
	b _0803ABAE
_0803ABA0:
	mov r1, ip
	adds r1, #0x50
	movs r0, #0x14
	b _0803ABAE
_0803ABA8:
	mov r1, ip
	adds r1, #0x50
	movs r0, #0
_0803ABAE:
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803ABBC
	b _0803AD28
_0803ABBC:
	cmp r0, #1
	bgt _0803ABC8
	cmp r0, #0
	beq _0803ABD4
	bl _0803B55E
_0803ABC8:
	cmp r0, #2
	bne _0803ABD0
	bl _803B534
_0803ABD0:
	bl _0803B55E
_0803ABD4:
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r4, #0
	mov r0, ip
	adds r0, #0x54
	mov r8, r0
	movs r2, #0x44
	add r2, ip
	mov sb, r2
	mov r3, ip
	adds r3, #0x40
	str r3, [sp, #8]
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0803ACBE
	ldr r1, _0803AC44 @ =gUnknown_030058A8
	mov ip, r1
	movs r2, #1
	add r2, ip
	mov sl, r2
	movs r7, #0
	mov r6, sb
	adds r5, r3, #0
_0803AC06:
	ldr r3, _0803AC48 @ =gUnknown_03005008
	adds r0, r4, r3
	ldrb r1, [r0]
	ldr r0, _0803AC4C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803ACB0
	cmp r1, #9
	bhi _0803AC58
	lsls r3, r4, #1
	mov r0, ip
	adds r0, r3, r0
	str r0, [sp, #0x10]
	lsls r1, r1, #4
	ldr r2, _0803AC50 @ =gLoadedSaveGame
	adds r1, r1, r2
	movs r2, #0xe3
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	mov r0, sl
	adds r2, r3, r0
	ldr r0, _0803AC54 @ =0x0000038D
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	b _0803AC68
	.align 2, 0
_0803AC44: .4byte gUnknown_030058A8
_0803AC48: .4byte gUnknown_03005008
_0803AC4C: .4byte 0x04000128
_0803AC50: .4byte gLoadedSaveGame
_0803AC54: .4byte 0x0000038D
_0803AC58:
	lsls r0, r4, #1
	mov r2, ip
	adds r1, r0, r2
	strb r7, [r1]
	mov r3, sl
	adds r1, r0, r3
	strb r7, [r1]
	adds r3, r0, #0
_0803AC68:
	mov r1, ip
	adds r0, r3, r1
	mov r2, sl
	adds r1, r3, r2
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	bls _0803AC8E
	adds r0, r6, r4
	movs r1, #6
	strb r1, [r0]
	adds r0, r5, r4
	strb r1, [r0]
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	b _0803ACB0
_0803AC8E:
	cmp r2, r0
	bhs _0803ACA8
	adds r0, r6, r4
	movs r1, #1
	strb r1, [r0]
	adds r0, r5, r4
	strb r1, [r0]
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	b _0803ACB0
_0803ACA8:
	adds r0, r6, r4
	strb r7, [r0]
	adds r0, r5, r4
	strb r7, [r0]
_0803ACB0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	cmp r4, r3
	blo _0803AC06
_0803ACBE:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	cmp r0, r1
	bls _0803ACD8
	ldr r2, _0803ACD4 @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	add r0, sb
	movs r1, #1
	b _0803ACEC
	.align 2, 0
_0803ACD4: .4byte 0x04000128
_0803ACD8:
	ldr r3, [sp]
	ldr r0, [sp, #4]
	cmp r3, r0
	bhs _0803AD04
	ldr r2, _0803AD00 @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	add r0, sb
	movs r1, #6
_0803ACEC:
	strb r1, [r0]
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r2, [sp, #8]
	adds r0, r2, r0
	strb r1, [r0]
	bl _0803B55E
	.align 2, 0
_0803AD00: .4byte 0x04000128
_0803AD04:
	ldr r2, _0803AD24 @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	add r0, sb
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r3, [sp, #8]
	adds r0, r3, r0
	strb r1, [r0]
	bl _0803B55E
	.align 2, 0
_0803AD24: .4byte 0x04000128
_0803AD28:
	ldr r0, _0803AD78 @ =gUnknown_030058B4
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803AD3E
	ldr r0, _0803AD7C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _0803AD3E
	cmp r0, #5
	beq _0803AD3E
	b _0803AF88
_0803AD3E:
	movs r4, #0
	mov r0, ip
	adds r0, #0x54
	mov r8, r0
	adds r0, #2
	str r0, [sp, #0xc]
	mov r1, r8
	ldrb r1, [r1]
	cmp r4, r1
	blo _0803AD54
	b _0803AF08
_0803AD54:
	ldr r6, _0803AD80 @ =gLoadedSaveGame
	ldr r2, _0803AD84 @ =gUnknown_03005008
	mov sl, r2
	ldr r7, _0803AD88 @ =0x0000038E
	movs r3, #0x63
	mov sb, r3
_0803AD60:
	ldr r1, _0803AD8C @ =gMultiplayerRanks
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #1
	beq _0803AE10
	cmp r1, #1
	bgt _0803AD90
	cmp r1, #0
	beq _0803AD96
	b _0803AE10
	.align 2, 0
_0803AD78: .4byte gUnknown_030058B4
_0803AD7C: .4byte gGameMode
_0803AD80: .4byte gLoadedSaveGame
_0803AD84: .4byte gUnknown_03005008
_0803AD88: .4byte 0x0000038E
_0803AD8C: .4byte gMultiplayerRanks
_0803AD90:
	cmp r1, #4
	beq _0803AE84
	b _0803AE10
_0803AD96:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #2
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r1, _0803ADE0 @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	bne _0803ADB6
	b _0803AEF8
_0803ADB6:
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r2, _0803ADE4 @ =gMultiplayerRanks
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803ADEC
	ldr r3, _0803ADE8 @ =gGameMode
	ldrb r0, [r3]
	cmp r0, #3
	bne _0803ADD4
	b _0803AEF8
_0803ADD4:
	cmp r0, #5
	bne _0803ADDA
	b _0803AEF8
_0803ADDA:
	mov r0, sl
	adds r2, r4, r0
	b _0803AED8
	.align 2, 0
_0803ADE0: .4byte 0x04000128
_0803ADE4: .4byte gMultiplayerRanks
_0803ADE8: .4byte gGameMode
_0803ADEC:
	mov r0, sl
	adds r3, r4, r0
	ldrb r1, [r3]
	lsls r1, r1, #4
	adds r1, r1, r6
	ldr r2, _0803AE0C @ =0x0000038D
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r1, r0, r2
	b _0803AEEE
	.align 2, 0
_0803AE0C: .4byte 0x0000038D
_0803AE10:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #3
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r1, _0803AE64 @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803AEF8
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r3, _0803AE68 @ =gMultiplayerRanks
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803AE6C
	mov r0, sl
	adds r3, r4, r0
	ldrb r1, [r3]
	lsls r1, r1, #4
	adds r1, r1, r6
	movs r2, #0xe3
	lsls r2, r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r1, r0, r2
	b _0803AEEE
	.align 2, 0
_0803AE64: .4byte 0x04000128
_0803AE68: .4byte gMultiplayerRanks
_0803AE6C:
	ldr r3, _0803AE80 @ =gGameMode
	ldrb r0, [r3]
	cmp r0, #3
	beq _0803AEF8
	cmp r0, #5
	beq _0803AEF8
	mov r0, sl
	adds r2, r4, r0
	b _0803AED8
	.align 2, 0
_0803AE80: .4byte gGameMode
_0803AE84:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r5, _0803AF28 @ =0x04000128
	ldr r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803AEF8
	ldr r3, _0803AF2C @ =gGameMode
	ldrb r0, [r3]
	cmp r0, #3
	beq _0803AEAC
	cmp r0, #5
	bne _0803AED4
_0803AEAC:
	ldr r0, _0803AF30 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r2, #0x10
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r1, [r5]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	movs r0, #0x10
	lsls r0, r1
	ands r3, r0
	ldr r0, [r5]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	beq _0803AEF8
_0803AED4:
	mov r1, sl
	adds r2, r4, r1
_0803AED8:
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r1, r0, r7
_0803AEEE:
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _0803AEF8
	mov r2, sb
	strb r2, [r1]
_0803AEF8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r3, r8
	ldrb r3, [r3]
	cmp r4, r3
	bhs _0803AF08
	b _0803AD60
_0803AF08:
	ldr r1, _0803AF28 @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r2, _0803AF34 @ =gMultiplayerRanks
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803AF40
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r0, _0803AF38 @ =gLoadedSaveGame
	ldr r2, _0803AF3C @ =0x00000425
	b _0803B516
	.align 2, 0
_0803AF28: .4byte 0x04000128
_0803AF2C: .4byte gGameMode
_0803AF30: .4byte gMultiplayerConnections
_0803AF34: .4byte gMultiplayerRanks
_0803AF38: .4byte gLoadedSaveGame
_0803AF3C: .4byte 0x00000425
_0803AF40:
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r3, _0803AF64 @ =gMultiplayerRanks
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0803AF70
	movs r0, #2
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldr r2, _0803AF68 @ =gLoadedSaveGame
	ldr r3, _0803AF6C @ =0x00000427
	adds r1, r2, r3
	b _0803B518
	.align 2, 0
_0803AF64: .4byte gMultiplayerRanks
_0803AF68: .4byte gLoadedSaveGame
_0803AF6C: .4byte 0x00000427
_0803AF70:
	movs r0, #1
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldr r2, _0803AF80 @ =gLoadedSaveGame
	ldr r3, _0803AF84 @ =0x00000426
	adds r1, r2, r3
	b _0803B518
	.align 2, 0
_0803AF80: .4byte gLoadedSaveGame
_0803AF84: .4byte 0x00000426
_0803AF88:
	cmp r0, #4
	beq _0803AF8E
	b _0803B2C8
_0803AF8E:
	movs r4, #0
	movs r2, #0
	mov r0, ip
	adds r0, #0x54
	ldrb r1, [r0]
	mov r8, r0
	adds r0, #2
	str r0, [sp, #0xc]
	cmp r4, r1
	bhs _0803AFC0
	ldr r3, _0803B028 @ =gMultiplayerRanks
_0803AFA4:
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803AFB6
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0803AFB6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r1
	blo _0803AFA4
_0803AFC0:
	cmp r2, #1
	beq _0803AFC6
	b _0803B0E4
_0803AFC6:
	movs r4, #0
	mov r1, r8
	ldrb r1, [r1]
	cmp r4, r1
	bhs _0803B098
	ldr r2, _0803B028 @ =gMultiplayerRanks
	mov sl, r2
	ldr r3, _0803B02C @ =gLoadedSaveGame
	ldr r0, _0803B030 @ =0x0000038D
	mov sb, r0
	movs r7, #0xe3
	lsls r7, r7, #2
	ldr r6, _0803B034 @ =gUnknown_03005008
	mov r5, ip
	adds r5, #0x44
_0803AFE4:
	mov r1, sl
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B03C
	adds r0, r5, r4
	movs r1, #2
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, _0803B038 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803B08A
	adds r2, r4, r6
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	add r0, sb
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	mov r2, sb
	adds r1, r0, r2
	b _0803B080
	.align 2, 0
_0803B028: .4byte gMultiplayerRanks
_0803B02C: .4byte gLoadedSaveGame
_0803B030: .4byte 0x0000038D
_0803B034: .4byte gUnknown_03005008
_0803B038: .4byte 0x04000128
_0803B03C:
	adds r0, r5, r4
	movs r1, #3
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r1, _0803B0BC @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803B08A
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B08A
	adds r2, r4, r6
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	adds r1, r0, r7
_0803B080:
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _0803B08A
	movs r0, #0x63
	strb r0, [r1]
_0803B08A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blo _0803AFE4
_0803B098:
	ldr r0, _0803B0BC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r1, _0803B0C0 @ =gMultiplayerRanks
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B0CC
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	ldr r3, _0803B0C4 @ =gLoadedSaveGame
	ldr r0, _0803B0C8 @ =0x00000425
	adds r1, r3, r0
	b _0803B518
	.align 2, 0
_0803B0BC: .4byte 0x04000128
_0803B0C0: .4byte gMultiplayerRanks
_0803B0C4: .4byte gLoadedSaveGame
_0803B0C8: .4byte 0x00000425
_0803B0CC:
	movs r0, #1
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldr r2, _0803B0DC @ =gLoadedSaveGame
	ldr r3, _0803B0E0 @ =0x00000426
	adds r1, r2, r3
	b _0803B518
	.align 2, 0
_0803B0DC: .4byte gLoadedSaveGame
_0803B0E0: .4byte 0x00000426
_0803B0E4:
	cmp r2, #0
	bne _0803B168
	movs r4, #0
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0803B146
	movs r6, #4
	ldr r5, _0803B154 @ =gLoadedSaveGame
	ldr r3, _0803B158 @ =0x0000038E
	ldr r7, _0803B15C @ =gUnknown_03005008
_0803B0FA:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	strb r6, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r6, [r0]
	ldr r0, _0803B160 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803B138
	adds r2, r4, r7
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r5
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r5
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _0803B138
	movs r0, #0x63
	strb r0, [r1]
_0803B138:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r1, r8
	ldrb r1, [r1]
	cmp r4, r1
	blo _0803B0FA
_0803B146:
	movs r0, #2
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	ldr r3, _0803B154 @ =gLoadedSaveGame
	ldr r0, _0803B164 @ =0x00000427
	adds r1, r3, r0
	b _0803B518
	.align 2, 0
_0803B154: .4byte gLoadedSaveGame
_0803B158: .4byte 0x0000038E
_0803B15C: .4byte gUnknown_03005008
_0803B160: .4byte 0x04000128
_0803B164: .4byte 0x00000427
_0803B168:
	movs r4, #0
	mov r1, r8
	ldrb r1, [r1]
	cmp r4, r1
	blo _0803B174
	b _0803B27A
_0803B174:
	ldr r2, _0803B1E4 @ =gMultiplayerRanks
	mov sb, r2
	ldr r3, _0803B1E8 @ =gLoadedSaveGame
	ldr r7, _0803B1EC @ =gUnknown_03005008
	ldr r6, _0803B1F0 @ =0x0000038E
	movs r5, #0x63
	movs r0, #0xe3
	lsls r0, r0, #2
	mov sl, r0
_0803B186:
	mov r1, sb
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B1FC
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #4
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r1, _0803B1F4 @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803B26C
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B24C
	adds r2, r4, r7
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldr r1, _0803B1F8 @ =0x0000038D
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	ldr r2, _0803B1F8 @ =0x0000038D
	adds r1, r0, r2
	b _0803B264
	.align 2, 0
_0803B1E4: .4byte gMultiplayerRanks
_0803B1E8: .4byte gLoadedSaveGame
_0803B1EC: .4byte gUnknown_03005008
_0803B1F0: .4byte 0x0000038E
_0803B1F4: .4byte 0x04000128
_0803B1F8: .4byte 0x0000038D
_0803B1FC:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #3
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	strb r1, [r0]
	ldr r1, _0803B248 @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803B26C
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B24C
	adds r2, r4, r7
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	add r0, sl
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	mov r2, sl
	adds r1, r0, r2
	b _0803B264
	.align 2, 0
_0803B248: .4byte 0x04000128
_0803B24C:
	adds r2, r4, r7
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	adds r0, r0, r6
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r3
	adds r1, r0, r6
_0803B264:
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _0803B26C
	strb r5, [r1]
_0803B26C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blo _0803B186
_0803B27A:
	ldr r0, _0803B2A0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r1, _0803B2A4 @ =gMultiplayerRanks
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B2B0
	movs r0, #2
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	ldr r3, _0803B2A8 @ =gLoadedSaveGame
	ldr r0, _0803B2AC @ =0x00000427
	adds r1, r3, r0
	b _0803B518
	.align 2, 0
_0803B2A0: .4byte 0x04000128
_0803B2A4: .4byte gMultiplayerRanks
_0803B2A8: .4byte gLoadedSaveGame
_0803B2AC: .4byte 0x00000427
_0803B2B0:
	movs r0, #1
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldr r2, _0803B2C0 @ =gLoadedSaveGame
	ldr r3, _0803B2C4 @ =0x00000426
	adds r1, r2, r3
	b _0803B518
	.align 2, 0
_0803B2C0: .4byte gLoadedSaveGame
_0803B2C4: .4byte 0x00000426
_0803B2C8:
	movs r6, #0
	movs r4, #0
	mov r0, ip
	adds r0, #0x54
	ldrb r1, [r0]
	mov r8, r0
	adds r0, #2
	str r0, [sp, #0xc]
	cmp r4, r1
	bhs _0803B2FA
	ldr r2, _0803B32C @ =gMultiplayerRanks
_0803B2DE:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0803B2F0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803B2F0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r1
	blo _0803B2DE
_0803B2FA:
	mov r5, r8
	ldrb r0, [r5]
	cmp r6, r0
	bne _0803B330
	movs r4, #0
	cmp r4, r6
	blo _0803B30A
	b _0803B49E
_0803B30A:
	mov r3, ip
	adds r3, #0x44
	movs r2, #4
	mov r1, ip
	adds r1, #0x40
_0803B314:
	adds r0, r3, r4
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _0803B314
	b _0803B49E
	.align 2, 0
_0803B32C: .4byte gMultiplayerRanks
_0803B330:
	movs r4, #0
	cmp r4, r0
	blo _0803B338
	b _0803B49E
_0803B338:
	ldr r1, _0803B350 @ =gMultiplayerRanks
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bhi _0803B3E4
	lsls r0, r0, #2
	ldr r1, _0803B354 @ =_0803B358
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803B350: .4byte gMultiplayerRanks
_0803B354: .4byte _0803B358
_0803B358: @ jump table
	.4byte _0803B370 @ case 0
	.4byte _0803B384 @ case 1
	.4byte _0803B398 @ case 2
	.4byte _0803B3BE @ case 3
	.4byte _0803B3D2 @ case 4
	.4byte _0803B3D2 @ case 5
_0803B370:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #7
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	movs r1, #2
	b _0803B3E2
_0803B384:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #8
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	movs r1, #4
	b _0803B3E2
_0803B398:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #9
	strb r1, [r0]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #3
	bne _0803B3B4
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	movs r1, #3
	b _0803B3E2
_0803B3B4:
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	movs r1, #4
	b _0803B3E2
_0803B3BE:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #0xa
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
	movs r1, #3
	b _0803B3E2
_0803B3D2:
	mov r0, ip
	adds r0, #0x44
	adds r0, r0, r4
	movs r1, #3
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x40
	adds r0, r0, r4
_0803B3E2:
	strb r1, [r0]
_0803B3E4:
	ldr r2, _0803B420 @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0803B48E
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r3, _0803B424 @ =gMultiplayerRanks
	adds r0, r0, r3
	adds r1, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bge _0803B430
	ldr r2, _0803B428 @ =gUnknown_03005008
	adds r2, r4, r2
	ldrb r1, [r2]
	lsls r1, r1, #4
	ldr r0, _0803B42C @ =gLoadedSaveGame
	adds r1, r1, r0
	movs r3, #0xe3
	lsls r3, r3, #2
	b _0803B472
	.align 2, 0
_0803B420: .4byte 0x04000128
_0803B424: .4byte gMultiplayerRanks
_0803B428: .4byte gUnknown_03005008
_0803B42C: .4byte gLoadedSaveGame
_0803B430:
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r2, _0803B454 @ =gMultiplayerRanks
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _0803B464
	ldr r2, _0803B458 @ =gUnknown_03005008
	adds r2, r4, r2
	ldrb r1, [r2]
	lsls r1, r1, #4
	ldr r3, _0803B45C @ =gLoadedSaveGame
	adds r1, r1, r3
	ldr r3, _0803B460 @ =0x0000038E
	b _0803B472
	.align 2, 0
_0803B454: .4byte gMultiplayerRanks
_0803B458: .4byte gUnknown_03005008
_0803B45C: .4byte gLoadedSaveGame
_0803B460: .4byte 0x0000038E
_0803B464:
	ldr r2, _0803B4C0 @ =gUnknown_03005008
	adds r2, r4, r2
	ldrb r1, [r2]
	lsls r1, r1, #4
	ldr r3, _0803B4C4 @ =gLoadedSaveGame
	adds r1, r1, r3
	ldr r3, _0803B4C8 @ =0x0000038D
_0803B472:
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #4
	ldr r1, _0803B4C4 @ =gLoadedSaveGame
	adds r0, r0, r1
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _0803B48E
	movs r0, #0x63
	strb r0, [r1]
_0803B48E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r2, r8
	ldrb r2, [r2]
	cmp r4, r2
	bhs _0803B49E
	b _0803B338
_0803B49E:
	ldr r1, _0803B4CC @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r3, _0803B4D0 @ =gMultiplayerRanks
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803B4D8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldr r2, _0803B4C4 @ =gLoadedSaveGame
	ldr r3, _0803B4D4 @ =0x00000425
	adds r1, r2, r3
	b _0803B518
	.align 2, 0
_0803B4C0: .4byte gUnknown_03005008
_0803B4C4: .4byte gLoadedSaveGame
_0803B4C8: .4byte 0x0000038D
_0803B4CC: .4byte 0x04000128
_0803B4D0: .4byte gMultiplayerRanks
_0803B4D4: .4byte 0x00000425
_0803B4D8:
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	ldr r1, _0803B500 @ =gMultiplayerRanks
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0803B4F4
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	beq _0803B50C
_0803B4F4:
	movs r0, #1
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r0, _0803B504 @ =gLoadedSaveGame
	ldr r2, _0803B508 @ =0x00000426
	b _0803B516
	.align 2, 0
_0803B500: .4byte gMultiplayerRanks
_0803B504: .4byte gLoadedSaveGame
_0803B508: .4byte 0x00000426
_0803B50C:
	movs r0, #2
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r0, _0803B52C @ =gLoadedSaveGame
	ldr r2, _0803B530 @ =0x00000427
_0803B516:
	adds r1, r0, r2
_0803B518:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bls _0803B55E
	movs r0, #0x63
	strb r0, [r1]
	b _0803B55E
	.align 2, 0
_0803B52C: .4byte gLoadedSaveGame
_0803B530: .4byte 0x00000427
_803B534: @ 0x0803B534
	movs r4, #0
	mov r2, ip
	adds r2, #0x54
	ldrb r3, [r2]
	cmp r4, r3
	bhs _0803B55E
	mov r5, ip
	adds r5, #0x44
	movs r3, #5
	mov r1, ip
	adds r1, #0x40
_0803B54A:
	adds r0, r5, r4
	strb r3, [r0]
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r2]
	cmp r4, r0
	blo _0803B54A
_0803B55E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
