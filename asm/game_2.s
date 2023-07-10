.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start Task_801F214
Task_801F214: @ 0x0801F214
	push {r4, r5, r6, lr}
	ldr r2, _0801F25C @ =gCurTask
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x1c
	adds r5, r1, r0
	ldr r3, _0801F260 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _0801F254
	ldrh r1, [r4, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801F264
	adds r1, r3, #0
	adds r1, #0x68
	ldrh r0, [r4, #0x16]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801F254
	adds r1, r3, #0
	adds r1, #0x6a
	ldrh r0, [r4, #0x18]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0801F264
_0801F254:
	adds r0, r6, #0
	bl TaskDestroy
	b _0801F398
	.align 2, 0
_0801F25C: .4byte gCurTask
_0801F260: .4byte gPlayer
_0801F264:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F278
	ldr r0, [r2]
	bl TaskDestroy
	b _0801F398
_0801F278:
	ldrh r1, [r4, #0x14]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	beq _0801F310
	cmp r0, #1
	bgt _0801F28C
	cmp r0, #0
	beq _0801F292
	b _0801F334
_0801F28C:
	cmp r0, #2
	beq _0801F32C
	b _0801F334
_0801F292:
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	beq _0801F2EC
	cmp r0, #0x20
	bne _0801F2F4
	ldr r0, _0801F2CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F2E0
	ldr r0, _0801F2D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldr r1, _0801F2D4 @ =gMultiplayerPlayerTasks
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0801F2D8 @ =IWRAM_START + 0x50
	adds r1, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r4]
	ldr r1, _0801F2DC @ =IWRAM_START + 0x52
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0801F2F2
	.align 2, 0
_0801F2CC: .4byte gGameMode
_0801F2D0: .4byte 0x04000128
_0801F2D4: .4byte gMultiplayerPlayerTasks
_0801F2D8: .4byte IWRAM_START + 0x50
_0801F2DC: .4byte IWRAM_START + 0x52
_0801F2E0:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	str r0, [r4]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	b _0801F2F2
_0801F2EC:
	ldr r0, _0801F308 @ =gUnknown_03005660
	movs r1, #4
	ldrsh r0, [r0, r1]
_0801F2F2:
	str r0, [r4, #4]
_0801F2F4:
	ldr r2, _0801F30C @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F308: .4byte gUnknown_03005660
_0801F30C: .4byte gCamera
_0801F310:
	ldr r2, _0801F328 @ =gCamera
	ldr r0, [r4]
	adds r1, r2, #0
	adds r1, #0x52
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	adds r2, #0x54
	ldrh r1, [r2]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F328: .4byte gCamera
_0801F32C:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
_0801F332:
	strh r0, [r5, #0x18]
_0801F334:
	ldrh r1, [r4, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801F35A
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F352
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F358
_0801F352:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F37C @ =0xFFFFFBFF
	ands r0, r1
_0801F358:
	str r0, [r5, #0x10]
_0801F35A:
	ldrh r1, [r4, #0x14]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F38C
	ldr r0, _0801F380 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F384
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F38A
	.align 2, 0
_0801F37C: .4byte 0xFFFFFBFF
_0801F380: .4byte gUnknown_03005424
_0801F384:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F3A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F38A:
	str r0, [r5, #0x10]
_0801F38C:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0801F398:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3A0: .4byte 0xFFFFF7FF

	thumb_func_start sub_801F3A4
sub_801F3A4: @ 0x0801F3A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r7, #0x64
	beq _0801F3D6
	cmp r7, #0xc8
	beq _0801F3D6
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F3D6
	adds r0, #0xc8
	cmp r7, r0
	beq _0801F3D6
	movs r0, #0xc8
	lsls r0, r0, #2
	cmp r7, r0
	beq _0801F3D6
	movs r0, #0
	b _0801F474
_0801F3D6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F410 @ =Task_801F214
	str r2, [sp]
	ldr r2, _0801F414 @ =TaskDestructor_801F550
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0
	bl sub_801F15C
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F432
	cmp r7, r0
	bgt _0801F418
	cmp r7, #0x64
	beq _0801F42A
	cmp r7, #0xc8
	beq _0801F42E
	b _0801F43C
	.align 2, 0
_0801F410: .4byte Task_801F214
_0801F414: .4byte TaskDestructor_801F550
_0801F418:
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r7, r0
	beq _0801F436
	movs r0, #0xc8
	lsls r0, r0, #2
	cmp r7, r0
	beq _0801F43A
	b _0801F43C
_0801F42A:
	movs r7, #0
	b _0801F43C
_0801F42E:
	movs r7, #1
	b _0801F43C
_0801F432:
	movs r7, #2
	b _0801F43C
_0801F436:
	movs r7, #3
	b _0801F43C
_0801F43A:
	movs r7, #4
_0801F43C:
	mov r6, r8
	adds r6, #0x1c
	ldr r5, _0801F484 @ =sAnimData_StageGoalScoreBonus
	lsls r4, r7, #1
	adds r4, r4, r7
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	mov r0, r8
	adds r0, #0x3c
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
_0801F474:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F484: .4byte sAnimData_StageGoalScoreBonus

	thumb_func_start sub_801F488
sub_801F488: @ 0x0801F488
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, _0801F52C @ =gPlayer
	ldr r0, _0801F530 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0801F524
	movs r4, #0x17
	ldrsb r4, [r5, r4]
	ldr r0, _0801F534 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801F4AC
	rsbs r4, r4, #0
_0801F4AC:
	ldr r2, _0801F538 @ =gSineTable
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r3, r4, #0
	muls r3, r0, r3
	asrs r3, r3, #8
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r4, #0
	muls r2, r0, r2
	asrs r2, r2, #8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	subs r0, r0, r3
	adds r1, r1, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F53C @ =Task_801F214
	str r2, [sp]
	ldr r2, _0801F540 @ =TaskDestructor_801F550
	str r2, [sp, #4]
	movs r2, #0xc0
	movs r3, #0
	bl sub_801F15C
	ldrh r4, [r0, #6]
	ldr r0, _0801F544 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0x14
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _0801F548 @ =0x00000351
	strh r0, [r5, #0xa]
	ldr r0, _0801F54C @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
_0801F524:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F52C: .4byte gPlayer
_0801F530: .4byte gUnknown_03005590
_0801F534: .4byte gUnknown_03005424
_0801F538: .4byte gSineTable
_0801F53C: .4byte Task_801F214
_0801F540: .4byte TaskDestructor_801F550
_0801F544: .4byte IWRAM_START + 0x1C
_0801F548: .4byte 0x00000351
_0801F54C: .4byte IWRAM_START + 0x3C

	thumb_func_start TaskDestructor_801F550
TaskDestructor_801F550: @ 0x0801F550
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _0801F564 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_0801F564: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_801F568
sub_801F568: @ 0x0801F568
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801F5B8 @ =Task_801F214
	str r2, [sp]
	ldr r2, _0801F5BC @ =TaskDestructor_801F550
	str r2, [sp, #4]
	movs r2, #0xc0
	movs r3, #0
	bl sub_801F15C
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	ldr r0, _0801F5C0 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0x14
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _0801F5C4 @ =0x00000351
	strh r0, [r5, #0xa]
	ldr r0, _0801F5C8 @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801F5B8: .4byte Task_801F214
_0801F5BC: .4byte TaskDestructor_801F550
_0801F5C0: .4byte IWRAM_START + 0x1C
_0801F5C4: .4byte 0x00000351
_0801F5C8: .4byte IWRAM_START + 0x3C

    @; This might be a collision function?
    @; Gets called by sub_801350C and gets
    @; the X/Y coords for the bottom pos of a sprite.
	thumb_func_start sub_801F5CC
sub_801F5CC: @ 0x0801F5CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r1, _0801F5F0 @ =gUnknown_030059D0
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _0801F5EC
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0801F5F4
_0801F5EC:
	movs r0, #0
	b _0801F6BE
	.align 2, 0
_0801F5F0: .4byte gUnknown_030059D0
_0801F5F4:
	subs r0, r2, #1
	movs r4, #0
	strb r0, [r1]
	ldr r0, _0801F650 @ =Task_801F6E0
	ldr r2, _0801F654 @ =0x00004001
	ldr r1, _0801F658 @ =TaskDestructor_801F7B8
	str r1, [sp]
	movs r1, #0x38
	movs r3, #0
	bl TaskCreate
	mov sb, r0
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	movs r1, #0
	mov r8, r1
	strh r6, [r0]
	strh r7, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0801F65C @ =IWRAM_START + 0x8
	adds r4, r5, r0
	ldr r0, _0801F660 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801F668
	movs r0, #0xf
	bl VramMalloc
	str r0, [r4, #4]
	movs r0, #0xda
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _0801F664 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #6
	b _0801F696
	.align 2, 0
_0801F650: .4byte Task_801F6E0
_0801F654: .4byte 0x00004001
_0801F658: .4byte TaskDestructor_801F7B8
_0801F65C: .4byte IWRAM_START + 0x8
_0801F660: .4byte gPlayer
_0801F664: .4byte IWRAM_START + 0x28
_0801F668:
	ldr r0, _0801F6CC @ =0x06012300
	str r0, [r4, #4]
	movs r0, #0xd4
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r1, _0801F6D0 @ =IWRAM_START + 0x28
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r4, #0x10]
	ldr r2, _0801F6D4 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0801F6D8 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801F6DC @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #4
	ands r0, r1
	orrs r0, r3
_0801F696:
	str r0, [r4, #0x10]
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #8]
	adds r3, r4, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	mov r0, sb
_0801F6BE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801F6CC: .4byte 0x06012300
_0801F6D0: .4byte IWRAM_START + 0x28
_0801F6D4: .4byte gPseudoRandom
_0801F6D8: .4byte 0x00196225
_0801F6DC: .4byte 0x3C6EF35F

	thumb_func_start Task_801F6E0
Task_801F6E0: @ 0x0801F6E0
	push {r4, r5, lr}
	ldr r2, _0801F714 @ =gUnknown_030059D0
	ldr r0, _0801F718 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #8
	adds r5, r1, r0
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0801F706
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F71C
_0801F706:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r3, #0
	bl TaskDestroy
	b _0801F74A
	.align 2, 0
_0801F714: .4byte gUnknown_030059D0
_0801F718: .4byte gCurTask
_0801F71C:
	ldr r2, _0801F750 @ =gCamera
	ldr r1, [r2]
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #2]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #6]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
_0801F74A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F750: .4byte gCamera

	thumb_func_start sub_801F754
sub_801F754: @ 0x0801F754
	push {r4, lr}
	sub sp, #4
	ldr r4, _0801F780 @ =gUnknown_030059D0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0801F778
	ldr r0, _0801F784 @ =sub_801F7B4
	movs r2, #0x80
	lsls r2, r2, #7
	ldr r1, _0801F788 @ =sub_801F7A8
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r0, [r4, #4]
	movs r0, #0x14
	strb r0, [r4]
_0801F778:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F780: .4byte gUnknown_030059D0
_0801F784: .4byte sub_801F7B4
_0801F788: .4byte sub_801F7A8

	thumb_func_start sub_801F78C
sub_801F78C: @ 0x0801F78C
	push {r4, lr}
	ldr r4, _0801F7A4 @ =gUnknown_030059D0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0801F79E
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #4]
_0801F79E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F7A4: .4byte gUnknown_030059D0

	thumb_func_start sub_801F7A8
sub_801F7A8: @ 0x0801F7A8
	ldr r1, _0801F7B0 @ =gUnknown_030059D0
	movs r0, #0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_0801F7B0: .4byte gUnknown_030059D0

	thumb_func_start sub_801F7B4
sub_801F7B4: @ 0x0801F7B4
	bx lr
	.align 2, 0

	thumb_func_start TaskDestructor_801F7B8
TaskDestructor_801F7B8: @ 0x0801F7B8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r0, r1
	adds r1, #8
	adds r0, r0, r1
	ldrh r1, [r0, #0xa]
	movs r0, #0xda
	lsls r0, r0, #2
	cmp r1, r0
	bne _0801F7D6
	ldr r0, [r2, #0xc]
	bl VramFree
_0801F7D6:
	pop {r0}
	bx r0
	.align 2, 0
