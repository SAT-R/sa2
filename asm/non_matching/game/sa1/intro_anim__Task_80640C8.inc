
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08064104 @ =gCurTask
	ldr r4, [r0]
	ldrh r3, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r3, r1
	str r0, [sp]
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	adds r1, #0x4c
	adds r2, r3, r1
	ldrh r1, [r2]
	strh r1, [r0, #0x30]
	ldr r0, _08064108 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08064110
	ldr r0, _0806410C @ =IntroOpenTitlescreenPlayMusic
	str r0, [r4, #8]
	b _08064232
	.align 2, 0
_08064104: .4byte gCurTask
_08064108: .4byte gPressedKeys
_0806410C: .4byte IntroOpenTitlescreenPlayMusic
_08064110:
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov sb, r2
	cmp r0, #0x97
	ble _080641AC
	subs r0, #0x98
	lsls r0, r0, #0xf
	lsrs r7, r0, #0x10
	cmp r7, #0x28
	bls _08064126
	movs r7, #0x28
_08064126:
	movs r2, #0
	mov sl, r2
	ldr r0, _08064204 @ =0x0300004C
	adds r0, r0, r3
	mov sb, r0
_08064130:
	ldr r0, _08064208 @ =gUnknown_086A5D34
	mov r1, sl
	lsls r1, r1, #1
	mov r8, r1
	add r0, r8
	ldrh r6, [r0]
	movs r1, #0x1f
	ands r1, r6
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r4, r6, #0
	ands r4, r0
	lsrs r4, r4, #5
	movs r3, #0xf8
	lsls r3, r3, #7
	adds r0, r3, #0
	ands r6, r0
	lsrs r6, r6, #0xa
	adds r0, r1, #0
	muls r0, r7, r0
	movs r1, #0x28
	bl Div
	adds r5, r0, #0
	movs r0, #0x1f
	ands r5, r0
	adds r0, r4, #0
	muls r0, r7, r0
	movs r1, #0x28
	bl Div
	adds r4, r0, #0
	movs r1, #0x1f
	ands r4, r1
	adds r0, r6, #0
	muls r0, r7, r0
	movs r1, #0x28
	bl Div
	movs r2, #0x1f
	ands r0, r2
	ldr r1, _0806420C @ =gBgPalette
	add r8, r1
	lsls r4, r4, #5
	orrs r5, r4
	lsls r0, r0, #0xa
	orrs r5, r0
	mov r3, r8
	strh r5, [r3]
	ldr r2, _08064210 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0x1f
	bls _08064130
_080641AC:
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, _08064214 @ =gBgScrollRegs
	cmp r0, #0xb5
	ble _080641DA
	ldrh r0, [r2, #2]
	adds r0, #2
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x64
	ble _080641CA
	movs r0, #0x64
	strh r0, [r2, #2]
_080641CA:
	ldrh r1, [r2, #2]
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #0x50
	ble _080641DA
	adds r0, r1, #0
	subs r0, #0x50
	strh r0, [r2, #0xa]
_080641DA:
	ldrh r0, [r2, #6]
	adds r0, #0xa
	strh r0, [r2, #6]
	mov r1, sb
	ldrh r0, [r1]
	bl sub_8063E8C
	mov r2, sb
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, _08064218 @ =0x0000013F
	cmp r1, r0
	ble _08064224
	movs r0, #0
	strh r0, [r2]
	ldr r0, _0806421C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08064220 @ =sub_8064244
	str r0, [r1, #8]
	b _0806422A
	.align 2, 0
_08064204: .4byte 0x0300004C
_08064208: .4byte gUnknown_086A5D34
_0806420C: .4byte gBgPalette
_08064210: .4byte gFlags
_08064214: .4byte gBgScrollRegs
_08064218: .4byte 0x0000013F
_0806421C: .4byte gCurTask
_08064220: .4byte sub_8064244
_08064224:
	ldr r0, [sp]
	bl sub_805423C
_0806422A:
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08064232:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
