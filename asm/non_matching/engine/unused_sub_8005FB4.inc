

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08005FF8 @ =gFlags
	ldr r0, [r1]
	movs r7, #4
	orrs r0, r7
	str r0, [r1]
	cmp r6, #1
	bls _08006010
	ldr r1, _08005FFC @ =gHBlankCopySize
	strb r7, [r1]
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08006004
	ldr r0, _08006000 @ =gBgOffsetsHBlankPrimary
	ldr r0, [r0]
	adds r3, r0, #2
	b _08006038
	.align 2, 0
_08005FF8: .4byte gFlags
_08005FFC: .4byte gHBlankCopySize
_08006000: .4byte gBgOffsetsHBlankPrimary
_08006004:
	ldr r0, _0800600C @ =gBgOffsetsHBlankPrimary
	ldr r3, [r0]
	b _08006038
	.align 2, 0
_0800600C: .4byte gBgOffsetsHBlankPrimary
_08006010:
	ldr r1, _08006028 @ =gHBlankCopySize
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0800602C @ =gBgOffsetsHBlankPrimary
	ldr r3, [r0]
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08006038
	ldr r1, _08006030 @ =gHBlankCopyTarget
	ldr r0, _08006034 @ =0x04000042
	b _0800603C
	.align 2, 0
_08006028: .4byte gHBlankCopySize
_0800602C: .4byte gBgOffsetsHBlankPrimary
_08006030: .4byte gHBlankCopyTarget
_08006034: .4byte 0x04000042
_08006038:
	ldr r1, _080060A0 @ =gHBlankCopyTarget
	ldr r0, _080060A4 @ =0x04000040
_0800603C:
	str r0, [r1]
	subs r1, r2, r5
	mov r2, sl
	subs r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r7, r1, #0x10
	asrs r2, r7, #0x10
	adds r0, r2, #0
	cmp r2, #0
	bge _08006054
	rsbs r0, r2, #0
_08006054:
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r4, r1, #0
	mov sb, r0
	cmp r1, #0
	bge _08006068
	rsbs r4, r1, #0
_08006068:
	lsls r0, r4, #0x11
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r4, _080060A8 @ =gHBlankCopySize
	ldrb r0, [r4]
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	adds r3, r3, r0
	adds r6, r2, #0
	cmp r2, #0
	bge _08006082
	rsbs r6, r2, #0
_08006082:
	adds r0, r1, #0
	cmp r1, #0
	bge _0800608A
	rsbs r0, r1, #0
_0800608A:
	cmp r6, r0
	ble _0800615C
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080060FC
	strb r5, [r3, #1]
	movs r2, #0
	adds r6, r7, #0
	b _080060E4
	.align 2, 0
_080060A0: .4byte gHBlankCopyTarget
_080060A4: .4byte 0x04000040
_080060A8: .4byte gHBlankCopySize
_080060AC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, ip
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _080060DE
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r5, [r3]
	ldr r1, _080060F8 @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r3, r3, r0
	strb r5, [r3, #1]
_080060DE:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080060E4:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r6, #0x10
	cmp r0, #0
	bge _080060F0
	rsbs r0, r0, #0
_080060F0:
	cmp r2, r0
	blt _080060AC
	strb r5, [r3]
	b _08006214
	.align 2, 0
_080060F8: .4byte gHBlankCopySize
_080060FC:
	strb r5, [r3]
	adds r3, #1
	movs r2, #0
	adds r6, r7, #0
	b _08006142
_08006106:
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	mov r4, ip
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _0800613C
	mov r4, r8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strb r5, [r3]
	ldr r1, _08006158 @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	strb r5, [r3]
	adds r3, #1
_0800613C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006142:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	asrs r0, r6, #0x10
	cmp r0, #0
	bge _0800614E
	rsbs r0, r0, #0
_0800614E:
	cmp r2, r0
	blt _08006106
	strb r5, [r3]
	b _08006214
	.align 2, 0
_08006158: .4byte gHBlankCopySize
_0800615C:
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r2, #0
	ble _080061C0
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	b _080061A8
_08006178:
	adds r2, r5, #1
	strb r2, [r3]
	adds r3, #1
	strb r5, [r3]
	ldr r1, _080061BC @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080061A2
	lsls r0, r2, #0x18
	lsrs r5, r0, #0x18
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080061A2:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_080061A8:
	lsls r0, r2, #0x10
	asrs r6, r0, #0x10
	mov r2, sb
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _080061B6
	rsbs r0, r0, #0
_080061B6:
	cmp r6, r0
	blt _08006178
	b _08006214
	.align 2, 0
_080061BC: .4byte gHBlankCopySize
_080061C0:
	movs r2, #0
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	b _08006202
_080061D0:
	adds r0, r5, #1
	strb r0, [r3]
	adds r3, #1
	strb r5, [r3]
	ldr r1, _08006224 @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r0, r0, r3
	subs r3, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080061FC
	subs r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	subs r0, r1, r6
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080061FC:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08006202:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _08006210
	rsbs r0, r0, #0
_08006210:
	cmp r2, r0
	blt _080061D0
_08006214:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006224: .4byte gHBlankCopySize

.syntax divided
