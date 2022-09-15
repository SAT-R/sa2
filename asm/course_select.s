.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start CreateCourseSelectionScreen
CreateCourseSelectionScreen: @ 0x080346C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	movs r5, #0
	ldr r0, _08034728 @ =gUnknown_030054D4
	strb r5, [r0, #3]
	strb r5, [r0, #2]
	strb r5, [r0, #1]
	strb r5, [r0]
	cmp r2, #2
	bne _08034700
	ldr r0, _0803472C @ =gLoadedSaveGame
	ldr r0, [r0]
	mov r1, sl
	strb r1, [r0, #0x1a]
	bl WriteSaveGame
_08034700:
	ldr r0, _08034730 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08034712
	mov r2, r8
	cmp r2, #0x1a
	bls _08034712
	movs r3, #0x1a
	mov r8, r3
_08034712:
	mov r0, r8
	cmp r0, #0x1c
	beq _08034758
	cmp r0, #0x1c
	bhi _08034734
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	b _08034752
	.align 2, 0
_08034728: .4byte gUnknown_030054D4
_0803472C: .4byte gLoadedSaveGame
_08034730: .4byte gGameMode
_08034734:
	ldr r0, _08034760 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x1a]
	movs r1, #0x1c
	mov r8, r1
	cmp r0, #0
	beq _08034752
	ldr r0, _08034764 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08034752
	movs r2, #0x1d
	mov r8, r2
_08034752:
	mov r3, r8
	cmp r3, #0x1c
	bne _08034768
_08034758:
	movs r0, #5
	bl m4aSongNumStart
	b _0803477C
	.align 2, 0
_08034760: .4byte gLoadedSaveGame
_08034764: .4byte gSelectedCharacter
_08034768:
	mov r0, r8
	cmp r0, #0x1d
	bne _08034776
	movs r0, #6
	bl m4aSongNumStart
	b _0803477C
_08034776:
	movs r0, #4
	bl m4aSongNumStart
_0803477C:
	ldr r0, _080347E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0803479C
	mov r0, r8
	movs r1, #4
	bl Mod
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803479C
	movs r0, #0xfc
	mov r1, r8
	ands r1, r0
	mov r8, r1
_0803479C:
	ldr r1, _080347E8 @ =gDispCnt
	movs r2, #0x9a
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080347EC @ =gBgCntRegs
	movs r1, #0
	ldr r0, _080347F0 @ =0x00001C0E
	strh r0, [r2, #2]
	ldr r0, _080347F4 @ =0x00005003
	strh r0, [r2]
	ldr r0, _080347F8 @ =gBgScrollRegs
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	movs r0, #3
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	beq _08034808
	ldr r0, _080347E4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08034808
	ldr r0, _080347FC @ =sub_8034E78
	ldr r1, _08034800 @ =0x000004C4
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _08034804 @ =sub_8036040
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	b _0803481A
	.align 2, 0
_080347E4: .4byte gGameMode
_080347E8: .4byte gDispCnt
_080347EC: .4byte gBgCntRegs
_080347F0: .4byte 0x00001C0E
_080347F4: .4byte 0x00005003
_080347F8: .4byte gBgScrollRegs
_080347FC: .4byte sub_8034E78
_08034800: .4byte 0x000004C4
_08034804: .4byte sub_8036040
_08034808:
	ldr r0, _080348F0 @ =sub_8034D70
	ldr r1, _080348F4 @ =0x000004C4
	movs r2, #0xc4
	lsls r2, r2, #6
	ldr r3, _080348F8 @ =sub_8036040
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
_0803481A:
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _080348FC @ =IWRAM_START + 0x4AC
	adds r0, r7, r1
	movs r5, #0
	str r5, [r0]
	lsrs r3, r4, #2
	lsls r3, r3, #1
	movs r6, #1
	adds r0, r4, #0
	ands r0, r6
	orrs r3, r0
	ldr r2, _08034900 @ =IWRAM_START + 0x4B0
	adds r2, r2, r7
	mov ip, r2
	ldr r1, _08034904 @ =gUnknown_080D7358
	lsls r2, r3, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #8
	mov r4, ip
	str r0, [r4]
	ldr r0, _08034908 @ =IWRAM_START + 0x4B4
	adds r4, r7, r0
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #8
	str r0, [r4]
	ldr r2, _0803490C @ =IWRAM_START + 0x4BB
	adds r0, r7, r2
	strb r3, [r0]
	ldr r3, _08034910 @ =IWRAM_START + 0x4BE
	adds r0, r7, r3
	strb r5, [r0]
	ldr r4, _08034914 @ =IWRAM_START + 0x4C0
	adds r0, r7, r4
	strb r5, [r0]
	mov r1, r8
	lsrs r0, r1, #2
	lsls r0, r0, #0x19
	ands r1, r6
	lsrs r2, r0, #0x18
	orrs r2, r1
	movs r1, #3
	mov r3, sl
	ands r1, r3
	cmp r1, #0
	beq _0803488C
	subs r4, #1
	adds r0, r7, r4
	strb r2, [r0]
_0803488C:
	ldr r0, _08034918 @ =gUnknown_080D7478
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r3, _0803491C @ =IWRAM_START + 0x4BA
	adds r4, r7, r3
	strb r0, [r4]
	cmp r1, #0
	beq _080348A4
	cmp r0, #0
	beq _080348A4
	subs r0, #1
	strb r0, [r4]
_080348A4:
	ldr r0, _08034920 @ =0x000004BD
	add r0, sb
	movs r4, #0
	mov r1, sl
	strb r1, [r0]
	ldr r0, _08034924 @ =0x000004BC
	add r0, sb
	strb r2, [r0]
	mov r2, sb
	strh r4, [r2]
	strh r4, [r2, #4]
	movs r0, #2
	strh r0, [r2, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	strh r0, [r2, #8]
	strh r4, [r2, #0xa]
	mov r0, sb
	bl sub_802D4CC
	mov r1, sb
	adds r1, #0x4c
	ldr r0, _08034928 @ =0x0600C000
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _0803492C @ =0x0600E000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	ldr r0, _08034930 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08034938
	ldr r0, _08034934 @ =gSelectedCharacter
	b _0803493A
	.align 2, 0
_080348F0: .4byte sub_8034D70
_080348F4: .4byte 0x000004C4
_080348F8: .4byte sub_8036040
_080348FC: .4byte IWRAM_START + 0x4AC
_08034900: .4byte IWRAM_START + 0x4B0
_08034904: .4byte gUnknown_080D7358
_08034908: .4byte IWRAM_START + 0x4B4
_0803490C: .4byte IWRAM_START + 0x4BB
_08034910: .4byte IWRAM_START + 0x4BE
_08034914: .4byte IWRAM_START + 0x4C0
_08034918: .4byte gUnknown_080D7478
_0803491C: .4byte IWRAM_START + 0x4BA
_08034920: .4byte 0x000004BD
_08034924: .4byte 0x000004BC
_08034928: .4byte 0x0600C000
_0803492C: .4byte 0x0600E000
_08034930: .4byte gGameMode
_08034934: .4byte gSelectedCharacter
_08034938:
	ldr r0, _080349BC @ =gUnknown_03005500
_0803493A:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x64
	strh r0, [r1, #0x1c]
	movs r6, #0
	movs r4, #0
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x1e
	strh r0, [r1, #0x26]
	movs r5, #0x14
	strh r5, [r1, #0x28]
	adds r0, r1, #0
	adds r0, #0x2a
	strb r6, [r0]
	movs r0, #1
	strh r0, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	mov r1, sb
	adds r1, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	strh r4, [r1, #0xa]
	ldr r0, _080349C0 @ =0x06008000
	str r0, [r1, #0xc]
	strh r4, [r1, #0x18]
	strh r4, [r1, #0x1a]
	movs r0, #0x69
	strh r0, [r1, #0x1c]
	strh r4, [r1, #0x1e]
	strh r4, [r1, #0x20]
	strh r4, [r1, #0x22]
	strh r4, [r1, #0x24]
	movs r0, #0x3c
	strh r0, [r1, #0x26]
	strh r5, [r1, #0x28]
	mov r0, sb
	adds r0, #0x36
	strb r6, [r0]
	strh r4, [r1, #0x2e]
	adds r0, r1, #0
	bl sub_8002A3C
	mov r5, sb
	adds r5, #0x8c
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _080349C4 @ =0x000002F7
	strh r0, [r5, #0xa]
	ldr r0, _080349C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080349D0
	ldr r0, _080349CC @ =gSelectedCharacter
	b _080349D2
	.align 2, 0
_080349BC: .4byte gUnknown_03005500
_080349C0: .4byte 0x06008000
_080349C4: .4byte 0x000002F7
_080349C8: .4byte gGameMode
_080349CC: .4byte gSelectedCharacter
_080349D0:
	ldr r0, _08034A98 @ =gUnknown_03005500
_080349D2:
	ldrb r1, [r0]
	mov r0, sb
	adds r0, #0xac
	strb r1, [r0]
	movs r2, #0
	movs r1, #0
	movs r0, #0xc0
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	adds r3, r5, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r1, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r6, #0
	movs r3, #0xaf
	lsls r3, r3, #2
	add r3, sb
	str r3, [sp, #4]
	ldr r4, _08034A9C @ =0x000002BD
	add r4, sb
	str r4, [sp, #8]
	ldr r0, _08034AA0 @ =0x000002BE
	add r0, sb
	str r0, [sp, #0xc]
	ldr r1, _08034AA4 @ =0x000002C1
	add r1, sb
	str r1, [sp, #0x10]
	movs r2, #0xbb
	lsls r2, r2, #2
	add r2, sb
	str r2, [sp, #0x14]
	ldr r3, _08034AA8 @ =0x000002ED
	add r3, sb
	str r3, [sp, #0x18]
	ldr r4, _08034AAC @ =0x000002EE
	add r4, sb
	str r4, [sp, #0x1c]
	ldr r0, _08034AB0 @ =0x000002F1
	add r0, sb
	str r0, [sp, #0x20]
	movs r1, #0xc7
	lsls r1, r1, #2
	add r1, sb
	str r1, [sp, #0x24]
	movs r7, #0
	ldr r2, _08034AB4 @ =gUnknown_080D72B8
	ldr r3, _08034AB8 @ =gUnknown_080D72E8
	mov r8, r3
_08034A50:
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r0, r1, #4
	adds r0, #0xbc
	mov r4, sb
	adds r5, r4, r0
	strh r7, [r5, #0x16]
	strh r7, [r5, #0x18]
	lsls r4, r1, #1
	adds r0, r4, r2
	ldrh r0, [r0]
	str r2, [sp, #0x28]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #3
	mov r1, sl
	ands r0, r1
	ldr r2, [sp, #0x28]
	cmp r0, #0
	beq _08034AC4
	ldr r0, _08034ABC @ =0x000004BA
	add r0, sb
	ldrb r0, [r0]
	cmp r0, r6
	bne _08034AC4
	mov r0, r8
	adds r0, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldr r3, _08034AC0 @ =gUnknown_080D72EC
	adds r0, r4, r3
	ldrh r1, [r0]
	b _08034AD8
	.align 2, 0
_08034A98: .4byte gUnknown_03005500
_08034A9C: .4byte 0x000002BD
_08034AA0: .4byte 0x000002BE
_08034AA4: .4byte 0x000002C1
_08034AA8: .4byte 0x000002ED
_08034AAC: .4byte 0x000002EE
_08034AB0: .4byte 0x000002F1
_08034AB4: .4byte gUnknown_080D72B8
_08034AB8: .4byte gUnknown_080D72E8
_08034ABC: .4byte 0x000004BA
_08034AC0: .4byte gUnknown_080D72EC
_08034AC4:
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r0, r2, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldr r4, _08034C54 @ =gUnknown_080D72BC
	adds r1, r1, r4
	ldrh r1, [r1]
_08034AD8:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r7, [r5, #8]
	strh r7, [r5, #0x14]
	strh r7, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r7, [r5, #0x10]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _08034A50
	movs r6, #0
	movs r0, #0
	mov r8, r0
	movs r4, #0
_08034B18:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r2, sb
	adds r5, r2, r0
	lsls r0, r6, #5
	adds r0, #0xb8
	strh r0, [r5, #0x16]
	strh r4, [r5, #0x18]
	movs r0, #4
	bl VramMalloc
	str r0, [r5, #4]
	ldr r3, _08034C58 @ =0x000002F6
	strh r3, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	mov r1, r8
	strb r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r3, #1
	rsbs r3, r3, #0
	adds r7, r3, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x22
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #3
	mov r2, r8
	strb r2, [r0]
	mov sl, r3
	str r3, [r5, #0x28]
	str r4, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _08034B18
	movs r5, #0xa7
	lsls r5, r5, #2
	add r5, sb
	movs r3, #0
	mov r8, r3
	movs r4, #0
	movs r0, #0x80
	strh r0, [r5, #0x16]
	strh r4, [r5, #0x18]
	movs r0, #0x1a
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _08034C5C @ =0x000002F5
	strh r0, [r5, #0xa]
	mov r1, r8
	ldr r0, [sp, #4]
	strb r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	orrs r0, r7
	strb r0, [r3]
	movs r1, #0x10
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	mov r3, r8
	ldr r2, [sp, #0x10]
	strb r3, [r2]
	mov r0, sl
	str r0, [r5, #0x28]
	str r4, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r5, #0xb3
	lsls r5, r5, #2
	add r5, sb
	movs r0, #0xf0
	strh r0, [r5, #0x16]
	movs r0, #0x18
	strh r0, [r5, #0x18]
	movs r0, #0x26
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _08034C60 @ =0x000002F9
	strh r0, [r5, #0xa]
	mov r2, r8
	ldr r1, [sp, #0x14]
	strb r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r5, #0x1a]
	strh r4, [r5, #8]
	strh r4, [r5, #0x14]
	strh r4, [r5, #0x1c]
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	orrs r0, r7
	strb r0, [r1]
	movs r3, #0x10
	ldr r2, [sp, #0x1c]
	strb r3, [r2]
	mov r1, r8
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	mov r2, sl
	str r2, [r5, #0x28]
	str r4, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r6, #0xbf
	lsls r6, r6, #2
	mov r3, sb
	adds r5, r3, r6
	strh r4, [r5, #0x16]
	strh r4, [r5, #0x18]
	ldr r0, _08034C64 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _08034C84
	movs r0, #0x18
	bl VramMalloc
	str r0, [r5, #4]
	ldr r0, _08034C68 @ =0x000002FB
	strh r0, [r5, #0xa]
	ldr r0, _08034C6C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08034C74
	ldr r0, _08034C70 @ =gSelectedCharacter
	ldrb r0, [r0]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	b _08034CB0
	.align 2, 0
_08034C54: .4byte gUnknown_080D72BC
_08034C58: .4byte 0x000002F6
_08034C5C: .4byte 0x000002F5
_08034C60: .4byte 0x000002F9
_08034C64: .4byte gLoadedSaveGame
_08034C68: .4byte 0x000002FB
_08034C6C: .4byte gGameMode
_08034C70: .4byte gSelectedCharacter
_08034C74:
	ldr r0, _08034C80 @ =gUnknown_03005500
	ldrb r0, [r0]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	b _08034CB0
	.align 2, 0
_08034C80: .4byte gUnknown_03005500
_08034C84:
	movs r0, #0x1c
	bl VramMalloc
	str r0, [r5, #4]
	strh r6, [r5, #0xa]
	ldr r0, _08034CA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08034CA8
	ldr r0, _08034CA4 @ =gSelectedCharacter
	ldrb r0, [r0]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	b _08034CB0
	.align 2, 0
_08034CA0: .4byte gGameMode
_08034CA4: .4byte gSelectedCharacter
_08034CA8:
	ldr r0, _08034D64 @ =gUnknown_03005500
	ldrb r0, [r0]
	ldr r3, [sp, #0x24]
	strb r0, [r3]
_08034CB0:
	movs r2, #0
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r1, [r5, #8]
	strh r1, [r5, #0x14]
	strh r1, [r5, #0x1c]
	adds r3, r5, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r1, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	movs r6, #0
	movs r7, #0
	movs r2, #0
	ldr r3, _08034D68 @ =gUnknown_080D7458
	adds r4, r3, #2
_08034CEC:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #4
	movs r1, #0xcb
	lsls r1, r1, #2
	adds r0, r0, r1
	mov r1, sb
	adds r5, r1, r0
	strh r2, [r5, #0x16]
	movs r0, #0x88
	strh r0, [r5, #0x18]
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #5
	ldr r1, _08034D6C @ =0x06010000
	adds r0, r0, r1
	str r0, [r5, #4]
	lsls r1, r6, #2
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	adds r1, r1, r4
	ldrh r1, [r1]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r2, [r5, #0x10]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _08034CEC
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034D64: .4byte gUnknown_03005500
_08034D68: .4byte gUnknown_080D7458
_08034D6C: .4byte 0x06010000

	thumb_func_start sub_8034D70
sub_8034D70: @ 0x08034D70
	push {r4, lr}
	ldr r0, _08034D98 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _08034D9C @ =IWRAM_START + 0x4AC
	adds r1, r1, r0
	ldr r0, [r1]
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _08034DA0
	movs r0, #0
	str r0, [r1]
	b _08034DAA
	.align 2, 0
_08034D98: .4byte gCurTask
_08034D9C: .4byte IWRAM_START + 0x4AC
_08034DA0:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _08034DAA
	str r2, [r1]
_08034DAA:
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08034E2C
	ldr r3, _08034E0C @ =0x000004AC
	adds r2, r4, r3
	ldr r1, [r2]
	movs r0, #0xf0
	lsls r0, r0, #8
	cmp r1, r0
	beq _08034DD4
	adds r3, #4
	adds r0, r4, r3
	ldr r0, [r0]
	ldr r3, _08034E10 @ =0xFFFF8800
	adds r0, r0, r3
	cmp r1, r0
	blt _08034E4C
_08034DD4:
	movs r1, #0x96
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r3, _08034E10 @ =0xFFFF8800
	adds r0, r0, r3
	str r0, [r2]
	adds r1, #0xd
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08034E24
	ldr r0, _08034E14 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08034E24
	ldr r2, _08034E18 @ =0x000004BB
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08034E1C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08034E20 @ =sub_80359D4
	b _08034E2A
	.align 2, 0
_08034E0C: .4byte 0x000004AC
_08034E10: .4byte 0xFFFF8800
_08034E14: .4byte gGameMode
_08034E18: .4byte 0x000004BB
_08034E1C: .4byte gCurTask
_08034E20: .4byte sub_80359D4
_08034E24:
	ldr r0, _08034E64 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08034E68 @ =sub_8035124
_08034E2A:
	str r0, [r1, #8]
_08034E2C:
	ldr r3, _08034E6C @ =0x000004AC
	adds r2, r4, r3
	movs r1, #0x96
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r3, _08034E70 @ =0xFFFF8800
	adds r1, r0, r3
	ldr r0, [r2]
	cmp r0, r1
	blt _08034E4C
	str r1, [r2]
	cmp r1, #0
	bge _08034E4C
	movs r0, #0
	str r0, [r2]
_08034E4C:
	ldr r1, _08034E74 @ =gBgScrollRegs
	ldr r2, _08034E6C @ =0x000004AC
	adds r0, r4, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034E64: .4byte gCurTask
_08034E68: .4byte sub_8035124
_08034E6C: .4byte 0x000004AC
_08034E70: .4byte 0xFFFF8800
_08034E74: .4byte gBgScrollRegs

	thumb_func_start sub_8034E78
sub_8034E78: @ 0x08034E78
	push {r4, r5, r6, r7, lr}
	ldr r7, _08034F18 @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r0, _08034F1C @ =IWRAM_START + 0x2CC
	adds r1, r4, r0
	ldrh r0, [r1, #0x16]
	subs r0, #0x10
	strh r0, [r1, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08034E9C
	movs r0, #0x50
	strh r0, [r1, #0x16]
_08034E9C:
	adds r0, r5, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08034EF2
	ldr r1, _08034F20 @ =IWRAM_START + 0x4AC
	adds r6, r4, r1
	ldr r2, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r1, #0x13
	adds r3, r4, r1
	cmp r2, r0
	beq _08034ED2
	ldr r0, _08034F24 @ =gUnknown_080D7488
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #8
	ldr r1, _08034F28 @ =0xFFFF8800
	adds r0, r0, r1
	cmp r2, r0
	blt _08034EF2
_08034ED2:
	ldr r1, _08034F24 @ =gUnknown_080D7488
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	ldr r3, _08034F28 @ =0xFFFF8800
	adds r0, r0, r3
	str r0, [r6]
	movs r0, #0xd6
	bl m4aSongNumStart
	ldr r1, [r7]
	ldr r0, _08034F2C @ =sub_8034F64
	str r0, [r1, #8]
_08034EF2:
	ldr r4, _08034F30 @ =0x000004AC
	adds r2, r5, r4
	ldr r1, _08034F24 @ =gUnknown_080D7488
	ldr r3, _08034F34 @ =0x000004BF
	adds r0, r5, r3
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #8
	ldr r1, _08034F28 @ =0xFFFF8800
	adds r0, r0, r1
	str r0, [r2]
	cmp r0, #0
	bge _08034F38
	movs r0, #0
	str r0, [r2]
	b _08034F42
	.align 2, 0
_08034F18: .4byte gCurTask
_08034F1C: .4byte IWRAM_START + 0x2CC
_08034F20: .4byte IWRAM_START + 0x4AC
_08034F24: .4byte gUnknown_080D7488
_08034F28: .4byte 0xFFFF8800
_08034F2C: .4byte sub_8034F64
_08034F30: .4byte 0x000004AC
_08034F34: .4byte 0x000004BF
_08034F38:
	movs r1, #0xf0
	lsls r1, r1, #8
	cmp r0, r1
	ble _08034F42
	str r1, [r2]
_08034F42:
	ldr r1, _08034F5C @ =gBgScrollRegs
	ldr r2, _08034F60 @ =0x000004AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_8035FCC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034F5C: .4byte gBgScrollRegs
_08034F60: .4byte 0x000004AC

	thumb_func_start sub_8034F64
sub_8034F64: @ 0x08034F64
	push {r4, r5, r6, lr}
	ldr r6, _08034FD0 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r4, r0
	ldr r0, _08034FD4 @ =IWRAM_START + 0x2CC
	adds r5, r4, r0
	ldr r3, _08034FD8 @ =IWRAM_START + 0x4BE
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r0, [r5, #0x16]
	subs r0, #0x10
	strh r0, [r5, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08034F92
	movs r0, #0x50
	strh r0, [r5, #0x16]
_08034F92:
	ldr r1, _08034FDC @ =gBgScrollRegs
	ldr r3, _08034FE0 @ =IWRAM_START + 0x4AC
	adds r0, r4, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r2, #0
	bl sub_8035B44
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034FC8
	ldr r1, [r6]
	ldr r0, _08034FE4 @ =sub_8034FF0
	str r0, [r1, #8]
	movs r0, #0xf0
	strh r0, [r5, #0x16]
	ldr r0, _08034FE8 @ =IWRAM_START + 0x4BA
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, _08034FEC @ =IWRAM_START + 0x4BC
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08034FC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034FD0: .4byte gCurTask
_08034FD4: .4byte IWRAM_START + 0x2CC
_08034FD8: .4byte IWRAM_START + 0x4BE
_08034FDC: .4byte gBgScrollRegs
_08034FE0: .4byte IWRAM_START + 0x4AC
_08034FE4: .4byte sub_8034FF0
_08034FE8: .4byte IWRAM_START + 0x4BA
_08034FEC: .4byte IWRAM_START + 0x4BC

	thumb_func_start sub_8034FF0
sub_8034FF0: @ 0x08034FF0
	push {r4, r5, lr}
	ldr r2, _08035018 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0803501C @ =IWRAM_START + 0x4AC
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r3, _08035020 @ =0xFFFFFD00
	adds r0, r0, r3
	str r0, [r1]
	adds r3, r2, #0
	cmp r0, #0
	bge _08035024
	movs r0, #0
	str r0, [r1]
	b _0803502E
	.align 2, 0
_08035018: .4byte gCurTask
_0803501C: .4byte IWRAM_START + 0x4AC
_08035020: .4byte 0xFFFFFD00
_08035024:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _0803502E
	str r2, [r1]
_0803502E:
	ldr r5, _0803508C @ =0x000004AC
	adds r2, r4, r5
	ldr r1, [r2]
	cmp r1, #0
	beq _08035046
	adds r5, #4
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r5, _08035090 @ =0xFFFF8800
	adds r0, r0, r5
	cmp r1, r0
	bgt _080350F2
_08035046:
	movs r1, #0x96
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r5, _08035090 @ =0xFFFF8800
	adds r0, r0, r5
	str r0, [r2]
	adds r1, #0xd
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080350A8
	ldr r3, _08035094 @ =0x000004BB
	adds r2, r4, r3
	ldr r5, _08035098 @ =0x000004BC
	adds r0, r4, r5
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08035076
	adds r0, r1, #1
	strb r0, [r2]
_08035076:
	ldr r0, _0803509C @ =0x000004BE
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xd5
	bl m4aSongNumStart
	ldr r0, _080350A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080350A4 @ =sub_80359D4
	b _080350D0
	.align 2, 0
_0803508C: .4byte 0x000004AC
_08035090: .4byte 0xFFFF8800
_08035094: .4byte 0x000004BB
_08035098: .4byte 0x000004BC
_0803509C: .4byte 0x000004BE
_080350A0: .4byte gCurTask
_080350A4: .4byte sub_80359D4
_080350A8:
	ldr r2, _0803510C @ =0x000004BC
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, #0x10
	bne _080350CC
	movs r0, #0xf
	strb r0, [r1]
	movs r5, #0x83
	lsls r5, r5, #2
	adds r2, r4, r5
	ldr r1, _08035110 @ =gUnknown_080D72B8
	ldrh r0, [r1, #0x2c]
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #0x2e]
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r1, [r0]
_080350CC:
	ldr r1, [r3]
	ldr r0, _08035114 @ =sub_8035124
_080350D0:
	str r0, [r1, #8]
	ldr r3, _08035118 @ =0x000004AC
	adds r2, r4, r3
	movs r5, #0x96
	lsls r5, r5, #3
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r3, _0803511C @ =0xFFFF8800
	adds r1, r0, r3
	ldr r0, [r2]
	cmp r0, r1
	bgt _080350F2
	str r1, [r2]
	cmp r1, #0
	bge _080350F2
	movs r0, #0
	str r0, [r2]
_080350F2:
	ldr r1, _08035120 @ =gBgScrollRegs
	ldr r5, _08035118 @ =0x000004AC
	adds r0, r4, r5
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803510C: .4byte 0x000004BC
_08035110: .4byte gUnknown_080D72B8
_08035114: .4byte sub_8035124
_08035118: .4byte 0x000004AC
_0803511C: .4byte 0xFFFF8800
_08035120: .4byte gBgScrollRegs

	thumb_func_start sub_8035124
sub_8035124: @ 0x08035124
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0803519C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080351A0 @ =IWRAM_START + 0x2CC
	adds r0, r0, r1
	mov ip, r0
	adds r5, r6, #0
	ldr r0, _080351A4 @ =gGameMode
	ldrb r1, [r0]
	mov sb, r0
	cmp r1, #2
	bls _08035220
	movs r3, #0
	ldr r0, _080351A8 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov r8, r0
	cmp r1, #0
	beq _080351E4
	movs r7, #1
	ldr r2, _080351AC @ =gUnknown_030054D4
_0803515E:
	ldr r1, _080351B0 @ =gMultiSioStatusFlags
	adds r0, r7, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080351CC
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080351D0
	movs r0, #0
	ldr r1, _080351B4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080351B8 @ =gUnknown_03002AE4
	ldr r0, _080351BC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080351C0 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080351C4 @ =gUnknown_03004D5C
	ldr r0, _080351C8 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _08035540
	.align 2, 0
_0803519C: .4byte gCurTask
_080351A0: .4byte IWRAM_START + 0x2CC
_080351A4: .4byte gGameMode
_080351A8: .4byte gUnknown_030055B8
_080351AC: .4byte gUnknown_030054D4
_080351B0: .4byte gMultiSioStatusFlags
_080351B4: .4byte 0x0000FFFF
_080351B8: .4byte gUnknown_03002AE4
_080351BC: .4byte gUnknown_0300287C
_080351C0: .4byte gUnknown_03005390
_080351C4: .4byte gUnknown_03004D5C
_080351C8: .4byte gUnknown_03002A84
_080351CC:
	movs r0, #0
	strb r0, [r2]
_080351D0:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _080351E4
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r7
	cmp r0, #0
	bne _0803515E
_080351E4:
	mov r2, sb
	ldrb r0, [r2]
	cmp r0, #2
	bls _08035220
	ldr r2, _08035280 @ =gMultiSioRecv
	ldr r0, _08035284 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08035220
	ldrh r1, [r2]
	ldr r0, _08035288 @ =0x0000404F
	cmp r1, r0
	bls _08035220
	ldrb r1, [r2, #2]
	ldr r3, _0803528C @ =0x000004BB
	adds r0, r6, r3
	strb r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #3
	adds r1, r6, r0
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	str r0, [r1]
	subs r3, #7
	adds r1, r6, r3
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	str r0, [r1]
_08035220:
	mov r1, ip
	ldrh r0, [r1, #0x16]
	subs r0, #0x10
	movs r3, #0
	strh r0, [r1, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035236
	movs r0, #0x50
	strh r0, [r1, #0x16]
_08035236:
	mov r0, sb
	ldrb r2, [r0]
	cmp r2, #2
	bls _0803524C
	ldr r0, _08035284 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803524C
	b _0803543E
_0803524C:
	movs r1, #0x98
	lsls r1, r1, #3
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035298
	cmp r2, #2
	bhi _08035298
	strh r3, [r5]
	strh r3, [r5, #4]
	movs r0, #1
	strh r0, [r5, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #6]
	movs r0, #0xff
	strh r0, [r5, #8]
	strh r3, [r5, #0xa]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _08035290 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08035294 @ =sub_8035E70
	b _0803543C
	.align 2, 0
_08035280: .4byte gMultiSioRecv
_08035284: .4byte gMultiSioStatusFlags
_08035288: .4byte 0x0000404F
_0803528C: .4byte 0x000004BB
_08035290: .4byte gCurTask
_08035294: .4byte sub_8035E70
_08035298:
	ldr r2, _080352F0 @ =gInput
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08035304
	movs r3, #0x98
	lsls r3, r3, #3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035304
	ldr r1, _080352F4 @ =0x000004BB
	adds r0, r6, r1
	ldrb r1, [r0]
	adds r2, r1, #0
	cmp r2, #0
	bne _080352BE
	b _0803543E
_080352BE:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080352CA
	cmp r2, #0xd
	bls _080352D0
_080352CA:
	movs r0, #0xf0
	mov r2, ip
	strh r0, [r2, #0x16]
_080352D0:
	ldr r3, _080352F8 @ =0x000004BE
	adds r1, r6, r3
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080352F4 @ =0x000004BB
	adds r1, r6, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #0xd5
	bl m4aSongNumStart
	ldr r0, _080352FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08035300 @ =sub_8035554
	b _0803543C
	.align 2, 0
_080352F0: .4byte gInput
_080352F4: .4byte 0x000004BB
_080352F8: .4byte 0x000004BE
_080352FC: .4byte gCurTask
_08035300: .4byte sub_8035554
_08035304:
	ldrh r1, [r2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08035374
	movs r1, #0x98
	lsls r1, r1, #3
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035374
	ldr r2, _08035360 @ =0x000004BB
	adds r0, r6, r2
	ldr r3, _08035364 @ =0x000004BC
	adds r1, r6, r3
	ldrb r2, [r0]
	adds r3, r2, #0
	ldrb r1, [r1]
	cmp r3, r1
	blo _0803532E
	b _0803543E
_0803532E:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0803533A
	cmp r3, #0xd
	bls _08035340
_0803533A:
	movs r0, #0xf0
	mov r1, ip
	strh r0, [r1, #0x16]
_08035340:
	ldr r2, _08035368 @ =0x000004BE
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	ldr r3, _08035360 @ =0x000004BB
	adds r1, r6, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xd5
	bl m4aSongNumStart
	ldr r0, _0803536C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08035370 @ =sub_8035750
	b _0803543C
	.align 2, 0
_08035360: .4byte 0x000004BB
_08035364: .4byte 0x000004BC
_08035368: .4byte 0x000004BE
_0803536C: .4byte gCurTask
_08035370: .4byte sub_8035750
_08035374:
	ldrh r0, [r2]
	movs r3, #0x30
	ands r3, r0
	ldr r7, _080353B4 @ =gPressedKeys
	cmp r3, #0
	bne _080353C0
	ldrh r1, [r7]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080353C0
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #2
	bhi _080353C0
	strh r3, [r5]
	strh r3, [r5, #4]
	strh r4, [r5, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #6]
	movs r0, #0xff
	strh r0, [r5, #8]
	strh r3, [r5, #0xa]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _080353B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080353BC @ =sub_8035E70
	b _0803543C
	.align 2, 0
_080353B4: .4byte gPressedKeys
_080353B8: .4byte gCurTask
_080353BC: .4byte sub_8035E70
_080353C0:
	ldrh r1, [r7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08035400
	mov r3, sb
	ldrb r0, [r3]
	cmp r0, #2
	bhi _08035400
	movs r1, #0
	strh r1, [r5]
	strh r1, [r5, #4]
	movs r0, #1
	strh r0, [r5, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #6]
	movs r0, #0xff
	strh r0, [r5, #8]
	strh r1, [r5, #0xa]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, _080353F8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080353FC @ =sub_8035F60
	b _0803543C
	.align 2, 0
_080353F8: .4byte gCurTask
_080353FC: .4byte sub_8035F60
_08035400:
	ldrh r0, [r2]
	movs r2, #0x30
	ands r2, r0
	cmp r2, #0
	bne _0803543E
	ldrh r1, [r7]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803543E
	ldr r0, _080354F0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0803543E
	strh r2, [r5]
	strh r2, [r5, #4]
	strh r3, [r5, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #6]
	movs r0, #0xff
	strh r0, [r5, #8]
	strh r2, [r5, #0xa]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _080354F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080354F8 @ =sub_8035EF0
_0803543C:
	str r0, [r1, #8]
_0803543E:
	ldr r0, _080354F0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080354D4
	ldr r2, _080354FC @ =gMultiSioSend
	ldr r0, _08035500 @ =0x00004050
	strh r0, [r2]
	ldr r1, _08035504 @ =0x000004BB
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r2, #2]
	movs r3, #0x96
	lsls r3, r3, #3
	adds r0, r6, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r2, #4]
	subs r1, #7
	adds r0, r6, r1
	ldr r0, [r0]
	asrs r0, r0, #8
	strb r0, [r2, #3]
	ldr r0, _08035508 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080354A6
	ldr r0, _0803550C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0803548C
	adds r3, #0x10
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080354A6
_0803548C:
	ldr r0, _08035510 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080354A6
	movs r1, #0x98
	lsls r1, r1, #3
	adds r0, r6, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08035514 @ =0x00004051
	strh r0, [r2]
_080354A6:
	ldr r2, _08035518 @ =gMultiSioRecv
	ldrh r1, [r2]
	ldr r0, _08035514 @ =0x00004051
	cmp r1, r0
	bne _080354D4
	movs r1, #0
	strh r1, [r5]
	strh r1, [r5, #4]
	movs r0, #1
	strh r0, [r5, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #6]
	movs r0, #0xff
	strh r0, [r5, #8]
	strh r1, [r5, #0xa]
	ldr r0, _080354F4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080354F8 @ =sub_8035EF0
	str r0, [r1, #8]
	movs r0, #0x6a
	bl m4aSongNumStart
_080354D4:
	ldr r2, _0803551C @ =0x000004AC
	adds r1, r6, r2
	movs r3, #0x96
	lsls r3, r3, #3
	adds r0, r6, r3
	ldr r0, [r0]
	ldr r2, _08035520 @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _08035524
	movs r0, #0
	str r0, [r1]
	b _0803552E
	.align 2, 0
_080354F0: .4byte gGameMode
_080354F4: .4byte gCurTask
_080354F8: .4byte sub_8035EF0
_080354FC: .4byte gMultiSioSend
_08035500: .4byte 0x00004050
_08035504: .4byte 0x000004BB
_08035508: .4byte gMultiSioStatusFlags
_0803550C: .4byte gPressedKeys
_08035510: .4byte gRepeatedKeys
_08035514: .4byte 0x00004051
_08035518: .4byte gMultiSioRecv
_0803551C: .4byte 0x000004AC
_08035520: .4byte 0xFFFF8800
_08035524:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _0803552E
	str r2, [r1]
_0803552E:
	ldr r1, _0803554C @ =gBgScrollRegs
	ldr r3, _08035550 @ =0x000004AC
	adds r0, r6, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_8035FCC
_08035540:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803554C: .4byte gBgScrollRegs
_08035550: .4byte 0x000004AC

	thumb_func_start sub_8035554
sub_8035554: @ 0x08035554
	push {r4, r5, r6, r7, lr}
	ldr r0, _080355C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080355C4 @ =IWRAM_START + 0x2CC
	adds r7, r1, r0
	ldr r0, _080355C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08035608
	movs r3, #0
	ldr r0, _080355CC @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _08035608
	movs r5, #1
	ldr r2, _080355D0 @ =gUnknown_030054D4
_08035582:
	ldr r1, _080355D4 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080355F0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080355F4
	movs r0, #0
	ldr r1, _080355D8 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080355DC @ =gUnknown_03002AE4
	ldr r0, _080355E0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080355E4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080355E8 @ =gUnknown_03004D5C
	ldr r0, _080355EC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _0803572C
	.align 2, 0
_080355C0: .4byte gCurTask
_080355C4: .4byte IWRAM_START + 0x2CC
_080355C8: .4byte gGameMode
_080355CC: .4byte gUnknown_030055B8
_080355D0: .4byte gUnknown_030054D4
_080355D4: .4byte gMultiSioStatusFlags
_080355D8: .4byte 0x0000FFFF
_080355DC: .4byte gUnknown_03002AE4
_080355E0: .4byte gUnknown_0300287C
_080355E4: .4byte gUnknown_03005390
_080355E8: .4byte gUnknown_03004D5C
_080355EC: .4byte gUnknown_03002A84
_080355F0:
	movs r0, #0
	strb r0, [r2]
_080355F4:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08035608
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08035582
_08035608:
	ldrh r0, [r7, #0x16]
	subs r0, #0x10
	strh r0, [r7, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _0803561A
	movs r0, #0x50
	strh r0, [r7, #0x16]
_0803561A:
	movs r2, #0x96
	lsls r2, r2, #3
	adds r7, r6, r2
	ldr r3, _080356AC @ =gSineTable
	ldr r2, _080356B0 @ =gUnknown_080D74C8
	ldr r0, _080356B4 @ =0x000004BB
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	ldr r0, _080356B8 @ =0x000004B4
	adds r4, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _080356BC @ =gUnknown_080D7358
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #8
	ldr r0, [r7]
	cmp r0, r2
	bge _08035696
	str r2, [r7]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0xd7
	bl m4aSongNumStart
	ldr r0, _080356C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080356C4 @ =sub_803594C
	str r0, [r1, #8]
_08035696:
	ldr r2, _080356C8 @ =0x000004AC
	adds r1, r6, r2
	ldr r0, [r7]
	ldr r2, _080356CC @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _080356D0
	movs r0, #0
	str r0, [r1]
	b _080356DA
	.align 2, 0
_080356AC: .4byte gSineTable
_080356B0: .4byte gUnknown_080D74C8
_080356B4: .4byte 0x000004BB
_080356B8: .4byte 0x000004B4
_080356BC: .4byte gUnknown_080D7358
_080356C0: .4byte gCurTask
_080356C4: .4byte sub_803594C
_080356C8: .4byte 0x000004AC
_080356CC: .4byte 0xFFFF8800
_080356D0:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _080356DA
	str r2, [r1]
_080356DA:
	ldr r0, _08035734 @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080356F0
	movs r0, #0x98
	lsls r0, r0, #3
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
_080356F0:
	ldr r0, _08035738 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0803571A
	ldr r1, _0803573C @ =gMultiSioSend
	ldr r0, _08035740 @ =0x00004050
	strh r0, [r1]
	ldr r2, _08035744 @ =0x000004BB
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	subs r2, #0xb
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #4]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strb r0, [r1, #3]
_0803571A:
	ldr r1, _08035748 @ =gBgScrollRegs
	ldr r2, _0803574C @ =0x000004AC
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_8035FCC
_0803572C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035734: .4byte gInput
_08035738: .4byte gGameMode
_0803573C: .4byte gMultiSioSend
_08035740: .4byte 0x00004050
_08035744: .4byte 0x000004BB
_08035748: .4byte gBgScrollRegs
_0803574C: .4byte 0x000004AC

	thumb_func_start sub_8035750
sub_8035750: @ 0x08035750
	push {r4, r5, r6, r7, lr}
	ldr r0, _080357BC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080357C0 @ =IWRAM_START + 0x2CC
	adds r7, r1, r0
	ldr r0, _080357C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08035804
	movs r3, #0
	ldr r0, _080357C8 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _08035804
	movs r5, #1
	ldr r2, _080357CC @ =gUnknown_030054D4
_0803577E:
	ldr r1, _080357D0 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080357EC
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080357F0
	movs r0, #0
	ldr r1, _080357D4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080357D8 @ =gUnknown_03002AE4
	ldr r0, _080357DC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080357E0 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080357E4 @ =gUnknown_03004D5C
	ldr r0, _080357E8 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _08035928
	.align 2, 0
_080357BC: .4byte gCurTask
_080357C0: .4byte IWRAM_START + 0x2CC
_080357C4: .4byte gGameMode
_080357C8: .4byte gUnknown_030055B8
_080357CC: .4byte gUnknown_030054D4
_080357D0: .4byte gMultiSioStatusFlags
_080357D4: .4byte 0x0000FFFF
_080357D8: .4byte gUnknown_03002AE4
_080357DC: .4byte gUnknown_0300287C
_080357E0: .4byte gUnknown_03005390
_080357E4: .4byte gUnknown_03004D5C
_080357E8: .4byte gUnknown_03002A84
_080357EC:
	movs r0, #0
	strb r0, [r2]
_080357F0:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08035804
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0803577E
_08035804:
	ldrh r0, [r7, #0x16]
	subs r0, #0x10
	strh r0, [r7, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035816
	movs r0, #0x50
	strh r0, [r7, #0x16]
_08035816:
	movs r2, #0x96
	lsls r2, r2, #3
	adds r7, r6, r2
	ldr r3, _080358A8 @ =gSineTable
	ldr r2, _080358AC @ =gUnknown_080D74E8
	ldr r0, _080358B0 @ =0x000004BB
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	ldr r0, _080358B4 @ =0x000004B4
	adds r4, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _080358B8 @ =gUnknown_080D7358
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #8
	ldr r0, [r7]
	cmp r0, r2
	ble _08035892
	str r2, [r7]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0xd7
	bl m4aSongNumStart
	ldr r0, _080358BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080358C0 @ =sub_803594C
	str r0, [r1, #8]
_08035892:
	ldr r2, _080358C4 @ =0x000004AC
	adds r1, r6, r2
	ldr r0, [r7]
	ldr r2, _080358C8 @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _080358CC
	movs r0, #0
	str r0, [r1]
	b _080358D6
	.align 2, 0
_080358A8: .4byte gSineTable
_080358AC: .4byte gUnknown_080D74E8
_080358B0: .4byte 0x000004BB
_080358B4: .4byte 0x000004B4
_080358B8: .4byte gUnknown_080D7358
_080358BC: .4byte gCurTask
_080358C0: .4byte sub_803594C
_080358C4: .4byte 0x000004AC
_080358C8: .4byte 0xFFFF8800
_080358CC:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _080358D6
	str r2, [r1]
_080358D6:
	ldr r0, _08035930 @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080358EC
	movs r0, #0x98
	lsls r0, r0, #3
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
_080358EC:
	ldr r0, _08035934 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08035916
	ldr r1, _08035938 @ =gMultiSioSend
	ldr r0, _0803593C @ =0x00004050
	strh r0, [r1]
	ldr r2, _08035940 @ =0x000004BB
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	subs r2, #0xb
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #4]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strb r0, [r1, #3]
_08035916:
	ldr r1, _08035944 @ =gBgScrollRegs
	ldr r2, _08035948 @ =0x000004AC
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_8035FCC
_08035928:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035930: .4byte gInput
_08035934: .4byte gGameMode
_08035938: .4byte gMultiSioSend
_0803593C: .4byte 0x00004050
_08035940: .4byte 0x000004BB
_08035944: .4byte gBgScrollRegs
_08035948: .4byte 0x000004AC

	thumb_func_start sub_803594C
sub_803594C: @ 0x0803594C
	push {r4, lr}
	ldr r3, _080359B4 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	ldr r0, _080359B8 @ =IWRAM_START + 0x2CC
	adds r1, r2, r0
	ldrh r0, [r1, #0x16]
	subs r0, #0x10
	strh r0, [r1, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035970
	movs r0, #0x50
	strh r0, [r1, #0x16]
_08035970:
	ldr r0, _080359BC @ =IWRAM_START + 0x4BE
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08035988
	ldr r1, [r3]
	ldr r0, _080359C0 @ =sub_8035124
	str r0, [r1, #8]
_08035988:
	ldr r0, _080359C4 @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803599C
	ldr r3, _080359C8 @ =IWRAM_START + 0x4C0
	adds r1, r2, r3
	movs r0, #1
	strb r0, [r1]
_0803599C:
	ldr r1, _080359CC @ =gBgScrollRegs
	ldr r3, _080359D0 @ =IWRAM_START + 0x4AC
	adds r0, r2, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080359B4: .4byte gCurTask
_080359B8: .4byte IWRAM_START + 0x2CC
_080359BC: .4byte IWRAM_START + 0x4BE
_080359C0: .4byte sub_8035124
_080359C4: .4byte gInput
_080359C8: .4byte IWRAM_START + 0x4C0
_080359CC: .4byte gBgScrollRegs
_080359D0: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_80359D4
sub_80359D4: @ 0x080359D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08035A94 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _08035A98 @ =IWRAM_START + 0x2CC
	adds r1, r7, r2
	ldrh r0, [r1, #0x16]
	subs r0, #0x10
	strh r0, [r1, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035A02
	movs r0, #0x50
	strh r0, [r1, #0x16]
_08035A02:
	ldr r0, _08035A9C @ =IWRAM_START + 0x4B0
	adds r6, r7, r0
	ldr r3, _08035AA0 @ =gSineTable
	ldr r2, _08035AA4 @ =gUnknown_080D74E8
	ldr r1, _08035AA8 @ =IWRAM_START + 0x4BB
	adds r5, r7, r1
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldr r0, _08035AAC @ =IWRAM_START + 0x4B4
	adds r4, r7, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _08035AB0 @ =gUnknown_080D7358
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #8
	ldr r0, [r6]
	cmp r0, r2
	ble _08035A7C
	str r2, [r6]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0xd7
	bl m4aSongNumStart
	mov r2, sb
	ldr r1, [r2]
	ldr r0, _08035AB4 @ =sub_8035AF0
	str r0, [r1, #8]
_08035A7C:
	ldr r0, _08035AB8 @ =IWRAM_START + 0x4AC
	adds r1, r7, r0
	ldr r0, [r6]
	ldr r2, _08035ABC @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _08035AC0
	movs r0, #0
	str r0, [r1]
	b _08035ACA
	.align 2, 0
_08035A94: .4byte gCurTask
_08035A98: .4byte IWRAM_START + 0x2CC
_08035A9C: .4byte IWRAM_START + 0x4B0
_08035AA0: .4byte gSineTable
_08035AA4: .4byte gUnknown_080D74E8
_08035AA8: .4byte IWRAM_START + 0x4BB
_08035AAC: .4byte IWRAM_START + 0x4B4
_08035AB0: .4byte gUnknown_080D7358
_08035AB4: .4byte sub_8035AF0
_08035AB8: .4byte IWRAM_START + 0x4AC
_08035ABC: .4byte 0xFFFF8800
_08035AC0:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _08035ACA
	str r2, [r1]
_08035ACA:
	ldr r1, _08035AE8 @ =gBgScrollRegs
	ldr r0, _08035AEC @ =0x000004AC
	add r0, r8
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	mov r0, r8
	bl sub_8035FCC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035AE8: .4byte gBgScrollRegs
_08035AEC: .4byte 0x000004AC

	thumb_func_start sub_8035AF0
sub_8035AF0: @ 0x08035AF0
	push {r4, lr}
	ldr r4, _08035B38 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, _08035B3C @ =IWRAM_START + 0x4BE
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	strb r0, [r1]
	cmp r0, #0x3c
	bls _08035B2C
	strh r3, [r2]
	strh r3, [r2, #4]
	movs r0, #1
	strh r0, [r2, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	strh r0, [r2, #8]
	strh r3, [r2, #0xa]
	ldr r1, [r4]
	ldr r0, _08035B40 @ =sub_8035E70
	str r0, [r1, #8]
_08035B2C:
	adds r0, r2, #0
	bl sub_8035FCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035B38: .4byte gCurTask
_08035B3C: .4byte IWRAM_START + 0x4BE
_08035B40: .4byte sub_8035E70

	thumb_func_start sub_8035B44
sub_8035B44: @ 0x08035B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r1, _08035BF4 @ =0x000004BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08035B9C
	ldr r7, _08035BF8 @ =gUnknown_080D74A8
	adds r0, r7, #2
	mov r8, r0
_08035B5E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xbc
	adds r5, r6, r0
	lsls r2, r4, #2
	adds r3, r2, r7
	ldr r1, _08035BFC @ =0x000004AC
	adds r0, r6, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	add r2, r8
	ldrh r0, [r2]
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08035BF4 @ =0x000004BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r4, r0
	blo _08035B5E
_08035B9C:
	ldr r0, _08035BF4 @ =0x000004BA
	adds r4, r6, r0
	ldrb r2, [r4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0xbc
	adds r5, r6, r0
	ldr r3, _08035BF8 @ =gUnknown_080D74A8
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r1, _08035BFC @ =0x000004AC
	adds r0, r6, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #0
	cmp r0, #0
	bne _08035BDA
	movs r4, #1
_08035BDA:
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r6, #0
	bl sub_8035C00
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035BF4: .4byte 0x000004BA
_08035BF8: .4byte gUnknown_080D74A8
_08035BFC: .4byte 0x000004AC

	thumb_func_start sub_8035C00
sub_8035C00: @ 0x08035C00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08035D68 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	mov r8, r1
	cmp r0, #1
	bgt _08035C1E
	movs r2, #0
	mov r8, r2
_08035C1E:
	adds r5, r6, #0
	adds r5, #0x8c
	movs r3, #0x96
	lsls r3, r3, #3
	adds r0, r6, r3
	ldr r2, _08035D6C @ =0x000004AC
	adds r1, r6, r2
	ldr r0, [r0]
	ldr r1, [r1]
	subs r0, r0, r1
	asrs r0, r0, #8
	adds r0, #5
	strh r0, [r5, #0x16]
	adds r3, #4
	adds r0, r6, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r0, #6
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08035D70 @ =0x000004BB
	adds r7, r6, r0
	ldrb r0, [r7]
	cmp r0, #0xd
	bhi _08035CAA
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r5, r6, r1
	ldr r4, _08035D74 @ =0x000002F6
	strh r4, [r5, #0xa]
	ldrb r0, [r7]
	lsrs r0, r0, #1
	movs r2, #0x97
	lsls r2, r2, #2
	adds r1, r6, r2
	strb r0, [r1]
	ldr r3, _08035D78 @ =0x0000025D
	adds r1, r6, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x9b
	lsls r0, r0, #2
	adds r5, r6, r0
	strh r4, [r5, #0xa]
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	movs r2, #0xa3
	lsls r2, r2, #2
	adds r1, r6, r2
	strb r0, [r1]
	ldr r3, _08035D7C @ =0x0000028D
	adds r1, r6, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08035CAA:
	movs r0, #0xa7
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r1, _08035D80 @ =gUnknown_080D7418
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0xaf
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r3, _08035D84 @ =0x000002BD
	adds r1, r6, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb3
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r2, _08035D88 @ =gUnknown_080D7398
	ldrb r0, [r7]
	mov r3, r8
	lsls r1, r3, #0x18
	asrs r1, r1, #0x14
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrb r0, [r7]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0xbb
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r3, _08035D8C @ =0x000002ED
	adds r1, r6, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r5, r6, r0
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08035D90 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08035DBE
	movs r4, #0
_08035D3C:
	ldr r0, _08035D68 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldr r0, _08035D94 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0xc
	adds r1, r1, r0
	ldrb r0, [r1]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08035D98
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #4
	movs r2, #0xd7
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r6, r0
	b _08035DA0
	.align 2, 0
_08035D68: .4byte gLoadedSaveGame
_08035D6C: .4byte 0x000004AC
_08035D70: .4byte 0x000004BB
_08035D74: .4byte 0x000002F6
_08035D78: .4byte 0x0000025D
_08035D7C: .4byte 0x0000028D
_08035D80: .4byte gUnknown_080D7418
_08035D84: .4byte 0x000002BD
_08035D88: .4byte gUnknown_080D7398
_08035D8C: .4byte 0x000002ED
_08035D90: .4byte gGameMode
_08035D94: .4byte gSelectedCharacter
_08035D98:
	movs r3, #0xcb
	lsls r3, r3, #2
	adds r5, r6, r3
	lsls r1, r4, #1
_08035DA0:
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r0, #0x24
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _08035D3C
_08035DBE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8035DC8
sub_8035DC8: @ 0x08035DC8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x90
	ldr r0, [r4]
	cmp r0, #0
	beq _08035DDE
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035DDE:
	movs r5, #0
	adds r7, r6, #0
	adds r7, #0xc0
_08035DE4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r7, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035DFA
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035DFA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08035DE4
	movs r0, #0x90
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E18
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E18:
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E2C
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E2C:
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E40
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E40:
	movs r0, #0xb4
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E54
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E54:
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E68
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E68:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8035E70
sub_8035E70: @ 0x08035E70
	push {r4, r5, lr}
	ldr r0, _08035EAC @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08035ED0
	adds r0, r4, #0
	bl sub_8035DC8
	ldr r2, _08035EB0 @ =gCurrentLevel
	ldr r1, _08035EB4 @ =gUnknown_080D7508
	ldr r3, _08035EB8 @ =IWRAM_START + 0x4BB
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	cmp r0, #0x1d
	beq _08035EBC
	bl sub_801A770
	b _08035EC0
	.align 2, 0
_08035EAC: .4byte gCurTask
_08035EB0: .4byte gCurrentLevel
_08035EB4: .4byte gUnknown_080D7508
_08035EB8: .4byte IWRAM_START + 0x4BB
_08035EBC:
	bl sub_8036C54
_08035EC0:
	ldr r0, _08035ECC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08035EE2
	.align 2, 0
_08035ECC: .4byte gCurTask
_08035ED0:
	ldr r1, _08035EE8 @ =gBgScrollRegs
	ldr r2, _08035EEC @ =IWRAM_START + 0x4AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
_08035EE2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035EE8: .4byte gBgScrollRegs
_08035EEC: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_8035EF0
sub_8035EF0: @ 0x08035EF0
	push {r4, r5, r6, lr}
	ldr r6, _08035F30 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08035F40
	adds r0, r4, #0
	bl sub_8035DC8
	ldr r2, _08035F34 @ =gCurrentLevel
	ldr r1, _08035F38 @ =gUnknown_080D7508
	ldr r3, _08035F3C @ =IWRAM_START + 0x4BB
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	bl sub_801A770
	ldr r0, [r6]
	bl TaskDestroy
	b _08035F52
	.align 2, 0
_08035F30: .4byte gCurTask
_08035F34: .4byte gCurrentLevel
_08035F38: .4byte gUnknown_080D7508
_08035F3C: .4byte IWRAM_START + 0x4BB
_08035F40:
	ldr r1, _08035F58 @ =gBgScrollRegs
	ldr r2, _08035F5C @ =IWRAM_START + 0x4AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
_08035F52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035F58: .4byte gBgScrollRegs
_08035F5C: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_8035F60
sub_8035F60: @ 0x08035F60
	push {r4, r5, r6, lr}
	ldr r6, _08035FA0 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08035FAC
	adds r0, r4, #0
	bl sub_8035DC8
	ldr r0, _08035FA4 @ =gSelectedCharacter
	ldrb r0, [r0]
	ldr r1, _08035FA8 @ =gLoadedSaveGame
	ldr r1, [r1]
	ldrb r2, [r1, #0x13]
	movs r1, #0x10
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl CreateCharacterSelectionScreen
	ldr r0, [r6]
	bl TaskDestroy
	b _08035FBE
	.align 2, 0
_08035FA0: .4byte gCurTask
_08035FA4: .4byte gSelectedCharacter
_08035FA8: .4byte gLoadedSaveGame
_08035FAC:
	ldr r1, _08035FC4 @ =gBgScrollRegs
	ldr r2, _08035FC8 @ =IWRAM_START + 0x4AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
_08035FBE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035FC4: .4byte gBgScrollRegs
_08035FC8: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_8035FCC
sub_8035FCC: @ 0x08035FCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _08036034 @ =0x000004BA
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r6, r0
	bhs _08036024
	ldr r7, _08036038 @ =gUnknown_080D74A8
	adds r0, r7, #2
	mov r8, r0
_08035FE6:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #4
	adds r4, #0xbc
	adds r4, r5, r4
	lsls r2, r6, #2
	adds r3, r2, r7
	ldr r1, _0803603C @ =0x000004AC
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	add r2, r8
	ldrh r0, [r2]
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08036034 @ =0x000004BA
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r6, r0
	blo _08035FE6
_08036024:
	adds r0, r5, #0
	bl sub_8035C00
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036034: .4byte 0x000004BA
_08036038: .4byte gUnknown_080D74A8
_0803603C: .4byte 0x000004AC

	thumb_func_start sub_8036040
sub_8036040: @ 0x08036040
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_8035DC8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036054
sub_8036054: @ 0x08036054
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _080360A8 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080360AC @ =sub_8036168
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _080360B0 @ =sub_8036638
	str r1, [sp]
	movs r1, #0x6c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r1, _080360B4 @ =IWRAM_START + 0x6A
	adds r0, r2, r1
	movs r1, #0
	strb r1, [r0]
	ldr r3, _080360B8 @ =IWRAM_START + 0x6B
	adds r0, r2, r3
	strb r1, [r0]
	cmp r4, #0
	bne _080360C0
	ldr r0, _080360BC @ =IWRAM_START + 0x68
	adds r1, r2, r0
	movs r0, #0x9b
	lsls r0, r0, #1
	b _080360C6
	.align 2, 0
_080360A8: .4byte gUnknown_03005424
_080360AC: .4byte sub_8036168
_080360B0: .4byte sub_8036638
_080360B4: .4byte IWRAM_START + 0x6A
_080360B8: .4byte IWRAM_START + 0x6B
_080360BC: .4byte IWRAM_START + 0x68
_080360C0:
	ldr r3, _0803615C @ =IWRAM_START + 0x68
	adds r1, r2, r3
	movs r0, #0xb4
_080360C6:
	strh r0, [r1]
	adds r4, r7, #0
	adds r4, #0x30
	movs r0, #4
	bl VramMalloc
	str r0, [r4, #4]
	movs r6, #0
	movs r5, #0
	ldr r0, _08036160 @ =0x00000469
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x50
	strb r6, [r0]
	adds r1, r7, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #1
	strh r0, [r4, #0x1a]
	strh r5, [r4, #8]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x1c]
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0x10
	mov sb, r1
	mov r3, sb
	strb r3, [r0]
	adds r0, #3
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r4, #0x28]
	str r5, [r4, #0x10]
	movs r0, #0xe
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08036164 @ =0x00000212
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r6, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	mov r1, sb
	strb r1, [r0]
	adds r0, #3
	strb r6, [r0]
	mov r3, r8
	str r3, [r7, #0x28]
	movs r0, #0x90
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803615C: .4byte IWRAM_START + 0x68
_08036160: .4byte 0x00000469
_08036164: .4byte 0x00000212

	thumb_func_start sub_8036168
sub_8036168: @ 0x08036168
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080361B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080361B8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0803619E
	ldr r0, _080361BC @ =IWRAM_START + 0x68
	adds r2, r1, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0xb4
	ble _0803619E
	ldr r0, _080361C0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0803619E
	movs r0, #0xb4
	strh r0, [r2]
_0803619E:
	adds r0, r6, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0xb4
	bne _080361C4
	movs r0, #0xd0
	bl m4aSongNumStart
	b _080361DA
	.align 2, 0
_080361B4: .4byte gCurTask
_080361B8: .4byte gGameMode
_080361BC: .4byte IWRAM_START + 0x68
_080361C0: .4byte gPressedKeys
_080361C4:
	cmp r1, #0x78
	bne _080361D0
	movs r0, #0xd1
	bl m4aSongNumStart
	b _080361DA
_080361D0:
	cmp r1, #0x3c
	bne _080361DA
	movs r0, #0xd2
	bl m4aSongNumStart
_080361DA:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08036268
	ldr r3, _0803621C @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	ldr r1, _08036220 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	ldr r2, _08036224 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08036228 @ =0x0000FFFE
	ands r0, r1
	ldr r1, _0803622C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036230
	movs r0, #0x90
	lsls r0, r0, #4
	b _08036234
	.align 2, 0
_0803621C: .4byte gUnknown_030059E0
_08036220: .4byte 0xFFDFFFFF
_08036224: .4byte gUnknown_03005424
_08036228: .4byte 0x0000FFFE
_0803622C: .4byte 0x0000FEFF
_08036230:
	movs r0, #0x80
	lsls r0, r0, #3
_08036234:
	strh r0, [r3, #0x14]
	bl sub_8018818
	bl sub_8036400
	ldr r1, _0803625C @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	str r0, [r6, #0x60]
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [r6, #0x64]
	movs r0, #0xd3
	bl m4aSongNumStart
	ldr r0, _08036260 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08036264 @ =sub_8036398
	str r0, [r1, #8]
	b _080362A0
	.align 2, 0
_0803625C: .4byte gUnknown_030059E0
_08036260: .4byte gCurTask
_08036264: .4byte sub_8036398
_08036268:
	cmp r0, #4
	bgt _0803628C
	ldr r0, _08036288 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080362A0
	adds r0, r6, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080362A0
	adds r1, r6, #0
	adds r1, #0x6a
	b _0803629C
	.align 2, 0
_08036288: .4byte gPressedKeys
_0803628C:
	ldr r0, _08036364 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080362A0
	adds r1, r6, #0
	adds r1, #0x6b
_0803629C:
	movs r0, #1
	strb r0, [r1]
_080362A0:
	ldr r5, _08036368 @ =gUnknown_030059E0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r7, _0803636C @ =gUnknown_03005960
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb3
	bgt _0803630E
	adds r4, r6, #0
	adds r4, #0x30
	movs r1, #0x3c
	bl Div
	movs r1, #2
	subs r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x50
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	adds r0, #0x18
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	subs r0, #0x18
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803630E:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #0x46
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _0803638C
	ldr r3, _08036370 @ =gUnknown_080D7518
	ldr r2, _08036374 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #6]
	adds r1, r5, #0
	adds r1, #0x6a
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08036378 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08036380
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, _0803637C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #0x31
	strb r0, [r1]
	b _0803638C
	.align 2, 0
_08036364: .4byte gPressedKeys
_08036368: .4byte gUnknown_030059E0
_0803636C: .4byte gUnknown_03005960
_08036370: .4byte gUnknown_080D7518
_08036374: .4byte gSelectedCharacter
_08036378: .4byte gGameMode
_0803637C: .4byte 0x04000128
_08036380:
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x31
	movs r1, #0
	strb r1, [r0]
_0803638C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036398
sub_8036398: @ 0x08036398
	push {r4, r5, r6, lr}
	ldr r4, _080363E4 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r6, r5, #0
	ldr r0, [r5, #0x60]
	ldr r3, _080363E8 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r2, [r5, #0x64]
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r5, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080363DA
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080363DA
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080363EC
_080363DA:
	ldr r0, [r4]
	bl TaskDestroy
	b _080363F8
	.align 2, 0
_080363E4: .4byte gCurTask
_080363E8: .4byte gUnknown_03005960
_080363EC:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080363F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036400
sub_8036400: @ 0x08036400
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080364EC @ =sub_8036524
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _080364F0 @ =sub_8036654
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, _080364F4 @ =IWRAM_START + 0x78
	adds r1, r5, r0
	movs r0, #0
	mov r8, r0
	movs r0, #0x3c
	strh r0, [r1]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _080364F8 @ =0x0000046A
	strh r1, [r4, #0xa]
	ldr r1, _080364FC @ =IWRAM_START + 0x20
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08036500 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r1, _08036504 @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08036508 @ =IWRAM_START + 0x25
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	movs r7, #1
	rsbs r7, r7, #0
	str r7, [r4, #0x28]
	ldr r6, _0803650C @ =gUnknown_030054B8
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	movs r1, #0x60
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, _08036510 @ =IWRAM_START + 0x3C
	adds r4, r5, r0
	movs r0, #0x40
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _080364F8 @ =0x0000046A
	strh r1, [r4, #0xa]
	ldr r0, _08036514 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08036518 @ =IWRAM_START + 0x5D
	adds r1, r5, r0
	adds r0, r7, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r1, _0803651C @ =IWRAM_START + 0x5E
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	ldr r0, _08036520 @ =IWRAM_START + 0x61
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	str r7, [r4, #0x28]
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	mov r1, sl
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080364EC: .4byte sub_8036524
_080364F0: .4byte sub_8036654
_080364F4: .4byte IWRAM_START + 0x78
_080364F8: .4byte 0x0000046A
_080364FC: .4byte IWRAM_START + 0x20
_08036500: .4byte IWRAM_START + 0x21
_08036504: .4byte IWRAM_START + 0x22
_08036508: .4byte IWRAM_START + 0x25
_0803650C: .4byte gUnknown_030054B8
_08036510: .4byte IWRAM_START + 0x3C
_08036514: .4byte IWRAM_START + 0x5C
_08036518: .4byte IWRAM_START + 0x5D
_0803651C: .4byte IWRAM_START + 0x5E
_08036520: .4byte IWRAM_START + 0x61

	thumb_func_start sub_8036524
sub_8036524: @ 0x08036524
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803654C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0x78
	adds r3, r1, r0
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08036550
	adds r0, r2, #0
	bl TaskDestroy
	b _08036630
	.align 2, 0
_0803654C: .4byte gCurTask
_08036550:
	adds r6, r7, #0
	ldr r2, _08036594 @ =IWRAM_START + 0x30
	adds r5, r1, r2
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x28
	strh r0, [r6, #0x18]
	ldr r2, _08036598 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #0x10]
	movs r0, #0
	strh r0, [r5]
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0xf
	bgt _0803659C
	lsls r0, r1, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r3]
	adds r0, #1
	lsls r0, r0, #4
	b _080365A2
	.align 2, 0
_08036594: .4byte IWRAM_START + 0x30
_08036598: .4byte gUnknown_030054B8
_0803659C:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
_080365A2:
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x16]
	movs r4, #0
	strh r0, [r5, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	adds r6, #0x3c
	adds r5, r7, #0
	adds r5, #0x6c
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x28
	strh r0, [r6, #0x18]
	ldr r2, _08036608 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #0x10]
	strh r4, [r5]
	adds r2, r7, #0
	adds r2, #0x78
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xf
	bgt _0803660C
	lsls r0, r1, #4
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r2]
	adds r0, #1
	lsls r0, r0, #4
	b _08036612
	.align 2, 0
_08036608: .4byte gUnknown_030054B8
_0803660C:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
_08036612:
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r5, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_08036630:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036638
sub_8036638: @ 0x08036638
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8036654
sub_8036654: @ 0x08036654
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #4]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
