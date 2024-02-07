.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

@ These are all multiplayer-only, but there is one procedure (sub_800DF38)
@ of collision code behind this that is not MP-exclusive.
@
@ Either everything gets merged into collision.c, which seems like the best approach,
@ or we have a main collision.c and a collision_mp.c, the latter of which contains SP-called code.

@ Called by: player_mp_actor.s
	thumb_func_start sub_800D0A0
sub_800D0A0: @ 0x0800D0A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x2c]
	ldr r7, _0800D1D8 @ =gPlayer
	ldrb r3, [r7, #0x16]
	adds r3, #5
	rsbs r0, r3, #0
	add r1, sp, #8
	mov sb, r1
	strb r0, [r1]
	ldrb r1, [r7, #0x17]
	movs r6, #1
	subs r2, r6, r1
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r1, #1
	adds r0, #1
	strb r1, [r0]
	add r0, sp, #4
	mov r1, sb
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r2, sp, #0xc
	mov r8, r2
	strb r0, [r2]
	ldrb r2, [r7, #0x17]
	rsbs r1, r2, #0
	mov r0, sp
	adds r0, #0xd
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, sb
	mov r1, r8
	movs r2, #4
	bl memcpy
	movs r3, #0
	str r3, [sp, #0x30]
	movs r4, #0
	str r4, [sp, #0x34]
	ldr r0, _0800D1DC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r0, _0800D1E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0x16]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _0800D1E4 @ =IWRAM_START + 0x58
	adds r4, r4, r0
	ldrb r0, [r4]
	subs r6, r6, r0
	mov r0, sp
	adds r0, #0x11
	strb r6, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r4]
	subs r0, #1
	mov r1, sp
	adds r1, #0x13
	strb r0, [r1]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #4
	bl memcpy
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r1, sp, #0x14
	strb r0, [r1]
	ldrb r0, [r4]
	rsbs r0, r0, #0
	mov r2, sp
	adds r2, #0x15
	strb r0, [r2]
	mov r0, sp
	adds r0, #0x16
	strb r3, [r0]
	ldrb r2, [r4]
	adds r0, #1
	strb r2, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl memcpy
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800D1D2
	ldr r0, [r7, #0x20]
	movs r3, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0800D1D2
	ldr r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	str r0, [sp, #0x40]
	cmp r2, r1
	bne _0800D1E8
	ldr r0, [sp, #0x20]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	cmp r1, r0
	bne _0800D1E8
_0800D1D2:
	movs r0, #0
	bl _0800DA38
	.align 2, 0
_0800D1D8: .4byte gPlayer
_0800D1DC: .4byte gUnknown_03005424
_0800D1E0: .4byte gCurTask
_0800D1E4: .4byte IWRAM_START + 0x58
_0800D1E8:
	ldr r0, _0800D2CC @ =gPlayer
	ldr r1, [r0, #8]
	mov sb, r1
	ldr r2, [r0, #0xc]
	str r2, [sp, #0x38]
	adds r1, r0, #0
	adds r1, #0x38
	adds r6, r0, #0
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	cmp r3, r1
	beq _0800D204
	bl _0800DA36
_0800D204:
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D222
	ldr r0, [r6, #0x3c]
	ldr r4, [sp, #0x18]
	cmp r0, r4
	bne _0800D222
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	movs r0, #1
	str r0, [sp, #0x34]
_0800D222:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	ldr r2, [sp, #0x38]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _0800D236
	b _0800D580
_0800D236:
	ldr r3, [sp, #0x40]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r4, sb
	asrs r0, r4, #8
	mov r1, sp
	movs r4, #8
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov ip, r0
	cmp r2, r1
	bgt _0800D264
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D274
	cmp r2, r1
	bge _0800D264
	b _0800D580
_0800D264:
	mov r3, sp
	movs r0, #0xa
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D274
	b _0800D580
_0800D274:
	asrs r0, r7, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, sp
	movs r4, #9
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800D29C
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D2AC
	cmp r2, r1
	bge _0800D29C
	b _0800D580
_0800D29C:
	mov r3, sp
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D2AC
	b _0800D580
_0800D2AC:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D2D0
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D2BA
	b _0800D440
_0800D2BA:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D440
	.align 2, 0
_0800D2CC: .4byte gPlayer
_0800D2D0:
	asrs r0, r7, #0x10
	cmp r8, r0
	bgt _0800D2D8
	b _0800D43A
_0800D2D8:
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D43A
_0800D2EA:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0800D38E
	asrs r0, r7, #0x10
	movs r1, #1
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D35C @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D360 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D364
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	mov r5, sp
	ldrh r5, [r5, #0x3c]
	strh r5, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D35C: .4byte 0xFFFFFF00
_0800D360: .4byte sub_801EC3C
_0800D364:
	movs r0, #8
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	ldr r1, [r6, #0x20]
	orrs r1, r0
	subs r0, #0xb
	ands r1, r0
	str r1, [r6, #0x20]
	ldr r2, [sp, #0x18]
	str r2, [r6, #0x3c]
	mov r3, sp
	ldrh r3, [r3, #0x3c]
	strh r3, [r6, #0x12]
	ldr r4, [sp, #0x38]
	str r4, [r6, #0xc]
	ldr r5, [sp, #0x34]
	cmp r5, #0
	beq _0800D38C
	b _0800DA1E
_0800D38C:
	b _0800D426
_0800D38E:
	asrs r0, r7, #0x10
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D3F8 @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, _0800D3FC @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D400
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D3F8: .4byte 0xFFFFFF00
_0800D3FC: .4byte sub_801EC3C
_0800D400:
	movs r1, #8
	ldr r4, [sp, #0x30]
	orrs r4, r1
	str r4, [sp, #0x30]
	ldr r0, [r6, #0x20]
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r5, [sp, #0x18]
	str r5, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r0, [sp, #0x38]
	str r0, [r6, #0xc]
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800D426
	b _0800DA1E
_0800D426:
	adds r0, r6, #0
	bl sub_8021BE0
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	b _0800DA18
_0800D43A:
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	bne _0800D460
_0800D440:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D458
	movs r3, #0x12
	ldrsh r0, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
_0800D458:
	ldr r5, [sp, #0x3c]
	cmp r5, #0
	bne _0800D460
	b _0800D580
_0800D460:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D468
	b _0800D580
_0800D468:
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
	b _0800D580
_0800D47C:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D500
	ldr r5, _0800D4CC @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	add r0, r8
	ldr r1, _0800D4D0 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D4D4
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x3c]
	strh r0, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D4DC
	.align 2, 0
_0800D4CC: .4byte gPlayer
_0800D4D0: .4byte sub_801EC3C
_0800D4D4:
	mov r1, sb
	str r1, [r5, #8]
	ldr r2, [sp, #0x38]
	str r2, [r5, #0xc]
_0800D4DC:
	ldr r0, _0800D4FC @ =gPlayer
	movs r3, #0x12
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0x44]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D4FC: .4byte gPlayer
_0800D500:
	ldr r5, _0800D54C @ =gPlayer
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	mov r1, r8
	subs r0, r1, r0
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D550 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D554
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r1, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D55C
	.align 2, 0
_0800D54C: .4byte gPlayer
_0800D550: .4byte sub_801EC3C
_0800D554:
	mov r2, sb
	str r2, [r5, #8]
	ldr r3, [sp, #0x38]
	str r3, [r5, #0xc]
_0800D55C:
	ldr r0, _0800D57C @ =gPlayer
	movs r4, #0x12
	ldrsh r1, [r0, r4]
	ldr r5, [sp, #0x44]
	asrs r2, r5, #0x10
	adds r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D57C: .4byte gPlayer
_0800D580:
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D598
	b _0800DA18
_0800D598:
	ldr r2, [sp, #0x40]
	asrs r0, r2, #0x10
	mov r3, sp
	movs r4, #0xc
	ldrsb r4, [r3, r4]
	adds r3, r0, r4
	mov r5, sb
	asrs r1, r5, #8
	add r0, sp, #4
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r1, r5
	mov ip, r1
	cmp r3, r2
	bgt _0800D5CA
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0800D5DC
	cmp r3, r2
	bge _0800D5CA
	b _0800DA18
_0800D5CA:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800D5DC
	b _0800DA18
_0800D5DC:
	asrs r0, r7, #0x10
	mov r3, sp
	movs r2, #0xd
	ldrsb r2, [r3, r2]
	adds r1, r0, r2
	add r0, sp, #4
	movs r4, #1
	ldrsb r4, [r0, r4]
	mov r5, r8
	adds r3, r5, r4
	cmp r1, r3
	bgt _0800D608
	mov r5, sp
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _0800D61A
	cmp r1, r3
	bge _0800D608
	b _0800DA18
_0800D608:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800D61A
	b _0800DA18
_0800D61A:
	ldr r0, [sp, #0x40]
	asrs r1, r0, #0x10
	cmp ip, r1
	ble _0800D624
	b _0800D818
_0800D624:
	ldr r3, [r6, #0x20]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _0800D630
	b _0800D794
_0800D630:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r4, [sp, #0x30]
	orrs r4, r0
	str r4, [sp, #0x30]
	adds r7, r6, #0
	adds r7, #0x62
	movs r5, #0
	ldrsb r5, [r7, r5]
	cmp r5, #0
	beq _0800D64A
	strh r2, [r6, #0x10]
	b _0800DA18
_0800D64A:
	mov r2, sp
	movs r0, #0xc
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _0800D66A
	rsbs r1, r1, #0
_0800D66A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D6E0
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	mov r1, sl
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _0800D6CA
	ldr r2, [sp, #0x2c]
	cmp r2, #0
	beq _0800D6B8
	movs r4, #0
	strh r1, [r6, #0x14]
	mov r3, sl
	strh r3, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D6B4 @ =PlayerCB_8025318
	str r0, [r6]
	adds r0, r6, #0
	b _0800DA00
	.align 2, 0
_0800D6B4: .4byte PlayerCB_8025318
_0800D6B8:
	mov r4, sl
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r0, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	str r0, [r6, #8]
	b _0800DA18
_0800D6CA:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0x20]
	ldr r0, _0800D6DC @ =0x0000FE80
	strh r0, [r6, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r6, #0x12]
	b _0800DA18
	.align 2, 0
_0800D6DC: .4byte 0x0000FE80
_0800D6E0:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0800D6EA
	b _0800DA18
_0800D6EA:
	mov r2, sb
	asrs r0, r2, #8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	mov r3, r8
	subs r1, r3, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _0800D734 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D738
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r5, [r6, #0x10]
	lsls r1, r4, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	b _0800DA18
	.align 2, 0
_0800D734: .4byte sub_801EB44
_0800D738:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D770
	movs r0, #0x20
	orrs r1, r0
	ldr r4, [sp, #0x30]
	orrs r4, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r6, #0x20]
	ands r4, r0
	str r4, [sp, #0x30]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D790 @ =PlayerCB_8025318
	str r0, [r6]
_0800D770:
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [sp, #0x30]
	ands r0, r1
	str r0, [sp, #0x30]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x10]
	mov r1, sb
	str r1, [r6, #8]
	ldr r2, [sp, #0x38]
	str r2, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D790: .4byte PlayerCB_8025318
_0800D794:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r3, [sp, #0x30]
	orrs r3, r0
	str r3, [sp, #0x30]
	adds r5, r6, #0
	adds r5, #0x62
	movs r3, #0
	ldrsb r3, [r5, r3]
	cmp r3, #0
	beq _0800D7B0
	movs r0, #0
	strh r0, [r6, #0x10]
	b _0800DA18
_0800D7B0:
	mov r4, sl
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D7BE
	rsbs r2, r1, #0
_0800D7BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _0800D7C8
	b _0800DA18
_0800D7C8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	blt _0800D7D8
	b _0800DA14
_0800D7D8:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D810
	movs r4, #0
	mov r0, sl
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D80C @ =PlayerCB_8025318
	str r0, [r6]
	adds r0, r6, #0
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r5]
	b _0800DA18
	.align 2, 0
_0800D80C: .4byte PlayerCB_8025318
_0800D810:
	adds r0, r6, #0
	bl sub_800DE44
	b _0800DA18
_0800D818:
	adds r5, r6, #0
	ldr r3, [r5, #0x20]
	movs r7, #1
	adds r2, r3, #0
	ands r2, r7
	cmp r2, #0
	bne _0800D828
	b _0800D998
_0800D828:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	ldr r4, _0800D844 @ =gPlayer + 0x62
	movs r6, #0
	ldrsb r6, [r4, r6]
	cmp r6, #0
	beq _0800D848
	movs r0, #0
	strh r0, [r5, #0x10]
	b _0800DA18
	.align 2, 0
_0800D844: .4byte gPlayer + 0x62
_0800D848:
	mov r2, sp
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r5, r4]
	cmp r1, #0
	bge _0800D868
	rsbs r1, r1, #0
_0800D868:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D8E8
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	mov r2, sl
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800D8D4
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D8C0
	movs r4, #0
	strh r2, [r5, #0x14]
	mov r0, sl
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D8B8 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	ldr r1, _0800D8BC @ =gPlayer + 0x62
	strb r4, [r1]
	b _0800DA18
	.align 2, 0
_0800D8B8: .4byte PlayerCB_8025318
_0800D8BC: .4byte gPlayer + 0x62
_0800D8C0:
	mov r2, sl
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r3, _0800D8D0 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D8D0: .4byte 0xFFFFFF00
_0800D8D4:
	movs r0, #2
	orrs r3, r0
	str r3, [r5, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0800DA18
_0800D8E8:
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bne _0800D8F2
	b _0800DA18
_0800D8F2:
	mov r1, sb
	asrs r0, r1, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	add r1, r8
	ldr r2, _0800D938 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D93C
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x10]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D938: .4byte sub_801EB44
_0800D93C:
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D974
	movs r0, #0x20
	orrs r1, r0
	ldr r2, [sp, #0x30]
	orrs r2, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r5, #0x20]
	ands r2, r0
	str r2, [sp, #0x30]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D994 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
_0800D974:
	ldr r0, [r5, #0x20]
	orrs r0, r7
	str r0, [r5, #0x20]
	ldr r3, [sp, #0x30]
	orrs r3, r7
	str r3, [sp, #0x30]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	str r0, [r5, #8]
	ldr r4, [sp, #0x38]
	str r4, [r5, #0xc]
	b _0800DA18
	.align 2, 0
_0800D994: .4byte PlayerCB_8025318
_0800D998:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r5, #0x20]
	adds r7, r5, #0
	adds r7, #0x62
	movs r3, #0
	ldrsb r3, [r7, r3]
	cmp r3, #0
	beq _0800D9B0
	strh r2, [r5, #0x10]
	b _0800DA18
_0800D9B0:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D9BE
	rsbs r2, r1, #0
_0800D9BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	ble _0800DA18
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	ble _0800DA14
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800DA0C
	movs r4, #0
	mov r0, sl
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800DA08 @ =PlayerCB_8025318
	str r0, [r5]
	adds r0, r5, #0
_0800DA00:
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r7]
	b _0800DA18
	.align 2, 0
_0800DA08: .4byte PlayerCB_8025318
_0800DA0C:
	adds r0, r5, #0
	bl sub_800DE44
	b _0800DA18
_0800DA14:
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x10]
_0800DA18:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800DA36
_0800DA1E:
	ldr r2, _0800DA48 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DA36
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_0800DA36:
	ldr r0, [sp, #0x30]
_0800DA38:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA48: .4byte gPlayer

	thumb_func_start sub_800DA4C
sub_800DA4C: @ 0x0800DA4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r2, _0800DAB0 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800DAAA
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	bne _0800DAAA
	ldr r1, _0800DAB4 @ =gMultiplayerPlayerTasks
	ldr r0, _0800DAB8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	mov sb, r6
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r4, r0
	beq _0800DABC
_0800DAAA:
	movs r0, #0
	b _0800DD44
	.align 2, 0
_0800DAB0: .4byte gPlayer
_0800DAB4: .4byte gMultiplayerPlayerTasks
_0800DAB8: .4byte 0x04000128
_0800DABC:
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _0800DB70
	ldr r1, [r5, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800DB70
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	ldr r7, _0800DC50 @ =IWRAM_START + 0x50
	adds r0, r3, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r7, _0800DC54 @ =IWRAM_START + 0x2C
	adds r0, r3, r7
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	cmp r2, r1
	bgt _0800DB08
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB1A
	cmp r2, r1
	blt _0800DB70
_0800DB08:
	ldr r4, _0800DC58 @ =IWRAM_START + 0x2E
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB1A:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800DB56
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB68
	cmp r2, r1
	blt _0800DB70
_0800DB56:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB68:
	movs r0, #2
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DB70:
	ldr r0, [r6, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0800DB7C
	b _0800DC8C
_0800DB7C:
	ldr r0, [r5, #0x28]
	cmp r0, r1
	bne _0800DB84
	b _0800DC8C
_0800DB84:
	ldr r4, [sp]
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	adds r0, r5, #0
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r1, r7
	mov r2, sb
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	cmp r4, r1
	bgt _0800DBC8
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r4, r0
	cmp r0, r1
	bge _0800DBDC
	cmp r4, r1
	blt _0800DC8C
_0800DBC8:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r4
	blt _0800DC8C
_0800DBDC:
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r4, r0, r1
	mov r1, sb
	adds r1, #0x52
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r3, #0x35
	ldrsb r7, [r3, r6]
	mov ip, r7
	adds r3, r0, r7
	mov sl, r2
	adds r2, r1, #0
	cmp r4, r3
	bgt _0800DC20
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r4, r0
	cmp r0, r3
	bge _0800DC34
	cmp r4, r3
	blt _0800DC8C
_0800DC20:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _0800DC8C
_0800DC34:
	ldr r0, [sp, #8]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0xc]
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC5C
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC66
	.align 2, 0
_0800DC50: .4byte IWRAM_START + 0x50
_0800DC54: .4byte IWRAM_START + 0x2C
_0800DC58: .4byte IWRAM_START + 0x2E
_0800DC5C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC66:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r4, sl
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC7E
	movs r0, #0x80
	lsls r0, r0, #9
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC88
_0800DC7E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC88:
	movs r0, #1
	b _0800DD3C
_0800DC8C:
	ldr r0, [r6, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800DD42
	ldr r0, [r5, #0x30]
	cmp r0, r1
	beq _0800DD42
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r3, r0, r2
	mov r0, sb
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r6, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r3, r1
	bgt _0800DCD8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	bge _0800DCEA
	cmp r3, r1
	blt _0800DD42
_0800DCD8:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r3
	blt _0800DD42
_0800DCEA:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r3, r6, #0
	adds r3, #0x2d
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800DD28
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DD3A
	cmp r2, r1
	blt _0800DD42
_0800DD28:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DD42
_0800DD3A:
	movs r0, #2
_0800DD3C:
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DD42:
	mov r0, r8
_0800DD44:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

@ In:
@  r0: Player*
	thumb_func_start sub_800DD54
sub_800DD54: @ 0x0800DD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DD68
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DD6C
_0800DD68:
	movs r0, #0
	b _0800DE2A
_0800DD6C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DD80
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0800DD82
_0800DD80:
	ldr r0, _0800DE30 @ =0x0000FE80
_0800DD82:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DDA2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DDA2:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DE34 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DE38 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
@ Following is similar to rings code in sub_800CBA4
	ldr r0, _0800DE3C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DE22
	ldr r6, _0800DE40 @ =gRingCount
	ldrh r4, [r6]
	cmp r4, #0xa
	bls _0800DE04
	movs r4, #0xa
_0800DE04:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl InitScatteringRings
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DE22:
	movs r0, #0x77 @ SE_LIFE_LOST
	bl m4aSongNumStart
	movs r0, #1
_0800DE2A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DE30: .4byte 0x0000FE80
_0800DE34: .4byte 0xFFFFFBFF
_0800DE38: .4byte 0xFFFFFEFF
_0800DE3C: .4byte gGameMode
_0800DE40: .4byte gRingCount

.if 0
.endif
