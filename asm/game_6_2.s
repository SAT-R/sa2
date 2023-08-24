.include "asm/macros.inc"
.include "constants/constants.inc"
    
.text
.syntax unified
.arm

.if 0
	thumb_func_start sub_80246DC
sub_80246DC: @ 0x080246DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r5, [r0]
	mov sb, r5      @ sb = charAnim
	movs r0, #0x68
	adds r0, r0, r4
	mov r8, r0
	ldrh r3, [r0]
	movs r1, #0x6a
	adds r1, r1, r4
	mov ip, r1
	ldrh r2, [r1]
	mov sl, r2      @ sl = r2 = variant
	ldr r1, _0802476C @ =gPlayerCharacterIdleAnims
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r7, [r0]
	subs r0, r3, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080247CC
	cmp r2, #0
	bne _08024770
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08024770
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08024770
	movs r0, #1
	mov r1, ip
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	b sub_80246DC_return
	.align 2, 0
_0802476C: .4byte gPlayerCharacterIdleAnims
_08024770:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble sub_80246DC_return
	adds r5, r4, #0
	adds r5, #0x6a
	ldrh r0, [r5]
	cmp r0, #1
	bne sub_80246DC_return
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi sub_80246DC_return
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _080247C4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E6D4
	adds r1, r0, #0
	ldr r0, _080247C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq sub_80246DC_return
	cmp r1, #0x20
	bgt sub_80246DC_return
	movs r0, #2
	strh r0, [r5]
	b sub_80246DC_return
	.align 2, 0
_080247C4: .4byte sub_801EE64
_080247C8: .4byte gGameMode
_080247CC:
	cmp r5, #0x26
	bne _080247EA
	cmp r3, #0x34
	bne sub_80246DC_return
	cmp r2, #0
	bne _080247E4
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble sub_80246DC_return
	movs r0, #1
	b _08024858
_080247E4:
	cmp r2, #1
	bne sub_80246DC_return
	b _0802484A
_080247EA:
	cmp r5, #0x27
	bne _0802480C
	cmp r3, #0x35
	bne sub_80246DC_return
	cmp r2, #0
	bne sub_80246DC_return
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq sub_80246DC_return
	adds r0, r7, #0
	adds r0, #0x34
	mov r1, r8
	strh r0, [r1]
	b _08024856
_0802480C:
	cmp r5, #0x25
	bne _0802482A
	cmp r3, #0x41
	bne sub_80246DC_return
	cmp r2, #0
	bne _08024824
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble sub_80246DC_return
	movs r0, #1
	b _08024858
_08024824:
	cmp r2, #1
	bne sub_80246DC_return
	b _0802484A
_0802482A:
	mov r0, sb      @ r0 = sb = charAnim
	cmp r0, #0x39
	bne sub_80246DC_return
	cmp r3, #0x42
	bne sub_80246DC_return
	cmp r2, #0
	bne _08024844
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble sub_80246DC_return
	movs r0, #1
	b _08024858
_08024844:
	mov r0, sl
	cmp r0, #1
	bne sub_80246DC_return
_0802484A:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq sub_80246DC_return
_08024856:
	movs r0, #2
_08024858:
	mov r1, ip
	strh r0, [r1]
sub_80246DC_return:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.endif

.if 1
	thumb_func_start sub_802486C
sub_802486C: @ 0x0802486C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080248E0
	adds r0, r3, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	beq _080248E0
	ldr r7, _08024908 @ =gUnknown_080D6736
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r5, r3, #0
	adds r5, #0x68
	strh r4, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _080248C6
	ldr r0, _0802490C @ =gPlayerCharacterIdleAnims
	adds r1, r3, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r4, r0
	strh r0, [r5]
_080248C6:
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r1, r7, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_080248E0:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r1
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #0x34
	bls _080248FC
	b _08024A96
_080248FC:
	lsls r0, r0, #2
	ldr r1, _08024910 @ =_08024914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024908: .4byte gUnknown_080D6736
_0802490C: .4byte gPlayerCharacterIdleAnims
_08024910: .4byte _08024914
_08024914: @ jump table
	.4byte _080249E8 @ case 0
	.4byte _08024A96 @ case 1
	.4byte _08024A96 @ case 2
	.4byte _08024A96 @ case 3
	.4byte _08024A96 @ case 4
	.4byte _08024A96 @ case 5
	.4byte _08024A96 @ case 6
	.4byte _08024A3A @ case 7
	.4byte _08024A96 @ case 8
	.4byte _08024A96 @ case 9
	.4byte _08024A96 @ case 10
	.4byte _08024A96 @ case 11
	.4byte _08024A96 @ case 12
	.4byte _08024A96 @ case 13
	.4byte _08024A96 @ case 14
	.4byte _08024A96 @ case 15
	.4byte _08024A96 @ case 16
	.4byte _08024A96 @ case 17
	.4byte _08024A96 @ case 18
	.4byte _08024A96 @ case 19
	.4byte _08024A96 @ case 20
	.4byte _08024A96 @ case 21
	.4byte _08024A96 @ case 22
	.4byte _08024A96 @ case 23
	.4byte _08024A96 @ case 24
	.4byte _08024A96 @ case 25
	.4byte _08024A96 @ case 26
	.4byte _08024A96 @ case 27
	.4byte _08024A96 @ case 28
	.4byte _08024A96 @ case 29
	.4byte _08024A96 @ case 30
	.4byte _08024A96 @ case 31
	.4byte _08024A96 @ case 32
	.4byte _08024A96 @ case 33
	.4byte _08024A96 @ case 34
	.4byte _08024A96 @ case 35
	.4byte _08024A96 @ case 36
	.4byte _08024A96 @ case 37
	.4byte _08024A96 @ case 38
	.4byte _08024A96 @ case 39
	.4byte _08024A96 @ case 40
	.4byte _08024A96 @ case 41
	.4byte _08024A70 @ case 42
	.4byte _08024A70 @ case 43
	.4byte _08024A76 @ case 44
	.4byte _08024A76 @ case 45
	.4byte _08024A96 @ case 46
	.4byte _08024A96 @ case 47
	.4byte _08024A96 @ case 48
	.4byte _08024A96 @ case 49
	.4byte _08024A10 @ case 50
	.4byte _08024A10 @ case 51
	.4byte _08024A10 @ case 52
_080249E8:
	ldr r1, _08024A2C @ =gPlayerCharacterIdleAnims
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #9
	adds r1, r3, #0
	adds r1, #0x68
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r4, r1, #0
_08024A10:
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A20
	rsbs r0, r0, #0
_08024A20:
	cmp r0, #7
	ble _08024A30
	cmp r0, #0x80
	ble _08024A32
	movs r0, #0x80
	b _08024A32
	.align 2, 0
_08024A2C: .4byte gPlayerCharacterIdleAnims
_08024A30:
	movs r0, #8
_08024A32:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	b _08024A96
_08024A3A:
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #1
	bne _08024A96
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A60
	rsbs r0, r0, #0
_08024A60:
	cmp r0, #7
	ble _08024A6C
	cmp r0, #0x80
	ble _08024A88
	movs r0, #0x80
	b _08024A88
_08024A6C:
	movs r0, #8
	b _08024A88
_08024A70:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	b _08024A7A
_08024A76:
	movs r4, #0x14
	ldrsh r0, [r3, r4]
_08024A7A:
	cmp r0, #0
	bge _08024A80
	rsbs r0, r0, #0
_08024A80:
	asrs r1, r0, #8
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #8
_08024A88:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
_08024A96:
	ldr r0, _08024B0C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024AA8
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
_08024AA8:
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r1, [r0]
	adds r6, r0, #0
	mov r5, ip
	adds r5, #0x20
	cmp r1, #0
	bne _08024ACA
	mov r1, ip
	ldrh r0, [r1, #0xa]
	ldrh r1, [r4]
	cmp r0, r1
	bne _08024ACA
	ldrb r0, [r5]
	ldrh r1, [r2]
	cmp r0, r1
	beq _08024AF6
_08024ACA:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r2]
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	ldrb r0, [r7]
	cmp r0, #2
	bls _08024AF6
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #1
	strb r0, [r1]
_08024AF6:
	mov r0, r8
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024B0C: .4byte gGameMode
.endif

	thumb_func_start sub_8024B10
sub_8024B10: @ 0x08024B10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r5, #0xc
	adds r6, r1, #0
	ldr r0, _08024BBC @ =gCamera
	ldrh r3, [r0]
	ldrh r4, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08024B3A
	ldrh r1, [r5, #0x1e]
	ldr r0, _08024BC0 @ =0x0000FFFF
	cmp r1, r0
	bne _08024B3C
_08024B3A:
	movs r2, #1
_08024B3C:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _08024B84
	cmp r0, #0x29
	beq _08024B84
	cmp r0, #0x3e
	beq _08024B84
	cmp r0, #0x3f
	beq _08024B84
	cmp r0, #0x57
	bne _08024C68
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08024C68
_08024B84:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r5, #0x10]
	ldr r0, _08024BC4 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024BC8
	movs r0, #0xff
	lsls r0, r0, #8
	b _08024BCC
	.align 2, 0
_08024BBC: .4byte gCamera
_08024BC0: .4byte 0x0000FFFF
_08024BC4: .4byte 0xFFFFF3FF
_08024BC8:
	movs r0, #0x80
	lsls r0, r0, #1
_08024BCC:
	strh r0, [r6, #2]
	ldr r2, _08024C14 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024BE2
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
_08024BE2:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08024BF0
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_08024BF0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldrh r1, [r6]
	adds r1, r1, r0
	ldr r2, _08024C18 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _08024C1C @ =0x000003FF
	ands r0, r1
	strh r0, [r6]
	b _08024C26
	.align 2, 0
_08024C14: .4byte gUnknown_03005424
_08024C18: .4byte 0xFFFFFF00
_08024C1C: .4byte 0x000003FF
_08024C20:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
_08024C26:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r5, #0
	bl sub_8004558
	ldr r0, _08024C64 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08024CC2
	.align 2, 0
_08024C64: .4byte gGameMode
_08024C68:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r5, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024C88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r5, #0x10]
	b _08024C94
_08024C88:
	ldr r0, _08024CAC @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r5, #0x10]
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
_08024C94:
	ldr r0, _08024CB0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024CB4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08024CBA
	.align 2, 0
_08024CAC: .4byte 0xFFFFFBFF
_08024CB0: .4byte gUnknown_03005424
_08024CB4:
	ldr r0, [r5, #0x10]
	ldr r1, _08024D9C @ =0xFFFFF7FF
	ands r0, r1
_08024CBA:
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
_08024CC2:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08024CF2
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08024CF8
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024CF2
	ldr r0, _08024DA4 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08024CF8
_08024CF2:
	adds r0, r5, #0
	bl sub_80051E8
_08024CF8:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	b _08024F5C
_08024D02:
	ldr r4, _08024DA8 @ =gMultiSioSend
	ldr r2, _08024DAC @ =gMultiplayerPlayerTasks
	ldr r0, _08024DB0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r4]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #4]
	ldrh r3, [r5, #0xa]
	strh r3, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #5
	bne _08024D6C
	ldr r1, _08024DB4 @ =gPlayerCharacterIdleAnims
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, r3, r1
	ldr r0, _08024DB8 @ =gRingCount
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4, #6]
_08024D6C:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r4, #0xb]
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024DBC
	ldrh r0, [r4, #8]
	movs r1, #1
	orrs r0, r1
	b _08024DC2
	.align 2, 0
_08024D9C: .4byte 0xFFFFF7FF
_08024DA0: .4byte gGameMode
_08024DA4: .4byte gUnknown_03005590
_08024DA8: .4byte gMultiSioSend
_08024DAC: .4byte gMultiplayerPlayerTasks
_08024DB0: .4byte 0x04000128
_08024DB4: .4byte gPlayerCharacterIdleAnims
_08024DB8: .4byte gRingCount
_08024DBC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DD8 @ =0x0000FFFE
	ands r0, r1
_08024DC2:
	strh r0, [r4, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	bne _08024DDC
	ldrh r1, [r4, #8]
	movs r0, #2
	orrs r0, r1
	b _08024DE2
	.align 2, 0
_08024DD8: .4byte 0x0000FFFE
_08024DDC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DF8 @ =0x0000FFFD
	ands r0, r1
_08024DE2:
	strh r0, [r4, #8]
	ldr r0, _08024DFC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024E00
	ldrh r1, [r4, #8]
	movs r0, #8
	orrs r0, r1
	b _08024E06
	.align 2, 0
_08024DF8: .4byte 0x0000FFFD
_08024DFC: .4byte gUnknown_03005424
_08024E00:
	ldrh r1, [r4, #8]
	ldr r0, _08024E38 @ =0x0000FFF7
	ands r0, r1
_08024E06:
	strh r0, [r4, #8]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024E2E
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024E3C
_08024E2E:
	ldrh r1, [r4, #8]
	movs r0, #4
	orrs r0, r1
	b _08024E42
	.align 2, 0
_08024E38: .4byte 0x0000FFF7
_08024E3C:
	ldrh r1, [r4, #8]
	ldr r0, _08024E5C @ =0x0000FFFB
	ands r0, r1
_08024E42:
	strh r0, [r4, #8]
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08024E60
	ldrh r1, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	b _08024E66
	.align 2, 0
_08024E5C: .4byte 0x0000FFFB
_08024E60:
	ldrh r1, [r4, #8]
	ldr r0, _08024E7C @ =0x0000FEFF
	ands r0, r1
_08024E66:
	strh r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08024E80
	ldrh r1, [r4, #8]
	movs r0, #0x40
	orrs r0, r1
	b _08024E86
	.align 2, 0
_08024E7C: .4byte 0x0000FEFF
_08024E80:
	ldrh r1, [r4, #8]
	ldr r0, _08024EB8 @ =0x0000FFBF
	ands r0, r1
_08024E86:
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldr r2, _08024EBC @ =0x0000FFCF
	ands r2, r0
	strh r2, [r4, #8]
	ldr r3, _08024EC0 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024EC4
	movs r0, #0x80
	orrs r1, r0
	b _08024EC8
	.align 2, 0
_08024EB8: .4byte 0x0000FFBF
_08024EBC: .4byte 0x0000FFCF
_08024EC0: .4byte gPlayer
_08024EC4:
	ldr r0, _08024EDC @ =0x0000FF7F
	ands r1, r0
_08024EC8:
	strh r1, [r4, #8]
	mov r0, sb
	cmp r0, #0
	beq _08024EE0
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _08024EE6
	.align 2, 0
_08024EDC: .4byte 0x0000FF7F
_08024EE0:
	ldrh r1, [r4, #8]
	ldr r0, _08024F68 @ =0x0000F7FF
	ands r0, r1
_08024EE6:
	strh r0, [r4, #8]
	ldr r6, _08024F6C @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08024F4C
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08024F2C
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _08024F4C
_08024F16:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _08024F2C
	strb r2, [r5]
_08024F2C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08024F4C
	ldr r0, _08024F6C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08024F2C
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _08024F16
_08024F4C:
	ldrh r0, [r4, #8]
	ldr r1, _08024F70 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r4, #8]
	ldrb r0, [r5]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r4, #8]
_08024F5C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F68: .4byte 0x0000F7FF
_08024F6C: .4byte 0x04000128
_08024F70: .4byte 0x0000F9FF

	thumb_func_start sub_8024F74
sub_8024F74: @ 0x08024F74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r6, #0xc
	adds r4, r1, #0
	ldr r0, _08024FB4 @ =gCamera
	ldrh r3, [r0]
	ldrh r7, [r0, #4]
	ldr r0, _08024FB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08024FC4
	ldr r0, _08024FBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08024FC0 @ =gMultiSioRecv
	adds r1, r1, r0
	ldrh r2, [r1, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #6]
	ldrh r1, [r1, #4]
	b _08024FD4
	.align 2, 0
_08024FB4: .4byte gCamera
_08024FB8: .4byte gGameMode
_08024FBC: .4byte 0x04000128
_08024FC0: .4byte gMultiSioRecv
_08024FC4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #6]
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
_08024FD4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #8]
	adds r2, r6, #0
	adds r2, #0x22
	movs r0, #0x10
	strb r0, [r2]
	ldr r1, [r5, #0x20]
	movs r0, #0x40
	ands r0, r1
	mov sl, r1
	cmp r0, #0
	beq _08024FF4
	movs r0, #8
	strb r0, [r2]
_08024FF4:
	adds r0, r5, #0
	adds r0, #0x85
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #4
	bls _08025004
	b _08025306
_08025004:
	lsls r0, r1, #2
	ldr r1, _08025010 @ =_08025014
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025010: .4byte _08025014
_08025014: @ jump table
	.4byte _08025306 @ case 0
	.4byte _08025028 @ case 1
	.4byte _08025180 @ case 2
	.4byte _08025306 @ case 3
	.4byte _08025306 @ case 4
_08025028:
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov ip, r2
	ldr r1, _080250B0 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08025058
	cmp r2, #1
	beq _0802506E
_08025058:
	cmp r1, #4
	bne _08025060
	cmp r2, #0
	beq _0802506E
_08025060:
	cmp r3, #0x46
	beq _08025066
	b _08025306
_08025066:
	mov r0, ip
	cmp r0, #0
	beq _0802506E
	b _08025306
_0802506E:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0xb0
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _080250B4 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080250B8
	movs r0, #0xff
	lsls r0, r0, #8
	b _080250BC
	.align 2, 0
_080250B0: .4byte gPlayerCharacterIdleAnims
_080250B4: .4byte gUnknown_030054B8
_080250B8:
	movs r0, #0x80
	lsls r0, r0, #1
_080250BC:
	strh r0, [r4, #2]
	ldr r2, _08025104 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080250D2
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_080250D2:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080250E0
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_080250E0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025110
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025108 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802510C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _08025116
	.align 2, 0
_08025104: .4byte gUnknown_03005424
_08025108: .4byte 0xFFFFFF00
_0802510C: .4byte 0x000003FF
_08025110:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_08025116:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025174
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	beq _0802515E
	b _08025306
_0802515E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025174
	ldr r0, _0802517C @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025174
	b _08025306
_08025174:
	adds r0, r6, #0
	bl sub_80051E8
	b _08025306
	.align 2, 0
_0802517C: .4byte gUnknown_03005590
_08025180:
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	mov ip, r2
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	mov sb, r0
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov r8, r2
	ldr r1, _080251F4 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080251BC
	cmp r2, #1
	beq _080251D2
_080251BC:
	cmp r1, #4
	bne _080251C4
	cmp r2, #0
	beq _080251D2
_080251C4:
	cmp r3, #0x46
	beq _080251CA
	b _08025306
_080251CA:
	mov r2, r8
	cmp r2, #0
	beq _080251D2
	b _08025306
_080251D2:
	mov r3, ip
	cmp r3, #0
	bne _080251DE
	mov r0, sb
	cmp r0, #0
	beq _080251F8
_080251DE:
	mov r0, ip
	mov r1, sb
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08025208
	.align 2, 0
_080251F4: .4byte gPlayerCharacterIdleAnims
_080251F8:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	movs r1, #0x40
	cmp r0, #0
	beq _08025206
	movs r1, #0xc0
_08025206:
	adds r0, r1, #0
_08025208:
	adds r1, r5, #0
	adds r1, #0xad
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08025244 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08025248
	movs r0, #0xff
	lsls r0, r0, #8
	b _0802524C
	.align 2, 0
_08025244: .4byte gUnknown_030054B8
_08025248:
	movs r0, #0x80
	lsls r0, r0, #1
_0802524C:
	strh r0, [r4, #2]
	ldr r2, _08025294 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025262
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_08025262:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08025270
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_08025270:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080252A0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025298 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802529C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _080252A6
	.align 2, 0
_08025294: .4byte gUnknown_03005424
_08025298: .4byte 0xFFFFFF00
_0802529C: .4byte 0x000003FF
_080252A0:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_080252A6:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025300
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08025306
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025300
	ldr r0, _08025314 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025306
_08025300:
	adds r0, r6, #0
	bl sub_80051E8
_08025306:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025314: .4byte gUnknown_03005590
