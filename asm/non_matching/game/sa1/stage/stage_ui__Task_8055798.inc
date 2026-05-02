.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08055804 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0         @ r4 = strc
	ldrh r0, [r4, #0x18]
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	cmp r1, #0xd7
	ble _08055826
	subs r0, #0xd7
	lsls r0, r0, #7
	movs r1, #0xa
	bl Div
	movs r5, #0
	lsls r0, r0, #0x10
	movs r1, #0x20
	rsbs r1, r1, #0
	mov sb, r1
	asrs r1, r0, #0x10
	rsbs r0, r0, #0
	mov r8, r0
	rsbs r6, r1, #0
	ldr r7, _08055808 @ =gUnknown_08688394
_080557D6_loop:
	strh r6, [r4, #0xc]
	mov r2, r8
	asrs r0, r2, #0x10
	cmp r0, sb
	blt _08055814
	ldrh r0, [r4, #0x18]
	cmp r0, #0x69
	bls _080557FA
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _080557FA
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805580C
_080557FA:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_8052F78
	b _08055814
	.align 2, 0
_08055804: .4byte gCurTask
_08055808: .4byte gUnknown_08688394
_0805580C:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_80530CC
_08055814:
	movs r0, #0x80
	lsls r0, r0, #0xe
	add r8, r0
	adds r6, #0x20
	adds r7, #1
	adds r5, #1
	cmp r5, #3
	ble _080557D6_loop
	b _080558F0_return
_08055826:
	cmp r1, #0x1f
	ble _0805586E
	movs r5, #0
	ldr r6, _08055858 @ =gUnknown_08688394
_0805582E_loop:
	lsls r0, r5, #5
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0x18]
	cmp r0, #0x69
	bls _0805584C
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805584C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805585C
_0805584C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8052F78
	b _08055864
	.align 2, 0
_08055858: .4byte gUnknown_08688394
_0805585C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80530CC
_08055864:
	adds r6, #1
	adds r5, #1
	cmp r5, #3
	ble _0805582E_loop
	b _080558F0_return
_0805586E:
	cmp r1, #0x19
	ble _080558F0_return
	subs r0, #0xd7
	lsls r0, r0, #7
	movs r1, #6
	bl Div
	subs r0, #0xb0
	mov r8, r0      @ r8 = Div((strc->unk18 - 215) << 7, 6) - 176;
	ldr r1, _080558CC @ =0x000001FF
	adds r0, r1, #0
	movs r5, #0
	mov r2, r8
	ands r2, r0
	mov r8, r2
	ldr r0, _080558D0 @ =0x000001A5
	mov sl, r0
	lsls r7, r2, #0x10
	mov r6, r8
	movs r1, #0x20
	rsbs r1, r1, #0
	mov sb, r1
_0805589A_loop:
	cmp r8, sl
	ble _080558E2
	strh r6, [r4, #0xc]
	asrs r0, r7, #0x10
	cmp r0, sb
	blt _080558E2
	ldrh r0, [r4, #0x18]
	cmp r0, #0x69
	bls _080558C0
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _080558C0
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _080558D8
_080558C0:
	ldr r0, _080558D4 @ =gUnknown_08688394
	adds r0, r5, r0
	adds r1, r4, #0
	bl sub_8052F78
	b _080558E2
	.align 2, 0
_080558CC: .4byte 0x000001FF
_080558D0: .4byte 0x000001A5
_080558D4: .4byte gUnknown_08688394
_080558D8:
	ldr r0, _08055900 @ =gUnknown_08688394
	adds r0, r5, r0
	adds r1, r4, #0
	bl sub_80530CC
_080558E2:
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r7, r7, r2
	adds r6, #0x20
	adds r5, #1
	cmp r5, #3
	ble _0805589A_loop
_080558F0_return:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055900: .4byte gUnknown_08688394

.syntax divided
