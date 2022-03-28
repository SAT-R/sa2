.include "asm/macros.inc"

.syntax unified
.arm

	thumb_func_start sub_80019A0
sub_80019A0: @ 0x080019A0
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08001A90 @ =gUnknown_03002840
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08001A94 @ =0x040000D4
	ldr r0, _08001A98 @ =gUnknown_030022B0
	str r0, [r3]
	ldr r0, _08001A9C @ =0x04000008
	str r0, [r3, #4]
	ldr r0, _08001AA0 @ =0x84000002
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _08001AA4 @ =gUnknown_03001840
	ldr r2, [r1]
	movs r5, #1
	adds r0, r2, #0
	ands r0, r5
	adds r6, r1, #0
	cmp r0, #0
	beq _080019E4
	ldr r0, _08001AA8 @ =gUnknown_03002880
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08001AAC @ =0x84000080
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	eors r2, r5
	str r2, [r6]
_080019E4:
	ldr r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08001A02
	ldr r0, _08001AB0 @ =gUnknown_03002060
	str r0, [r3]
	ldr r0, _08001AB4 @ =0x05000200
	str r0, [r3, #4]
	ldr r0, _08001AAC @ =0x84000080
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [r6]
	eors r0, r1
	str r0, [r6]
_08001A02:
	ldr r0, _08001AB8 @ =gUnknown_03002270
	str r0, [r3]
	ldr r0, _08001ABC @ =0x04000040
	str r0, [r3, #4]
	ldr r0, _08001AC0 @ =0x84000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AC4 @ =gUnknown_030018E8
	str r0, [r3]
	ldr r0, _08001AC8 @ =0x04000050
	str r0, [r3, #4]
	ldr r0, _08001ACC @ =0x80000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AD0 @ =gUnknown_030026D0
	str r0, [r3]
	ldr r0, _08001AD4 @ =0x0400004C
	str r0, [r3, #4]
	ldr r0, _08001AD8 @ =0x80000002
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001ADC @ =gUnknown_03002830
	str r0, [r3]
	ldr r0, _08001AE0 @ =0x04000010
	str r0, [r3, #4]
	ldr r0, _08001AE4 @ =0x80000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AE8 @ =gUnknown_03001920
	str r0, [r3]
	ldr r0, _08001AEC @ =0x04000020
	str r0, [r3, #4]
	ldr r0, _08001AF0 @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [r6]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08001B0C
	ldr r2, _08001AF4 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	str r4, [sp]
	mov r0, sp
	str r0, [r3]
	ldr r1, _08001AF8 @ =gUnknown_03002AF0
	str r1, [r3, #4]
	ldr r0, _08001AFC @ =0x85000004
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08001B00 @ =gUnknown_0300188C
	ldrb r0, [r2]
	cmp r0, #0
	beq _08001A86
	ldr r0, _08001B04 @ =gUnknown_030026E0
	str r0, [r3]
	str r1, [r3, #4]
	ldrb r0, [r2]
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08001A86:
	ldr r1, _08001B08 @ =gUnknown_030018E0
	ldrb r0, [r2]
	strb r0, [r1]
	b _08001B1A
	.align 2, 0
_08001A90: .4byte gUnknown_03002840
_08001A94: .4byte 0x040000D4
_08001A98: .4byte gUnknown_030022B0
_08001A9C: .4byte 0x04000008
_08001AA0: .4byte 0x84000002
_08001AA4: .4byte gUnknown_03001840
_08001AA8: .4byte gUnknown_03002880
_08001AAC: .4byte 0x84000080
_08001AB0: .4byte gUnknown_03002060
_08001AB4: .4byte 0x05000200
_08001AB8: .4byte gUnknown_03002270
_08001ABC: .4byte 0x04000040
_08001AC0: .4byte 0x84000003
_08001AC4: .4byte gUnknown_030018E8
_08001AC8: .4byte 0x04000050
_08001ACC: .4byte 0x80000003
_08001AD0: .4byte gUnknown_030026D0
_08001AD4: .4byte 0x0400004C
_08001AD8: .4byte 0x80000002
_08001ADC: .4byte gUnknown_03002830
_08001AE0: .4byte 0x04000010
_08001AE4: .4byte 0x80000008
_08001AE8: .4byte gUnknown_03001920
_08001AEC: .4byte 0x04000020
_08001AF0: .4byte 0x84000008
_08001AF4: .4byte 0x04000200
_08001AF8: .4byte gUnknown_03002AF0
_08001AFC: .4byte 0x85000004
_08001B00: .4byte gUnknown_0300188C
_08001B04: .4byte gUnknown_030026E0
_08001B08: .4byte gUnknown_030018E0
_08001B0C:
	ldr r2, _08001BF8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001BFC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08001C00 @ =gUnknown_030018E0
	strb r4, [r0]
_08001B1A:
	ldr r0, [r6]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08001B42
	ldr r2, _08001C04 @ =0x040000D4
	ldr r0, _08001C08 @ =gUnknown_03001884
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08001C0C @ =gUnknown_03002878
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _08001C10 @ =gUnknown_03002A80
	ldrb r0, [r0]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08001B42:
	ldr r0, _08001C14 @ =gUnknown_030026F4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08001B90
	bl sub_800594C
	ldr r0, _08001C04 @ =0x040000D4
	ldr r3, _08001C18 @ =gUnknown_03004D90
	str r3, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r2, _08001C1C @ =0x80000080
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _08001C20 @ =0x07000100
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _08001C24 @ =0x07000200
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _08001C28 @ =0x07000300
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08001B90:
	movs r4, #0
	ldr r0, _08001C2C @ =gUnknown_03001948
	ldrb r1, [r0]
	cmp r4, r1
	bhs _08001BB4
	ldr r6, _08001C30 @ =gUnknown_030053A0
	adds r5, r0, #0
_08001B9E:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _08001B9E
_08001BB4:
	ldr r0, _08001C34 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08001C44
	movs r0, #0
	str r0, [sp]
	ldr r2, _08001C04 @ =0x040000D4
	mov r1, sp
	str r1, [r2]
	ldr r1, _08001C30 @ =gUnknown_030053A0
	str r1, [r2, #4]
	ldr r0, _08001C38 @ =0x85000004
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _08001C3C @ =gUnknown_03004D50
	ldrb r0, [r3]
	cmp r0, #0
	beq _08001BEE
	ldr r0, _08001C40 @ =gUnknown_03001870
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08001BEE:
	ldr r1, _08001C2C @ =gUnknown_03001948
	ldrb r0, [r3]
	strb r0, [r1]
	b _08001C48
	.align 2, 0
_08001BF8: .4byte 0x04000200
_08001BFC: .4byte 0x0000FFFD
_08001C00: .4byte gUnknown_030018E0
_08001C04: .4byte 0x040000D4
_08001C08: .4byte gUnknown_03001884
_08001C0C: .4byte gUnknown_03002878
_08001C10: .4byte gUnknown_03002A80
_08001C14: .4byte gUnknown_030026F4
_08001C18: .4byte gUnknown_03004D90
_08001C1C: .4byte 0x80000080
_08001C20: .4byte 0x07000100
_08001C24: .4byte 0x07000200
_08001C28: .4byte 0x07000300
_08001C2C: .4byte gUnknown_03001948
_08001C30: .4byte gUnknown_030053A0
_08001C34: .4byte gUnknown_03001840
_08001C38: .4byte 0x85000004
_08001C3C: .4byte gUnknown_03004D50
_08001C40: .4byte gUnknown_03001870
_08001C44:
	ldr r0, _08001C5C @ =gUnknown_03001948
	strb r1, [r0]
_08001C48:
	ldr r1, _08001C60 @ =gUnknown_030026F4
	ldrb r4, [r1]
	cmp r4, #0xff
	bne _08001C52
	movs r4, #0
_08001C52:
	movs r0, #0xff
	strb r0, [r1]
	ldr r5, _08001C64 @ =gUnknown_08097A64
	b _08001C6E
	.align 2, 0
_08001C5C: .4byte gUnknown_03001948
_08001C60: .4byte gUnknown_030026F4
_08001C64: .4byte gUnknown_08097A64
_08001C68:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08001C6E:
	cmp r4, #3
	bhi _08001C84
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	bne _08001C68
	ldr r0, _08001C8C @ =gUnknown_030026F4
	strb r4, [r0]
_08001C84:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001C8C: .4byte gUnknown_030026F4

	thumb_func_start sub_8001C90
sub_8001C90: @ 0x08001C90
	push {r4, lr}
	sub sp, #4
	ldr r1, _08001CC8 @ =gUnknown_0300188C
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08001CCC @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r1, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08001CEA
	ldr r3, _08001CD0 @ =gUnknown_03001884
	ldr r0, _08001CD4 @ =gUnknown_03004D54
	ldr r1, [r3]
	ldr r2, [r0]
	cmp r1, r2
	bne _08001CE0
	ldr r0, _08001CD8 @ =gUnknown_030022C0
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _08001CDC @ =gUnknown_030022AC
	str r2, [r0]
	b _08001CEA
	.align 2, 0
_08001CC8: .4byte gUnknown_0300188C
_08001CCC: .4byte gUnknown_03001840
_08001CD0: .4byte gUnknown_03001884
_08001CD4: .4byte gUnknown_03004D54
_08001CD8: .4byte gUnknown_030022C0
_08001CDC: .4byte gUnknown_030022AC
_08001CE0:
	str r2, [r3]
	ldr r0, _08001D60 @ =gUnknown_030022AC
	ldr r1, _08001D64 @ =gUnknown_030022C0
	ldr r1, [r1]
	str r1, [r0]
_08001CEA:
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	strh r3, [r0]
	ldr r0, _08001D68 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001D6C @ =gUnknown_03004D90
	mov ip, r1
	str r1, [r0, #4]
	ldr r2, _08001D70 @ =0x81000080
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _08001D74 @ =gUnknown_03004D50
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001D60: .4byte gUnknown_030022AC
_08001D64: .4byte gUnknown_030022C0
_08001D68: .4byte 0x040000D4
_08001D6C: .4byte gUnknown_03004D90
_08001D70: .4byte 0x81000080
_08001D74: .4byte gUnknown_03004D50

	thumb_func_start sub_8001D78
sub_8001D78: @ 0x08001D78
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08001E3C @ =gUnknown_03002840
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08001E40 @ =gUnknown_030022B0
	ldr r7, _08001E44 @ =0x04000008
	ldr r2, _08001E48 @ =0x04000002
	adds r1, r7, #0
	bl CpuSet
	ldr r5, _08001E4C @ =gUnknown_03001840
	ldr r0, [r5]
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	beq _08001DB2
	ldr r0, _08001E50 @ =gUnknown_03002880
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, [r5]
	eors r0, r6
	str r0, [r5]
_08001DB2:
	ldr r0, [r5]
	movs r6, #2
	ands r0, r6
	cmp r0, #0
	beq _08001DCC
	ldr r0, _08001E54 @ =gUnknown_03002060
	ldr r1, _08001E58 @ =0x05000200
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, [r5]
	eors r0, r6
	str r0, [r5]
_08001DCC:
	ldr r0, _08001E5C @ =gUnknown_03002270
	ldr r1, _08001E60 @ =0x04000040
	ldr r2, _08001E64 @ =0x04000003
	bl CpuSet
	ldr r0, _08001E68 @ =gUnknown_030018E8
	ldr r1, _08001E6C @ =0x04000050
	movs r2, #3
	bl CpuSet
	ldr r0, _08001E70 @ =gUnknown_030026D0
	ldr r1, _08001E74 @ =0x0400004C
	movs r2, #2
	bl CpuSet
	ldr r0, _08001E78 @ =gUnknown_03002830
	ldr r1, _08001E7C @ =0x04000010
	movs r2, #8
	bl CpuSet
	ldr r0, _08001E80 @ =gUnknown_03001920
	ldr r1, _08001E84 @ =0x04000020
	adds r2, r7, #0
	bl CpuSet
	ldr r0, [r5]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08001EA0
	ldr r2, _08001E88 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	str r4, [sp]
	ldr r5, _08001E8C @ =gUnknown_03002AF0
	ldr r2, _08001E90 @ =0x01000004
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	ldr r4, _08001E94 @ =gUnknown_0300188C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08001E32
	ldr r0, _08001E98 @ =gUnknown_030026E0
	ldrb r2, [r4]
	adds r1, r5, #0
	bl CpuFastSet
_08001E32:
	ldr r1, _08001E9C @ =gUnknown_030018E0
	ldrb r0, [r4]
	strb r0, [r1]
	b _08001EAE
	.align 2, 0
_08001E3C: .4byte gUnknown_03002840
_08001E40: .4byte gUnknown_030022B0
_08001E44: .4byte 0x04000008
_08001E48: .4byte 0x04000002
_08001E4C: .4byte gUnknown_03001840
_08001E50: .4byte gUnknown_03002880
_08001E54: .4byte gUnknown_03002060
_08001E58: .4byte 0x05000200
_08001E5C: .4byte gUnknown_03002270
_08001E60: .4byte 0x04000040
_08001E64: .4byte 0x04000003
_08001E68: .4byte gUnknown_030018E8
_08001E6C: .4byte 0x04000050
_08001E70: .4byte gUnknown_030026D0
_08001E74: .4byte 0x0400004C
_08001E78: .4byte gUnknown_03002830
_08001E7C: .4byte 0x04000010
_08001E80: .4byte gUnknown_03001920
_08001E84: .4byte 0x04000020
_08001E88: .4byte 0x04000200
_08001E8C: .4byte gUnknown_03002AF0
_08001E90: .4byte 0x01000004
_08001E94: .4byte gUnknown_0300188C
_08001E98: .4byte gUnknown_030026E0
_08001E9C: .4byte gUnknown_030018E0
_08001EA0:
	ldr r2, _08001F24 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001F28 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08001F2C @ =gUnknown_030018E0
	strb r4, [r0]
_08001EAE:
	ldr r0, _08001F30 @ =gUnknown_030026F4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08001EC8
	bl sub_800594C
	ldr r0, _08001F34 @ =gUnknown_03004D90
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
_08001EC8:
	movs r4, #0
	ldr r0, _08001F38 @ =gUnknown_03001948
	ldrb r1, [r0]
	cmp r4, r1
	bhs _08001EEC
	ldr r6, _08001F3C @ =gUnknown_030053A0
	adds r5, r0, #0
_08001ED6:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _08001ED6
_08001EEC:
	ldr r0, _08001F40 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08001F50
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r5, _08001F3C @ =gUnknown_030053A0
	ldr r2, _08001F44 @ =0x01000004
	adds r1, r5, #0
	bl CpuFastSet
	ldr r4, _08001F48 @ =gUnknown_03004D50
	ldrb r0, [r4]
	cmp r0, #0
	beq _08001F1A
	ldr r0, _08001F4C @ =gUnknown_03001870
	ldrb r2, [r4]
	adds r1, r5, #0
	bl CpuFastSet
_08001F1A:
	ldr r1, _08001F38 @ =gUnknown_03001948
	ldrb r0, [r4]
	strb r0, [r1]
	b _08001F54
	.align 2, 0
_08001F24: .4byte 0x04000200
_08001F28: .4byte 0x0000FFFD
_08001F2C: .4byte gUnknown_030018E0
_08001F30: .4byte gUnknown_030026F4
_08001F34: .4byte gUnknown_03004D90
_08001F38: .4byte gUnknown_03001948
_08001F3C: .4byte gUnknown_030053A0
_08001F40: .4byte gUnknown_03001840
_08001F44: .4byte 0x01000004
_08001F48: .4byte gUnknown_03004D50
_08001F4C: .4byte gUnknown_03001870
_08001F50:
	ldr r0, _08001F68 @ =gUnknown_03001948
	strb r1, [r0]
_08001F54:
	ldr r1, _08001F6C @ =gUnknown_030026F4
	ldrb r4, [r1]
	cmp r4, #0xff
	bne _08001F5E
	movs r4, #0
_08001F5E:
	movs r0, #0xff
	strb r0, [r1]
	ldr r5, _08001F70 @ =gUnknown_08097A64
	b _08001F7A
	.align 2, 0
_08001F68: .4byte gUnknown_03001948
_08001F6C: .4byte gUnknown_030026F4
_08001F70: .4byte gUnknown_08097A64
_08001F74:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08001F7A:
	cmp r4, #3
	bhi _08001F90
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	bne _08001F74
	ldr r0, _08001F98 @ =gUnknown_030026F4
	strb r4, [r0]
_08001F90:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001F98: .4byte gUnknown_030026F4

	thumb_func_start sub_8001F9C
sub_8001F9C: @ 0x08001F9C
	push {r4, r5, r6, lr}
	ldr r4, _08002028 @ =0x040000B0
	ldrh r1, [r4, #0xa]
	ldr r0, _0800202C @ =0x0000C5FF
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _08002030 @ =0x00007FFF
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl sub_8094C4C
	ldr r1, _08002034 @ =gUnknown_03007FF8
	ldrh r0, [r1]
	movs r2, #1
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _08002038 @ =gUnknown_030053B4
	strb r2, [r0]
	ldr r5, _0800203C @ =gUnknown_03002790
	ldr r3, [r5]
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _08002054
	ldr r2, _08002040 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	adds r2, r4, #0
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r6, r5, #0
	ldr r4, _08002044 @ =gUnknown_03001884
	ldr r5, _08002048 @ =gUnknown_03002878
	ldr r3, _0800204C @ =gUnknown_03002A80
	cmp r0, #0
	bge _08001FF6
_08001FEE:
	ldr r0, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _08001FEE
_08001FF6:
	ldr r2, _08002028 @ =0x040000B0
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, [r5]
	str r0, [r2, #4]
	ldrb r0, [r3]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrb r1, [r3]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r5]
	str r0, [r2, #4]
	ldrb r0, [r3]
	lsrs r0, r0, #1
	ldr r1, _08002050 @ =0xA2600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0800206A
	.align 2, 0
_08002028: .4byte 0x040000B0
_0800202C: .4byte 0x0000C5FF
_08002030: .4byte 0x00007FFF
_08002034: .4byte gUnknown_03007FF8
_08002038: .4byte gUnknown_030053B4
_0800203C: .4byte gUnknown_03002790
_08002040: .4byte 0x04000200
_08002044: .4byte gUnknown_03001884
_08002048: .4byte gUnknown_03002878
_0800204C: .4byte gUnknown_03002A80
_08002050: .4byte 0xA2600000
_08002054:
	ldr r4, _080020AC @ =gUnknown_03002878
	ldr r0, [r4]
	adds r6, r5, #0
	cmp r0, #0
	beq _0800206A
	ldr r2, _080020B0 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080020B4 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	str r3, [r4]
_0800206A:
	ldr r0, [r6]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080020C4
	ldr r2, _080020B8 @ =0x04000004
	ldrh r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080020BC @ =gUnknown_03002874
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2]
	ldr r0, _080020C0 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	orrs r0, r3
	strh r0, [r2]
	ldr r2, _080020B0 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	b _080020E0
	.align 2, 0
_080020AC: .4byte gUnknown_03002878
_080020B0: .4byte 0x04000200
_080020B4: .4byte 0x0000FFFD
_080020B8: .4byte 0x04000004
_080020BC: .4byte gUnknown_03002874
_080020C0: .4byte 0x0000FFFB
_080020C4:
	ldr r2, _08002190 @ =0x04000004
	ldrh r3, [r2]
	ldr r1, _08002194 @ =0x0000FFFB
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2]
	ldr r0, _08002198 @ =0x0000FFDF
	ands r0, r3
	strh r0, [r2]
	ldr r2, _0800219C @ =0x04000200
	ldrh r0, [r2]
	ands r1, r0
	strh r1, [r2]
_080020E0:
	ldr r2, [r6]
	movs r3, #0x80
	lsls r3, r3, #8
	ands r2, r3
	cmp r2, #0
	bne _0800217A
	ldr r0, _080021A0 @ =0x04000130
	ldrh r1, [r0]
	movs r0, #0xf
	adds r5, r0, #0
	bics r5, r1
	cmp r5, #0xf
	bne _0800217A
	ldr r4, _080021A4 @ =gUnknown_03001840
	ldr r0, [r4]
	orrs r0, r3
	str r0, [r4]
	ldr r0, _0800219C @ =0x04000200
	strh r2, [r0]
	adds r0, #8
	strh r2, [r0]
	ldr r0, _08002190 @ =0x04000004
	strh r2, [r0]
	bl sub_8095460
	bl sub_8095930
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	ldr r1, _080021A8 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _080021AC @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _080021B0 @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _080021B4 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	ldr r0, _080021B8 @ =gUnknown_03002290
	strh r5, [r0]
	movs r0, #0x20
	bl sub_08097134
_0800217A:
	ldr r1, _080021BC @ =gUnknown_03002264
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _080021C0 @ =0x04000202
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002190: .4byte 0x04000004
_08002194: .4byte 0x0000FFFB
_08002198: .4byte 0x0000FFDF
_0800219C: .4byte 0x04000200
_080021A0: .4byte 0x04000130
_080021A4: .4byte gUnknown_03001840
_080021A8: .4byte 0x040000B0
_080021AC: .4byte 0x0000C5FF
_080021B0: .4byte 0x00007FFF
_080021B4: .4byte 0x040000D4
_080021B8: .4byte gUnknown_03002290
_080021BC: .4byte gUnknown_03002264
_080021C0: .4byte 0x04000202

	thumb_func_start sub_80021C4
sub_80021C4: @ 0x080021C4
	push {r4, r5, r6, r7, lr}
	ldr r2, _08002210 @ =gUnknown_03004D5C
	ldr r0, _08002214 @ =gUnknown_03002A84
	ldrb r1, [r2]
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r1, r0
	beq _08002272
	ldr r1, _08002218 @ =gUnknown_030027A0
	mov ip, r1
	adds r6, r2, #0
_080021DA:
	ldrb r0, [r6]
	lsls r0, r0, #2
	add r0, ip
	ldr r2, [r0]
	ldrh r0, [r2, #8]
	cmp r0, #0
	beq _0800224E
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #3
	ldr r3, _0800221C @ =0x040000D4
_080021F0:
	cmp r0, r5
	bls _08002228
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldr r0, _08002220 @ =0x80000200
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _08002224 @ =0xFFFFFC00
	adds r0, r1, #0
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	b _08002244
	.align 2, 0
_08002210: .4byte gUnknown_03004D5C
_08002214: .4byte gUnknown_03002A84
_08002218: .4byte gUnknown_030027A0
_0800221C: .4byte 0x040000D4
_08002220: .4byte 0x80000200
_08002224: .4byte 0xFFFFFC00
_08002228:
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldrh r0, [r2, #8]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r0, #0
_08002244:
	strh r0, [r2, #8]
	adds r4, r4, r5
	ldrh r0, [r2, #8]
	cmp r0, #0
	bne _080021F0
_0800224E:
	ldrb r0, [r6]
	adds r2, r0, #1
	movs r0, #0x1f
	ands r2, r0
	strb r2, [r6]
	ldr r0, _08002268 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800226C
	movs r0, #0
	b _08002274
	.align 2, 0
_08002268: .4byte 0x04000004
_0800226C:
	ldrb r0, [r7]
	cmp r2, r0
	bne _080021DA
_08002272:
	movs r0, #1
_08002274:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800227C
sub_800227C: @ 0x0800227C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r7, _080022B0 @ =gUnknown_030022A0
	ldr r0, _080022B4 @ =gUnknown_03002700
	mov sb, r0
	ldr r1, _080022B8 @ =gUnknown_03002850
	mov r8, r1
	ldr r4, _080022BC @ =gUnknown_03002290
	ldr r0, _080022C0 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _080022C4 @ =0x000003FF
	adds r0, r2, #0
	bics r0, r1
	strh r0, [r4]
	ldr r1, _080022C8 @ =gUnknown_03001880
	strh r0, [r1]
	ldr r0, _080022CC @ =gUnknown_030053C0
	ldrb r0, [r0, #8]
	cmp r0, #1
	bne _080022D0
	ldrh r0, [r4]
	bl sub_8007DBC
	b _080022DA
	.align 2, 0
_080022B0: .4byte gUnknown_030022A0
_080022B4: .4byte gUnknown_03002700
_080022B8: .4byte gUnknown_03002850
_080022BC: .4byte gUnknown_03002290
_080022C0: .4byte 0x04000130
_080022C4: .4byte 0x000003FF
_080022C8: .4byte gUnknown_03001880
_080022CC: .4byte gUnknown_030053C0
_080022D0:
	cmp r0, #2
	bne _080022DA
	bl sub_8007D8C
	strh r0, [r4]
_080022DA:
	ldr r2, _08002320 @ =gUnknown_03002ADC
	ldr r6, _08002324 @ =gUnknown_03002290
	ldr r5, _08002328 @ =gUnknown_03002A88
	ldrh r3, [r6]
	ldrh r4, [r5]
	adds r0, r3, #0
	eors r0, r4
	adds r1, r0, #0
	ands r1, r3
	strh r1, [r2]
	ldr r2, _0800232C @ =gUnknown_0300270C
	ands r0, r4
	strh r0, [r2]
	strh r3, [r5]
	ldr r0, _08002330 @ =gUnknown_030022B8
	strh r1, [r0]
	movs r1, #0
	mov ip, r6
	movs r6, #1
	adds r5, r0, #0
_08002302:
	mov r3, ip
	ldrh r0, [r3]
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	asrs r0, r2
	ands r0, r6
	adds r4, r1, #0
	cmp r0, #0
	bne _08002334
	adds r0, r7, r2
	mov r3, sb
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _08002352
	.align 2, 0
_08002320: .4byte gUnknown_03002ADC
_08002324: .4byte gUnknown_03002290
_08002328: .4byte gUnknown_03002A88
_0800232C: .4byte gUnknown_0300270C
_08002330: .4byte gUnknown_030022B8
_08002334:
	adds r3, r7, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _08002340
	subs r0, #1
	b _08002350
_08002340:
	adds r0, r6, #0
	lsls r0, r2
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
_08002350:
	strb r0, [r3]
_08002352:
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r4, r2
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _08002302
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800236C
sub_800236C: @ 0x0800236C
	push {r4, r5, r6, lr}
	ldr r0, _080023AC @ =0x04000006
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0x9f
	bhi _0800239E
	movs r4, #0
	ldr r0, _080023B0 @ =gUnknown_030018E0
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0800239E
	ldr r6, _080023B4 @ =gUnknown_03002AF0
_08002384:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080023B0 @ =gUnknown_030018E0
	ldrb r0, [r0]
	cmp r4, r0
	blo _08002384
_0800239E:
	ldr r1, _080023B8 @ =0x04000202
	movs r0, #2
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080023AC: .4byte 0x04000006
_080023B0: .4byte gUnknown_030018E0
_080023B4: .4byte gUnknown_03002AF0
_080023B8: .4byte 0x04000202
