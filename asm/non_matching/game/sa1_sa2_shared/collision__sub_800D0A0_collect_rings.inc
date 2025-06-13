.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x60]
	ldr r4, [sp, #0x64]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x2c]
	ldr r7, _02006958 @ =gPlayer
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
	mov sl, r3
	movs r4, #0
	str r4, [sp, #0x30]
	ldr r0, _0200695C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0x16]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _02006960 @ =IWRAM_START + 0x58
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
	mov ip, sb
	cmp r1, r0
	beq _02006952
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02006952
	ldr r3, [sp, #0x1c]
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	str r0, [sp, #0x38]
	cmp r2, r1
	bne _02006964
	ldr r4, [sp, #0x20]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	cmp r1, r0
	bne _02006964
_02006952:
	movs r0, #0
	b _02006F3C
	.align 2, 0
_02006958: .4byte gPlayer
_0200695C: .4byte gCurTask
_02006960: .4byte IWRAM_START + 0x58
_02006964:
	ldr r0, _02006AA8 @ =gPlayer
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	str r1, [sp, #0x34]
	adds r1, r0, #0
	adds r1, #0x38
	adds r6, r0, #0
	ldr r2, [sp, #0x2c]
	ldrb r1, [r1]
	cmp r2, r1
	beq _0200697C
	b _02006F3A
_0200697C:
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200699A
	ldr r0, [r6, #0x3c]
	ldr r3, [sp, #0x18]
	cmp r0, r3
	bne _0200699A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	movs r4, #1
	str r4, [sp, #0x30]
_0200699A:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _020069AE
	b _02006B70
_020069AE:
	ldr r3, [sp, #0x38]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	asrs r0, r7, #8
	mov r1, ip
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov sb, r0
	cmp r2, r1
	bgt _020069DA
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _020069EA
	cmp r2, r1
	bge _020069DA
	b _02006B70
_020069DA:
	mov r3, ip
	movs r0, #2
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _020069EA
	b _02006B70
_020069EA:
	ldr r4, [sp, #0x3c]
	asrs r0, r4, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, ip
	movs r4, #1
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r1, r0, r4
	cmp r2, r1
	bgt _02006A14
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _02006A24
	cmp r2, r1
	bge _02006A14
	b _02006B70
_02006A14:
	mov r3, ip
	movs r0, #3
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _02006A24
	b _02006B70
_02006A24:
	ldr r4, [sp, #0x3c]
	asrs r2, r4, #0x10
	cmp r8, r2
	bgt _02006AEE
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r3, [sp, #0x28]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _02006A3E
	b _02006B70
_02006A3E:
	movs r0, #1
	ldrsb r0, [r5, r0]
	adds r0, r2, r0
	mov r4, ip
	movs r1, #3
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _02006AAC @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r5, [sp, #0x34]
	adds r5, r5, r0
	str r5, [sp, #0x34]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _02006AB0 @ =sub_801EC3C
	str r1, [sp]
	mov r1, sb
	ldr r2, [sp, #0x2c]
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _02006AB4
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r5, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _02006F1C
	.align 2, 0
_02006AA8: .4byte gPlayer
_02006AAC: .4byte 0xFFFFFF00
_02006AB0: .4byte sub_801EC3C
_02006AB4:
	movs r1, #8
	mov r0, sl
	orrs r0, r1
	mov sl, r0
	ldr r0, [r6, #0x20]
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r1, [sp, #0x18]
	str r1, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r2, [sp, #0x34]
	str r2, [r6, #0xc]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _02006ADA
	b _02006F22
_02006ADA:
	adds r0, r6, #0
	bl sub_8021BE0
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	b _02006F1C
_02006AEE:
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	ldr r5, [sp, #0x28]
	lsls r2, r5, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bge _02006B70
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	add r0, r8
	ldr r1, _02006B44 @ =sub_801EC3C
	str r1, [sp]
	mov r1, sb
	ldr r2, [sp, #0x2c]
	movs r3, #8
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _02006B48
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r5, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	b _02006B4C
	.align 2, 0
_02006B44: .4byte sub_801EC3C
_02006B48:
	str r7, [r6, #8]
	ldr r0, [sp, #0x34]
_02006B4C:
	str r0, [r6, #0xc]
	ldr r0, _02006B6C @ =gPlayer
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _02006B70
	movs r0, #0x80
	lsls r0, r0, #9
	mov r3, sl
	orrs r3, r0
	mov sl, r3
	b _02006F1C
	.align 2, 0
_02006B6C: .4byte gPlayer
_02006B70:
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
	beq _02006B88
	b _02006F1C
_02006B88:
	ldr r4, [sp, #0x38]
	asrs r0, r4, #0x10
	mov r5, sp
	movs r4, #0xc
	ldrsb r4, [r5, r4]
	adds r3, r0, r4
	asrs r1, r7, #8
	add r0, sp, #4
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r1, r5
	mov sb, r1
	cmp r3, r2
	bgt _02006BB8
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _02006BCA
	cmp r3, r2
	bge _02006BB8
	b _02006F1C
_02006BB8:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _02006BCA
	b _02006F1C
_02006BCA:
	ldr r2, [sp, #0x3c]
	asrs r0, r2, #0x10
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
	bgt _02006BF8
	mov r5, sp
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _02006C0A
	cmp r1, r3
	bge _02006BF8
	b _02006F1C
_02006BF8:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _02006C0A
	b _02006F1C
_02006C0A:
	ldr r0, [sp, #0x38]
	asrs r1, r0, #0x10
	cmp sb, r1
	ble _02006C14
	b _02006D9C
_02006C14:
	ldr r3, [r6, #0x20]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _02006C20
	b _02006D4C
_02006C20:
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r4, sl
	orrs r4, r0
	mov sl, r4
	adds r0, r6, #0
	adds r0, #0x62
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq _02006C3A
	strh r2, [r6, #0x10]
	b _02006F1C
_02006C3A:
	mov r5, sp
	movs r0, #0xc
	ldrsb r0, [r5, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r7, r0, #8
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _02006C58
	rsbs r1, r1, #0
_02006C58:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _02006C9C
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	cmp r0, #0
	ble _02006C86
	strh r2, [r6, #0x14]
	mov r4, sp
	ldrh r4, [r4, #0x24]
	strh r4, [r6, #0x10]
	ldr r0, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	str r0, [r6, #8]
	b _02006F1C
_02006C86:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0x20]
	ldr r0, _02006C98 @ =0x0000FE80
	strh r0, [r6, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r6, #0x12]
	b _02006F1C
	.align 2, 0
_02006C98: .4byte 0x0000FE80
_02006C9C:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _02006CA6
	b _02006F1C
_02006CA6:
	asrs r0, r7, #8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	mov r2, r8
	subs r1, r2, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _02006CF0 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x2c]
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _02006CF4
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r4, [r6, #0x10]
	lsls r1, r5, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	b _02006F1C
	.align 2, 0
_02006CF0: .4byte sub_801EB44
_02006CF4:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02006D2C
	movs r0, #0x20
	orrs r1, r0
	mov r3, sl
	orrs r3, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r6, #0x20]
	ands r3, r0
	mov sl, r3
	adds r0, r6, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _02006D48 @ =Player_TouchGround
	str r0, [r6]
_02006D2C:
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	mov r5, sl
	ands r5, r1
	mov sl, r5
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	str r7, [r6, #8]
	ldr r0, [sp, #0x34]
	str r0, [r6, #0xc]
	b _02006F1C
	.align 2, 0
_02006D48: .4byte Player_TouchGround
_02006D4C:
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	adds r0, r6, #0
	adds r0, #0x62
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq _02006D68
	movs r0, #0
	strh r0, [r6, #0x10]
	b _02006F1C
_02006D68:
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	cmp r3, #0
	bge _02006D76
	rsbs r1, r3, #0
_02006D76:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _02006D80
	b _02006F1C
_02006D80:
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r4, sl
	orrs r4, r0
	mov sl, r4
	cmp r3, #0
	bge _02006D96
	adds r0, r6, #0
	bl sub_800DD54
	b _02006F1C
_02006D96:
	strh r2, [r6, #0x14]
	strh r2, [r6, #0x10]
	b _02006F1C
_02006D9C:
	adds r4, r6, #0
	ldr r3, [r4, #0x20]
	movs r5, #1
	mov sb, r5
	adds r2, r3, #0
	ands r2, r5
	cmp r2, #0
	bne _02006DAE
	b _02006ED4
_02006DAE:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r2, sl
	orrs r2, r0
	mov sl, r2
	adds r0, r4, #0
	adds r0, #0x62
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _02006DCA
	movs r0, #0
	strh r0, [r4, #0x10]
	b _02006F1C
_02006DCA:
	mov r5, sp
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r7, r0, #8
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02006DE8
	rsbs r1, r1, #0
_02006DE8:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _02006E28
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _02006E14
	strh r2, [r4, #0x14]
	mov r5, sp
	ldrh r5, [r5, #0x24]
	strh r5, [r4, #0x10]
	ldr r0, [r4, #8]
	ldr r1, _02006E10 @ =0xFFFFFF00
	b _02006E6E
	.align 2, 0
_02006E10: .4byte 0xFFFFFF00
_02006E14:
	movs r0, #2
	orrs r3, r0
	str r3, [r4, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r4, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	b _02006F1C
_02006E28:
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _02006F1C
	asrs r0, r7, #8
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r2, _02006E74 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x2c]
	movs r3, #8
	bl sub_801F100
	adds r5, r0, #0
	cmp r5, #0
	bge _02006E78
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	strh r6, [r4, #0x10]
	lsls r1, r5, #8
	ldr r0, [r4, #8]
_02006E6E:
	adds r0, r0, r1
	str r0, [r4, #8]
	b _02006F1C
	.align 2, 0
_02006E74: .4byte sub_801EB44
_02006E78:
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02006EB0
	movs r0, #0x20
	orrs r1, r0
	mov r3, sl
	orrs r3, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r4, #0x20]
	ands r3, r0
	mov sl, r3
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _02006ED0 @ =Player_TouchGround
	str r0, [r4]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
_02006EB0:
	ldr r0, [r4, #0x20]
	mov r5, sb
	orrs r0, r5
	str r0, [r4, #0x20]
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	str r0, [r4, #8]
	ldr r2, [sp, #0x34]
	str r2, [r4, #0xc]
	b _02006F1C
	.align 2, 0
_02006ED0: .4byte Player_TouchGround
_02006ED4:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x62
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _02006EEC
	strh r2, [r4, #0x10]
	b _02006F1C
_02006EEC:
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	cmp r3, #0
	bge _02006EFA
	rsbs r1, r3, #0
_02006EFA:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _02006F1C
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	cmp r3, #0
	ble _02006F18
	adds r0, r4, #0
	bl sub_800DD54
	b _02006F1C
_02006F18:
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x10]
_02006F1C:
	ldr r2, [sp, #0x30]
	cmp r2, #0
	beq _02006F3A
_02006F22:
	ldr r2, _02006F4C @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _02006F3A
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_02006F3A:
	mov r0, sl
_02006F3C:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02006F4C: .4byte gPlayer

	
.syntax divided
