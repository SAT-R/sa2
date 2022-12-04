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
	ldr r1, _0800E7A8 @ =TaskDestructor_800F19C
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
_0800E7A8: .4byte TaskDestructor_800F19C
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
	ldr r1, _0800EBEC @ =TaskDestructor_800F19C
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
_0800EBEC: .4byte TaskDestructor_800F19C
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

	thumb_func_start TaskDestructor_800F19C
TaskDestructor_800F19C: @ 0x0800F19C
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
