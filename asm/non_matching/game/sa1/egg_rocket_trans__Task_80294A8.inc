.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08029724 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #4]
	ldr r2, _08029728 @ =gCamera
	ldrh r0, [r2, #0xe]
	subs r0, #1
	strh r0, [r2, #0xe]
	ldrh r1, [r1, #0xc]
	adds r0, r1, #1
	ldr r3, [sp, #4]
	strh r0, [r3, #0xc]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080294DC
	b _0802967E
_080294DC:
	ldrh r1, [r2]
	ldrh r0, [r2, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r6, #0
	ldr r5, _0802972C @ =gPseudoRandom
	ldr r0, _08029730 @ =0x00196225
	mov r8, r0
	ldr r7, _08029734 @ =0x3C6EF35F
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	str r2, [sp, #0xc]
	ldr r3, _08029738 @ =gSineTable
	mov sl, r3
	str r1, [sp, #0x10]
_080294FE:
	ldr r0, [r5]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r7
	str r0, [r5]
	movs r4, #7
	ands r4, r0
	ldr r0, _0802973C @ =gUnknown_080BB434
	adds r0, r4, r0
	ldrb r0, [r0]
	bl VramMalloc
	adds r1, r0, #0
	ldr r2, _08029740 @ =gUnknown_080BB41C
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	ldr r0, _08029744 @ =gUnknown_080BB42C
	adds r0, r4, r0
	ldrb r3, [r0]
	ldr r0, _08029748 @ =TaskDestructor_NutsAndBolts
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #6
	bl CreateNutsAndBoltsTask
	ldrh r2, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r4, r2, r3
	ldr r0, [r5]
	mov r1, r8
	muls r1, r0, r1
	adds r1, r1, r7
	str r1, [r5]
	movs r0, #0xff
	ands r0, r1
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #8
	str r0, [r4, #0x30]
	ldr r0, [sp, #8]
	lsls r3, r0, #0x10
	asrs r0, r3, #8
	str r0, [r4, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	movs r0, #0x28
	strh r0, [r4, #0x3e]
	ldr r0, _0802974C @ =0x03000040
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2]
	mov r0, r8
	muls r0, r1, r0
	adds r0, r0, r7
	str r0, [r5]
	ldr r1, _08029750 @ =0x000001FF
	ands r1, r0
	lsls r0, r1, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #6
	strh r0, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	mov sb, r3
	cmp r0, #0
	bge _08029598
	rsbs r0, r0, #0
_08029598:
	strh r0, [r4, #0x3a]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	rsbs r0, r0, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0x38]
	adds r6, #1
	cmp r6, #2
	bls _080294FE
	movs r6, #0
	ldr r5, _0802972C @ =gPseudoRandom
	ldr r2, _08029730 @ =0x00196225
	mov r8, r2
	ldr r7, _08029734 @ =0x3C6EF35F
	ldr r3, _08029738 @ =gSineTable
	mov sl, r3
_080295C4:
	ldr r0, [r5]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r0, r7
	str r0, [r5]
	movs r4, #7
	ands r4, r0
	ldr r0, _0802973C @ =gUnknown_080BB434
	adds r0, r4, r0
	ldrb r0, [r0]
	bl VramMalloc
	adds r1, r0, #0
	ldr r2, _08029740 @ =gUnknown_080BB41C
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	ldr r0, _08029744 @ =gUnknown_080BB42C
	adds r0, r4, r0
	ldrb r3, [r0]
	ldr r0, _08029748 @ =TaskDestructor_NutsAndBolts
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #6
	bl CreateNutsAndBoltsTask
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r3, r2
	ldr r0, [r5]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r7
	str r2, [r5]
	ldr r0, [sp, #0x10]
	asrs r1, r0, #0x10
	movs r0, #0xff
	ands r0, r2
	adds r1, r1, r0
	lsls r1, r1, #8
	str r1, [r4, #0x30]
	mov r1, sb
	asrs r0, r1, #8
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	movs r0, #0x28
	strh r0, [r4, #0x3e]
	ldr r0, _0802974C @ =0x03000040
	adds r3, r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	mov r0, r8
	muls r0, r2, r0
	adds r0, r0, r7
	str r0, [r5]
	adds r1, #0xff
	ands r1, r0
	lsls r0, r1, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #5
	strh r0, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _0802965A
	rsbs r0, r0, #0
_0802965A:
	strh r0, [r4, #0x3a]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #9
	rsbs r0, r0, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0x38]
	adds r6, #1
	cmp r6, #2
	bls _080295C4
	movs r0, #0x90
	bl m4aSongNumStart
_0802967E:
	ldr r5, _08029728 @ =gCamera
	movs r0, #2
	ldrsh r2, [r5, r0]
	ldr r3, [sp, #4]
	movs r0, #4
	ldrsh r1, [r3, r0]
	adds r0, r1, #0
	subs r0, #0xa0
	adds r6, r5, #0
	cmp r2, r0
	bgt _0802977C
	movs r0, #0
	strh r0, [r5, #0xe]
	ldr r0, _08029754 @ =gBossIndex
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bls _080296C8
	movs r0, #0xae
	lsls r0, r0, #5
	strh r0, [r5, #0x16]
	ldr r3, _08029758 @ =gStageFlags
	ldrh r0, [r3]
	ldr r2, _0802975C @ =0x0000FFFE
	ands r2, r0
	strh r2, [r3]
	ldr r0, _08029760 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080296C8
	movs r1, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _08029764 @ =gCourseTime
	ldr r0, _08029768 @ =0x00004650
	str r0, [r1]
_080296C8:
	ldrb r0, [r4]
	cmp r0, #2
	bls _080296F4
	movs r0, #0xcc
	lsls r0, r0, #4
	strh r0, [r6, #0x16]
	ldr r3, _08029758 @ =gStageFlags
	ldrh r0, [r3]
	ldr r2, _0802975C @ =0x0000FFFE
	ands r2, r0
	strh r2, [r3]
	ldr r0, _08029760 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080296F4
	movs r1, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _08029764 @ =gCourseTime
	ldr r0, _08029768 @ =0x00004650
	str r0, [r1]
_080296F4:
	ldr r2, _0802976C @ =gPlayer
	ldr r0, [r2, #0x10]
	ldr r1, _08029770 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r2, #0x10]
	movs r0, #0
	strh r0, [r2, #0x38]
	ldr r0, _08029724 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _08029774 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r2, _08029728 @ =gCamera
	ldrh r1, [r2, #0x26]
	ldr r0, _08029778 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2, #0x26]
	b _080297D2
	.align 2, 0
_08029724: .4byte gCurTask
_08029728: .4byte gCamera
_0802972C: .4byte gPseudoRandom
_08029730: .4byte 0x00196225
_08029734: .4byte 0x3C6EF35F
_08029738: .4byte gSineTable
_0802973C: .4byte gUnknown_080BB434
_08029740: .4byte gUnknown_080BB41C
_08029744: .4byte gUnknown_080BB42C
_08029748: .4byte TaskDestructor_NutsAndBolts
_0802974C: .4byte 0x03000040
_08029750: .4byte 0x000001FF
_08029754: .4byte gBossIndex
_08029758: .4byte gStageFlags
_0802975C: .4byte 0x0000FFFE
_08029760: .4byte gGameMode
_08029764: .4byte gCourseTime
_08029768: .4byte 0x00004650
_0802976C: .4byte gPlayer
_08029770: .4byte 0xFFDFFFFF
_08029774: .4byte gFlags
_08029778: .4byte 0x00007FFF
_0802977C:
	subs r0, r1, r2
	cmp r0, #0
	ble _080297C0
	ldr r1, [sp, #4]
	ldrb r2, [r1, #4]
	ldrb r0, [r5, #2]
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _080297BC @ =gBgScrollRegs
	ldrh r3, [r4, #8]
	ldrh r0, [r4, #0xa]
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	bl sa2__sub_80078D4
	ldr r2, [sp, #4]
	ldrb r1, [r2, #4]
	ldrb r0, [r5, #2]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r3, [r4, #8]
	movs r0, #0xf0
	str r0, [sp]
	movs r0, #2
	movs r2, #0xa0
	bl sa2__sub_8007858
	b _080297D2
	.align 2, 0
_080297BC: .4byte gBgScrollRegs
_080297C0:
	ldr r0, _080297E4 @ =gBgScrollRegs
	ldrh r3, [r0, #8]
	movs r0, #0xf0
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	movs r2, #0xa0
	bl sa2__sub_8007858
_080297D2:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080297E4: .4byte gBgScrollRegs

.syntax divided
