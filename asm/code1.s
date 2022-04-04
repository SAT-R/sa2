.include "asm/macros.inc"

.syntax unified
.arm

	thumb_func_start MPlayStop
MPlayStop: @ 0x08095B44
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _08095B80 @ =0x68736D53
	cmp r1, r0
	bne _08095B7A
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _08095B76
_08095B66:
	adds r0, r6, #0
	adds r1, r5, #0
	bl TrackStop
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _08095B66
_08095B76:
	ldr r0, _08095B80 @ =0x68736D53
	str r0, [r6, #0x34]
_08095B7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095B80: .4byte 0x68736D53

	thumb_func_start FadeOutBody
FadeOutBody: @ 0x08095B84
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _08095C46
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _08095BC4 @ =0x0000FFFF
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _08095C46
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08095BC8
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _08095C1A
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _08095C1A
	.align 2, 0
_08095BC4: .4byte 0x0000FFFF
_08095BC8:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08095C1A
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _08095BFA
_08095BDE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl TrackStop
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _08095BF2
	strb r0, [r4]
_08095BF2:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08095BDE
_08095BFA:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _08095C0E
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _08095C12
_08095C0E:
	movs r0, #0x80
	lsls r0, r0, #0x18
_08095C12:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _08095C46
_08095C1A:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _08095C46
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_08095C28:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08095C3E
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_08095C3E:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _08095C28
_08095C46:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start TrkVolPitSet
TrkVolPitSet: @ 0x08095C4C
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08095CB0
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _08095C74
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_08095C74:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _08095C8A
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_08095C8A:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08095C96
	adds r1, r0, #0
	b _08095C9C
_08095C96:
	cmp r1, #0x7f
	ble _08095C9C
	movs r1, #0x7f
_08095C9C:
	adds r0, r1, #0
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x10]
	movs r0, #0x7f
	subs r0, r0, r1
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x11]
_08095CB0:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _08095CF4
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xf]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r2, r1]
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #0xd]
	adds r1, r0, r1
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _08095CEE
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_08095CEE:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_08095CF4:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MidiKeyToCgbFreq
MidiKeyToCgbFreq: @ 0x08095D00
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _08095D38
	cmp r5, #0x14
	bhi _08095D1C
	movs r5, #0
	b _08095D2A
_08095D1C:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _08095D2A
	movs r5, #0x3b
_08095D2A:
	ldr r0, _08095D34 @ =gUnknown_08ACDEA0
	adds r0, r5, r0
	ldrb r0, [r0]
	b _08095D9A
	.align 2, 0
_08095D34: .4byte gUnknown_08ACDEA0
_08095D38:
	cmp r5, #0x23
	bhi _08095D44
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _08095D56
_08095D44:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _08095D56
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_08095D56:
	ldr r3, _08095DA0 @ =gUnknown_08ACDE04
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _08095DA4 @ =gUnknown_08ACDE88
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_08095D9A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08095DA0: .4byte gUnknown_08ACDE04
_08095DA4: .4byte gUnknown_08ACDE88

	thumb_func_start CgbOscOff
CgbOscOff: @ 0x08095DA8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _08095DD0
	cmp r0, #2
	bgt _08095DBC
	cmp r0, #1
	beq _08095DC2
	b _08095DE4
_08095DBC:
	cmp r1, #3
	beq _08095DD8
	b _08095DE4
_08095DC2:
	ldr r1, _08095DCC @ =0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _08095DEC
	.align 2, 0
_08095DCC: .4byte 0x04000063
_08095DD0:
	ldr r1, _08095DD4 @ =0x04000069
	b _08095DE6
	.align 2, 0
_08095DD4: .4byte 0x04000069
_08095DD8:
	ldr r1, _08095DE0 @ =0x04000070
	movs r0, #0
	b _08095DEE
	.align 2, 0
_08095DE0: .4byte 0x04000070
_08095DE4:
	ldr r1, _08095DF4 @ =0x04000079
_08095DE6:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_08095DEC:
	movs r0, #0x80
_08095DEE:
	strb r0, [r1]
	bx lr
	.align 2, 0
_08095DF4: .4byte 0x04000079

	thumb_func_start sub_8095DF8
sub_8095DF8: @ 0x08095DF8
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _08095E18
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _08095E24
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _08095E32
_08095E18:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _08095E24
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _08095E32
_08095E24:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _08095E42
_08095E32:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _08095E44
	movs r0, #0xf
_08095E42:
	strb r0, [r1, #0xa]
_08095E44:
	ldrb r2, [r1, #6]
	ldrb r3, [r1, #0xa]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r1, #0x19]
	ldrb r0, [r1, #0x1c]
	ldrb r2, [r1, #0x1b]
	ands r0, r2
	strb r0, [r1, #0x1b]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CgbSound
CgbSound: @ 0x08095E60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08095E80 @ =0x03007ff0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _08095E84
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _08095E8A
	.align 2, 0
_08095E80: .4byte 0x03007ff0
_08095E84:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_08095E8A:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_08095E90:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _08095EA6
	b _08096290
_08095EA6:
	cmp r6, #2
	beq _08095ED8
	cmp r6, #2
	bgt _08095EB4
	cmp r6, #1
	beq _08095EBA
	b _08095F10
_08095EB4:
	cmp r6, #3
	beq _08095EF0
	b _08095F10
_08095EBA:
	ldr r0, _08095ECC @ =0x04000060
	str r0, [sp, #8]
	ldr r7, _08095ED0 @ =0x04000062
	ldr r2, _08095ED4 @ =0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _08095F20
	.align 2, 0
_08095ECC: .4byte 0x04000060
_08095ED0: .4byte 0x04000062
_08095ED4: .4byte 0x04000063
_08095ED8:
	ldr r0, _08095EE4 @ =0x04000061
	str r0, [sp, #8]
	ldr r7, _08095EE8 @ =0x04000068
	ldr r2, _08095EEC @ =0x04000069
	b _08095F18
	.align 2, 0
_08095EE4: .4byte 0x04000061
_08095EE8: .4byte 0x04000068
_08095EEC: .4byte 0x04000069
_08095EF0:
	ldr r0, _08095F04 @ =0x04000070
	str r0, [sp, #8]
	ldr r7, _08095F08 @ =0x04000072
	ldr r2, _08095F0C @ =0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _08095F20
	.align 2, 0
_08095F04: .4byte 0x04000070
_08095F08: .4byte 0x04000072
_08095F0C: .4byte 0x04000073
_08095F10:
	ldr r0, _08095F70 @ =0x04000071
	str r0, [sp, #8]
	ldr r7, _08095F74 @ =0x04000078
	ldr r2, _08095F78 @ =0x04000079
_08095F18:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_08095F20:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08096016
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _0809603A
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl sub_8095DF8
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _08095F88
	cmp r6, #2
	bgt _08095F7C
	cmp r6, #1
	beq _08095F82
	b _08095FDC
	.align 2, 0
_08095F70: .4byte 0x04000071
_08095F74: .4byte 0x04000078
_08095F78: .4byte 0x04000079
_08095F7C:
	cmp r6, #3
	beq _08095F94
	b _08095FDC
_08095F82:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_08095F88:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _08095FE8
_08095F94:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _08095FBC
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _08095FD0 @ =0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_08095FBC:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08095FD4
	movs r0, #0xc0
	b _08095FF6
	.align 2, 0
_08095FD0: .4byte 0x04000090
_08095FD4:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _08095FF8
_08095FDC:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_08095FE8:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _08095FF6
	movs r0, #0x40
_08095FF6:
	strb r0, [r4, #0x1a]
_08095FF8:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _08096012
	b _0809614E
_08096012:
	strb r2, [r4, #9]
	b _0809617C
_08096016:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08096048
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _0809603A
	b _0809618E
_0809603A:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _0809628C
_08096048:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _08096088
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08096088
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080960BA
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0809617C
	ldrb r2, [r4, #7]
	mov r8, r2
	b _0809617C
_08096088:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _0809617C
	cmp r6, #3
	bne _0809609A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_0809609A:
	adds r0, r4, #0
	bl sub_8095DF8
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _080960EE
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080960EA
_080960BA:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809603A
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _0809618E
	movs r2, #8
	mov r8, r2
	b _0809618E
_080960EA:
	ldrb r0, [r4, #7]
	b _0809617A
_080960EE:
	cmp r0, #1
	bne _080960FA
_080960F2:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _0809617A
_080960FA:
	cmp r0, #2
	bne _0809613E
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _0809613A
_08096112:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _08096122
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _080960BA
_08096122:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080960F2
	movs r0, #8
	mov r8, r0
	b _080960F2
_0809613A:
	ldrb r0, [r4, #5]
	b _0809617A
_0809613E:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _08096178
_0809614E:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _08096112
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _0809617C
	ldrb r2, [r4, #5]
	mov r8, r2
	b _0809617C
_08096178:
	ldrb r0, [r4, #4]
_0809617A:
	strb r0, [r4, #0xb]
_0809617C:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _0809618E
	subs r0, #1
	str r0, [sp]
	b _08096088
_0809618E:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _08096206
	cmp r6, #3
	bgt _080961CE
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _080961CE
	ldr r0, _080961B8 @ =0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _080961C0
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _080961BC @ =0x000007FC
	b _080961CA
	.align 2, 0
_080961B8: .4byte 0x04000089
_080961BC: .4byte 0x000007FC
_080961C0:
	cmp r0, #0x7f
	bgt _080961CE
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _080961DC @ =0x000007FE
_080961CA:
	ands r0, r1
	str r0, [r4, #0x20]
_080961CE:
	cmp r6, #4
	beq _080961E0
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _080961EE
	.align 2, 0
_080961DC: .4byte 0x000007FE
_080961E0:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_080961EE:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_08096206:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _0809628C
	ldr r1, _08096250 @ =0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _08096258
	ldr r0, _08096254 @ =gUnknown_08ACDEDC
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _0809628C
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _0809628C
	.align 2, 0
_08096250: .4byte 0x04000081
_08096254: .4byte gUnknown_08ACDEDC
_08096258:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _0809628C
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0809628C
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_0809628C:
	movs r0, #0
	strb r0, [r4, #0x1d]
_08096290:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _0809629A
	b _08095E90
_0809629A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80962AC
sub_80962AC: @ 0x080962AC
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080962D0 @ =0x68736D53
	cmp r3, r0
	bne _080962C8
	strh r1, [r2, #0x1e]
	ldrh r4, [r2, #0x1c]
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x20]
_080962C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080962D0: .4byte 0x68736D53

	thumb_func_start sub_80962D4
sub_80962D4: @ 0x080962D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _08096338 @ =0x68736D53
	cmp r3, r0
	bne _0809632C
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _08096328
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_08096304:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _0809631E
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _0809631E
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_0809631E:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _08096304
_08096328:
	ldr r0, _08096338 @ =0x68736D53
	str r0, [r4, #0x34]
_0809632C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096338: .4byte 0x68736D53

	thumb_func_start sub_809633C
sub_809633C: @ 0x0809633C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _080963AC @ =0x68736D53
	cmp r3, r0
	bne _0809639E
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r3, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _0809639A
	movs r0, #0x80
	mov sb, r0
	lsls r0, r6, #0x10
	asrs r7, r0, #0x18
	movs r0, #0xc
	mov r8, r0
_08096374:
	mov r0, ip
	ands r0, r5
	cmp r0, #0
	beq _08096390
	ldrb r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08096390
	strb r7, [r3, #0xb]
	strb r6, [r3, #0xd]
	mov r0, r8
	orrs r0, r1
	strb r0, [r3]
_08096390:
	subs r2, #1
	adds r3, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _08096374
_0809639A:
	ldr r0, _080963AC @ =0x68736D53
	str r0, [r4, #0x34]
_0809639E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080963AC: .4byte 0x68736D53

	thumb_func_start sub_80963B0
sub_80963B0: @ 0x080963B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, [r4, #0x34]
	ldr r0, _08096414 @ =0x68736D53
	cmp r3, r0
	bne _08096408
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _08096404
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_080963E0:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080963FA
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080963FA
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080963FA:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080963E0
_08096404:
	ldr r0, _08096414 @ =0x68736D53
	str r0, [r4, #0x34]
_08096408:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096414: .4byte 0x68736D53

	thumb_func_start sub_8096418
sub_8096418: @ 0x08096418
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _0809642C
	movs r0, #0xc
	b _0809642E
_0809642C:
	movs r0, #3
_0809642E:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_8096438
sub_8096438: @ 0x08096438
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _080964A8 @ =0x68736D53
	cmp r1, r0
	bne _08096498
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _08096494
	mov sb, r8
_08096468:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _0809648A
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0809648A
	mov r0, r8
	strb r0, [r4, #0x17]
	mov r1, sb
	cmp r1, #0
	bne _0809648A
	adds r0, r4, #0
	bl sub_8096418
_0809648A:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _08096468
_08096494:
	ldr r0, _080964A8 @ =0x68736D53
	str r0, [r6, #0x34]
_08096498:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080964A8: .4byte 0x68736D53

	thumb_func_start sub_80964AC
sub_80964AC: @ 0x080964AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	ldr r1, [r6, #0x34]
	ldr r0, _0809651C @ =0x68736D53
	cmp r1, r0
	bne _0809650C
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	movs r7, #1
	cmp r5, #0
	ble _08096508
	mov sb, r8
_080964DC:
	mov r0, sl
	ands r0, r7
	cmp r0, #0
	beq _080964FE
	movs r0, #0x80
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080964FE
	mov r0, r8
	strb r0, [r4, #0x19]
	mov r1, sb
	cmp r1, #0
	bne _080964FE
	adds r0, r4, #0
	bl sub_8096418
_080964FE:
	subs r5, #1
	adds r4, #0x50
	lsls r7, r7, #1
	cmp r5, #0
	bgt _080964DC
_08096508:
	ldr r0, _0809651C @ =0x68736D53
	str r0, [r6, #0x34]
_0809650C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809651C: .4byte 0x68736D53

	thumb_func_start ply_memacc
ply_memacc: @ 0x08096520
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _08096544
	b _08096672
_08096544:
	lsls r0, r5, #2
	ldr r1, _08096550 @ =_08096554
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096550: .4byte _08096554
_08096554: @ jump table
	.4byte _0809659C @ case 0
	.4byte _080965A0 @ case 1
	.4byte _080965A8 @ case 2
	.4byte _080965B0 @ case 3
	.4byte _080965BA @ case 4
	.4byte _080965C8 @ case 5
	.4byte _080965D6 @ case 6
	.4byte _080965DE @ case 7
	.4byte _080965E6 @ case 8
	.4byte _080965EE @ case 9
	.4byte _080965F6 @ case 10
	.4byte _080965FE @ case 11
	.4byte _08096606 @ case 12
	.4byte _08096614 @ case 13
	.4byte _08096622 @ case 14
	.4byte _08096630 @ case 15
	.4byte _0809663E @ case 16
	.4byte _0809664C @ case 17
_0809659C:
	strb r2, [r3]
	b _08096672
_080965A0:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _08096672
_080965A8:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _08096672
_080965B0:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _08096672
_080965BA:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _08096672
_080965C8:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _08096672
_080965D6:
	ldrb r3, [r3]
	cmp r3, r2
	beq _08096658
	b _0809666C
_080965DE:
	ldrb r3, [r3]
	cmp r3, r2
	bne _08096658
	b _0809666C
_080965E6:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _08096658
	b _0809666C
_080965EE:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _08096658
	b _0809666C
_080965F6:
	ldrb r3, [r3]
	cmp r3, r2
	bls _08096658
	b _0809666C
_080965FE:
	ldrb r3, [r3]
	cmp r3, r2
	blo _08096658
	b _0809666C
_08096606:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _08096658
	b _0809666C
_08096614:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _08096658
	b _0809666C
_08096622:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _08096658
	b _0809666C
_08096630:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _08096658
	b _0809666C
_0809663E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _08096658
	b _0809666C
_0809664C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _0809666C
_08096658:
	ldr r0, _08096668 @ =gUnknown_020023B4
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r2
	b _08096672
	.align 2, 0
_08096668: .4byte gUnknown_020023B4
_0809666C:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_08096672:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ply_xcmd
ply_xcmd: @ 0x08096678
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _08096694 @ =gUnknown_08ACDF20
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08096694: .4byte gUnknown_08ACDF20

	thumb_func_start sub_8096698
sub_8096698: @ 0x08096698
	push {lr}
	ldr r2, _080966A8 @ =gMPlayJumpTable
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080966A8: .4byte gMPlayJumpTable

	thumb_func_start sub_80966AC
sub_80966AC: @ 0x080966AC
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _080966E4 @ =0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _080966E8 @ =0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _080966EC @ =0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _080966F0 @ =0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080966E4: .4byte 0xFFFFFF00
_080966E8: .4byte 0xFFFF00FF
_080966EC: .4byte 0xFF00FFFF
_080966F0: .4byte 0x00FFFFFF

	thumb_func_start sub_80966F4
sub_80966F4: @ 0x080966F4
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_8096708
sub_8096708: @ 0x08096708
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_809671C
sub_809671C: @ 0x0809671C
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_8096730
sub_8096730: @ 0x08096730
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_8096744
sub_8096744: @ 0x08096744
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_8096758
sub_8096758: @ 0x08096758
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start sub_8096764
sub_8096764: @ 0x08096764
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	thumb_func_start sub_8096770
sub_8096770: @ 0x08096770
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start sub_8096784
sub_8096784: @ 0x08096784
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

	thumb_func_start DummyFunc
DummyFunc: @ 0x08096798
	bx lr
	.align 2, 0

	thumb_func_start sub_809679C
sub_809679C: @ 0x0809679C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080967B8 @ =0x0E005555
	movs r1, #0xaa
	strb r1, [r3]
	ldr r2, _080967BC @ =0x0E002AAA
	movs r1, #0x55
	strb r1, [r2]
	movs r1, #0xb0
	strb r1, [r3]
	movs r1, #0xe0
	lsls r1, r1, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_080967B8: .4byte 0x0E005555
_080967BC: .4byte 0x0E002AAA

	thumb_func_start sub_80967C0
sub_80967C0: @ 0x080967C0
	push {r4, r5, lr}
	sub sp, #0x44
	mov r0, sp
	bl sub_80969B0
	mov r5, sp
	adds r5, #1
	ldr r2, _080967E8 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r2]
	ldr r1, _080967EC @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r1]
	movs r0, #0x90
	strb r0, [r2]
	add r1, sp, #0x40
	ldr r2, _080967F0 @ =0x00004E20
	adds r0, r2, #0
	b _080967F8
	.align 2, 0
_080967E8: .4byte 0x0E005555
_080967EC: .4byte 0x0E002AAA
_080967F0: .4byte 0x00004E20
_080967F4:
	ldrh r0, [r1]
	subs r0, #1
_080967F8:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _080967F4
	ldr r0, _08096834 @ =0x0E000001
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x10
	movs r0, #0xe0
	lsls r0, r0, #0x14
	bl _call_via_r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r4, r0
	ldr r1, _08096838 @ =0x0E005555
	movs r0, #0xaa
	strb r0, [r1]
	ldr r2, _0809683C @ =0x0E002AAA
	movs r0, #0x55
	strb r0, [r2]
	movs r0, #0xf0
	strb r0, [r1]
	strb r0, [r1]
	add r1, sp, #0x40
	ldr r2, _08096840 @ =0x00004E20
	adds r0, r2, #0
	b _08096848
	.align 2, 0
_08096834: .4byte 0x0E000001
_08096838: .4byte 0x0E005555
_0809683C: .4byte 0x0E002AAA
_08096840: .4byte 0x00004E20
_08096844:
	ldrh r0, [r1]
	subs r0, #1
_08096848:
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _08096844
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_809685C
sub_809685C: @ 0x0809685C
	push {lr}
	ldr r1, _0809687C @ =gUnknown_0300042E
	ldrh r0, [r1]
	cmp r0, #0
	beq _08096878
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08096878
	ldr r1, _08096880 @ =gUnknown_03005B90
	movs r0, #1
	strb r0, [r1]
_08096878:
	pop {r0}
	bx r0
	.align 2, 0
_0809687C: .4byte gUnknown_0300042E
_08096880: .4byte gUnknown_03005B90

	thumb_func_start sub_8096884
sub_8096884: @ 0x08096884
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _080968B8
	ldr r0, _080968A8 @ =gUnknown_0300042C
	strb r1, [r0]
	ldr r1, _080968AC @ =gUnknown_03000430
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldr r3, _080968B0 @ =0x04000100
	adds r0, r0, r3
	str r0, [r1]
	ldr r0, _080968B4 @ =sub_809685C
	str r0, [r2]
	movs r0, #0
	b _080968BA
	.align 2, 0
_080968A8: .4byte gUnknown_0300042C
_080968AC: .4byte gUnknown_03000430
_080968B0: .4byte 0x04000100
_080968B4: .4byte sub_809685C
_080968B8:
	movs r0, #1
_080968BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80968C0
sub_80968C0: @ 0x080968C0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08096944 @ =gUnknown_03005BB0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, [r1]
	adds r2, r2, r0
	ldr r1, _08096948 @ =gUnknown_03000434
	ldr r0, _0809694C @ =0x04000208
	mov sb, r0
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, #0
	mov r1, sb
	strh r3, [r1]
	ldr r0, _08096950 @ =gUnknown_03000430
	mov r8, r0
	ldr r4, [r0]
	strh r3, [r4, #2]
	ldr r6, _08096954 @ =0x04000200
	ldr r1, _08096958 @ =gUnknown_0300042C
	mov sl, r1
	ldrb r1, [r1]
	movs r5, #8
	adds r0, r5, #0
	lsls r0, r1
	adds r1, r0, #0
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _0809695C @ =gUnknown_03005B90
	strb r3, [r0]
	ldr r1, _08096960 @ =gUnknown_0300042E
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	ldrh r0, [r2]
	strh r0, [r4]
	adds r0, r4, #2
	mov r1, r8
	str r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	str r4, [r1]
	ldr r1, _08096964 @ =0x04000202
	mov r2, sl
	ldrb r0, [r2]
	lsls r5, r0
	strh r5, [r1]
	movs r0, #1
	mov r3, sb
	strh r0, [r3]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096944: .4byte gUnknown_03005BB0
_08096948: .4byte gUnknown_03000434
_0809694C: .4byte 0x04000208
_08096950: .4byte gUnknown_03000430
_08096954: .4byte 0x04000200
_08096958: .4byte gUnknown_0300042C
_0809695C: .4byte gUnknown_03005B90
_08096960: .4byte gUnknown_0300042E
_08096964: .4byte 0x04000202

	thumb_func_start sub_8096968
sub_8096968: @ 0x08096968
	ldr r3, _08096998 @ =0x04000208
	movs r1, #0
	strh r1, [r3]
	ldr r2, _0809699C @ =gUnknown_03000430
	ldr r0, [r2]
	strh r1, [r0]
	adds r0, #2
	str r0, [r2]
	strh r1, [r0]
	subs r0, #2
	str r0, [r2]
	ldr r2, _080969A0 @ =0x04000200
	ldr r0, _080969A4 @ =gUnknown_0300042C
	ldrb r0, [r0]
	movs r1, #8
	lsls r1, r0
	ldrh r0, [r2]
	bics r0, r1
	strh r0, [r2]
	ldr r0, _080969A8 @ =gUnknown_03000434
	ldrh r0, [r0]
	strh r0, [r3]
	bx lr
	.align 2, 0
_08096998: .4byte 0x04000208
_0809699C: .4byte gUnknown_03000430
_080969A0: .4byte 0x04000200
_080969A4: .4byte gUnknown_0300042C
_080969A8: .4byte gUnknown_03000434

	thumb_func_start sub_80969AC
sub_80969AC: @ 0x080969AC
	ldrb r0, [r0]
	bx lr

	thumb_func_start sub_80969B0
sub_80969B0: @ 0x080969B0
	push {lr}
	adds r2, r0, #0
	ldr r1, _080969CC @ =gUnknown_03005B94
	adds r0, r2, #1
	str r0, [r1]
	ldr r3, _080969D0 @ =sub_80969AC+1
	movs r0, #1
	eors r3, r0
	ldr r0, _080969D4 @ =sub_80969B0
	ldr r1, _080969D0 @ =sub_80969AC+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080969E4
	.align 2, 0
_080969CC: .4byte gUnknown_03005B94
_080969D0: .4byte sub_80969AC+1
_080969D4: .4byte sub_80969B0
_080969D8:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080969E4:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080969D8
	pop {r0}
	bx r0
	.align 2, 0


	thumb_func_start sub_80969F0
sub_80969F0: @ 0x080969F0
	push {r4, lr}
	adds r4, r0, #0
	subs r3, r2, #1
	cmp r2, #0
	beq _08096A0C
	movs r2, #1
	rsbs r2, r2, #0
_080969FE:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r2
	bne _080969FE
_08096A0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8096A14
sub_8096A14: @ 0x08096A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _08096A60 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096A64 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08096A68 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08096A4C
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_809679C
	movs r0, #0xf
	ands r4, r0
_08096A4C:
	ldr r3, _08096A6C @ =sub_80969F0+1
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08096A70 @ =sub_8096A14
	ldr r1, _08096A6C @ =sub_80969F0+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08096A80
	.align 2, 0
_08096A60: .4byte 0x04000204
_08096A64: .4byte 0x0000FFFC
_08096A68: .4byte gUnknown_03005BA0
_08096A6C: .4byte sub_80969F0+1
_08096A70: .4byte sub_8096A14
_08096A74:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08096A80:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096A74
	mov r3, sp
	adds r3, #1
	ldr r0, _08096AAC @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	lsls r4, r0
	adds r0, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r5, r2
	adds r0, r0, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096AAC: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096AB0
sub_8096AB0: @ 0x08096AB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r4, r2, #1
	cmp r2, #0
	beq _08096AD6
	movs r2, #1
	rsbs r2, r2, #0
_08096AC0:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, #1
	adds r3, #1
	cmp r1, r0
	beq _08096AD0
	subs r0, r3, #1
	b _08096AD8
_08096AD0:
	subs r4, #1
	cmp r4, r2
	bne _08096AC0
_08096AD6:
	movs r0, #0
_08096AD8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8096AE0
sub_8096AE0: @ 0x08096AE0
	push {r4, r5, lr}
	sub sp, #0x100
	adds r5, r1, #0
	lsls r3, r0, #0x10
	lsrs r4, r3, #0x10
	ldr r2, _08096B28 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096B2C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08096B30 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08096B14
	lsrs r0, r3, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_809679C
	movs r0, #0xf
	ands r4, r0
_08096B14:
	ldr r3, _08096B34 @ =sub_8096AB0+1
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08096B38 @ =sub_8096AE0
	ldr r1, _08096B34 @ =sub_8096AB0+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08096B48
	.align 2, 0
_08096B28: .4byte 0x04000204
_08096B2C: .4byte 0x0000FFFC
_08096B30: .4byte gUnknown_03005BA0
_08096B34: .4byte sub_8096AB0+1
_08096B38: .4byte sub_8096AE0
_08096B3C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08096B48:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096B3C
	mov r3, sp
	adds r3, #1
	ldr r0, _08096B74 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r1, r1, r2
	ldrh r2, [r0, #4]
	adds r0, r5, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08096B74: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096B78
sub_8096B78: @ 0x08096B78
	push {r4, r5, r6, lr}
	sub sp, #0x100
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r2, r0, #0x10
	lsrs r4, r2, #0x10
	ldr r0, _08096BC0 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xa
	cmp r1, r0
	bne _08096BA0
	lsrs r0, r2, #0x14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_809679C
	movs r0, #0xf
	ands r4, r0
_08096BA0:
	ldr r2, _08096BC4 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096BC8 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08096BCC @ =sub_8096AB0+1
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08096BD0 @ =sub_8096AE0
	ldr r1, _08096BCC @ =sub_8096AB0+1
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08096BE0
	.align 2, 0
_08096BC0: .4byte gUnknown_03005BA0
_08096BC4: .4byte 0x04000204
_08096BC8: .4byte 0x0000FFFC
_08096BCC: .4byte sub_8096AB0+1
_08096BD0: .4byte sub_8096AE0
_08096BD4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08096BE0:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096BD4
	mov r3, sp
	adds r3, #1
	ldr r0, _08096C0C @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r1, [r0, #8]
	lsls r4, r1
	adds r1, r4, #0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r1, r1, r0
	adds r0, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096C0C: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096C10
sub_8096C10: @ 0x08096C10
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _08096C22
_08096C1C:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08096C22:
	cmp r6, #2
	bhi _08096C48
	ldr r0, _08096C50 @ =gUnknown_03005B9C
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08096C1C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8096AE0
	adds r2, r0, #0
	cmp r2, #0
	bne _08096C1C
_08096C48:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096C50: .4byte gUnknown_03005B9C

	thumb_func_start sub_8096C54
sub_8096C54: @ 0x08096C54
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	b _08096C68
_08096C62:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_08096C68:
	cmp r6, #2
	bhi _08096C90
	ldr r0, _08096C98 @ =gUnknown_03005B9C
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _08096C62
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_8096B78
	adds r3, r0, #0
	cmp r3, #0
	bne _08096C62
_08096C90:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096C98: .4byte gUnknown_03005B9C

	thumb_func_start sub_8096C9C
sub_8096C9C: @ 0x08096C9C
	push {r4, lr}
	ldr r2, _08096CBC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08096CC0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bl sub_80967C0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _08096CC4 @ =gUnknown_08C86E38
	movs r4, #1
	b _08096CCA
	.align 2, 0
_08096CBC: .4byte 0x04000204
_08096CC0: .4byte 0x0000FFFC
_08096CC4: .4byte gUnknown_08C86E38
_08096CC8:
	adds r2, #4
_08096CCA:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096CDE
	ldrh r0, [r1, #0x28]
	cmp r3, r0
	bne _08096CC8
	movs r4, #0
_08096CDE:
	ldr r1, _08096D18 @ =gUnknown_03005B9C
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08096D1C @ =gUnknown_03005BA8
	ldr r0, [r2]
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _08096D20 @ =gUnknown_03005BAC
	ldr r0, [r2]
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _08096D24 @ =gUnknown_03005B98
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _08096D28 @ =gUnknown_03005BB0
	ldr r0, [r2]
	ldr r0, [r0, #0x10]
	str r0, [r1]
	ldr r1, _08096D2C @ =gUnknown_03005BA0
	ldr r0, [r2]
	adds r0, #0x14
	str r0, [r1]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08096D18: .4byte gUnknown_03005B9C
_08096D1C: .4byte gUnknown_03005BA8
_08096D20: .4byte gUnknown_03005BAC
_08096D24: .4byte gUnknown_03005B98
_08096D28: .4byte gUnknown_03005BB0
_08096D2C: .4byte gUnknown_03005BA0

	thumb_func_start sub_8096D30
sub_8096D30: @ 0x08096D30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	movs r0, #0
	mov r8, r0
	adds r0, r4, #0
	bl sub_80968C0
	ldr r7, _08096D58 @ =gUnknown_03005B94
	movs r0, #0xc0
	lsls r0, r0, #8
	orrs r4, r0
	lsls r4, r4, #0x10
	b _08096D7C
	.align 2, 0
_08096D58: .4byte gUnknown_03005B94
_08096D5C:
	ldr r0, _08096D74 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r0, [r0, #0x14]
	cmp r0, #0xc2
	bne _08096D6C
	ldr r1, _08096D78 @ =0x0E005555
	movs r0, #0xf0
	strb r0, [r1]
_08096D6C:
	lsrs r4, r4, #0x10
	mov r8, r4
	b _08096DA4
	.align 2, 0
_08096D74: .4byte gUnknown_03005BA0
_08096D78: .4byte 0x0E005555
_08096D7C:
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	beq _08096DA4
	ldr r0, _08096DB4 @ =gUnknown_03005B90
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096D7C
	ldr r1, [r7]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r6
	bne _08096D5C
_08096DA4:
	bl sub_8096968
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08096DB4: .4byte gUnknown_03005B90

	thumb_func_start sub_8096DB8
sub_8096DB8: @ 0x08096DB8
	push {r4, r5, r6, lr}
	sub sp, #0x40
	ldr r5, _08096E14 @ =0x04000204
	ldrh r1, [r5]
	ldr r6, _08096E18 @ =0x0000FFFC
	ands r1, r6
	ldr r0, _08096E1C @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	orrs r1, r0
	strh r1, [r5]
	ldr r1, _08096E20 @ =0x0E005555
	movs r4, #0xaa
	strb r4, [r1]
	ldr r3, _08096E24 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r4, [r1]
	strb r2, [r3]
	movs r0, #0x10
	strb r0, [r1]
	mov r0, sp
	bl sub_80969B0
	ldr r0, _08096E28 @ =gUnknown_03005B98
	movs r1, #0xe0
	lsls r1, r1, #0x14
	ldr r3, [r0]
	movs r0, #3
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5]
	ands r1, r6
	movs r2, #3
	orrs r1, r2
	strh r1, [r5]
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096E14: .4byte 0x04000204
_08096E18: .4byte 0x0000FFFC
_08096E1C: .4byte gUnknown_03005BA0
_08096E20: .4byte 0x0E005555
_08096E24: .4byte 0x0E002AAA
_08096E28: .4byte gUnknown_03005B98

	thumb_func_start sub_8096E2C
sub_8096E2C: @ 0x08096E2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xf
	bhi _08096EB4
	ldr r6, _08096E9C @ =0x04000204
	ldrh r1, [r6]
	ldr r0, _08096EA0 @ =0x0000FFFC
	mov r8, r0
	ands r1, r0
	ldr r0, _08096EA4 @ =gUnknown_03005BA0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r6]
	ldrb r4, [r2, #8]
	lsls r3, r4
	adds r4, r3, #0
	movs r2, #0xe0
	lsls r2, r2, #0x14
	adds r4, r4, r2
	ldr r1, _08096EA8 @ =0x0E005555
	movs r5, #0xaa
	strb r5, [r1]
	ldr r3, _08096EAC @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r0, #0x80
	strb r0, [r1]
	strb r5, [r1]
	strb r2, [r3]
	movs r0, #0x30
	strb r0, [r4]
	mov r0, sp
	bl sub_80969B0
	ldr r0, _08096EB0 @ =gUnknown_03005B98
	ldr r3, [r0]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0xff
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6]
	mov r2, r8
	ands r1, r2
	movs r2, #3
	orrs r1, r2
	strh r1, [r6]
	b _08096EB6
	.align 2, 0
_08096E9C: .4byte 0x04000204
_08096EA0: .4byte 0x0000FFFC
_08096EA4: .4byte gUnknown_03005BA0
_08096EA8: .4byte 0x0E005555
_08096EAC: .4byte 0x0E002AAA
_08096EB0: .4byte gUnknown_03005B98
_08096EB4:
	ldr r0, _08096EC4 @ =0x000080FF
_08096EB6:
	add sp, #0x40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08096EC4: .4byte 0x000080FF

	thumb_func_start sub_8096EC8
sub_8096EC8: @ 0x08096EC8
	push {r4, lr}
	ldr r4, _08096EF4 @ =0x0E005555
	movs r2, #0xaa
	strb r2, [r4]
	ldr r3, _08096EF8 @ =0x0E002AAA
	movs r2, #0x55
	strb r2, [r3]
	movs r2, #0xa0
	strb r2, [r4]
	ldrb r2, [r0]
	strb r2, [r1]
	ldr r3, _08096EFC @ =gUnknown_03005B98
	ldrb r2, [r0]
	ldr r3, [r3]
	movs r0, #1
	bl _call_via_r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08096EF4: .4byte 0x0E005555
_08096EF8: .4byte 0x0E002AAA
_08096EFC: .4byte gUnknown_03005B98

	thumb_func_start sub_8096F00
sub_8096F00: @ 0x08096F00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x60
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0xf
	bls _08096F20
	ldr r0, _08096F1C @ =0x000080FF
	b _0809700E
	.align 2, 0
_08096F1C: .4byte 0x000080FF
_08096F20:
	ldr r0, _08096F40 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	mov r7, r8
	lsls r7, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r7, r7, r0
	ldr r1, _08096F44 @ =sub_8097024+1
	movs r0, #1
	adds r3, r1, #0
	eors r3, r0
	mov r2, sp
	ldr r0, _08096F48 @ =sub_8097048
	subs r0, r0, r1
	b _08096F56
	.align 2, 0
_08096F40: .4byte gUnknown_03005BA0
_08096F44: .4byte sub_8097024+1
_08096F48: .4byte sub_8097048
_08096F4C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #2
_08096F56:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08096F4C
	movs r4, #0
	b _08096F6C
_08096F62:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x51
	beq _0809700C
_08096F6C:
	mov r0, r8
	bl sub_8096E2C
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08096F62
	adds r0, r7, #0
	mov r1, sp
	adds r1, #1
	bl sub_8097048
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08096F62
	movs r6, #1
	cmp r4, #0
	beq _08096F94
	movs r6, #6
_08096F94:
	movs r4, #1
	cmp r4, r6
	bhi _08096FAA
_08096F9A:
	mov r0, r8
	bl sub_8096E2C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	bls _08096F9A
_08096FAA:
	mov r0, sp
	bl sub_80969B0
	ldr r3, _08096FCC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _08096FD0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _08096FD4 @ =gUnknown_03005BA0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _08096FD8 @ =gUnknown_03005BA4
	ldr r0, [r2, #4]
	strh r0, [r1]
	adds r4, r1, #0
	b _08096FE8
	.align 2, 0
_08096FCC: .4byte 0x04000204
_08096FD0: .4byte 0x0000FFFC
_08096FD4: .4byte gUnknown_03005BA0
_08096FD8: .4byte gUnknown_03005BA4
_08096FDC:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	movs r0, #1
	add sb, r0
	adds r7, #1
_08096FE8:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08096FFE
	mov r0, sb
	adds r1, r7, #0
	bl sub_8096EC8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08096FDC
_08096FFE:
	ldr r2, _0809701C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08097020 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_0809700C:
	adds r0, r5, #0
_0809700E:
	add sp, #0x60
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809701C: .4byte 0x04000204
_08097020: .4byte 0x0000FFFC

	thumb_func_start sub_8097024
sub_8097024: @ 0x08097024
	push {lr}
	adds r2, r0, #0
	ldr r0, _08097030 @ =0x03005BA0
	ldr r0, [r0]
	ldr r1, [r0, #4]
	b _08097036
	.align 2, 0
_08097030: .4byte 0x03005BA0
_08097034:
	subs r1, #1
_08097036:
	cmp r1, #0
	beq _08097042
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #0xff
	beq _08097034
_08097042:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_8097048
sub_8097048: @ 0x08097048
	push {lr}
	bl _call_via_r1
	cmp r0, #0
	bne _08097056
	movs r0, #0
	b _08097058
_08097056:
	ldr r0, _0809705C @ =0x00008004
_08097058:
	pop {r1}
	bx r1
	.align 2, 0
_0809705C: .4byte 0x00008004

	thumb_func_start sub_8097060
sub_8097060: @ 0x08097060
	push {r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r7, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08097078 @ =gUnknown_03005BA0
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	cmp r4, r0
	blo _08097080
	ldr r0, _0809707C @ =0x000080FF
	b _080970FC
	.align 2, 0
_08097078: .4byte gUnknown_03005BA0
_0809707C: .4byte 0x000080FF
_08097080:
	adds r0, r4, #0
	bl sub_8096E2C
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _080970FA
	mov r0, sp
	bl sub_80969B0
	ldr r3, _080970BC @ =0x04000204
	ldrh r1, [r3]
	ldr r0, _080970C0 @ =0x0000FFFC
	ands r1, r0
	ldr r0, _080970C4 @ =gUnknown_03005BA0
	ldr r2, [r0]
	ldrh r0, [r2, #0x10]
	orrs r1, r0
	strh r1, [r3]
	ldr r1, _080970C8 @ =gUnknown_03005BA4
	ldr r0, [r2, #4]
	strh r0, [r1]
	ldrb r0, [r2, #8]
	lsls r4, r0
	movs r0, #0xe0
	lsls r0, r0, #0x14
	adds r4, r4, r0
	adds r6, r1, #0
	b _080970D6
	.align 2, 0
_080970BC: .4byte 0x04000204
_080970C0: .4byte 0x0000FFFC
_080970C4: .4byte gUnknown_03005BA0
_080970C8: .4byte gUnknown_03005BA4
_080970CC:
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	adds r7, #1
	adds r4, #1
_080970D6:
	ldrh r0, [r6]
	cmp r0, #0
	beq _080970EC
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8096EC8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080970CC
_080970EC:
	ldr r2, _08097104 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08097108 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
_080970FA:
	adds r0, r5, #0
_080970FC:
	add sp, #0x40
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097104: .4byte 0x04000204
_08097108: .4byte 0x0000FFFC
