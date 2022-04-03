	.syntax unified
    .text
    
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08001A90 @ =gDispCnt
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08001A94 @ =0x040000D4
	ldr r0, _08001A98 @ =gBgCntRegs
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
	ldr r0, _08001AA8 @ =gBgPalette
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
	ldr r0, _08001AB0 @ =gObjPalette
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
	ldr r0, _08001AB8 @ =gWinRegs
	str r0, [r3]
	ldr r0, _08001ABC @ =0x04000040
	str r0, [r3, #4]
	ldr r0, _08001AC0 @ =0x84000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AC4 @ =gBldRegs
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
	ldr r0, _08001ADC @ =gBgScrollRegs
	str r0, [r3]
	ldr r0, _08001AE0 @ =0x04000010
	str r0, [r3, #4]
	ldr r0, _08001AE4 @ =0x80000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AE8 @ =gBgAffineRegs
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
_08001A90: .4byte gDispCnt
_08001A94: .4byte 0x040000D4
_08001A98: .4byte gBgCntRegs
_08001A9C: .4byte 0x04000008
_08001AA0: .4byte 0x84000002
_08001AA4: .4byte gUnknown_03001840
_08001AA8: .4byte gBgPalette
_08001AAC: .4byte 0x84000080
_08001AB0: .4byte gObjPalette
_08001AB4: .4byte 0x05000200
_08001AB8: .4byte gWinRegs
_08001ABC: .4byte 0x04000040
_08001AC0: .4byte 0x84000003
_08001AC4: .4byte gBldRegs
_08001AC8: .4byte 0x04000050
_08001ACC: .4byte 0x80000003
_08001AD0: .4byte gUnknown_030026D0
_08001AD4: .4byte 0x0400004C
_08001AD8: .4byte 0x80000002
_08001ADC: .4byte gBgScrollRegs
_08001AE0: .4byte 0x04000010
_08001AE4: .4byte 0x80000008
_08001AE8: .4byte gBgAffineRegs
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
	bl DrawToOamBuffer
	ldr r0, _08001C04 @ =0x040000D4
	ldr r3, _08001C18 @ =gOamBuffer
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
_08001C18: .4byte gOamBuffer
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
	.syntax divided
