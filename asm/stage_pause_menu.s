.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_800AB08
sub_800AB08: @ 0x0800AB08
	push {r4, r5, r6, r7, lr}
	ldr r0, _0800AB3C @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _0800AB40 @ =gReleasedKeys
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800AB4C
	ldr r0, _0800AB44 @ =IWRAM_START + 0x63
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800AB4C
	movs r0, #1
	strb r0, [r2]
	ldr r6, _0800AB48 @ =IWRAM_START + 0x62
	adds r5, r3, r6
	b _0800AC7C
	.align 2, 0
_0800AB3C: .4byte gCurTask
_0800AB40: .4byte gReleasedKeys
_0800AB44: .4byte IWRAM_START + 0x63
_0800AB48: .4byte IWRAM_START + 0x62
_0800AB4C:
	ldr r0, _0800ABA0 @ =gPressedKeys
	ldrh r6, [r0]
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	bne _0800AB84
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r3, [r0]
	adds r5, r0, #0
	cmp r3, #0
	bne _0800AB70
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800AB84
_0800AB70:
	ldr r0, _0800ABA4 @ =gGameMode
	ldrb r7, [r0]
	cmp r7, #0
	beq _0800AC18
	movs r0, #2
	ands r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0800ABB8
_0800AB84:
	ldr r2, _0800ABA8 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800ABAC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800ABB0 @ =gMPlayTable
	ldr r0, [r0]
	bl m4aMPlayContinue
	ldr r0, _0800ABB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800AD8A
	.align 2, 0
_0800ABA0: .4byte gPressedKeys
_0800ABA4: .4byte gGameMode
_0800ABA8: .4byte gFlags
_0800ABAC: .4byte 0xFFFFFBFF
_0800ABB0: .4byte gMPlayTable
_0800ABB4: .4byte gCurTask
_0800ABB8:
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AC7C
	ldr r2, _0800ABF8 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800ABFC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0800AC00 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800AC04 @ =gUnknown_03002AE4
	ldr r0, _0800AC08 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0800AC0C @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _0800AC10 @ =gVramGraphicsCopyCursor
	ldr r0, _0800AC14 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTimeAttackLobbyScreen
	b _0800AD8A
	.align 2, 0
_0800ABF8: .4byte gFlags
_0800ABFC: .4byte 0xFFFFFBFF
_0800AC00: .4byte 0x0000FFFF
_0800AC04: .4byte gUnknown_03002AE4
_0800AC08: .4byte gUnknown_0300287C
_0800AC0C: .4byte gUnknown_03005390
_0800AC10: .4byte gVramGraphicsCopyCursor
_0800AC14: .4byte gVramGraphicsCopyQueueIndex
_0800AC18:
	cmp r3, #0
	beq _0800AC7C
	mov r6, ip
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AC7C
	ldr r2, _0800AC5C @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800AC60 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0800AC64 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0800AC68 @ =gUnknown_03002AE4
	ldr r0, _0800AC6C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0800AC70 @ =gUnknown_03005390
	strb r7, [r0]
	ldr r1, _0800AC74 @ =gVramGraphicsCopyCursor
	ldr r0, _0800AC78 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateTitleScreenAndSkipIntro
	b _0800AD8A
	.align 2, 0
_0800AC5C: .4byte gFlags
_0800AC60: .4byte 0xFFFFFBFF
_0800AC64: .4byte 0x0000FFFF
_0800AC68: .4byte gUnknown_03002AE4
_0800AC6C: .4byte gUnknown_0300287C
_0800AC70: .4byte gUnknown_03005390
_0800AC74: .4byte gVramGraphicsCopyCursor
_0800AC78: .4byte gVramGraphicsCopyQueueIndex
_0800AC7C:
	ldr r0, _0800ACB0 @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0800AC92
	ldr r0, [r4, #0x40]
	ldr r1, _0800ACB4 @ =0xFFFFFE7F
	ands r0, r1
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x10]
	ands r0, r1
	str r0, [r4, #0x10]
_0800AC92:
	ldr r2, _0800ACB8 @ =gRepeatedKeys
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800ACBC
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800ACBC
	movs r0, #0
	strb r0, [r5]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0800ACD6
	.align 2, 0
_0800ACB0: .4byte gBldRegs
_0800ACB4: .4byte 0xFFFFFE7F
_0800ACB8: .4byte gRepeatedKeys
_0800ACBC:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800ACD6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800ACDC
	movs r0, #1
	strb r0, [r5]
	movs r0, #0x6c
	bl m4aSongNumStart
_0800ACD6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800AD38
_0800ACDC:
	ldr r2, _0800AD1C @ =0x040000D4
	adds r6, r4, #0
	adds r6, #0x6a
	str r6, [r2]
	ldr r0, _0800AD20 @ =0x050003F2
	str r0, [r2, #4]
	ldr r3, _0800AD24 @ =0x80000003
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	adds r5, r4, #0
	adds r5, #0x64
	str r5, [r2]
	ldr r0, _0800AD28 @ =0x050003F8
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800AD2C @ =gUnknown_03005660
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800AD7C
	ldr r0, [r1, #0x10]
	ldrh r1, [r0, #6]
	str r6, [r2]
	ldr r6, _0800AD30 @ =IWRAM_START + 0x1F2
	adds r0, r1, r6
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	str r5, [r2]
	ldr r0, _0800AD34 @ =IWRAM_START + 0x1F8
	b _0800AD74
	.align 2, 0
_0800AD1C: .4byte 0x040000D4
_0800AD20: .4byte 0x050003F2
_0800AD24: .4byte 0x80000003
_0800AD28: .4byte 0x050003F8
_0800AD2C: .4byte gUnknown_03005660
_0800AD30: .4byte IWRAM_START + 0x1F2
_0800AD34: .4byte IWRAM_START + 0x1F8
_0800AD38:
	ldr r2, _0800AD90 @ =0x040000D4
	adds r6, r4, #0
	adds r6, #0x6a
	str r6, [r2]
	ldr r0, _0800AD94 @ =0x050003F8
	str r0, [r2, #4]
	ldr r3, _0800AD98 @ =0x80000003
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	adds r5, r4, #0
	adds r5, #0x64
	str r5, [r2]
	ldr r0, _0800AD9C @ =0x050003F2
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800ADA0 @ =gUnknown_03005660
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800AD7C
	ldr r0, [r1, #0x10]
	ldrh r1, [r0, #6]
	str r6, [r2]
	ldr r6, _0800ADA4 @ =IWRAM_START + 0x1F8
	adds r0, r1, r6
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	str r5, [r2]
	ldr r0, _0800ADA8 @ =IWRAM_START + 0x1F2
_0800AD74:
	adds r1, r1, r0
	str r1, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
_0800AD7C:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_80051E8
_0800AD8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AD90: .4byte 0x040000D4
_0800AD94: .4byte 0x050003F8
_0800AD98: .4byte 0x80000003
_0800AD9C: .4byte 0x050003F2
_0800ADA0: .4byte gUnknown_03005660
_0800ADA4: .4byte IWRAM_START + 0x1F8
_0800ADA8: .4byte IWRAM_START + 0x1F2

	thumb_func_start Task_PauseMenu
Task_PauseMenu: @ 0x0800ADAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800AE24 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r4, #0
	ldr r0, _0800AE28 @ =gSongTable + (142 * 8) + 4
	ldrh r6, [r0]
	movs r5, #0
	ldr r7, _0800AE2C @ =gMPlayTable
_0800ADCA:
	cmp r4, r6
	beq _0800ADD6
	adds r0, r5, r7
	ldr r0, [r0]
	bl MPlayStop
_0800ADD6:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	bls _0800ADCA
	movs r0, #0x8e
	bl m4aSongNumStart
	ldr r2, _0800AE30 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2]
	ldr r0, _0800AE34 @ =0x040000D4
	ldr r2, _0800AE38 @ =gObjPalette + 0x1F2
	str r2, [r0]
	mov r1, r8
	adds r1, #0x64
	str r1, [r0, #4]
	ldr r3, _0800AE3C @ =0x80000003
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	adds r2, #6
	str r2, [r0]
	mov r1, r8
	adds r1, #0x6a
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0800AE24 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800AE40 @ =sub_800AB08
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AE24: .4byte gCurTask
_0800AE28: .4byte gSongTable + (142 * 8) + 4
_0800AE2C: .4byte gMPlayTable
_0800AE30: .4byte gFlags
_0800AE34: .4byte 0x040000D4
_0800AE38: .4byte gObjPalette + 0x1F2
_0800AE3C: .4byte 0x80000003
_0800AE40: .4byte sub_800AB08

	thumb_func_start TaskDestructor_PauseMenu
TaskDestructor_PauseMenu: @ 0x0800AE44
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800AE58
sub_800AE58: @ 0x0800AE58
	ldr r1, _0800AE80 @ =0x040000D4
	ldr r0, _0800AE84 @ =gUnknown_086EA408
	str r0, [r1]
	ldr r0, _0800AE88 @ =0x06017EC0
	str r0, [r1, #4]
	ldr r0, _0800AE8C @ =0x800000A0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800AE90 @ =gObjPalette
	ldr r0, _0800AE94 @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _0800AE98 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0800AE9C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0800AE80: .4byte 0x040000D4
_0800AE84: .4byte (Tileset_Stage_LeafForest_Act1+(32 * TILE_SIZE_4BPP))
_0800AE88: .4byte 0x06017EC0
_0800AE8C: .4byte 0x800000A0
_0800AE90: .4byte gObjPalette
_0800AE94: .4byte 0x00007FFF
_0800AE98: .4byte gFlags
_0800AE9C: .4byte 0xFFFFFBFF
