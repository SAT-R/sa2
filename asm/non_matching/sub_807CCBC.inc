
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0     @ r7 = ia086
	movs r0, #0
	mov sl, r0          @ sl = bIdk
	ldr r0, _0807CD64 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807CCDC
	movs r1, #1
	mov sl, r1
_0807CCDC:
	movs r2, #0
	mov r8, r2
_0807CCE0:
	mov r1, r8
	lsls r0, r1, #1
	add r0, r8
	lsls r0, r0, #4
	movs r2, #0xcc
	lsls r2, r2, #1
	adds r0, r0, r2
	adds r0, r7, r0
	bl sub_8004558
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _0807CCE0
	movs r0, #0
	mov r8, r0
	ldr r1, _0807CD68 @ =gSineTable
	mov sb, r1
_0807CD0A:              @ for(i = 0; i < 16; i++)
	mov r2, r8
	lsls r0, r2, #1
	add r0, r8
	lsls r0, r0, #3
	adds r6, r7, r0     @ r6 = unk086
	ldr r4, [r6]
	cmp r4, #0
	bne _0807CD7E
	mov r0, sl
	cmp r0, #0
	bne _0807CD22
	b _0807CE74
_0807CD22:
	bl Random
	ldr r2, _0807CD6C @ =gUnknown_080E0136
	movs r5, #7
	adds r1, r5, #0
	ands r1, r0
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xcc
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	str r0, [r6]
	bl Random
	strb r0, [r6, #4]
	str r4, [r6, #8]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _0807CD70
	bl Random
	adds r1, r5, #0
	ands r1, r0
	rsbs r1, r1, #0
	lsls r1, r1, #8
	b _0807CD74
	.align 2, 0
_0807CD64: .4byte gUnknown_03005590
_0807CD68: .4byte gSineTable
_0807CD6C: .4byte gUnknown_080E0136
_0807CD70:
	movs r1, #0x80
	lsls r1, r1, #6
_0807CD74:
	str r1, [r6, #0xc]
	movs r0, #0
	str r0, [r6, #0x10]
	str r0, [r6, #0x14]
	mov sl, r0
_0807CD7E:
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807CD88
	rsbs r0, r1, #0
_0807CD88:
	lsls r0, r0, #0xc
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3f
	ble _0807CDA0
	movs r3, #0x80
	lsls r3, r3, #2
	cmp r0, r3
	ble _0807CD9C
	adds r2, r3, #0
_0807CD9C:
	adds r0, r2, #0
	b _0807CDA2
_0807CDA0:
	movs r0, #0x40
_0807CDA2:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r3, r1, r0
	str r3, [r6, #0xc]
	cmp r3, #0
	ble _0807CE12
	rsbs r0, r3, #0
	str r0, [r6, #0x14]
	asrs r1, r3, #5
	ldr r2, _0807CE04 @ =0x00000246
	adds r0, r7, r2     @ r0 = ia086->unk228.unk1E
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r2, r0, #0x10
	movs r1, #0x92
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrh r1, [r0]
	cmp r1, r2
	bge _0807CDCE
	adds r1, r2, #0
_0807CDCE:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	asrs r1, r3, #8
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0807CE08
	adds r1, r2, #0
	cmp r0, #8
	ble _0807CE0A
	movs r1, #8
	b _0807CE0A
	.align 2, 0
_0807CE04: .4byte 0x00000246
_0807CE08:
	movs r1, #2
_0807CE0A:
	ldrb r0, [r6, #4]
	adds r0, r0, r1
	strb r0, [r6, #4]
	b _0807CE74
_0807CE12:
	asrs r0, r3, #8
	rsbs r0, r0, #0
	movs r2, #0x91
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrh r2, [r1]
	cmp r0, r2
	bge _0807CE70
	ldrb r0, [r6, #4]
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	str r0, [r6, #0x14]
	movs r2, #0x92
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r5, [r0]
	subs r2, #2
	adds r0, r7, r2
	ldrh r4, [r0]
	rsbs r0, r3, #0
	ldrh r1, [r1]
	bl __divsi3
	adds r2, r0, #0     @ r2 = divRes
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #8
	bl sub_80855C0
	lsls r0, r0, #0xf
	asrs r0, r0, #0x10
	ldrb r1, [r6, #4]
	lsls r1, r1, #3
	add r1, sb
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	str r0, [r6, #0x10]
	ldrb r0, [r6, #4]
	adds r0, #8
	strb r0, [r6, #4]
	b _0807CE74
_0807CE70:
	movs r0, #0
	str r0, [r6]
_0807CE74:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bhi _0807CE84
	b _0807CD0A
_0807CE84:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
    .syntax divided
