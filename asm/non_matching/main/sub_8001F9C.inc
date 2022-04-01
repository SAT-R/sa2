	.syntax unified
    .text

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
	ldr r0, _080021B8 @ =gInput
	strh r5, [r0]
	movs r0, #0x20
	bl SoftReset
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
_080021B8: .4byte gInput
_080021BC: .4byte gUnknown_03002264
_080021C0: .4byte 0x04000202
	.syntax divided
