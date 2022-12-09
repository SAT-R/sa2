.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gUnknown_080984DC
gUnknown_080984DC:
    .incbin "baserom.gba", 0x000984DC, 0x1

    .global gUnknown_080984DD
gUnknown_080984DD:
    .incbin "baserom.gba", 0x000984DD, 0x17

    .global gUnknown_080984F4
gUnknown_080984F4:
    .incbin "baserom.gba", 0x000984F4, 0x1687C

.text
.syntax unified
.arm

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
