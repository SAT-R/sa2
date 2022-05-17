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
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x20]
	ldr r0, _08064008 @ =0x0000035B
	add r0, sb
	ldrb r0, [r0]
	str r0, [sp, #0x24]
	movs r0, #0xf9
	lsls r0, r0, #2
	add r0, sb
	ldr r6, _0806400C @ =0x00000414
	add r6, sb
	ldr r1, _08064010 @ =0x00000594
	add r1, sb
	mov sl, r1
	ldr r2, _08064014 @ =0x00000654
	add r2, sb
	str r2, [sp, #0x28]
	ldr r3, [sp, #0x24]
	lsls r4, r3, #3
	ldr r1, _08064018 @ =gUnknown_080D95E8
	adds r4, r4, r1
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r1, #0xc0
	lsls r1, r1, #6
	str r1, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	bl sub_806A568
	movs r0, #0
	mov r8, r0
	movs r1, #0x1e
	str r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	lsls r2, r2, #6
	str r2, [sp, #0x34]
	ldr r3, [sp, #0x20]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x38]
_08063E3C:
	movs r0, #0xd7
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	mov r2, r8
	lsls r1, r2, #0x10
	cmp r0, #0
	bne _08063E56
	asrs r0, r1, #0x10
	ldr r3, [sp, #0x20]
	lsls r5, r3, #0x10
	cmp r0, #5
	beq _08063EBA
_08063E56:
	asrs r2, r1, #0x10
	lsls r0, r2, #3
	ldr r1, _0806401C @ =gUnknown_080D9618
	adds r0, r0, r1
	ldr r3, [sp, #0x34]
	adds r1, r3, r0
	movs r0, #0xf0
	lsls r0, r0, #3
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r7, #0x28
	cmp r0, r2
	bne _08063E76
	movs r7, #0x20
_08063E76:
	ldr r0, [sp, #0x20]
	lsls r5, r0, #0x10
	ldr r3, [sp, #0x38]
	cmp r3, #1
	bne _08063E86
	cmp r2, #0
	bne _08063E86
	ldr r7, _08064020 @ =0x0000FF48
_08063E86:
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #0
	bl sub_806A568
	adds r4, #0xf
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #0x2c]
_08063EBA:
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	adds r6, #0x30
	lsrs r3, r0, #0x10
	mov r8, r3
	asrs r0, r0, #0x10
	str r0, [sp, #0x30]
	cmp r0, #7
	ble _08063E3C
	movs r6, #0xf0
	lsls r6, r6, #3
	add r6, sb
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r1, #0xa0
	cmp r0, #0
	bne _08063EE4
	movs r1, #0x98
_08063EE4:
	adds r7, r1, #0
	asrs r5, r5, #0x10
	str r5, [sp, #0x3c]
	cmp r5, #1
	bne _08063EF0
	ldr r7, _08064024 @ =0x0000FFC0
_08063EF0:
	ldr r3, _08064028 @ =0x000003BA
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x1e
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r0, sl
	movs r2, #0x12
	bl sub_806A568
	movs r2, #0x30
	add sl, r2
	ldr r3, [sp, #0x24]
	lsls r5, r3, #4
	ldr r0, _0806402C @ =0x00000359
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08064030 @ =gUnknown_080D9798
	adds r0, r0, r1
	adds r1, r5, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r4, #0xa0
	cmp r0, #1
	bne _08063F38
	movs r4, #0x98
_08063F38:
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x2d
	str r0, [sp, #8]
	movs r7, #0xa
	str r7, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	mov r1, r8
	str r1, [sp, #0x14]
	mov r0, sl
	movs r1, #0
	bl sub_806A568
	movs r2, #0x30
	add sl, r2
	ldr r0, _08064034 @ =0x0000035A
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r1, _08064038 @ =gUnknown_080D97F8
	adds r0, r0, r1
	adds r1, r5, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r4, #0xa0
	cmp r0, #2
	bne _08063F7A
	movs r4, #0x98
_08063F7A:
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x3c
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	mov r1, r8
	str r1, [sp, #0x14]
	mov r0, sl
	movs r1, #0
	bl sub_806A568
	movs r2, #0x30
	add sl, r2
	ldr r3, [sp, #0x24]
	lsls r1, r3, #3
	ldr r0, _0806403C @ =gUnknown_080D9858
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r4, #0xa0
	cmp r0, #3
	bne _08063FB4
	movs r4, #0x98
_08063FB4:
	ldrh r2, [r1, #4]
	ldrh r3, [r1]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x4b
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldrb r0, [r1, #2]
	str r0, [sp, #0x10]
	mov r1, r8
	str r1, [sp, #0x14]
	mov r0, sl
	movs r1, #0
	bl sub_806A568
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r1, #0xab
	cmp r0, #0
	bne _08063FE2
	movs r1, #0xa3
_08063FE2:
	adds r7, r1, #0
	ldr r2, [sp, #0x3c]
	cmp r2, #1
	bne _08063FF2
	ldr r3, [sp, #0x30]
	cmp r3, #0
	bne _08063FF2
	ldr r7, _08064040 @ =0x0000FFCB
_08063FF2:
	movs r0, #0
	mov r8, r0
	movs r1, #0x26
	str r1, [sp, #0x2c]
	mov sl, r0
_08063FFC:
	mov r2, sl
	cmp r2, #0
	beq _08064044
	movs r1, #0x11
	b _0806404E
	.align 2, 0
_08064008: .4byte 0x0000035B
_0806400C: .4byte 0x00000414
_08064010: .4byte 0x00000594
_08064014: .4byte 0x00000654
_08064018: .4byte gUnknown_080D95E8
_0806401C: .4byte gUnknown_080D9618
_08064020: .4byte 0x0000FF48
_08064024: .4byte 0x0000FFC0
_08064028: .4byte 0x000003BA
_0806402C: .4byte 0x00000359
_08064030: .4byte gUnknown_080D9798
_08064034: .4byte 0x0000035A
_08064038: .4byte gUnknown_080D97F8
_0806403C: .4byte gUnknown_080D9858
_08064040: .4byte 0x0000FFCB
_08064044:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0xf
	add r0, sb
	ldrh r1, [r0]
_0806404E:
	ldr r0, _080640FC @ =0x0000FFFF
	cmp r1, r0
	bne _0806405A
	movs r1, #0x11
	movs r0, #1
	mov sl, r0
_0806405A:
	add r0, sp, #0x18
	bl sub_806B908
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	lsls r3, r5, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	lsls r0, r7, #0x10
	asrs r6, r0, #0x10
	str r6, [sp, #4]
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	lsrs r0, r5, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	movs r1, #0
	adds r2, r4, #0
	bl sub_806A568
	movs r0, #0xf0
	lsls r0, r0, #3
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #8
	cmp r0, #0
	bne _080640AA
	movs r1, #7
_080640AA:
	ldr r0, [sp, #0x28]
	adds r0, #0x25
	strb r1, [r0]
	mov r2, r8
	lsls r1, r2, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r1, r3
	ldr r0, [sp, #0x28]
	adds r0, #0x30
	str r0, [sp, #0x28]
	adds r0, r6, #0
	adds r0, #0xa
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsrs r2, r1, #0x10
	mov r8, r2
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _08063FFC
	movs r3, #0
	mov r8, r3
	movs r5, #0xf0
	lsls r5, r5, #3
	add r5, sb
	movs r7, #0
	movs r6, #1
	ldr r4, _08064100 @ =0x000005B9
	add r4, sb
	ldr r3, _08064104 @ =0x00000439
	add r3, sb
_080640E8:
	movs r0, #0
	ldrsb r0, [r5, r0]
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r2, r1, #0x10
	cmp r0, r2
	bne _08064108
	strb r7, [r3]
	b _0806410A
	.align 2, 0
_080640FC: .4byte 0x0000FFFF
_08064100: .4byte 0x000005B9
_08064104: .4byte 0x00000439
_08064108:
	strb r6, [r3]
_0806410A:
	adds r3, #0x30
	asrs r2, r1, #0x10
	cmp r2, #3
	bgt _08064122
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, r2
	bne _0806411E
	strb r7, [r4]
	b _08064120
_0806411E:
	strb r6, [r4]
_08064120:
	adds r4, #0x30
_08064122:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r1, r2
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080640E8
	movs r6, #0
	movs r4, #0xf1
	lsls r4, r4, #2
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_806A568
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_806A568
	subs r4, #1
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	movs r0, #0xc
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_806A568
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	movs r0, #0xd
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_806A568
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
