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

	thumb_func_start Task_80417A0
Task_80417A0: @ 0x080417A0
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
	bl sub_804217C
	adds r0, r4, #0
	bl sub_80424EC
	adds r0, r4, #0
	bl sub_8041C48
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

	thumb_func_start sub_8041A08
sub_8041A08: @ 0x08041A08
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r4, _08041AEC @ =gSineTable
	ldr r0, _08041AF0 @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _08041AF4 @ =0x000003FF
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r6, r5, r3
	ldr r3, [r5, #4]
	asrs r3, r3, #8
	mov ip, r3
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r0, r0, #0xc
	mov r2, ip
	adds r3, r2, r0
	ldr r2, [r5, #8]
	asrs r2, r2, #8
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	asrs r0, r0, #0xc
	adds r0, #0x14
	adds r2, r2, r0
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	bne _08041B08
	ldr r4, _08041AF8 @ =gPlayer
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08041ABA
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08041ABA
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r4, #0
	bl sub_800DF38
	cmp r0, #0
	beq _08041ABA
	ldr r0, _08041AFC @ =0x0000FB40
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	ldr r1, _08041B00 @ =0xFFFFFEF7
	ands r0, r1
	str r0, [r4, #0x20]
	str r7, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r7, #1
_08041ABA:
	ldrh r0, [r5, #0x10]
	adds r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0x96
	lsls r2, r2, #1
	cmp r0, r2
	bls _08041ACE
	movs r7, #1
_08041ACE:
	cmp r7, #0
	beq _08041B36
	ldr r0, _08041B04 @ =0x00000296
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	strh r2, [r5, #0x10]
	movs r0, #1
	b _08041B34
	.align 2, 0
_08041AEC: .4byte gSineTable
_08041AF0: .4byte gStageTime
_08041AF4: .4byte 0x000003FF
_08041AF8: .4byte gPlayer
_08041AFC: .4byte 0x0000FB40
_08041B00: .4byte 0xFFFFFEF7
_08041B04: .4byte 0x00000296
_08041B08:
	ldrh r0, [r5, #0x10]
	subs r0, #1
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x12
	bne _08041B2C
	ldr r0, _08041B3C @ =0x00000296
	strh r0, [r6, #0xa]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #3
	strb r0, [r1]
	ldr r3, _08041B40 @ =0x00000141
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
_08041B2C:
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	bne _08041B36
	movs r0, #0
_08041B34:
	strb r0, [r5, #0x17]
_08041B36:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041B3C: .4byte 0x00000296
_08041B40: .4byte 0x00000141

	thumb_func_start sub_8041B44
sub_8041B44: @ 0x08041B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _08041BE8
	ldr r0, [r4, #4]
	asrs r7, r0, #8
	ldr r0, [r4, #8]
	asrs r5, r0, #8
	movs r0, #0x88
	adds r0, r0, r4
	mov r8, r0
	ldr r6, _08041B98 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08041BC0
	str r6, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08041BA4
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	cmp r0, r5
	ble _08041B9C
	adds r0, r4, #0
	bl sub_8042774
	adds r0, r6, #0
	bl sub_800CBA4
	b _08041BC0
	.align 2, 0
_08041B98: .4byte gPlayer
_08041B9C:
	adds r0, r4, #0
	bl sub_80423EC
	b _08041BC0
_08041BA4:
	str r6, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800CA20
	str r6, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #1
	bl sub_800CA20
_08041BC0:
	lsls r0, r7, #8
	lsls r1, r5, #8
	bl sub_80122DC
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	bne _08041BE8
	ldr r0, _08041BF4 @ =gPlayer
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #0
	bl IsColliding_Cheese
	cmp r0, #1
	bne _08041BE8
	adds r0, r4, #0
	bl sub_80423EC
_08041BE8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041BF4: .4byte gPlayer

	thumb_func_start sub_8041BF8
sub_8041BF8: @ 0x08041BF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	beq _08041C08
	subs r0, #1
	strh r0, [r4, #0x12]
	b _08041C3C
_08041C08:
	adds r5, r4, #0
	adds r5, #0x88
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	movs r0, #0xd0
	lsls r0, r0, #5
	adds r2, r2, r0
	adds r0, r4, #0
	bl CreateAeroEggBomb
	ldrb r0, [r4, #0x14]
	cmp r0, #4
	bhi _08041C26
	movs r0, #0x50
	b _08041C28
_08041C26:
	movs r0, #0x8c
_08041C28:
	strh r0, [r4, #0x12]
	ldr r0, _08041C44 @ =0x00000295
	strh r0, [r5, #0xa]
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08041C3C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041C44: .4byte 0x00000295

	thumb_func_start sub_8041C48
sub_8041C48: @ 0x08041C48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0x18
	adds r0, r0, r6
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x88
	ldr r0, [r0, #4]
	asrs r0, r0, #8
	ldr r7, _08041D30 @ =gCamera
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	adds r0, r6, #0
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	bne _08041CB4
	adds r4, #0x38
	mov r1, r8
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	subs r0, #0xe
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
_08041CB4:
	adds r4, r6, #0
	adds r4, #0xf0
	movs r5, #0
	movs r0, #0x30
	adds r0, r0, r6
	mov sl, r0
	movs r1, #0x34
	adds r1, r1, r6
	mov sb, r1
_08041CC6:
	lsls r2, r5, #2
	adds r2, r2, r5
	lsls r2, r2, #2
	mov r1, sl
	adds r0, r1, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	add r2, sb
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl DisplaySprite
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041CC6
	movs r0, #0x90
	lsls r0, r0, #1
	adds r4, r6, r0
	mov r1, r8
	ldr r0, [r1, #0x54]
	asrs r0, r0, #8
	ldr r2, _08041D30 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	mov r1, r8
	ldr r0, [r1, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041D30: .4byte gCamera

	thumb_func_start sub_8041D34
sub_8041D34: @ 0x08041D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x20]
	adds r0, #0x18
	mov sl, r0
	ldr r1, [sp, #0x20]
	adds r1, #0x82
	mov sb, r1
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	str r2, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041D62
	b _08041FEA
_08041D62:
	adds r0, r2, #0
	movs r1, #0xc
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08041DFA
	movs r0, #0x30
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08041FFC @ =gPseudoRandom
	mov r8, r0
	ldr r0, [r0]
	ldr r5, _08042000 @ =0x00196225
	adds r2, r0, #0
	muls r2, r5, r2
	ldr r4, _08042004 @ =0x3C6EF35F
	adds r2, r2, r4
	mov r3, sl
	ldr r1, [r3, #4]
	asrs r1, r1, #8
	ldr r3, _08042008 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	movs r0, #0x1f
	ands r0, r2
	adds r1, r1, r0
	subs r1, #0x1f
	str r1, [sp, #0x14]
	muls r2, r5, r2
	adds r2, r2, r4
	mov r0, sl
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	movs r6, #0x3f
	adds r0, r2, #0
	ands r0, r6
	adds r1, r1, r0
	subs r1, #0x30
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	muls r2, r5, r2
	adds r2, r2, r4
	adds r1, r2, #0
	ands r1, r6
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	adds r1, r2, #0
	muls r1, r5, r1
	adds r1, r1, r4
	mov r2, r8
	str r1, [r2]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r1, #0x81
	bl CreateBossParticleWithExplosionUpdate
_08041DFA:
	mov r3, sb
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08041ED0
	ldr r0, _08041FFC @ =gPseudoRandom
	mov sb, r0
	ldr r0, [r0]
	ldr r1, _08042000 @ =0x00196225
	mov r8, r1
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	ldr r6, _08042004 @ =0x3C6EF35F
	adds r0, r0, r6
	mov r3, sb
	str r0, [r3]
	movs r5, #0xf
	adds r4, r5, #0
	ands r4, r0
	adds r0, r4, #0
	movs r1, #6
	bl Div
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	mov r1, sl
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r3, _08042008 @ =gCamera
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r1, r4, #1
	subs r0, r0, r1
	lsls r4, r4, #2
	adds r0, r0, r4
	str r0, [sp, #0x14]
	mov r2, sb
	ldr r0, [r2]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r6
	ands r5, r2
	mov r1, sl
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	lsls r1, r5, #1
	subs r0, r0, r1
	lsls r5, r5, #2
	adds r0, r0, r5
	str r0, [sp, #0x18]
	mov r1, sp
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	mov r3, sp
	mov r1, r8
	muls r1, r2, r1
	adds r1, r1, r6
	ldr r0, _08042018 @ =0x000003FF
	ands r0, r1
	strh r0, [r3, #0xc]
	mov r2, sp
	mov r3, r8
	muls r3, r1, r3
	adds r1, r3, #0
	adds r1, r1, r6
	mov r0, sb
	str r1, [r0]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0xe0
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r2, _0804201C @ =gUnknown_080D79D0
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08042020 @ =0x06010000
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
	ldr r1, [sp, #0x20]
	adds r1, #0x81
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_08041ED0:
	movs r7, #0
	ldr r0, [sp, #0x20]
	adds r0, #0x40
	str r0, [sp, #0x28]
	ldr r1, _08042008 @ =gCamera
	mov sb, r1
	mov r5, sp
	ldr r2, _08041FFC @ =gPseudoRandom
	mov r8, r2
	ldr r6, _08042000 @ =0x00196225
_08041EE4:
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r2, r0, #2
	ldr r3, [sp, #0x28]
	adds r0, r3, r2
	ldr r4, [r0]
	cmp r4, #0
	bne _08041F6A
	adds r0, r7, #4
	ldr r1, [sp, #0x24]
	cmp r1, r0
	beq _08041F02
	adds r0, #0x1a
	cmp r1, r0
	bne _08041F6A
_08041F02:
	mov r0, sl
	adds r0, #0x18
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	mov r3, sb
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, sl
	adds r0, #0x1c
	adds r0, r0, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	ldr r1, [r3, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	strh r4, [r5, #0x1c]
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, #0
	muls r2, r6, r2
	ldr r3, _08042004 @ =0x3C6EF35F
	adds r2, r2, r3
	movs r1, #0x3f
	ands r1, r2
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r6, r1
	adds r1, r1, r3
	mov r2, r8
	str r1, [r2]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x90
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r5, #8]
	strh r4, [r5, #0xa]
	str r4, [sp, #4]
	mov r0, sp
	mov r1, sl
	adds r1, #0x69
	bl CreateBossParticleWithExplosionUpdate
_08041F6A:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _08041EE4
	ldr r3, [sp, #0x24]
	cmp r3, #0x29
	beq _08041F7E
	cmp r3, #0x12
	bne _08041FEA
_08041F7E:
	mov r0, sl
	ldr r7, [r0, #0x64]
	cmp r7, #0
	bne _08041FEA
	ldr r0, [r0, #0x54]
	asrs r0, r0, #8
	ldr r2, _08042008 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	mov r1, sl
	ldr r0, [r1, #0x58]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r5, sp
	ldr r6, _08041FFC @ =gPseudoRandom
	ldr r0, [r6]
	ldr r4, _08042000 @ =0x00196225
	adds r2, r0, #0
	muls r2, r4, r2
	ldr r3, _08042004 @ =0x3C6EF35F
	adds r2, r2, r3
	movs r1, #0x3f
	ands r1, r2
	movs r0, #0xfa
	lsls r0, r0, #2
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	adds r1, r2, #0
	muls r1, r4, r1
	adds r1, r1, r3
	str r1, [r6]
	ldr r0, _0804200C @ =0x000001FF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	ldr r0, _08042010 @ =0x06012980
	str r0, [sp]
	mov r1, sp
	ldr r0, _08042014 @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sl
	adds r1, #0x69
	bl CreateBossParticleWithExplosionUpdate
_08041FEA:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041FFC: .4byte gPseudoRandom
_08042000: .4byte 0x00196225
_08042004: .4byte 0x3C6EF35F
_08042008: .4byte gCamera
_0804200C: .4byte 0x000001FF
_08042010: .4byte 0x06012980
_08042014: .4byte 0x0000026B
_08042018: .4byte 0x000003FF
_0804201C: .4byte gUnknown_080D79D0
_08042020: .4byte 0x06010000

	thumb_func_start sub_8042024
sub_8042024: @ 0x08042024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x18
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0
	str r1, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #0x80
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x82
	movs r0, #0x30
	strb r0, [r2]
	adds r2, #1
	movs r0, #3
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x84
	strb r1, [r0]
	adds r5, r7, #0
	adds r5, #0x88
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	ldr r2, _0804216C @ =gCamera
	ldr r4, [r2]
	adds r0, r0, r4
	lsls r0, r0, #8
	mov r3, ip
	str r0, [r3, #4]
	movs r6, #0x18
	ldrsh r0, [r5, r6]
	ldr r3, [r2, #4]
	adds r0, r0, r3
	lsls r0, r0, #8
	mov r2, ip
	str r0, [r2, #8]
	movs r2, #0xb8
	lsls r2, r2, #3
	mov r6, ip
	str r2, [r6, #0xc]
	str r1, [r6, #0x10]
	str r1, [r6, #0x14]
	movs r0, #0x90
	lsls r0, r0, #1
	adds r5, r7, r0
	movs r6, #0x16
	ldrsh r0, [r5, r6]
	adds r0, r0, r4
	lsls r0, r0, #8
	mov r4, ip
	str r0, [r4, #0x54]
	movs r6, #0x18
	ldrsh r0, [r5, r6]
	adds r0, r0, r3
	lsls r0, r0, #8
	str r0, [r4, #0x58]
	str r2, [r4, #0x5c]
	str r1, [r4, #0x60]
	str r1, [r4, #0x64]
	movs r6, #0
	ldr r0, _08042170 @ =gSineTable
	mov r8, r0
	ldr r0, _08042174 @ =gStageTime
	ldr r1, [r0]
	ldr r2, _08042178 @ =0x000003FF
	mov sl, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [sp]
	mov sb, r6
_080420C2:
	lsls r0, r6, #7
	ldr r3, [sp]
	adds r0, r3, r0
	mov r4, sl
	ands r0, r4
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, [r7, #4]
	asrs r4, r4, #8
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r1, r1, r0
	mov r2, sl
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r0, r2, #4
	adds r0, r0, r2
	adds r5, r6, #1
	muls r0, r5, r0
	asrs r0, r0, #0xe
	adds r4, r4, r0
	ldr r3, [r7, #8]
	asrs r3, r3, #8
	lsls r1, r1, #1
	add r1, r8
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	muls r0, r5, r0
	asrs r0, r0, #0xe
	adds r0, #0x14
	adds r3, r3, r0
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	mov r0, ip
	adds r0, #0x18
	adds r0, r0, r2
	lsls r4, r4, #8
	str r4, [r0]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r0, r2
	lsls r3, r3, #8
	str r3, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r0, r2
	movs r1, #0xb8
	lsls r1, r1, #3
	str r1, [r0]
	mov r0, ip
	adds r0, #0x24
	adds r0, r0, r2
	mov r1, sb
	str r1, [r0]
	mov r0, ip
	adds r0, #0x28
	adds r0, r0, r2
	str r1, [r0]
	lsls r5, r5, #0x18
	lsrs r6, r5, #0x18
	cmp r6, #2
	bls _080420C2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804216C: .4byte gCamera
_08042170: .4byte gSineTable
_08042174: .4byte gStageTime
_08042178: .4byte 0x000003FF

.if 0
.endif
