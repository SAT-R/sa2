
.syntax unified
.text
	push {r4, r5, lr}
	sub sp, #8
	mov ip, r1              @ ip = r1 = p
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18      @ r2 = param0
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	ldr r0, [r1, #0xc]
	asrs r4, r0, #8
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	lsls r0, r2, #0x18
	asrs r3, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0802305E
	cmp r3, #0
	bgt _08023062
	b _08023068
_0802305E:
	cmp r3, #0
	bgt _08023068
_08023062:
	adds r0, r2, #0
	adds r0, #0x1f
	lsls r0, r0, #0x18
_08023068:
	lsrs r2, r0, #0x18
	lsrs r3, r2, #6
	cmp r3, #1
	beq sub_802302C__case_1
	cmp r3, #1
	bgt _0802307A
	cmp r3, #0
	beq sub_802302C__case_0
	b _0802311C
_0802307A:
	cmp r3, #2
	beq sub_802302C__case_2
	cmp r3, #3
	beq sub_802302C__case_3
	b _0802311C
sub_802302C__case_0:
	adds r0, r4, #2         @ r0 = py + 2
	mov r2, ip              @ r2 = ip = p
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	str r3, [sp]
	ldr r1, _080230A0 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	b _0802310E
	.align 2, 0
_080230A0: .4byte sub_801EE64
sub_802302C__case_2:
	subs r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230C8 @ =sub_801EE64
	str r1, [sp, #4]
	adds r1, r5, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230C8: .4byte sub_801EE64
sub_802302C__case_1:
	subs r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r3, #8
	rsbs r3, r3, #0
	movs r1, #0
	str r1, [sp]
	ldr r1, _080230F0 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_080230F0: .4byte sub_801ED24
sub_802302C__case_3:
	adds r0, r5, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, _08023118 @ =sub_801ED24
	str r1, [sp, #4]
	adds r1, r4, #0
_0802310E:
	movs r3, #8
	bl sub_801E4E4
	b _0802311E
	.align 2, 0
_08023118: .4byte sub_801ED24
_0802311C:
	movs r0, #0
_0802311E:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
.syntax divided
