.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_80010BC
sub_80010BC: @ 0x080010BC
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _080010D8 @ =gSio32MultiLoadArea
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #4
	bls _080010CC
	b _08001292
_080010CC:
	lsls r0, r1, #2
	ldr r1, _080010DC @ =_080010E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080010D8: .4byte gSio32MultiLoadArea
_080010DC: .4byte _080010E0
_080010E0: @ jump table
	.4byte _080010F4 @ case 0
	.4byte _0800110C @ case 1
	.4byte _080011A8 @ case 2
	.4byte _0800121A @ case 3
	.4byte _08001288 @ case 4
_080010F4:
	ldr r0, [r5]
	ldr r1, _08001108 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	bne _08001100
	b _08001292
_08001100:
	movs r0, #1
	strb r0, [r5, #1]
	b _08001292
	.align 2, 0
_08001108: .4byte 0x00FF00FF
_0800110C:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0800111C
	ldrb r0, [r5, #2]
	cmp r0, #5
	bhi _0800111A
	b _08001292
_0800111A:
	b _08001126
_0800111C:
	ldr r1, _0800115C @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
_08001126:
	ldr r0, _08001160 @ =0x04000120
	movs r6, #0
	str r6, [r0]
	ldr r1, _08001164 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	ldrb r4, [r5]
	cmp r4, #1
	bne _08001174
	ldr r2, _0800115C @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08001168 @ =0x0400010C
	ldr r0, _0800116C @ =0x00C0F318
	str r0, [r1]
	ldr r3, _08001170 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r3]
	b _08001194
	.align 2, 0
_0800115C: .4byte 0x04000128
_08001160: .4byte 0x04000120
_08001164: .4byte 0x04000202
_08001168: .4byte 0x0400010C
_0800116C: .4byte 0x00C0F318
_08001170: .4byte 0x04000208
_08001174:
	ldr r2, _080011A0 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x81
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _080011A4 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
_08001194:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #2
	strb r0, [r5, #1]
	b _08001292
	.align 2, 0
_080011A0: .4byte 0x04000128
_080011A4: .4byte 0x04000208
_080011A8:
	ldr r6, [r5, #8]
	adds r4, r6, #0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _080011B8
	adds r4, r0, #0
	b _080011BE
_080011B8:
	cmp r6, #0
	bge _080011BE
	movs r4, #0
_080011BE:
	cmp r2, #0
	beq _080011C4
	str r4, [r2]
_080011C4:
	ldrb r0, [r5]
	cmp r0, #1
	beq _08001206
	ldr r0, [r5, #0x14]
	cmp r0, r4
	bge _080011EA
	adds r3, r5, #0
	ldr r7, [r5, #4]
_080011D4:
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
	blt _080011D4
_080011EA:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0800120E
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08001206
	movs r0, #1
	strb r0, [r5, #3]
_08001206:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	bgt _08001214
_0800120E:
	ldrb r0, [r5, #2]
	cmp r0, #0x8c
	bne _08001292
_08001214:
	movs r0, #3
	strb r0, [r5, #1]
	b _08001292
_0800121A:
	ldr r3, _0800126C @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _08001270 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001274 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _08001278 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	adds r0, #3
	str r0, [r1]
	ldr r2, _0800127C @ =0x04000120
	movs r0, #0
	movs r1, #0
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r5]
	cmp r0, #0
	beq _08001258
	ldr r1, _08001280 @ =0x0400010C
	movs r0, #0
	str r0, [r1]
_08001258:
	ldr r0, _08001284 @ =0x04000202
	movs r1, #0xc0
	strh r1, [r0]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800128E
	strb r4, [r5, #2]
	movs r0, #4
	strb r0, [r5, #1]
	b _08001292
	.align 2, 0
_0800126C: .4byte 0x04000208
_08001270: .4byte 0x04000200
_08001274: .4byte 0x0000FF3F
_08001278: .4byte 0x04000128
_0800127C: .4byte 0x04000120
_08001280: .4byte 0x0400010C
_08001284: .4byte 0x04000202
_08001288:
	ldrb r0, [r5, #2]
	cmp r0, #2
	bls _08001292
_0800128E:
	movs r0, #1
	b _0800129A
_08001292:
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	movs r0, #0
_0800129A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80012A0
sub_80012A0: @ 0x080012A0
	push {r4, r5, lr}
	ldr r2, _080012C4 @ =0x04000120
	ldr r3, [r2]
	ldr r5, _080012C8 @ =gSio32MultiLoadArea
	ldrb r0, [r5]
	adds r4, r5, #0
	cmp r0, #1
	beq _080012D0
	ldr r0, _080012CC @ =0x04000128
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	ldr r2, [r4, #8]
	cmp r2, #0
	bge _0800131C
	b _0800130A
	.align 2, 0
_080012C4: .4byte 0x04000120
_080012C8: .4byte gSio32MultiLoadArea
_080012CC: .4byte 0x04000128
_080012D0:
	ldr r1, _080012E4 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4, #8]
	cmp r1, #0
	bge _080012EC
	ldr r0, _080012E8 @ =0xFEFEFEFE
	str r0, [r2]
	b _08001332
	.align 2, 0
_080012E4: .4byte 0x0400010E
_080012E8: .4byte 0xFEFEFEFE
_080012EC:
	ldr r0, _08001300 @ =0x00001FFF
	cmp r1, r0
	bgt _08001304
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _08001332
	.align 2, 0
_08001300: .4byte 0x00001FFF
_08001304:
	ldr r0, [r4, #0xc]
	str r0, [r2]
	b _08001332
_0800130A:
	ldr r0, _08001318 @ =0xFEFEFEFE
	cmp r3, r0
	beq _08001332
	subs r0, r2, #1
	str r0, [r5, #8]
	b _08001332
	.align 2, 0
_08001318: .4byte 0xFEFEFEFE
_0800131C:
	ldr r0, _0800132C @ =0x00001FFF
	cmp r2, r0
	bgt _08001330
	ldr r1, [r4, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	str r3, [r0]
	b _08001332
	.align 2, 0
_0800132C: .4byte 0x00001FFF
_08001330:
	str r3, [r4, #0xc]
_08001332:
	ldr r1, [r4, #8]
	ldr r0, _0800135C @ =0x00002002
	cmp r1, r0
	bgt _08001354
	adds r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r4]
	cmp r0, #1
	bne _08001354
	ldr r2, _08001360 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08001364 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_08001354:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800135C: .4byte 0x00002002
_08001360: .4byte 0x04000128
_08001364: .4byte 0x0400010E

	thumb_func_start sub_8001368
sub_8001368: @ 0x08001368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	ldr r3, _080013E4 @ =0x04000208
	strh r6, [r3]
	ldr r2, _080013E8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080013EC @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	mov r8, r0
	strh r0, [r3]
	str r6, [sp]
	ldr r4, _080013F0 @ =gSio32MultiLoadArea
	ldr r2, _080013F4 @ =0x05000006
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _080013F8 @ =0x04000128
	ldr r0, _080013FC @ =0x00002003
	str r0, [r1]
	str r7, [r4, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #8]
	cmp r5, #0
	beq _080013D6
	ldr r0, _08001400 @ =0x0400010C
	str r6, [r0]
	mov r2, r8
	strb r2, [r4]
	adds r1, r7, #0
	movs r2, #0x80
	lsls r2, r2, #6
_080013B8:
	ldm r1!, {r0}
	adds r6, r6, r0
	subs r2, #1
	cmp r2, #0
	bne _080013B8
	mvns r0, r6
	str r0, [r4, #0xc]
	ldr r1, _080013F8 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
_080013D6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080013E4: .4byte 0x04000208
_080013E8: .4byte 0x04000200
_080013EC: .4byte 0x0000FF3F
_080013F0: .4byte gSio32MultiLoadArea
_080013F4: .4byte 0x05000006
_080013F8: .4byte 0x04000128
_080013FC: .4byte 0x00002003
_08001400: .4byte 0x0400010C
