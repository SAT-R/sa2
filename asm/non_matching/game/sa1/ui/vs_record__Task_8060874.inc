.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r7, _08060938 @ =gLoadedSaveGame
	ldr r0, _0806093C @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r0, [sp, #8]
	ldr r1, _08060940 @ =0x030000EC
	adds r0, r2, r1
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r3, _08060944 @ =gBgScrollRegs
	lsrs r0, r0, #8
	subs r0, #0x30
	ldr r4, _08060948 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	strh r0, [r3, #6]
	ldr r0, _0806094C @ =0x030000AE
	adds r1, r2, r0
	movs r0, #1
	strh r0, [r1]
	movs r5, #0
	ldr r1, _08060950 @ =0x030000AC
	adds r4, r2, r1
	movs r0, #0x10
	adds r0, r0, r7
	mov r8, r0
	subs r1, #2
	adds r1, r2, r1
	str r1, [sp, #0x18]
	ldr r0, _08060950 @ =0x030000AC
	adds r0, r2, r0
	str r0, [sp, #0x1c]
	ldr r1, _08060954 @ =0x030000A0
	adds r1, r2, r1
	str r1, [sp, #0x14]
_080608CC:
	lsls r0, r5, #3
	adds r0, #0x1b
	ldr r1, [sp, #8]
	adds r1, #0xaa
	strh r0, [r1]
	movs r6, #0x20
	strh r6, [r4]
	mov r2, r8
	adds r1, r5, r2
	ldrb r0, [r1]
	subs r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080608EE
	movs r0, #0x28
	strh r0, [r4]
_080608EE:
	adds r0, r1, #0
	ldr r1, [sp, #8]
	adds r1, #0xa0
	bl sub_805321C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _080608CC
	ldr r4, [sp, #0x1c]
	strh r6, [r4]
	ldr r0, _08060958 @ =0x00000425
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, #9
	bls _08060976
	movs r1, #0xa
	bl Div
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, #0xa
	bl Mod
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1, #1]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _0806095C
	movs r0, #0x5b
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _08060962
	.align 2, 0
_08060938: .4byte gLoadedSaveGame
_0806093C: .4byte gCurTask
_08060940: .4byte 0x030000EC
_08060944: .4byte gBgScrollRegs
_08060948: .4byte 0x000001FF
_0806094C: .4byte 0x030000AE
_08060950: .4byte 0x030000AC
_08060954: .4byte 0x030000A0
_08060958: .4byte 0x00000425
_0806095C:
	movs r0, #0x59
	ldr r2, [sp, #0x18]
	strh r0, [r2]
_08060962:
	ldr r4, [sp, #8]
	adds r4, #0xae
	movs r0, #2
	strh r0, [r4]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
	str r4, [sp, #0x20]
	b _080609DA
_08060976:
	ldr r2, [sp, #8]
	adds r2, #0xae
	movs r0, #1
	strh r0, [r2]
	mov r1, sp
	ldrb r0, [r5]
	adds r0, #0x30
	strb r0, [r1]
	ldrb r0, [r7, #0x19]
	str r2, [sp, #0x20]
	cmp r0, #0
	beq _08060996
	movs r0, #0x63
	ldr r4, [sp, #0x18]
	strh r0, [r4]
	b _0806099C
_08060996:
	movs r0, #0x61
	ldr r1, [sp, #0x18]
	strh r0, [r1]
_0806099C:
	ldr r2, _080609C8 @ =0x00000425
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080609CC
	mov r1, sp
	movs r0, #0x8a
	strb r0, [r1, #1]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
	movs r0, #0x7e
	ldr r4, [sp, #0x18]
	strh r0, [r4]
	mov r0, sp
	adds r0, #1
	ldr r1, [sp, #0x14]
	bl sub_805321C
	b _080609DA
	.align 2, 0
_080609C8: .4byte 0x00000425
_080609CC:
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
_080609DA:
	ldr r0, _08060A14 @ =0x00000426
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, #9
	bls _08060A22
	movs r0, #2
	ldr r1, [sp, #0x20]
	strh r0, [r1]
	ldrb r0, [r5]
	movs r1, #0xa
	bl Div
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, #0xa
	bl Mod
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1, #1]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _08060A18
	movs r0, #0x88
	ldr r2, [sp, #0x18]
	strh r0, [r2]
	b _08060A1E
	.align 2, 0
_08060A14: .4byte 0x00000426
_08060A18:
	movs r0, #0x89
	ldr r4, [sp, #0x18]
	strh r0, [r4]
_08060A1E:
	mov r0, sp
	b _08060A84
_08060A22:
	movs r0, #1
	ldr r1, [sp, #0x20]
	strh r0, [r1]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _08060A36
	movs r0, #0x90
	ldr r2, [sp, #0x18]
	strh r0, [r2]
	b _08060A3C
_08060A36:
	movs r0, #0x91
	ldr r4, [sp, #0x18]
	strh r0, [r4]
_08060A3C:
	mov r2, sp
	ldr r0, _08060A8C @ =0x00000426
	adds r1, r7, r0
	ldrb r0, [r1]
	adds r0, #0x30
	strb r0, [r2]
	ldrb r0, [r1]
	cmp r0, #1
	bhi _08060A94
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	beq _08060A94
	ldr r0, [sp, #8]
	adds r0, #0xb8
	movs r1, #0x98
	strh r1, [r0, #0x16]
	movs r1, #0x20
	strh r1, [r0, #0x18]
	ldr r1, [r0, #0x10]
	ldr r2, _08060A90 @ =0xFFFFF7FF
	ands r1, r2
	str r1, [r0, #0x10]
	bl DisplaySprite
	mov r1, sp
	movs r0, #0x8a
	strb r0, [r1, #1]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
	movs r0, #0xb1
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	mov r0, sp
	adds r0, #1
_08060A84:
	ldr r1, [sp, #0x14]
	bl sub_805321C
	b _08060A9C
	.align 2, 0
_08060A8C: .4byte 0x00000426
_08060A90: .4byte 0xFFFFF7FF
_08060A94:
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
_08060A9C:
	ldr r2, _08060AD4 @ =0x00000427
	adds r5, r7, r2
	ldrb r0, [r5]
	cmp r0, #9
	bls _08060AD8
	movs r0, #2
	ldr r4, [sp, #0x20]
	strh r0, [r4]
	ldrb r0, [r5]
	movs r1, #0xa
	bl Div
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1]
	ldrb r0, [r5]
	movs r1, #0xa
	bl Mod
	mov r1, sp
	adds r0, #0x30
	strb r0, [r1, #1]
	movs r0, #0xb9
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	mov r0, sp
	b _08060B06
	.align 2, 0
_08060AD4: .4byte 0x00000427
_08060AD8:
	movs r0, #1
	ldr r2, [sp, #0x20]
	strh r0, [r2]
	movs r0, #0xc1
	ldr r4, [sp, #0x18]
	strh r0, [r4]
	mov r1, sp
	ldrb r0, [r5]
	adds r0, #0x30
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, #1
	bhi _08060B0E
	movs r0, #0x8a
	strb r0, [r1, #1]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
	movs r0, #0xe2
	strh r0, [r4]
	mov r0, sp
	adds r0, #1
_08060B06:
	ldr r1, [sp, #0x14]
	bl sub_805321C
	b _08060B16
_08060B0E:
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805321C
_08060B16:
	movs r5, #0
	ldr r0, [sp, #0xc]
	lsrs r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r7, sp
_08060B20:
	ldr r1, [sp, #0x10]
	adds r0, r5, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r5, #1
	str r2, [sp, #0x28]
	cmp r1, #9
	bls _08060B32
	b _08060C68
_08060B32:
	movs r0, #1
	ldr r4, [sp, #0x20]
	strh r0, [r4]
	movs r4, #0
	ldr r0, [sp, #0xc]
	lsrs r6, r0, #8
	lsls r5, r5, #4
	mov sl, r5
	lsls r1, r1, #4
	mov sb, r1
	ldr r1, [sp, #8]
	adds r1, #4
	str r1, [sp, #0x24]
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	subs r0, #0x38
	subs r5, r5, r0
	movs r2, #8
	adds r2, r2, r5
	mov r8, r2
	mov r3, sb
	ldr r2, [sp, #8]
	add r2, sb
_08060B62:
	lsls r0, r4, #3
	adds r0, #0x3c
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	ldr r0, [sp, #0x1c]
	strh r5, [r0]
	adds r0, r4, r3
	ldr r1, [sp, #0x24]
	adds r0, r1, r0
	ldrb r0, [r0]
	subs r0, #0x70
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _08060B86
	mov r1, r8
	ldr r0, [sp, #0x1c]
	strh r1, [r0]
_08060B86:
	adds r0, r4, #4
	adds r0, r2, r0
	ldr r1, [sp, #0x14]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	bl sub_805345C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	cmp r4, #5
	bls _08060B62
	movs r0, #0xf
	ands r6, r0
	adds r0, r6, #0
	subs r0, #0x38
	mov r2, sl
	subs r0, r2, r0
	ldr r4, [sp, #0x1c]
	strh r0, [r4]
	ldr r4, [sp, #8]
	add r4, sb
	ldrb r0, [r4, #0xc]
	cmp r0, #0xff
	bne _08060BC4
	movs r0, #0x20
	strb r0, [r7]
	movs r0, #0x30
	b _08060BE6
_08060BC4:
	cmp r0, #9
	bls _08060BDE
	ldrb r0, [r4, #0xc]
	movs r1, #0xa
	bl Div
	adds r0, #0x30
	strb r0, [r7]
	ldrb r0, [r4, #0xc]
	movs r1, #0xa
	bl Mod
	b _08060BE4
_08060BDE:
	movs r1, #0x20
	strb r1, [r7]
	ldrb r0, [r4, #0xc]
_08060BE4:
	adds r0, #0x30
_08060BE6:
	strb r0, [r7, #1]
	movs r0, #0x80
	ldr r2, [sp, #0x18]
	strh r0, [r2]
	movs r0, #2
	ldr r4, [sp, #0x20]
	strh r0, [r4]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805345C
	ldr r4, [sp, #8]
	add r4, sb
	ldrb r0, [r4, #0xd]
	cmp r0, #9
	bls _08060C1A
	movs r1, #0xa
	bl Div
	adds r0, #0x30
	strb r0, [r7]
	ldrb r0, [r4, #0xd]
	movs r1, #0xa
	bl Mod
	b _08060C20
_08060C1A:
	movs r0, #0x20
	strb r0, [r7]
	ldrb r0, [r4, #0xd]
_08060C20:
	adds r0, #0x30
	strb r0, [r7, #1]
	movs r0, #0xa0
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805345C
	ldr r4, [sp, #8]
	add r4, sb
	ldrb r0, [r4, #0xe]
	cmp r0, #9
	bls _08060C50
	movs r1, #0xa
	bl Div
	adds r0, #0x30
	strb r0, [r7]
	ldrb r0, [r4, #0xe]
	movs r1, #0xa
	bl Mod
	b _08060C56
_08060C50:
	movs r2, #0x20
	strb r2, [r7]
	ldrb r0, [r4, #0xe]
_08060C56:
	adds r0, #0x30
	strb r0, [r7, #1]
	movs r0, #0xc0
	ldr r4, [sp, #0x18]
	strh r0, [r4]
	mov r0, sp
	ldr r1, [sp, #0x14]
	bl sub_805345C
_08060C68:
	ldr r1, [sp, #0x28]
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	bhi _08060C74
	b _08060B20
_08060C74:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
    .align 2, 0

.syntax divided
