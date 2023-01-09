.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_803959C
sub_803959C: @ 0x0803959C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080396BC @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov r8, r0
	ldr r1, _080396C0 @ =gBgScrollRegs
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	ldrb r2, [r2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	mov r3, r8
	movs r0, #0xf
	ldrsb r0, [r3, r0]
	ldrb r5, [r3]
	adds r0, r0, r5
	strh r0, [r1, #6]
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	strh r0, [r1, #4]
	ldr r1, _080396C4 @ =IWRAM_START + 0x1EC
	adds r0, r6, r1
	bl sub_8004558
	ldr r2, _080396C8 @ =IWRAM_START + 0x21C
	adds r0, r6, r2
	bl sub_8004558
	ldr r3, _080396CC @ =IWRAM_START + 0x24C
	adds r0, r6, r3
	bl sub_8004558
	mov r5, r8
	ldr r1, [r5, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r2, _080396D0 @ =0x000003FF
	ands r0, r2
	str r0, [sp]
	lsls r0, r1, #1
	adds r0, r0, r1
	ands r0, r2
	str r0, [sp, #4]
	cmp r4, #0
	beq _080396E0
	movs r0, #0
	mov sb, r0
	ldr r1, _080396D4 @ =IWRAM_START + 0x10
	adds r1, r1, r6
	mov sl, r1
_08039620:
	mov r0, sl
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _080396AA
	mov r2, sb
	lsls r6, r2, #2
	adds r0, r6, r2
	lsls r0, r0, #1
	ldr r3, _080396D8 @ =gUnknown_080D7838
	adds r0, r0, r3
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xf6
	lsls r1, r1, #1
	adds r0, r0, r1
	mov r2, r8
	adds r7, r2, r0
	mov r3, sb
	lsls r2, r3, #3
	mov r5, r8
	adds r5, #0x30
	adds r5, r5, r2
	movs r3, #0x98
	lsls r3, r3, #1
	add r3, r8
	adds r3, r3, r6
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	mov r4, r8
	adds r4, #0x34
	adds r4, r4, r2
	movs r2, #0x99
	lsls r2, r2, #1
	add r2, r8
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldrh r0, [r3]
	subs r0, #0x28
	strh r0, [r3]
	ldrh r0, [r2]
	subs r0, #0x10
	strh r0, [r2]
	ldr r0, [r5]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	ldr r0, [r4]
	asrs r0, r0, #8
	mov r2, r8
	ldrb r1, [r2]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	ldr r1, _080396DC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
_080396AA:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x1f
	bls _08039620
	b _08039816
	.align 2, 0
_080396BC: .4byte gCurTask
_080396C0: .4byte gBgScrollRegs
_080396C4: .4byte IWRAM_START + 0x1EC
_080396C8: .4byte IWRAM_START + 0x21C
_080396CC: .4byte IWRAM_START + 0x24C
_080396D0: .4byte 0x000003FF
_080396D4: .4byte IWRAM_START + 0x10
_080396D8: .4byte gUnknown_080D7838
_080396DC: .4byte 0xFFFFFBFF
_080396E0:
	movs r3, #0
	mov sb, r3
	ldr r5, _080397CC @ =IWRAM_START + 0x30
	adds r5, r6, r5
	str r5, [sp, #0x10]
	ldr r0, _080397D0 @ =IWRAM_START + 0x34
	adds r0, r6, r0
	str r0, [sp, #0x14]
	ldr r6, _080397D4 @ =gUnknown_080D7830
	ldr r1, _080397D8 @ =gSineTable
	mov sl, r1
_080396F6:
	mov r2, sb
	lsls r2, r2, #2
	mov ip, r2
	add r2, sb
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #8
	adds r0, r2, r0
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xf6
	lsls r5, r5, #1
	adds r0, r0, r5
	mov r1, r8
	adds r7, r1, r0
	mov r5, sb
	lsls r3, r5, #3
	ldr r0, [sp, #0x10]
	adds r4, r0, r3
	ldr r1, [r4]
	str r1, [sp, #8]
	ldr r5, [sp, #0x14]
	adds r3, r5, r3
	ldr r0, [r3]
	str r0, [sp, #0xc]
	movs r5, #0x80
	lsls r5, r5, #1
	ldr r1, [sp]
	adds r5, r1, r5
	lsls r0, r5, #1
	add r0, sl
	movs r5, #0
	ldrsh r1, [r0, r5]
	str r1, [sp, #0x1c]
	adds r0, r6, #4
	adds r0, r2, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r5, [sp, #0x1c]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #4
	str r1, [r4]
	adds r0, r2, r6
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #1
	add r0, sl
	movs r1, #0
	ldrsh r5, [r0, r1]
	str r5, [sp, #0x1c]
	adds r0, r6, #6
	adds r0, r2, r0
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r5, [sp, #0x1c]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #4
	str r1, [r3]
	ldr r0, _080397DC @ =gUnknown_080D7832
	adds r2, r2, r0
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3]
	movs r2, #0x98
	lsls r2, r2, #1
	add r2, r8
	add r2, ip
	ldr r0, [r4]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r2]
	movs r1, #0x99
	lsls r1, r1, #1
	add r1, r8
	add r1, ip
	ldr r0, [r3]
	ldr r5, [sp, #0xc]
	subs r0, r0, r5
	strh r0, [r1]
	ldr r0, [r4]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	ldr r0, [r3]
	asrs r0, r0, #8
	mov r3, r8
	ldrb r1, [r3]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	movs r5, #0
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _080397E4
	ldr r0, [r7, #0x10]
	ldr r1, _080397E0 @ =0xFFFFFBFF
	ands r0, r1
	b _080397EC
	.align 2, 0
_080397CC: .4byte IWRAM_START + 0x30
_080397D0: .4byte IWRAM_START + 0x34
_080397D4: .4byte gUnknown_080D7830
_080397D8: .4byte gSineTable
_080397DC: .4byte gUnknown_080D7832
_080397E0: .4byte 0xFFFFFBFF
_080397E4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080397EC:
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_80051E8
	ldr r0, [sp]
	subs r0, #0x40
	ldr r1, _08039868 @ =0x000003FF
	ands r0, r1
	str r0, [sp]
	ldr r0, [sp, #4]
	subs r0, #0x40
	ands r0, r1
	str r0, [sp, #4]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x1f
	bhi _08039816
	b _080396F6
_08039816:
	movs r0, #0xd8
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039858
	movs r7, #0xde
	lsls r7, r7, #1
	add r7, r8
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, r8
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0xdc
	lsls r0, r0, #1
	add r0, r8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r2, r8
	ldrb r0, [r2]
	subs r1, r1, r0
	movs r0, #0xf
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r7, #0
	bl sub_80051E8
_08039858:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039868: .4byte 0x000003FF

	thumb_func_start sub_803986C
sub_803986C: @ 0x0803986C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r1, _0803993C @ =gDispCnt
	ldr r2, _08039940 @ =0x00001341
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08039944 @ =gBgCntRegs
	movs r0, #0
	mov r8, r0
	movs r4, #0
	ldr r0, _08039948 @ =0x00005C09
	strh r0, [r1, #4]
	ldr r0, _0803994C @ =0x00001E06
	strh r0, [r1, #2]
	adds r0, #0xfd
	strh r0, [r1]
	ldr r0, _08039950 @ =gBgScrollRegs
	strh r4, [r0]
	movs r1, #0x48
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r1, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	ldr r0, _08039954 @ =gUnknown_03004D80
	mov r1, r8
	strb r1, [r0, #2]
	ldr r1, _08039958 @ =gUnknown_03002280
	mov r2, r8
	strb r2, [r1, #8]
	strb r2, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r6, #0x20
	strb r6, [r1, #0xb]
	ldr r0, _0803995C @ =sub_8039A38
	movs r2, #0x81
	lsls r2, r2, #8
	str r4, [sp]
	movs r1, #0xc0
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08039960 @ =0x0600F800
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	ldr r1, _08039964 @ =0x00000179
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r6, [r0, #0x26]
	strh r6, [r0, #0x28]
	ldr r2, _08039968 @ =IWRAM_START + 0x2A
	adds r1, r5, r2
	mov r2, r8
	strb r2, [r1]
	strh r4, [r0, #0x2e]
	bl sub_8002A3C
	ldr r1, _0803996C @ =IWRAM_START + 0x40
	adds r0, r5, r1
	ldr r1, _08039970 @ =0x06004000
	str r1, [r0, #4]
	strh r4, [r0, #0xa]
	ldr r1, _08039974 @ =0x0600F000
	str r1, [r0, #0xc]
	strh r4, [r0, #0x18]
	strh r4, [r0, #0x1a]
	movs r1, #0xbd
	lsls r1, r1, #1
	strh r1, [r0, #0x1c]
	strh r4, [r0, #0x1e]
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r6, [r0, #0x26]
	strh r6, [r0, #0x28]
	ldr r2, _08039978 @ =IWRAM_START + 0x6A
	adds r5, r5, r2
	mov r1, r8
	strb r1, [r5]
	movs r1, #1
	strh r1, [r0, #0x2e]
	bl sub_8002A3C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803993C: .4byte gDispCnt
_08039940: .4byte 0x00001341
_08039944: .4byte gBgCntRegs
_08039948: .4byte 0x00005C09
_0803994C: .4byte 0x00001E06
_08039950: .4byte gBgScrollRegs
_08039954: .4byte gUnknown_03004D80
_08039958: .4byte gUnknown_03002280
_0803995C: .4byte sub_8039A38
_08039960: .4byte 0x0600F800
_08039964: .4byte 0x00000179
_08039968: .4byte IWRAM_START + 0x2A
_0803996C: .4byte IWRAM_START + 0x40
_08039970: .4byte 0x06004000
_08039974: .4byte 0x0600F000
_08039978: .4byte IWRAM_START + 0x6A

	thumb_func_start sub_803997C
sub_803997C: @ 0x0803997C
	push {r4, lr}
	ldr r0, _0803999C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080399A0 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803999C: .4byte gCurTask
_080399A0: .4byte IWRAM_START + 0x14

	thumb_func_start sub_80399A4
sub_80399A4: @ 0x080399A4
	push {r4, lr}
	ldr r0, _080399C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _080399C8 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080399C4: .4byte gCurTask
_080399C8: .4byte IWRAM_START + 0x14

	thumb_func_start sub_80399CC
sub_80399CC: @ 0x080399CC
	push {r4, lr}
	ldr r0, _08039A04 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, _08039A08 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r1, _08039A0C @ =gCamera
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039A04: .4byte gCurTask
_08039A08: .4byte IWRAM_START + 0x14
_08039A0C: .4byte gCamera

	thumb_func_start sub_8039A10
sub_8039A10: @ 0x08039A10
	push {r4, lr}
	ldr r0, _08039A30 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldr r0, _08039A34 @ =IWRAM_START + 0x14
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039A30: .4byte gCurTask
_08039A34: .4byte IWRAM_START + 0x14

	thumb_func_start sub_8039A38
sub_8039A38: @ 0x08039A38
	push {lr}
	ldr r0, _08039A48 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08039A48: .4byte gCurTask

@; CreateSkipHandler
	thumb_func_start sub_8039A4C
sub_8039A4C: @ 0x08039A4C
	push {lr}
	sub sp, #4
	ldr r0, _08039A68 @ =sub_8039A6C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r3, #0
	bl TaskCreate
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039A68: .4byte sub_8039A6C

	thumb_func_start sub_8039A6C
sub_8039A6C: @ 0x08039A6C
	push {lr}
	sub sp, #4
	ldr r0, _08039AB0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039AA8
	movs r0, #0
	ldr r1, _08039AB4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08039AB8 @ =gUnknown_03002AE4
	ldr r0, _08039ABC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08039AC0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08039AC4 @ =gVramGraphicsCopyCursor
	ldr r0, _08039AC8 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08039ACC @ =sub_8039AD4
	movs r1, #0
	str r1, [sp]
	ldr r2, _08039AD0 @ =0x00008888
	movs r3, #0
	bl TaskCreate
_08039AA8:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039AB0: .4byte gPressedKeys
_08039AB4: .4byte 0x0000FFFF
_08039AB8: .4byte gUnknown_03002AE4
_08039ABC: .4byte gUnknown_0300287C
_08039AC0: .4byte gUnknown_03005390
_08039AC4: .4byte gVramGraphicsCopyCursor
_08039AC8: .4byte gVramGraphicsCopyQueueIndex
_08039ACC: .4byte sub_8039AD4
_08039AD0: .4byte 0x00008888

@; Start true area 53
	thumb_func_start sub_8039AD4
sub_8039AD4: @ 0x08039AD4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08039B2C @ =gUnknown_030018F0
	movs r4, #0
	strb r4, [r0]
	ldr r0, _08039B30 @ =gUnknown_03002AE0
	strb r4, [r0]
	mov r0, sp
	ldr r1, _08039B34 @ =0x0000FFFF
	adds r5, r1, #0
	strh r5, [r0]
	ldr r1, _08039B38 @ =gUnknown_03001850
	ldr r6, _08039B3C @ =0x01000010
	adds r2, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r5, [r0]
	ldr r1, _08039B40 @ =gUnknown_03004D60
	adds r2, r6, #0
	bl CpuSet
	bl m4aMPlayAllStop
	ldr r0, _08039B44 @ =gGameMode
	strb r4, [r0]
	ldr r0, _08039B48 @ =gSelectedCharacter
	strb r4, [r0]
	ldr r1, _08039B4C @ =gCurrentLevel
	movs r0, #0x1d
	strb r0, [r1]
	bl ApplyGameStageSettings
	bl GameStageStart
	ldr r0, _08039B50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039B2C: .4byte gUnknown_030018F0
_08039B30: .4byte gUnknown_03002AE0
_08039B34: .4byte 0x0000FFFF
_08039B38: .4byte gUnknown_03001850
_08039B3C: .4byte 0x01000010
_08039B40: .4byte gUnknown_03004D60
_08039B44: .4byte gGameMode
_08039B48: .4byte gSelectedCharacter
_08039B4C: .4byte gCurrentLevel
_08039B50: .4byte gCurTask
