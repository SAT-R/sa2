.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

    @ Unused
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
	ldr r7, _08005E28 @ =gBgOffsetsHBlank
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
	ldr r4, _08005E28 @ =gBgOffsetsHBlank
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
	ldr r1, _08005E28 @ =gBgOffsetsHBlank
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
_08005E28: .4byte gBgOffsetsHBlank
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

    @ Unused
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
	ldr r0, _08006000 @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r3, r0, #2
	b _08006038
	.align 2, 0
_08005FF8: .4byte gFlags
_08005FFC: .4byte gUnknown_03002A80
_08006000: .4byte gBgOffsetsHBlank
_08006004:
	ldr r0, _0800600C @ =gBgOffsetsHBlank
	ldr r3, [r0]
	b _08006038
	.align 2, 0
_0800600C: .4byte gBgOffsetsHBlank
_08006010:
	ldr r1, _08006028 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0800602C @ =gBgOffsetsHBlank
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
_0800602C: .4byte gBgOffsetsHBlank
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
