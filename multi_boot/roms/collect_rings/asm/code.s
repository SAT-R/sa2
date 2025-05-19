.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	arm_func_start sub_0200028C
sub_0200028C: @ 0x0200028C
	push {r4, r5, r6, r7, r8, sb, sl, fp}
	mov ip, #0x4000000
	ldr fp, _020002C8 @ =gUnknown_03000540
	add sl, fp, #0x40
	mov sb, #1
	mov r8, #0
	strb r8, [ip, #0x208]
	ldm sl, {r0, r1, r2, r3, r4, r5, r6, r7}
	stm sl!, {r4, r5, r6, r7}
	stm sl!, {r0, r1, r2, r3}
	ldr r0, [fp, #4]
	str r8, [fp, #4]
	strb sb, [ip, #0x208]
	pop {r4, r5, r6, r7, r8, sb, sl, fp}
	bx lr
	.align 2, 0
_020002C8: .4byte gUnknown_03000540

	arm_func_start sub_020002CC
sub_020002CC: @ 0x020002CC
	mov ip, #0x4000000
	add ip, ip, #0x120
	ldm ip, {r0, r1}
	push {r7, r8, sb, sl, fp}
	ldr fp, _020003E4 @ =gUnknown_03000540
	mov sb, #0xfe
	add sb, sb, #0xfe00
	ldrh r3, [ip, #8]
	and r3, r3, #0x40
	strb r3, [fp, #9]
	ldr sl, [fp, #0x14]
	adds r3, sl, #1
	blt _02000328
	bne _0200031C
	strh sb, [ip, #0xa]
	add r8, fp, #0x28
	ldm r8, {r2, r3}
	mov r7, r2
	stm r8, {r3, r7}
	b _02000328
_0200031C:
	ldr r3, [fp, #0x2c]
	ldr r2, [r3, sl, lsl #1]
	strh r2, [ip, #0xa]
_02000328:
	cmp sl, #0xd
	addlt sl, sl, #1
	strlt sl, [fp, #0x14]
	push {r0, r1, r5, r6}
	mov r6, #3
_0200033C:
	add r8, fp, #0x18
	add r8, r8, r6, lsl #2
	ldr sl, [r8]
	lsl r3, r6, #1
	ldrh r5, [sp, r3]
	cmp r5, sb
	bne _0200036C
	cmp sl, #0xb
	ble _0200036C
	mov r0, #1
	sub sl, r0, #2
	b _02000398
_0200036C:
	ldr r0, [r8, #0x18]
	lsl r3, sl, #1
	strh r5, [r0, r3]
	cmp sl, #0xb
	bne _02000398
	ldr r1, [r8, #0x28]
	str r0, [r8, #0x28]
	str r1, [r8, #0x18]
	add r3, fp, #4
	mov r0, #1
	strb r0, [r3, r6]
_02000398:
	cmp sl, #0xd
	addlt sl, sl, #1
	str sl, [r8]
	subs r6, r6, #1
	bge _0200033C
	ldrb r0, [fp]
	cmp r0, #0
	beq _020003D8
	ldr r7, _020003E8 @ =0x0400010E
	mov r0, #0
	strh r0, [r7]
	ldrh r0, [ip, #8]
	orr r0, r0, #0x80
	strh r0, [ip, #8]
	mov r0, #0xc0
	strh r0, [r7]
_020003D8:
	add sp, sp, #8
	pop {r5, r6, r7, r8, sb, sl, fp}
	bx lr
	.align 2, 0
_020003E4: .4byte gUnknown_03000540
_020003E8: .4byte 0x0400010E

	thumb_func_start sub_020003EC
sub_020003EC: @ 0x020003EC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, _020004AC @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _020004B0 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _020004B4 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _020004B8 @ =0x04000134
	strh r4, [r0]
	subs r2, #0xd8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2]
	ldrh r0, [r2]
	ldr r3, _020004BC @ =0x00004003
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [sp]
	ldr r4, _020004C0 @ =gUnknown_03000540
	ldr r2, _020004C4 @ =0x0500007A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _020004C8 @ =sub_0200028C
	ldr r1, _020004CC @ =gUnknown_03000730
	ldr r2, _020004D0 @ =0x04000010
	bl CpuSet
	ldr r0, _020004D4 @ =sub_020002CC
	ldr r1, _020004D8 @ =gUnknown_03000420
	ldr r2, _020004DC @ =0x04000048
	bl CpuSet
	strb r5, [r4, #2]
	movs r0, #0xd
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x60
	str r0, [r4, #0x28]
	adds r0, #0x1c
	str r0, [r4, #0x2c]
	movs r3, #0
	adds r2, r4, #0
	movs r0, #0x30
	adds r0, r0, r2
	mov ip, r0
	adds r6, r2, #0
	adds r6, #0xd0
	adds r7, r2, #0
	adds r7, #0x40
	adds r5, r2, #0
	adds r5, #0x98
	movs r4, #0
_02000468:
	lsls r0, r3, #2
	mov r1, ip
	adds r1, #4
	mov ip, r1
	subs r1, #4
	stm r1!, {r5}
	adds r1, r2, #0
	adds r1, #0xb4
	adds r1, r4, r1
	stm r7!, {r1}
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r0, r1
	str r6, [r0]
	adds r6, #0x54
	adds r5, #0x54
	adds r4, #0x54
	adds r3, #1
	cmp r3, #3
	ble _02000468
	ldr r3, _020004AC @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _020004B0 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020004AC: .4byte 0x04000208
_020004B0: .4byte 0x04000200
_020004B4: .4byte 0x0000FF3F
_020004B8: .4byte 0x04000134
_020004BC: .4byte 0x00004003
_020004C0: .4byte gUnknown_03000540
_020004C4: .4byte 0x0500007A
_020004C8: .4byte sub_0200028C
_020004CC: .4byte gUnknown_03000730
_020004D0: .4byte 0x04000010
_020004D4: .4byte sub_020002CC
_020004D8: .4byte gUnknown_03000420
_020004DC: .4byte 0x04000048

	thumb_func_start sub_020004E0
sub_020004E0: @ 0x020004E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov ip, r1
	mov r8, r2
	ldr r5, _02000500 @ =0x04000128
	ldr r6, [r5]
	ldr r7, _02000504 @ =gUnknown_03000540
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _02000508
	cmp r0, #1
	beq _02000570
	b _0200057E
	.align 2, 0
_02000500: .4byte 0x04000128
_02000504: .4byte gUnknown_03000540
_02000508:
	movs r1, #0x30
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0200056A
	movs r0, #0x88
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #8
	bne _0200057E
	movs r1, #4
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0200056A
	ldr r0, [r7, #0x14]
	cmp r0, #0xd
	bne _0200056A
	ldr r3, _020005B0 @ =0x04000208
	strh r1, [r3]
	ldr r2, _020005B4 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _020005B8 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldrb r1, [r5, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r1, _020005BC @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #0xf6
	ldr r0, _020005C0 @ =0x0000BBBC
	str r0, [r1]
	strb r4, [r7]
	ldrb r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5]
_0200056A:
	ldr r1, _020005C4 @ =gUnknown_03000540
	movs r0, #1
	strb r0, [r1, #1]
_02000570:
	mov r0, ip
	bl sub_020006C8
	mov r0, sb
	mov r1, r8
	bl sub_020005F8
_0200057E:
	ldr r1, _020005C4 @ =gUnknown_03000540
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	ldrb r3, [r1, #3]
	ldrb r2, [r1, #8]
	movs r0, #0x10
	ands r0, r2
	orrs r3, r0
	movs r0, #0x20
	ands r0, r2
	orrs r3, r0
	movs r0, #0x40
	ands r0, r2
	orrs r3, r0
	ldrb r0, [r1, #2]
	lsls r2, r0, #8
	ldrb r0, [r1]
	cmp r0, #8
	bne _020005C8
	movs r0, #0x80
	orrs r0, r2
	orrs r0, r3
	b _020005CC
	.align 2, 0
_020005B0: .4byte 0x04000208
_020005B4: .4byte 0x04000200
_020005B8: .4byte 0x0000FF7F
_020005BC: .4byte 0x04000202
_020005C0: .4byte 0x0000BBBC
_020005C4: .4byte gUnknown_03000540
_020005C8:
	adds r0, r3, #0
	orrs r0, r2
_020005CC:
	adds r2, r0, #0
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _020005DA
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
_020005DA:
	adds r1, r2, #0
	lsls r0, r6, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #3
	bls _020005EA
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_020005EA:
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_020005F8
sub_020005F8: @ 0x020005F8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _020006B8 @ =gUnknown_03000540
	ldr r4, [r5, #0x28]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #4
	ldrb r3, [r4, #1]
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r1
	strb r2, [r4, #1]
	ldr r6, [r5, #0x28]
	ldr r1, _020006BC @ =gUnknown_03000770
	ldrb r1, [r1, #3]
	movs r3, #1
	adds r2, r3, #0
	ands r2, r1
	lsls r2, r2, #5
	ldrb r4, [r6, #1]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r2
	strb r1, [r6, #1]
	ldr r4, [r5, #0x28]
	ldrb r1, [r5, #8]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldrb r2, [r4, #1]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r3
	strb r1, [r4, #1]
	ldr r2, [r5, #0x28]
	ldrb r1, [r5, #0xb]
	strb r1, [r2]
	ldr r4, [r5, #0x28]
	ldrb r2, [r5, #2]
	ldrb r1, [r5, #3]
	eors r2, r1
	movs r1, #0xf
	ands r2, r1
	ldrb r3, [r4, #1]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r4, #1]
	ldr r1, [r5, #0x28]
	strh r7, [r1, #2]
	ldr r1, [r5, #0x28]
	adds r1, #4
	ldr r2, _020006C0 @ =0x04000005
	bl CpuSet
	movs r2, #0
	ldr r1, [r5, #0x28]
_02000674:
	ldrh r0, [r1]
	adds r7, r7, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _02000674
	adds r2, r5, #0
	ldr r1, [r2, #0x28]
	mvns r0, r7
	strh r0, [r1, #2]
	ldrb r0, [r2]
	cmp r0, #0
	beq _02000694
	ldr r1, _020006C4 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
_02000694:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x14]
	ldrb r0, [r5]
	cmp r0, #0
	beq _020006B0
	ldrb r1, [r5, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020006B0
	ldr r1, _020006C4 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_020006B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020006B8: .4byte gUnknown_03000540
_020006BC: .4byte gUnknown_03000770
_020006C0: .4byte 0x04000005
_020006C4: .4byte 0x0400010E

	thumb_func_start sub_020006C8
sub_020006C8: @ 0x020006C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, _020007D4 @ =gUnknown_03000730
	movs r4, #0
	str r4, [sp]
	bl sub_02014CC8
	str r0, [sp, #4]
	ldr r0, _020007D8 @ =gUnknown_03000540
	strb r4, [r0, #3]
	add r1, sp, #4
	mov sl, r1
	add r2, sp, #8
	mov sb, r2
	adds r5, r0, #0
	adds r6, r5, #0
	movs r7, #0x50
	adds r7, r7, r6
	mov r8, r7
_020006F8:
	movs r3, #0
	movs r2, #0
	lsls r5, r4, #2
	adds r0, r4, #1
	str r0, [sp, #0x10]
	mov r1, r8
	adds r0, r5, r1
	ldr r1, [r0]
_02000708:
	ldrh r0, [r1]
	adds r3, r3, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _02000708
	mov r2, sl
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200076A
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, r7
	bne _0200076A
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6, #3]
	orrs r0, r1
	strb r0, [r6, #3]
	ldrb r2, [r6, #8]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	mov r0, r8
	adds r3, r5, r0
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	lsls r0, r4
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	subs r7, #0xf
	adds r1, r7, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r6, #8]
	ldr r0, [r3]
	adds r0, #4
	adds r1, r5, r4
	lsls r1, r1, #2
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	ldr r2, _020007DC @ =0x04000005
	bl CpuSet
_0200076A:
	movs r0, #0
	str r0, [sp, #8]
	mov r7, r8
	adds r0, r5, r7
	ldr r1, [r0]
	adds r1, #4
	mov r0, sb
	ldr r2, _020007E0 @ =0x05000005
	bl CpuSet
	ldr r4, [sp, #0x10]
	cmp r4, #3
	ble _020006F8
	ldr r0, _020007D8 @ =gUnknown_03000540
	ldrb r1, [r0, #2]
	ldrb r2, [r0, #3]
	adds r3, r1, #0
	orrs r3, r2
	strb r3, [r0, #2]
	movs r1, #1
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _02000820
	ldrb r0, [r5]
	cmp r0, #8
	bne _020007E4
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	beq _020007B8
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	bne _020007B8
	ldrb r0, [r5, #8]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #8]
_020007B8:
	ldrb r4, [r5, #8]
	lsls r2, r4, #0x1c
	lsrs r2, r2, #0x1c
	movs r0, #0xe
	ldrb r3, [r5, #2]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _02000804
	movs r0, #0x40
	orrs r0, r4
	b _02000802
	.align 2, 0
_020007D4: .4byte gUnknown_03000730
_020007D8: .4byte gUnknown_03000540
_020007DC: .4byte 0x04000005
_020007E0: .4byte 0x05000005
_020007E4:
	ldrb r2, [r5, #8]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1f
	ldr r0, [r5, #0x50]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	orrs r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
_02000802:
	strb r0, [r5, #8]
_02000804:
	ldrb r2, [r5, #8]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1f
	ldr r0, [r5, #0x50]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	orrs r0, r1
	lsls r0, r0, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #8]
_02000820:
	ldrb r0, [r5, #3]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02000834
sub_02000834: @ 0x02000834
	push {lr}
	ldr r2, _0200084C @ =gUnknown_03000540
	ldrb r0, [r2]
	cmp r0, #0
	beq _02000846
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
_02000846:
	pop {r0}
	bx r0
	.align 2, 0
_0200084C: .4byte gUnknown_03000540

	thumb_func_start sub_02000850
sub_02000850: @ 0x02000850
	ldr r3, _02000884 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _02000888 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0200088C @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _02000890 @ =0x04000128
	ldr r2, _02000894 @ =0x00002003
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x1c
	ldr r0, _02000898 @ =0x0000BBBC
	str r0, [r1]
	adds r1, #0xf6
	movs r0, #0xc0
	strh r0, [r1]
	ldr r2, _0200089C @ =gUnknown_03000540
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	bx lr
	.align 2, 0
_02000884: .4byte 0x04000208
_02000888: .4byte 0x04000200
_0200088C: .4byte 0x0000FF3F
_02000890: .4byte 0x04000128
_02000894: .4byte 0x00002003
_02000898: .4byte 0x0000BBBC
_0200089C: .4byte gUnknown_03000540

	thumb_func_start sub_020008A0
sub_020008A0: @ 0x020008A0
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _020008BC @ =gUnknown_03000770
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #4
	bls _020008B0
	b _02000A76
_020008B0:
	lsls r0, r1, #2
	ldr r1, _020008C0 @ =_020008C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_020008BC: .4byte gUnknown_03000770
_020008C0: .4byte _020008C4
_020008C4: @ jump table
	.4byte _020008D8 @ case 0
	.4byte _020008F0 @ case 1
	.4byte _0200098C @ case 2
	.4byte _020009FE @ case 3
	.4byte _02000A6C @ case 4
_020008D8:
	ldr r0, [r5]
	ldr r1, _020008EC @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	bne _020008E4
	b _02000A76
_020008E4:
	movs r0, #1
	strb r0, [r5, #1]
	b _02000A76
	.align 2, 0
_020008EC: .4byte 0x00FF00FF
_020008F0:
	ldrb r0, [r5]
	cmp r0, #1
	bne _02000900
	ldrb r0, [r5, #2]
	cmp r0, #5
	bhi _020008FE
	b _02000A76
_020008FE:
	b _0200090A
_02000900:
	ldr r1, _02000940 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
_0200090A:
	ldr r0, _02000944 @ =0x04000120
	movs r6, #0
	str r6, [r0]
	ldr r1, _02000948 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	ldrb r4, [r5]
	cmp r4, #1
	bne _02000958
	ldr r2, _02000940 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0200094C @ =0x0400010C
	ldr r0, _02000950 @ =0x00C0F318
	str r0, [r1]
	ldr r3, _02000954 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r3]
	b _02000978
	.align 2, 0
_02000940: .4byte 0x04000128
_02000944: .4byte 0x04000120
_02000948: .4byte 0x04000202
_0200094C: .4byte 0x0400010C
_02000950: .4byte 0x00C0F318
_02000954: .4byte 0x04000208
_02000958:
	ldr r2, _02000984 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x81
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _02000988 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
_02000978:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #2
	strb r0, [r5, #1]
	b _02000A76
	.align 2, 0
_02000984: .4byte 0x04000128
_02000988: .4byte 0x04000208
_0200098C:
	ldr r6, [r5, #8]
	adds r4, r6, #0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0200099C
	adds r4, r0, #0
	b _020009A2
_0200099C:
	cmp r6, #0
	bge _020009A2
	movs r4, #0
_020009A2:
	cmp r2, #0
	beq _020009A8
	str r4, [r2]
_020009A8:
	ldrb r0, [r5]
	cmp r0, #1
	beq _020009EA
	ldr r0, [r5, #0x14]
	cmp r0, r4
	bge _020009CE
	adds r3, r5, #0
	ldr r7, [r5, #4]
_020009B8:
	ldr r2, [r3, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r7
	ldr r1, [r3, #0x10]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r3, #0x10]
	adds r2, #1
	str r2, [r3, #0x14]
	cmp r2, r4
	blt _020009B8
_020009CE:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _020009F2
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _020009EA
	movs r0, #1
	strb r0, [r5, #3]
_020009EA:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	bgt _020009F8
_020009F2:
	ldrb r0, [r5, #2]
	cmp r0, #0x8c
	bne _02000A76
_020009F8:
	movs r0, #3
	strb r0, [r5, #1]
	b _02000A76
_020009FE:
	ldr r3, _02000A50 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _02000A54 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _02000A58 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _02000A5C @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	adds r0, #3
	str r0, [r1]
	ldr r2, _02000A60 @ =0x04000120
	movs r0, #0
	movs r1, #0
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r5]
	cmp r0, #0
	beq _02000A3C
	ldr r1, _02000A64 @ =0x0400010C
	movs r0, #0
	str r0, [r1]
_02000A3C:
	ldr r0, _02000A68 @ =0x04000202
	movs r1, #0xc0
	strh r1, [r0]
	ldrb r0, [r5]
	cmp r0, #0
	beq _02000A72
	strb r4, [r5, #2]
	movs r0, #4
	strb r0, [r5, #1]
	b _02000A76
	.align 2, 0
_02000A50: .4byte 0x04000208
_02000A54: .4byte 0x04000200
_02000A58: .4byte 0x0000FF3F
_02000A5C: .4byte 0x04000128
_02000A60: .4byte 0x04000120
_02000A64: .4byte 0x0400010C
_02000A68: .4byte 0x04000202
_02000A6C:
	ldrb r0, [r5, #2]
	cmp r0, #2
	bls _02000A76
_02000A72:
	movs r0, #1
	b _02000A7E
_02000A76:
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	movs r0, #0
_02000A7E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_02000A84
sub_02000A84: @ 0x02000A84
	push {r4, r5, lr}
	ldr r2, _02000AA8 @ =0x04000120
	ldr r3, [r2]
	ldr r5, _02000AAC @ =gUnknown_03000770
	ldrb r0, [r5]
	adds r4, r5, #0
	cmp r0, #1
	beq _02000AB4
	ldr r0, _02000AB0 @ =0x04000128
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	ldr r2, [r4, #8]
	cmp r2, #0
	bge _02000B00
	b _02000AEE
	.align 2, 0
_02000AA8: .4byte 0x04000120
_02000AAC: .4byte gUnknown_03000770
_02000AB0: .4byte 0x04000128
_02000AB4:
	ldr r1, _02000AC8 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4, #8]
	cmp r1, #0
	bge _02000AD0
	ldr r0, _02000ACC @ =0xFEFEFEFE
	str r0, [r2]
	b _02000B16
	.align 2, 0
_02000AC8: .4byte 0x0400010E
_02000ACC: .4byte 0xFEFEFEFE
_02000AD0:
	ldr r0, _02000AE4 @ =0x00001FFF
	cmp r1, r0
	bgt _02000AE8
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _02000B16
	.align 2, 0
_02000AE4: .4byte 0x00001FFF
_02000AE8:
	ldr r0, [r4, #0xc]
	str r0, [r2]
	b _02000B16
_02000AEE:
	ldr r0, _02000AFC @ =0xFEFEFEFE
	cmp r3, r0
	beq _02000B16
	subs r0, r2, #1
	str r0, [r5, #8]
	b _02000B16
	.align 2, 0
_02000AFC: .4byte 0xFEFEFEFE
_02000B00:
	ldr r0, _02000B10 @ =0x00001FFF
	cmp r2, r0
	bgt _02000B14
	ldr r1, [r4, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	str r3, [r0]
	b _02000B16
	.align 2, 0
_02000B10: .4byte 0x00001FFF
_02000B14:
	str r3, [r4, #0xc]
_02000B16:
	ldr r1, [r4, #8]
	ldr r0, _02000B40 @ =0x00002002
	cmp r1, r0
	bgt _02000B38
	adds r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r4]
	cmp r0, #1
	bne _02000B38
	ldr r2, _02000B44 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _02000B48 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_02000B38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02000B40: .4byte 0x00002002
_02000B44: .4byte 0x04000128
_02000B48: .4byte 0x0400010E

	thumb_func_start sub_02000B4C
sub_02000B4C: @ 0x02000B4C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	ldr r3, _02000BC8 @ =0x04000208
	strh r6, [r3]
	ldr r2, _02000BCC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _02000BD0 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	mov r8, r0
	strh r0, [r3]
	str r6, [sp]
	ldr r4, _02000BD4 @ =gUnknown_03000770
	ldr r2, _02000BD8 @ =0x05000006
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _02000BDC @ =0x04000128
	ldr r0, _02000BE0 @ =0x00002003
	str r0, [r1]
	str r7, [r4, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #8]
	cmp r5, #0
	beq _02000BBA
	ldr r0, _02000BE4 @ =0x0400010C
	str r6, [r0]
	mov r2, r8
	strb r2, [r4]
	adds r1, r7, #0
	movs r2, #0x80
	lsls r2, r2, #6
_02000B9C:
	ldm r1!, {r0}
	adds r6, r6, r0
	subs r2, #1
	cmp r2, #0
	bne _02000B9C
	mvns r0, r6
	str r0, [r4, #0xc]
	ldr r1, _02000BDC @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
_02000BBA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02000BC8: .4byte 0x04000208
_02000BCC: .4byte 0x04000200
_02000BD0: .4byte 0x0000FF3F
_02000BD4: .4byte gUnknown_03000770
_02000BD8: .4byte 0x05000006
_02000BDC: .4byte 0x04000128
_02000BE0: .4byte 0x00002003
_02000BE4: .4byte 0x0400010C

	thumb_func_start sub_02000BE8
sub_02000BE8: @ 0x02000BE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _02000C18 @ =0x04000204
	ldr r2, _02000C1C @ =0x00004014
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _02000C20 @ =gUnknown_03001820
	movs r1, #0
	str r1, [r2]
	ldr r0, _02000C24 @ =gUnknown_03002770
	str r1, [r0]
	ldr r0, _02000C28 @ =gUnknown_03002270
	ldrh r0, [r0]
	cmp r0, #0xf
	bne _02000C2C
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r2]
	b _02000C2E
	.align 2, 0
_02000C18: .4byte 0x04000204
_02000C1C: .4byte 0x00004014
_02000C20: .4byte gUnknown_03001820
_02000C24: .4byte gUnknown_03002770
_02000C28: .4byte gUnknown_03002270
_02000C2C:
	str r1, [r2]
_02000C2E:
	ldr r0, _02000EE0 @ =0x040000D4
	ldr r1, _02000EE4 @ =0x06010000
	str r1, [r0]
	ldr r1, _02000EE8 @ =0x0203B000
	str r1, [r0, #4]
	ldr r1, _02000EEC @ =0x80002800
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	movs r2, #0
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r3, _02000EF0 @ =0x85000100
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r3, _02000EF4 @ =gUnknown_030026D4
	movs r1, #0xff
	strb r1, [r3]
	ldr r1, _02000EF8 @ =gUnknown_03002AC4
	strb r2, [r1]
	ldr r1, _02000EFC @ =gUnknown_0300285C
	strb r2, [r1]
	ldr r1, _02000F00 @ =gUnknown_03005370
	strb r2, [r1]
	ldr r1, _02000F04 @ =gUnknown_03004D3C
	strb r2, [r1]
	ldr r1, _02000F08 @ =gUnknown_03002A64
	strb r2, [r1]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F0C @ =gUnknown_03002260
	str r1, [r0, #4]
	ldr r3, _02000F10 @ =0x85000004
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _02000F14 @ =gUnknown_03004D60
	str r2, [r1]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F18 @ =gUnknown_03002810
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _02000F1C @ =gUnknown_030017D4
	movs r4, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	ldr r3, _02000F20 @ =gUnknown_03002820
	movs r1, #0x80
	strh r1, [r3]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F24 @ =gUnknown_03002780
	str r1, [r0, #4]
	ldr r1, _02000F28 @ =0x85000020
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _02000F2C @ =gUnknown_030018D0
	strb r4, [r1]
	ldr r1, _02000F30 @ =gUnknown_03002AC0
	strb r4, [r1]
	add r3, sp, #4
	movs r1, #0x80
	lsls r1, r1, #2
	adds r5, r1, #0
	strh r5, [r3]
	str r3, [r0]
	ldr r1, _02000F34 @ =gUnknown_03004D70
	str r1, [r0, #4]
	ldr r4, _02000F38 @ =0x81000200
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	strh r5, [r3]
	str r3, [r0]
	ldr r1, _02000F3C @ =gUnknown_030022B0
	str r1, [r0, #4]
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F40 @ =gUnknown_03001830
	str r1, [r0, #4]
	ldr r3, _02000F44 @ =0x85000008
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F48 @ =gUnknown_03004D40
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F4C @ =gUnknown_03002040
	str r1, [r0, #4]
	adds r3, #0x78
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02000F50 @ =gUnknown_03002860
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _02000F54 @ =gUnknown_03001900
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strh r1, [r0, #0x16]
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldr r0, _02000F58 @ =gUnknown_03001924
	strh r2, [r0]
	ldr r0, _02000F5C @ =gUnknown_030017D0
	strh r1, [r0]
	ldr r0, _02000F60 @ =gUnknown_03005374
	strh r1, [r0]
	ldr r0, _02000F64 @ =gUnknown_03002A6C
	strh r2, [r0]
	ldr r0, _02000F68 @ =gUnknown_03004D38
	strh r2, [r0]
	ldr r0, _02000F6C @ =gUnknown_0300192C
	strh r2, [r0]
	ldr r0, _02000F70 @ =gUnknown_03002800
	strh r2, [r0]
	ldr r0, _02000F74 @ =gUnknown_03005378
	strh r1, [r0]
	ldr r0, _02000F78 @ =gUnknown_03002250
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r0, _02000F7C @ =gUnknown_030018C8
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, _02000F80 @ =gUnknown_030026B0
	strh r2, [r0]
	ldr r0, _02000F84 @ =gUnknown_03005398
	str r2, [r0]
	ldr r0, _02000F88 @ =gUnknown_03002244
	mov ip, r0
	ldr r7, _02000F8C @ =gUnknown_03001B40
	ldr r1, _02000F90 @ =gUnknown_03001864
	mov r8, r1
	ldr r0, _02000F94 @ =gUnknown_0300228C
	mov sb, r0
	ldr r1, _02000F98 @ =gUnknown_03002858
	mov sl, r1
	ldr r6, _02000F9C @ =gUnknown_030026E0
	movs r5, #0x14
	ldr r4, _02000FA0 @ =gUnknown_03002830
	movs r3, #8
_02000D9C:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r6
	strb r5, [r1]
	adds r1, r0, r4
	strb r3, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	ble _02000D9C
	movs r0, #0
	mov r2, ip
	str r0, [r2]
	movs r2, #0
	ldr r4, _02000FA4 @ =gUnknown_03000790
	ldr r3, _02000FA8 @ =gUnknown_02014F44
_02000DC0:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #2
	adds r2, r0, r4
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xe
	ble _02000DC0
	movs r5, #0
	str r5, [sp]
	ldr r4, _02000EE0 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	str r7, [r4, #4]
	ldr r0, _02000FAC @ =0x85000140
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, r8
	str r7, [r1]
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r7, r2
	mov r1, sb
	str r0, [r1]
	mov r2, sl
	str r5, [r2]
	ldr r0, _02000FB0 @ =gUnknown_03002A60
	strb r5, [r0]
	ldr r1, _02000FB4 @ =gUnknown_0300186C
	strb r5, [r1]
	ldr r2, _02000FB8 @ =gUnknown_030018C0
	strb r5, [r2]
	str r5, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r1, _02000FBC @ =gUnknown_030026C0
	str r1, [r4, #4]
	ldr r0, _02000F10 @ =0x85000004
	str r0, [r4, #8]
	ldr r1, [r4, #8]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r1, _02000FC0 @ =gUnknown_03002AD0
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldr r1, [r4, #8]
	ldr r2, _02000FC4 @ =gUnknown_03004D30
	strb r5, [r2]
	ldr r1, _02000FC8 @ =gUnknown_03001928
	strb r5, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r1, _02000FCC @ =gUnknown_03001850
	str r1, [r4, #4]
	str r0, [r4, #8]
	ldr r1, [r4, #8]
	str r5, [sp]
	str r2, [r4]
	ldr r2, _02000FD0 @ =gUnknown_03005380
	str r2, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl m4aSoundInit
	ldr r0, _02000FD4 @ =0x0092F400
	bl m4aSoundMode
	ldr r1, _02000FD8 @ =gUnknown_03005394
	movs r0, #1
	strb r0, [r1]
	bl sub_020018AC
	ldr r1, _02000FDC @ =gUnknown_03001868
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _02000FE0 @ =gUnknown_03001920
	ldr r0, _02000FE4 @ =0x06014000
	str r0, [r1]
	bl sub_02004854
	ldr r2, _02000FE8 @ =gUnknown_03001820
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r2]
	ldr r0, _02000FEC @ =sub_020001BC
	str r0, [r4]
	ldr r1, _02000FF0 @ =gUnknown_030007D0
	str r1, [r4, #4]
	ldr r0, _02000FF4 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _02000FF8 @ =gUnknown_03007FFC
	str r1, [r0]
	ldr r0, _02000FFC @ =0x04000208
	movs r1, #1
	strh r1, [r0]
	subs r0, #8
	strh r1, [r0]
	ldr r1, _02001000 @ =0x04000004
	movs r0, #0x18
	strh r0, [r1]
	str r5, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _02001004 @ =gUnknown_03002840
	str r0, [r4, #4]
	ldr r0, _02001008 @ =0x85000005
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	str r5, [sp]
	mov r1, sp
	str r1, [r4]
	ldr r0, _0200100C @ =gUnknown_03001870
	str r0, [r4, #4]
	ldr r0, _02001010 @ =0x85000014
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _02001014 @ =gUnknown_03001930
	str r5, [r0]
	ldr r0, _02001018 @ =gUnknown_03001934
	strb r5, [r0]
	movs r0, #0
	bl sub_020003EC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02000EE0: .4byte 0x040000D4
_02000EE4: .4byte 0x06010000
_02000EE8: .4byte 0x0203B000
_02000EEC: .4byte 0x80002800
_02000EF0: .4byte 0x85000100
_02000EF4: .4byte gUnknown_030026D4
_02000EF8: .4byte gUnknown_03002AC4
_02000EFC: .4byte gUnknown_0300285C
_02000F00: .4byte gUnknown_03005370
_02000F04: .4byte gUnknown_03004D3C
_02000F08: .4byte gUnknown_03002A64
_02000F0C: .4byte gUnknown_03002260
_02000F10: .4byte 0x85000004
_02000F14: .4byte gUnknown_03004D60
_02000F18: .4byte gUnknown_03002810
_02000F1C: .4byte gUnknown_030017D4
_02000F20: .4byte gUnknown_03002820
_02000F24: .4byte gUnknown_03002780
_02000F28: .4byte 0x85000020
_02000F2C: .4byte gUnknown_030018D0
_02000F30: .4byte gUnknown_03002AC0
_02000F34: .4byte gUnknown_03004D70
_02000F38: .4byte 0x81000200
_02000F3C: .4byte gUnknown_030022B0
_02000F40: .4byte gUnknown_03001830
_02000F44: .4byte 0x85000008
_02000F48: .4byte gUnknown_03004D40
_02000F4C: .4byte gUnknown_03002040
_02000F50: .4byte gUnknown_03002860
_02000F54: .4byte gUnknown_03001900
_02000F58: .4byte gUnknown_03001924
_02000F5C: .4byte gUnknown_030017D0
_02000F60: .4byte gUnknown_03005374
_02000F64: .4byte gUnknown_03002A6C
_02000F68: .4byte gUnknown_03004D38
_02000F6C: .4byte gUnknown_0300192C
_02000F70: .4byte gUnknown_03002800
_02000F74: .4byte gUnknown_03005378
_02000F78: .4byte gUnknown_03002250
_02000F7C: .4byte gUnknown_030018C8
_02000F80: .4byte gUnknown_030026B0
_02000F84: .4byte gUnknown_03005398
_02000F88: .4byte gUnknown_03002244
_02000F8C: .4byte gUnknown_03001B40
_02000F90: .4byte gUnknown_03001864
_02000F94: .4byte gUnknown_0300228C
_02000F98: .4byte gUnknown_03002858
_02000F9C: .4byte gUnknown_030026E0
_02000FA0: .4byte gUnknown_03002830
_02000FA4: .4byte gUnknown_03000790
_02000FA8: .4byte gUnknown_02014F44
_02000FAC: .4byte 0x85000140
_02000FB0: .4byte gUnknown_03002A60
_02000FB4: .4byte gUnknown_0300186C
_02000FB8: .4byte gUnknown_030018C0
_02000FBC: .4byte gUnknown_030026C0
_02000FC0: .4byte gUnknown_03002AD0
_02000FC4: .4byte gUnknown_03004D30
_02000FC8: .4byte gUnknown_03001928
_02000FCC: .4byte gUnknown_03001850
_02000FD0: .4byte gUnknown_03005380
_02000FD4: .4byte 0x0092F400
_02000FD8: .4byte gUnknown_03005394
_02000FDC: .4byte gUnknown_03001868
_02000FE0: .4byte gUnknown_03001920
_02000FE4: .4byte 0x06014000
_02000FE8: .4byte gUnknown_03001820
_02000FEC: .4byte sub_020001BC
_02000FF0: .4byte gUnknown_030007D0
_02000FF4: .4byte 0x84000080
_02000FF8: .4byte gUnknown_03007FFC
_02000FFC: .4byte 0x04000208
_02001000: .4byte 0x04000004
_02001004: .4byte gUnknown_03002840
_02001008: .4byte 0x85000005
_0200100C: .4byte gUnknown_03001870
_02001010: .4byte 0x85000014
_02001014: .4byte gUnknown_03001930
_02001018: .4byte gUnknown_03001934

	thumb_func_start sub_0200101C
sub_0200101C: @ 0x0200101C
	push {r4, r5, lr}
_0200101E:
	ldr r1, _02001094 @ =gUnknown_03005394
	movs r0, #0
	strb r0, [r1]
	ldr r0, _02001098 @ =gUnknown_03001820
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _02001036
	bl m4aSoundMain
_02001036:
	ldr r0, _0200109C @ =gUnknown_030026D4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0200105C
	bl sub_020016E8
	ldr r0, _020010A0 @ =gUnknown_03001934
	ldrb r0, [r0]
	cmp r0, #0
	beq _02001058
	ldr r0, _020010A4 @ =gUnknown_03002840
	ldr r1, _020010A8 @ =gUnknown_03001870
	movs r2, #0
	bl sub_020004E0
	ldr r1, _020010AC @ =gUnknown_03001930
	str r0, [r1]
_02001058:
	bl sub_02001ACC
_0200105C:
	ldr r0, _020010B0 @ =gUnknown_03002770
	ldr r4, _02001098 @ =gUnknown_03001820
	ldr r1, [r4]
	str r1, [r0]
	bl sub_02014CC0
	bl sub_020010DC
	ldr r0, [r4]
	movs r5, #0x80
	lsls r5, r5, #3
	ands r0, r5
	cmp r0, #0
	bne _02001086
	bl sub_020013CC
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	beq _020010B4
_02001086:
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r4]
	b _020010BA
	.align 2, 0
_02001094: .4byte gUnknown_03005394
_02001098: .4byte gUnknown_03001820
_0200109C: .4byte gUnknown_030026D4
_020010A0: .4byte gUnknown_03001934
_020010A4: .4byte gUnknown_03002840
_020010A8: .4byte gUnknown_03001870
_020010AC: .4byte gUnknown_03001930
_020010B0: .4byte gUnknown_03002770
_020010B4:
	ldr r0, _020010D4 @ =0xFFFFF7FF
	ands r1, r0
	str r1, [r4]
_020010BA:
	ldr r2, _020010D8 @ =0x04000004
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0200101E
	movs r3, #1
_020010C8:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _020010C8
	b _0200101E
	.align 2, 0
_020010D4: .4byte 0xFFFFF7FF
_020010D8: .4byte 0x04000004

	thumb_func_start sub_020010DC
sub_020010DC: @ 0x020010DC
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _020011CC @ =gUnknown_03002820
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _020011D0 @ =0x040000D4
	ldr r0, _020011D4 @ =gUnknown_03002290
	str r0, [r3]
	ldr r0, _020011D8 @ =0x04000008
	str r0, [r3, #4]
	ldr r0, _020011DC @ =0x84000002
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _020011E0 @ =gUnknown_03001820
	ldr r2, [r1]
	movs r5, #1
	adds r0, r2, #0
	ands r0, r5
	adds r6, r1, #0
	cmp r0, #0
	beq _02001120
	ldr r0, _020011E4 @ =gUnknown_03002860
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _020011E8 @ =0x84000080
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	eors r2, r5
	str r2, [r6]
_02001120:
	ldr r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200113E
	ldr r0, _020011EC @ =gUnknown_03002040
	str r0, [r3]
	ldr r0, _020011F0 @ =0x05000200
	str r0, [r3, #4]
	ldr r0, _020011E8 @ =0x84000080
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [r6]
	eors r0, r1
	str r0, [r6]
_0200113E:
	ldr r0, _020011F4 @ =gUnknown_03002250
	str r0, [r3]
	ldr r0, _020011F8 @ =0x04000040
	str r0, [r3, #4]
	ldr r0, _020011FC @ =0x84000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _02001200 @ =gUnknown_030018C8
	str r0, [r3]
	ldr r0, _02001204 @ =0x04000050
	str r0, [r3, #4]
	ldr r0, _02001208 @ =0x80000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _0200120C @ =gUnknown_030026B0
	str r0, [r3]
	ldr r0, _02001210 @ =0x0400004C
	str r0, [r3, #4]
	ldr r0, _02001214 @ =0x80000002
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _02001218 @ =gUnknown_03002810
	str r0, [r3]
	ldr r0, _0200121C @ =0x04000010
	str r0, [r3, #4]
	ldr r0, _02001220 @ =0x80000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _02001224 @ =gUnknown_03001900
	str r0, [r3]
	ldr r0, _02001228 @ =0x04000020
	str r0, [r3, #4]
	ldr r0, _0200122C @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [r6]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _02001248
	ldr r2, _02001230 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	str r4, [sp]
	mov r0, sp
	str r0, [r3]
	ldr r1, _02001234 @ =gUnknown_03002AD0
	str r1, [r3, #4]
	ldr r0, _02001238 @ =0x85000004
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0200123C @ =gUnknown_0300186C
	ldrb r0, [r2]
	cmp r0, #0
	beq _020011C2
	ldr r0, _02001240 @ =gUnknown_030026C0
	str r0, [r3]
	str r1, [r3, #4]
	ldrb r0, [r2]
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_020011C2:
	ldr r1, _02001244 @ =gUnknown_030018C0
	ldrb r0, [r2]
	strb r0, [r1]
	b _02001256
	.align 2, 0
_020011CC: .4byte gUnknown_03002820
_020011D0: .4byte 0x040000D4
_020011D4: .4byte gUnknown_03002290
_020011D8: .4byte 0x04000008
_020011DC: .4byte 0x84000002
_020011E0: .4byte gUnknown_03001820
_020011E4: .4byte gUnknown_03002860
_020011E8: .4byte 0x84000080
_020011EC: .4byte gUnknown_03002040
_020011F0: .4byte 0x05000200
_020011F4: .4byte gUnknown_03002250
_020011F8: .4byte 0x04000040
_020011FC: .4byte 0x84000003
_02001200: .4byte gUnknown_030018C8
_02001204: .4byte 0x04000050
_02001208: .4byte 0x80000003
_0200120C: .4byte gUnknown_030026B0
_02001210: .4byte 0x0400004C
_02001214: .4byte 0x80000002
_02001218: .4byte gUnknown_03002810
_0200121C: .4byte 0x04000010
_02001220: .4byte 0x80000008
_02001224: .4byte gUnknown_03001900
_02001228: .4byte 0x04000020
_0200122C: .4byte 0x84000008
_02001230: .4byte 0x04000200
_02001234: .4byte gUnknown_03002AD0
_02001238: .4byte 0x85000004
_0200123C: .4byte gUnknown_0300186C
_02001240: .4byte gUnknown_030026C0
_02001244: .4byte gUnknown_030018C0
_02001248:
	ldr r2, _02001334 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _02001338 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0200133C @ =gUnknown_030018C0
	strb r4, [r0]
_02001256:
	ldr r0, [r6]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0200127E
	ldr r2, _02001340 @ =0x040000D4
	ldr r0, _02001344 @ =gUnknown_03001864
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _02001348 @ =gUnknown_03002858
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _0200134C @ =gUnknown_03002A60
	ldrb r0, [r0]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0200127E:
	ldr r0, _02001350 @ =gUnknown_030026D4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _020012CC
	bl sub_02004494
	ldr r0, _02001340 @ =0x040000D4
	ldr r3, _02001354 @ =gUnknown_03004D70
	str r3, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r2, _02001358 @ =0x80000080
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _0200135C @ =0x07000100
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _02001360 @ =0x07000200
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _02001364 @ =0x07000300
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_020012CC:
	movs r4, #0
	ldr r0, _02001368 @ =gUnknown_03001928
	ldrb r1, [r0]
	cmp r4, r1
	bhs _020012F0
	ldr r6, _0200136C @ =gUnknown_03005380
	adds r5, r0, #0
_020012DA:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl sub_02014CC8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _020012DA
_020012F0:
	ldr r0, _02001370 @ =gUnknown_03001820
	ldr r1, [r0]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _02001380
	movs r0, #0
	str r0, [sp]
	ldr r2, _02001340 @ =0x040000D4
	mov r1, sp
	str r1, [r2]
	ldr r1, _0200136C @ =gUnknown_03005380
	str r1, [r2, #4]
	ldr r0, _02001374 @ =0x85000004
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _02001378 @ =gUnknown_03004D30
	ldrb r0, [r3]
	cmp r0, #0
	beq _0200132A
	ldr r0, _0200137C @ =gUnknown_03001850
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0200132A:
	ldr r1, _02001368 @ =gUnknown_03001928
	ldrb r0, [r3]
	strb r0, [r1]
	b _02001384
	.align 2, 0
_02001334: .4byte 0x04000200
_02001338: .4byte 0x0000FFFD
_0200133C: .4byte gUnknown_030018C0
_02001340: .4byte 0x040000D4
_02001344: .4byte gUnknown_03001864
_02001348: .4byte gUnknown_03002858
_0200134C: .4byte gUnknown_03002A60
_02001350: .4byte gUnknown_030026D4
_02001354: .4byte gUnknown_03004D70
_02001358: .4byte 0x80000080
_0200135C: .4byte 0x07000100
_02001360: .4byte 0x07000200
_02001364: .4byte 0x07000300
_02001368: .4byte gUnknown_03001928
_0200136C: .4byte gUnknown_03005380
_02001370: .4byte gUnknown_03001820
_02001374: .4byte 0x85000004
_02001378: .4byte gUnknown_03004D30
_0200137C: .4byte gUnknown_03001850
_02001380:
	ldr r0, _02001398 @ =gUnknown_03001928
	strb r1, [r0]
_02001384:
	ldr r1, _0200139C @ =gUnknown_030026D4
	ldrb r4, [r1]
	cmp r4, #0xff
	bne _0200138E
	movs r4, #0
_0200138E:
	movs r0, #0xff
	strb r0, [r1]
	ldr r5, _020013A0 @ =gUnknown_02014F7C
	b _020013AA
	.align 2, 0
_02001398: .4byte gUnknown_03001928
_0200139C: .4byte gUnknown_030026D4
_020013A0: .4byte gUnknown_02014F7C
_020013A4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_020013AA:
	cmp r4, #2
	bhi _020013C0
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl sub_02014CC8
	cmp r0, #0
	bne _020013A4
	ldr r0, _020013C8 @ =gUnknown_030026D4
	strb r4, [r0]
_020013C0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020013C8: .4byte gUnknown_030026D4

	thumb_func_start sub_020013CC
sub_020013CC: @ 0x020013CC
	push {r4, lr}
	sub sp, #4
	ldr r1, _02001404 @ =gUnknown_0300186C
	movs r0, #0
	strb r0, [r1]
	ldr r2, _02001408 @ =gUnknown_03001820
	ldr r0, [r2]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r1, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _02001426
	ldr r3, _0200140C @ =gUnknown_03001864
	ldr r0, _02001410 @ =gUnknown_03004D34
	ldr r1, [r3]
	ldr r2, [r0]
	cmp r1, r2
	bne _0200141C
	ldr r0, _02001414 @ =gUnknown_030022A0
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _02001418 @ =gUnknown_0300228C
	str r2, [r0]
	b _02001426
	.align 2, 0
_02001404: .4byte gUnknown_0300186C
_02001408: .4byte gUnknown_03001820
_0200140C: .4byte gUnknown_03001864
_02001410: .4byte gUnknown_03004D34
_02001414: .4byte gUnknown_030022A0
_02001418: .4byte gUnknown_0300228C
_0200141C:
	str r2, [r3]
	ldr r0, _0200149C @ =gUnknown_0300228C
	ldr r1, _020014A0 @ =gUnknown_030022A0
	ldr r1, [r1]
	str r1, [r0]
_02001426:
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	mov r0, sp
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	strh r3, [r0]
	ldr r0, _020014A4 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _020014A8 @ =gUnknown_03004D70
	mov ip, r1
	str r1, [r0, #4]
	ldr r2, _020014AC @ =0x81000080
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #2
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r1, sp
	strh r3, [r1]
	str r1, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	add r1, ip
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _020014B0 @ =gUnknown_03004D30
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200149C: .4byte gUnknown_0300228C
_020014A0: .4byte gUnknown_030022A0
_020014A4: .4byte 0x040000D4
_020014A8: .4byte gUnknown_03004D70
_020014AC: .4byte 0x81000080
_020014B0: .4byte gUnknown_03004D30

	thumb_func_start sub_020014B4
sub_020014B4: @ 0x020014B4
	push {r4, r5, r6, r7, lr}
	ldr r4, _02001544 @ =0x040000B0
	ldrh r1, [r4, #0xa]
	ldr r0, _02001548 @ =0x0000C5FF
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _0200154C @ =0x00007FFF
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl sub_0201315C
	ldr r1, _02001550 @ =gUnknown_03007FF8
	ldrh r0, [r1]
	movs r2, #1
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _02001554 @ =gUnknown_03005394
	strb r2, [r0]
	ldr r5, _02001558 @ =gUnknown_03002770
	ldr r3, [r5]
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _02001574
	ldr r2, _0200155C @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	adds r2, r4, #0
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r6, r5, #0
	ldr r4, _02001560 @ =gUnknown_03001864
	ldr r5, _02001564 @ =gUnknown_03002858
	ldr r3, _02001568 @ =gUnknown_03002A60
	ldr r7, _0200156C @ =gUnknown_03002244
	cmp r0, #0
	bge _02001510
_02001508:
	ldr r0, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _02001508
_02001510:
	ldr r2, _02001544 @ =0x040000B0
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, [r5]
	str r0, [r2, #4]
	ldrb r0, [r3]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrb r1, [r3]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, [r5]
	str r0, [r2, #4]
	ldrb r0, [r3]
	lsrs r0, r0, #1
	ldr r1, _02001570 @ =0xA2600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0200158C
	.align 2, 0
_02001544: .4byte 0x040000B0
_02001548: .4byte 0x0000C5FF
_0200154C: .4byte 0x00007FFF
_02001550: .4byte gUnknown_03007FF8
_02001554: .4byte gUnknown_03005394
_02001558: .4byte gUnknown_03002770
_0200155C: .4byte 0x04000200
_02001560: .4byte gUnknown_03001864
_02001564: .4byte gUnknown_03002858
_02001568: .4byte gUnknown_03002A60
_0200156C: .4byte gUnknown_03002244
_02001570: .4byte 0xA2600000
_02001574:
	ldr r4, _020015D0 @ =gUnknown_03002858
	ldr r0, [r4]
	adds r6, r5, #0
	ldr r7, _020015D4 @ =gUnknown_03002244
	cmp r0, #0
	beq _0200158C
	ldr r2, _020015D8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _020015DC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	str r3, [r4]
_0200158C:
	ldr r0, [r6]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _020015EC
	ldr r2, _020015E0 @ =0x04000004
	ldrh r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _020015E4 @ =gUnknown_03002854
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2]
	ldr r0, _020015E8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	orrs r0, r3
	strh r0, [r2]
	ldr r2, _020015D8 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	b _02001608
	.align 2, 0
_020015D0: .4byte gUnknown_03002858
_020015D4: .4byte gUnknown_03002244
_020015D8: .4byte 0x04000200
_020015DC: .4byte 0x0000FFFD
_020015E0: .4byte 0x04000004
_020015E4: .4byte gUnknown_03002854
_020015E8: .4byte 0x0000FFFB
_020015EC:
	ldr r2, _0200161C @ =0x04000004
	ldrh r3, [r2]
	ldr r1, _02001620 @ =0x0000FFFB
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2]
	ldr r0, _02001624 @ =0x0000FFDF
	ands r0, r3
	strh r0, [r2]
	ldr r2, _02001628 @ =0x04000200
	ldrh r0, [r2]
	ands r1, r0
	strh r1, [r2]
_02001608:
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
	ldr r1, _0200162C @ =0x04000202
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200161C: .4byte 0x04000004
_02001620: .4byte 0x0000FFFB
_02001624: .4byte 0x0000FFDF
_02001628: .4byte 0x04000200
_0200162C: .4byte 0x04000202

	thumb_func_start sub_02001630
sub_02001630: @ 0x02001630
	push {r4, r5, r6, r7, lr}
	ldr r2, _0200167C @ =gUnknown_03004D3C
	ldr r0, _02001680 @ =gUnknown_03002A64
	ldrb r1, [r2]
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r1, r0
	beq _020016DE
	ldr r1, _02001684 @ =gUnknown_03002780
	mov ip, r1
	adds r6, r2, #0
_02001646:
	ldrb r0, [r6]
	lsls r0, r0, #2
	add r0, ip
	ldr r2, [r0]
	ldrh r0, [r2, #8]
	cmp r0, #0
	beq _020016BA
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #3
	ldr r3, _02001688 @ =0x040000D4
_0200165C:
	cmp r0, r5
	bls _02001694
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldr r0, _0200168C @ =0x80000200
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _02001690 @ =0xFFFFFC00
	adds r0, r1, #0
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	b _020016B0
	.align 2, 0
_0200167C: .4byte gUnknown_03004D3C
_02001680: .4byte gUnknown_03002A64
_02001684: .4byte gUnknown_03002780
_02001688: .4byte 0x040000D4
_0200168C: .4byte 0x80000200
_02001690: .4byte 0xFFFFFC00
_02001694:
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldrh r0, [r2, #8]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r0, #0
_020016B0:
	strh r0, [r2, #8]
	adds r4, r4, r5
	ldrh r0, [r2, #8]
	cmp r0, #0
	bne _0200165C
_020016BA:
	ldrb r0, [r6]
	adds r2, r0, #1
	movs r0, #0x1f
	ands r2, r0
	strb r2, [r6]
	ldr r0, _020016D4 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _020016D8
	movs r0, #0
	b _020016E0
	.align 2, 0
_020016D4: .4byte 0x04000004
_020016D8:
	ldrb r0, [r7]
	cmp r2, r0
	bne _02001646
_020016DE:
	movs r0, #1
_020016E0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020016E8
sub_020016E8: @ 0x020016E8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r7, _02001750 @ =gUnknown_03002280
	ldr r0, _02001754 @ =gUnknown_030026E0
	mov sb, r0
	ldr r1, _02001758 @ =gUnknown_03002830
	mov r8, r1
	ldr r6, _0200175C @ =gUnknown_03002270
	ldr r0, _02001760 @ =0x04000130
	ldrh r0, [r0]
	ldr r2, _02001764 @ =0x000003FF
	adds r1, r2, #0
	bics r1, r0
	strh r1, [r6]
	ldr r0, _02001768 @ =gUnknown_03001860
	strh r1, [r0]
	ldr r3, _0200176C @ =gUnknown_03002ABC
	ldr r5, _02001770 @ =gUnknown_03002A68
	ldrh r4, [r5]
	adds r0, r1, #0
	eors r0, r4
	adds r2, r1, #0
	ands r2, r0
	strh r2, [r3]
	ldr r3, _02001774 @ =gUnknown_030026EC
	ands r0, r4
	strh r0, [r3]
	strh r1, [r5]
	ldr r0, _02001778 @ =gUnknown_03002298
	strh r2, [r0]
	movs r1, #0
	mov ip, r6
	movs r6, #1
	adds r5, r0, #0
_02001730:
	mov r3, ip
	ldrh r0, [r3]
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	asrs r0, r2
	ands r0, r6
	adds r4, r1, #0
	cmp r0, #0
	bne _0200177C
	adds r0, r7, r2
	mov r3, sb
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _0200179A
	.align 2, 0
_02001750: .4byte gUnknown_03002280
_02001754: .4byte gUnknown_030026E0
_02001758: .4byte gUnknown_03002830
_0200175C: .4byte gUnknown_03002270
_02001760: .4byte 0x04000130
_02001764: .4byte 0x000003FF
_02001768: .4byte gUnknown_03001860
_0200176C: .4byte gUnknown_03002ABC
_02001770: .4byte gUnknown_03002A68
_02001774: .4byte gUnknown_030026EC
_02001778: .4byte gUnknown_03002298
_0200177C:
	adds r3, r7, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _02001788
	subs r0, #1
	b _02001798
_02001788:
	adds r0, r6, #0
	lsls r0, r2
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
_02001798:
	strb r0, [r3]
_0200179A:
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r4, r2
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _02001730
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_020017B4
sub_020017B4: @ 0x020017B4
	push {r4, r5, r6, lr}
	ldr r0, _020017F4 @ =0x04000006
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0x9f
	bhi _020017E6
	movs r4, #0
	ldr r0, _020017F8 @ =gUnknown_030018C0
	ldrb r0, [r0]
	cmp r4, r0
	bhs _020017E6
	ldr r6, _020017FC @ =gUnknown_03002AD0
_020017CC:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_02014CCC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _020017F8 @ =gUnknown_030018C0
	ldrb r0, [r0]
	cmp r4, r0
	blo _020017CC
_020017E6:
	ldr r1, _02001800 @ =0x04000202
	movs r0, #2
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020017F4: .4byte 0x04000006
_020017F8: .4byte gUnknown_030018C0
_020017FC: .4byte gUnknown_03002AD0
_02001800: .4byte 0x04000202

	thumb_func_start sub_02001804
sub_02001804: @ 0x02001804
	ldr r1, _0200180C @ =0x04000202
	movs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200180C: .4byte 0x04000202

	thumb_func_start sub_02001810
sub_02001810: @ 0x02001810
	ldr r1, _0200181C @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200181C: .4byte 0x04000202

	thumb_func_start sub_02001820
sub_02001820: @ 0x02001820
	ldr r1, _0200182C @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200182C: .4byte 0x04000202

	thumb_func_start sub_02001830
sub_02001830: @ 0x02001830
	ldr r1, _0200183C @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200183C: .4byte 0x04000202

	thumb_func_start sub_02001840
sub_02001840: @ 0x02001840
	ldr r1, _0200184C @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0200184C: .4byte 0x04000202

	thumb_func_start sub_02001850
sub_02001850: @ 0x02001850
	ldr r1, _02001858 @ =0x04000202
	movs r0, #8
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001858: .4byte 0x04000202

	thumb_func_start sub_0200185C
sub_0200185C: @ 0x0200185C
	ldr r1, _02001864 @ =0x04000202
	movs r0, #0x10
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001864: .4byte 0x04000202

	thumb_func_start sub_02001868
sub_02001868: @ 0x02001868
	ldr r1, _02001870 @ =0x04000202
	movs r0, #0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001870: .4byte 0x04000202

	thumb_func_start sub_02001874
sub_02001874: @ 0x02001874
	ldr r1, _02001880 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001880: .4byte 0x04000202

	thumb_func_start sub_02001884
sub_02001884: @ 0x02001884
	ldr r1, _02001890 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_02001890: .4byte 0x04000202
_02001894:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_02001898
sub_02001898: @ 0x02001898
	push {lr}
	bl sub_02000BE8
	bl sub_02012A20
	bl sub_0200101C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020018AC
sub_020018AC: @ 0x020018AC
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _02001944 @ =gUnknown_030026D0
	movs r1, #0
	str r1, [r0]
	ldr r0, _02001948 @ =gUnknown_0300229C
	str r1, [r0]
	ldr r0, _0200194C @ =gUnknown_0300225C
	str r1, [r0]
	str r1, [sp]
	ldr r1, _02001950 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r2, _02001954 @ =gUnknown_030009D0
	str r2, [r1, #4]
	ldr r0, _02001958 @ =0x85000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0200195C @ =gUnknown_03001940
	ldr r3, _02001960 @ =0x00000DE4
	adds r2, r2, r3
	movs r3, #0xfe
	lsls r3, r3, #1
	adds r0, r1, r3
_020018DC:
	str r2, [r0]
	subs r2, #0x1c
	subs r0, #4
	cmp r0, r1
	bge _020018DC
	bl sub_02001D50
	adds r4, r0, #0
	cmp r4, #0
	beq _02001980
	ldr r0, _02001964 @ =sub_02001DD8
	str r0, [r4, #8]
	movs r5, #0
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4]
	strh r5, [r4, #2]
	bl sub_02001D50
	strh r0, [r4, #4]
	ldrh r1, [r4, #4]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	cmp r1, r0
	beq _02001980
	strh r4, [r1, #2]
	ldrh r0, [r4, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r0, _02001968 @ =0x02001DDD
	str r0, [r4, #8]
	ldr r0, _0200196C @ =0x0000FFFF
	strh r0, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4]
	strh r5, [r4, #4]
	ldr r1, _02001970 @ =gUnknown_030018E0
	strh r5, [r1]
	strh r5, [r1, #2]
	strh r5, [r1, #4]
	ldr r0, _02001974 @ =gUnknown_030057D8
	ldr r0, [r0]
	strh r0, [r1, #6]
	ldr r1, _02001978 @ =gUnknown_03002AE0
	strh r5, [r1]
	ldr r0, _0200197C @ =0x00002204
	strh r0, [r1, #2]
	movs r0, #1
	b _02001982
	.align 2, 0
_02001944: .4byte gUnknown_030026D0
_02001948: .4byte gUnknown_0300229C
_0200194C: .4byte gUnknown_0300225C
_02001950: .4byte 0x040000D4
_02001954: .4byte gUnknown_030009D0
_02001958: .4byte 0x85000080
_0200195C: .4byte gUnknown_03001940
_02001960: .4byte 0x00000DE4
_02001964: .4byte sub_02001DD8
_02001968: .4byte 0x02001DDD
_0200196C: .4byte 0x0000FFFF
_02001970: .4byte gUnknown_030018E0
_02001974: .4byte gUnknown_030057D8
_02001978: .4byte gUnknown_03002AE0
_0200197C: .4byte 0x00002204
_02001980:
	movs r0, #0
_02001982:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200198C
sub_0200198C: @ 0x0200198C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r4, #0
	movs r3, #0
	ldr r6, _020019C4 @ =gUnknown_0300225C
	ldr r2, [r6]
	cmp r2, #0x7f
	bgt _020019BC
	ldr r1, _020019C8 @ =gUnknown_03001940
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r2, #1
	str r0, [r6]
	adds r4, r1, #0
_020019BC:
	cmp r4, #0
	bne _020019DC
	ldr r0, _020019CC @ =gUnknown_030018E0
	b _02001A26
	.align 2, 0
_020019C4: .4byte gUnknown_0300225C
_020019C8: .4byte gUnknown_03001940
_020019CC: .4byte gUnknown_030018E0
_020019D0:
	strh r4, [r1, #2]
	ldrh r0, [r3, #4]
	strh r0, [r4, #4]
	strh r3, [r4, #2]
	strh r4, [r3, #4]
	b _02001A24
_020019DC:
	mov r0, ip
	str r0, [r4, #8]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0xc]
	movs r0, #0
	strh r5, [r4, #0x10]
	strh r7, [r4, #0x12]
	strb r0, [r4, #0x15]
	strh r3, [r4, #0x16]
	strh r3, [r4, #0x18]
	mov r0, r8
	bl sub_02001BA0
	strh r0, [r4, #6]
	ldr r0, _02001A30 @ =gUnknown_030026D0
	ldr r0, [r0]
	strh r0, [r4]
	ldr r0, _02001A34 @ =gUnknown_03001940
	ldr r3, [r0]
	ldrh r1, [r3, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r0, r1, r2
	cmp r0, r2
	beq _02001A24
_02001A0E:
	adds r1, r1, r2
	ldrh r0, [r1, #0x10]
	cmp r0, r5
	bhi _020019D0
	adds r3, r1, #0
	ldrh r1, [r3, #4]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r0, r1, r6
	cmp r0, r2
	bne _02001A0E
_02001A24:
	adds r0, r4, #0
_02001A26:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02001A30: .4byte gUnknown_030026D0
_02001A34: .4byte gUnknown_03001940

	thumb_func_start sub_02001A38
sub_02001A38: @ 0x02001A38
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x12]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _02001AB6
	ldrh r0, [r4, #2]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r1, r0, r6
	ldrh r0, [r4, #4]
	adds r0, r0, r6
	cmp r1, r6
	beq _02001AB6
	cmp r0, r6
	beq _02001AB6
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _02001A6A
	adds r0, r4, #0
	bl sub_02014CCC
_02001A6A:
	ldr r1, _02001ABC @ =gUnknown_0300229C
	ldr r0, [r1]
	ldrh r2, [r4, #4]
	cmp r4, r0
	bne _02001A7A
	adds r0, r2, r6
	str r0, [r1]
	ldrh r2, [r4, #4]
_02001A7A:
	ldrh r0, [r4, #2]
	adds r1, r0, r6
	adds r0, r2, r6
	strh r0, [r1, #4]
	strh r1, [r0, #2]
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _02001A90
	adds r0, r0, r6
	bl sub_02001C08
_02001A90:
	ldr r2, _02001AC0 @ =gUnknown_03001940
	ldr r1, _02001AC4 @ =gUnknown_0300225C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	str r4, [r0]
	strh r5, [r4]
	strh r5, [r4, #2]
	ldr r0, _02001AC8 @ =0x02001DE1
	str r0, [r4, #8]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #6]
	movs r0, #0
	strb r0, [r4, #0x15]
	strh r5, [r4, #0x16]
	strh r5, [r4, #0x18]
_02001AB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02001ABC: .4byte gUnknown_0300229C
_02001AC0: .4byte gUnknown_03001940
_02001AC4: .4byte gUnknown_0300225C
_02001AC8: .4byte 0x02001DE1

	thumb_func_start sub_02001ACC
sub_02001ACC: @ 0x02001ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _02001B30 @ =gUnknown_030026D0
	ldr r0, _02001B34 @ =gUnknown_03001940
	ldr r3, [r0]
	str r3, [r2]
	ldr r0, _02001B38 @ =gUnknown_03001820
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	bne _02001B44
	movs r0, #0xc0
	lsls r0, r0, #0x12
	cmp r3, r0
	beq _02001B84
	ldr r7, _02001B3C @ =gUnknown_0300229C
	mov r5, r8
	adds r6, r0, #0
_02001AF8:
	ldr r2, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r6
	str r0, [r7]
	ldrh r1, [r2, #0x12]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _02001B10
	ldr r0, [r2, #8]
	bl sub_02014CC8
_02001B10:
	ldr r0, [r7]
	str r0, [r5]
	ldr r4, _02001B40 @ =gUnknown_03005394
	ldrb r0, [r4]
	cmp r0, #0
	beq _02001B24
	bl m4aSoundMain
	movs r0, #0
	strb r0, [r4]
_02001B24:
	ldr r0, [r5]
	cmp r0, r6
	bne _02001AF8
	ldr r0, _02001B30 @ =gUnknown_030026D0
	mov r8, r0
	b _02001B84
	.align 2, 0
_02001B30: .4byte gUnknown_030026D0
_02001B34: .4byte gUnknown_03001940
_02001B38: .4byte gUnknown_03001820
_02001B3C: .4byte gUnknown_0300229C
_02001B40: .4byte gUnknown_03005394
_02001B44:
	movs r0, #0xc0
	lsls r0, r0, #0x12
	cmp r3, r0
	beq _02001B84
	ldr r7, _02001B98 @ =gUnknown_0300229C
	mov r5, r8
	adds r6, r0, #0
_02001B52:
	ldr r2, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r6
	str r0, [r7]
	ldrh r1, [r2, #0x12]
	movs r0, #5
	ands r0, r1
	cmp r0, #4
	bne _02001B6A
	ldr r0, [r2, #8]
	bl sub_02014CC8
_02001B6A:
	ldr r0, [r7]
	str r0, [r5]
	ldr r4, _02001B9C @ =gUnknown_03005394
	ldrb r0, [r4]
	cmp r0, #0
	beq _02001B7E
	bl m4aSoundMain
	movs r0, #0
	strb r0, [r4]
_02001B7E:
	ldr r0, [r5]
	cmp r0, r6
	bne _02001B52
_02001B84:
	movs r1, #0
	mov r0, r8
	str r1, [r0]
	ldr r0, _02001B98 @ =gUnknown_0300229C
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02001B98: .4byte gUnknown_0300229C
_02001B9C: .4byte gUnknown_03005394

	thumb_func_start sub_02001BA0
sub_02001BA0: @ 0x02001BA0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r2, #3
	lsrs r2, r0, #2
	cmp r2, #0
	beq _02001C00
	lsls r0, r2, #0x12
	movs r1, #0x80
	lsls r1, r1, #0xb
	adds r0, r0, r1
	lsrs r2, r0, #0x10
	ldr r3, _02001BEC @ =gUnknown_03002AE0
_02001BBA:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r4, #2
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bgt _02001BF0
	cmp r0, r1
	beq _02001BE2
	adds r0, r2, #4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	bgt _02001BF0
	adds r1, r3, r2
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	subs r0, r0, r2
	strh r0, [r1, #2]
	strh r1, [r3]
_02001BE2:
	rsbs r0, r2, #0
	strh r0, [r3, #2]
	adds r0, r3, #4
	b _02001C02
	.align 2, 0
_02001BEC: .4byte gUnknown_03002AE0
_02001BF0:
	ldrh r1, [r3]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	cmp r1, r0
	beq _02001C00
	adds r3, r1, #0
	b _02001BBA
_02001C00:
	movs r0, #0
_02001C02:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_02001C08
sub_02001C08: @ 0x02001C08
	push {r4, r5, lr}
	adds r2, r0, #0
	subs r2, #4
	ldr r1, _02001C80 @ =gUnknown_03002AE0
	adds r3, r1, #0
	cmp r2, r1
	beq _02001C24
	movs r4, #0xc0
	lsls r4, r4, #0x12
_02001C1A:
	adds r1, r3, #0
	ldrh r0, [r1]
	adds r3, r0, r4
	cmp r2, r3
	bne _02001C1A
_02001C24:
	ldrh r4, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _02001C32
	rsbs r0, r4, #0
	strh r0, [r2, #2]
_02001C32:
	movs r4, #2
	ldrsh r0, [r1, r4]
	adds r0, r1, r0
	cmp r0, r2
	bne _02001C52
	ldrh r4, [r1, #2]
	movs r5, #2
	ldrsh r0, [r1, r5]
	cmp r0, #0
	ble _02001C52
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r4, r0
	strh r0, [r1, #2]
	adds r2, r1, #0
_02001C52:
	movs r1, #2
	ldrsh r0, [r2, r1]
	adds r3, r2, r0
	ldrh r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	cmp r3, r0
	bne _02001C78
	ldrh r1, [r3, #2]
	movs r4, #2
	ldrsh r0, [r3, r4]
	cmp r0, #0
	ble _02001C78
	ldrh r5, [r2, #2]
	adds r0, r1, r5
	strh r0, [r2, #2]
	ldrh r0, [r3]
	strh r0, [r2]
_02001C78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02001C80: .4byte gUnknown_03002AE0

	thumb_func_start sub_02001C84
sub_02001C84: @ 0x02001C84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _02001CCC @ =gUnknown_03002AE0
	ldrh r0, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	cmp r0, r1
	beq _02001D46
	mov r8, r1
	ldr r0, _02001CD0 @ =0x040000D4
	mov ip, r0
_02001C9E:
	ldrh r4, [r2, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _02001D38
	ldrh r1, [r2]
	mov r3, r8
	adds r0, r1, r3
	ldrh r3, [r0, #2]
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	blt _02001CD8
	adds r0, r4, r3
	strh r0, [r2, #2]
	adds r0, r1, #0
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _02001D3E
	.align 2, 0
_02001CCC: .4byte gUnknown_03002AE0
_02001CD0: .4byte 0x040000D4
_02001CD4:
	strh r6, [r1, #6]
	b _02001D04
_02001CD8:
	ldr r0, _02001D30 @ =gUnknown_03000004
	adds r5, r1, r0
	adds r6, r2, #4
	movs r0, #2
	ldrsh r7, [r2, r0]
	strh r3, [r2, #2]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	movs r3, #0
	lsls r0, r5, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _02001D34 @ =gUnknown_030009D0
_02001CF6:
	ldrh r0, [r1, #6]
	cmp r0, r4
	beq _02001CD4
	adds r1, #0x1c
	adds r3, #1
	cmp r3, #0x7f
	ble _02001CF6
_02001D04:
	mov r0, ip
	str r5, [r0]
	str r6, [r0, #4]
	movs r1, #2
	ldrsh r0, [r2, r1]
	adds r0, #4
	lsrs r0, r0, #2
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	mov r3, ip
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	movs r5, #2
	ldrsh r1, [r2, r5]
	adds r1, r2, r1
	ldrh r0, [r2]
	strh r0, [r1]
	strh r7, [r1, #2]
	adds r2, r1, #0
	strh r2, [r2]
	b _02001D3E
	.align 2, 0
_02001D30: .4byte gUnknown_03000004
_02001D34: .4byte gUnknown_030009D0
_02001D38:
	ldrh r0, [r2]
	mov r1, r8
	adds r2, r0, r1
_02001D3E:
	ldrh r0, [r2]
	add r0, r8
	cmp r0, r8
	bne _02001C9E
_02001D46:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_02001D50
sub_02001D50: @ 0x02001D50
	push {lr}
	ldr r3, _02001D68 @ =gUnknown_0300225C
	ldr r2, [r3]
	cmp r2, #0x7f
	bgt _02001D70
	ldr r1, _02001D6C @ =gUnknown_03001940
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #1
	str r1, [r3]
	b _02001D72
	.align 2, 0
_02001D68: .4byte gUnknown_0300225C
_02001D6C: .4byte gUnknown_03001940
_02001D70:
	movs r0, #0
_02001D72:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02001D78
sub_02001D78: @ 0x02001D78
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _02001DC0 @ =gUnknown_03001940
	ldr r4, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _02001DD0
_02001D8C:
	ldrh r0, [r4, #0x10]
	cmp r0, r2
	blo _02001DC4
_02001D92:
	cmp r0, r5
	bhs _02001DD0
	adds r1, r4, #0
	ldrh r0, [r1, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r0, r2
	ldr r2, _02001DC0 @ =gUnknown_03001940
	ldr r0, [r2]
	cmp r1, r0
	beq _02001DB4
	ldr r0, [r2, #4]
	cmp r1, r0
	beq _02001DB4
	adds r0, r1, #0
	bl sub_02001A38
_02001DB4:
	movs r0, #0xc0
	lsls r0, r0, #0x12
	cmp r4, r0
	beq _02001DD0
	ldrh r0, [r4, #0x10]
	b _02001D92
	.align 2, 0
_02001DC0: .4byte gUnknown_03001940
_02001DC4:
	ldrh r0, [r4, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	cmp r0, #0
	bne _02001D8C
_02001DD0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02001DD8
sub_02001DD8: @ 0x02001DD8
	bx lr
	.align 2, 0
_02001DDC:
	.byte 0x70, 0x47, 0x00, 0x00
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_02001DE4
sub_02001DE4: @ 0x02001DE4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x1c]
	ldr r1, _02001EA8 @ =gUnknown_03002240
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldrh r0, [r4]
	strh r0, [r3, #0x14]
	ldrh r0, [r4, #2]
	strh r0, [r3, #0x16]
	ldr r0, [r4, #8]
	str r0, [r3]
	ldrh r0, [r4, #0xc]
	strh r0, [r3, #8]
	ldrh r1, [r3, #0x2e]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _02001E2C
	ldr r1, _02001EAC @ =gUnknown_03002780
	ldr r2, _02001EB0 @ =gUnknown_03002A64
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r3, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #0x2e]
	movs r1, #8
	eors r0, r1
	strh r0, [r3, #0x2e]
_02001E2C:
	ldr r6, [r4, #0x10]
	ldrh r5, [r4, #0x16]
	ldrh r0, [r4, #0x14]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	strb r0, [r1]
	ldrh r1, [r3, #0x2e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _02001E70
	ldr r2, _02001EB4 @ =0x040000D4
	str r6, [r2]
	mov r1, ip
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r1, _02001EB8 @ =gUnknown_03002860
	adds r0, r0, r1
	str r0, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r5, r0
	str r5, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _02001EBC @ =gUnknown_03001820
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	ldrh r0, [r3, #0x2e]
	movs r1, #0x10
	eors r0, r1
	strh r0, [r3, #0x2e]
_02001E70:
	ldr r0, [r4, #0x18]
	str r0, [r3, #0x10]
	ldrh r1, [r3, #0x2e]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _02001E8A
	ldr r0, [r4, #0x1c]
	str r0, [r3, #0x38]
	ldrh r0, [r4, #0x20]
	strh r0, [r3, #0x3c]
	ldrh r0, [r4, #0x22]
	strh r0, [r3, #0x3e]
_02001E8A:
	ldr r1, _02001EC0 @ =gUnknown_030017E0
	ldr r2, _02001EC4 @ =gUnknown_0300285C
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r3, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02001EA8: .4byte gUnknown_03002240
_02001EAC: .4byte gUnknown_03002780
_02001EB0: .4byte gUnknown_03002A64
_02001EB4: .4byte 0x040000D4
_02001EB8: .4byte gUnknown_03002860
_02001EBC: .4byte gUnknown_03001820
_02001EC0: .4byte gUnknown_030017E0
_02001EC4: .4byte gUnknown_0300285C

	thumb_func_start sub_02001EC8
sub_02001EC8: @ 0x02001EC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _02001F00 @ =gUnknown_03002AC4
	ldr r1, _02001F04 @ =gUnknown_0300285C
	ldrb r2, [r0]
	adds r3, r0, #0
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r2, r1
	bne _02001EEC
	bl _020029BE
_02001EEC:
	ldr r0, _02001F08 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _02001F0C
	movs r0, #0
	bl sub_020029C0
	.align 2, 0
_02001F00: .4byte gUnknown_03002AC4
_02001F04: .4byte gUnknown_0300285C
_02001F08: .4byte 0x04000004
_02001F0C:
	ldr r0, _02001F70 @ =0x04000006
	ldrh r0, [r0]
	ldr r2, _02001F74 @ =gUnknown_030017E0
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r6, [r0]
	adds r1, #1
	movs r0, #0xf
	ands r1, r0
	strb r1, [r3]
	ldrh r2, [r6, #0x2e]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _02001F38
	ldr r1, [r6, #0x30]
	ldr r0, [r6, #0x34]
	cmp r1, r0
	bne _02001F38
	bl sub_020029B2
_02001F38:
	ldrh r3, [r6, #0x14]
	str r3, [sp]
	movs r3, #3
	adds r5, r3, #0
	ands r5, r2
	ldr r4, [sp]
	cmp r5, #1
	bls _02001F80
	ldr r0, _02001F78 @ =gUnknown_03002820
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _02001F80
	ldr r1, _02001F7C @ =gUnknown_03002290
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, #0xe
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r3
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r7, #1
	str r7, [sp, #8]
	b _02001FA0
	.align 2, 0
_02001F70: .4byte 0x04000006
_02001F74: .4byte gUnknown_030017E0
_02001F78: .4byte gUnknown_03002820
_02001F7C: .4byte gUnknown_03002290
_02001F80:
	movs r0, #0x20
	str r0, [sp, #0xc]
	ldr r0, _02002074 @ =gUnknown_03002290
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	lsrs r3, r0, #0xe
	cmp r3, #1
	beq _02001F96
	cmp r3, #3
	bne _02001F9C
_02001F96:
	movs r1, #0x80
	lsls r1, r1, #4
	str r1, [sp, #4]
_02001F9C:
	movs r2, #2
	str r2, [sp, #8]
_02001FA0:
	ldr r7, [sp, #0xc]
	ldr r1, [sp, #8]
	adds r0, r7, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldrh r2, [r6, #0x2e]
	movs r7, #0x20
	mov sb, r7
	mov r0, sb
	ands r0, r2
	cmp r0, #0
	beq _02001FBE
	b _02002390
_02001FBE:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _02001FC8
	b _0200227C
_02001FC8:
	ldrh r0, [r6, #0x24]
	ldr r1, [sp, #0xc]
	muls r0, r1, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r5, [r6, #0x22]
	mov r8, r5
	ldr r7, [sp, #8]
	mov r0, r8
	muls r0, r7, r0
	adds r7, r1, r0
	ldrh r5, [r6, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _02001FEE
	b _020020F8
_02001FEE:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0200207C
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r2, [r6, #0x10]
	adds r2, r2, r0
	ldrh r0, [r6, #0x1e]
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	subs r0, #1
	ldr r3, [sp, #8]
	muls r0, r3, r0
	adds r4, r2, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _02002078 @ =0x0000FFFF
	cmp r5, r0
	bne _02002024
	bl _020029A2
_02002024:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_0200202E:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _02002060
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_02002042:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _02002042
_02002060:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _0200202E
	bl _020029A2
	.align 2, 0
_02002074: .4byte gUnknown_03002290
_02002078: .4byte 0x0000FFFF
_0200207C:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r2, [r6, #0x10]
	adds r2, r2, r0
	ldrh r0, [r6, #0x1e]
	ldrh r1, [r6, #0x26]
	adds r0, r0, r1
	subs r0, #1
	ldr r3, [sp, #8]
	muls r0, r3, r0
	adds r4, r2, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _020020F4 @ =0x0000FFFF
	cmp r5, r0
	bne _020020A6
	bl _020029A2
_020020A6:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_020020B0:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _020020E2
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_020020C4:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _020020C4
_020020E2:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _020020B0
	bl _020029A2
	.align 2, 0
_020020F4: .4byte 0x0000FFFF
_020020F8:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0200217C
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r1, [sp, #8]
	muls r0, r1, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	ldr r2, [sp, #8]
	muls r0, r2, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _02002178 @ =0x0000FFFF
	cmp r5, r3
	bne _02002128
	bl _020029A2
_02002128:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r2, r0
	mov sb, r0
	mov sl, r3
_02002132:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _02002164
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
_02002146:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _02002146
_02002164:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _02002132
	bl _020029A2
	.align 2, 0
_02002178: .4byte 0x0000FFFF
_0200217C:
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _0200221C
	ldr r2, [sp, #8]
	cmp r2, #2
	bne _0200221C
	mov r3, sb
	mov r0, r8
	subs r3, r3, r0
	cmp r3, #0
	ble _0200221C
	ldrh r0, [r6, #0x26]
	add r0, r8
	adds r2, r0, #0
	subs r2, #0x20
	cmp r2, #0
	ble _0200221C
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	lsls r0, r0, #1
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	lsls r0, r0, #1
	adds r4, r1, r0
	lsls r3, r3, #1
	mov sb, r3
	lsls r2, r2, #1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _02002214 @ =0x0000FFFF
	cmp r5, r1
	bne _020021C4
	b _020029A2
_020021C4:
	ldr r1, _02002218 @ =0x040000D4
	asrs r3, r3, #1
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r3, r0
	mov r8, r3
	asrs r2, r2, #1
	mov ip, r2
	orrs r2, r0
	mov ip, r2
_020021D8:
	str r4, [r1]
	str r7, [r1, #4]
	mov r3, r8
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r4, #0
	add r0, sb
	str r0, [r1]
	ldr r2, [sp, #4]
	adds r2, r2, r7
	str r2, [r1, #4]
	mov r3, ip
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	ldr r3, [sp]
	ldr r0, [sp, #8]
	adds r2, r3, #0
	muls r2, r0, r2
	mov sl, r2
	add r4, sl
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _02002214 @ =0x0000FFFF
	cmp r5, r2
	bne _020021D8
	b _020029A2
	.align 2, 0
_02002214: .4byte 0x0000FFFF
_02002218: .4byte 0x040000D4
_0200221C:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _02002274 @ =0x0000FFFF
	cmp r5, r0
	bne _0200223C
	b _020029A2
_0200223C:
	ldr r1, _02002278 @ =0x040000D4
	movs r2, #0x80
	lsls r2, r2, #0x18
	mov r8, r2
	mov sb, r0
	ldr r0, [sp]
	adds r2, r0, #0
	muls r2, r3, r2
_0200224C:
	str r4, [r1]
	str r7, [r1, #4]
	ldrh r0, [r6, #0x26]
	ldr r3, [sp, #8]
	muls r0, r3, r0
	asrs r0, r0, #1
	mov r3, r8
	orrs r0, r3
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	adds r4, r4, r2
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bne _0200224C
	b _020029A2
	.align 2, 0
_02002274: .4byte 0x0000FFFF
_02002278: .4byte 0x040000D4
_0200227C:
	ldrh r1, [r6, #0x1e]
	str r1, [sp, #0x10]
	ldrh r2, [r6, #0x20]
	str r2, [sp, #0x14]
	movs r3, #0
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _02002290
	b _020029A2
_02002290:
	ldr r4, [sp, #0x10]
	add r4, sl
	ldrh r1, [r6, #0x14]
	adds r0, r4, #0
	bl sub_02014CB8
	str r0, [sp, #0x18]
	ldrh r1, [r6, #0x14]
	adds r5, r0, #0
	adds r0, r5, #0
	muls r0, r1, r0
	subs r4, r4, r0
	str r4, [sp, #0x1c]
	ldrh r7, [r6, #0x28]
	mov r8, r7
	ldrh r0, [r6, #0x26]
	mov r2, sl
	subs r0, r0, r2
	subs r1, r1, r4
	cmp r1, r0
	ble _020022BC
	adds r1, r0, #0
_020022BC:
	ldr r4, [sp, #8]
	adds r3, r1, #0
	muls r3, r4, r3
	str r3, [sp, #0x20]
	movs r5, #0
	mov sb, r5
	add r1, sl
	str r1, [sp, #0x38]
	cmp sb, r8
	bge _0200237E
_020022D0:
	ldr r4, [sp, #0x14]
	add r4, sb
	ldrh r1, [r6, #0x16]
	adds r0, r4, #0
	bl sub_02014CB8
	ldrh r3, [r6, #0x16]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r4, r4, r1
	subs r5, r3, r4
	ldrh r1, [r6, #0x3c]
	muls r0, r1, r0
	ldr r2, [r6, #0x38]
	ldr r7, [sp, #0x18]
	lsls r1, r7, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r2, [r6, #0x14]
	muls r0, r2, r0
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r2, [sp, #0x1c]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r3, [sp, #8]
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	ldrh r1, [r6, #0x24]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	mov r1, sb
	muls r1, r7, r1
	adds r0, r0, r1
	ldrh r1, [r6, #0x22]
	adds r0, r0, r1
	mov r1, sl
	muls r1, r3, r1
	adds r7, r0, r1
	add sb, r5
	cmp r5, r8
	ble _02002332
	mov r5, r8
_02002332:
	mov r2, r8
	subs r2, r2, r5
	mov r8, r2
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	beq _02002378
	ldr r3, _0200238C @ =0x040000D4
	ldr r1, [sp, #0x20]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x3c]
	orrs r2, r0
	str r2, [sp, #0x3c]
	ldr r1, [sp]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	mov ip, r0
_02002360:
	str r4, [r3]
	str r7, [r3, #4]
	ldr r0, [sp, #0x3c]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, ip
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _02002360
_02002378:
	ldrh r2, [r6, #0x28]
	cmp sb, r2
	blt _020022D0
_0200237E:
	ldr r3, [sp, #0x38]
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _02002290
	b _020029A2
	.align 2, 0
_0200238C: .4byte 0x040000D4
_02002390:
	movs r0, #0x40
	ands r0, r2
	ldrh r3, [r6, #0x30]
	ldr r7, _02002460 @ =gUnknown_03002810
	mov sb, r7
	lsls r5, r5, #2
	mov r8, r5
	cmp r0, #0
	bne _020023DC
	adds r2, r4, #0
	lsls r0, r4, #3
	ldrh r5, [r6, #0x16]
	ldrh r7, [r6, #0x32]
	cmp r3, r0
	blt _020023C0
_020023AE:
	lsls r1, r2, #3
	ldrh r0, [r6, #0x30]
	subs r0, r0, r1
	strh r0, [r6, #0x30]
	ldrh r1, [r6, #0x30]
	adds r2, r4, #0
	lsls r0, r4, #3
	cmp r1, r0
	bge _020023AE
_020023C0:
	adds r2, r5, #0
	lsls r0, r2, #3
	ldrh r3, [r6, #0x30]
	cmp r7, r0
	blt _020023DC
_020023CA:
	lsls r1, r2, #3
	ldrh r0, [r6, #0x32]
	subs r0, r0, r1
	strh r0, [r6, #0x32]
	ldrh r1, [r6, #0x32]
	adds r2, r5, #0
	lsls r0, r2, #3
	cmp r1, r0
	bge _020023CA
_020023DC:
	mov r0, r8
	add r0, sb
	movs r2, #7
	ands r3, r2
	strh r3, [r0]
	mov r1, sb
	adds r1, #2
	add r1, r8
	ldrh r0, [r6, #0x32]
	ands r0, r2
	strh r0, [r1]
	ldrh r0, [r6, #0x34]
	ldrh r4, [r6, #0x30]
	lsrs r2, r4, #3
	lsrs r0, r0, #3
	cmp r0, r2
	bne _0200240C
	ldrh r1, [r6, #0x36]
	ldrh r0, [r6, #0x32]
	lsrs r1, r1, #3
	lsrs r0, r0, #3
	cmp r1, r0
	bne _0200240C
	b _020029A2
_0200240C:
	ldrh r1, [r6, #0x2e]
	movs r0, #0x40
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _0200241A
	b _02002884
_0200241A:
	ldrh r0, [r6, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r6, #0x32]
	lsrs r0, r0, #3
	ldrh r1, [r6, #0x20]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldrh r0, [r6, #0x24]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r0, [r6, #0x22]
	ldr r4, [sp, #8]
	muls r0, r4, r0
	adds r7, r1, r0
	ldrh r0, [r6, #0x26]
	ldr r5, [sp, #0x10]
	adds r2, r5, r0
	adds r1, r2, #1
	ldrh r4, [r6, #0x14]
	mov r8, r0
	cmp r1, r4
	ble _02002464
	subs r0, r4, #1
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _02002466
	.align 2, 0
_02002460: .4byte gUnknown_03002810
_02002464:
	movs r2, #0
_02002466:
	ldrh r0, [r6, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0200247C
	b _02002578
_0200247C:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _02002500
	ldrh r0, [r6, #0x20]
	adds r0, r0, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	add r0, r8
	subs r0, #1
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _020024FC @ =0x0000FFFF
	cmp r5, r0
	bne _020024B0
	b _0200266C
_020024B0:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_020024BA:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _020024EC
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_020024CE:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _020024CE
_020024EC:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _020024BA
	b _0200266C
	.align 2, 0
_020024FC: .4byte 0x0000FFFF
_02002500:
	ldrh r0, [r6, #0x20]
	muls r0, r4, r0
	ldr r3, [sp, #8]
	muls r0, r3, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	ldrh r0, [r6, #0x1e]
	add r0, r8
	subs r0, #1
	muls r0, r3, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _02002574 @ =0x0000FFFF
	cmp r5, r0
	bne _02002528
	b _0200266C
_02002528:
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_02002532:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _02002564
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_02002546:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _02002546
_02002564:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _02002532
	b _0200266C
	.align 2, 0
_02002574: .4byte 0x0000FFFF
_02002578:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _020025FC
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	ldr r4, [sp, #0x10]
	adds r1, r4, #0
	muls r1, r3, r1
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _020025F8 @ =0x0000FFFF
	cmp r5, r0
	beq _0200266C
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov ip, r0
_020025B4:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _020025E6
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
_020025C8:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _020025C8
_020025E6:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _020025B4
	b _0200266C
	.align 2, 0
_020025F8: .4byte 0x0000FFFF
_020025FC:
	ldr r3, [sp, #0x14]
	adds r0, r3, #0
	muls r0, r4, r0
	ldr r4, [sp, #8]
	adds r1, r0, #0
	muls r1, r4, r1
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	ldr r3, [sp, #0x10]
	adds r1, r3, #0
	muls r1, r4, r1
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	mov sl, r2
	ldr r0, _02002720 @ =0x0000FFFF
	cmp r5, r0
	beq _0200266C
	ldr r2, _02002724 @ =0x040000D4
	mov r1, sl
	asrs r0, r1, #0x10
	subs r0, #1
	mov r8, r0
	ldr r3, _02002720 @ =0x0000FFFF
	mov ip, r3
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov sb, r0
	ldr r1, [sp]
	ldr r0, [sp, #8]
	adds r3, r1, #0
	muls r3, r0, r3
_02002640:
	str r4, [r2]
	str r7, [r2, #4]
	ldrh r0, [r6, #0x26]
	mov r1, r8
	subs r0, r0, r1
	ldr r1, [sp, #8]
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	mov r1, sb
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, [sp, #0xc]
	adds r7, r7, r0
	adds r4, r4, r3
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, ip
	bne _02002640
_0200266C:
	mov r1, sl
	asrs r3, r1, #0x10
	cmp r3, #0
	bne _02002676
	b _020029A2
_02002676:
	ldrh r0, [r6, #0x24]
	ldr r2, [sp, #0xc]
	muls r0, r2, r0
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	ldrh r0, [r6, #0x22]
	ldrh r4, [r6, #0x14]
	adds r0, r0, r4
	ldr r5, [sp, #0x10]
	subs r0, r0, r5
	ldr r7, [sp, #8]
	muls r0, r7, r0
	adds r7, r1, r0
	ldrh r0, [r6, #0x28]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r1, [r6, #0x2e]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0200279C
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02002728
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	muls r0, r2, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	subs r0, r3, #1
	muls r0, r2, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _02002720 @ =0x0000FFFF
	cmp r5, r3
	bne _020026D2
	b _020029A2
_020026D2:
	ldr r1, [sp]
	adds r0, r1, #0
	muls r0, r2, r0
	mov sb, r0
	mov sl, r3
_020026DC:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _0200270E
	movs r0, #0xc0
	lsls r0, r0, #4
	mov r8, r0
_020026F0:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _020026F0
_0200270E:
	adds r7, r2, #0
	mov r1, sb
	subs r4, r4, r1
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _020026DC
	b _020029A2
	.align 2, 0
_02002720: .4byte 0x0000FFFF
_02002724: .4byte 0x040000D4
_02002728:
	ldr r2, [sp, #0x14]
	adds r0, r2, #0
	muls r0, r4, r0
	ldr r4, [sp, #8]
	muls r0, r4, r0
	ldr r1, [r6, #0x10]
	adds r1, r1, r0
	subs r0, r3, #1
	muls r0, r4, r0
	adds r4, r1, r0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _02002798 @ =0x0000FFFF
	cmp r5, r0
	bne _0200274A
	b _020029A2
_0200274A:
	ldr r2, [sp]
	ldr r3, [sp, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	mov sb, r1
	mov sl, r0
_02002756:
	movs r3, #0
	subs r5, #1
	ldr r0, [sp, #0xc]
	adds r2, r7, r0
	ldrh r1, [r6, #0x26]
	cmp r3, r1
	bhs _02002788
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0200276A:
	lsls r0, r3, #1
	adds r1, r0, r7
	mov ip, r1
	subs r0, r4, r0
	ldrh r0, [r0]
	mov r1, r8
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r6, #0x26]
	cmp r3, r0
	blo _0200276A
_02002788:
	adds r7, r2, #0
	add r4, sb
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sl
	bne _02002756
	b _020029A2
	.align 2, 0
_02002798: .4byte 0x0000FFFF
_0200279C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200281C
	ldr r1, [sp, #0x14]
	adds r0, r1, r5
	subs r0, #1
	muls r0, r4, r0
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _02002818 @ =0x0000FFFF
	cmp r5, r0
	bne _020027C4
	b _020029A2
_020027C4:
	mov r1, sl
	str r1, [sp, #0x30]
	mov ip, r3
	ldr r0, [sp]
	adds r3, r0, #0
	muls r3, r2, r3
	mov sb, r3
_020027D2:
	movs r3, #0
	subs r5, #1
	ldr r1, [sp, #0xc]
	adds r2, r7, r1
	cmp r3, ip
	bge _02002806
	movs r0, #0x80
	lsls r0, r0, #4
	mov sl, r0
	ldr r1, [sp, #0x30]
	asrs r1, r1, #0x10
	mov r8, r1
_020027EA:
	lsls r0, r3, #1
	adds r1, r0, r7
	str r1, [sp, #0x3c]
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r1, sl
	eors r0, r1
	ldr r1, [sp, #0x3c]
	strh r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _020027EA
_02002806:
	adds r7, r2, #0
	mov r2, sb
	subs r4, r4, r2
	lsls r0, r5, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _02002818 @ =0x0000FFFF
	cmp r5, r3
	bne _020027D2
	b _020029A2
	.align 2, 0
_02002818: .4byte 0x0000FFFF
_0200281C:
	ldr r1, [sp, #0x14]
	adds r0, r1, #0
	muls r0, r4, r0
	ldr r2, [sp, #8]
	adds r1, r0, #0
	muls r1, r2, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0200287C @ =0x0000FFFF
	cmp r5, r0
	bne _0200283A
	b _020029A2
_0200283A:
	ldr r2, _02002880 @ =0x040000D4
	ldr r1, [sp, #8]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #0x18
	mov r3, sb
	orrs r3, r0
	mov sb, r3
	ldr r1, [sp]
	ldr r3, [sp, #8]
	adds r0, r1, #0
	muls r0, r3, r0
	mov r8, r0
_0200285E:
	str r4, [r2]
	str r7, [r2, #4]
	mov r0, sb
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, r8
	subs r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _0200287C @ =0x0000FFFF
	cmp r5, r3
	bne _0200285E
	b _020029A2
	.align 2, 0
_0200287C: .4byte 0x0000FFFF
_02002880: .4byte 0x040000D4
_02002884:
	lsrs r0, r4, #3
	ldrh r4, [r6, #0x1e]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r6, #0x32]
	lsrs r0, r0, #3
	ldrh r5, [r6, #0x20]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r7, #0
	mov sl, r7
	ldrh r0, [r6, #0x26]
	cmp sl, r0
	bge _020029A2
_020028A8:
	ldr r4, [sp, #0x10]
	add r4, sl
	ldrh r1, [r6, #0x14]
	adds r0, r4, #0
	bl sub_02014CB8
	str r0, [sp, #0x24]
	ldrh r1, [r6, #0x14]
	adds r2, r0, #0
	adds r0, r2, #0
	muls r0, r1, r0
	subs r4, r4, r0
	str r4, [sp, #0x28]
	ldrh r3, [r6, #0x28]
	mov r8, r3
	ldrh r0, [r6, #0x26]
	mov r4, sl
	subs r0, r0, r4
	ldr r5, [sp, #0x28]
	subs r1, r1, r5
	cmp r1, r0
	ble _020028D6
	adds r1, r0, #0
_020028D6:
	ldr r0, [sp, #8]
	adds r7, r1, #0
	muls r7, r0, r7
	str r7, [sp, #0x2c]
	movs r2, #0
	mov sb, r2
	add r1, sl
	str r1, [sp, #0x34]
	cmp sb, r8
	bge _02002998
_020028EA:
	ldr r4, [sp, #0x14]
	add r4, sb
	ldrh r1, [r6, #0x16]
	adds r0, r4, #0
	bl sub_02014CB8
	ldrh r3, [r6, #0x16]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r4, r4, r1
	subs r5, r3, r4
	ldrh r1, [r6, #0x3c]
	muls r0, r1, r0
	ldr r2, [r6, #0x38]
	ldr r7, [sp, #0x24]
	lsls r1, r7, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r2, [r6, #0x14]
	muls r0, r2, r0
	adds r1, r0, #0
	muls r1, r3, r1
	adds r0, r4, #0
	muls r0, r2, r0
	ldr r2, [sp, #0x28]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r3, [sp, #8]
	muls r1, r3, r1
	ldr r0, [r6, #0x10]
	adds r4, r0, r1
	ldrh r1, [r6, #0x24]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	mov r1, sb
	muls r1, r7, r1
	adds r0, r0, r1
	ldrh r1, [r6, #0x22]
	adds r0, r0, r1
	mov r1, sl
	muls r1, r3, r1
	adds r7, r0, r1
	add sb, r5
	cmp r5, r8
	ble _0200294C
	mov r5, r8
_0200294C:
	mov r2, r8
	subs r2, r2, r5
	mov r8, r2
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	beq _02002992
	ldr r3, _020029D0 @ =0x040000D4
	ldr r1, [sp, #0x2c]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	str r0, [sp, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x3c]
	orrs r2, r0
	str r2, [sp, #0x3c]
	ldr r1, [sp]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	mov ip, r0
_0200297A:
	str r4, [r3]
	str r7, [r3, #4]
	ldr r0, [sp, #0x3c]
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, [sp, #0xc]
	adds r7, r7, r1
	add r4, ip
	adds r0, r5, #0
	subs r5, #1
	cmp r0, #0
	bne _0200297A
_02002992:
	ldrh r2, [r6, #0x28]
	cmp sb, r2
	blt _020028EA
_02002998:
	ldr r3, [sp, #0x34]
	mov sl, r3
	ldrh r4, [r6, #0x26]
	cmp sl, r4
	blt _020028A8
_020029A2:
	ldr r0, _020029D4 @ =0x04000006
	ldrh r0, [r0]
	ldrh r0, [r6, #0x30]
	strh r0, [r6, #0x34]
	ldrh r0, [r6, #0x32]
	strh r0, [r6, #0x36]
	ldr r3, _020029D8 @ =gUnknown_03002AC4
	ldr r4, _020029DC @ =gUnknown_0300285C

	non_word_aligned_thumb_func_start sub_020029B2
sub_020029B2: @ 0x020029B2
	ldrb r0, [r3]
	ldrb r5, [r4]
	cmp r0, r5
	beq _020029BE
	bl _02001EEC
_020029BE:
	movs r0, #1
sub_020029C0:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_020029D0: .4byte 0x040000D4
_020029D4: .4byte 0x04000006
_020029D8: .4byte gUnknown_03002AC4
_020029DC: .4byte gUnknown_0300285C

	thumb_func_start sub_020029E0
sub_020029E0: @ 0x020029E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x1c]
	ldr r1, _02002A3C @ =gUnknown_03002240
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	ldrb r0, [r3, #6]
	cmp r0, #0
	beq _02002A78
	adds r2, r4, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	adds r0, #1
	movs r6, #0
	strb r0, [r2]
	movs r5, #0xff
	ldrb r1, [r3, #7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhi _02002A78
	strb r6, [r2]
	subs r2, #1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r1, [r3, #6]
	ands r0, r5
	cmp r1, r0
	bhi _02002A22
	strb r6, [r2]
_02002A22:
	ldrh r5, [r3, #4]
	ldrh r1, [r4, #0x2e]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02002A52
	ldrb r0, [r2]
	cmp r0, #0
	bne _02002A40
	ldr r0, [r3, #8]
	b _02002A5E
	.align 2, 0
_02002A3C: .4byte gUnknown_03002240
_02002A40:
	ldr r1, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r1, r1, r0
	ldrb r0, [r2]
	subs r0, #1
	muls r0, r5, r0
	adds r1, r1, r0
	str r1, [r4]
	b _02002A60
_02002A52:
	ldr r0, [r4, #4]
	ldr r1, [r3, #0xc]
	adds r0, r0, r1
	ldrb r1, [r2]
	muls r1, r5, r1
	adds r0, r0, r1
_02002A5E:
	str r0, [r4]
_02002A60:
	strh r5, [r4, #8]
	ldr r1, _02002A80 @ =gUnknown_03002780
	ldr r2, _02002A84 @ =gUnknown_03002A64
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
_02002A78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02002A80: .4byte gUnknown_03002780
_02002A84: .4byte gUnknown_03002A64

	thumb_func_start sub_02002A88
sub_02002A88: @ 0x02002A88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r2, r0
	cmp r2, #0
	beq _02002A9C
	movs r0, #0
	b _02002BA2
_02002A9C:
	adds r3, r4, #0
	adds r3, #0x21
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r1, [r3]
	adds r6, r0, #0
	ldrb r0, [r6]
	cmp r1, r0
	bne _02002AB6
	ldrh r0, [r4, #0x1e]
	ldrh r1, [r4, #0xa]
	cmp r0, r1
	beq _02002ACC
_02002AB6:
	strh r2, [r4, #8]
	ldrb r0, [r6]
	strb r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x1e]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _02002AE4 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_02002ACC:
	ldrh r1, [r4, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _02002AE8
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, r1, r0
	strh r0, [r4, #0x1c]
	b _02002BA0
	.align 2, 0
_02002AE4: .4byte 0xFFFFBFFF
_02002AE8:
	ldr r0, _02002B8C @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	bge _02002B52
	ldr r7, _02002B90 @ =gUnknown_02014F88
_02002B0C:
	mvns r0, r0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_02014CD0
	adds r1, r0, #0
	cmp r1, #1
	beq _02002B46
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02002B94
	ldr r0, _02002B8C @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	adds r5, r1, #0
_02002B46:
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	blt _02002B0C
_02002B52:
	ldr r0, [r3]
	lsls r0, r0, #8
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r0, [r4, #0x1c]
	ldr r2, [r3, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _02002B98
	ldr r0, _02002B8C @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	b _02002B9A
	.align 2, 0
_02002B8C: .4byte gUnknown_03002774
_02002B90: .4byte gUnknown_02014F88
_02002B94:
	adds r0, r1, #0
	b _02002BA2
_02002B98:
	str r2, [r4, #0xc]
_02002B9A:
	ldrh r0, [r4, #0x14]
	adds r0, #2
	strh r0, [r4, #0x14]
_02002BA0:
	movs r0, #1
_02002BA2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_02002BA8
sub_02002BA8: @ 0x02002BA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	mov r8, r0
	mov r1, sp
	str r1, [sp, #0x10]
_02002BBC:
	mov r2, r8
	lsls r0, r2, #2
	ldr r1, _02002C74 @ =gUnknown_03002260
	adds r1, #1
	adds r4, r0, r1
	ldr r6, _02002C78 @ =gUnknown_03002263
	adds r6, r0, r6
	str r6, [sp, #0xc]
	ldrb r1, [r4]
	ldrb r2, [r6]
	mov ip, r2
	mov sl, r0
	cmp r1, ip
	bne _02002BEE
	ldr r0, _02002C74 @ =gUnknown_03002260
	add r0, sl
	ldr r1, _02002C7C @ =gUnknown_03002262
	add r1, sl
	ldrb r0, [r0]
	mov r7, r8
	adds r7, #1
	ldrb r1, [r1]
	cmp r0, r1
	bne _02002BEE
	b _02002DDA
_02002BEE:
	ldr r2, _02002C80 @ =gUnknown_03002290
	mov r6, r8
	lsls r3, r6, #1
	adds r0, r3, r2
	ldrh r6, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrb r4, [r4]
	ldr r0, _02002C74 @ =gUnknown_03002260
	add r0, sl
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r7, r2, #0
	adds r2, r3, #0
	mov r0, r8
	cmp r0, #1
	bls _02002D00
	ldr r0, _02002C84 @ =gUnknown_03002820
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _02002D00
	ldr r1, [sp, #8]
	adds r5, r5, r1
	lsrs r2, r6, #0xe
	movs r0, #0x80
	lsls r0, r0, #0xd
	lsls r0, r2
	lsrs r3, r0, #0x10
	mov r2, ip
	cmp r2, #0xff
	bne _02002C90
	ldr r0, _02002C88 @ =gUnknown_03004D60
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	ldr r2, _02002C8C @ =0x040000D4
	str r1, [r2]
	str r0, [r2, #4]
	ldr r6, [sp, #0xc]
	ldrb r0, [r6]
	subs r0, r0, r4
	muls r0, r3, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r1, #0x81
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	add r2, sp, #4
	mov sb, r2
	b _02002D58
	.align 2, 0
_02002C74: .4byte gUnknown_03002260
_02002C78: .4byte gUnknown_03002263
_02002C7C: .4byte gUnknown_03002262
_02002C80: .4byte gUnknown_03002290
_02002C84: .4byte gUnknown_03002820
_02002C88: .4byte gUnknown_03004D60
_02002C8C: .4byte 0x040000D4
_02002C90:
	add r6, sp, #4
	mov sb, r6
	mov r7, r8
	adds r7, #1
	cmp r4, ip
	bls _02002C9E
	b _02002DC4
_02002C9E:
	ldr r0, _02002CF4 @ =gUnknown_03004D60
	add r0, r8
	mov ip, r0
	ldr r2, _02002CF8 @ =0x040000D4
	ldr r1, _02002CFC @ =gUnknown_03002262
	add r1, sl
	mov r8, r1
	ldr r6, [sp, #0xc]
	str r6, [sp, #0x14]
_02002CB0:
	mov r0, ip
	ldrb r1, [r0]
	lsls r0, r1, #8
	orrs r1, r0
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, r8
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, #1
	asrs r1, r0, #1
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	movs r6, #0x81
	lsls r6, r6, #0x18
	orrs r1, r6
	str r1, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r4, r0
	bls _02002CB0
	b _02002DC4
	.align 2, 0
_02002CF4: .4byte gUnknown_03004D60
_02002CF8: .4byte 0x040000D4
_02002CFC: .4byte gUnknown_03002262
_02002D00:
	ldr r1, [sp, #8]
	lsls r0, r1, #1
	adds r5, r5, r0
	movs r3, #0x20
	adds r0, r2, r7
	ldrh r0, [r0]
	lsrs r2, r0, #0xe
	subs r0, r2, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02002D1A
	movs r3, #0x40
_02002D1A:
	ldr r1, _02002D60 @ =gUnknown_03002262
	add r1, sl
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _02002D70
	ldr r0, _02002D64 @ =gUnknown_03004D60
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r3, #1
	muls r0, r4, r0
	adds r0, r5, r0
	ldr r2, [sp, #0x10]
	strh r1, [r2]
	mov r6, sp
	ldr r1, _02002D68 @ =0x040000D4
	str r6, [r1]
	str r0, [r1, #4]
	ldr r0, _02002D6C @ =gUnknown_03002263
	add r0, sl
	ldrb r0, [r0]
	subs r0, r0, r4
	muls r0, r3, r0
	lsls r0, r0, #1
	asrs r0, r0, #1
	movs r2, #0x81
	lsls r2, r2, #0x18
	orrs r0, r2
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add r6, sp, #4
	mov sb, r6
_02002D58:
	mov r7, r8
	adds r7, #1
	b _02002DC4
	.align 2, 0
_02002D60: .4byte gUnknown_03002262
_02002D64: .4byte gUnknown_03004D60
_02002D68: .4byte 0x040000D4
_02002D6C: .4byte gUnknown_03002263
_02002D70:
	ldr r0, _02002DF8 @ =gUnknown_03002263
	add r0, sl
	add r2, sp, #4
	mov sb, r2
	mov r7, r8
	adds r7, #1
	ldrb r6, [r0]
	cmp r4, r6
	bhi _02002DC4
	ldr r2, _02002DFC @ =gUnknown_03004D60
	add r8, r2
	ldr r2, _02002E00 @ =0x040000D4
	mov ip, r1
	str r0, [sp, #0x14]
	lsls r3, r3, #1
_02002D8E:
	mov r6, r8
	ldrb r1, [r6]
	adds r0, r4, #0
	muls r0, r3, r0
	adds r0, r5, r0
	ldr r6, [sp, #0x10]
	strh r1, [r6]
	mov r1, sp
	str r1, [r2]
	str r0, [r2, #4]
	mov r6, ip
	ldrb r0, [r6]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, #1
	movs r6, #0x81
	lsls r6, r6, #0x18
	orrs r0, r6
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r4, r0
	bls _02002D8E
_02002DC4:
	movs r0, #0
	str r0, [sp, #4]
	mov r1, sb
	ldr r2, _02002E00 @ =0x040000D4
	str r1, [r2]
	ldr r0, _02002E04 @ =gUnknown_03002260
	add r0, sl
	str r0, [r2, #4]
	ldr r0, _02002E08 @ =0x85000001
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_02002DDA:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _02002DE6
	b _02002BBC
_02002DE6:
	movs r0, #1
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02002DF8: .4byte gUnknown_03002263
_02002DFC: .4byte gUnknown_03004D60
_02002E00: .4byte 0x040000D4
_02002E04: .4byte gUnknown_03002260
_02002E08: .4byte 0x85000001

	thumb_func_start sub_02002E0C
sub_02002E0C: @ 0x02002E0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	ldr r0, [sp, #0x24]
	ldr r7, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	movs r5, #0
	ldr r1, _02002EAC @ =gUnknown_03002290
	lsrs r0, r0, #0x17
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r0, #0xc
	ands r0, r4
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	mov r8, r0
	movs r0, #0xf8
	lsls r0, r0, #5
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	lsrs r3, r3, #0xa
	adds r0, r0, r3
	lsrs r2, r2, #0xf
	adds r6, r0, r2
	ldrb r0, [r7]
	cmp r0, #0
	beq _02002E98
_02002E5E:
	lsls r4, r5, #5
	ldr r0, [sp]
	adds r4, r0, r4
	adds r0, r7, r5
	ldrb r0, [r0]
	subs r0, #0x30
	lsls r0, r0, #5
	add r0, sl
	adds r1, r4, #0
	movs r2, #8
	bl sub_02014CB0
	mov r2, r8
	subs r4, r4, r2
	lsls r4, r4, #0xb
	lsrs r4, r4, #0x10
	lsls r1, r5, #1
	adds r1, r6, r1
	mov r2, sb
	lsls r0, r2, #0xc
	orrs r4, r0
	strh r4, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _02002E5E
_02002E98:
	lsls r0, r5, #5
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02002EAC: .4byte gUnknown_03002290

	thumb_func_start sub_02002EB0
sub_02002EB0: @ 0x02002EB0
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002EBC
sub_02002EBC: @ 0x02002EBC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _02002F10
	ldr r1, [r4, #4]
	ldr r2, _02002F18 @ =0x040000D4
	ldr r0, _02002F1C @ =gUnknown_03002774
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _02002F20 @ =gUnknown_03002860
	adds r0, r0, r1
	str r0, [r2, #4]
	ldrh r0, [r4, #8]
	asrs r0, r0, #1
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _02002F24 @ =gUnknown_03001820
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
_02002F10:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02002F18: .4byte 0x040000D4
_02002F1C: .4byte gUnknown_03002774
_02002F20: .4byte gUnknown_03002860
_02002F24: .4byte gUnknown_03001820

	thumb_func_start sub_02002F28
sub_02002F28: @ 0x02002F28
	ldr r2, [r0, #4]
	ldrh r0, [r1, #0x14]
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr

	thumb_func_start sub_02002F34
sub_02002F34: @ 0x02002F34
	ldr r0, [r1, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r0, r2
	str r0, [r1, #0x10]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_02002F44
sub_02002F44: @ 0x02002F44
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002F50
sub_02002F50: @ 0x02002F50
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002F5C
sub_02002F5C: @ 0x02002F5C
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002F68
sub_02002F68: @ 0x02002F68
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002F74
sub_02002F74: @ 0x02002F74
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	rsbs r0, r0, #0
	bx lr

	thumb_func_start sub_02002F80
sub_02002F80: @ 0x02002F80
	ldrh r2, [r1, #0x14]
	adds r2, #4
	strh r2, [r1, #0x14]
	bx lr

	thumb_func_start sub_02002F88
sub_02002F88: @ 0x02002F88
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002F94
sub_02002F94: @ 0x02002F94
	ldrh r0, [r1, #0x14]
	adds r0, #2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02002FA0
sub_02002FA0: @ 0x02002FA0
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r6, #0
	ldr r1, _02002FD0 @ =gUnknown_020159B8
	mov r0, sp
	movs r2, #8
	bl sub_02014E5C
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r0, r1, #0
	orrs r0, r2
	cmp r0, #0
	bne _02002FD4
	movs r0, #1
	rsbs r0, r0, #0
	b _02003056
	.align 2, 0
_02002FD0: .4byte gUnknown_020159B8
_02002FD4:
	cmp r1, #0
	bgt _02002FE0
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #4
_02002FE0:
	cmp r2, #0
	bgt _02002FF0
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_02002FF0:
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	cmp r2, r1
	blt _02003010
	lsls r0, r1, #0x17
	lsrs r5, r0, #0x10
	cmp r2, #0
	bne _02003008
	adds r2, r5, #0
	b _0200302E
_02003008:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r1, r2, #0
	b _02003026
_02003010:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r2, #0x17
	lsrs r4, r0, #0x10
	cmp r1, #0
	bne _02003022
	adds r2, r4, #0
	b _0200302E
_02003022:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
_02003026:
	bl sub_02014D04
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0200302E:
	mov r0, sp
	adds r3, r0, r6
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02003048
	movs r1, #0x80
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
_02003048:
	ldrb r1, [r3]
	lsls r1, r1, #7
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
_02003056:
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02003060
sub_02003060: @ 0x02003060
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r6, #0
	movs r5, #0
_0200306A:
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_02014CB8
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	subs r1, r4, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r5, #2
	lsls r1, r0
	orrs r6, r1
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bls _0200306A
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020030A0
sub_020030A0: @ 0x020030A0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x21
	adds r2, r4, #0
	adds r2, #0x20
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _020030BC
	ldrh r0, [r4, #0x1e]
	ldrh r1, [r4, #0xa]
	cmp r0, r1
	beq _020030D4
_020030BC:
	movs r1, #0
	strh r1, [r4, #8]
	ldrb r0, [r2]
	strb r0, [r3]
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #0x1e]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, [r4, #0x10]
	ldr r1, _020030E4 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r4, #0x10]
_020030D4:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _020030E8
	movs r0, #0
	b _020031C2
	.align 2, 0
_020030E4: .4byte 0xFFFFBFFF
_020030E8:
	ldrh r1, [r4, #0x1c]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _02003100
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, r1, r0
	strh r0, [r4, #0x1c]
	b _020031C0
_02003100:
	ldr r0, _020031AC @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	adds r6, r1, #0
	cmp r0, #0
	bge _02003170
	ldr r7, _020031B0 @ =gUnknown_020159C0
_0200312A:
	mvns r0, r0
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_02014CD0
	adds r1, r0, #0
	cmp r1, #1
	beq _02003164
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _020031B4
	ldr r0, _020031AC @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	adds r5, r2, #0
_02003164:
	ldrh r0, [r4, #0x14]
	lsls r0, r0, #2
	adds r3, r5, r0
	ldr r0, [r3]
	cmp r0, #0
	blt _0200312A
_02003170:
	ldr r0, [r3]
	lsls r0, r0, #8
	ldrh r1, [r4, #0x1c]
	adds r0, r0, r1
	strh r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r1, [r1]
	lsls r1, r1, #4
	subs r0, r0, r1
	strh r0, [r4, #0x1c]
	ldr r2, [r3, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _020031B8
	ldr r0, _020031AC @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r4, #0xa]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	b _020031BA
	.align 2, 0
_020031AC: .4byte gUnknown_03002774
_020031B0: .4byte gUnknown_020159C0
_020031B4:
	adds r0, r1, #0
	b _020031C2
_020031B8:
	str r2, [r4, #0xc]
_020031BA:
	ldrh r0, [r4, #0x14]
	adds r0, #2
	strh r0, [r4, #0x14]
_020031C0:
	movs r0, #1
_020031C2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_020031C8
sub_020031C8: @ 0x020031C8
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	bne _02003224
	ldr r1, [r2, #4]
	cmp r1, #0
	bge _020031FC
	ldr r0, _020031F8 @ =gUnknown_03002774
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0, #0x14]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [r2, #8]
	lsls r0, r0, #6
	b _0200320C
	.align 2, 0
_020031F8: .4byte gUnknown_03002774
_020031FC:
	ldr r0, _0200322C @ =gUnknown_03002774
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0x10]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [r2, #8]
	lsls r0, r0, #5
_0200320C:
	strh r0, [r3, #8]
	ldr r1, _02003230 @ =gUnknown_03002780
	ldr r2, _02003234 @ =gUnknown_03002A64
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r3, [r0]
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
_02003224:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0200322C: .4byte gUnknown_03002774
_02003230: .4byte gUnknown_03002780
_02003234: .4byte gUnknown_03002A64

	thumb_func_start sub_02003238
sub_02003238: @ 0x02003238
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r3, [r0, #4]
	movs r1, #0xf
	ands r3, r1
	ldrh r1, [r4, #0x14]
	adds r1, #3
	strh r1, [r4, #0x14]
	ldr r2, _02003274 @ =0x040000D4
	adds r1, r0, #4
	str r1, [r2]
	lsls r3, r3, #3
	adds r1, r3, #0
	adds r1, #0x28
	adds r1, r4, r1
	str r1, [r2, #4]
	ldr r1, _02003278 @ =0x84000002
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0200327C
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0]
	b _020032E0
	.align 2, 0
_02003274: .4byte 0x040000D4
_02003278: .4byte 0x84000002
_0200327C:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _020032B0
	adds r2, r4, r3
	movs r0, #0x2d
	adds r0, r0, r2
	mov ip, r0
	adds r2, #0x2f
	ldrb r1, [r0]
	ldrb r0, [r2]
	eors r1, r0
	mov r5, ip
	strb r1, [r5]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r5]
	eors r0, r1
	rsbs r0, r0, #0
	strb r0, [r5]
	ldrb r0, [r2]
	rsbs r0, r0, #0
	strb r0, [r2]
_020032B0:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _020032E0
	adds r2, r4, r3
	adds r3, r2, #0
	adds r3, #0x2c
	adds r2, #0x2e
	ldrb r1, [r3]
	ldrb r0, [r2]
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	rsbs r0, r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	rsbs r0, r0, #0
	strb r0, [r2]
_020032E0:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_020032E8
sub_020032E8: @ 0x020032E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0xb
	ldr r0, _020033A0 @ =gUnknown_03004D76
	adds r6, r6, r0
	movs r0, #0x80
	lsls r0, r0, #9
	mov sl, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	bl sub_02014CB8
	ldr r7, _020033A4 @ =gUnknown_02014FB8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	mov sb, r1
	mov r1, sb
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	mov sb, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	asrs r0, r0, #8
	strh r0, [r6]
	mov r0, sl
	mov r1, r8
	bl sub_02014CB8
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6, #8]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	adds r1, r5, #0
	bl sub_02014CB8
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	asrs r1, r1, #6
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6, #0x10]
	mov r0, sl
	adds r1, r5, #0
	bl sub_02014CB8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020033A0: .4byte gUnknown_03004D76
_020033A4: .4byte gUnknown_02014FB8

	thumb_func_start sub_020033A8
sub_020033A8: @ 0x020033A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	adds r6, r1, #0
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _020033C4
	b _020035F2
_020033C4:
	mov r8, r1
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _0200355C @ =gUnknown_03004D76
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28]
	ldr r2, _02003560 @ =gUnknown_02014FB8
	ldrh r0, [r6]
	ldr r1, _02003564 @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r7, [sp, #0x28]
	strh r0, [r7]
	movs r0, #0xa
	add r0, sp
	mov sl, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	mov r1, sl
	strh r0, [r1]
	add r7, sp, #0xc
	ldrh r0, [r6, #2]
	strh r0, [r7]
	movs r2, #0xe
	add r2, sp
	mov sb, r2
	ldrh r0, [r6, #4]
	strh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	mov r2, sl
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	mov r2, sl
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sb
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	ldr r2, [sp, #0x28]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	ldrh r0, [r6, #2]
	movs r3, #2
	ldrsh r5, [r6, r3]
	cmp r5, #0
	bge _020034AE
	rsbs r0, r0, #0
	strh r0, [r7]
_020034AE:
	movs r1, #4
	ldrsh r0, [r6, r1]
	ldrh r2, [r6, #4]
	mov ip, r2
	cmp r0, #0
	bge _020034C2
	mov r3, ip
	rsbs r0, r3, #0
	mov r1, sb
	strh r0, [r1]
_020034C2:
	mov r2, sp
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	mov r4, sp
	adds r4, #2
	mov r0, sl
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	add r3, sp, #4
	mov r2, sl
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r7, sb
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	mov r2, sp
	adds r2, #6
	ldr r0, [sp, #0x28]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	add r0, sp, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	movs r1, #0
	strh r1, [r0]
	add r0, sp, #0x1c
	strh r1, [r0]
	adds r0, #2
	movs r7, #0x80
	lsls r7, r7, #1
	strh r7, [r0]
	movs r1, #6
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x10]
	movs r7, #8
	ldrsh r0, [r6, r7]
	str r0, [sp, #0x14]
	adds r6, r4, #0
	adds r7, r3, #0
	mov sb, r2
	cmp r5, #0
	ble _02003568
	mov r0, r8
	ldrh r4, [r0, #8]
	ldrh r2, [r0, #4]
	b _02003576
	.align 2, 0
_0200355C: .4byte gUnknown_03004D76
_02003560: .4byte gUnknown_02014FB8
_02003564: .4byte 0x000003FF
_02003568:
	mov r2, r8
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_02003576:
	mov r3, ip
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _02003586
	mov r0, r8
	ldrh r3, [r0, #0xa]
	ldrh r5, [r0, #6]
	b _02003594
_02003586:
	mov r3, r8
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_02003594:
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	mov r7, sb
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x24]
	strh r0, [r1, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r1, #0x18]
_020035F2:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02003604
sub_02003604: @ 0x02003604
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x24]
	adds r7, r1, #0
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02003620
	b _0200394C
_02003620:
	mov sb, r1
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _020038A0 @ =gUnknown_03004D76
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28]
	ldrh r0, [r7]
	ldr r3, _020038A4 @ =gUnknown_03001924
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r2, _020038A8 @ =0x000003FF
	ands r0, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r6, _020038AC @ =gUnknown_02014FB8
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	movs r3, #0xa
	add r3, sp
	mov r8, r3
	ldrh r0, [r7]
	ldr r5, _020038A4 @ =gUnknown_03001924
	ldrh r1, [r5]
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r3]
	add r6, sp, #0xc
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r2, _020038B0 @ =gUnknown_030017D0
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	movs r3, #0xe
	add r3, sp
	mov sl, r3
	movs r5, #4
	ldrsh r1, [r7, r5]
	ldr r2, _020038B4 @ =gUnknown_03005374
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _02003738
	movs r2, #2
	ldrsh r0, [r7, r2]
	rsbs r0, r0, #0
	ldr r3, _020038B0 @ =gUnknown_030017D0
	ldrh r1, [r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
_02003738:
	movs r4, #4
	ldrsh r0, [r7, r4]
	ldr r5, _020038B4 @ =gUnknown_03005374
	ldrh r3, [r5]
	ldrh r2, [r7, #4]
	mov r1, sp
	strh r2, [r1, #0x34]
	cmp r0, #0
	bge _0200375C
	movs r4, #4
	ldrsh r0, [r7, r4]
	rsbs r0, r0, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	mov r5, sl
	strh r0, [r5]
	ldr r0, _020038B4 @ =gUnknown_03005374
	ldrh r3, [r0]
_0200375C:
	mov r2, sp
	ldr r4, [sp, #0x28]
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	mov r5, sp
	adds r5, #2
	str r5, [sp, #0x30]
	mov r0, r8
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]
	add r1, sp, #4
	mov ip, r1
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r4, sl
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	mov r5, ip
	strh r0, [r5]
	mov r6, sp
	adds r6, #6
	str r6, [sp, #0x38]
	ldr r0, [sp, #0x28]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r6]
	add r5, sp, #0x18
	ldr r1, _020038A4 @ =gUnknown_03001924
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r4, _020038AC @ =gUnknown_02014FB8
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r6, _020038B0 @ =gUnknown_030017D0
	ldrh r1, [r6]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]
	mov r2, sp
	adds r2, #0x1a
	ldr r1, _020038A4 @ =gUnknown_03001924
	ldrh r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r0, [r0, r4]
	rsbs r0, r0, #0
	asrs r0, r0, #6
	ldrh r1, [r6]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	add r4, sp, #0x1c
	ldr r6, _020038A4 @ =gUnknown_03001924
	ldrh r0, [r6]
	lsls r0, r0, #1
	ldr r1, _020038AC @ =gUnknown_02014FB8
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	strh r0, [r4]
	mov r3, sp
	adds r3, #0x1e
	ldrh r0, [r6]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r6, _020038B4 @ =gUnknown_03005374
	ldrh r1, [r6]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #6
	ldrsh r1, [r7, r5]
	muls r1, r0, r1
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r6, #8
	ldrsh r2, [r7, r6]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _020038B8 @ =gUnknown_0300192C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x10]
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #6
	ldrsh r1, [r7, r4]
	muls r1, r0, r1
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #8
	ldrsh r2, [r7, r5]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _020038BC @ =gUnknown_03002800
	movs r6, #0
	ldrsh r0, [r0, r6]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	ldr r7, [sp, #0x30]
	mov r8, ip
	ldr r6, [sp, #0x38]
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _020038C0
	mov r1, sb
	ldrh r4, [r1, #8]
	ldrh r2, [r1, #4]
	b _020038CE
	.align 2, 0
_020038A0: .4byte gUnknown_03004D76
_020038A4: .4byte gUnknown_03001924
_020038A8: .4byte 0x000003FF
_020038AC: .4byte gUnknown_02014FB8
_020038B0: .4byte gUnknown_030017D0
_020038B4: .4byte gUnknown_03005374
_020038B8: .4byte gUnknown_0300192C
_020038BC: .4byte gUnknown_03002800
_020038C0:
	mov r2, sb
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_020038CE:
	mov r3, sp
	ldrh r3, [r3, #0x34]
	lsls r0, r3, #0x10
	cmp r0, #0
	ble _020038E0
	mov r5, sb
	ldrh r3, [r5, #0xa]
	ldrh r5, [r5, #6]
	b _020038EE
_020038E0:
	mov r0, sb
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_020038EE:
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x24]
	strh r0, [r2, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r2, #0x18]
_0200394C:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200395C
sub_0200395C: @ 0x0200395C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r0, [sp, #0x24]
	adds r6, r1, #0
	ldr r1, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02003978
	b _02003D20
_02003978:
	mov sb, r1
	add r2, sp, #0x20
	ldr r1, [sp, #0x24]
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r2]
	ldrh r4, [r2]
	lsls r4, r4, #5
	ldr r0, _02003C70 @ =gUnknown_03004D76
	adds r4, r4, r0
	subs r2, #0x18
	str r2, [sp, #0x28]
	ldrh r0, [r6]
	ldr r3, _02003C74 @ =gUnknown_03001924
	ldrh r1, [r3]
	adds r0, r0, r1
	ldr r2, _02003C78 @ =0x000003FF
	ands r0, r2
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r7, _02003C7C @ =gUnknown_02014FB8
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r1, [sp, #0x28]
	strh r0, [r1]
	movs r3, #0xa
	add r3, sp
	mov r8, r3
	ldrh r0, [r6]
	ldr r5, _02003C74 @ =gUnknown_03001924
	ldrh r1, [r5]
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	strh r0, [r3]
	add r7, sp, #0xc
	movs r0, #2
	ldrsh r1, [r6, r0]
	ldr r2, _02003C80 @ =gUnknown_030017D0
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7]
	movs r3, #0xe
	add r3, sp
	mov sl, r3
	movs r5, #4
	ldrsh r1, [r6, r5]
	ldr r2, _02003C84 @ =gUnknown_03005374
	ldrh r0, [r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r5, #0x80
	lsls r5, r5, #9
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	ldr r3, [sp, #0x28]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4]
	ldrh r1, [r7]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #8]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x10]
	mov r3, sl
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl sub_02014CB8
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _02003A90
	movs r2, #2
	ldrsh r0, [r6, r2]
	rsbs r0, r0, #0
	ldr r3, _02003C80 @ =gUnknown_030017D0
	ldrh r1, [r3]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r7]
_02003A90:
	movs r4, #4
	ldrsh r0, [r6, r4]
	ldr r5, _02003C84 @ =gUnknown_03005374
	ldrh r4, [r5]
	ldrh r2, [r6, #4]
	mov r1, sp
	strh r2, [r1, #0x3c]
	cmp r0, #0
	bge _02003AB2
	movs r3, #4
	ldrsh r0, [r6, r3]
	rsbs r0, r0, #0
	muls r0, r4, r0
	asrs r0, r0, #8
	mov r4, sl
	strh r0, [r4]
	ldrh r4, [r5]
_02003AB2:
	mov r2, sp
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2]
	mov r0, sp
	adds r0, #2
	str r0, [sp, #0x30]
	mov r2, r8
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	rsbs r1, r1, #0
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	ldr r3, [sp, #0x30]
	strh r0, [r3]
	mov r5, sp
	adds r5, #4
	str r5, [sp, #0x34]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, sl
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r5]
	mov r3, sp
	adds r3, #6
	str r3, [sp, #0x38]
	ldr r5, [sp, #0x28]
	ldrh r1, [r5]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	add r0, sp, #0x18
	mov r8, r0
	ldr r1, _02003C74 @ =gUnknown_03001924
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r3, _02003C7C @ =gUnknown_02014FB8
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r5, _02003C80 @ =gUnknown_030017D0
	ldrh r1, [r5]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r3, _02003C88 @ =gUnknown_03005378
	movs r5, #0
	ldrsh r1, [r3, r5]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	mov r1, r8
	strh r0, [r1]
	movs r2, #0x1a
	add r2, sp
	mov ip, r2
	ldr r5, _02003C74 @ =gUnknown_03001924
	ldrh r0, [r5]
	lsls r0, r0, #1
	ldr r1, _02003C7C @ =gUnknown_02014FB8
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r0, r0, #0
	asrs r0, r0, #6
	ldr r5, _02003C80 @ =gUnknown_030017D0
	ldrh r1, [r5]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r3, r7]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	mov r1, ip
	strh r0, [r1]
	add r5, sp, #0x1c
	ldr r2, _02003C74 @ =gUnknown_03001924
	ldrh r0, [r2]
	lsls r0, r0, #1
	ldr r7, _02003C7C @ =gUnknown_02014FB8
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r2, r0, #0
	muls r2, r4, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r3, r4]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r5]
	mov r4, sp
	adds r4, #0x1e
	ldr r7, _02003C74 @ =gUnknown_03001924
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _02003C7C @ =gUnknown_02014FB8
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	ldr r7, _02003C84 @ =gUnknown_03005374
	ldrh r1, [r7]
	adds r2, r0, #0
	muls r2, r1, r2
	lsls r2, r2, #8
	asrs r2, r2, #0x10
	mov r1, sl
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #0
	ldrsh r1, [r3, r7]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r0, [r4]
	mov r1, r8
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #6
	ldrsh r1, [r6, r2]
	muls r1, r0, r1
	mov r3, ip
	ldrh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r7, #8
	ldrsh r2, [r6, r7]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _02003C8C @ =gUnknown_0300192C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x10]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #6
	ldrsh r1, [r6, r3]
	muls r1, r0, r1
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #8
	ldrsh r2, [r6, r4]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, _02003C90 @ =gUnknown_03002800
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #8
	adds r1, r1, r0
	asrs r1, r1, #8
	str r1, [sp, #0x14]
	ldr r6, [sp, #0x30]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x38]
	mov r8, r0
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	ble _02003C94
	mov r2, sb
	ldrh r4, [r2, #8]
	ldrh r2, [r2, #4]
	b _02003CA2
	.align 2, 0
_02003C70: .4byte gUnknown_03004D76
_02003C74: .4byte gUnknown_03001924
_02003C78: .4byte 0x000003FF
_02003C7C: .4byte gUnknown_02014FB8
_02003C80: .4byte gUnknown_030017D0
_02003C84: .4byte gUnknown_03005374
_02003C88: .4byte gUnknown_03005378
_02003C8C: .4byte gUnknown_0300192C
_02003C90: .4byte gUnknown_03002800
_02003C94:
	mov r3, sb
	ldrh r1, [r3, #4]
	ldrh r0, [r3, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
_02003CA2:
	mov r5, sp
	ldrh r5, [r5, #0x3c]
	lsls r0, r5, #0x10
	cmp r0, #0
	ble _02003CB4
	mov r0, sb
	ldrh r3, [r0, #0xa]
	ldrh r5, [r0, #6]
	b _02003CC2
_02003CB4:
	mov r3, sb
	ldrh r1, [r3, #6]
	ldrh r0, [r3, #0xa]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
_02003CC2:
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsrs r2, r2, #1
	subs r4, r4, r2
	adds r1, r0, #0
	muls r1, r4, r1
	ldrh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsrs r5, r5, #1
	subs r3, r3, r5
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r2, r2, #8
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r0, [sp, #0x10]
	subs r0, r0, r1
	str r0, [sp, #0x10]
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, #0
	muls r1, r4, r1
	mov r4, r8
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r3, r0
	adds r1, r1, r0
	lsls r5, r5, #8
	adds r1, r1, r5
	asrs r1, r1, #8
	ldr r0, [sp, #0x14]
	subs r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r5, [sp, #0x24]
	strh r0, [r5, #0x16]
	ldr r0, [sp, #0x14]
	strh r0, [r5, #0x18]
_02003D20:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_02003D30
sub_02003D30: @ 0x02003D30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r2, [r7, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _02003D4A
	b _02004034
_02003D4A:
	mov r8, r2
	ldrh r1, [r2, #2]
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
	movs r1, #0x16
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r3, #0x18
	ldrsh r2, [r7, r3]
	mov sl, r2
	ldr r2, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _02003D82
	ldr r0, _02003DB8 @ =gUnknown_030017D4
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r3, [sp]
	subs r3, r3, r1
	str r3, [sp]
	movs r5, #2
	ldrsh r0, [r0, r5]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
_02003D82:
	mov r3, r8
	ldrh r3, [r3, #4]
	str r3, [sp, #4]
	mov r5, r8
	ldrh r5, [r5, #6]
	str r5, [sp, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _02003DBC
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _02003E0E
	lsrs r0, r3, #1
	ldr r1, [sp]
	subs r1, r1, r0
	str r1, [sp]
	lsrs r0, r5, #1
	mov r2, sl
	subs r2, r2, r0
	mov sl, r2
	lsls r3, r3, #1
	str r3, [sp, #4]
	lsls r5, r5, #1
	str r5, [sp, #8]
	b _02003E0E
	.align 2, 0
_02003DB8: .4byte gUnknown_030017D4
_02003DBC:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _02003DD8
	mov r3, r8
	movs r5, #0xa
	ldrsh r0, [r3, r5]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	mov r2, sl
	subs r2, r2, r0
	mov sl, r2
	b _02003DE4
_02003DD8:
	mov r3, r8
	movs r5, #0xa
	ldrsh r0, [r3, r5]
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
_02003DE4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _02003E02
	mov r2, r8
	movs r3, #8
	ldrsh r0, [r2, r3]
	ldr r5, [sp, #4]
	subs r0, r5, r0
	ldr r1, [sp]
	subs r1, r1, r0
	str r1, [sp]
	b _02003E0E
_02003E02:
	mov r2, r8
	movs r3, #8
	ldrsh r0, [r2, r3]
	ldr r5, [sp]
	subs r5, r5, r0
	str r5, [sp]
_02003E0E:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r1, r2
	cmp r0, #0
	bge _02003E1A
	b _02004034
_02003E1A:
	cmp r1, #0xf0
	ble _02003E20
	b _02004034
_02003E20:
	ldr r0, [sp, #8]
	add r0, sl
	cmp r0, #0
	bge _02003E2A
	b _02004034
_02003E2A:
	mov r3, sl
	cmp r3, #0xa0
	ble _02003E32
	b _02004034
_02003E32:
	ldr r0, _02003F10 @ =gUnknown_030026B0
	ldrh r0, [r0]
	lsrs r0, r0, #8
	str r0, [sp, #0x10]
	movs r5, #0
	str r5, [sp, #0xc]
	mov r0, r8
	ldrh r0, [r0, #2]
	cmp r5, r0
	blo _02003E48
	b _02004034
_02003E48:
	ldr r0, _02003F14 @ =gUnknown_03002774
	ldr r1, [r0]
	ldrh r0, [r7, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	ldrh r0, [r7, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_020043FC
	adds r4, r0, #0
	ldr r0, _02003F18 @ =gUnknown_030057D8
	ldr r0, [r0]
	cmp r0, r4
	bne _02003E72
	b _02004034
_02003E72:
	ldr r3, [sp, #0xc]
	cmp r3, #0
	bne _02003E84
	ldr r0, _02003F1C @ =gUnknown_030018D0
	ldrb r0, [r0]
	subs r0, #1
	adds r1, r7, #0
	adds r1, #0x23
	strb r0, [r1]
_02003E84:
	ldr r2, _02003F20 @ =0x040000D4
	mov r0, r8
	ldrb r1, [r0, #1]
	ldr r3, [sp, #0xc]
	adds r1, r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r5, r0
	str r0, [r2]
	str r4, [r2, #4]
	ldr r0, _02003F24 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrh r1, [r4, #2]
	ldr r5, _02003F28 @ =0x000001FF
	adds r0, r5, #0
	adds r2, r0, #0
	ands r2, r1
	mov sb, r2
	ldrh r2, [r4]
	ldrb r3, [r4]
	mov ip, r3
	movs r0, #0xfe
	lsls r0, r0, #8
	adds r5, r0, #0
	ands r5, r1
	movs r6, #0
	strh r5, [r4, #2]
	adds r3, r0, #0
	ands r3, r2
	strh r3, [r4]
	adds r0, r7, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	ldr r2, [r7, #0x10]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _02003F2C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	orrs r2, r6
	strh r2, [r4]
	ldr r0, [r7, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _02003EFE
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r2, r0
	strh r2, [r4]
_02003EFE:
	ldr r0, [r7, #0x10]
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #9
	ldrh r1, [r4, #2]
	orrs r0, r1
	strh r0, [r4, #2]
	b _02003FA0
	.align 2, 0
_02003F10: .4byte gUnknown_030026B0
_02003F14: .4byte gUnknown_03002774
_02003F18: .4byte gUnknown_030057D8
_02003F1C: .4byte gUnknown_030018D0
_02003F20: .4byte 0x040000D4
_02003F24: .4byte 0x80000003
_02003F28: .4byte 0x000001FF
_02003F2C:
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r3, #0
	ands r0, r1
	lsrs r3, r0, #0xc
	adds r0, r5, #0
	ands r0, r1
	lsrs r0, r0, #0xe
	orrs r3, r0
	lsrs r1, r2, #0xb
	movs r6, #1
	mov r2, r8
	ldrb r0, [r2]
	lsrs r0, r0, #1
	eors r0, r1
	ands r0, r6
	cmp r0, #0
	beq _02003F70
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4, #2]
	ldr r0, _02004044 @ =gUnknown_020159F0
	lsls r1, r3, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	mov r2, ip
	subs r2, r0, r2
	mov ip, r2
_02003F70:
	ldr r0, [r7, #0x10]
	lsrs r0, r0, #0xa
	ands r0, r6
	mov r5, r8
	ldrb r2, [r5]
	adds r1, r6, #0
	ands r1, r2
	cmp r0, r1
	beq _02003FA0
	ldrh r0, [r4, #2]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4, #2]
	ldr r1, _02004044 @ =gUnknown_020159F0
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	mov r5, sb
	subs r5, r0, r5
	mov sb, r5
_02003FA0:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02003FBE
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _02003FBE
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_02003FBE:
	ldr r2, [r7, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrh r0, [r4]
	orrs r2, r0
	strh r2, [r4]
	ldr r0, [r7, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r3, r0, #2
	ldrh r0, [r4, #4]
	orrs r3, r0
	strh r3, [r4, #4]
	mov r0, sl
	add r0, ip
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r0, [sp]
	add r0, sb
	ldr r5, _02004048 @ =0x000001FF
	adds r1, r5, #0
	ands r0, r1
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r2, r0
	cmp r2, #0
	beq _02004012
	ldr r0, _0200404C @ =0x000003FF
	adds r1, r0, #0
	adds r0, r3, #0
	ands r0, r1
	adds r0, r3, r0
	strh r0, [r4, #4]
_02004012:
	ldr r0, [r7, #4]
	ldr r1, _02004050 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r3, r8
	ldrh r3, [r3, #2]
	cmp r0, r3
	bhs _02004034
	b _02003E48
_02004034:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02004044: .4byte gUnknown_020159F0
_02004048: .4byte 0x000001FF
_0200404C: .4byte 0x000003FF
_02004050: .4byte 0xF9FF0000

	thumb_func_start sub_02004054
sub_02004054: @ 0x02004054
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	str r1, [sp, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	ldr r2, [r0, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _02004076
	b _020043D0
_02004076:
	mov sl, r2
	ldrh r1, [r2, #2]
	mov r0, r8
	adds r0, #0x24
	strb r1, [r0]
	mov r1, r8
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [sp]
	movs r4, #0x18
	ldrsh r0, [r1, r4]
	str r0, [sp, #4]
	ldr r3, [r1, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r3
	cmp r0, #0
	beq _020040B0
	ldr r2, _020040F0 @ =gUnknown_030017D4
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
	movs r4, #2
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
_020040B0:
	mov r0, sl
	ldrh r0, [r0, #4]
	str r0, [sp, #0x10]
	mov r1, sl
	ldrh r1, [r1, #6]
	str r1, [sp, #0x14]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _020040F4
	movs r0, #0x40
	ands r3, r0
	cmp r3, #0
	beq _0200413C
	ldr r2, [sp, #0x10]
	lsrs r1, r2, #1
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
	mov r4, sl
	ldrh r1, [r4, #6]
	lsrs r1, r1, #1
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	lsls r2, r2, #1
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x14]
	lsls r0, r0, #1
	str r0, [sp, #0x14]
	b _0200413C
	.align 2, 0
_020040F0: .4byte gUnknown_030017D4
_020040F4:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r3, r0
	cmp r3, #0
	beq _0200410A
	mov r2, sl
	movs r4, #0xa
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #0x14]
	subs r1, r0, r1
	b _02004110
_0200410A:
	mov r2, sl
	movs r4, #0xa
	ldrsh r1, [r2, r4]
_02004110:
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #4]
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _02004130
	mov r2, sl
	movs r4, #8
	ldrsh r1, [r2, r4]
	ldr r0, [sp, #0x10]
	subs r1, r0, r1
	b _02004136
_02004130:
	mov r2, sl
	movs r4, #8
	ldrsh r1, [r2, r4]
_02004136:
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp]
_0200413C:
	mov r0, r8
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	ldr r0, [sp]
	subs r0, r0, r1
	str r0, [sp, #0x24]
	mov r4, r8
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #4]
	subs r0, r0, r1
	str r0, [sp, #0x28]
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	cmp r0, #0
	bge _02004160
	b _020043D0
_02004160:
	ldr r0, [sp]
	cmp r0, #0xf0
	ble _02004168
	b _020043D0
_02004168:
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x14]
	adds r0, r0, r2
	cmp r0, #0
	bge _02004174
	b _020043D0
_02004174:
	ldr r0, [sp, #4]
	cmp r0, #0xa0
	ble _0200417C
	b _020043D0
_0200417C:
	movs r4, #0
	str r4, [sp, #0x18]
	mov r0, sl
	ldrh r0, [r0, #2]
	cmp r4, r0
	blo _0200418A
	b _020043D0
_0200418A:
	ldr r0, _02004244 @ =gUnknown_03002774
	ldr r1, [r0]
	mov r2, r8
	ldrh r0, [r2, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldrh r0, [r2, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_020043FC
	adds r6, r0, #0
	ldr r0, _02004248 @ =gUnknown_030057D8
	ldr r0, [r0]
	cmp r0, r6
	bne _020041B6
	b _020043D0
_020041B6:
	ldr r2, _0200424C @ =0x040000D4
	mov r0, sl
	ldrb r1, [r0, #1]
	ldr r0, [sp, #0x18]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	str r0, [r2]
	str r6, [r2, #4]
	ldr r0, _02004250 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrh r1, [r6, #2]
	ldr r2, _02004254 @ =0x000001FF
	adds r0, r2, #0
	adds r4, r0, #0
	ands r4, r1
	str r4, [sp, #0x1c]
	ldrh r0, [r6]
	ldrb r2, [r6]
	str r2, [sp, #0x20]
	movs r3, #0xfe
	lsls r3, r3, #8
	ands r3, r1
	movs r4, #0
	strh r3, [r6, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r2, r0
	strh r2, [r6]
	mov r0, r8
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	adds r0, r0, r1
	strh r0, [r6, #4]
	mov r0, r8
	ldr r5, [r0, #0x10]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _02004258
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r2, r0
	orrs r2, r4
	strh r2, [r6]
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _02004232
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	orrs r2, r0
	strh r2, [r6]
_02004232:
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #9
	ldrh r1, [r6, #2]
	orrs r0, r1
	strh r0, [r6, #2]
	b _020042CE
	.align 2, 0
_02004244: .4byte gUnknown_03002774
_02004248: .4byte gUnknown_030057D8
_0200424C: .4byte 0x040000D4
_02004250: .4byte 0x80000003
_02004254: .4byte 0x000001FF
_02004258:
	movs r1, #0xc0
	lsls r1, r1, #8
	adds r0, r2, #0
	ands r0, r1
	lsrs r4, r0, #0xc
	adds r0, r3, #0
	ands r0, r1
	lsrs r0, r0, #0xe
	orrs r4, r0
	lsrs r1, r5, #0xb
	movs r5, #1
	mov r2, sl
	ldrb r0, [r2]
	lsrs r0, r0, #1
	eors r0, r1
	ands r0, r5
	cmp r0, #0
	beq _0200429C
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r6, #2]
	ldr r0, _020043E0 @ =gUnknown_020159F0
	lsls r1, r4, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	ldr r1, [sp, #0x14]
	subs r0, r1, r0
	ldr r2, [sp, #0x20]
	subs r2, r0, r2
	str r2, [sp, #0x20]
_0200429C:
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsrs r0, r0, #0xa
	ands r0, r5
	mov r1, sl
	ldrb r2, [r1]
	adds r1, r5, #0
	ands r1, r2
	cmp r0, r1
	beq _020042CE
	ldrh r0, [r6, #2]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r6, #2]
	ldr r1, _020043E0 @ =gUnknown_020159F0
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r4, [sp, #0x10]
	subs r0, r4, r0
	ldr r1, [sp, #0x1c]
	subs r1, r0, r1
	str r1, [sp, #0x1c]
_020042CE:
	mov r4, r8
	ldr r2, [r4, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrh r0, [r6]
	orrs r2, r0
	strh r2, [r6]
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r3, r0, #2
	ldrh r0, [r6, #4]
	orrs r3, r0
	strh r3, [r6, #4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r6]
	ldr r0, [sp]
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	ldr r4, _020043E4 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	strh r0, [r6, #2]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ands r2, r0
	cmp r2, #0
	beq _02004328
	ldr r0, _020043E8 @ =0x000003FF
	adds r1, r0, #0
	adds r0, r3, #0
	ands r0, r1
	adds r0, r3, r0
	strh r0, [r6, #4]
_02004328:
	mov r1, r8
	ldr r0, [r1, #4]
	ldr r2, _020043EC @ =0xF9FF0000
	adds r0, r0, r2
	lsrs r0, r0, #5
	ldrh r4, [r6, #4]
	adds r0, r0, r4
	strh r0, [r6, #4]
	movs r7, #0
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bhs _020043BC
	ldr r1, _020043F0 @ =0x040000D4
	mov sb, r1
_02004344:
	mov r2, r8
	ldrh r0, [r2, #0x1a]
	movs r4, #0xf8
	lsls r4, r4, #3
	adds r1, r4, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_020043FC
	adds r5, r0, #0
	ldr r0, _020043F4 @ =gUnknown_030057D8
	ldr r0, [r0]
	cmp r0, r6
	beq _020043D0
	mov r0, sb
	str r6, [r0]
	str r5, [r0, #4]
	ldr r0, _020043F8 @ =0x80000003
	mov r1, sb
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r4, [r5, #2]
	movs r2, #0xfe
	lsls r2, r2, #8
	ands r4, r2
	strh r4, [r5, #2]
	ldrh r2, [r5]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r5]
	lsls r3, r7, #2
	ldr r0, [sp, #8]
	adds r3, r3, r0
	ldrh r0, [r3, #2]
	ldr r1, [sp, #0x28]
	adds r0, r0, r1
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r5]
	ldrh r0, [r3]
	ldr r2, [sp, #0x24]
	adds r0, r0, r2
	ldr r1, [sp, #0x1c]
	adds r0, r0, r1
	ldr r2, _020043E4 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	adds r4, r4, r0
	strh r4, [r5, #2]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r4, [sp, #0xc]
	cmp r7, r4
	blo _02004344
_020043BC:
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	mov r1, sl
	ldrh r1, [r1, #2]
	cmp r0, r1
	bhs _020043D0
	b _0200418A
_020043D0:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020043E0: .4byte gUnknown_020159F0
_020043E4: .4byte 0x000001FF
_020043E8: .4byte 0x000003FF
_020043EC: .4byte 0xF9FF0000
_020043F0: .4byte 0x040000D4
_020043F4: .4byte gUnknown_030057D8
_020043F8: .4byte 0x80000003

	thumb_func_start sub_020043FC
sub_020043FC: @ 0x020043FC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x1f
	bls _02004408
	movs r5, #0x1f
_02004408:
	ldr r0, _0200441C @ =gUnknown_030018D0
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	bge _02004424
	ldr r0, _02004420 @ =gUnknown_030057D8
	ldr r0, [r0]
	b _02004480
	.align 2, 0
_0200441C: .4byte gUnknown_030018D0
_02004420: .4byte gUnknown_030057D8
_02004424:
	ldr r0, _02004448 @ =gUnknown_03001830
	adds r2, r5, r0
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _02004454
	ldr r1, _0200444C @ =gUnknown_030022B0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0, #6]
	ldrb r0, [r4]
	strb r0, [r2]
	ldr r0, _02004450 @ =gUnknown_03004D40
	adds r0, r5, r0
	ldrb r1, [r4]
	strb r1, [r0]
	b _02004472
	.align 2, 0
_02004448: .4byte gUnknown_03001830
_0200444C: .4byte gUnknown_030022B0
_02004450: .4byte gUnknown_03004D40
_02004454:
	ldr r3, _02004488 @ =gUnknown_030022B0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r3
	movs r1, #0xff
	strb r1, [r0, #6]
	ldr r2, _0200448C @ =gUnknown_03004D40
	adds r2, r5, r2
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r4]
	strb r1, [r0, #6]
	ldrb r0, [r4]
	strb r0, [r2]
_02004472:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, r0, #3
	ldr r1, _02004490 @ =gUnknown_030022A8
	adds r0, r0, r1
_02004480:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_02004488: .4byte gUnknown_030022B0
_0200448C: .4byte gUnknown_03004D40
_02004490: .4byte gUnknown_030022A8

	thumb_func_start sub_02004494
sub_02004494: @ 0x02004494
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r5, _02004544 @ =gUnknown_03004D70
	movs r0, #0
	mov sb, r0
	movs r3, #0
	ldr r1, _02004548 @ =gUnknown_03002AC0
	mov sl, r1
	mov r2, sp
	adds r2, #8
	str r2, [sp, #0xc]
_020044B2:
	ldr r1, _0200454C @ =gUnknown_03001830
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	adds r6, r3, #1
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _020044FA
	ldr r4, _02004550 @ =0x040000D4
	mov r8, r1
	ldr r0, _02004554 @ =gUnknown_030026F0
	mov ip, r0
	ldr r7, _02004558 @ =gUnknown_030022B0
_020044D0:
	asrs r2, r2, #0x18
	lsls r3, r2, #3
	adds r3, r3, r7
	str r3, [r4]
	str r5, [r4, #4]
	ldr r0, _0200455C @ =0x80000003
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r5, #8
	add r2, ip
	mov r1, sb
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	strb r1, [r2]
	ldrb r0, [r3, #6]
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	cmp r0, r8
	bne _020044D0
_020044FA:
	adds r3, r6, #0
	cmp r3, #0x1f
	ble _020044B2
	ldr r2, _02004560 @ =gUnknown_03001820
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0200456C
	ldr r0, _02004564 @ =gUnknown_030018D0
	ldrb r3, [r0]
	lsls r0, r3, #3
	ldr r1, _02004544 @ =gUnknown_03004D70
	adds r5, r0, r1
	mov r2, sl
	ldrb r0, [r2]
	cmp r3, r0
	bge _020045F8
	mov r4, sp
	movs r1, #0x80
	lsls r1, r1, #2
	adds r7, r1, #0
	ldr r1, _02004550 @ =0x040000D4
	ldr r6, _02004568 @ =0x81000003
_0200452C:
	strh r7, [r4]
	mov r0, sp
	str r0, [r1]
	str r5, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r5, #8
	adds r3, #1
	ldrb r0, [r2]
	cmp r3, r0
	blt _0200452C
	b _020045F8
	.align 2, 0
_02004544: .4byte gUnknown_03004D70
_02004548: .4byte gUnknown_03002AC0
_0200454C: .4byte gUnknown_03001830
_02004550: .4byte 0x040000D4
_02004554: .4byte gUnknown_030026F0
_02004558: .4byte gUnknown_030022B0
_0200455C: .4byte 0x80000003
_02004560: .4byte gUnknown_03001820
_02004564: .4byte gUnknown_030018D0
_02004568: .4byte 0x81000003
_0200456C:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _020045F4
	ldr r1, _020045E0 @ =gUnknown_030018D0
	ldrb r0, [r1]
	subs r3, r0, #1
	lsls r0, r3, #3
	ldr r2, _020045E4 @ =gUnknown_03004D70
	adds r5, r0, r2
	cmp r3, #0
	blt _020045A6
	ldr r2, _020045E8 @ =0x040000D4
	ldr r6, _020045EC @ =0x80000003
	ldr r0, _020045E4 @ =gUnknown_03004D70
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r1, r5, #0
_02004594:
	str r1, [r2]
	str r4, [r2, #4]
	str r6, [r2, #8]
	ldr r0, [r2, #8]
	subs r1, #8
	subs r3, #1
	subs r4, #8
	cmp r3, #0
	bge _02004594
_020045A6:
	ldr r2, _020045E0 @ =gUnknown_030018D0
	ldrb r1, [r2]
	movs r0, #0x80
	subs r0, r0, r1
	mov r1, sl
	strb r0, [r1]
	movs r3, #0
	ldrb r0, [r1]
	cmp r3, r0
	bge _020045F8
	mov r5, sp
	movs r2, #0x80
	lsls r2, r2, #2
	adds r7, r2, #0
	ldr r1, _020045E8 @ =0x040000D4
	adds r4, r0, #0
	ldr r6, _020045F0 @ =0x81000003
	ldr r2, _020045E4 @ =gUnknown_03004D70
_020045CA:
	strh r7, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, #4]
	str r6, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, #8
	adds r3, #1
	cmp r3, r4
	blt _020045CA
	b _020045F8
	.align 2, 0
_020045E0: .4byte gUnknown_030018D0
_020045E4: .4byte gUnknown_03004D70
_020045E8: .4byte 0x040000D4
_020045EC: .4byte 0x80000003
_020045F0: .4byte 0x81000003
_020045F4:
	mov r1, sl
	strb r0, [r1]
_020045F8:
	movs r0, #0
	ldr r2, _0200462C @ =gUnknown_030018D0
	strb r0, [r2]
	ldr r1, _02004630 @ =gUnknown_03001820
	ldr r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _02004640
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r5, _02004634 @ =0x05000008
	ldr r1, _02004638 @ =gUnknown_03001830
	adds r2, r5, #0
	bl CpuSet
	str r4, [sp, #8]
	ldr r1, _0200463C @ =gUnknown_03004D40
	ldr r0, [sp, #0xc]
	adds r2, r5, #0
	bl CpuSet
	b _02004664
	.align 2, 0
_0200462C: .4byte gUnknown_030018D0
_02004630: .4byte gUnknown_03001820
_02004634: .4byte 0x05000008
_02004638: .4byte gUnknown_03001830
_0200463C: .4byte gUnknown_03004D40
_02004640:
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #8]
	ldr r0, _02004674 @ =0x040000D4
	ldr r2, [sp, #0xc]
	str r2, [r0]
	ldr r2, _02004678 @ =gUnknown_03001830
	str r2, [r0, #4]
	ldr r2, _0200467C @ =0x85000008
	str r2, [r0, #8]
	ldr r3, [r0, #8]
	str r1, [sp, #8]
	ldr r1, [sp, #0xc]
	str r1, [r0]
	ldr r1, _02004680 @ =gUnknown_03004D40
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_02004664:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02004674: .4byte 0x040000D4
_02004678: .4byte gUnknown_03001830
_0200467C: .4byte 0x85000008
_02004680: .4byte gUnknown_03004D40

	thumb_func_start sub_02004684
sub_02004684: @ 0x02004684
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #0x14]
	adds r0, #3
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	bne _020046D8
	ldr r1, [r4, #4]
	ldr r2, _020046E0 @ =0x040000D4
	ldr r0, _020046E4 @ =gUnknown_03002774
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xa]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _020046E8 @ =gUnknown_03002040
	adds r0, r0, r1
	str r0, [r2, #4]
	ldrh r0, [r4, #8]
	asrs r0, r0, #1
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r2, _020046EC @ =gUnknown_03001820
	ldr r0, [r2]
	movs r1, #2
	orrs r0, r1
	str r0, [r2]
_020046D8:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020046E0: .4byte 0x040000D4
_020046E4: .4byte gUnknown_03002774
_020046E8: .4byte gUnknown_03002040
_020046EC: .4byte gUnknown_03001820

	thumb_func_start sub_020046F0
sub_020046F0: @ 0x020046F0
	ldr r2, [r0, #4]
	ldrh r0, [r1, #0x14]
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr

	thumb_func_start sub_020046FC
sub_020046FC: @ 0x020046FC
	ldr r0, [r1, #0x10]
	movs r2, #0x80
	lsls r2, r2, #7
	orrs r0, r2
	str r0, [r1, #0x10]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_0200470C
sub_0200470C: @ 0x0200470C
	push {lr}
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r0, [r0, #4]
	bl m4aSongNumStart
	movs r0, #1
	pop {r1}
	bx r1

	thumb_func_start sub_02004720
sub_02004720: @ 0x02004720
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	ldrh r3, [r1, #0x16]
	adds r2, r2, r3
	strh r2, [r1, #0x16]
	ldrh r0, [r0, #6]
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	strh r0, [r1, #0x18]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_0200473C
sub_0200473C: @ 0x0200473C
	ldrh r0, [r1, #0x14]
	adds r0, #3
	strh r0, [r1, #0x14]
	movs r0, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_02004748
sub_02004748: @ 0x02004748
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldrh r2, [r0, #4]
	strh r2, [r1, #0xa]
	adds r3, r1, #0
	adds r3, #0x21
	movs r2, #0xff
	strb r2, [r3]
	ldrh r0, [r0, #6]
	adds r1, #0x20
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_02004768
sub_02004768: @ 0x02004768
	ldrh r2, [r1, #0x14]
	adds r2, #4
	strh r2, [r1, #0x14]
	bx lr

	thumb_func_start sub_02004770
sub_02004770: @ 0x02004770
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldr r2, [r1, #0x10]
	ldr r3, _02004788 @ =0xFFFFCFFF
	ands r2, r3
	ldr r0, [r0, #4]
	lsls r0, r0, #0xc
	orrs r2, r0
	str r2, [r1, #0x10]
	movs r0, #1
	bx lr
	.align 2, 0
_02004788: .4byte 0xFFFFCFFF

	thumb_func_start sub_0200478C
sub_0200478C: @ 0x0200478C
	ldrh r2, [r1, #0x14]
	adds r2, #2
	strh r2, [r1, #0x14]
	ldr r0, [r0, #4]
	lsls r0, r0, #6
	strh r0, [r1, #0x1a]
	movs r0, #1
	bx lr

	thumb_func_start sub_0200479C
sub_0200479C: @ 0x0200479C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r0, r5, #3
	lsrs r5, r0, #2
	movs r4, #0
	ldr r1, _020047D8 @ =gUnknown_03001868
	ldrh r0, [r1]
	lsrs r0, r0, #2
	mov sb, r1
	cmp r4, r0
	bhs _0200483A
	ldr r0, _020047DC @ =gUnknown_03005170
	mov r8, r0
_020047BE:
	lsls r1, r4, #1
	mov r2, r8
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r2, #0
	bne _02004820
	movs r3, #0
	ldr r7, _020047D8 @ =gUnknown_03001868
	mov ip, r7
	ldr r0, _020047DC @ =gUnknown_03005170
	mov sl, r0
	ldr r6, _020047E0 @ =gUnknown_030057D8
	b _020047EA
	.align 2, 0
_020047D8: .4byte gUnknown_03001868
_020047DC: .4byte gUnknown_03005170
_020047E0: .4byte gUnknown_030057D8
_020047E4:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_020047EA:
	cmp r3, r5
	bhs _02004808
	adds r2, r4, r3
	mov r7, ip
	ldrh r0, [r7]
	lsrs r0, r0, #2
	cmp r2, r0
	blt _020047FE
	ldr r0, [r6]
	b _0200483E
_020047FE:
	lsls r0, r2, #1
	add r0, sl
	ldrh r0, [r0]
	cmp r0, #0
	beq _020047E4
_02004808:
	cmp r3, r5
	bne _0200482A
	mov r2, r8
	adds r0, r1, r2
	strh r5, [r0]
	ldr r0, _0200481C @ =gUnknown_03001920
	lsls r1, r4, #7
	ldr r0, [r0]
	adds r0, r0, r1
	b _0200483E
	.align 2, 0
_0200481C: .4byte gUnknown_03001920
_02004820:
	ldr r7, _0200484C @ =0x0000FFFF
	adds r0, r4, r7
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0200482A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r1, sb
	ldrh r0, [r1]
	lsrs r0, r0, #2
	cmp r4, r0
	blo _020047BE
_0200483A:
	ldr r0, _02004850 @ =gUnknown_030057D8
	ldr r0, [r0]
_0200483E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200484C: .4byte 0x0000FFFF
_02004850: .4byte gUnknown_030057D8

	thumb_func_start sub_02004854
sub_02004854: @ 0x02004854
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _02004870 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _02004874 @ =gUnknown_03005170
	str r0, [r1, #4]
	ldr r0, _02004878 @ =0x81000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	add sp, #4
	bx lr
	.align 2, 0
_02004870: .4byte 0x040000D4
_02004874: .4byte gUnknown_03005170
_02004878: .4byte 0x81000100

	thumb_func_start sub_0200487C
sub_0200487C: @ 0x0200487C
	push {lr}
	adds r1, r0, #0
	ldr r0, _020048A0 @ =gUnknown_030057D8
	ldr r0, [r0]
	cmp r0, r1
	beq _0200489C
	ldr r0, _020048A4 @ =gUnknown_03001920
	ldr r0, [r0]
	subs r0, r1, r0
	lsls r0, r0, #9
	lsrs r0, r0, #0x10
	ldr r1, _020048A8 @ =gUnknown_03005170
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_0200489C:
	pop {r0}
	bx r0
	.align 2, 0
_020048A0: .4byte gUnknown_030057D8
_020048A4: .4byte gUnknown_03001920
_020048A8: .4byte gUnknown_03005170

	thumb_func_start sub_020048AC
sub_020048AC: @ 0x020048AC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, [sp, #0x18]
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _02004914 @ =gUnknown_03001820
	ldr r1, [r2]
	movs r3, #4
	orrs r1, r3
	str r1, [r2]
	ldr r1, _02004918 @ =gUnknown_03002858
	lsrs r0, r0, #0x16
	ldr r2, _0200491C @ =0x04000010
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, _02004920 @ =gUnknown_03002A60
	strb r3, [r0]
	cmp r5, r7
	bhs _0200490C
	ldr r2, _02004924 @ =0x000001FF
	adds r1, r6, #0
	ands r1, r2
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [sp]
	ldr r2, _02004928 @ =0x040000D4
	mov r0, sp
	str r0, [r2]
	ldr r0, _0200492C @ =gUnknown_03001864
	lsls r1, r5, #2
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2, #4]
	subs r0, r7, r5
	movs r1, #0x85
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0200490C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02004914: .4byte gUnknown_03001820
_02004918: .4byte gUnknown_03002858
_0200491C: .4byte 0x04000010
_02004920: .4byte gUnknown_03002A60
_02004924: .4byte 0x000001FF
_02004928: .4byte 0x040000D4
_0200492C: .4byte gUnknown_03001864

	thumb_func_start sub_02004930
sub_02004930: @ 0x02004930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _020049E4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov sl, r0
	ldr r0, _020049E8 @ =gUnknown_03002840
	mov r8, r0
	ldrh r5, [r0, #8]
	movs r3, #0x80
	lsls r3, r3, #5
	mov r1, sl
	lsls r3, r1
	ands r5, r3
	movs r4, #0
	ldr r2, _020049EC @ =gUnknown_03005528
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020049BE
	ldr r0, _020049F0 @ =gUnknown_03001930
	movs r6, #1
	ldr r0, [r0]
	mov ip, r0
	movs r2, #0xa0
	lsls r2, r2, #7
	mov sb, r2
	adds r7, r3, #0
_02004974:
	adds r0, r6, #0
	lsls r0, r4
	mov r1, ip
	ands r0, r1
	cmp r0, #0
	beq _02004A3A
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _020049F4 @ =gUnknown_03001870
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, sb
	bne _020049A8
	movs r2, #0
	cmp r5, #0
	bne _02004998
	movs r2, #1
_02004998:
	movs r3, #0
	ldrh r0, [r1, #8]
	ands r0, r7
	cmp r0, #0
	bne _020049A4
	movs r3, #1
_020049A4:
	cmp r2, r3
	bne _02004A3A
_020049A8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bhi _020049BE
	ldr r2, _020049EC @ =gUnknown_03005528
	ldrb r0, [r2]
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	bne _02004974
_020049BE:
	ldr r0, _020049F8 @ =gUnknown_030053EC
	ldr r3, _020049FC @ =gUnknown_030053D0
	ldrb r4, [r3]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004A0C
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _02004A00 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _02004A04 @ =gUnknown_0300284E
	str r0, [r1, #4]
	ldr r0, _02004A08 @ =0x81000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _02004A3A
	.align 2, 0
_020049E4: .4byte 0x04000128
_020049E8: .4byte gUnknown_03002840
_020049EC: .4byte gUnknown_03005528
_020049F0: .4byte gUnknown_03001930
_020049F4: .4byte gUnknown_03001870
_020049F8: .4byte gUnknown_030053EC
_020049FC: .4byte gUnknown_030053D0
_02004A00: .4byte 0x040000D4
_02004A04: .4byte gUnknown_0300284E
_02004A08: .4byte 0x81000003
_02004A0C:
	ldr r2, _02004A4C @ =0x040000D4
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r1, _02004A50 @ =gUnknown_03005480
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _02004A54 @ =gUnknown_0300284E
	str r0, [r2, #4]
	ldr r0, _02004A58 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #5
	mov r1, sl
	lsls r0, r1
	mov r2, r8
	ldrh r1, [r2, #8]
	eors r0, r1
	strh r0, [r2, #8]
_02004A3A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02004A4C: .4byte 0x040000D4
_02004A50: .4byte gUnknown_03005480
_02004A54: .4byte gUnknown_0300284E
_02004A58: .4byte 0x80000003

	thumb_func_start sub_02004A5C
sub_02004A5C: @ 0x02004A5C
	push {r4, r5, r6, r7, lr}
	ldr r0, _02004A74 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r6, r0, #0x1e
	ldr r7, _02004A78 @ =gUnknown_03002840
	movs r5, #0
	cmp r5, r6
	beq _02004ADA
	ldr r0, _02004A7C @ =gUnknown_03005528
	ldrb r0, [r0]
	b _02004AEE
	.align 2, 0
_02004A74: .4byte 0x04000128
_02004A78: .4byte gUnknown_03002840
_02004A7C: .4byte gUnknown_03005528
_02004A80:
	ldr r0, _02004AFC @ =gUnknown_03001930
	movs r1, #1
	lsls r1, r5
	ldr r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02004ADA
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _02004B00 @ =gUnknown_03001870
	adds r3, r0, r1
	ldrh r1, [r3]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	bne _02004ADA
	ldrh r1, [r3, #8]
	movs r4, #0x80
	lsls r4, r4, #5
	lsls r4, r5
	ands r1, r4
	ldrh r0, [r7, #8]
	ands r0, r4
	cmp r1, r0
	beq _02004ADA
	ldrb r0, [r3, #0xe]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _02004AD4
	ldr r0, _02004B04 @ =gUnknown_02015A08
	ldrb r1, [r3, #0xe]
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_02014CD0
_02004AD4:
	ldrh r0, [r7, #8]
	eors r4, r0
	strh r4, [r7, #8]
_02004ADA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	bhi _02004AF6
	cmp r5, r6
	beq _02004ADA
	ldr r0, _02004B08 @ =gUnknown_03005528
	ldrb r0, [r0]
	asrs r0, r5
_02004AEE:
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _02004A80
_02004AF6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02004AFC: .4byte gUnknown_03001930
_02004B00: .4byte gUnknown_03001870
_02004B04: .4byte gUnknown_02015A08
_02004B08: .4byte gUnknown_03005528

	thumb_func_start sub_02004B0C
sub_02004B0C: @ 0x02004B0C
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r1, _02004BA0 @ =gRoomEventQueue
	movs r2, #0xc0
	lsls r2, r2, #0x12
	ldr r4, _02004BA4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	adds r0, r0, r2
	ldr r0, [r0, #0x5c]
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _02004B98
	ldr r0, _02004BA8 @ =gUnknown_030056C0
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02004B98
	ldr r1, _02004BAC @ =gUnknown_0300542C
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02004B98
	ldrb r0, [r3, #0xf]
	cmp r0, #4
	bne _02004B98
	ldr r0, _02004BB0 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #4
	bne _02004B8E
	ldr r0, _02004BB4 @ =gUnknown_03005528
	ldrb r3, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r5
	ands r1, r3
	adds r0, r5, #4
	asrs r1, r0
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _02004B98
_02004B8E:
	ldr r0, _02004BB8 @ =gUnknown_03005544
	strb r6, [r0]
	movs r0, #0x17
	bl m4aSongNumStart
_02004B98:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02004BA0: .4byte gRoomEventQueue
_02004BA4: .4byte 0x04000128
_02004BA8: .4byte gUnknown_030056C0
_02004BAC: .4byte gUnknown_0300542C
_02004BB0: .4byte gUnknown_03005444
_02004BB4: .4byte gUnknown_03005528
_02004BB8: .4byte gUnknown_03005544

	thumb_func_start sub_02004BBC
sub_02004BBC: @ 0x02004BBC
	push {r4, lr}
	sub sp, #8
	ldr r0, _02004C14 @ =sub_02004930
	ldr r2, _02004C18 @ =0x0000FFFE
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r3, #0
	bl sub_0200198C
	str r4, [sp, #4]
	ldr r2, _02004C1C @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _02004C20 @ =gUnknown_03002840
	str r1, [r2, #4]
	ldr r1, _02004C24 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _02004C28 @ =gUnknown_03001870
	str r1, [r2, #4]
	ldr r1, _02004C2C @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _02004C30 @ =gUnknown_03005480
	str r1, [r2, #4]
	ldr r1, _02004C34 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r2, _02004C38 @ =gUnknown_030053EC
	ldr r1, _02004C3C @ =gUnknown_030053D0
	strb r4, [r1]
	strb r4, [r2]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02004C14: .4byte sub_02004930
_02004C18: .4byte 0x0000FFFE
_02004C1C: .4byte 0x040000D4
_02004C20: .4byte gUnknown_03002840
_02004C24: .4byte 0x85000005
_02004C28: .4byte gUnknown_03001870
_02004C2C: .4byte 0x85000014
_02004C30: .4byte gUnknown_03005480
_02004C34: .4byte 0x85000020
_02004C38: .4byte gUnknown_030053EC
_02004C3C: .4byte gUnknown_030053D0

	thumb_func_start sub_02004C40
sub_02004C40: @ 0x02004C40
	push {r4, lr}
	sub sp, #8
	ldr r0, _02004C98 @ =sub_02004A5C
	movs r4, #0
	str r4, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_0200198C
	str r4, [sp, #4]
	ldr r2, _02004C9C @ =0x040000D4
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _02004CA0 @ =gUnknown_03002840
	str r1, [r2, #4]
	ldr r1, _02004CA4 @ =0x85000005
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _02004CA8 @ =gUnknown_03001870
	str r1, [r2, #4]
	ldr r1, _02004CAC @ =0x85000014
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	str r4, [sp, #4]
	add r1, sp, #4
	str r1, [r2]
	ldr r1, _02004CB0 @ =gUnknown_03005480
	str r1, [r2, #4]
	ldr r1, _02004CB4 @ =0x85000020
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _02004CB8 @ =gUnknown_030053D0
	strb r4, [r1]
	ldr r1, _02004CBC @ =gUnknown_030053EC
	strb r4, [r1]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02004C98: .4byte sub_02004A5C
_02004C9C: .4byte 0x040000D4
_02004CA0: .4byte gUnknown_03002840
_02004CA4: .4byte 0x85000005
_02004CA8: .4byte gUnknown_03001870
_02004CAC: .4byte 0x85000014
_02004CB0: .4byte gUnknown_03005480
_02004CB4: .4byte 0x85000020
_02004CB8: .4byte gUnknown_030053D0
_02004CBC: .4byte gUnknown_030053EC

	thumb_func_start sub_02004CC0
sub_02004CC0: @ 0x02004CC0
	ldr r3, _02004CD4 @ =gUnknown_030053EC
	ldrb r1, [r3]
	lsls r0, r1, #3
	ldr r2, _02004CD8 @ =gUnknown_03005480
	adds r0, r0, r2
	adds r1, #1
	movs r2, #0xf
	ands r1, r2
	strb r1, [r3]
	bx lr
	.align 2, 0
_02004CD4: .4byte gUnknown_030053EC
_02004CD8: .4byte gUnknown_03005480

	thumb_func_start sub_02004CDC
sub_02004CDC: @ 0x02004CDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02004D40 @ =gUnknown_03005454
	ldr r0, [r0]
	cmp r0, #0
	beq _02004D3A
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _02004D3A
	subs r0, #8
	adds r2, r3, r0
	ldrb r1, [r4, #0x11]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r2, r2, r0
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _02004D32
	cmp r0, #1
	bne _02004D3A
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02004D3A
_02004D32:
	movs r1, #3
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
_02004D3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02004D40: .4byte gUnknown_03005454

	thumb_func_start sub_02004D44
sub_02004D44: @ 0x02004D44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02004D94 @ =gUnknown_03005454
	ldr r0, [r0]
	cmp r0, #0
	beq _02004D8C
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0, #4]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _02004D8C
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
_02004D8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02004D94: .4byte gUnknown_03005454

	thumb_func_start sub_02004D98
sub_02004D98: @ 0x02004D98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02004DE8 @ =gUnknown_03005454
	ldr r0, [r0]
	cmp r0, #0
	beq _02004DE0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0, #8]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _02004DE0
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	movs r2, #3
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
_02004DE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02004DE8: .4byte gUnknown_03005454

	thumb_func_start sub_02004DEC
sub_02004DEC: @ 0x02004DEC
	push {lr}
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r2, #4
	ldrsh r1, [r0, r2]
	ldrb r2, [r0, #0xf]
	adds r0, r3, #0
	bl sub_02011C18
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02004E04
sub_02004E04: @ 0x02004E04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02004E50 @ =gUnknown_03005454
	ldr r0, [r0]
	cmp r0, #0
	beq _02004E48
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _02004E48
	subs r1, #8
	adds r1, r3, r1
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #3
	subs r0, r0, r2
	adds r1, r1, r0
	ldrb r0, [r4, #0x12]
	strb r0, [r1, #4]
_02004E48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02004E50: .4byte gUnknown_03005454

	thumb_func_start sub_02004E54
sub_02004E54: @ 0x02004E54
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _02004ED4 @ =gUnknown_0300544C
	movs r0, #0
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	strb r0, [r1, #1]
	strb r0, [r1]
	ldr r1, _02004ED8 @ =gUnknown_03002250
	movs r4, #0
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r1, _02004EDC @ =gUnknown_030053D4
	strh r0, [r1]
	ldr r1, _02004EE0 @ =gUnknown_03001934
	movs r0, #1
	strb r0, [r1]
	ldr r2, _02004EE4 @ =gUnknown_03001820
	ldr r0, [r2]
	ldr r1, _02004EE8 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2]
	bl m4aSoundVSyncOn
	ldr r1, _02004EEC @ =gUnknown_03005444
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02004EF0 @ =gUnknown_03002240
	ldr r0, _02004EF4 @ =0x02033000
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _02004EF8 @ =gUnknown_03002774
	ldr r0, _02004EFC @ =0x02020000
	str r0, [r1]
	ldr r0, _02004F00 @ =gUnknown_030053AC
	strb r4, [r0]
	bl sub_02004F24
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl sub_02005A44
	adds r4, r0, #0
	bl sub_02004FAC
	adds r0, r4, #0
	bl sub_02004FF0
	adds r0, r4, #0
	bl sub_02005AA8
	cmp r5, #0
	beq _02004F04
	adds r0, r4, #0
	bl sub_02005B04
	movs r0, #3
	bl m4aSongNumStart
	b _02004F10
	.align 2, 0
_02004ED4: .4byte gUnknown_0300544C
_02004ED8: .4byte gUnknown_03002250
_02004EDC: .4byte gUnknown_030053D4
_02004EE0: .4byte gUnknown_03001934
_02004EE4: .4byte gUnknown_03001820
_02004EE8: .4byte 0xFFFFBFFF
_02004EEC: .4byte gUnknown_03005444
_02004EF0: .4byte gUnknown_03002240
_02004EF4: .4byte 0x02033000
_02004EF8: .4byte gUnknown_03002774
_02004EFC: .4byte 0x02020000
_02004F00: .4byte gUnknown_030053AC
_02004F04:
	adds r0, r4, #0
	bl sub_02005B5C
	movs r0, #1
	bl m4aSongNumStart
_02004F10:
	ldr r1, _02004F20 @ =gUnknown_030018C8
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02004F20: .4byte gUnknown_030018C8

	thumb_func_start sub_02004F24
sub_02004F24: @ 0x02004F24
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _02004F84 @ =gUnknown_03002820
	movs r4, #0x40
	strh r4, [r0]
	ldr r1, _02004F88 @ =gUnknown_03002290
	movs r2, #0
	movs r5, #0
	ldr r0, _02004F8C @ =0x00005E0B
	strh r0, [r1, #6]
	ldr r0, _02004F90 @ =0x00001C0C
	strh r0, [r1, #4]
	ldr r3, _02004F94 @ =gUnknown_03004D60
	movs r0, #0x7f
	strb r0, [r3, #2]
	ldr r0, _02004F98 @ =gUnknown_03002260
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	movs r1, #0xff
	strb r1, [r0, #0xa]
	movs r1, #0x20
	strb r1, [r0, #0xb]
	subs r1, #0x21
	strb r1, [r3, #3]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r1, [r0, #0xe]
	strb r4, [r0, #0xf]
	str r5, [sp]
	ldr r0, _02004F9C @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _02004FA0 @ =0x06009FE0
	str r1, [r0, #4]
	ldr r2, _02004FA4 @ =0x85000010
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r5, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _02004FA8 @ =0x0600CFE0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02004F84: .4byte gUnknown_03002820
_02004F88: .4byte gUnknown_03002290
_02004F8C: .4byte 0x00005E0B
_02004F90: .4byte 0x00001C0C
_02004F94: .4byte gUnknown_03004D60
_02004F98: .4byte gUnknown_03002260
_02004F9C: .4byte 0x040000D4
_02004FA0: .4byte 0x06009FE0
_02004FA4: .4byte 0x85000010
_02004FA8: .4byte 0x0600CFE0

	thumb_func_start sub_02004FAC
sub_02004FAC: @ 0x02004FAC
	push {lr}
	ldr r1, _02004FE8 @ =0x06008000
	str r1, [r0, #4]
	movs r3, #0
	movs r1, #0
	strh r1, [r0, #0xa]
	ldr r2, _02004FEC @ =0x0600F000
	str r2, [r0, #0xc]
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	movs r2, #5
	strh r2, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	strh r1, [r0, #0x24]
	movs r1, #0x1e
	strh r1, [r0, #0x26]
	movs r1, #0x19
	strh r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r3, [r1]
	movs r1, #3
	strh r1, [r0, #0x2e]
	bl sub_02001DE4
	pop {r0}
	bx r0
	.align 2, 0
_02004FE8: .4byte 0x06008000
_02004FEC: .4byte 0x0600F000

	thumb_func_start sub_02004FF0
sub_02004FF0: @ 0x02004FF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r5, #0
_02004FF8:
	lsls r1, r5, #0x10
	asrs r2, r1, #0x10
	ldr r0, _02005010 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r4, r1, #0
	cmp r2, r0
	bne _02005014
	movs r3, #0
	b _0200501C
	.align 2, 0
_02005010: .4byte 0x04000128
_02005014:
	ldr r1, _02005070 @ =gUnknown_02015B18
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
_0200501C:
	asrs r4, r4, #0x10
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, #0x80
	adds r0, r6, r0
	lsls r1, r4, #0xb
	ldr r2, _02005074 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x78
	str r2, [sp]
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x13
	movs r7, #0xa0
	lsls r7, r7, #0xd
	adds r2, r2, r7
	asrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r2, #0x80
	lsls r2, r2, #3
	str r2, [sp, #8]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	adds r2, r3, #0
	movs r3, #0
	bl sub_02005B90
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #3
	ble _02004FF8
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02005070: .4byte gUnknown_02015B18
_02005074: .4byte 0x06010000

	thumb_func_start sub_02005078
sub_02005078: @ 0x02005078
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r2, _020050F4 @ =gUnknown_03002820
	ldrh r0, [r2]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _020050F8 @ =gUnknown_03005528
	ldr r3, _020050FC @ =gUnknown_03001930
	ldr r0, [r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r2]
	ldr r0, _02005100 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _02005136
	movs r6, #0
	ldrb r0, [r2]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02005136
	movs r7, #1
	ldr r5, _02005104 @ =gUnknown_0300544C
_020050B6:
	adds r0, r7, #0
	lsls r0, r6
	ldr r4, [r3]
	ands r4, r0
	cmp r4, #0
	bne _02005120
	ldrb r0, [r5]
	adds r1, r0, #1
	strb r1, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _02005124
	movs r0, #0
	ldr r1, _02005108 @ =0x0000FFFF
	bl sub_02001D78
	ldr r1, _0200510C @ =gUnknown_03002AC4
	ldr r0, _02005110 @ =gUnknown_0300285C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _02005114 @ =gUnknown_03005370
	strb r4, [r0]
	ldr r1, _02005118 @ =gUnknown_03004D3C
	ldr r0, _0200511C @ =gUnknown_03002A64
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_020127D8
	b _02005342
	.align 2, 0
_020050F4: .4byte gUnknown_03002820
_020050F8: .4byte gUnknown_03005528
_020050FC: .4byte gUnknown_03001930
_02005100: .4byte gUnknown_03005444
_02005104: .4byte gUnknown_0300544C
_02005108: .4byte 0x0000FFFF
_0200510C: .4byte gUnknown_03002AC4
_02005110: .4byte gUnknown_0300285C
_02005114: .4byte gUnknown_03005370
_02005118: .4byte gUnknown_03004D3C
_0200511C: .4byte gUnknown_03002A64
_02005120:
	movs r0, #0
	strb r0, [r5]
_02005124:
	adds r5, #1
	adds r6, #1
	cmp r6, #3
	bhi _02005136
	ldrb r0, [r2]
	asrs r0, r6
	ands r0, r7
	cmp r0, #0
	bne _020050B6
_02005136:
	ldr r2, _02005150 @ =gUnknown_03002840
	ldr r4, _02005154 @ =0x00004010
	strh r4, [r2]
	ldr r0, [r3]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200515C
	ldr r0, _02005158 @ =gUnknown_030053AC
	ldrb r0, [r0]
	strb r0, [r2, #3]
	b _0200516A
	.align 2, 0
_02005150: .4byte gUnknown_03002840
_02005154: .4byte 0x00004010
_02005158: .4byte gUnknown_030053AC
_0200515C:
	ldr r2, _020051C8 @ =gUnknown_03001870
	ldrh r0, [r2]
	cmp r0, r4
	bne _0200516A
	ldr r1, _020051CC @ =gUnknown_030053AC
	ldrb r0, [r2, #3]
	strb r0, [r1]
_0200516A:
	ldr r0, _020051D0 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov r8, r0
	ldr r1, _020051D4 @ =gUnknown_030018C8
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #4]
	ldr r0, _020051D8 @ =gUnknown_03000430
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _02005240
	ldr r1, _020051DC @ =gUnknown_03000434
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0200521E
	movs r6, #0
	movs r7, #0
	ldr r0, _020051E0 @ =gUnknown_03000378
	adds r4, r3, r0
	ldr r1, _020051E4 @ =0x06012500
	subs r0, #8
	adds r5, r3, r0
	movs r2, #0x72
_020051AC:
	str r1, [r5, #4]
	strh r7, [r4, #0xe]
	strh r7, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	strh r7, [r4]
	ldr r0, _020051CC @ =gUnknown_030053AC
	ldrb r0, [r0]
	cmp r0, #1
	bne _020051E8
	movs r0, #0x71
	strh r0, [r4, #2]
	b _020051EA
	.align 2, 0
_020051C8: .4byte gUnknown_03001870
_020051CC: .4byte gUnknown_030053AC
_020051D0: .4byte gUnknown_030026D0
_020051D4: .4byte gUnknown_030018C8
_020051D8: .4byte gUnknown_03000430
_020051DC: .4byte gUnknown_03000434
_020051E0: .4byte gUnknown_03000378
_020051E4: .4byte 0x06012500
_020051E8:
	strh r2, [r4, #2]
_020051EA:
	strb r6, [r4, #0x18]
	strh r7, [r4, #0xc]
	strh r7, [r4, #0x14]
	movs r0, #0xff
	strb r0, [r4, #0x19]
	movs r0, #0x10
	strb r0, [r4, #0x1a]
	strb r7, [r4, #0x1d]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #8]
	adds r0, r5, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl sub_020030A0
	adds r4, #0x30
	ldr r1, [sp, #4]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r5, #0x30
	adds r6, #1
	ldr r2, [sp, #8]
	cmp r6, #2
	bls _020051AC
_0200521E:
	movs r1, #0x86
	lsls r1, r1, #3
	add r1, r8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _02005238 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _0200523C @ =sub_02005350
	str r0, [r1, #8]
	bl sub_02014CC8
	b _02005342
	.align 2, 0
_02005238: .4byte gUnknown_030026D0
_0200523C: .4byte sub_02005350
_02005240:
	movs r6, #0
	movs r0, #1
	mov r8, r0
	ldr r1, _02005288 @ =gUnknown_03000430
	adds r7, r3, r1
_0200524A:
	ldr r2, _0200528C @ =gUnknown_03001930
	adds r0, r6, #0
	adds r0, #8
	mov r1, r8
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _020052C2
	ldr r0, _02005290 @ =gUnknown_0300542C
	adds r0, r6, r0
	ldrb r1, [r0]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _02005294
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r5, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	adds r4, r6, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r0, [r7]
	movs r3, #0xf0
	subs r3, r3, r0
	b _020052AC
	.align 2, 0
_02005288: .4byte gUnknown_03000430
_0200528C: .4byte gUnknown_03001930
_02005290: .4byte gUnknown_0300542C
_02005294:
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r5, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	adds r4, r6, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r3, [r7]
	subs r3, #0xf0
_020052AC:
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r0, #0xa0
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_020048AC
	b _0200533A
_020052C2:
	ldr r0, _02005304 @ =gUnknown_0300542C
	adds r2, r6, r0
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _02005308
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r1, r4, #0x1b
	lsrs r1, r1, #0x18
	adds r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r0, [r7]
	movs r3, #0xf0
	subs r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r6, #2
	adds r0, r0, r6
	subs r0, r0, r4
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_020048AC
	b _02005338
	.align 2, 0
_02005304: .4byte gUnknown_0300542C
_02005308:
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r1, r4, #0x1b
	lsrs r1, r1, #0x18
	adds r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	ldrh r3, [r7]
	subs r3, #0xf0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r6, #2
	adds r0, r0, r6
	subs r0, r0, r4
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl sub_020048AC
_02005338:
	adds r4, r6, #1
_0200533A:
	adds r6, r4, #0
	cmp r6, #3
	bhi _02005342
	b _0200524A
_02005342:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02005350
sub_02005350: @ 0x02005350
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r5, #0
	mov sl, r5
	ldr r0, _020053C8 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r2
	mov r8, r0
	ldr r6, _020053CC @ =gUnknown_03005528
	ldr r7, _020053D0 @ =gUnknown_03001930
	ldr r0, [r7]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	strb r0, [r6]
	ldr r4, _020053D4 @ =gUnknown_03001870
	ldrh r1, [r4]
	ldr r0, _020053D8 @ =0x00004012
	cmp r1, r0
	beq _02005388
	b _02005484
_02005388:
	ldr r0, _020053DC @ =gUnknown_03005468
	strb r5, [r0]
	ldr r1, _020053E0 @ =gUnknown_03000434
	adds r0, r2, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _02005428
	ldr r3, _020053E4 @ =gUnknown_03000040
	adds r2, r2, r3
	ldr r0, _020053E8 @ =gUnknown_03002810
	strh r5, [r0, #8]
	strh r5, [r0, #0xa]
	ldr r0, _020053EC @ =0x0600C000
	str r0, [r2, #4]
	strh r5, [r2, #0xa]
	ldr r0, _020053F0 @ =0x0600E000
	str r0, [r2, #0xc]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	movs r0, #6
	strh r0, [r2, #0x1c]
	ldr r0, _020053F4 @ =gUnknown_030053AC
	ldrb r0, [r0]
	cmp r0, #1
	beq _020053F8
	cmp r0, #1
	bgt _020053FE
	cmp r0, #0
	bne _020053FE
	strh r5, [r2, #0x1e]
	b _02005402
	.align 2, 0
_020053C8: .4byte gUnknown_030026D0
_020053CC: .4byte gUnknown_03005528
_020053D0: .4byte gUnknown_03001930
_020053D4: .4byte gUnknown_03001870
_020053D8: .4byte 0x00004012
_020053DC: .4byte gUnknown_03005468
_020053E0: .4byte gUnknown_03000434
_020053E4: .4byte gUnknown_03000040
_020053E8: .4byte gUnknown_03002810
_020053EC: .4byte 0x0600C000
_020053F0: .4byte 0x0600E000
_020053F4: .4byte gUnknown_030053AC
_020053F8:
	strh r5, [r2, #0x1e]
	strh r5, [r2, #0x20]
	b _02005406
_020053FE:
	movs r0, #0
	strh r0, [r2, #0x1e]
_02005402:
	movs r0, #4
	strh r0, [r2, #0x20]
_02005406:
	movs r1, #0
	movs r0, #6
	strh r0, [r2, #0x22]
	movs r0, #8
	strh r0, [r2, #0x24]
	movs r0, #0x12
	strh r0, [r2, #0x26]
	movs r0, #4
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r1, [r0]
	movs r0, #2
	strh r0, [r2, #0x2e]
	adds r0, r2, #0
	bl sub_02001DE4
_02005428:
	ldr r2, _02005458 @ =gUnknown_03002820
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0x86
	lsls r1, r1, #3
	add r1, r8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0200545C @ =0x00000434
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	beq _0200546C
	ldr r1, _02005460 @ =gUnknown_030018C8
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _02005464 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _02005468 @ =sub_02005558
	b _02005472
	.align 2, 0
_02005458: .4byte gUnknown_03002820
_0200545C: .4byte 0x00000434
_02005460: .4byte gUnknown_030018C8
_02005464: .4byte gUnknown_030026D0
_02005468: .4byte sub_02005558
_0200546C:
	ldr r0, _0200547C @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _02005480 @ =sub_020059D0
_02005472:
	str r0, [r1, #8]
	bl sub_02014CC8
	b _0200552E
	.align 2, 0
_0200547C: .4byte gUnknown_030026D0
_02005480: .4byte sub_020059D0
_02005484:
	bl sub_020056B0
	movs r2, #0
	ldrb r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020054DE
	movs r3, #1
	ldr r7, [r7]
	ldr r0, _020054B0 @ =0x00004010
	mov sb, r0
	mov ip, r4
	movs r1, #0
_020054A0:
	adds r0, r3, #0
	lsls r0, r2
	ands r0, r7
	cmp r0, #0
	bne _020054B4
	movs r0, #1
	mov sl, r0
	b _020054CC
	.align 2, 0
_020054B0: .4byte 0x00004010
_020054B4:
	mov r0, ip
	adds r4, r1, r0
	ldr r0, _0200553C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r2, r0
	beq _020054CA
	ldrh r0, [r4]
	cmp r0, sb
	bne _020054CC
_020054CA:
	adds r5, #1
_020054CC:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #3
	bhi _020054DE
	ldrb r0, [r6]
	asrs r0, r2
	ands r0, r3
	cmp r0, #0
	bne _020054A0
_020054DE:
	ldr r4, _02005540 @ =gUnknown_03002840
	ldr r0, _02005544 @ =0x00004010
	strh r0, [r4]
	ldr r2, _02005548 @ =gUnknown_03001930
	ldr r0, [r2]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02005514
	ldr r0, _0200554C @ =gUnknown_030053AC
	ldrb r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _02005514
	ldr r0, _02005550 @ =gUnknown_03002ABC
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _02005514
	mov r1, sl
	cmp r1, #0
	bne _02005514
	cmp r5, #1
	bgt _02005520
_02005514:
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200552E
_02005520:
	movs r0, #0x87
	lsls r0, r0, #3
	add r0, r8
	movs r1, #1
	strb r1, [r0]
	ldr r0, _02005554 @ =0x00004012
	strh r0, [r4]
_0200552E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200553C: .4byte 0x04000128
_02005540: .4byte gUnknown_03002840
_02005544: .4byte 0x00004010
_02005548: .4byte gUnknown_03001930
_0200554C: .4byte gUnknown_030053AC
_02005550: .4byte gUnknown_03002ABC
_02005554: .4byte 0x00004012

	thumb_func_start sub_02005558
sub_02005558: @ 0x02005558
	push {r4, r5, lr}
	ldr r5, _02005594 @ =gUnknown_030026D0
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _02005598 @ =gUnknown_03000430
	adds r4, r0, r1
	ldrh r0, [r4]
	adds r0, #0x20
	strh r0, [r4]
	bl sub_020056B0
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #5
	cmp r0, r1
	bls _02005586
	strh r1, [r4]
	ldr r1, _0200559C @ =gUnknown_030018C8
	movs r0, #0x10
	strh r0, [r1, #4]
	ldr r1, [r5]
	ldr r0, _020055A0 @ =sub_020055A4
	str r0, [r1, #8]
_02005586:
	ldr r1, _0200559C @ =gUnknown_030018C8
	ldrh r0, [r4]
	lsrs r0, r0, #8
	strh r0, [r1, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02005594: .4byte gUnknown_030026D0
_02005598: .4byte gUnknown_03000430
_0200559C: .4byte gUnknown_030018C8
_020055A0: .4byte sub_020055A4

	thumb_func_start sub_020055A4
sub_020055A4: @ 0x020055A4
	push {r4, r5, r6, r7, lr}
	ldr r2, _02005600 @ =gUnknown_030026D0
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, _02005604 @ =gUnknown_03001870
	ldrh r1, [r3]
	movs r0, #0x81
	lsls r0, r0, #7
	adds r6, r2, #0
	cmp r1, r0
	bne _02005638
	ldr r1, _02005608 @ =gUnknown_030053E8
	ldr r0, [r3, #8]
	str r0, [r1]
	movs r1, #0
	ldr r5, _0200560C @ =gUnknown_03001820
	ldr r2, _02005610 @ =gUnknown_03005478
	movs r4, #0
	ldr r3, _02005614 @ =gUnknown_0300542C
_020055D0:
	adds r0, r1, r2
	strb r4, [r0]
	adds r0, r1, r3
	strb r1, [r0]
	adds r1, #1
	cmp r1, #3
	bls _020055D0
	ldr r0, [r5]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5]
	ldr r1, _02005618 @ =0x00000434
	adds r0, r7, r1
	ldr r4, [r0]
	cmp r4, #0
	beq _0200561C
	ldr r0, [r6]
	bl sub_02001A38
	movs r0, #0
	bl sub_02004E54
	b _02005690
	.align 2, 0
_02005600: .4byte gUnknown_030026D0
_02005604: .4byte gUnknown_03001870
_02005608: .4byte gUnknown_030053E8
_0200560C: .4byte gUnknown_03001820
_02005610: .4byte gUnknown_03005478
_02005614: .4byte gUnknown_0300542C
_02005618: .4byte 0x00000434
_0200561C:
	ldr r0, [r6]
	bl sub_02001A38
	ldr r0, _02005634 @ =gUnknown_030018C8
	strh r4, [r0]
	strh r4, [r0, #4]
	bl sub_020129A0
	bl sub_020126EC
	b _02005690
	.align 2, 0
_02005634: .4byte gUnknown_030018C8
_02005638:
	bl sub_020056B0
	ldr r3, _02005698 @ =gUnknown_03002840
	movs r0, #0
	ldr r4, _0200569C @ =0x00004051
	strh r4, [r3]
	strb r0, [r3, #2]
	ldr r0, _020056A0 @ =gUnknown_03001930
	ldr r0, [r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02005690
	movs r1, #0
	ldr r0, _020056A4 @ =gUnknown_03005528
	ldrb r2, [r0]
	adds r6, r4, #0
	movs r5, #1
	ldr r4, _020056A8 @ =gUnknown_03001870
_0200565E:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _02005676
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldrh r0, [r3]
	cmp r0, r6
	bne _02005690
_02005676:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _0200565E
	ldr r3, _02005698 @ =gUnknown_03002840
	movs r0, #0x81
	lsls r0, r0, #7
	strh r0, [r3]
	ldr r1, _020056AC @ =0x0000043C
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [r3, #8]
_02005690:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02005698: .4byte gUnknown_03002840
_0200569C: .4byte 0x00004051
_020056A0: .4byte gUnknown_03001930
_020056A4: .4byte gUnknown_03005528
_020056A8: .4byte gUnknown_03001870
_020056AC: .4byte 0x0000043C

	thumb_func_start sub_020056B0
sub_020056B0: @ 0x020056B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _02005714 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _02005752
	movs r5, #0
	ldr r2, _02005718 @ =gUnknown_03005528
	ldrb r1, [r2]
	movs r0, #1
	ands r1, r0
	ldr r7, _0200571C @ =gUnknown_03001930
	cmp r1, #0
	beq _02005752
	movs r6, #1
	ldr r3, _02005720 @ =gUnknown_0300544C
_020056D8:
	adds r0, r6, #0
	lsls r0, r5
	ldr r4, [r7]
	ands r4, r0
	cmp r4, #0
	bne _0200573C
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _02005740
	movs r0, #0
	ldr r1, _02005724 @ =0x0000FFFF
	bl sub_02001D78
	ldr r1, _02005728 @ =gUnknown_03002AC4
	ldr r0, _0200572C @ =gUnknown_0300285C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _02005730 @ =gUnknown_03005370
	strb r4, [r0]
	ldr r1, _02005734 @ =gUnknown_03004D3C
	ldr r0, _02005738 @ =gUnknown_03002A64
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_020127D8
	b _020059BE
	.align 2, 0
_02005714: .4byte gUnknown_03005444
_02005718: .4byte gUnknown_03005528
_0200571C: .4byte gUnknown_03001930
_02005720: .4byte gUnknown_0300544C
_02005724: .4byte 0x0000FFFF
_02005728: .4byte gUnknown_03002AC4
_0200572C: .4byte gUnknown_0300285C
_02005730: .4byte gUnknown_03005370
_02005734: .4byte gUnknown_03004D3C
_02005738: .4byte gUnknown_03002A64
_0200573C:
	movs r0, #0
	strb r0, [r3]
_02005740:
	adds r3, #1
	adds r5, #1
	cmp r5, #3
	bhi _02005752
	ldrb r0, [r2]
	asrs r0, r5
	ands r0, r6
	cmp r0, #0
	bne _020056D8
_02005752:
	ldr r0, _020057A4 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sb, r1
	movs r0, #0
	mov r8, r0
_02005764:
	ldr r2, _020057A8 @ =gUnknown_03001930
	mov r0, r8
	adds r0, #8
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _020057AC
	mov r2, r8
	lsls r1, r2, #2
	add r1, r8
	lsls r3, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	mov r4, r8
	adds r4, #1
	lsls r2, r4, #2
	adds r2, r2, r4
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	movs r0, #0xa0
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r3, #0
	bl sub_020048AC
	b _020059B6
	.align 2, 0
_020057A4: .4byte gUnknown_030026D0
_020057A8: .4byte gUnknown_03001930
_020057AC:
	ldr r0, _02005900 @ =gUnknown_0300542C
	add r0, r8
	mov sl, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r3, r1, #3
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x18
	adds r0, #1
	lsls r2, r0, #2
	adds r2, r2, r0
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x18
	mov r5, r8
	lsls r4, r5, #2
	adds r0, r4, r5
	lsls r6, r0, #3
	subs r3, r6, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	movs r0, #3
	movs r3, #0
	bl sub_020048AC
	ldr r0, _02005904 @ =0x00000434
	add r0, sb
	ldr r0, [r0]
	cmp r0, #0
	bne _020057F0
	b _02005910
_020057F0:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, #0x80
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0x78
	strh r0, [r5, #0x16]
	mov r2, sl
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_020030A0
	adds r0, r5, #0
	bl sub_02003D30
	ldr r0, _02005908 @ =gUnknown_03005478
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xdc
	lsls r5, r5, #2
	adds r0, r0, r5
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0x34
	strh r0, [r5, #0x16]
	mov r2, sl
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_02003D30
	ldr r0, _0200590C @ =gUnknown_030053A8
	add r0, r8
	ldrb r0, [r0]
	bl sub_02003060
	lsls r4, r0, #0x10
	lsrs r5, r4, #0x10
	str r5, [sp, #4]
	lsrs r1, r4, #0x18
	movs r2, #0xf
	ands r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r7, #0xb0
	lsls r7, r7, #1
	adds r0, r0, r7
	mov r1, sb
	adds r5, r1, r0
	adds r6, r1, r7
	cmp r5, r6
	beq _02005898
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	mov r0, sl
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	str r2, [sp, #8]
	bl sub_02003D30
	ldr r2, [sp, #8]
_02005898:
	lsrs r1, r4, #0x14
	ands r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r7
	mov r1, sb
	adds r5, r1, r0
	cmp r5, r6
	bne _020058B2
	ldr r2, [sp, #4]
	cmp r2, #0xff
	bls _020058CC
_020058B2:
	movs r0, #0xab
	strh r0, [r5, #0x16]
	mov r0, sl
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_02003D30
_020058CC:
	movs r1, #0xf
	ldr r2, [sp, #4]
	ands r1, r2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r5, #0xb0
	lsls r5, r5, #1
	adds r0, r0, r5
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0xb6
	strh r0, [r5, #0x16]
	ldr r0, _02005900 @ =gUnknown_0300542C
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_02003D30
	b _020059B2
	.align 2, 0
_02005900: .4byte gUnknown_0300542C
_02005904: .4byte 0x00000434
_02005908: .4byte gUnknown_03005478
_0200590C: .4byte gUnknown_030053A8
_02005910:
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x80
	mov r1, sb
	adds r5, r1, r0
	movs r0, #0x78
	strh r0, [r5, #0x16]
	adds r0, r6, #0
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_020030A0
	adds r0, r5, #0
	bl sub_02003D30
	ldr r0, _02005944 @ =gUnknown_030053D8
	mov r2, r8
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0x63
	bls _02005948
	movs r7, #0x63
	b _02005952
	.align 2, 0
_02005944: .4byte gUnknown_030053D8
_02005948:
	ldrb r0, [r1]
	bl sub_02003060
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_02005952:
	lsrs r0, r7, #4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	movs r6, #0xb0
	lsls r6, r6, #1
	adds r1, r1, r6
	mov r0, sb
	adds r5, r0, r1
	adds r0, r0, r6
	cmp r5, r0
	beq _0200597E
	movs r0, #0xa0
	strh r0, [r5, #0x16]
	mov r1, r8
	adds r0, r4, r1
	lsls r0, r0, #3
	adds r0, #0x14
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_02003D30
_0200597E:
	movs r1, #0xf
	ands r1, r7
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	mov r2, sb
	adds r5, r2, r0
	movs r0, #0xab
	strh r0, [r5, #0x16]
	add r4, r8
	lsls r4, r4, #3
	adds r4, #0x14
	strh r4, [r5, #0x18]
	adds r0, r5, #0
	bl sub_02003D30
	movs r5, #0xd0
	lsls r5, r5, #2
	add r5, sb
	movs r0, #0xc5
	strh r0, [r5, #0x16]
	strh r4, [r5, #0x18]
	adds r0, r5, #0
	bl sub_02003D30
_020059B2:
	mov r4, r8
	adds r4, #1
_020059B6:
	mov r8, r4
	cmp r4, #3
	bhi _020059BE
	b _02005764
_020059BE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020059D0
sub_020059D0: @ 0x020059D0
	push {r4, r5, lr}
	ldr r5, _02005A24 @ =gUnknown_030026D0
	ldr r0, [r5]
	ldrh r4, [r0, #6]
	bl sub_020056B0
	ldr r0, _02005A28 @ =gUnknown_03000430
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bls _02005A1E
	movs r0, #0
	strh r0, [r4]
	ldr r0, _02005A2C @ =0x0201F270
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _02005A30 @ =0x0201F2B0
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _02005A34 @ =0x0201F2F0
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r0, _02005A38 @ =0x0201F340
	movs r1, #8
	bl m4aMPlayFadeOut
	ldr r1, _02005A3C @ =gUnknown_030018C8
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, [r5]
	ldr r0, _02005A40 @ =sub_02005558
	str r0, [r1, #8]
_02005A1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02005A24: .4byte gUnknown_030026D0
_02005A28: .4byte gUnknown_03000430
_02005A2C: .4byte 0x0201F270
_02005A30: .4byte 0x0201F2B0
_02005A34: .4byte 0x0201F2F0
_02005A38: .4byte 0x0201F340
_02005A3C: .4byte gUnknown_030018C8
_02005A40: .4byte sub_02005558

	thumb_func_start sub_02005A44
sub_02005A44: @ 0x02005A44
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _02005A94 @ =sub_02005078
	movs r1, #0x88
	lsls r1, r1, #3
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r3, #0
	bl sub_0200198C
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, _02005A98 @ =gUnknown_03000434
	adds r1, r2, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r1]
	ldr r4, _02005A9C @ =gUnknown_03000430
	adds r1, r2, r4
	movs r3, #0
	strh r5, [r1]
	adds r4, #8
	adds r1, r2, r4
	strb r3, [r1]
	ldr r1, _02005AA0 @ =gUnknown_0300043C
	adds r2, r2, r1
	ldr r1, _02005AA4 @ =gUnknown_03002244
	ldr r1, [r1]
	str r1, [r2]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_02005A94: .4byte sub_02005078
_02005A98: .4byte gUnknown_03000434
_02005A9C: .4byte gUnknown_03000430
_02005AA0: .4byte gUnknown_0300043C
_02005AA4: .4byte gUnknown_03002244

	thumb_func_start sub_02005AA8
sub_02005AA8: @ 0x02005AA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	movs r3, #0
	movs r6, #0x80
	lsls r6, r6, #1
	movs r5, #0
_02005AB6:
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r7, r0
	lsls r1, r4, #2
	adds r1, r1, r6
	lsls r1, r1, #5
	ldr r2, _02005B00 @ =0x06010000
	adds r1, r1, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	movs r2, #0x73
	bl sub_02005B90
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #9
	ble _02005AB6
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02005B00: .4byte 0x06010000

	thumb_func_start sub_02005B04
sub_02005B04: @ 0x02005B04
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r3, #0
	movs r5, #0
_02005B0E:
	lsls r4, r3, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	movs r2, #0xdc
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r6, r0
	lsls r1, r1, #6
	ldr r2, _02005B58 @ =0x06012500
	adds r1, r1, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r5, [sp]
	str r5, [sp, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #8]
	str r5, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	movs r2, #0x71
	bl sub_02005B90
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r3, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #2
	ble _02005B0E
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02005B58: .4byte 0x06012500

	thumb_func_start sub_02005B5C
sub_02005B5C: @ 0x02005B5C
	push {lr}
	sub sp, #0x14
	movs r1, #0xd0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _02005B8C @ =0x06012C80
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [sp, #0x10]
	movs r2, #0x71
	movs r3, #3
	bl sub_02005B90
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_02005B8C: .4byte 0x06012C80

	thumb_func_start sub_02005B90
sub_02005B90: @ 0x02005B90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldr r0, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	ldr r4, [sp, #0x24]
	mov r8, r4
	movs r4, #0
	mov r7, ip
	strh r0, [r7, #0x16]
	strh r5, [r7, #0x18]
	str r1, [r7, #4]
	strh r6, [r7, #0x1a]
	strh r4, [r7, #8]
	strh r2, [r7, #0xa]
	mov r0, ip
	adds r0, #0x20
	strb r3, [r0]
	strh r4, [r7, #0x14]
	strh r4, [r7, #0x1c]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	mov r1, r8
	strb r1, [r0]
	ldr r4, [sp, #0x28]
	str r4, [r7, #0x10]
	mov r0, ip
	bl sub_020030A0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02005BE8
sub_02005BE8: @ 0x02005BE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _02005DB4 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _02005C06
	b _02005DA2
_02005C06:
	ldr r0, _02005DB8 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	ldr r0, [r1]
	adds r0, #4
	adds r1, r0, #0
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, _02005DBC @ =gUnknown_03005650
	ldr r0, [r1]
	adds r2, r0, #0
	subs r2, #0x80
	str r2, [sp]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [sp, #8]
	ldr r1, [r1, #4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #4]
	subs r4, #0x50
	adds r0, r1, r4
	str r0, [sp, #0xc]
	cmp r2, #0
	bge _02005C52
	str r3, [sp]
_02005C52:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _02005C5A
	str r3, [sp, #4]
_02005C5A:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _02005C62
	str r3, [sp, #8]
_02005C62:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _02005C6A
	str r3, [sp, #0xc]
_02005C6A:
	ldr r0, [sp, #0x10]
	lsls r2, r0, #8
	ldr r0, [sp]
	cmp r0, r2
	blo _02005C78
	subs r0, r2, #1
	str r0, [sp]
_02005C78:
	ldr r3, [sp, #0x14]
	lsls r1, r3, #8
	ldr r0, [sp, #4]
	cmp r0, r1
	blo _02005C86
	subs r0, r1, #1
	str r0, [sp, #4]
_02005C86:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _02005C90
	subs r0, r2, #1
	str r0, [sp, #8]
_02005C90:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _02005C9A
	subs r0, r1, #1
	str r0, [sp, #0xc]
_02005C9A:
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	mov r8, r0
	lsls r0, r0, #8
	ldr r3, [sp, #0xc]
	cmp r0, r3
	bhs _02005D8A
	ldr r4, [sp, #0x14]
	cmp r8, r4
	bhs _02005D8A
_02005CAE:
	ldr r0, [sp]
	asrs r7, r0, #8
	lsls r0, r7, #8
	ldr r2, [sp, #8]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r0, r2
	bhs _02005D7A
	ldr r4, [sp, #0x10]
	cmp r7, r4
	bhs _02005D7A
_02005CC6:
	ldr r1, [sp, #0x10]
	mov r0, r8
	muls r0, r1, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	adds r1, r1, r0
	ldr r6, [r1]
	adds r0, r7, #1
	mov sb, r0
	cmp r6, #0
	beq _02005D6A
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _02005D6A
	lsls r0, r7, #0x10
	str r0, [sp, #0x20]
	mov r2, r8
	lsls r2, r2, #0x10
	str r2, [sp, #0x24]
_02005D00:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _02005D54
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _02005D54
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _02005D54
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _02005D54
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _02005D54
	ldr r1, _02005DC0 @ =gUnknown_02015A24
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	ldr r2, [sp, #0x20]
	lsrs r1, r2, #0x10
	ldr r4, [sp, #0x24]
	lsrs r2, r4, #0x10
	bl sub_02014CF8
_02005D54:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _02005D00
_02005D6A:
	mov r7, sb
	mov r1, sb
	lsls r0, r1, #8
	cmp r0, r2
	bhs _02005D7A
	ldr r4, [sp, #0x10]
	cmp sb, r4
	blo _02005CC6
_02005D7A:
	mov r8, sl
	mov r1, sl
	lsls r0, r1, #8
	cmp r0, r3
	bhs _02005D8A
	ldr r2, [sp, #0x14]
	cmp sl, r2
	blo _02005CAE
_02005D8A:
	ldr r1, _02005DBC @ =gUnknown_03005650
	ldr r0, [r1]
	ldr r3, [sp, #0x18]
	str r0, [r3, #0xc]
	ldr r0, [r1, #4]
	str r0, [r3, #0x10]
	movs r0, #0
	strb r0, [r3, #0x14]
	ldr r0, _02005DB8 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _02005DC4 @ =sub_02005DC8
	str r0, [r1, #8]
_02005DA2:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02005DB4: .4byte gUnknown_030053D4
_02005DB8: .4byte gUnknown_030026D0
_02005DBC: .4byte gUnknown_03005650
_02005DC0: .4byte gUnknown_02015A24
_02005DC4: .4byte sub_02005DC8

	thumb_func_start sub_02005DC8
sub_02005DC8: @ 0x02005DC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	ldr r0, _02005E10 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02005DE2
	b _02006150
_02005DE2:
	ldr r0, _02005E14 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x24]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _02005E7C
	ldr r1, _02005E18 @ =gUnknown_03005650
	ldr r3, [r1]
	ldr r2, [sp, #0x24]
	ldr r0, [r2, #0xc]
	subs r2, r3, r0
	adds r4, r1, #0
	adds r1, r0, #0
	cmp r2, #0
	blt _02005E1C
	cmp r2, #0xf8
	bgt _02005E7C
	b _02005E22
	.align 2, 0
_02005E10: .4byte gUnknown_030053D4
_02005E14: .4byte gUnknown_030026D0
_02005E18: .4byte gUnknown_03005650
_02005E1C:
	subs r0, r1, r3
	cmp r0, #0xf8
	bgt _02005E7C
_02005E22:
	ldr r3, [r4, #4]
	ldr r5, [sp, #0x24]
	ldr r0, [r5, #0x10]
	subs r2, r3, r0
	cmp r2, #0
	blt _02005E34
	cmp r2, #0xd0
	bgt _02005E7C
	b _02005E3A
_02005E34:
	subs r0, r0, r3
	cmp r0, #0xd0
	bgt _02005E7C
_02005E3A:
	ldr r0, [sp, #0x24]
	ldr r0, [r0]
	adds r0, #4
	adds r2, r0, #0
	ldm r2!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldm r2!, {r0}
	str r2, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r2, [r4]
	cmp r2, r1
	ble _02005E66
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [sp]
	adds r0, r2, r0
	b _02005E72
_02005E66:
	adds r0, r2, #0
	subs r0, #0x80
	str r0, [sp]
	ldr r3, [sp, #0x24]
	ldr r0, [r3, #0xc]
	subs r0, #0x80
_02005E72:
	str r0, [sp, #8]
	ldr r5, [sp, #0x24]
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	beq _02005E82
_02005E7C:
	bl sub_02005BE8
	b _02006150
_02005E82:
	ldr r0, [r4, #4]
	adds r3, r0, #0
	subs r3, #0x80
	str r3, [sp, #4]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r2, r0, r1
	str r2, [sp, #0xc]
	ldr r5, [sp, #0x24]
	ldr r1, [r5, #0x10]
	cmp r0, r1
	ble _02005EA8
	add r0, sp, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r0, #4]
	str r2, [r0, #0xc]
	b _02005EB4
_02005EA8:
	add r1, sp, #0x10
	str r3, [r1, #4]
	ldr r5, [sp, #0x24]
	ldr r0, [r5, #0x10]
	subs r0, #0x80
	str r0, [r1, #0xc]
_02005EB4:
	add r3, sp, #0x10
	ldr r1, [r4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #0x10]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	str r0, [sp, #0x18]
	ldr r0, [sp]
	cmp r0, #0
	bge _02005ED0
	movs r0, #0
	str r0, [sp]
_02005ED0:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _02005EDA
	movs r0, #0
	str r0, [sp, #4]
_02005EDA:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _02005EE4
	movs r0, #0
	str r0, [sp, #8]
_02005EE4:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _02005EEE
	movs r0, #0
	str r0, [sp, #0xc]
_02005EEE:
	ldr r0, [sp]
	mov r5, sl
	lsls r2, r5, #8
	cmp r0, r2
	blo _02005EFC
	subs r0, r2, #1
	str r0, [sp]
_02005EFC:
	ldr r0, [sp, #4]
	ldr r5, [sp, #0x20]
	lsls r1, r5, #8
	cmp r0, r1
	blo _02005F0A
	subs r0, r1, #1
	str r0, [sp, #4]
_02005F0A:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _02005F14
	subs r0, r2, #1
	str r0, [sp, #8]
_02005F14:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _02005F1E
	subs r0, r1, #1
	str r0, [sp, #0xc]
_02005F1E:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _02005F28
	movs r0, #0
	str r0, [sp, #0x10]
_02005F28:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _02005F32
	movs r0, #0
	str r0, [sp, #0x14]
_02005F32:
	ldr r0, [r3, #8]
	cmp r0, #0
	bge _02005F3C
	movs r0, #0
	str r0, [r3, #8]
_02005F3C:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bge _02005F46
	movs r0, #0
	str r0, [r3, #0xc]
_02005F46:
	ldr r0, [sp, #0x10]
	cmp r0, r2
	blo _02005F50
	subs r0, r2, #1
	str r0, [sp, #0x10]
_02005F50:
	ldr r0, [r3, #4]
	cmp r0, r1
	blo _02005F5A
	subs r0, r1, #1
	str r0, [r3, #4]
_02005F5A:
	ldr r0, [r3, #8]
	cmp r0, r2
	blo _02005F64
	subs r0, r2, #1
	str r0, [r3, #8]
_02005F64:
	ldr r0, [r3, #0xc]
	cmp r0, r1
	blo _02005F6E
	subs r0, r1, #1
	str r0, [r3, #0xc]
_02005F6E:
	ldr r1, [r4]
	ldr r2, [sp, #0x24]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	beq _0200604E
	ldr r0, [sp]
	ldr r2, [sp, #8]
	cmp r0, r2
	beq _0200604E
	ldr r0, [sp, #4]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	beq _0200604E
	lsls r0, r0, #8
	b _0200603E
_02005F8C:
	ldr r0, [sp]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x2c]
	b _02006032
_02005F9C:
	mov r1, r8
	mov r0, sl
	muls r0, r1, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r4, [sp, #0x28]
	adds r0, r0, r4
	adds r1, r1, r0
	ldr r6, [r1]
	adds r5, r7, #1
	mov sb, r5
	cmp r6, #0
	beq _0200602A
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b _02006022
_02005FC6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _02006014
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _02006014
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _02006014
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _02006014
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _02006014
	ldr r1, _02006090 @ =gUnknown_02015A24
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl sub_02014CD8
_02006014:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_02006022:
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _02005FC6
_0200602A:
	mov r5, sb
	lsls r0, r5, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
_02006032:
	cmp r0, r2
	bge _0200603A
	cmp r7, sl
	blo _02005F9C
_0200603A:
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #0x10
_0200603E:
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	bge _0200604E
	ldr r4, [sp, #0x20]
	cmp r8, r4
	blo _02005F8C
_0200604E:
	ldr r0, _02006094 @ =gUnknown_03005650
	ldr r1, [r0, #4]
	ldr r5, [sp, #0x24]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	beq _02006144
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	beq _02006144
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	beq _02006144
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	bge _02006144
	ldr r0, [sp, #0x20]
	cmp r8, r0
	bhs _02006144
_0200607C:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x2c]
	b _02006126
	.align 2, 0
_02006090: .4byte gUnknown_02015A24
_02006094: .4byte gUnknown_03005650
_02006098:
	mov r3, r8
	mov r0, sl
	muls r0, r3, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r4, [sp, #0x28]
	adds r0, r0, r4
	adds r1, r1, r0
	ldr r6, [r1]
	adds r5, r7, #1
	mov sb, r5
	cmp r6, #0
	beq _0200611C
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	b _0200610E
_020060BC:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _0200610A
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _0200610A
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _0200610A
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _0200610A
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _0200610A
	ldr r1, _02006160 @ =gUnknown_02015A24
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl sub_02014CD8
_0200610A:
	adds r5, #7
	adds r6, #1
_0200610E:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _020060BC
_0200611C:
	mov r3, sb
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
_02006126:
	cmp r1, r0
	bge _0200612E
	cmp r7, sl
	blo _02006098
_0200612E:
	ldr r4, [sp, #0x2c]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r0, #8
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bge _02006144
	ldr r5, [sp, #0x20]
	cmp r8, r5
	blo _0200607C
_02006144:
	ldr r0, _02006164 @ =gUnknown_03005650
	ldr r1, [r0]
	ldr r2, [sp, #0x24]
	str r1, [r2, #0xc]
	ldr r0, [r0, #4]
	str r0, [r2, #0x10]
_02006150:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02006160: .4byte gUnknown_02015A24
_02006164: .4byte gUnknown_03005650

	thumb_func_start sub_02006168
sub_02006168: @ 0x02006168
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _020061B0 @ =sub_02005DC8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x1c
	movs r3, #0
	bl sub_0200198C
	adds r6, r0, #0
	ldrh r4, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r5, _020061B4 @ =0x0203F000
	ldr r0, _020061B8 @ =0x0203300C
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_02014CBC
	str r5, [r4]
	ldr r1, _020061BC @ =gUnknown_03005650
	ldr r0, [r1]
	str r0, [r4, #0xc]
	ldr r0, [r1, #4]
	str r0, [r4, #0x10]
	movs r0, #1
	strb r0, [r4, #0x14]
	ldr r0, _020061C0 @ =gUnknown_03005454
	str r6, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020061B0: .4byte sub_02005DC8
_020061B4: .4byte 0x0203F000
_020061B8: .4byte 0x0203300C
_020061BC: .4byte gUnknown_03005650
_020061C0: .4byte gUnknown_03005454

	thumb_func_start sub_020061C4
sub_020061C4: @ 0x020061C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov sl, r1
	str r2, [sp]
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x2c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, ip
	adds r0, #0x90
	ldr r6, [r0]
	adds r1, r6, #0
	adds r1, #0xc
	str r1, [sp, #4]
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _020062CC
	lsls r0, r3, #0x10
	asrs r4, r0, #0xd
	adds r1, r7, #0
	adds r1, #0x28
	adds r1, r1, r4
	ldr r1, [r1]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r0
	cmp r1, r2
	beq _020062CC
	lsls r0, r5, #0x10
	asrs r5, r0, #0xd
	adds r1, r6, #0
	adds r1, #0x34
	adds r1, r1, r5
	ldr r1, [r1]
	mov r8, r0
	cmp r1, r2
	beq _020062CC
	adds r3, r7, r4
	adds r0, r3, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	mov r6, sl
	adds r2, r6, r4
	mov r0, ip
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r6, [sp, #4]
	adds r5, r6, r5
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _02006260
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _02006272
	cmp r2, r1
	blt _020062CC
_02006260:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _020062CC
_02006272:
	mov r1, sb
	asrs r0, r1, #0xd
	adds r3, r7, r0
	adds r0, r3, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r5, [sp]
	adds r2, r5, r4
	mov r6, ip
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r5, r8
	asrs r0, r5, #0xd
	ldr r6, [sp, #4]
	adds r5, r6, r0
	adds r0, r5, #0
	adds r0, #0x2d
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r1, r1, r6
	cmp r2, r1
	bgt _020062B6
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _020062C8
	cmp r2, r1
	blt _020062CC
_020062B6:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt _020062CC
_020062C8:
	movs r0, #1
	b _020062CE
_020062CC:
	movs r0, #0
_020062CE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020062E0
sub_020062E0: @ 0x020062E0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r3, r1, #0
	mov r8, r2
	movs r0, #0
	mov sb, r0
	ldr r7, _020063B8 @ =gUnknown_030056C0
	adds r0, r7, #0
	adds r0, #0x90
	ldr r0, [r0]
	mov ip, r0
	mov r6, ip
	adds r6, #0xc
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _020063A8
	ldr r0, [r6, #0x30]
	subs r1, #0x81
	cmp r0, r1
	beq _020063A8
	ldr r0, [r5, #0x28]
	cmp r0, r1
	beq _020063A8
	adds r0, r5, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r2, r3, r4
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, ip
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0200634C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r3
	bge _0200635E
	cmp r2, r3
	blt _020063A8
_0200634C:
	mov r0, ip
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _020063A8
_0200635E:
	adds r0, r5, #0
	adds r0, #0x2d
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r0, r8
	adds r2, r0, r3
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _02006392
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _020063A4
	cmp r2, r1
	blt _020063A8
_02006392:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _020063A8
_020063A4:
	movs r0, #1
	mov sb, r0
_020063A8:
	mov r0, sb
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_020063B8: .4byte gUnknown_030056C0

	thumb_func_start sub_020063BC
sub_020063BC: @ 0x020063BC
	push {r4, r5, lr}
	mov ip, r0
	movs r1, #0x2e
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _020063D2
	mov r2, ip
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _020063D6
_020063D2:
	movs r0, #0
	b _020064B2
_020063D6:
	movs r0, #0x78
	mov r2, ip
	strh r0, [r2, #0x2c]
	ldr r0, [r2, #0x20]
	movs r5, #0x80
	lsls r5, r5, #0x11
	ands r0, r5
	mov r4, ip
	adds r4, #0x37
	cmp r0, #0
	beq _02006428
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	ldr r1, _02006488 @ =0xFEFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200648C @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ands r0, r5
	cmp r0, #0
	bne _02006430
_02006428:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
_02006430:
	ldrb r0, [r4]
	movs r1, #0x7f
	ands r1, r0
	strb r1, [r4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _020064B0
	ldr r2, _02006490 @ =gUnknown_030053B0
	ldrh r0, [r2]
	cmp r0, #0
	beq _02006498
	adds r4, r0, #0
	ldr r0, _02006494 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200645C
	adds r0, r4, #0
	cmp r4, #0xa
	bls _0200645A
	movs r0, #0xa
_0200645A:
	adds r4, r0, #0
_0200645C:
	mov r2, ip
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	ldr r1, [r2, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_02011C18
	ldr r0, _02006494 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200647E
	bl sub_02004CC0
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_0200647E:
	ldr r1, _02006490 @ =gUnknown_030053B0
	ldrh r0, [r1]
	subs r0, r0, r4
	strh r0, [r1]
	b _020064B0
	.align 2, 0
_02006488: .4byte 0xFEFFFFFF
_0200648C: .4byte 0xFFFFCFFF
_02006490: .4byte gUnknown_030053B0
_02006494: .4byte gUnknown_03005444
_02006498:
	ldr r0, _020064B8 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _020064B0
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	orrs r0, r1
	mov r2, ip
	str r0, [r2, #0x20]
_020064B0:
	movs r0, #1
_020064B2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_020064B8: .4byte gUnknown_030053D4

	thumb_func_start sub_020064BC
sub_020064BC: @ 0x020064BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl sub_02014E5C
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _02006504
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02006508
_02006504:
	movs r0, #0
	b _0200657C
_02006508:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _02006524
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _02006524
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_02006524:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_02006628
	adds r2, r0, #0
	cmp r2, #0
	beq _0200655E
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _0200657A
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	cmp r4, #0
	bne _0200657A
	cmp r6, #0
	bne _0200657A
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
	b _0200657A
_0200655E:
	cmp r4, #0
	beq _0200657A
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0200657A
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
	str r2, [r5, #0x3c]
_0200657A:
	adds r0, r2, #0
_0200657C:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_02006588
sub_02006588: @ 0x02006588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #8
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	add r0, sp, #4
	movs r2, #4
	bl sub_02014E5C
	movs r4, #0
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _020065D0
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020065D4
_020065D0:
	movs r0, #0
	b _0200661A
_020065D4:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _020065EC
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _020065EC
	movs r4, #1
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x20]
_020065EC:
	str r5, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	add r3, sp, #4
	bl sub_02006628
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _02006612
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	b _02006618
_02006612:
	cmp r4, #0
	beq _02006618
	str r0, [r5, #0x3c]
_02006618:
	adds r0, r2, #0
_0200661A:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02006628
sub_02006628: @ 0x02006628
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	mov sl, r1
	str r2, [sp]
	adds r4, r3, #0
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	mov sb, r0
	mov r1, r8
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [sp, #4]
	movs r5, #0
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	mov r7, sl
	adds r2, r7, r3
	movs r6, #0
	ldrsb r6, [r4, r6]
	mov r0, sb
	adds r1, r0, r6
	cmp r2, r1
	bgt _02006680
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0200668E
	cmp r2, r1
	bge _02006680
	b _0200681A
_02006680:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	bge _0200668E
	b _0200681A
_0200668E:
	mov r1, ip
	adds r1, #0x2d
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r2, [sp]
	adds r3, r2, r6
	movs r0, #1
	ldrsb r0, [r4, r0]
	ldr r7, [sp, #4]
	adds r2, r7, r0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r3, r2
	bgt _020066C2
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r3, r0
	cmp r0, r2
	bge _020066D2
	cmp r3, r2
	bge _020066C2
	b _0200681A
_020066C2:
	movs r0, #3
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, r3
	bge _020066D2
	b _0200681A
_020066D2:
	mov r0, ip
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r0, #2
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r2, r7, r6
	asrs r2, r2, #1
	add r2, sl
	ldr r3, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r3, r0]
	mov r3, ip
	adds r3, #0x2f
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r1, [sp]
	adds r1, r1, r0
	mov ip, r1
	cmp r2, sb
	bgt _02006714
	mov r2, sl
	adds r0, r2, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xb
	b _02006724
_02006714:
	mov r1, sl
	adds r0, r1, r7
	movs r1, #2
	ldrsb r1, [r4, r1]
	add r1, sb
	subs r6, r0, r1
	movs r0, #0x80
	lsls r0, r0, #0xc
_02006724:
	orrs r5, r0
	ldr r2, [sp, #4]
	cmp ip, r2
	ble _0200674C
	ldr r3, [sp, #0xc]
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r7, [sp]
	adds r1, r7, r1
	movs r0, #3
	ldrsb r0, [r4, r0]
	adds r0, r2, r0
	subs r3, r1, r0
	adds r1, r3, #5
	cmp r1, #0
	ble _02006746
	movs r1, #0
_02006746:
	movs r0, #0x80
	lsls r0, r0, #9
	b _02006768
_0200674C:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r1, r2, r3
	subs r3, r0, r1
	adds r1, r3, #2
	cmp r1, #0
	bge _02006764
	movs r1, #0
_02006764:
	movs r0, #0x80
	lsls r0, r0, #0xa
_02006768:
	orrs r5, r0
	adds r2, r6, #0
	cmp r6, #0
	bge _02006772
	rsbs r2, r6, #0
_02006772:
	adds r0, r1, #0
	cmp r0, #0
	bge _0200677A
	rsbs r0, r0, #0
_0200677A:
	cmp r2, r0
	bge _02006786
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r5, r0
	b _020067DE
_02006786:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r5, r0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r5
	cmp r0, #0
	beq _020067DE
	ldr r0, _020067B0 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020067B4
	mov r7, r8
	movs r1, #0x12
	ldrsh r0, [r7, r1]
	cmp r0, #0
	ble _020067BE
_020067AC:
	movs r0, #0
	b _0200681C
	.align 2, 0
_020067B0: .4byte gUnknown_030053D4
_020067B4:
	mov r2, r8
	movs r7, #0x12
	ldrsh r0, [r2, r7]
	cmp r0, #0
	blt _020067AC
_020067BE:
	mov r0, r8
	ldr r2, [r0, #0x20]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _020067DE
	mov r0, r8
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _020067DE
	mov r1, r8
	strh r2, [r1, #0x14]
_020067DE:
	lsls r0, r6, #8
	movs r2, #0xff
	lsls r2, r2, #8
	ands r0, r2
	movs r1, #0xff
	ands r3, r1
	orrs r0, r3
	orrs r5, r0
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _02006808
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	bne _0200680C
	ldr r0, _02006804 @ =0xFFF300FF
	b _0200680A
	.align 2, 0
_02006804: .4byte 0xFFF300FF
_02006808:
	ldr r0, _0200682C @ =0xFFFF00FF
_0200680A:
	ands r5, r0
_0200680C:
	movs r0, #0xc0
	lsls r0, r0, #0xa
	ands r0, r5
	cmp r0, #0
	bne _0200681A
	ldr r0, _02006830 @ =0xFFFFFF00
	ands r5, r0
_0200681A:
	adds r0, r5, #0
_0200681C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200682C: .4byte 0xFFFF00FF
_02006830: .4byte 0xFFFFFF00

	thumb_func_start sub_02006834
sub_02006834: @ 0x02006834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x60]
	ldr r4, [sp, #0x64]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x2c]
	ldr r7, _02006958 @ =gUnknown_030056C0
	ldrb r3, [r7, #0x16]
	adds r3, #5
	rsbs r0, r3, #0
	add r1, sp, #8
	mov sb, r1
	strb r0, [r1]
	ldrb r1, [r7, #0x17]
	movs r6, #1
	subs r2, r6, r1
	mov r0, sp
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r1, #1
	adds r0, #1
	strb r1, [r0]
	add r0, sp, #4
	mov r1, sb
	movs r2, #4
	bl sub_02014E5C
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r2, sp, #0xc
	mov r8, r2
	strb r0, [r2]
	ldrb r2, [r7, #0x17]
	rsbs r1, r2, #0
	mov r0, sp
	adds r0, #0xd
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r0, sb
	mov r1, r8
	movs r2, #4
	bl sub_02014E5C
	movs r3, #0
	mov sl, r3
	movs r4, #0
	str r4, [sp, #0x30]
	ldr r0, _0200695C @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	ldrb r1, [r7, #0x16]
	adds r1, #5
	rsbs r0, r1, #0
	add r5, sp, #0x10
	strb r0, [r5]
	ldr r0, _02006960 @ =gUnknown_03000058
	adds r4, r4, r0
	ldrb r0, [r4]
	subs r6, r6, r0
	mov r0, sp
	adds r0, #0x11
	strb r6, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r4]
	subs r0, #1
	mov r1, sp
	adds r1, #0x13
	strb r0, [r1]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #4
	bl sub_02014E5C
	ldrb r3, [r7, #0x16]
	rsbs r0, r3, #0
	add r1, sp, #0x14
	strb r0, [r1]
	ldrb r0, [r4]
	rsbs r0, r0, #0
	mov r2, sp
	adds r2, #0x15
	strb r0, [r2]
	mov r0, sp
	adds r0, #0x16
	strb r3, [r0]
	ldrb r2, [r4]
	adds r0, #1
	strb r2, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl sub_02014E5C
	ldr r2, [sp, #0x18]
	ldr r1, [r2, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	mov ip, sb
	cmp r1, r0
	beq _02006952
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02006952
	ldr r3, [sp, #0x1c]
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r7, #8]
	asrs r1, r1, #8
	str r0, [sp, #0x38]
	cmp r2, r1
	bne _02006964
	ldr r4, [sp, #0x20]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	cmp r1, r0
	bne _02006964
_02006952:
	movs r0, #0
	b _02006F3C
	.align 2, 0
_02006958: .4byte gUnknown_030056C0
_0200695C: .4byte gUnknown_030026D0
_02006960: .4byte gUnknown_03000058
_02006964:
	ldr r0, _02006AA8 @ =gUnknown_030056C0
	ldr r7, [r0, #8]
	ldr r1, [r0, #0xc]
	str r1, [sp, #0x34]
	adds r1, r0, #0
	adds r1, #0x38
	adds r6, r0, #0
	ldr r2, [sp, #0x2c]
	ldrb r1, [r1]
	cmp r2, r1
	beq _0200697C
	b _02006F3A
_0200697C:
	ldr r1, [r6, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200699A
	ldr r0, [r6, #0x3c]
	ldr r3, [sp, #0x18]
	cmp r0, r3
	bne _0200699A
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r6, #0x20]
	movs r4, #1
	str r4, [sp, #0x30]
_0200699A:
	ldr r1, [sp, #0x20]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	str r0, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	asrs r2, r2, #8
	mov r8, r2
	cmp r1, r8
	bne _020069AE
	b _02006B70
_020069AE:
	ldr r3, [sp, #0x38]
	asrs r0, r3, #0x10
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	asrs r0, r7, #8
	mov r1, ip
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	mov sb, r0
	cmp r2, r1
	bgt _020069DA
	movs r0, #2
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _020069EA
	cmp r2, r1
	bge _020069DA
	b _02006B70
_020069DA:
	mov r3, ip
	movs r0, #2
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _020069EA
	b _02006B70
_020069EA:
	ldr r4, [sp, #0x3c]
	asrs r0, r4, #0x10
	movs r3, #1
	ldrsb r3, [r5, r3]
	adds r2, r0, r3
	mov r0, ip
	movs r4, #1
	ldrsb r4, [r0, r4]
	mov r0, r8
	adds r1, r0, r4
	cmp r2, r1
	bgt _02006A14
	movs r0, #3
	ldrsb r0, [r5, r0]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _02006A24
	cmp r2, r1
	bge _02006A14
	b _02006B70
_02006A14:
	mov r3, ip
	movs r0, #3
	ldrsb r0, [r3, r0]
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	bge _02006A24
	b _02006B70
_02006A24:
	ldr r4, [sp, #0x3c]
	asrs r2, r4, #0x10
	cmp r8, r2
	bgt _02006AEE
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r3, [sp, #0x28]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bge _02006A3E
	b _02006B70
_02006A3E:
	movs r0, #1
	ldrsb r0, [r5, r0]
	adds r0, r2, r0
	mov r4, ip
	movs r1, #3
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	ldr r2, _02006AAC @ =0xFFFFFF00
	ands r1, r2
	subs r0, r0, r1
	ldr r5, [sp, #0x34]
	adds r5, r5, r0
	str r5, [sp, #0x34]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r1, _02006AB0 @ =sub_0200CDB8
	str r1, [sp]
	mov r1, sb
	ldr r2, [sp, #0x2c]
	bl sub_0200D27C
	adds r5, r0, #0
	cmp r5, #0
	bge _02006AB4
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r5, #8
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	str r0, [r6, #0xc]
	b _02006F1C
	.align 2, 0
_02006AA8: .4byte gUnknown_030056C0
_02006AAC: .4byte 0xFFFFFF00
_02006AB0: .4byte sub_0200CDB8
_02006AB4:
	movs r1, #8
	mov r0, sl
	orrs r0, r1
	mov sl, r0
	ldr r0, [r6, #0x20]
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r1, [sp, #0x18]
	str r1, [r6, #0x3c]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r2, [sp, #0x34]
	str r2, [r6, #0xc]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _02006ADA
	b _02006F22
_02006ADA:
	adds r0, r6, #0
	bl sub_0200D770
	ldrh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	b _02006F1C
_02006AEE:
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	ldr r5, [sp, #0x28]
	lsls r2, r5, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bge _02006B70
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	add r0, r8
	ldr r1, _02006B44 @ =sub_0200CDB8
	str r1, [sp]
	mov r1, sb
	ldr r2, [sp, #0x2c]
	movs r3, #8
	bl sub_0200D27C
	adds r5, r0, #0
	cmp r5, #0
	bge _02006B48
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r1, #0
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r1, [r6, #0x12]
	lsls r1, r5, #8
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	b _02006B4C
	.align 2, 0
_02006B44: .4byte sub_0200CDB8
_02006B48:
	str r7, [r6, #8]
	ldr r0, [sp, #0x34]
_02006B4C:
	str r0, [r6, #0xc]
	ldr r0, _02006B6C @ =gUnknown_030056C0
	movs r2, #0x12
	ldrsh r1, [r0, r2]
	asrs r2, r4, #0x10
	subs r1, r1, r2
	adds r6, r0, #0
	cmp r1, #0
	bgt _02006B70
	movs r0, #0x80
	lsls r0, r0, #9
	mov r3, sl
	orrs r3, r0
	mov sl, r3
	b _02006F1C
	.align 2, 0
_02006B6C: .4byte gUnknown_030056C0
_02006B70:
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02006B88
	b _02006F1C
_02006B88:
	ldr r4, [sp, #0x38]
	asrs r0, r4, #0x10
	mov r5, sp
	movs r4, #0xc
	ldrsb r4, [r5, r4]
	adds r3, r0, r4
	asrs r1, r7, #8
	add r0, sp, #4
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r2, r1, r5
	mov sb, r1
	cmp r3, r2
	bgt _02006BB8
	mov r1, sp
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r2
	bge _02006BCA
	cmp r3, r2
	bge _02006BB8
	b _02006F1C
_02006BB8:
	add r0, sp, #4
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _02006BCA
	b _02006F1C
_02006BCA:
	ldr r2, [sp, #0x3c]
	asrs r0, r2, #0x10
	mov r3, sp
	movs r2, #0xd
	ldrsb r2, [r3, r2]
	adds r1, r0, r2
	add r0, sp, #4
	movs r4, #1
	ldrsb r4, [r0, r4]
	mov r5, r8
	adds r3, r5, r4
	cmp r1, r3
	bgt _02006BF8
	mov r5, sp
	movs r0, #0xf
	ldrsb r0, [r5, r0]
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	bge _02006C0A
	cmp r1, r3
	bge _02006BF8
	b _02006F1C
_02006BF8:
	add r0, sp, #4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _02006C0A
	b _02006F1C
_02006C0A:
	ldr r0, [sp, #0x38]
	asrs r1, r0, #0x10
	cmp sb, r1
	ble _02006C14
	b _02006D9C
_02006C14:
	ldr r3, [r6, #0x20]
	movs r2, #1
	ands r2, r3
	cmp r2, #0
	beq _02006C20
	b _02006D4C
_02006C20:
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r4, sl
	orrs r4, r0
	mov sl, r4
	adds r0, r6, #0
	adds r0, #0x62
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	beq _02006C3A
	strh r2, [r6, #0x10]
	b _02006F1C
_02006C3A:
	mov r5, sp
	movs r0, #0xc
	ldrsb r0, [r5, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1, #2]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r7, r0, #8
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _02006C58
	rsbs r1, r1, #0
_02006C58:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _02006C9C
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	cmp r0, #0
	ble _02006C86
	strh r2, [r6, #0x14]
	mov r4, sp
	ldrh r4, [r4, #0x24]
	strh r4, [r6, #0x10]
	ldr r0, [r6, #8]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r0, r5
	str r0, [r6, #8]
	b _02006F1C
_02006C86:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0x20]
	ldr r0, _02006C98 @ =0x0000FE80
	strh r0, [r6, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r6, #0x12]
	b _02006F1C
	.align 2, 0
_02006C98: .4byte 0x0000FE80
_02006C9C:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _02006CA6
	b _02006F1C
_02006CA6:
	asrs r0, r7, #8
	movs r1, #0x16
	ldrsb r1, [r6, r1]
	mov r2, r8
	subs r1, r2, r1
	movs r3, #8
	rsbs r3, r3, #0
	ldr r2, _02006CF0 @ =sub_0200CCC0
	str r2, [sp]
	ldr r2, [sp, #0x2c]
	bl sub_0200D27C
	adds r5, r0, #0
	cmp r5, #0
	bge _02006CF4
	ldr r0, [r6, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r6, #0x20]
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	strh r4, [r6, #0x10]
	lsls r1, r5, #8
	ldr r0, [r6, #8]
	subs r0, r0, r1
	str r0, [r6, #8]
	b _02006F1C
	.align 2, 0
_02006CF0: .4byte sub_0200CCC0
_02006CF4:
	ldr r1, [r6, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02006D2C
	movs r0, #0x20
	orrs r1, r0
	mov r3, sl
	orrs r3, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r6, #0x20]
	ands r3, r0
	mov sl, r3
	adds r0, r6, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r6, #0x16]
	movs r0, #0xe
	strb r0, [r6, #0x17]
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _02006D48 @ =sub_0200F2BC
	str r0, [r6]
_02006D2C:
	ldr r0, [r6, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	mov r5, sl
	ands r5, r1
	mov sl, r5
	strh r4, [r6, #0x14]
	strh r4, [r6, #0x10]
	str r7, [r6, #8]
	ldr r0, [sp, #0x34]
	str r0, [r6, #0xc]
	b _02006F1C
	.align 2, 0
_02006D48: .4byte sub_0200F2BC
_02006D4C:
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	adds r0, r6, #0
	adds r0, #0x62
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq _02006D68
	movs r0, #0
	strh r0, [r6, #0x10]
	b _02006F1C
_02006D68:
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	cmp r3, #0
	bge _02006D76
	rsbs r1, r3, #0
_02006D76:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _02006D80
	b _02006F1C
_02006D80:
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r4, sl
	orrs r4, r0
	mov sl, r4
	cmp r3, #0
	bge _02006D96
	adds r0, r6, #0
	bl sub_02007258
	b _02006F1C
_02006D96:
	strh r2, [r6, #0x14]
	strh r2, [r6, #0x10]
	b _02006F1C
_02006D9C:
	adds r4, r6, #0
	ldr r3, [r4, #0x20]
	movs r5, #1
	mov sb, r5
	adds r2, r3, #0
	ands r2, r5
	cmp r2, #0
	bne _02006DAE
	b _02006ED4
_02006DAE:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r2, sl
	orrs r2, r0
	mov sl, r2
	adds r0, r4, #0
	adds r0, #0x62
	movs r6, #0
	ldrsb r6, [r0, r6]
	cmp r6, #0
	beq _02006DCA
	movs r0, #0
	strh r0, [r4, #0x10]
	b _02006F1C
_02006DCA:
	mov r5, sp
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	adds r0, r1, r0
	add r1, sp, #4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r7, r0, #8
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02006DE8
	rsbs r1, r1, #0
_02006DE8:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _02006E28
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	ldr r2, [sp, #0x24]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _02006E14
	strh r2, [r4, #0x14]
	mov r5, sp
	ldrh r5, [r5, #0x24]
	strh r5, [r4, #0x10]
	ldr r0, [r4, #8]
	ldr r1, _02006E10 @ =0xFFFFFF00
	b _02006E6E
	.align 2, 0
_02006E10: .4byte 0xFFFFFF00
_02006E14:
	movs r0, #2
	orrs r3, r0
	str r3, [r4, #0x20]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r4, #0x10]
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	b _02006F1C
_02006E28:
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _02006F1C
	asrs r0, r7, #8
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r2, _02006E74 @ =sub_0200CCC0
	str r2, [sp]
	ldr r2, [sp, #0x2c]
	movs r3, #8
	bl sub_0200D27C
	adds r5, r0, #0
	cmp r5, #0
	bge _02006E78
	ldr r0, [r4, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #2
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	strh r6, [r4, #0x10]
	lsls r1, r5, #8
	ldr r0, [r4, #8]
_02006E6E:
	adds r0, r0, r1
	str r0, [r4, #8]
	b _02006F1C
	.align 2, 0
_02006E74: .4byte sub_0200CCC0
_02006E78:
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02006EB0
	movs r0, #0x20
	orrs r1, r0
	mov r3, sl
	orrs r3, r0
	subs r0, #0x25
	ands r1, r0
	str r1, [r4, #0x20]
	ands r3, r0
	mov sl, r3
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	ldr r0, _02006ED0 @ =sub_0200F2BC
	str r0, [r4]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
_02006EB0:
	ldr r0, [r4, #0x20]
	mov r5, sb
	orrs r0, r5
	str r0, [r4, #0x20]
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	str r0, [r4, #8]
	ldr r2, [sp, #0x34]
	str r2, [r4, #0xc]
	b _02006F1C
	.align 2, 0
_02006ED0: .4byte sub_0200F2BC
_02006ED4:
	movs r0, #0x80
	lsls r0, r0, #0xa
	orrs r3, r0
	str r3, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x62
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _02006EEC
	strh r2, [r4, #0x10]
	b _02006F1C
_02006EEC:
	ldr r3, [sp, #0x24]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	cmp r3, #0
	bge _02006EFA
	rsbs r1, r3, #0
_02006EFA:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _02006F1C
	movs r0, #0x80
	lsls r0, r0, #0xe
	mov r1, sl
	orrs r1, r0
	mov sl, r1
	cmp r3, #0
	ble _02006F18
	adds r0, r4, #0
	bl sub_02007258
	b _02006F1C
_02006F18:
	strh r5, [r6, #0x14]
	strh r5, [r6, #0x10]
_02006F1C:
	ldr r2, [sp, #0x30]
	cmp r2, #0
	beq _02006F3A
_02006F22:
	ldr r2, _02006F4C @ =gUnknown_030056C0
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _02006F3A
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_02006F3A:
	mov r0, sl
_02006F3C:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02006F4C: .4byte gUnknown_030056C0

	thumb_func_start sub_02006F50
sub_02006F50: @ 0x02006F50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [sp, #0x38]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r2, _02006FB4 @ =gUnknown_030056C0
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02006FAE
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r1, r0
	cmp r1, #0
	bne _02006FAE
	ldr r1, _02006FB8 @ =gRoomEventQueue
	ldr r0, _02006FBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0
	mov sb, r6
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r4, r0
	beq _02006FC0
_02006FAE:
	movs r0, #0
	b _02007248
	.align 2, 0
_02006FB4: .4byte gUnknown_030056C0
_02006FB8: .4byte gRoomEventQueue
_02006FBC: .4byte 0x04000128
_02006FC0:
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _02007074
	ldr r1, [r5, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _02007074
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	ldr r7, _02007154 @ =gUnknown_03000050
	adds r0, r3, r7
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r7, _02007158 @ =gUnknown_0300002C
	adds r0, r3, r7
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r1, r1, r7
	cmp r2, r1
	bgt _0200700C
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0200701E
	cmp r2, r1
	blt _02007074
_0200700C:
	ldr r4, _0200715C @ =gUnknown_0300002E
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r2
	blt _02007074
_0200701E:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r2, r0, r3
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, r0, r4
	cmp r2, r1
	bgt _0200705A
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	bge _0200706C
	cmp r2, r1
	blt _02007074
_0200705A:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r2
	blt _02007074
_0200706C:
	movs r0, #2
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_02007074:
	ldr r0, [r6, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _02007080
	b _02007190
_02007080:
	ldr r0, [r5, #0x28]
	cmp r0, r1
	bne _02007088
	b _02007190
_02007088:
	ldr r4, [sp]
	lsls r3, r4, #0x10
	asrs r1, r3, #0x10
	adds r0, r5, #0
	adds r0, #0x2c
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r1, r7
	mov r2, sb
	adds r2, #0x50
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r0
	add r1, ip
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	cmp r4, r1
	bgt _020070CC
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r4, r0
	cmp r0, r1
	bge _020070E0
	cmp r4, r1
	blt _02007190
_020070CC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, ip
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r4
	blt _02007190
_020070E0:
	ldr r3, [sp, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [sp, #0x10]
	adds r4, r0, r1
	mov r1, sb
	adds r1, #0x52
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r3, #0x35
	ldrsb r7, [r3, r6]
	mov ip, r7
	adds r3, r0, r7
	mov sl, r2
	adds r2, r1, #0
	cmp r4, r3
	bgt _02007124
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #0x10]
	subs r0, r0, r1
	adds r0, r4, r0
	cmp r0, r3
	bge _02007138
	cmp r4, r3
	blt _02007190
_02007124:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r7, ip
	subs r0, r0, r7
	adds r0, r3, r0
	cmp r0, r4
	blt _02007190
_02007138:
	ldr r0, [sp, #8]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r4, [sp, #0xc]
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _02007160
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0200716A
	.align 2, 0
_02007154: .4byte gUnknown_03000050
_02007158: .4byte gUnknown_0300002C
_0200715C: .4byte gUnknown_0300002E
_02007160:
	movs r0, #0x80
	lsls r0, r0, #0xa
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0200716A:
	movs r3, #0
	ldrsh r1, [r2, r3]
	mov r4, sl
	asrs r0, r4, #0x10
	cmp r1, r0
	ble _02007182
	movs r0, #0x80
	lsls r0, r0, #9
	mov r7, r8
	orrs r7, r0
	mov r8, r7
	b _0200718C
_02007182:
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0200718C:
	movs r0, #1
	b _02007240
_02007190:
	ldr r0, [r6, #0x28]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _02007246
	ldr r0, [r5, #0x30]
	cmp r0, r1
	beq _02007246
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r3, r0, r2
	mov r0, sb
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r6, #0
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r1, r1, r4
	cmp r3, r1
	bgt _020071DC
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	bge _020071EE
	cmp r3, r1
	blt _02007246
_020071DC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r1, r0
	cmp r0, r3
	blt _02007246
_020071EE:
	ldr r7, [sp, #4]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r5, #0
	adds r1, #0x35
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r2, r0, r4
	mov r0, sb
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r3, r6, #0
	adds r3, #0x2d
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r1, r0, r3
	cmp r2, r1
	bgt _0200722C
	adds r0, r5, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r2, r0
	cmp r0, r1
	bge _0200723E
	cmp r2, r1
	blt _02007246
_0200722C:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02007246
_0200723E:
	movs r0, #2
_02007240:
	mov r2, r8
	orrs r2, r0
	mov r8, r2
_02007246:
	mov r0, r8
_02007248:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_02007258
sub_02007258: @ 0x02007258
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0200726C
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _02007270
_0200726C:
	movs r0, #0
	b _02007318
_02007270:
	movs r0, #0x78
	strh r0, [r5, #0x2c]
	ldr r1, [r5, #0x20]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02007284
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02007286
_02007284:
	ldr r0, _02007320 @ =0x0000FE80
_02007286:
	strh r0, [r5, #0x10]
	movs r4, #0
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #5
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r0, r1
	ldr r1, _02007324 @ =0xFFFFFBFF
	ands r1, r0
	ldr r0, _02007328 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x14
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x61
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #9
	strb r0, [r1]
	ldr r0, _0200732C @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02007310
	ldr r6, _02007330 @ =gUnknown_030053B0
	ldrh r4, [r6]
	cmp r4, #0xa
	bls _020072F2
	movs r4, #0xa
_020072F2:
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
	adds r2, r4, #0
	bl sub_02011C18
	ldrh r0, [r6]
	subs r0, r0, r4
	strh r0, [r6]
	bl sub_02004CC0
	movs r1, #4
	strb r1, [r0]
	strb r4, [r0, #1]
_02007310:
	movs r0, #0x11
	bl m4aSongNumStart
	movs r0, #1
_02007318:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_02007320: .4byte 0x0000FE80
_02007324: .4byte 0xFFFFFBFF
_02007328: .4byte 0xFFFFFEFF
_0200732C: .4byte gUnknown_03005444
_02007330: .4byte gUnknown_030053B0

	thumb_func_start sub_02007334
sub_02007334: @ 0x02007334
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r0, _02007374 @ =gUnknown_03005460
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	movs r1, #3
	ldrsb r1, [r7, r1]
	cmp r0, r1
	bne _0200737C
	movs r1, #4
	ldrsb r1, [r7, r1]
	lsrs r0, r2, #4
	cmp r1, r0
	bgt _0200737C
	ldr r0, _02007378 @ =sub_02007984
	b _0200737E
	.align 2, 0
_02007374: .4byte gUnknown_03005460
_02007378: .4byte sub_02007984
_0200737C:
	ldr r0, _020074D0 @ =sub_02007ADC
_0200737E:
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _020074D4 @ =sub_02007B88
	str r1, [sp]
	movs r1, #0x88
	movs r3, #0
	bl sub_0200198C
	adds r2, r0, #0
	movs r0, #4
	ldrsb r0, [r7, r0]
	ldr r1, _020074D8 @ =gUnknown_03005460
	ldrb r1, [r1]
	lsrs r1, r1, #4
	cmp r0, r1
	bgt _020073A0
	strb r1, [r7, #4]
_020073A0:
	ldrh r4, [r2, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r4, r2
	ldr r0, _020074DC @ =gUnknown_030053E8
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _020074E0 @ =gUnknown_02015A9E
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r3, _020074E4 @ =gUnknown_03000082
	adds r6, r4, r3
	movs r5, #0
	strb r0, [r6]
	ldr r1, _020074E8 @ =gUnknown_03000080
	adds r0, r4, r1
	strh r5, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r3, sb
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x78]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r3, r8
	lsls r1, r3, #8
	adds r0, r0, r1
	str r0, [r2, #0x7c]
	mov r0, sb
	strh r0, [r2, #4]
	strh r3, [r2, #6]
	str r7, [r2]
	ldrb r0, [r7]
	strb r0, [r2, #8]
	mov r1, sl
	strb r1, [r2, #9]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r7]
	ldr r0, _020074EC @ =gUnknown_0300000C
	adds r7, r4, r0
	ldr r1, _020074F0 @ =gUnknown_0300002E
	adds r0, r4, r1
	movs r3, #0x10
	mov sl, r3
	mov r1, sl
	strb r1, [r0]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r3, _020074F4 @ =gUnknown_0300002D
	adds r1, r4, r3
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _020074F8 @ =gUnknown_03000031
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	str r1, [r7, #0x10]
	movs r0, #0x10
	bl sub_0200479C
	str r0, [r7, #4]
	movs r0, #0x68
	strh r0, [r7, #0xa]
	ldr r3, _020074FC @ =gUnknown_0300002C
	adds r0, r4, r3
	movs r1, #0
	strb r1, [r0]
	adds r0, r7, #0
	bl sub_020030A0
	ldr r3, _02007500 @ =gUnknown_0300003C
	adds r7, r4, r3
	ldr r1, _02007504 @ =gUnknown_0300005E
	adds r0, r4, r1
	mov r3, sl
	strb r3, [r0]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	ldr r0, _02007508 @ =gUnknown_0300005D
	adds r1, r4, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0200750C @ =gUnknown_03000061
	adds r0, r4, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x98
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sb
	str r0, [r7, #0x28]
	mov r1, r8
	str r1, [r7, #0x10]
	movs r0, #4
	bl sub_0200479C
	str r0, [r7, #4]
	ldr r2, _02007510 @ =gUnknown_02015AAE
	ldrb r0, [r6]
	lsls r0, r0, #1
	ldr r3, _020074E0 @ =gUnknown_02015A9E
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r1, _02007514 @ =gUnknown_0300005C
	adds r4, r4, r1
	strb r0, [r4]
	adds r0, r7, #0
	bl sub_020030A0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020074D0: .4byte sub_02007ADC
_020074D4: .4byte sub_02007B88
_020074D8: .4byte gUnknown_03005460
_020074DC: .4byte gUnknown_030053E8
_020074E0: .4byte gUnknown_02015A9E
_020074E4: .4byte gUnknown_03000082
_020074E8: .4byte gUnknown_03000080
_020074EC: .4byte gUnknown_0300000C
_020074F0: .4byte gUnknown_0300002E
_020074F4: .4byte gUnknown_0300002D
_020074F8: .4byte gUnknown_03000031
_020074FC: .4byte gUnknown_0300002C
_02007500: .4byte gUnknown_0300003C
_02007504: .4byte gUnknown_0300005E
_02007508: .4byte gUnknown_0300005D
_0200750C: .4byte gUnknown_03000061
_02007510: .4byte gUnknown_02015AAE
_02007514: .4byte gUnknown_0300005C

	thumb_func_start sub_02007518
sub_02007518: @ 0x02007518
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldr r0, _020075C8 @ =gUnknown_030026D0
	mov sl, r0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov r8, r1
	add r8, r4
	ldr r6, _020075CC @ =gUnknown_02015A9E
	ldr r0, _020075D0 @ =gUnknown_030053E8
	ldr r0, [r0]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	ldr r2, _020075D4 @ =gUnknown_03000082
	adds r3, r4, r2
	movs r1, #0
	mov sb, r1
	strb r0, [r3]
	subs r2, #0x46
	adds r0, r4, r2
	ldr r5, _020075D8 @ =gUnknown_02015AAE
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r5, #2
	adds r1, r1, r5
	ldrh r2, [r1]
	ldr r3, _020075DC @ =gUnknown_0300005C
	adds r1, r4, r3
	strb r2, [r1]
	bl sub_020030A0
	mov r1, r8
	ldr r0, [r1, #0x1c]
	movs r1, #0x20
	orrs r0, r1
	mov r2, r8
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x4c]
	orrs r0, r1
	str r0, [r2, #0x4c]
	ldr r3, _020075E0 @ =gUnknown_0300006C
	adds r4, r4, r3
	mov r0, sb
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #2]
	mov r1, sb
	strh r1, [r4, #4]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	mov r2, sl
	ldr r1, [r2]
	ldr r0, _020075E4 @ =sub_020075E8
	str r0, [r1, #8]
	bl sub_02014CC8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020075C8: .4byte gUnknown_030026D0
_020075CC: .4byte gUnknown_02015A9E
_020075D0: .4byte gUnknown_030053E8
_020075D4: .4byte gUnknown_03000082
_020075D8: .4byte gUnknown_02015AAE
_020075DC: .4byte gUnknown_0300005C
_020075E0: .4byte gUnknown_0300006C
_020075E4: .4byte sub_020075E8

	thumb_func_start sub_020075E8
sub_020075E8: @ 0x020075E8
	push {r4, r5, r6, r7, lr}
	ldr r7, _02007660 @ =gUnknown_030026D0
	ldr r3, [r7]
	ldrh r4, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x6c
	adds r6, r4, r0
	ldr r0, [r5, #0x78]
	ldr r2, _02007664 @ =gUnknown_03005650
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #6]
	ldr r0, [r5, #0x7c]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r6, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _020076B8
	ldr r0, [r5, #0x1c]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r1
	str r0, [r5, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldr r0, _02007668 @ =gUnknown_03000080
	adds r1, r4, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0200766C @ =sub_02007984
	str r0, [r3, #8]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	ldr r5, [r4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	ldr r0, _02007670 @ =gUnknown_03005460
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	beq _02007674
	adds r0, r4, #0
	bl sub_02007BA4
	b _02007704
	.align 2, 0
_02007660: .4byte gUnknown_030026D0
_02007664: .4byte gUnknown_03005650
_02007668: .4byte gUnknown_03000080
_0200766C: .4byte sub_02007984
_02007670: .4byte gUnknown_03005460
_02007674:
	movs r1, #4
	ldrsb r1, [r5, r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	cmp r1, r0
	ble _02007688
	adds r0, r4, #0
	bl sub_02007BF8
	b _02007704
_02007688:
	adds r0, r4, #0
	bl sub_02007CDC
	cmp r0, #0
	beq _02007698
	adds r0, r4, #0
	bl sub_02007820
_02007698:
	adds r0, r4, #0
	bl sub_02007C94
	cmp r0, #0
	beq _020076AE
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r7]
	bl sub_02001A38
	b _02007704
_020076AE:
	adds r0, r4, #0
	movs r1, #0
	bl sub_02007C48
	b _02007704
_020076B8:
	ldr r0, [r5, #0x1c]
	movs r3, #0x20
	rsbs r3, r3, #0
	ands r0, r3
	str r0, [r5, #0x1c]
	ldr r2, _0200770C @ =gUnknown_03005430
	ldrb r1, [r2]
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r3
	str r0, [r5, #0x4c]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x4c]
	orrs r0, r1
	str r0, [r5, #0x4c]
	ldr r0, _02007710 @ =gUnknown_0300000C
	adds r5, r4, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_020033A8
	ldr r1, _02007714 @ =gUnknown_0300003C
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_020033A8
	adds r0, r5, #0
	bl sub_02003D30
	adds r0, r4, #0
	bl sub_02003D30
_02007704:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200770C: .4byte gUnknown_03005430
_02007710: .4byte gUnknown_0300000C
_02007714: .4byte gUnknown_0300003C

	thumb_func_start sub_02007718
sub_02007718: @ 0x02007718
	push {r4, r5, r6, r7, lr}
	ldr r7, _02007790 @ =gUnknown_030026D0
	ldr r3, [r7]
	ldrh r4, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0x6c
	adds r6, r4, r0
	ldr r0, [r5, #0x78]
	ldr r2, _02007794 @ =gUnknown_03005650
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #6]
	ldr r0, [r5, #0x7c]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _020077C0
	ldr r0, [r5, #0x1c]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r1
	str r0, [r5, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldr r0, _02007798 @ =sub_02007ADC
	str r0, [r3, #8]
	ldrh r0, [r3, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r4, [r5]
	movs r1, #3
	ldrsb r1, [r4, r1]
	ldr r0, _0200779C @ =gUnknown_03005460
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	bne _020077A4
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsrs r1, r2, #4
	cmp r0, r1
	bgt _020077A4
	strb r1, [r4, #4]
	ldr r1, [r7]
	ldr r0, _020077A0 @ =sub_02007518
	str r0, [r1, #8]
	b _0200780C
	.align 2, 0
_02007790: .4byte gUnknown_030026D0
_02007794: .4byte gUnknown_03005650
_02007798: .4byte sub_02007ADC
_0200779C: .4byte gUnknown_03005460
_020077A0: .4byte sub_02007518
_020077A4:
	adds r0, r5, #0
	bl sub_02007C94
	cmp r0, #0
	beq _0200780C
	ldrb r0, [r5, #8]
	strb r0, [r4]
	ldr r0, _020077BC @ =gUnknown_030026D0
	ldr r0, [r0]
	bl sub_02001A38
	b _0200780C
	.align 2, 0
_020077BC: .4byte gUnknown_030026D0
_020077C0:
	ldr r0, [r5, #0x1c]
	movs r3, #0x20
	rsbs r3, r3, #0
	ands r0, r3
	str r0, [r5, #0x1c]
	ldr r2, _02007814 @ =gUnknown_03005430
	ldrb r1, [r2]
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x4c]
	ands r0, r3
	str r0, [r5, #0x4c]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x4c]
	orrs r0, r1
	str r0, [r5, #0x4c]
	ldr r0, _02007818 @ =gUnknown_0300000C
	adds r5, r4, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_020033A8
	ldr r1, _0200781C @ =gUnknown_0300003C
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_020033A8
	adds r0, r5, #0
	bl sub_02003D30
	adds r0, r4, #0
	bl sub_02003D30
_0200780C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02007814: .4byte gUnknown_03005430
_02007818: .4byte gUnknown_0300000C
_0200781C: .4byte gUnknown_0300003C

	thumb_func_start sub_02007820
sub_02007820: @ 0x02007820
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x84
	ldrb r0, [r0]
	ldr r2, _020078A0 @ =gUnknown_030056C0
	cmp r0, #1
	bne _02007838
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _02007852
_02007838:
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r2, #0x12]
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x26
	strh r0, [r1]
	adds r1, #2
	ldr r0, _020078A4 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #7
	movs r0, #5
	strb r0, [r1]
_02007852:
	ldr r1, [r5]
	ldrb r0, [r1, #4]
	adds r0, #1
	movs r4, #0
	strb r0, [r1, #4]
	movs r0, #0x13
	bl m4aSongNumStart
	ldr r0, [r5, #0x78]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x7c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BC1C
	adds r0, r5, #0
	adds r0, #0x83
	strb r4, [r0]
	bl sub_02004CC0
	movs r1, #5
	strb r1, [r0]
	ldrh r1, [r5, #4]
	strb r1, [r0, #1]
	ldrh r1, [r5, #6]
	strb r1, [r0, #2]
	ldrb r1, [r5, #9]
	strb r1, [r0, #3]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0, #4]
	ldr r0, _020078A8 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _020078AC @ =sub_020079FC
	str r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020078A0: .4byte gUnknown_030056C0
_020078A4: .4byte 0x0000FFFF
_020078A8: .4byte gUnknown_030026D0
_020078AC: .4byte sub_020079FC

	thumb_func_start sub_020078B0
sub_020078B0: @ 0x020078B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	beq _020078C2
	cmp r0, #1
	beq _02007958
	b _02007964
_020078C2:
	ldr r4, _02007938 @ =gUnknown_02015A98
	ldr r2, _0200793C @ =gUnknown_03005398
	ldr r1, [r2]
	ldr r0, _02007940 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02007944 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #5
	bl sub_02014D9C
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, _02007948 @ =gUnknown_030053B0
	ldrh r5, [r1]
	adds r0, r5, r0
	strh r0, [r1]
	ldr r0, _0200794C @ =gUnknown_03005524
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0200791A
	ldrh r0, [r1]
	movs r1, #0x64
	bl sub_02014CB8
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_02014CB8
	cmp r4, r0
	beq _0200791A
	ldr r0, _02007950 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200791A
	ldr r1, _02007954 @ =gUnknown_030053FC
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _0200791A
	adds r0, #1
	strb r0, [r1]
_0200791A:
	ldr r0, _02007950 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200792E
	ldr r1, _02007948 @ =gUnknown_030053B0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0200792E
	movs r0, #0xff
	strh r0, [r1]
_0200792E:
	movs r0, #0xf
	bl m4aSongNumStart
	b _02007964
	.align 2, 0
_02007938: .4byte gUnknown_02015A98
_0200793C: .4byte gUnknown_03005398
_02007940: .4byte 0x00196225
_02007944: .4byte 0x3C6EF35F
_02007948: .4byte gUnknown_030053B0
_0200794C: .4byte gUnknown_03005524
_02007950: .4byte gUnknown_03005444
_02007954: .4byte gUnknown_030053FC
_02007958:
	bl sub_02004CC0
	movs r1, #6
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
_02007964:
	adds r1, r6, #0
	adds r1, #0x83
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0200797C @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _02007980 @ =sub_02007A9C
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200797C: .4byte gUnknown_030026D0
_02007980: .4byte sub_02007A9C

	thumb_func_start sub_02007984
sub_02007984: @ 0x02007984
	push {r4, r5, r6, lr}
	ldr r6, _020079AC @ =gUnknown_030026D0
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	movs r1, #3
	ldrsb r1, [r5, r1]
	ldr r0, _020079B0 @ =gUnknown_03005460
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	beq _020079B4
	adds r0, r4, #0
	bl sub_02007BA4
	b _020079F6
	.align 2, 0
_020079AC: .4byte gUnknown_030026D0
_020079B0: .4byte gUnknown_03005460
_020079B4:
	movs r1, #4
	ldrsb r1, [r5, r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x1c
	cmp r1, r0
	ble _020079C8
	adds r0, r4, #0
	bl sub_02007BF8
	b _020079F6
_020079C8:
	adds r0, r4, #0
	bl sub_02007CDC
	cmp r0, #0
	beq _020079D8
	adds r0, r4, #0
	bl sub_02007820
_020079D8:
	adds r0, r4, #0
	bl sub_02007C94
	cmp r0, #0
	beq _020079EE
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r6]
	bl sub_02001A38
	b _020079F6
_020079EE:
	adds r0, r4, #0
	movs r1, #0
	bl sub_02007C48
_020079F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_020079FC
sub_020079FC: @ 0x020079FC
	push {r4, lr}
	ldr r0, _02007A24 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x83
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _02007A28
	adds r0, r4, #0
	bl sub_020078B0
	b _02007A36
	.align 2, 0
_02007A24: .4byte gUnknown_030026D0
_02007A28:
	ldr r2, _02007A44 @ =gUnknown_03000080
	adds r1, r3, r2
	ldr r2, _02007A48 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_02007A36:
	adds r0, r4, #0
	movs r1, #1
	bl sub_02007C48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02007A44: .4byte gUnknown_03000080
_02007A48: .4byte 0xFFFFFF00

	thumb_func_start sub_02007A4C
sub_02007A4C: @ 0x02007A4C
	push {r4, lr}
	ldr r0, _02007A74 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x83
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _02007A78
	adds r0, r4, #0
	bl sub_02007C30
	b _02007A86
	.align 2, 0
_02007A74: .4byte gUnknown_030026D0
_02007A78:
	ldr r2, _02007A94 @ =gUnknown_03000080
	adds r1, r3, r2
	ldr r2, _02007A98 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_02007A86:
	adds r0, r4, #0
	movs r1, #1
	bl sub_02007C48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02007A94: .4byte gUnknown_03000080
_02007A98: .4byte 0xFFFFFF00

	thumb_func_start sub_02007A9C
sub_02007A9C: @ 0x02007A9C
	push {r4, lr}
	ldr r4, _02007AC4 @ =gUnknown_030026D0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	adds r0, #0x83
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _02007ACC
	ldr r1, [r4]
	ldr r0, _02007AC8 @ =sub_02007ADC
	str r0, [r1, #8]
	b _02007AD4
	.align 2, 0
_02007AC4: .4byte gUnknown_030026D0
_02007AC8: .4byte sub_02007ADC
_02007ACC:
	adds r0, r3, #0
	movs r1, #1
	bl sub_02007C48
_02007AD4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02007ADC
sub_02007ADC: @ 0x02007ADC
	push {r4, r5, lr}
	ldr r3, _02007B10 @ =gUnknown_030026D0
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r4, [r5]
	movs r1, #3
	ldrsb r1, [r4, r1]
	ldr r0, _02007B14 @ =gUnknown_03005460
	ldrb r2, [r0]
	movs r0, #7
	ands r0, r2
	cmp r1, r0
	bne _02007B1C
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsrs r1, r2, #4
	cmp r0, r1
	bgt _02007B1C
	strb r1, [r4, #4]
	ldr r1, [r3]
	ldr r0, _02007B18 @ =sub_02007518
	str r0, [r1, #8]
	b _02007B32
	.align 2, 0
_02007B10: .4byte gUnknown_030026D0
_02007B14: .4byte gUnknown_03005460
_02007B18: .4byte sub_02007518
_02007B1C:
	adds r0, r5, #0
	bl sub_02007C94
	cmp r0, #0
	beq _02007B32
	ldrb r0, [r5, #8]
	strb r0, [r4]
	ldr r0, _02007B38 @ =gUnknown_030026D0
	ldr r0, [r0]
	bl sub_02001A38
_02007B32:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02007B38: .4byte gUnknown_030026D0

	thumb_func_start sub_02007B3C
sub_02007B3C: @ 0x02007B3C
	push {r4, lr}
	ldr r0, _02007B7C @ =gUnknown_030026D0
	ldr r4, [r0]
	ldrh r2, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	ldr r0, [r1, #0x1c]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r1, #0x1c]
	ldr r0, [r1, #0x4c]
	orrs r0, r3
	str r0, [r1, #0x4c]
	ldr r0, _02007B80 @ =gUnknown_0300006C
	adds r2, r2, r0
	movs r1, #0
	strh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r1, [r2, #6]
	strh r1, [r2, #8]
	ldr r0, _02007B84 @ =sub_02007718
	str r0, [r4, #8]
	bl sub_02014CC8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02007B7C: .4byte gUnknown_030026D0
_02007B80: .4byte gUnknown_0300006C
_02007B84: .4byte sub_02007718

	thumb_func_start sub_02007B88
sub_02007B88: @ 0x02007B88
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl sub_0200487C
	ldr r0, [r4, #0x40]
	bl sub_0200487C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_02007BA4
sub_02007BA4: @ 0x02007BA4
	push {r4, lr}
	ldr r0, _02007BE8 @ =gUnknown_030026D0
	ldr r4, [r0]
	ldr r0, _02007BEC @ =sub_02007B3C
	str r0, [r4, #8]
	ldrh r1, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2, #0x1c]
	movs r3, #0x20
	orrs r0, r3
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x4c]
	orrs r0, r3
	str r0, [r2, #0x4c]
	ldr r0, _02007BF0 @ =gUnknown_0300006C
	adds r1, r1, r0
	movs r2, #0
	strh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	strh r2, [r1, #8]
	ldr r0, _02007BF4 @ =sub_02007718
	str r0, [r4, #8]
	bl sub_02014CC8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02007BE8: .4byte gUnknown_030026D0
_02007BEC: .4byte sub_02007B3C
_02007BF0: .4byte gUnknown_0300006C
_02007BF4: .4byte sub_02007718

	thumb_func_start sub_02007BF8
sub_02007BF8: @ 0x02007BF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x13
	bl m4aSongNumStart
	ldr r0, [r4, #0x78]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r4, #0x7c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BC1C
	adds r4, #0x83
	movs r0, #0
	strb r0, [r4]
	ldr r0, _02007C28 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _02007C2C @ =sub_02007A4C
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02007C28: .4byte gUnknown_030026D0
_02007C2C: .4byte sub_02007A4C

	thumb_func_start sub_02007C30
sub_02007C30: @ 0x02007C30
	adds r0, #0x83
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02007C40 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _02007C44 @ =sub_02007A9C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_02007C40: .4byte gUnknown_030026D0
_02007C44: .4byte sub_02007A9C

	thumb_func_start sub_02007C48
sub_02007C48: @ 0x02007C48
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x78]
	ldr r2, _02007C90 @ =gUnknown_03005650
	ldr r0, [r2]
	subs r3, r3, r0
	strh r3, [r4, #0x22]
	ldr r0, [r4, #0x7c]
	ldr r2, [r2, #4]
	subs r0, r0, r2
	strh r0, [r4, #0x24]
	adds r0, r4, #0
	adds r0, #0x52
	strh r3, [r0]
	adds r0, #0x2e
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r4, #0x24]
	adds r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x54
	strh r0, [r2]
	cmp r1, #0
	bne _02007C82
	adds r0, r4, #0
	adds r0, #0xc
	bl sub_02003D30
_02007C82:
	adds r0, r4, #0
	adds r0, #0x3c
	bl sub_02003D30
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02007C90: .4byte gUnknown_03005650

	thumb_func_start sub_02007C94
sub_02007C94: @ 0x02007C94
	push {lr}
	ldr r1, [r0, #0x78]
	ldr r3, _02007CD0 @ =gUnknown_03005650
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x7c]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _02007CCC
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _02007CCC
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _02007CD4
_02007CCC:
	movs r0, #1
	b _02007CD6
	.align 2, 0
_02007CD0: .4byte gUnknown_03005650
_02007CD4:
	movs r0, #0
_02007CD6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02007CDC
sub_02007CDC: @ 0x02007CDC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r7, _02007D0C @ =gUnknown_030056C0
	ldr r0, [r7, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02007D24
	adds r6, r4, #0
	adds r6, #0xc
	ldr r1, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	adds r0, r6, #0
	bl sub_020062E0
	adds r5, r0, #0
	cmp r5, #0
	beq _02007D10
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #1
	strb r0, [r1]
	b _02007D30
	.align 2, 0
_02007D0C: .4byte gUnknown_030056C0
_02007D10:
	ldr r1, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	str r7, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	movs r3, #0
	bl sub_020061C4
	cmp r0, #0
	bne _02007D28
_02007D24:
	movs r0, #0
	b _02007D30
_02007D28:
	adds r0, r4, #0
	adds r0, #0x84
	strb r5, [r0]
	movs r0, #1
_02007D30:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_02007D38
sub_02007D38: @ 0x02007D38
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _02007DBC @ =sub_02007DE8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r5, #0
	str r5, [sp]
	movs r1, #0x34
	movs r3, #0
	bl sub_0200198C
	adds r6, r0, #0
	ldr r0, _02007DC0 @ =0x0203300C
	ldr r0, [r0]
	ldr r4, [r0]
	lsrs r4, r4, #8
	adds r4, #3
	lsrs r4, r4, #2
	lsls r4, r4, #4
	ldr r0, _02007DC4 @ =0x0203F000
	adds r4, r4, r0
	ldr r0, _02007DC8 @ =0x02033008
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_02014CBC
	ldrh r0, [r6, #6]
	ldr r1, _02007DCC @ =gUnknown_03000030
	adds r0, r0, r1
	str r4, [r0]
	ldrh r2, [r6, #6]
	subs r1, #0x30
	adds r1, r2, r1
	movs r4, #0
	strh r5, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _02007DD0 @ =0x06012E40
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	movs r0, #0x6a
	strh r0, [r1, #0xa]
	ldr r3, _02007DD4 @ =gUnknown_03000020
	adds r0, r2, r3
	strb r4, [r0]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _02007DD8 @ =gUnknown_03000021
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _02007DDC @ =gUnknown_03000022
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _02007DE0 @ =gUnknown_03000025
	adds r2, r2, r3
	strb r4, [r2]
	ldr r0, _02007DE4 @ =0x00042200
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02007DBC: .4byte sub_02007DE8
_02007DC0: .4byte 0x0203300C
_02007DC4: .4byte 0x0203F000
_02007DC8: .4byte 0x02033008
_02007DCC: .4byte gUnknown_03000030
_02007DD0: .4byte 0x06012E40
_02007DD4: .4byte gUnknown_03000020
_02007DD8: .4byte gUnknown_03000021
_02007DDC: .4byte gUnknown_03000022
_02007DE0: .4byte gUnknown_03000025
_02007DE4: .4byte 0x00042200

	thumb_func_start sub_02007DE8
sub_02007DE8: @ 0x02007DE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r5, _02008100 @ =gUnknown_030056C0
	ldrb r4, [r5, #0x16]
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	rsbs r2, r3, #0
	mov r0, sp
	adds r0, #5
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl sub_02014E5C
	ldr r0, _02008104 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02007E2A
	b _02008418
_02007E2A:
	ldr r0, _02008108 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	ldr r2, _0200810C @ =gUnknown_03000030
	adds r0, r1, r2
	ldr r0, [r0]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x14]
	adds r0, r1, #0
	bl sub_020030A0
	ldr r3, [sp, #0x14]
	ldr r3, [r3, #0xc]
	str r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	adds r4, #4
	ldm r4!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldm r4!, {r0}
	str r4, [sp, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r6, _02008100 @ =gUnknown_030056C0
	ldr r1, [r6, #0xc]
	asrs r1, r1, #8
	mov r0, sp
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _02007E8C
	b _02008048
_02007E8C:
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blo _02007E94
	b _02008048
_02007E94:
	mov r1, sp
	str r1, [sp, #0x20]
_02007E98:
	ldr r3, _02008100 @ =gUnknown_030056C0
	ldr r2, [r3, #8]
	asrs r1, r2, #8
	ldr r4, [sp, #0x20]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	subs r0, #8
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	ldr r3, [r3, #0xc]
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x3c]
	cmp r7, r0
	ble _02007EC4
	b _02008026
_02007EC4:
	ldr r0, [sp, #8]
	cmp r7, r0
	blo _02007ECC
	b _02008026
_02007ECC:
	ldr r1, [sp, #8]
	mov r0, sl
	muls r0, r1, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r7, #1
	str r6, [sp, #0x38]
	cmp r0, #0
	bne _02007EE8
	b _02008006
_02007EE8:
	subs r0, #8
	adds r5, r4, r0
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _02007EF6
	b _02008006
_02007EF6:
	mov r0, sp
	str r0, [sp, #0x24]
_02007EFA:
	cmp r1, #0xfe
	beq _02007FF4
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r2, sl
	lsls r0, r2, #8
	adds r1, r1, r0
	mov r8, r1
	movs r3, #0
	cmp r3, #0
	bne _02007F32
	ldr r0, _02008110 @ =gUnknown_03005524
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02007FF4
	ldr r4, _02008100 @ =gUnknown_030056C0
	ldr r1, [r4, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _02007FF4
_02007F32:
	mov r2, sb
	subs r2, #8
	ldr r6, _02008100 @ =gUnknown_030056C0
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [sp, #0x24]
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02007F54
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _02007F62
	cmp r2, r1
	blt _02007FF4
_02007F54:
	ldr r4, [sp, #0x24]
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02007FF4
_02007F62:
	mov r2, r8
	subs r2, #0x10
	ldr r6, _02008100 @ =gUnknown_030056C0
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	ldr r1, [sp, #0x24]
	movs r3, #1
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02007F80
	cmp r8, r1
	bge _02007F8E
	cmp r2, r1
	blt _02007FF4
_02007F80:
	ldr r4, [sp, #0x24]
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02007FF4
_02007F8E:
	ldr r1, _02008114 @ =gUnknown_030053B0
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _02008110 @ =gUnknown_03005524
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02007FCC
	ldrh r0, [r1]
	movs r1, #0x64
	bl sub_02014CB8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl sub_02014CB8
	cmp r4, r0
	beq _02007FCC
	ldr r0, _02008118 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #0
	bne _02007FCC
	ldr r1, _0200811C @ =gUnknown_030053FC
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _02007FCC
	adds r0, #1
	strb r0, [r1]
_02007FCC:
	ldr r0, _02008118 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02007FE0
	ldr r1, _02008114 @ =gUnknown_030053B0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _02007FE0
	movs r0, #0xff
	strh r0, [r1]
_02007FE0:
	mov r6, sb
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BD0C
	movs r0, #0xfe
	strb r0, [r5]
_02007FF4:
	adds r5, #2
	ldrb r1, [r5]
	adds r0, r1, #0
	ldr r4, _02008100 @ =gUnknown_030056C0
	ldr r3, [r4, #0xc]
	ldr r2, [r4, #8]
	cmp r0, #0xff
	beq _02008006
	b _02007EFA
_02008006:
	ldr r6, [sp, #0x38]
	lsls r0, r6, #0x10
	lsrs r7, r0, #0x10
	asrs r1, r2, #8
	ldr r4, [sp, #0x20]
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp r7, r0
	bgt _02008026
	ldr r6, [sp, #8]
	cmp r7, r6
	bhs _02008026
	b _02007ECC
_02008026:
	ldr r1, [sp, #0x3c]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	asrs r1, r3, #8
	ldr r2, [sp, #0x20]
	movs r0, #3
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _02008048
	ldr r3, [sp, #0xc]
	cmp sl, r3
	bhs _02008048
	b _02007E98
_02008048:
	ldr r0, _02008118 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bhi _02008052
	b _0200827C
_02008052:
	movs r2, #0
_02008054:
	ldr r0, _02008120 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r4, r2, #1
	str r4, [sp, #0x30]
	cmp r2, r0
	bne _02008066
	b _02008270
_02008066:
	ldr r1, _02008124 @ =gRoomEventQueue
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _02008074
	b _02008270
_02008074:
	ldrh r2, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r4, r2, r6
	ldr r1, _02008128 @ =gUnknown_03000052
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r6, #0x2d
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r3, _0200812C @ =gUnknown_0300002F
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	ble _020080AC
	b _02008270
_020080AC:
	ldr r6, [sp, #0xc]
	cmp sl, r6
	blo _020080B4
	b _02008270
_020080B4:
	ldr r0, _02008130 @ =gUnknown_03000050
	adds r0, r2, r0
	str r0, [sp, #0x28]
	ldr r1, _02008134 @ =gUnknown_0300002C
	adds r1, r2, r1
	str r1, [sp, #0x2c]
	subs r3, #1
	adds r3, r2, r3
	str r3, [sp, #0x44]
_020080C6:
	ldr r6, [sp, #0x28]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	subs r1, #8
	lsls r1, r1, #8
	lsrs r7, r1, #0x10
	ldr r3, [sp, #0x44]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r1, r1, r0
	adds r1, #0x10
	asrs r1, r1, #8
	mov r6, sl
	adds r6, #1
	str r6, [sp, #0x3c]
	adds r0, r4, #0
	adds r0, #0x52
	str r0, [sp, #0x40]
	adds r2, r4, #0
	adds r2, #0x2f
	str r2, [sp, #0x34]
	cmp r7, r1
	ble _020080FE
	b _0200824A
_020080FE:
	b _02008242
	.align 2, 0
_02008100: .4byte gUnknown_030056C0
_02008104: .4byte gUnknown_030053D4
_02008108: .4byte gUnknown_030026D0
_0200810C: .4byte gUnknown_03000030
_02008110: .4byte gUnknown_03005524
_02008114: .4byte gUnknown_030053B0
_02008118: .4byte gUnknown_03005444
_0200811C: .4byte gUnknown_030053FC
_02008120: .4byte 0x04000128
_02008124: .4byte gRoomEventQueue
_02008128: .4byte gUnknown_03000052
_0200812C: .4byte gUnknown_0300002F
_02008130: .4byte gUnknown_03000050
_02008134: .4byte gUnknown_0300002C
_02008138:
	ldr r6, [sp, #8]
	mov r0, sl
	muls r0, r6, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r3, r7, #1
	str r3, [sp, #0x38]
	cmp r0, #0
	beq _02008226
	subs r0, #8
	adds r5, r2, r0
	b _0200821E
_02008158:
	cmp r1, #0xfe
	beq _0200821C
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r6, sl
	lsls r0, r6, #8
	adds r1, r1, r0
	mov r8, r1
	mov r2, sb
	subs r2, #8
	ldr r1, [sp, #0x28]
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r6, [sp, #0x2c]
	movs r3, #0
	ldrsb r3, [r6, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02008194
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _020081A2
	cmp r2, r1
	blt _0200821C
_02008194:
	ldr r6, [sp, #0x44]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0200821C
_020081A2:
	mov r2, r8
	subs r2, #0x10
	ldr r1, [sp, #0x40]
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r3, #0
	ldrsb r3, [r1, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _020081C2
	cmp r8, r1
	bge _020081D0
	cmp r2, r1
	blt _0200821C
_020081C2:
	ldr r6, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r6, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0200821C
_020081D0:
	ldrb r1, [r4, #0xa]
	ldr r3, _020082D0 @ =gUnknown_02015C50
	ldr r2, _020082D4 @ =gUnknown_03005478
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0xe4
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _02008208
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0200821C
_02008208:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BD0C
	movs r0, #0xfe
	strb r0, [r5]
_0200821C:
	adds r5, #2
_0200821E:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _02008158
_02008226:
	ldr r3, [sp, #0x38]
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	ldr r6, [sp, #0x28]
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, [sp, #0x44]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r0, #0x10
	asrs r0, r0, #8
	cmp r7, r0
	bgt _0200824A
_02008242:
	ldr r3, [sp, #8]
	cmp r7, r3
	bhs _0200824A
	b _02008138
_0200824A:
	ldr r6, [sp, #0x3c]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp, #0x40]
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	adds r0, #8
	asrs r0, r0, #8
	cmp sl, r0
	bgt _02008270
	ldr r6, [sp, #0xc]
	cmp sl, r6
	bhs _02008270
	b _020080C6
_02008270:
	ldr r1, [sp, #0x30]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0200827C
	b _02008054
_0200827C:
	ldr r2, _020082D8 @ =gUnknown_03005650
	ldr r1, [r2, #4]
	lsls r0, r1, #8
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #8
	adds r1, #0xa0
	cmp r0, r1
	blt _02008290
	b _02008418
_02008290:
	ldr r2, [sp, #0xc]
	cmp sl, r2
	blo _02008298
	b _02008418
_02008298:
	ldr r3, _020082D8 @ =gUnknown_03005650
	ldr r0, [r3]
	lsls r1, r0, #8
	lsrs r7, r1, #0x10
	lsls r1, r7, #8
	adds r0, #0xf0
	cmp r1, r0
	blt _020082AA
	b _020083FA
_020082AA:
	ldr r4, [sp, #8]
	cmp r7, r4
	blo _020082B2
	b _020083FA
_020082B2:
	ldr r6, [sp, #8]
	mov r0, sl
	muls r0, r6, r0
	lsls r1, r7, #2
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _020082CA
	b _020083E0
_020082CA:
	subs r0, #8
	adds r5, r2, r0
	b _020083D6
	.align 2, 0
_020082D0: .4byte gUnknown_02015C50
_020082D4: .4byte gUnknown_03005478
_020082D8: .4byte gUnknown_03005650
_020082DC:
	cmp r1, #0xfe
	beq _02008318
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, sl
	lsls r0, r3, #8
	adds r1, r1, r0
	mov r8, r1
	ldr r4, _0200831C @ =gUnknown_03005650
	ldr r0, [r4]
	mov r6, sb
	subs r0, r6, r0
	adds r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bhi _02008318
	ldr r0, [r4, #4]
	mov r1, r8
	subs r0, r1, r0
	cmp r0, #0
	blt _02008318
	subs r0, #0x10
	cmp r0, #0xa0
	ble _02008320
_02008318:
	adds r5, #2
	b _020083D6
	.align 2, 0
_0200831C: .4byte gUnknown_03005650
_02008320:
	adds r5, #2
	ldr r2, [sp, #0x14]
	adds r2, #0x23
	ldr r3, [sp, #0x18]
	cmp r3, #0
	beq _02008334
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _02008358
_02008334:
	movs r0, #0xff
	strb r0, [r2]
	ldr r4, _02008354 @ =gUnknown_03005650
	ldr r0, [r4]
	mov r6, sb
	subs r0, r6, r0
	ldr r1, [sp, #0x14]
	strh r0, [r1, #0x16]
	ldr r0, [r4, #4]
	mov r2, r8
	subs r0, r2, r0
	strh r0, [r1, #0x18]
	ldr r0, [sp, #0x14]
	bl sub_02003D30
	b _020083CC
	.align 2, 0
_02008354: .4byte gUnknown_03005650
_02008358:
	ldrb r1, [r1]
	lsls r1, r1, #3
	ldr r0, _02008428 @ =gUnknown_030022B0
	adds r6, r1, r0
	ldr r3, [sp, #0x14]
	ldrh r0, [r3, #0x1a]
	movs r4, #0xf8
	lsls r4, r4, #3
	adds r1, r4, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_020043FC
	adds r4, r0, #0
	ldr r0, _0200842C @ =gUnknown_030057D8
	ldr r0, [r0]
	cmp r0, r4
	beq _02008418
	ldr r1, _02008430 @ =0x040000D4
	str r6, [r1]
	str r4, [r1, #4]
	ldr r0, _02008434 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r3, [r4, #2]
	movs r6, #0xfe
	lsls r6, r6, #8
	adds r0, r6, #0
	ands r3, r0
	strh r3, [r4, #2]
	ldrh r2, [r4]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r4]
	ldr r6, _02008438 @ =gUnknown_03005650
	ldr r0, [r6, #4]
	mov r1, r8
	subs r0, r1, r0
	ldr r6, [sp, #0x1c]
	ldrh r1, [r6, #0xa]
	subs r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r4]
	ldr r1, _02008438 @ =gUnknown_03005650
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	ldrh r1, [r6, #8]
	subs r0, r0, r1
	ldr r6, _0200843C @ =0x000001FF
	adds r1, r6, #0
	ands r0, r1
	adds r3, r3, r0
	strh r3, [r4, #2]
_020083CC:
	ldr r0, [sp, #0x18]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
_020083D6:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _020083E0
	b _020082DC
_020083E0:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r2, _02008438 @ =gUnknown_03005650
	ldr r0, [r2]
	adds r0, #0xf0
	cmp r1, r0
	bge _020083FA
	ldr r3, [sp, #8]
	cmp r7, r3
	bhs _020083FA
	b _020082B2
_020083FA:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r0, #8
	ldr r4, _02008438 @ =gUnknown_03005650
	ldr r0, [r4, #4]
	adds r0, #0xa0
	cmp r1, r0
	bge _02008418
	ldr r6, [sp, #0xc]
	cmp sl, r6
	bhs _02008418
	b _02008298
_02008418:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02008428: .4byte gUnknown_030022B0
_0200842C: .4byte gUnknown_030057D8
_02008430: .4byte 0x040000D4
_02008434: .4byte 0x80000003
_02008438: .4byte gUnknown_03005650
_0200843C: .4byte 0x000001FF

	thumb_func_start sub_02008440
sub_02008440: @ 0x02008440
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _02008500 @ =sub_02008978
	movs r1, #0x90
	lsls r1, r1, #2
	ldr r2, _02008504 @ =0x00002102
	ldr r3, _02008508 @ =sub_020089CC
	str r3, [sp]
	movs r3, #0
	bl sub_0200198C
	ldr r1, _0200850C @ =gUnknown_0300553C
	movs r2, #0
	str r2, [r1]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	mov r8, r0
	movs r5, #0
	movs r0, #0xa0
	lsls r0, r0, #1
	mov r1, r8
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	strh r2, [r1, #0x14]
	strh r2, [r1, #0x1c]
	ldr r2, _02008510 @ =gUnknown_03000021
	adds r1, r4, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _02008514 @ =gUnknown_03000022
	adds r1, r4, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _02008518 @ =gUnknown_03000025
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #0xb
	mov r2, r8
	str r0, [r2, #0x10]
	movs r0, #0xc
	bl sub_0200479C
	mov r1, r8
	str r0, [r1, #4]
	movs r0, #0x6e
	strh r0, [r1, #0xa]
	ldr r2, _0200851C @ =gUnknown_03000020
	adds r0, r4, r2
	strb r5, [r0]
	mov r0, r8
	bl sub_020030A0
	movs r6, #0
	movs r0, #0
	mov sl, r0
	movs r7, #0
	ldr r1, _02008520 @ =gUnknown_03000034
	adds r5, r4, r1
	ldr r2, _02008524 @ =gUnknown_03000052
	adds r2, r2, r4
	mov sb, r2
	ldr r0, _02008528 @ =gUnknown_03000030
	adds r4, r4, r0
_020084CC:
	strh r7, [r5, #0x12]
	strh r7, [r5, #0x14]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #0x16]
	strh r7, [r5, #4]
	movs r0, #0x6f
	strh r0, [r5, #6]
	strb r6, [r5, #0x1c]
	strh r7, [r5, #0x10]
	strh r7, [r5, #0x18]
	movs r0, #0xff
	strb r0, [r5, #0x1d]
	movs r0, #0x10
	strb r0, [r5, #0x1e]
	mov r2, sl
	mov r1, sb
	strb r2, [r1, #3]
	str r7, [r5, #0xc]
	cmp r6, #0
	bne _0200852C
	movs r0, #0x16
	bl sub_0200479C
	b _02008534
	.align 2, 0
_02008500: .4byte sub_02008978
_02008504: .4byte 0x00002102
_02008508: .4byte sub_020089CC
_0200850C: .4byte gUnknown_0300553C
_02008510: .4byte gUnknown_03000021
_02008514: .4byte gUnknown_03000022
_02008518: .4byte gUnknown_03000025
_0200851C: .4byte gUnknown_03000020
_02008520: .4byte gUnknown_03000034
_02008524: .4byte gUnknown_03000052
_02008528: .4byte gUnknown_03000030
_0200852C:
	lsls r1, r6, #6
	mov r2, r8
	ldr r0, [r2, #0x34]
	adds r0, r0, r1
_02008534:
	str r0, [r5]
	adds r0, r4, #0
	bl sub_020030A0
	adds r5, #0x30
	movs r0, #0x30
	add sb, r0
	adds r4, #0x30
	adds r6, #1
	cmp r6, #0xa
	bls _020084CC
	movs r6, #0
	ldr r3, _0200857C @ =gUnknown_03001820
	ldr r0, _02008580 @ =gUnknown_03002040
	ldr r2, _02008584 @ =gUnknown_02015AF8
	adds r1, r0, #0
	adds r1, #0xe0
_02008556:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	adds r6, #1
	cmp r6, #0xf
	bls _02008556
	ldr r0, [r3]
	movs r1, #2
	orrs r0, r1
	str r0, [r3]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200857C: .4byte gUnknown_03001820
_02008580: .4byte gUnknown_03002040
_02008584: .4byte gUnknown_02015AF8

	thumb_func_start sub_02008588
sub_02008588: @ 0x02008588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r1, _02008718 @ =gUnknown_03005408
	ldr r0, [r1]
	movs r1, #0x3c
	bl sub_02014CB8
	adds r4, r0, #0
	ldr r0, _02008718 @ =gUnknown_03005408
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0200871C @ =gUnknown_02015ABC
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	bl sub_02014CB8
	adds r5, r0, #0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r1, #0
	bl sub_02003060
	lsls r6, r0, #0x10
	lsrs r1, r6, #0x10
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_02014CB8
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r5, r5, r1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	adds r0, r1, #0
	bl sub_02003060
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	mov sl, r0
	ldr r0, _02008718 @ =gUnknown_03005408
	ldr r1, [r0]
	ldr r0, _02008720 @ =0x00000E0F
	cmp r1, r0
	bhi _0200861E
	ldr r0, _02008724 @ =gUnknown_03005500
	ldr r0, [r0]
	movs r1, #0x10
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sl, r0
_0200861E:
	movs r2, #8
	movs r5, #0x26
	movs r4, #0xf
	adds r1, r4, #0
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	movs r1, #0
	mov sb, r1
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r0, #0x10
	movs r1, #0x84
	lsls r1, r1, #2
	mov r8, r1
	adds r3, r7, r1
	strh r0, [r3, #0x16]
	strh r5, [r3, #0x18]
	ldr r0, _02008728 @ =0x00000235
	adds r0, r7, r0
	str r0, [sp, #8]
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r2, #0x18
	lsrs r1, r6, #0x14
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r2, #0x20
	adds r1, r4, #0
	ldr r0, [sp, #4]
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r0, #0x28
	mov r1, r8
	adds r3, r7, r1
	strh r0, [r3, #0x16]
	strh r5, [r3, #0x18]
	mov r1, sb
	ldr r0, [sp, #8]
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r2, #0x30
	ldr r0, [sp]
	lsrs r1, r0, #4
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r2, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r1, #0x38
	ldr r0, [sp]
	ands r4, r0
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x30
	adds r3, r7, r0
	strh r1, [r3, #0x16]
	strh r5, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02008718: .4byte gUnknown_03005408
_0200871C: .4byte gUnknown_02015ABC
_02008720: .4byte 0x00000E0F
_02008724: .4byte gUnknown_03005500
_02008728: .4byte 0x00000235

	thumb_func_start sub_0200872C
sub_0200872C: @ 0x0200872C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	movs r2, #0
	ldr r0, _020087E4 @ =gUnknown_03005528
	ldrb r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020087D2
	mov sl, r2
_0200874A:
	mov r4, sb
	movs r0, #0x1a
	muls r0, r2, r0
	strh r0, [r4, #0x16]
	mov r0, sl
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_02003D30
	ldr r0, _020087E8 @ =gUnknown_030053A8
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_02003060
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #0x16]
	adds r0, #0x17
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r4, #0x18]
	adds r0, #0x13
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r2, [sp]
	adds r2, #1
	mov r8, r2
_0200878A:
	movs r0, #0xf
	ands r0, r5
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x30
	mov r0, sb
	adds r4, r0, r1
	strh r7, [r4, #0x16]
	strh r6, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x25
	mov r1, sl
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_02003D30
	lsls r0, r7, #0x10
	ldr r1, _020087EC @ =0xFFF80000
	adds r0, r0, r1
	lsrs r7, r0, #0x10
	lsrs r5, r5, #4
	cmp r5, #0
	bne _0200878A
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #3
	bhi _020087D2
	ldr r0, _020087E4 @ =gUnknown_03005528
	ldrb r0, [r0]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200874A
_020087D2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_020087E4: .4byte gUnknown_03005528
_020087E8: .4byte gUnknown_030053A8
_020087EC: .4byte 0xFFF80000

	thumb_func_start sub_020087F0
sub_020087F0: @ 0x020087F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r5, _0200896C @ =gUnknown_0300553C
	ldr r0, [r5]
	movs r1, #0x3c
	bl sub_02014CB8
	adds r4, r0, #0
	ldr r1, [r5]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _02008970 @ =gUnknown_02015ABC
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x3c
	bl sub_02014CB8
	adds r5, r0, #0
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r1, #0
	bl sub_02003060
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_02014CB8
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	subs r5, r5, r1
	lsls r5, r5, #0x10
	lsrs r1, r5, #0x10
	adds r0, r1, #0
	bl sub_02003060
	movs r2, #8
	movs r6, #0x36
	movs r5, #0xf
	adds r1, r5, #0
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	movs r2, #1
	mov sb, r2
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r0, #0x10
	movs r7, #0x84
	lsls r7, r7, #2
	mov r2, r8
	adds r3, r2, r7
	strh r0, [r3, #0x16]
	strh r6, [r3, #0x18]
	ldr r0, _02008974 @ =0x00000235
	add r0, r8
	mov sl, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r1, #0x18
	lsrs r4, r4, #0x14
	ands r4, r5
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x30
	mov r2, r8
	adds r3, r2, r0
	strh r1, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r2, #0x20
	adds r1, r5, #0
	ldr r0, [sp, #4]
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r0, #0x28
	mov r1, r8
	adds r3, r1, r7
	strh r0, [r3, #0x16]
	strh r6, [r3, #0x18]
	movs r0, #0
	mov r2, sl
	strb r0, [r2]
	adds r0, r3, #0
	bl sub_02003D30
	movs r2, #0x30
	ldr r0, [sp]
	lsrs r1, r0, #4
	ands r1, r5
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x30
	mov r1, r8
	adds r3, r1, r0
	strh r2, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	movs r1, #0x38
	ldr r0, [sp]
	ands r5, r0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r0, #0x30
	mov r2, r8
	adds r3, r2, r0
	strh r1, [r3, #0x16]
	strh r6, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x25
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #0
	bl sub_02003D30
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200896C: .4byte gUnknown_0300553C
_02008970: .4byte gUnknown_02015ABC
_02008974: .4byte 0x00000235

	thumb_func_start sub_02008978
sub_02008978: @ 0x02008978
	push {r4, lr}
	ldr r0, _020089C0 @ =gUnknown_030053D4
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	bne _020089B8
	ldr r0, _020089C4 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _020089B2
	adds r0, r4, #0
	bl sub_02008588
	ldr r0, _020089C8 @ =gUnknown_0300553C
	ldr r0, [r0]
	cmp r0, #0
	beq _020089B2
	adds r0, r4, #0
	bl sub_020087F0
_020089B2:
	adds r0, r4, #0
	bl sub_0200872C
_020089B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020089C0: .4byte gUnknown_030053D4
_020089C4: .4byte gUnknown_030026D0
_020089C8: .4byte gUnknown_0300553C

	thumb_func_start sub_020089CC
sub_020089CC: @ 0x020089CC
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl sub_0200487C
	ldr r0, [r4, #0x34]
	bl sub_0200487C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_020089E8
sub_020089E8: @ 0x020089E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _02008A70 @ =sub_02008B1C
	ldr r2, _02008A74 @ =0x00002001
	ldr r1, _02008A78 @ =0x02008F4D
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl sub_0200198C
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	movs r5, #0
	strb r4, [r0]
	ldr r0, _02008A7C @ =gUnknown_03000010
	adds r1, r2, r0
	ldr r3, _02008A80 @ =gUnknown_03000004
	adds r6, r2, r3
	ldr r0, _02008A84 @ =0x06013640
	str r0, [r1, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #0x40
	strh r0, [r1, #0x1a]
	strh r5, [r1, #8]
	strh r5, [r1, #0x14]
	strh r5, [r1, #0x1c]
	ldr r0, _02008A88 @ =gUnknown_03000031
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _02008A8C @ =gUnknown_03000032
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _02008A90 @ =gUnknown_03000035
	adds r0, r2, r3
	strb r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	ldr r0, _02008A94 @ =0x000C0060
	str r0, [r1, #0x10]
	movs r0, #0x6d
	strh r0, [r1, #0xa]
	ldr r0, _02008A98 @ =gUnknown_03000030
	adds r2, r2, r0
	mov r3, r8
	strb r3, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r5, [r6]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02008A70: .4byte sub_02008B1C
_02008A74: .4byte 0x00002001
_02008A78: .4byte 0x02008F4D
_02008A7C: .4byte gUnknown_03000010
_02008A80: .4byte gUnknown_03000004
_02008A84: .4byte 0x06013640
_02008A88: .4byte gUnknown_03000031
_02008A8C: .4byte gUnknown_03000032
_02008A90: .4byte gUnknown_03000035
_02008A94: .4byte 0x000C0060
_02008A98: .4byte gUnknown_03000030

	thumb_func_start sub_02008A9C
sub_02008A9C: @ 0x02008A9C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _02008B04 @ =sub_02008F30
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #0x30
	movs r3, #0
	bl sub_0200198C
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	ldr r1, _02008B08 @ =0x06013640
	str r1, [r0, #4]
	movs r5, #0
	movs r1, #0x40
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	ldr r1, _02008B0C @ =gUnknown_03000021
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _02008B10 @ =gUnknown_03000022
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _02008B14 @ =gUnknown_03000025
	adds r1, r3, r2
	strb r5, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #0xb
	str r1, [r0, #0x10]
	movs r1, #0x6d
	strh r1, [r0, #0xa]
	ldr r1, _02008B18 @ =gUnknown_03000020
	adds r3, r3, r1
	strb r5, [r3]
	bl sub_020030A0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02008B04: .4byte sub_02008F30
_02008B08: .4byte 0x06013640
_02008B0C: .4byte gUnknown_03000021
_02008B10: .4byte gUnknown_03000022
_02008B14: .4byte gUnknown_03000025
_02008B18: .4byte gUnknown_03000020

	thumb_func_start sub_02008B1C
sub_02008B1C: @ 0x02008B1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _02008BAC @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r3, #0xc0
	lsls r3, r3, #0x12
	adds r0, r1, r3
	ldr r2, _02008BB0 @ =gRoomEventQueue
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	adds r6, r4, r3
	ldr r0, _02008BB4 @ =gUnknown_03000010
	adds r0, r1, r0
	str r0, [sp]
	ldr r2, _02008BB8 @ =gUnknown_03000004
	adds r2, r2, r1
	mov sl, r2
	adds r3, #0x50
	adds r0, r4, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, _02008BBC @ =gUnknown_03005650
	ldr r0, [r2]
	subs r1, r1, r0
	adds r5, r2, #0
	cmp r1, #0xf0
	bhi _02008B78
	adds r3, #2
	adds r0, r4, r3
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r5, #4]
	subs r0, r1, r0
	cmp r0, #0
	blt _02008B78
	cmp r0, #0xa0
	bgt _02008B78
	b _02008F1A
_02008B78:
	adds r2, r6, #0
	adds r2, #0x50
	ldrh r0, [r2]
	subs r0, #0x78
	ldr r3, [r5]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	adds r1, r6, #0
	adds r1, #0x52
	ldrh r0, [r1]
	subs r0, #0x50
	ldr r5, [r5, #4]
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0xf0
	lsls r0, r0, #2
	adds r7, r2, #0
	cmp r3, r0
	ble _02008BC8
	ldr r0, _02008BC0 @ =0xFFFFFA60
	adds r4, r3, r0
	ldr r3, _02008BC4 @ =0xFFFFFCA0
	b _02008BD2
	.align 2, 0
_02008BAC: .4byte gUnknown_030026D0
_02008BB0: .4byte gRoomEventQueue
_02008BB4: .4byte gUnknown_03000010
_02008BB8: .4byte gUnknown_03000004
_02008BBC: .4byte gUnknown_03005650
_02008BC0: .4byte 0xFFFFFA60
_02008BC4: .4byte 0xFFFFFCA0
_02008BC8:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r4, r3, r0
	movs r3, #0xd8
	lsls r3, r3, #2
_02008BD2:
	adds r2, r5, r3
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, r0, r4
	cmp r0, #0xf0
	bhi _02008BEE
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, r0, r2
	cmp r0, #0
	blt _02008BEE
	cmp r0, #0xa0
	bgt _02008BEE
	b _02008F1A
_02008BEE:
	movs r3, #0
	ldrsh r0, [r7, r3]
	subs r0, #0x78
	subs r4, r0, r4
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r0, #0x50
	subs r2, r0, r2
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _02008C0A
	rsbs r1, r1, #0
_02008C0A:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _02008C14
	rsbs r0, r0, #0
_02008C14:
	cmp r0, r1
	bge _02008C1A
	adds r0, r1, #0
_02008C1A:
	adds r3, r4, #0
	cmp r4, #0
	bge _02008C22
	rsbs r3, r4, #0
_02008C22:
	adds r1, r2, #0
	cmp r2, #0
	bge _02008C2A
	rsbs r1, r2, #0
_02008C2A:
	cmp r1, r3
	bge _02008C30
	adds r1, r3, #0
_02008C30:
	cmp r0, r1
	ble _02008C3E
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r0, r2, #0x10
	lsrs r6, r0, #0x10
_02008C3E:
	mov r2, ip
	lsls r1, r2, #0x10
	lsrs r4, r1, #0x10
	lsls r0, r6, #0x10
	lsrs r3, r0, #0x10
	adds r5, r1, #0
	str r0, [sp, #4]
	ldr r6, [sp]
	adds r6, #0x22
	cmp r5, #0
	beq _02008CAA
	cmp r0, #0
	beq _02008CAA
	lsls r2, r3, #0x10
	b _02008C90
_02008C5C:
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r2, r2, r0
	lsls r2, r2, #0xf
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r3, r1, #0x10
	lsrs r4, r2, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _02008C7C
	rsbs r0, r0, #0
_02008C7C:
	cmp r0, #1
	ble _02008CAA
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	adds r2, r0, #0
	cmp r1, #0
	bge _02008C8C
	rsbs r1, r1, #0
_02008C8C:
	cmp r1, #1
	ble _02008CAA
_02008C90:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _02008C9A
	rsbs r0, r0, #0
_02008C9A:
	cmp r0, #0x7f
	bgt _02008C5C
	asrs r0, r2, #0x10
	cmp r0, #0
	bge _02008CA6
	rsbs r0, r0, #0
_02008CA6:
	cmp r0, #0x7f
	bgt _02008C5C
_02008CAA:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	cmp r1, #0
	bge _02008CB6
	rsbs r0, r1, #0
_02008CB6:
	cmp r0, #1
	bgt _02008CCA
	lsls r0, r3, #0x10
	movs r2, #0xc0
	lsls r2, r2, #2
	cmp r0, #0
	ble _02008CEE
	movs r2, #0x80
	lsls r2, r2, #1
	b _02008CEE
_02008CCA:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r2, r0, #0
	cmp r0, #0
	bge _02008CD6
	rsbs r2, r0, #0
_02008CD6:
	cmp r2, #1
	bgt _02008CE6
	movs r2, #0x80
	lsls r2, r2, #2
	cmp r1, #0
	ble _02008CEE
	movs r2, #0
	b _02008CEE
_02008CE6:
	bl sub_02002FA0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_02008CEE:
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, _02008D20 @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1]
	asrs r0, r5, #0x10
	adds r1, r0, #0
	muls r1, r0, r1
	ldr r3, [sp, #4]
	asrs r0, r3, #0x10
	adds r3, r0, #0
	muls r3, r0, r3
	adds r0, r3, #0
	adds r1, r1, r0
	ldr r0, _02008D24 @ =0x0000FFFF
	adds r4, r2, #0
	cmp r1, r0
	bgt _02008D28
	movs r0, #0x18
	b _02008D2A
	.align 2, 0
_02008D20: .4byte 0x000003FF
_02008D24: .4byte 0x0000FFFF
_02008D28:
	movs r0, #0x10
_02008D2A:
	strb r0, [r6]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	cmp r1, r2
	ble _02008D3E
	movs r0, #0x40
	mov r1, sl
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	b _02008D70
_02008D3E:
	ldr r0, _02008D50 @ =0x0000FFFF
	cmp r1, r0
	bgt _02008D54
	movs r0, #0xf0
	lsls r0, r0, #1
	mov r2, sl
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	b _02008D70
	.align 2, 0
_02008D50: .4byte 0x0000FFFF
_02008D54:
	subs r1, r2, r1
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _02008D7C @ =0x000005FF
	bl sub_02014CB8
	adds r0, #0x40
	mov r3, sl
	strh r0, [r3, #2]
	strh r0, [r3, #4]
_02008D70:
	asrs r4, r4, #0x10
	cmp r4, #0
	bne _02008D80
	movs r5, #0x50
_02008D78:
	movs r0, #0xf0
	b _02008EDE
	.align 2, 0
_02008D7C: .4byte 0x000005FF
_02008D80:
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r4, r6
	bne _02008D8E
	movs r5, #0xa0
	movs r0, #0x78
	b _02008EDE
_02008D8E:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bne _02008D9A
	movs r5, #0x50
	b _02008EDC
_02008D9A:
	movs r0, #0xc0
	lsls r0, r0, #2
	mov sb, r0
	cmp r4, sb
	bne _02008DAA
	movs r5, #0
	movs r0, #0x78
	b _02008EDE
_02008DAA:
	cmp r5, #0
	ble _02008E10
	ldr r7, _02008DF4 @ =gUnknown_02014FB8
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r4, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl sub_02014CB8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #5
	adds r1, #0x50
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r1, [sp, #4]
	cmp r1, #0
	ble _02008DFC
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _02008D78
	movs r5, #0xa0
	subs r1, r6, r4
	ldr r0, _02008DF8 @ =0x000003FF
	ands r1, r0
	b _02008E62
	.align 2, 0
_02008DF4: .4byte gUnknown_02014FB8
_02008DF8: .4byte 0x000003FF
_02008DFC:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _02008D78
	movs r5, #0
	subs r1, r6, r4
	ldr r0, _02008E0C @ =0x000003FF
	ands r1, r0
	b _02008EAC
	.align 2, 0
_02008E0C: .4byte 0x000003FF
_02008E10:
	ldr r7, _02008E90 @ =gUnknown_02014FB8
	ldr r2, _02008E94 @ =0xFFFFFE00
	adds r1, r4, r2
	ldr r3, _02008E98 @ =0x000003FF
	mov r8, r3
	ands r1, r3
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl sub_02014CB8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #5
	movs r0, #0x50
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _02008E9C
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _02008EDC
	movs r5, #0xa0
	mov r2, sb
	subs r1, r2, r4
	mov r3, r8
	ands r1, r3
_02008E62:
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl sub_02014CB8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #4
	adds r1, #0x78
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	b _02008EDE
	.align 2, 0
_02008E90: .4byte gUnknown_02014FB8
_02008E94: .4byte 0xFFFFFE00
_02008E98: .4byte 0x000003FF
_02008E9C:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _02008EDC
	movs r5, #0
	mov r0, sb
	subs r1, r0, r4
	mov r2, r8
	ands r1, r2
_02008EAC:
	lsls r0, r1, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #8
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	bl sub_02014CB8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #2
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0x78
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _02008EDE
_02008EDC:
	movs r0, #0
_02008EDE:
	mov r3, sl
	strh r0, [r3, #6]
	strh r5, [r3, #8]
	ldr r1, [sp]
	ldr r0, [r1, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	ldr r2, [sp]
	str r0, [r2, #0x10]
	ldr r2, _02008F2C @ =gUnknown_03005430
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [sp]
	ldr r0, [r3, #0x10]
	orrs r0, r1
	str r0, [r3, #0x10]
	ldr r0, [sp]
	bl sub_020030A0
	ldr r0, [sp]
	mov r1, sl
	bl sub_020033A8
	ldr r0, [sp]
	bl sub_02003D30
_02008F1A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02008F2C: .4byte gUnknown_03005430

	thumb_func_start sub_02008F30
sub_02008F30: @ 0x02008F30
	push {lr}
	ldr r0, _02008F48 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_020030A0
	pop {r0}
	bx r0
	.align 2, 0
_02008F48: .4byte gUnknown_030026D0
_02008F4C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_02008F50
sub_02008F50: @ 0x02008F50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _02008FB4 @ =sub_0200910C
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _02008FB8 @ =sub_0200A02C
	str r1, [sp]
	movs r1, #0x6c
	movs r3, #0
	bl sub_0200198C
	adds r6, r0, #0
	ldrh r3, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r3
	mov ip, r0
	ldr r1, _02008FBC @ =gUnknown_03000056
	adds r0, r3, r1
	movs r1, #0
	strb r4, [r0]
	ldr r0, _02008FC0 @ =gUnknown_03000054
	adds r2, r3, r0
	movs r0, #0x40
	strh r0, [r2]
	mov r2, ip
	str r1, [r2, #0x44]
	str r1, [r2, #0x48]
	ldr r2, _02008FC4 @ =gUnknown_03000066
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	ldr r0, _02008FC8 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _02008FD0
	ldr r0, _02008FCC @ =gUnknown_03000060
	adds r1, r3, r0
	movs r0, #0x1e
	b _02008FD6
	.align 2, 0
_02008FB4: .4byte sub_0200910C
_02008FB8: .4byte sub_0200A02C
_02008FBC: .4byte gUnknown_03000056
_02008FC0: .4byte gUnknown_03000054
_02008FC4: .4byte gUnknown_03000066
_02008FC8: .4byte 0x04000128
_02008FCC: .4byte gUnknown_03000060
_02008FD0:
	ldr r2, _02009030 @ =gUnknown_03000060
	adds r1, r3, r2
	movs r0, #0
_02008FD6:
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x57
	movs r3, #0
	movs r0, #0x80
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x61
	strb r3, [r0]
	mov r0, ip
	str r3, [r0, #0x5c]
	mov r2, ip
	adds r2, #0x56
	ldrb r1, [r2]
	adds r0, #0x64
	strb r1, [r0]
	ldr r0, _02009034 @ =gUnknown_03005444
	ldrb r0, [r0]
	adds r5, r2, #0
	cmp r0, #5
	beq _0200900C
	mov r1, ip
	ldr r0, [r1, #0x5c]
	movs r1, #2
	orrs r0, r1
	mov r2, ip
	str r0, [r2, #0x5c]
_0200900C:
	mov r1, ip
	adds r1, #0x50
	movs r4, #0
	strh r3, [r1]
	mov r2, ip
	adds r2, #0x52
	strh r3, [r2]
	ldr r0, _02009038 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02009054
	cmp r0, #1
	bgt _0200903C
	cmp r0, #0
	beq _02009046
	b _0200907C
	.align 2, 0
_02009030: .4byte gUnknown_03000060
_02009034: .4byte gUnknown_03005444
_02009038: .4byte 0x04000128
_0200903C:
	cmp r0, #2
	beq _02009064
	cmp r0, #3
	beq _02009074
	b _0200907C
_02009046:
	movs r0, #0xe8
	strh r0, [r1]
	ldr r0, _02009050 @ =0x0000033D
	b _0200907A
	.align 2, 0
_02009050: .4byte 0x0000033D
_02009054:
	ldr r0, _0200905C @ =0x00000631
	strh r0, [r1]
	ldr r0, _02009060 @ =0x00000117
	b _0200907A
	.align 2, 0
_0200905C: .4byte 0x00000631
_02009060: .4byte 0x00000117
_02009064:
	ldr r0, _0200906C @ =0x00000631
	strh r0, [r1]
	ldr r0, _02009070 @ =0x0000039E
	b _0200907A
	.align 2, 0
_0200906C: .4byte 0x00000631
_02009070: .4byte 0x0000039E
_02009074:
	movs r0, #0xe8
	strh r0, [r1]
	adds r0, #0x74
_0200907A:
	strh r0, [r2]
_0200907C:
	mov r4, ip
	movs r2, #0
	movs r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	adds r3, r4, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	ldrb r0, [r5]
	adds r3, #3
	strb r0, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	strh r1, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r2, [r0]
	strh r1, [r4, #0x16]
	strh r1, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x3c]
	ldr r0, _020090E4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r5]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _020090E8
	movs r0, #0x40
	bl sub_0200479C
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _020090EC
	.align 2, 0
_020090E4: .4byte 0x04000128
_020090E8:
	ldr r0, _02009104 @ =0x06010000
	str r0, [r4, #4]
_020090EC:
	adds r0, r4, #0
	bl sub_020030A0
	ldr r1, _02009108 @ =gRoomEventQueue
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	str r6, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02009104: .4byte 0x06010000
_02009108: .4byte gRoomEventQueue

	thumb_func_start sub_0200910C
sub_0200910C: @ 0x0200910C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _02009210 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	adds r7, r5, #0
	adds r0, #0x38
	adds r0, r6, r0
	str r0, [sp]
	ldr r1, _02009214 @ =gUnknown_03000056
	adds r3, r6, r1
	ldrb r2, [r3]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _02009218 @ =gUnknown_03001870
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0200921C @ =gUnknown_03001930
	mov sb, r4
	movs r4, #1
	adds r1, r4, #0
	lsls r1, r2
	mov r2, sb
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	bne _02009154
	b _02009608
_02009154:
	ldr r0, _02009220 @ =gUnknown_03000061
	adds r2, r6, r0
	movs r1, #0
	mov ip, r1
	mov r0, ip
	strb r0, [r2]
	adds r1, r4, #0
	ldrb r3, [r3]
	lsls r1, r3
	mov r3, sb
	ldr r0, [r3]
	ands r0, r1
	cmp r0, #0
	bne _02009172
	b _02009608
_02009172:
	mov r4, r8
	ldrh r1, [r4]
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r1, r0
	beq _02009180
	b _02009608
_02009180:
	mov r0, ip
	strb r0, [r2]
	ldr r0, _02009224 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	beq _0200918E
	b _02009290
_0200918E:
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r3, _02009228 @ =gUnknown_03000050
	adds r3, r3, r6
	mov ip, r3
	movs r4, #0
	ldrsh r0, [r3, r4]
	subs r4, r1, r0
	str r4, [r5, #0x44]
	mov r0, r8
	movs r1, #4
	ldrsh r0, [r0, r1]
	mov sb, r0
	ldr r3, _0200922C @ =gUnknown_03000052
	adds r2, r6, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r3, sb
	subs r1, r3, r0
	str r1, [r5, #0x48]
	adds r0, r4, #0
	cmp r4, #0
	bge _020091BE
	rsbs r0, r4, #0
_020091BE:
	mov r3, ip
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0xf
	ble _02009276
	adds r0, r1, #0
	cmp r1, #0
	bge _020091D0
	rsbs r0, r1, #0
_020091D0:
	ldr r2, _02009228 @ =gUnknown_03000050
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r3, _0200922C @ =gUnknown_03000052
	adds r3, r6, r3
	str r3, [sp, #8]
	cmp r0, #0xf
	ble _02009276
	cmp r4, #0
	ble _02009238
	cmp r1, #0
	ble _02009238
	mov r4, r8
	movs r6, #2
	ldrsh r0, [r4, r6]
	ldr r1, _02009230 @ =0xFFFFFA60
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	str r0, [r5, #0x44]
	ldr r4, [sp, #8]
	movs r6, #0
	ldrsh r1, [r4, r6]
	mov r2, r8
	movs r3, #4
	ldrsh r0, [r2, r3]
	ldr r4, _02009234 @ =0xFFFFFCA0
	adds r0, r0, r4
	subs r1, r1, r0
	str r1, [r5, #0x48]
	b _02009276
	.align 2, 0
_02009210: .4byte gUnknown_030026D0
_02009214: .4byte gUnknown_03000056
_02009218: .4byte gUnknown_03001870
_0200921C: .4byte gUnknown_03001930
_02009220: .4byte gUnknown_03000061
_02009224: .4byte gUnknown_03005444
_02009228: .4byte gUnknown_03000050
_0200922C: .4byte gUnknown_03000052
_02009230: .4byte 0xFFFFFA60
_02009234: .4byte 0xFFFFFCA0
_02009238:
	ldr r0, [r7, #0x44]
	adds r6, r7, #0
	adds r6, #0x50
	str r6, [sp, #4]
	adds r1, r7, #0
	adds r1, #0x52
	str r1, [sp, #8]
	cmp r0, #0
	bge _02009276
	ldr r0, [r7, #0x48]
	cmp r0, #0
	bge _02009276
	mov r2, r8
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r4, #0
	ldrsh r0, [r6, r4]
	ldr r6, _02009288 @ =0xFFFFFA60
	adds r0, r0, r6
	subs r1, r1, r0
	str r1, [r7, #0x44]
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r3, _0200928C @ =0xFFFFFCA0
	adds r0, r0, r3
	mov r4, r8
	movs r6, #4
	ldrsh r1, [r4, r6]
	subs r0, r0, r1
	str r0, [r7, #0x48]
_02009276:
	mov r1, r8
	ldrh r0, [r1, #2]
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldrh r0, [r1, #4]
	ldr r3, [sp, #8]
	strh r0, [r3]
	b _020092C2
	.align 2, 0
_02009288: .4byte 0xFFFFFA60
_0200928C: .4byte 0xFFFFFCA0
_02009290:
	mov r4, r8
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r2, _020092EC @ =gUnknown_03000050
	adds r3, r6, r2
	movs r4, #0
	ldrsh r1, [r3, r4]
	subs r0, r0, r1
	str r0, [r5, #0x44]
	mov r1, r8
	movs r2, #4
	ldrsh r0, [r1, r2]
	ldr r4, _020092F0 @ =gUnknown_03000052
	adds r2, r6, r4
	movs r6, #0
	ldrsh r1, [r2, r6]
	subs r0, r0, r1
	str r0, [r5, #0x48]
	mov r1, r8
	ldrh r0, [r1, #2]
	strh r0, [r3]
	ldrh r0, [r1, #4]
	strh r0, [r2]
	str r3, [sp, #4]
	str r2, [sp, #8]
_020092C2:
	ldr r0, [r7, #0x44]
	adds r1, r0, #0
	cmp r0, #0
	bge _020092CC
	rsbs r1, r0, #0
_020092CC:
	cmp r1, #0x40
	bgt _020092DC
	ldr r1, [r7, #0x48]
	cmp r1, #0
	bge _020092D8
	rsbs r1, r1, #0
_020092D8:
	cmp r1, #0x40
	ble _020092F4
_020092DC:
	adds r0, r7, #0
	adds r0, #0x66
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	b _02009304
	.align 2, 0
_020092EC: .4byte gUnknown_03000050
_020092F0: .4byte gUnknown_03000052
_020092F4:
	lsls r0, r0, #8
	adds r1, r7, #0
	adds r1, #0x66
	strh r0, [r1]
	ldr r0, [r7, #0x48]
	lsls r0, r0, #8
	adds r1, #2
	strh r0, [r1]
_02009304:
	adds r1, r7, #0
	adds r1, #0x57
	mov r2, r8
	ldrb r0, [r2, #0xa]
	strb r0, [r1]
	ldrh r2, [r2, #8]
	adds r0, r7, #0
	adds r0, #0x54
	strh r2, [r0]
	ldr r3, _02009338 @ =0x04000128
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	subs r1, #1
	lsrs r0, r0, #0x1e
	adds r6, r1, #0
	ldrb r4, [r6]
	cmp r0, r4
	beq _0200933C
	movs r0, #0xc0
	lsls r0, r0, #3
	ands r0, r2
	lsrs r0, r0, #9
	adds r1, #0xe
	strb r0, [r1]
	b _020093F4
	.align 2, 0
_02009338: .4byte 0x04000128
_0200933C:
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	adds r4, r7, #0
	adds r4, #0x64
	ldrb r2, [r4]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _020093F4
	ldr r1, _0200943C @ =gRoomEventQueue
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	ldr r2, _02009440 @ =gUnknown_03000064
	adds r1, r1, r2
	lsrs r0, r0, #0x1e
	ldrb r1, [r1]
	cmp r0, r1
	bne _020093F4
	ldr r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r4]
	ldr r4, _02009444 @ =gUnknown_030056C0
	ldr r0, [r4, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	movs r3, #5
	rsbs r3, r3, #0
	mov sl, r3
	ands r0, r3
	adds r1, #0x10
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _02009448 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _0200944C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
	ldr r0, _02009450 @ =sub_0200F2BC
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r2, _02009454 @ =0xFFBFFFFF
	ands r0, r2
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x5c]
	mov r3, sl
	ands r0, r3
	str r0, [r7, #0x5c]
	mov r1, sb
	ldr r0, [r1, #0x5c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _020093F4
	ldr r0, [r4, #0x20]
	ands r0, r2
	str r0, [r4, #0x20]
	mov r2, sb
	ldr r0, [r2, #0x5c]
	ands r0, r3
	str r0, [r2, #0x5c]
_020093F4:
	ldr r0, _02009458 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r2, [r6]
	lsrs r0, r0, #0x1e
	cmp r0, r2
	bne _02009460
	ldr r1, _0200945C @ =gUnknown_030053A8
	adds r1, r2, r1
	mov r3, r8
	ldrh r0, [r3, #6]
	lsrs r0, r0, #8
	strb r0, [r1]
	ldrb r1, [r3, #6]
	ldrb r0, [r3, #0xb]
	movs r2, #0xf
	ands r2, r0
	ldrh r0, [r5, #0xa]
	adds r3, r5, #0
	adds r3, #0x20
	cmp r0, r1
	bne _02009426
	ldrb r0, [r3]
	cmp r0, r2
	beq _0200942E
_02009426:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_0200942E:
	adds r0, r7, #0
	adds r0, #0x6a
	strh r1, [r0]
	strh r1, [r5, #0xa]
	strb r2, [r3]
	b _020095E2
	.align 2, 0
_0200943C: .4byte gRoomEventQueue
_02009440: .4byte gUnknown_03000064
_02009444: .4byte gUnknown_030056C0
_02009448: .4byte 0xFFFFFBFF
_0200944C: .4byte 0xFFFFFEFF
_02009450: .4byte sub_0200F2BC
_02009454: .4byte 0xFFBFFFFF
_02009458: .4byte 0x04000128
_0200945C: .4byte gUnknown_030053A8
_02009460:
	ldr r1, _02009488 @ =gUnknown_030053A8
	adds r1, r2, r1
	mov r2, r8
	ldrh r0, [r2, #6]
	lsrs r0, r0, #8
	strb r0, [r1]
	ldrb r1, [r2, #6]
	adds r0, r7, #0
	adds r0, #0x6a
	strh r1, [r0]
	ldrh r2, [r5, #0xa]
	subs r0, r1, #2
	cmp r0, #0x35
	bls _0200947E
	b _020095C0
_0200947E:
	lsls r0, r0, #2
	ldr r1, _0200948C @ =_02009490
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02009488: .4byte gUnknown_030053A8
_0200948C: .4byte _02009490
_02009490: @ jump table
	.4byte _02009568 @ case 0
	.4byte _0200957C @ case 1
	.4byte _0200957C @ case 2
	.4byte _020095C0 @ case 3
	.4byte _020095C0 @ case 4
	.4byte _020095C0 @ case 5
	.4byte _020095C0 @ case 6
	.4byte _02009590 @ case 7
	.4byte _0200957C @ case 8
	.4byte _0200957C @ case 9
	.4byte _020095C0 @ case 10
	.4byte _020095C0 @ case 11
	.4byte _020095C0 @ case 12
	.4byte _020095C0 @ case 13
	.4byte _020095C0 @ case 14
	.4byte _020095C0 @ case 15
	.4byte _020095C0 @ case 16
	.4byte _020095C0 @ case 17
	.4byte _020095C0 @ case 18
	.4byte _020095C0 @ case 19
	.4byte _020095C0 @ case 20
	.4byte _020095C0 @ case 21
	.4byte _020095C0 @ case 22
	.4byte _020095C0 @ case 23
	.4byte _020095C0 @ case 24
	.4byte _020095C0 @ case 25
	.4byte _020095C0 @ case 26
	.4byte _020095C0 @ case 27
	.4byte _020095C0 @ case 28
	.4byte _020095C0 @ case 29
	.4byte _020095C0 @ case 30
	.4byte _020095C0 @ case 31
	.4byte _020095C0 @ case 32
	.4byte _020095C0 @ case 33
	.4byte _020095C0 @ case 34
	.4byte _020095C0 @ case 35
	.4byte _020095C0 @ case 36
	.4byte _020095C0 @ case 37
	.4byte _020095C0 @ case 38
	.4byte _020095C0 @ case 39
	.4byte _020095C0 @ case 40
	.4byte _020095C0 @ case 41
	.4byte _020095C0 @ case 42
	.4byte _020095C0 @ case 43
	.4byte _020095C0 @ case 44
	.4byte _020095C0 @ case 45
	.4byte _020095C0 @ case 46
	.4byte _020095C0 @ case 47
	.4byte _020095C0 @ case 48
	.4byte _020095C0 @ case 49
	.4byte _020095C0 @ case 50
	.4byte _020095C0 @ case 51
	.4byte _020095C0 @ case 52
	.4byte _020095A4 @ case 53
_02009568:
	ldr r0, _02009578 @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	b _020095CA
	.align 2, 0
_02009578: .4byte gUnknown_02015B18
_0200957C:
	ldr r0, _0200958C @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #3
	b _020095CA
	.align 2, 0
_0200958C: .4byte gUnknown_02015B18
_02009590:
	ldr r0, _020095A0 @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #2
	b _020095CA
	.align 2, 0
_020095A0: .4byte gUnknown_02015B18
_020095A4:
	ldr r1, _020095B8 @ =gUnknown_02015B18
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #2
	strh r0, [r5, #0xa]
	ldr r0, _020095BC @ =0x0000FFFF
	strh r0, [r5, #0x1e]
	b _020095CC
	.align 2, 0
_020095B8: .4byte gUnknown_02015B18
_020095BC: .4byte 0x0000FFFF
_020095C0:
	ldr r0, _02009604 @ =gUnknown_02015B18
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_020095CA:
	strh r0, [r5, #0xa]
_020095CC:
	ldrh r3, [r5, #0xa]
	cmp r2, r3
	beq _020095DA
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_020095DA:
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
_020095E2:
	mov r4, r8
	ldrb r0, [r4, #0xb]
	lsrs r0, r0, #4
	adds r1, r7, #0
	adds r1, #0x58
	strb r0, [r1]
	mov r6, r8
	ldrb r0, [r6, #0xc]
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	ldrb r0, [r6, #0xd]
	lsls r0, r0, #2
	ldr r1, [sp]
	strh r0, [r1]
	b _02009684
	.align 2, 0
_02009604: .4byte gUnknown_02015B18
_02009608:
	adds r3, r7, #0
	adds r3, #0x50
	adds r0, r7, #0
	adds r0, #0x66
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r3]
	adds r0, r0, r2
	strh r0, [r3]
	adds r2, r7, #0
	adds r2, #0x52
	adds r0, r7, #0
	adds r0, #0x68
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r4, [r2]
	adds r0, r0, r4
	strh r0, [r2]
	adds r4, r7, #0
	adds r4, #0x61
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0x1e
	bls _02009684
	ldr r1, _0200966C @ =0x0000FFFF
	movs r0, #0
	bl sub_02001D78
	ldr r1, _02009670 @ =gUnknown_03002AC4
	ldr r0, _02009674 @ =gUnknown_0300285C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _02009678 @ =gUnknown_03005370
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200967C @ =gUnknown_03004D3C
	ldr r0, _02009680 @ =gUnknown_03002A64
	ldrb r0, [r0]
	strb r0, [r1]
	bl sub_020127D8
	b _02009AC8
	.align 2, 0
_0200966C: .4byte 0x0000FFFF
_02009670: .4byte gUnknown_03002AC4
_02009674: .4byte gUnknown_0300285C
_02009678: .4byte gUnknown_03005370
_0200967C: .4byte gUnknown_03004D3C
_02009680: .4byte gUnknown_03002A64
_02009684:
	movs r2, #3
	ldr r3, _0200975C @ =gUnknown_02015C50
	movs r6, #6
	ldrsh r0, [r3, r6]
	ldrh r1, [r5, #0xa]
	movs r4, #0x54
	adds r4, r4, r7
	mov r8, r4
	ldr r4, _02009760 @ =gUnknown_03005650
	cmp r0, r1
	ble _020096B6
_0200969A:
	lsls r0, r2, #0x18
	movs r6, #0xff
	lsls r6, r6, #0x18
	adds r0, r0, r6
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _020096B6
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	cmp r0, r1
	bgt _0200969A
_020096B6:
	ldr r1, [r4]
	ldr r2, [sp, #4]
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r1, [r4, #4]
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r1, [r4]
	ldrh r0, [r2]
	subs r0, r0, r1
	ldr r6, [sp]
	strh r0, [r6, #6]
	ldr r1, [r4, #4]
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r6, #8]
	mov r0, r8
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _020096FA
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
_020096FA:
	adds r0, r5, #0
	bl sub_020030A0
	ldr r0, _02009764 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _02009778
	ldr r0, [r7, #0x54]
	ldr r1, _02009768 @ =0x80000004
	ands r0, r1
	cmp r0, #0
	bne _02009778
	ldr r2, _0200976C @ =gUnknown_030056C0
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _020097BE
	ldr r0, [r7, #0x5c]
	ands r0, r3
	cmp r0, #0
	bne _02009778
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02009778
	ldr r0, [r2, #0x20]
	ldr r1, _02009770 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _02009778
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _02009774 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _020097E2
	bl sub_02009ADC
	b _020097E2
	.align 2, 0
_0200975C: .4byte gUnknown_02015C50
_02009760: .4byte gUnknown_03005650
_02009764: .4byte gUnknown_030053D4
_02009768: .4byte 0x80000004
_0200976C: .4byte gUnknown_030056C0
_02009770: .4byte 0x00400080
_02009774: .4byte 0x04000128
_02009778:
	ldr r2, _02009824 @ =gUnknown_030056C0
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r1, [r0]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _020097BE
	adds r0, r7, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _020097BE
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bne _020097BE
	ldr r0, [r2, #0x20]
	ands r0, r3
	cmp r0, #0
	bne _020097BE
	ldr r1, _02009828 @ =gUnknown_0300542C
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _020097E2
_020097BE:
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _020097E2
	ldr r0, [r2, #0x3c]
	cmp r0, r5
	bne _020097E2
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r1, r7, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_020097E2:
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02009856
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	ldr r2, _0200982C @ =gUnknown_03005430
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r5, #0x10]
	orrs r0, r1
	str r0, [r5, #0x10]
	ldrh r1, [r6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02009830
	movs r0, #0xff
	lsls r0, r0, #8
	ldr r1, [sp]
	strh r0, [r1, #2]
	b _02009838
	.align 2, 0
_02009824: .4byte gUnknown_030056C0
_02009828: .4byte gUnknown_0300542C
_0200982C: .4byte gUnknown_03005430
_02009830:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp]
	strh r0, [r2, #2]
_02009838:
	mov r3, r8
	ldrh r1, [r3]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0200984C
	ldr r4, [sp]
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_0200984C:
	adds r0, r5, #0
	ldr r1, [sp]
	bl sub_020033A8
	b _0200989C
_02009856:
	ldr r2, [r5, #0x10]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r5, #0x10]
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _02009874
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	b _02009878
_02009874:
	ldr r0, _02009890 @ =0xFFFFFBFF
	ands r2, r0
_02009878:
	str r2, [r5, #0x10]
	mov r0, r8
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _02009894
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0200989A
	.align 2, 0
_02009890: .4byte 0xFFFFFBFF
_02009894:
	ldr r0, [r5, #0x10]
	ldr r1, _020099D8 @ =0xFFFFF7FF
	ands r0, r1
_0200989A:
	str r0, [r5, #0x10]
_0200989C:
	ldr r1, [r5, #0x10]
	ldr r0, _020099DC @ =0xFFFFCFFF
	ands r1, r0
	str r1, [r5, #0x10]
	mov r3, r8
	ldrh r2, [r3]
	movs r0, #0x30
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r5, #0x10]
	ldrh r3, [r3]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _020098BE
	b _02009AB8
_020098BE:
	ldr r0, _020099E0 @ =gUnknown_03005500
	ldr r0, [r0]
	movs r6, #2
	ands r0, r6
	adds r4, r7, #0
	adds r4, #0x57
	cmp r0, #0
	bne _02009916
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _02009916
	ldr r2, [r7, #0x5c]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _02009916
	ldr r1, _020099E4 @ =gUnknown_0300542C
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02009916
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _02009904
	b _02009AB8
_02009904:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _0200990E
	b _02009AB8
_0200990E:
	ands r2, r6
	cmp r2, #0
	beq _02009916
	b _02009AB8
_02009916:
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #0x80
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	cmp r0, #0
	beq _0200992E
	movs r3, #0x88
	lsls r3, r3, #3
	adds r1, r3, #0
_0200992E:
	strh r1, [r5, #0x1a]
	ldr r6, [r5, #0x10]
	ldr r0, _020099E8 @ =0xFFFFFE7F
	ands r6, r0
	str r6, [r5, #0x10]
	ldrb r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _020099B2
	ldr r0, _020099EC @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #4
	bne _0200997A
	ldr r0, _020099F0 @ =gUnknown_03005528
	ldrb r3, [r0]
	adds r0, r7, #0
	adds r0, #0x56
	ldrb r0, [r0]
	movs r2, #0x10
	adds r1, r2, #0
	lsls r1, r0
	ands r1, r3
	adds r0, #4
	asrs r1, r0
	ldr r4, _020099F4 @ =0x04000128
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r2, r0
	ands r3, r2
	ldr r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r1, r3
	beq _020099B2
_0200997A:
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	bne _020099B2
	adds r1, r7, #0
	adds r1, #0x56
	ldr r0, _020099F4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldrb r1, [r1]
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _020099B2
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r6, r0
	str r6, [r5, #0x10]
	ldr r2, _020099F8 @ =gUnknown_03002820
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _020099FC @ =gUnknown_03002250
	ldr r0, _02009A00 @ =0x0000083F
	strh r0, [r1, #0xa]
_020099B2:
	ldrh r0, [r5, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _02009A04
	movs r6, #0x18
	ldrsh r1, [r5, r6]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _02009A04
	cmp r1, #0xdf
	bgt _02009A04
	adds r0, r5, #0
	bl sub_02003D30
	b _02009AB8
	.align 2, 0
_020099D8: .4byte 0xFFFFF7FF
_020099DC: .4byte 0xFFFFCFFF
_020099E0: .4byte gUnknown_03005500
_020099E4: .4byte gUnknown_0300542C
_020099E8: .4byte 0xFFFFFE7F
_020099EC: .4byte gUnknown_03005444
_020099F0: .4byte gUnknown_03005528
_020099F4: .4byte 0x04000128
_020099F8: .4byte gUnknown_03002820
_020099FC: .4byte gUnknown_03002250
_02009A00: .4byte 0x0000083F
_02009A04:
	ldr r0, _02009A48 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02009AB8
	ldr r0, _02009A4C @ =gUnknown_03005650
	movs r2, #0x16
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #2
	cmp r0, r1
	ble _02009A58
	ldr r3, _02009A50 @ =0xFFFFFA60
	adds r0, r3, #0
	ldrh r4, [r5, #0x16]
	adds r1, r0, r4
	strh r1, [r5, #0x16]
	ldr r6, [sp]
	ldrh r6, [r6, #6]
	adds r0, r0, r6
	ldr r1, [sp]
	strh r0, [r1, #6]
	ldr r2, _02009A54 @ =0xFFFFFCA0
	adds r0, r2, #0
	ldrh r3, [r5, #0x18]
	adds r1, r0, r3
	strh r1, [r5, #0x18]
	ldr r4, [sp]
	ldrh r4, [r4, #8]
	adds r0, r0, r4
	ldr r6, [sp]
	strh r0, [r6, #8]
	b _02009A80
	.align 2, 0
_02009A48: .4byte gUnknown_03005444
_02009A4C: .4byte gUnknown_03005650
_02009A50: .4byte 0xFFFFFA60
_02009A54: .4byte 0xFFFFFCA0
_02009A58:
	movs r1, #0xb4
	lsls r1, r1, #3
	adds r0, r1, #0
	ldrh r2, [r5, #0x16]
	adds r1, r0, r2
	strh r1, [r5, #0x16]
	ldr r3, [sp]
	ldrh r3, [r3, #6]
	adds r0, r0, r3
	ldr r4, [sp]
	strh r0, [r4, #6]
	movs r6, #0xd8
	lsls r6, r6, #2
	adds r0, r6, #0
	ldrh r2, [r5, #0x18]
	adds r1, r0, r2
	strh r1, [r5, #0x18]
	ldrh r3, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
_02009A80:
	ldrh r0, [r5, #0x16]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	movs r1, #0xb7
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _02009AB8
	movs r4, #0x18
	ldrsh r1, [r5, r4]
	movs r0, #0x40
	rsbs r0, r0, #0
	cmp r1, r0
	ble _02009AB8
	cmp r1, #0xdf
	bgt _02009AB8
	mov r6, r8
	ldrh r1, [r6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _02009AB2
	adds r0, r5, #0
	ldr r1, [sp]
	bl sub_020033A8
_02009AB2:
	adds r0, r5, #0
	bl sub_02003D30
_02009AB8:
	ldr r4, _02009AD8 @ =gUnknown_03005544
	ldrb r0, [r4]
	cmp r0, #0
	beq _02009AC8
	bl sub_0200BEA8
	movs r0, #0
	strb r0, [r4]
_02009AC8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009AD8: .4byte gUnknown_03005544

	thumb_func_start sub_02009ADC
sub_02009ADC: @ 0x02009ADC
	push {r4, r5, r6, r7, lr}
	ldr r0, _02009B80 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r3, _02009B84 @ =gUnknown_030056C0
	ldr r4, [r3, #0x20]
	movs r0, #8
	ands r0, r4
	cmp r0, #0
	beq _02009B58
	ldr r0, [r3, #0x3c]
	cmp r0, r6
	bne _02009B58
	ldr r1, [r6, #0x44]
	lsls r1, r1, #8
	ldr r0, [r3, #8]
	adds r0, r0, r1
	str r0, [r3, #8]
	ldr r1, [r3, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r6, #0x48]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [r3, #0xc]
	ldr r1, _02009B88 @ =gRoomEventQueue
	ldr r0, _02009B8C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _02009B90 @ =gUnknown_03000054
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	adds r2, r0, #0
	ands r2, r1
	ldr r7, _02009B90 @ =gUnknown_03000054
	adds r1, r5, r7
	ldrh r1, [r1]
	ands r0, r1
	cmp r2, r0
	beq _02009B58
	movs r0, #9
	rsbs r0, r0, #0
	ands r4, r0
	str r4, [r3, #0x20]
	adds r0, #8
	str r0, [r3, #0x3c]
	ldr r1, _02009B94 @ =gUnknown_03000056
	adds r0, r5, r1
	ldrb r1, [r0]
	ldr r2, _02009B98 @ =gUnknown_03000064
	adds r0, r5, r2
	strb r1, [r0]
_02009B58:
	bl sub_02009B9C
	cmp r0, #0
	beq _02009B78
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02009B78
	ldr r2, _02009B84 @ =gUnknown_030056C0
	ldr r0, [r2, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0
	str r0, [r6, #0x4c]
_02009B78:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02009B80: .4byte gUnknown_030026D0
_02009B84: .4byte gUnknown_030056C0
_02009B88: .4byte gRoomEventQueue
_02009B8C: .4byte 0x04000128
_02009B90: .4byte gUnknown_03000054
_02009B94: .4byte gUnknown_03000056
_02009B98: .4byte gUnknown_03000064

	thumb_func_start sub_02009B9C
sub_02009B9C: @ 0x02009B9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r2, _02009C40 @ =gUnknown_030056C0
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, _02009C44 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	str r6, [sp, #0xc]
	adds r0, #0x60
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02009BCE
	b _02009EA0
_02009BCE:
	ldr r1, _02009C48 @ =gUnknown_03000050
	adds r5, r4, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r3, _02009C4C @ =gUnknown_03000052
	adds r7, r4, r3
	movs r2, #0
	ldrsh r0, [r7, r2]
	mov ip, r0
	adds r3, #0x14
	adds r3, r3, r4
	mov r8, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp, #0x1c]
	ldr r3, _02009C50 @ =gUnknown_03000068
	adds r3, r3, r4
	mov sb, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp]
	ldr r3, _02009C54 @ =gUnknown_03000054
	adds r4, r4, r3
	ldrh r0, [r4]
	lsrs r0, r0, #7
	movs r2, #1
	mov sl, r2
	ands r0, r2
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x1c]
	bl sub_02006F50
	adds r2, r0, #0
	ldr r0, _02009C58 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02009C9C
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _02009C9C
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _02009C64
	ldr r5, _02009C5C @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _02009C60 @ =0xFFFFFCA0
	b _02009C72
	.align 2, 0
_02009C40: .4byte gUnknown_030056C0
_02009C44: .4byte gUnknown_030026D0
_02009C48: .4byte gUnknown_03000050
_02009C4C: .4byte gUnknown_03000052
_02009C50: .4byte gUnknown_03000068
_02009C54: .4byte gUnknown_03000054
_02009C58: .4byte gUnknown_03005444
_02009C5C: .4byte 0xFFFFFA60
_02009C60: .4byte 0xFFFFFCA0
_02009C64:
	movs r5, #0xb4
	lsls r5, r5, #3
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xd8
	lsls r0, r0, #2
_02009C72:
	adds r2, r0, #0
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	ldrh r0, [r4]
	lsrs r0, r0, #7
	mov r4, sl
	ands r0, r4
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_02006F50
	adds r2, r0, #0
_02009C9C:
	adds r0, r2, #0
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _02009D30
	ldr r0, _02009CD8 @ =gUnknown_030056C0
	adds r1, r0, #0
	adds r1, #0x61
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0
	bne _02009CFC
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _02009CDC
	ldr r7, _02009CD8 @ =gUnknown_030056C0
	ldrh r1, [r7, #0x10]
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _02009CFC
	rsbs r0, r1, #0
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #0x14]
	rsbs r0, r0, #0
	strh r0, [r7, #0x14]
	b _02009CFC
	.align 2, 0
_02009CD8: .4byte gUnknown_030056C0
_02009CDC:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r2
	cmp r0, #0
	beq _02009CFC
	ldr r4, _02009D2C @ =gUnknown_030056C0
	ldrh r1, [r4, #0x10]
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _02009CFC
	rsbs r0, r1, #0
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x14]
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_02009CFC:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _02009D16
	ldr r7, _02009D2C @ =gUnknown_030056C0
	ldrh r1, [r7, #0x12]
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	ble _02009D16
	rsbs r0, r1, #0
	strh r0, [r7, #0x12]
_02009D16:
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _02009D38
	movs r0, #1
	b _02009FB8
	.align 2, 0
_02009D2C: .4byte gUnknown_030056C0
_02009D30:
	movs r4, #2
	ands r4, r2
	cmp r4, #0
	beq _02009D7C
_02009D38:
	adds r0, r6, #0
	adds r0, #0x50
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r5, _02009D54 @ =gUnknown_030056C0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	cmp r1, r0
	bge _02009D58
	ldr r0, [r5, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x20]
	b _02009D64
	.align 2, 0
_02009D54: .4byte gUnknown_030056C0
_02009D58:
	ldr r7, _02009D78 @ =gUnknown_030056C0
	ldr r0, [r7, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x20]
_02009D64:
	ldr r0, _02009D78 @ =gUnknown_030056C0
	bl sub_02007258
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
	movs r0, #1
	b _02009FB8
	.align 2, 0
_02009D78: .4byte gUnknown_030056C0
_02009D7C:
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _02009E64
	ldr r2, [sp, #0xc]
	ldr r0, [r2, #0x30]
	cmp r0, r1
	bne _02009E64
	ldr r3, _02009E1C @ =gUnknown_030056C0
	ldr r3, [r3, #0x20]
	str r3, [sp, #0x14]
	ldr r5, _02009E1C @ =gUnknown_030056C0
	ldr r5, [r5, #0x3c]
	str r5, [sp, #0x18]
	adds r5, r6, #0
	adds r5, #0x50
	movs r7, #0
	ldrsh r1, [r5, r7]
	adds r7, r6, #0
	adds r7, #0x52
	movs r2, #0
	ldrsh r0, [r7, r2]
	mov ip, r0
	movs r3, #0x66
	adds r3, r3, r6
	mov r8, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp, #0x1c]
	movs r3, #0x68
	adds r3, r3, r6
	mov sb, r3
	movs r2, #0
	ldrsh r0, [r3, r2]
	str r0, [sp]
	movs r3, #0x54
	adds r3, r3, r6
	mov sl, r3
	ldrh r0, [r3]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r2, ip
	ldr r3, [sp, #0x1c]
	bl sub_02006834
	adds r4, r0, #0
	ldr r0, _02009E20 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	beq _02009DEE
	b _02009F84
_02009DEE:
	cmp r4, #0
	beq _02009DF4
	b _02009F84
_02009DF4:
	ldr r3, [sp, #0x14]
	ldr r0, _02009E1C @ =gUnknown_030056C0
	str r3, [r0, #0x20]
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x3c]
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _02009E2C
	ldr r5, _02009E24 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _02009E28 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _02009E3C
	.align 2, 0
_02009E1C: .4byte gUnknown_030056C0
_02009E20: .4byte gUnknown_03005444
_02009E24: .4byte 0xFFFFFA60
_02009E28: .4byte 0xFFFFFCA0
_02009E2C:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_02009E3C:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	mov r5, sl
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	b _02009F7E
_02009E64:
	ldr r1, _02009E9C @ =gUnknown_030056C0
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _02009E84
	ldr r0, [r1, #0x3c]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	bne _02009E84
	movs r0, #9
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	str r2, [r1, #0x20]
_02009E84:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _02009E90
	b _02009FB6
_02009E90:
	ldr r4, _02009E9C @ =gUnknown_030056C0
	ldr r0, [r4, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r4, #0x20]
	b _02009FB6
	.align 2, 0
_02009E9C: .4byte gUnknown_030056C0
_02009EA0:
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _02009EB0
	b _02009FB6
_02009EB0:
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	beq _02009EB8
	b _02009FB6
_02009EB8:
	ldr r7, _02009F2C @ =gUnknown_03000050
	adds r5, r4, r7
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r2, _02009F30 @ =gUnknown_03000052
	adds r7, r4, r2
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov ip, r3
	adds r2, #0x14
	adds r2, r2, r4
	mov r8, r2
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r3, [sp, #0x1c]
	ldr r2, _02009F34 @ =gUnknown_03000068
	adds r2, r2, r4
	mov sb, r2
	movs r3, #0
	ldrsh r0, [r2, r3]
	str r0, [sp]
	ldr r0, _02009F38 @ =gUnknown_03000054
	adds r0, r0, r4
	mov sl, r0
	ldrh r0, [r0]
	lsrs r0, r0, #7
	movs r2, #1
	ands r0, r2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r2, ip
	ldr r3, [sp, #0x1c]
	bl sub_02006834
	adds r4, r0, #0
	ldr r0, _02009F3C @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02009F84
	cmp r4, #0
	bne _02009F84
	ldrh r2, [r5]
	movs r3, #0
	ldrsh r1, [r5, r3]
	movs r0, #0xf0
	lsls r0, r0, #2
	cmp r1, r0
	ble _02009F48
	ldr r5, _02009F40 @ =0xFFFFFA60
	adds r1, r2, r5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, _02009F44 @ =0xFFFFFCA0
	adds r2, r0, #0
	b _02009F58
	.align 2, 0
_02009F2C: .4byte gUnknown_03000050
_02009F30: .4byte gUnknown_03000052
_02009F34: .4byte gUnknown_03000068
_02009F38: .4byte gUnknown_03000054
_02009F3C: .4byte gUnknown_03005444
_02009F40: .4byte 0xFFFFFA60
_02009F44: .4byte 0xFFFFFCA0
_02009F48:
	movs r0, #0xb4
	lsls r0, r0, #3
	adds r1, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xd8
	lsls r3, r3, #2
	adds r2, r3, #0
_02009F58:
	ldrh r7, [r7]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r5, r8
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov r5, sb
	movs r7, #0
	ldrsh r0, [r5, r7]
	str r0, [sp]
	mov r5, sl
	ldrh r0, [r5]
	lsrs r0, r0, #7
	movs r7, #1
	ands r0, r7
	str r0, [sp, #4]
	str r4, [sp, #8]
	adds r0, r6, #0
_02009F7E:
	bl sub_02006834
	adds r4, r0, #0
_02009F84:
	ldr r0, [r6, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _02009FA2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _02009FA2
	ldr r0, _02009FC8 @ =gUnknown_030056C0
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_02009FA2:
	str r4, [r6, #0x4c]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r4
	cmp r0, #0
	beq _02009FB6
	adds r1, r6, #0
	adds r1, #0x60
	movs r0, #0x1e
	strb r0, [r1]
_02009FB6:
	movs r0, #0
_02009FB8:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_02009FC8: .4byte gUnknown_030056C0

	thumb_func_start sub_02009FCC
sub_02009FCC: @ 0x02009FCC
	push {r4, r5, r6, r7, lr}
	ldr r0, _0200A020 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200A018
	ldr r1, _0200A024 @ =gRoomEventQueue
	ldr r0, [r1]
	ldr r7, _0200A028 @ =gUnknown_030056C0
	cmp r0, #0
	beq _0200A008
	movs r6, #0xc0
	lsls r6, r6, #0x12
	movs r5, #3
	rsbs r5, r5, #0
	adds r3, r1, #0
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0xc
_02009FF0:
	ldm r2!, {r0}
	ldrh r1, [r0, #6]
	adds r1, r1, r6
	ldr r0, [r1, #0x5c]
	ands r0, r5
	str r0, [r1, #0x5c]
	adds r3, #4
	cmp r2, r4
	bhi _0200A008
	ldr r0, [r3]
	cmp r0, #0
	bne _02009FF0
_0200A008:
	movs r0, #0x78
	strh r0, [r7, #0x2c]
	adds r2, r7, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_0200A018:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A020: .4byte gUnknown_03005444
_0200A024: .4byte gRoomEventQueue
_0200A028: .4byte gUnknown_030056C0

	thumb_func_start sub_0200A02C
sub_0200A02C: @ 0x0200A02C
	push {lr}
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r0, r2
	ldr r1, _0200A050 @ =gRoomEventQueue
	ldr r3, _0200A054 @ =gUnknown_03000056
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2, #4]
	bl sub_0200487C
	pop {r0}
	bx r0
	.align 2, 0
_0200A050: .4byte gRoomEventQueue
_0200A054: .4byte gUnknown_03000056

	thumb_func_start sub_0200A058
sub_0200A058: @ 0x0200A058
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _0200A0C4 @ =gUnknown_030026D0
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r0, _0200A0C8 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	beq _0200A072
	movs r2, #0xf0
_0200A072:
	ldr r0, _0200A0CC @ =gUnknown_030053EC
	ldr r1, _0200A0D0 @ =gUnknown_030053D0
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0200A0BE
	ldrh r0, [r5]
	adds r1, r0, #1
	strh r1, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r2
	bls _0200A0BE
	ldr r1, _0200A0D4 @ =gUnknown_030018C8
	movs r4, #0
	movs r0, #0xbf
	strh r0, [r1]
	strh r4, [r1, #4]
	ldr r0, _0200A0D8 @ =0x0201F270
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0200A0DC @ =0x0201F2B0
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0200A0E0 @ =0x0201F2F0
	movs r1, #4
	bl m4aMPlayFadeOut
	ldr r0, _0200A0E4 @ =0x0201F340
	movs r1, #4
	bl m4aMPlayFadeOut
	strh r4, [r5]
	ldr r1, [r6]
	ldr r0, _0200A0E8 @ =sub_0200A0EC
	str r0, [r1, #8]
_0200A0BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200A0C4: .4byte gUnknown_030026D0
_0200A0C8: .4byte gUnknown_03005444
_0200A0CC: .4byte gUnknown_030053EC
_0200A0D0: .4byte gUnknown_030053D0
_0200A0D4: .4byte gUnknown_030018C8
_0200A0D8: .4byte 0x0201F270
_0200A0DC: .4byte 0x0201F2B0
_0200A0E0: .4byte 0x0201F2F0
_0200A0E4: .4byte 0x0201F340
_0200A0E8: .4byte sub_0200A0EC

	thumb_func_start sub_0200A0EC
sub_0200A0EC: @ 0x0200A0EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _0200A1D8 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	ldr r2, _0200A1DC @ =gUnknown_030018C8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	strh r0, [r2, #4]
	ldrh r1, [r1]
	ldr r0, _0200A1E0 @ =0x00000FFF
	cmp r1, r0
	bhi _0200A11A
	b _0200A256
_0200A11A:
	movs r0, #0xbf
	strh r0, [r2]
	movs r0, #0
	strh r0, [r2, #4]
	ldr r0, _0200A1E4 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	beq _0200A12C
	b _0200A232
_0200A12C:
	ldr r1, _0200A1E8 @ =gUnknown_02015B20
	mov r0, sp
	movs r2, #4
	bl sub_02014E5C
	add r4, sp, #4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	bl sub_02014EBC
	bl m4aMPlayAllStop
	ldr r0, _0200A1EC @ =gUnknown_030053A8
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r7, #0
	mov sb, r4
	movs r0, #3
	mov ip, r0
_0200A154:
	movs r4, #0
	cmp r4, ip
	bhs _0200A19C
	mov r6, sb
	mov r8, ip
_0200A15E:
	adds r3, r6, r4
	adds r5, r4, #1
	adds r2, r6, r5
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bhs _0200A196
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	strb r0, [r3]
	mov r1, sp
	adds r3, r1, r4
	adds r2, r1, r5
	ldrb r1, [r3]
	ldrb r0, [r2]
	eors r1, r0
	strb r1, [r3]
	ldrb r0, [r2]
	eors r0, r1
	strb r0, [r2]
	ldrb r1, [r3]
	eors r0, r1
	strb r0, [r3]
_0200A196:
	adds r4, r5, #0
	cmp r4, r8
	blo _0200A15E
_0200A19C:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	adds r7, #1
	cmp r7, #3
	bls _0200A154
	movs r7, #0
	mov r4, sb
	ldr r6, _0200A1F0 @ =gUnknown_0300542C
	ldr r5, _0200A1F4 @ =gUnknown_03005478
	mov r3, sp
	mov r2, sp
	ldr r1, _0200A1F8 @ =gUnknown_030053D8
	mov r8, r1
_0200A1B8:
	cmp r7, #0
	beq _0200A1FC
	adds r0, r4, r7
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0200A204
	ldrb r0, [r2]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r0, [r2]
	adds r0, r0, r5
	movs r1, #1
	strb r1, [r0]
	b _0200A22A
	.align 2, 0
_0200A1D8: .4byte gUnknown_030026D0
_0200A1DC: .4byte gUnknown_030018C8
_0200A1E0: .4byte 0x00000FFF
_0200A1E4: .4byte gUnknown_03005444
_0200A1E8: .4byte gUnknown_02015B20
_0200A1EC: .4byte gUnknown_030053A8
_0200A1F0: .4byte gUnknown_0300542C
_0200A1F4: .4byte gUnknown_03005478
_0200A1F8: .4byte gUnknown_030053D8
_0200A1FC:
	ldrb r1, [r4, #1]
	ldrb r0, [r4]
	cmp r0, r1
	bne _0200A214
_0200A204:
	ldrb r0, [r2]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r0, [r2]
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	b _0200A22A
_0200A214:
	ldrb r0, [r3]
	adds r0, r0, r6
	strb r7, [r0]
	ldrb r1, [r3]
	add r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, r0, r5
	strb r7, [r0]
_0200A22A:
	adds r2, #1
	adds r7, #1
	cmp r7, #3
	bls _0200A1B8
_0200A232:
	ldr r1, _0200A264 @ =0x0000FFFF
	movs r0, #0
	bl sub_02001D78
	ldr r1, _0200A268 @ =gUnknown_03002AC4
	ldr r0, _0200A26C @ =gUnknown_0300285C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0200A270 @ =gUnknown_03005370
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0200A274 @ =gUnknown_03004D3C
	ldr r0, _0200A278 @ =gUnknown_03002A64
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #1
	bl sub_02004E54
_0200A256:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A264: .4byte 0x0000FFFF
_0200A268: .4byte gUnknown_03002AC4
_0200A26C: .4byte gUnknown_0300285C
_0200A270: .4byte gUnknown_03005370
_0200A274: .4byte gUnknown_03004D3C
_0200A278: .4byte gUnknown_03002A64

	thumb_func_start sub_0200A27C
sub_0200A27C: @ 0x0200A27C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0200A2A4 @ =sub_0200A058
	movs r2, #0x80
	lsls r2, r2, #6
	movs r4, #0
	str r4, [sp]
	movs r1, #4
	movs r3, #0
	bl sub_0200198C
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200A2A4: .4byte sub_0200A058

	thumb_func_start sub_0200A2A8
sub_0200A2A8: @ 0x0200A2A8
	push {r4, r5, r6, r7, lr}
	ldr r3, _0200A308 @ =gUnknown_030026D0
	ldr r0, [r3]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r6, [r0]
	ldrb r7, [r0, #8]
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	lsls r0, r7, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r4, r0, r2
	ldr r1, _0200A30C @ =gUnknown_030056C0
	ldr r0, [r1, #8]
	asrs r2, r0, #8
	mov ip, r1
	cmp r5, r2
	bgt _0200A328
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r2
	blt _0200A328
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0200A328
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r4, r0
	cmp r0, r1
	blt _0200A328
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _0200A310
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	b _0200A31A
	.align 2, 0
_0200A308: .4byte gUnknown_030026D0
_0200A30C: .4byte gUnknown_030056C0
_0200A310:
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
_0200A31A:
	strb r0, [r2]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _0200A35C @ =0xFEFFFFFF
	ands r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
_0200A328:
	ldr r1, _0200A360 @ =gUnknown_03005650
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0200A34E
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200A34E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _0200A356
_0200A34E:
	strb r7, [r6]
	ldr r0, [r3]
	bl sub_02001A38
_0200A356:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A35C: .4byte 0xFEFFFFFF
_0200A360: .4byte gUnknown_03005650

	thumb_func_start sub_0200A364
sub_0200A364: @ 0x0200A364
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0200A3AC @ =sub_0200A2A8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl sub_0200198C
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200A3AC: .4byte sub_0200A2A8

	thumb_func_start sub_0200A3B0
sub_0200A3B0: @ 0x0200A3B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0200A4C4 @ =sub_0200A4F0
	ldr r2, _0200A4C8 @ =0x00002010
	ldr r1, _0200A4CC @ =sub_0200A6A4
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl sub_0200198C
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	ldr r7, _0200A4D0 @ =gUnknown_0300000C
	add r7, r8
	movs r3, #0
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	strb r6, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r1, _0200A4D4 @ =gUnknown_0300002D
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0200A4D8 @ =gUnknown_0300002E
	add r1, r8
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0200A4DC @ =gUnknown_03000031
	add r0, r8
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	movs r0, #0x14
	bl sub_0200479C
	str r0, [r7, #4]
	movs r0, #0x66
	strh r0, [r7, #0xa]
	ldr r1, _0200A4E0 @ =gUnknown_02015B24
	mov r0, sl
	lsls r2, r0, #1
	adds r0, r2, r1
	ldrb r3, [r0]
	ldr r0, _0200A4E4 @ =gUnknown_0300002C
	add r0, r8
	strb r3, [r0]
	adds r1, #1
	adds r2, r2, r1
	ldrb r2, [r2]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0200A486
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0200A486:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0200A498
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r7, #0x10]
_0200A498:
	ldr r0, _0200A4E8 @ =gUnknown_0300003C
	add r0, r8
	mov r1, sl
	strb r1, [r0]
	mov r6, sb
	ldrb r1, [r6, #3]
	movs r0, #3
	ands r0, r1
	ldr r1, _0200A4EC @ =gUnknown_0300003D
	add r1, r8
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_020030A0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A4C4: .4byte sub_0200A4F0
_0200A4C8: .4byte 0x00002010
_0200A4CC: .4byte sub_0200A6A4
_0200A4D0: .4byte gUnknown_0300000C
_0200A4D4: .4byte gUnknown_0300002D
_0200A4D8: .4byte gUnknown_0300002E
_0200A4DC: .4byte gUnknown_03000031
_0200A4E0: .4byte gUnknown_02015B24
_0200A4E4: .4byte gUnknown_0300002C
_0200A4E8: .4byte gUnknown_0300003C
_0200A4EC: .4byte gUnknown_0300003D

	thumb_func_start sub_0200A4F0
sub_0200A4F0: @ 0x0200A4F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0200A55C @ =gUnknown_030026D0
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	adds r0, #0xc
	adds r5, r4, r0
	ldr r1, [r6]
	mov r8, r1
	ldr r3, _0200A560 @ =gUnknown_030056C0
	adds r0, r5, #0
	adds r2, r6, #0
	bl sub_0200A61C
	cmp r0, #0
	beq _0200A528
	ldr r1, [r7]
	ldr r0, _0200A564 @ =sub_0200A57C
	str r0, [r1, #8]
	ldr r0, _0200A568 @ =gUnknown_0300002C
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0200A528:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0200A54C
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0200A54C
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200A56C
_0200A54C:
	ldrb r0, [r6, #8]
	mov r1, r8
	strb r0, [r1]
	ldr r0, _0200A55C @ =gUnknown_030026D0
	ldr r0, [r0]
	bl sub_02001A38
	b _0200A572
	.align 2, 0
_0200A55C: .4byte gUnknown_030026D0
_0200A560: .4byte gUnknown_030056C0
_0200A564: .4byte sub_0200A57C
_0200A568: .4byte gUnknown_0300002C
_0200A56C:
	adds r0, r5, #0
	bl sub_02003D30
_0200A572:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A57C
sub_0200A57C: @ 0x0200A57C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0200A5D4 @ =gUnknown_030026D0
	mov r8, r0
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r6, r0
	ldr r1, _0200A5D8 @ =gUnknown_0300000C
	adds r4, r6, r1
	ldr r7, [r5]
	ldr r3, _0200A5DC @ =gUnknown_030056C0
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_0200A61C
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0200A5C6
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0200A5C6
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200A5E0
_0200A5C6:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, _0200A5D4 @ =gUnknown_030026D0
	ldr r0, [r0]
	bl sub_02001A38
	b _0200A608
	.align 2, 0
_0200A5D4: .4byte gUnknown_030026D0
_0200A5D8: .4byte gUnknown_0300000C
_0200A5DC: .4byte gUnknown_030056C0
_0200A5E0:
	adds r0, r4, #0
	bl sub_020030A0
	cmp r0, #0
	bne _0200A602
	ldr r0, _0200A614 @ =gUnknown_0300002C
	adds r1, r6, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_020030A0
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0200A618 @ =sub_0200A4F0
	str r0, [r1, #8]
_0200A602:
	adds r0, r4, #0
	bl sub_02003D30
_0200A608:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A614: .4byte gUnknown_0300002C
_0200A618: .4byte sub_0200A4F0

	thumb_func_start sub_0200A61C
sub_0200A61C: @ 0x0200A61C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldrb r2, [r4, #8]
	lsls r2, r2, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _0200A694 @ =gUnknown_03005650
	ldr r0, [r3]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0200A69C
	adds r0, r6, #0
	adds r1, r7, #0
	adds r3, r5, #0
	bl sub_02006588
	cmp r0, #0
	beq _0200A69C
	ldr r1, _0200A698 @ =gUnknown_02015B38
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x6d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x14
	bl m4aSongNumStart
	movs r0, #1
	b _0200A69E
	.align 2, 0
_0200A694: .4byte gUnknown_03005650
_0200A698: .4byte gUnknown_02015B38
_0200A69C:
	movs r0, #0
_0200A69E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200A6A4
sub_0200A6A4: @ 0x0200A6A4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_0200487C
	pop {r0}
	bx r0

	thumb_func_start sub_0200A6B8
sub_0200A6B8: @ 0x0200A6B8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #6
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A6E4
sub_0200A6E4: @ 0x0200A6E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A710
sub_0200A710: @ 0x0200A710
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #7
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A73C
sub_0200A73C: @ 0x0200A73C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A768
sub_0200A768: @ 0x0200A768
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A794
sub_0200A794: @ 0x0200A794
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A7C0
sub_0200A7C0: @ 0x0200A7C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A7EC
sub_0200A7EC: @ 0x0200A7EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #5
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A818
sub_0200A818: @ 0x0200A818
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #8
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A844
sub_0200A844: @ 0x0200A844
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	movs r0, #9
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200A3B0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200A870
sub_0200A870: @ 0x0200A870
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0200A95C @ =sub_0200A974
	ldr r2, _0200A960 @ =0x00002010
	ldr r1, _0200A964 @ =sub_0200ACA4
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl sub_0200198C
	ldrh r6, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r6, r1
	ldr r2, _0200A968 @ =gUnknown_0300000C
	adds r7, r6, r2
	movs r0, #0
	mov sl, r0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r2, sb
	str r2, [r1]
	ldrb r0, [r2]
	strb r0, [r1, #8]
	mov r0, r8
	strb r0, [r1, #9]
	ldrb r0, [r2]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r2, sb
	strb r0, [r2]
	ldrb r0, [r2, #3]
	movs r4, #3
	ands r4, r0
	strh r4, [r1, #0x3c]
	movs r0, #0x14
	bl sub_0200479C
	str r0, [r7, #4]
	movs r0, #0x67
	strh r0, [r7, #0xa]
	movs r1, #1
	adds r0, r4, #0
	ands r0, r1
	ldr r2, _0200A96C @ =gUnknown_0300002C
	adds r1, r6, r2
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	mov r0, sl
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #1
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0200A970 @ =gUnknown_0300002E
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	adds r2, #4
	adds r6, r6, r2
	movs r0, #0
	strb r0, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0200A944
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0200A944:
	adds r0, r7, #0
	bl sub_020030A0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200A95C: .4byte sub_0200A974
_0200A960: .4byte 0x00002010
_0200A964: .4byte sub_0200ACA4
_0200A968: .4byte gUnknown_0300000C
_0200A96C: .4byte gUnknown_0300002C
_0200A970: .4byte gUnknown_0300002E

	thumb_func_start sub_0200A974
sub_0200A974: @ 0x0200A974
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r6, _0200AA64 @ =gUnknown_030056C0
	ldr r0, _0200AA68 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov sb, r0
	ldr r0, _0200AA6C @ =gUnknown_0300000C
	adds r0, r0, r1
	mov r8, r0
	mov r1, sb
	ldr r1, [r1]
	str r1, [sp]
	mov r3, sb
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _0200AA70 @ =gUnknown_03005650
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	str r4, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, r8
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	str r2, [sp, #8]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r4, r8
	strh r1, [r4, #0x18]
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0200A9E2
	b _0200AC42
_0200A9E2:
	movs r5, #0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0200A9F4
	ldr r0, [r6, #0x3c]
	cmp r0, r8
	bne _0200A9F4
	movs r5, #1
_0200A9F4:
	ldr r0, [sp, #4]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #8]
	lsls r4, r2, #0x10
	asrs r2, r4, #0x10
	mov r0, r8
	adds r3, r6, #0
	bl sub_02006588
	adds r1, r0, #0
	cmp r1, #0
	bne _0200AA10
	b _0200ABB6
_0200AA10:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	mov r3, sb
	ldrh r5, [r3, #0x3c]
	cmp r0, #0
	beq _0200AA2E
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200AA2E
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0200AA4A
_0200AA2E:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0200AA74
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200AA42
	b _0200AC42
_0200AA42:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bgt _0200AA74
_0200AA4A:
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	movs r0, #0
	strh r0, [r6, #0x10]
	strh r0, [r6, #0x14]
	b _0200AC42
	.align 2, 0
_0200AA64: .4byte gUnknown_030056C0
_0200AA68: .4byte gUnknown_030026D0
_0200AA6C: .4byte gUnknown_0300000C
_0200AA70: .4byte gUnknown_03005650
_0200AA74:
	movs r0, #2
	mov sl, r0
	ands r0, r5
	cmp r0, #0
	beq _0200AA80
	b _0200AC42
_0200AA80:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r2
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	subs r7, r0, r1
	cmp r7, #0
	bgt _0200AAA6
	b _0200ABAA
_0200AAA6:
	cmp r7, r2
	ble _0200AAE6
	ldr r0, [r6, #0x20]
	mov r3, sl
	ands r0, r3
	cmp r0, #0
	bne _0200AADA
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0200AADA
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r0, sb
	ldrh r1, [r0, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
_0200AADA:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	b _0200ABA4
_0200AAE6:
	ldr r5, [r6, #0xc]
	asrs r0, r5, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	asrs r1, r4, #0x10
	subs r0, r0, r1
	str r0, [sp, #0xc]
	mov r0, r8
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r0, r7, #8
	adds r1, r2, #0
	str r2, [sp, #0x10]
	bl sub_02014D04
	muls r0, r4, r0
	asrs r3, r0, #8
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0xc]
	cmp r1, r3
	blt _0200AB9A
	ldr r0, [r6, #0x20]
	mov r4, sl
	ands r0, r4
	cmp r0, #0
	bne _0200AB78
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0200AB78
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0200AB5C @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0200AB78
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r0, r0, #1
	cmp r7, r0
	bge _0200AB60
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	b _0200AC18
	.align 2, 0
_0200AB5C: .4byte gUnknown_030057C8
_0200AB60:
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r3, sb
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	b _0200AC18
_0200AB78:
	ldr r4, [sp, #0xc]
	subs r0, r3, r4
	lsls r0, r0, #8
	adds r0, r5, r0
	str r0, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r6, #0x20]
	mov r0, r8
	b _0200AC40
_0200AB9A:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, sl
_0200ABA4:
	orrs r0, r1
	str r0, [r6, #0x20]
	b _0200AC42
_0200ABAA:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	b _0200AC42
_0200ABB6:
	cmp r5, #0
	beq _0200AC42
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #2
	ands r0, r1
	adds r5, r1, #0
	cmp r0, #0
	beq _0200ABDE
	ldr r0, [r6, #8]
	asrs r3, r0, #8
	mov r4, r8
	movs r1, #0x16
	ldrsh r2, [r4, r1]
	adds r4, r0, #0
	cmp r3, r2
	blt _0200ABEE
	cmp r3, r2
	bgt _0200AC34
	b _0200AC20
_0200ABDE:
	ldr r0, [r6, #8]
	asrs r2, r0, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r1, [r3, r4]
	adds r4, r0, #0
	cmp r2, r1
	ble _0200AC28
_0200ABEE:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0200AC42
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	ble _0200AC42
	adds r1, r6, #0
	adds r1, #0x6d
	movs r0, #0x16
	strb r0, [r1]
	mov r2, sb
	ldrh r1, [r2, #0x3c]
	movs r0, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
_0200AC18:
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
	b _0200AC42
_0200AC20:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	bne _0200AC42
_0200AC28:
	asrs r1, r4, #8
	mov r3, r8
	movs r4, #0x16
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bge _0200AC42
_0200AC34:
	ldr r0, [r6, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r0, #0
_0200AC40:
	str r0, [r6, #0x3c]
_0200AC42:
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, _0200AC84 @ =gUnknown_03005650
	ldr r1, [r2]
	subs r0, r0, r1
	adds r0, #0x80
	movs r1, #0xf8
	lsls r1, r1, #1
	cmp r0, r1
	bhi _0200AC72
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #4]
	subs r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200AC72
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200AC8C
_0200AC72:
	mov r4, sb
	ldrb r0, [r4, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0200AC88 @ =gUnknown_030026D0
	ldr r0, [r0]
	bl sub_02001A38
	b _0200AC92
	.align 2, 0
_0200AC84: .4byte gUnknown_03005650
_0200AC88: .4byte gUnknown_030026D0
_0200AC8C:
	mov r0, r8
	bl sub_02003D30
_0200AC92:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200ACA4
sub_0200ACA4: @ 0x0200ACA4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_0200487C
	pop {r0}
	bx r0

	thumb_func_start sub_0200ACB8
sub_0200ACB8: @ 0x0200ACB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0200AD84 @ =sub_0200ADA0
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl sub_0200198C
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0200AD88 @ =gUnknown_0300000C
	adds r0, r3, r2
	mov r7, r8
	str r7, [r1, #0x40]
	str r7, [r1, #0x3c]
	movs r2, #0
	mov sl, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, sb
	str r7, [r1]
	ldrb r2, [r7]
	strb r2, [r1, #8]
	strb r6, [r1, #9]
	ldrb r1, [r7]
	lsls r1, r1, #3
	lsls r4, r4, #8
	adds r1, r1, r4
	strh r1, [r0, #0x16]
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	lsls r5, r5, #8
	adds r1, r1, r5
	strh r1, [r0, #0x18]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r7]
	ldr r1, _0200AD8C @ =0x06011000
	str r1, [r0, #4]
	movs r1, #0x88
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	mov r7, r8
	strh r7, [r0, #8]
	movs r1, #0x65
	strh r1, [r0, #0xa]
	ldr r2, _0200AD90 @ =gUnknown_0300002C
	adds r1, r3, r2
	mov r7, sl
	strb r7, [r1]
	mov r1, r8
	strh r1, [r0, #0x14]
	strh r1, [r0, #0x1c]
	ldr r7, _0200AD94 @ =gUnknown_0300002D
	adds r2, r3, r7
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _0200AD98 @ =gUnknown_0300002E
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _0200AD9C @ =gUnknown_03000031
	adds r3, r3, r2
	mov r7, sl
	strb r7, [r3]
	subs r1, #0x11
	str r1, [r0, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	bl sub_020030A0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200AD84: .4byte sub_0200ADA0
_0200AD88: .4byte gUnknown_0300000C
_0200AD8C: .4byte 0x06011000
_0200AD90: .4byte gUnknown_0300002C
_0200AD94: .4byte gUnknown_0300002D
_0200AD98: .4byte gUnknown_0300002E
_0200AD9C: .4byte gUnknown_03000031

	thumb_func_start sub_0200ADA0
sub_0200ADA0: @ 0x0200ADA0
	push {r4, r5, r6, lr}
	ldr r0, _0200AE1C @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r4, r1, r0
	ldr r6, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0200AE20 @ =gUnknown_03005650
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r4, #0x18]
	ldr r3, _0200AE24 @ =gUnknown_030056C0
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0200AE34
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0200AE0E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0200AE0E
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200AE28
_0200AE0E:
	ldrb r0, [r5, #8]
	strb r0, [r6]
	ldr r0, _0200AE1C @ =gUnknown_030026D0
	ldr r0, [r0]
	bl sub_02001A38
	b _0200AE2E
	.align 2, 0
_0200AE1C: .4byte gUnknown_030026D0
_0200AE20: .4byte gUnknown_03005650
_0200AE24: .4byte gUnknown_030056C0
_0200AE28:
	adds r0, r4, #0
	bl sub_02003D30
_0200AE2E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200AE34
sub_0200AE34: @ 0x0200AE34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _0200AF04 @ =gUnknown_03005650
	ldr r0, [r2]
	lsrs r7, r3, #0x10
	mov sl, r7
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r2, r1, #0x10
	mov sb, r2
	asrs r7, r1, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	ldr r0, _0200AF08 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200AF38
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0200AF38
	ldr r0, _0200AF0C @ =gUnknown_030053A0
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0200AF38
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_020064BC
	mov r8, r0
	cmp r0, #0
	beq _0200AF38
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl sub_02014E5C
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200AEE0
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
_0200AEE0:
	ldr r0, _0200AF10 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0200AF14
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _0200AF2A
	.align 2, 0
_0200AF04: .4byte gUnknown_03005650
_0200AF08: .4byte gUnknown_03005444
_0200AF0C: .4byte gUnknown_030053A0
_0200AF10: .4byte gUnknown_030053D4
_0200AF14:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r7, r0
	mov r1, sp
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_0200AF2A:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl sub_020063BC
	cmp r0, #0
	bne _0200B002
_0200AF38:
	ldr r1, [r5, #0x20]
	lsrs r7, r1, #3
	movs r0, #1
	ands r7, r0
	lsrs r1, r1, #1
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	ldr r0, [r5, #0x3c]
	str r0, [sp, #8]
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_020064BC
	adds r2, r0, #0
	cmp r2, #0
	beq _0200B068
	movs r3, #0xc0
	lsls r3, r3, #0xa
	ands r3, r2
	cmp r3, #0
	beq _0200B040
	ldr r0, _0200AFC4 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	beq _0200AFC8
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0200B068
	movs r0, #0
	strh r0, [r5, #0x12]
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r4, r0
	movs r1, #0x17
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	str r6, [r5, #0x3c]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
	b _0200AFF8
	.align 2, 0
_0200AFC4: .4byte gUnknown_030053D4
_0200AFC8:
	movs r0, #0x80
	lsls r0, r0, #9
	mov sb, r0
	ands r2, r0
	cmp r2, #0
	beq _0200B068
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0200B090
	adds r2, r0, #0
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _0200B00C
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	ldr r1, [r5, #0xc]
	adds r1, r1, r0
	str r1, [r5, #0xc]
	mov r2, sl
	strh r2, [r5, #0x12]
_0200AFF8:
	adds r0, r5, #0
	bl sub_020063BC
	cmp r0, #0
	beq _0200B068
_0200B002:
	movs r0, #0x15
	bl m4aSongNumStart
	movs r0, #1
	b _0200B06A
_0200B00C:
	cmp r7, #0
	beq _0200B018
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	b _0200B020
_0200B018:
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
_0200B020:
	str r0, [r5, #0x20]
	mov r7, r8
	cmp r7, #0
	beq _0200B030
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	b _0200B038
_0200B030:
	ldr r0, [r5, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
_0200B038:
	str r0, [r5, #0x20]
	ldr r0, [sp, #8]
	str r0, [r5, #0x3c]
	b _0200B068
_0200B040:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0200B068
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
_0200B068:
	movs r0, #0
_0200B06A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200B07C
sub_0200B07C: @ 0x0200B07C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl sub_0200487C
	pop {r0}
	bx r0

	thumb_func_start sub_0200B090
sub_0200B090: @ 0x0200B090
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r4, [r5]
	adds r4, #1
	strb r4, [r5]
	adds r6, r0, #0
	adds r6, #0x2e
	ldrb r4, [r6]
	subs r4, #1
	strb r4, [r6]
	bl sub_020064BC
	ldrb r1, [r5]
	subs r1, #1
	strb r1, [r5]
	ldrb r1, [r6]
	adds r1, #1
	strb r1, [r6]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0200B0BC
sub_0200B0BC: @ 0x0200B0BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0200B1FC @ =gUnknown_030056C0
	mov ip, r0
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	mov r2, ip
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r8, r0
	ldr r4, _0200B200 @ =gUnknown_030026D0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov sb, r0
	ldr r3, _0200B204 @ =gUnknown_03000008
	adds r0, r1, r3
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, _0200B208 @ =gUnknown_03000004
	adds r0, r1, r2
	ldrh r2, [r0]
	subs r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]
	ldr r0, _0200B20C @ =gUnknown_03000009
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp, #4]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	mov r2, sb
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r0, ip
	ldr r3, [r0, #0x20]
	adds r0, r3, #0
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B132
	b _0200B30A
_0200B132:
	ldr r2, [sp]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov r1, sb
	movs r2, #3
	ldrsb r2, [r1, r2]
	lsls r1, r2, #3
	adds r4, r0, r1
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r7, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #0x10]
	cmp r4, r7
	ble _0200B152
	b _0200B2F8
_0200B152:
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r6, r0, #3
	adds r1, r4, r6
	str r0, [sp, #0xc]
	cmp r1, r7
	bge _0200B162
	b _0200B2F8
_0200B162:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	mov r1, sb
	movs r0, #4
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r1, r2, r0
	cmp r1, r8
	ble _0200B178
	b _0200B2F8
_0200B178:
	mov r0, sb
	ldrb r0, [r0, #6]
	lsls r0, r0, #3
	str r0, [sp, #0x14]
	adds r1, r1, r0
	cmp r1, r8
	bge _0200B188
	b _0200B2F8
_0200B188:
	movs r1, #0
	cmp r8, r2
	bgt _0200B190
	movs r1, #1
_0200B190:
	mov r2, ip
	movs r0, #0x12
	ldrsh r2, [r2, r0]
	cmp r2, #0
	bge _0200B19C
	b _0200B2E4
_0200B19C:
	cmp r1, #0
	bne _0200B1A2
	b _0200B2E4
_0200B1A2:
	adds r0, r5, #0
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200B1AE
	b _0200B2E4
_0200B1AE:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	bne _0200B1BA
	b _0200B2B0
_0200B1BA:
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0200B238
	ands r3, r1
	cmp r3, #0
	beq _0200B230
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	blt _0200B1EA
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B210 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B230
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B230
_0200B1EA:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B214
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B21A
	.align 2, 0
_0200B1FC: .4byte gUnknown_030056C0
_0200B200: .4byte gUnknown_030026D0
_0200B204: .4byte gUnknown_03000008
_0200B208: .4byte gUnknown_03000004
_0200B20C: .4byte gUnknown_03000009
_0200B210: .4byte gUnknown_030057C8
_0200B214:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B21A:
	strb r0, [r1]
	ldr r2, _0200B228 @ =gUnknown_030026D0
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	ldr r3, _0200B22C @ =gUnknown_03000009
	adds r1, r1, r3
	b _0200B29E
	.align 2, 0
_0200B228: .4byte gUnknown_030026D0
_0200B22C: .4byte gUnknown_03000009
_0200B230:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0200B2E4
_0200B238:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200B2E4
	ldr r3, [sp, #0x10]
	asrs r2, r3, #8
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r3, [sp, #0xc]
	lsls r1, r3, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _0200B276
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B288 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B2E4
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B2E4
_0200B276:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B28C
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B292
	.align 2, 0
_0200B288: .4byte gUnknown_030057C8
_0200B28C:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B292:
	strb r0, [r1]
	ldr r1, _0200B2A8 @ =gUnknown_030026D0
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0200B2AC @ =gUnknown_03000009
	adds r1, r1, r2
_0200B29E:
	ldrb r0, [r1]
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r1]
	b _0200B2E4
	.align 2, 0
_0200B2A8: .4byte gUnknown_030026D0
_0200B2AC: .4byte gUnknown_03000009
_0200B2B0:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0200B2C2
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	blt _0200B2CA
	b _0200B2E4
_0200B2C2:
	asrs r0, r6, #1
	adds r0, r4, r0
	cmp r7, r0
	ble _0200B2E4
_0200B2CA:
	mov r2, ip
	adds r2, #0x6d
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x6e
	strb r1, [r0]
	movs r1, #1
	ands r5, r1
	cmp r5, #0
	beq _0200B2E4
	strb r1, [r0]
_0200B2E4:
	ldr r3, _0200B2F0 @ =gUnknown_030026D0
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	ldr r0, _0200B2F4 @ =gUnknown_03000009
	adds r1, r1, r0
	b _0200B302
	.align 2, 0
_0200B2F0: .4byte gUnknown_030026D0
_0200B2F4: .4byte gUnknown_03000009
_0200B2F8:
	ldr r1, _0200B36C @ =gUnknown_030026D0
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r2, _0200B370 @ =gUnknown_03000009
	adds r1, r1, r2
_0200B302:
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r1]
_0200B30A:
	ldr r2, _0200B374 @ =gUnknown_03005650
	ldr r0, [r2]
	ldr r3, [sp]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0200B34C
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200B34C
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200B35C
_0200B34C:
	mov r2, sp
	ldrb r3, [r2, #4]
	mov r2, sb
	strb r3, [r2]
	ldr r1, _0200B36C @ =gUnknown_030026D0
	ldr r0, [r1]
	bl sub_02001A38
_0200B35C:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B36C: .4byte gUnknown_030026D0
_0200B370: .4byte gUnknown_03000009
_0200B374: .4byte gUnknown_03005650

	thumb_func_start sub_0200B378
sub_0200B378: @ 0x0200B378
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0200B47C @ =gUnknown_030056C0
	mov ip, r0
	ldr r4, _0200B480 @ =gUnknown_030026D0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	ldr r2, _0200B484 @ =gUnknown_03000008
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp]
	ldr r3, _0200B488 @ =gUnknown_03000004
	adds r0, r1, r3
	ldrh r2, [r0]
	ldr r7, _0200B48C @ =gUnknown_03000006
	adds r0, r1, r7
	ldrh r3, [r0]
	ldr r0, _0200B490 @ =gUnknown_03000009
	adds r1, r1, r0
	ldrb r5, [r1]
	ldr r1, [sp]
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	mov r2, r8
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	mov r7, ip
	ldr r3, [r7, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0200B3DE
	b _0200B4FC
_0200B3DE:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldrb r2, [r2, #3]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r2, #3
	adds r6, r0, r1
	ldr r0, [r7, #8]
	asrs r4, r0, #8
	str r2, [sp, #8]
	str r0, [sp, #4]
	cmp r6, r4
	ble _0200B3FC
	b _0200B4FC
_0200B3FC:
	mov r2, r8
	ldrb r0, [r2, #5]
	lsls r7, r0, #3
	str r7, [sp, #0x10]
	adds r1, r6, r7
	str r0, [sp, #0xc]
	cmp r1, r4
	blt _0200B4FC
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #4
	ldrsb r1, [r2, r1]
	lsls r1, r1, #3
	adds r2, r0, r1
	mov r7, ip
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _0200B4FC
	mov r7, r8
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _0200B4FC
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r3
	cmp r0, #0
	beq _0200B4FC
	movs r1, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0200B4A0
	ands r3, r1
	cmp r3, #0
	beq _0200B498
	ldr r1, [sp, #0x10]
	asrs r0, r1, #1
	adds r0, r6, r0
	cmp r4, r0
	blt _0200B46C
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B494 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B498
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B498
_0200B46C:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B4F4
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B4FA
	.align 2, 0
_0200B47C: .4byte gUnknown_030056C0
_0200B480: .4byte gUnknown_030026D0
_0200B484: .4byte gUnknown_03000008
_0200B488: .4byte gUnknown_03000004
_0200B48C: .4byte gUnknown_03000006
_0200B490: .4byte gUnknown_03000009
_0200B494: .4byte gUnknown_030057C8
_0200B498:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _0200B4FC
_0200B4A0:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200B4FC
	ldr r3, [sp, #4]
	asrs r2, r3, #8
	mov r7, sl
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	ldr r3, [sp, #8]
	lsls r1, r3, #3
	adds r0, r0, r1
	ldr r7, [sp, #0xc]
	lsls r1, r7, #2
	adds r0, r0, r1
	cmp r2, r0
	bgt _0200B4DE
	mov r0, ip
	adds r0, #0x5c
	ldr r1, _0200B4F0 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0200B4FC
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0200B4FC
_0200B4DE:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _0200B4F4
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xd
	b _0200B4FA
	.align 2, 0
_0200B4F0: .4byte gUnknown_030057C8
_0200B4F4:
	mov r1, ip
	adds r1, #0x6d
	movs r0, #0xc
_0200B4FA:
	strb r0, [r1]
_0200B4FC:
	ldr r2, _0200B560 @ =gUnknown_03005650
	ldr r0, [r2]
	mov r3, sl
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldr r2, [r2, #4]
	mov r7, sb
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0200B53E
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0200B53E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0200B54E
_0200B53E:
	mov r2, sp
	ldrb r3, [r2]
	mov r2, r8
	strb r3, [r2]
	ldr r7, _0200B564 @ =gUnknown_030026D0
	ldr r0, [r7]
	bl sub_02001A38
_0200B54E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B560: .4byte gUnknown_03005650
_0200B564: .4byte gUnknown_030026D0

	thumb_func_start sub_0200B568
sub_0200B568: @ 0x0200B568
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0200B5D8 @ =sub_0200B0BC
	ldr r2, _0200B5DC @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl sub_0200198C
	ldrh r1, [r0, #6]
	ldr r2, _0200B5E0 @ =gUnknown_03000009
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _0200B5E4 @ =gUnknown_03000008
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200B5D8: .4byte sub_0200B0BC
_0200B5DC: .4byte 0x00002010
_0200B5E0: .4byte gUnknown_03000009
_0200B5E4: .4byte gUnknown_03000008

	thumb_func_start sub_0200B5E8
sub_0200B5E8: @ 0x0200B5E8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0200B658 @ =sub_0200B378
	ldr r2, _0200B65C @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xa
	movs r3, #0
	bl sub_0200198C
	ldrh r1, [r0, #6]
	ldr r2, _0200B660 @ =gUnknown_03000009
	adds r1, r1, r2
	strb r4, [r1]
	ldrh r1, [r0, #6]
	subs r2, #5
	adds r1, r1, r2
	strh r5, [r1]
	ldrh r1, [r0, #6]
	adds r2, #2
	adds r1, r1, r2
	strh r6, [r1]
	ldrh r1, [r0, #6]
	subs r2, #6
	adds r1, r1, r2
	mov r2, r8
	str r2, [r1]
	ldrh r0, [r0, #6]
	ldr r1, _0200B664 @ =gUnknown_03000008
	adds r0, r0, r1
	ldrb r1, [r2]
	strb r1, [r0]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200B658: .4byte sub_0200B378
_0200B65C: .4byte 0x00002010
_0200B660: .4byte gUnknown_03000009
_0200B664: .4byte gUnknown_03000008

	thumb_func_start sub_0200B668
sub_0200B668: @ 0x0200B668
	push {r4, lr}
	sub sp, #4
	ldr r0, _0200B690 @ =sub_0200B698
	ldr r2, _0200B694 @ =0x00002010
	movs r4, #0
	str r4, [sp]
	movs r1, #2
	movs r3, #0
	bl sub_0200198C
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200B690: .4byte sub_0200B698
_0200B694: .4byte 0x00002010

	thumb_func_start sub_0200B698
sub_0200B698: @ 0x0200B698
	push {r4, lr}
	ldr r4, _0200B6C8 @ =gUnknown_030026D0
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3c
	bls _0200B6C0
	movs r0, #0x1a
	bl m4aSongNumStart
	ldr r0, [r4]
	bl sub_02001A38
_0200B6C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200B6C8: .4byte gUnknown_030026D0

	thumb_func_start sub_0200B6CC
sub_0200B6CC: @ 0x0200B6CC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B6EC
sub_0200B6EC: @ 0x0200B6EC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B70C
sub_0200B70C: @ 0x0200B70C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B72C
sub_0200B72C: @ 0x0200B72C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_0200B568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B74C
sub_0200B74C: @ 0x0200B74C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #2
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B76C
sub_0200B76C: @ 0x0200B76C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #3
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B78C
sub_0200B78C: @ 0x0200B78C
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B7AC
sub_0200B7AC: @ 0x0200B7AC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl sub_0200B5E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200B7CC
sub_0200B7CC: @ 0x0200B7CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _0200B858 @ =sub_0200BB44
	ldr r2, _0200B85C @ =0x00002010
	movs r5, #0
	str r5, [sp]
	movs r1, #0x24
	movs r3, #0
	bl sub_0200198C
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	str r5, [r2, #0x14]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	str r5, [r2, #0x1c]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200B858: .4byte sub_0200BB44
_0200B85C: .4byte 0x00002010

	thumb_func_start sub_0200B860
sub_0200B860: @ 0x0200B860
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #8
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	bge _0200B964
	ldr r0, _0200B8B8 @ =gUnknown_030056C0
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	adds r1, r2, r1
	lsls r1, r1, #8
	ldr r0, [r0, #8]
	cmp r0, r1
	ble _0200B964
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0200B94C
	ldrh r0, [r5, #0x18]
	adds r2, r0, #1
	strh r2, [r5, #0x18]
	movs r0, #0x1a
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _0200B956
	strh r2, [r5, #0x1a]
	ldr r0, _0200B8BC @ =gUnknown_030053A4
	ldr r0, [r0]
	ldr r1, [r5, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xe1
	lsls r0, r0, #3
	cmp r7, r0
	bls _0200B8C0
	movs r1, #5
	b _0200B8CC
	.align 2, 0
_0200B8B8: .4byte gUnknown_030056C0
_0200B8BC: .4byte gUnknown_030053A4
_0200B8C0:
	movs r0, #0x96
	lsls r0, r0, #3
	movs r1, #0xf
	cmp r7, r0
	bls _0200B8CC
	movs r1, #0xa
_0200B8CC:
	ldr r2, _0200B934 @ =gUnknown_030053B0
	ldrh r6, [r2]
	adds r0, r1, r6
	strh r0, [r2]
	ldr r0, _0200B938 @ =gUnknown_03005524
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _0200B90A
	ldrh r0, [r2]
	movs r1, #0x64
	bl sub_02014CB8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl sub_02014CB8
	cmp r4, r0
	beq _0200B90A
	ldr r0, _0200B93C @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200B90A
	ldr r1, _0200B940 @ =gUnknown_030053FC
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _0200B90A
	adds r0, #1
	strb r0, [r1]
_0200B90A:
	ldr r0, _0200B93C @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200B91E
	ldr r1, _0200B934 @ =gUnknown_030053B0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0200B91E
	movs r0, #0xff
	strh r0, [r1]
_0200B91E:
	movs r0, #4
	bl m4aSongNumStart
	bl sub_0200BAB8
	ldr r0, _0200B944 @ =gUnknown_030053A4
	ldr r0, [r0]
	str r0, [r5, #0x14]
	ldr r0, _0200B948 @ =gUnknown_0300553C
	str r7, [r0]
	b _0200B956
	.align 2, 0
_0200B934: .4byte gUnknown_030053B0
_0200B938: .4byte gUnknown_03005524
_0200B93C: .4byte gUnknown_03005444
_0200B940: .4byte gUnknown_030053FC
_0200B944: .4byte gUnknown_030053A4
_0200B948: .4byte gUnknown_0300553C
_0200B94C:
	movs r0, #1
	str r0, [r5, #0x1c]
	ldr r0, _0200B95C @ =gUnknown_030053A4
	ldr r0, [r0]
	str r0, [r5, #0x14]
_0200B956:
	ldr r0, _0200B960 @ =gUnknown_030056C0
	ldr r0, [r0, #8]
	b _0200B992
	.align 2, 0
_0200B95C: .4byte gUnknown_030053A4
_0200B960: .4byte gUnknown_030056C0
_0200B964:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	ble _0200B994
	ldr r3, _0200B9A4 @ =gUnknown_030056C0
	movs r1, #8
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	bge _0200B994
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0200B990
	ldrh r0, [r5, #0x18]
	subs r0, #1
	strh r0, [r5, #0x18]
_0200B990:
	ldr r0, [r3, #8]
_0200B992:
	str r0, [r5, #0x20]
_0200B994:
	ldr r0, _0200B9A8 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _0200B9AC @ =sub_0200BB44
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200B9A4: .4byte gUnknown_030056C0
_0200B9A8: .4byte gUnknown_030026D0
_0200B9AC: .4byte sub_0200BB44

	thumb_func_start sub_0200B9B0
sub_0200B9B0: @ 0x0200B9B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _0200BA14 @ =gUnknown_03005650
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _0200BA18 @ =gUnknown_030056C0
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r4, #8
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0200BA1C
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r1, r0
	bgt _0200BA1C
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0200BA1C
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r1, r0
	bgt _0200BA1C
	movs r0, #1
	b _0200BA1E
	.align 2, 0
_0200BA14: .4byte gUnknown_03005650
_0200BA18: .4byte gUnknown_030056C0
_0200BA1C:
	movs r0, #0
_0200BA1E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0200BA24
sub_0200BA24: @ 0x0200BA24
	push {r4, lr}
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0200BAA6
	ldr r0, _0200BA4C @ =gUnknown_030056C0
	ldr r2, [r0, #8]
	ldr r1, _0200BA50 @ =0x0000EFFF
	adds r3, r0, #0
	cmp r2, r1
	bgt _0200BA58
	ldr r1, [r3, #0xc]
	ldr r0, _0200BA54 @ =0x00011FFF
	cmp r1, r0
	bgt _0200BA58
	movs r2, #0xb4
	lsls r2, r2, #0xb
	movs r4, #0xd8
	lsls r4, r4, #0xa
	b _0200BA70
	.align 2, 0
_0200BA4C: .4byte gUnknown_030056C0
_0200BA50: .4byte 0x0000EFFF
_0200BA54: .4byte 0x00011FFF
_0200BA58:
	ldr r1, [r3, #8]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r1, r0
	ble _0200BAA6
	ldr r1, [r3, #0xc]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _0200BAA6
	ldr r2, _0200BAAC @ =0xFFFA6000
	ldr r4, _0200BAB0 @ =0xFFFCA000
_0200BA70:
	ldr r0, [r3, #8]
	adds r0, r0, r2
	str r0, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r0, r0, r4
	str r0, [r3, #0xc]
	asrs r2, r2, #8
	asrs r4, r4, #8
	ldr r1, _0200BAB4 @ =gUnknown_03005650
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r2
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r2
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
_0200BAA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BAAC: .4byte 0xFFFA6000
_0200BAB0: .4byte 0xFFFCA000
_0200BAB4: .4byte gUnknown_03005650

	thumb_func_start sub_0200BAB8
sub_0200BAB8: @ 0x0200BAB8
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0200BB28 @ =sub_0200BBA0
	ldr r2, _0200BB2C @ =0x00002010
	ldr r1, _0200BB30 @ =sub_0200BBE0
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl sub_0200198C
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r6, #0
	movs r1, #0
	movs r0, #0x78
	strh r0, [r4, #0x30]
	movs r0, #0x40
	strh r0, [r4, #0x1a]
	strh r1, [r4, #8]
	strh r1, [r4, #0x14]
	strh r1, [r4, #0x1c]
	ldr r0, _0200BB34 @ =gUnknown_03000021
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0200BB38 @ =gUnknown_03000022
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0200BB3C @ =gUnknown_03000025
	adds r0, r5, r1
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	movs r0, #0x1a
	bl sub_0200479C
	str r0, [r4, #4]
	movs r0, #0x70
	strh r0, [r4, #0xa]
	ldr r0, _0200BB40 @ =gUnknown_03000020
	adds r5, r5, r0
	strb r6, [r5]
	adds r0, r4, #0
	bl sub_020030A0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200BB28: .4byte sub_0200BBA0
_0200BB2C: .4byte 0x00002010
_0200BB30: .4byte sub_0200BBE0
_0200BB34: .4byte gUnknown_03000021
_0200BB38: .4byte gUnknown_03000022
_0200BB3C: .4byte gUnknown_03000025
_0200BB40: .4byte gUnknown_03000020

	thumb_func_start sub_0200BB44
sub_0200BB44: @ 0x0200BB44
	push {r4, r5, lr}
	ldr r0, _0200BB74 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _0200BB78 @ =gUnknown_030056C0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200BB62
	ldrh r0, [r4, #0x1a]
	strh r0, [r4, #0x18]
_0200BB62:
	adds r0, r4, #0
	bl sub_0200B9B0
	cmp r0, #0
	beq _0200BB7C
	adds r0, r4, #0
	bl sub_0200BB8C
	b _0200BB80
	.align 2, 0
_0200BB74: .4byte gUnknown_030026D0
_0200BB78: .4byte gUnknown_030056C0
_0200BB7C:
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
_0200BB80:
	adds r0, r4, #0
	bl sub_0200BA24
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0200BB8C
sub_0200BB8C: @ 0x0200BB8C
	ldr r0, _0200BB98 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _0200BB9C @ =sub_0200BBF4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0200BB98: .4byte gUnknown_030026D0
_0200BB9C: .4byte sub_0200BBF4

	thumb_func_start sub_0200BBA0
sub_0200BBA0: @ 0x0200BBA0
	push {lr}
	ldr r0, _0200BBC4 @ =gUnknown_030026D0
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldrh r0, [r2, #0x30]
	subs r0, #1
	strh r0, [r2, #0x30]
	lsls r0, r0, #0x10
	ldr r1, _0200BBC8 @ =0xFFFF0000
	cmp r0, r1
	bne _0200BBCC
	adds r0, r3, #0
	bl sub_02001A38
	b _0200BBDA
	.align 2, 0
_0200BBC4: .4byte gUnknown_030026D0
_0200BBC8: .4byte 0xFFFF0000
_0200BBCC:
	movs r0, #0x78
	strh r0, [r2, #0x16]
	movs r0, #0x30
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl sub_02003D30
_0200BBDA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200BBE0
sub_0200BBE0: @ 0x0200BBE0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl sub_0200487C
	pop {r0}
	bx r0

	thumb_func_start sub_0200BBF4
sub_0200BBF4: @ 0x0200BBF4
	push {r4, lr}
	ldr r0, _0200BC18 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_0200B9B0
	cmp r0, #0
	bne _0200BC12
	adds r0, r4, #0
	bl sub_0200B860
_0200BC12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BC18: .4byte gUnknown_030026D0

	thumb_func_start sub_0200BC1C
sub_0200BC1C: @ 0x0200BC1C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0200BCA0 @ =sub_0200BCB8
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	movs r6, #0
	str r6, [sp]
	movs r1, #0x30
	mov r2, sb
	movs r3, #0
	bl sub_0200198C
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r3, #0
	mov r8, r3
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0200BCA4 @ =0x06013240
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	movs r0, #0x6c
	strh r0, [r1, #0xa]
	ldr r3, _0200BCA8 @ =gUnknown_03000020
	adds r0, r2, r3
	mov r3, r8
	strb r3, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0200BCAC @ =gUnknown_03000021
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _0200BCB0 @ =gUnknown_03000022
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _0200BCB4 @ =gUnknown_03000025
	adds r2, r2, r3
	mov r0, r8
	strb r0, [r2]
	mov r3, sb
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200BCA0: .4byte sub_0200BCB8
_0200BCA4: .4byte 0x06013240
_0200BCA8: .4byte gUnknown_03000020
_0200BCAC: .4byte gUnknown_03000021
_0200BCB0: .4byte gUnknown_03000022
_0200BCB4: .4byte gUnknown_03000025

	thumb_func_start sub_0200BCB8
sub_0200BCB8: @ 0x0200BCB8
	push {r4, r5, r6, r7, lr}
	ldr r7, _0200BD04 @ =gUnknown_030026D0
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x16]
	adds r5, r0, #0
	ldrh r6, [r4, #0x18]
	ldr r1, _0200BD08 @ =gUnknown_03005650
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_020030A0
	cmp r0, #0
	bne _0200BCF2
	adds r0, r4, #0
	bl sub_02003D30
	ldr r0, [r7]
	bl sub_02001A38
_0200BCF2:
	adds r0, r4, #0
	bl sub_02003D30
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BD04: .4byte gUnknown_030026D0
_0200BD08: .4byte gUnknown_03005650

	thumb_func_start sub_0200BD0C
sub_0200BD0C: @ 0x0200BD0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0200BDC0 @ =gUnknown_030053CC
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0200BE1E
	ldr r0, _0200BDC4 @ =sub_0200BE3C
	movs r1, #0x80
	lsls r1, r1, #6
	mov r8, r1
	movs r4, #0
	str r4, [sp]
	movs r1, #0x34
	mov r2, r8
	movs r3, #0
	bl sub_0200198C
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0200BDC8 @ =gUnknown_03000031
	adds r0, r3, r2
	strb r4, [r0]
	movs r5, #0
	strh r6, [r1, #0x16]
	strh r7, [r1, #0x18]
	ldr r0, _0200BDCC @ =0x06013040
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	movs r0, #0x6b
	strh r0, [r1, #0xa]
	subs r2, #0x11
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _0200BDD0 @ =gUnknown_03000021
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0200BDD4 @ =gUnknown_03000022
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0200BDD8 @ =gUnknown_03000025
	adds r0, r3, r2
	strb r5, [r0]
	mov r0, r8
	str r0, [r1, #0x10]
	ldr r0, _0200BDDC @ =gUnknown_030053B0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r1, _0200BDE0 @ =gUnknown_03000030
	adds r3, r3, r1
	strb r0, [r3]
	cmp r0, #0
	beq _0200BDF0
	ldr r4, _0200BDE4 @ =0x0201F2F0
	ldr r1, _0200BDE8 @ =gUnknown_0201C7C0
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0200BDEC @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	b _0200BE16
	.align 2, 0
_0200BDC0: .4byte gUnknown_030053CC
_0200BDC4: .4byte sub_0200BE3C
_0200BDC8: .4byte gUnknown_03000031
_0200BDCC: .4byte 0x06013040
_0200BDD0: .4byte gUnknown_03000021
_0200BDD4: .4byte gUnknown_03000022
_0200BDD8: .4byte gUnknown_03000025
_0200BDDC: .4byte gUnknown_030053B0
_0200BDE0: .4byte gUnknown_03000030
_0200BDE4: .4byte 0x0201F2F0
_0200BDE8: .4byte gUnknown_0201C7C0
_0200BDEC: .4byte 0x0000FFFF
_0200BDF0:
	ldr r4, _0200BE2C @ =0x0201F2B0
	ldr r1, _0200BE30 @ =gUnknown_0201C7C0
	adds r0, r4, #0
	bl MPlayStart
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _0200BE34 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x80
	bl m4aMPlayVolumeControl
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl m4aMPlayPanpotControl
_0200BE16:
	ldr r1, _0200BE38 @ =gUnknown_030053CC
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0200BE1E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BE2C: .4byte 0x0201F2B0
_0200BE30: .4byte gUnknown_0201C7C0
_0200BE34: .4byte 0x0000FFFF
_0200BE38: .4byte gUnknown_030053CC

	thumb_func_start sub_0200BE3C
sub_0200BE3C: @ 0x0200BE3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0200BE9C @ =gUnknown_030026D0
	mov r8, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r5, r4, #0
	ldrh r0, [r4, #0x16]
	adds r6, r0, #0
	ldrh r7, [r4, #0x18]
	ldr r1, _0200BEA0 @ =gUnknown_03005650
	ldr r0, [r1]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_020030A0
	cmp r0, #0
	bne _0200BE88
	adds r0, r4, #0
	bl sub_02003D30
	ldr r0, _0200BEA4 @ =gUnknown_030053CC
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	mov r1, r8
	ldr r0, [r1]
	bl sub_02001A38
_0200BE88:
	adds r0, r5, #0
	bl sub_02003D30
	strh r6, [r5, #0x16]
	strh r7, [r5, #0x18]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200BE9C: .4byte gUnknown_030026D0
_0200BEA0: .4byte gUnknown_03005650
_0200BEA4: .4byte gUnknown_030053CC

	thumb_func_start sub_0200BEA8
sub_0200BEA8: @ 0x0200BEA8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0200BEE4 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200BF3C
	ldr r0, _0200BEE8 @ =gUnknown_03005524
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200BF3C
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200BED0
	ldr r0, _0200BEEC @ =gMPRingCollectWins
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200BF3C
_0200BED0:
	cmp r1, #0x1d
	beq _0200BF3C
	ldr r5, _0200BEF0 @ =gUnknown_03005548
	ldr r4, [r5]
	cmp r4, #0
	beq _0200BEF4
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r4, #2]
	b _0200BF3C
	.align 2, 0
_0200BEE4: .4byte gUnknown_03005444
_0200BEE8: .4byte gUnknown_03005524
_0200BEEC: .4byte gMPRingCollectWins
_0200BEF0: .4byte gUnknown_03005548
_0200BEF4:
	ldr r0, _0200BF44 @ =sub_0200BF54
	movs r2, #0xe0
	lsls r2, r2, #8
	ldr r1, _0200BF48 @ =sub_0200BFFC
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl sub_0200198C
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [r5]
	strh r4, [r0]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0200BF4C @ =gUnknown_030026B0
	strh r4, [r0]
	ldr r1, _0200BF50 @ =gUnknown_03002290
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0200BF3C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200BF44: .4byte sub_0200BF54
_0200BF48: .4byte sub_0200BFFC
_0200BF4C: .4byte gUnknown_030026B0
_0200BF50: .4byte gUnknown_03002290

	thumb_func_start sub_0200BF54
sub_0200BF54: @ 0x0200BF54
	push {r4, lr}
	ldr r0, _0200BF90 @ =gUnknown_030026D0
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r4, r0, #0
	cmp r4, #0
	beq _0200BF9A
	ldrh r2, [r1, #6]
	cmp r2, #0xe
	bhi _0200BF94
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0200BFBC
	adds r0, r2, #1
	strh r0, [r1, #6]
	movs r0, #0
	strh r0, [r1, #4]
	b _0200BFBC
	.align 2, 0
_0200BF90: .4byte gUnknown_030026D0
_0200BF94:
	subs r0, #1
	strh r0, [r1, #2]
	b _0200BFBC
_0200BF9A:
	ldrh r2, [r1, #6]
	cmp r2, #0
	bne _0200BFA8
	adds r0, r3, #0
	bl sub_02001A38
	b _0200BFEE
_0200BFA8:
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0200BFBC
	subs r0, r2, #1
	strh r0, [r1, #6]
	strh r4, [r1, #4]
_0200BFBC:
	ldrh r1, [r1, #6]
	movs r0, #0xf
	ands r0, r1
	ldr r3, _0200BFF4 @ =gUnknown_030026B0
	lsls r1, r0, #0xc
	lsls r2, r0, #8
	orrs r1, r2
	lsls r2, r0, #4
	orrs r1, r2
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0200BFF8 @ =gUnknown_03002290
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0200BFEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200BFF4: .4byte gUnknown_030026B0
_0200BFF8: .4byte gUnknown_03002290

	thumb_func_start sub_0200BFFC
sub_0200BFFC: @ 0x0200BFFC
	push {r4, lr}
	ldr r0, _0200C030 @ =gUnknown_03005548
	movs r4, #0
	str r4, [r0]
	ldr r2, _0200C034 @ =gUnknown_03002290
	ldrh r3, [r2]
	ldr r1, _0200C038 @ =0x0000FFBF
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2, #2]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #2]
	ldrh r3, [r2, #4]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	ands r1, r0
	strh r1, [r2, #6]
	ldr r0, _0200C03C @ =gUnknown_030026B0
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200C030: .4byte gUnknown_03005548
_0200C034: .4byte gUnknown_03002290
_0200C038: .4byte 0x0000FFBF
_0200C03C: .4byte gUnknown_030026B0

	thumb_func_start sub_0200C040
sub_0200C040: @ 0x0200C040
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r7, _0200C220 @ =gUnknown_03005650
	lsls r0, r0, #2
	str r0, [sp, #4]
	ldr r6, _0200C224 @ =gUnknown_02015C4C
	adds r6, r0, r6
	ldr r1, _0200C228 @ =gUnknown_03002820
	movs r2, #0xf9
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _0200C22C @ =gUnknown_03002290
	movs r0, #0
	mov sb, r0
	ldr r0, _0200C230 @ =0x00001E01
	strh r0, [r3, #2]
	ldr r0, _0200C234 @ =0x00001F02
	strh r0, [r3, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x1f
	asrs r1, r1, #6
	movs r0, #1
	ldrsb r0, [r6, r0]
	adds r0, #0x1f
	asrs r0, r0, #6
	lsls r0, r0, #1
	orrs r1, r0
	lsls r1, r1, #0xe
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #8
	movs r2, #3
	orrs r0, r2
	orrs r1, r0
	movs r0, #2
	ldrsb r0, [r6, r0]
	lsls r0, r0, #2
	orrs r1, r0
	strh r1, [r3, #6]
	ldr r1, _0200C238 @ =gUnknown_03005550
	mov sl, r1
	ldr r5, _0200C23C @ =gUnknown_02015B44
	mov r0, sl
	adds r0, #0x40
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_02014E5C
	mov r2, r8
	lsls r4, r2, #1
	add r4, r8
	mov r0, sl
	adds r0, #0x5c
	strh r4, [r0]
	adds r0, #0x24
	adds r1, r5, #0
	adds r1, #0x40
	movs r2, #0x40
	bl sub_02014E5C
	adds r1, r4, #1
	mov r0, sl
	adds r0, #0x9c
	strh r1, [r0]
	adds r0, #0x24
	adds r5, #0x80
	adds r1, r5, #0
	movs r2, #0x40
	bl sub_02014E5C
	adds r4, #2
	mov r0, sl
	adds r0, #0xdc
	strh r4, [r0]
	mov r2, sl
	adds r2, #0xc4
	movs r0, #2
	ldrsb r0, [r6, r0]
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2]
	adds r2, #8
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #0xb
	adds r0, r0, r1
	str r0, [r2]
	movs r0, #0
	ldrsb r0, [r6, r0]
	mov r1, sl
	adds r1, #0xe6
	strh r0, [r1]
	movs r1, #1
	ldrsb r1, [r6, r1]
	mov r0, sl
	adds r0, #0xe8
	strh r1, [r0]
	ldr r3, _0200C240 @ =gUnknown_03004D60
	movs r0, #0
	strb r0, [r3, #1]
	ldr r0, _0200C244 @ =gUnknown_03002260
	movs r1, #0
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	movs r1, #0xff
	strb r1, [r0, #6]
	movs r2, #0x20
	strb r2, [r0, #7]
	movs r1, #0
	strb r1, [r3, #2]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	mov r1, sl
	adds r1, #0x6e
	ldrh r0, [r1]
	movs r3, #0x82
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x40
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r2, _0200C248 @ =gUnknown_030056B8
	ldr r0, _0200C24C @ =0x02033004
	ldr r1, [r0]
	str r1, [r2]
	mov r0, sb
	str r0, [r7, #0x28]
	ldr r0, [r1, #0x20]
	str r0, [r7, #0x2c]
	mov r2, sb
	str r2, [r7, #0x30]
	ldr r0, [r1, #0x1c]
	str r0, [r7, #0x34]
	ldr r3, _0200C250 @ =gUnknown_030056C0
	ldr r1, [r3, #8]
	asrs r1, r1, #8
	subs r1, #0x78
	str r1, [r7]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	subs r0, #0x54
	str r0, [r7, #4]
	cmp r1, #0
	bge _0200C182
	str r2, [r7]
_0200C182:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0200C18C
	mov r0, sb
	str r0, [r7, #4]
_0200C18C:
	ldr r0, [r7]
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	str r0, [r7, #0x14]
	ldr r1, _0200C250 @ =gUnknown_030056C0
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	subs r0, #4
	adds r1, r7, #0
	adds r1, #0x64
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r7, #8]
	movs r0, #0xc
	str r0, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x56
	mov r2, sb
	strh r2, [r0]
	mov r3, sb
	str r3, [r7, #0x18]
	str r3, [r7, #0x1c]
	str r3, [r7, #0x20]
	str r3, [r7, #0x24]
	subs r0, #0x16
	strh r3, [r0]
	movs r0, #8
	str r0, [r7, #0x44]
	str r3, [r7, #0x48]
	str r3, [r7, #0x4c]
	adds r0, r7, #0
	adds r0, #0x50
	mov r1, sb
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _0200C254 @ =sub_0200C5C4
	movs r2, #0xf0
	lsls r2, r2, #4
	ldr r1, _0200C258 @ =sub_0200C58C
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl sub_0200198C
	str r0, [r7, #0x5c]
	ldr r0, _0200C25C @ =gUnknown_02015C48
	ldr r2, [sp, #4]
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r7, #0x58]
	ldr r0, _0200C260 @ =gUnknown_02015C44
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _0200C20E
	bl sub_02014CC8
_0200C20E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200C220: .4byte gUnknown_03005650
_0200C224: .4byte gUnknown_02015C4C
_0200C228: .4byte gUnknown_03002820
_0200C22C: .4byte gUnknown_03002290
_0200C230: .4byte 0x00001E01
_0200C234: .4byte 0x00001F02
_0200C238: .4byte gUnknown_03005550
_0200C23C: .4byte gUnknown_02015B44
_0200C240: .4byte gUnknown_03004D60
_0200C244: .4byte gUnknown_03002260
_0200C248: .4byte gUnknown_030056B8
_0200C24C: .4byte 0x02033004
_0200C250: .4byte gUnknown_030056C0
_0200C254: .4byte sub_0200C5C4
_0200C258: .4byte sub_0200C58C
_0200C25C: .4byte gUnknown_02015C48
_0200C260: .4byte gUnknown_02015C44

	thumb_func_start sub_0200C264
sub_0200C264: @ 0x0200C264
	push {r4, r5, r6, r7, lr}
	ldr r0, _0200C2B4 @ =gUnknown_030056C0
	mov ip, r0
	ldr r5, _0200C2B8 @ =gUnknown_03005650
	ldr r6, [r5]
	ldr r7, [r5, #4]
	str r6, [r5, #0x38]
	str r7, [r5, #0x3c]
	ldr r0, [r5, #0x30]
	cmp r6, r0
	blt _0200C288
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf1
	adds r0, r6, #0
	cmp r0, r1
	ble _0200C288
	adds r0, r1, #0
_0200C288:
	adds r6, r0, #0
	ldr r0, [r5, #0x28]
	cmp r7, r0
	blt _0200C29A
	ldr r0, [r5, #0x2c]
	subs r0, #0xa1
	adds r1, r7, #0
	cmp r1, r0
	ble _0200C29C
_0200C29A:
	adds r1, r0, #0
_0200C29C:
	adds r7, r1, #0
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0200C2BC
	subs r0, r2, #1
	strh r0, [r1]
	b _0200C356
	.align 2, 0
_0200C2B4: .4byte gUnknown_030056C0
_0200C2B8: .4byte gUnknown_03005650
_0200C2BC:
	adds r4, r5, #0
	adds r4, #0x50
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200C2FA
	mov r0, ip
	ldrh r1, [r0, #0x10]
	ldr r0, [r0, #8]
	asrs r0, r0, #8
	ldr r2, [r5, #0x18]
	adds r0, r0, r2
	subs r0, #0x78
	str r0, [r5, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r3, r5, #0
	adds r3, #0x56
	movs r0, #0
	ldrsh r2, [r3, r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	adds r1, r1, r0
	asrs r1, r1, #4
	strh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0x10]
_0200C2FA:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0200C356
	adds r2, r5, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r4, [r2, r1]
	mov r3, ip
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	subs r3, r0, #4
	ldr r0, _0200C334 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200C322
	rsbs r3, r3, #0
_0200C322:
	cmp r4, r3
	beq _0200C342
	cmp r4, r3
	bge _0200C338
	adds r4, #5
	cmp r4, r3
	ble _0200C340
	b _0200C33E
	.align 2, 0
_0200C334: .4byte gUnknown_030053D4
_0200C338:
	subs r4, #5
	cmp r4, r3
	bge _0200C340
_0200C33E:
	adds r4, r3, #0
_0200C340:
	strh r4, [r2]
_0200C342:
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	ldr r1, [r5, #0x1c]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	subs r1, #0x50
	adds r0, r0, r1
	adds r0, r0, r4
	str r0, [r5, #0x14]
_0200C356:
	ldr r0, [r5, #0x10]
	subs r1, r0, r6
	ldr r0, [r5, #0x44]
	cmp r1, r0
	ble _0200C372
	subs r2, r1, r0
	ldr r0, [r5, #8]
	asrs r1, r0, #8
	adds r3, r0, #0
	cmp r1, r2
	ble _0200C36E
	adds r1, r2, #0
_0200C36E:
	adds r6, r6, r1
	b _0200C386
_0200C372:
	ldr r3, [r5, #8]
	cmn r1, r0
	bge _0200C386
	adds r1, r1, r0
	asrs r0, r3, #8
	rsbs r0, r0, #0
	cmp r0, r1
	bge _0200C384
	adds r0, r1, #0
_0200C384:
	adds r6, r6, r0
_0200C386:
	ldr r4, [r5, #0x30]
	cmp r6, r4
	bge _0200C390
	adds r0, r4, #0
	b _0200C39E
_0200C390:
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf0
	adds r0, r6, #0
	cmp r0, r1
	ble _0200C39E
	adds r0, r1, #0
_0200C39E:
	adds r6, r0, #0
	ldr r0, _0200C3E4 @ =0x00000FFF
	cmp r3, r0
	bgt _0200C3AC
	adds r0, r3, #0
	adds r0, #0x20
	str r0, [r5, #8]
_0200C3AC:
	mov r2, ip
	ldr r0, [r2, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200C3E8
	mov r0, ip
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	bne _0200C3D4
	mov r0, ip
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	beq _0200C3E8
_0200C3D4:
	ldr r0, [r5, #0x48]
	adds r0, #4
	str r0, [r5, #0x48]
	cmp r0, #0x18
	ble _0200C3F4
	movs r0, #0x18
	b _0200C3F4
	.align 2, 0
_0200C3E4: .4byte 0x00000FFF
_0200C3E8:
	ldr r0, [r5, #0x48]
	subs r0, #4
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _0200C3F4
	movs r0, #0
_0200C3F4:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x14]
	subs r1, r0, r7
	ldr r0, [r5, #0x48]
	cmp r1, r0
	ble _0200C40E
	subs r0, r1, r0
	ldr r1, [r5, #0xc]
	cmp r1, r0
	ble _0200C40A
	adds r1, r0, #0
_0200C40A:
	adds r7, r7, r1
	b _0200C420
_0200C40E:
	cmn r1, r0
	bge _0200C420
	adds r1, r1, r0
	ldr r0, [r5, #0xc]
	rsbs r0, r0, #0
	cmp r0, r1
	bge _0200C41E
	adds r0, r1, #0
_0200C41E:
	adds r7, r7, r0
_0200C420:
	ldr r2, [r5, #0x28]
	cmp r7, r2
	bge _0200C42A
	adds r1, r2, #0
	b _0200C436
_0200C42A:
	ldr r0, [r5, #0x2c]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0200C436
	adds r1, r0, #0
_0200C436:
	adds r7, r1, #0
	cmp r6, r4
	bge _0200C440
	adds r0, r4, #0
	b _0200C44E
_0200C440:
	ldr r0, [r5, #0x34]
	adds r1, r0, #0
	subs r1, #0xf0
	adds r0, r6, #0
	cmp r0, r1
	ble _0200C44E
	adds r0, r1, #0
_0200C44E:
	adds r6, r0, #0
	cmp r7, r2
	bge _0200C458
	adds r1, r2, #0
	b _0200C464
_0200C458:
	ldr r0, [r5, #0x2c]
	subs r0, #0xa0
	adds r1, r7, #0
	cmp r1, r0
	ble _0200C464
	adds r1, r0, #0
_0200C464:
	adds r0, r5, #0
	adds r0, #0x60
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r6, r6, r0
	adds r0, r5, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r1, r0
	str r6, [r5]
	str r7, [r5, #4]
	ldr r0, [r5, #0x38]
	subs r0, r0, r6
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x3c]
	subs r0, r0, r7
	str r0, [r5, #0x3c]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_0200C4A4
	ldr r2, [r5, #0x58]
	cmp r2, #0
	beq _0200C49E
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_02014CD0
_0200C49E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200C4A4
sub_0200C4A4: @ 0x0200C4A4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	mov sb, r0
	mov sl, r1
	ldr r4, _0200C500 @ =gUnknown_03005590
	ldr r0, _0200C504 @ =gUnknown_03002810
	mov r8, r0
	movs r0, #7
	mov r6, sb
	ands r6, r0
	mov r1, r8
	strh r6, [r1, #4]
	mov r5, sl
	ands r5, r0
	strh r5, [r1, #6]
	mov r0, sb
	strh r0, [r4, #0x30]
	mov r1, sl
	strh r1, [r4, #0x32]
	adds r0, r4, #0
	bl sub_02001DE4
	adds r0, r4, #0
	bl sub_020029E0
	adds r4, #0x40
	mov r0, r8
	strh r6, [r0, #8]
	strh r5, [r0, #0xa]
	mov r1, sb
	strh r1, [r4, #0x30]
	mov r0, sl
	strh r0, [r4, #0x32]
	adds r0, r4, #0
	bl sub_02001DE4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200C500: .4byte gUnknown_03005590
_0200C504: .4byte gUnknown_03002810

	thumb_func_start sub_0200C508
sub_0200C508: @ 0x0200C508
	push {r4, r5, lr}
	ldr r4, _0200C554 @ =gUnknown_03005550
	ldr r2, _0200C558 @ =gUnknown_03002820
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0200C55C @ =gUnknown_03002290
	movs r5, #0
	ldr r0, _0200C560 @ =0x00001B0F
	strh r0, [r1]
	ldr r1, _0200C564 @ =gUnknown_02015B44
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl sub_02014E5C
	movs r0, #2
	strh r0, [r4, #0x1c]
	ldr r0, _0200C568 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0200C56C @ =0x0600D800
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	movs r0, #0x1e
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_02001DE4
	ldr r0, _0200C570 @ =gUnknown_03002810
	strh r5, [r0]
	strh r5, [r0, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200C554: .4byte gUnknown_03005550
_0200C558: .4byte gUnknown_03002820
_0200C55C: .4byte gUnknown_03002290
_0200C560: .4byte 0x00001B0F
_0200C564: .4byte gUnknown_02015B44
_0200C568: .4byte 0x0600C000
_0200C56C: .4byte 0x0600D800
_0200C570: .4byte gUnknown_03002810

	thumb_func_start sub_0200C574
sub_0200C574: @ 0x0200C574
	push {r4, lr}
	ldr r4, _0200C588 @ =gUnknown_03005650
	ldr r0, [r4, #0x5c]
	bl sub_02001A38
	movs r0, #0
	str r0, [r4, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200C588: .4byte gUnknown_03005650

	thumb_func_start sub_0200C58C
sub_0200C58C: @ 0x0200C58C
	push {lr}
	ldr r1, _0200C5B8 @ =gUnknown_03005650
	movs r0, #0
	str r0, [r1, #0x5c]
	ldr r3, _0200C5BC @ =gUnknown_03001820
	movs r2, #0
	ldr r0, _0200C5C0 @ =gUnknown_03002810
	movs r1, #3
_0200C59C:
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0200C59C
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_0200C5B8: .4byte gUnknown_03005650
_0200C5BC: .4byte gUnknown_03001820
_0200C5C0: .4byte gUnknown_03002810

	thumb_func_start sub_0200C5C4
sub_0200C5C4: @ 0x0200C5C4
	push {lr}
	ldr r2, _0200C5F0 @ =gUnknown_03002820
	ldrh r1, [r2]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0200C5F4 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _0200C5E2
	ldr r0, _0200C5F8 @ =0x0000DFFF
	ands r1, r0
	strh r1, [r2]
_0200C5E2:
	ldr r0, _0200C5FC @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _0200C600 @ =sub_0200C604
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0200C5F0: .4byte gUnknown_03002820
_0200C5F4: .4byte gUnknown_03005444
_0200C5F8: .4byte 0x0000DFFF
_0200C5FC: .4byte gUnknown_030026D0
_0200C600: .4byte sub_0200C604

	thumb_func_start sub_0200C604
sub_0200C604: @ 0x0200C604
	push {lr}
	bl sub_0200C264
	ldr r1, _0200C614 @ =gUnknown_03005430
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0200C614: .4byte gUnknown_03005430

	thumb_func_start sub_0200C618
sub_0200C618: @ 0x0200C618
	bx lr
	.align 2, 0

	thumb_func_start sub_0200C61C
sub_0200C61C: @ 0x0200C61C
	push {lr}
	ldr r3, _0200C64C @ =gUnknown_03005650
	ldr r0, _0200C650 @ =gUnknown_03005500
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200C646
	ldr r2, _0200C654 @ =gUnknown_03005398
	ldr r1, [r2]
	ldr r0, _0200C658 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0200C65C @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #0xe0
	lsls r1, r1, #0xb
	ands r0, r1
	lsrs r0, r0, #0x10
	subs r0, #8
	str r0, [r3, #0x1c]
_0200C646:
	pop {r0}
	bx r0
	.align 2, 0
_0200C64C: .4byte gUnknown_03005650
_0200C650: .4byte gUnknown_03005500
_0200C654: .4byte gUnknown_03005398
_0200C658: .4byte 0x00196225
_0200C65C: .4byte 0x3C6EF35F

	thumb_func_start sub_0200C660
sub_0200C660: @ 0x0200C660
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r7, [sp, #0x28]
	cmp r7, #0
	bne _0200C67C
	mov r7, sp
_0200C67C:
	mov r4, sp
	adds r4, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl sub_02014CDC
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C756
	mov r1, r8
	adds r0, r6, r1
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl sub_02014CDC
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C718
	mov r5, r8
	lsls r5, r5, #1
	adds r0, r6, r5
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl sub_02014CDC
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C6D8
	mov r0, r8
	cmp r0, #0
	ble _0200C6D0
	movs r0, #7
	ands r0, r6
	movs r1, #0x18
	subs r0, r1, r0
	b _0200C840
_0200C6D0:
	movs r0, #7
	ands r0, r6
	adds r0, #0x11
	b _0200C840
_0200C6D8:
	cmp r1, #8
	bne _0200C6F8
	ldrb r0, [r4]
	strb r0, [r7]
	mov r1, r8
	cmp r1, #0
	ble _0200C6F0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0200C840
_0200C6F0:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0200C840
_0200C6F8:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C70E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0200C840
_0200C70E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0200C840
_0200C718:
	cmp r1, #8
	bne _0200C736
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0200C730
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0200C840
_0200C730:
	movs r0, #7
	ands r0, r6
	b _0200C840
_0200C736:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C74C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0200C840
_0200C74C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0200C840
_0200C756:
	cmp r1, #8
	bne _0200C828
	ldrb r0, [r4]
	strb r0, [r7]
	mov r0, r8
	rsbs r0, r0, #0
	str r0, [sp, #4]
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	ldr r5, [sp, #0x2c]
	bl sub_02014CDC
	adds r1, r0, #0
	cmp r1, #8
	bne _0200C7EE
	ldrb r0, [r4]
	strb r0, [r7]
	ldr r0, [sp, #4]
	mov r1, r8
	subs r0, r0, r1
	adds r0, r6, r0
	mov r1, sb
	mov r2, sl
	adds r3, r4, #0
	bl sub_02014CDC
	adds r1, r0, #0
	cmp r1, #8
	bne _0200C7B0
	ldrb r0, [r4]
	strb r0, [r7]
	mov r5, r8
	cmp r5, #0
	ble _0200C7A8
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x10
	b _0200C840
_0200C7A8:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0200C840
_0200C7B0:
	cmp r1, #0
	bne _0200C7CE
	mov r0, r8
	cmp r0, #0
	ble _0200C7C6
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200C840
_0200C7C6:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0200C840
_0200C7CE:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C7E4
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0200C840
_0200C7E4:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0200C840
_0200C7EE:
	cmp r1, #0
	bne _0200C808
	mov r1, r8
	cmp r1, #0
	ble _0200C800
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0200C840
_0200C800:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0200C840
_0200C808:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C81E
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0200C840
_0200C81E:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0200C840
_0200C828:
	ldrb r0, [r4]
	strb r0, [r7]
	cmp r1, #0
	ble _0200C83A
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0200C840
_0200C83A:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0200C840:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200C850
sub_0200C850: @ 0x0200C850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0200C86E
	mov r1, sp
	str r1, [sp, #0x24]
_0200C86E:
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r4, [sp, #0x28]
	bl sub_02014CD8
	adds r1, r0, #0
	cmp r1, #0
	beq _0200C888
	b _0200CA5C
_0200C888:
	mov r7, r8
	adds r0, r6, r7
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CD8
	adds r1, r0, #0
	cmp r1, #0
	beq _0200C89E
	b _0200CA1A
_0200C89E:
	lsls r4, r7, #1
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #0
	beq _0200C8B6
	b _0200C9D6
_0200C8B6:
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C992
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C94E
	add r4, r8
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #0
	bne _0200C90A
	mov r0, r8
	cmp r0, #0
	ble _0200C902
	movs r0, #7
	ands r0, r6
	movs r1, #0x30
	subs r0, r1, r0
	b _0200CCB0
_0200C902:
	movs r0, #7
	ands r0, r6
	adds r0, #0x29
	b _0200CCB0
_0200C90A:
	cmp r1, #8
	bne _0200C92C
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	cmp r2, #0
	ble _0200C924
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x28
	b _0200CCB0
_0200C924:
	movs r0, #7
	ands r0, r6
	adds r0, #0x20
	b _0200CCB0
_0200C92C:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	cmp r1, #0
	ble _0200C944
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x28
	b _0200CCB0
_0200C944:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x28
	b _0200CCB0
_0200C94E:
	cmp r1, #8
	bne _0200C970
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	cmp r0, #0
	ble _0200C968
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x20
	b _0200CCB0
_0200C968:
	movs r0, #7
	ands r0, r6
	adds r0, #0x18
	b _0200CCB0
_0200C970:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200C988
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x20
	b _0200CCB0
_0200C988:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x20
	b _0200CCB0
_0200C992:
	cmp r1, #8
	bne _0200C9B4
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200C9AC
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x18
	b _0200CCB0
_0200C9AC:
	movs r0, #7
	ands r0, r6
	adds r0, #0x10
	b _0200CCB0
_0200C9B4:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200C9CC
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x18
	b _0200CCB0
_0200C9CC:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x18
	b _0200CCB0
_0200C9D6:
	cmp r1, #8
	bne _0200C9F8
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200C9F0
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #0x10
	b _0200CCB0
_0200C9F0:
	movs r0, #7
	ands r0, r6
	adds r0, #8
	b _0200CCB0
_0200C9F8:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CA10
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	b _0200CCB0
_0200CA10:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #0x10
	b _0200CCB0
_0200CA1A:
	cmp r1, #8
	bne _0200CA3A
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200CA34
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	adds r0, #8
	b _0200CCB0
_0200CA34:
	movs r0, #7
	ands r0, r6
	b _0200CCB0
_0200CA3A:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CA52
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	adds r0, #8
	b _0200CCB0
_0200CA52:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	adds r0, #8
	b _0200CCB0
_0200CA5C:
	cmp r1, #8
	beq _0200CA62
	b _0200CC96
_0200CA62:
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	rsbs r4, r7, #0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #8
	beq _0200CA82
	b _0200CC5A
_0200CA82:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #8
	beq _0200CAA0
	b _0200CC34
_0200CAA0:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #8
	beq _0200CAC0
	b _0200CBF4
_0200CAC0:
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #8
	bne _0200CBB4
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	mov r0, r8
	subs r4, r4, r0
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	ldr r7, [sp, #0x28]
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #8
	bne _0200CB74
	ldrb r0, [r5]
	ldr r1, [sp, #0x24]
	strb r0, [r1]
	mov r2, r8
	subs r4, r4, r2
	adds r0, r6, r4
	mov r1, sb
	mov r2, sl
	adds r3, r5, #0
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #8
	bne _0200CB34
	ldrb r0, [r5]
	ldr r4, [sp, #0x24]
	strb r0, [r4]
	mov r7, r8
	cmp r7, #0
	ble _0200CB2C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	subs r0, #0x28
	b _0200CCB0
_0200CB2C:
	movs r0, #7
	ands r0, r6
	subs r0, #0x30
	b _0200CCB0
_0200CB34:
	cmp r1, #0
	bne _0200CB52
	mov r0, r8
	cmp r0, #0
	ble _0200CB4A
	movs r0, #7
	ands r0, r6
	movs r1, #0x21
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CB4A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x28
	b _0200CCB0
_0200CB52:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CB6A
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x28
	b _0200CCB0
_0200CB6A:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x28
	b _0200CCB0
_0200CB74:
	cmp r1, #0
	bne _0200CB92
	mov r4, r8
	cmp r4, #0
	ble _0200CB8A
	movs r0, #7
	ands r0, r6
	movs r1, #0x19
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CB8A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x20
	b _0200CCB0
_0200CB92:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0200CBAA
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x20
	b _0200CCB0
_0200CBAA:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x20
	b _0200CCB0
_0200CBB4:
	cmp r1, #0
	bne _0200CBD2
	mov r0, r8
	cmp r0, #0
	ble _0200CBCA
	movs r0, #7
	ands r0, r6
	movs r1, #0x11
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CBCA:
	movs r0, #7
	ands r0, r6
	subs r0, #0x18
	b _0200CCB0
_0200CBD2:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CBEA
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x18
	b _0200CCB0
_0200CBEA:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x18
	b _0200CCB0
_0200CBF4:
	cmp r1, #0
	bne _0200CC12
	mov r4, r8
	cmp r4, #0
	ble _0200CC0A
_0200CBFE:
	movs r0, #7
	ands r0, r6
	movs r1, #9
	rsbs r1, r1, #0
	subs r0, r1, r0
	b _0200CCB0
_0200CC0A:
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0200CCB0
_0200CC12:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0200CC2A
_0200CC1C:
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #0x10
	b _0200CCB0
_0200CC2A:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0200CCB0
_0200CC34:
	cmp r1, #0
	bne _0200CC46
	mov r0, r8
	cmp r0, #0
	bgt _0200CBFE
	movs r0, #7
	ands r0, r6
	subs r0, #0x10
	b _0200CCB0
_0200CC46:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	bgt _0200CC1C
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #0x10
	b _0200CCB0
_0200CC5A:
	cmp r1, #0
	bne _0200CC74
	mov r4, r8
	cmp r4, #0
	ble _0200CC6C
	movs r0, #7
	ands r0, r6
	mvns r0, r0
	b _0200CCB0
_0200CC6C:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r6
	b _0200CCB0
_0200CC74:
	ldrb r0, [r5]
	ldr r7, [sp, #0x24]
	strb r0, [r7]
	cmp r1, #0
	ble _0200CC8C
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r1, r1, r0
	adds r0, r1, #0
	subs r0, #8
	b _0200CCB0
_0200CC8C:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
	subs r0, #8
	b _0200CCB0
_0200CC96:
	ldrb r0, [r5]
	ldr r2, [sp, #0x24]
	strb r0, [r2]
	cmp r1, #0
	ble _0200CCAA
	subs r1, #1
	movs r0, #7
	ands r0, r6
	subs r0, r1, r0
	b _0200CCB0
_0200CCAA:
	movs r0, #7
	ands r0, r6
	adds r0, r1, r0
_0200CCB0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200CCC0
sub_0200CCC0: @ 0x0200CCC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	blt _0200CCE8
	ldr r0, _0200CCE4 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0200CCEA
	adds r0, r1, #0
	b _0200CCEA
	.align 2, 0
_0200CCE4: .4byte gUnknown_030056B8
_0200CCE8:
	movs r0, #0
_0200CCEA:
	adds r3, r0, #0
	cmp r4, #0
	blt _0200CD08
	ldr r0, _0200CD04 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r4, #0
	cmp r1, r0
	bls _0200CD0A
	adds r1, r0, #0
	b _0200CD0A
	.align 2, 0
_0200CD04: .4byte gUnknown_030056B8
_0200CD08:
	movs r1, #0
_0200CD0A:
	adds r4, r1, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r3, #0
	bl sub_0200D110
	adds r5, r0, #0
	ldr r3, _0200CDA0 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0200CD32
	subs r2, r6, r2
_0200CD32:
	ldr r0, _0200CDA4 @ =gUnknown_030056B8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r0, #0xf
	ands r2, r0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0200CD54
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r2, r0
_0200CD54:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0200CD5E
	movs r2, #8
_0200CD5E:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0200CD80
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200CD80
	movs r2, #0
_0200CD80:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0200CDAC
	cmp r2, #8
	beq _0200CDA8
	cmp r2, #0
	beq _0200CDA8
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0200CDAA
	subs r0, #0x10
	b _0200CDAA
	.align 2, 0
_0200CDA0: .4byte 0x000003FF
_0200CDA4: .4byte gUnknown_030056B8
_0200CDA8:
	adds r0, r2, #0
_0200CDAA:
	adds r2, r0, #0
_0200CDAC:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200CDB8
sub_0200CDB8: @ 0x0200CDB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r4, #0
	blt _0200CDE0
	ldr r0, _0200CDDC @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0200CDE2
	adds r0, r1, #0
	b _0200CDE2
	.align 2, 0
_0200CDDC: .4byte gUnknown_030056B8
_0200CDE0:
	movs r0, #0
_0200CDE2:
	adds r4, r0, #0
	cmp r3, #0
	blt _0200CE00
	ldr r0, _0200CDFC @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r3, #0
	cmp r0, r1
	bls _0200CE02
	adds r0, r1, #0
	b _0200CE02
	.align 2, 0
_0200CDFC: .4byte gUnknown_030056B8
_0200CE00:
	movs r0, #0
_0200CE02:
	adds r3, r0, #0
	movs r0, #1
	mov r8, r0
	adds r2, r7, #0
	ands r2, r0
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_0200D110
	adds r5, r0, #0
	ldr r3, _0200CE88 @ =0x000003FF
	ands r3, r5
	movs r6, #7
	adds r2, r6, #0
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0200CE2C
	subs r2, r6, r2
_0200CE2C:
	ldr r0, _0200CE8C @ =gUnknown_030056B8
	ldr r4, [r0]
	lsls r0, r3, #3
	ldr r1, [r4]
	adds r0, r0, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsb r2, [r1, r2]
	asrs r2, r2, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0200CE48
	movs r2, #8
_0200CE48:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0200CE6A
	lsrs r0, r3, #3
	ldr r1, [r4, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ands r3, r6
	lsls r1, r3, #1
	asrs r0, r1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200CE6A
	movs r2, #0
_0200CE6A:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0200CE94
	cmp r2, #8
	beq _0200CE90
	cmp r2, #0
	beq _0200CE90
	adds r0, r2, #0
	adds r0, #8
	cmp r2, #0
	ble _0200CE92
	subs r0, #0x10
	b _0200CE92
	.align 2, 0
_0200CE88: .4byte 0x000003FF
_0200CE8C: .4byte gUnknown_030056B8
_0200CE90:
	adds r0, r2, #0
_0200CE92:
	adds r2, r0, #0
_0200CE94:
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0200CEA0
sub_0200CEA0: @ 0x0200CEA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r4, #0
	blt _0200CECC
	ldr r0, _0200CEC8 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0200CECE
	adds r0, r1, #0
	b _0200CECE
	.align 2, 0
_0200CEC8: .4byte gUnknown_030056B8
_0200CECC:
	movs r0, #0
_0200CECE:
	adds r4, r0, #0
	cmp r5, #0
	blt _0200CEEC
	ldr r0, _0200CEE8 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r0, #1
	adds r1, r5, #0
	cmp r1, r0
	bls _0200CEEE
	adds r1, r0, #0
	b _0200CEEE
	.align 2, 0
_0200CEE8: .4byte gUnknown_030056B8
_0200CEEC:
	movs r1, #0
_0200CEEE:
	adds r5, r1, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r4, #0
	bl sub_0200D110
	adds r4, r0, #0
	ldr r6, _0200CF88 @ =0x000003FF
	ands r6, r4
	movs r7, #7
	adds r3, r7, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200CF16
	subs r3, r7, r3
_0200CF16:
	ldr r2, _0200CF8C @ =gUnknown_030056B8
	ldr r5, [r2]
	lsls r0, r6, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r0, #0xf
	ands r3, r0
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0200CF38
	movs r0, #0x10
	rsbs r0, r0, #0
	orrs r3, r0
_0200CF38:
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0200CF42
	movs r3, #8
_0200CF42:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200CF68
	lsrs r0, r6, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r7
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0200CF68
	movs r3, #0
_0200CF68:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200CF94
	cmp r3, #8
	beq _0200CF90
	cmp r3, #0
	beq _0200CF90
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0200CF92
	subs r0, #0x10
	b _0200CF92
	.align 2, 0
_0200CF88: .4byte 0x000003FF
_0200CF8C: .4byte gUnknown_030056B8
_0200CF90:
	adds r0, r3, #0
_0200CF92:
	adds r3, r0, #0
_0200CF94:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200CFB0
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0200CFB0:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200CFCA
	cmp r3, #0
	beq _0200CFC6
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0200CFC8
_0200CFC6:
	adds r0, r2, #0
_0200CFC8:
	adds r2, r0, #0
_0200CFCA:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200CFE0
sub_0200CFE0: @ 0x0200CFE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sl, r3
	cmp r5, #0
	blt _0200D00C
	ldr r0, _0200D008 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	bls _0200D00E
	adds r0, r1, #0
	b _0200D00E
	.align 2, 0
_0200D008: .4byte gUnknown_030056B8
_0200D00C:
	movs r0, #0
_0200D00E:
	adds r5, r0, #0
	cmp r4, #0
	blt _0200D02C
	ldr r0, _0200D028 @ =gUnknown_030056B8
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	subs r1, r0, #1
	adds r0, r4, #0
	cmp r0, r1
	bls _0200D02E
	adds r0, r1, #0
	b _0200D02E
	.align 2, 0
_0200D028: .4byte gUnknown_030056B8
_0200D02C:
	movs r0, #0
_0200D02E:
	adds r4, r0, #0
	movs r0, #1
	mov sb, r0
	mov r2, r8
	ands r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0200D110
	adds r4, r0, #0
	ldr r7, _0200D0B8 @ =0x000003FF
	ands r7, r4
	movs r6, #7
	adds r3, r6, #0
	ands r3, r5
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200D058
	subs r3, r6, r3
_0200D058:
	ldr r2, _0200D0BC @ =gUnknown_030056B8
	ldr r5, [r2]
	lsls r0, r7, #3
	ldr r1, [r5]
	adds r0, r0, r3
	adds r1, r1, r0
	movs r3, #0
	ldrsb r3, [r1, r3]
	asrs r3, r3, #4
	movs r0, #8
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0200D074
	movs r3, #8
_0200D074:
	movs r0, #0x80
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0200D09A
	lsrs r0, r7, #3
	ldr r1, [r5, #0x14]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r7, #0
	ands r0, r6
	lsls r0, r0, #1
	asrs r1, r0
	mov r0, sb
	ands r1, r0
	cmp r1, #0
	beq _0200D09A
	movs r3, #0
_0200D09A:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200D0C4
	cmp r3, #8
	beq _0200D0C0
	cmp r3, #0
	beq _0200D0C0
	adds r0, r3, #0
	adds r0, #8
	cmp r3, #0
	ble _0200D0C2
	subs r0, #0x10
	b _0200D0C2
	.align 2, 0
_0200D0B8: .4byte 0x000003FF
_0200D0BC: .4byte gUnknown_030056B8
_0200D0C0:
	adds r0, r3, #0
_0200D0C2:
	adds r3, r0, #0
_0200D0C4:
	ldr r0, [r2]
	ldr r0, [r0, #4]
	adds r0, r0, r7
	ldrb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0200D0DC
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0200D0DC:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0200D0FA
	cmp r3, #0
	beq _0200D0F6
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0200D0F8
_0200D0F6:
	adds r0, r2, #0
_0200D0F8:
	adds r2, r0, #0
_0200D0FA:
	mov r1, sl
	strb r2, [r1]
	adds r0, r3, #0
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D110
sub_0200D110: @ 0x0200D110
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	mov sb, r2
	asrs r4, r0, #3
	ldr r5, _0200D12C @ =gUnknown_03000400
	ldr r0, [r5]
	cmp r0, r4
	bne _0200D130
	ldr r7, [r5, #8]
	ldr r0, [r5, #4]
	b _0200D148
	.align 2, 0
_0200D12C: .4byte gUnknown_03000400
_0200D130:
	adds r0, r4, #0
	movs r1, #0xc
	bl sub_02014CB8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	str r4, [r5]
	str r0, [r5, #4]
	str r1, [r5, #8]
	adds r7, r1, #0
_0200D148:
	mov r8, r0
	asrs r4, r6, #3
	ldr r6, _0200D15C @ =gUnknown_03000410
	ldr r0, [r6]
	cmp r0, r4
	bne _0200D160
	ldr r5, [r6, #8]
	ldr r3, [r6, #4]
	b _0200D17A
	.align 2, 0
_0200D15C: .4byte gUnknown_03000410
_0200D160:
	adds r0, r4, #0
	movs r1, #0xc
	bl sub_02014CB8
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r4, r1
	adds r3, r0, #0
	str r4, [r6]
	str r3, [r6, #4]
	str r1, [r6, #8]
	adds r5, r1, #0
_0200D17A:
	ldr r0, _0200D1BC @ =gUnknown_030056B8
	ldr r4, [r0]
	mov r1, sb
	lsls r0, r1, #2
	adds r1, r4, #0
	adds r1, #0xc
	adds r1, r1, r0
	ldrh r0, [r4, #0x18]
	muls r0, r3, r0
	add r0, r8
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	lsls r1, r5, #3
	lsls r0, r5, #2
	adds r1, r1, r0
	adds r1, r1, r7
	lsls r3, r2, #8
	lsls r2, r2, #5
	lsls r1, r1, #1
	ldr r0, [r4, #8]
	adds r0, r0, r3
	adds r0, r0, r2
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0200D1BC: .4byte gUnknown_030056B8

	thumb_func_start sub_0200D1C0
sub_0200D1C0: @ 0x0200D1C0
	sub sp, #4
	movs r3, #0
	str r3, [sp]
	ldr r0, _0200D1E8 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _0200D1EC @ =gUnknown_03000400
	str r1, [r0, #4]
	ldr r2, _0200D1F0 @ =0x85000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _0200D1F4 @ =gUnknown_03000410
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #4
	bx lr
	.align 2, 0
_0200D1E8: .4byte 0x040000D4
_0200D1EC: .4byte gUnknown_03000400
_0200D1F0: .4byte 0x85000003
_0200D1F4: .4byte gUnknown_03000410

	thumb_func_start sub_0200D1F8
sub_0200D1F8: @ 0x0200D1F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r3
	ldr r6, [sp, #0x1c]
	cmp r6, #0
	bne _0200D20C
	mov r6, sp
_0200D20C:
	mov r4, sp
	adds r4, #1
	adds r0, r5, #0
	adds r3, r4, #0
	ldr r7, [sp, #0x20]
	bl sub_02014CE4
	adds r1, r0, #0
	cmp r1, #0
	bne _0200D238
	mov r0, r8
	cmp r0, #0
	ble _0200D230
	movs r0, #7
	ands r0, r5
	movs r1, #8
	subs r0, r1, r0
	b _0200D26E
_0200D230:
	movs r0, #7
	ands r0, r5
	adds r0, #1
	b _0200D26E
_0200D238:
	cmp r1, #8
	bne _0200D256
	ldrb r0, [r4]
	strb r0, [r6]
	mov r7, r8
	cmp r7, #0
	ble _0200D24E
	movs r0, #7
	ands r0, r5
	mvns r0, r0
	b _0200D26E
_0200D24E:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r5
	b _0200D26E
_0200D256:
	ldrb r0, [r4]
	strb r0, [r6]
	cmp r1, #0
	ble _0200D268
	subs r1, #1
	movs r0, #7
	ands r0, r5
	subs r0, r1, r0
	b _0200D26E
_0200D268:
	movs r0, #7
	ands r0, r5
	adds r0, r1, r0
_0200D26E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D27C
sub_0200D27C: @ 0x0200D27C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r3, [sp, #0xc]
	bl sub_02014CD4
	adds r1, r0, #0
	cmp r1, #0
	bne _0200D2A4
	cmp r5, #0
	ble _0200D29C
	movs r0, #7
	ands r0, r4
	movs r1, #8
	subs r0, r1, r0
	b _0200D2D0
_0200D29C:
	movs r0, #7
	ands r0, r4
	adds r0, #1
	b _0200D2D0
_0200D2A4:
	cmp r1, #8
	bne _0200D2BC
	cmp r5, #0
	ble _0200D2B4
	movs r0, #7
	ands r0, r4
	mvns r0, r0
	b _0200D2D0
_0200D2B4:
	movs r0, #8
	rsbs r0, r0, #0
	orrs r0, r4
	b _0200D2D0
_0200D2BC:
	cmp r1, #0
	ble _0200D2CA
	subs r1, #1
	movs r0, #7
	ands r0, r4
	subs r0, r1, r0
	b _0200D2D0
_0200D2CA:
	movs r0, #7
	ands r0, r4
	adds r0, r1, r0
_0200D2D0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D2D8
sub_0200D2D8: @ 0x0200D2D8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, #0x60
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r4, r6, #0
	adds r4, #0xc
	cmp r7, #0
	bne _0200D2F4
	ldr r0, _0200D2F0 @ =0x06010000
	b _0200D2FA
	.align 2, 0
_0200D2F0: .4byte 0x06010000
_0200D2F4:
	movs r0, #0x40
	bl sub_0200479C
_0200D2FA:
	str r0, [r4, #4]
	movs r2, #0
	strh r2, [r4, #8]
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	adds r0, r5, #0
	adds r0, #0x6a
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #0x18]
	adds r0, r7, #0
	adds r0, #0x10
	lsls r0, r0, #6
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0200D34C @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200D354
	ldr r0, _0200D350 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #3
	b _0200D35A
	.align 2, 0
_0200D34C: .4byte gUnknown_03005444
_0200D350: .4byte 0x04000128
_0200D354:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
_0200D35A:
	strb r0, [r1]
	ldr r0, _0200D380 @ =0x000C2020
	orrs r0, r7
	str r0, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r1, #0
	strh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	strh r0, [r6, #4]
	strh r1, [r6, #6]
	strh r1, [r6, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200D380: .4byte 0x000C2020

	thumb_func_start sub_0200D384
sub_0200D384: @ 0x0200D384
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ands r0, r1
	adds r0, #1
	cmp r0, #0
	beq _0200D39A
	movs r0, #0xe6
	lsls r0, r0, #9
	b _0200D3A4
_0200D39A:
	adds r0, r5, #0
	adds r0, #0x74
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
_0200D3A4:
	str r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x76
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	ldr r0, _0200D4D8 @ =sub_0200F2BC
	str r0, [r5]
	ldr r0, _0200D4DC @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r1, [r0, #2]
	orrs r2, r1
	ldrh r0, [r0, #4]
	orrs r2, r0
	adds r0, r5, #0
	adds r0, #0x5c
	movs r3, #0
	movs r4, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
	strh r4, [r5, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0xe
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x24
	strb r3, [r0]
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x78
	strb r0, [r1]
	strh r4, [r5, #0x26]
	adds r0, r5, #0
	adds r0, #0x29
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x90
	lsls r0, r0, #4
	str r0, [r5, #0x40]
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r5, #0x44]
	movs r0, #8
	str r0, [r5, #0x48]
	movs r0, #0x40
	str r0, [r5, #0x4c]
	adds r0, r5, #0
	adds r0, #0x64
	strh r4, [r0]
	adds r1, #0x2e
	ldr r0, _0200D4E0 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	strh r4, [r5, #0x2c]
	strh r4, [r5, #0x2e]
	strh r4, [r5, #0x30]
	strh r4, [r5, #0x32]
	str r4, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r3, [r0]
	strh r4, [r5, #0x2a]
	adds r1, #8
	movs r0, #0xb4
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0x23
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r5, #0
	adds r1, #0x86
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6d
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	subs r0, #0x15
	strb r3, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #0x14
	strb r3, [r0]
	adds r0, #5
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	subs r0, #0x3a
	strb r3, [r0]
	adds r0, r5, #0
	bl sub_02010FF4
	adds r0, r5, #0
	adds r0, #0x99
	movs r1, #3
	adds r4, r0, #0
	movs r3, #0
_0200D4BA:
	stm r0!, {r3}
	adds r2, r1, #0
	subs r1, #1
	cmp r2, #0
	bne _0200D4BA
	movs r0, #0x7f
	strb r0, [r4]
	ldr r0, _0200D4E4 @ =gUnknown_03005548
	str r2, [r0]
	ldr r0, _0200D4E8 @ =gUnknown_03005544
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200D4D8: .4byte sub_0200F2BC
_0200D4DC: .4byte gUnknown_030057C8
_0200D4E0: .4byte 0x0000FFFF
_0200D4E4: .4byte gUnknown_03005548
_0200D4E8: .4byte gUnknown_03005544

	thumb_func_start sub_0200D4EC
sub_0200D4EC: @ 0x0200D4EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _0200D504
	add r6, sp, #8
_0200D504:
	cmp r7, #0
	bne _0200D50A
	add r7, sp, #0xc
_0200D50A:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _0200D5A0 @ =0x000002FF
	cmp r0, r5
	bgt _0200D536
	movs r0, #0x80
	orrs r2, r0
_0200D536:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _0200D5A4 @ =sub_0200CEA0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D5A0 @ =0x000002FF
	cmp r0, r3
	bgt _0200D57A
	movs r0, #0x80
	orrs r2, r0
_0200D57A:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _0200D5A8
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0200D5B0
	.align 2, 0
_0200D5A0: .4byte 0x000002FF
_0200D5A4: .4byte sub_0200CEA0
_0200D5A8:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0200D5B0:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D5C4
sub_0200D5C4: @ 0x0200D5C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _0200D5DC
	add r6, sp, #8
_0200D5DC:
	cmp r7, #0
	bne _0200D5E2
	add r7, sp, #0xc
_0200D5E2:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _0200D674 @ =0x000002FF
	cmp r0, r5
	bgt _0200D60E
	movs r0, #0x80
	orrs r2, r0
_0200D60E:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _0200D678 @ =sub_0200CEA0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D674 @ =0x000002FF
	cmp r0, r3
	bgt _0200D650
	movs r0, #0x80
	orrs r2, r0
_0200D650:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _0200D67C
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0200D684
	.align 2, 0
_0200D674: .4byte 0x000002FF
_0200D678: .4byte sub_0200CEA0
_0200D67C:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0200D684:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D698
sub_0200D698: @ 0x0200D698
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _0200D6B0
	add r6, sp, #8
_0200D6B0:
	cmp r7, #0
	bne _0200D6B6
	add r7, sp, #0xc
_0200D6B6:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	ldr r5, _0200D74C @ =0x000002FF
	cmp r0, r5
	bgt _0200D6E2
	movs r0, #0x80
	orrs r2, r0
_0200D6E2:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _0200D750 @ =sub_0200CFE0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D74C @ =0x000002FF
	cmp r0, r3
	bgt _0200D726
	movs r0, #0x80
	orrs r2, r0
_0200D726:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _0200D754
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0200D75C
	.align 2, 0
_0200D74C: .4byte 0x000002FF
_0200D750: .4byte sub_0200CFE0
_0200D754:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0200D75C:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200D770
sub_0200D770: @ 0x0200D770
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0200D7C4
	movs r0, #0x80
	lsls r0, r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0200D798
	ldr r0, _0200D7BC @ =gUnknown_030056C0
	ldr r1, _0200D7C0 @ =sub_0200F2BC
	str r1, [r0]
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_0200D798:
	ldr r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0200D7B2
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
_0200D7B2:
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _0200D7CC
	.align 2, 0
_0200D7BC: .4byte gUnknown_030056C0
_0200D7C0: .4byte sub_0200F2BC
_0200D7C4:
	movs r0, #0x13
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r4, #0x20]
_0200D7CC:
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200D7DC
sub_0200D7DC: @ 0x0200D7DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D8CC @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0200D80E
	movs r2, #0x80
	orrs r2, r5
_0200D80E:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _0200D8D0 @ =sub_0200CEA0
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_0200C660
	adds r2, r0, #0
	cmp r2, #0
	bgt _0200D832
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
_0200D832:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0200D850
	movs r0, #0x80
	orrs r2, r0
_0200D850:
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	adds r2, r0, #0
	cmp r2, #0
	bgt _0200D86E
	lsls r1, r2, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r7, [r4, #0x10]
_0200D86E:
	add r2, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_02011370
	adds r2, r0, #0
	cmp r2, #0
	bge _0200D90A
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x18
	adds r1, #6
	rsbs r1, r1, #0
	cmp r2, r1
	bge _0200D892
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _0200D90A
_0200D892:
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	lsls r1, r2, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200D770
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200D8D4
	strh r7, [r4, #0x10]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xbd
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200D8EE
	strh r1, [r4, #0x12]
	b _0200D8EE
	.align 2, 0
_0200D8CC: .4byte 0x000002FF
_0200D8D0: .4byte sub_0200CEA0
_0200D8D4:
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0200D8E6
	strh r1, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	b _0200D908
_0200D8E6:
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r4, #0x12]
_0200D8EE:
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200D8F8
	rsbs r1, r1, #0
_0200D8F8:
	strh r1, [r4, #0x14]
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0200D90A
	rsbs r0, r1, #0
_0200D908:
	strh r0, [r4, #0x14]
_0200D90A:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200D918
sub_0200D918: @ 0x0200D918
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x38
	ldrb r5, [r0]
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r7, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	ldr r3, _0200D9F4 @ =0x000002FF
	mov sb, r3
	cmp r0, sb
	bgt _0200D94A
	movs r2, #0x80
	orrs r2, r5
_0200D94A:
	movs r3, #8
	rsbs r3, r3, #0
	movs r6, #0
	str r6, [sp]
	ldr r0, _0200D9F8 @ =sub_0200CEA0
	mov r8, r0
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_0200C660
	cmp r0, #0
	bgt _0200D96C
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	subs r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_0200D96C:
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #0xc]
	asrs r1, r0, #8
	adds r2, r5, #0
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, sb
	bgt _0200D98A
	movs r0, #0x80
	orrs r2, r0
_0200D98A:
	str r6, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	cmp r0, #0
	bgt _0200D9A6
	lsls r1, r0, #8
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	strh r6, [r4, #0x10]
_0200D9A6:
	add r2, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	bl sub_02011324
	cmp r0, #0
	bgt _0200DA00
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200D9FC
	add r0, sp, #8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #0x40
	cmp r0, #0
	ble _0200D9FC
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0200D9F0
	rsbs r0, r0, #0
_0200D9F0:
	strh r0, [r4, #0x14]
	b _0200DA00
	.align 2, 0
_0200D9F4: .4byte 0x000002FF
_0200D9F8: .4byte sub_0200CEA0
_0200D9FC:
	movs r0, #0
	strh r0, [r4, #0x12]
_0200DA00:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DA10
sub_0200DA10: @ 0x0200DA10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r6, r0, r1
	ldr r0, [r4, #0xc]
	asrs r5, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0200DA84 @ =0x000002FF
	cmp r1, r0
	bgt _0200DA3A
	movs r0, #0x80
	orrs r2, r0
_0200DA3A:
	movs r3, #8
	rsbs r3, r3, #0
	movs r7, #0
	str r7, [sp]
	ldr r0, _0200DA88 @ =sub_0200CEA0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0200C660
	cmp r0, #0
	bgt _0200DA60
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	subs r1, r1, r0
	str r1, [r4, #8]
	strh r7, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_0200DA60:
	add r5, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011324
	cmp r0, #0
	bgt _0200DA8C
	lsls r0, r0, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0200DAC0
	strh r7, [r4, #0x12]
	b _0200DAC0
	.align 2, 0
_0200DA84: .4byte 0x000002FF
_0200DA88: .4byte sub_0200CEA0
_0200DA8C:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0200DAC0
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011370
	cmp r0, #0
	bgt _0200DAC0
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	strh r7, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0200DAC0:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DAC8
sub_0200DAC8: @ 0x0200DAC8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x38
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #3
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r5, r0, r1
	ldr r0, [r4, #0xc]
	asrs r3, r0, #8
	ldrb r2, [r2]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, _0200DB3C @ =0x000002FF
	cmp r1, r0
	bgt _0200DAF2
	movs r0, #0x80
	orrs r2, r0
_0200DAF2:
	movs r6, #0
	str r6, [sp]
	ldr r0, _0200DB40 @ =sub_0200CEA0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r3, #0
	movs r3, #8
	bl sub_0200C660
	cmp r0, #0
	bgt _0200DB16
	lsls r0, r0, #8
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	strh r6, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_0200DB16:
	add r5, sp, #0xc
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011324
	cmp r0, #0
	bgt _0200DB44
	lsls r0, r0, #8
	ldr r1, [r4, #0xc]
	subs r1, r1, r0
	str r1, [r4, #0xc]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0200DB78
	strh r6, [r4, #0x12]
	b _0200DB78
	.align 2, 0
_0200DB3C: .4byte 0x000002FF
_0200DB40: .4byte sub_0200CEA0
_0200DB44:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0200DB78
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl sub_02011370
	cmp r0, #0
	bgt _0200DB78
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	strh r6, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0200DB78:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DB80
sub_0200DB80: @ 0x0200DB80
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	mov r1, sp
	bl sub_02011324
	cmp r0, #0
	bgt _0200DBD8
	lsls r1, r0, #8
	ldr r0, [r4, #0xc]
	subs r0, r0, r1
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_0200D770
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0200DBB4
	rsbs r1, r1, #0
_0200DBB4:
	strh r1, [r4, #0x14]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0200DBC6
	rsbs r0, r1, #0
	strh r0, [r4, #0x14]
_0200DBC6:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200DBD8
	ldr r0, [r4, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #0x20]
_0200DBD8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DBE0
sub_0200DBE0: @ 0x0200DBE0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	blt _0200DC24
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl sub_02011370
	cmp r0, #0
	bgt _0200DC1C
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0200D770
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0200DC1C:
	adds r0, r5, #0
	bl sub_0200DB80
	b _0200DC58
_0200DC24:
	adds r0, r5, #0
	bl sub_0200DB80
	add r2, sp, #8
	adds r0, r5, #0
	mov r1, sp
	bl sub_02011370
	cmp r0, #0
	bgt _0200DC58
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0200D770
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_0200DC58:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DC60
sub_0200DC60: @ 0x0200DC60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	mov r1, sl
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	adds r2, r7, #0
	adds r2, #0x28
	str r2, [sp, #8]
	str r2, [sp]
	ldr r3, _0200DCF4 @ =sub_0200CFE0
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _0200DCF4 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DCD6
	adds r1, r6, #0
_0200DCD6:
	cmp r1, #0
	beq _0200DD36
	cmp r1, #0
	bge _0200DCFE
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200DD58
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _0200DCF8
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	b _0200DD44
	.align 2, 0
_0200DCF4: .4byte sub_0200CFE0
_0200DCF8:
	mov r3, sb
	ldrb r0, [r3]
	b _0200DD44
_0200DCFE:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200DD08
	rsbs r0, r0, #0
_0200DD08:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200DD12
	movs r0, #0xb
_0200DD12:
	cmp r1, r0
	bgt _0200DD28
	lsls r0, r1, #8
	add sl, r0
	cmp r6, r2
	bge _0200DD22
	ldr r1, [sp, #8]
	b _0200DD42
_0200DD22:
	mov r2, sb
	ldrb r0, [r2]
	b _0200DD44
_0200DD28:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200DD58
_0200DD36:
	cmp r6, r2
	bge _0200DD40
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	b _0200DD44
_0200DD40:
	mov r1, sb
_0200DD42:
	ldrb r0, [r1]
_0200DD44:
	adds r1, r0, #0
	mov r2, sl
	str r2, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200DD58
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200DD58:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200DD68
sub_0200DD68: @ 0x0200DD68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [r7, #0xc]
	str r0, [sp, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _0200DE00 @ =sub_0200CFE0
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _0200DE00 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DDE2
	adds r1, r6, #0
_0200DDE2:
	cmp r1, #0
	beq _0200DE40
	cmp r1, #0
	bge _0200DE04
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200DE62
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _0200DE44
	b _0200DE4A
	.align 2, 0
_0200DE00: .4byte sub_0200CFE0
_0200DE04:
	movs r3, #0x10
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200DE0E
	rsbs r0, r0, #0
_0200DE0E:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200DE18
	movs r0, #0xb
_0200DE18:
	cmp r1, r0
	bgt _0200DE32
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _0200DE2C
	mov r2, r8
	b _0200DE4C
_0200DE2C:
	mov r3, sl
	ldrb r0, [r3]
	b _0200DE4E
_0200DE32:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200DE62
_0200DE40:
	cmp r6, r2
	bge _0200DE4A
_0200DE44:
	mov r1, r8
	ldrb r0, [r1]
	b _0200DE4E
_0200DE4A:
	mov r2, sl
_0200DE4C:
	ldrb r0, [r2]
_0200DE4E:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200DE62
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200DE62:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DE74
sub_0200DE74: @ 0x0200DE74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r0, r5, r0
	asrs r4, r4, #8
	subs r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	subs r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov r8, r2
	str r2, [sp]
	ldr r3, _0200DF0C @ =sub_0200CEA0
	str r3, [sp, #4]
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	subs r5, r5, r0
	adds r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	adds r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sl, r0
	str r0, [sp]
	ldr r1, _0200DF0C @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DEEE
	adds r1, r6, #0
_0200DEEE:
	cmp r1, #0
	beq _0200DF4C
	cmp r1, #0
	bge _0200DF10
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200DF6E
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	subs r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _0200DF50
	b _0200DF56
	.align 2, 0
_0200DF0C: .4byte sub_0200CEA0
_0200DF10:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200DF1A
	rsbs r0, r0, #0
_0200DF1A:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200DF24
	movs r0, #0xb
_0200DF24:
	cmp r1, r0
	bgt _0200DF3E
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _0200DF38
	mov r2, r8
	b _0200DF58
_0200DF38:
	mov r3, sl
	ldrb r0, [r3]
	b _0200DF5A
_0200DF3E:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200DF6E
_0200DF4C:
	cmp r6, r2
	bge _0200DF56
_0200DF50:
	mov r1, r8
	ldrb r0, [r1]
	b _0200DF5A
_0200DF56:
	mov r2, sl
_0200DF58:
	ldrb r0, [r2]
_0200DF5A:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200DF6E
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200DF6E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200DF80
sub_0200DF80: @ 0x0200DF80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	str r0, [sp, #8]
	ldr r4, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, [sp, #8]
	asrs r5, r1, #8
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r0, r5, r0
	asrs r4, r4, #8
	adds r1, r4, #2
	movs r2, #0x16
	ldrsb r2, [r7, r2]
	adds r1, r1, r2
	movs r2, #0x28
	adds r2, r2, r7
	mov sl, r2
	str r2, [sp]
	ldr r3, _0200E014 @ =sub_0200CEA0
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r6, r0, #0
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	adds r5, r5, r0
	subs r4, #2
	movs r0, #0x16
	ldrsb r0, [r7, r0]
	subs r4, r4, r0
	movs r0, #0x29
	adds r0, r0, r7
	mov sb, r0
	str r0, [sp]
	ldr r1, _0200E014 @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	movs r3, #8
	bl sub_0200C660
	adds r2, r0, #0
	adds r1, r2, #0
	cmp r2, r6
	ble _0200DFF6
	adds r1, r6, #0
_0200DFF6:
	cmp r1, #0
	beq _0200E054
	cmp r1, #0
	bge _0200E018
	movs r0, #0xb
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0200E076
	lsls r0, r1, #8
	ldr r3, [sp, #8]
	adds r3, r3, r0
	str r3, [sp, #8]
	cmp r6, r2
	blt _0200E058
	b _0200E05E
	.align 2, 0
_0200E014: .4byte sub_0200CEA0
_0200E018:
	movs r3, #0x12
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _0200E022
	rsbs r0, r0, #0
_0200E022:
	asrs r0, r0, #8
	adds r0, #3
	cmp r0, #0xb
	ble _0200E02C
	movs r0, #0xb
_0200E02C:
	cmp r1, r0
	bgt _0200E046
	lsls r0, r1, #8
	ldr r1, [sp, #8]
	adds r1, r1, r0
	str r1, [sp, #8]
	cmp r6, r2
	bge _0200E040
	mov r2, sl
	b _0200E060
_0200E040:
	mov r3, sb
	ldrb r0, [r3]
	b _0200E062
_0200E046:
	ldr r0, [r7, #0x20]
	movs r1, #2
	orrs r0, r1
	subs r1, #0x23
	ands r0, r1
	str r0, [r7, #0x20]
	b _0200E076
_0200E054:
	cmp r6, r2
	bge _0200E05E
_0200E058:
	mov r1, sl
	ldrb r0, [r1]
	b _0200E062
_0200E05E:
	mov r2, sb
_0200E060:
	ldrb r0, [r2]
_0200E062:
	adds r1, r0, #0
	ldr r3, [sp, #8]
	str r3, [r7, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0200E076
	adds r0, r7, #0
	adds r0, #0x24
	strb r1, [r0]
_0200E076:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E088
sub_0200E088: @ 0x0200E088
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0200E0A4
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	b _0200E104
_0200E0A4:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _0200E0BE
	cmp r0, #0
	bgt _0200E0C6
	lsls r0, r1, #0x18
	b _0200E0CA
_0200E0BE:
	cmp r0, #0
	ble _0200E0C6
	lsls r0, r1, #0x18
	b _0200E0CA
_0200E0C6:
	adds r0, #0x1f
	lsls r0, r0, #0x18
_0200E0CA:
	lsrs r2, r0, #0x18
	lsrs r0, r2, #6
	cmp r0, #1
	beq _0200E0F6
	cmp r0, #1
	bgt _0200E0DC
	cmp r0, #0
	beq _0200E0E6
	b _0200E104
_0200E0DC:
	cmp r0, #2
	beq _0200E0EE
	cmp r0, #3
	beq _0200E0FE
	b _0200E104
_0200E0E6:
	adds r0, r3, #0
	bl sub_0200DC60
	b _0200E104
_0200E0EE:
	adds r0, r3, #0
	bl sub_0200DD68
	b _0200E104
_0200E0F6:
	adds r0, r3, #0
	bl sub_0200DE74
	b _0200E104
_0200E0FE:
	adds r0, r3, #0
	bl sub_0200DF80
_0200E104:
	pop {r0}
	bx r0

	thumb_func_start sub_0200E108
sub_0200E108: @ 0x0200E108
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r3, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	adds r1, #0x29
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r4, r0, #6
	cmp r4, #1
	beq _0200E156
	cmp r4, #1
	bgt _0200E132
	cmp r4, #0
	beq _0200E13C
	b _0200E1CC
_0200E132:
	cmp r4, #2
	beq _0200E18C
	cmp r4, #3
	beq _0200E19A
	b _0200E1CC
_0200E13C:
	mov r4, sp
	add r2, sp, #4
	adds r0, r3, #0
	mov r1, sp
	bl sub_020113D4
_0200E148:
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _0200E1B2
	b _0200E1B6
_0200E156:
	mov r5, sp
	add r2, sp, #8
	adds r0, r3, #0
	mov r1, sp
	bl sub_0200D4EC
	adds r3, r0, #0
	ldrb r2, [r5]
	ands r4, r2
	cmp r4, #0
	beq _0200E170
	strb r6, [r5]
	b _0200E1CA
_0200E170:
	ldr r0, _0200E188 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200E1CA
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r5]
	b _0200E1CA
	.align 2, 0
_0200E188: .4byte gUnknown_030053D4
_0200E18C:
	mov r4, sp
	add r2, sp, #0xc
	adds r0, r3, #0
	mov r1, sp
	bl sub_0200D698
	b _0200E148
_0200E19A:
	mov r4, sp
	add r2, sp, #0x10
	adds r0, r3, #0
	mov r1, sp
	bl sub_0200D5C4
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0200E1B6
_0200E1B2:
	strb r6, [r4]
	b _0200E1CA
_0200E1B6:
	ldr r0, _0200E1D8 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200E1CA
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
	strb r0, [r4]
_0200E1CA:
	adds r6, r3, #0
_0200E1CC:
	adds r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0200E1D8: .4byte gUnknown_030053D4

	thumb_func_start sub_0200E1DC
sub_0200E1DC: @ 0x0200E1DC
	push {r4, r5, lr}
	sub sp, #8
	mov ip, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
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
	ble _0200E20E
	cmp r3, #0
	bgt _0200E212
	b _0200E218
_0200E20E:
	cmp r3, #0
	bgt _0200E218
_0200E212:
	adds r0, r2, #0
	adds r0, #0x1f
	lsls r0, r0, #0x18
_0200E218:
	lsrs r2, r0, #0x18
	lsrs r3, r2, #6
	cmp r3, #1
	beq _0200E27C
	cmp r3, #1
	bgt _0200E22A
	cmp r3, #0
	beq _0200E234
	b _0200E2CC
_0200E22A:
	cmp r3, #2
	beq _0200E254
	cmp r3, #3
	beq _0200E2A4
	b _0200E2CC
_0200E234:
	adds r0, r4, #2
	mov r2, ip
	movs r1, #0x16
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0x38
	ldrb r2, [r1]
	str r3, [sp]
	ldr r1, _0200E250 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r1, r5, #0
	b _0200E2BE
	.align 2, 0
_0200E250: .4byte sub_0200CFE0
_0200E254:
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
	ldr r1, _0200E278 @ =sub_0200CFE0
	str r1, [sp, #4]
	adds r1, r5, #0
	bl sub_0200C660
	b _0200E2CE
	.align 2, 0
_0200E278: .4byte sub_0200CFE0
_0200E27C:
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
	ldr r1, _0200E2A0 @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_0200C660
	b _0200E2CE
	.align 2, 0
_0200E2A0: .4byte sub_0200CEA0
_0200E2A4:
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
	ldr r1, _0200E2C8 @ =sub_0200CEA0
	str r1, [sp, #4]
	adds r1, r4, #0
_0200E2BE:
	movs r3, #8
	bl sub_0200C660
	b _0200E2CE
	.align 2, 0
_0200E2C8: .4byte sub_0200CEA0
_0200E2CC:
	movs r0, #0
_0200E2CE:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0200E2D8
sub_0200E2D8: @ 0x0200E2D8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0200E36A
	movs r1, #0x40
	cmp r0, #0
	blt _0200E2EC
	movs r1, #0xc0
_0200E2EC:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0200E1DC
	lsls r2, r0, #8
	cmp r2, #0
	bgt _0200E36A
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0200E332
	cmp r1, #1
	bgt _0200E31E
	cmp r1, #0
	beq _0200E328
	b _0200E35E
_0200E31E:
	cmp r1, #2
	beq _0200E338
	cmp r1, #3
	beq _0200E34A
	b _0200E35E
_0200E328:
	ldr r0, [r4, #0xc]
	adds r0, r0, r2
	str r0, [r4, #0xc]
	strh r1, [r4, #0x12]
	b _0200E35E
_0200E332:
	ldr r0, [r4, #8]
	subs r0, r0, r2
	b _0200E34E
_0200E338:
	ldr r0, [r4, #0xc]
	subs r0, r0, r2
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0200E35E
_0200E34A:
	ldr r0, [r4, #8]
	adds r0, r0, r2
_0200E34E:
	str r0, [r4, #8]
	movs r2, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	strh r2, [r4, #0x14]
_0200E35E:
	adds r0, r4, #0
	adds r0, #0x62
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0200E36A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0200E370
sub_0200E370: @ 0x0200E370
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _0200E408
	movs r1, #0x40
	cmp r0, #0
	blt _0200E384
	movs r1, #0xc0
_0200E384:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200E1DC
	lsls r2, r0, #8
	cmp r2, #0
	bgt _0200E408
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0200E3CA
	cmp r1, #1
	bgt _0200E3B6
	cmp r1, #0
	beq _0200E3C0
	b _0200E408
_0200E3B6:
	cmp r1, #2
	beq _0200E3D0
	cmp r1, #3
	beq _0200E3E2
	b _0200E408
_0200E3C0:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	strh r1, [r5, #0x12]
	b _0200E408
_0200E3CA:
	ldr r0, [r5, #8]
	subs r0, r0, r2
	b _0200E3E6
_0200E3D0:
	ldr r0, [r5, #0xc]
	subs r0, r0, r2
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	orrs r0, r1
	str r0, [r5, #0x20]
	b _0200E408
_0200E3E2:
	ldr r0, [r5, #8]
	adds r0, r0, r2
_0200E3E6:
	str r0, [r5, #8]
	movs r4, #0
	strh r4, [r5, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r4, [r5, #0x14]
_0200E408:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E410
sub_0200E410: @ 0x0200E410
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x40]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	ble _0200E426
	strh r4, [r2, #0x14]
	b _0200E432
_0200E426:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmn r0, r3
	bge _0200E432
	rsbs r0, r4, #0
	strh r0, [r2, #0x14]
_0200E432:
	movs r0, #0x14
	ldrsh r4, [r2, r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldr r5, _0200E47C @ =gUnknown_02014FB8
	ldrb r3, [r0]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x10]
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0200E460
	strh r1, [r2, #0x12]
_0200E460:
	lsls r0, r3, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	ldrh r1, [r2, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200E47C: .4byte gUnknown_02014FB8

	thumb_func_start sub_0200E480
sub_0200E480: @ 0x0200E480
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r7, _0200E4E4 @ =gUnknown_03005650
	ldr r5, [r2, #8]
	ldr r3, [r2, #0xc]
	ldr r1, [r2, #0x20]
	ldr r0, _0200E4E8 @ =0x80000080
	ands r0, r1
	cmp r0, #0x80
	beq _0200E54C
	cmp r1, #0
	blt _0200E4BA
	ldr r0, [r7, #0x2c]
	lsls r0, r0, #8
	subs r4, r0, #1
	movs r0, #0
	cmp r3, r4
	blt _0200E4AA
	movs r0, #1
_0200E4AA:
	cmp r0, #0
	beq _0200E4BA
	movs r0, #0x80
	orrs r1, r0
	str r1, [r2, #0x20]
	ldr r0, _0200E4EC @ =0x0000FB20
	strh r0, [r2, #0x12]
	adds r3, r4, #0
_0200E4BA:
	ldr r0, _0200E4F0 @ =gUnknown_03005524
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200E4DA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200E4D6
	ldr r0, _0200E4F4 @ =gMPRingCollectWins
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200E4DA
_0200E4D6:
	cmp r1, #0x1d
	bne _0200E500
_0200E4DA:
	ldr r0, _0200E4F8 @ =gUnknown_030053F4
	ldrh r4, [r0]
	ldr r0, _0200E4FC @ =gUnknown_03005434
	ldrh r6, [r0]
	b _0200E504
	.align 2, 0
_0200E4E4: .4byte gUnknown_03005650
_0200E4E8: .4byte 0x80000080
_0200E4EC: .4byte 0x0000FB20
_0200E4F0: .4byte gUnknown_03005524
_0200E4F4: .4byte gMPRingCollectWins
_0200E4F8: .4byte gUnknown_030053F4
_0200E4FC: .4byte gUnknown_03005434
_0200E500:
	ldr r4, [r7, #0x28]
	ldr r6, [r7, #0x2c]
_0200E504:
	mov ip, r5
	mov r8, r3
	ldr r0, [r7, #0x30]
	lsls r0, r0, #8
	cmp r5, r0
	blt _0200E51E
	ldr r0, [r7, #0x34]
	lsls r0, r0, #8
	subs r1, r0, #1
	adds r0, r5, #0
	cmp r0, r1
	ble _0200E51E
	adds r0, r1, #0
_0200E51E:
	adds r5, r0, #0
	lsls r0, r4, #8
	cmp r3, r0
	blt _0200E530
	lsls r0, r6, #8
	subs r0, #1
	adds r1, r3, #0
	cmp r1, r0
	ble _0200E532
_0200E530:
	adds r1, r0, #0
_0200E532:
	adds r3, r1, #0
	cmp r5, ip
	beq _0200E53E
	movs r0, #0
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x14]
_0200E53E:
	cmp r3, r8
	beq _0200E548
	movs r0, #0
	strh r0, [r2, #0x12]
	strh r0, [r2, #0x14]
_0200E548:
	str r5, [r2, #8]
	str r3, [r2, #0xc]
_0200E54C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E558
sub_0200E558: @ 0x0200E558
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, [r0, #0x48]
	lsls r5, r0, #1
	mov r0, ip
	ldr r6, [r0, #0x44]
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	cmp r4, #0x14
	beq _0200E608
	mov r0, ip
	ldr r1, [r0, #0x20]
	movs r7, #0x10
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _0200E608
	mov r0, ip
	ldrh r2, [r0, #0x10]
	adds r0, #0x5c
	ldrh r3, [r0]
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0200E5C4
	cmp r4, #0x3f
	beq _0200E5A2
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0200E5A2
	movs r0, #1
	orrs r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0200E5A2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	rsbs r1, r6, #0
	cmp r0, r1
	bge _0200E604
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	ble _0200E604
	lsls r0, r1, #0x10
	b _0200E602
_0200E5C4:
	adds r0, r7, #0
	ands r0, r3
	cmp r0, #0
	beq _0200E604
	cmp r4, #0x3f
	beq _0200E5E4
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0200E5E4
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	mov r0, ip
	str r1, [r0, #0x20]
_0200E5E4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	ble _0200E604
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	bge _0200E604
	lsls r0, r6, #0x10
_0200E602:
	lsrs r2, r0, #0x10
_0200E604:
	mov r1, ip
	strh r2, [r1, #0x10]
_0200E608:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E610
sub_0200E610: @ 0x0200E610
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0200E634 @ =0x0000BCFF
	cmp r1, r0
	bls _0200E64A
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x15
	cmp r0, #0
	bge _0200E638
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0200E648
	b _0200E646
	.align 2, 0
_0200E634: .4byte 0x0000BCFF
_0200E638:
	cmp r0, #0
	ble _0200E64A
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0200E648
_0200E646:
	movs r1, #0
_0200E648:
	strh r1, [r2, #0x10]
_0200E64A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E650
sub_0200E650: @ 0x0200E650
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x12]
	ldr r0, _0200E674 @ =0x0000BCFF
	cmp r1, r0
	bls _0200E68A
	ldrh r1, [r2, #0x10]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	asrs r0, r0, #0x16
	cmp r0, #0
	bge _0200E678
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0200E688
	b _0200E686
	.align 2, 0
_0200E674: .4byte 0x0000BCFF
_0200E678:
	cmp r0, #0
	ble _0200E68A
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0200E688
_0200E686:
	movs r1, #0
_0200E688:
	strh r1, [r2, #0x10]
_0200E68A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E690
sub_0200E690: @ 0x0200E690
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	cmp r0, r3
	beq _0200E71E
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r0, #0
	adds r1, #0x20
	cmp r1, #0
	ble _0200E6BC
	cmp r0, #0
	beq _0200E6B8
	adds r0, #0x1f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0200E6C8
_0200E6B8:
	movs r0, #0x20
	b _0200E6C8
_0200E6BC:
	cmp r0, #0
	beq _0200E6C6
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _0200E6C8
_0200E6C6:
	movs r0, #0x1f
_0200E6C8:
	lsrs r0, r0, #6
	cmp r0, #1
	beq _0200E702
	cmp r0, #1
	bgt _0200E6D8
	cmp r0, #0
	beq _0200E6E2
	b _0200E71E
_0200E6D8:
	cmp r0, #2
	beq _0200E6F2
	cmp r0, #3
	beq _0200E710
	b _0200E71E
_0200E6E2:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	subs r0, r0, r1
	str r0, [r2, #0xc]
	b _0200E71E
_0200E6F2:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	b _0200E71E
_0200E702:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	adds r0, r0, r1
	b _0200E71C
_0200E710:
	movs r1, #0x17
	ldrsb r1, [r2, r1]
	subs r1, r3, r1
	lsls r1, r1, #8
	ldr r0, [r2, #8]
	subs r0, r0, r1
_0200E71C:
	str r0, [r2, #8]
_0200E71E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E724
sub_0200E724: @ 0x0200E724
	push {r4, r5, r6, r7, lr}
	ldr r7, _0200E7BC @ =gUnknown_030026D0
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r6, [r1, #4]
	cmp r6, #0
	bne _0200E7EC
	ldr r0, _0200E7C0 @ =gUnknown_030053B0
	movs r1, #0
	strh r6, [r0]
	ldr r0, _0200E7C4 @ =gUnknown_0300546C
	strb r1, [r0]
	ldr r5, _0200E7C8 @ =gUnknown_030056C0
	adds r0, r5, #0
	bl sub_0200D384
	ldr r4, _0200E7CC @ =gUnknown_03005650
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #0x18]
	adds r0, r0, r1
	subs r0, #0x78
	str r0, [r4]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r4, #0x1c]
	adds r0, r0, r1
	subs r0, #0x50
	str r0, [r4, #4]
	ldr r0, _0200E7D0 @ =0x0201F270
	movs r1, #0x80
	lsls r1, r1, #1
	bl m4aMPlayTempoControl
	str r6, [r5, #0x20]
	ldr r2, _0200E7D4 @ =gUnknown_030053D4
	ldrh r1, [r2]
	ldr r0, _0200E7D8 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	adds r2, r5, #0
	adds r2, #0x90
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ldr r6, _0200E7DC @ =0xFFFFCFFF
	ands r0, r6
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	movs r3, #0x80
	lsls r3, r3, #6
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r2, #4
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	ands r0, r6
	str r0, [r1, #0x1c]
	ldr r1, [r2]
	ldr r0, [r1, #0x1c]
	orrs r0, r3
	str r0, [r1, #0x1c]
	adds r4, #0x50
	ldrh r1, [r4]
	ldr r0, _0200E7E0 @ =0x0000FFFC
	ands r0, r1
	strh r0, [r4]
	ldr r1, [r7]
	ldr r0, _0200E7E4 @ =sub_0200E8B0
	str r0, [r1, #8]
	ldr r0, _0200E7E8 @ =sub_0200F2BC
	str r0, [r5]
	b _0200E7F0
	.align 2, 0
_0200E7BC: .4byte gUnknown_030026D0
_0200E7C0: .4byte gUnknown_030053B0
_0200E7C4: .4byte gUnknown_0300546C
_0200E7C8: .4byte gUnknown_030056C0
_0200E7CC: .4byte gUnknown_03005650
_0200E7D0: .4byte 0x0201F270
_0200E7D4: .4byte gUnknown_030053D4
_0200E7D8: .4byte 0x0000FF7F
_0200E7DC: .4byte 0xFFFFCFFF
_0200E7E0: .4byte 0x0000FFFC
_0200E7E4: .4byte sub_0200E8B0
_0200E7E8: .4byte sub_0200F2BC
_0200E7EC:
	subs r6, #1
	str r6, [r1, #4]
_0200E7F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E7F8
sub_0200E7F8: @ 0x0200E7F8
	push {r4, r5, r6, lr}
	ldr r4, _0200E854 @ =gUnknown_030056C0
	adds r0, r4, #0
	adds r0, #0x90
	ldr r5, [r0]
	ldr r1, _0200E858 @ =gUnknown_03005650
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	blt _0200E86C
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	ldr r1, _0200E85C @ =0x0000EFFF
	adds r0, r0, r1
	movs r1, #0
	cmp r2, r0
	blt _0200E81C
	movs r1, #1
_0200E81C:
	cmp r1, #0
	beq _0200E86C
	ldr r6, _0200E860 @ =gUnknown_030026D0
	ldr r0, [r6]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r1, #0x3c
	str r1, [r0, #4]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4, #0x20]
	ldr r0, _0200E864 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _0200E84A
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200EF5C
_0200E84A:
	ldr r1, [r6]
	ldr r0, _0200E868 @ =sub_0200E724
	str r0, [r1, #8]
	b _0200E8A8
	.align 2, 0
_0200E854: .4byte gUnknown_030056C0
_0200E858: .4byte gUnknown_03005650
_0200E85C: .4byte 0x0000EFFF
_0200E860: .4byte gUnknown_030026D0
_0200E864: .4byte gUnknown_03005444
_0200E868: .4byte sub_0200E724
_0200E86C:
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200E88C
	adds r2, r1, #0
_0200E88C:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200EE40
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0200EF5C
_0200E8A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200E8B0
sub_0200E8B0: @ 0x0200E8B0
	push {r4, r5, r6, lr}
	ldr r5, _0200E8F8 @ =gUnknown_030056C0
	adds r0, r5, #0
	bl sub_02010FF4
	adds r0, r5, #0
	bl sub_02011034
	adds r0, r5, #0
	bl sub_02011814
	adds r0, r5, #0
	bl sub_020110E0
	ldr r0, _0200E8FC @ =gUnknown_03005474
	movs r1, #0
	str r1, [r0]
	ldr r0, _0200E900 @ =gUnknown_03005458
	str r1, [r0]
	adds r0, r5, #0
	bl sub_0200EC28
	adds r0, r5, #0
	bl sub_0200EA00
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0200E904
	ldr r1, [r5]
	adds r0, r5, #0
	bl sub_02014CCC
	b _0200E92A
	.align 2, 0
_0200E8F8: .4byte gUnknown_030056C0
_0200E8FC: .4byte gUnknown_03005474
_0200E900: .4byte gUnknown_03005458
_0200E904:
	ldr r0, _0200E988 @ =gUnknown_03005524
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200E924
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200E920
	ldr r0, _0200E98C @ =gMPRingCollectWins
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200E924
_0200E920:
	cmp r1, #0x1d
	bne _0200E92A
_0200E924:
	adds r0, r5, #0
	bl sub_0200E480
_0200E92A:
	adds r4, r5, #0
	adds r4, #0x90
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_0200EE40
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_0200EF5C
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #0x14
	beq _0200E95A
	ldrh r1, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0200E95A
	subs r0, r1, #1
	strh r0, [r5, #0x2c]
_0200E95A:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0200E9F4
	ldr r6, _0200E990 @ =gUnknown_03005650
	ldr r0, _0200E994 @ =gUnknown_030026D0
	ldr r1, [r0]
	ldr r0, _0200E998 @ =sub_0200E7F8
	str r0, [r1, #8]
	movs r2, #0
	movs r0, #0x16
	strh r0, [r3]
	strh r2, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	ldr r0, _0200E99C @ =0xFFFFFC00
	cmp r1, r0
	bge _0200E9A0
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r5, #0x12]
	b _0200E9A6
	.align 2, 0
_0200E988: .4byte gUnknown_03005524
_0200E98C: .4byte gMPRingCollectWins
_0200E990: .4byte gUnknown_03005650
_0200E994: .4byte gUnknown_030026D0
_0200E998: .4byte sub_0200E7F8
_0200E99C: .4byte 0xFFFFFC00
_0200E9A0:
	cmp r1, #0
	ble _0200E9A6
	strh r2, [r5, #0x12]
_0200E9A6:
	movs r1, #0
	movs r2, #0
	movs r0, #2
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x18
	ands r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
	adds r2, r6, #0
	adds r2, #0x50
	ldrh r0, [r2]
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200E9FC @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r4]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x80
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_0200E9F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200E9FC: .4byte 0xFFFFCFFF

	thumb_func_start sub_0200EA00
sub_0200EA00: @ 0x0200EA00
	push {lr}
	mov ip, r0
	mov r1, ip
	adds r1, #0x6d
	ldrb r0, [r1]
	cmp r0, #0
	bne _0200EA10
	b _0200EC0A
_0200EA10:
	subs r0, #1
	cmp r0, #0x16
	bls _0200EA18
	b _0200EC0A
_0200EA18:
	lsls r0, r0, #2
	ldr r1, _0200EA24 @ =_0200EA28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0200EA24: .4byte _0200EA28
_0200EA28: @ jump table
	.4byte _0200EA84 @ case 0
	.4byte _0200EA94 @ case 1
	.4byte _0200EAA4 @ case 2
	.4byte _0200EC0A @ case 3
	.4byte _0200EAC4 @ case 4
	.4byte _0200EAC4 @ case 5
	.4byte _0200EAC4 @ case 6
	.4byte _0200EC0A @ case 7
	.4byte _0200EAE0 @ case 8
	.4byte _0200EC0A @ case 9
	.4byte _0200EBD4 @ case 10
	.4byte _0200EBE4 @ case 11
	.4byte _0200EBF4 @ case 12
	.4byte _0200EAF0 @ case 13
	.4byte _0200EB00 @ case 14
	.4byte _0200EB1C @ case 15
	.4byte _0200EB38 @ case 16
	.4byte _0200EB54 @ case 17
	.4byte _0200EB70 @ case 18
	.4byte _0200EB8C @ case 19
	.4byte _0200EBA8 @ case 20
	.4byte _0200EBC4 @ case 21
	.4byte _0200EC04 @ case 22
_0200EA84:
	ldr r1, _0200EA8C @ =gUnknown_030056C0
	ldr r0, _0200EA90 @ =sub_0200F2BC
	b _0200EC08
	.align 2, 0
_0200EA8C: .4byte gUnknown_030056C0
_0200EA90: .4byte sub_0200F2BC
_0200EA94:
	ldr r1, _0200EA9C @ =gUnknown_030056C0
	ldr r0, _0200EAA0 @ =sub_02011874
	b _0200EC08
	.align 2, 0
_0200EA9C: .4byte gUnknown_030056C0
_0200EAA0: .4byte sub_02011874
_0200EAA4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _0200EAB8 @ =0xFF9FFFFF
	ands r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
	ldr r1, _0200EABC @ =gUnknown_030056C0
	ldr r0, _0200EAC0 @ =sub_0200F9B8
	b _0200EC08
	.align 2, 0
_0200EAB8: .4byte 0xFF9FFFFF
_0200EABC: .4byte gUnknown_030056C0
_0200EAC0: .4byte sub_0200F9B8
_0200EAC4:
	mov r1, ip
	ldr r0, [r1, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	orrs r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
	ldr r1, _0200EAD8 @ =gUnknown_030056C0
	ldr r0, _0200EADC @ =sub_0200FC04
	b _0200EC08
	.align 2, 0
_0200EAD8: .4byte gUnknown_030056C0
_0200EADC: .4byte sub_0200FC04
_0200EAE0:
	ldr r1, _0200EAE8 @ =gUnknown_030056C0
	ldr r0, _0200EAEC @ =sub_020105EC
	b _0200EC08
	.align 2, 0
_0200EAE8: .4byte gUnknown_030056C0
_0200EAEC: .4byte sub_020105EC
_0200EAF0:
	ldr r1, _0200EAF8 @ =gUnknown_030056C0
	ldr r0, _0200EAFC @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EAF8: .4byte gUnknown_030056C0
_0200EAFC: .4byte sub_02010788
_0200EB00:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB14 @ =gUnknown_030056C0
	ldr r0, _0200EB18 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB14: .4byte gUnknown_030056C0
_0200EB18: .4byte sub_02010788
_0200EB1C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB30 @ =gUnknown_030056C0
	ldr r0, _0200EB34 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB30: .4byte gUnknown_030056C0
_0200EB34: .4byte sub_02010788
_0200EB38:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x30
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB4C @ =gUnknown_030056C0
	ldr r0, _0200EB50 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB4C: .4byte gUnknown_030056C0
_0200EB50: .4byte sub_02010788
_0200EB54:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB68 @ =gUnknown_030056C0
	ldr r0, _0200EB6C @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB68: .4byte gUnknown_030056C0
_0200EB6C: .4byte sub_02010788
_0200EB70:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x50
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EB84 @ =gUnknown_030056C0
	ldr r0, _0200EB88 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EB84: .4byte gUnknown_030056C0
_0200EB88: .4byte sub_02010788
_0200EB8C:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x60
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EBA0 @ =gUnknown_030056C0
	ldr r0, _0200EBA4 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EBA0: .4byte gUnknown_030056C0
_0200EBA4: .4byte sub_02010788
_0200EBA8:
	mov r2, ip
	adds r2, #0x6e
	ldrb r1, [r2]
	movs r0, #0x70
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0200EBBC @ =gUnknown_030056C0
	ldr r0, _0200EBC0 @ =sub_02010788
	b _0200EC08
	.align 2, 0
_0200EBBC: .4byte gUnknown_030056C0
_0200EBC0: .4byte sub_02010788
_0200EBC4:
	ldr r1, _0200EBCC @ =gUnknown_030056C0
	ldr r0, _0200EBD0 @ =sub_02010A78
	b _0200EC08
	.align 2, 0
_0200EBCC: .4byte gUnknown_030056C0
_0200EBD0: .4byte sub_02010A78
_0200EBD4:
	ldr r1, _0200EBDC @ =gUnknown_030056C0
	ldr r0, _0200EBE0 @ =sub_02010110
	b _0200EC08
	.align 2, 0
_0200EBDC: .4byte gUnknown_030056C0
_0200EBE0: .4byte sub_02010110
_0200EBE4:
	ldr r1, _0200EBEC @ =gUnknown_030056C0
	ldr r0, _0200EBF0 @ =sub_02010334
	b _0200EC08
	.align 2, 0
_0200EBEC: .4byte gUnknown_030056C0
_0200EBF0: .4byte sub_02010334
_0200EBF4:
	ldr r1, _0200EBFC @ =gUnknown_030056C0
	ldr r0, _0200EC00 @ =sub_020103E0
	b _0200EC08
	.align 2, 0
_0200EBFC: .4byte gUnknown_030056C0
_0200EC00: .4byte sub_020103E0
_0200EC04:
	ldr r1, _0200EC20 @ =gUnknown_030056C0
	ldr r0, _0200EC24 @ =sub_020104BC
_0200EC08:
	str r0, [r1]
_0200EC0A:
	mov r3, ip
	adds r3, #0x6d
	ldrb r0, [r3]
	mov r1, ip
	adds r1, #0x6f
	movs r2, #0
	strb r0, [r1]
	strb r2, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_0200EC20: .4byte gUnknown_030056C0
_0200EC24: .4byte sub_020104BC

	thumb_func_start sub_0200EC28
sub_0200EC28: @ 0x0200EC28
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _0200EC58 @ =gUnknown_03005444
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #2
	bls _0200EC64
	ldr r0, _0200EC5C @ =0x04000128
	ldr r1, [r0]
	lsls r1, r1, #0x1a
	ldr r0, _0200EC60 @ =gUnknown_03005650
	adds r0, #0x66
	lsrs r1, r1, #0x1e
	ldrb r0, [r0]
	cmp r1, r0
	beq _0200EC64
	adds r1, r3, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
	movs r6, #0
	adds r5, r1, #0
	b _0200ECDA
	.align 2, 0
_0200EC58: .4byte gUnknown_03005444
_0200EC5C: .4byte 0x04000128
_0200EC60: .4byte gUnknown_03005650
_0200EC64:
	adds r0, r3, #0
	adds r0, #0x5c
	ldrh r6, [r0]
	ldr r1, [r3, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0xe
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	bne _0200ECDA
	ldr r0, _0200ECEC @ =gUnknown_03002270
	ldrh r4, [r0]
	strh r4, [r5]
	ldrb r0, [r7]
	cmp r0, #2
	bls _0200ECDA
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0200ECDA
	movs r0, #0xf0
	ands r0, r4
	lsrs r2, r0, #4
	ldr r0, _0200ECF0 @ =gUnknown_03005500
	ldr r1, [r0]
	ldrh r0, [r3, #0x32]
	adds r1, r0, r1
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	bne _0200ECAC
	movs r1, #1
_0200ECAC:
	lsls r2, r1
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x1c
	lsrs r0, r0, #0x18
	orrs r0, r1
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x18
	ldr r0, _0200ECF4 @ =0x0000FF0F
	ands r0, r4
	orrs r0, r2
	strh r0, [r5]
	ldrh r0, [r3, #0x32]
	subs r0, #1
	strh r0, [r3, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0200ECDA
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xbf
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
_0200ECDA:
	ldrh r0, [r5]
	eors r6, r0
	ands r6, r0
	adds r0, r3, #0
	adds r0, #0x5e
	strh r6, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200ECEC: .4byte gUnknown_03002270
_0200ECF0: .4byte gUnknown_03005500
_0200ECF4: .4byte 0x0000FF0F

	thumb_func_start sub_0200ECF8
sub_0200ECF8: @ 0x0200ECF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r2, [r0]
	mov sb, r2
	movs r0, #0x68
	adds r0, r0, r4
	mov sl, r0
	ldrh r5, [r0]
	movs r1, #0x6a
	adds r1, r1, r4
	mov ip, r1
	ldrh r1, [r1]
	mov r8, r1
	ldr r0, _0200ED7C @ =gUnknown_02015C50
	ldrh r7, [r0]
	subs r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r5, r3, #0
	adds r0, r2, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0200EDDC
	cmp r1, #0
	bne _0200ED80
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200ED80
	adds r0, r3, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0200ED80
	movs r0, #1
	mov r1, ip
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	b _0200EE30
	.align 2, 0
_0200ED7C: .4byte gUnknown_02015C50
_0200ED80:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0200EE30
	adds r6, r4, #0
	adds r6, #0x6a
	ldrh r0, [r6]
	cmp r0, #1
	bne _0200EE30
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0200EE30
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r1, [r4, #8]
	asrs r1, r1, #8
	adds r2, r4, #0
	adds r2, #0x38
	ldrb r2, [r2]
	movs r3, #0
	str r3, [sp]
	ldr r3, _0200EDD4 @ =sub_0200CFE0
	str r3, [sp, #4]
	movs r3, #8
	bl sub_0200C850
	adds r1, r0, #0
	ldr r0, _0200EDD8 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	beq _0200EE30
	cmp r1, #0x20
	bgt _0200EE30
	movs r0, #2
	strh r0, [r6]
	b _0200EE30
	.align 2, 0
_0200EDD4: .4byte sub_0200CFE0
_0200EDD8: .4byte gUnknown_03005444
_0200EDDC:
	cmp r2, #0x26
	bne _0200EE06
	cmp r3, #0x34
	bne _0200EE30
	cmp r1, #0
	bne _0200EDF4
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0200EE30
	movs r0, #1
	b _0200EE2C
_0200EDF4:
	cmp r1, #1
	bne _0200EE30
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200EE30
	b _0200EE2A
_0200EE06:
	mov r0, sb
	cmp r0, #0x27
	bne _0200EE30
	cmp r5, #0x35
	bne _0200EE30
	mov r1, r8
	cmp r1, #0
	bne _0200EE30
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200EE30
	adds r0, r7, #0
	adds r0, #0x34
	mov r1, sl
	strh r0, [r1]
_0200EE2A:
	movs r0, #2
_0200EE2C:
	mov r1, ip
	strh r0, [r1]
_0200EE30:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0200EE40
sub_0200EE40: @ 0x0200EE40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r0, #0xc
	adds r0, r0, r6
	mov ip, r0
	adds r2, r3, #0
	adds r2, #0x64
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0200EEA6
	adds r0, r3, #0
	adds r0, #0x66
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	beq _0200EEA6
	ldr r5, _0200EEE8 @ =gUnknown_02015C52
	adds r0, r1, #0
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r4, r3, #0
	adds r4, #0x68
	strh r1, [r4]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0x4f
	bgt _0200EE8C
	ldr r0, _0200EEEC @ =gUnknown_02015C50
	ldrh r0, [r0]
	adds r0, r1, r0
	strh r0, [r4]
_0200EE8C:
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r1, r5, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r3, #0
	adds r2, #0x6a
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
_0200EEA6:
	adds r0, r3, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	adds r4, r3, #0
	adds r4, #0x68
	adds r5, r3, #0
	adds r5, #0x6a
	cmp r1, #9
	bne _0200EEF8
	ldr r0, _0200EEEC @ =gUnknown_02015C50
	ldrh r0, [r0]
	adds r0, #9
	strh r0, [r4]
	adds r0, r3, #0
	adds r0, #0x54
	ldrh r0, [r0]
	strh r0, [r5]
	movs r7, #0x14
	ldrsh r0, [r3, r7]
	asrs r1, r0, #5
	asrs r0, r0, #6
	adds r0, r1, r0
	cmp r0, #0
	bge _0200EEDC
	rsbs r0, r0, #0
_0200EEDC:
	cmp r0, #7
	ble _0200EEF0
	cmp r0, #0x80
	ble _0200EEF2
	movs r0, #0x80
	b _0200EEF2
	.align 2, 0
_0200EEE8: .4byte gUnknown_02015C52
_0200EEEC: .4byte gUnknown_02015C50
_0200EEF0:
	movs r0, #8
_0200EEF2:
	mov r1, ip
	adds r1, #0x22
	strb r0, [r1]
_0200EEF8:
	adds r1, r3, #0
	adds r1, #0x98
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrb r2, [r0]
	adds r7, r1, #0
	adds r6, r0, #0
	mov r1, ip
	adds r1, #0x20
	cmp r2, #0
	bne _0200EF24
	mov r2, ip
	ldrh r0, [r2, #0xa]
	ldrh r2, [r4]
	cmp r0, r2
	bne _0200EF24
	ldrb r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	beq _0200EF46
_0200EF24:
	movs r0, #0
	strb r0, [r6]
	ldrh r0, [r4]
	mov r4, ip
	strh r0, [r4, #0xa]
	ldrh r0, [r5]
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x21
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0x30]
	movs r0, #1
	strb r0, [r7]
_0200EF46:
	mov r7, r8
	ldrh r1, [r7]
	adds r0, r3, #0
	adds r0, #0x66
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0200EF5C
sub_0200EF5C: @ 0x0200EF5C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r4, #0xc
	adds r6, r1, #0
	ldr r0, _0200EFF0 @ =gUnknown_03005650
	ldrh r3, [r0]
	ldrh r5, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0200EF86
	ldrh r1, [r4, #0x1e]
	ldr r0, _0200EFF4 @ =0x0000FFFF
	cmp r1, r0
	bne _0200EF88
_0200EF86:
	movs r2, #1
_0200EF88:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _0200EFB6
	cmp r0, #0x29
	bne _0200F03C
_0200EFB6:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r4, #0x10]
	ldr r0, _0200EFF8 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r4, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200EFFC
	movs r0, #0xff
	lsls r0, r0, #8
	b _0200F000
	.align 2, 0
_0200EFF0: .4byte gUnknown_03005650
_0200EFF4: .4byte 0x0000FFFF
_0200EFF8: .4byte 0xFFFFF3FF
_0200EFFC:
	movs r0, #0x80
	lsls r0, r0, #1
_0200F000:
	strh r0, [r6, #2]
	movs r2, #2
	ldrsh r0, [r6, r2]
	cmp r0, #0
	bge _0200F010
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_0200F010:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r4, #0
	bl sub_020030A0
	b _0200F076
_0200F03C:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r4, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r4, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200F05C
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r4, #0x10]
	b _0200F068
_0200F05C:
	ldr r0, _0200F100 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r4, #0x10]
	ldrh r0, [r4, #0x16]
	adds r0, #1
	strh r0, [r4, #0x16]
_0200F068:
	ldr r0, [r4, #0x10]
	ldr r1, _0200F104 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_020030A0
_0200F076:
	ldr r0, _0200F108 @ =gUnknown_03005444
	ldrb r3, [r0]
	cmp r3, #2
	bhi _0200F080
	b _0200F2A4
_0200F080:
	ldr r5, _0200F10C @ =gUnknown_03002840
	ldr r2, _0200F110 @ =gRoomEventQueue
	ldr r0, _0200F114 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r5]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r5, #4]
	ldrh r1, [r4, #0xa]
	strh r1, [r5, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r5, #0xa]
	mov r8, r2
	cmp r3, #5
	bne _0200F0D2
	ldr r0, _0200F118 @ =gUnknown_030053B0
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r5, #6]
_0200F0D2:
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r5, #0xb]
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r5, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r5, #0xd]
	ldr r0, [r4, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0200F11C
	ldrh r0, [r5, #8]
	movs r1, #1
	orrs r0, r1
	b _0200F122
	.align 2, 0
_0200F100: .4byte 0xFFFFFBFF
_0200F104: .4byte 0xFFFFF7FF
_0200F108: .4byte gUnknown_03005444
_0200F10C: .4byte gUnknown_03002840
_0200F110: .4byte gRoomEventQueue
_0200F114: .4byte 0x04000128
_0200F118: .4byte gUnknown_030053B0
_0200F11C:
	ldrh r1, [r5, #8]
	ldr r0, _0200F138 @ =0x0000FFFE
	ands r0, r1
_0200F122:
	strh r0, [r5, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	bne _0200F13C
	ldrh r1, [r5, #8]
	movs r0, #2
	orrs r0, r1
	b _0200F142
	.align 2, 0
_0200F138: .4byte 0x0000FFFE
_0200F13C:
	ldrh r1, [r5, #8]
	ldr r0, _0200F17C @ =0x0000FFFD
	ands r0, r1
_0200F142:
	strh r0, [r5, #8]
	ldrh r0, [r5, #8]
	ldr r2, _0200F180 @ =0x0000FFF7
	ands r2, r0
	strh r2, [r5, #8]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0200F172
	mov r1, ip
	ldr r0, [r1, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0200F172
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	bne _0200F172
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0200F184
_0200F172:
	ldrh r1, [r5, #8]
	movs r0, #4
	orrs r0, r1
	b _0200F188
	.align 2, 0
_0200F17C: .4byte 0x0000FFFD
_0200F180: .4byte 0x0000FFF7
_0200F184:
	ldr r0, _0200F1A4 @ =0x0000FFFB
	ands r0, r2
_0200F188:
	strh r0, [r5, #8]
	mov r2, ip
	ldr r0, [r2, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200F1A8
	ldrh r1, [r5, #8]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	b _0200F1AE
	.align 2, 0
_0200F1A4: .4byte 0x0000FFFB
_0200F1A8:
	ldrh r1, [r5, #8]
	ldr r0, _0200F1C4 @ =0x0000FEFF
	ands r0, r1
_0200F1AE:
	strh r0, [r5, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	beq _0200F1C8
	ldrh r1, [r5, #8]
	movs r0, #0x40
	orrs r0, r1
	b _0200F1CE
	.align 2, 0
_0200F1C4: .4byte 0x0000FEFF
_0200F1C8:
	ldrh r1, [r5, #8]
	ldr r0, _0200F200 @ =0x0000FFBF
	ands r0, r1
_0200F1CE:
	strh r0, [r5, #8]
	ldrh r0, [r5, #8]
	ldr r2, _0200F204 @ =0x0000FFCF
	ands r2, r0
	strh r2, [r5, #8]
	ldr r3, _0200F208 @ =gUnknown_030056C0
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r5, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200F20C
	movs r0, #0x80
	orrs r1, r0
	b _0200F210
	.align 2, 0
_0200F200: .4byte 0x0000FFBF
_0200F204: .4byte 0x0000FFCF
_0200F208: .4byte gUnknown_030056C0
_0200F20C:
	ldr r0, _0200F224 @ =0x0000FF7F
	ands r1, r0
_0200F210:
	strh r1, [r5, #8]
	mov r0, sb
	cmp r0, #0
	beq _0200F228
	ldrh r1, [r5, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _0200F22E
	.align 2, 0
_0200F224: .4byte 0x0000FF7F
_0200F228:
	ldrh r1, [r5, #8]
	ldr r0, _0200F2B0 @ =0x0000F7FF
	ands r0, r1
_0200F22E:
	strh r0, [r5, #8]
	ldr r6, _0200F2B4 @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0200F294
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _0200F274
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _0200F294
_0200F25E:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _0200F274
	strb r2, [r4]
_0200F274:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _0200F294
	ldr r0, _0200F2B4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _0200F274
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _0200F25E
_0200F294:
	ldrh r0, [r5, #8]
	ldr r1, _0200F2B8 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r5, #8]
	ldrb r0, [r4]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r5, #8]
_0200F2A4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F2B0: .4byte 0x0000F7FF
_0200F2B4: .4byte 0x04000128
_0200F2B8: .4byte 0x0000F9FF

	thumb_func_start sub_0200F2BC
sub_0200F2BC: @ 0x0200F2BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200F30C @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _0200F310
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	b _0200F316
	.align 2, 0
_0200F30C: .4byte 0xCEF118CF
_0200F310:
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
_0200F316:
	ldr r0, _0200F328 @ =gUnknown_030056C0
	ldr r1, _0200F32C @ =sub_0200F330
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200F328: .4byte gUnknown_030056C0
_0200F32C: .4byte sub_0200F330

	thumb_func_start sub_0200F330
sub_0200F330: @ 0x0200F330
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_02011758
	cmp r0, #0
	bne _0200F40E
	adds r0, r4, #0
	bl sub_0201178C
	cmp r0, #0
	bne _0200F40E
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	bne _0200F40E
	adds r0, r4, #0
	bl sub_02010DD0
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F38A
	ldr r1, _0200F3D0 @ =gUnknown_02014FB8
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F38A
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F38A:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F3B0
	adds r2, r1, #0
_0200F3B0:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F3D4
	subs r0, #1
	b _0200F3FC
	.align 2, 0
_0200F3D0: .4byte gUnknown_02014FB8
_0200F3D4:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F3FE
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F3EA
	rsbs r1, r1, #0
_0200F3EA:
	ldr r0, _0200F414 @ =0x000001DF
	cmp r1, r0
	bgt _0200F3FE
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F3FC:
	strh r0, [r4, #0x2a]
_0200F3FE:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F40E
	ldr r1, _0200F418 @ =gUnknown_030056C0
	ldr r0, _0200F41C @ =sub_0200FADC
	str r0, [r1]
_0200F40E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200F414: .4byte 0x000001DF
_0200F418: .4byte gUnknown_030056C0
_0200F41C: .4byte sub_0200FADC

	thumb_func_start sub_0200F420
sub_0200F420: @ 0x0200F420
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0201178C
	cmp r0, #0
	bne _0200F50E
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	bne _0200F50E
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200F44E
	ldr r1, _0200F4C8 @ =gUnknown_030056C0
	ldr r0, _0200F4CC @ =sub_0200F2BC
	str r0, [r1]
_0200F44E:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F482
	ldr r1, _0200F4D0 @ =gUnknown_02014FB8
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F482
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F482:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F4A8
	adds r2, r1, #0
_0200F4A8:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F4D4
	subs r0, #1
	b _0200F4FC
	.align 2, 0
_0200F4C8: .4byte gUnknown_030056C0
_0200F4CC: .4byte sub_0200F2BC
_0200F4D0: .4byte gUnknown_02014FB8
_0200F4D4:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F4FE
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F4EA
	rsbs r1, r1, #0
_0200F4EA:
	ldr r0, _0200F514 @ =0x000001DF
	cmp r1, r0
	bgt _0200F4FE
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F4FC:
	strh r0, [r4, #0x2a]
_0200F4FE:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F50E
	ldr r1, _0200F518 @ =gUnknown_030056C0
	ldr r0, _0200F51C @ =sub_0200FADC
	str r0, [r1]
_0200F50E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200F514: .4byte 0x000001DF
_0200F518: .4byte gUnknown_030056C0
_0200F51C: .4byte sub_0200FADC

	thumb_func_start sub_0200F520
sub_0200F520: @ 0x0200F520
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x90
	ldr r0, [r6]
	adds r7, r0, #0
	adds r7, #0xc
	adds r0, r4, #0
	adds r0, #0x68
	ldr r1, _0200F580 @ =gUnknown_02015C50
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl sub_0201178C
	cmp r0, #0
	beq _0200F54A
	b _0200F672
_0200F54A:
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	beq _0200F556
	b _0200F672
_0200F556:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _0200F588
	cmp r5, #1
	bne _0200F5B2
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _0200F592
	strh r5, [r1]
	ldr r0, [r6]
	ldr r1, [r0, #0x1c]
	ldr r2, _0200F584 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r0, #0x1c]
	b _0200F592
	.align 2, 0
_0200F580: .4byte gUnknown_02015C50
_0200F584: .4byte 0xFFFFBFFF
_0200F588:
	cmp r1, #0x40
	beq _0200F592
	ldr r1, _0200F62C @ =gUnknown_030056C0
	ldr r0, _0200F630 @ =sub_0200F2BC
	str r0, [r1]
_0200F592:
	cmp r5, #1
	bne _0200F5B2
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #1
	bne _0200F5B2
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200F5B2
	ldr r1, _0200F62C @ =gUnknown_030056C0
	ldr r0, _0200F630 @ =sub_0200F2BC
	str r0, [r1]
_0200F5B2:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F5E6
	ldr r1, _0200F634 @ =gUnknown_02014FB8
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F5E6
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F5E6:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F60C
	adds r2, r1, #0
_0200F60C:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F638
	subs r0, #1
	b _0200F660
	.align 2, 0
_0200F62C: .4byte gUnknown_030056C0
_0200F630: .4byte sub_0200F2BC
_0200F634: .4byte gUnknown_02014FB8
_0200F638:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F662
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F64E
	rsbs r1, r1, #0
_0200F64E:
	ldr r0, _0200F678 @ =0x000001DF
	cmp r1, r0
	bgt _0200F662
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F660:
	strh r0, [r4, #0x2a]
_0200F662:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F672
	ldr r1, _0200F67C @ =gUnknown_030056C0
	ldr r0, _0200F680 @ =sub_0200FADC
	str r0, [r1]
_0200F672:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F678: .4byte 0x000001DF
_0200F67C: .4byte gUnknown_030056C0
_0200F680: .4byte sub_0200FADC

	thumb_func_start sub_0200F684
sub_0200F684: @ 0x0200F684
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x90
	ldr r0, [r5]
	adds r7, r0, #0
	adds r7, #0xc
	adds r0, r4, #0
	adds r0, #0x68
	ldr r1, _0200F6E8 @ =gUnknown_02015C50
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	bl sub_02010D4C
	cmp r0, #0
	beq _0200F6AE
	b _0200F7DA
_0200F6AE:
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	beq _0200F6BA
	b _0200F7DA
_0200F6BA:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	bne _0200F6F0
	cmp r6, #2
	bne _0200F71A
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _0200F6FA
	movs r0, #1
	strh r0, [r1]
	ldr r2, [r5]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200F6EC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	b _0200F6FA
	.align 2, 0
_0200F6E8: .4byte gUnknown_02015C50
_0200F6EC: .4byte 0xFFFFBFFF
_0200F6F0:
	cmp r1, #0x80
	beq _0200F6FA
	ldr r1, _0200F794 @ =gUnknown_030056C0
	ldr r0, _0200F798 @ =sub_0200F2BC
	str r0, [r1]
_0200F6FA:
	cmp r6, #2
	bne _0200F71A
	adds r0, r4, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #1
	bne _0200F71A
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200F71A
	ldr r1, _0200F794 @ =gUnknown_030056C0
	ldr r0, _0200F798 @ =sub_0200F2BC
	str r0, [r1]
_0200F71A:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r3, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _0200F74E
	ldr r1, _0200F79C @ =gUnknown_02014FB8
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r1, r0, #5
	ldrh r2, [r4, #0x14]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _0200F74E
	adds r0, r2, r1
	strh r0, [r4, #0x14]
_0200F74E:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F774
	adds r2, r1, #0
_0200F774:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F7A0
	subs r0, #1
	b _0200F7C8
	.align 2, 0
_0200F794: .4byte gUnknown_030056C0
_0200F798: .4byte sub_0200F2BC
_0200F79C: .4byte gUnknown_02014FB8
_0200F7A0:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F7CA
	movs r3, #0x14
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bge _0200F7B6
	rsbs r1, r1, #0
_0200F7B6:
	ldr r0, _0200F7E0 @ =0x000001DF
	cmp r1, r0
	bgt _0200F7CA
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F7C8:
	strh r0, [r4, #0x2a]
_0200F7CA:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F7DA
	ldr r1, _0200F7E4 @ =gUnknown_030056C0
	ldr r0, _0200F7E8 @ =sub_0200FADC
	str r0, [r1]
_0200F7DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0200F7E0: .4byte 0x000001DF
_0200F7E4: .4byte gUnknown_030056C0
_0200F7E8: .4byte sub_0200FADC

	thumb_func_start sub_0200F7EC
sub_0200F7EC: @ 0x0200F7EC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x99
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0200F804
	subs r0, r2, #1
	strb r0, [r1]
	b _0200F866
_0200F804:
	adds r0, r4, #0
	bl sub_020115F0
	cmp r0, #0
	beq _0200F810
	b _0200F9A6
_0200F810:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0200F866
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _0200F848
	cmp r1, #0x20
	bne _0200F866
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0200F83C
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0200F866
_0200F83C:
	subs r0, #0x18
	cmp r0, #0
	bge _0200F864
	movs r0, #0x60
	rsbs r0, r0, #0
	b _0200F864
_0200F848:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _0200F85C
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _0200F866
_0200F85C:
	adds r0, #0x18
	cmp r0, #0
	ble _0200F864
	movs r0, #0x60
_0200F864:
	strh r0, [r4, #0x14]
_0200F866:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0200F876
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #8
	b _0200F88E
_0200F876:
	cmp r0, #0
	bge _0200F888
	adds r1, r4, #0
	adds r1, #0x50
	ldr r0, _0200F884 @ =0x0000FFF8
	b _0200F88E
	.align 2, 0
_0200F884: .4byte 0x0000FFF8
_0200F888:
	adds r1, r4, #0
	adds r1, #0x50
	movs r0, #0
_0200F88E:
	strh r0, [r1]
	adds r2, r1, #0
	ldrh r0, [r4, #0x14]
	ldrh r1, [r2]
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bhi _0200F8AA
	strh r1, [r2]
	strh r1, [r4, #0x14]
_0200F8AA:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0200F8C8
	ldr r0, _0200F8C0 @ =gUnknown_030056C0
	ldr r1, _0200F8C4 @ =sub_0200F2BC
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	b _0200F9A6
	.align 2, 0
_0200F8C0: .4byte gUnknown_030056C0
_0200F8C4: .4byte sub_0200F2BC
_0200F8C8:
	movs r0, #0x14
	ldrsh r3, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r5, [r0]
	adds r1, r5, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0xbf
	bgt _0200F912
	cmp r3, #0
	beq _0200F912
	ldr r1, _0200F904 @ =gUnknown_02014FB8
	lsls r0, r5, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _0200F908
	cmp r2, #0
	bgt _0200F90E
	b _0200F90C
	.align 2, 0
_0200F904: .4byte gUnknown_02014FB8
_0200F908:
	cmp r2, #0
	blt _0200F90E
_0200F90C:
	asrs r2, r0, #0xa
_0200F90E:
	adds r3, r3, r2
	strh r3, [r4, #0x14]
_0200F912:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	adds r0, r4, #0
	bl sub_0200E2D8
	ldr r0, [r4, #0x20]
	movs r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0200F934
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
_0200F934:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200F94E
	adds r2, r1, #0
_0200F94E:
	strh r2, [r4, #0x12]
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	ldrh r0, [r4, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	cmp r2, #0
	beq _0200F96E
	subs r0, #1
	b _0200F994
_0200F96E:
	ldrb r0, [r6]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0200F996
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0200F984
	rsbs r1, r1, #0
_0200F984:
	ldr r0, _0200F9AC @ =0x000001DF
	cmp r1, r0
	bgt _0200F996
	strh r2, [r4, #0x14]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	movs r0, #0x1e
_0200F994:
	strh r0, [r4, #0x2a]
_0200F996:
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200F9A6
	ldr r1, _0200F9B0 @ =gUnknown_030056C0
	ldr r0, _0200F9B4 @ =sub_0200FADC
	str r0, [r1]
_0200F9A6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200F9AC: .4byte 0x000001DF
_0200F9B0: .4byte gUnknown_030056C0
_0200F9B4: .4byte sub_0200FADC

	thumb_func_start sub_0200F9B8
sub_0200F9B8: @ 0x0200F9B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200FA10 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #0xe
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	ldr r1, [r4, #0x20]
	movs r0, #0x81
	lsls r0, r0, #1
	orrs r1, r0
	ldr r0, _0200FA14 @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r4, #0x20]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0200F9F8
	movs r0, #0x10
	orrs r1, r0
	str r1, [r4, #0x20]
_0200F9F8:
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0200FA02
	rsbs r1, r1, #0
_0200FA02:
	ldr r0, _0200FA18 @ =0x0000013F
	cmp r1, r0
	bgt _0200FA1C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xa
	b _0200FA22
	.align 2, 0
_0200FA10: .4byte 0xCEF118CF
_0200FA14: .4byte 0xFEFFFFDF
_0200FA18: .4byte 0x0000013F
_0200FA1C:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xb
_0200FA22:
	strh r0, [r1]
	movs r3, #0x9c
	lsls r3, r3, #3
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	subs r1, #0x40
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0200FAC0 @ =gUnknown_02014FB8
	lsls r0, r1, #3
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r0, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	ldrh r5, [r4, #0x10]
	adds r0, r0, r5
	strh r0, [r4, #0x10]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r3, r0
	asrs r0, r0, #8
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0200FA9A
	ldr r0, _0200FAC4 @ =gUnknown_03005524
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0200FA8E
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0200FA8A
	ldr r0, _0200FAC8 @ =gMPRingCollectWins
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200FA8E
_0200FA8A:
	cmp r1, #0x1d
	bne _0200FA9A
_0200FA8E:
	ldr r0, _0200FACC @ =gUnknown_03005650
	ldr r1, [r0, #0x38]
	lsls r1, r1, #8
	ldrh r0, [r4, #0x10]
	subs r0, r0, r1
	strh r0, [r4, #0x10]
_0200FA9A:
	adds r0, r4, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200FAD0 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0xe
	bl m4aSongNumStart
	ldr r0, _0200FAD4 @ =gUnknown_030056C0
	ldr r1, _0200FAD8 @ =sub_0200FADC
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0200FAC0: .4byte gUnknown_02014FB8
_0200FAC4: .4byte gUnknown_03005524
_0200FAC8: .4byte gMPRingCollectWins
_0200FACC: .4byte gUnknown_03005650
_0200FAD0: .4byte 0xFFFFBFFF
_0200FAD4: .4byte gUnknown_030056C0
_0200FAD8: .4byte sub_0200FADC

	thumb_func_start sub_0200FADC
sub_0200FADC: @ 0x0200FADC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0200FB0E
	movs r0, #0x12
	ldrsh r1, [r4, r0]
	movs r0, #0xfd
	lsls r0, r0, #8
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	bge _0200FB0E
	adds r0, r4, #0
	adds r0, #0x5c
	ldr r1, _0200FB68 @ =gUnknown_030057C8
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0200FB0E
	strh r3, [r4, #0x12]
_0200FB0E:
	adds r0, r4, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FB46
	adds r2, r1, #0
_0200FB46:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FB6C
	adds r1, #2
	cmp r1, #0
	ble _0200FB78
	b _0200FB76
	.align 2, 0
_0200FB68: .4byte gUnknown_030057C8
_0200FB6C:
	cmp r1, #0
	ble _0200FB78
	subs r1, #2
	cmp r1, #0
	bge _0200FB78
_0200FB76:
	movs r1, #0
_0200FB78:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _0200FB8C
	cmp r2, #0
	beq _0200FB98
_0200FB8C:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FB98:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FBD0
	cmp r0, #1
	bgt _0200FBB6
	cmp r0, #0
	beq _0200FBC0
	b _0200FBDE
_0200FBB6:
	cmp r0, #2
	beq _0200FBC8
	cmp r0, #3
	beq _0200FBD8
	b _0200FBDE
_0200FBC0:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _0200FBDE
_0200FBC8:
	adds r0, r4, #0
	bl sub_0200D918
	b _0200FBDE
_0200FBD0:
	adds r0, r4, #0
	bl sub_0200DA10
	b _0200FBDE
_0200FBD8:
	adds r0, r4, #0
	bl sub_0200DAC8
_0200FBDE:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0200FBF6
	ldr r1, _0200FBFC @ =gUnknown_030056C0
	ldr r0, _0200FC00 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0200FBF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200FBFC: .4byte gUnknown_030056C0
_0200FC00: .4byte sub_0200F2BC

	thumb_func_start sub_0200FC04
sub_0200FC04: @ 0x0200FC04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _0200FC88 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _0200FC8C @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r0, #5
	ble _0200FC44
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bgt _0200FC54
_0200FC44:
	adds r0, r4, #0
	movs r1, #9
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
_0200FC54:
	adds r1, r4, #0
	adds r1, #0x70
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	strb r3, [r0]
	adds r0, #0x22
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _0200FC90 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x24
	strb r3, [r0]
	ldr r0, _0200FC94 @ =gUnknown_030056C0
	ldr r1, _0200FC98 @ =sub_0200FC9C
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0200FC88: .4byte 0xCEF118CF
_0200FC8C: .4byte 0xFEFFFFDF
_0200FC90: .4byte 0xFFFFBFFF
_0200FC94: .4byte gUnknown_030056C0
_0200FC98: .4byte sub_0200FC9C

	thumb_func_start sub_0200FC9C
sub_0200FC9C: @ 0x0200FC9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FCD6
	adds r2, r1, #0
_0200FCD6:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FCF8
	adds r1, #2
	cmp r1, #0
	ble _0200FD04
	b _0200FD02
_0200FCF8:
	cmp r1, #0
	ble _0200FD04
	subs r1, #2
	cmp r1, #0
	bge _0200FD04
_0200FD02:
	movs r1, #0
_0200FD04:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _0200FD18
	cmp r2, #0
	beq _0200FD24
_0200FD18:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FD24:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FD5C
	cmp r0, #1
	bgt _0200FD42
	cmp r0, #0
	beq _0200FD4C
	b _0200FD6A
_0200FD42:
	cmp r0, #2
	beq _0200FD54
	cmp r0, #3
	beq _0200FD64
	b _0200FD6A
_0200FD4C:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _0200FD6A
_0200FD54:
	adds r0, r4, #0
	bl sub_0200D918
	b _0200FD6A
_0200FD5C:
	adds r0, r4, #0
	bl sub_0200DA10
	b _0200FD6A
_0200FD64:
	adds r0, r4, #0
	bl sub_0200DAC8
_0200FD6A:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0200FD82
	ldr r1, _0200FD88 @ =gUnknown_030056C0
	ldr r0, _0200FD8C @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_0200FD82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0200FD88: .4byte gUnknown_030056C0
_0200FD8C: .4byte sub_0200F2BC

	thumb_func_start sub_0200FD90
sub_0200FD90: @ 0x0200FD90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x68
	ldr r1, _0200FE00 @ =gUnknown_02015C50
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0200FE14
	ldr r2, [r6, #0x20]
	ldr r0, _0200FE04 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r6, #0x20]
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0200FDD8
	movs r1, #8
_0200FDD8:
	ldr r0, _0200FE08 @ =gUnknown_02015E3C
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _0200FDEE
	rsbs r1, r1, #0
_0200FDEE:
	strh r1, [r6, #0x14]
	ldr r1, _0200FE0C @ =gUnknown_030056C0
	ldr r0, _0200FE10 @ =sub_02011874
	str r0, [r1]
	movs r0, #0xc
	bl m4aSongNumStart
	b _0200FEBA
	.align 2, 0
_0200FE00: .4byte gUnknown_02015C50
_0200FE04: .4byte 0xFFFFFBFF
_0200FE08: .4byte gUnknown_02015E3C
_0200FE0C: .4byte gUnknown_030056C0
_0200FE10: .4byte sub_02011874
_0200FE14:
	ldrh r4, [r6, #0x26]
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0200FE2C
	asrs r0, r0, #0x15
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bgt _0200FE2C
	movs r4, #0
_0200FE2C:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _0200FF14 @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0200FE98
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r2, _0200FF18 @ =gMPlayTable
	ldr r0, _0200FF1C @ =gUnknown_02016D8C
	adds r0, #0x5c
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _0200FF20 @ =0x0000FFFF
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x80
	rsbs r2, r2, #0
	ands r2, r4
	adds r0, r5, #0
	bl m4aMPlayPitchControl
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bge _0200FE86
	adds r2, r1, #0
_0200FE86:
	adds r4, r2, #0
	adds r2, r6, #0
	adds r2, #0x6a
	movs r0, #1
	movs r1, #1
	strh r1, [r2]
	adds r1, r6, #0
	adds r1, #0x6c
	strb r0, [r1]
_0200FE98:
	strh r4, [r6, #0x26]
	cmp r7, #3
	bne _0200FEBA
	adds r2, r6, #0
	adds r2, #0x6a
	ldrh r0, [r2]
	cmp r0, #1
	bne _0200FEBA
	mov r4, r8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0200FEBA
	movs r0, #0
	strh r0, [r2]
_0200FEBA:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0200FFB8
	adds r0, r6, #0
	bl sub_0200E610
	adds r0, r6, #0
	bl sub_0200E480
	ldrh r0, [r6, #0x12]
	adds r0, #0x2a
	strh r0, [r6, #0x12]
	movs r1, #0x10
	ldrsh r2, [r6, r1]
	ldr r1, [r6, #8]
	adds r1, r1, r2
	str r1, [r6, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0200FEF0
	adds r2, r1, #0
_0200FEF0:
	strh r2, [r6, #0x12]
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _0200FF24
	adds r1, #2
	cmp r1, #0
	ble _0200FF30
	b _0200FF2E
	.align 2, 0
_0200FF14: .4byte gUnknown_030057C8
_0200FF18: .4byte gMPlayTable
_0200FF1C: .4byte gUnknown_02016D8C
_0200FF20: .4byte 0x0000FFFF
_0200FF24:
	cmp r1, #0
	ble _0200FF30
	subs r1, #2
	cmp r1, #0
	bge _0200FF30
_0200FF2E:
	movs r1, #0
_0200FF30:
	strb r1, [r5]
	ldrh r2, [r6, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r4, #0x10
	ldrsh r0, [r6, r4]
	cmp r0, #0
	bne _0200FF44
	cmp r2, #0
	beq _0200FF50
_0200FF44:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0200FF50:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _0200FF88
	cmp r0, #1
	bgt _0200FF6E
	cmp r0, #0
	beq _0200FF78
	b _0200FF96
_0200FF6E:
	cmp r0, #2
	beq _0200FF80
	cmp r0, #3
	beq _0200FF90
	b _0200FF96
_0200FF78:
	adds r0, r6, #0
	bl sub_0200D7DC
	b _0200FF96
_0200FF80:
	adds r0, r6, #0
	bl sub_0200D918
	b _0200FF96
_0200FF88:
	adds r0, r6, #0
	bl sub_0200DA10
	b _0200FF96
_0200FF90:
	adds r0, r6, #0
	bl sub_0200DAC8
_0200FF96:
	ldr r0, [r6, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010078
	ldr r1, _0200FFB0 @ =gUnknown_030056C0
	ldr r0, _0200FFB4 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r6, #0x10]
	movs r1, #0
	strh r0, [r6, #0x14]
	strb r1, [r5]
	b _02010078
	.align 2, 0
_0200FFB0: .4byte gUnknown_030056C0
_0200FFB4: .4byte sub_0200F2BC
_0200FFB8:
	movs r4, #0x14
	ldrsh r3, [r6, r4]
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r4, [r0]
	adds r1, r4, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _02010002
	cmp r3, #0
	beq _02010002
	ldr r1, _0200FFF4 @ =gUnknown_02014FB8
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _0200FFF8
	cmp r2, #0
	bgt _0200FFFE
	b _0200FFFC
	.align 2, 0
_0200FFF4: .4byte gUnknown_02014FB8
_0200FFF8:
	cmp r2, #0
	blt _0200FFFE
_0200FFFC:
	asrs r2, r0, #0xa
_0200FFFE:
	adds r3, r3, r2
	strh r3, [r6, #0x14]
_02010002:
	adds r0, r6, #0
	bl sub_0200E480
	adds r0, r6, #0
	bl sub_0200E410
	adds r0, r6, #0
	bl sub_0200E2D8
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	ldr r1, [r6, #8]
	adds r1, r1, r0
	str r1, [r6, #8]
	ldrh r2, [r6, #0x12]
	movs r4, #0x12
	ldrsh r0, [r6, r4]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0201002E
	adds r2, r1, #0
_0201002E:
	strh r2, [r6, #0x12]
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	adds r0, r6, #0
	bl sub_0200E088
	ldrh r0, [r6, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r6, r1]
	cmp r2, #0
	beq _0201004E
	subs r0, #1
	b _02010076
_0201004E:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _02010078
	movs r4, #0x14
	ldrsh r1, [r6, r4]
	cmp r1, #0
	bge _02010064
	rsbs r1, r1, #0
_02010064:
	ldr r0, _02010084 @ =0x000001DF
	cmp r1, r0
	bgt _02010078
	strh r2, [r6, #0x14]
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x1e
_02010076:
	strh r0, [r6, #0x2a]
_02010078:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02010084: .4byte 0x000001DF

	thumb_func_start sub_02010088
sub_02010088: @ 0x02010088
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x38
	movs r4, #0
	strb r4, [r5]
	adds r0, #0x24
	strb r4, [r0]
	adds r3, r6, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010104 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r6, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	ldrb r2, [r5]
	str r4, [sp]
	ldr r3, _02010108 @ =sub_0200CFE0
	str r3, [sp, #4]
	movs r3, #8
	bl sub_0200C850
	lsls r0, r0, #8
	ldr r1, [r6, #0xc]
	adds r1, r1, r0
	str r1, [r6, #0xc]
	ldr r0, [r6, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	ldr r2, _0201010C @ =gUnknown_030056C0
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r2, #0x20]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010104: .4byte 0xFFFFCFFF
_02010108: .4byte sub_0200CFE0
_0201010C: .4byte gUnknown_030056C0

	thumb_func_start sub_02010110
sub_02010110: @ 0x02010110
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _02010188 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #5
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #0x11
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x29
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #0
	beq _02010190
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	ldr r2, _0201018C @ =0xFFFFFF00
	cmp r0, r2
	ble _0201017A
	adds r1, r2, #0
_0201017A:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	ble _020101B4
	b _020101B2
	.align 2, 0
_02010188: .4byte 0xCEF118CF
_0201018C: .4byte 0xFFFFFF00
_02010190:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	ldrh r1, [r4, #0x10]
	movs r2, #0x10
	ldrsh r0, [r4, r2]
	asrs r2, r5, #0x10
	cmp r0, r2
	bge _020101A8
	adds r1, r2, #0
_020101A8:
	strh r1, [r4, #0x10]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, r2
	bge _020101B4
_020101B2:
	adds r1, r2, #0
_020101B4:
	strh r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_02010088
	movs r0, #0x1a
	bl m4aSongNumStart
	ldr r0, _020101D4 @ =gUnknown_030056C0
	ldr r1, _020101D8 @ =sub_020101DC
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020101D4: .4byte gUnknown_030056C0
_020101D8: .4byte sub_020101DC

	thumb_func_start sub_020101DC
sub_020101DC: @ 0x020101DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_020115F0
	cmp r0, #0
	beq _02010234
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010228 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0201022C @ =gUnknown_030056C0
	ldr r0, [r2, #0x20]
	ldr r1, _02010230 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	b _02010318
	.align 2, 0
_02010228: .4byte 0xFFFFCFFF
_0201022C: .4byte gUnknown_030056C0
_02010230: .4byte 0xBFFFFFFF
_02010234:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, #0x14]
	cmp r0, #0
	blt _02010248
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _0201024E
_02010248:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
_0201024E:
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _02010278
	ldr r1, _02010320 @ =gUnknown_02014FB8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	adds r0, r3, r0
	strh r0, [r4, #0x14]
_02010278:
	adds r0, r4, #0
	bl sub_0200E480
	adds r0, r4, #0
	bl sub_0200E410
	ldr r0, [r4, #0x20]
	movs r5, #2
	ands r0, r5
	cmp r0, #0
	beq _02010294
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
_02010294:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r0
	str r1, [r4, #8]
	ldrh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020102AE
	adds r2, r1, #0
_020102AE:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	bl sub_0200E088
	movs r0, #0x1a
	bl m4aSongNumStartOrContinue
	ldr r0, [r4, #0x20]
	ands r0, r5
	cmp r0, #0
	beq _02010318
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0xe
	strh r0, [r1]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010324 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _02010328 @ =gUnknown_030056C0
	ldr r0, [r4, #0x20]
	ldr r1, _0201032C @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	ldr r0, _02010330 @ =sub_0200FADC
	str r0, [r4]
_02010318:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010320: .4byte gUnknown_02014FB8
_02010324: .4byte 0xFFFFCFFF
_02010328: .4byte gUnknown_030056C0
_0201032C: .4byte 0xBFFFFFFF
_02010330: .4byte sub_0200FADC

	thumb_func_start sub_02010334
sub_02010334: @ 0x02010334
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	ldr r1, _020103CC @ =0xCEF118CF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	subs r1, #5
	ands r0, r1
	subs r1, #0xfe
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r3, r5, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _020103D0 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r5, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r4, _020103D4 @ =gUnknown_030056C0
	ldr r0, [r4, #0x20]
	ldr r1, _020103D8 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	ldr r1, _020103DC @ =sub_0200F330
	str r1, [r4]
	adds r0, r5, #0
	bl sub_02014CCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020103CC: .4byte 0xCEF118CF
_020103D0: .4byte 0xFFFFCFFF
_020103D4: .4byte gUnknown_030056C0
_020103D8: .4byte 0xBFFFFFFF
_020103DC: .4byte sub_0200F330

	thumb_func_start sub_020103E0
sub_020103E0: @ 0x020103E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _020104A4 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	subs r1, #5
	ands r0, r1
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
	strh r0, [r1]
	ldr r0, _020104A8 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r3, r4, #0
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _020104AC @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	adds r2, r4, #0
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x38
	movs r6, #1
	strb r6, [r0]
	ldr r5, _020104B0 @ =gUnknown_030056C0
	ldr r0, [r5, #0x20]
	ldr r1, _020104B4 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0201047E
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_0201047E:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0201048C
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
_0201048C:
	movs r0, #0xe
	bl m4aSongNumStart
	ldr r1, _020104B8 @ =sub_02010984
	str r1, [r5]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020104A4: .4byte 0xCEF118CF
_020104A8: .4byte 0x0000FB20
_020104AC: .4byte 0xFFFFCFFF
_020104B0: .4byte gUnknown_030056C0
_020104B4: .4byte 0xBFFFFFFF
_020104B8: .4byte sub_02010984

	thumb_func_start sub_020104BC
sub_020104BC: @ 0x020104BC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _02010528
	movs r6, #4
	ands r1, r6
	cmp r1, #0
	beq _02010520
	adds r0, r5, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _02010514 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r5, #0
	adds r0, #0x64
	movs r4, #0
	strh r6, [r0]
	adds r0, r5, #0
	movs r1, #9
	bl sub_0200E690
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	orrs r0, r6
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r0, #0x99
	strb r4, [r0]
	ldr r0, _02010518 @ =gUnknown_030056C0
	ldr r1, _0201051C @ =sub_0200F7EC
	str r1, [r0]
	adds r0, r5, #0
	bl sub_02014CCC
	b _02010540
	.align 2, 0
_02010514: .4byte 0xFFFFBFFF
_02010518: .4byte gUnknown_030056C0
_0201051C: .4byte sub_0200F7EC
_02010520:
	adds r0, r5, #0
	bl sub_0200F2BC
	b _02010540
_02010528:
	movs r0, #0x80
	lsls r0, r0, #0xb
	orrs r1, r0
	ldr r0, _02010548 @ =0xFEFFFFDF
	ands r1, r0
	str r1, [r5, #0x20]
	ldr r0, _0201054C @ =gUnknown_030056C0
	ldr r1, _02010550 @ =sub_02010554
	str r1, [r0]
	adds r0, r5, #0
	bl sub_02014CCC
_02010540:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010548: .4byte 0xFEFFFFDF
_0201054C: .4byte gUnknown_030056C0
_02010550: .4byte sub_02010554

	thumb_func_start sub_02010554
sub_02010554: @ 0x02010554
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _0201058E
	adds r2, r1, #0
_0201058E:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _020105B0
	adds r1, #2
	cmp r1, #0
	ble _020105BC
	b _020105BA
_020105B0:
	cmp r1, #0
	ble _020105BC
	subs r1, #2
	cmp r1, #0
	bge _020105BC
_020105BA:
	movs r1, #0
_020105BC:
	strb r1, [r5]
	adds r0, r4, #0
	bl sub_0200DBE0
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _020105DC
	ldr r1, _020105E4 @ =gUnknown_030056C0
	ldr r0, _020105E8 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_020105DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_020105E4: .4byte gUnknown_030056C0
_020105E8: .4byte sub_0200F2BC

	thumb_func_start sub_020105EC
sub_020105EC: @ 0x020105EC
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	movs r0, #0x78
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02010606
	rsbs r1, r1, #0
_02010606:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	bgt _02010644
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0xa0
	bgt _02010634
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	bge _02010624
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010636
_02010624:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010634
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010636
_02010634:
	ldr r0, _02010640 @ =0x0000FE80
_02010636:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x14
	b _0201065C
	.align 2, 0
_02010640: .4byte 0x0000FE80
_02010644:
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _02010652
	movs r0, #0xc0
	lsls r0, r0, #1
	b _02010654
_02010652:
	ldr r0, _020106B4 @ =0x0000FE80
_02010654:
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x15
_0201065C:
	strh r0, [r1]
	movs r2, #0
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	ldr r1, _020106B8 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #0xe
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _020106BC @ =0xFFFFFDF3
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	ldr r0, _020106C0 @ =gUnknown_030056C0
	ldr r1, _020106C4 @ =sub_020106C8
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020106B4: .4byte 0x0000FE80
_020106B8: .4byte 0xCEF118CF
_020106BC: .4byte 0xFFFFFDF3
_020106C0: .4byte gUnknown_030056C0
_020106C4: .4byte sub_020106C8

	thumb_func_start sub_020106C8
sub_020106C8: @ 0x020106C8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020106F0
	adds r2, r1, #0
_020106F0:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	ldrh r1, [r4, #0x12]
	movs r2, #0
	movs r3, #0x10
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bne _0201070C
	cmp r1, #0
	beq _02010718
_0201070C:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x18
_02010718:
	adds r0, r2, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010750
	cmp r0, #1
	bgt _02010736
	cmp r0, #0
	beq _02010740
	b _0201075E
_02010736:
	cmp r0, #2
	beq _02010748
	cmp r0, #3
	beq _02010758
	b _0201075E
_02010740:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _0201075E
_02010748:
	adds r0, r4, #0
	bl sub_0200D918
	b _0201075E
_02010750:
	adds r0, r4, #0
	bl sub_0200DA10
	b _0201075E
_02010758:
	adds r0, r4, #0
	bl sub_0200DAC8
_0201075E:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _0201077A
	ldr r1, _02010780 @ =gUnknown_030056C0
	ldr r0, _02010784 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
_0201077A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02010780: .4byte gUnknown_030056C0
_02010784: .4byte sub_0200F2BC

	thumb_func_start sub_02010788
sub_02010788: @ 0x02010788
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	lsrs r6, r0, #4
	movs r5, #3
	ands r5, r0
	ldr r0, [r4, #0x20]
	ldr r1, _020107D4 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, r6, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _020107DC
	ldr r1, [r4, #0x20]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _020107DC
	ldr r0, _020107D8 @ =0xFFFFFEFD
	ands r1, r0
	str r1, [r4, #0x20]
	b _020107E6
	.align 2, 0
_020107D4: .4byte 0xCEF118CF
_020107D8: .4byte 0xFFFFFEFD
_020107DC:
	ldr r0, [r4, #0x20]
	movs r1, #0x81
	lsls r1, r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_020107E6:
	ldr r0, [r4, #0x20]
	ldr r1, _02010818 @ =0xFEFFFFDF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02010808
	rsbs r1, r1, #0
_02010808:
	ldr r0, _0201081C @ =0x0000027F
	cmp r1, r0
	bgt _02010820
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x26
	b _02010826
	.align 2, 0
_02010818: .4byte 0xFEFFFFDF
_0201081C: .4byte 0x0000027F
_02010820:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x27
_02010826:
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x66
	ldr r0, _02010840 @ =0x0000FFFF
	strh r0, [r1]
	cmp r6, #7
	bls _02010836
	b _0201093A
_02010836:
	lsls r0, r6, #2
	ldr r1, _02010844 @ =_02010848
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010840: .4byte 0x0000FFFF
_02010844: .4byte _02010848
_02010848: @ jump table
	.4byte _02010868 @ case 0
	.4byte _02010878 @ case 1
	.4byte _02010884 @ case 2
	.4byte _020108B0 @ case 3
	.4byte _020108DC @ case 4
	.4byte _020108FC @ case 5
	.4byte _02010918 @ case 6
	.4byte _02010928 @ case 7
_02010868:
	ldr r0, _02010874 @ =gUnknown_02015E56
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_02010874: .4byte gUnknown_02015E56
_02010878:
	ldr r0, _02010880 @ =gUnknown_02015E56
	lsls r1, r5, #1
	b _02010934
	.align 2, 0
_02010880: .4byte gUnknown_02015E56
_02010884:
	ldr r1, _020108A8 @ =gUnknown_02015E5E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r2, r0, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0201093A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r1, _020108AC @ =0xFFFFF700
	cmp r0, r1
	bge _0201093A
	b _020108CE
	.align 2, 0
_020108A8: .4byte gUnknown_02015E5E
_020108AC: .4byte 0xFFFFF700
_020108B0:
	ldr r1, _020108D8 @ =gUnknown_02015E5E
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0201093A
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x14
	cmp r1, r0
	ble _0201093A
_020108CE:
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #1
	strb r0, [r1]
	b _0201093A
	.align 2, 0
_020108D8: .4byte gUnknown_02015E5E
_020108DC:
	ldr r0, _020108F4 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _020108F8 @ =gUnknown_02015E56
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_020108F4: .4byte gUnknown_02015E5E
_020108F8: .4byte gUnknown_02015E56
_020108FC:
	ldr r0, _02010910 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	ldr r0, _02010914 @ =gUnknown_02015E56
	adds r1, r1, r0
	ldrh r0, [r1]
	rsbs r0, r0, #0
	b _02010938
	.align 2, 0
_02010910: .4byte gUnknown_02015E5E
_02010914: .4byte gUnknown_02015E56
_02010918:
	ldr r0, _02010924 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	rsbs r0, r0, #0
	b _02010930
	.align 2, 0
_02010924: .4byte gUnknown_02015E5E
_02010928:
	ldr r0, _02010970 @ =gUnknown_02015E5E
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
_02010930:
	strh r0, [r4, #0x10]
	ldr r0, _02010974 @ =gUnknown_02015E56
_02010934:
	adds r1, r1, r0
	ldrh r0, [r1]
_02010938:
	strh r0, [r4, #0x12]
_0201093A:
	movs r0, #0x10
	ldrsh r2, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	ble _02010950
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_02010950:
	ldr r0, _02010978 @ =0xFFFFFEC0
	cmp r2, r0
	bge _0201095E
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_0201095E:
	ldr r0, _0201097C @ =gUnknown_030056C0
	ldr r1, _02010980 @ =sub_02010984
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010970: .4byte gUnknown_02015E5E
_02010974: .4byte gUnknown_02015E56
_02010978: .4byte 0xFFFFFEC0
_0201097C: .4byte gUnknown_030056C0
_02010980: .4byte sub_02010984

	thumb_func_start sub_02010984
sub_02010984: @ 0x02010984
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_0200ECF8
	adds r0, r4, #0
	bl sub_0200E558
	adds r0, r4, #0
	bl sub_0200E610
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r1, #0x10
	ldrsh r2, [r4, r1]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _020109BE
	adds r2, r1, #0
_020109BE:
	strh r2, [r4, #0x12]
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _020109E0
	adds r1, #2
	cmp r1, #0
	ble _020109EC
	b _020109EA
_020109E0:
	cmp r1, #0
	ble _020109EC
	subs r1, #2
	cmp r1, #0
	bge _020109EC
_020109EA:
	movs r1, #0
_020109EC:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _02010A00
	cmp r2, #0
	beq _02010A0C
_02010A00:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_02010A0C:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010A44
	cmp r0, #1
	bgt _02010A2A
	cmp r0, #0
	beq _02010A34
	b _02010A52
_02010A2A:
	cmp r0, #2
	beq _02010A3C
	cmp r0, #3
	beq _02010A4C
	b _02010A52
_02010A34:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _02010A52
_02010A3C:
	adds r0, r4, #0
	bl sub_0200D918
	b _02010A52
_02010A44:
	adds r0, r4, #0
	bl sub_0200DA10
	b _02010A52
_02010A4C:
	adds r0, r4, #0
	bl sub_0200DAC8
_02010A52:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010A6A
	ldr r1, _02010A70 @ =gUnknown_030056C0
	ldr r0, _02010A74 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_02010A6A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010A70: .4byte gUnknown_030056C0
_02010A74: .4byte sub_0200F2BC

	thumb_func_start sub_02010A78
sub_02010A78: @ 0x02010A78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r1, _02010B04 @ =0xCEF118CF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r4, #0x20]
	movs r1, #2
	orrs r0, r1
	ldr r1, _02010B08 @ =0xFEFFFFD7
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x28
	strh r0, [r1]
	adds r1, #2
	ldr r0, _02010B0C @ =0x0000FFFF
	strh r0, [r1]
	movs r0, #0x10
	ldrsh r1, [r4, r0]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _02010ADC
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
_02010ADC:
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldr r0, _02010B10 @ =0xFFFFFEC0
	cmp r1, r0
	bge _02010AEE
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
_02010AEE:
	adds r0, r4, #0
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r0, #5
	bls _02010AFA
	b _02010C0C
_02010AFA:
	lsls r0, r0, #2
	ldr r1, _02010B14 @ =_02010B18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_02010B04: .4byte 0xCEF118CF
_02010B08: .4byte 0xFEFFFFD7
_02010B0C: .4byte 0x0000FFFF
_02010B10: .4byte 0xFFFFFEC0
_02010B14: .4byte _02010B18
_02010B18: @ jump table
	.4byte _02010B30 @ case 0
	.4byte _02010B6C @ case 1
	.4byte _02010B6C @ case 2
	.4byte _02010BA8 @ case 3
	.4byte _02010BD4 @ case 4
	.4byte _02010BD4 @ case 5
_02010B30:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010B3E
	adds r0, #7
_02010B3E:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010B4A
	rsbs r0, r0, #0
_02010B4A:
	rsbs r0, r0, #0
	movs r1, #6
	bl sub_02014D04
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010B68 @ =0xFFFFFC40
	b _02010C08
	.align 2, 0
_02010B68: .4byte 0xFFFFFC40
_02010B6C:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010B7A
	adds r0, #7
_02010B7A:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010B86
	rsbs r0, r0, #0
_02010B86:
	rsbs r0, r0, #0
	movs r1, #6
	bl sub_02014D04
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010BA4 @ =0xFFFFF880
	b _02010C08
	.align 2, 0
_02010BA4: .4byte 0xFFFFF880
_02010BA8:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010BB6
	adds r0, #7
_02010BB6:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010BC2
	rsbs r0, r0, #0
_02010BC2:
	rsbs r0, r0, #0
	movs r1, #6
	bl sub_02014D04
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #3
	b _02010BFE
_02010BD4:
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r0, #0
	bge _02010BE2
	adds r0, #7
_02010BE2:
	lsls r0, r0, #0xd
	lsrs r5, r0, #0x10
	adds r0, r1, #0
	cmp r0, #0
	bge _02010BEE
	rsbs r0, r0, #0
_02010BEE:
	rsbs r0, r0, #0
	movs r1, #6
	bl sub_02014D04
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #4
_02010BFE:
	adds r1, r1, r2
	strh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, _02010C34 @ =0xFFFFFD80
_02010C08:
	adds r0, r0, r1
	strh r0, [r4, #0x12]
_02010C0C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010C1C
	ldrh r0, [r4, #0x10]
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_02010C1C:
	movs r0, #0x19
	bl m4aSongNumStart
	ldr r0, _02010C38 @ =gUnknown_030056C0
	ldr r1, _02010C3C @ =sub_02010C40
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02010C34: .4byte 0xFFFFFD80
_02010C38: .4byte gUnknown_030056C0
_02010C3C: .4byte sub_02010C40

	thumb_func_start sub_02010C40
sub_02010C40: @ 0x02010C40
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x28
	bne _02010C64
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	cmp r0, #0
	bne _02010C64
	movs r2, #0x12
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _02010C64
	movs r0, #1
	strh r0, [r1]
_02010C64:
	adds r0, r4, #0
	bl sub_0200E650
	adds r0, r4, #0
	bl sub_0200E480
	ldrh r0, [r4, #0x12]
	adds r0, #0x2a
	strh r0, [r4, #0x12]
	movs r6, #0x10
	ldrsh r2, [r4, r6]
	ldr r1, [r4, #8]
	adds r1, r1, r2
	str r1, [r4, #8]
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _02010C90
	adds r2, r1, #0
_02010C90:
	strh r2, [r4, #0x12]
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	str r1, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _02010CB2
	adds r1, #2
	cmp r1, #0
	ble _02010CBE
	b _02010CBC
_02010CB2:
	cmp r1, #0
	ble _02010CBE
	subs r1, #2
	cmp r1, #0
	bge _02010CBE
_02010CBC:
	movs r1, #0
_02010CBE:
	strb r1, [r5]
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r6, #0x10
	ldrsh r0, [r4, r6]
	cmp r0, #0
	bne _02010CD2
	cmp r2, #0
	beq _02010CDE
_02010CD2:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_02010CDE:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02010D16
	cmp r0, #1
	bgt _02010CFC
	cmp r0, #0
	beq _02010D06
	b _02010D24
_02010CFC:
	cmp r0, #2
	beq _02010D0E
	cmp r0, #3
	beq _02010D1E
	b _02010D24
_02010D06:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _02010D24
_02010D0E:
	adds r0, r4, #0
	bl sub_0200D918
	b _02010D24
_02010D16:
	adds r0, r4, #0
	bl sub_0200DA10
	b _02010D24
_02010D1E:
	adds r0, r4, #0
	bl sub_0200DAC8
_02010D24:
	ldr r0, [r4, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _02010D3C
	ldr r1, _02010D44 @ =gUnknown_030056C0
	ldr r0, _02010D48 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r4, #0x10]
	movs r1, #0
	strh r0, [r4, #0x14]
	strb r1, [r5]
_02010D3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_02010D44: .4byte gUnknown_030056C0
_02010D48: .4byte sub_0200F2BC

	thumb_func_start sub_02010D4C
sub_02010D4C: @ 0x02010D4C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r2, r5, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #2
	bne _02010DC8
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _02010DB4 @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02010DC8
	ldr r4, _02010DB8 @ =gUnknown_030056C0
	ldr r0, _02010DBC @ =sub_020118F8
	str r0, [r4]
	movs r0, #3
	strh r0, [r2]
	ldr r0, [r5, #0x20]
	ldr r1, _02010DC0 @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #9
	bl sub_0200E690
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	strh r6, [r5, #0x26]
	strh r6, [r5, #0x10]
	strh r6, [r5, #0x12]
	strh r6, [r5, #0x14]
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r1, _02010DC4 @ =sub_0200FD90
	str r1, [r4]
	adds r0, r5, #0
	bl sub_02014CCC
	movs r0, #1
	b _02010DCA
	.align 2, 0
_02010DB4: .4byte gUnknown_030057C8
_02010DB8: .4byte gUnknown_030056C0
_02010DBC: .4byte sub_020118F8
_02010DC0: .4byte 0x00000404
_02010DC4: .4byte sub_0200FD90
_02010DC8:
	movs r0, #0
_02010DCA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_02010DD0
sub_02010DD0: @ 0x02010DD0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0xff
	ldr r5, [r4, #0x48]
	ldr r7, [r4, #0x4c]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _02010DE4
	b _02010F80
_02010DE4:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _02010DF4
	b _02010F80
_02010DF4:
	ldrh r3, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov ip, r3
	cmp r1, #0
	ble _02010E8A
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _02010E36
	adds r0, r1, #0
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bge _02010E20
	adds r0, r3, r5
	strh r0, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, r1
	ble _02010E2A
	strh r1, [r4, #0x14]
	b _02010E2A
_02010E20:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_02010E2A:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _02010FBA
_02010E36:
	ldr r0, _02010E54 @ =0x000001FF
	cmp r1, r0
	ble _02010E6C
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r0, r2, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #1
	bhi _02010E58
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _02010E66
	.align 2, 0
_02010E54: .4byte 0x000001FF
_02010E58:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _02010E66
	movs r6, #8
_02010E66:
	mov r1, ip
	subs r0, r1, r7
	b _02010EFA
_02010E6C:
	subs r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, #0
	bgt _02010E7C
	b _02010FBE
_02010E7C:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010E88
	b _02010FBE
_02010E88:
	b _02010F1C
_02010E8A:
	cmp r1, #0
	bge _02010F3C
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _02010EC6
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r4, #0x44]
	rsbs r2, r0, #0
	cmp r1, r2
	ble _02010EB2
	subs r0, r3, r5
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _02010EBC
	strh r2, [r4, #0x14]
	b _02010EBC
_02010EB2:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_02010EBC:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _02010FBA
_02010EC6:
	ldr r0, _02010EE4 @ =0xFFFFFE00
	cmp r1, r0
	bgt _02010F04
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r2, [r1]
	subs r0, r2, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r5, r1, #0
	cmp r0, #1
	bhi _02010EE8
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	b _02010EF6
	.align 2, 0
_02010EE4: .4byte 0xFFFFFE00
_02010EE8:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _02010EF6
	movs r6, #8
_02010EF6:
	mov r2, ip
	adds r0, r2, r7
_02010EFA:
	strh r0, [r4, #0x14]
	movs r0, #0xd
	bl m4aSongNumStart
	b _02010FBE
_02010F04:
	adds r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x64
	cmp r0, #0
	bge _02010FBE
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _02010FBE
_02010F1C:
	ldrh r0, [r5]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02010F2A
	movs r6, #7
_02010F2A:
	ldr r1, _02010F34 @ =gUnknown_030056C0
	ldr r0, _02010F38 @ =sub_020119F4
	str r0, [r1]
	b _02010FBE
	.align 2, 0
_02010F34: .4byte gUnknown_030056C0
_02010F38: .4byte sub_020119F4
_02010F3C:
	ldr r1, [r4, #0x20]
	movs r0, #1
	ands r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	cmp r1, r0
	beq _02010F6E
	cmp r1, #0
	beq _02010F56
	subs r0, r3, r5
	b _02010F58
_02010F56:
	adds r0, r3, r5
_02010F58:
	strh r0, [r4, #0x14]
	movs r6, #9
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _02010FBA
_02010F6E:
	ldr r1, _02010F78 @ =gUnknown_030056C0
	ldr r0, _02010F7C @ =sub_020119F4
	str r0, [r1]
	b _02010FBA
	.align 2, 0
_02010F78: .4byte gUnknown_030056C0
_02010F7C: .4byte sub_020119F4
_02010F80:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _02010F9E
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bgt _02010F98
	movs r1, #0
	movs r6, #0
	b _02010F9A
_02010F98:
	movs r6, #9
_02010F9A:
	strh r1, [r4, #0x14]
	b _02010FBA
_02010F9E:
	cmp r0, #0
	bge _02010FB8
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	blt _02010FB2
	movs r1, #0
	movs r6, #0
	b _02010FB4
_02010FB2:
	movs r6, #9
_02010FB4:
	strh r1, [r4, #0x14]
	b _02010FBA
_02010FB8:
	movs r6, #0
_02010FBA:
	adds r5, r4, #0
	adds r5, #0x64
_02010FBE:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _02010FD6
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r1
	beq _02010FE6
	strh r1, [r5]
	b _02010FE6
_02010FD6:
	ldrh r0, [r5]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02010FE6
	movs r0, #9
	strh r0, [r5]
_02010FE6:
	adds r0, r4, #0
	bl sub_0200E2D8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02010FF4
sub_02010FF4: @ 0x02010FF4
	push {lr}
	adds r1, r0, #0
	ldr r0, _02011008 @ =gUnknown_030053B0
	ldrh r0, [r0]
	cmp r0, #0x95
	bls _0201100C
	adds r1, #0x52
	movs r0, #4
	b _0201102E
	.align 2, 0
_02011008: .4byte gUnknown_030053B0
_0201100C:
	cmp r0, #0x63
	bls _02011016
	adds r1, #0x52
	movs r0, #3
	b _0201102E
_02011016:
	cmp r0, #0x31
	bls _02011020
	adds r1, #0x52
	movs r0, #2
	b _0201102E
_02011020:
	cmp r0, #0xa
	bls _0201102A
	adds r1, #0x52
	movs r0, #1
	b _0201102E
_0201102A:
	adds r1, #0x52
	movs r0, #0
_0201102E:
	strh r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_02011034
sub_02011034: @ 0x02011034
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x5a
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	cmp r2, #0
	beq _02011084
	ldr r4, [r3, #0x20]
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	bne _020110DA
	ldr r0, _0201107C @ =gUnknown_02015E32
	adds r1, r3, #0
	adds r1, #0x52
	ldrh r1, [r1]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x58
	strh r0, [r1]
	movs r0, #0x14
	ldrsh r2, [r3, r0]
	cmp r2, #0
	bge _0201106C
	rsbs r2, r2, #0
_0201106C:
	ldr r0, _02011080 @ =0x0000047F
	cmp r2, r0
	bgt _020110DA
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	strh r4, [r1]
	b _020110DA
	.align 2, 0
_0201107C: .4byte gUnknown_02015E32
_02011080: .4byte 0x0000047F
_02011084:
	ldr r0, [r3, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020110D4
	movs r0, #0x14
	ldrsh r1, [r3, r0]
	cmp r1, #0
	bge _02011098
	rsbs r1, r1, #0
_02011098:
	ldr r0, [r3, #0x44]
	cmp r1, r0
	blt _020110D4
	adds r2, r3, #0
	adds r2, #0x58
	ldr r1, _020110CC @ =gUnknown_02015E32
	adds r0, r3, #0
	adds r0, #0x52
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _020110DA
	movs r0, #1
	mov r3, ip
	strb r0, [r3]
	ldr r1, _020110D0 @ =gUnknown_03005650
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [r1, #8]
	b _020110DA
	.align 2, 0
_020110CC: .4byte gUnknown_02015E32
_020110D0: .4byte gUnknown_03005650
_020110D4:
	adds r0, r3, #0
	adds r0, #0x58
	strh r2, [r0]
_020110DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_020110E0
sub_020110E0: @ 0x020110E0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x14
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _020110EE
	rsbs r2, r2, #0
_020110EE:
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r2, r0
	bgt _020110FC
	adds r1, #0x54
	movs r0, #0
	b _02011138
_020110FC:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r2, r0
	bgt _0201110A
	adds r1, #0x54
	movs r0, #1
	b _02011138
_0201110A:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _02011118
	adds r1, #0x54
	movs r0, #2
	b _02011138
_02011118:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r2, r0
	bgt _02011126
	adds r1, #0x54
	movs r0, #3
	b _02011138
_02011126:
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r2, r0
	bgt _02011134
	adds r1, #0x54
	movs r0, #4
	b _02011138
_02011134:
	adds r1, #0x54
	movs r0, #5
_02011138:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011140
sub_02011140: @ 0x02011140
	push {lr}
	bl sub_02011704
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201114C
sub_0201114C: @ 0x0201114C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r2, #0
	adds r0, r5, #0
	adds r0, #0x60
	movs r6, #0
	ldrsb r6, [r0, r6]
	ldr r0, _020111B0 @ =sub_0200E8B0
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _020111B4 @ =sub_020116D4
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl sub_0200198C
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r4, #0
	strb r6, [r0]
	str r4, [r0, #4]
	adds r0, r5, #0
	bl sub_0200D384
	ldr r1, _020111B8 @ =gUnknown_030056C0
	ldr r0, _020111BC @ =sub_0200F2BC
	str r0, [r1]
	bl sub_02011B44
	ldr r0, _020111C0 @ =gUnknown_03005448
	str r4, [r0]
	ldr r0, _020111C4 @ =gUnknown_03005474
	str r4, [r0]
	ldr r0, _020111C8 @ =gUnknown_03005458
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_0200D2D8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020111B0: .4byte sub_0200E8B0
_020111B4: .4byte sub_020116D4
_020111B8: .4byte gUnknown_030056C0
_020111BC: .4byte sub_0200F2BC
_020111C0: .4byte gUnknown_03005448
_020111C4: .4byte gUnknown_03005474
_020111C8: .4byte gUnknown_03005458

	thumb_func_start sub_020111CC
sub_020111CC: @ 0x020111CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x8c
	ldr r0, [r5]
	bl sub_02001A38
	movs r0, #0
	str r0, [r5]
	adds r4, #0x60
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _020111EC
	bl sub_02012248
_020111EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_020111F4
sub_020111F4: @ 0x020111F4
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	ldr r1, _02011218 @ =0xCEF118CF
	ands r0, r1
	str r0, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x61
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_02011218: .4byte 0xCEF118CF

	thumb_func_start sub_0201121C
sub_0201121C: @ 0x0201121C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x12]
	adds r1, r2, #0
	movs r3, #0
	movs r5, #0x10
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bne _02011232
	cmp r2, #0
	beq _0201123E
_02011232:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_02014CAC
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x18
_0201123E:
	adds r0, r3, #0
	subs r0, #0x20
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _02011276
	cmp r0, #1
	bgt _0201125C
	cmp r0, #0
	beq _02011266
	b _02011284
_0201125C:
	cmp r0, #2
	beq _0201126E
	cmp r0, #3
	beq _0201127E
	b _02011284
_02011266:
	adds r0, r4, #0
	bl sub_0200D7DC
	b _02011284
_0201126E:
	adds r0, r4, #0
	bl sub_0200D918
	b _02011284
_02011276:
	adds r0, r4, #0
	bl sub_0200DA10
	b _02011284
_0201127E:
	adds r0, r4, #0
	bl sub_0200DAC8
_02011284:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201128C
sub_0201128C: @ 0x0201128C
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _02011298
	mov r4, sp
_02011298:
	cmp r2, #0
	bne _0201129E
	add r2, sp, #4
_0201129E:
	adds r1, r4, #0
	bl sub_0200D4EC
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _020112B4
	movs r0, #0
	b _020112C6
_020112B4:
	ldr r0, _020112D4 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020112C8
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_020112C6:
	strb r0, [r4]
_020112C8:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020112D4: .4byte gUnknown_030053D4

	thumb_func_start sub_020112D8
sub_020112D8: @ 0x020112D8
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _020112E4
	mov r4, sp
_020112E4:
	cmp r2, #0
	bne _020112EA
	add r2, sp, #4
_020112EA:
	adds r1, r4, #0
	bl sub_0200D5C4
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _02011300
	movs r0, #0
	b _02011312
_02011300:
	ldr r0, _02011320 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02011314
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_02011312:
	strb r0, [r4]
_02011314:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_02011320: .4byte gUnknown_030053D4

	thumb_func_start sub_02011324
sub_02011324: @ 0x02011324
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _02011330
	mov r4, sp
_02011330:
	cmp r2, #0
	bne _02011336
	add r2, sp, #4
_02011336:
	adds r1, r4, #0
	bl sub_0200D698
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0201134C
	movs r0, #0
	b _0201135E
_0201134C:
	ldr r0, _0201136C @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _02011360
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_0201135E:
	strb r0, [r4]
_02011360:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0201136C: .4byte gUnknown_030053D4

	thumb_func_start sub_02011370
sub_02011370: @ 0x02011370
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	cmp r4, #0
	bne _0201137C
	mov r4, sp
_0201137C:
	cmp r2, #0
	bne _02011382
	add r2, sp, #4
_02011382:
	adds r1, r4, #0
	bl sub_020113D4
	adds r3, r0, #0
	ldrb r2, [r4]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _02011398
	movs r0, #0
	b _020113AA
_02011398:
	ldr r0, _020113B8 @ =gUnknown_030053D4
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _020113AC
	movs r0, #0x80
	rsbs r0, r0, #0
	subs r0, r0, r2
_020113AA:
	strb r0, [r4]
_020113AC:
	adds r0, r3, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_020113B8: .4byte gUnknown_030053D4

	thumb_func_start sub_020113BC
sub_020113BC: @ 0x020113BC
	push {lr}
	bl sub_02011324
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020113C8
sub_020113C8: @ 0x020113C8
	push {lr}
	bl sub_02011370
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020113D4
sub_020113D4: @ 0x020113D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r6, #0
	bne _020113EC
	add r6, sp, #8
_020113EC:
	cmp r7, #0
	bne _020113F2
	add r7, sp, #0xc
_020113F2:
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r3, r0, r1
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	subs r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	subs r1, r0, r1
	movs r0, #0x38
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	movs r5, #0x12
	ldrsh r0, [r4, r5]
	cmp r0, #0
	bge _0201141C
	movs r0, #0x80
	orrs r2, r0
_0201141C:
	movs r0, #9
	add r0, sp
	mov sb, r0
	str r0, [sp]
	ldr r5, _02011480 @ =sub_0200CFE0
	mov sl, r5
	str r5, [sp, #4]
	adds r0, r3, #0
	movs r3, #8
	bl sub_0200C660
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov ip, r0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	adds r0, #2
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	adds r1, r0, r1
	mov r0, r8
	ldrb r2, [r0]
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _0201145C
	movs r0, #0x80
	orrs r2, r0
_0201145C:
	mov r4, sp
	adds r4, #0xa
	str r4, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, ip
	movs r3, #8
	bl sub_0200C660
	adds r1, r0, #0
	cmp r5, r1
	bge _02011484
	adds r2, r5, #0
	mov r3, sb
	ldrb r0, [r3]
	strb r0, [r6]
	str r1, [r7]
	b _0201148C
	.align 2, 0
_02011480: .4byte sub_0200CFE0
_02011484:
	adds r2, r1, #0
	ldrb r0, [r4]
	strb r0, [r6]
	str r5, [r7]
_0201148C:
	adds r0, r2, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020114A0
sub_020114A0: @ 0x020114A0
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _020114D4
	ldr r1, _020114DC @ =gUnknown_02014FB8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r2, r0, #5
	ldrh r1, [r3, #0x14]
	movs r4, #0x14
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _020114D4
	adds r0, r1, r2
	strh r0, [r3, #0x14]
_020114D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020114DC: .4byte gUnknown_02014FB8

	thumb_func_start sub_020114E0
sub_020114E0: @ 0x020114E0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x24
	ldrb r2, [r0]
	adds r0, r2, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _0201150C
	ldr r1, _02011510 @ =gUnknown_02014FB8
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #2
	adds r0, r0, r1
	asrs r0, r0, #5
	ldrh r1, [r3, #0x14]
	adds r0, r0, r1
	strh r0, [r3, #0x14]
_0201150C:
	pop {r0}
	bx r0
	.align 2, 0
_02011510: .4byte gUnknown_02014FB8

	thumb_func_start sub_02011514
sub_02011514: @ 0x02011514
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	ldrsh r2, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	movs r1, #0xff
	ands r0, r1
	cmp r0, #0xbf
	bgt _0201155E
	cmp r2, #0
	beq _0201155E
	ldr r1, _02011550 @ =gUnknown_02014FB8
	lsls r0, r3, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r1, r0, #8
	cmp r2, #0
	ble _02011554
	cmp r1, #0
	bgt _0201155A
	b _02011558
	.align 2, 0
_02011550: .4byte gUnknown_02014FB8
_02011554:
	cmp r1, #0
	blt _0201155A
_02011558:
	asrs r1, r0, #0xa
_0201155A:
	adds r2, r2, r1
	strh r2, [r4, #0x14]
_0201155E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_02011564
sub_02011564: @ 0x02011564
	push {lr}
	adds r2, r0, #0
	movs r1, #0x10
	ldrsh r0, [r2, r1]
	ldr r1, [r2, #8]
	adds r1, r1, r0
	str r1, [r2, #8]
	ldrh r3, [r2, #0x12]
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _02011582
	adds r3, r1, #0
_02011582:
	strh r3, [r2, #0x12]
	movs r0, #0x12
	ldrsh r1, [r2, r0]
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011594
sub_02011594: @ 0x02011594
	ldrh r1, [r0, #0x12]
	adds r1, #0x2a
	strh r1, [r0, #0x12]
	bx lr

	thumb_func_start sub_0201159C
sub_0201159C: @ 0x0201159C
	push {lr}
	ldr r2, _020115B8 @ =gUnknown_03005650
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _020115B2
	ldr r0, [r2, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	cmp r1, r0
	bge _020115BC
_020115B2:
	movs r0, #0
	b _020115BE
	.align 2, 0
_020115B8: .4byte gUnknown_03005650
_020115BC:
	movs r0, #1
_020115BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020115C4
sub_020115C4: @ 0x020115C4
	push {lr}
	ldr r2, _020115E0 @ =gUnknown_03005650
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	blt _020115DC
	ldr r0, [r2, #4]
	lsls r0, r0, #8
	ldr r2, _020115E4 @ =0x0000EFFF
	adds r0, r0, r2
	cmp r1, r0
	bge _020115E8
_020115DC:
	movs r0, #0
	b _020115EA
	.align 2, 0
_020115E0: .4byte gUnknown_03005650
_020115E4: .4byte 0x0000EFFF
_020115E8:
	movs r0, #1
_020115EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_020115F0
sub_020115F0: @ 0x020115F0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	ldrb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _02011624 @ =gUnknown_030057C8
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _02011630
	adds r0, r3, #0
	adds r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	bl sub_0200E108
	cmp r0, #3
	ble _02011630
	ldr r1, _02011628 @ =gUnknown_030056C0
	ldr r0, _0201162C @ =sub_0200F9B8
	str r0, [r1]
	movs r0, #1
	b _02011632
	.align 2, 0
_02011624: .4byte gUnknown_030057C8
_02011628: .4byte gUnknown_030056C0
_0201162C: .4byte sub_0200F9B8
_02011630:
	movs r0, #0
_02011632:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011638
sub_02011638: @ 0x02011638
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r3, [r2, r1]
	cmp r3, #0
	beq _0201164A
	subs r0, #1
	b _02011676
_0201164A:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _02011678
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	cmp r1, #0
	bge _02011664
	rsbs r1, r1, #0
_02011664:
	ldr r0, _0201167C @ =0x000001DF
	cmp r1, r0
	bgt _02011678
	strh r3, [r2, #0x14]
	ldr r0, [r2, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1e
_02011676:
	strh r0, [r2, #0x2a]
_02011678:
	pop {r0}
	bx r0
	.align 2, 0
_0201167C: .4byte 0x000001DF

	thumb_func_start sub_02011680
sub_02011680: @ 0x02011680
	push {lr}
	adds r2, r0, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _02011696
	adds r1, #2
	cmp r1, #0
	ble _020116A2
	b _020116A0
_02011696:
	cmp r1, #0
	ble _020116A2
	subs r1, #2
	cmp r1, #0
	bge _020116A2
_020116A0:
	movs r1, #0
_020116A2:
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
	pop {r0}
	bx r0

	thumb_func_start sub_020116AC
sub_020116AC: @ 0x020116AC
	ldr r0, _020116BC @ =gUnknown_030056C0
	ldr r1, [r0, #0x20]
	movs r2, #0x80
	lsls r2, r2, #0x17
	orrs r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020116BC: .4byte gUnknown_030056C0

	thumb_func_start sub_020116C0
sub_020116C0: @ 0x020116C0
	ldr r0, _020116CC @ =gUnknown_030056C0
	ldr r1, [r0, #0x20]
	ldr r2, _020116D0 @ =0xBFFFFFFF
	ands r1, r2
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020116CC: .4byte gUnknown_030056C0
_020116D0: .4byte 0xBFFFFFFF

	thumb_func_start sub_020116D4
sub_020116D4: @ 0x020116D4
	push {lr}
	ldr r2, _02011700 @ =gUnknown_030056C0
	adds r1, r2, #0
	adds r1, #0x8c
	movs r0, #0
	str r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _020116FA
	adds r0, r2, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl sub_0200487C
_020116FA:
	pop {r0}
	bx r0
	.align 2, 0
_02011700: .4byte gUnknown_030056C0

	thumb_func_start sub_02011704
sub_02011704: @ 0x02011704
	mov ip, r3
	mov r1, ip
	adds r1, #0x60
	movs r3, #0
	strb r2, [r1]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _02011750 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xb4
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x74
	movs r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xb1
	strh r0, [r1]
	subs r0, #0xb2
	mov r1, ip
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	mov r0, ip
	adds r0, #0x98
	strb r2, [r0]
	str r3, [r1, #0x78]
	adds r1, #0x90
	ldr r0, _02011754 @ =gUnknown_03005780
	str r0, [r1]
	bx lr
	.align 2, 0
_02011750: .4byte 0x04000128
_02011754: .4byte gUnknown_03005780

	thumb_func_start sub_02011758
sub_02011758: @ 0x02011758
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x40
	bne _02011784
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02011784
	ldr r1, _0201177C @ =gUnknown_030056C0
	ldr r0, _02011780 @ =sub_02011A50
	str r0, [r1]
	movs r0, #1
	b _02011786
	.align 2, 0
_0201177C: .4byte gUnknown_030056C0
_02011780: .4byte sub_02011A50
_02011784:
	movs r0, #0
_02011786:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0201178C
sub_0201178C: @ 0x0201178C
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _0201180C
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	ldrh r3, [r2, #0x14]
	cmp r0, #0
	bne _020117D8
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _020117D8
	ldr r0, [r2, #0x20]
	ldr r1, _020117CC @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _020117D8
	ldr r1, _020117D0 @ =gUnknown_030056C0
	ldr r0, _020117D4 @ =sub_020118C8
	str r0, [r1]
	movs r0, #1
	b _0201180E
	.align 2, 0
_020117CC: .4byte 0x01000006
_020117D0: .4byte gUnknown_030056C0
_020117D4: .4byte sub_020118C8
_020117D8:
	adds r0, r3, #0
	adds r0, #0x7f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfe
	bls _0201180C
	ldr r0, [r2, #0x20]
	ldr r1, _02011800 @ =0x01000006
	ands r0, r1
	cmp r0, #0
	bne _0201180C
	ldr r1, _02011804 @ =gUnknown_030056C0
	ldr r0, _02011808 @ =sub_02011874
	str r0, [r1]
	movs r0, #0xb
	bl m4aSongNumStart
	movs r0, #1
	b _0201180E
	.align 2, 0
_02011800: .4byte 0x01000006
_02011804: .4byte gUnknown_030056C0
_02011808: .4byte sub_02011874
_0201180C:
	movs r0, #0
_0201180E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_02011814
sub_02011814: @ 0x02011814
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r2, [r0]
	adds r0, #8
	ldrb r0, [r0]
	cmp r0, #0
	beq _02011830
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _02011850
_02011830:
	ldr r0, [r3, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _02011846
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0xf0
	lsls r0, r0, #4
	b _02011850
_02011846:
	movs r0, #0xc0
	lsls r0, r0, #3
	str r0, [r3, #0x44]
	movs r0, #0x90
	lsls r0, r0, #4
_02011850:
	str r0, [r3, #0x40]
	ldr r1, _02011870 @ =gUnknown_02015E1E
	lsls r2, r2, #2
	adds r0, r2, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	str r0, [r3, #0x48]
	adds r1, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsh r0, [r2, r1]
	str r0, [r3, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02011870: .4byte gUnknown_02015E1E

	thumb_func_start sub_02011874
sub_02011874: @ 0x02011874
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _020118BC @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r4, #0
	adds r0, #0x64
	movs r6, #0
	movs r5, #4
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	adds r0, r4, #0
	adds r0, #0x99
	strb r6, [r0]
	ldr r0, _020118C0 @ =gUnknown_030056C0
	ldr r1, _020118C4 @ =sub_0200F7EC
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020118BC: .4byte 0xFFFFBFFF
_020118C0: .4byte gUnknown_030056C0
_020118C4: .4byte sub_0200F7EC

	thumb_func_start sub_020118C8
sub_020118C8: @ 0x020118C8
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #2
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _020118F0 @ =gUnknown_030056C0
	ldr r2, _020118F4 @ =sub_0200F684
	str r2, [r1]
	bl sub_02014CD0
	pop {r0}
	bx r0
	.align 2, 0
_020118F0: .4byte gUnknown_030056C0
_020118F4: .4byte sub_0200F684

	thumb_func_start sub_020118F8
sub_020118F8: @ 0x020118F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	movs r5, #0
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	ldr r1, _02011944 @ =0x00000404
	orrs r0, r1
	movs r1, #0x23
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	adds r0, r4, #0
	movs r1, #9
	bl sub_0200E690
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	strh r5, [r4, #0x26]
	strh r5, [r4, #0x10]
	strh r5, [r4, #0x12]
	strh r5, [r4, #0x14]
	movs r0, #0xb
	bl m4aSongNumStart
	ldr r0, _02011948 @ =gUnknown_030056C0
	ldr r1, _0201194C @ =sub_0200FD90
	str r1, [r0]
	adds r0, r4, #0
	bl sub_02014CCC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011944: .4byte 0x00000404
_02011948: .4byte gUnknown_030056C0
_0201194C: .4byte sub_0200FD90

	thumb_func_start sub_02011950
sub_02011950: @ 0x02011950
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r2, sp, #4
	mov r1, sp
	bl sub_02011370
	cmp r0, #0
	bgt _02011982
	lsls r1, r0, #8
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x24
	movs r4, #0
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_0200D770
	strh r4, [r5, #0x12]
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_02011982:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201198C
sub_0201198C: @ 0x0201198C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	bne _020119AC
	ldr r1, _020119B0 @ =gUnknown_030056C0
	ldr r0, _020119B4 @ =sub_0200F2BC
	str r0, [r1]
	ldrh r0, [r2, #0x10]
	movs r1, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x24
	strb r1, [r0]
_020119AC:
	pop {r0}
	bx r0
	.align 2, 0
_020119B0: .4byte gUnknown_030056C0
_020119B4: .4byte sub_0200F2BC

	thumb_func_start sub_020119B8
sub_020119B8: @ 0x020119B8
	push {r4, lr}
	adds r1, r0, #0
	movs r3, #0x2a
	ldrh r2, [r1, #0x12]
	movs r4, #0x12
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bge _020119CA
	movs r3, #0x15
_020119CA:
	adds r0, r2, r3
	strh r0, [r1, #0x12]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_020119D4
sub_020119D4: @ 0x020119D4
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x14
	beq _020119F0
	ldrh r2, [r1, #0x2c]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _020119F0
	subs r0, r2, #1
	strh r0, [r1, #0x2c]
_020119F0:
	pop {r0}
	bx r0

	thumb_func_start sub_020119F4
sub_020119F4: @ 0x020119F4
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x20]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3, #0x20]
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02011A16
	movs r0, #6
	b _02011A18
_02011A16:
	movs r0, #5
_02011A18:
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x90
	ldr r2, [r0]
	ldr r0, [r2, #0x1c]
	ldr r1, _02011A44 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x14]
	ldr r0, [r3, #0x20]
	movs r1, #1
	eors r0, r1
	str r0, [r3, #0x20]
	ldr r0, _02011A48 @ =gUnknown_030056C0
	ldr r1, _02011A4C @ =sub_0200F420
	str r1, [r0]
	adds r0, r3, #0
	bl sub_02014CCC
	pop {r0}
	bx r0
	.align 2, 0
_02011A44: .4byte 0xFFFFBFFF
_02011A48: .4byte gUnknown_030056C0
_02011A4C: .4byte sub_0200F420

	thumb_func_start sub_02011A50
sub_02011A50: @ 0x02011A50
	push {lr}
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
	adds r1, r0, #0
	adds r1, #0x90
	ldr r3, [r1]
	ldr r1, [r3, #0x1c]
	ldr r2, _02011A84 @ =0xFFFFBFFF
	ands r1, r2
	str r1, [r3, #0x1c]
	adds r2, r0, #0
	adds r2, #0x64
	movs r3, #0
	movs r1, #1
	strh r1, [r2]
	strh r3, [r0, #0x14]
	ldr r1, _02011A88 @ =gUnknown_030056C0
	ldr r2, _02011A8C @ =sub_0200F520
	str r2, [r1]
	bl sub_02014CD0
	pop {r0}
	bx r0
	.align 2, 0
_02011A84: .4byte 0xFFFFBFFF
_02011A88: .4byte gUnknown_030056C0
_02011A8C: .4byte sub_0200F520

	thumb_func_start sub_02011A90
sub_02011A90: @ 0x02011A90
	push {lr}
	adds r2, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _02011AEA
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0x10
	beq _02011ACC
	cmp r1, #0x20
	bne _02011AEA
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _02011AC0
	ldr r0, [r2, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0x20]
	b _02011AEA
_02011AC0:
	subs r0, #0x18
	cmp r0, #0
	bge _02011AE8
	movs r0, #0x60
	rsbs r0, r0, #0
	b _02011AE8
_02011ACC:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _02011AE0
	ldr r0, [r2, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0x20]
	b _02011AEA
_02011AE0:
	adds r0, #0x18
	cmp r0, #0
	ble _02011AE8
	movs r0, #0x60
_02011AE8:
	strh r0, [r2, #0x14]
_02011AEA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_02011AF0
sub_02011AF0: @ 0x02011AF0
	push {lr}
	mov ip, r0
	mov r3, ip
	adds r3, #0x90
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _02011B38 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r2, [r3]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
	mov r2, ip
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x38
	movs r0, #1
	strb r0, [r1]
	ldr r2, _02011B3C @ =gUnknown_030056C0
	ldr r0, [r2, #0x20]
	ldr r1, _02011B40 @ =0xBFFFFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	movs r0, #0x1a
	bl m4aSongNumStop
	pop {r0}
	bx r0
	.align 2, 0
_02011B38: .4byte 0xFFFFCFFF
_02011B3C: .4byte gUnknown_030056C0
_02011B40: .4byte 0xBFFFFFFF

	thumb_func_start sub_02011B44
sub_02011B44: @ 0x02011B44
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _02011BD8 @ =gUnknown_030057C4
	ldr r0, _02011BDC @ =sub_02012260
	movs r1, #0xae
	lsls r1, r1, #2
	ldr r2, _02011BE0 @ =0x00002001
	ldr r3, _02011BE4 @ =sub_0201226C
	str r3, [sp]
	movs r3, #0
	bl sub_0200198C
	str r0, [r4]
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	movs r5, #0
	movs r4, #0
	strh r4, [r1, #0x16]
	strh r4, [r1, #0x18]
	ldr r0, _02011BE8 @ =0x06012E40
	str r0, [r1, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r4, [r1, #8]
	movs r0, #0x6a
	strh r0, [r1, #0xa]
	ldr r2, _02011BEC @ =gUnknown_03000020
	adds r0, r3, r2
	strb r5, [r0]
	strh r4, [r1, #0x14]
	strh r4, [r1, #0x1c]
	ldr r0, _02011BF0 @ =gUnknown_03000021
	adds r2, r3, r0
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _02011BF4 @ =gUnknown_03000022
	adds r2, r3, r0
	movs r0, #0x20
	strb r0, [r2]
	ldr r2, _02011BF8 @ =gUnknown_03000025
	adds r0, r3, r2
	strb r5, [r0]
	ldr r0, _02011BFC @ =0x00042200
	str r0, [r1, #0x10]
	ldr r1, _02011C00 @ =gUnknown_030002B6
	adds r0, r3, r1
	strh r4, [r0]
	ldr r2, _02011C04 @ =gUnknown_030002B4
	adds r1, r3, r2
	movs r0, #0x94
	strh r0, [r1]
	ldr r0, _02011C08 @ =gUnknown_030002B0
	adds r1, r3, r0
	movs r0, #0x12
	str r0, [r1]
	ldr r1, _02011C0C @ =gUnknown_03000030
	adds r3, r3, r1
	add r0, sp, #4
	strh r4, [r0]
	ldr r0, _02011C10 @ =0x040000D4
	add r2, sp, #4
	str r2, [r0]
	str r3, [r0, #4]
	ldr r1, _02011C14 @ =0x81000140
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_02011BD8: .4byte gUnknown_030057C4
_02011BDC: .4byte sub_02012260
_02011BE0: .4byte 0x00002001
_02011BE4: .4byte sub_0201226C
_02011BE8: .4byte 0x06012E40
_02011BEC: .4byte gUnknown_03000020
_02011BF0: .4byte gUnknown_03000021
_02011BF4: .4byte gUnknown_03000022
_02011BF8: .4byte gUnknown_03000025
_02011BFC: .4byte 0x00042200
_02011C00: .4byte gUnknown_030002B6
_02011C04: .4byte gUnknown_030002B4
_02011C08: .4byte gUnknown_030002B0
_02011C0C: .4byte gUnknown_03000030
_02011C10: .4byte 0x040000D4
_02011C14: .4byte 0x81000140

	thumb_func_start sub_02011C18
sub_02011C18: @ 0x02011C18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r2, #0
	ldr r0, _02011C9C @ =gUnknown_030057C4
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r1, _02011CA0 @ =gUnknown_03000030
	adds r4, r0, r1
	ldr r6, _02011CA4 @ =gUnknown_030056C0
	str r6, [sp, #8]
	movs r5, #0
	movs r6, #0
	cmp r7, #0
	beq _02011D2E
	cmp r7, #0x20
	ble _02011C46
	movs r7, #0x20
_02011C46:
	ldr r0, _02011CA8 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _02011C54
	cmp r7, #0x10
	ble _02011C54
	movs r7, #0x10
_02011C54:
	movs r0, #0x10
	bl m4aSongNumStart
	movs r3, #0x91
	lsls r3, r3, #3
	movs r0, #0
	mov r8, r0
	mov ip, r0
	ldr r1, _02011CAC @ =gUnknown_02014FB8
	mov sl, r1
	ldr r0, _02011CB0 @ =gUnknown_03005398
	mov sb, r0
_02011C6C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _02011D22
	movs r0, #0xb4
	strh r0, [r4, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0xe]
	ldr r1, [sp]
	lsls r0, r1, #8
	str r0, [r4]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r4, #4]
	cmp r3, #0
	blt _02011CE4
	asrs r2, r3, #8
	cmp r2, #5
	ble _02011CB4
	rsbs r0, r2, #0
	adds r0, #9
	b _02011CB6
	.align 2, 0
_02011C9C: .4byte gUnknown_030057C4
_02011CA0: .4byte gUnknown_03000030
_02011CA4: .4byte gUnknown_030056C0
_02011CA8: .4byte gUnknown_03005444
_02011CAC: .4byte gUnknown_02014FB8
_02011CB0: .4byte gUnknown_03005398
_02011CB4:
	adds r0, r2, #0
_02011CB6:
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r3
	lsls r0, r1, #3
	add r0, sl
	movs r6, #0
	ldrsh r5, [r0, r6]
	asrs r5, r2
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	add r1, sl
	movs r0, #0
	ldrsh r6, [r1, r0]
	asrs r6, r2
	asrs r0, r5, #2
	subs r5, r5, r0
	asrs r0, r6, #2
	subs r6, r6, r0
	adds r3, #0x10
	movs r0, #0x80
	orrs r3, r0
_02011CE4:
	strh r5, [r4, #8]
	strh r6, [r4, #0xa]
	rsbs r3, r3, #0
	rsbs r5, r5, #0
	movs r1, #0
	strh r1, [r4, #0x10]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _02011D40 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02011D44 @ =0x3C6EF35F
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _02011D0E
	movs r0, #4
	strh r0, [r4, #0x10]
_02011D0E:
	movs r0, #3
	mov r1, ip
	ands r1, r0
	ldrh r0, [r4, #0x10]
	orrs r1, r0
	strh r1, [r4, #0x10]
	movs r0, #1
	add ip, r0
	cmp ip, r7
	bge _02011D2E
_02011D22:
	adds r4, #0x14
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #0x1f
	ble _02011C6C
_02011D2E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02011D40: .4byte 0x00196225
_02011D44: .4byte 0x3C6EF35F

	thumb_func_start sub_02011D48
sub_02011D48: @ 0x02011D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _02011D98 @ =gUnknown_030026D0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _02011D9C @ =gUnknown_03000030
	adds r5, r1, r0
	ldr r2, [sp, #4]
	str r2, [sp, #8]
	ldr r3, _02011DA0 @ =gUnknown_030002B0
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r4, _02011DA4 @ =gUnknown_030002B4
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r2, #0
	bl sub_020030A0
	movs r1, #0
	str r1, [sp, #0x18]
_02011D88:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _02011DA8
	adds r5, #0x14
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011D98: .4byte gUnknown_030026D0
_02011D9C: .4byte gUnknown_03000030
_02011DA0: .4byte gUnknown_030002B0
_02011DA4: .4byte gUnknown_030002B4
_02011DA8:
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, [r5]
	adds r2, r0, r1
	str r2, [r5]
	movs r4, #0xa
	ldrsh r1, [r5, r4]
	ldr r0, [r5, #4]
	adds r3, r0, r1
	str r3, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r2, r0
	movs r0, #0xf4
	lsls r0, r0, #0xb
	cmp r1, r0
	bls _02011DD6
	movs r0, #0
	strh r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	adds r1, #1
	str r1, [sp, #0x20]
	b _02012216
_02011DD6:
	ldr r0, _02011DF4 @ =0x0000EFFF
	cmp r2, r0
	bgt _02011DFC
	ldr r0, _02011DF8 @ =0x00011FFF
	cmp r3, r0
	bgt _02011DFC
	movs r4, #0xb4
	lsls r4, r4, #0xb
	adds r0, r2, r4
	str r0, [r5]
	movs r1, #0xd8
	lsls r1, r1, #0xa
	adds r0, r3, r1
	b _02011E1A
	.align 2, 0
_02011DF4: .4byte 0x0000EFFF
_02011DF8: .4byte 0x00011FFF
_02011DFC:
	ldr r2, [r5]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r2, r0
	ble _02011E1C
	ldr r1, [r5, #4]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02011E1C
	ldr r3, _02011F40 @ =0xFFFA6000
	adds r0, r2, r3
	str r0, [r5]
	ldr r4, _02011F44 @ =0xFFFCA000
	adds r0, r1, r4
_02011E1A:
	str r0, [r5, #4]
_02011E1C:
	ldr r0, [r5]
	asrs r0, r0, #8
	str r0, [sp, #0x1c]
	mov sb, r0
	ldr r0, [r5, #4]
	asrs r7, r0, #8
	ldr r1, _02011F48 @ =gUnknown_03005650
	ldr r0, [r1]
	ldr r2, [sp, #0x1c]
	subs r2, r2, r0
	mov sl, r2
	ldr r0, [r1, #4]
	subs r0, r7, r0
	mov r8, r0
	ldr r3, _02011F4C @ =gUnknown_030056C0
	mov ip, r3
	mov r0, ip
	adds r0, #0x90
	ldr r2, [r0]
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	ble _02011E58
	b _0201205E
_02011E58:
	mov r0, ip
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x14
	bne _02011E6E
	mov r4, ip
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _02011F60
_02011E6E:
	mov r3, ip
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _02011F60
	adds r4, r2, #0
	adds r4, #0x38
	ldr r2, [sp, #0x1c]
	subs r2, #8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011E9C
	ldr r0, [sp, #0x1c]
	adds r0, #8
	cmp r0, r1
	bge _02011EA8
	cmp r2, r1
	blt _02011F60
_02011E9C:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011EA8:
	adds r2, r7, #0
	subs r2, #0x10
	mov r1, ip
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _02011EC4
	cmp r7, r1
	bge _02011ED0
	cmp r2, r1
	blt _02011F60
_02011EC4:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _02011F60
_02011ED0:
	mov r2, sb
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BD0C
	ldr r1, _02011F50 @ =gUnknown_030053B0
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _02011F54 @ =gUnknown_03005524
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _02011F1C
	ldrh r0, [r1]
	movs r1, #0x64
	bl sub_02014CB8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl sub_02014CB8
	cmp r4, r0
	beq _02011F1C
	ldr r0, _02011F58 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #0
	bne _02011F1C
	ldr r1, _02011F5C @ =gUnknown_030053FC
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _02011F1C
	adds r0, #1
	strb r0, [r1]
_02011F1C:
	ldr r0, _02011F58 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02011F30
	ldr r1, _02011F50 @ =gUnknown_030053B0
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _02011F30
	movs r0, #0xff
	strh r0, [r1]
_02011F30:
	movs r0, #0
	strh r0, [r5, #0xc]
	adds r5, #0x14
	ldr r3, [sp, #0x18]
	adds r3, #1
	str r3, [sp, #0x20]
	b _02012216
	.align 2, 0
_02011F40: .4byte 0xFFFA6000
_02011F44: .4byte 0xFFFCA000
_02011F48: .4byte gUnknown_03005650
_02011F4C: .4byte gUnknown_030056C0
_02011F50: .4byte gUnknown_030053B0
_02011F54: .4byte gUnknown_03005524
_02011F58: .4byte gUnknown_03005444
_02011F5C: .4byte gUnknown_030053FC
_02011F60:
	adds r4, r5, #0
	adds r4, #0x14
	str r4, [sp, #0x24]
	ldr r0, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	cmp r6, r1
	bgt _0201205E
	movs r2, #0
	mov ip, r2
_02011F76:
	ldr r0, _02012034 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp ip, r0
	beq _02012050
	ldr r1, _02012038 @ =gRoomEventQueue
	mov r3, ip
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _02012050
	ldrh r2, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r6, r2, r4
	ldr r1, _0201203C @ =gUnknown_0300006A
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, #0x1c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02011FB6
	ldr r3, _02012040 @ =gUnknown_03000054
	adds r0, r2, r3
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _02012050
_02011FB6:
	mov r4, sb
	subs r4, #8
	ldr r1, _02012044 @ =gUnknown_03000050
	adds r0, r2, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r3, _02012048 @ =gUnknown_0300002C
	adds r0, r2, r3
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r1, r1, r3
	cmp r4, r1
	bgt _02011FDC
	mov r0, sb
	adds r0, #8
	cmp r0, r1
	bge _02011FEC
	cmp r4, r1
	blt _02012050
_02011FDC:
	ldr r0, _0201204C @ =gUnknown_0300002E
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r4
	blt _02012050
_02011FEC:
	adds r3, r7, #0
	subs r3, #0x10
	adds r0, r6, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r1, r0, r2
	cmp r3, r1
	bgt _0201200E
	cmp r7, r1
	bge _02012020
	cmp r3, r1
	blt _02012050
_0201200E:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r2
	adds r0, r1, r0
	cmp r0, r3
	blt _02012050
_02012020:
	mov r2, sb
	lsls r0, r2, #0x10
	lsls r1, r7, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl sub_0200BD0C
	movs r0, #0
	b _02012212
	.align 2, 0
_02012034: .4byte 0x04000128
_02012038: .4byte gRoomEventQueue
_0201203C: .4byte gUnknown_0300006A
_02012040: .4byte gUnknown_03000054
_02012044: .4byte gUnknown_03000050
_02012048: .4byte gUnknown_0300002C
_0201204C: .4byte gUnknown_0300002E
_02012050:
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	cmp r0, #3
	bls _02011F76
_0201205E:
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _02012098
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _02012098
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r0, _02012118 @ =sub_0200CDB8
	str r0, [sp]
	adds r0, r7, #0
	ldr r1, [sp, #0x1c]
	movs r3, #8
	bl sub_0200D27C
	cmp r0, #0
	bgt _02012098
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_02012098:
	ldr r1, [sp, #4]
	ldr r2, _0201211C @ =0x000002B6
	adds r0, r1, r2
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _020120E6
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bge _020120E6
	ldrh r1, [r5, #0x10]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _020120E6
	adds r0, r7, #0
	subs r0, #0x10
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	ldr r1, _02012118 @ =sub_0200CDB8
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	movs r3, #8
	rsbs r3, r3, #0
	bl sub_0200D27C
	cmp r0, #0
	bgt _020120E6
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_020120E6:
	ldrh r0, [r5, #0xa]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	strh r0, [r5, #0xa]
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _02012104
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _02012104
	mov r2, r8
	cmp r2, #0xa7
	ble _02012134
_02012104:
	ldr r1, [r5]
	movs r0, #0xf0
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _02012128
	ldr r3, _02012120 @ =0xFFFFFA60
	add sl, r3
	ldr r4, _02012124 @ =0xFFFFFCA0
	add r8, r4
	b _02012134
	.align 2, 0
_02012118: .4byte sub_0200CDB8
_0201211C: .4byte 0x000002B6
_02012120: .4byte 0xFFFFFA60
_02012124: .4byte 0xFFFFFCA0
_02012128:
	movs r0, #0xb4
	lsls r0, r0, #3
	add sl, r0
	movs r1, #0xd8
	lsls r1, r1, #2
	add r8, r1
_02012134:
	mov r0, sl
	adds r0, #7
	cmp r0, #0xfe
	bhi _020121FA
	movs r0, #8
	rsbs r0, r0, #0
	cmp r8, r0
	ble _020121FA
	mov r2, r8
	cmp r2, #0xa7
	bgt _020121FA
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _0201215C
	ldr r0, _02012188 @ =gUnknown_03005500
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _020121FA
_0201215C:
	ldr r2, [sp, #8]
	adds r2, #0x23
	ldr r3, [sp, #0x14]
	cmp r3, #0
	beq _0201216E
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0201218C
_0201216E:
	movs r0, #0xff
	strb r0, [r2]
	mov r0, sl
	ldr r4, [sp, #8]
	strh r0, [r4, #0x16]
	mov r1, r8
	strh r1, [r4, #0x18]
	ldr r0, [sp, #8]
	bl sub_02003D30
	movs r2, #1
	str r2, [sp, #0x14]
	b _020121FA
	.align 2, 0
_02012188: .4byte gUnknown_03005500
_0201218C:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _02012230 @ =gUnknown_030022B0
	adds r4, r0, r1
	ldr r3, [sp, #8]
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_020043FC
	adds r3, r0, #0
	ldr r0, _02012234 @ =gUnknown_030057D8
	ldr r0, [r0]
	cmp r0, r3
	beq _020121FA
	ldr r1, _02012238 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _0201223C @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	ldr r1, [sp, #8]
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, r8
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	ldr r4, [sp, #8]
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	mov r1, sl
	subs r0, r1, r0
	ldr r4, _02012240 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_020121FA:
	ldrh r1, [r5, #0x10]
	ldr r2, _02012244 @ =0x0000FFFC
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r1, #1
	movs r0, #3
	ands r1, r0
	orrs r2, r1
	strh r2, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	subs r0, #1
_02012212:
	strh r0, [r5, #0xc]
	ldr r5, [sp, #0x24]
_02012216:
	ldr r3, [sp, #0x20]
	str r3, [sp, #0x18]
	cmp r3, #0x1f
	bgt _02012220
	b _02011D88
_02012220:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012230: .4byte gUnknown_030022B0
_02012234: .4byte gUnknown_030057D8
_02012238: .4byte 0x040000D4
_0201223C: .4byte 0x80000003
_02012240: .4byte 0x000001FF
_02012244: .4byte 0x0000FFFC

	thumb_func_start sub_02012248
sub_02012248: @ 0x02012248
	push {r4, lr}
	ldr r4, _0201225C @ =gUnknown_030057C4
	ldr r0, [r4]
	bl sub_02001A38
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0201225C: .4byte gUnknown_030057C4

	thumb_func_start sub_02012260
sub_02012260: @ 0x02012260
	push {lr}
	bl sub_02011D48
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0201226C
sub_0201226C: @ 0x0201226C
	ldr r1, _02012274 @ =gUnknown_030057C4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012274: .4byte gUnknown_030057C4

	thumb_func_start sub_02012278
sub_02012278: @ 0x02012278
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _020122AC @ =gUnknown_030057C8
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_02012292:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _020122C6
	cmp r1, #1
	bgt _020122B0
	cmp r1, #0
	beq _020122B6
	b _020122E2
	.align 2, 0
_020122AC: .4byte gUnknown_030057C8
_020122B0:
	cmp r1, #2
	beq _020122D4
	b _020122E2
_020122B6:
	cmp r2, #2
	bne _020122BE
	strh r5, [r4]
	b _020122E2
_020122BE:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _020122E2
_020122C6:
	cmp r2, #2
	bne _020122CE
	strh r5, [r4, #2]
	b _020122E2
_020122CE:
	lsls r1, r2
	strh r1, [r4, #2]
	b _020122E2
_020122D4:
	cmp r2, #2
	bne _020122DC
	strh r5, [r4, #4]
	b _020122E2
_020122DC:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_020122E2:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _02012292
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_020122F8
sub_020122F8: @ 0x020122F8
	ldr r3, _02012304 @ =gUnknown_030057C8
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_02012304: .4byte gUnknown_030057C8

	thumb_func_start sub_02012308
sub_02012308: @ 0x02012308
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _02012424 @ =sub_020124F0
	movs r2, #0xff
	lsls r2, r2, #8
	ldr r1, _02012428 @ =sub_020127B4
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl sub_0200198C
	ldr r1, _0201242C @ =gUnknown_030057D0
	str r0, [r1]
	ldr r0, _02012430 @ =gUnknown_030053CC
	movs r4, #0
	strb r4, [r0]
	ldr r0, _02012434 @ =gUnknown_0300546C
	strb r4, [r0]
	ldr r0, _02012438 @ =gMPRingCollectWins
	strb r4, [r0]
	ldr r5, _0201243C @ =gUnknown_030053D4
	ldrh r0, [r5]
	movs r1, #0x21
	orrs r0, r1
	ldr r1, _02012440 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r5]
	ldr r0, _02012444 @ =gUnknown_030053E4
	strb r4, [r0]
	ldr r1, _02012448 @ =gUnknown_030053E0
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _0201244C @ =gUnknown_03005530
	strb r4, [r0]
	bl sub_0200D1C0
	ldr r0, _02012450 @ =gUnknown_030053A0
	strb r4, [r0]
	ldr r1, _02012454 @ =gUnknown_03005524
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012372
	ldr r0, _02012458 @ =gUnknown_03005468
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0201245C @ =gUnknown_030056C0
	bl sub_0201114C
_02012372:
	movs r0, #0
	bl sub_0200C040
	bl sub_020127C0
	bl sub_02008440
	ldr r2, _0201245C @ =gUnknown_030056C0
	ldr r0, [r2, #0x20]
	ldr r1, _02012460 @ =0xFF9FFFFF
	ands r0, r1
	str r0, [r2, #0x20]
	ldrh r0, [r5]
	ldr r2, _02012464 @ =0x0000FFFE
	ands r2, r0
	ldr r0, _02012468 @ =0x0000FFFD
	ands r2, r0
	subs r0, #2
	ands r2, r0
	strh r2, [r5]
	ldr r6, _0201246C @ =gUnknown_03005444
	ldrb r0, [r6]
	cmp r0, #5
	bne _020123AA
	movs r1, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_020123AA:
	bl sub_02007D38
	bl sub_02006168
	ldr r0, _02012470 @ =gUnknown_03001924
	movs r4, #0
	strh r4, [r0]
	ldr r0, _02012474 @ =gUnknown_030017D0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _02012478 @ =gUnknown_03005374
	strh r1, [r0]
	ldr r0, _0201247C @ =gUnknown_03002A6C
	movs r2, #0x78
	strh r2, [r0]
	ldr r0, _02012480 @ =gUnknown_03004D38
	movs r1, #0x50
	strh r1, [r0]
	ldr r0, _02012484 @ =gUnknown_0300192C
	strh r2, [r0]
	ldr r0, _02012488 @ =gUnknown_03002800
	strh r1, [r0]
	ldr r1, _0201248C @ =gUnknown_03005378
	movs r0, #0x80
	strh r0, [r1]
	ldrb r0, [r6]
	cmp r0, #2
	bls _020124D6
	bl sub_02004C40
	bl sub_02004BBC
	ldr r0, _02012490 @ =gUnknown_03005460
	strb r4, [r0]
	movs r4, #0
_020123F4:
	ldr r0, _02012494 @ =gUnknown_030053A8
	adds r0, r4, r0
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012498 @ =gUnknown_03005528
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _020124A4
	adds r0, r4, #0
	bl sub_02008F50
	ldr r0, _0201249C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r4, r0
	beq _020124A0
	adds r0, r4, #0
	bl sub_020089E8
	b _020124A4
	.align 2, 0
_02012424: .4byte sub_020124F0
_02012428: .4byte sub_020127B4
_0201242C: .4byte gUnknown_030057D0
_02012430: .4byte gUnknown_030053CC
_02012434: .4byte gUnknown_0300546C
_02012438: .4byte gMPRingCollectWins
_0201243C: .4byte gUnknown_030053D4
_02012440: .4byte 0x0000FF7F
_02012444: .4byte gUnknown_030053E4
_02012448: .4byte gUnknown_030053E0
_0201244C: .4byte gUnknown_03005530
_02012450: .4byte gUnknown_030053A0
_02012454: .4byte gUnknown_03005524
_02012458: .4byte gUnknown_03005468
_0201245C: .4byte gUnknown_030056C0
_02012460: .4byte 0xFF9FFFFF
_02012464: .4byte 0x0000FFFE
_02012468: .4byte 0x0000FFFD
_0201246C: .4byte gUnknown_03005444
_02012470: .4byte gUnknown_03001924
_02012474: .4byte gUnknown_030017D0
_02012478: .4byte gUnknown_03005374
_0201247C: .4byte gUnknown_03002A6C
_02012480: .4byte gUnknown_03004D38
_02012484: .4byte gUnknown_0300192C
_02012488: .4byte gUnknown_03002800
_0201248C: .4byte gUnknown_03005378
_02012490: .4byte gUnknown_03005460
_02012494: .4byte gUnknown_030053A8
_02012498: .4byte gUnknown_03005528
_0201249C: .4byte 0x04000128
_020124A0:
	bl sub_02008A9C
_020124A4:
	ldr r0, _020124E0 @ =gUnknown_0300542C
	adds r0, r4, r0
	movs r1, #0xff
	strb r1, [r0]
	ldr r1, _020124E4 @ =gUnknown_03005444
	ldrb r0, [r1]
	cmp r0, #5
	bne _020124BA
	ldr r0, _020124E8 @ =gUnknown_03005478
	adds r0, r4, r0
	strb r4, [r0]
_020124BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _020123F4
	ldrb r0, [r1]
	cmp r0, #5
	beq _020124D6
	ldr r0, _020124EC @ =gUnknown_030056C0
	adds r0, #0x37
	ldrb r2, [r0]
	movs r1, #0x80
	orrs r1, r2
	strb r1, [r0]
_020124D6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_020124E0: .4byte gUnknown_0300542C
_020124E4: .4byte gUnknown_03005444
_020124E8: .4byte gUnknown_03005478
_020124EC: .4byte gUnknown_030056C0

	thumb_func_start sub_020124F0
sub_020124F0: @ 0x020124F0
	push {r4, r5, r6, r7, lr}
	ldr r0, _02012564 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1e
	ldr r0, _02012568 @ =gUnknown_03002244
	ldr r1, _0201256C @ =gUnknown_03005418
	ldr r2, [r0]
	ldr r0, [r1]
	subs r3, r2, r0
	ldr r1, _02012570 @ =gUnknown_03005500
	ldr r0, [r1]
	subs r0, r3, r0
	mov ip, r0
	str r3, [r1]
	ldr r0, _02012574 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #5
	bne _02012590
	ldr r2, _02012578 @ =0xFFFFFE00
	adds r1, r3, #0
	ands r1, r2
	mov r0, ip
	subs r4, r3, r0
	adds r0, r4, #0
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r5, _0201257C @ =gUnknown_030053E8
	ldr r1, [r5]
	ldr r0, _02012580 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _02012584 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, _02012588 @ =0xFFFFF000
	ands r3, r0
	ands r4, r0
	ldr r6, _0201258C @ =gUnknown_03005460
	cmp r3, r4
	beq _02012552
	ldrb r2, [r6]
	lsrs r1, r2, #4
	adds r1, #1
	movs r0, #0xf
	ands r0, r2
	lsls r1, r1, #4
	orrs r0, r1
	strb r0, [r6]
_02012552:
	ldr r1, [r5]
	movs r3, #7
	ldrb r2, [r6]
	movs r0, #0xf8
	ands r0, r2
	ands r1, r3
	orrs r0, r1
	strb r0, [r6]
	b _020125B0
	.align 2, 0
_02012564: .4byte 0x04000128
_02012568: .4byte gUnknown_03002244
_0201256C: .4byte gUnknown_03005418
_02012570: .4byte gUnknown_03005500
_02012574: .4byte gUnknown_03005444
_02012578: .4byte 0xFFFFFE00
_0201257C: .4byte gUnknown_030053E8
_02012580: .4byte 0x00196225
_02012584: .4byte 0x3C6EF35F
_02012588: .4byte 0xFFFFF000
_0201258C: .4byte gUnknown_03005460
_02012590:
	movs r2, #0x40
	rsbs r2, r2, #0
	adds r1, r3, #0
	ands r1, r2
	mov r4, ip
	subs r0, r3, r4
	ands r0, r2
	cmp r1, r0
	beq _020125B0
	ldr r2, _020125E0 @ =gUnknown_030053E8
	ldr r1, [r2]
	ldr r0, _020125E4 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _020125E8 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
_020125B0:
	ldr r2, _020125EC @ =gUnknown_03005650
	adds r0, r2, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0201262E
	ldr r0, _020125F0 @ =gUnknown_03002270
	ldrh r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r1, #0
	ands r0, r3
	cmp r0, r1
	bne _020125F4
	cmp r7, #3
	beq _0201261A
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #3
	strb r0, [r1]
	b _02012634
	.align 2, 0
_020125E0: .4byte gUnknown_030053E8
_020125E4: .4byte 0x00196225
_020125E8: .4byte 0x3C6EF35F
_020125EC: .4byte gUnknown_03005650
_020125F0: .4byte gUnknown_03002270
_020125F4:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0201260C
	cmp r7, #0
	beq _02012624
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #0
	strb r0, [r1]
	b _02012634
_0201260C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0201262E
	cmp r7, #1
	bhi _02012624
_0201261A:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #2
	strb r0, [r1]
	b _02012634
_02012624:
	adds r1, r2, #0
	adds r1, #0x66
	movs r0, #1
	strb r0, [r1]
	b _02012634
_0201262E:
	adds r0, r2, #0
	adds r0, #0x66
	strb r7, [r0]
_02012634:
	ldr r0, _02012694 @ =gUnknown_03005528
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x66
	ldrb r2, [r1]
	asrs r0, r2
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	bne _0201264A
	strb r7, [r1]
_0201264A:
	ldr r1, _02012698 @ =gUnknown_030053A0
	ldrb r0, [r1]
	cmp r0, #0
	beq _02012656
	subs r0, #1
	strb r0, [r1]
_02012656:
	ldr r0, _0201269C @ =gUnknown_03005400
	ldr r4, _020126A0 @ =gUnknown_030053D4
	ldrh r2, [r4]
	strh r2, [r0]
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	bne _0201268E
	ldr r0, _020126A4 @ =gUnknown_030053A4
	ldr r1, [r0]
	add r1, ip
	str r1, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0201268E
	ldr r1, _020126A8 @ =gUnknown_03005408
	ldr r0, [r1]
	mov r3, ip
	subs r0, r0, r3
	str r0, [r1]
	cmp r0, #0
	bgt _0201268E
	movs r0, #1
	orrs r0, r2
	strh r0, [r4]
	bl sub_0200A27C
_0201268E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012694: .4byte gUnknown_03005528
_02012698: .4byte gUnknown_030053A0
_0201269C: .4byte gUnknown_03005400
_020126A0: .4byte gUnknown_030053D4
_020126A4: .4byte gUnknown_030053A4
_020126A8: .4byte gUnknown_03005408

	thumb_func_start sub_020126AC
sub_020126AC: @ 0x020126AC
	push {lr}
	ldr r0, _020126DC @ =gUnknown_03005404
	movs r1, #0
	str r1, [r0]
	ldr r0, _020126E0 @ =gMPRingCollectWins
	strb r1, [r0]
	ldr r1, _020126E4 @ =gUnknown_030053FC
	movs r0, #3
	strb r0, [r1]
	ldr r0, _020126E8 @ =gUnknown_03005444
	ldrb r0, [r0]
	cmp r0, #2
	bls _020126CA
	movs r0, #1
	strb r0, [r1]
_020126CA:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #1
	movs r1, #2
	bl sub_020122F8
	pop {r0}
	bx r0
	.align 2, 0
_020126DC: .4byte gUnknown_03005404
_020126E0: .4byte gMPRingCollectWins
_020126E4: .4byte gUnknown_030053FC
_020126E8: .4byte gUnknown_03005444

	thumb_func_start sub_020126EC
sub_020126EC: @ 0x020126EC
	push {lr}
	ldr r0, _02012750 @ =gUnknown_030053F8
	movs r1, #0
	strb r1, [r0]
	ldr r0, _02012754 @ =gUnknown_03005520
	strb r1, [r0]
	ldr r1, _02012758 @ =gUnknown_030053B0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0201275C @ =gUnknown_03005470
	movs r0, #1
	strb r0, [r1]
	ldr r1, _02012760 @ =gUnknown_03005524
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	beq _02012724
	ldr r0, _02012764 @ =gUnknown_03005468
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r3, _02012768 @ =gUnknown_030056C0
	movs r2, #0
	bl sub_02011140
_02012724:
	ldr r0, _0201276C @ =gUnknown_03005500
	movs r3, #0
	str r3, [r0]
	ldr r2, _02012770 @ =gUnknown_030053D4
	ldrh r1, [r2]
	ldr r0, _02012774 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _02012778 @ =gUnknown_03005418
	ldr r0, _0201277C @ =gUnknown_03002244
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _02012780 @ =gUnknown_030053A4
	str r3, [r0]
	ldr r1, _02012784 @ =gUnknown_03005408
	ldr r0, _02012788 @ =0x00002A30
	str r0, [r1]
	bl sub_02012308
	pop {r0}
	bx r0
	.align 2, 0
_02012750: .4byte gUnknown_030053F8
_02012754: .4byte gUnknown_03005520
_02012758: .4byte gUnknown_030053B0
_0201275C: .4byte gUnknown_03005470
_02012760: .4byte gUnknown_03005524
_02012764: .4byte gUnknown_03005468
_02012768: .4byte gUnknown_030056C0
_0201276C: .4byte gUnknown_03005500
_02012770: .4byte gUnknown_030053D4
_02012774: .4byte 0x0000FF7F
_02012778: .4byte gUnknown_03005418
_0201277C: .4byte gUnknown_03002244
_02012780: .4byte gUnknown_030053A4
_02012784: .4byte gUnknown_03005408
_02012788: .4byte 0x00002A30

	thumb_func_start sub_0201278C
sub_0201278C: @ 0x0201278C
	push {r4, lr}
	ldr r4, _020127AC @ =gUnknown_030057D0
	ldr r0, [r4]
	bl sub_02001A38
	movs r0, #0
	str r0, [r4]
	ldr r0, _020127B0 @ =gUnknown_030056C0
	bl sub_020111CC
	bl sub_0200C574
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_020127AC: .4byte gUnknown_030057D0
_020127B0: .4byte gUnknown_030056C0

	thumb_func_start sub_020127B4
sub_020127B4: @ 0x020127B4
	ldr r1, _020127BC @ =gUnknown_030057D0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_020127BC: .4byte gUnknown_030057D0

	thumb_func_start sub_020127C0
sub_020127C0: @ 0x020127C0
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start sub_020127CC
sub_020127CC: @ 0x020127CC
	push {lr}
	movs r0, #2
	bl m4aSongNumStart
	pop {r0}
	bx r0

	thumb_func_start sub_020127D8
sub_020127D8: @ 0x020127D8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _020128D0 @ =gUnknown_0300544C
	movs r4, #0
	strb r4, [r0]
	strb r4, [r0, #1]
	strb r4, [r0, #2]
	strb r4, [r0, #3]
	ldr r0, _020128D4 @ =gUnknown_03001934
	strb r4, [r0]
	bl sub_02000850
	movs r0, #0
	bl sub_020003EC
	ldr r0, _020128D8 @ =0x0201299D
	movs r2, #0x80
	lsls r2, r2, #5
	str r4, [sp]
	movs r1, #0x80
	movs r3, #0
	bl sub_0200198C
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r5
	mov sb, r0
	bl m4aMPlayAllStop
	bl m4aSoundVSyncOff
	ldr r2, _020128DC @ =gUnknown_03001820
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r1, _020128E0 @ =gUnknown_03002820
	movs r2, #0x8d
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _020128E4 @ =gUnknown_030018C8
	movs r6, #0
	strh r4, [r0]
	strh r4, [r0, #4]
	str r4, [sp, #4]
	ldr r2, _020128E8 @ =0x040000D4
	add r0, sp, #4
	str r0, [r2]
	ldr r1, _020128EC @ =gUnknown_03002290
	mov r8, r1
	ldrh r1, [r1]
	movs r0, #0xc
	ands r0, r1
	lsls r0, r0, #0xc
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	str r0, [r2, #4]
	ldr r0, _020128F0 @ =0x85000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _020128F4 @ =gUnknown_03004D60
	strb r6, [r0]
	ldr r1, _020128F8 @ =gUnknown_03002260
	strb r6, [r1]
	strb r6, [r1, #1]
	movs r0, #0xff
	strb r0, [r1, #2]
	movs r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _020128FC @ =0x00001E01
	mov r2, r8
	strh r0, [r2]
	ldr r7, _02012900 @ =gUnknown_03002810
	strh r4, [r7]
	strh r4, [r7, #2]
	ldr r0, _02012904 @ =gUnknown_03000040
	adds r2, r5, r0
	str r3, [r2, #4]
	strh r4, [r2, #0xa]
	ldr r0, _02012908 @ =0x0600F000
	str r0, [r2, #0xc]
	strh r4, [r2, #0x18]
	strh r4, [r2, #0x1a]
	movs r0, #4
	strh r0, [r2, #0x1c]
	strh r4, [r2, #0x1e]
	strh r4, [r2, #0x20]
	strh r4, [r2, #0x22]
	strh r4, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0x14
	strh r0, [r2, #0x28]
	ldr r1, _0201290C @ =gUnknown_0300006A
	adds r5, r5, r1
	strb r6, [r5]
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl sub_02001DE4
	ldr r0, _02012910 @ =0x00001F04
	mov r2, r8
	strh r0, [r2, #2]
	strh r4, [r7, #4]
	strh r4, [r7, #6]
	ldr r0, _02012914 @ =gUnknown_030053AC
	ldrb r0, [r0]
	cmp r0, #1
	beq _0201291C
	cmp r0, #1
	bgt _02012928
	cmp r0, #0
	bne _02012928
	ldr r0, _02012918 @ =0x0000FFF8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_020128D0: .4byte gUnknown_0300544C
_020128D4: .4byte gUnknown_03001934
_020128D8: .4byte 0x0201299D
_020128DC: .4byte gUnknown_03001820
_020128E0: .4byte gUnknown_03002820
_020128E4: .4byte gUnknown_030018C8
_020128E8: .4byte 0x040000D4
_020128EC: .4byte gUnknown_03002290
_020128F0: .4byte 0x85000010
_020128F4: .4byte gUnknown_03004D60
_020128F8: .4byte gUnknown_03002260
_020128FC: .4byte 0x00001E01
_02012900: .4byte gUnknown_03002810
_02012904: .4byte gUnknown_03000040
_02012908: .4byte 0x0600F000
_0201290C: .4byte gUnknown_0300006A
_02012910: .4byte 0x00001F04
_02012914: .4byte gUnknown_030053AC
_02012918: .4byte 0x0000FFF8
_0201291C:
	ldr r0, _02012924 @ =0x0000FFC8
	strh r0, [r7, #6]
	b _0201292E
	.align 2, 0
_02012924: .4byte 0x0000FFC8
_02012928:
	ldr r1, _02012984 @ =gUnknown_03002810
	ldr r0, _02012988 @ =0x0000FFF8
	strh r0, [r1, #6]
_0201292E:
	mov r2, sb
	ldr r0, _0201298C @ =0x06004000
	str r0, [r2, #4]
	movs r4, #0
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _02012990 @ =0x0600F800
	str r1, [r2, #0xc]
	strh r0, [r2, #0x18]
	strh r0, [r2, #0x1a]
	movs r5, #3
	strh r5, [r2, #0x1c]
	strh r0, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r0, [r2, #0x22]
	strh r0, [r2, #0x24]
	movs r0, #0x1e
	strh r0, [r2, #0x26]
	movs r0, #0xc
	strh r0, [r2, #0x28]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r4, [r0]
	movs r4, #1
	strh r4, [r2, #0x2e]
	adds r0, r2, #0
	bl sub_02001DE4
	ldr r1, _02012994 @ =gUnknown_03002250
	strh r5, [r1, #8]
	strh r4, [r1, #0xa]
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _02012998 @ =0x00003868
	strh r0, [r1, #4]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012984: .4byte gUnknown_03002810
_02012988: .4byte 0x0000FFF8
_0201298C: .4byte 0x06004000
_02012990: .4byte 0x0600F800
_02012994: .4byte gUnknown_03002250
_02012998: .4byte 0x00003868
_0201299C:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_020129A0
sub_020129A0: @ 0x020129A0
	push {lr}
	ldr r1, _020129F8 @ =gUnknown_03005444
	movs r0, #5
	strb r0, [r1]
	ldr r0, _020129FC @ =gUnknown_030057C4
	movs r1, #0
	str r1, [r0]
	ldr r0, _02012A00 @ =gUnknown_030057D4
	str r1, [r0]
	ldr r0, _02012A04 @ =gUnknown_030057D0
	str r1, [r0]
	ldr r0, _02012A08 @ =gUnknown_030056C0
	adds r0, #0x8c
	str r1, [r0]
	ldr r0, _02012A0C @ =gUnknown_03005650
	str r1, [r0, #0x5c]
	ldr r0, _02012A10 @ =gUnknown_030053F0
	strb r1, [r0]
	ldr r0, _02012A14 @ =gUnknown_03005454
	str r1, [r0]
	ldr r3, _02012A18 @ =gRoomEventQueue
	movs r2, #0
_020129CC:
	lsls r0, r1, #2
	adds r0, r0, r3
	str r2, [r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _020129CC
	bl sub_020126AC
	ldr r2, _02012A08 @ =gUnknown_030056C0
	adds r2, #0x5c
	ldr r1, _02012A1C @ =gUnknown_030057C8
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_020129F8: .4byte gUnknown_03005444
_020129FC: .4byte gUnknown_030057C4
_02012A00: .4byte gUnknown_030057D4
_02012A04: .4byte gUnknown_030057D0
_02012A08: .4byte gUnknown_030056C0
_02012A0C: .4byte gUnknown_03005650
_02012A10: .4byte gUnknown_030053F0
_02012A14: .4byte gUnknown_03005454
_02012A18: .4byte gRoomEventQueue
_02012A1C: .4byte gUnknown_030057C8

	thumb_func_start sub_02012A20
sub_02012A20: @ 0x02012A20
	push {r4, r5, r6, r7, lr}
	ldr r1, _02012A7C @ =gUnknown_03005444
	movs r0, #5
	strb r0, [r1]
	ldr r1, _02012A80 @ =gUnknown_03004D34
	ldr r0, _02012A84 @ =gUnknown_03001B40
	str r0, [r1]
	ldr r1, _02012A88 @ =gUnknown_030022A0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	movs r1, #0
	ldr r7, _02012A8C @ =gUnknown_03001934
	ldr r0, _02012A90 @ =gUnknown_03001930
	mov ip, r0
	ldr r6, _02012A94 @ =gUnknown_03005478
	movs r2, #0
	ldr r5, _02012A98 @ =gUnknown_030053D8
	ldr r4, _02012A9C @ =gUnknown_0300542C
	ldr r3, _02012AA0 @ =gUnknown_0300544C
_02012A4A:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r4
	strb r1, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _02012A4A
	movs r0, #1
	strb r0, [r7]
	mov r1, ip
	ldr r0, [r1]
	bl sub_020003EC
	bl sub_02000834
	movs r0, #0
	bl sub_02004E54
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_02012A7C: .4byte gUnknown_03005444
_02012A80: .4byte gUnknown_03004D34
_02012A84: .4byte gUnknown_03001B40
_02012A88: .4byte gUnknown_030022A0
_02012A8C: .4byte gUnknown_03001934
_02012A90: .4byte gUnknown_03001930
_02012A94: .4byte gUnknown_03005478
_02012A98: .4byte gUnknown_030053D8
_02012A9C: .4byte gUnknown_0300542C
_02012AA0: .4byte gUnknown_0300544C

	thumb_func_start sub_02012AA4
sub_02012AA4: @ 0x02012AA4
	push {lr}
	sub sp, #4
	ldr r0, _02012AC4 @ =sub_02012AE8
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, _02012AC8 @ =sub_02012AEC
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl sub_0200198C
	ldr r1, _02012ACC @ =gUnknown_030057D4
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_02012AC4: .4byte sub_02012AE8
_02012AC8: .4byte sub_02012AEC
_02012ACC: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AD0
sub_02012AD0: @ 0x02012AD0
	push {r4, lr}
	ldr r4, _02012AE4 @ =gUnknown_030057D4
	ldr r0, [r4]
	bl sub_02001A38
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_02012AE4: .4byte gUnknown_030057D4

	thumb_func_start sub_02012AE8
sub_02012AE8: @ 0x02012AE8
	bx lr
	.align 2, 0

	thumb_func_start sub_02012AEC
sub_02012AEC: @ 0x02012AEC
	ldr r1, _02012AF4 @ =gUnknown_030057D4
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_02012AF4: .4byte gUnknown_030057D4
