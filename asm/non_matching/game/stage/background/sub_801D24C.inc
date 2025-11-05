.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]            @ sp00 = p0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2              @ sb = p2
	ldr r4, _0801D374 @ =gFlags
	ldr r0, [r4]
	movs r3, #4
	orrs r0, r3
	str r0, [r4]
	ldr r2, _0801D378 @ =gHBlankCopyTarget
	ldr r0, _0801D37C @ =0x04000010
	str r0, [r2]
	ldr r0, _0801D380 @ =gHBlankCopySize
	strb r3, [r0]
	ldr r2, _0801D384 @ =gWinRegs
	movs r0, #0
	mov sl, r0
	movs r0, #0x3f
	strh r0, [r2, #0xa]
	ldr r3, _0801D388 @ =gBldRegs
	mov r8, r3
	ldr r0, _0801D38C @ =0x00003F41
	strh r0, [r3]
	movs r0, #0x81
	lsls r0, r0, #4
	strh r0, [r3, #2]
	movs r0, #0xa0
	strh r0, [r2, #4]
	ldr r0, _0801D390 @ =gBgOffsetsHBlankPrimary
	ldr r3, [r0]
	ldr r0, _0801D394 @ =gStageTime
	ldr r0, [r0]
	ldr r5, _0801D398 @ =0x000003FF
	mov ip, r5          @ ip = 0x3FF
	adds r5, r0, #0
	mov r6, ip          @ r6 = ip = 0x3FF
	ands r5, r6         @ r5 = stageTime & 0x3FF
	lsrs r7, r0, #1
	ands r7, r6         @ r7 = stageTime2 = ((gStageTime >> 1) & 0x3FF);
	lsls r2, r1, #0x10
	asrs r1, r2, #0xf   @ r1 = (p1 * 2)
	asrs r0, r2, #0x11
	adds r1, r1, r0
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0801D2C2
	movs r6, #0x9f
_0801D2C2:
	mov r0, sb      @ r0 = sb = p2
	cmp r0, #0
	bne _0801D2CA
	b _0801D3D6
_0801D2CA:
	asrs r0, r2, #0x14  @ r0 = (p1 >> 4)
	movs r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #8
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	movs r4, #0
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	mov sl, r0
	cmp r4, r1
	bge _0801D312
	movs r2, #0
	mov sb, r2
	movs r6, #0xf
	rsbs r6, r6, #0
	mov r8, r6
	movs r6, #0xff
	adds r2, r1, #0
_0801D2F2:
	mov r0, sb      @ r0 = sb = 0
	strh r0, [r3]
	adds r3, #2
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, r8      @ r4 = r8 -15
	subs r0, r4, r1
	ands r0, r6
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, r2
	blt _0801D2F2
_0801D312:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D31C
	b _0801D498
_0801D31C:
	ldr r6, _0801D39C @ =gSineTable
	mov ip, r6
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]        @ sp04 = stageTime
	ldr r0, _0801D398 @ =0x000003FF
	mov sb, r0
	movs r2, #0xff
	mov r8, r2
	mov r6, sl
	asrs r5, r6, #0x10
_0801D332:
	asrs r1, r1, #0x10
	lsls r0, r1, #4
	adds r0, r0, r7
	ldr r2, [sp, #4]        @ r2 = stageTime
	adds r0, r0, r2
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	lsls r2, r1, #1
	subs r0, r0, r2
	mov r6, r8          @ r6 = r8 = 0xFF
	ands r0, r6
	strh r0, [r3]
	adds r3, #2
	adds r0, r1, #0
	subs r0, #0xf
	cmp r0, r5
	bge _0801D3A0
	movs r0, #1
	subs r0, r0, r1
	subs r1, r1, r5
	subs r1, #0xf
	lsls r1, r1, #3
	subs r0, r0, r1
	movs r1, #0xfe
	ands r0, r1
	b _0801D3BE
	.align 2, 0
_0801D374: .4byte gFlags
_0801D378: .4byte gHBlankCopyTarget
_0801D37C: .4byte 0x04000010
_0801D380: .4byte gHBlankCopySize
_0801D384: .4byte gWinRegs
_0801D388: .4byte gBldRegs
_0801D38C: .4byte 0x00003F41
_0801D390: .4byte gBgOffsetsHBlankPrimary
_0801D394: .4byte gStageTime
_0801D398: .4byte 0x000003FF
_0801D39C: .4byte gSineTable
_0801D3A0:
	lsls r0, r1, #2
	adds r0, r7, r0
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	subs r0, r0, r2
	ldr r2, [sp, #4]
	adds r0, r2, r0
	mov r6, r8
	ands r0, r6
_0801D3BE:
	strh r0, [r3]
	adds r3, #2
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D332
	b _0801D498
_0801D3D6:
	asrs r0, r2, #0x15      @ r0 = (p1 * 2)
	movs r1, #0x10
	subs r0, r1, r0         @ r0 = 16 - (p1 * 2)
	lsls r0, r0, #8
	orrs r0, r1
	mov r2, r8              @ r2 = r8 gBldRegs
	strh r0, [r2, #2]       @ gBldRegs.bldAlpha = ((16 - (p1 * 2)) << 8) | 16
	lsls r6, r6, #0x10      @ r6 = (r6 << 16)
	movs r4, #0
	mov sl, r6              @ sl = (r6 << 16)
	cmp r6, #0
	ble _0801D44C
	ldr r0, _0801D478 @ =gSineTable
	mov sb, r0
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	mov r8, ip              @ r8 = ip = 0x3FF
	movs r1, #0xff
	mov ip, r1              @ ip = 0xFF
_0801D3FC:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #4
	adds r0, r0, r7
	adds r0, r0, r5
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	lsls r2, r1, #1
	subs r0, r0, r2
	mov r4, ip
	ands r0, r4
	strh r0, [r3]
	adds r3, #2
	lsls r0, r1, #2
	adds r0, r7, r0
	mov r4, r8
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r0, #1
	subs r0, r0, r2
	adds r0, r5, r0
	mov r2, ip
	ands r0, r2
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	cmp r1, r6
	blt _0801D3FC
_0801D44C:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	bgt _0801D498
	mov r5, sl          @ r5 = sl (r6 << 16)
	asrs r2, r5, #0x10  @ r2 = r6
	movs r5, #0xff
_0801D45A:
	movs r0, #0
	strh r0, [r3]
	adds r3, #2
	asrs r1, r1, #0x10
	adds r0, r1, #0
	subs r0, #0xf
	cmp r0, r2
	bge _0801D47C
	subs r0, r1, r2
	subs r0, #0xf
	lsls r0, r0, #3
	subs r1, #1
	subs r0, r0, r1
	b _0801D480
	.align 2, 0
_0801D478: .4byte gSineTable
_0801D47C:
	rsbs r0, r1, #0
	adds r0, #1
_0801D480:
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	lsls r0, r4, #0x10
	movs r6, #0x80
	lsls r6, r6, #9
	adds r0, r0, r6
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9e
	ble _0801D45A
_0801D498:
	ldr r0, [sp]
	cmp r0, #0x10
	bls _0801D4A2
	movs r1, #0x10
	str r1, [sp]
_0801D4A2:
	movs r5, #0
	ldr r6, _0801D528 @ =gUnknown_080D5C02
	movs r2, #0x1f
	mov ip, r2
	movs r3, #0x32
	adds r3, r3, r6
	mov sb, r3
	ldr r4, _0801D52C @ =gBgPalette
	mov r8, r4
_0801D4B4:
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10  @ r3 = i
	lsls r1, r3, #1
	adds r1, r1, r3
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrb r7, [r0]       @ r7 = gUnknown_080D5C02[24 + i*3]
	ldr r5, [sp]        @ r5 = p0
	adds r4, r7, #0
	muls r4, r5, r4
	asrs r4, r4, #4     @ r4 = (p0 * gUnknown_080D5C02[24 + i*3]) >> 4;
	mov r0, ip
	ands r4, r0         @ r4 &= 0x1F
	adds r0, r6, #0
	adds r0, #0x31
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r5, r2
	asrs r2, r2, #4
	mov r5, ip
	ands r2, r5
	add r1, sb
	ldrb r0, [r1]
	ldr r1, [sp]        @ r1 = p0
	muls r0, r1, r0
	asrs r0, r0, #4
	ands r0, r5
	adds r1, r3, #0     @ r1 = r3 = i
	adds r1, #0xf0
	lsls r1, r1, #1
	add r1, r8
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	adds r0, r0, r2
	adds r4, r4, r0
	strh r4, [r1]
	adds r3, #1
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	asrs r3, r3, #0x10
	cmp r3, #0xf
	ble _0801D4B4
	ldr r2, _0801D530 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D528: .4byte gUnknown_080D5C02
_0801D52C: .4byte gBgPalette
_0801D530: .4byte gFlags
.syntax divided
