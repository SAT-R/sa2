.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0         @ r5 = boss
	ldr r0, _0804AE94 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804AE7A
	ldrh r1, [r5, #0xe]
	cmp r1, #0
	bne _0804AE76
	ldr r0, _0804AE98 @ =gBldRegs
	strh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r2, _0804AE9C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
_0804AE76:
	movs r0, #2
	strh r0, [r5, #0xe]
_0804AE7A:
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	beq _0804AEA0
	subs r0, #1
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804AE8C
	b _0804B0CE
_0804AE8C:
	movs r0, #0x78
	strb r0, [r5, #0x12]
	b _0804B0CE
	.align 2, 0
_0804AE94: .4byte gPlayer
_0804AE98: .4byte gBldRegs
_0804AE9C: .4byte gFlags
_0804AEA0:
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _0804AED4
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	beq _0804AEC2
	movs r0, #0x78
	strb r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl UpdateScreenFade
_0804AEC2:
	ldr r0, _0804AED0 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _0804B0CE
	.align 2, 0
_0804AED0: .4byte gFlags
_0804AED4:
	ldrb r0, [r5, #0x12]
	subs r4, r0, #1
	strb r4, [r5, #0x12]
	movs r0, #0xff
	mov sb, r0          @ sb = r0 = 0xFF
	lsls r0, r4, #0x18
	cmp r0, #0
	bne _0804AF34
	ldr r2, _0804AF2C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl UpdateScreenFade
	ldrb r0, [r5, #8]
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r1, r2, #0
	cmp r0, #4
	bhi _0804AF10
	movs r1, #0x8c
_0804AF10:
	strh r1, [r5, #0xe]
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, _0804AF30 @ =0x000002C1
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	mov r6, sb
	orrs r0, r6
	strb r0, [r1]
	b _0804B0CE
	.align 2, 0
_0804AF2C: .4byte gFlags
_0804AF30: .4byte 0x000002C1
_0804AF34:
	ldr r0, [r5]
	movs r7, #0xbe
	lsls r7, r7, #8
	adds r0, r0, r7
	asrs r0, r0, #8
	mov r8, r0
	ldr r0, _0804AFF4 @ =gSineTable
	mov sl, r0              @ sl = gSineTable
	ldrh r1, [r5, #0x10]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	movs r6, #0
	ldrsh r0, [r0, r6]      @ r0 = COS(boss->unk10)
	movs r3, #0xb
	muls r0, r3, r0
	asrs r0, r0, #0xe
	add r8, r0
	ldr r2, _0804AFF8 @ =gCamera
	ldr r0, [r2]
	mov r7, r8
	subs r7, r7, r0
	mov r8, r7              @ r8 -= gCamera.x;
	ldr r0, [r5, #4]
	movs r6, #0xa0
	lsls r6, r6, #6
	adds r0, r0, r6
	asrs r6, r0, #8
	lsls r1, r1, #1
	add r1, sl
	movs r7, #0
	ldrsh r0, [r1, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	adds r6, r6, r0
	ldr r0, [r2, #4]
	subs r6, r6, r0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x5a
	bls _0804B008
	movs r0, #0
	bl InitHBlankBgOffsets
	mov r0, r8              @ r0 = r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r4, _0804AFFC @ =gPseudoRandom
	ldr r1, [r4]
	ldr r0, _0804B000 @ =0x00196225
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r1, _0804B004 @ =0x3C6EF35F
	adds r2, r2, r1
	str r2, [r4]
	ldrb r0, [r5, #0x12]
	subs r0, #0x5a
	lsls r0, r0, #3
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r1, #7
	ands r2, r1
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xa0
	bl sub_80075D0
	ldrb r1, [r5, #0x12]
	subs r1, #0x5a
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4c
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl UpdateScreenFade
	b _0804B0CE
	.align 2, 0
_0804AFF4: .4byte gSineTable
_0804AFF8: .4byte gCamera
_0804AFFC: .4byte gPseudoRandom
_0804B000: .4byte 0x00196225
_0804B004: .4byte 0x3C6EF35F
_0804B008:
	cmp r0, #0x5a
	bne _0804B02A
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, _0804B060 @ =0x000002C1
	strh r0, [r1, #0xa]
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0804B064 @ =0x00000105
	bl m4aSongNumStart
_0804B02A:
	ldrb r0, [r5, #0x12]
	lsls r3, r0, #0x18
	lsrs r7, r3, #0x18
	cmp r7, #0x45
	bhi _0804B074
	ldr r2, _0804B068 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804B06C @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804B070 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]        @ PseudoRandom32()
	lsrs r2, r3, #0x19
	movs r1, #7
	ands r0, r1
	adds r0, #8
	adds r4, r2, r0     @ r4 = ((PseudoRandom32() % 8u) + 8) + (boss->unk12 / 2);
	cmp r7, #0x3c
	bls _0804B096
	adds r1, r4, #0
	subs r1, #0xa
	lsls r1, r1, #8
	adds r0, r5, #0
	bl sub_804CCD0
	b _0804B096
	.align 2, 0
_0804B060: .4byte 0x000002C1
_0804B064: .4byte 0x00000105
_0804B068: .4byte gPseudoRandom
_0804B06C: .4byte 0x00196225
_0804B070: .4byte 0x3C6EF35F
_0804B074:
	ldr r2, _0804B0E0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804B0E4 @ =0x00196225
	muls r1, r0, r1
	ldr r7, _0804B0E8 @ =0x3C6EF35F
	adds r1, r1, r7
	str r1, [r2]
	ldrb r2, [r5, #0x12]
	movs r0, #0x74
	subs r0, r0, r2
	asrs r0, r0, #2
	movs r2, #7
	ands r1, r2
	adds r1, #0x1e
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0804B096:
	ldrh r0, [r5, #0x10]
	mov r1, r8
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	adds r1, r6, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0x20
	str r1, [sp, #4]
	adds r1, r4, #0
	movs r2, #6
	bl sub_802E784
	ldrb r1, [r5, #0x12]
	movs r0, #0x5b
	muls r1, r0, r1
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4c
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x48
	bl UpdateScreenFade
_0804B0CE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B0E0: .4byte gPseudoRandom
_0804B0E4: .4byte 0x00196225
_0804B0E8: .4byte 0x3C6EF35F
.syntax divided
