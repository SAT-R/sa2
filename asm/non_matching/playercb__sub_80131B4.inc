
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0         @ r5 = player
	bl sub_8022838
	adds r7, r5, #0
	adds r7, #0xac          @ r7 = player->unkAC
	ldrb r1, [r7]
	movs r0, #2
	mov r8, r0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08013258
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _080131E6
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _080131EE
_080131E6:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_080131EE:
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0         @ r2 = -Q_24_8(0.25)
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801323A
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0801321C
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _08013224
_0801321C:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08013224:
	str r0, [r5, #0x20]
	movs r0, #0
	strh r0, [r5, #0x12]
	adds r0, r5, #0
	bl sub_8022318
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
	b sub_80131B4_return
_0801323A:
	ldr r1, _08013250 @ =gPlayer
	ldr r0, _08013254 @ =PlayerCB_8013C18
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5f
	strh r0, [r1]
	movs r0, #0x6f
	bl m4aSongNumStart
	b sub_80131B4_return
	.align 2, 0
_08013250: .4byte gPlayer
_08013254: .4byte PlayerCB_8013C18
_08013258:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08013262
	b _08013424
_08013262:
	adds r0, r5, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013272
	b _080133FC
_08013272:
	adds r1, r5, #0
	adds r1, #0xad
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	mov sb, r1
	cmp r0, #0
	bgt _0801332C
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sub_8029A28
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _0801329E
	b _080133FC
_0801329E:
	cmp r6, #0
	bne _080132A4
	b _080133BA
_080132A4:
	ldr r0, _080132E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080132F0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _080132EC @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801E4E4
	cmp r0, #0
	bge _0801331E
	b _08013348
	.align 2, 0
_080132E8: .4byte gUnknown_03005424
_080132EC: .4byte sub_801EE64
_080132F0:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _08013328 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	blt _080133FC
_0801331E:
	lsls r1, r6, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	b _080133B8
	.align 2, 0
_08013328: .4byte sub_801EE64
_0801332C:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sub_8029A74
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08013370
_08013348:
	ldr r1, _08013368 @ =gPlayer
	ldr r0, _0801336C @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	ldrb r0, [r7]
	mov r2, r8
	orrs r0, r2
	strb r0, [r7]
	b sub_80131B4_return
	.align 2, 0
_08013368: .4byte gPlayer
_0801336C: .4byte PlayerCB_8013BD4
_08013370:
	cmp r6, #0
	beq _080133BA
	ldr r0, _080133EC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080133B2
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _080133F0 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	blt _080133FC
_080133B2:
	lsls r1, r6, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
_080133B8:
	str r0, [r5, #8]
_080133BA:
	movs r0, #0
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	ldr r1, _080133F4 @ =gPlayer
	ldr r0, _080133F8 @ =PlayerCB_8013C34
	str r0, [r1]
	movs r0, #3
	mov r2, sb
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xa
	strb r0, [r5, #0x17]
	b sub_80131B4_return
	.align 2, 0
_080133EC: .4byte gUnknown_03005424
_080133F0: .4byte sub_801EE64
_080133F4: .4byte gPlayer
_080133F8: .4byte PlayerCB_8013C34
_080133FC:
	ldr r1, _0801341C @ =gPlayer
	ldr r0, _08013420 @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	ldrb r0, [r7]
	mov r1, r8
	orrs r0, r1
	strb r0, [r7]
	b sub_80131B4_return
	.align 2, 0
_0801341C: .4byte gPlayer
_08013420: .4byte PlayerCB_8013BD4
_08013424:
	adds r0, r5, #0
	adds r0, #0x5c
	ldr r1, _0801345C @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0801343E
	ldr r0, [r5, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013484
_0801343E:
	ldr r1, _08013460 @ =gPlayer
	ldr r0, _08013464 @ =PlayerCB_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bgt _08013468
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _08013470
	.align 2, 0
_0801345C: .4byte gPlayerControls
_08013460: .4byte gPlayer
_08013464: .4byte PlayerCB_8013BD4
_08013468:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08013470:
	str r0, [r5, #0x20]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r5, #0x10]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	b sub_80131B4_return
_08013484:
	adds r0, r5, #0
	bl sub_8013150
sub_80131B4_return:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.syntax divided
