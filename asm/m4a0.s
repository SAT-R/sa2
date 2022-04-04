.include "asm/macros.inc"

.syntax unified
.arm

	thumb_func_start m4aSoundVSync
m4aSoundVSync: @ 0x08094C4C
	ldr r0, _08094EF8 @ =0x03007ff0
	ldr r0, [r0]
	ldr r2, _08094EFC @ =0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _08094C8C
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _08094C8C
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _08094C90 @ =0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _08094C72
	ldr r1, _08094C94 @ =0x84400004
	str r1, [r2, #8]
_08094C72:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _08094C7C
	ldr r1, _08094C94 @ =0x84400004
	str r1, [r2, #0x14]
_08094C7C:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_08094C8C:
	bx lr
	.align 2, 0
_08094C90: .4byte 0x040000BC
_08094C94: .4byte 0x84400004

	thumb_func_start sub_8094C98
sub_8094C98: @ 0x08094C98
	ldr r2, _08094EFC @ =0x68736D53
	ldr r3, [r0, #0x34]
	cmp r2, r3
	beq _08094CA2
	bx lr
_08094CA2:
	adds r3, #1
	str r3, [r0, #0x34]
	push {r0, lr}
	ldr r3, [r0, #0x38]
	cmp r3, #0
	beq _08094CB4
	ldr r0, [r0, #0x3c]
	bl sub_08094EF0
_08094CB4:
	pop {r0}
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08094CCC
	b _08094EE0
_08094CCC:
	ldr r0, _08094EF8 @ =0x03007ff0
	ldr r0, [r0]
	mov r8, r0
	adds r0, r7, #0
	bl FadeOutBody
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08094CE0
	b _08094EE0
_08094CE0:
	ldrh r0, [r7, #0x22]
	ldrh r1, [r7, #0x20]
	adds r0, r0, r1
	b _08094E30
_08094CE8:
	ldrb r6, [r7, #8]
	ldr r5, [r7, #0x2c]
	movs r3, #1
	movs r4, #0
_08094CF0:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	bne _08094CFA
	b _08094E0C
_08094CFA:
	mov sl, r3
	orrs r4, r3
	mov fp, r4
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08094D2E
_08094D06:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _08094D22
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	beq _08094D28
	subs r0, #1
	strb r0, [r4, #0x10]
	bne _08094D28
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
	b _08094D28
_08094D22:
	adds r0, r4, #0
	bl ClearChain
_08094D28:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _08094D06
_08094D2E:
	ldrb r3, [r5]
	movs r0, #0x40
	tst r0, r3
	beq _08094DAC
	adds r0, r5, #0
	bl Clear64byte
	movs r0, #0x80
	strb r0, [r5]
	movs r0, #2
	strb r0, [r5, #0xf]
	movs r0, #0x40
	strb r0, [r5, #0x13]
	movs r0, #0x16
	strb r0, [r5, #0x19]
	movs r0, #1
	adds r1, r5, #6
	strb r0, [r1, #0x1e]
	b _08094DAC
_08094D54:
	ldr r2, [r5, #0x40]
	ldrb r1, [r2]
	cmp r1, #0x80
	bhs _08094D60
	ldrb r1, [r5, #7]
	b _08094D6A
_08094D60:
	adds r2, #1
	str r2, [r5, #0x40]
	cmp r1, #0xbd
	blo _08094D6A
	strb r1, [r5, #7]
_08094D6A:
	cmp r1, #0xcf
	blo _08094D80
	mov r0, r8
	ldr r3, [r0, #0x38]
	adds r0, r1, #0
	subs r0, #0xcf
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_08094EF0
	b _08094DAC
_08094D80:
	cmp r1, #0xb0
	bls _08094DA2
	adds r0, r1, #0
	subs r0, #0xb1
	strb r0, [r7, #0xa]
	mov r3, r8
	ldr r3, [r3, #0x34]
	lsls r0, r0, #2
	ldr r3, [r3, r0]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_08094EF0
	ldrb r0, [r5]
	cmp r0, #0
	beq _08094E08
	b _08094DAC
_08094DA2:
	ldr r0, _08094EF4 @ =gUnknown_08ACDEEC
	subs r1, #0x80
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5, #1]
_08094DAC:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _08094D54
	subs r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #0x19]
	cmp r1, #0
	beq _08094E08
	ldrb r0, [r5, #0x17]
	cmp r0, #0
	beq _08094E08
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _08094DCE
	subs r0, #1
	strb r0, [r5, #0x1c]
	b _08094E08
_08094DCE:
	ldrb r0, [r5, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	adds r1, r0, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	bpl _08094DE2
	lsls r2, r1, #0x18
	asrs r2, r2, #0x18
	b _08094DE6
_08094DE2:
	movs r0, #0x80
	subs r2, r0, r1
_08094DE6:
	ldrb r0, [r5, #0x17]
	muls r0, r2, r0
	asrs r2, r0, #6
	ldrb r0, [r5, #0x16]
	eors r0, r2
	lsls r0, r0, #0x18
	beq _08094E08
	strb r2, [r5, #0x16]
	ldrb r0, [r5]
	ldrb r1, [r5, #0x18]
	cmp r1, #0
	bne _08094E02
	movs r1, #0xc
	b _08094E04
_08094E02:
	movs r1, #3
_08094E04:
	orrs r0, r1
	strb r0, [r5]
_08094E08:
	mov r3, sl
	mov r4, fp
_08094E0C:
	subs r6, #1
	ble _08094E18
	movs r0, #0x50
	adds r5, r5, r0
	lsls r3, r3, #1
	b _08094CF0
_08094E18:
	ldr r0, [r7, #0xc]
	adds r0, #1
	str r0, [r7, #0xc]
	cmp r4, #0
	bne _08094E2A
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	b _08094EE0
_08094E2A:
	str r4, [r7, #4]
	ldrh r0, [r7, #0x22]
	subs r0, #0x96
_08094E30:
	strh r0, [r7, #0x22]
	cmp r0, #0x96
	blo _08094E38
	b _08094CE8
_08094E38:
	ldrb r2, [r7, #8]
	ldr r5, [r7, #0x2c]
_08094E3C:
	ldrb r0, [r5]
	movs r1, #0x80
	tst r1, r0
	beq _08094ED6
	movs r1, #0xf
	tst r1, r0
	beq _08094ED6
	mov sb, r2
	adds r0, r7, #0
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08094ECC
_08094E5A:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	bne _08094E6A
	adds r0, r4, #0
	bl ClearChain
	b _08094EC6
_08094E6A:
	ldrb r0, [r4, #1]
	movs r6, #7
	ands r6, r0
	ldrb r3, [r5]
	movs r0, #3
	tst r0, r3
	beq _08094E88
	bl sub_8094F44
	cmp r6, #0
	beq _08094E88
	ldrb r0, [r4, #0x1d]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x1d]
_08094E88:
	ldrb r3, [r5]
	movs r0, #0xc
	tst r0, r3
	beq _08094EC6
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r2, r1, r0
	bpl _08094E9C
	movs r2, #0
_08094E9C:
	cmp r6, #0
	beq _08094EBA
	mov r0, r8
	ldr r3, [r0, #0x30]
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	adds r0, r6, #0
	bl sub_08094EF0
	str r0, [r4, #0x20]
	ldrb r0, [r4, #0x1d]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x1d]
	b _08094EC6
_08094EBA:
	adds r1, r2, #0
	ldrb r2, [r5, #9]
	ldr r0, [r4, #0x24]
	bl sub_8095204
	str r0, [r4, #0x20]
_08094EC6:
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _08094E5A
_08094ECC:
	ldrb r0, [r5]
	movs r1, #0xf0
	ands r0, r1
	strb r0, [r5]
	mov r2, sb
_08094ED6:
	subs r2, #1
	ble _08094EE0
	movs r0, #0x50
	adds r5, r5, r0
	bgt _08094E3C
_08094EE0:
	ldr r0, _08094EFC @ =0x68736D53
	str r0, [r7, #0x34]
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}

	thumb_func_start sub_08094EF0
sub_08094EF0: @ 0x08094EF0
	bx r3
	.align 2, 0
_08094EF4: .4byte gUnknown_08ACDEEC
_08094EF8: .4byte 0x03007ff0
_08094EFC: .4byte 0x68736D53

	thumb_func_start TrackStop
TrackStop: @ 0x08094F00
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _08094F38
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _08094F36
	movs r6, #0
_08094F14:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08094F2E
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _08094F2C
	ldr r3, _08094F40 @ =0x03007ff0
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_08094EF0
_08094F2C:
	strb r6, [r4]
_08094F2E:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _08094F14
_08094F36:
	str r4, [r5, #0x20]
_08094F38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094F40: .4byte 0x03007ff0

	thumb_func_start sub_8094F44
sub_8094F44: @ 0x08094F44
	ldrb r1, [r4, #0x12]
	movs r0, #0x14
	ldrsb r2, [r4, r0]
	movs r3, #0x80
	adds r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x10]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _08094F5C
	movs r0, #0xff
_08094F5C:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _08094F70
	movs r0, #0xff
_08094F70:
	strb r0, [r4, #3]
	bx lr

	thumb_func_start ply_note
ply_note: @ 0x08094F74
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _0809516C @ =0x03007ff0
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _08095170 @ =gUnknown_08ACDEEC
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08094FBA
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08094FB8
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _08094FB8
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_08094FB8:
	str r3, [r5, #0x40]
_08094FBA:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _0809500C
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _08094FDA
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _08094FDC
_08094FDA:
	adds r0, r3, #0
_08094FDC:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _08094FF4
	b _0809515A
_08094FF4:
	movs r0, #0x80
	tst r0, r2
	beq _08095010
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _08095008
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_08095008:
	ldrb r3, [r6, #1]
	b _08095010
_0809500C:
	mov sb, r4
	ldrb r3, [r5, #5]
_08095010:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _08095020
	movs r0, #0xff
_08095020:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _08095060
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _08095038
	b _0809515A
_08095038:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080950B4
	movs r0, #0x40
	tst r0, r1
	bne _080950B4
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _080950B4
	beq _08095058
	b _0809515A
_08095058:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _080950B4
	b _0809515A
_08095060:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_0809506E:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080950B4
	movs r0, #0x40
	tst r0, r1
	beq _08095088
	cmp r2, #0
	bne _0809508C
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _080950A6
_08095088:
	cmp r2, #0
	bne _080950A8
_0809508C:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _08095098
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _080950A6
_08095098:
	bhi _080950A8
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _080950A4
	adds r7, r0, #0
	b _080950A6
_080950A4:
	blo _080950A8
_080950A6:
	mov r8, r4
_080950A8:
	adds r4, #0x40
	subs r3, #1
	bgt _0809506E
	mov r4, r8
	cmp r4, #0
	beq _0809515A
_080950B4:
	adds r0, r4, #0
	bl ClearChain
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _080950C8
	str r4, [r3, #0x30]
_080950C8:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _080950DA
	adds r1, r5, #0
	bl sub_80951B4
_080950DA:
	ldr r0, [sp]
	adds r1, r5, #0
	bl TrkVolPitSet
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl sub_8094F44
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _08095114
	movs r3, #0
_08095114:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _08095142
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _0809512E
	movs r0, #0x70
	tst r0, r1
	bne _08095130
_0809512E:
	movs r1, #8
_08095130:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_08094EF0
	b _0809514C
_08095142:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl sub_8095204
_0809514C:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_0809515A:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_0809516C: .4byte 0x03007ff0
_08095170: .4byte gUnknown_08ACDEEC

	thumb_func_start ply_endtie
ply_endtie: @ 0x08095174
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _08095186
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _08095188
_08095186:
	ldrb r3, [r1, #5]
_08095188:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _080951B0
	movs r4, #0x83
	movs r5, #0x40
_08095192:
	ldrb r2, [r1]
	tst r2, r4
	beq _080951AA
	tst r2, r5
	bne _080951AA
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _080951AA
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _080951B0
_080951AA:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _08095192
_080951B0:
	pop {r4, r5}
	bx lr

	thumb_func_start sub_80951B4
sub_80951B4: @ 0x080951B4
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _080951C4
	movs r2, #0xc
	b _080951C6
_080951C4:
	movs r2, #3
_080951C6:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.align 2, 0

	thumb_func_start sub_80951D0
sub_80951D0: @ 0x080951D0
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.align 2, 0

	thumb_func_start ply_lfos
ply_lfos: @ 0x080951DC
	mov ip, lr
	bl sub_80951D0
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _080951EC
	bl sub_80951B4
_080951EC:
	bx ip
	.align 2, 0

	thumb_func_start ply_mod
ply_mod: @ 0x080951F0
	mov ip, lr
	bl sub_80951D0
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _08095200
	bl sub_80951B4
_08095200:
	bx ip
	.align 2, 0

	thumb_func_start sub_8095204
sub_8095204: @ 0x08095204
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _08095218
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_08095218:
	ldr r3, _08095260 @ =gUnknown_08ACDD08
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _08095264 @ =gUnknown_08ACDDBC
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r5, #4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r1, #4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, ip
	ldr r4, [r1, #4]
	subs r0, r0, r5
	adds r1, r7, #0
	bl sub_080945E8
	adds r1, r0, #0
	adds r1, r5, r1
	adds r0, r4, #0
	bl sub_080945E8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08095260: .4byte gUnknown_08ACDD08
_08095264: .4byte gUnknown_08ACDDBC

	thumb_func_start sub_8095268
sub_8095268: @ 0x08095268
	bx lr
	.align 2, 0

	thumb_func_start MPlayContinue
MPlayContinue: @ 0x0809526C
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _08095280 @ =0x68736D53
	cmp r3, r0
	bne _0809527E
	ldr r0, [r2, #4]
	ldr r1, _08095284 @ =0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_0809527E:
	bx lr
	.align 2, 0
_08095280: .4byte 0x68736D53
_08095284: .4byte 0x7FFFFFFF

	thumb_func_start MPlayFadeOut
MPlayFadeOut: @ 0x08095288
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080952A4 @ =0x68736D53
	cmp r3, r0
	bne _080952A0
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_080952A0:
	bx lr
	.align 2, 0
_080952A4: .4byte 0x68736D53
