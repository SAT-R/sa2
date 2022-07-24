.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

@; CreateTimeAttackProgress
	thumb_func_start sub_8086CE8
sub_8086CE8: @ 0x08086CE8
	push {r4, lr}
	sub sp, #4
	ldr r0, _08086D50 @ =sub_8086EDC
	movs r1, #0x92
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _08086D54 @ =sub_8086FC8
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	ldr r0, _08086D58 @ =gCurrentLevel
	ldrb r3, [r0]
	lsls r1, r3, #0x18
	asrs r1, r1, #0x19
	movs r0, #1
	ands r0, r3
	adds r1, r1, r0
	ldr r0, _08086D5C @ =IWRAM_START + 0x120
	adds r2, r2, r0
	strb r1, [r2]
	movs r1, #0
	ldr r2, _08086D60 @ =gUnknown_030055A0
	ldr r0, [r2]
	cmp r0, #0
	beq _08086D3A
_08086D26:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _08086D3A
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	bne _08086D26
_08086D3A:
	ldr r2, _08086D64 @ =0x00000121
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8086D68
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086D50: .4byte sub_8086EDC
_08086D54: .4byte sub_8086FC8
_08086D58: .4byte gCurrentLevel
_08086D5C: .4byte IWRAM_START + 0x120
_08086D60: .4byte gUnknown_030055A0
_08086D64: .4byte 0x00000121

	thumb_func_start sub_8086D68
sub_8086D68: @ 0x08086D68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	ldr r1, _08086DDC @ =gUnknown_080E02D4
	mov r0, sp
	movs r2, #6
	bl memcpy
	movs r4, #0
	ldr r0, _08086DE0 @ =0x00000121
	add r0, sl
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08086E20
	movs r5, #0
_08086D8E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	mov r1, sl
	adds r7, r1, r0
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _08086DE4 @ =0x00000465
	strh r0, [r7, #0xa]
	ldr r2, _08086DE8 @ =gUnknown_03005500
	adds r2, r4, r2
	movs r0, #0
	ldrsb r0, [r2, r0]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #6
	strh r0, [r7, #0x16]
	movs r0, #0x8e
	strh r0, [r7, #0x18]
	ldr r0, _08086DEC @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08086DF0
	movs r0, #0x80
	b _08086DF2
	.align 2, 0
_08086DDC: .4byte gUnknown_080E02D4
_08086DE0: .4byte 0x00000121
_08086DE4: .4byte 0x00000465
_08086DE8: .4byte gUnknown_03005500
_08086DEC: .4byte gSelectedCharacter
_08086DF0:
	movs r0, #0xc0
_08086DF2:
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r4, [r0]
	str r5, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08086ECC @ =0x00000121
	add r0, sl
	ldrb r0, [r0]
	cmp r4, r0
	blo _08086D8E
_08086E20:
	mov r7, sl
	adds r7, #0xc0
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	movs r5, #0
	movs r4, #0
	ldr r0, _08086ED0 @ =0x0000036F
	strh r0, [r7, #0xa]
	mov r0, sl
	adds r0, #0xe0
	strb r5, [r0]
	mov r1, sl
	adds r1, #0xe1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0xe
	strh r0, [r7, #0x16]
	movs r0, #0x96
	mov sb, r0
	mov r1, sb
	strh r1, [r7, #0x18]
	adds r0, #0xaa
	mov r8, r0
	mov r1, r8
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r0, sl
	adds r0, #0xe2
	movs r6, #0x10
	strb r6, [r0]
	adds r0, #3
	strb r5, [r0]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	adds r7, #0x30
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0xdc
	lsls r0, r0, #2
	strh r0, [r7, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, sl
	strb r5, [r0]
	ldr r1, _08086ED4 @ =0x00000111
	add r1, sl
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #0xe2
	strh r0, [r7, #0x16]
	mov r0, sb
	strh r0, [r7, #0x18]
	mov r1, r8
	strh r1, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #0x89
	lsls r0, r0, #1
	add r0, sl
	strb r6, [r0]
	ldr r0, _08086ED8 @ =0x00000115
	add r0, sl
	strb r5, [r0]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086ECC: .4byte 0x00000121
_08086ED0: .4byte 0x0000036F
_08086ED4: .4byte 0x00000111
_08086ED8: .4byte 0x00000115

	thumb_func_start sub_8086EDC
sub_8086EDC: @ 0x08086EDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08086F50 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	movs r3, #0
	ldr r0, _08086F54 @ =0x00000121
	mov ip, r0
	ldr r1, _08086F58 @ =IWRAM_START + 0x121
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r3, r0
	bhs _08086F40
	ldr r7, _08086F5C @ =gUnknown_030055A0
	mov r8, r7
	ldr r6, _08086F60 @ =gUnknown_080E02B8
	ldr r0, _08086F64 @ =IWRAM_START + 0x120
	adds r5, r2, r0
_08086F08:
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r1, r4, r1
	lsls r0, r3, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _08086F68 @ =IWRAM_START + 0x50
	adds r0, r0, r2
	movs r7, #0
	ldrsh r2, [r0, r7]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	adds r0, #6
	strh r0, [r1, #0x16]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, ip
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r3, r0
	blo _08086F08
_08086F40:
	adds r0, r4, #0
	bl sub_8086F6C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086F50: .4byte gCurTask
_08086F54: .4byte 0x00000121
_08086F58: .4byte IWRAM_START + 0x121
_08086F5C: .4byte gUnknown_030055A0
_08086F60: .4byte gUnknown_080E02B8
_08086F64: .4byte IWRAM_START + 0x120
_08086F68: .4byte IWRAM_START + 0x50

	thumb_func_start sub_8086F6C
sub_8086F6C: @ 0x08086F6C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08086F84 @ =gUnknown_030059E0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	bne _08086FBE
	movs r4, #0
	b _08086F9A
	.align 2, 0
_08086F84: .4byte gUnknown_030059E0
_08086F88:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08086F9A:
	ldr r1, _08086FC4 @ =0x00000121
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r4, r0
	blo _08086F88
	movs r4, #0
_08086FA6:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xc0
	adds r0, r5, r0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08086FA6
_08086FBE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086FC4: .4byte 0x00000121

	thumb_func_start sub_8086FC8
sub_8086FC8: @ 0x08086FC8
	push {r4, r5, lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	movs r4, #0
	ldr r1, _08086FDC @ =IWRAM_START + 0x121
	adds r0, r0, r1
	b _08086FFA
	.align 2, 0
_08086FDC: .4byte IWRAM_START + 0x121
_08086FE0:
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08087024 @ =0x00000121
	adds r0, r5, r1
_08086FFA:
	ldrb r0, [r0]
	cmp r4, r0
	blo _08086FE0
	movs r4, #0
	adds r5, #0xc4
_08087004:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bls _08087004
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087024: .4byte 0x00000121

	thumb_func_start sub_8087028
sub_8087028: @ 0x08087028
	push {r4, r5, lr}
	ldr r3, _08087078 @ =gUnknown_030059E0
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r2, _0808707C @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r5, _08087080 @ =gCurTask
	ldr r2, [r5]
	ldrh r4, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r4, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r3, [r4]
	movs r2, #0xa0
	subs r2, r2, r3
	bl sub_80871C4
	ldrb r0, [r4]
	adds r0, #4
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x32
	bls _08087070
	ldr r1, [r5]
	ldr r0, _08087084 @ =sub_8087088
	str r0, [r1, #8]
_08087070:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087078: .4byte gUnknown_030059E0
_0808707C: .4byte gUnknown_03005960
_08087080: .4byte gCurTask
_08087084: .4byte sub_8087088

	thumb_func_start sub_8087088
sub_8087088: @ 0x08087088
	push {r4, r5, lr}
	ldr r3, _080870D8 @ =gUnknown_030059E0
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r2, _080870DC @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r5, _080870E0 @ =gCurTask
	ldr r2, [r5]
	ldrh r3, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r3, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x6e
	bl sub_80871C4
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _080870D0
	movs r0, #0x32
	strb r0, [r4]
	ldr r1, [r5]
	ldr r0, _080870E4 @ =sub_80870E8
	str r0, [r1, #8]
_080870D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080870D8: .4byte gUnknown_030059E0
_080870DC: .4byte gUnknown_03005960
_080870E0: .4byte gCurTask
_080870E4: .4byte sub_80870E8

	thumb_func_start sub_80870E8
sub_80870E8: @ 0x080870E8
	push {r4, r5, r6, lr}
	ldr r6, _080871A4 @ =gUnknown_030059E0
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r2, _080871A8 @ =gUnknown_03005960
	ldr r1, [r2]
	subs r0, r0, r1
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldr r2, [r2, #4]
	subs r1, r1, r2
	ldr r2, _080871AC @ =gCurTask
	ldr r2, [r2]
	ldrh r5, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r5, r5, r2
	ldr r4, _080871B0 @ =gUnknown_080E02DC
	ldrb r3, [r5]
	movs r2, #7
	ands r2, r3
	lsls r2, r2, #1
	adds r3, r2, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, #1
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrb r3, [r5]
	movs r2, #0xa0
	subs r2, r2, r3
	bl sub_80871C4
	ldr r1, _080871B4 @ =gBldRegs
	ldrb r0, [r5]
	lsrs r0, r0, #4
	adds r0, #4
	strh r0, [r1, #4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	bls _0808719C
	ldr r0, [r6, #0x20]
	ldr r1, _080871B8 @ =0x40600000
	ands r0, r1
	cmp r0, #0
	bne _08087184
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _08087184
	adds r0, r6, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _08087184
	movs r0, #0x9a
	bl m4aSongNumStart
_08087184:
	ldr r1, _080871B4 @ =gBldRegs
	movs r0, #0
	strh r0, [r1, #4]
	ldr r2, _080871BC @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080871C0 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080871AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0808719C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080871A4: .4byte gUnknown_030059E0
_080871A8: .4byte gUnknown_03005960
_080871AC: .4byte gCurTask
_080871B0: .4byte gUnknown_080E02DC
_080871B4: .4byte gBldRegs
_080871B8: .4byte 0x40600000
_080871BC: .4byte gDispCnt
_080871C0: .4byte 0x0000DFFF

	thumb_func_start sub_80871C4
sub_80871C4: @ 0x080871C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	ldr r0, _08087270 @ =gUnknown_03001884
	ldr r5, [r0]
	ldr r3, _08087274 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r3]
	ldr r3, _08087278 @ =gUnknown_03002878
	ldr r0, _0808727C @ =0x04000040
	str r0, [r3]
	ldr r4, _08087280 @ =gFlags
	ldr r0, [r4]
	movs r3, #4
	orrs r0, r3
	str r0, [r4]
	lsrs r0, r1, #0x10
	str r0, [sp, #4]
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r1, r2
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _0808721A
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0808721A:
	movs r3, #0
	mov ip, r3
	str r1, [sp, #0xc]
	ldr r4, [sp]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r7, #0
	movs r6, #0xef
	mov sb, r6
_0808722E:
	ldr r1, [sp, #0xc]
	asrs r0, r1, #0x10
	cmp ip, r0
	bge _08087238
	b _0808733E
_08087238:
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp ip, r0
	blt _08087244
	b _0808733E
_08087244:
	ldr r4, [sp, #4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp ip, r0
	bge _080872CC
	mov r6, r8
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	ldr r4, _08087284 @ =0xFFFF0000
	adds r0, r0, r4
	lsrs r0, r0, #0x10
	ldr r6, [sp]
	lsls r4, r6, #0x10
	adds r6, r1, #0
	cmp r0, #0xee
	bhi _08087288
	strb r2, [r5]
	b _08087294
	.align 2, 0
_08087270: .4byte gUnknown_03001884
_08087274: .4byte gUnknown_03002A80
_08087278: .4byte gUnknown_03002878
_0808727C: .4byte 0x04000040
_08087280: .4byte gFlags
_08087284: .4byte 0xFFFF0000
_08087288:
	cmp r3, #0
	bgt _08087290
	strb r7, [r5]
	b _08087294
_08087290:
	mov r0, sb
	strb r0, [r5]
_08087294:
	adds r5, #1
	asrs r0, r4, #0x10
	asrs r1, r6, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	ldr r3, _080872B0 @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _080872B4
	strb r2, [r5]
	b _080872C0
	.align 2, 0
_080872B0: .4byte 0xFFFF0000
_080872B4:
	cmp r1, #0xef
	ble _080872BE
	mov r4, sb
	strb r4, [r5]
	b _080872C0
_080872BE:
	strb r7, [r5]
_080872C0:
	adds r5, #1
	asrs r0, r6, #0x10
	cmp r0, #0xef
	bgt _08087346
	adds r0, #1
	b _08087336
_080872CC:
	mov r6, r8
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	ldr r4, _080872F0 @ =0xFFFF0000
	adds r0, r0, r4
	lsrs r0, r0, #0x10
	ldr r6, [sp]
	lsls r4, r6, #0x10
	adds r6, r1, #0
	cmp r0, #0xee
	bhi _080872F4
	strb r2, [r5]
	b _08087300
	.align 2, 0
_080872F0: .4byte 0xFFFF0000
_080872F4:
	cmp r3, #0
	bgt _080872FC
	strb r7, [r5]
	b _08087300
_080872FC:
	mov r0, sb
	strb r0, [r5]
_08087300:
	adds r5, #1
	asrs r0, r4, #0x10
	asrs r1, r6, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0808731C @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0xee
	bhi _08087320
	strb r2, [r5]
	b _0808732C
	.align 2, 0
_0808731C: .4byte 0xFFFF0000
_08087320:
	cmp r1, #0xef
	ble _0808732A
	mov r4, sb
	strb r4, [r5]
	b _0808732C
_0808732A:
	strb r7, [r5]
_0808732C:
	adds r5, #1
	asrs r0, r6, #0x10
	cmp r0, #0
	ble _08087346
	subs r0, #1
_08087336:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	b _08087346
_0808733E:
	strb r7, [r5]
	adds r5, #1
	strb r7, [r5]
	adds r5, #1
_08087346:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #0x9f
	bhi _08087356
	b _0808722E
_08087356:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

@; Transiton to special stage
	thumb_func_start sub_8087368
sub_8087368: @ 0x08087368
	push {lr}
	sub sp, #4
	ldr r0, _0808739C @ =sub_8087028
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r1, _080873A0 @ =sub_80873EC
	str r1, [sp]
	movs r1, #4
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl sub_80873A4
	movs r0, #0xdb
	bl m4aSongNumStart
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0808739C: .4byte sub_8087028
_080873A0: .4byte sub_80873EC

	thumb_func_start sub_80873A4
sub_80873A4: @ 0x080873A4
	push {r4, lr}
	ldr r3, _080873DC @ =gWinRegs
	movs r0, #0x1f
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r0, #0x3f
	orrs r0, r1
	strh r0, [r3, #0xa]
	ldr r1, _080873E0 @ =gBldRegs
	ldr r0, _080873E4 @ =0x00003FBF
	strh r0, [r1]
	movs r0, #4
	strh r0, [r1, #4]
	ldr r2, _080873E8 @ =gDispCnt
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xf0
	strh r0, [r3]
	movs r0, #0xa0
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080873DC: .4byte gWinRegs
_080873E0: .4byte gBldRegs
_080873E4: .4byte 0x00003FBF
_080873E8: .4byte gDispCnt

	thumb_func_start sub_80873EC
sub_80873EC: @ 0x080873EC
	ldr r0, _080873FC @ =gFlags
	ldr r1, [r0]
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080873FC: .4byte gFlags

@; MultiplayerPlayAgainChoice
	thumb_func_start sub_8087400
sub_8087400: @ 0x08087400
	push {r4, lr}
	sub sp, #4
	ldr r0, _08087460 @ =sub_8087644
	movs r1, #0x8a
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _08087464 @ =sub_8087F10
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r2, _08087468 @ =IWRAM_START + 0x10C
	adds r1, r4, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _0808746C @ =IWRAM_START + 0x10D
	adds r1, r4, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r4, r3
	movs r3, #0
	strh r2, [r1]
	ldr r2, _08087470 @ =IWRAM_START + 0x110
	adds r1, r4, r2
	strb r3, [r1]
	adds r2, #1
	adds r1, r4, r2
	strb r3, [r1]
	bl sub_8087478
	ldr r3, _08087474 @ =IWRAM_START + 0x100
	adds r4, r4, r3
	adds r0, r4, #0
	bl sub_802D4CC
	movs r0, #0x40
	bl m4aSongNumStart
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087460: .4byte sub_8087644
_08087464: .4byte sub_8087F10
_08087468: .4byte IWRAM_START + 0x10C
_0808746C: .4byte IWRAM_START + 0x10D
_08087470: .4byte IWRAM_START + 0x110
_08087474: .4byte IWRAM_START + 0x100

	thumb_func_start sub_8087478
sub_8087478: @ 0x08087478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08087618 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r0, #0
	bge _08087498
	movs r5, #0
_08087498:
	movs r7, #0
	ldr r1, _0808761C @ =gDispCnt
	ldr r0, _08087620 @ =0x00001141
	strh r0, [r1]
	ldr r1, _08087624 @ =gBgCntRegs
	movs r4, #0
	ldr r0, _08087628 @ =0x00001E01
	strh r0, [r1]
	ldr r2, _0808762C @ =gUnknown_03004D80
	strb r4, [r2]
	ldr r0, _08087630 @ =gUnknown_03002280
	strb r4, [r0]
	strb r4, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r3, #0x20
	strb r3, [r0, #3]
	strb r4, [r2, #1]
	strb r4, [r0, #4]
	strb r4, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r3, [r0, #7]
	strb r4, [r2, #2]
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	ldr r0, _08087634 @ =gBgScrollRegs
	strh r7, [r0]
	strh r7, [r0, #2]
	strh r7, [r0, #4]
	strh r7, [r0, #6]
	strh r7, [r0, #8]
	strh r7, [r0, #0xa]
	adds r0, r6, #0
	adds r0, #0xc0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	strh r7, [r0, #0xa]
	ldr r1, _08087638 @ =0x0600F000
	str r1, [r0, #0xc]
	strh r7, [r0, #0x18]
	strh r7, [r0, #0x1a]
	movs r1, #0x73
	strh r1, [r0, #0x1c]
	strh r7, [r0, #0x1e]
	strh r7, [r0, #0x20]
	strh r7, [r0, #0x22]
	strh r7, [r0, #0x24]
	strh r3, [r0, #0x26]
	movs r1, #0x14
	strh r1, [r0, #0x28]
	adds r1, r6, #0
	adds r1, #0xea
	strb r4, [r1]
	strh r7, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #0x38
	bl sub_8007C10
	str r0, [r6, #4]
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	subs r0, #4
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x6e
	strh r0, [r6, #0x18]
	movs r0, #0xc0
	strh r0, [r6, #0x1a]
	strh r7, [r6, #8]
	strh r7, [r6, #0x14]
	strh r7, [r6, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r6, #0x10]
	adds r0, r6, #0
	bl sub_8004558
	lsls r1, r5, #0x18
	ldr r0, _0808763C @ =gUnknown_080E02EC
	mov sl, r0
	asrs r1, r1, #0x18
	mov sb, r4
	movs r2, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	mov r8, r0
_0808756A:
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #4
	adds r0, #0x30
	adds r5, r6, r0
	mov r1, r8
	adds r4, r1, r7
	lsls r4, r4, #3
	add r4, sl
	ldr r0, [r4]
	str r2, [sp]
	bl sub_8007C10
	str r0, [r5, #4]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r5, #0x16]
	movs r0, #0x24
	strh r0, [r5, #0x18]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r5, #0x1a]
	ldr r2, [sp]
	strh r2, [r5, #8]
	strh r2, [r5, #0x14]
	strh r2, [r5, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	str r2, [r5, #0x10]
	adds r0, r5, #0
	str r2, [sp]
	bl sub_8004558
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, [sp]
	cmp r7, #2
	bls _0808756A
	adds r1, r6, r4
	movs r2, #0
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r1, r6, r0
	movs r0, #2
	strh r0, [r1]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, #0xfa
	strh r0, [r1]
	subs r0, #0xf8
	adds r1, r6, r0
	ldr r0, _08087640 @ =0x00003FFF
	strh r0, [r1]
	movs r1, #0x85
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087618: .4byte gLoadedSaveGame
_0808761C: .4byte gDispCnt
_08087620: .4byte 0x00001141
_08087624: .4byte gBgCntRegs
_08087628: .4byte 0x00001E01
_0808762C: .4byte gUnknown_03004D80
_08087630: .4byte gUnknown_03002280
_08087634: .4byte gBgScrollRegs
_08087638: .4byte 0x0600F000
_0808763C: .4byte gUnknown_080E02EC
_08087640: .4byte 0x00003FFF

	thumb_func_start sub_8087644
sub_8087644: @ 0x08087644
	push {r4, r5, r6, r7, lr}
	ldr r0, _080876AC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _080876B0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080876EE
	movs r3, #0
	ldr r0, _080876B4 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _080876EE
	movs r6, #1
	ldr r2, _080876B8 @ =gUnknown_030054D4
_0808766E:
	ldr r1, _080876BC @ =gMultiSioStatusFlags
	adds r0, r6, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080876D8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080876DC
	movs r0, #0
	ldr r1, _080876C0 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080876C4 @ =gUnknown_03002AE4
	ldr r0, _080876C8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080876CC @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080876D0 @ =gUnknown_03004D5C
	ldr r0, _080876D4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087826
	.align 2, 0
_080876AC: .4byte gCurTask
_080876B0: .4byte gGameMode
_080876B4: .4byte gUnknown_030055B8
_080876B8: .4byte gUnknown_030054D4
_080876BC: .4byte gMultiSioStatusFlags
_080876C0: .4byte 0x0000FFFF
_080876C4: .4byte gUnknown_03002AE4
_080876C8: .4byte gUnknown_0300287C
_080876CC: .4byte gUnknown_03005390
_080876D0: .4byte gUnknown_03004D5C
_080876D4: .4byte gUnknown_03002A84
_080876D8:
	movs r0, #0
	strb r0, [r2]
_080876DC:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _080876EE
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r6
	cmp r0, #0
	bne _0808766E
_080876EE:
	movs r1, #0x86
	lsls r1, r1, #1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087728
	ldr r0, _08087718 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087738
	ldr r1, _0808771C @ =gMultiSioSend
	movs r0, #0
	strb r0, [r1, #3]
	ldr r2, _08087720 @ =0x0000010D
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldr r0, _08087724 @ =0x000040A3
	b _08087736
	.align 2, 0
_08087718: .4byte gMultiSioStatusFlags
_0808771C: .4byte gMultiSioSend
_08087720: .4byte 0x0000010D
_08087724: .4byte 0x000040A3
_08087728:
	ldr r1, _080877C0 @ =gMultiSioSend
	strb r0, [r1, #3]
	ldr r2, _080877C4 @ =0x0000010D
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldr r0, _080877C8 @ =0x000040A0
_08087736:
	strh r0, [r1]
_08087738:
	movs r0, #0x87
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	bne _08087810
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r5, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08087820
	movs r0, #0x86
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080877FC
	ldr r0, _080877CC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r1, _080877C4 @ =0x0000010D
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080877E4
	ldr r0, _080877D0 @ =gMultiSioEnabled
	strb r4, [r0]
	bl MultiSioStop
	movs r0, #0
	bl MultiSioInit
	bl CreateTitleScreenAndSkipIntro
	movs r1, #0
	ldr r3, _080877D4 @ =gUnknown_030055A0
	movs r2, #0
_0808778E:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0808778E
	movs r1, #0
	ldr r5, _080877D8 @ =gUnknown_03005500
	movs r2, #0
	ldr r4, _080877DC @ =gUnknown_030054B4
	ldr r3, _080877E0 @ =gUnknown_030054D4
_080877A8:
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080877A8
	b _08087826
	.align 2, 0
_080877C0: .4byte gMultiSioSend
_080877C4: .4byte 0x0000010D
_080877C8: .4byte 0x000040A0
_080877CC: .4byte gCurTask
_080877D0: .4byte gMultiSioEnabled
_080877D4: .4byte gUnknown_030055A0
_080877D8: .4byte gUnknown_03005500
_080877DC: .4byte gUnknown_030054B4
_080877E0: .4byte gUnknown_030054D4
_080877E4:
	ldr r0, _080877F8 @ =gUnknown_03005594
	ldrb r0, [r0]
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_803143C
	b _08087826
	.align 2, 0
_080877F8: .4byte gUnknown_03005594
_080877FC:
	ldr r0, _08087808 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808780C @ =sub_808782C
	str r0, [r1, #8]
	strb r3, [r2]
	b _08087820
	.align 2, 0
_08087808: .4byte gCurTask
_0808780C: .4byte sub_808782C
_08087810:
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x78
	bls _08087820
	movs r0, #0x78
	strh r0, [r1]
_08087820:
	adds r0, r5, #0
	bl sub_8087E10
_08087826:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_808782C
sub_808782C: @ 0x0808782C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _08087898 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r7, r6, #0
	ldr r0, _0808789C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _080878DC
	movs r3, #0
	ldr r0, _080878A0 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _080878DC
	movs r5, #1
	ldr r2, _080878A4 @ =gUnknown_030054D4
_0808785A:
	ldr r1, _080878A8 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080878C4
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080878C8
	movs r0, #0
	ldr r1, _080878AC @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080878B0 @ =gUnknown_03002AE4
	ldr r0, _080878B4 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080878B8 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080878BC @ =gUnknown_03004D5C
	ldr r0, _080878C0 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087AD0
	.align 2, 0
_08087898: .4byte gCurTask
_0808789C: .4byte gGameMode
_080878A0: .4byte gUnknown_030055B8
_080878A4: .4byte gUnknown_030054D4
_080878A8: .4byte gMultiSioStatusFlags
_080878AC: .4byte 0x0000FFFF
_080878B0: .4byte gUnknown_03002AE4
_080878B4: .4byte gUnknown_0300287C
_080878B8: .4byte gUnknown_03005390
_080878BC: .4byte gUnknown_03004D5C
_080878C0: .4byte gUnknown_03002A84
_080878C4:
	movs r0, #0
	strb r0, [r2]
_080878C8:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _080878DC
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0808785A
_080878DC:
	ldr r4, _0808794C @ =gMultiSioRecv
	adds r0, r4, #0
	bl sub_8087F8C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080878EC
	b _08087AD0
_080878EC:
	ldr r1, _08087950 @ =gMultiSioStatusFlags
	ldr r2, [r1]
	movs r0, #0x80
	ands r2, r0
	adds r3, r1, #0
	cmp r2, #0
	bne _08087976
	ldr r1, _08087954 @ =0xFFFFBF60
	adds r0, r1, #0
	ldrh r1, [r4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08087976
	ldrb r0, [r4, #2]
	ldr r1, _08087958 @ =0x0000010D
	adds r5, r6, r1
	strb r0, [r5]
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _08087976
	adds r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	adds r1, #2
	adds r0, r6, r1
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x6c
	str r3, [sp]
	bl m4aSongNumStart
	ldrb r0, [r5]
	ldr r3, [sp]
	cmp r0, #0
	beq _0808795C
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #5
	beq _08087976
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #4
	b _0808796E
	.align 2, 0
_0808794C: .4byte gMultiSioRecv
_08087950: .4byte gMultiSioStatusFlags
_08087954: .4byte 0xFFFFBF60
_08087958: .4byte 0x0000010D
_0808795C:
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #3
	beq _08087976
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #6
_0808796E:
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08087976:
	ldr r4, _080879A0 @ =gMultiSioSend
	movs r0, #0
	strb r0, [r4, #3]
	movs r5, #0
	ldr r0, _080879A4 @ =0x000040A0
	strh r0, [r4]
	ldr r0, [r3]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087A3E
	ldr r0, _080879A8 @ =gPressedKeys
	ldrh r1, [r0]
	movs r2, #9
	ands r2, r1
	cmp r2, #0
	beq _080879B0
	ldr r0, _080879AC @ =0x000040A1
	strh r0, [r4]
	b _08087A3E
	.align 2, 0
_080879A0: .4byte gMultiSioSend
_080879A4: .4byte 0x000040A0
_080879A8: .4byte gPressedKeys
_080879AC: .4byte 0x000040A1
_080879B0:
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080879FA
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #7
	strb r1, [r0]
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r2, [r0]
	subs r1, #1
	adds r0, r6, r1
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #3
	beq _080879EE
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #6
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_080879EE:
	movs r0, #1
	strb r0, [r4, #3]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08087A3E
_080879FA:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08087A3E
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #7
	strb r1, [r0]
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r3, [r0]
	subs r1, #1
	adds r0, r6, r1
	movs r2, #1
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #5
	beq _08087A36
	movs r0, #0x8a
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #4
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
_08087A36:
	strb r2, [r4, #3]
	movs r0, #0x6c
	bl m4aSongNumStart
_08087A3E:
	ldr r1, _08087A8C @ =0x0000010D
	adds r0, r6, r1
	ldrb r0, [r0]
	strb r0, [r4, #2]
	ldr r4, _08087A90 @ =gMultiSioRecv
	adds r0, r4, #0
	bl sub_8087F8C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08087AD0
	ldrh r1, [r4]
	ldr r0, _08087A94 @ =0x000040A1
	cmp r1, r0
	bne _08087AAC
	ldrb r0, [r4, #2]
	cmp r0, #1
	bls _08087A68
	movs r0, #1
	strb r0, [r4, #2]
_08087A68:
	movs r0, #0x6a
	bl m4aSongNumStart
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r6, r1
	strh r5, [r0]
	ldr r0, _08087A98 @ =gMultiSioStatusFlags
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08087AA4
	ldr r0, _08087A9C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087AA0 @ =sub_8087AE0
	b _08087AAA
	.align 2, 0
_08087A8C: .4byte 0x0000010D
_08087A90: .4byte gMultiSioRecv
_08087A94: .4byte 0x000040A1
_08087A98: .4byte gMultiSioStatusFlags
_08087A9C: .4byte gCurTask
_08087AA0: .4byte sub_8087AE0
_08087AA4:
	ldr r0, _08087AD8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087ADC @ =sub_8087C98
_08087AAA:
	str r0, [r1, #8]
_08087AAC:
	movs r0, #0x87
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x12
	cmp r0, r1
	bne _08087ACA
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_08087ACA:
	adds r0, r6, #0
	bl sub_8087E10
_08087AD0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087AD8: .4byte gCurTask
_08087ADC: .4byte sub_8087C98

	thumb_func_start sub_8087AE0
sub_8087AE0: @ 0x08087AE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08087B50 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r0, _08087B54 @ =gGameMode
	ldrb r0, [r0]
	ldr r1, _08087B58 @ =gUnknown_030055B8
	mov ip, r1
	cmp r0, #2
	bls _08087B94
	movs r3, #0
	ldrb r0, [r1]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08087B94
	movs r5, #1
	ldr r2, _08087B5C @ =gUnknown_030054D4
_08087B10:
	ldr r1, _08087B60 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _08087B7C
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08087B80
	movs r0, #0
	ldr r1, _08087B64 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08087B68 @ =gUnknown_03002AE4
	ldr r0, _08087B6C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08087B70 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08087B74 @ =gUnknown_03004D5C
	ldr r0, _08087B78 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087C7A
	.align 2, 0
_08087B50: .4byte gCurTask
_08087B54: .4byte gGameMode
_08087B58: .4byte gUnknown_030055B8
_08087B5C: .4byte gUnknown_030054D4
_08087B60: .4byte gMultiSioStatusFlags
_08087B64: .4byte 0x0000FFFF
_08087B68: .4byte gUnknown_03002AE4
_08087B6C: .4byte gUnknown_0300287C
_08087B70: .4byte gUnknown_03005390
_08087B74: .4byte gUnknown_03004D5C
_08087B78: .4byte gUnknown_03002A84
_08087B7C:
	movs r0, #0
	strb r0, [r2]
_08087B80:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08087B94
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08087B10
_08087B94:
	movs r5, #1
	movs r2, #1
	ldr r0, _08087C18 @ =0x000040A2
	mov r8, r0
	ldr r1, _08087C1C @ =0x00000111
	adds r6, r7, r1
_08087BA0:
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r5
	ands r0, r2
	cmp r0, #0
	beq _08087BDC
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08087C20 @ =gMultiSioRecv
	adds r4, r0, r1
	adds r0, r4, #0
	str r2, [sp]
	bl sub_8087F8C
	lsls r0, r0, #0x18
	ldr r2, [sp]
	cmp r0, #0
	bne _08087C7A
	ldrh r0, [r4]
	ldr r1, _08087C24 @ =gUnknown_030055B8
	mov ip, r1
	cmp r0, r8
	bne _08087BDC
	subs r0, r5, #1
	adds r1, r2, #0
	lsls r1, r0
	ldrb r0, [r6]
	orrs r1, r0
	strb r1, [r6]
_08087BDC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _08087BA0
	ldr r2, _08087C1C @ =0x00000111
	adds r1, r7, r2
	mov r2, ip
	ldrb r0, [r2]
	ldrb r1, [r1]
	lsrs r0, r0, #1
	cmp r1, r0
	bne _08087C42
	ldr r4, _08087C28 @ =gMultiSioSend
	movs r0, #0
	strb r0, [r4, #3]
	ldr r0, _08087C2C @ =0x0000010D
	adds r1, r7, r0
	ldrb r0, [r1]
	strb r0, [r4, #2]
	ldr r0, _08087C30 @ =0x000040A3
	strh r0, [r4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08087C34
	adds r0, r7, #0
	bl sub_8087DA0
	b _08087C3A
	.align 2, 0
_08087C18: .4byte 0x000040A2
_08087C1C: .4byte 0x00000111
_08087C20: .4byte gMultiSioRecv
_08087C24: .4byte gUnknown_030055B8
_08087C28: .4byte gMultiSioSend
_08087C2C: .4byte 0x0000010D
_08087C30: .4byte 0x000040A3
_08087C34:
	adds r0, r7, #0
	bl sub_8087F48
_08087C3A:
	adds r0, r7, #0
	bl sub_8087E10
	b _08087C7A
_08087C42:
	ldr r4, _08087C88 @ =gMultiSioSend
	ldr r1, _08087C8C @ =0x0000010D
	adds r0, r7, r1
	ldrb r0, [r0]
	movs r1, #0
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	ldr r0, _08087C90 @ =0x000040A1
	strh r0, [r4]
	adds r0, r7, #0
	bl sub_8087E10
	movs r2, #0x87
	lsls r2, r2, #1
	adds r1, r7, r2
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _08087C7A
	ldr r0, _08087C94 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_805B9A4
_08087C7A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087C88: .4byte gMultiSioSend
_08087C8C: .4byte 0x0000010D
_08087C90: .4byte 0x000040A1
_08087C94: .4byte gCurTask

	thumb_func_start sub_8087C98
sub_8087C98: @ 0x08087C98
	push {r4, r5, r6, r7, lr}
	ldr r0, _08087D00 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _08087D04 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08087D42
	movs r3, #0
	ldr r0, _08087D08 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	adds r7, r0, #0
	cmp r1, #0
	beq _08087D42
	movs r5, #1
	ldr r2, _08087D0C @ =gUnknown_030054D4
_08087CC2:
	ldr r1, _08087D10 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _08087D2C
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _08087D30
	movs r0, #0
	ldr r1, _08087D14 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08087D18 @ =gUnknown_03002AE4
	ldr r0, _08087D1C @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08087D20 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _08087D24 @ =gUnknown_03004D5C
	ldr r0, _08087D28 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_805B9A4
	b _08087D90
	.align 2, 0
_08087D00: .4byte gCurTask
_08087D04: .4byte gGameMode
_08087D08: .4byte gUnknown_030055B8
_08087D0C: .4byte gUnknown_030054D4
_08087D10: .4byte gMultiSioStatusFlags
_08087D14: .4byte 0x0000FFFF
_08087D18: .4byte gUnknown_03002AE4
_08087D1C: .4byte gUnknown_0300287C
_08087D20: .4byte gUnknown_03005390
_08087D24: .4byte gUnknown_03004D5C
_08087D28: .4byte gUnknown_03002A84
_08087D2C:
	movs r0, #0
	strb r0, [r2]
_08087D30:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08087D42
	ldrb r0, [r7]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08087CC2
_08087D42:
	ldr r4, _08087D6C @ =gMultiSioRecv
	adds r0, r4, #0
	bl sub_8087F8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08087D90
	ldrh r1, [r4]
	ldr r0, _08087D70 @ =0x000040A3
	cmp r1, r0
	bne _08087D7E
	ldr r1, _08087D74 @ =0x0000010D
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087D78
	adds r0, r6, #0
	bl sub_8087DA0
	b _08087D7E
	.align 2, 0
_08087D6C: .4byte gMultiSioRecv
_08087D70: .4byte 0x000040A3
_08087D74: .4byte 0x0000010D
_08087D78:
	adds r0, r6, #0
	bl sub_8087F48
_08087D7E:
	ldr r4, _08087D98 @ =gMultiSioSend
	movs r0, #0
	strb r0, [r4, #3]
	strb r0, [r4, #2]
	ldr r0, _08087D9C @ =0x000040A2
	strh r0, [r4]
	adds r0, r6, #0
	bl sub_8087E10
_08087D90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087D98: .4byte gMultiSioSend
_08087D9C: .4byte 0x000040A2

	thumb_func_start sub_8087DA0
sub_8087DA0: @ 0x08087DA0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r2, r5, r0
	movs r0, #1
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #1
	adds r0, r5, r2
	strh r1, [r0]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r5, r0
	subs r0, #6
	strh r0, [r1]
	adds r2, #4
	adds r1, r5, r2
	movs r0, #0x78
	strh r0, [r1]
	movs r0, #0x40
	bl m4aSongNumStop
	movs r0, #0xce
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _08087E04 @ =0x0000044F
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08087E08 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087E0C @ =sub_8087644
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087E04: .4byte 0x0000044F
_08087E08: .4byte gCurTask
_08087E0C: .4byte sub_8087644

	thumb_func_start sub_8087E10
sub_8087E10: @ 0x08087E10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _08087E58
	ldr r1, _08087E38 @ =0x0000010D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087E40
	ldrh r1, [r4, #0xa]
	ldr r0, _08087E3C @ =0x0000044F
	cmp r1, r0
	bne _08087E40
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #1
	b _08087E56
	.align 2, 0
_08087E38: .4byte 0x0000010D
_08087E3C: .4byte 0x0000044F
_08087E40:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #6
	bne _08087E4E
	movs r0, #3
	strb r0, [r1]
_08087E4E:
	ldrb r0, [r1]
	cmp r0, #4
	bne _08087E58
	movs r0, #5
_08087E56:
	strb r0, [r1]
_08087E58:
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, r4, #0
	adds r5, #0x30
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, #0x30
	ldr r2, _08087E84 @ =0x0000010D
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087E88
	movs r0, #0x2c
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0x85
	movs r0, #1
	strb r0, [r1]
	b _08087EA6
	.align 2, 0
_08087E84: .4byte 0x0000010D
_08087E88:
	ldr r1, _08087EDC @ =gUnknown_080E037C
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x2c
	movs r1, #0
	strh r0, [r5, #0x16]
	adds r0, r4, #0
	adds r0, #0x85
	strb r1, [r0]
_08087EA6:
	movs r0, #0x6e
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	adds r5, r4, #0
	adds r5, #0x90
	ldr r1, _08087EE0 @ =0x0000010D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087EE4
	ldr r1, _08087EDC @ =gUnknown_080E037C
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xc0
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0xb5
	movs r0, #0xf
	b _08087EEE
	.align 2, 0
_08087EDC: .4byte gUnknown_080E037C
_08087EE0: .4byte 0x0000010D
_08087EE4:
	movs r0, #0xc0
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0xb5
	movs r0, #0
_08087EEE:
	strb r0, [r1]
	movs r0, #0x6e
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08087F0A
	subs r0, #1
	strb r0, [r1]
_08087F0A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8087F10
sub_8087F10: @ 0x08087F10
	push {r4, r5, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl sub_8007CF0
	movs r5, #0
	ldr r0, _08087F44 @ =IWRAM_START + 0x34
	adds r4, r4, r0
_08087F26:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl sub_8007CF0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _08087F26
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087F44: .4byte IWRAM_START + 0x34

	thumb_func_start sub_8087F48
sub_8087F48: @ 0x08087F48
	adds r2, r0, #0
	movs r1, #0x87
	lsls r1, r1, #1
	adds r0, r2, r1
	movs r1, #0
	strh r1, [r0]
	movs r3, #0x82
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	adds r3, r2, r0
	movs r0, #1
	strh r0, [r3]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r0, #0xfa
	strh r0, [r3]
	movs r3, #0x85
	lsls r3, r3, #1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _08087F84 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08087F88 @ =sub_8087644
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08087F84: .4byte gCurTask
_08087F88: .4byte sub_8087644

	thumb_func_start sub_8087F8C
sub_8087F8C: @ 0x08087F8C
	push {lr}
	ldrh r1, [r0]
	ldr r2, _08087FB0 @ =0xFFFFBF60
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _08087FB8
	cmp r1, #0
	beq _08087FB8
	ldr r0, _08087FB4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	bl sub_805B9A4
	movs r0, #1
	b _08087FBA
	.align 2, 0
_08087FB0: .4byte 0xFFFFBF60
_08087FB4: .4byte gCurTask
_08087FB8:
	movs r0, #0
_08087FBA:
	pop {r1}
	bx r1
	.align 2, 0

@; CreateTimeAttackChoice
	thumb_func_start sub_8087FC0
sub_8087FC0: @ 0x08087FC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08088260 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r0, #0
	bge _08087FDE
	movs r4, #0
_08087FDE:
	ldr r1, _08088264 @ =gDispCnt
	ldr r0, _08088268 @ =0x00001341
	strh r0, [r1]
	movs r5, #0
	str r5, [sp, #4]
	ldr r0, _0808826C @ =0x040000D4
	add r1, sp, #4
	str r1, [r0]
	ldr r1, _08088270 @ =gMultiSioSend
	str r1, [r0, #4]
	ldr r1, _08088274 @ =0x85000005
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [sp, #4]
	add r2, sp, #4
	str r2, [r0]
	ldr r1, _08088278 @ =gMultiSioRecv
	str r1, [r0, #4]
	ldr r1, _0808827C @ =0x85000014
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _08088280 @ =gBgCntRegs
	ldr r0, _08088284 @ =0x0000560C
	strh r0, [r1, #2]
	ldr r0, _08088288 @ =0x00001401
	strh r0, [r1]
	ldr r0, _0808828C @ =gBgScrollRegs
	strh r5, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	ldr r0, _08088290 @ =sub_8088800
	movs r1, #0xa8
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r3, _08088294 @ =sub_8088900
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov sb, r0
	add sb, r6
	ldr r1, _08088298 @ =IWRAM_START + 0x14C
	adds r0, r6, r1
	movs r2, #0
	strb r2, [r0]
	adds r1, #1
	adds r0, r6, r1
	strb r2, [r0]
	ldr r2, _0808829C @ =IWRAM_START + 0x14E
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	subs r2, #0xe
	adds r0, r6, r2
	movs r1, #1
	strh r1, [r0]
	strh r5, [r0, #4]
	movs r1, #2
	strh r1, [r0, #2]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #6]
	ldr r1, _080882A0 @ =0x00003FFF
	strh r1, [r0, #8]
	strh r5, [r0, #0xa]
	bl sub_802D4CC
	ldr r0, _080882A4 @ =IWRAM_START + 0x80
	adds r7, r6, r0
	movs r0, #0x6c
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _080882A8 @ =0x00000421
	strh r0, [r7, #0xa]
	ldr r1, _080882AC @ =IWRAM_START + 0xA0
	adds r0, r6, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080882B0 @ =IWRAM_START + 0xA1
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r2, _080882B4 @ =IWRAM_START + 0xA2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	mov sl, r0
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080882B8 @ =IWRAM_START + 0xB0
	adds r7, r6, r1
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #2
	mov r8, r2
	add r8, r0
	mov r0, r8
	lsls r4, r0, #3
	ldr r1, _080882BC @ =gUnknown_080E0384
	adds r4, r4, r1
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _080882C0 @ =IWRAM_START + 0xD0
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080882C4 @ =IWRAM_START + 0xD1
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sl
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080882C8 @ =IWRAM_START + 0xE0
	adds r7, r6, r1
	mov r4, r8
	adds r4, #1
	lsls r4, r4, #3
	ldr r2, _080882BC @ =gUnknown_080E0384
	adds r4, r4, r2
	ldr r0, [r4]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	ldr r2, _080882CC @ =IWRAM_START + 0x100
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080882D0 @ =IWRAM_START + 0x101
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	strh r5, [r7, #0x16]
	strh r5, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	mov r0, sl
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080882D4 @ =IWRAM_START + 0x110
	adds r7, r6, r1
	movs r2, #2
	add r8, r2
	mov r0, r8
	lsls r0, r0, #3
	mov r8, r0
	ldr r1, _080882BC @ =gUnknown_080E0384
	add r8, r1
	mov r2, r8
	ldr r0, [r2]
	bl sub_8007C10
	str r0, [r7, #4]
	mov r1, r8
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	ldr r2, _080882D8 @ =IWRAM_START + 0x130
	adds r0, r6, r2
	strb r1, [r0]
	ldr r0, _080882DC @ =IWRAM_START + 0x131
	adds r1, r6, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	movs r0, #8
	strh r0, [r7, #0x16]
	movs r0, #0x67
	strh r0, [r7, #0x18]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r2, #2
	adds r0, r6, r2
	movs r1, #0x10
	strb r1, [r0]
	adds r2, #3
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r7, #0x28]
	str r5, [r7, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, sb
	str r0, [r1, #4]
	strh r5, [r1, #0xa]
	ldr r0, _080882E0 @ =0x0600A000
	str r0, [r1, #0xc]
	strh r5, [r1, #0x18]
	strh r5, [r1, #0x1a]
	movs r0, #0x6e
	strh r0, [r1, #0x1c]
	strh r5, [r1, #0x1e]
	strh r5, [r1, #0x20]
	strh r5, [r1, #0x22]
	strh r5, [r1, #0x24]
	movs r4, #0x20
	strh r4, [r1, #0x26]
	strh r4, [r1, #0x28]
	ldr r2, _080882E4 @ =IWRAM_START + 0x2A
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	mov r2, sb
	strh r5, [r2, #0x2e]
	mov r0, sb
	bl sub_8002A3C
	ldr r1, _080882E8 @ =IWRAM_START + 0x40
	adds r0, r6, r1
	ldr r1, _080882EC @ =0x0600C000
	str r1, [r0, #4]
	strh r5, [r0, #0xa]
	ldr r1, _080882F0 @ =0x0600B000
	str r1, [r0, #0xc]
	strh r5, [r0, #0x18]
	strh r5, [r0, #0x1a]
	movs r1, #0x70
	strh r1, [r0, #0x1c]
	strh r5, [r0, #0x1e]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	strh r5, [r0, #0x24]
	strh r4, [r0, #0x26]
	strh r4, [r0, #0x28]
	ldr r2, _080882F4 @ =IWRAM_START + 0x6A
	adds r6, r6, r2
	movs r1, #0
	strb r1, [r6]
	movs r2, #1
	strh r2, [r0, #0x2e]
	bl sub_8002A3C
	movs r0, #7
	bl m4aSongNumStart
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088260: .4byte gLoadedSaveGame
_08088264: .4byte gDispCnt
_08088268: .4byte 0x00001341
_0808826C: .4byte 0x040000D4
_08088270: .4byte gMultiSioSend
_08088274: .4byte 0x85000005
_08088278: .4byte gMultiSioRecv
_0808827C: .4byte 0x85000014
_08088280: .4byte gBgCntRegs
_08088284: .4byte 0x0000560C
_08088288: .4byte 0x00001401
_0808828C: .4byte gBgScrollRegs
_08088290: .4byte sub_8088800
_08088294: .4byte sub_8088900
_08088298: .4byte IWRAM_START + 0x14C
_0808829C: .4byte IWRAM_START + 0x14E
_080882A0: .4byte 0x00003FFF
_080882A4: .4byte IWRAM_START + 0x80
_080882A8: .4byte 0x00000421
_080882AC: .4byte IWRAM_START + 0xA0
_080882B0: .4byte IWRAM_START + 0xA1
_080882B4: .4byte IWRAM_START + 0xA2
_080882B8: .4byte IWRAM_START + 0xB0
_080882BC: .4byte gUnknown_080E0384
_080882C0: .4byte IWRAM_START + 0xD0
_080882C4: .4byte IWRAM_START + 0xD1
_080882C8: .4byte IWRAM_START + 0xE0
_080882CC: .4byte IWRAM_START + 0x100
_080882D0: .4byte IWRAM_START + 0x101
_080882D4: .4byte IWRAM_START + 0x110
_080882D8: .4byte IWRAM_START + 0x130
_080882DC: .4byte IWRAM_START + 0x131
_080882E0: .4byte 0x0600A000
_080882E4: .4byte IWRAM_START + 0x2A
_080882E8: .4byte IWRAM_START + 0x40
_080882EC: .4byte 0x0600C000
_080882F0: .4byte 0x0600B000
_080882F4: .4byte IWRAM_START + 0x6A

	thumb_func_start sub_80882F8
sub_80882F8: @ 0x080882F8
	push {r4, r5, r6, lr}
	ldr r5, _08088374 @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _08088378 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _0808837C @ =gUnknown_03002878
	ldr r0, _08088380 @ =0x04000042
	str r0, [r1]
	ldr r1, _08088384 @ =gWinRegs
	movs r6, #0
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _08088388 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	ldr r1, _0808838C @ =IWRAM_START + 0x14C
	adds r4, r4, r1
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #0x12
	movs r2, #0xaf
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	bl sub_802E044
	ldr r0, _08088390 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808835A
	strb r6, [r4]
	ldr r1, [r5]
	ldr r0, _08088394 @ =sub_8088398
	str r0, [r1, #8]
_0808835A:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808836E
	strb r6, [r4]
	ldr r1, [r5]
	ldr r0, _08088394 @ =sub_8088398
	str r0, [r1, #8]
_0808836E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088374: .4byte gCurTask
_08088378: .4byte gUnknown_03002A80
_0808837C: .4byte gUnknown_03002878
_08088380: .4byte 0x04000042
_08088384: .4byte gWinRegs
_08088388: .4byte gFlags
_0808838C: .4byte IWRAM_START + 0x14C
_08088390: .4byte gPressedKeys
_08088394: .4byte sub_8088398

	thumb_func_start sub_8088398
sub_8088398: @ 0x08088398
	push {r4, r5, r6, lr}
	ldr r2, _08088420 @ =gCurTask
	ldr r0, [r2]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, _08088424 @ =IWRAM_START + 0x14C
	adds r4, r5, r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bne _080883C6
	ldr r0, _08088428 @ =IWRAM_START + 0x14E
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r2]
	ldr r0, _0808842C @ =sub_80884C0
	str r0, [r1, #8]
_080883C6:
	ldr r0, _08088430 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080883D6
	movs r0, #0x1f
	strb r0, [r4]
_080883D6:
	ldr r1, _08088434 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08088438 @ =gUnknown_03002878
	ldr r0, _0808843C @ =0x04000042
	str r0, [r1]
	ldr r1, _08088440 @ =gWinRegs
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _08088444 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	ldr r1, _08088448 @ =IWRAM_START + 0x80
	adds r2, r5, r1
	ldrb r0, [r4]
	cmp r0, #9
	bhi _0808844C
	adds r1, r0, #0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r0, #0x32
	b _0808844E
	.align 2, 0
_08088420: .4byte gCurTask
_08088424: .4byte IWRAM_START + 0x14C
_08088428: .4byte IWRAM_START + 0x14E
_0808842C: .4byte sub_80884C0
_08088430: .4byte gPressedKeys
_08088434: .4byte gUnknown_03002A80
_08088438: .4byte gUnknown_03002878
_0808843C: .4byte 0x04000042
_08088440: .4byte gWinRegs
_08088444: .4byte gFlags
_08088448: .4byte IWRAM_START + 0x80
_0808844C:
	movs r0, #0x32
_0808844E:
	strh r0, [r2, #0x16]
	movs r0, #0xa
	strh r0, [r2, #0x18]
	adds r2, r6, #0
	adds r2, #0xb0
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0808846C
	ldr r0, _08088468 @ =0x0000FFB0
	b _0808847A
	.align 2, 0
_08088468: .4byte 0x0000FFB0
_0808846C:
	cmp r0, #0x13
	bhi _08088478
	ldrb r0, [r1]
	lsls r0, r0, #4
	subs r0, #0xfa
	b _0808847A
_08088478:
	movs r0, #0x46
_0808847A:
	strh r0, [r2, #0x16]
	movs r0, #0x3c
	strh r0, [r2, #0x18]
	adds r2, r6, #0
	adds r2, #0xe0
	movs r0, #0xa6
	lsls r0, r0, #1
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0x13
	bhi _08088498
	ldr r0, _08088494 @ =0x0000FFA6
	b _080884AE
	.align 2, 0
_08088494: .4byte 0x0000FFA6
_08088498:
	cmp r0, #0x1d
	bhi _080884AC
	ldrb r0, [r1]
	lsls r0, r0, #4
	ldr r1, _080884A8 @ =0xFFFFFE70
	adds r0, r0, r1
	b _080884AE
	.align 2, 0
_080884A8: .4byte 0xFFFFFE70
_080884AC:
	movs r0, #0x50
_080884AE:
	strh r0, [r2, #0x16]
	movs r0, #0x4c
	strh r0, [r2, #0x18]
	adds r0, r6, #0
	bl sub_80888BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_80884C0
sub_80884C0: @ 0x080884C0
	push {r4, r5, r6, lr}
	ldr r6, _080884F8 @ =gCurTask
	ldr r0, [r6]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	ldr r0, _080884FC @ =gPressedKeys
	ldrh r3, [r0]
	movs r4, #1
	adds r1, r4, #0
	ands r1, r3
	cmp r1, #0
	beq _0808853C
	ldr r1, _08088500 @ =IWRAM_START + 0x14D
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088508
	ldr r0, _08088504 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	bne _08088508
	movs r0, #0x69
	bl m4aSongNumStart
	b _08088566
	.align 2, 0
_080884F8: .4byte gCurTask
_080884FC: .4byte gPressedKeys
_08088500: .4byte IWRAM_START + 0x14D
_08088504: .4byte gLoadedSaveGame
_08088508:
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r2, r5, r0
	movs r1, #0
	movs r0, #1
	strh r0, [r2]
	strh r1, [r2, #4]
	strh r0, [r2, #2]
	adds r0, #0xff
	strh r0, [r2, #6]
	ldr r0, _08088530 @ =0x00003FFF
	strh r0, [r2, #8]
	strh r1, [r2, #0xa]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _08088534 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08088538 @ =sub_80886C8
	b _08088564
	.align 2, 0
_08088530: .4byte 0x00003FFF
_08088534: .4byte gCurTask
_08088538: .4byte sub_80886C8
_0808853C:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08088566
	ldr r0, _08088604 @ =IWRAM_START + 0x140
	adds r2, r2, r0
	strh r4, [r2]
	strh r1, [r2, #4]
	strh r4, [r2, #2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	ldr r0, _08088608 @ =0x00003FFF
	strh r0, [r2, #8]
	strh r1, [r2, #0xa]
	movs r0, #0x6b
	bl m4aSongNumStart
	ldr r1, [r6]
	ldr r0, _0808860C @ =sub_8088768
_08088564:
	str r0, [r1, #8]
_08088566:
	ldr r1, _08088610 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08088614 @ =gUnknown_03002878
	ldr r0, _08088618 @ =0x04000042
	str r0, [r1]
	ldr r1, _0808861C @ =gWinRegs
	movs r4, #0
	movs r0, #0x98
	lsls r0, r0, #5
	strh r0, [r1, #8]
	movs r0, #0x11
	strh r0, [r1, #0xa]
	ldr r2, _08088620 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	ldr r0, _08088624 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080885BA
	movs r0, #0x6c
	bl m4aSongNumStart
	ldr r1, _08088628 @ =0x0000014D
	adds r2, r5, r1
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	strb r0, [r2]
_080885BA:
	ldr r2, _08088628 @ =0x0000014D
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088660
	ldr r4, _0808862C @ =gLoadedSaveGame
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _080885D6
	movs r1, #0
_080885D6:
	adds r2, r5, #0
	adds r2, #0xd5
	movs r0, #1
	strb r0, [r2]
	ldr r0, _08088630 @ =0x00000105
	adds r2, r5, r0
	movs r0, #0xff
	strb r0, [r2]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r3, r5, r2
	ldr r0, [r4]
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _08088638
	ldr r2, _08088634 @ =gUnknown_080E0384
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #3
	b _08088644
	.align 2, 0
_08088604: .4byte IWRAM_START + 0x140
_08088608: .4byte 0x00003FFF
_0808860C: .4byte sub_8088768
_08088610: .4byte gUnknown_03002A80
_08088614: .4byte gUnknown_03002878
_08088618: .4byte 0x04000042
_0808861C: .4byte gWinRegs
_08088620: .4byte gFlags
_08088624: .4byte gPressedKeys
_08088628: .4byte 0x0000014D
_0808862C: .4byte gLoadedSaveGame
_08088630: .4byte 0x00000105
_08088634: .4byte gUnknown_080E0384
_08088638:
	ldr r2, _0808865C @ =gUnknown_080E0384
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #4
_08088644:
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	strh r1, [r3, #0xa]
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x21
	b _080886A6
	.align 2, 0
_0808865C: .4byte gUnknown_080E0384
_08088660:
	ldr r0, _080886B8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _08088672
	movs r1, #0
_08088672:
	adds r0, r5, #0
	adds r0, #0xd5
	strb r4, [r0]
	ldr r2, _080886BC @ =0x00000105
	adds r0, r5, r2
	strb r4, [r0]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r3, r5, r0
	ldr r2, _080886C0 @ =gUnknown_080E0384
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #2
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	strh r1, [r3, #0xa]
	ldrb r1, [r0, #6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r0, _080886C4 @ =0x00000131
	adds r1, r5, r0
_080886A6:
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_80888BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080886B8: .4byte gLoadedSaveGame
_080886BC: .4byte 0x00000105
_080886C0: .4byte gUnknown_080E0384
_080886C4: .4byte 0x00000131

	thumb_func_start sub_80886C8
sub_80886C8: @ 0x080886C8
	push {r4, r5, lr}
	ldr r4, _08088700 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _08088704 @ =IWRAM_START + 0x140
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08088714
	ldr r2, _08088708 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0808870C @ =gMultiSioEnabled
	strb r3, [r0]
	ldr r1, [r4]
	ldr r0, _08088710 @ =sub_808883C
	str r0, [r1, #8]
	b _0808874E
	.align 2, 0
_08088700: .4byte gCurTask
_08088704: .4byte IWRAM_START + 0x140
_08088708: .4byte gFlags
_0808870C: .4byte gMultiSioEnabled
_08088710: .4byte sub_808883C
_08088714:
	ldr r1, _08088754 @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08088758 @ =gUnknown_03002878
	ldr r0, _0808875C @ =0x04000042
	str r0, [r1]
	ldr r1, _08088760 @ =gWinRegs
	movs r0, #0xcc
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x31
	strh r0, [r1, #0xa]
	ldr r2, _08088764 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	adds r0, r5, #0
	bl sub_80888BC
_0808874E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088754: .4byte gUnknown_03002A80
_08088758: .4byte gUnknown_03002878
_0808875C: .4byte 0x04000042
_08088760: .4byte gWinRegs
_08088764: .4byte gFlags

	thumb_func_start sub_8088768
sub_8088768: @ 0x08088768
	push {r4, r5, lr}
	ldr r4, _080887A0 @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r1, _080887A4 @ =IWRAM_START + 0x140
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _080887AC
	ldr r2, _080887A8 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	bl CreateTitleScreenAtSinglePlayerMenu
	ldr r0, [r4]
	bl TaskDestroy
	b _080887E6
	.align 2, 0
_080887A0: .4byte gCurTask
_080887A4: .4byte IWRAM_START + 0x140
_080887A8: .4byte gFlags
_080887AC:
	ldr r1, _080887EC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r1, _080887F0 @ =gUnknown_03002878
	ldr r0, _080887F4 @ =0x04000042
	str r0, [r1]
	ldr r1, _080887F8 @ =gWinRegs
	movs r0, #0xcc
	lsls r0, r0, #6
	strh r0, [r1, #8]
	movs r0, #0x31
	strh r0, [r1, #0xa]
	ldr r2, _080887FC @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	movs r0, #0xf0
	bl sub_802EFDC
	movs r0, #0xc8
	lsls r0, r0, #7
	movs r1, #0xaf
	lsls r1, r1, #2
	bl sub_802E044
	adds r0, r5, #0
	bl sub_80888BC
_080887E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080887EC: .4byte gUnknown_03002A80
_080887F0: .4byte gUnknown_03002878
_080887F4: .4byte 0x04000042
_080887F8: .4byte gWinRegs
_080887FC: .4byte gFlags

	thumb_func_start sub_8088800
sub_8088800: @ 0x08088800
	push {r4, r5, lr}
	ldr r5, _0808882C @ =gCurTask
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	ldr r1, _08088830 @ =IWRAM_START + 0x140
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088826
	ldr r0, _08088834 @ =IWRAM_START + 0x14C
	adds r1, r4, r0
	movs r0, #0xf
	strb r0, [r1]
	ldr r1, [r5]
	ldr r0, _08088838 @ =sub_80882F8
	str r0, [r1, #8]
_08088826:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808882C: .4byte gCurTask
_08088830: .4byte IWRAM_START + 0x140
_08088834: .4byte IWRAM_START + 0x14C
_08088838: .4byte sub_80882F8

	thumb_func_start sub_808883C
sub_808883C: @ 0x0808883C
	push {lr}
	ldr r0, _08088854 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08088858 @ =IWRAM_START + 0x14D
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088860
	ldr r1, _0808885C @ =gGameMode
	movs r0, #2
	b _08088864
	.align 2, 0
_08088854: .4byte gCurTask
_08088858: .4byte IWRAM_START + 0x14D
_0808885C: .4byte gGameMode
_08088860:
	ldr r1, _0808889C @ =gGameMode
	movs r0, #1
_08088864:
	strb r0, [r1]
	ldr r1, _080888A0 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _080888A4 @ =gUnknown_03002AE4
	ldr r0, _080888A8 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080888AC @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080888B0 @ =gUnknown_03004D5C
	ldr r0, _080888B4 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080888B8 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #0x13]
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_803143C
	pop {r0}
	bx r0
	.align 2, 0
_0808889C: .4byte gGameMode
_080888A0: .4byte 0x0000FFFF
_080888A4: .4byte gUnknown_03002AE4
_080888A8: .4byte gUnknown_0300287C
_080888AC: .4byte gUnknown_03005390
_080888B0: .4byte gUnknown_03004D5C
_080888B4: .4byte gUnknown_03002A84
_080888B8: .4byte gLoadedSaveGame

	thumb_func_start sub_80888BC
sub_80888BC: @ 0x080888BC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x80
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xa7
	lsls r1, r1, #1
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080888F8
	movs r0, #0x88
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080888F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088900
sub_8088900: @ 0x08088900
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08088934 @ =IWRAM_START + 0x84
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08088938 @ =IWRAM_START + 0xB4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _0808893C @ =IWRAM_START + 0xE4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r0, _08088940 @ =IWRAM_START + 0x114
	adds r4, r4, r0
	ldr r0, [r4]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088934: .4byte IWRAM_START + 0x84
_08088938: .4byte IWRAM_START + 0xB4
_0808893C: .4byte IWRAM_START + 0xE4
_08088940: .4byte IWRAM_START + 0x114

	thumb_func_start sub_8088944
sub_8088944: @ 0x08088944
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	ldr r0, _08088C74 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r0, #0
	bge _08088964
	movs r7, #0
_08088964:
	ldr r1, _08088C78 @ =gDispCnt
	ldr r0, _08088C7C @ =0x00001341
	strh r0, [r1]
	ldr r1, _08088C80 @ =gBgCntRegs
	movs r2, #0
	movs r5, #0
	ldr r0, _08088C84 @ =0x00001D05
	strh r0, [r1]
	ldr r0, _08088C88 @ =0x00000702
	strh r0, [r1, #2]
	ldr r4, _08088C8C @ =gUnknown_03004D80
	strb r2, [r4]
	ldr r0, _08088C90 @ =gUnknown_03002280
	strb r2, [r0]
	strb r2, [r0, #1]
	movs r1, #0xff
	strb r1, [r0, #2]
	movs r3, #0x20
	strb r3, [r0, #3]
	strb r2, [r4, #1]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #6]
	strb r3, [r0, #7]
	strb r2, [r4, #2]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r1, [r0, #0xa]
	strb r3, [r0, #0xb]
	ldr r0, _08088C94 @ =gBgScrollRegs
	ldr r1, _08088C98 @ =0x0000FFF8
	strh r1, [r0]
	strh r5, [r0, #2]
	strh r5, [r0, #4]
	strh r5, [r0, #6]
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	mov r0, r8
	adds r0, #0x80
	str r0, [sp, #0xc]
	mov r1, r8
	adds r1, #0xa0
	str r1, [sp, #0x10]
	mov r3, r8
	adds r3, #0xa1
	str r3, [sp, #0x14]
	mov r4, r8
	adds r4, #0xa2
	str r4, [sp, #0x18]
	adds r0, #0x25
	str r0, [sp, #0x1c]
	adds r1, #0x14
	str r1, [sp, #0x20]
	mov r6, r8
	adds r6, #0x40
	subs r3, #0x37
	str r3, [sp, #8]
	subs r4, #0x78
	str r4, [sp, #4]
	movs r0, #0xb0
	mov sb, r0
	movs r3, #0xe0
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
_080889EA:
	mov r1, r8
	adds r7, r1, r3
	cmp r5, #3
	beq _08088A94
	cmp r5, #3
	bls _080889FA
	mov r7, r8
	add r7, sb
_080889FA:
	cmp r5, #2
	bne _08088A1A
	ldr r0, _08088C9C @ =gGameMode
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08088A1A
	movs r7, #0xa0
	lsls r7, r7, #1
	add r7, r8
	movs r3, #0xa0
	lsls r3, r3, #1
	mov sb, r3
	adds r3, #0x30
	movs r5, #3
_08088A1A:
	mov r0, sl
	lsls r4, r0, #2
	add r4, sl
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r1, _08088CA0 @ =gUnknown_080E04D4
	adds r4, r4, r1
	ldr r0, [r4]
	str r3, [sp, #0x28]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	movs r1, #0
	mov ip, r1
	movs r2, #0
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	lsls r1, r5, #4
	adds r0, r1, #0
	adds r0, #0x18
	strh r0, [r7, #0x18]
	ldr r3, [sp, #0x28]
	cmp r5, #2
	bls _08088A62
	subs r0, #0x10
	strh r0, [r7, #0x18]
_08088A62:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	mov r4, ip
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl sub_8004558
	ldr r3, [sp, #0x28]
_08088A94:
	movs r0, #0x30
	add sb, r0
	adds r3, #0x30
	adds r5, #1
	cmp r5, #4
	bls _080889EA
	ldr r7, [sp, #0xc]
	movs r2, #0
	str r2, [r7, #4]
	ldr r0, _08088CA4 @ =0x0000041B
	strh r0, [r7, #0xa]
	movs r0, #5
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	movs r0, #0xff
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	strh r2, [r7, #0x16]
	strh r2, [r7, #0x18]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	movs r0, #0x10
	mov sb, r0
	mov r3, sb
	ldr r1, [sp, #0x18]
	strb r3, [r1]
	movs r0, #0
	ldr r4, [sp, #0x1c]
	strb r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	mov sl, r1
	str r1, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x24]
	bl sub_8004558
	ldr r4, _08088CA8 @ =gUnknown_080E0474
	ldr r5, _08088CAC @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xa]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r0, [r0, #6]
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	mov r4, sp
	strb r0, [r4]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	movs r0, #0x82
	strh r0, [r7, #0x18]
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r7, #0x1a]
	ldr r2, [sp, #0x24]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	mov r0, sb
	ldr r4, [sp, #0x18]
	strb r0, [r4]
	movs r3, #0
	ldr r1, [sp, #0x1c]
	strb r3, [r1]
	mov r4, sl
	str r4, [r7, #0x28]
	movs r0, #0xa0
	lsls r0, r0, #5
	str r0, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x24]
	bl sub_8004558
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x20]
	str r2, [r1]
	movs r1, #0
	ldrsb r1, [r5, r1]
	cmp r1, #1
	bne _08088BD0
	movs r0, #0xd6
	lsls r0, r0, #1
	add r0, r8
	strb r1, [r0]
	mov r7, r8
	adds r7, #0xb0
	ldr r4, _08088CB0 @ =gUnknown_080E04C4
	ldr r0, [r4]
	str r2, [sp, #0x24]
	bl sub_8007C10
	str r0, [r7, #4]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r4, #6]
	mov r0, r8
	adds r0, #0xd0
	strb r1, [r0]
	mov r1, r8
	adds r1, #0xd1
	ldrb r0, [r1]
	mov r3, sp
	ldrb r3, [r3]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x64
	strh r0, [r7, #0x16]
	movs r0, #0x6e
	strh r0, [r7, #0x18]
	adds r0, #0xd2
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #0x24]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	mov r0, r8
	adds r0, #0xd2
	mov r4, sb
	strb r4, [r0]
	adds r0, #3
	movs r1, #0
	strb r1, [r0]
	mov r3, sl
	str r3, [r7, #0x28]
	movs r4, #0xa0
	lsls r4, r4, #5
	str r4, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x24]
	bl sub_8004558
	ldr r2, [sp, #0x24]
_08088BD0:
	ldr r0, _08088CB4 @ =0x06004000
	str r0, [r6, #4]
	strh r2, [r6, #0xa]
	ldr r0, _08088CB8 @ =0x0600E800
	str r0, [r6, #0xc]
	strh r2, [r6, #0x18]
	strh r2, [r6, #0x1a]
	movs r0, #0x96
	strh r0, [r6, #0x1c]
	strh r2, [r6, #0x1e]
	strh r2, [r6, #0x20]
	strh r2, [r6, #0x22]
	strh r2, [r6, #0x24]
	movs r0, #0x1c
	strh r0, [r6, #0x26]
	movs r0, #0xc
	strh r0, [r6, #0x28]
	movs r1, #0
	ldr r0, [sp, #8]
	strb r1, [r0]
	strh r2, [r6, #0x2e]
	adds r0, r6, #0
	str r2, [sp, #0x24]
	bl sub_8002A3C
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r3, r8
	str r0, [r3, #4]
	ldr r2, [sp, #0x24]
	strh r2, [r3, #0xa]
	ldr r0, _08088CBC @ =0x06003800
	str r0, [r3, #0xc]
	strh r2, [r3, #0x18]
	strh r2, [r3, #0x1a]
	movs r0, #0x97
	strh r0, [r3, #0x1c]
	strh r2, [r3, #0x1e]
	strh r2, [r3, #0x20]
	strh r2, [r3, #0x22]
	strh r2, [r3, #0x24]
	movs r0, #0x20
	strh r0, [r3, #0x26]
	strh r0, [r3, #0x28]
	movs r0, #0
	ldr r4, [sp, #4]
	strb r0, [r4]
	movs r5, #1
	strh r5, [r3, #0x2e]
	mov r0, r8
	str r2, [sp, #0x24]
	bl sub_8002A3C
	movs r4, #0xd0
	lsls r4, r4, #1
	add r4, r8
	strh r5, [r4]
	ldr r2, [sp, #0x24]
	strh r2, [r4, #4]
	movs r0, #2
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #6]
	ldr r0, _08088CC0 @ =0x00003FFF
	strh r0, [r4, #8]
	strh r2, [r4, #0xa]
	movs r0, #7
	bl m4aSongNumStart
	adds r0, r4, #0
	bl sub_802D4CC
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088C74: .4byte gLoadedSaveGame
_08088C78: .4byte gDispCnt
_08088C7C: .4byte 0x00001341
_08088C80: .4byte gBgCntRegs
_08088C84: .4byte 0x00001D05
_08088C88: .4byte 0x00000702
_08088C8C: .4byte gUnknown_03004D80
_08088C90: .4byte gUnknown_03002280
_08088C94: .4byte gBgScrollRegs
_08088C98: .4byte 0x0000FFF8
_08088C9C: .4byte gGameMode
_08088CA0: .4byte gUnknown_080E04D4
_08088CA4: .4byte 0x0000041B
_08088CA8: .4byte gUnknown_080E0474
_08088CAC: .4byte gSelectedCharacter
_08088CB0: .4byte gUnknown_080E04C4
_08088CB4: .4byte 0x06004000
_08088CB8: .4byte 0x0600E800
_08088CBC: .4byte 0x06003800
_08088CC0: .4byte 0x00003FFF

	thumb_func_start sub_8088CC4
sub_8088CC4: @ 0x08088CC4
	push {r4, r5, r6, r7, lr}
	ldr r0, _08088CEC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	movs r6, #0
	ldr r0, _08088CF0 @ =IWRAM_START + 0x105
	adds r4, r1, r0
	subs r0, #0x25
	adds r5, r1, r0
_08088CDC:
	ldr r1, _08088CF4 @ =0x000001AD
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r6, r0
	bne _08088CF8
	movs r0, #0
	b _08088CFA
	.align 2, 0
_08088CEC: .4byte gCurTask
_08088CF0: .4byte IWRAM_START + 0x105
_08088CF4: .4byte 0x000001AD
_08088CF8:
	movs r0, #1
_08088CFA:
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #3
	bls _08088CDC
	adds r4, r7, #0
	adds r4, #0x80
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088D36
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08088D36:
	movs r1, #0xd0
	lsls r1, r1, #1
	adds r0, r7, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08088D50
	ldr r0, _08088D58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08088D5C @ =sub_8088EB4
	str r0, [r1, #8]
_08088D50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088D58: .4byte gCurTask
_08088D5C: .4byte sub_8088EB4

	thumb_func_start sub_8088D60
sub_8088D60: @ 0x08088D60
	push {r4, r5, r6, r7, lr}
	ldr r6, _08088D98 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	ldr r1, _08088D9C @ =IWRAM_START + 0x1A0
	adds r0, r4, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08088E12
	ldr r0, [r6]
	bl TaskDestroy
	ldr r1, _08088DA0 @ =IWRAM_START + 0x1AD
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08088DB4
	cmp r0, #1
	bgt _08088DA4
	cmp r0, #0
	beq _08088DAE
	b _08088EAC
	.align 2, 0
_08088D98: .4byte gCurTask
_08088D9C: .4byte IWRAM_START + 0x1A0
_08088DA0: .4byte IWRAM_START + 0x1AD
_08088DA4:
	cmp r0, #2
	beq _08088DE0
	cmp r0, #3
	beq _08088E0C
	b _08088EAC
_08088DAE:
	bl sub_801A770
	b _08088EAC
_08088DB4:
	ldr r0, _08088DD4 @ =gSelectedCharacter
	ldrb r0, [r0]
	ldr r1, _08088DD8 @ =gLoadedSaveGame
	ldr r1, [r1]
	ldrb r2, [r1, #0x13]
	movs r1, #0x10
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_803143C
	ldr r1, _08088DDC @ =gCurrentLevel
	movs r0, #0
	strb r0, [r1]
	b _08088EAC
	.align 2, 0
_08088DD4: .4byte gSelectedCharacter
_08088DD8: .4byte gLoadedSaveGame
_08088DDC: .4byte gCurrentLevel
_08088DE0:
	ldr r0, _08088E00 @ =gGameMode
	ldrb r0, [r0]
	lsrs r0, r0, #1
	ands r0, r5
	ldr r1, _08088E04 @ =gSelectedCharacter
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, _08088E08 @ =gCurrentLevel
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl CreateTimeAttackSelectionScreen
	b _08088EAC
	.align 2, 0
_08088E00: .4byte gGameMode
_08088E04: .4byte gSelectedCharacter
_08088E08: .4byte gCurrentLevel
_08088E0C:
	bl CreateTitleScreenAndSkipIntro
	b _08088EAC
_08088E12:
	movs r5, #0
	ldr r0, _08088E40 @ =IWRAM_START + 0x80
	adds r6, r4, r0
	ldr r1, _08088E44 @ =IWRAM_START + 0xE0
	adds r4, r4, r1
_08088E1C:
	adds r0, r4, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r5, #1
	cmp r5, #3
	bls _08088E1C
	adds r4, r6, #0
	ldr r1, _08088E48 @ =0x000001AD
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08088E52
	cmp r0, #1
	bgt _08088E4C
	cmp r0, #0
	beq _08088E58
	b _08088E5E
	.align 2, 0
_08088E40: .4byte IWRAM_START + 0x80
_08088E44: .4byte IWRAM_START + 0xE0
_08088E48: .4byte 0x000001AD
_08088E4C:
	cmp r0, #2
	beq _08088E58
	b _08088E5E
_08088E52:
	ldrh r0, [r4, #0x16]
	subs r0, #4
	b _08088E5C
_08088E58:
	ldrh r0, [r4, #0x16]
	adds r0, #4
_08088E5C:
	strh r0, [r4, #0x16]
_08088E5E:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	movs r1, #0xd6
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088EAC
	adds r4, r7, #0
	adds r4, #0xb0
	adds r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _08088E94
	cmp r0, #1
	bgt _08088E8E
	cmp r0, #0
	beq _08088E9A
	b _08088EA0
_08088E8E:
	cmp r0, #2
	beq _08088E9A
	b _08088EA0
_08088E94:
	ldrh r0, [r4, #0x16]
	subs r0, #2
	b _08088E9E
_08088E9A:
	ldrh r0, [r4, #0x16]
	adds r0, #3
_08088E9E:
	strh r0, [r4, #0x16]
_08088EA0:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08088EAC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8088EB4
sub_8088EB4: @ 0x08088EB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08088EEC @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r2, _08088EF0 @ =gRepeatedKeys
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08088EF8
	ldr r0, _08088EF4 @ =IWRAM_START + 0x1AD
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08088EF8
	subs r0, #1
	strb r0, [r3]
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08088F16
	.align 2, 0
_08088EEC: .4byte gCurTask
_08088EF0: .4byte gRepeatedKeys
_08088EF4: .4byte IWRAM_START + 0x1AD
_08088EF8:
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08088F16
	ldr r2, _08088F34 @ =0x000001AD
	adds r1, r7, r2
	ldrb r0, [r1]
	cmp r0, #3
	beq _08088F16
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x6c
	bl m4aSongNumStart
_08088F16:
	movs r6, #0
	movs r0, #0x80
	adds r0, r0, r7
	mov sb, r0
	ldr r1, _08088F38 @ =0x00000105
	adds r4, r7, r1
	adds r5, r7, #0
	adds r5, #0xe0
_08088F26:
	ldr r2, _08088F34 @ =0x000001AD
	adds r0, r7, r2
	ldrb r0, [r0]
	cmp r6, r0
	bne _08088F3C
	movs r0, #0
	b _08088F3E
	.align 2, 0
_08088F34: .4byte 0x000001AD
_08088F38: .4byte 0x00000105
_08088F3C:
	movs r0, #1
_08088F3E:
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x30
	adds r5, #0x30
	adds r6, #1
	cmp r6, #3
	bls _08088F26
	mov r6, sb
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	movs r0, #0xd6
	lsls r0, r0, #1
	adds r0, r0, r7
	mov sl, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08088F7C
	adds r6, r7, #0
	adds r6, #0xb0
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08088F7C:
	ldr r0, _08089098 @ =gRepeatedKeys
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08088F8A
	b _08089088
_08088F8A:
	ldr r1, _0808909C @ =0x000001AD
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	cmp r0, #3
	beq _08089054
	mov r6, sb
	ldr r0, [r6, #4]
	bl sub_8007CF0
	ldr r5, _080890A0 @ =gUnknown_080E0474
	ldr r4, _080890A4 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #5
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_8007C10
	str r0, [r6, #4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #5
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	strh r0, [r6, #0xa]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, #5
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #6]
	adds r0, r7, #0
	adds r0, #0xa0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0xa1
	movs r2, #1
	rsbs r2, r2, #0
	adds r5, r2, #0
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xa2
	movs r1, #0x40
	mov sb, r1
	mov r2, sb
	strb r2, [r0]
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	bne _08088FFE
	ldr r0, [r6, #0x10]
	ldr r1, _080890A8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088FFE:
	adds r0, r6, #0
	bl sub_8004558
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0
	beq _08089054
	adds r6, r7, #0
	adds r6, #0xb0
	ldr r0, [r6, #4]
	bl sub_8007CF0
	ldr r4, _080890AC @ =gUnknown_080E04C4
	ldr r0, [r4, #8]
	bl sub_8007C10
	str r0, [r6, #4]
	ldrh r0, [r4, #0xc]
	strh r0, [r6, #0xa]
	ldrb r1, [r4, #0xe]
	adds r0, r7, #0
	adds r0, #0xd0
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0xd1
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0xd2
	mov r1, sb
	strb r1, [r0]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #1
	bne _0808904E
	ldr r0, [r6, #0x10]
	ldr r1, _080890A8 @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
_0808904E:
	adds r0, r6, #0
	bl sub_8004558
_08089054:
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r7, r1
	movs r1, #0
	strh r1, [r0]
	movs r2, #0xd2
	lsls r2, r2, #1
	adds r0, r7, r2
	strh r1, [r0]
	movs r0, #0xd1
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r0, #1
	strh r0, [r1]
	movs r0, #0x6a
	bl m4aSongNumStart
	ldr r0, _080890B0 @ =gMPlayInfo_BGM
	movs r1, #0x80
	lsls r1, r1, #5
	bl m4aMPlayFadeOut
	ldr r0, _080890B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080890B8 @ =sub_8088D60
	str r0, [r1, #8]
_08089088:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089098: .4byte gRepeatedKeys
_0808909C: .4byte 0x000001AD
_080890A0: .4byte gUnknown_080E0474
_080890A4: .4byte gSelectedCharacter
_080890A8: .4byte 0xFFFFFBFF
_080890AC: .4byte gUnknown_080E04C4
_080890B0: .4byte gMPlayInfo_BGM
_080890B4: .4byte gCurTask
_080890B8: .4byte sub_8088D60

@; CreateTimeAttackEndChoice
	thumb_func_start sub_80890BC
sub_80890BC: @ 0x080890BC
	push {lr}
	sub sp, #4
	ldr r0, _080890F4 @ =sub_8088CC4
	movs r1, #0xd8
	lsls r1, r1, #1
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r3, _080890F8 @ =sub_8089104
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r3, _080890FC @ =IWRAM_START + 0x1AD
	adds r2, r1, r3
	movs r3, #0
	strb r3, [r2]
	ldr r2, _08089100 @ =IWRAM_START + 0x1AC
	adds r1, r1, r2
	strb r3, [r1]
	bl sub_8088944
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080890F4: .4byte sub_8088CC4
_080890F8: .4byte sub_8089104
_080890FC: .4byte IWRAM_START + 0x1AD
_08089100: .4byte IWRAM_START + 0x1AC

	thumb_func_start sub_8089104
sub_8089104: @ 0x08089104
	push {r4, lr}
	ldrh r4, [r0, #6]
	ldr r1, _08089154 @ =IWRAM_START + 0xE4
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089158 @ =IWRAM_START + 0x114
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _0808915C @ =IWRAM_START + 0x144
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089160 @ =IWRAM_START + 0x174
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089164 @ =IWRAM_START + 0x84
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	ldr r1, _08089168 @ =IWRAM_START + 0x1AC
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808914E
	subs r1, #0xf8
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
_0808914E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089154: .4byte IWRAM_START + 0xE4
_08089158: .4byte IWRAM_START + 0x114
_0808915C: .4byte IWRAM_START + 0x144
_08089160: .4byte IWRAM_START + 0x174
_08089164: .4byte IWRAM_START + 0x84
_08089168: .4byte IWRAM_START + 0x1AC

@; CreateTimeAttackEndingCutScene
	thumb_func_start sub_808916C
sub_808916C: @ 0x0808916C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	mov r8, r0
	movs r7, #0
	ldr r0, _08089240 @ =gLoadedSaveGame
	ldr r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08089244 @ =gUnknown_030053F0
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _08089248 @ =sub_8089AEC
	movs r1, #0xb7
	lsls r1, r1, #2
	movs r2, #0xc1
	lsls r2, r2, #8
	ldr r3, _0808924C @ =sub_8089BB0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov sl, r0
	ldr r1, _08089250 @ =IWRAM_START + 0x168
	adds r0, r2, r1
	str r7, [r0]
	ldr r3, _08089254 @ =IWRAM_START + 0x2D4
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r1]
	ldr r0, _08089258 @ =IWRAM_START + 0x2D6
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r1]
	mov r1, sl
	strh r7, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	adds r0, #0xff
	strh r0, [r1, #6]
	strh r7, [r1, #4]
	ldr r0, _0808925C @ =0x00003FFF
	strh r0, [r1, #8]
	strh r7, [r1, #0xa]
	ldr r3, _08089260 @ =IWRAM_START + 0x15C
	adds r5, r2, r3
	mov r0, r8
	str r0, [r5]
	ldr r0, _08089264 @ =0x00008C9F
	cmp r8, r0
	bhi _0808926C
	mov r0, r8
	movs r1, #0x3c
	bl __umodsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, r8
	subs r4, r1, r0
	str r4, [r5]
	ldr r3, _08089268 @ =gMillisUnpackTable
	lsls r0, r0, #1
	adds r1, r0, r3
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	adds r3, #1
	adds r0, r0, r3
	lsls r1, r1, #1
	ldrb r0, [r0]
	adds r5, r1, r0
	adds r0, r4, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0x3c
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	b _08089272
	.align 2, 0
_08089240: .4byte gLoadedSaveGame
_08089244: .4byte gUnknown_030053F0
_08089248: .4byte sub_8089AEC
_0808924C: .4byte sub_8089BB0
_08089250: .4byte IWRAM_START + 0x168
_08089254: .4byte IWRAM_START + 0x2D4
_08089258: .4byte IWRAM_START + 0x2D6
_0808925C: .4byte 0x00003FFF
_08089260: .4byte IWRAM_START + 0x15C
_08089264: .4byte 0x00008C9F
_08089268: .4byte gMillisUnpackTable
_0808926C:
	movs r5, #0x63
	movs r4, #0x3b
	movs r2, #9
_08089272:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080895C0 @ =0x00000171
	add r1, sl
	strb r0, [r1]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xb9
	lsls r1, r1, #1
	add r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080895C4 @ =0x00000173
	add r1, sl
	strb r0, [r1]
	adds r4, r5, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xba
	lsls r1, r1, #1
	add r1, sl
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080895C8 @ =0x00000175
	add r1, sl
	strb r0, [r1]
	movs r4, #0
	movs r2, #0xa6
	lsls r2, r2, #1
	add r2, sl
	str r2, [sp, #0x20]
	ldr r3, _080895CC @ =0x0000014D
	add r3, sl
	str r3, [sp, #0x24]
	movs r0, #0xa7
	lsls r0, r0, #1
	add r0, sl
	str r0, [sp, #0x28]
	ldr r1, _080895D0 @ =0x00000151
	add r1, sl
	str r1, [sp, #0x2c]
	mov r2, sl
	adds r2, #0xc
	str r2, [sp, #0x1c]
	mov r3, sl
	adds r3, #0x2c
	str r3, [sp, #0x30]
	mov r0, sl
	adds r0, #0x2d
	str r0, [sp, #0x34]
	mov r1, sl
	adds r1, #0x2e
	str r1, [sp, #0x38]
	adds r2, #0x25
	str r2, [sp, #0x3c]
	adds r3, #0x10
	str r3, [sp, #0x40]
	adds r0, #0x2f
	str r0, [sp, #0x44]
	adds r1, #0x2f
	str r1, [sp, #0x48]
	adds r2, #0x2d
	str r2, [sp, #0x4c]
	adds r3, #0x25
	str r3, [sp, #0x50]
	adds r0, #0x10
	str r0, [sp, #0x54]
	adds r1, #0x2f
	str r1, [sp, #0x58]
	adds r2, #0x2f
	str r2, [sp, #0x5c]
	adds r3, #0x2d
	str r3, [sp, #0x60]
	adds r0, #0x25
	str r0, [sp, #0x64]
	adds r1, #0x10
	str r1, [sp, #0x68]
	adds r2, #0x2f
	str r2, [sp, #0x6c]
	adds r3, #0x2f
	str r3, [sp, #0x70]
	adds r0, #0x2d
	str r0, [sp, #0x74]
	adds r1, #0x25
	str r1, [sp, #0x78]
	adds r2, #0x10
	str r2, [sp, #0x7c]
	adds r3, #0x2f
	str r3, [sp, #4]
	adds r0, #0x3e
	str r0, [sp, #8]
	movs r1, #0x8e
	lsls r1, r1, #1
	add r1, sl
	str r1, [sp, #0xc]
	ldr r2, _080895D4 @ =0x0000011D
	add r2, sl
	str r2, [sp, #0x10]
	movs r3, #0x8f
	lsls r3, r3, #1
	add r3, sl
	str r3, [sp, #0x14]
	ldr r0, _080895D8 @ =0x00000121
	add r0, sl
	str r0, [sp, #0x18]
	movs r6, #0
	movs r5, #0
	ldr r1, _080895DC @ =0x00000417
	mov sb, r1
_0808936A:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r2, #0xbc
	lsls r2, r2, #1
	adds r0, r0, r2
	mov r3, sl
	adds r7, r3, r0
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #1
	adds r0, #0x48
	strh r0, [r7, #0x16]
	movs r0, #0x58
	strh r0, [r7, #0x18]
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	mov r0, sb
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	str r5, [r7, #0x10]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _0808936A
	movs r1, #0xcc
	lsls r1, r1, #1
	add r1, sl
	ldr r0, _080895C0 @ =0x00000171
	add r0, sl
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r0, #0xe4
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0xa
	strb r2, [r0]
	movs r1, #0xfc
	lsls r1, r1, #1
	add r1, sl
	movs r0, #0xb9
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r1, #0x8a
	lsls r1, r1, #2
	add r1, sl
	ldr r0, _080895C4 @ =0x00000173
	add r0, sl
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #2
	add r0, sl
	strb r2, [r0]
	movs r1, #0xa2
	lsls r1, r1, #2
	add r1, sl
	movs r0, #0xba
	lsls r0, r0, #1
	add r0, sl
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	movs r1, #0xae
	lsls r1, r1, #2
	add r1, sl
	ldr r0, _080895C8 @ =0x00000175
	add r0, sl
	ldrb r0, [r0]
	ldrb r3, [r1]
	adds r0, r0, r3
	strb r0, [r1]
	movs r4, #0
_0808943E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xbc
	lsls r1, r1, #1
	adds r0, r0, r1
	add r0, sl
	bl sub_8004558
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _0808943E
	mov r0, r8
	bl sub_80899B8
	movs r1, #0xb6
	lsls r1, r1, #2
	add r1, sl
	movs r2, #0
	mov r8, r2
	strb r0, [r1]
	movs r7, #0x96
	lsls r7, r7, #1
	add r7, sl
	movs r3, #0x80
	lsls r3, r3, #1
	strh r3, [r7, #0x16]
	movs r0, #0x50
	strh r0, [r7, #0x18]
	movs r0, #4
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0x8c
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r1, #0
	ldr r0, [sp, #0x20]
	strb r1, [r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	mov r2, r8
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	movs r1, #0x10
	ldr r0, [sp, #0x28]
	strb r1, [r0]
	movs r3, #0
	ldr r2, [sp, #0x2c]
	strb r3, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r1, r8
	str r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x1c]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x16]
	movs r0, #0x29
	strh r0, [r7, #0x18]
	ldr r4, _080895E0 @ =gUnknown_080D713C
	ldr r5, _080895E4 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r4, #4
	adds r0, r0, r4
	ldrh r0, [r0]
	ldr r3, [sp, #0x30]
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	mov r1, r8
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x34]
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, [sp, #0x38]
	strb r0, [r3]
	movs r2, #0
	ldr r1, [sp, #0x3c]
	strb r2, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	mov r0, r8
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080895E8 @ =gCurrentLevel
	mov sb, r1
	ldrb r0, [r1]
	movs r6, #3
	ands r6, r0
	lsrs r6, r6, #1
	ldr r7, [sp, #0x40]
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r5, _080895EC @ =gUnknown_080D715A
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r3, [sp, #0x44]
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r7, #0x1a]
	mov r1, r8
	strh r1, [r7, #8]
	strh r1, [r7, #0x14]
	strh r1, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x48]
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, [sp, #0x4c]
	strb r0, [r3]
	movs r2, #0
	ldr r1, [sp, #0x50]
	strb r2, [r1]
	movs r3, #1
	rsbs r3, r3, #0
	str r3, [r7, #0x28]
	mov r0, r8
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	cmp r6, #0
	beq _080895F0
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	adds r0, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	b _080895F8
	.align 2, 0
_080895C0: .4byte 0x00000171
_080895C4: .4byte 0x00000173
_080895C8: .4byte 0x00000175
_080895CC: .4byte 0x0000014D
_080895D0: .4byte 0x00000151
_080895D4: .4byte 0x0000011D
_080895D8: .4byte 0x00000121
_080895DC: .4byte 0x00000417
_080895E0: .4byte gUnknown_080D713C
_080895E4: .4byte gSelectedCharacter
_080895E8: .4byte gCurrentLevel
_080895EC: .4byte gUnknown_080D715A
_080895F0:
	mov r2, sb
	ldrb r0, [r2]
	movs r1, #1
	ands r1, r0
_080895F8:
	ldr r7, [sp, #0x54]
	movs r6, #0
	movs r3, #0x80
	lsls r3, r3, #1
	mov r8, r3
	mov r0, r8
	strh r0, [r7, #0x16]
	movs r0, #0x31
	strh r0, [r7, #0x18]
	ldr r5, _080896C4 @ =gUnknown_080D7178
	lsls r4, r1, #1
	adds r4, r4, r1
	lsls r4, r4, #1
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_8007C10
	str r0, [r7, #4]
	adds r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	adds r5, #4
	adds r4, r4, r5
	ldrh r0, [r4]
	ldr r1, [sp, #0x58]
	strb r0, [r1]
	mov r2, r8
	strh r2, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	movs r0, #0xff
	ldr r3, [sp, #0x5c]
	strb r0, [r3]
	movs r5, #0x10
	ldr r0, [sp, #0x60]
	strb r5, [r0]
	movs r2, #0
	ldr r1, [sp, #0x64]
	strb r2, [r1]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x68]
	movs r0, #0x28
	strh r0, [r7, #0x16]
	movs r0, #0x5a
	strh r0, [r7, #0x18]
	movs r0, #8
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0x86
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	movs r0, #1
	ldr r3, [sp, #0x6c]
	strb r0, [r3]
	mov r0, r8
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
	adds r0, r4, #0
	ldr r1, [sp, #0x70]
	strb r0, [r1]
	ldr r2, [sp, #0x74]
	strb r5, [r2]
	movs r0, #0
	ldr r3, [sp, #0x78]
	strb r0, [r3]
	str r4, [r7, #0x28]
	str r6, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r7, [sp, #0x7c]
	movs r0, #0x78
	strh r0, [r7, #0x16]
	strh r0, [r7, #0x18]
	movs r0, #0x10
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r0, _080896C8 @ =0x00000417
	strh r0, [r7, #0xa]
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _080896CC
	adds r0, #0xd
	ldr r1, [sp, #4]
	strb r0, [r1]
	b _080896D2
	.align 2, 0
_080896C4: .4byte gUnknown_080D7178
_080896C8: .4byte 0x00000417
_080896CC:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2]
_080896D2:
	movs r6, #0
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #1
	strh r5, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	movs r3, #0x10
	strb r3, [r0]
	adds r0, #3
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r7, #0x28]
	ldr r2, _080897B0 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x20
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r0, _080897B4 @ =0x000002CA
	add r0, sl
	strh r4, [r0]
	movs r0, #0xb3
	lsls r0, r0, #2
	add r0, sl
	strh r5, [r0]
	ldr r0, _080897B8 @ =0x000002CE
	add r0, sl
	movs r1, #0x78
	strh r1, [r0]
	movs r0, #0xb4
	lsls r0, r0, #2
	add r0, sl
	strh r1, [r0]
	movs r0, #0xb2
	lsls r0, r0, #2
	add r0, sl
	strh r4, [r0]
	ldr r7, [sp, #8]
	strh r1, [r7, #0x16]
	movs r0, #0x94
	strh r0, [r7, #0x18]
	movs r0, #0x16
	bl sub_8007C10
	str r0, [r7, #4]
	movs r0, #0x86
	lsls r0, r0, #3
	strh r0, [r7, #0xa]
	ldr r1, [sp, #0xc]
	strb r6, [r1]
	strh r5, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	movs r0, #0x10
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r1, [sp, #0x18]
	strb r6, [r1]
	mov r2, r8
	str r2, [r7, #0x28]
	str r4, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	ldr r1, _080897BC @ =gUnknown_030054A8
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _080897C0 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bne _08089798
	ldr r0, _080897C4 @ =gUnknown_030059E0
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
_08089798:
	movs r0, #0xb6
	lsls r0, r0, #2
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #1
	bne _080897C8
	movs r0, #0xcb
	lsls r0, r0, #1
	bl m4aSongNumStart
	b _080897CE
	.align 2, 0
_080897B0: .4byte gUnknown_030054B8
_080897B4: .4byte 0x000002CA
_080897B8: .4byte 0x000002CE
_080897BC: .4byte gUnknown_030054A8
_080897C0: .4byte gCurrentLevel
_080897C4: .4byte gUnknown_030059E0
_080897C8:
	ldr r0, _080897E4 @ =0x00000195
	bl m4aSongNumStart
_080897CE:
	movs r0, #0x96
	lsls r0, r0, #2
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080897E4: .4byte 0x00000195

	thumb_func_start sub_80897E8
sub_80897E8: @ 0x080897E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08089834 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r1, _08089838 @ =IWRAM_START + 0x168
	adds r0, r3, r1
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0x17
	bhi _08089840
	ldr r2, _0808983C @ =IWRAM_START + 0x12C
	adds r5, r3, r2
	movs r0, #0
	mov r3, r8
	cmp r3, #0x10
	bhi _0808981C
	movs r1, #0x10
	subs r1, r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
_0808981C:
	movs r6, #0
	adds r4, r0, #0
_08089820:
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r4, #0x20
	adds r6, #1
	cmp r6, #7
	bls _08089820
	b _08089856
	.align 2, 0
_08089834: .4byte gCurTask
_08089838: .4byte IWRAM_START + 0x168
_0808983C: .4byte IWRAM_START + 0x12C
_08089840:
	ldr r0, _08089910 @ =IWRAM_START + 0x12C
	adds r5, r3, r0
	movs r6, #0
_08089846:
	lsls r0, r6, #5
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_80051E8
	adds r6, #1
	cmp r6, #7
	bls _08089846
_08089856:
	mov r1, r8
	cmp r1, #0x1c
	bls _08089886
	ldr r0, _08089914 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	movs r4, #3
	cmp r0, #2
	bne _0808986C
	movs r4, #2
_0808986C:
	movs r6, #0
	cmp r6, r4
	bhs _08089886
	adds r0, r7, #0
	adds r0, #0xc
_08089876:
	adds r5, r0, #0
	bl sub_80051E8
	adds r0, r5, #0
	adds r0, #0x30
	adds r6, #1
	cmp r6, r4
	blo _08089876
_08089886:
	mov r2, r8
	cmp r2, #0x59
	bls _080898A8
	adds r5, r7, #0
	adds r5, #0x9c
	mov r0, r8
	subs r0, #0x5a
	cmp r0, #0xa
	bhi _080898A2
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x28
	strh r0, [r5, #0x16]
_080898A2:
	adds r0, r5, #0
	bl sub_80051E8
_080898A8:
	mov r3, r8
	cmp r3, #0x77
	bls _080899A6
	mov r0, r8
	subs r0, #0x7f
	cmp r0, #0x10
	ble _08089964
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08089944
	adds r5, r7, #0
	adds r5, #0xcc
	ldr r1, _08089918 @ =gSineTable
	ldr r3, _0808991C @ =0x000002D6
	adds r2, r7, r3
	ldrh r0, [r2]
	lsrs r0, r0, #8
	lsls r0, r0, #3
	subs r3, #0xd6
	adds r0, r0, r3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r3, #0xca
	adds r1, r7, r3
	strh r0, [r1]
	movs r0, #0xb5
	lsls r0, r0, #2
	adds r3, r7, r0
	ldrh r0, [r3]
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	bne _08089922
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r1, r0
	bne _08089920
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r3]
	b _08089922
	.align 2, 0
_08089910: .4byte IWRAM_START + 0x12C
_08089914: .4byte gCurrentLevel
_08089918: .4byte gSineTable
_0808991C: .4byte 0x000002D6
_08089920:
	strh r2, [r3]
_08089922:
	ldr r2, _080899B0 @ =0x000002CA
	adds r1, r7, r2
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08089932
	movs r0, #0x10
	strh r0, [r1]
_08089932:
	movs r0, #0xb2
	lsls r0, r0, #2
	adds r1, r7, r0
	adds r0, r5, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
_08089944:
	movs r1, #0xb6
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _08089964
	movs r0, #0x20
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _08089964
	adds r5, r7, #0
	adds r5, #0xfc
	adds r0, r5, #0
	bl sub_80051E8
_08089964:
	movs r6, #0
	mov r0, r8
	subs r0, #0x78
	cmp r0, #0
	blt _080899A6
	adds r4, r0, #0
	movs r3, #0xc8
	lsls r3, r3, #1
	adds r5, r7, r3
	movs r0, #0xbc
	lsls r0, r0, #1
	adds r7, r7, r0
_0808997C:
	cmp r4, #0x13
	bhi _08089990
	ldr r0, _080899B4 @ =gUnknown_080E05C4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
_08089990:
	adds r0, r7, #0
	bl sub_80051E8
	subs r4, #1
	adds r5, #0x30
	adds r7, #0x30
	adds r6, #1
	cmp r6, #6
	bhi _080899A6
	cmp r4, #0
	bge _0808997C
_080899A6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080899B0: .4byte 0x000002CA
_080899B4: .4byte gUnknown_080E05C4

	thumb_func_start sub_80899B8
sub_80899B8: @ 0x080899B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov ip, r0
	ldr r0, _08089A84 @ =gSelectedCharacter
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, _08089A88 @ =gCurrentLevel
	ldrb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #0
	bge _080899E8
	adds r0, r1, #3
_080899E8:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	movs r3, #0
	mov r1, r8
	lsls r1, r1, #3
	mov sb, r1
	ldr r2, [sp, #0xc]
	lsls r2, r2, #6
	mov sl, r2
	ldr r7, _08089A8C @ =gLoadedSaveGame
	ldr r2, [r7]
	lsls r1, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	str r0, [sp, #0x18]
	mov r0, sb
	add r0, r8
	lsls r5, r0, #1
	adds r4, r2, #0
	adds r4, #0x34
	mov r2, sl
	ldr r7, [sp, #0xc]
	subs r0, r2, r7
	lsls r2, r0, #1
	str r1, [sp, #0x14]
_08089A24:
	lsls r0, r3, #2
	mov r7, sp
	adds r1, r7, r0
	lsls r0, r3, #1
	ldr r7, [sp, #0x18]
	adds r0, r0, r7
	adds r0, r0, r5
	adds r0, r0, r2
	adds r0, r4, r0
	ldrh r0, [r0]
	str r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089A24
	movs r3, #0
	ldr r1, [sp, #0x14]
	adds r0, r1, r6
	lsls r5, r0, #1
	mov r0, sb
	add r0, r8
	lsls r4, r0, #1
	mov r2, sl
	ldr r7, [sp, #0xc]
	subs r0, r2, r7
	lsls r2, r0, #1
_08089A5A:
	lsls r0, r3, #2
	add r0, sp
	ldr r0, [r0]
	cmp ip, r0
	bhs _08089A90
	ldr r1, _08089A8C @ =gLoadedSaveGame
	ldr r0, [r1]
	lsls r1, r3, #1
	adds r1, r1, r5
	adds r1, r1, r4
	adds r1, r1, r2
	adds r0, #0x34
	adds r0, r0, r1
	mov r2, ip
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	adds r3, r0, #0
	b _08089A9A
	.align 2, 0
_08089A84: .4byte gSelectedCharacter
_08089A88: .4byte gCurrentLevel
_08089A8C: .4byte gLoadedSaveGame
_08089A90:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089A5A
_08089A9A:
	cmp r3, #2
	bhi _08089AD6
	ldr r7, [sp, #0x14]
	adds r0, r7, r6
	lsls r5, r0, #1
	mov r0, sb
	add r0, r8
	lsls r4, r0, #1
	mov r1, sl
	ldr r2, [sp, #0xc]
	subs r0, r1, r2
	lsls r2, r0, #1
	ldr r6, _08089AE8 @ =gLoadedSaveGame
_08089AB4:
	ldr r1, [r6]
	lsls r0, r3, #1
	adds r0, r0, r5
	adds r0, r0, r4
	adds r0, r0, r2
	adds r1, #0x34
	adds r1, r1, r0
	subs r0, r3, #1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #2
	bls _08089AB4
_08089AD6:
	ldr r0, [sp, #0x10]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089AE8: .4byte gLoadedSaveGame

	thumb_func_start sub_8089AEC
sub_8089AEC: @ 0x08089AEC
	push {r4, lr}
	ldr r0, _08089B30 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08089B34 @ =IWRAM_START + 0x168
	adds r0, r0, r1
	ldr r4, [r0]
	adds r4, #1
	str r4, [r0]
	bl sub_80310F0
	bl sub_8031314
	bl sub_80897E8
	cmp r4, #0xa0
	bls _08089B1A
	ldr r0, _08089B38 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _08089B22
_08089B1A:
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r4, r0
	bls _08089B2A
_08089B22:
	ldr r0, _08089B30 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08089B3C @ =sub_8089B40
	str r0, [r1, #8]
_08089B2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089B30: .4byte gCurTask
_08089B34: .4byte IWRAM_START + 0x168
_08089B38: .4byte gPressedKeys
_08089B3C: .4byte sub_8089B40

	thumb_func_start sub_8089B40
sub_8089B40: @ 0x08089B40
	push {lr}
	ldr r0, _08089B84 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08089BA0
	bl WriteSaveGame
	ldr r1, _08089B88 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _08089B8C @ =gUnknown_03002AE4
	ldr r0, _08089B90 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08089B94 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08089B98 @ =gUnknown_03004D5C
	ldr r0, _08089B9C @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_80890BC
	b _08089BAC
	.align 2, 0
_08089B84: .4byte gCurTask
_08089B88: .4byte 0x0000FFFF
_08089B8C: .4byte gUnknown_03002AE4
_08089B90: .4byte gUnknown_0300287C
_08089B94: .4byte gUnknown_03005390
_08089B98: .4byte gUnknown_03004D5C
_08089B9C: .4byte gUnknown_03002A84
_08089BA0:
	bl sub_80310F0
	bl sub_8031314
	bl sub_80897E8
_08089BAC:
	pop {r0}
	bx r0

	thumb_func_start sub_8089BB0
sub_8089BB0: @ 0x08089BB0
	push {r4, r5, r6, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r1, _08089C14 @ =IWRAM_START + 0x130
	adds r0, r4, r1
	ldr r0, [r0]
	bl sub_8007CF0
	movs r5, #0
	ldr r0, _08089C18 @ =IWRAM_START + 0x10
	adds r4, r4, r0
_08089BCA:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #2
	bls _08089BCA
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0xa0
_08089BDE:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #2
	bls _08089BDE
	movs r5, #0
	movs r1, #0xbe
	lsls r1, r1, #1
	adds r4, r6, r1
_08089BF4:
	ldr r0, [r4]
	bl sub_8007CF0
	adds r4, #0x30
	adds r5, #1
	cmp r5, #6
	bls _08089BF4
	ldr r2, _08089C1C @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08089C20 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089C14: .4byte IWRAM_START + 0x130
_08089C18: .4byte IWRAM_START + 0x10
_08089C1C: .4byte gUnknown_03005424
_08089C20: .4byte 0x0000FDFF

	thumb_func_start sub_8089C24
sub_8089C24: @ 0x08089C24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08089D64 @ =sub_8089E54
	ldr r2, _08089D68 @ =0x00005050
	ldr r1, _08089D6C @ =sub_808A234
	str r1, [sp]
	movs r1, #0xe8
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r5, r0
	ldr r1, _08089D70 @ =IWRAM_START + 0x60
	adds r0, r5, r1
	movs r2, #0
	mov r8, r2
	movs r6, #0
	strh r6, [r0]
	movs r0, #1
	bl sub_8007C10
	str r0, [r7, #4]
	ldr r3, _08089D74 @ =0x00000369
	strh r3, [r7, #0xa]
	ldr r1, _08089D78 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	mov r2, r8
	strb r2, [r0]
	strh r6, [r7, #8]
	ldr r3, _08089D7C @ =IWRAM_START + 0x21
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r7, #0x1a]
	movs r1, #0x80
	lsls r1, r1, #6
	mov sl, r1
	str r1, [r7, #0x10]
	strh r6, [r7, #0x1c]
	ldr r2, _08089D80 @ =IWRAM_START + 0x22
	adds r0, r5, r2
	movs r3, #0x10
	mov sb, r3
	mov r1, sb
	strb r1, [r0]
	adds r2, #3
	adds r0, r5, r2
	mov r3, r8
	strb r3, [r0]
	adds r0, r7, #0
	bl sub_8004558
	ldr r0, _08089D84 @ =IWRAM_START + 0x30
	adds r4, r5, r0
	movs r0, #1
	bl sub_8007C10
	str r0, [r4, #4]
	ldr r1, _08089D74 @ =0x00000369
	strh r1, [r4, #0xa]
	ldr r2, _08089D88 @ =IWRAM_START + 0x50
	adds r1, r5, r2
	movs r0, #1
	strb r0, [r1]
	strh r6, [r4, #8]
	ldr r3, _08089D8C @ =IWRAM_START + 0x51
	adds r1, r5, r3
	subs r0, #2
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	mov r1, sl
	str r1, [r4, #0x10]
	strh r6, [r4, #0x1c]
	adds r2, #2
	adds r0, r5, r2
	mov r3, sb
	strb r3, [r0]
	ldr r0, _08089D90 @ =IWRAM_START + 0x55
	adds r5, r5, r0
	mov r1, r8
	strb r1, [r5]
	ldr r4, _08089D94 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	ldr r1, _08089D98 @ =gUnknown_03005960
	ldr r1, [r1]
	bl SeedRng
	ldr r2, _08089D94 @ =gUnknown_030059E0
	adds r2, #0x24
	mov r8, r2
	ldr r4, _08089D9C @ =gSineTable
	movs r3, #0xff
	mov sl, r3
	movs r0, #0xf
	mov sb, r0
_08089CF6:
	bl Random
	adds r1, r7, #0
	adds r1, #0x64
	adds r3, r1, r6
	ldr r2, _08089DA0 @ =0x000007FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08089D94 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08089DA4
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	adds r2, #0x62
	adds r2, r2, r6
	mov ip, r2
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #0x80
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #0x80
	mov r1, sl
	ands r0, r1
	b _08089DD8
	.align 2, 0
_08089D64: .4byte sub_8089E54
_08089D68: .4byte 0x00005050
_08089D6C: .4byte sub_808A234
_08089D70: .4byte IWRAM_START + 0x60
_08089D74: .4byte 0x00000369
_08089D78: .4byte IWRAM_START + 0x20
_08089D7C: .4byte IWRAM_START + 0x21
_08089D80: .4byte IWRAM_START + 0x22
_08089D84: .4byte IWRAM_START + 0x30
_08089D88: .4byte IWRAM_START + 0x50
_08089D8C: .4byte IWRAM_START + 0x51
_08089D90: .4byte IWRAM_START + 0x55
_08089D94: .4byte gUnknown_030059E0
_08089D98: .4byte gUnknown_03005960
_08089D9C: .4byte gSineTable
_08089DA0: .4byte 0x000007FF
_08089DA4:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r2, r7, #0
	adds r2, #0x62
	adds r2, r2, r6
	mov ip, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	mov r2, r8
	ldrb r0, [r2]
_08089DD8:
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	movs r2, #0
	ldrsh r1, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	bl Random
	ldr r3, _08089E50 @ =0x000003FF
	mov ip, r3
	adds r2, r7, #0
	adds r2, #0xa2
	adds r2, r2, r6
	lsls r1, r5, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov r3, ip
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	muls r1, r0, r1
	asrs r1, r1, #8
	strh r1, [r2]
	adds r2, r7, #0
	adds r2, #0xa4
	adds r2, r2, r6
	lsls r1, r5, #3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	adds r6, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	blt _08089E40
	b _08089CF6
_08089E40:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089E50: .4byte 0x000003FF

	thumb_func_start sub_8089E54
sub_8089E54: @ 0x08089E54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08089EB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	mov sl, r0
	mov r8, r0
_08089E78:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08089EBC
	adds r5, r7, #0
	adds r5, #0x62
	mov r2, r8
	adds r1, r5, r2
	adds r4, r7, #0
	adds r4, #0xa2
	adds r0, r4, r2
	ldrh r0, [r0]
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	adds r3, r7, #0
	adds r3, #0x64
	adds r1, r3, r2
	adds r2, r7, #0
	adds r2, #0xa4
	mov r6, r8
	adds r0, r2, r6
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r0, r6
	strh r0, [r1]
	adds r6, r5, #0
	mov sb, r4
	adds r4, r3, #0
	adds r5, r2, #0
	b _08089EEC
	.align 2, 0
_08089EB8: .4byte gCurTask
_08089EBC:
	adds r6, r7, #0
	adds r6, #0x62
	mov r0, r8
	adds r2, r6, r0
	adds r5, r7, #0
	adds r5, #0xa2
	adds r1, r5, r0
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x64
	mov r1, r8
	adds r2, r4, r1
	adds r3, r7, #0
	adds r3, #0xa4
	adds r1, r3, r1
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r2]
	mov sb, r5
	adds r5, r3, #0
_08089EEC:
	mov r1, sb
	add r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r3, #0xc8
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r1]
	mov r0, r8
	adds r1, r5, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r1]
	ldr r3, _08089FF0 @ =gUnknown_030059E0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	ldr r2, _08089FF4 @ =gUnknown_03005960
	ldr r0, [r2]
	subs r1, r1, r0
	mov r3, r8
	adds r0, r6, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r7, #0x16]
	ldr r6, _08089FF0 @ =gUnknown_030059E0
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl sub_80051E8
	movs r0, #4
	add r8, r0
	movs r1, #1
	add sl, r1
	mov r2, sl
	cmp r2, #7
	ble _08089E78
	adds r0, r7, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #8
	bhi _08089F62
	b _0808A082
_08089F62:
	adds r1, r7, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08089FF0 @ =gUnknown_030059E0
	ldr r0, [r4, #8]
	ldr r1, _08089FF4 @ =gUnknown_03005960
	ldr r1, [r1]
	bl SeedRng
	adds r3, r7, #0
	adds r3, #0xe2
	str r3, [sp]
	adds r7, #0xe4
	mov r8, r7
	ldr r4, _08089FF8 @ =gSineTable
	adds r6, r5, #0
	mov r5, sb
	movs r0, #0xff
	mov sb, r0
	movs r1, #0xf
	mov sl, r1
_08089F8E:
	movs r1, #0
	movs r0, #0x80
	ldr r2, [sp]
	strh r0, [r2]
	mov r3, r8
	strh r1, [r3]
	ldr r1, _08089FF0 @ =gUnknown_030059E0
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A000
	bl Random
	lsls r0, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x17
	adds r0, r0, r2
	lsrs r7, r0, #0x18
	ldr r3, _08089FFC @ =gUnknown_03005A04
	ldrb r0, [r3]
	adds r0, #0x80
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r3, [sp]
	strh r0, [r3]
	ldr r1, _08089FFC @ =gUnknown_03005A04
	ldrb r0, [r1]
	adds r0, #0x80
	mov r2, sb
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	mov r3, r8
	strh r0, [r3]
	b _0808A034
	.align 2, 0
_08089FF0: .4byte gUnknown_030059E0
_08089FF4: .4byte gUnknown_03005960
_08089FF8: .4byte gSineTable
_08089FFC: .4byte gUnknown_03005A04
_0808A000:
	bl Random
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0808A094 @ =gUnknown_03005A04
	ldrb r0, [r1]
	lsls r0, r0, #3
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	ldr r3, [sp]
	strh r0, [r3]
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #2
	mov r1, r8
	strh r0, [r1]
_0808A034:
	bl Random
	ldr r3, _0808A098 @ =0x000003FF
	adds r2, r3, #0
	lsls r1, r7, #3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ands r0, r2
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r0, r2
	muls r1, r0, r1
	asrs r1, r1, #8
	strh r1, [r5]
	lsls r1, r7, #3
	adds r1, r1, r4
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	adds r6, #4
	adds r5, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08089F8E
	ldr r0, _0808A09C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0808A0A0 @ =sub_808A0A4
	str r0, [r1, #8]
_0808A082:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A094: .4byte gUnknown_03005A04
_0808A098: .4byte 0x000003FF
_0808A09C: .4byte gCurTask
_0808A0A0: .4byte sub_808A0A4

	thumb_func_start sub_808A0A4
sub_808A0A4: @ 0x0808A0A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0808A0DC @ =gCurTask
	ldr r4, [r0]
	ldrh r3, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov sb, r0
	mov r1, sb
	orrs r1, r3
	mov sb, r1
	adds r0, #0x60
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x18
	bls _0808A0E0
	adds r0, r4, #0
	bl TaskDestroy
	b _0808A222
	.align 2, 0
_0808A0DC: .4byte gCurTask
_0808A0E0:
	movs r1, #0
	mov r8, r1
	ldr r0, _0808A1C4 @ =IWRAM_START + 0x62
	adds r0, r3, r0
	str r0, [sp, #8]
	ldr r1, _0808A1C8 @ =IWRAM_START + 0xA2
	adds r1, r3, r1
	str r1, [sp]
	ldr r0, _0808A1CC @ =IWRAM_START + 0x64
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _0808A1D0 @ =IWRAM_START + 0xA4
	adds r1, r3, r1
	str r1, [sp, #4]
	ldr r0, _0808A1D4 @ =IWRAM_START + 0xE2
	adds r7, r3, r0
	ldr r1, _0808A1D8 @ =IWRAM_START + 0xE4
	adds r6, r3, r1
	movs r0, #0xc8
	mov sl, r0
_0808A108:
	mov r1, r8
	lsls r2, r1, #2
	ldr r0, [sp, #8]
	adds r4, r0, r2
	ldr r1, [sp]
	adds r5, r1, r2
	ldrh r0, [r5]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	mov r0, ip
	adds r3, r0, r2
	ldr r1, [sp, #4]
	adds r2, r1, r2
	ldrh r0, [r2]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r4]
	ldrh r1, [r7]
	subs r0, r0, r1
	strh r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r6]
	subs r0, r0, r1
	strh r0, [r3]
	movs r1, #0
	ldrsh r0, [r5, r1]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r5]
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r2]
	movs r0, #0
	ldrsh r1, [r7, r0]
	lsls r0, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r7]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #8
	adds r0, r0, r1
	asrs r0, r0, #8
	strh r0, [r6]
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0xf
	ble _0808A108
	mov sl, sb
	ldr r7, _0808A1DC @ =gUnknown_030059E0
	ldr r6, _0808A1E0 @ =gUnknown_03005960
	mov r5, ip
	ldr r4, [sp, #8]
	movs r1, #7
	mov r8, r1
_0808A188:
	mov r0, sl
	adds r0, #0x60
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A1E4
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r6]
	subs r1, r1, r0
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	ldr r0, [r6, #4]
	subs r1, r1, r0
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x18]
	bl sub_8004558
	b _0808A20C
	.align 2, 0
_0808A1C4: .4byte IWRAM_START + 0x62
_0808A1C8: .4byte IWRAM_START + 0xA2
_0808A1CC: .4byte IWRAM_START + 0x64
_0808A1D0: .4byte IWRAM_START + 0xA4
_0808A1D4: .4byte IWRAM_START + 0xE2
_0808A1D8: .4byte IWRAM_START + 0xE4
_0808A1DC: .4byte gUnknown_030059E0
_0808A1E0: .4byte gUnknown_03005960
_0808A1E4:
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	ldr r0, [r6]
	subs r1, r1, r0
	ldrh r0, [r4, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	ldr r0, [r6, #4]
	subs r1, r1, r0
	ldrh r0, [r5, #0x20]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r0, sb
	strh r1, [r0, #0x18]
_0808A20C:
	mov r0, sl
	bl sub_80051E8
	adds r5, #4
	adds r4, #4
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r0, r8
	cmp r0, #0
	bge _0808A188
_0808A222:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_808A234
sub_808A234: @ 0x0808A234
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl sub_8007CF0
	ldr r0, _0808A254 @ =IWRAM_START + 0x30
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl sub_8007CF0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A254: .4byte IWRAM_START + 0x30
