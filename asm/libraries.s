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

	thumb_func_start MultiSioInit
MultiSioInit: @ 0x0800032C
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
