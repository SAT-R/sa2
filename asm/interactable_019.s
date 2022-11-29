.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm
.if 0
	thumb_func_start sub_805E234
sub_805E234: @ 0x0805E234
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0805E32C @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r3, _0805E330 @ =IWRAM_START + 0xC
	adds r4, r1, r3
	ldr r6, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0805E334 @ =gCamera
	ldr r0, [r3]
	lsrs r7, r1, #0x10
	mov sb, r7
	asrs r1, r1, #0x10
	subs r0, r1, r0
	movs r7, #0
	mov r8, r7
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov sl, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r4, #0x18]
	ldr r3, _0805E338 @ =gPlayer
	adds r0, r4, #0
	bl sub_800C060
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0805E2A2
	ldr r7, _0805E32C @ =gCurTask
	ldr r1, [r7]
	ldr r0, _0805E33C @ =sub_805E35C
	str r0, [r1, #8]
	mov r0, r8
	strh r0, [r5, #0x3c]
_0805E2A2:
	ldr r0, _0805E340 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805E2C2
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805E2C2
	mov r1, r8
	strh r1, [r5, #0x3c]
	ldr r3, _0805E32C @ =gCurTask
	ldr r1, [r3]
	ldr r0, _0805E344 @ =sub_805E480
	str r0, [r1, #8]
_0805E2C2:
	mov r7, sb
	lsls r0, r7, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0805E334 @ =gCamera
	ldr r2, [r3]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r2, r7
	cmp r1, r0
	bgt _0805E2F8
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0805E2F8
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805E2F8
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805E348
_0805E2F8:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805E31C
	movs r7, #0x18
	ldrsh r0, [r4, r7]
	adds r0, #0x80
	cmp r0, #0
	blt _0805E31C
	movs r0, #0x18
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805E348
_0805E31C:
	ldrb r0, [r5, #8]
	strb r0, [r6]
	ldr r0, _0805E32C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805E34E
	.align 2, 0
_0805E32C: .4byte gCurTask
_0805E330: .4byte IWRAM_START + 0xC
_0805E334: .4byte gCamera
_0805E338: .4byte gPlayer
_0805E33C: .4byte sub_805E35C
_0805E340: .4byte gGameMode
_0805E344: .4byte sub_805E480
_0805E348:
	adds r0, r4, #0
	bl sub_80051E8
_0805E34E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.endif

	thumb_func_start sub_805E35C
sub_805E35C: @ 0x0805E35C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0805E3CC @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0805E3D0 @ =IWRAM_START + 0xC
	adds r5, r1, r3
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0805E3D4 @ =gCamera
	ldr r0, [r3]
	lsrs r7, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r5, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov r8, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r5, #0x18]
	ldr r3, _0805E3D8 @ =gPlayer
	adds r0, r5, #0
	bl sub_800C060
	ldr r0, _0805E3DC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0805E3E0
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805E3E0
	movs r0, #0
	strh r0, [r4, #0x3c]
	mov r0, sb
	b _0805E3F4
	.align 2, 0
_0805E3CC: .4byte gCurTask
_0805E3D0: .4byte IWRAM_START + 0xC
_0805E3D4: .4byte gCamera
_0805E3D8: .4byte gPlayer
_0805E3DC: .4byte gGameMode
_0805E3E0:
	ldrh r0, [r4, #0x3c]
	adds r1, r0, #1
	strh r1, [r4, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0805E3FA
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _0805E460 @ =gCurTask
_0805E3F4:
	ldr r1, [r0]
	ldr r0, _0805E464 @ =sub_805E480
	str r0, [r1, #8]
_0805E3FA:
	lsls r0, r7, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0805E468 @ =gCamera
	ldr r2, [r3]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r2, r7
	cmp r1, r0
	bgt _0805E42E
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0805E42E
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0805E42E
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805E46C
_0805E42E:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805E452
	movs r7, #0x18
	ldrsh r0, [r5, r7]
	adds r0, #0x80
	cmp r0, #0
	blt _0805E452
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805E46C
_0805E452:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, _0805E460 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805E472
	.align 2, 0
_0805E460: .4byte gCurTask
_0805E464: .4byte sub_805E480
_0805E468: .4byte gCamera
_0805E46C:
	adds r0, r5, #0
	bl sub_80051E8
_0805E472:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_805E480
sub_805E480: @ 0x0805E480
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0805E51C @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r2, _0805E520 @ =IWRAM_START + 0xC
	adds r5, r1, r2
	ldr r7, [r0]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	mov r3, r8
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r4, _0805E524 @ =gCamera
	ldr r0, [r4, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r0, r2
	adds r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4]
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	subs r0, r6, r0
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	subs r0, r2, r0
	strh r0, [r5, #0x18]
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
	ldr r3, _0805E528 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_800C060
	ldr r4, [r4]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r4, r1
	cmp r6, r0
	bgt _0805E4FE
	adds r0, r4, #0
	subs r0, #0x80
	cmp r6, r0
	bge _0805E52C
_0805E4FE:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0805E52C
	mov r2, r8
	ldrb r0, [r2, #8]
	strb r0, [r7]
	mov r3, sb
	ldr r0, [r3]
	bl TaskDestroy
	b _0805E688
	.align 2, 0
_0805E51C: .4byte gCurTask
_0805E520: .4byte IWRAM_START + 0xC
_0805E524: .4byte gCamera
_0805E528: .4byte gPlayer
_0805E52C:
	ldr r0, _0805E5B8 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r5, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, [r5, #0xc]
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	mov sl, r2
	movs r6, #0
	mov sb, r6
_0805E54C:
	movs r7, #0
_0805E54E:
	ldr r1, _0805E5BC @ =0x0000FFE1
	adds r0, r6, r1
	mov r2, r8
	ldrh r2, [r2, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _0805E5CC
	cmp r6, #0
	bne _0805E590
	cmp r0, #1
	bne _0805E590
	ldr r2, _0805E5C0 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805E588
	ldr r0, [r2, #0x3c]
	cmp r0, r5
	bne _0805E588
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r2, #0x20]
_0805E588:
	ldr r0, _0805E5C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805E5C8 @ =sub_805E6A4
	str r0, [r1, #8]
_0805E590:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x2a
	muls r0, r1, r0
	muls r1, r0, r1
	lsls r1, r1, #8
	lsrs r4, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	ble _0805E5CE
	cmp r6, #0
	bne _0805E688
	ldr r0, _0805E5C4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805E688
	.align 2, 0
_0805E5B8: .4byte gUnknown_03002794
_0805E5BC: .4byte 0x0000FFE1
_0805E5C0: .4byte gPlayer
_0805E5C4: .4byte gCurTask
_0805E5C8: .4byte sub_805E6A4
_0805E5CC:
	movs r4, #0
_0805E5CE:
	ldrh r0, [r5, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0805E624 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0805E688
	mov r0, sb
	lsls r1, r0, #3
	ldrh r2, [r5, #0x18]
	adds r1, r1, r2
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E62C
	lsls r1, r7, #3
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	subs r0, #8
	ldr r2, _0805E628 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	b _0805E638
	.align 2, 0
_0805E624: .4byte iwram_end
_0805E628: .4byte 0x000001FF
_0805E62C:
	lsls r0, r7, #3
	ldrh r1, [r5, #0x16]
	adds r0, r0, r1
	ldr r2, _0805E698 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
_0805E638:
	strh r0, [r3, #2]
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	mov r1, sl
	ldrh r2, [r1, #4]
	adds r2, r2, r0
	ldr r1, _0805E69C @ =0xFFFFF000
	adds r0, r1, #0
	ands r2, r0
	ldr r0, [r5, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r0, r0, #2
	orrs r2, r0
	ldr r0, [r5, #4]
	ldr r1, _0805E6A0 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	adds r0, r0, r6
	orrs r2, r0
	strh r2, [r3, #4]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #7
	bhi _0805E678
	b _0805E54E
_0805E678:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #3
	bhi _0805E688
	b _0805E54C
_0805E688:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E698: .4byte 0x000001FF
_0805E69C: .4byte 0xFFFFF000
_0805E6A0: .4byte 0xF9FF0000

	thumb_func_start sub_805E6A4
sub_805E6A4: @ 0x0805E6A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r6, _0805E738 @ =gCurTask
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldr r0, _0805E73C @ =IWRAM_START + 0xC
	adds r5, r1, r0
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp]
	mov r3, r8
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _0805E740 @ =gCamera
	ldr r0, [r3, #4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	adds r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	adds r0, #1
	strh r0, [r1, #0x3c]
	ldr r3, [r3]
	movs r1, #0xb8
	lsls r1, r1, #1
	adds r0, r3, r1
	cmp r2, r0
	bgt _0805E71A
	adds r0, r3, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0805E744
_0805E71A:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0805E744
	mov r2, r8
	ldrb r0, [r2, #8]
	ldr r3, [sp]
	strb r0, [r3]
	ldr r0, [r6]
	bl TaskDestroy
	b _0805E860
	.align 2, 0
_0805E738: .4byte gCurTask
_0805E73C: .4byte IWRAM_START + 0xC
_0805E740: .4byte gCamera
_0805E744:
	ldr r0, _0805E7A4 @ =gUnknown_03002794
	ldr r1, [r0]
	ldrh r0, [r5, #0xa]
	ldr r1, [r1, #8]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, [r5, #0xc]
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #4]
	movs r7, #0
	movs r0, #0
	mov sb, r0
	lsls r4, r4, #0x10
	mov sl, r4
_0805E76A:
	movs r6, #0
_0805E76C:
	ldr r1, _0805E7A8 @ =0x0000FFE1
	adds r0, r7, r1
	mov r2, r8
	ldrh r2, [r2, #0x3c]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2a
	muls r1, r0, r1
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r4, r0, #0x10
	mov r3, sl
	asrs r0, r3, #0x10
	cmp r4, r0
	ble _0805E7B0
	cmp r7, #0
	bne _0805E860
	ldr r0, _0805E7AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	mov r1, r8
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	b _0805E860
	.align 2, 0
_0805E7A4: .4byte gUnknown_03002794
_0805E7A8: .4byte 0x0000FFE1
_0805E7AC: .4byte gCurTask
_0805E7B0:
	ldrh r0, [r5, #0x1a]
	movs r3, #0xf8
	lsls r3, r3, #3
	adds r1, r3, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl sub_80058B4
	adds r3, r0, #0
	ldr r0, _0805E800 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0805E860
	mov r1, sb
	lsls r0, r1, #3
	ldrh r2, [r5, #0x18]
	adds r0, r0, r2
	adds r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E808
	lsls r1, r6, #3
	ldrh r0, [r5, #0x16]
	subs r0, r0, r1
	subs r0, #8
	ldr r2, _0805E804 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	b _0805E814
	.align 2, 0
_0805E800: .4byte iwram_end
_0805E804: .4byte 0x000001FF
_0805E808:
	lsls r0, r6, #3
	ldrh r1, [r5, #0x16]
	adds r0, r0, r1
	ldr r2, _0805E870 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
_0805E814:
	strh r0, [r3, #2]
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	ldr r1, [sp, #4]
	ldrh r2, [r1, #4]
	adds r2, r2, r0
	ldr r1, _0805E874 @ =0xFFFFF000
	adds r0, r1, #0
	ands r2, r0
	ldr r0, [r5, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r0, r0, #2
	orrs r2, r0
	ldr r0, [r5, #4]
	ldr r1, _0805E878 @ =0xF9FF0000
	adds r0, r0, r1
	lsrs r0, r0, #5
	adds r0, r0, r7
	orrs r2, r0
	strh r2, [r3, #4]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _0805E76C
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #3
	bls _0805E76A
_0805E860:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E870: .4byte 0x000001FF
_0805E874: .4byte 0xFFFFF000
_0805E878: .4byte 0xF9FF0000

	thumb_func_start TaskDestructor_Interactable019
TaskDestructor_Interactable019: @ 0x0805E87C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
