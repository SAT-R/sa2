.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8032D9C
sub_8032D9C: @ 0x08032D9C
	push {r4, lr}
	ldr r0, _08032DE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08032E0A
	ldr r1, _08032DE8 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08032DEC @ =gUnknown_03002AE4
	ldr r0, _08032DF0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08032DF4 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08032DF8 @ =gUnknown_03004D5C
	ldr r0, _08032DFC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08032E00 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032E04
	bl sub_8087FC0
	b _08032E2C
	.align 2, 0
_08032DE4: .4byte gCurTask
_08032DE8: .4byte 0x0000FFFF
_08032DEC: .4byte gUnknown_03002AE4
_08032DF0: .4byte gUnknown_0300287C
_08032DF4: .4byte gUnknown_03005390
_08032DF8: .4byte gUnknown_03004D5C
_08032DFC: .4byte gUnknown_03002A84
_08032E00: .4byte gGameMode
_08032E04:
	bl CreateTitleScreenAtSinglePlayerMenu
	b _08032E2C
_08032E0A:
	adds r0, r4, #0
	bl sub_803353C
	ldr r1, _08032E34 @ =gBgScrollRegs
	ldrh r0, [r1, #2]
	subs r0, #1
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	subs r0, #1
	ands r0, r2
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #0xa]
_08032E2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032E34: .4byte gBgScrollRegs

	thumb_func_start sub_8032E38
sub_8032E38: @ 0x08032E38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08032EFC @ =0x000003C3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032F08
	movs r4, #0
	movs r2, #0xf5
	lsls r2, r2, #2
	adds r2, r2, r5
	mov sl, r2
	ldr r3, _08032F00 @ =gSineTable
	mov sb, r3
	movs r7, #0xf6
	lsls r7, r7, #2
	adds r6, r5, r7
	ldr r0, _08032F04 @ =0x000003FF
	mov r8, r0
	movs r7, #0x5c
_08032E6A:
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r2, [r0]
	subs r1, r4, r2
	lsls r0, r1, #2
	adds r0, r0, r1
	mov r3, sl
	ldr r1, [r3]
	cmp r1, r0
	bhi _08032E8C
	cmp r2, #4
	bne _08032EF0
	cmp r4, #1
	bhi _08032EF0
	cmp r1, #0x13
	bls _08032EF0
_08032E8C:
	adds r0, r4, #0
	movs r1, #5
	bl Div
	lsls r1, r0, #2
	adds r1, r1, r0
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r5, r0
	ldr r0, [r6]
	lsrs r0, r0, #8
	movs r1, #0x66
	muls r1, r4, r1
	adds r0, r0, r1
	mov r3, r8
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r2, #0x16]
	ldr r0, [r6]
	lsrs r0, r0, #8
	adds r0, r0, r1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl sub_80051E8
_08032EF0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _08032E6A
	b _08033044
	.align 2, 0
_08032EFC: .4byte 0x000003C3
_08032F00: .4byte gSineTable
_08032F04: .4byte 0x000003FF
_08032F08:
	movs r7, #0xf6
	lsls r7, r7, #2
	adds r0, r5, r7
	ldr r0, [r0]
	lsrs r0, r0, #8
	movs r1, #0xcc
	lsls r1, r1, #2
	adds r6, r0, r1
	ldr r2, _0803306C @ =0x000003FF
	adds r0, r2, #0
	ands r6, r0
	movs r4, #0
	movs r3, #0xf5
	lsls r3, r3, #2
	adds r3, r3, r5
	mov r8, r3
	ldr r3, _08033070 @ =gSineTable
	movs r7, #0x5c
	mov sb, r7
_08032F2E:
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r0, [r0]
	subs r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	ldr r1, [r2]
	cmp r1, r0
	bls _08032F9A
	adds r1, r4, #2
	movs r0, #3
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r7, #0xea
	lsls r7, r7, #1
	adds r0, r0, r7
	adds r2, r5, r0
	movs r0, #0x66
	adds r1, r4, #0
	muls r1, r0, r1
	adds r1, r6, r1
	ldr r0, _0803306C @ =0x000003FF
	ands r1, r0
	subs r7, #0xd4
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r7, #0
	ldrsh r0, [r0, r7]
	mov r7, sb
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r2, #0x16]
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r7, #0
	ldrsh r0, [r1, r7]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	str r3, [sp]
	bl sub_80051E8
	ldr r3, [sp]
_08032F9A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _08032F2E
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08033044
	movs r3, #0xf5
	lsls r3, r3, #2
	adds r0, r5, r3
	ldr r0, [r0]
	cmp r0, #0x13
	bls _08033044
	ldr r2, _08033074 @ =gUnknown_080D7274
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08033044
	ldr r3, _08033070 @ =gSineTable
	movs r7, #0x5c
	mov sb, r7
	mov r8, r2
_08032FD6:
	adds r1, r4, #2
	movs r0, #3
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r5, r0
	movs r0, #0x66
	adds r1, r4, #0
	muls r1, r0, r1
	adds r1, r6, r1
	ldr r0, _0803306C @ =0x000003FF
	ands r1, r0
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r7, #0
	ldrsh r0, [r0, r7]
	mov r7, sb
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r2, #0x16]
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r7, #0
	ldrsh r0, [r1, r7]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	str r3, [sp]
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	add r0, r8
	ldr r3, [sp]
	ldrb r0, [r0]
	cmp r4, r0
	blo _08032FD6
_08033044:
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r2, r5, r3
	adds r0, r2, #0
	bl sub_80051E8
	movs r7, #0xcc
	lsls r7, r7, #2
	adds r2, r5, r7
	adds r0, r2, #0
	bl sub_80051E8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803306C: .4byte 0x000003FF
_08033070: .4byte gSineTable
_08033074: .4byte gUnknown_080D7274

	thumb_func_start sub_8033078
sub_8033078: @ 0x08033078
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	ldr r0, _08033148 @ =0x000003C3
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803315C
	movs r4, #0
	movs r0, #0xb9
	lsls r0, r0, #2
	add r0, sl
	str r0, [sp, #8]
	ldr r1, _0803314C @ =0x000002E5
	add r1, sl
	str r1, [sp, #0xc]
	mov r2, sl
	adds r2, #0xcc
	str r2, [sp]
	mov r3, sl
	adds r3, #0xfc
	str r3, [sp, #4]
	ldr r0, _08033150 @ =gSineTable
	mov sb, r0
	movs r5, #0xf6
	lsls r5, r5, #2
	add r5, sl
	ldr r1, _08033154 @ =0x000003FF
	mov r8, r1
	movs r6, #0x5c
_080330BC:
	adds r0, r4, #0
	movs r1, #5
	bl Div
	lsls r1, r0, #2
	adds r1, r1, r0
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _08033158 @ =0x000003C1
	add r0, sl
	ldrb r0, [r0]
	cmp r1, r0
	bne _080330E4
	movs r0, #0xf1
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _0803313C
_080330E4:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r2, #0xea
	lsls r2, r2, #1
	adds r0, r0, r2
	mov r3, sl
	adds r7, r3, r0
	ldr r0, [r5]
	lsrs r0, r0, #8
	movs r1, #0x66
	muls r1, r4, r1
	adds r0, r0, r1
	adds r0, #2
	mov r2, r8
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r7, #0x16]
	ldr r0, [r5]
	lsrs r0, r0, #8
	adds r0, r0, r1
	adds r0, #2
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
_0803313C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _080330BC
	b _08033206
	.align 2, 0
_08033148: .4byte 0x000003C3
_0803314C: .4byte 0x000002E5
_08033150: .4byte gSineTable
_08033154: .4byte 0x000003FF
_08033158: .4byte 0x000003C1
_0803315C:
	movs r0, #0xf6
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	lsrs r0, r0, #8
	movs r2, #0xcc
	lsls r2, r2, #2
	adds r5, r0, r2
	ldr r3, _080332A8 @ =0x000003FF
	adds r0, r3, #0
	ands r5, r0
	movs r4, #0
	movs r0, #0xb9
	lsls r0, r0, #2
	add r0, sl
	str r0, [sp, #8]
	ldr r1, _080332AC @ =0x000002E5
	add r1, sl
	str r1, [sp, #0xc]
	mov r2, sl
	adds r2, #0xcc
	str r2, [sp]
	mov r3, sl
	adds r3, #0xfc
	str r3, [sp, #4]
	ldr r2, _080332B0 @ =gSineTable
	movs r6, #0x5c
_08033192:
	adds r1, r4, #2
	movs r0, #3
	ands r1, r0
	ldr r0, _080332B4 @ =0x000003C1
	add r0, sl
	ldrb r0, [r0]
	cmp r1, r0
	bne _080331AE
	movs r0, #0xf1
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _080331FC
_080331AE:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r3, sl
	adds r7, r3, r0
	movs r0, #0x66
	adds r1, r4, #0
	muls r1, r0, r1
	adds r1, r5, r1
	adds r1, #4
	ldr r0, _080332A8 @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r7, #0x16]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	str r2, [sp, #0x10]
	bl sub_80051E8
	ldr r2, [sp, #0x10]
_080331FC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _08033192
_08033206:
	movs r7, #0xb1
	lsls r7, r7, #2
	add r7, sl
	movs r6, #0xbd
	lsls r6, r6, #2
	add r6, sl
	movs r1, #0
	movs r0, #0x65
	strh r0, [r7, #0x16]
	movs r0, #0x4f
	strh r0, [r7, #0x18]
	ldr r0, _080332B4 @ =0x000003C1
	add r0, sl
	ldrb r0, [r0]
	adds r0, #5
	ldr r2, [sp, #8]
	strb r0, [r2]
	movs r0, #0xff
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	strh r1, [r6]
	ldr r4, _080332B0 @ =gSineTable
	ldr r3, _080332B8 @ =0x000003C5
	add r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _080332A8 @ =0x000003FF
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
	ldrh r0, [r7, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r7, #0x18]
	strh r0, [r6, #8]
	ldr r2, _080332BC @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #0xf5
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #7
	bhi _080332C0
	movs r4, #0xa0
	b _080332CC
	.align 2, 0
_080332A8: .4byte 0x000003FF
_080332AC: .4byte 0x000002E5
_080332B0: .4byte gSineTable
_080332B4: .4byte 0x000003C1
_080332B8: .4byte 0x000003C5
_080332BC: .4byte gUnknown_030054B8
_080332C0:
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x18
_080332CC:
	ldr r7, [sp]
	adds r0, r4, #0
	adds r0, #0xf0
	strh r0, [r7, #0x16]
	movs r0, #0x10
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #0xf5
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r0]
	cmp r1, #7
	bhi _080332F4
	movs r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _080332F6
_080332F4:
	movs r4, #0
_080332F6:
	ldr r7, [sp, #4]
	cmp r4, #0
	beq _08033328
	ldr r2, _08033320 @ =0x000003CE
	add r2, sl
	ldr r1, _08033324 @ =gSineTable
	lsls r0, r4, #5
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
	ldrh r2, [r2]
	adds r0, r0, r2
	b _0803332E
	.align 2, 0
_08033320: .4byte 0x000003CE
_08033324: .4byte gSineTable
_08033328:
	ldr r0, _0803336C @ =0x000003CE
	add r0, sl
	ldrh r0, [r0]
_0803332E:
	strh r0, [r7, #0x16]
	movs r0, #0x82
	strh r0, [r7, #0x18]
	ldrh r4, [r7, #0x16]
	ldr r0, _08033370 @ =0x000003CA
	add r0, sl
	ldrb r0, [r0]
	ldr r2, _08033374 @ =0x000003C1
	add r2, sl
	ldrb r1, [r2]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08033380
	ldr r0, _08033378 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08033380
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r1, _0803337C @ =gUnknown_080D72B1
	ldrb r0, [r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x25
	b _0803338E
	.align 2, 0
_0803336C: .4byte 0x000003CE
_08033370: .4byte 0x000003CA
_08033374: .4byte 0x000003C1
_08033378: .4byte gGameMode
_0803337C: .4byte gUnknown_080D72B1
_08033380:
	ldr r0, [r7, #0x10]
	ldr r1, _080333DC @ =0xFFFBFFFF
	ands r0, r1
	str r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #0
_0803338E:
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r2, _080333E0 @ =0x000003C1
	add r2, sl
	ldrb r1, [r2]
	cmp r1, #1
	bne _0803340A
	movs r7, #0xd8
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	movs r0, #0x82
	strh r0, [r7, #0x18]
	ldr r0, _080333E4 @ =0x000003CA
	add r0, sl
	ldrb r0, [r0]
	ldrb r2, [r2]
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	bne _080333F4
	ldr r0, _080333E8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080333F4
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r0, _080333EC @ =gUnknown_080D72B1
	ldrb r1, [r0, #5]
	ldr r0, _080333F0 @ =0x00000385
	add r0, sl
	strb r1, [r0]
	b _08033404
	.align 2, 0
_080333DC: .4byte 0xFFFBFFFF
_080333E0: .4byte 0x000003C1
_080333E4: .4byte 0x000003CA
_080333E8: .4byte gGameMode
_080333EC: .4byte gUnknown_080D72B1
_080333F0: .4byte 0x00000385
_080333F4:
	ldr r0, [r7, #0x10]
	ldr r1, _0803341C @ =0xFFFBFFFF
	ands r0, r1
	str r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
_08033404:
	adds r0, r7, #0
	bl sub_80051E8
_0803340A:
	movs r0, #0xf5
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r0]
	cmp r1, #3
	bhi _08033420
	movs r4, #8
	b _08033430
	.align 2, 0
_0803341C: .4byte 0xFFFBFFFF
_08033420:
	cmp r1, #0xb
	bhi _0803342E
	movs r0, #0xc
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _08033430
_0803342E:
	movs r4, #0
_08033430:
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, sl
	movs r1, #0xf4
	lsls r1, r1, #2
	add r1, sl
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r7, #0x16]
	movs r0, #0x90
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xae
	lsls r7, r7, #1
	add r7, sl
	movs r6, #0xc6
	lsls r6, r6, #1
	add r6, sl
	movs r2, #0x28
	strh r2, [r7, #0x16]
	movs r3, #0x4f
	strh r3, [r7, #0x18]
	movs r0, #0
	strh r0, [r6]
	movs r5, #0x80
	lsls r5, r5, #1
	strh r5, [r6, #2]
	movs r1, #0xf5
	lsls r1, r1, #2
	add r1, sl
	mov sb, r1
	ldr r1, [r1]
	movs r4, #0x10
	subs r1, r4, r1
	lsls r0, r1, #4
	subs r0, r0, r1
	subs r0, r5, r0
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r7, #0x18]
	strh r0, [r6, #8]
	ldr r2, _08033538 @ =gUnknown_030054B8
	mov r8, r2
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r3, #0x20
	orrs r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xcc
	lsls r7, r7, #1
	add r7, sl
	movs r6, #0xe4
	lsls r6, r6, #1
	add r6, sl
	movs r0, #0x28
	strh r0, [r7, #0x16]
	movs r1, #0x4f
	strh r1, [r7, #0x18]
	movs r2, #0
	strh r2, [r6]
	strh r5, [r6, #2]
	mov r3, sb
	ldr r0, [r3]
	subs r4, r4, r0
	lsls r0, r4, #4
	subs r0, r0, r4
	subs r5, r5, r0
	strh r5, [r6, #4]
	ldrh r0, [r7, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r7, #0x18]
	strh r0, [r6, #8]
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r0, #1
	mov r2, r8
	strb r1, [r2]
	movs r3, #0x20
	orrs r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xc0
	lsls r7, r7, #2
	add r7, sl
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xcc
	lsls r7, r7, #2
	add r7, sl
	adds r0, r7, #0
	bl sub_80051E8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033538: .4byte gUnknown_030054B8

	thumb_func_start sub_803353C
sub_803353C: @ 0x0803353C
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

	thumb_func_start sub_8033C64
sub_8033C64: @ 0x08033C64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _08033D30 @ =0x000003C3
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033D3C
	movs r4, #0
	adds r2, r6, #0
	adds r2, #0xfc
	str r2, [sp, #4]
	adds r3, r6, #0
	adds r3, #0xcc
	str r3, [sp]
	ldr r5, _08033D34 @ =gSineTable
	mov sl, r5
	movs r0, #0xf6
	lsls r0, r0, #2
	adds r7, r6, r0
	adds r1, #0x3c
	mov sb, r1
	movs r2, #0x5c
	mov r8, r2
_08033C9C:
	adds r0, r4, #0
	movs r1, #5
	bl Div
	lsls r1, r0, #2
	adds r1, r1, r0
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _08033D38 @ =0x000003C1
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _08033CC4
	movs r5, #0xf1
	lsls r5, r5, #2
	adds r0, r6, r5
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _08033D22
_08033CC4:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r5, r6, r0
	ldr r0, [r7]
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
	ldr r0, [r7]
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
_08033D22:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #9
	bls _08033C9C
	b _08033DDC
	.align 2, 0
_08033D30: .4byte 0x000003C3
_08033D34: .4byte gSineTable
_08033D38: .4byte 0x000003C1
_08033D3C:
	movs r5, #0xf6
	lsls r5, r5, #2
	adds r0, r6, r5
	ldr r0, [r0]
	lsrs r0, r0, #8
	movs r7, #0xcc
	lsls r7, r7, #2
	adds r7, r7, r0
	ldr r1, _08033F1C @ =0x000003FF
	adds r0, r1, #0
	adds r2, r7, #0
	ands r2, r0
	mov r8, r2
	movs r4, #0
	adds r3, r6, #0
	adds r3, #0xfc
	str r3, [sp, #4]
	adds r5, r6, #0
	adds r5, #0xcc
	str r5, [sp]
	ldr r3, _08033F20 @ =gSineTable
	movs r2, #0x5c
_08033D68:
	adds r1, r4, #2
	movs r0, #3
	ands r1, r0
	ldr r7, _08033F24 @ =0x000003C1
	adds r0, r6, r7
	ldrb r0, [r0]
	cmp r1, r0
	bne _08033D84
	movs r5, #0xf1
	lsls r5, r5, #2
	adds r0, r6, r5
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _08033DD2
_08033D84:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r7, #0xea
	lsls r7, r7, #1
	adds r0, r0, r7
	adds r5, r6, r0
	movs r0, #0x66
	adds r1, r4, #0
	muls r1, r0, r1
	add r1, r8
	adds r1, #4
	ldr r0, _08033F1C @ =0x000003FF
	ands r1, r0
	subs r7, #0xd4
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r0, #0xa
	strh r0, [r5, #0x16]
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r7, #0
	ldrsh r0, [r1, r7]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	adds r0, #0x50
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	bl sub_80051E8
	ldr r3, [sp, #0xc]
	ldr r2, [sp, #8]
_08033DD2:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _08033D68
_08033DDC:
	ldr r0, _08033F28 @ =0x000003C5
	adds r7, r6, r0
	ldrb r0, [r7]
	cmp r0, #0
	beq _08033E76
	movs r1, #0xb1
	lsls r1, r1, #2
	adds r5, r6, r1
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r4, r6, r2
	movs r2, #0
	movs r0, #0x65
	strh r0, [r5, #0x16]
	movs r0, #0x4f
	strh r0, [r5, #0x18]
	ldr r3, _08033F24 @ =0x000003C1
	adds r0, r6, r3
	ldrb r0, [r0]
	adds r0, #5
	subs r3, #0xdd
	adds r1, r6, r3
	strb r0, [r1]
	ldr r0, _08033F2C @ =0x000002E5
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r2, [r4]
	ldr r3, _08033F20 @ =gSineTable
	ldrb r0, [r7]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08033F1C @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, #0xc0
	strh r0, [r4, #2]
	ldrb r0, [r7]
	lsls r0, r0, #4
	adds r0, r0, r2
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, #0xc0
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	ldr r2, _08033F30 @ =gUnknown_030054B8
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
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_08033E76:
	ldr r0, [sp, #4]
	bl sub_8004558
	ldr r0, [sp, #4]
	bl sub_80051E8
	ldr r1, _08033F24 @ =0x000003C1
	adds r5, r6, r1
	ldrb r0, [r5]
	cmp r0, #1
	bne _08033E9E
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r4, r6, r2
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08033E9E:
	ldr r0, _08033F34 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08033EC4
	movs r3, #0xf7
	lsls r3, r3, #2
	adds r0, r6, r3
	movs r1, #1
	ldrb r5, [r5]
	lsls r1, r5
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08033EC4
	movs r5, #0xe4
	lsls r5, r5, #2
	adds r0, r6, r5
	bl sub_80051E8
_08033EC4:
	movs r7, #0x96
	lsls r7, r7, #1
	adds r0, r6, r7
	bl sub_80051E8
	ldr r0, [sp]
	bl sub_80051E8
	movs r1, #0xae
	lsls r1, r1, #1
	adds r0, r6, r1
	bl sub_80051E8
	movs r2, #0xcc
	lsls r2, r2, #1
	adds r0, r6, r2
	bl sub_80051E8
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r5, r6, r3
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r7, #0xcc
	lsls r7, r7, #2
	adds r5, r6, r7
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033F1C: .4byte 0x000003FF
_08033F20: .4byte gSineTable
_08033F24: .4byte 0x000003C1
_08033F28: .4byte 0x000003C5
_08033F2C: .4byte 0x000002E5
_08033F30: .4byte gUnknown_030054B8
_08033F34: .4byte gGameMode

	thumb_func_start sub_8033F38
sub_8033F38: @ 0x08033F38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r0, sp
	movs r1, #0
	movs r2, #5
	bl memset
	ldr r0, _08033FD0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, _08033FD4 @ =gBgScrollRegs
	ldrh r0, [r1, #2]
	subs r0, #1
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	subs r0, #1
	ands r0, r2
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #0xa]
	ldr r0, _08033FD8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0803406A
	movs r3, #0
	ldr r0, _08033FDC @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov sb, r0
	cmp r1, #0
	beq _08034018
	movs r6, #1
	ldr r2, _08033FE0 @ =gUnknown_030054D4
_08033F92:
	ldr r1, _08033FE4 @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _08034000
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08034004
	movs r0, #0
	ldr r1, _08033FE8 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08033FEC @ =gUnknown_03002AE4
	ldr r0, _08033FF0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08033FF4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08033FF8 @ =gUnknown_03004D5C
	ldr r0, _08033FFC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _0803433C
	.align 2, 0
_08033FD0: .4byte gCurTask
_08033FD4: .4byte gBgScrollRegs
_08033FD8: .4byte gGameMode
_08033FDC: .4byte gUnknown_030055B8
_08033FE0: .4byte gUnknown_030054D4
_08033FE4: .4byte gMultiSioStatusFlags
_08033FE8: .4byte 0x0000FFFF
_08033FEC: .4byte gUnknown_03002AE4
_08033FF0: .4byte gUnknown_0300287C
_08033FF4: .4byte gUnknown_03005390
_08033FF8: .4byte gUnknown_03004D5C
_08033FFC: .4byte gUnknown_03002A84
_08034000:
	movs r0, #0
	strb r0, [r2]
_08034004:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08034018
	mov r1, sb
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	bne _08033F92
_08034018:
	ldr r0, _080340F0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0803406A
	movs r2, #0xf7
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0
	str r0, [r1]
	movs r3, #0
	ldr r0, _080340F4 @ =0x00004020
	mov r8, r0
	adds r4, r1, #0
	ldr r7, _080340F8 @ =gMultiSioRecv
	movs r6, #0
_08034036:
	ldr r0, _080340FC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	beq _08034062
	mov r1, sb
	ldrb r0, [r1]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08034062
	adds r2, r6, r7
	ldrh r0, [r2]
	cmp r0, r8
	bls _08034062
	ldrb r2, [r2, #2]
	lsls r1, r2
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
_08034062:
	adds r6, #0x14
	adds r3, #1
	cmp r3, #3
	bls _08034036
_0803406A:
	ldr r0, _08034100 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08034120
	movs r2, #0xf2
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08034104 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08034108 @ =sub_8031E84
	str r0, [r1, #8]
	adds r2, r5, #0
	adds r2, #0xfc
	ldr r1, _0803410C @ =gUnknown_080D7204
	ldr r3, _08034110 @ =0x000003C1
	adds r4, r5, r3
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _08034114 @ =0x0000011D
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r2, r5, r0
	subs r0, #0x80
	strh r0, [r2, #0xa]
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xa
	strb r0, [r1]
	ldr r3, _08034118 @ =0x00000381
	adds r1, r5, r3
	subs r0, #0xb
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8033C64
	ldr r0, _0803411C @ =gMultiSioSend
	mov sb, r0
	ldr r0, _080340F4 @ =0x00004020
	mov r1, sb
	strh r0, [r1]
	ldrb r0, [r4]
	strb r0, [r1, #2]
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0803433C
	.align 2, 0
_080340F0: .4byte gGameMode
_080340F4: .4byte 0x00004020
_080340F8: .4byte gMultiSioRecv
_080340FC: .4byte 0x04000128
_08034100: .4byte gPressedKeys
_08034104: .4byte gCurTask
_08034108: .4byte sub_8031E84
_0803410C: .4byte gUnknown_080D7204
_08034110: .4byte 0x000003C1
_08034114: .4byte 0x0000011D
_08034118: .4byte 0x00000381
_0803411C: .4byte gMultiSioSend
_08034120:
	ldr r2, _08034188 @ =gMultiSioRecv
	ldrh r1, [r2]
	ldr r0, _0803418C @ =0x00004022
	mov ip, r2
	cmp r1, r0
	bne _080341AC
	movs r3, #0
	ldr r0, _08034190 @ =gCurTask
	mov sl, r0
	ldr r1, _08034194 @ =gMultiSioStatusFlags
	mov r8, r1
	ldr r0, _08034198 @ =sub_8034358
	mov ip, r0
	ldr r7, _0803419C @ =gUnknown_030055B8
	movs r6, #1
	ldr r4, _080341A0 @ =gUnknown_03005500
_08034140:
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	beq _08034150
	adds r1, r3, r4
	ldrb r0, [r2, #2]
	strb r0, [r1]
_08034150:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #3
	bls _08034140
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08034172
	ldr r2, _080341A4 @ =gMultiSioSend
	ldr r0, _0803418C @ =0x00004022
	strh r0, [r2]
	ldr r3, _080341A8 @ =0x000003C1
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r2, #2]
_08034172:
	movs r1, #0xf3
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	mov r2, sl
	ldr r0, [r2]
	mov r3, ip
	str r3, [r0, #8]
	b _080342F4
	.align 2, 0
_08034188: .4byte gMultiSioRecv
_0803418C: .4byte 0x00004022
_08034190: .4byte gCurTask
_08034194: .4byte gMultiSioStatusFlags
_08034198: .4byte sub_8034358
_0803419C: .4byte gUnknown_030055B8
_080341A0: .4byte gUnknown_03005500
_080341A4: .4byte gMultiSioSend
_080341A8: .4byte 0x000003C1
_080341AC:
	movs r3, #0
	ldr r0, _0803425C @ =gUnknown_030055B8
	ldrb r7, [r0]
	ldr r1, _08034260 @ =0x00004021
	mov r8, r1
	movs r6, #0
_080341B8:
	adds r0, r7, #0
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080341F0
	ldr r1, _08034264 @ =0x04000128
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	beq _080341F0
	mov r0, ip
	adds r2, r6, r0
	ldrh r0, [r2]
	cmp r0, r8
	bne _080341F0
	ldr r0, _08034268 @ =0x000003C1
	adds r4, r5, r0
	ldrb r0, [r2, #2]
	ldrb r2, [r4]
	cmp r0, r2
	bne _080341F0
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	blo _0803427C
_080341F0:
	adds r6, #0x14
	adds r3, #1
	cmp r3, #3
	bls _080341B8
	ldr r0, _0803426C @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08034206
	b _08034324
_08034206:
	ldr r3, _08034270 @ =gMultiSioSend
	mov sb, r3
	ldr r0, _08034274 @ =0x00004022
	strh r0, [r3]
	ldr r1, _08034268 @ =0x000003C1
	adds r0, r5, r1
	ldrb r0, [r0]
	strb r0, [r3, #2]
	movs r3, #0
	ldr r0, _0803425C @ =gUnknown_030055B8
	ldrb r7, [r0]
	ldr r2, _08034278 @ =0x40210000
	mov r8, r2
	movs r6, #0
_08034222:
	adds r0, r7, #0
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08034250
	mov r0, ip
	adds r2, r6, r0
	ldrh r4, [r2]
	mov r1, r8
	lsrs r0, r1, #0x10
	cmp r4, r0
	bne _08034318
	ldrb r0, [r2, #2]
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803431E
_08034250:
	adds r6, #0x14
	adds r3, #1
	cmp r3, #3
	bls _08034222
	b _08034336
	.align 2, 0
_0803425C: .4byte gUnknown_030055B8
_08034260: .4byte 0x00004021
_08034264: .4byte 0x04000128
_08034268: .4byte 0x000003C1
_0803426C: .4byte gMultiSioStatusFlags
_08034270: .4byte gMultiSioSend
_08034274: .4byte 0x00004022
_08034278: .4byte 0x40210000
_0803427C:
	ldr r0, _080342FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08034300 @ =sub_8031E84
	str r0, [r1, #8]
	movs r0, #0x6b
	bl m4aSongNumStart
	movs r3, #0xf2
	lsls r3, r3, #2
	adds r1, r5, r3
	movs r0, #0
	strb r0, [r1]
	adds r2, r5, #0
	adds r2, #0xfc
	ldr r1, _08034304 @ =gUnknown_080D7204
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x8e
	lsls r3, r3, #1
	adds r0, r5, r3
	strb r1, [r0]
	ldr r0, _08034308 @ =0x0000011D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r2, r5, r1
	movs r0, #0xb8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r1, r5, r3
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _0803430C @ =0x00000381
	adds r1, r5, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	bl sub_8004558
	ldr r1, _08034310 @ =gMultiSioSend
	ldr r0, _08034314 @ =0x00004020
	strh r0, [r1]
	ldrb r0, [r4]
	strb r0, [r1, #2]
_080342F4:
	adds r0, r5, #0
	bl sub_8033C64
	b _0803433C
	.align 2, 0
_080342FC: .4byte gCurTask
_08034300: .4byte sub_8031E84
_08034304: .4byte gUnknown_080D7204
_08034308: .4byte 0x0000011D
_0803430C: .4byte 0x00000381
_08034310: .4byte gMultiSioSend
_08034314: .4byte 0x00004020
_08034318:
	mov r2, sb
	strh r0, [r2]
	b _08034336
_0803431E:
	mov r3, sb
	strh r4, [r3]
	b _08034336
_08034324:
	ldr r0, _0803434C @ =gMultiSioSend
	mov sb, r0
	ldr r0, _08034350 @ =0x00004021
	mov r1, sb
	strh r0, [r1]
	ldr r2, _08034354 @ =0x000003C1
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
_08034336:
	adds r0, r5, #0
	bl sub_8033C64
_0803433C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803434C: .4byte gMultiSioSend
_08034350: .4byte 0x00004021
_08034354: .4byte 0x000003C1

	thumb_func_start sub_8034358
sub_8034358: @ 0x08034358
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _080343CC @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080343D0 @ =gGameMode
	ldrb r0, [r0]
	mov sl, r2
	ldr r1, _080343D4 @ =gUnknown_030055B8
	mov r8, r1
	cmp r0, #2
	bls _08034410
	movs r2, #0
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08034410
	movs r5, #1
	ldr r3, _080343D8 @ =gUnknown_030054D4
_0803438C:
	ldr r1, _080343DC @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r2
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080343F8
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080343FC
	movs r0, #0
	ldr r1, _080343E0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080343E4 @ =gUnknown_03002AE4
	ldr r0, _080343E8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080343EC @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080343F0 @ =gUnknown_03004D5C
	ldr r0, _080343F4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _08034614
	.align 2, 0
_080343CC: .4byte gCurTask
_080343D0: .4byte gGameMode
_080343D4: .4byte gUnknown_030055B8
_080343D8: .4byte gUnknown_030054D4
_080343DC: .4byte gMultiSioStatusFlags
_080343E0: .4byte 0x0000FFFF
_080343E4: .4byte gUnknown_03002AE4
_080343E8: .4byte gUnknown_0300287C
_080343EC: .4byte gUnknown_03005390
_080343F0: .4byte gUnknown_03004D5C
_080343F4: .4byte gUnknown_03002A84
_080343F8:
	movs r0, #0
	strb r0, [r3]
_080343FC:
	adds r3, #1
	adds r2, #1
	cmp r2, #3
	bhi _08034410
	mov r4, r8
	ldrb r0, [r4]
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	bne _0803438C
_08034410:
	movs r3, #0
	movs r4, #0
	ldr r0, _0803446C @ =gMultiSioRecv
	mov ip, r0
	ldr r0, _08034470 @ =gUnknown_030055B8
	ldrb r5, [r0]
	ldr r7, _08034474 @ =0x00004021
	mov r1, ip
	movs r2, #1
_08034422:
	adds r0, r5, #0
	asrs r0, r3
	ands r0, r2
	cmp r0, #0
	beq _08034434
	ldrh r0, [r1]
	cmp r0, r7
	bhi _08034434
	movs r4, #1
_08034434:
	adds r1, #0x14
	adds r3, #1
	cmp r3, #3
	bls _08034422
	cmp r4, #0
	beq _0803448C
	movs r4, #0xf3
	lsls r4, r4, #2
	adds r1, r6, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08034480
	lsls r0, r0, #1
	strb r0, [r1]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08034484
	ldr r0, _08034478 @ =gMultiSioSend
	mov sb, r0
	ldr r0, _08034474 @ =0x00004021
	mov r1, sb
	strh r0, [r1]
	mov r4, sl
	ldr r1, [r4]
	ldr r0, _0803447C @ =sub_8033F38
	str r0, [r1, #8]
	b _08034484
	.align 2, 0
_0803446C: .4byte gMultiSioRecv
_08034470: .4byte gUnknown_030055B8
_08034474: .4byte 0x00004021
_08034478: .4byte gMultiSioSend
_0803447C: .4byte sub_8033F38
_08034480:
	movs r0, #1
	strb r0, [r1]
_08034484:
	adds r0, r6, #0
	bl sub_8033C64
	b _08034614
_0803448C:
	movs r1, #0xf3
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
	mov r4, ip
	ldrh r1, [r4]
	ldr r3, _080344E4 @ =0x00004023
	cmp r1, r3
	bne _080344FC
	movs r3, #0
	ldr r0, _080344E8 @ =gUnknown_030055B8
	mov ip, r0
	movs r2, #0
	movs r7, #1
	adds r5, r4, #0
_080344AA:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r7
	cmp r0, #0
	beq _080344CC
	adds r4, r2, r5
	ldr r0, _080344EC @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080344CC
	ldr r0, _080344F0 @ =gUnknown_03005500
	adds r0, r3, r0
	ldrb r1, [r4, #2]
	strb r1, [r0]
_080344CC:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #3
	bls _080344AA
	adds r0, r6, #0
	bl sub_8033C64
	ldr r0, _080344F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080344F8 @ =sub_8032AF4
	str r0, [r1, #8]
	b _08034614
	.align 2, 0
_080344E4: .4byte 0x00004023
_080344E8: .4byte gUnknown_030055B8
_080344EC: .4byte gMultiSioStatusFlags
_080344F0: .4byte gUnknown_03005500
_080344F4: .4byte gCurTask
_080344F8: .4byte sub_8032AF4
_080344FC:
	ldr r0, _08034514 @ =0x00004021
	cmp r1, r0
	bne _08034520
	ldr r4, _08034518 @ =gMultiSioSend
	subs r0, #1
	strh r0, [r4]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0803451C @ =sub_8033F38
	str r0, [r1, #8]
	b _08034614
	.align 2, 0
_08034514: .4byte 0x00004021
_08034518: .4byte gMultiSioSend
_0803451C: .4byte sub_8033F38
_08034520:
	ldr r0, _08034598 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080345C2
	ldr r1, _0803459C @ =gMultiSioSend
	mov sb, r1
	strh r3, [r1]
	ldr r4, _080345A0 @ =0x000003C1
	adds r0, r6, r4
	ldrb r0, [r0]
	strb r0, [r1, #2]
	movs r2, #0
	movs r3, #0
	ldr r0, _080345A4 @ =gLoadedSaveGame
	ldr r0, [r0]
	adds r0, #7
_08034544:
	adds r1, r0, r3
	ldrb r4, [r1]
	cmp r2, r4
	bhs _0803454E
	ldrb r2, [r1]
_0803454E:
	adds r3, #1
	cmp r3, #4
	bls _08034544
	movs r3, #0
	ldr r5, _080345A8 @ =0x40220000
	ldr r7, _080345AC @ =0x00004021
	movs r2, #0
_0803455C:
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080345B8
	cmp r3, #0
	beq _080345B8
	mov r0, ip
	adds r4, r2, r0
	ldr r0, _080345B0 @ =gUnknown_03005500
	adds r0, r3, r0
	ldrb r1, [r4, #2]
	strb r1, [r0]
	ldrh r0, [r4]
	lsrs r1, r5, #0x10
	cmp r0, r1
	beq _080345B8
	mov r4, sb
	strh r1, [r4]
	ldr r0, _080345B4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080345F2
	strh r7, [r4]
	b _080345F2
	.align 2, 0
_08034598: .4byte gMultiSioStatusFlags
_0803459C: .4byte gMultiSioSend
_080345A0: .4byte 0x000003C1
_080345A4: .4byte gLoadedSaveGame
_080345A8: .4byte 0x40220000
_080345AC: .4byte 0x00004021
_080345B0: .4byte gUnknown_03005500
_080345B4: .4byte gPressedKeys
_080345B8:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #3
	bls _0803455C
	b _080345F2
_080345C2:
	ldr r0, _08034624 @ =gMultiSioSend
	mov sb, r0
	ldr r0, _08034628 @ =0x00004022
	mov r1, sb
	strh r0, [r1]
	ldr r1, _0803462C @ =0x000003C1
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r4, #2]
	movs r2, #0
	movs r3, #0
	ldr r0, _08034630 @ =gLoadedSaveGame
	ldr r0, [r0]
	adds r0, #7
_080345DE:
	adds r1, r0, r3
	ldrb r4, [r1]
	cmp r2, r4
	bhs _080345E8
	ldrb r2, [r1]
_080345E8:
	adds r3, #1
	cmp r3, #4
	bls _080345DE
	mov r0, sb
	strb r2, [r0, #3]
_080345F2:
	adds r0, r6, #0
	bl sub_8033C64
	ldr r1, _08034634 @ =gBgScrollRegs
	ldrh r0, [r1, #2]
	subs r0, #1
	movs r2, #0xff
	ands r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	subs r0, #1
	ands r0, r2
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	adds r0, #1
	ands r0, r2
	strh r0, [r1, #0xa]
_08034614:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034624: .4byte gMultiSioSend
_08034628: .4byte 0x00004022
_0803462C: .4byte 0x000003C1
_08034630: .4byte gLoadedSaveGame
_08034634: .4byte gBgScrollRegs

	thumb_func_start sub_8034638
sub_8034638: @ 0x08034638
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _080346B4 @ =IWRAM_START + 0x130
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080346B8 @ =IWRAM_START + 0x160
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080346BC @ =IWRAM_START + 0x19C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080346C0 @ =IWRAM_START + 0xD0
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	movs r5, #0
	ldr r0, _080346C4 @ =IWRAM_START + 0x1D8
	adds r4, r4, r0
_08034670:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08034670
	movs r1, #0xb2
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xcd
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080346B4: .4byte IWRAM_START + 0x130
_080346B8: .4byte IWRAM_START + 0x160
_080346BC: .4byte IWRAM_START + 0x19C
_080346C0: .4byte IWRAM_START + 0xD0
_080346C4: .4byte IWRAM_START + 0x1D8

