
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08011E7C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r1, [r4]
	ldr r0, _08011E80 @ =0x000001FF
	cmp r1, r0
	bhi _08011E84
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	subs r0, r0, r1
	b _08011E8A
	.align 2, 0
_08011E7C: .4byte gCurTask
_08011E80: .4byte 0x000001FF
_08011E84:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
_08011E8A:
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4]
	adds r0, r0, r2
	movs r3, #0
	mov r8, r3
	ldr r3, _08011F28 @ =0x000003FF
	ands r0, r3
	strh r0, [r4]
	ldrb r1, [r4, #0xb]
	adds r5, r0, r1
	ands r5, r3
	ldr r6, _08011F2C @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r1, r0, #0x10
	cmp r1, #0
	bne _08011EBC
	b _080122BA
_08011EBC:
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
	bgt _08011F6A
	mov r0, r8
	strh r0, [r2]
	cmp r5, #0xff
	bls _08011F34
	ldr r2, _08011F30 @ =0xFFFFFD00
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
	b _08011FB0
	.align 2, 0
_08011F28: .4byte 0x000003FF
_08011F2C: .4byte gSineTable
_08011F30: .4byte 0xFFFFFD00
_08011F34:
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
	b _08011FC8
_08011F6A:
	cmp r0, #0xef
	ble _08011FC2
	movs r0, #0xf0
	mov r8, r0
	mov r2, r8
	mov r1, sl
	strh r2, [r1]
	cmp r5, #0xff
	bls _08011F88
	ldr r0, _08011F84 @ =0xFFFFFD00
	adds r1, r5, r0
	b _08011F8A
	.align 2, 0
_08011F84: .4byte 0xFFFFFD00
_08011F88:
	subs r1, r7, r5
_08011F8A:
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
_08011FB0:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	asrs r1, r1, #8
	ldrh r0, [r4, #8]
	subs r0, r0, r1
	mov r1, sl
	strh r0, [r1, #2]
	b _08011FC8
_08011FC2:
	mov r3, r8
	mov r2, sl
	strh r3, [r2, #2]
_08011FC8:
	add r1, sp, #8
	mov r2, sl
	ldrh r0, [r2]
	movs r3, #0
	mov sb, r3
	strb r0, [r1]
	ldrh r0, [r2, #2]
	strb r0, [r1, #1]
	ldr r6, _08012074 @ =gSineTable
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
	ldr r3, _08012078 @ =0x000003FF
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
	bgt _080120BC
	mov r3, sb
	strh r3, [r2]
	cmp r5, #0xff
	bls _08012080
	ldr r0, _0801207C @ =0xFFFFFD00
	adds r1, r5, r0
	b _08012082
	.align 2, 0
_08012074: .4byte gSineTable
_08012078: .4byte 0x000003FF
_0801207C: .4byte 0xFFFFFD00
_08012080:
	subs r1, r7, r5
_08012082:
	ldr r0, _080120B8 @ =0x000003FF
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
	b _0801211E
	.align 2, 0
_080120B8: .4byte 0x000003FF
_080120BC:
	cmp r0, #0xef
	ble _08012118
	movs r0, #0xf0
	mov sb, r0
	mov r2, sb
	mov r1, r8
	strh r2, [r1]
	cmp r5, #0xff
	bls _080120D8
	ldr r3, _080120D4 @ =0xFFFFFD00
	adds r1, r5, r3
	b _080120DA
	.align 2, 0
_080120D4: .4byte 0xFFFFFD00
_080120D8:
	subs r1, r7, r5
_080120DA:
	ldr r0, _08012114 @ =0x000003FF
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
	b _0801211E
	.align 2, 0
_08012114: .4byte 0x000003FF
_08012118:
	mov r3, sb
	mov r2, r8
	strh r3, [r2, #2]
_0801211E:
	add r1, sp, #8
	mov r6, r8
	ldrh r0, [r6]
	strb r0, [r1, #4]
	ldrh r0, [r6, #2]
	strb r0, [r1, #5]
	ldr r2, _080121A4 @ =gSineTable
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
	ldr r0, _080121A8 @ =0x000001FF
	cmp r1, r0
	bhi _0801221C
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0801217C
	b _080122BA
_0801217C:
	mov r2, sl
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _080121E0
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080121B0
	ldr r2, _080121AC @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _080121BE
	.align 2, 0
_080121A4: .4byte gSineTable
_080121A8: .4byte 0x000001FF
_080121AC: .4byte gWinRegs
_080121B0:
	ldr r2, _080121DC @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_080121BE:
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
	bl sa2__sub_8006228
	b _080122BA
	.align 2, 0
_080121DC: .4byte gWinRegs
_080121E0:
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08012200
	ldr r2, _080121FC @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _0801220E
	.align 2, 0
_080121FC: .4byte gWinRegs
_08012200:
	ldr r2, _08012218 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #5]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_0801220E:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	bl sa2__sub_800724C
	b _080122BA
	.align 2, 0
_08012218: .4byte gWinRegs
_0801221C:
	mov r3, sl
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	bgt _080122BA
	mov r5, r8
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08012284
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08012254
	ldr r2, _08012250 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _08012262
	.align 2, 0
_08012250: .4byte gWinRegs
_08012254:
	ldr r2, _08012280 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_08012262:
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
	bl sa2__sub_80064A8
	b _080122BA
	.align 2, 0
_08012280: .4byte gWinRegs
_08012284:
	ldrb r1, [r4, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080122A4
	ldr r2, _080122A0 @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #6]
	b _080122B2
	.align 2, 0
_080122A0: .4byte gWinRegs
_080122A4:
	ldr r2, _080122CC @ =gWinRegs
	add r0, sp, #8
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	movs r1, #0xa0
	orrs r0, r1
	strh r0, [r2, #4]
_080122B2:
	ldrb r0, [r4, #0xa]
	add r1, sp, #8
	bl sa2__sub_800724C
_080122BA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080122CC: .4byte gWinRegs

.syntax divided
