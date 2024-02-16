.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

	thumb_func_start CreateAeroEgg
CreateAeroEgg: @ 0x0804156C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _080415C8 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	bl sub_8039ED4
	ldr r1, _080415CC @ =gPseudoRandom
	ldr r0, _080415D0 @ =gStageTime
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _080415D4 @ =Task_AeroEggMain
	movs r1, #0xaa
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r3, _080415D8 @ =TaskDestructor_AeroEggMain
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldr r1, _080415DC @ =gActiveBossTask
	str r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sl, r1
	ldr r0, _080415E0 @ =gDifficultyLevel
	ldrb r0, [r0]
	cmp r0, #0
	beq _080415E8
	ldr r0, _080415E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	beq _080415E8
	movs r0, #6
	b _080415EC
	.align 2, 0
_080415C8: .4byte gPlayer
_080415CC: .4byte gPseudoRandom
_080415D0: .4byte gStageTime
_080415D4: .4byte Task_AeroEggMain
_080415D8: .4byte TaskDestructor_AeroEggMain
_080415DC: .4byte gActiveBossTask
_080415E0: .4byte gDifficultyLevel
_080415E4: .4byte gGameMode
_080415E8:
	movs r0, #8
	mov r1, sl
_080415EC:
	strb r0, [r1, #0x14]
	ldr r1, _08041614 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0804161C
	mov r2, sl
	ldrb r0, [r2, #0x14]
	lsrs r0, r0, #1
	strb r0, [r2, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1c
	bne _0804161C
	ldr r0, _08041618 @ =0x00466E00
	str r0, [r2, #4]
	movs r0, #0xb4
	lsls r0, r0, #7
	str r0, [r2, #8]
	b _0804162A
	.align 2, 0
_08041614: .4byte gCurrentLevel
_08041618: .4byte 0x00466E00
_0804161C:
	movs r0, #0xdc
	lsls r0, r0, #0xa
	mov r1, sl
	str r0, [r1, #4]
	movs r0, #0xb4
	lsls r0, r0, #7
	str r0, [r1, #8]
_0804162A:
	movs r5, #0
	movs r4, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	mov r2, sl
	strh r6, [r2, #0xc]
	strh r4, [r2, #0xe]
	strb r5, [r2, #0x15]
	strb r5, [r2, #0x16]
	strh r4, [r2, #0x12]
	movs r0, #0x78
	str r0, [r2]
	strh r4, [r2, #0x10]
	strb r5, [r2, #0x17]
	movs r0, #0x2d
	bl VramMalloc
	movs r1, #0xa8
	lsls r1, r1, #1
	add r1, sl
	str r0, [r1]
	mov r7, sl
	adds r7, #0x88
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041780 @ =0x00000295
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0xa8
	strb r5, [r0]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0xa9
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xaa
	movs r1, #0x10
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r6, #1
	rsbs r6, r6, #0
	str r6, [r7, #0x28]
	movs r0, #0x90
	lsls r0, r0, #6
	mov sb, r0
	str r0, [r7, #0x10]
	adds r7, #0x38
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041784 @ =0x00000275
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0xe0
	strb r5, [r0]
	movs r0, #0xa8
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, sl
	adds r1, #0xe1
	adds r0, r6, #0
	strb r0, [r1]
	mov r0, sl
	adds r0, #0xe2
	mov r1, r8
	strb r1, [r0]
	adds r0, #3
	strb r5, [r0]
	str r6, [r7, #0x28]
	mov r2, sb
	str r2, [r7, #0x10]
	adds r7, #0x30
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #8
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041788 @ =0x00000299
	strh r0, [r7, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, _0804178C @ =0x00000111
	add r1, sl
	adds r0, r6, #0
	strb r0, [r1]
	movs r0, #0x89
	lsls r0, r0, #1
	add r0, sl
	mov r1, r8
	strb r1, [r0]
	ldr r0, _08041790 @ =0x00000115
	add r0, sl
	strb r5, [r0]
	str r6, [r7, #0x28]
	movs r2, #0x80
	lsls r2, r2, #6
	mov sb, r2
	str r2, [r7, #0x10]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	movs r7, #0x90
	lsls r7, r7, #1
	add r7, sl
	strh r4, [r7, #0x16]
	strh r4, [r7, #0x18]
	movs r0, #0x19
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08041794 @ =0x00000296
	strh r0, [r7, #0xa]
	movs r0, #0xa0
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	ldr r1, _08041798 @ =0x00000141
	add r1, sl
	adds r0, r6, #0
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #1
	add r0, sl
	mov r1, r8
	strb r1, [r0]
	ldr r0, _0804179C @ =0x00000145
	add r0, sl
	strb r5, [r0]
	str r6, [r7, #0x28]
	mov r2, sb
	str r2, [r7, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041780: .4byte 0x00000295
_08041784: .4byte 0x00000275
_08041788: .4byte 0x00000299
_0804178C: .4byte 0x00000111
_08041790: .4byte 0x00000115
_08041794: .4byte 0x00000296
_08041798: .4byte 0x00000141
_0804179C: .4byte 0x00000145

	thumb_func_start Task_AeroEggExploding
Task_AeroEggExploding: @ 0x080417A0
	push {r4, r5, r6, lr}
	ldr r0, _08041868 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, #0x18
	adds r6, r5, r0
	adds r0, r4, #0
	bl AeroEgg_UpdatePartsAfterBossDefeated
	adds r0, r4, #0
	bl sub_80424EC
	adds r0, r4, #0
	bl AeroEgg_UpdateBossSpritesOnDefeat
	adds r0, r4, #0
	bl sub_8042560
	adds r0, r4, #0
	bl sub_8041D34
	ldr r0, _0804186C @ =gStageTime
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _080417E4
	movs r0, #0x90
	bl m4aSongNumStart
_080417E4:
	ldr r1, _08041870 @ =IWRAM_START + 0x84
	adds r3, r5, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _08041830
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r2, _08041874 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	cmp r0, #0x31
	bgt _08041830
	ldr r1, _08041878 @ =IWRAM_START + 0x80
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08041830
	movs r0, #1
	strb r0, [r3]
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	subs r1, #0xf
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	bl CreateEggmobileEscapeSequence
_08041830:
	ldr r0, [r4, #0x1c]
	asrs r0, r0, #8
	ldr r1, _08041874 @ =gCamera
	ldr r1, [r1]
	subs r0, r0, r1
	movs r1, #0xc8
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08041860
	adds r0, r4, #0
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041860
	movs r0, #0x28
	rsbs r0, r0, #0
	movs r1, #0x96
	movs r2, #3
	bl sub_802EF68
	ldr r0, _08041868 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0804187C @ =Task_DeleteAeroEggTask
	str r0, [r1, #8]
_08041860:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041868: .4byte gCurTask
_0804186C: .4byte gStageTime
_08041870: .4byte IWRAM_START + 0x84
_08041874: .4byte gCamera
_08041878: .4byte IWRAM_START + 0x80
_0804187C: .4byte Task_DeleteAeroEggTask

	thumb_func_start sub_8041880
sub_8041880: @ 0x08041880
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x88
	mov r1, r8
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r4, _080419F8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	adds r7, #0x38
	mov r6, r8
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	movs r5, #0
	ldr r0, _080419FC @ =gSineTable
	mov sb, r0
	adds r7, #0x30
	mov sl, r4
_080418E6:
	ldr r3, _08041A00 @ =gStageTime
	ldr r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	lsls r1, r5, #7
	adds r0, r0, r1
	ldr r4, _08041A04 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	ldr r2, [r0, #4]
	asrs r2, r2, #8
	mov r1, sl
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0xfa
	lsls r4, r4, #1
	adds r3, r6, r4
	ldr r6, _08041A04 @ =0x000003FF
	ands r3, r6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	add r0, sb
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r4, r5, #1
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r2, r2, r0
	strh r2, [r7, #0x16]
	mov r6, r8
	ldr r2, [r6, #8]
	asrs r2, r2, #8
	mov r1, sl
	ldr r0, [r1, #4]
	subs r2, r2, r0
	lsls r3, r3, #1
	add r3, sb
	movs r6, #0
	ldrsh r1, [r3, r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r0, #0x14
	adds r2, r2, r0
	strh r2, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	cmp r5, #2
	bls _080418E6
	ldr r4, _080419FC @ =gSineTable
	ldr r0, _08041A00 @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r3, _08041A04 @ =0x000003FF
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r7, #0x90
	lsls r7, r7, #1
	add r7, r8
	mov r0, r8
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r5, _080419F8 @ =gCamera
	ldr r0, [r5]
	subs r1, r1, r0
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r2, r6, r0
	ands r2, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r0, r0, #0xc
	adds r1, r1, r0
	strh r1, [r7, #0x16]
	mov r0, r8
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r0, r0, #0xc
	adds r0, #0x14
	adds r1, r1, r0
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080419F8: .4byte gCamera
_080419FC: .4byte gSineTable
_08041A00: .4byte gStageTime
_08041A04: .4byte 0x000003FF

.if 0
.endif
