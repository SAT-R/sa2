.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0         @ r7 = unk48
	ldr r0, _0804E1B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804E1BC @ =IWRAM_START + 0x558
	adds r1, r0, r1
	str r1, [sp, #0x10]     @ sp10 = unk558 = &boss->unk558
	ldr r2, _0804E1C0 @ =IWRAM_START + 0x1C
	adds r4, r0, r2         @ r4 = unk1C
	adds r0, r7, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804E1DC
	ldr r0, [r7, #0x30]
	ldr r1, _0804E1C4 @ =0x00000FFF
	ands r0, r1
	str r0, [r7, #0x30]
	ldr r1, _0804E1C8 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r7]
	ldr r0, [r1, #4]
	str r0, [r7, #0x34]
	ldrh r0, [r1, #8]
	movs r2, #0
	strh r0, [r7, #0x2e]
	ldr r3, _0804E1CC @ =gDispCnt
	ldrh r1, [r3]
	ldr r0, _0804E1D0 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0804E1D4 @ =gWinRegs
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r0, _0804E1D8 @ =gBldRegs
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	b sub_804E15C__return
	.align 2, 0
_0804E1B8: .4byte gCurTask
_0804E1BC: .4byte IWRAM_START + 0x558
_0804E1C0: .4byte IWRAM_START + 0x1C
_0804E1C4: .4byte 0x00000FFF
_0804E1C8: .4byte gUnknown_080D8D6C
_0804E1CC: .4byte gDispCnt
_0804E1D0: .4byte 0x0000DFFF
_0804E1D4: .4byte gWinRegs
_0804E1D8: .4byte gBldRegs
_0804E1DC:
	ldr r0, [r7, #0x30]
	lsrs r0, r0, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]     @ sp14 = (unk48->unk30 >> 12);
	cmp r0, #2
	bhi _0804E1EC
	b sub_804E15C__return
_0804E1EC:
	movs r3, #0x20
	ldrsh r0, [r4, r3]      @ r4 = unk1C
	lsls r0, r0, #8         @ r0 = Q(unk1C->unk20)
	ldr r1, [r4, #0x24]
	adds r1, r1, r0
	mov sb, r1              @ sb = sb
	movs r6, #0x22
	ldrsh r0, [r4, r6]
	lsls r0, r0, #8         @ r0 = Q(unk1C->unk22)
	ldr r1, [r4, #0x28]
	adds r1, r1, r0
	mov r8, r1              @ r8 = r8
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r5, r0, r1         @ r5 
	ldr r2, _0804E3F8 @ =0x000003FF
	adds r0, r2, #0
	ands r5, r0
	ldr r3, _0804E3FC @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r5, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r0, [r0, r4]      @ r0 = COS(r5)
	ldr r4, _0804E400 @ =gUnknown_080D89A5
	ldrb r1, [r4]
	muls r0, r1, r0
	asrs r0, r0, #6         @ r0 = (COS(r5) * gUnknown_080D89A5) >> 6
	add sb, r0
	lsls r0, r5, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r1, r0
	asrs r0, r0, #6
	add r8, r0
	adds r5, #0x8c
	ldr r0, _0804E404 @ =0xFFFFFF00
	adds r1, r5, r0
	ldr r0, _0804E3F8 @ =0x000003FF
	ands r1, r0
	adds r2, r1, r2
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r6, #0
	ldrsh r0, [r2, r6]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r0, r0, #2
	add r8, r0
	movs r0, #0
	mov sl, r4              @ sl = r4 = gUnknown_080D89A5
	adds r3, r7, #0
	adds r3, #0x3a
	str r3, [sp, #0x1c]     @ sp1C = unk48->unk3A
	adds r4, r7, #0
	adds r4, #0x42
	str r4, [sp, #0x20]     @ sp20 = unk48->unk42
	mov r6, sp
	adds r6, #0xc
	str r6, [sp, #0x18]
	ldr r1, _0804E3FC @ =gSineTable
	mov ip, r1
_0804E278:
	adds r3, r0, #1
	lsls r0, r3, #1         @ r0 = (i + 1) * 2
	ldr r2, [sp, #0x1c]
	adds r0, r2, r0
	ldrh r0, [r0]           @ r0 = unk48->unk3A[i + 1]
	adds r5, r5, r0         @ r5 += unk48->unk3A[i + 1]
	ldr r4, _0804E3F8 @ =0x000003FF
	ands r5, r4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r5, r6
	lsls r6, r0, #1
	mov r1, ip              @ r1 = ip = gSineTable
	adds r0, r6, r1
	movs r2, #0
	ldrsh r1, [r0, r2]      @ r1 = COS(r5)
	mov r4, sl              @ r4 = sl = gUnknown_080D89A5
	adds r0, r3, r4
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r4, r5, #1
	mov r1, ip
	adds r0, r4, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #6
	add r8, r0
	lsls r3, r3, #0x18
	lsrs r0, r3, #0x18
	cmp r0, #2
	bls _0804E278
	ldr r2, _0804E3FC @ =gSineTable
	adds r0, r6, r2         @ r0 = gSineTable + 
	movs r3, #0
	ldrsh r0, [r0, r3]      @ r0 = COS(r5)
	mov r6, sl              @ r6 = sl = gUnknown_080D89A5
	ldrb r1, [r6, #4]
	muls r0, r1, r0
	asrs r0, r0, #6
	add sb, r0
	adds r0, r4, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #6
	add r8, r0
	ldr r3, [sp, #0x20]
	ldrh r0, [r3]
	adds r5, r5, r0
	ldr r4, _0804E3F8 @ =0x000003FF
	ands r5, r4
	ldr r6, [sp, #0x14]
	cmp r6, #5
	bhi _0804E2EE
	b _0804E43C
_0804E2EE:
	ldr r0, _0804E408 @ =gMPlayTable
	ldr r1, [r0, #0x18]
	ldr r0, _0804E40C @ =gSongTable
	ldr r2, _0804E410 @ =0x00000868
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	beq _0804E30A
	cmp r6, #6
	bne _0804E30A
	ldr r0, _0804E414 @ =0x0000010D
	bl m4aSongNumStart
_0804E30A:
	add r0, sp, #8
	ldr r1, [sp, #0x18]
	bl SuperSonicGetPos
	ldrh r0, [r7, #0x38]        @ r0 = unk48->unk38
	adds r6, r5, r0
	ldr r3, _0804E3F8 @ =0x000003FF
	adds r0, r3, #0
	ands r6, r0
	ldr r0, [sp, #0xc]
	mov r4, r8                  @ r4 = r8 = r8
	subs r0, r0, r4
	lsls r0, r0, #8             @
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	mov r2, sb
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x10
	cmp r6, r0
	bge _0804E350
	subs r0, #0x20
	cmp r6, r0
	ble _0804E350
	bl sub_802BB54
	ldr r0, _0804E418 @ =sub_804F1EC
	ldr r3, [sp, #0x10]
	str r0, [r3]
_0804E350:
	ldr r2, _0804E41C @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0804E420 @ =gWinRegs
	movs r0, #0xa0
	strh r0, [r1]
	movs r0, #0xf0
	strh r0, [r1, #4]
	movs r0, #0x3f
	strh r0, [r1, #8]
	movs r0, #0x15
	strh r0, [r1, #0xa]
	ldr r1, _0804E424 @ =gBldRegs
	ldr r0, _0804E428 @ =0x00003FBF
	strh r0, [r1]
	movs r5, #8
	strh r5, [r1, #2]
	strh r5, [r1, #4]
	ldr r2, _0804E42C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804E430 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0804E434 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #8
	bl Mod
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bge _0804E39A
	rsbs r4, r4, #0
_0804E39A:
	ldr r3, _0804E3FC @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]      @ r1 = COS(r6)
	ldr r0, _0804E400 @ =gUnknown_080D89A5
	ldrb r2, [r0, #5]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r6, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add r8, r0
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x1a
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r4, sb
	asrs r3, r4, #8
	ldr r2, _0804E438 @ =gCamera
	ldr r0, [r2]
	subs r3, r3, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov r4, r8
	asrs r0, r4, #8
	ldr r2, [r2, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x10
	bl sub_802E784
	b sub_804E15C__return
	.align 2, 0
_0804E3F8: .4byte 0x000003FF
_0804E3FC: .4byte gSineTable
_0804E400: .4byte gUnknown_080D89A5
_0804E404: .4byte 0xFFFFFF00
_0804E408: .4byte gMPlayTable
_0804E40C: .4byte gSongTable
_0804E410: .4byte 0x00000868
_0804E414: .4byte 0x0000010D
_0804E418: .4byte sub_804F1EC
_0804E41C: .4byte gDispCnt
_0804E420: .4byte gWinRegs
_0804E424: .4byte gBldRegs
_0804E428: .4byte 0x00003FBF
_0804E42C: .4byte gPseudoRandom
_0804E430: .4byte 0x00196225
_0804E434: .4byte 0x3C6EF35F
_0804E438: .4byte gCamera
_0804E43C:
	movs r0, #8
	add r1, sp, #8
	ldr r2, [sp, #0x18]
	bl sub_802C704
	ldr r0, [sp, #0xc]
	mov r6, r8
	subs r0, r0, r6
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	mov r2, sb
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r7, #0x38]
	adds r0, r5, r0
	ldr r3, _0804E490 @ =0x000003FF
	ands r0, r3
	adds r1, r6, #0
	movs r2, #0xa
	bl sub_808558C
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0804E498
	ldrh r1, [r7, #0x38]
	adds r2, r1, #0
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r2, r0
	bls _0804E494       @ unk48->unk38 > Q(2)
	movs r0, #0xe0
	lsls r0, r0, #2
	cmp r2, r0
	bls _0804E4AA       @ unk48->unk38 > Q(3.5)
	subs r0, r1, #4
	b _0804E4A8
	.align 2, 0
_0804E490: .4byte 0x000003FF
_0804E494:
	subs r0, r1, #4
	b _0804E4A8
_0804E498:
	ldrh r1, [r7, #0x38]
	adds r2, r1, #0
	ldr r0, _0804E4C4 @ =0x000001FF
	cmp r2, r0
	bhi _0804E4A6
	cmp r2, #0x7f
	bhi _0804E4AA
_0804E4A6:
	adds r0, r1, #4
_0804E4A8:
	strh r0, [r7, #0x38]
_0804E4AA:
	ldrh r1, [r7, #0x38]
	ldr r0, _0804E4C8 @ =0x000003FF
	ands r0, r1
	strh r0, [r7, #0x38]
sub_804E15C__return:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E4C4: .4byte 0x000001FF
_0804E4C8: .4byte 0x000003FF

.syntax divided
