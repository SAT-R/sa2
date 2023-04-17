
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013704
	b _08013934
_08013704:
	ldr r6, [r4, #0x20]
	movs r0, #8
	ands r6, r0
	cmp r6, #0
	beq _08013710
	b _080138CA
_08013710:
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r1, #0x64
	beq _08013728
	movs r0, #0x65
	strh r0, [r7]
_08013728:
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r0, #0x40
	mov sl, r0
	ands r0, r2
	str r1, [sp, #4]        @ sp04 = player->unk5C
	cmp r0, #0
	beq _080137FC
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r1, _08013774 @ =gUnknown_03005424
	mov r8, r1
	ldrh r1, [r1]
	movs r2, #0x80
	mov sb, r2
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08013754
	rsbs r5, r5, #0
_08013754:
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r3, r0, r5
	str r3, [r4, #0xc]
	cmp r2, #2
	ble _08013778
	adds r0, r4, #0
	bl sub_8013C50
	b sub_80136E8_return
	.align 2, 0
_08013774: .4byte gUnknown_03005424
_08013778:
	cmp r2, #0
	ble _080137A4
	adds r1, r4, #0
	adds r1, #0x24
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _0801379C @ =gPlayer
	ldr r0, _080137A0 @ =PlayerCB_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_0801379C: .4byte gPlayer
_080137A0: .4byte PlayerCB_8013BD4
_080137A4:
	cmp r2, #0
	bge _080137AA
	b _0801392C
_080137AA:
	movs r5, #0x90
	lsls r5, r5, #4
	mov r0, r8
	ldrh r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _080137BC
	rsbs r5, r5, #0
_080137BC:
	subs r0, r3, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bge _080137E4
	movs r0, #0x66
	strh r0, [r7]
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	b _080138D2
_080137E4:
	movs r0, #0x66
	strh r0, [r7]
	movs r1, #0xc0
	ldr r0, [r4, #0x20]
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080137F6
	movs r1, #0x80
_080137F6:
	rsbs r0, r1, #0
	strh r0, [r4, #0x12]
	b _080138D2
_080137FC:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080138BE
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r0, _0801384C @ =gUnknown_03005424
	mov r8, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801381C
	rsbs r5, r5, #0
_0801381C:
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bgt _080138CA
	mov r2, r8
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08013850
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	b _0801385A
	.align 2, 0
_0801384C: .4byte gUnknown_03005424
_08013850:
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
_0801385A:
	adds r2, r0, #0
	cmp r2, #0
	bge _080138A8
	ldr r0, _08013874 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013878
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _0801387E
	.align 2, 0
_08013874: .4byte gUnknown_03005424
_08013878:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_0801387E:
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r2, [r1]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _080138A0 @ =gPlayer
	ldr r0, _080138A4 @ =PlayerCB_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_080138A0: .4byte gPlayer
_080138A4: .4byte PlayerCB_8013BD4
_080138A8:
	movs r0, #0x67
	strh r0, [r7]
	movs r2, #0xc0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080138BA
	movs r2, #0x80
_080138BA:
	strh r2, [r4, #0x12]
	b _080138D2
_080138BE:
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	cmp r2, #0
	ble _080138D2
_080138CA:
	adds r0, r4, #0
	bl sub_8013CA0
	b sub_80136E8_return
_080138D2:
	movs r2, #1
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r5, #0xc0
	ands r5, r0
	cmp r5, #0
	bne _08013914
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
	adds r2, r0, #0
	cmp r2, #0
	bge _08013914
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
_0801390E:
	movs r0, #0x5d
	strh r0, [r7]
	b sub_80136E8_return
_08013914:
	cmp r2, #0
	beq _0801392C
	adds r1, r4, #0
	adds r1, #0xad
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801392C
	movs r0, #3
	strb r0, [r1]
_0801392C:
	adds r0, r4, #0
	bl sub_801394C
	b sub_80136E8_return
_08013934:
	adds r0, r4, #0
	bl sub_8013CA0
sub_80136E8_return:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
