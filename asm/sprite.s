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
	ldr r0, _08002B60 @ =REG_DISPSTAT
	ldrh r1, [r0]
	movs r0, #1    @ DISPSTAT_VBLANK
	ands r0, r1
	cmp r0, #0
	bne _08002B64
	movs r0, #0
	bl _08003618
	.align 2, 0
_08002B58: .4byte gUnknown_03002AE4
_08002B5C: .4byte gUnknown_0300287C
_08002B60: .4byte REG_DISPSTAT
_08002B64:
	ldr r0, _08002BC8 @ =REG_VCOUNT
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
_08002BC8: .4byte REG_VCOUNT
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
	ldr r0, _0800362C @ =REG_VCOUNT
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
_0800362C: .4byte REG_VCOUNT
_08003630: .4byte gUnknown_03002AE4
_08003634: .4byte gUnknown_0300287C
