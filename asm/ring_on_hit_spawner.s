.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gPlayerCharacterIdleAnims
gPlayerCharacterIdleAnims: @ 0x080D672C
    .2byte 0, 91, 182, 273, 364

.text
.syntax unified
.arm

@ Called on Stage Initialization
	thumb_func_start InitPlayerHitRingsSpawner
InitPlayerHitRingsSpawner: @ 0x0801FC2C
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _0801FC44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801FC60
	cmp r0, #2
	bhi _0801FC50
	ldr r4, _0801FC48 @ =gUnknown_030059D8
	ldr r0, _0801FC4C @ =sub_8021368
	b _0801FC64
	.align 2, 0
_0801FC44: .4byte gGameMode
_0801FC48: .4byte gUnknown_030059D8
_0801FC4C: .4byte sub_8021368
_0801FC50:
	ldr r4, _0801FC58 @ =gUnknown_030059D8
	ldr r0, _0801FC5C @ =sub_8021388
	b _0801FC64
	.align 2, 0
_0801FC58: .4byte gUnknown_030059D8
_0801FC5C: .4byte sub_8021388
_0801FC60:
	ldr r4, _0801FCF0 @ =gUnknown_030059D8
	ldr r0, _0801FCF4 @ =Task_80213A8
_0801FC64:
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _0801FCF8 @ =0x00002001
	ldr r3, _0801FCFC @ =TaskDestructor_80213B4
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _0801FD00 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	ldr r0, _0801FD04 @ =0x000002D6
	strh r0, [r1, #0xa]
	ldr r2, _0801FD08 @ =IWRAM_START + 0x20
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0801FD0C @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0801FD10 @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _0801FD14 @ =IWRAM_START + 0x25
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _0801FD18 @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _0801FD1C @ =IWRAM_START + 0x2B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _0801FD20 @ =IWRAM_START + 0x2B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _0801FD24 @ =IWRAM_START + 0x2B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _0801FD28 @ =IWRAM_START + 0x30
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _0801FD2C @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _0801FD30 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FCF0: .4byte gUnknown_030059D8
_0801FCF4: .4byte Task_80213A8
_0801FCF8: .4byte 0x00002001
_0801FCFC: .4byte TaskDestructor_80213B4
_0801FD00: .4byte 0x06011F00
_0801FD04: .4byte 0x000002D6
_0801FD08: .4byte IWRAM_START + 0x20
_0801FD0C: .4byte IWRAM_START + 0x21
_0801FD10: .4byte IWRAM_START + 0x22
_0801FD14: .4byte IWRAM_START + 0x25
_0801FD18: .4byte 0x00042200
_0801FD1C: .4byte IWRAM_START + 0x2B6
_0801FD20: .4byte IWRAM_START + 0x2B4
_0801FD24: .4byte IWRAM_START + 0x2B0
_0801FD28: .4byte IWRAM_START + 0x30
_0801FD2C: .4byte 0x040000D4
_0801FD30: .4byte 0x81000140

	thumb_func_start sub_801FD34
sub_801FD34: @ 0x0801FD34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _0801FDB8 @ =gUnknown_030059D8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0801FDBC @ =IWRAM_START + 0x30
	adds r4, r0, r1
	ldr r6, _0801FDC0 @ =gPlayer
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	bne _0801FD5E
	b _0801FE5A
_0801FD5E:
	cmp r7, #0x20
	ble _0801FD64
	movs r7, #0x20
_0801FD64:
	ldr r0, _0801FDC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801FD72
	cmp r7, #0x10
	ble _0801FD72
	movs r7, #0x10
_0801FD72:
	movs r0, #0x76      @ SE_RINGS_LOST
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _0801FDC8 @ =gSineTable
	mov sl, r1
	ldr r0, _0801FDCC @ =gPseudoRandom
	mov sb, r0
_0801FD8A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0801FE4E
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _0801FE00
	asrs r2, r3, #8
	cmp r2, #5
	ble _0801FDD0
	rsbs r0, r2, #0
	adds r0, #9
	b _0801FDD2
	.align 2, 0
_0801FDB8: .4byte gUnknown_030059D8
_0801FDBC: .4byte IWRAM_START + 0x30
_0801FDC0: .4byte gPlayer
_0801FDC4: .4byte gGameMode
_0801FDC8: .4byte gSineTable
_0801FDCC: .4byte gPseudoRandom
_0801FDD0:
	adds r0, r2, #0
_0801FDD2:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r1, #0x80
	orrs r3, r1
_0801FE00:
	movs r2, #0
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	ldr r0, _0801FE6C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801FE16
	rsbs r0, r6, #0
	strh r0, [r4, #0xa]
_0801FE16:
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	strh r2, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0801FE70 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0801FE74 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _0801FE3A
	movs r0, #4
	strh r0, [r4, #0x10]
_0801FE3A:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _0801FE5A
_0801FE4E:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _0801FD8A
_0801FE5A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE6C: .4byte gUnknown_03005424
_0801FE70: .4byte 0x00196225
_0801FE74: .4byte 0x3C6EF35F

	thumb_func_start sub_801FE78
sub_801FE78: @ 0x0801FE78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0801FFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _0801FFE0 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _0801FFE4 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _0801FFE8 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r2, #0x1f
	str r2, [sp, #0x14]
_0801FEB8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0801FEC0
	b _08020180
_0801FEC0:
	movs r4, #8
	ldrsh r0, [r5, r4]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r0, #0xa
	ldrsh r2, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r7, r1, #8
	asrs r0, r0, #8
	mov r8, r0
	ldr r1, _0801FFEC @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	mov r2, r8
	subs r2, r2, r0
	mov sl, r2
	ldr r4, _0801FFF0 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _0801FEFC
	b _08020008
_0801FEFC:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0801FF12
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801FF12
	b _08020008
_0801FF12:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020008
	adds r6, r2, #0
	adds r6, #0x38
	adds r2, r7, #0
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF3E
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _0801FF4A
	cmp r2, r1
	blt _08020008
_0801FF3E:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF4A:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0801FF64
	cmp r8, r1
	bge _0801FF70
	cmp r2, r1
	blt _08020008
_0801FF64:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020008
_0801FF70:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _0801FFF4 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _0801FFF8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0801FFC4
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0801FFC4
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801FFC4
	ldr r1, _08020000 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0801FFBC
	movs r0, #0xff
_0801FFBC:
	strb r0, [r1]
	ldr r1, _08020004 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0801FFC4:
	ldr r0, _0801FFFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801FFD8
	ldr r1, _0801FFF4 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0801FFD8
	movs r0, #0xff
	strh r0, [r1]
_0801FFD8:
	movs r0, #0
	b _0802017E
	.align 2, 0
_0801FFDC: .4byte gCurTask
_0801FFE0: .4byte IWRAM_START + 0x30
_0801FFE4: .4byte IWRAM_START + 0x2B0
_0801FFE8: .4byte IWRAM_START + 0x2B4
_0801FFEC: .4byte gCamera
_0801FFF0: .4byte gPlayer
_0801FFF4: .4byte gRingCount
_0801FFF8: .4byte gCurrentLevel
_0801FFFC: .4byte gGameMode
_08020000: .4byte gNumLives
_08020004: .4byte gUnknown_030054A8
_08020008:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _08020046
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020046
	mov r0, r8
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _080200EC @ =sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020046
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020046:
	ldr r2, [sp, #4]
	ldr r4, _080200F0 @ =0x000002B6
	adds r0, r2, r4
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020090
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _08020090
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020090
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _080200EC @ =sub_801EC3C
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020090
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020090:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020166
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _08020166
	mov r2, sl
	cmp r2, #0xa7
	bgt _08020166
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080200C0
	ldr r0, _080200F4 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020166
_080200C0:
	mov r2, sb
	adds r2, #0x23
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _080200D2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080200F8
_080200D2:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sp
	ldrh r1, [r0, #0x18]
	mov r0, sb
	strh r1, [r0, #0x16]
	mov r2, sl
	strh r2, [r0, #0x18]
	bl DisplaySprite
	movs r4, #1
	str r4, [sp, #0x10]
	b _08020166
	.align 2, 0
_080200EC: .4byte sub_801EC3C
_080200F0: .4byte 0x000002B6
_080200F4: .4byte gStageTime
_080200F8:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080201A0 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _080201A4 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020166
	ldr r1, _080201A8 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _080201AC @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _080201B0 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020166:
	ldrh r1, [r5, #0x10]
	ldr r2, _080201B4 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802017E:
	strh r0, [r5, #0xc]
_08020180:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _0802018E
	b _0801FEB8
_0802018E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080201A0: .4byte gUnknown_030022D0
_080201A4: .4byte iwram_end
_080201A8: .4byte 0x040000D4
_080201AC: .4byte 0x80000003
_080201B0: .4byte 0x000001FF
_080201B4: .4byte 0x0000FFFC

	thumb_func_start sub_80201B8
sub_80201B8: @ 0x080201B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0802032C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020330 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r4, _08020334 @ =IWRAM_START + 0x2B0
	adds r0, r1, r4
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, _08020338 @ =IWRAM_START + 0x2B4
	adds r1, r1, r0
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r2, #0x1f
	str r2, [sp, #0x14]
_080201F8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020200
	b _080204DC
_08020200:
	movs r4, #8
	ldrsh r1, [r5, r4]
	ldr r0, _0802033C @ =gUnknown_030054FC
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r2, [r5]
	adds r2, r2, r1
	str r2, [r5]
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	ldr r0, _08020340 @ =gUnknown_030054E0
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	asrs r2, r2, #8
	mov r8, r2
	mov ip, r8
	asrs r7, r0, #8
	ldr r1, _08020344 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov sl, r0
	ldr r4, _08020348 @ =gPlayer
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldrh r0, [r5, #0xc]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	ble _08020248
	b _08020360
_08020248:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x14
	bne _0802025E
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0802025E
	b _08020360
_0802025E:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802026A
	b _08020360
_0802026A:
	adds r6, r2, #0
	adds r6, #0x38
	mov r2, r8
	subs r2, #8
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0802028C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020298
	cmp r2, r1
	blt _08020360
_0802028C:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_08020298:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080202B2
	cmp r7, r1
	bge _080202BE
	cmp r2, r1
	blt _08020360
_080202B2:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020360
_080202BE:
	mov r2, ip
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _0802034C @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020350 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020312
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020312
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020312
	ldr r1, _08020358 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802030A
	movs r0, #0xff
_0802030A:
	strb r0, [r1]
	ldr r1, _0802035C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020312:
	ldr r0, _08020354 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020326
	ldr r1, _0802034C @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020326
	movs r0, #0xff
	strh r0, [r1]
_08020326:
	movs r0, #0
	b _080204DA
	.align 2, 0
_0802032C: .4byte gCurTask
_08020330: .4byte IWRAM_START + 0x30
_08020334: .4byte IWRAM_START + 0x2B0
_08020338: .4byte IWRAM_START + 0x2B4
_0802033C: .4byte gUnknown_030054FC
_08020340: .4byte gUnknown_030054E0
_08020344: .4byte gCamera
_08020348: .4byte gPlayer
_0802034C: .4byte gRingCount
_08020350: .4byte gCurrentLevel
_08020354: .4byte gGameMode
_08020358: .4byte gNumLives
_0802035C: .4byte gUnknown_030054A8
_08020360:
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	ble _0802039A
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802039A
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	ldr r0, _08020448 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802039A
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802039A:
	ldr r1, [sp, #4]
	ldr r2, _0802044C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080203E8
	movs r4, #0xa
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bge _080203E8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080203E8
	adds r0, r7, #0
	subs r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	ldr r1, _08020448 @ =sub_801EC3C
	str r1, [sp]
	mov r1, r8
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080203E8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080203E8:
	ldrh r0, [r5, #0xa]
	ldr r2, [sp, #8]
	adds r0, r0, r2
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _080204C2
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _080204C2
	mov r4, sl
	cmp r4, #0xa7
	bgt _080204C2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020418
	ldr r0, _08020450 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080204C2
_08020418:
	mov r2, sb
	adds r2, #0x23
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0802042A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020454
_0802042A:
	movs r0, #0xff
	strb r0, [r2]
	mov r1, sp
	ldrh r2, [r1, #0x18]
	mov r1, sb
	strh r2, [r1, #0x16]
	mov r4, sl
	strh r4, [r1, #0x18]
	mov r0, sb
	bl DisplaySprite
	movs r0, #1
	str r0, [sp, #0x10]
	b _080204C2
	.align 2, 0
_08020448: .4byte sub_801EC3C
_0802044C: .4byte 0x000002B6
_08020450: .4byte gStageTime
_08020454:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080204FC @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08020500 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _080204C2
	ldr r1, _08020504 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020508 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _0802050C @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_080204C2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020510 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_080204DA:
	strh r0, [r5, #0xc]
_080204DC:
	adds r5, #0x14
	ldr r4, [sp, #0x14]
	subs r4, #1
	str r4, [sp, #0x14]
	cmp r4, #0
	blt _080204EA
	b _080201F8
_080204EA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080204FC: .4byte gUnknown_030022D0
_08020500: .4byte iwram_end
_08020504: .4byte 0x040000D4
_08020508: .4byte 0x80000003
_0802050C: .4byte 0x000001FF
_08020510: .4byte 0x0000FFFC

	thumb_func_start sub_8020514
sub_8020514: @ 0x08020514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r0, _08020694 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020698 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, _0802069C @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080206A0 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r1, #0
	mov sl, r1
_08020554:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _0802055C
	b _0802068A
_0802055C:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r6, r1, #8
	asrs r7, r0, #8
	ldr r1, _080206A4 @ =gCamera
	ldr r0, [r1]
	subs r0, r6, r0
	str r0, [sp, #0x14]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	ldr r2, _080206A8 @ =gPlayer
	mov ip, r2
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	ldrh r4, [r5, #0xc]
	mov r8, r4
	mov r0, sl
	adds r0, #1
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r8, r1
	ble _080205A4
	b _080207E8
_080205A4:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _080205BC
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080205BC
	b _080206C0
_080205BC:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080205CA
	b _080206C0
_080205CA:
	adds r4, r2, #0
	adds r4, #0x38
	adds r2, r6, #0
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080205EC
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _080205F8
	cmp r2, r1
	blt _080206C0
_080205EC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_080205F8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020614
	cmp r7, r1
	bge _08020620
	cmp r2, r1
	blt _080206C0
_08020614:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080206C0
_08020620:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _080206AC @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _080206B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020672
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020672
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020672
	ldr r1, _080206B8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0802066A
	movs r0, #0xff
_0802066A:
	strb r0, [r1]
	ldr r1, _080206BC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020672:
	ldr r0, _080206B4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020686
	ldr r1, _080206AC @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020686
	movs r0, #0xff
	strh r0, [r1]
_08020686:
	movs r0, #0
	strh r0, [r5, #0xc]
_0802068A:
	adds r5, #0x14
	mov r2, sl
	adds r2, #1
	str r2, [sp, #0x1c]
	b _08020966
	.align 2, 0
_08020694: .4byte gCurTask
_08020698: .4byte IWRAM_START + 0x30
_0802069C: .4byte IWRAM_START + 0x2B0
_080206A0: .4byte IWRAM_START + 0x2B4
_080206A4: .4byte gCamera
_080206A8: .4byte gPlayer
_080206AC: .4byte gRingCount
_080206B0: .4byte gCurrentLevel
_080206B4: .4byte gGameMode
_080206B8: .4byte gNumLives
_080206BC: .4byte gUnknown_030054A8
_080206C0:
	adds r3, r5, #0
	adds r3, #0x14
	str r3, [sp, #0x20]
	mov r4, sl
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	cmp r8, r0
	ble _080206D4
	b _080207E8
_080206D4:
	movs r1, #0
	mov r8, r1
_080206D8:
	ldr r0, _08020708 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r8, r0
	beq _080207D8
	ldr r1, _0802070C @ =gMultiplayerPlayerTasks
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080207D8
	ldrh r4, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r3, r4
	mov ip, r3
	ldr r0, _08020710 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020714
	ldrb r0, [r3, #0xa]
	b _08020738
	.align 2, 0
_08020708: .4byte 0x04000128
_0802070C: .4byte gMultiplayerPlayerTasks
_08020710: .4byte gGameMode
_08020714:
	mov r0, ip
	ldrb r1, [r0, #0xa]
	ldr r2, _080207CC @ =gPlayerCharacterIdleAnims
	mov sl, r2
	ldr r2, _080207D0 @ =gMultiplayerCharacters
	ldr r3, _080207D4 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020738:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020750
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080207D8
_08020750:
	adds r3, r6, #0
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020774
	adds r0, r6, #0
	adds r0, #8
	cmp r0, r1
	bge _08020786
	cmp r3, r1
	blt _080207D8
_08020774:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_08020786:
	adds r3, r7, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _080207A8
	cmp r7, r1
	bge _080207BA
	cmp r3, r1
	blt _080207D8
_080207A8:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _080207D8
_080207BA:
	lsls r0, r6, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _08020962
	.align 2, 0
_080207CC: .4byte gPlayerCharacterIdleAnims
_080207D0: .4byte gMultiplayerCharacters
_080207D4: .4byte IWRAM_START + 0x56
_080207D8:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080207E8
	b _080206D8
_080207E8:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020826
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020826
	adds r0, r7, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _080208D0 @ =sub_801EC3C
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020826
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020826:
	ldr r4, [sp, #4]
	ldr r1, _080208D4 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020870
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020870
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020870
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _080208D0 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020870
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020870:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	subs r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x14]
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802094A
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x18]
	cmp r1, r0
	ble _0802094A
	cmp r1, #0xa7
	bgt _0802094A
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080208A0
	ldr r0, _080208D8 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802094A
_080208A0:
	mov r2, sb
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _080208B2
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080208DC
_080208B2:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x14]
	mov r4, sb
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x18]
	strh r1, [r4, #0x18]
	mov r0, sb
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x10]
	b _0802094A
	.align 2, 0
_080208D0: .4byte sub_801EC3C
_080208D4: .4byte 0x000002B6
_080208D8: .4byte gStageTime
_080208DC:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020980 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r3, sb
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08020984 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0802094A
	ldr r1, _08020988 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0802098C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x18]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r4, _08020990 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_0802094A:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020994 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08020962:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x20]
_08020966:
	ldr r3, [sp, #0x1c]
	mov sl, r3
	cmp r3, #0x1f
	bgt _08020970
	b _08020554
_08020970:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020980: .4byte gUnknown_030022D0
_08020984: .4byte iwram_end
_08020988: .4byte 0x040000D4
_0802098C: .4byte 0x80000003
_08020990: .4byte 0x000001FF
_08020994: .4byte 0x0000FFFC

	thumb_func_start sub_8020998
sub_8020998: @ 0x08020998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _080209E8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _080209EC @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sl, r2
	ldr r3, _080209F0 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _080209F4 @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sl
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x14]
_080209D8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _080209F8
	adds r5, #0x14
	ldr r2, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_080209E8: .4byte gCurTask
_080209EC: .4byte IWRAM_START + 0x30
_080209F0: .4byte IWRAM_START + 0x2B0
_080209F4: .4byte IWRAM_START + 0x2B4
_080209F8:
	movs r3, #8
	ldrsh r0, [r5, r3]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r4, #0xa
	ldrsh r2, [r5, r4]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r1, r1, #8
	mov sb, r1
	mov r8, sb
	asrs r6, r0, #8
	ldr r1, _08020B34 @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r2, r2, r0
	str r2, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r6, r0
	str r0, [sp, #0x1c]
	ldr r3, _08020B38 @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020A44
	b _08020C70
_08020A44:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020A5C
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020A5C
	b _08020B50
_08020A5C:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08020B50
	adds r4, r2, #0
	adds r4, #0x38
	mov r2, sb
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020A8A
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08020A96
	cmp r2, r1
	blt _08020B50
_08020A8A:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020A96:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020AB2
	cmp r6, r1
	bge _08020ABE
	cmp r2, r1
	blt _08020B50
_08020AB2:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08020B50
_08020ABE:
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08020B3C @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08020B40 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020B12
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020B12
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020B12
	ldr r1, _08020B48 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020B0A
	movs r0, #0xff
_08020B0A:
	strb r0, [r1]
	ldr r1, _08020B4C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020B12:
	ldr r0, _08020B44 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020B26
	ldr r1, _08020B3C @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08020B26
	movs r0, #0xff
	strh r0, [r1]
_08020B26:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x20]
	b _08020DEE
	.align 2, 0
_08020B34: .4byte gCamera
_08020B38: .4byte gPlayer
_08020B3C: .4byte gRingCount
_08020B40: .4byte gCurrentLevel
_08020B44: .4byte gGameMode
_08020B48: .4byte gNumLives
_08020B4C: .4byte gUnknown_030054A8
_08020B50:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0xc]
	cmp r7, r1
	ble _08020B64
	b _08020C70
_08020B64:
	movs r7, #0
_08020B66:
	ldr r0, _08020B94 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08020C64
	ldr r1, _08020B98 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08020C64
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08020B9C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08020BA0
	ldrb r0, [r2, #0xa]
	b _08020BC2
	.align 2, 0
_08020B94: .4byte 0x04000128
_08020B98: .4byte gMultiplayerPlayerTasks
_08020B9C: .4byte gGameMode
_08020BA0:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _08020C58 @ =gMultiplayerCharacters
	ldr r3, _08020C5C @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08020C60 @ =gPlayerCharacterIdleAnims
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_08020BC2:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08020BDA
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08020C64
_08020BDA:
	mov r3, r8
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _08020BFE
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _08020C10
	cmp r3, r1
	blt _08020C64
_08020BFE:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C10:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08020C32
	cmp r6, r1
	bge _08020C44
	cmp r3, r1
	blt _08020C64
_08020C32:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08020C64
_08020C44:
	mov r1, r8
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _08020DEA
	.align 2, 0
_08020C58: .4byte gMultiplayerCharacters
_08020C5C: .4byte IWRAM_START + 0x56
_08020C60: .4byte gPlayerCharacterIdleAnims
_08020C64:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08020C70
	b _08020B66
_08020C70:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08020CAA
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CAA
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08020D58 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	mov r1, sb
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _08020CAA
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CAA:
	ldr r4, [sp, #4]
	ldr r1, _08020D5C @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08020CF8
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _08020CF8
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08020CF8
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08020D58 @ =sub_801EC3C
	str r1, [sp]
	mov r1, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _08020CF8
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08020CF8:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _08020DD2
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	ble _08020DD2
	cmp r1, #0xa7
	bgt _08020DD2
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08020D28
	ldr r0, _08020D60 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08020DD2
_08020D28:
	mov r2, sl
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _08020D3A
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08020D64
_08020D3A:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x18]
	mov r4, sl
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x1c]
	strh r1, [r4, #0x18]
	mov r0, sl
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x10]
	b _08020DD2
	.align 2, 0
_08020D58: .4byte sub_801EC3C
_08020D5C: .4byte 0x000002B6
_08020D60: .4byte gStageTime
_08020D64:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08020E08 @ =gUnknown_030022D0
	adds r4, r0, r1
	mov r3, sl
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08020E0C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08020DD2
	ldr r1, _08020E10 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08020E14 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sl
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x1c]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sl
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _08020E18 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08020DD2:
	ldrh r1, [r5, #0x10]
	ldr r2, _08020E1C @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08020DEA:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_08020DEE:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x14]
	cmp r3, #0x1f
	bgt _08020DF8
	b _080209D8
_08020DF8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020E08: .4byte gUnknown_030022D0
_08020E0C: .4byte iwram_end
_08020E10: .4byte 0x040000D4
_08020E14: .4byte 0x80000003
_08020E18: .4byte 0x000001FF
_08020E1C: .4byte 0x0000FFFC

	thumb_func_start sub_8020E20
sub_8020E20: @ 0x08020E20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _08020E70 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08020E74 @ =IWRAM_START + 0x30
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _08020E78 @ =IWRAM_START + 0x2B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _08020E7C @ =IWRAM_START + 0x2B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl UpdateSpriteAnimation
	movs r1, #0
	str r1, [sp, #0x18]
_08020E60:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08020E80
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08020E70: .4byte gCurTask
_08020E74: .4byte IWRAM_START + 0x30
_08020E78: .4byte IWRAM_START + 0x2B0
_08020E7C: .4byte IWRAM_START + 0x2B4
_08020E80:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _08020EAE
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _0802131E
_08020EAE:
	ldr r0, _08020ECC @ =0x0000EFFF
	cmp r2, r0
	bgt _08020ED4
	ldr r0, _08020ED0 @ =0x00011FFF
	cmp r3, r0
	bgt _08020ED4
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _08020EF2
	.align 2, 0
_08020ECC: .4byte 0x0000EFFF
_08020ED0: .4byte 0x00011FFF
_08020ED4:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _08020EF4
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08020EF4
	ldr r3, _08021020 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _08021024 @ =0xFFFCA000
	adds r0, r1, r4
_08020EF2:
	str r0, [r5, #4]
_08020EF4:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r6, r0, #8
	ldr r1, _08021028 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r6, r0
	mov r8, r0
	ldr r3, _0802102C @ =gPlayer
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r7, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08020F30
	b _08021164
_08020F30:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _08020F48
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08020F48
	b _08021044
_08020F48:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08021044
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F76
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _08020F82
	cmp r2, r1
	blt _08021044
_08020F76:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020F82:
	adds r2, r6, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08020F9E
	cmp r6, r1
	bge _08020FAA
	cmp r2, r1
	blt _08021044
_08020F9E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08021044
_08020FAA:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08021030 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08021034 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _08020FFE
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08020FFE
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020FFE
	ldr r1, _0802103C @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _08020FF6
	movs r0, #0xff
_08020FF6:
	strb r0, [r1]
	ldr r1, _08021040 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08020FFE:
	ldr r0, _08021038 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021012
	ldr r1, _08021030 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08021012
	movs r0, #0xff
	strh r0, [r1]
_08021012:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _0802131E
	.align 2, 0
_08021020: .4byte 0xFFFA6000
_08021024: .4byte 0xFFFCA000
_08021028: .4byte gCamera
_0802102C: .4byte gPlayer
_08021030: .4byte gRingCount
_08021034: .4byte gCurrentLevel
_08021038: .4byte gGameMode
_0802103C: .4byte gNumLives
_08021040: .4byte gUnknown_030054A8
_08021044:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r7, r1
	ble _08021058
	b _08021164
_08021058:
	movs r7, #0
_0802105A:
	ldr r0, _08021088 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	beq _08021158
	ldr r1, _0802108C @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08021158
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r2, r4
	mov ip, r2
	ldr r0, _08021090 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08021094
	ldrb r0, [r2, #0xa]
	b _080210B6
	.align 2, 0
_08021088: .4byte 0x04000128
_0802108C: .4byte gMultiplayerPlayerTasks
_08021090: .4byte gGameMode
_08021094:
	mov r3, ip
	ldrb r1, [r3, #0xa]
	ldr r2, _0802114C @ =gMultiplayerCharacters
	ldr r3, _08021150 @ =IWRAM_START + 0x56
	adds r0, r4, r3
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	ldr r4, _08021154 @ =gPlayerCharacterIdleAnims
	adds r0, r0, r4
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
_080210B6:
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080210CE
	mov r0, ip
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08021158
_080210CE:
	mov r3, sb
	subs r3, #8
	mov r0, ip
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	subs r0, #0x24
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	cmp r3, r1
	bgt _080210F2
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _08021104
	cmp r3, r1
	blt _08021158
_080210F2:
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021104:
	adds r3, r6, #0
	subs r3, #0x10
	mov r0, ip
	adds r0, #0x52
	movs r4, #0
	ldrsh r0, [r0, r4]
	mov r1, ip
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _08021126
	cmp r6, r1
	bge _08021138
	cmp r3, r1
	blt _08021158
_08021126:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _08021158
_08021138:
	mov r1, sb
	lsls r0, r1, #0x10
	lsls r1, r6, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	movs r0, #0
	b _0802131A
	.align 2, 0
_0802114C: .4byte gMultiplayerCharacters
_08021150: .4byte IWRAM_START + 0x56
_08021154: .4byte gPlayerCharacterIdleAnims
_08021158:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #3
	bhi _08021164
	b _0802105A
_08021164:
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0802119E
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802119E
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08021220 @ =sub_801EC3C
	str r0, [sp]
	adds r0, r6, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bgt _0802119E
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0802119E:
	ldr r4, [sp, #4]
	ldr r1, _08021224 @ =0x000002B6
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080211EC
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _080211EC
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080211EC
	adds r0, r6, #0
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08021220 @ =sub_801EC3C
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_801F100
	cmp r0, #0
	bgt _080211EC
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080211EC:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #0xc]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _0802120A
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _0802120A
	mov r0, r8
	cmp r0, #0xa7
	ble _0802123C
_0802120A:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08021230
	ldr r1, _08021228 @ =0xFFFFFA60
	add sl, r1
	ldr r2, _0802122C @ =0xFFFFFCA0
	add r8, r2
	b _0802123C
	.align 2, 0
_08021220: .4byte sub_801EC3C
_08021224: .4byte 0x000002B6
_08021228: .4byte 0xFFFFFA60
_0802122C: .4byte 0xFFFFFCA0
_08021230:
	movs r3, #0xb4
	lsls r3, r3, #3
	add sl, r3
	movs r4, #0xd8
	lsls r4, r4, #2
	add r8, r4
_0802123C:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _08021302
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _08021302
	mov r0, r8
	cmp r0, #0xa7
	bgt _08021302
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08021264
	ldr r0, _08021290 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08021302
_08021264:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _08021276
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08021294
_08021276:
	movs r0, #0xff
	strb r0, [r2]
	mov r3, sl
	ldr r2, [sp, #8]
	strh r3, [r2, #0x16]
	mov r4, r8
	strh r4, [r2, #0x18]
	ldr r0, [sp, #8]
	bl DisplaySprite
	movs r0, #1
	str r0, [sp, #0x14]
	b _08021302
	.align 2, 0
_08021290: .4byte gStageTime
_08021294:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08021338 @ =gUnknown_030022D0
	adds r4, r0, r1
	ldr r1, [sp, #8]
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _0802133C @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _08021302
	ldr r1, _08021340 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08021344 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _08021348 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_08021302:
	ldrh r1, [r5, #0x10]
	ldr r2, _0802134C @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_0802131A:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_0802131E:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _08021328
	b _08020E60
_08021328:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021338: .4byte gUnknown_030022D0
_0802133C: .4byte iwram_end
_08021340: .4byte 0x040000D4
_08021344: .4byte 0x80000003
_08021348: .4byte 0x000001FF
_0802134C: .4byte 0x0000FFFC

	thumb_func_start sub_8021350
sub_8021350: @ 0x08021350
	push {r4, lr}
	ldr r4, _08021364 @ =gUnknown_030059D8
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021364: .4byte gUnknown_030059D8

	thumb_func_start sub_8021368
sub_8021368: @ 0x08021368
	push {lr}
	ldr r0, _0802137C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021380
	bl sub_801FE78
	b _08021384
	.align 2, 0
_0802137C: .4byte gUnknown_03005424
_08021380:
	bl sub_80201B8
_08021384:
	pop {r0}
	bx r0

	thumb_func_start sub_8021388
sub_8021388: @ 0x08021388
	push {lr}
	ldr r0, _0802139C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080213A0
	bl sub_8020514
	b _080213A4
	.align 2, 0
_0802139C: .4byte gUnknown_03005424
_080213A0:
	bl sub_8020998
_080213A4:
	pop {r0}
	bx r0

	thumb_func_start Task_80213A8
Task_80213A8: @ 0x080213A8
	push {lr}
	bl sub_8020E20
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_80213B4
TaskDestructor_80213B4: @ 0x080213B4
	ldr r1, _080213BC @ =gUnknown_030059D8
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080213BC: .4byte gUnknown_030059D8
