.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	ldr r2, _0803ECFC @ =gPlayer
	movs r0, #0
	str r0, [r2, #0x3c]
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _0803ED00 @ =gPseudoRandom
	ldr r0, _0803ED04 @ =gStageTime
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803ED08 @ =Task_EggTotemMain
	movs r1, #0xe7
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _0803ED0C @ =TaskDestructor_EggTotemMain
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0         @ r6 = totem
	ldr r0, _0803ED10 @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803ED1C
	ldr r0, _0803ED14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803ED1C
	ldr r0, _0803ED18 @ =IWRAM_START + 0x32
	adds r1, r1, r0
	movs r0, #6
	b _0803ED22
	.align 2, 0
_0803ECFC: .4byte gPlayer
_0803ED00: .4byte gPseudoRandom
_0803ED04: .4byte gStageTime
_0803ED08: .4byte Task_EggTotemMain
_0803ED0C: .4byte TaskDestructor_EggTotemMain
_0803ED10: .4byte gDifficultyLevel
_0803ED14: .4byte gGameMode
_0803ED18: .4byte IWRAM_START + 0x32
_0803ED1C:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #8
_0803ED22:
	strb r0, [r1]
	ldr r0, _0803EE80 @ =gCurrentLevel
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r0
	cmp r1, #0x1c
	beq _0803ED32
	b _0803EEB0
_0803ED32:
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r0, [r1]
	lsrs r0, r0, #1
	strb r0, [r1]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	beq _0803ED48
	b _0803EEB0
_0803ED48:
	ldr r0, _0803EE84 @ =0x00359200
	str r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #8
	str r1, [r6, #4]
	movs r5, #0
	movs r2, #0x3c
	adds r2, r2, r6
	mov sb, r2              @ sb = &totem->unk3C
	movs r3, #0x40
	adds r3, r3, r6
	mov r8, r3
	adds r7, r6, #0
	adds r7, #0x33
	str r7, [sp, #0x3c]     @ sp3C = totem->unk33
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0x40]     @ sp40 = totem->unk34
	adds r3, r6, #0
	adds r3, #0x35
	str r3, [sp, #0x44]     @ sp44 = totem->unk35
	adds r7, #3
	str r7, [sp, #0x48]     @ sp48 = totem->unk36
	movs r2, #0xb4
	adds r2, r2, r6
	mov ip, r2              @ ip = totem->fillerB4
	adds r3, #0x8b
	str r3, [sp, #8]        @ sp08 = totem->fillerC0
	adds r7, #0xaa
	str r7, [sp, #0xc]      @ sp0C = totem->fillerE0
	adds r2, r6, #0
	adds r2, #0xe1
	str r2, [sp, #0x10]     @ sp10 = totem->unkE1
	adds r3, #0x22
	str r3, [sp, #0x14]     @ sp14 = totem->unkE2
	adds r7, #5
	str r7, [sp, #0x18]     @ sp18 = totem->unkE5
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r2, r6, r2
	str r2, [sp, #0x2c]     @ sp2C = totem->unk388
	ldr r3, _0803EE88 @ =0x00000389
	adds r3, r6, r3
	str r3, [sp, #0x30]     @ sp30 = totem->unk389
	ldr r7, _0803EE8C @ =0x0000038A
	adds r7, r6, r7
	str r7, [sp, #0x34]     @ sp34 = totem->unk38A
	ldr r2, _0803EE90 @ =0x0000038D
	adds r2, r6, r2
	str r2, [sp, #0x38]     @ sp38 = totem->unk38D
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r3, r6, r3
	str r3, [sp, #0x1c]     @ sp1C = totem->unk358
	ldr r7, _0803EE94 @ =0x00000359
	adds r7, r6, r7
	str r7, [sp, #0x20]     @ sp20 = totem->unk359
	ldr r2, _0803EE98 @ =0x0000035A
	adds r2, r6, r2
	str r2, [sp, #0x24]     @ sp24 = totem->unk35A
	ldr r3, _0803EE9C @ =0x0000035D
	adds r3, r6, r3
	str r3, [sp, #0x28]     @ sp28 = totem->unk35D
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r7, r6, r7
	str r7, [sp, #0x4c]     @ sp4C = totem->unk2C8
	ldr r2, _0803EEA0 @ =0x000002C9
	adds r2, r6, r2
	str r2, [sp, #0x50]     @ sp50 = totem->unk2C9
	ldr r3, _0803EEA4 @ =0x000002CA
	adds r3, r6, r3
	str r3, [sp, #0x54]     @ sp54 = totem->unk2CA
	ldr r7, _0803EEA8 @ =0x000002CD
	adds r7, r6, r7
	str r7, [sp, #0x58]     @ sp58 = totem->unk2CD
	adds r3, r6, #0
	adds r3, #0xc
	adds r7, r0, #0
	adds r2, r6, #0
	adds r2, #0x10
	adds r4, r1, #0
_0803EDEC:
	lsls r1, r5, #3
	adds r0, r3, r1
	str r7, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EDEC
	movs r5, #0
	movs r3, #0
	movs r4, #0
_0803EE06:
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #2
	mov r0, sb              @ r0 = sb = &totem->unk3C[i].qWorldX
	adds r2, r0, r1
	ldr r0, _0803EE84 @ =0x00359200
	str r0, [r2]
	mov r7, r8              @ r7 = r8 = &totem->unk3C[i].qWorldY
	adds r2, r7, r1
	lsls r0, r5, #1
	ldr r7, _0803EEAC @ =sTotemDiscYs
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r7, #0xaa
	lsls r7, r7, #8
	adds r0, r0, r7
	str r0, [r2]            @ totem->unk3C[i].qWorldY = Q(170)
	adds r2, r6, r1
	adds r0, r2, #0
	adds r0, #0x44
	strh r4, [r0]           @ totem->unk3C[i].unk8 = 0;
	adds r0, #2
	strh r4, [r0]           @ totem->unk3C[i].unkA = 0;
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]           @ totem->unk3C[i].unkC = Q(3);
	adds r0, r2, #0
	adds r0, #0x4e
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #5
	strh r4, [r0]           @ totem->unk3C[i].unkE = 0;
	adds r0, #2
	strh r4, [r0]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0803EE64
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
_0803EE64:
	adds r0, r2, #0
	adds r0, #0x53
	strb r3, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EE06
	b _0803F038
	.align 2, 0
_0803EE80: .4byte gCurrentLevel
_0803EE84: .4byte 0x00359200
_0803EE88: .4byte 0x00000389
_0803EE8C: .4byte 0x0000038A
_0803EE90: .4byte 0x0000038D
_0803EE94: .4byte 0x00000359
_0803EE98: .4byte 0x0000035A
_0803EE9C: .4byte 0x0000035D
_0803EEA0: .4byte 0x000002C9
_0803EEA4: .4byte 0x000002CA
_0803EEA8: .4byte 0x000002CD
_0803EEAC: .4byte sTotemDiscYs
_0803EEB0:
	movs r0, #0xaa
	lsls r0, r0, #0xa
	str r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #8
	str r1, [r6, #4]
	movs r5, #0
	movs r2, #0x3c
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x40
	adds r3, r3, r6
	mov r8, r3
	adds r7, r6, #0
	adds r7, #0x33
	str r7, [sp, #0x3c]
	adds r2, r6, #0
	adds r2, #0x34
	str r2, [sp, #0x40]
	adds r3, r6, #0
	adds r3, #0x35
	str r3, [sp, #0x44]
	adds r7, #3
	str r7, [sp, #0x48]
	movs r2, #0xb4
	adds r2, r2, r6
	mov ip, r2
	adds r3, #0x8b
	str r3, [sp, #8]
	adds r7, #0xaa
	str r7, [sp, #0xc]
	adds r2, r6, #0
	adds r2, #0xe1
	str r2, [sp, #0x10]
	adds r3, #0x22
	str r3, [sp, #0x14]
	adds r7, #5
	str r7, [sp, #0x18]
	movs r2, #0xe2
	lsls r2, r2, #2
	adds r2, r6, r2
	str r2, [sp, #0x2c]
	ldr r3, _0803EFDC @ =0x00000389
	adds r3, r6, r3
	str r3, [sp, #0x30]
	ldr r7, _0803EFE0 @ =0x0000038A
	adds r7, r6, r7
	str r7, [sp, #0x34]
	ldr r2, _0803EFE4 @ =0x0000038D
	adds r2, r6, r2
	str r2, [sp, #0x38]
	movs r3, #0xd6
	lsls r3, r3, #2
	adds r3, r6, r3
	str r3, [sp, #0x1c]
	ldr r7, _0803EFE8 @ =0x00000359
	adds r7, r6, r7
	str r7, [sp, #0x20]
	ldr r2, _0803EFEC @ =0x0000035A
	adds r2, r6, r2
	str r2, [sp, #0x24]
	ldr r3, _0803EFF0 @ =0x0000035D
	adds r3, r6, r3
	str r3, [sp, #0x28]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r7, r6, r7
	str r7, [sp, #0x4c]
	ldr r2, _0803EFF4 @ =0x000002C9
	adds r2, r6, r2
	str r2, [sp, #0x50]
	ldr r3, _0803EFF8 @ =0x000002CA
	adds r3, r6, r3
	str r3, [sp, #0x54]
	ldr r7, _0803EFFC @ =0x000002CD
	adds r7, r6, r7
	str r7, [sp, #0x58]
	adds r3, r6, #0
	adds r3, #0xc
	adds r7, r0, #0
	adds r2, r6, #0
	adds r2, #0x10
	adds r4, r1, #0
_0803EF56:
	lsls r1, r5, #3
	adds r0, r3, r1
	str r7, [r0]
	adds r1, r2, r1
	str r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EF56
	movs r5, #0
	movs r4, #0
	ldr r0, _0803F000 @ =gGameMode
	mov sl, r0
_0803EF72:
	lsls r3, r5, #3
	subs r2, r3, r5
	lsls r2, r2, #2
	mov r7, sb
	adds r1, r7, r2
	movs r0, #0xaa
	lsls r0, r0, #0xa
	str r0, [r1]
	mov r0, r8
	adds r1, r0, r2
	lsls r0, r5, #1
	ldr r7, _0803F004 @ =sTotemDiscYs
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	movs r7, #0xaa
	lsls r7, r7, #8
	adds r0, r0, r7
	str r0, [r1]
	adds r2, r6, r2
	adds r0, r2, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #5
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r7, _0803F008 @ =gDifficultyLevel
	ldrb r0, [r7]
	cmp r0, #0
	beq _0803F00C
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #2
	beq _0803F00C
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #1
	strb r0, [r1]
	b _0803F018
	.align 2, 0
_0803EFDC: .4byte 0x00000389
_0803EFE0: .4byte 0x0000038A
_0803EFE4: .4byte 0x0000038D
_0803EFE8: .4byte 0x00000359
_0803EFEC: .4byte 0x0000035A
_0803EFF0: .4byte 0x0000035D
_0803EFF4: .4byte 0x000002C9
_0803EFF8: .4byte 0x000002CA
_0803EFFC: .4byte 0x000002CD
_0803F000: .4byte gGameMode
_0803F004: .4byte sTotemDiscYs
_0803F008: .4byte gDifficultyLevel
_0803F00C:
	subs r0, r3, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r0, #0x50
	movs r1, #3
	strb r1, [r0]
_0803F018:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r6, r0
	adds r1, r0, #0
	adds r1, #0x53
	strb r4, [r1]
	subs r1, #2
	strb r4, [r1]
	adds r0, #0x52
	strb r4, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803EF72
_0803F038:
	movs r5, #0
	movs r4, #0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r6, #8]       @ TODO: We have these declared as Vec2_32!?
	strh r4, [r6, #0xa]
	movs r0, #0xf0
	ldr r2, [sp, #0x3c]
	strb r0, [r2]
	strh r4, [r6, #0x30]
	ldr r3, [sp, #0x40]
	strb r5, [r3]
	ldr r7, [sp, #0x44]
	strb r5, [r7]
	ldr r0, [sp, #0x48]
	strb r5, [r0]
	movs r0, #0x78
	mov r1, ip              @ r1 = ip = &totem->tilesEggman
	str r0, [r1]
	movs r0, #8
	bl VramMalloc
	movs r2, #0xe6
	lsls r2, r2, #2
	adds r1, r6, r2
	str r0, [r1]
	ldr r7, [sp, #8]
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x78
	bl VramMalloc
	str r0, [r7, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r3, r3, r0
	mov ip, r3              @ ip = r3 = s->graphics.dest + 0x400
	ldr r1, _0803F37C @ =0x0000028B
	strh r1, [r7, #0xa]
	ldr r1, [sp, #0xc]
	strb r5, [r1]
	movs r2, #0xb8
	lsls r2, r2, #3
	mov r8, r2      @ r8 = r2 = 0x5C0
	mov r3, r8
	strh r3, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r1, #0xff
	ldr r2, [sp, #0x10]
	strb r1, [r2]
	movs r3, #0x10
	mov sb, r3
	mov r2, sb
	ldr r1, [sp, #0x14]
	strb r2, [r1]
	ldr r3, [sp, #0x18]
	strb r5, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r3, #0xda
	lsls r3, r3, #2
	adds r7, r6, r3
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r3, ip
	str r3, [r7, #4]
	movs r3, #0x88
	lsls r3, r3, #4
	adds r3, r3, r0
	mov ip, r3
	ldr r0, _0803F380 @ =0x0000028A
	strh r0, [r7, #0xa]
	ldr r0, [sp, #0x2c]
	strb r5, [r0]
	mov r3, r8
	strh r3, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov sl, r2
	mov r3, sl
	ldr r0, [sp, #0x30]
	strb r3, [r0]
	mov r3, sb
	ldr r0, [sp, #0x34]
	strb r3, [r0]
	ldr r0, [sp, #0x38]
	strb r5, [r0]
	str r2, [r7, #0x28]
	str r1, [r7, #0x10]
	movs r3, #0xce
	lsls r3, r3, #2
	adds r7, r6, r3
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	mov r0, ip
	str r0, [r7, #4]
	movs r0, #0xa5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r3, [sp, #0x1c]
	strb r5, [r3]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r0, r2, #0
	ldr r3, [sp, #0x20]
	strb r0, [r3]
	mov r3, sb
	ldr r0, [sp, #0x24]
	strb r3, [r0]
	ldr r0, [sp, #0x28]
	strb r5, [r0]
	str r2, [r7, #0x28]
	str r1, [r7, #0x10]
	movs r5, #0
	movs r1, #0
	mov r8, r1
	movs r2, #0
_0803F136:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0xf8
	adds r7, r6, r0
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	ldr r0, _0803F384 @ =gUnknown_080D7BB0
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _0803F388 @ =sOamOrderIds
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #6
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x5c]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	mov r3, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803F136
	movs r5, #0
	movs r2, #0
	movs r4, #0
	ldr r7, _0803F38C @ =0x0000028F
	mov r8, r7
_0803F1A8:
	lsls r0, r5, #6
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r7, r6, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x1e
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	mov r3, r8
	strh r3, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	ldr r2, [sp, #0x5c]
	strb r2, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803F1A8
	movs r5, #0
	movs r2, #0
_0803F206:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r7, #0x92
	lsls r7, r7, #2
	adds r0, r0, r7
	adds r7, r6, r0
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	ldr r0, _0803F390 @ =gUnknown_080D7BC8
	lsls r4, r5, #3
	adds r4, r4, r0
	ldr r0, [r4]
	str r2, [sp, #0x5c]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x5c]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r3, #1
	rsbs r3, r3, #0
	mov r8, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	str r1, [r7, #0x10]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _0803F206
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r7, r6, r2
	movs r5, #0
	movs r4, #0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0803F394 @ =0x00000275
	strh r0, [r7, #0xa]
	ldr r3, [sp, #0x4c]
	strb r5, [r3]
	movs r0, #0xb0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, [sp, #0x50]
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x10
	ldr r3, [sp, #0x54]
	strb r0, [r3]
	ldr r1, [sp, #0x58]
	strb r5, [r1]
	mov r2, sl
	str r2, [r7, #0x28]
	mov r3, sb
	str r3, [r7, #0x10]
	ldr r2, _0803F398 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _0803F3BC
	ldr r0, _0803F39C @ =gSelectedCharacter
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	bne _0803F3BC
	ldr r0, _0803F3A0 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _0803F3BC
__tails_kidnap:
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r7, r6, r0
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x1e
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xde
	strh r0, [r7, #0xa]
	movs r1, #0xbe
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r5, [r0]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, _0803F3A4 @ =0x000002F9
	adds r1, r6, r2
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803F3A8 @ =0x000002FA
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _0803F3AC @ =0x000002FD
	adds r0, r6, r3
	strb r5, [r0]
	mov r0, sl
	str r0, [r7, #0x28]
	mov r1, sb
	str r1, [r7, #0x10]
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r7, r6, r2
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x14
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0xa4
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r3, #0xca
	lsls r3, r3, #2
	adds r0, r6, r3
	strb r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r2, _0803F3B0 @ =0x00000329
	adds r1, r6, r2
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0803F3B4 @ =0x0000032A
	adds r0, r6, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r3, _0803F3B8 @ =0x0000032D
	adds r0, r6, r3
	strb r5, [r0]
	mov r0, sl
	str r0, [r7, #0x28]
	mov r1, sb
	str r1, [r7, #0x10]
	b _0803F3CE
	.align 2, 0
_0803F37C: .4byte 0x0000028B
_0803F380: .4byte 0x0000028A
_0803F384: .4byte gUnknown_080D7BB0
_0803F388: .4byte sOamOrderIds
_0803F38C: .4byte 0x0000028F
_0803F390: .4byte gUnknown_080D7BC8
_0803F394: .4byte 0x00000275
_0803F398: .4byte gCurrentLevel
_0803F39C: .4byte gSelectedCharacter
_0803F3A0: .4byte gLoadedSaveGame
_0803F3A4: .4byte 0x000002F9
_0803F3A8: .4byte 0x000002FA
_0803F3AC: .4byte 0x000002FD
_0803F3B0: .4byte 0x00000329
_0803F3B4: .4byte 0x0000032A
_0803F3B8: .4byte 0x0000032D
_0803F3BC:
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r6, r2
	movs r1, #0
	str r1, [r0]
	movs r3, #0xc3
	lsls r3, r3, #2
	adds r0, r6, r3
	str r1, [r0]
_0803F3CE:
	ldr r0, _0803F3E4 @ =gActiveBossTask
	ldr r7, [sp, #4]
	str r7, [r0]
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F3E4: .4byte gActiveBossTask

.syntax divided
