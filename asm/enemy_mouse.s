.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Enemy_Mouse
initSprite_Enemy_Mouse: @ 0x080571B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r0, _08057220 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	beq _080571E4
	ldr r0, _08057224 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #1
	bne _080571E4
	b _0805732E
_080571E4:
	ldr r0, _08057228 @ =sub_8057348
	ldr r2, _0805722C @ =0x00004040
	ldr r1, _08057230 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x54
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	mov r2, r8
	strh r2, [r5, #4]
	mov r3, sb
	strh r3, [r5, #6]
	str r7, [r5]
	ldrb r0, [r7]
	strb r0, [r5, #8]
	strb r4, [r5, #9]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08057238
	ldr r0, _08057234 @ =IWRAM_START + 0x50
	adds r1, r1, r0
	movs r0, #1
	b _0805723E
	.align 2, 0
_08057220: .4byte gGameMode
_08057224: .4byte gUnknown_030054EC
_08057228: .4byte sub_8057348
_0805722C: .4byte 0x00004040
_08057230: .4byte TaskDestructor_80095E8
_08057234: .4byte IWRAM_START + 0x50
_08057238:
	ldr r2, _08057278 @ =IWRAM_START + 0x50
	adds r1, r1, r2
	movs r0, #0
_0805723E:
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r3, r8
	lsls r2, r3, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	str r0, [r5, #0x3c]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0x40]
	movs r0, #0
	str r0, [r5, #0x44]
	ldrb r3, [r7, #6]
	mov sb, r2
	mov sl, r1
	cmp r3, #0
	beq _0805727C
	adds r1, r5, #0
	adds r1, #0x51
	movs r0, #1
	strb r0, [r1]
	mov r8, r1
	b _08057284
	.align 2, 0
_08057278: .4byte IWRAM_START + 0x50
_0805727C:
	adds r0, r5, #0
	adds r0, #0x51
	strb r3, [r0]
	mov r8, r0
_08057284:
	mov r0, r8
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805729E
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x50
	ldrb r2, [r2]
	movs r3, #0
	b _080572AC
_0805729E:
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x50
	ldrb r2, [r2]
_080572AC:
	str r3, [sp]
	ldr r3, _08057340 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	lsls r0, r0, #8
	str r0, [r5, #0x48]
	movs r4, #0
	str r4, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x52
	strb r4, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	add r0, sb
	movs r5, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	add r0, sl
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0xf
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _08057344 @ =0x00000201
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805732E
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_0805732E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057340: .4byte sub_801EE64
_08057344: .4byte 0x00000201

	thumb_func_start sub_8057348
sub_8057348: @ 0x08057348
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805738C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0xc
	adds r0, r0, r2
	mov r8, r0
	ldr r1, [r5]
	mov sl, r1
	ldr r0, [r0, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0805739A
	ldr r3, _08057390 @ =IWRAM_START + 0x52
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08057394
	ldr r0, [r5, #0x44]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	b _080573B8
	.align 2, 0
_0805738C: .4byte gCurTask
_08057390: .4byte IWRAM_START + 0x52
_08057394:
	ldr r0, [r5, #0x44]
	adds r0, #0x80
	b _080573B8
_0805739A:
	ldr r3, _080573AC @ =IWRAM_START + 0x52
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080573B4
	ldr r0, [r5, #0x44]
	ldr r1, _080573B0 @ =0xFFFFFE00
	adds r0, r0, r1
	b _080573B8
	.align 2, 0
_080573AC: .4byte IWRAM_START + 0x52
_080573B0: .4byte 0xFFFFFE00
_080573B4:
	ldr r0, [r5, #0x44]
	subs r0, #0x80
_080573B8:
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r3, [r0]
	cmp r3, #0
	beq _08057444
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	movs r2, #0x50
	adds r2, r2, r5
	mov sb, r2
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _0805743C @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801F07C
	cmp r0, #0
	bge _08057414
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	subs r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _08057440 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057414:
	cmp r0, #0
	ble _08057420
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	subs r0, r0, r1
	str r0, [r5, #0x48]
_08057420:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r6, r0, #0
	adds r6, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #8
	b _080574A8
	.align 2, 0
_0805743C: .4byte sub_801EE64
_08057440: .4byte sub_801EC3C
_08057444:
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	adds r4, r5, #0
	adds r4, #0x50
	ldrb r2, [r4]
	str r3, [sp]
	ldr r3, _08057530 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _0805748C
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	adds r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r4]
	ldr r3, _08057534 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_0805748C:
	cmp r0, #0
	ble _08057498
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	adds r0, r0, r1
	str r0, [r5, #0x48]
_08057498:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r7, r0, #8
_080574A8:
	ldr r4, _08057538 @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r1, #0x18]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08057524
	ldr r0, [r5, #0x3c]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _080574F6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _080574F6
	ldr r0, [r5, #0x40]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _080574F6
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08057540
_080574F6:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805751E
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _0805751E
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08057540
_0805751E:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
_08057524:
	ldr r0, _0805753C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080575F6
	.align 2, 0
_08057530: .4byte sub_801EE64
_08057534: .4byte sub_801EC3C
_08057538: .4byte gCamera
_0805753C: .4byte gCurTask
_08057540:
	mov r2, r8
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0805756C
	ldr r0, _08057568 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r3, r6, #8
	mov ip, r3
	cmp r1, ip
	ble _0805758A
	adds r0, r6, #0
	adds r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	bge _0805758A
	b _08057582
	.align 2, 0
_08057568: .4byte gPlayer
_0805756C:
	ldr r0, _08057608 @ =gPlayer
	ldr r1, [r0, #8]
	lsls r0, r6, #8
	mov ip, r0
	cmp r1, ip
	bge _0805758A
	adds r0, r6, #0
	subs r0, #0x64
	lsls r0, r0, #8
	cmp r1, r0
	ble _0805758A
_08057582:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
_0805758A:
	ldr r1, [r5, #0x44]
	asrs r3, r1, #8
	mov r2, sl
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r2, r0, #3
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r3, r2
	bgt _080575AC
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080575C8
_080575AC:
	asrs r1, r4, #8
	mov r2, sl
	ldrb r0, [r2, #5]
	adds r0, r5, r0
	lsls r0, r0, #3
	cmp r1, r0
	blt _080575E2
	mov r3, r8
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080575E2
_080575C8:
	ldr r0, _0805760C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057610 @ =sub_8057618
	str r0, [r1, #8]
	ldr r0, _08057614 @ =0x00000201
	strh r0, [r3, #0xa]
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_080575E2:
	lsls r1, r7, #8
	mov r0, ip
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
_080575F6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057608: .4byte gPlayer
_0805760C: .4byte gCurTask
_08057610: .4byte sub_8057618
_08057614: .4byte 0x00000201

	thumb_func_start sub_8057618
sub_8057618: @ 0x08057618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080576BC @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	adds r0, #0xc
	adds r0, r0, r3
	mov r8, r0
	ldr r1, [r5]
	mov sl, r1
	ldr r2, _080576C0 @ =IWRAM_START + 0x51
	adds r0, r3, r2
	ldrb r4, [r0]
	cmp r4, #0
	beq _080576D0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080576C4 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _080576C8 @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801F07C
	cmp r0, #0
	bge _08057694
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	subs r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _080576CC @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08057694:
	cmp r0, #0
	ble _080576A0
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	subs r0, r0, r1
	str r0, [r5, #0x48]
_080576A0:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r6, r0, #0
	adds r6, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #8
	b _08057738
	.align 2, 0
_080576BC: .4byte gCurTask
_080576C0: .4byte IWRAM_START + 0x51
_080576C4: .4byte IWRAM_START + 0x50
_080576C8: .4byte sub_801EE64
_080576CC: .4byte sub_801EC3C
_080576D0:
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _080577C0 @ =IWRAM_START + 0x50
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	str r4, [sp]
	ldr r3, _080577C4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _0805771C
	lsls r0, r0, #8
	ldr r1, [r5, #0x48]
	adds r1, r1, r0
	str r1, [r5, #0x48]
	ldr r0, [r5, #0x40]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x3c]
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	ldr r3, _080577C8 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_0805771C:
	cmp r0, #0
	ble _08057728
	lsls r1, r0, #8
	ldr r0, [r5, #0x48]
	adds r0, r0, r1
	str r0, [r5, #0x48]
_08057728:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x44]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	asrs r7, r0, #8
_08057738:
	ldr r4, _080577CC @ =gCamera
	ldr r0, [r4]
	subs r0, r6, r0
	mov r1, r8
	strh r0, [r1, #0x16]
	ldr r0, [r4, #4]
	subs r0, r7, r0
	strh r0, [r1, #0x18]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _080577B4
	ldr r0, [r5, #0x3c]
	asrs r2, r0, #8
	ldr r1, [r4]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057786
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08057786
	ldr r0, [r5, #0x40]
	asrs r2, r0, #8
	ldr r1, [r4, #4]
	subs r3, #0x50
	adds r0, r1, r3
	cmp r2, r0
	bgt _08057786
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _080577D4
_08057786:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080577AE
	mov r2, r8
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _080577AE
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080577D4
_080577AE:
	ldrb r0, [r5, #8]
	mov r1, sl
	strb r0, [r1]
_080577B4:
	ldr r0, _080577D0 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08057836
	.align 2, 0
_080577C0: .4byte IWRAM_START + 0x50
_080577C4: .4byte sub_801EE64
_080577C8: .4byte sub_801EC3C
_080577CC: .4byte gCamera
_080577D0: .4byte gCurTask
_080577D4:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	mov r0, r8
	bl sub_8004558
	adds r1, r0, #0
	cmp r1, #0
	bne _08057830
	adds r0, r5, #0
	adds r0, #0x52
	strb r1, [r0]
	mov r2, r8
	ldr r1, [r2, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0805780C
	ldr r0, _08057808 @ =0xFFFFFBFF
	ands r1, r0
	mov r3, r8
	str r1, [r3, #0x10]
	b _08057812
	.align 2, 0
_08057808: .4byte 0xFFFFFBFF
_0805780C:
	orrs r1, r2
	mov r0, r8
	str r1, [r0, #0x10]
_08057812:
	movs r1, #0
	ldr r0, _08057848 @ =0x00000201
	mov r2, r8
	strh r0, [r2, #0xa]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805784C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08057850 @ =sub_8057348
	str r0, [r1, #8]
_08057830:
	mov r0, r8
	bl sub_80051E8
_08057836:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057848: .4byte 0x00000201
_0805784C: .4byte gCurTask
_08057850: .4byte sub_8057348
