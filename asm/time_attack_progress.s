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
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08086DE4 @ =0x00000465
	strh r0, [r7, #0xa]
	ldr r2, _08086DE8 @ =gMultiplayerCharacters
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
_08086DE8: .4byte gMultiplayerCharacters
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
	bl VramMalloc
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
	bl VramMalloc
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
	bl VramFree
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
	bl VramFree
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
	bl VramMalloc
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
	bl VramMalloc
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
	bl MultiPakCommunicationError
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
	ldr r5, _080877D8 @ =gMultiplayerCharacters
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
_080877D8: .4byte gMultiplayerCharacters
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
	bl CreateCharacterSelectionScreen
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
	bl MultiPakCommunicationError
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
	bl MultiPakCommunicationError
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
	bl MultiPakCommunicationError
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
	bl MultiPakCommunicationError
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
	bl VramFree
	movs r5, #0
	ldr r0, _08087F44 @ =IWRAM_START + 0x34
	adds r4, r4, r0
_08087F26:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	bl VramFree
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
	bl MultiPakCommunicationError
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
