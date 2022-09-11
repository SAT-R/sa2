.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r0, _08033588 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _0803355C
	movs r1, #0
_0803355C:
	lsls r0, r1, #0x18
	movs r1, #1
	mov r8, r1
	cmp r0, #0
	bgt _0803356A
	movs r2, #0
	mov r8, r2
_0803356A:
	movs r3, #0xf1
	lsls r3, r3, #2
	adds r2, r7, r3
	ldrb r1, [r2]
	cmp r1, #7
	bls _08033590
	ldr r5, _0803358C @ =0x000003C1
	adds r0, r7, r5
	ldrb r6, [r0]
	movs r0, #0
	str r0, [sp]
	movs r1, #8
	str r1, [sp, #8]
	b _080335A4
	.align 2, 0
_08033588: .4byte gLoadedSaveGame
_0803358C: .4byte 0x000003C1
_08033590:
	ldr r3, _080335B8 @ =0x000003C1
	adds r0, r7, r3
	ldrb r6, [r0]
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrb r2, [r2]
	str r2, [sp, #8]
_080335A4:
	movs r5, #0xf1
	lsls r5, r5, #2
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #3
	bhi _080335BC
	movs r0, #8
	str r0, [sp, #4]
	b _080335D0
	.align 2, 0
_080335B8: .4byte 0x000003C1
_080335BC:
	cmp r0, #0xb
	bhi _080335CC
	movs r0, #0xc
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	b _080335D0
_080335CC:
	movs r1, #0
	str r1, [sp, #4]
_080335D0:
	movs r2, #0xf1
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrb r0, [r0]
	adds r3, r7, #0
	adds r3, #0xfc
	str r3, [sp, #0xc]
	cmp r0, #0
	beq _080335E4
	b _08033782
_080335E4:
	adds r5, r3, #0
	ldr r0, _08033640 @ =gUnknown_080D7204
	lsls r2, r6, #2
	adds r1, r2, r0
	ldrh r1, [r1]
	strh r1, [r5, #0xa]
	adds r0, #2
	adds r0, r2, r0
	ldrh r1, [r0]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r7, r3
	strb r1, [r0]
	ldr r0, _08033644 @ =0x0000011D
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08033648 @ =0x000003CA
	adds r0, r7, r1
	ldrb r1, [r0]
	ldr r0, _0803364C @ =0x000003C1
	adds r3, r7, r0
	ldrb r0, [r3]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	str r5, [sp, #0xc]
	adds r4, r2, #0
	cmp r1, #0
	bne _0803365C
	ldr r0, _08033650 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0803365C
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r1, _08033654 @ =gUnknown_080D72B1
	ldrb r0, [r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r2, _08033658 @ =0x00000121
	adds r1, r7, r2
	b _0803366A
	.align 2, 0
_08033640: .4byte gUnknown_080D7204
_08033644: .4byte 0x0000011D
_08033648: .4byte 0x000003CA
_0803364C: .4byte 0x000003C1
_08033650: .4byte gGameMode
_08033654: .4byte gUnknown_080D72B1
_08033658: .4byte 0x00000121
_0803365C:
	ldr r0, [r5, #0x10]
	ldr r1, _080336E0 @ =0xFFFBFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0
_0803366A:
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	ldr r3, _080336E4 @ =0x000003CA
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r5, _080336E8 @ =0x000003C1
	adds r1, r7, r5
	ldrb r1, [r1]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08033704
	ldr r0, _080336EC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08033704
	movs r6, #0x96
	lsls r6, r6, #1
	adds r5, r7, r6
	ldr r1, _080336F0 @ =gUnknown_080D722C
	ldrh r0, [r1, #0x14]
	strh r0, [r5, #0xa]
	ldrh r1, [r1, #0x16]
	movs r2, #0xa6
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _080336F4 @ =0x0000014D
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r6, #0x30
	adds r5, r7, r6
	ldr r1, _080336F8 @ =gUnknown_080D71D4
	ldrh r0, [r1, #0x14]
	strh r0, [r5, #0xa]
	ldrh r1, [r1, #0x16]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _080336FC @ =0x0000017D
	adds r1, r7, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r6, #0x3c
	adds r5, r7, r6
	ldr r1, _08033700 @ =gUnknown_080D71EC
	ldrh r0, [r1, #0x14]
	strh r0, [r5, #0xa]
	ldrh r1, [r1, #0x16]
	b _08033772
	.align 2, 0
_080336E0: .4byte 0xFFFBFFFF
_080336E4: .4byte 0x000003CA
_080336E8: .4byte 0x000003C1
_080336EC: .4byte gGameMode
_080336F0: .4byte gUnknown_080D722C
_080336F4: .4byte 0x0000014D
_080336F8: .4byte gUnknown_080D71D4
_080336FC: .4byte 0x0000017D
_08033700: .4byte gUnknown_080D71EC
_08033704:
	movs r0, #0x96
	lsls r0, r0, #1
	adds r5, r7, r0
	ldr r2, _08033840 @ =gUnknown_080D722C
	mov r1, r8
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r6, r0
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r5, #0xa]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0xa6
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _08033844 @ =0x0000014D
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	movs r6, #0xae
	lsls r6, r6, #1
	adds r5, r7, r6
	ldr r0, _08033848 @ =gUnknown_080D71D4
	adds r1, r4, r0
	ldrh r1, [r1]
	strh r1, [r5, #0xa]
	adds r0, #2
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r2, #0xbe
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	ldr r3, _0803384C @ =0x0000017D
	adds r1, r7, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r6, #0x3c
	adds r5, r7, r6
	ldr r0, _08033850 @ =gUnknown_080D71EC
	adds r1, r4, r0
	ldrh r1, [r1]
	strh r1, [r5, #0xa]
	adds r0, #2
	adds r0, r4, r0
	ldrh r1, [r0]
_08033772:
	adds r2, #0x3c
	adds r0, r7, r2
	strb r1, [r0]
	adds r3, #0x3c
	adds r1, r7, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
_08033782:
	ldr r5, _08033854 @ =0x000003C3
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033864
	movs r4, #0
	ldr r6, [sp, #4]
	lsls r6, r6, #2
	str r6, [sp, #0x10]
	adds r0, r7, #0
	adds r0, #0xcc
	str r0, [sp, #0x14]
	ldr r1, _08033858 @ =gSineTable
	mov sl, r1
	movs r2, #0xf6
	lsls r2, r2, #2
	adds r6, r7, r2
	ldr r3, _0803385C @ =0x000003FF
	mov sb, r3
	movs r5, #0x5c
	mov r8, r5
_080337AC:
	adds r0, r4, #0
	movs r1, #5
	bl Div
	lsls r1, r0, #2
	adds r1, r1, r0
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08033860 @ =0x000003C1
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _080337D4
	movs r3, #0xf1
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _08033832
_080337D4:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xea
	lsls r5, r5, #1
	adds r0, r0, r5
	adds r5, r7, r0
	ldr r0, [r6]
	lsrs r0, r0, #8
	movs r1, #0x66
	muls r1, r4, r1
	adds r0, r0, r1
	adds r0, #2
	mov r2, sb
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r5, #0x16]
	ldr r0, [r6]
	lsrs r0, r0, #8
	adds r0, r0, r1
	adds r0, #2
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_08033832:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _080337AC
	b _08033904
	.align 2, 0
_08033840: .4byte gUnknown_080D722C
_08033844: .4byte 0x0000014D
_08033848: .4byte gUnknown_080D71D4
_0803384C: .4byte 0x0000017D
_08033850: .4byte gUnknown_080D71EC
_08033854: .4byte 0x000003C3
_08033858: .4byte gSineTable
_0803385C: .4byte 0x000003FF
_08033860: .4byte 0x000003C1
_08033864:
	movs r5, #0xf6
	lsls r5, r5, #2
	adds r0, r7, r5
	ldr r0, [r0]
	lsrs r0, r0, #8
	movs r6, #0xcc
	lsls r6, r6, #2
	adds r6, r6, r0
	ldr r1, _080339E4 @ =0x000003FF
	adds r0, r1, #0
	ands r6, r0
	mov r8, r6
	movs r4, #0
	ldr r2, [sp, #4]
	lsls r2, r2, #2
	str r2, [sp, #0x10]
	adds r3, r7, #0
	adds r3, #0xcc
	str r3, [sp, #0x14]
	ldr r3, _080339E8 @ =gSineTable
	movs r2, #0x5c
_0803388E:
	adds r1, r4, #2
	movs r0, #3
	ands r1, r0
	ldr r5, _080339EC @ =0x000003C1
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _080338AA
	movs r6, #0xf1
	lsls r6, r6, #2
	adds r0, r7, r6
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _080338FA
_080338AA:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r5, r7, r0
	movs r0, #0x66
	adds r1, r4, #0
	muls r1, r0, r1
	add r1, r8
	adds r1, #4
	ldr r0, _080339E4 @ =0x000003FF
	ands r1, r0
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r5, #0x16]
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r6, #0
	ldrsh r0, [r1, r6]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl sub_80051E8
	ldr r3, [sp, #0x1c]
	ldr r2, [sp, #0x18]
_080338FA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803388E
_08033904:
	movs r1, #0xf1
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #9
	bls _080339A4
	movs r2, #0xb1
	lsls r2, r2, #2
	adds r5, r7, r2
	movs r3, #0xbd
	lsls r3, r3, #2
	adds r6, r7, r3
	movs r2, #0
	movs r0, #0x65
	strh r0, [r5, #0x16]
	movs r0, #0x4f
	strh r0, [r5, #0x18]
	subs r1, #3
	adds r0, r7, r1
	ldrb r0, [r0]
	adds r0, #5
	subs r3, #0x10
	adds r1, r7, r3
	strb r0, [r1]
	ldr r0, _080339F0 @ =0x000002E5
	adds r1, r7, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r2, [r6]
	ldr r4, _080339E8 @ =gSineTable
	ldr r1, _080339F4 @ =0x000003C5
	adds r3, r7, r1
	ldrb r0, [r3]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r1, #0x3a
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, #0xc0
	strh r0, [r6, #2]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r2
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, #0xc0
	strh r0, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	ldr r2, _080339F8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_080339A4:
	ldr r5, [sp, #0xc]
	ldr r2, [sp]
	cmp r2, #0
	beq _08033A00
	ldr r3, _080339FC @ =0x000003CE
	adds r2, r7, r3
	ldr r1, _080339E8 @ =gSineTable
	ldr r6, [sp]
	lsls r0, r6, #5
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x17
	movs r0, #0x80
	subs r0, r0, r1
	lsls r0, r0, #1
	ldrh r6, [r2]
	adds r0, r0, r6
	strh r0, [r5, #0x16]
	ldrh r4, [r5, #0x16]
	ldr r1, [sp]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _08033A0C
	.align 2, 0
_080339E4: .4byte 0x000003FF
_080339E8: .4byte gSineTable
_080339EC: .4byte 0x000003C1
_080339F0: .4byte 0x000002E5
_080339F4: .4byte 0x000003C5
_080339F8: .4byte gUnknown_030054B8
_080339FC: .4byte 0x000003CE
_08033A00:
	ldr r2, _08033A48 @ =0x000003CE
	adds r0, r7, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	ldrh r4, [r5, #0x16]
	adds r6, r4, #0
_08033A0C:
	movs r0, #0x82
	strh r0, [r5, #0x18]
	ldr r3, _08033A4C @ =0x000003CA
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r1, _08033A50 @ =0x000003C1
	adds r2, r7, r1
	ldrb r3, [r2]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08033A5C
	ldr r0, _08033A54 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08033A5C
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r1, _08033A58 @ =gUnknown_080D72B1
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x25
	b _08033A6A
	.align 2, 0
_08033A48: .4byte 0x000003CE
_08033A4C: .4byte 0x000003CA
_08033A50: .4byte 0x000003C1
_08033A54: .4byte gGameMode
_08033A58: .4byte gUnknown_080D72B1
_08033A5C:
	ldr r0, [r5, #0x10]
	ldr r1, _08033AB8 @ =0xFFFBFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0
_08033A6A:
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r5, _08033ABC @ =0x000003C1
	adds r2, r7, r5
	ldrb r1, [r2]
	cmp r1, #1
	bne _08033AE6
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r5, r7, r0
	strh r6, [r5, #0x16]
	movs r0, #0x82
	strh r0, [r5, #0x18]
	ldr r3, _08033AC0 @ =0x000003CA
	adds r0, r7, r3
	ldrb r0, [r0]
	ldrb r2, [r2]
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	bne _08033AD0
	ldr r0, _08033AC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08033AD0
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r0, _08033AC8 @ =gUnknown_080D72B1
	ldrb r1, [r0, #5]
	ldr r6, _08033ACC @ =0x00000385
	adds r0, r7, r6
	strb r1, [r0]
	b _08033AE0
	.align 2, 0
_08033AB8: .4byte 0xFFFBFFFF
_08033ABC: .4byte 0x000003C1
_08033AC0: .4byte 0x000003CA
_08033AC4: .4byte gGameMode
_08033AC8: .4byte gUnknown_080D72B1
_08033ACC: .4byte 0x00000385
_08033AD0:
	ldr r0, [r5, #0x10]
	ldr r1, _08033BAC @ =0xFFFBFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
_08033AE0:
	adds r0, r5, #0
	bl sub_80051E8
_08033AE6:
	ldr r0, _08033BB0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08033B18
	movs r0, #0xf7
	lsls r0, r0, #2
	adds r2, r7, r0
	ldr r1, _08033BB4 @ =0x000003C1
	adds r0, r7, r1
	movs r1, #1
	ldrb r0, [r0]
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08033B18
	movs r2, #0xe4
	lsls r2, r2, #2
	adds r5, r7, r2
	strh r4, [r5, #0x16]
	movs r0, #0x82
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
_08033B18:
	movs r3, #0x96
	lsls r3, r3, #1
	adds r5, r7, r3
	movs r6, #0xf4
	lsls r6, r6, #2
	adds r1, r7, r6
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r0, r2, r3
	lsls r0, r0, #2
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r4, #0
	strh r0, [r5, #0x16]
	movs r0, #0x90
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r5, [sp, #0x14]
	movs r0, #0xf0
	strh r0, [r5, #0x16]
	movs r0, #0x10
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	movs r6, #0xae
	lsls r6, r6, #1
	adds r5, r7, r6
	movs r0, #0xc6
	lsls r0, r0, #1
	adds r6, r7, r0
	movs r0, #0x28
	strh r0, [r5, #0x16]
	movs r0, #0x4f
	strh r0, [r5, #0x18]
	ldr r1, [sp, #8]
	cmp r1, #7
	bhi _08033BBC
	strh r4, [r6]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r6, #2]
	movs r1, #8
	ldr r3, [sp, #8]
	subs r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	subs r2, r2, r0
	strh r2, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	ldr r2, _08033BB8 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08033BBE
	.align 2, 0
_08033BAC: .4byte 0xFFFBFFFF
_08033BB0: .4byte gGameMode
_08033BB4: .4byte 0x000003C1
_08033BB8: .4byte gUnknown_030054B8
_08033BBC:
	str r4, [r5, #0x10]
_08033BBE:
	adds r0, r5, #0
	bl sub_80051E8
	movs r6, #0xcc
	lsls r6, r6, #1
	adds r5, r7, r6
	movs r0, #0xe4
	lsls r0, r0, #1
	adds r6, r7, r0
	movs r1, #0
	movs r0, #0x28
	strh r0, [r5, #0x16]
	movs r0, #0x4f
	strh r0, [r5, #0x18]
	ldr r2, [sp, #8]
	cmp r2, #7
	bhi _08033C28
	strh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r6, #2]
	movs r1, #8
	ldr r3, [sp, #8]
	subs r1, r1, r3
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	subs r2, r2, r0
	strh r2, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	ldr r2, _08033C24 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08033C2A
	.align 2, 0
_08033C24: .4byte gUnknown_030054B8
_08033C28:
	str r1, [r5, #0x10]
_08033C2A:
	adds r0, r5, #0
	bl sub_80051E8
	movs r6, #0xc0
	lsls r6, r6, #2
	adds r5, r7, r6
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xcc
	lsls r0, r0, #2
	adds r5, r7, r0
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	
.syntax divided
