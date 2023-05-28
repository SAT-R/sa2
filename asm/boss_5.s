.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; Referenced inside gUnknown_080D798C
	thumb_func_start CreateEggSaucer
CreateEggSaucer: @ 0x08042E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	ldr r2, _08042ED0 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08042ED4 @ =gBgCntRegs
	movs r4, #0
	movs r5, #0
	ldr r0, _08042ED8 @ =0x0000560D
	strh r0, [r1]
	ldr r0, _08042EDC @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	ldr r0, _08042EE0 @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _08042EE4 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x40
	strb r0, [r1, #3]
	ldr r2, _08042EE8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _08042EEC @ =gPseudoRandom
	ldr r0, _08042EF0 @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0xfd
	bl m4aSongNumStart
	ldr r1, _08042EF4 @ =gUnknown_03005AF0
	ldr r0, [r1, #0x1c]
	ldr r3, _08042EF8 @ =0xFFFFCFFF
	ands r0, r3
	movs r2, #0x80
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r1, _08042EFC @ =gUnknown_03005AA0
	ldr r0, [r1, #0x1c]
	ands r0, r3
	orrs r0, r2
	str r0, [r1, #0x1c]
	ldr r0, _08042F00 @ =Task_EggSaucerMain
	movs r1, #0x96
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _08042F04 @ =TaskDestructor_EggSaucerMain
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _08042F08 @ =gActiveBossTask
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r4, _08042F0C @ =IWRAM_START + 0x134
	adds r0, r0, r4
	strh r5, [r0]
	strh r5, [r0, #4]
	movs r1, #2
	strh r1, [r0, #2]
	strh r5, [r0, #6]
	ldr r1, _08042F10 @ =0x000030EF
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	ldr r0, _08042F14 @ =gUnknown_030054EC
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042F1C
	ldr r0, _08042F18 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _08042F1C
	movs r0, #6
	mov r6, sl
	strb r0, [r6, #0x10]
	movs r0, #2
	strb r0, [r6, #0x11]
	b _08042F26
	.align 2, 0
_08042ED0: .4byte gDispCnt
_08042ED4: .4byte gBgCntRegs
_08042ED8: .4byte 0x0000560D
_08042EDC: .4byte gBgScrollRegs
_08042EE0: .4byte gUnknown_03004D80
_08042EE4: .4byte gUnknown_03002280
_08042EE8: .4byte gPlayer
_08042EEC: .4byte gPseudoRandom
_08042EF0: .4byte gUnknown_03005590
_08042EF4: .4byte gUnknown_03005AF0
_08042EF8: .4byte 0xFFFFCFFF
_08042EFC: .4byte gUnknown_03005AA0
_08042F00: .4byte Task_EggSaucerMain
_08042F04: .4byte TaskDestructor_EggSaucerMain
_08042F08: .4byte gActiveBossTask
_08042F0C: .4byte IWRAM_START + 0x134
_08042F10: .4byte 0x000030EF
_08042F14: .4byte gUnknown_030054EC
_08042F18: .4byte gGameMode
_08042F1C:
	movs r0, #8
	mov r1, sl
	strb r0, [r1, #0x10]
	movs r0, #4
	strb r0, [r1, #0x11]
_08042F26:
	ldr r1, _08042F54 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _08042F5C
	mov r2, sl
	ldrb r0, [r2, #0x10]
	lsrs r0, r0, #1
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x11]
	lsrs r0, r0, #1
	strb r0, [r2, #0x11]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _08042F5C
	ldr r0, _08042F58 @ =0x005A0400
	str r0, [r2, #4]
	movs r0, #0x8c
	lsls r0, r0, #8
	str r0, [r2, #8]
	b _08042F6A
	.align 2, 0
_08042F54: .4byte gCurrentLevel
_08042F58: .4byte 0x005A0400
_08042F5C:
	movs r0, #0x87
	lsls r0, r0, #0xa
	mov r3, sl
	str r0, [r3, #4]
	movs r0, #0x8c
	lsls r0, r0, #8
	str r0, [r3, #8]
_08042F6A:
	movs r3, #0x98
	lsls r3, r3, #1
	add r3, sl
	movs r2, #0
	movs r1, #0
	movs r0, #0x50
	strh r0, [r3]
	movs r3, #0xa0
	lsls r3, r3, #3
	mov r4, sl
	strh r3, [r4, #0xc]
	strh r1, [r4, #0xe]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x13]
	ldr r0, _0804316C @ =0x00000155
	strh r0, [r4, #0x16]
	strh r1, [r4, #0x18]
	ldr r0, _08043170 @ =0x000002AA
	strh r0, [r4, #0x30]
	subs r0, #0xaa
	strh r0, [r4, #0x1a]
	ldr r0, _08043174 @ =gUnknown_080D7F94
	ldrh r0, [r0, #2]
	lsls r0, r0, #1
	strh r0, [r4, #0x1c]
	strb r2, [r4, #0x1e]
	strh r1, [r4, #0x34]
	mov r0, sl
	adds r0, #0xb6
	strb r2, [r0]
	strh r1, [r4, #0x32]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strb r2, [r4, #0x1f]
	strh r3, [r4, #0x22]
	strh r1, [r4, #0x24]
	str r1, [r4, #0x28]
	str r1, [r4, #0x2c]
	subs r0, #0xa0
	strb r2, [r0]
	strb r2, [r4, #0x14]
	strb r2, [r4, #0x15]
	movs r2, #0
	movs r6, #0xb0
	lsls r6, r6, #1
	add r6, sl
	ldr r0, _08043178 @ =0x00000161
	add r0, sl
	mov r8, r0
	movs r1, #0xb1
	lsls r1, r1, #1
	add r1, sl
	mov sb, r1
	ldr r3, _0804317C @ =0x00000165
	add r3, sl
	str r3, [sp, #0x48]
	movs r4, #0xc8
	lsls r4, r4, #1
	add r4, sl
	str r4, [sp, #0x5c]
	ldr r0, _08043180 @ =0x00000191
	add r0, sl
	str r0, [sp, #0x60]
	movs r1, #0xc9
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0x64]
	ldr r3, _08043184 @ =0x00000195
	add r3, sl
	str r3, [sp, #0x68]
	movs r4, #0x8e
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x38]
	ldr r0, _08043188 @ =0x00000239
	add r0, sl
	str r0, [sp, #0x3c]
	ldr r1, _0804318C @ =0x0000023A
	add r1, sl
	str r1, [sp, #0x40]
	ldr r3, _08043190 @ =0x0000023D
	add r3, sl
	str r3, [sp, #0x44]
	movs r4, #0x80
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x18]
	ldr r0, _08043194 @ =0x00000201
	add r0, sl
	str r0, [sp, #0x1c]
	ldr r1, _08043198 @ =0x00000202
	add r1, sl
	str r1, [sp, #0x20]
	ldr r3, _0804319C @ =0x00000205
	add r3, sl
	str r3, [sp, #0x24]
	movs r4, #0x9f
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x4c]
	ldr r0, _080431A0 @ =0x0000027D
	add r0, sl
	str r0, [sp, #0x50]
	ldr r1, _080431A4 @ =0x0000027E
	add r1, sl
	str r1, [sp, #0x54]
	ldr r3, _080431A8 @ =0x00000281
	add r3, sl
	str r3, [sp, #0x58]
	movs r4, #0xab
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x6c]
	ldr r0, _080431AC @ =0x000002AD
	add r0, sl
	str r0, [sp, #0x70]
	ldr r1, _080431B0 @ =0x000002AE
	add r1, sl
	str r1, [sp, #0x74]
	ldr r3, _080431B4 @ =0x000002B1
	add r3, sl
	str r3, [sp, #0x78]
	movs r4, #0xb9
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #8]
	ldr r0, _080431B8 @ =0x000002E5
	add r0, sl
	str r0, [sp, #0xc]
	ldr r1, _080431BC @ =0x000002E6
	add r1, sl
	str r1, [sp, #0x10]
	ldr r3, _080431C0 @ =0x000002E9
	add r3, sl
	str r3, [sp, #0x14]
	movs r4, #0xc5
	lsls r4, r4, #2
	add r4, sl
	str r4, [sp, #0x28]
	ldr r0, _080431C4 @ =0x00000315
	add r0, sl
	str r0, [sp, #0x2c]
	ldr r1, _080431C8 @ =0x00000316
	add r1, sl
	str r1, [sp, #0x30]
	ldr r3, _080431CC @ =0x00000319
	add r3, sl
	str r3, [sp, #0x34]
	mov r5, sl
	adds r5, #0x36
	movs r3, #0
	mov r4, sl
	adds r4, #0x76
_080430B0:
	lsls r1, r2, #1
	adds r0, r5, r1
	strh r3, [r0]
	adds r1, r4, r1
	strh r3, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1f
	bls _080430B0
	movs r0, #0xea
	bl VramMalloc
	adds r3, r0, #0
	ldr r0, _080431D0 @ =0x000004AC
	add r0, sl
	str r3, [r0]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r3, r3, r4
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r7, #0xa0
	lsls r7, r7, #1
	add r7, sl
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r0, _080431D4 @ =0x0600C000
	str r0, [r7, #4]
	ldr r0, _080431AC @ =0x000002AD
	strh r0, [r7, #0xa]
	strb r5, [r6]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0xff
	mov r6, r8
	strb r0, [r6]
	movs r0, #0x10
	mov r1, sb
	strb r0, [r1]
	ldr r2, [sp, #0x48]
	strb r5, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r0, #0x86
	lsls r0, r0, #0xb
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_80036E0
	adds r0, r7, #0
	bl sub_8003914
	movs r7, #0xd8
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r3, r3, r4
	ldr r2, _080431D8 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _080431E8
	ldr r0, _080431DC @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080431E8
	ldr r0, _080431E0 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _080431E8
	ldr r0, _080431E4 @ =0x0000013B
	strh r0, [r7, #0xa]
	adds r0, #0x95
	add r0, sl
	strb r5, [r0]
	b _080431F6
	.align 2, 0
_0804316C: .4byte 0x00000155
_08043170: .4byte 0x000002AA
_08043174: .4byte gUnknown_080D7F94
_08043178: .4byte 0x00000161
_0804317C: .4byte 0x00000165
_08043180: .4byte 0x00000191
_08043184: .4byte 0x00000195
_08043188: .4byte 0x00000239
_0804318C: .4byte 0x0000023A
_08043190: .4byte 0x0000023D
_08043194: .4byte 0x00000201
_08043198: .4byte 0x00000202
_0804319C: .4byte 0x00000205
_080431A0: .4byte 0x0000027D
_080431A4: .4byte 0x0000027E
_080431A8: .4byte 0x00000281
_080431AC: .4byte 0x000002AD
_080431B0: .4byte 0x000002AE
_080431B4: .4byte 0x000002B1
_080431B8: .4byte 0x000002E5
_080431BC: .4byte 0x000002E6
_080431C0: .4byte 0x000002E9
_080431C4: .4byte 0x00000315
_080431C8: .4byte 0x00000316
_080431CC: .4byte 0x00000319
_080431D0: .4byte 0x000004AC
_080431D4: .4byte 0x0600C000
_080431D8: .4byte gCurrentLevel
_080431DC: .4byte gSelectedCharacter
_080431E0: .4byte gLoadedSaveGame
_080431E4: .4byte 0x0000013B
_080431E8:
	movs r0, #0
	movs r1, #0xab
	lsls r1, r1, #2
	strh r1, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	strb r0, [r1]
_080431F6:
	movs r5, #0
	movs r4, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	mov sb, r0
	str r0, [r7, #0x10]
	movs r7, #0xb8
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	movs r1, #0x90
	lsls r1, r1, #3
	adds r3, r3, r1
	ldr r0, _0804348C @ =0x0000029D
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x5c]
	strb r5, [r2]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r6, #0
	ldr r6, [sp, #0x60]
	strb r0, [r6]
	mov r1, r8
	ldr r0, [sp, #0x64]
	strb r1, [r0]
	ldr r2, [sp, #0x68]
	strb r5, [r2]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_8004558
	movs r7, #0x86
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r3, r3, r1
	ldr r0, _08043490 @ =0x0000029F
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x38]
	strb r5, [r2]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r6, #0
	ldr r6, [sp, #0x3c]
	strb r0, [r6]
	mov r1, r8
	ldr r0, [sp, #0x40]
	strb r1, [r0]
	ldr r2, [sp, #0x44]
	strb r5, [r2]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	movs r7, #0xf0
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r3, r1
	ldr r0, _08043494 @ =0x000002AA
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x18]
	strb r5, [r2]
	movs r0, #0xb8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r6, #0
	ldr r6, [sp, #0x1c]
	strb r0, [r6]
	mov r1, r8
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	ldr r2, [sp, #0x24]
	strb r5, [r2]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	ldr r2, _08043498 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r7, #0x10]
	movs r7, #0x97
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	adds r3, #0x80
	ldr r0, _0804349C @ =0x000002AB
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x4c]
	strb r5, [r0]
	movs r6, #0x98
	lsls r6, r6, #3
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x50]
	strb r0, [r1]
	mov r0, r8
	ldr r2, [sp, #0x54]
	strb r0, [r2]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	movs r7, #0xa3
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	str r3, [r7, #4]
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r3, r3, r1
	ldr r0, _080434A0 @ =0x0000029E
	strh r0, [r7, #0xa]
	ldr r2, [sp, #0x6c]
	strb r5, [r2]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x70]
	strb r0, [r1]
	mov r0, r8
	ldr r2, [sp, #0x74]
	strb r0, [r2]
	ldr r1, [sp, #0x78]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_8004558
	movs r7, #0xb1
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	adds r3, #0x80
	ldr r0, _080434A4 @ =0x000002A9
	strh r0, [r7, #0xa]
	ldr r1, [sp, #8]
	strb r5, [r1]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	mov r0, r8
	ldr r6, [sp, #0x10]
	strb r0, [r6]
	ldr r1, [sp, #0x14]
	strb r5, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r6, sb
	str r6, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x7c]
	bl sub_8004558
	movs r7, #0xbd
	lsls r7, r7, #2
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	ldr r3, [sp, #0x7c]
	str r3, [r7, #4]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x28]
	strb r5, [r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x2c]
	strb r0, [r1]
	mov r3, r8
	ldr r2, [sp, #0x30]
	strb r3, [r2]
	ldr r4, [sp, #0x34]
	strb r5, [r4]
	str r0, [r7, #0x28]
	str r0, [r7, #0x30]
	str r6, [r7, #0x10]
	movs r2, #0
	movs r3, #0
	ldr r4, _080434A8 @ =gUnknown_080D7FB0
_08043414:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	movs r6, #0xcb
	lsls r6, r6, #2
	adds r0, r0, r6
	mov r1, sl
	adds r7, r1, r0
	strh r3, [r7, #0x16]
	strh r3, [r7, #0x18]
	ldr r6, [sp, #4]
	str r6, [r7, #4]
	lsls r1, r2, #3
	adds r1, r1, r4
	ldr r0, [r1]
	lsls r0, r0, #5
	adds r6, r6, r0
	str r6, [sp, #4]
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xb0
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	strh r3, [r7, #8]
	strh r3, [r7, #0x14]
	strh r3, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _08043414
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804348C: .4byte 0x0000029D
_08043490: .4byte 0x0000029F
_08043494: .4byte 0x000002AA
_08043498: .4byte gUnknown_030054B8
_0804349C: .4byte 0x000002AB
_080434A0: .4byte 0x0000029E
_080434A4: .4byte 0x000002A9
_080434A8: .4byte gUnknown_080D7FB0

	thumb_func_start Task_EggSaucerMain
Task_EggSaucerMain: @ 0x080434AC
	push {r4, r5, r6, lr}
	ldr r6, _08043518 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r0, r1
	str r0, [r4, #4]
	adds r0, r4, #0
	bl sub_80444DC
	adds r0, r4, #0
	bl sub_8044784
	ldr r1, _0804351C @ =gUnknown_080D7F98
	ldr r2, _08043520 @ =IWRAM_START + 0xBF
	adds r0, r5, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_80459A0
	adds r0, r4, #0
	bl sub_80454A4
	adds r0, r4, #0
	bl sub_80438C4
	adds r0, r4, #0
	bl sub_8045898
	ldr r0, _08043524 @ =IWRAM_START + 0x130
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08043512
	ldr r1, [r6]
	ldr r0, _08043528 @ =sub_804352C
	str r0, [r1, #8]
_08043512:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043518: .4byte gCurTask
_0804351C: .4byte gUnknown_080D7F98
_08043520: .4byte IWRAM_START + 0xBF
_08043524: .4byte IWRAM_START + 0x130
_08043528: .4byte sub_804352C

	thumb_func_start sub_804352C
sub_804352C: @ 0x0804352C
	push {r4, r5, r6, lr}
	ldr r6, _080435A8 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80444DC
	adds r0, r5, #0
	bl sub_8044784
	ldr r1, _080435AC @ =gUnknown_080D7F98
	ldr r0, _080435B0 @ =IWRAM_START + 0xBF
	adds r4, r4, r0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r5, #0
	bl sub_80459A0
	adds r0, r5, #0
	bl sub_8044088
	adds r0, r5, #0
	bl sub_80454A4
	adds r0, r5, #0
	bl sub_80438C4
	adds r0, r5, #0
	bl sub_8043E2C
	adds r0, r5, #0
	bl sub_8045898
	ldrb r1, [r5, #0x10]
	cmp r1, #0
	bne _080435A2
	ldr r0, _080435B4 @ =gBldRegs
	movs r4, #0
	strh r1, [r0]
	bl sub_802A018
	adds r0, r5, #0
	bl sub_80436E4
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r5, #0xc]
	strb r4, [r5, #0x11]
	ldr r1, [r6]
	ldr r0, _080435B8 @ =sub_80435BC
	str r0, [r1, #8]
_080435A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080435A8: .4byte gCurTask
_080435AC: .4byte gUnknown_080D7F98
_080435B0: .4byte IWRAM_START + 0xBF
_080435B4: .4byte gBldRegs
_080435B8: .4byte sub_80435BC

	thumb_func_start sub_80435BC
sub_80435BC: @ 0x080435BC
	push {r4, r5, lr}
	ldr r0, _08043644 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8044540
	adds r0, r4, #0
	bl sub_8043BEC
	adds r0, r4, #0
	bl sub_8043E2C
	adds r0, r4, #0
	bl sub_8045564
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080435EC
	subs r0, #1
	strb r0, [r4, #0x13]
_080435EC:
	ldr r0, _08043648 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _08043600
	movs r0, #0x90
	bl m4aSongNumStart
_08043600:
	ldr r2, _0804364C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _08043660
	ldr r0, _08043650 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08043660
	ldr r0, _08043654 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _08043660
	ldrb r0, [r4, #0x15]
	ldr r1, _08043658 @ =IWRAM_START + 0xC4
	adds r5, r5, r1
	cmp r0, #0
	bne _080436A0
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, _0804365C @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _080436A0
	movs r0, #1
	strb r0, [r4, #0x15]
	b _080436A0
	.align 2, 0
_08043644: .4byte gCurTask
_08043648: .4byte gUnknown_03005590
_0804364C: .4byte gCurrentLevel
_08043650: .4byte gSelectedCharacter
_08043654: .4byte gLoadedSaveGame
_08043658: .4byte IWRAM_START + 0xC4
_0804365C: .4byte gCamera
_08043660:
	ldrb r0, [r4, #0x15]
	adds r5, r4, #0
	adds r5, #0xc4
	cmp r0, #0
	bne _080436A0
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r2, _080436D8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _080436A0
	movs r0, #1
	strb r0, [r4, #0x15]
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	adds r1, #0xc8
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
_080436A0:
	adds r0, r4, #0
	bl sub_8045898
	ldr r0, [r5]
	asrs r0, r0, #8
	ldr r1, _080436D8 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _080436D2
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080436D2
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x8c
	movs r2, #4
	bl sub_802EF68
	ldr r0, _080436DC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080436E0 @ =sub_804598C
	str r0, [r1, #8]
_080436D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080436D8: .4byte gCamera
_080436DC: .4byte gCurTask
_080436E0: .4byte sub_804598C

	thumb_func_start sub_80436E4
sub_80436E4: @ 0x080436E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov ip, r0
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	mov r2, ip
	adds r2, #0xc4
	ldr r4, _080438A4 @ =gSineTable
	mov r1, ip
	ldrh r0, [r1, #0x16]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r0, r6, r0
	str r0, [r2]
	adds r2, #4
	mov r1, ip
	ldrh r0, [r1, #0x16]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r0, r7, r0
	str r0, [r2]
	mov r1, ip
	adds r1, #0xd4
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080438A8 @ =0x0000FB80
	strh r0, [r1]
	mov r0, ip
	ldrh r2, [r0, #0x30]
	adds r3, r2, r3
	lsls r3, r3, #1
	adds r3, r3, r4
	movs r5, #0
	ldrsh r1, [r3, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r6, r6, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #3
	adds r7, r7, r0
	mov r0, ip
	adds r0, #0xcc
	str r6, [r0]
	adds r0, #4
	str r7, [r0]
	mov r1, ip
	adds r1, #0xd8
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r6, r6, r1
	ldr r2, _080438AC @ =0xFFFFEF00
	adds r7, r7, r2
	movs r3, #0
	mov r8, r3
	mov sb, r3
	movs r5, #0
	movs r0, #0x86
	lsls r0, r0, #1
	add r0, ip
	str r0, [sp]
	subs r1, #0xf2
	add r1, ip
	str r1, [sp, #4]
	mov r2, ip
	adds r2, #0xb6
	str r2, [sp, #8]
	mov r3, ip
	adds r3, #0x36
	str r3, [sp, #0x10]
	mov r0, ip
	adds r0, #0x76
	str r0, [sp, #0xc]
_080437B4:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	subs r1, #1
	adds r4, r5, #1
	lsls r0, r4, #2
	subs r1, r1, r0
	movs r2, #0x1f
	mov sl, r2
	mov r3, sl
	ands r1, r3
	lsls r1, r1, #1
	mov r0, ip
	adds r0, #0x36
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	add r8, r0
	mov r0, ip
	adds r0, #0x76
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #8
	add sb, r0
	lsls r2, r5, #3
	mov r1, ip
	adds r1, #0xdc
	adds r1, r1, r2
	mov r3, r8
	asrs r0, r3, #3
	adds r0, r6, r0
	str r0, [r1]
	mov r1, ip
	adds r1, #0xe0
	adds r1, r1, r2
	mov r2, sb
	asrs r0, r2, #3
	adds r0, r7, r0
	str r0, [r1]
	lsls r2, r5, #2
	ldr r0, [sp]
	adds r3, r0, r2
	ldr r0, _080438B0 @ =gPseudoRandom
	ldr r1, [r0]
	ldr r0, _080438B4 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _080438B8 @ =0x3C6EF35F
	adds r1, r1, r0
	ldr r0, _080438B0 @ =gPseudoRandom
	str r1, [r0]
	movs r0, #0xff
	ands r1, r0
	movs r0, #0xa8
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3]
	ldr r1, [sp, #4]
	adds r2, r1, r2
	lsls r1, r5, #6
	ldr r3, _080438BC @ =0xFFFFFC00
	adds r0, r3, #0
	subs r0, r0, r1
	strh r0, [r2]
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	cmp r5, #5
	bls _080437B4
	ldr r5, [sp, #8]
	ldrb r1, [r5]
	adds r1, #0xe5
	mov r0, sl
	ands r1, r0
	lsls r1, r1, #1
	ldr r2, [sp, #0x10]
	adds r0, r2, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #7
	add r8, r0
	ldr r5, [sp, #0xc]
	adds r1, r5, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #7
	add sb, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	mov r3, r8
	asrs r0, r3, #3
	adds r0, r6, r0
	str r0, [r1]
	movs r1, #0x94
	lsls r1, r1, #1
	add r1, ip
	mov r5, sb
	asrs r0, r5, #3
	adds r0, r7, r0
	str r0, [r1]
	movs r1, #0x96
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1]
	movs r1, #0x97
	lsls r1, r1, #1
	add r1, ip
	ldr r0, _080438C0 @ =0x0000FA40
	strh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080438A4: .4byte gSineTable
_080438A8: .4byte 0x0000FB80
_080438AC: .4byte 0xFFFFEF00
_080438B0: .4byte gPseudoRandom
_080438B4: .4byte 0x00196225
_080438B8: .4byte 0x3C6EF35F
_080438BC: .4byte 0xFFFFFC00
_080438C0: .4byte 0x0000FA40

	thumb_func_start sub_80438C4
sub_80438C4: @ 0x080438C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r2, _08043914 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp]
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	ldr r1, _08043918 @ =gBgScrollRegs
	movs r0, #0x3c
	ldr r2, [sp]
	subs r0, r0, r2
	strh r0, [r1]
	movs r0, #0x36
	ldr r3, [sp, #4]
	subs r0, r0, r3
	strh r0, [r1, #2]
	adds r1, r2, #0
	adds r1, #0x32
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bls _08043924
	ldr r2, _0804391C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08043920 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08043932
	.align 2, 0
_08043914: .4byte gCamera
_08043918: .4byte gBgScrollRegs
_0804391C: .4byte gDispCnt
_08043920: .4byte 0x0000FEFF
_08043924:
	ldr r0, _08043BDC @ =gDispCnt
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r0]
_08043932:
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r5, r6, r0
	ldr r7, _08043BE0 @ =gSineTable
	ldrh r0, [r6, #0x16]
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp]
	adds r0, r3, r0
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r5, r6, r2
	ldrh r0, [r6, #0x16]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r4, [sp]
	adds r0, r4, r0
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x16]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp, #4]
	adds r0, r3, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	beq _08043AAA
	movs r4, #0x86
	lsls r4, r4, #2
	adds r5, r6, r4
	ldrh r0, [r6, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp]
	adds r0, r3, r0
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r5, r6, r2
	movs r3, #0x94
	lsls r3, r3, #2
	adds r4, r6, r3
	ldrh r0, [r6, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp]
	adds r0, r3, r0
	subs r0, #2
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r3, [sp, #4]
	adds r0, r3, r0
	subs r0, #0x13
	strh r0, [r5, #0x18]
	ldr r2, _08043BE4 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x83
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0x10]
	ldrh r0, [r6, #0x1a]
	strh r0, [r4]
	mov r0, r8
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08043BE8 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043AAA
	ldrh r0, [r6, #0x1c]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa
	bhi _08043AAA
	movs r1, #0x97
	lsls r1, r1, #2
	adds r5, r6, r1
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08043AAA:
	movs r2, #0xa3
	lsls r2, r2, #2
	adds r5, r6, r2
	ldr r3, _08043BE0 @ =gSineTable
	ldrh r2, [r6, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r1, [sp]
	adds r1, r1, r0
	str r1, [sp]
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	ldr r4, [sp, #4]
	adds r4, r4, r0
	str r4, [sp, #4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	strh r4, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r2, [sp]
	adds r2, #2
	str r2, [sp]
	ldr r3, [sp, #4]
	subs r3, #0x11
	str r3, [sp, #4]
	movs r7, #0
	movs r3, #0
	movs r4, #0xb1
	lsls r4, r4, #2
	adds r5, r6, r4
	movs r2, #0
	movs r0, #0xb6
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0x36
	adds r1, r1, r6
	mov sb, r1
	movs r4, #0x76
	adds r4, r4, r6
	mov sl, r4
	adds r0, r6, #0
	adds r0, #0xc0
	str r0, [sp, #8]
_08043B20:
	adds r1, r2, #1
	str r1, [sp, #0x10]
	lsls r1, r1, #2
	mov r4, r8
	ldrb r0, [r4]
	subs r0, r0, r1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #1
	mov r4, sb
	adds r4, r4, r0
	mov ip, r4
	movs r1, #0
	ldrsh r4, [r4, r1]
	mov ip, r4
	add r7, ip
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r3, r3, r0
	asrs r0, r7, #3
	ldr r1, [sp]
	adds r0, r1, r0
	strh r0, [r5, #0x16]
	asrs r0, r3, #3
	ldr r4, [sp, #4]
	adds r0, r4, r0
	strh r0, [r5, #0x18]
	movs r0, #0x13
	subs r0, r0, r2
	lsls r0, r0, #6
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	str r3, [sp, #0xc]
	bl sub_80051E8
	ldr r0, [sp, #0x10]
	lsls r4, r0, #0x18
	lsrs r2, r4, #0x18
	ldr r3, [sp, #0xc]
	cmp r2, #5
	bls _08043B20
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r5, r6, r1
	mov r2, r8
	ldrb r1, [r2]
	subs r1, #0x1c
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #1
	mov r2, sb
	adds r0, r2, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r7, r7, r0
	add r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r3, r3, r0
	asrs r0, r7, #3
	ldr r1, [sp]
	adds r4, r1, r0
	strh r4, [r5, #0x16]
	asrs r0, r3, #3
	ldr r2, [sp, #4]
	adds r7, r2, r0
	strh r7, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	cmp r0, #0
	beq _08043BCC
	adds r1, r4, #0
	subs r1, #0x10
	adds r0, r6, #0
	adds r2, r7, #0
	bl sub_8043D94
_08043BCC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043BDC: .4byte gDispCnt
_08043BE0: .4byte gSineTable
_08043BE4: .4byte gUnknown_030054B8
_08043BE8: .4byte gPlayer

	thumb_func_start sub_8043BEC
sub_8043BEC: @ 0x08043BEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, [r7, #4]
	asrs r1, r1, #8
	ldr r3, _08043C2C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	subs r2, r2, r0
	ldr r3, _08043C30 @ =gBgScrollRegs
	movs r0, #0x3c
	subs r0, r0, r1
	strh r0, [r3]
	movs r0, #0x36
	subs r0, r0, r2
	strh r0, [r3, #2]
	adds r1, #0x32
	movs r0, #0xaf
	lsls r0, r0, #1
	cmp r1, r0
	bls _08043C3C
	ldr r2, _08043C34 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08043C38 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08043C4A
	.align 2, 0
_08043C2C: .4byte gCamera
_08043C30: .4byte gBgScrollRegs
_08043C34: .4byte gDispCnt
_08043C38: .4byte 0x0000FEFF
_08043C3C:
	ldr r0, _08043D80 @ =gDispCnt
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
_08043C4A:
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r1, #0xc4
	adds r1, r1, r7
	mov r8, r1
	ldr r0, [r1]
	asrs r0, r0, #8
	ldr r4, _08043D84 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r6, r7, #0
	adds r6, #0xc8
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrb r0, [r7, #0x15]
	cmp r0, #0
	beq _08043CA6
	ldr r2, _08043D88 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _08043CCE
	ldr r0, _08043D8C @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08043CCE
	ldr r0, _08043D90 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _08043CCE
_08043CA6:
	movs r3, #0xd8
	lsls r3, r3, #1
	adds r5, r7, r3
	mov r1, r8
	ldr r0, [r1]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08043CCE:
	movs r3, #0xa3
	lsls r3, r3, #2
	adds r5, r7, r3
	adds r0, r7, #0
	adds r0, #0xcc
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r4, _08043D84 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	adds r0, r7, #0
	adds r0, #0xd0
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb1
	lsls r0, r0, #2
	adds r5, r7, r0
	movs r6, #0
	movs r1, #0xdc
	adds r1, r1, r7
	mov sb, r1
	movs r3, #0xe0
	adds r3, r3, r7
	mov r8, r3
_08043D0C:
	lsls r2, r6, #3
	mov r1, sb
	adds r0, r1, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	add r2, r8
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	movs r0, #0x13
	subs r0, r0, r6
	lsls r0, r0, #6
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08043D0C
	movs r3, #0xbd
	lsls r3, r3, #2
	adds r5, r7, r3
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _08043D84 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	movs r3, #0x94
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043D80: .4byte gDispCnt
_08043D84: .4byte gCamera
_08043D88: .4byte gCurrentLevel
_08043D8C: .4byte gSelectedCharacter
_08043D90: .4byte gLoadedSaveGame

	thumb_func_start sub_8043D94
sub_8043D94: @ 0x08043D94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	mov r1, r8
	adds r1, #0xc0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r2, _08043E28 @ =gSineTable
	ldrb r0, [r1]
	lsls r0, r0, #5
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #0xd
	adds r0, #0x10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r5, #0
	adds r7, r2, #0
_08043DD0:
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	movs r0, #0xcb
	lsls r0, r0, #2
	adds r4, r4, r0
	add r4, r8
	lsls r0, r5, #8
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r7
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	add r0, sl
	strh r0, [r4, #0x16]
	lsls r0, r5, #8
	adds r0, r0, r7
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	add r0, sb
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08043DD0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043E28: .4byte gSineTable

	thumb_func_start sub_8043E2C
sub_8043E2C: @ 0x08043E2C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	ldrb r0, [r7, #0x11]
	cmp r0, #0
	beq _08043E40
	b _08043F9A
_08043E40:
	adds r4, r7, #0
	adds r4, #0x20
	ldrb r3, [r4]
	cmp r3, #0
	beq _08043E4C
	b _08043F9A
_08043E4C:
	ldrh r0, [r7, #0x24]
	adds r0, #0x10
	strh r0, [r7, #0x24]
	movs r1, #0x22
	ldrsh r0, [r7, r1]
	ldr r1, [r7, #0x28]
	adds r1, r1, r0
	str r1, [r7, #0x28]
	movs r0, #0x24
	ldrsh r2, [r7, r0]
	ldr r0, [r7, #0x2c]
	adds r0, r0, r2
	str r0, [r7, #0x2c]
	asrs r5, r1, #8
	asrs r0, r0, #8
	mov sb, r0
	adds r0, #0xa
	str r3, [sp]
	ldr r1, _08043FA8 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08043EA2
	lsls r1, r0, #8
	ldr r0, [r7, #0x2c]
	adds r0, r0, r1
	str r0, [r7, #0x2c]
	movs r2, #0x22
	ldrsh r1, [r7, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r7, #0x22]
	movs r0, #1
	strb r0, [r4]
_08043EA2:
	movs r0, #0x86
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r1, _08043FAC @ =gCamera
	mov r8, r1
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r4, r7, r0
	movs r2, #0x94
	lsls r2, r2, #2
	adds r1, r7, r2
	mov r2, r8
	ldr r0, [r2]
	subs r0, r5, r0
	subs r0, #2
	strh r0, [r4, #0x16]
	ldr r0, [r2, #4]
	mov r2, sb
	subs r0, r2, r0
	subs r0, #0x13
	strh r0, [r4, #0x18]
	ldr r3, _08043FB0 @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x83
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r4, #0x10]
	ldrh r0, [r7, #0x1a]
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r4, #0x18]
	strh r0, [r1, #8]
	adds r0, r4, #0
	bl sub_8004860
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _08043FB4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	bl Mod
	adds r6, r0, #0
	cmp r6, #0
	bne _08043F9A
	ldr r0, _08043FB8 @ =gPseudoRandom
	mov ip, r0
	ldr r0, [r0]
	ldr r4, _08043FBC @ =0x00196225
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, _08043FC0 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, r8
	ldr r1, [r0]
	subs r1, r5, r1
	movs r5, #0xf
	adds r0, r2, #0
	ands r0, r5
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x1c]
	muls r2, r4, r2
	adds r2, r2, r3
	mov r1, r8
	ldr r0, [r1, #4]
	mov r1, sb
	subs r0, r1, r0
	adds r1, r2, #0
	ands r1, r5
	adds r0, r0, r1
	subs r0, #8
	str r0, [sp, #0x20]
	add r0, sp, #8
	strh r6, [r0, #0x1c]
	adds r5, r0, #0
	adds r1, r2, #0
	muls r1, r4, r1
	adds r1, r1, r3
	mov r2, ip
	str r1, [r2]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08043FC4 @ =0x0000041F
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r5, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08043FC8 @ =0x06012980
	str r0, [sp, #8]
	ldr r0, _08043FCC @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #0xc]
	adds r1, r7, #0
	adds r1, #0x14
	bl sub_8039B54
_08043F9A:
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043FA8: .4byte sub_801EE64
_08043FAC: .4byte gCamera
_08043FB0: .4byte gUnknown_030054B8
_08043FB4: .4byte gUnknown_03005590
_08043FB8: .4byte gPseudoRandom
_08043FBC: .4byte 0x00196225
_08043FC0: .4byte 0x3C6EF35F
_08043FC4: .4byte 0x0000041F
_08043FC8: .4byte 0x06012980
_08043FCC: .4byte 0x0000026B

	thumb_func_start sub_8043FD0
sub_8043FD0: @ 0x08043FD0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804406C @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r0, [r0, #4]
	adds r0, r0, r4
	mov r1, ip
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r5
	str r0, [r1, #8]
	ldr r0, [r1, #0x28]
	adds r0, r0, r4
	str r0, [r1, #0x28]
	ldr r0, [r1, #0x2c]
	adds r0, r0, r5
	str r0, [r1, #0x2c]
	ldr r0, _08044070 @ =IWRAM_START + 0xC4
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, _08044074 @ =IWRAM_START + 0xC8
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, _08044078 @ =IWRAM_START + 0xCC
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, _0804407C @ =IWRAM_START + 0xD0
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	movs r3, #0
	ldr r1, _08044080 @ =IWRAM_START + 0xDC
	adds r7, r2, r1
	ldr r0, _08044084 @ =IWRAM_START + 0xE0
	adds r6, r2, r0
_08044030:
	lsls r1, r3, #3
	adds r2, r7, r1
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	adds r1, r6, r1
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08044030
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	movs r1, #0x94
	lsls r1, r1, #1
	add r1, ip
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804406C: .4byte gActiveBossTask
_08044070: .4byte IWRAM_START + 0xC4
_08044074: .4byte IWRAM_START + 0xC8
_08044078: .4byte IWRAM_START + 0xCC
_0804407C: .4byte IWRAM_START + 0xD0
_08044080: .4byte IWRAM_START + 0xDC
_08044084: .4byte IWRAM_START + 0xE0

	thumb_func_start sub_8044088
sub_8044088: @ 0x08044088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r6
	mov r8, r0
	ldr r3, [r6, #4]
	asrs r3, r3, #8
	ldr r4, _0804412C @ =gSineTable
	ldrh r2, [r6, #0x16]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r3, r0
	mov sb, r3
	ldr r3, [r6, #8]
	asrs r3, r3, #8
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r7, r3, r0
	ldr r1, _08044130 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	mov r5, r8
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r4, _08044134 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #2
	bl sub_800CA20
	cmp r0, #1
	bne _080440FE
	adds r0, r6, #0
	bl sub_80452F8
_080440FE:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #1
	bl sub_800C320
	ldrb r0, [r6, #0x13]
	cmp r0, #0
	bne _08044150
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08044138
	adds r0, r6, #0
	bl sub_8045368
	b _08044150
	.align 2, 0
_0804412C: .4byte gSineTable
_08044130: .4byte gCamera
_08044134: .4byte gPlayer
_08044138:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _08044150
	adds r0, r6, #0
	bl sub_80452F8
_08044150:
	mov r1, sb
	lsls r0, r1, #8
	lsls r1, r7, #8
	bl sub_80122DC
	ldrb r4, [r6, #0x13]
	cmp r4, #0
	bne _08044180
	ldr r0, _08044228 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _08044180
	adds r0, r6, #0
	bl sub_8045368
	ldr r0, _0804422C @ =gUnknown_03005498
	ldr r0, [r0, #4]
	strb r4, [r0, #0x15]
_08044180:
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044188
	b _08044372
_08044188:
	ldrb r0, [r6, #0x1f]
	cmp r0, #0
	beq _08044190
	b _08044372
_08044190:
	movs r2, #0x86
	lsls r2, r2, #2
	adds r2, r2, r6
	mov r8, r2
	ldr r3, [r6, #4]
	asrs r3, r3, #8
	ldr r4, _08044230 @ =gSineTable
	ldrh r2, [r6, #0x18]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r2, r5
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r3, r0
	mov sb, r3
	ldr r3, [r6, #8]
	asrs r3, r3, #8
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r7, r3, r0
	ldr r1, _08044234 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	mov r5, r8
	strh r0, [r5, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r5, #0x18]
	ldr r4, _08044228 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	bne _080441F8
	adds r0, r6, #0
	bl sub_80452F8
_080441F8:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C320
	adds r1, r0, #0
	cmp r1, #1
	bne _080442A8
	movs r0, #0x1e
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x11]
	subs r0, #1
	strb r0, [r6, #0x11]
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044238
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804423E
	.align 2, 0
_08044228: .4byte gPlayer
_0804422C: .4byte gUnknown_03005498
_08044230: .4byte gSineTable
_08044234: .4byte gCamera
_08044238:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804423E:
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _080442C0
	ldr r1, _08044294 @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08044298 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	mov sl, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp sl, r1
	beq _080442C0
	ldr r0, _0804429C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080442C0
	mov r5, sl
	subs r0, r5, r1
	lsls r0, r0, #0x10
	ldr r1, _080442A0 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08044288
	movs r0, #0xff
_08044288:
	strb r0, [r1]
	ldr r1, _080442A4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _080442C0
	.align 2, 0
_08044294: .4byte gUnknown_03005450
_08044298: .4byte 0x0000C350
_0804429C: .4byte gGameMode
_080442A0: .4byte gNumLives
_080442A4: .4byte gUnknown_030054A8
_080442A8:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _080442C0
	adds r0, r6, #0
	bl sub_80452F8
_080442C0:
	mov r5, sb
	lsls r0, r5, #8
	lsls r1, r7, #8
	bl sub_80122DC
	ldrb r0, [r6, #0x1f]
	cmp r0, #0
	bne _08044364
	ldr r0, _08044300 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800C418
	adds r1, r0, #0
	cmp r1, #1
	bne _08044364
	movs r0, #0x1e
	strb r0, [r6, #0x1f]
	ldrb r0, [r6, #0x11]
	subs r0, #1
	strb r0, [r6, #0x11]
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044304
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0804430A
	.align 2, 0
_08044300: .4byte gPlayer
_08044304:
	movs r0, #0xeb
	bl m4aSongNumStart
_0804430A:
	ldr r0, _080444B8 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044364
	ldr r1, _080444BC @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _080444C0 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	mov r8, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r8, r1
	beq _08044364
	ldr r0, _080444C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044364
	mov r5, r8
	subs r0, r5, r1
	lsls r0, r0, #0x10
	ldr r1, _080444C8 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0804435C
	movs r0, #0xff
_0804435C:
	strb r0, [r1]
	ldr r1, _080444CC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08044364:
	mov r0, sb
	subs r0, #5
	lsls r0, r0, #8
	str r0, [r6, #0x28]
	adds r0, r7, #1
	lsls r0, r0, #8
	str r0, [r6, #0x2c]
_08044372:
	movs r5, #0xa3
	lsls r5, r5, #2
	adds r5, r5, r6
	mov r8, r5
	ldr r3, [r6, #4]
	asrs r3, r3, #8
	ldr r4, _080444D0 @ =gSineTable
	ldrh r2, [r6, #0x30]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r3, r3, r0
	mov sb, r3
	ldr r3, [r6, #8]
	asrs r3, r3, #8
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r7, r3, r0
	ldr r5, _080444D4 @ =gCamera
	ldr r0, [r5]
	mov r1, sb
	subs r0, r1, r0
	mov r2, r8
	strh r0, [r2, #0x16]
	ldr r0, [r5, #4]
	subs r0, r7, r0
	strh r0, [r2, #0x18]
	ldr r4, _080444D8 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _080443D8
	adds r0, r6, #0
	bl sub_80452F8
_080443D8:
	str r4, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	bne _080443F0
	adds r0, r6, #0
	bl sub_80452F8
_080443F0:
	movs r0, #2
	add sb, r0
	subs r7, #0x11
	movs r2, #0
	mov ip, r5
	movs r1, #0xb6
	adds r1, r1, r6
	mov sl, r1
	adds r3, r6, #0
	adds r3, #0x36
	adds r4, r6, #0
	adds r4, #0x76
	ldrb r5, [r1]
	mov r8, r5
_0804440C:
	adds r2, #1
	lsls r1, r2, #2
	mov r0, r8
	subs r1, r0, r1
	movs r5, #0x1f
	ands r1, r5
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	add sb, r0
	adds r1, r4, r1
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	adds r7, r7, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #5
	bls _0804440C
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r1, r1, r6
	mov r8, r1
	mov r2, sl
	ldrb r1, [r2]
	subs r1, #0x1c
	ands r1, r5
	lsls r1, r1, #1
	adds r0, r3, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	add sb, r0
	adds r1, r4, r1
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r7, r7, r0
	mov r5, ip
	ldr r0, [r5]
	mov r1, sb
	subs r0, r1, r0
	mov r2, r8
	strh r0, [r2, #0x16]
	ldr r0, [r5, #4]
	subs r0, r7, r0
	strh r0, [r2, #0x18]
	ldr r4, _080444D8 @ =gPlayer
	str r4, [sp]
	mov r0, r8
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
	cmp r0, #1
	bne _0804448E
	adds r0, r6, #0
	bl sub_80452F8
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r4, #0x20]
_0804448E:
	ldr r5, _080444D8 @ =gPlayer
	str r5, [sp]
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	cmp r0, #1
	bne _080444A8
	adds r0, r6, #0
	bl sub_80452F8
_080444A8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080444B8: .4byte gUnknown_03005498
_080444BC: .4byte gUnknown_03005450
_080444C0: .4byte 0x0000C350
_080444C4: .4byte gGameMode
_080444C8: .4byte gNumLives
_080444CC: .4byte gUnknown_030054A8
_080444D0: .4byte gSineTable
_080444D4: .4byte gCamera
_080444D8: .4byte gPlayer

	thumb_func_start sub_80444DC
sub_80444DC: @ 0x080444DC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #4]
	adds r1, r1, r0
	str r1, [r4, #4]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	ldr r0, [r4, #8]
	adds r0, r0, r2
	str r0, [r4, #8]
	asrs r1, r1, #8
	asrs r0, r0, #8
	adds r0, #0x32
	movs r2, #0
	str r2, [sp]
	ldr r2, _08044538 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r0, [r4, #0x16]
	adds r0, #2
	ldr r1, _0804453C @ =0x000003FF
	ands r0, r1
	strh r0, [r4, #0x16]
	ldrh r0, [r4, #0x18]
	adds r0, #2
	ands r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x30]
	adds r0, #2
	ands r0, r1
	strh r0, [r4, #0x30]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044538: .4byte sub_801EE64
_0804453C: .4byte 0x000003FF

	thumb_func_start sub_8044540
sub_8044540: @ 0x08044540
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r1, [r6, #0xc]
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	cmp r0, #0
	ble _0804455C
	subs r0, r1, #2
	strh r0, [r6, #0xc]
_0804455C:
	movs r4, #0xc
	ldrsh r0, [r6, r4]
	ldr r1, [r6, #4]
	adds r1, r1, r0
	str r1, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r2
	str r0, [r6, #8]
	asrs r2, r1, #8
	asrs r0, r0, #8
	adds r0, #0x32
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	ldr r4, _0804477C @ =sub_801EE64
	mov r8, r4
	str r4, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	adds r5, r6, #0
	adds r5, #0xd6
	ldrh r0, [r5]
	adds r0, #0x30
	strh r0, [r5]
	adds r2, r6, #0
	adds r2, #0xc4
	adds r7, r6, #0
	adds r7, #0xd4
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0xc8
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08044600
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x18
	strh r0, [r7]
_08044600:
	adds r5, r6, #0
	adds r5, #0xda
	ldrh r0, [r5]
	adds r0, #0x3d
	strh r0, [r5]
	adds r2, r6, #0
	adds r2, #0xcc
	adds r7, r6, #0
	adds r7, #0xd8
	movs r4, #0
	ldrsh r1, [r7, r4]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0xd0
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08044666
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #6
	adds r0, r0, r1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x22
	strh r0, [r7]
_08044666:
	movs r4, #0
	mov r8, r4
	adds r0, r6, #0
	adds r0, #0xdc
	str r0, [sp, #8]
	movs r1, #0xe0
	adds r1, r1, r6
	mov sl, r1
_08044676:
	mov r2, r8
	lsls r1, r2, #2
	movs r4, #0x87
	lsls r4, r4, #1
	adds r0, r6, r4
	adds r5, r0, r1
	ldrh r0, [r5]
	adds r0, #0x38
	strh r0, [r5]
	lsls r3, r2, #3
	ldr r0, [sp, #8]
	adds r2, r0, r3
	subs r4, #2
	adds r0, r6, r4
	adds r7, r0, r1
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r1, sl
	adds r4, r1, r3
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r0, [r2]
	asrs r2, r0, #8
	asrs r0, r1, #8
	movs r1, #0
	str r1, [sp]
	ldr r1, _0804477C @ =sub_801EE64
	mov sb, r1
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _080446EE
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r0, r8
	subs r0, #0x41
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldr r0, _08044780 @ =0x0000FFCD
	add r0, r8
	ldrh r4, [r7]
	adds r0, r0, r4
	strh r0, [r7]
_080446EE:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #5
	bls _08044676
	movs r0, #0x97
	lsls r0, r0, #1
	adds r5, r6, r0
	ldrh r0, [r5]
	adds r0, #0x40
	movs r3, #0
	strh r0, [r5]
	movs r1, #0x92
	lsls r1, r1, #1
	adds r2, r6, r1
	movs r4, #0x96
	lsls r4, r4, #1
	adds r7, r6, r4
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r4, r6, r1
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	str r3, [sp]
	mov r1, sb
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _0804476C
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x34
	strh r0, [r7]
_0804476C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804477C: .4byte sub_801EE64
_08044780: .4byte 0x0000FFCD

	thumb_func_start sub_8044784
sub_8044784: @ 0x08044784
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _080447CC @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080447D4
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #6
	cmp r0, r1
	beq _080447BC
	mov r4, r8
	strh r1, [r4, #4]
	mov r0, r8
	bl NextTransitionFrame
_080447BC:
	ldr r0, _080447D0 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _08044A00
	.align 2, 0
_080447CC: .4byte gPlayer
_080447D0: .4byte gFlags
_080447D4:
	ldrb r0, [r7, #0x11]
	cmp r0, #0
	bne _080447FC
	movs r0, #0x80
	lsls r0, r0, #6
	mov r5, r8
	strh r0, [r5, #4]
	mov r0, r8
	bl NextTransitionFrame
	ldr r2, _080447F8 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	b _08044A00
	.align 2, 0
_080447F8: .4byte gFlags
_080447FC:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r6, _080448C0 @ =gCamera
	ldr r1, [r6]
	subs r5, r0, r1
	ldrh r3, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	ldr r2, _080448C4 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #0xb
	adds r5, r5, r0
	ldrh r2, [r7, #0x1a]
	adds r1, r2, r1
	lsls r1, r1, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r1, r1, r0
	movs r4, #0
	ldrsh r1, [r1, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r5, r5, r0
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r6, r0, r1
	lsls r3, r3, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r3, r3, r0
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r6, r6, r0
	subs r6, #0x12
	lsls r2, r2, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r2, r2, r0
	movs r4, #0
	ldrsh r1, [r2, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r6, r6, r0
	movs r0, #0
	mov sb, r0
	ldrb r1, [r7, #0x1e]
	cmp r1, #0
	beq _080448CC
	ldrh r0, [r7, #0x1c]
	cmp r0, #0
	bne _080448CC
	subs r1, #1
	strb r1, [r7, #0x1e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	subs r0, r0, r1
	mov r4, r8
	strh r0, [r4, #4]
	ldrh r0, [r7, #0x1a]
	ldrb r1, [r7, #0x1e]
	adds r1, #8
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #0x20
	str r2, [sp, #4]
	movs r2, #6
	bl sub_802E784
	movs r5, #1
	mov sb, r5
	ldrb r0, [r7, #0x1e]
	cmp r0, #0
	bne _08044946
	ldr r2, _080448C8 @ =gUnknown_080D7F94
	ldrb r0, [r7, #0x10]
	movs r1, #0
	cmp r0, #4
	bls _080448B8
	movs r1, #2
_080448B8:
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	b _08044946
	.align 2, 0
_080448C0: .4byte gCamera
_080448C4: .4byte gSineTable
_080448C8: .4byte gUnknown_080D7F94
_080448CC:
	movs r2, #0x80
	lsls r2, r2, #6
	mov r0, r8
	strh r2, [r0, #4]
	ldrh r1, [r7, #0x1c]
	subs r0, r1, #1
	strh r0, [r7, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080448EC
	movs r0, #0xfc
	bl m4aSongNumStart
	movs r0, #0x10
	strb r0, [r7, #0x1e]
	b _0804491C
_080448EC:
	adds r0, r1, #0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1c
	bhi _0804491C
	adds r0, r1, #0
	subs r0, #0xb
	lsls r0, r0, #7
	subs r0, r2, r0
	mov r1, r8
	strh r0, [r1, #4]
	ldrh r0, [r7, #0x1a]
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0x20
	str r1, [sp, #4]
	movs r1, #0xa
	movs r2, #6
	bl sub_802E784
_0804491C:
	ldrh r0, [r7, #0x1c]
	cmp r0, #0xc
	bhi _08044946
	movs r4, #0x97
	lsls r4, r4, #2
	adds r2, r7, r4
	strh r5, [r2, #0x16]
	strh r6, [r2, #0x18]
	ldrh r0, [r7, #0x1c]
	cmp r0, #0xc
	bne _08044946
	ldr r5, _080449C0 @ =0x0000027D
	adds r1, r7, r5
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080449C4 @ =0x000002AB
	strh r0, [r2, #0xa]
	subs r0, #0x2f
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
_08044946:
	mov r0, r8
	bl NextTransitionFrame
	ldr r1, _080449C8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r6, r0, #8
	adds r6, #0x13
	ldr r3, [r7, #8]
	asrs r3, r3, #8
	ldr r4, _080449CC @ =gSineTable
	ldrh r1, [r7, #0x18]
	lsls r0, r1, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r2, [r0, r5]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #0xb
	adds r3, r3, r0
	subs r6, r6, r3
	ldr r2, _080449C8 @ =gPlayer
	ldr r0, [r2, #8]
	asrs r5, r0, #8
	adds r3, r5, #2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r2, r2, r0
	subs r5, r3, r2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080449D0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080449E4
	ldrh r2, [r7, #0x1a]
	adds r1, r2, #0
	cmp r1, r3
	bhs _080449D8
	ldr r0, _080449D4 @ =0x0000023F
	cmp r1, r0
	bhi _080449E4
	adds r0, r2, #1
	b _080449E2
	.align 2, 0
_080449C0: .4byte 0x0000027D
_080449C4: .4byte 0x000002AB
_080449C8: .4byte gPlayer
_080449CC: .4byte gSineTable
_080449D0: .4byte gUnknown_03005590
_080449D4: .4byte 0x0000023F
_080449D8:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r1, r0
	bls _080449E4
	subs r0, r2, #1
_080449E2:
	strh r0, [r7, #0x1a]
_080449E4:
	mov r1, sb
	cmp r1, #0
	beq _08044A00
	ldrh r1, [r7, #0x1a]
	adds r0, r1, #0
	subs r0, #0x10
	cmp r0, r3
	bge _08044A00
	adds r0, #0x20
	cmp r0, r3
	ble _08044A00
	ldr r0, _08044A10 @ =gPlayer
	bl sub_800CBA4
_08044A00:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A10: .4byte gPlayer

	thumb_func_start sub_8044A14
sub_8044A14: @ 0x08044A14
	push {r4, lr}
	mov ip, r0
	ldr r2, _08044A90 @ =gSineTable
	ldr r0, _08044A94 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08044A98 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #9
	movs r3, #0xfa
	lsls r3, r3, #2
	adds r0, r0, r3
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x32]
	mov r3, ip
	adds r3, #0xb6
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r1, #0x36
	adds r1, r1, r0
	mov r4, ip
	adds r4, #0xb8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	mov r3, ip
	ldrh r0, [r3, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xb
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044A9C
	ldrh r0, [r4]
	adds r0, #2
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08044AAC
	b _08044AAA
	.align 2, 0
_08044A90: .4byte gSineTable
_08044A94: .4byte gUnknown_03005590
_08044A98: .4byte 0x000003FF
_08044A9C:
	ldrh r0, [r4]
	subs r0, #2
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044AAC
_08044AAA:
	strh r3, [r4]
_08044AAC:
	mov r3, ip
	ldrh r0, [r3, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xb
	mov r1, ip
	adds r1, #0xba
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044ADA
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08044AEA
	b _08044AE8
_08044ADA:
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044AEA
_08044AE8:
	strh r3, [r1]
_08044AEA:
	mov r1, ip
	adds r1, #0xbc
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x77
	bls _08044B06
	movs r0, #0
	strh r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
_08044B06:
	mov r2, ip
	adds r2, #0xb6
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8044B28
sub_8044B28: @ 0x08044B28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08044BA4 @ =gSineTable
	ldr r3, _08044BA8 @ =gUnknown_03005590
	ldr r0, [r3]
	lsls r0, r0, #4
	ldr r1, _08044BAC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #9
	movs r4, #0xfa
	lsls r4, r4, #2
	adds r0, r0, r4
	ands r0, r1
	strh r0, [r6, #0x32]
	adds r4, r6, #0
	adds r4, #0xb6
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x36
	adds r1, r1, r0
	adds r5, r6, #0
	adds r5, #0xb8
	ldrh r0, [r5]
	strh r0, [r1]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x76
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r4, r0, #0xa
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bge _08044BB0
	ldrh r0, [r5]
	adds r0, #2
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	ble _08044BC0
	b _08044BBE
	.align 2, 0
_08044BA4: .4byte gSineTable
_08044BA8: .4byte gUnknown_03005590
_08044BAC: .4byte 0x000003FF
_08044BB0:
	ldrh r0, [r5]
	subs r0, #2
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bge _08044BC0
_08044BBE:
	strh r4, [r5]
_08044BC0:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r4, r0, #0xa
	adds r1, r6, #0
	adds r1, #0xba
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bge _08044BEC
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	ble _08044BFC
	b _08044BFA
_08044BEC:
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bge _08044BFC
_08044BFA:
	strh r4, [r1]
_08044BFC:
	adds r4, r6, #0
	adds r4, #0xbc
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bls _08044C98
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044C2A
	ldr r2, _08044C3C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08044C40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08044C44 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08044C48
_08044C2A:
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	b _08044C70
	.align 2, 0
_08044C3C: .4byte gPseudoRandom
_08044C40: .4byte 0x00196225
_08044C44: .4byte 0x3C6EF35F
_08044C48:
	ldr r3, [r3]
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	beq _08044C62
	strh r1, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	b _08044C70
_08044C62:
	strh r3, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x60
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
_08044C70:
	strb r0, [r1]
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r4, #0xc5
	lsls r4, r4, #2
	adds r1, r6, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08044C94 @ =0x00000315
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	b _08044CA6
	.align 2, 0
_08044C94: .4byte 0x00000315
_08044C98:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x46
	bne _08044CA6
	movs r0, #0xfa
	bl m4aSongNumStart
_08044CA6:
	adds r0, r6, #0
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044CBC
sub_8044CBC: @ 0x08044CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xbe
	ldrb r0, [r7]
	cmp r0, #0x40
	bne _08044D26
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r5, _08044DE0 @ =gSineTable
	ldrh r4, [r6, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r3, r2, r5
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r1, r1, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r2, #0
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r0, r0, r2
	adds r1, #2
	subs r0, #0x11
	ldr r3, _08044DE4 @ =gPlayer
	ldr r2, [r3, #8]
	asrs r2, r2, #8
	subs r1, r2, r1
	ldr r2, [r3, #0xc]
	asrs r2, r2, #8
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r6, #0x32]
_08044D26:
	ldrb r0, [r7]
	str r7, [sp]
	movs r3, #0xb6
	adds r3, r3, r6
	mov r8, r3
	movs r1, #0x36
	adds r1, r1, r6
	mov sl, r1
	adds r5, r6, #0
	adds r5, #0xb8
	adds r2, r6, #0
	adds r2, #0x76
	str r2, [sp, #4]
	adds r7, r6, #0
	adds r7, #0xba
	cmp r0, #0x1b
	bne _08044D92
	movs r0, #0xfb
	bl m4aSongNumStart
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0x10
	strb r0, [r1]
	movs r3, #0
	movs r0, #0xcb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _08044DE8 @ =gUnknown_080D7FB0
	mov ip, r1
	movs r4, #0xff
_08044D64:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	add r0, sb
	adds r2, r6, r0
	lsls r1, r3, #3
	add r1, ip
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08044D64
_08044D92:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	adds r4, r5, #0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r1, [r7]
	strh r1, [r0]
	ldr r2, _08044DE0 @ =gSineTable
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xa
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044DEC
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08044DFC
	strh r3, [r4]
	b _08044DFC
	.align 2, 0
_08044DE0: .4byte gSineTable
_08044DE4: .4byte gPlayer
_08044DE8: .4byte gUnknown_080D7FB0
_08044DEC:
	ldrh r0, [r5]
	subs r0, #0xa
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r3
	bge _08044DFC
	strh r3, [r5]
_08044DFC:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xa
	adds r1, r7, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044E28
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08044E38
	strh r3, [r1]
	b _08044E38
_08044E28:
	ldrh r0, [r7]
	subs r0, #0xa
	strh r0, [r7]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, r3
	bge _08044E38
	strh r3, [r7]
_08044E38:
	ldr r1, [sp]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r3, #0xff
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08044E92
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	beq _08044E84
	adds r0, r6, #0
	adds r0, #0xbf
	strb r1, [r0]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	str r0, [r2, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08044E80 @ =0x00000315
	adds r1, r6, r0
	ldrb r0, [r1]
	orrs r0, r3
	b _08044E90
	.align 2, 0
_08044E80: .4byte 0x00000315
_08044E84:
	adds r0, r6, #0
	adds r0, #0xbf
	movs r1, #3
	strb r1, [r0]
	movs r0, #0x7f
	ldr r1, [sp]
_08044E90:
	strb r0, [r1]
_08044E92:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044EB0
sub_8044EB0: @ 0x08044EB0
	push {r4, lr}
	mov ip, r0
	adds r0, #0xbe
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08044F34 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	ldr r3, _08044F38 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	mov r1, ip
	ldrh r1, [r1, #0x32]
	adds r0, r0, r1
	ands r0, r2
	mov r2, ip
	strh r0, [r2, #0x32]
	adds r2, #0xb6
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x36
	adds r1, r1, r0
	mov r4, ip
	adds r4, #0xb8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, ip
	ldrh r0, [r1, #0x32]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r2, r0, #0xa
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08044F3C
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _08044F4C
	b _08044F4A
	.align 2, 0
_08044F34: .4byte 0x000003FF
_08044F38: .4byte gSineTable
_08044F3C:
	ldrh r0, [r4]
	subs r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08044F4C
_08044F4A:
	strh r2, [r4]
_08044F4C:
	mov r2, ip
	ldrh r0, [r2, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r2, r0, #0xa
	mov r1, ip
	adds r1, #0xba
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bge _08044F7A
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _08044F8A
	b _08044F88
_08044F7A:
	ldrh r0, [r1]
	subs r0, #0xa
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bge _08044F8A
_08044F88:
	strh r2, [r1]
_08044F8A:
	mov r1, ip
	adds r1, #0xbe
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08044FCA
	adds r1, #1
	strb r0, [r1]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r1, #0xc5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08044FE0 @ =0x00000315
	add r1, ip
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08044FCA:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044FE0: .4byte 0x00000315

	thumb_func_start sub_8044FE4
sub_8044FE4: @ 0x08044FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xbe
	ldrb r0, [r7]
	cmp r0, #0x40
	bne _0804504E
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r5, _08045108 @ =gSineTable
	ldrh r4, [r6, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r3, r2, r5
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r1, r1, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r2, #0
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r0, r0, r2
	adds r1, #2
	subs r0, #0x11
	ldr r3, _0804510C @ =gPlayer
	ldr r2, [r3, #8]
	asrs r2, r2, #8
	subs r1, r2, r1
	ldr r2, [r3, #0xc]
	asrs r2, r2, #8
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r6, #0x32]
_0804504E:
	ldrb r0, [r7]
	str r7, [sp]
	movs r3, #0xb6
	adds r3, r3, r6
	mov r8, r3
	movs r1, #0x36
	adds r1, r1, r6
	mov sl, r1
	adds r5, r6, #0
	adds r5, #0xb8
	adds r2, r6, #0
	adds r2, #0x76
	str r2, [sp, #4]
	adds r7, r6, #0
	adds r7, #0xba
	cmp r0, #0x1b
	bne _080450BA
	movs r0, #0xfb
	bl m4aSongNumStart
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0x10
	strb r0, [r1]
	movs r3, #0
	movs r0, #0xcb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _08045110 @ =gUnknown_080D7FB0
	mov ip, r1
	movs r4, #0xff
_0804508C:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	add r0, sb
	adds r2, r6, r0
	lsls r1, r3, #3
	add r1, ip
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0804508C
_080450BA:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	adds r4, r5, #0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r1, [r7]
	strh r1, [r0]
	ldr r2, _08045108 @ =gSineTable
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08045114
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08045124
	strh r3, [r4]
	b _08045124
	.align 2, 0
_08045108: .4byte gSineTable
_0804510C: .4byte gPlayer
_08045110: .4byte gUnknown_080D7FB0
_08045114:
	ldrh r0, [r5]
	subs r0, #0xa
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r3
	bge _08045124
	strh r3, [r5]
_08045124:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #9
	adds r1, r7, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08045150
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08045160
	strh r3, [r1]
	b _08045160
_08045150:
	ldrh r0, [r7]
	subs r0, #0xa
	strh r0, [r7]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, r3
	bge _08045160
	strh r3, [r7]
_08045160:
	ldr r2, [sp]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r3, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080451A0
	adds r1, r6, #0
	adds r1, #0xbf
	strb r0, [r1]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	str r0, [r2, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080451C0 @ =0x00000315
	adds r1, r6, r0
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_080451A0:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080451C0: .4byte 0x00000315

	thumb_func_start sub_80451C4
sub_80451C4: @ 0x080451C4
	push {r4, lr}
	mov ip, r0
	ldrh r0, [r0, #0x32]
	subs r0, #0xc
	ldr r1, _0804523C @ =0x000003FF
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x32]
	mov r2, ip
	adds r2, #0xb6
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #0x36
	adds r1, r1, r0
	mov r3, ip
	adds r3, #0xb8
	ldrh r0, [r3]
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08045240 @ =gSineTable
	mov r4, ip
	ldrh r0, [r4, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0xbe
	ldrb r0, [r0]
	lsrs r0, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #0xb
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045244
	ldrh r0, [r3]
	adds r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	ble _08045254
	b _08045252
	.align 2, 0
_0804523C: .4byte 0x000003FF
_08045240: .4byte gSineTable
_08045244:
	ldrh r0, [r3]
	subs r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045254
_08045252:
	strh r1, [r3]
_08045254:
	mov r1, ip
	ldrh r0, [r1, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	mov r2, ip
	adds r2, #0xbe
	ldrb r0, [r2]
	lsrs r0, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #0xb
	mov r3, ip
	adds r3, #0xba
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045290
	ldrh r0, [r3]
	adds r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	ble _080452A0
	b _0804529E
_08045290:
	ldrh r0, [r3]
	subs r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _080452A0
_0804529E:
	strh r1, [r3]
_080452A0:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080452DE
	mov r1, ip
	adds r1, #0xbf
	strb r0, [r1]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r1, #0xc5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	ldr r1, _080452F4 @ =0x00000315
	add r1, ip
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_080452DE:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080452F4: .4byte 0x00000315

	thumb_func_start sub_80452F8
sub_80452F8: @ 0x080452F8
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r3, r2, r0
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	bne _08045362
	movs r0, #0x1e
	strb r0, [r2, #0x12]
	ldr r4, _0804533C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	beq _0804534C
	ldr r0, _08045340 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804534C
	ldr r0, _08045344 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0804534C
	ldr r0, _08045348 @ =0x0000013B
	strh r0, [r3, #0xa]
	adds r0, #0x95
	adds r1, r2, r0
	b _08045356
	.align 2, 0
_0804533C: .4byte gCurrentLevel
_08045340: .4byte gSelectedCharacter
_08045344: .4byte gLoadedSaveGame
_08045348: .4byte 0x0000013B
_0804534C:
	movs r0, #0xab
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
_08045356:
	movs r0, #1
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08045362:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045368
sub_8045368: @ 0x08045368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0xd8
	lsls r7, r7, #1
	add r7, r8
	ldrb r0, [r0, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1, #0x10]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804538E
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08045394
_0804538E:
	movs r0, #0xeb
	bl m4aSongNumStart
_08045394:
	movs r0, #0
	movs r1, #0x1e
	mov r2, r8
	strb r1, [r2, #0x13]
	strb r0, [r2, #0x12]
	ldr r2, _080453D0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _080453E8
	ldr r0, _080453D4 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080453E8
	ldr r0, _080453D8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _080453E8
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _080453E0
	ldr r0, _080453DC @ =0x0000013B
	b _080453F4
	.align 2, 0
_080453D0: .4byte gCurrentLevel
_080453D4: .4byte gSelectedCharacter
_080453D8: .4byte gLoadedSaveGame
_080453DC: .4byte 0x0000013B
_080453E0:
	ldr r0, _080453E4 @ =0x0000013B
	b _08045464
	.align 2, 0
_080453E4: .4byte 0x0000013B
_080453E8:
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _08045460
	movs r0, #0xab
	lsls r0, r0, #2
_080453F4:
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0804544C @ =gUnknown_03005450
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08045450 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0804546E
	ldr r0, _08045454 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804546E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08045458 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08045440
	movs r0, #0xff
_08045440:
	strb r0, [r1]
	ldr r1, _0804545C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0804546E
	.align 2, 0
_0804544C: .4byte gUnknown_03005450
_08045450: .4byte 0x0000C350
_08045454: .4byte gGameMode
_08045458: .4byte gNumLives
_0804545C: .4byte gUnknown_030054A8
_08045460:
	movs r0, #0xab
	lsls r0, r0, #2
_08045464:
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_0804546E:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0804549C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08045490
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #4
	bne _08045490
	ldr r1, _080454A0 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08045490:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804549C: .4byte gCurrentLevel
_080454A0: .4byte gUnknown_030054A8

	thumb_func_start sub_80454A4
sub_80454A4: @ 0x080454A4
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _080454BA
	subs r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080454D0
_080454BA:
	ldrb r0, [r2, #0x12]
	cmp r0, #0
	beq _080454CC
	subs r0, #1
	strb r0, [r2, #0x12]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080454CC
	movs r1, #1
_080454CC:
	cmp r1, #0
	beq _0804555E
_080454D0:
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r3, r2, r0
	ldr r4, _08045510 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	beq _08045534
	ldr r0, _08045514 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08045534
	ldr r0, _08045518 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _08045534
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08045520
	ldr r0, _0804551C @ =0x0000013B
	strh r0, [r3, #0xa]
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r0, #3
	b _08045554
	.align 2, 0
_08045510: .4byte gCurrentLevel
_08045514: .4byte gSelectedCharacter
_08045518: .4byte gLoadedSaveGame
_0804551C: .4byte 0x0000013B
_08045520:
	movs r0, #0
	ldr r1, _08045530 @ =0x0000013B
	strh r1, [r3, #0xa]
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r1, r2, r4
	b _08045554
	.align 2, 0
_08045530: .4byte 0x0000013B
_08045534:
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08045548
	movs r0, #0xab
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #3
	b _08045554
_08045548:
	movs r0, #0
	movs r1, #0xab
	lsls r1, r1, #2
	strh r1, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
_08045554:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804555E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045564
sub_8045564: @ 0x08045564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0804557A
	b _08045858
_0804557A:
	ldr r1, _08045868 @ =gUnknown_03005590
	ldr r0, [r1]
	movs r1, #7
	bl Mod
	adds r5, r0, #0
	cmp r5, #0
	bne _0804563E
	ldr r2, _0804586C @ =gPseudoRandom
	ldr r0, [r2]
	ldr r3, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r3, r2
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r0, _0804586C @ =gPseudoRandom
	str r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r6, r0, #0
	adds r6, #0x18
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r7, r0, #2
	ldr r4, _08045878 @ =0x000003FF
	adds r0, r4, #0
	ands r7, r0
	mov r0, sb
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r3, _0804587C @ =gCamera
	mov ip, r3
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r4, _08045880 @ =gSineTable
	mov sl, r4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r7, r3
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	lsls r0, r7, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x18]
	mov r0, sp
	strh r5, [r0, #0x1c]
	str r0, [sp, #0x20]
	ldr r3, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	ldr r0, _0804586C @ =gPseudoRandom
	str r1, [r0]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	ldr r1, [sp, #0x20]
	strh r0, [r1, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r5, [r0, #0xa]
	str r5, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl sub_8039B54
_0804563E:
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #0xa
	bl Mod
	str r0, [sp, #0x24]
	cmp r0, #0
	bne _0804572E
	ldr r3, _0804586C @ =gPseudoRandom
	mov r8, r3
	ldr r0, [r3]
	ldr r4, _08045870 @ =0x00196225
	muls r0, r4, r0
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	adds r6, r0, #0
	adds r6, #0x18
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r7, r1, #2
	ldr r3, _08045878 @ =0x000003FF
	adds r1, r3, #0
	ands r7, r1
	movs r1, #6
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sb
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r1, _0804587C @ =gCamera
	mov sl, r1
	ldr r1, [r1]
	subs r2, r2, r1
	str r2, [sp, #0x14]
	ldr r3, _08045880 @ =gSineTable
	mov ip, r3
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r7, r4
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	ldrsh r1, [r1, r3]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x14]
	mov r4, sb
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	mov r3, sl
	ldr r1, [r3, #4]
	subs r2, r2, r1
	str r2, [sp, #0x18]
	lsls r1, r7, #1
	add r1, ip
	movs r4, #0
	ldrsh r1, [r1, r4]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x18]
	mov r2, sp
	movs r1, #0x40
	strh r1, [r2, #0x1c]
	mov r1, sp
	str r1, [sp, #0x28]
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _08045870 @ =0x00196225
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	str r1, [r2]
	ldr r2, _08045878 @ =0x000003FF
	ands r1, r2
	ldr r2, [sp, #0x28]
	strh r1, [r2, #0xc]
	mov r2, sp
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r2, #0xe]
	ldr r2, _08045890 @ =gUnknown_080D79D0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08045894 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r4, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r4, #8]
	mov r0, sp
	str r0, [sp, #0x30]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, [sp, #0x30]
	strh r0, [r1, #0xa]
	ldr r2, [sp, #0x24]
	str r2, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	mov r0, sp
	bl sub_8039B54
_0804572E:
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #9
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _080457C4
	ldr r4, _0804586C @ =gPseudoRandom
	mov sl, r4
	ldr r0, [r4]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc4
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	mov ip, r4
	ldr r0, [r4]
	subs r1, r1, r0
	movs r4, #0xf
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r4, sp
	ldr r0, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r2, _08045874 @ =0x3C6EF35F
	adds r1, r1, r2
	mov r3, sl
	str r1, [r3]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl sub_8039B54
_080457C4:
	ldr r4, _08045868 @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xb
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08045858
	ldr r0, _0804586C @ =gPseudoRandom
	mov sl, r0
	ldr r0, [r0]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xcc
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0xf
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r2, r2, r1
	mov r0, sb
	adds r0, #0xd0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	ldr r4, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r4, r1
	ldr r0, _08045874 @ =0x3C6EF35F
	adds r1, r1, r0
	mov r2, sl
	str r1, [r2]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl sub_8039B54
_08045858:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045868: .4byte gUnknown_03005590
_0804586C: .4byte gPseudoRandom
_08045870: .4byte 0x00196225
_08045874: .4byte 0x3C6EF35F
_08045878: .4byte 0x000003FF
_0804587C: .4byte gCamera
_08045880: .4byte gSineTable
_08045884: .4byte 0x00000407
_08045888: .4byte 0x06012980
_0804588C: .4byte 0x0000026B
_08045890: .4byte gUnknown_080D79D0
_08045894: .4byte 0x06010000

	thumb_func_start sub_8045898
sub_8045898: @ 0x08045898
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0804597C
	ldr r0, _080458DC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	lsrs r7, r0, #1
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080458EC
	movs r2, #0
	ldr r0, _080458E0 @ =gFlags
	mov ip, r0
	ldr r6, _080458E4 @ =gObjPalette
	ldr r5, _080458E8 @ =gUnknown_080D7FF0
	lsls r3, r7, #5
_080458BE:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080458BE
	b _08045910
	.align 2, 0
_080458DC: .4byte gUnknown_03005590
_080458E0: .4byte gFlags
_080458E4: .4byte gObjPalette
_080458E8: .4byte gUnknown_080D7FF0
_080458EC:
	movs r2, #0
	ldr r1, _08045940 @ =gFlags
	mov ip, r1
	ldr r5, _08045944 @ =gObjPalette
	ldr r3, _08045948 @ =gUnknown_080D8010
_080458F6:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080458F6
_08045910:
	ldrb r0, [r4, #0x1f]
	cmp r0, #0
	beq _08045950
	subs r0, #1
	strb r0, [r4, #0x1f]
	movs r2, #0
	ldr r5, _08045944 @ =gObjPalette
	ldr r4, _0804594C @ =gUnknown_080D7FF0
	lsls r3, r7, #5
_08045922:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08045922
	b _08045970
	.align 2, 0
_08045940: .4byte gFlags
_08045944: .4byte gObjPalette
_08045948: .4byte gUnknown_080D8010
_0804594C: .4byte gUnknown_080D7FF0
_08045950:
	movs r2, #0
	ldr r4, _08045984 @ =gObjPalette
	ldr r3, _08045988 @ =gUnknown_080D8010
_08045956:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08045956
_08045970:
	mov r1, ip
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	str r0, [r1]
_0804597C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045984: .4byte gObjPalette
_08045988: .4byte gUnknown_080D8010

	thumb_func_start sub_804598C
sub_804598C: @ 0x0804598C
	push {lr}
	ldr r0, _0804599C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0804599C: .4byte gCurTask

	thumb_func_start sub_80459A0
sub_80459A0: @ 0x080459A0
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	bne _080459C2
	ldrh r2, [r1, #0x30]
	ldrh r0, [r1, #0x16]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _080459C8 @ =0x000003FF
	ands r0, r3
	cmp r2, r0
	beq _080459C2
	adds r0, r2, #1
	ands r0, r3
	strh r0, [r1, #0x30]
_080459C2:
	pop {r0}
	bx r0
	.align 2, 0
_080459C8: .4byte 0x000003FF

	thumb_func_start TaskDestructor_EggSaucerMain
TaskDestructor_EggSaucerMain: @ 0x080459CC
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _080459E4 @ =IWRAM_START + 0x4AC
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080459E8 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080459E4: .4byte IWRAM_START + 0x4AC
_080459E8: .4byte gActiveBossTask
