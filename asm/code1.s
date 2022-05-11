.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8007C10
sub_8007C10: @ 0x08007C10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r0, r5, #3
	lsrs r5, r0, #2
	movs r4, #0
	ldr r1, _08007C4C @ =gUnknown_03001888
	ldrh r0, [r1]
	lsrs r0, r0, #2
	mov sb, r1
	cmp r4, r0
	bhs _08007CAE
	ldr r0, _08007C50 @ =gUnknown_03005190
	mov r8, r0
_08007C32:
	lsls r1, r4, #1
	mov r2, r8
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, #0
	bne _08007C94
	movs r3, #0
	ldr r7, _08007C4C @ =gUnknown_03001888
	mov ip, r7
	ldr r0, _08007C50 @ =gUnknown_03005190
	mov sl, r0
	ldr r6, _08007C54 @ =gUnknown_020226D0
	b _08007C5E
	.align 2, 0
_08007C4C: .4byte gUnknown_03001888
_08007C50: .4byte gUnknown_03005190
_08007C54: .4byte gUnknown_020226D0
_08007C58:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08007C5E:
	cmp r3, r5
	bhs _08007C7C
	adds r2, r4, r3
	mov r7, ip
	ldrh r0, [r7]
	lsrs r0, r0, #2
	cmp r2, r0
	blt _08007C72
	ldr r0, [r6]
	b _08007CB2
_08007C72:
	lsls r0, r2, #1
	add r0, sl
	ldrh r0, [r0]
	cmp r0, #0
	beq _08007C58
_08007C7C:
	cmp r3, r5
	bne _08007C9E
	mov r2, r8
	adds r0, r1, r2
	strh r5, [r0]
	ldr r0, _08007C90 @ =gUnknown_03001940
	lsls r1, r4, #7
	ldr r0, [r0]
	adds r0, r0, r1
	b _08007CB2
	.align 2, 0
_08007C90: .4byte gUnknown_03001940
_08007C94:
	ldr r7, _08007CC0 @ =0x0000FFFF
	adds r0, r4, r7
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08007C9E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, sb
	ldrh r0, [r1]
	lsrs r0, r0, #2
	cmp r4, r0
	blo _08007C32
_08007CAE:
	ldr r0, _08007CC4 @ =gUnknown_020226D0
	ldr r0, [r0]
_08007CB2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007CC0: .4byte 0x0000FFFF
_08007CC4: .4byte gUnknown_020226D0

	thumb_func_start sub_8007CC8
sub_8007CC8: @ 0x08007CC8
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08007CE4 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08007CE8 @ =gUnknown_03005190
	str r0, [r1, #4]
	ldr r0, _08007CEC @ =0x81000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_08007CE4: .4byte 0x040000D4
_08007CE8: .4byte gUnknown_03005190
_08007CEC: .4byte 0x81000100

	thumb_func_start sub_8007CF0
sub_8007CF0: @ 0x08007CF0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08007D14 @ =gUnknown_020226D0
	ldr r0, [r0]
	cmp r0, r1
	beq _08007D10
	ldr r0, _08007D18 @ =gUnknown_03001940
	ldr r0, [r0]
	subs r0, r1, r0
	lsls r0, r0, #9
	lsrs r0, r0, #0x10
	ldr r1, _08007D1C @ =gUnknown_03005190
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_08007D10:
	pop {r0}
	bx r0
	.align 2, 0
_08007D14: .4byte gUnknown_020226D0
_08007D18: .4byte gUnknown_03001940
_08007D1C: .4byte gUnknown_03005190

	thumb_func_start sub_8007D20
sub_8007D20: @ 0x08007D20
	ldr r1, _08007D28 @ =gUnknown_030053C0
	movs r0, #0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08007D28: .4byte gUnknown_030053C0

	thumb_func_start sub_8007D2C
sub_8007D2C: @ 0x08007D2C
	ldr r1, _08007D34 @ =gUnknown_030053C0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08007D34: .4byte gUnknown_030053C0

	thumb_func_start sub_8007D38
sub_8007D38: @ 0x08007D38
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _08007D78 @ =gUnknown_030053C0
	movs r5, #0
	strb r5, [r6, #8]
	ldr r4, _08007D7C @ =gUnknown_030053CC
	movs r0, #0x80
	lsls r0, r0, #5
	bl EwramMalloc
	adds r1, r0, #0
	str r1, [r4]
	ldr r0, _08007D80 @ =gUnknown_030053B0
	ldr r0, [r0]
	bl LZ77UnCompWram
	ldr r0, _08007D84 @ =sub_8007DEC
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08007D88 @ =sub_8007DF0
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r5, [r6, #4]
	str r5, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08007D78: .4byte gUnknown_030053C0
_08007D7C: .4byte gUnknown_030053CC
_08007D80: .4byte gUnknown_030053B0
_08007D84: .4byte sub_8007DEC
_08007D88: .4byte sub_8007DF0

	thumb_func_start sub_8007D8C
sub_8007D8C: @ 0x08007D8C
	push {lr}
	ldr r3, _08007D9C @ =gUnknown_030053C0
	ldr r2, [r3]
	ldr r0, _08007DA0 @ =0x000007FF
	cmp r2, r0
	ble _08007DA4
	movs r0, #0
	b _08007DB2
	.align 2, 0
_08007D9C: .4byte gUnknown_030053C0
_08007DA0: .4byte 0x000007FF
_08007DA4:
	ldr r0, _08007DB8 @ =gUnknown_030053CC
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r2, #1
	str r1, [r3]
_08007DB2:
	pop {r1}
	bx r1
	.align 2, 0
_08007DB8: .4byte gUnknown_030053CC

	thumb_func_start sub_8007DBC
sub_8007DBC: @ 0x08007DBC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r4, _08007DE0 @ =gUnknown_030053C0
	ldr r2, [r4, #4]
	ldr r0, _08007DE4 @ =0x000007FF
	cmp r2, r0
	bgt _08007DDA
	ldr r0, _08007DE8 @ =gUnknown_030053CC
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	strh r3, [r0]
	adds r0, r2, #1
	str r0, [r4, #4]
_08007DDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007DE0: .4byte gUnknown_030053C0
_08007DE4: .4byte 0x000007FF
_08007DE8: .4byte gUnknown_030053CC

	thumb_func_start sub_8007DEC
sub_8007DEC: @ 0x08007DEC
	bx lr
	.align 2, 0

	thumb_func_start sub_8007DF0
sub_8007DF0: @ 0x08007DF0
	push {lr}
	ldr r0, _08007E08 @ =gUnknown_030053CC
	ldr r0, [r0]
	bl EwramFree
	ldr r1, _08007E0C @ =gUnknown_030053C0
	movs r0, #0
	strb r0, [r1, #8]
	str r0, [r1, #4]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08007E08: .4byte gUnknown_030053CC
_08007E0C: .4byte gUnknown_030053C0

	thumb_func_start sub_8007E10
sub_8007E10: @ 0x08007E10
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08007E5C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _08007E70
	ldr r0, _08007E60 @ =sub_8007F1C
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08007E64 @ =sub_8008874
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	adds r7, r0, #0
	ldr r5, _08007E68 @ =gSpritePosData_Rings
	ldr r4, _08007E6C @ =gUnknown_030055B4
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	b _08007EA0
	.align 2, 0
_08007E5C: .4byte gUnknown_030054CC
_08007E60: .4byte sub_8007F1C
_08007E64: .4byte sub_8008874
_08007E68: .4byte gSpritePosData_Rings
_08007E6C: .4byte gUnknown_030055B4
_08007E70:
	ldr r0, _08007EF4 @ =sub_8007F1C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	adds r7, r0, #0
	ldr r0, _08007EF8 @ =gUnknown_0203300C
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	adds r0, #3
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldr r1, _08007EFC @ =gUnknown_0203F000
	adds r6, r0, r1
	ldr r0, _08007F00 @ =gUnknown_02033008
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
_08007EA0:
	ldrh r0, [r7, #6]
	ldr r5, _08007F04 @ =IWRAM_START + 0x30
	adds r0, r0, r5
	str r6, [r0]
	ldrh r3, [r7, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r4, #0
	movs r2, #0
	strh r2, [r1, #0x16]
	strh r2, [r1, #0x18]
	ldr r0, _08007F08 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	ldr r0, _08007F0C @ =0x000002D6
	strh r0, [r1, #0xa]
	subs r5, #0x10
	adds r0, r3, r5
	strb r4, [r0]
	strh r2, [r1, #0x14]
	strh r2, [r1, #0x1c]
	ldr r0, _08007F10 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	adds r5, #2
	adds r2, r3, r5
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _08007F14 @ =IWRAM_START + 0x25
	adds r3, r3, r0
	strb r4, [r3]
	ldr r0, _08007F18 @ =0x00042200
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007EF4: .4byte sub_8007F1C
_08007EF8: .4byte gUnknown_0203300C
_08007EFC: .4byte gUnknown_0203F000
_08007F00: .4byte gUnknown_02033008
_08007F04: .4byte IWRAM_START + 0x30
_08007F08: .4byte 0x06011F00
_08007F0C: .4byte 0x000002D6
_08007F10: .4byte IWRAM_START + 0x21
_08007F14: .4byte IWRAM_START + 0x25
_08007F18: .4byte 0x00042200

	thumb_func_start sub_8007F1C
sub_8007F1C: @ 0x08007F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r2, _08008288 @ =gUnknown_030059E0
	ldrb r4, [r2, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _0800828C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08007F60
	bl _0800884A
_08007F60:
	ldr r0, _08008290 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08008294 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r0, _08008298 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08007F8E
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08007F8A
	ldr r0, _0800829C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08007F8E
_08007F8A:
	cmp r1, #0x1d
	bne _08007FBE
_08007F8E:
	ldr r5, _080082A0 @ =gUnknown_03005430
	ldrb r0, [r5]
	cmp r0, #0
	beq _08007FBE
	ldr r4, _080082A4 @ =gUnknown_0300542C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08007FBE
	ldr r1, _080082A8 @ =gSpritePosData_Rings
	ldr r0, _08008298 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	bl RLUnCompWram
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
_08007FBE:
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, _08008298 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _08007FFA
	bl sub_802C6E4
	movs r1, #0x87
	lsls r1, r1, #2
	ands r1, r0
	movs r3, #1
	str r3, [sp, #8]
	cmp r1, #0
	beq _08007FE4
	movs r4, #0
	str r4, [sp, #8]
_08007FE4:
	ldr r0, _080082AC @ =gUnknown_030059E8
	adds r1, r0, #4
	bl sub_802C668
	mov r0, sp
	movs r1, #0xf6
	strb r1, [r0]
	strb r1, [r0, #1]
	movs r1, #0xa
	strb r1, [r0, #2]
	strb r1, [r0, #3]
_08007FFA:
	ldr r0, _08008290 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r6, _08008294 @ =IWRAM_START + 0x30
	adds r0, r1, r6
	ldr r0, [r0]
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	adds r0, r1, #0
	bl sub_8004558
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0xc]
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x14]
	adds r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldm r1!, {r0}
	str r1, [sp, #0x14]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, _08008288 @ =gUnknown_030059E0
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	mov r0, sp
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _0800805C
	b _0800822C
_0800805C:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	blo _08008064
	b _0800822C
_08008064:
	ldr r4, _08008288 @ =gUnknown_030059E0
	ldr r2, [r4, #8]
	asrs r1, r2, #8
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	subs r0, #8
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	ldr r3, [r4, #0xc]
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x40]
	cmp sb, r0
	ble _08008098
	b _08008208
_08008098:
	ldr r0, [sp, #0xc]
	cmp sb, r0
	blo _080080A0
	b _08008208
_080080A0:
	ldr r1, [sp, #0xc]
	mov r0, sl
	muls r0, r1, r0
	mov r4, sb
	lsls r1, r4, #2
	lsls r0, r0, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	adds r4, #1
	str r4, [sp, #0x3c]
	cmp r0, #0
	bne _080080BE
	b _080081E4
_080080BE:
	subs r0, #8
	adds r5, r6, r0
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _080080CC
	b _080081E4
_080080CC:
	mov r0, sp
	str r0, [sp, #0x24]
_080080D0:
	cmp r1, #0xfe
	bne _080080D6
	b _080081D2
_080080D6:
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r2, sb
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r7, r1, r0
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _0800810A
	ldr r0, _08008298 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080081D2
	ldr r6, _08008288 @ =gUnknown_030059E0
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _080081D2
_0800810A:
	mov r2, r8
	subs r2, #8
	ldr r1, _08008288 @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r4, [sp, #0x24]
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800812C
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _0800813A
	cmp r2, r1
	blt _080081D2
_0800812C:
	ldr r6, [sp, #0x24]
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080081D2
_0800813A:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r1, _08008288 @ =gUnknown_030059E0
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r4, [sp, #0x24]
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08008158
	cmp r7, r1
	bge _08008166
	cmp r2, r1
	blt _080081D2
_08008158:
	ldr r6, [sp, #0x24]
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _080081D2
_08008166:
	ldr r1, _080082B0 @ =gUnknown_030053F0
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08008298 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080081AC
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _080081AC
	ldr r0, _080082B4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #0
	bne _080081AC
	ldr r1, _080082B8 @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _080081A4
	movs r0, #0xff
_080081A4:
	strb r0, [r1]
	ldr r1, _080082BC @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_080081AC:
	ldr r0, _080082B4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _080081C0
	ldr r1, _080082B0 @ =gUnknown_030053F0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _080081C0
	movs r0, #0xff
	strh r0, [r1]
_080081C0:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0xfe
	strb r0, [r5]
_080081D2:
	adds r5, #2
	ldrb r1, [r5]
	adds r0, r1, #0
	ldr r2, _08008288 @ =gUnknown_030059E0
	ldr r3, [r2, #0xc]
	ldr r2, [r2, #8]
	cmp r0, #0xff
	beq _080081E4
	b _080080D0
_080081E4:
	ldr r4, [sp, #0x3c]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	asrs r1, r2, #8
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp sb, r0
	bgt _08008208
	ldr r6, [sp, #0xc]
	cmp sb, r6
	bhs _08008208
	b _080080A0
_08008208:
	ldr r1, [sp, #0x40]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	asrs r1, r3, #8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _0800822C
	ldr r2, [sp, #0x10]
	cmp sl, r2
	bhs _0800822C
	b _08008064
_0800822C:
	ldr r0, _080082B4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08008236
	b _0800847E
_08008236:
	movs r2, #0
_08008238:
	ldr r0, _080082C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r3, r2, #1
	str r3, [sp, #0x30]
	cmp r2, r0
	bne _0800824A
	b _08008472
_0800824A:
	ldr r1, _080082C4 @ =gUnknown_030055A0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08008258
	b _08008472
_08008258:
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r4, r2, r6
	ldr r1, _080082C8 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r6, #0x2d
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r3, _080082CC @ =IWRAM_START + 0x2F
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	b _080082D0
	.align 2, 0
_08008288: .4byte gUnknown_030059E0
_0800828C: .4byte gUnknown_03005424
_08008290: .4byte gCurTask
_08008294: .4byte IWRAM_START + 0x30
_08008298: .4byte gUnknown_030055B4
_0800829C: .4byte gUnknown_030054B0
_080082A0: .4byte gUnknown_03005430
_080082A4: .4byte gUnknown_0300542C
_080082A8: .4byte gSpritePosData_Rings
_080082AC: .4byte gUnknown_030059E8
_080082B0: .4byte gUnknown_030053F0
_080082B4: .4byte gUnknown_030054CC
_080082B8: .4byte gUnknown_03005448
_080082BC: .4byte gUnknown_030054A8
_080082C0: .4byte 0x04000128
_080082C4: .4byte gUnknown_030055A0
_080082C8: .4byte IWRAM_START + 0x52
_080082CC: .4byte IWRAM_START + 0x2F
_080082D0:
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _080082DA
	b _08008472
_080082DA:
	ldr r6, [sp, #0x10]
	cmp sl, r6
	blo _080082E2
	b _08008472
_080082E2:
	ldr r0, _08008330 @ =IWRAM_START + 0x50
	adds r0, r2, r0
	str r0, [sp, #0x28]
	ldr r1, _08008334 @ =IWRAM_START + 0x2C
	adds r1, r2, r1
	str r1, [sp, #0x2c]
	subs r3, #1
	adds r3, r2, r3
	str r3, [sp, #0x48]
_080082F4:
	ldr r6, [sp, #0x28]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	subs r1, #8
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r3, [sp, #0x48]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r1, r1, r0
	adds r1, #0x10
	asrs r1, r1, #8
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x40]
	adds r0, r4, #0
	adds r0, #0x52
	str r0, [sp, #0x38]
	adds r2, r4, #0
	adds r2, #0x2f
	str r2, [sp, #0x34]
	cmp sb, r1
	ble _0800832E
	b _0800844C
_0800832E:
	b _08008444
	.align 2, 0
_08008330: .4byte IWRAM_START + 0x50
_08008334: .4byte IWRAM_START + 0x2C
_08008338:
	ldr r6, [sp, #0xc]
	mov r0, sl
	muls r0, r6, r0
	mov r2, sb
	lsls r1, r2, #2
	lsls r0, r0, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r1]
	adds r2, #1
	str r2, [sp, #0x3c]
	cmp r0, #0
	beq _08008426
	subs r0, #8
	adds r5, r3, r0
	b _0800841E
_0800835A:
	cmp r1, #0xfe
	beq _0800841C
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r6, sb
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r7, r1, r0
	mov r2, r8
	subs r2, #8
	ldr r3, [sp, #0x28]
	movs r6, #0
	ldrsh r0, [r3, r6]
	ldr r1, [sp, #0x2c]
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08008396
	mov r0, r8
	adds r0, #8
	cmp r0, r1
	bge _080083A4
	cmp r2, r1
	blt _0800841C
_08008396:
	ldr r6, [sp, #0x48]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800841C
_080083A4:
	adds r2, r7, #0
	subs r2, #0x10
	ldr r1, [sp, #0x38]
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080083C4
	cmp r7, r1
	bge _080083D2
	cmp r2, r1
	blt _0800841C
_080083C4:
	ldr r6, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800841C
_080083D2:
	ldrb r1, [r4, #0xa]
	ldr r3, _080084F8 @ =gUnknown_080D672C
	ldr r2, _080084FC @ =gUnknown_03005500
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0xe4
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _0800840A
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800841C
_0800840A:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800AEA0
	movs r0, #0xfe
	strb r0, [r5]
_0800841C:
	adds r5, #2
_0800841E:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _0800835A
_08008426:
	ldr r2, [sp, #0x3c]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r3, [sp, #0x28]
	movs r6, #0
	ldrsh r1, [r3, r6]
	ldr r2, [sp, #0x48]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp sb, r0
	bgt _0800844C
_08008444:
	ldr r3, [sp, #0xc]
	cmp sb, r3
	bhs _0800844C
	b _08008338
_0800844C:
	ldr r6, [sp, #0x40]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp, #0x38]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _08008472
	ldr r6, [sp, #0x10]
	cmp sl, r6
	bhs _08008472
	b _080082F4
_08008472:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0800847E
	b _08008238
_0800847E:
	ldr r2, _08008500 @ =gUnknown_03005960
	ldr r3, [r2, #4]
	lsls r0, r3, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _08008504 @ =gUnknown_030059E0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08008498
	b _080086B4
_08008498:
	ldr r0, _08008508 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _080084A2
	b _080086B4
_080084A2:
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r3, #0
	adds r0, #0xa0
	cmp r1, r0
	blt _080084B0
	b _0800884A
_080084B0:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	blo _080084B8
	b _0800884A
_080084B8:
	ldr r4, _08008500 @ =gUnknown_03005960
	ldr r0, [r4]
	lsls r1, r0, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r1, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _080084CC
	b _0800867A
_080084CC:
	ldr r6, [sp, #0xc]
	mov r2, sl
	muls r2, r6, r2
	mov r0, sb
	lsls r1, r0, #2
	lsls r0, r2, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r1, r1, r0
	ldr r0, [r1]
	str r2, [sp, #0x44]
	cmp sb, r6
	blo _080084E8
	b _0800867A
_080084E8:
	cmp r0, #0
	bne _080084EE
	b _0800864C
_080084EE:
	subs r0, #8
	ldr r4, [sp, #0x14]
	adds r5, r4, r0
	b _08008642
	.align 2, 0
_080084F8: .4byte gUnknown_080D672C
_080084FC: .4byte gUnknown_03005500
_08008500: .4byte gUnknown_03005960
_08008504: .4byte gUnknown_030059E0
_08008508: .4byte gUnknown_030054CC
_0800850C:
	cmp r1, #0xfe
	beq _08008582
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r6, sb
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r7, r1, r0
	ldr r3, _08008588 @ =gUnknown_03005960
	ldr r0, [r3]
	mov r4, r8
	subs r0, r4, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08008582
	ldr r0, [r3, #4]
	subs r0, r7, r0
	cmp r0, #0
	blt _08008582
	subs r0, #0x10
	cmp r0, #0xa0
	bgt _08008582
	mov r1, r8
	subs r1, #0x40
	ldr r3, _0800858C @ =gUnknown_030059E0
	ldr r0, [r3, #8]
	asrs r2, r0, #8
	cmp r1, r2
	bgt _08008590
	mov r0, r8
	adds r0, #0x40
	cmp r0, r2
	blt _08008590
	adds r1, r7, #0
	subs r1, #0x48
	ldr r0, [r3, #0xc]
	asrs r2, r0, #8
	cmp r1, r2
	bgt _08008590
	adds r0, r7, #0
	adds r0, #0x38
	cmp r0, r2
	blt _08008590
	mov r6, r8
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_800BAAC
	movs r0, #0xfe
	strb r0, [r5]
_08008582:
	adds r5, #2
	b _08008642
	.align 2, 0
_08008588: .4byte gUnknown_03005960
_0800858C: .4byte gUnknown_030059E0
_08008590:
	adds r5, #2
	ldr r2, [sp, #0x18]
	adds r2, #0x23
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _080085A2
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080085C4
_080085A2:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _080085C0 @ =gUnknown_03005960
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x18]
	bl sub_80051E8
	b _08008638
	.align 2, 0
_080085C0: .4byte gUnknown_03005960
_080085C4:
	ldrb r1, [r2]
	lsls r1, r1, #3
	ldr r0, _0800869C @ =gUnknown_030022D0
	adds r6, r1, r0
	ldr r4, [sp, #0x18]
	ldrh r0, [r4, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r4, r0, #0
	ldr r0, _080086A0 @ =gUnknown_03005BB4
	ldr r0, [r0]
	cmp r0, r4
	bne _080085EA
	b _0800884A
_080085EA:
	ldr r1, _080086A4 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _080086A8 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _080086AC @ =gUnknown_03005960
	ldr r0, [r6, #4]
	subs r0, r7, r0
	ldr r6, [sp, #0x20]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _080086AC @ =gUnknown_03005960
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _080086B0 @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_08008638:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_08008642:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800864C
	b _0800850C
_0800864C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r0, #8
	ldr r2, _080086AC @ =gUnknown_03005960
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _0800867A
	mov r3, sb
	lsls r1, r3, #2
	ldr r4, [sp, #0x44]
	lsls r0, r4, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [sp, #0xc]
	cmp sb, r1
	bhs _0800867A
	b _080084E8
_0800867A:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r2, _080086AC @ =gUnknown_03005960
	ldr r0, [r2, #4]
	adds r0, #0xa0
	cmp r1, r0
	blt _08008692
	b _0800884A
_08008692:
	ldr r3, [sp, #0x10]
	cmp sl, r3
	bhs _0800869A
	b _080084B8
_0800869A:
	b _0800884A
	.align 2, 0
_0800869C: .4byte gUnknown_030022D0
_080086A0: .4byte gUnknown_03005BB4
_080086A4: .4byte 0x040000D4
_080086A8: .4byte 0x80000003
_080086AC: .4byte gUnknown_03005960
_080086B0: .4byte 0x000001FF
_080086B4:
	mov r4, sl
	lsls r1, r4, #8
	ldr r6, _08008708 @ =gUnknown_03005960
	ldr r0, [r6, #4]
	adds r0, #0xa0
	cmp r1, r0
	blt _080086C4
	b _0800884A
_080086C4:
	ldr r0, [sp, #0x10]
	cmp sl, r0
	blo _080086CC
	b _0800884A
_080086CC:
	ldr r1, _08008708 @ =gUnknown_03005960
	ldr r0, [r1]
	lsls r1, r0, #8
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r1, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _080086E0
	b _0800882C
_080086E0:
	ldr r2, [sp, #0xc]
	cmp sb, r2
	blo _080086E8
	b _0800882C
_080086E8:
	ldr r3, [sp, #0xc]
	mov r0, sl
	muls r0, r3, r0
	mov r4, sb
	lsls r1, r4, #2
	lsls r0, r0, #2
	ldr r6, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08008702
	b _0800880E
_08008702:
	subs r0, #8
	adds r5, r6, r0
	b _08008804
	.align 2, 0
_08008708: .4byte gUnknown_03005960
_0800870C:
	cmp r1, #0xfe
	beq _08008746
	ldrb r1, [r5]
	lsls r1, r1, #3
	mov r2, sb
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r7, r1, r0
	ldr r4, _0800874C @ =gUnknown_03005960
	ldr r0, [r4]
	mov r6, r8
	subs r0, r6, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08008746
	ldr r0, [r4, #4]
	subs r0, r7, r0
	cmp r0, #0
	blt _08008746
	subs r0, #0x10
	cmp r0, #0xa0
	ble _08008750
_08008746:
	adds r5, #2
	b _08008804
	.align 2, 0
_0800874C: .4byte gUnknown_03005960
_08008750:
	adds r5, #2
	ldr r2, [sp, #0x18]
	adds r2, #0x23
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _08008764
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08008788
_08008764:
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _08008784 @ =gUnknown_03005960
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r3, [sp, #0x18]
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r7, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x18]
	bl sub_80051E8
	b _080087FA
	.align 2, 0
_08008784: .4byte gUnknown_03005960
_08008788:
	ldrb r1, [r1]
	lsls r1, r1, #3
	ldr r0, _0800885C @ =gUnknown_030022D0
	adds r6, r1, r0
	ldr r4, [sp, #0x18]
	ldrh r0, [r4, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r4, r0, #0
	ldr r0, _08008860 @ =gUnknown_03005BB4
	ldr r0, [r0]
	cmp r0, r4
	beq _0800884A
	ldr r1, _08008864 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _08008868 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _0800886C @ =gUnknown_03005960
	ldr r0, [r6, #4]
	subs r0, r7, r0
	ldr r6, [sp, #0x20]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _0800886C @ =gUnknown_03005960
	ldr r0, [r1]
	mov r2, r8
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _08008870 @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_080087FA:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
_08008804:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800880E
	b _0800870C
_0800880E:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r0, #8
	ldr r2, _0800886C @ =gUnknown_03005960
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _0800882C
	ldr r3, [sp, #0xc]
	cmp sb, r3
	bhs _0800882C
	b _080086E8
_0800882C:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r4, _0800886C @ =gUnknown_03005960
	ldr r0, [r4, #4]
	adds r0, #0xa0
	cmp r1, r0
	bge _0800884A
	ldr r6, [sp, #0x10]
	cmp sl, r6
	bhs _0800884A
	b _080086CC
_0800884A:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800885C: .4byte gUnknown_030022D0
_08008860: .4byte gUnknown_03005BB4
_08008864: .4byte 0x040000D4
_08008868: .4byte 0x80000003
_0800886C: .4byte gUnknown_03005960
_08008870: .4byte 0x000001FF

	thumb_func_start sub_8008874
sub_8008874: @ 0x08008874
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08008888 @ =IWRAM_START + 0x30
	adds r0, r0, r1
	ldr r0, [r0]
	bl EwramFree
	pop {r0}
	bx r0
	.align 2, 0
_08008888: .4byte IWRAM_START + 0x30

	thumb_func_start sub_800888C
sub_800888C: @ 0x0800888C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080088A8 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _080088B4
	ldr r0, _080088AC @ =sub_8008DCC
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _080088B0 @ =sub_80095FC
	b _080088BC
	.align 2, 0
_080088A8: .4byte gUnknown_030054CC
_080088AC: .4byte sub_8008DCC
_080088B0: .4byte sub_80095FC
_080088B4:
	ldr r0, _08008970 @ =sub_8008DCC
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
_080088BC:
	str r1, [sp]
	movs r1, #0x1c
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	mov r0, r8
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _08008974 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _0800898C
	ldr r5, _08008978 @ =gSpritePosData_Interactables
	ldr r4, _0800897C @ =gUnknown_030055B4
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7]
	ldr r5, _08008980 @ =gSpritePosData_Itemboxes
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7, #4]
	ldr r5, _08008984 @ =gSpritePosData_Enemies
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	lsrs r0, r0, #8
	bl EwramMalloc
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7, #8]
	movs r0, #0
	str r0, [r7, #0x18]
	ldr r1, _08008988 @ =gUnknown_080D50A0
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0800899A
	bl _call_via_r0
	str r0, [r7, #0x18]
	b _0800899A
	.align 2, 0
_08008970: .4byte sub_8008DCC
_08008974: .4byte gUnknown_030054CC
_08008978: .4byte gSpritePosData_Interactables
_0800897C: .4byte gUnknown_030055B4
_08008980: .4byte gSpritePosData_Itemboxes
_08008984: .4byte gSpritePosData_Enemies
_08008988: .4byte gUnknown_080D50A0
_0800898C:
	ldr r6, _080089BC @ =gUnknown_0203F000
	ldr r0, _080089C0 @ =gUnknown_0203300C
	ldr r0, [r0]
	adds r1, r6, #0
	bl RLUnCompWram
	str r6, [r7]
_0800899A:
	ldr r1, _080089C4 @ =gUnknown_03005960
	ldr r0, [r1]
	str r0, [r7, #0xc]
	ldr r0, [r1, #4]
	str r0, [r7, #0x10]
	movs r0, #1
	strb r0, [r7, #0x14]
	ldr r0, _080089C8 @ =gUnknown_030054DC
	mov r1, r8
	str r1, [r0]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080089BC: .4byte gUnknown_0203F000
_080089C0: .4byte gUnknown_0203300C
_080089C4: .4byte gUnknown_03005960
_080089C8: .4byte gUnknown_030054DC

	thumb_func_start sub_80089CC
sub_80089CC: @ 0x080089CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r0, _08008CBC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080089EA
	b _08008DAC
_080089EA:
	ldr r0, _08008CC0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	ldr r0, [r1]
	str r0, [sp, #0x1c]
	ldr r0, _08008CC4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _08008A10
	ldr r0, [r1, #8]
	adds r0, #0xc
	str r0, [sp, #0x24]
	ldr r0, [r1, #4]
	adds r0, #0xc
	str r0, [sp, #0x20]
_08008A10:
	ldr r1, [sp, #0x1c]
	adds r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, _08008CC8 @ =gUnknown_03005960
	ldr r0, [r1]
	adds r2, r0, #0
	subs r2, #0x80
	str r2, [sp]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [sp, #8]
	ldr r1, [r1, #4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r1, r5
	str r0, [sp, #0xc]
	cmp r2, #0
	bge _08008A4E
	str r3, [sp]
_08008A4E:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08008A56
	str r3, [sp, #4]
_08008A56:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08008A5E
	str r3, [sp, #8]
_08008A5E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _08008A66
	str r3, [sp, #0xc]
_08008A66:
	ldr r0, [sp, #0x10]
	lsls r2, r0, #8
	ldr r0, [sp]
	cmp r0, r2
	blo _08008A74
	subs r0, r2, #1
	str r0, [sp]
_08008A74:
	ldr r3, [sp, #0x14]
	lsls r1, r3, #8
	ldr r0, [sp, #4]
	cmp r0, r1
	blo _08008A82
	subs r0, r1, #1
	str r0, [sp, #4]
_08008A82:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _08008A8C
	subs r0, r2, #1
	str r0, [sp, #8]
_08008A8C:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _08008A96
	subs r0, r1, #1
	str r0, [sp, #0xc]
_08008A96:
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	mov r8, r0
	lsls r0, r0, #8
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blo _08008AA6
	b _08008D94
_08008AA6:
	ldr r4, [sp, #0x14]
	cmp r8, r4
	blo _08008AAE
	b _08008D94
_08008AAE:
	ldr r0, [sp]
	asrs r7, r0, #8
	lsls r0, r7, #8
	ldr r2, [sp, #8]
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x34]
	cmp r0, r2
	blo _08008AC2
	b _08008D82
_08008AC2:
	ldr r0, [sp, #0x10]
	cmp r7, r0
	blo _08008ACA
	b _08008D82
_08008ACA:
	adds r1, r0, #0
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	str r0, [sp, #0x28]
_08008AD8:
	ldr r0, _08008CC4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _08008AE2
	b _08008CD4
_08008AE2:
	lsls r1, r7, #2
	ldr r5, [sp, #0x28]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r4, [sp, #0x10]
	mov r0, r8
	muls r0, r4, r0
	str r0, [sp, #0x2c]
	str r1, [sp, #0x38]
	adds r5, r7, #1
	str r5, [sp, #0x30]
	cmp r6, #0
	beq _08008B88
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08008B88
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008B1E:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008B72
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008B72
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008B72
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008B72
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008B72
	ldr r1, _08008CCC @ =gUnknown_080D4E1C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008B72:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008B1E
_08008B88:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #2
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	ldr r4, [sp, #0x38]
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r6, #0
	beq _08008C1A
	adds r0, r6, #0
	subs r0, #8
	adds r4, r1, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _08008C1A
	movs r0, #2
	rsbs r0, r0, #0
	mov sl, r0
	lsls r2, r7, #0x10
	mov sb, r2
	mov r3, r8
	lsls r3, r3, #0x10
	str r3, [sp, #0x3c]
_08008BC0:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sl
	blt _08008C04
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r5, r8
	lsls r0, r5, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008C04
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008C04
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008C04
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008C04
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	mov r2, sb
	lsrs r1, r2, #0x10
	ldr r5, [sp, #0x3c]
	lsrs r2, r5, #0x10
	bl sub_800B03C
_08008C04:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	bne _08008BC0
_08008C1A:
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #2
	ldr r4, [sp, #0x24]
	adds r0, r0, r4
	ldr r5, [sp, #0x38]
	adds r0, r5, r0
	ldr r6, [r0]
	cmp r6, #0
	bne _08008C2E
	b _08008D70
_08008C2E:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008C46
	b _08008D70
_08008C46:
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008C50:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008CA4
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008CA4
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008CA4
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008CA4
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008CA4
	ldr r1, _08008CD0 @ =gUnknown_080D4FC4
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008CA4:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008C50
	b _08008D70
	.align 2, 0
_08008CBC: .4byte gUnknown_03005424
_08008CC0: .4byte gCurTask
_08008CC4: .4byte gUnknown_030054CC
_08008CC8: .4byte gUnknown_03005960
_08008CCC: .4byte gUnknown_080D4E1C
_08008CD0: .4byte gUnknown_080D4FC4
_08008CD4:
	lsls r0, r7, #2
	ldr r5, [sp, #0x28]
	adds r0, r0, r5
	ldr r6, [r0]
	adds r0, r7, #1
	str r0, [sp, #0x30]
	cmp r6, #0
	beq _08008D70
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08008D70
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008D06:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008D5A
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008D5A
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008D5A
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008D5A
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008D5A
	ldr r1, _08008DBC @ =gUnknown_080D502C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008D5A:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008D06
_08008D70:
	ldr r7, [sp, #0x30]
	adds r5, r7, #0
	lsls r0, r5, #8
	cmp r0, r2
	bhs _08008D82
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bhs _08008D82
	b _08008AD8
_08008D82:
	ldr r1, [sp, #0x34]
	mov r8, r1
	lsls r0, r1, #8
	cmp r0, r3
	bhs _08008D94
	ldr r2, [sp, #0x14]
	cmp r1, r2
	bhs _08008D94
	b _08008AAE
_08008D94:
	ldr r1, _08008DC0 @ =gUnknown_03005960
	ldr r0, [r1]
	ldr r3, [sp, #0x18]
	str r0, [r3, #0xc]
	ldr r0, [r1, #4]
	str r0, [r3, #0x10]
	movs r0, #0
	strb r0, [r3, #0x14]
	ldr r0, _08008DC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08008DC8 @ =sub_8008DCC
	str r0, [r1, #8]
_08008DAC:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008DBC: .4byte gUnknown_080D502C
_08008DC0: .4byte gUnknown_03005960
_08008DC4: .4byte gCurTask
_08008DC8: .4byte sub_8008DCC

	thumb_func_start sub_8008DCC
sub_8008DCC: @ 0x08008DCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _08008E14 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08008DE6
	b _08009518
_08008DE6:
	ldr r0, _08008E18 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x28]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _08008E9E
	ldr r1, _08008E1C @ =gUnknown_03005960
	ldr r3, [r1]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #0xc]
	subs r2, r3, r0
	adds r4, r1, #0
	adds r1, r0, #0
	cmp r2, #0
	blt _08008E20
	cmp r2, #0xf8
	bgt _08008E9E
	b _08008E26
	.align 2, 0
_08008E14: .4byte gUnknown_03005424
_08008E18: .4byte gCurTask
_08008E1C: .4byte gUnknown_03005960
_08008E20:
	subs r0, r1, r3
	cmp r0, #0xf8
	bgt _08008E9E
_08008E26:
	ldr r3, [r4, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	subs r2, r3, r0
	cmp r2, #0
	blt _08008E38
	cmp r2, #0xd0
	bgt _08008E9E
	b _08008E3E
_08008E38:
	subs r0, r0, r3
	cmp r0, #0xd0
	bgt _08008E9E
_08008E3E:
	ldr r0, [sp, #0x28]
	ldr r0, [r0]
	str r0, [sp, #0x2c]
	ldr r0, _08008E84 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _08008E5A
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #8]
	adds r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r2, #4]
	adds r0, #0xc
	str r0, [sp, #0x30]
_08008E5A:
	ldr r3, [sp, #0x2c]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldm r3!, {r0}
	str r3, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	ldr r2, [r4]
	cmp r2, r1
	ble _08008E88
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [sp]
	adds r0, r2, r0
	b _08008E94
	.align 2, 0
_08008E84: .4byte gUnknown_030054CC
_08008E88:
	adds r0, r2, #0
	subs r0, #0x80
	str r0, [sp]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0xc]
	subs r0, #0x80
_08008E94:
	str r0, [sp, #8]
	ldr r1, [sp, #0x28]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	beq _08008EA4
_08008E9E:
	bl sub_80089CC
	b _08009518
_08008EA4:
	ldr r0, [r4, #4]
	adds r3, r0, #0
	subs r3, #0x80
	str r3, [sp, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r2, r0, r5
	str r2, [sp, #0xc]
	ldr r5, [sp, #0x28]
	ldr r1, [r5, #0x10]
	cmp r0, r1
	ble _08008ECA
	add r0, sp, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r0, #4]
	str r2, [r0, #0xc]
	b _08008ED6
_08008ECA:
	add r1, sp, #0x10
	str r3, [r1, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	subs r0, #0x80
	str r0, [r1, #0xc]
_08008ED6:
	add r3, sp, #0x10
	ldr r1, [r4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #0x10]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	str r0, [sp, #0x18]
	ldr r0, [sp]
	cmp r0, #0
	bge _08008EF2
	movs r0, #0
	str r0, [sp]
_08008EF2:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08008EFC
	movs r0, #0
	str r0, [sp, #4]
_08008EFC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08008F06
	movs r0, #0
	str r0, [sp, #8]
_08008F06:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _08008F10
	movs r0, #0
	str r0, [sp, #0xc]
_08008F10:
	ldr r0, [sp]
	ldr r5, [sp, #0x20]
	lsls r2, r5, #8
	cmp r0, r2
	blo _08008F1E
	subs r0, r2, #1
	str r0, [sp]
_08008F1E:
	ldr r0, [sp, #4]
	ldr r5, [sp, #0x24]
	lsls r1, r5, #8
	cmp r0, r1
	blo _08008F2C
	subs r0, r1, #1
	str r0, [sp, #4]
_08008F2C:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _08008F36
	subs r0, r2, #1
	str r0, [sp, #8]
_08008F36:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _08008F40
	subs r0, r1, #1
	str r0, [sp, #0xc]
_08008F40:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _08008F4A
	movs r0, #0
	str r0, [sp, #0x10]
_08008F4A:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _08008F54
	movs r0, #0
	str r0, [sp, #0x14]
_08008F54:
	ldr r0, [r3, #8]
	cmp r0, #0
	bge _08008F5E
	movs r0, #0
	str r0, [r3, #8]
_08008F5E:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bge _08008F68
	movs r0, #0
	str r0, [r3, #0xc]
_08008F68:
	ldr r0, [sp, #0x10]
	cmp r0, r2
	blo _08008F72
	subs r0, r2, #1
	str r0, [sp, #0x10]
_08008F72:
	ldr r0, [r3, #4]
	cmp r0, r1
	blo _08008F7C
	subs r0, r1, #1
	str r0, [r3, #4]
_08008F7C:
	ldr r0, [r3, #8]
	cmp r0, r2
	blo _08008F86
	subs r0, r2, #1
	str r0, [r3, #8]
_08008F86:
	ldr r0, [r3, #0xc]
	cmp r0, r1
	blo _08008F90
	subs r0, r1, #1
	str r0, [r3, #0xc]
_08008F90:
	ldr r1, [r4]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	bne _08008F9C
	b _08009248
_08008F9C:
	ldr r0, [sp]
	ldr r2, [sp, #8]
	cmp r0, r2
	bne _08008FA6
	b _08009248
_08008FA6:
	ldr r0, [sp, #4]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	bne _08008FB0
	b _08009248
_08008FB0:
	lsls r0, r0, #8
	b _08009236
_08008FB4:
	ldr r0, [sp]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x44]
	cmp r0, r2
	blt _08008FC8
	b _08009232
_08008FC8:
	ldr r0, [sp, #0x20]
	cmp r7, r0
	blo _08008FD0
	b _08009232
_08008FD0:
	adds r1, r0, #0
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x2c]
	adds r0, r0, r4
	str r0, [sp, #0x38]
_08008FDE:
	ldr r0, _08009014 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _08008FE8
	b _08009190
_08008FE8:
	lsls r1, r7, #2
	ldr r5, [sp, #0x38]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r4, [sp, #0x20]
	mov r0, r8
	muls r0, r4, r0
	mov sb, r0
	mov sl, r1
	adds r5, r7, #1
	str r5, [sp, #0x40]
	cmp r6, #0
	beq _0800907C
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b _08009074
	.align 2, 0
_08009014: .4byte gUnknown_030054CC
_08009018:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _08009066
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009066
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009066
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009066
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009066
	ldr r1, _0800909C @ =gUnknown_080D4E1C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009066:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_08009074:
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08009018
_0800907C:
	mov r5, sb
	lsls r0, r5, #2
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	beq _080090FA
	adds r0, r6, #0
	subs r0, #8
	adds r4, r1, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	b _080090F2
	.align 2, 0
_0800909C: .4byte gUnknown_080D4E1C
_080090A0:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _080090E4
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _080090E4
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _080090E4
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080090E4
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _080090E4
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl sub_800B03C
_080090E4:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_080090F2:
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	bne _080090A0
_080090FA:
	mov r1, sb
	lsls r0, r1, #2
	ldr r4, [sp, #0x34]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	bne _0800910C
	b _0800921E
_0800910C:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08009124
	b _0800921E
_08009124:
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
_0800912A:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009174
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009174
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009174
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009174
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009174
	ldr r1, _0800918C @ =gUnknown_080D4FC4
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009174:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _0800912A
	b _0800921E
	.align 2, 0
_0800918C: .4byte gUnknown_080D4FC4
_08009190:
	lsls r0, r7, #2
	ldr r5, [sp, #0x38]
	adds r0, r0, r5
	ldr r6, [r0]
	adds r0, r7, #1
	str r0, [sp, #0x40]
	cmp r6, #0
	beq _0800921E
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _0800921E
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
_080091BE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009208
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009208
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009208
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009208
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009208
	ldr r1, _0800927C @ =gUnknown_080D502C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009208:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _080091BE
_0800921E:
	ldr r5, [sp, #0x40]
	lsls r0, r5, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	cmp r0, r2
	bge _08009232
	ldr r0, [sp, #0x20]
	cmp r7, r0
	bhs _08009232
	b _08008FDE
_08009232:
	ldr r1, [sp, #0x44]
	lsls r0, r1, #0x10
_08009236:
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	bge _08009248
	ldr r4, [sp, #0x24]
	cmp r8, r4
	bhs _08009248
	b _08008FB4
_08009248:
	ldr r0, _08009280 @ =gUnknown_03005960
	ldr r1, [r0, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bne _08009256
	b _0800950C
_08009256:
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bne _08009260
	b _0800950C
_08009260:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bne _0800926A
	b _0800950C
_0800926A:
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	blt _08009278
	b _0800950C
_08009278:
	b _08009504
	.align 2, 0
_0800927C: .4byte gUnknown_080D502C
_08009280: .4byte gUnknown_03005960
_08009284:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x44]
	cmp r1, r0
	blt _0800929A
	b _080094F4
_0800929A:
	ldr r3, [sp, #0x20]
	cmp r7, r3
	blo _080092A2
	b _080094F4
_080092A2:
	mov r0, r8
	muls r0, r3, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x2c]
	adds r0, r0, r4
	str r0, [sp, #0x3c]
_080092AE:
	ldr r0, _080092E0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _080092B8
	b _08009454
_080092B8:
	lsls r1, r7, #2
	ldr r5, [sp, #0x3c]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r2, [sp, #0x20]
	mov r0, r8
	muls r0, r2, r0
	mov sb, r0
	mov sl, r1
	adds r3, r7, #1
	str r3, [sp, #0x40]
	cmp r6, #0
	beq _08009344
	adds r0, r6, #0
	subs r0, #8
	ldr r4, [sp, #0x2c]
	adds r5, r4, r0
	movs r6, #0
	b _08009336
	.align 2, 0
_080092E0: .4byte gUnknown_030054CC
_080092E4:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08009332
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08009332
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _08009332
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _08009332
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _08009332
	ldr r1, _0800944C @ =gUnknown_080D4E1C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009332:
	adds r5, #7
	adds r6, #1
_08009336:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080092E4
_08009344:
	mov r3, sb
	lsls r0, r3, #2
	ldr r4, [sp, #0x30]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	beq _080093BE
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _080093BE
	subs r5, #1
_0800936C:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	blt _080093AC
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _080093AC
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _080093AC
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _080093AC
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _080093AC
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl sub_800B03C
_080093AC:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _0800936C
_080093BE:
	mov r3, sb
	lsls r0, r3, #2
	ldr r4, [sp, #0x34]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	bne _080093D0
	b _080094DE
_080093D0:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080093E8
	b _080094DE
_080093E8:
	movs r3, #2
	rsbs r3, r3, #0
	mov sb, r3
_080093EE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009438
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08009438
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _08009438
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _08009438
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _08009438
	ldr r1, _08009450 @ =gUnknown_080D4FC4
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009438:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080093EE
	b _080094DE
	.align 2, 0
_0800944C: .4byte gUnknown_080D4E1C
_08009450: .4byte gUnknown_080D4FC4
_08009454:
	lsls r0, r7, #2
	ldr r3, [sp, #0x3c]
	adds r0, r0, r3
	ldr r6, [r0]
	adds r4, r7, #1
	str r4, [sp, #0x40]
	cmp r6, #0
	beq _080094DE
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _080094DE
	movs r3, #2
	rsbs r3, r3, #0
	mov sb, r3
_08009482:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _080094CC
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _080094CC
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _080094CC
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _080094CC
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _080094CC
	ldr r1, _08009528 @ =gUnknown_080D502C
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_080094CC:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _08009482
_080094DE:
	ldr r3, [sp, #0x40]
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bge _080094F4
	ldr r4, [sp, #0x20]
	cmp r7, r4
	bhs _080094F4
	b _080092AE
_080094F4:
	ldr r5, [sp, #0x44]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r0, #8
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bge _0800950C
_08009504:
	ldr r0, [sp, #0x24]
	cmp r8, r0
	bhs _0800950C
	b _08009284
_0800950C:
	ldr r0, _0800952C @ =gUnknown_03005960
	ldr r1, [r0]
	ldr r2, [sp, #0x28]
	str r1, [r2, #0xc]
	ldr r0, [r0, #4]
	str r0, [r2, #0x10]
_08009518:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009528: .4byte gUnknown_080D502C
_0800952C: .4byte gUnknown_03005960

	thumb_func_start sub_8009530
sub_8009530: @ 0x08009530
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r0, #0x8a
	bl m4aSongNumStart
	ldr r2, _080095CC @ =gUnknown_03005450
	ldr r5, [r2]
	ldr r1, _080095D0 @ =gUnknown_080D5020
	ldr r0, _080095D4 @ =gUnknown_030059E0
	adds r0, #0x84
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	str r0, [r2]
	ldr r4, _080095D8 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0800959E
	ldr r0, _080095DC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800959E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _080095E0 @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08009596
	movs r0, #0xff
_08009596:
	strb r0, [r1]
	ldr r1, _080095E4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800959E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl sub_8009E00
	ldr r0, _080095D4 @ =gUnknown_030059E0
	adds r1, r0, #0
	adds r1, #0x84
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	bgt _080095C0
	adds r0, r2, #1
	strb r0, [r1]
_080095C0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080095CC: .4byte gUnknown_03005450
_080095D0: .4byte gUnknown_080D5020
_080095D4: .4byte gUnknown_030059E0
_080095D8: .4byte 0x0000C350
_080095DC: .4byte gUnknown_030054CC
_080095E0: .4byte gUnknown_03005448
_080095E4: .4byte gUnknown_030054A8

	thumb_func_start sub_80095E8
sub_80095E8: @ 0x080095E8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_80095FC
sub_80095FC: @ 0x080095FC
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4]
	bl EwramFree
	ldr r0, [r4, #4]
	bl EwramFree
	ldr r0, [r4, #8]
	bl EwramFree
	ldr r1, _08009624 @ =gUnknown_030054DC
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009624: .4byte gUnknown_030054DC

	thumb_func_start sub_8009628
sub_8009628: @ 0x08009628
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _080096A0 @ =sub_80096B4
	str r3, [sp]
	movs r1, #0x30
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	movs r1, #0
	mov r8, r1
	movs r3, #0
	strh r3, [r2, #0x16]
	strh r3, [r2, #0x18]
	str r3, [r2, #4]
	strh r3, [r2, #0x1a]
	strh r3, [r2, #8]
	strh r5, [r2, #0xa]
	ldr r5, _080096A4 @ =IWRAM_START + 0x20
	adds r1, r4, r5
	strb r6, [r1]
	strh r3, [r2, #0x14]
	strh r3, [r2, #0x1c]
	ldr r1, _080096A8 @ =IWRAM_START + 0x21
	adds r5, r4, r1
	movs r1, #0xff
	strb r1, [r5]
	ldr r1, _080096AC @ =IWRAM_START + 0x22
	adds r5, r4, r1
	movs r1, #0x10
	strb r1, [r5]
	ldr r5, _080096B0 @ =IWRAM_START + 0x25
	adds r4, r4, r5
	mov r1, r8
	strb r1, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r2, #0x28]
	str r3, [r2, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080096A0: .4byte sub_80096B4
_080096A4: .4byte IWRAM_START + 0x20
_080096A8: .4byte IWRAM_START + 0x21
_080096AC: .4byte IWRAM_START + 0x22
_080096B0: .4byte IWRAM_START + 0x25

	thumb_func_start sub_80096B4
sub_80096B4: @ 0x080096B4
	push {r4, lr}
	ldr r4, _080096D8 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_80036E0
	cmp r0, #0
	bne _080096D0
	ldr r0, [r4]
	bl TaskDestroy
_080096D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080096D8: .4byte gCurTask

	thumb_func_start sub_80096DC
sub_80096DC: @ 0x080096DC
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08009750 @ =sub_8009854
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldr r1, _08009754 @ =gUnknown_030054D4
	strb r4, [r1, #3]
	strb r4, [r1, #2]
	strb r4, [r1, #1]
	strb r4, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r5, _08009758 @ =gDispCnt
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r5]
	ldr r2, _0800975C @ =gBgCntRegs
	movs r3, #0
	ldr r0, _08009760 @ =0x00001F06
	strh r0, [r2]
	strh r4, [r1, #4]
	strb r3, [r1, #6]
	ldr r0, _08009764 @ =0x06004020
	str r0, [r1]
	ldr r0, _08009768 @ =gBldRegs
	strh r4, [r0, #4]
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _0800976C @ =gWinRegs
	ldr r2, _08009770 @ =0x0000F0F0
	strh r2, [r0]
	ldr r1, _08009774 @ =0x0000A0A0
	strh r1, [r0, #4]
	strh r2, [r0, #2]
	strh r1, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	ldrh r1, [r5]
	ldr r0, _08009778 @ =0x00001FFF
	ands r0, r1
	strh r0, [r5]
	ldr r0, _0800977C @ =gBgScrollRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009750: .4byte sub_8009854
_08009754: .4byte gUnknown_030054D4
_08009758: .4byte gDispCnt
_0800975C: .4byte gBgCntRegs
_08009760: .4byte 0x00001F06
_08009764: .4byte 0x06004020
_08009768: .4byte gBldRegs
_0800976C: .4byte gWinRegs
_08009770: .4byte 0x0000F0F0
_08009774: .4byte 0x0000A0A0
_08009778: .4byte 0x00001FFF
_0800977C: .4byte gBgScrollRegs

	thumb_func_start sub_8009780
sub_8009780: @ 0x08009780
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _080097C0 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _080097C4 @ =gPressedKeys
	ldrh r1, [r0]
	movs r4, #9
	ands r4, r1
	cmp r4, #0
	beq _080097D4
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _080097C8 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080097CC @ =gUnknown_03002280
	strb r0, [r1]
	strb r0, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r1, [r6]
	ldr r0, _080097D0 @ =sub_80098C0
	str r0, [r1, #8]
	b _08009848
	.align 2, 0
_080097C0: .4byte gCurTask
_080097C4: .4byte gPressedKeys
_080097C8: .4byte gUnknown_03004D80
_080097CC: .4byte gUnknown_03002280
_080097D0: .4byte sub_80098C0
_080097D4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08009804
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r0, [r6]
	bl TaskDestroy
	ldr r0, _080097FC @ =gUnknown_03004D80
	strb r4, [r0]
	ldr r1, _08009800 @ =gUnknown_03002280
	strb r4, [r1]
	strb r4, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	b _08009848
	.align 2, 0
_080097FC: .4byte gUnknown_03004D80
_08009800: .4byte gUnknown_03002280
_08009804:
	ldr r0, _08009818 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800981C
	ldrb r0, [r5, #6]
	subs r0, #1
	b _08009828
	.align 2, 0
_08009818: .4byte gRepeatedKeys
_0800981C:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800982A
	ldrb r0, [r5, #6]
	adds r0, #1
_08009828:
	strb r0, [r5, #6]
_0800982A:
	ldrb r1, [r5, #6]
	add r0, sp, #0xc
	bl sub_80044D8
	ldr r0, [r5]
	ldr r1, _08009850 @ =gUnknown_086E9E08
	movs r2, #0
	str r2, [sp]
	add r3, sp, #0xc
	str r3, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xc
	movs r3, #0xe
	bl sub_8004274
_08009848:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009850: .4byte gUnknown_086E9E08

	thumb_func_start sub_8009854
sub_8009854: @ 0x08009854
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _080098A4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r1, _080098A8 @ =gBgPalette
	movs r3, #0
	ldr r0, _080098AC @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _080098B0 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r4]
	ldr r1, _080098B4 @ =gUnknown_086E9E08
	str r3, [sp]
	ldr r2, _080098B8 @ =gUnknown_080D5128
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r2, #6
	movs r3, #0xe
	bl sub_8004274
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r1, [r5]
	ldr r0, _080098BC @ =sub_8009780
	str r0, [r1, #8]
	bl _call_via_r0
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080098A4: .4byte gCurTask
_080098A8: .4byte gBgPalette
_080098AC: .4byte 0x00007FFF
_080098B0: .4byte gFlags
_080098B4: .4byte gUnknown_086E9E08
_080098B8: .4byte gUnknown_080D5128
_080098BC: .4byte sub_8009780

	thumb_func_start sub_80098C0
sub_80098C0: @ 0x080098C0
	push {r4, r5, lr}
	ldr r0, _080098E4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	ldrb r4, [r1, #6]
	adds r5, r4, #0
	bl TaskDestroy
	cmp r4, #0
	bne _080098EC
	ldr r0, _080098E8 @ =gUnknown_030055B4
	strb r4, [r0]
	bl sub_801A770
	b _08009900
	.align 2, 0
_080098E4: .4byte gCurTask
_080098E8: .4byte gUnknown_030055B4
_080098EC:
	cmp r5, #0x22
	bhi _08009900
	ldr r1, _08009908 @ =gUnknown_03005B4C
	movs r0, #0
	str r0, [r1]
	ldr r1, _0800990C @ =gUnknown_030055B4
	subs r0, r5, #1
	strb r0, [r1]
	bl sub_801A770
_08009900:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009908: .4byte gUnknown_03005B4C
_0800990C: .4byte gUnknown_030055B4
_08009910:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start nullsub_8002A34_0
nullsub_8002A34_0: @ 0x08009914
	bx lr
	.align 2, 0

	thumb_func_start sub_8009918
sub_8009918: @ 0x08009918
	push {r4, lr}
	sub sp, #4
	ldr r0, _0800995C @ =sub_8009964
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08009960 @ =sub_8009DEC
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r2, r2, r1
	movs r4, #0
	movs r3, #0
	movs r1, #0x78
	strh r1, [r2, #6]
	movs r1, #0xc8
	strh r1, [r2, #8]
	strh r3, [r2]
	movs r1, #0x40
	strh r1, [r2, #2]
	movs r1, #0x80
	lsls r1, r1, #4
	strh r1, [r2, #4]
	strb r4, [r2, #0xa]
	movs r1, #0x20
	strb r1, [r2, #0xb]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800995C: .4byte sub_8009964
_08009960: .4byte sub_8009DEC

	thumb_func_start sub_8009964
sub_8009964: @ 0x08009964
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08009998 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08009984
	b _08009DD6
_08009984:
	ldrh r0, [r4]
	ldr r1, _0800999C @ =0x000001FF
	adds r2, r0, #0
	cmp r2, r1
	bhi _080099A0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	b _080099A6
	.align 2, 0
_08009998: .4byte gCurTask
_0800999C: .4byte 0x000001FF
_080099A0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
_080099A6:
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, r2, r0
	movs r2, #0
	mov r8, r2
	ldr r3, _08009A44 @ =0x000003FF
	ands r0, r3
	strh r0, [r4]
	ldrb r1, [r4, #0xb]
	adds r5, r0, r1
	ands r5, r3
	ldr r6, _08009A48 @ =gUnknown_08097AA4
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r1, r0, #0x10
	cmp r1, #0
	bne _080099D6
	b _08009DD6
_080099D6:
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	asrs r1, r1, #0x16
	str r3, [sp, #0x18]
	bl Div
	mov sl, r0
	add r2, sp, #0x10
	movs r1, #8
	ldrsh r0, [r4, r1]
	mov sb, r0
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #6]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r2
	ldr r3, [sp, #0x18]
	cmp r0, #0
	bgt _08009A86
	mov r0, r8
	strh r0, [r2]
	cmp r5, #0xff
	bls _08009A50
	ldr r2, _08009A4C @ =0xFFFFFD00
	adds r1, r5, r2
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r3, #6
	ldrsh r1, [r4, r3]
	b _08009ACC
	.align 2, 0
_08009A44: .4byte 0x000003FF
_08009A48: .4byte gUnknown_08097AA4
_08009A4C: .4byte 0xFFFFFD00
_08009A50:
	subs r1, r7, r5
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r3, sl
	strh r0, [r3, #2]
	b _08009AE4
_08009A86:
	cmp r0, #0xef
	ble _08009ADE
	movs r0, #0xf0
	mov r8, r0
	mov r2, r8
	mov r1, sl
	strh r2, [r1]
	cmp r5, #0xff
	bls _08009AA4
	ldr r0, _08009AA0 @ =0xFFFFFD00
	adds r1, r5, r0
	b _08009AA6
	.align 2, 0
_08009AA0: .4byte 0xFFFFFD00
_08009AA4:
	subs r1, r7, r5
_08009AA6:
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	mov r3, r8
	subs r1, r3, r1
_08009ACC:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r1, sl
	strh r0, [r1, #2]
	b _08009AE4
_08009ADE:
	mov r3, r8
	mov r2, sl
	strh r3, [r2, #2]
_08009AE4:
	add r1, sp, #8
	mov r2, sl
	ldrh r0, [r2]
	movs r3, #0
	mov sb, r3
	strb r0, [r1]
	ldrh r0, [r2, #2]
	strb r0, [r1, #1]
	ldr r6, _08009B90 @ =gUnknown_08097AA4
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r5, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	add r3, sp, #8
	ldrb r2, [r4, #6]
	movs r5, #8
	ldrsh r1, [r4, r5]
	subs r1, #0xa0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r2, r2, r0
	strb r2, [r3, #2]
	adds r1, r3, #0
	movs r0, #0xa0
	strb r0, [r1, #3]
	ldrb r1, [r4, #0xb]
	ldrh r0, [r4]
	subs r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	subs r5, r1, r0
	ldr r3, _08009B94 @ =0x000003FF
	adds r0, r3, #0
	ands r5, r0
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r5, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	add r2, sp, #0x14
	movs r3, #8
	ldrsh r1, [r4, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldrh r1, [r4, #6]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r2
	cmp r0, #0
	bgt _08009BD8
	mov r3, sb
	strh r3, [r2]
	cmp r5, #0xff
	bls _08009B9C
	ldr r0, _08009B98 @ =0xFFFFFD00
	adds r1, r5, r0
	b _08009B9E
	.align 2, 0
_08009B90: .4byte gUnknown_08097AA4
_08009B94: .4byte 0x000003FF
_08009B98: .4byte 0xFFFFFD00
_08009B9C:
	subs r1, r7, r5
_08009B9E:
	ldr r0, _08009BD4 @ =0x000003FF
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r3, r8
	strh r0, [r3, #2]
	b _08009C3A
	.align 2, 0
_08009BD4: .4byte 0x000003FF
_08009BD8:
	cmp r0, #0xef
	ble _08009C34
	movs r0, #0xf0
	mov sb, r0
	mov r2, sb
	mov r1, r8
	strh r2, [r1]
	cmp r5, #0xff
	bls _08009BF4
	ldr r3, _08009BF0 @ =0xFFFFFD00
	adds r1, r5, r3
	b _08009BF6
	.align 2, 0
_08009BF0: .4byte 0xFFFFFD00
_08009BF4:
	subs r1, r7, r5
_08009BF6:
	ldr r0, _08009C30 @ =0x000003FF
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	movs r2, #6
	ldrsh r1, [r4, r2]
	mov r3, sb
	subs r1, r3, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	b _08009C3A
	.align 2, 0
_08009C30: .4byte 0x000003FF
_08009C34:
	mov r3, sb
	mov r2, r8
	strh r3, [r2, #2]
_08009C3A:
	add r1, sp, #8
	mov r6, r8
	ldrh r0, [r6]
	strb r0, [r1, #4]
	ldrh r0, [r6, #2]
	strb r0, [r1, #5]
	ldr r2, _08009CC0 @ =gUnknown_08097AA4
	lsls r0, r5, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r5, r3
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	add r2, sp, #8
	movs r5, #8
	ldrsh r1, [r4, r5]
	subs r1, #0xa0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldrb r1, [r4, #6]
	adds r0, r0, r1
	strb r0, [r2, #6]
	adds r1, r2, #0
	movs r0, #0xa0
	strb r0, [r1, #7]
	ldrh r1, [r4]
	ldr r0, _08009CC4 @ =0x000001FF
	cmp r1, r0
	bhi _08009D38
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08009C98
	b _08009DD6
_08009C98:
	mov r2, sl
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08009CFC
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009CCC
	ldr r2, _08009CC8 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009CDA
	.align 2, 0
_08009CC0: .4byte gUnknown_08097AA4
_08009CC4: .4byte 0x000001FF
_08009CC8: .4byte gWinRegs
_08009CCC:
	ldr r2, _08009CF8 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009CDA:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	ldrb r1, [r1, #4]
	add r2, sp, #8
	ldrb r2, [r2, #5]
	add r3, sp, #8
	ldrb r3, [r3, #6]
	add r4, sp, #8
	ldrb r4, [r4, #7]
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl sub_8006228
	b _08009DD6
	.align 2, 0
_08009CF8: .4byte gWinRegs
_08009CFC:
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009D1C
	ldr r2, _08009D18 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009D2A
	.align 2, 0
_08009D18: .4byte gWinRegs
_08009D1C:
	ldr r2, _08009D34 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009D2A:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	bl sub_800724C
	b _08009DD6
	.align 2, 0
_08009D34: .4byte gWinRegs
_08009D38:
	mov r3, sl
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	bgt _08009DD6
	mov r5, r8
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08009DA0
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009D70
	ldr r2, _08009D6C @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009D7E
	.align 2, 0
_08009D6C: .4byte gWinRegs
_08009D70:
	ldr r2, _08009D9C @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009D7E:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	ldrb r1, [r1]
	add r2, sp, #8
	ldrb r2, [r2, #1]
	add r3, sp, #8
	ldrb r3, [r3, #2]
	add r4, sp, #8
	ldrb r4, [r4, #3]
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	bl sub_80064A8
	b _08009DD6
	.align 2, 0
_08009D9C: .4byte gWinRegs
_08009DA0:
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08009DC0
	ldr r2, _08009DBC @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08009DCE
	.align 2, 0
_08009DBC: .4byte gWinRegs
_08009DC0:
	ldr r2, _08009DE8 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08009DCE:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	bl sub_800724C
_08009DD6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009DE8: .4byte gWinRegs

	thumb_func_start sub_8009DEC
sub_8009DEC: @ 0x08009DEC
	ldr r0, _08009DFC @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08009DFC: .4byte gFlags

	thumb_func_start sub_8009E00
sub_8009E00: @ 0x08009E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldr r0, _08009E98 @ =sub_8009EB0
	movs r2, #0x80
	lsls r2, r2, #6
	mov sl, r2
	ldr r1, _08009E9C @ =sub_8009F80
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r7, #0
	movs r6, #0
	strh r6, [r4, #0x30]
	mov r0, r8
	strh r0, [r4, #0x16]
	mov r1, sb
	strh r1, [r4, #0x18]
	movs r0, #2
	bl sub_8007C10
	str r0, [r4, #4]
	strh r6, [r4, #0x1a]
	strh r6, [r4, #8]
	movs r0, #0xb6
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _08009EA0 @ =gUnknown_030059E0
	adds r0, #0x84
	ldrb r1, [r0]
	ldr r2, _08009EA4 @ =IWRAM_START + 0x20
	adds r0, r5, r2
	strb r1, [r0]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	ldr r0, _08009EA8 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r2, #2
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08009EAC @ =IWRAM_START + 0x25
	adds r5, r5, r0
	strb r7, [r5]
	mov r1, sl
	str r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009E98: .4byte sub_8009EB0
_08009E9C: .4byte sub_8009F80
_08009EA0: .4byte gUnknown_030059E0
_08009EA4: .4byte IWRAM_START + 0x20
_08009EA8: .4byte IWRAM_START + 0x21
_08009EAC: .4byte IWRAM_START + 0x25

	thumb_func_start sub_8009EB0
sub_8009EB0: @ 0x08009EB0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08009F00 @ =gCurTask
	ldr r5, [r0]
	ldrh r1, [r5, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r6, [r4, #0x16]
	ldrh r7, [r4, #0x18]
	ldrh r2, [r4, #0x30]
	adds r2, #1
	strh r2, [r4, #0x30]
	ldr r3, _08009F04 @ =gUnknown_03005960
	ldr r1, [r3]
	ldrh r0, [r4, #0x16]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r3, #4]
	adds r1, r1, r2
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x3b
	ble _08009F0C
	ldr r0, _08009F08 @ =sub_8009F1C
	str r0, [r5, #8]
	adds r0, r4, #0
	bl sub_80051E8
	strh r6, [r4, #0x16]
	ldrh r1, [r4, #0x30]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	movs r0, #0
	strh r0, [r4, #0x30]
	b _08009F16
	.align 2, 0
_08009F00: .4byte gCurTask
_08009F04: .4byte gUnknown_03005960
_08009F08: .4byte sub_8009F1C
_08009F0C:
	adds r0, r4, #0
	bl sub_80051E8
	strh r6, [r4, #0x16]
	strh r7, [r4, #0x18]
_08009F16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8009F1C
sub_8009F1C: @ 0x08009F1C
	push {r4, r5, r6, lr}
	ldr r0, _08009F54 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r5, [r4, #0x16]
	ldrh r6, [r4, #0x18]
	ldr r2, _08009F58 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08009F5C
	adds r0, r3, #0
	bl TaskDestroy
	b _08009F7A
	.align 2, 0
_08009F54: .4byte gCurTask
_08009F58: .4byte gUnknown_03005960
_08009F5C:
	ldr r1, [r2]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r2, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
_08009F7A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_8009F80
sub_8009F80: @ 0x08009F80
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_8009F94
sub_8009F94: @ 0x08009F94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0800A0C8 @ =gBldRegs
	ldrb r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	str r0, [sp, #4]
	ldr r0, _0800A0CC @ =gLoadedSaveGame
	mov r8, r0
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	ldr r0, _0800A0D0 @ =sub_800A110
	ldr r1, _0800A0D4 @ =sub_800A350
	str r1, [sp]
	movs r1, #0x68
	movs r2, #1
	movs r3, #0
	bl TaskCreate
	ldrh r7, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	ldr r1, _0800A0D8 @ =IWRAM_START + 0x60
	adds r0, r7, r1
	movs r2, #0
	mov sb, r2
	movs r5, #0
	strh r5, [r0]
	adds r1, #2
	adds r0, r7, r1
	strh r5, [r0]
	ldr r2, _0800A0DC @ =IWRAM_START + 0x64
	adds r0, r7, r2
	mov r1, sb
	strb r1, [r0]
	mov r2, r8
	ldr r0, [r2]
	ldrb r1, [r0, #5]
	ldr r2, _0800A0E0 @ =IWRAM_START + 0x65
	adds r0, r7, r2
	strb r1, [r0]
	ldr r2, _0800A0E4 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	orrs r6, r7
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x71
	strh r0, [r6, #0x18]
	ldr r0, _0800A0E8 @ =gUnknown_080E0D64
	lsls r4, r4, #0x18
	asrs r4, r4, #0x15
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r6, #4]
	strh r5, [r6, #8]
	ldrh r0, [r4, #4]
	strh r0, [r6, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _0800A0EC @ =IWRAM_START + 0x20
	adds r0, r7, r2
	strb r1, [r0]
	strh r5, [r6, #0x14]
	ldr r0, _0800A0F0 @ =IWRAM_START + 0x21
	adds r1, r7, r0
	movs r2, #1
	rsbs r2, r2, #0
	adds r4, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r6, #0x1c]
	ldr r1, _0800A0F4 @ =IWRAM_START + 0x22
	adds r0, r7, r1
	movs r2, #0x10
	mov sl, r2
	mov r1, sl
	strb r1, [r0]
	ldr r2, _0800A0F8 @ =IWRAM_START + 0x25
	adds r0, r7, r2
	mov r1, sb
	strb r1, [r0]
	movs r2, #0x40
	mov r8, r2
	mov r0, r8
	strh r0, [r6, #0x1a]
	str r5, [r6, #0x10]
	ldr r1, [sp, #4]
	cmp r1, #0x40
	beq _0800A05A
	movs r0, #0x80
	str r0, [r6, #0x10]
_0800A05A:
	adds r0, r6, #0
	bl sub_8004558
	ldr r2, _0800A0FC @ =IWRAM_START + 0x30
	adds r6, r7, r2
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x50
	strh r0, [r6, #0x18]
	movs r0, #0x1c
	bl sub_8007C10
	str r0, [r6, #4]
	strh r5, [r6, #8]
	ldr r0, _0800A100 @ =0x00000414
	strh r0, [r6, #0xa]
	ldr r1, _0800A104 @ =IWRAM_START + 0x50
	adds r0, r7, r1
	mov r2, sb
	strb r2, [r0]
	strh r5, [r6, #0x14]
	ldr r0, _0800A108 @ =IWRAM_START + 0x51
	adds r1, r7, r0
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	strh r5, [r6, #0x1c]
	ldr r1, _0800A10C @ =IWRAM_START + 0x52
	adds r0, r7, r1
	mov r2, sl
	strb r2, [r0]
	adds r1, #3
	adds r0, r7, r1
	mov r2, sb
	strb r2, [r0]
	mov r0, r8
	strh r0, [r6, #0x1a]
	str r5, [r6, #0x10]
	ldr r1, [sp, #4]
	cmp r1, #0x40
	beq _0800A0B0
	movs r0, #0x80
	str r0, [r6, #0x10]
_0800A0B0:
	adds r0, r6, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A0C8: .4byte gBldRegs
_0800A0CC: .4byte gLoadedSaveGame
_0800A0D0: .4byte sub_800A110
_0800A0D4: .4byte sub_800A350
_0800A0D8: .4byte IWRAM_START + 0x60
_0800A0DC: .4byte IWRAM_START + 0x64
_0800A0E0: .4byte IWRAM_START + 0x65
_0800A0E4: .4byte gUnknown_03005424
_0800A0E8: .4byte gUnknown_080E0D64
_0800A0EC: .4byte IWRAM_START + 0x20
_0800A0F0: .4byte IWRAM_START + 0x21
_0800A0F4: .4byte IWRAM_START + 0x22
_0800A0F8: .4byte IWRAM_START + 0x25
_0800A0FC: .4byte IWRAM_START + 0x30
_0800A100: .4byte 0x00000414
_0800A104: .4byte IWRAM_START + 0x50
_0800A108: .4byte IWRAM_START + 0x51
_0800A10C: .4byte IWRAM_START + 0x52

	thumb_func_start sub_800A110
sub_800A110: @ 0x0800A110
	push {r4, r5, r6, lr}
	ldr r6, _0800A16C @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r0, _0800A170 @ =gUnknown_03001880
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0800A18C
	ldr r2, _0800A174 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #0x5c
	movs r3, #0
	strh r3, [r2]
	ldr r1, _0800A178 @ =gUnknown_030054E4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0800A17C @ =IWRAM_START + 0x64
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	ldr r0, _0800A180 @ =sub_800A310
	str r0, [r1, #8]
	ldr r1, _0800A184 @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	strh r3, [r1, #4]
	ldr r1, _0800A188 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x40
	bl sub_800A388
	b _0800A1B6
	.align 2, 0
_0800A16C: .4byte gCurTask
_0800A170: .4byte gUnknown_03001880
_0800A174: .4byte gUnknown_030059E0
_0800A178: .4byte gUnknown_030054E4
_0800A17C: .4byte IWRAM_START + 0x64
_0800A180: .4byte sub_800A310
_0800A184: .4byte gBldRegs
_0800A188: .4byte gUnknown_030054A8
_0800A18C:
	ldr r0, _0800A1E4 @ =gUnknown_030053E4
	ldr r1, [r0]
	ldr r0, _0800A1E8 @ =0x000005BE
	cmp r1, r0
	bls _0800A1B6
	ldr r1, _0800A1EC @ =IWRAM_START + 0x64
	adds r0, r5, r1
	strb r2, [r0]
	ldr r1, [r6]
	ldr r0, _0800A1F0 @ =sub_800A310
	str r0, [r1, #8]
	ldr r1, _0800A1F4 @ =gBldRegs
	movs r0, #0xbf
	strh r0, [r1]
	strh r2, [r1, #4]
	ldr r1, _0800A1F8 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x40
	bl sub_800A388
_0800A1B6:
	ldr r0, _0800A1FC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800A240
	adds r5, r4, #0
	ldr r0, _0800A200 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800A218
	ldr r0, _0800A1F4 @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800A204
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	orrs r0, r1
	b _0800A20A
	.align 2, 0
_0800A1E4: .4byte gUnknown_030053E4
_0800A1E8: .4byte 0x000005BE
_0800A1EC: .4byte IWRAM_START + 0x64
_0800A1F0: .4byte sub_800A310
_0800A1F4: .4byte gBldRegs
_0800A1F8: .4byte gUnknown_030054A8
_0800A1FC: .4byte gUnknown_03005424
_0800A200: .4byte gUnknown_03005590
_0800A204:
	ldr r0, [r4, #0x10]
	ldr r1, _0800A228 @ =0xFFFFFE7F
	ands r0, r1
_0800A20A:
	str r0, [r4, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0800A218:
	ldr r0, _0800A22C @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800A230
	ldr r0, [r4, #0x40]
	movs r1, #0x80
	orrs r0, r1
	b _0800A236
	.align 2, 0
_0800A228: .4byte 0xFFFFFE7F
_0800A22C: .4byte gBldRegs
_0800A230:
	ldr r0, [r4, #0x40]
	ldr r1, _0800A248 @ =0xFFFFFE7F
	ands r0, r1
_0800A236:
	str r0, [r4, #0x40]
	adds r0, r4, #0
	adds r0, #0x30
	bl sub_80051E8
_0800A240:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A248: .4byte 0xFFFFFE7F

	thumb_func_start sub_800A24C
sub_800A24C: @ 0x0800A24C
	push {r4, r5, r6, lr}
	ldr r0, _0800A2C8 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	ldr r0, _0800A2CC @ =IWRAM_START + 0x62
	adds r4, r6, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _0800A2D0 @ =gMPlayInfo_BGM
	ldr r5, _0800A2D4 @ =0x0000FFFF
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2D8 @ =gMPlayInfo_SE1
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2DC @ =gMPlayInfo_SE2
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A2E0 @ =gMPlayInfo_SE3
	adds r1, r5, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r4]
	cmp r0, #0x2f
	bls _0800A308
	ldr r0, _0800A2E4 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldr r2, _0800A2E8 @ =IWRAM_START + 0x65
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #5]
	movs r0, #0
	adds r1, r5, #0
	bl sub_80029D0
	ldr r1, _0800A2EC @ =gUnknown_03002AE4
	ldr r0, _0800A2F0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800A2F4 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0800A2F8 @ =gUnknown_03004D5C
	ldr r0, _0800A2FC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800A300 @ =IWRAM_START + 0x64
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800A304
	bl sub_808B3FC_CreateTitleScreen
	b _0800A308
	.align 2, 0
_0800A2C8: .4byte gCurTask
_0800A2CC: .4byte IWRAM_START + 0x62
_0800A2D0: .4byte gMPlayInfo_BGM
_0800A2D4: .4byte 0x0000FFFF
_0800A2D8: .4byte gMPlayInfo_SE1
_0800A2DC: .4byte gMPlayInfo_SE2
_0800A2E0: .4byte gMPlayInfo_SE3
_0800A2E4: .4byte gLoadedSaveGame
_0800A2E8: .4byte IWRAM_START + 0x65
_0800A2EC: .4byte gUnknown_03002AE4
_0800A2F0: .4byte gUnknown_0300287C
_0800A2F4: .4byte gUnknown_03005390
_0800A2F8: .4byte gUnknown_03004D5C
_0800A2FC: .4byte gUnknown_03002A84
_0800A300: .4byte IWRAM_START + 0x64
_0800A304:
	bl sub_808D45C
_0800A308:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800A310
sub_800A310: @ 0x0800A310
	push {lr}
	ldr r0, _0800A33C @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	ldr r0, _0800A340 @ =IWRAM_START + 0x60
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	ldr r2, _0800A344 @ =gBldRegs
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r2, #4]
	ldrh r1, [r1]
	ldr r0, _0800A348 @ =0x00000FFF
	cmp r1, r0
	bls _0800A336
	ldr r0, _0800A34C @ =sub_800A24C
	str r0, [r3, #8]
_0800A336:
	pop {r0}
	bx r0
	.align 2, 0
_0800A33C: .4byte gCurTask
_0800A340: .4byte IWRAM_START + 0x60
_0800A344: .4byte gBldRegs
_0800A348: .4byte 0x00000FFF
_0800A34C: .4byte sub_800A24C

	thumb_func_start sub_800A350
sub_800A350: @ 0x0800A350
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl sub_8007CF0
	ldr r0, [r4, #0x34]
	bl sub_8007CF0
	ldr r1, _0800A37C @ =gUnknown_030054E4
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0800A380 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _0800A384 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A37C: .4byte gUnknown_030054E4
_0800A380: .4byte gUnknown_03005424
_0800A384: .4byte 0x0000FFBF

	thumb_func_start sub_800A388
sub_800A388: @ 0x0800A388
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800A3C8 @ =sub_800A3D4
	ldr r2, _0800A3CC @ =0x0000FFFE
	movs r1, #0
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4]
	adds r1, r5, #0
	bl __divsi3
	strh r0, [r4, #2]
	ldr r1, _0800A3D0 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A3C8: .4byte sub_800A3D4
_0800A3CC: .4byte 0x0000FFFE
_0800A3D0: .4byte gUnknown_030054A8

	thumb_func_start sub_800A3D4
sub_800A3D4: @ 0x0800A3D4
	push {r4, r5, lr}
	ldr r0, _0800A424 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0800A428 @ =gMPlayInfo_BGM
	ldr r4, _0800A42C @ =0x0000FFFF
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A430 @ =gMPlayInfo_SE1
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A434 @ =gMPlayInfo_SE2
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _0800A438 @ =gMPlayInfo_SE3
	ldrh r2, [r5]
	adds r1, r4, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800A41E
	movs r0, #0
	strh r0, [r5]
_0800A41E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A424: .4byte gCurTask
_0800A428: .4byte gMPlayInfo_BGM
_0800A42C: .4byte 0x0000FFFF
_0800A430: .4byte gMPlayInfo_SE1
_0800A434: .4byte gMPlayInfo_SE2
_0800A438: .4byte gMPlayInfo_SE3

	thumb_func_start sub_800A43C
sub_800A43C: @ 0x0800A43C
	push {r4, lr}
	sub sp, #8
	ldr r1, _0800A4A0 @ =gDispCnt
	movs r2, #0x88
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0800A4A4 @ =gBgCntRegs
	movs r4, #0
	movs r3, #0
	ldr r0, _0800A4A8 @ =0x00001E01
	strh r0, [r1, #4]
	str r3, [sp, #4]
	ldr r1, _0800A4AC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0800A4B0 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800A4B4 @ =gUnknown_03004D80
	strb r4, [r0, #2]
	ldr r1, _0800A4B8 @ =gUnknown_03002280
	strb r4, [r1, #8]
	strb r4, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x40
	strb r0, [r1, #0xb]
	ldr r0, _0800A4BC @ =sub_800A4CC
	movs r2, #0x80
	lsls r2, r2, #5
	str r3, [sp]
	movs r1, #0
	bl TaskCreate
	ldr r1, _0800A4C0 @ =gBgPalette
	ldr r0, _0800A4C4 @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _0800A4C8 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800A4A0: .4byte gDispCnt
_0800A4A4: .4byte gBgCntRegs
_0800A4A8: .4byte 0x00001E01
_0800A4AC: .4byte 0x040000D4
_0800A4B0: .4byte 0x85000010
_0800A4B4: .4byte gUnknown_03004D80
_0800A4B8: .4byte gUnknown_03002280
_0800A4BC: .4byte sub_800A4CC
_0800A4C0: .4byte gBgPalette
_0800A4C4: .4byte 0x00007FFF
_0800A4C8: .4byte gFlags

	thumb_func_start sub_800A4CC
sub_800A4CC: @ 0x0800A4CC
	push {lr}
	sub sp, #0xc
	ldr r0, _0800A500 @ =0x06000020
	ldr r1, _0800A504 @ =gUnknown_086E9E08
	movs r2, #2
	str r2, [sp]
	ldr r2, _0800A508 @ =gUnknown_080D5130
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0xa
	bl sub_8004274
	ldr r0, _0800A50C @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800A4F8
	bl sub_800A510
_0800A4F8:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0800A500: .4byte 0x06000020
_0800A504: .4byte gUnknown_086E9E08
_0800A508: .4byte gUnknown_080D5130
_0800A50C: .4byte gPressedKeys

	thumb_func_start sub_800A510
sub_800A510: @ 0x0800A510
	push {lr}
	ldr r1, _0800A538 @ =gUnknown_03004D80
	movs r0, #0
	strb r0, [r1, #2]
	ldr r1, _0800A53C @ =gUnknown_03002280
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	movs r0, #0xff
	strb r0, [r1, #0xa]
	movs r0, #0x20
	strb r0, [r1, #0xb]
	ldr r0, _0800A540 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_808B3FC_CreateTitleScreen
	pop {r0}
	bx r0
	.align 2, 0
_0800A538: .4byte gUnknown_03004D80
_0800A53C: .4byte gUnknown_03002280
_0800A540: .4byte gCurTask

	thumb_func_start sub_800A544
sub_800A544: @ 0x0800A544
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	mov sl, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0800A5E4 @ =sub_800A5F8
	str r1, [sp]
	movs r1, #0x44
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r5, r1
	movs r3, #0
	str r3, [r1, #0x30]
	str r3, [r1, #0x34]
	movs r2, #0
	mov sb, r2
	strh r3, [r1, #0x38]
	strh r3, [r1, #0x3a]
	strh r3, [r1, #0x3c]
	strh r3, [r1, #0x3e]
	ldr r4, _0800A5E8 @ =IWRAM_START + 0x40
	adds r2, r5, r4
	strh r3, [r2]
	strh r3, [r1, #0x16]
	strh r3, [r1, #0x18]
	mov r2, sl
	str r2, [r1, #4]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r6, [r1, #0xa]
	subs r4, #0x20
	adds r2, r5, r4
	mov r4, r8
	strb r4, [r2]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r2, _0800A5EC @ =IWRAM_START + 0x21
	adds r4, r5, r2
	movs r2, #0xff
	strb r2, [r4]
	ldr r2, _0800A5F0 @ =IWRAM_START + 0x22
	adds r4, r5, r2
	movs r2, #0x10
	strb r2, [r4]
	ldr r4, _0800A5F4 @ =IWRAM_START + 0x25
	adds r5, r5, r4
	mov r2, sb
	strb r2, [r5]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A5E4: .4byte sub_800A5F8
_0800A5E8: .4byte IWRAM_START + 0x40
_0800A5EC: .4byte IWRAM_START + 0x21
_0800A5F0: .4byte IWRAM_START + 0x22
_0800A5F4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800A5F8
sub_800A5F8: @ 0x0800A5F8
	push {r4, r5, r6, lr}
	ldr r6, _0800A67C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3e]
	ldrh r1, [r5, #0x3a]
	adds r0, r0, r1
	strh r0, [r5, #0x3a]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x30]
	adds r0, r0, r1
	str r0, [r5, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r5, r1]
	ldr r1, [r5, #0x34]
	adds r1, r1, r2
	str r1, [r5, #0x34]
	asrs r0, r0, #8
	ldr r3, _0800A680 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r0, r0, r2
	strh r0, [r5, #0x16]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r0, _0800A684 @ =IWRAM_START + 0x40
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800A64A
	subs r0, #1
	strh r0, [r4]
_0800A64A:
	ldrh r0, [r5, #0x16]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800A672
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	subs r0, #0x20
	cmp r0, #0xa0
	bgt _0800A672
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800A688
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800A688
_0800A672:
	ldr r0, [r6]
	bl TaskDestroy
	b _0800A68E
	.align 2, 0
_0800A67C: .4byte gCurTask
_0800A680: .4byte gUnknown_03005960
_0800A684: .4byte IWRAM_START + 0x40
_0800A688:
	adds r0, r5, #0
	bl sub_80051E8
_0800A68E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800A694
sub_800A694: @ 0x0800A694
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_800A6A8
sub_800A6A8: @ 0x0800A6A8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r0, _0800A73C @ =sub_800A744
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0800A740 @ =sub_800A9B8
	str r1, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r4, r4, r5
	movs r0, #0
	mov sb, r0
	movs r6, #0
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r4, #8]
	str r6, [r4, #0xc]
	bl sub_8009918
	str r0, [r4]
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	movs r0, #0x3c
	strh r0, [r1, #6]
	movs r0, #0xc8
	mov r8, r0
	mov r0, r8
	strh r0, [r1, #8]
	strh r6, [r1]
	movs r0, #0x20
	strh r0, [r1, #2]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #4]
	movs r0, #2
	strb r0, [r1, #0xa]
	mov r0, sb
	strb r0, [r1, #0xb]
	bl sub_8009918
	str r0, [r4, #4]
	ldrh r0, [r0, #6]
	adds r1, r0, r5
	mov r0, r8
	strh r0, [r1, #6]
	movs r0, #0xf0
	strh r0, [r1, #8]
	strh r6, [r1]
	movs r0, #0x10
	strh r0, [r1, #2]
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1, #4]
	movs r0, #3
	strb r0, [r1, #0xa]
	mov r0, sb
	strb r0, [r1, #0xb]
	movs r0, #1
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A73C: .4byte sub_800A744
_0800A740: .4byte sub_800A9B8

	thumb_func_start sub_800A744
sub_800A744: @ 0x0800A744
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0800A7B8 @ =gCurTask
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov ip, r1
	adds r5, r0, r1
	ldr r0, _0800A7BC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	beq _0800A76E
	b _0800A8CC
_0800A76E:
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r3, r0, r2
	ldr r2, _0800A7C0 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #7
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	bne _0800A7C8
	ldrb r6, [r3, #0xb]
	adds r4, r6, #0
	cmp r4, #0
	beq _0800A7C8
	ldr r2, _0800A7C4 @ =gDispCnt
	ldrh r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0800A7D8
	cmp r4, #0x1f
	bhi _0800A7A4
	adds r0, r6, #1
	strb r0, [r3, #0xb]
_0800A7A4:
	ldr r0, [r5, #4]
	ldrh r0, [r0, #6]
	mov r1, ip
	adds r3, r0, r1
	ldrb r0, [r3, #0xb]
	cmp r0, #0xf
	bhi _0800A800
	adds r0, #1
	strb r0, [r3, #0xb]
	b _0800A800
	.align 2, 0
_0800A7B8: .4byte gCurTask
_0800A7BC: .4byte gUnknown_03005424
_0800A7C0: .4byte gUnknown_03005590
_0800A7C4: .4byte gDispCnt
_0800A7C8:
	ldr r2, _0800A7F0 @ =gDispCnt
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	bne _0800A800
_0800A7D8:
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	bne _0800A7F4
	movs r2, #4
	strb r2, [r3, #0xb]
	ldr r0, [r5, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	strb r2, [r3, #0xb]
	b _0800A800
	.align 2, 0
_0800A7F0: .4byte gDispCnt
_0800A7F4:
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
_0800A800:
	ldr r2, [r5, #0xc]
	ldr r0, _0800A880 @ =0xFFFFFE00
	adds r2, r2, r0
	ldr r3, _0800A884 @ =gUnknown_08097AA4
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _0800A888 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	str r2, [r5, #0xc]
	ldr r1, _0800A88C @ =gBgScrollRegs
	asrs r2, r2, #8
	movs r3, #0xff
	ands r2, r3
	strh r2, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r3
	strh r0, [r1, #2]
	ldrh r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7]
	ldr r1, _0800A890 @ =gWinRegs
	ldr r0, _0800A894 @ =0x00003F3F
	strh r0, [r1, #8]
	movs r0, #0x1e
	strh r0, [r1, #0xa]
	ldrh r0, [r5, #8]
	subs r0, #0x40
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	ldr r1, _0800A898 @ =0x05FF0000
	cmp r0, r1
	bgt _0800A85A
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r5, #8]
_0800A85A:
	ldr r1, _0800A89C @ =gBldRegs
	ldr r0, _0800A8A0 @ =0x00003F41
	strh r0, [r1]
	ldrh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	strh r0, [r1, #4]
	ldr r0, _0800A8A4 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	ldr r1, _0800A8A8 @ =0x8000080
	ands r0, r1
	cmp r0, #0
	beq _0800A8B0
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0800A8AC @ =sub_800A8E0
	str r0, [r1, #8]
	b _0800A8CC
	.align 2, 0
_0800A880: .4byte 0xFFFFFE00
_0800A884: .4byte gUnknown_08097AA4
_0800A888: .4byte 0x000001FF
_0800A88C: .4byte gBgScrollRegs
_0800A890: .4byte gWinRegs
_0800A894: .4byte 0x00003F3F
_0800A898: .4byte 0x05FF0000
_0800A89C: .4byte gBldRegs
_0800A8A0: .4byte 0x00003F41
_0800A8A4: .4byte gUnknown_030059E0
_0800A8A8: .4byte 0x8000080
_0800A8AC: .4byte sub_800A8E0
_0800A8B0:
	ldr r0, _0800A8D8 @ =gUnknown_030054E4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800A8CC
	ldr r0, [r5]
	bl TaskDestroy
	ldr r0, [r5, #4]
	bl TaskDestroy
	ldr r0, _0800A8DC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0800A8CC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A8D8: .4byte gUnknown_030054E4
_0800A8DC: .4byte gCurTask

	thumb_func_start sub_800A8E0
sub_800A8E0: @ 0x0800A8E0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _0800A998 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	adds r3, r0, r1
	ldr r2, _0800A99C @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _0800A918
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800A918
	subs r0, #2
	strb r0, [r3, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _0800A918
	movs r5, #1
_0800A918:
	ldr r0, [r4, #4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800A940
	ldrb r0, [r3, #0xb]
	cmp r0, #0
	beq _0800A940
	subs r0, #1
	strb r0, [r3, #0xb]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0800A940
	movs r5, #1
_0800A940:
	ldr r2, [r4, #0xc]
	ldr r0, _0800A9A0 @ =0xFFFFFE00
	adds r2, r2, r0
	ldr r3, _0800A9A4 @ =gUnknown_08097AA4
	ldr r0, [r6]
	ldr r1, _0800A9A8 @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	subs r2, r2, r0
	str r2, [r4, #0xc]
	ldr r1, _0800A9AC @ =gBgScrollRegs
	asrs r2, r2, #8
	movs r3, #0xff
	ands r2, r3
	strh r2, [r1]
	ldrh r0, [r1, #2]
	subs r0, #1
	ands r0, r3
	strh r0, [r1, #2]
	cmp r5, #0
	beq _0800A990
	ldr r2, _0800A9B0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0800A9B4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4]
	bl TaskDestroy
	ldr r0, [r4, #4]
	bl TaskDestroy
	ldr r0, _0800A998 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0800A990:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800A998: .4byte gCurTask
_0800A99C: .4byte gUnknown_03005590
_0800A9A0: .4byte 0xFFFFFE00
_0800A9A4: .4byte gUnknown_08097AA4
_0800A9A8: .4byte 0x000001FF
_0800A9AC: .4byte gBgScrollRegs
_0800A9B0: .4byte gDispCnt
_0800A9B4: .4byte 0x0000FEFF

	thumb_func_start sub_800A9B8
sub_800A9B8: @ 0x0800A9B8
	ldr r2, _0800A9E4 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0800A9E8 @ =0x00009FFF
	ands r0, r1
	ldr r1, _0800A9EC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0800A9F0 @ =gBldRegs
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #4]
	ldr r0, _0800A9F4 @ =gWinRegs
	strh r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0, #6]
	ldr r2, _0800A9F8 @ =gFlags
	ldr r0, [r2]
	subs r1, #5
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0800A9E4: .4byte gDispCnt
_0800A9E8: .4byte 0x00009FFF
_0800A9EC: .4byte 0x0000FEFF
_0800A9F0: .4byte gBldRegs
_0800A9F4: .4byte gWinRegs
_0800A9F8: .4byte gFlags

	thumb_func_start sub_800A9FC
sub_800A9FC: @ 0x0800A9FC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0800AA78 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r0, #0
	bge _0800AA12
	movs r4, #0
_0800AA12:
	ldr r0, _0800AA7C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0800AAF8
	ldr r1, _0800AA80 @ =gUnknown_080D5148
	lsls r4, r4, #0x18
	asrs r0, r4, #0x15
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8007C10
	adds r6, r0, #0
	ldr r0, _0800AA84 @ =gUnknown_020226D0
	ldr r0, [r0]
	cmp r6, r0
	beq _0800AAF8
	ldr r0, _0800AA88 @ =sub_800ADAC
	ldr r2, _0800AA8C @ =0x0000FFFE
	ldr r1, _0800AA90 @ =sub_800AE44
	str r1, [sp]
	movs r1, #0x70
	movs r3, #4
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov ip, r0
	ldr r1, _0800AA94 @ =IWRAM_START + 0x60
	adds r0, r2, r1
	movs r1, #0
	strh r5, [r0]
	ldr r3, _0800AA98 @ =IWRAM_START + 0x62
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0800AA9C @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AAA4
	ldr r0, _0800AAA0 @ =IWRAM_START + 0x63
	adds r1, r2, r0
	movs r0, #2
	b _0800AAAA
	.align 2, 0
_0800AA78: .4byte gLoadedSaveGame
_0800AA7C: .4byte gUnknown_03005424
_0800AA80: .4byte gUnknown_080D5148
_0800AA84: .4byte gUnknown_020226D0
_0800AA88: .4byte sub_800ADAC
_0800AA8C: .4byte 0x0000FFFE
_0800AA90: .4byte sub_800AE44
_0800AA94: .4byte IWRAM_START + 0x60
_0800AA98: .4byte IWRAM_START + 0x62
_0800AA9C: .4byte gInput
_0800AAA0: .4byte IWRAM_START + 0x63
_0800AAA4:
	ldr r3, _0800AB00 @ =IWRAM_START + 0x63
	adds r1, r2, r3
	movs r0, #1
_0800AAAA:
	strb r0, [r1]
	mov r0, ip
	str r6, [r0, #4]
	movs r3, #0
	movs r2, #0
	movs r0, #0x40
	mov r1, ip
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	ldr r1, _0800AB04 @ =gUnknown_080D5148
	asrs r0, r4, #0x15
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	mov r4, ip
	strh r1, [r4, #0xa]
	ldrb r1, [r0, #6]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #0x78
	strh r0, [r4, #0x16]
	movs r0, #0x50
	strh r0, [r4, #0x18]
	str r2, [r4, #0x10]
	mov r0, ip
	bl sub_8004558
_0800AAF8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB00: .4byte IWRAM_START + 0x63
_0800AB04: .4byte gUnknown_080D5148

	thumb_func_start sub_800AB08
sub_800AB08: @ 0x0800AB08
	push {r4, r5, r6, r7, lr}
	ldr r0, _0800AB3C @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r2, _0800AB40 @ =gReleasedKeys
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800AB4C
	ldr r0, _0800AB44 @ =IWRAM_START + 0x63
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800AB4C
	movs r0, #1
	strb r0, [r2]
	ldr r6, _0800AB48 @ =IWRAM_START + 0x62
	adds r5, r3, r6
	b _0800AC7C
	.align 2, 0
_0800AB3C: .4byte gCurTask
_0800AB40: .4byte gReleasedKeys
_0800AB44: .4byte IWRAM_START + 0x63
_0800AB48: .4byte IWRAM_START + 0x62
_0800AB4C:
	ldr r0, _0800ABA0 @ =gPressedKeys
	ldrh r6, [r0]
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	bne _0800AB84
	adds r0, r4, #0
	adds r0, #0x62
	ldrb r3, [r0]
	adds r5, r0, #0
	cmp r3, #0
	bne _0800AB70
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800AB84
_0800AB70:
	ldr r0, _0800ABA4 @ =gUnknown_030054CC
	ldrb r7, [r0]
	cmp r7, #0
	beq _0800AC18
	movs r0, #2
	ands r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0800ABB8
_0800AB84:
	ldr r2, _0800ABA8 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800ABAC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	ldr r0, _0800ABB0 @ =gMPlayTable
	ldr r0, [r0]
	bl m4aMPlayContinue
	ldr r0, _0800ABB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800AD8A
	.align 2, 0
_0800ABA0: .4byte gPressedKeys
_0800ABA4: .4byte gUnknown_030054CC
_0800ABA8: .4byte gFlags
_0800ABAC: .4byte 0xFFFFFBFF
_0800ABB0: .4byte gMPlayTable
_0800ABB4: .4byte gCurTask
_0800ABB8:
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AC7C
	ldr r2, _0800ABF8 @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800ABFC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0800AC00 @ =0x0000FFFF
	movs r0, #0
	bl sub_80029D0
	ldr r1, _0800AC04 @ =gUnknown_03002AE4
	ldr r0, _0800AC08 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0800AC0C @ =gUnknown_03005390
	strb r6, [r0]
	ldr r1, _0800AC10 @ =gUnknown_03004D5C
	ldr r0, _0800AC14 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_80890BC
	b _0800AD8A
	.align 2, 0
_0800ABF8: .4byte gFlags
_0800ABFC: .4byte 0xFFFFFBFF
_0800AC00: .4byte 0x0000FFFF
_0800AC04: .4byte gUnknown_03002AE4
_0800AC08: .4byte gUnknown_0300287C
_0800AC0C: .4byte gUnknown_03005390
_0800AC10: .4byte gUnknown_03004D5C
_0800AC14: .4byte gUnknown_03002A84
_0800AC18:
	cmp r3, #0
	beq _0800AC7C
	mov r6, ip
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800AC7C
	ldr r2, _0800AC5C @ =gFlags
	ldr r0, [r2]
	ldr r1, _0800AC60 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r1, _0800AC64 @ =0x0000FFFF
	movs r0, #0
	bl sub_80029D0
	ldr r1, _0800AC68 @ =gUnknown_03002AE4
	ldr r0, _0800AC6C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0800AC70 @ =gUnknown_03005390
	strb r7, [r0]
	ldr r1, _0800AC74 @ =gUnknown_03004D5C
	ldr r0, _0800AC78 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_808D41C_CreateTitleScreenSkipIntro
	b _0800AD8A
	.align 2, 0
_0800AC5C: .4byte gFlags
_0800AC60: .4byte 0xFFFFFBFF
_0800AC64: .4byte 0x0000FFFF
_0800AC68: .4byte gUnknown_03002AE4
_0800AC6C: .4byte gUnknown_0300287C
_0800AC70: .4byte gUnknown_03005390
_0800AC74: .4byte gUnknown_03004D5C
_0800AC78: .4byte gUnknown_03002A84
_0800AC7C:
	ldr r0, _0800ACB0 @ =gBldRegs
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0800AC92
	ldr r0, [r4, #0x40]
	ldr r1, _0800ACB4 @ =0xFFFFFE7F
	ands r0, r1
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x10]
	ands r0, r1
	str r0, [r4, #0x10]
_0800AC92:
	ldr r2, _0800ACB8 @ =gRepeatedKeys
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800ACBC
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800ACBC
	movs r0, #0
	strb r0, [r5]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0800ACD6
	.align 2, 0
_0800ACB0: .4byte gBldRegs
_0800ACB4: .4byte 0xFFFFFE7F
_0800ACB8: .4byte gRepeatedKeys
_0800ACBC:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800ACD6
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800ACDC
	movs r0, #1
	strb r0, [r5]
	movs r0, #0x6c
	bl m4aSongNumStart
_0800ACD6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800AD38
_0800ACDC:
	ldr r2, _0800AD1C @ =0x040000D4
	adds r6, r4, #0
	adds r6, #0x6a
	str r6, [r2]
	ldr r0, _0800AD20 @ =0x050003F2
	str r0, [r2, #4]
	ldr r3, _0800AD24 @ =0x80000003
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	adds r5, r4, #0
	adds r5, #0x64
	str r5, [r2]
	ldr r0, _0800AD28 @ =0x050003F8
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800AD2C @ =gUnknown_03005660
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800AD7C
	ldr r0, [r1, #0x10]
	ldrh r1, [r0, #6]
	str r6, [r2]
	ldr r6, _0800AD30 @ =IWRAM_START + 0x1F2
	adds r0, r1, r6
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	str r5, [r2]
	ldr r0, _0800AD34 @ =IWRAM_START + 0x1F8
	b _0800AD74
	.align 2, 0
_0800AD1C: .4byte 0x040000D4
_0800AD20: .4byte 0x050003F2
_0800AD24: .4byte 0x80000003
_0800AD28: .4byte 0x050003F8
_0800AD2C: .4byte gUnknown_03005660
_0800AD30: .4byte IWRAM_START + 0x1F2
_0800AD34: .4byte IWRAM_START + 0x1F8
_0800AD38:
	ldr r2, _0800AD90 @ =0x040000D4
	adds r6, r4, #0
	adds r6, #0x6a
	str r6, [r2]
	ldr r0, _0800AD94 @ =0x050003F8
	str r0, [r2, #4]
	ldr r3, _0800AD98 @ =0x80000003
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	adds r5, r4, #0
	adds r5, #0x64
	str r5, [r2]
	ldr r0, _0800AD9C @ =0x050003F2
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800ADA0 @ =gUnknown_03005660
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800AD7C
	ldr r0, [r1, #0x10]
	ldrh r1, [r0, #6]
	str r6, [r2]
	ldr r6, _0800ADA4 @ =IWRAM_START + 0x1F8
	adds r0, r1, r6
	str r0, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
	str r5, [r2]
	ldr r0, _0800ADA8 @ =IWRAM_START + 0x1F2
_0800AD74:
	adds r1, r1, r0
	str r1, [r2, #4]
	str r3, [r2, #8]
	ldr r0, [r2, #8]
_0800AD7C:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_80051E8
_0800AD8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AD90: .4byte 0x040000D4
_0800AD94: .4byte 0x050003F8
_0800AD98: .4byte 0x80000003
_0800AD9C: .4byte 0x050003F2
_0800ADA0: .4byte gUnknown_03005660
_0800ADA4: .4byte IWRAM_START + 0x1F8
_0800ADA8: .4byte IWRAM_START + 0x1F2

	thumb_func_start sub_800ADAC
sub_800ADAC: @ 0x0800ADAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800AE24 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	movs r4, #0
	ldr r0, _0800AE28 @ =gSongTable + (142 * 8) + 4
	ldrh r6, [r0]
	movs r5, #0
	ldr r7, _0800AE2C @ =gMPlayTable
_0800ADCA:
	cmp r4, r6
	beq _0800ADD6
	adds r0, r5, r7
	ldr r0, [r0]
	bl MPlayStop
_0800ADD6:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #3
	bls _0800ADCA
	movs r0, #0x8e
	bl m4aSongNumStart
	ldr r2, _0800AE30 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2]
	ldr r0, _0800AE34 @ =0x040000D4
	ldr r2, _0800AE38 @ =gUnknown_03002252
	str r2, [r0]
	mov r1, r8
	adds r1, #0x64
	str r1, [r0, #4]
	ldr r3, _0800AE3C @ =0x80000003
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	adds r2, #6
	str r2, [r0]
	mov r1, r8
	adds r1, #0x6a
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _0800AE24 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800AE40 @ =sub_800AB08
	str r0, [r1, #8]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AE24: .4byte gCurTask
_0800AE28: .4byte gSongTable + (142 * 8) + 4
_0800AE2C: .4byte gMPlayTable
_0800AE30: .4byte gFlags
_0800AE34: .4byte 0x040000D4
_0800AE38: .4byte gUnknown_03002252
_0800AE3C: .4byte 0x80000003
_0800AE40: .4byte sub_800AB08

	thumb_func_start sub_800AE44
sub_800AE44: @ 0x0800AE44
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_800AE58
sub_800AE58: @ 0x0800AE58
	ldr r1, _0800AE80 @ =0x040000D4
	ldr r0, _0800AE84 @ =gUnknown_086EA408
	str r0, [r1]
	ldr r0, _0800AE88 @ =0x06017EC0
	str r0, [r1, #4]
	ldr r0, _0800AE8C @ =0x800000A0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800AE90 @ =gObjPalette
	ldr r0, _0800AE94 @ =0x00007FFF
	strh r0, [r1, #2]
	ldr r2, _0800AE98 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0800AE9C @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_0800AE80: .4byte 0x040000D4
_0800AE84: .4byte gUnknown_086EA408
_0800AE88: .4byte 0x06017EC0
_0800AE8C: .4byte 0x800000A0
_0800AE90: .4byte gObjPalette
_0800AE94: .4byte 0x00007FFF
_0800AE98: .4byte gFlags
_0800AE9C: .4byte 0xFFFFFBFF

	thumb_func_start sub_800AEA0
sub_800AEA0: @ 0x0800AEA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0800AF54 @ =gUnknown_0300540C
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0800AFB2
	ldr r0, _0800AF58 @ =sub_800AFD0
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r4, #0
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0800AF5C @ =IWRAM_START + 0x31
	adds r0, r3, r2
	strb r4, [r0]
	movs r5, #0
	strh r6, [r1, #0x16]
	strh r7, [r1, #0x18]
	ldr r0, _0800AF60 @ =0x06012100
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	subs r0, #0xe9
	strh r0, [r1, #0xa]
	subs r2, #0x11
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0800AF64 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0800AF68 @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0800AF6C @ =IWRAM_START + 0x25
	adds r0, r3, r2
	strb r5, [r0]
	mov r0, r8
	str r0, [r1, #0x10]
	ldr r0, _0800AF70 @ =gUnknown_030053F0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r1, _0800AF74 @ =IWRAM_START + 0x30
	adds r3, r3, r1
	strb r0, [r3]
	cmp r0, #0
	beq _0800AF84
	ldr r4, _0800AF78 @ =gMPlayInfo_SE2
	ldr r1, _0800AF7C @ =song0117
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0800AF80 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	b _0800AFAA
	.align 2, 0
_0800AF54: .4byte gUnknown_0300540C
_0800AF58: .4byte sub_800AFD0
_0800AF5C: .4byte IWRAM_START + 0x31
_0800AF60: .4byte 0x06012100
_0800AF64: .4byte IWRAM_START + 0x21
_0800AF68: .4byte IWRAM_START + 0x22
_0800AF6C: .4byte IWRAM_START + 0x25
_0800AF70: .4byte gUnknown_030053F0
_0800AF74: .4byte IWRAM_START + 0x30
_0800AF78: .4byte gMPlayInfo_SE2
_0800AF7C: .4byte song0117
_0800AF80: .4byte 0x0000FFFF
_0800AF84:
	ldr r4, _0800AFC0 @ =gMPlayInfo_SE1
	ldr r1, _0800AFC4 @ =song0117
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0800AFC8 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl m4aMPlayPanpotControl
_0800AFAA:
	ldr r1, _0800AFCC @ =gUnknown_0300540C
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0800AFB2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800AFC0: .4byte gMPlayInfo_SE1
_0800AFC4: .4byte song0117
_0800AFC8: .4byte 0x0000FFFF
_0800AFCC: .4byte gUnknown_0300540C

	thumb_func_start sub_800AFD0
sub_800AFD0: @ 0x0800AFD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800B030 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r5, r4, #0
	ldrh r0, [r4, #0x16]
	adds r6, r0, #0
	ldrh r7, [r4, #0x18]
	ldr r1, _0800B034 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800B01C
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, _0800B038 @ =gUnknown_0300540C
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	bl TaskDestroy
_0800B01C:
	adds r0, r5, #0
	bl sub_80051E8
	strh r6, [r5, #0x16]
	strh r7, [r5, #0x18]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B030: .4byte gCurTask
_0800B034: .4byte gUnknown_03005960
_0800B038: .4byte gUnknown_0300540C

	thumb_func_start sub_800B03C
sub_800B03C: @ 0x0800B03C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _0800B17C @ =gUnknown_030054CC
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0800B076
	ldrb r0, [r6, #2]
	cmp r0, #0
	beq _0800B164
	cmp r0, #5
	bne _0800B076
	movs r0, #7
	strb r0, [r6, #2]
_0800B076:
	ldr r0, _0800B180 @ =sub_800B704
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0800B184 @ =sub_800B80C
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r5, #0xc0
	lsls r5, r5, #0x12
	adds r5, r4, r5
	ldrb r1, [r6, #2]
	ldr r2, _0800B188 @ =IWRAM_START + 0x76
	adds r0, r4, r2
	movs r2, #0
	mov sl, r2
	strb r1, [r0]
	ldr r1, _0800B18C @ =IWRAM_START + 0x74
	adds r0, r4, r1
	mov r2, sl
	strh r2, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	str r0, [r5, #0x6c]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r1, r7, #8
	adds r0, r0, r1
	str r0, [r5, #0x70]
	strh r2, [r5, #4]
	strh r7, [r5, #6]
	str r6, [r5]
	ldrb r0, [r6]
	strb r0, [r5, #8]
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r5, #9]
	ldr r1, _0800B190 @ =IWRAM_START + 0xC
	adds r7, r4, r1
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r2, sl
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _0800B194 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0800B198 @ =IWRAM_START + 0x2E
	adds r0, r4, r1
	movs r2, #0x10
	strb r2, [r0]
	adds r1, #3
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	mov sb, r1
	str r1, [r7, #0x10]
	movs r0, #0xb5
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	ldr r2, _0800B19C @ =IWRAM_START + 0x2C
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x10
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r7, #0
	bl sub_8004558
	ldr r2, _0800B1A0 @ =IWRAM_START + 0x3C
	adds r7, r4, r2
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #0x21
	adds r1, r4, r2
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0800B1A4 @ =IWRAM_START + 0x5E
	adds r0, r4, r1
	movs r2, #0x10
	strb r2, [r0]
	ldr r0, _0800B1A8 @ =IWRAM_START + 0x61
	adds r4, r4, r0
	movs r1, #0
	strb r1, [r4]
	mov r2, r8
	str r2, [r7, #0x28]
	mov r0, sb
	str r0, [r7, #0x10]
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_800B580
_0800B164:
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B17C: .4byte gUnknown_030054CC
_0800B180: .4byte sub_800B704
_0800B184: .4byte sub_800B80C
_0800B188: .4byte IWRAM_START + 0x76
_0800B18C: .4byte IWRAM_START + 0x74
_0800B190: .4byte IWRAM_START + 0xC
_0800B194: .4byte IWRAM_START + 0x2D
_0800B198: .4byte IWRAM_START + 0x2E
_0800B19C: .4byte IWRAM_START + 0x2C
_0800B1A0: .4byte IWRAM_START + 0x3C
_0800B1A4: .4byte IWRAM_START + 0x5E
_0800B1A8: .4byte IWRAM_START + 0x61

	thumb_func_start sub_800B1AC
sub_800B1AC: @ 0x0800B1AC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x78
	ldrb r0, [r0]
	ldr r2, _0800B228 @ =gUnknown_030059E0
	cmp r0, #1
	bne _0800B1C4
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B1DE
_0800B1C4:
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0800B22C @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #7
	movs r0, #5
	strb r0, [r1]
_0800B1DE:
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x70]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r1, r4, #0
	adds r1, #0x77
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800B230 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B218
	bl sub_8019224
	movs r1, #2
	strb r1, [r0]
	ldrh r1, [r4, #4]
	strb r1, [r0, #1]
	ldrh r1, [r4, #6]
	strb r1, [r0, #2]
	ldrb r1, [r4, #9]
	strb r1, [r0, #3]
_0800B218:
	ldr r0, _0800B234 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B238 @ =sub_800B780
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B228: .4byte gUnknown_030059E0
_0800B22C: .4byte 0x0000FFFF
_0800B230: .4byte gUnknown_030054CC
_0800B234: .4byte gCurTask
_0800B238: .4byte sub_800B780

	thumb_func_start sub_800B23C
sub_800B23C: @ 0x0800B23C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, #0x76
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _0800B252
	b _0800B558
_0800B252:
	lsls r0, r0, #2
	ldr r1, _0800B25C @ =_0800B260
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B25C: .4byte _0800B260
_0800B260: @ jump table
	.4byte _0800B294 @ case 0
	.4byte _0800B2B4 @ case 1
	.4byte _0800B2F0 @ case 2
	.4byte _0800B32C @ case 3
	.4byte _0800B37C @ case 4
	.4byte _0800B3BC @ case 5
	.4byte _0800B3F4 @ case 6
	.4byte _0800B400 @ case 7
	.4byte _0800B478 @ case 8
	.4byte _0800B510 @ case 9
	.4byte _0800B51E @ case 10
	.4byte _0800B532 @ case 11
	.4byte _0800B546 @ case 12
_0800B294:
	ldr r1, _0800B2AC @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800B2A0
	movs r0, #0xff
_0800B2A0:
	strb r0, [r1]
	ldr r1, _0800B2B0 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0800B558
	.align 2, 0
_0800B2AC: .4byte gUnknown_03005448
_0800B2B0: .4byte gUnknown_030054A8
_0800B2B4:
	ldr r3, _0800B2EC @ =gUnknown_030059E0
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800B2C6
	b _0800B558
_0800B2C6:
	movs r0, #0xf7
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B2DA
	b _0800B558
_0800B2DA:
	adds r0, r3, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A7A8
	b _0800B558
	.align 2, 0
_0800B2EC: .4byte gUnknown_030059E0
_0800B2F0:
	ldr r3, _0800B328 @ =gUnknown_030059E0
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800B302
	b _0800B558
_0800B302:
	movs r0, #0xfe
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B316
	b _0800B558
_0800B316:
	adds r0, r3, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A8F8
	b _0800B558
	.align 2, 0
_0800B328: .4byte gUnknown_030059E0
_0800B32C:
	ldr r2, _0800B370 @ =gUnknown_030059E0
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r2, #0x2e]
	ldr r0, _0800B374 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B34C
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800B34C
	b _0800B558
_0800B34C:
	adds r3, r2, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r0, #2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A854
	ldr r1, _0800B378 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #2]
	b _0800B558
	.align 2, 0
_0800B370: .4byte gUnknown_030059E0
_0800B374: .4byte gUnknown_030054CC
_0800B378: .4byte gUnknown_030054A8
_0800B37C:
	ldr r2, _0800B3B0 @ =gUnknown_030059E0
	adds r4, r2, #0
	adds r4, #0x37
	ldrb r1, [r4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4]
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r2, #0x30]
	ldr r0, _0800B3B4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #2
	bl m4aMPlayTempoControl
	ldr r0, _0800B3B8 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0800B3A4
	b _0800B558
_0800B3A4:
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r4]
	b _0800B558
	.align 2, 0
_0800B3B0: .4byte gUnknown_030059E0
_0800B3B4: .4byte gMPlayInfo_BGM
_0800B3B8: .4byte gUnknown_030054CC
_0800B3BC:
	ldr r4, _0800B3E0 @ =gUnknown_080D51FC
	ldr r2, _0800B3E4 @ =gUnknown_030053B8
	ldr r1, [r2]
	ldr r0, _0800B3E8 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0800B3EC @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #5
	bl __umodsi3
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _0800B3F0 @ =gUnknown_030053F0
	ldrh r5, [r1]
	adds r0, r5, r0
	b _0800B408
	.align 2, 0
_0800B3E0: .4byte gUnknown_080D51FC
_0800B3E4: .4byte gUnknown_030053B8
_0800B3E8: .4byte 0x00196225
_0800B3EC: .4byte 0x3C6EF35F
_0800B3F0: .4byte gUnknown_030053F0
_0800B3F4:
	ldr r1, _0800B3FC @ =gUnknown_030053F0
	ldrh r5, [r1]
	adds r0, r5, #5
	b _0800B408
	.align 2, 0
_0800B3FC: .4byte gUnknown_030053F0
_0800B400:
	ldr r1, _0800B464 @ =gUnknown_030053F0
	ldrh r5, [r1]
	adds r0, r5, #0
	adds r0, #0xa
_0800B408:
	strh r0, [r1]
	ldr r0, _0800B468 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0800B448
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0800B448
	ldr r0, _0800B46C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800B448
	ldr r1, _0800B470 @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800B440
	movs r0, #0xff
_0800B440:
	strb r0, [r1]
	ldr r1, _0800B474 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800B448:
	ldr r0, _0800B46C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800B45C
	ldr r1, _0800B464 @ =gUnknown_030053F0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0800B45C
	movs r0, #0xff
	strh r0, [r1]
_0800B45C:
	movs r0, #0x75
	bl m4aSongNumStart
	b _0800B558
	.align 2, 0
_0800B464: .4byte gUnknown_030053F0
_0800B468: .4byte gUnknown_030055B4
_0800B46C: .4byte gUnknown_030054CC
_0800B470: .4byte gUnknown_03005448
_0800B474: .4byte gUnknown_030054A8
_0800B478:
	movs r6, #1
	rsbs r6, r6, #0
	movs r3, #0
	mov sl, r3
	movs r4, #0
	ldr r1, _0800B500 @ =gUnknown_030055A0
	ldr r0, [r1]
	mov r8, r1
	cmp r0, #0
	beq _0800B4E8
	mov ip, r1
	ldr r5, _0800B504 @ =gUnknown_030059E0
_0800B490:
	ldr r0, _0800B508 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _0800B4D4
	lsls r0, r4, #2
	add r0, ip
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r7, _0800B50C @ =IWRAM_START + 0x50
	adds r1, r2, r7
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	adds r3, r0, #0
	muls r3, r0, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r7, #2
	adds r2, r2, r7
	movs r7, #0
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r3, r3, r0
	cmp r6, r3
	bge _0800B4D4
	adds r6, r3, #0
	mov sl, r4
_0800B4D4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _0800B4E8
	lsls r0, r4, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _0800B490
_0800B4E8:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #1
	strb r1, [r0, #1]
	mov r3, sl
	strb r3, [r0, #2]
	movs r0, #0xda
	bl m4aSongNumStart
	b _0800B558
	.align 2, 0
_0800B500: .4byte gUnknown_030055A0
_0800B504: .4byte gUnknown_030059E0
_0800B508: .4byte 0x04000128
_0800B50C: .4byte IWRAM_START + 0x50
_0800B510:
	bl sub_8019224
	movs r2, #0
	movs r1, #6
	strb r1, [r0]
	strb r2, [r0, #1]
	b _0800B52A
_0800B51E:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #2
	strb r1, [r0, #1]
_0800B52A:
	movs r0, #0xd9
	bl m4aSongNumStart
	b _0800B558
_0800B532:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #3
	strb r1, [r0, #1]
	movs r0, #0xdb
	bl m4aSongNumStart
	b _0800B558
_0800B546:
	bl sub_8019224
	movs r1, #6
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	movs r0, #0xd8
	bl m4aSongNumStart
_0800B558:
	mov r1, sb
	adds r1, #0x77
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0800B578 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B57C @ =sub_800B7D0
	str r0, [r1, #8]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B578: .4byte gCurTask
_0800B57C: .4byte sub_800B7D0

	thumb_func_start sub_800B580
sub_800B580: @ 0x0800B580
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _0800B59C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bls _0800B590
	b _0800B6FA
_0800B590:
	lsls r0, r0, #2
	ldr r1, _0800B5A0 @ =_0800B5A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B59C: .4byte gUnknown_030054CC
_0800B5A0: .4byte _0800B5A4
_0800B5A4: @ jump table
	.4byte _0800B5BC @ case 0
	.4byte _0800B5BC @ case 1
	.4byte _0800B5BC @ case 2
	.4byte _0800B62C @ case 3
	.4byte _0800B62C @ case 4
	.4byte _0800B6C4 @ case 5
_0800B5BC:
	cmp r2, #0
	bne _0800B5C2
	b _0800B6FA
_0800B5C2:
	adds r3, r4, #0
	adds r3, #0x76
	ldrb r0, [r3]
	cmp r0, #0
	bne _0800B5F4
	ldr r2, _0800B5EC @ =gUnknown_080D51C6
	ldr r3, _0800B5F0 @ =gUnknown_030054F0
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	movs r1, #0
	ldrsb r1, [r3, r1]
	b _0800B60A
	.align 2, 0
_0800B5EC: .4byte gUnknown_080D51C6
_0800B5F0: .4byte gUnknown_030054F0
_0800B5F4:
	ldr r2, _0800B628 @ =gUnknown_080D5178
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r1, [r3]
_0800B60A:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_8004558
	b _0800B6FA
	.align 2, 0
_0800B628: .4byte gUnknown_080D5178
_0800B62C:
	ldr r3, _0800B6AC @ =gUnknown_03005590
	cmp r2, #0
	bne _0800B63C
	ldr r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0800B6FA
_0800B63C:
	ldr r0, _0800B6B0 @ =gUnknown_080D51E4
	ldr r1, [r3]
	lsrs r1, r1, #5
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	cmp r1, #0xd
	bne _0800B680
	ldr r5, _0800B6B4 @ =gUnknown_080D51F4
	ldr r0, _0800B6B8 @ =gUnknown_03005434
	ldr r2, [r0]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _0800B6BC @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #6
	bne _0800B680
	cmp r1, #8
	bne _0800B680
	lsrs r0, r2, #2
	movs r1, #3
	bl __umodsi3
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
_0800B680:
	adds r0, r4, #0
	adds r0, #0x76
	strb r1, [r0]
	ldr r2, _0800B6C0 @ =gUnknown_080D5178
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r3, r4, #0
	adds r3, #0x46
	strh r1, [r3]
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
	b _0800B6FA
	.align 2, 0
_0800B6AC: .4byte gUnknown_03005590
_0800B6B0: .4byte gUnknown_080D51E4
_0800B6B4: .4byte gUnknown_080D51F4
_0800B6B8: .4byte gUnknown_03005434
_0800B6BC: .4byte gUnknown_030055B4
_0800B6C0: .4byte gUnknown_080D5178
_0800B6C4:
	cmp r2, #0
	beq _0800B6FA
	ldr r2, _0800B700 @ =gUnknown_080D5178
	adds r3, r4, #0
	adds r3, #0x76
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	strb r1, [r0]
	subs r0, #0x20
	bl sub_8004558
_0800B6FA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B700: .4byte gUnknown_080D5178

	thumb_func_start sub_800B704
sub_800B704: @ 0x0800B704
	push {r4, lr}
	ldr r0, _0800B730 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, _0800B734 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800B738
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800B738
	adds r0, r4, #0
	bl sub_800B828
	b _0800B778
	.align 2, 0
_0800B730: .4byte gCurTask
_0800B734: .4byte gUnknown_030054CC
_0800B738:
	adds r0, r4, #0
	bl sub_800B8F4
	cmp r0, #0
	beq _0800B74A
	adds r0, r4, #0
	bl sub_800B1AC
	b _0800B752
_0800B74A:
	adds r0, r4, #0
	movs r1, #0
	bl sub_800B580
_0800B752:
	adds r0, r4, #0
	bl sub_800B8AC
	cmp r0, #0
	beq _0800B770
	ldr r1, [r4]
	ldrb r0, [r4, #8]
	strb r0, [r1]
	ldr r0, _0800B76C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800B778
	.align 2, 0
_0800B76C: .4byte gCurTask
_0800B770:
	adds r0, r4, #0
	movs r1, #0
	bl sub_800B860
_0800B778:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B780
sub_800B780: @ 0x0800B780
	push {r4, lr}
	ldr r0, _0800B7A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x77
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0800B7AC
	adds r0, r4, #0
	bl sub_800B23C
	b _0800B7BA
	.align 2, 0
_0800B7A8: .4byte gCurTask
_0800B7AC:
	ldr r2, _0800B7C8 @ =IWRAM_START + 0x74
	adds r1, r3, r2
	ldr r2, _0800B7CC @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0800B7BA:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800B860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B7C8: .4byte IWRAM_START + 0x74
_0800B7CC: .4byte 0xFFFFFF00

	thumb_func_start sub_800B7D0
sub_800B7D0: @ 0x0800B7D0
	push {r4, lr}
	ldr r4, _0800B7F8 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x77
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _0800B7FC
	ldr r0, [r4]
	bl TaskDestroy
	b _0800B804
	.align 2, 0
_0800B7F8: .4byte gCurTask
_0800B7FC:
	adds r0, r3, #0
	movs r1, #1
	bl sub_800B860
_0800B804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800B80C
sub_800B80C: @ 0x0800B80C
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl sub_8007CF0
	ldr r0, [r4, #0x40]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_800B828
sub_800B828: @ 0x0800B828
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x96
	bl m4aSongNumStart
	ldr r0, [r4, #0x6c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x70]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_800B9B8
	adds r4, #0x77
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800B858 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B85C @ =sub_800B950
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B858: .4byte gCurTask
_0800B85C: .4byte sub_800B950

	thumb_func_start sub_800B860
sub_800B860: @ 0x0800B860
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x6c]
	ldr r2, _0800B8A8 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r3, r3, r0
	strh r3, [r4, #0x22]
	ldr r0, [r4, #0x70]
	ldr r2, [r2, #4]
	subs r0, r0, r2
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x52
	strh r3, [r0]
	adds r0, #0x22
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	cmp r1, #0
	bne _0800B89A
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_80051E8
_0800B89A:
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B8A8: .4byte gUnknown_03005960

	thumb_func_start sub_800B8AC
sub_800B8AC: @ 0x0800B8AC
	push {lr}
	ldr r1, [r0, #0x6c]
	ldr r3, _0800B8E8 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x70]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0800B8E4
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0800B8E4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800B8EC
_0800B8E4:
	movs r0, #1
	b _0800B8EE
	.align 2, 0
_0800B8E8: .4byte gUnknown_03005960
_0800B8EC:
	movs r0, #0
_0800B8EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800B8F4
sub_800B8F4: @ 0x0800B8F4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _0800B924 @ =gUnknown_030059E0
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800B93C
	adds r6, r4, #0
	adds r6, #0xc
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	adds r0, r6, #0
	bl sub_800C944
	adds r5, r0, #0
	cmp r5, #0
	beq _0800B928
	adds r1, r4, #0
	adds r1, #0x78
	movs r0, #1
	strb r0, [r1]
	b _0800B948
	.align 2, 0
_0800B924: .4byte gUnknown_030059E0
_0800B928:
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #0
	bne _0800B940
_0800B93C:
	movs r0, #0
	b _0800B948
_0800B940:
	adds r0, r4, #0
	adds r0, #0x78
	strb r5, [r0]
	movs r0, #1
_0800B948:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800B950
sub_800B950: @ 0x0800B950
	push {r4, lr}
	ldr r0, _0800B978 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x77
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0800B97C
	adds r0, r4, #0
	bl sub_800B9A0
	b _0800B98A
	.align 2, 0
_0800B978: .4byte gCurTask
_0800B97C:
	ldr r2, _0800B998 @ =IWRAM_START + 0x74
	adds r1, r3, r2
	ldr r2, _0800B99C @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_0800B98A:
	adds r0, r4, #0
	movs r1, #1
	bl sub_800B860
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800B998: .4byte IWRAM_START + 0x74
_0800B99C: .4byte 0xFFFFFF00

	thumb_func_start sub_800B9A0
sub_800B9A0: @ 0x0800B9A0
	adds r0, #0x77
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800B9B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800B9B4 @ =sub_800B7D0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0800B9B0: .4byte gCurTask
_0800B9B4: .4byte sub_800B7D0

	thumb_func_start sub_800B9B8
sub_800B9B8: @ 0x0800B9B8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BA3C @ =sub_800BA58
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	movs r6, #0
	str r6, [sp]
	movs r1, #0x30
	mov r2, sb
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r3, #0
	mov r8, r3
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BA40 @ =0x06011000
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	ldr r0, _0800BA44 @ =0x000001DD
	strh r0, [r1, #0xa]
	ldr r3, _0800BA48 @ =IWRAM_START + 0x20
	adds r0, r2, r3
	mov r3, r8
	strb r3, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BA4C @ =IWRAM_START + 0x21
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _0800BA50 @ =IWRAM_START + 0x22
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _0800BA54 @ =IWRAM_START + 0x25
	adds r2, r2, r3
	mov r0, r8
	strb r0, [r2]
	mov r3, sb
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sub_800BA58
_0800BA40: .4byte 0x06011000
_0800BA44: .4byte 0x000001DD
_0800BA48: .4byte IWRAM_START + 0x20
_0800BA4C: .4byte IWRAM_START + 0x21
_0800BA50: .4byte IWRAM_START + 0x22
_0800BA54: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BA58
sub_800BA58: @ 0x0800BA58
	push {r4, r5, r6, r7, lr}
	ldr r7, _0800BAA4 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x16]
	adds r5, r0, #0
	ldrh r6, [r4, #0x18]
	ldr r1, _0800BAA8 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800BA92
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r7]
	bl TaskDestroy
_0800BA92:
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAA4: .4byte gCurTask
_0800BAA8: .4byte gUnknown_03005960

	thumb_func_start sub_800BAAC
sub_800BAAC: @ 0x0800BAAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BB2C @ =sub_800BB44
	movs r2, #0x80
	lsls r2, r2, #6
	movs r6, #0
	str r6, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r0, #0
	mov r8, r0
	strh r6, [r1, #0x30]
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BB30 @ =0x06011F00
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	subs r0, #0xea
	strh r0, [r1, #0xa]
	ldr r2, _0800BB34 @ =IWRAM_START + 0x20
	adds r0, r3, r2
	mov r2, r8
	strb r2, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BB38 @ =IWRAM_START + 0x21
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0800BB3C @ =IWRAM_START + 0x22
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0800BB40 @ =IWRAM_START + 0x25
	adds r3, r3, r2
	mov r0, r8
	strb r0, [r3]
	movs r0, #0xc2
	lsls r0, r0, #0xc
	str r0, [r1, #0x10]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BB2C: .4byte sub_800BB44
_0800BB30: .4byte 0x06011F00
_0800BB34: .4byte IWRAM_START + 0x20
_0800BB38: .4byte IWRAM_START + 0x21
_0800BB3C: .4byte IWRAM_START + 0x22
_0800BB40: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BB44
sub_800BB44: @ 0x0800BB44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, _0800BCB8 @ =gUnknown_030059E0
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldrh r0, [r5, #0x16]
	subs r1, r1, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	ldrh r2, [r5, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldrh r1, [r5, #0x30]
	adds r1, #0x40
	strh r1, [r5, #0x30]
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	ldr r3, _0800BCBC @ =gUnknown_08097AA4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r0, r6
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r6, #0
	ldrsh r1, [r1, r6]
	muls r1, r2, r1
	asrs r1, r1, #0x16
	ldrh r2, [r5, #0x16]
	adds r1, r1, r2
	strh r1, [r5, #0x16]
	movs r6, #0x30
	ldrsh r1, [r5, r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r1, r0
	asrs r0, r0, #0x16
	ldrh r3, [r5, #0x18]
	adds r0, r0, r3
	strh r0, [r5, #0x18]
	ldrh r6, [r5, #0x18]
	mov r8, r6
	ldrh r0, [r5, #0x16]
	mov sl, r0
	movs r1, #0x16
	ldrsh r3, [r5, r1]
	adds r2, r3, #0
	subs r2, #8
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	adds r0, r6, #0
	adds r0, #0x38
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r2, r1
	bgt _0800BBE6
	adds r0, r3, #0
	adds r0, #8
	cmp r0, r1
	bge _0800BBF8
	cmp r2, r1
	blt _0800BCD8
_0800BBE6:
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800BCD8
_0800BBF8:
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r7, r2, #0x10
	adds r4, r7, #0
	subs r4, #0x10
	ldr r1, _0800BCB8 @ =gUnknown_030059E0
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r6, _0800BCC0 @ =gUnknown_03005AF0
	mov ip, r6
	mov r3, ip
	adds r3, #0x39
	movs r6, #0
	ldrsb r6, [r3, r6]
	adds r3, r0, r6
	mov sb, r2
	cmp r4, r3
	bgt _0800BC24
	cmp r7, r3
	bge _0800BC36
	cmp r4, r3
	blt _0800BCD8
_0800BC24:
	mov r0, ip
	adds r0, #0x3b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r4
	blt _0800BCD8
_0800BC36:
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800BCA8
	ldr r1, _0800BCC4 @ =gUnknown_030053F0
	ldrh r5, [r1]
	adds r0, r5, #1
	strh r0, [r1]
	ldr r0, _0800BCC8 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0800BC86
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0800BC86
	ldr r0, _0800BCCC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800BC86
	ldr r1, _0800BCD0 @ =gUnknown_03005448
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _0800BC7E
	movs r0, #0xff
_0800BC7E:
	strb r0, [r1]
	ldr r1, _0800BCD4 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_0800BC86:
	ldr r0, _0800BCCC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800BC9A
	ldr r1, _0800BCC4 @ =gUnknown_030053F0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0800BC9A
	movs r0, #0xff
	strh r0, [r1]
_0800BC9A:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	asrs r1, r2, #0x10
	bl sub_800AEA0
_0800BCA8:
	ldr r0, _0800BCB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800BCFE
	.align 2, 0
_0800BCB4: .4byte gCurTask
_0800BCB8: .4byte gUnknown_030059E0
_0800BCBC: .4byte gUnknown_08097AA4
_0800BCC0: .4byte gUnknown_03005AF0
_0800BCC4: .4byte gUnknown_030053F0
_0800BCC8: .4byte gUnknown_030055B4
_0800BCCC: .4byte gUnknown_030054CC
_0800BCD0: .4byte gUnknown_03005448
_0800BCD4: .4byte gUnknown_030054A8
_0800BCD8:
	ldr r2, _0800BD0C @ =gUnknown_03005960
	ldr r1, [r2]
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r2, #4]
	ldrh r0, [r5, #0x18]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	mov r3, sl
	strh r3, [r5, #0x16]
	mov r6, r8
	strh r6, [r5, #0x18]
_0800BCFE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD0C: .4byte gUnknown_03005960

	thumb_func_start sub_800BD10
sub_800BD10: @ 0x0800BD10
	push {r4, r5, r6, lr}
	ldr r0, _0800BD54 @ =gMPlayTable
	ldr r0, [r0]
	ldr r3, [r0]
	ldr r0, _0800BD58 @ =gUnknown_030054A8
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _0800BD24
	b _0800BEEA
_0800BD24:
	ldr r1, _0800BD5C @ =gUnknown_030059E0
	ldr r4, [r1, #0x20]
	movs r0, #0x80
	ands r4, r0
	adds r6, r1, #0
	cmp r4, #0
	beq _0800BD34
	b _0800BEEA
_0800BD34:
	ldrb r1, [r5, #1]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	bne _0800BD64
	ldr r0, _0800BD60 @ =gMPlayInfo_BGM
	bl MPlayStop
	movs r0, #0xff
	strb r0, [r5]
	ldrb r1, [r5, #1]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r5, #1]
	b _0800BEEA
	.align 2, 0
_0800BD54: .4byte gMPlayTable
_0800BD58: .4byte gUnknown_030054A8
_0800BD5C: .4byte gUnknown_030059E0
_0800BD60: .4byte gMPlayInfo_BGM
_0800BD64:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _0800BD7A
	bl sub_800BF74
	movs r0, #0xff
	strb r0, [r5]
	strh r4, [r5, #6]
	movs r0, #1
	strb r0, [r5, #5]
	b _0800BEEA
_0800BD7A:
	ldr r0, _0800BDA8 @ =gSongTable
	adds r1, r0, #0
	adds r1, #0xf8
	ldr r1, [r1]
	adds r4, r0, #0
	cmp r3, r1
	bne _0800BDB0
	ldr r0, _0800BDAC @ =gMPlayInfo_BGM
	ldr r2, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BDB0
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r1, r2
	cmp r1, #0
	bne _0800BDB0
	movs r0, #1
	strb r0, [r5, #5]
	strb r1, [r5, #2]
	strb r1, [r5, #3]
	b _0800BEEA
	.align 2, 0
_0800BDA8: .4byte gSongTable
_0800BDAC: .4byte gMPlayInfo_BGM
_0800BDB0:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0800BDC6
	movs r0, #0
	strb r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1f
	bl m4aSongNumStart
	b _0800BEEA
_0800BDC6:
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r3, r0
	bne _0800BDFC
	ldr r0, _0800BDF8 @ =gMPlayInfo_BGM
	ldr r1, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BDFC
	cmp r1, #0
	blt _0800BDFC
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800BDFC
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	bl m4aSongNumStop
	b _0800BEEA
	.align 2, 0
_0800BDF8: .4byte gMPlayInfo_BGM
_0800BDFC:
	ldr r1, _0800BE30 @ =0x00000CB8
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r3, r0
	beq _0800BE34
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	cmp r3, r0
	beq _0800BE34
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800BE34
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0800BE3C
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	b _0800BEB0
	.align 2, 0
_0800BE30: .4byte 0x00000CB8
_0800BE34:
	adds r2, r5, #0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800BE4C
_0800BE3C:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x1d
	bl m4aSongNumStart
	b _0800BEEA
_0800BE4C:
	ldrb r6, [r2, #3]
	cmp r6, #0
	beq _0800BE64
	strb r0, [r2, #3]
	movs r0, #1
	strb r0, [r2, #5]
	ldr r0, _0800BE60 @ =0x00000197
	bl m4aSongNumStart
	b _0800BEEA
	.align 2, 0
_0800BE60: .4byte 0x00000197
_0800BE64:
	ldrb r3, [r2, #1]
	movs r1, #0xf0
	ands r1, r3
	cmp r1, #0x10
	bne _0800BE94
	movs r1, #0xf
	ands r1, r3
	strb r1, [r2, #1]
	ldr r2, _0800BE8C @ =gUnknown_080D5204
	ldr r0, _0800BE90 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStart
	b _0800BEEA
	.align 2, 0
_0800BE8C: .4byte gUnknown_080D5204
_0800BE90: .4byte gUnknown_030055B4
_0800BE94:
	ldr r0, _0800BEBC @ =gMPlayInfo_BGM
	ldr r4, [r0, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0800BEA2
	cmp r4, #0
	bge _0800BEEA
_0800BEA2:
	cmp r1, #0x20
	bne _0800BEC4
	ldr r0, _0800BEC0 @ =gUnknown_080D5254
	ldrb r1, [r2, #1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_0800BEB0:
	bl m4aSongNumStart
	bl sub_800BF30
	b _0800BEEA
	.align 2, 0
_0800BEBC: .4byte gMPlayInfo_BGM
_0800BEC0: .4byte gUnknown_080D5254
_0800BEC4:
	ldr r2, _0800BEF0 @ =gUnknown_080D5204
	ldr r0, _0800BEF4 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xf
	ands r1, r3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl m4aSongNumStartOrContinue
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0800BEEA
	strb r6, [r5, #5]
	bl sub_800BF30
_0800BEEA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BEF0: .4byte gUnknown_080D5204
_0800BEF4: .4byte gUnknown_030055B4

	thumb_func_start sub_800BEF8
sub_800BEF8: @ 0x0800BEF8
	push {r4, lr}
	sub sp, #4
	ldr r0, _0800BF28 @ =sub_800BD10
	movs r2, #0x80
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r0, _0800BF2C @ =gUnknown_030054A8
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	strh r4, [r0, #6]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF28: .4byte sub_800BD10
_0800BF2C: .4byte gUnknown_030054A8

	thumb_func_start sub_800BF30
sub_800BF30: @ 0x0800BF30
	push {r4, lr}
	ldr r4, _0800BF6C @ =gMPlayInfo_BGM
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r4, #0
	movs r1, #0xff
	movs r2, #4
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	movs r1, #4
	bl m4aMPlayFadeIn
	ldr r0, _0800BF70 @ =gUnknown_030059E0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF64
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF6C: .4byte gMPlayInfo_BGM
_0800BF70: .4byte gUnknown_030059E0

	thumb_func_start sub_800BF74
sub_800BF74: @ 0x0800BF74
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	ldr r4, _0800BFA4 @ =gMPlayInfo_BGM
	lsrs r1, r1, #0x14
	adds r0, r4, #0
	bl m4aMPlayFadeOutTemporarily
	ldr r0, _0800BFA8 @ =gUnknown_030059E0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800BF9C
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	bl m4aMPlayTempoControl
_0800BF9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFA4: .4byte gMPlayInfo_BGM
_0800BFA8: .4byte gUnknown_030059E0

	thumb_func_start sub_800BFAC
sub_800BFAC: @ 0x0800BFAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	movs r7, #0
	ldr r1, [r0, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800BFD2
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800BFD6
_0800BFD2:
	movs r0, #0
	b _0800C054
_0800BFD6:
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r4, r3
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r4, #0
	ldrsb r4, [r6, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C004
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C010
	cmp r2, r1
	blt _0800C052
_0800C004:
	movs r0, #2
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C052
_0800C010:
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r0, r8
	adds r2, r0, r1
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r4, #1
	ldrsb r4, [r6, r4]
	adds r3, r0, r4
	cmp r2, r3
	bgt _0800C040
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C04C
	cmp r2, r3
	blt _0800C052
_0800C040:
	movs r0, #3
	ldrsb r0, [r6, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C052
_0800C04C:
	movs r0, #0x80
	lsls r0, r0, #0xc
	orrs r7, r0
_0800C052:
	adds r0, r7, #0
_0800C054:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C060
sub_800C060: @ 0x0800C060
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	movs r0, #0
	mov sl, r0
	mov ip, r0
	ldr r1, [r6, #0x28]
	subs r0, #1
	cmp r1, r0
	beq _0800C0AE
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C0B2
_0800C0AE:
	movs r0, #0
	b _0800C1F2
_0800C0B2:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800C0CC
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800C0CC
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
	movs r1, #1
	mov ip, r1
_0800C0CC:
	adds r0, r6, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r0, r3, r7
	lsls r2, r0, #8
	mov r0, sp
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r1, r0, r1
	cmp r2, r1
	bgt _0800C100
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	lsls r0, r0, #8
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C112
	cmp r2, r1
	blt _0800C1D4
_0800C100:
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #8
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C1D4
_0800C112:
	adds r2, r6, #0
	adds r2, #0x2d
	movs r4, #0
	ldrsb r4, [r2, r4]
	mov r1, r8
	adds r0, r4, r1
	lsls r3, r0, #8
	mov r0, sp
	movs r7, #1
	ldrsb r7, [r0, r7]
	lsls r1, r7, #8
	ldr r0, [r5, #0xc]
	adds r1, r0, r1
	mov sb, r2
	cmp r3, r1
	bgt _0800C14A
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	lsls r0, r0, #8
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C15C
	cmp r3, r1
	blt _0800C1D4
_0800C14A:
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	lsls r0, r0, #8
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C1D4
_0800C15C:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0800C1D4
	mov r2, sp
	ldrb r1, [r5, #0x17]
	rsbs r0, r1, #0
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #3]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	mov r0, sl
	orrs r0, r1
	mov sl, r0
	mov r1, ip
	cmp r1, #0
	bne _0800C18A
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
_0800C18A:
	str r6, [r5, #0x3c]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, _0800C1B4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C1B8
	adds r0, r6, #0
	adds r0, #0x2f
	movs r1, #0
	ldrsb r1, [r0, r1]
	add r1, r8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	b _0800C1CA
	.align 2, 0
_0800C1B4: .4byte gUnknown_03005424
_0800C1B8:
	mov r0, sb
	movs r1, #0
	ldrsb r1, [r0, r1]
	add r1, r8
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
_0800C1CA:
	lsls r1, r1, #8
	ldrb r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800C1F0
_0800C1D4:
	mov r1, ip
	cmp r1, #0
	beq _0800C1F0
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800C1F0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0800C1F0:
	mov r0, sl
_0800C1F2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C204
sub_800C204: @ 0x0800C204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sl, r1
	str r2, [sp]
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x2c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, ip
	adds r0, #0x90
	ldr r6, [r0]
	adds r1, r6, #0
	adds r1, #0xc
	str r1, [sp, #4]
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C30C
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r0
	cmp r1, r2
	beq _0800C30C
	lsls r0, r5, #0x10
	asrs r5, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x34
	adds r1, r1, r5
	ldr r1, [r1]
	mov r8, r0
	cmp r1, r2
	beq _0800C30C
	adds r3, r7, r4
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r6, sl
	adds r2, r6, r4
	mov r0, ip
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r6, [sp, #4]
	adds r5, r6, r5
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _0800C2A0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C2B2
	cmp r2, r1
	blt _0800C30C
_0800C2A0:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C30C
_0800C2B2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r5, [sp]
	adds r2, r5, r4
	mov r6, ip
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r5, r8
	asrs r0, r5, #0xd
	ldr r6, [sp, #4]
	adds r5, r6, r0
	adds r0, r5, #0
	adds r0, #0x2d
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _0800C2F6
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C308
	cmp r2, r1
	blt _0800C30C
_0800C2F6:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C30C
_0800C308:
	movs r0, #1
	b _0800C30E
_0800C30C:
	movs r0, #0
_0800C30E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C320
sub_800C320: @ 0x0800C320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x20]
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r7, ip
	adds r7, #0xc
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C406
	lsls r0, r3, #0x10
	asrs r2, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x28
	adds r1, r1, r2
	ldr r1, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r0
	cmp r1, r3
	beq _0800C406
	ldr r0, [r7, #0x30]
	cmp r0, r3
	beq _0800C406
	adds r3, r6, r2
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800C3A0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C3B2
	cmp r2, r1
	blt _0800C406
_0800C3A0:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C406
_0800C3B2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r6, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, sl
	adds r2, r0, r4
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r1, #0x35
	ldrsb r5, [r1, r7]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800C3EA
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C3FC
	cmp r2, r1
	blt _0800C406
_0800C3EA:
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C406
_0800C3FC:
	mov r0, r8
	bl sub_800CB18
	movs r0, #1
	b _0800C408
_0800C406:
	movs r0, #0
_0800C408:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C418
sub_800C418: @ 0x0800C418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, [sp, #0x18]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800C4F0
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r5, #1
	rsbs r5, r5, #0
	mov ip, r0
	cmp r1, r5
	beq _0800C4F0
	ldr r0, _0800C4EC @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	beq _0800C4F0
	adds r3, r0, #0
	ldr r0, [r3, #0x4c]
	cmp r0, r5
	beq _0800C4F0
	adds r4, r7, r4
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r6, r5
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r6, #0
	ldrsb r6, [r1, r6]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C48E
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C4A0
	cmp r2, r1
	blt _0800C4F0
_0800C48E:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C4F0
_0800C4A0:
	mov r1, ip
	asrs r0, r1, #0xd
	adds r4, r7, r0
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, r8
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C4D6
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C4E8
	cmp r2, r1
	blt _0800C4F0
_0800C4D6:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C4F0
_0800C4E8:
	movs r0, #1
	b _0800C4F2
	.align 2, 0
_0800C4EC: .4byte gUnknown_030056A4
_0800C4F0:
	movs r0, #0
_0800C4F2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C4FC
sub_800C4FC: @ 0x0800C4FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov sl, r1
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _0800C58C @ =gUnknown_030059E0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	lsls r1, r3, #3
	mov r0, sb
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C532
	b _0800C838
_0800C532:
	ldr r0, _0800C590 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r0, _0800C58C @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r0, #0x80
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _0800C550
	b _0800C838
_0800C550:
	ldr r0, _0800C594 @ =gUnknown_030054CC
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #2
	bls _0800C598
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C598
	mov r2, sl
	lsls r5, r2, #0x10
	asrs r5, r5, #0x10
	ldr r0, [sp]
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802DB14
	movs r0, #1
	b _0800C83A
	.align 2, 0
_0800C58C: .4byte gUnknown_030059E0
_0800C590: .4byte gCurTask
_0800C594: .4byte gUnknown_030054CC
_0800C598:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	beq _0800C5A4
	b _0800C73A
_0800C5A4:
	ldr r1, [r6, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C674
	ldr r1, [sp, #4]
	lsls r2, r1, #3
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r1, sl
	adds r3, r1, r5
	ldr r1, _0800C670 @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x34
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C5EC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C5FE
	cmp r3, r1
	blt _0800C674
_0800C5EC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C5FE:
	add r2, sb
	adds r0, r2, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp]
	adds r3, r0, r4
	ldr r1, _0800C670 @ =gUnknown_030059E0
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r3, r1
	bgt _0800C636
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C648
	cmp r3, r1
	blt _0800C674
_0800C636:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C648:
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #2
	bls _0800C666
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C666:
	ldr r0, _0800C670 @ =gUnknown_030059E0
	bl sub_800CB18
	b _0800C802
	.align 2, 0
_0800C670: .4byte gUnknown_030059E0
_0800C674:
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C73A
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, sl
	adds r3, r0, r5
	ldr r1, _0800C730 @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C6BC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C6CE
	cmp r3, r1
	blt _0800C73A
_0800C6BC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C73A
_0800C6CE:
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, [sp]
	adds r2, r1, r5
	ldr r1, _0800C730 @ =gUnknown_030059E0
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C70A
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C71C
	cmp r2, r3
	blt _0800C73A
_0800C70A:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C73A
_0800C71C:
	ldr r0, _0800C730 @ =gUnknown_030059E0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800C734
	mov r2, ip
	ldrb r0, [r2]
	b _0800C7E8
	.align 2, 0
_0800C730: .4byte gUnknown_030059E0
_0800C734:
	ldr r0, _0800C82C @ =gUnknown_030059E0
	bl sub_800CBA4
_0800C73A:
	ldr r0, _0800C830 @ =gUnknown_030056A4
	ldr r0, [r0]
	cmp r0, #0
	bne _0800C744
	b _0800C838
_0800C744:
	adds r3, r0, #0
	ldr r1, [r3, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C838
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r5, r1, r2
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	mov r0, sl
	adds r4, r0, r6
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r4, r1
	bgt _0800C78C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r4, r0
	cmp r0, r1
	bge _0800C79E
	cmp r4, r1
	blt _0800C838
_0800C78C:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r4
	blt _0800C838
_0800C79E:
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp]
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C7D2
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C7E4
	cmp r2, r1
	blt _0800C838
_0800C7D2:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C838
_0800C7E4:
	ldr r0, _0800C834 @ =gUnknown_030054CC
	ldrb r0, [r0]
_0800C7E8:
	cmp r0, #2
	bls _0800C802
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C802:
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	ldr r1, [sp]
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800B9B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802DB14
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8009530
	movs r0, #1
	b _0800C83A
	.align 2, 0
_0800C82C: .4byte gUnknown_030059E0
_0800C830: .4byte gUnknown_030056A4
_0800C834: .4byte gUnknown_030054CC
_0800C838:
	movs r0, #0
_0800C83A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800C84C
sub_800C84C: @ 0x0800C84C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov sb, r2
	movs r0, #0
	mov sl, r0
	ldr r4, _0800C898 @ =gUnknown_030059E0
	ldr r3, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	bne _0800C894
	ldr r0, [r5, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800C934
	adds r7, r4, #0
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	movs r0, #0x80
	ands r3, r0
	cmp r3, #0
	bne _0800C894
	ldr r0, [r6, #0x28]
	cmp r0, r1
	bne _0800C89C
_0800C894:
	movs r0, #0
	b _0800C936
	.align 2, 0
_0800C898: .4byte gUnknown_030059E0
_0800C89C:
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r2, r0, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C8D2
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C8E4
	cmp r2, r3
	blt _0800C934
_0800C8D2:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C934
_0800C8E4:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, sb
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C918
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C92A
	cmp r2, r1
	blt _0800C934
_0800C918:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800C934
_0800C92A:
	adds r0, r7, #0
	bl sub_800CBA4
	movs r0, #1
	mov sl, r0
_0800C934:
	mov r0, sl
_0800C936:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800C944
sub_800C944: @ 0x0800C944
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r3, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	ldr r7, _0800CA1C @ =gUnknown_030059E0
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CA0C
	ldr r0, [r6, #0x30]
	subs r1, #0x81
	cmp r0, r1
	beq _0800CA0C
	ldr r0, [r5, #0x28]
	cmp r0, r1
	beq _0800CA0C
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r3, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C9B0
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C9C2
	cmp r2, r3
	blt _0800CA0C
_0800C9B0:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800CA0C
_0800C9C2:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800C9F6
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CA08
	cmp r2, r1
	blt _0800CA0C
_0800C9F6:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CA0C
_0800CA08:
	movs r0, #1
	mov sb, r0
_0800CA0C:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CA1C: .4byte gUnknown_030059E0

	thumb_func_start sub_800CA20
sub_800CA20: @ 0x0800CA20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x20]
	mov r8, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r7, ip
	adds r7, #0xc
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800CB06
	lsls r0, r3, #0x10
	asrs r2, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x28
	adds r1, r1, r2
	ldr r1, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	mov sb, r0
	cmp r1, r3
	beq _0800CB06
	ldr r0, [r7, #0x28]
	cmp r0, r3
	beq _0800CB06
	adds r3, r6, r2
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r5, r4
	mov r1, r8
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x38
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800CAA0
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CAB2
	cmp r2, r1
	blt _0800CB06
_0800CAA0:
	mov r0, ip
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CB06
_0800CAB2:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r6, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r0, sl
	adds r2, r0, r4
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r1, #0x2d
	ldrsb r5, [r1, r7]
	adds r1, r0, r5
	cmp r2, r1
	bgt _0800CAEA
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CAFC
	cmp r2, r1
	blt _0800CB06
_0800CAEA:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r2
	blt _0800CB06
_0800CAFC:
	mov r0, r8
	bl sub_800CBA4
	movs r0, #1
	b _0800CB08
_0800CB06:
	movs r0, #0
_0800CB08:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CB18
sub_800CB18: @ 0x0800CB18
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0800CB38
	adds r3, r2, #0
	adds r3, #0x6d
	movs r1, #0
	movs r0, #8
	strb r0, [r3]
	strh r1, [r2, #0x10]
	strh r1, [r2, #0x12]
	b _0800CB8E
_0800CB38:
	ldr r0, _0800CB74 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CB58
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CB54
	ldr r0, _0800CB78 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CB58
_0800CB54:
	cmp r1, #0x1d
	bne _0800CB80
_0800CB58:
	ldrh r1, [r2, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	rsbs r1, r1, #0
	ldrh r0, [r2, #0x12]
	rsbs r0, r0, #0
	strh r0, [r2, #0x12]
	ldr r0, _0800CB7C @ =gUnknown_03005960
	ldr r0, [r0, #0x38]
	lsls r0, r0, #8
	subs r1, r1, r0
	strh r1, [r2, #0x10]
	b _0800CB8E
	.align 2, 0
_0800CB74: .4byte gUnknown_030055B4
_0800CB78: .4byte gUnknown_030054B0
_0800CB7C: .4byte gUnknown_03005960
_0800CB80:
	ldrh r1, [r2, #0x12]
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0800CB8E
	rsbs r0, r1, #0
	strh r0, [r2, #0x12]
_0800CB8E:
	ldr r0, _0800CBA0 @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r1, r2
	str r1, [r0, #0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0800CBA0: .4byte gUnknown_030059E0

	thumb_func_start sub_800CBA4
sub_800CBA4: @ 0x0800CBA4
	push {r4, r5, lr}
	mov ip, r0
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0800CBBA
	mov r2, ip
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _0800CBBE
_0800CBBA:
	movs r0, #0
	b _0800CCB0
_0800CBBE:
	movs r0, #0x78
	mov r2, ip
	strh r0, [r2, #0x2c]
	ldr r0, [r2, #0x20]
	movs r5, #0x80
	lsls r5, r5, #0x11
	ands r0, r5
	mov r4, ip
	adds r4, #0x37
	cmp r0, #0
	beq _0800CC10
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	ldr r1, _0800CC70 @ =0xFEFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0800CC74 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ands r0, r5
	cmp r0, #0
	bne _0800CC18
_0800CC10:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
_0800CC18:
	ldrb r0, [r4]
	movs r1, #0x7f
	ands r1, r0
	strb r1, [r4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0800CCA0
	ldr r2, _0800CC78 @ =gUnknown_030053F0
	ldrh r0, [r2]
	cmp r0, #0
	beq _0800CC80
	adds r4, r0, #0
	ldr r0, _0800CC7C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800CC44
	adds r0, r4, #0
	cmp r4, #0xa
	bls _0800CC42
	movs r0, #0xa
_0800CC42:
	adds r4, r0, #0
_0800CC44:
	mov r2, ip
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldr r0, _0800CC7C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800CC66
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800CC66:
	ldr r1, _0800CC78 @ =gUnknown_030053F0
	ldrh r0, [r1]
	subs r0, r0, r4
	strh r0, [r1]
	b _0800CCAE
	.align 2, 0
_0800CC70: .4byte 0xFEFFFFFF
_0800CC74: .4byte 0xFFFFCFFF
_0800CC78: .4byte gUnknown_030053F0
_0800CC7C: .4byte gUnknown_030054CC
_0800CC80:
	ldr r0, _0800CC9C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800CCAE
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	str r0, [r2, #0x20]
	b _0800CCAE
	.align 2, 0
_0800CC9C: .4byte gUnknown_03005424
_0800CCA0:
	movs r0, #0x77
	bl m4aSongNumStart
	ldrb r1, [r4]
	movs r0, #0xf6
	ands r0, r1
	strb r0, [r4]
_0800CCAE:
	movs r0, #1
_0800CCB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800CCB8
sub_800CCB8: @ 0x0800CCB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800CD00
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CD04
_0800CD00:
	movs r0, #0
	b _0800CDA2
_0800CD04:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CD20
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800CD20
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0800CD20:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_800CE94
	adds r2, r0, #0
	cmp r2, #0
	beq _0800CD58
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800CDA0
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	cmp r4, #0
	bne _0800CDA0
	cmp r6, #0
	bne _0800CDA0
	ldrh r0, [r5, #0x10]
	b _0800CD9E
_0800CD58:
	cmp r4, #0
	beq _0800CDA0
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800CDA0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
	str r2, [r5, #0x3c]
	ldr r0, _0800CDB0 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CD94
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CD90
	ldr r0, _0800CDB4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CD94
_0800CD90:
	cmp r1, #0x1d
	bne _0800CDA0
_0800CD94:
	ldr r0, _0800CDB8 @ =gUnknown_03005960
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
_0800CD9E:
	strh r0, [r5, #0x14]
_0800CDA0:
	adds r0, r2, #0
_0800CDA2:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CDB0: .4byte gUnknown_030055B4
_0800CDB4: .4byte gUnknown_030054B0
_0800CDB8: .4byte gUnknown_03005960

	thumb_func_start sub_800CDBC
sub_800CDBC: @ 0x0800CDBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800CE04
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800CE08
_0800CE04:
	movs r0, #0
	b _0800CE7A
_0800CE08:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800CE20
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0800CE20
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
_0800CE20:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_800CE94
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800CE46
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	b _0800CE78
_0800CE46:
	cmp r4, #0
	beq _0800CE78
	str r0, [r5, #0x3c]
	ldr r0, _0800CE88 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0800CE6C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0800CE68
	ldr r0, _0800CE8C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800CE6C
_0800CE68:
	cmp r1, #0x1d
	bne _0800CE78
_0800CE6C:
	ldr r0, _0800CE90 @ =gUnknown_03005960
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r5, #0x14]
	subs r0, r0, r1
	strh r0, [r5, #0x14]
_0800CE78:
	adds r0, r2, #0
_0800CE7A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CE88: .4byte gUnknown_030055B4
_0800CE8C: .4byte gUnknown_030054B0
_0800CE90: .4byte gUnknown_03005960

	thumb_func_start sub_800CE94
sub_800CE94: @ 0x0800CE94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	mov sl, r1
	str r2, [sp]
	adds r4, r3, #0
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	mov sb, r0
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [sp, #4]
	movs r5, #0
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r7, sl
	adds r2, r7, r3
	movs r6, #0
	ldrsb r6, [r4, r6]
	mov r0, sb
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800CEEC
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800CEFA
	cmp r2, r1
	bge _0800CEEC
	b _0800D086
_0800CEEC:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _0800CEFA
	b _0800D086
_0800CEFA:
	mov r1, ip
	adds r1, #0x2d
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r2, [sp]
	adds r3, r2, r6
	movs r0, #1
	ldrsb r0, [r4, r0]
	ldr r7, [sp, #4]
	adds r2, r7, r0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r3, r2
	bgt _0800CF2E
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r2
	bge _0800CF3E
	cmp r3, r2
	bge _0800CF2E
	b _0800D086
_0800CF2E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _0800CF3E
	b _0800D086
_0800CF3E:
	mov r0, ip
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r0, #2
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r2, r7, r6
	asrs r2, r2, #1
	add r2, sl
	ldr r3, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r3, r0]
	mov r3, ip
	adds r3, #0x2f
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [sp]
	adds r1, r1, r0
	mov ip, r1
	cmp r2, sb
	bgt _0800CF80
	mov r2, sl
	adds r0, r2, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xb
	b _0800CF90
_0800CF80:
	mov r1, sl
	adds r0, r1, r7
	movs r1, #2
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xc
_0800CF90:
	orrs r5, r0
	ldr r2, [sp, #4]
	cmp ip, r2
	ble _0800CFB8
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r7, [sp]
	adds r1, r7, r1
	movs r0, #3
	ldrsb r0, [r4, r0]
	adds r0, r2, r0
	subs r3, r1, r0
	adds r1, r3, #5
	cmp r1, #0
	ble _0800CFB2
	movs r1, #0
_0800CFB2:
	movs r0, #0x80
	lsls r0, r0, #9
	b _0800CFD4
_0800CFB8:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r1, r2, r3
	subs r3, r0, r1
	adds r1, r3, #2
	cmp r1, #0
	bge _0800CFD0
	movs r1, #0
_0800CFD0:
	movs r0, #0x80
	lsls r0, r0, #0xa
_0800CFD4:
	orrs r5, r0
	adds r2, r6, #0
	cmp r6, #0
	bge _0800CFDE
	rsbs r2, r6, #0
_0800CFDE:
	adds r0, r1, #0
	cmp r0, #0
	bge _0800CFE6
	rsbs r0, r0, #0
_0800CFE6:
	cmp r2, r0
	bge _0800CFF2
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r5, r0
	b _0800D04A
_0800CFF2:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r5, r0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r5
	cmp r0, #0
	beq _0800D04A
	ldr r0, _0800D01C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800D020
	mov r7, r8
	movs r1, #0x12
	ldrsh r0, [r7, r1]
	cmp r0, #0
	ble _0800D02A
_0800D018:
	movs r0, #0
	b _0800D088
	.align 2, 0
_0800D01C: .4byte gUnknown_03005424
_0800D020:
	mov r2, r8
	movs r7, #0x12
	ldrsh r0, [r2, r7]
	cmp r0, #0
	blt _0800D018
_0800D02A:
	mov r0, r8
	ldr r2, [r0, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _0800D04A
	mov r0, r8
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800D04A
	mov r1, r8
	strh r2, [r1, #0x14]
_0800D04A:
	lsls r0, r6, #8
	movs r2, #0xff
	lsls r2, r2, #8
	ands r0, r2
	movs r1, #0xff
	ands r3, r1
	orrs r0, r3
	orrs r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _0800D074
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _0800D078
	ldr r0, _0800D070 @ =0xFFF300FF
	b _0800D076
	.align 2, 0
_0800D070: .4byte 0xFFF300FF
_0800D074:
	ldr r0, _0800D098 @ =0xFFFF00FF
_0800D076:
	ands r5, r0
_0800D078:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r5
	cmp r0, #0
	bne _0800D086
	ldr r0, _0800D09C @ =0xFFFFFF00
	ands r5, r0
_0800D086:
	adds r0, r5, #0
_0800D088:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D098: .4byte 0xFFFF00FF
_0800D09C: .4byte 0xFFFFFF00

	thumb_func_start sub_800D0A0
sub_800D0A0: @ 0x0800D0A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x28]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #0x2c]
	ldr r7, _0800D1D8 @ =gUnknown_030059E0
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
	str r3, [sp, #0x30]
	movs r4, #0
	str r4, [sp, #0x34]
	ldr r0, _0800D1DC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r0, _0800D1E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0x16]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _0800D1E4 @ =IWRAM_START + 0x58
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
	cmp r1, r0
	beq _0800D1D2
	ldr r0, [r7, #0x20]
	movs r3, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0800D1D2
	ldr r4, [sp, #0x1c]
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	str r0, [sp, #0x40]
	cmp r2, r1
	bne _0800D1E8
	ldr r0, [sp, #0x20]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	cmp r1, r0
	bne _0800D1E8
_0800D1D2:
	movs r0, #0
	bl _0800DA38
	.align 2, 0
_0800D1D8: .4byte gUnknown_030059E0
_0800D1DC: .4byte gUnknown_03005424
_0800D1E0: .4byte gCurTask
_0800D1E4: .4byte IWRAM_START + 0x58
_0800D1E8:
	ldr r0, _0800D2CC @ =gUnknown_030059E0
	ldr r1, [r0, #8]
	mov sb, r1
	ldr r2, [r0, #0xc]
	str r2, [sp, #0x38]
	adds r1, r0, #0
	adds r1, #0x38
	adds r6, r0, #0
	ldr r3, [sp, #0x28]
	ldrb r1, [r1]
	cmp r3, r1
	beq _0800D204
	bl _0800DA36
_0800D204:
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D222
	ldr r0, [r6, #0x3c]
	ldr r4, [sp, #0x18]
	cmp r0, r4
	bne _0800D222
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	movs r0, #1
	str r0, [sp, #0x34]
_0800D222:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	ldr r2, [sp, #0x38]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _0800D236
	b _0800D580
_0800D236:
	ldr r3, [sp, #0x40]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r4, sb
	asrs r0, r4, #8
	mov r1, sp
	movs r4, #8
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov ip, r0
	cmp r2, r1
	bgt _0800D264
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D274
	cmp r2, r1
	bge _0800D264
	b _0800D580
_0800D264:
	mov r3, sp
	movs r0, #0xa
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D274
	b _0800D580
_0800D274:
	asrs r0, r7, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, sp
	movs r4, #9
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800D29C
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800D2AC
	cmp r2, r1
	bge _0800D29C
	b _0800D580
_0800D29C:
	mov r3, sp
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _0800D2AC
	b _0800D580
_0800D2AC:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D2D0
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D2BA
	b _0800D440
_0800D2BA:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D440
	.align 2, 0
_0800D2CC: .4byte gUnknown_030059E0
_0800D2D0:
	asrs r0, r7, #0x10
	cmp r8, r0
	bgt _0800D2D8
	b _0800D43A
_0800D2D8:
	movs r3, #0x12
	ldrsh r1, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	cmp r1, #0
	bge _0800D2EA
	b _0800D43A
_0800D2EA:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _0800D38E
	asrs r0, r7, #0x10
	movs r1, #1
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D35C @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D360 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D364
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	mov r5, sp
	ldrh r5, [r5, #0x3c]
	strh r5, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D35C: .4byte 0xFFFFFF00
_0800D360: .4byte sub_801EC3C
_0800D364:
	movs r0, #8
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	ldr r1, [r6, #0x20]
	orrs r1, r0
	subs r0, #0xb
	ands r1, r0
	str r1, [r6, #0x20]
	ldr r2, [sp, #0x18]
	str r2, [r6, #0x3c]
	mov r3, sp
	ldrh r3, [r3, #0x3c]
	strh r3, [r6, #0x12]
	ldr r4, [sp, #0x38]
	str r4, [r6, #0xc]
	ldr r5, [sp, #0x34]
	cmp r5, #0
	beq _0800D38C
	b _0800DA1E
_0800D38C:
	b _0800D426
_0800D38E:
	asrs r0, r7, #0x10
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	mov r2, sp
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _0800D3F8 @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r3, [sp, #0x38]
	adds r3, r3, r0
	str r3, [sp, #0x38]
	asrs r0, r3, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, _0800D3FC @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D400
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r4, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D3F8: .4byte 0xFFFFFF00
_0800D3FC: .4byte sub_801EC3C
_0800D400:
	movs r1, #8
	ldr r4, [sp, #0x30]
	orrs r4, r1
	str r4, [sp, #0x30]
	ldr r0, [r6, #0x20]
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r5, [sp, #0x18]
	str r5, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r0, [sp, #0x38]
	str r0, [r6, #0xc]
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800D426
	b _0800DA1E
_0800D426:
	adds r0, r6, #0
	bl sub_8021BE0
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	b _0800DA18
_0800D43A:
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	bne _0800D460
_0800D440:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D458
	movs r3, #0x12
	ldrsh r0, [r6, r3]
	ldr r4, [sp, #0x24]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
_0800D458:
	ldr r5, [sp, #0x3c]
	cmp r5, #0
	bne _0800D460
	b _0800D580
_0800D460:
	asrs r0, r7, #0x10
	cmp r8, r0
	ble _0800D468
	b _0800D580
_0800D468:
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	ldr r3, [sp, #0x24]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	str r2, [sp, #0x44]
	cmp r0, #0
	blt _0800D47C
	b _0800D580
_0800D47C:
	ldr r4, [sp, #0x3c]
	cmp r4, #0
	bne _0800D500
	ldr r5, _0800D4CC @ =gUnknown_030059E0
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	add r0, r8
	ldr r1, _0800D4D0 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D4D4
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x3c]
	strh r0, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D4DC
	.align 2, 0
_0800D4CC: .4byte gUnknown_030059E0
_0800D4D0: .4byte sub_801EC3C
_0800D4D4:
	mov r1, sb
	str r1, [r5, #8]
	ldr r2, [sp, #0x38]
	str r2, [r5, #0xc]
_0800D4DC:
	ldr r0, _0800D4FC @ =gUnknown_030059E0
	movs r3, #0x12
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0x44]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D4FC: .4byte gUnknown_030059E0
_0800D500:
	ldr r5, _0800D54C @ =gUnknown_030059E0
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	mov r1, r8
	subs r0, r1, r0
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _0800D550 @ =sub_801EC3C
	str r1, [sp]
	mov r1, ip
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D554
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r1, [r5, #0x12]
	lsls r1, r4, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	b _0800D55C
	.align 2, 0
_0800D54C: .4byte gUnknown_030059E0
_0800D550: .4byte sub_801EC3C
_0800D554:
	mov r2, sb
	str r2, [r5, #8]
	ldr r3, [sp, #0x38]
	str r3, [r5, #0xc]
_0800D55C:
	ldr r0, _0800D57C @ =gUnknown_030059E0
	movs r4, #0x12
	ldrsh r1, [r0, r4]
	ldr r5, [sp, #0x44]
	asrs r2, r5, #0x10
	adds r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _0800D580
	movs r0, #0x80
	lsls r0, r0, #9
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	b _0800DA18
	.align 2, 0
_0800D57C: .4byte gUnknown_030059E0
_0800D580:
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
	beq _0800D598
	b _0800DA18
_0800D598:
	ldr r2, [sp, #0x40]
	asrs r0, r2, #0x10
	mov r3, sp
	movs r4, #0xc
	ldrsb r4, [r3, r4]
	adds r3, r0, r4
	mov r5, sb
	asrs r1, r5, #8
	add r0, sp, #4
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r1, r5
	mov ip, r1
	cmp r3, r2
	bgt _0800D5CA
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _0800D5DC
	cmp r3, r2
	bge _0800D5CA
	b _0800DA18
_0800D5CA:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800D5DC
	b _0800DA18
_0800D5DC:
	asrs r0, r7, #0x10
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
	bgt _0800D608
	mov r5, sp
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _0800D61A
	cmp r1, r3
	bge _0800D608
	b _0800DA18
_0800D608:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800D61A
	b _0800DA18
_0800D61A:
	ldr r0, [sp, #0x40]
	asrs r1, r0, #0x10
	cmp ip, r1
	ble _0800D624
	b _0800D818
_0800D624:
	ldr r3, [r6, #0x20]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _0800D630
	b _0800D794
_0800D630:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r4, [sp, #0x30]
	orrs r4, r0
	str r4, [sp, #0x30]
	adds r7, r6, #0
	adds r7, #0x62
	movs r5, #0
	ldrsb r5, [r7, r5]
	cmp r5, #0
	beq _0800D64A
	strh r2, [r6, #0x10]
	b _0800DA18
_0800D64A:
	mov r2, sp
	movs r0, #0xc
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _0800D66A
	rsbs r1, r1, #0
_0800D66A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D6E0
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r5, [sp, #0x30]
	orrs r5, r0
	str r5, [sp, #0x30]
	mov r1, sl
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _0800D6CA
	ldr r2, [sp, #0x2c]
	cmp r2, #0
	beq _0800D6B8
	movs r4, #0
	strh r1, [r6, #0x14]
	mov r3, sl
	strh r3, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D6B4 @ =sub_8025318
	str r0, [r6]
	adds r0, r6, #0
	b _0800DA00
	.align 2, 0
_0800D6B4: .4byte sub_8025318
_0800D6B8:
	mov r4, sl
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r0, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	str r0, [r6, #8]
	b _0800DA18
_0800D6CA:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0x20]
	ldr r0, _0800D6DC @ =0x0000FE80
	strh r0, [r6, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r6, #0x12]
	b _0800DA18
	.align 2, 0
_0800D6DC: .4byte 0x0000FE80
_0800D6E0:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _0800D6EA
	b _0800DA18
_0800D6EA:
	mov r2, sb
	asrs r0, r2, #8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	mov r3, r8
	subs r1, r3, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _0800D734 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D738
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r5, [r6, #0x10]
	lsls r1, r4, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	b _0800DA18
	.align 2, 0
_0800D734: .4byte sub_801EB44
_0800D738:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D770
	movs r0, #0x20
	orrs r1, r0
	ldr r4, [sp, #0x30]
	orrs r4, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r6, #0x20]
	ands r4, r0
	str r4, [sp, #0x30]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D790 @ =sub_8025318
	str r0, [r6]
_0800D770:
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [sp, #0x30]
	ands r0, r1
	str r0, [sp, #0x30]
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x10]
	mov r1, sb
	str r1, [r6, #8]
	ldr r2, [sp, #0x38]
	str r2, [r6, #0xc]
	b _0800DA18
	.align 2, 0
_0800D790: .4byte sub_8025318
_0800D794:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ldr r3, [sp, #0x30]
	orrs r3, r0
	str r3, [sp, #0x30]
	adds r5, r6, #0
	adds r5, #0x62
	movs r3, #0
	ldrsb r3, [r5, r3]
	cmp r3, #0
	beq _0800D7B0
	movs r0, #0
	strh r0, [r6, #0x10]
	b _0800DA18
_0800D7B0:
	mov r4, sl
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D7BE
	rsbs r2, r1, #0
_0800D7BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _0800D7C8
	b _0800DA18
_0800D7C8:
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	blt _0800D7D8
	b _0800DA14
_0800D7D8:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D810
	movs r4, #0
	mov r0, sl
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x10]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D80C @ =sub_8025318
	str r0, [r6]
	adds r0, r6, #0
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r5]
	b _0800DA18
	.align 2, 0
_0800D80C: .4byte sub_8025318
_0800D810:
	adds r0, r6, #0
	bl sub_800DE44
	b _0800DA18
_0800D818:
	adds r5, r6, #0
	ldr r3, [r5, #0x20]
	movs r7, #1
	adds r2, r3, #0
	ands r2, r7
	cmp r2, #0
	bne _0800D828
	b _0800D998
_0800D828:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	ldr r4, _0800D844 @ =gUnknown_03005A42
	movs r6, #0
	ldrsb r6, [r4, r6]
	cmp r6, #0
	beq _0800D848
	movs r0, #0
	strh r0, [r5, #0x10]
	b _0800DA18
	.align 2, 0
_0800D844: .4byte gUnknown_03005A42
_0800D848:
	mov r2, sp
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	mov sb, r0
	movs r4, #0x10
	ldrsh r1, [r5, r4]
	cmp r1, #0
	bge _0800D868
	rsbs r1, r1, #0
_0800D868:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800D8E8
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r1, [sp, #0x30]
	orrs r1, r0
	str r1, [sp, #0x30]
	mov r2, sl
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800D8D4
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800D8C0
	movs r4, #0
	strh r2, [r5, #0x14]
	mov r0, sl
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D8B8 @ =sub_8025318
	str r0, [r5]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	ldr r1, _0800D8BC @ =gUnknown_03005A42
	strb r4, [r1]
	b _0800DA18
	.align 2, 0
_0800D8B8: .4byte sub_8025318
_0800D8BC: .4byte gUnknown_03005A42
_0800D8C0:
	mov r2, sl
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r3, _0800D8D0 @ =0xFFFFFF00
	adds r0, r0, r3
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D8D0: .4byte 0xFFFFFF00
_0800D8D4:
	movs r0, #2
	orrs r3, r0
	str r3, [r5, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0800DA18
_0800D8E8:
	movs r4, #0x10
	ldrsh r0, [r5, r4]
	cmp r0, #0
	bne _0800D8F2
	b _0800DA18
_0800D8F2:
	mov r1, sb
	asrs r0, r1, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	add r1, r8
	ldr r2, _0800D938 @ =sub_801EB44
	str r2, [sp]
	ldr r2, [sp, #0x28]
	movs r3, #8
	bl sub_801F100
	adds r4, r0, #0
	cmp r4, #0
	bge _0800D93C
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x10]
	lsls r1, r4, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	b _0800DA18
	.align 2, 0
_0800D938: .4byte sub_801EB44
_0800D93C:
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800D974
	movs r0, #0x20
	orrs r1, r0
	ldr r2, [sp, #0x30]
	orrs r2, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r5, #0x20]
	ands r2, r0
	str r2, [sp, #0x30]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800D994 @ =sub_8025318
	str r0, [r5]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
_0800D974:
	ldr r0, [r5, #0x20]
	orrs r0, r7
	str r0, [r5, #0x20]
	ldr r3, [sp, #0x30]
	orrs r3, r7
	str r3, [sp, #0x30]
	strh r6, [r5, #0x14]
	strh r6, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	str r0, [r5, #8]
	ldr r4, [sp, #0x38]
	str r4, [r5, #0xc]
	b _0800DA18
	.align 2, 0
_0800D994: .4byte sub_8025318
_0800D998:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r5, #0x20]
	adds r7, r5, #0
	adds r7, #0x62
	movs r3, #0
	ldrsb r3, [r7, r3]
	cmp r3, #0
	beq _0800D9B0
	strh r2, [r5, #0x10]
	b _0800DA18
_0800D9B0:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, #0
	cmp r1, #0
	bge _0800D9BE
	rsbs r2, r1, #0
_0800D9BE:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	ble _0800DA18
	movs r0, #0x80
	lsls r0, r0, #0xe
	ldr r2, [sp, #0x30]
	orrs r2, r0
	str r2, [sp, #0x30]
	cmp r1, #0
	ble _0800DA14
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _0800DA0C
	movs r4, #0
	mov r0, sl
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _0800DA08 @ =sub_8025318
	str r0, [r5]
	adds r0, r5, #0
_0800DA00:
	adds r0, #0x61
	strb r4, [r0]
	strb r4, [r7]
	b _0800DA18
	.align 2, 0
_0800DA08: .4byte sub_8025318
_0800DA0C:
	adds r0, r5, #0
	bl sub_800DE44
	b _0800DA18
_0800DA14:
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x10]
_0800DA18:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0800DA36
_0800DA1E:
	ldr r2, _0800DA48 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DA36
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_0800DA36:
	ldr r0, [sp, #0x30]
_0800DA38:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA48: .4byte gUnknown_030059E0

	thumb_func_start sub_800DA4C
sub_800DA4C: @ 0x0800DA4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r2, _0800DAB0 @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800DAAA
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	bne _0800DAAA
	ldr r1, _0800DAB4 @ =gUnknown_030055A0
	ldr r0, _0800DAB8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	mov sb, r6
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r4, r0
	beq _0800DABC
_0800DAAA:
	movs r0, #0
	b _0800DD44
	.align 2, 0
_0800DAB0: .4byte gUnknown_030059E0
_0800DAB4: .4byte gUnknown_030055A0
_0800DAB8: .4byte 0x04000128
_0800DABC:
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _0800DB70
	ldr r1, [r5, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800DB70
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	ldr r7, _0800DC50 @ =IWRAM_START + 0x50
	adds r0, r3, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r7, _0800DC54 @ =IWRAM_START + 0x2C
	adds r0, r3, r7
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	cmp r2, r1
	bgt _0800DB08
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB1A
	cmp r2, r1
	blt _0800DB70
_0800DB08:
	ldr r4, _0800DC58 @ =IWRAM_START + 0x2E
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB1A:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0800DB56
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DB68
	cmp r2, r1
	blt _0800DB70
_0800DB56:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DB70
_0800DB68:
	movs r0, #2
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DB70:
	ldr r0, [r6, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0800DB7C
	b _0800DC8C
_0800DB7C:
	ldr r0, [r5, #0x28]
	cmp r0, r1
	bne _0800DB84
	b _0800DC8C
_0800DB84:
	ldr r4, [sp]
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	adds r0, r5, #0
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r1, r7
	mov r2, sb
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	cmp r4, r1
	bgt _0800DBC8
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r4, r0
	cmp r0, r1
	bge _0800DBDC
	cmp r4, r1
	blt _0800DC8C
_0800DBC8:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r4
	blt _0800DC8C
_0800DBDC:
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r4, r0, r1
	mov r1, sb
	adds r1, #0x52
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r3, #0x35
	ldrsb r7, [r3, r6]
	mov ip, r7
	adds r3, r0, r7
	mov sl, r2
	adds r2, r1, #0
	cmp r4, r3
	bgt _0800DC20
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r4, r0
	cmp r0, r3
	bge _0800DC34
	cmp r4, r3
	blt _0800DC8C
_0800DC20:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _0800DC8C
_0800DC34:
	ldr r0, [sp, #8]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0xc]
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC5C
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC66
	.align 2, 0
_0800DC50: .4byte IWRAM_START + 0x50
_0800DC54: .4byte IWRAM_START + 0x2C
_0800DC58: .4byte IWRAM_START + 0x2E
_0800DC5C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC66:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r4, sl
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _0800DC7E
	movs r0, #0x80
	lsls r0, r0, #9
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0800DC88
_0800DC7E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0800DC88:
	movs r0, #1
	b _0800DD3C
_0800DC8C:
	ldr r0, [r6, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0800DD42
	ldr r0, [r5, #0x30]
	cmp r0, r1
	beq _0800DD42
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r3, r0, r2
	mov r0, sb
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r6, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r3, r1
	bgt _0800DCD8
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	bge _0800DCEA
	cmp r3, r1
	blt _0800DD42
_0800DCD8:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r3
	blt _0800DD42
_0800DCEA:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r3, r6, #0
	adds r3, #0x2d
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r2, r1
	bgt _0800DD28
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0800DD3A
	cmp r2, r1
	blt _0800DD42
_0800DD28:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0800DD42
_0800DD3A:
	movs r0, #2
_0800DD3C:
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_0800DD42:
	mov r0, r8
_0800DD44:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_800DD54
sub_800DD54: @ 0x0800DD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DD68
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DD6C
_0800DD68:
	movs r0, #0
	b _0800DE2A
_0800DD6C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DD80
	movs r0, #0xc0
	lsls r0, r0, #1
	b _0800DD82
_0800DD80:
	ldr r0, _0800DE30 @ =0x0000FE80
_0800DD82:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DDA2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DDA2:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DE34 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DE38 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0800DE3C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DE22
	ldr r6, _0800DE40 @ =gUnknown_030053F0
	ldrh r4, [r6]
	cmp r4, #0xa
	bls _0800DE04
	movs r4, #0xa
_0800DE04:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DE22:
	movs r0, #0x77
	bl m4aSongNumStart
	movs r0, #1
_0800DE2A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DE30: .4byte 0x0000FE80
_0800DE34: .4byte 0xFFFFFBFF
_0800DE38: .4byte 0xFFFFFEFF
_0800DE3C: .4byte gUnknown_030054CC
_0800DE40: .4byte gUnknown_030053F0

	thumb_func_start sub_800DE44
sub_800DE44: @ 0x0800DE44
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0800DE58
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0800DE5C
_0800DE58:
	movs r0, #0
	b _0800DF20
_0800DE5C:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DE74
	ldr r0, _0800DE70 @ =0x0000FE80
	b _0800DE78
	.align 2, 0
_0800DE70: .4byte 0x0000FE80
_0800DE74:
	movs r0, #0xc0
	lsls r0, r0, #1
_0800DE78:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r2, #0xfd
	lsls r2, r2, #8
	strh r2, [r5, #0x12]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800DE98
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r5, #0x10]
_0800DE98:
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _0800DF28 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _0800DF2C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0800DF30 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _0800DF18
	ldr r6, _0800DF34 @ =gUnknown_030053F0
	ldrh r4, [r6]
	cmp r4, #5
	bls _0800DEFA
	movs r4, #5
_0800DEFA:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_801FD34
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_8019224
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0800DF18:
	movs r0, #0x77
	bl m4aSongNumStart
	movs r0, #1
_0800DF20:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DF28: .4byte 0xFFFFFBFF
_0800DF2C: .4byte 0xFFFFFEFF
_0800DF30: .4byte gUnknown_030054CC
_0800DF34: .4byte gUnknown_030053F0

	thumb_func_start sub_800DF38
sub_800DF38: @ 0x0800DF38
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldrb r5, [r4, #0x16]
	rsbs r0, r5, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r4, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl memcpy
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r4, #0
	bl sub_800BFAC
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800DF8C
sub_800DF8C: @ 0x0800DF8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0800DFB0 @ =0x00200080
	ands r0, r1
	cmp r0, #0
	beq _0800DFB4
	movs r0, #0
	movs r1, #0
	bl sub_800E0C0
	b _0800E0AE
	.align 2, 0
_0800DFB0: .4byte 0x00200080
_0800DFB4:
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	adds r0, r1, #0
	bl sub_800E0C0
	adds r0, r4, #0
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800E0AE
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _0800E050 @ =gUnknown_08C871D4
	adds r1, r4, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp]
	ldr r5, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800E0AE
	ldrb r6, [r5]
	adds r5, #1
	ldrb r1, [r5]
	mov r8, r1
	adds r5, #1
	adds r2, r4, #0
	adds r2, #0x71
	ldrb r0, [r2]
	cmp r0, r8
	beq _0800E0AE
	str r2, [sp, #8]
_0800E002:
	ldr r0, _0800E054 @ =gUnknown_030055D4
	ldrb r4, [r0]
	cmp r6, #0
	beq _0800E07A
	movs r2, #0xff
	mov sl, r2
	movs r0, #0x1f
	mov sb, r0
_0800E012:
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #1
	adds r0, r0, r6
	adds r0, r0, r5
	ldrb r1, [r0]
	mov ip, r1
	ldrb r7, [r0, #1]
	ldrb r1, [r0, #2]
	mov r2, sl
	ands r1, r2
_0800E02A:
	lsls r0, r4, #2
	ldr r2, _0800E058 @ =gUnknown_030055E0
	adds r0, r0, r2
	ldrb r3, [r0]
	ands r3, r7
	ldrb r2, [r0, #1]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r1, sl
	ands r2, r1
	cmp r0, r2
	blt _0800E06C
	cmp ip, r3
	bne _0800E05C
	subs r4, #1
	mov r2, sb
	ands r4, r2
	b _0800E072
	.align 2, 0
_0800E050: .4byte gUnknown_08C871D4
_0800E054: .4byte gUnknown_030055D4
_0800E058: .4byte gUnknown_030055E0
_0800E05C:
	subs r4, #1
	mov r1, sb
	ands r4, r1
	subs r0, #1
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0800E02A
_0800E06C:
	movs r2, #0
	cmp r2, #0
	beq _0800E076
_0800E072:
	cmp r6, #0
	bne _0800E012
_0800E076:
	cmp r6, #0
	bne _0800E082
_0800E07A:
	mov r1, r8
	ldr r0, [sp, #8]
	strb r1, [r0]
	b _0800E0AE
_0800E082:
	ldr r0, [sp, #4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r0, #2
	ldr r2, [sp]
	adds r0, r0, r2
	ldr r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800E0AE
	ldrb r6, [r5]
	adds r5, #1
	ldrb r0, [r5]
	mov r8, r0
	adds r5, #1
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	cmp r0, r8
	bne _0800E002
_0800E0AE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E0C0
sub_800E0C0: @ 0x0800E0C0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r4, #3
	adds r3, r1, #0
	ands r3, r4
	movs r2, #0x80
	lsls r2, r2, #1
	ands r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x16
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	orrs r3, r2
	movs r1, #0xf0
	adds r5, r0, #0
	ands r5, r1
	orrs r5, r3
	ldr r2, _0800E138 @ =gUnknown_030055D8
	ldrb r1, [r2]
	adds r1, #1
	ands r1, r4
	strb r1, [r2]
	ldr r3, _0800E13C @ =gUnknown_030055D0
	ldrb r1, [r2]
	adds r1, r1, r3
	strb r5, [r1]
	ldrb r2, [r2]
	subs r1, r2, #1
	ands r1, r4
	adds r1, r1, r3
	ldrb r1, [r1]
	orrs r5, r1
	subs r2, #2
	ands r2, r4
	adds r2, r2, r3
	ldrb r1, [r2]
	orrs r5, r1
	ands r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _0800E140 @ =gUnknown_030055E0
	ldr r2, _0800E144 @ =gUnknown_030055D4
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	adds r4, r1, #0
	cmp r0, r5
	bne _0800E148
	ldrb r1, [r3, #1]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0800E148
	adds r0, r1, #1
	strb r0, [r3, #1]
	b _0800E164
	.align 2, 0
_0800E138: .4byte gUnknown_030055D8
_0800E13C: .4byte gUnknown_030055D0
_0800E140: .4byte gUnknown_030055E0
_0800E144: .4byte gUnknown_030055D4
_0800E148:
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0
	strb r5, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r1, [r0, #1]
_0800E164:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800E16C
sub_800E16C: @ 0x0800E16C
	sub sp, #4
	ldr r1, _0800E18C @ =gUnknown_030055D4
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	ldr r1, _0800E190 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _0800E194 @ =gUnknown_030055E0
	str r0, [r1, #4]
	ldr r0, _0800E198 @ =0x8500001F
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0800E18C: .4byte gUnknown_030055D4
_0800E190: .4byte 0x040000D4
_0800E194: .4byte gUnknown_030055E0
_0800E198: .4byte 0x8500001F

	thumb_func_start sub_800E19C
sub_800E19C: @ 0x0800E19C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x2c]
	lsls r0, r0, #0x18
	str r0, [sp, #8]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	movs r1, #0
	mov sl, r1
	ldr r0, _0800E290 @ =sub_800E31C
	ldr r2, _0800E294 @ =0x00002010
	ldr r1, _0800E298 @ =sub_800E540
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0
	ldr r0, _0800E29C @ =IWRAM_START + 0xC
	adds r7, r2, r0
	movs r3, #0
	mov r1, r8
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	ldr r0, _0800E2A0 @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0800E2A4 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0800E2A8 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	strb r3, [r2]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	ldr r0, _0800E2AC @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E256
	movs r2, #1
	mov sl, r2
_0800E256:
	cmp r0, #5
	bne _0800E25E
	movs r0, #2
	mov sl, r0
_0800E25E:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	cmp r2, #1
	bne _0800E272
	ldr r1, [sp, #8]
	lsrs r0, r1, #0x19
	cmp r0, #0
	beq _0800E2B4
_0800E272:
	ldr r1, _0800E2B0 @ =gUnknown_080D52E0
	ldr r0, [sp, #4]
	lsls r4, r0, #3
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	b _0800E2BC
	.align 2, 0
_0800E290: .4byte sub_800E31C
_0800E294: .4byte 0x00002010
_0800E298: .4byte sub_800E540
_0800E29C: .4byte IWRAM_START + 0xC
_0800E2A0: .4byte IWRAM_START + 0x2D
_0800E2A4: .4byte IWRAM_START + 0x2E
_0800E2A8: .4byte IWRAM_START + 0x31
_0800E2AC: .4byte gUnknown_030055B4
_0800E2B0: .4byte gUnknown_080D52E0
_0800E2B4:
	ldr r0, _0800E314 @ =0x06012980
	str r0, [r7, #4]
	ldr r1, [sp, #4]
	lsls r4, r1, #3
_0800E2BC:
	ldr r3, _0800E318 @ =gUnknown_080D52E0
	asrs r0, r5, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r2, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r3, #6
	adds r1, r1, r3
	ldrh r1, [r1]
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	mov r0, r8
	adds r0, #0x3c
	mov r2, sp
	ldrb r2, [r2, #4]
	strb r2, [r0]
	mov r0, sb
	ldrb r1, [r0, #3]
	movs r0, #3
	ands r0, r1
	mov r1, r8
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E314: .4byte 0x06012980
_0800E318: .4byte gUnknown_080D52E0

	thumb_func_start sub_800E31C
sub_800E31C: @ 0x0800E31C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0800E3A4 @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0xc
	adds r5, r4, r0
	ldr r1, [r6]
	mov r8, r1
	ldr r3, _0800E3A8 @ =gUnknown_030059E0
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_800E490
	cmp r0, #0
	beq _0800E370
	ldr r1, [r7]
	ldr r0, _0800E3AC @ =sub_800E3D0
	str r0, [r1, #8]
	ldr r0, _0800E3B0 @ =IWRAM_START + 0x2C
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0800E3B4 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E370
	ldr r1, _0800E3B8 @ =IWRAM_START + 0x3C
	adds r0, r4, r1
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #0
	bne _0800E370
	ldr r0, _0800E3BC @ =0x06012B00
	str r0, [r5, #4]
_0800E370:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800E394
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800E394
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800E3C0
_0800E394:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0800E3A4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800E3C6
	.align 2, 0
_0800E3A4: .4byte gCurTask
_0800E3A8: .4byte gUnknown_030059E0
_0800E3AC: .4byte sub_800E3D0
_0800E3B0: .4byte IWRAM_START + 0x2C
_0800E3B4: .4byte gUnknown_030055B4
_0800E3B8: .4byte IWRAM_START + 0x3C
_0800E3BC: .4byte 0x06012B00
_0800E3C0:
	adds r0, r5, #0
	bl sub_80051E8
_0800E3C6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800E3D0
sub_800E3D0: @ 0x0800E3D0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0800E424 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r0, #0xc
	adds r4, r6, r0
	ldr r7, [r5]
	ldr r3, _0800E428 @ =gUnknown_030059E0
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_800E490
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800E414
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800E414
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800E42C
_0800E414:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, _0800E424 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800E470
	.align 2, 0
_0800E424: .4byte gCurTask
_0800E428: .4byte gUnknown_030059E0
_0800E42C:
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800E46A
	ldr r0, _0800E478 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, _0800E47C @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E45C
	ldr r1, _0800E480 @ =IWRAM_START + 0x3C
	adds r0, r6, r1
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #0
	bne _0800E45C
	ldr r0, _0800E484 @ =0x06012980
	str r0, [r4, #4]
_0800E45C:
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, _0800E488 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800E48C @ =sub_800E31C
	str r0, [r1, #8]
_0800E46A:
	adds r0, r4, #0
	bl sub_80051E8
_0800E470:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E478: .4byte IWRAM_START + 0x2C
_0800E47C: .4byte gUnknown_030055B4
_0800E480: .4byte IWRAM_START + 0x3C
_0800E484: .4byte 0x06012980
_0800E488: .4byte gCurTask
_0800E48C: .4byte sub_800E31C

	thumb_func_start sub_800E490
sub_800E490: @ 0x0800E490
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldrb r2, [r4, #8]
	lsls r2, r2, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _0800E51C @ =gUnknown_03005960
	ldr r0, [r3]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800E536
	adds r0, r6, #0
	adds r1, r7, #0
	adds r3, r5, #0
	bl sub_800CDBC
	cmp r0, #0
	beq _0800E536
	ldr r1, _0800E520 @ =gUnknown_080D53D0
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x3d
	ldrb r0, [r2]
	adds r1, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0800E524 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E52C
	ldr r0, _0800E528 @ =gUnknown_080D53DA
	ldrb r1, [r2]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	bl m4aSongNumStart
	b _0800E532
	.align 2, 0
_0800E51C: .4byte gUnknown_03005960
_0800E520: .4byte gUnknown_080D53D0
_0800E524: .4byte gUnknown_030055B4
_0800E528: .4byte gUnknown_080D53DA
_0800E52C:
	movs r0, #0x99
	bl m4aSongNumStart
_0800E532:
	movs r0, #1
	b _0800E538
_0800E536:
	movs r0, #0
_0800E538:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800E540
sub_800E540: @ 0x0800E540
	push {lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, _0800E56C @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #2
	bne _0800E562
	ldr r3, _0800E570 @ =IWRAM_START + 0x3C
	adds r0, r1, r3
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #0
	beq _0800E568
_0800E562:
	ldr r0, [r2, #0x10]
	bl sub_8007CF0
_0800E568:
	pop {r0}
	bx r0
	.align 2, 0
_0800E56C: .4byte gUnknown_030055B4
_0800E570: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_800E574
sub_800E574: @ 0x0800E574
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #6
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E5A0
sub_800E5A0: @ 0x0800E5A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E5CC
sub_800E5CC: @ 0x0800E5CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #7
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E5F8
sub_800E5F8: @ 0x0800E5F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E624
sub_800E624: @ 0x0800E624
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E650
sub_800E650: @ 0x0800E650
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E67C
sub_800E67C: @ 0x0800E67C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E6A8
sub_800E6A8: @ 0x0800E6A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #5
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E6D4
sub_800E6D4: @ 0x0800E6D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E700
sub_800E700: @ 0x0800E700
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #9
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_800E19C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800E72C
sub_800E72C: @ 0x0800E72C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800E7A0 @ =sub_800E89C
	ldr r2, _0800E7A4 @ =0x00002010
	ldr r1, _0800E7A8 @ =sub_800F19C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r2, r0
	adds r0, #0xc
	adds r6, r2, r0
	movs r5, #0
	mov r1, r8
	strh r1, [r3, #4]
	mov r0, sb
	strh r0, [r3, #6]
	str r7, [r3]
	ldrb r0, [r7]
	strb r0, [r3, #8]
	strb r4, [r3, #9]
	str r5, [r3, #0x40]
	str r5, [r3, #0x44]
	ldr r1, _0800E7AC @ =IWRAM_START + 0x4C
	adds r0, r2, r1
	strh r5, [r0]
	ldrb r0, [r7, #5]
	ldrb r1, [r7, #6]
	cmp r0, r1
	bls _0800E7D0
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800E7B4
	ldr r1, _0800E7B0 @ =IWRAM_START + 0x48
	adds r0, r2, r1
	movs r1, #4
	strh r1, [r0]
	strh r5, [r3, #0x3c]
	b _0800E7C0
	.align 2, 0
_0800E7A0: .4byte sub_800E89C
_0800E7A4: .4byte 0x00002010
_0800E7A8: .4byte sub_800F19C
_0800E7AC: .4byte IWRAM_START + 0x4C
_0800E7B0: .4byte IWRAM_START + 0x48
_0800E7B4:
	ldr r0, _0800E7C8 @ =IWRAM_START + 0x48
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r3, #0x3c]
_0800E7C0:
	ldr r1, _0800E7CC @ =IWRAM_START + 0x4A
	adds r0, r2, r1
	strh r5, [r0]
	b _0800E806
	.align 2, 0
_0800E7C8: .4byte IWRAM_START + 0x48
_0800E7CC: .4byte IWRAM_START + 0x4A
_0800E7D0:
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800E7F4
	ldr r1, _0800E7EC @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r5, [r0]
	ldr r0, _0800E7F0 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	strh r5, [r3, #0x3c]
	b _0800E806
	.align 2, 0
_0800E7EC: .4byte IWRAM_START + 0x48
_0800E7F0: .4byte IWRAM_START + 0x4A
_0800E7F4:
	ldr r1, _0800E88C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r5, [r0]
	ldr r0, _0800E890 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r3, #0x3c]
_0800E806:
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, r8
	lsls r1, r2, #8
	adds r0, r0, r1
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #0x12
	bl sub_8007C10
	str r0, [r6, #4]
	ldr r1, _0800E894 @ =gUnknown_080D53E4
	ldr r0, _0800E898 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800E88C: .4byte IWRAM_START + 0x48
_0800E890: .4byte IWRAM_START + 0x4A
_0800E894: .4byte gUnknown_080D53E4
_0800E898: .4byte gUnknown_030055B4

	thumb_func_start sub_800E89C
sub_800E89C: @ 0x0800E89C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0800E9BC @ =gUnknown_030059E0
	mov sb, r0
	movs r1, #0
	str r1, [sp]
	mov ip, r1
	ldr r0, _0800E9C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r7, r0
	ldr r2, _0800E9C4 @ =IWRAM_START + 0xC
	adds r2, r2, r7
	mov r8, r2
	ldr r0, [r6]
	mov sl, r0
	ldr r2, _0800E9C8 @ =IWRAM_START + 0x48
	adds r1, r7, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800E906
	ldr r5, [r6, #0x40]
	mov r0, sl
	ldrb r2, [r0, #5]
	lsls r2, r2, #0xb
	ldr r4, _0800E9CC @ =gUnknown_08097AA4
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, _0800E9D0 @ =gUnknown_03005590
	ldrh r1, [r6, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800E9D4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r6, #0x40]
	subs r5, r0, r5
	str r5, [sp]
_0800E906:
	ldr r2, _0800E9D8 @ =IWRAM_START + 0x4A
	adds r1, r7, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800E944
	ldr r5, [r6, #0x44]
	mov r0, sl
	ldrb r2, [r0, #6]
	lsls r2, r2, #0xb
	ldr r4, _0800E9CC @ =gUnknown_08097AA4
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, _0800E9D0 @ =gUnknown_03005590
	ldrh r1, [r6, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800E9D4 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r6, #0x44]
	subs r5, r0, r5
	mov ip, r5
_0800E944:
	ldrb r1, [r6, #8]
	lsls r1, r1, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	mov r0, sl
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800E9DC @ =gUnknown_03005960
	ldr r0, [r3]
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r0, [r6, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r0, r8
	strh r1, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r5, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	ldr r0, [r6, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r1, r8
	strh r2, [r1, #0x18]
	mov r2, sb
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800E9F0
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _0800E9F0
	ldr r0, [r2, #8]
	ldr r1, [sp]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, _0800E9E0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800E9E4
	ldr r0, [r2, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	add r0, ip
	mov r1, sb
	str r0, [r1, #0xc]
	b _0800E9F0
	.align 2, 0
_0800E9BC: .4byte gUnknown_030059E0
_0800E9C0: .4byte gCurTask
_0800E9C4: .4byte IWRAM_START + 0xC
_0800E9C8: .4byte IWRAM_START + 0x48
_0800E9CC: .4byte gUnknown_08097AA4
_0800E9D0: .4byte gUnknown_03005590
_0800E9D4: .4byte 0x000003FF
_0800E9D8: .4byte IWRAM_START + 0x4A
_0800E9DC: .4byte gUnknown_03005960
_0800E9E0: .4byte gUnknown_03005424
_0800E9E4:
	mov r2, sb
	ldr r0, [r2, #0xc]
	ldr r1, _0800EA6C @ =0xFFFFFE00
	adds r0, r0, r1
	add r0, ip
	str r0, [r2, #0xc]
_0800E9F0:
	mov r2, sb
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	lsls r4, r4, #0x10
	cmp r0, #0
	bne _0800EA32
	asrs r1, r4, #0x10
	ldr r0, [r6, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	ldr r0, [r6, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r0, r8
	mov r3, sb
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800EA32
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	mov r2, sb
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
_0800EA32:
	asrs r0, r4, #0x10
	ldr r2, _0800EA70 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800EA5C
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800EA5C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800EA78
_0800EA5C:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _0800EA74 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EB12
	.align 2, 0
_0800EA6C: .4byte 0xFFFFFE00
_0800EA70: .4byte gUnknown_03005960
_0800EA74: .4byte gCurTask
_0800EA78:
	ldr r2, _0800EAAC @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800EB06
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0800EAB0
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _0800EAB0
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EAC2
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EAC0
	.align 2, 0
_0800EAAC: .4byte gUnknown_030059E0
_0800EAB0:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EAC2
	adds r0, r1, #0
	subs r0, #0x10
_0800EAC0:
	strh r0, [r2]
_0800EAC2:
	ldr r0, _0800EAE8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800EAF0
	ldr r1, _0800EAEC @ =gUnknown_08097AA4
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	mov r2, r8
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	mov r1, r8
	strh r0, [r1, #0x18]
	b _0800EB06
	.align 2, 0
_0800EAE8: .4byte gUnknown_03005424
_0800EAEC: .4byte gUnknown_08097AA4
_0800EAF0:
	ldr r1, _0800EB24 @ =gUnknown_08097AA4
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1c
	mov r2, r8
	ldrh r0, [r2, #0x18]
	subs r0, r0, r1
	strh r0, [r2, #0x18]
_0800EB06:
	mov r0, r8
	bl sub_8004558
	mov r0, r8
	bl sub_80051E8
_0800EB12:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB24: .4byte gUnknown_08097AA4

	thumb_func_start sub_800EB28
sub_800EB28: @ 0x0800EB28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0800EBE4 @ =sub_800EC58
	ldr r2, _0800EBE8 @ =0x00002010
	ldr r1, _0800EBEC @ =sub_800F19C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, _0800EBF0 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	movs r3, #0
	mov sl, r3
	movs r2, #0
	strh r5, [r1, #4]
	strh r6, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	mov r3, r8
	strb r3, [r1, #9]
	str r2, [r1, #0x40]
	str r2, [r1, #0x44]
	ldr r3, _0800EBF4 @ =IWRAM_START + 0x4C
	adds r0, r4, r3
	strh r2, [r0]
	subs r3, #4
	adds r0, r4, r3
	strh r2, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r2, [r0]
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r7, #0x18]
	ldr r0, [r1, #0x44]
	str r0, [r1, #0x50]
	str r0, [r1, #0x54]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r2]
	movs r0, #0x12
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _0800EBF8 @ =IWRAM_START + 0x2C
	adds r4, r4, r0
	mov r1, sl
	strb r1, [r4]
	ldr r0, _0800EBFC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _0800EC08
	ldr r1, _0800EC00 @ =gUnknown_080D53E4
	ldr r0, _0800EC04 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0800EC0A
	.align 2, 0
_0800EBE4: .4byte sub_800EC58
_0800EBE8: .4byte 0x00002010
_0800EBEC: .4byte sub_800F19C
_0800EBF0: .4byte IWRAM_START + 0xC
_0800EBF4: .4byte IWRAM_START + 0x4C
_0800EBF8: .4byte IWRAM_START + 0x2C
_0800EBFC: .4byte gUnknown_030054CC
_0800EC00: .4byte gUnknown_080D53E4
_0800EC04: .4byte gUnknown_030055B4
_0800EC08:
	ldr r0, _0800EC54 @ =0x0000021D
_0800EC0A:
	strh r0, [r7, #0xa]
	movs r2, #0
	movs r1, #0
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC54: .4byte 0x0000021D

	thumb_func_start sub_800EC58
sub_800EC58: @ 0x0800EC58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0800ED6C @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0800ED70 @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r7, [r4]
	ldr r5, _0800ED74 @ =gUnknown_030054CC
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EC84
	adds r0, r4, #0
	bl sub_800F1B0
_0800EC84:
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800ED78 @ =gUnknown_03005960
	ldr r0, [r3]
	lsrs r5, r1, #0x10
	mov sb, r5
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov sl, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r5, _0800ED7C @ =gUnknown_030059E0
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800ECE2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r5, r8
	ldr r1, [r5]
	ldr r0, _0800ED80 @ =sub_800EDF8
	str r0, [r1, #8]
	movs r0, #0x1e
	strh r0, [r4, #0x3c]
_0800ECE2:
	ldr r1, _0800ED74 @ =gUnknown_030054CC
	ldrb r0, [r1]
	cmp r0, #2
	bls _0800ED02
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800ED02
	movs r0, #0
	strh r0, [r4, #0x3c]
	mov r3, r8
	ldr r1, [r3]
	ldr r0, _0800ED84 @ =sub_800EFD0
	str r0, [r1, #8]
_0800ED02:
	mov r5, sb
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0800ED78 @ =gUnknown_03005960
	ldr r2, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r2, r5
	cmp r1, r0
	bgt _0800ED38
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0800ED38
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0800ED38
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0800ED88
_0800ED38:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800ED5C
	movs r5, #0x18
	ldrsh r0, [r6, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0800ED5C
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800ED88
_0800ED5C:
	ldrb r0, [r4, #8]
	strb r0, [r7]
	ldr r0, _0800ED6C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EDE6
	.align 2, 0
_0800ED6C: .4byte gCurTask
_0800ED70: .4byte IWRAM_START + 0xC
_0800ED74: .4byte gUnknown_030054CC
_0800ED78: .4byte gUnknown_03005960
_0800ED7C: .4byte gUnknown_030059E0
_0800ED80: .4byte sub_800EDF8
_0800ED84: .4byte sub_800EFD0
_0800ED88:
	ldr r2, _0800EDB0 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800EDB4
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800EDB4
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EDC6
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EDC4
	.align 2, 0
_0800EDB0: .4byte gUnknown_030059E0
_0800EDB4:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EDC6
	adds r0, r1, #0
	subs r0, #0x10
_0800EDC4:
	strh r0, [r2]
_0800EDC6:
	ldr r1, _0800EDF4 @ =gUnknown_08097AA4
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800EDE6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EDF4: .4byte gUnknown_08097AA4

	thumb_func_start sub_800EDF8
sub_800EDF8: @ 0x0800EDF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0800EE98 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0800EE9C @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r7, [r4]
	ldr r5, _0800EEA0 @ =gUnknown_030054CC
	mov r8, r5
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EE24
	adds r0, r4, #0
	bl sub_800F1B0
_0800EE24:
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800EEA4 @ =gUnknown_03005960
	ldr r0, [r3]
	lsrs r5, r1, #0x10
	mov sb, r5
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov sl, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r5, _0800EEA8 @ =gUnknown_030059E0
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800EE76
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
_0800EE76:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EEB0
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800EEB0
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _0800EE98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800EEAC @ =sub_800EFD0
	str r0, [r1, #8]
	b _0800EEE6
	.align 2, 0
_0800EE98: .4byte gCurTask
_0800EE9C: .4byte IWRAM_START + 0xC
_0800EEA0: .4byte gUnknown_030054CC
_0800EEA4: .4byte gUnknown_03005960
_0800EEA8: .4byte gUnknown_030059E0
_0800EEAC: .4byte sub_800EFD0
_0800EEB0:
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0800EEE6
	strh r0, [r4, #0x3c]
	ldr r0, _0800EF50 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800EF54 @ =sub_800EFD0
	str r0, [r1, #8]
	ldr r0, _0800EF58 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800EEE6
	bl sub_8019224
	movs r2, #1
	strb r2, [r0]
	ldrh r1, [r4, #4]
	strb r1, [r0, #1]
	ldrh r1, [r4, #6]
	strb r1, [r0, #2]
	ldrb r1, [r4, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
_0800EEE6:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0800EF5C @ =gUnknown_03005960
	ldr r2, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r2, r5
	cmp r1, r0
	bgt _0800EF1C
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0800EF1C
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0800EF1C
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0800EF60
_0800EF1C:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800EF40
	movs r5, #0x18
	ldrsh r0, [r6, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0800EF40
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800EF60
_0800EF40:
	ldrb r0, [r4, #8]
	strb r0, [r7]
	ldr r0, _0800EF50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EFBE
	.align 2, 0
_0800EF50: .4byte gCurTask
_0800EF54: .4byte sub_800EFD0
_0800EF58: .4byte gUnknown_030054CC
_0800EF5C: .4byte gUnknown_03005960
_0800EF60:
	ldr r2, _0800EF88 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800EF8C
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800EF8C
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EF9E
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EF9C
	.align 2, 0
_0800EF88: .4byte gUnknown_030059E0
_0800EF8C:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EF9E
	adds r0, r1, #0
	subs r0, #0x10
_0800EF9C:
	strh r0, [r2]
_0800EF9E:
	ldr r1, _0800EFCC @ =gUnknown_08097AA4
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800EFBE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EFCC: .4byte gUnknown_08097AA4

	thumb_func_start sub_800EFD0
sub_800EFD0: @ 0x0800EFD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800F048 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0xc
	adds r6, r4, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r7, _0800F04C @ =gUnknown_030054CC
	ldrb r0, [r7]
	cmp r0, #2
	bls _0800EFF8
	adds r0, r5, #0
	bl sub_800F1B0
_0800EFF8:
	ldr r2, _0800F050 @ =IWRAM_START + 0x4A
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	movs r4, #0
	ldrsh r1, [r1, r4]
	ldr r0, [r5, #0x44]
	adds r0, r0, r1
	str r0, [r5, #0x44]
	ldrb r2, [r5, #8]
	lsls r2, r2, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldrh r1, [r5, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _0800F054 @ =gUnknown_03005960
	ldr r0, [r1]
	lsrs r4, r2, #0x10
	mov ip, r4
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldrb r0, [r7]
	cmp r0, #2
	bls _0800F058
	ldr r0, [r1, #4]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x54]
	b _0800F062
	.align 2, 0
_0800F048: .4byte gCurTask
_0800F04C: .4byte gUnknown_030054CC
_0800F050: .4byte IWRAM_START + 0x4A
_0800F054: .4byte gUnknown_03005960
_0800F058:
	ldr r0, [r1, #4]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x44]
_0800F062:
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	adds r7, r2, #0
	ldrh r0, [r5, #0x3c]
	adds r3, r0, #1
	strh r3, [r5, #0x3c]
	ldr r1, _0800F0A0 @ =gUnknown_030059E0
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0800F0C6
	ldr r0, [r4, #0x3c]
	cmp r0, r6
	bne _0800F0C6
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bls _0800F0A4
	movs r0, #2
	orrs r2, r0
	subs r0, #0xb
	ands r2, r0
	str r2, [r4, #0x20]
	adds r0, r5, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	b _0800F0C6
	.align 2, 0
_0800F0A0: .4byte gUnknown_030059E0
_0800F0A4:
	adds r0, r5, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0800F0C6:
	ldrh r0, [r5, #0x3c]
	cmp r0, #0x1f
	bhi _0800F0F8
	mov r0, ip
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	asrs r2, r7, #0x10
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800F0F8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0800F0F8:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800F11C
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800F11C
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800F130
_0800F11C:
	ldrb r0, [r5, #8]
	mov r4, r8
	strb r0, [r4]
	ldr r0, _0800F12C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800F18E
	.align 2, 0
_0800F12C: .4byte gCurTask
_0800F130:
	ldr r2, _0800F158 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F15C
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800F15C
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800F16E
	adds r0, r3, #0
	adds r0, #0x10
	b _0800F16C
	.align 2, 0
_0800F158: .4byte gUnknown_030059E0
_0800F15C:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800F16E
	adds r0, r1, #0
	subs r0, #0x10
_0800F16C:
	strh r0, [r2]
_0800F16E:
	ldr r1, _0800F198 @ =gUnknown_08097AA4
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800F18E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F198: .4byte gUnknown_08097AA4

	thumb_func_start sub_800F19C
sub_800F19C: @ 0x0800F19C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_800F1B0
sub_800F1B0: @ 0x0800F1B0
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x54]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x50]
	bx lr
	.align 2, 0

	thumb_func_start sub_800F1BC
sub_800F1BC: @ 0x0800F1BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0800F230 @ =sub_800F38C
	ldr r2, _0800F234 @ =0x00002010
	ldr r1, _0800F238 @ =sub_800F964
	str r1, [sp]
	movs r1, #0x68
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	adds r0, #0xc
	adds r6, r2, r0
	movs r3, #0
	mov r1, sb
	strh r1, [r5, #4]
	mov r0, r8
	strh r0, [r5, #6]
	str r7, [r5]
	ldrb r0, [r7]
	strb r0, [r5, #8]
	strb r4, [r5, #9]
	str r3, [r5, #0x40]
	str r3, [r5, #0x44]
	ldr r1, _0800F23C @ =IWRAM_START + 0x4C
	adds r0, r2, r1
	strh r3, [r0]
	ldrb r0, [r7, #5]
	ldrb r1, [r7, #6]
	cmp r0, r1
	bls _0800F260
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800F244
	ldr r1, _0800F240 @ =IWRAM_START + 0x48
	adds r0, r2, r1
	movs r1, #4
	strh r1, [r0]
	strh r3, [r5, #0x3c]
	b _0800F250
	.align 2, 0
_0800F230: .4byte sub_800F38C
_0800F234: .4byte 0x00002010
_0800F238: .4byte sub_800F964
_0800F23C: .4byte IWRAM_START + 0x4C
_0800F240: .4byte IWRAM_START + 0x48
_0800F244:
	ldr r0, _0800F258 @ =IWRAM_START + 0x48
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r5, #0x3c]
_0800F250:
	ldr r1, _0800F25C @ =IWRAM_START + 0x4A
	adds r0, r2, r1
	strh r3, [r0]
	b _0800F296
	.align 2, 0
_0800F258: .4byte IWRAM_START + 0x48
_0800F25C: .4byte IWRAM_START + 0x4A
_0800F260:
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0800F284
	ldr r1, _0800F27C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r3, [r0]
	ldr r0, _0800F280 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	strh r3, [r5, #0x3c]
	b _0800F296
	.align 2, 0
_0800F27C: .4byte IWRAM_START + 0x48
_0800F280: .4byte IWRAM_START + 0x4A
_0800F284:
	ldr r1, _0800F37C @ =IWRAM_START + 0x48
	adds r0, r2, r1
	strh r3, [r0]
	ldr r0, _0800F380 @ =IWRAM_START + 0x4A
	adds r1, r2, r0
	movs r0, #4
	strh r0, [r1]
	movs r0, #0x80
	strh r0, [r5, #0x3c]
_0800F296:
	movs r1, #0
	mov r0, sb
	lsls r2, r0, #8
	mov r0, r8
	lsls r0, r0, #8
	mov ip, r0
	ldr r0, _0800F384 @ =gUnknown_080D5430
	mov sb, r0
	ldr r0, _0800F388 @ =gUnknown_030055B4
	mov r8, r0
	movs r0, #0x20
	adds r0, r0, r6
	mov sl, r0
	adds r0, r6, #0
	adds r0, #0x21
	str r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #8]
	adds r0, #3
	str r0, [sp, #0xc]
	adds r4, r5, #0
	adds r4, #0x54
	adds r3, r5, #0
	adds r3, #0x50
_0800F2C6:
	ldr r0, [r5, #0x40]
	str r0, [r3]
	ldr r0, [r5, #0x44]
	str r0, [r4]
	adds r4, #8
	adds r3, #8
	adds r1, #1
	cmp r1, #2
	bls _0800F2C6
	ldrb r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r5, #0
	movs r4, #0
	strh r0, [r6, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	add r0, ip
	strh r0, [r6, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r6, #4]
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r1, sb
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r1, sb
	adds r1, #4
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	movs r0, #0xff
	ldr r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0x10
	ldr r1, [sp, #8]
	strb r0, [r1]
	ldr r0, [sp, #0xc]
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F37C: .4byte IWRAM_START + 0x48
_0800F380: .4byte IWRAM_START + 0x4A
_0800F384: .4byte gUnknown_080D5430
_0800F388: .4byte gUnknown_030055B4

	thumb_func_start sub_800F38C
sub_800F38C: @ 0x0800F38C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r6, _0800F4A4 @ =gUnknown_030059E0
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, _0800F4A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _0800F4AC @ =IWRAM_START + 0xC
	adds r2, r2, r7
	mov sl, r2
	ldr r3, [r0]
	str r3, [sp, #4]
	ldr r4, _0800F4B0 @ =gUnknown_030054CC
	mov sb, r4
	ldrb r0, [r4]
	cmp r0, #2
	bls _0800F3CA
	mov r0, r8
	bl sub_800F990
_0800F3CA:
	ldr r5, _0800F4B4 @ =IWRAM_START + 0x48
	adds r1, r7, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _0800F40E
	mov r3, r8
	ldr r3, [r3, #0x40]
	mov ip, r3
	ldr r4, [sp, #4]
	ldrb r2, [r4, #5]
	lsls r2, r2, #0xb
	ldr r4, _0800F4B8 @ =gUnknown_08097AA4
	adds r3, r0, #0
	ldr r0, _0800F4BC @ =gUnknown_03005590
	mov r5, r8
	ldrh r1, [r5, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800F4C0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r5, #0x40]
	mov r2, ip
	subs r2, r0, r2
	str r2, [sp, #8]
_0800F40E:
	ldr r3, _0800F4C4 @ =IWRAM_START + 0x4A
	adds r1, r7, r3
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0800F450
	mov r7, r8
	ldr r5, [r7, #0x44]
	ldr r0, [sp, #4]
	ldrb r2, [r0, #6]
	lsls r2, r2, #0xb
	ldr r4, _0800F4B8 @ =gUnknown_08097AA4
	movs r7, #0
	ldrsh r3, [r1, r7]
	ldr r0, _0800F4BC @ =gUnknown_03005590
	mov r7, r8
	ldrh r1, [r7, #0x3c]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	muls r0, r3, r0
	ldr r1, _0800F4C0 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #0xe
	str r0, [r7, #0x44]
	subs r5, r0, r5
	str r5, [sp, #0xc]
_0800F450:
	mov r2, r8
	ldrb r0, [r2, #8]
	lsls r0, r0, #3
	ldrh r1, [r2, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r4, [sp, #4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	ldrh r1, [r2, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r5, sb
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800F4CC
	ldr r2, _0800F4C8 @ =gUnknown_03005960
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	subs r1, r1, r0
	mov r7, r8
	ldr r0, [r7, #0x58]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r0, sl
	strh r1, [r0, #0x16]
	ldr r0, [r2, #4]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r7, #0x5c]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r4, sl
	strh r1, [r4, #0x18]
	b _0800F4F2
	.align 2, 0
_0800F4A4: .4byte gUnknown_030059E0
_0800F4A8: .4byte gCurTask
_0800F4AC: .4byte IWRAM_START + 0xC
_0800F4B0: .4byte gUnknown_030054CC
_0800F4B4: .4byte IWRAM_START + 0x48
_0800F4B8: .4byte gUnknown_08097AA4
_0800F4BC: .4byte gUnknown_03005590
_0800F4C0: .4byte 0x000003FF
_0800F4C4: .4byte IWRAM_START + 0x4A
_0800F4C8: .4byte gUnknown_03005960
_0800F4CC:
	ldr r2, _0800F52C @ =gUnknown_03005960
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r1, r3, #0x10
	subs r1, r1, r0
	mov r5, r8
	ldr r0, [r5, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r7, sl
	strh r1, [r7, #0x16]
	ldr r0, [r2, #4]
	lsls r2, r4, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r7, #0x18]
_0800F4F2:
	str r3, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0800F502
	b _0800F614
_0800F502:
	ldr r0, [r6, #0x3c]
	cmp r0, sl
	beq _0800F50A
	b _0800F614
_0800F50A:
	ldr r0, [r6, #8]
	ldr r1, [sp, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r0, _0800F530 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800F534
	ldr r0, [r6, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r3, [sp, #0xc]
	adds r0, r0, r3
	b _0800F53E
	.align 2, 0
_0800F52C: .4byte gUnknown_03005960
_0800F530: .4byte gUnknown_03005424
_0800F534:
	ldr r0, [r6, #0xc]
	ldr r4, _0800F7E4 @ =0xFFFFFE00
	adds r0, r0, r4
	ldr r5, [sp, #0xc]
	adds r0, r0, r5
_0800F53E:
	str r0, [r6, #0xc]
	ldr r4, _0800F7E8 @ =gUnknown_030059E0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	adds r1, r1, r2
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r7, _0800F7EC @ =sub_801EC3C
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F584
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
	str r0, [r6, #0x3c]
_0800F584:
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	adds r4, r6, #0
	adds r4, #0x38
	ldrb r2, [r4]
	ldr r5, _0800F7F0 @ =sub_801EB44
	str r5, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F5B0
	lsls r1, r0, #8
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
_0800F5B0:
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldrb r2, [r4]
	movs r3, #8
	rsbs r3, r3, #0
	str r5, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F5D8
	lsls r1, r0, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
_0800F5D8:
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	movs r2, #0x16
	ldrsb r2, [r6, r2]
	subs r1, r1, r2
	ldrb r2, [r4]
	str r7, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F614
	lsls r1, r0, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
	str r0, [r6, #0x3c]
_0800F614:
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800F622
	b _0800F8FE
_0800F622:
	str r1, [sp, #0x10]
	mov r4, sl
	adds r4, #0x2d
	ldrb r0, [r4]
	subs r0, #3
	strb r0, [r4]
	ldr r7, [sp, #0x14]
	asrs r1, r7, #0x10
	mov r2, r8
	ldr r0, [r2, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r3, [sp, #0x18]
	asrs r2, r3, #0x10
	mov r5, r8
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r0, sl
	adds r3, r6, #0
	bl sub_800CCB8
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0xa
	mov r7, sb
	ands r0, r7
	str r4, [sp, #0x20]
	cmp r0, #0
	bne _0800F660
	b _0800F85C
_0800F660:
	ldr r1, _0800F7E8 @ =gUnknown_030059E0
	adds r0, r1, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0800F688
	adds r0, r1, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x63
	ble _0800F688
	cmp r0, #0x69
	bgt _0800F688
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #4
	strb r0, [r1]
_0800F688:
	mov r3, sb
	lsls r2, r3, #0x18
	asrs r1, r2, #0x10
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	str r2, [sp, #0x1c]
	cmp r0, #0
	beq _0800F6F8
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	cmp r0, #0
	bgt _0800F6AC
	movs r0, #0
	strh r0, [r6, #0x12]
_0800F6AC:
	ldr r0, _0800F7F4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800F6CC
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r5, sl
	str r5, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
_0800F6CC:
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0800F7EC @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F6F8
	ldr r7, [sp, #0xc]
	cmp r7, #0
	ble _0800F6F8
	bl sub_800F978
_0800F6F8:
	movs r0, #0x80
	lsls r0, r0, #9
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	bne _0800F706
	b _0800F85C
_0800F706:
	ldr r0, _0800F7F4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0800F718
	b _0800F82C
_0800F718:
	ldr r2, [sp, #0x1c]
	asrs r5, r2, #0x10
	ldr r0, [r6, #0xc]
	subs r0, r0, r5
	str r0, [r6, #0xc]
	mov r4, sl
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r0, #0x10
	strb r0, [r4]
	mov r7, sl
	adds r7, #0x2e
	ldrb r0, [r7]
	subs r0, #0x10
	strb r0, [r7]
	ldr r3, [sp, #0x14]
	asrs r1, r3, #0x10
	mov r2, r8
	ldr r0, [r2, #0x40]
	asrs r0, r0, #8
	adds r1, r1, r0
	ldr r3, [sp, #0x18]
	asrs r2, r3, #0x10
	mov r3, r8
	ldr r0, [r3, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	mov r0, sl
	adds r3, r6, #0
	bl sub_800CCB8
	adds r2, r0, #0
	ldrb r0, [r4]
	subs r0, #0x10
	strb r0, [r4]
	ldrb r0, [r7]
	adds r0, #0x10
	strb r0, [r7]
	ldr r0, [r6, #0xc]
	adds r0, r0, r5
	str r0, [r6, #0xc]
	ldr r4, [sp, #0x10]
	str r4, [r6, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0800F7AA
	movs r5, #0xff
	lsls r5, r5, #8
	adds r1, r5, #0
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _0800F794
	ldr r0, [r6, #8]
	ldr r7, _0800F7F8 @ =0xFFFFF000
	adds r0, r0, r7
	adds r0, r0, r1
	str r0, [r6, #8]
_0800F794:
	cmp r1, #0
	ble _0800F7A4
	ldr r0, [r6, #8]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r0, r3
	adds r0, r0, r1
	str r0, [r6, #8]
_0800F7A4:
	movs r4, #0
	strh r4, [r6, #0x10]
	strh r4, [r6, #0x14]
_0800F7AA:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0800F820
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _0800F7EC @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F80C
	ldr r5, [sp, #0xc]
	cmp r5, #0
	bge _0800F7FC
	bl sub_800F978
	b _0800F85C
	.align 2, 0
_0800F7E4: .4byte 0xFFFFFE00
_0800F7E8: .4byte gUnknown_030059E0
_0800F7EC: .4byte sub_801EC3C
_0800F7F0: .4byte sub_801EB44
_0800F7F4: .4byte gUnknown_03005424
_0800F7F8: .4byte 0xFFFFF000
_0800F7FC:
	ldr r7, [sp, #0x1c]
	asrs r0, r7, #0x10
	ldr r1, [r6, #0xc]
	subs r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x14]
	b _0800F85C
_0800F80C:
	ldr r1, [sp, #0x1c]
	asrs r0, r1, #0x10
	ldr r1, [r6, #0xc]
	subs r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x14]
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x12]
	b _0800F85C
_0800F820:
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _0800F85C
_0800F82C:
	strh r0, [r6, #0x12]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _0800F93C @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F85C
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bge _0800F85C
	bl sub_800F978
_0800F85C:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r4, sb
	ands r0, r4
	cmp r0, #0
	beq _0800F8F6
	ldr r2, [r6, #0x20]
	movs r0, #8
	ands r2, r0
	cmp r2, #0
	bne _0800F8F6
	ldr r0, [r6, #0x3c]
	cmp r0, sl
	beq _0800F8F6
	movs r5, #0xff
	lsls r5, r5, #8
	adds r1, r5, #0
	mov r0, sb
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	strh r2, [r6, #0x10]
	strh r2, [r6, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r4
	cmp r0, #0
	beq _0800F8C2
	asrs r0, r1, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _0800F940 @ =sub_801EB44
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0800F8C2
	bl sub_800F978
_0800F8C2:
	movs r0, #0x80
	lsls r0, r0, #0xc
	mov r7, sb
	ands r0, r7
	cmp r0, #0
	beq _0800F8F6
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0800F940 @ =sub_801EB44
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0800F8F6
	bl sub_800F978
_0800F8F6:
	ldr r1, [sp, #0x20]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_0800F8FE:
	ldr r2, [sp, #0x14]
	asrs r0, r2, #0x10
	ldr r2, _0800F944 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800F92A
	ldr r3, [sp, #0x18]
	asrs r0, r3, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800F92A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800F94C
_0800F92A:
	mov r4, r8
	ldrb r0, [r4, #8]
	ldr r5, [sp, #4]
	strb r0, [r5]
	ldr r0, _0800F948 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800F952
	.align 2, 0
_0800F93C: .4byte sub_801EC3C
_0800F940: .4byte sub_801EB44
_0800F944: .4byte gUnknown_03005960
_0800F948: .4byte gCurTask
_0800F94C:
	mov r0, sl
	bl sub_80051E8
_0800F952:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800F964
sub_800F964: @ 0x0800F964
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_800F978
sub_800F978: @ 0x0800F978
	ldr r2, _0800F98C @ =gUnknown_030059E0
	movs r0, #0
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	orrs r0, r1
	str r0, [r2, #0x20]
	bx lr
	.align 2, 0
_0800F98C: .4byte gUnknown_030059E0

	thumb_func_start sub_800F990
sub_800F990: @ 0x0800F990
	ldr r1, [r0, #0x58]
	str r1, [r0, #0x60]
	ldr r1, [r0, #0x5c]
	str r1, [r0, #0x64]
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x58]
	ldr r1, [r0, #0x54]
	str r1, [r0, #0x5c]
	ldr r1, [r0, #0x40]
	str r1, [r0, #0x50]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0

	thumb_func_start sub_800F9AC
sub_800F9AC: @ 0x0800F9AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	adds r4, #1
	strb r4, [r6]
	adds r5, r0, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	subs r4, #1
	strb r4, [r5]
	bl sub_800CCB8
	ldrb r1, [r6]
	subs r1, #1
	strb r1, [r6]
	ldrb r1, [r5]
	adds r1, #1
	strb r1, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_800F9D8
sub_800F9D8: @ 0x0800F9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0800FAD4 @ =sub_800FAF4
	ldr r2, _0800FAD8 @ =0x00002010
	ldr r1, _0800FADC @ =sub_800FE24
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r0, _0800FAE0 @ =IWRAM_START + 0xC
	adds r7, r3, r0
	movs r2, #0
	mov sb, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r0, r8
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	strb r6, [r1, #9]
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r2, r8
	strb r0, [r2]
	ldrb r2, [r2, #3]
	movs r0, #3
	ands r0, r2
	adds r4, r0, #0
	strh r4, [r1, #0x3c]
	movs r0, #0x14
	str r3, [sp, #4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _0800FAE4 @ =0x0000021F
	strh r0, [r7, #0xa]
	ldr r0, _0800FAE8 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	ldr r3, [sp, #4]
	cmp r0, #5
	bne _0800FA70
	movs r0, #0x98
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
_0800FA70:
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r2, _0800FAEC @ =IWRAM_START + 0x2C
	adds r1, r3, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sb
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #1
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0800FAF0 @ =IWRAM_START + 0x2E
	adds r1, r3, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r2, #4
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0800FABE
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0800FABE:
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FAD4: .4byte sub_800FAF4
_0800FAD8: .4byte 0x00002010
_0800FADC: .4byte sub_800FE24
_0800FAE0: .4byte IWRAM_START + 0xC
_0800FAE4: .4byte 0x0000021F
_0800FAE8: .4byte gUnknown_030055B4
_0800FAEC: .4byte IWRAM_START + 0x2C
_0800FAF0: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_800FAF4
sub_800FAF4: @ 0x0800FAF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r6, _0800FBE4 @ =gUnknown_030059E0
	ldr r0, _0800FBE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _0800FBEC @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp]
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _0800FBF0 @ =gUnknown_03005960
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, r8
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	str r2, [sp, #8]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r4, r8
	strh r1, [r4, #0x18]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800FB62
	b _0800FDC2
_0800FB62:
	movs r5, #0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0800FB74
	ldr r0, [r6, #0x3c]
	cmp r0, r8
	bne _0800FB74
	movs r5, #1
_0800FB74:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #8]
	lsls r4, r2, #0x10
	asrs r2, r4, #0x10
	mov r0, r8
	adds r3, r6, #0
	bl sub_800CDBC
	adds r1, r0, #0
	cmp r1, #0
	bne _0800FB90
	b _0800FD36
_0800FB90:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	mov r3, sb
	ldrh r5, [r3, #0x3c]
	cmp r0, #0
	beq _0800FBAE
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FBAE
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0800FBCA
_0800FBAE:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0800FBF4
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FBC2
	b _0800FDC2
_0800FBC2:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bgt _0800FBF4
_0800FBCA:
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	b _0800FDC2
	.align 2, 0
_0800FBE4: .4byte gUnknown_030059E0
_0800FBE8: .4byte gCurTask
_0800FBEC: .4byte IWRAM_START + 0xC
_0800FBF0: .4byte gUnknown_03005960
_0800FBF4:
	movs r0, #2
	mov sl, r0
	ands r0, r5
	cmp r0, #0
	beq _0800FC00
	b _0800FDC2
_0800FC00:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r2
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r7, r0, r1
	cmp r7, #0
	bgt _0800FC26
	b _0800FD2A
_0800FC26:
	cmp r7, r2
	ble _0800FC66
	ldr r0, [r6, #0x20]
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	bne _0800FC5A
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FC5A
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r0, sb
	ldrh r1, [r0, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
_0800FC5A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	b _0800FD24
_0800FC66:
	ldr r5, [r6, #0xc]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	asrs r1, r4, #0x10
	subs r0, r0, r1
	str r0, [sp, #0xc]
	mov r0, r8
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r7, #8
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl __divsi3
	muls r0, r4, r0
	asrs r3, r0, #8
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, r3
	blt _0800FD1A
	ldr r0, [r6, #0x20]
	mov r4, sl
	ands r0, r4
	cmp r0, #0
	bne _0800FCF8
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FCF8
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0800FCDC @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0800FCF8
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	cmp r7, r0
	bge _0800FCE0
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	b _0800FD98
	.align 2, 0
_0800FCDC: .4byte gUnknown_03005B38
_0800FCE0:
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r3, sb
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	b _0800FD98
_0800FCF8:
	ldr r4, [sp, #0xc]
	subs r0, r3, r4
	lsls r0, r0, #8
	adds r0, r5, r0
	str r0, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r0, r8
	b _0800FDC0
_0800FD1A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, sl
_0800FD24:
	orrs r0, r1
	str r0, [r6, #0x20]
	b _0800FDC2
_0800FD2A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	b _0800FDC2
_0800FD36:
	cmp r5, #0
	beq _0800FDC2
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #2
	ands r0, r1
	adds r5, r1, #0
	cmp r0, #0
	beq _0800FD5E
	ldr r0, [r6, #8]
	asrs r3, r0, #8
	mov r4, r8
	movs r1, #0x16
	ldrsh r2, [r4, r1]
	adds r4, r0, #0
	cmp r3, r2
	blt _0800FD6E
	cmp r3, r2
	bgt _0800FDB4
	b _0800FDA0
_0800FD5E:
	ldr r0, [r6, #8]
	asrs r2, r0, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r1, [r3, r4]
	adds r4, r0, #0
	cmp r2, r1
	ble _0800FDA8
_0800FD6E:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0800FDC2
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0800FDC2
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
_0800FD98:
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
	b _0800FDC2
_0800FDA0:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _0800FDC2
_0800FDA8:
	asrs r1, r4, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bge _0800FDC2
_0800FDB4:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
_0800FDC0:
	str r0, [r6, #0x3c]
_0800FDC2:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0800FE04 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0800FDF2
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0800FDF2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800FE0C
_0800FDF2:
	mov r4, sb
	ldrb r0, [r4, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0800FE08 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800FE12
	.align 2, 0
_0800FE04: .4byte gUnknown_03005960
_0800FE08: .4byte gCurTask
_0800FE0C:
	mov r0, r8
	bl sub_80051E8
_0800FE12:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_800FE24
sub_800FE24: @ 0x0800FE24
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_800FE38
sub_800FE38: @ 0x0800FE38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0800FE64 @ =gUnknown_030059E0
	mov ip, r0
	ldr r2, _0800FE68 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FE6C
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r7, r0, r1
	b _0800FE78
	.align 2, 0
_0800FE64: .4byte gUnknown_030059E0
_0800FE68: .4byte gUnknown_03005424
_0800FE6C:
	mov r2, ip
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r7, r0, r1
_0800FE78:
	ldr r4, _0800FF3C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov sl, r0
	ldr r3, _0800FF40 @ =IWRAM_START + 0x8
	adds r0, r1, r3
	ldrb r0, [r0]
	str r0, [sp, #8]
	ldr r6, _0800FF44 @ =IWRAM_START+4
	adds r0, r1, r6
	ldrh r2, [r0]
	subs r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]
	adds r6, #5
	adds r1, r1, r6
	ldrb r5, [r1]
	ldr r1, [sp, #8]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r2, sl
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	mov r3, ip
	ldr r1, [r3, #0x20]
	adds r0, r1, #0
	movs r6, #0x80
	ands r0, r6
	mov sb, r1
	cmp r0, #0
	beq _0800FED2
	b _080100D6
_0800FED2:
	ldr r0, [sp]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r0, r2, #3
	adds r4, r1, r0
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r6, r0, #8
	str r3, [sp, #0xc]
	mov r8, r2
	adds r3, r0, #0
	cmp r4, r6
	ble _0800FEF4
	b _080100C4
_0800FEF4:
	mov r2, sl
	ldrb r1, [r2, #5]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r4, r1, #0
	cmp r0, r6
	bge _0800FF04
	b _080100C4
_0800FF04:
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	mov r1, sl
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r1, r2, r0
	cmp r1, r7
	ble _0800FF1A
	b _080100C4
_0800FF1A:
	mov r6, sl
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r7
	bge _0800FF28
	b _080100C4
_0800FF28:
	movs r6, #0
	ldr r0, _0800FF48 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FF4C
	cmp r7, r2
	blt _0800FF52
	b _0800FF50
	.align 2, 0
_0800FF3C: .4byte gCurTask
_0800FF40: .4byte IWRAM_START + 0x8
_0800FF44: .4byte IWRAM_START+4
_0800FF48: .4byte gUnknown_03005424
_0800FF4C:
	cmp r7, r2
	bgt _0800FF52
_0800FF50:
	movs r6, #1
_0800FF52:
	mov r1, ip
	movs r2, #0x12
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0800FF5E
	b _080100B0
_0800FF5E:
	cmp r6, #0
	bne _0800FF64
	b _080100B0
_0800FF64:
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	beq _0800FF6E
	b _080100B0
_0800FF6E:
	movs r0, #0x80
	lsls r0, r0, #0x11
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	beq _08010060
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0800FFF0
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _0800FFE8
	asrs r2, r3, #8
	ldr r1, [sp, #0xc]
	asrs r0, r1, #0x10
	mov r6, r8
	lsls r1, r6, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	blt _0800FFB8
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0800FFC8 @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0800FFE8
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0800FFE8
_0800FFB8:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0800FFCC
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0800FFD2
	.align 2, 0
_0800FFC8: .4byte gUnknown_03005B38
_0800FFCC:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0800FFD2:
	strb r0, [r1]
	ldr r1, _0800FFE0 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0800FFE4 @ =IWRAM_START + 0x9
	adds r1, r1, r2
	b _0801004E
	.align 2, 0
_0800FFE0: .4byte gCurTask
_0800FFE4: .4byte IWRAM_START + 0x9
_0800FFE8:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080100B0
_0800FFF0:
	movs r0, #1
	mov r6, sb
	ands r0, r6
	cmp r0, #0
	bne _080100B0
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _08010028
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _08010038 @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080100B0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080100B0
_08010028:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0801003C
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _08010042
	.align 2, 0
_08010038: .4byte gUnknown_03005B38
_0801003C:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_08010042:
	strb r0, [r1]
	ldr r6, _08010058 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	ldr r0, _0801005C @ =IWRAM_START + 0x9
	adds r1, r1, r0
_0801004E:
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	b _080100B0
	.align 2, 0
_08010058: .4byte gCurTask
_0801005C: .4byte IWRAM_START + 0x9
_08010060:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08010080
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	blt _08010096
	b _080100B0
_08010080:
	asrs r2, r3, #8
	ldr r6, [sp]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r3, r8
	lsls r1, r3, #3
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r0, r0, r1
	cmp r2, r0
	ble _080100B0
_08010096:
	mov r2, ip
	adds r2, #0x6d
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x6e
	strb r1, [r0]
	movs r1, #1
	ands r5, r1
	cmp r5, #0
	beq _080100B0
	strb r1, [r0]
_080100B0:
	ldr r6, _080100BC @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	ldr r0, _080100C0 @ =IWRAM_START + 0x9
	adds r1, r1, r0
	b _080100CE
	.align 2, 0
_080100BC: .4byte gCurTask
_080100C0: .4byte IWRAM_START + 0x9
_080100C4:
	ldr r1, _08010138 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0801013C @ =IWRAM_START + 0x9
	adds r1, r1, r2
_080100CE:
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
_080100D6:
	ldr r2, _08010140 @ =gUnknown_03005960
	ldr r0, [r2]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	ldr r6, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08010118
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08010118
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08010128
_08010118:
	mov r2, sp
	ldrb r3, [r2, #8]
	mov r2, sl
	strb r3, [r2]
	ldr r6, _08010138 @ =gCurTask
	ldr r0, [r6]
	bl TaskDestroy
_08010128:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010138: .4byte gCurTask
_0801013C: .4byte IWRAM_START + 0x9
_08010140: .4byte gUnknown_03005960

	thumb_func_start sub_8010144
sub_8010144: @ 0x08010144
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08010248 @ =gUnknown_030059E0
	mov ip, r0
	ldr r4, _0801024C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	ldr r2, _08010250 @ =IWRAM_START + 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldr r3, _08010254 @ =IWRAM_START+4
	adds r0, r1, r3
	ldrh r2, [r0]
	ldr r7, _08010258 @ =IWRAM_START + 0x6
	adds r0, r1, r7
	ldrh r3, [r0]
	ldr r0, _0801025C @ =IWRAM_START + 0x9
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, r8
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r7, ip
	ldr r3, [r7, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080101AA
	b _080102C8
_080101AA:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r6, r0, r1
	ldr r0, [r7, #8]
	asrs r4, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #4]
	cmp r6, r4
	ble _080101C8
	b _080102C8
_080101C8:
	mov r2, r8
	ldrb r0, [r2, #5]
	lsls r7, r0, #3
	str r7, [sp, #0x10]
	adds r1, r6, r7
	str r0, [sp, #0xc]
	cmp r1, r4
	blt _080102C8
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	ldrsb r1, [r2, r1]
	lsls r1, r1, #3
	adds r2, r0, r1
	mov r7, ip
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080102C8
	mov r7, r8
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080102C8
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	beq _080102C8
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0801026C
	ands r3, r1
	cmp r3, #0
	beq _08010264
	ldr r1, [sp, #0x10]
	asrs r0, r1, #1
	adds r0, r6, r0
	cmp r4, r0
	blt _08010238
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _08010260 @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08010264
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08010264
_08010238:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080102C0
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _080102C6
	.align 2, 0
_08010248: .4byte gUnknown_030059E0
_0801024C: .4byte gCurTask
_08010250: .4byte IWRAM_START + 0x8
_08010254: .4byte IWRAM_START+4
_08010258: .4byte IWRAM_START + 0x6
_0801025C: .4byte IWRAM_START + 0x9
_08010260: .4byte gUnknown_03005B38
_08010264:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080102C8
_0801026C:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080102C8
	ldr r3, [sp, #4]
	asrs r2, r3, #8
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	lsls r1, r7, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _080102AA
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _080102BC @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080102C8
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _080102C8
_080102AA:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080102C0
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _080102C6
	.align 2, 0
_080102BC: .4byte gUnknown_03005B38
_080102C0:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_080102C6:
	strb r0, [r1]
_080102C8:
	ldr r2, _0801032C @ =gUnknown_03005960
	ldr r0, [r2]
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r7, sb
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0801030A
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0801030A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0801031A
_0801030A:
	mov r2, sp
	ldrb r3, [r2]
	mov r2, r8
	strb r3, [r2]
	ldr r7, _08010330 @ =gCurTask
	ldr r0, [r7]
	bl TaskDestroy
_0801031A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801032C: .4byte gUnknown_03005960
_08010330: .4byte gCurTask

	thumb_func_start sub_8010334
sub_8010334: @ 0x08010334
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080103A4 @ =sub_800FE38
	ldr r2, _080103A8 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _080103AC @ =IWRAM_START + 0x9
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _080103B0 @ =IWRAM_START + 0x8
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080103A4: .4byte sub_800FE38
_080103A8: .4byte 0x00002010
_080103AC: .4byte IWRAM_START + 0x9
_080103B0: .4byte IWRAM_START + 0x8

	thumb_func_start sub_80103B4
sub_80103B4: @ 0x080103B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010424 @ =sub_8010144
	ldr r2, _08010428 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	ldr r2, _0801042C @ =IWRAM_START + 0x9
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _08010430 @ =IWRAM_START + 0x8
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010424: .4byte sub_8010144
_08010428: .4byte 0x00002010
_0801042C: .4byte IWRAM_START + 0x9
_08010430: .4byte IWRAM_START + 0x8

	thumb_func_start sub_8010434
sub_8010434: @ 0x08010434
	push {r4, lr}
	sub sp, #4
	ldr r0, _0801045C @ =sub_8010464
	ldr r2, _08010460 @ =0x00002010
	movs r4, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801045C: .4byte sub_8010464
_08010460: .4byte 0x00002010

	thumb_func_start sub_8010464
sub_8010464: @ 0x08010464
	push {r4, lr}
	ldr r4, _08010494 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0801048C
	movs r0, #0x72
	bl m4aSongNumStart
	ldr r0, [r4]
	bl TaskDestroy
_0801048C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010494: .4byte gCurTask

	thumb_func_start sub_8010498
sub_8010498: @ 0x08010498
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80104B8
sub_80104B8: @ 0x080104B8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80104D8
sub_80104D8: @ 0x080104D8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80104F8
sub_80104F8: @ 0x080104F8
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_8010334
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010518
sub_8010518: @ 0x08010518
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010538
sub_8010538: @ 0x08010538
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010558
sub_8010558: @ 0x08010558
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010578
sub_8010578: @ 0x08010578
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_80103B4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8010598
sub_8010598: @ 0x08010598
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08010644 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	ldrb r0, [r4, #8]
	mov r8, r0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	mov r6, r8
	lsls r2, r6, #3
	lsls r0, r0, #8
	adds r2, r2, r0
	mov ip, r2
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	movs r0, #3
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r6, _08010648 @ =gUnknown_030059E0
	ldr r0, [r6, #8]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08010650
	ldrb r0, [r5, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08010650
	movs r0, #4
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	ldr r0, [r6, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08010650
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08010650
	ldr r1, [r6, #0x20]
	ldr r0, _0801064C @ =0x00040002
	ands r0, r1
	cmp r0, #2
	bne _08010654
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _08010654
	movs r2, #0x80
	lsls r2, r2, #0x15
	ands r1, r2
	cmp r1, #0
	beq _08010624
	movs r0, #1
	strb r0, [r4, #9]
	ldr r0, [r6, #0x20]
	ands r0, r2
	cmp r0, #0
	bne _08010654
_08010624:
	ldrb r1, [r4, #9]
	cmp r1, #0
	bne _08010654
	adds r4, r6, #0
	adds r4, #0x6d
	movs r0, #0x17
	strb r0, [r4]
	adds r4, #1
	strb r1, [r4]
	ldrb r0, [r5, #2]
	cmp r0, #0x2c
	beq _08010654
	movs r0, #1
	strb r0, [r4]
	b _08010654
	.align 2, 0
_08010644: .4byte gCurTask
_08010648: .4byte gUnknown_030059E0
_0801064C: .4byte 0x00040002
_08010650:
	movs r0, #0
	strb r0, [r4, #9]
_08010654:
	ldr r1, _08010694 @ =gUnknown_03005960
	ldr r0, [r1]
	mov r6, ip
	subs r6, r6, r0
	mov ip, r6
	ldr r0, [r1, #4]
	subs r7, r7, r0
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801067E
	adds r0, r7, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0801067E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r7, r0
	ble _08010688
_0801067E:
	mov r0, r8
	strb r0, [r5]
	ldr r0, [r3]
	bl TaskDestroy
_08010688:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010694: .4byte gUnknown_03005960

	thumb_func_start sub_8010698
sub_8010698: @ 0x08010698
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080106E0 @ =sub_8010598
	ldr r2, _080106E4 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080106E0: .4byte sub_8010598
_080106E4: .4byte 0x00002010

	thumb_func_start sub_80106E8
sub_80106E8: @ 0x080106E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080107DC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
	mov r8, r1
	ldrb r3, [r0, #8]
	mov sb, r3
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r6, r0, r1
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r5, r0, r2
	ldr r4, _080107E0 @ =gUnknown_030059E0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0801079A
	ldr r0, [r4, #8]
	asrs r1, r0, #8
	cmp r6, r1
	bgt _0801079A
	adds r0, r6, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801079A
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	cmp r5, r1
	bgt _0801079A
	adds r0, r5, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801079A
	movs r7, #0x80
	lsls r7, r7, #0xc
	ands r7, r2
	cmp r7, #0
	bne _0801079A
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0x19
	strb r0, [r1]
	mov r3, r8
	ldrb r0, [r3, #3]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3, #4]
	movs r0, #0xf
	ands r0, r2
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0x6e
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	lsls r0, r0, #8
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r0, #0xc
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	bl sub_8029FF0
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2]
	strh r7, [r4, #0x30]
	ldr r0, _080107E4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
_0801079A:
	ldr r1, _080107E8 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r6, r6, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080107C0
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080107C0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _080107CE
_080107C0:
	mov r1, sb
	mov r0, r8
	strb r1, [r0]
	ldr r0, _080107DC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080107CE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080107DC: .4byte gCurTask
_080107E0: .4byte gUnknown_030059E0
_080107E4: .4byte gMPlayInfo_BGM
_080107E8: .4byte gUnknown_03005960

	thumb_func_start sub_80107EC
sub_80107EC: @ 0x080107EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080108D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r7, [r0]
	ldrb r1, [r0, #8]
	mov r8, r1
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, r8
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r4, r0, r2
	ldr r0, _080108DC @ =gUnknown_030059E0
	mov ip, r0
	ldr r2, [r0, #0x20]
	movs r6, #0x80
	ands r6, r2
	cmp r6, #0
	bne _0801089C
	ldr r0, [r0, #8]
	asrs r1, r0, #8
	cmp r5, r1
	bgt _0801089C
	adds r0, r5, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801089C
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0801089C
	adds r0, r4, #0
	adds r0, #0x18
	cmp r0, r1
	blt _0801089C
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0801089C
	ldr r0, _080108E0 @ =0xFFF7FDFD
	ands r2, r0
	mov r3, ip
	str r2, [r3, #0x20]
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _080108E4 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	adds r1, #0x38
	strb r6, [r1]
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08010884
	movs r0, #1
	strb r0, [r1]
_08010884:
	mov r3, ip
	adds r3, #0x6d
	movs r0, #0x1c
	strb r0, [r3]
	movs r0, #4
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08010898
	movs r0, #5
	strb r0, [r3]
_08010898:
	bl sub_802A004
_0801089C:
	ldr r1, _080108E8 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080108C2
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080108C2
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _080108CE
_080108C2:
	mov r0, r8
	strb r0, [r7]
	ldr r0, _080108D8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_080108CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080108D8: .4byte gCurTask
_080108DC: .4byte gUnknown_030059E0
_080108E0: .4byte 0xFFF7FDFD
_080108E4: .4byte 0xFFFFCFFF
_080108E8: .4byte gUnknown_03005960

	thumb_func_start sub_80108EC
sub_80108EC: @ 0x080108EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08010930 @ =sub_80106E8
	ldr r2, _08010934 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010930: .4byte sub_80106E8
_08010934: .4byte 0x00002010

	thumb_func_start sub_8010938
sub_8010938: @ 0x08010938
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0801097C @ =sub_80107EC
	ldr r2, _08010980 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801097C: .4byte sub_80107EC
_08010980: .4byte 0x00002010

	thumb_func_start sub_8010984
sub_8010984: @ 0x08010984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08010A90 @ =sub_8010AB4
	ldr r2, _08010A94 @ =0x00002010
	ldr r1, _08010A98 @ =sub_80111C0
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _08010A9C @ =IWRAM_START + 0xC
	adds r6, r2, r1
	movs r7, #0
	mov sl, r7
	movs r3, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	str r3, [r0, #0x40]
	str r3, [r0, #0x44]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r6, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r6, #0x18]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	strb r0, [r1]
	ldr r4, _08010AA0 @ =gUnknown_080D5468
	ldr r5, _08010AA4 @ =gUnknown_030055B4
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl sub_8007C10
	str r0, [r6, #4]
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r2, [sp, #4]
	ldr r7, _08010AA8 @ =IWRAM_START + 0x2C
	adds r0, r2, r7
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r6, #8]
	strh r3, [r6, #0x14]
	strh r3, [r6, #0x1c]
	ldr r0, _08010AAC @ =IWRAM_START + 0x2D
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r4, _08010AB0 @ =IWRAM_START + 0x2E
	adds r1, r2, r4
	movs r0, #0x10
	strb r0, [r1]
	adds r7, #5
	adds r2, r2, r7
	mov r0, sl
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010A90: .4byte sub_8010AB4
_08010A94: .4byte 0x00002010
_08010A98: .4byte sub_80111C0
_08010A9C: .4byte IWRAM_START + 0xC
_08010AA0: .4byte gUnknown_080D5468
_08010AA4: .4byte gUnknown_030055B4
_08010AA8: .4byte IWRAM_START + 0x2C
_08010AAC: .4byte IWRAM_START + 0x2D
_08010AB0: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_8010AB4
sub_8010AB4: @ 0x08010AB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r6, _08010B58 @ =gUnknown_030059E0
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _08010B5C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r2, _08010B60 @ =IWRAM_START + 0xC
	adds r2, r1, r2
	str r2, [sp]
	ldr r3, [r0]
	str r3, [sp, #4]
	ldrb r2, [r0, #8]
	lsls r2, r2, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	ldr r4, [sp, #8]
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08010B64 @ =gUnknown_03005960
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #0xc]
	asrs r2, r2, #0x10
	subs r0, r2, r0
	ldr r4, [sp]
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	str r3, [sp, #0x10]
	asrs r3, r1, #0x10
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	ldr r0, _08010B68 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08010B6C
	ldr r4, [sp, #4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010B6C
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_8010D1C
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08010B3E
	b _08010CF0
_08010B3E:
	ldr r0, [r6, #0x3c]
	ldr r2, [sp]
	cmp r0, r2
	beq _08010B48
	b _08010CF0
_08010B48:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r6, #0x20]
	b _08010CF0
	.align 2, 0
_08010B58: .4byte gUnknown_030059E0
_08010B5C: .4byte gCurTask
_08010B60: .4byte IWRAM_START + 0xC
_08010B64: .4byte gUnknown_03005960
_08010B68: .4byte gUnknown_030054CC
_08010B6C:
	ldr r7, [r6, #0x20]
	ldr r0, _08010C00 @ =0x00400080
	ands r7, r0
	cmp r7, #0
	beq _08010B78
	b _08010C84
_08010B78:
	ldr r3, [sp, #0xc]
	lsls r5, r3, #0x10
	asrs r4, r5, #0x10
	mov sb, r4
	ldr r0, [sp, #0x10]
	lsls r4, r0, #0x10
	asrs r1, r4, #0x10
	mov r8, r1
	ldr r0, [sp]
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_800CCB8
	mov sl, r0
	movs r2, #0xc0
	lsls r2, r2, #0xc
	ands r0, r2
	str r4, [sp, #0x18]
	cmp r0, #0
	beq _08010BCE
	ldr r0, [sp]
	mov r1, sb
	mov r2, r8
	adds r3, r6, #0
	bl sub_80111F0
	movs r3, #0xc0
	lsls r3, r3, #0xc
	ands r0, r3
	cmp r0, #0
	beq _08010BCE
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	mov r1, sl
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	strh r7, [r6, #0x10]
_08010BCE:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08010C84
	adds r0, r6, #0
	adds r0, #0x64
	ldrh r7, [r0]
	adds r0, #4
	ldrh r2, [r0]
	adds r0, #2
	ldrh r4, [r0]
	adds r0, #0x1b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r1, #3
	beq _08010C0A
	cmp r1, #3
	bgt _08010C04
	cmp r1, #0
	beq _08010C36
	b _08010C74
	.align 2, 0
_08010C00: .4byte 0x00400080
_08010C04:
	cmp r1, #4
	beq _08010C36
	b _08010C74
_08010C0A:
	cmp r7, #0x6b
	bne _08010C30
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	ldrh r0, [r6, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r6, #0x12]
	asrs r0, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	bl sub_8010D1C
	b _08010C8A
_08010C30:
	mov r3, sl
	lsls r0, r3, #0x18
	b _08010C78
_08010C36:
	ldr r0, _08010CB0 @ =gUnknown_080D672C
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r7, #0x24
	bne _08010C74
	cmp r2, #0x33
	bne _08010C74
	cmp r4, #1
	bne _08010C74
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	cmp r0, #0
	ble _08010C74
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	asrs r0, r5, #0x10
	ldr r2, [sp, #0x18]
	asrs r1, r2, #0x10
	bl sub_8010D1C
	movs r3, #1
	str r3, [sp, #0x14]
_08010C74:
	mov r4, sl
	lsls r0, r4, #0x18
_08010C78:
	asrs r0, r0, #0x10
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
_08010C84:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _08010CB8
_08010C8A:
	ldr r0, _08010CB4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08010CF0
	bl sub_8019224
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r3, [sp, #8]
	ldrh r1, [r3, #4]
	strb r1, [r0, #1]
	ldrh r1, [r3, #6]
	strb r1, [r0, #2]
	ldrb r1, [r3, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
	b _08010CF0
	.align 2, 0
_08010CB0: .4byte gUnknown_080D672C
_08010CB4: .4byte gUnknown_030054CC
_08010CB8:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r2, _08010CFC @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _08010CE8
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08010CE8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08010D04
_08010CE8:
	ldr r2, [sp, #8]
	ldrb r0, [r2, #8]
	ldr r3, [sp, #4]
	strb r0, [r3]
_08010CF0:
	ldr r0, _08010D00 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08010D0A
	.align 2, 0
_08010CFC: .4byte gUnknown_03005960
_08010D00: .4byte gCurTask
_08010D04:
	ldr r0, [sp]
	bl sub_80051E8
_08010D0A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8010D1C
sub_8010D1C: @ 0x08010D1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08010F20 @ =sub_8010F78
	ldr r2, _08010F24 @ =0x00002011
	ldr r1, _08010F28 @ =sub_80111D4
	str r1, [sp]
	movs r1, #0xf4
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r1, _08010F2C @ =IWRAM_START + 0xC0
	adds r2, r5, r1
	ldr r3, _08010F30 @ =IWRAM_START + 0xF0
	adds r0, r5, r3
	movs r1, #0
	mov sl, r1
	mov r3, sl
	strh r3, [r0]
	ldr r0, _08010F34 @ =IWRAM_START + 0xF2
	adds r1, r5, r0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r1]
	lsls r4, r4, #0x10
	ldr r1, _08010F38 @ =0xFF800000
	adds r4, r4, r1
	lsrs r4, r4, #0x10
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	ldr r0, _08010F3C @ =0xFFCE0000
	add r8, r0
	mov r1, r8
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r3, _08010F40 @ =gUnknown_080D549E
	mov sb, r3
	ldr r0, _08010F44 @ =gUnknown_030055B4
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl sub_8007C10
	str r0, [r6, #4]
	ldr r3, _08010F44 @ =gUnknown_030055B4
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r3, _08010F48 @ =IWRAM_START + 0x20
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #8]
	strh r1, [r6, #0x14]
	strh r1, [r6, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _08010F4C @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x70
	str r0, [r6, #0x10]
	ldr r2, [sp, #4]
	mov r0, sl
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r4, [r2, #6]
	mov r1, r8
	strh r1, [r2, #8]
	adds r0, r6, #0
	str r2, [sp, #4]
	bl sub_8004558
	ldr r4, _08010F50 @ =0x040000D4
	str r6, [r4]
	ldr r3, _08010F54 @ =IWRAM_START + 0x30
	adds r7, r5, r3
	str r7, [r4, #4]
	ldr r0, _08010F58 @ =0x80000018
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r1, _08010F5C @ =IWRAM_START + 0xCC
	adds r2, r5, r1
	str r2, [r4, #4]
	ldr r3, _08010F60 @ =0x80000006
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x71
	str r0, [r7, #0x10]
	mov r0, r8
	lsls r6, r0, #0x10
	asrs r6, r6, #0x10
	subs r6, #0x10
	strh r6, [r2, #8]
	subs r1, #0x6c
	adds r7, r5, r1
	str r2, [r4]
	ldr r3, _08010F64 @ =IWRAM_START + 0xD8
	adds r2, r5, r3
	str r2, [r4, #4]
	ldr r0, _08010F60 @ =0x80000006
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _08010F44 @ =gUnknown_030055B4
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #6
	adds r0, r0, r1
	ldrh r0, [r0]
	str r2, [sp, #4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _08010F44 @ =gUnknown_030055B4
	ldrb r1, [r0]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sb
	adds r1, #8
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r3, _08010F44 @ =gUnknown_030055B4
	ldrb r1, [r3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0xa
	add sb, r1
	add r0, sb
	ldrh r1, [r0]
	ldr r3, _08010F68 @ =IWRAM_START + 0x80
	adds r0, r5, r3
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	mov r1, sl
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _08010F6C @ =IWRAM_START + 0x82
	adds r0, r5, r1
	movs r3, #0x10
	strb r3, [r0]
	adds r1, #3
	adds r0, r5, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x72
	str r0, [r7, #0x10]
	ldr r2, [sp, #4]
	mov r0, r8
	strh r0, [r2, #8]
	adds r0, r7, #0
	str r2, [sp, #4]
	bl sub_8004558
	str r7, [r4]
	ldr r1, _08010F70 @ =IWRAM_START + 0x90
	adds r7, r5, r1
	str r7, [r4, #4]
	ldr r3, _08010F58 @ =0x80000018
	str r3, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, [sp, #4]
	str r2, [r4]
	ldr r0, _08010F74 @ =IWRAM_START + 0xE4
	adds r2, r5, r0
	str r2, [r4, #4]
	ldr r1, _08010F60 @ =0x80000006
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x73
	str r0, [r7, #0x10]
	strh r6, [r2, #8]
	adds r0, #0xa3
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010F20: .4byte sub_8010F78
_08010F24: .4byte 0x00002011
_08010F28: .4byte sub_80111D4
_08010F2C: .4byte IWRAM_START + 0xC0
_08010F30: .4byte IWRAM_START + 0xF0
_08010F34: .4byte IWRAM_START + 0xF2
_08010F38: .4byte 0xFF800000
_08010F3C: .4byte 0xFFCE0000
_08010F40: .4byte gUnknown_080D549E
_08010F44: .4byte gUnknown_030055B4
_08010F48: .4byte IWRAM_START + 0x20
_08010F4C: .4byte IWRAM_START + 0x22
_08010F50: .4byte 0x040000D4
_08010F54: .4byte IWRAM_START + 0x30
_08010F58: .4byte 0x80000018
_08010F5C: .4byte IWRAM_START + 0xCC
_08010F60: .4byte 0x80000006
_08010F64: .4byte IWRAM_START + 0xD8
_08010F68: .4byte IWRAM_START + 0x80
_08010F6C: .4byte IWRAM_START + 0x82
_08010F70: .4byte IWRAM_START + 0x90
_08010F74: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_8010F78
sub_8010F78: @ 0x08010F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08010FB0 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r7, r1, r0
	ldr r3, _08010FB4 @ =IWRAM_START + 0xF0
	add r3, r8
	str r3, [sp]
	ldrh r0, [r3]
	adds r1, r0, #1
	strh r1, [r3]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _08010FB8
	adds r0, r2, #0
	bl TaskDestroy
	b _08011188
	.align 2, 0
_08010FB0: .4byte gCurTask
_08010FB4: .4byte IWRAM_START + 0xF0
_08010FB8:
	ldr r0, _08011198 @ =IWRAM_START + 0xF2
	add r0, r8
	str r0, [sp, #4]
	ldrh r0, [r0]
	adds r0, #0x28
	ldr r1, [sp, #4]
	strh r0, [r1]
	ldr r6, _0801119C @ =IWRAM_START + 0xC0
	add r6, r8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gUnknown_03005960
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	subs r2, r2, r0
	strh r2, [r6, #6]
	ldrh r0, [r6, #2]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	ble _08011006
	adds r4, r1, #0
_08011006:
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	ldr r2, _080111A4 @ =gUnknown_030054B8
	mov sl, r2
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111A8 @ =IWRAM_START + 0x30
	add r7, r8
	ldr r6, _080111AC @ =IWRAM_START + 0xCC
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gUnknown_03005960
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0x2a
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B0 @ =IWRAM_START + 0x60
	add r7, r8
	ldr r6, _080111B4 @ =IWRAM_START + 0xD8
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gUnknown_03005960
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	adds r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
	ldr r7, _080111B8 @ =IWRAM_START + 0x90
	add r7, r8
	ldr r6, _080111BC @ =IWRAM_START + 0xE4
	add r6, r8
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	ldrh r5, [r6, #6]
	ldrh r3, [r6, #8]
	mov sb, r3
	ldr r1, _080111A0 @ =gUnknown_03005960
	ldr r2, [r1]
	subs r2, r5, r2
	strh r2, [r6, #6]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldr r3, [sp]
	ldrh r0, [r3]
	subs r2, r2, r0
	strh r2, [r6, #6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r6]
	subs r0, #0xe
	strh r0, [r6]
	ldr r0, [r7, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r7, #0x10]
	orrs r0, r1
	str r0, [r7, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8004E14
	adds r0, r7, #0
	bl sub_80051E8
	strh r5, [r6, #6]
	mov r3, sb
	strh r3, [r6, #8]
_08011188:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011198: .4byte IWRAM_START + 0xF2
_0801119C: .4byte IWRAM_START + 0xC0
_080111A0: .4byte gUnknown_03005960
_080111A4: .4byte gUnknown_030054B8
_080111A8: .4byte IWRAM_START + 0x30
_080111AC: .4byte IWRAM_START + 0xCC
_080111B0: .4byte IWRAM_START + 0x60
_080111B4: .4byte IWRAM_START + 0xD8
_080111B8: .4byte IWRAM_START + 0x90
_080111BC: .4byte IWRAM_START + 0xE4

	thumb_func_start sub_80111C0
sub_80111C0: @ 0x080111C0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_80111D4
sub_80111D4: @ 0x080111D4
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl sub_8007CF0
	ldr r0, [r4, #0x64]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80111F0
sub_80111F0: @ 0x080111F0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	adds r4, #1
	strb r4, [r6]
	adds r5, r0, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	subs r4, #1
	strb r4, [r5]
	bl sub_800CCB8
	ldrb r1, [r6]
	subs r1, #1
	strb r1, [r6]
	ldrb r1, [r5]
	adds r1, #1
	strb r1, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_801121C
sub_801121C: @ 0x0801121C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080112D0 @ =gCurTask
	mov ip, r0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldrb r1, [r0, #8]
	mov r8, r1
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, r8
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r5, r0, r2
	ldr r3, _080112D4 @ =gUnknown_030059E0
	ldr r4, [r3, #0x20]
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	bne _08011292
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08011292
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08011292
	movs r0, #4
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r5, r0
	ldr r0, [r3, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08011292
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08011292
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	str r4, [r3, #0x20]
_08011292:
	ldr r1, _080112D8 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080112B8
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080112B8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _080112C4
_080112B8:
	mov r0, r8
	strb r0, [r6]
	mov r1, ip
	ldr r0, [r1]
	bl TaskDestroy
_080112C4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080112D0: .4byte gCurTask
_080112D4: .4byte gUnknown_030059E0
_080112D8: .4byte gUnknown_03005960

	thumb_func_start sub_80112DC
sub_80112DC: @ 0x080112DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08011320 @ =sub_801121C
	ldr r2, _08011324 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011320: .4byte sub_801121C
_08011324: .4byte 0x00002010

	thumb_func_start sub_8011328
sub_8011328: @ 0x08011328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080113E0 @ =gUnknown_03005660
	mov sl, r0
	ldr r0, [r0, #0x10]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov ip, r0
	ldr r0, _080113E4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08011400
	movs r7, #0
	movs r4, #0
	ldr r1, _080113E8 @ =gSpriteStates
	mov r8, r1
	ldr r2, _080113EC @ =gSpritePalettes
	mov sb, r2
	ldr r3, _080113F0 @ =IWRAM_START + 0x80
	adds r6, r6, r3
	ldr r0, _080113F4 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r3, #1
_08011360:
	adds r0, r1, #0
	asrs r0, r4
	ands r0, r3
	cmp r0, #0
	beq _08011370
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08011370:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08011360
	movs r4, #0
	cmp r4, r7
	blo _08011382
	b _080114B0
_08011382:
	ldr r0, _080113F8 @ =gUnknown_03005500
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	ldr r1, _080113FC @ =gUnknown_080D550C
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r1, r0, #5
	lsls r0, r4, #5
	mov r2, ip
	adds r3, r0, r2
	add r1, sb
	movs r5, #0
	adds r4, #1
_080113AE:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _080113AE
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _08011382
	b _080114B0
	.align 2, 0
_080113E0: .4byte gUnknown_03005660
_080113E4: .4byte gUnknown_030054CC
_080113E8: .4byte gSpriteStates
_080113EC: .4byte gSpritePalettes
_080113F0: .4byte IWRAM_START + 0x80
_080113F4: .4byte gUnknown_030055B8
_080113F8: .4byte gUnknown_03005500
_080113FC: .4byte gUnknown_080D550C
_08011400:
	ldr r3, _080115A8 @ =gUnknown_030059E0
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	ldr r1, _080115AC @ =gUnknown_080D550C
	lsrs r0, r0, #0xf
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r2, _080115B0 @ =gSpriteStates
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r0, r0, #5
	ldr r1, _080115B4 @ =gSpritePalettes
	mov r5, ip
	adds r4, r0, r1
	movs r7, #0
	mov r8, r2
	mov sb, r1
	ldr r2, _080115B8 @ =gUnknown_080D5678
	ldr r0, _080115BC @ =IWRAM_START + 0x20
	adds r1, r6, r0
	adds r0, #0x60
	adds r6, r6, r0
_0801143A:
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	ldm r4!, {r0}
	stm r5!, {r0}
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	bne _0801143A
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	lsls r0, r0, #5
	adds r2, r1, #0
	mov r3, sb
	adds r1, r0, r3
	movs r3, #0
_08011488:
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	adds r0, r3, #0
	subs r3, #1
	cmp r0, #0
	bne _08011488
_080114B0:
	ldr r0, _080115C0 @ =0x000008A8
	add r0, r8
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, #4
	lsls r0, r0, #5
	adds r2, r6, #0
	mov r3, sb
	adds r1, r0, r3
	movs r3, #0xb
_080114C6:
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	ldm r1!, {r0}
	stm r2!, {r0}
	adds r0, r3, #0
	subs r3, #1
	cmp r0, #0
	bne _080114C6
	movs r3, #0x80
	lsls r3, r3, #2
	add r3, ip
	ldr r6, _080115C4 @ =gBgPalette
	mov r0, sl
	ldr r2, [r0, #0xc]
	movs r7, #0xf
	ldr r5, _080115C8 @ =0x7BDE7BDE
	ldr r4, _080115CC @ =0x739C739C
	ands r2, r4
_08011502:
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	ldm r6!, {r0}
	adds r1, r0, #0
	ands r1, r5
	ands r0, r4
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r3!, {r1}
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	bne _08011502
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080115A8: .4byte gUnknown_030059E0
_080115AC: .4byte gUnknown_080D550C
_080115B0: .4byte gSpriteStates
_080115B4: .4byte gSpritePalettes
_080115B8: .4byte gUnknown_080D5678
_080115BC: .4byte IWRAM_START + 0x20
_080115C0: .4byte 0x000008A8
_080115C4: .4byte gBgPalette
_080115C8: .4byte 0x7BDE7BDE
_080115CC: .4byte 0x739C739C

	thumb_func_start sub_80115D0
sub_80115D0: @ 0x080115D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, _08011648 @ =gUnknown_03005660
	movs r7, #0
	movs r5, #0
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	movs r3, #0xff
	strb r3, [r4, #2]
	movs r3, #1
	rsbs r3, r3, #0
	adds r6, r3, #0
	strb r3, [r4, #1]
	movs r3, #0x80
	lsls r3, r3, #1
	ands r3, r2
	str r3, [r4, #8]
	str r1, [r4, #0xc]
	cmp r0, #0
	blt _08011640
	adds r0, r4, #0
	adds r0, #0x14
	ldr r1, _0801164C @ =0x06012980
	str r1, [r0, #4]
	strh r5, [r0, #8]
	ldr r1, _08011650 @ =0x00000216
	strh r1, [r0, #0xa]
	adds r1, r4, #0
	adds r1, #0x34
	strb r7, [r1]
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r1, [r2]
	orrs r1, r6
	strb r1, [r2]
	strh r5, [r0, #0x1a]
	strh r5, [r0, #0x1c]
	adds r2, #1
	movs r1, #0x10
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x39
	strb r7, [r1]
	str r5, [r0, #0x10]
	bl sub_8004558
	ldr r0, _08011654 @ =sub_8011660
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _08011658 @ =0x0000FFFE
	ldr r3, _0801165C @ =sub_8011A20
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	str r0, [r4, #0x10]
_08011640:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011648: .4byte gUnknown_03005660
_0801164C: .4byte 0x06012980
_08011650: .4byte 0x00000216
_08011654: .4byte sub_8011660
_08011658: .4byte 0x0000FFFE
_0801165C: .4byte sub_8011A20

	thumb_func_start sub_8011660
sub_8011660: @ 0x08011660
	push {r4, r5, r6, r7, lr}
	ldr r6, _08011688 @ =gUnknown_03005660
	ldr r7, _0801168C @ =gUnknown_03005960
	ldr r0, _08011690 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080116A0
	ldr r0, _08011694 @ =gUnknown_030059E0
	ldr r0, [r0, #8]
	asrs r1, r0, #8
	ldr r0, _08011698 @ =0x00001A09
	cmp r1, r0
	ble _080116A0
	ldr r0, _0801169C @ =0x0000299A
	cmp r1, r0
	bgt _080116A0
	movs r0, #1
	b _080116A2
	.align 2, 0
_08011688: .4byte gUnknown_03005660
_0801168C: .4byte gUnknown_03005960
_08011690: .4byte gUnknown_030055B4
_08011694: .4byte gUnknown_030059E0
_08011698: .4byte 0x00001A09
_0801169C: .4byte 0x0000299A
_080116A0:
	movs r0, #0
_080116A2:
	strb r0, [r6]
	ldrb r2, [r6]
	cmp r2, #1
	beq _080116BC
	ldr r0, _080116B8 @ =gFlags
	ldr r1, [r0]
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _080117DC
	.align 2, 0
_080116B8: .4byte gFlags
_080116BC:
	ldr r1, _080116E0 @ =gUnknown_03005590
	ldr r0, [r1]
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _080116EC
	ldrh r0, [r6, #4]
	movs r1, #4
	ldrsh r2, [r6, r1]
	movs r3, #6
	ldrsh r1, [r6, r3]
	cmp r2, r1
	beq _080116EC
	cmp r2, r1
	bge _080116E4
	adds r0, #1
	b _080116EA
	.align 2, 0
_080116E0: .4byte gUnknown_03005590
_080116E4:
	cmp r2, r1
	ble _080116EC
	subs r0, #1
_080116EA:
	strh r0, [r6, #4]
_080116EC:
	movs r0, #4
	ldrsh r2, [r6, r0]
	ldr r1, [r7, #4]
	cmp r2, r1
	bgt _080116FA
	movs r0, #0
	b _0801170A
_080116FA:
	adds r0, r1, #0
	adds r0, #0xa0
	cmp r2, r0
	bge _08011708
	ldrb r0, [r6, #4]
	subs r0, r0, r1
	b _0801170A
_08011708:
	movs r0, #0xff
_0801170A:
	strb r0, [r6, #2]
	ldr r3, _080117AC @ =gUnknown_03001870
	ldr r2, _080117B0 @ =gUnknown_03004D50
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r1, _080117B4 @ =sub_8011A4C
	str r1, [r0]
	ldr r2, _080117B8 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r2]
	ldrb r0, [r6, #1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x9e
	bhi _0801178C
	adds r4, r6, #0
	adds r4, #0x14
	ldr r1, [r7]
	ldr r0, [r5]
	adds r0, #1
	lsrs r0, r0, #2
	adds r1, r1, r0
	movs r0, #0xf
	ands r1, r0
	rsbs r1, r1, #0
	strh r1, [r4, #0x16]
	ldrb r0, [r6, #2]
	adds r0, #1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #0xc
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r5]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801178C
	ldrh r0, [r4, #0x18]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _0801178C
	movs r5, #0x10
_0801177A:
	adds r0, r4, #0
	bl sub_80051E8
	ldrh r0, [r4, #0x16]
	adds r0, #0x10
	strh r0, [r4, #0x16]
	subs r5, #1
	cmp r5, #0
	bge _0801177A
_0801178C:
	ldrb r0, [r6, #2]
	subs r2, r0, #1
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x9e
	bhi _080117C8
	ldr r1, _080117BC @ =gIntrTable
	ldr r0, _080117C0 @ =sub_8011ACC
	str r0, [r1, #0xc]
	ldr r0, _080117C4 @ =gUnknown_03002874
	strb r2, [r0]
	ldr r2, _080117B8 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	b _080117DA
	.align 2, 0
_080117AC: .4byte gUnknown_03001870
_080117B0: .4byte gUnknown_03004D50
_080117B4: .4byte sub_8011A4C
_080117B8: .4byte gFlags
_080117BC: .4byte gIntrTable
_080117C0: .4byte sub_8011ACC
_080117C4: .4byte gUnknown_03002874
_080117C8:
	ldr r1, _080117E4 @ =gIntrTable
	ldr r0, _080117E8 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	ldr r2, _080117EC @ =gFlags
	ldr r0, [r2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
_080117DA:
	str r0, [r2]
_080117DC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080117E4: .4byte gIntrTable
_080117E8: .4byte gIntrTableTemplate
_080117EC: .4byte gFlags

	thumb_func_start sub_80117F0
sub_80117F0: @ 0x080117F0
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08011850 @ =sub_8011870
	ldr r2, _08011854 @ =0x00004001
	ldr r1, _08011858 @ =sub_8011B3C
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	ldr r0, _0801185C @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0xc
	bl sub_8007C10
	str r0, [r5, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r5, #8]
	movs r0, #0x88
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r1, _08011860 @ =IWRAM_START + 0x3C
	adds r0, r4, r1
	strb r3, [r0]
	ldr r0, _08011864 @ =IWRAM_START + 0x3D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #0xc1
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x1c]
	ldr r0, _08011868 @ =IWRAM_START + 0x3E
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801186C @ =IWRAM_START + 0x41
	adds r4, r4, r1
	strb r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011850: .4byte sub_8011870
_08011854: .4byte 0x00004001
_08011858: .4byte sub_8011B3C
_0801185C: .4byte IWRAM_START + 0x1C
_08011860: .4byte IWRAM_START + 0x3C
_08011864: .4byte IWRAM_START + 0x3D
_08011868: .4byte IWRAM_START + 0x3E
_0801186C: .4byte IWRAM_START + 0x41

	thumb_func_start sub_8011870
sub_8011870: @ 0x08011870
	push {r4, r5, lr}
	ldr r0, _08011898 @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x1c
	adds r4, r1, r0
	ldr r5, _0801189C @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	ldr r1, _080118A0 @ =0x00020080
	ands r0, r1
	subs r1, #0x80
	cmp r0, r1
	beq _080118A4
	adds r0, r2, #0
	bl TaskDestroy
	b _080118F6
	.align 2, 0
_08011898: .4byte gCurTask
_0801189C: .4byte gUnknown_030059E0
_080118A0: .4byte 0x00020080
_080118A4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	str r1, [r3]
	ldr r0, _080118D4 @ =gUnknown_03005660
	movs r2, #4
	ldrsh r0, [r0, r2]
	str r0, [r3, #4]
	ldr r2, _080118D8 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080118E0
	ldr r0, [r4, #0x10]
	ldr r1, _080118DC @ =0xFFFFFBFF
	ands r0, r1
	b _080118E8
	.align 2, 0
_080118D4: .4byte gUnknown_03005660
_080118D8: .4byte gUnknown_03005960
_080118DC: .4byte 0xFFFFFBFF
_080118E0:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
_080118E8:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080118F6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80118FC
sub_80118FC: @ 0x080118FC
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0801194C @ =sub_801F214
	str r2, [sp]
	ldr r2, _08011950 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0
	bl sub_801F15C
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	ldr r0, _08011954 @ =IWRAM_START + 0x1C
	adds r5, r4, r0
	movs r0, #0xc
	bl sub_8007C10
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _08011958 @ =0x00000229
	strh r0, [r5, #0xa]
	ldr r0, _0801195C @ =IWRAM_START + 0x3C
	adds r4, r4, r0
	strb r1, [r4]
	movs r0, #0xe0
	lsls r0, r0, #1
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	adds r0, r6, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801194C: .4byte sub_801F214
_08011950: .4byte sub_801F550
_08011954: .4byte IWRAM_START + 0x1C
_08011958: .4byte 0x00000229
_0801195C: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8011960
sub_8011960: @ 0x08011960
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	asrs r7, r3, #4
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	beq _08011A12
	ldr r6, _08011A18 @ =0x7BDE7BDE
	ldr r3, _08011A1C @ =0x739C739C
	adds r2, r3, #0
	ands r2, r1
_0801197A:
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	ldm r4!, {r0}
	adds r1, r0, #0
	ands r1, r6
	ands r0, r3
	adds r0, r0, r2
	lsrs r0, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #1
	stm r5!, {r1}
	adds r0, r7, #0
	subs r7, #1
	cmp r0, #0
	bne _0801197A
_08011A12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011A18: .4byte 0x7BDE7BDE
_08011A1C: .4byte 0x739C739C

	thumb_func_start sub_8011A20
sub_8011A20: @ 0x08011A20
	ldr r3, _08011A3C @ =gUnknown_03005660
	ldr r2, _08011A40 @ =gFlags
	ldr r0, [r2]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _08011A44 @ =gIntrTable
	ldr r0, _08011A48 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	movs r0, #0
	str r0, [r3, #0x10]
	bx lr
	.align 2, 0
_08011A3C: .4byte gUnknown_03005660
_08011A40: .4byte gFlags
_08011A44: .4byte gIntrTable
_08011A48: .4byte gIntrTableTemplate

	thumb_func_start sub_8011A4C
sub_8011A4C: @ 0x08011A4C
	push {r4, r5, lr}
	ldr r3, _08011AAC @ =gUnknown_03005660
	ldr r0, [r3, #0x10]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldrb r2, [r3, #2]
	strb r2, [r3, #1]
	ldr r0, [r3, #8]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #8]
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _08011AA4
	ldr r0, _08011AB0 @ =0x040000D4
	ldr r2, _08011AB4 @ =IWRAM_START + 0x200
	adds r1, r4, r2
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08011AB8 @ =0x84000074
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [r0]
	ldr r1, _08011ABC @ =0x05000200
	str r1, [r0, #4]
	ldr r1, _08011AC0 @ =0x84000080
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08011AC4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08011AC8 @ =gFlags
	ldr r0, [r2]
	movs r1, #3
	orrs r0, r1
	str r0, [r2]
_08011AA4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011AAC: .4byte gUnknown_03005660
_08011AB0: .4byte 0x040000D4
_08011AB4: .4byte IWRAM_START + 0x200
_08011AB8: .4byte 0x84000074
_08011ABC: .4byte 0x05000200
_08011AC0: .4byte 0x84000080
_08011AC4: .4byte 0x0000FEFF
_08011AC8: .4byte gFlags

	thumb_func_start sub_8011ACC
sub_8011ACC: @ 0x08011ACC
	ldr r0, _08011B18 @ =gUnknown_03005660
	ldr r0, [r0, #0x10]
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r1, r2
	ldr r0, _08011B1C @ =0x040000D4
	ldr r3, _08011B20 @ =IWRAM_START + 0x200
	adds r1, r1, r3
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08011B24 @ =0x84000074
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [r0]
	ldr r1, _08011B28 @ =0x05000200
	str r1, [r0, #4]
	ldr r1, _08011B2C @ =0x84000080
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08011B30 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08011B34 @ =gFlags
	ldr r0, [r2]
	movs r1, #3
	orrs r0, r1
	str r0, [r2]
	ldr r1, _08011B38 @ =0x04000202
	movs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_08011B18: .4byte gUnknown_03005660
_08011B1C: .4byte 0x040000D4
_08011B20: .4byte IWRAM_START + 0x200
_08011B24: .4byte 0x84000074
_08011B28: .4byte 0x05000200
_08011B2C: .4byte 0x84000080
_08011B30: .4byte 0x0000FEFF
_08011B34: .4byte gFlags
_08011B38: .4byte 0x04000202

	thumb_func_start sub_8011B3C
sub_8011B3C: @ 0x08011B3C
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08011B50 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0
	.align 2, 0
_08011B50: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8011B54
sub_8011B54: @ 0x08011B54
	push {lr}
	adds r3, r0, #0
	asrs r2, r2, #4
	b _08011B7C
_08011B5C:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
_08011B7C:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _08011B5C
	pop {r0}
	bx r0

	thumb_func_start sub_8011B88
sub_8011B88: @ 0x08011B88
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r0, _08011BA8 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08011BAC
	movs r0, #0
	b _08011C7E
	.align 2, 0
_08011BA8: .4byte gUnknown_030054CC
_08011BAC:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _08011BF0 @ =gUnknown_030059E0
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _08011BF4 @ =sub_801F214
	str r2, [sp]
	ldr r2, _08011BF8 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov r0, r8
	cmp r0, #0
	bne _08011BFC
	adds r0, r4, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r7, #0x16]
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r7, #0x18]
	b _08011C44
	.align 2, 0
_08011BF0: .4byte gUnknown_030059E0
_08011BF4: .4byte sub_801F214
_08011BF8: .4byte sub_801F550
_08011BFC:
	mov r1, r8
	cmp r1, #0
	blt _08011C44
	cmp r1, #2
	bgt _08011C44
	ldr r1, _08011C8C @ =gUnknown_080D6736
	adds r2, r4, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r3, [r0]
	strh r3, [r7, #0x16]
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0x18]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08011C44
	ldr r1, _08011C90 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r7, #0x16]
_08011C44:
	adds r6, r7, #0
	adds r6, #0x1c
	ldr r5, _08011C94 @ =gUnknown_080D5518
	mov r3, r8
	lsls r4, r3, #1
	add r4, r8
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	adds r0, r7, #0
	adds r0, #0x3c
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, sb
_08011C7E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08011C8C: .4byte gUnknown_080D6736
_08011C90: .4byte gUnknown_080D672C
_08011C94: .4byte gUnknown_080D5518

	thumb_func_start sub_8011C98
sub_8011C98: @ 0x08011C98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r0, _08011CB0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08011CB4
	movs r0, #0
	b _08011D30
	.align 2, 0
_08011CB0: .4byte gUnknown_030054CC
_08011CB4:
	ldr r0, _08011D3C @ =sub_8012034
	ldr r2, _08011D40 @ =0x00004001
	ldr r1, _08011D44 @ =sub_80124B8
	str r1, [sp]
	movs r1, #0x5c
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x2c
	adds r6, r1, r0
	movs r2, #0
	subs r0, #0x18
	adds r4, r1, r0
_08011CD8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #2
	adds r1, r3, r2
	str r7, [r1]
	adds r2, r4, r2
	str r5, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08011CD8
	movs r5, #0
	movs r4, #0
	strh r4, [r3, #0x28]
	movs r0, #0x10
	bl sub_8007C10
	str r0, [r6, #4]
	strh r4, [r6, #8]
	movs r0, #0x33
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, r8
_08011D30:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08011D3C: .4byte sub_8012034
_08011D40: .4byte 0x00004001
_08011D44: .4byte sub_80124B8

	thumb_func_start sub_8011D48
sub_8011D48: @ 0x08011D48
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08011D90 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x16
	orrs r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08011DA2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08011D94
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08011D98
	.align 2, 0
_08011D90: .4byte 0xFFFFBFFF
_08011D94:
	movs r0, #0xc0
	lsls r0, r0, #2
_08011D98:
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	b _08011DA8
_08011DA2:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x11
_08011DA8:
	strh r0, [r1]
	movs r0, #0x79
	bl m4aSongNumStart
	ldr r0, _08011DC4 @ =gUnknown_030059E0
	ldr r1, _08011DC8 @ =sub_8011DCC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011DC4: .4byte gUnknown_030059E0
_08011DC8: .4byte sub_8011DCC

	thumb_func_start sub_8011DCC
sub_8011DCC: @ 0x08011DCC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08011DE0
	subs r0, #8
	cmp r0, #0
	bge _08011DEC
	b _08011DEA
_08011DE0:
	cmp r0, #0
	bge _08011DEE
	adds r0, #8
	cmp r0, #0
	ble _08011DEC
_08011DEA:
	movs r0, #0
_08011DEC:
	strh r0, [r4, #0x14]
_08011DEE:
	adds r0, r4, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08011E7C
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08011E22
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	b _08011E7C
_08011E22:
	adds r0, r4, #0
	adds r0, #0x6a
	movs r1, #1
	movs r2, #1
	strh r2, [r0]
	adds r0, #2
	strb r1, [r0]
	ldr r1, _08011E50 @ =gUnknown_030059E0
	ldr r0, _08011E54 @ =sub_8011E88
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08011E60
	ldr r0, [r4, #0x20]
	ands r0, r2
	cmp r0, #0
	beq _08011E58
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r4, #0x14]
	b _08011E6E
	.align 2, 0
_08011E50: .4byte gUnknown_030059E0
_08011E54: .4byte sub_8011E88
_08011E58:
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x14]
	b _08011E6E
_08011E60:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	bl sub_8011B88
_08011E6E:
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #0x6f
	bl m4aSongNumStart
_08011E7C:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8011E88
sub_8011E88: @ 0x08011E88
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _08011E9C
	subs r0, #0x20
	cmp r0, #0
	bge _08011EA8
	b _08011EA6
_08011E9C:
	cmp r0, #0
	bge _08011EAA
	adds r0, #0x20
	cmp r0, #0
	ble _08011EA8
_08011EA6:
	movs r0, #0
_08011EA8:
	strh r0, [r4, #0x14]
_08011EAA:
	adds r0, r4, #0
	bl sub_8029C84
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08011EF6
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08011EE2
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	b _08011EF6
_08011EE2:
	adds r0, r4, #0
	adds r0, #0x6a
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6c
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08011F14 @ =gUnknown_030059E0
	ldr r0, _08011F18 @ =sub_80123D0
	str r0, [r1]
_08011EF6:
	adds r0, r4, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08011F0C
	adds r0, r4, #0
	bl sub_8029FA4
_08011F0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011F14: .4byte gUnknown_030059E0
_08011F18: .4byte sub_80123D0

	thumb_func_start sub_8011F1C
sub_8011F1C: @ 0x08011F1C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r5, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08011F88 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x24
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08011F70
	movs r0, #0x83
	bl m4aSongNumStart
_08011F70:
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	ldr r0, _08011F8C @ =gUnknown_030059E0
	ldr r1, _08011F90 @ =sub_80123FC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011F88: .4byte 0xFFFFBFFF
_08011F8C: .4byte gUnknown_030059E0
_08011F90: .4byte sub_80123FC

	thumb_func_start sub_8011F94
sub_8011F94: @ 0x08011F94
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	adds r0, #0x38
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80283C4
	ldr r5, [r4, #0x20]
	ldr r0, _0801201C @ =0x00004002
	ands r0, r5
	cmp r0, #2
	beq _08012016
	ldr r3, _08012020 @ =0xFFFFFA00
	adds r0, r4, #0
	adds r0, #0x24
	ldr r2, _08012024 @ =gUnknown_08097AA4
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	rsbs r6, r0, #0
	strh r6, [r4, #0x10]
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	cmp r0, #0
	bge _08011FE4
	rsbs r0, r0, #0
_08011FE4:
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x10]
	ldr r1, _08012028 @ =gUnknown_030059E0
	ldr r0, _0801202C @ =sub_8012460
	str r0, [r1]
	movs r0, #2
	orrs r5, r0
	str r5, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801200E
	movs r0, #0xdf
	bl m4aSongNumStart
_0801200E:
	adds r1, r4, #0
	adds r1, #0x64
	ldr r0, _08012030 @ =0x0000FFFF
	strh r0, [r1]
_08012016:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801201C: .4byte 0x00004002
_08012020: .4byte 0xFFFFFA00
_08012024: .4byte gUnknown_08097AA4
_08012028: .4byte gUnknown_030059E0
_0801202C: .4byte sub_8012460
_08012030: .4byte 0x0000FFFF

	thumb_func_start sub_8012034
sub_8012034: @ 0x08012034
	push {r4, r5, lr}
	sub sp, #8
	ldr r2, _08012074 @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0x2c
	adds r4, r1, r0
	ldr r3, _08012078 @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801206A
	movs r0, #0x12
	ldrsh r1, [r3, r0]
	ldr r0, _0801207C @ =0x000001FF
	cmp r1, r0
	ble _0801206A
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x24
	beq _08012080
_0801206A:
	ldr r0, [r2]
	bl TaskDestroy
	b _080120B2
	.align 2, 0
_08012074: .4byte gCurTask
_08012078: .4byte gUnknown_030059E0
_0801207C: .4byte 0x000001FF
_08012080:
	adds r0, r4, #0
	bl sub_8004558
	ldrh r1, [r5, #0x28]
	subs r1, #1
	movs r0, #6
	ands r1, r0
	strh r1, [r5, #0x28]
	mov r0, sp
	bl sub_80157C8
	ldr r0, [sp]
	asrs r0, r0, #8
	ldr r2, _080120BC @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_80051E8
_080120B2:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080120BC: .4byte gUnknown_03005960

	thumb_func_start sub_80120C0
sub_80120C0: @ 0x080120C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, [r6, #0x20]
	movs r4, #0x10
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	beq _080120F8
	adds r3, r6, #0
	adds r3, #0x5c
	ldrh r1, [r3]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080120E4
	movs r0, #1
	orrs r2, r0
	str r2, [r6, #0x20]
_080120E4:
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080120F8
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
_080120F8:
	adds r0, r6, #0
	bl sub_80218E4
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _08012130 @ =0xFEFFFFDB
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x50
	strh r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012138
	ldr r1, _08012134 @ =0xFFFFFDC0
	b _0801213C
	.align 2, 0
_08012130: .4byte 0xFEFFFFDB
_08012134: .4byte 0xFFFFFDC0
_08012138:
	movs r1, #0x90
	lsls r1, r1, #2
_0801213C:
	adds r0, r1, #0
	ldrh r1, [r6, #0x10]
	adds r0, r0, r1
	strh r0, [r6, #0x10]
	movs r4, #0
	movs r0, #0
	strh r0, [r6, #0x12]
	adds r5, r6, #0
	adds r5, #0x24
	strb r4, [r5]
	adds r0, r6, #0
	adds r0, #0x70
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0x70
	bl m4aSongNumStart
	adds r0, r6, #0
	adds r0, #0x6e
	strb r4, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012188 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	strb r4, [r5]
	ldr r0, _0801218C @ =gUnknown_030059E0
	ldr r1, _08012190 @ =sub_80261D8
	str r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012188: .4byte 0xFFFFBFFF
_0801218C: .4byte gUnknown_030059E0
_08012190: .4byte sub_80261D8

	thumb_func_start sub_8012194
sub_8012194: @ 0x08012194
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08012240 @ =gUnknown_030054C0
	ldrh r4, [r0, #4]
	movs r5, #0xc0
	lsls r5, r5, #3
	adds r0, r6, #0
	bl sub_80218E4
	ldr r0, [r6, #0x20]
	ldr r1, _08012244 @ =0x22000002
	orrs r0, r1
	ldr r1, _08012248 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #9
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r3, #0
	movs r0, #0x13
	strh r0, [r1]
	ldr r1, _0801224C @ =gUnknown_08097AA4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r4, r4, #1
	adds r4, r4, r1
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r5, r0
	asrs r0, r0, #8
	strh r0, [r6, #0x10]
	adds r0, r1, #0
	muls r0, r5, r0
	asrs r0, r0, #8
	subs r0, #0x80
	strh r0, [r6, #0x12]
	adds r4, r6, #0
	adds r4, #0x24
	strb r3, [r4]
	adds r0, r6, #0
	adds r0, #0x70
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #3
	strb r3, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012250 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	strb r3, [r4]
	adds r1, r6, #0
	adds r1, #0x72
	movs r0, #0x3c
	strh r0, [r1]
	movs r0, #0x70
	bl m4aSongNumStart
	ldr r0, _08012254 @ =gUnknown_030059E0
	ldr r1, _08012258 @ =sub_80124D0
	str r1, [r0]
	adds r0, r6, #0
	bl _call_via_r1
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012240: .4byte gUnknown_030054C0
_08012244: .4byte 0x22000002
_08012248: .4byte 0xFEFFFFDF
_0801224C: .4byte gUnknown_08097AA4
_08012250: .4byte 0xFFFFBFFF
_08012254: .4byte gUnknown_030059E0
_08012258: .4byte sub_80124D0

	thumb_func_start sub_801225C
sub_801225C: @ 0x0801225C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_80218E4
	ldr r0, [r5, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	ldr r1, _080122CC @ =0xDEFFFFDF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r2, #0
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r1, #0xe
	strb r1, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x64
	movs r3, #0
	strh r1, [r0]
	strh r2, [r5, #0x10]
	movs r0, #0xfc
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	adds r4, r5, #0
	adds r4, #0x24
	strb r3, [r4]
	adds r1, r5, #0
	adds r1, #0x70
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x71
	strb r3, [r0]
	subs r0, #3
	strb r3, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080122D0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	strb r3, [r4]
	ldr r0, _080122D4 @ =gUnknown_030059E0
	ldr r1, _080122D8 @ =sub_80261D8
	str r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080122CC: .4byte 0xDEFFFFDF
_080122D0: .4byte 0xFFFFBFFF
_080122D4: .4byte gUnknown_030059E0
_080122D8: .4byte sub_80261D8

	thumb_func_start sub_80122DC
sub_80122DC: @ 0x080122DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	mov r8, r1
	ldr r5, _08012350 @ =gUnknown_030059E0
	ldr r0, [r5, #8]
	mov r1, ip
	subs r0, r0, r1
	asrs r4, r0, #8
	ldr r0, [r5, #0xc]
	mov r2, r8
	subs r0, r0, r2
	asrs r3, r0, #8
	adds r1, r4, #0
	muls r1, r4, r1
	adds r0, r3, #0
	muls r0, r3, r0
	adds r6, r1, r0
	adds r0, r5, #0
	adds r0, #0x85
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bne _08012382
	ldr r7, _08012354 @ =gUnknown_030054C0
	ldr r0, [r7]
	cmp r6, r0
	bge _080123C6
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012360
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	ldr r3, _08012358 @ =0xFFFFFF00
	adds r1, r0, r3
	ldr r0, _0801235C @ =0x000003FF
	adds r2, r0, #0
	ands r1, r2
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080123C6
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	subs r0, r0, r1
	ands r0, r2
	str r6, [r7]
	strh r0, [r7, #4]
	b _080123C6
	.align 2, 0
_08012350: .4byte gUnknown_030059E0
_08012354: .4byte gUnknown_030054C0
_08012358: .4byte 0xFFFFFF00
_0801235C: .4byte 0x000003FF
_08012360:
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x9c
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080123C6
	str r6, [r7]
	strh r1, [r7, #4]
	b _080123C6
_08012382:
	cmp r2, #1
	bne _080123C6
	ldr r0, _080123A4 @ =gCurTask
	ldr r3, [r0]
	ldr r0, _080123A8 @ =gUnknown_03005498
	ldr r1, [r0]
	adds r7, r0, #0
	cmp r6, r1
	bge _080123C6
	ldr r0, [r5, #0x20]
	ands r0, r2
	cmp r0, #0
	beq _080123AC
	cmp r4, #0
	bge _080123B0
	b _080123B4
	.align 2, 0
_080123A4: .4byte gCurTask
_080123A8: .4byte gUnknown_03005498
_080123AC:
	cmp r4, #0
	bgt _080123B4
_080123B0:
	str r6, [r7]
	str r3, [r7, #4]
_080123B4:
	ldrb r0, [r3, #0x15]
	cmp r0, #0
	beq _080123C6
	mov r1, ip
	asrs r0, r1, #8
	strh r0, [r3, #0x16]
	mov r2, r8
	asrs r0, r2, #8
	strh r0, [r3, #0x18]
_080123C6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80123D0
sub_80123D0: @ 0x080123D0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080123EA
	ldr r1, _080123F4 @ =gUnknown_030059E0
	ldr r0, _080123F8 @ =sub_8025318
	str r0, [r1]
_080123EA:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_080123F4: .4byte gUnknown_030059E0
_080123F8: .4byte sub_8025318

	thumb_func_start sub_80123FC
sub_80123FC: @ 0x080123FC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80283C4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801245A
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x12]
	ldr r1, _08012448 @ =gUnknown_030059E0
	ldr r0, _0801244C @ =sub_8011F94
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08012450
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	bl sub_8011C98
	b _0801245A
	.align 2, 0
_08012448: .4byte gUnknown_030059E0
_0801244C: .4byte sub_8011F94
_08012450:
	cmp r0, #4
	bne _0801245A
	movs r0, #3
	bl sub_8015BD4
_0801245A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8012460
sub_8012460: @ 0x08012460
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x12]
	adds r0, #0x38
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08012486
	adds r1, r2, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08012490 @ =gUnknown_030059E0
	ldr r0, _08012494 @ =sub_8012498
	str r0, [r1]
_08012486:
	adds r0, r2, #0
	bl sub_80283C4
	pop {r0}
	bx r0
	.align 2, 0
_08012490: .4byte gUnknown_030059E0
_08012494: .4byte sub_8012498

	thumb_func_start sub_8012498
sub_8012498: @ 0x08012498
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080124B2
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_080124B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80124B8
sub_80124B8: @ 0x080124B8
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _080124CC @ =IWRAM_START + 0x2C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0
	.align 2, 0
_080124CC: .4byte IWRAM_START + 0x2C

	thumb_func_start sub_80124D0
sub_80124D0: @ 0x080124D0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080124FA
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _08012518 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
_080124FA:
	adds r0, r4, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08012512
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08012512:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012518: .4byte 0xFDFFFFFF

	thumb_func_start sub_801251C
sub_801251C: @ 0x0801251C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08012540
	adds r0, r1, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #1
	bne _08012540
	adds r0, r1, #0
	bl sub_80120C0
	movs r0, #1
	b _08012542
_08012540:
	movs r0, #0
_08012542:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8012548
sub_8012548: @ 0x08012548
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012594 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08012582
	rsbs r0, r0, #0
_08012582:
	cmp r0, #0x3f
	bgt _08012598
	movs r0, #0
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	b _0801259E
	.align 2, 0
_08012594: .4byte 0xFFFFBFFF
_08012598:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x57
_0801259E:
	strh r0, [r1]
	ldr r0, _080125B4 @ =gUnknown_030059E0
	ldr r1, _080125B8 @ =sub_80127F0
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080125B4: .4byte gUnknown_030059E0
_080125B8: .4byte sub_80127F0

	thumb_func_start sub_80125BC
sub_80125BC: @ 0x080125BC
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0xac
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080125E2
	adds r4, r2, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x55
	bne _080125DC
	movs r0, #0xe3
	bl m4aSongNumStop
_080125DC:
	movs r0, #0x55
	strh r0, [r4]
	b _0801263E
_080125E2:
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080125FA
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801260C
_080125FA:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08012616
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012616
_0801260C:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x54
	strh r0, [r1]
	b _08012638
_08012616:
	adds r3, r2, #0
	adds r3, #0x64
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0x54
	bne _08012634
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012638
_08012634:
	movs r0, #0x53
	strh r0, [r3]
_08012638:
	movs r0, #0xe3
	bl m4aSongNumStartOrChange
_0801263E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8012644
sub_8012644: @ 0x08012644
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801266E
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
_0801266E:
	adds r1, r4, #0
	adds r1, #0xac
	movs r2, #0
	movs r3, #0
	movs r0, #0xf0
	strh r0, [r1]
	subs r1, #0x4b
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	subs r0, #2
	strh r3, [r0]
	ldr r2, _080126A8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r2, #0x20]
	ldr r1, _080126AC @ =sub_80126B0
	str r1, [r2]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080126A8: .4byte gUnknown_030059E0
_080126AC: .4byte sub_80126B0

	thumb_func_start sub_80126B0
sub_80126B0: @ 0x080126B0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xac
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080126F0
	subs r0, r2, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _080126EC @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _080126F0
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x56
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	movs r0, #0xe3
	bl m4aSongNumStop
	b _080127EA
	.align 2, 0
_080126EC: .4byte gUnknown_03005B38
_080126F0:
	adds r2, r4, #0
	adds r2, #0x61
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _08012724
	ldrh r3, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0801271E
	adds r0, r3, #0
	subs r0, #0x18
	strh r0, [r4, #0x12]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x20
	bne _08012756
_0801271E:
	movs r0, #1
	strb r0, [r2]
	b _08012756
_08012724:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _080127A8 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08012750
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08012750
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08012750
	movs r0, #2
	strb r0, [r2]
_08012750:
	ldrh r0, [r4, #0x12]
	adds r0, #8
	strh r0, [r4, #0x12]
_08012756:
	ldr r0, _080127AC @ =gUnknown_03005960
	ldr r0, [r0, #0x28]
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	bge _08012770
	str r1, [r4, #0xc]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bge _08012770
	movs r0, #0
	strh r0, [r4, #0x12]
_08012770:
	adds r0, r4, #0
	bl sub_80125BC
	ldr r1, _080127B0 @ =gUnknown_080D552C
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0801278E
	rsbs r1, r1, #0
_0801278E:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _080127BC
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _080127B4
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	subs r0, r1, r0
	b _080127BA
	.align 2, 0
_080127A8: .4byte gUnknown_03005B38
_080127AC: .4byte gUnknown_03005960
_080127B0: .4byte gUnknown_080D552C
_080127B4:
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	adds r0, r1, r0
_080127BA:
	strh r0, [r4, #0x10]
_080127BC:
	adds r0, r4, #0
	bl sub_80282EC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080127D4
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	b _080127E8
_080127D4:
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _080127EA
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
_080127E8:
	strb r0, [r1]
_080127EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80127F0
sub_80127F0: @ 0x080127F0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012826
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801281E
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #9
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	b _08012824
_0801281E:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
_08012824:
	strb r0, [r1]
_08012826:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0

	thumb_func_start sub_8012830
sub_8012830: @ 0x08012830
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0801287C @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x11
	strh r0, [r1]
	ldr r0, _08012880 @ =gUnknown_030059E0
	ldr r1, _08012884 @ =sub_8012938
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801287C: .4byte 0xFFFFBFFF
_08012880: .4byte gUnknown_030059E0
_08012884: .4byte sub_8012938

	thumb_func_start sub_8012888
sub_8012888: @ 0x08012888
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080128D0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _080128D4 @ =0x20000102
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x12
	strh r0, [r1]
	ldr r0, _080128D8 @ =gUnknown_030059E0
	ldr r1, _080128DC @ =sub_8012978
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080128D0: .4byte 0xFFFFBFFF
_080128D4: .4byte 0x20000102
_080128D8: .4byte gUnknown_030059E0
_080128DC: .4byte sub_8012978

	thumb_func_start sub_80128E0
sub_80128E0: @ 0x080128E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012928 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _0801292C @ =0x20000102
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x13
	strh r0, [r1]
	ldr r0, _08012930 @ =gUnknown_030059E0
	ldr r1, _08012934 @ =sub_80129BC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012928: .4byte 0xFFFFBFFF
_0801292C: .4byte 0x20000102
_08012930: .4byte gUnknown_030059E0
_08012934: .4byte sub_80129BC

	thumb_func_start sub_8012938
sub_8012938: @ 0x08012938
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801296E
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08012966
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	b _0801296C
_08012966:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
_0801296C:
	strb r0, [r1]
_0801296E:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0

	thumb_func_start sub_8012978
sub_8012978: @ 0x08012978
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801299C
	ldr r0, [r4, #0x68]
	cmp r0, #0x6c
	bne _0801299C
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0801299C:
	adds r0, r4, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080129B4
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_080129B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80129BC
sub_80129BC: @ 0x080129BC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080129D6
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_080129D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_80129DC
sub_80129DC: @ 0x080129DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, _080129F4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _080129F8
	movs r0, #0
	b _08012ABE
	.align 2, 0
_080129F4: .4byte gUnknown_030054CC
_080129F8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r5, _08012A7C @ =gUnknown_030059E0
	adds r2, r5, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _08012A80 @ =sub_801F214
	str r2, [sp]
	ldr r2, _08012A84 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov r8, r0
	ldrh r6, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r3, r6, r3
	ldr r1, _08012A88 @ =gUnknown_080D672C
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r3, #0x16]
	ldr r2, _08012A8C @ =gUnknown_080D6736
	adds r4, r5, #0
	adds r4, #0x64
	movs r7, #0
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x18]
	ldr r7, _08012A90 @ =IWRAM_START + 0x1C
	adds r4, r6, r7
	adds r0, r5, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08012A9C
	movs r0, #0xf
	bl sub_8007C10
	str r0, [r4, #4]
	ldr r0, _08012A94 @ =0x0000034D
	strh r0, [r4, #0xa]
	ldr r0, _08012A98 @ =IWRAM_START + 0x3C
	adds r1, r6, r0
	movs r0, #0
	b _08012AAE
	.align 2, 0
_08012A7C: .4byte gUnknown_030059E0
_08012A80: .4byte sub_801F214
_08012A84: .4byte sub_801F550
_08012A88: .4byte gUnknown_080D672C
_08012A8C: .4byte gUnknown_080D6736
_08012A90: .4byte IWRAM_START + 0x1C
_08012A94: .4byte 0x0000034D
_08012A98: .4byte IWRAM_START + 0x3C
_08012A9C:
	movs r0, #0x18
	bl sub_8007C10
	str r0, [r4, #4]
	movs r0, #0xc6
	strh r0, [r4, #0xa]
	ldr r7, _08012ACC @ =IWRAM_START + 0x3C
	adds r1, r6, r7
	movs r0, #1
_08012AAE:
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	mov r0, r8
_08012ABE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012ACC: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8012AD0
sub_8012AD0: @ 0x08012AD0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012B34 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x5b
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r1, [r4, #0x20]
	ldr r0, _08012B38 @ =0x20000102
	orrs r1, r0
	str r1, [r4, #0x20]
	movs r2, #0xfc
	lsls r2, r2, #8
	strh r2, [r4, #0x12]
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08012B1A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_08012B1A:
	movs r0, #0x74
	bl m4aSongNumStart
	ldr r0, _08012B3C @ =gUnknown_030059E0
	ldr r1, _08012B40 @ =sub_8012D1C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012B34: .4byte 0xFFFFBFFF
_08012B38: .4byte 0x20000102
_08012B3C: .4byte gUnknown_030059E0
_08012B40: .4byte sub_8012D1C

	thumb_func_start sub_8012B44
sub_8012B44: @ 0x08012B44
	push {lr}
	adds r2, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _08012B60
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x5a
	strh r0, [r1]
	movs r0, #0x78
	bl m4aSongNumStop
	b _08012BBC
_08012B60:
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08012B78
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012B8A
_08012B78:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08012B94
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012B94
_08012B8A:
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x59
	strh r0, [r1]
	b _08012BB6
_08012B94:
	adds r3, r2, #0
	adds r3, #0x64
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0x59
	bne _08012BB2
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012BB6
_08012BB2:
	movs r0, #0x58
	strh r0, [r3]
_08012BB6:
	movs r0, #0x78
	bl m4aSongNumStartOrChange
_08012BBC:
	pop {r0}
	bx r0

	thumb_func_start sub_8012BC0
sub_8012BC0: @ 0x08012BC0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08012BEA
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
_08012BEA:
	adds r1, r4, #0
	adds r1, #0xb0
	movs r0, #0xf0
	str r0, [r1]
	adds r2, r4, #0
	adds r2, #0x61
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r1, [r0]
	subs r0, #2
	strh r1, [r0]
	ldr r2, _08012C24 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r2, #0x20]
	ldr r1, _08012C28 @ =sub_8012C2C
	str r1, [r2]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012C24: .4byte gUnknown_030059E0
_08012C28: .4byte sub_8012C2C

	thumb_func_start sub_8012C2C
sub_8012C2C: @ 0x08012C2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08012C80 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08012C4A
	adds r1, r4, #0
	adds r1, #0xb0
	ldr r0, [r1]
	cmp r0, #0
	beq _08012C4A
	subs r0, #1
	str r0, [r1]
_08012C4A:
	adds r2, r4, #0
	adds r2, #0x61
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #1
	beq _08012C84
	ldrh r3, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08012C78
	adds r0, r3, #0
	subs r0, #0x18
	strh r0, [r4, #0x12]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x20
	bne _08012CB4
_08012C78:
	movs r0, #1
	strb r0, [r2]
	b _08012CB4
	.align 2, 0
_08012C80: .4byte gUnknown_03005590
_08012C84:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08012CF8 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08012CAE
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08012CAE
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _08012CAE
	movs r0, #2
	strb r0, [r2]
_08012CAE:
	ldrh r0, [r4, #0x12]
	adds r0, #8
	strh r0, [r4, #0x12]
_08012CB4:
	ldr r0, _08012CFC @ =gUnknown_03005960
	ldr r0, [r0, #0x28]
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	cmp r0, r1
	bge _08012CCE
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08012CCE
	movs r0, #0
	strh r0, [r4, #0x12]
_08012CCE:
	adds r0, r4, #0
	bl sub_8012B44
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r4, #0x40]
	movs r0, #0x10
	str r0, [r4, #0x48]
	adds r0, r4, #0
	bl sub_80282EC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08012D00
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	b _08012D14
	.align 2, 0
_08012CF8: .4byte gUnknown_03005B38
_08012CFC: .4byte gUnknown_03005960
_08012D00:
	movs r0, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08012D16
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
_08012D14:
	strb r0, [r1]
_08012D16:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8012D1C
sub_8012D1C: @ 0x08012D1C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08012D32
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08012D32:
	adds r0, r2, #0
	bl sub_8028204
	pop {r0}
	bx r0

	thumb_func_start sub_8012D3C
sub_8012D3C: @ 0x08012D3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012D98 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	bl sub_80129DC
	movs r0, #0x79
	bl m4aSongNumStart
	ldr r0, _08012D9C @ =gUnknown_030059E0
	ldr r1, _08012DA0 @ =sub_8012DA4
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012D98: .4byte 0xFFFFBFFF
_08012D9C: .4byte gUnknown_030059E0
_08012DA0: .4byte sub_8012DA4

	thumb_func_start sub_8012DA4
sub_8012DA4: @ 0x08012DA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	cmp r1, #0
	ble _08012DBC
	subs r1, r1, r0
	cmp r1, #0
	bge _08012DC4
	b _08012DC2
_08012DBC:
	adds r1, r1, r0
	cmp r1, #0
	ble _08012DC4
_08012DC2:
	movs r1, #0
_08012DC4:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012DE4
	ldr r1, _08012DF0 @ =gUnknown_030059E0
	ldr r0, _08012DF4 @ =sub_8025318
	str r0, [r1]
_08012DE4:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012DF0: .4byte gUnknown_030059E0
_08012DF4: .4byte sub_8025318

	thumb_func_start sub_8012DF8
sub_8012DF8: @ 0x08012DF8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _08012E18 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08012E1C
	movs r0, #0
	b _08012EBE
	.align 2, 0
_08012E18: .4byte gUnknown_030054CC
_08012E1C:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r4, _08012ECC @ =gUnknown_030059E0
	adds r2, r4, #0
	adds r2, #0x60
	movs r3, #0
	ldrsb r3, [r2, r3]
	ldr r2, _08012ED0 @ =sub_801F214
	str r2, [sp]
	ldr r2, _08012ED4 @ =sub_801F550
	str r2, [sp, #4]
	movs r2, #0xe8
	bl sub_801F15C
	mov r8, r0
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r7, r0
	ldr r1, _08012ED8 @ =gUnknown_080D6736
	adds r2, r4, #0
	adds r2, #0x64
	movs r5, #0
	ldrsh r0, [r2, r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r5, [r0]
	strh r5, [r3, #0x16]
	movs r6, #0
	ldrsh r0, [r2, r6]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x18]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08012E84
	ldr r1, _08012EDC @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r5, r0
	strh r0, [r3, #0x16]
_08012E84:
	ldr r2, _08012EE0 @ =IWRAM_START + 0x1C
	adds r6, r7, r2
	ldr r5, _08012EE4 @ =gUnknown_080D553C
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r6, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r1, [r4]
	ldr r2, _08012EE8 @ =IWRAM_START + 0x3C
	adds r0, r7, r2
	strb r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r6, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r6, #0x10]
	mov r0, r8
_08012EBE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012ECC: .4byte gUnknown_030059E0
_08012ED0: .4byte sub_801F214
_08012ED4: .4byte sub_801F550
_08012ED8: .4byte gUnknown_080D6736
_08012EDC: .4byte gUnknown_080D672C
_08012EE0: .4byte IWRAM_START + 0x1C
_08012EE4: .4byte gUnknown_080D553C
_08012EE8: .4byte IWRAM_START + 0x3C

	thumb_func_start sub_8012EEC
sub_8012EEC: @ 0x08012EEC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08012F44 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x16
	orrs r2, r0
	str r2, [r4, #0x20]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08012F2E
	rsbs r1, r1, #0
_08012F2E:
	ldr r0, _08012F48 @ =0x000002FF
	cmp r1, r0
	bgt _08012F52
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _08012F4C
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08012F50
	.align 2, 0
_08012F44: .4byte 0xFFFFBFFF
_08012F48: .4byte 0x000002FF
_08012F4C:
	movs r0, #0xc0
	lsls r0, r0, #2
_08012F50:
	strh r0, [r4, #0x14]
_08012F52:
	ldr r0, _08012F64 @ =gUnknown_030059E0
	ldr r1, _08012F68 @ =sub_8012F6C
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012F64: .4byte gUnknown_030059E0
_08012F68: .4byte sub_8012F6C

	thumb_func_start sub_8012F6C
sub_8012F6C: @ 0x08012F6C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08012F80
	subs r0, #0x60
	cmp r0, #0
	bge _08012F8C
	b _08012F8A
_08012F80:
	cmp r0, #0
	bge _08012F8E
	adds r0, #0x60
	cmp r0, #0
	ble _08012F8C
_08012F8A:
	movs r0, #0
_08012F8C:
	strh r0, [r2, #0x14]
_08012F8E:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08012FFC
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08012FBC
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	b _08012FFC
_08012FBC:
	adds r1, r2, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x6c
	movs r3, #1
	strb r3, [r0]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08012FD8
	rsbs r1, r1, #0
_08012FD8:
	ldr r0, _08012FEC @ =0x000002FF
	cmp r1, r0
	bgt _08012FF6
	ldr r0, [r2, #0x20]
	ands r0, r3
	cmp r0, #0
	beq _08012FF0
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08012FF4
	.align 2, 0
_08012FEC: .4byte 0x000002FF
_08012FF0:
	movs r0, #0xc0
	lsls r0, r0, #2
_08012FF4:
	strh r0, [r2, #0x14]
_08012FF6:
	ldr r1, _08013008 @ =gUnknown_030059E0
	ldr r0, _0801300C @ =sub_8013010
	str r0, [r1]
_08012FFC:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_08013008: .4byte gUnknown_030059E0
_0801300C: .4byte sub_8013010

	thumb_func_start sub_8013010
sub_8013010: @ 0x08013010
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08013024
	subs r0, #0x60
	cmp r0, #0
	bge _08013030
	b _0801302E
_08013024:
	cmp r0, #0
	bge _08013032
	adds r0, #0x60
	cmp r0, #0
	ble _08013030
_0801302E:
	movs r0, #0
_08013030:
	strh r0, [r2, #0x14]
_08013032:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013066
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801305E
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #5
	b _08013064
_0801305E:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
_08013064:
	strb r0, [r1]
_08013066:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0

	thumb_func_start sub_8013070
sub_8013070: @ 0x08013070
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _080130D8 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x11
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #0
	bl sub_8012DF8
	adds r1, r4, #0
	adds r1, #0x72
	movs r0, #0x20
	strh r0, [r1]
	movs r0, #0xe1
	bl m4aSongNumStart
	ldr r0, _080130DC @ =gUnknown_030059E0
	ldr r1, _080130E0 @ =sub_80130E4
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080130D8: .4byte 0xFFFFBFFF
_080130DC: .4byte gUnknown_030059E0
_080130E0: .4byte sub_80130E4

	thumb_func_start sub_80130E4
sub_80130E4: @ 0x080130E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #1
	cmp r1, #0
	ble _080130FC
	subs r1, r1, r0
	cmp r1, #0
	bge _08013108
	b _08013106
_080130FC:
	cmp r1, #0
	bge _0801310A
	adds r1, r1, r0
	cmp r1, #0
	ble _08013108
_08013106:
	movs r1, #0
_08013108:
	strh r1, [r4, #0x14]
_0801310A:
	adds r0, r4, #0
	bl sub_8029C84
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0801313C
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08013148 @ =gUnknown_030059E0
	ldr r0, _0801314C @ =sub_8013B6C
	str r0, [r1]
_0801313C:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013148: .4byte gUnknown_030059E0
_0801314C: .4byte sub_8013B6C

	thumb_func_start sub_8013150
sub_8013150: @ 0x08013150
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r0, #0xad
	ldrb r2, [r0]
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x1f
	ands r0, r1
	str r0, [r3, #0x20]
	lsls r4, r2, #0x18
	asrs r1, r4, #0x18
	movs r5, #0x7f
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _0801318C
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0x5c
	strh r1, [r0]
	lsrs r0, r4, #0x18
	cmp r0, #0x80
	bne _080131A8
	ldr r0, [r3, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r3, #0x20]
	b _080131A8
_0801318C:
	cmp r1, #0
	bge _08013196
	rsbs r0, r1, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013196:
	ldr r1, _080131B0 @ =gUnknown_080D5538
	ands r2, r5
	lsrs r0, r2, #5
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r3, #0
	adds r0, #0x64
	strh r1, [r0]
_080131A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080131B0: .4byte gUnknown_080D5538

	thumb_func_start sub_80131B4
sub_80131B4: @ 0x080131B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	bl sub_8022838
	adds r7, r5, #0
	adds r7, #0xac
	ldrb r1, [r7]
	movs r0, #2
	mov r8, r0
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08013258
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _080131E6
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _080131EE
_080131E6:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_080131EE:
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801323A
	adds r0, r5, #0
	adds r0, #0xad
	ldrb r0, [r0]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0801321C
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _08013224
_0801321C:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08013224:
	str r0, [r5, #0x20]
	movs r0, #0
	strh r0, [r5, #0x12]
	adds r0, r5, #0
	bl sub_8022318
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
	b _0801348A
_0801323A:
	ldr r1, _08013250 @ =gUnknown_030059E0
	ldr r0, _08013254 @ =sub_8013C18
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5f
	strh r0, [r1]
	movs r0, #0x6f
	bl m4aSongNumStart
	b _0801348A
	.align 2, 0
_08013250: .4byte gUnknown_030059E0
_08013254: .4byte sub_8013C18
_08013258:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08013262
	b _08013424
_08013262:
	adds r0, r5, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013272
	b _080133FC
_08013272:
	adds r1, r5, #0
	adds r1, #0xad
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	mov sb, r1
	cmp r0, #0
	bgt _0801332C
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sub_8029A28
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _0801329E
	b _080133FC
_0801329E:
	cmp r6, #0
	bne _080132A4
	b _080133BA
_080132A4:
	ldr r0, _080132E8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080132F0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	movs r4, #0
	str r4, [sp]
	ldr r4, _080132EC @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801E4E4
	cmp r0, #0
	bge _0801331E
	b _08013348
	.align 2, 0
_080132E8: .4byte gUnknown_03005424
_080132EC: .4byte sub_801EE64
_080132F0:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	subs r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _08013328 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	blt _080133FC
_0801331E:
	lsls r1, r6, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	b _080133B8
	.align 2, 0
_08013328: .4byte sub_801EE64
_0801332C:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0
	add r2, sp, #8
	bl sub_8029A74
	adds r6, r0, #0
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08013370
_08013348:
	ldr r1, _08013368 @ =gUnknown_030059E0
	ldr r0, _0801336C @ =sub_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	ldrb r0, [r7]
	mov r2, r8
	orrs r0, r2
	strb r0, [r7]
	b _0801348A
	.align 2, 0
_08013368: .4byte gUnknown_030059E0
_0801336C: .4byte sub_8013BD4
_08013370:
	cmp r6, #0
	beq _080133BA
	ldr r0, _080133EC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080133B2
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	adds r0, #1
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r1, #1
	movs r2, #0x16
	ldrsb r2, [r5, r2]
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	str r3, [sp]
	ldr r3, _080133F0 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	blt _080133FC
_080133B2:
	lsls r1, r6, #8
	ldr r0, [r5, #8]
	adds r0, r0, r1
_080133B8:
	str r0, [r5, #8]
_080133BA:
	movs r0, #0
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	ldr r1, _080133F4 @ =gUnknown_030059E0
	ldr r0, _080133F8 @ =sub_8013C34
	str r0, [r1]
	movs r0, #3
	mov r2, sb
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x15
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xa
	strb r0, [r5, #0x17]
	b _0801348A
	.align 2, 0
_080133EC: .4byte gUnknown_03005424
_080133F0: .4byte sub_801EE64
_080133F4: .4byte gUnknown_030059E0
_080133F8: .4byte sub_8013C34
_080133FC:
	ldr r1, _0801341C @ =gUnknown_030059E0
	ldr r0, _08013420 @ =sub_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	ldrb r0, [r7]
	mov r1, r8
	orrs r0, r1
	strb r0, [r7]
	b _0801348A
	.align 2, 0
_0801341C: .4byte gUnknown_030059E0
_08013420: .4byte sub_8013BD4
_08013424:
	adds r0, r5, #0
	adds r0, #0x5c
	ldr r1, _0801345C @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0801343E
	ldr r0, [r5, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013484
_0801343E:
	ldr r1, _08013460 @ =gUnknown_030059E0
	ldr r0, _08013464 @ =sub_8013BD4
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x5d
	strh r0, [r1]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bgt _08013468
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	b _08013470
	.align 2, 0
_0801345C: .4byte gUnknown_03005B38
_08013460: .4byte gUnknown_030059E0
_08013464: .4byte sub_8013BD4
_08013468:
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
_08013470:
	str r0, [r5, #0x20]
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x12
	strh r0, [r5, #0x10]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	b _0801348A
_08013484:
	adds r0, r5, #0
	bl sub_8013150
_0801348A:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8013498
sub_8013498: @ 0x08013498
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8023610
	adds r0, r4, #0
	bl sub_8029DC8
	adds r0, r4, #0
	bl sub_8022838
	adds r0, r4, #0
	adds r0, #0xac
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080134FE
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	bl sub_8022318
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080134EC
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
	b _080134FE
_080134EC:
	movs r0, #0xf
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x5e
	strh r0, [r1]
	ldr r1, _08013504 @ =gUnknown_030059E0
	ldr r0, _08013508 @ =sub_8013BF0
	str r0, [r1]
_080134FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013504: .4byte gUnknown_030059E0
_08013508: .4byte sub_8013BF0

	thumb_func_start sub_801350C
sub_801350C: @ 0x0801350C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08013578 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0801353E
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	ldr r0, _0801357C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013530
	rsbs r2, r2, #0
_08013530:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r1, r1, r2
	bl sub_801F5CC
_0801353E:
	adds r0, r4, #0
	bl sub_8022838
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl sub_8029B88
	adds r2, r0, #0
	cmp r2, #0xb
	bgt _08013580
	ldr r0, _0801357C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013562
	rsbs r2, r2, #0
_08013562:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	b _080135AC
	.align 2, 0
_08013578: .4byte gUnknown_03005590
_0801357C: .4byte gUnknown_03005424
_08013580:
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080135AC
	ldr r1, _080135B4 @ =gUnknown_030059E0
	ldr r0, _080135B8 @ =sub_8013BD4
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r2, r4, #0
	adds r2, #0xac
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
_080135AC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080135B4: .4byte gUnknown_030059E0
_080135B8: .4byte sub_8013BD4

	thumb_func_start sub_80135BC
sub_80135BC: @ 0x080135BC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	ldr r1, _080135E8 @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _08013600
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _080135EC
	adds r0, r1, #0
	adds r0, #0x18
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08013600
	b _080135F8
	.align 2, 0
_080135E8: .4byte gUnknown_03005B38
_080135EC:
	adds r0, r1, #0
	subs r0, #0x18
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08013600
_080135F8:
	adds r0, r4, #0
	bl sub_801350C
	b _08013638
_08013600:
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	adds r2, r0, #0
	subs r2, #0xe
	ldr r0, _08013640 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801361E
	rsbs r2, r2, #0
_0801361E:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8022318
	movs r0, #0xf
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013638:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013640: .4byte gUnknown_03005424

	thumb_func_start sub_8013644
sub_8013644: @ 0x08013644
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	beq _08013694
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	add r4, sp, #8
	str r4, [sp]
	ldr r4, _08013690 @ =sub_801ED24
	str r4, [sp, #4]
	bl sub_801E4E4
	adds r2, r0, #0
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080136C6
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x40
	b _080136DA
	.align 2, 0
_08013690: .4byte sub_801ED24
_08013694:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	add r3, sp, #8
	str r3, [sp]
	ldr r3, _080136D0 @ =sub_801ED24
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	adds r2, r0, #0
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080136D4
_080136C6:
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	b _080136DC
	.align 2, 0
_080136D0: .4byte sub_801ED24
_080136D4:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0xc0
_080136DA:
	strb r0, [r1]
_080136DC:
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80136E8
sub_80136E8: @ 0x080136E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xae
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08013704
	b _08013934
_08013704:
	ldr r6, [r4, #0x20]
	movs r0, #8
	ands r6, r0
	cmp r6, #0
	beq _08013710
	b _080138CA
_08013710:
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r1, #0x64
	beq _08013728
	movs r0, #0x65
	strh r0, [r7]
_08013728:
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r0, #0x40
	mov sl, r0
	ands r0, r2
	str r1, [sp, #4]
	cmp r0, #0
	beq _080137FC
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r1, _08013774 @ =gUnknown_03005424
	mov r8, r1
	ldrh r1, [r1]
	movs r2, #0x80
	mov sb, r2
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _08013754
	rsbs r5, r5, #0
_08013754:
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r3, r0, r5
	str r3, [r4, #0xc]
	cmp r2, #2
	ble _08013778
	adds r0, r4, #0
	bl sub_8013C50
	b _0801393A
	.align 2, 0
_08013774: .4byte gUnknown_03005424
_08013778:
	cmp r2, #0
	ble _080137A4
	adds r1, r4, #0
	adds r1, #0x24
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _0801379C @ =gUnknown_030059E0
	ldr r0, _080137A0 @ =sub_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_0801379C: .4byte gUnknown_030059E0
_080137A0: .4byte sub_8013BD4
_080137A4:
	cmp r2, #0
	bge _080137AA
	b _0801392C
_080137AA:
	movs r5, #0x90
	lsls r5, r5, #4
	mov r0, r8
	ldrh r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	beq _080137BC
	rsbs r5, r5, #0
_080137BC:
	subs r0, r3, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bge _080137E4
	movs r0, #0x66
	strh r0, [r7]
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	b _080138D2
_080137E4:
	movs r0, #0x66
	strh r0, [r7]
	movs r1, #0xc0
	ldr r0, [r4, #0x20]
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080137F6
	movs r1, #0x80
_080137F6:
	rsbs r0, r1, #0
	strh r0, [r4, #0x12]
	b _080138D2
_080137FC:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080138BE
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	lsls r5, r0, #8
	ldr r0, _0801384C @ =gUnknown_03005424
	mov r8, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801381C
	rsbs r5, r5, #0
_0801381C:
	ldr r0, [r4, #0xc]
	adds r0, r0, r5
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	subs r0, r0, r5
	str r0, [r4, #0xc]
	cmp r2, #0
	bgt _080138CA
	mov r2, r8
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08013850
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029AC0
	b _0801385A
	.align 2, 0
_0801384C: .4byte gUnknown_03005424
_08013850:
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
_0801385A:
	adds r2, r0, #0
	cmp r2, #0
	bge _080138A8
	ldr r0, _08013874 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013878
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	b _0801387E
	.align 2, 0
_08013874: .4byte gUnknown_03005424
_08013878:
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
_0801387E:
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r2, [r1]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
	ldr r1, _080138A0 @ =gUnknown_030059E0
	ldr r0, _080138A4 @ =sub_8013BD4
	str r0, [r1]
	b _0801390E
	.align 2, 0
_080138A0: .4byte gUnknown_030059E0
_080138A4: .4byte sub_8013BD4
_080138A8:
	movs r0, #0x67
	strh r0, [r7]
	movs r2, #0xc0
	ldr r0, [r4, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080138BA
	movs r2, #0x80
_080138BA:
	strh r2, [r4, #0x12]
	b _080138D2
_080138BE:
	adds r0, r4, #0
	bl sub_8013644
	adds r2, r0, #0
	cmp r2, #0
	ble _080138D2
_080138CA:
	adds r0, r4, #0
	bl sub_8013CA0
	b _0801393A
_080138D2:
	movs r2, #1
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r5, #0xc0
	ands r5, r0
	cmp r5, #0
	bne _08013914
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0
	bl sub_8029B0C
	adds r2, r0, #0
	cmp r2, #0
	bge _08013914
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	adds r0, r4, #0
	bl sub_8022318
_0801390E:
	movs r0, #0x5d
	strh r0, [r7]
	b _0801393A
_08013914:
	cmp r2, #0
	beq _0801392C
	adds r1, r4, #0
	adds r1, #0xad
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801392C
	movs r0, #3
	strb r0, [r1]
_0801392C:
	adds r0, r4, #0
	bl sub_801394C
	b _0801393A
_08013934:
	adds r0, r4, #0
	bl sub_8013CA0
_0801393A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_801394C
sub_801394C: @ 0x0801394C
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _080139A8 @ =gUnknown_03005B38
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080139A2
	ldr r0, _080139AC @ =0x0000FD60
	strh r0, [r3, #0x12]
	movs r2, #0xc0
	lsls r2, r2, #2
	strh r2, [r3, #0x10]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ands r0, r1
	cmp r0, #0
	beq _0801397C
	rsbs r0, r2, #0
	strh r0, [r3, #0x10]
_0801397C:
	ldr r0, [r3, #0x20]
	movs r2, #4
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	adds r1, #0xfe
	orrs r0, r1
	str r0, [r3, #0x20]
	movs r0, #6
	strb r0, [r3, #0x16]
	movs r0, #9
	strb r0, [r3, #0x17]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6d
	strb r2, [r0]
_080139A2:
	pop {r0}
	bx r0
	.align 2, 0
_080139A8: .4byte gUnknown_03005B38
_080139AC: .4byte 0x0000FD60

	thumb_func_start sub_80139B0
sub_80139B0: @ 0x080139B0
	push {r4, lr}
	mov ip, r0
	movs r1, #0x14
	ldrsh r3, [r0, r1]
	cmp r3, #0
	bge _080139BE
	rsbs r3, r3, #0
_080139BE:
	mov r0, ip
	adds r0, #0xad
	ldrb r2, [r0]
	ldr r1, _080139D0 @ =0x000002FF
	adds r4, r0, #0
	cmp r3, r1
	bgt _080139D4
	adds r3, #6
	b _080139E4
	.align 2, 0
_080139D0: .4byte 0x000002FF
_080139D4:
	ldr r0, _08013A14 @ =0x00000EFF
	cmp r3, r0
	bgt _080139E4
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0
	bne _080139E4
	adds r3, #3
_080139E4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013A00
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r3, r0
	ble _08013A00
	subs r3, #9
	cmp r3, r0
	bge _08013A00
	adds r3, r0, #0
_08013A00:
	ldrb r0, [r4]
	adds r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08013A18
	rsbs r0, r3, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	b _08013A1C
	.align 2, 0
_08013A14: .4byte 0x00000EFF
_08013A18:
	mov r0, ip
	strh r3, [r0, #0x14]
_08013A1C:
	mov r0, ip
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08013A48
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x80
	beq _08013A7E
	asrs r0, r1, #0x18
	cmp r0, #0
	bge _08013A3E
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013A3E:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	b _08013A7C
_08013A48:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08013A6C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08013A7E
	cmp r0, #0
	ble _08013A62
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08013A62:
	lsls r0, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r0, r0, r2
	b _08013A7C
_08013A6C:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08013A7E
	adds r0, r1, #2
	lsls r0, r0, #0x18
_08013A7C:
	lsrs r2, r0, #0x18
_08013A7E:
	strb r2, [r4]
	ldr r1, _08013AAC @ =gUnknown_08097AA4
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x15
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	mov r3, ip
	strh r0, [r3, #0x10]
	ldrh r1, [r3, #0x12]
	movs r2, #0x12
	ldrsh r0, [r3, r2]
	cmp r0, #0x7f
	bgt _08013AB0
	adds r0, r1, #0
	adds r0, #0x18
	b _08013AB6
	.align 2, 0
_08013AAC: .4byte gUnknown_08097AA4
_08013AB0:
	adds r0, r1, #0
	subs r0, #0x18
	mov r3, ip
_08013AB6:
	strh r0, [r3, #0x12]
	ldr r1, _08013AC4 @ =gUnknown_03005960
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	ble _08013AC8
	subs r0, #2
	b _08013ACE
	.align 2, 0
_08013AC4: .4byte gUnknown_03005960
_08013AC8:
	cmp r0, #0
	bge _08013AD0
	adds r0, #4
_08013ACE:
	str r0, [r1, #0x4c]
_08013AD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013AD8
sub_8013AD8: @ 0x08013AD8
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	movs r0, #6
	strb r0, [r3, #0x16]
	strb r0, [r3, #0x17]
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r3, #0x12]
	adds r0, r0, r1
	strh r0, [r3, #0x12]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08013B02
	movs r0, #0
	strh r0, [r3, #0x12]
_08013B02:
	movs r2, #0xc0
	lsls r2, r2, #2
	strh r2, [r3, #0x14]
	ldr r1, [r3, #0x20]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08013B16
	asrs r0, r2, #1
	strh r0, [r3, #0x14]
_08013B16:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08013B2E
	ldrh r0, [r3, #0x14]
	rsbs r0, r0, #0
	strh r0, [r3, #0x14]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0xad
	movs r0, #0x80
	b _08013B38
_08013B2E:
	ldrh r0, [r3, #0x14]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0xad
	movs r0, #0
_08013B38:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0xac
	strb r0, [r2]
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r2]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08013B64 @ =gUnknown_030059E0
	ldr r1, _08013B68 @ =sub_8013BB4
	str r1, [r0]
	adds r0, r3, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08013B64: .4byte gUnknown_030059E0
_08013B68: .4byte sub_8013BB4

	thumb_func_start sub_8013B6C
sub_8013B6C: @ 0x08013B6C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8029C84
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013BA8
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08013BA0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0x32
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	b _08013BA6
_08013BA0:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08013BA6:
	strb r0, [r1]
_08013BA8:
	adds r0, r4, #0
	bl sub_8027EF0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013BB4
sub_8013BB4: @ 0x08013BB4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80139B0
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_80131B4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013BD4
sub_8013BD4: @ 0x08013BD4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	adds r0, r4, #0
	bl sub_8013498
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013BF0
sub_8013BF0: @ 0x08013BF0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013C0C
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013C0C:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C18
sub_8013C18: @ 0x08013C18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80135BC
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C34
sub_8013C34: @ 0x08013C34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80136E8
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013C50
sub_8013C50: @ 0x08013C50
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x68
	strh r0, [r1]
	ldr r0, _08013C74 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013C78
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	b _08013C82
	.align 2, 0
_08013C74: .4byte gUnknown_03005424
_08013C78:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
_08013C82:
	str r0, [r2, #0xc]
	ldr r1, _08013C98 @ =gUnknown_030059E0
	ldr r0, _08013C9C @ =sub_8013E64
	str r0, [r1]
	adds r1, r2, #0
	adds r1, #0xad
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013C98: .4byte gUnknown_030059E0
_08013C9C: .4byte sub_8013E64

	thumb_func_start sub_8013CA0
sub_8013CA0: @ 0x08013CA0
	ldr r2, _08013CB8 @ =gUnknown_030059E0
	ldr r1, _08013CBC @ =sub_8013BD4
	str r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0x64
	movs r1, #0x5d
	strh r1, [r0]
	bx lr
	.align 2, 0
_08013CB8: .4byte gUnknown_030059E0
_08013CBC: .4byte sub_8013BD4

	thumb_func_start sub_8013CC0
sub_8013CC0: @ 0x08013CC0
	push {lr}
	adds r2, r0, #0
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _08013CCE
	rsbs r1, r1, #0
_08013CCE:
	ldr r0, _08013CE4 @ =0x000002FF
	cmp r1, r0
	bgt _08013CEE
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013CE8
	movs r0, #0xfd
	lsls r0, r0, #8
	b _08013CEC
	.align 2, 0
_08013CE4: .4byte 0x000002FF
_08013CE8:
	movs r0, #0xc0
	lsls r0, r0, #2
_08013CEC:
	strh r0, [r2, #0x14]
_08013CEE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8013CF4
sub_8013CF4: @ 0x08013CF4
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013D06
	subs r1, #0x60
	cmp r1, #0
	bge _08013D12
	b _08013D10
_08013D06:
	cmp r1, #0
	bge _08013D14
	adds r1, #0x60
	cmp r1, #0
	ble _08013D12
_08013D10:
	movs r1, #0
_08013D12:
	strh r1, [r0, #0x14]
_08013D14:
	pop {r0}
	bx r0

	thumb_func_start sub_8013D18
sub_8013D18: @ 0x08013D18
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r3, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	ldr r1, _08013D6C @ =0x20000100
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013D70 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6a
	strh r0, [r1]
	strh r3, [r4, #0x10]
	strh r3, [r4, #0x12]
	movs r0, #0xe2
	bl m4aSongNumStart
	ldr r0, _08013D74 @ =gUnknown_030059E0
	ldr r1, _08013D78 @ =sub_8013DA8
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D6C: .4byte 0x20000100
_08013D70: .4byte 0xFFFFBFFF
_08013D74: .4byte gUnknown_030059E0
_08013D78: .4byte sub_8013DA8

	thumb_func_start sub_8013D7C
sub_8013D7C: @ 0x08013D7C
	ldr r2, _08013DA0 @ =gUnknown_030059E0
	ldr r1, _08013DA4 @ =sub_8013BD4
	str r1, [r2]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x5d
	strh r1, [r2]
	movs r1, #6
	strb r1, [r0, #0x16]
	movs r1, #0xe
	strb r1, [r0, #0x17]
	adds r0, #0xac
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08013DA0: .4byte gUnknown_030059E0
_08013DA4: .4byte sub_8013BD4

	thumb_func_start sub_8013DA8
sub_8013DA8: @ 0x08013DA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80283C4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013DEC
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x6b
	strh r0, [r1]
	strh r2, [r4, #0x10]
	adds r0, #0x95
	strh r0, [r4, #0x12]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	movs r2, #1
	bl sub_8012DF8
	ldr r0, _08013DF4 @ =gUnknown_030059E0
	ldr r1, _08013DF8 @ =sub_8013DFC
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
_08013DEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DF4: .4byte gUnknown_030059E0
_08013DF8: .4byte sub_8013DFC

	thumb_func_start sub_8013DFC
sub_8013DFC: @ 0x08013DFC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	bl sub_80283C4
	ldr r2, [r4, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _08013E26
	ldr r1, _08013E2C @ =gUnknown_030059E0
	ldr r0, _08013E30 @ =sub_8013E34
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x6c
	strh r0, [r1]
	strh r2, [r4, #0x12]
_08013E26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013E2C: .4byte gUnknown_030059E0
_08013E30: .4byte sub_8013E34

	thumb_func_start sub_8013E34
sub_8013E34: @ 0x08013E34
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8027EF0
	movs r0, #0
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013E5E
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
	strb r0, [r1]
_08013E5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013E64
sub_8013E64: @ 0x08013E64
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013ECE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08013E98 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08013E9C
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	b _08013EA6
	.align 2, 0
_08013E98: .4byte gUnknown_03005424
_08013E9C:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	lsls r1, r1, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
_08013EA6:
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08013EBC
	ldr r0, [r4, #8]
	ldr r1, _08013EB8 @ =0xFFFFF000
	b _08013EC2
	.align 2, 0
_08013EB8: .4byte 0xFFFFF000
_08013EBC:
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #5
_08013EC2:
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r0, r4, #0
	bl sub_8025318
	b _08013EDA
_08013ECE:
	adds r0, r4, #0
	bl sub_80232D0
	adds r0, r4, #0
	bl sub_8029D64
_08013EDA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8013EE0
sub_8013EE0: @ 0x08013EE0
	push {lr}
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	cmp r1, #0
	ble _08013EF2
	subs r1, #0x60
	cmp r1, #0
	bge _08013EFE
	b _08013EFC
_08013EF2:
	cmp r1, #0
	bge _08013F00
	adds r1, #0x60
	cmp r1, #0
	ble _08013EFE
_08013EFC:
	movs r1, #0
_08013EFE:
	strh r1, [r0, #0x14]
_08013F00:
	pop {r0}
	bx r0

	thumb_func_start sub_8013F04
sub_8013F04: @ 0x08013F04
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80218E4
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _08013F54 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xf
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x16
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0
	bl sub_8015BD4
	ldr r0, _08013F58 @ =gUnknown_030059E0
	ldr r1, _08013F5C @ =sub_8013F60
	str r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013F54: .4byte 0xFFFFBFFF
_08013F58: .4byte gUnknown_030059E0
_08013F5C: .4byte sub_8013F60

	thumb_func_start sub_8013F60
sub_8013F60: @ 0x08013F60
	push {lr}
	adds r2, r0, #0
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08013F74
	subs r0, #0x60
	cmp r0, #0
	bge _08013F80
	b _08013F7E
_08013F74:
	cmp r0, #0
	bge _08013F82
	adds r0, #0x60
	cmp r0, #0
	ble _08013F80
_08013F7E:
	movs r0, #0
_08013F80:
	strh r0, [r2, #0x14]
_08013F82:
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08013F9A
	ldr r1, _08013FA4 @ =gUnknown_030059E0
	ldr r0, _08013FA8 @ =sub_8025318
	str r0, [r1]
_08013F9A:
	adds r0, r2, #0
	bl sub_8027EF0
	pop {r0}
	bx r0
	.align 2, 0
_08013FA4: .4byte gUnknown_030059E0
_08013FA8: .4byte sub_8025318

	thumb_func_start sub_8013FAC
sub_8013FAC: @ 0x08013FAC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r0, _08013FD0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08014060
	ldr r0, _08013FD4 @ =gUnknown_030055B4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _08013FDC
	ldr r1, _08013FD8 @ =gUnknown_030056A4
	movs r0, #0
	str r0, [r1]
	b _08014112
	.align 2, 0
_08013FD0: .4byte gUnknown_030054CC
_08013FD4: .4byte gUnknown_030055B4
_08013FD8: .4byte gUnknown_030056A4
_08013FDC:
	adds r0, r1, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08013FEC
	b _08014112
_08013FEC:
	ldr r0, _08014018 @ =sub_801420C
	ldr r2, _0801401C @ =0x00005010
	ldr r1, _08014020 @ =sub_8015360
	str r1, [sp]
	movs r1, #0x70
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0x1c
	adds r7, r1, r0
	ldr r0, _08014024 @ =gUnknown_030056A4
	str r6, [r0]
	ldr r1, _08014028 @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	str r0, [r6]
	ldr r0, [r1, #0xc]
	b _080140B0
	.align 2, 0
_08014018: .4byte sub_801420C
_0801401C: .4byte 0x00005010
_08014020: .4byte sub_8015360
_08014024: .4byte gUnknown_030056A4
_08014028: .4byte gUnknown_030059E0
_0801402C:
	lsls r0, r1, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r5, r0, r4
	ldr r0, _08014054 @ =sub_801420C
	ldr r2, _08014058 @ =0x00005010
	ldr r1, _0801405C @ =sub_8015360
	str r1, [sp]
	movs r1, #0x70
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	adds r6, r0, r4
	str r5, [r6, #0x6c]
	b _080140A0
	.align 2, 0
_08014054: .4byte sub_801420C
_08014058: .4byte 0x00005010
_0801405C: .4byte sub_8015360
_08014060:
	movs r5, #0
	movs r6, #0
	movs r2, #0
	ldr r0, _0801411C @ =gUnknown_030055A0
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _08014086
	adds r1, r4, #0
_08014072:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08014086
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08014072
_08014086:
	movs r1, #0
	cmp r1, r2
	bhs _080140A0
	ldr r3, _08014120 @ =gUnknown_03005500
_0801408E:
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0801402C
	adds r1, #1
	cmp r1, r2
	blo _0801408E
_080140A0:
	cmp r5, #0
	beq _08014112
	adds r7, r6, #0
	adds r7, #0x1c
	ldr r0, _08014124 @ =gUnknown_030056A4
	str r6, [r0]
	movs r0, #0
	str r0, [r6]
_080140B0:
	str r0, [r6, #4]
	movs r4, #0
	movs r0, #2
	strb r0, [r6, #8]
	strb r0, [r6, #9]
	movs r5, #0
	strh r0, [r6, #0xc]
	strh r4, [r6, #0xe]
	strh r4, [r6, #0x10]
	movs r0, #9
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r1, _08014128 @ =gUnknown_080D5548
	ldrh r0, [r6, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrh r0, [r6, #0x10]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	strh r4, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	strh r4, [r7, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r0, [r7, #0x30]
_08014112:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801411C: .4byte gUnknown_030055A0
_08014120: .4byte gUnknown_03005500
_08014124: .4byte gUnknown_030056A4
_08014128: .4byte gUnknown_080D5548

	thumb_func_start sub_801412C
sub_801412C: @ 0x0801412C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x1c
	adds r6, r4, #0
	adds r6, #0x54
	ldrh r0, [r4, #0x10]
	cmp r0, #0x12
	beq _0801417C
	ldr r2, _080141FC @ =gUnknown_080D5548
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrh r3, [r1]
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r3, r0
	ldr r1, [r4, #0x14]
	cmp r1, r0
	beq _0801417C
	strh r3, [r5, #0xa]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldrh r0, [r5, #0xa]
	ldrb r1, [r1]
	adds r0, r0, r1
	str r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_0801417C:
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r2, _08014200 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	movs r2, #0x80
	lsls r2, r2, #3
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080141A2
	movs r2, #0
_080141A2:
	ldrb r0, [r6, #0x10]
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bls _080141B4
	movs r0, #0x80
	lsls r0, r0, #4
	eors r2, r0
_080141B4:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080141C2
	movs r0, #0x80
	lsls r0, r0, #4
	eors r2, r0
_080141C2:
	ldr r0, [r5, #0x10]
	ldr r1, _08014204 @ =0xFFFFF3FF
	ands r0, r1
	orrs r0, r2
	ldr r1, _08014208 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r1, [r6, #0x14]
	ldr r1, [r1, #0x10]
	movs r2, #0xc0
	lsls r2, r2, #6
	ands r1, r2
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004558
	ldrh r1, [r4, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080141F4
	adds r0, r5, #0
	bl sub_80051E8
_080141F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080141FC: .4byte gUnknown_080D5548
_08014200: .4byte gUnknown_03005960
_08014204: .4byte 0xFFFFF3FF
_08014208: .4byte 0xFFFFCFFF

	thumb_func_start sub_801420C
sub_801420C: @ 0x0801420C
	push {r4, r5, r6, lr}
	ldr r6, _08014258 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x18
	movs r3, #0
	bl sub_8014EFC
	ldr r1, [r4, #0x14]
	ldrh r0, [r1, #0xa]
	cmp r0, #0x79
	bne _08014260
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r4, [r0]
	cmp r4, #0
	bne _08014260
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8014EFC
	strb r4, [r5, #0xa]
	ldr r1, [r6]
	ldr r0, _0801425C @ =sub_80142AC
	b _08014264
	.align 2, 0
_08014258: .4byte gCurTask
_0801425C: .4byte sub_80142AC
_08014260:
	ldr r1, [r6]
	ldr r0, _0801429C @ =sub_8014350
_08014264:
	str r0, [r1, #8]
	adds r0, r5, #0
	bl sub_801412C
	ldr r0, _080142A0 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0801428C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014288
	ldr r0, _080142A4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801428C
_08014288:
	cmp r1, #0x1d
	bne _08014294
_0801428C:
	ldr r0, _080142A8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801429C @ =sub_8014350
	str r0, [r1, #8]
_08014294:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801429C: .4byte sub_8014350
_080142A0: .4byte gUnknown_030055B4
_080142A4: .4byte gUnknown_030054B0
_080142A8: .4byte gCurTask

	thumb_func_start sub_80142AC
sub_80142AC: @ 0x080142AC
	push {r4, r5, r6, lr}
	ldr r6, _080142F8 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8014EFC
	ldrh r1, [r4, #0xc]
	ldr r0, _080142FC @ =0x0000FFFE
	ands r0, r1
	strh r0, [r4, #0xc]
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0x14]
	cmp r0, #0xb6
	bls _080142E4
	movs r0, #1
	strb r0, [r4, #0xa]
_080142E4:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _08014300
	ldr r0, [r5, #0x14]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801431C
	b _08014308
	.align 2, 0
_080142F8: .4byte gCurTask
_080142FC: .4byte 0x0000FFFE
_08014300:
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0xa]
	cmp r0, #0x79
	beq _0801431C
_08014308:
	movs r1, #0x20
	rsbs r1, r1, #0
	adds r0, r4, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_8014EFC
	ldr r1, [r6]
	ldr r0, _08014334 @ =sub_8014350
	str r0, [r1, #8]
_0801431C:
	movs r0, #0xf
	strh r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _08014338
	ldrh r0, [r4, #0xc]
	movs r1, #2
	orrs r0, r1
	b _0801433E
	.align 2, 0
_08014334: .4byte sub_8014350
_08014338:
	ldrh r1, [r4, #0xc]
	ldr r0, _0801434C @ =0x0000FFFD
	ands r0, r1
_0801433E:
	strh r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801434C: .4byte 0x0000FFFD

	thumb_func_start sub_8014350
sub_8014350: @ 0x08014350
	push {r4, r5, lr}
	ldr r0, _08014380 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08014384
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl sub_8014EFC
	b _080144BE
	.align 2, 0
_08014380: .4byte gCurTask
_08014384:
	adds r0, r4, #0
	bl sub_8014CC8
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080143AA
	ldr r2, _080143C0 @ =gUnknown_080D5590
	ldr r1, _080143C4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_080143AA:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _080143C8
	ldrh r1, [r4, #0xc]
	movs r0, #2
	orrs r0, r1
	b _080143CE
	.align 2, 0
_080143C0: .4byte gUnknown_080D5590
_080143C4: .4byte gUnknown_080D5628
_080143C8:
	ldrh r1, [r4, #0xc]
	ldr r0, _080143E4 @ =0x0000FFFD
	ands r0, r1
_080143CE:
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x10]
	subs r0, #2
	cmp r0, #0xd
	bhi _080144B8
	lsls r0, r0, #2
	ldr r1, _080143E8 @ =_080143EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080143E4: .4byte 0x0000FFFD
_080143E8: .4byte _080143EC
_080143EC: @ jump table
	.4byte _08014484 @ case 0
	.4byte _080144B8 @ case 1
	.4byte _08014468 @ case 2
	.4byte _080144B8 @ case 3
	.4byte _080144B8 @ case 4
	.4byte _080144B8 @ case 5
	.4byte _080144B8 @ case 6
	.4byte _080144A8 @ case 7
	.4byte _080144B8 @ case 8
	.4byte _08014424 @ case 9
	.4byte _08014434 @ case 10
	.4byte _08014448 @ case 11
	.4byte _080144B8 @ case 12
	.4byte _08014494 @ case 13
_08014424:
	ldr r0, _0801442C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014430 @ =sub_8015378
	b _080144B6
	.align 2, 0
_0801442C: .4byte gCurTask
_08014430: .4byte sub_8015378
_08014434:
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _08014440 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014444 @ =sub_8015464
	b _080144B6
	.align 2, 0
_08014440: .4byte gCurTask
_08014444: .4byte sub_8015464
_08014448:
	movs r2, #0
	strb r2, [r4, #0xa]
	ldr r0, _08014460 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014464 @ =sub_80154B0
	str r0, [r1, #8]
	strh r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	b _080144BE
	.align 2, 0
_08014460: .4byte gCurTask
_08014464: .4byte sub_80154B0
_08014468:
	movs r0, #0
	strb r0, [r4, #0xa]
	movs r0, #0xe4
	bl m4aSongNumStart
	ldr r0, _0801447C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014480 @ =sub_8014A68
	b _080144B6
	.align 2, 0
_0801447C: .4byte gCurTask
_08014480: .4byte sub_8014A68
_08014484:
	ldr r0, _0801448C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014490 @ =sub_80145D8
	b _080144B6
	.align 2, 0
_0801448C: .4byte gCurTask
_08014490: .4byte sub_80145D8
_08014494:
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r0, _080144A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080144A4 @ =sub_80142AC
	b _080144B6
	.align 2, 0
_080144A0: .4byte gCurTask
_080144A4: .4byte sub_80142AC
_080144A8:
	movs r1, #0
	movs r0, #9
	strh r0, [r4, #0x10]
	strb r1, [r4, #0xa]
	ldr r0, _080144C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080144C8 @ =sub_80144CC
_080144B6:
	str r0, [r1, #8]
_080144B8:
	adds r0, r4, #0
	bl sub_801412C
_080144BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080144C4: .4byte gCurTask
_080144C8: .4byte sub_80144CC

	thumb_func_start sub_80144CC
sub_80144CC: @ 0x080144CC
	push {r4, r5, r6, lr}
	ldr r0, _080144FC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08014500
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	movs r3, #0
	bl sub_8014EFC
	b _080145C2
	.align 2, 0
_080144FC: .4byte gCurTask
_08014500:
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0x14]
	cmp r0, #0xaf
	bls _0801458C
	movs r6, #0
	movs r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0x14]
	cmp r0, #0xff
	bls _0801453C
	adds r0, r4, #0
	movs r1, #0x1c
	movs r2, #4
	movs r3, #4
	bl sub_8014EFC
	ldr r0, [r5, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014530
	ldrh r0, [r4, #0xc]
	b _08014568
_08014530:
	ldrh r1, [r4, #0xc]
	ldr r0, _08014538 @ =0x0000FFFE
	ands r0, r1
	b _0801456A
	.align 2, 0
_08014538: .4byte 0x0000FFFE
_0801453C:
	cmp r0, #0xbf
	bls _0801456C
	movs r1, #0x1c
	rsbs r1, r1, #0
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl sub_8014EFC
	ldr r0, [r5, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014564
	ldrh r1, [r4, #0xc]
	ldr r0, _08014560 @ =0x0000FFFE
	ands r0, r1
	b _0801456A
	.align 2, 0
_08014560: .4byte 0x0000FFFE
_08014564:
	ldrh r0, [r4, #0xc]
	movs r1, #1
_08014568:
	orrs r0, r1
_0801456A:
	strh r0, [r4, #0xc]
_0801456C:
	ldrb r0, [r4, #0xa]
	adds r0, #2
	strb r0, [r4, #0xa]
	ldr r1, _08014588 @ =gUnknown_08097AA4
	ldrb r0, [r4, #0xa]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x19
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	b _08014590
	.align 2, 0
_08014588: .4byte gUnknown_08097AA4
_0801458C:
	movs r0, #9
	strh r0, [r4, #0x10]
_08014590:
	movs r1, #0xa
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080145B0
	ldr r2, _080145C8 @ =gUnknown_080D5590
	ldr r1, _080145CC @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
_080145B0:
	cmp r1, #9
	beq _080145BC
	ldr r0, _080145D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080145D4 @ =sub_8014350
	str r0, [r1, #8]
_080145BC:
	adds r0, r4, #0
	bl sub_801412C
_080145C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080145C8: .4byte gUnknown_080D5590
_080145CC: .4byte gUnknown_080D5628
_080145D0: .4byte gCurTask
_080145D4: .4byte sub_8014350

	thumb_func_start sub_80145D8
sub_80145D8: @ 0x080145D8
	push {r4, r5, r6, lr}
	ldr r5, _08014620 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	movs r6, #0
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r2, _08014624 @ =gUnknown_03005498
	ldr r1, [r2]
	ldr r0, _08014628 @ =0x00009C3F
	cmp r1, r0
	bgt _08014630
	ldr r0, [r2, #4]
	str r0, [r4, #0x18]
	ldr r1, [r2, #4]
	movs r0, #1
	strb r0, [r1, #0x15]
	strb r6, [r4, #0xa]
	movs r0, #0xe5
	bl m4aSongNumStart
	ldr r1, [r5]
	ldr r0, _0801462C @ =sub_801464C
	str r0, [r1, #8]
	ldrh r0, [r4, #0xc]
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r4, #0xc]
	b _08014638
	.align 2, 0
_08014620: .4byte gCurTask
_08014624: .4byte gUnknown_03005498
_08014628: .4byte 0x00009C3F
_0801462C: .4byte sub_801464C
_08014630:
	strb r6, [r4, #0xa]
	ldr r1, [r5]
	ldr r0, _08014648 @ =sub_80149EC
	str r0, [r1, #8]
_08014638:
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014648: .4byte sub_80149EC

	thumb_func_start sub_801464C
sub_801464C: @ 0x0801464C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08014704 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4, #0x18]
	mov r8, r0
	ldr r2, _08014708 @ =IWRAM_START + 0x54
	adds r7, r1, r2
	movs r3, #3
	mov sb, r3
	movs r0, #0xc
	mov ip, r0
	movs r5, #0
	movs r6, #0
	ldr r0, _0801470C @ =gUnknown_030055B4
	ldrb r1, [r0]
	mov r0, sb
	ands r0, r1
	cmp r0, #2
	beq _08014694
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014690
	ldr r0, _08014710 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014694
_08014690:
	cmp r1, #0x1d
	bne _080146A2
_08014694:
	adds r0, r4, #0
	bl sub_80155D0
	movs r1, #2
	mov sb, r1
	movs r2, #0x20
	mov ip, r2
_080146A2:
	ldrh r2, [r4, #0xc]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080146C2
	ldr r0, [r7, #0x14]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x69
	beq _080146C2
	cmp r1, #0x6d
	beq _080146C2
	cmp r1, #0x71
	beq _080146C2
	ldr r0, _08014714 @ =0x0000FFEF
	ands r0, r2
	strh r0, [r4, #0xc]
_080146C2:
	movs r0, #5
	strh r0, [r4, #0x10]
	ldrb r1, [r4, #0xa]
	cmp r1, #0
	beq _080146D4
	movs r0, #6
	strh r0, [r4, #0x10]
	adds r0, r1, #1
	strb r0, [r4, #0xa]
_080146D4:
	ldrb r0, [r4, #0xa]
	cmp r0, #8
	bls _080146EA
	movs r0, #0
	strb r0, [r4, #0xa]
	movs r0, #0
	strh r0, [r4, #0xe]
	ldr r0, _08014704 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014718 @ =sub_80148B8
	str r0, [r1, #8]
_080146EA:
	mov r0, r8
	ldrh r3, [r0, #0x16]
	ldr r0, [r4]
	asrs r2, r0, #8
	subs r1, r3, r2
	adds r7, r0, #0
	cmp r1, #0
	blt _0801471C
	cmp r1, ip
	blt _08014724
	ldr r1, [r4, #4]
	b _0801474E
	.align 2, 0
_08014704: .4byte gCurTask
_08014708: .4byte IWRAM_START + 0x54
_0801470C: .4byte gUnknown_030055B4
_08014710: .4byte gUnknown_030054B0
_08014714: .4byte 0x0000FFEF
_08014718: .4byte sub_80148B8
_0801471C:
	subs r0, r2, r3
	ldr r1, [r4, #4]
	cmp r0, ip
	bge _0801474E
_08014724:
	mov r1, r8
	ldrh r3, [r1, #0x18]
	ldr r1, [r4, #4]
	asrs r0, r1, #8
	adds r0, #4
	subs r2, r3, r0
	cmp r2, #0
	blt _0801473A
	cmp r2, ip
	blt _08014740
	b _0801474E
_0801473A:
	subs r0, r0, r3
	cmp r0, ip
	bge _0801474E
_08014740:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0801474A
	movs r0, #1
	strb r0, [r4, #0xa]
_0801474A:
	movs r0, #6
	strh r0, [r4, #0x10]
_0801474E:
	mov r2, r8
	ldrh r0, [r2, #0x16]
	lsls r0, r0, #8
	subs r3, r0, r7
	subs r2, r7, r0
	cmp r3, #0
	blt _0801475E
	adds r2, r3, #0
_0801475E:
	cmp r0, r7
	ble _08014776
	adds r5, r2, #0
	mov r3, sb
	lsrs r5, r3
	cmp r5, #0
	bne _0801478C
	cmp r2, #0
	beq _0801478C
	movs r5, #0x80
	lsls r5, r5, #2
	b _0801478C
_08014776:
	cmp r0, r7
	bge _0801478C
	adds r0, r2, #0
	mov r3, sb
	lsrs r0, r3
	rsbs r5, r0, #0
	cmp r5, #0
	bne _0801478C
	cmp r2, #0
	beq _0801478C
	ldr r5, _080147B8 @ =0xFFFFFE00
_0801478C:
	mov r2, r8
	ldrh r0, [r2, #0x18]
	subs r0, #4
	lsls r0, r0, #8
	subs r3, r0, r1
	subs r2, r1, r0
	cmp r3, #0
	blt _0801479E
	adds r2, r3, #0
_0801479E:
	cmp r0, r1
	ble _080147BC
	adds r6, r2, #0
	mov r3, sb
	lsrs r6, r3
	cmp r6, #0
	bne _080147D2
	cmp r2, #0
	beq _080147D2
	movs r6, #0x80
	lsls r6, r6, #2
	b _080147D2
	.align 2, 0
_080147B8: .4byte 0xFFFFFE00
_080147BC:
	cmp r0, r1
	bge _080147D2
	adds r0, r2, #0
	mov r3, sb
	lsrs r0, r3
	rsbs r6, r0, #0
	cmp r6, #0
	bne _080147D2
	cmp r2, #0
	beq _080147D2
	ldr r6, _08014820 @ =0xFFFFFE00
_080147D2:
	ldr r0, _08014824 @ =0xFFFFF001
	cmp r5, r0
	blt _080147DE
	ldr r0, _08014828 @ =0x00000FFF
	cmp r5, r0
	ble _080147E0
_080147DE:
	adds r5, r0, #0
_080147E0:
	ldr r0, _08014824 @ =0xFFFFF001
	cmp r6, r0
	blt _080147EC
	ldr r0, _08014828 @ =0x00000FFF
	cmp r6, r0
	ble _080147EE
_080147EC:
	adds r6, r0, #0
_080147EE:
	adds r0, r7, r5
	str r0, [r4]
	adds r0, r1, r6
	str r0, [r4, #4]
	mov r1, r8
	ldrb r0, [r1, #0x15]
	cmp r0, #0
	bne _0801480A
	strb r0, [r4, #0xa]
	strh r0, [r4, #0xe]
	ldr r0, _0801482C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08014830 @ =sub_80148B8
	str r0, [r1, #8]
_0801480A:
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014820: .4byte 0xFFFFFE00
_08014824: .4byte 0xFFFFF001
_08014828: .4byte 0x00000FFF
_0801482C: .4byte gCurTask
_08014830: .4byte sub_80148B8

	thumb_func_start sub_8014834
sub_8014834: @ 0x08014834
	push {r4, r5, r6, lr}
	ldr r2, _080148AC @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4, #0x18]
	adds r0, #0x54
	adds r1, r1, r0
	ldrh r3, [r4, #0xc]
	movs r0, #0x10
	ands r0, r3
	adds r6, r2, #0
	cmp r0, #0
	beq _0801486A
	ldr r0, [r1, #0x14]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x69
	beq _0801486A
	cmp r1, #0x6d
	beq _0801486A
	cmp r1, #0x71
	beq _0801486A
	ldr r0, _080148B0 @ =0x0000FFEF
	ands r0, r3
	strh r0, [r4, #0xc]
_0801486A:
	movs r2, #0
	movs r0, #6
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #0xa]
	adds r1, r0, #1
	strb r1, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0801488A
	ldr r0, [r6]
	ldr r1, _080148B4 @ =sub_80148B8
	str r1, [r0, #8]
	strb r2, [r4, #0xa]
	movs r0, #0
	strh r0, [r4, #0xe]
_0801488A:
	ldrb r3, [r5, #0x15]
	cmp r3, #0
	bne _0801489A
	ldr r1, [r6]
	ldr r0, _080148B4 @ =sub_80148B8
	str r0, [r1, #8]
	strb r2, [r4, #0xa]
	strh r3, [r4, #0xe]
_0801489A:
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080148AC: .4byte gCurTask
_080148B0: .4byte 0x0000FFEF
_080148B4: .4byte sub_80148B8

	thumb_func_start sub_80148B8
sub_80148B8: @ 0x080148B8
	push {r4, r5, r6, r7, lr}
	ldr r0, _080149D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	movs r7, #0
	movs r6, #3
	ldr r0, _080149D4 @ =gUnknown_030055B4
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #2
	beq _080148EE
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080148EA
	ldr r0, _080149D8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080148EE
_080148EA:
	cmp r1, #0x1d
	bne _080148F0
_080148EE:
	movs r6, #1
_080148F0:
	ldrh r1, [r4, #0xc]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08014910
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #0xa]
	cmp r0, #0x69
	beq _08014910
	cmp r0, #0x6d
	beq _08014910
	cmp r0, #0x71
	beq _08014910
	ldr r0, _080149DC @ =0x0000FFEF
	ands r0, r1
	strh r0, [r4, #0xc]
_08014910:
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_8014EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08014964
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _0801494A
	ldr r2, _080149E0 @ =gUnknown_080D5590
	ldr r1, _080149E4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_0801494A:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0x3c
	ble _08014964
	ldrh r0, [r4, #0x10]
	cmp r0, #2
	beq _08014964
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r0, _080149D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080149E8 @ =sub_8014350
	str r0, [r1, #8]
_08014964:
	movs r0, #0
	strh r0, [r4, #0x10]
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014986
	ldr r2, _080149E0 @ =gUnknown_080D5590
	ldr r1, _080149E4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r7, [r0]
_08014986:
	ldrh r1, [r4, #0xc]
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080149A6
	cmp r7, #2
	bne _0801499A
	movs r0, #8
	strb r0, [r4, #0xa]
_0801499A:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _080149A6
	strh r2, [r4, #0x10]
	subs r0, #1
	strb r0, [r4, #0xa]
_080149A6:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	ble _080149BA
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r0, _080149D0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080149E8 @ =sub_8014350
	str r0, [r1, #8]
_080149BA:
	ldrh r0, [r4, #0xe]
	adds r0, #1
	strh r0, [r4, #0xe]
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080149D0: .4byte gCurTask
_080149D4: .4byte gUnknown_030055B4
_080149D8: .4byte gUnknown_030054B0
_080149DC: .4byte 0x0000FFEF
_080149E0: .4byte gUnknown_080D5590
_080149E4: .4byte gUnknown_080D5628
_080149E8: .4byte sub_8014350

	thumb_func_start sub_80149EC
sub_80149EC: @ 0x080149EC
	push {r4, r5, lr}
	ldr r5, _08014A58 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r2, r1, r0
	movs r0, #7
	strh r0, [r4, #0x10]
	ldrb r0, [r4, #0xa]
	adds r1, r0, #1
	strb r1, [r4, #0xa]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _08014A3C
	ldr r3, [r2, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014A30
	ldr r2, _08014A5C @ =gUnknown_080D5590
	ldr r1, _08014A60 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_08014A30:
	ldrh r0, [r4, #0x10]
	cmp r0, #7
	beq _08014A3C
	ldr r1, [r5]
	ldr r0, _08014A64 @ =sub_8014350
	str r0, [r1, #8]
_08014A3C:
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	bl sub_8014CC8
	bl sub_80152EC
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014A58: .4byte gCurTask
_08014A5C: .4byte gUnknown_080D5590
_08014A60: .4byte gUnknown_080D5628
_08014A64: .4byte sub_8014350

	thumb_func_start sub_8014A68
sub_8014A68: @ 0x08014A68
	push {r4, r5, r6, lr}
	ldr r6, _08014AE8 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	ldr r2, _08014AEC @ =gUnknown_08097AA4
	ldrb r3, [r5, #0xa]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	adds r3, #0x10
	strb r3, [r5, #0xa]
	asrs r1, r1, #0x19
	asrs r2, r2, #0x19
	adds r0, r5, #0
	movs r3, #0
	bl sub_8014EFC
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014ACA
	ldr r2, _08014AF0 @ =gUnknown_080D5590
	ldr r1, _08014AF4 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_08014ACA:
	ldrh r0, [r5, #0x10]
	cmp r0, #4
	beq _08014ADC
	movs r0, #0xe4
	bl m4aSongNumStop
	ldr r1, [r6]
	ldr r0, _08014AF8 @ =sub_8014350
	str r0, [r1, #8]
_08014ADC:
	adds r0, r5, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014AE8: .4byte gCurTask
_08014AEC: .4byte gUnknown_08097AA4
_08014AF0: .4byte gUnknown_080D5590
_08014AF4: .4byte gUnknown_080D5628
_08014AF8: .4byte sub_8014350

	thumb_func_start sub_8014AFC
sub_8014AFC: @ 0x08014AFC
	push {r4, r5, r6, lr}
	ldr r6, _08014B9C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	ldr r2, _08014BA0 @ =gUnknown_08097AA4
	ldrb r3, [r5, #0xa]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r2, r2, #0x10
	adds r3, #2
	strb r3, [r5, #0xa]
	asrs r1, r1, #0x19
	asrs r2, r2, #0x1b
	adds r2, #0x30
	adds r0, r5, #0
	movs r3, #0
	bl sub_8014EFC
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08014B60
	ldr r2, _08014BA4 @ =gUnknown_080D5590
	ldr r1, _08014BA8 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_08014B60:
	ldrh r0, [r5, #0x10]
	cmp r0, #0xc
	beq _08014B6C
	ldr r1, [r6]
	ldr r0, _08014BAC @ =sub_8014350
	str r0, [r1, #8]
_08014B6C:
	ldrh r4, [r5, #0x30]
	adds r0, r5, #0
	bl sub_801412C
	ldrh r0, [r5, #0x30]
	cmp r0, #0x3f
	bne _08014B84
	cmp r4, #0x3f
	beq _08014B84
	adds r0, r5, #0
	bl sub_8014BB0
_08014B84:
	ldrh r0, [r5, #0x30]
	cmp r0, #0x12
	bne _08014B94
	cmp r4, #0x12
	beq _08014B94
	adds r0, r5, #0
	bl sub_8014BB0
_08014B94:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014B9C: .4byte gCurTask
_08014BA0: .4byte gUnknown_08097AA4
_08014BA4: .4byte gUnknown_080D5590
_08014BA8: .4byte gUnknown_080D5628
_08014BAC: .4byte sub_8014350

	thumb_func_start sub_8014BB0
sub_8014BB0: @ 0x08014BB0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08014BE4 @ =sub_8014C60
	ldr r2, _08014BE8 @ =0x00005040
	ldr r1, _08014BEC @ =sub_8015604
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	adds r1, #0x3c
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldrh r0, [r4, #0x30]
	cmp r0, #0x12
	bne _08014BF0
	movs r0, #0x40
	rsbs r0, r0, #0
	b _08014BF2
	.align 2, 0
_08014BE4: .4byte sub_8014C60
_08014BE8: .4byte 0x00005040
_08014BEC: .4byte sub_8015604
_08014BF0:
	movs r0, #0x40
_08014BF2:
	str r0, [r5, #0x30]
	ldr r0, [r4]
	str r0, [r5, #0x34]
	ldr r0, [r4, #4]
	str r0, [r5, #0x38]
	movs r0, #4
	bl sub_8007C10
	str r0, [r5, #4]
	movs r4, #0
	movs r3, #0
	ldr r0, _08014C58 @ =0x000001D5
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	strh r3, [r5, #8]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #0x34]
	asrs r0, r0, #8
	ldr r2, _08014C5C @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r5, #0x38]
	asrs r0, r0, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r5, #0x1a]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	strh r3, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014C58: .4byte 0x000001D5
_08014C5C: .4byte gUnknown_03005960

	thumb_func_start sub_8014C60
sub_8014C60: @ 0x08014C60
	push {r4, lr}
	ldr r3, _08014C88 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x3c
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bls _08014C8C
	ldr r0, [r3]
	bl TaskDestroy
	b _08014CBC
	.align 2, 0
_08014C88: .4byte gCurTask
_08014C8C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r4, #0x38]
	asrs r0, r0, #8
	ldr r3, _08014CC4 @ =gUnknown_03005960
	ldr r2, [r3]
	subs r0, r0, r2
	strh r0, [r4, #0x16]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08014CBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014CC4: .4byte gUnknown_03005960

	thumb_func_start sub_8014CC8
sub_8014CC8: @ 0x08014CC8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x54
	movs r0, #0
	mov r8, r0
	mov sb, r0
	ldr r0, _08014D2C @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08014CFC
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014CF8
	ldr r0, _08014D30 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014CFC
_08014CF8:
	cmp r1, #0x1d
	bne _08014D02
_08014CFC:
	adds r0, r4, #0
	bl sub_80155D0
_08014D02:
	ldrb r1, [r7, #0x10]
	adds r0, r1, #0
	adds r0, #0xa0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r2, [r4, #0xc]
	movs r0, #8
	ands r0, r2
	adds r5, r2, #0
	cmp r0, #0
	beq _08014D68
	cmp r1, #0
	bne _08014D34
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r0, r0, r1
	b _08014D40
	.align 2, 0
_08014D2C: .4byte gUnknown_030055B4
_08014D30: .4byte gUnknown_030054B0
_08014D34:
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x18
	adds r0, r0, r2
_08014D40:
	lsrs r3, r0, #0x18
	ldr r0, [r7, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014D52
	movs r0, #1
	orrs r0, r5
	b _08014D9A
_08014D52:
	ldr r0, _08014D64 @ =0x0000FFFE
	ands r0, r5
	strh r0, [r4, #0xc]
	adds r0, r3, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _08014D9C
	.align 2, 0
_08014D64: .4byte 0x0000FFFE
_08014D68:
	ldr r0, [r7, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014D88
	adds r0, r3, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrb r0, [r7, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	bgt _08014D96
	movs r0, #1
	orrs r0, r2
	b _08014D9A
_08014D88:
	ldrb r0, [r7, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	ble _08014D96
	movs r0, #1
	orrs r0, r2
	b _08014D9A
_08014D96:
	ldr r0, _08014DE4 @ =0x0000FFFE
	ands r0, r2
_08014D9A:
	strh r0, [r4, #0xc]
_08014D9C:
	ldr r1, _08014DE8 @ =gUnknown_08097AA4
	lsls r0, r3, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r2, [r7]
	adds r5, r0, r2
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #5
	ldr r1, [r7, #4]
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r4, #8]
	ldr r6, [r4]
	cmp r0, #2
	beq _08014DFC
	subs r0, r2, r6
	subs r1, r6, r2
	cmp r0, #0
	blt _08014DD8
	adds r1, r0, #0
_08014DD8:
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bls _08014DEC
	movs r0, #2
	b _08014DFA
	.align 2, 0
_08014DE4: .4byte 0x0000FFFE
_08014DE8: .4byte gUnknown_08097AA4
_08014DEC:
	movs r0, #0xc0
	lsls r0, r0, #6
	cmp r1, r0
	bls _08014DF8
	movs r0, #3
	b _08014DFA
_08014DF8:
	movs r0, #4
_08014DFA:
	strb r0, [r4, #8]
_08014DFC:
	subs r0, r5, r6
	subs r1, r6, r5
	cmp r0, #0
	blt _08014E06
	adds r1, r0, #0
_08014E06:
	ldr r0, _08014E2C @ =0x000003FF
	cmp r1, r0
	bhi _08014E10
	movs r0, #4
	strb r0, [r4, #8]
_08014E10:
	cmp r5, r6
	ble _08014E34
	ldrb r0, [r4, #8]
	lsrs r1, r0
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08014E4E
	ldrh r1, [r4, #0xc]
	ldr r0, _08014E30 @ =0x0000FFFE
	ands r0, r1
	b _08014E4C
	.align 2, 0
_08014E2C: .4byte 0x000003FF
_08014E30: .4byte 0x0000FFFE
_08014E34:
	cmp r5, r6
	bge _08014E4E
	ldrb r2, [r4, #8]
	lsrs r1, r2
	rsbs r1, r1, #0
	mov r8, r1
	ldr r0, _08014E70 @ =0xFFFFFF00
	cmp r8, r0
	bge _08014E4E
	ldrh r1, [r4, #0xc]
	movs r0, #1
	orrs r0, r1
_08014E4C:
	strh r0, [r4, #0xc]
_08014E4E:
	ldrb r0, [r4, #9]
	ldr r3, [r4, #4]
	cmp r0, #2
	beq _08014E84
	ldr r0, [r7, #4]
	subs r2, r0, r3
	subs r1, r3, r0
	cmp r2, #0
	blt _08014E62
	adds r1, r2, #0
_08014E62:
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bls _08014E74
	movs r0, #2
	b _08014E82
	.align 2, 0
_08014E70: .4byte 0xFFFFFF00
_08014E74:
	movs r0, #0xc0
	lsls r0, r0, #6
	cmp r1, r0
	bls _08014E80
	movs r0, #3
	b _08014E82
_08014E80:
	movs r0, #4
_08014E82:
	strb r0, [r4, #9]
_08014E84:
	mov r1, ip
	subs r0, r1, r3
	subs r1, r3, r1
	cmp r0, #0
	blt _08014E90
	adds r1, r0, #0
_08014E90:
	ldr r0, _08014EA0 @ =0x000003FF
	cmp r1, r0
	bhi _08014EA4
	movs r0, #4
	strb r0, [r4, #9]
	movs r2, #1
	b _08014EA6
	.align 2, 0
_08014EA0: .4byte 0x000003FF
_08014EA4:
	movs r2, #0
_08014EA6:
	cmp ip, r3
	ble _08014EB0
	ldrb r0, [r4, #9]
	lsrs r1, r0
	b _08014EBA
_08014EB0:
	cmp ip, r3
	bge _08014EBC
	ldrb r0, [r4, #9]
	lsrs r1, r0
	rsbs r1, r1, #0
_08014EBA:
	mov sb, r1
_08014EBC:
	ldr r0, _08014EF4 @ =0xFFFFF001
	cmp r8, r0
	blt _08014EC8
	ldr r0, _08014EF8 @ =0x00000FFF
	cmp r8, r0
	ble _08014ECA
_08014EC8:
	mov r8, r0
_08014ECA:
	ldr r0, _08014EF4 @ =0xFFFFF001
	cmp sb, r0
	blt _08014ED6
	ldr r0, _08014EF8 @ =0x00000FFF
	cmp sb, r0
	ble _08014ED8
_08014ED6:
	mov sb, r0
_08014ED8:
	mov r1, r8
	adds r0, r6, r1
	str r0, [r4]
	mov r1, sb
	adds r0, r3, r1
	str r0, [r4, #4]
	adds r0, r2, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014EF4: .4byte 0xFFFFF001
_08014EF8: .4byte 0x00000FFF

	thumb_func_start sub_8014EFC
sub_8014EFC: @ 0x08014EFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	adds r6, r4, #0
	adds r6, #0x54
	movs r7, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, _08014F78 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _08014F4A
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08014F46
	ldr r0, _08014F7C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08014F4A
_08014F46:
	cmp r1, #0x1d
	bne _08014F50
_08014F4A:
	adds r0, r4, #0
	bl sub_80155D0
_08014F50:
	ldrb r1, [r6, #0x10]
	adds r0, r1, #0
	adds r0, #0xa0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrh r2, [r4, #0xc]
	movs r0, #8
	ands r0, r2
	adds r3, r2, #0
	cmp r0, #0
	beq _08014FB4
	cmp r1, #0
	bne _08014F80
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x18
	adds r0, r0, r2
	b _08014F8C
	.align 2, 0
_08014F78: .4byte gUnknown_030055B4
_08014F7C: .4byte gUnknown_030054B0
_08014F80:
	movs r0, #0x9f
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r0, r0, r1
_08014F8C:
	lsrs r5, r0, #0x18
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014F9E
	movs r0, #1
	orrs r0, r3
	b _08014FE6
_08014F9E:
	ldr r0, _08014FB0 @ =0x0000FFFE
	ands r0, r3
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08014FE8
	.align 2, 0
_08014FB0: .4byte 0x0000FFFE
_08014FB4:
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08014FD4
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r6, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	bgt _08014FE2
	movs r0, #1
	orrs r0, r2
	b _08014FE6
_08014FD4:
	ldrb r0, [r6, #0x10]
	adds r0, #0x40
	cmp r0, #0x80
	ble _08014FE2
	movs r0, #1
	orrs r0, r2
	b _08014FE6
_08014FE2:
	ldr r0, _0801502C @ =0x0000FFFE
	ands r0, r2
_08014FE6:
	strh r0, [r4, #0xc]
_08014FE8:
	ldr r2, _08015030 @ =gUnknown_08097AA4
	lsls r0, r5, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	ldr r0, [r6]
	adds r3, r1, r0
	lsls r0, r5, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	ldr r0, [r6, #4]
	adds r2, r1, r0
	mov r0, r8
	cmp r0, #0
	bne _08015034
	str r3, [r4]
	str r2, [r4, #4]
	movs r0, #1
	b _080150FE
	.align 2, 0
_0801502C: .4byte 0x0000FFFE
_08015030: .4byte gUnknown_08097AA4
_08015034:
	ldr r0, [r4]
	subs r1, r3, r0
	adds r6, r0, #0
	cmp r1, #0
	blt _0801504C
	ldr r0, _08015048 @ =0x000005FF
	cmp r1, r0
	ble _08015056
	ldr r5, [r4, #4]
	b _08015078
	.align 2, 0
_08015048: .4byte 0x000005FF
_0801504C:
	subs r1, r6, r3
	ldr r0, _08015068 @ =0x000005FF
	ldr r5, [r4, #4]
	cmp r1, r0
	bgt _08015078
_08015056:
	ldr r0, [r4, #4]
	subs r1, r2, r0
	adds r5, r0, #0
	cmp r1, #0
	blt _0801506C
	ldr r0, _08015068 @ =0x000005FF
	cmp r1, r0
	ble _08015074
	b _08015078
	.align 2, 0
_08015068: .4byte 0x000005FF
_0801506C:
	subs r1, r5, r2
	ldr r0, _08015098 @ =0x000005FF
	cmp r1, r0
	bgt _08015078
_08015074:
	movs r1, #1
	str r1, [sp, #4]
_08015078:
	subs r1, r3, r6
	subs r0, r6, r3
	cmp r1, #0
	blt _08015082
	adds r0, r1, #0
_08015082:
	cmp r3, r6
	ble _080150A0
	adds r7, r0, #0
	mov r3, r8
	lsrs r7, r3
	cmp r7, #0
	beq _080150B6
	ldrh r1, [r4, #0xc]
	ldr r0, _0801509C @ =0x0000FFFE
	ands r0, r1
	b _080150B4
	.align 2, 0
_08015098: .4byte 0x000005FF
_0801509C: .4byte 0x0000FFFE
_080150A0:
	cmp r3, r6
	bge _080150B6
	mov r1, r8
	lsrs r0, r1
	rsbs r7, r0, #0
	cmp r7, #0
	beq _080150B6
	ldrh r1, [r4, #0xc]
	movs r0, #1
	orrs r0, r1
_080150B4:
	strh r0, [r4, #0xc]
_080150B6:
	subs r1, r2, r5
	subs r0, r5, r2
	cmp r1, #0
	blt _080150C0
	adds r0, r1, #0
_080150C0:
	cmp r2, r5
	ble _080150CA
	mov r2, r8
	lsrs r0, r2
	b _080150D4
_080150CA:
	cmp r2, r5
	bge _080150D6
	mov r3, r8
	lsrs r0, r3
	rsbs r0, r0, #0
_080150D4:
	mov sb, r0
_080150D6:
	ldr r0, _08015110 @ =0xFFFFF001
	cmp r7, r0
	blt _080150E2
	ldr r0, _08015114 @ =0x00000FFF
	cmp r7, r0
	ble _080150E4
_080150E2:
	adds r7, r0, #0
_080150E4:
	ldr r0, _08015110 @ =0xFFFFF001
	cmp sb, r0
	blt _080150F0
	ldr r0, _08015114 @ =0x00000FFF
	cmp sb, r0
	ble _080150F2
_080150F0:
	mov sb, r0
_080150F2:
	adds r0, r6, r7
	str r0, [r4]
	mov r1, sb
	adds r0, r5, r1
	str r0, [r4, #4]
	ldr r0, [sp, #4]
_080150FE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015110: .4byte 0xFFFFF001
_08015114: .4byte 0x00000FFF

	thumb_func_start sub_8015118
sub_8015118: @ 0x08015118
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, _08015154 @ =gUnknown_030054CC
	ldrb r0, [r0]
	subs r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08015130
	b _0801527C
_08015130:
	movs r7, #0
	movs r0, #0
	mov ip, r0
	ldr r0, [r5, #0x6c]
	adds r1, r0, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r1, [r5, #0x54]
	asrs r1, r1, #8
	subs r3, r2, r1
	adds r6, r0, #0
	cmp r3, #0
	blt _08015158
	cmp r3, #0x1e
	bgt _0801515E
	b _08015160
	.align 2, 0
_08015154: .4byte gUnknown_030054CC
_08015158:
	subs r0, r1, r2
	cmp r0, #0x1e
	ble _08015160
_0801515E:
	movs r7, #1
_08015160:
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	subs r1, r2, r0
	cmp r1, #0
	blt _08015178
	cmp r1, #0x1e
	bgt _0801517E
	b _08015180
_08015178:
	subs r0, r0, r2
	cmp r0, #0x1e
	ble _08015180
_0801517E:
	movs r7, #1
_08015180:
	adds r2, r6, #0
	adds r2, #0x50
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x52
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #8
	str r0, [r4, #4]
	ldr r6, _080151C8 @ =gUnknown_03005960
	ldr r1, [r6]
	ldrh r0, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080151C4
	ldr r1, [r6, #4]
	ldrh r0, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #0xe
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0xe0
	bls _080151CC
_080151C4:
	movs r0, #1
	b _080152E2
	.align 2, 0
_080151C8: .4byte gUnknown_03005960
_080151CC:
	movs r1, #0
	movs r2, #1
	strh r2, [r4, #8]
	strh r2, [r4, #0xa]
	ldr r0, [r5, #0x6c]
	str r0, [r4, #0x14]
	str r1, [r4, #0xc]
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080151E8
	str r2, [r4, #0xc]
_080151E8:
	ldr r2, [r5, #0x6c]
	adds r0, r2, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08015204
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4, #0xc]
_08015204:
	ldr r0, _08015254 @ =gUnknown_030054F0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08015222
	ldr r0, _08015258 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08015222
	movs r0, #1
	mov ip, r0
_08015222:
	mov r1, ip
	cmp r1, #0
	bne _08015264
	ldrh r0, [r6, #0x38]
	lsrs r2, r0, #2
	strb r2, [r4, #0x10]
	ldr r0, [r5, #0x6c]
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801525C
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _0801524A
	adds r0, r2, #0
	adds r0, #0x80
	mvns r0, r0
	strb r0, [r4, #0x10]
_0801524A:
	ldrh r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	b _08015262
	.align 2, 0
_08015254: .4byte gUnknown_030054F0
_08015258: .4byte gUnknown_030059E0
_0801525C:
	ldrh r1, [r5, #0xc]
	ldr r0, _08015278 @ =0x0000FFF7
	ands r0, r1
_08015262:
	strh r0, [r5, #0xc]
_08015264:
	cmp r7, #0
	beq _080152E0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl sub_8014EFC
	b _080152E0
	.align 2, 0
_08015278: .4byte 0x0000FFF7
_0801527C:
	ldr r2, _080152D0 @ =gUnknown_030059E0
	ldr r0, [r2, #8]
	str r0, [r5, #0x54]
	ldr r0, [r2, #0xc]
	str r0, [r4, #4]
	ldrh r0, [r2, #0x10]
	movs r3, #0
	strh r0, [r4, #8]
	ldrh r0, [r2, #0x12]
	strh r0, [r4, #0xa]
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [r4, #0x14]
	ldr r1, [r2, #0x20]
	str r1, [r4, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080152E0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080152BA
	strb r3, [r4, #0x10]
_080152BA:
	ldr r0, _080152D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080152D8
	ldrh r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	b _080152DE
	.align 2, 0
_080152D0: .4byte gUnknown_030059E0
_080152D4: .4byte gUnknown_03005424
_080152D8:
	ldrh r1, [r5, #0xc]
	ldr r0, _080152E8 @ =0x0000FFF7
	ands r0, r1
_080152DE:
	strh r0, [r5, #0xc]
_080152E0:
	movs r0, #0
_080152E2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080152E8: .4byte 0x0000FFF7

	thumb_func_start sub_80152EC
sub_80152EC: @ 0x080152EC
	push {r4, r5, lr}
	ldr r5, _08015348 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	adds r1, #0x54
	adds r0, r0, r1
	ldr r3, [r0, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _08015342
	ldr r2, _0801534C @ =gUnknown_080D5590
	ldr r1, _08015350 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #4
	bne _08015342
	movs r0, #0
	strb r0, [r4, #0xa]
	movs r1, #0
	strh r0, [r4, #0xe]
	ldr r0, _08015354 @ =gUnknown_03005498
	ldr r0, [r0, #4]
	strb r1, [r0, #0x15]
	ldrh r1, [r4, #0xc]
	ldr r0, _08015358 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r4, #0xc]
	movs r0, #0xe4
	bl m4aSongNumStart
	ldr r1, [r5]
	ldr r0, _0801535C @ =sub_8014A68
	str r0, [r1, #8]
_08015342:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015348: .4byte gCurTask
_0801534C: .4byte gUnknown_080D5590
_08015350: .4byte gUnknown_080D5628
_08015354: .4byte gUnknown_03005498
_08015358: .4byte 0x0000FFEF
_0801535C: .4byte sub_8014A68

	thumb_func_start sub_8015360
sub_8015360: @ 0x08015360
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08015374 @ =IWRAM_START + 0x1C
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0
	.align 2, 0
_08015374: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8015378
sub_8015378: @ 0x08015378
	push {r4, r5, r6, lr}
	ldr r6, _080153E4 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x54
	adds r5, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0xf
	movs r3, #1
	bl sub_8014EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080153AA
	ldr r1, [r6]
	ldr r0, _080153E8 @ =sub_80153F8
	str r0, [r1, #8]
_080153AA:
	ldr r3, [r5, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080153CA
	ldr r2, _080153EC @ =gUnknown_080D5590
	ldr r1, _080153F0 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r4, #0x10]
_080153CA:
	ldrh r0, [r4, #0x10]
	cmp r0, #0xb
	beq _080153D6
	ldr r1, [r6]
	ldr r0, _080153F4 @ =sub_8014350
	str r0, [r1, #8]
_080153D6:
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080153E4: .4byte gCurTask
_080153E8: .4byte sub_80153F8
_080153EC: .4byte gUnknown_080D5590
_080153F0: .4byte gUnknown_080D5628
_080153F4: .4byte sub_8014350

	thumb_func_start sub_80153F8
sub_80153F8: @ 0x080153F8
	push {r4, r5, r6, lr}
	ldr r6, _08015454 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0xf
	movs r3, #0
	bl sub_8014EFC
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _0801543C
	ldr r2, _08015458 @ =gUnknown_080D5590
	ldr r1, _0801545C @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_0801543C:
	ldrh r0, [r5, #0x10]
	cmp r0, #0xb
	beq _08015448
	ldr r1, [r6]
	ldr r0, _08015460 @ =sub_8014350
	str r0, [r1, #8]
_08015448:
	adds r0, r5, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015454: .4byte gCurTask
_08015458: .4byte gUnknown_080D5590
_0801545C: .4byte gUnknown_080D5628
_08015460: .4byte sub_8014350

	thumb_func_start sub_8015464
sub_8015464: @ 0x08015464
	push {r4, r5, lr}
	ldr r5, _080154A8 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #3
	bl sub_8014EFC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08015496
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r1, [r5]
	ldr r0, _080154AC @ =sub_8014AFC
	str r0, [r1, #8]
_08015496:
	movs r0, #0
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080154A8: .4byte gCurTask
_080154AC: .4byte sub_8014AFC

	thumb_func_start sub_80154B0
sub_80154B0: @ 0x080154B0
	push {r4, r5, lr}
	ldr r5, _080154F8 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8015118
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x30
	movs r3, #4
	bl sub_8014EFC
	ldrb r0, [r4, #0xa]
	cmp r0, #0x3c
	bne _080154E0
	movs r0, #0
	strb r0, [r4, #0xa]
	ldr r1, [r5]
	ldr r0, _080154FC @ =sub_8015500
	str r0, [r1, #8]
_080154E0:
	ldrb r0, [r4, #0xa]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0xa]
	strh r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080154F8: .4byte gCurTask
_080154FC: .4byte sub_8015500

	thumb_func_start sub_8015500
sub_8015500: @ 0x08015500
	push {r4, r5, r6, lr}
	ldr r5, _08015550 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r6, _08015554 @ =gUnknown_030059E0
	adds r0, r4, #0
	bl sub_8015118
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0
	bl sub_8014EFC
	ldrb r0, [r4, #0xa]
	cmp r0, #8
	bne _08015538
	ldr r1, [r5]
	ldr r0, _08015558 @ =sub_801555C
	str r0, [r1, #8]
	adds r1, r6, #0
	adds r1, #0x6a
	movs r0, #1
	strh r0, [r1]
_08015538:
	ldrb r0, [r4, #0xa]
	adds r0, #1
	strb r0, [r4, #0xa]
	movs r0, #0xd
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015550: .4byte gCurTask
_08015554: .4byte gUnknown_030059E0
_08015558: .4byte sub_801555C

	thumb_func_start sub_801555C
sub_801555C: @ 0x0801555C
	push {r4, r5, r6, lr}
	ldr r6, _080155C0 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x54
	adds r4, r4, r0
	adds r0, r5, #0
	bl sub_8015118
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r5, #0
	movs r1, #0
	movs r3, #0
	bl sub_8014EFC
	movs r0, #0xe
	strh r0, [r5, #0x10]
	ldr r3, [r4, #0x14]
	ldrh r0, [r3, #0xa]
	cmp r0, #0xb5
	bhi _080155A6
	ldr r2, _080155C4 @ =gUnknown_080D5590
	ldr r1, _080155C8 @ =gUnknown_080D5628
	subs r0, #0x5b
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r5, #0x10]
_080155A6:
	ldrh r0, [r5, #0x10]
	cmp r0, #0xe
	beq _080155B2
	ldr r1, [r6]
	ldr r0, _080155CC @ =sub_8014350
	str r0, [r1, #8]
_080155B2:
	adds r0, r5, #0
	bl sub_801412C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080155C0: .4byte gCurTask
_080155C4: .4byte gUnknown_080D5590
_080155C8: .4byte gUnknown_080D5628
_080155CC: .4byte sub_8014350

	thumb_func_start sub_80155D0
sub_80155D0: @ 0x080155D0
	push {r4, lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x54
	ldrh r4, [r2, #0xc]
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	bne _080155FC
	ldr r0, [r3, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	bne _080155FC
	ldr r0, [r2, #0x54]
	str r0, [r2]
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	movs r0, #4
	orrs r0, r4
	strh r0, [r2, #0xc]
_080155FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015604
sub_8015604: @ 0x08015604
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_8015618
sub_8015618: @ 0x08015618
	bx lr
	.align 2, 0

	thumb_func_start sub_801561C
sub_801561C: @ 0x0801561C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _080156BC @ =gUnknown_030059E0
	adds r0, r1, #0
	adds r0, #0x68
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r1, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	mov sl, r0
	ldr r4, [r1, #0x20]
	adds r0, r1, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	mov ip, r1
	ldr r1, [r0, #0x1c]
	str r1, [sp, #4]
	ldrh r6, [r0]
	ldr r0, _080156C0 @ =0x7FFFFFFF
	ands r4, r0
	ldr r0, _080156C4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015666
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r4, r0
_08015666:
	movs r0, #0
	ldr r5, _080156C8 @ =gUnknown_030056B0
	movs r7, #8
	adds r7, r7, r5
	mov sb, r7
	adds r1, r5, #4
	mov r8, r1
_08015674:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #4
	adds r3, r2, r5
	mov r7, sp
	ldrh r7, [r7]
	strh r7, [r3]
	mov r0, sl
	strh r0, [r3, #2]
	mov r7, sb
	adds r0, r2, r7
	str r4, [r0]
	mov r0, ip
	strb r0, [r3, #0xe]
	add r2, r8
	ldr r7, [sp, #4]
	str r7, [r2]
	strh r6, [r3, #0xc]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xf
	ble _08015674
	movs r0, #0
	ldr r1, _080156CC @ =gUnknown_03005830
	strb r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080156BC: .4byte gUnknown_030059E0
_080156C0: .4byte 0x7FFFFFFF
_080156C4: .4byte gUnknown_03005424
_080156C8: .4byte gUnknown_030056B0
_080156CC: .4byte gUnknown_03005830

	thumb_func_start sub_80156D0
sub_80156D0: @ 0x080156D0
	push {r4, r5, lr}
	ldr r0, _0801573C @ =gUnknown_030059E0
	mov ip, r0
	ldr r5, [r0, #0x20]
	ldr r2, _08015740 @ =gUnknown_03005830
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r2]
	ldrb r3, [r2]
	ldr r0, _08015744 @ =0x7FFFFFFF
	ands r5, r0
	ldr r0, _08015748 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080156FC
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r5, r0
_080156FC:
	ldr r2, _0801574C @ =gUnknown_030056B0
	lsls r3, r3, #4
	adds r4, r3, r2
	mov r0, ip
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r4, #2]
	adds r0, r2, #0
	adds r0, #8
	adds r0, r3, r0
	str r5, [r0]
	mov r1, ip
	adds r1, #0x90
	ldr r0, [r1]
	adds r0, #0x2e
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
	adds r2, #4
	adds r3, r3, r2
	ldr r0, [r1]
	ldr r0, [r0, #0x1c]
	str r0, [r3]
	ldr r0, [r1]
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801573C: .4byte gUnknown_030059E0
_08015740: .4byte gUnknown_03005830
_08015744: .4byte 0x7FFFFFFF
_08015748: .4byte gUnknown_03005424
_0801574C: .4byte gUnknown_030056B0

	thumb_func_start sub_8015750
sub_8015750: @ 0x08015750
	push {r4, r5, r6, r7, lr}
	ldr r0, _08015784 @ =gUnknown_030059E0
	ldr r5, [r0, #8]
	ldr r4, [r0, #0xc]
	movs r1, #0
	ldr r7, _08015788 @ =gUnknown_03005834
	ldr r3, _0801578C @ =gUnknown_030057B0
	adds r6, r3, #4
_08015760:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r2, r0, #3
	adds r1, r2, r3
	str r5, [r1]
	adds r2, r2, r6
	str r4, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08015760
	movs r0, #0
	strb r0, [r7]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015784: .4byte gUnknown_030059E0
_08015788: .4byte gUnknown_03005834
_0801578C: .4byte gUnknown_030057B0

	thumb_func_start sub_8015790
sub_8015790: @ 0x08015790
	push {r4, lr}
	ldr r2, _080157BC @ =gUnknown_03005834
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r2]
	ldrb r2, [r2]
	ldr r1, _080157C0 @ =gUnknown_030057B0
	lsls r2, r2, #3
	adds r3, r2, r1
	ldr r4, _080157C4 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	str r0, [r3]
	adds r1, #4
	adds r2, r2, r1
	ldr r0, [r4, #0xc]
	str r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080157BC: .4byte gUnknown_03005834
_080157C0: .4byte gUnknown_030057B0
_080157C4: .4byte gUnknown_030059E0

	thumb_func_start sub_80157C8
sub_80157C8: @ 0x080157C8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080157EC @ =gUnknown_03005834
	ldrb r2, [r2]
	subs r2, r2, r1
	movs r1, #0xf
	ands r2, r1
	ldr r3, _080157F0 @ =gUnknown_030057B0
	lsls r2, r2, #3
	adds r1, r2, r3
	ldr r1, [r1]
	str r1, [r0]
	adds r3, #4
	adds r2, r2, r3
	ldr r1, [r2]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_080157EC: .4byte gUnknown_03005834
_080157F0: .4byte gUnknown_030057B0

	thumb_func_start sub_80157F4
sub_80157F4: @ 0x080157F4
	push {r4, lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _08015834 @ =gUnknown_03005830
	ldrb r2, [r2]
	subs r2, r2, r1
	movs r1, #0xf
	ands r2, r1
	ldr r3, _08015838 @ =gUnknown_030056B0
	lsls r2, r2, #4
	adds r4, r2, r3
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	adds r1, r3, #0
	adds r1, #8
	adds r1, r2, r1
	ldr r1, [r1]
	str r1, [r0, #8]
	ldrb r1, [r4, #0xe]
	strb r1, [r0, #0xe]
	adds r3, #4
	adds r2, r2, r3
	ldr r1, [r2]
	str r1, [r0, #4]
	ldrh r1, [r4, #0xc]
	strh r1, [r0, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015834: .4byte gUnknown_03005830
_08015838: .4byte gUnknown_030056B0

	thumb_func_start sub_801583C
sub_801583C: @ 0x0801583C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0801597C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801584E
	b _0801596E
_0801584E:
	ldr r2, _08015980 @ =gUnknown_030055BC
	ldrb r0, [r2]
	cmp r0, #0
	beq _08015858
	b _0801596E
_08015858:
	ldr r0, _08015984 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _08015866
	b _0801596E
_08015866:
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08015876
	ldr r0, _08015988 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801596E
_08015876:
	cmp r1, #0x1d
	beq _0801596E
	movs r0, #1
	strb r0, [r2]
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08015884:
	ldr r0, _0801598C @ =sub_8015B50
	str r0, [sp]
	ldr r0, _08015990 @ =sub_80159C8
	movs r1, #0x60
	movs r2, #0x80
	lsls r2, r2, #7
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r5, r1
	adds r1, #0x5c
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
	ldr r1, _08015994 @ =IWRAM_START + 0x5D
	adds r0, r5, r1
	strb r7, [r0]
	ldr r0, _08015998 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r0, #0x40
	bl sub_8007C10
	str r0, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r7, [r4, #8]
	strh r7, [r4, #0x14]
	strh r7, [r4, #0x1c]
	ldr r0, _0801599C @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080159A0 @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	subs r0, #0x11
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	ldr r1, _080159A4 @ =IWRAM_START + 0x31
	adds r2, r5, r1
	movs r0, #1
	strb r0, [r2]
	strh r7, [r4, #0xa]
	ldr r0, _080159A8 @ =IWRAM_START + 0x2C
	adds r5, r5, r0
	strb r7, [r5]
	strh r7, [r4, #0x16]
	strh r7, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #2
	bls _08015884
	ldrb r0, [r2]
	cmp r0, #0
	beq _0801596E
	ldr r1, _080159AC @ =gUnknown_080D5678
	ldr r0, _080159B0 @ =gUnknown_030059E0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r5, [r2]
	ldr r1, _080159B4 @ =gSpriteStates
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [r0]
	ldm r2!, {r1}
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801596E
	ldm r2!, {r3}
	ldr r2, [r2]
	lsrs r1, r2, #0x10
	adds r1, r1, r5
	lsls r1, r1, #0x10
	movs r0, #0xff
	ands r2, r0
	ldr r4, _080159B8 @ =0x040000D4
	ldr r0, _080159BC @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r3, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r3
	str r0, [r4]
	lsrs r1, r1, #0xf
	ldr r0, _080159C0 @ =gObjPalette
	adds r1, r1, r0
	str r1, [r4, #4]
	lsrs r2, r2, #1
	movs r0, #0x84
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _080159C4 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_0801596E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801597C: .4byte gUnknown_030054CC
_08015980: .4byte gUnknown_030055BC
_08015984: .4byte gUnknown_030055B4
_08015988: .4byte gUnknown_030054B0
_0801598C: .4byte sub_8015B50
_08015990: .4byte sub_80159C8
_08015994: .4byte IWRAM_START + 0x5D
_08015998: .4byte IWRAM_START + 0xC
_0801599C: .4byte IWRAM_START + 0x2D
_080159A0: .4byte IWRAM_START + 0x2E
_080159A4: .4byte IWRAM_START + 0x31
_080159A8: .4byte IWRAM_START + 0x2C
_080159AC: .4byte gUnknown_080D5678
_080159B0: .4byte gUnknown_030059E0
_080159B4: .4byte gSpriteStates
_080159B8: .4byte 0x040000D4
_080159BC: .4byte gUnknown_03002794
_080159C0: .4byte gObjPalette
_080159C4: .4byte gFlags

	thumb_func_start sub_80159C8
sub_80159C8: @ 0x080159C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08015A14 @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	adds r7, r6, #0
	ldr r2, _08015A18 @ =gUnknown_080D5674
	adds r0, #0x50
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _08015A1C @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r4, #0x80
	lsls r4, r4, #0x13
	ands r4, r1
	adds r2, r0, #0
	cmp r4, #0
	bne _08015A24
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	beq _08015A24
	adds r0, r3, #0
	bl TaskDestroy
	ldr r0, _08015A20 @ =gUnknown_030055BC
	strb r4, [r0]
	b _08015B44
	.align 2, 0
_08015A14: .4byte gCurTask
_08015A18: .4byte gUnknown_080D5674
_08015A1C: .4byte gUnknown_030059E0
_08015A20: .4byte gUnknown_030055BC
_08015A24:
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015A30
	b _08015B44
_08015A30:
	adds r0, r2, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015A46
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	cmp r1, #0
	bne _08015A46
	b _08015B44
_08015A46:
	adds r4, r6, #0
	adds r4, #0x4c
	adds r0, r4, #0
	mov r1, r8
	bl sub_80157F4
	ldrh r0, [r4]
	strh r0, [r5, #0xa]
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	ldr r0, [r6, #0x50]
	str r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r7]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x44
	mov r1, r8
	bl sub_80157C8
	ldr r2, [r6, #0x44]
	asrs r2, r2, #8
	ldr r1, _08015AE8 @ =gUnknown_03005960
	ldr r0, [r1]
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r0, [r6, #0x48]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	strh r2, [r7, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r7, #8]
	adds r0, r5, #0
	bl sub_8004558
	ldr r1, [r5, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08015B14
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x10]
	ldr r2, _08015AEC @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r0, [r6, #0x54]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08015AF0
	movs r0, #0x80
	lsls r0, r0, #1
	b _08015AF4
	.align 2, 0
_08015AE8: .4byte gUnknown_03005960
_08015AEC: .4byte gUnknown_030054B8
_08015AF0:
	movs r0, #0xff
	lsls r0, r0, #8
_08015AF4:
	strh r0, [r7, #2]
	ldr r0, [r6, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x18
	ands r0, r1
	str r0, [r6, #0x54]
	cmp r0, #0
	beq _08015B0A
	ldrh r0, [r7, #2]
	rsbs r0, r0, #0
	strh r0, [r7, #2]
_08015B0A:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8004860
	b _08015B1C
_08015B14:
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x10]
_08015B1C:
	adds r2, r6, #0
	adds r2, #0x5d
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08015B32
	movs r0, #0
	strb r0, [r2]
_08015B32:
	adds r1, r6, #0
	adds r1, #0x5c
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08015B44
	adds r0, r5, #0
	bl sub_80051E8
_08015B44:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015B50
sub_8015B50: @ 0x08015B50
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_8015B64
sub_8015B64: @ 0x08015B64
	push {r4, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _08015BC0 @ =gSpriteStates
	lsrs r0, r0, #0xe
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [r0]
	ldm r2!, {r1}
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08015BBA
	ldm r2!, {r3}
	ldr r2, [r2]
	lsrs r1, r2, #0x10
	adds r1, r1, r4
	lsls r1, r1, #0x10
	movs r0, #0xff
	ands r2, r0
	ldr r4, _08015BC4 @ =0x040000D4
	ldr r0, _08015BC8 @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r3, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r3
	str r0, [r4]
	lsrs r1, r1, #0xf
	ldr r0, _08015BCC @ =gObjPalette
	adds r1, r1, r0
	str r1, [r4, #4]
	lsrs r2, r2, #1
	movs r0, #0x84
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _08015BD0 @ =gFlags
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_08015BBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015BC0: .4byte gSpriteStates
_08015BC4: .4byte 0x040000D4
_08015BC8: .4byte gUnknown_03002794
_08015BCC: .4byte gObjPalette
_08015BD0: .4byte gFlags

	thumb_func_start sub_8015BD4
sub_8015BD4: @ 0x08015BD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _08015CB4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08015CA6
	ldr r1, _08015CB8 @ =gUnknown_030059E0
	adds r0, r1, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08015CA6
	adds r0, r1, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xf
	beq _08015C0E
	cmp r0, #0x12
	beq _08015C0E
	cmp r0, #0x24
	bne _08015CA6
_08015C0E:
	ldr r0, _08015CBC @ =sub_8015CE4
	movs r1, #0x86
	lsls r1, r1, #1
	ldr r2, _08015CC0 @ =0x00003001
	ldr r3, _08015CC4 @ =sub_8015FF0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _08015CC8 @ =gUnknown_080D6736
	ldr r6, _08015CB8 @ =gUnknown_030059E0
	adds r2, r6, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r5, _08015CCC @ =IWRAM_START + 0x100
	adds r4, r3, r5
	movs r5, #0
	strh r0, [r4]
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r7, _08015CD0 @ =IWRAM_START + 0x102
	adds r0, r3, r7
	strh r1, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _08015C76
	ldr r1, _08015CD4 @ =gUnknown_080D672C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r7, [r4]
	adds r0, r0, r7
	strh r0, [r4]
_08015C76:
	ldr r1, _08015CD8 @ =IWRAM_START + 0x104
	adds r0, r3, r1
	mov r4, r8
	strh r4, [r0]
	ldr r7, _08015CDC @ =IWRAM_START + 0x106
	adds r0, r3, r7
	strh r5, [r0]
	adds r1, #4
	adds r0, r3, r1
	strh r5, [r0]
	ldr r4, _08015CE0 @ =IWRAM_START + 0x10A
	adds r0, r3, r4
	strh r5, [r0]
	movs r1, #0
	movs r2, #0
_08015C94:
	lsls r0, r1, #4
	add r0, ip
	adds r0, #0xcc
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _08015C94
_08015CA6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015CB4: .4byte gUnknown_030054CC
_08015CB8: .4byte gUnknown_030059E0
_08015CBC: .4byte sub_8015CE4
_08015CC0: .4byte 0x00003001
_08015CC4: .4byte sub_8015FF0
_08015CC8: .4byte gUnknown_080D6736
_08015CCC: .4byte IWRAM_START + 0x100
_08015CD0: .4byte IWRAM_START + 0x102
_08015CD4: .4byte gUnknown_080D672C
_08015CD8: .4byte IWRAM_START + 0x104
_08015CDC: .4byte IWRAM_START + 0x106
_08015CE0: .4byte IWRAM_START + 0x10A

	thumb_func_start sub_8015CE4
sub_8015CE4: @ 0x08015CE4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08015D18 @ =gCurTask
	ldr r2, [r0]
	ldrh r3, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r4, _08015D1C @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08015D10
	ldr r1, _08015D20 @ =IWRAM_START + 0x100
	adds r0, r3, r1
	ldr r0, [r0]
	ldr r1, [r4, #0x68]
	cmp r0, r1
	beq _08015D28
	ldr r0, _08015D24 @ =0x0001019F
	cmp r1, r0
	beq _08015D28
_08015D10:
	adds r0, r2, #0
	bl TaskDestroy
	b _08015E10
	.align 2, 0
_08015D18: .4byte gCurTask
_08015D1C: .4byte gUnknown_030059E0
_08015D20: .4byte IWRAM_START + 0x100
_08015D24: .4byte 0x0001019F
_08015D28:
	movs r5, #0
_08015D2A:
	lsls r0, r5, #4
	adds r0, r6, r0
	adds r2, r0, #0
	adds r2, #0xcc
	ldrb r0, [r2]
	cmp r0, #0
	beq _08015D56
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r6, r0
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08015D56
	movs r0, #0
	strb r0, [r2]
	ldr r0, [r4, #4]
	bl sub_8007CF0
_08015D56:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08015D2A
	ldr r3, _08015E18 @ =gUnknown_080D5684
	movs r2, #0x84
	lsls r2, r2, #1
	adds r5, r6, r2
	ldrh r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r2, #4
	adds r0, r6, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r1, r1, r3
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	lsrs r2, r0, #0x10
	ldr r7, _08015E1C @ =0x0000FFFF
	cmp r2, r7
	beq _08015DBE
	movs r0, #0x83
	lsls r0, r0, #1
	adds r4, r6, r0
	ldrh r1, [r4]
	ldr r0, _08015E20 @ =gUnknown_030059E0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r0, r1, r0
	strh r0, [r4]
	cmp r1, r2
	blo _08015DBE
	ldrh r0, [r5]
	bl sub_8015E28
	ldrh r0, [r5]
	adds r0, #1
	ands r0, r7
	movs r1, #7
	ands r0, r1
	strh r0, [r5]
	cmp r0, #0
	bne _08015DBE
	strh r0, [r4]
_08015DBE:
	movs r5, #0
	ldr r7, _08015E24 @ =gUnknown_03005960
_08015DC2:
	lsls r2, r5, #4
	adds r0, r6, r2
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #0
	beq _08015E06
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r6, r0
	adds r0, r6, #0
	adds r0, #0xc0
	adds r0, r0, r2
	ldr r1, [r0]
	lsls r1, r1, #8
	adds r0, r6, #0
	adds r0, #0xc4
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r0, r0, #8
	ldr r2, [r7]
	asrs r1, r1, #0x10
	subs r1, r1, r2
	strh r1, [r4, #0x16]
	ldr r1, [r7, #4]
	asrs r0, r0, #0x10
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08015E06:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08015DC2
_08015E10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015E18: .4byte gUnknown_080D5684
_08015E1C: .4byte 0x0000FFFF
_08015E20: .4byte gUnknown_030059E0
_08015E24: .4byte gUnknown_03005960

	thumb_func_start sub_8015E28
sub_8015E28: @ 0x08015E28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08015E4C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	movs r3, #0
	adds r1, #0xcc
	adds r0, r0, r1
	b _08015E62
	.align 2, 0
_08015E4C: .4byte gCurTask
_08015E50:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08015E5C
	b _08015FE2
_08015E5C:
	lsls r0, r3, #4
	adds r0, r5, r0
	adds r0, #0xcc
_08015E62:
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015E50
	cmp r3, #3
	bls _08015E6E
	b _08015FE2
_08015E6E:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r6, r5, r0
	lsls r3, r3, #4
	adds r0, r5, r3
	adds r0, #0xcc
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xc0
	adds r7, r0, r3
	ldr r1, _08015ED0 @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	str r0, [r7]
	adds r4, r5, #0
	adds r4, #0xc4
	adds r2, r4, r3
	ldr r0, [r1, #0xc]
	str r0, [r2]
	ldr r1, [r1, #0x20]
	movs r0, #1
	ands r1, r0
	mov r8, r3
	mov sb, r4
	cmp r1, #0
	beq _08015ED8
	ldr r3, _08015ED4 @ =gUnknown_080D5684
	mov r2, ip
	lsls r4, r2, #1
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r3, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r7]
	subs r0, r0, r1
	b _08015F00
	.align 2, 0
_08015ED0: .4byte gUnknown_030059E0
_08015ED4: .4byte gUnknown_080D5684
_08015ED8:
	ldr r3, _08015F3C @ =gUnknown_080D5684
	mov r1, ip
	lsls r4, r1, #1
	adds r1, r4, r1
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r3, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r7]
	adds r0, r0, r1
_08015F00:
	str r0, [r7]
	adds r7, r3, #0
	ldr r0, _08015F40 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015F44
	mov r3, sb
	add r3, r8
	mov r2, ip
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r7, #4
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	subs r0, r0, r1
	b _08015F6C
	.align 2, 0
_08015F3C: .4byte gUnknown_080D5684
_08015F40: .4byte gUnknown_03005424
_08015F44:
	mov r3, sb
	add r3, r8
	mov r2, ip
	adds r1, r4, r2
	lsls r1, r1, #1
	movs r2, #0x82
	lsls r2, r2, #1
	adds r0, r5, r2
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r1, r1, r0
	adds r0, r7, #4
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r1, r1, #8
	ldr r0, [r3]
	adds r0, r0, r1
_08015F6C:
	str r0, [r3]
	mov r1, r8
	adds r0, r5, r1
	adds r1, r0, #0
	adds r1, #0xc8
	movs r5, #0
	movs r4, #0
	strh r4, [r1]
	adds r0, #0xca
	strh r4, [r0]
	movs r0, #4
	bl sub_8007C10
	str r0, [r6, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r6, #0x1a]
	strh r4, [r6, #8]
	subs r0, #0xa6
	strh r0, [r6, #0xa]
	adds r0, r6, #0
	adds r0, #0x20
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x1c]
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08015FD8 @ =gUnknown_030059E0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r5, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	str r2, [r6, #0x10]
	ldr r0, _08015FDC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015FE0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r0, r2
	str r0, [r6, #0x10]
	b _08015FE2
	.align 2, 0
_08015FD8: .4byte gUnknown_030059E0
_08015FDC: .4byte gUnknown_03005424
_08015FE0:
	str r2, [r6, #0x10]
_08015FE2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8015FF0
sub_8015FF0: @ 0x08015FF0
	push {r4, r5, lr}
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_08015FFC:
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r0, #0xcc
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016016
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl sub_8007CF0
_08016016:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08015FFC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8016028
sub_8016028: @ 0x08016028
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08016090 @ =sub_801623C
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08016094 @ =sub_8018878
	str r1, [sp]
	movs r1, #0x6c
	movs r3, #0
	bl TaskCreate
	mov r8, r0
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _08016098 @ =IWRAM_START + 0x56
	adds r0, r3, r1
	movs r1, #0
	strb r4, [r0]
	ldr r0, _0801609C @ =IWRAM_START + 0x54
	adds r2, r3, r0
	movs r0, #0x40
	strh r0, [r2]
	mov r2, ip
	str r1, [r2, #0x44]
	str r1, [r2, #0x48]
	ldr r2, _080160A0 @ =IWRAM_START + 0x66
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	ldr r0, _080160A4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _080160AC
	ldr r0, _080160A8 @ =IWRAM_START + 0x60
	adds r1, r3, r0
	movs r0, #0x1e
	b _080160B2
	.align 2, 0
_08016090: .4byte sub_801623C
_08016094: .4byte sub_8018878
_08016098: .4byte IWRAM_START + 0x56
_0801609C: .4byte IWRAM_START + 0x54
_080160A0: .4byte IWRAM_START + 0x66
_080160A4: .4byte 0x04000128
_080160A8: .4byte IWRAM_START + 0x60
_080160AC:
	ldr r2, _0801611C @ =IWRAM_START + 0x60
	adds r1, r3, r2
	movs r0, #0
_080160B2:
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x57
	movs r5, #0
	movs r0, #0x80
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x61
	strb r5, [r0]
	mov r0, ip
	str r5, [r0, #0x5c]
	mov r2, ip
	adds r2, #0x56
	ldrb r1, [r2]
	adds r0, #0x64
	strb r1, [r0]
	ldr r6, _08016120 @ =gUnknown_030054CC
	ldrb r0, [r6]
	adds r7, r2, #0
	cmp r0, #5
	beq _080160E8
	mov r1, ip
	ldr r0, [r1, #0x5c]
	movs r1, #2
	orrs r0, r1
	mov r2, ip
	str r0, [r2, #0x5c]
_080160E8:
	mov r3, ip
	adds r3, #0x50
	movs r1, #0
	strh r5, [r3]
	mov r4, ip
	adds r4, #0x52
	strh r5, [r4]
	ldrb r0, [r6]
	cmp r0, #4
	bhi _0801612C
	ldr r1, _08016124 @ =gSpawnPositions
	ldr r2, _08016128 @ =gUnknown_030055B4
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	b _08016186
	.align 2, 0
_0801611C: .4byte IWRAM_START + 0x60
_08016120: .4byte gUnknown_030054CC
_08016124: .4byte gSpawnPositions
_08016128: .4byte gUnknown_030055B4
_0801612C:
	ldr r0, _08016144 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08016160
	cmp r0, #1
	bgt _08016148
	cmp r0, #0
	beq _08016152
	b _08016188
	.align 2, 0
_08016144: .4byte 0x04000128
_08016148:
	cmp r0, #2
	beq _08016170
	cmp r0, #3
	beq _08016180
	b _08016188
_08016152:
	movs r0, #0xe8
	strh r0, [r3]
	ldr r0, _0801615C @ =0x0000033D
	b _08016186
	.align 2, 0
_0801615C: .4byte 0x0000033D
_08016160:
	ldr r0, _08016168 @ =0x00000631
	strh r0, [r3]
	ldr r0, _0801616C @ =0x00000117
	b _08016186
	.align 2, 0
_08016168: .4byte 0x00000631
_0801616C: .4byte 0x00000117
_08016170:
	ldr r0, _08016178 @ =0x00000631
	strh r0, [r3]
	ldr r0, _0801617C @ =0x0000039E
	b _08016186
	.align 2, 0
_08016178: .4byte 0x00000631
_0801617C: .4byte 0x0000039E
_08016180:
	movs r0, #0xe8
	strh r0, [r3]
	adds r0, #0x74
_08016186:
	strh r0, [r4]
_08016188:
	mov r4, ip
	movs r2, #0
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r3, r4, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	ldrb r0, [r7]
	adds r3, #3
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	strh r1, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r2, [r0]
	strh r1, [r4, #0x16]
	strh r1, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x3c]
	ldr r2, _08016204 @ =gUnknown_080D672C
	ldr r1, _08016208 @ =gUnknown_03005500
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	ldr r0, _0801620C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r7]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08016210
	movs r0, #0x40
	bl sub_8007C10
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08016214
	.align 2, 0
_08016204: .4byte gUnknown_080D672C
_08016208: .4byte gUnknown_03005500
_0801620C: .4byte 0x04000128
_08016210:
	ldr r0, _08016234 @ =0x06010000
	str r0, [r4, #4]
_08016214:
	adds r0, r4, #0
	bl sub_8004558
	ldr r1, _08016238 @ =gUnknown_030055A0
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016234: .4byte 0x06010000
_08016238: .4byte gUnknown_030055A0

	thumb_func_start sub_801623C
sub_801623C: @ 0x0801623C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08016340 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	adds r7, r6, #0
	adds r0, #0x38
	adds r0, r5, r0
	str r0, [sp]
	ldr r1, _08016344 @ =IWRAM_START + 0x56
	adds r3, r5, r1
	ldrb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _08016348 @ =gMultiSioRecv
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0801634C @ =gMultiSioStatusFlags
	mov sb, r4
	movs r4, #1
	adds r1, r4, #0
	lsls r1, r2
	mov r2, sb
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08016284
	b _0801666C
_08016284:
	ldr r0, _08016350 @ =IWRAM_START + 0x61
	adds r2, r5, r0
	movs r1, #0
	mov ip, r1
	mov r0, ip
	strb r0, [r2]
	adds r1, r4, #0
	ldrb r3, [r3]
	lsls r1, r3
	mov r3, sb
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _080162A2
	b _0801666C
_080162A2:
	mov r4, r8
	ldrh r1, [r4]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	beq _080162B0
	b _0801666C
_080162B0:
	mov r0, ip
	strb r0, [r2]
	ldr r0, _08016354 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _080162BE
	b _080163C0
_080162BE:
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r3, _08016358 @ =IWRAM_START + 0x50
	adds r3, r3, r5
	mov ip, r3
	movs r4, #0
	ldrsh r0, [r3, r4]
	subs r4, r1, r0
	str r4, [r6, #0x44]
	mov r0, r8
	movs r1, #4
	ldrsh r0, [r0, r1]
	mov sb, r0
	ldr r3, _0801635C @ =IWRAM_START + 0x52
	adds r2, r5, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r3, sb
	subs r1, r3, r0
	str r1, [r6, #0x48]
	adds r0, r4, #0
	cmp r4, #0
	bge _080162EE
	rsbs r0, r4, #0
_080162EE:
	mov r3, ip
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0xf
	ble _080163A6
	adds r0, r1, #0
	cmp r1, #0
	bge _08016300
	rsbs r0, r1, #0
_08016300:
	ldr r2, _08016358 @ =IWRAM_START + 0x50
	adds r2, r5, r2
	str r2, [sp, #4]
	ldr r3, _0801635C @ =IWRAM_START + 0x52
	adds r3, r5, r3
	str r3, [sp, #8]
	cmp r0, #0xf
	ble _080163A6
	cmp r4, #0
	ble _08016368
	cmp r1, #0
	ble _08016368
	mov r4, r8
	movs r5, #2
	ldrsh r0, [r4, r5]
	ldr r1, _08016360 @ =0xFFFFFA60
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	ldr r4, [sp, #8]
	movs r5, #0
	ldrsh r1, [r4, r5]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	ldr r4, _08016364 @ =0xFFFFFCA0
	adds r0, r0, r4
	subs r1, r1, r0
	str r1, [r6, #0x48]
	b _080163A6
	.align 2, 0
_08016340: .4byte gCurTask
_08016344: .4byte IWRAM_START + 0x56
_08016348: .4byte gMultiSioRecv
_0801634C: .4byte gMultiSioStatusFlags
_08016350: .4byte IWRAM_START + 0x61
_08016354: .4byte gUnknown_030054CC
_08016358: .4byte IWRAM_START + 0x50
_0801635C: .4byte IWRAM_START + 0x52
_08016360: .4byte 0xFFFFFA60
_08016364: .4byte 0xFFFFFCA0
_08016368:
	ldr r0, [r7, #0x44]
	adds r5, r7, #0
	adds r5, #0x50
	str r5, [sp, #4]
	adds r1, r7, #0
	adds r1, #0x52
	str r1, [sp, #8]
	cmp r0, #0
	bge _080163A6
	ldr r0, [r7, #0x48]
	cmp r0, #0
	bge _080163A6
	mov r2, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r4, #0
	ldrsh r0, [r5, r4]
	ldr r5, _080163B8 @ =0xFFFFFA60
	adds r0, r0, r5
	subs r1, r1, r0
	str r1, [r7, #0x44]
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r3, _080163BC @ =0xFFFFFCA0
	adds r0, r0, r3
	mov r4, r8
	movs r5, #4
	ldrsh r1, [r4, r5]
	subs r0, r0, r1
	str r0, [r7, #0x48]
_080163A6:
	mov r1, r8
	ldrh r0, [r1, #2]
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldrh r0, [r1, #4]
	ldr r3, [sp, #8]
	strh r0, [r3]
	b _080163F2
	.align 2, 0
_080163B8: .4byte 0xFFFFFA60
_080163BC: .4byte 0xFFFFFCA0
_080163C0:
	mov r4, r8
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r2, _0801641C @ =IWRAM_START + 0x50
	adds r3, r5, r2
	movs r4, #0
	ldrsh r1, [r3, r4]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	ldr r4, _08016420 @ =IWRAM_START + 0x52
	adds r2, r5, r4
	movs r5, #0
	ldrsh r1, [r2, r5]
	subs r0, r0, r1
	str r0, [r6, #0x48]
	mov r1, r8
	ldrh r0, [r1, #2]
	strh r0, [r3]
	ldrh r0, [r1, #4]
	strh r0, [r2]
	str r3, [sp, #4]
	str r2, [sp, #8]
_080163F2:
	ldr r0, [r7, #0x44]
	adds r1, r0, #0
	cmp r0, #0
	bge _080163FC
	rsbs r1, r0, #0
_080163FC:
	cmp r1, #0x40
	bgt _0801640C
	ldr r1, [r7, #0x48]
	cmp r1, #0
	bge _08016408
	rsbs r1, r1, #0
_08016408:
	cmp r1, #0x40
	ble _08016424
_0801640C:
	adds r0, r7, #0
	adds r0, #0x66
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _08016434
	.align 2, 0
_0801641C: .4byte IWRAM_START + 0x50
_08016420: .4byte IWRAM_START + 0x52
_08016424:
	lsls r0, r0, #8
	adds r1, r7, #0
	adds r1, #0x66
	strh r0, [r1]
	ldr r0, [r7, #0x48]
	lsls r0, r0, #8
	adds r1, #2
	strh r0, [r1]
_08016434:
	adds r2, r7, #0
	adds r2, #0x57
	ldrb r3, [r2]
	mov r4, r8
	ldrb r0, [r4, #0xa]
	adds r4, r0, #0
	bics r4, r3
	ldr r0, _080164C0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	adds r1, r7, #0
	adds r1, #0x56
	lsrs r0, r0, #0x1e
	mov sb, r2
	mov sl, r1
	ldrb r5, [r1]
	cmp r0, r5
	bne _08016490
	movs r1, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08016474
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _08016474
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_802A854
_08016474:
	movs r0, #0x50
	ands r4, r0
	cmp r4, #0
	beq _08016490
	mov r2, sb
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	bne _08016490
	mov r3, sl
	movs r0, #0
	ldrsb r0, [r3, r0]
	bl sub_802A9A4
_08016490:
	mov r4, r8
	ldrb r0, [r4, #0xa]
	mov r5, sb
	strb r0, [r5]
	ldrh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x54
	strh r1, [r0]
	ldr r3, _080164C0 @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, sl
	ldrb r2, [r2]
	cmp r0, r2
	beq _080164C4
	movs r0, #0xc0
	lsls r0, r0, #3
	ands r0, r1
	lsrs r0, r0, #9
	adds r1, r7, #0
	adds r1, #0x64
	strb r0, [r1]
	b _08016576
	.align 2, 0
_080164C0: .4byte 0x04000128
_080164C4:
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	adds r4, r7, #0
	adds r4, #0x64
	ldrb r2, [r4]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08016576
	ldr r1, _080165A8 @ =gUnknown_030055A0
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	ldr r2, _080165AC @ =IWRAM_START + 0x64
	adds r1, r1, r2
	lsrs r0, r0, #0x1e
	ldrb r1, [r1]
	cmp r0, r1
	bne _08016576
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r4]
	ldr r4, _080165B0 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	movs r3, #5
	rsbs r3, r3, #0
	mov sb, r3
	ands r0, r3
	adds r1, #0x10
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080165B4 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _080165B8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
	ldr r0, _080165BC @ =sub_8025318
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r2, _080165C0 @ =0xFFBFFFFF
	ands r0, r2
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	mov r3, sb
	ands r0, r3
	str r0, [r7, #0x5c]
	ldr r0, [r5, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08016576
	ldr r0, [r4, #0x20]
	ands r0, r2
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x5c]
	ands r0, r3
	str r0, [r5, #0x5c]
_08016576:
	ldr r0, _080165C4 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _080165D0
	mov r4, r8
	ldrh r1, [r4, #6]
	ldrb r3, [r4, #6]
	ldr r2, _080165C8 @ =gUnknown_030053E8
	mov r5, sl
	ldrb r0, [r5]
	adds r0, r0, r2
	lsrs r1, r1, #8
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x6a
	strh r3, [r0]
	ldr r1, _080165CC @ =gUnknown_080D672C
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _080165D4
	.align 2, 0
_080165A8: .4byte gUnknown_030055A0
_080165AC: .4byte IWRAM_START + 0x64
_080165B0: .4byte gUnknown_030059E0
_080165B4: .4byte 0xFFFFFBFF
_080165B8: .4byte 0xFFFFFEFF
_080165BC: .4byte sub_8025318
_080165C0: .4byte 0xFFBFFFFF
_080165C4: .4byte gUnknown_030054CC
_080165C8: .4byte gUnknown_030053E8
_080165CC: .4byte gUnknown_080D672C
_080165D0:
	mov r0, r8
	ldrh r3, [r0, #6]
_080165D4:
	mov r1, r8
	ldrb r0, [r1, #0xb]
	movs r5, #0xf
	ands r5, r0
	ldrh r0, [r6, #0xa]
	adds r4, r6, #0
	adds r4, #0x20
	cmp r0, r3
	bne _080165EC
	ldrb r0, [r4]
	cmp r0, r5
	beq _080165F4
_080165EC:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x30]
_080165F4:
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08016642
	ldr r0, [r7, #0x5c]
	ands r0, r2
	ldr r2, _08016664 @ =gUnknown_030059E0
	mov ip, r2
	cmp r0, #0
	beq _08016622
	ldr r0, [r2, #0x20]
	ldr r1, _08016668 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
_08016622:
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016642
	mov r2, ip
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08016642
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08016642:
	strh r3, [r6, #0xa]
	strb r5, [r4]
	mov r3, r8
	ldrb r0, [r3, #0xb]
	lsrs r0, r0, #4
	adds r1, r7, #0
	adds r1, #0x58
	strb r0, [r1]
	ldrb r0, [r3, #0xc]
	adds r1, r6, #0
	adds r1, #0x22
	strb r0, [r1]
	ldrb r0, [r3, #0xd]
	lsls r0, r0, #2
	ldr r4, [sp]
	strh r0, [r4]
	b _080166F0
	.align 2, 0
_08016664: .4byte gUnknown_030059E0
_08016668: .4byte 0xFFBFFFFF
_0801666C:
	adds r3, r7, #0
	adds r3, #0x50
	adds r0, r7, #0
	adds r0, #0x66
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r5, [r3]
	adds r0, r0, r5
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x52
	adds r0, r7, #0
	adds r0, #0x68
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x61
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0x1e
	bls _080166F0
	ldr r1, _080166D4 @ =0x0000FFFF
	movs r0, #0
	bl sub_80029D0
	ldr r1, _080166D8 @ =gUnknown_03002AE4
	ldr r0, _080166DC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080166E0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080166E4 @ =gUnknown_03004D5C
	ldr r0, _080166E8 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080166EC @ =gUnknown_030054CC
	ldrb r0, [r0]
	bl sub_805B9A4
	b _08016D08
	.align 2, 0
_080166D4: .4byte 0x0000FFFF
_080166D8: .4byte gUnknown_03002AE4
_080166DC: .4byte gUnknown_0300287C
_080166E0: .4byte gUnknown_03005390
_080166E4: .4byte gUnknown_03004D5C
_080166E8: .4byte gUnknown_03002A84
_080166EC: .4byte gUnknown_030054CC
_080166F0:
	movs r2, #3
	ldr r3, _0801688C @ =gUnknown_080D672C
	movs r4, #6
	ldrsh r0, [r3, r4]
	ldrh r1, [r6, #0xa]
	adds r5, r7, #0
	adds r5, #0x54
	str r5, [sp, #0xc]
	ldr r4, _08016890 @ =gUnknown_03005960
	cmp r0, r1
	ble _08016722
_08016706:
	lsls r0, r2, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08016722
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r5, #0
	ldrsh r0, [r0, r5]
	cmp r0, r1
	bgt _08016706
_08016722:
	ldr r1, [r4]
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r1, [r4, #4]
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	ldr r1, [r4]
	ldrh r0, [r2]
	subs r0, r0, r1
	ldr r5, [sp]
	strh r0, [r5, #6]
	ldr r1, [r4, #4]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08016766
	adds r1, r6, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x30]
_08016766:
	adds r0, r6, #0
	bl sub_8004558
	ldr r0, _08016894 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _0801680C
	ldr r1, _08016898 @ =gUnknown_030054B4
	ldr r2, _0801689C @ =0x04000128
	ldr r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801680C
	movs r1, #1
	mov sl, r1
	movs r5, #0
	ldr r1, _080168A0 @ =gUnknown_030055A0
	ldr r0, [r1]
	cmp r0, #0
	beq _080167FE
	ldr r0, _080168A4 @ =gUnknown_030055B8
	ldrb r0, [r0]
	mov r8, r0
	movs r3, #0x10
	mov ip, r3
	mov sb, r2
	adds r4, r1, #0
_080167A8:
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	str r0, [sp, #0x10]
	mov r2, ip
	lsls r2, r5
	mov r0, r8
	ands r2, r0
	adds r0, r5, #4
	asrs r2, r0
	mov r1, sb
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r1, ip
	lsls r1, r0
	mov r3, r8
	ands r1, r3
	mov r3, sb
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r1, r0
	cmp r2, r1
	bne _080167F0
	ldr r1, [sp, #0x10]
	ldr r2, _080168A8 @ =IWRAM_START + 0x54
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080167F0
	movs r3, #0
	mov sl, r3
_080167F0:
	adds r4, #4
	adds r5, #1
	cmp r5, #3
	bhi _080167FE
	ldr r0, [r4]
	cmp r0, #0
	bne _080167A8
_080167FE:
	mov r4, sl
	cmp r4, #0
	beq _0801680C
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
_0801680C:
	ldr r0, _080168AC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	ldr r5, _080168B0 @ =gUnknown_030059E0
	mov ip, r5
	cmp r0, #0
	bne _08016910
	ldr r0, [r7, #0x54]
	ldr r1, _080168B4 @ =0x80000004
	ands r0, r1
	cmp r0, #0
	bne _08016910
	mov r0, ip
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08016838
	b _08016956
_08016838:
	ldr r0, [r7, #0x5c]
	ands r0, r2
	cmp r0, #0
	bne _08016910
	mov r1, ip
	movs r2, #0x2c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08016910
	ldr r0, [r1, #0x20]
	ldr r1, _080168B8 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _08016910
	ldr r0, _08016894 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _080168F0
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r1, [r0]
	ldr r0, _0801689C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bne _08016870
	b _08016A1A
_08016870:
	ldr r0, _080168BC @ =gUnknown_03005500
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bls _08016880
	b _08016A1A
_08016880:
	lsls r0, r0, #2
	ldr r1, _080168C0 @ =_080168C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801688C: .4byte gUnknown_080D672C
_08016890: .4byte gUnknown_03005960
_08016894: .4byte gUnknown_030054CC
_08016898: .4byte gUnknown_030054B4
_0801689C: .4byte 0x04000128
_080168A0: .4byte gUnknown_030055A0
_080168A4: .4byte gUnknown_030055B8
_080168A8: .4byte IWRAM_START + 0x54
_080168AC: .4byte gUnknown_03005424
_080168B0: .4byte gUnknown_030059E0
_080168B4: .4byte 0x80000004
_080168B8: .4byte 0x00400080
_080168BC: .4byte gUnknown_03005500
_080168C0: .4byte _080168C4
_080168C4: @ jump table
	.4byte _080168E4 @ case 0
	.4byte _080168E4 @ case 1
	.4byte _080168D8 @ case 2
	.4byte _080168DE @ case 3
	.4byte _080168EA @ case 4
_080168D8:
	bl sub_801707C
	b _08016A1A
_080168DE:
	bl sub_8017670
	b _08016A1A
_080168E4:
	bl sub_8016D20
	b _08016A1A
_080168EA:
	bl sub_8017C28
	b _08016A1A
_080168F0:
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _0801690C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	bne _08016904
	b _08016A1A
_08016904:
	bl sub_8018120
	b _08016A1A
	.align 2, 0
_0801690C: .4byte 0x04000128
_08016910:
	mov r0, ip
	adds r0, #0x37
	ldrb r1, [r0]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08016956
	adds r0, r7, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08016956
	mov r3, ip
	movs r4, #0x2c
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bne _08016956
	ldr r0, [r3, #0x20]
	ands r0, r2
	cmp r0, #0
	bne _08016956
	ldr r1, _080169DC @ =gUnknown_030054B4
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08016A1A
_08016956:
	ldr r0, _080169E0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _080169F4
	adds r4, r7, #0
	adds r4, #0x56
	ldrb r1, [r4]
	ldr r0, _080169E4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _080169BC
	ldr r0, _080169E8 @ =gUnknown_03005500
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bgt _080169BC
	cmp r0, #2
	blt _080169BC
	ldr r1, [r7, #0x5c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080169BC
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r7, #0x5c]
	ldr r2, _080169EC @ =gUnknown_030059E0
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080169AC
	ldr r0, [r2, #0x20]
	ldr r1, _080169F0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
_080169AC:
	bl sub_8019224
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldrb r1, [r4]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_080169BC:
	ldr r2, _080169EC @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016A1A
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08016A1A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
	b _08016A12
	.align 2, 0
_080169DC: .4byte gUnknown_030054B4
_080169E0: .4byte gUnknown_030054CC
_080169E4: .4byte 0x04000128
_080169E8: .4byte gUnknown_03005500
_080169EC: .4byte gUnknown_030059E0
_080169F0: .4byte 0xFFBFFFFF
_080169F4:
	mov r5, ip
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016A1A
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08016A1A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08016A12:
	adds r1, r7, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_08016A1A:
	ldr r0, [sp, #0xc]
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016A86
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08016A5C @ =gUnknown_030054B8
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
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016A60
	movs r0, #0xff
	lsls r0, r0, #8
	ldr r3, [sp]
	strh r0, [r3, #2]
	b _08016A68
	.align 2, 0
_08016A5C: .4byte gUnknown_030054B8
_08016A60:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r4, [sp]
	strh r0, [r4, #2]
_08016A68:
	ldr r5, [sp, #0xc]
	ldrh r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016A7C
	ldr r1, [sp]
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_08016A7C:
	adds r0, r6, #0
	ldr r1, [sp]
	bl sub_8004860
	b _08016ACC
_08016A86:
	ldr r2, [r6, #0x10]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r6, #0x10]
	ldr r3, [sp, #0xc]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016AA4
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	b _08016AA8
_08016AA4:
	ldr r0, _08016AC0 @ =0xFFFFFBFF
	ands r2, r0
_08016AA8:
	str r2, [r6, #0x10]
	ldr r4, [sp, #0xc]
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08016AC4
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08016ACA
	.align 2, 0
_08016AC0: .4byte 0xFFFFFBFF
_08016AC4:
	ldr r0, [r6, #0x10]
	ldr r1, _08016C0C @ =0xFFFFF7FF
	ands r0, r1
_08016ACA:
	str r0, [r6, #0x10]
_08016ACC:
	ldr r1, [r6, #0x10]
	ldr r0, _08016C10 @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r6, #0x10]
	ldr r5, [sp, #0xc]
	ldrh r2, [r5]
	movs r0, #0x30
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r6, #0x10]
	ldrh r3, [r5]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08016AEE
	b _08016CE8
_08016AEE:
	ldr r0, _08016C14 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r4, #2
	ands r0, r4
	movs r1, #0x57
	adds r1, r1, r7
	mov sb, r1
	cmp r0, #0
	bne _08016B48
	ldrb r1, [r1]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08016B48
	ldr r2, [r7, #0x5c]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08016B48
	ldr r1, _08016C18 @ =gUnknown_030054B4
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08016B48
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016B36
	b _08016CE8
_08016B36:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08016B40
	b _08016CE8
_08016B40:
	ands r2, r4
	cmp r2, #0
	beq _08016B48
	b _08016CE8
_08016B48:
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	cmp r0, #0
	beq _08016B60
	movs r4, #0x88
	lsls r4, r4, #3
	adds r1, r4, #0
_08016B60:
	strh r1, [r6, #0x1a]
	ldr r5, [r6, #0x10]
	ldr r0, _08016C1C @ =0xFFFFFE7F
	ands r5, r0
	str r5, [r6, #0x10]
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08016BE6
	ldr r0, _08016C20 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08016BAE
	ldr r0, _08016C24 @ =gUnknown_030055B8
	ldrb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08016C28 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08016BE6
_08016BAE:
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016BE6
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _08016C28 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08016BE6
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r5, r0
	str r5, [r6, #0x10]
	ldr r2, _08016C2C @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08016C30 @ =gWinRegs
	ldr r0, _08016C34 @ =0x0000083F
	strh r0, [r1, #0xa]
_08016BE6:
	ldrh r0, [r6, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08016C38
	movs r4, #0x18
	ldrsh r1, [r6, r4]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08016C38
	cmp r1, #0xdf
	bgt _08016C38
	adds r0, r6, #0
	bl sub_80051E8
	b _08016CE8
	.align 2, 0
_08016C0C: .4byte 0xFFFFF7FF
_08016C10: .4byte 0xFFFFCFFF
_08016C14: .4byte gUnknown_03005590
_08016C18: .4byte gUnknown_030054B4
_08016C1C: .4byte 0xFFFFFE7F
_08016C20: .4byte gUnknown_030054CC
_08016C24: .4byte gUnknown_030055B8
_08016C28: .4byte 0x04000128
_08016C2C: .4byte gDispCnt
_08016C30: .4byte gWinRegs
_08016C34: .4byte 0x0000083F
_08016C38:
	ldr r0, _08016C78 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _08016CE8
	ldr r0, _08016C7C @ =gUnknown_03005960
	movs r5, #0x16
	ldrsh r1, [r6, r5]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #2
	cmp r0, r1
	ble _08016C88
	ldr r1, _08016C80 @ =0xFFFFFA60
	adds r0, r1, #0
	ldrh r2, [r6, #0x16]
	adds r1, r0, r2
	strh r1, [r6, #0x16]
	ldr r3, [sp]
	ldrh r3, [r3, #6]
	adds r0, r0, r3
	ldr r4, [sp]
	strh r0, [r4, #6]
	ldr r5, _08016C84 @ =0xFFFFFCA0
	adds r0, r5, #0
	ldrh r2, [r6, #0x18]
	adds r1, r0, r2
	strh r1, [r6, #0x18]
	ldrh r3, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	b _08016CB0
	.align 2, 0
_08016C78: .4byte gUnknown_030054CC
_08016C7C: .4byte gUnknown_03005960
_08016C80: .4byte 0xFFFFFA60
_08016C84: .4byte 0xFFFFFCA0
_08016C88:
	movs r4, #0xb4
	lsls r4, r4, #3
	adds r0, r4, #0
	ldrh r5, [r6, #0x16]
	adds r1, r0, r5
	strh r1, [r6, #0x16]
	ldr r1, [sp]
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ldr r2, [sp]
	strh r0, [r2, #6]
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r0, r3, #0
	ldrh r4, [r6, #0x18]
	adds r1, r0, r4
	strh r1, [r6, #0x18]
	ldrh r5, [r2, #8]
	adds r0, r0, r5
	strh r0, [r2, #8]
_08016CB0:
	ldrh r0, [r6, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08016CE8
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08016CE8
	cmp r1, #0xdf
	bgt _08016CE8
	ldr r2, [sp, #0xc]
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08016CE2
	adds r0, r6, #0
	ldr r1, [sp]
	bl sub_8004860
_08016CE2:
	adds r0, r6, #0
	bl sub_80051E8
_08016CE8:
	ldr r4, _08016D18 @ =gUnknown_03005B7C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016CF8
	bl sub_8087368
	movs r0, #0
	strb r0, [r4]
_08016CF8:
	ldr r4, _08016D1C @ =gUnknown_0300583C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08016D08
	bl sub_801A384
	movs r0, #0
	strb r0, [r4]
_08016D08:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016D18: .4byte gUnknown_03005B7C
_08016D1C: .4byte gUnknown_0300583C

	thumb_func_start sub_8016D20
sub_8016D20: @ 0x08016D20
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r2, _08016DB8 @ =gUnknown_030059E0
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0xc
	ldr r0, _08016DBC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	mov r8, r6
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08016D58
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _08016D58
	bl sub_8017F34
_08016D58:
	ldr r0, _08016DC0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08016D90
	ldr r0, _08016DC4 @ =gUnknown_030055B8
	ldrb r3, [r0]
	adds r0, r6, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08016DC8 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08016DCC
_08016D90:
	bl sub_8018300
	cmp r0, #0
	bne _08016D9A
	b _0801706A
_08016D9A:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08016DA6
	b _0801706A
_08016DA6:
	ldr r2, _08016DB8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r6, #0x4c]
	b _0801706A
	.align 2, 0
_08016DB8: .4byte gUnknown_030059E0
_08016DBC: .4byte gCurTask
_08016DC0: .4byte gUnknown_030054CC
_08016DC4: .4byte gUnknown_030055B8
_08016DC8: .4byte 0x04000128
_08016DCC:
	adds r1, r6, #0
	adds r1, #0x60
	ldrb r0, [r1]
	adds r4, r0, #0
	mov sb, r1
	cmp r4, #0
	beq _08016DDC
	b _08017002
_08016DDC:
	bl sub_80181E0
	cmp r0, #0
	beq _08016E9E
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08016DFC
	ldr r0, _08016E5C @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	str r4, [r6, #0x4c]
_08016DFC:
	mov r1, r8
	ldrh r0, [r1, #0xa]
	cmp r0, #3
	beq _08016E06
	b _0801706A
_08016E06:
	ldr r3, _08016E5C @ =gUnknown_030059E0
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08016E60 @ =sub_8025318
	str r0, [r3]
	adds r0, r3, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _08016E3E
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _08016E3E
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08016E3E:
	ldr r0, _08016E64 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08016E68
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x52
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	ble _08016E7A
	b _08016FBC
	.align 2, 0
_08016E5C: .4byte gUnknown_030059E0
_08016E60: .4byte sub_8025318
_08016E64: .4byte gUnknown_03005424
_08016E68:
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x52
	movs r3, #0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	bge _08016E7A
	b _08016FBC
_08016E7A:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08016E8A
	b _08016FE6
_08016E8A:
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1f
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #4
	b _08016FF6
_08016E9E:
	ldr r0, [r5, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08016EB2
	mov r3, r8
	ldr r0, [r3, #0x30]
	cmp r0, r1
	beq _08016EB2
	b _0801706A
_08016EB2:
	ldr r7, _08016FA0 @ =gUnknown_030059E0
	adds r0, r7, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08016ED4
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08016ED4
	b _0801706A
_08016ED4:
	adds r0, r6, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r5, r6, #0
	adds r5, #0x52
	movs r0, #0
	ldrsh r2, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, r8
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08016F26
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08016F26
	ldr r0, [r7, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r7, #0x20]
_08016F26:
	str r2, [r6, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _08016F38
	movs r0, #0x1e
	mov r1, sb
	strb r0, [r1]
_08016F38:
	ldr r0, _08016FA4 @ =0x00010028
	ands r0, r2
	cmp r0, #0
	bne _08016F42
	b _0801706A
_08016F42:
	mov r2, r8
	ldrh r0, [r2, #0xa]
	cmp r0, #3
	beq _08016F4C
	b _0801706A
_08016F4C:
	ldr r3, _08016FA0 @ =gUnknown_030059E0
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #9
	strh r0, [r1]
	ldr r0, _08016FA8 @ =sub_8025318
	str r0, [r3]
	adds r0, r3, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r1, [r3, #0x20]
	movs r0, #8
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _08016F84
	ldr r0, [r2, #0x3c]
	cmp r0, r8
	bne _08016F84
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_08016F84:
	ldr r0, _08016FAC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08016FB0
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r3, #0
	ldrsh r1, [r5, r3]
	cmp r0, r1
	ble _08016FC4
	b _08016FBC
	.align 2, 0
_08016FA0: .4byte gUnknown_030059E0
_08016FA4: .4byte 0x00010028
_08016FA8: .4byte sub_8025318
_08016FAC: .4byte gUnknown_03005424
_08016FB0:
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r3, #0
	ldrsh r1, [r5, r3]
	cmp r0, r1
	bge _08016FC4
_08016FBC:
	movs r0, #0x1e
	mov r4, sb
	strb r0, [r4]
	b _0801706A
_08016FC4:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08016FE6
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x1f
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #4
	b _08016FF6
_08016FE6:
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	subs r1, #0x22
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0xf4
	lsls r0, r0, #8
_08016FF6:
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	movs r0, #0x1e
	mov r2, sb
	strb r0, [r2]
	b _0801706A
_08017002:
	subs r0, #1
	strb r0, [r1]
	ldr r5, _08017078 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801706A
	ldr r0, [r5, #0x3c]
	cmp r0, r8
	bne _0801706A
	adds r0, r6, #0
	adds r0, #0x50
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, #2
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	mov r0, r8
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017068
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08017068
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
_08017068:
	str r2, [r6, #0x4c]
_0801706A:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017078: .4byte gUnknown_030059E0

	thumb_func_start sub_801707C
sub_801707C: @ 0x0801707C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r2, _08017128 @ =gUnknown_030059E0
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _0801712C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	str r7, [sp, #0x10]
	ldr r1, [r2, #0x20]
	lsrs r3, r1, #5
	movs r0, #1
	ands r3, r0
	str r3, [sp, #0x18]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080170C6
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _080170C6
	bl sub_8017F34
	movs r4, #1
	str r4, [sp, #0x14]
_080170C6:
	ldr r0, _08017130 @ =gUnknown_030054CC
	ldrb r0, [r0]
	mov r8, r0
	cmp r0, #4
	bne _08017102
	ldr r0, _08017134 @ =gUnknown_030055B8
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x56
	ldrb r0, [r5]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017138 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	str r5, [sp, #0x24]
	cmp r1, r3
	beq _0801713C
_08017102:
	bl sub_8018300
	cmp r0, #0
	bne _0801710C
	b _0801765E
_0801710C:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017118
	b _0801765E
_08017118:
	ldr r2, _08017128 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _0801765E
	.align 2, 0
_08017128: .4byte gUnknown_030059E0
_0801712C: .4byte gCurTask
_08017130: .4byte gUnknown_030054CC
_08017134: .4byte gUnknown_030055B8
_08017138: .4byte 0x04000128
_0801713C:
	ldr r6, _080171A8 @ =gUnknown_030059E0
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801715C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0801715C
	b _0801765E
_0801715C:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x28]
	cmp r0, #0
	beq _08017174
	ldr r5, [r7, #0x5c]
	mov r2, r8
	ands r5, r2
	cmp r5, #0
	bne _08017174
	b _080175F8
_08017174:
	movs r4, #0
	strb r4, [r1]
	ldr r3, [sp, #0x10]
	ldrh r0, [r3, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080171CE
	bl sub_80181E0
	cmp r0, #0
	beq _080171AC
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0801719A
	b _0801765E
_0801719A:
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
	str r4, [r7, #0x4c]
	b _0801765E
	.align 2, 0
_080171A8: .4byte gUnknown_030059E0
_080171AC:
	ldr r4, [sp, #0x10]
	ldrh r0, [r4, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080171CE
	mov r5, sb
	ldr r0, [r5, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080171CE
	ldr r0, [r4, #0x30]
	cmp r0, r1
	beq _080171CE
	b _0801765E
_080171CE:
	ldr r0, _080172C8 @ =gUnknown_030059E0
	mov sl, r0
	ldr r0, [r0, #0x20]
	lsrs r0, r0, #1
	mov sb, r0
	movs r4, #1
	mov r1, sb
	ands r1, r4
	mov sb, r1
	movs r2, #0x50
	adds r2, r2, r7
	mov r8, r2
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r6, r7, #0
	adds r6, #0x52
	movs r5, #0
	ldrsh r2, [r6, r5]
	adds r0, r7, #0
	adds r0, #0x66
	movs r5, #0
	ldrsh r3, [r0, r5]
	adds r0, #2
	movs r5, #0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0x10]
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	mov r3, r8
	str r3, [sp, #0x1c]
	str r5, [sp, #0x20]
	cmp r0, #0
	beq _0801723A
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801723A
	mov r4, sl
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
_0801723A:
	str r2, [r7, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _0801724C
	movs r0, #0x1e
	ldr r5, [sp, #0x28]
	strb r0, [r5]
_0801724C:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017258
	b _0801738A
_08017258:
	mov r0, sb
	cmp r0, #0
	bne _08017266
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _08017266
	b _0801737E
_08017266:
	ldr r0, _080172CC @ =0x00010028
	ands r0, r2
	cmp r0, #0
	bne _08017270
	b _0801737E
_08017270:
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08017280
	b _0801737E
_08017280:
	ldr r0, _080172D0 @ =gUnknown_03005424
	ldrh r3, [r0]
	lsrs r2, r3, #7
	movs r1, #1
	ands r2, r1
	ldr r4, [sp, #0x20]
	ldrh r0, [r4]
	lsrs r0, r0, #3
	bics r1, r0
	cmp r2, r1
	beq _0801737E
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _080172D8
	ldr r2, _080172C8 @ =gUnknown_030059E0
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r5, #0
	ldrsh r1, [r6, r5]
	cmp r1, r0
	bge _080172AE
	adds r1, r0, #0
_080172AE:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	adds r2, #0x38
	ldrb r2, [r2]
	add r3, sp, #0xc
	str r3, [sp]
	ldr r3, _080172D4 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	b _08017302
	.align 2, 0
_080172C8: .4byte gUnknown_030059E0
_080172CC: .4byte 0x00010028
_080172D0: .4byte gUnknown_03005424
_080172D4: .4byte sub_801EE64
_080172D8:
	ldr r2, _08017364 @ =gUnknown_030059E0
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r4, #0
	ldrsh r1, [r6, r4]
	cmp r1, r0
	ble _080172E8
	adds r1, r0, #0
_080172E8:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	subs r0, r1, r0
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	add r5, sp, #0xc
	str r5, [sp]
	ldr r4, _08017368 @ =sub_801EE64
	str r4, [sp, #4]
_08017302:
	bl sub_801E4E4
	adds r1, r0, #0
	ldr r4, _08017364 @ =gUnknown_030059E0
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	subs r0, r1, r0
	cmp r0, #0
	ble _0801737E
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x5c]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	bl sub_8019224
	movs r1, #8
	strb r1, [r0]
	ldr r2, [sp, #0x24]
	ldrb r1, [r2]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	ldr r0, _0801736C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08017374
	ldr r0, [r7, #0x5c]
	ldr r1, _08017370 @ =0xFFFFFEFF
	ands r0, r1
	b _0801737C
	.align 2, 0
_08017364: .4byte gUnknown_030059E0
_08017368: .4byte sub_801EE64
_0801736C: .4byte gUnknown_03005424
_08017370: .4byte 0xFFFFFEFF
_08017374:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
_0801737C:
	str r0, [r7, #0x5c]
_0801737E:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0801738A
	b _0801765E
_0801738A:
	ldr r3, _080173CC @ =gUnknown_030059E0
	mov r8, r3
	mov r1, r8
	adds r1, #0x64
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080173D0 @ =sub_8025318
	mov r4, r8
	str r0, [r4]
	ldr r0, [r4, #0x20]
	movs r5, #2
	mov sb, r5
	orrs r0, r5
	str r0, [r4, #0x20]
	mov r0, r8
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, r8
	bl sub_8029E6C
	cmp r0, #0
	beq _080173D8
	movs r0, #0x1e
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _080173D4 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	b _0801749C
	.align 2, 0
_080173CC: .4byte gUnknown_030059E0
_080173D0: .4byte sub_8025318
_080173D4: .4byte 0xFFBFFFFF
_080173D8:
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #0xa]
	subs r0, #0xca
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08017426
	mov r3, r8
	ldr r0, [r3, #8]
	asrs r1, r0, #8
	ldr r2, _08017474 @ =gUnknown_03005960
	ldr r0, [r2, #0x30]
	cmp r1, r0
	ble _08017426
	ldr r0, [r2, #0x34]
	cmp r1, r0
	bge _08017426
	ldr r0, _08017478 @ =gUnknown_03005424
	ldrh r5, [r0]
	lsrs r0, r5, #7
	movs r4, #1
	adds r2, r4, #0
	bics r2, r0
	ldr r0, [sp, #0x20]
	ldrh r1, [r0]
	lsrs r1, r1, #3
	adds r0, r4, #0
	bics r0, r1
	cmp r2, r0
	bne _08017426
	ldr r3, [r7, #0x5c]
	lsrs r1, r3, #8
	adds r0, r4, #0
	bics r0, r1
	cmp r0, r2
	bne _08017426
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _08017488
_08017426:
	ldr r4, _0801747C @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	ldr r1, _08017480 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08017484 @ =sub_8025318
	str r0, [r4]
	ldr r0, _08017478 @ =gUnknown_03005424
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	ldr r5, [sp, #0x20]
	ldrh r1, [r5]
	lsrs r1, r1, #3
	adds r0, r3, #0
	bics r0, r1
	cmp r2, r0
	bne _0801746E
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _0801746E
	b _080175A4
_0801746E:
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
	b _080175A4
	.align 2, 0
_08017474: .4byte gUnknown_03005960
_08017478: .4byte gUnknown_03005424
_0801747C: .4byte gUnknown_030059E0
_08017480: .4byte 0xFFBFFFFF
_08017484: .4byte sub_8025318
_08017488:
	mov r0, r8
	ldr r1, [r0, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080174AC
	ldr r0, _080174A8 @ =0xFFBFFFFF
	ands r1, r0
	mov r2, r8
	str r1, [r2, #0x20]
_0801749C:
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	b _080175A4
	.align 2, 0
_080174A8: .4byte 0xFFBFFFFF
_080174AC:
	movs r0, #0x80
	ands r0, r5
	movs r1, #4
	orrs r3, r1
	str r3, [r7, #0x5c]
	ldr r3, [sp, #0x1c]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r5, r1, #8
	cmp r0, #0
	bne _0801751C
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r1, [sp, #0x10]
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	adds r0, #0x11
	lsls r6, r0, #8
	mov r2, r8
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	ldr r1, [r2, #8]
	asrs r1, r1, #8
	adds r2, #0x38
	ldrb r2, [r2]
	add r3, sp, #0xc
	str r3, [sp]
	ldr r3, _08017514 @ =sub_801EE64
	str r3, [sp, #4]
	movs r3, #8
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bge _0801757A
	lsls r0, r1, #8
	adds r6, r6, r0
	mov r4, r8
	ldr r0, [r4, #0x20]
	ldr r1, _08017518 @ =0xFFBFFFFF
	ands r0, r1
	mov r1, sb
	orrs r0, r1
	str r0, [r4, #0x20]
	b _08017570
	.align 2, 0
_08017514: .4byte sub_801EE64
_08017518: .4byte 0xFFBFFFFF
_0801751C:
	movs r2, #0
	ldrsh r0, [r6, r2]
	ldr r1, [sp, #0x10]
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	subs r0, #0x11
	lsls r6, r0, #8
	mov r3, r8
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	subs r0, r0, r1
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	mov r2, r8
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	add r4, sp, #0xc
	str r4, [sp]
	ldr r4, _080175D8 @ =sub_801EE64
	str r4, [sp, #4]
	bl sub_801E4E4
	adds r1, r0, #0
	cmp r1, #0
	bge _0801757A
	lsls r0, r1, #8
	subs r6, r6, r0
	mov r1, r8
	ldr r0, [r1, #0x20]
	ldr r1, _080175DC @ =0xFFBFFFFF
	ands r0, r1
	mov r2, sb
	orrs r0, r2
	mov r3, r8
	str r0, [r3, #0x20]
_08017570:
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
_0801757A:
	ldr r0, _080175E0 @ =gUnknown_030059E0
	str r5, [r0, #8]
	str r6, [r0, #0xc]
	ldr r1, [r7, #0x5c]
	movs r2, #4
	ands r1, r2
	adds r3, r0, #0
	cmp r1, #0
	beq _080175AE
	movs r2, #0
	strh r2, [r3, #0x10]
	ldr r0, _080175E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	strh r2, [r3, #0x12]
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
_080175A4:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080175C0
_080175AE:
	bl sub_8019224
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldr r4, [sp, #0x24]
	ldrb r1, [r4]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_080175C0:
	ldr r0, _080175E4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080175EC
	ldr r0, [r7, #0x5c]
	ldr r1, _080175E8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r7, #0x5c]
	b _0801765E
	.align 2, 0
_080175D8: .4byte sub_801EE64
_080175DC: .4byte 0xFFBFFFFF
_080175E0: .4byte gUnknown_030059E0
_080175E4: .4byte gUnknown_03005424
_080175E8: .4byte 0xFFFFFEFF
_080175EC:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x5c]
	b _0801765E
_080175F8:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0801765E
	ldr r0, [r6, #0x3c]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _0801765E
	adds r0, r7, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldr r0, [sp, #0x10]
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801765C
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801765C
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
_0801765C:
	str r2, [r7, #0x4c]
_0801765E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8017670
sub_8017670: @ 0x08017670
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r2, _08017718 @ =gUnknown_030059E0
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov sl, r0
	ldr r0, _0801771C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	mov sb, r7
	ldr r1, [r2, #0x20]
	lsrs r0, r1, #5
	str r0, [sp, #0x14]
	movs r0, #1
	ldr r3, [sp, #0x14]
	ands r3, r0
	str r3, [sp, #0x14]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080176B6
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _080176B6
	bl sub_8017F34
_080176B6:
	ldr r0, _08017720 @ =gUnknown_030054CC
	ldrb r0, [r0]
	mov r8, r0
	cmp r0, #4
	bne _080176F2
	ldr r0, _08017724 @ =gUnknown_030055B8
	ldrb r3, [r0]
	adds r5, r7, #0
	adds r5, #0x56
	ldrb r0, [r5]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017728 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	str r5, [sp, #0x20]
	cmp r1, r3
	beq _0801772C
_080176F2:
	bl sub_8018300
	cmp r0, #0
	bne _080176FC
	b _08017C18
_080176FC:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017708
	b _08017C18
_08017708:
	ldr r2, _08017718 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08017C18
	.align 2, 0
_08017718: .4byte gUnknown_030059E0
_0801771C: .4byte gCurTask
_08017720: .4byte gUnknown_030054CC
_08017724: .4byte gUnknown_030055B8
_08017728: .4byte 0x04000128
_0801772C:
	ldr r6, _0801779C @ =gUnknown_030059E0
	adds r0, r6, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801774C
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _0801774C
	b _08017C18
_0801774C:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x24]
	cmp r0, #0
	beq _08017764
	ldr r5, [r7, #0x5c]
	mov r4, r8
	ands r5, r4
	cmp r5, #0
	bne _08017764
	b _08017BB4
_08017764:
	movs r5, #0
	strb r5, [r1]
	ldr r0, _080177A0 @ =0xFFFFFEDC
	adds r4, r0, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080177C8
	bl sub_80181E0
	cmp r0, #0
	beq _080177A4
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0801778E
	b _08017C18
_0801778E:
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
	str r5, [r7, #0x4c]
	b _08017C18
	.align 2, 0
_0801779C: .4byte gUnknown_030059E0
_080177A0: .4byte 0xFFFFFEDC
_080177A4:
	mov r2, sb
	ldrh r2, [r2, #0xa]
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080177C8
	mov r3, sl
	ldr r0, [r3, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080177C8
	mov r4, sb
	ldr r0, [r4, #0x30]
	cmp r0, r1
	beq _080177C8
	b _08017C18
_080177C8:
	ldr r0, _080178D4 @ =gUnknown_030059E0
	mov sl, r0
	ldrb r4, [r0, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #0x10
	strb r0, [r1]
	mov r2, sl
	ldrb r3, [r2, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #0x11
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #0xc
	movs r2, #4
	bl memcpy
	movs r3, #0x50
	adds r3, r3, r7
	mov r8, r3
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r6, r7, #0
	adds r6, #0x52
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r7, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, sb
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	mov r3, r8
	str r3, [sp, #0x18]
	str r6, [sp, #0x1c]
	mov r8, r5
	cmp r0, #0
	beq _0801784E
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0801784E
	mov r4, sl
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
_0801784E:
	str r2, [r7, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r2
	cmp r0, #0
	beq _08017860
	movs r0, #0x1e
	ldr r1, [sp, #0x24]
	strb r0, [r1]
_08017860:
	ldr r2, [sp, #0x18]
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r4, [sp, #0x1c]
	movs r0, #0
	ldrsh r2, [r4, r0]
	ldr r5, _080178D4 @ =gUnknown_030059E0
	add r3, sp, #0xc
	str r3, [sp]
	mov r0, sb
	adds r3, r5, #0
	bl sub_800BFAC
	cmp r0, #0
	bne _08017880
	b _0801798E
_08017880:
	mov r4, r8
	ldrh r0, [r4]
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x17
	movs r4, #1
	ands r0, r4
	adds r1, r5, #0
	adds r1, #0x38
	ldrb r1, [r1]
	cmp r0, r1
	beq _08017898
	b _0801798E
_08017898:
	ldr r1, _080178D8 @ =0xFFFFFEDC
	adds r0, r1, #0
	mov r3, sb
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0801798E
	ldr r0, _080178DC @ =gUnknown_03005424
	ldrh r3, [r0]
	lsrs r1, r3, #7
	ands r1, r4
	lsrs r2, r2, #0x13
	adds r0, r4, #0
	bics r0, r2
	cmp r1, r0
	beq _0801798E
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _080178E0
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r4, [sp, #0x1c]
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080178EE
	b _0801798E
	.align 2, 0
_080178D4: .4byte gUnknown_030059E0
_080178D8: .4byte 0xFFFFFEDC
_080178DC: .4byte gUnknown_03005424
_080178E0:
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r3, [sp, #0x1c]
	movs r4, #0
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _0801798E
_080178EE:
	ldr r4, _08017938 @ =gUnknown_030059E0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r1, #0
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r2, #0
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	subs r0, #3
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r1, sb
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0801793C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _08017942
	.align 2, 0
_08017938: .4byte gUnknown_030059E0
_0801793C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_08017942:
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017986
	bl sub_8019224
	movs r1, #8
	strb r1, [r0]
	ldr r2, [sp, #0x20]
	ldrb r1, [r2]
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	ldr r0, _08017974 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0801797C
	ldr r0, [r7, #0x5c]
	ldr r1, _08017978 @ =0xFFFFFEFF
	ands r0, r1
	b _08017984
	.align 2, 0
_08017974: .4byte gUnknown_03005424
_08017978: .4byte 0xFFFFFEFF
_0801797C:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
_08017984:
	str r0, [r7, #0x5c]
_08017986:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x5c]
_0801798E:
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0801799A
	b _08017C18
_0801799A:
	ldr r6, _080179BC @ =gUnknown_030059E0
	adds r0, r6, #0
	bl sub_8029E6C
	cmp r0, #0
	beq _080179C4
	movs r0, #0x1e
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	ldr r0, [r6, #0x20]
	ldr r1, _080179C0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	b _08017B9A
	.align 2, 0
_080179BC: .4byte gUnknown_030059E0
_080179C0: .4byte 0xFFBFFFFF
_080179C4:
	ldr r4, _08017A5C @ =0xFFFFFEDC
	adds r0, r4, #0
	mov r1, sb
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r5, _08017A60 @ =gUnknown_03005424
	cmp r0, #2
	bhi _08017A14
	ldr r0, [r6, #8]
	asrs r1, r0, #8
	ldr r2, _08017A64 @ =gUnknown_03005960
	ldr r0, [r2, #0x30]
	cmp r1, r0
	ble _08017A14
	ldr r0, [r2, #0x34]
	cmp r1, r0
	bge _08017A14
	ldrh r4, [r5]
	lsrs r0, r4, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	mov r1, r8
	ldrh r0, [r1]
	lsrs r0, r0, #3
	adds r1, r3, #0
	bics r1, r0
	cmp r2, r1
	bne _08017A14
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08017A14
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _08017A70
_08017A14:
	ldr r2, _08017A68 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	ldr r1, _08017A6C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x5c]
	adds r2, #0x64
	movs r0, #0
	strh r0, [r2]
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r3, #1
	adds r2, r3, #0
	bics r2, r0
	mov r4, r8
	ldrh r1, [r4]
	lsrs r1, r1, #3
	adds r0, r3, #0
	bics r0, r1
	cmp r2, r0
	bne _08017A54
	ldr r1, [r7, #0x5c]
	lsrs r1, r1, #8
	adds r0, r3, #0
	bics r0, r1
	cmp r0, r2
	bne _08017A54
	b _08017C18
_08017A54:
	movs r0, #0x1e
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	b _08017C18
	.align 2, 0
_08017A5C: .4byte 0xFFFFFEDC
_08017A60: .4byte gUnknown_03005424
_08017A64: .4byte gUnknown_03005960
_08017A68: .4byte gUnknown_030059E0
_08017A6C: .4byte 0xFFBFFFFF
_08017A70:
	movs r2, #0x17
	ldrsb r2, [r6, r2]
	movs r0, #0x80
	ands r0, r4
	ldr r3, [sp, #0x18]
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r1, r1, #8
	mov r8, r1
	cmp r0, #0
	bne _08017ACC
	ldr r1, [sp, #0x1c]
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r1, sb
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	add r1, sp, #0xc
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r5, r0, #8
	subs r0, r0, r2
	mov r4, r8
	asrs r1, r4, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08017AC8 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08017B1C
	lsls r0, r0, #8
	subs r5, r5, r0
	b _08017B08
	.align 2, 0
_08017AC8: .4byte sub_801EC3C
_08017ACC:
	ldr r1, [sp, #0x1c]
	movs r3, #0
	ldrsh r0, [r1, r3]
	mov r1, sb
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	add r1, sp, #0xc
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r5, r0, #8
	adds r0, r0, r2
	mov r4, r8
	asrs r1, r4, #8
	adds r2, r6, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _08017B5C @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08017B1C
	lsls r0, r0, #8
	adds r5, r5, r0
_08017B08:
	ldr r0, [r6, #0x20]
	ldr r1, _08017B60 @ =0xFFBFFFFF
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x5c]
	subs r1, #7
	ands r0, r1
	str r0, [r7, #0x5c]
_08017B1C:
	ldr r3, _08017B64 @ =gUnknown_030059E0
	mov r0, r8
	str r0, [r3, #8]
	str r5, [r3, #0xc]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08017B78
	ldr r2, [r3, #0x20]
	movs r0, #8
	orrs r2, r0
	subs r0, #0xd
	ands r2, r0
	adds r0, #2
	ands r2, r0
	str r2, [r3, #0x20]
	mov r1, sb
	str r1, [r3, #0x3c]
	movs r0, #0
	strh r0, [r3, #0x12]
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08017B68
	movs r0, #2
	rsbs r0, r0, #0
	ands r2, r0
	b _08017B6C
	.align 2, 0
_08017B5C: .4byte sub_801EC3C
_08017B60: .4byte 0xFFBFFFFF
_08017B64: .4byte gUnknown_030059E0
_08017B68:
	movs r0, #1
	orrs r2, r0
_08017B6C:
	str r2, [r3, #0x20]
	ldr r0, [r7, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08017B8A
_08017B78:
	bl sub_8019224
	movs r2, #0
	movs r1, #8
	strb r1, [r0]
	ldr r3, [sp, #0x20]
	ldrb r1, [r3]
	strb r1, [r0, #1]
	strb r2, [r0, #2]
_08017B8A:
	ldr r0, _08017BA0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08017BA8
	ldr r0, [r7, #0x5c]
	ldr r1, _08017BA4 @ =0xFFFFFEFF
_08017B9A:
	ands r0, r1
	str r0, [r7, #0x5c]
	b _08017C18
	.align 2, 0
_08017BA0: .4byte gUnknown_03005424
_08017BA4: .4byte 0xFFFFFEFF
_08017BA8:
	ldr r0, [r7, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r7, #0x5c]
	b _08017C18
_08017BB4:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017C18
	ldr r0, [r6, #0x3c]
	cmp r0, sb
	bne _08017C18
	adds r0, r7, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r5, [sp, #8]
	mov r0, sb
	bl sub_800D0A0
	adds r2, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017C16
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08017C16
	ldr r0, [r6, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r6, #0x20]
_08017C16:
	str r2, [r7, #0x4c]
_08017C18:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8017C28
sub_8017C28: @ 0x08017C28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08017CB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	str r7, [sp, #0xc]
	ldr r2, _08017CBC @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017C58
	ldr r0, [r2, #0x3c]
	cmp r0, r7
	bne _08017C58
	bl sub_8017F34
_08017C58:
	ldr r0, _08017CC0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08017C90
	ldr r0, _08017CC4 @ =gUnknown_030055B8
	ldrb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _08017CC8 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08017CCC
_08017C90:
	bl sub_8018300
	cmp r0, #0
	bne _08017C9A
	b _08017F1E
_08017C9A:
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08017CA6
	b _08017F1E
_08017CA6:
	ldr r2, _08017CBC @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r7, #0x4c]
	b _08017F1E
	.align 2, 0
_08017CB8: .4byte gCurTask
_08017CBC: .4byte gUnknown_030059E0
_08017CC0: .4byte gUnknown_030054CC
_08017CC4: .4byte gUnknown_030055B8
_08017CC8: .4byte 0x04000128
_08017CCC:
	adds r1, r7, #0
	adds r1, #0x60
	ldrb r0, [r1]
	str r1, [sp, #0x14]
	cmp r0, #0
	beq _08017CDA
	b _08017EB4
_08017CDA:
	ldr r0, [sp, #0xc]
	ldr r1, [r0, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08017D3C
	ldr r5, _08017D38 @ =gUnknown_030059E0
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08017D08
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08017D08
	b _08017F1E
_08017D08:
	adds r0, r7, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _08017EFA
	.align 2, 0
_08017D38: .4byte gUnknown_030059E0
_08017D3C:
	ldr r0, _08017DD4 @ =gUnknown_030059E0
	str r0, [sp, #0x10]
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08017D5E
	ldr r0, [sp, #0x10]
	adds r0, #0x85
	ldrb r0, [r0]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08017D5E
	b _08017F1E
_08017D5E:
	movs r1, #0x50
	adds r1, r1, r7
	mov sl, r1
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0x52
	adds r3, r3, r7
	mov sb, r3
	movs r4, #0
	ldrsh r2, [r3, r4]
	movs r5, #0x66
	adds r5, r5, r7
	mov r8, r5
	movs r6, #0
	ldrsh r3, [r5, r6]
	adds r6, r7, #0
	adds r6, #0x68
	movs r4, #0
	ldrsh r0, [r6, r4]
	str r0, [sp]
	adds r5, r7, #0
	adds r5, #0x54
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	bl sub_800DA4C
	adds r3, r0, #0
	movs r1, #2
	ands r0, r1
	mov r2, sl
	mov sl, r6
	mov ip, r5
	cmp r0, #0
	beq _08017DF4
	ldr r5, [sp, #0x10]
	ldr r0, [r5, #0x20]
	ands r0, r1
	cmp r0, #0
	bne _08017DF4
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017DF4
	ldr r6, [sp, #0xc]
	ldrh r1, [r6, #0xa]
	movs r0, #0xbd
	lsls r0, r0, #1
	cmp r1, r0
	bne _08017DDC
	ldr r0, _08017DD8 @ =0xFFFFF880
	bl sub_80188A4
	b _08017E56
	.align 2, 0
_08017DD4: .4byte gUnknown_030059E0
_08017DD8: .4byte 0xFFFFF880
_08017DDC:
	ldr r0, _08017DEC @ =0x0000017F
	cmp r1, r0
	bne _08017DF4
	ldr r0, _08017DF0 @ =0xFFFFF580
	bl sub_80188A4
	b _08017E56
	.align 2, 0
_08017DEC: .4byte 0x0000017F
_08017DF0: .4byte 0xFFFFF580
_08017DF4:
	movs r4, #1
	adds r0, r3, #0
	ands r0, r4
	cmp r0, #0
	beq _08017E64
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	cmp r0, #0
	beq _08017E1C
	ldr r1, _08017E18 @ =gUnknown_030059E0
	ldrh r2, [r1, #0x10]
	movs r4, #0x10
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _08017E3C
	b _08017E32
	.align 2, 0
_08017E18: .4byte gUnknown_030059E0
_08017E1C:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r3
	cmp r0, #0
	beq _08017E3C
	ldr r1, _08017E60 @ =gUnknown_030059E0
	ldrh r2, [r1, #0x10]
	movs r5, #0x10
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge _08017E3C
_08017E32:
	rsbs r0, r2, #0
	strh r0, [r1, #0x10]
	ldrh r0, [r1, #0x14]
	rsbs r0, r0, #0
	strh r0, [r1, #0x14]
_08017E3C:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	beq _08017E56
	ldr r1, _08017E60 @ =gUnknown_030059E0
	ldrh r2, [r1, #0x12]
	movs r6, #0x12
	ldrsh r0, [r1, r6]
	cmp r0, #0
	ble _08017E56
	rsbs r0, r2, #0
	strh r0, [r1, #0x12]
_08017E56:
	movs r0, #0x1e
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	b _08017F1E
	.align 2, 0
_08017E60: .4byte gUnknown_030059E0
_08017E64:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r5, sb
	movs r6, #0
	ldrsh r2, [r5, r6]
	mov r0, r8
	movs r5, #0
	ldrsh r3, [r0, r5]
	mov r6, sl
	movs r5, #0
	ldrsh r0, [r6, r5]
	str r0, [sp]
	mov r6, ip
	ldrh r0, [r6]
	lsrs r0, r0, #7
	ands r0, r4
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	bl sub_800D0A0
	adds r3, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017F1C
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08017F1C
	ldr r0, _08017EB0 @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	b _08017F1C
	.align 2, 0
_08017EB0: .4byte gUnknown_030059E0
_08017EB4:
	subs r0, #1
	strb r0, [r1]
	ldr r5, _08017F30 @ =gUnknown_030059E0
	ldr r0, [r5, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017F1E
	ldr r0, [r5, #0x3c]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _08017F1E
	adds r0, r7, #0
	adds r0, #0x50
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r0, #0x14
	movs r4, #0
	ldrsh r3, [r0, r4]
	adds r0, #2
	movs r6, #0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
_08017EFA:
	ldr r0, [sp, #0xc]
	bl sub_800D0A0
	adds r3, r0, #0
	ldr r0, [r7, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017F1C
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _08017F1C
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
_08017F1C:
	str r3, [r7, #0x4c]
_08017F1E:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017F30: .4byte gUnknown_030059E0

	thumb_func_start sub_8017F34
sub_8017F34: @ 0x08017F34
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08017F78 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	ldr r0, [r6, #0x44]
	cmp r0, #0
	bge _08017F4C
	rsbs r0, r0, #0
_08017F4C:
	cmp r0, #0x80
	bgt _08017F5C
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bge _08017F58
	rsbs r0, r0, #0
_08017F58:
	cmp r0, #0x80
	ble _08017F80
_08017F5C:
	ldr r2, _08017F7C @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	b _08018110
	.align 2, 0
_08017F78: .4byte gCurTask
_08017F7C: .4byte gUnknown_030059E0
_08017F80:
	ldr r1, _08017FCC @ =gUnknown_030055A0
	ldr r0, _08017FD0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08017FD4 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r4, #0x80
	adds r1, r4, #0
	ands r1, r0
	ldr r2, _08017FD4 @ =IWRAM_START + 0x54
	adds r0, r3, r2
	ldrh r2, [r0]
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _08017FE4
	ldr r2, _08017FD8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x3c]
	ldr r1, _08017FDC @ =IWRAM_START + 0x56
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r2, _08017FE0 @ =IWRAM_START + 0x64
	adds r0, r3, r2
	strb r1, [r0]
	b _08018110
	.align 2, 0
_08017FCC: .4byte gUnknown_030055A0
_08017FD0: .4byte 0x04000128
_08017FD4: .4byte IWRAM_START + 0x54
_08017FD8: .4byte gUnknown_030059E0
_08017FDC: .4byte IWRAM_START + 0x56
_08017FE0: .4byte IWRAM_START + 0x64
_08017FE4:
	ldr r2, _08018008 @ =gUnknown_030059E0
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	ldr r0, _0801800C @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _08018010
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	b _08018016
	.align 2, 0
_08018008: .4byte gUnknown_030059E0
_0801800C: .4byte gUnknown_03005424
_08018010:
	ldr r1, [r5, #0xc]
	ldr r2, _08018050 @ =0xFFFFFE00
	adds r1, r1, r2
_08018016:
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r5, #0xc]
	ldr r0, [r6, #0x48]
	cmp r0, #0
	bge _08018058
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _08018054 @ =sub_801EC3C
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _0801809C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	b _08018084
	.align 2, 0
_08018050: .4byte 0xFFFFFE00
_08018054: .4byte sub_801EC3C
_08018058:
	cmp r0, #0
	ble _0801809C
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _080180D4 @ =sub_801EC3C
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _0801809C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
_08018084:
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_0801809C:
	ldr r1, [r6, #0x44]
	cmp r1, #0
	bge _080180E0
	ldr r5, _080180D8 @ =gUnknown_030059E0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r5, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #8
	rsbs r3, r3, #0
	ldr r4, _080180DC @ =sub_801EB44
	str r4, [sp]
	bl sub_801F100
	cmp r0, #0
	bge _08018110
	lsls r1, r0, #8
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	b _08018110
	.align 2, 0
_080180D4: .4byte sub_801EC3C
_080180D8: .4byte gUnknown_030059E0
_080180DC: .4byte sub_801EB44
_080180E0:
	cmp r1, #0
	ble _08018110
	ldr r4, _08018118 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	ldr r3, _0801811C @ =sub_801EB44
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08018110
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
_08018110:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018118: .4byte gUnknown_030059E0
_0801811C: .4byte sub_801EB44

	thumb_func_start sub_8018120
sub_8018120: @ 0x08018120
	push {r4, r5, r6, r7, lr}
	ldr r0, _080181C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r3, _080181C8 @ =gUnknown_030059E0
	ldr r4, [r3, #0x20]
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0801819C
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _0801819C
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r1, [r3, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3, #0xc]
	ldr r1, _080181CC @ =gUnknown_030055A0
	ldr r0, _080181D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _080181D4 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	adds r2, r0, #0
	ands r2, r1
	ldr r7, _080181D4 @ =IWRAM_START + 0x54
	adds r1, r5, r7
	ldrh r1, [r1]
	ands r0, r1
	cmp r2, r0
	beq _0801819C
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	str r4, [r3, #0x20]
	adds r0, #8
	str r0, [r3, #0x3c]
	ldr r1, _080181D8 @ =IWRAM_START + 0x56
	adds r0, r5, r1
	ldrb r1, [r0]
	ldr r2, _080181DC @ =IWRAM_START + 0x64
	adds r0, r5, r2
	strb r1, [r0]
_0801819C:
	bl sub_8018300
	cmp r0, #0
	beq _080181BC
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080181BC
	ldr r2, _080181C8 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r6, #0x4c]
_080181BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080181C4: .4byte gCurTask
_080181C8: .4byte gUnknown_030059E0
_080181CC: .4byte gUnknown_030055A0
_080181D0: .4byte 0x04000128
_080181D4: .4byte IWRAM_START + 0x54
_080181D8: .4byte IWRAM_START + 0x56
_080181DC: .4byte IWRAM_START + 0x64

	thumb_func_start sub_80181E0
sub_80181E0: @ 0x080181E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r5, _08018270 @ =gUnknown_030059E0
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, _08018274 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	mov r8, r6
	ldr r0, [r1, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080182D0
	ldr r0, [r6, #0x30]
	cmp r0, r1
	beq _080182D0
	ldr r1, _08018278 @ =IWRAM_START + 0x50
	adds r0, r4, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, _0801827C @ =IWRAM_START + 0x52
	adds r0, r4, r3
	movs r7, #0
	ldrsh r2, [r0, r7]
	adds r3, #0x14
	adds r0, r4, r3
	movs r7, #0
	ldrsh r3, [r0, r7]
	ldr r7, _08018280 @ =IWRAM_START + 0x68
	adds r0, r4, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	str r0, [sp]
	ldr r7, _08018284 @ =IWRAM_START + 0x54
	adds r0, r4, r7
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r4, #1
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_800DA4C
	adds r2, r0, #0
	ands r0, r4
	cmp r0, #0
	beq _080182D0
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080182A6
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08018288
	ldrh r1, [r5, #0x10]
	movs r3, #0x10
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _080182A6
	b _0801829C
	.align 2, 0
_08018270: .4byte gUnknown_030059E0
_08018274: .4byte gCurTask
_08018278: .4byte IWRAM_START + 0x50
_0801827C: .4byte IWRAM_START + 0x52
_08018280: .4byte IWRAM_START + 0x68
_08018284: .4byte IWRAM_START + 0x54
_08018288:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _080182A6
	ldrh r1, [r5, #0x10]
	movs r7, #0x10
	ldrsh r0, [r5, r7]
	cmp r0, #0
	bge _080182A6
_0801829C:
	rsbs r0, r1, #0
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #0x14]
	rsbs r0, r0, #0
	strh r0, [r5, #0x14]
_080182A6:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _080182C0
	ldr r1, _080182CC @ =gUnknown_030059E0
	ldrh r2, [r1, #0x12]
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _080182C0
	rsbs r0, r2, #0
	strh r0, [r1, #0x12]
_080182C0:
	mov r1, r8
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _080182F0
	.align 2, 0
_080182CC: .4byte gUnknown_030059E0
_080182D0:
	ldr r2, _080182FC @ =gUnknown_030059E0
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080182EE
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _080182EE
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_080182EE:
	movs r0, #0
_080182F0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080182FC: .4byte gUnknown_030059E0

	thumb_func_start sub_8018300
sub_8018300: @ 0x08018300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r2, _080183A4 @ =gUnknown_030059E0
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, _080183A8 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	str r6, [sp, #0xc]
	adds r0, #0x60
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08018332
	b _08018634
_08018332:
	ldr r1, _080183AC @ =IWRAM_START + 0x50
	adds r5, r4, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _080183B0 @ =IWRAM_START + 0x52
	adds r7, r4, r3
	movs r2, #0
	ldrsh r0, [r7, r2]
	mov ip, r0
	adds r3, #0x14
	adds r3, r3, r4
	mov r8, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp, #0x20]
	ldr r3, _080183B4 @ =IWRAM_START + 0x68
	adds r3, r3, r4
	mov sb, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp]
	ldr r3, _080183B8 @ =IWRAM_START + 0x54
	adds r4, r4, r3
	ldrh r0, [r4]
	lsrs r0, r0, #7
	movs r2, #1
	mov sl, r2
	ands r0, r2
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800DA4C
	adds r2, r0, #0
	ldr r0, _080183BC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _08018400
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08018400
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080183C8
	ldr r5, _080183C0 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080183C4 @ =0xFFFFFCA0
	b _080183D6
	.align 2, 0
_080183A4: .4byte gUnknown_030059E0
_080183A8: .4byte gCurTask
_080183AC: .4byte IWRAM_START + 0x50
_080183B0: .4byte IWRAM_START + 0x52
_080183B4: .4byte IWRAM_START + 0x68
_080183B8: .4byte IWRAM_START + 0x54
_080183BC: .4byte gUnknown_030054CC
_080183C0: .4byte 0xFFFFFA60
_080183C4: .4byte 0xFFFFFCA0
_080183C8:
	movs r5, #0xb4
	lsls r5, r5, #3
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xd8
	lsls r0, r0, #2
_080183D6:
	adds r2, r0, #0
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldrh r0, [r4]
	lsrs r0, r0, #7
	mov r4, sl
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_800DA4C
	adds r2, r0, #0
_08018400:
	adds r0, r2, #0
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _08018492
	ldr r0, _08018440 @ =gUnknown_030059E0
	adds r1, r0, #0
	adds r1, #0x61
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r8, r0
	cmp r1, #0
	bne _08018464
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08018444
	mov r7, r8
	ldrh r1, [r7, #0x10]
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _08018464
	rsbs r0, r1, #0
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #0x14]
	rsbs r0, r0, #0
	strh r0, [r7, #0x14]
	b _08018464
	.align 2, 0
_08018440: .4byte gUnknown_030059E0
_08018444:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _08018464
	mov r4, r8
	ldrh r1, [r4, #0x10]
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _08018464
	rsbs r0, r1, #0
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x14]
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_08018464:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _0801847E
	mov r7, r8
	ldrh r1, [r7, #0x12]
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _0801847E
	rsbs r0, r1, #0
	strh r0, [r7, #0x12]
_0801847E:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0801849E
	movs r0, #1
	b _0801874C
_08018492:
	movs r4, #2
	ands r4, r2
	ldr r5, _080184C4 @ =gUnknown_030059E0
	mov r8, r5
	cmp r4, #0
	beq _08018512
_0801849E:
	movs r3, #1
	ands r2, r3
	cmp r2, #0
	beq _080184D8
	adds r0, r6, #0
	adds r0, #0x50
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r2, r8
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080184C8
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _080184D0
	.align 2, 0
_080184C4: .4byte gUnknown_030059E0
_080184C8:
	mov r4, r8
	ldr r0, [r4, #0x20]
	orrs r0, r3
	str r0, [r4, #0x20]
_080184D0:
	mov r0, r8
	bl sub_800DE44
	b _08018506
_080184D8:
	adds r0, r6, #0
	adds r0, #0x50
	movs r5, #0
	ldrsh r1, [r0, r5]
	mov r7, r8
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080184F2
	ldr r0, [r7, #0x20]
	orrs r0, r3
	str r0, [r7, #0x20]
	b _08018500
_080184F2:
	mov r1, r8
	ldr r0, [r1, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	mov r2, r8
	str r0, [r2, #0x20]
_08018500:
	mov r0, r8
	bl sub_800DD54
_08018506:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _0801874C
_08018512:
	ldr r3, [sp, #0x10]
	ldr r1, [r3, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080185F4
	ldr r5, [sp, #0xc]
	ldr r0, [r5, #0x30]
	cmp r0, r1
	bne _080185F4
	mov r7, r8
	ldr r7, [r7, #0x20]
	str r7, [sp, #0x14]
	mov r0, r8
	ldr r0, [r0, #0x3c]
	str r0, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x50
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r7, r6, #0
	adds r7, #0x52
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	movs r2, #0x66
	adds r2, r2, r6
	mov sb, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x20]
	movs r2, #0x68
	adds r2, r2, r6
	mov sl, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	adds r0, r6, #0
	adds r0, #0x54
	str r0, [sp, #0x1c]
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800D0A0
	adds r4, r0, #0
	ldr r0, _080185B0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _08018584
	b _08018718
_08018584:
	cmp r4, #0
	beq _0801858A
	b _08018718
_0801858A:
	ldr r3, [sp, #0x14]
	mov r0, r8
	str r3, [r0, #0x20]
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x3c]
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080185BC
	ldr r5, _080185B4 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080185B8 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _080185CC
	.align 2, 0
_080185B0: .4byte gUnknown_030054CC
_080185B4: .4byte 0xFFFFFA60
_080185B8: .4byte 0xFFFFFCA0
_080185BC:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_080185CC:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, sb
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sl
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldr r5, [sp, #0x1c]
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	b _08018712
_080185F4:
	ldr r1, _08018630 @ =gUnknown_030059E0
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	mov r8, r1
	cmp r0, #0
	beq _08018618
	ldr r0, [r1, #0x3c]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _08018618
	movs r0, #9
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	mov r3, r8
	str r2, [r3, #0x20]
_08018618:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08018624
	b _0801874A
_08018624:
	mov r4, r8
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
	b _0801874A
	.align 2, 0
_08018630: .4byte gUnknown_030059E0
_08018634:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08018644
	b _0801874A
_08018644:
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	beq _0801864C
	b _0801874A
_0801864C:
	ldr r7, _080186C0 @ =IWRAM_START + 0x50
	adds r5, r4, r7
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, _080186C4 @ =IWRAM_START + 0x52
	adds r7, r4, r2
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	adds r2, #0x14
	adds r2, r2, r4
	mov r8, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x20]
	ldr r2, _080186C8 @ =IWRAM_START + 0x68
	adds r2, r2, r4
	mov sb, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	ldr r0, _080186CC @ =IWRAM_START + 0x54
	adds r0, r0, r4
	mov sl, r0
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x20]
	bl sub_800D0A0
	adds r4, r0, #0
	ldr r0, _080186D0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	bne _08018718
	cmp r4, #0
	bne _08018718
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _080186DC
	ldr r5, _080186D4 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _080186D8 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _080186EC
	.align 2, 0
_080186C0: .4byte IWRAM_START + 0x50
_080186C4: .4byte IWRAM_START + 0x52
_080186C8: .4byte IWRAM_START + 0x68
_080186CC: .4byte IWRAM_START + 0x54
_080186D0: .4byte gUnknown_030054CC
_080186D4: .4byte 0xFFFFFA60
_080186D8: .4byte 0xFFFFFCA0
_080186DC:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_080186EC:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	mov r5, sl
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
_08018712:
	bl sub_800D0A0
	adds r4, r0, #0
_08018718:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08018736
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08018736
	ldr r0, _0801875C @ =gUnknown_030059E0
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_08018736:
	str r4, [r6, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r4
	cmp r0, #0
	beq _0801874A
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_0801874A:
	movs r0, #0
_0801874C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801875C: .4byte gUnknown_030059E0

	thumb_func_start sub_8018760
sub_8018760: @ 0x08018760
	push {r4, r5, r6, lr}
	ldr r6, _080187D0 @ =gUnknown_030059E0
	adds r0, r6, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080187E4
	ldr r5, _080187D4 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r6, #0x20]
	ldr r1, _080187D8 @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _080187DC @ =0xFF7FFFFF
	ands r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080187E0 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	movs r0, #0x99
	bl m4aSongNumStart
	ldrh r0, [r4]
	strh r0, [r6, #0x12]
	ldr r0, [r5]
	bl TaskDestroy
	b _08018804
	.align 2, 0
_080187D0: .4byte gUnknown_030059E0
_080187D4: .4byte gCurTask
_080187D8: .4byte 0xFFDFFFFF
_080187DC: .4byte 0xFF7FFFFF
_080187E0: .4byte 0xFFFFFEFF
_080187E4:
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x6d
	beq _08018804
	ldr r0, [r6, #0x20]
	ldr r1, _0801880C @ =0xFFDFFFFF
	ands r0, r1
	ldr r1, _08018810 @ =0xFF7FFFFF
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r0, _08018814 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08018804:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801880C: .4byte 0xFFDFFFFF
_08018810: .4byte 0xFF7FFFFF
_08018814: .4byte gCurTask

	thumb_func_start sub_8018818
sub_8018818: @ 0x08018818
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801886C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _08018864
	ldr r1, _08018870 @ =gUnknown_030055A0
	ldr r0, [r1]
	ldr r7, _08018874 @ =gUnknown_030059E0
	cmp r0, #0
	beq _08018854
	movs r6, #0xc0
	lsls r6, r6, #0x12
	movs r5, #3
	rsbs r5, r5, #0
	adds r3, r1, #0
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0xc
_0801883C:
	ldm r2!, {r0}
	ldrh r1, [r0, #6]
	adds r1, r1, r6
	ldr r0, [r1, #0x5c]
	ands r0, r5
	str r0, [r1, #0x5c]
	adds r3, #4
	cmp r2, r4
	bhi _08018854
	ldr r0, [r3]
	cmp r0, #0
	bne _0801883C
_08018854:
	movs r0, #0x78
	strh r0, [r7, #0x2c]
	adds r2, r7, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08018864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801886C: .4byte gUnknown_030054CC
_08018870: .4byte gUnknown_030055A0
_08018874: .4byte gUnknown_030059E0

	thumb_func_start sub_8018878
sub_8018878: @ 0x08018878
	push {lr}
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r0, r2
	ldr r1, _0801889C @ =gUnknown_030055A0
	ldr r3, _080188A0 @ =IWRAM_START + 0x56
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0
	.align 2, 0
_0801889C: .4byte gUnknown_030055A0
_080188A0: .4byte IWRAM_START + 0x56

	thumb_func_start sub_80188A4
sub_80188A4: @ 0x080188A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080188F4 @ =sub_8018760
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r1, #2
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	ldr r3, _080188F8 @ =gUnknown_030059E0
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	adds r0, r3, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r2, r3, #0
	adds r2, #0x64
	movs r0, #0x6d
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r3, #0x20]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080188F4: .4byte sub_8018760
_080188F8: .4byte gUnknown_030059E0

	thumb_func_start sub_80188FC
sub_80188FC: @ 0x080188FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080189B0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov sl, r0
	ldr r0, _080189B4 @ =gMultiSioSend
	mov r8, r0
	ldrh r5, [r0, #8]
	movs r3, #0x80
	lsls r3, r3, #5
	mov r1, sl
	lsls r3, r1
	ands r5, r3
	movs r4, #0
	ldr r2, _080189B8 @ =gUnknown_030055B8
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0801898A
	ldr r0, _080189BC @ =gMultiSioStatusFlags
	movs r6, #1
	ldr r0, [r0]
	mov ip, r0
	movs r2, #0xa0
	lsls r2, r2, #7
	mov sb, r2
	adds r7, r3, #0
_08018940:
	adds r0, r6, #0
	lsls r0, r4
	mov r1, ip
	ands r0, r1
	cmp r0, #0
	beq _08018A06
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080189C0 @ =gMultiSioRecv
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, sb
	bne _08018974
	movs r2, #0
	cmp r5, #0
	bne _08018964
	movs r2, #1
_08018964:
	movs r3, #0
	ldrh r0, [r1, #8]
	ands r0, r7
	cmp r0, #0
	bne _08018970
	movs r3, #1
_08018970:
	cmp r2, r3
	bne _08018A06
_08018974:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _0801898A
	ldr r2, _080189B8 @ =gUnknown_030055B8
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	bne _08018940
_0801898A:
	ldr r0, _080189C4 @ =gUnknown_03005438
	ldr r3, _080189C8 @ =gUnknown_03005420
	ldrb r4, [r3]
	ldrb r0, [r0]
	cmp r0, r4
	bne _080189D8
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080189CC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080189D0 @ =gUnknown_0300286E
	str r0, [r1, #4]
	ldr r0, _080189D4 @ =0x81000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08018A06
	.align 2, 0
_080189B0: .4byte 0x04000128
_080189B4: .4byte gMultiSioSend
_080189B8: .4byte gUnknown_030055B8
_080189BC: .4byte gMultiSioStatusFlags
_080189C0: .4byte gMultiSioRecv
_080189C4: .4byte gUnknown_03005438
_080189C8: .4byte gUnknown_03005420
_080189CC: .4byte 0x040000D4
_080189D0: .4byte gUnknown_0300286E
_080189D4: .4byte 0x81000003
_080189D8:
	ldr r2, _08018A18 @ =0x040000D4
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r1, _08018A1C @ =gUnknown_03005510
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08018A20 @ =gUnknown_0300286E
	str r0, [r2, #4]
	ldr r0, _08018A24 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	mov r1, sl
	lsls r0, r1
	mov r2, r8
	ldrh r1, [r2, #8]
	eors r0, r1
	strh r0, [r2, #8]
_08018A06:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018A18: .4byte 0x040000D4
_08018A1C: .4byte gUnknown_03005510
_08018A20: .4byte gUnknown_0300286E
_08018A24: .4byte 0x80000003

	thumb_func_start sub_8018A28
sub_8018A28: @ 0x08018A28
	push {r4, r5, r6, r7, lr}
	ldr r0, _08018A40 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r6, r0, #0x1e
	ldr r7, _08018A44 @ =gMultiSioSend
	movs r5, #0
	cmp r5, r6
	beq _08018AA6
	ldr r0, _08018A48 @ =gUnknown_030055B8
	ldrb r0, [r0]
	b _08018ABA
	.align 2, 0
_08018A40: .4byte 0x04000128
_08018A44: .4byte gMultiSioSend
_08018A48: .4byte gUnknown_030055B8
_08018A4C:
	ldr r0, _08018AC8 @ =gMultiSioStatusFlags
	movs r1, #1
	lsls r1, r5
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08018AA6
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08018ACC @ =gMultiSioRecv
	adds r3, r0, r1
	ldrh r1, [r3]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bne _08018AA6
	ldrh r1, [r3, #8]
	movs r4, #0x80
	lsls r4, r4, #5
	lsls r4, r5
	ands r1, r4
	ldrh r0, [r7, #8]
	ands r0, r4
	cmp r1, r0
	beq _08018AA6
	ldrb r0, [r3, #0xe]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _08018AA0
	ldr r0, _08018AD0 @ =gUnknown_080D5744
	ldrb r1, [r3, #0xe]
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r5, #0
	bl _call_via_r2
_08018AA0:
	ldrh r0, [r7, #8]
	eors r4, r0
	strh r4, [r7, #8]
_08018AA6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _08018AC2
	cmp r5, r6
	beq _08018AA6
	ldr r0, _08018AD4 @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r5
_08018ABA:
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08018A4C
_08018AC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018AC8: .4byte gMultiSioStatusFlags
_08018ACC: .4byte gMultiSioRecv
_08018AD0: .4byte gUnknown_080D5744
_08018AD4: .4byte gUnknown_030055B8

	thumb_func_start sub_8018AD8
sub_8018AD8: @ 0x08018AD8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r2, _08018B48 @ =gUnknown_030055A0
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r3, _08018B4C @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08018B0E
	b _08018DEA
_08018B0E:
	ldr r2, _08018B50 @ =gUnknown_030059E0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08018B1E
	b _08018DEA
_08018B1E:
	ldr r1, _08018B54 @ =gUnknown_030054B4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08018B36
	b _08018DEA
_08018B36:
	ldrb r0, [r7, #0xf]
	cmp r0, #4
	bls _08018B3E
	b _08018DEA
_08018B3E:
	lsls r0, r0, #2
	ldr r1, _08018B58 @ =_08018B5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018B48: .4byte gUnknown_030055A0
_08018B4C: .4byte 0x04000128
_08018B50: .4byte gUnknown_030059E0
_08018B54: .4byte gUnknown_030054B4
_08018B58: .4byte _08018B5C
_08018B5C: @ jump table
	.4byte _08018B70 @ case 0
	.4byte _08018BD8 @ case 1
	.4byte _08018CD4 @ case 2
	.4byte _08018D5C @ case 3
	.4byte _08018DAC @ case 4
_08018B70:
	ldr r0, _08018BCC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018BA4
	ldr r0, _08018BD0 @ =gUnknown_030055B8
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018BD4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	bne _08018BA4
	b _08018DEA
_08018BA4:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A9A4
	movs r0, #0xd9
	bl m4aSongNumStart
	b _08018DEA
	.align 2, 0
_08018BCC: .4byte gUnknown_030054CC
_08018BD0: .4byte gUnknown_030055B8
_08018BD4: .4byte 0x04000128
_08018BD8:
	ldr r0, _08018CBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r7, #0x10]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _08018BE8
	b _08018DEA
_08018BE8:
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08018BF8
	b _08018DEA
_08018BF8:
	ldr r4, [r5, #0x20]
	ldr r0, _08018CC0 @ =0x40600000
	ands r4, r0
	cmp r4, #0
	beq _08018C04
	b _08018DEA
_08018C04:
	adds r0, r5, #0
	bl sub_8021694
	adds r0, r6, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #8]
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x58
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _08018CC4 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r4, [r5, #0x20]
	adds r2, r5, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r4, _08018CC8 @ =0xFFFFCFFF
	ands r0, r4
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #6
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r2, #4
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ands r0, r4
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	ldr r3, _08018CCC @ =gUnknown_03005960
	adds r2, r3, #0
	adds r2, #0x50
	ldrh r1, [r2]
	ldr r0, _08018CD0 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r2]
	adds r0, r6, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r3, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r3]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r3, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r3, #4]
	movs r0, #0xda
	bl m4aSongNumStart
	b _08018DEA
	.align 2, 0
_08018CBC: .4byte 0x04000128
_08018CC0: .4byte 0x40600000
_08018CC4: .4byte gMPlayInfo_BGM
_08018CC8: .4byte 0xFFFFCFFF
_08018CCC: .4byte gUnknown_03005960
_08018CD0: .4byte 0x0000FFFC
_08018CD4:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x17
	ands r0, r1
	cmp r0, #0
	beq _08018CE2
	b _08018DEA
_08018CE2:
	ldr r0, _08018D4C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018D14
	ldr r0, _08018D50 @ =gUnknown_030055B8
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018D54 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08018DEA
_08018D14:
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r5, #0x30]
	ldrb r1, [r2]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_802A9A4
	movs r0, #0xd9
	bl m4aSongNumStart
	ldr r0, _08018D58 @ =gMPlayInfo_BGM
	movs r1, #0x80
	bl m4aMPlayTempoControl
	b _08018DEA
	.align 2, 0
_08018D4C: .4byte gUnknown_030054CC
_08018D50: .4byte gUnknown_030055B8
_08018D54: .4byte 0x04000128
_08018D58: .4byte gMPlayInfo_BGM
_08018D5C:
	ldr r0, _08018D9C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018D8E
	ldr r0, _08018DA0 @ =gUnknown_030055B8
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018DA4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08018DEA
_08018D8E:
	ldr r1, _08018DA8 @ =gUnknown_03005B7C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xdb
	bl m4aSongNumStart
	b _08018DEA
	.align 2, 0
_08018D9C: .4byte gUnknown_030054CC
_08018DA0: .4byte gUnknown_030055B8
_08018DA4: .4byte 0x04000128
_08018DA8: .4byte gUnknown_03005B7C
_08018DAC:
	ldr r0, _08018DF0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08018DDE
	ldr r0, _08018DF4 @ =gUnknown_030055B8
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r4
	ands r1, r3
	adds r0, r4, #4
	asrs r1, r0
	ldr r4, _08018DF8 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _08018DEA
_08018DDE:
	ldr r1, _08018DFC @ =gUnknown_0300583C
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xd8
	bl m4aSongNumStart
_08018DEA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018DF0: .4byte gUnknown_030054CC
_08018DF4: .4byte gUnknown_030055B8
_08018DF8: .4byte 0x04000128
_08018DFC: .4byte gUnknown_0300583C

	thumb_func_start sub_8018E00
sub_8018E00: @ 0x08018E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, _08018E84 @ =gUnknown_030055A0
	mov r1, r8
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp]
	movs r7, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08018ED8
	ldr r0, _08018E88 @ =gUnknown_030054CC
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r2, #0
	movs r2, #0x10
	mov sb, r2
	ldr r6, _08018E8C @ =0x04000128
	ldr r4, _08018E90 @ =gUnknown_030054B4
_08018E4C:
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r2, ip
	cmp r2, #4
	beq _08018E94
	ldr r0, [r1, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08018EC8
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r1, #2
	cmp r0, r1
	beq _08018EC8
	movs r2, #1
	add sl, r2
	ldr r0, [sp, #4]
	adds r0, #1
	str r0, [sp, #4]
	b _08018EC8
	.align 2, 0
_08018E84: .4byte gUnknown_030055A0
_08018E88: .4byte gUnknown_030054CC
_08018E8C: .4byte 0x04000128
_08018E90: .4byte gUnknown_030054B4
_08018E94:
	ldr r1, _08018EF8 @ =gUnknown_030055B8
	ldrb r3, [r1]
	mov r2, sb
	lsls r2, r7
	ands r2, r3
	adds r0, r7, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	mov r0, sb
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	beq _08018EC8
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08018EC8
	movs r2, #1
	mov sl, r2
_08018EC8:
	adds r5, #4
	adds r4, #1
	adds r7, #1
	cmp r7, #3
	bhi _08018ED8
	ldr r0, [r5]
	cmp r0, #0
	bne _08018E4C
_08018ED8:
	ldr r0, _08018EFC @ =gUnknown_030054B4
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08018F00
	mov r0, sl
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	bl sub_8019CCC
	b _08018F04
	.align 2, 0
_08018EF8: .4byte gUnknown_030055B8
_08018EFC: .4byte gUnknown_030054B4
_08018F00:
	movs r1, #1
	str r1, [sp, #0xc]
_08018F04:
	ldr r0, _08019080 @ =gUnknown_030054CC
	ldrb r0, [r0]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #0x14]
	ldr r1, [sp, #8]
	subs r1, #1
	str r1, [sp, #0x10]
	cmp r0, #4
	bne _08018FFE
	movs r7, #0
	ldr r0, _08019084 @ =gUnknown_030055A0
	ldr r0, [r0]
	cmp r0, #0
	beq _08018FFE
	movs r2, #0x10
	mov sb, r2
	mov r0, sb
	mov r1, r8
	lsls r0, r1
	mov sb, r0
	ldr r6, _08019088 @ =gUnknown_030059E0
_08018F30:
	cmp r7, r8
	beq _08018FEC
	ldr r0, _0801908C @ =gUnknown_030054B4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _08018FEC
	ldr r0, _08019090 @ =gUnknown_030055B8
	ldrb r2, [r0]
	movs r0, #0x10
	lsls r0, r7
	ands r0, r2
	adds r1, r7, #4
	asrs r0, r1
	mov r1, sb
	ands r2, r1
	mov r1, r8
	adds r1, #4
	asrs r2, r1
	cmp r0, r2
	bne _08018FEC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r2, sl
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, _08019094 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r7, r0
	bne _08018FEC
	adds r0, r6, #0
	bl sub_80218E4
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	adds r1, #0x1c
	ands r0, r1
	subs r1, #0xc
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08019098 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _0801909C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
	movs r5, #0
	movs r4, #0
	movs r0, #0x14
	ldr r1, _080190A0 @ =gUnknown_03005A44
	strh r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r0, r6, #0
	adds r0, #0x61
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	adds r0, r6, #0
	adds r0, #0x5c
	strh r4, [r0]
	movs r0, #1
	orrs r1, r0
	movs r0, #0x1c
	ldr r2, _080190A0 @ =gUnknown_03005A44
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r6, #0x20]
_08018FEC:
	adds r7, #1
	cmp r7, #3
	bhi _08018FFE
	ldr r0, _08019084 @ =gUnknown_030055A0
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08018F30
_08018FFE:
	ldr r1, [sp]
	ldr r0, [r1, #0x5c]
	movs r2, #1
	orrs r0, r2
	str r0, [r1, #0x5c]
	mov r0, sl
	cmp r0, #0
	bne _08019028
	ldr r3, _080190A4 @ =gUnknown_03005424
	ldrh r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08019028
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _080190A8 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08019028:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bhs _08019038
	ldr r0, _08019080 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08019104
_08019038:
	movs r7, #0
	ldr r0, _08019084 @ =gUnknown_030055A0
	ldr r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _080190FA
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	ldr r5, _08019088 @ =gUnknown_030059E0
	adds r6, r5, #0
	adds r6, #0x5c
_08019050:
	lsls r0, r7, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, _0801908C @ =gUnknown_030054B4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080190E6
	ldr r0, _08019080 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _080190AC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl sub_8019CCC
	b _080190E6
	.align 2, 0
_08019080: .4byte gUnknown_030054CC
_08019084: .4byte gUnknown_030055A0
_08019088: .4byte gUnknown_030059E0
_0801908C: .4byte gUnknown_030054B4
_08019090: .4byte gUnknown_030055B8
_08019094: .4byte 0x04000128
_08019098: .4byte 0xFFFFFBFF
_0801909C: .4byte 0xFFFFFEFF
_080190A0: .4byte gUnknown_03005A44
_080190A4: .4byte gUnknown_03005424
_080190A8: .4byte gUnknown_03005490
_080190AC:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0x10]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x5c]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	strh r0, [r6]
	ldr r3, _08019114 @ =gUnknown_03005438
	ldrb r1, [r3]
	lsls r2, r1, #3
	ldr r0, _08019118 @ =gUnknown_03005510
	adds r2, r2, r0
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r3]
	movs r0, #7
	strb r0, [r2]
_080190E6:
	adds r7, #1
	cmp r7, #3
	bhi _080190FA
	ldr r0, _0801911C @ =gUnknown_030055A0
	lsls r1, r7, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _08019050
_080190FA:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08019104
	bl sub_8019F08
_08019104:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019114: .4byte gUnknown_03005438
_08019118: .4byte gUnknown_03005510
_0801911C: .4byte gUnknown_030055A0

	thumb_func_start sub_8019120
sub_8019120: @ 0x08019120
	push {r4, lr}
	sub sp, #8
	ldr r0, _08019178 @ =sub_80188FC
	ldr r2, _0801917C @ =0x0000FFFE
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	str r4, [sp, #4]
	ldr r2, _08019180 @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019184 @ =gMultiSioSend
	str r1, [r2, #4]
	ldr r1, _08019188 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _0801918C @ =gMultiSioRecv
	str r1, [r2, #4]
	ldr r1, _08019190 @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019194 @ =gUnknown_03005510
	str r1, [r2, #4]
	ldr r1, _08019198 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r2, _0801919C @ =gUnknown_03005438
	ldr r1, _080191A0 @ =gUnknown_03005420
	strb r4, [r1]
	strb r4, [r2]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08019178: .4byte sub_80188FC
_0801917C: .4byte 0x0000FFFE
_08019180: .4byte 0x040000D4
_08019184: .4byte gMultiSioSend
_08019188: .4byte 0x85000005
_0801918C: .4byte gMultiSioRecv
_08019190: .4byte 0x85000014
_08019194: .4byte gUnknown_03005510
_08019198: .4byte 0x85000020
_0801919C: .4byte gUnknown_03005438
_080191A0: .4byte gUnknown_03005420

	thumb_func_start sub_80191A4
sub_80191A4: @ 0x080191A4
	push {r4, lr}
	sub sp, #8
	ldr r0, _080191FC @ =sub_8018A28
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl TaskCreate
	str r4, [sp, #4]
	ldr r2, _08019200 @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019204 @ =gMultiSioSend
	str r1, [r2, #4]
	ldr r1, _08019208 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _0801920C @ =gMultiSioRecv
	str r1, [r2, #4]
	ldr r1, _08019210 @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _08019214 @ =gUnknown_03005510
	str r1, [r2, #4]
	ldr r1, _08019218 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _0801921C @ =gUnknown_03005420
	strb r4, [r1]
	ldr r1, _08019220 @ =gUnknown_03005438
	strb r4, [r1]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080191FC: .4byte sub_8018A28
_08019200: .4byte 0x040000D4
_08019204: .4byte gMultiSioSend
_08019208: .4byte 0x85000005
_0801920C: .4byte gMultiSioRecv
_08019210: .4byte 0x85000014
_08019214: .4byte gUnknown_03005510
_08019218: .4byte 0x85000020
_0801921C: .4byte gUnknown_03005420
_08019220: .4byte gUnknown_03005438

	thumb_func_start sub_8019224
sub_8019224: @ 0x08019224
	ldr r3, _08019238 @ =gUnknown_03005438
	ldrb r1, [r3]
	lsls r0, r1, #3
	ldr r2, _0801923C @ =gUnknown_03005510
	adds r0, r0, r2
	adds r1, #1
	movs r2, #0xf
	ands r1, r2
	strb r1, [r3]
	bx lr
	.align 2, 0
_08019238: .4byte gUnknown_03005438
_0801923C: .4byte gUnknown_03005510

	thumb_func_start sub_8019240
sub_8019240: @ 0x08019240
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080192A4 @ =gUnknown_030054DC
	ldr r0, [r0]
	cmp r0, #0
	beq _0801929E
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _0801929E
	subs r0, #8
	adds r2, r3, r0
	ldrb r1, [r4, #0x11]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r2, r2, r0
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08019296
	cmp r0, #1
	bne _0801929E
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801929E
_08019296:
	movs r1, #3
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
_0801929E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080192A4: .4byte gUnknown_030054DC

	thumb_func_start sub_80192A8
sub_80192A8: @ 0x080192A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080192F8 @ =gUnknown_030054DC
	ldr r0, [r0]
	cmp r0, #0
	beq _080192F0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0, #4]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _080192F0
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
_080192F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080192F8: .4byte gUnknown_030054DC

	thumb_func_start sub_80192FC
sub_80192FC: @ 0x080192FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801934C @ =gUnknown_030054DC
	ldr r0, [r0]
	cmp r0, #0
	beq _08019344
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0, #8]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _08019344
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
_08019344:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801934C: .4byte gUnknown_030054DC

	thumb_func_start sub_8019350
sub_8019350: @ 0x08019350
	push {lr}
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r2, #4
	ldrsh r1, [r0, r2]
	ldrb r2, [r0, #0xf]
	adds r0, r3, #0
	bl sub_801FD34
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8019368
sub_8019368: @ 0x08019368
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080193B4 @ =gUnknown_030054DC
	ldr r0, [r0]
	cmp r0, #0
	beq _080193AC
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _080193AC
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	ldrb r0, [r4, #0x12]
	strb r0, [r1, #4]
_080193AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080193B4: .4byte gUnknown_030054DC
_080193B8:
	.byte 0x01, 0x48, 0x00, 0x68, 0x70, 0x47, 0x00, 0x00
	.byte 0x28, 0x01, 0x00, 0x04

	thumb_func_start sub_80193C4
sub_80193C4: @ 0x080193C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _080193E8 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _080193F8
	ldr r0, _080193EC @ =sub_801951C
	ldr r2, _080193F0 @ =0x00002001
	ldr r1, _080193F4 @ =sub_8019CC8
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	b _08019408
	.align 2, 0
_080193E8: .4byte gUnknown_030054CC
_080193EC: .4byte sub_801951C
_080193F0: .4byte 0x00002001
_080193F4: .4byte sub_8019CC8
_080193F8:
	ldr r0, _08019468 @ =sub_8019898
	ldr r2, _0801946C @ =0x00002001
	ldr r1, _08019470 @ =sub_8019CC8
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
_08019408:
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	movs r4, #0
	strb r7, [r0]
	ldr r0, _08019474 @ =IWRAM_START + 0x10
	adds r1, r2, r0
	ldr r3, _08019478 @ =IWRAM_START+4
	adds r5, r2, r3
	ldr r0, _0801947C @ =0x06012700
	str r0, [r1, #4]
	movs r6, #0
	movs r0, #0x40
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _08019480 @ =IWRAM_START + 0x31
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _08019484 @ =IWRAM_START + 0x32
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _08019488 @ =IWRAM_START + 0x35
	adds r0, r2, r3
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	ldr r0, _0801948C @ =0x000C0060
	str r0, [r1, #0x10]
	ldr r0, _08019490 @ =0x0000035F
	strh r0, [r1, #0xa]
	ldr r0, _08019494 @ =IWRAM_START + 0x30
	adds r2, r2, r0
	strb r6, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	strh r4, [r5]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019468: .4byte sub_8019898
_0801946C: .4byte 0x00002001
_08019470: .4byte sub_8019CC8
_08019474: .4byte IWRAM_START + 0x10
_08019478: .4byte IWRAM_START+4
_0801947C: .4byte 0x06012700
_08019480: .4byte IWRAM_START + 0x31
_08019484: .4byte IWRAM_START + 0x32
_08019488: .4byte IWRAM_START + 0x35
_0801948C: .4byte 0x000C0060
_08019490: .4byte 0x0000035F
_08019494: .4byte IWRAM_START + 0x30

	thumb_func_start sub_8019498
sub_8019498: @ 0x08019498
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08019500 @ =sub_8019CAC
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	ldr r1, _08019504 @ =0x06012700
	str r1, [r0, #4]
	movs r5, #0
	movs r1, #0x40
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	ldr r1, _08019508 @ =IWRAM_START + 0x21
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _0801950C @ =IWRAM_START + 0x22
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _08019510 @ =IWRAM_START + 0x25
	adds r1, r3, r2
	strb r5, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #0xb
	str r1, [r0, #0x10]
	ldr r1, _08019514 @ =0x0000035F
	strh r1, [r0, #0xa]
	ldr r1, _08019518 @ =IWRAM_START + 0x20
	adds r3, r3, r1
	strb r5, [r3]
	bl sub_8004558
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019500: .4byte sub_8019CAC
_08019504: .4byte 0x06012700
_08019508: .4byte IWRAM_START + 0x21
_0801950C: .4byte IWRAM_START + 0x22
_08019510: .4byte IWRAM_START + 0x25
_08019514: .4byte 0x0000035F
_08019518: .4byte IWRAM_START + 0x20

	thumb_func_start sub_801951C
sub_801951C: @ 0x0801951C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080195B0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r0, r1, r3
	ldr r2, _080195B4 @ =gUnknown_030055A0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	adds r3, r4, r3
	ldr r0, _080195B8 @ =IWRAM_START + 0x10
	adds r0, r1, r0
	str r0, [sp]
	ldr r2, _080195BC @ =IWRAM_START+4
	adds r2, r2, r1
	mov sl, r2
	ldr r5, _080195C0 @ =IWRAM_START + 0x50
	adds r0, r4, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _080195C4 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	cmp r1, #0xf0
	bhi _08019576
	adds r5, #2
	adds r0, r4, r5
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r2, #4]
	subs r0, r1, r0
	cmp r0, #0
	blt _08019576
	cmp r0, #0xa0
	bgt _08019576
	b _08019882
_08019576:
	adds r0, r3, #0
	adds r0, #0x50
	ldrh r0, [r0]
	subs r0, #0x78
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x52
	ldrh r0, [r0]
	subs r0, #0x50
	ldr r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r5, #0x10
	lsrs r4, r2, #0x10
	ldr r7, [sp]
	adds r7, #0x22
	cmp r0, #0
	beq _08019616
	cmp r2, #0
	beq _08019616
	lsls r3, r4, #0x10
	b _080195FC
	.align 2, 0
_080195B0: .4byte gCurTask
_080195B4: .4byte gUnknown_030055A0
_080195B8: .4byte IWRAM_START + 0x10
_080195BC: .4byte IWRAM_START+4
_080195C0: .4byte IWRAM_START + 0x50
_080195C4: .4byte gUnknown_03005960
_080195C8:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r2, r2, r0
	lsls r2, r2, #0xf
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r4, r1, #0x10
	lsrs r1, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _080195E8
	rsbs r0, r0, #0
_080195E8:
	cmp r0, #1
	ble _08019616
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	adds r3, r0, #0
	cmp r2, #0
	bge _080195F8
	rsbs r2, r2, #0
_080195F8:
	cmp r2, #1
	ble _08019616
_080195FC:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08019606
	rsbs r0, r0, #0
_08019606:
	cmp r0, #0x7f
	bgt _080195C8
	asrs r0, r3, #0x10
	cmp r0, #0
	bge _08019612
	rsbs r0, r0, #0
_08019612:
	cmp r0, #0x7f
	bgt _080195C8
_08019616:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	cmp r1, #0
	bge _08019622
	rsbs r0, r1, #0
_08019622:
	cmp r0, #1
	bgt _08019636
	lsls r0, r4, #0x10
	movs r4, #0xc0
	lsls r4, r4, #2
	cmp r0, #0
	ble _0801965A
	movs r4, #0x80
	lsls r4, r4, #1
	b _0801965A
_08019636:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #0
	bge _08019642
	rsbs r2, r0, #0
_08019642:
	cmp r2, #1
	bgt _08019652
	movs r4, #0x80
	lsls r4, r4, #2
	cmp r1, #0
	ble _0801965A
	movs r4, #0
	b _0801965A
_08019652:
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0801965A:
	lsls r4, r4, #0x10
	asrs r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r2, _08019690 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1]
	lsls r3, r6, #0x10
	asrs r0, r3, #0x10
	adds r1, r0, #0
	muls r1, r0, r1
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	adds r5, r0, #0
	muls r5, r0, r5
	adds r0, r5, #0
	adds r1, r1, r0
	ldr r0, _08019694 @ =0x0000FFFF
	adds r5, r3, #0
	str r2, [sp, #4]
	cmp r1, r0
	bgt _08019698
	movs r0, #0x18
	b _0801969A
	.align 2, 0
_08019690: .4byte 0x000003FF
_08019694: .4byte 0x0000FFFF
_08019698:
	movs r0, #0x10
_0801969A:
	strb r0, [r7]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	cmp r1, r2
	ble _080196A8
	movs r0, #0x40
	b _080196D6
_080196A8:
	ldr r0, _080196BC @ =0x0000FFFF
	cmp r1, r0
	bgt _080196C0
	movs r0, #0xf0
	lsls r0, r0, #1
	mov r2, sl
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	b _080196DC
	.align 2, 0
_080196BC: .4byte 0x0000FFFF
_080196C0:
	subs r1, r2, r1
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _080196E8 @ =0x000005FF
	bl Div
	adds r0, #0x40
_080196D6:
	mov r1, sl
	strh r0, [r1, #2]
	strh r0, [r1, #4]
_080196DC:
	asrs r4, r4, #0x10
	cmp r4, #0
	bne _080196EC
	movs r5, #0x50
_080196E4:
	movs r0, #0xf0
	b _0801984A
	.align 2, 0
_080196E8: .4byte 0x000005FF
_080196EC:
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r4, r6
	bne _080196FA
	movs r5, #0xa0
	movs r0, #0x78
	b _0801984A
_080196FA:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _08019706
	movs r5, #0x50
	b _08019848
_08019706:
	movs r2, #0xc0
	lsls r2, r2, #2
	mov sb, r2
	cmp r4, sb
	bne _08019716
	movs r5, #0
	movs r0, #0x78
	b _0801984A
_08019716:
	cmp r5, #0
	ble _0801977C
	ldr r7, _08019760 @ =gUnknown_08097AA4
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r4, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #5
	adds r1, #0x50
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _08019768
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080196E4
	movs r5, #0xa0
	subs r1, r6, r4
	ldr r0, _08019764 @ =0x000003FF
	ands r1, r0
	b _080197CE
	.align 2, 0
_08019760: .4byte gUnknown_08097AA4
_08019764: .4byte 0x000003FF
_08019768:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _080196E4
	movs r5, #0
	subs r1, r6, r4
	ldr r0, _08019778 @ =0x000003FF
	ands r1, r0
	b _08019818
	.align 2, 0
_08019778: .4byte 0x000003FF
_0801977C:
	ldr r7, _080197FC @ =gUnknown_08097AA4
	ldr r2, _08019800 @ =0xFFFFFE00
	adds r1, r4, r2
	ldr r5, _08019804 @ =0x000003FF
	mov r8, r5
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #5
	movs r0, #0x50
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _08019808
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08019848
	movs r5, #0xa0
	mov r2, sb
	subs r1, r2, r4
	mov r4, r8
	ands r1, r4
_080197CE:
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #4
	adds r1, #0x78
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	b _0801984A
	.align 2, 0
_080197FC: .4byte gUnknown_08097AA4
_08019800: .4byte 0xFFFFFE00
_08019804: .4byte 0x000003FF
_08019808:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _08019848
	movs r5, #0
	mov r0, sb
	subs r1, r0, r4
	mov r2, r8
	ands r1, r2
_08019818:
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0x78
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0801984A
_08019848:
	movs r0, #0
_0801984A:
	mov r4, sl
	strh r0, [r4, #6]
	strh r5, [r4, #8]
	ldr r5, [sp]
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r2, _08019894 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	ldr r0, [sp]
	bl sub_8004558
	ldr r0, [sp]
	mov r1, sl
	bl sub_8004860
	ldr r0, [sp]
	bl sub_80051E8
_08019882:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019894: .4byte gUnknown_030054B8

	thumb_func_start sub_8019898
sub_8019898: @ 0x08019898
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08019928 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r0, r1, r3
	ldr r2, _0801992C @ =gUnknown_030055A0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	adds r6, r4, r3
	ldr r0, _08019930 @ =IWRAM_START + 0x10
	adds r0, r1, r0
	str r0, [sp]
	ldr r2, _08019934 @ =IWRAM_START+4
	adds r2, r2, r1
	mov sl, r2
	adds r3, #0x50
	adds r0, r4, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _08019938 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	adds r5, r2, #0
	cmp r1, #0xf0
	bhi _080198F4
	adds r3, #2
	adds r0, r4, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5, #4]
	subs r0, r1, r0
	cmp r0, #0
	blt _080198F4
	cmp r0, #0xa0
	bgt _080198F4
	b _08019C96
_080198F4:
	adds r2, r6, #0
	adds r2, #0x50
	ldrh r0, [r2]
	subs r0, #0x78
	ldr r3, [r5]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	adds r1, r6, #0
	adds r1, #0x52
	ldrh r0, [r1]
	subs r0, #0x50
	ldr r5, [r5, #4]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r7, r2, #0
	cmp r3, r0
	ble _08019944
	ldr r0, _0801993C @ =0xFFFFFA60
	adds r4, r3, r0
	ldr r3, _08019940 @ =0xFFFFFCA0
	b _0801994E
	.align 2, 0
_08019928: .4byte gCurTask
_0801992C: .4byte gUnknown_030055A0
_08019930: .4byte IWRAM_START + 0x10
_08019934: .4byte IWRAM_START+4
_08019938: .4byte gUnknown_03005960
_0801993C: .4byte 0xFFFFFA60
_08019940: .4byte 0xFFFFFCA0
_08019944:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r4, r3, r0
	movs r3, #0xd8
	lsls r3, r3, #2
_0801994E:
	adds r2, r5, r3
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, r0, r4
	cmp r0, #0xf0
	bhi _0801996A
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, r0, r2
	cmp r0, #0
	blt _0801996A
	cmp r0, #0xa0
	bgt _0801996A
	b _08019C96
_0801996A:
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, #0x78
	subs r4, r0, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, #0x50
	subs r2, r0, r2
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _08019986
	rsbs r1, r1, #0
_08019986:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08019990
	rsbs r0, r0, #0
_08019990:
	cmp r0, r1
	bge _08019996
	adds r0, r1, #0
_08019996:
	adds r3, r4, #0
	cmp r4, #0
	bge _0801999E
	rsbs r3, r4, #0
_0801999E:
	adds r1, r2, #0
	cmp r2, #0
	bge _080199A6
	rsbs r1, r2, #0
_080199A6:
	cmp r1, r3
	bge _080199AC
	adds r1, r3, #0
_080199AC:
	cmp r0, r1
	ble _080199BA
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r0, r2, #0x10
	lsrs r6, r0, #0x10
_080199BA:
	mov r2, ip
	lsls r1, r2, #0x10
	lsrs r4, r1, #0x10
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
	str r0, [sp, #4]
	ldr r6, [sp]
	adds r6, #0x22
	cmp r5, #0
	beq _08019A26
	cmp r0, #0
	beq _08019A26
	lsls r2, r3, #0x10
	b _08019A0C
_080199D8:
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r2, r2, r0
	lsls r2, r2, #0xf
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r3, r1, #0x10
	lsrs r4, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _080199F8
	rsbs r0, r0, #0
_080199F8:
	cmp r0, #1
	ble _08019A26
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	adds r2, r0, #0
	cmp r1, #0
	bge _08019A08
	rsbs r1, r1, #0
_08019A08:
	cmp r1, #1
	ble _08019A26
_08019A0C:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08019A16
	rsbs r0, r0, #0
_08019A16:
	cmp r0, #0x7f
	bgt _080199D8
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _08019A22
	rsbs r0, r0, #0
_08019A22:
	cmp r0, #0x7f
	bgt _080199D8
_08019A26:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	cmp r1, #0
	bge _08019A32
	rsbs r0, r1, #0
_08019A32:
	cmp r0, #1
	bgt _08019A46
	lsls r0, r3, #0x10
	movs r2, #0xc0
	lsls r2, r2, #2
	cmp r0, #0
	ble _08019A6A
	movs r2, #0x80
	lsls r2, r2, #1
	b _08019A6A
_08019A46:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #0
	bge _08019A52
	rsbs r2, r0, #0
_08019A52:
	cmp r2, #1
	bgt _08019A62
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r1, #0
	ble _08019A6A
	movs r2, #0
	b _08019A6A
_08019A62:
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08019A6A:
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, _08019A9C @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1]
	asrs r0, r5, #0x10
	adds r1, r0, #0
	muls r1, r0, r1
	ldr r3, [sp, #4]
	asrs r0, r3, #0x10
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r1, r0
	ldr r0, _08019AA0 @ =0x0000FFFF
	adds r4, r2, #0
	cmp r1, r0
	bgt _08019AA4
	movs r0, #0x18
	b _08019AA6
	.align 2, 0
_08019A9C: .4byte 0x000003FF
_08019AA0: .4byte 0x0000FFFF
_08019AA4:
	movs r0, #0x10
_08019AA6:
	strb r0, [r6]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	cmp r1, r2
	ble _08019ABA
	movs r0, #0x40
	mov r1, sl
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	b _08019AEC
_08019ABA:
	ldr r0, _08019ACC @ =0x0000FFFF
	cmp r1, r0
	bgt _08019AD0
	movs r0, #0xf0
	lsls r0, r0, #1
	mov r2, sl
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	b _08019AEC
	.align 2, 0
_08019ACC: .4byte 0x0000FFFF
_08019AD0:
	subs r1, r2, r1
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _08019AF8 @ =0x000005FF
	bl Div
	adds r0, #0x40
	mov r3, sl
	strh r0, [r3, #2]
	strh r0, [r3, #4]
_08019AEC:
	asrs r4, r4, #0x10
	cmp r4, #0
	bne _08019AFC
	movs r5, #0x50
_08019AF4:
	movs r0, #0xf0
	b _08019C5A
	.align 2, 0
_08019AF8: .4byte 0x000005FF
_08019AFC:
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r4, r6
	bne _08019B0A
	movs r5, #0xa0
	movs r0, #0x78
	b _08019C5A
_08019B0A:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _08019B16
	movs r5, #0x50
	b _08019C58
_08019B16:
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	cmp r4, sb
	bne _08019B26
	movs r5, #0
	movs r0, #0x78
	b _08019C5A
_08019B26:
	cmp r5, #0
	ble _08019B8C
	ldr r7, _08019B70 @ =gUnknown_08097AA4
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r4, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #5
	adds r1, #0x50
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r1, [sp, #4]
	cmp r1, #0
	ble _08019B78
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08019AF4
	movs r5, #0xa0
	subs r1, r6, r4
	ldr r0, _08019B74 @ =0x000003FF
	ands r1, r0
	b _08019BDE
	.align 2, 0
_08019B70: .4byte gUnknown_08097AA4
_08019B74: .4byte 0x000003FF
_08019B78:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _08019AF4
	movs r5, #0
	subs r1, r6, r4
	ldr r0, _08019B88 @ =0x000003FF
	ands r1, r0
	b _08019C28
	.align 2, 0
_08019B88: .4byte 0x000003FF
_08019B8C:
	ldr r7, _08019C0C @ =gUnknown_08097AA4
	ldr r2, _08019C10 @ =0xFFFFFE00
	adds r1, r4, r2
	ldr r3, _08019C14 @ =0x000003FF
	mov r8, r3
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #5
	movs r0, #0x50
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _08019C18
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08019C58
	movs r5, #0xa0
	mov r2, sb
	subs r1, r2, r4
	mov r3, r8
	ands r1, r3
_08019BDE:
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #4
	adds r1, #0x78
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	b _08019C5A
	.align 2, 0
_08019C0C: .4byte gUnknown_08097AA4
_08019C10: .4byte 0xFFFFFE00
_08019C14: .4byte 0x000003FF
_08019C18:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _08019C58
	movs r5, #0
	mov r0, sb
	subs r1, r0, r4
	mov r2, r8
	ands r1, r2
_08019C28:
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0x78
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08019C5A
_08019C58:
	movs r0, #0
_08019C5A:
	mov r3, sl
	strh r0, [r3, #6]
	strh r5, [r3, #8]
	ldr r1, [sp]
	ldr r0, [r1, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	ldr r2, [sp]
	str r0, [r2, #0x10]
	ldr r2, _08019CA8 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [sp]
	ldr r0, [r3, #0x10]
	orrs r0, r1
	str r0, [r3, #0x10]
	ldr r0, [sp]
	bl sub_8004558
	ldr r0, [sp]
	mov r1, sl
	bl sub_8004860
	ldr r0, [sp]
	bl sub_80051E8
_08019C96:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019CA8: .4byte gUnknown_030054B8

	thumb_func_start sub_8019CAC
sub_8019CAC: @ 0x08019CAC
	push {lr}
	ldr r0, _08019CC4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_8004558
	pop {r0}
	bx r0
	.align 2, 0
_08019CC4: .4byte gCurTask

	thumb_func_start sub_8019CC8
sub_8019CC8: @ 0x08019CC8
	bx lr
	.align 2, 0

	thumb_func_start sub_8019CCC
sub_8019CCC: @ 0x08019CCC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r0, _08019D08 @ =gUnknown_030054B4
	adds r0, r4, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08019CEC
	b _08019E5E
_08019CEC:
	ldr r0, _08019D0C @ =sub_8019E70
	ldr r2, _08019D10 @ =0x00002010
	ldr r1, _08019D14 @ =sub_8019EF4
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r1, _08019D18 @ =gUnknown_030055A0
	b _08019D24
	.align 2, 0
_08019D08: .4byte gUnknown_030054B4
_08019D0C: .4byte sub_8019E70
_08019D10: .4byte 0x00002010
_08019D14: .4byte sub_8019EF4
_08019D18: .4byte gUnknown_030055A0
_08019D1C:
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	bhi _08019D2A
_08019D24:
	ldr r0, [r1]
	cmp r0, #0
	bne _08019D1C
_08019D2A:
	cmp r6, #5
	bhi _08019D3C
	ldr r0, _08019D38 @ =gUnknown_030054B4
	adds r0, r4, r0
	strb r6, [r0]
	b _08019D44
	.align 2, 0
_08019D38: .4byte gUnknown_030054B4
_08019D3C:
	ldr r0, _08019D88 @ =gUnknown_030054B4
	adds r0, r4, r0
	subs r1, r5, #1
	strb r1, [r0]
_08019D44:
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #0
	strb r4, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r4, r2, #0
	strh r1, [r4, #8]
	movs r0, #0xc
	bl sub_8007C10
	str r0, [r4, #4]
	cmp r6, #5
	bne _08019D94
	ldr r3, _08019D8C @ =gUnknown_080D5768
	ldr r0, _08019D90 @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019D70
	movs r1, #0x38
_08019D70:
	adds r0, r1, r3
	ldrh r0, [r0, #0xc]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019D80
	movs r1, #0x38
_08019D80:
	adds r0, r1, r3
	ldrb r1, [r0, #0xe]
	b _08019DBC
	.align 2, 0
_08019D88: .4byte gUnknown_030054B4
_08019D8C: .4byte gUnknown_080D5768
_08019D90: .4byte gLoadedSaveGame
_08019D94:
	cmp r6, #4
	bne _08019DCC
	ldr r3, _08019DC4 @ =gUnknown_080D5768
	ldr r0, _08019DC8 @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DA8
	movs r1, #0x38
_08019DA8:
	adds r0, r1, r3
	ldrh r0, [r0, #0x14]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DB8
	movs r1, #0x38
_08019DB8:
	adds r0, r1, r3
	ldrb r1, [r0, #0x16]
_08019DBC:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08019E38
	.align 2, 0
_08019DC4: .4byte gUnknown_080D5768
_08019DC8: .4byte gLoadedSaveGame
_08019DCC:
	cmp r5, #2
	beq _08019DD8
	ldr r0, _08019E00 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #4
	bne _08019E0C
_08019DD8:
	ldr r3, _08019E04 @ =gUnknown_080D5768
	ldr r0, _08019E08 @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DE8
	movs r1, #0x38
_08019DE8:
	adds r0, r1, r3
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DF8
	movs r1, #0x38
_08019DF8:
	adds r0, r1, r3
	ldrb r0, [r0, #6]
	b _08019E30
	.align 2, 0
_08019E00: .4byte gUnknown_030054CC
_08019E04: .4byte gUnknown_080D5768
_08019E08: .4byte gLoadedSaveGame
_08019E0C:
	ldr r3, _08019E68 @ =gUnknown_080D5768
	ldr r0, _08019E6C @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019E1C
	movs r1, #0x38
_08019E1C:
	adds r0, r1, r3
	ldrh r0, [r0, #0x1c]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019E2C
	movs r1, #0x38
_08019E2C:
	adds r0, r1, r3
	ldrb r0, [r0, #0x1e]
_08019E30:
	adds r0, r6, r0
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
_08019E38:
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r3, r4, #0
	adds r3, #0x22
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	str r1, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
_08019E5E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019E68: .4byte gUnknown_080D5768
_08019E6C: .4byte gLoadedSaveGame

	thumb_func_start sub_8019E70
sub_8019E70: @ 0x08019E70
	push {r4, lr}
	ldr r0, _08019EB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r1, _08019EBC @ =gUnknown_030055A0
	ldr r2, _08019EC0 @ =IWRAM_START + 0x30
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	ldr r1, _08019EC4 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	ldr r4, _08019EC8 @ =gUnknown_03005960
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r3, #0x16]
	ldr r0, _08019ECC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08019ED4
	ldr r1, _08019ED0 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	ldr r1, [r4, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	subs r0, #0x20
	b _08019EE0
	.align 2, 0
_08019EB8: .4byte gCurTask
_08019EBC: .4byte gUnknown_030055A0
_08019EC0: .4byte IWRAM_START + 0x30
_08019EC4: .4byte IWRAM_START + 0x50
_08019EC8: .4byte gUnknown_03005960
_08019ECC: .4byte gUnknown_03005424
_08019ED0: .4byte IWRAM_START + 0x52
_08019ED4:
	ldr r1, _08019EF0 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	ldr r1, [r4, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	adds r0, #0x20
_08019EE0:
	strh r0, [r3, #0x18]
	adds r0, r3, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019EF0: .4byte IWRAM_START + 0x52

	thumb_func_start sub_8019EF4
sub_8019EF4: @ 0x08019EF4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_8007CF0
	pop {r0}
	bx r0

	thumb_func_start sub_8019F08
sub_8019F08: @ 0x08019F08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08019FAC @ =sub_801A04C
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	ldr r3, _08019FB0 @ =gUnknown_030054CC
	ldrb r0, [r3]
	cmp r0, #5
	bne _08019F36
	b _0801A038
_08019F36:
	ldr r1, _08019FB4 @ =gUnknown_030054A8
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08019FB8 @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08019FBC @ =gUnknown_030053F0
	movs r4, #0
	ldrsh r2, [r0, r4]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08019FC0 @ =gUnknown_03005490
	ldr r2, [r0]
	ldr r0, _08019FC4 @ =0x00008CA0
	cmp r2, r0
	bhi _08019F6C
	ldr r0, _08019FC8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801A038
	cmp r2, #0
	bne _0801A038
_08019F6C:
	movs r2, #0
	ldrb r0, [r3]
	cmp r0, #4
	beq _08019FE4
	movs r4, #0
	ldr r0, _08019FCC @ =gUnknown_030055A0
	ldr r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _08019FA4
	ldr r5, _08019FD0 @ =gUnknown_030054B4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r7, #0
_08019F88:
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r3
	beq _08019F96
	adds r2, #1
_08019F96:
	adds r1, #4
	adds r4, #1
	cmp r4, #3
	bhi _08019FA4
	ldr r0, [r1]
	cmp r0, #0
	bne _08019F88
_08019FA4:
	cmp r2, #0
	bne _08019FD4
	movs r6, #4
	b _08019FE8
	.align 2, 0
_08019FAC: .4byte sub_801A04C
_08019FB0: .4byte gUnknown_030054CC
_08019FB4: .4byte gUnknown_030054A8
_08019FB8: .4byte gLoadedSaveGame
_08019FBC: .4byte gUnknown_030053F0
_08019FC0: .4byte gUnknown_03005490
_08019FC4: .4byte 0x00008CA0
_08019FC8: .4byte gUnknown_03005424
_08019FCC: .4byte gUnknown_030055A0
_08019FD0: .4byte gUnknown_030054B4
_08019FD4:
	subs r0, r4, #1
	cmp r2, r0
	bne _08019FE0
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _08019FE8
_08019FE0:
	movs r6, #5
	b _08019FE8
_08019FE4:
	movs r6, #4
	ldr r7, _0801A044 @ =gUnknown_030055A0
_08019FE8:
	movs r4, #0
	ldr r0, [r7]
	cmp r0, #0
	beq _0801A038
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
_08019FF8:
	ldr r0, _0801A048 @ =gUnknown_030054B4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _0801A024
	adds r0, r5, r7
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	ldr r0, [r2, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x5c]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_8019CCC
_0801A024:
	adds r5, #4
	adds r4, #1
	cmp r4, #3
	bhi _0801A038
	ldr r0, _0801A044 @ =gUnknown_030055A0
	adds r1, r5, r0
	ldr r1, [r1]
	adds r7, r0, #0
	cmp r1, #0
	bne _08019FF8
_0801A038:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A044: .4byte gUnknown_030055A0
_0801A048: .4byte gUnknown_030054B4

	thumb_func_start sub_801A04C
sub_801A04C: @ 0x0801A04C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _0801A0B8 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0801A0BC @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801A066
	movs r2, #0xf0
_0801A066:
	ldr r0, _0801A0C0 @ =gUnknown_03005438
	ldr r1, _0801A0C4 @ =gUnknown_03005420
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801A0B2
	ldrh r0, [r5]
	adds r1, r0, #1
	strh r1, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r2
	bls _0801A0B2
	ldr r1, _0801A0C8 @ =gBldRegs
	movs r4, #0
	movs r0, #0xbf
	strh r0, [r1]
	strh r4, [r1, #4]
	ldr r0, _0801A0CC @ =gMPlayInfo_BGM
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0801A0D0 @ =gMPlayInfo_SE1
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0801A0D4 @ =gMPlayInfo_SE2
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0801A0D8 @ =gMPlayInfo_SE3
	movs r1, #4
	bl m4aMPlayFadeOut
	strh r4, [r5]
	ldr r1, [r6]
	ldr r0, _0801A0DC @ =sub_801A0E0
	str r0, [r1, #8]
_0801A0B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801A0B8: .4byte gCurTask
_0801A0BC: .4byte gUnknown_030054CC
_0801A0C0: .4byte gUnknown_03005438
_0801A0C4: .4byte gUnknown_03005420
_0801A0C8: .4byte gBldRegs
_0801A0CC: .4byte gMPlayInfo_BGM
_0801A0D0: .4byte gMPlayInfo_SE1
_0801A0D4: .4byte gMPlayInfo_SE2
_0801A0D8: .4byte gMPlayInfo_SE3
_0801A0DC: .4byte sub_801A0E0

	thumb_func_start sub_801A0E0
sub_801A0E0: @ 0x0801A0E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0801A1D0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	ldr r2, _0801A1D4 @ =gBldRegs
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r2, #4]
	ldrh r1, [r1]
	ldr r0, _0801A1D8 @ =0x00000FFF
	cmp r1, r0
	bhi _0801A110
	b _0801A366
_0801A110:
	movs r0, #0xbf
	strh r0, [r2]
	movs r0, #0
	strh r0, [r2, #4]
	ldr r5, _0801A1DC @ =gUnknown_030054CC
	ldrb r0, [r5]
	add r1, sp, #8
	mov sl, r1
	cmp r0, #5
	beq _0801A126
	b _0801A232
_0801A126:
	ldr r1, _0801A1E0 @ =gUnknown_080D57D8
	mov r0, sp
	movs r2, #4
	bl memcpy
	add r4, sp, #4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	bl m4aMPlayAllStop
	ldr r0, _0801A1E4 @ =gUnknown_030053E8
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r7, #0
	mov sb, r4
	movs r0, #3
	mov ip, r0
_0801A14E:
	movs r4, #0
	cmp r4, ip
	bhs _0801A196
	mov r6, sb
	mov r8, ip
_0801A158:
	adds r3, r6, r4
	adds r5, r4, #1
	adds r2, r6, r5
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bhs _0801A190
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	strb r0, [r3]
	mov r1, sp
	adds r3, r1, r4
	adds r2, r1, r5
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
_0801A190:
	adds r4, r5, #0
	cmp r4, r8
	blo _0801A158
_0801A196:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	adds r7, #1
	cmp r7, #3
	bls _0801A14E
	movs r7, #0
	mov r4, sb
	ldr r6, _0801A1E8 @ =gUnknown_030054B4
	ldr r5, _0801A1EC @ =gUnknown_03005500
	mov r3, sp
	mov r2, sp
	ldr r1, _0801A1F0 @ =gUnknown_03005428
	mov r8, r1
_0801A1B2:
	cmp r7, #0
	beq _0801A1F4
	adds r0, r4, r7
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0801A1FC
	ldrb r0, [r2]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r0, [r2]
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	b _0801A222
	.align 2, 0
_0801A1D0: .4byte gCurTask
_0801A1D4: .4byte gBldRegs
_0801A1D8: .4byte 0x00000FFF
_0801A1DC: .4byte gUnknown_030054CC
_0801A1E0: .4byte gUnknown_080D57D8
_0801A1E4: .4byte gUnknown_030053E8
_0801A1E8: .4byte gUnknown_030054B4
_0801A1EC: .4byte gUnknown_03005500
_0801A1F0: .4byte gUnknown_03005428
_0801A1F4:
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	cmp r0, r1
	bne _0801A20C
_0801A1FC:
	ldrb r0, [r2]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r0, [r2]
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	b _0801A222
_0801A20C:
	ldrb r0, [r3]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r1, [r3]
	add r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r0, r5
	strb r7, [r0]
_0801A222:
	adds r2, #1
	adds r7, #1
	cmp r7, #3
	bls _0801A1B2
	ldr r1, _0801A278 @ =gUnknown_030054CC
	ldrb r0, [r1]
	cmp r0, #5
	beq _0801A2DA
_0801A232:
	movs r6, #0
	movs r2, #0
_0801A236:
	ldr r0, _0801A27C @ =gUnknown_030055B8
	ldrb r1, [r0]
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	asrs r1, r3
	movs r0, #1
	ands r1, r0
	adds r5, r2, #0
	cmp r1, #0
	beq _0801A2C2
	ldr r4, _0801A280 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r3, r0
	beq _0801A2C2
	ldr r2, _0801A284 @ =gUnknown_030054B4
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bge _0801A288
	movs r3, #0
	b _0801A2A8
	.align 2, 0
_0801A278: .4byte gUnknown_030054CC
_0801A27C: .4byte gUnknown_030055B8
_0801A280: .4byte 0x04000128
_0801A284: .4byte gUnknown_030054B4
_0801A288:
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	ble _0801A2A0
	movs r3, #1
	movs r6, #1
	b _0801A2A8
_0801A2A0:
	movs r3, #2
	cmp r6, #1
	beq _0801A2A8
	movs r6, #2
_0801A2A8:
	ldr r1, _0801A31C @ =gUnknown_03005410
	asrs r2, r5, #0x10
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r2, _0801A320 @ =gUnknown_03005460
	adds r1, r1, r2
	adds r2, r3, #0
	bl sub_807174C
_0801A2C2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0801A236
	adds r0, r6, #0
	bl sub_80716F0
	bl WriteSaveGame
_0801A2DA:
	ldr r1, _0801A324 @ =0x0000FFFF
	movs r0, #0
	bl sub_80029D0
	ldr r1, _0801A328 @ =gUnknown_03002AE4
	ldr r0, _0801A32C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0801A330 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0801A334 @ =gUnknown_03004D5C
	ldr r0, _0801A338 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0801A33C @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #5
	beq _0801A34C
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _0801A340 @ =0x040000D4
	mov r0, sl
	str r0, [r1]
	ldr r0, _0801A344 @ =gMultiSioSend
	str r0, [r1, #4]
	ldr r0, _0801A348 @ =0x85000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl sub_805BDEC
	b _0801A366
	.align 2, 0
_0801A31C: .4byte gUnknown_03005410
_0801A320: .4byte gUnknown_03005460
_0801A324: .4byte 0x0000FFFF
_0801A328: .4byte gUnknown_03002AE4
_0801A32C: .4byte gUnknown_0300287C
_0801A330: .4byte gUnknown_03005390
_0801A334: .4byte gUnknown_03004D5C
_0801A338: .4byte gUnknown_03002A84
_0801A33C: .4byte gUnknown_030054CC
_0801A340: .4byte 0x040000D4
_0801A344: .4byte gMultiSioSend
_0801A348: .4byte 0x85000005
_0801A34C:
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _0801A378 @ =0x040000D4
	mov r0, sl
	str r0, [r1]
	ldr r0, _0801A37C @ =gMultiSioSend
	str r0, [r1, #4]
	ldr r0, _0801A380 @ =0x85000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl sub_8081EC0
_0801A366:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A378: .4byte 0x040000D4
_0801A37C: .4byte gMultiSioSend
_0801A380: .4byte 0x85000005

	thumb_func_start sub_801A384
sub_801A384: @ 0x0801A384
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0801A3C0 @ =gUnknown_030054CC
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801A418
	ldr r0, _0801A3C4 @ =gUnknown_030055B4
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0801A418
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0801A3AC
	ldr r0, _0801A3C8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A418
_0801A3AC:
	cmp r1, #0x1d
	beq _0801A418
	ldr r5, _0801A3CC @ =gUnknown_03005840
	ldr r4, [r5]
	cmp r4, #0
	beq _0801A3D0
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r4, #2]
	b _0801A418
	.align 2, 0
_0801A3C0: .4byte gUnknown_030054CC
_0801A3C4: .4byte gUnknown_030055B4
_0801A3C8: .4byte gUnknown_030054B0
_0801A3CC: .4byte gUnknown_03005840
_0801A3D0:
	ldr r0, _0801A420 @ =sub_801A430
	movs r2, #0xe0
	lsls r2, r2, #8
	ldr r1, _0801A424 @ =sub_801A4D8
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [r5]
	strh r4, [r0]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0801A428 @ =gUnknown_030026D0
	strh r4, [r0]
	ldr r1, _0801A42C @ =gBgCntRegs
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0801A418:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A420: .4byte sub_801A430
_0801A424: .4byte sub_801A4D8
_0801A428: .4byte gUnknown_030026D0
_0801A42C: .4byte gBgCntRegs

	thumb_func_start sub_801A430
sub_801A430: @ 0x0801A430
	push {r4, lr}
	ldr r0, _0801A46C @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r4, r0, #0
	cmp r4, #0
	beq _0801A476
	ldrh r2, [r1, #6]
	cmp r2, #0xe
	bhi _0801A470
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0801A498
	adds r0, r2, #1
	strh r0, [r1, #6]
	movs r0, #0
	strh r0, [r1, #4]
	b _0801A498
	.align 2, 0
_0801A46C: .4byte gCurTask
_0801A470:
	subs r0, #1
	strh r0, [r1, #2]
	b _0801A498
_0801A476:
	ldrh r2, [r1, #6]
	cmp r2, #0
	bne _0801A484
	adds r0, r3, #0
	bl TaskDestroy
	b _0801A4CA
_0801A484:
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0801A498
	subs r0, r2, #1
	strh r0, [r1, #6]
	strh r4, [r1, #4]
_0801A498:
	ldrh r1, [r1, #6]
	movs r0, #0xf
	ands r0, r1
	ldr r3, _0801A4D0 @ =gUnknown_030026D0
	lsls r1, r0, #0xc
	lsls r2, r0, #8
	orrs r1, r2
	lsls r2, r0, #4
	orrs r1, r2
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0801A4D4 @ =gBgCntRegs
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0801A4CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A4D0: .4byte gUnknown_030026D0
_0801A4D4: .4byte gBgCntRegs

	thumb_func_start sub_801A4D8
sub_801A4D8: @ 0x0801A4D8
	push {r4, lr}
	ldr r0, _0801A50C @ =gUnknown_03005840
	movs r4, #0
	str r4, [r0]
	ldr r2, _0801A510 @ =gBgCntRegs
	ldrh r3, [r2]
	ldr r1, _0801A514 @ =0x0000FFBF
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2, #2]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #2]
	ldrh r3, [r2, #4]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	ands r1, r0
	strh r1, [r2, #6]
	ldr r0, _0801A518 @ =gUnknown_030026D0
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A50C: .4byte gUnknown_03005840
_0801A510: .4byte gBgCntRegs
_0801A514: .4byte 0x0000FFBF
_0801A518: .4byte gUnknown_030026D0
