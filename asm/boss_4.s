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

.if 0
.endif
