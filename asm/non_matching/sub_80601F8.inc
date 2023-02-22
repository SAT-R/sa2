
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10           @ r2 = spikes
	adds r6, r0, #0         @ r6 = s
	adds r4, r1, #0         @ r4 = ia
	adds r5, r3, #0         @ r5 = player
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0         @ r3 = screenX
	lsls r3, r3, #0x10
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0         @ r1 = screenY
	lsls r1, r1, #0x10
	ldr r2, _080602C8 @ =gCamera    @ r2 = gCamera
	ldr r0, [r2]
	lsrs r7, r3, #0x10
	mov sl, r7              @ sl = screenX
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r2, r1, #0x10
	mov sb, r2              @ sb = screenY
	asrs r7, r1, #0x10      @ r7 = screenY
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	ldr r0, _080602CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080602FC
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080602FC
	ldr r0, _080602D0 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _080602FC
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r8, r0          @ r8 = flags
	cmp r0, #0
	beq _080602FC
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080602A4
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
_080602A4:
	ldr r0, _080602D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080602D8
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _080602EE
	.align 2, 0
_080602C8: .4byte gCamera
_080602CC: .4byte gGameMode
_080602D0: .4byte gUnknown_030053E0
_080602D4: .4byte gUnknown_03005424
_080602D8:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_080602EE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	bne _080603C6
_080602FC:      @ r5 = player
	ldr r1, [r5, #0x20]
	lsrs r7, r1, #3
	movs r0, #1
	ands r7, r0
	lsrs r1, r1, #1
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	ldr r0, [r5, #0x3c]
	str r0, [sp, #8]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]      @ sp0c = screenX
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	beq _0806042C
	movs r3, #0xc0
	lsls r3, r3, #0xa
	ands r3, r2
	cmp r3, #0
	beq _08060404
	ldr r0, _08060388 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	beq _0806038C
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0806042C
	movs r0, #0
	strh r0, [r5, #0x12]

                    @ r4 = screenY
                    @ r5 = player
                    @ r6 = s
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r4, r0
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]

	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]

	str r6, [r5, #0x3c]

	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
	b _080603BC
	.align 2, 0
_08060388: .4byte gUnknown_03005424
_0806038C:
	movs r0, #0x80
	lsls r0, r0, #9
	mov sb, r0
	ands r2, r0
	cmp r2, #0
	beq _0806042C
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _080603D0
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	ldr r1, [r5, #0xc]
	adds r1, r1, r0
	str r1, [r5, #0xc]
	mov r2, sl
	strh r2, [r5, #0x12]
_080603BC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0806042C
_080603C6:
	movs r0, #0x9a
	bl m4aSongNumStart
	movs r0, #1
	b _0806042E
_080603D0:
	cmp r7, #0
	beq _080603DC
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	b _080603E4
_080603DC:
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
_080603E4:
	str r0, [r5, #0x20]
	mov r7, r8
	cmp r7, #0
	beq _080603F4
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	b _080603FC
_080603F4:
	ldr r0, [r5, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
_080603FC:
	str r0, [r5, #0x20]
	ldr r0, [sp, #8]
	str r0, [r5, #0x3c]
	b _0806042C
_08060404:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0806042C
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0806042C:
	movs r0, #0
_0806042E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
