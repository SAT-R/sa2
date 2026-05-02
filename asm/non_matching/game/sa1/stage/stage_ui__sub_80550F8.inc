.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	ldr r2, _0805512C @ =gCurrentLevel
	ldrb r1, [r2]
	movs r3, #0
	ldrsb r3, [r2, r3]
	cmp r3, #0xc
	bgt _08055164
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08055164
	ldr r0, _08055130 @ =gFinalBossActive
	ldrb r1, [r0]
	adds r0, r3, #0
	cmp r1, r0
	beq _08055164
	cmp r3, #0xd
	beq _08055164
	movs r4, #0
	ldr r5, _08055134 @ =0x0000042A
	b _08055150
	.align 2, 0
_0805512C: .4byte gCurrentLevel
_08055130: .4byte gFinalBossActive
_08055134: .4byte 0x0000042A
_08055138:
	strh r5, [r2]
	lsls r0, r4, #5
	ldr r3, _080552A8 @ =0xFFFF8000
	adds r1, r3, #0
	adds r0, r0, r1
	strh r0, [r2, #2]
	movs r0, #0xc1
	lsls r0, r0, #7
	strh r0, [r2, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08055150:
	cmp r4, #7
	bhi _08055164
	movs r0, #1
	bl OamMalloc
	adds r2, r0, #0
	ldr r0, _080552AC @ =iwram_end
	ldr r0, [r0]
	cmp r0, r2
	bne _08055138
_08055164:
	bl sub_80535FC
	bl UiGfxStackInit
	ldr r0, _080552B0 @ =Task_8055730
	ldr r1, _080552B4 @ =TaskDestructor_8055C38
	str r1, [sp]
	movs r1, #0x24
	ldr r2, _080552B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0x20]     @ sp20 = t0
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r7, r4, r2         @ r7 = Strc_Ui_24*
	movs r5, #0
	strh r5, [r7, #0x18]
	ldr r3, _080552BC @ =0x03000020
	adds r0, r4, r3
	movs r1, #1
	strb r1, [r0]
	strh r5, [r7, #0x1a]
	ldr r0, _080552C0 @ =0x0000FFB0
	strh r0, [r7, #0xa]
	strh r5, [r7, #0xc]
	movs r0, #3
	strh r0, [r7, #0xe]
	movs r0, #0x18
	strh r0, [r7, #8]
	movs r2, #6
	strh r2, [r7, #0x10]
	movs r3, #0
	strb r3, [r7, #0x16]
	movs r0, #0xf
	mov sl, r0
	mov r1, sl
	strh r1, [r7, #0x12]
	movs r0, #5
	strh r0, [r7, #0x14]
	movs r0, #0x20
	bl VramMalloc
	str r0, [r7, #0x1c]
	str r0, [sp, #8]        @ sp08 = vram0
	ldr r2, _080552C4 @ =0x03000021
	adds r4, r4, r2
	movs r3, #0
	strb r3, [r4]           @ --- 0
	ldr r0, _080552C8 @ =Task_8055798
	str r5, [sp]
	movs r1, #0x24
	ldr r2, _080552B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0x24]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	strh r5, [r7, #0x18]
	ldr r2, _080552BC @ =0x03000020
	adds r0, r1, r2
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	strh r0, [r7, #0x1a]
	movs r0, #0x14
	strh r0, [r7, #0xa]
	movs r2, #1
	strh r2, [r7, #0xe]
	movs r0, #7
	strh r0, [r7, #0x10]
	mov r3, sl
	strh r3, [r7, #0x12]
	movs r0, #1
	strb r0, [r7, #0x16]
	movs r0, #0x10
	strh r0, [r7, #8]
	ldr r2, _080552C4 @ =0x03000021
	adds r1, r1, r2
	movs r3, #0
	strb r3, [r1]
	ldr r0, _080552CC @ =Task_8055904
	ldr r1, _080552B4 @ =TaskDestructor_8055C38
	str r1, [sp]
	movs r1, #0x24
	ldr r2, _080552B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0x18]
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r7, r4, r2
	strh r5, [r7, #0x18]
	ldr r3, _080552BC @ =0x03000020
	adds r0, r4, r3
	movs r1, #1
	strb r1, [r0]
	strh r5, [r7, #0x1a]
	movs r0, #0xb4
	strh r0, [r7, #0xa]
	movs r0, #0xa0
	strh r0, [r7, #0xc]
	movs r2, #6
	strh r2, [r7, #0xe]
	movs r0, #0xa
	strh r0, [r7, #0x10]
	strh r2, [r7, #0x12]
	strb r1, [r7, #0x16]
	strh r5, [r7, #8]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r7, #0x1c]
	str r0, [sp, #0x14]
	ldr r3, _080552C4 @ =0x03000021
	adds r4, r4, r3
	movs r0, #0
	strb r0, [r4]
	ldr r0, _080552D0 @ =Task_8055998
	ldr r1, _080552B4 @ =TaskDestructor_8055C38
	str r1, [sp]
	movs r1, #0x24
	ldr r2, _080552B8 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0x1c]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r7, r0, r2
	strh r5, [r7, #0x18]
	ldr r3, _080552BC @ =0x03000020
	adds r0, r0, r3
	movs r1, #1
	strb r1, [r0]
	strh r5, [r7, #0x1a]
	ldr r3, _080552D4 @ =gCurrentLevel
	ldrb r2, [r3]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080552E0
	ldr r0, _080552D8 @ =gFinalBossActive
	ldrb r1, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	beq _080552E0
	cmp r2, #0xd
	beq _080552E0
	ldr r0, _080552DC @ =0x0000FFF0
	strh r0, [r7, #0xa]
	movs r0, #0x2a
	b _080552E6
	.align 2, 0
_080552A8: .4byte 0xFFFF8000
_080552AC: .4byte iwram_end
_080552B0: .4byte Task_8055730
_080552B4: .4byte TaskDestructor_8055C38
_080552B8: .4byte 0x00002120
_080552BC: .4byte 0x03000020
_080552C0: .4byte 0x0000FFB0
_080552C4: .4byte 0x03000021
_080552C8: .4byte Task_8055798
_080552CC: .4byte Task_8055904
_080552D0: .4byte Task_8055998
_080552D4: .4byte gCurrentLevel
_080552D8: .4byte gFinalBossActive
_080552DC: .4byte 0x0000FFF0
_080552E0:
	movs r0, #0xf0
	strh r0, [r7, #0xa]
	movs r0, #0x7e
_080552E6:
	strh r0, [r7, #0xc]
	movs r0, #8
	strh r0, [r7, #0xe]
	strh r0, [r7, #0x10]
	movs r1, #6
	strh r1, [r7, #0x12]
	movs r2, #1
	strb r2, [r7, #0x16]
	strh r0, [r7, #8]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #0x1c]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x21
	movs r3, #0
	strb r3, [r0]
	ldr r0, _08055430 @ =Task_8055AA0
	ldr r1, _08055434 @ =TaskDestructor_8055C38
	mov sb, r1
	str r1, [sp]
	movs r1, #0x24
	ldr r2, _08055438 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	str r0, [sp, #0x28]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r7, r5, r4
	movs r2, #0
	strh r2, [r7, #0x18]
	ldr r3, _0805543C @ =0x03000020
	adds r0, r5, r3
	movs r1, #1
	strb r1, [r0]
	strh r2, [r7, #0x1a]
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	movs r0, #0x72
	strh r0, [r7, #0xc]
	movs r0, #4
	strh r0, [r7, #0xe]
	movs r2, #9
	strh r2, [r7, #0x10]
	movs r3, #6
	strh r3, [r7, #0x12]
	strb r1, [r7, #0x16]
	movs r0, #0
	strh r0, [r7, #8]
	movs r0, #0x10
	bl VramMalloc
	str r0, [r7, #0x1c]
	str r0, [sp, #0xc]
	ldr r1, _08055440 @ =0x03000021
	adds r5, r5, r1
	movs r2, #0
	strb r2, [r5]
	ldr r0, _08055444 @ =Task_8055B18
	mov r3, sb
	str r3, [sp]
	movs r1, #0x24
	ldr r2, _08055438 @ =0x00002120
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	adds r7, r5, r4
	movs r0, #0
	strh r0, [r7, #0x18]
	ldr r1, _0805543C @ =0x03000020
	adds r0, r5, r1
	movs r2, #1
	strb r2, [r0]
	movs r3, #0
	strh r3, [r7, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	movs r0, #0x80
	strh r0, [r7, #0xc]
	movs r0, #9
	strh r0, [r7, #0xe]
	movs r1, #2
	mov r8, r1
	mov r2, r8
	strh r2, [r7, #0x10]
	movs r3, #6
	strh r3, [r7, #0x12]
	movs r0, #1
	strb r0, [r7, #0x16]
	movs r1, #0
	strh r1, [r7, #8]
	movs r0, #0x38
	bl VramMalloc
	str r0, [r7, #0x1c]
	str r0, [sp, #0x10]
	ldr r2, _08055440 @ =0x03000021
	adds r5, r5, r2
	movs r3, #0
	strb r3, [r5]
	ldr r0, _08055448 @ =Task_8055458
	movs r2, #0x84
	lsls r2, r2, #6
	ldr r1, _0805544C @ =TaskDestructor_StrcUI28_8055C4C
	str r1, [sp]
	movs r1, #0x28 @ sizeof(Struct_sub_80550F8)
	movs r3, #0
	bl TaskCreate
	adds r5, r0, #0
	ldrh r1, [r5, #6]
	adds r4, r1, r4
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r2, _08055450 @ =0x03000026
	adds r0, r1, r2
	movs r3, #1
	strb r3, [r0]
	ldr r0, [sp, #0x20] @ r0 = t0
	str r0, [r4, #0xc]
	ldr r2, [sp, #0x24]
	str r2, [r4, #0x10]
	ldr r3, [sp, #0x1c]
	str r3, [r4, #0x14]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x18]
	ldr r2, [sp, #0x18]
	str r2, [r4, #0x1c]
	str r6, [r4, #0x20]
	movs r3, #0
	strh r3, [r4]
	strh r3, [r4, #2]
	mov r0, r8
	strh r0, [r4, #4]
	strh r3, [r4, #6]
	movs r0, #0x60
	strh r0, [r4, #8]
	movs r2, #1
	strb r2, [r4, #0xa]
	ldr r3, _08055454 @ =0x03000027
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	add r0, sp, #4
	bl LoadStageIntroGraphics
	adds r0, r4, #0
	bl sub_805423C
	adds r0, r5, #0
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08055430: .4byte Task_8055AA0
_08055434: .4byte TaskDestructor_8055C38
_08055438: .4byte 0x00002120
_0805543C: .4byte 0x03000020
_08055440: .4byte 0x03000021
_08055444: .4byte Task_8055B18
_08055448: .4byte Task_8055458
_0805544C: .4byte TaskDestructor_StrcUI28_8055C4C
_08055450: .4byte 0x03000026
_08055454: .4byte 0x03000027

.syntax divided
