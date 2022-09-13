.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xb8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r7, #0
	ldr r0, _0803157C @ =gLoadedSaveGame
	mov r8, r0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _0803146A
	movs r1, #0
_0803146A:
	lsls r0, r1, #0x18
	movs r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0x74]
	cmp r0, #0
	bgt _0803147A
	movs r2, #0
	str r2, [sp, #8]
_0803147A:
	str r7, [sp, #4]
	ldr r0, _08031580 @ =0x040000D4
	add r1, sp, #4
	str r1, [r0]
	ldr r1, _08031584 @ =gMultiSioSend
	str r1, [r0, #4]
	ldr r1, _08031588 @ =0x85000005
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r7, [sp, #4]
	add r2, sp, #4
	str r2, [r0]
	ldr r1, _0803158C @ =gMultiSioRecv
	str r1, [r0, #4]
	ldr r1, _08031590 @ =0x85000014
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _08031594 @ =gUnknown_030054D4
	strb r7, [r0, #3]
	strb r7, [r0, #2]
	strb r7, [r0, #1]
	strb r7, [r0]
	movs r0, #3
	bl m4aSongNumStart
	ldr r1, _08031598 @ =gDispCnt
	movs r2, #0xba
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0803159C @ =gBgCntRegs
	movs r4, #0
	ldr r0, _080315A0 @ =0x00001507
	strh r0, [r1, #4]
	ldr r0, _080315A4 @ =0x0000160E
	strh r0, [r1, #2]
	ldr r0, _080315A8 @ =0x00001403
	strh r0, [r1]
	ldr r0, _080315AC @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	ldr r0, _080315B0 @ =Task_FadeInAndStartRollInAnim
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x82
	lsls r2, r2, #7
	ldr r3, _080315B4 @ =CharacterSelectScreenOnDestroy
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov sl, r0
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0, #0x13]
	ldr r2, _080315B8 @ =IWRAM_START + 0x3CA
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _080315BC @ =IWRAM_START + 0x3C1
	adds r0, r3, r1
	strb r5, [r0]
	subs r2, #6
	adds r1, r3, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _080315C0 @ =IWRAM_START + 0x3C5
	adds r0, r3, r1
	strb r4, [r0]
	adds r2, #2
	adds r0, r3, r2
	strb r4, [r0]
	adds r1, #2
	adds r0, r3, r1
	strb r4, [r0]
	adds r2, #0xe
	adds r0, r3, r2
	str r7, [r0]
	adds r1, #7
	adds r0, r3, r1
	movs r1, #0xa6
	strh r1, [r0]
	subs r2, #4
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080315C4 @ =IWRAM_START + 0x3C8
	adds r0, r3, r1
	strb r4, [r0]
	adds r2, #0xc
	adds r0, r3, r2
	str r7, [r0]
	adds r1, #1
	adds r0, r3, r1
	strb r4, [r0]
	subs r2, #0x11
	adds r0, r3, r2
	strb r4, [r0]
	mov r0, sb
	cmp r0, #0
	beq _080315D4
	adds r1, #0xf
	adds r2, r3, r1
	movs r0, #0x66
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, #0xa2
	subs r0, r0, r1
	ldr r1, _080315C8 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #8
	adds r0, #2
	str r0, [r2]
	ldr r2, _080315CC @ =IWRAM_START + 0x3C3
	adds r1, r3, r2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080315D0 @ =IWRAM_START + 0x3C0
	adds r1, r3, r0
	strb r5, [r1]
	cmp r5, #4
	bls _08031602
	movs r0, #4
	b _08031600
	.align 2, 0
_0803157C: .4byte gLoadedSaveGame
_08031580: .4byte 0x040000D4
_08031584: .4byte gMultiSioSend
_08031588: .4byte 0x85000005
_0803158C: .4byte gMultiSioRecv
_08031590: .4byte 0x85000014
_08031594: .4byte gUnknown_030054D4
_08031598: .4byte gDispCnt
_0803159C: .4byte gBgCntRegs
_080315A0: .4byte 0x00001507
_080315A4: .4byte 0x0000160E
_080315A8: .4byte 0x00001403
_080315AC: .4byte gBgScrollRegs
_080315B0: .4byte Task_FadeInAndStartRollInAnim
_080315B4: .4byte CharacterSelectScreenOnDestroy
_080315B8: .4byte IWRAM_START + 0x3CA
_080315BC: .4byte IWRAM_START + 0x3C1
_080315C0: .4byte IWRAM_START + 0x3C5
_080315C4: .4byte IWRAM_START + 0x3C8
_080315C8: .4byte 0x000003FF
_080315CC: .4byte IWRAM_START + 0x3C3
_080315D0: .4byte IWRAM_START + 0x3C0
_080315D4:
	ldr r1, _080319B8 @ =IWRAM_START + 0x3D8
	adds r2, r3, r1
	movs r0, #0x66
	adds r1, r6, #0
	muls r1, r0, r1
	movs r0, #0xb7
	lsls r0, r0, #1
	subs r0, r0, r1
	ldr r1, _080319BC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #8
	adds r0, #4
	str r0, [r2]
	ldr r2, _080319C0 @ =IWRAM_START + 0x3C3
	adds r0, r3, r2
	strb r4, [r0]
	ldr r0, _080319C4 @ =IWRAM_START + 0x3C0
	adds r1, r3, r0
	strb r6, [r1]
	cmp r6, #3
	bls _08031602
	movs r0, #3
_08031600:
	strb r0, [r1]
_08031602:
	movs r7, #0
	movs r4, #0
	mov r1, sl
	strh r4, [r1]
	strh r4, [r1, #4]
	movs r2, #2
	mov r8, r2
	mov r0, r8
	strh r0, [r1, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r1, #6]
	movs r0, #0xff
	strh r0, [r1, #8]
	strh r4, [r1, #0xa]
	mov r0, sl
	bl sub_802D4CC
	mov r1, sl
	adds r1, #0x8c
	ldr r0, _080319C8 @ =0x0600C000
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _080319CC @ =0x0600B000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0x63
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x1e
	strh r0, [r1, #0x26]
	movs r0, #0x14
	strh r0, [r1, #0x28]
	mov r0, sl
	adds r0, #0xb6
	strb r7, [r0]
	movs r0, #1
	strh r0, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	mov r1, sl
	adds r1, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _080319D0 @ =0x0600A000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	ldr r0, _080319D4 @ =0x00000175
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r5, #0x20
	strh r5, [r1, #0x26]
	strh r5, [r1, #0x28]
	mov r0, sl
	adds r0, #0x36
	strb r7, [r0]
	strh r4, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	mov r1, sl
	adds r1, #0x4c
	ldr r0, _080319D8 @ =0x06004000
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _080319DC @ =0x0600A800
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0xbb
	lsls r0, r0, #1
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	strh r5, [r1, #0x26]
	strh r5, [r1, #0x28]
	mov r0, sl
	adds r0, #0x76
	strb r7, [r0]
	mov r2, r8
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	movs r5, #0
	movs r0, #0xb9
	lsls r0, r0, #2
	add r0, sl
	str r0, [sp, #0x88]
	ldr r1, _080319E0 @ =0x000002E5
	add r1, sl
	str r1, [sp, #0x8c]
	ldr r2, _080319E4 @ =0x000002E6
	add r2, sl
	str r2, [sp, #0x90]
	ldr r0, _080319E8 @ =0x000002E9
	add r0, sl
	str r0, [sp, #0x94]
	ldr r1, [sp, #8]
	lsls r1, r1, #0x18
	str r1, [sp, #0x70]
	movs r2, #0xa6
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x60]
	ldr r0, _080319EC @ =0x0000014D
	add r0, sl
	str r0, [sp, #0x64]
	movs r1, #0xa7
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x68]
	ldr r2, _080319F0 @ =0x00000151
	add r2, sl
	str r2, [sp, #0x6c]
	movs r0, #0xbe
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x78]
	ldr r1, _080319F4 @ =0x0000017D
	add r1, sl
	str r1, [sp, #0x7c]
	movs r2, #0xbf
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x80]
	ldr r0, _080319F8 @ =0x00000181
	add r0, sl
	str r0, [sp, #0x84]
	movs r1, #0xdc
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x98]
	ldr r2, _080319FC @ =0x000001B9
	add r2, sl
	str r2, [sp, #0x9c]
	movs r0, #0xdd
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0xa0]
	ldr r1, _08031A00 @ =0x000001BD
	add r1, sl
	str r1, [sp, #0xa4]
	mov r2, sl
	adds r2, #0xcc
	str r2, [sp, #0x20]
	mov r0, sl
	adds r0, #0xec
	str r0, [sp, #0x24]
	mov r1, sl
	adds r1, #0xed
	str r1, [sp, #0x28]
	adds r2, #0x22
	str r2, [sp, #0x2c]
	adds r0, #5
	str r0, [sp, #0x30]
	movs r1, #0xc8
	lsls r1, r1, #2
	add r1, sl
	str r1, [sp, #0xa8]
	ldr r2, _08031A04 @ =0x00000321
	add r2, sl
	str r2, [sp, #0xac]
	ldr r0, _08031A08 @ =0x00000322
	add r0, sl
	str r0, [sp, #0xb0]
	ldr r1, _08031A0C @ =0x00000325
	add r1, sl
	str r1, [sp, #0xb4]
	movs r2, #0xd4
	lsls r2, r2, #2
	add r2, sl
	str r2, [sp, #0x10]
	ldr r0, _08031A10 @ =0x00000351
	add r0, sl
	str r0, [sp, #0x14]
	ldr r1, _08031A14 @ =0x00000352
	add r1, sl
	str r1, [sp, #0x18]
	ldr r2, _08031A18 @ =0x00000355
	add r2, sl
	str r2, [sp, #0x1c]
	movs r0, #0xe0
	lsls r0, r0, #2
	add r0, sl
	str r0, [sp, #0x34]
	ldr r1, _08031A1C @ =0x00000381
	add r1, sl
	str r1, [sp, #0x38]
	ldr r2, _08031A20 @ =0x00000382
	add r2, sl
	str r2, [sp, #0x3c]
	ldr r0, _08031A24 @ =0x00000385
	add r0, sl
	str r0, [sp, #0x40]
	movs r1, #0xec
	lsls r1, r1, #2
	add r1, sl
	str r1, [sp, #0x50]
	ldr r2, _08031A28 @ =0x000003B1
	add r2, sl
	str r2, [sp, #0x54]
	ldr r0, _08031A2C @ =0x000003B2
	add r0, sl
	str r0, [sp, #0x58]
	ldr r1, _08031A30 @ =0x000003B5
	add r1, sl
	str r1, [sp, #0x5c]
	mov r2, sl
	adds r2, #0xfc
	str r2, [sp, #0x44]
	movs r0, #0x8e
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x48]
	ldr r1, _08031A34 @ =0x0000011D
	add r1, sl
	str r1, [sp, #0x4c]
	movs r2, #0
	mov sb, r2
	ldr r0, _08031A38 @ =0x000002E1
	mov r8, r0
_080317D8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r2, sl
	adds r7, r2, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #4]
	mov r0, r8
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r2, #1
	rsbs r2, r2, #0
	adds r6, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	mov r2, sb
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080317D8
	movs r7, #0xb1
	lsls r7, r7, #2
	add r7, sl
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08031A38 @ =0x000002E1
	strh r0, [r7, #0xa]
	movs r0, #5
	ldr r1, [sp, #0x88]
	strb r0, [r1]
	movs r0, #0xc0
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, [sp, #0x8c]
	ldrb r0, [r2]
	orrs r0, r6
	strb r0, [r2]
	movs r1, #0x10
	ldr r0, [sp, #0x90]
	strb r1, [r0]
	ldr r2, [sp, #0x94]
	strb r5, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x24
	bl VramMalloc
	str r0, [r7, #4]
	ldr r3, _08031A3C @ =sCharacterNameSubTextAssets
	movs r1, #0xf0
	lsls r1, r1, #2
	add r1, sl
	str r1, [sp, #0xc]
	ldrb r0, [r1]
	ldr r1, [sp, #0x70]
	asrs r2, r1, #0x18
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, [sp, #0x60]
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x64]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x68]
	strb r0, [r2]
	ldr r1, [sp, #0x6c]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0xae
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _08031A40 @ =sCharacterTitleLeftSideAssets
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x78]
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x7c]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x80]
	strb r0, [r2]
	ldr r1, [sp, #0x84]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0xcc
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _08031A44 @ =sCharacteTitleRightSideAssets
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x98]
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x9c]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0xa0]
	strb r0, [r2]
	ldr r1, [sp, #0xa4]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x20]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x36
	b _08031A48
	.align 2, 0
_080319B8: .4byte IWRAM_START + 0x3D8
_080319BC: .4byte 0x000003FF
_080319C0: .4byte IWRAM_START + 0x3C3
_080319C4: .4byte IWRAM_START + 0x3C0
_080319C8: .4byte 0x0600C000
_080319CC: .4byte 0x0600B000
_080319D0: .4byte 0x0600A000
_080319D4: .4byte 0x00000175
_080319D8: .4byte 0x06004000
_080319DC: .4byte 0x0600A800
_080319E0: .4byte 0x000002E5
_080319E4: .4byte 0x000002E6
_080319E8: .4byte 0x000002E9
_080319EC: .4byte 0x0000014D
_080319F0: .4byte 0x00000151
_080319F4: .4byte 0x0000017D
_080319F8: .4byte 0x00000181
_080319FC: .4byte 0x000001B9
_08031A00: .4byte 0x000001BD
_08031A04: .4byte 0x00000321
_08031A08: .4byte 0x00000322
_08031A0C: .4byte 0x00000325
_08031A10: .4byte 0x00000351
_08031A14: .4byte 0x00000352
_08031A18: .4byte 0x00000355
_08031A1C: .4byte 0x00000381
_08031A20: .4byte 0x00000382
_08031A24: .4byte 0x00000385
_08031A28: .4byte 0x000003B1
_08031A2C: .4byte 0x000003B2
_08031A30: .4byte 0x000003B5
_08031A34: .4byte 0x0000011D
_08031A38: .4byte 0x000002E1
_08031A3C: .4byte sCharacterNameSubTextAssets
_08031A40: .4byte sCharacterTitleLeftSideAssets
_08031A44: .4byte sCharacteTitleRightSideAssets
_08031A48:
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _08031C40 @ =sScreenTitleTextAssets
	ldr r0, [sp, #0x74]
	asrs r2, r0, #0x16
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r1, #2
	adds r2, r2, r1
	ldrh r0, [r2]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x28]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x2c]
	strb r0, [r2]
	ldr r1, [sp, #0x30]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0xc0
	lsls r7, r7, #2
	add r7, sl
	movs r0, #0x11
	mov r8, r0
	mov r1, r8
	strh r1, [r7, #0x16]
	movs r0, #0x12
	strh r0, [r7, #0x18]
	movs r0, #0x18
	bl VramMalloc
	str r0, [r7, #4]
	ldr r2, _08031C44 @ =0x000002E2
	mov sb, r2
	mov r0, sb
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0xa8]
	strb r5, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0xac]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0xb0]
	strb r0, [r2]
	ldr r1, [sp, #0xb4]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0xcc
	lsls r7, r7, #2
	add r7, sl
	mov r0, r8
	strh r0, [r7, #0x16]
	movs r0, #0x8e
	strh r0, [r7, #0x18]
	movs r0, #0x18
	bl VramMalloc
	str r0, [r7, #4]
	mov r1, sb
	strh r1, [r7, #0xa]
	ldr r2, [sp, #0x10]
	strb r5, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	ldr r1, [sp, #0x1c]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0xd8
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r0, _08031C48 @ =0x06010400
	str r0, [r7, #4]
	movs r0, #0xb8
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r0, #0xa
	ldr r1, [sp, #0x34]
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x38]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	ldr r1, [sp, #0x40]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r7, #0xe4
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r0, _08031C4C @ =0x06012580
	str r0, [r7, #4]
	ldr r0, _08031C50 @ =0x000002E6
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x50]
	strb r5, [r0]
	movs r0, #0x40
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x54]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	movs r0, #0x10
	ldr r2, [sp, #0x58]
	strb r0, [r2]
	ldr r1, [sp, #0x5c]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x44]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r0, _08031C54 @ =0x06011000
	str r0, [r7, #4]
	ldr r1, _08031C58 @ =sCharacterSpriteAssets
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, [sp, #0x48]
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x4c]
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r2, #0x10
	strb r2, [r0]
	adds r0, #3
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r5, #0
	ldr r2, _08031C5C @ =gObjPalette
	movs r1, #0
_08031C10:
	adds r0, r5, #0
	adds r0, #0xf0
	lsls r0, r0, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08031C10
	ldr r0, _08031C60 @ =gFlags
	ldr r1, [r0]
	movs r2, #2
	orrs r1, r2
	str r1, [r0]
	add sp, #0xb8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031C40: .4byte sScreenTitleTextAssets
_08031C44: .4byte 0x000002E2
_08031C48: .4byte 0x06010400
_08031C4C: .4byte 0x06012580
_08031C50: .4byte 0x000002E6
_08031C54: .4byte 0x06011000
_08031C58: .4byte sCharacterSpriteAssets
_08031C5C: .4byte gObjPalette
_08031C60: .4byte gFlags

	
.syntax divided
