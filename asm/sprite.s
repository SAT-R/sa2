.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8002B20
sub_8002B20: @ 0x08002B20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _08002B58 @ =gUnknown_03002AE4
	ldr r1, _08002B5C @ =gUnknown_0300287C
	ldrb r2, [r0]
	adds r3, r0, #0
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r2, r1
	bne _08002B44
	bl _08003616
_08002B44:
	ldr r0, _08002B60 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08002B64
	movs r0, #0
	bl _08003618
	.align 2, 0
_08002B58: .4byte gUnknown_03002AE4
_08002B5C: .4byte gUnknown_0300287C
_08002B60: .4byte 0x04000004
_08002B64:
	ldr r0, _08002BC8 @ =0x04000006
	ldrh r0, [r0]
	ldr r2, _08002BCC @ =gUnknown_03001800
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r6, [r0]
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r3]
	ldrh r2, [r6, #0x2e]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08002B90
	ldr r1, [r6, #0x30]
	ldr r0, [r6, #0x34]
	cmp r1, r0
	bne _08002B90
	bl _0800360A
_08002B90:
	ldrh r3, [r6, #0x14]
	str r3, [sp]
	movs r3, #3
	adds r5, r3, #0
	ands r5, r2
	ldr r4, [sp]
	cmp r5, #1
	bls _08002BD8
	ldr r0, _08002BD0 @ =gDispCnt
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08002BD8
	ldr r1, _08002BD4 @ =gBgCntRegs
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, #0xe
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r3
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r7, #1
	str r7, [sp, #8]
	b _08002BF8
	.align 2, 0
_08002BC8: .4byte 0x04000006
_08002BCC: .4byte gUnknown_03001800
_08002BD0: .4byte gDispCnt
_08002BD4: .4byte gBgCntRegs
_08002BD8:
	movs r0, #0x20
	str r0, [sp, #0xc]
	ldr r0, _08002CCC @ =gBgCntRegs
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsrs r3, r0, #0xe
	cmp r3, #1
	beq _08002BEE
	cmp r3, #3
	bne _08002BF4
_08002BEE:
	movs r1, #0x80
	lsls r1, r1, #4
	str r1, [sp, #4]
_08002BF4:
	movs r2, #2
	str r2, [sp, #8]
_08002BF8:
	ldr r7, [sp, #0xc]
	ldr r1, [sp, #8]
	adds r0, r7, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldrh r2, [r6, #0x2e]
	movs r7, #0x20
	mov sb, r7
	mov r0, sb
	ands r0, r2
	cmp r0, #0
	beq _08002C16
	b _08002FE8
_08002C16:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08002C20
	b _08002ED4
_08002C20:
	ldrh r0, [r6, #0x24]
	ldr r1, [sp, #0xc]
	muls r0, r1, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r5, [r6, #0x22]
	mov r8, r5
	ldr r7, [sp, #8]
	mov r0, r8
	muls r0, r7, r0
	adds r7, r1, r0
	ldrh r5, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08002C46
	b _08002D50
_08002C46:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08002CD4
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r2, [r6, #0x10]
	adds r2, r2, r0
	ldrh r0, [r6, #0x1e]
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	subs r0, #1
	ldr r3, [sp, #8]
	muls r0, r3, r0
	adds r4, r2, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08002CD0 @ =0x0000FFFF
	cmp r5, r0
	bne _08002C7C
	bl _080035FA
_08002C7C:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_08002C86:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08002CB8
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_08002C9A:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08002C9A
_08002CB8:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08002C86
	bl _080035FA
	.align 2, 0
_08002CCC: .4byte gBgCntRegs
_08002CD0: .4byte 0x0000FFFF
_08002CD4:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r2, [r6, #0x10]
	adds r2, r2, r0
	ldrh r0, [r6, #0x1e]
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	subs r0, #1
	ldr r3, [sp, #8]
	muls r0, r3, r0
	adds r4, r2, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08002D4C @ =0x0000FFFF
	cmp r5, r0
	bne _08002CFE
	bl _080035FA
_08002CFE:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_08002D08:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08002D3A
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08002D1C:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08002D1C
_08002D3A:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08002D08
	bl _080035FA
	.align 2, 0
_08002D4C: .4byte 0x0000FFFF
_08002D50:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08002DD4
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r1, [sp, #8]
	muls r0, r1, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	ldr r2, [sp, #8]
	muls r0, r2, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _08002DD0 @ =0x0000FFFF
	cmp r5, r3
	bne _08002D80
	bl _080035FA
_08002D80:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r2, r0
	mov sb, r0
	mov sl, r3
_08002D8A:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08002DBC
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
_08002D9E:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08002D9E
_08002DBC:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08002D8A
	bl _080035FA
	.align 2, 0
_08002DD0: .4byte 0x0000FFFF
_08002DD4:
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _08002E74
	ldr r2, [sp, #8]
	cmp r2, #2
	bne _08002E74
	mov r3, sb
	mov r0, r8
	subs r3, r3, r0
	cmp r3, #0
	ble _08002E74
	ldrh r0, [r6, #0x26]
	add r0, r8
	adds r2, r0, #0
	subs r2, #0x20
	cmp r2, #0
	ble _08002E74
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	lsls r0, r0, #1
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	lsls r0, r0, #1
	adds r4, r1, r0
	lsls r3, r3, #1
	mov sb, r3
	lsls r2, r2, #1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08002E6C @ =0x0000FFFF
	cmp r5, r1
	bne _08002E1C
	b _080035FA
_08002E1C:
	ldr r1, _08002E70 @ =0x040000D4
	asrs r3, r3, #1
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r3, r0
	mov r8, r3
	asrs r2, r2, #1
	mov ip, r2
	orrs r2, r0
	mov ip, r2
_08002E30:
	str r4, [r1]
	str r7, [r1, #4]
	mov r3, r8
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r4, #0
	add r0, sb
	str r0, [r1]
	ldr r2, [sp, #4]
	adds r2, r2, r7
	str r2, [r1, #4]
	mov r3, ip
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	ldr r3, [sp]
	ldr r0, [sp, #8]
	adds r2, r3, #0
	muls r2, r0, r2
	mov sl, r2
	add r4, sl
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _08002E6C @ =0x0000FFFF
	cmp r5, r2
	bne _08002E30
	b _080035FA
	.align 2, 0
_08002E6C: .4byte 0x0000FFFF
_08002E70: .4byte 0x040000D4
_08002E74:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08002ECC @ =0x0000FFFF
	cmp r5, r0
	bne _08002E94
	b _080035FA
_08002E94:
	ldr r1, _08002ED0 @ =0x040000D4
	movs r2, #0x80
	lsls r2, r2, #0x18
	mov r8, r2
	mov sb, r0
	ldr r0, [sp]
	adds r2, r0, #0
	muls r2, r3, r2
_08002EA4:
	str r4, [r1]
	str r7, [r1, #4]
	ldrh r0, [r6, #0x26]
	ldr r3, [sp, #8]
	muls r0, r3, r0
	asrs r0, r0, #1
	mov r3, r8
	orrs r0, r3
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	adds r4, r4, r2
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bne _08002EA4
	b _080035FA
	.align 2, 0
_08002ECC: .4byte 0x0000FFFF
_08002ED0: .4byte 0x040000D4
_08002ED4:
	ldrh r1, [r6, #0x1e]
	str r1, [sp, #0x10]
	ldrh r2, [r6, #0x20]
	str r2, [sp, #0x14]
	movs r3, #0
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _08002EE8
	b _080035FA
_08002EE8:
	ldr r4, [sp, #0x10]
	add r4, sl
	ldrh r1, [r6, #0x14]
	adds r0, r4, #0
	bl Div
	str r0, [sp, #0x18]
	ldrh r1, [r6, #0x14]
	adds r5, r0, #0
	adds r0, r5, #0
	muls r0, r1, r0
	subs r4, r4, r0
	str r4, [sp, #0x1c]
	ldrh r7, [r6, #0x28]
	mov r8, r7
	ldrh r0, [r6, #0x26]
	mov r2, sl
	subs r0, r0, r2
	subs r1, r1, r4
	cmp r1, r0
	ble _08002F14
	adds r1, r0, #0
_08002F14:
	ldr r4, [sp, #8]
	adds r3, r1, #0
	muls r3, r4, r3
	str r3, [sp, #0x20]
	movs r5, #0
	mov sb, r5
	add r1, sl
	str r1, [sp, #0x38]
	cmp sb, r8
	bge _08002FD6
_08002F28:
	ldr r4, [sp, #0x14]
	add r4, sb
	ldrh r1, [r6, #0x16]
	adds r0, r4, #0
	bl Div
	ldrh r3, [r6, #0x16]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r4, r4, r1
	subs r5, r3, r4
	ldrh r1, [r6, #0x3c]
	muls r0, r1, r0
	ldr r2, [r6, #0x38]
	ldr r7, [sp, #0x18]
	lsls r1, r7, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r2, [r6, #0x14]
	muls r0, r2, r0
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r3, [sp, #8]
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	ldrh r1, [r6, #0x24]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	mov r1, sb
	muls r1, r7, r1
	adds r0, r0, r1
	ldrh r1, [r6, #0x22]
	adds r0, r0, r1
	mov r1, sl
	muls r1, r3, r1
	adds r7, r0, r1
	add sb, r5
	cmp r5, r8
	ble _08002F8A
	mov r5, r8
_08002F8A:
	mov r2, r8
	subs r2, r2, r5
	mov r8, r2
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	beq _08002FD0
	ldr r3, _08002FE4 @ =0x040000D4
	ldr r1, [sp, #0x20]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x3c]
	orrs r2, r0
	str r2, [sp, #0x3c]
	ldr r1, [sp]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	mov ip, r0
_08002FB8:
	str r4, [r3]
	str r7, [r3, #4]
	ldr r0, [sp, #0x3c]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, ip
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _08002FB8
_08002FD0:
	ldrh r2, [r6, #0x28]
	cmp sb, r2
	blt _08002F28
_08002FD6:
	ldr r3, [sp, #0x38]
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _08002EE8
	b _080035FA
	.align 2, 0
_08002FE4: .4byte 0x040000D4
_08002FE8:
	movs r0, #0x40
	ands r0, r2
	ldrh r3, [r6, #0x30]
	ldr r7, _080030B8 @ =gBgScrollRegs
	mov sb, r7
	lsls r5, r5, #2
	mov r8, r5
	cmp r0, #0
	bne _08003034
	adds r2, r4, #0
	lsls r0, r4, #3
	ldrh r5, [r6, #0x16]
	ldrh r7, [r6, #0x32]
	cmp r3, r0
	blt _08003018
_08003006:
	lsls r1, r2, #3
	ldrh r0, [r6, #0x30]
	subs r0, r0, r1
	strh r0, [r6, #0x30]
	ldrh r1, [r6, #0x30]
	adds r2, r4, #0
	lsls r0, r4, #3
	cmp r1, r0
	bge _08003006
_08003018:
	adds r2, r5, #0
	lsls r0, r2, #3
	ldrh r3, [r6, #0x30]
	cmp r7, r0
	blt _08003034
_08003022:
	lsls r1, r2, #3
	ldrh r0, [r6, #0x32]
	subs r0, r0, r1
	strh r0, [r6, #0x32]
	ldrh r1, [r6, #0x32]
	adds r2, r5, #0
	lsls r0, r2, #3
	cmp r1, r0
	bge _08003022
_08003034:
	mov r0, r8
	add r0, sb
	movs r2, #7
	ands r3, r2
	strh r3, [r0]
	mov r1, sb
	adds r1, #2
	add r1, r8
	ldrh r0, [r6, #0x32]
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r6, #0x34]
	ldrh r4, [r6, #0x30]
	lsrs r2, r4, #3
	lsrs r0, r0, #3
	cmp r0, r2
	bne _08003064
	ldrh r1, [r6, #0x36]
	ldrh r0, [r6, #0x32]
	lsrs r1, r1, #3
	lsrs r0, r0, #3
	cmp r1, r0
	bne _08003064
	b _080035FA
_08003064:
	ldrh r1, [r6, #0x2e]
	movs r0, #0x40
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _08003072
	b _080034DC
_08003072:
	ldrh r0, [r6, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r6, #0x32]
	lsrs r0, r0, #3
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldrh r0, [r6, #0x24]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r0, [r6, #0x22]
	ldr r4, [sp, #8]
	muls r0, r4, r0
	adds r7, r1, r0
	ldrh r0, [r6, #0x26]
	ldr r5, [sp, #0x10]
	adds r2, r5, r0
	adds r1, r2, #1
	ldrh r4, [r6, #0x14]
	mov r8, r0
	cmp r1, r4
	ble _080030BC
	subs r0, r4, #1
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080030BE
	.align 2, 0
_080030B8: .4byte gBgScrollRegs
_080030BC:
	movs r2, #0
_080030BE:
	ldrh r0, [r6, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080030D4
	b _080031D0
_080030D4:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08003158
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	add r0, r8
	subs r0, #1
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _08003154 @ =0x0000FFFF
	cmp r5, r0
	bne _08003108
	b _080032C4
_08003108:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_08003112:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08003144
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_08003126:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08003126
_08003144:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _08003112
	b _080032C4
	.align 2, 0
_08003154: .4byte 0x0000FFFF
_08003158:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	add r0, r8
	subs r0, #1
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _080031CC @ =0x0000FFFF
	cmp r5, r0
	bne _08003180
	b _080032C4
_08003180:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_0800318A:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _080031BC
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0800319E:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _0800319E
_080031BC:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _0800318A
	b _080032C4
	.align 2, 0
_080031CC: .4byte 0x0000FFFF
_080031D0:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08003254
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	ldr r4, [sp, #0x10]
	adds r1, r4, #0
	muls r1, r3, r1
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _08003250 @ =0x0000FFFF
	cmp r5, r0
	beq _080032C4
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_0800320C:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _0800323E
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
_08003220:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08003220
_0800323E:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _0800320C
	b _080032C4
	.align 2, 0
_08003250: .4byte 0x0000FFFF
_08003254:
	ldr r3, [sp, #0x14]
	adds r0, r3, #0
	muls r0, r4, r0
	ldr r4, [sp, #8]
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	ldr r3, [sp, #0x10]
	adds r1, r3, #0
	muls r1, r4, r1
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _08003378 @ =0x0000FFFF
	cmp r5, r0
	beq _080032C4
	ldr r2, _0800337C @ =0x040000D4
	mov r1, sl
	asrs r0, r1, #0x10
	subs r0, #1
	mov r8, r0
	ldr r3, _08003378 @ =0x0000FFFF
	mov ip, r3
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov sb, r0
	ldr r1, [sp]
	ldr r0, [sp, #8]
	adds r3, r1, #0
	muls r3, r0, r3
_08003298:
	str r4, [r2]
	str r7, [r2, #4]
	ldrh r0, [r6, #0x26]
	mov r1, r8
	subs r0, r0, r1
	ldr r1, [sp, #8]
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r1, sb
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	adds r4, r4, r3
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _08003298
_080032C4:
	mov r1, sl
	asrs r3, r1, #0x10
	cmp r3, #0
	bne _080032CE
	b _080035FA
_080032CE:
	ldrh r0, [r6, #0x24]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r0, [r6, #0x22]
	ldrh r4, [r6, #0x14]
	adds r0, r0, r4
	ldr r5, [sp, #0x10]
	subs r0, r0, r5
	ldr r7, [sp, #8]
	muls r0, r7, r0
	adds r7, r1, r0
	ldrh r0, [r6, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r1, [r6, #0x2e]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080033F4
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08003380
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	subs r0, r3, #1
	muls r0, r2, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _08003378 @ =0x0000FFFF
	cmp r5, r3
	bne _0800332A
	b _080035FA
_0800332A:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r2, r0
	mov sb, r0
	mov sl, r3
_08003334:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _08003366
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_08003348:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _08003348
_08003366:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _08003334
	b _080035FA
	.align 2, 0
_08003378: .4byte 0x0000FFFF
_0800337C: .4byte 0x040000D4
_08003380:
	ldr r2, [sp, #0x14]
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r4, [sp, #8]
	muls r0, r4, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	subs r0, r3, #1
	muls r0, r4, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080033F0 @ =0x0000FFFF
	cmp r5, r0
	bne _080033A2
	b _080035FA
_080033A2:
	ldr r2, [sp]
	ldr r3, [sp, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_080033AE:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _080033E0
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_080033C2:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _080033C2
_080033E0:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _080033AE
	b _080035FA
	.align 2, 0
_080033F0: .4byte 0x0000FFFF
_080033F4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08003474
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08003470 @ =0x0000FFFF
	cmp r5, r0
	bne _0800341C
	b _080035FA
_0800341C:
	mov r1, sl
	str r1, [sp, #0x30]
	mov ip, r3
	ldr r0, [sp]
	adds r3, r0, #0
	muls r3, r2, r3
	mov sb, r3
_0800342A:
	movs r3, #0
	subs r5, #1
	ldr r1, [sp, #0xc]
	adds r2, r7, r1
	cmp r3, ip
	bge _0800345E
	movs r0, #0x80
	lsls r0, r0, #4
	mov sl, r0
	ldr r1, [sp, #0x30]
	asrs r1, r1, #0x10
	mov r8, r1
_08003442:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, sl
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _08003442
_0800345E:
	adds r7, r2, #0
	mov r2, sb
	subs r4, r4, r2
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _08003470 @ =0x0000FFFF
	cmp r5, r3
	bne _0800342A
	b _080035FA
	.align 2, 0
_08003470: .4byte 0x0000FFFF
_08003474:
	ldr r1, [sp, #0x14]
	adds r0, r1, #0
	muls r0, r4, r0
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080034D4 @ =0x0000FFFF
	cmp r5, r0
	bne _08003492
	b _080035FA
_08003492:
	ldr r2, _080034D8 @ =0x040000D4
	ldr r1, [sp, #8]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov r3, sb
	orrs r3, r0
	mov sb, r3
	ldr r1, [sp]
	ldr r3, [sp, #8]
	adds r0, r1, #0
	muls r0, r3, r0
	mov r8, r0
_080034B6:
	str r4, [r2]
	str r7, [r2, #4]
	mov r0, sb
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, r8
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _080034D4 @ =0x0000FFFF
	cmp r5, r3
	bne _080034B6
	b _080035FA
	.align 2, 0
_080034D4: .4byte 0x0000FFFF
_080034D8: .4byte 0x040000D4
_080034DC:
	lsrs r0, r4, #3
	ldrh r4, [r6, #0x1e]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r6, #0x32]
	lsrs r0, r0, #3
	ldrh r5, [r6, #0x20]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r7, #0
	mov sl, r7
	ldrh r0, [r6, #0x26]
	cmp sl, r0
	bge _080035FA
_08003500:
	ldr r4, [sp, #0x10]
	add r4, sl
	ldrh r1, [r6, #0x14]
	adds r0, r4, #0
	bl Div
	str r0, [sp, #0x24]
	ldrh r1, [r6, #0x14]
	adds r2, r0, #0
	adds r0, r2, #0
	muls r0, r1, r0
	subs r4, r4, r0
	str r4, [sp, #0x28]
	ldrh r3, [r6, #0x28]
	mov r8, r3
	ldrh r0, [r6, #0x26]
	mov r4, sl
	subs r0, r0, r4
	ldr r5, [sp, #0x28]
	subs r1, r1, r5
	cmp r1, r0
	ble _0800352E
	adds r1, r0, #0
_0800352E:
	ldr r0, [sp, #8]
	adds r7, r1, #0
	muls r7, r0, r7
	str r7, [sp, #0x2c]
	movs r2, #0
	mov sb, r2
	add r1, sl
	str r1, [sp, #0x34]
	cmp sb, r8
	bge _080035F0
_08003542:
	ldr r4, [sp, #0x14]
	add r4, sb
	ldrh r1, [r6, #0x16]
	adds r0, r4, #0
	bl Div
	ldrh r3, [r6, #0x16]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r4, r4, r1
	subs r5, r3, r4
	ldrh r1, [r6, #0x3c]
	muls r0, r1, r0
	ldr r2, [r6, #0x38]
	ldr r7, [sp, #0x24]
	lsls r1, r7, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r2, [r6, #0x14]
	muls r0, r2, r0
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r2, [sp, #0x28]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r3, [sp, #8]
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	ldrh r1, [r6, #0x24]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	mov r1, sb
	muls r1, r7, r1
	adds r0, r0, r1
	ldrh r1, [r6, #0x22]
	adds r0, r0, r1
	mov r1, sl
	muls r1, r3, r1
	adds r7, r0, r1
	add sb, r5
	cmp r5, r8
	ble _080035A4
	mov r5, r8
_080035A4:
	mov r2, r8
	subs r2, r2, r5
	mov r8, r2
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	beq _080035EA
	ldr r3, _08003628 @ =0x040000D4
	ldr r1, [sp, #0x2c]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x3c]
	orrs r2, r0
	str r2, [sp, #0x3c]
	ldr r1, [sp]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	mov ip, r0
_080035D2:
	str r4, [r3]
	str r7, [r3, #4]
	ldr r0, [sp, #0x3c]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, ip
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _080035D2
_080035EA:
	ldrh r2, [r6, #0x28]
	cmp sb, r2
	blt _08003542
_080035F0:
	ldr r3, [sp, #0x34]
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _08003500
_080035FA:
	ldr r0, _0800362C @ =0x04000006
	ldrh r0, [r0]
	ldrh r0, [r6, #0x30]
	strh r0, [r6, #0x34]
	ldrh r0, [r6, #0x32]
	strh r0, [r6, #0x36]
	ldr r3, _08003630 @ =gUnknown_03002AE4
	ldr r4, _08003634 @ =gUnknown_0300287C
_0800360A: @ 0x0800360A
	ldrb r0, [r3]
	ldrb r5, [r4]
	cmp r0, r5
	beq _08003616
	bl _08002B44
_08003616:
	movs r0, #1
_08003618:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08003628: .4byte 0x040000D4
_0800362C: .4byte 0x04000006
_08003630: .4byte gUnknown_03002AE4
_08003634: .4byte gUnknown_0300287C

	thumb_func_start sub_8003638
sub_8003638: @ 0x08003638
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x1c]
	ldr r1, _08003694 @ =gUnknown_03002260
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrb r0, [r3, #6]
	cmp r0, #0
	beq _080036D0
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	adds r0, #1
	movs r6, #0
	strb r0, [r2]
	movs r5, #0xff
	ldrb r1, [r3, #7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _080036D0
	strb r6, [r2]
	subs r2, #1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r1, [r3, #6]
	ands r0, r5
	cmp r1, r0
	bhi _0800367A
	strb r6, [r2]
_0800367A:
	ldrh r5, [r3, #4]
	ldrh r1, [r4, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080036AA
	ldrb r0, [r2]
	cmp r0, #0
	bne _08003698
	ldr r0, [r3, #8]
	b _080036B6
	.align 2, 0
_08003694: .4byte gUnknown_03002260
_08003698:
	ldr r1, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r1, r1, r0
	ldrb r0, [r2]
	subs r0, #1
	muls r0, r5, r0
	adds r1, r1, r0
	str r1, [r4]
	b _080036B8
_080036AA:
	ldr r0, [r4, #4]
	ldr r1, [r3, #0xc]
	adds r0, r0, r1
	ldrb r1, [r2]
	muls r1, r5, r1
	adds r0, r0, r1
_080036B6:
	str r0, [r4]
_080036B8:
	strh r5, [r4, #8]
	ldr r1, _080036D8 @ =gUnknown_030027A0
	ldr r2, _080036DC @ =gUnknown_03002A84
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
_080036D0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080036D8: .4byte gUnknown_030027A0
_080036DC: .4byte gUnknown_03002A84

	thumb_func_start sub_80036E0
sub_80036E0: @ 0x080036E0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r2, r0
	cmp r2, #0
	beq _080036F4
	movs r0, #0
	b _080037FA
_080036F4:
	adds r3, r4, #0
	adds r3, #0x21
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r1, [r3]
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r1, r0
	bne _0800370E
	ldrh r0, [r4, #0x1e]
	ldrh r1, [r4, #0xa]
	cmp r0, r1
	beq _08003724
_0800370E:
	strh r2, [r4, #8]
	ldrb r0, [r6]
	strb r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x1e]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _0800373C @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_08003724:
	ldrh r1, [r4, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08003740
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, r1, r0
	strh r0, [r4, #0x1c]
	b _080037F8
	.align 2, 0
_0800373C: .4byte 0xFFFFBFFF
_08003740:
	ldr r0, _080037E4 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	bge _080037AA
	ldr r7, _080037E8 @ =gUnknown_08097A74
_08003764:
	mvns r0, r0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r1, r0, #0
	cmp r1, #1
	beq _0800379E
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080037EC
	ldr r0, _080037E4 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	adds r5, r1, #0
_0800379E:
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	blt _08003764
_080037AA:
	ldr r0, [r3]
	lsls r0, r0, #8
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r0, [r4, #0x1c]
	ldr r2, [r3, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080037F0
	ldr r0, _080037E4 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	b _080037F2
	.align 2, 0
_080037E4: .4byte gUnknown_03002794
_080037E8: .4byte gUnknown_08097A74
_080037EC:
	adds r0, r1, #0
	b _080037FA
_080037F0:
	str r2, [r4, #0xc]
_080037F2:
	ldrh r0, [r4, #0x14]
	adds r0, #2
	strh r0, [r4, #0x14]
_080037F8:
	movs r0, #1
_080037FA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8003800
sub_8003800: @ 0x08003800
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0800385C
	ldr r1, [r2, #4]
	cmp r1, #0
	bge _08003834
	ldr r0, _08003830 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0, #0x14]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [r2, #8]
	lsls r0, r0, #6
	b _08003844
	.align 2, 0
_08003830: .4byte gUnknown_03002794
_08003834:
	ldr r0, _08003864 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0x10]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [r2, #8]
	lsls r0, r0, #5
_08003844:
	strh r0, [r3, #8]
	ldr r1, _08003868 @ =gUnknown_030027A0
	ldr r2, _0800386C @ =gUnknown_03002A84
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r3, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
_0800385C:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08003864: .4byte gUnknown_03002794
_08003868: .4byte gUnknown_030027A0
_0800386C: .4byte gUnknown_03002A84

	thumb_func_start sub_8003870
sub_8003870: @ 0x08003870
	push {r4, lr}
	adds r4, r1, #0
	ldr r3, [r0, #4]
	movs r1, #0xf
	ands r3, r1
	ldrh r1, [r4, #0x14]
	adds r1, #3
	strh r1, [r4, #0x14]
	ldr r2, _080038AC @ =0x040000D4
	adds r1, r0, #4
	str r1, [r2]
	lsls r3, r3, #3
	adds r1, r3, #0
	adds r1, #0x28
	adds r1, r4, r1
	str r1, [r2, #4]
	ldr r1, _080038B0 @ =0x84000002
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080038B4
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	b _0800390A
	.align 2, 0
_080038AC: .4byte 0x040000D4
_080038B0: .4byte 0x84000002
_080038B4:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080038E2
	adds r2, r4, r3
	movs r0, #0x2d
	adds r0, r0, r2
	mov ip, r0
	adds r2, #0x2f
	ldrb r1, [r0]
	ldrb r0, [r2]
	eors r1, r0
	mov r0, ip
	strb r1, [r0]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	mov r2, ip
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_080038E2:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0800390A
	adds r2, r4, r3
	adds r3, r2, #0
	adds r3, #0x2c
	adds r2, #0x2e
	ldrb r1, [r3]
	ldrb r0, [r2]
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	strb r0, [r3]
_0800390A:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8003914
sub_8003914: @ 0x08003914
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, _08003994 @ =gUnknown_03004D10
	ldr r1, _08003998 @ =gUnknown_03005390
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	str r6, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080039D6
	mov r8, r1
	ldr r0, [r6, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #9
	ands r0, r1
	lsrs r7, r0, #0xf
	cmp r7, #1
	bls _080039A4
	ldr r0, _0800399C @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080039A4
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #0x10
	bl DivRem
	ldr r5, _080039A0 @ =gBgAffineRegs
	subs r4, r7, #2
	lsls r4, r4, #4
	adds r1, r5, #0
	adds r1, #8
	adds r1, r4, r1
	lsls r0, r0, #8
	str r0, [r1]
	mov r1, r8
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #8
	bl DivRem
	adds r5, #0xc
	adds r4, r4, r5
	lsls r0, r0, #8
	str r0, [r4]
	b _080039D6
	.align 2, 0
_08003994: .4byte gUnknown_03004D10
_08003998: .4byte gUnknown_03005390
_0800399C: .4byte gDispCnt
_080039A0: .4byte gBgAffineRegs
_080039A4:
	mov r1, r8
	movs r2, #8
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #0x10
	bl DivRem
	ldr r4, _080039E0 @ =gBgScrollRegs
	lsls r5, r7, #2
	adds r1, r5, r4
	strh r0, [r1]
	mov r1, r8
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	subs r0, r0, r1
	movs r1, #8
	bl DivRem
	adds r4, #2
	adds r5, r5, r4
	strh r0, [r5]
_080039D6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080039E0: .4byte gBgScrollRegs

	thumb_func_start sub_80039E4
sub_80039E4: @ 0x080039E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	movs r0, #5
	str r0, [sp, #0x28]
	ldr r0, _08003A04 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08003A08
	movs r0, #0
	b _08003ECA
	.align 2, 0
_08003A04: .4byte 0x04000004
_08003A08:
	ldr r0, _08003BA4 @ =gUnknown_03005390
	ldrb r1, [r0]
	cmp r1, #0
	bne _08003A12
	b _08003EC8
_08003A12:
	movs r5, #0
	cmp r5, r1
	blo _08003A1A
	b _08003EC2
_08003A1A:
	lsls r0, r5, #2
	ldr r1, _08003BA8 @ =gUnknown_03004D10
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	adds r2, r5, #1
	str r2, [sp, #0x3c]
	cmp r1, r0
	bne _08003A34
	b _08003EB2
_08003A34:
	mov sl, r1
	ldr r3, [sp, #0xc]
	ldr r0, [r3, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #9
	ands r0, r1
	lsrs r3, r0, #0xf
	lsls r0, r3, #1
	ldr r4, _08003BAC @ =gBgCntRegs
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r0, #0xc
	ands r0, r2
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [sp, #0x14]
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	str r0, [sp, #0x18]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08003A70
	movs r6, #6
	str r6, [sp, #0x28]
_08003A70:
	cmp r3, #1
	bhi _08003A76
	b _08003C2C
_08003A76:
	ldr r7, _08003BB0 @ =gDispCnt
	ldrh r1, [r7]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08003A84
	b _08003C2C
_08003A84:
	lsrs r1, r2, #0xe
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r1
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, _08003BB4 @ =gUnknown_03002794
	ldr r1, [r0]
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	mov r3, sl
	ldrb r1, [r3, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r4, [sp, #0x1c]
	adds r4, r4, r0
	str r4, [sp, #0x1c]
	movs r5, #0
	str r5, [sp, #8]
	ldrh r6, [r3, #2]
	cmp r5, r6
	blo _08003ABE
	b _08003EB2
_08003ABE:
	mov sb, sp
	ldr r7, [sp, #0x10]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x30]
_08003AC8:
	ldr r0, [sp, #0x1c]
	ldr r1, _08003BB8 @ =0x040000D4
	str r0, [r1]
	mov r2, sp
	str r2, [r1, #4]
	ldr r0, _08003BBC @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, [sp, #0x1c]
	adds r3, #6
	str r3, [sp, #0x1c]
	mov r4, sb
	ldrh r3, [r4]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r1, r3
	lsrs r1, r1, #0xc
	ldrh r2, [r4, #2]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r2
	lsrs r0, r0, #0xe
	orrs r1, r0
	lsls r1, r1, #1
	ldr r5, _08003BC0 @ =gUnknown_080984DC
	adds r0, r1, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	str r0, [sp, #0x20]
	ldr r6, _08003BC4 @ =gUnknown_080984DD
	adds r1, r1, r6
	ldrb r0, [r1]
	lsrs r0, r0, #3
	mov ip, r0
	mov r4, ip
	ldr r7, [sp, #0xc]
	movs r0, #0x18
	ldrsh r1, [r7, r0]
	mov r2, sl
	movs r5, #0xa
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	movs r6, #0x16
	ldrsh r1, [r7, r6]
	movs r7, #8
	ldrsh r0, [r2, r7]
	subs r1, r1, r0
	mov r8, r1
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r1, r0
	mov r8, r1
	movs r0, #0xff
	ands r0, r3
	adds r0, r5, r0
	asrs r0, r0, #3
	ldr r2, [sp, #0x10]
	muls r0, r2, r0
	ldr r3, [sp, #0x18]
	adds r7, r3, r0
	ldr r5, [sp, #0xc]
	ldr r1, [r5, #4]
	ldr r6, [sp, #0x14]
	subs r1, r1, r6
	ldr r0, [sp, #0x28]
	lsrs r1, r0
	mov r3, sb
	ldrh r2, [r3, #4]
	ldr r0, _08003BC8 @ =0x000003FF
	ands r0, r2
	adds r5, r1, r0
	movs r6, #0xff
	ands r5, r6
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #0x40]
	cmp r4, #0
	beq _08003C18
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x34]
_08003B74:
	mov r2, sb
	ldrh r0, [r2, #2]
	ldr r1, _08003BCC @ =0x000001FF
	ands r1, r0
	add r1, r8
	asrs r1, r1, #3
	adds r2, r7, r1
	ldr r0, [sp, #0x20]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r6, ip
	subs r6, #1
	ldr r4, [sp, #0x20]
	cmp r4, #0
	beq _08003BF2
	movs r4, #1
_08003B96:
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _08003BD0
	str r5, [sp, #0x24]
	b _08003BDE
	.align 2, 0
_08003BA4: .4byte gUnknown_03005390
_08003BA8: .4byte gUnknown_03004D10
_08003BAC: .4byte gBgCntRegs
_08003BB0: .4byte gDispCnt
_08003BB4: .4byte gUnknown_03002794
_08003BB8: .4byte 0x040000D4
_08003BBC: .4byte 0x80000003
_08003BC0: .4byte gUnknown_080984DC
_08003BC4: .4byte gUnknown_080984DD
_08003BC8: .4byte 0x000003FF
_08003BCC: .4byte 0x000001FF
_08003BD0:
	lsls r0, r5, #8
	ldr r1, [sp, #0x24]
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	strh r0, [r2]
_08003BDE:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r2, #1
	adds r1, r3, #0
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r1, #0
	bne _08003B96
_08003BF2:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08003C08
	ldrh r1, [r2]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	ldr r1, [sp, #0x24]
	orrs r0, r1
	strh r0, [r2]
_08003C08:
	ldr r2, [sp, #0x34]
	adds r7, r7, r2
	mov r1, ip
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r1, #0
	bne _08003B74
_08003C18:
	ldr r3, [sp, #0x40]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r4, sl
	ldrh r4, [r4, #2]
	cmp r0, r4
	bhs _08003C2A
	b _08003AC8
_08003C2A:
	b _08003EB2
_08003C2C:
	movs r6, #0x20
	str r6, [sp, #0x10]
	lsls r0, r3, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r1, r0, #0xe
	subs r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08003C46
	movs r7, #0x40
	str r7, [sp, #0x10]
_08003C46:
	ldr r0, _08003D14 @ =gUnknown_03002794
	ldr r1, [r0]
	ldr r2, [sp, #0xc]
	ldrh r0, [r2, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	mov r3, sl
	ldrb r1, [r3, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r4, [sp, #0x1c]
	adds r4, r4, r0
	str r4, [sp, #0x1c]
	movs r6, #0
	str r6, [sp, #8]
	adds r5, #1
	str r5, [sp, #0x3c]
	ldrh r7, [r3, #2]
	cmp r6, r7
	blo _08003C78
	b _08003EB2
_08003C78:
	mov sb, sp
_08003C7A:
	ldr r0, [sp, #0x1c]
	ldr r1, _08003D18 @ =0x040000D4
	str r0, [r1]
	mov r2, sp
	str r2, [r1, #4]
	ldr r0, _08003D1C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, [sp, #0x1c]
	adds r3, #6
	str r3, [sp, #0x1c]
	mov r4, sb
	ldrh r2, [r4]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r1, r2
	lsrs r1, r1, #0xc
	ldrh r3, [r4, #2]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r3
	lsrs r0, r0, #0xe
	orrs r1, r0
	lsls r1, r1, #1
	ldr r5, _08003D20 @ =gUnknown_080984DC
	adds r0, r1, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	str r0, [sp, #0x20]
	ldr r6, _08003D24 @ =gUnknown_080984DD
	adds r1, r1, r6
	ldrb r0, [r1]
	lsrs r0, r0, #3
	mov ip, r0
	ldr r4, _08003D28 @ =0x000001FF
	ands r4, r3
	movs r6, #0xff
	ands r6, r2
	ldr r0, [sp, #0xc]
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	mov r7, sb
	ldrh r7, [r7, #4]
	adds r0, r0, r7
	mov r1, sb
	strh r0, [r1, #4]
	ldr r2, [sp, #0xc]
	ldr r1, [r2, #0x10]
	lsrs r1, r1, #0xb
	mov r5, sl
	ldrb r0, [r5]
	lsrs r0, r0, #1
	eors r0, r1
	movs r7, #1
	ands r0, r7
	cmp r0, #0
	beq _08003D4A
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	eors r0, r3
	mov r2, sb
	strh r0, [r2, #2]
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08003D2C
	ldr r3, [sp, #0xc]
	movs r5, #0x18
	ldrsh r0, [r3, r5]
	mov r7, sl
	movs r2, #0xa
	ldrsh r1, [r7, r2]
	b _08003D3C
	.align 2, 0
_08003D14: .4byte gUnknown_03002794
_08003D18: .4byte 0x040000D4
_08003D1C: .4byte 0x80000003
_08003D20: .4byte gUnknown_080984DC
_08003D24: .4byte gUnknown_080984DD
_08003D28: .4byte 0x000001FF
_08003D2C:
	ldr r3, [sp, #0xc]
	movs r5, #0x18
	ldrsh r0, [r3, r5]
	mov r7, sl
	ldrh r1, [r7, #6]
	movs r3, #0xa
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
_08003D3C:
	adds r0, r0, r1
	adds r5, r0, #0
	subs r5, #8
	lsls r0, r6, #0x10
	rsbs r0, r0, #0
	lsrs r6, r0, #0x10
	b _08003D58
_08003D4A:
	ldr r5, [sp, #0xc]
	movs r7, #0x18
	ldrsh r1, [r5, r7]
	mov r2, sl
	movs r3, #0xa
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
_08003D58:
	ldr r7, [sp, #0xc]
	ldr r0, [r7, #0x10]
	lsrs r0, r0, #0xa
	movs r3, #1
	ands r0, r3
	mov r1, sl
	ldrb r2, [r1]
	adds r1, r3, #0
	ands r1, r2
	cmp r0, r1
	beq _08003DB4
	mov r2, sb
	ldrh r0, [r2, #2]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r1, r7, #0
	eors r0, r1
	strh r0, [r2, #2]
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08003D96
	ldr r1, [sp, #0xc]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	mov r3, sl
	movs r7, #8
	ldrsh r1, [r3, r7]
	b _08003DA6
_08003D96:
	ldr r1, [sp, #0xc]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	mov r3, sl
	ldrh r1, [r3, #4]
	movs r7, #8
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
_08003DA6:
	adds r0, r0, r1
	subs r0, #8
	mov r8, r0
	lsls r0, r4, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x10
	b _08003DC4
_08003DB4:
	ldr r0, [sp, #0xc]
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	mov r3, sl
	movs r7, #8
	ldrsh r0, [r3, r7]
	subs r1, r1, r0
	mov r8, r1
_08003DC4:
	movs r0, #0x10
	rsbs r0, r0, #0
	mov r1, r8
	ands r1, r0
	mov r8, r1
	adds r0, #8
	ands r5, r0
	mov r2, sb
	ldrh r1, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	movs r3, #2
	str r3, [sp, #0x2c]
	cmp r0, #0
	beq _08003DE8
	movs r7, #0xfe
	str r7, [sp, #0x2c]
_08003DE8:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08003DFA
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x19
	rsbs r0, r0, #0
	b _08003DFE
_08003DFA:
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x19
_08003DFE:
	lsrs r0, r0, #0x18
	str r0, [sp, #0x30]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, r5, r0
	asrs r0, r0, #2
	ldr r3, [sp, #0x10]
	muls r0, r3, r0
	ldr r5, [sp, #0x18]
	adds r7, r5, r0
	ldr r6, [sp, #0xc]
	ldr r1, [r6, #4]
	ldr r0, [sp, #0x14]
	subs r1, r1, r0
	ldr r2, [sp, #0x28]
	lsrs r1, r2
	mov r3, sb
	ldrh r2, [r3, #4]
	ldr r0, _08003EDC @ =0x0000F3FF
	ands r0, r2
	adds r1, r1, r0
	ldrh r2, [r3, #2]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r2
	lsrs r0, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	mov r1, ip
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r6, [sp, #8]
	adds r6, #1
	str r6, [sp, #0x40]
	cmp r1, #0
	beq _08003EA0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	asrs r0, r0, #2
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
_08003E5E:
	ldr r3, [sp, #0x38]
	adds r2, r7, r3
	ldr r0, [sp, #0x20]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r6, ip
	subs r6, #1
	ldr r4, [sp, #0x20]
	cmp r4, #0
	beq _08003E92
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
_08003E7A:
	adds r1, r5, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	strh r1, [r2]
	adds r2, r2, r4
	adds r1, r3, #0
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r1, #0
	bne _08003E7A
_08003E92:
	add r7, r8
	mov r1, ip
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r1, #0
	bne _08003E5E
_08003EA0:
	ldr r2, [sp, #0x40]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	mov r3, sl
	ldrh r3, [r3, #2]
	cmp r0, r3
	bhs _08003EB2
	b _08003C7A
_08003EB2:
	ldr r4, [sp, #0x3c]
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08003EE0 @ =gUnknown_03005390
	ldrb r6, [r6]
	cmp r5, r6
	bhs _08003EC2
	b _08003A1A
_08003EC2:
	movs r0, #0
	ldr r7, _08003EE0 @ =gUnknown_03005390
	strb r0, [r7]
_08003EC8:
	movs r0, #1
_08003ECA:
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08003EDC: .4byte 0x0000F3FF
_08003EE0: .4byte gUnknown_03005390

	thumb_func_start sub_8003EE4
sub_8003EE4: @ 0x08003EE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	mov sb, r1
	adds r5, r2, #0
	ldr r0, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	ldr r1, [sp, #0x34]
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r2, r8
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r7, #0x80
	lsls r7, r7, #9
	mov r3, sb
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov sb, r3
	adds r0, r7, #0
	mov r1, sb
	bl Div
	ldr r1, _0800400C @ =gSineTable
	mov sl, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, sl
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	str r1, [sp, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r3, [sp, #0x38]
	strh r0, [r3]
	adds r0, r7, #0
	mov r1, sb
	bl Div
	lsls r4, r4, #1
	add r4, sl
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r1, [sp, #0x38]
	strh r0, [r1, #2]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r7, #0
	adds r1, r5, #0
	bl Div
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	asrs r1, r1, #6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r3, [sp, #0x38]
	strh r0, [r3, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp, #8]
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r2, [sp, #0x38]
	strh r0, [r2, #6]
	lsls r6, r6, #0x10
	rsbs r6, r6, #0
	mov r3, r8
	lsls r3, r3, #0x10
	rsbs r3, r3, #0
	mov r8, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	asrs r6, r6, #0x10
	adds r1, r0, #0
	muls r1, r6, r1
	movs r3, #2
	ldrsh r0, [r2, r3]
	mov r2, r8
	asrs r2, r2, #0x10
	mov r8, r2
	mov r3, r8
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r1, r0
	ldr r0, [sp]
	lsls r3, r0, #0x10
	asrs r3, r3, #8
	adds r1, r1, r3
	ldr r2, [sp, #0x38]
	str r1, [r2, #8]
	movs r3, #4
	ldrsh r0, [r2, r3]
	adds r1, r0, #0
	muls r1, r6, r1
	movs r3, #6
	ldrsh r0, [r2, r3]
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r1, r1, r0
	ldr r3, [sp, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x38]
	str r1, [r0, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800400C: .4byte gSineTable

	thumb_func_start sub_8004010
sub_8004010: @ 0x08004010
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	mov r8, r0
	mov r1, sp
	str r1, [sp, #0x10]
_08004024:
	mov r2, r8
	lsls r0, r2, #2
	ldr r1, _080040DC @ =gUnknown_03002280
	adds r1, #1
	adds r4, r0, r1
	ldr r6, _080040E0 @ =gUnknown_03002280 + 3
	adds r6, r0, r6
	str r6, [sp, #0xc]
	ldrb r1, [r4]
	ldrb r2, [r6]
	mov ip, r2
	mov sl, r0
	cmp r1, ip
	bne _08004056
	ldr r0, _080040DC @ =gUnknown_03002280
	add r0, sl
	ldr r1, _080040E4 @ =gUnknown_03002280 + 2
	add r1, sl
	ldrb r0, [r0]
	mov r7, r8
	adds r7, #1
	ldrb r1, [r1]
	cmp r0, r1
	bne _08004056
	b _08004242
_08004056:
	ldr r2, _080040E8 @ =gBgCntRegs
	mov r6, r8
	lsls r3, r6, #1
	adds r0, r3, r2
	ldrh r6, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r4, [r4]
	ldr r0, _080040DC @ =gUnknown_03002280
	add r0, sl
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r7, r2, #0
	adds r2, r3, #0
	mov r0, r8
	cmp r0, #1
	bls _08004168
	ldr r0, _080040EC @ =gDispCnt
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08004168
	ldr r1, [sp, #8]
	adds r5, r5, r1
	lsrs r2, r6, #0xe
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r2
	lsrs r3, r0, #0x10
	mov r2, ip
	cmp r2, #0xff
	bne _080040F8
	ldr r0, _080040F0 @ =gUnknown_03004D80
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	ldr r2, _080040F4 @ =0x040000D4
	str r1, [r2]
	str r0, [r2, #4]
	ldr r6, [sp, #0xc]
	ldrb r0, [r6]
	subs r0, r0, r4
	muls r0, r3, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x81
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	add r2, sp, #4
	mov sb, r2
	b _080041C0
	.align 2, 0
_080040DC: .4byte gUnknown_03002280
_080040E0: .4byte gUnknown_03002280 + 3
_080040E4: .4byte gUnknown_03002280 + 2
_080040E8: .4byte gBgCntRegs
_080040EC: .4byte gDispCnt
_080040F0: .4byte gUnknown_03004D80
_080040F4: .4byte 0x040000D4
_080040F8:
	add r6, sp, #4
	mov sb, r6
	mov r7, r8
	adds r7, #1
	cmp r4, ip
	bls _08004106
	b _0800422C
_08004106:
	ldr r0, _0800415C @ =gUnknown_03004D80
	add r0, r8
	mov ip, r0
	ldr r2, _08004160 @ =0x040000D4
	ldr r1, _08004164 @ =gUnknown_03002280 + 2
	add r1, sl
	mov r8, r1
	ldr r6, [sp, #0xc]
	str r6, [sp, #0x14]
_08004118:
	mov r0, ip
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, r8
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, #1
	asrs r1, r0, #1
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r6, #0x81
	lsls r6, r6, #0x18
	orrs r1, r6
	str r1, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r4, r0
	bls _08004118
	b _0800422C
	.align 2, 0
_0800415C: .4byte gUnknown_03004D80
_08004160: .4byte 0x040000D4
_08004164: .4byte gUnknown_03002280 + 2
_08004168:
	ldr r1, [sp, #8]
	lsls r0, r1, #1
	adds r5, r5, r0
	movs r3, #0x20
	adds r0, r2, r7
	ldrh r0, [r0]
	lsrs r2, r0, #0xe
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08004182
	movs r3, #0x40
_08004182:
	ldr r1, _080041C8 @ =gUnknown_03002280 + 2
	add r1, sl
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080041D8
	ldr r0, _080041CC @ =gUnknown_03004D80
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r3, #1
	muls r0, r4, r0
	adds r0, r5, r0
	ldr r2, [sp, #0x10]
	strh r1, [r2]
	mov r6, sp
	ldr r1, _080041D0 @ =0x040000D4
	str r6, [r1]
	str r0, [r1, #4]
	ldr r0, _080041D4 @ =gUnknown_03002280 + 3
	add r0, sl
	ldrb r0, [r0]
	subs r0, r0, r4
	muls r0, r3, r0
	lsls r0, r0, #1
	asrs r0, r0, #1
	movs r2, #0x81
	lsls r2, r2, #0x18
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add r6, sp, #4
	mov sb, r6
_080041C0:
	mov r7, r8
	adds r7, #1
	b _0800422C
	.align 2, 0
_080041C8: .4byte gUnknown_03002280 + 2
_080041CC: .4byte gUnknown_03004D80
_080041D0: .4byte 0x040000D4
_080041D4: .4byte gUnknown_03002280 + 3
_080041D8:
	ldr r0, _08004260 @ =gUnknown_03002280 + 3
	add r0, sl
	add r2, sp, #4
	mov sb, r2
	mov r7, r8
	adds r7, #1
	ldrb r6, [r0]
	cmp r4, r6
	bhi _0800422C
	ldr r2, _08004264 @ =gUnknown_03004D80
	add r8, r2
	ldr r2, _08004268 @ =0x040000D4
	mov ip, r1
	str r0, [sp, #0x14]
	lsls r3, r3, #1
_080041F6:
	mov r6, r8
	ldrb r1, [r6]
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, ip
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, #1
	movs r6, #0x81
	lsls r6, r6, #0x18
	orrs r0, r6
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r4, r0
	bls _080041F6
_0800422C:
	movs r0, #0
	str r0, [sp, #4]
	mov r1, sb
	ldr r2, _08004268 @ =0x040000D4
	str r1, [r2]
	ldr r0, _0800426C @ =gUnknown_03002280
	add r0, sl
	str r0, [r2, #4]
	ldr r0, _08004270 @ =0x85000001
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08004242:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _0800424E
	b _08004024
_0800424E:
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004260: .4byte gUnknown_03002280 + 3
_08004264: .4byte gUnknown_03004D80
_08004268: .4byte 0x040000D4
_0800426C: .4byte gUnknown_03002280
_08004270: .4byte 0x85000001

	thumb_func_start sub_8004274
sub_8004274: @ 0x08004274
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	ldr r0, [sp, #0x24]
	ldr r7, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r5, #0
	ldr r1, _08004310 @ =gBgCntRegs
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r0, #0xc
	ands r0, r4
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	mov r8, r0
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	lsrs r3, r3, #0xa
	adds r0, r0, r3
	lsrs r2, r2, #0xf
	adds r6, r0, r2
	ldrb r0, [r7]
	cmp r0, #0
	beq _080042FE
_080042C6:
	lsls r4, r5, #5
	ldr r0, [sp]
	adds r4, r0, r4
	adds r0, r7, r5
	ldrb r0, [r0]
	lsls r0, r0, #5
	add r0, sl
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	mov r2, r8
	subs r4, r4, r2
	lsls r4, r4, #0xb
	lsrs r4, r4, #0x10
	lsls r1, r5, #1
	adds r1, r6, r1
	mov r2, sb
	lsls r0, r2, #0xc
	orrs r4, r0
	strh r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080042C6
_080042FE:
	lsls r0, r5, #5
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004310: .4byte gBgCntRegs

	thumb_func_start sub_8004314
sub_8004314: @ 0x08004314
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _08004368
	ldr r1, [r4, #4]
	ldr r2, _08004370 @ =0x040000D4
	ldr r0, _08004374 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08004378 @ =gBgPalette
	adds r0, r0, r1
	str r0, [r2, #4]
	ldrh r0, [r4, #8]
	asrs r0, r0, #1
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _0800437C @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
_08004368:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08004370: .4byte 0x040000D4
_08004374: .4byte gUnknown_03002794
_08004378: .4byte gBgPalette
_0800437C: .4byte gFlags

	thumb_func_start sub_8004380
sub_8004380: @ 0x08004380
	ldr r2, [r0, #4]
	ldrh r0, [r1, #0x14]
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr

	thumb_func_start sub_800438C
sub_800438C: @ 0x0800438C
	ldr r0, [r1, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r0, r2
	str r0, [r1, #0x10]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_800439C
sub_800439C: @ 0x0800439C
	push {lr}
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r0, [r0, #4]
	bl m4aSongNumStart
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_80043B0
sub_80043B0: @ 0x080043B0
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	ldrh r3, [r1, #0x16]
	adds r2, r2, r3
	strh r2, [r1, #0x16]
	ldrh r0, [r0, #6]
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	strh r0, [r1, #0x18]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_80043CC
sub_80043CC: @ 0x080043CC
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_80043D8
sub_80043D8: @ 0x080043D8
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	strh r2, [r1, #0xa]
	adds r3, r1, #0
	adds r3, #0x21
	movs r2, #0xff
	strb r2, [r3]
	ldrh r0, [r0, #6]
	adds r1, #0x20
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_80043F8
sub_80043F8: @ 0x080043F8
	ldrh r2, [r1, #0x14]
	adds r2, #4
	strh r2, [r1, #0x14]
	bx lr

	thumb_func_start sub_8004400
sub_8004400: @ 0x08004400
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_800440C
sub_800440C: @ 0x0800440C
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_8004418
sub_8004418: @ 0x08004418
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r6, #0
	ldr r1, _08004448 @ =gUnknown_080984A4
	mov r0, sp
	movs r2, #8
	bl memcpy
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r0, r1, #0
	orrs r0, r2
	cmp r0, #0
	bne _0800444C
	movs r0, #1
	rsbs r0, r0, #0
	b _080044CE
	.align 2, 0
_08004448: .4byte gUnknown_080984A4
_0800444C:
	cmp r1, #0
	bgt _08004458
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #4
_08004458:
	cmp r2, #0
	bgt _08004468
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08004468:
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	blt _08004488
	lsls r0, r1, #0x17
	lsrs r5, r0, #0x10
	cmp r2, #0
	bne _08004480
	adds r2, r5, #0
	b _080044A6
_08004480:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r1, r2, #0
	b _0800449E
_08004488:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r2, #0x17
	lsrs r4, r0, #0x10
	cmp r1, #0
	bne _0800449A
	adds r2, r4, #0
	b _080044A6
_0800449A:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
_0800449E:
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080044A6:
	mov r0, sp
	adds r3, r0, r6
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080044C0
	movs r1, #0x80
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
_080044C0:
	ldrb r1, [r3]
	lsls r1, r1, #7
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
_080044CE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80044D8
sub_80044D8: @ 0x080044D8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r2, #0
	movs r5, #0xf0
	lsls r5, r5, #8
_080044E6:
	adds r0, r3, #0
	ands r0, r5
	lsrs r0, r0, #0xc
	cmp r0, #9
	bls _080044F6
	adds r1, r4, r2
	adds r0, #0x57
	b _080044FA
_080044F6:
	adds r1, r4, r2
	adds r0, #0x30
_080044FA:
	strb r0, [r1]
	lsls r0, r3, #0x14
	lsrs r3, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080044E6
	adds r1, r4, r2
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8004518
sub_8004518: @ 0x08004518
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	movs r5, #0
_08004522:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r5, #2
	lsls r1, r0
	orrs r6, r1
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08004522
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

@ matched as sub_08153D78 in katam
	thumb_func_start sub_8004558
sub_8004558: @ 0x08004558
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x21
	adds r2, r4, #0
	adds r2, #0x20
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08004574
	ldrh r0, [r4, #0x1e]
	ldrh r1, [r4, #0xa]
	cmp r0, r1
	beq _0800458C
_08004574:
	movs r1, #0
	strh r1, [r4, #8]
	ldrb r0, [r2]
	strb r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x1e]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _0800459C @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_0800458C:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080045A0
	movs r0, #0
	b _0800467A
	.align 2, 0
_0800459C: .4byte 0xFFFFBFFF
_080045A0:
	ldrh r1, [r4, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080045B8
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, r1, r0
	strh r0, [r4, #0x1c]
	b _08004678
_080045B8:
	ldr r0, _08004664 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	adds r6, r1, #0
	cmp r0, #0
	bge _08004628
	ldr r7, _08004668 @ =gUnknown_080984AC
_080045E2:
	mvns r0, r0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl _call_via_r2
	adds r1, r0, #0
	cmp r1, #1
	beq _0800461C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800466C
	ldr r0, _08004664 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	adds r5, r2, #0
_0800461C:
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	blt _080045E2
_08004628:
	ldr r0, [r3]
	lsls r0, r0, #8
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r0, [r4, #0x1c]
	ldr r2, [r3, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _08004670
	ldr r0, _08004664 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	b _08004672
	.align 2, 0
_08004664: .4byte gUnknown_03002794
_08004668: .4byte gUnknown_080984AC
_0800466C:
	adds r0, r1, #0
	b _0800467A
_08004670:
	str r2, [r4, #0xc]
_08004672:
	ldrh r0, [r4, #0x14]
	adds r0, #2
	strh r0, [r4, #0x14]
_08004678:
	movs r0, #1
_0800467A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8004680
sub_8004680: @ 0x08004680
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _080046DC
	ldr r1, [r2, #4]
	cmp r1, #0
	bge _080046B4
	ldr r0, _080046B0 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0, #0x14]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [r2, #8]
	lsls r0, r0, #6
	b _080046C4
	.align 2, 0
_080046B0: .4byte gUnknown_03002794
_080046B4:
	ldr r0, _080046E4 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0x10]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [r2, #8]
	lsls r0, r0, #5
_080046C4:
	strh r0, [r3, #8]
	ldr r1, _080046E8 @ =gUnknown_030027A0
	ldr r2, _080046EC @ =gUnknown_03002A84
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r3, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
_080046DC:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080046E4: .4byte gUnknown_03002794
_080046E8: .4byte gUnknown_030027A0
_080046EC: .4byte gUnknown_03002A84

	thumb_func_start sub_80046F0
sub_80046F0: @ 0x080046F0
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r3, [r0, #4]
	movs r1, #0xf
	ands r3, r1
	ldrh r1, [r4, #0x14]
	adds r1, #3
	strh r1, [r4, #0x14]
	ldr r2, _0800472C @ =0x040000D4
	adds r1, r0, #4
	str r1, [r2]
	lsls r3, r3, #3
	adds r1, r3, #0
	adds r1, #0x28
	adds r1, r4, r1
	str r1, [r2, #4]
	ldr r1, _08004730 @ =0x84000002
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _08004734
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	b _08004798
	.align 2, 0
_0800472C: .4byte 0x040000D4
_08004730: .4byte 0x84000002
_08004734:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08004768
	adds r2, r4, r3
	movs r0, #0x2d
	adds r0, r0, r2
	mov ip, r0
	adds r2, #0x2f
	ldrb r1, [r0]
	ldrb r0, [r2]
	eors r1, r0
	mov r5, ip
	strb r1, [r5]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r5]
	eors r0, r1
	rsbs r0, r0, #0
	strb r0, [r5]
	ldrb r0, [r2]
	rsbs r0, r0, #0
	strb r0, [r2]
_08004768:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08004798
	adds r2, r4, r3
	adds r3, r2, #0
	adds r3, #0x2c
	adds r2, #0x2e
	ldrb r1, [r3]
	ldrb r0, [r2]
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	rsbs r0, r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	rsbs r0, r0, #0
	strb r0, [r2]
_08004798:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_80047A0
sub_80047A0: @ 0x080047A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0xb
	ldr r0, _08004858 @ =gUnknown_03004D96
	adds r6, r6, r0
	movs r0, #0x80
	lsls r0, r0, #9
	mov sl, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	bl Div
	ldr r7, _0800485C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	mov sb, r1
	mov r1, sb
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov sb, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #8
	strh r0, [r6]
	mov r0, sl
	mov r1, r8
	bl Div
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6, #8]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	adds r1, r5, #0
	bl Div
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	asrs r1, r1, #6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6, #0x10]
	mov r0, sl
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004858: .4byte gUnknown_03004D96
_0800485C: .4byte gSineTable

	thumb_func_start sub_8004860
sub_8004860: @ 0x08004860
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	adds r6, r1, #0
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800487C
	b _08004AAA
_0800487C:
	mov r8, r1
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _08004A14 @ =gUnknown_03004D96
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28]
	ldr r2, _08004A18 @ =gSineTable
	ldrh r0, [r6]
	ldr r1, _08004A1C @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r7, [sp, #0x28]
	strh r0, [r7]
	movs r0, #0xa
	add r0, sp
	mov sl, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r1, sl
	strh r0, [r1]
	add r7, sp, #0xc
	ldrh r0, [r6, #2]
	strh r0, [r7]
	movs r2, #0xe
	add r2, sp
	mov sb, r2
	ldrh r0, [r6, #4]
	strh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, sl
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, sl
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r2, [sp, #0x28]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	ldrh r0, [r6, #2]
	movs r3, #2
	ldrsh r5, [r6, r3]
	cmp r5, #0
	bge _08004966
	rsbs r0, r0, #0
	strh r0, [r7]
_08004966:
	movs r1, #4
	ldrsh r0, [r6, r1]
	ldrh r2, [r6, #4]
	mov ip, r2
	cmp r0, #0
	bge _0800497A
	mov r3, ip
	rsbs r0, r3, #0
	mov r1, sb
	strh r0, [r1]
_0800497A:
	mov r2, sp
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	mov r4, sp
	adds r4, #2
	mov r0, sl
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	add r3, sp, #4
	mov r2, sl
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r7, sb
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	mov r2, sp
	adds r2, #6
	ldr r0, [sp, #0x28]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	add r0, sp, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	movs r1, #0
	strh r1, [r0]
	add r0, sp, #0x1c
	strh r1, [r0]
	adds r0, #2
	movs r7, #0x80
	lsls r7, r7, #1
	strh r7, [r0]
	movs r1, #6
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x10]
	movs r7, #8
	ldrsh r0, [r6, r7]
	str r0, [sp, #0x14]
	adds r6, r4, #0
	adds r7, r3, #0
	mov sb, r2
	cmp r5, #0
	ble _08004A20
	mov r0, r8
	ldrh r4, [r0, #8]
	ldrh r2, [r0, #4]
	b _08004A2E
	.align 2, 0
_08004A14: .4byte gUnknown_03004D96
_08004A18: .4byte gSineTable
_08004A1C: .4byte 0x000003FF
_08004A20:
	mov r2, r8
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_08004A2E:
	mov r3, ip
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _08004A3E
	mov r0, r8
	ldrh r3, [r0, #0xa]
	ldrh r5, [r0, #6]
	b _08004A4C
_08004A3E:
	mov r3, r8
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_08004A4C:
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	mov r7, sb
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x24]
	strh r0, [r1, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r1, #0x18]
_08004AAA:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8004ABC
sub_8004ABC: @ 0x08004ABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x24]
	adds r7, r1, #0
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08004AD8
	b _08004E04
_08004AD8:
	mov sb, r1
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _08004D58 @ =gUnknown_03004D96
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28]
	ldrh r0, [r7]
	ldr r3, _08004D5C @ =gUnknown_03001944
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r2, _08004D60 @ =0x000003FF
	ands r0, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r6, _08004D64 @ =gSineTable
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	movs r3, #0xa
	add r3, sp
	mov r8, r3
	ldrh r0, [r7]
	ldr r5, _08004D5C @ =gUnknown_03001944
	ldrh r1, [r5]
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r3]
	add r6, sp, #0xc
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r2, _08004D68 @ =gUnknown_030017F0
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	movs r3, #0xe
	add r3, sp
	mov sl, r3
	movs r5, #4
	ldrsh r1, [r7, r5]
	ldr r2, _08004D6C @ =gUnknown_03005394
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _08004BF0
	movs r2, #2
	ldrsh r0, [r7, r2]
	rsbs r0, r0, #0
	ldr r3, _08004D68 @ =gUnknown_030017F0
	ldrh r1, [r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
_08004BF0:
	movs r4, #4
	ldrsh r0, [r7, r4]
	ldr r5, _08004D6C @ =gUnknown_03005394
	ldrh r3, [r5]
	ldrh r2, [r7, #4]
	mov r1, sp
	strh r2, [r1, #0x34]
	cmp r0, #0
	bge _08004C14
	movs r4, #4
	ldrsh r0, [r7, r4]
	rsbs r0, r0, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	mov r5, sl
	strh r0, [r5]
	ldr r0, _08004D6C @ =gUnknown_03005394
	ldrh r3, [r0]
_08004C14:
	mov r2, sp
	ldr r4, [sp, #0x28]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	mov r5, sp
	adds r5, #2
	str r5, [sp, #0x30]
	mov r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]
	add r1, sp, #4
	mov ip, r1
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r4, sl
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r5, ip
	strh r0, [r5]
	mov r6, sp
	adds r6, #6
	str r6, [sp, #0x38]
	ldr r0, [sp, #0x28]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	add r5, sp, #0x18
	ldr r1, _08004D5C @ =gUnknown_03001944
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r4, _08004D64 @ =gSineTable
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r6, _08004D68 @ =gUnknown_030017F0
	ldrh r1, [r6]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]
	mov r2, sp
	adds r2, #0x1a
	ldr r1, _08004D5C @ =gUnknown_03001944
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r0, [r0, r4]
	rsbs r0, r0, #0
	asrs r0, r0, #6
	ldrh r1, [r6]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	add r4, sp, #0x1c
	ldr r6, _08004D5C @ =gUnknown_03001944
	ldrh r0, [r6]
	lsls r0, r0, #1
	ldr r1, _08004D64 @ =gSineTable
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r4]
	mov r3, sp
	adds r3, #0x1e
	ldrh r0, [r6]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r6, _08004D6C @ =gUnknown_03005394
	ldrh r1, [r6]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #6
	ldrsh r1, [r7, r5]
	muls r1, r0, r1
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #8
	ldrsh r2, [r7, r6]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _08004D70 @ =gUnknown_0300194C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x10]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #6
	ldrsh r1, [r7, r4]
	muls r1, r0, r1
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #8
	ldrsh r2, [r7, r5]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _08004D74 @ =gUnknown_03002820
	movs r6, #0
	ldrsh r0, [r0, r6]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	ldr r7, [sp, #0x30]
	mov r8, ip
	ldr r6, [sp, #0x38]
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _08004D78
	mov r1, sb
	ldrh r4, [r1, #8]
	ldrh r2, [r1, #4]
	b _08004D86
	.align 2, 0
_08004D58: .4byte gUnknown_03004D96
_08004D5C: .4byte gUnknown_03001944
_08004D60: .4byte 0x000003FF
_08004D64: .4byte gSineTable
_08004D68: .4byte gUnknown_030017F0
_08004D6C: .4byte gUnknown_03005394
_08004D70: .4byte gUnknown_0300194C
_08004D74: .4byte gUnknown_03002820
_08004D78:
	mov r2, sb
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_08004D86:
	mov r3, sp
	ldrh r3, [r3, #0x34]
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _08004D98
	mov r5, sb
	ldrh r3, [r5, #0xa]
	ldrh r5, [r5, #6]
	b _08004DA6
_08004D98:
	mov r0, sb
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_08004DA6:
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x24]
	strh r0, [r2, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r2, #0x18]
_08004E04:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8004E14
sub_8004E14: @ 0x08004E14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r0, [sp, #0x24]
	adds r6, r1, #0
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08004E30
	b _080051D8
_08004E30:
	mov sb, r1
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _08005128 @ =gUnknown_03004D96
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28]
	ldrh r0, [r6]
	ldr r3, _0800512C @ =gUnknown_03001944
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r2, _08005130 @ =0x000003FF
	ands r0, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _08005134 @ =gSineTable
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	movs r3, #0xa
	add r3, sp
	mov r8, r3
	ldrh r0, [r6]
	ldr r5, _0800512C @ =gUnknown_03001944
	ldrh r1, [r5]
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r3]
	add r7, sp, #0xc
	movs r0, #2
	ldrsh r1, [r6, r0]
	ldr r2, _08005138 @ =gUnknown_030017F0
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7]
	movs r3, #0xe
	add r3, sp
	mov sl, r3
	movs r5, #4
	ldrsh r1, [r6, r5]
	ldr r2, _0800513C @ =gUnknown_03005394
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl Div
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _08004F48
	movs r2, #2
	ldrsh r0, [r6, r2]
	rsbs r0, r0, #0
	ldr r3, _08005138 @ =gUnknown_030017F0
	ldrh r1, [r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7]
_08004F48:
	movs r4, #4
	ldrsh r0, [r6, r4]
	ldr r5, _0800513C @ =gUnknown_03005394
	ldrh r4, [r5]
	ldrh r2, [r6, #4]
	mov r1, sp
	strh r2, [r1, #0x3c]
	cmp r0, #0
	bge _08004F6A
	movs r3, #4
	ldrsh r0, [r6, r3]
	rsbs r0, r0, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	mov r4, sl
	strh r0, [r4]
	ldrh r4, [r5]
_08004F6A:
	mov r2, sp
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	mov r0, sp
	adds r0, #2
	str r0, [sp, #0x30]
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r3, [sp, #0x30]
	strh r0, [r3]
	mov r5, sp
	adds r5, #4
	str r5, [sp, #0x34]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, sl
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]
	mov r3, sp
	adds r3, #6
	str r3, [sp, #0x38]
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	add r0, sp, #0x18
	mov r8, r0
	ldr r1, _0800512C @ =gUnknown_03001944
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r3, _08005134 @ =gSineTable
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r5, _08005138 @ =gUnknown_030017F0
	ldrh r1, [r5]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _08005140 @ =gUnknown_03005398
	movs r5, #0
	ldrsh r1, [r3, r5]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	mov r1, r8
	strh r0, [r1]
	movs r2, #0x1a
	add r2, sp
	mov ip, r2
	ldr r5, _0800512C @ =gUnknown_03001944
	ldrh r0, [r5]
	lsls r0, r0, #1
	ldr r1, _08005134 @ =gSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	asrs r0, r0, #6
	ldr r5, _08005138 @ =gUnknown_030017F0
	ldrh r1, [r5]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r3, r7]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	add r5, sp, #0x1c
	ldr r2, _0800512C @ =gUnknown_03001944
	ldrh r0, [r2]
	lsls r0, r0, #1
	ldr r7, _08005134 @ =gSineTable
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r0, #0
	muls r2, r4, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r3, r4]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r5]
	mov r4, sp
	adds r4, #0x1e
	ldr r7, _0800512C @ =gUnknown_03001944
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _08005134 @ =gSineTable
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r7, _0800513C @ =gUnknown_03005394
	ldrh r1, [r7]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r3, r7]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r4]
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #6
	ldrsh r1, [r6, r2]
	muls r1, r0, r1
	mov r3, ip
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #8
	ldrsh r2, [r6, r7]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _08005144 @ =gUnknown_0300194C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x10]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #6
	ldrsh r1, [r6, r3]
	muls r1, r0, r1
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #8
	ldrsh r2, [r6, r4]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _08005148 @ =gUnknown_03002820
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	ldr r6, [sp, #0x30]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x38]
	mov r8, r0
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	ble _0800514C
	mov r2, sb
	ldrh r4, [r2, #8]
	ldrh r2, [r2, #4]
	b _0800515A
	.align 2, 0
_08005128: .4byte gUnknown_03004D96
_0800512C: .4byte gUnknown_03001944
_08005130: .4byte 0x000003FF
_08005134: .4byte gSineTable
_08005138: .4byte gUnknown_030017F0
_0800513C: .4byte gUnknown_03005394
_08005140: .4byte gUnknown_03005398
_08005144: .4byte gUnknown_0300194C
_08005148: .4byte gUnknown_03002820
_0800514C:
	mov r3, sb
	ldrh r1, [r3, #4]
	ldrh r0, [r3, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_0800515A:
	mov r5, sp
	ldrh r5, [r5, #0x3c]
	lsls r0, r5, #0x10
	cmp r0, #0
	ble _0800516C
	mov r0, sb
	ldrh r3, [r0, #0xa]
	ldrh r5, [r0, #6]
	b _0800517A
_0800516C:
	mov r3, sb
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_0800517A:
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	mov r4, r8
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r5, [sp, #0x24]
	strh r0, [r5, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r5, #0x18]
_080051D8:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80051E8
sub_80051E8: @ 0x080051E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r2, [r7, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08005202
	b _080054EC
_08005202:
	mov r8, r2
	ldrh r1, [r2, #2]
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
	movs r1, #0x16
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r3, #0x18
	ldrsh r2, [r7, r3]
	mov sl, r2
	ldr r2, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0800523A
	ldr r0, _08005270 @ =gUnknown_030017F4
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r3, [sp]
	subs r3, r3, r1
	str r3, [sp]
	movs r5, #2
	ldrsh r0, [r0, r5]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
_0800523A:
	mov r3, r8
	ldrh r3, [r3, #4]
	str r3, [sp, #4]
	mov r5, r8
	ldrh r5, [r5, #6]
	str r5, [sp, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08005274
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _080052C6
	lsrs r0, r3, #1
	ldr r1, [sp]
	subs r1, r1, r0
	str r1, [sp]
	lsrs r0, r5, #1
	mov r2, sl
	subs r2, r2, r0
	mov sl, r2
	lsls r3, r3, #1
	str r3, [sp, #4]
	lsls r5, r5, #1
	str r5, [sp, #8]
	b _080052C6
	.align 2, 0
_08005270: .4byte gUnknown_030017F4
_08005274:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08005290
	mov r3, r8
	movs r5, #0xa
	ldrsh r0, [r3, r5]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	mov r2, sl
	subs r2, r2, r0
	mov sl, r2
	b _0800529C
_08005290:
	mov r3, r8
	movs r5, #0xa
	ldrsh r0, [r3, r5]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
_0800529C:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080052BA
	mov r2, r8
	movs r3, #8
	ldrsh r0, [r2, r3]
	ldr r5, [sp, #4]
	subs r0, r5, r0
	ldr r1, [sp]
	subs r1, r1, r0
	str r1, [sp]
	b _080052C6
_080052BA:
	mov r2, r8
	movs r3, #8
	ldrsh r0, [r2, r3]
	ldr r5, [sp]
	subs r5, r5, r0
	str r5, [sp]
_080052C6:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r1, r2
	cmp r0, #0
	bge _080052D2
	b _080054EC
_080052D2:
	cmp r1, #0xf0
	ble _080052D8
	b _080054EC
_080052D8:
	ldr r0, [sp, #8]
	add r0, sl
	cmp r0, #0
	bge _080052E2
	b _080054EC
_080052E2:
	mov r3, sl
	cmp r3, #0xa0
	ble _080052EA
	b _080054EC
_080052EA:
	ldr r0, _080053C8 @ =gUnknown_030026D0
	ldrh r0, [r0]
	lsrs r0, r0, #8
	str r0, [sp, #0x10]
	movs r5, #0
	str r5, [sp, #0xc]
	mov r0, r8
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _08005300
	b _080054EC
_08005300:
	ldr r0, _080053CC @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r7, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldrh r0, [r7, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r4, r0, #0
	ldr r0, _080053D0 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r4
	bne _0800532A
	b _080054EC
_0800532A:
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bne _0800533C
	ldr r0, _080053D4 @ =gUnknown_030018F0
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r7, #0
	adds r1, #0x23
	strb r0, [r1]
_0800533C:
	ldr r2, _080053D8 @ =0x040000D4
	mov r0, r8
	ldrb r1, [r0, #1]
	ldr r3, [sp, #0xc]
	adds r1, r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r5, r0
	str r0, [r2]
	str r4, [r2, #4]
	ldr r0, _080053DC @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrh r1, [r4, #2]
	ldr r5, _080053E0 @ =0x000001FF
	adds r0, r5, #0
	adds r2, r0, #0
	ands r2, r1
	mov sb, r2
	ldrh r2, [r4]
	ldrb r3, [r4]
	mov ip, r3
	movs r0, #0xfe
	lsls r0, r0, #8
	adds r5, r0, #0
	ands r5, r1
	movs r6, #0
	strh r5, [r4, #2]
	adds r3, r0, #0
	ands r3, r2
	strh r3, [r4]
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	ldr r2, [r7, #0x10]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080053E4
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	orrs r2, r6
	strh r2, [r4]
	ldr r0, [r7, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080053B6
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r4]
_080053B6:
	ldr r0, [r7, #0x10]
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #9
	ldrh r1, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	b _08005458
	.align 2, 0
_080053C8: .4byte gUnknown_030026D0
_080053CC: .4byte gUnknown_03002794
_080053D0: .4byte iwram_end
_080053D4: .4byte gUnknown_030018F0
_080053D8: .4byte 0x040000D4
_080053DC: .4byte 0x80000003
_080053E0: .4byte 0x000001FF
_080053E4:
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r3, #0
	ands r0, r1
	lsrs r3, r0, #0xc
	adds r0, r5, #0
	ands r0, r1
	lsrs r0, r0, #0xe
	orrs r3, r0
	lsrs r1, r2, #0xb
	movs r6, #1
	mov r2, r8
	ldrb r0, [r2]
	lsrs r0, r0, #1
	eors r0, r1
	ands r0, r6
	cmp r0, #0
	beq _08005428
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4, #2]
	ldr r0, _080054FC @ =gUnknown_080984DC
	lsls r1, r3, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	mov r2, ip
	subs r2, r0, r2
	mov ip, r2
_08005428:
	ldr r0, [r7, #0x10]
	lsrs r0, r0, #0xa
	ands r0, r6
	mov r5, r8
	ldrb r2, [r5]
	adds r1, r6, #0
	ands r1, r2
	cmp r0, r1
	beq _08005458
	ldrh r0, [r4, #2]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4, #2]
	ldr r1, _080054FC @ =gUnknown_080984DC
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	mov r5, sb
	subs r5, r0, r5
	mov sb, r5
_08005458:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _08005476
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08005476
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_08005476:
	ldr r2, [r7, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrh r0, [r4]
	orrs r2, r0
	strh r2, [r4]
	ldr r0, [r7, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r3, r0, #2
	ldrh r0, [r4, #4]
	orrs r3, r0
	strh r3, [r4, #4]
	mov r0, sl
	add r0, ip
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r0, [sp]
	add r0, sb
	ldr r5, _08005500 @ =0x000001FF
	adds r1, r5, #0
	ands r0, r1
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r2, r0
	cmp r2, #0
	beq _080054CA
	ldr r0, _08005504 @ =0x000003FF
	adds r1, r0, #0
	adds r0, r3, #0
	ands r0, r1
	adds r0, r3, r0
	strh r0, [r4, #4]
_080054CA:
	ldr r0, [r7, #4]
	ldr r1, _08005508 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r3, r8
	ldrh r3, [r3, #2]
	cmp r0, r3
	bhs _080054EC
	b _08005300
_080054EC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080054FC: .4byte gUnknown_080984DC
_08005500: .4byte 0x000001FF
_08005504: .4byte 0x000003FF
_08005508: .4byte 0xF9FF0000

	thumb_func_start sub_800550C
sub_800550C: @ 0x0800550C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	str r1, [sp, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	ldr r2, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0800552E
	b _08005888
_0800552E:
	mov sl, r2
	ldrh r1, [r2, #2]
	mov r0, r8
	adds r0, #0x24
	strb r1, [r0]
	mov r1, r8
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [sp]
	movs r4, #0x18
	ldrsh r0, [r1, r4]
	str r0, [sp, #4]
	ldr r3, [r1, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	cmp r0, #0
	beq _08005568
	ldr r2, _080055A8 @ =gUnknown_030017F4
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
	movs r4, #2
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
_08005568:
	mov r0, sl
	ldrh r0, [r0, #4]
	str r0, [sp, #0x10]
	mov r1, sl
	ldrh r1, [r1, #6]
	str r1, [sp, #0x14]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080055AC
	movs r0, #0x40
	ands r3, r0
	cmp r3, #0
	beq _080055F4
	ldr r2, [sp, #0x10]
	lsrs r1, r2, #1
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
	mov r4, sl
	ldrh r1, [r4, #6]
	lsrs r1, r1, #1
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	lsls r2, r2, #1
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #1
	str r0, [sp, #0x14]
	b _080055F4
	.align 2, 0
_080055A8: .4byte gUnknown_030017F4
_080055AC:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r3, r0
	cmp r3, #0
	beq _080055C2
	mov r2, sl
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #0x14]
	subs r1, r0, r1
	b _080055C8
_080055C2:
	mov r2, sl
	movs r4, #0xa
	ldrsh r1, [r2, r4]
_080055C8:
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080055E8
	mov r2, sl
	movs r4, #8
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #0x10]
	subs r1, r0, r1
	b _080055EE
_080055E8:
	mov r2, sl
	movs r4, #8
	ldrsh r1, [r2, r4]
_080055EE:
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
_080055F4:
	mov r0, r8
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp, #0x24]
	mov r4, r8
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #0x28]
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	cmp r0, #0
	bge _08005618
	b _08005888
_08005618:
	ldr r0, [sp]
	cmp r0, #0xf0
	ble _08005620
	b _08005888
_08005620:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x14]
	adds r0, r0, r2
	cmp r0, #0
	bge _0800562C
	b _08005888
_0800562C:
	ldr r0, [sp, #4]
	cmp r0, #0xa0
	ble _08005634
	b _08005888
_08005634:
	movs r4, #0
	str r4, [sp, #0x18]
	mov r0, sl
	ldrh r0, [r0, #2]
	cmp r4, r0
	blo _08005642
	b _08005888
_08005642:
	ldr r0, _080056FC @ =gUnknown_03002794
	ldr r1, [r0]
	mov r2, r8
	ldrh r0, [r2, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldrh r0, [r2, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r6, r0, #0
	ldr r0, _08005700 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r6
	bne _0800566E
	b _08005888
_0800566E:
	ldr r2, _08005704 @ =0x040000D4
	mov r0, sl
	ldrb r1, [r0, #1]
	ldr r0, [sp, #0x18]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	str r0, [r2]
	str r6, [r2, #4]
	ldr r0, _08005708 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrh r1, [r6, #2]
	ldr r2, _0800570C @ =0x000001FF
	adds r0, r2, #0
	adds r4, r0, #0
	ands r4, r1
	str r4, [sp, #0x1c]
	ldrh r0, [r6]
	ldrb r2, [r6]
	str r2, [sp, #0x20]
	movs r3, #0xfe
	lsls r3, r3, #8
	ands r3, r1
	movs r4, #0
	strh r3, [r6, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	strh r2, [r6]
	mov r0, r8
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	strh r0, [r6, #4]
	mov r0, r8
	ldr r5, [r0, #0x10]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08005710
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r2, r0
	orrs r2, r4
	strh r2, [r6]
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080056EA
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	orrs r2, r0
	strh r2, [r6]
_080056EA:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #9
	ldrh r1, [r6, #2]
	orrs r0, r1
	strh r0, [r6, #2]
	b _08005786
	.align 2, 0
_080056FC: .4byte gUnknown_03002794
_08005700: .4byte iwram_end
_08005704: .4byte 0x040000D4
_08005708: .4byte 0x80000003
_0800570C: .4byte 0x000001FF
_08005710:
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r2, #0
	ands r0, r1
	lsrs r4, r0, #0xc
	adds r0, r3, #0
	ands r0, r1
	lsrs r0, r0, #0xe
	orrs r4, r0
	lsrs r1, r5, #0xb
	movs r5, #1
	mov r2, sl
	ldrb r0, [r2]
	lsrs r0, r0, #1
	eors r0, r1
	ands r0, r5
	cmp r0, #0
	beq _08005754
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r6, #2]
	ldr r0, _08005898 @ =gUnknown_080984DC
	lsls r1, r4, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r2, [sp, #0x20]
	subs r2, r0, r2
	str r2, [sp, #0x20]
_08005754:
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsrs r0, r0, #0xa
	ands r0, r5
	mov r1, sl
	ldrb r2, [r1]
	adds r1, r5, #0
	ands r1, r2
	cmp r0, r1
	beq _08005786
	ldrh r0, [r6, #2]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r6, #2]
	ldr r1, _08005898 @ =gUnknown_080984DC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r4, [sp, #0x10]
	subs r0, r4, r0
	ldr r1, [sp, #0x1c]
	subs r1, r0, r1
	str r1, [sp, #0x1c]
_08005786:
	mov r4, r8
	ldr r2, [r4, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrh r0, [r6]
	orrs r2, r0
	strh r2, [r6]
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r3, r0, #2
	ldrh r0, [r6, #4]
	orrs r3, r0
	strh r3, [r6, #4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r6]
	ldr r0, [sp]
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	ldr r4, _0800589C @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r6, #2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ands r2, r0
	cmp r2, #0
	beq _080057E0
	ldr r0, _080058A0 @ =0x000003FF
	adds r1, r0, #0
	adds r0, r3, #0
	ands r0, r1
	adds r0, r3, r0
	strh r0, [r6, #4]
_080057E0:
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r2, _080058A4 @ =0xF9FF0000
	adds r0, r0, r2
	lsrs r0, r0, #5
	ldrh r4, [r6, #4]
	adds r0, r0, r4
	strh r0, [r6, #4]
	movs r7, #0
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bhs _08005874
	ldr r1, _080058A8 @ =0x040000D4
	mov sb, r1
_080057FC:
	mov r2, r8
	ldrh r0, [r2, #0x1a]
	movs r4, #0xf8
	lsls r4, r4, #3
	adds r1, r4, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r5, r0, #0
	ldr r0, _080058AC @ =iwram_end
	ldr r0, [r0]
	cmp r0, r6
	beq _08005888
	mov r0, sb
	str r6, [r0]
	str r5, [r0, #4]
	ldr r0, _080058B0 @ =0x80000003
	mov r1, sb
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r4, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r4, r2
	strh r4, [r5, #2]
	ldrh r2, [r5]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r5]
	lsls r3, r7, #2
	ldr r0, [sp, #8]
	adds r3, r3, r0
	ldrh r0, [r3, #2]
	ldr r1, [sp, #0x28]
	adds r0, r0, r1
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r5]
	ldrh r0, [r3]
	ldr r2, [sp, #0x24]
	adds r0, r0, r2
	ldr r1, [sp, #0x1c]
	adds r0, r0, r1
	ldr r2, _0800589C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	adds r4, r4, r0
	strh r4, [r5, #2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, [sp, #0xc]
	cmp r7, r4
	blo _080057FC
_08005874:
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	mov r1, sl
	ldrh r1, [r1, #2]
	cmp r0, r1
	bhs _08005888
	b _08005642
_08005888:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005898: .4byte gUnknown_080984DC
_0800589C: .4byte 0x000001FF
_080058A0: .4byte 0x000003FF
_080058A4: .4byte 0xF9FF0000
_080058A8: .4byte 0x040000D4
_080058AC: .4byte iwram_end
_080058B0: .4byte 0x80000003

	thumb_func_start sub_80058B4
sub_80058B4: @ 0x080058B4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x1f
	bls _080058C0
	movs r5, #0x1f
_080058C0:
	ldr r0, _080058D4 @ =gUnknown_030018F0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	bge _080058DC
	ldr r0, _080058D8 @ =iwram_end
	ldr r0, [r0]
	b _08005938
	.align 2, 0
_080058D4: .4byte gUnknown_030018F0
_080058D8: .4byte iwram_end
_080058DC:
	ldr r0, _08005900 @ =gUnknown_03001850
	adds r2, r5, r0
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0800590C
	ldr r1, _08005904 @ =gUnknown_030022D0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0, #6]
	ldrb r0, [r4]
	strb r0, [r2]
	ldr r0, _08005908 @ =gUnknown_03004D60
	adds r0, r5, r0
	ldrb r1, [r4]
	strb r1, [r0]
	b _0800592A
	.align 2, 0
_08005900: .4byte gUnknown_03001850
_08005904: .4byte gUnknown_030022D0
_08005908: .4byte gUnknown_03004D60
_0800590C:
	ldr r3, _08005940 @ =gUnknown_030022D0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0, #6]
	ldr r2, _08005944 @ =gUnknown_03004D60
	adds r2, r5, r2
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r4]
	strb r1, [r0, #6]
	ldrb r0, [r4]
	strb r0, [r2]
_0800592A:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, r0, #3
	ldr r1, _08005948 @ =gUnknown_030022C8
	adds r0, r0, r1
_08005938:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005940: .4byte gUnknown_030022D0
_08005944: .4byte gUnknown_03004D60
_08005948: .4byte gUnknown_030022C8

	thumb_func_start DrawToOamBuffer
DrawToOamBuffer: @ 0x0800594C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r5, _080059FC @ =gOamBuffer
	movs r0, #0
	mov sb, r0
	movs r3, #0
	ldr r1, _08005A00 @ =gUnknown_03002AE0
	mov sl, r1
	mov r2, sp
	adds r2, #8
	str r2, [sp, #0xc]
_0800596A:
	ldr r1, _08005A04 @ =gUnknown_03001850
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	adds r6, r3, #1
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080059B2
	ldr r4, _08005A08 @ =0x040000D4
	mov r8, r1
	ldr r0, _08005A0C @ =IWRAM_START + 0x2710
	mov ip, r0
	ldr r7, _08005A10 @ =gUnknown_030022D0
_08005988:
	asrs r2, r2, #0x18
	lsls r3, r2, #3
	adds r3, r3, r7
	str r3, [r4]
	str r5, [r4, #4]
	ldr r0, _08005A14 @ =0x80000003
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, #8
	add r2, ip
	mov r1, sb
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	strb r1, [r2]
	ldrb r0, [r3, #6]
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	cmp r0, r8
	bne _08005988
_080059B2:
	adds r3, r6, #0
	cmp r3, #0x1f
	ble _0800596A
	ldr r2, _08005A18 @ =gFlags
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08005A24
	ldr r0, _08005A1C @ =gUnknown_030018F0
	ldrb r3, [r0]
	lsls r0, r3, #3
	ldr r1, _080059FC @ =gOamBuffer
	adds r5, r0, r1
	mov r2, sl
	ldrb r0, [r2]
	cmp r3, r0
	bge _08005AB0
	mov r4, sp
	movs r1, #0x80
	lsls r1, r1, #2
	adds r7, r1, #0
	ldr r1, _08005A08 @ =0x040000D4
	ldr r6, _08005A20 @ =0x81000003
_080059E4:
	strh r7, [r4]
	mov r0, sp
	str r0, [r1]
	str r5, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r5, #8
	adds r3, #1
	ldrb r0, [r2]
	cmp r3, r0
	blt _080059E4
	b _08005AB0
	.align 2, 0
_080059FC: .4byte gOamBuffer
_08005A00: .4byte gUnknown_03002AE0
_08005A04: .4byte gUnknown_03001850
_08005A08: .4byte 0x040000D4
_08005A0C: .4byte IWRAM_START + 0x2710
_08005A10: .4byte gUnknown_030022D0
_08005A14: .4byte 0x80000003
_08005A18: .4byte gFlags
_08005A1C: .4byte gUnknown_030018F0
_08005A20: .4byte 0x81000003
_08005A24:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08005AAC
	ldr r1, _08005A98 @ =gUnknown_030018F0
	ldrb r0, [r1]
	subs r3, r0, #1
	lsls r0, r3, #3
	ldr r2, _08005A9C @ =gOamBuffer
	adds r5, r0, r2
	cmp r3, #0
	blt _08005A5E
	ldr r2, _08005AA0 @ =0x040000D4
	ldr r6, _08005AA4 @ =0x80000003
	ldr r0, _08005A9C @ =gOamBuffer
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r1, r5, #0
_08005A4C:
	str r1, [r2]
	str r4, [r2, #4]
	str r6, [r2, #8]
	ldr r0, [r2, #8]
	subs r1, #8
	subs r3, #1
	subs r4, #8
	cmp r3, #0
	bge _08005A4C
_08005A5E:
	ldr r2, _08005A98 @ =gUnknown_030018F0
	ldrb r1, [r2]
	movs r0, #0x80
	subs r0, r0, r1
	mov r1, sl
	strb r0, [r1]
	movs r3, #0
	ldrb r0, [r1]
	cmp r3, r0
	bge _08005AB0
	mov r5, sp
	movs r2, #0x80
	lsls r2, r2, #2
	adds r7, r2, #0
	ldr r1, _08005AA0 @ =0x040000D4
	adds r4, r0, #0
	ldr r6, _08005AA8 @ =0x81000003
	ldr r2, _08005A9C @ =gOamBuffer
_08005A82:
	strh r7, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, #8
	adds r3, #1
	cmp r3, r4
	blt _08005A82
	b _08005AB0
	.align 2, 0
_08005A98: .4byte gUnknown_030018F0
_08005A9C: .4byte gOamBuffer
_08005AA0: .4byte 0x040000D4
_08005AA4: .4byte 0x80000003
_08005AA8: .4byte 0x81000003
_08005AAC:
	mov r1, sl
	strb r0, [r1]
_08005AB0:
	movs r0, #0
	ldr r2, _08005AE4 @ =gUnknown_030018F0
	strb r0, [r2]
	ldr r1, _08005AE8 @ =gFlags
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08005AF8
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r5, _08005AEC @ =0x05000008
	ldr r1, _08005AF0 @ =gUnknown_03001850
	adds r2, r5, #0
	bl CpuSet
	str r4, [sp, #8]
	ldr r1, _08005AF4 @ =gUnknown_03004D60
	ldr r0, [sp, #0xc]
	adds r2, r5, #0
	bl CpuSet
	b _08005B1C
	.align 2, 0
_08005AE4: .4byte gUnknown_030018F0
_08005AE8: .4byte gFlags
_08005AEC: .4byte 0x05000008
_08005AF0: .4byte gUnknown_03001850
_08005AF4: .4byte gUnknown_03004D60
_08005AF8:
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #8]
	ldr r0, _08005B2C @ =0x040000D4
	ldr r2, [sp, #0xc]
	str r2, [r0]
	ldr r2, _08005B30 @ =gUnknown_03001850
	str r2, [r0, #4]
	ldr r2, _08005B34 @ =0x85000008
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	str r1, [sp, #8]
	ldr r1, [sp, #0xc]
	str r1, [r0]
	ldr r1, _08005B38 @ =gUnknown_03004D60
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08005B1C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005B2C: .4byte 0x040000D4
_08005B30: .4byte gUnknown_03001850
_08005B34: .4byte 0x85000008
_08005B38: .4byte gUnknown_03004D60

	thumb_func_start sub_8005B3C
sub_8005B3C: @ 0x08005B3C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _08005B90
	ldr r1, [r4, #4]
	ldr r2, _08005B98 @ =0x040000D4
	ldr r0, _08005B9C @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08005BA0 @ =gObjPalette
	adds r0, r0, r1
	str r0, [r2, #4]
	ldrh r0, [r4, #8]
	asrs r0, r0, #1
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _08005BA4 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_08005B90:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08005B98: .4byte 0x040000D4
_08005B9C: .4byte gUnknown_03002794
_08005BA0: .4byte gObjPalette
_08005BA4: .4byte gFlags

	thumb_func_start sub_8005BA8
sub_8005BA8: @ 0x08005BA8
	ldr r2, [r0, #4]
	ldrh r0, [r1, #0x14]
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr

	thumb_func_start sub_8005BB4
sub_8005BB4: @ 0x08005BB4
	ldr r0, [r1, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r0, r2
	str r0, [r1, #0x10]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_8005BC4
sub_8005BC4: @ 0x08005BC4
	push {lr}
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r0, [r0, #4]
	bl m4aSongNumStart
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_8005BD8
sub_8005BD8: @ 0x08005BD8
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	ldrh r3, [r1, #0x16]
	adds r2, r2, r3
	strh r2, [r1, #0x16]
	ldrh r0, [r0, #6]
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	strh r0, [r1, #0x18]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_8005BF4
sub_8005BF4: @ 0x08005BF4
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_8005C00
sub_8005C00: @ 0x08005C00
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	strh r2, [r1, #0xa]
	adds r3, r1, #0
	adds r3, #0x21
	movs r2, #0xff
	strb r2, [r3]
	ldrh r0, [r0, #6]
	adds r1, #0x20
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_8005C20
sub_8005C20: @ 0x08005C20
	ldrh r2, [r1, #0x14]
	adds r2, #4
	strh r2, [r1, #0x14]
	bx lr

	thumb_func_start sub_8005C28
sub_8005C28: @ 0x08005C28
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldr r2, [r1, #0x10]
	ldr r3, _08005C40 @ =0xFFFFCFFF
	ands r2, r3
	ldr r0, [r0, #4]
	lsls r0, r0, #0xc
	orrs r2, r0
	str r2, [r1, #0x10]
	movs r0, #1
	bx lr
	.align 2, 0
_08005C40: .4byte 0xFFFFCFFF

	thumb_func_start sub_8005C44
sub_8005C44: @ 0x08005C44
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldr r0, [r0, #4]
	lsls r0, r0, #6
	strh r0, [r1, #0x1a]
	movs r0, #1
	bx lr

	thumb_func_start sub_8005C54
sub_8005C54: @ 0x08005C54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r4, [sp, #0x4c]
	ldr r5, [sp, #0x50]
	mov sb, r5
	ldr r5, [sp, #0x54]
	ldr r6, [sp, #0x58]
	ldr r7, [sp, #0x5c]
	mov r8, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	mov r0, sb
	lsls r0, r0, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0xc]
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x10]
	movs r2, #1
	str r2, [sp, #0x14]
	lsrs r5, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	beq _08005CB6
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r2, r0
	bne _08005CC8
_08005CB6:
	ldr r0, _08005CC4 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _08005F9E
	.align 2, 0
_08005CC4: .4byte gFlags
_08005CC8:
	ldr r3, [sp, #0xc]
	mov r4, ip
	subs r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r7, [sp, #4]
	subs r0, r7, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r2, #0
	bge _08005D08
	movs r0, #0xff
	str r0, [sp, #0x14]
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0xc]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	subs r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	eors r1, r3
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	eors r3, r0
	lsls r0, r3, #0x10
	eors r0, r1
	lsrs r1, r0, #0x10
_08005D08:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r1, r5, #0x10
	asrs r7, r1, #0x10
	adds r0, r4, #0
	muls r0, r7, r0
	asrs r0, r0, #8
	mov r5, sl
	subs r2, r6, r5
	str r1, [sp, #0x20]
	lsls r3, r3, #0x10
	mov r8, r3
	ldr r1, [sp, #8]
	subs r1, r1, r6
	str r1, [sp, #0x28]
	ldr r3, [sp]
	lsls r3, r3, #2
	str r3, [sp, #0x1c]
	ldr r5, [sp, #0x14]
	lsls r5, r5, #0x18
	str r5, [sp, #0x24]
	cmp r0, r2
	bge _08005D7C
	mov r3, sl
	lsls r0, r7, #8
	muls r0, r4, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x18
	subs r0, r6, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r3, #2
	ldr r7, _08005E28 @ =gUnknown_03001884
	ldr r0, [r7]
	adds r4, r0, r1
	mov r0, ip
	subs r5, r0, r3
	ldr r1, _08005E2C @ =0x000001FF
	adds r0, r1, #0
	ands r5, r0
	cmp r3, sl
	bhs _08005D7C
_08005D5E:
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r4]
	adds r4, #2
	adds r0, r5, #0
	subs r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, sl
	blo _08005D5E
_08005D7C:
	mov r3, r8
	asrs r2, r3, #0x10
	ldr r4, [sp, #0x20]
	asrs r1, r4, #0x10
	adds r0, r2, #0
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r5, sl
	subs r5, r6, r5
	mov r8, r5
	mov r7, sl
	lsls r7, r7, #2
	mov sb, r7
	ldr r3, [sp, #0x28]
	cmp r0, r3
	bge _08005DE4
	ldr r7, [sp, #8]
	lsls r0, r1, #8
	muls r0, r2, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x18
	adds r0, r6, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r3, r0, #0
	lsls r1, r0, #2
	ldr r4, _08005E28 @ =gUnknown_03001884
	ldr r0, [r4]
	adds r4, r0, r1
	ldr r0, [sp, #4]
	subs r5, r0, r3
	ldr r1, _08005E2C @ =0x000001FF
	adds r0, r1, #0
	ands r5, r0
	cmp r3, r7
	bhs _08005DE4
_08005DC6:
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r4]
	adds r4, #2
	adds r0, r5, #0
	subs r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	blo _08005DC6
_08005DE4:
	ldr r3, _08005E30 @ =gFlags
	ldr r0, [r3]
	movs r1, #4
	orrs r0, r1
	str r0, [r3]
	ldr r4, [sp, #0x1c]
	ldr r5, _08005E34 @ =0x04000010
	adds r0, r4, r5
	ldr r7, _08005E38 @ =gUnknown_03002878
	str r0, [r7]
	ldr r0, _08005E3C @ =gUnknown_03002A80
	strb r1, [r0]
	ldr r1, _08005E28 @ =gUnknown_03001884
	ldr r0, [r1]
	mov r2, sb
	adds r4, r0, r2
	mov r3, r8
	lsls r6, r3, #8
	lsls r0, r3, #0x10
	ldr r5, [sp, #0x20]
	asrs r1, r5, #0x10
	bl __divsi3
	asrs r2, r0, #8
	ldr r7, [sp, #0x24]
	asrs r1, r7, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08005E40
	ldr r1, [sp, #0xc]
	subs r0, r1, r2
	b _08005E44
	.align 2, 0
_08005E28: .4byte gUnknown_03001884
_08005E2C: .4byte 0x000001FF
_08005E30: .4byte gFlags
_08005E34: .4byte 0x04000010
_08005E38: .4byte gUnknown_03002878
_08005E3C: .4byte gUnknown_03002A80
_08005E40:
	ldr r1, [sp, #0xc]
	adds r0, r1, r2
_08005E44:
	mov r3, sl
	subs r5, r0, r3
	ldr r7, _08005EEC @ =0x000001FF
	adds r0, r7, #0
	ands r5, r0
	ldr r0, [sp, #0x20]
	asrs r7, r0, #0x10
	adds r0, r2, #0
	muls r0, r7, r0
	subs r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08005E72
	ldr r2, [sp, #0x24]
	asrs r0, r2, #0x18
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	subs r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_08005E72:
	movs r3, #0x80
	lsls r3, r3, #1
	mov r8, r3
	cmp r7, r8
	ble _08005EF0
	mov r3, sl
	ldr r0, [sp, #8]
	cmp r3, r0
	blo _08005E86
	b _08005F9E
_08005E86:
	ldr r1, [sp, #0x20]
	mov sl, r1
	mov sb, r7
	ldr r2, _08005EEC @ =0x000001FF
	mov ip, r2
_08005E90:
	mov r7, sp
	ldrh r7, [r7, #0x10]
	strh r7, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r6, #0x10
	asrs r0, r2, #0x10
	mov r7, sl
	adds r3, #1
	mov r8, r3
	cmp r0, sb
	ble _08005EDA
	ldr r0, [sp, #0x24]
	asrs r3, r0, #0x18
_08005EC2:
	adds r0, r5, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r2, #0x10
	asrs r1, r7, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r6, #0x10
	asrs r0, r2, #0x10
	cmp r0, r1
	bgt _08005EC2
_08005EDA:
	mov r1, ip
	ands r5, r1
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	ldr r7, [sp, #8]
	cmp r3, r7
	blo _08005E90
	b _08005F9E
	.align 2, 0
_08005EEC: .4byte 0x000001FF
_08005EF0:
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r7, #0
	bl __udivsi3
	lsrs r0, r0, #8
	movs r1, #0xff
	ands r0, r1
	adds r1, r0, #0
	muls r1, r7, r1
	mov r2, r8
	subs r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r3, [sp, #0x24]
	asrs r1, r3, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08005F30
	mov r1, sb
	lsls r0, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #0xa
	adds r0, r0, r3
	rsbs r0, r0, #0
	lsrs r0, r0, #0x10
	mov sb, r0
_08005F30:
	mov r3, sl
	ldr r0, [sp, #8]
	cmp r3, r0
	bhs _08005F9E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	mov ip, r1
	mov sl, r7
_08005F44:
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	mov r7, sb
	adds r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r6, #0x10
	asrs r0, r2, #0x10
	mov r7, ip
	adds r3, #1
	mov r8, r3
	cmp r0, sl
	ble _08005F8E
	ldr r0, [sp, #0x24]
	asrs r3, r0, #0x18
_08005F76:
	adds r0, r5, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r2, #0x10
	asrs r1, r7, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r2, r6, #0x10
	asrs r0, r2, #0x10
	cmp r0, r1
	bgt _08005F76
_08005F8E:
	ldr r1, _08005FB0 @ =0x000001FF
	ands r5, r1
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	ldr r7, [sp, #8]
	cmp r3, r7
	blo _08005F44
_08005F9E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005FB0: .4byte 0x000001FF

	thumb_func_start sub_8005FB4
sub_8005FB4: @ 0x08005FB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08005FF8 @ =gFlags
	ldr r0, [r1]
	movs r7, #4
	orrs r0, r7
	str r0, [r1]
	cmp r6, #1
	bls _08006010
	ldr r1, _08005FFC @ =gUnknown_03002A80
	strb r7, [r1]
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08006004
	ldr r0, _08006000 @ =gUnknown_03001884
	ldr r0, [r0]
	adds r3, r0, #2
	b _08006038
	.align 2, 0
_08005FF8: .4byte gFlags
_08005FFC: .4byte gUnknown_03002A80
_08006000: .4byte gUnknown_03001884
_08006004:
	ldr r0, _0800600C @ =gUnknown_03001884
	ldr r3, [r0]
	b _08006038
	.align 2, 0
_0800600C: .4byte gUnknown_03001884
_08006010:
	ldr r1, _08006028 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0800602C @ =gUnknown_03001884
	ldr r3, [r0]
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08006038
	ldr r1, _08006030 @ =gUnknown_03002878
	ldr r0, _08006034 @ =0x04000042
	b _0800603C
	.align 2, 0
_08006028: .4byte gUnknown_03002A80
_0800602C: .4byte gUnknown_03001884
_08006030: .4byte gUnknown_03002878
_08006034: .4byte 0x04000042
_08006038:
	ldr r1, _080060A0 @ =gUnknown_03002878
	ldr r0, _080060A4 @ =0x04000040
_0800603C:
	str r0, [r1]
	subs r1, r2, r5
	mov r2, sl
	subs r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r7, r1, #0x10
	asrs r2, r7, #0x10
	adds r0, r2, #0
	cmp r2, #0
	bge _08006054
	rsbs r0, r2, #0
_08006054:
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r4, r1, #0
	mov sb, r0
	cmp r1, #0
	bge _08006068
	rsbs r4, r1, #0
_08006068:
	lsls r0, r4, #0x11
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r4, _080060A8 @ =gUnknown_03002A80
	ldrb r0, [r4]
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r6, r2, #0
	cmp r2, #0
	bge _08006082
	rsbs r6, r2, #0
_08006082:
	adds r0, r1, #0
	cmp r1, #0
	bge _0800608A
	rsbs r0, r1, #0
_0800608A:
	cmp r6, r0
	ble _0800615C
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080060FC
	strb r5, [r3, #1]
	movs r2, #0
	adds r6, r7, #0
	b _080060E4
	.align 2, 0
_080060A0: .4byte gUnknown_03002878
_080060A4: .4byte 0x04000040
_080060A8: .4byte gUnknown_03002A80
_080060AC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, ip
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _080060DE
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r5, [r3]
	ldr r1, _080060F8 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r3, r3, r0
	strb r5, [r3, #1]
_080060DE:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080060E4:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r6, #0x10
	cmp r0, #0
	bge _080060F0
	rsbs r0, r0, #0
_080060F0:
	cmp r2, r0
	blt _080060AC
	strb r5, [r3]
	b _08006214
	.align 2, 0
_080060F8: .4byte gUnknown_03002A80
_080060FC:
	strb r5, [r3]
	adds r3, #1
	movs r2, #0
	adds r6, r7, #0
	b _08006142
_08006106:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, ip
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _0800613C
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r5, [r3]
	ldr r1, _08006158 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	strb r5, [r3]
	adds r3, #1
_0800613C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006142:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r6, #0x10
	cmp r0, #0
	bge _0800614E
	rsbs r0, r0, #0
_0800614E:
	cmp r2, r0
	blt _08006106
	strb r5, [r3]
	b _08006214
	.align 2, 0
_08006158: .4byte gUnknown_03002A80
_0800615C:
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080061C0
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	b _080061A8
_08006178:
	adds r2, r5, #1
	strb r2, [r3]
	adds r3, #1
	strb r5, [r3]
	ldr r1, _080061BC @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080061A2
	lsls r0, r2, #0x18
	lsrs r5, r0, #0x18
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080061A2:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080061A8:
	lsls r0, r2, #0x10
	asrs r6, r0, #0x10
	mov r2, sb
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _080061B6
	rsbs r0, r0, #0
_080061B6:
	cmp r6, r0
	blt _08006178
	b _08006214
	.align 2, 0
_080061BC: .4byte gUnknown_03002A80
_080061C0:
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	b _08006202
_080061D0:
	adds r0, r5, #1
	strb r0, [r3]
	adds r3, #1
	strb r5, [r3]
	ldr r1, _08006224 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080061FC
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	subs r0, r1, r6
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080061FC:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006202:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _08006210
	rsbs r0, r0, #0
_08006210:
	cmp r2, r0
	blt _080061D0
_08006214:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006224: .4byte gUnknown_03002A80

	thumb_func_start sub_8006228
sub_8006228: @ 0x08006228
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov ip, r5
	ldr r1, _08006278 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006290
	ldr r1, _0800627C @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006284
	ldr r0, _08006280 @ =gUnknown_03001884
	ldr r0, [r0]
	adds r3, r0, #2
	b _080062B8
	.align 2, 0
_08006278: .4byte gFlags
_0800627C: .4byte gUnknown_03002A80
_08006280: .4byte gUnknown_03001884
_08006284:
	ldr r0, _0800628C @ =gUnknown_03001884
	ldr r3, [r0]
	b _080062B8
	.align 2, 0
_0800628C: .4byte gUnknown_03001884
_08006290:
	ldr r1, _080062A8 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080062AC @ =gUnknown_03001884
	ldr r3, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _080062B8
	ldr r1, _080062B0 @ =gUnknown_03002878
	ldr r0, _080062B4 @ =0x04000042
	b _080062BC
	.align 2, 0
_080062A8: .4byte gUnknown_03002A80
_080062AC: .4byte gUnknown_03001884
_080062B0: .4byte gUnknown_03002878
_080062B4: .4byte 0x04000042
_080062B8:
	ldr r1, _08006320 @ =gUnknown_03002878
	ldr r0, _08006324 @ =0x04000040
_080062BC:
	str r0, [r1]
	mov r0, r8
	subs r1, r0, r6
	mov r2, sl
	subs r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r5, r1, #0x10
	asrs r2, r5, #0x10
	adds r0, r2, #0
	cmp r2, #0
	bge _080062D6
	rsbs r0, r2, #0
_080062D6:
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r4, r1, #0
	mov sb, r0
	cmp r1, #0
	bge _080062EA
	rsbs r4, r1, #0
_080062EA:
	lsls r0, r4, #0x11
	lsrs r7, r0, #0x10
	ldr r4, _08006328 @ =gUnknown_03002A80
	ldrb r0, [r4]
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r4, r2, #0
	cmp r2, #0
	bge _08006302
	rsbs r4, r2, #0
_08006302:
	adds r0, r1, #0
	cmp r1, #0
	bge _0800630A
	rsbs r0, r1, #0
_0800630A:
	cmp r4, r0
	ble _080063DC
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _0800637C
	mov r0, ip
	strb r0, [r3, #1]
	movs r2, #0
	b _08006364
	.align 2, 0
_08006320: .4byte gUnknown_03002878
_08006324: .4byte 0x04000040
_08006328: .4byte gUnknown_03002A80
_0800632C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _0800635E
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r6, [r3]
	ldr r1, _08006378 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r3, r3, r0
	mov r0, ip
	strb r0, [r3, #1]
_0800635E:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006364:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _08006370
	rsbs r0, r0, #0
_08006370:
	cmp r2, r0
	blt _0800632C
	strb r6, [r3]
	b _08006496
	.align 2, 0
_08006378: .4byte gUnknown_03002A80
_0800637C:
	strb r6, [r3]
	adds r3, #1
	movs r2, #0
	b _080063C0
_08006384:
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _080063BA
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, ip
	strb r0, [r3]
	ldr r1, _080063D8 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	strb r6, [r3]
	adds r3, #1
_080063BA:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080063C0:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _080063CC
	rsbs r0, r0, #0
_080063CC:
	cmp r2, r0
	blt _08006384
	mov r2, ip
	strb r2, [r3]
	b _08006496
	.align 2, 0
_080063D8: .4byte gUnknown_03002A80
_080063DC:
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _08006440
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r7, r0, #0x10
	b _08006428
_080063F6:
	adds r2, r6, #1
	strb r2, [r3]
	adds r3, #1
	mov r0, ip
	strb r0, [r3]
	ldr r1, _0800643C @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08006422
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08006422:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006428:
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	mov r2, sb
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _08006436
	rsbs r0, r0, #0
_08006436:
	cmp r5, r0
	blt _080063F6
	b _08006496
	.align 2, 0
_0800643C: .4byte gUnknown_03002A80
_08006440:
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	b _08006484
_08006450:
	adds r0, r6, #1
	strb r0, [r3]
	adds r3, #1
	mov r0, ip
	strb r0, [r3]
	ldr r1, _080064A4 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0800647E
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0800647E:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006484:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _08006492
	rsbs r0, r0, #0
_08006492:
	cmp r2, r0
	blt _08006450
_08006496:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080064A4: .4byte gUnknown_03002A80

	thumb_func_start sub_80064A8
sub_80064A8: @ 0x080064A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov ip, r5
	ldr r1, _080064F8 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006510
	ldr r1, _080064FC @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006504
	ldr r0, _08006500 @ =gUnknown_03001884
	ldr r0, [r0]
	adds r3, r0, #2
	b _08006538
	.align 2, 0
_080064F8: .4byte gFlags
_080064FC: .4byte gUnknown_03002A80
_08006500: .4byte gUnknown_03001884
_08006504:
	ldr r0, _0800650C @ =gUnknown_03001884
	ldr r3, [r0]
	b _08006538
	.align 2, 0
_0800650C: .4byte gUnknown_03001884
_08006510:
	ldr r1, _08006528 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0800652C @ =gUnknown_03001884
	ldr r3, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006538
	ldr r1, _08006530 @ =gUnknown_03002878
	ldr r0, _08006534 @ =0x04000042
	b _0800653C
	.align 2, 0
_08006528: .4byte gUnknown_03002A80
_0800652C: .4byte gUnknown_03001884
_08006530: .4byte gUnknown_03002878
_08006534: .4byte 0x04000042
_08006538:
	ldr r1, _080065A0 @ =gUnknown_03002878
	ldr r0, _080065A4 @ =0x04000040
_0800653C:
	str r0, [r1]
	mov r0, r8
	subs r1, r0, r6
	mov r2, sl
	subs r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r5, r1, #0x10
	asrs r2, r5, #0x10
	adds r0, r2, #0
	cmp r2, #0
	bge _08006556
	rsbs r0, r2, #0
_08006556:
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r4, r1, #0
	mov sb, r0
	cmp r1, #0
	bge _0800656A
	rsbs r4, r1, #0
_0800656A:
	lsls r0, r4, #0x11
	lsrs r7, r0, #0x10
	ldr r4, _080065A8 @ =gUnknown_03002A80
	ldrb r0, [r4]
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r4, r2, #0
	cmp r2, #0
	bge _08006582
	rsbs r4, r2, #0
_08006582:
	adds r0, r1, #0
	cmp r1, #0
	bge _0800658A
	rsbs r0, r1, #0
_0800658A:
	cmp r4, r0
	ble _08006660
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _08006600
	strb r6, [r3, #1]
	movs r2, #0
	b _080065E4
	.align 2, 0
_080065A0: .4byte gUnknown_03002878
_080065A4: .4byte 0x04000040
_080065A8: .4byte gUnknown_03002A80
_080065AC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _080065DE
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, ip
	strb r0, [r3]
	ldr r1, _080065FC @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r3, r3, r0
	strb r6, [r3, #1]
_080065DE:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080065E4:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _080065F0
	rsbs r0, r0, #0
_080065F0:
	cmp r2, r0
	blt _080065AC
	mov r2, ip
	strb r2, [r3]
	b _08006718
	.align 2, 0
_080065FC: .4byte gUnknown_03002A80
_08006600:
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
	movs r2, #0
	b _08006646
_0800660A:
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _08006640
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r6, [r3]
	ldr r1, _0800665C @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
_08006640:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006646:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r5, #0x10
	cmp r0, #0
	bge _08006652
	rsbs r0, r0, #0
_08006652:
	cmp r2, r0
	blt _0800660A
	strb r6, [r3]
	b _08006718
	.align 2, 0
_0800665C: .4byte gUnknown_03002A80
_08006660:
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080066C4
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	b _080066AC
_0800667A:
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
	strb r6, [r3]
	ldr r1, _080066C0 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080066A6
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080066A6:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080066AC:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _080066BA
	rsbs r0, r0, #0
_080066BA:
	cmp r2, r0
	blt _0800667A
	b _08006718
	.align 2, 0
_080066C0: .4byte gUnknown_03002A80
_080066C4:
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r7, #0x10
	asrs r5, r0, #0x10
	b _08006706
_080066D4:
	mov r0, ip
	strb r0, [r3]
	adds r3, #1
	strb r6, [r3]
	ldr r1, _08006728 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08006700
	subs r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	subs r0, r1, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08006700:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006706:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _08006714
	rsbs r0, r0, #0
_08006714:
	cmp r2, r0
	blt _080066D4
_08006718:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006728: .4byte gUnknown_03002A80

	thumb_func_start sub_800672C
sub_800672C: @ 0x0800672C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08006760 @ =gFlags
	ldr r0, [r1]
	movs r3, #4
	orrs r0, r3
	str r0, [r1]
	cmp r2, #1
	bls _08006778
	ldr r1, _08006764 @ =gUnknown_03002A80
	strb r3, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800676C
	ldr r0, _08006768 @ =gUnknown_03001884
	ldr r0, [r0]
	adds r7, r0, #2
	b _080067A0
	.align 2, 0
_08006760: .4byte gFlags
_08006764: .4byte gUnknown_03002A80
_08006768: .4byte gUnknown_03001884
_0800676C:
	ldr r0, _08006774 @ =gUnknown_03001884
	ldr r7, [r0]
	b _080067A0
	.align 2, 0
_08006774: .4byte gUnknown_03001884
_08006778:
	ldr r1, _08006790 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08006794 @ =gUnknown_03001884
	ldr r7, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080067A0
	ldr r1, _08006798 @ =gUnknown_03002878
	ldr r0, _0800679C @ =0x04000042
	b _080067A4
	.align 2, 0
_08006790: .4byte gUnknown_03002A80
_08006794: .4byte gUnknown_03001884
_08006798: .4byte gUnknown_03002878
_0800679C: .4byte 0x04000042
_080067A0:
	ldr r1, _080068A4 @ =gUnknown_03002878
	ldr r0, _080068A8 @ =0x04000040
_080067A4:
	str r0, [r1]
	mov r2, sp
	mov r1, ip
	ldrb r0, [r1, #2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	add r2, sp, #4
	mov r3, ip
	ldrb r0, [r3, #3]
	ldrb r1, [r3, #1]
	subs r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrb r3, [r3]
	mov r1, ip
	ldrb r4, [r1, #1]
	adds r2, #8
	str r2, [sp, #0x24]
	cmp r0, #0
	bge _080067D4
	rsbs r0, r0, #0
_080067D4:
	lsls r0, r0, #1
	ldr r5, [sp, #0x24]
	strh r0, [r5]
	mov r1, sp
	movs r2, #4
	ldrsh r0, [r1, r2]
	adds r1, #0x10
	str r1, [sp, #0x28]
	cmp r0, #0
	bge _080067EA
	rsbs r0, r0, #0
_080067EA:
	lsls r0, r0, #1
	ldr r5, [sp, #0x28]
	strh r0, [r5]
	mov r1, sp
	mov r2, ip
	ldrb r0, [r2, #4]
	subs r0, r0, r3
	strh r0, [r1, #2]
	ldrb r0, [r2, #5]
	subs r0, r0, r4
	strh r0, [r1, #6]
	mov r0, sp
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0800680C
	rsbs r0, r0, #0
_0800680C:
	lsls r0, r0, #1
	ldr r5, [sp, #0x24]
	strh r0, [r5, #2]
	mov r1, sp
	movs r2, #6
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0800681E
	rsbs r0, r0, #0
_0800681E:
	lsls r0, r0, #1
	ldr r3, [sp, #0x28]
	strh r0, [r3, #2]
	add r2, sp, #0x14
	mov r5, ip
	ldrb r0, [r5]
	strb r0, [r2, #1]
	strb r0, [r2]
	ldr r1, _080068AC @ =gUnknown_03002A80
	ldrb r0, [r1]
	muls r0, r4, r0
	adds r7, r7, r0
	add r1, sp, #8
	mov r3, sp
	ldrh r0, [r3, #4]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r3, #6]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	ldrb r0, [r5, #5]
	ldrb r3, [r5, #3]
	adds r6, r2, #0
	mov sb, r1
	cmp r0, r3
	bls _08006854
	adds r0, r3, #0
_08006854:
	str r0, [sp, #0x18]
	cmp r4, r0
	bhs _0800693A
	mov r8, sb
_0800685C:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	mov r5, sp
	ldrh r2, [r5, #0xc]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r5, #0xe]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _080068D6
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_08006888:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _080068B0
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _080068CC
	.align 2, 0
_080068A4: .4byte gUnknown_03002878
_080068A8: .4byte 0x04000040
_080068AC: .4byte gUnknown_03002A80
_080068B0:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080068BA
	subs r0, #1
	strb r0, [r6]
_080068BA:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080068CC
	ldrb r0, [r6]
	strb r0, [r7, #1]
_080068CC:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08006888
_080068D6:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006928
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_080068E6:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800690C
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800691E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _0800691E
_0800690C:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006916
	subs r0, #1
	strb r0, [r6, #1]
_08006916:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_0800691E:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080068E6
_08006928:
	ldr r2, _080069EC @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _0800685C
_0800693A:
	mov r1, ip
	ldrb r0, [r1, #3]
	ldrb r2, [r1, #5]
	cmp r0, r2
	bne _08006946
	b _08006C30
_08006946:
	ldr r3, [sp, #0x18]
	cmp r3, r0
	beq _0800694E
	b _08006AB4
_0800694E:
	mov r2, sp
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #2]
	subs r0, r0, r1
	strh r0, [r2]
	mov r5, ip
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #3]
	subs r0, r0, r1
	strh r0, [r2, #4]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0800696E
	rsbs r0, r0, #0
_0800696E:
	lsls r0, r0, #1
	ldr r2, [sp, #0x24]
	strh r0, [r2]
	mov r3, sp
	movs r5, #4
	ldrsh r0, [r3, r5]
	cmp r0, #0
	bge _08006980
	rsbs r0, r0, #0
_08006980:
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	mov r2, sp
	ldrh r0, [r2, #4]
	rsbs r0, r0, #0
	mov r3, sb
	strh r0, [r3]
	mov r5, ip
	ldrb r0, [r5, #2]
	strb r0, [r6]
	ldrb r0, [r5, #5]
	str r0, [sp, #0x18]
	cmp r4, r0
	bhs _08006A7A
	mov r8, sb
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x1c]
_080069A4:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	ldr r5, [sp, #0x1c]
	ldrh r2, [r5]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _08006A16
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_080069D0:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _080069F0
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _08006A0C
	.align 2, 0
_080069EC: .4byte gUnknown_03002A80
_080069F0:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080069FA
	subs r0, #1
	strb r0, [r6]
_080069FA:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006A0C
	ldrb r0, [r6]
	strb r0, [r7, #1]
_08006A0C:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _080069D0
_08006A16:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006A68
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_08006A26:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006A4C
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006A5E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _08006A5E
_08006A4C:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006A56
	subs r0, #1
	strb r0, [r6, #1]
_08006A56:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_08006A5E:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006A26
_08006A68:
	ldr r2, _08006AB0 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _080069A4
_08006A7A:
	mov r2, sp
	mov r1, ip
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	mov r2, ip
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #5]
	subs r0, r0, r1
	mov r3, sp
	strh r0, [r3, #6]
	mov r0, sp
	movs r5, #2
	ldrsh r0, [r0, r5]
	ldrb r3, [r2, #7]
	cmp r0, #0
	bge _08006AA0
	rsbs r0, r0, #0
_08006AA0:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1, #2]
	mov r2, sp
	movs r5, #6
	ldrsh r0, [r2, r5]
	b _08006CA4
	.align 2, 0
_08006AB0: .4byte gUnknown_03002A80
_08006AB4:
	mov r2, sp
	mov r3, ip
	ldrb r0, [r3, #6]
	ldrb r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrb r0, [r3, #7]
	ldrb r1, [r3, #5]
	subs r0, r0, r1
	strh r0, [r2, #6]
	mov r0, sp
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge _08006AD4
	rsbs r0, r0, #0
_08006AD4:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1, #2]
	mov r2, sp
	movs r3, #6
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _08006AE6
	rsbs r0, r0, #0
_08006AE6:
	lsls r0, r0, #1
	ldr r5, [sp, #0x28]
	strh r0, [r5, #2]
	mov r1, sp
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	mov r2, sb
	strh r0, [r2, #2]
	mov r3, ip
	ldrb r0, [r3, #4]
	strb r0, [r6, #1]
	ldrb r5, [r3, #3]
	str r5, [sp, #0x18]
	cmp r4, r5
	bhs _08006BDC
	mov r8, sb
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x20]
_08006B0A:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	ldr r1, [sp, #0x20]
	ldrh r2, [r1]
	ldrh r5, [r3]
	adds r2, r2, r5
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _08006B78
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_08006B36:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006B52
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _08006B6E
_08006B52:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006B5C
	subs r0, #1
	strb r0, [r6]
_08006B5C:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006B6E
	ldrb r0, [r6]
	strb r0, [r7, #1]
_08006B6E:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08006B36
_08006B78:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006BCA
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_08006B88:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006BAE
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006BC0
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _08006BC0
_08006BAE:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006BB8
	subs r0, #1
	strb r0, [r6, #1]
_08006BB8:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_08006BC0:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006B88
_08006BCA:
	ldr r2, _08006C2C @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _08006B0A
_08006BDC:
	mov r2, sp
	mov r1, ip
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #2]
	subs r0, r0, r1
	strh r0, [r2]
	mov r2, ip
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #3]
	subs r0, r0, r1
	mov r3, sp
	strh r0, [r3, #4]
	mov r0, sp
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrb r3, [r2, #7]
	cmp r0, #0
	bge _08006C02
	rsbs r0, r0, #0
_08006C02:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1]
	mov r2, sp
	movs r5, #4
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _08006C14
	rsbs r0, r0, #0
_08006C14:
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	mov r2, sp
	ldrh r0, [r2, #4]
	rsbs r0, r0, #0
	mov r5, sb
	strh r0, [r5]
	mov r1, ip
	ldrb r0, [r1, #2]
	strb r0, [r6]
	b _08006CC0
	.align 2, 0
_08006C2C: .4byte gUnknown_03002A80
_08006C30:
	mov r2, sp
	mov r3, ip
	ldrb r0, [r3, #6]
	ldrb r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2]
	add r2, sp, #4
	ldrb r0, [r3, #7]
	ldrb r1, [r3, #3]
	subs r0, r0, r1
	strh r0, [r2]
	mov r0, sp
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldrb r1, [r3, #6]
	mov r8, r1
	ldrb r3, [r3, #7]
	cmp r0, #0
	bge _08006C58
	rsbs r0, r0, #0
_08006C58:
	lsls r0, r0, #1
	ldr r5, [sp, #0x24]
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08006C68
	rsbs r0, r0, #0
_08006C68:
	lsls r0, r0, #1
	ldr r5, [sp, #0x28]
	strh r0, [r5]
	ldrh r0, [r2]
	rsbs r0, r0, #0
	mov r1, sb
	strh r0, [r1]
	mov r5, ip
	ldrb r0, [r5, #2]
	strb r0, [r6]
	mov r1, sp
	ldrb r0, [r5, #4]
	mov r5, r8
	subs r0, r5, r0
	strh r0, [r1, #2]
	mov r1, ip
	ldrb r0, [r1, #5]
	subs r0, r3, r0
	strh r0, [r2, #2]
	mov r0, sp
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge _08006C9A
	rsbs r0, r0, #0
_08006C9A:
	lsls r0, r0, #1
	ldr r1, [sp, #0x24]
	strh r0, [r1, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
_08006CA4:
	cmp r0, #0
	bge _08006CAA
	rsbs r0, r0, #0
_08006CAA:
	lsls r0, r0, #1
	ldr r1, [sp, #0x28]
	strh r0, [r1, #2]
	mov r2, sp
	ldrh r0, [r2, #6]
	rsbs r0, r0, #0
	mov r5, sb
	strh r0, [r5, #2]
	mov r1, ip
	ldrb r0, [r1, #4]
	strb r0, [r6, #1]
_08006CC0:
	str r3, [sp, #0x18]
	cmp r4, r3
	bhs _08006D9E
	mov r8, sb
	ldr r2, [sp, #0x24]
	mov ip, r2
_08006CCC:
	ldrb r0, [r6, #1]
	strb r0, [r7]
	ldrb r0, [r6]
	strb r0, [r7, #1]
	mov r3, r8
	mov r5, ip
	ldrh r2, [r5]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r0, [r3, #2]
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sl, r4
	cmp r2, #0
	blt _08006D3A
	str r6, [sp, #0x2c]
	ldr r4, [sp, #0x28]
	mov r2, sb
_08006CF8:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006D14
	ldr r5, [sp, #0x2c]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _08006D30
_08006D14:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006D1E
	subs r0, #1
	strb r0, [r6]
_08006D1E:
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006D30
	ldrb r0, [r6]
	strb r0, [r7, #1]
_08006D30:
	mov r3, sb
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08006CF8
_08006D3A:
	mov r2, r8
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006D8C
	adds r3, r6, #0
	ldr r5, [sp, #0x28]
	mov r4, sb
_08006D4A:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006D70
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006D82
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r7]
	b _08006D82
_08006D70:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08006D7A
	subs r0, #1
	strb r0, [r6, #1]
_08006D7A:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r4, #2]
_08006D82:
	mov r2, sb
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006D4A
_08006D8C:
	ldr r2, _08006DB0 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r7, r7, r0
	mov r3, sl
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r5, [sp, #0x18]
	cmp r4, r5
	blo _08006CCC
_08006D9E:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006DB0: .4byte gUnknown_03002A80

	thumb_func_start sub_8006DB4
sub_8006DB4: @ 0x08006DB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r1
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	add r6, sp, #4
	ldr r1, _08006E10 @ =gUnknown_080984F4
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	add r5, sp, #0xc
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl memset
	add r4, sp, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	ldr r1, _08006E14 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006E2C
	ldr r1, _08006E18 @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006E20
	ldr r0, _08006E1C @ =gUnknown_03001884
	ldr r0, [r0]
	adds r4, r0, #2
	b _08006E54
	.align 2, 0
_08006E10: .4byte gUnknown_080984F4
_08006E14: .4byte gFlags
_08006E18: .4byte gUnknown_03002A80
_08006E1C: .4byte gUnknown_03001884
_08006E20:
	ldr r0, _08006E28 @ =gUnknown_03001884
	ldr r4, [r0]
	b _08006E54
	.align 2, 0
_08006E28: .4byte gUnknown_03001884
_08006E2C:
	ldr r1, _08006E44 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08006E48 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006E54
	ldr r1, _08006E4C @ =gUnknown_03002878
	ldr r0, _08006E50 @ =0x04000042
	b _08006E58
	.align 2, 0
_08006E44: .4byte gUnknown_03002A80
_08006E48: .4byte gUnknown_03001884
_08006E4C: .4byte gUnknown_03002878
_08006E50: .4byte 0x04000042
_08006E54:
	ldr r1, _08006F68 @ =gUnknown_03002878
	ldr r0, _08006F6C @ =0x04000040
_08006E58:
	str r0, [r1]
	mov r1, sl
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #1]
	adds r5, r2, #0
	adds r1, r0, #0
	cmp r0, r5
	bls _08006E6A
	adds r0, r2, #0
_08006E6A:
	adds r3, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp ip, r5
	bhs _08006E78
	adds r1, r2, #0
_08006E78:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _08006F70 @ =gUnknown_03002A80
	ldrb r0, [r2]
	muls r0, r3, r0
	adds r4, r4, r0
	mov r2, sp
	mov r7, sl
	ldrb r0, [r7, #2]
	ldrb r1, [r7]
	subs r0, r0, r1
	strh r0, [r2]
	adds r7, r6, #0
	mov r1, sl
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #1]
	subs r0, r0, r1
	strh r0, [r7]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _08006EAA
	rsbs r0, r0, #0
_08006EAA:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0xc]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _08006EBA
	rsbs r0, r0, #0
_08006EBA:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x10]
	mov r2, sp
	mov r1, sl
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	mov r2, sl
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #5]
	subs r0, r0, r1
	strh r0, [r7, #2]
	mov r0, sp
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08006EE2
	rsbs r0, r0, #0
_08006EE2:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xe]
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bge _08006EF2
	rsbs r0, r0, #0
_08006EF2:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0x12]
	add r2, sp, #0x14
	mov r7, sl
	ldrb r0, [r7]
	strb r0, [r2]
	ldrb r0, [r7, #4]
	strb r0, [r2, #1]
	add r1, sp, #8
	ldrh r0, [r6]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	adds r6, r2, #0
	cmp r3, r8
	bne _08006F1A
	b _0800702C
_08006F1A:
	cmp r5, ip
	bhs _08006FB0
	cmp r3, r8
	blo _08006F24
	b _0800702C
_08006F24:
	adds r7, r6, #0
	adds r5, r1, #0
_08006F28:
	mov r0, sb
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r5]
	lsls r0, r0, #0x10
	adds r3, #1
	mov ip, r3
	cmp r0, #0
	blt _08006F98
	add r2, sp, #8
	add r3, sp, #0x10
_08006F48:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006F74
	ldrb r0, [r7]
	cmp sb, r0
	ble _08006F5C
	adds r0, #1
	strb r0, [r6]
_08006F5C:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _08006F90
	.align 2, 0
_08006F68: .4byte gUnknown_03002878
_08006F6C: .4byte 0x04000040
_08006F70: .4byte gUnknown_03002A80
_08006F74:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006F7E
	subs r0, #1
	strb r0, [r6]
_08006F7E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006F90
	ldrb r0, [r6]
	strb r0, [r4, #1]
_08006F90:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08006F48
_08006F98:
	ldr r2, _08006FAC @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08006F28
	b _0800702C
	.align 2, 0
_08006FAC: .4byte gUnknown_03002A80
_08006FB0:
	cmp r3, r8
	bhs _0800702C
	adds r7, r6, #0
	add r5, sp, #8
_08006FB8:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	ldrh r1, [r5, #2]
	mov r2, sp
	ldrh r0, [r2, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #2]
	lsls r1, r1, #0x10
	adds r3, #1
	mov ip, r3
	cmp r1, #0
	blt _0800701C
	add r2, sp, #8
	add r3, sp, #0x10
_08006FD8:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08007002
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _08006FEC
	adds r0, #1
	strb r0, [r6, #1]
_08006FEC:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007014
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _08007014
_08007002:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0800700C
	subs r0, #1
	strb r0, [r6, #1]
_0800700C:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_08007014:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006FD8
_0800701C:
	ldr r1, _08007090 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r4, r4, r0
	mov r2, ip
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08006FB8
_0800702C:
	mov r7, sl
	ldrb r0, [r7, #7]
	ldrb r1, [r7, #3]
	cmp r0, r1
	bls _08007038
	adds r0, r1, #0
_08007038:
	mov r8, r0
	cmp r3, r8
	bhs _08007118
	adds r7, r6, #0
	add r5, sp, #8
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x18]
_08007048:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	ldr r1, [sp, #0x18]
	ldrh r2, [r1]
	ldrh r0, [r5]
	adds r2, r2, r0
	strh r2, [r5]
	ldrh r1, [r1, #2]
	mov ip, r1
	ldrh r0, [r5, #2]
	add r0, ip
	strh r0, [r5, #2]
	lsls r2, r2, #0x10
	adds r3, #1
	mov ip, r3
	cmp r2, #0
	blt _080070B8
	add r2, sp, #8
	add r3, sp, #0x10
_08007072:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08007094
	ldrb r0, [r7]
	cmp sb, r0
	ble _08007086
	adds r0, #1
	strb r0, [r6]
_08007086:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _080070B0
	.align 2, 0
_08007090: .4byte gUnknown_03002A80
_08007094:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800709E
	subs r0, #1
	strb r0, [r6]
_0800709E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080070B0
	ldrb r0, [r6]
	strb r0, [r4, #1]
_080070B0:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08007072
_080070B8:
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007108
	add r2, sp, #8
	add r3, sp, #0x10
_080070C4:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080070EE
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _080070D8
	adds r0, #1
	strb r0, [r6, #1]
_080070D8:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007100
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _08007100
_080070EE:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _080070F8
	subs r0, #1
	strb r0, [r6, #1]
_080070F8:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_08007100:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080070C4
_08007108:
	ldr r2, _08007188 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08007048
_08007118:
	mov r2, sl
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #3]
	adds r2, r1, #0
	adds r7, r0, #0
	cmp r0, r2
	bhs _08007128
	adds r0, r1, #0
_08007128:
	mov r8, r0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	cmp r2, r0
	bhi _080071BC
	cmp r3, r8
	blo _08007138
	b _08007238
_08007138:
	adds r7, r6, #0
	add r5, sp, #8
_0800713C:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	ldrh r1, [r5, #2]
	mov r2, sp
	ldrh r0, [r2, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #2]
	lsls r1, r1, #0x10
	adds r3, #1
	mov ip, r3
	cmp r1, #0
	blt _080071A6
	add r2, sp, #8
	add r3, sp, #0x10
_0800715C:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800718C
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _08007170
	adds r0, #1
	strb r0, [r6, #1]
_08007170:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800719E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _0800719E
	.align 2, 0
_08007188: .4byte gUnknown_03002A80
_0800718C:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _08007196
	subs r0, #1
	strb r0, [r6, #1]
_08007196:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_0800719E:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800715C
_080071A6:
	ldr r1, _080071B8 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r4, r4, r0
	mov r2, ip
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _0800713C
	b _08007238
	.align 2, 0
_080071B8: .4byte gUnknown_03002A80
_080071BC:
	cmp r3, r8
	bhs _08007238
	adds r7, r6, #0
	add r5, sp, #8
_080071C4:
	mov r0, sb
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r5]
	lsls r0, r0, #0x10
	adds r3, #1
	mov ip, r3
	cmp r0, #0
	blt _08007228
	add r2, sp, #8
	add r3, sp, #0x10
_080071E4:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08007202
	ldrb r0, [r7]
	cmp sb, r0
	ble _080071F8
	adds r0, #1
	strb r0, [r6]
_080071F8:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _08007220
_08007202:
	adds r1, r6, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800720E
	subs r0, #1
	strb r0, [r1]
_0800720E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007220
	ldrb r0, [r6]
	strb r0, [r4, #1]
_08007220:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080071E4
_08007228:
	ldr r2, _08007248 @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _080071C4
_08007238:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007248: .4byte gUnknown_03002A80

	thumb_func_start sub_800724C
sub_800724C: @ 0x0800724C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	add r6, sp, #4
	ldr r1, _080072A8 @ =gUnknown_080984F4
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	add r5, sp, #0xc
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl memset
	add r4, sp, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	ldr r1, _080072AC @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	mov r8, r6
	cmp r7, #1
	bls _080072C4
	ldr r1, _080072B0 @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _080072B8
	ldr r0, _080072B4 @ =gUnknown_03001884
	ldr r0, [r0]
	adds r5, r0, #2
	b _080072EC
	.align 2, 0
_080072A8: .4byte gUnknown_080984F4
_080072AC: .4byte gFlags
_080072B0: .4byte gUnknown_03002A80
_080072B4: .4byte gUnknown_03001884
_080072B8:
	ldr r0, _080072C0 @ =gUnknown_03001884
	ldr r5, [r0]
	b _080072EC
	.align 2, 0
_080072C0: .4byte gUnknown_03001884
_080072C4:
	ldr r1, _080072DC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080072E0 @ =gUnknown_03001884
	ldr r5, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _080072EC
	ldr r1, _080072E4 @ =gUnknown_03002878
	ldr r0, _080072E8 @ =0x04000042
	b _080072F0
	.align 2, 0
_080072DC: .4byte gUnknown_03002A80
_080072E0: .4byte gUnknown_03001884
_080072E4: .4byte gUnknown_03002878
_080072E8: .4byte 0x04000042
_080072EC:
	ldr r1, _08007400 @ =gUnknown_03002878
	ldr r0, _08007404 @ =0x04000040
_080072F0:
	str r0, [r1]
	mov r1, sl
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #1]
	adds r7, r2, #0
	adds r1, r0, #0
	cmp r0, r7
	bls _08007302
	adds r0, r2, #0
_08007302:
	adds r4, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp sb, r7
	bhs _08007310
	adds r1, r2, #0
_08007310:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r2, _08007408 @ =gUnknown_03002A80
	ldrb r0, [r2]
	muls r0, r4, r0
	adds r5, r5, r0
	mov r2, sp
	mov r3, sl
	ldrb r0, [r3, #2]
	ldrb r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	mov r3, r8
	mov r6, sl
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #1]
	subs r0, r0, r1
	strh r0, [r3]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08007342
	rsbs r0, r0, #0
_08007342:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xc]
	movs r6, #0
	ldrsh r0, [r3, r6]
	cmp r0, #0
	bge _08007352
	rsbs r0, r0, #0
_08007352:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x10]
	mov r2, sp
	mov r6, sl
	ldrb r0, [r6, #6]
	ldrb r1, [r6, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	ldrb r0, [r6, #7]
	ldrb r1, [r6, #5]
	subs r0, r0, r1
	strh r0, [r3, #2]
	mov r0, sp
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08007378
	rsbs r0, r0, #0
_08007378:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xe]
	movs r6, #2
	ldrsh r0, [r3, r6]
	cmp r0, #0
	bge _08007388
	rsbs r0, r0, #0
_08007388:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x12]
	add r2, sp, #0x14
	mov r3, sl
	ldrb r0, [r3]
	strb r0, [r2]
	ldrb r0, [r3, #4]
	strb r0, [r2, #1]
	add r1, sp, #8
	mov r6, r8
	ldrh r0, [r6]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	mov r8, r2
	mov ip, r1
	ldr r0, [sp, #0x18]
	cmp r4, r0
	bne _080073B6
	b _080074C8
_080073B6:
	cmp r7, sb
	bhs _08007448
	cmp r4, r0
	blo _080073C0
	b _080074C8
_080073C0:
	movs r0, #0xf0
	strb r0, [r5]
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r5, #1]
	add r2, sp, #8
	mov r3, sp
	ldrh r0, [r3, #0xc]
	ldrh r6, [r2]
	adds r0, r0, r6
	strh r0, [r2]
	lsls r0, r0, #0x10
	adds r4, #1
	mov sb, r4
	cmp r0, #0
	blt _08007430
	mov r3, r8
	add r4, sp, #0x10
	mov r6, ip
_080073E6:
	mov r0, sp
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #0
	ble _0800740C
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrh r0, [r2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	b _08007426
	.align 2, 0
_08007400: .4byte gUnknown_03002878
_08007404: .4byte 0x04000040
_08007408: .4byte gUnknown_03002A80
_0800740C:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrh r0, [r6]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007426
	mov r1, r8
	ldrb r0, [r1]
	strb r0, [r5, #1]
_08007426:
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0
	bge _080073E6
_08007430:
	ldr r1, _08007444 @ =gUnknown_03002A80
	ldrb r0, [r1]
	adds r5, r5, r0
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
	ldr r3, [sp, #0x18]
	cmp r4, r3
	blo _080073C0
	b _080074C8
	.align 2, 0
_08007444: .4byte gUnknown_03002A80
_08007448:
	ldr r6, [sp, #0x18]
	cmp r4, r6
	bhs _080074C8
	mov r7, ip
_08007450:
	mov r1, r8
	ldrb r0, [r1, #1]
	strb r0, [r5]
	movs r0, #0
	strb r0, [r5, #1]
	adds r2, r7, #0
	ldrh r1, [r2, #2]
	mov r3, sp
	ldrh r0, [r3, #0xe]
	adds r1, r1, r0
	strh r1, [r2, #2]
	lsls r1, r1, #0x10
	adds r4, #1
	mov sb, r4
	cmp r1, #0
	blt _080074B6
	mov r3, r8
	add r4, sp, #0x10
	mov r6, ip
_08007476:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800749E
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080074AC
	mov r1, r8
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r5]
	b _080074AC
_0800749E:
	ldrb r0, [r3, #1]
	subs r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r6, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r6, #2]
_080074AC:
	mov r2, ip
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08007476
_080074B6:
	ldr r2, _0800752C @ =gUnknown_03002A80
	ldrb r0, [r2]
	adds r5, r5, r0
	mov r3, sb
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	ldr r6, [sp, #0x18]
	cmp r4, r6
	blo _08007450
_080074C8:
	mov r7, sl
	ldrb r0, [r7, #7]
	ldrb r1, [r7, #3]
	cmp r0, r1
	bls _080074D4
	adds r0, r1, #0
_080074D4:
	str r0, [sp, #0x18]
	cmp r4, r0
	bhs _080075BA
	mov r7, ip
	add r0, sp, #0xc
	mov sl, r0
_080074E0:
	mov r1, r8
	ldrb r0, [r1, #1]
	strb r0, [r5]
	ldrb r0, [r1]
	strb r0, [r5, #1]
	adds r3, r7, #0
	mov r6, sl
	ldrh r2, [r6]
	ldrh r0, [r7]
	adds r2, r2, r0
	strh r2, [r7]
	ldrh r0, [r7, #2]
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r7, #2]
	lsls r2, r2, #0x10
	adds r4, #1
	mov sb, r4
	cmp r2, #0
	blt _08007558
	mov r2, r8
	add r4, sp, #0x10
	mov r1, ip
	str r1, [sp, #0x1c]
_08007510:
	mov r0, sp
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, #0
	ble _08007530
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrh r0, [r3]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r3]
	b _0800754E
	.align 2, 0
_0800752C: .4byte gUnknown_03002A80
_08007530:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	ldrh r1, [r4]
	subs r0, r0, r1
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800754E
	mov r6, r8
	ldrb r0, [r6]
	strb r0, [r5, #1]
_0800754E:
	mov r3, ip
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08007510
_08007558:
	adds r2, r7, #0
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080075A8
	mov r3, r8
	add r4, sp, #0x10
	mov r6, ip
_08007568:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08007590
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r2, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800759E
	mov r2, r8
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r5]
	b _0800759E
_08007590:
	ldrb r0, [r3, #1]
	subs r0, #1
	strb r0, [r3, #1]
	ldrh r0, [r6, #2]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	strh r0, [r6, #2]
_0800759E:
	mov r2, ip
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08007568
_080075A8:
	ldr r3, _080075CC @ =gUnknown_03002A80
	ldrb r0, [r3]
	adds r5, r5, r0
	mov r6, sb
	lsls r0, r6, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x18]
	cmp r4, r0
	blo _080074E0
_080075BA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080075CC: .4byte gUnknown_03002A80

	thumb_func_start sub_80075D0
sub_80075D0: @ 0x080075D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r5, #0
	muls r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r1, _08007628 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08007640
	ldr r1, _0800762C @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	adds r2, r1, #0
	cmp r0, #0
	beq _08007634
	ldr r0, _08007630 @ =gUnknown_03001884
	ldr r0, [r0]
	adds r4, r0, #2
	b _0800766C
	.align 2, 0
_08007628: .4byte gFlags
_0800762C: .4byte gUnknown_03002A80
_08007630: .4byte gUnknown_03001884
_08007634:
	ldr r0, _0800763C @ =gUnknown_03001884
	ldr r4, [r0]
	b _0800766C
	.align 2, 0
_0800763C: .4byte gUnknown_03001884
_08007640:
	ldr r1, _0800765C @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08007660 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r0, #1
	ands r0, r7
	adds r2, r1, #0
	cmp r0, #0
	beq _0800766C
	ldr r1, _08007664 @ =gUnknown_03002878
	ldr r0, _08007668 @ =0x04000042
	b _08007670
	.align 2, 0
_0800765C: .4byte gUnknown_03002A80
_08007660: .4byte gUnknown_03001884
_08007664: .4byte gUnknown_03002878
_08007668: .4byte 0x04000042
_0800766C:
	ldr r1, _080076D8 @ =gUnknown_03002878
	ldr r0, _080076DC @ =0x04000040
_08007670:
	str r0, [r1]
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	subs r0, r1, r6
	cmp r0, r5
	ble _08007682
	subs r0, r3, r5
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08007682:
	mov r7, r8
	subs r0, r7, r1
	cmp r0, r5
	ble _08007692
	adds r0, r3, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_08007692:
	ldrb r0, [r2]
	muls r0, r6, r0
	adds r4, r4, r0
	cmp r6, r8
	bhs _08007724
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
_080076A2:
	subs r0, r6, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r7, r0, #0
	muls r7, r0, r7
	adds r0, r7, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	subs r0, r1, r0
	str r3, [sp]
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp]
	cmp r0, #0
	bge _080076E0
	movs r0, #0
	strb r0, [r4]
	b _080076EC
	.align 2, 0
_080076D8: .4byte gUnknown_03002878
_080076DC: .4byte 0x04000040
_080076E0:
	cmp r0, #0xf0
	ble _080076EA
	movs r0, #0xf0
	strb r0, [r4]
	b _080076EC
_080076EA:
	strb r1, [r4]
_080076EC:
	adds r4, #1
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _08007704
	movs r0, #0xf0
	strb r0, [r4]
	b _08007710
_08007704:
	cmp r0, #0
	bge _0800770E
	movs r0, #0
	strb r0, [r4]
	b _08007710
_0800770E:
	strb r1, [r4]
_08007710:
	adds r4, #1
	ldr r0, _08007734 @ =gUnknown_03002A80
	ldrb r0, [r0]
	subs r0, #2
	adds r4, r4, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r8
	blo _080076A2
_08007724:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007734: .4byte gUnknown_03002A80

	thumb_func_start sub_8007738
sub_8007738: @ 0x08007738
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	ldr r6, [sp, #0x40]
	ldr r7, [sp, #0x44]
	mov r8, r7
	ldr r7, [sp, #0x48]
	mov sb, r7
	ldr r7, [sp, #0x4c]
	mov sl, r7
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #4]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #8]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r1, r8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r2, sb
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	mov r5, sl
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r1, [sp, #0x50]
	lsls r1, r1, #0x10
	str r1, [sp, #0x14]
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r2, _08007838 @ =gFlags
	ldr r1, [r2]
	movs r3, #4
	orrs r1, r3
	str r1, [r2]
	ldr r1, _0800783C @ =gUnknown_03002878
	lsrs r0, r0, #0x16
	ldr r2, _08007840 @ =0x04000010
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08007844 @ =gUnknown_03002A80
	strb r3, [r0]
	ldr r0, _08007848 @ =gUnknown_03001884
	lsls r1, r7, #2
	ldr r0, [r0]
	adds r1, r0, r1
	ldr r0, [sp]
	cmp r7, r0
	bhs _08007826
	ldr r4, _0800784C @ =gSineTable
	ldr r3, _08007850 @ =0x000003FF
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r5, _08007854 @ =0x000001FF
	adds r2, r5, #0
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_080077D4:
	mov r0, ip
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r5, [sp, #4]
	muls r0, r5, r0
	asrs r0, r0, #0xe
	add r0, sb
	ands r0, r2
	strh r0, [r1]
	adds r1, #2
	adds r0, r6, #0
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r5, [sp, #0xc]
	muls r0, r5, r0
	asrs r0, r0, #0xe
	add r0, r8
	ands r0, r2
	strh r0, [r1]
	adds r1, #2
	ldr r0, [sp, #8]
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r5, [sp, #0x10]
	adds r0, r6, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp]
	cmp r7, r0
	blo _080077D4
_08007826:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007838: .4byte gFlags
_0800783C: .4byte gUnknown_03002878
_08007840: .4byte 0x04000010
_08007844: .4byte gUnknown_03002A80
_08007848: .4byte gUnknown_03001884
_0800784C: .4byte gSineTable
_08007850: .4byte 0x000003FF
_08007854: .4byte 0x000001FF

	thumb_func_start sub_8007858
sub_8007858: @ 0x08007858
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	ldr r3, [sp, #0x14]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _080078BC @ =gFlags
	ldr r1, [r2]
	movs r3, #4
	orrs r1, r3
	str r1, [r2]
	ldr r1, _080078C0 @ =gUnknown_03002878
	lsrs r0, r0, #0x16
	ldr r2, _080078C4 @ =0x04000010
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _080078C8 @ =gUnknown_03002A80
	strb r3, [r0]
	ldr r0, _080078CC @ =gUnknown_03001884
	lsls r1, r5, #2
	ldr r0, [r0]
	adds r2, r0, r1
	subs r4, r4, r5
	ldr r1, _080078D0 @ =0x000001FF
	adds r0, r1, #0
	ands r4, r0
	ands r7, r0
	cmp r5, r6
	bhs _080078B4
_0800789A:
	strh r7, [r2]
	adds r2, #2
	adds r0, r4, #0
	subs r1, r0, #1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	strh r0, [r2]
	adds r2, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r6
	blo _0800789A
_080078B4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080078BC: .4byte gFlags
_080078C0: .4byte gUnknown_03002878
_080078C4: .4byte 0x04000010
_080078C8: .4byte gUnknown_03002A80
_080078CC: .4byte gUnknown_03001884
_080078D0: .4byte 0x000001FF

	thumb_func_start sub_80078D4
sub_80078D4: @ 0x080078D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, [sp, #0x18]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _0800793C @ =gFlags
	ldr r1, [r2]
	movs r3, #4
	orrs r1, r3
	str r1, [r2]
	ldr r1, _08007940 @ =gUnknown_03002878
	lsrs r0, r0, #0x16
	ldr r2, _08007944 @ =0x04000010
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08007948 @ =gUnknown_03002A80
	strb r3, [r0]
	cmp r5, r7
	bhs _08007934
	ldr r2, _0800794C @ =0x000001FF
	adds r1, r6, #0
	ands r1, r2
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [sp]
	ldr r2, _08007950 @ =0x040000D4
	mov r0, sp
	str r0, [r2]
	ldr r0, _08007954 @ =gUnknown_03001884
	lsls r1, r5, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2, #4]
	subs r0, r7, r5
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08007934:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800793C: .4byte gFlags
_08007940: .4byte gUnknown_03002878
_08007944: .4byte 0x04000010
_08007948: .4byte gUnknown_03002A80
_0800794C: .4byte 0x000001FF
_08007950: .4byte 0x040000D4
_08007954: .4byte gUnknown_03001884

	thumb_func_start sub_8007958
sub_8007958: @ 0x08007958
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	mov r8, r6
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov sb, r5
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r2, _080079F0 @ =gFlags
	ldr r1, [r2]
	movs r3, #4
	orrs r1, r3
	str r1, [r2]
	ldr r1, _080079F4 @ =gUnknown_03002878
	lsrs r0, r0, #0x16
	ldr r2, _080079F8 @ =0x04000010
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _080079FC @ =gUnknown_03002A80
	strb r3, [r0]
	ldr r0, _08007A00 @ =gUnknown_03001884
	lsls r1, r7, #2
	ldr r0, [r0]
	adds r2, r0, r1
	cmp r7, ip
	bhs _080079E0
	ldr r0, _08007A04 @ =0x000001FF
	adds r3, r0, #0
_080079B2:
	mov r1, sb
	adds r0, r1, r6
	ands r0, r3
	strh r0, [r2]
	adds r2, #2
	strh r5, [r2]
	adds r2, #2
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	rsbs r1, r1, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, ip
	blo _080079B2
_080079E0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080079F0: .4byte gFlags
_080079F4: .4byte gUnknown_03002878
_080079F8: .4byte 0x04000010
_080079FC: .4byte gUnknown_03002A80
_08007A00: .4byte gUnknown_03001884
_08007A04: .4byte 0x000001FF

	thumb_func_start sub_8007A08
sub_8007A08: @ 0x08007A08
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08007A44 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r6, #1
	bls _08007A5C
	ldr r1, _08007A48 @ =gUnknown_03002A80
	strb r2, [r1]
	movs r0, #1
	ands r0, r6
	adds r6, r1, #0
	cmp r0, #0
	beq _08007A50
	ldr r0, _08007A4C @ =gUnknown_03001884
	ldr r0, [r0]
	adds r2, r0, #2
	b _08007A88
	.align 2, 0
_08007A44: .4byte gFlags
_08007A48: .4byte gUnknown_03002A80
_08007A4C: .4byte gUnknown_03001884
_08007A50:
	ldr r0, _08007A58 @ =gUnknown_03001884
	ldr r2, [r0]
	b _08007A88
	.align 2, 0
_08007A58: .4byte gUnknown_03001884
_08007A5C:
	ldr r1, _08007A78 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08007A7C @ =gUnknown_03001884
	ldr r2, [r0]
	movs r0, #1
	ands r0, r6
	adds r6, r1, #0
	cmp r0, #0
	beq _08007A88
	ldr r1, _08007A80 @ =gUnknown_03002878
	ldr r0, _08007A84 @ =0x04000042
	b _08007A8C
	.align 2, 0
_08007A78: .4byte gUnknown_03002A80
_08007A7C: .4byte gUnknown_03001884
_08007A80: .4byte gUnknown_03002878
_08007A84: .4byte 0x04000042
_08007A88:
	ldr r1, _08007AB8 @ =gUnknown_03002878
	ldr r0, _08007ABC @ =0x04000040
_08007A8C:
	str r0, [r1]
	ldrb r0, [r6]
	muls r0, r5, r0
	adds r2, r2, r0
	cmp r5, r4
	bhs _08007AB0
	adds r1, r6, #0
_08007A9A:
	strb r3, [r2]
	adds r2, #1
	strb r7, [r2]
	ldrb r0, [r1]
	adds r0, r0, r2
	subs r2, r0, #1
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r4
	blo _08007A9A
_08007AB0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007AB8: .4byte gUnknown_03002878
_08007ABC: .4byte 0x04000040

	thumb_func_start sub_8007AC0
sub_8007AC0: @ 0x08007AC0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	ldr r3, _08007B14 @ =gFlags
	ldr r1, [r3]
	movs r2, #4
	orrs r1, r2
	str r1, [r3]
	ldr r2, _08007B18 @ =gUnknown_03002878
	lsrs r0, r0, #0x14
	subs r0, #0x20
	ldr r3, _08007B1C @ =0x04000020
	adds r1, r0, r3
	str r1, [r2]
	ldr r2, _08007B20 @ =gUnknown_03002A80
	movs r1, #2
	strb r1, [r2]
	ldr r1, _08007B24 @ =gUnknown_03001884
	lsls r2, r4, #1
	ldr r1, [r1]
	adds r2, r1, r2
	ldr r1, _08007B28 @ =gBgAffineRegs
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r4, r5
	bhs _08007B0E
_08007AFA:
	subs r0, r5, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, #2
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _08007AFA
_08007B0E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007B14: .4byte gFlags
_08007B18: .4byte gUnknown_03002878
_08007B1C: .4byte 0x04000020
_08007B20: .4byte gUnknown_03002A80
_08007B24: .4byte gUnknown_03001884
_08007B28: .4byte gBgAffineRegs
