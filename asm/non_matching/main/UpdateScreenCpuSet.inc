	.syntax unified
    .text

	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08001E3C @ =gDispCnt
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
	ldr r0, _08001E50 @ =gBgPalette
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
	ldr r0, _08001E54 @ =gObjPalette
	ldr r1, _08001E58 @ =0x05000200
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, [r5]
	eors r0, r6
	str r0, [r5]
_08001DCC:
	ldr r0, _08001E5C @ =gWinRegs
	ldr r1, _08001E60 @ =0x04000040
	ldr r2, _08001E64 @ =0x04000003
	bl CpuSet
	ldr r0, _08001E68 @ =gBldRegs
	ldr r1, _08001E6C @ =0x04000050
	movs r2, #3
	bl CpuSet
	ldr r0, _08001E70 @ =gUnknown_030026D0
	ldr r1, _08001E74 @ =0x0400004C
	movs r2, #2
	bl CpuSet
	ldr r0, _08001E78 @ =gBgScrollRegs
	ldr r1, _08001E7C @ =0x04000010
	movs r2, #8
	bl CpuSet
	ldr r0, _08001E80 @ =gBgAffineRegs
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
_08001E3C: .4byte gDispCnt
_08001E40: .4byte gUnknown_030022B0
_08001E44: .4byte 0x04000008
_08001E48: .4byte 0x04000002
_08001E4C: .4byte gUnknown_03001840
_08001E50: .4byte gBgPalette
_08001E54: .4byte gObjPalette
_08001E58: .4byte 0x05000200
_08001E5C: .4byte gWinRegs
_08001E60: .4byte 0x04000040
_08001E64: .4byte 0x04000003
_08001E68: .4byte gBldRegs
_08001E6C: .4byte 0x04000050
_08001E70: .4byte gUnknown_030026D0
_08001E74: .4byte 0x0400004C
_08001E78: .4byte gBgScrollRegs
_08001E7C: .4byte 0x04000010
_08001E80: .4byte gBgAffineRegs
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
	ldr r0, _08001F34 @ =gOamBuffer
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
_08001F34: .4byte gOamBuffer
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
	.syntax divided
