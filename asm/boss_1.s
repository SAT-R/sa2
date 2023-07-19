.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; Referenced inside gUnknown_080D798C
	thumb_func_start CreateEggHammerTankII
CreateEggHammerTankII: @ 0x0803A24C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x7c
	ldr r2, _0803A2A4 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	ldr r1, _0803A2A8 @ =gPseudoRandom
	ldr r0, _0803A2AC @ =gUnknown_03005590
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803A2B0 @ =Task_EggHammerTankIIMain
	ldr r1, _0803A2B4 @ =0x000004A4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803A2B8 @ =TaskDestructor_EggHammerTankIIMain
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _0803A2BC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	bne _0803A2D4
	ldr r0, _0803A2C0 @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A2C8
	ldr r0, _0803A2C4 @ =IWRAM_START + 0xB0
	adds r1, r1, r0
	movs r0, #3
	b _0803A2FE
	.align 2, 0
_0803A2A4: .4byte gPlayer
_0803A2A8: .4byte gPseudoRandom
_0803A2AC: .4byte gUnknown_03005590
_0803A2B0: .4byte Task_EggHammerTankIIMain
_0803A2B4: .4byte 0x000004A4
_0803A2B8: .4byte TaskDestructor_EggHammerTankIIMain
_0803A2BC: .4byte gCurrentLevel
_0803A2C0: .4byte gDifficultyLevel
_0803A2C4: .4byte IWRAM_START + 0xB0
_0803A2C8:
	ldr r2, _0803A2D0 @ =IWRAM_START + 0xB0
	adds r1, r1, r2
	movs r0, #4
	b _0803A2FE
	.align 2, 0
_0803A2D0: .4byte IWRAM_START + 0xB0
_0803A2D4:
	ldr r0, _0803A2EC @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A2F8
	ldr r0, _0803A2F0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803A2F8
	ldr r3, _0803A2F4 @ =IWRAM_START + 0xB0
	adds r1, r1, r3
	movs r0, #6
	b _0803A2FE
	.align 2, 0
_0803A2EC: .4byte gDifficultyLevel
_0803A2F0: .4byte gGameMode
_0803A2F4: .4byte IWRAM_START + 0xB0
_0803A2F8:
	adds r1, r7, #0
	adds r1, #0xb0
	movs r0, #8
_0803A2FE:
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xa8
	movs r2, #0
	str r2, [r0]
	adds r1, r7, #0
	adds r1, #0xa4
	movs r0, #2
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xa0
	str r2, [r0]
	adds r1, #8
	movs r0, #0x78
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xb1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r1, #0xf5
	lsls r1, r1, #0xa
	str r1, [r7]
	movs r0, #0x9b
	lsls r0, r0, #8
	str r0, [r7, #4]
	ldr r0, _0803A70C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #8]
	strh r2, [r7, #0xa]
	movs r1, #0
	movs r0, #0x74
	adds r0, r0, r7
	mov r8, r0
	adds r6, r7, #0
	adds r6, #0x54
	movs r2, #0x94
	adds r2, r2, r7
	mov sb, r2
	movs r3, #0x98
	adds r3, r3, r7
	mov sl, r3
	movs r0, #0x9c
	adds r0, r0, r7
	mov ip, r0
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r2, r7, r2
	str r2, [sp, #0x58]
	ldr r3, _0803A710 @ =0x00000301
	adds r3, r7, r3
	str r3, [sp, #0x5c]
	ldr r0, _0803A714 @ =0x00000302
	adds r0, r7, r0
	str r0, [sp, #0x60]
	ldr r2, _0803A718 @ =0x00000305
	adds r2, r7, r2
	str r2, [sp, #0x64]
	movs r3, #0xce
	lsls r3, r3, #2
	adds r3, r7, r3
	str r3, [sp, #0x78]
	ldr r0, _0803A71C @ =0x00000339
	adds r0, r7, r0
	str r0, [sp, #0xc]
	ldr r2, _0803A720 @ =0x0000033A
	adds r2, r7, r2
	str r2, [sp, #0x10]
	ldr r3, _0803A724 @ =0x0000033D
	adds r3, r7, r3
	str r3, [sp, #0x14]
	movs r0, #0xf2
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x48]
	ldr r2, _0803A728 @ =0x000003C9
	adds r2, r7, r2
	str r2, [sp, #0x4c]
	ldr r3, _0803A72C @ =0x000003CA
	adds r3, r7, r3
	str r3, [sp, #0x50]
	ldr r0, _0803A730 @ =0x000003CD
	adds r0, r7, r0
	str r0, [sp, #0x54]
	movs r2, #0xfe
	lsls r2, r2, #2
	adds r2, r7, r2
	str r2, [sp, #0x68]
	ldr r3, _0803A734 @ =0x000003F9
	adds r3, r7, r3
	str r3, [sp, #0x6c]
	ldr r0, _0803A738 @ =0x000003FA
	adds r0, r7, r0
	str r0, [sp, #0x70]
	ldr r2, _0803A73C @ =0x000003FD
	adds r2, r7, r2
	str r2, [sp, #0x74]
	movs r3, #0xda
	lsls r3, r3, #2
	adds r3, r7, r3
	str r3, [sp, #0x28]
	ldr r0, _0803A740 @ =0x00000369
	adds r0, r7, r0
	str r0, [sp, #0x2c]
	ldr r2, _0803A744 @ =0x0000036A
	adds r2, r7, r2
	str r2, [sp, #0x30]
	ldr r3, _0803A748 @ =0x0000036D
	adds r3, r7, r3
	str r3, [sp, #0x34]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x38]
	ldr r2, _0803A74C @ =0x00000399
	adds r2, r7, r2
	str r2, [sp, #0x3c]
	ldr r3, _0803A750 @ =0x0000039A
	adds r3, r7, r3
	str r3, [sp, #0x40]
	ldr r0, _0803A754 @ =0x0000039D
	adds r0, r7, r0
	str r0, [sp, #0x44]
	movs r2, #0x85
	lsls r2, r2, #3
	adds r2, r7, r2
	str r2, [sp, #0x18]
	ldr r3, _0803A758 @ =0x00000429
	adds r3, r7, r3
	str r3, [sp, #0x1c]
	ldr r0, _0803A75C @ =0x0000042A
	adds r0, r7, r0
	str r0, [sp, #0x20]
	ldr r2, _0803A760 @ =0x0000042D
	adds r2, r7, r2
	str r2, [sp, #0x24]
	movs r4, #0
	ldr r5, _0803A764 @ =gUnknown_080D7A38
	adds r3, r7, #0
	adds r3, #0xc
	adds r2, r7, #0
	adds r2, #0x2c
_0803A426:
	stm r2!, {r4}
	ldm r5!, {r0}
	stm r3!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _0803A426
	movs r0, #0
	str r0, [r7, #0x4c]
	str r0, [r7, #0x50]
	movs r1, #0
	movs r4, #0xc0
	lsls r4, r4, #2
	ldr r5, _0803A768 @ =gUnknown_080D7A58
	adds r3, r6, #0
	mov r2, r8
_0803A444:
	stm r2!, {r4}
	ldm r5!, {r0}
	stm r3!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _0803A444
	movs r0, #0xc0
	lsls r0, r0, #2
	mov r3, sb
	str r0, [r3]
	movs r0, #0x94
	lsls r0, r0, #5
	mov r1, sl
	str r0, [r1]
	mov r2, ip
	str r0, [r2]
	movs r3, #0xb8
	lsls r3, r3, #2
	adds r6, r7, r3
	movs r0, #0
	mov r8, r0
	movs r4, #0
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x48
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x9e
	lsls r0, r0, #2
	strh r0, [r6, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x58]
	strb r2, [r1]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x5c]
	strb r0, [r3]
	movs r0, #0x10
	mov sb, r0
	mov r2, sb
	ldr r1, [sp, #0x60]
	strb r2, [r1]
	mov r0, r8
	ldr r3, [sp, #0x64]
	strb r0, [r3]
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	str r1, [r6, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	str r2, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	movs r3, #0xc6
	lsls r3, r3, #2
	adds r6, r7, r3
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A76C @ =0x00000279
	strh r0, [r6, #0xa]
	mov r1, r8
	ldr r0, [sp, #0x78]
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	mov r0, sb
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	ldr r2, [sp, #0x14]
	strb r1, [r2]
	mov r3, sl
	str r3, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	movs r1, #0xea
	lsls r1, r1, #2
	adds r6, r7, r1
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A770 @ =0x0000027B
	strh r0, [r6, #0xa]
	mov r3, r8
	ldr r2, [sp, #0x48]
	strb r3, [r2]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x4c]
	strb r0, [r1]
	mov r3, sb
	ldr r2, [sp, #0x50]
	strb r3, [r2]
	mov r1, r8
	ldr r0, [sp, #0x54]
	strb r1, [r0]
	mov r2, sl
	str r2, [r6, #0x28]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r6, #0x10]
	movs r0, #0xf6
	lsls r0, r0, #2
	adds r6, r7, r0
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A774 @ =0x0000027A
	strh r0, [r6, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x68]
	strb r2, [r1]
	movs r5, #0xa8
	lsls r5, r5, #3
	strh r5, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #0x6c]
	strb r0, [r3]
	mov r1, sb
	ldr r0, [sp, #0x70]
	strb r1, [r0]
	ldr r3, [sp, #0x74]
	strb r2, [r3]
	mov r0, sl
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	movs r2, #0xd2
	lsls r2, r2, #2
	adds r6, r7, r2
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A778 @ =0x00000277
	strh r0, [r6, #0xa]
	mov r0, r8
	ldr r3, [sp, #0x28]
	strb r0, [r3]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x2c]
	strb r0, [r1]
	mov r3, sb
	ldr r2, [sp, #0x30]
	strb r3, [r2]
	mov r1, r8
	ldr r0, [sp, #0x34]
	strb r1, [r0]
	mov r2, sl
	str r2, [r6, #0x28]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	movs r0, #0xde
	lsls r0, r0, #2
	adds r6, r7, r0
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A77C @ =0x00000275
	strh r0, [r6, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x38]
	strb r2, [r1]
	strh r5, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #0x3c]
	strb r0, [r3]
	mov r1, sb
	ldr r0, [sp, #0x40]
	strb r1, [r0]
	ldr r3, [sp, #0x44]
	strb r2, [r3]
	mov r0, sl
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	movs r2, #0x81
	lsls r2, r2, #3
	adds r6, r7, r2
	strh r4, [r6, #0x16]
	strh r4, [r6, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r6, #4]
	ldr r0, _0803A780 @ =0x00000276
	strh r0, [r6, #0xa]
	mov r0, r8
	ldr r3, [sp, #0x18]
	strb r0, [r3]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r2, #1
	rsbs r2, r2, #0
	mov r1, sp
	strb r2, [r1, #8]
	adds r0, r2, #0
	ldr r3, [sp, #0x1c]
	strb r0, [r3]
	mov r1, sb
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	mov r3, r8
	ldr r2, [sp, #0x24]
	strb r3, [r2]
	mov r0, sl
	str r0, [r6, #0x28]
	ldr r2, _0803A784 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803A788 @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r2, _0803A70C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	bne _0803A682
	b _0803A7EC
_0803A682:
	ldr r0, _0803A78C @ =gSelectedCharacter
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _0803A68E
	b _0803A7EC
_0803A68E:
	ldr r0, _0803A790 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _0803A69E
	b _0803A7EC
_0803A69E:
	ldr r1, _0803A794 @ =0x00000444
	adds r6, r7, r1
	strh r5, [r6, #0x16]
	strh r5, [r6, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0x81
	strh r0, [r6, #0xa]
	ldr r2, _0803A798 @ =0x00000464
	adds r0, r7, r2
	mov r3, r8
	strb r3, [r0]
	movs r4, #0x80
	strh r4, [r6, #0x1a]
	strh r5, [r6, #8]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x1c]
	ldr r0, _0803A79C @ =0x00000465
	adds r1, r7, r0
	ldrb r0, [r1]
	mov r2, sp
	ldrb r2, [r2, #8]
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _0803A7A0 @ =0x00000466
	adds r0, r7, r3
	mov r1, sb
	strb r1, [r0]
	ldr r2, _0803A7A4 @ =0x00000469
	adds r0, r7, r2
	mov r3, r8
	strb r3, [r0]
	mov r0, sl
	str r0, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r6, #0x10]
	adds r2, #0xb
	adds r6, r7, r2
	strh r5, [r6, #0x16]
	strh r5, [r6, #0x18]
	movs r0, #9
	bl VramMalloc
	str r0, [r6, #4]
	movs r0, #0xe9
	lsls r0, r0, #1
	strh r0, [r6, #0xa]
	ldr r3, _0803A7A8 @ =0x00000494
	adds r0, r7, r3
	mov r1, r8
	strb r1, [r0]
	b _0803A7AC
	.align 2, 0
_0803A70C: .4byte gCurrentLevel
_0803A710: .4byte 0x00000301
_0803A714: .4byte 0x00000302
_0803A718: .4byte 0x00000305
_0803A71C: .4byte 0x00000339
_0803A720: .4byte 0x0000033A
_0803A724: .4byte 0x0000033D
_0803A728: .4byte 0x000003C9
_0803A72C: .4byte 0x000003CA
_0803A730: .4byte 0x000003CD
_0803A734: .4byte 0x000003F9
_0803A738: .4byte 0x000003FA
_0803A73C: .4byte 0x000003FD
_0803A740: .4byte 0x00000369
_0803A744: .4byte 0x0000036A
_0803A748: .4byte 0x0000036D
_0803A74C: .4byte 0x00000399
_0803A750: .4byte 0x0000039A
_0803A754: .4byte 0x0000039D
_0803A758: .4byte 0x00000429
_0803A75C: .4byte 0x0000042A
_0803A760: .4byte 0x0000042D
_0803A764: .4byte gUnknown_080D7A38
_0803A768: .4byte gUnknown_080D7A58
_0803A76C: .4byte 0x00000279
_0803A770: .4byte 0x0000027B
_0803A774: .4byte 0x0000027A
_0803A778: .4byte 0x00000277
_0803A77C: .4byte 0x00000275
_0803A780: .4byte 0x00000276
_0803A784: .4byte gUnknown_030054B8
_0803A788: .4byte 0x00002060
_0803A78C: .4byte gSelectedCharacter
_0803A790: .4byte gLoadedSaveGame
_0803A794: .4byte 0x00000444
_0803A798: .4byte 0x00000464
_0803A79C: .4byte 0x00000465
_0803A7A0: .4byte 0x00000466
_0803A7A4: .4byte 0x00000469
_0803A7A8: .4byte 0x00000494
_0803A7AC:
	strh r4, [r6, #0x1a]
	strh r5, [r6, #8]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x1c]
	ldr r2, _0803A7E0 @ =0x00000495
	adds r1, r7, r2
	ldrb r0, [r1]
	mov r3, sp
	ldrb r3, [r3, #8]
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803A7E4 @ =0x00000496
	adds r0, r7, r1
	mov r2, sb
	strb r2, [r0]
	ldr r3, _0803A7E8 @ =0x00000499
	adds r0, r7, r3
	mov r1, r8
	strb r1, [r0]
	mov r2, sl
	str r2, [r6, #0x28]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r6, #0x10]
	b _0803A7FE
	.align 2, 0
_0803A7E0: .4byte 0x00000495
_0803A7E4: .4byte 0x00000496
_0803A7E8: .4byte 0x00000499
_0803A7EC:
	movs r1, #0x89
	lsls r1, r1, #3
	adds r0, r7, r1
	movs r1, #0
	str r1, [r0]
	movs r2, #0x8f
	lsls r2, r2, #3
	adds r0, r7, r2
	str r1, [r0]
_0803A7FE:
	ldr r0, _0803A814 @ =gActiveBossTask
	ldr r3, [sp, #4]
	str r3, [r0]
	add sp, #0x7c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A814: .4byte gActiveBossTask

	thumb_func_start Task_EggHammerTankIIMain
Task_EggHammerTankIIMain: @ 0x0803A818
	push {r4, r5, r6, lr}
	ldr r2, _0803A840 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0xa8
	adds r0, r0, r1
	ldr r4, [r0]
	adds r1, r4, #1
	str r1, [r0]
	adds r3, r1, #0
	adds r6, r2, #0
	cmp r3, #0x14
	bhi _0803A844
	movs r0, #0
	strh r0, [r5, #8]
	b _0803A8C6
	.align 2, 0
_0803A840: .4byte gCurTask
_0803A844:
	cmp r3, #0x7e
	bhi _0803A87A
	adds r1, r4, #0
	subs r1, #0x3c
	ldr r0, _0803A8CC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #8
	ldr r4, _0803A8D0 @ =0x0004BA00
	adds r2, r0, r4
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	lsrs r0, r0, #1
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	lsrs r0, r0, #1
	subs r2, r2, r0
	lsrs r0, r1, #1
	adds r2, r2, r0
	str r2, [r5]
_0803A87A:
	movs r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	cmp r3, #0x7e
	bls _0803A8A8
	ldr r2, _0803A8D4 @ =gPlayer
	ldr r0, [r2, #0x20]
	ldr r1, _0803A8D8 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r5, #8]
	ldr r1, [r6]
	ldr r0, _0803A8DC @ =Task_803C980
	str r0, [r1, #8]
_0803A8A8:
	ldr r4, _0803A8E0 @ =gUnknown_080D7AA8
	bl sub_803CA40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r5, #0
	bl sub_803CB18
	adds r0, r5, #0
	bl sub_803AC2C
_0803A8C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803A8CC: .4byte gCurrentLevel
_0803A8D0: .4byte 0x0004BA00
_0803A8D4: .4byte gPlayer
_0803A8D8: .4byte 0xFFDFFFFF
_0803A8DC: .4byte Task_803C980
_0803A8E0: .4byte gUnknown_080D7AA8

	thumb_func_start sub_803A8E4
sub_803A8E4: @ 0x0803A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A8FA
	b _0803AA2E
_0803A8FA:
	adds r0, r7, #0
	adds r0, #0xa0
	ldr r0, [r0]
	cmp r0, #4
	bls _0803A908
	cmp r0, #6
	bne _0803A96C
_0803A908:
	ldr r2, [r7]
	asrs r2, r2, #8
	ldr r4, _0803A9E8 @ =gSineTable
	adds r0, r7, #0
	adds r0, #0x88
	ldr r1, [r0]
	ldr r0, _0803A9EC @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r3, [r7, #0x68]
	muls r0, r3, r0
	asrs r0, r0, #0x17
	subs r0, #8
	adds r5, r2, r0
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r4, #0
	ldrsh r0, [r1, r4]
	muls r0, r3, r0
	asrs r0, r0, #0x17
	adds r6, r2, r0
	ldr r4, _0803A9F0 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r5, r5, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	subs r6, r6, r0
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r6, #0
	muls r1, r6, r1
	adds r0, r0, r1
	ldr r1, _0803A9F4 @ =0x000001A3
	cmp r0, r1
	bgt _0803A96C
	adds r0, r7, #0
	bl sub_803CBFC
	adds r0, r4, #0
	bl sub_800CBA4
_0803A96C:
	movs r0, #0xb8
	lsls r0, r0, #2
	adds r4, r7, r0
	ldr r1, [r7]
	asrs r1, r1, #8
	adds r5, r1, #0
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	adds r6, r2, #0
	ldr r3, _0803A9F8 @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r4, #0x18]
	ldr r3, _0803A9F0 @ =gPlayer
	mov r8, r3
	str r3, [sp]
	adds r0, r4, #0
	movs r3, #1
	bl sub_800CA20
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	adds r0, r7, #0
	adds r0, #0xb1
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #0
	beq _0803A9CA
	mov r1, r8
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	ldr r1, [r1, #0x20]
	cmp r0, #0
	bgt _0803A9C2
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0803AA2E
_0803A9C2:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0803AA2E
_0803A9CA:
	ldr r3, _0803A9F0 @ =gPlayer
	mov r8, r3
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _0803A9FC
	adds r0, r7, #0
	bl sub_803B6AC
	b _0803AA0C
	.align 2, 0
_0803A9E8: .4byte gSineTable
_0803A9EC: .4byte 0x000003FF
_0803A9F0: .4byte gPlayer
_0803A9F4: .4byte 0x000001A3
_0803A9F8: .4byte gCamera
_0803A9FC:
	mov r0, r8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800CA20
_0803AA0C:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803AA2E
	ldr r0, _0803AA3C @ =gPlayer
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C418
	cmp r0, #1
	bne _0803AA2E
	adds r0, r7, #0
	bl sub_803B6AC
_0803AA2E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AA3C: .4byte gPlayer

	thumb_func_start sub_803AA40
sub_803AA40: @ 0x0803AA40
	push {r4, r5, r6, lr}
	ldr r0, _0803AA9C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0xb4
	adds r4, r0, r1
	subs r1, #0xc
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	cmp r1, #8
	bls _0803AA76
	cmp r1, #9
	bne _0803AA76
	ldr r2, _0803AAA0 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0803AAA4 @ =0x0000014D
	bl m4aSongNumStart
_0803AA76:
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r1, [r0]
	adds r5, r0, #0
	cmp r1, #0x20
	bhi _0803AAA8
	cmp r1, #1
	bne _0803AA92
	strh r1, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r4, #4]
	movs r0, #0xc0
	strh r0, [r4, #6]
_0803AA92:
	adds r0, r4, #0
	bl NextTransitionFrame
	b _0803AC18
	.align 2, 0
_0803AA9C: .4byte gCurTask
_0803AAA0: .4byte gFlags
_0803AAA4: .4byte 0x0000014D
_0803AAA8:
	cmp r1, #0x78
	bhi _0803AB84
	movs r0, #0
	movs r1, #2
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	adds r0, r4, #0
	bl NextTransitionFrame
	ldr r2, _0803AB64 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803AAF6
	ldr r0, _0803AB68 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803AAE8
	ldr r0, _0803AB6C @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803AAE8
	ldr r0, _0803AB70 @ =gPlayer
	adds r0, #0x64
	movs r1, #0x51
	strh r1, [r0]
_0803AAE8:
	ldr r0, _0803AB64 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803AAF6
	b _0803AC18
_0803AAF6:
	ldr r0, [r5]
	cmp r0, #0x22
	beq _0803AAFE
	b _0803AC18
_0803AAFE:
	ldr r1, _0803AB74 @ =gUnknown_080D6DE4
	ldrh r5, [r1]
	ldr r3, _0803AB70 @ =gPlayer
	ldr r2, [r3, #8]
	asrs r0, r2, #8
	subs r5, r5, r0
	ldrh r4, [r1, #2]
	ldr r1, [r3, #0xc]
	asrs r0, r1, #8
	subs r4, r4, r0
	lsls r6, r5, #8
	adds r2, r2, r6
	str r2, [r3, #8]
	lsls r2, r4, #8
	adds r1, r1, r2
	str r1, [r3, #0xc]
	ldr r1, _0803AB78 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r5
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x20]
	adds r0, r0, r5
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x10]
	adds r0, r0, r5
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
	ldr r0, _0803AB7C @ =gUnknown_030056A4
	ldr r1, [r0]
	cmp r1, #0
	beq _0803AB58
	ldr r0, [r1]
	adds r0, r0, r6
	str r0, [r1]
	ldr r0, [r1, #4]
	adds r0, r0, r2
	str r0, [r1, #4]
_0803AB58:
	ldr r1, _0803AB80 @ =gUnknown_030055B0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803AC18
	.align 2, 0
_0803AB64: .4byte gCurrentLevel
_0803AB68: .4byte gSelectedCharacter
_0803AB6C: .4byte gLoadedSaveGame
_0803AB70: .4byte gPlayer
_0803AB74: .4byte gUnknown_080D6DE4
_0803AB78: .4byte gCamera
_0803AB7C: .4byte gUnknown_030056A4
_0803AB80: .4byte gUnknown_030055B0
_0803AB84:
	movs r0, #0x28
	strh r0, [r4, #6]
	adds r0, r4, #0
	bl NextTransitionFrame
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0803AC18
	ldr r2, _0803ABB4 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803ABFC
	ldr r0, _0803ABB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803ABC0
	ldr r0, _0803ABBC @ =gCourseTime
	ldr r0, [r0]
	bl CreateTimeAttackResultsCutScene
	b _0803ABFC
	.align 2, 0
_0803ABB4: .4byte gCurrentLevel
_0803ABB8: .4byte gGameMode
_0803ABBC: .4byte gCourseTime
_0803ABC0:
	ldr r0, _0803ABE4 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803ABEC
	ldr r0, _0803ABE8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803ABEC
	movs r0, #0
	bl CreateCourseResultsCutScene
	b _0803ABFC
	.align 2, 0
_0803ABE4: .4byte gSelectedCharacter
_0803ABE8: .4byte gLoadedSaveGame
_0803ABEC:
	ldr r0, _0803AC08 @ =gCourseTime
	ldr r0, [r0]
	ldr r1, _0803AC0C @ =gRingCount
	ldrh r1, [r1]
	ldr r2, _0803AC10 @ =gUnknown_030054F4
	ldrb r2, [r2]
	bl sub_80304DC
_0803ABFC:
	ldr r0, _0803AC14 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0803AC22
	.align 2, 0
_0803AC08: .4byte gCourseTime
_0803AC0C: .4byte gRingCount
_0803AC10: .4byte gUnknown_030054F4
_0803AC14: .4byte gCurTask
_0803AC18:
	ldr r0, _0803AC28 @ =gWinRegs
	movs r1, #0x3f
	strh r1, [r0, #8]
	movs r1, #0x1f
	strh r1, [r0, #0xa]
_0803AC22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803AC28: .4byte gWinRegs

	thumb_func_start sub_803AC2C
sub_803AC2C: @ 0x0803AC2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r0
	adds r0, #0xb4
	str r0, [sp]
	movs r7, #0xb8
	lsls r7, r7, #2
	add r7, sl
	mov r1, sl
	ldr r0, [r1]
	asrs r0, r0, #8
	ldr r4, _0803AFF8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	mov r2, sl
	ldr r0, [r2, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xde
	lsls r7, r7, #2
	add r7, sl
	mov r3, sl
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	adds r0, #4
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xea
	lsls r7, r7, #2
	add r7, sl
	mov r5, sl
	ldr r0, [r5]
	ldr r1, _0803AFFC @ =0xFFFFEA00
	mov sb, r1
	add r0, sb
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	adds r5, #0x98
	str r5, [sp, #4]
	mov r2, sl
	ldr r0, [r2, #4]
	ldr r1, [r5]
	adds r0, r0, r1
	movs r5, #0xe8
	lsls r5, r5, #4
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r3, sl
	ldr r0, [r3]
	movs r6, #0xc0
	lsls r6, r6, #5
	adds r0, r0, r6
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	movs r0, #0x9c
	add r0, sl
	mov r8, r0
	ldr r0, [r3, #4]
	mov r2, r8
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xf6
	lsls r7, r7, #2
	add r7, sl
	mov r3, sl
	ldr r0, [r3]
	add r0, sb
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	ldr r2, [sp, #4]
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r6
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	mov r2, r8
	ldr r1, [r2]
	adds r0, r0, r1
	adds r0, r0, r5
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r7, #0xc6
	lsls r7, r7, #2
	add r7, sl
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r3, sl
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r1, #6
	mov r4, sb
	lsls r4, r4, #0x10
	str r4, [sp, #8]
	mov r5, r8
	lsls r5, r5, #0x10
	str r5, [sp, #0xc]
_0803AD92:
	lsls r0, r1, #0x18
	asrs r5, r0, #0x18
	lsls r4, r5, #2
	mov r3, sl
	adds r3, #0x2c
	adds r3, r3, r4
	ldr r0, [r3]
	adds r0, #0x50
	ldr r1, _0803B000 @ =0x000003FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _0803B004 @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r2, sl
	adds r2, #0xc
	adds r2, r2, r4
	ldr r0, [r2]
	muls r1, r0, r1
	asrs r1, r1, #0x17
	mov r4, sb
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	adds r1, r6, r1
	strh r1, [r7, #0x16]
	ldr r0, [r3]
	adds r0, #0x50
	ldr r1, _0803B000 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	ldr r3, _0803B004 @ =gSineTable
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r2]
	muls r1, r0, r1
	asrs r1, r1, #0x17
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r1, r4, r1
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	mov r0, sl
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803AE1C
	lsls r2, r5, #1
	adds r2, r2, r5
	lsls r2, r2, #3
	ldr r0, [sp]
	adds r0, #0x44
	adds r0, r0, r2
	movs r3, #0x16
	ldrsh r1, [r7, r3]
	str r1, [r0]
	ldr r0, [sp]
	adds r0, #0x48
	adds r0, r0, r2
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	str r1, [r0]
_0803AE1C:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _0803AD92
	movs r7, #0xd2
	lsls r7, r7, #2
	add r7, sl
	ldr r3, _0803B004 @ =gSineTable
	mov sb, r3
	mov r5, sl
	ldr r0, [r5, #0x48]
	adds r0, #0x50
	ldr r1, _0803B000 @ =0x000003FF
	mov r8, r1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	add r0, sb
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r5, #0x28]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	adds r0, r6, r0
	strh r0, [r7, #0x16]
	ldr r0, [r5, #0x48]
	adds r0, #0x50
	mov r5, r8
	ands r0, r5
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r3, sl
	ldr r0, [r3, #0x28]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	adds r0, r4, r0
	strh r0, [r7, #0x18]
	ldrh r5, [r7, #0x16]
	ldrh r4, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #0x89
	lsls r0, r0, #3
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	beq _0803AEBA
	ldr r7, _0803B008 @ =0x00000444
	add r7, sl
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r5, #5
	strh r5, [r7, #0x16]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #0x14
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
	ldr r7, _0803B00C @ =0x00000474
	add r7, sl
	strh r5, [r7, #0x16]
	strh r4, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_0803AEBA:
	movs r7, #0xc6
	lsls r7, r7, #2
	add r7, sl
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r1, #0
	mov r4, sl
	adds r4, #0x74
	str r4, [sp, #0x14]
	mov r5, sl
	adds r5, #0x54
	str r5, [sp, #0x10]
	mov r0, sl
	adds r0, #0x88
	str r0, [sp, #0x18]
	mov r2, sl
	adds r2, #0x94
	str r2, [sp, #0x1c]
_0803AEE0:
	lsls r4, r1, #0x18
	asrs r4, r4, #0x18
	lsls r2, r4, #2
	ldr r5, [sp, #0x14]
	adds r3, r5, r2
	ldr r0, [r3]
	mov r1, r8
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, [sp, #0x10]
	adds r2, r0, r2
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	subs r0, #8
	ldr r1, [sp, #8]
	asrs r6, r1, #0x10
	adds r0, r6, r0
	strh r0, [r7, #0x16]
	ldr r0, [r3]
	mov r3, r8
	ands r0, r3
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	ldr r1, [sp, #0xc]
	asrs r5, r1, #0x10
	adds r0, r5, r0
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r1, r4, #0x18
	asrs r4, r4, #0x18
	cmp r4, #5
	ble _0803AEE0
	movs r7, #0x81
	lsls r7, r7, #3
	add r7, sl
	movs r4, #0x87
	lsls r4, r4, #3
	add r4, sl
	ldr r2, _0803B004 @ =gSineTable
	ldr r3, [sp, #0x18]
	ldr r0, [r3]
	ldr r3, _0803B000 @ =0x000003FF
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov sb, r0
	mov r1, sl
	ldr r0, [r1, #0x68]
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #0x17
	subs r0, #8
	adds r0, r6, r0
	strh r0, [r7, #0x16]
	ldr r1, [sp, #0x18]
	ldr r0, [r1]
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r2, sl
	ldr r0, [r2, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0x17
	adds r0, r5, r0
	strh r0, [r7, #0x18]
	ldr r2, _0803B010 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803B014 @ =0x00002060
	orrs r0, r1
	str r0, [r7, #0x10]
	ldr r5, [sp, #0x18]
	ldr r1, [r5]
	ldr r2, [sp, #0x1c]
	ldr r0, [r2]
	subs r0, r1, r0
	adds r1, r1, r0
	ands r1, r3
	strh r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r1, r0
	beq _0803AFC4
	adds r0, r1, #0
	adds r0, #0xa
	strh r0, [r4]
_0803AFC4:
	mov r3, r8
	strh r3, [r4, #2]
	strh r3, [r4, #4]
	ldrh r0, [r7, #0x16]
	strh r0, [r4, #6]
	ldrh r0, [r7, #0x18]
	strh r0, [r4, #8]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8004860
	adds r0, r7, #0
	bl sub_80051E8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AFF8: .4byte gCamera
_0803AFFC: .4byte 0xFFFFEA00
_0803B000: .4byte 0x000003FF
_0803B004: .4byte gSineTable
_0803B008: .4byte 0x00000444
_0803B00C: .4byte 0x00000474
_0803B010: .4byte gUnknown_030054B8
_0803B014: .4byte 0x00002060

@; Refd in gUnknown_080D7AA8
	thumb_func_start sub_803B018
sub_803B018: @ 0x0803B018
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803B084 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r0, #0
	strh r0, [r5, #0xa]
	ldr r6, [r5, #4]
	ldr r0, [r5]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r2, r0, r3
	ldr r0, _0803B088 @ =IWRAM_START + 0x9C
	adds r4, r1, r0
	ldr r0, [r4]
	adds r0, r6, r0
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r2, _0803B08C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bgt _0803B094
	lsls r1, r2, #6
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	rsbs r2, r2, #0
	cmp r2, #7
	ble _0803B06A
	movs r2, #7
_0803B06A:
	ldr r1, _0803B090 @ =gUnknown_080D7A18
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	muls r1, r0, r1
	lsls r0, r2, #6
	subs r1, r1, r0
	ldr r0, [r4]
	subs r0, r0, r1
	b _0803B09C
	.align 2, 0
_0803B084: .4byte gCurTask
_0803B088: .4byte IWRAM_START + 0x9C
_0803B08C: .4byte sub_801EC3C
_0803B090: .4byte gUnknown_080D7A18
_0803B094:
	ldr r0, [r4]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
_0803B09C:
	str r0, [r4]
	adds r2, r5, #0
	adds r2, #0x9c
	ldr r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #5
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r1, r1, r0
	str r1, [r5, #4]
	ldr r1, [r2]
	ldr r0, _0803B124 @ =0x00000E7F
	cmp r1, r0
	bgt _0803B0C4
	adds r0, #1
	str r0, [r2]
_0803B0C4:
	ldr r0, [r2]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803B0D0
	str r1, [r2]
_0803B0D0:
	ldr r0, [r5]
	ldr r3, _0803B128 @ =0xFFFFEA00
	adds r2, r0, r3
	adds r4, r5, #0
	adds r4, #0x98
	ldr r0, [r4]
	adds r0, r6, r0
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r2, _0803B12C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r2, r0, #0
	cmp r2, #0
	bgt _0803B134
	lsls r1, r2, #6
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	rsbs r2, r2, #0
	cmp r2, #7
	ble _0803B10A
	movs r2, #7
_0803B10A:
	ldr r1, _0803B130 @ =gUnknown_080D7A18
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	muls r1, r0, r1
	lsls r0, r2, #6
	subs r1, r1, r0
	ldr r0, [r4]
	subs r0, r0, r1
	b _0803B13C
	.align 2, 0
_0803B124: .4byte 0x00000E7F
_0803B128: .4byte 0xFFFFEA00
_0803B12C: .4byte sub_801EC3C
_0803B130: .4byte gUnknown_080D7A18
_0803B134:
	ldr r0, [r4]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
_0803B13C:
	str r0, [r4]
	adds r2, r4, #0
	ldr r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #5
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r1, r1, r0
	str r1, [r5, #4]
	ldr r1, [r2]
	ldr r0, _0803B178 @ =0x00000E7F
	cmp r1, r0
	bgt _0803B162
	adds r0, #1
	str r0, [r2]
_0803B162:
	ldr r0, [r4]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803B16E
	str r1, [r4]
_0803B16E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803B178: .4byte 0x00000E7F

	thumb_func_start sub_803B17C
sub_803B17C: @ 0x0803B17C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	mov r2, ip
	adds r2, #0x94
	ldr r0, [r2]
	subs r0, #8
	str r0, [r2]
	ldr r1, _0803B244 @ =0x000002FF
	cmp r0, r1
	bgt _0803B19E
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [r2]
_0803B19E:
	ldr r0, [r2]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	movs r2, #0x74
	add r2, ip
	mov sl, r2
	mov r6, ip
	adds r6, #0xac
	mov r5, sl
	ldr r7, _0803B248 @ =gUnknown_080D7A78
	mov r8, r7
_0803B1B6:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B1B6
	ldr r0, [r6]
	subs r0, #1
	str r0, [r6]
	cmp r0, #0
	bne _0803B254
	movs r0, #0xa
	str r0, [r6]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #1
	str r0, [r1]
	movs r4, #0
	movs r0, #0x94
	add r0, ip
	mov sb, r0
	mov r3, ip
	adds r3, #0xa4
	mov r6, sl
	movs r1, #0xc0
	lsls r1, r1, #2
	mov r8, r1
	mov r5, ip
	adds r5, #0x54
	ldr r7, _0803B24C @ =gUnknown_080D7A58
_0803B214:
	lsls r1, r4, #2
	adds r0, r6, r1
	mov r2, r8
	str r2, [r0]
	adds r2, r5, r1
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B214
	movs r0, #0xc0
	lsls r0, r0, #2
	mov r7, sb
	str r0, [r7]
	ldr r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B250
	movs r0, #1
	b _0803B252
	.align 2, 0
_0803B244: .4byte 0x000002FF
_0803B248: .4byte gUnknown_080D7A78
_0803B24C: .4byte gUnknown_080D7A58
_0803B250:
	lsls r0, r1, #1
_0803B252:
	str r0, [r3]
_0803B254:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_803B264
sub_803B264: @ 0x0803B264
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	movs r3, #0
	movs r2, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r2
	cmp r0, #0
	beq _0803B280
	ldr r0, _0803B27C @ =gUnknown_080D7A98
	b _0803B2A4
	.align 2, 0
_0803B27C: .4byte gUnknown_080D7A98
_0803B280:
	lsls r0, r2, #0x11
	lsrs r2, r0, #0x10
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #4
	bhi _0803B2A6
	mov r0, ip
	adds r0, #0xa4
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0803B280
	ldr r1, _0803B2F4 @ =gUnknown_080D7A98
	lsls r0, r3, #1
	adds r0, r0, r1
_0803B2A4:
	ldrh r2, [r0]
_0803B2A6:
	movs r5, #0
	movs r3, #0
	lsls r0, r2, #0x10
	mov r4, ip
	adds r4, #0xac
	asrs r7, r0, #0x10
	mov r6, ip
	adds r6, #0x54
_0803B2B6:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r7
	lsls r1, r1, #0x10
	lsls r2, r3, #2
	adds r2, r6, r2
	lsrs r5, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0803B2B6
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803B2EC
	movs r0, #0xf
	str r0, [r4]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #2
	str r0, [r1]
_0803B2EC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B2F4: .4byte gUnknown_080D7A98

	thumb_func_start sub_803B2F8
sub_803B2F8: @ 0x0803B2F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r4, #0
	movs r7, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r7
	ldr r1, _0803B31C @ =gSineTable
	mov sb, r1
	cmp r0, #0
	beq _0803B324
	ldr r0, _0803B320 @ =gUnknown_080D7AA2
	b _0803B342
	.align 2, 0
_0803B31C: .4byte gSineTable
_0803B320: .4byte gUnknown_080D7AA2
_0803B324:
	lsls r0, r7, #0x19
	lsrs r7, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B344
	adds r0, r6, #0
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r7
	cmp r0, #0
	beq _0803B324
	ldr r0, _0803B468 @ =gUnknown_080D7AA2
	adds r0, r4, r0
_0803B342:
	ldrb r7, [r0]
_0803B344:
	adds r2, r6, #0
	adds r2, #0x94
	adds r3, r6, #0
	adds r3, #0xac
	ldr r1, [r3]
	movs r0, #0x3c
	subs r0, r0, r1
	lsls r0, r0, #3
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	ldr r1, [r2]
	subs r1, r1, r0
	ldr r0, _0803B46C @ =0x000003FF
	ands r1, r0
	str r1, [r2]
	str r1, [r6, #0x74]
	movs r4, #1
	str r2, [sp, #8]
	mov r8, r3
	subs r2, #0x20
	str r2, [sp, #0xc]
	movs r3, #0x90
	adds r3, r3, r6
	mov sl, r3
	str r2, [sp, #0x10]
	ldr r5, _0803B470 @ =gUnknown_080D7A78
	mov ip, r5
_0803B37E:
	lsls r3, r4, #2
	ldr r0, [sp, #0x10]
	adds r3, r0, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B37E
	ldr r1, [r6]
	asrs r1, r1, #8
	mov r0, sl
	ldr r2, [r0]
	subs r2, r2, r7
	ldr r4, _0803B46C @ =0x000003FF
	ands r2, r4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r3, [r6, #0x70]
	muls r0, r3, r0
	asrs r0, r0, #0x17
	adds r1, r1, r0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	lsls r2, r2, #1
	add r2, sb
	movs r5, #0
	ldrsh r2, [r2, r5]
	muls r2, r3, r2
	asrs r2, r2, #0x17
	adds r0, r0, r2
	movs r2, #0
	str r2, [sp]
	ldr r2, _0803B474 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E6D4
	adds r5, r0, #0
	cmp r5, #0
	bgt _0803B478
	movs r0, #0xee
	bl m4aSongNumStart
	movs r0, #0x1e
	mov r3, r8
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0xa0
	movs r0, #4
	str r0, [r1]
	mov r0, sl
	ldr r1, [r0]
	adds r1, r1, r7
	ands r1, r4
	lsls r0, r1, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	add r1, sb
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r1, r1, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r4, #0
	ldr r1, [sp, #0xc]
_0803B440:
	lsls r0, r4, #2
	adds r0, r1, r0
	str r5, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B440
	ldr r3, [sp, #8]
	str r5, [r3]
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x83
	str r1, [sp]
	movs r1, #0x10
	movs r2, #0x80
	movs r3, #0x14
	bl CreateScreenShake
	b _0803B490
	.align 2, 0
_0803B468: .4byte gUnknown_080D7AA2
_0803B46C: .4byte 0x000003FF
_0803B470: .4byte gUnknown_080D7A78
_0803B474: .4byte sub_801EE64
_0803B478:
	mov r5, r8
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _0803B490
	movs r0, #0x1e
	str r0, [r5]
	adds r1, r6, #0
	adds r1, #0xa0
	movs r0, #4
	str r0, [r1]
_0803B490:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803B4A0
sub_803B4A0: @ 0x0803B4A0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x94
	ldr r0, [r1]
	adds r0, #8
	str r0, [r1]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	mov r5, ip
	adds r5, #0x74
	ldr r6, _0803B504 @ =gUnknown_080D7A78
_0803B4BA:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B4BA
	movs r4, #0
	movs r3, #1
	mov r1, ip
	adds r1, #0xa4
	ldr r0, [r1]
	ands r0, r3
	mov r5, ip
	adds r5, #0xac
	cmp r0, #0
	beq _0803B50C
	ldr r0, _0803B508 @ =gUnknown_080D7A98
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0803B52A
	.align 2, 0
_0803B504: .4byte gUnknown_080D7A78
_0803B508: .4byte gUnknown_080D7A98
_0803B50C:
	lsls r3, r3, #1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0803B52C
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _0803B50C
	ldr r0, _0803B574 @ =gUnknown_080D7A98
	lsls r1, r4, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
_0803B52A:
	lsls r3, r0, #1
_0803B52C:
	ldr r0, [r5]
	cmp r0, #0x39
	bhi _0803B558
	movs r4, #0
	mov r6, ip
	adds r6, #0x54
	ldr r7, _0803B578 @ =gUnknown_080D7A58
_0803B53A:
	lsls r1, r4, #2
	adds r2, r6, r1
	ldr r0, [r2]
	subs r0, r0, r3
	str r0, [r2]
	adds r1, r1, r7
	ldr r1, [r1]
	cmp r0, r1
	bge _0803B54E
	str r1, [r2]
_0803B54E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B53A
_0803B558:
	ldr r0, [r5]
	subs r2, r0, #1
	str r2, [r5]
	cmp r2, #0
	bne _0803B56C
	movs r0, #0x50
	str r0, [r5]
	mov r0, ip
	adds r0, #0xa0
	str r2, [r0]
_0803B56C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B574: .4byte gUnknown_080D7A98
_0803B578: .4byte gUnknown_080D7A58

	thumb_func_start sub_803B57C
sub_803B57C: @ 0x0803B57C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	movs r1, #0
	movs r5, #1
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0803B5A0
	ldr r0, _0803B59C @ =gUnknown_080D7A98
	ldrh r0, [r0]
	b _0803B5BC
	.align 2, 0
_0803B59C: .4byte gUnknown_080D7A98
_0803B5A0:
	lsls r5, r5, #1
	adds r1, #1
	cmp r1, #4
	bgt _0803B5C0
	mov r0, ip
	adds r0, #0xa4
	ldr r0, [r0]
	ands r0, r5
	cmp r0, #0
	beq _0803B5A0
	ldr r0, _0803B624 @ =gUnknown_080D7A98
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0803B5BC:
	lsls r0, r0, #0x10
	asrs r5, r0, #0x12
_0803B5C0:
	adds r4, r5, #0
	mov r7, ip
	adds r7, #0xac
	mov sb, r7
	movs r0, #0xa0
	add r0, ip
	mov r8, r0
	mov r3, ip
	adds r3, #0x54
	ldr r6, _0803B628 @ =gUnknown_080D7A58
	movs r2, #5
	mov sl, r2
	movs r1, #7
_0803B5DA:
	adds r4, r4, r5
	ldr r0, [r3]
	subs r0, r0, r4
	str r0, [r3]
	ldr r2, [r6]
	cmp r0, r2
	bge _0803B5F6
	str r2, [r3]
	movs r0, #0x44
	mov r2, sb
	str r0, [r2]
	mov r0, sl
	mov r2, r8
	str r0, [r2]
_0803B5F6:
	adds r3, #4
	adds r6, #4
	subs r1, #1
	cmp r1, #0
	bge _0803B5DA
	ldr r0, [r7]
	subs r0, #1
	str r0, [r7]
	cmp r0, #0
	bne _0803B616
	movs r0, #0x44
	str r0, [r7]
	mov r1, ip
	adds r1, #0xa0
	movs r0, #5
	str r0, [r1]
_0803B616:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B624: .4byte gUnknown_080D7A98
_0803B628: .4byte gUnknown_080D7A58

	thumb_func_start sub_803B62C
sub_803B62C: @ 0x0803B62C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	mov r1, ip
	adds r1, #0x94
	ldr r0, [r1]
	adds r0, #0xc
	str r0, [r1]
	mov r3, ip
	adds r3, #0xac
	ldr r0, [r3]
	movs r2, #0xc0
	lsls r2, r2, #2
	cmp r0, r2
	bls _0803B64E
	str r2, [r1]
_0803B64E:
	ldr r0, [r1]
	mov r1, ip
	str r0, [r1, #0x74]
	movs r4, #1
	adds r6, r3, #0
	mov r5, ip
	adds r5, #0x74
	ldr r7, _0803B6A8 @ =gUnknown_080D7A78
	mov r8, r7
_0803B660:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, r8
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803B660
	ldr r0, [r6]
	subs r1, r0, #1
	str r1, [r6]
	cmp r1, #0
	bne _0803B69E
	movs r0, #0x50
	str r0, [r6]
	mov r0, ip
	adds r0, #0xa0
	str r1, [r0]
_0803B69E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B6A8: .4byte gUnknown_080D7A78

	thumb_func_start sub_803B6AC
sub_803B6AC: @ 0x0803B6AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0xb0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B77C
	subs r0, #1
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803B6D2
	movs r0, #0x8f
	bl m4aSongNumStart
	b _0803B6D8
_0803B6D2:
	movs r0, #0xeb
	bl m4aSongNumStart
_0803B6D8:
	adds r1, r6, #0
	adds r1, #0xb1
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #0xde
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B764
	ldr r0, _0803B74C @ =0x00000275
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0803B750 @ =gUnknown_03005450
	ldr r5, [r1]
	adds r2, #0x50
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _0803B754 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r7, r1
	beq _0803B774
	ldr r0, _0803B758 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B774
	subs r0, r7, r1
	lsls r0, r0, #0x10
	ldr r1, _0803B75C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0803B742
	movs r0, #0xff
_0803B742:
	strb r0, [r1]
	ldr r1, _0803B760 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0803B774
	.align 2, 0
_0803B74C: .4byte 0x00000275
_0803B750: .4byte gUnknown_03005450
_0803B754: .4byte 0x0000C350
_0803B758: .4byte gGameMode
_0803B75C: .4byte gNumLives
_0803B760: .4byte gUnknown_030054A8
_0803B764:
	ldr r0, _0803B7A4 @ =0x00000275
	mov r1, r8
	strh r0, [r1, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
_0803B774:
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0803B77C:
	ldr r0, _0803B7A8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _0803B798
	adds r0, r6, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #4
	bne _0803B798
	ldr r1, _0803B7AC @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_0803B798:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B7A4: .4byte 0x00000275
_0803B7A8: .4byte gCurrentLevel
_0803B7AC: .4byte gUnknown_030054A8

	thumb_func_start sub_803B7B0
sub_803B7B0: @ 0x0803B7B0
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xde
	lsls r0, r0, #2
	adds r4, r3, r0
	adds r1, r3, #0
	adds r1, #0xb1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B810
	adds r2, r3, #0
	adds r2, #0xb2
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B83E
	adds r0, r3, #0
	adds r0, #0xb0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803B7F4
	ldr r0, _0803B7F0 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _0803B800
	.align 2, 0
_0803B7F0: .4byte 0x00000275
_0803B7F4:
	movs r0, #0
	ldr r1, _0803B80C @ =0x00000275
	strh r1, [r4, #0xa]
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r3, r2
_0803B800:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _0803B83C
	.align 2, 0
_0803B80C: .4byte 0x00000275
_0803B810:
	adds r1, r3, #0
	adds r1, #0xb2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B83E
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B83E
	movs r1, #0
	ldr r0, _0803B844 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r4, #0xe6
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0803B848 @ =0x00000399
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_0803B83C:
	strb r0, [r1]
_0803B83E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B844: .4byte 0x00000275
_0803B848: .4byte 0x00000399

	thumb_func_start sub_803B84C
sub_803B84C: @ 0x0803B84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _0803B868
	movs r0, #0
	str r0, [r7, #0x14]
_0803B868:
	ldr r2, [r7, #0x18]
	adds r2, #0x40
	str r2, [r7, #0x18]
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x14]
	adds r1, r1, r0
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	adds r0, r0, r2
	str r0, [r7, #0x10]
	asrs r0, r0, #8
	adds r0, #0x1c
	asrs r1, r1, #8
	ldr r2, _0803B94C @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	movs r0, #0xb7
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B954
	movs r1, #0x9e
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	ldr r6, _0803B950 @ =0xFFFFEA00
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #0x9f
	lsls r2, r2, #2
	add r2, sb
	movs r0, #0x98
	add r0, sb
	mov r8, r0
	ldr r0, [r7, #0x10]
	mov r3, r8
	ldr r1, [r3]
	adds r0, r0, r1
	movs r3, #0xe8
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xa4
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r0, r0, r4
	str r0, [r1]
	movs r2, #0xa5
	lsls r2, r2, #2
	add r2, sb
	mov r5, sb
	adds r5, #0x9c
	ldr r0, [r7, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xaa
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	adds r0, r0, r6
	str r0, [r1]
	movs r2, #0xab
	lsls r2, r2, #2
	add r2, sb
	ldr r0, [r7, #0x10]
	mov r6, r8
	ldr r1, [r6]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r1, #0xb0
	lsls r1, r1, #2
	add r1, sb
	ldr r0, [r7, #0xc]
	adds r0, r0, r4
	str r0, [r1]
	movs r2, #0xb1
	lsls r2, r2, #2
	add r2, sb
	ldr r0, [r7, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	adds r0, r0, r3
	str r0, [r2]
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	str r1, [sp, #0x30]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x28]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x2c]
	movs r5, #0x84
	lsls r5, r5, #1
	add r5, sb
	str r5, [sp, #0x38]
	b _0803BA42
	.align 2, 0
_0803B94C: .4byte sub_801EC3C
_0803B950: .4byte 0xFFFFEA00
_0803B954:
	movs r6, #0
	mov sl, r6
	movs r0, #0x82
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, sb
	str r1, [sp, #0x30]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x28]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x2c]
	movs r5, #0x84
	lsls r5, r5, #1
	add r5, sb
	str r5, [sp, #0x38]
_0803B97C:
	mov r6, sl
	lsls r0, r6, #1
	add r0, sl
	lsls r6, r0, #3
	movs r1, #0xe6
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r1, r0, r6
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	cmp r0, #0x7f
	bgt _0803B99A
	movs r0, #0x80
	str r0, [r1]
_0803B99A:
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r5, r0, r6
	ldr r0, [r5]
	adds r0, #0x28
	str r0, [r5]
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r2, r7, r3
	adds r2, r2, r6
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r4, r0, r6
	ldr r0, [r4]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4]
	asrs r0, r0, #8
	ldr r1, [r2]
	asrs r1, r1, #8
	ldr r2, _0803BA60 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	adds r1, r0, #0
	cmp r1, #0
	bge _0803BA0C
	movs r2, #0xea
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r2, r0, r6
	ldr r0, [r2]
	cmp r0, #0
	beq _0803B9F2
	subs r0, #1
	str r0, [r2]
_0803B9F2:
	lsls r1, r1, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #4
	rsbs r0, r0, #0
	asrs r0, r0, #8
	str r0, [r5]
_0803BA0C:
	mov r3, sl
	lsls r0, r3, #1
	add r0, sl
	lsls r1, r0, #3
	movs r5, #0xea
	lsls r5, r5, #1
	adds r0, r7, r5
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BA34
	movs r6, #0xec
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BA34
	subs r0, #1
	str r0, [r1]
_0803BA34:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #3
	bls _0803B97C
_0803BA42:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BA94
	movs r2, #0x8a
	lsls r2, r2, #2
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803BA64
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r7, #0x18]
	rsbs r0, r0, #0
	b _0803BA7A
	.align 2, 0
_0803BA60: .4byte sub_801EC3C
_0803BA64:
	ldr r0, [r7, #0x14]
	subs r0, #0x20
	str r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	asrs r0, r0, #8
_0803BA7A:
	str r0, [r7, #0x18]
	ldr r1, [r7, #0x18]
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0803BA8A
	movs r0, #0
	str r0, [r7, #0x18]
_0803BA8A:
	ldr r3, [sp, #0x24]
	lsls r1, r3, #8
	ldr r0, [r7, #0x10]
	adds r0, r0, r1
	str r0, [r7, #0x10]
_0803BA94:
	movs r5, #0
	mov sl, r5
_0803BA98:
	mov r6, sl
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r4, r0, #3
	ldr r0, [sp, #0x34]
	adds r5, r0, r4
	ldr r0, [r5]
	adds r0, #0x20
	str r0, [r5]
	ldr r2, [sp, #0x30]
	adds r2, r2, r4
	mov r8, r2
	ldr r2, [r2]
	mov sb, r1
	cmp r2, #0
	ble _0803BAC2
	ldr r3, [sp, #0x28]
	adds r1, r3, r4
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0803BAC2:
	ldr r0, [sp, #0x2c]
	adds r6, r0, r4
	ldr r0, [r6]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r6]
	asrs r0, r0, #8
	adds r0, #5
	ldr r2, [sp, #0x28]
	adds r1, r2, r4
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BB1A
	ldr r3, [sp, #0x38]
	adds r1, r3, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BAFA
	subs r0, #1
	str r0, [r1]
_0803BAFA:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x20
	str r0, [r1]
	ldr r2, [sp, #0x24]
	lsls r1, r2, #8
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r3, sl
	lsls r0, r3, #2
	subs r0, #0x40
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r5]
_0803BB1A:
	mov r0, sb
	add r0, sl
	lsls r1, r0, #3
	ldr r5, [sp, #0x38]
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BB3A
	adds r0, r7, #0
	adds r0, #0x58
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BB3A
	subs r0, #1
	str r0, [r1]
_0803BB3A:
	mov r0, sb
	add r0, sl
	lsls r4, r0, #3
	movs r6, #0x88
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r5, r0, r4
	ldr r0, [r5]
	adds r0, #0x28
	str r0, [r5]
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	mov r8, r0
	ldr r2, [r0]
	cmp r2, #0
	ble _0803BB6C
	movs r3, #0x82
	lsls r3, r3, #1
	adds r1, r7, r3
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0803BB6C:
	movs r6, #0x84
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r6, r0, r4
	ldr r0, [r6]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r6]
	asrs r0, r0, #8
	adds r0, #5
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r7, r2
	adds r1, r1, r4
	ldr r1, [r1]
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	bge _0803BBD2
	movs r3, #0x8a
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r1, r0, r4
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BBB0
	subs r0, #1
	str r0, [r1]
_0803BBB0:
	mov r1, r8
	ldr r0, [r1]
	subs r0, #0x20
	str r0, [r1]
	ldr r2, [sp, #0x24]
	lsls r1, r2, #8
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	mov r3, sl
	lsls r0, r3, #2
	adds r0, #0x40
	rsbs r0, r0, #0
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r5]
_0803BBD2:
	mov r0, sb
	add r0, sl
	lsls r1, r0, #3
	movs r5, #0x8a
	lsls r5, r5, #1
	adds r0, r7, r5
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803BBF8
	movs r6, #0x8c
	lsls r6, r6, #1
	adds r0, r7, r6
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BBF8
	subs r0, #1
	str r0, [r1]
_0803BBF8:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #7
	bhi _0803BC08
	b _0803BA98
_0803BC08:
	ldr r2, [r7, #0x28]
	adds r2, #0x60
	str r2, [r7, #0x28]
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x24]
	adds r1, r1, r0
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x20]
	adds r0, r0, r2
	str r0, [r7, #0x20]
	asrs r0, r0, #8
	adds r0, #0x18
	asrs r1, r1, #8
	ldr r2, _0803BD28 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	str r0, [sp, #0x24]
	cmp r0, #0
	blt _0803BC36
	b _0803BD76
_0803BC36:
	ldr r2, [r7, #0x30]
	cmp r2, #0
	bne _0803BD06
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r1, _0803BD2C @ =gCamera
	mov r8, r1
	ldr r1, [r1]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	str r0, [sp, #0x1c]
	add r0, sp, #4
	strh r2, [r0, #0x1c]
	adds r1, r0, #0
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r1, #0xc]
	subs r0, #0xe8
	strh r0, [r1, #0xe]
	ldr r0, _0803BD30 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _0803BD34 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r2, [r0, #0xa]
	str r2, [sp, #8]
	ldr r5, _0803BD38 @ =0x00000229
	adds r5, r5, r7
	mov sb, r5
	mov r1, sb
	bl sub_8039B54
	ldr r3, _0803BD3C @ =gPseudoRandom
	ldr r0, [r3]
	ldr r6, _0803BD40 @ =0x00196225
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r4, _0803BD44 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r1, [r7, #0x1c]
	asrs r1, r1, #8
	mov r5, r8
	ldr r0, [r5]
	subs r1, r1, r0
	movs r5, #0xf
	adds r0, r2, #0
	ands r0, r5
	adds r1, r1, r0
	str r1, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r4
	str r2, [r3]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov ip, r0
	mov r0, r8
	ldr r0, [r0, #4]
	mov r1, ip
	subs r1, r1, r0
	ands r2, r5
	adds r0, r1, r2
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	str r3, [sp, #0x3c]
	bl sub_8039B54
	ldr r3, [sp, #0x3c]
	ldr r0, [r3]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r2, r4
	ldr r1, [r7, #0x1c]
	asrs r1, r1, #8
	mov sl, r1
	mov r1, r8
	ldr r0, [r1]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	adds r0, r2, #0
	ands r0, r5
	add r0, sl
	str r0, [sp, #0x18]
	muls r2, r6, r2
	adds r2, r2, r4
	str r2, [r3]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	mov r3, r8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	ands r2, r5
	adds r0, r0, r2
	str r0, [sp, #0x1c]
	add r0, sp, #4
	mov r1, sb
	bl sub_8039B54
_0803BD06:
	ldr r1, [r7, #0x28]
	ldr r0, _0803BD48 @ =0x000002FF
	cmp r1, r0
	bgt _0803BD1C
	ldr r0, [r7, #0x30]
	cmp r0, #0
	bne _0803BD18
	movs r0, #1
	str r0, [r7, #0x30]
_0803BD18:
	movs r0, #0
	str r0, [r7, #0x28]
_0803BD1C:
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0803BD4C
	movs r0, #0
	b _0803BD4E
	.align 2, 0
_0803BD28: .4byte sub_801EC3C
_0803BD2C: .4byte gCamera
_0803BD30: .4byte 0x06012980
_0803BD34: .4byte 0x0000026B
_0803BD38: .4byte 0x00000229
_0803BD3C: .4byte gPseudoRandom
_0803BD40: .4byte 0x00196225
_0803BD44: .4byte 0x3C6EF35F
_0803BD48: .4byte 0x000002FF
_0803BD4C:
	movs r0, #1
_0803BD4E:
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x24]
	subs r0, #0x20
	str r0, [r7, #0x24]
	cmp r0, #0
	bge _0803BD5E
	movs r0, #0
	str r0, [r7, #0x24]
_0803BD5E:
	ldr r5, [sp, #0x24]
	lsls r1, r5, #8
	ldr r0, [r7, #0x20]
	adds r0, r0, r1
	str r0, [r7, #0x20]
	ldr r1, [r7, #0x28]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	rsbs r0, r0, #0
	asrs r0, r0, #8
	str r0, [r7, #0x28]
_0803BD76:
	ldr r0, [r7, #0x2c]
	cmp r0, #0
	beq _0803BD90
	movs r6, #0x89
	lsls r6, r6, #2
	adds r0, r7, r6
	ldrh r1, [r0]
	adds r1, #0x30
	ldr r3, _0803BD8C @ =0x000003FF
	adds r2, r3, #0
	b _0803BD9E
	.align 2, 0
_0803BD8C: .4byte 0x000003FF
_0803BD90:
	movs r5, #0x89
	lsls r5, r5, #2
	adds r0, r7, r5
	ldrh r1, [r0]
	subs r1, #0x30
	ldr r6, _0803BDB4 @ =0x000003FF
	adds r2, r6, #0
_0803BD9E:
	ands r1, r2
	strh r1, [r0]
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BDB4: .4byte 0x000003FF

	thumb_func_start sub_803BDB8
sub_803BDB8: @ 0x0803BDB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _0803BE4C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xb4
	adds r0, r0, r1
	mov ip, r0
	ldr r2, _0803BE50 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	movs r3, #0
	str r3, [r0]
	ldr r4, _0803BE54 @ =IWRAM_START + 0x2DC
	adds r2, r1, r4
	movs r0, #5
	strb r0, [r2]
	ldr r5, _0803BE58 @ =IWRAM_START + 0x2DD
	adds r0, r1, r5
	strb r3, [r0]
	ldr r6, _0803BE5C @ =IWRAM_START + 0x2E0
	adds r2, r1, r6
	movs r0, #0x9d
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r2, _0803BE60 @ =IWRAM_START + 0x300
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0803BE64 @ =IWRAM_START + 0x301
	adds r2, r1, r3
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, [r7]
	mov r4, ip
	str r0, [r4, #0xc]
	ldr r0, [r7, #4]
	str r0, [r4, #0x10]
	movs r5, #8
	ldrsh r0, [r7, r5]
	str r0, [r4, #0x14]
	ldr r0, _0803BE68 @ =0xFFFFFD00
	str r0, [r4, #0x18]
	movs r6, #0
	mov r8, r6
	ldr r0, _0803BE6C @ =IWRAM_START + 0x278
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _0803BE70 @ =IWRAM_START + 0x280
	adds r2, r2, r1
	mov sl, r2
	subs r3, #0x85
	adds r3, r1, r3
	str r3, [sp, #0xc]
_0803BE2E:
	mov r4, r8
	lsls r0, r4, #0x18
	asrs r2, r0, #0x18
	adds r3, r0, #0
	cmp r2, #1
	bgt _0803BE78
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r5, [sp, #8]
	adds r1, r5, r1
	ldr r0, [r7]
	ldr r6, _0803BE74 @ =0xFFFFEA00
	adds r0, r0, r6
	b _0803BE8A
	.align 2, 0
_0803BE4C: .4byte gCurTask
_0803BE50: .4byte IWRAM_START + 0xA8
_0803BE54: .4byte IWRAM_START + 0x2DC
_0803BE58: .4byte IWRAM_START + 0x2DD
_0803BE5C: .4byte IWRAM_START + 0x2E0
_0803BE60: .4byte IWRAM_START + 0x300
_0803BE64: .4byte IWRAM_START + 0x301
_0803BE68: .4byte 0xFFFFFD00
_0803BE6C: .4byte IWRAM_START + 0x278
_0803BE70: .4byte IWRAM_START + 0x280
_0803BE74: .4byte 0xFFFFEA00
_0803BE78:
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	ldr r0, [sp, #8]
	adds r1, r0, r1
	ldr r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r0, r2
_0803BE8A:
	str r0, [r1]
	asrs r5, r3, #0x18
	lsls r0, r5, #1
	adds r6, r0, r5
	lsls r4, r6, #3
	ldr r0, [sp, #0xc]
	adds r3, r0, r4
	adds r2, r7, #0
	adds r2, #0x98
	ldr r0, [r7, #4]
	ldr r1, [r2]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r3]
	mov sb, r2
	cmp r5, #1
	bgt _0803BEC4
	mov r2, sl
	adds r3, r2, r4
	movs r4, #8
	ldrsh r2, [r7, r4]
	adds r1, r5, #2
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r3]
	b _0803BED2
_0803BEC4:
	mov r5, sl
	adds r0, r5, r4
	movs r2, #8
	ldrsh r1, [r7, r2]
	lsls r2, r6, #4
	adds r1, r1, r2
	str r1, [r0]
_0803BED2:
	mov r3, r8
	lsls r2, r3, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #1
	adds r4, r1, r2
	lsls r4, r4, #3
	movs r3, #0xe8
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r4
	movs r0, #0x60
	rsbs r0, r0, #0
	subs r0, r0, r1
	mov r5, sb
	ldr r1, [r5]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [r3]
	movs r0, #0xea
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #4
	str r1, [r0]
	movs r0, #0xec
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r4
	movs r1, #0x3c
	str r1, [r0]
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	mov r8, r6
	asrs r2, r2, #0x18
	cmp r2, #3
	ble _0803BE2E
	movs r0, #0
	mov r8, r0
	mov r1, ip
	adds r1, #0x44
	str r1, [sp, #0x18]
	mov r2, ip
	adds r2, #0x48
	str r2, [sp, #0x1c]
	mov r3, ip
	adds r3, #0x4c
	str r3, [sp, #0x20]
	adds r4, r7, #0
	adds r4, #0x2c
	str r4, [sp, #0x40]
	adds r5, r7, #0
	adds r5, #0xc
	str r5, [sp, #0x3c]
	mov r6, ip
	adds r6, #0x50
	str r6, [sp, #0x24]
	mov r0, ip
	adds r0, #0x54
	str r0, [sp, #0x2c]
	adds r1, #0x14
	str r1, [sp, #0x30]
	adds r2, r7, #0
	adds r2, #0x74
	str r2, [sp, #0x34]
	adds r3, r7, #0
	adds r3, #0x54
	str r3, [sp, #0x28]
	adds r4, #0x5c
	str r4, [sp, #0x38]
	ldr r5, _0803C188 @ =gSineTable
	mov sl, r5
	ldr r6, _0803C18C @ =0x000003FF
	mov sb, r6
_0803BF66:
	mov r0, r8
	lsls r5, r0, #0x18
	asrs r5, r5, #0x18
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r1, [sp, #0x18]
	adds r3, r1, r4
	ldr r0, [r3]
	ldr r2, _0803C190 @ =gCamera
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	ldr r6, [sp, #0x1c]
	adds r2, r6, r4
	ldr r0, [r2]
	ldr r6, _0803C190 @ =gCamera
	ldr r1, [r6, #4]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	lsls r0, r0, #8
	str r0, [r3]
	ldr r0, [r2]
	lsls r0, r0, #8
	str r0, [r2]
	ldr r0, [sp, #0x20]
	adds r0, r0, r4
	mov r8, r0
	movs r2, #8
	ldrsh r1, [r7, r2]
	str r1, [sp, #0x44]
	lsls r2, r5, #2
	ldr r3, [sp, #0x40]
	adds r6, r3, r2
	ldr r0, [r6]
	mov r1, sb
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x3c]
	adds r2, r0, r2
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	ldr r1, [sp, #0x44]
	adds r3, r1, r0
	mov r0, r8
	str r3, [r0]
	ldr r1, [sp, #0x24]
	adds r3, r1, r4
	ldr r0, [r6]
	mov r6, sb
	ands r0, r6
	lsls r0, r0, #1
	add r0, sl
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r3]
	ldr r0, [sp, #0x2c]
	adds r1, r0, r4
	movs r0, #3
	str r0, [r1]
	ldr r1, [sp, #0x30]
	adds r4, r1, r4
	movs r0, #0x1e
	str r0, [r4]
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r2, r5, #0x18
	mov r8, r2
	asrs r5, r5, #0x18
	cmp r5, #7
	ble _0803BF66
	ldr r3, [r7]
	str r3, [sp]
	ldr r4, [r7, #4]
	str r4, [sp, #4]
	movs r5, #0
	mov r8, r5
	movs r6, #0x82
	lsls r6, r6, #1
	add r6, ip
	str r6, [sp, #0x10]
	ldr r0, _0803C188 @ =gSineTable
	mov sl, r0
	ldr r1, _0803C18C @ =0x000003FF
	mov sb, r1
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, ip
	str r2, [sp, #0x14]
_0803C02E:
	mov r3, r8
	lsls r4, r3, #0x18
	asrs r4, r4, #0x18
	lsls r5, r4, #1
	adds r5, r5, r4
	lsls r5, r5, #3
	ldr r6, [sp, #0x10]
	adds r2, r6, r5
	lsls r6, r4, #2
	ldr r0, [sp, #0x34]
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [sp, #0x28]
	adds r6, r0, r6
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	str r0, [r2]
	ldr r3, [sp, #0x14]
	adds r2, r3, r5
	mov r1, r8
	ldr r0, [r1]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r0, r0, r3
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp, #4]
	adds r0, r1, r0
	str r0, [r2]
	movs r3, #0x86
	lsls r3, r3, #1
	add r3, ip
	adds r3, r3, r5
	str r3, [sp, #0x44]
	movs r3, #8
	ldrsh r2, [r7, r3]
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [sp, #0x44]
	str r2, [r0]
	movs r2, #0x88
	lsls r2, r2, #1
	add r2, ip
	adds r2, r2, r5
	mov r1, r8
	ldr r0, [r1]
	mov r3, sb
	ands r0, r3
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r6]
	muls r0, r1, r0
	asrs r0, r0, #0x12
	str r0, [r2]
	movs r0, #0x8a
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #3
	str r1, [r0]
	movs r0, #0x8c
	lsls r0, r0, #1
	add r0, ip
	adds r0, r0, r5
	movs r1, #0x1e
	str r1, [r0]
	adds r4, #1
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	mov r8, r5
	asrs r4, r4, #0x18
	cmp r4, #7
	ble _0803C02E
	movs r6, #0x87
	lsls r6, r6, #3
	adds r3, r7, r6
	ldr r1, [sp, #0x38]
	ldr r0, [r1]
	ldr r2, _0803C18C @ =0x000003FF
	ands r0, r2
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r5, _0803C188 @ =gSineTable
	adds r0, r0, r5
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r1, [sp]
	adds r0, r1, r0
	mov r4, ip
	str r0, [r4, #0x1c]
	ldr r5, [sp, #0x38]
	ldr r0, [r5]
	ands r0, r2
	lsls r0, r0, #1
	ldr r6, _0803C188 @ =gSineTable
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7, #0x68]
	muls r0, r1, r0
	asrs r0, r0, #0xf
	ldr r4, [sp, #4]
	adds r0, r4, r0
	mov r5, ip
	str r0, [r5, #0x20]
	movs r6, #8
	ldrsh r0, [r7, r6]
	str r0, [r5, #0x24]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	ldr r2, _0803C194 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r5, #0x28]
	ldrh r1, [r3]
	movs r0, #0x89
	lsls r0, r0, #2
	add r0, ip
	movs r2, #0
	strh r1, [r0]
	movs r0, #1
	str r0, [r5, #0x2c]
	str r2, [r5, #0x30]
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C188: .4byte gSineTable
_0803C18C: .4byte 0x000003FF
_0803C190: .4byte gCamera
_0803C194: .4byte 0xFFFFF800

	thumb_func_start sub_803C198
sub_803C198: @ 0x0803C198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	mov r7, sb
	adds r7, #0xb4
	mov r5, sb
	adds r5, #0xa8
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r1, #0x3c
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	bne _0803C256
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	mov r8, r1
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	ldr r2, _0803C310 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803C318 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	ldr r1, _0803C31C @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r2, _0803C320 @ =gUnknown_080D79D0
	mov r3, r8
	lsls r1, r3, #1
	add r1, r8
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _0803C324 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r3, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r3, #8]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	strh r0, [r3, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	ldr r1, _0803C328 @ =0x000002DD
	add r1, sb
	mov r0, sp
	bl sub_8039B54
_0803C256:
	ldr r2, _0803C310 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803C314 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803C318 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5]
	adds r0, r0, r1
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0803C278
	movs r0, #0x90
	bl m4aSongNumStart
_0803C278:
	movs r6, #0xb8
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r2, _0803C30C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	mov r1, sb
	adds r1, #0xb3
	str r1, [sp, #0x20]
	mov r2, sb
	adds r2, #0xf8
	str r2, [sp, #0x24]
	mov r3, sb
	adds r3, #0xfc
	str r3, [sp, #0x28]
	movs r0, #0x84
	lsls r0, r0, #1
	add r0, sb
	str r0, [sp, #0x2c]
	mov r5, sp
	movs r2, #0
	movs r1, #1
	mov r8, r1
	ldr r3, _0803C32C @ =0x06012980
	mov sl, r3
_0803C2C6:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C338
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C330 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C334 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C344
	.align 2, 0
_0803C30C: .4byte gCamera
_0803C310: .4byte gPseudoRandom
_0803C314: .4byte 0x00196225
_0803C318: .4byte 0x3C6EF35F
_0803C31C: .4byte 0x000003FF
_0803C320: .4byte gUnknown_080D79D0
_0803C324: .4byte 0x06010000
_0803C328: .4byte 0x000002DD
_0803C32C: .4byte 0x06012980
_0803C330: .4byte 0x0000026B
_0803C334: .4byte 0x00000229
_0803C338:
	cmp r4, #0x3c
	bls _0803C344
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C344:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C398
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C390 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C394 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C3A4
	.align 2, 0
_0803C390: .4byte 0x0000026B
_0803C394: .4byte 0x00000229
_0803C398:
	cmp r4, #0x3c
	bls _0803C3A4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C3A4:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C3F8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	adds r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C3F0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C3F4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C404
	.align 2, 0
_0803C3F0: .4byte 0x0000026B
_0803C3F4: .4byte 0x00000229
_0803C3F8:
	cmp r4, #0x3c
	bls _0803C404
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C404:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C458
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	adds r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #0x10
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C450 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C454 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C464
	.align 2, 0
_0803C450: .4byte 0x0000026B
_0803C454: .4byte 0x00000229
_0803C458:
	cmp r4, #0x3c
	bls _0803C464
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C464:
	adds r0, r4, #0
	adds r0, #0xf
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x3c
	bne _0803C4B8
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r3, #0x18
	ldrsh r0, [r6, r3]
	subs r0, #8
	str r0, [sp, #0x18]
	strh r2, [r5, #0x1c]
	movs r0, #0xfa
	lsls r0, r0, #2
	strh r0, [r5, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r5, #0xe]
	mov r3, sl
	str r3, [sp]
	ldr r0, _0803C4B0 @ =0x0000026B
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #1
	str r0, [sp, #4]
	mov r0, sp
	ldr r3, _0803C4B4 @ =0x00000229
	adds r1, r7, r3
	str r2, [sp, #0x30]
	bl sub_8039B54
	movs r4, #0
	ldr r2, [sp, #0x30]
	b _0803C4C4
	.align 2, 0
_0803C4B0: .4byte 0x0000026B
_0803C4B4: .4byte 0x00000229
_0803C4B8:
	cmp r4, #0x3c
	bls _0803C4C4
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803C4C4:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	blt _0803C4D2
	b _0803C2C6
_0803C4D2:
	movs r2, #0x16
	ldrsh r0, [r6, r2]
	cmp r0, #0x31
	bgt _0803C4F6
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C4F6
	movs r0, #1
	strb r0, [r3]
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r2, #0x80
	lsls r2, r2, #6
	bl sub_8039FA4
_0803C4F6:
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r4, _0803C7C0 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0803C528
	movs r1, #0
	strh r1, [r7]
	strh r1, [r7, #4]
	movs r0, #2
	strh r0, [r7, #2]
	strh r1, [r7, #6]
	movs r0, #0xbf
	strh r0, [r7, #8]
	strh r1, [r7, #0xa]
	mov r0, sb
	adds r0, #0xa8
	str r1, [r0]
	ldr r0, _0803C7C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803C7C8 @ =sub_803AA40
	str r0, [r1, #8]
_0803C528:
	ldr r3, [sp, #0x20]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0803C556
	movs r6, #0xde
	lsls r6, r6, #2
	add r6, sb
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x10]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803C556:
	movs r1, #0xea
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C572
	movs r2, #0xec
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5A4
_0803C572:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xe2
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803C5A4:
	movs r2, #0xf6
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C5C0
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C5EE
_0803C5C0:
	movs r6, #0xea
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0xee
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
_0803C5EE:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C60A
	movs r2, #0x82
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C63E
_0803C60A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r3, #0xfa
	lsls r3, r3, #1
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0803C63E:
	movs r2, #0x87
	lsls r2, r2, #2
	adds r0, r7, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C65A
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C688
_0803C65A:
	movs r6, #0xf6
	lsls r6, r6, #2
	add r6, sb
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r7, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
_0803C688:
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	movs r0, #6
	mov r8, r0
	ldr r1, _0803C7C0 @ =gCamera
	mov sl, r1
	ldr r2, [sp, #0x2c]
	adds r2, #0x90
	ldr r5, [sp, #0x28]
	adds r5, #0x90
	ldr r4, [sp, #0x24]
	adds r4, #0x90
	movs r3, #0x90
_0803C6AA:
	ldr r0, [r4]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x38]
	mov r0, sl
	ldr r0, [r0, #4]
	ldr r1, [sp, #0x38]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	ldr r0, [r2]
	cmp r0, #0
	bne _0803C6EA
	adds r0, r7, #0
	adds r0, #0x58
	adds r0, r0, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C6F8
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C6F8
_0803C6EA:
	adds r0, r6, #0
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	bl sub_80051E8
	ldr r3, [sp, #0x34]
	ldr r2, [sp, #0x30]
_0803C6F8:
	subs r2, #0x18
	subs r5, #0x18
	subs r4, #0x18
	subs r3, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C6AA
	movs r6, #0xc6
	lsls r6, r6, #2
	add r6, sb
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r5, _0803C7C0 @ =gCamera
	movs r4, #0
	movs r2, #5
	mov r8, r2
_0803C720:
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	movs r1, #0x84
	lsls r1, r1, #1
	adds r0, r7, r1
	adds r0, r0, r4
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r5, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	movs r2, #0x8a
	lsls r2, r2, #1
	adds r0, r7, r2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C76C
	adds r3, #0x14
	adds r0, r7, r3
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C772
	mov r0, sb
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C772
_0803C76C:
	adds r0, r6, #0
	bl sub_80051E8
_0803C772:
	adds r4, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _0803C720
	movs r6, #0x81
	lsls r6, r6, #3
	add r6, sb
	movs r3, #0x87
	lsls r3, r3, #3
	add r3, sb
	ldr r0, [r7, #0x1c]
	asrs r0, r0, #8
	ldr r2, _0803C7C0 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r7, #0x20]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r2, _0803C7CC @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803C7D0 @ =0x00002060
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803C7D4
	movs r0, #2
	str r0, [r7, #0x30]
	b _0803C7FC
	.align 2, 0
_0803C7C0: .4byte gCamera
_0803C7C4: .4byte gCurTask
_0803C7C8: .4byte sub_803AA40
_0803C7CC: .4byte gUnknown_030054B8
_0803C7D0: .4byte 0x00002060
_0803C7D4:
	movs r2, #0x89
	lsls r2, r2, #2
	adds r0, r7, r2
	ldrh r0, [r0]
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r3, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r3, #8]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_0803C7FC:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803C80C
sub_803C80C: @ 0x0803C80C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0803C8D4 @ =gActiveBossTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, _0803C8D8 @ =IWRAM_START + 0xB4
	adds r0, r0, r2
	mov ip, r0
	ldr r0, [r0, #0xc]
	adds r0, r0, r4
	mov r3, ip
	str r0, [r3, #0xc]
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r0, [r3, #0x10]
	adds r0, r0, r5
	str r0, [r3, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r5
	str r0, [r1, #4]
	movs r3, #0
	ldr r0, _0803C8DC @ =IWRAM_START + 0x278
	adds r7, r2, r0
	ldr r1, _0803C8E0 @ =IWRAM_START + 0x27C
	adds r6, r2, r1
_0803C848:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
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
	cmp r3, #3
	bls _0803C848
	movs r3, #0
	mov r7, ip
	adds r7, #0x44
	mov r6, ip
	adds r6, #0x48
_0803C872:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
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
	cmp r3, #7
	bls _0803C872
	movs r3, #0
	movs r7, #0x82
	lsls r7, r7, #1
	add r7, ip
	movs r6, #0x84
	lsls r6, r6, #1
	add r6, ip
_0803C8A0:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #3
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
	cmp r3, #7
	bls _0803C8A0
	mov r3, ip
	ldr r0, [r3, #0x1c]
	adds r0, r0, r4
	str r0, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	adds r0, r0, r5
	str r0, [r3, #0x20]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C8D4: .4byte gActiveBossTask
_0803C8D8: .4byte IWRAM_START + 0xB4
_0803C8DC: .4byte IWRAM_START + 0x278
_0803C8E0: .4byte IWRAM_START + 0x27C

	thumb_func_start TaskDestructor_EggHammerTankIIMain
TaskDestructor_EggHammerTankIIMain: @ 0x0803C8E4
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _0803C958 @ =IWRAM_START + 0x2E4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C95C @ =IWRAM_START + 0x31C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C960 @ =IWRAM_START + 0x34C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C964 @ =IWRAM_START + 0x37C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C968 @ =IWRAM_START + 0x3AC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C96C @ =IWRAM_START + 0x3DC
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C970 @ =IWRAM_START + 0x40C
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _0803C974 @ =IWRAM_START + 0x448
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C93C
	bl VramFree
_0803C93C:
	ldr r1, _0803C978 @ =IWRAM_START + 0x478
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C94A
	bl VramFree
_0803C94A:
	ldr r1, _0803C97C @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C958: .4byte IWRAM_START + 0x2E4
_0803C95C: .4byte IWRAM_START + 0x31C
_0803C960: .4byte IWRAM_START + 0x34C
_0803C964: .4byte IWRAM_START + 0x37C
_0803C968: .4byte IWRAM_START + 0x3AC
_0803C96C: .4byte IWRAM_START + 0x3DC
_0803C970: .4byte IWRAM_START + 0x40C
_0803C974: .4byte IWRAM_START + 0x448
_0803C978: .4byte IWRAM_START + 0x478
_0803C97C: .4byte gActiveBossTask

	thumb_func_start Task_803C980
Task_803C980: @ 0x0803C980
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803CA04 @ =gCurTask
	ldr r0, [r7]
	ldrh r6, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r6, r4
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0xa
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r5, _0803CA08 @ =gUnknown_080D7AA8
	bl sub_803CA40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0803CA0C @ =gUnknown_080D7AB0
	ldr r2, _0803CA10 @ =IWRAM_START + 0xA0
	adds r0, r6, r2
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r0, r4, #0
	bl sub_803CB18
	adds r0, r4, #0
	bl sub_803A8E4
	adds r0, r4, #0
	bl sub_803B7B0
	adds r0, r4, #0
	bl sub_803AC2C
	adds r0, r4, #0
	bl sub_803CC3C
	ldr r0, _0803CA14 @ =IWRAM_START + 0xB0
	adds r6, r6, r0
	ldrb r0, [r6]
	cmp r0, #0
	bne _0803C9FE
	bl sub_803BDB8
	ldr r1, [r7]
	ldr r0, _0803CA18 @ =Task_803CA1C
	str r0, [r1, #8]
	bl sub_802A018
_0803C9FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA04: .4byte gCurTask
_0803CA08: .4byte gUnknown_080D7AA8
_0803CA0C: .4byte gUnknown_080D7AB0
_0803CA10: .4byte IWRAM_START + 0xA0
_0803CA14: .4byte IWRAM_START + 0xB0
_0803CA18: .4byte Task_803CA1C

	thumb_func_start Task_803CA1C
Task_803CA1C: @ 0x0803CA1C
	push {r4, lr}
	ldr r0, _0803CA3C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_803B84C
	adds r0, r4, #0
	bl sub_803C198
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA3C: .4byte gCurTask

	thumb_func_start sub_803CA40
sub_803CA40: @ 0x0803CA40
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803CAA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r2, r0, r1
	ldr r0, _0803CAAC @ =IWRAM_START + 0x9C
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	ldr r6, _0803CAB0 @ =sub_801EC3C
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	ldr r0, [r4]
	ldr r1, _0803CAB4 @ =0xFFFFEA00
	adds r2, r0, r1
	ldr r0, _0803CAB8 @ =IWRAM_START + 0x98
	adds r1, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [r1]
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #4
	adds r0, r0, r1
	asrs r0, r0, #8
	asrs r1, r2, #8
	str r6, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	ble _0803CABC
	movs r0, #0
	b _0803CABE
	.align 2, 0
_0803CAA8: .4byte gCurTask
_0803CAAC: .4byte IWRAM_START + 0x9C
_0803CAB0: .4byte sub_801EC3C
_0803CAB4: .4byte 0xFFFFEA00
_0803CAB8: .4byte IWRAM_START + 0x98
_0803CABC:
	movs r0, #1
_0803CABE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@; Refd in gUnknown_080D7AA8
	thumb_func_start sub_803CAC8
sub_803CAC8: @ 0x0803CAC8
	push {lr}
	ldr r0, _0803CB0C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldrh r0, [r1, #0xa]
	adds r0, #0x40
	strh r0, [r1, #0xa]
	ldr r0, _0803CB10 @ =IWRAM_START + 0x9C
	adds r3, r2, r0
	ldr r0, [r3]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0803CB14 @ =IWRAM_START + 0x98
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r3]
	movs r1, #0xbc
	lsls r1, r1, #5
	cmp r0, r1
	ble _0803CB00
	str r1, [r3]
_0803CB00:
	ldr r0, [r2]
	cmp r0, r1
	ble _0803CB08
	str r1, [r2]
_0803CB08:
	pop {r0}
	bx r0
	.align 2, 0
_0803CB0C: .4byte gCurTask
_0803CB10: .4byte IWRAM_START + 0x9C
_0803CB14: .4byte IWRAM_START + 0x98

	thumb_func_start sub_803CB18
sub_803CB18: @ 0x0803CB18
	push {r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x4c]
	adds r1, #8
	ldr r2, _0803CB74 @ =0x000003FF
	ands r1, r2
	str r1, [r0, #0x4c]
	ldr r2, _0803CB78 @ =gSineTable
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	str r1, [r0, #0x50]
	str r1, [r0, #0x2c]
	movs r4, #1
	adds r5, r0, #0
	adds r5, #0x2c
	ldr r0, _0803CB7C @ =gUnknown_080D7A28
	mov ip, r0
	ldr r6, _0803CB80 @ =0xFFFFF400
_0803CB40:
	lsls r3, r4, #2
	adds r3, r5, r3
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r1, [r0]
	ldr r2, [r3]
	subs r1, r1, r2
	lsls r0, r4, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r1, r0
	adds r0, r0, r6
	asrs r0, r0, #8
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bls _0803CB40
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB74: .4byte 0x000003FF
_0803CB78: .4byte gSineTable
_0803CB7C: .4byte gUnknown_080D7A28
_0803CB80: .4byte 0xFFFFF400

	thumb_func_start sub_803CB84
sub_803CB84: @ 0x0803CB84
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0xac
	ldr r0, [r2]
	subs r0, #1
	str r0, [r2]
	cmp r0, #0
	bne _0803CBA0
	movs r0, #0x3c
	str r0, [r2]
	adds r1, #0xa0
	movs r0, #3
	str r0, [r1]
_0803CBA0:
	pop {r0}
	bx r0

	thumb_func_start sub_803CBA4
sub_803CBA4: @ 0x0803CBA4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xac
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bne _0803CBF6
	ldr r2, _0803CBD8 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803CBDC @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0803CBE0 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0803CBE4
	movs r0, #0x44
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #5
	b _0803CBF4
	.align 2, 0
_0803CBD8: .4byte gPseudoRandom
_0803CBDC: .4byte 0x00196225
_0803CBE0: .4byte 0x3C6EF35F
_0803CBE4:
	movs r0, #0xef
	bl m4aSongNumStart
	movs r0, #0x3c
	str r0, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	movs r0, #6
_0803CBF4:
	str r0, [r1]
_0803CBF6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_803CBFC
sub_803CBFC: @ 0x0803CBFC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0xb2
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0xb1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CC2E
	movs r0, #0xde
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0803CC34 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r0, #0xe6
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803CC38 @ =0x00000399
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803CC2E:
	pop {r0}
	bx r0
	.align 2, 0
_0803CC34: .4byte 0x00000275
_0803CC38: .4byte 0x00000399

	thumb_func_start sub_803CC3C
sub_803CC3C: @ 0x0803CC3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r2, #0xb1
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803CC90
	movs r4, #0
	ldr r0, _0803CC9C @ =gFlags
	mov r8, r0
	ldr r1, _0803CCA0 @ =gObjPalette
	mov ip, r1
	ldr r7, _0803CCA4 @ =gUnknown_080D7AD0
	adds r5, r2, #0
	movs r6, #4
_0803CC5C:
	adds r3, r4, #0
	adds r3, #0x80
	lsls r3, r3, #1
	add r3, ip
	lsls r1, r4, #1
	ldrb r2, [r5]
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r3]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0803CC5C
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
_0803CC90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC9C: .4byte gFlags
_0803CCA0: .4byte gObjPalette
_0803CCA4: .4byte gUnknown_080D7AD0
