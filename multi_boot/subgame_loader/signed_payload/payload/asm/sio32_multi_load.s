.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"
.include "../../../../constants/multi_sio_constants.inc"

	.syntax unified

	.text

	thumb_func_start Sio32MultiLoadMain
Sio32MultiLoadMain: @ 0x0203BD78
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _0203BD94 @ =gSio32MultiLoadArea
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #4
	bls _0203BD88
	b _0203BF4E
_0203BD88:
	lsls r0, r1, #2
	ldr r1, _0203BD98 @ =_0203BD9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0203BD94: .4byte gSio32MultiLoadArea
_0203BD98: .4byte _0203BD9C
_0203BD9C: @ jump table
	.4byte _0203BDB0 @ case 0
	.4byte _0203BDC8 @ case 1
	.4byte _0203BE64 @ case 2
	.4byte _0203BED6 @ case 3
	.4byte _0203BF44 @ case 4
_0203BDB0:
	ldr r0, [r5]
	ldr r1, _0203BDC4 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	bne _0203BDBC
	b _0203BF4E
_0203BDBC:
	movs r0, #1
	strb r0, [r5, #1]
	b _0203BF4E
	.align 2, 0
_0203BDC4: .4byte 0x00FF00FF
_0203BDC8:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0203BDD8
	ldrb r0, [r5, #2]
	cmp r0, #5
	bhi _0203BDD6
	b _0203BF4E
_0203BDD6:
	b _0203BDE2
_0203BDD8:
	ldr r1, _0203BE18 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
_0203BDE2:
	ldr r0, _0203BE1C @ =0x04000120
	movs r6, #0
	str r6, [r0]
	ldr r1, _0203BE20 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	ldrb r4, [r5]
	cmp r4, #1
	bne _0203BE30
	ldr r2, _0203BE18 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0203BE24 @ =0x0400010C
	ldr r0, _0203BE28 @ =0x00C0F318
	str r0, [r1]
	ldr r3, _0203BE2C @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r3]
	b _0203BE50
	.align 2, 0
_0203BE18: .4byte 0x04000128
_0203BE1C: .4byte 0x04000120
_0203BE20: .4byte 0x04000202
_0203BE24: .4byte 0x0400010C
_0203BE28: .4byte 0x00C0F318
_0203BE2C: .4byte 0x04000208
_0203BE30:
	ldr r2, _0203BE5C @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x81
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _0203BE60 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
_0203BE50:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #2
	strb r0, [r5, #1]
	b _0203BF4E
	.align 2, 0
_0203BE5C: .4byte 0x04000128
_0203BE60: .4byte 0x04000208
_0203BE64:
	ldr r6, [r5, #8]
	adds r4, r6, #0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0203BE74
	adds r4, r0, #0
	b _0203BE7A
_0203BE74:
	cmp r6, #0
	bge _0203BE7A
	movs r4, #0
_0203BE7A:
	cmp r2, #0
	beq _0203BE80
	str r4, [r2]
_0203BE80:
	ldrb r0, [r5]
	cmp r0, #1
	beq _0203BEC2
	ldr r0, [r5, #0x14]
	cmp r0, r4
	bge _0203BEA6
	adds r3, r5, #0
	ldr r7, [r5, #4]
_0203BE90:
	ldr r2, [r3, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r7
	ldr r1, [r3, #0x10]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r3, #0x10]
	adds r2, #1
	str r2, [r3, #0x14]
	cmp r2, r4
	blt _0203BE90
_0203BEA6:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0203BECA
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0203BEC2
	movs r0, #1
	strb r0, [r5, #3]
_0203BEC2:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	bgt _0203BED0
_0203BECA:
	ldrb r0, [r5, #2]
	cmp r0, #0x8c
	bne _0203BF4E
_0203BED0:
	movs r0, #3
	strb r0, [r5, #1]
	b _0203BF4E
_0203BED6:
	ldr r3, _0203BF28 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _0203BF2C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203BF30 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _0203BF34 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	adds r0, #3
	str r0, [r1]
	ldr r2, _0203BF38 @ =0x04000120
	movs r0, #0
	movs r1, #0
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0203BF14
	ldr r1, _0203BF3C @ =0x0400010C
	movs r0, #0
	str r0, [r1]
_0203BF14:
	ldr r0, _0203BF40 @ =0x04000202
	movs r1, #0xc0
	strh r1, [r0]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0203BF4A
	strb r4, [r5, #2]
	movs r0, #4
	strb r0, [r5, #1]
	b _0203BF4E
	.align 2, 0
_0203BF28: .4byte 0x04000208
_0203BF2C: .4byte 0x04000200
_0203BF30: .4byte 0x0000FF3F
_0203BF34: .4byte 0x04000128
_0203BF38: .4byte 0x04000120
_0203BF3C: .4byte 0x0400010C
_0203BF40: .4byte 0x04000202
_0203BF44:
	ldrb r0, [r5, #2]
	cmp r0, #2
	bls _0203BF4E
_0203BF4A:
	movs r0, #1
	b _0203BF56
_0203BF4E:
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	movs r0, #0
_0203BF56:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	
    thumb_func_start Sio32MultiLoadIntr
Sio32MultiLoadIntr: @ 0x0203BF5C
	push {r4, r5, lr}
	ldr r2, _0203BF80 @ =0x04000120
	ldr r3, [r2]
	ldr r5, _0203BF84 @ =gSio32MultiLoadArea
	ldrb r0, [r5]
	adds r4, r5, #0
	cmp r0, #1
	beq _0203BF8C
	ldr r0, _0203BF88 @ =0x04000128
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	ldr r2, [r4, #8]
	cmp r2, #0
	bge _0203BFD8
	b _0203BFC6
	.align 2, 0
_0203BF80: .4byte 0x04000120
_0203BF84: .4byte gSio32MultiLoadArea
_0203BF88: .4byte 0x04000128
_0203BF8C:
	ldr r1, _0203BFA0 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4, #8]
	cmp r1, #0
	bge _0203BFA8
	ldr r0, _0203BFA4 @ =0xFEFEFEFE
	str r0, [r2]
	b _0203BFEE
	.align 2, 0
_0203BFA0: .4byte 0x0400010E
_0203BFA4: .4byte 0xFEFEFEFE
_0203BFA8:
	ldr r0, _0203BFBC @ =0x00001FFF
	cmp r1, r0
	bgt _0203BFC0
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _0203BFEE
	.align 2, 0
_0203BFBC: .4byte 0x00001FFF
_0203BFC0:
	ldr r0, [r4, #0xc]
	str r0, [r2]
	b _0203BFEE
_0203BFC6:
	ldr r0, _0203BFD4 @ =0xFEFEFEFE
	cmp r3, r0
	beq _0203BFEE
	subs r0, r2, #1
	str r0, [r5, #8]
	b _0203BFEE
	.align 2, 0
_0203BFD4: .4byte 0xFEFEFEFE
_0203BFD8:
	ldr r0, _0203BFE8 @ =0x00001FFF
	cmp r2, r0
	bgt _0203BFEC
	ldr r1, [r4, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	str r3, [r0]
	b _0203BFEE
	.align 2, 0
_0203BFE8: .4byte 0x00001FFF
_0203BFEC:
	str r3, [r4, #0xc]
_0203BFEE:
	ldr r1, [r4, #8]
	ldr r0, _0203C018 @ =0x00002002
	cmp r1, r0
	bgt _0203C010
	adds r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r4]
	cmp r0, #1
	bne _0203C010
	ldr r2, _0203C01C @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0203C020 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_0203C010:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0203C018: .4byte 0x00002002
_0203C01C: .4byte 0x04000128
_0203C020: .4byte 0x0400010E

	thumb_func_start Sio32MultiLoadInit
Sio32MultiLoadInit: @ 0x0203C024
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	ldr r3, _0203C0A0 @ =0x04000208
	strh r6, [r3]
	ldr r2, _0203C0A4 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203C0A8 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	mov r8, r0
	strh r0, [r3]
	str r6, [sp]
	ldr r4, _0203C0AC @ =gSio32MultiLoadArea
	ldr r2, _0203C0B0 @ =0x05000006
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _0203C0B4 @ =0x04000128
	ldr r0, _0203C0B8 @ =0x00002003
	str r0, [r1]
	str r7, [r4, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #8]
	cmp r5, #0
	beq _0203C092
	ldr r0, _0203C0BC @ =0x0400010C
	str r6, [r0]
	mov r2, r8
	strb r2, [r4]
	adds r1, r7, #0
	movs r2, #0x80
	lsls r2, r2, #6
_0203C074:
	ldm r1!, {r0}
	adds r6, r6, r0
	subs r2, #1
	cmp r2, #0
	bne _0203C074
	mvns r0, r6
	str r0, [r4, #0xc]
	ldr r1, _0203C0B4 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
_0203C092:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0203C0A0: .4byte 0x04000208
_0203C0A4: .4byte 0x04000200
_0203C0A8: .4byte 0x0000FF3F
_0203C0AC: .4byte gSio32MultiLoadArea
_0203C0B0: .4byte 0x05000006
_0203C0B4: .4byte 0x04000128
_0203C0B8: .4byte 0x00002003
_0203C0BC: .4byte 0x0400010C
