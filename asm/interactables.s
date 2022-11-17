.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable002
initSprite_Interactable002: @ 0x0800E72C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800E7A0 @ =sub_800E89C
	ldr r2, _0800E7A4 @ =0x00002010
	ldr r1, _0800E7A8 @ =sub_800F19C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	adds r0, #0xc
	adds r6, r2, r0
	movs r5, #0
	mov r1, r8
	strh r1, [r3, #4]
	mov r0, sb
	strh r0, [r3, #6]
	str r7, [r3]
	ldrb r0, [r7]
	strb r0, [r3, #8]
	strb r4, [r3, #9]
	str r5, [r3, #0x40]
	str r5, [r3, #0x44]
	ldr r1, _0800E7AC @ =IWRAM_START + 0x4C
	adds r0, r2, r1
	strh r5, [r0]
	ldrb r0, [r7, #5]
	ldrb r1, [r7, #6]
	cmp r0, r1
	bls _0800E7D0
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800E7B4
	ldr r1, _0800E7B0 @ =IWRAM_START + 0x48
	adds r0, r2, r1
	movs r1, #4
	strh r1, [r0]
	strh r5, [r3, #0x3c]
	b _0800E7C0
	.align 2, 0
_0800E7A0: .4byte sub_800E89C
_0800E7A4: .4byte 0x00002010
_0800E7A8: .4byte sub_800F19C
_0800E7AC: .4byte IWRAM_START + 0x4C
_0800E7B0: .4byte IWRAM_START + 0x48
_0800E7B4:
	ldr r0, _0800E7C8 @ =IWRAM_START + 0x48
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r3, #0x3c]
_0800E7C0:
	ldr r1, _0800E7CC @ =IWRAM_START + 0x4A
	adds r0, r2, r1
	strh r5, [r0]
	b _0800E806
	.align 2, 0
_0800E7C8: .4byte IWRAM_START + 0x48
_0800E7CC: .4byte IWRAM_START + 0x4A
_0800E7D0:
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800E7F4
	ldr r1, _0800E7EC @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r5, [r0]
	ldr r0, _0800E7F0 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	strh r5, [r3, #0x3c]
	b _0800E806
	.align 2, 0
_0800E7EC: .4byte IWRAM_START + 0x48
_0800E7F0: .4byte IWRAM_START + 0x4A
_0800E7F4:
	ldr r1, _0800E88C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r5, [r0]
	ldr r0, _0800E890 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r3, #0x3c]
_0800E806:
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, r8
	lsls r1, r2, #8
	adds r0, r0, r1
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0x12
	bl VramMalloc
	str r0, [r6, #4]
	ldr r1, _0800E894 @ =gUnknown_080D53E4
	ldr r0, _0800E898 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E88C: .4byte IWRAM_START + 0x48
_0800E890: .4byte IWRAM_START + 0x4A
_0800E894: .4byte gUnknown_080D53E4
_0800E898: .4byte gCurrentLevel

	thumb_func_start sub_800E89C
sub_800E89C: @ 0x0800E89C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0800E9BC @ =gPlayer
	mov sb, r0
	movs r1, #0
	str r1, [sp]
	mov ip, r1
	ldr r0, _0800E9C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r7, r0
	ldr r2, _0800E9C4 @ =IWRAM_START + 0xC
	adds r2, r2, r7
	mov r8, r2
	ldr r0, [r6]
	mov sl, r0
	ldr r2, _0800E9C8 @ =IWRAM_START + 0x48
	adds r1, r7, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800E906
	ldr r5, [r6, #0x40]
	mov r0, sl
	ldrb r2, [r0, #5]
	lsls r2, r2, #0xb
	ldr r4, _0800E9CC @ =gSineTable
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, _0800E9D0 @ =gUnknown_03005590
	ldrh r1, [r6, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800E9D4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r6, #0x40]
	subs r5, r0, r5
	str r5, [sp]
_0800E906:
	ldr r2, _0800E9D8 @ =IWRAM_START + 0x4A
	adds r1, r7, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800E944
	ldr r5, [r6, #0x44]
	mov r0, sl
	ldrb r2, [r0, #6]
	lsls r2, r2, #0xb
	ldr r4, _0800E9CC @ =gSineTable
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, _0800E9D0 @ =gUnknown_03005590
	ldrh r1, [r6, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800E9D4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r6, #0x44]
	subs r5, r0, r5
	mov ip, r5
_0800E944:
	ldrb r1, [r6, #8]
	lsls r1, r1, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	mov r0, sl
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800E9DC @ =gCamera
	ldr r0, [r3]
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r0, [r6, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r0, r8
	strh r1, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r5, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	ldr r0, [r6, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r1, r8
	strh r2, [r1, #0x18]
	mov r2, sb
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800E9F0
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _0800E9F0
	ldr r0, [r2, #8]
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, _0800E9E0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800E9E4
	ldr r0, [r2, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	add r0, ip
	mov r1, sb
	str r0, [r1, #0xc]
	b _0800E9F0
	.align 2, 0
_0800E9BC: .4byte gPlayer
_0800E9C0: .4byte gCurTask
_0800E9C4: .4byte IWRAM_START + 0xC
_0800E9C8: .4byte IWRAM_START + 0x48
_0800E9CC: .4byte gSineTable
_0800E9D0: .4byte gUnknown_03005590
_0800E9D4: .4byte 0x000003FF
_0800E9D8: .4byte IWRAM_START + 0x4A
_0800E9DC: .4byte gCamera
_0800E9E0: .4byte gUnknown_03005424
_0800E9E4:
	mov r2, sb
	ldr r0, [r2, #0xc]
	ldr r1, _0800EA6C @ =0xFFFFFE00
	adds r0, r0, r1
	add r0, ip
	str r0, [r2, #0xc]
_0800E9F0:
	mov r2, sb
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	lsls r4, r4, #0x10
	cmp r0, #0
	bne _0800EA32
	asrs r1, r4, #0x10
	ldr r0, [r6, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	ldr r0, [r6, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r0, r8
	mov r3, sb
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800EA32
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	mov r2, sb
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
_0800EA32:
	asrs r0, r4, #0x10
	ldr r2, _0800EA70 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800EA5C
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800EA5C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800EA78
_0800EA5C:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _0800EA74 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EB12
	.align 2, 0
_0800EA6C: .4byte 0xFFFFFE00
_0800EA70: .4byte gCamera
_0800EA74: .4byte gCurTask
_0800EA78:
	ldr r2, _0800EAAC @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800EB06
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0800EAB0
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _0800EAB0
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EAC2
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EAC0
	.align 2, 0
_0800EAAC: .4byte gPlayer
_0800EAB0:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EAC2
	adds r0, r1, #0
	subs r0, #0x10
_0800EAC0:
	strh r0, [r2]
_0800EAC2:
	ldr r0, _0800EAE8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800EAF0
	ldr r1, _0800EAEC @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	mov r2, r8
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	mov r1, r8
	strh r0, [r1, #0x18]
	b _0800EB06
	.align 2, 0
_0800EAE8: .4byte gUnknown_03005424
_0800EAEC: .4byte gSineTable
_0800EAF0:
	ldr r1, _0800EB24 @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	mov r2, r8
	ldrh r0, [r2, #0x18]
	subs r0, r0, r1
	strh r0, [r2, #0x18]
_0800EB06:
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
_0800EB12:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB24: .4byte gSineTable

	thumb_func_start initSprite_Interactable079
initSprite_Interactable079: @ 0x0800EB28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0800EBE4 @ =sub_800EC58
	ldr r2, _0800EBE8 @ =0x00002010
	ldr r1, _0800EBEC @ =sub_800F19C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, _0800EBF0 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	movs r3, #0
	mov sl, r3
	movs r2, #0
	strh r5, [r1, #4]
	strh r6, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	mov r3, r8
	strb r3, [r1, #9]
	str r2, [r1, #0x40]
	str r2, [r1, #0x44]
	ldr r3, _0800EBF4 @ =IWRAM_START + 0x4C
	adds r0, r4, r3
	strh r2, [r0]
	subs r3, #4
	adds r0, r4, r3
	strh r2, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r2, [r0]
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r7, #0x18]
	ldr r0, [r1, #0x44]
	str r0, [r1, #0x50]
	str r0, [r1, #0x54]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r2]
	movs r0, #0x12
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0800EBF8 @ =IWRAM_START + 0x2C
	adds r4, r4, r0
	mov r1, sl
	strb r1, [r4]
	ldr r0, _0800EBFC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0800EC08
	ldr r1, _0800EC00 @ =gUnknown_080D53E4
	ldr r0, _0800EC04 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0800EC0A
	.align 2, 0
_0800EBE4: .4byte sub_800EC58
_0800EBE8: .4byte 0x00002010
_0800EBEC: .4byte sub_800F19C
_0800EBF0: .4byte IWRAM_START + 0xC
_0800EBF4: .4byte IWRAM_START + 0x4C
_0800EBF8: .4byte IWRAM_START + 0x2C
_0800EBFC: .4byte gGameMode
_0800EC00: .4byte gUnknown_080D53E4
_0800EC04: .4byte gCurrentLevel
_0800EC08:
	ldr r0, _0800EC54 @ =0x0000021D
_0800EC0A:
	strh r0, [r7, #0xa]
	movs r2, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC54: .4byte 0x0000021D

	thumb_func_start sub_800EC58
sub_800EC58: @ 0x0800EC58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800ED6C @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0800ED70 @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r7, [r4]
	ldr r5, _0800ED74 @ =gGameMode
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EC84
	adds r0, r4, #0
	bl sub_800F1B0
_0800EC84:
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800ED78 @ =gCamera
	ldr r0, [r3]
	lsrs r5, r1, #0x10
	mov sb, r5
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov sl, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r5, _0800ED7C @ =gPlayer
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800ECE2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r5, r8
	ldr r1, [r5]
	ldr r0, _0800ED80 @ =sub_800EDF8
	str r0, [r1, #8]
	movs r0, #0x1e
	strh r0, [r4, #0x3c]
_0800ECE2:
	ldr r1, _0800ED74 @ =gGameMode
	ldrb r0, [r1]
	cmp r0, #2
	bls _0800ED02
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800ED02
	movs r0, #0
	strh r0, [r4, #0x3c]
	mov r3, r8
	ldr r1, [r3]
	ldr r0, _0800ED84 @ =sub_800EFD0
	str r0, [r1, #8]
_0800ED02:
	mov r5, sb
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0800ED78 @ =gCamera
	ldr r2, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r2, r5
	cmp r1, r0
	bgt _0800ED38
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0800ED38
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0800ED38
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0800ED88
_0800ED38:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800ED5C
	movs r5, #0x18
	ldrsh r0, [r6, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0800ED5C
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800ED88
_0800ED5C:
	ldrb r0, [r4, #8]
	strb r0, [r7]
	ldr r0, _0800ED6C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EDE6
	.align 2, 0
_0800ED6C: .4byte gCurTask
_0800ED70: .4byte IWRAM_START + 0xC
_0800ED74: .4byte gGameMode
_0800ED78: .4byte gCamera
_0800ED7C: .4byte gPlayer
_0800ED80: .4byte sub_800EDF8
_0800ED84: .4byte sub_800EFD0
_0800ED88:
	ldr r2, _0800EDB0 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800EDB4
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800EDB4
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EDC6
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EDC4
	.align 2, 0
_0800EDB0: .4byte gPlayer
_0800EDB4:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EDC6
	adds r0, r1, #0
	subs r0, #0x10
_0800EDC4:
	strh r0, [r2]
_0800EDC6:
	ldr r1, _0800EDF4 @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800EDE6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EDF4: .4byte gSineTable

	thumb_func_start sub_800EDF8
sub_800EDF8: @ 0x0800EDF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0800EE98 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0800EE9C @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r7, [r4]
	ldr r5, _0800EEA0 @ =gGameMode
	mov r8, r5
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EE24
	adds r0, r4, #0
	bl sub_800F1B0
_0800EE24:
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800EEA4 @ =gCamera
	ldr r0, [r3]
	lsrs r5, r1, #0x10
	mov sb, r5
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov sl, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r5, _0800EEA8 @ =gPlayer
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800EE76
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
_0800EE76:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EEB0
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800EEB0
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _0800EE98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800EEAC @ =sub_800EFD0
	str r0, [r1, #8]
	b _0800EEE6
	.align 2, 0
_0800EE98: .4byte gCurTask
_0800EE9C: .4byte IWRAM_START + 0xC
_0800EEA0: .4byte gGameMode
_0800EEA4: .4byte gCamera
_0800EEA8: .4byte gPlayer
_0800EEAC: .4byte sub_800EFD0
_0800EEB0:
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0800EEE6
	strh r0, [r4, #0x3c]
	ldr r0, _0800EF50 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800EF54 @ =sub_800EFD0
	str r0, [r1, #8]
	ldr r0, _0800EF58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800EEE6
	bl sub_8019224
	movs r2, #1
	strb r2, [r0]
	ldrh r1, [r4, #4]
	strb r1, [r0, #1]
	ldrh r1, [r4, #6]
	strb r1, [r0, #2]
	ldrb r1, [r4, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
_0800EEE6:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0800EF5C @ =gCamera
	ldr r2, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r2, r5
	cmp r1, r0
	bgt _0800EF1C
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0800EF1C
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0800EF1C
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0800EF60
_0800EF1C:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800EF40
	movs r5, #0x18
	ldrsh r0, [r6, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0800EF40
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800EF60
_0800EF40:
	ldrb r0, [r4, #8]
	strb r0, [r7]
	ldr r0, _0800EF50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EFBE
	.align 2, 0
_0800EF50: .4byte gCurTask
_0800EF54: .4byte sub_800EFD0
_0800EF58: .4byte gGameMode
_0800EF5C: .4byte gCamera
_0800EF60:
	ldr r2, _0800EF88 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800EF8C
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800EF8C
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EF9E
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EF9C
	.align 2, 0
_0800EF88: .4byte gPlayer
_0800EF8C:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EF9E
	adds r0, r1, #0
	subs r0, #0x10
_0800EF9C:
	strh r0, [r2]
_0800EF9E:
	ldr r1, _0800EFCC @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800EFBE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EFCC: .4byte gSineTable

	thumb_func_start sub_800EFD0
sub_800EFD0: @ 0x0800EFD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800F048 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0xc
	adds r6, r4, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r7, _0800F04C @ =gGameMode
	ldrb r0, [r7]
	cmp r0, #2
	bls _0800EFF8
	adds r0, r5, #0
	bl sub_800F1B0
_0800EFF8:
	ldr r2, _0800F050 @ =IWRAM_START + 0x4A
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	movs r4, #0
	ldrsh r1, [r1, r4]
	ldr r0, [r5, #0x44]
	adds r0, r0, r1
	str r0, [r5, #0x44]
	ldrb r2, [r5, #8]
	lsls r2, r2, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldrh r1, [r5, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _0800F054 @ =gCamera
	ldr r0, [r1]
	lsrs r4, r2, #0x10
	mov ip, r4
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldrb r0, [r7]
	cmp r0, #2
	bls _0800F058
	ldr r0, [r1, #4]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x54]
	b _0800F062
	.align 2, 0
_0800F048: .4byte gCurTask
_0800F04C: .4byte gGameMode
_0800F050: .4byte IWRAM_START + 0x4A
_0800F054: .4byte gCamera
_0800F058:
	ldr r0, [r1, #4]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x44]
_0800F062:
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	adds r7, r2, #0
	ldrh r0, [r5, #0x3c]
	adds r3, r0, #1
	strh r3, [r5, #0x3c]
	ldr r1, _0800F0A0 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0800F0C6
	ldr r0, [r4, #0x3c]
	cmp r0, r6
	bne _0800F0C6
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bls _0800F0A4
	movs r0, #2
	orrs r2, r0
	subs r0, #0xb
	ands r2, r0
	str r2, [r4, #0x20]
	adds r0, r5, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	b _0800F0C6
	.align 2, 0
_0800F0A0: .4byte gPlayer
_0800F0A4:
	adds r0, r5, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0800F0C6:
	ldrh r0, [r5, #0x3c]
	cmp r0, #0x1f
	bhi _0800F0F8
	mov r0, ip
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	asrs r2, r7, #0x10
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800F0F8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0800F0F8:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800F11C
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800F11C
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800F130
_0800F11C:
	ldrb r0, [r5, #8]
	mov r4, r8
	strb r0, [r4]
	ldr r0, _0800F12C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800F18E
	.align 2, 0
_0800F12C: .4byte gCurTask
_0800F130:
	ldr r2, _0800F158 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F15C
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800F15C
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800F16E
	adds r0, r3, #0
	adds r0, #0x10
	b _0800F16C
	.align 2, 0
_0800F158: .4byte gPlayer
_0800F15C:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800F16E
	adds r0, r1, #0
	subs r0, #0x10
_0800F16C:
	strh r0, [r2]
_0800F16E:
	ldr r1, _0800F198 @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800F18E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F198: .4byte gSineTable

	thumb_func_start sub_800F19C
sub_800F19C: @ 0x0800F19C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800F1B0
sub_800F1B0: @ 0x0800F1B0
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x54]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x50]
	bx lr
	.align 2, 0

	thumb_func_start initSprite_Interactable081
initSprite_Interactable081: @ 0x0800F1BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800F230 @ =sub_800F38C
	ldr r2, _0800F234 @ =0x00002010
	ldr r1, _0800F238 @ =sub_800F964
	str r1, [sp]
	movs r1, #0x68
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0xc
	adds r6, r2, r0
	movs r3, #0
	mov r1, sb
	strh r1, [r5, #4]
	mov r0, r8
	strh r0, [r5, #6]
	str r7, [r5]
	ldrb r0, [r7]
	strb r0, [r5, #8]
	strb r4, [r5, #9]
	str r3, [r5, #0x40]
	str r3, [r5, #0x44]
	ldr r1, _0800F23C @ =IWRAM_START + 0x4C
	adds r0, r2, r1
	strh r3, [r0]
	ldrb r0, [r7, #5]
	ldrb r1, [r7, #6]
	cmp r0, r1
	bls _0800F260
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800F244
	ldr r1, _0800F240 @ =IWRAM_START + 0x48
	adds r0, r2, r1
	movs r1, #4
	strh r1, [r0]
	strh r3, [r5, #0x3c]
	b _0800F250
	.align 2, 0
_0800F230: .4byte sub_800F38C
_0800F234: .4byte 0x00002010
_0800F238: .4byte sub_800F964
_0800F23C: .4byte IWRAM_START + 0x4C
_0800F240: .4byte IWRAM_START + 0x48
_0800F244:
	ldr r0, _0800F258 @ =IWRAM_START + 0x48
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r5, #0x3c]
_0800F250:
	ldr r1, _0800F25C @ =IWRAM_START + 0x4A
	adds r0, r2, r1
	strh r3, [r0]
	b _0800F296
	.align 2, 0
_0800F258: .4byte IWRAM_START + 0x48
_0800F25C: .4byte IWRAM_START + 0x4A
_0800F260:
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800F284
	ldr r1, _0800F27C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r3, [r0]
	ldr r0, _0800F280 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	strh r3, [r5, #0x3c]
	b _0800F296
	.align 2, 0
_0800F27C: .4byte IWRAM_START + 0x48
_0800F280: .4byte IWRAM_START + 0x4A
_0800F284:
	ldr r1, _0800F37C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r3, [r0]
	ldr r0, _0800F380 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r5, #0x3c]
_0800F296:
	movs r1, #0
	mov r0, sb
	lsls r2, r0, #8
	mov r0, r8
	lsls r0, r0, #8
	mov ip, r0
	ldr r0, _0800F384 @ =gUnknown_080D5430
	mov sb, r0
	ldr r0, _0800F388 @ =gCurrentLevel
	mov r8, r0
	movs r0, #0x20
	adds r0, r0, r6
	mov sl, r0
	adds r0, r6, #0
	adds r0, #0x21
	str r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #8]
	adds r0, #3
	str r0, [sp, #0xc]
	adds r4, r5, #0
	adds r4, #0x54
	adds r3, r5, #0
	adds r3, #0x50
_0800F2C6:
	ldr r0, [r5, #0x40]
	str r0, [r3]
	ldr r0, [r5, #0x44]
	str r0, [r4]
	adds r4, #8
	adds r3, #8
	adds r1, #1
	cmp r1, #2
	bls _0800F2C6
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	add r0, ip
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	bl VramMalloc
	str r0, [r6, #4]
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r1, sb
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r1, sb
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #0xff
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0x10
	ldr r1, [sp, #8]
	strb r0, [r1]
	ldr r0, [sp, #0xc]
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F37C: .4byte IWRAM_START + 0x48
_0800F380: .4byte IWRAM_START + 0x4A
_0800F384: .4byte gUnknown_080D5430
_0800F388: .4byte gCurrentLevel

	thumb_func_start sub_800F38C
sub_800F38C: @ 0x0800F38C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r6, _0800F4A4 @ =gPlayer
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, _0800F4A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _0800F4AC @ =IWRAM_START + 0xC
	adds r2, r2, r7
	mov sl, r2
	ldr r3, [r0]
	str r3, [sp, #4]
	ldr r4, _0800F4B0 @ =gGameMode
	mov sb, r4
	ldrb r0, [r4]
	cmp r0, #2
	bls _0800F3CA
	mov r0, r8
	bl sub_800F990
_0800F3CA:
	ldr r5, _0800F4B4 @ =IWRAM_START + 0x48
	adds r1, r7, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800F40E
	mov r3, r8
	ldr r3, [r3, #0x40]
	mov ip, r3
	ldr r4, [sp, #4]
	ldrb r2, [r4, #5]
	lsls r2, r2, #0xb
	ldr r4, _0800F4B8 @ =gSineTable
	adds r3, r0, #0
	ldr r0, _0800F4BC @ =gUnknown_03005590
	mov r5, r8
	ldrh r1, [r5, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800F4C0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r5, #0x40]
	mov r2, ip
	subs r2, r0, r2
	str r2, [sp, #8]
_0800F40E:
	ldr r3, _0800F4C4 @ =IWRAM_START + 0x4A
	adds r1, r7, r3
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0800F450
	mov r7, r8
	ldr r5, [r7, #0x44]
	ldr r0, [sp, #4]
	ldrb r2, [r0, #6]
	lsls r2, r2, #0xb
	ldr r4, _0800F4B8 @ =gSineTable
	movs r7, #0
	ldrsh r3, [r1, r7]
	ldr r0, _0800F4BC @ =gUnknown_03005590
	mov r7, r8
	ldrh r1, [r7, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800F4C0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r7, #0x44]
	subs r5, r0, r5
	str r5, [sp, #0xc]
_0800F450:
	mov r2, r8
	ldrb r0, [r2, #8]
	lsls r0, r0, #3
	ldrh r1, [r2, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r4, [sp, #4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	ldrh r1, [r2, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r5, sb
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800F4CC
	ldr r2, _0800F4C8 @ =gCamera
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	subs r1, r1, r0
	mov r7, r8
	ldr r0, [r7, #0x58]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r0, sl
	strh r1, [r0, #0x16]
	ldr r0, [r2, #4]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r7, #0x5c]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r4, sl
	strh r1, [r4, #0x18]
	b _0800F4F2
	.align 2, 0
_0800F4A4: .4byte gPlayer
_0800F4A8: .4byte gCurTask
_0800F4AC: .4byte IWRAM_START + 0xC
_0800F4B0: .4byte gGameMode
_0800F4B4: .4byte IWRAM_START + 0x48
_0800F4B8: .4byte gSineTable
_0800F4BC: .4byte gUnknown_03005590
_0800F4C0: .4byte 0x000003FF
_0800F4C4: .4byte IWRAM_START + 0x4A
_0800F4C8: .4byte gCamera
_0800F4CC:
	ldr r2, _0800F52C @ =gCamera
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	subs r1, r1, r0
	mov r5, r8
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r7, sl
	strh r1, [r7, #0x16]
	ldr r0, [r2, #4]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r7, #0x18]
_0800F4F2:
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0800F502
	b _0800F614
_0800F502:
	ldr r0, [r6, #0x3c]
	cmp r0, sl
	beq _0800F50A
	b _0800F614
_0800F50A:
	ldr r0, [r6, #8]
	ldr r1, [sp, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r0, _0800F530 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800F534
	ldr r0, [r6, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r3, [sp, #0xc]
	adds r0, r0, r3
	b _0800F53E
	.align 2, 0
_0800F52C: .4byte gCamera
_0800F530: .4byte gUnknown_03005424
_0800F534:
	ldr r0, [r6, #0xc]
	ldr r4, _0800F7E4 @ =0xFFFFFE00
	adds r0, r0, r4
	ldr r5, [sp, #0xc]
	adds r0, r0, r5
_0800F53E:
	str r0, [r6, #0xc]
	ldr r4, _0800F7E8 @ =gPlayer
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	adds r1, r1, r2
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r7, _0800F7EC @ =sub_801EC3C
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F584
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
	str r0, [r6, #0x3c]
_0800F584:
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	adds r4, r6, #0
	adds r4, #0x38
	ldrb r2, [r4]
	ldr r5, _0800F7F0 @ =sub_801EB44
	str r5, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F5B0
	lsls r1, r0, #8
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
_0800F5B0:
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldrb r2, [r4]
	movs r3, #8
	rsbs r3, r3, #0
	str r5, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F5D8
	lsls r1, r0, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
_0800F5D8:
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	movs r2, #0x16
	ldrsb r2, [r6, r2]
	subs r1, r1, r2
	ldrb r2, [r4]
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F614
	lsls r1, r0, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
	str r0, [r6, #0x3c]
_0800F614:
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800F622
	b _0800F8FE
_0800F622:
	str r1, [sp, #0x10]
	mov r4, sl
	adds r4, #0x2d
	ldrb r0, [r4]
	subs r0, #3
	strb r0, [r4]
	ldr r7, [sp, #0x14]
	asrs r1, r7, #0x10
	mov r2, r8
	ldr r0, [r2, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r3, [sp, #0x18]
	asrs r2, r3, #0x10
	mov r5, r8
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r0, sl
	adds r3, r6, #0
	bl sub_800CCB8
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0xa
	mov r7, sb
	ands r0, r7
	str r4, [sp, #0x20]
	cmp r0, #0
	bne _0800F660
	b _0800F85C
_0800F660:
	ldr r1, _0800F7E8 @ =gPlayer
	adds r0, r1, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0800F688
	adds r0, r1, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x63
	ble _0800F688
	cmp r0, #0x69
	bgt _0800F688
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #4
	strb r0, [r1]
_0800F688:
	mov r3, sb
	lsls r2, r3, #0x18
	asrs r1, r2, #0x10
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	str r2, [sp, #0x1c]
	cmp r0, #0
	beq _0800F6F8
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	cmp r0, #0
	bgt _0800F6AC
	movs r0, #0
	strh r0, [r6, #0x12]
_0800F6AC:
	ldr r0, _0800F7F4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800F6CC
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r5, sl
	str r5, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
_0800F6CC:
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0800F7EC @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F6F8
	ldr r7, [sp, #0xc]
	cmp r7, #0
	ble _0800F6F8
	bl sub_800F978
_0800F6F8:
	movs r0, #0x80
	lsls r0, r0, #9
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	bne _0800F706
	b _0800F85C
_0800F706:
	ldr r0, _0800F7F4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0800F718
	b _0800F82C
_0800F718:
	ldr r2, [sp, #0x1c]
	asrs r5, r2, #0x10
	ldr r0, [r6, #0xc]
	subs r0, r0, r5
	str r0, [r6, #0xc]
	mov r4, sl
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r0, #0x10
	strb r0, [r4]
	mov r7, sl
	adds r7, #0x2e
	ldrb r0, [r7]
	subs r0, #0x10
	strb r0, [r7]
	ldr r3, [sp, #0x14]
	asrs r1, r3, #0x10
	mov r2, r8
	ldr r0, [r2, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r3, [sp, #0x18]
	asrs r2, r3, #0x10
	mov r3, r8
	ldr r0, [r3, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r0, sl
	adds r3, r6, #0
	bl sub_800CCB8
	adds r2, r0, #0
	ldrb r0, [r4]
	subs r0, #0x10
	strb r0, [r4]
	ldrb r0, [r7]
	adds r0, #0x10
	strb r0, [r7]
	ldr r0, [r6, #0xc]
	adds r0, r0, r5
	str r0, [r6, #0xc]
	ldr r4, [sp, #0x10]
	str r4, [r6, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0800F7AA
	movs r5, #0xff
	lsls r5, r5, #8
	adds r1, r5, #0
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _0800F794
	ldr r0, [r6, #8]
	ldr r7, _0800F7F8 @ =0xFFFFF000
	adds r0, r0, r7
	adds r0, r0, r1
	str r0, [r6, #8]
_0800F794:
	cmp r1, #0
	ble _0800F7A4
	ldr r0, [r6, #8]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	adds r0, r0, r1
	str r0, [r6, #8]
_0800F7A4:
	movs r4, #0
	strh r4, [r6, #0x10]
	strh r4, [r6, #0x14]
_0800F7AA:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800F820
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _0800F7EC @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F80C
	ldr r5, [sp, #0xc]
	cmp r5, #0
	bge _0800F7FC
	bl sub_800F978
	b _0800F85C
	.align 2, 0
_0800F7E4: .4byte 0xFFFFFE00
_0800F7E8: .4byte gPlayer
_0800F7EC: .4byte sub_801EC3C
_0800F7F0: .4byte sub_801EB44
_0800F7F4: .4byte gUnknown_03005424
_0800F7F8: .4byte 0xFFFFF000
_0800F7FC:
	ldr r7, [sp, #0x1c]
	asrs r0, r7, #0x10
	ldr r1, [r6, #0xc]
	subs r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x14]
	b _0800F85C
_0800F80C:
	ldr r1, [sp, #0x1c]
	asrs r0, r1, #0x10
	ldr r1, [r6, #0xc]
	subs r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x12]
	b _0800F85C
_0800F820:
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _0800F85C
_0800F82C:
	strh r0, [r6, #0x12]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _0800F93C @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F85C
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bge _0800F85C
	bl sub_800F978
_0800F85C:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r4, sb
	ands r0, r4
	cmp r0, #0
	beq _0800F8F6
	ldr r2, [r6, #0x20]
	movs r0, #8
	ands r2, r0
	cmp r2, #0
	bne _0800F8F6
	ldr r0, [r6, #0x3c]
	cmp r0, sl
	beq _0800F8F6
	movs r5, #0xff
	lsls r5, r5, #8
	adds r1, r5, #0
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	strh r2, [r6, #0x10]
	strh r2, [r6, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r4
	cmp r0, #0
	beq _0800F8C2
	asrs r0, r1, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _0800F940 @ =sub_801EB44
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F8C2
	bl sub_800F978
_0800F8C2:
	movs r0, #0x80
	lsls r0, r0, #0xc
	mov r7, sb
	ands r0, r7
	cmp r0, #0
	beq _0800F8F6
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0800F940 @ =sub_801EB44
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F8F6
	bl sub_800F978
_0800F8F6:
	ldr r1, [sp, #0x20]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_0800F8FE:
	ldr r2, [sp, #0x14]
	asrs r0, r2, #0x10
	ldr r2, _0800F944 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800F92A
	ldr r3, [sp, #0x18]
	asrs r0, r3, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800F92A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800F94C
_0800F92A:
	mov r4, r8
	ldrb r0, [r4, #8]
	ldr r5, [sp, #4]
	strb r0, [r5]
	ldr r0, _0800F948 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800F952
	.align 2, 0
_0800F93C: .4byte sub_801EC3C
_0800F940: .4byte sub_801EB44
_0800F944: .4byte gCamera
_0800F948: .4byte gCurTask
_0800F94C:
	mov r0, sl
	bl sub_80051E8
_0800F952:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800F964
sub_800F964: @ 0x0800F964
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800F978
sub_800F978: @ 0x0800F978
	ldr r2, _0800F98C @ =gPlayer
	movs r0, #0
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2, #0x20]
	bx lr
	.align 2, 0
_0800F98C: .4byte gPlayer

	thumb_func_start sub_800F990
sub_800F990: @ 0x0800F990
	ldr r1, [r0, #0x58]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x5c]
	str r1, [r0, #0x64]
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x58]
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x5c]
	ldr r1, [r0, #0x40]
	str r1, [r0, #0x50]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0

	thumb_func_start sub_800F9AC
sub_800F9AC: @ 0x0800F9AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	adds r4, #1
	strb r4, [r6]
	adds r5, r0, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	subs r4, #1
	strb r4, [r5]
	bl sub_800CCB8
	ldrb r1, [r6]
	subs r1, #1
	strb r1, [r6]
	ldrb r1, [r5]
	adds r1, #1
	strb r1, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start initSprite_Interactable_Ramp
initSprite_Interactable_Ramp: @ 0x0800F9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0800FAD4 @ =sub_800FAF4
	ldr r2, _0800FAD8 @ =0x00002010
	ldr r1, _0800FADC @ =sub_800FE24
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, _0800FAE0 @ =IWRAM_START + 0xC
	adds r7, r3, r0
	movs r2, #0
	mov sb, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r0, r8
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r2, [r2, #3]
	movs r0, #3
	ands r0, r2
	adds r4, r0, #0
	strh r4, [r1, #0x3c]
	movs r0, #0x14
	str r3, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _0800FAE4 @ =0x0000021F
	strh r0, [r7, #0xa]
	ldr r0, _0800FAE8 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	ldr r3, [sp, #4]
	cmp r0, #5
	bne _0800FA70
	movs r0, #0x98
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
_0800FA70:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r2, _0800FAEC @ =IWRAM_START + 0x2C
	adds r1, r3, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sb
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #1
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0800FAF0 @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r2, #4
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0800FABE
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0800FABE:
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FAD4: .4byte sub_800FAF4
_0800FAD8: .4byte 0x00002010
_0800FADC: .4byte sub_800FE24
_0800FAE0: .4byte IWRAM_START + 0xC
_0800FAE4: .4byte 0x0000021F
_0800FAE8: .4byte gCurrentLevel
_0800FAEC: .4byte IWRAM_START + 0x2C
_0800FAF0: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_800FAF4
sub_800FAF4: @ 0x0800FAF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r6, _0800FBE4 @ =gPlayer
	ldr r0, _0800FBE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _0800FBEC @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp]
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _0800FBF0 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, r8
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	str r2, [sp, #8]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r4, r8
	strh r1, [r4, #0x18]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800FB62
	b _0800FDC2
_0800FB62:
	movs r5, #0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0800FB74
	ldr r0, [r6, #0x3c]
	cmp r0, r8
	bne _0800FB74
	movs r5, #1
_0800FB74:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #8]
	lsls r4, r2, #0x10
	asrs r2, r4, #0x10
	mov r0, r8
	adds r3, r6, #0
	bl sub_800CDBC
	adds r1, r0, #0
	cmp r1, #0
	bne _0800FB90
	b _0800FD36
_0800FB90:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	mov r3, sb
	ldrh r5, [r3, #0x3c]
	cmp r0, #0
	beq _0800FBAE
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FBAE
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0800FBCA
_0800FBAE:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0800FBF4
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FBC2
	b _0800FDC2
_0800FBC2:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bgt _0800FBF4
_0800FBCA:
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	b _0800FDC2
	.align 2, 0
_0800FBE4: .4byte gPlayer
_0800FBE8: .4byte gCurTask
_0800FBEC: .4byte IWRAM_START + 0xC
_0800FBF0: .4byte gCamera
_0800FBF4:
	movs r0, #2
	mov sl, r0
	ands r0, r5
	cmp r0, #0
	beq _0800FC00
	b _0800FDC2
_0800FC00:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r2
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r7, r0, r1
	cmp r7, #0
	bgt _0800FC26
	b _0800FD2A
_0800FC26:
	cmp r7, r2
	ble _0800FC66
	ldr r0, [r6, #0x20]
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	bne _0800FC5A
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FC5A
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r0, sb
	ldrh r1, [r0, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
_0800FC5A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	b _0800FD24
_0800FC66:
	ldr r5, [r6, #0xc]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	asrs r1, r4, #0x10
	subs r0, r0, r1
	str r0, [sp, #0xc]
	mov r0, r8
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r7, #8
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl __divsi3
	muls r0, r4, r0
	asrs r3, r0, #8
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, r3
	blt _0800FD1A
	ldr r0, [r6, #0x20]
	mov r4, sl
	ands r0, r4
	cmp r0, #0
	bne _0800FCF8
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FCF8
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0800FCDC @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0800FCF8
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	cmp r7, r0
	bge _0800FCE0
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	b _0800FD98
	.align 2, 0
_0800FCDC: .4byte gPlayerControls
_0800FCE0:
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r3, sb
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	b _0800FD98
_0800FCF8:
	ldr r4, [sp, #0xc]
	subs r0, r3, r4
	lsls r0, r0, #8
	adds r0, r5, r0
	str r0, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r0, r8
	b _0800FDC0
_0800FD1A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, sl
_0800FD24:
	orrs r0, r1
	str r0, [r6, #0x20]
	b _0800FDC2
_0800FD2A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	b _0800FDC2
_0800FD36:
	cmp r5, #0
	beq _0800FDC2
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #2
	ands r0, r1
	adds r5, r1, #0
	cmp r0, #0
	beq _0800FD5E
	ldr r0, [r6, #8]
	asrs r3, r0, #8
	mov r4, r8
	movs r1, #0x16
	ldrsh r2, [r4, r1]
	adds r4, r0, #0
	cmp r3, r2
	blt _0800FD6E
	cmp r3, r2
	bgt _0800FDB4
	b _0800FDA0
_0800FD5E:
	ldr r0, [r6, #8]
	asrs r2, r0, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r1, [r3, r4]
	adds r4, r0, #0
	cmp r2, r1
	ble _0800FDA8
_0800FD6E:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0800FDC2
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FDC2
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
_0800FD98:
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
	b _0800FDC2
_0800FDA0:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _0800FDC2
_0800FDA8:
	asrs r1, r4, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bge _0800FDC2
_0800FDB4:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
_0800FDC0:
	str r0, [r6, #0x3c]
_0800FDC2:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0800FE04 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800FDF2
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800FDF2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800FE0C
_0800FDF2:
	mov r4, sb
	ldrb r0, [r4, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0800FE08 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800FE12
	.align 2, 0
_0800FE04: .4byte gCamera
_0800FE08: .4byte gCurTask
_0800FE0C:
	mov r0, r8
	bl sub_80051E8
_0800FE12:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800FE24
sub_800FE24: @ 0x0800FE24
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800FE38
sub_800FE38: @ 0x0800FE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0800FE64 @ =gPlayer
	mov ip, r0
	ldr r2, _0800FE68 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FE6C
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r7, r0, r1
	b _0800FE78
	.align 2, 0
_0800FE64: .4byte gPlayer
_0800FE68: .4byte gUnknown_03005424
_0800FE6C:
	mov r2, ip
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r7, r0, r1
_0800FE78:
	ldr r4, _0800FF3C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov sl, r0
	ldr r3, _0800FF40 @ =IWRAM_START + 0x8
	adds r0, r1, r3
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldr r6, _0800FF44 @ =IWRAM_START+4
	adds r0, r1, r6
	ldrh r2, [r0]
	subs r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]
	adds r6, #5
	adds r1, r1, r6
	ldrb r5, [r1]
	ldr r1, [sp, #8]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r2, sl
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	mov r3, ip
	ldr r1, [r3, #0x20]
	adds r0, r1, #0
	movs r6, #0x80
	ands r0, r6
	mov sb, r1
	cmp r0, #0
	beq _0800FED2
	b _080100D6
_0800FED2:
	ldr r0, [sp]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r0, r2, #3
	adds r4, r1, r0
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r6, r0, #8
	str r3, [sp, #0xc]
	mov r8, r2
	adds r3, r0, #0
	cmp r4, r6
	ble _0800FEF4
	b _080100C4
_0800FEF4:
	mov r2, sl
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r4, r1, #0
	cmp r0, r6
	bge _0800FF04
	b _080100C4
_0800FF04:
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r1, r2, r0
	cmp r1, r7
	ble _0800FF1A
	b _080100C4
_0800FF1A:
	mov r6, sl
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r7
	bge _0800FF28
	b _080100C4
_0800FF28:
	movs r6, #0
	ldr r0, _0800FF48 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FF4C
	cmp r7, r2
	blt _0800FF52
	b _0800FF50
	.align 2, 0
_0800FF3C: .4byte gCurTask
_0800FF40: .4byte IWRAM_START + 0x8
_0800FF44: .4byte IWRAM_START+4
_0800FF48: .4byte gUnknown_03005424
_0800FF4C:
	cmp r7, r2
	bgt _0800FF52
_0800FF50:
	movs r6, #1
_0800FF52:
	mov r1, ip
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0800FF5E
	b _080100B0
_0800FF5E:
	cmp r6, #0
	bne _0800FF64
	b _080100B0
_0800FF64:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0800FF6E
	b _080100B0
_0800FF6E:
	movs r0, #0x80
	lsls r0, r0, #0x11
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	beq _08010060
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0800FFF0
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0800FFE8
	asrs r2, r3, #8
	ldr r1, [sp, #0xc]
	asrs r0, r1, #0x10
	mov r6, r8
	lsls r1, r6, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	blt _0800FFB8
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0800FFC8 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0800FFE8
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FFE8
_0800FFB8:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0800FFCC
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0800FFD2
	.align 2, 0
_0800FFC8: .4byte gPlayerControls
_0800FFCC:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0800FFD2:
	strb r0, [r1]
	ldr r1, _0800FFE0 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0800FFE4 @ =IWRAM_START + 0x9
	adds r1, r1, r2
	b _0801004E
	.align 2, 0
_0800FFE0: .4byte gCurTask
_0800FFE4: .4byte IWRAM_START + 0x9
_0800FFE8:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080100B0
_0800FFF0:
	movs r0, #1
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	bne _080100B0
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _08010028
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _08010038 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080100B0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080100B0
_08010028:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0801003C
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _08010042
	.align 2, 0
_08010038: .4byte gPlayerControls
_0801003C:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_08010042:
	strb r0, [r1]
	ldr r6, _08010058 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	ldr r0, _0801005C @ =IWRAM_START + 0x9
	adds r1, r1, r0
_0801004E:
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	b _080100B0
	.align 2, 0
_08010058: .4byte gCurTask
_0801005C: .4byte IWRAM_START + 0x9
_08010060:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08010080
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	blt _08010096
	b _080100B0
_08010080:
	asrs r2, r3, #8
	ldr r6, [sp]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	ble _080100B0
_08010096:
	mov r2, ip
	adds r2, #0x6d
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x6e
	strb r1, [r0]
	movs r1, #1
	ands r5, r1
	cmp r5, #0
	beq _080100B0
	strb r1, [r0]
_080100B0:
	ldr r6, _080100BC @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	ldr r0, _080100C0 @ =IWRAM_START + 0x9
	adds r1, r1, r0
	b _080100CE
	.align 2, 0
_080100BC: .4byte gCurTask
_080100C0: .4byte IWRAM_START + 0x9
_080100C4:
	ldr r1, _08010138 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0801013C @ =IWRAM_START + 0x9
	adds r1, r1, r2
_080100CE:
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
_080100D6:
	ldr r2, _08010140 @ =gCamera
	ldr r0, [r2]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08010118
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08010118
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08010128
_08010118:
	mov r2, sp
	ldrb r3, [r2, #8]
	mov r2, sl
	strb r3, [r2]
	ldr r6, _08010138 @ =gCurTask
	ldr r0, [r6]
	bl TaskDestroy
_08010128:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010138: .4byte gCurTask
_0801013C: .4byte IWRAM_START + 0x9
_08010140: .4byte gCamera

	thumb_func_start sub_8010144
sub_8010144: @ 0x08010144
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08010248 @ =gPlayer
	mov ip, r0
	ldr r4, _0801024C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	ldr r2, _08010250 @ =IWRAM_START + 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldr r3, _08010254 @ =IWRAM_START+4
	adds r0, r1, r3
	ldrh r2, [r0]
	ldr r7, _08010258 @ =IWRAM_START + 0x6
	adds r0, r1, r7
	ldrh r3, [r0]
	ldr r0, _0801025C @ =IWRAM_START + 0x9
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, r8
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r7, ip
	ldr r3, [r7, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080101AA
	b _080102C8
_080101AA:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r6, r0, r1
	ldr r0, [r7, #8]
	asrs r4, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #4]
	cmp r6, r4
	ble _080101C8
	b _080102C8
_080101C8:
	mov r2, r8
	ldrb r0, [r2, #5]
	lsls r7, r0, #3
	str r7, [sp, #0x10]
	adds r1, r6, r7
	str r0, [sp, #0xc]
	cmp r1, r4
	blt _080102C8
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	ldrsb r1, [r2, r1]
	lsls r1, r1, #3
	adds r2, r0, r1
	mov r7, ip
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080102C8
	mov r7, r8
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080102C8
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	beq _080102C8
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0801026C
	ands r3, r1
	cmp r3, #0
	beq _08010264
	ldr r1, [sp, #0x10]
	asrs r0, r1, #1
	adds r0, r6, r0
	cmp r4, r0
	blt _08010238
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _08010260 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08010264
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08010264
_08010238:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080102C0
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _080102C6
	.align 2, 0
_08010248: .4byte gPlayer
_0801024C: .4byte gCurTask
_08010250: .4byte IWRAM_START + 0x8
_08010254: .4byte IWRAM_START+4
_08010258: .4byte IWRAM_START + 0x6
_0801025C: .4byte IWRAM_START + 0x9
_08010260: .4byte gPlayerControls
_08010264:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080102C8
_0801026C:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080102C8
	ldr r3, [sp, #4]
	asrs r2, r3, #8
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	lsls r1, r7, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _080102AA
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _080102BC @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080102C8
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080102C8
_080102AA:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080102C0
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _080102C6
	.align 2, 0
_080102BC: .4byte gPlayerControls
_080102C0:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_080102C6:
	strb r0, [r1]
_080102C8:
	ldr r2, _0801032C @ =gCamera
	ldr r0, [r2]
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r7, sb
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0801030A
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0801030A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0801031A
_0801030A:
	mov r2, sp
	ldrb r3, [r2]
	mov r2, r8
	strb r3, [r2]
	ldr r7, _08010330 @ =gCurTask
	ldr r0, [r7]
	bl TaskDestroy
_0801031A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801032C: .4byte gCamera
_08010330: .4byte gCurTask

	thumb_func_start sub_8010334
sub_8010334: @ 0x08010334
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080103A4 @ =sub_800FE38
	ldr r2, _080103A8 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _080103AC @ =IWRAM_START + 0x9
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _080103B0 @ =IWRAM_START + 0x8
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080103A4: .4byte sub_800FE38
_080103A8: .4byte 0x00002010
_080103AC: .4byte IWRAM_START + 0x9
_080103B0: .4byte IWRAM_START + 0x8

	thumb_func_start sub_80103B4
sub_80103B4: @ 0x080103B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010424 @ =sub_8010144
	ldr r2, _08010428 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _0801042C @ =IWRAM_START + 0x9
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _08010430 @ =IWRAM_START + 0x8
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010424: .4byte sub_8010144
_08010428: .4byte 0x00002010
_0801042C: .4byte IWRAM_START + 0x9
_08010430: .4byte IWRAM_START + 0x8

	thumb_func_start sub_8010434
sub_8010434: @ 0x08010434
	push {r4, lr}
	sub sp, #4
	ldr r0, _0801045C @ =sub_8010464
	ldr r2, _08010460 @ =0x00002010
	movs r4, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801045C: .4byte sub_8010464
_08010460: .4byte 0x00002010

	thumb_func_start sub_8010464
sub_8010464: @ 0x08010464
	push {r4, lr}
	ldr r4, _08010494 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0801048C
	movs r0, #0x72
	bl m4aSongNumStart
	ldr r0, [r4]
	bl TaskDestroy
_0801048C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010494: .4byte gCurTask

	thumb_func_start initSprite_Interactable_GrindRail_StartAir
initSprite_Interactable_GrindRail_StartAir: @ 0x08010498
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_End_ForcedJump
initSprite_Interactable_GrindRail_End_ForcedJump: @ 0x080104B8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_Start
initSprite_Interactable_GrindRail_Start: @ 0x080104D8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_EndGround
initSprite_Interactable_GrindRail_EndGround: @ 0x080104F8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_EndAir
initSprite_Interactable_GrindRail_EndAir: @ 0x08010518
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_EndAir_Left
initSprite_Interactable_GrindRail_EndAir_Left: @ 0x08010538
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_EndAlternate
initSprite_Interactable_GrindRail_EndAlternate: @ 0x08010558
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_GrindRail_EndGround_Left
initSprite_Interactable_GrindRail_EndGround_Left: @ 0x08010578
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010598
sub_8010598: @ 0x08010598
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08010644 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	ldrb r0, [r4, #8]
	mov r8, r0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	mov r6, r8
	lsls r2, r6, #3
	lsls r0, r0, #8
	adds r2, r2, r0
	mov ip, r2
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r6, _08010648 @ =gPlayer
	ldr r0, [r6, #8]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08010650
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08010650
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	ldr r0, [r6, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08010650
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08010650
	ldr r1, [r6, #0x20]
	ldr r0, _0801064C @ =0x00040002
	ands r0, r1
	cmp r0, #2
	bne _08010654
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _08010654
	movs r2, #0x80
	lsls r2, r2, #0x15
	ands r1, r2
	cmp r1, #0
	beq _08010624
	movs r0, #1
	strb r0, [r4, #9]
	ldr r0, [r6, #0x20]
	ands r0, r2
	cmp r0, #0
	bne _08010654
_08010624:
	ldrb r1, [r4, #9]
	cmp r1, #0
	bne _08010654
	adds r4, r6, #0
	adds r4, #0x6d
	movs r0, #0x17
	strb r0, [r4]
	adds r4, #1
	strb r1, [r4]
	ldrb r0, [r5, #2]
	cmp r0, #0x2c
	beq _08010654
	movs r0, #1
	strb r0, [r4]
	b _08010654
	.align 2, 0
_08010644: .4byte gCurTask
_08010648: .4byte gPlayer
_0801064C: .4byte 0x00040002
_08010650:
	movs r0, #0
	strb r0, [r4, #9]
_08010654:
	ldr r1, _08010694 @ =gCamera
	ldr r0, [r1]
	mov r6, ip
	subs r6, r6, r0
	mov ip, r6
	ldr r0, [r1, #4]
	subs r7, r7, r0
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801067E
	adds r0, r7, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0801067E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r7, r0
	ble _08010688
_0801067E:
	mov r0, r8
	strb r0, [r5]
	ldr r0, [r3]
	bl TaskDestroy
_08010688:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010694: .4byte gCamera

	thumb_func_start initSprite_Interactable044
initSprite_Interactable044: @ 0x08010698
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080106E0 @ =sub_8010598
	ldr r2, _080106E4 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080106E0: .4byte sub_8010598
_080106E4: .4byte 0x00002010

	thumb_func_start sub_80106E8
sub_80106E8: @ 0x080106E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080107DC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
	mov r8, r1
	ldrb r3, [r0, #8]
	mov sb, r3
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r6, r0, r1
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r5, r0, r2
	ldr r4, _080107E0 @ =gPlayer
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0801079A
	ldr r0, [r4, #8]
	asrs r1, r0, #8
	cmp r6, r1
	bgt _0801079A
	adds r0, r6, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801079A
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	cmp r5, r1
	bgt _0801079A
	adds r0, r5, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801079A
	movs r7, #0x80
	lsls r7, r7, #0xc
	ands r7, r2
	cmp r7, #0
	bne _0801079A
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0x19
	strb r0, [r1]
	mov r3, r8
	ldrb r0, [r3, #3]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3, #4]
	movs r0, #0xf
	ands r0, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x6e
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	lsls r0, r0, #8
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r0, #0xc
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	bl sub_8029FF0
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2]
	strh r7, [r4, #0x30]
	ldr r0, _080107E4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
_0801079A:
	ldr r1, _080107E8 @ =gCamera
	ldr r0, [r1]
	subs r6, r6, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080107C0
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080107C0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _080107CE
_080107C0:
	mov r1, sb
	mov r0, r8
	strb r1, [r0]
	ldr r0, _080107DC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080107CE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080107DC: .4byte gCurTask
_080107E0: .4byte gPlayer
_080107E4: .4byte gMPlayInfo_BGM
_080107E8: .4byte gCamera

	thumb_func_start sub_80107EC
sub_80107EC: @ 0x080107EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080108D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r7, [r0]
	ldrb r1, [r0, #8]
	mov r8, r1
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, r8
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r4, r0, r2
	ldr r0, _080108DC @ =gPlayer
	mov ip, r0
	ldr r2, [r0, #0x20]
	movs r6, #0x80
	ands r6, r2
	cmp r6, #0
	bne _0801089C
	ldr r0, [r0, #8]
	asrs r1, r0, #8
	cmp r5, r1
	bgt _0801089C
	adds r0, r5, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801089C
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0801089C
	adds r0, r4, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801089C
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0801089C
	ldr r0, _080108E0 @ =0xFFF7FDFD
	ands r2, r0
	mov r3, ip
	str r2, [r3, #0x20]
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _080108E4 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	adds r1, #0x38
	strb r6, [r1]
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08010884
	movs r0, #1
	strb r0, [r1]
_08010884:
	mov r3, ip
	adds r3, #0x6d
	movs r0, #0x1c
	strb r0, [r3]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08010898
	movs r0, #5
	strb r0, [r3]
_08010898:
	bl sub_802A004
_0801089C:
	ldr r1, _080108E8 @ =gCamera
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080108C2
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080108C2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _080108CE
_080108C2:
	mov r0, r8
	strb r0, [r7]
	ldr r0, _080108D8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080108CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080108D8: .4byte gCurTask
_080108DC: .4byte gPlayer
_080108E0: .4byte 0xFFF7FDFD
_080108E4: .4byte 0xFFFFCFFF
_080108E8: .4byte gCamera

	thumb_func_start initSprite_Interactable_Common_ClearPipe_Start
initSprite_Interactable_Common_ClearPipe_Start: @ 0x080108EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08010930 @ =sub_80106E8
	ldr r2, _08010934 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010930: .4byte sub_80106E8
_08010934: .4byte 0x00002010

	thumb_func_start initSprite_Interactable_Common_ClearPipe_End
initSprite_Interactable_Common_ClearPipe_End: @ 0x08010938
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0801097C @ =sub_80107EC
	ldr r2, _08010980 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801097C: .4byte sub_80107EC
_08010980: .4byte 0x00002010

	thumb_func_start initSprite_Interactable_CommonThinPlatform
initSprite_Interactable_CommonThinPlatform: @ 0x08010984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08010A90 @ =sub_8010AB4
	ldr r2, _08010A94 @ =0x00002010
	ldr r1, _08010A98 @ =sub_80111C0
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _08010A9C @ =IWRAM_START + 0xC
	adds r6, r2, r1
	movs r7, #0
	mov sl, r7
	movs r3, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	str r3, [r0, #0x40]
	str r3, [r0, #0x44]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r6, #0x18]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	strb r0, [r1]
	ldr r4, _08010AA0 @ =gUnknown_080D5468
	ldr r5, _08010AA4 @ =gCurrentLevel
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r6, #4]
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r2, [sp, #4]
	ldr r7, _08010AA8 @ =IWRAM_START + 0x2C
	adds r0, r2, r7
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	ldr r0, _08010AAC @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r4, _08010AB0 @ =IWRAM_START + 0x2E
	adds r1, r2, r4
	movs r0, #0x10
	strb r0, [r1]
	adds r7, #5
	adds r2, r2, r7
	mov r0, sl
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010A90: .4byte sub_8010AB4
_08010A94: .4byte 0x00002010
_08010A98: .4byte sub_80111C0
_08010A9C: .4byte IWRAM_START + 0xC
_08010AA0: .4byte gUnknown_080D5468
_08010AA4: .4byte gCurrentLevel
_08010AA8: .4byte IWRAM_START + 0x2C
_08010AAC: .4byte IWRAM_START + 0x2D
_08010AB0: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_8010AB4
sub_8010AB4: @ 0x08010AB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r6, _08010B58 @ =gPlayer
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _08010B5C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _08010B60 @ =IWRAM_START + 0xC
	adds r2, r1, r2
	str r2, [sp]
	ldr r3, [r0]
	str r3, [sp, #4]
	ldrb r2, [r0, #8]
	lsls r2, r2, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	ldr r4, [sp, #8]
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08010B64 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #0xc]
	asrs r2, r2, #0x10
	subs r0, r2, r0
	ldr r4, [sp]
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	str r3, [sp, #0x10]
	asrs r3, r1, #0x10
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldr r0, _08010B68 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08010B6C
	ldr r4, [sp, #4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010B6C
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_8010D1C
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08010B3E
	b _08010CF0
_08010B3E:
	ldr r0, [r6, #0x3c]
	ldr r2, [sp]
	cmp r0, r2
	beq _08010B48
	b _08010CF0
_08010B48:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r6, #0x20]
	b _08010CF0
	.align 2, 0
_08010B58: .4byte gPlayer
_08010B5C: .4byte gCurTask
_08010B60: .4byte IWRAM_START + 0xC
_08010B64: .4byte gCamera
_08010B68: .4byte gGameMode
_08010B6C:
	ldr r7, [r6, #0x20]
	ldr r0, _08010C00 @ =0x00400080
	ands r7, r0
	cmp r7, #0
	beq _08010B78
	b _08010C84
_08010B78:
	ldr r3, [sp, #0xc]
	lsls r5, r3, #0x10
	asrs r4, r5, #0x10
	mov sb, r4
	ldr r0, [sp, #0x10]
	lsls r4, r0, #0x10
	asrs r1, r4, #0x10
	mov r8, r1
	ldr r0, [sp]
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_800CCB8
	mov sl, r0
	movs r2, #0xc0
	lsls r2, r2, #0xc
	ands r0, r2
	str r4, [sp, #0x18]
	cmp r0, #0
	beq _08010BCE
	ldr r0, [sp]
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_80111F0
	movs r3, #0xc0
	lsls r3, r3, #0xc
	ands r0, r3
	cmp r0, #0
	beq _08010BCE
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	strh r7, [r6, #0x10]
_08010BCE:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08010C84
	adds r0, r6, #0
	adds r0, #0x64
	ldrh r7, [r0]
	adds r0, #4
	ldrh r2, [r0]
	adds r0, #2
	ldrh r4, [r0]
	adds r0, #0x1b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r1, #3
	beq _08010C0A
	cmp r1, #3
	bgt _08010C04
	cmp r1, #0
	beq _08010C36
	b _08010C74
	.align 2, 0
_08010C00: .4byte 0x00400080
_08010C04:
	cmp r1, #4
	beq _08010C36
	b _08010C74
_08010C0A:
	cmp r7, #0x6b
	bne _08010C30
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	ldrh r0, [r6, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r6, #0x12]
	asrs r0, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	bl sub_8010D1C
	b _08010C8A
_08010C30:
	mov r3, sl
	lsls r0, r3, #0x18
	b _08010C78
_08010C36:
	ldr r0, _08010CB0 @ =gUnknown_080D672C
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r7, #0x24
	bne _08010C74
	cmp r2, #0x33
	bne _08010C74
	cmp r4, #1
	bne _08010C74
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	cmp r0, #0
	ble _08010C74
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	asrs r0, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	bl sub_8010D1C
	movs r3, #1
	str r3, [sp, #0x14]
_08010C74:
	mov r4, sl
	lsls r0, r4, #0x18
_08010C78:
	asrs r0, r0, #0x10
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
_08010C84:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08010CB8
_08010C8A:
	ldr r0, _08010CB4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08010CF0
	bl sub_8019224
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r3, [sp, #8]
	ldrh r1, [r3, #4]
	strb r1, [r0, #1]
	ldrh r1, [r3, #6]
	strb r1, [r0, #2]
	ldrb r1, [r3, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
	b _08010CF0
	.align 2, 0
_08010CB0: .4byte gUnknown_080D672C
_08010CB4: .4byte gGameMode
_08010CB8:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r2, _08010CFC @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08010CE8
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08010CE8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08010D04
_08010CE8:
	ldr r2, [sp, #8]
	ldrb r0, [r2, #8]
	ldr r3, [sp, #4]
	strb r0, [r3]
_08010CF0:
	ldr r0, _08010D00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08010D0A
	.align 2, 0
_08010CFC: .4byte gCamera
_08010D00: .4byte gCurTask
_08010D04:
	ldr r0, [sp]
	bl sub_80051E8
_08010D0A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8010D1C
sub_8010D1C: @ 0x08010D1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08010F20 @ =sub_8010F78
	ldr r2, _08010F24 @ =0x00002011
	ldr r1, _08010F28 @ =sub_80111D4
	str r1, [sp]
	movs r1, #0xf4
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r1, _08010F2C @ =IWRAM_START + 0xC0
	adds r2, r5, r1
	ldr r3, _08010F30 @ =IWRAM_START + 0xF0
	adds r0, r5, r3
	movs r1, #0
	mov sl, r1
	mov r3, sl
	strh r3, [r0]
	ldr r0, _08010F34 @ =IWRAM_START + 0xF2
	adds r1, r5, r0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	lsls r4, r4, #0x10
	ldr r1, _08010F38 @ =0xFF800000
	adds r4, r4, r1
	lsrs r4, r4, #0x10
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	ldr r0, _08010F3C @ =0xFFCE0000
	add r8, r0
	mov r1, r8
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r3, _08010F40 @ =gUnknown_080D549E
	mov sb, r3
	ldr r0, _08010F44 @ =gCurrentLevel
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r6, #4]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _08010F48 @ =IWRAM_START + 0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #8]
	strh r1, [r6, #0x14]
	strh r1, [r6, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08010F4C @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x70
	str r0, [r6, #0x10]
	ldr r2, [sp, #4]
	mov r0, sl
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r4, [r2, #6]
	mov r1, r8
	strh r1, [r2, #8]
	adds r0, r6, #0
	str r2, [sp, #4]
	bl sub_8004558
	ldr r4, _08010F50 @ =0x040000D4
	str r6, [r4]
	ldr r3, _08010F54 @ =IWRAM_START + 0x30
	adds r7, r5, r3
	str r7, [r4, #4]
	ldr r0, _08010F58 @ =0x80000018
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r1, _08010F5C @ =IWRAM_START + 0xCC
	adds r2, r5, r1
	str r2, [r4, #4]
	ldr r3, _08010F60 @ =0x80000006
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x71
	str r0, [r7, #0x10]
	mov r0, r8
	lsls r6, r0, #0x10
	asrs r6, r6, #0x10
	subs r6, #0x10
	strh r6, [r2, #8]
	subs r1, #0x6c
	adds r7, r5, r1
	str r2, [r4]
	ldr r3, _08010F64 @ =IWRAM_START + 0xD8
	adds r2, r5, r3
	str r2, [r4, #4]
	ldr r0, _08010F60 @ =0x80000006
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08010F44 @ =gCurrentLevel
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r3, _08010F44 @ =gCurrentLevel
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xa
	add sb, r1
	add r0, sb
	ldrh r1, [r0]
	ldr r3, _08010F68 @ =IWRAM_START + 0x80
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	mov r1, sl
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08010F6C @ =IWRAM_START + 0x82
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x72
	str r0, [r7, #0x10]
	ldr r2, [sp, #4]
	mov r0, r8
	strh r0, [r2, #8]
	adds r0, r7, #0
	str r2, [sp, #4]
	bl sub_8004558
	str r7, [r4]
	ldr r1, _08010F70 @ =IWRAM_START + 0x90
	adds r7, r5, r1
	str r7, [r4, #4]
	ldr r3, _08010F58 @ =0x80000018
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r0, _08010F74 @ =IWRAM_START + 0xE4
	adds r2, r5, r0
	str r2, [r4, #4]
	ldr r1, _08010F60 @ =0x80000006
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x73
	str r0, [r7, #0x10]
	strh r6, [r2, #8]
	adds r0, #0xa3
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010F20: .4byte sub_8010F78
_08010F24: .4byte 0x00002011
_08010F28: .4byte sub_80111D4
_08010F2C: .4byte IWRAM_START + 0xC0
_08010F30: .4byte IWRAM_START + 0xF0
_08010F34: .4byte IWRAM_START + 0xF2
_08010F38: .4byte 0xFF800000
_08010F3C: .4byte 0xFFCE0000
_08010F40: .4byte gUnknown_080D549E
_08010F44: .4byte gCurrentLevel
_08010F48: .4byte IWRAM_START + 0x20
_08010F4C: .4byte IWRAM_START + 0x22
_08010F50: .4byte 0x040000D4
_08010F54: .4byte IWRAM_START + 0x30
_08010F58: .4byte 0x80000018
_08010F5C: .4byte IWRAM_START + 0xCC
_08010F60: .4byte 0x80000006
_08010F64: .4byte IWRAM_START + 0xD8
_08010F68: .4byte IWRAM_START + 0x80
_08010F6C: .4byte IWRAM_START + 0x82
_08010F70: .4byte IWRAM_START + 0x90
_08010F74: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_8010F78
sub_8010F78: @ 0x08010F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08010FB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r7, r1, r0
	ldr r3, _08010FB4 @ =IWRAM_START + 0xF0
	add r3, r8
	str r3, [sp]
	ldrh r0, [r3]
	adds r1, r0, #1
	strh r1, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _08010FB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08011188
	.align 2, 0
_08010FB0: .4byte gCurTask
_08010FB4: .4byte IWRAM_START + 0xF0
_08010FB8:
	ldr r0, _08011198 @ =IWRAM_START + 0xF2
	add r0, r8
	str r0, [sp, #4]
	ldrh r0, [r0]
	adds r0, #0x28
	ldr r1, [sp, #4]
	strh r0, [r1]
	ldr r6, _0801119C @ =IWRAM_START + 0xC0
	add r6, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	subs r2, r2, r0
	strh r2, [r6, #6]
	ldrh r0, [r6, #2]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	ble _08011006
	adds r4, r1, #0
_08011006:
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _080111A4 @ =gUnknown_030054B8
	mov sl, r2
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111A8 @ =IWRAM_START + 0x30
	add r7, r8
	ldr r6, _080111AC @ =IWRAM_START + 0xCC
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B0 @ =IWRAM_START + 0x60
	add r7, r8
	ldr r6, _080111B4 @ =IWRAM_START + 0xD8
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B8 @ =IWRAM_START + 0x90
	add r7, r8
	ldr r6, _080111BC @ =IWRAM_START + 0xE4
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gCamera
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	subs r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
_08011188:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011198: .4byte IWRAM_START + 0xF2
_0801119C: .4byte IWRAM_START + 0xC0
_080111A0: .4byte gCamera
_080111A4: .4byte gUnknown_030054B8
_080111A8: .4byte IWRAM_START + 0x30
_080111AC: .4byte IWRAM_START + 0xCC
_080111B0: .4byte IWRAM_START + 0x60
_080111B4: .4byte IWRAM_START + 0xD8
_080111B8: .4byte IWRAM_START + 0x90
_080111BC: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_80111C0
sub_80111C0: @ 0x080111C0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_80111D4
sub_80111D4: @ 0x080111D4
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x64]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80111F0
sub_80111F0: @ 0x080111F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	adds r4, #1
	strb r4, [r6]
	adds r5, r0, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	subs r4, #1
	strb r4, [r5]
	bl sub_800CCB8
	ldrb r1, [r6]
	subs r1, #1
	strb r1, [r6]
	ldrb r1, [r5]
	adds r1, #1
	strb r1, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_801121C
sub_801121C: @ 0x0801121C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080112D0 @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldrb r1, [r0, #8]
	mov r8, r1
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, r8
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r5, r0, r2
	ldr r3, _080112D4 @ =gPlayer
	ldr r4, [r3, #0x20]
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	bne _08011292
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08011292
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08011292
	movs r0, #4
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r5, r0
	ldr r0, [r3, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08011292
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08011292
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	str r4, [r3, #0x20]
_08011292:
	ldr r1, _080112D8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080112B8
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080112B8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _080112C4
_080112B8:
	mov r0, r8
	strb r0, [r6]
	mov r1, ip
	ldr r0, [r1]
	bl TaskDestroy
_080112C4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080112D0: .4byte gCurTask
_080112D4: .4byte gPlayer
_080112D8: .4byte gCamera

	thumb_func_start initSprite_Interactable_IceParadise_SlidyIce
initSprite_Interactable_IceParadise_SlidyIce: @ 0x080112DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08011320 @ =sub_801121C
	ldr r2, _08011324 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011320: .4byte sub_801121C
_08011324: .4byte 0x00002010
