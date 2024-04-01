.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

	.global gUnknown_080D7BB0
gUnknown_080D7BB0:
    .incbin "baserom.gba", 0x000D7BB0, 0x18

    .global gUnknown_080D7BC8
gUnknown_080D7BC8:
    .incbin "baserom.gba", 0x000D7BC8, 0x10

    .global sOamOrderIds
sOamOrderIds: @ 0x080D7BD8
    .byte 21, 25, 24, 0

    .global gUnknown_080D7BDC
gUnknown_080D7BDC:
    .2byte 0x1600, 0x0D00, 0xF000

    .global sTotemDiscYs
sTotemDiscYs:
    .2byte 0xE000, 0xD000, 0xC000
    
    .global gUnknown_080D7BE8
gUnknown_080D7BE8:
    .incbin "baserom.gba", 0x000D7BE8, 0x290

    .global gUnknown_080D7E78
gUnknown_080D7E78:
    .incbin "baserom.gba", 0x000D7E78, 0x5C

    .global gUnknown_080D7ED4
gUnknown_080D7ED4:
    .incbin "baserom.gba", 0x000D7ED4, 0x3C

    .global gUnknown_080D7F10
gUnknown_080D7F10:
    .byte 14, 14, 8, 0

    .global gUnknown_080D7F14
gUnknown_080D7F14:
    .incbin "graphics/boss_3_a.gbapal"

    .global gUnknown_080D7F34
gUnknown_080D7F34:
    .incbin "graphics/boss_3_b.gbapal"

.text
.syntax unified
.arm

.if 0
	thumb_func_start sub_8040D74
sub_8040D74: @ 0x08040D74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r7, r4, r0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040E62
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	beq _08040E48
	subs r0, r1, #1
	mov r1, r8
	strb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08040DAE
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08040DB4
_08040DAE:
	movs r0, #0xeb
	bl m4aSongNumStart
_08040DB4:
	adds r0, r4, #0
	adds r0, #0x35
	movs r1, #0x1e
	strb r1, [r0]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08040E34
	ldr r0, _08040E1C @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08040E20 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040E24 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040E40
	ldr r0, _08040E28 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040E40
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040E2C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040E12
	movs r0, #0xff
_08040E12:
	strb r0, [r1]
	ldr r1, _08040E30 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _08040E40
	.align 2, 0
_08040E1C: .4byte 0x00000275
_08040E20: .4byte gLevelScore
_08040E24: .4byte 0x0000C350
_08040E28: .4byte gGameMode
_08040E2C: .4byte gNumLives
_08040E30: .4byte gUnknown_030054A8
_08040E34:
	ldr r0, _08040E6C @ =0x00000275
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_08040E40:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08040E48:
	ldr r0, _08040E70 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08040E62
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #4
	bne _08040E62
	ldr r1, _08040E74 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08040E62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040E6C: .4byte 0x00000275
_08040E70: .4byte gCurrentLevel
_08040E74: .4byte gUnknown_030054A8
.endif

	thumb_func_start sub_8040E78
sub_8040E78: @ 0x08040E78
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r4, r3, r0
	adds r2, r3, #0
	adds r2, #0x35
	ldrb r0, [r2]
	cmp r0, #0
	beq _08040ED8
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F06
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040EBC
	ldr r0, _08040EB8 @ =0x00000275
	strh r0, [r4, #0xa]
	movs r2, #0xb2
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _08040EC8
	.align 2, 0
_08040EB8: .4byte 0x00000275
_08040EBC:
	movs r0, #0
	ldr r1, _08040ED4 @ =0x00000275
	strh r1, [r4, #0xa]
	movs r2, #0xb2
	lsls r2, r2, #2
	adds r1, r3, r2
_08040EC8:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	b _08040F04
	.align 2, 0
_08040ED4: .4byte 0x00000275
_08040ED8:
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040F06
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040F06
	movs r1, #0
	ldr r0, _08040F0C @ =0x00000275
	strh r0, [r4, #0xa]
	movs r4, #0xb2
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _08040F10 @ =0x000002C9
	adds r1, r3, r0
	ldrb r0, [r1]
	orrs r0, r2
_08040F04:
	strb r0, [r1]
_08040F06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040F0C: .4byte 0x00000275
_08040F10: .4byte 0x000002C9

	thumb_func_start sub_8040F14
sub_8040F14: @ 0x08040F14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040F70
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x36
	ldr r0, _08040F60 @ =gFlags
	mov r8, r0
	ldr r1, _08040F64 @ =gObjPalette
	mov ip, r1
	ldr r7, _08040F68 @ =gUnknown_080D7F14
	ldr r6, _08040F6C @ =gStageTime
	movs r5, #2
_08040F38:
	adds r2, r3, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r3, #1
	ldr r0, [r6]
	ands r0, r5
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040F38
	b _08040F98
	.align 2, 0
_08040F60: .4byte gFlags
_08040F64: .4byte gObjPalette
_08040F68: .4byte gUnknown_080D7F14
_08040F6C: .4byte gStageTime
_08040F70:
	movs r3, #0
	adds r4, r1, #0
	adds r4, #0x36
	ldr r0, _08040FD4 @ =gFlags
	mov r8, r0
	ldr r5, _08040FD8 @ =gObjPalette
	ldr r2, _08040FDC @ =gUnknown_080D7F34
_08040F7E:
	adds r1, r3, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040F7E
_08040F98:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08040FE8
	subs r0, #1
	strb r0, [r4]
	movs r3, #0
	ldr r7, _08040FD8 @ =gObjPalette
	ldr r6, _08040FE0 @ =gUnknown_080D7F14
	ldr r5, _08040FE4 @ =gStageTime
	movs r4, #2
_08040FAC:
	adds r2, r3, #0
	adds r2, #0xb0
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r1, r3, #1
	ldr r0, [r5]
	ands r0, r4
	lsrs r0, r0, #1
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040FAC
	b _08041008
	.align 2, 0
_08040FD4: .4byte gFlags
_08040FD8: .4byte gObjPalette
_08040FDC: .4byte gUnknown_080D7F34
_08040FE0: .4byte gUnknown_080D7F14
_08040FE4: .4byte gStageTime
_08040FE8:
	movs r3, #0
	ldr r4, _08041020 @ =gObjPalette
	ldr r2, _08041024 @ =gUnknown_080D7F34
_08040FEE:
	adds r1, r3, #0
	adds r1, #0xb0
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08040FEE
_08041008:
	mov r1, r8
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041020: .4byte gObjPalette
_08041024: .4byte gUnknown_080D7F34

	thumb_func_start TaskDestructor_EggTotemMain
TaskDestructor_EggTotemMain: @ 0x08041028
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _080410D4 @ =IWRAM_START + 0xC4
	adds r0, r4, r1
	ldr r0, [r0]
	bl VramFree
	movs r5, #0
	ldr r0, _080410D8 @ =IWRAM_START + 0xFC
	adds r4, r4, r0
_08041042:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041042
	movs r5, #0
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r4, r6, r1
_08041062:
	lsls r0, r5, #6
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08041062
	movs r1, #0x93
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0x9f
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe6
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xab
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc3
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080410B6
	bl VramFree
_080410B6:
	movs r1, #0xb7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080410C6
	bl VramFree
_080410C6:
	ldr r1, _080410DC @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410D4: .4byte IWRAM_START + 0xC4
_080410D8: .4byte IWRAM_START + 0xFC
_080410DC: .4byte gActiveBossTask

	thumb_func_start Task_EggTotemMain
Task_EggTotemMain: @ 0x080410E0
	push {r4, r5, r6, lr}
	ldr r6, _0804112C @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0xf4
	lsls r1, r1, #2
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r4, #0
	bl sub_803FB88
	adds r0, r4, #0
	bl sub_8041264
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F698
	ldr r0, _08041130 @ =IWRAM_START + 0xB4
	adds r5, r5, r0
	ldr r0, [r5]
	subs r0, #1
	str r0, [r5]
	cmp r0, #0
	bne _08041124
	ldr r1, [r6]
	ldr r0, _08041134 @ =Task_803F3E8
	str r0, [r1, #8]
_08041124:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804112C: .4byte gCurTask
_08041130: .4byte IWRAM_START + 0xB4
_08041134: .4byte Task_803F3E8

	thumb_func_start Task_8041138
Task_8041138: @ 0x08041138
	push {r4, r5, lr}
	ldr r0, _080411AC @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r0, _080411B0 @ =gStageTime
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0804115A
	movs r0, #0x90
	bl m4aSongNumStart
_0804115A:
	ldr r1, _080411B4 @ =IWRAM_START + 0x2DC
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08041184
	ldr r2, _080411B8 @ =IWRAM_START + 0xB8
	adds r0, r4, r2
	ldr r1, [r0]
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r1, r3
	str r1, [r0]
	ldr r0, _080411BC @ =IWRAM_START + 0xBC
	adds r2, r4, r0
	ldr r1, [r2]
	ldr r0, _080411C0 @ =0xFFFFD000
	cmp r1, r0
	ble _08041184
	ldr r3, _080411C4 @ =0xFFFFFD00
	adds r0, r1, r3
	str r0, [r2]
_08041184:
	adds r0, r5, #0
	bl sub_803FC14
	adds r0, r5, #0
	bl sub_8040E78
	adds r0, r5, #0
	bl sub_803F878
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080411A4
	ldr r0, _080411AC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080411C8 @ =Task_80411CC
	str r0, [r1, #8]
_080411A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080411AC: .4byte gCurTask
_080411B0: .4byte gStageTime
_080411B4: .4byte IWRAM_START + 0x2DC
_080411B8: .4byte IWRAM_START + 0xB8
_080411BC: .4byte IWRAM_START + 0xBC
_080411C0: .4byte 0xFFFFD000
_080411C4: .4byte 0xFFFFFD00
_080411C8: .4byte Task_80411CC

	thumb_func_start Task_80411CC
Task_80411CC: @ 0x080411CC
	push {r4, r5, r6, lr}
	ldr r6, _08041228 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0804122C @ =gStageTime
	ldr r0, [r0]
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _080411EE
	movs r0, #0x90
	bl m4aSongNumStart
_080411EE:
	adds r0, r4, #0
	bl sub_803FF44
	adds r0, r4, #0
	bl sub_8040E78
	adds r0, r4, #0
	bl sub_803F878
	ldr r1, _08041230 @ =IWRAM_START + 0xD6
	adds r0, r5, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xc8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08041220
	adds r0, #0xa0
	movs r1, #0x96
	movs r2, #2
	bl sub_802EF68
	ldr r1, [r6]
	ldr r0, _08041234 @ =sub_8041238
	str r0, [r1, #8]
_08041220:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041228: .4byte gCurTask
_0804122C: .4byte gStageTime
_08041230: .4byte IWRAM_START + 0xD6
_08041234: .4byte sub_8041238

	thumb_func_start sub_8041238
sub_8041238: @ 0x08041238
	push {lr}
	ldr r0, _08041248 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08041248: .4byte gCurTask

	thumb_func_start sub_804124C
sub_804124C: @ 0x0804124C
	movs r1, #8
	ldrsh r2, [r0, r1]
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	ldr r1, [r0, #4]
	adds r1, r1, r2
	str r1, [r0, #4]
	bx lr
	.align 2, 0

	thumb_func_start sub_8041264
sub_8041264: @ 0x08041264
	push {r4, r5, lr}
	mov ip, r0
	movs r4, #0
	ldr r5, _080412B0 @ =sTotemDiscYs
_0804126C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r3, r0, #2
	mov r1, ip
	adds r0, r1, r3
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804129E
	mov r0, ip
	adds r0, #0x3c
	adds r0, r0, r3
	ldr r1, [r1]
	str r1, [r0]
	mov r2, ip
	adds r2, #0x40
	adds r2, r2, r3
	lsls r0, r4, #1
	adds r0, r0, r5
	movs r3, #0
	ldrsh r1, [r0, r3]
	mov r3, ip
	ldr r0, [r3, #4]
	adds r0, r0, r1
	str r0, [r2]
_0804129E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0804126C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080412B0: .4byte sTotemDiscYs

	thumb_func_start sub_80412B4
sub_80412B4: @ 0x080412B4
	push {lr}
	adds r2, r0, #0
	movs r0, #0xaa
	lsls r0, r0, #2
	adds r3, r2, r0
	adds r0, r2, #0
	adds r0, #0x34
	movs r1, #0x1e
	strb r1, [r0]
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080412E2
	ldr r0, _080412E8 @ =0x00000275
	strh r0, [r3, #0xa]
	adds r0, #0x53
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080412EC @ =0x000002C9
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_080412E2:
	pop {r0}
	bx r0
	.align 2, 0
_080412E8: .4byte 0x00000275
_080412EC: .4byte 0x000002C9

	thumb_func_start CreateEggTotemBullet
CreateEggTotemBullet: @ 0x080412F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r6, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	mov sb, r3
	mov r0, sb
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r0, _080413FC @ =Task_EggTotemBullet
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r7, #0
	str r7, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r1, _08041400 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	subs r0, r6, r0
	str r0, [r4]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, r8
	subs r0, r1, r0
	str r0, [r4, #4]
	ldr r1, _08041404 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	mov r2, r8
	asrs r2, r2, #8
	mov r8, r2
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r1, #8]
	asrs r1, r1, #8
	asrs r6, r6, #8
	str r6, [sp, #4]
	subs r1, r1, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08041408 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r0, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r6, #0
	ldrsh r1, [r1, r6]
	mov r3, sb
	muls r3, r1, r3
	adds r1, r3, #0
	asrs r1, r1, #0xe
	movs r3, #0
	movs r6, #0xa0
	lsls r6, r6, #3
	adds r1, r1, r6
	strh r1, [r4, #8]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0xa]
	mov r6, sl
	str r6, [r4, #0xc]
	ldr r0, _0804140C @ =IWRAM_START + 0x10
	adds r1, r5, r0
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r1, #0x16]
	mov r6, r8
	strh r6, [r1, #0x18]
	movs r0, #0xe6
	lsls r0, r0, #2
	add sl, r0
	mov r2, sl
	ldr r0, [r2]
	str r0, [r1, #4]
	ldr r0, _08041410 @ =0x00000292
	strh r0, [r1, #0xa]
	ldr r6, _08041414 @ =IWRAM_START + 0x30
	adds r0, r5, r6
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r7, [r1, #8]
	strh r7, [r1, #0x14]
	strh r7, [r1, #0x1c]
	ldr r0, _08041418 @ =IWRAM_START + 0x31
	adds r2, r5, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r6, #2
	adds r2, r5, r6
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0804141C @ =IWRAM_START + 0x35
	adds r5, r5, r0
	strb r3, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080413FC: .4byte Task_EggTotemBullet
_08041400: .4byte gCamera
_08041404: .4byte gPlayer
_08041408: .4byte gSineTable
_0804140C: .4byte IWRAM_START + 0x10
_08041410: .4byte 0x00000292
_08041414: .4byte IWRAM_START + 0x30
_08041418: .4byte IWRAM_START + 0x31
_0804141C: .4byte IWRAM_START + 0x35

	thumb_func_start Task_EggTotemBullet
Task_EggTotemBullet: @ 0x08041420
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _08041458 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x10
	adds r6, r1, r0
	ldr r2, _0804145C @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov ip, r2
	cmp r1, #0
	beq _08041464
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r0, [r4]
	adds r0, r0, r1
	ldr r7, _08041460 @ =0xFFFFFB00
	adds r0, r0, r7
	str r0, [r4]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	b _08041480
	.align 2, 0
_08041458: .4byte gCurTask
_0804145C: .4byte gPlayer
_08041460: .4byte 0xFFFFFB00
_08041464:
	movs r5, #8
	ldrsh r1, [r4, r5]
	ldr r2, _080414E8 @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r7, #0xa
	ldrsh r1, [r4, r7]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
_08041480:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	asrs r1, r1, #8
	strh r1, [r6, #0x18]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0x20
	rsbs r5, r5, #0
	cmp r2, r5
	bge _080414A6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	blt _080414E0
_080414A6:
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r2, r0
	ble _080414B6
	movs r7, #8
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414B6:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, r5
	bge _080414C6
	movs r5, #0xa
	ldrsh r0, [r4, r5]
	cmp r0, #0
	blt _080414E0
_080414C6:
	cmp r1, #0xc0
	ble _080414D2
	movs r7, #0xa
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bgt _080414E0
_080414D2:
	ldr r0, _080414EC @ =0xFFFFFE00
	cmp r2, r0
	blt _080414E0
	movs r0, #0xbc
	lsls r0, r0, #2
	cmp r2, r0
	ble _080414F0
_080414E0:
	ldr r0, [r3]
	bl TaskDestroy
	b _08041558
	.align 2, 0
_080414E8: .4byte gCamera
_080414EC: .4byte 0xFFFFFE00
_080414F0:
	ldr r0, [r4, #0xc]
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804154C
	ldr r1, [r4]
	asrs r1, r1, #8
	ldr r3, _08041560 @ =gCamera
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r0, [r3, #4]
	adds r2, r2, r0
	mov r0, ip
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r5, r0, #0
	cmp r5, #1
	bne _0804154C
	ldr r3, [r4, #0xc]
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804154C
	movs r1, #0xaa
	lsls r1, r1, #2
	adds r2, r3, r1
	adds r1, r3, #0
	adds r1, #0x34
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08041564 @ =0x00000275
	strh r0, [r2, #0xa]
	movs r7, #0xb2
	lsls r7, r7, #2
	adds r0, r3, r7
	strb r5, [r0]
	ldr r0, _08041568 @ =0x000002C9
	adds r1, r3, r0
	movs r0, #0xff
	strb r0, [r1]
_0804154C:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_08041558:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041560: .4byte gCamera
_08041564: .4byte 0x00000275
_08041568: .4byte 0x000002C9
