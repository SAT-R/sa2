.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 01
	thumb_func_start sub_804F850
sub_804F850: @ 0x0804F850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]        @ sp08 = qX
	str r1, [sp, #0xc]      @ sp0C = qY
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r0, _0804F8C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804F8C8 @ =IWRAM_START + 0x654
	adds r4, r0, r1         @ r4 = unk654
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r7, _0804F8CC @ =IWRAM_START + 0x662
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804F886:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804F8AA
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804F886
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804F886
_0804F8AA:
	cmp r3, #8
	bne _0804F8B0
	movs r5, #1
_0804F8B0:
	cmp r5, #0
	beq sub_804F850__return
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804F8D0
	adds r0, r6, #0
	adds r0, #0x3c
	b _0804F8D4
	.align 2, 0
_0804F8C4: .4byte gCurTask
_0804F8C8: .4byte IWRAM_START + 0x654
_0804F8CC: .4byte IWRAM_START + 0x662
_0804F8D0:
	adds r0, r6, #0
	subs r0, #0x3c
_0804F8D4:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0804F9B4 @ =0x000003FF
	ands r6, r0
	movs r5, #0             @ i = 0
	adds r0, r4, #0
	adds r0, #0xe
	str r0, [sp, #0x10]     @ sp10 = &unk654->unkE[0]
	adds r1, r4, #0
	adds r1, #0x1e
	str r1, [sp, #0x14]     @ sp14 = &unk654->unk1E[0]
	adds r2, r4, #0
	adds r2, #0x2e
	str r2, [sp, #0x18]     @ sp10 = &unk654->unk2E[0][0]
	adds r7, r4, #0
	adds r7, #0x30
	str r7, [sp, #0x1c]     @ sp10 = &unk654->unk2E[0][1]
	movs r0, #0x70
	adds r0, r0, r4
	mov sl, r0              @ sl = &unk654->qPos70[0].x
	adds r4, #0x74
	mov sb, r4              @ sb = &unk654->qPos70[0].y
	movs r1, #0x80
	lsls r1, r1, #1
	mov ip, r1              @ ip = 0x100
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r2, _0804F9B8 @ =gSineTable
	adds r0, r0, r2
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	mov r8, r0              @ r8 = (COS(r6) * 3) >> 6
_0804F91A:
	mov r7, sp
	adds r0, r7, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r4, [sp, #0x14]
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r3, r2, #2
	ldr r7, [sp, #0x18]
	adds r4, r7, r3
	mov r0, r8
	strh r0, [r4]
	ldr r1, [sp, #0x1c]
	adds r3, r1, r3
	lsls r0, r6, #1
	ldr r7, _0804F9B8 @ =gSineTable
	adds r0, r0, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r0, r5, #7
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _0804F9B8 @ =gSineTable
	adds r0, r0, r1
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	lsls r0, r5, #8
	ldr r4, _0804F9B8 @ =gSineTable
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r2, r2, #3
	mov r4, sl
	adds r0, r4, r2
	ldr r7, [sp, #8]
	str r7, [r0]
	add r2, sb
	ldr r0, [sp, #0xc]
	str r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804F91A
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
sub_804F850__return:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9B4: .4byte 0x000003FF
_0804F9B8: .4byte gSineTable
.endif

	thumb_func_start sub_804F9BC
sub_804F9BC: @ 0x0804F9BC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r0, _0804F9FC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FA00 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r5, #0
	ldr r3, _0804FA04 @ =IWRAM_START + 0x662
	adds r2, r0, r3
	ldr r6, _0804FA08 @ =gSineTable
_0804F9DC:
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FA8C
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0804FA0C
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r7, ip
	ldrh r7, [r7, #0xc]
	adds r0, r0, r7
	b _0804FA18
	.align 2, 0
_0804F9FC: .4byte gCurTask
_0804FA00: .4byte IWRAM_START + 0x654
_0804FA04: .4byte IWRAM_START + 0x662
_0804FA08: .4byte gSineTable
_0804FA0C:
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #1
	mov r3, ip
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
_0804FA18:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r7, _0804FA84 @ =0x000003FF
	adds r0, r7, #0
	ands r4, r0
	adds r1, r2, r5
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	lsls r3, r5, #2
	mov r2, ip
	adds r2, #0x2e
	adds r2, r2, r3
	adds r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
	mov r2, ip
	adds r2, #0x30
	adds r2, r2, r3
	lsls r0, r4, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #7
	strh r0, [r2]
	lsls r1, r5, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r7, sb
	str r7, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	ldr r0, _0804FA88 @ =0x00000115
	bl m4aSongNumStart
	b _0804FA96
	.align 2, 0
_0804FA84: .4byte 0x000003FF
_0804FA88: .4byte 0x00000115
_0804FA8C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804F9DC
_0804FA96:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804FAA4
sub_804FAA4: @ 0x0804FAA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0804FB18 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FB1C @ =IWRAM_START + 0x654
	adds r4, r0, r1
	lsls r3, r3, #0x16
	lsrs r3, r3, #0x16
	mov ip, r3
	mov r1, sp
	movs r5, #0
	movs r3, #0
	movs r2, #0
	ldr r6, _0804FB20 @ =IWRAM_START + 0x662
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r5, [r1]
	adds r1, #1
	movs r3, #1
_0804FADC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FB00
	adds r0, r4, #0
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FADC
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FADC
_0804FB00:
	cmp r3, #8
	bne _0804FB06
	movs r5, #1
_0804FB06:
	cmp r5, #0
	beq _0804FBFC
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FB24
	mov r0, ip
	adds r0, #0x46
	b _0804FB28
	.align 2, 0
_0804FB18: .4byte gCurTask
_0804FB1C: .4byte IWRAM_START + 0x654
_0804FB20: .4byte IWRAM_START + 0x662
_0804FB24:
	mov r0, ip
	subs r0, #0x46
_0804FB28:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _0804FB88 @ =0x000003FF
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r7, #0
	adds r2, r4, #0
	adds r2, #0xe
	str r2, [sp, #0x10]
	adds r3, r4, #0
	adds r3, #0x1e
	str r3, [sp, #0x14]
	adds r6, r4, #0
	adds r6, #0x2e
	str r6, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x30
	str r1, [sp, #0x1c]
	movs r2, #0x70
	adds r2, r2, r4
	mov sl, r2
	adds r4, #0x74
	mov sb, r4
	ldr r3, _0804FB8C @ =gSineTable
	mov r8, r3
_0804FB5E:
	mov r6, sp
	adds r0, r6, r7
	ldrb r6, [r0]
	ldr r0, [sp, #0x10]
	adds r1, r0, r6
	movs r0, #1
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	adds r1, r2, r6
	movs r0, #0xff
	strb r0, [r1]
	cmp r7, #3
	bhi _0804FB90
	lsls r0, r7, #4
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r5, r0, #4
	b _0804FBA4
	.align 2, 0
_0804FB88: .4byte 0x000003FF
_0804FB8C: .4byte gSineTable
_0804FB90:
	subs r0, r7, #4
	lsls r1, r0, #4
	mov r3, ip
	subs r1, r3, r1
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x14
	lsrs r5, r1, #0x10
_0804FBA4:
	ldr r0, _0804FC0C @ =0x000003FF
	ands r4, r0
	lsls r2, r6, #2
	ldr r1, [sp, #0x18]
	adds r3, r1, r2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r5
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	ldr r3, [sp, #0x1c]
	adds r2, r3, r2
	lsls r0, r4, #1
	add r0, r8
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r2]
	lsls r1, r6, #3
	mov r6, sl
	adds r0, r6, r1
	ldr r2, [sp, #8]
	str r2, [r0]
	add r1, sb
	ldr r3, [sp, #0xc]
	str r3, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bls _0804FB5E
	movs r0, #0x81
	lsls r0, r0, #1
	bl m4aSongNumStart
_0804FBFC:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC0C: .4byte 0x000003FF

	thumb_func_start sub_804FC10
sub_804FC10: @ 0x0804FC10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x10]
	ldr r0, _0804FC88 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FC8C @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r6, #0
_0804FC34:
	mov r1, sp
	movs r4, #0
	movs r3, #0
	movs r2, #0
	mov r5, ip
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _0804FC4A
	strb r4, [r1]
	adds r1, #1
	movs r3, #1
_0804FC4A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bhi _0804FC6E
	mov r0, ip
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804FC4A
	strb r2, [r1]
	adds r1, #1
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #8
	bne _0804FC4A
_0804FC6E:
	cmp r3, #8
	bne _0804FC74
	movs r4, #1
_0804FC74:
	cmp r4, #0
	beq _0804FD40
	mov r0, sp
	ldrb r0, [r0, #7]
	cmp r0, #7
	bhi _0804FC90
	ldr r0, [sp, #0x10]
	adds r0, #0x28
	b _0804FC94
	.align 2, 0
_0804FC88: .4byte gCurTask
_0804FC8C: .4byte IWRAM_START + 0x654
_0804FC90:
	ldr r0, [sp, #0x10]
	subs r0, #0x28
_0804FC94:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0804FD50 @ =0x000003FF
	ands r2, r0
	movs r5, #0
	mov r0, ip
	adds r0, #0xe
	str r0, [sp, #0x1c]
	mov r1, ip
	adds r1, #0x1e
	str r1, [sp, #0x20]
	mov r3, ip
	adds r3, #0x2e
	str r3, [sp, #0x14]
	movs r0, #0x30
	add r0, ip
	mov sl, r0
	movs r1, #0x70
	add r1, ip
	mov sb, r1
	movs r3, #0x74
	add r3, ip
	mov r8, r3
	adds r6, #1
	str r6, [sp, #0x18]
	ldr r1, _0804FD54 @ =gSineTable
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r7, [r0, r3]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r6, [r0, r1]
_0804FCDE:
	mov r3, sp
	adds r0, r3, r5
	ldrb r2, [r0]
	ldr r0, [sp, #0x1c]
	adds r1, r0, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, [sp, #0x20]
	adds r1, r3, r2
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r5, #6
	lsls r3, r2, #2
	ldr r1, [sp, #0x14]
	adds r4, r1, r3
	movs r1, #0x80
	lsls r1, r1, #3
	subs r1, r1, r0
	adds r0, r7, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r4]
	add r3, sl
	adds r0, r6, #0
	muls r0, r1, r0
	asrs r0, r0, #0xe
	strh r0, [r3]
	lsls r2, r2, #3
	mov r3, sb
	adds r0, r3, r2
	ldr r1, [sp, #8]
	str r1, [r0]
	add r2, r8
	ldr r3, [sp, #0xc]
	str r3, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _0804FCDE
	ldr r5, [sp, #0x18]
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bhi _0804FD3A
	b _0804FC34
_0804FD3A:
	movs r0, #0x9c
	bl m4aSongNumStart
_0804FD40:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD50: .4byte 0x000003FF
_0804FD54: .4byte gSineTable

	thumb_func_start sub_804FD58
sub_804FD58: @ 0x0804FD58
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov r8, r1
	ldr r0, _0804FDF4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FDF8 @ =IWRAM_START + 0x654
	adds r1, r1, r0
	mov ip, r1
	movs r5, #0
	ldr r6, _0804FDFC @ =gSineTable
_0804FD74:
	mov r0, ip
	adds r0, #0xe
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804FE0C
	ldr r0, _0804FE00 @ =gUnknown_080D8EE0
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r2, r2, #5
	ldr r3, _0804FE04 @ =0x0000FFC0
	adds r2, r2, r3
	mov r7, ip
	ldrh r7, [r7, #0xc]
	adds r2, r2, r7
	lsls r2, r2, #0x16
	lsrs r2, r2, #0x16
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x1e
	adds r0, r0, r5
	movs r1, #0xff
	strb r1, [r0]
	lsls r4, r5, #2
	mov r3, ip
	adds r3, #0x2e
	adds r3, r3, r4
	adds r1, #1
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r7, #0
	ldrsh r1, [r0, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	mov r3, ip
	adds r3, #0x30
	adds r3, r3, r4
	lsls r2, r2, #1
	adds r2, r2, r6
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #6
	strh r0, [r3]
	lsls r1, r5, #3
	mov r0, ip
	adds r0, #0x70
	adds r0, r0, r1
	mov r2, sb
	str r2, [r0]
	mov r0, ip
	adds r0, #0x74
	adds r0, r0, r1
	mov r3, r8
	str r3, [r0]
	ldr r0, _0804FE08 @ =0x0000011F
	bl m4aSongNumStart
	b _0804FE16
	.align 2, 0
_0804FDF4: .4byte gCurTask
_0804FDF8: .4byte IWRAM_START + 0x654
_0804FDFC: .4byte gSineTable
_0804FE00: .4byte gUnknown_080D8EE0
_0804FE04: .4byte 0x0000FFC0
_0804FE08: .4byte 0x0000011F
_0804FE0C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0804FD74
_0804FE16:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_804FE24
sub_804FE24: @ 0x0804FE24
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804FED4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FED8 @ =IWRAM_START + 0x1C
	adds r6, r0, r1
	ldrh r0, [r5, #8]
	subs r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804FE9A
	ldr r0, _0804FEDC @ =sub_804FEFC
	str r0, [r5]
	movs r0, #0x65
	strh r0, [r5, #8]
	ldr r2, _0804FEE0 @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0804FEE4 @ =0x00196225
	muls r0, r1, r0
	ldr r3, _0804FEE8 @ =0x3C6EF35F
	adds r0, r0, r3
	str r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	bl Mod
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0804FEEC @ =gUnknown_080D89AC
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r5, #4]
	movs r1, #0x94
	lsls r1, r1, #1
	adds r4, r5, r1
	ldr r2, _0804FEF0 @ =gUnknown_080D89C8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	ldrb r2, [r1, #6]
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r5, r3
	strb r2, [r0]
	ldrb r0, [r1, #8]
	ldr r2, _0804FEF4 @ =0x0000014D
	adds r1, r5, r2
	strb r0, [r1]
	adds r3, #1
	adds r1, r5, r3
	movs r0, #0xff
	strb r0, [r1]
_0804FE9A:
	adds r4, r5, #0
	adds r4, #0xf0
	ldr r0, [r6, #0x24]
	asrs r0, r0, #8
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	ldr r2, _0804FEF8 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r6, #0x28]
	asrs r0, r0, #8
	ldrh r6, [r6, #0x22]
	adds r0, r0, r6
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	adds r0, r4, #0
	bl DisplaySprite
	adds r0, r5, #0
	bl sub_804F5BC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FED4: .4byte gCurTask
_0804FED8: .4byte IWRAM_START + 0x1C
_0804FEDC: .4byte sub_804FEFC
_0804FEE0: .4byte gPseudoRandom
_0804FEE4: .4byte 0x00196225
_0804FEE8: .4byte 0x3C6EF35F
_0804FEEC: .4byte gUnknown_080D89AC
_0804FEF0: .4byte gUnknown_080D89C8
_0804FEF4: .4byte 0x0000014D
_0804FEF8: .4byte gCamera

	thumb_func_start sub_804FEFC
sub_804FEFC: @ 0x0804FEFC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0804FF90 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _0804FF94 @ =IWRAM_START + 0x1C
	adds r4, r0, r1
	ldrh r0, [r7, #8]
	subs r0, #1
	strh r0, [r7, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804FF22
	ldr r0, _0804FF98 @ =sub_804FF9C
	str r0, [r7]
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #8]
_0804FF22:
	ldrh r0, [r7, #8]
	movs r1, #6
	bl Mod
	cmp r0, #0
	bne _0804FF80
	add r1, sp, #4
	mov r0, sp
	bl SuperSonicGetPos
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r6, [r4, #0x24]
	adds r6, r6, r0
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r5, [r4, #0x28]
	adds r5, r5, r0
	ldr r0, [sp, #4]
	subs r0, r0, r5
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	subs r1, r1, r6
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r7, #0xa]
	ldrh r1, [r7, #8]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #3
	adds r2, r1, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldrh r3, [r7, #0xa]
	ldr r4, [r7, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r4
_0804FF80:
	adds r0, r7, #0
	bl sub_804F5BC
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FF90: .4byte gCurTask
_0804FF94: .4byte IWRAM_START + 0x1C
_0804FF98: .4byte sub_804FF9C

	thumb_func_start sub_804FF9C
sub_804FF9C: @ 0x0804FF9C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0805001C @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050020 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldrh r0, [r4, #8]
	subs r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805000C
	adds r1, r4, #0
	adds r1, #0xf0
	ldr r0, _08050024 @ =0x000002CD
	strh r0, [r1, #0xa]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08050028 @ =0x00000111
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	add r1, sp, #4
	mov r0, sp
	bl SuperSonicGetPos
	movs r1, #0x20
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	ldr r2, [r5, #0x24]
	adds r2, r2, r0
	movs r1, #0x22
	ldrsh r0, [r5, r1]
	lsls r0, r0, #8
	ldr r1, [r5, #0x28]
	adds r1, r1, r0
	ldr r0, [sp, #4]
	subs r0, r0, r1
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [sp]
	subs r1, r1, r2
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0xc]
	ldr r0, _0805002C @ =sub_804FE24
	str r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #8]
_0805000C:
	adds r0, r4, #0
	bl sub_804F5BC
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805001C: .4byte gCurTask
_08050020: .4byte IWRAM_START + 0x1C
_08050024: .4byte 0x000002CD
_08050028: .4byte 0x00000111
_0805002C: .4byte sub_804FE24

	thumb_func_start sub_8050030
sub_8050030: @ 0x08050030
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	mov ip, r0
	adds r4, r6, #4
	movs r1, #0x3a
	adds r1, r1, r6
	mov r8, r1
	ldrh r3, [r6, #0x2e]
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r5, [r6, #0x30]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050062
	movs r1, #1
	mov sl, r1
_08050062:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r7, _080500FC @ =0x00000FFF
	ands r7, r5
	ands r2, r1
	ldrh r0, [r6, #0x2c]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _080500B0
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050080:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08050080
	adds r4, r2, #0
_080500B0:
	movs r5, #0
	lsls r7, r7, #0x10
_080500B4:
	lsls r0, r5, #3
	adds r0, r4, r0
	lsrs r1, r7, #0x10
	bl sub_80859F4
	mov r1, r8
	strh r0, [r1]
	movs r3, #2
	add r8, r3
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _080500B4
	ldrh r0, [r6, #0x2c]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x2c]
	ldrh r1, [r6, #0x2c]
	ldr r0, [r6, #0x30]
	adds r0, r0, r1
	ldr r1, _08050100 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x30]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080500FC: .4byte 0x00000FFF
_08050100: .4byte 0x00007FFF

	thumb_func_start sub_8050104
sub_8050104: @ 0x08050104
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	mov ip, r0
	adds r4, r6, #4
	adds r7, r6, #0
	adds r7, #0x20
	ldrh r1, [r6, #0x16]
	mov sb, r1
	movs r3, #0
	mov sl, r3
	ldr r5, [r6, #0x18]
	lsrs r2, r5, #0xc
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #7
	bls _08050134
	movs r0, #1
	mov sl, r0
_08050134:
	movs r1, #7
	movs r0, #7
	ands r3, r0
	ldr r0, _080501CC @ =0x00000FFF
	mov r8, r0
	ands r0, r5
	mov r8, r0
	ands r2, r1
	ldrh r0, [r6, #0x14]
	subs r0, r5, r0
	lsrs r0, r0, #0xc
	ands r0, r1
	cmp r2, r0
	beq _08050186
	movs r5, #0
	adds r2, r4, #0
	lsls r1, r3, #1
_08050156:
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	ldrh r0, [r4, #2]
	strh r0, [r4]
	adds r4, #2
	mov r3, ip
	adds r3, #4
	mov ip, r3
	subs r3, #4
	ldm r3!, {r0}
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050156
	adds r4, r2, #0
_08050186:
	movs r5, #0
_08050188:
	lsls r0, r5, #3
	adds r0, r4, r0
	mov r1, r8
	bl sub_8085968
	strh r0, [r7]
	adds r7, #2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bls _08050188
	ldrh r0, [r6, #0x14]
	mov r1, sb
	subs r0, r0, r1
	movs r1, #0xfa
	muls r0, r1, r0
	asrs r0, r0, #8
	add r0, sb
	strh r0, [r6, #0x14]
	ldrh r1, [r6, #0x14]
	ldr r0, [r6, #0x18]
	adds r0, r0, r1
	ldr r1, _080501D0 @ =0x00007FFF
	ands r0, r1
	str r0, [r6, #0x18]
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080501CC: .4byte 0x00000FFF
_080501D0: .4byte 0x00007FFF

	thumb_func_start sub_80501D4
sub_80501D4: @ 0x080501D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	mov r6, r8
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _08050298
	ldr r2, _08050248 @ =gStageFlags
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r1, r0
	strh r1, [r2]
	mov r3, r8
	ldrb r4, [r3, #0xf]
	cmp r4, #0
	bne _0805026C
	ldr r5, _0805024C @ =0x000007B4
	add r5, r8
	ldr r0, [r5, #4]
	bl VramFree
	movs r0, #0x2a
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _08050250 @ =0x00000317
	strh r0, [r5, #0xa]
	ldr r0, _08050254 @ =0x000007D4
	add r0, r8
	strb r1, [r0]
	ldr r1, _08050258 @ =0x000007D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _0805025C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050260 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08050264 @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050268 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	movs r0, #1
	mov r4, r8
	strb r0, [r4, #0xf]
	b _0805027A
	.align 2, 0
_08050248: .4byte gStageFlags
_0805024C: .4byte 0x000007B4
_08050250: .4byte 0x00000317
_08050254: .4byte 0x000007D4
_08050258: .4byte 0x000007D5
_0805025C: .4byte gDispCnt
_08050260: .4byte 0x00007FFF
_08050264: .4byte gWinRegs
_08050268: .4byte gBldRegs
_0805026C:
	mov r7, r8
	ldrb r0, [r7, #0xc]
	cmp r0, #0
	beq _0805027A
	ldr r0, _0805028C @ =0x0000FFDF
	ands r1, r0
	strh r1, [r2]
_0805027A:
	mov r0, r8
	ldrh r1, [r0, #0x10]
	ldr r0, _08050290 @ =0x0000FFFE
	ands r0, r1
	mov r1, r8
	strh r0, [r1, #0x10]
	ldr r3, _08050294 @ =gStageFlags
	b _080502A4
	.align 2, 0
_0805028C: .4byte 0x0000FFDF
_08050290: .4byte 0x0000FFFE
_08050294: .4byte gStageFlags
_08050298:
	ldr r0, _080502BC @ =gStageFlags
	ldrh r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	strh r1, [r0]
	adds r3, r0, #0
_080502A4:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080502C8
	ldr r2, _080502C0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080502C4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	b _080502D6
	.align 2, 0
_080502BC: .4byte gStageFlags
_080502C0: .4byte gDispCnt
_080502C4: .4byte 0x0000FBFF
_080502C8:
	ldr r0, _0805057C @ =gDispCnt
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r0]
_080502D6:
	ldrh r1, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080502EA
	b _0805056C
_080502EA:
	movs r7, #0x20
	ldrsh r0, [r6, r7]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r2, [sp, #0x10]
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8
	ldrh r3, [r2, #0x3a]
	adds r7, r0, r3
	ldr r1, _08050580 @ =0x000003FF
	adds r0, r1, #0
	ands r7, r0
	ldr r3, _08050584 @ =gSineTable
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r3, sl
	asrs r1, r3, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _08050590 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r0, _08050594 @ =0x000007C4
	add r0, r8
	str r5, [r0]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r0, [sp, #0x10]
	adds r0, #0x3a
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	adds r1, #0x42
	str r1, [sp, #0x24]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_08050392:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050392
	ldr r6, _08050584 @ =gSineTable
	ldr r0, _08050598 @ =gStageTime
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, _0805059C @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r3]
	mov r0, r8
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080503FA
	ldr r5, _080505A0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	mov r4, sp
	ldrh r4, [r4, #0x18]
	strh r4, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080503FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _080505A4 @ =0xFFFFFF00
	adds r1, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805042A:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _08050584 @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _08050588 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x1c]
	ldr r1, _08050584 @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080505AC @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805042A
	ldr r1, _08050584 @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080505B0 @ =0x000008BC
	add r5, r8
	ldr r6, _080505B4 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x24]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050580 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _0805058C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080505AC @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
_0805056C:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805057C: .4byte gDispCnt
_08050580: .4byte 0x000003FF
_08050584: .4byte gSineTable
_08050588: .4byte gUnknown_080D89A5
_0805058C: .4byte gCamera
_08050590: .4byte gBgAffineRegs
_08050594: .4byte 0x000007C4
_08050598: .4byte gStageTime
_0805059C: .4byte 0x000001FF
_080505A0: .4byte 0x000007B4
_080505A4: .4byte 0xFFFFFF00
_080505A8: .4byte 0x00002060
_080505AC: .4byte gUnknown_030054B8
_080505B0: .4byte 0x000008BC
_080505B4: .4byte 0x000008F4

	thumb_func_start sub_80505B8
sub_80505B8: @ 0x080505B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r8, r0
	mov r6, r8
	adds r6, #0x1c
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r4, [r0]
	cmp r4, #0
	bne _08050606
	movs r5, #0xf7
	lsls r5, r5, #3
	add r5, r8
	ldr r0, [r5]
	cmp r0, #0
	beq _080505FC
	bl VramFree
	str r4, [r5]
	ldr r2, _08050884 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050888 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0805088C @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050890 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
_080505FC:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	ldr r0, _08050894 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0x10]
_08050606:
	movs r3, #0x20
	ldrsh r0, [r6, r3]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r4, #0x22
	ldrsh r0, [r6, r4]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r7, [sp, #0x10]
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r7, r0, r1
	ldr r2, _08050898 @ =0x000003FF
	adds r0, r2, #0
	ands r7, r0
	ldr r4, _0805089C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r7, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080508A0 @ =gUnknown_080D89A5
	ldrb r3, [r0]
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r3, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r3, _080508A4 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r4, sl
	asrs r1, r4, #8
	ldr r0, [r3, #4]
	subs r6, r1, r0
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _080508A8 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r2, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r1, _080508AC @ =0x000007C4
	add r1, r8
	movs r0, #0
	str r0, [r1]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r2, [sp, #0x10]
	adds r2, #0x3a
	str r2, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	adds r0, #0x42
	str r0, [sp, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_080506AE:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080506AE
	ldrb r2, [r3]
	mov r0, r8
	movs r1, #0xff
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080506FA
	ldr r5, _080508B0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	strh r6, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080506FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0805089C @ =gSineTable
	ldr r4, _080508B4 @ =0xFFFFFF00
	adds r1, r7, r4
	ldr r0, _08050898 @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805072C:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x1c]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050898 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _0805089C @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _080508A0 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x18]
	ldr r1, _0805089C @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080508B8 @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805072C
	ldr r1, _0805089C @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080508A0 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080508BC @ =0x000008BC
	add r5, r8
	ldr r6, _080508C0 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x20]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050898 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080508B8 @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050884: .4byte gDispCnt
_08050888: .4byte 0x00007FFF
_0805088C: .4byte gWinRegs
_08050890: .4byte gBldRegs
_08050894: .4byte 0x0000FFFE
_08050898: .4byte 0x000003FF
_0805089C: .4byte gSineTable
_080508A0: .4byte gUnknown_080D89A5
_080508A4: .4byte gCamera
_080508A8: .4byte gBgAffineRegs
_080508AC: .4byte 0x000007C4
_080508B0: .4byte 0x000007B4
_080508B4: .4byte 0xFFFFFF00
_080508B8: .4byte gUnknown_030054B8
_080508BC: .4byte 0x000008BC
_080508C0: .4byte 0x000008F4

	thumb_func_start sub_80508C4
sub_80508C4: @ 0x080508C4
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _08050938
	ldr r2, _08050940 @ =gDispCnt
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08050944 @ =gWinRegs
	ldr r0, _08050948 @ =0x00003735
	strh r0, [r1, #0xa]
	ldr r3, _0805094C @ =gBldRegs
	ldr r0, _08050950 @ =0x00001346
	strh r0, [r3]
	lsls r1, r4, #1
	adds r1, r1, r4
	asrs r1, r1, #8
	adds r1, #0xa
	movs r2, #0xf
	ands r1, r2
	lsls r0, r4, #2
	adds r0, r0, r4
	asrs r0, r0, #8
	adds r0, #8
	ands r0, r2
	lsls r1, r1, #8
	orrs r1, r0
	strh r1, [r3, #2]
	strh r1, [r3, #4]
	ldr r0, _08050954 @ =0x000007B4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2, #0x10]
	movs r3, #0
	movs r4, #0xfe
	lsls r4, r4, #3
_0805091E:
	lsls r0, r3, #4
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r2, r5, r0
	ldr r0, [r2, #0x10]
	orrs r0, r1
	str r0, [r2, #0x10]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0805091E
_08050938:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050940: .4byte gDispCnt
_08050944: .4byte gWinRegs
_08050948: .4byte 0x00003735
_0805094C: .4byte gBldRegs
_08050950: .4byte 0x00001346
_08050954: .4byte 0x000007B4

	thumb_func_start sub_8050958
sub_8050958: @ 0x08050958
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08050A5C
	subs r0, #1
	strb r0, [r1, #0xd]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080509B0
	movs r5, #0
	ldr r0, _080509A0 @ =gFlags
	mov sl, r0
	ldr r6, _080509A4 @ =gObjPalette
	ldr r4, _080509A8 @ =gUnknown_080D8EF0+0x20
	ldr r3, _080509AC @ =gBgPalette
_08050980:
	adds r1, r5, #0
	adds r1, #0x80
	lsls r1, r1, #1
	adds r1, r1, r6
	lsls r2, r5, #1
	adds r0, r2, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, r2, r3
	strh r0, [r2]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050980
	b _08050A4C
	.align 2, 0
_080509A0: .4byte gFlags
_080509A4: .4byte gObjPalette
_080509A8: .4byte gUnknown_080D8EF0+0x20
_080509AC: .4byte gBgPalette
_080509B0:
	ldr r0, _080509F8 @ =gStageTime
	ldr r0, [r0]
	lsrs r6, r0, #1
	movs r0, #0xf
	ands r6, r0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _08050A0C
	movs r5, #0
	ldr r1, _080509FC @ =gFlags
	mov sl, r1
	ldr r0, _08050A00 @ =gObjPalette
	mov ip, r0
	movs r7, #0xf
	ldr r4, _08050A04 @ =gUnknown_080D8EF0
	ldr r3, _08050A08 @ =gBgPalette
_080509D0:
	adds r1, r5, r6
	ands r1, r7
	adds r2, r1, #0
	adds r2, #0x80
	lsls r2, r2, #1
	add r2, ip
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsrs r0, r0, #5
	strh r0, [r2]
	lsls r1, r1, #1
	adds r1, r1, r3
	strh r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _080509D0
	b _08050A4C
	.align 2, 0
_080509F8: .4byte gStageTime
_080509FC: .4byte gFlags
_08050A00: .4byte gObjPalette
_08050A04: .4byte gUnknown_080D8EF0
_08050A08: .4byte gBgPalette
_08050A0C:
	movs r5, #0
	ldr r1, _08050A6C @ =gFlags
	mov sl, r1
	ldr r0, _08050A70 @ =gObjPalette
	mov sb, r0
	ldr r1, _08050A74 @ =gUnknown_080D8EF0
	mov r8, r1
	ldr r0, _08050A78 @ =gBgPalette
	mov ip, r0
	movs r7, #0xf
_08050A20:
	adds r3, r5, r6
	ands r3, r7
	adds r4, r3, #0
	adds r4, #0x80
	lsls r4, r4, #1
	add r4, sb
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r2, r1, #5
	lsrs r0, r1, #5
	orrs r2, r0
	orrs r2, r1
	strh r2, [r4]
	lsls r3, r3, #1
	add r3, ip
	strh r2, [r3]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _08050A20
_08050A4C:
	mov r1, sl
	ldr r0, [r1]
	movs r1, #2
	orrs r0, r1
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	str r0, [r1]
_08050A5C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A6C: .4byte gFlags
_08050A70: .4byte gObjPalette
_08050A74: .4byte gUnknown_080D8EF0
_08050A78: .4byte gBgPalette

	thumb_func_start TaskDestructor_TrueArea53BossGfx
TaskDestructor_TrueArea53BossGfx: @ 0x08050A7C
	push {r4, r5, r6, r7, lr}
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r1, _08050B1C @ =IWRAM_START + 0x7B8
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08050A94
	bl VramFree
_08050A94:
	movs r4, #0
	ldr r0, _08050B20 @ =IWRAM_START + 0xCC
	adds r7, r5, r0
	ldr r1, _08050B24 @ =gIntrMainBuf + 4
	adds r5, r5, r1
_08050A9E:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050A9E
	movs r4, #0
_08050AB8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r7, r0
	ldr r0, [r0]
	bl VramFree
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08050AB8
	movs r1, #0xa6
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xad
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xc5
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r6, r1
	ldr r0, [r0]
	bl VramFree
	ldr r1, _08050B28 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050B1C: .4byte IWRAM_START + 0x7B8
_08050B20: .4byte IWRAM_START + 0xCC
_08050B24: .4byte gIntrMainBuf + 4
_08050B28: .4byte gActiveBossTask

	thumb_func_start sub_8050B2C
sub_8050B2C: @ 0x08050B2C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _08050B40 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	bne _08050B44
	str r0, [r6]
	str r0, [r7]
	b _08050BA2
	.align 2, 0
_08050B40: .4byte gActiveBossTask
_08050B44:
	ldrh r1, [r0, #6]
	ldr r0, _08050BA8 @ =IWRAM_START + 0x1C
	adds r1, r1, r0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	lsls r0, r0, #8
	ldr r3, [r1, #0x24]
	adds r3, r3, r0
	movs r5, #0x22
	ldrsh r0, [r1, r5]
	lsls r0, r0, #8
	ldr r2, [r1, #0x28]
	adds r2, r2, r0
	ldr r4, _08050BAC @ =gSineTable
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r0, r4, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	lsls r0, r1, #3
	adds r0, r0, r1
	asrs r0, r0, #6
	adds r2, r2, r0
	movs r5, #0x26
	adds r0, r1, #0
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	muls r0, r5, r0
	asrs r0, r0, #6
	adds r2, r2, r0
	str r3, [r6]
	str r2, [r7]
_08050BA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050BA8: .4byte IWRAM_START + 0x1C
_08050BAC: .4byte gSineTable

	thumb_func_start ExtraBossIsDead
ExtraBossIsDead: @ 0x08050BB0
	push {lr}
	movs r2, #0
	ldr r0, _08050BD4 @ =gActiveBossTask
	ldr r0, [r0]
	cmp r0, #0
	beq _08050BCC
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08050BCC
	movs r2, #1
_08050BCC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08050BD4: .4byte gActiveBossTask

	thumb_func_start sub_8050BD8
sub_8050BD8: @ 0x08050BD8
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BE4
sub_8050BE4: @ 0x08050BE4
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BF0
sub_8050BF0: @ 0x08050BF0
	push {lr}
	bl sub_8050104
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8050BFC
sub_8050BFC: @ 0x08050BFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8050030
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08050C20
	ldr r0, [r4, #0x30]
	ldr r1, _08050C44 @ =0x00000FFF
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r1, _08050C48 @ =gUnknown_080D8D6C
	ldr r0, [r1, #0x24]
	str r0, [r4]
	ldr r0, [r1, #0x28]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #0x2c]
	strh r0, [r4, #0x2e]
_08050C20:
	ldr r1, [r4, #0x30]
	ldr r0, _08050C4C @ =0x00001FFF
	cmp r1, r0
	bls _08050C3C
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, [r4, #0x48]
	subs r1, #0x57
	str r1, [r4, #0x48]
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x44]
_08050C3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C44: .4byte 0x00000FFF
_08050C48: .4byte gUnknown_080D8D6C
_08050C4C: .4byte 0x00001FFF

	thumb_func_start sub_8050C50
sub_8050C50: @ 0x08050C50
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08050CA8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CAC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	adds r1, #0x57
	str r1, [r4, #0x48]
	cmp r1, #0
	bne _08050CA2
	ldr r2, _08050CB0 @ =0x00000FFF
	str r1, [r4, #0x30]
	ldr r1, _08050CB4 @ =gUnknown_080D8D6C
	ldr r0, [r1]
	str r0, [r4]
	ldr r0, [r1, #4]
	str r0, [r4, #0x34]
	ldrh r0, [r1, #8]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r1, _08050CB8 @ =gUnknown_080D8DCC
	ldr r0, [r1]
	str r0, [r5]
	ldr r0, [r1, #4]
	str r0, [r5, #0x1c]
	ldrh r0, [r1, #8]
	strh r0, [r5, #0x16]
	movs r0, #0x88
	lsls r0, r0, #1
	bl m4aSongNumStop
_08050CA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050CA8: .4byte gCurTask
_08050CAC: .4byte IWRAM_START + 0x1C
_08050CB0: .4byte 0x00000FFF
_08050CB4: .4byte gUnknown_080D8D6C
_08050CB8: .4byte gUnknown_080D8DCC

	thumb_func_start sub_8050CBC
sub_8050CBC: @ 0x08050CBC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050CE8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050CEC @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050CF0 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08050CF4
	ldr r0, [r5, #0x24]
	subs r0, #0xc0
	str r0, [r5, #0x24]
	b _08050D12
	.align 2, 0
_08050CE8: .4byte gCurTask
_08050CEC: .4byte IWRAM_START + 0x1C
_08050CF0: .4byte IWRAM_START + 0x558
_08050CF4:
	cmp r0, #3
	bne _08050D12
	ldr r0, _08050D18 @ =0x00000FFF
	ands r1, r0
	str r1, [r4, #0x30]
	ldr r0, _08050D1C @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x48]
	str r1, [r4]
	ldr r1, [r0, #0x4c]
	str r1, [r4, #0x34]
	adds r0, #0x50
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, _08050D20 @ =sub_804F108
	str r0, [r6]
_08050D12:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D18: .4byte 0x00000FFF
_08050D1C: .4byte gUnknown_080D8D6C
_08050D20: .4byte sub_804F108

	thumb_func_start sub_8050D24
sub_8050D24: @ 0x08050D24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08050D80 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _08050D84 @ =IWRAM_START + 0x1C
	adds r5, r0, r1
	ldr r1, _08050D88 @ =IWRAM_START + 0x558
	adds r6, r0, r1
	adds r0, r4, #0
	bl sub_8050030
	ldr r1, [r4, #0x30]
	lsrs r0, r1, #0xc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08050D78
	ldr r2, _08050D8C @ =0x00000FFF
	ands r1, r2
	str r1, [r4, #0x30]
	ldr r0, _08050D90 @ =gUnknown_080D8D6C
	ldr r1, [r0, #0x54]
	str r1, [r4]
	ldr r1, [r0, #0x58]
	str r1, [r4, #0x34]
	adds r0, #0x5c
	ldrh r0, [r0]
	strh r0, [r4, #0x2e]
	ldr r0, [r5, #0x18]
	ands r0, r2
	str r0, [r5, #0x18]
	ldr r0, _08050D94 @ =gUnknown_080D8DCC
	ldr r1, [r0, #0x3c]
	str r1, [r5]
	ldr r1, [r0, #0x40]
	str r1, [r5, #0x1c]
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	ldr r0, _08050D98 @ =sub_8050DC8
	str r0, [r6]
_08050D78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050D80: .4byte gCurTask
_08050D84: .4byte IWRAM_START + 0x1C
_08050D88: .4byte IWRAM_START + 0x558
_08050D8C: .4byte 0x00000FFF
_08050D90: .4byte gUnknown_080D8D6C
_08050D94: .4byte gUnknown_080D8DCC
_08050D98: .4byte sub_8050DC8

	thumb_func_start sub_8050D9C
sub_8050D9C: @ 0x08050D9C
	push {lr}
	ldr r1, _08050DBC @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	ldr r1, _08050DC0 @ =IWRAM_START + 0x1C
	adds r2, r2, r1
	ldr r1, [r2, #0x24]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r2, #0x24]
	bl sub_8050030
	pop {r0}
	bx r0
	.align 2, 0
_08050DBC: .4byte gCurTask
_08050DC0: .4byte IWRAM_START + 0x1C

	thumb_func_start sub_8050DC4
sub_8050DC4: @ 0x08050DC4
	bx lr
	.align 2, 0

	thumb_func_start sub_8050DC8
sub_8050DC8: @ 0x08050DC8
	adds r3, r0, #0
	movs r0, #0x3c
	str r0, [r3, #8]
	movs r1, #0
	movs r0, #0xb4
	strh r0, [r3, #6]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r0, _08050DF4 @ =0x000002CE
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2, #0x10]
	bx lr
	.align 2, 0
_08050DF4: .4byte 0x000002CE

	thumb_func_start sub_8050DF8
sub_8050DF8: @ 0x08050DF8
	push {lr}
	bl sub_804F5BC
	pop {r0}
	bx r0
	.align 2, 0
