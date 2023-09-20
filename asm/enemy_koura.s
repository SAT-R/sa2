.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata
    .global gUnknown_080D8F38
gUnknown_080D8F38:
    .2byte 0x1EC, 1     @ SA2_ANIM_KOURA, Variant 1
    .2byte 0x1EC, 2     @ SA2_ANIM_KOURA, Variant 2
    .2byte 0x1EC, 3     @ SA2_ANIM_KOURA, Variant 3
    .2byte 0x1EC, 4     @ SA2_ANIM_KOURA, Variant 4
    .2byte 0x1EC, 5     @ SA2_ANIM_KOURA, Variant 5
    .2byte 0x1EC, 6     @ SA2_ANIM_KOURA, Variant 6

.text
.syntax unified
.arm

	thumb_func_start sub_805462C
sub_805462C: @ 0x0805462C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _080546A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldr r2, _080546A4 @ =IWRAM_START + 0x54
	adds r4, r1, r2
	ldrb r0, [r4]
	cmp r0, #1
	bhi _080546B0
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r4]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080546A8 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08054692
	lsls r0, r0, #8
	ldr r1, [r5, #0x50]
	adds r1, r1, r0
	str r1, [r5, #0x50]
	ldr r0, [r5, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r4]
	ldr r3, _080546AC @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08054692:
	cmp r0, #0
	ble _080546FC
	lsls r1, r0, #8
	ldr r0, [r5, #0x50]
	adds r0, r0, r1
	str r0, [r5, #0x50]
	b _080546FC
	.align 2, 0
_080546A0: .4byte gCurTask
_080546A4: .4byte IWRAM_START + 0x54
_080546A8: .4byte sub_801EE64
_080546AC: .4byte sub_801EC3C
_080546B0:
	cmp r0, #2
	bne _080546E0
	ldr r2, _080546D4 @ =gSineTable
	ldr r0, _080546D8 @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080546DC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #4
	str r0, [r5, #0x50]
	b _080546FC
	.align 2, 0
_080546D4: .4byte gSineTable
_080546D8: .4byte gStageTime
_080546DC: .4byte 0x000003FF
_080546E0:
	ldr r2, _08054778 @ =gSineTable
	ldr r0, _0805477C @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054780 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #4
	str r0, [r5, #0x4c]
_080546FC:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	asrs r3, r0, #8
	str r3, [sp, #8]
	ldr r0, [r5, #0x48]
	ldr r1, [r5, #0x50]
	adds r0, r0, r1
	asrs r2, r0, #8
	str r2, [sp, #0xc]
	ldr r1, _08054784 @ =gCamera
	ldr r0, [r1]
	adds r4, r3, #0
	subs r0, r4, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #0xc]
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	ldr r4, _08054788 @ =gPlayer
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080547F8
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080547F8
	adds r0, r6, #0
	adds r1, r3, #0
	adds r3, r4, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _08054808
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _0805478C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, _08054790 @ =0x0000FC80
	strh r0, [r4, #0x12]
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08054798
	ldr r0, _08054794 @ =0xFFFFFBFF
	ands r1, r0
	b _0805479A
	.align 2, 0
_08054778: .4byte gSineTable
_0805477C: .4byte gStageTime
_08054780: .4byte 0x000003FF
_08054784: .4byte gCamera
_08054788: .4byte gPlayer
_0805478C: .4byte 0xFFFFFEFF
_08054790: .4byte 0x0000FC80
_08054794: .4byte 0xFFFFFBFF
_08054798:
	orrs r1, r2
_0805479A:
	str r1, [r6, #0x10]
	ldr r0, _080547EC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080547F0 @ =sub_8054904
	str r0, [r1, #8]
	ldr r3, _080547F4 @ =gUnknown_080D8F38
	adds r1, r5, #0
	adds r1, #0x54
	ldrb r0, [r1]
	movs r2, #4
	cmp r0, #1
	bls _080547B4
	movs r2, #0xc
_080547B4:
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r1]
	movs r1, #4
	cmp r0, #1
	bls _080547C4
	movs r1, #0xc
_080547C4:
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	movs r0, #0x99
	bl m4aSongNumStart
	b _080548EE
	.align 2, 0
_080547EC: .4byte gCurTask
_080547F0: .4byte sub_8054904
_080547F4: .4byte gUnknown_080D8F38
_080547F8:
	adds r0, r6, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	bne _08054862
_08054808:
	ldr r0, [r5, #0x44]
	asrs r2, r0, #8
	ldr r3, _0805486C @ =gCamera
	ldr r1, [r3]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _0805483A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _0805483A
	ldr r0, [r5, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805483A
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08054874
_0805483A:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805485E
	movs r4, #0x18
	ldrsh r0, [r6, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _0805485E
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054874
_0805485E:
	ldrb r0, [r5, #8]
	strb r0, [r7]
_08054862:
	ldr r0, _08054870 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080548EE
	.align 2, 0
_0805486C: .4byte gCamera
_08054870: .4byte gCurTask
_08054874:
	ldr r1, [sp, #8]
	lsls r0, r1, #8
	ldr r2, [sp, #0xc]
	lsls r1, r2, #8
	bl sub_80122DC
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _080548E8
	ldr r1, [r6, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080548A4
	ldr r0, _080548A0 @ =0xFFFFFBFF
	ands r1, r0
	b _080548A6
	.align 2, 0
_080548A0: .4byte 0xFFFFFBFF
_080548A4:
	orrs r1, r2
_080548A6:
	str r1, [r6, #0x10]
	ldr r3, _080548F8 @ =gUnknown_080D8F38
	adds r4, r5, #0
	adds r4, #0x54
	ldrb r2, [r4]
	movs r1, #2
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r0, [r4]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080548FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054900 @ =sub_8054224
	str r0, [r1, #8]
_080548E8:
	adds r0, r6, #0
	bl DisplaySprite
_080548EE:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080548F8: .4byte gUnknown_080D8F38
_080548FC: .4byte gCurTask
_08054900: .4byte sub_8054224

	thumb_func_start sub_8054904
sub_8054904: @ 0x08054904
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08054984 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r0, r0, r1
	mov r8, r0
	ldr r2, [r4]
	mov sb, r2
	ldr r3, _08054988 @ =IWRAM_START + 0x54
	adds r7, r1, r3
	ldrb r0, [r7]
	cmp r0, #1
	bhi _08054994
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r7]
	movs r3, #0
	str r3, [sp]
	ldr r3, _0805498C @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801F07C
	cmp r0, #0
	bge _08054974
	lsls r0, r0, #8
	ldr r1, [r4, #0x50]
	adds r1, r1, r0
	str r1, [r4, #0x50]
	ldr r0, [r4, #0x48]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x4c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldrb r2, [r7]
	ldr r3, _08054990 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08054974:
	cmp r0, #0
	ble _080549E0
	lsls r1, r0, #8
	ldr r0, [r4, #0x50]
	adds r0, r0, r1
	str r0, [r4, #0x50]
	b _080549E0
	.align 2, 0
_08054984: .4byte gCurTask
_08054988: .4byte IWRAM_START + 0x54
_0805498C: .4byte sub_801EE64
_08054990: .4byte sub_801EC3C
_08054994:
	cmp r0, #2
	bne _080549C4
	ldr r2, _080549B8 @ =gSineTable
	ldr r0, _080549BC @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080549C0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r7, #0
	ldrsh r0, [r0, r7]
	asrs r0, r0, #4
	str r0, [r4, #0x50]
	b _080549E0
	.align 2, 0
_080549B8: .4byte gSineTable
_080549BC: .4byte gStageTime
_080549C0: .4byte 0x000003FF
_080549C4:
	ldr r2, _08054A68 @ =gSineTable
	ldr r0, _08054A6C @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054A70 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #4
	str r0, [r4, #0x4c]
_080549E0:
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	adds r0, r0, r1
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	adds r0, r0, r1
	asrs r6, r0, #8
	ldr r3, _08054A74 @ =gCamera
	ldr r0, [r3]
	subs r0, r5, r0
	mov r2, r8
	strh r0, [r2, #0x16]
	ldr r0, [r3, #4]
	subs r0, r6, r0
	strh r0, [r2, #0x18]
	ldr r0, [r4, #0x44]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r1, r7
	cmp r2, r0
	bgt _08054A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08054A30
	ldr r0, [r4, #0x48]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08054A30
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08054A7C
_08054A30:
	mov r7, r8
	ldrh r0, [r7, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08054A56
	movs r1, #0x18
	ldrsh r0, [r7, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08054A56
	movs r2, #0x18
	ldrsh r1, [r7, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08054A7C
_08054A56:
	ldrb r0, [r4, #8]
	mov r3, sb
	strb r0, [r3]
	ldr r0, _08054A78 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08054AD4
	.align 2, 0
_08054A68: .4byte gSineTable
_08054A6C: .4byte gStageTime
_08054A70: .4byte 0x000003FF
_08054A74: .4byte gCamera
_08054A78: .4byte gCurTask
_08054A7C:
	lsls r0, r5, #8
	lsls r1, r6, #8
	bl sub_80122DC
	mov r0, r8
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _08054ACE
	ldr r3, _08054AE4 @ =gUnknown_080D8F38
	adds r4, #0x54
	ldrb r2, [r4]
	movs r1, #2
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r7, r8
	strh r0, [r7, #0xa]
	ldrb r0, [r4]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	mov r0, r8
	adds r0, #0x20
	strb r1, [r0]
	mov r1, r8
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08054AE8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08054AEC @ =sub_8054224
	str r0, [r1, #8]
_08054ACE:
	mov r0, r8
	bl DisplaySprite
_08054AD4:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054AE4: .4byte gUnknown_080D8F38
_08054AE8: .4byte gCurTask
_08054AEC: .4byte sub_8054224
