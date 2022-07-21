.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_808D8A0
sub_808D8A0: @ 0x0808D8A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0808D984 @ =0xFFFFFE00
	add sp, r4
	adds r5, r0, #0
	movs r0, #0xc
	adds r0, r0, r5
	mov ip, r0
	movs r6, #0
	movs r1, #0xf8
	lsls r1, r1, #2
	mov sb, r1
	movs r2, #0xf8
	lsls r2, r2, #7
	mov r8, r2
_0808D8C2:
	movs r0, #1
	ands r0, r6
	lsls r1, r6, #1
	mov r2, ip
	adds r0, r1, r2
	ldrh r2, [r0]
	adds r7, r1, #0
	movs r0, #0x1f
	ands r0, r2
	movs r1, #6
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D8EA
	movs r1, #0x1f
_0808D8EA:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D8F2
	movs r1, #0
_0808D8F2:
	adds r4, r1, #0
	adds r0, r2, #0
	mov r1, sb
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #7
	ldrsb r1, [r5, r1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D910
	movs r1, #0x1f
_0808D910:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D918
	movs r1, #0
_0808D918:
	lsls r0, r1, #0x10
	asrs r0, r0, #0xb
	orrs r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, r8
	ands r2, r0
	lsrs r0, r2, #0xa
	movs r1, #8
	ldrsb r1, [r5, r1]
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808D93C
	movs r1, #0x1f
_0808D93C:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0808D944
	movs r1, #0
_0808D944:
	lsls r0, r1, #0x10
	asrs r0, r0, #6
	orrs r0, r4
	mov r2, sp
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xff
	bls _0808D8C2
	movs r1, #0xa0
	lsls r1, r1, #0x13
	mov r0, sp
	movs r2, #0x80
	bl CpuFastSet
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	strh r0, [r5, #4]
	lsrs r0, r0, #8
	strb r0, [r5, #1]
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D984: .4byte 0xFFFFFE00

	thumb_func_start sub_808D988
sub_808D988: @ 0x0808D988
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	ldr r0, _0808D9E0 @ =gUnknown_03005B80
	ldr r4, [r0]
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	ldrb r2, [r4, #0x13]
	adds r0, r0, r2
	cmp sb, r0
	beq _0808D9AA
	b _0808DAA8
_0808D9AA:
	ldrb r0, [r4]
	adds r7, r4, #0
	adds r7, #0x14
	cmp r0, #0
	bne _0808D9C4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r7, #0
	movs r2, #1
	bl CpuFastSet
	movs r0, #1
	strb r0, [r4]
_0808D9C4:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0808D9E4
	ldrb r1, [r4, #1]
	lsls r1, r1, #4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r7, #0
	movs r2, #1
	bl CpuFastSet
	b _0808DA72
	.align 2, 0
_0808D9E0: .4byte gUnknown_03005B80
_0808D9E4:
	movs r6, #0
	movs r0, #0xf8
	lsls r0, r0, #2
	mov r8, r0
	movs r1, #0xf8
	lsls r1, r1, #7
	mov ip, r1
_0808D9F2:
	lsls r5, r6, #1
	adds r0, r7, r5
	ldrh r2, [r0]
	movs r1, #0x1f
	ands r1, r2
	movs r0, #0xf
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808DA0E
	movs r1, #0x1f
_0808DA0E:
	adds r3, r1, #0
	mov r1, r8
	ands r1, r2
	lsrs r1, r1, #5
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808DA28
	movs r1, #0x1f
_0808DA28:
	lsls r0, r1, #0x10
	asrs r0, r0, #0xb
	orrs r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #0xa
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0808DA4A
	movs r1, #0x1f
_0808DA4A:
	lsls r0, r1, #0x10
	asrs r0, r0, #6
	orrs r0, r3
	mov r2, sp
	adds r1, r2, r5
	strh r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xf
	bls _0808D9F2
	ldrb r1, [r4, #1]
	lsls r1, r1, #4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	mov r0, sp
	movs r2, #1
	bl CpuFastSet
_0808DA72:
	ldrb r0, [r4, #0xc]
	ldrb r1, [r4, #0xf]
	adds r0, r0, r1
	strb r0, [r4, #0xf]
	ldrb r0, [r4, #0xd]
	ldrb r2, [r4, #0x10]
	adds r0, r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0xe]
	ldrb r1, [r4, #0x11]
	adds r0, r0, r1
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #0x12]
	ldrb r2, [r4, #0x13]
	adds r0, r0, r2
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #2]
	adds r0, #1
	strb r0, [r4, #2]
	ldrb r1, [r4, #2]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0808DAA8
	movs r0, #0
	strb r0, [r4, #2]
_0808DAA8:
	mov r0, sb
	cmp r0, #0x9f
	bne _0808DABA
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #0xf]
	strb r0, [r4, #0x10]
	strb r0, [r4, #0x11]
	strb r0, [r4, #0x13]
_0808DABA:
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808DAC8
sub_808DAC8: @ 0x0808DAC8
	push {r4, lr}
	movs r4, #0
	strb r4, [r3]
	strb r4, [r3, #2]
	strb r4, [r3, #0xc]
	strb r4, [r3, #0xd]
	strb r4, [r3, #0xe]
	strh r4, [r3, #0x34]
	strb r0, [r3, #1]
	str r1, [r3, #4]
	str r2, [r3, #8]
	ldr r0, _0808DAE8 @ =gUnknown_03005B80
	str r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DAE8: .4byte gUnknown_03005B80

	thumb_func_start sub_808DAEC
sub_808DAEC: @ 0x0808DAEC
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x14]
	movs r6, #0
	movs r5, #1
	strb r5, [r4]
	strb r6, [r4, #2]
	strb r1, [r4, #0xc]
	strb r2, [r4, #0xd]
	strb r3, [r4, #0xe]
	strb r6, [r4, #0xf]
	strb r6, [r4, #0x10]
	strb r6, [r4, #0x11]
	strb r6, [r4, #0x13]
	strh r6, [r4, #0x34]
	strb r0, [r4, #1]
	str r6, [r4, #4]
	str r6, [r4, #8]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r4, #0
	adds r1, #0x14
	movs r2, #1
	bl CpuFastSet
	ldr r0, _0808DB28 @ =gUnknown_03005B80
	str r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB28: .4byte gUnknown_03005B80

	thumb_func_start sub_808DB2C
sub_808DB2C: @ 0x0808DB2C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0808DB40 @ =gUnknown_03005B80
	ldr r4, [r0]
	cmp r3, #0x9e
	bls _0808DB44
	movs r0, #0
	b _0808DB70
	.align 2, 0
_0808DB40: .4byte gUnknown_03005B80
_0808DB44:
	ldrb r2, [r4, #2]
	ldr r1, [r4, #4]
	adds r1, r1, r2
	movs r5, #0x34
	ldrsh r0, [r4, r5]
	ldrb r1, [r1]
	adds r0, r0, r1
	cmp r3, r0
	blt _0808DB72
	lsls r1, r2, #5
	ldr r0, [r4, #8]
	adds r0, r0, r1
	ldrb r1, [r4, #1]
	lsls r1, r1, #5
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #1
	bl CpuFastSet
	ldrb r0, [r4, #2]
	adds r0, #1
_0808DB70:
	strb r0, [r4, #2]
_0808DB72:
	pop {r4, r5}
	pop {r0}
	bx r0
