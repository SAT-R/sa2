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

@; Player end

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
