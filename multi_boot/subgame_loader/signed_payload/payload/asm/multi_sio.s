.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start MultiSioInit
MultiSioInit: @ 0x0203B8C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, _0203B984 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _0203B988 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203B98C @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0203B990 @ =0x04000134
	strh r4, [r0]
	subs r2, #0xd8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2]
	ldrh r0, [r2]
	ldr r3, _0203B994 @ =0x00004003
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [sp]
	ldr r4, _0203B998 @ =gMultiSioArea
	ldr r2, _0203B99C @ =0x0500007A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _0203B9A0 @ =MultiSioRecvBufChange
	ldr r1, _0203B9A4 @ =gMultiSioRecvFuncBuf
	ldr r2, _0203B9A8 @ =0x04000010
	bl CpuSet
	ldr r0, _0203B9AC @ =MultiSioIntr
	ldr r1, _0203B9B0 @ =gUnknown_030004C0
	ldr r2, _0203B9B4 @ =0x04000048
	bl CpuSet
	strb r5, [r4, #2]
	movs r0, #0xd
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x60
	str r0, [r4, #0x28]
	adds r0, #0x1c
	str r0, [r4, #0x2c]
	movs r3, #0
	adds r2, r4, #0
	movs r0, #0x30
	adds r0, r0, r2
	mov ip, r0
	adds r6, r2, #0
	adds r6, #0xd0
	adds r7, r2, #0
	adds r7, #0x40
	adds r5, r2, #0
	adds r5, #0x98
	movs r4, #0
_0203B940:
	lsls r0, r3, #2
	mov r1, ip
	adds r1, #4
	mov ip, r1
	subs r1, #4
	stm r1!, {r5}
	adds r1, r2, #0
	adds r1, #0xb4
	adds r1, r4, r1
	stm r7!, {r1}
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r0, r1
	str r6, [r0]
	adds r6, #0x54
	adds r5, #0x54
	adds r4, #0x54
	adds r3, #1
	cmp r3, #3
	ble _0203B940
	ldr r3, _0203B984 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0203B988 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0203B984: .4byte 0x04000208
_0203B988: .4byte 0x04000200
_0203B98C: .4byte 0x0000FF3F
_0203B990: .4byte 0x04000134
_0203B994: .4byte 0x00004003
_0203B998: .4byte gMultiSioArea
_0203B99C: .4byte 0x0500007A
_0203B9A0: .4byte MultiSioRecvBufChange
_0203B9A4: .4byte gMultiSioRecvFuncBuf
_0203B9A8: .4byte 0x04000010
_0203B9AC: .4byte MultiSioIntr
_0203B9B0: .4byte gUnknown_030004C0
_0203B9B4: .4byte 0x04000048

	thumb_func_start MultiSioMain
MultiSioMain: @ 0x0203B9B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov ip, r1
	mov r8, r2
	ldr r5, _0203B9D8 @ =0x04000128
	ldr r6, [r5]
	ldr r7, _0203B9DC @ =gMultiSioArea
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0203B9E0
	cmp r0, #1
	beq _0203BA48
	b _0203BA56
	.align 2, 0
_0203B9D8: .4byte 0x04000128
_0203B9DC: .4byte gMultiSioArea
_0203B9E0:
	movs r1, #0x30
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0203BA42
	movs r0, #0x88
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #8
	bne _0203BA56
	movs r1, #4
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0203BA42
	ldr r0, [r7, #0x14]
	cmp r0, #0xd
	bne _0203BA42
	ldr r3, _0203BA88 @ =0x04000208
	strh r1, [r3]
	ldr r2, _0203BA8C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203BA90 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldrb r1, [r5, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r1, _0203BA94 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #0xf6
	ldr r0, _0203BA98 @ =0x0000BBBC
	str r0, [r1]
	strb r4, [r7]
	ldrb r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5]
_0203BA42:
	ldr r1, _0203BA9C @ =gMultiSioArea
	movs r0, #1
	strb r0, [r1, #1]
_0203BA48:
	mov r0, ip
	bl MultiSioRecvDataCheck
	mov r0, sb
	mov r1, r8
	bl MultiSioSendDataSet
_0203BA56:
	ldr r1, _0203BA9C @ =gMultiSioArea
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	ldrb r3, [r1, #3]
	ldrb r2, [r1, #8]
	movs r0, #0x10
	ands r0, r2
	orrs r3, r0
	movs r0, #0x20
	ands r0, r2
	orrs r3, r0
	movs r0, #0x40
	ands r0, r2
	orrs r3, r0
	ldrb r0, [r1, #2]
	lsls r2, r0, #8
	ldrb r0, [r1]
	cmp r0, #8
	bne _0203BAA0
	movs r0, #0x80
	orrs r0, r2
	orrs r0, r3
	b _0203BAA4
	.align 2, 0
_0203BA88: .4byte 0x04000208
_0203BA8C: .4byte 0x04000200
_0203BA90: .4byte 0x0000FF7F
_0203BA94: .4byte 0x04000202
_0203BA98: .4byte 0x0000BBBC
_0203BA9C: .4byte gMultiSioArea
_0203BAA0:
	adds r0, r3, #0
	orrs r0, r2
_0203BAA4:
	adds r2, r0, #0
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _0203BAB2
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
_0203BAB2:
	adds r1, r2, #0
	lsls r0, r6, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #3
	bls _0203BAC2
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_0203BAC2:
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start MultiSioSendDataSet
MultiSioSendDataSet: @ 0x0203BAD0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _0203BB90 @ =gMultiSioArea
	ldr r4, [r5, #0x28]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #4
	ldrb r3, [r4, #1]
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r1
	strb r2, [r4, #1]
	ldr r6, [r5, #0x28]
	ldr r1, _0203BB94 @ =gSio32MultiLoadArea
	ldrb r1, [r1, #3]
	movs r3, #1
	adds r2, r3, #0
	ands r2, r1
	lsls r2, r2, #5
	ldrb r4, [r6, #1]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r2
	strb r1, [r6, #1]
	ldr r4, [r5, #0x28]
	ldrb r1, [r5, #8]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldrb r2, [r4, #1]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r3
	strb r1, [r4, #1]
	ldr r2, [r5, #0x28]
	ldrb r1, [r5, #0xb]
	strb r1, [r2]
	ldr r4, [r5, #0x28]
	ldrb r2, [r5, #2]
	ldrb r1, [r5, #3]
	eors r2, r1
	movs r1, #0xf
	ands r2, r1
	ldrb r3, [r4, #1]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r4, #1]
	ldr r1, [r5, #0x28]
	strh r7, [r1, #2]
	ldr r1, [r5, #0x28]
	adds r1, #4
	ldr r2, _0203BB98 @ =0x04000005
	bl CpuSet
	movs r2, #0
	ldr r1, [r5, #0x28]
_0203BB4C:
	ldrh r0, [r1]
	adds r7, r7, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _0203BB4C
	adds r2, r5, #0
	ldr r1, [r2, #0x28]
	mvns r0, r7
	strh r0, [r1, #2]
	ldrb r0, [r2]
	cmp r0, #0
	beq _0203BB6C
	ldr r1, _0203BB9C @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
_0203BB6C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x14]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0203BB88
	ldrb r1, [r5, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0203BB88
	ldr r1, _0203BB9C @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_0203BB88:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0203BB90: .4byte gMultiSioArea
_0203BB94: .4byte gSio32MultiLoadArea
_0203BB98: .4byte 0x04000005
_0203BB9C: .4byte 0x0400010E

	thumb_func_start MultiSioRecvDataCheck
MultiSioRecvDataCheck: @ 0x0203BBA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, _0203BCAC @ =gMultiSioRecvFuncBuf
	movs r4, #0
	str r4, [sp]
	bl _call_via_r0
	str r0, [sp, #4]
	ldr r0, _0203BCB0 @ =gMultiSioArea
	strb r4, [r0, #3]
	add r1, sp, #4
	mov sl, r1
	add r2, sp, #8
	mov sb, r2
	adds r5, r0, #0
	adds r6, r5, #0
	movs r7, #0x50
	adds r7, r7, r6
	mov r8, r7
_0203BBD0:
	movs r3, #0
	movs r2, #0
	lsls r5, r4, #2
	adds r0, r4, #1
	str r0, [sp, #0x10]
	mov r1, r8
	adds r0, r5, r1
	ldr r1, [r0]
_0203BBE0:
	ldrh r0, [r1]
	adds r3, r3, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _0203BBE0
	mov r2, sl
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0203BC42
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, r7
	bne _0203BC42
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6, #3]
	orrs r0, r1
	strb r0, [r6, #3]
	ldrb r2, [r6, #8]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	mov r0, r8
	adds r3, r5, r0
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	lsls r0, r4
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	subs r7, #0xf
	adds r1, r7, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r6, #8]
	ldr r0, [r3]
	adds r0, #4
	adds r1, r5, r4
	lsls r1, r1, #2
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	ldr r2, _0203BCB4 @ =0x04000005
	bl CpuSet
_0203BC42:
	movs r0, #0
	str r0, [sp, #8]
	mov r7, r8
	adds r0, r5, r7
	ldr r1, [r0]
	adds r1, #4
	mov r0, sb
	ldr r2, _0203BCB8 @ =0x05000005
	bl CpuSet
	ldr r4, [sp, #0x10]
	cmp r4, #3
	ble _0203BBD0
	ldr r0, _0203BCB0 @ =gMultiSioArea
	ldrb r1, [r0, #2]
	ldrb r2, [r0, #3]
	adds r3, r1, #0
	orrs r3, r2
	strb r3, [r0, #2]
	movs r1, #1
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0203BCF8
	ldrb r0, [r5]
	cmp r0, #8
	bne _0203BCBC
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	beq _0203BC90
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	bne _0203BC90
	ldrb r0, [r5, #8]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #8]
_0203BC90:
	ldrb r4, [r5, #8]
	lsls r2, r4, #0x1c
	lsrs r2, r2, #0x1c
	movs r0, #0xe
	ldrb r3, [r5, #2]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _0203BCDC
	movs r0, #0x40
	orrs r0, r4
	b _0203BCDA
	.align 2, 0
_0203BCAC: .4byte gMultiSioRecvFuncBuf
_0203BCB0: .4byte gMultiSioArea
_0203BCB4: .4byte 0x04000005
_0203BCB8: .4byte 0x05000005
_0203BCBC:
	ldrb r2, [r5, #8]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1f
	ldr r0, [r5, #0x50]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	orrs r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
_0203BCDA:
	strb r0, [r5, #8]
_0203BCDC:
	ldrb r2, [r5, #8]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1f
	ldr r0, [r5, #0x50]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	orrs r0, r1
	lsls r0, r0, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #8]
_0203BCF8:
	ldrb r0, [r5, #3]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MultiSioStart
MultiSioStart: @ 0x0203BD0C
	push {lr}
	ldr r2, _0203BD24 @ =gMultiSioArea
	ldrb r0, [r2]
	cmp r0, #0
	beq _0203BD1E
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
_0203BD1E:
	pop {r0}
	bx r0
	.align 2, 0
_0203BD24: .4byte gMultiSioArea

	thumb_func_start MultiSioStop
MultiSioStop: @ 0x0203BD28
	ldr r3, _0203BD5C @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0203BD60 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203BD64 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _0203BD68 @ =0x04000128
	ldr r2, _0203BD6C @ =0x00002003
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x1c
	ldr r0, _0203BD70 @ =0x0000BBBC
	str r0, [r1]
	adds r1, #0xf6
	movs r0, #0xc0
	strh r0, [r1]
	ldr r2, _0203BD74 @ =gMultiSioArea
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	bx lr
	.align 2, 0
_0203BD5C: .4byte 0x04000208
_0203BD60: .4byte 0x04000200
_0203BD64: .4byte 0x0000FF3F
_0203BD68: .4byte 0x04000128
_0203BD6C: .4byte 0x00002003
_0203BD70: .4byte 0x0000BBBC
_0203BD74: .4byte gMultiSioArea
