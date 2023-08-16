.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8044540
sub_8044540: @ 0x08044540
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r1, [r6, #0xc]
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	cmp r0, #0
	ble _0804455C
	subs r0, r1, #2
	strh r0, [r6, #0xc]
_0804455C:
	movs r4, #0xc
	ldrsh r0, [r6, r4]
	ldr r1, [r6, #4]
	adds r1, r1, r0
	str r1, [r6, #4]
	movs r0, #0xe
	ldrsh r2, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r2
	str r0, [r6, #8]
	asrs r2, r1, #8
	asrs r0, r0, #8
	adds r0, #0x32
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	ldr r4, _0804477C @ =sub_801EE64
	mov r8, r4
	str r4, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #8
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	adds r5, r6, #0
	adds r5, #0xd6
	ldrh r0, [r5]
	adds r0, #0x30
	strh r0, [r5]
	adds r2, r6, #0
	adds r2, #0xc4
	adds r7, r6, #0
	adds r7, #0xd4
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0xc8
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08044600
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	lsls r0, r0, #1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x18
	strh r0, [r7]
_08044600:
	adds r5, r6, #0
	adds r5, #0xda
	ldrh r0, [r5]
	adds r0, #0x3d
	strh r0, [r5]
	adds r2, r6, #0
	adds r2, #0xcc
	adds r7, r6, #0
	adds r7, #0xd8
	movs r4, #0
	ldrsh r1, [r7, r4]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0xd0
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	mov r1, sb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _08044666
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #6
	adds r0, r0, r1
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x22
	strh r0, [r7]
_08044666:
	movs r4, #0
	mov r8, r4
	adds r0, r6, #0
	adds r0, #0xdc
	str r0, [sp, #8]
	movs r1, #0xe0
	adds r1, r1, r6
	mov sl, r1
_08044676:
	mov r2, r8
	lsls r1, r2, #2
	movs r4, #0x87
	lsls r4, r4, #1
	adds r0, r6, r4
	adds r5, r0, r1
	ldrh r0, [r5]
	adds r0, #0x38
	strh r0, [r5]
	lsls r3, r2, #3
	ldr r0, [sp, #8]
	adds r2, r0, r3
	subs r4, #2
	adds r0, r6, r4
	adds r7, r0, r1
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	mov r1, sl
	adds r4, r1, r3
	movs r1, #0
	ldrsh r0, [r5, r1]
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	ldr r0, [r2]
	asrs r2, r0, #8
	asrs r0, r1, #8
	movs r1, #0
	str r1, [sp]
	ldr r1, _0804477C @ =sub_801EE64
	mov sb, r1
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _080446EE
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	mov r0, r8
	subs r0, #0x41
	muls r0, r1, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldr r0, _08044780 @ =0x0000FFCD
	add r0, r8
	ldrh r4, [r7]
	adds r0, r0, r4
	strh r0, [r7]
_080446EE:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #5
	bls _08044676
	movs r0, #0x97
	lsls r0, r0, #1
	adds r5, r6, r0
	ldrh r0, [r5]
	adds r0, #0x40
	movs r3, #0
	strh r0, [r5]
	movs r1, #0x92
	lsls r1, r1, #1
	adds r2, r6, r1
	movs r4, #0x96
	lsls r4, r4, #1
	adds r7, r6, r4
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r4, r6, r1
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, [r2]
	asrs r2, r1, #8
	asrs r0, r0, #8
	str r3, [sp]
	mov r1, sb
	str r1, [sp, #4]
	adds r1, r2, #0
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	cmp r0, #0
	bge _0804476C
	lsls r1, r0, #8
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	movs r2, #0
	ldrsh r1, [r5, r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	rsbs r0, r0, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r0, [r7]
	subs r0, #0x34
	strh r0, [r7]
_0804476C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804477C: .4byte sub_801EE64
_08044780: .4byte 0x0000FFCD

	thumb_func_start sub_8044784
sub_8044784: @ 0x08044784
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0x9a
	lsls r0, r0, #1
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _080447CC @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080447D4
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	movs r1, #0x80
	lsls r1, r1, #6
	cmp r0, r1
	beq _080447BC
	mov r4, r8
	strh r1, [r4, #4]
	mov r0, r8
	bl NextTransitionFrame
_080447BC:
	ldr r0, _080447D0 @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	b _08044A00
	.align 2, 0
_080447CC: .4byte gPlayer
_080447D0: .4byte gFlags
_080447D4:
	ldrb r0, [r7, #0x11]
	cmp r0, #0
	bne _080447FC
	movs r0, #0x80
	lsls r0, r0, #6
	mov r5, r8
	strh r0, [r5, #4]
	mov r0, r8
	bl NextTransitionFrame
	ldr r2, _080447F8 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	b _08044A00
	.align 2, 0
_080447F8: .4byte gFlags
_080447FC:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	ldr r6, _080448C0 @ =gCamera
	ldr r1, [r6]
	subs r5, r0, r1
	ldrh r3, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	ldr r2, _080448C4 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #0xb
	adds r5, r5, r0
	ldrh r2, [r7, #0x1a]
	adds r1, r2, r1
	lsls r1, r1, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r1, r1, r0
	movs r4, #0
	ldrsh r1, [r1, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r5, r5, r0
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	ldr r1, [r6, #4]
	subs r6, r0, r1
	lsls r3, r3, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r3, r3, r0
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r6, r6, r0
	subs r6, #0x12
	lsls r2, r2, #1
	ldr r0, _080448C4 @ =gSineTable
	adds r2, r2, r0
	movs r4, #0
	ldrsh r1, [r2, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r6, r6, r0
	movs r0, #0
	mov sb, r0
	ldrb r1, [r7, #0x1e]
	cmp r1, #0
	beq _080448CC
	ldrh r0, [r7, #0x1c]
	cmp r0, #0
	bne _080448CC
	subs r1, #1
	strb r1, [r7, #0x1e]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	subs r0, r0, r1
	mov r4, r8
	strh r0, [r4, #4]
	ldrh r0, [r7, #0x1a]
	ldrb r1, [r7, #0x1e]
	adds r1, #8
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #0x20
	str r2, [sp, #4]
	movs r2, #6
	bl sub_802E784
	movs r5, #1
	mov sb, r5
	ldrb r0, [r7, #0x1e]
	cmp r0, #0
	bne _08044946
	ldr r2, _080448C8 @ =gUnknown_080D7F94
	ldrb r0, [r7, #0x10]
	movs r1, #0
	cmp r0, #4
	bls _080448B8
	movs r1, #2
_080448B8:
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x1c]
	b _08044946
	.align 2, 0
_080448C0: .4byte gCamera
_080448C4: .4byte gSineTable
_080448C8: .4byte gUnknown_080D7F94
_080448CC:
	movs r2, #0x80
	lsls r2, r2, #6
	mov r0, r8
	strh r2, [r0, #4]
	ldrh r1, [r7, #0x1c]
	subs r0, r1, #1
	strh r0, [r7, #0x1c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080448EC
	movs r0, #0xfc
	bl m4aSongNumStart
	movs r0, #0x10
	strb r0, [r7, #0x1e]
	b _0804491C
_080448EC:
	adds r0, r1, #0
	subs r0, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1c
	bhi _0804491C
	adds r0, r1, #0
	subs r0, #0xb
	lsls r0, r0, #7
	subs r0, r2, r0
	mov r1, r8
	strh r0, [r1, #4]
	ldrh r0, [r7, #0x1a]
	lsls r3, r5, #0x10
	asrs r3, r3, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	movs r1, #0x20
	str r1, [sp, #4]
	movs r1, #0xa
	movs r2, #6
	bl sub_802E784
_0804491C:
	ldrh r0, [r7, #0x1c]
	cmp r0, #0xc
	bhi _08044946
	movs r4, #0x97
	lsls r4, r4, #2
	adds r2, r7, r4
	strh r5, [r2, #0x16]
	strh r6, [r2, #0x18]
	ldrh r0, [r7, #0x1c]
	cmp r0, #0xc
	bne _08044946
	ldr r5, _080449C0 @ =0x0000027D
	adds r1, r7, r5
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _080449C4 @ =0x000002AB
	strh r0, [r2, #0xa]
	subs r0, #0x2f
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
_08044946:
	mov r0, r8
	bl NextTransitionFrame
	ldr r1, _080449C8 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r6, r0, #8
	adds r6, #0x13
	ldr r3, [r7, #8]
	asrs r3, r3, #8
	ldr r4, _080449CC @ =gSineTable
	ldrh r1, [r7, #0x18]
	lsls r0, r1, #1
	adds r0, r0, r4
	movs r5, #0
	ldrsh r2, [r0, r5]
	lsls r0, r2, #2
	adds r0, r0, r2
	asrs r0, r0, #0xb
	adds r3, r3, r0
	subs r6, r6, r3
	ldr r2, _080449C8 @ =gPlayer
	ldr r0, [r2, #8]
	asrs r5, r0, #8
	adds r3, r5, #2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r0, #0
	ldrsh r1, [r1, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	adds r2, r2, r0
	subs r5, r3, r2
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080449D0 @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080449E4
	ldrh r2, [r7, #0x1a]
	adds r1, r2, #0
	cmp r1, r3
	bhs _080449D8
	ldr r0, _080449D4 @ =0x0000023F
	cmp r1, r0
	bhi _080449E4
	adds r0, r2, #1
	b _080449E2
	.align 2, 0
_080449C0: .4byte 0x0000027D
_080449C4: .4byte 0x000002AB
_080449C8: .4byte gPlayer
_080449CC: .4byte gSineTable
_080449D0: .4byte gUnknown_03005590
_080449D4: .4byte 0x0000023F
_080449D8:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r1, r0
	bls _080449E4
	subs r0, r2, #1
_080449E2:
	strh r0, [r7, #0x1a]
_080449E4:
	mov r1, sb
	cmp r1, #0
	beq _08044A00
	ldrh r1, [r7, #0x1a]
	adds r0, r1, #0
	subs r0, #0x10
	cmp r0, r3
	bge _08044A00
	adds r0, #0x20
	cmp r0, r3
	ble _08044A00
	ldr r0, _08044A10 @ =gPlayer
	bl sub_800CBA4
_08044A00:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A10: .4byte gPlayer

	thumb_func_start sub_8044A14
sub_8044A14: @ 0x08044A14
	push {r4, lr}
	mov ip, r0
	ldr r2, _08044A90 @ =gSineTable
	ldr r0, _08044A94 @ =gUnknown_03005590
	ldr r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08044A98 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #9
	movs r3, #0xfa
	lsls r3, r3, #2
	adds r0, r0, r3
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x32]
	mov r3, ip
	adds r3, #0xb6
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r1, #0x36
	adds r1, r1, r0
	mov r4, ip
	adds r4, #0xb8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	mov r3, ip
	ldrh r0, [r3, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xb
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044A9C
	ldrh r0, [r4]
	adds r0, #2
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08044AAC
	b _08044AAA
	.align 2, 0
_08044A90: .4byte gSineTable
_08044A94: .4byte gUnknown_03005590
_08044A98: .4byte 0x000003FF
_08044A9C:
	ldrh r0, [r4]
	subs r0, #2
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044AAC
_08044AAA:
	strh r3, [r4]
_08044AAC:
	mov r3, ip
	ldrh r0, [r3, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xb
	mov r1, ip
	adds r1, #0xba
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044ADA
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08044AEA
	b _08044AE8
_08044ADA:
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044AEA
_08044AE8:
	strh r3, [r1]
_08044AEA:
	mov r1, ip
	adds r1, #0xbc
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x77
	bls _08044B06
	movs r0, #0
	strh r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
_08044B06:
	mov r2, ip
	adds r2, #0xb6
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8044B28
sub_8044B28: @ 0x08044B28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08044BA4 @ =gSineTable
	ldr r3, _08044BA8 @ =gUnknown_03005590
	ldr r0, [r3]
	lsls r0, r0, #4
	ldr r1, _08044BAC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #9
	movs r4, #0xfa
	lsls r4, r4, #2
	adds r0, r0, r4
	ands r0, r1
	strh r0, [r6, #0x32]
	adds r4, r6, #0
	adds r4, #0xb6
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x36
	adds r1, r1, r0
	adds r5, r6, #0
	adds r5, #0xb8
	ldrh r0, [r5]
	strh r0, [r1]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r1, #0x76
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r4, r0, #0xa
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bge _08044BB0
	ldrh r0, [r5]
	adds r0, #2
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	ble _08044BC0
	b _08044BBE
	.align 2, 0
_08044BA4: .4byte gSineTable
_08044BA8: .4byte gUnknown_03005590
_08044BAC: .4byte 0x000003FF
_08044BB0:
	ldrh r0, [r5]
	subs r0, #2
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bge _08044BC0
_08044BBE:
	strh r4, [r5]
_08044BC0:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r4, r0, #0xa
	adds r1, r6, #0
	adds r1, #0xba
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bge _08044BEC
	ldrh r0, [r1]
	adds r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	ble _08044BFC
	b _08044BFA
_08044BEC:
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bge _08044BFC
_08044BFA:
	strh r4, [r1]
_08044BFC:
	adds r4, r6, #0
	adds r4, #0xbc
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4f
	bls _08044C98
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	bne _08044C2A
	ldr r2, _08044C3C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08044C40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _08044C44 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08044C48
_08044C2A:
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	b _08044C70
	.align 2, 0
_08044C3C: .4byte gPseudoRandom
_08044C40: .4byte 0x00196225
_08044C44: .4byte 0x3C6EF35F
_08044C48:
	ldr r3, [r3]
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	beq _08044C62
	strh r1, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	b _08044C70
_08044C62:
	strh r3, [r4]
	adds r1, r6, #0
	adds r1, #0xbe
	movs r0, #0x60
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
_08044C70:
	strb r0, [r1]
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r4, #0xc5
	lsls r4, r4, #2
	adds r1, r6, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08044C94 @ =0x00000315
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	b _08044CA6
	.align 2, 0
_08044C94: .4byte 0x00000315
_08044C98:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x46
	bne _08044CA6
	movs r0, #0xfa
	bl m4aSongNumStart
_08044CA6:
	adds r0, r6, #0
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044CBC
sub_8044CBC: @ 0x08044CBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xbe
	ldrb r0, [r7]
	cmp r0, #0x40
	bne _08044D26
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r5, _08044DE0 @ =gSineTable
	ldrh r4, [r6, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r3, r2, r5
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r1, r1, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r2, #0
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r0, r0, r2
	adds r1, #2
	subs r0, #0x11
	ldr r3, _08044DE4 @ =gPlayer
	ldr r2, [r3, #8]
	asrs r2, r2, #8
	subs r1, r2, r1
	ldr r2, [r3, #0xc]
	asrs r2, r2, #8
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r6, #0x32]
_08044D26:
	ldrb r0, [r7]
	str r7, [sp]
	movs r3, #0xb6
	adds r3, r3, r6
	mov r8, r3
	movs r1, #0x36
	adds r1, r1, r6
	mov sl, r1
	adds r5, r6, #0
	adds r5, #0xb8
	adds r2, r6, #0
	adds r2, #0x76
	str r2, [sp, #4]
	adds r7, r6, #0
	adds r7, #0xba
	cmp r0, #0x1b
	bne _08044D92
	movs r0, #0xfb
	bl m4aSongNumStart
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0x10
	strb r0, [r1]
	movs r3, #0
	movs r0, #0xcb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _08044DE8 @ =gUnknown_080D7FB0
	mov ip, r1
	movs r4, #0xff
_08044D64:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	add r0, sb
	adds r2, r6, r0
	lsls r1, r3, #3
	add r1, ip
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08044D64
_08044D92:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	adds r4, r5, #0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r1, [r7]
	strh r1, [r0]
	ldr r2, _08044DE0 @ =gSineTable
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xa
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08044DEC
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08044DFC
	strh r3, [r4]
	b _08044DFC
	.align 2, 0
_08044DE0: .4byte gSineTable
_08044DE4: .4byte gPlayer
_08044DE8: .4byte gUnknown_080D7FB0
_08044DEC:
	ldrh r0, [r5]
	subs r0, #0xa
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r3
	bge _08044DFC
	strh r3, [r5]
_08044DFC:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #0xa
	adds r1, r7, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08044E28
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08044E38
	strh r3, [r1]
	b _08044E38
_08044E28:
	ldrh r0, [r7]
	subs r0, #0xa
	strh r0, [r7]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, r3
	bge _08044E38
	strh r3, [r7]
_08044E38:
	ldr r1, [sp]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r3, #0xff
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08044E92
	ldrb r0, [r6, #0x11]
	cmp r0, #0
	beq _08044E84
	adds r0, r6, #0
	adds r0, #0xbf
	strb r1, [r0]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	str r0, [r2, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08044E80 @ =0x00000315
	adds r1, r6, r0
	ldrb r0, [r1]
	orrs r0, r3
	b _08044E90
	.align 2, 0
_08044E80: .4byte 0x00000315
_08044E84:
	adds r0, r6, #0
	adds r0, #0xbf
	movs r1, #3
	strb r1, [r0]
	movs r0, #0x7f
	ldr r1, [sp]
_08044E90:
	strb r0, [r1]
_08044E92:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8044EB0
sub_8044EB0: @ 0x08044EB0
	push {r4, lr}
	mov ip, r0
	adds r0, #0xbe
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08044F34 @ =0x000003FF
	adds r2, r1, #0
	ands r0, r2
	ldr r3, _08044F38 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #0xb
	mov r1, ip
	ldrh r1, [r1, #0x32]
	adds r0, r0, r1
	ands r0, r2
	mov r2, ip
	strh r0, [r2, #0x32]
	adds r2, #0xb6
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x36
	adds r1, r1, r0
	mov r4, ip
	adds r4, #0xb8
	ldrh r0, [r4]
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, ip
	ldrh r0, [r1, #0x32]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r2, r0, #0xa
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08044F3C
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _08044F4C
	b _08044F4A
	.align 2, 0
_08044F34: .4byte 0x000003FF
_08044F38: .4byte gSineTable
_08044F3C:
	ldrh r0, [r4]
	subs r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08044F4C
_08044F4A:
	strh r2, [r4]
_08044F4C:
	mov r2, ip
	ldrh r0, [r2, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r2, r0, #0xa
	mov r1, ip
	adds r1, #0xba
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bge _08044F7A
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _08044F8A
	b _08044F88
_08044F7A:
	ldrh r0, [r1]
	subs r0, #0xa
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bge _08044F8A
_08044F88:
	strh r2, [r1]
_08044F8A:
	mov r1, ip
	adds r1, #0xbe
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08044FCA
	adds r1, #1
	strb r0, [r1]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r1, #0xc5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08044FE0 @ =0x00000315
	add r1, ip
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_08044FCA:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044FE0: .4byte 0x00000315

	thumb_func_start sub_8044FE4
sub_8044FE4: @ 0x08044FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0xbe
	ldrb r0, [r7]
	cmp r0, #0x40
	bne _0804504E
	ldr r1, [r6, #4]
	asrs r1, r1, #8
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r5, _08045108 @ =gSineTable
	ldrh r4, [r6, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r4, r3
	lsls r2, r2, #1
	adds r3, r2, r5
	movs r2, #0
	ldrsh r3, [r3, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r1, r1, r2
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r2, #0
	ldrsh r3, [r4, r2]
	lsls r2, r3, #2
	adds r2, r2, r3
	asrs r2, r2, #0xb
	adds r0, r0, r2
	adds r1, #2
	subs r0, #0x11
	ldr r3, _0804510C @ =gPlayer
	ldr r2, [r3, #8]
	asrs r2, r2, #8
	subs r1, r2, r1
	ldr r2, [r3, #0xc]
	asrs r2, r2, #8
	subs r0, r2, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r6, #0x32]
_0804504E:
	ldrb r0, [r7]
	str r7, [sp]
	movs r3, #0xb6
	adds r3, r3, r6
	mov r8, r3
	movs r1, #0x36
	adds r1, r1, r6
	mov sl, r1
	adds r5, r6, #0
	adds r5, #0xb8
	adds r2, r6, #0
	adds r2, #0x76
	str r2, [sp, #4]
	adds r7, r6, #0
	adds r7, #0xba
	cmp r0, #0x1b
	bne _080450BA
	movs r0, #0xfb
	bl m4aSongNumStart
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0x10
	strb r0, [r1]
	movs r3, #0
	movs r0, #0xcb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, _08045110 @ =gUnknown_080D7FB0
	mov ip, r1
	movs r4, #0xff
_0804508C:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #4
	add r0, sb
	adds r2, r6, r0
	lsls r1, r3, #3
	add r1, ip
	ldrh r0, [r1, #4]
	strh r0, [r2, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _0804508C
_080450BA:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sl
	adds r4, r5, #0
	ldrh r1, [r4]
	strh r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldr r3, [sp, #4]
	adds r0, r3, r0
	ldrh r1, [r7]
	strh r1, [r0]
	ldr r2, _08045108 @ =gSineTable
	ldrh r0, [r6, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	bge _08045114
	ldrh r0, [r4]
	adds r0, #0xa
	strh r0, [r4]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r3
	ble _08045124
	strh r3, [r4]
	b _08045124
	.align 2, 0
_08045108: .4byte gSineTable
_0804510C: .4byte gPlayer
_08045110: .4byte gUnknown_080D7FB0
_08045114:
	ldrh r0, [r5]
	subs r0, #0xa
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, r3
	bge _08045124
	strh r3, [r5]
_08045124:
	ldrh r0, [r6, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r3, r0, #9
	adds r1, r7, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bge _08045150
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r3
	ble _08045160
	strh r3, [r1]
	b _08045160
_08045150:
	ldrh r0, [r7]
	subs r0, #0xa
	strh r0, [r7]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, r3
	bge _08045160
	strh r3, [r7]
_08045160:
	ldr r2, [sp]
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r3, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080451A0
	adds r1, r6, #0
	adds r1, #0xbf
	strb r0, [r1]
	movs r0, #0xbd
	lsls r0, r0, #2
	adds r2, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	str r0, [r2, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080451C0 @ =0x00000315
	adds r1, r6, r0
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_080451A0:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	mov r2, r8
	strb r0, [r2]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080451C0: .4byte 0x00000315

	thumb_func_start sub_80451C4
sub_80451C4: @ 0x080451C4
	push {r4, lr}
	mov ip, r0
	ldrh r0, [r0, #0x32]
	subs r0, #0xc
	ldr r1, _0804523C @ =0x000003FF
	ands r0, r1
	mov r1, ip
	strh r0, [r1, #0x32]
	mov r2, ip
	adds r2, #0xb6
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #0x36
	adds r1, r1, r0
	mov r3, ip
	adds r3, #0xb8
	ldrh r0, [r3]
	strh r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x76
	adds r1, r1, r0
	mov r0, ip
	adds r0, #0xba
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08045240 @ =gSineTable
	mov r4, ip
	ldrh r0, [r4, #0x32]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	mov r0, ip
	adds r0, #0xbe
	ldrb r0, [r0]
	lsrs r0, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #0xb
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045244
	ldrh r0, [r3]
	adds r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	ble _08045254
	b _08045252
	.align 2, 0
_0804523C: .4byte 0x000003FF
_08045240: .4byte gSineTable
_08045244:
	ldrh r0, [r3]
	subs r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045254
_08045252:
	strh r1, [r3]
_08045254:
	mov r1, ip
	ldrh r0, [r1, #0x32]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	mov r2, ip
	adds r2, #0xbe
	ldrb r0, [r2]
	lsrs r0, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #0xb
	mov r3, ip
	adds r3, #0xba
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _08045290
	ldrh r0, [r3]
	adds r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	ble _080452A0
	b _0804529E
_08045290:
	ldrh r0, [r3]
	subs r0, #0xa
	strh r0, [r3]
	movs r4, #0
	ldrsh r0, [r3, r4]
	cmp r0, r1
	bge _080452A0
_0804529E:
	strh r1, [r3]
_080452A0:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r2, #0xff
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080452DE
	mov r1, ip
	adds r1, #0xbf
	strb r0, [r1]
	movs r1, #0xbd
	lsls r1, r1, #2
	add r1, ip
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	str r0, [r1, #0x30]
	movs r0, #0xa8
	lsls r0, r0, #2
	strh r0, [r1, #0xa]
	movs r1, #0xc5
	lsls r1, r1, #2
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	ldr r1, _080452F4 @ =0x00000315
	add r1, ip
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
_080452DE:
	mov r0, ip
	adds r0, #0xb6
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0x1f
	ands r1, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080452F4: .4byte 0x00000315

	thumb_func_start sub_80452F8
sub_80452F8: @ 0x080452F8
	push {r4, lr}
	adds r2, r0, #0
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r3, r2, r0
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	bne _08045362
	movs r0, #0x1e
	strb r0, [r2, #0x12]
	ldr r4, _0804533C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	beq _0804534C
	ldr r0, _08045340 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804534C
	ldr r0, _08045344 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _0804534C
	ldr r0, _08045348 @ =0x0000013B
	strh r0, [r3, #0xa]
	adds r0, #0x95
	adds r1, r2, r0
	b _08045356
	.align 2, 0
_0804533C: .4byte gCurrentLevel
_08045340: .4byte gSelectedCharacter
_08045344: .4byte gLoadedSaveGame
_08045348: .4byte 0x0000013B
_0804534C:
	movs r0, #0xab
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
_08045356:
	movs r0, #1
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_08045362:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045368
sub_8045368: @ 0x08045368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0xd8
	lsls r7, r7, #1
	add r7, r8
	ldrb r0, [r0, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1, #0x10]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804538E
	movs r0, #0x8f
	bl m4aSongNumStart
	b _08045394
_0804538E:
	movs r0, #0xeb
	bl m4aSongNumStart
_08045394:
	movs r0, #0
	movs r1, #0x1e
	mov r2, r8
	strb r1, [r2, #0x13]
	strb r0, [r2, #0x12]
	ldr r2, _080453D0 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0x1c
	beq _080453E8
	ldr r0, _080453D4 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080453E8
	ldr r0, _080453D8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bgt _080453E8
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _080453E0
	ldr r0, _080453DC @ =0x0000013B
	b _080453F4
	.align 2, 0
_080453D0: .4byte gCurrentLevel
_080453D4: .4byte gSelectedCharacter
_080453D8: .4byte gLoadedSaveGame
_080453DC: .4byte 0x0000013B
_080453E0:
	ldr r0, _080453E4 @ =0x0000013B
	b _08045464
	.align 2, 0
_080453E4: .4byte 0x0000013B
_080453E8:
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _08045460
	movs r0, #0xab
	lsls r0, r0, #2
_080453F4:
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0804544C @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08045450 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _0804546E
	ldr r0, _08045454 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804546E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08045458 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08045440
	movs r0, #0xff
_08045440:
	strb r0, [r1]
	ldr r1, _0804545C @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
	b _0804546E
	.align 2, 0
_0804544C: .4byte gLevelScore
_08045450: .4byte 0x0000C350
_08045454: .4byte gGameMode
_08045458: .4byte gNumLives
_0804545C: .4byte gUnknown_030054A8
_08045460:
	movs r0, #0xab
	lsls r0, r0, #2
_08045464:
	strh r0, [r7, #0xa]
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
_0804546E:
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0804549C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1c
	beq _08045490
	mov r1, r8
	ldrb r0, [r1, #0x10]
	cmp r0, #4
	bne _08045490
	ldr r1, _080454A0 @ =gUnknown_030054A8
	movs r0, #0x11
	strb r0, [r1, #1]
_08045490:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804549C: .4byte gCurrentLevel
_080454A0: .4byte gUnknown_030054A8

	thumb_func_start sub_80454A4
sub_80454A4: @ 0x080454A4
	push {r4, lr}
	adds r2, r0, #0
	movs r1, #0
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _080454BA
	subs r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080454D0
_080454BA:
	ldrb r0, [r2, #0x12]
	cmp r0, #0
	beq _080454CC
	subs r0, #1
	strb r0, [r2, #0x12]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080454CC
	movs r1, #1
_080454CC:
	cmp r1, #0
	beq _0804555E
_080454D0:
	movs r0, #0xd8
	lsls r0, r0, #1
	adds r3, r2, r0
	ldr r4, _08045510 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1c
	beq _08045534
	ldr r0, _08045514 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08045534
	ldr r0, _08045518 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r1, [r0, #7]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bgt _08045534
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08045520
	ldr r0, _0804551C @ =0x0000013B
	strh r0, [r3, #0xa]
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r0, #3
	b _08045554
	.align 2, 0
_08045510: .4byte gCurrentLevel
_08045514: .4byte gSelectedCharacter
_08045518: .4byte gLoadedSaveGame
_0804551C: .4byte 0x0000013B
_08045520:
	movs r0, #0
	ldr r1, _08045530 @ =0x0000013B
	strh r1, [r3, #0xa]
	movs r4, #0xe8
	lsls r4, r4, #1
	adds r1, r2, r4
	b _08045554
	.align 2, 0
_08045530: .4byte 0x0000013B
_08045534:
	ldrb r0, [r2, #0x10]
	cmp r0, #0
	bne _08045548
	movs r0, #0xab
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #3
	b _08045554
_08045548:
	movs r0, #0
	movs r1, #0xab
	lsls r1, r1, #2
	strh r1, [r3, #0xa]
	adds r1, r3, #0
	adds r1, #0x20
_08045554:
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
_0804555E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8045564
sub_8045564: @ 0x08045564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0804557A
	b _08045858
_0804557A:
	ldr r1, _08045868 @ =gUnknown_03005590
	ldr r0, [r1]
	movs r1, #7
	bl Mod
	adds r5, r0, #0
	cmp r5, #0
	bne _0804563E
	ldr r2, _0804586C @ =gPseudoRandom
	ldr r0, [r2]
	ldr r3, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r3, r2
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r2, r2, r4
	ldr r0, _0804586C @ =gPseudoRandom
	str r2, [r0]
	movs r0, #0x1f
	ands r0, r2
	adds r6, r0, #0
	adds r6, #0x18
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r7, r0, #2
	ldr r4, _08045878 @ =0x000003FF
	adds r0, r4, #0
	ands r7, r0
	mov r0, sb
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r3, _0804587C @ =gCamera
	mov ip, r3
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r4, _08045880 @ =gSineTable
	mov sl, r4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r7, r3
	lsls r0, r0, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x14]
	mov r0, sb
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	lsls r0, r7, #1
	add r0, sl
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r6, r0
	asrs r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x18]
	mov r0, sp
	strh r5, [r0, #0x1c]
	str r0, [sp, #0x20]
	ldr r3, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	ldr r0, _0804586C @ =gPseudoRandom
	str r1, [r0]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	ldr r1, [sp, #0x20]
	strh r0, [r1, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r5, [r0, #0xa]
	str r5, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl CreateBossParticleWithExplosionUpdate
_0804563E:
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	movs r1, #0xa
	bl Mod
	str r0, [sp, #0x24]
	cmp r0, #0
	bne _0804572E
	ldr r3, _0804586C @ =gPseudoRandom
	mov r8, r3
	ldr r0, [r3]
	ldr r4, _08045870 @ =0x00196225
	muls r0, r4, r0
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r3]
	movs r1, #0x1f
	ands r0, r1
	adds r6, r0, #0
	adds r6, #0x18
	ldr r2, _08045868 @ =gUnknown_03005590
	ldr r0, [r2]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #5
	adds r1, r1, r0
	lsls r7, r1, #2
	ldr r3, _08045878 @ =0x000003FF
	adds r1, r3, #0
	ands r7, r1
	movs r1, #6
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r4, sb
	ldr r2, [r4, #4]
	asrs r2, r2, #8
	ldr r1, _0804587C @ =gCamera
	mov sl, r1
	ldr r1, [r1]
	subs r2, r2, r1
	str r2, [sp, #0x14]
	ldr r3, _08045880 @ =gSineTable
	mov ip, r3
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r7, r4
	lsls r1, r1, #1
	add r1, ip
	movs r3, #0
	ldrsh r1, [r1, r3]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x14]
	mov r4, sb
	ldr r2, [r4, #8]
	asrs r2, r2, #8
	mov r3, sl
	ldr r1, [r3, #4]
	subs r2, r2, r1
	str r2, [sp, #0x18]
	lsls r1, r7, #1
	add r1, ip
	movs r4, #0
	ldrsh r1, [r1, r4]
	muls r1, r6, r1
	asrs r1, r1, #0xe
	adds r2, r2, r1
	str r2, [sp, #0x18]
	mov r2, sp
	movs r1, #0x40
	strh r1, [r2, #0x1c]
	mov r1, sp
	str r1, [sp, #0x28]
	mov r2, r8
	ldr r1, [r2]
	ldr r3, _08045870 @ =0x00196225
	muls r1, r3, r1
	ldr r4, _08045874 @ =0x3C6EF35F
	adds r1, r1, r4
	str r1, [r2]
	ldr r2, _08045878 @ =0x000003FF
	ands r1, r2
	ldr r2, [sp, #0x28]
	strh r1, [r2, #0xc]
	mov r2, sp
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r2, #0xe]
	ldr r2, _08045890 @ =gUnknown_080D79D0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r0, r1, r2
	ldr r0, [r0]
	lsls r0, r0, #5
	ldr r3, _08045894 @ =0x06010000
	adds r0, r0, r3
	str r0, [sp]
	mov r4, sp
	adds r0, r2, #4
	adds r0, r1, r0
	ldr r0, [r0]
	strh r0, [r4, #8]
	mov r0, sp
	str r0, [sp, #0x30]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, [sp, #0x30]
	strh r0, [r1, #0xa]
	ldr r2, [sp, #0x24]
	str r2, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	mov r0, sp
	bl CreateBossParticleWithExplosionUpdate
_0804572E:
	ldr r3, _08045868 @ =gUnknown_03005590
	ldr r0, [r3]
	movs r1, #9
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _080457C4
	ldr r4, _0804586C @ =gPseudoRandom
	mov sl, r4
	ldr r0, [r4]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc4
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	mov ip, r4
	ldr r0, [r4]
	subs r1, r1, r0
	movs r4, #0xf
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xc8
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r3, ip
	ldr r0, [r3, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r4
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r4, sp
	ldr r0, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r2, _08045874 @ =0x3C6EF35F
	adds r1, r1, r2
	mov r3, sl
	str r1, [r3]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r4, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl CreateBossParticleWithExplosionUpdate
_080457C4:
	ldr r4, _08045868 @ =gUnknown_03005590
	ldr r0, [r4]
	movs r1, #0xb
	bl Mod
	adds r7, r0, #0
	cmp r7, #0
	bne _08045858
	ldr r0, _0804586C @ =gPseudoRandom
	mov sl, r0
	ldr r0, [r0]
	ldr r1, _08045870 @ =0x00196225
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r3, _08045874 @ =0x3C6EF35F
	adds r2, r2, r3
	mov r0, sb
	adds r0, #0xcc
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r4, _0804587C @ =gCamera
	ldr r0, [r4]
	subs r1, r1, r0
	movs r3, #0xf
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x14]
	ldr r0, _08045870 @ =0x00196225
	muls r2, r0, r2
	ldr r1, _08045874 @ =0x3C6EF35F
	adds r2, r2, r1
	mov r0, sb
	adds r0, #0xd0
	ldr r1, [r0]
	asrs r1, r1, #8
	ldr r0, [r4, #4]
	subs r1, r1, r0
	adds r0, r2, #0
	ands r0, r3
	adds r1, r1, r0
	subs r1, #8
	str r1, [sp, #0x18]
	mov r0, sp
	strh r7, [r0, #0x1c]
	mov r3, sp
	ldr r4, _08045870 @ =0x00196225
	adds r1, r2, #0
	muls r1, r4, r1
	ldr r0, _08045874 @ =0x3C6EF35F
	adds r1, r1, r0
	mov r2, sl
	str r1, [r2]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, _08045884 @ =0x00000407
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	mov r1, sp
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08045888 @ =0x06012980
	str r0, [sp]
	ldr r0, _0804588C @ =0x0000026B
	strh r0, [r1, #8]
	mov r0, sp
	strh r7, [r0, #0xa]
	str r7, [sp, #4]
	mov r1, sb
	adds r1, #0x14
	bl CreateBossParticleWithExplosionUpdate
_08045858:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045868: .4byte gUnknown_03005590
_0804586C: .4byte gPseudoRandom
_08045870: .4byte 0x00196225
_08045874: .4byte 0x3C6EF35F
_08045878: .4byte 0x000003FF
_0804587C: .4byte gCamera
_08045880: .4byte gSineTable
_08045884: .4byte 0x00000407
_08045888: .4byte 0x06012980
_0804588C: .4byte 0x0000026B
_08045890: .4byte gUnknown_080D79D0
_08045894: .4byte 0x06010000

	thumb_func_start sub_8045898
sub_8045898: @ 0x08045898
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0804597C
	ldr r0, _080458DC @ =gUnknown_03005590
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	lsrs r7, r0, #1
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080458EC
	movs r2, #0
	ldr r0, _080458E0 @ =gFlags
	mov ip, r0
	ldr r6, _080458E4 @ =gObjPalette
	ldr r5, _080458E8 @ =gUnknown_080D7FF0
	lsls r3, r7, #5
_080458BE:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080458BE
	b _08045910
	.align 2, 0
_080458DC: .4byte gUnknown_03005590
_080458E0: .4byte gFlags
_080458E4: .4byte gObjPalette
_080458E8: .4byte gUnknown_080D7FF0
_080458EC:
	movs r2, #0
	ldr r1, _08045940 @ =gFlags
	mov ip, r1
	ldr r5, _08045944 @ =gObjPalette
	ldr r3, _08045948 @ =gUnknown_080D8010
_080458F6:
	adds r1, r2, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _080458F6
_08045910:
	ldrb r0, [r4, #0x1f]
	cmp r0, #0
	beq _08045950
	subs r0, #1
	strb r0, [r4, #0x1f]
	movs r2, #0
	ldr r5, _08045944 @ =gObjPalette
	ldr r4, _0804594C @ =gUnknown_080D7FF0
	lsls r3, r7, #5
_08045922:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r5
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08045922
	b _08045970
	.align 2, 0
_08045940: .4byte gFlags
_08045944: .4byte gObjPalette
_08045948: .4byte gUnknown_080D8010
_0804594C: .4byte gUnknown_080D7FF0
_08045950:
	movs r2, #0
	ldr r4, _08045984 @ =gObjPalette
	ldr r3, _08045988 @ =gUnknown_080D8010
_08045956:
	adds r1, r2, #0
	adds r1, #0x90
	lsls r1, r1, #1
	adds r1, r1, r4
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _08045956
_08045970:
	mov r1, ip
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	mov r1, ip
	str r0, [r1]
_0804597C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045984: .4byte gObjPalette
_08045988: .4byte gUnknown_080D8010

	thumb_func_start sub_804598C
sub_804598C: @ 0x0804598C
	push {lr}
	ldr r0, _0804599C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0804599C: .4byte gCurTask

	thumb_func_start sub_80459A0
sub_80459A0: @ 0x080459A0
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	bne _080459C2
	ldrh r2, [r1, #0x30]
	ldrh r0, [r1, #0x16]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _080459C8 @ =0x000003FF
	ands r0, r3
	cmp r2, r0
	beq _080459C2
	adds r0, r2, #1
	ands r0, r3
	strh r0, [r1, #0x30]
_080459C2:
	pop {r0}
	bx r0
	.align 2, 0
_080459C8: .4byte 0x000003FF

	thumb_func_start TaskDestructor_EggSaucerMain
TaskDestructor_EggSaucerMain: @ 0x080459CC
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _080459E4 @ =IWRAM_START + 0x4AC
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _080459E8 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080459E4: .4byte IWRAM_START + 0x4AC
_080459E8: .4byte gActiveBossTask
