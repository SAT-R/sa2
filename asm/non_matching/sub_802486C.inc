.include "constants/constants.inc"

.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0     @ r3 = p
	adds r6, r1, #0     @ r6 = p2
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0          @ ip = p2->s
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080248E0
	adds r0, r3, #0
	adds r0, #0x66
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	beq _080248E0
	ldr r7, _08024908 @ =gUnknown_080D6736
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r5, r3, #0
	adds r5, #0x68
	strh r4, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x4f
	bgt _080248C6
	ldr r0, _0802490C @ =gPlayerCharacterIdleAnims
	adds r1, r3, #0
	adds r1, #0x85
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r4, r0
	strh r0, [r5]
_080248C6:
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r1, r7, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_080248E0:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r1          @ r8 = &p->unk64
	adds r4, r3, #0
	adds r4, #0x68      @ r4 = &p->anim
	adds r2, r3, #0
	adds r2, #0x6a      @ r2 = &p->variant
	cmp r0, #0x34
	bls _080248FC
	b _08024A96
_080248FC:
	lsls r0, r0, #2
	ldr r1, _08024910 @ =_08024914
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024908: .4byte gUnknown_080D6736
_0802490C: .4byte gPlayerCharacterIdleAnims
_08024910: .4byte _08024914
_08024914: @ jump table
	.4byte _080249E8 @ case 0 + 9
	.4byte _08024A96 @ case 1
	.4byte _08024A96 @ case 2
	.4byte _08024A96 @ case 3
	.4byte _08024A96 @ case 4
	.4byte _08024A96 @ case 5
	.4byte _08024A96 @ case 6
	.4byte _08024A3A @ case 7 + 9
	.4byte _08024A96 @ case 8
	.4byte _08024A96 @ case 9
	.4byte _08024A96 @ case 10
	.4byte _08024A96 @ case 11
	.4byte _08024A96 @ case 12
	.4byte _08024A96 @ case 13
	.4byte _08024A96 @ case 14
	.4byte _08024A96 @ case 15
	.4byte _08024A96 @ case 16
	.4byte _08024A96 @ case 17
	.4byte _08024A96 @ case 18
	.4byte _08024A96 @ case 19
	.4byte _08024A96 @ case 20
	.4byte _08024A96 @ case 21
	.4byte _08024A96 @ case 22
	.4byte _08024A96 @ case 23
	.4byte _08024A96 @ case 24
	.4byte _08024A96 @ case 25
	.4byte _08024A96 @ case 26
	.4byte _08024A96 @ case 27
	.4byte _08024A96 @ case 28
	.4byte _08024A96 @ case 29
	.4byte _08024A96 @ case 30
	.4byte _08024A96 @ case 31
	.4byte _08024A96 @ case 32
	.4byte _08024A96 @ case 33
	.4byte _08024A96 @ case 34
	.4byte _08024A96 @ case 35
	.4byte _08024A96 @ case 36
	.4byte _08024A96 @ case 37
	.4byte _08024A96 @ case 38
	.4byte _08024A96 @ case 39
	.4byte _08024A96 @ case 40
	.4byte _08024A96 @ case 41
	.4byte _08024A70 @ case 42 + 9
	.4byte _08024A70 @ case 43 + 9
	.4byte _08024A76 @ case 44 + 9
	.4byte _08024A76 @ case 45 + 9
	.4byte _08024A96 @ case 46
	.4byte _08024A96 @ case 47
	.4byte _08024A96 @ case 48
	.4byte _08024A96 @ case 49
	.4byte _08024A10 @ case 50 + 9
	.4byte _08024A10 @ case 51 + 9
	.4byte _08024A10 @ case 52 + 9
_080249E8:
	ldr r1, _08024A2C @ =gPlayerCharacterIdleAnims
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #9
	adds r1, r3, #0
	adds r1, #0x68
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r4, r1, #0 @r4 = &p->anim
_08024A10:
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A20
	rsbs r0, r0, #0
_08024A20:
	cmp r0, #7
	ble _08024A30
	cmp r0, #0x80
	ble _08024A32
	movs r0, #0x80
	b _08024A32
	.align 2, 0
_08024A2C: .4byte gPlayerCharacterIdleAnims
_08024A30:
	movs r0, #8
_08024A32:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	b _08024A96
_08024A3A:
	adds r0, r3, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
	cmp r0, #1
	bne _08024A96
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _08024A60
	rsbs r0, r0, #0
_08024A60:
	cmp r0, #7
	ble _08024A6C
	cmp r0, #0x80
	ble _08024A88
	movs r0, #0x80
	b _08024A88
_08024A6C:
	movs r0, #8
	b _08024A88
_08024A70:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	b _08024A7A
_08024A76:
	movs r4, #0x14
	ldrsh r0, [r3, r4]
_08024A7A:
	cmp r0, #0
	bge _08024A80
	rsbs r0, r0, #0
_08024A80:
	asrs r1, r0, #8
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #8
_08024A88:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x68
	adds r2, r3, #0
	adds r2, #0x6a
_08024A96:
	ldr r0, _08024B0C @ =gGameMode
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _08024AA8
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
_08024AA8:
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r1, [r0]
	adds r6, r0, #0 @ r6 = &p->unk6C
	mov r5, ip
	adds r5, #0x20
	cmp r1, #0
	bne _08024ACA
	mov r1, ip
	ldrh r0, [r1, #0xa]
	ldrh r1, [r4]
	cmp r0, r1
	bne _08024ACA
	ldrb r0, [r5]
	ldrh r1, [r2]
	cmp r0, r1
	beq _08024AF6
_08024ACA:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r2]
	strb r0, [r5]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	ldrb r0, [r7]
	cmp r0, #2
	bls _08024AF6
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #1
	strb r0, [r1]
_08024AF6:
	mov r0, r8
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024B0C: .4byte gGameMode

.syntax divided
