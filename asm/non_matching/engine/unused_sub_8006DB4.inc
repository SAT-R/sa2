.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov sl, r1
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	add r6, sp, #4
	ldr r1, _08006E10 @ =gUnknown_080984F4
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	add r5, sp, #0xc
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	bl memset
	add r4, sp, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl memset
	ldr r1, _08006E14 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	cmp r7, #1
	bls _08006E2C
	ldr r1, _08006E18 @ =gHBlankCopySize
	strb r2, [r1]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006E20
	ldr r0, _08006E1C @ =gBgOffsetsHBlank
	ldr r0, [r0]
	adds r4, r0, #2
	b _08006E54
	.align 2, 0
_08006E10: .4byte gUnknown_080984F4
_08006E14: .4byte gFlags
_08006E18: .4byte gHBlankCopySize
_08006E1C: .4byte gBgOffsetsHBlank
_08006E20:
	ldr r0, _08006E28 @ =gBgOffsetsHBlank
	ldr r4, [r0]
	b _08006E54
	.align 2, 0
_08006E28: .4byte gBgOffsetsHBlank
_08006E2C:
	ldr r1, _08006E44 @ =gHBlankCopySize
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08006E48 @ =gBgOffsetsHBlank
	ldr r4, [r0]
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _08006E54
	ldr r1, _08006E4C @ =gHBlankCopyTarget
	ldr r0, _08006E50 @ =0x04000042
	b _08006E58
	.align 2, 0
_08006E44: .4byte gHBlankCopySize
_08006E48: .4byte gBgOffsetsHBlank
_08006E4C: .4byte gHBlankCopyTarget
_08006E50: .4byte 0x04000042
_08006E54:
	ldr r1, _08006F68 @ =gHBlankCopyTarget
	ldr r0, _08006F6C @ =0x04000040
_08006E58:
	str r0, [r1]
	mov r1, sl
	ldrb r0, [r1, #5]
	ldrb r2, [r1, #1]
	adds r5, r2, #0
	adds r1, r0, #0
	cmp r0, r5
	bls _08006E6A
	adds r0, r2, #0
_08006E6A:
	adds r3, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp ip, r5
	bhs _08006E78
	adds r1, r2, #0
_08006E78:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r2, _08006F70 @ =gHBlankCopySize
	ldrb r0, [r2]
	muls r0, r3, r0
	adds r4, r4, r0
	mov r2, sp
	mov r7, sl
	ldrb r0, [r7, #2]
	ldrb r1, [r7]
	subs r0, r0, r1
	strh r0, [r2]
	adds r7, r6, #0
	mov r1, sl
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #1]
	subs r0, r0, r1
	strh r0, [r7]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _08006EAA
	rsbs r0, r0, #0
_08006EAA:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0xc]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _08006EBA
	rsbs r0, r0, #0
_08006EBA:
	lsls r0, r0, #1
	mov r1, sp
	strh r0, [r1, #0x10]
	mov r2, sp
	mov r1, sl
	ldrb r0, [r1, #6]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	strh r0, [r2, #2]
	mov r2, sl
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #5]
	subs r0, r0, r1
	strh r0, [r7, #2]
	mov r0, sp
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08006EE2
	rsbs r0, r0, #0
_08006EE2:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0xe]
	movs r1, #2
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bge _08006EF2
	rsbs r0, r0, #0
_08006EF2:
	lsls r0, r0, #1
	mov r2, sp
	strh r0, [r2, #0x12]
	add r2, sp, #0x14
	mov r7, sl
	ldrb r0, [r7]
	strb r0, [r2]
	ldrb r0, [r7, #4]
	strb r0, [r2, #1]
	add r1, sp, #8
	ldrh r0, [r6]
	rsbs r0, r0, #0
	strh r0, [r1]
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
	adds r6, r2, #0
	cmp r3, r8
	bne _08006F1A
	b _0800702C
_08006F1A:
	cmp r5, ip
	bhs _08006FB0
	cmp r3, r8
	blo _08006F24
	b _0800702C
_08006F24:
	adds r7, r6, #0
	adds r5, r1, #0
_08006F28:
	mov r0, sb
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r5]
	lsls r0, r0, #0x10
	adds r3, #1
	mov ip, r3
	cmp r0, #0
	blt _08006F98
	add r2, sp, #8
	add r3, sp, #0x10
_08006F48:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08006F74
	ldrb r0, [r7]
	cmp sb, r0
	ble _08006F5C
	adds r0, #1
	strb r0, [r6]
_08006F5C:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _08006F90
	.align 2, 0
_08006F68: .4byte gHBlankCopyTarget
_08006F6C: .4byte 0x04000040
_08006F70: .4byte gHBlankCopySize
_08006F74:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08006F7E
	subs r0, #1
	strb r0, [r6]
_08006F7E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08006F90
	ldrb r0, [r6]
	strb r0, [r4, #1]
_08006F90:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08006F48
_08006F98:
	ldr r2, _08006FAC @ =gHBlankCopySize
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08006F28
	b _0800702C
	.align 2, 0
_08006FAC: .4byte gHBlankCopySize
_08006FB0:
	cmp r3, r8
	bhs _0800702C
	adds r7, r6, #0
	add r5, sp, #8
_08006FB8:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	ldrh r1, [r5, #2]
	mov r2, sp
	ldrh r0, [r2, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #2]
	lsls r1, r1, #0x10
	adds r3, #1
	mov ip, r3
	cmp r1, #0
	blt _0800701C
	add r2, sp, #8
	add r3, sp, #0x10
_08006FD8:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08007002
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _08006FEC
	adds r0, #1
	strb r0, [r6, #1]
_08006FEC:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007014
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _08007014
_08007002:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0800700C
	subs r0, #1
	strb r0, [r6, #1]
_0800700C:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_08007014:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006FD8
_0800701C:
	ldr r1, _08007090 @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r4, r4, r0
	mov r2, ip
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08006FB8
_0800702C:
	mov r7, sl
	ldrb r0, [r7, #7]
	ldrb r1, [r7, #3]
	cmp r0, r1
	bls _08007038
	adds r0, r1, #0
_08007038:
	mov r8, r0
	cmp r3, r8
	bhs _08007118
	adds r7, r6, #0
	add r5, sp, #8
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x18]
_08007048:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	ldr r1, [sp, #0x18]
	ldrh r2, [r1]
	ldrh r0, [r5]
	adds r2, r2, r0
	strh r2, [r5]
	ldrh r1, [r1, #2]
	mov ip, r1
	ldrh r0, [r5, #2]
	add r0, ip
	strh r0, [r5, #2]
	lsls r2, r2, #0x10
	adds r3, #1
	mov ip, r3
	cmp r2, #0
	blt _080070B8
	add r2, sp, #8
	add r3, sp, #0x10
_08007072:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08007094
	ldrb r0, [r7]
	cmp sb, r0
	ble _08007086
	adds r0, #1
	strb r0, [r6]
_08007086:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _080070B0
	.align 2, 0
_08007090: .4byte gHBlankCopySize
_08007094:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800709E
	subs r0, #1
	strb r0, [r6]
_0800709E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _080070B0
	ldrb r0, [r6]
	strb r0, [r4, #1]
_080070B0:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08007072
_080070B8:
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007108
	add r2, sp, #8
	add r3, sp, #0x10
_080070C4:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _080070EE
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _080070D8
	adds r0, #1
	strb r0, [r6, #1]
_080070D8:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007100
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _08007100
_080070EE:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _080070F8
	subs r0, #1
	strb r0, [r6, #1]
_080070F8:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_08007100:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080070C4
_08007108:
	ldr r2, _08007188 @ =gHBlankCopySize
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _08007048
_08007118:
	mov r2, sl
	ldrb r0, [r2, #7]
	ldrb r1, [r2, #3]
	adds r2, r1, #0
	adds r7, r0, #0
	cmp r0, r2
	bhs _08007128
	adds r0, r1, #0
_08007128:
	mov r8, r0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	cmp r2, r0
	bhi _080071BC
	cmp r3, r8
	blo _08007138
	b _08007238
_08007138:
	adds r7, r6, #0
	add r5, sp, #8
_0800713C:
	ldrb r0, [r7, #1]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	ldrh r1, [r5, #2]
	mov r2, sp
	ldrh r0, [r2, #0xe]
	adds r1, r1, r0
	strh r1, [r5, #2]
	lsls r1, r1, #0x10
	adds r3, #1
	mov ip, r3
	cmp r1, #0
	blt _080071A6
	add r2, sp, #8
	add r3, sp, #0x10
_0800715C:
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800718C
	ldrb r0, [r6, #1]
	cmp sb, r0
	ble _08007170
	adds r0, #1
	strb r0, [r6, #1]
_08007170:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800719E
	ldrb r0, [r6, #1]
	adds r0, #1
	strb r0, [r4]
	b _0800719E
	.align 2, 0
_08007188: .4byte gHBlankCopySize
_0800718C:
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _08007196
	subs r0, #1
	strb r0, [r6, #1]
_08007196:
	ldrh r0, [r2, #2]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
_0800719E:
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800715C
_080071A6:
	ldr r1, _080071B8 @ =gHBlankCopySize
	ldrb r0, [r1]
	adds r4, r4, r0
	mov r2, ip
	lsls r0, r2, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _0800713C
	b _08007238
	.align 2, 0
_080071B8: .4byte gHBlankCopySize
_080071BC:
	cmp r3, r8
	bhs _08007238
	adds r7, r6, #0
	add r5, sp, #8
_080071C4:
	mov r0, sb
	strb r0, [r4]
	ldrb r0, [r7]
	strb r0, [r4, #1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldrh r2, [r5]
	adds r0, r0, r2
	strh r0, [r5]
	lsls r0, r0, #0x10
	adds r3, #1
	mov ip, r3
	cmp r0, #0
	blt _08007228
	add r2, sp, #8
	add r3, sp, #0x10
_080071E4:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08007202
	ldrb r0, [r7]
	cmp sb, r0
	ble _080071F8
	adds r0, #1
	strb r0, [r6]
_080071F8:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	b _08007220
_08007202:
	adds r1, r6, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800720E
	subs r0, #1
	strb r0, [r1]
_0800720E:
	ldrh r0, [r2]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08007220
	ldrb r0, [r6]
	strb r0, [r4, #1]
_08007220:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _080071E4
_08007228:
	ldr r2, _08007248 @ =gHBlankCopySize
	ldrb r0, [r2]
	adds r4, r4, r0
	mov r1, ip
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r8
	blo _080071C4
_08007238:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007248: .4byte gHBlankCopySize

.if 0
.endif

.syntax divided
