.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 00
.endif

	thumb_func_start sub_80601F8
sub_80601F8: @ 0x080601F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _080602C8 @ =gCamera
	ldr r0, [r2]
	lsrs r7, r3, #0x10
	mov sl, r7
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r2, r1, #0x10
	mov sb, r2
	asrs r7, r1, #0x10
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
	mov r8, r0
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
_080602FC:
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
	str r0, [sp, #0xc]
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

	thumb_func_start sub_8060440
sub_8060440: @ 0x08060440
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _080604C8 @ =gCamera
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r7, r1, #0x10
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0806054A
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	beq _0806054A
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _080604D0
	ldr r0, _080604CC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080604D0
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r5, r0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	adds r0, #1
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	strh r3, [r4, #0x12]
	strh r3, [r4, #0x14]
	b _08060508
	.align 2, 0
_080604C8: .4byte gCamera
_080604CC: .4byte gUnknown_03005424
_080604D0:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08060520
	ldr r0, _0806051C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08060520
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	subs r0, #1
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_08060508:
	adds r0, r4, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0806054A
	movs r0, #0x9a
	bl m4aSongNumStart
	movs r0, #1
	b _0806054C
	.align 2, 0
_0806051C: .4byte gUnknown_03005424
_08060520:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0806054A
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0806054A:
	movs r0, #0
_0806054C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8060554
sub_8060554: @ 0x08060554
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r2
	adds r5, r3, #0
	ldr r0, _080605F4 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0
	str r4, [sp, #0xc]
	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _080605F8 @ =gCamera
	ldr r0, [r3]
	lsrs r7, r2, #0x10
	str r7, [sp, #8]
	asrs r2, r2, #0x10
	mov r8, r2
	subs r0, r2, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	asrs r7, r1, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	cmp r4, #0x3b
	bhi _080605FC
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080605D0
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _080605D0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_080605D0:
	mov r0, sl
	lsls r1, r0, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080605F0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_080605F0:
	movs r0, #0
	b _0806099A
	.align 2, 0
_080605F4: .4byte gUnknown_03005590
_080605F8: .4byte gCamera
_080605FC:
	cmp r4, #0x3d
	bhi _08060660
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806061C
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0806061C
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0806061C:
	mov r2, sl
	lsls r1, r2, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0806063C
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_0806063C:
	ldr r1, _08060658 @ =sSpikesOfZone
	ldr r0, _0806065C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060928
	.align 2, 0
_08060658: .4byte sSpikesOfZone
_0806065C: .4byte gCurrentLevel
_08060660:
	cmp r4, #0x3f
	bhi _08060686
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060680
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060680
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060680:
	mov r3, sl
	lsls r1, r3, #2
	b _080608F4
_08060686:
	cmp r4, #0x7b
	bls _0806068C
	b _080608CE
_0806068C:
	adds r2, r6, #0
	adds r2, #0x20
	ldrb r0, [r2]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _080606AA
	cmp r1, #0
	bne _080606A0
	b _080607EA
_080606A0:
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	bne _080606AA
	b _080607EA
_080606AA:
	cmp r1, #0
	bne _080606B4
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_080606B4:
	ldr r1, _0806074C @ =sSpikesOfZone
	ldr r0, _08060750 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r2]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _08060786
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _080606FC
	b _08060998
_080606FC:
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
	ldr r0, _08060754 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060758
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
	b _0806076E
	.align 2, 0
_0806074C: .4byte sSpikesOfZone
_08060750: .4byte gCurrentLevel
_08060754: .4byte gUnknown_03005424
_08060758:
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
_0806076E:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
_08060772:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	bne _0806077E
	b _08060998
_0806077E:
	movs r0, #0x9a
	bl m4aSongNumStart
	b _08060998
_08060786:
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	bne _0806079A
	b _08060998
_0806079A:
	movs r4, #0x80
	lsls r4, r4, #9
	adds r3, r2, #0
	ands r3, r4
	cmp r3, #0
	beq _080607BE
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	ands r2, r4
	cmp r2, #0
	bne _080607BC
	b _08060998
_080607BC:
	b _08060772
_080607BE:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	bne _080607CA
	b _08060998
_080607CA:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
	b _08060998
_080607EA:
	ldr r7, [sp, #8]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r3, #0x10
	asrs r7, r4, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	adds r3, r4, #0
	cmp r2, #0
	beq _080608BE
	movs r4, #0x80
	lsls r4, r4, #9
	ands r0, r4
	cmp r0, #0
	beq _08060844
	ldr r0, _08060840 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060844
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	ands r2, r4
	cmp r2, #0
	beq _080608BE
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _080608BE
	b _0806077E
	.align 2, 0
_08060840: .4byte gUnknown_03005424
_08060844:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08060894
	ldr r0, _08060890 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08060894
	asrs r0, r3, #0x10
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
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
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _080608BE
	b _0806077E
	.align 2, 0
_08060890: .4byte gUnknown_03005424
_08060894:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _080608BE
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
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_080608BE:
	mov r2, sl
	lsls r0, r2, #2
	mov r1, sb
	adds r1, #0x3c
	adds r1, r1, r0
	ldr r0, [r5, #0x20]
	str r0, [r1]
	b _08060998
_080608CE:
	ldr r3, [sp, #0xc]
	cmp r3, #0x7d
	bhi _0806093C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080608F0
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _080608F0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_080608F0:
	mov r4, sl
	lsls r1, r4, #2
_080608F4:
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060910
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060910:
	ldr r1, _08060934 @ =sSpikesOfZone
	ldr r0, _08060938 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060928:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b _08060998
	.align 2, 0
_08060934: .4byte sSpikesOfZone
_08060938: .4byte gCurrentLevel
_0806093C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060958
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060958
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060958:
	mov r7, sl
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060978
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060978:
	ldr r1, _080609AC @ =sSpikesOfZone
	ldr r0, _080609B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
_08060998:
	movs r0, #1
_0806099A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080609AC: .4byte sSpikesOfZone
_080609B0: .4byte gCurrentLevel

	thumb_func_start sub_80609B4
sub_80609B4: @ 0x080609B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r7, r2, #0
	adds r5, r3, #0
	ldr r0, _08060A58 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0
	str r4, [sp, #0xc]
	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08060A5C @ =gCamera
	ldr r0, [r3]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #8]
	asrs r2, r2, #0x10
	mov r8, r2
	mov r0, sb
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	cmp r4, #0x3b
	bhi _08060A60
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A34
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A34
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A34:
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060A54
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060A54:
	movs r0, #0
	b _08060CDA
	.align 2, 0
_08060A58: .4byte gUnknown_03005590
_08060A5C: .4byte gCamera
_08060A60:
	cmp r4, #0x3d
	bhi _08060AC4
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A80
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A80
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A80:
	mov r4, sl
	lsls r1, r4, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060AA0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060AA0:
	ldr r1, _08060ABC @ =sSpikesOfZone
	ldr r0, _08060AC0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060C68
	.align 2, 0
_08060ABC: .4byte sSpikesOfZone
_08060AC0: .4byte gCurrentLevel
_08060AC4:
	cmp r4, #0x3f
	bhi _08060AEA
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060AE4
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060AE4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060AE4:
	mov r0, sl
	lsls r1, r0, #2
	b _08060C34
_08060AEA:
	cmp r4, #0x7b
	bls _08060AF0
	b _08060C0E
_08060AF0:
	adds r3, r6, #0
	adds r3, #0x20
	ldrb r0, [r3]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _08060B0A
	cmp r1, #0
	beq _08060BD4
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	beq _08060BD4
_08060B0A:
	cmp r1, #0
	bne _08060B14
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_08060B14:
	ldr r1, _08060BAC @ =sSpikesOfZone
	ldr r0, _08060BB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	beq _08060B46
	b _08060CD8
_08060B46:
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08060B5E
	b _08060CD8
_08060B5E:
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
	ldr r0, _08060BB4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060BB8
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _08060BCE
	.align 2, 0
_08060BAC: .4byte sSpikesOfZone
_08060BB0: .4byte gCurrentLevel
_08060BB4: .4byte gUnknown_03005424
_08060BB8:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_08060BCE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	b _08060BFC
_08060BD4:
	ldr r4, [sp, #8]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r1, sl
	lsls r2, r1, #2
	adds r1, r7, #0
	adds r1, #0x3c
	adds r1, r1, r2
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08060CD8
_08060BFC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _08060CD8
	movs r0, #0x9a
	bl m4aSongNumStart
	b _08060CD8
_08060C0E:
	ldr r2, [sp, #0xc]
	cmp r2, #0x7d
	bhi _08060C7C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C30
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C30
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C30:
	mov r4, sl
	lsls r1, r4, #2
_08060C34:
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060C50
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060C50:
	ldr r1, _08060C74 @ =sSpikesOfZone
	ldr r0, _08060C78 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060C68:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b _08060CD8
	.align 2, 0
_08060C74: .4byte sSpikesOfZone
_08060C78: .4byte gCurrentLevel
_08060C7C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C98
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C98
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C98:
	mov r0, sl
	lsls r1, r0, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060CB8
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060CB8:
	ldr r1, _08060CEC @ =sSpikesOfZone
	ldr r0, _08060CF0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
_08060CD8:
	movs r0, #1
_08060CDA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060CEC: .4byte sSpikesOfZone
_08060CF0: .4byte gCurrentLevel

	thumb_func_start TaskDestructor_8060CF4
TaskDestructor_8060CF4: @ 0x08060CF4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8060D08
sub_8060D08: @ 0x08060D08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r4, [r5]
	adds r4, #1
	strb r4, [r5]
	adds r6, r0, #0
	adds r6, #0x2e
	ldrb r4, [r6]
	subs r4, #1
	strb r4, [r6]
	bl sub_800CCB8
	ldrb r1, [r5]
	subs r1, #1
	strb r1, [r5]
	ldrb r1, [r6]
	adds r1, #1
	strb r1, [r6]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
