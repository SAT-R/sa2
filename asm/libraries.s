.include "asm/macros.inc"

.syntax unified
.arm

	arm_func_start sub_80001CC
sub_80001CC: @ 0x080001CC
	push {r4, r5, r6, r7, r8, sb, sl, fp}
	mov ip, #0x4000000
	ldr fp, _08000208 @ =gUnknown_03000560
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
_08000208: .4byte gUnknown_03000560

	arm_func_start sub_800020C
sub_800020C: @ 0x0800020C
	mov ip, #0x4000000
	add ip, ip, #0x120
	ldm ip, {r0, r1}
	push {r7, r8, sb, sl, fp}
	ldr fp, _08000324 @ =gUnknown_03000560
	mov sb, #0xfe
	add sb, sb, #0xfe00
	ldrh r3, [ip, #8]
	and r3, r3, #0x40
	strb r3, [fp, #9]
	ldr sl, [fp, #0x14]
	adds r3, sl, #1
	blt _08000268
	bne _0800025C
	strh sb, [ip, #0xa]
	add r8, fp, #0x28
	ldm r8, {r2, r3}
	mov r7, r2
	stm r8, {r3, r7}
	b _08000268
_0800025C:
	ldr r3, [fp, #0x2c]
	ldr r2, [r3, sl, lsl #1]
	strh r2, [ip, #0xa]
_08000268:
	cmp sl, #0xd
	addlt sl, sl, #1
	strlt sl, [fp, #0x14]
	push {r0, r1, r5, r6}
	mov r6, #3
_0800027C:
	add r8, fp, #0x18
	add r8, r8, r6, lsl #2
	ldr sl, [r8]
	lsl r3, r6, #1
	ldrh r5, [sp, r3]
	cmp r5, sb
	bne _080002AC
	cmp sl, #0xb
	ble _080002AC
	mov r0, #1
	sub sl, r0, #2
	b _080002D8
_080002AC:
	ldr r0, [r8, #0x18]
	lsl r3, sl, #1
	strh r5, [r0, r3]
	cmp sl, #0xb
	bne _080002D8
	ldr r1, [r8, #0x28]
	str r0, [r8, #0x28]
	str r1, [r8, #0x18]
	add r3, fp, #4
	mov r0, #1
	strb r0, [r3, r6]
_080002D8:
	cmp sl, #0xd
	addlt sl, sl, #1
	str sl, [r8]
	subs r6, r6, #1
	bge _0800027C
	ldrb r0, [fp]
	cmp r0, #0
	beq _08000318
	ldr r7, _08000328 @ =0x0400010E
	mov r0, #0
	strh r0, [r7]
	ldrh r0, [ip, #8]
	orr r0, r0, #0x80
	strh r0, [ip, #8]
	mov r0, #0xc0
	strh r0, [r7]
_08000318:
	add sp, sp, #8
	pop {r5, r6, r7, r8, sb, sl, fp}
	bx lr
	.align 2, 0
_08000324: .4byte gUnknown_03000560
_08000328: .4byte 0x0400010E

	thumb_func_start sub_800032C
sub_800032C: @ 0x0800032C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, _080003EC @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _080003F0 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080003F4 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080003F8 @ =0x04000134
	strh r4, [r0]
	subs r2, #0xd8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2]
	ldrh r0, [r2]
	ldr r3, _080003FC @ =0x00004003
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [sp]
	ldr r4, _08000400 @ =gUnknown_03000560
	ldr r2, _08000404 @ =0x0500007A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _08000408 @ =sub_80001CC
	ldr r1, _0800040C @ =gUnknown_03000750
	ldr r2, _08000410 @ =0x04000010
	bl CpuSet
	ldr r0, _08000414 @ =sub_800020C
	ldr r1, _08000418 @ =gUnknown_03000440
	ldr r2, _0800041C @ =0x04000048
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
_080003A8:
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
	ble _080003A8
	ldr r3, _080003EC @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080003F0 @ =0x04000200
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
_080003EC: .4byte 0x04000208
_080003F0: .4byte 0x04000200
_080003F4: .4byte 0x0000FF3F
_080003F8: .4byte 0x04000134
_080003FC: .4byte 0x00004003
_08000400: .4byte gUnknown_03000560
_08000404: .4byte 0x0500007A
_08000408: .4byte sub_80001CC
_0800040C: .4byte gUnknown_03000750
_08000410: .4byte 0x04000010
_08000414: .4byte sub_800020C
_08000418: .4byte gUnknown_03000440
_0800041C: .4byte 0x04000048

	thumb_func_start sub_8000420
sub_8000420: @ 0x08000420
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov ip, r1
	mov r8, r2
	ldr r5, _08000440 @ =0x04000128
	ldr r6, [r5]
	ldr r7, _08000444 @ =gUnknown_03000560
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _08000448
	cmp r0, #1
	beq _080004B0
	b _080004BE
	.align 2, 0
_08000440: .4byte 0x04000128
_08000444: .4byte gUnknown_03000560
_08000448:
	movs r1, #0x30
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080004AA
	movs r0, #0x88
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #8
	bne _080004BE
	movs r1, #4
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080004AA
	ldr r0, [r7, #0x14]
	cmp r0, #0xd
	bne _080004AA
	ldr r3, _080004F0 @ =0x04000208
	strh r1, [r3]
	ldr r2, _080004F4 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080004F8 @ =0x0000FF7F
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
	ldr r1, _080004FC @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #0xf6
	ldr r0, _08000500 @ =0x0000BBBC
	str r0, [r1]
	strb r4, [r7]
	ldrb r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5]
_080004AA:
	ldr r1, _08000504 @ =gUnknown_03000560
	movs r0, #1
	strb r0, [r1, #1]
_080004B0:
	mov r0, ip
	bl sub_8000608
	mov r0, sb
	mov r1, r8
	bl sub_8000538
_080004BE:
	ldr r1, _08000504 @ =gUnknown_03000560
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
	bne _08000508
	movs r0, #0x80
	orrs r0, r2
	orrs r0, r3
	b _0800050C
	.align 2, 0
_080004F0: .4byte 0x04000208
_080004F4: .4byte 0x04000200
_080004F8: .4byte 0x0000FF7F
_080004FC: .4byte 0x04000202
_08000500: .4byte 0x0000BBBC
_08000504: .4byte gUnknown_03000560
_08000508:
	adds r0, r3, #0
	orrs r0, r2
_0800050C:
	adds r2, r0, #0
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _0800051A
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
_0800051A:
	adds r1, r2, #0
	lsls r0, r6, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #3
	bls _0800052A
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_0800052A:
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8000538
sub_8000538: @ 0x08000538
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _080005F8 @ =gUnknown_03000560
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
	ldr r1, _080005FC @ =gUnknown_03000790
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
	ldr r2, _08000600 @ =0x04000005
	bl CpuSet
	movs r2, #0
	ldr r1, [r5, #0x28]
_080005B4:
	ldrh r0, [r1]
	adds r7, r7, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _080005B4
	adds r2, r5, #0
	ldr r1, [r2, #0x28]
	mvns r0, r7
	strh r0, [r1, #2]
	ldrb r0, [r2]
	cmp r0, #0
	beq _080005D4
	ldr r1, _08000604 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
_080005D4:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x14]
	ldrb r0, [r5]
	cmp r0, #0
	beq _080005F0
	ldrb r1, [r5, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080005F0
	ldr r1, _08000604 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_080005F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080005F8: .4byte gUnknown_03000560
_080005FC: .4byte gUnknown_03000790
_08000600: .4byte 0x04000005
_08000604: .4byte 0x0400010E

	thumb_func_start sub_8000608
sub_8000608: @ 0x08000608
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, _08000714 @ =gUnknown_03000750
	movs r4, #0
	str r4, [sp]
	bl _call_via_r0
	str r0, [sp, #4]
	ldr r0, _08000718 @ =gUnknown_03000560
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
_08000638:
	movs r3, #0
	movs r2, #0
	lsls r5, r4, #2
	adds r0, r4, #1
	str r0, [sp, #0x10]
	mov r1, r8
	adds r0, r5, r1
	ldr r1, [r0]
_08000648:
	ldrh r0, [r1]
	adds r3, r3, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _08000648
	mov r2, sl
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080006AA
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, r7
	bne _080006AA
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
	ldr r2, _0800071C @ =0x04000005
	bl CpuSet
_080006AA:
	movs r0, #0
	str r0, [sp, #8]
	mov r7, r8
	adds r0, r5, r7
	ldr r1, [r0]
	adds r1, #4
	mov r0, sb
	ldr r2, _08000720 @ =0x05000005
	bl CpuSet
	ldr r4, [sp, #0x10]
	cmp r4, #3
	ble _08000638
	ldr r0, _08000718 @ =gUnknown_03000560
	ldrb r1, [r0, #2]
	ldrb r2, [r0, #3]
	adds r3, r1, #0
	orrs r3, r2
	strb r3, [r0, #2]
	movs r1, #1
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _08000760
	ldrb r0, [r5]
	cmp r0, #8
	bne _08000724
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	beq _080006F8
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	bne _080006F8
	ldrb r0, [r5, #8]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #8]
_080006F8:
	ldrb r4, [r5, #8]
	lsls r2, r4, #0x1c
	lsrs r2, r2, #0x1c
	movs r0, #0xe
	ldrb r3, [r5, #2]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _08000744
	movs r0, #0x40
	orrs r0, r4
	b _08000742
	.align 2, 0
_08000714: .4byte gUnknown_03000750
_08000718: .4byte gUnknown_03000560
_0800071C: .4byte 0x04000005
_08000720: .4byte 0x05000005
_08000724:
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
_08000742:
	strb r0, [r5, #8]
_08000744:
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
_08000760:
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

	thumb_func_start sub_8000774
sub_8000774: @ 0x08000774
	push {lr}
	ldr r2, _0800078C @ =gUnknown_03000560
	ldrb r0, [r2]
	cmp r0, #0
	beq _08000786
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
_08000786:
	pop {r0}
	bx r0
	.align 2, 0
_0800078C: .4byte gUnknown_03000560

	thumb_func_start sub_8000790
sub_8000790: @ 0x08000790
	ldr r3, _080007C4 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080007C8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080007CC @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _080007D0 @ =0x04000128
	ldr r2, _080007D4 @ =0x00002003
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x1c
	ldr r0, _080007D8 @ =0x0000BBBC
	str r0, [r1]
	adds r1, #0xf6
	movs r0, #0xc0
	strh r0, [r1]
	ldr r2, _080007DC @ =gUnknown_03000560
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	bx lr
	.align 2, 0
_080007C4: .4byte 0x04000208
_080007C8: .4byte 0x04000200
_080007CC: .4byte 0x0000FF3F
_080007D0: .4byte 0x04000128
_080007D4: .4byte 0x00002003
_080007D8: .4byte 0x0000BBBC
_080007DC: .4byte gUnknown_03000560

	thumb_func_start sub_80007E0
sub_80007E0: @ 0x080007E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_8001060
	cmp r0, #0
	beq _080007F8
	b _08000CE8
_080007F8:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	str r0, [sp]
	cmp r1, #0xf
	bls _0800080C
	subs r0, r1, #1
	ldr r1, [sp]
	strb r0, [r1]
	b _08000CE8
_0800080C:
	adds r0, r7, #0
	adds r0, #0x48
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0
	beq _08000860
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08000850 @ =0x04000128
	ldrh r0, [r2]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _08000860
	strb r1, [r7, #0x1e]
	strb r1, [r7, #0x18]
	strb r1, [r7, #0x1d]
	movs r0, #0xf
	ldr r3, [sp]
	strb r0, [r3]
	mov r0, sl
	strb r1, [r0]
	strh r1, [r7, #0x16]
	ldr r0, _08000854 @ =0x04000134
	strh r1, [r0]
	ldr r3, _08000858 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _0800085C @ =0x0400012A
	strh r1, [r0]
	movs r0, #8
	eors r0, r5
	b _08000CEA
	.align 2, 0
_08000850: .4byte 0x04000128
_08000854: .4byte 0x04000134
_08000858: .4byte 0x00002003
_0800085C: .4byte 0x0400012A
_08000860:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _080008E2
	adds r0, r7, #0
	bl sub_8000F08
	adds r5, r0, #0
	cmp r5, #0
	beq _08000874
	b _08000CEA
_08000874:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08000890
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _08000890
	adds r0, r7, #0
	bl sub_8001060
	cmp r0, #0
	bne _08000890
	b _08000C74
_08000890:
	adds r0, r7, #0
	bl sub_8001060
	cmp r0, #0
	beq _0800089C
	b _08000CE8
_0800089C:
	ldrh r0, [r7, #0x16]
	adds r2, r0, #0
	cmp r2, #0
	bne _080008DC
	strb r2, [r7, #0x1e]
	strb r2, [r7, #0x18]
	strb r2, [r7, #0x1d]
	movs r0, #0xf
	ldr r1, [sp]
	strb r0, [r1]
	mov r3, sl
	strb r2, [r3]
	strh r2, [r7, #0x16]
	ldr r0, _080008CC @ =0x04000134
	strh r2, [r0]
	ldr r1, _080008D0 @ =0x04000128
	ldr r3, _080008D4 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _080008D8 @ =0x0400012A
	strh r2, [r0]
	movs r0, #0x71
	b _08000CEA
	.align 2, 0
_080008CC: .4byte 0x04000134
_080008D0: .4byte 0x04000128
_080008D4: .4byte 0x00002003
_080008D8: .4byte 0x0400012A
_080008DC:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _08000CE8
_080008E2:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _080008EA
	b _08000A24
_080008EA:
	cmp r0, #2
	bgt _080008F8
	cmp r0, #0
	beq _08000906
	cmp r0, #1
	beq _080009C4
	b _08000B94
_080008F8:
	cmp r0, #0xd0
	bne _080008FE
	b _08000A70
_080008FE:
	cmp r0, #0xd1
	bne _08000904
	b _08000B10
_08000904:
	b _08000B94
_08000906:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _0800094C @ =0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _08000950 @ =0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _0800092E
	adds r4, r1, #0
	ldr r1, _08000954 @ =0x04000126
_0800091E:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _0800092E
	ldrh r0, [r1]
	cmp r0, r4
	beq _0800091E
_0800092E:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _0800094C @ =0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800095C
	ldr r0, _08000958 @ =0x00007208
	b _08000982
	.align 2, 0
_0800094C: .4byte 0x04000120
_08000950: .4byte 0x0000FFFF
_08000954: .4byte 0x04000126
_08000958: .4byte 0x00007208
_0800095C:
	subs r5, #1
	cmp r5, #0
	beq _08000988
	lsls r0, r5, #1
	ldr r1, _080009B0 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800095C
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_08000982:
	cmp r4, r0
	beq _0800095C
	movs r3, #0
_08000988:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _08000998
	movs r0, #0xf
	ldr r2, [sp]
	strb r0, [r2]
_08000998:
	ldr r3, [sp]
	ldrb r0, [r3]
	cmp r0, #0
	bne _080009B4
	ldrb r0, [r7, #0x1d]
	ldrb r1, [r7, #0x1e]
	cmp r0, r1
	beq _080009BA
	adds r0, r7, #0
	bl sub_8000D74
	b _080009C4
	.align 2, 0
_080009B0: .4byte 0x04000120
_080009B4:
	subs r0, #1
	ldr r2, [sp]
	strb r0, [r2]
_080009BA:
	ldrb r1, [r7, #0x1e]
	movs r3, #0xc4
	lsls r3, r3, #7
	adds r0, r3, #0
	b _08000ACE
_080009C4:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _08000A1C @ =gUnknown_03000400
_080009D2:
	lsls r0, r5, #1
	ldr r2, _08000A20 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _080009FC
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _080009FC
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_080009FC:
	adds r5, r2, #0
	cmp r5, #0
	bne _080009D2
	ldrb r0, [r7, #0x1d]
	mov r3, ip
	ldrb r3, [r3]
	cmp r0, r3
	bne _080009BA
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r0, ip
	ldrb r1, [r0]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _08000ACC
	.align 2, 0
_08000A1C: .4byte gUnknown_03000400
_08000A20: .4byte 0x04000120
_08000A24:
	movs r5, #3
	movs r3, #0x49
	adds r3, r3, r7
	mov ip, r3
	mov r4, ip
	movs r6, #1
	ldr r0, _08000A68 @ =gUnknown_03000400
	mov sb, r0
	ldr r1, _08000A6C @ =0x04000120
	mov r8, r1
_08000A38:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _08000A5E
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _08000A5E
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_08000A5E:
	adds r5, r2, #0
	cmp r5, #0
	bne _08000A38
	b _08000BFC
	.align 2, 0
_08000A68: .4byte gUnknown_03000400
_08000A6C: .4byte 0x04000120
_08000A70:
	movs r3, #1
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	movs r0, #0x19
	adds r0, r0, r7
	mov r8, r0
	movs r6, #0
	ldr r1, _08000AD8 @ =gUnknown_03000400
	mov sb, r1
_08000A86:
	lsls r0, r5, #1
	ldr r2, _08000ADC @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	mov r1, r8
	adds r0, r1, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08000ABC
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _08000AB0
	b _08000C7A
_08000AB0:
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r4, r0
	bne _08000ABC
	movs r3, #0
_08000ABC:
	adds r5, r2, #0
	cmp r5, #0
	bne _08000A86
	cmp r3, #0
	bne _08000AE0
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_08000ACC:
	adds r0, r2, #0
_08000ACE:
	orrs r1, r0
	adds r0, r7, #0
	bl sub_8000CFC
	b _08000CEA
	.align 2, 0
_08000AD8: .4byte gUnknown_03000400
_08000ADC: .4byte 0x04000120
_08000AE0:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	mov r1, r8
	adds r1, #2
_08000AEC:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _08000AEC
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl sub_8000CFC
	b _08000CEA
_08000B10:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _08000B50 @ =0x04000126
	movs r3, #1
_08000B1A:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _08000B30
	asrs r0, r4, #8
	cmp r0, #0x73
	beq _08000B30
	b _08000CB0
_08000B30:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _08000B1A
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne _08000B54
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _08000CE8
	.align 2, 0
_08000B50: .4byte 0x04000126
_08000B54:
	movs r1, #0
	strb r1, [r7, #0x1e]
	strb r1, [r7, #0x18]
	strb r1, [r7, #0x1d]
	movs r0, #0xf
	ldr r3, [sp]
	strb r0, [r3]
	mov r0, sl
	strb r1, [r0]
	strh r1, [r7, #0x16]
	ldr r0, _08000B84 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08000B88 @ =0x04000128
	ldr r3, _08000B8C @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08000B90 @ =0x0400012A
	strh r1, [r0]
	movs r0, #0x1e
	ldr r1, [sp]
	strb r0, [r1]
	movs r0, #0x70
	b _08000CEA
	.align 2, 0
_08000B84: .4byte 0x04000134
_08000B88: .4byte 0x04000128
_08000B8C: .4byte 0x00002003
_08000B90: .4byte 0x0400012A
_08000B94:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r3, #1
	mov sb, r3
_08000BA2:
	mov r0, r8
	ldrb r6, [r0]
	adds r0, r6, #0
	asrs r0, r5
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08000BDC
	lsls r0, r5, #1
	ldr r2, _08000BF8 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, sb
	lsls r3, r5
	cmp r2, r1
	bne _08000BD6
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _08000BDC
_08000BD6:
	eors r6, r3
	mov r3, r8
	strb r6, [r3]
_08000BDC:
	subs r5, #1
	cmp r5, #0
	bne _08000BA2
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _08000BFC
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _080009BA
	.align 2, 0
_08000BF8: .4byte 0x04000120
_08000BFC:
	mov r1, ip
	ldrb r2, [r1]
	cmp r2, #0
	bne _08000C3C
	strb r2, [r7, #0x1e]
	strb r2, [r7, #0x18]
	strb r2, [r7, #0x1d]
	movs r0, #0xf
	ldr r3, [sp]
	strb r0, [r3]
	mov r0, sl
	strb r2, [r0]
	strh r2, [r7, #0x16]
	ldr r0, _08000C2C @ =0x04000134
	strh r2, [r0]
	ldr r1, _08000C30 @ =0x04000128
	ldr r3, _08000C34 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08000C38 @ =0x0400012A
	strh r2, [r0]
	movs r0, #0x50
	b _08000CEA
	.align 2, 0
_08000C2C: .4byte 0x04000134
_08000C30: .4byte 0x04000128
_08000C34: .4byte 0x00002003
_08000C38: .4byte 0x0400012A
_08000C3C:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _08000C4C
	b _080009BA
_08000C4C:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl sub_8000CFC
	adds r5, r0, #0
	cmp r5, #0
	bne _08000CEA
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _08000CE8
_08000C74:
	bl sub_8001074
	b _0800080C
_08000C7A:
	strb r6, [r7, #0x1e]
	strb r6, [r7, #0x18]
	strb r6, [r7, #0x1d]
	movs r0, #0xf
	ldr r1, [sp]
	strb r0, [r1]
	mov r2, sl
	strb r6, [r2]
	strh r6, [r7, #0x16]
	ldr r0, _08000CA0 @ =0x04000134
	strh r6, [r0]
	ldr r1, _08000CA4 @ =0x04000128
	ldr r3, _08000CA8 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08000CAC @ =0x0400012A
	strh r6, [r0]
	movs r0, #0x60
	b _08000CEA
	.align 2, 0
_08000CA0: .4byte 0x04000134
_08000CA4: .4byte 0x04000128
_08000CA8: .4byte 0x00002003
_08000CAC: .4byte 0x0400012A
_08000CB0:
	movs r1, #0
	strb r1, [r7, #0x1e]
	strb r1, [r7, #0x18]
	strb r1, [r7, #0x1d]
	movs r0, #0xf
	ldr r2, [sp]
	strb r0, [r2]
	mov r3, sl
	strb r1, [r3]
	strh r1, [r7, #0x16]
	ldr r0, _08000CD8 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08000CDC @ =0x04000128
	ldr r3, _08000CE0 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08000CE4 @ =0x0400012A
	strh r1, [r0]
	movs r0, #0x60
	b _08000CEA
	.align 2, 0
_08000CD8: .4byte 0x04000134
_08000CDC: .4byte 0x04000128
_08000CE0: .4byte 0x00002003
_08000CE4: .4byte 0x0400012A
_08000CE8:
	movs r0, #0
_08000CEA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8000CFC
sub_8000CFC: @ 0x08000CFC
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r5, _08000D28 @ =0x04000128
	ldrh r0, [r5]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _08000D34
	ldr r0, _08000D2C @ =0x0400012A
	strh r1, [r0]
	ldr r1, _08000D30 @ =0x00002083
	adds r0, r1, #0
	strh r0, [r5]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _08000D60
	.align 2, 0
_08000D28: .4byte 0x04000128
_08000D2C: .4byte 0x0400012A
_08000D30: .4byte 0x00002083
_08000D34:
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _08000D68 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08000D6C @ =0x00002003
	adds r0, r2, #0
	strh r0, [r5]
	ldr r0, _08000D70 @ =0x0400012A
	strh r1, [r0]
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_08000D60:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08000D68: .4byte 0x04000134
_08000D6C: .4byte 0x00002003
_08000D70: .4byte 0x0400012A

	thumb_func_start sub_8000D74
sub_8000D74: @ 0x08000D74
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	beq _08000DB8
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _08000DA8 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08000DAC @ =0x04000128
	ldr r3, _08000DB0 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08000DB4 @ =0x0400012A
	strh r1, [r0]
	b _08000DC4
	.align 2, 0
_08000DA8: .4byte 0x04000134
_08000DAC: .4byte 0x04000128
_08000DB0: .4byte 0x00002003
_08000DB4: .4byte 0x0400012A
_08000DB8:
	adds r1, r2, #0
	adds r1, #0x4a
	strb r0, [r1]
	strb r0, [r2, #0x1e]
	movs r0, #1
	strb r0, [r2, #0x18]
_08000DC4:
	pop {r0}
	bx r0

	thumb_func_start sub_8000DC8
sub_8000DC8: @ 0x08000DC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r7, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x18]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, ip
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _08000DF8
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _08000DF8
	mov r6, ip
	adds r6, #0x4a
	ldrb r2, [r6]
	cmp r2, #0
	beq _08000E34
_08000DF8:
	movs r1, #0
	mov r2, ip
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r2, #0x4a
	movs r0, #0xf
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x48
	strb r1, [r0]
	mov r3, ip
	strh r1, [r3, #0x16]
	ldr r0, _08000E24 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08000E28 @ =0x04000128
	ldr r3, _08000E2C @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08000E30 @ =0x0400012A
	strh r1, [r0]
	b _08000EFE
	.align 2, 0
_08000E24: .4byte 0x04000134
_08000E28: .4byte 0x04000128
_08000E2C: .4byte 0x00002003
_08000E30: .4byte 0x0400012A
_08000E34:
	mov r0, ip
	str r7, [r0, #0x20]
	adds r5, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r5, r0
	subs r0, #0xf0
	adds r1, r5, r0
	ldr r0, _08000E70 @ =0x0003FF00
	cmp r1, r0
	bls _08000E84
	mov r1, ip
	strb r2, [r1, #0x1e]
	strb r2, [r1, #0x18]
	strb r2, [r1, #0x1d]
	movs r0, #0xf
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x48
	strb r2, [r0]
	strh r2, [r1, #0x16]
	ldr r0, _08000E74 @ =0x04000134
	strh r2, [r0]
	ldr r1, _08000E78 @ =0x04000128
	ldr r3, _08000E7C @ =0x00002003
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08000E80 @ =0x0400012A
	strh r2, [r0]
	b _08000EFE
	.align 2, 0
_08000E70: .4byte 0x0003FF00
_08000E74: .4byte 0x04000134
_08000E78: .4byte 0x04000128
_08000E7C: .4byte 0x00002003
_08000E80: .4byte 0x0400012A
_08000E84:
	adds r0, r7, r5
	mov r1, ip
	str r0, [r1, #0x24]
	mov r2, r8
	lsls r1, r2, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _08000EE8
	lsls r0, r0, #2
	ldr r1, _08000EA8 @ =_08000EAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08000EA8: .4byte _08000EAC
_08000EAC: @ jump table
	.4byte _08000ED0 @ case 0
	.4byte _08000ED0 @ case 1
	.4byte _08000ED0 @ case 2
	.4byte _08000ED0 @ case 3
	.4byte _08000EDA @ case 4
	.4byte _08000EE0 @ case 5
	.4byte _08000EE0 @ case 6
	.4byte _08000EE0 @ case 7
	.4byte _08000EE0 @ case 8
_08000ED0:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _08000EE6
_08000EDA:
	movs r0, #0x38
	adds r4, r3, #0
	b _08000EE6
_08000EE0:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
_08000EE6:
	orrs r4, r0
_08000EE8:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r3, #0x7f
	rsbs r3, r3, #0
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strb r0, [r1, #0x1c]
	movs r0, #0xd0
	strb r0, [r1, #0x18]
_08000EFE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8000F08
sub_8000F08: @ 0x08000F08
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x18]
	cmp r0, #0xe0
	beq _08000F24
	cmp r0, #0xe0
	blt _08000F34
	cmp r0, #0xe8
	bgt _08000F34
	cmp r0, #0xe7
	blt _08000F34
	movs r4, #3
	ldrb r5, [r2, #0x1e]
	b _08000F94
_08000F24:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r2, #0x18]
	str r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r2]
	b _08000F86
_08000F34:
	movs r4, #3
	ldrb r5, [r2, #0x1e]
	movs r6, #1
	ldr r1, _08000F90 @ =0x04000126
_08000F3C:
	ldrh r0, [r1]
	adds r3, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _08000F50
	ldr r0, [r2, #4]
	cmp r3, r0
	bne _08000F24
_08000F50:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _08000F3C
	ldrb r0, [r2, #0x18]
	adds r0, #1
	strb r0, [r2, #0x18]
	ldr r1, [r2]
	ldrh r0, [r2]
	str r0, [r2, #4]
	cmp r1, #0
	bne _08000F7E
	ldr r0, [r2, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r2, #4]
	lsls r1, r1, #5
	str r1, [r2]
_08000F7E:
	ldr r0, [r2]
	lsrs r0, r0, #5
	str r0, [r2]
_08000F84:
	ldrh r1, [r2]
_08000F86:
	adds r0, r2, #0
	bl sub_8000CFC
	b _0800101E
	.align 2, 0
_08000F90: .4byte 0x04000126
_08000F94:
	lsls r0, r4, #1
	ldr r1, _08000FDC @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r3, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08000FB0
	ldr r0, [r2, #4]
	cmp r3, r0
	bne _08000FE0
_08000FB0:
	subs r4, #1
	cmp r4, #0
	bne _08000F94
	ldrb r0, [r2, #0x18]
	adds r0, #1
	strb r0, [r2, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0800101C
	ldr r0, [r2, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r2]
	str r1, [r2, #4]
	b _08000F84
	.align 2, 0
_08000FDC: .4byte 0x04000120
_08000FE0:
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _0800100C @ =0x04000134
	strh r1, [r0]
	ldr r2, _08001010 @ =0x04000128
	ldr r3, _08001014 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08001018 @ =0x0400012A
	strh r1, [r0]
	movs r0, #0x71
	b _0800101E
	.align 2, 0
_0800100C: .4byte 0x04000134
_08001010: .4byte 0x04000128
_08001014: .4byte 0x00002003
_08001018: .4byte 0x0400012A
_0800101C:
	movs r0, #0
_0800101E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8001024
sub_8001024: @ 0x08001024
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _08001050 @ =0x04000134
	strh r1, [r0]
	ldr r2, _08001054 @ =0x04000128
	ldr r3, _08001058 @ =0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _0800105C @ =0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_08001050: .4byte 0x04000134
_08001054: .4byte 0x04000128
_08001058: .4byte 0x00002003
_0800105C: .4byte 0x0400012A

	thumb_func_start sub_8001060
sub_8001060: @ 0x08001060
	push {lr}
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0800106C
	movs r0, #0
	b _0800106E
_0800106C:
	movs r0, #1
_0800106E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8001074
sub_8001074: @ 0x08001074
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _080010B4 @ =0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08001098
	ldr r5, _080010B8 @ =0x0000795C
	movs r4, #0x80
_08001088:
	adds r2, #1
	cmp r2, r5
	bgt _08001098
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08001088
_08001098:
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _080010AA
	movs r1, #0xd
	cmp r2, #8
	beq _080010AA
	movs r1, #4
_080010AA:
	subs r0, r0, r1
	bgt _080010AA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080010B4: .4byte 0x04000128
_080010B8: .4byte 0x0000795C

	thumb_func_start sub_80010BC
sub_80010BC: @ 0x080010BC
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _080010D8 @ =gUnknown_03000790
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #4
	bls _080010CC
	b _08001292
_080010CC:
	lsls r0, r1, #2
	ldr r1, _080010DC @ =_080010E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080010D8: .4byte gUnknown_03000790
_080010DC: .4byte _080010E0
_080010E0: @ jump table
	.4byte _080010F4 @ case 0
	.4byte _0800110C @ case 1
	.4byte _080011A8 @ case 2
	.4byte _0800121A @ case 3
	.4byte _08001288 @ case 4
_080010F4:
	ldr r0, [r5]
	ldr r1, _08001108 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	bne _08001100
	b _08001292
_08001100:
	movs r0, #1
	strb r0, [r5, #1]
	b _08001292
	.align 2, 0
_08001108: .4byte 0x00FF00FF
_0800110C:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0800111C
	ldrb r0, [r5, #2]
	cmp r0, #5
	bhi _0800111A
	b _08001292
_0800111A:
	b _08001126
_0800111C:
	ldr r1, _0800115C @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
_08001126:
	ldr r0, _08001160 @ =0x04000120
	movs r6, #0
	str r6, [r0]
	ldr r1, _08001164 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	ldrb r4, [r5]
	cmp r4, #1
	bne _08001174
	ldr r2, _0800115C @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08001168 @ =0x0400010C
	ldr r0, _0800116C @ =0x00C0F318
	str r0, [r1]
	ldr r3, _08001170 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r3]
	b _08001194
	.align 2, 0
_0800115C: .4byte 0x04000128
_08001160: .4byte 0x04000120
_08001164: .4byte 0x04000202
_08001168: .4byte 0x0400010C
_0800116C: .4byte 0x00C0F318
_08001170: .4byte 0x04000208
_08001174:
	ldr r2, _080011A0 @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x81
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _080011A4 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
_08001194:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #2
	strb r0, [r5, #1]
	b _08001292
	.align 2, 0
_080011A0: .4byte 0x04000128
_080011A4: .4byte 0x04000208
_080011A8:
	ldr r6, [r5, #8]
	adds r4, r6, #0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _080011B8
	adds r4, r0, #0
	b _080011BE
_080011B8:
	cmp r6, #0
	bge _080011BE
	movs r4, #0
_080011BE:
	cmp r2, #0
	beq _080011C4
	str r4, [r2]
_080011C4:
	ldrb r0, [r5]
	cmp r0, #1
	beq _08001206
	ldr r0, [r5, #0x14]
	cmp r0, r4
	bge _080011EA
	adds r3, r5, #0
	ldr r7, [r5, #4]
_080011D4:
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
	blt _080011D4
_080011EA:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0800120E
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08001206
	movs r0, #1
	strb r0, [r5, #3]
_08001206:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	bgt _08001214
_0800120E:
	ldrb r0, [r5, #2]
	cmp r0, #0x8c
	bne _08001292
_08001214:
	movs r0, #3
	strb r0, [r5, #1]
	b _08001292
_0800121A:
	ldr r3, _0800126C @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _08001270 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001274 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _08001278 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	adds r0, #3
	str r0, [r1]
	ldr r2, _0800127C @ =0x04000120
	movs r0, #0
	movs r1, #0
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r5]
	cmp r0, #0
	beq _08001258
	ldr r1, _08001280 @ =0x0400010C
	movs r0, #0
	str r0, [r1]
_08001258:
	ldr r0, _08001284 @ =0x04000202
	movs r1, #0xc0
	strh r1, [r0]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800128E
	strb r4, [r5, #2]
	movs r0, #4
	strb r0, [r5, #1]
	b _08001292
	.align 2, 0
_0800126C: .4byte 0x04000208
_08001270: .4byte 0x04000200
_08001274: .4byte 0x0000FF3F
_08001278: .4byte 0x04000128
_0800127C: .4byte 0x04000120
_08001280: .4byte 0x0400010C
_08001284: .4byte 0x04000202
_08001288:
	ldrb r0, [r5, #2]
	cmp r0, #2
	bls _08001292
_0800128E:
	movs r0, #1
	b _0800129A
_08001292:
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	movs r0, #0
_0800129A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_80012A0
sub_80012A0: @ 0x080012A0
	push {r4, r5, lr}
	ldr r2, _080012C4 @ =0x04000120
	ldr r3, [r2]
	ldr r5, _080012C8 @ =gUnknown_03000790
	ldrb r0, [r5]
	adds r4, r5, #0
	cmp r0, #1
	beq _080012D0
	ldr r0, _080012CC @ =0x04000128
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	ldr r2, [r4, #8]
	cmp r2, #0
	bge _0800131C
	b _0800130A
	.align 2, 0
_080012C4: .4byte 0x04000120
_080012C8: .4byte gUnknown_03000790
_080012CC: .4byte 0x04000128
_080012D0:
	ldr r1, _080012E4 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4, #8]
	cmp r1, #0
	bge _080012EC
	ldr r0, _080012E8 @ =0xFEFEFEFE
	str r0, [r2]
	b _08001332
	.align 2, 0
_080012E4: .4byte 0x0400010E
_080012E8: .4byte 0xFEFEFEFE
_080012EC:
	ldr r0, _08001300 @ =0x00001FFF
	cmp r1, r0
	bgt _08001304
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _08001332
	.align 2, 0
_08001300: .4byte 0x00001FFF
_08001304:
	ldr r0, [r4, #0xc]
	str r0, [r2]
	b _08001332
_0800130A:
	ldr r0, _08001318 @ =0xFEFEFEFE
	cmp r3, r0
	beq _08001332
	subs r0, r2, #1
	str r0, [r5, #8]
	b _08001332
	.align 2, 0
_08001318: .4byte 0xFEFEFEFE
_0800131C:
	ldr r0, _0800132C @ =0x00001FFF
	cmp r2, r0
	bgt _08001330
	ldr r1, [r4, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	str r3, [r0]
	b _08001332
	.align 2, 0
_0800132C: .4byte 0x00001FFF
_08001330:
	str r3, [r4, #0xc]
_08001332:
	ldr r1, [r4, #8]
	ldr r0, _0800135C @ =0x00002002
	cmp r1, r0
	bgt _08001354
	adds r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r4]
	cmp r0, #1
	bne _08001354
	ldr r2, _08001360 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08001364 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_08001354:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800135C: .4byte 0x00002002
_08001360: .4byte 0x04000128
_08001364: .4byte 0x0400010E

	thumb_func_start sub_8001368
sub_8001368: @ 0x08001368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	ldr r3, _080013E4 @ =0x04000208
	strh r6, [r3]
	ldr r2, _080013E8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080013EC @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	mov r8, r0
	strh r0, [r3]
	str r6, [sp]
	ldr r4, _080013F0 @ =gUnknown_03000790
	ldr r2, _080013F4 @ =0x05000006
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _080013F8 @ =0x04000128
	ldr r0, _080013FC @ =0x00002003
	str r0, [r1]
	str r7, [r4, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #8]
	cmp r5, #0
	beq _080013D6
	ldr r0, _08001400 @ =0x0400010C
	str r6, [r0]
	mov r2, r8
	strb r2, [r4]
	adds r1, r7, #0
	movs r2, #0x80
	lsls r2, r2, #6
_080013B8:
	ldm r1!, {r0}
	adds r6, r6, r0
	subs r2, #1
	cmp r2, #0
	bne _080013B8
	mvns r0, r6
	str r0, [r4, #0xc]
	ldr r1, _080013F8 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
_080013D6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080013E4: .4byte 0x04000208
_080013E8: .4byte 0x04000200
_080013EC: .4byte 0x0000FF3F
_080013F0: .4byte gUnknown_03000790
_080013F4: .4byte 0x05000006
_080013F8: .4byte 0x04000128
_080013FC: .4byte 0x00002003
_08001400: .4byte 0x0400010C

	thumb_func_start sub_8001404
sub_8001404: @ 0x08001404
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0800145C @ =0x04000204
	ldr r2, _08001460 @ =0x00004014
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08001464 @ =gUnknown_03001840
	movs r1, #0
	str r1, [r2]
	ldr r0, _08001468 @ =gUnknown_03002790
	str r1, [r0]
	ldr r0, _0800146C @ =0x04000134
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	cmp r0, r1
	beq _0800144A
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r2]
	ldr r1, _08001470 @ =0x040000D4
	ldr r0, _08001474 @ =0x06010000
	str r0, [r1]
	ldr r0, _08001478 @ =gUnknown_0203B000
	str r0, [r1, #4]
	ldr r0, _0800147C @ =0x80002800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0800144A:
	ldr r0, _08001480 @ =gUnknown_03002290
	ldrh r0, [r0]
	cmp r0, #0xf
	bne _08001484
	ldr r0, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	b _0800148A
	.align 2, 0
_0800145C: .4byte 0x04000204
_08001460: .4byte 0x00004014
_08001464: .4byte gUnknown_03001840
_08001468: .4byte gUnknown_03002790
_0800146C: .4byte 0x04000134
_08001470: .4byte 0x040000D4
_08001474: .4byte 0x06010000
_08001478: .4byte gUnknown_0203B000
_0800147C: .4byte 0x80002800
_08001480: .4byte gUnknown_03002290
_08001484:
	ldr r0, [r2]
	ldr r1, _08001700 @ =0xFFFFEFFF
	ands r0, r1
_0800148A:
	str r0, [r2]
	movs r2, #0
	str r2, [sp]
	ldr r0, _08001704 @ =0x040000D4
	mov r3, sp
	str r3, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08001708 @ =0x85006000
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	str r3, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r3, _0800170C @ =0x85000100
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
	ldr r3, _08001710 @ =gUnknown_030026F4
	movs r1, #0xff
	strb r1, [r3]
	ldr r1, _08001714 @ =gUnknown_03002AE4
	strb r2, [r1]
	ldr r1, _08001718 @ =gUnknown_0300287C
	strb r2, [r1]
	ldr r1, _0800171C @ =gUnknown_03005390
	strb r2, [r1]
	ldr r1, _08001720 @ =gUnknown_03004D5C
	strb r2, [r1]
	ldr r1, _08001724 @ =gUnknown_03002A84
	strb r2, [r1]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _08001728 @ =gUnknown_03002280
	str r1, [r0, #4]
	ldr r3, _0800172C @ =0x85000004
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08001730 @ =gUnknown_03004D80
	str r2, [r1]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001734 @ =gUnknown_03002830
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08001738 @ =gUnknown_030017F4
	movs r4, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	ldr r3, _0800173C @ =gUnknown_03002840
	movs r1, #0x80
	strh r1, [r3]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _08001740 @ =gUnknown_030027A0
	str r1, [r0, #4]
	ldr r1, _08001744 @ =0x85000020
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08001748 @ =gUnknown_030018F0
	strb r4, [r1]
	ldr r1, _0800174C @ =gUnknown_03002AE0
	strb r4, [r1]
	add r3, sp, #4
	movs r1, #0x80
	lsls r1, r1, #2
	adds r5, r1, #0
	strh r5, [r3]
	str r3, [r0]
	ldr r1, _08001750 @ =gUnknown_03004D90
	str r1, [r0, #4]
	ldr r4, _08001754 @ =0x81000200
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	strh r5, [r3]
	str r3, [r0]
	ldr r1, _08001758 @ =gUnknown_030022D0
	str r1, [r0, #4]
	str r4, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #1
	rsbs r4, r4, #0
	str r4, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _0800175C @ =gUnknown_03001850
	str r1, [r0, #4]
	ldr r3, _08001760 @ =0x85000008
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r4, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001764 @ =gUnknown_03004D60
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r1, _08001768 @ =gUnknown_03002060
	str r1, [r0, #4]
	ldr r3, _0800176C @ =0x85000080
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001770 @ =gUnknown_03002880
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r0, _08001774 @ =gUnknown_03001920
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
	ldr r0, _08001778 @ =gUnknown_03001944
	strh r2, [r0]
	ldr r0, _0800177C @ =gUnknown_030017F0
	strh r1, [r0]
	ldr r0, _08001780 @ =gUnknown_03005394
	strh r1, [r0]
	ldr r0, _08001784 @ =gUnknown_03002A8C
	strh r2, [r0]
	ldr r0, _08001788 @ =gUnknown_03004D58
	strh r2, [r0]
	ldr r0, _0800178C @ =gUnknown_0300194C
	strh r2, [r0]
	ldr r0, _08001790 @ =gUnknown_03002820
	strh r2, [r0]
	ldr r0, _08001794 @ =gUnknown_03005398
	strh r1, [r0]
	ldr r0, _08001798 @ =gUnknown_03002270
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r0, _0800179C @ =gUnknown_030018E8
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, _080017A0 @ =gUnknown_030026D0
	strh r2, [r0]
	ldr r0, _080017A4 @ =gUnknown_030053B8
	str r2, [r0]
	ldr r3, _080017A8 @ =gUnknown_030053C0
	mov sb, r3
	ldr r0, _080017AC @ =gUnknown_03001880
	mov sl, r0
	ldr r1, _080017B0 @ =gUnknown_030053B0
	mov ip, r1
	ldr r3, _080017B4 @ =gUnknown_03002264
	mov r8, r3
	ldr r7, _080017B8 @ =gUnknown_03001B60
	ldr r6, _080017BC @ =gUnknown_03002700
	movs r5, #0x14
	ldr r4, _080017C0 @ =gUnknown_03002850
	movs r3, #8
_080015FC:
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
	ble _080015FC
	movs r0, #0
	mov r1, sb
	strb r0, [r1, #8]
	mov r2, sl
	strh r0, [r2]
	mov r3, ip
	str r0, [r3]
	mov r1, r8
	str r0, [r1]
	movs r2, #0
	ldr r4, _080017C4 @ =gUnknown_030007B0
	ldr r3, _080017C8 @ =gUnknown_08097A2C
_0800162C:
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
	ble _0800162C
	movs r2, #0
	str r2, [sp]
	ldr r0, _08001704 @ =0x040000D4
	mov r3, sp
	str r3, [r0]
	str r7, [r0, #4]
	ldr r1, _080017CC @ =0x85000140
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080017D0 @ =gUnknown_03001884
	str r7, [r1]
	movs r3, #0xa0
	lsls r3, r3, #2
	adds r1, r7, r3
	ldr r3, _080017D4 @ =gUnknown_030022AC
	str r1, [r3]
	ldr r1, _080017D8 @ =gUnknown_03002878
	str r2, [r1]
	ldr r3, _080017DC @ =gUnknown_03002A80
	strb r2, [r3]
	ldr r1, _080017E0 @ =gUnknown_0300188C
	strb r2, [r1]
	ldr r3, _080017E4 @ =gUnknown_030018E0
	strb r2, [r3]
	str r2, [sp]
	mov r1, sp
	str r1, [r0]
	ldr r3, _080017E8 @ =gUnknown_030026E0
	str r3, [r0, #4]
	ldr r1, _0800172C @ =0x85000004
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r3, _080017EC @ =gUnknown_03002AF0
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	ldr r3, _080017F0 @ =gUnknown_03004D50
	strb r2, [r3]
	ldr r3, _080017F4 @ =gUnknown_03001948
	strb r2, [r3]
	str r2, [sp]
	mov r3, sp
	str r3, [r0]
	ldr r3, _080017F8 @ =gUnknown_03001870
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r3, [r0, #8]
	str r2, [sp]
	mov r2, sp
	str r2, [r0]
	ldr r3, _080017FC @ =gUnknown_030053A0
	str r3, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	bl sub_80952A8
	ldr r0, _08001800 @ =0x0093F500
	bl sub_8095844
	ldr r1, _08001804 @ =gUnknown_030053B4
	movs r0, #1
	strb r0, [r1]
	bl sub_8002504
	bl sub_8007B2C
	ldr r1, _08001808 @ =gUnknown_03001888
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0800180C @ =gUnknown_03001940
	ldr r0, _08001810 @ =0x06013A00
	str r0, [r1]
	bl sub_8007CC8
	bl sub_8096C9C
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080016F0
	b _08001818
_080016F0:
	ldr r0, _08001814 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	orrs r1, r2
	str r1, [r0]
	b _08001820
	.align 2, 0
_08001700: .4byte 0xFFFFEFFF
_08001704: .4byte 0x040000D4
_08001708: .4byte 0x85006000
_0800170C: .4byte 0x85000100
_08001710: .4byte gUnknown_030026F4
_08001714: .4byte gUnknown_03002AE4
_08001718: .4byte gUnknown_0300287C
_0800171C: .4byte gUnknown_03005390
_08001720: .4byte gUnknown_03004D5C
_08001724: .4byte gUnknown_03002A84
_08001728: .4byte gUnknown_03002280
_0800172C: .4byte 0x85000004
_08001730: .4byte gUnknown_03004D80
_08001734: .4byte gUnknown_03002830
_08001738: .4byte gUnknown_030017F4
_0800173C: .4byte gUnknown_03002840
_08001740: .4byte gUnknown_030027A0
_08001744: .4byte 0x85000020
_08001748: .4byte gUnknown_030018F0
_0800174C: .4byte gUnknown_03002AE0
_08001750: .4byte gUnknown_03004D90
_08001754: .4byte 0x81000200
_08001758: .4byte gUnknown_030022D0
_0800175C: .4byte gUnknown_03001850
_08001760: .4byte 0x85000008
_08001764: .4byte gUnknown_03004D60
_08001768: .4byte gUnknown_03002060
_0800176C: .4byte 0x85000080
_08001770: .4byte gUnknown_03002880
_08001774: .4byte gUnknown_03001920
_08001778: .4byte gUnknown_03001944
_0800177C: .4byte gUnknown_030017F0
_08001780: .4byte gUnknown_03005394
_08001784: .4byte gUnknown_03002A8C
_08001788: .4byte gUnknown_03004D58
_0800178C: .4byte gUnknown_0300194C
_08001790: .4byte gUnknown_03002820
_08001794: .4byte gUnknown_03005398
_08001798: .4byte gUnknown_03002270
_0800179C: .4byte gUnknown_030018E8
_080017A0: .4byte gUnknown_030026D0
_080017A4: .4byte gUnknown_030053B8
_080017A8: .4byte gUnknown_030053C0
_080017AC: .4byte gUnknown_03001880
_080017B0: .4byte gUnknown_030053B0
_080017B4: .4byte gUnknown_03002264
_080017B8: .4byte gUnknown_03001B60
_080017BC: .4byte gUnknown_03002700
_080017C0: .4byte gUnknown_03002850
_080017C4: .4byte gUnknown_030007B0
_080017C8: .4byte gUnknown_08097A2C
_080017CC: .4byte 0x85000140
_080017D0: .4byte gUnknown_03001884
_080017D4: .4byte gUnknown_030022AC
_080017D8: .4byte gUnknown_03002878
_080017DC: .4byte gUnknown_03002A80
_080017E0: .4byte gUnknown_0300188C
_080017E4: .4byte gUnknown_030018E0
_080017E8: .4byte gUnknown_030026E0
_080017EC: .4byte gUnknown_03002AF0
_080017F0: .4byte gUnknown_03004D50
_080017F4: .4byte gUnknown_03001948
_080017F8: .4byte gUnknown_03001870
_080017FC: .4byte gUnknown_030053A0
_08001800: .4byte 0x0093F500
_08001804: .4byte gUnknown_030053B4
_08001808: .4byte gUnknown_03001888
_0800180C: .4byte gUnknown_03001940
_08001810: .4byte 0x06013A00
_08001814: .4byte gUnknown_03001840
_08001818:
	ldr r1, _08001884 @ =gUnknown_030007C4
	movs r0, #1
	bl sub_8096884
_08001820:
	ldr r1, _08001888 @ =0x040000D4
	ldr r0, _0800188C @ =intr_main
	str r0, [r1]
	ldr r2, _08001890 @ =gUnknown_030007F0
	str r2, [r1, #4]
	ldr r0, _08001894 @ =0x84000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08001898 @ =gUnknown_03007FFC
	str r2, [r0]
	ldr r0, _0800189C @ =0x04000208
	movs r2, #1
	strh r2, [r0]
	subs r0, #8
	strh r2, [r0]
	ldr r2, _080018A0 @ =0x04000004
	movs r0, #0x18
	strh r0, [r2]
	movs r2, #0
	str r2, [sp]
	mov r3, sp
	str r3, [r1]
	ldr r0, _080018A4 @ =gUnknown_03002860
	str r0, [r1, #4]
	ldr r0, _080018A8 @ =0x85000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp]
	str r3, [r1]
	ldr r0, _080018AC @ =gUnknown_03001890
	str r0, [r1, #4]
	ldr r0, _080018B0 @ =0x85000014
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080018B4 @ =gUnknown_03001950
	str r2, [r0]
	ldr r0, _080018B8 @ =gUnknown_03001954
	strb r2, [r0]
	movs r0, #0
	bl sub_800032C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001884: .4byte gUnknown_030007C4
_08001888: .4byte 0x040000D4
_0800188C: .4byte intr_main
_08001890: .4byte gUnknown_030007F0
_08001894: .4byte 0x84000080
_08001898: .4byte gUnknown_03007FFC
_0800189C: .4byte 0x04000208
_080018A0: .4byte 0x04000004
_080018A4: .4byte gUnknown_03002860
_080018A8: .4byte 0x85000005
_080018AC: .4byte gUnknown_03001890
_080018B0: .4byte 0x85000014
_080018B4: .4byte gUnknown_03001950
_080018B8: .4byte gUnknown_03001954

	thumb_func_start sub_80018BC
sub_80018BC: @ 0x080018BC
	push {r4, r5, r6, lr}
	ldr r6, _0800192C @ =gUnknown_03001840
	movs r5, #0x80
	lsls r5, r5, #3
_080018C4:
	ldr r1, _08001930 @ =gUnknown_030053B4
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _080018DA
	bl sub_8095320
_080018DA:
	ldr r0, _08001934 @ =gUnknown_030026F4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08001900
	bl sub_800227C
	ldr r0, _08001938 @ =gUnknown_03001954
	ldrb r0, [r0]
	cmp r0, #0
	beq _080018FC
	ldr r0, _0800193C @ =gUnknown_03002860
	ldr r1, _08001940 @ =gUnknown_03001890
	movs r2, #0
	bl sub_8000420
	ldr r1, _08001944 @ =gUnknown_03001950
	str r0, [r1]
_080018FC:
	bl sub_8002724
_08001900:
	ldr r1, _08001948 @ =gUnknown_03002790
	ldr r4, _0800192C @ =gUnknown_03001840
	ldr r0, [r4]
	str r0, [r1]
	bl VBlankIntrWait
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0800194C
	bl sub_8001D78
	ldr r0, [r4]
	ands r0, r5
	cmp r0, #0
	bne _08001968
	bl sub_8002450
	b _0800195C
	.align 2, 0
_0800192C: .4byte gUnknown_03001840
_08001930: .4byte gUnknown_030053B4
_08001934: .4byte gUnknown_030026F4
_08001938: .4byte gUnknown_03001954
_0800193C: .4byte gUnknown_03002860
_08001940: .4byte gUnknown_03001890
_08001944: .4byte gUnknown_03001950
_08001948: .4byte gUnknown_03002790
_0800194C:
	bl sub_80019A0
	ldr r0, [r4]
	ands r0, r5
	cmp r0, #0
	bne _08001968
	bl sub_8001C90
_0800195C:
	ldr r2, _08001974 @ =gUnknown_03001840
	ldr r1, [r2]
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	beq _08001978
_08001968:
	ldr r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r6]
	b _0800197E
	.align 2, 0
_08001974: .4byte gUnknown_03001840
_08001978:
	ldr r0, _08001998 @ =0xFFFFF7FF
	ands r1, r0
	str r1, [r2]
_0800197E:
	ldr r2, _0800199C @ =0x04000004
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080018C4
	movs r3, #1
_0800198C:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0800198C
	b _080018C4
	.align 2, 0
_08001998: .4byte 0xFFFFF7FF
_0800199C: .4byte 0x04000004

	thumb_func_start sub_80019A0
sub_80019A0: @ 0x080019A0
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08001A90 @ =gUnknown_03002840
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08001A94 @ =0x040000D4
	ldr r0, _08001A98 @ =gUnknown_030022B0
	str r0, [r3]
	ldr r0, _08001A9C @ =0x04000008
	str r0, [r3, #4]
	ldr r0, _08001AA0 @ =0x84000002
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _08001AA4 @ =gUnknown_03001840
	ldr r2, [r1]
	movs r5, #1
	adds r0, r2, #0
	ands r0, r5
	adds r6, r1, #0
	cmp r0, #0
	beq _080019E4
	ldr r0, _08001AA8 @ =gUnknown_03002880
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08001AAC @ =0x84000080
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	eors r2, r5
	str r2, [r6]
_080019E4:
	ldr r0, [r6]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08001A02
	ldr r0, _08001AB0 @ =gUnknown_03002060
	str r0, [r3]
	ldr r0, _08001AB4 @ =0x05000200
	str r0, [r3, #4]
	ldr r0, _08001AAC @ =0x84000080
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [r6]
	eors r0, r1
	str r0, [r6]
_08001A02:
	ldr r0, _08001AB8 @ =gUnknown_03002270
	str r0, [r3]
	ldr r0, _08001ABC @ =0x04000040
	str r0, [r3, #4]
	ldr r0, _08001AC0 @ =0x84000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AC4 @ =gUnknown_030018E8
	str r0, [r3]
	ldr r0, _08001AC8 @ =0x04000050
	str r0, [r3, #4]
	ldr r0, _08001ACC @ =0x80000003
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AD0 @ =gUnknown_030026D0
	str r0, [r3]
	ldr r0, _08001AD4 @ =0x0400004C
	str r0, [r3, #4]
	ldr r0, _08001AD8 @ =0x80000002
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001ADC @ =gUnknown_03002830
	str r0, [r3]
	ldr r0, _08001AE0 @ =0x04000010
	str r0, [r3, #4]
	ldr r0, _08001AE4 @ =0x80000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _08001AE8 @ =gUnknown_03001920
	str r0, [r3]
	ldr r0, _08001AEC @ =0x04000020
	str r0, [r3, #4]
	ldr r0, _08001AF0 @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, [r6]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08001B0C
	ldr r2, _08001AF4 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	str r4, [sp]
	mov r0, sp
	str r0, [r3]
	ldr r1, _08001AF8 @ =gUnknown_03002AF0
	str r1, [r3, #4]
	ldr r0, _08001AFC @ =0x85000004
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08001B00 @ =gUnknown_0300188C
	ldrb r0, [r2]
	cmp r0, #0
	beq _08001A86
	ldr r0, _08001B04 @ =gUnknown_030026E0
	str r0, [r3]
	str r1, [r3, #4]
	ldrb r0, [r2]
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08001A86:
	ldr r1, _08001B08 @ =gUnknown_030018E0
	ldrb r0, [r2]
	strb r0, [r1]
	b _08001B1A
	.align 2, 0
_08001A90: .4byte gUnknown_03002840
_08001A94: .4byte 0x040000D4
_08001A98: .4byte gUnknown_030022B0
_08001A9C: .4byte 0x04000008
_08001AA0: .4byte 0x84000002
_08001AA4: .4byte gUnknown_03001840
_08001AA8: .4byte gUnknown_03002880
_08001AAC: .4byte 0x84000080
_08001AB0: .4byte gUnknown_03002060
_08001AB4: .4byte 0x05000200
_08001AB8: .4byte gUnknown_03002270
_08001ABC: .4byte 0x04000040
_08001AC0: .4byte 0x84000003
_08001AC4: .4byte gUnknown_030018E8
_08001AC8: .4byte 0x04000050
_08001ACC: .4byte 0x80000003
_08001AD0: .4byte gUnknown_030026D0
_08001AD4: .4byte 0x0400004C
_08001AD8: .4byte 0x80000002
_08001ADC: .4byte gUnknown_03002830
_08001AE0: .4byte 0x04000010
_08001AE4: .4byte 0x80000008
_08001AE8: .4byte gUnknown_03001920
_08001AEC: .4byte 0x04000020
_08001AF0: .4byte 0x84000008
_08001AF4: .4byte 0x04000200
_08001AF8: .4byte gUnknown_03002AF0
_08001AFC: .4byte 0x85000004
_08001B00: .4byte gUnknown_0300188C
_08001B04: .4byte gUnknown_030026E0
_08001B08: .4byte gUnknown_030018E0
_08001B0C:
	ldr r2, _08001BF8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001BFC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08001C00 @ =gUnknown_030018E0
	strb r4, [r0]
_08001B1A:
	ldr r0, [r6]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08001B42
	ldr r2, _08001C04 @ =0x040000D4
	ldr r0, _08001C08 @ =gUnknown_03001884
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08001C0C @ =gUnknown_03002878
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _08001C10 @ =gUnknown_03002A80
	ldrb r0, [r0]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08001B42:
	ldr r0, _08001C14 @ =gUnknown_030026F4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08001B90
	bl sub_800594C
	ldr r0, _08001C04 @ =0x040000D4
	ldr r3, _08001C18 @ =gUnknown_03004D90
	str r3, [r0]
	movs r1, #0xe0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r2, _08001C1C @ =0x80000080
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _08001C20 @ =0x07000100
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _08001C24 @ =0x07000200
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _08001C28 @ =0x07000300
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08001B90:
	movs r4, #0
	ldr r0, _08001C2C @ =gUnknown_03001948
	ldrb r1, [r0]
	cmp r4, r1
	bhs _08001BB4
	ldr r6, _08001C30 @ =gUnknown_030053A0
	adds r5, r0, #0
_08001B9E:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _08001B9E
_08001BB4:
	ldr r0, _08001C34 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08001C44
	movs r0, #0
	str r0, [sp]
	ldr r2, _08001C04 @ =0x040000D4
	mov r1, sp
	str r1, [r2]
	ldr r1, _08001C30 @ =gUnknown_030053A0
	str r1, [r2, #4]
	ldr r0, _08001C38 @ =0x85000004
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r3, _08001C3C @ =gUnknown_03004D50
	ldrb r0, [r3]
	cmp r0, #0
	beq _08001BEE
	ldr r0, _08001C40 @ =gUnknown_03001870
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	movs r1, #0x84
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08001BEE:
	ldr r1, _08001C2C @ =gUnknown_03001948
	ldrb r0, [r3]
	strb r0, [r1]
	b _08001C48
	.align 2, 0
_08001BF8: .4byte 0x04000200
_08001BFC: .4byte 0x0000FFFD
_08001C00: .4byte gUnknown_030018E0
_08001C04: .4byte 0x040000D4
_08001C08: .4byte gUnknown_03001884
_08001C0C: .4byte gUnknown_03002878
_08001C10: .4byte gUnknown_03002A80
_08001C14: .4byte gUnknown_030026F4
_08001C18: .4byte gUnknown_03004D90
_08001C1C: .4byte 0x80000080
_08001C20: .4byte 0x07000100
_08001C24: .4byte 0x07000200
_08001C28: .4byte 0x07000300
_08001C2C: .4byte gUnknown_03001948
_08001C30: .4byte gUnknown_030053A0
_08001C34: .4byte gUnknown_03001840
_08001C38: .4byte 0x85000004
_08001C3C: .4byte gUnknown_03004D50
_08001C40: .4byte gUnknown_03001870
_08001C44:
	ldr r0, _08001C5C @ =gUnknown_03001948
	strb r1, [r0]
_08001C48:
	ldr r1, _08001C60 @ =gUnknown_030026F4
	ldrb r4, [r1]
	cmp r4, #0xff
	bne _08001C52
	movs r4, #0
_08001C52:
	movs r0, #0xff
	strb r0, [r1]
	ldr r5, _08001C64 @ =gUnknown_08097A64
	b _08001C6E
	.align 2, 0
_08001C5C: .4byte gUnknown_03001948
_08001C60: .4byte gUnknown_030026F4
_08001C64: .4byte gUnknown_08097A64
_08001C68:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08001C6E:
	cmp r4, #3
	bhi _08001C84
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	bne _08001C68
	ldr r0, _08001C8C @ =gUnknown_030026F4
	strb r4, [r0]
_08001C84:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001C8C: .4byte gUnknown_030026F4

	thumb_func_start sub_8001C90
sub_8001C90: @ 0x08001C90
	push {r4, lr}
	sub sp, #4
	ldr r1, _08001CC8 @ =gUnknown_0300188C
	movs r0, #0
	strb r0, [r1]
	ldr r2, _08001CCC @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r1, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08001CEA
	ldr r3, _08001CD0 @ =gUnknown_03001884
	ldr r0, _08001CD4 @ =gUnknown_03004D54
	ldr r1, [r3]
	ldr r2, [r0]
	cmp r1, r2
	bne _08001CE0
	ldr r0, _08001CD8 @ =gUnknown_030022C0
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _08001CDC @ =gUnknown_030022AC
	str r2, [r0]
	b _08001CEA
	.align 2, 0
_08001CC8: .4byte gUnknown_0300188C
_08001CCC: .4byte gUnknown_03001840
_08001CD0: .4byte gUnknown_03001884
_08001CD4: .4byte gUnknown_03004D54
_08001CD8: .4byte gUnknown_030022C0
_08001CDC: .4byte gUnknown_030022AC
_08001CE0:
	str r2, [r3]
	ldr r0, _08001D60 @ =gUnknown_030022AC
	ldr r1, _08001D64 @ =gUnknown_030022C0
	ldr r1, [r1]
	str r1, [r0]
_08001CEA:
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
	ldr r0, _08001D68 @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _08001D6C @ =gUnknown_03004D90
	mov ip, r1
	str r1, [r0, #4]
	ldr r2, _08001D70 @ =0x81000080
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
	ldr r1, _08001D74 @ =gUnknown_03004D50
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
_08001D60: .4byte gUnknown_030022AC
_08001D64: .4byte gUnknown_030022C0
_08001D68: .4byte 0x040000D4
_08001D6C: .4byte gUnknown_03004D90
_08001D70: .4byte 0x81000080
_08001D74: .4byte gUnknown_03004D50

	thumb_func_start sub_8001D78
sub_8001D78: @ 0x08001D78
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r4, #0
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08001E3C @ =gUnknown_03002840
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08001E40 @ =gUnknown_030022B0
	ldr r7, _08001E44 @ =0x04000008
	ldr r2, _08001E48 @ =0x04000002
	adds r1, r7, #0
	bl CpuSet
	ldr r5, _08001E4C @ =gUnknown_03001840
	ldr r0, [r5]
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	beq _08001DB2
	ldr r0, _08001E50 @ =gUnknown_03002880
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, [r5]
	eors r0, r6
	str r0, [r5]
_08001DB2:
	ldr r0, [r5]
	movs r6, #2
	ands r0, r6
	cmp r0, #0
	beq _08001DCC
	ldr r0, _08001E54 @ =gUnknown_03002060
	ldr r1, _08001E58 @ =0x05000200
	movs r2, #0x80
	bl CpuFastSet
	ldr r0, [r5]
	eors r0, r6
	str r0, [r5]
_08001DCC:
	ldr r0, _08001E5C @ =gUnknown_03002270
	ldr r1, _08001E60 @ =0x04000040
	ldr r2, _08001E64 @ =0x04000003
	bl CpuSet
	ldr r0, _08001E68 @ =gUnknown_030018E8
	ldr r1, _08001E6C @ =0x04000050
	movs r2, #3
	bl CpuSet
	ldr r0, _08001E70 @ =gUnknown_030026D0
	ldr r1, _08001E74 @ =0x0400004C
	movs r2, #2
	bl CpuSet
	ldr r0, _08001E78 @ =gUnknown_03002830
	ldr r1, _08001E7C @ =0x04000010
	movs r2, #8
	bl CpuSet
	ldr r0, _08001E80 @ =gUnknown_03001920
	ldr r1, _08001E84 @ =0x04000020
	adds r2, r7, #0
	bl CpuSet
	ldr r0, [r5]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08001EA0
	ldr r2, _08001E88 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	str r4, [sp]
	ldr r5, _08001E8C @ =gUnknown_03002AF0
	ldr r2, _08001E90 @ =0x01000004
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	ldr r4, _08001E94 @ =gUnknown_0300188C
	ldrb r0, [r4]
	cmp r0, #0
	beq _08001E32
	ldr r0, _08001E98 @ =gUnknown_030026E0
	ldrb r2, [r4]
	adds r1, r5, #0
	bl CpuFastSet
_08001E32:
	ldr r1, _08001E9C @ =gUnknown_030018E0
	ldrb r0, [r4]
	strb r0, [r1]
	b _08001EAE
	.align 2, 0
_08001E3C: .4byte gUnknown_03002840
_08001E40: .4byte gUnknown_030022B0
_08001E44: .4byte 0x04000008
_08001E48: .4byte 0x04000002
_08001E4C: .4byte gUnknown_03001840
_08001E50: .4byte gUnknown_03002880
_08001E54: .4byte gUnknown_03002060
_08001E58: .4byte 0x05000200
_08001E5C: .4byte gUnknown_03002270
_08001E60: .4byte 0x04000040
_08001E64: .4byte 0x04000003
_08001E68: .4byte gUnknown_030018E8
_08001E6C: .4byte 0x04000050
_08001E70: .4byte gUnknown_030026D0
_08001E74: .4byte 0x0400004C
_08001E78: .4byte gUnknown_03002830
_08001E7C: .4byte 0x04000010
_08001E80: .4byte gUnknown_03001920
_08001E84: .4byte 0x04000020
_08001E88: .4byte 0x04000200
_08001E8C: .4byte gUnknown_03002AF0
_08001E90: .4byte 0x01000004
_08001E94: .4byte gUnknown_0300188C
_08001E98: .4byte gUnknown_030026E0
_08001E9C: .4byte gUnknown_030018E0
_08001EA0:
	ldr r2, _08001F24 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001F28 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08001F2C @ =gUnknown_030018E0
	strb r4, [r0]
_08001EAE:
	ldr r0, _08001F30 @ =gUnknown_030026F4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08001EC8
	bl sub_800594C
	ldr r0, _08001F34 @ =gUnknown_03004D90
	movs r1, #0xe0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
_08001EC8:
	movs r4, #0
	ldr r0, _08001F38 @ =gUnknown_03001948
	ldrb r1, [r0]
	cmp r4, r1
	bhs _08001EEC
	ldr r6, _08001F3C @ =gUnknown_030053A0
	adds r5, r0, #0
_08001ED6:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r5]
	cmp r4, r0
	blo _08001ED6
_08001EEC:
	ldr r0, _08001F40 @ =gUnknown_03001840
	ldr r1, [r0]
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08001F50
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r5, _08001F3C @ =gUnknown_030053A0
	ldr r2, _08001F44 @ =0x01000004
	adds r1, r5, #0
	bl CpuFastSet
	ldr r4, _08001F48 @ =gUnknown_03004D50
	ldrb r0, [r4]
	cmp r0, #0
	beq _08001F1A
	ldr r0, _08001F4C @ =gUnknown_03001870
	ldrb r2, [r4]
	adds r1, r5, #0
	bl CpuFastSet
_08001F1A:
	ldr r1, _08001F38 @ =gUnknown_03001948
	ldrb r0, [r4]
	strb r0, [r1]
	b _08001F54
	.align 2, 0
_08001F24: .4byte 0x04000200
_08001F28: .4byte 0x0000FFFD
_08001F2C: .4byte gUnknown_030018E0
_08001F30: .4byte gUnknown_030026F4
_08001F34: .4byte gUnknown_03004D90
_08001F38: .4byte gUnknown_03001948
_08001F3C: .4byte gUnknown_030053A0
_08001F40: .4byte gUnknown_03001840
_08001F44: .4byte 0x01000004
_08001F48: .4byte gUnknown_03004D50
_08001F4C: .4byte gUnknown_03001870
_08001F50:
	ldr r0, _08001F68 @ =gUnknown_03001948
	strb r1, [r0]
_08001F54:
	ldr r1, _08001F6C @ =gUnknown_030026F4
	ldrb r4, [r1]
	cmp r4, #0xff
	bne _08001F5E
	movs r4, #0
_08001F5E:
	movs r0, #0xff
	strb r0, [r1]
	ldr r5, _08001F70 @ =gUnknown_08097A64
	b _08001F7A
	.align 2, 0
_08001F68: .4byte gUnknown_03001948
_08001F6C: .4byte gUnknown_030026F4
_08001F70: .4byte gUnknown_08097A64
_08001F74:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08001F7A:
	cmp r4, #3
	bhi _08001F90
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	bne _08001F74
	ldr r0, _08001F98 @ =gUnknown_030026F4
	strb r4, [r0]
_08001F90:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001F98: .4byte gUnknown_030026F4

	thumb_func_start sub_8001F9C
sub_8001F9C: @ 0x08001F9C
	push {r4, r5, r6, lr}
	ldr r4, _08002028 @ =0x040000B0
	ldrh r1, [r4, #0xa]
	ldr r0, _0800202C @ =0x0000C5FF
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xa]
	ldr r0, _08002030 @ =0x00007FFF
	ands r0, r1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	bl sub_8094C4C
	ldr r1, _08002034 @ =gUnknown_03007FF8
	ldrh r0, [r1]
	movs r2, #1
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _08002038 @ =gUnknown_030053B4
	strb r2, [r0]
	ldr r5, _0800203C @ =gUnknown_03002790
	ldr r3, [r5]
	movs r0, #4
	ands r3, r0
	cmp r3, #0
	beq _08002054
	ldr r2, _08002040 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	adds r2, r4, #0
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	adds r6, r5, #0
	ldr r4, _08002044 @ =gUnknown_03001884
	ldr r5, _08002048 @ =gUnknown_03002878
	ldr r3, _0800204C @ =gUnknown_03002A80
	cmp r0, #0
	bge _08001FF6
_08001FEE:
	ldr r0, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _08001FEE
_08001FF6:
	ldr r2, _08002028 @ =0x040000B0
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
	ldr r1, _08002050 @ =0xA2600000
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0800206A
	.align 2, 0
_08002028: .4byte 0x040000B0
_0800202C: .4byte 0x0000C5FF
_08002030: .4byte 0x00007FFF
_08002034: .4byte gUnknown_03007FF8
_08002038: .4byte gUnknown_030053B4
_0800203C: .4byte gUnknown_03002790
_08002040: .4byte 0x04000200
_08002044: .4byte gUnknown_03001884
_08002048: .4byte gUnknown_03002878
_0800204C: .4byte gUnknown_03002A80
_08002050: .4byte 0xA2600000
_08002054:
	ldr r4, _080020AC @ =gUnknown_03002878
	ldr r0, [r4]
	adds r6, r5, #0
	cmp r0, #0
	beq _0800206A
	ldr r2, _080020B0 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080020B4 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	str r3, [r4]
_0800206A:
	ldr r0, [r6]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080020C4
	ldr r2, _080020B8 @ =0x04000004
	ldrh r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080020BC @ =gUnknown_03002874
	ldrb r0, [r0]
	lsls r0, r0, #8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r2]
	ldr r0, _080020C0 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	orrs r0, r3
	strh r0, [r2]
	ldr r2, _080020B0 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	b _080020E0
	.align 2, 0
_080020AC: .4byte gUnknown_03002878
_080020B0: .4byte 0x04000200
_080020B4: .4byte 0x0000FFFD
_080020B8: .4byte 0x04000004
_080020BC: .4byte gUnknown_03002874
_080020C0: .4byte 0x0000FFFB
_080020C4:
	ldr r2, _08002190 @ =0x04000004
	ldrh r3, [r2]
	ldr r1, _08002194 @ =0x0000FFFB
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2]
	ldr r0, _08002198 @ =0x0000FFDF
	ands r0, r3
	strh r0, [r2]
	ldr r2, _0800219C @ =0x04000200
	ldrh r0, [r2]
	ands r1, r0
	strh r1, [r2]
_080020E0:
	ldr r2, [r6]
	movs r3, #0x80
	lsls r3, r3, #8
	ands r2, r3
	cmp r2, #0
	bne _0800217A
	ldr r0, _080021A0 @ =0x04000130
	ldrh r1, [r0]
	movs r0, #0xf
	adds r5, r0, #0
	bics r5, r1
	cmp r5, #0xf
	bne _0800217A
	ldr r4, _080021A4 @ =gUnknown_03001840
	ldr r0, [r4]
	orrs r0, r3
	str r0, [r4]
	ldr r0, _0800219C @ =0x04000200
	strh r2, [r0]
	adds r0, #8
	strh r2, [r0]
	ldr r0, _08002190 @ =0x04000004
	strh r2, [r0]
	bl sub_8095460
	bl sub_8095930
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	ldr r1, _080021A8 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _080021AC @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _080021B0 @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _080021B4 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	ldr r0, _080021B8 @ =gUnknown_03002290
	strh r5, [r0]
	movs r0, #0x20
	bl sub_08097134
_0800217A:
	ldr r1, _080021BC @ =gUnknown_03002264
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _080021C0 @ =0x04000202
	movs r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002190: .4byte 0x04000004
_08002194: .4byte 0x0000FFFB
_08002198: .4byte 0x0000FFDF
_0800219C: .4byte 0x04000200
_080021A0: .4byte 0x04000130
_080021A4: .4byte gUnknown_03001840
_080021A8: .4byte 0x040000B0
_080021AC: .4byte 0x0000C5FF
_080021B0: .4byte 0x00007FFF
_080021B4: .4byte 0x040000D4
_080021B8: .4byte gUnknown_03002290
_080021BC: .4byte gUnknown_03002264
_080021C0: .4byte 0x04000202

	thumb_func_start sub_80021C4
sub_80021C4: @ 0x080021C4
	push {r4, r5, r6, r7, lr}
	ldr r2, _08002210 @ =gUnknown_03004D5C
	ldr r0, _08002214 @ =gUnknown_03002A84
	ldrb r1, [r2]
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r1, r0
	beq _08002272
	ldr r1, _08002218 @ =gUnknown_030027A0
	mov ip, r1
	adds r6, r2, #0
_080021DA:
	ldrb r0, [r6]
	lsls r0, r0, #2
	add r0, ip
	ldr r2, [r0]
	ldrh r0, [r2, #8]
	cmp r0, #0
	beq _0800224E
	movs r4, #0
	movs r5, #0x80
	lsls r5, r5, #3
	ldr r3, _0800221C @ =0x040000D4
_080021F0:
	cmp r0, r5
	bls _08002228
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r3]
	ldr r0, [r2, #4]
	adds r0, r0, r4
	str r0, [r3, #4]
	ldr r0, _08002220 @ =0x80000200
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r1, _08002224 @ =0xFFFFFC00
	adds r0, r1, #0
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	b _08002244
	.align 2, 0
_08002210: .4byte gUnknown_03004D5C
_08002214: .4byte gUnknown_03002A84
_08002218: .4byte gUnknown_030027A0
_0800221C: .4byte 0x040000D4
_08002220: .4byte 0x80000200
_08002224: .4byte 0xFFFFFC00
_08002228:
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
_08002244:
	strh r0, [r2, #8]
	adds r4, r4, r5
	ldrh r0, [r2, #8]
	cmp r0, #0
	bne _080021F0
_0800224E:
	ldrb r0, [r6]
	adds r2, r0, #1
	movs r0, #0x1f
	ands r2, r0
	strb r2, [r6]
	ldr r0, _08002268 @ =0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800226C
	movs r0, #0
	b _08002274
	.align 2, 0
_08002268: .4byte 0x04000004
_0800226C:
	ldrb r0, [r7]
	cmp r2, r0
	bne _080021DA
_08002272:
	movs r0, #1
_08002274:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_800227C
sub_800227C: @ 0x0800227C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r7, _080022B0 @ =gUnknown_030022A0
	ldr r0, _080022B4 @ =gUnknown_03002700
	mov sb, r0
	ldr r1, _080022B8 @ =gUnknown_03002850
	mov r8, r1
	ldr r4, _080022BC @ =gUnknown_03002290
	ldr r0, _080022C0 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _080022C4 @ =0x000003FF
	adds r0, r2, #0
	bics r0, r1
	strh r0, [r4]
	ldr r1, _080022C8 @ =gUnknown_03001880
	strh r0, [r1]
	ldr r0, _080022CC @ =gUnknown_030053C0
	ldrb r0, [r0, #8]
	cmp r0, #1
	bne _080022D0
	ldrh r0, [r4]
	bl sub_8007DBC
	b _080022DA
	.align 2, 0
_080022B0: .4byte gUnknown_030022A0
_080022B4: .4byte gUnknown_03002700
_080022B8: .4byte gUnknown_03002850
_080022BC: .4byte gUnknown_03002290
_080022C0: .4byte 0x04000130
_080022C4: .4byte 0x000003FF
_080022C8: .4byte gUnknown_03001880
_080022CC: .4byte gUnknown_030053C0
_080022D0:
	cmp r0, #2
	bne _080022DA
	bl sub_8007D8C
	strh r0, [r4]
_080022DA:
	ldr r2, _08002320 @ =gUnknown_03002ADC
	ldr r6, _08002324 @ =gUnknown_03002290
	ldr r5, _08002328 @ =gUnknown_03002A88
	ldrh r3, [r6]
	ldrh r4, [r5]
	adds r0, r3, #0
	eors r0, r4
	adds r1, r0, #0
	ands r1, r3
	strh r1, [r2]
	ldr r2, _0800232C @ =gUnknown_0300270C
	ands r0, r4
	strh r0, [r2]
	strh r3, [r5]
	ldr r0, _08002330 @ =gUnknown_030022B8
	strh r1, [r0]
	movs r1, #0
	mov ip, r6
	movs r6, #1
	adds r5, r0, #0
_08002302:
	mov r3, ip
	ldrh r0, [r3]
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	asrs r0, r2
	ands r0, r6
	adds r4, r1, #0
	cmp r0, #0
	bne _08002334
	adds r0, r7, r2
	mov r3, sb
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _08002352
	.align 2, 0
_08002320: .4byte gUnknown_03002ADC
_08002324: .4byte gUnknown_03002290
_08002328: .4byte gUnknown_03002A88
_0800232C: .4byte gUnknown_0300270C
_08002330: .4byte gUnknown_030022B8
_08002334:
	adds r3, r7, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _08002340
	subs r0, #1
	b _08002350
_08002340:
	adds r0, r6, #0
	lsls r0, r2
	ldrh r1, [r5]
	orrs r0, r1
	strh r0, [r5]
	mov r1, r8
	adds r0, r1, r2
	ldrb r0, [r0]
_08002350:
	strb r0, [r3]
_08002352:
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r4, r2
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #9
	ble _08002302
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_800236C
sub_800236C: @ 0x0800236C
	push {r4, r5, r6, lr}
	ldr r0, _080023AC @ =0x04000006
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0x9f
	bhi _0800239E
	movs r4, #0
	ldr r0, _080023B0 @ =gUnknown_030018E0
	ldrb r0, [r0]
	cmp r4, r0
	bhs _0800239E
	ldr r6, _080023B4 @ =gUnknown_03002AF0
_08002384:
	lsls r0, r4, #2
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080023B0 @ =gUnknown_030018E0
	ldrb r0, [r0]
	cmp r4, r0
	blo _08002384
_0800239E:
	ldr r1, _080023B8 @ =0x04000202
	movs r0, #2
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080023AC: .4byte 0x04000006
_080023B0: .4byte gUnknown_030018E0
_080023B4: .4byte gUnknown_03002AF0
_080023B8: .4byte 0x04000202

	thumb_func_start sub_80023BC
sub_80023BC: @ 0x080023BC
	ldr r1, _080023C4 @ =0x04000202
	movs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_080023C4: .4byte 0x04000202

	thumb_func_start sub_80023C8
sub_80023C8: @ 0x080023C8
	ldr r1, _080023D4 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080023D4: .4byte 0x04000202

	thumb_func_start sub_80023D8
sub_80023D8: @ 0x080023D8
	ldr r1, _080023E4 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080023E4: .4byte 0x04000202

	thumb_func_start sub_80023E8
sub_80023E8: @ 0x080023E8
	ldr r1, _080023F4 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080023F4: .4byte 0x04000202

	thumb_func_start sub_80023F8
sub_80023F8: @ 0x080023F8
	ldr r1, _08002404 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08002404: .4byte 0x04000202

	thumb_func_start sub_8002408
sub_8002408: @ 0x08002408
	ldr r1, _08002410 @ =0x04000202
	movs r0, #8
	strh r0, [r1]
	bx lr
	.align 2, 0
_08002410: .4byte 0x04000202

	thumb_func_start sub_8002414
sub_8002414: @ 0x08002414
	ldr r1, _0800241C @ =0x04000202
	movs r0, #0x10
	strh r0, [r1]
	bx lr
	.align 2, 0
_0800241C: .4byte 0x04000202

	thumb_func_start sub_8002420
sub_8002420: @ 0x08002420
	ldr r1, _08002428 @ =0x04000202
	movs r0, #0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_08002428: .4byte 0x04000202

	thumb_func_start sub_800242C
sub_800242C: @ 0x0800242C
	ldr r1, _08002438 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08002438: .4byte 0x04000202

	thumb_func_start sub_800243C
sub_800243C: @ 0x0800243C
	ldr r1, _08002448 @ =0x04000202
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08002448: .4byte 0x04000202

	thumb_func_start sub_800244C
sub_800244C: @ 0x0800244C
	bx lr
	.align 2, 0

	thumb_func_start sub_8002450
sub_8002450: @ 0x08002450
	push {r4, lr}
	sub sp, #4
	ldr r1, _08002488 @ =gUnknown_0300188C
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0800248C @ =gUnknown_03001840
	ldr r0, [r2]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	movs r1, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _080024AA
	ldr r3, _08002490 @ =gUnknown_03001884
	ldr r0, _08002494 @ =gUnknown_03004D54
	ldr r1, [r3]
	ldr r2, [r0]
	cmp r1, r2
	bne _080024A0
	ldr r0, _08002498 @ =gUnknown_030022C0
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0800249C @ =gUnknown_030022AC
	str r2, [r0]
	b _080024AA
	.align 2, 0
_08002488: .4byte gUnknown_0300188C
_0800248C: .4byte gUnknown_03001840
_08002490: .4byte gUnknown_03001884
_08002494: .4byte gUnknown_03004D54
_08002498: .4byte gUnknown_030022C0
_0800249C: .4byte gUnknown_030022AC
_080024A0:
	str r2, [r3]
	ldr r0, _080024DC @ =gUnknown_030022AC
	ldr r1, _080024E0 @ =gUnknown_030022C0
	ldr r1, [r1]
	str r1, [r0]
_080024AA:
	ldr r0, [r4]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp]
	ldr r1, _080024E4 @ =gUnknown_03004D90
	ldr r2, _080024E8 @ =0x01000100
	mov r0, sp
	bl CpuFastSet
	ldr r1, _080024EC @ =gUnknown_03004D50
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
_080024DC: .4byte gUnknown_030022AC
_080024E0: .4byte gUnknown_030022C0
_080024E4: .4byte gUnknown_03004D90
_080024E8: .4byte 0x01000100
_080024EC: .4byte gUnknown_03004D50
