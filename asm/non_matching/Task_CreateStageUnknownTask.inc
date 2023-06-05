
.syntax unified
.text
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
	adds r4, r1, r0     @ r4 = ut
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _08009984
	b Task_StageUnknownTask_Return
_08009984:
	ldrh r0, [r4]
	ldr r1, _0800999C @ =0x000001FF
	adds r2, r0, #0     @ r2 = ut->unk0
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
	ldrh r1, [r4, #4]   @ r1 = ut->unk4
	adds r0, r0, r1
_080099A6:
	strh r0, [r4, #4]   @ ut->unk4 +/- ut->unk2;
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r0, r2, r0
	movs r2, #0         @ r2 = 0
	mov r8, r2          @ r8 = 0
	ldr r3, _08009A44 @ =0x000003FF
	ands r0, r3
	strh r0, [r4]       @ ut->unk0 = (ut->unk0 - (ut->unk4 >> 8)) & ONE_CYCLE;
	ldrb r1, [r4, #0xb]
	adds r5, r0, r1
	ands r5, r3         @ r5 = cosIndex & ONE_CYCLE
	ldr r6, _08009A48 @ =gSineTable
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r5, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r1, r0, #0x10
	cmp r1, #0
	bne _080099D6
	b Task_StageUnknownTask_Return
_080099D6:
	lsls r0, r5, #1         @ r5 = cosIndex
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8         @ r0 = someSin = (cosIndex << 8)
	asrs r1, r1, #0x16
	str r3, [sp, #0x18]     @ sp18 = ONE_CYCLE
	bl Div
	mov sl, r0               @ sl = divRes0
	add r2, sp, #0x10       @ r2 = sp10
	movs r1, #8
	ldrsh r0, [r4, r1]
	mov sb, r0              @ sb =ut->unk8
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
	mov r0, r8          @ r0 = 0
	strh r0, [r2]
	cmp r5, #0xff
	bls _08009A50
	ldr r2, _08009A4C @ =0xFFFFFD00
	adds r1, r5 , r2
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r7     @ r7 = 0x100
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
_08009A48: .4byte gSineTable
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
	add r1, sp, #8      @ r1 = sp08
	mov r2, sl
	ldrh r0, [r2]
	movs r3, #0
	mov sb, r3          @ sb = 0
	strb r0, [r1]
	ldrh r0, [r2, #2]
	strb r0, [r1, #1]
__08009AF4:
	ldr r6, _08009B90 @ =gSineTable
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
	add r3, sp, #8          @ r3 = sp08
	ldrb r2, [r4, #6]       @ r2 = ut->unk6
	movs r5, #8
	ldrsh r1, [r4, r5]
	subs r1, #0xa0          @ r1 = ut->unk8 - 160
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
	subs r0, r0, r1         @ r0 = ut->unk0 - ut->unkB
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0         @ r1 = r2 = 0x400
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
	mov r8, r2              @ r8 = sp14
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
_08009B90: .4byte gSineTable
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
	mov r3, r8              @ r3 = sp14
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
	ands r1, r0         @ r1 = sinIndex & ONE_CYCLE
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
__08009C46:
	ldr r2, _08009CC0 @ =gSineTable
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
	b Task_StageUnknownTask_Return
_08009C98:
	mov r2, sl              @ r2 = sp10
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
_08009CC0: .4byte gSineTable
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
	ldrb r0, [r4, #0xa]     @ r0 = ut->unkA
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
	b Task_StageUnknownTask_Return
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
	b Task_StageUnknownTask_Return
	.align 2, 0
_08009D34: .4byte gWinRegs
_08009D38:
	mov r3, sl          @ r3 = sp10
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	bgt Task_StageUnknownTask_Return
__08009D44:
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
__08009D5A:
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
	b Task_StageUnknownTask_Return
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
Task_StageUnknownTask_Return:
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
.syntax divided
