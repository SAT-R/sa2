.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 01
	thumb_func_start Task_800F38C
Task_800F38C: @ 0x0800F38C
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
.endif

	thumb_func_start TaskDestructor_800F964
TaskDestructor_800F964: @ 0x0800F964
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

    @ Unused?
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
