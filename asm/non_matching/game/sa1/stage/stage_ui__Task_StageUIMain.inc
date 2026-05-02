.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, lr}
	sub sp, #0x18
	mov r1, sp
	ldr r0, _08053758 @ =0x0000FFFE
	strh r0, [r1, #0xa]
	adds r0, #1
	strh r0, [r1, #0xc]
	mov r0, sp
	movs r2, #1
	movs r5, #1
	strh r5, [r0, #0xe]
	movs r0, #0x18
	strh r0, [r1, #8]
	movs r0, #3
	strh r0, [r1, #0x10]
	movs r0, #6
	strh r0, [r1, #0x12]
	mov r0, sp
	strb r2, [r0, #0x16]
	ldr r4, _0805375C @ =gUnknown_0865F178
	adds r0, r4, #0
	bl sub_80530CC
	ldr r0, _08053760 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08053738
	mov r1, sp
	movs r0, #0x90
	strh r0, [r1, #0xc]
	movs r0, #2
	strh r0, [r1, #0xa]
	mov r0, sp
	strh r5, [r0, #0x10]
	ldr r0, _08053764 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #0x12]
	adds r0, r4, #0
	bl sub_80530CC
_08053738:
	ldr r0, _08053768 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0     @ r6 = ui
	ldr r2, _0805376C @ =gRingCount
	ldrh r1, [r2]
	ldr r0, _08053770 @ =0x000003E7
	cmp r1, r0
	bls _08053774
	movs r0, #0x29
	strb r0, [r6]
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	b _0805379C
	.align 2, 0
_08053758: .4byte 0x0000FFFE
_0805375C: .4byte gUnknown_0865F178
_08053760: .4byte gGameMode
_08053764: .4byte gSelectedCharacter
_08053768: .4byte gCurTask
_0805376C: .4byte gRingCount
_08053770: .4byte 0x000003E7
_08053774:
	ldrh r4, [r2]
	movs r5, #0
_08053778:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r3, r0, #0
	movs r0, #2
	subs r0, r0, r5
	adds r0, r6, r0
	lsls r1, r3, #3
	lsls r2, r3, #1
	adds r1, r1, r2
	subs r1, r4, r1
	adds r1, #0x20
	strb r1, [r0]
	adds r4, r3, #0
	adds r5, #1
	cmp r5, #2
	ble _08053778
_0805379C:
	ldr r2, _08053800 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	ldr r1, _08053804 @ =0x03000044
	adds r0, r0, r1
	ldr r1, _08053808 @ =gRingCount
	ldrh r1, [r1]
	strh r1, [r0]       @ ui->ringCount = gRingCount;
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	ldr r1, _0805380C @ =0x03000010
	adds r6, r0, r1
	movs r0, #0
	strb r0, [r6, #9]   @ ui->unk10[ARRAY_COUNT(ui->unk10) - 1] = 0;
	ldr r0, _08053810 @ =gLevelScore
	ldr r4, [r0]
	movs r5, #8
_080537BE:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r3, r0, #0
	adds r0, r6, r5
	lsls r1, r3, #3
	lsls r2, r3, #1
	adds r1, r1, r2
	subs r1, r4, r1
	adds r1, #0x20
	strb r1, [r0]
	adds r4, r3, #0
	subs r5, #1
	cmp r5, #0
	bge _080537BE
	ldr r0, _08053814 @ =gCourseTime
	ldr r0, [r0]
	bl StageUI_DrawTimer
	ldr r0, _08053800 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08053818 @ =0x03000030
	adds r6, r0, r1     @ r6 = 
	ldr r0, _0805381C @ =gNumLives
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #9
	bls _08053820
	movs r0, #0x29
	b _0805382A
	.align 2, 0
_08053800: .4byte gCurTask
_08053804: .4byte 0x03000044
_08053808: .4byte gRingCount
_0805380C: .4byte 0x03000010
_08053810: .4byte gLevelScore
_08053814: .4byte gCourseTime
_08053818: .4byte 0x03000030
_0805381C: .4byte gNumLives
_08053820:
	cmp r1, #0
	beq _08053828
	adds r0, #0x1f
	b _0805382A
_08053828:
	movs r0, #0x20
_0805382A:
	strb r0, [r6]
	bl sub_8053BAC
	ldr r0, _08053870 @ =gLoadedSaveGame
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _08053840
	ldr r0, _08053874 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	beq _080538A8
_08053840:
	ldr r0, _08053878 @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08053884
	ldr r4, _0805387C @ =gCourseTime
	ldr r1, [r4]
	ldr r0, _08053880 @ =0x000004AF
	cmp r1, r0
	bhi _080538A8
	adds r0, r1, #0
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _080538A8
	ldr r0, [r4]
	cmp r0, #0
	beq _080538A8
	movs r0, #0x8b
	bl m4aSongNumStart
	b _080538A8
	.align 2, 0
_08053870: .4byte gLoadedSaveGame
_08053874: .4byte gGameMode
_08053878: .4byte gStageFlags
_0805387C: .4byte gCourseTime
_08053880: .4byte 0x000004AF
_08053884:
	ldr r4, _080538B0 @ =gCourseTime
	ldr r1, [r4]
	ldr r0, _080538B4 @ =0x000087F0
	cmp r1, r0
	bls _080538A8
	adds r0, r1, #0
	movs r1, #0x3c
	bl Mod
	cmp r0, #0
	bne _080538A8
	ldr r1, [r4]
	ldr r0, _080538B8 @ =0x00008C9F
	cmp r1, r0
	bhi _080538A8
	movs r0, #0x8b
	bl m4aSongNumStart
_080538A8:
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080538B0: .4byte gCourseTime
_080538B4: .4byte 0x000087F0
_080538B8: .4byte 0x00008C9F

.syntax divided
