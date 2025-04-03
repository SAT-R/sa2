.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x18]     @ sp18 = param0
	ldr r0, [sp, #0x68]     @ r0 = param4
	ldr r4, [sp, #0x6c]     @ r4 = param5
	ldr r5, [sp, #0x70]     @ r5 = param6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]     @ sp1C = param1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]     @ sp20 = param2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3              @ sl   = param3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]     @ sp24 = param4
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
	ldr r0, _0800D1DC @ =gStageFlags
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
_0800D1DC: .4byte gStageFlags
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
	bl Player_SetSpriteOffsetY
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
	bl Player_SetSpriteOffsetY
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
	bl Player_SetSpriteOffsetY
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
	bl Player_SetSpriteOffsetY
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
	bl Player_SetSpriteOffsetY
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D6B4 @ =Player_TouchGround
	str r0, [r6]
	adds r0, r6, #0
	b _0800DA00
	.align 2, 0
_0800D6B4: .4byte Player_TouchGround
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
	bl Player_SetSpriteOffsetY
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
	bl Player_SetSpriteOffsetY
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D790 @ =Player_TouchGround
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
_0800D790: .4byte Player_TouchGround
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
	bl Player_SetSpriteOffsetY
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D80C @ =Player_TouchGround
	str r0, [r6]
	adds r0, r6, #0
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r5]
	b _0800DA18
	.align 2, 0
_0800D80C: .4byte Player_TouchGround
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
	bl Player_SetSpriteOffsetY
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D8B8 @ =Player_TouchGround
	str r0, [r5]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	ldr r1, _0800D8BC @ =gPlayer + 0x62
	strb r4, [r1]
	b _0800DA18
	.align 2, 0
_0800D8B8: .4byte Player_TouchGround
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
	bl Player_SetSpriteOffsetY
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
	ldr r0, _0800D994 @ =Player_TouchGround
	str r0, [r5]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_SetSpriteOffsetY
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
_0800D994: .4byte Player_TouchGround
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
	bl Player_SetSpriteOffsetY
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800DA08 @ =Player_TouchGround
	str r0, [r5]
	adds r0, r5, #0
_0800DA00:
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r7]
	b _0800DA18
	.align 2, 0
_0800DA08: .4byte Player_TouchGround
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

.syntax divided
