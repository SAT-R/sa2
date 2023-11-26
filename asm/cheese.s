.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D5548
gUnknown_080D5548:
    .2byte 0x1C7, 0
    .2byte 0x1C8, 0
    .2byte 0x1C9, 0
    .2byte 0x1C7, 0
    .2byte 0x1C8, 0
    .2byte 0x1C9, 0
    .2byte 0x1C9, 1
    .2byte 0x1CA, 0
    .2byte 0x1CB, 0
    .2byte 0x1CC, 0
    .2byte 0x1CC, 1
    .2byte 0x1CD, 0
    .2byte 0x1CE, 0
    .2byte 0x1CF, 0
    .2byte 0x1CF, 1
    .2byte 0x1D0, 0
    .2byte 0x1D1, 0
    .2byte 0x1D6, 0

    .global gUnknown_080D5590
gUnknown_080D5590:
    .incbin "baserom.gba", 0x000D5590, 0x98

    .global gUnknown_080D5628
gUnknown_080D5628:
    .incbin "baserom.gba", 0x000D5628, 0x4C


.text
.syntax unified
.arm

	thumb_func_start sub_801412C
sub_801412C: @ 0x0801412C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x1c
	adds r6, r4, #0
	adds r6, #0x54
	ldrh r0, [r4, #0x10]
	cmp r0, #0x12
	beq _0801417C
	ldr r2, _080141FC @ =gUnknown_080D5548
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r3, [r1]
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r3, r0
	ldr r1, [r4, #0x14]
	cmp r1, r0
	beq _0801417C
	strh r3, [r5, #0xa]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldrh r0, [r5, #0xa]
	ldrb r1, [r1]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_0801417C:
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r2, _08014200 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	movs r2, #0x80
	lsls r2, r2, #3
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080141A2
	movs r2, #0
_080141A2:
	ldrb r0, [r6, #0x10]
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bls _080141B4
	movs r0, #0x80
	lsls r0, r0, #4
	eors r2, r0
_080141B4:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080141C2
	movs r0, #0x80
	lsls r0, r0, #4
	eors r2, r0
_080141C2:
	ldr r0, [r5, #0x10]
	ldr r1, _08014204 @ =0xFFFFF3FF
	ands r0, r1
	orrs r0, r2
	ldr r1, _08014208 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r1, [r6, #0x14]
	ldr r1, [r1, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #6
	ands r1, r2
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	ldrh r1, [r4, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080141F4
	adds r0, r5, #0
	bl DisplaySprite
_080141F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080141FC: .4byte gUnknown_080D5548
_08014200: .4byte gCamera
_08014204: .4byte 0xFFFFF3FF
_08014208: .4byte 0xFFFFCFFF

	thumb_func_start sub_801420C
sub_801420C: @ 0x0801420C
	push {r4, r5, r6, lr}
	ldr r6, _08014258 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x18
	movs r3, #0
	bl sub_8014EFC
	ldr r1, [r4, #0x14]
	ldrh r0, [r1, #0xa]
	cmp r0, #0x79
	bne _08014260
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r4, [r0]
	cmp r4, #0
	bne _08014260
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8014EFC
	strb r4, [r5, #0xa]
	ldr r1, [r6]
	ldr r0, _0801425C @ =sub_80142AC
	b _08014264
	.align 2, 0
_08014258: .4byte gCurTask
_0801425C: .4byte sub_80142AC
_08014260:
	ldr r1, [r6]
	ldr r0, _0801429C @ =sub_8014350
_08014264:
	str r0, [r1, #8]
	adds r0, r5, #0
	bl sub_801412C
	ldr r0, _080142A0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0801428C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014288
	ldr r0, _080142A4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801428C
_08014288:
	cmp r1, #0x1d
	bne _08014294
_0801428C:
	ldr r0, _080142A8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801429C @ =sub_8014350
	str r0, [r1, #8]
_08014294:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801429C: .4byte sub_8014350
_080142A0: .4byte gCurrentLevel
_080142A4: .4byte gUnknown_030054B0
_080142A8: .4byte gCurTask

	thumb_func_start sub_80142AC
sub_80142AC: @ 0x080142AC
	push {r4, r5, r6, lr}
	ldr r6, _080142F8 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8014EFC
	ldrh r1, [r4, #0xc]
	ldr r0, _080142FC @ =0x0000FFFE
	ands r0, r1
	strh r0, [r4, #0xc]
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0x14]
	cmp r0, #0xb6
	bls _080142E4
	movs r0, #1
	strb r0, [r4, #0xa]
_080142E4:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _08014300
	ldr r0, [r5, #0x14]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801431C
	b _08014308
	.align 2, 0
_080142F8: .4byte gCurTask
_080142FC: .4byte 0x0000FFFE
_08014300:
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0xa]
	cmp r0, #0x79
	beq _0801431C
_08014308:
	movs r1, #0x20
	rsbs r1, r1, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_8014EFC
	ldr r1, [r6]
	ldr r0, _08014334 @ =sub_8014350
	str r0, [r1, #8]
_0801431C:
	movs r0, #0xf
	strh r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _08014338
	ldrh r0, [r4, #0xc]
	movs r1, #2
	orrs r0, r1
	b _0801433E
	.align 2, 0
_08014334: .4byte sub_8014350
_08014338:
	ldrh r1, [r4, #0xc]
	ldr r0, _0801434C @ =0x0000FFFD
	ands r0, r1
_0801433E:
	strh r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801434C: .4byte 0x0000FFFD

	thumb_func_start sub_8014350
sub_8014350: @ 0x08014350
	push {r4, r5, lr}
	ldr r0, _08014380 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08014384
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl sub_8014EFC
	b _080144BE
	.align 2, 0
_08014380: .4byte gCurTask
_08014384:
	adds r0, r4, #0
	bl sub_8014CC8
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080143AA
	ldr r2, _080143C0 @ =gUnknown_080D5590
	ldr r1, _080143C4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_080143AA:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _080143C8
	ldrh r1, [r4, #0xc]
	movs r0, #2
	orrs r0, r1
	b _080143CE
	.align 2, 0
_080143C0: .4byte gUnknown_080D5590
_080143C4: .4byte gUnknown_080D5628
_080143C8:
	ldrh r1, [r4, #0xc]
	ldr r0, _080143E4 @ =0x0000FFFD
	ands r0, r1
_080143CE:
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	subs r0, #2
	cmp r0, #0xd
	bhi _080144B8
	lsls r0, r0, #2
	ldr r1, _080143E8 @ =_080143EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080143E4: .4byte 0x0000FFFD
_080143E8: .4byte _080143EC
_080143EC: @ jump table
	.4byte _08014484 @ case 0
	.4byte _080144B8 @ case 1
	.4byte _08014468 @ case 2
	.4byte _080144B8 @ case 3
	.4byte _080144B8 @ case 4
	.4byte _080144B8 @ case 5
	.4byte _080144B8 @ case 6
	.4byte _080144A8 @ case 7
	.4byte _080144B8 @ case 8
	.4byte _08014424 @ case 9
	.4byte _08014434 @ case 10
	.4byte _08014448 @ case 11
	.4byte _080144B8 @ case 12
	.4byte _08014494 @ case 13
_08014424:
	ldr r0, _0801442C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014430 @ =sub_8015378
	b _080144B6
	.align 2, 0
_0801442C: .4byte gCurTask
_08014430: .4byte sub_8015378
_08014434:
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _08014440 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014444 @ =sub_8015464
	b _080144B6
	.align 2, 0
_08014440: .4byte gCurTask
_08014444: .4byte sub_8015464
_08014448:
	movs r2, #0
	strb r2, [r4, #0xa]
	ldr r0, _08014460 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014464 @ =sub_80154B0
	str r0, [r1, #8]
	strh r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	b _080144BE
	.align 2, 0
_08014460: .4byte gCurTask
_08014464: .4byte sub_80154B0
_08014468:
	movs r0, #0
	strb r0, [r4, #0xa]
	movs r0, #0xe4
	bl m4aSongNumStart
	ldr r0, _0801447C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014480 @ =sub_8014A68
	b _080144B6
	.align 2, 0
_0801447C: .4byte gCurTask
_08014480: .4byte sub_8014A68
_08014484:
	ldr r0, _0801448C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014490 @ =sub_80145D8
	b _080144B6
	.align 2, 0
_0801448C: .4byte gCurTask
_08014490: .4byte sub_80145D8
_08014494:
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r0, _080144A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080144A4 @ =sub_80142AC
	b _080144B6
	.align 2, 0
_080144A0: .4byte gCurTask
_080144A4: .4byte sub_80142AC
_080144A8:
	movs r1, #0
	movs r0, #9
	strh r0, [r4, #0x10]
	strb r1, [r4, #0xa]
	ldr r0, _080144C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080144C8 @ =sub_80144CC
_080144B6:
	str r0, [r1, #8]
_080144B8:
	adds r0, r4, #0
	bl sub_801412C
_080144BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080144C4: .4byte gCurTask
_080144C8: .4byte sub_80144CC

	thumb_func_start sub_80144CC
sub_80144CC: @ 0x080144CC
	push {r4, r5, r6, lr}
	ldr r0, _080144FC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08014500
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl sub_8014EFC
	b _080145C2
	.align 2, 0
_080144FC: .4byte gCurTask
_08014500:
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0x14]
	cmp r0, #0xaf
	bls _0801458C
	movs r6, #0
	movs r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0x14]
	cmp r0, #0xff
	bls _0801453C
	adds r0, r4, #0
	movs r1, #0x1c
	movs r2, #4
	movs r3, #4
	bl sub_8014EFC
	ldr r0, [r5, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014530
	ldrh r0, [r4, #0xc]
	b _08014568
_08014530:
	ldrh r1, [r4, #0xc]
	ldr r0, _08014538 @ =0x0000FFFE
	ands r0, r1
	b _0801456A
	.align 2, 0
_08014538: .4byte 0x0000FFFE
_0801453C:
	cmp r0, #0xbf
	bls _0801456C
	movs r1, #0x1c
	rsbs r1, r1, #0
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl sub_8014EFC
	ldr r0, [r5, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014564
	ldrh r1, [r4, #0xc]
	ldr r0, _08014560 @ =0x0000FFFE
	ands r0, r1
	b _0801456A
	.align 2, 0
_08014560: .4byte 0x0000FFFE
_08014564:
	ldrh r0, [r4, #0xc]
	movs r1, #1
_08014568:
	orrs r0, r1
_0801456A:
	strh r0, [r4, #0xc]
_0801456C:
	ldrb r0, [r4, #0xa]
	adds r0, #2
	strb r0, [r4, #0xa]
	ldr r1, _08014588 @ =gSineTable
	ldrb r0, [r4, #0xa]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	b _08014590
	.align 2, 0
_08014588: .4byte gSineTable
_0801458C:
	movs r0, #9
	strh r0, [r4, #0x10]
_08014590:
	movs r1, #0xa
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080145B0
	ldr r2, _080145C8 @ =gUnknown_080D5590
	ldr r1, _080145CC @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
_080145B0:
	cmp r1, #9
	beq _080145BC
	ldr r0, _080145D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080145D4 @ =sub_8014350
	str r0, [r1, #8]
_080145BC:
	adds r0, r4, #0
	bl sub_801412C
_080145C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080145C8: .4byte gUnknown_080D5590
_080145CC: .4byte gUnknown_080D5628
_080145D0: .4byte gCurTask
_080145D4: .4byte sub_8014350

	thumb_func_start sub_80145D8
sub_80145D8: @ 0x080145D8
	push {r4, r5, r6, lr}
	ldr r5, _08014620 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	movs r6, #0
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r2, _08014624 @ =gUnknown_03005498
	ldr r1, [r2]
	ldr r0, _08014628 @ =0x00009C3F
	cmp r1, r0
	bgt _08014630
	ldr r0, [r2, #4]
	str r0, [r4, #0x18]
	ldr r1, [r2, #4]
	movs r0, #1
	strb r0, [r1, #0x15]
	strb r6, [r4, #0xa]
	movs r0, #0xe5
	bl m4aSongNumStart
	ldr r1, [r5]
	ldr r0, _0801462C @ =sub_801464C
	str r0, [r1, #8]
	ldrh r0, [r4, #0xc]
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r4, #0xc]
	b _08014638
	.align 2, 0
_08014620: .4byte gCurTask
_08014624: .4byte gUnknown_03005498
_08014628: .4byte 0x00009C3F
_0801462C: .4byte sub_801464C
_08014630:
	strb r6, [r4, #0xa]
	ldr r1, [r5]
	ldr r0, _08014648 @ =sub_80149EC
	str r0, [r1, #8]
_08014638:
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014648: .4byte sub_80149EC

	thumb_func_start sub_801464C
sub_801464C: @ 0x0801464C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08014704 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4, #0x18]
	mov r8, r0
	ldr r2, _08014708 @ =IWRAM_START + 0x54
	adds r7, r1, r2
	movs r3, #3
	mov sb, r3
	movs r0, #0xc
	mov ip, r0
	movs r5, #0
	movs r6, #0
	ldr r0, _0801470C @ =gCurrentLevel
	ldrb r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, #2
	beq _08014694
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014690
	ldr r0, _08014710 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014694
_08014690:
	cmp r1, #0x1d
	bne _080146A2
_08014694:
	adds r0, r4, #0
	bl sub_80155D0
	movs r1, #2
	mov sb, r1
	movs r2, #0x20
	mov ip, r2
_080146A2:
	ldrh r2, [r4, #0xc]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080146C2
	ldr r0, [r7, #0x14]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x69
	beq _080146C2
	cmp r1, #0x6d
	beq _080146C2
	cmp r1, #0x71
	beq _080146C2
	ldr r0, _08014714 @ =0x0000FFEF
	ands r0, r2
	strh r0, [r4, #0xc]
_080146C2:
	movs r0, #5
	strh r0, [r4, #0x10]
	ldrb r1, [r4, #0xa]
	cmp r1, #0
	beq _080146D4
	movs r0, #6
	strh r0, [r4, #0x10]
	adds r0, r1, #1
	strb r0, [r4, #0xa]
_080146D4:
	ldrb r0, [r4, #0xa]
	cmp r0, #8
	bls _080146EA
	movs r0, #0
	strb r0, [r4, #0xa]
	movs r0, #0
	strh r0, [r4, #0xe]
	ldr r0, _08014704 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014718 @ =sub_80148B8
	str r0, [r1, #8]
_080146EA:
	mov r0, r8
	ldrh r3, [r0, #0x16]
	ldr r0, [r4]
	asrs r2, r0, #8
	subs r1, r3, r2
	adds r7, r0, #0
	cmp r1, #0
	blt _0801471C
	cmp r1, ip
	blt _08014724
	ldr r1, [r4, #4]
	b _0801474E
	.align 2, 0
_08014704: .4byte gCurTask
_08014708: .4byte IWRAM_START + 0x54
_0801470C: .4byte gCurrentLevel
_08014710: .4byte gUnknown_030054B0
_08014714: .4byte 0x0000FFEF
_08014718: .4byte sub_80148B8
_0801471C:
	subs r0, r2, r3
	ldr r1, [r4, #4]
	cmp r0, ip
	bge _0801474E
_08014724:
	mov r1, r8
	ldrh r3, [r1, #0x18]
	ldr r1, [r4, #4]
	asrs r0, r1, #8
	adds r0, #4
	subs r2, r3, r0
	cmp r2, #0
	blt _0801473A
	cmp r2, ip
	blt _08014740
	b _0801474E
_0801473A:
	subs r0, r0, r3
	cmp r0, ip
	bge _0801474E
_08014740:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0801474A
	movs r0, #1
	strb r0, [r4, #0xa]
_0801474A:
	movs r0, #6
	strh r0, [r4, #0x10]
_0801474E:
	mov r2, r8
	ldrh r0, [r2, #0x16]
	lsls r0, r0, #8
	subs r3, r0, r7
	subs r2, r7, r0
	cmp r3, #0
	blt _0801475E
	adds r2, r3, #0
_0801475E:
	cmp r0, r7
	ble _08014776
	adds r5, r2, #0
	mov r3, sb
	lsrs r5, r3
	cmp r5, #0
	bne _0801478C
	cmp r2, #0
	beq _0801478C
	movs r5, #0x80
	lsls r5, r5, #2
	b _0801478C
_08014776:
	cmp r0, r7
	bge _0801478C
	adds r0, r2, #0
	mov r3, sb
	lsrs r0, r3
	rsbs r5, r0, #0
	cmp r5, #0
	bne _0801478C
	cmp r2, #0
	beq _0801478C
	ldr r5, _080147B8 @ =0xFFFFFE00
_0801478C:
	mov r2, r8
	ldrh r0, [r2, #0x18]
	subs r0, #4
	lsls r0, r0, #8
	subs r3, r0, r1
	subs r2, r1, r0
	cmp r3, #0
	blt _0801479E
	adds r2, r3, #0
_0801479E:
	cmp r0, r1
	ble _080147BC
	adds r6, r2, #0
	mov r3, sb
	lsrs r6, r3
	cmp r6, #0
	bne _080147D2
	cmp r2, #0
	beq _080147D2
	movs r6, #0x80
	lsls r6, r6, #2
	b _080147D2
	.align 2, 0
_080147B8: .4byte 0xFFFFFE00
_080147BC:
	cmp r0, r1
	bge _080147D2
	adds r0, r2, #0
	mov r3, sb
	lsrs r0, r3
	rsbs r6, r0, #0
	cmp r6, #0
	bne _080147D2
	cmp r2, #0
	beq _080147D2
	ldr r6, _08014820 @ =0xFFFFFE00
_080147D2:
	ldr r0, _08014824 @ =0xFFFFF001
	cmp r5, r0
	blt _080147DE
	ldr r0, _08014828 @ =0x00000FFF
	cmp r5, r0
	ble _080147E0
_080147DE:
	adds r5, r0, #0
_080147E0:
	ldr r0, _08014824 @ =0xFFFFF001
	cmp r6, r0
	blt _080147EC
	ldr r0, _08014828 @ =0x00000FFF
	cmp r6, r0
	ble _080147EE
_080147EC:
	adds r6, r0, #0
_080147EE:
	adds r0, r7, r5
	str r0, [r4]
	adds r0, r1, r6
	str r0, [r4, #4]
	mov r1, r8
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _0801480A
	strb r0, [r4, #0xa]
	strh r0, [r4, #0xe]
	ldr r0, _0801482C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014830 @ =sub_80148B8
	str r0, [r1, #8]
_0801480A:
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014820: .4byte 0xFFFFFE00
_08014824: .4byte 0xFFFFF001
_08014828: .4byte 0x00000FFF
_0801482C: .4byte gCurTask
_08014830: .4byte sub_80148B8

	thumb_func_start sub_8014834
sub_8014834: @ 0x08014834
	push {r4, r5, r6, lr}
	ldr r2, _080148AC @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4, #0x18]
	adds r0, #0x54
	adds r1, r1, r0
	ldrh r3, [r4, #0xc]
	movs r0, #0x10
	ands r0, r3
	adds r6, r2, #0
	cmp r0, #0
	beq _0801486A
	ldr r0, [r1, #0x14]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x69
	beq _0801486A
	cmp r1, #0x6d
	beq _0801486A
	cmp r1, #0x71
	beq _0801486A
	ldr r0, _080148B0 @ =0x0000FFEF
	ands r0, r3
	strh r0, [r4, #0xc]
_0801486A:
	movs r2, #0
	movs r0, #6
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #0xa]
	adds r1, r0, #1
	strb r1, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0801488A
	ldr r0, [r6]
	ldr r1, _080148B4 @ =sub_80148B8
	str r1, [r0, #8]
	strb r2, [r4, #0xa]
	movs r0, #0
	strh r0, [r4, #0xe]
_0801488A:
	ldrb r3, [r5, #0x15]
	cmp r3, #0
	bne _0801489A
	ldr r1, [r6]
	ldr r0, _080148B4 @ =sub_80148B8
	str r0, [r1, #8]
	strb r2, [r4, #0xa]
	strh r3, [r4, #0xe]
_0801489A:
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080148AC: .4byte gCurTask
_080148B0: .4byte 0x0000FFEF
_080148B4: .4byte sub_80148B8

	thumb_func_start sub_80148B8
sub_80148B8: @ 0x080148B8
	push {r4, r5, r6, r7, lr}
	ldr r0, _080149D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	movs r7, #0
	movs r6, #3
	ldr r0, _080149D4 @ =gCurrentLevel
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #2
	beq _080148EE
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080148EA
	ldr r0, _080149D8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080148EE
_080148EA:
	cmp r1, #0x1d
	bne _080148F0
_080148EE:
	movs r6, #1
_080148F0:
	ldrh r1, [r4, #0xc]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08014910
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0xa]
	cmp r0, #0x69
	beq _08014910
	cmp r0, #0x6d
	beq _08014910
	cmp r0, #0x71
	beq _08014910
	ldr r0, _080149DC @ =0x0000FFEF
	ands r0, r1
	strh r0, [r4, #0xc]
_08014910:
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_8014EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08014964
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _0801494A
	ldr r2, _080149E0 @ =gUnknown_080D5590
	ldr r1, _080149E4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_0801494A:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0x3c
	ble _08014964
	ldrh r0, [r4, #0x10]
	cmp r0, #2
	beq _08014964
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r0, _080149D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080149E8 @ =sub_8014350
	str r0, [r1, #8]
_08014964:
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014986
	ldr r2, _080149E0 @ =gUnknown_080D5590
	ldr r1, _080149E4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r7, [r0]
_08014986:
	ldrh r1, [r4, #0xc]
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080149A6
	cmp r7, #2
	bne _0801499A
	movs r0, #8
	strb r0, [r4, #0xa]
_0801499A:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _080149A6
	strh r2, [r4, #0x10]
	subs r0, #1
	strb r0, [r4, #0xa]
_080149A6:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	ble _080149BA
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r0, _080149D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080149E8 @ =sub_8014350
	str r0, [r1, #8]
_080149BA:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080149D0: .4byte gCurTask
_080149D4: .4byte gCurrentLevel
_080149D8: .4byte gUnknown_030054B0
_080149DC: .4byte 0x0000FFEF
_080149E0: .4byte gUnknown_080D5590
_080149E4: .4byte gUnknown_080D5628
_080149E8: .4byte sub_8014350

	thumb_func_start sub_80149EC
sub_80149EC: @ 0x080149EC
	push {r4, r5, lr}
	ldr r5, _08014A58 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r2, r1, r0
	movs r0, #7
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #0xa]
	adds r1, r0, #1
	strb r1, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _08014A3C
	ldr r3, [r2, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014A30
	ldr r2, _08014A5C @ =gUnknown_080D5590
	ldr r1, _08014A60 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_08014A30:
	ldrh r0, [r4, #0x10]
	cmp r0, #7
	beq _08014A3C
	ldr r1, [r5]
	ldr r0, _08014A64 @ =sub_8014350
	str r0, [r1, #8]
_08014A3C:
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	bl sub_8014CC8
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014A58: .4byte gCurTask
_08014A5C: .4byte gUnknown_080D5590
_08014A60: .4byte gUnknown_080D5628
_08014A64: .4byte sub_8014350

	thumb_func_start sub_8014A68
sub_8014A68: @ 0x08014A68
	push {r4, r5, r6, lr}
	ldr r6, _08014AE8 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	ldr r2, _08014AEC @ =gSineTable
	ldrb r3, [r5, #0xa]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	adds r3, #0x10
	strb r3, [r5, #0xa]
	asrs r1, r1, #0x19
	asrs r2, r2, #0x19
	adds r0, r5, #0
	movs r3, #0
	bl sub_8014EFC
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014ACA
	ldr r2, _08014AF0 @ =gUnknown_080D5590
	ldr r1, _08014AF4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_08014ACA:
	ldrh r0, [r5, #0x10]
	cmp r0, #4
	beq _08014ADC
	movs r0, #0xe4
	bl m4aSongNumStop
	ldr r1, [r6]
	ldr r0, _08014AF8 @ =sub_8014350
	str r0, [r1, #8]
_08014ADC:
	adds r0, r5, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014AE8: .4byte gCurTask
_08014AEC: .4byte gSineTable
_08014AF0: .4byte gUnknown_080D5590
_08014AF4: .4byte gUnknown_080D5628
_08014AF8: .4byte sub_8014350

	thumb_func_start sub_8014AFC
sub_8014AFC: @ 0x08014AFC
	push {r4, r5, r6, lr}
	ldr r6, _08014B9C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	ldr r2, _08014BA0 @ =gSineTable
	ldrb r3, [r5, #0xa]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	adds r3, #2
	strb r3, [r5, #0xa]
	asrs r1, r1, #0x19
	asrs r2, r2, #0x1b
	adds r2, #0x30
	adds r0, r5, #0
	movs r3, #0
	bl sub_8014EFC
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014B60
	ldr r2, _08014BA4 @ =gUnknown_080D5590
	ldr r1, _08014BA8 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_08014B60:
	ldrh r0, [r5, #0x10]
	cmp r0, #0xc
	beq _08014B6C
	ldr r1, [r6]
	ldr r0, _08014BAC @ =sub_8014350
	str r0, [r1, #8]
_08014B6C:
	ldrh r4, [r5, #0x30]
	adds r0, r5, #0
	bl sub_801412C
	ldrh r0, [r5, #0x30]
	cmp r0, #0x3f
	bne _08014B84
	cmp r4, #0x3f
	beq _08014B84
	adds r0, r5, #0
	bl sub_8014BB0
_08014B84:
	ldrh r0, [r5, #0x30]
	cmp r0, #0x12
	bne _08014B94
	cmp r4, #0x12
	beq _08014B94
	adds r0, r5, #0
	bl sub_8014BB0
_08014B94:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014B9C: .4byte gCurTask
_08014BA0: .4byte gSineTable
_08014BA4: .4byte gUnknown_080D5590
_08014BA8: .4byte gUnknown_080D5628
_08014BAC: .4byte sub_8014350

@; Player end

	thumb_func_start sub_8014BB0
sub_8014BB0: @ 0x08014BB0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08014BE4 @ =sub_8014C60
	ldr r2, _08014BE8 @ =0x00005040
	ldr r1, _08014BEC @ =sub_8015604
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0x3c
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldrh r0, [r4, #0x30]
	cmp r0, #0x12
	bne _08014BF0
	movs r0, #0x40
	rsbs r0, r0, #0
	b _08014BF2
	.align 2, 0
_08014BE4: .4byte sub_8014C60
_08014BE8: .4byte 0x00005040
_08014BEC: .4byte sub_8015604
_08014BF0:
	movs r0, #0x40
_08014BF2:
	str r0, [r5, #0x30]
	ldr r0, [r4]
	str r0, [r5, #0x34]
	ldr r0, [r4, #4]
	str r0, [r5, #0x38]
	movs r0, #4
	bl VramMalloc
	str r0, [r5, #4]
	movs r4, #0
	movs r3, #0
	ldr r0, _08014C58 @ =0x000001D5
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	strh r3, [r5, #8]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x34]
	asrs r0, r0, #8
	ldr r2, _08014C5C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x38]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014C58: .4byte 0x000001D5
_08014C5C: .4byte gCamera

	thumb_func_start sub_8014C60
sub_8014C60: @ 0x08014C60
	push {r4, lr}
	ldr r3, _08014C88 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x3c
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _08014C8C
	ldr r0, [r3]
	bl TaskDestroy
	b _08014CBC
	.align 2, 0
_08014C88: .4byte gCurTask
_08014C8C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r4, #0x38]
	asrs r0, r0, #8
	ldr r3, _08014CC4 @ =gCamera
	ldr r2, [r3]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_08014CBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014CC4: .4byte gCamera

	thumb_func_start sub_8014CC8
sub_8014CC8: @ 0x08014CC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x54
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _08014D2C @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08014CFC
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014CF8
	ldr r0, _08014D30 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014CFC
_08014CF8:
	cmp r1, #0x1d
	bne _08014D02
_08014CFC:
	adds r0, r4, #0
	bl sub_80155D0
_08014D02:
	ldrb r1, [r7, #0x10]
	adds r0, r1, #0
	adds r0, #0xa0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r2, [r4, #0xc]
	movs r0, #8
	ands r0, r2
	adds r5, r2, #0
	cmp r0, #0
	beq _08014D68
	cmp r1, #0
	bne _08014D34
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r0, r0, r1
	b _08014D40
	.align 2, 0
_08014D2C: .4byte gCurrentLevel
_08014D30: .4byte gUnknown_030054B0
_08014D34:
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x18
	adds r0, r0, r2
_08014D40:
	lsrs r3, r0, #0x18
	ldr r0, [r7, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014D52
	movs r0, #1
	orrs r0, r5
	b _08014D9A
_08014D52:
	ldr r0, _08014D64 @ =0x0000FFFE
	ands r0, r5
	strh r0, [r4, #0xc]
	adds r0, r3, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _08014D9C
	.align 2, 0
_08014D64: .4byte 0x0000FFFE
_08014D68:
	ldr r0, [r7, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014D88
	adds r0, r3, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r7, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	bgt _08014D96
	movs r0, #1
	orrs r0, r2
	b _08014D9A
_08014D88:
	ldrb r0, [r7, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	ble _08014D96
	movs r0, #1
	orrs r0, r2
	b _08014D9A
_08014D96:
	ldr r0, _08014DE4 @ =0x0000FFFE
	ands r0, r2
_08014D9A:
	strh r0, [r4, #0xc]
_08014D9C:
	ldr r1, _08014DE8 @ =gSineTable
	lsls r0, r3, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r2, [r7]
	adds r5, r0, r2
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r1, [r7, #4]
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r4, #8]
	ldr r6, [r4]
	cmp r0, #2
	beq _08014DFC
	subs r0, r2, r6
	subs r1, r6, r2
	cmp r0, #0
	blt _08014DD8
	adds r1, r0, #0
_08014DD8:
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bls _08014DEC
	movs r0, #2
	b _08014DFA
	.align 2, 0
_08014DE4: .4byte 0x0000FFFE
_08014DE8: .4byte gSineTable
_08014DEC:
	movs r0, #0xc0
	lsls r0, r0, #6
	cmp r1, r0
	bls _08014DF8
	movs r0, #3
	b _08014DFA
_08014DF8:
	movs r0, #4
_08014DFA:
	strb r0, [r4, #8]
_08014DFC:
	subs r0, r5, r6
	subs r1, r6, r5
	cmp r0, #0
	blt _08014E06
	adds r1, r0, #0
_08014E06:
	ldr r0, _08014E2C @ =0x000003FF
	cmp r1, r0
	bhi _08014E10
	movs r0, #4
	strb r0, [r4, #8]
_08014E10:
	cmp r5, r6
	ble _08014E34
	ldrb r0, [r4, #8]
	lsrs r1, r0
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08014E4E
	ldrh r1, [r4, #0xc]
	ldr r0, _08014E30 @ =0x0000FFFE
	ands r0, r1
	b _08014E4C
	.align 2, 0
_08014E2C: .4byte 0x000003FF
_08014E30: .4byte 0x0000FFFE
_08014E34:
	cmp r5, r6
	bge _08014E4E
	ldrb r2, [r4, #8]
	lsrs r1, r2
	rsbs r1, r1, #0
	mov r8, r1
	ldr r0, _08014E70 @ =0xFFFFFF00
	cmp r8, r0
	bge _08014E4E
	ldrh r1, [r4, #0xc]
	movs r0, #1
	orrs r0, r1
_08014E4C:
	strh r0, [r4, #0xc]
_08014E4E:
	ldrb r0, [r4, #9]
	ldr r3, [r4, #4]
	cmp r0, #2
	beq _08014E84
	ldr r0, [r7, #4]
	subs r2, r0, r3
	subs r1, r3, r0
	cmp r2, #0
	blt _08014E62
	adds r1, r2, #0
_08014E62:
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bls _08014E74
	movs r0, #2
	b _08014E82
	.align 2, 0
_08014E70: .4byte 0xFFFFFF00
_08014E74:
	movs r0, #0xc0
	lsls r0, r0, #6
	cmp r1, r0
	bls _08014E80
	movs r0, #3
	b _08014E82
_08014E80:
	movs r0, #4
_08014E82:
	strb r0, [r4, #9]
_08014E84:
	mov r1, ip
	subs r0, r1, r3
	subs r1, r3, r1
	cmp r0, #0
	blt _08014E90
	adds r1, r0, #0
_08014E90:
	ldr r0, _08014EA0 @ =0x000003FF
	cmp r1, r0
	bhi _08014EA4
	movs r0, #4
	strb r0, [r4, #9]
	movs r2, #1
	b _08014EA6
	.align 2, 0
_08014EA0: .4byte 0x000003FF
_08014EA4:
	movs r2, #0
_08014EA6:
	cmp ip, r3
	ble _08014EB0
	ldrb r0, [r4, #9]
	lsrs r1, r0
	b _08014EBA
_08014EB0:
	cmp ip, r3
	bge _08014EBC
	ldrb r0, [r4, #9]
	lsrs r1, r0
	rsbs r1, r1, #0
_08014EBA:
	mov sb, r1
_08014EBC:
	ldr r0, _08014EF4 @ =0xFFFFF001
	cmp r8, r0
	blt _08014EC8
	ldr r0, _08014EF8 @ =0x00000FFF
	cmp r8, r0
	ble _08014ECA
_08014EC8:
	mov r8, r0
_08014ECA:
	ldr r0, _08014EF4 @ =0xFFFFF001
	cmp sb, r0
	blt _08014ED6
	ldr r0, _08014EF8 @ =0x00000FFF
	cmp sb, r0
	ble _08014ED8
_08014ED6:
	mov sb, r0
_08014ED8:
	mov r1, r8
	adds r0, r6, r1
	str r0, [r4]
	mov r1, sb
	adds r0, r3, r1
	str r0, [r4, #4]
	adds r0, r2, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014EF4: .4byte 0xFFFFF001
_08014EF8: .4byte 0x00000FFF

	thumb_func_start sub_8014EFC
sub_8014EFC: @ 0x08014EFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r6, r4, #0
	adds r6, #0x54
	movs r7, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, _08014F78 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08014F4A
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014F46
	ldr r0, _08014F7C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014F4A
_08014F46:
	cmp r1, #0x1d
	bne _08014F50
_08014F4A:
	adds r0, r4, #0
	bl sub_80155D0
_08014F50:
	ldrb r1, [r6, #0x10]
	adds r0, r1, #0
	adds r0, #0xa0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r2, [r4, #0xc]
	movs r0, #8
	ands r0, r2
	adds r3, r2, #0
	cmp r0, #0
	beq _08014FB4
	cmp r1, #0
	bne _08014F80
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x18
	adds r0, r0, r2
	b _08014F8C
	.align 2, 0
_08014F78: .4byte gCurrentLevel
_08014F7C: .4byte gUnknown_030054B0
_08014F80:
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r0, r0, r1
_08014F8C:
	lsrs r5, r0, #0x18
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014F9E
	movs r0, #1
	orrs r0, r3
	b _08014FE6
_08014F9E:
	ldr r0, _08014FB0 @ =0x0000FFFE
	ands r0, r3
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08014FE8
	.align 2, 0
_08014FB0: .4byte 0x0000FFFE
_08014FB4:
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014FD4
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	bgt _08014FE2
	movs r0, #1
	orrs r0, r2
	b _08014FE6
_08014FD4:
	ldrb r0, [r6, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	ble _08014FE2
	movs r0, #1
	orrs r0, r2
	b _08014FE6
_08014FE2:
	ldr r0, _0801502C @ =0x0000FFFE
	ands r0, r2
_08014FE6:
	strh r0, [r4, #0xc]
_08014FE8:
	ldr r2, _08015030 @ =gSineTable
	lsls r0, r5, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	ldr r0, [r6]
	adds r3, r1, r0
	lsls r0, r5, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	ldr r0, [r6, #4]
	adds r2, r1, r0
	mov r0, r8
	cmp r0, #0
	bne _08015034
	str r3, [r4]
	str r2, [r4, #4]
	movs r0, #1
	b _080150FE
	.align 2, 0
_0801502C: .4byte 0x0000FFFE
_08015030: .4byte gSineTable
_08015034:
	ldr r0, [r4]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r1, #0
	blt _0801504C
	ldr r0, _08015048 @ =0x000005FF
	cmp r1, r0
	ble _08015056
	ldr r5, [r4, #4]
	b _08015078
	.align 2, 0
_08015048: .4byte 0x000005FF
_0801504C:
	subs r1, r6, r3
	ldr r0, _08015068 @ =0x000005FF
	ldr r5, [r4, #4]
	cmp r1, r0
	bgt _08015078
_08015056:
	ldr r0, [r4, #4]
	subs r1, r2, r0
	adds r5, r0, #0
	cmp r1, #0
	blt _0801506C
	ldr r0, _08015068 @ =0x000005FF
	cmp r1, r0
	ble _08015074
	b _08015078
	.align 2, 0
_08015068: .4byte 0x000005FF
_0801506C:
	subs r1, r5, r2
	ldr r0, _08015098 @ =0x000005FF
	cmp r1, r0
	bgt _08015078
_08015074:
	movs r1, #1
	str r1, [sp, #4]
_08015078:
	subs r1, r3, r6
	subs r0, r6, r3
	cmp r1, #0
	blt _08015082
	adds r0, r1, #0
_08015082:
	cmp r3, r6
	ble _080150A0
	adds r7, r0, #0
	mov r3, r8
	lsrs r7, r3
	cmp r7, #0
	beq _080150B6
	ldrh r1, [r4, #0xc]
	ldr r0, _0801509C @ =0x0000FFFE
	ands r0, r1
	b _080150B4
	.align 2, 0
_08015098: .4byte 0x000005FF
_0801509C: .4byte 0x0000FFFE
_080150A0:
	cmp r3, r6
	bge _080150B6
	mov r1, r8
	lsrs r0, r1
	rsbs r7, r0, #0
	cmp r7, #0
	beq _080150B6
	ldrh r1, [r4, #0xc]
	movs r0, #1
	orrs r0, r1
_080150B4:
	strh r0, [r4, #0xc]
_080150B6:
	subs r1, r2, r5
	subs r0, r5, r2
	cmp r1, #0
	blt _080150C0
	adds r0, r1, #0
_080150C0:
	cmp r2, r5
	ble _080150CA
	mov r2, r8
	lsrs r0, r2
	b _080150D4
_080150CA:
	cmp r2, r5
	bge _080150D6
	mov r3, r8
	lsrs r0, r3
	rsbs r0, r0, #0
_080150D4:
	mov sb, r0
_080150D6:
	ldr r0, _08015110 @ =0xFFFFF001
	cmp r7, r0
	blt _080150E2
	ldr r0, _08015114 @ =0x00000FFF
	cmp r7, r0
	ble _080150E4
_080150E2:
	adds r7, r0, #0
_080150E4:
	ldr r0, _08015110 @ =0xFFFFF001
	cmp sb, r0
	blt _080150F0
	ldr r0, _08015114 @ =0x00000FFF
	cmp sb, r0
	ble _080150F2
_080150F0:
	mov sb, r0
_080150F2:
	adds r0, r6, r7
	str r0, [r4]
	mov r1, sb
	adds r0, r5, r1
	str r0, [r4, #4]
	ldr r0, [sp, #4]
_080150FE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015110: .4byte 0xFFFFF001
_08015114: .4byte 0x00000FFF

	thumb_func_start sub_8015118
sub_8015118: @ 0x08015118
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, _08015154 @ =gGameMode
	ldrb r0, [r0]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08015130
	b _0801527C
_08015130:
	movs r7, #0
	movs r0, #0
	mov ip, r0
	ldr r0, [r5, #0x6c]
	adds r1, r0, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r1, [r5, #0x54]
	asrs r1, r1, #8
	subs r3, r2, r1
	adds r6, r0, #0
	cmp r3, #0
	blt _08015158
	cmp r3, #0x1e
	bgt _0801515E
	b _08015160
	.align 2, 0
_08015154: .4byte gGameMode
_08015158:
	subs r0, r1, r2
	cmp r0, #0x1e
	ble _08015160
_0801515E:
	movs r7, #1
_08015160:
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	subs r1, r2, r0
	cmp r1, #0
	blt _08015178
	cmp r1, #0x1e
	bgt _0801517E
	b _08015180
_08015178:
	subs r0, r0, r2
	cmp r0, #0x1e
	ble _08015180
_0801517E:
	movs r7, #1
_08015180:
	adds r2, r6, #0
	adds r2, #0x50
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x52
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	str r0, [r4, #4]
	ldr r6, _080151C8 @ =gCamera
	ldr r1, [r6]
	ldrh r0, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080151C4
	ldr r1, [r6, #4]
	ldrh r0, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #0xe
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _080151CC
_080151C4:
	movs r0, #1
	b _080152E2
	.align 2, 0
_080151C8: .4byte gCamera
_080151CC:
	movs r1, #0
	movs r2, #1
	strh r2, [r4, #8]
	strh r2, [r4, #0xa]
	ldr r0, [r5, #0x6c]
	str r0, [r4, #0x14]
	str r1, [r4, #0xc]
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080151E8
	str r2, [r4, #0xc]
_080151E8:
	ldr r2, [r5, #0x6c]
	adds r0, r2, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08015204
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4, #0xc]
_08015204:
	ldr r0, _08015254 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08015222
	ldr r0, _08015258 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08015222
	movs r0, #1
	mov ip, r0
_08015222:
	mov r1, ip
	cmp r1, #0
	bne _08015264
	ldrh r0, [r6, #0x38]
	lsrs r2, r0, #2
	strb r2, [r4, #0x10]
	ldr r0, [r5, #0x6c]
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801525C
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _0801524A
	adds r0, r2, #0
	adds r0, #0x80
	mvns r0, r0
	strb r0, [r4, #0x10]
_0801524A:
	ldrh r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	b _08015262
	.align 2, 0
_08015254: .4byte gSelectedCharacter
_08015258: .4byte gPlayer
_0801525C:
	ldrh r1, [r5, #0xc]
	ldr r0, _08015278 @ =0x0000FFF7
	ands r0, r1
_08015262:
	strh r0, [r5, #0xc]
_08015264:
	cmp r7, #0
	beq _080152E0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_8014EFC
	b _080152E0
	.align 2, 0
_08015278: .4byte 0x0000FFF7
_0801527C:
	ldr r2, _080152D0 @ =gPlayer
	ldr r0, [r2, #8]
	str r0, [r5, #0x54]
	ldr r0, [r2, #0xc]
	str r0, [r4, #4]
	ldrh r0, [r2, #0x10]
	movs r3, #0
	strh r0, [r4, #8]
	ldrh r0, [r2, #0x12]
	strh r0, [r4, #0xa]
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [r4, #0x14]
	ldr r1, [r2, #0x20]
	str r1, [r4, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080152E0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080152BA
	strb r3, [r4, #0x10]
_080152BA:
	ldr r0, _080152D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080152D8
	ldrh r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	b _080152DE
	.align 2, 0
_080152D0: .4byte gPlayer
_080152D4: .4byte gUnknown_03005424
_080152D8:
	ldrh r1, [r5, #0xc]
	ldr r0, _080152E8 @ =0x0000FFF7
	ands r0, r1
_080152DE:
	strh r0, [r5, #0xc]
_080152E0:
	movs r0, #0
_080152E2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080152E8: .4byte 0x0000FFF7

	thumb_func_start sub_80152EC
sub_80152EC: @ 0x080152EC
	push {r4, r5, lr}
	ldr r5, _08015348 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x54
	adds r0, r0, r1
	ldr r3, [r0, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08015342
	ldr r2, _0801534C @ =gUnknown_080D5590
	ldr r1, _08015350 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #4
	bne _08015342
	movs r0, #0
	strb r0, [r4, #0xa]
	movs r1, #0
	strh r0, [r4, #0xe]
	ldr r0, _08015354 @ =gUnknown_03005498
	ldr r0, [r0, #4]
	strb r1, [r0, #0x15]
	ldrh r1, [r4, #0xc]
	ldr r0, _08015358 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r4, #0xc]
	movs r0, #0xe4
	bl m4aSongNumStart
	ldr r1, [r5]
	ldr r0, _0801535C @ =sub_8014A68
	str r0, [r1, #8]
_08015342:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015348: .4byte gCurTask
_0801534C: .4byte gUnknown_080D5590
_08015350: .4byte gUnknown_080D5628
_08015354: .4byte gUnknown_03005498
_08015358: .4byte 0x0000FFEF
_0801535C: .4byte sub_8014A68

	thumb_func_start sub_8015360
sub_8015360: @ 0x08015360
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08015374 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_08015374: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8015378
sub_8015378: @ 0x08015378
	push {r4, r5, r6, lr}
	ldr r6, _080153E4 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0xf
	movs r3, #1
	bl sub_8014EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080153AA
	ldr r1, [r6]
	ldr r0, _080153E8 @ =sub_80153F8
	str r0, [r1, #8]
_080153AA:
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080153CA
	ldr r2, _080153EC @ =gUnknown_080D5590
	ldr r1, _080153F0 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_080153CA:
	ldrh r0, [r4, #0x10]
	cmp r0, #0xb
	beq _080153D6
	ldr r1, [r6]
	ldr r0, _080153F4 @ =sub_8014350
	str r0, [r1, #8]
_080153D6:
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080153E4: .4byte gCurTask
_080153E8: .4byte sub_80153F8
_080153EC: .4byte gUnknown_080D5590
_080153F0: .4byte gUnknown_080D5628
_080153F4: .4byte sub_8014350

	thumb_func_start sub_80153F8
sub_80153F8: @ 0x080153F8
	push {r4, r5, r6, lr}
	ldr r6, _08015454 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0xf
	movs r3, #0
	bl sub_8014EFC
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _0801543C
	ldr r2, _08015458 @ =gUnknown_080D5590
	ldr r1, _0801545C @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_0801543C:
	ldrh r0, [r5, #0x10]
	cmp r0, #0xb
	beq _08015448
	ldr r1, [r6]
	ldr r0, _08015460 @ =sub_8014350
	str r0, [r1, #8]
_08015448:
	adds r0, r5, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015454: .4byte gCurTask
_08015458: .4byte gUnknown_080D5590
_0801545C: .4byte gUnknown_080D5628
_08015460: .4byte sub_8014350

	thumb_func_start sub_8015464
sub_8015464: @ 0x08015464
	push {r4, r5, lr}
	ldr r5, _080154A8 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #3
	bl sub_8014EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08015496
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r1, [r5]
	ldr r0, _080154AC @ =sub_8014AFC
	str r0, [r1, #8]
_08015496:
	movs r0, #0
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080154A8: .4byte gCurTask
_080154AC: .4byte sub_8014AFC

	thumb_func_start sub_80154B0
sub_80154B0: @ 0x080154B0
	push {r4, r5, lr}
	ldr r5, _080154F8 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x30
	movs r3, #4
	bl sub_8014EFC
	ldrb r0, [r4, #0xa]
	cmp r0, #0x3c
	bne _080154E0
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r1, [r5]
	ldr r0, _080154FC @ =sub_8015500
	str r0, [r1, #8]
_080154E0:
	ldrb r0, [r4, #0xa]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xa]
	strh r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080154F8: .4byte gCurTask
_080154FC: .4byte sub_8015500

	thumb_func_start sub_8015500
sub_8015500: @ 0x08015500
	push {r4, r5, r6, lr}
	ldr r5, _08015550 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r6, _08015554 @ =gPlayer
	adds r0, r4, #0
	bl sub_8015118
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0
	bl sub_8014EFC
	ldrb r0, [r4, #0xa]
	cmp r0, #8
	bne _08015538
	ldr r1, [r5]
	ldr r0, _08015558 @ =sub_801555C
	str r0, [r1, #8]
	adds r1, r6, #0
	adds r1, #0x6a
	movs r0, #1
	strh r0, [r1]
_08015538:
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	movs r0, #0xd
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015550: .4byte gCurTask
_08015554: .4byte gPlayer
_08015558: .4byte sub_801555C

	thumb_func_start sub_801555C
sub_801555C: @ 0x0801555C
	push {r4, r5, r6, lr}
	ldr r6, _080155C0 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #0
	movs r3, #0
	bl sub_8014EFC
	movs r0, #0xe
	strh r0, [r5, #0x10]
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080155A6
	ldr r2, _080155C4 @ =gUnknown_080D5590
	ldr r1, _080155C8 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_080155A6:
	ldrh r0, [r5, #0x10]
	cmp r0, #0xe
	beq _080155B2
	ldr r1, [r6]
	ldr r0, _080155CC @ =sub_8014350
	str r0, [r1, #8]
_080155B2:
	adds r0, r5, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080155C0: .4byte gCurTask
_080155C4: .4byte gUnknown_080D5590
_080155C8: .4byte gUnknown_080D5628
_080155CC: .4byte sub_8014350

	thumb_func_start sub_80155D0
sub_80155D0: @ 0x080155D0
	push {r4, lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x54
	ldrh r4, [r2, #0xc]
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	bne _080155FC
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	bne _080155FC
	ldr r0, [r2, #0x54]
	str r0, [r2]
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	movs r0, #4
	orrs r0, r4
	strh r0, [r2, #0xc]
_080155FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015604
sub_8015604: @ 0x08015604
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8015618
sub_8015618: @ 0x08015618
	bx lr
	.align 2, 0
