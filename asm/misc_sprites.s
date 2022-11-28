.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable019
initSprite_Interactable019: @ 0x0805E120
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
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
	ldr r0, _0805E210 @ =sub_805E234
	ldr r1, _0805E214 @ =sub_805E87C
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x80
	lsls r2, r2, #6
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r6, r0
	ldr r1, _0805E218 @ =IWRAM_START + 0xC
	adds r7, r6, r1
	movs r3, #0
	mov sl, r3
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r3, r8
	strb r3, [r0, #9]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	mov r3, sb
	strb r1, [r3]
	strh r2, [r0, #0x3c]
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r7, #0x16]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x18]
	movs r0, #0x20
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r1, _0805E21C @ =gUnknown_080D94D4
	ldr r0, _0805E220 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r1, _0805E224 @ =IWRAM_START + 0x2C
	adds r0, r6, r1
	mov r3, sl
	strb r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _0805E228 @ =IWRAM_START + 0x2D
	adds r1, r6, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r3, _0805E22C @ =IWRAM_START + 0x2E
	adds r1, r6, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805E230 @ =IWRAM_START + 0x31
	adds r6, r6, r0
	mov r1, sl
	strb r1, [r6]
	movs r3, #0x80
	lsls r3, r3, #6
	str r3, [r7, #0x10]
	mov r1, sb
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0805E1FA
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r3
	str r0, [r7, #0x10]
_0805E1FA:
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
_0805E210: .4byte sub_805E234
_0805E214: .4byte sub_805E87C
_0805E218: .4byte IWRAM_START + 0xC
_0805E21C: .4byte gUnknown_080D94D4
_0805E220: .4byte gCurrentLevel
_0805E224: .4byte IWRAM_START + 0x2C
_0805E228: .4byte IWRAM_START + 0x2D
_0805E22C: .4byte IWRAM_START + 0x2E
_0805E230: .4byte IWRAM_START + 0x31

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

	thumb_func_start sub_805E87C
sub_805E87C: @ 0x0805E87C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_805E890
sub_805E890: @ 0x0805E890
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805E8F0 @ =gCurTask
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
	ldr r1, _0805E8F4 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r2, r0, #8
	mov ip, r1
	cmp r5, r2
	bgt _0805E910
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r2
	blt _0805E910
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	cmp r4, r1
	bgt _0805E910
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r4, r0
	cmp r0, r1
	blt _0805E910
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _0805E8F8
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	b _0805E902
	.align 2, 0
_0805E8F0: .4byte gCurTask
_0805E8F4: .4byte gPlayer
_0805E8F8:
	mov r2, ip
	adds r2, #0x38
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
_0805E902:
	strb r0, [r2]
	mov r1, ip
	ldr r0, [r1, #0x20]
	ldr r1, _0805E944 @ =0xFEFFFFFF
	ands r0, r1
	mov r1, ip
	str r0, [r1, #0x20]
_0805E910:
	ldr r1, _0805E948 @ =gCamera
	ldr r0, [r1]
	subs r5, r5, r0
	ldr r0, [r1, #4]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805E936
	adds r0, r4, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805E936
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r4, r0
	ble _0805E93E
_0805E936:
	strb r7, [r6]
	ldr r0, [r3]
	bl TaskDestroy
_0805E93E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E944: .4byte 0xFEFFFFFF
_0805E948: .4byte gCamera

	thumb_func_start initSprite_Interactable_ChangePlayerLayer
initSprite_Interactable_ChangePlayerLayer: @ 0x0805E94C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0805E994 @ =sub_805E890
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
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
_0805E994: .4byte sub_805E890

	thumb_func_start initSprite_Interactable_RotatingHandle
initSprite_Interactable_RotatingHandle: @ 0x0805E998
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
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	movs r0, #3
	ldrsb r0, [r7, r0]
	cmp r0, #0
	blt _0805EA5E
	ldr r0, _0805EA70 @ =sub_805EA94
	ldr r2, _0805EA74 @ =0x00002010
	ldr r1, _0805EA78 @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r1, _0805EA7C @ =IWRAM_START + 0xC
	adds r4, r5, r1
	movs r6, #0
	mov r2, sb
	strh r2, [r0, #4]
	mov r1, sl
	strh r1, [r0, #6]
	str r7, [r0]
	ldrb r1, [r7]
	strb r1, [r0, #8]
	mov r2, r8
	strb r2, [r0, #9]
	strh r6, [r0, #0x3c]
	strh r6, [r0, #0x3e]
	ldr r1, _0805EA80 @ =IWRAM_START + 0x40
	adds r0, r5, r1
	movs r2, #0
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #9
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _0805EA84 @ =0x00000222
	strh r0, [r4, #0xa]
	ldr r2, _0805EA88 @ =IWRAM_START + 0x2C
	adds r0, r5, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	strh r6, [r4, #8]
	strh r6, [r4, #0x14]
	strh r6, [r4, #0x1c]
	adds r2, #1
	adds r1, r5, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0805EA8C @ =IWRAM_START + 0x2E
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0805EA90 @ =IWRAM_START + 0x31
	adds r5, r5, r1
	movs r2, #0
	strb r2, [r5]
	subs r0, #0x11
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
_0805EA5E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA70: .4byte sub_805EA94
_0805EA74: .4byte 0x00002010
_0805EA78: .4byte TaskDestructor_80095E8
_0805EA7C: .4byte IWRAM_START + 0xC
_0805EA80: .4byte IWRAM_START + 0x40
_0805EA84: .4byte 0x00000222
_0805EA88: .4byte IWRAM_START + 0x2C
_0805EA8C: .4byte IWRAM_START + 0x2E
_0805EA90: .4byte IWRAM_START + 0x31

	thumb_func_start sub_805EA94
sub_805EA94: @ 0x0805EA94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0805EB78 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov sb, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, sb
	adds r7, r1, r0
	ldr r6, _0805EB7C @ =IWRAM_START + 0xC
	add r6, sb
	ldr r2, [r7]
	str r2, [sp, #8]
	ldrb r1, [r7, #8]
	lsls r1, r1, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov sl, r1
	ldr r1, _0805EB80 @ =gCamera
	ldr r0, [r1]
	ldr r2, [sp, #0xc]
	subs r0, r2, r0
	strh r0, [r6, #0x16]
	ldr r0, [r1, #4]
	mov r1, sl
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	ldr r5, _0805EB84 @ =gPlayer
	ldr r4, [r5, #0x20]
	ldr r0, _0805EB88 @ =0x00400080
	ands r4, r0
	cmp r4, #0
	beq _0805EAF0
	b _0805EC4C
_0805EAF0:
	str r5, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	mov r2, sl
	movs r3, #0
	bl sub_800C204
	mov r8, r0
	cmp r0, #1
	beq _0805EB08
	b _0805EC4C
_0805EB08:
	adds r0, r5, #0
	bl sub_80218E4
	strh r4, [r7, #0x3c]
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0805EB1A
	rsbs r0, r0, #0
_0805EB1A:
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	cmp r1, #0
	bge _0805EB24
	rsbs r1, r1, #0
_0805EB24:
	adds r0, r0, r1
	strh r0, [r7, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xdf
	bgt _0805EB34
	movs r0, #0xe0
	strh r0, [r7, #0x3e]
_0805EB34:
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	movs r1, #0xc0
	lsls r1, r1, #1
	cmp r0, r1
	ble _0805EB42
	strh r1, [r7, #0x3e]
_0805EB42:
	movs r2, #0x10
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0805EBB4
	ldr r0, [r5, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	cmp r0, sl
	ble _0805EB90
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2d
	strh r0, [r1]
	ldr r1, _0805EB8C @ =IWRAM_START + 0x40
	add r1, sb
	movs r0, #0
	b _0805EBFC
	.align 2, 0
_0805EB78: .4byte gCurTask
_0805EB7C: .4byte IWRAM_START + 0xC
_0805EB80: .4byte gCamera
_0805EB84: .4byte gPlayer
_0805EB88: .4byte 0x00400080
_0805EB8C: .4byte IWRAM_START + 0x40
_0805EB90:
	ldr r0, [r6, #0x10]
	ldr r1, _0805EBAC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2e
	strh r0, [r1]
	ldr r0, _0805EBB0 @ =IWRAM_START + 0x40
	add r0, sb
	mov r1, r8
	strb r1, [r0]
	b _0805EBFE
	.align 2, 0
_0805EBAC: .4byte 0xFFFFFBFF
_0805EBB0: .4byte IWRAM_START + 0x40
_0805EBB4:
	ldr r0, [r5, #0x20]
	mov r2, r8
	orrs r0, r2
	str r0, [r5, #0x20]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	cmp r0, sl
	ble _0805EBE4
	ldr r0, [r6, #0x10]
	ldr r1, _0805EBDC @ =0xFFFFFBFF
	ands r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2d
	strh r0, [r1]
	ldr r1, _0805EBE0 @ =IWRAM_START + 0x40
	add r1, sb
	movs r0, #2
	b _0805EBFC
	.align 2, 0
_0805EBDC: .4byte 0xFFFFFBFF
_0805EBE0: .4byte IWRAM_START + 0x40
_0805EBE4:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x10]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x2e
	strh r0, [r1]
	ldr r1, _0805EC3C @ =IWRAM_START + 0x40
	add r1, sb
	movs r0, #3
_0805EBFC:
	strb r0, [r1]
_0805EBFE:
	ldr r5, _0805EC40 @ =gPlayer
	ldr r1, [sp, #0xc]
	lsls r0, r1, #8
	str r0, [r5, #8]
	mov r2, sl
	lsls r0, r2, #8
	str r0, [r5, #0xc]
	adds r1, r5, #0
	adds r1, #0x6a
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x9b
	bl m4aSongNumStart
	adds r0, r5, #0
	adds r0, #0x62
	strb r4, [r0]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x20]
	ldr r0, _0805EC44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805EC48 @ =sub_805ECA0
	str r0, [r1, #8]
	b _0805EC84
	.align 2, 0
_0805EC3C: .4byte IWRAM_START + 0x40
_0805EC40: .4byte gPlayer
_0805EC44: .4byte gCurTask
_0805EC48: .4byte sub_805ECA0
_0805EC4C:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805EC70
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805EC70
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805EC84
_0805EC70:
	ldrb r0, [r7, #8]
	ldr r1, [sp, #8]
	strb r0, [r1]
	ldr r0, _0805EC80 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805EC90
	.align 2, 0
_0805EC80: .4byte gCurTask
_0805EC84:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805EC90:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805ECA0
sub_805ECA0: @ 0x0805ECA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _0805ED20 @ =gCurTask
	ldr r2, [r0]
	ldrh r7, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sl, r0
	ldr r1, _0805ED24 @ =IWRAM_START + 0xC
	adds r1, r1, r7
	mov sb, r1
	ldr r3, [r0]
	str r3, [sp]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrh r0, [r0, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #4]
	ldrb r1, [r3, #1]
	lsls r1, r1, #3
	mov r3, sl
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp, #8]
	ldrh r0, [r3, #0x3e]
	ldrh r1, [r3, #0x3c]
	adds r0, r0, r1
	ldr r3, _0805ED28 @ =0x00003FF0
	adds r1, r3, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1, #0x3c]
	ldr r3, _0805ED2C @ =0x000003FF
	mov r8, r3
	lsrs r6, r0, #4
	ldr r1, _0805ED30 @ =gCamera
	ldr r0, [r1]
	ldr r3, [sp, #4]
	subs r0, r3, r0
	mov r3, sb
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	strh r0, [r3, #0x18]
	ldr r5, _0805ED34 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0805ED3C
	ldr r0, _0805ED38 @ =sub_805EF90
	str r0, [r2, #8]
	mov r0, sb
	bl sub_80051E8
	b _0805EF80
	.align 2, 0
_0805ED20: .4byte gCurTask
_0805ED24: .4byte IWRAM_START + 0xC
_0805ED28: .4byte 0x00003FF0
_0805ED2C: .4byte 0x000003FF
_0805ED30: .4byte gCamera
_0805ED34: .4byte gPlayer
_0805ED38: .4byte sub_805EF90
_0805ED3C:
	adds r1, r5, #0
	adds r1, #0x5e
	ldr r0, _0805ED98 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r4, [r0]
	ands r4, r1
	cmp r4, #0
	bne _0805ED4E
	b _0805EEC8
_0805ED4E:
	adds r1, r5, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	mov r2, sl
	ldrb r0, [r2, #8]
	ldr r3, [sp]
	strb r0, [r3]
	adds r0, r5, #0
	bl sub_80218E4
	adds r0, r5, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #9
	strb r0, [r5, #0x17]
	ldr r0, [r5, #0x20]
	ldr r1, _0805ED9C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x20]
	ldr r0, _0805EDA0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0805EDA4 @ =sub_805EF90
	str r0, [r1, #8]
	ldr r1, _0805EDA8 @ =IWRAM_START + 0x40
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805EDEC
	cmp r0, #1
	bgt _0805EDAC
	cmp r0, #0
	beq _0805EDB6
	b _0805EE80
	.align 2, 0
_0805ED98: .4byte gPlayerControls
_0805ED9C: .4byte 0xFFBFFFFF
_0805EDA0: .4byte gCurTask
_0805EDA4: .4byte sub_805EF90
_0805EDA8: .4byte IWRAM_START + 0x40
_0805EDAC:
	cmp r0, #2
	beq _0805EE0C
	cmp r0, #3
	beq _0805EE44
	b _0805EE80
_0805EDB6:
	movs r0, #0x20
	subs r4, r0, r6
	mov r2, r8
	ands r4, r2
	ldr r2, _0805EDE8 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	b _0805EE76
	.align 2, 0
_0805EDE8: .4byte gSineTable
_0805EDEC:
	adds r4, r6, #0
	adds r4, #0x20
	mov r0, r8
	ands r4, r0
	ldr r2, _0805EE08 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	adds r0, r0, r1
	b _0805EE60
	.align 2, 0
_0805EE08: .4byte gSineTable
_0805EE0C:
	movs r0, #0xf0
	lsls r0, r0, #1
	adds r4, r6, r0
	mov r1, r8
	ands r4, r1
	ldr r2, _0805EE40 @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	subs r0, r0, r1
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	b _0805EE76
	.align 2, 0
_0805EE40: .4byte gSineTable
_0805EE44:
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r1, #0
	subs r4, r0, r6
	mov r2, r8
	ands r4, r2
	ldr r2, _0805EE7C @ =gSineTable
	lsls r0, r6, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #8]
	subs r0, r0, r1
_0805EE60:
	str r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	asrs r1, r1, #1
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
_0805EE76:
	str r0, [r5, #0xc]
	adds r6, r2, #0
	b _0805EE84
	.align 2, 0
_0805EE7C: .4byte gSineTable
_0805EE80:
	movs r4, #0
	ldr r6, _0805EEC0 @ =gSineTable
_0805EE84:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	movs r1, #0x11
	bl Div
	ldr r5, _0805EEC4 @ =gPlayer
	strh r0, [r5, #0x10]
	lsls r4, r4, #1
	adds r4, r4, r6
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	movs r1, #0x11
	bl Div
	strh r0, [r5, #0x12]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r5, #0x6c
	movs r0, #1
	strb r0, [r5]
	b _0805EF2A
	.align 2, 0
_0805EEC0: .4byte gSineTable
_0805EEC4: .4byte gPlayer
_0805EEC8:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x2d
	bne _0805EEE6
	adds r0, r6, #0
	movs r1, #0x56
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EEF8
	b _0805EEF6
_0805EEE6:
	adds r0, r6, #0
	movs r1, #0x56
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EEF8
_0805EEF6:
	movs r2, #0xb
_0805EEF8:
	ldr r0, _0805EF64 @ =0x00000222
	mov r3, sb
	strh r0, [r3, #0xa]
	ldr r1, _0805EF68 @ =IWRAM_START + 0x2C
	adds r0, r7, r1
	strb r2, [r0]
	ldr r3, _0805EF6C @ =IWRAM_START + 0x2D
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x6c
	movs r0, #1
	strb r0, [r1]
	ldr r1, [sp, #4]
	lsls r0, r1, #8
	str r0, [r5, #8]
	ldr r2, [sp, #8]
	lsls r0, r2, #8
	str r0, [r5, #0xc]
	strh r4, [r5, #0x10]
	strh r4, [r5, #0x12]
_0805EF2A:
	mov r3, sb
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805EF50
	movs r1, #0x18
	ldrsh r0, [r3, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805EF50
	movs r2, #0x18
	ldrsh r1, [r3, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805EF74
_0805EF50:
	mov r3, sl
	ldrb r0, [r3, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _0805EF70 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805EF80
	.align 2, 0
_0805EF64: .4byte 0x00000222
_0805EF68: .4byte IWRAM_START + 0x2C
_0805EF6C: .4byte IWRAM_START + 0x2D
_0805EF70: .4byte gCurTask
_0805EF74:
	mov r0, sb
	bl sub_8004558
	mov r0, sb
	bl sub_80051E8
_0805EF80:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_805EF90
sub_805EF90: @ 0x0805EF90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0805F04C @ =gCurTask
	mov sl, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	ldr r1, _0805F050 @ =IWRAM_START + 0xC
	adds r6, r5, r1
	ldr r2, [r4]
	mov sb, r2
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r7, r1, r0
	ldrh r0, [r4, #0x3e]
	subs r0, #1
	strh r0, [r4, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xdf
	bgt _0805EFD8
	movs r0, #0xe0
	strh r0, [r4, #0x3e]
_0805EFD8:
	ldrh r0, [r4, #0x3e]
	ldrh r3, [r4, #0x3c]
	adds r0, r0, r3
	ldr r2, _0805F054 @ =0x00003FF0
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4, #0x3c]
	lsrs r0, r0, #4
	movs r1, #0x55
	bl Div
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bls _0805EFF8
	movs r2, #0xb
_0805EFF8:
	ldr r0, _0805F058 @ =0x00000222
	strh r0, [r6, #0xa]
	ldr r3, _0805F05C @ =IWRAM_START + 0x2C
	adds r0, r5, r3
	strb r2, [r0]
	ldr r0, _0805F060 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r1, _0805F064 @ =gCamera
	ldr r0, [r1]
	mov r3, r8
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r1, [r1, #4]
	subs r3, r7, r1
	strh r3, [r6, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805F03A
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805F03A
	lsls r1, r3, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0805F068
_0805F03A:
	ldrb r0, [r4, #8]
	mov r2, sb
	strb r0, [r2]
	ldr r0, _0805F04C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805F084
	.align 2, 0
_0805F04C: .4byte gCurTask
_0805F050: .4byte IWRAM_START + 0xC
_0805F054: .4byte 0x00003FF0
_0805F058: .4byte 0x00000222
_0805F05C: .4byte IWRAM_START + 0x2C
_0805F060: .4byte IWRAM_START + 0x2D
_0805F064: .4byte gCamera
_0805F068:
	cmp r2, #0
	bne _0805F078
	strh r2, [r4, #0x3c]
	strh r2, [r4, #0x3e]
	mov r3, sl
	ldr r1, [r3]
	ldr r0, _0805F094 @ =sub_805EA94
	str r0, [r1, #8]
_0805F078:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0805F084:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F094: .4byte sub_805EA94

	thumb_func_start sub_805F098
sub_805F098: @ 0x0805F098
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805F188 @ =gCurTask
	ldr r0, [r0]
	mov sb, r0
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	mov sl, r1
	adds r4, r0, r1
	ldr r7, [r4]
	ldrb r2, [r4, #8]
	str r2, [sp]
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	lsls r2, r2, #3
	lsls r0, r0, #8
	adds r6, r2, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldr r3, _0805F18C @ =gPlayer
	ldr r2, [r3, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0805F144
	ldr r0, [r3, #8]
	mov r8, r0
	asrs r1, r0, #8
	cmp r6, r1
	bgt _0805F144
	ldrb r0, [r7, #5]
	lsls r0, r0, #3
	adds r0, r6, r0
	cmp r0, r1
	blt _0805F144
	ldr r1, [r3, #0xc]
	mov ip, r1
	asrs r1, r1, #8
	cmp r5, r1
	bgt _0805F144
	ldrb r0, [r7, #6]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r1
	blt _0805F144
	movs r1, #0x14
	ldrsh r0, [r3, r1]
	str r0, [sp, #4]
	mov r1, sl
	asrs r0, r1, #0x10
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _0805F144
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0805F144
	ldr r0, _0805F190 @ =sub_805F19C
	mov r1, sb
	str r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r2, r0
	str r2, [r3, #0x20]
	ldr r0, [r4, #0x10]
	mov r2, ip
	subs r0, r2, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r4, #0xc]
	mov r3, r8
	subs r1, r3, r1
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0x14]
	ldr r0, _0805F194 @ =0x0000FFF8
	strh r0, [r4, #0x16]
_0805F144:
	ldr r1, _0805F198 @ =gCamera
	ldr r0, [r1]
	subs r6, r6, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r6, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F16A
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F16A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F178
_0805F16A:
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r0, _0805F188 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0805F178:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F188: .4byte gCurTask
_0805F18C: .4byte gPlayer
_0805F190: .4byte sub_805F19C
_0805F194: .4byte 0x0000FFF8
_0805F198: .4byte gCamera

	thumb_func_start sub_805F19C
sub_805F19C: @ 0x0805F19C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _0805F1E0 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4]
	mov r8, r0
	ldrb r1, [r4, #8]
	mov ip, r1
	ldrh r5, [r4, #4]
	ldrh r6, [r4, #6]
	ldr r2, _0805F1E4 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov sl, r3
	mov sb, r2
	cmp r1, #0
	beq _0805F1E8
	mov r3, ip
	mov r2, r8
	strb r3, [r2]
	mov r6, sl
	ldr r0, [r6]
	bl TaskDestroy
	b _0805F2BC
	.align 2, 0
_0805F1E0: .4byte gCurTask
_0805F1E4: .4byte gPlayer
_0805F1E8:
	mov r0, ip
	lsls r1, r0, #3
	lsls r0, r5, #8
	adds r7, r1, r0
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r5, r0, r1
	ldrh r2, [r4, #0x16]
	ldrh r3, [r4, #0x14]
	adds r0, r2, r3
	ldr r6, _0805F2CC @ =0x000003FF
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r4, #0x14]
	mov r1, sb
	adds r1, #0x24
	ldrb r0, [r1]
	adds r2, r2, r0
	strb r2, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	subs r0, r0, r1
	cmp r0, #0
	bge _0805F224
	ldr r2, _0805F2D0 @ =0xFFFFFD00
	adds r0, r1, r2
_0805F224:
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0805F2D4 @ =gSineTable
	movs r6, #0x14
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r1, [r0, r6]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x87
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1, #0xc]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #6
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	mov r3, sb
	str r1, [r3, #8]
	ldr r1, _0805F2D8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	movs r6, #0x14
	ldrsh r1, [r4, r6]
	ldr r0, _0805F2DC @ =0x0000024A
	cmp r1, r0
	bgt _0805F292
	ldr r0, [r3, #0x20]
	ldr r1, _0805F2E0 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0805F2E4 @ =sub_805F098
	str r0, [r1, #8]
_0805F292:
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F2AE
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F2AE
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F2BC
_0805F2AE:
	mov r2, ip
	mov r1, r8
	strb r2, [r1]
	mov r3, sl
	ldr r0, [r3]
	bl TaskDestroy
_0805F2BC:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2CC: .4byte 0x000003FF
_0805F2D0: .4byte 0xFFFFFD00
_0805F2D4: .4byte gSineTable
_0805F2D8: .4byte gCamera
_0805F2DC: .4byte 0x0000024A
_0805F2E0: .4byte 0xFFBFFFFF
_0805F2E4: .4byte sub_805F098

	thumb_func_start sub_805F2E8
sub_805F2E8: @ 0x0805F2E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0805F3E8 @ =gCurTask
	ldr r0, [r0]
	mov sb, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r6, [r4]
	ldrb r0, [r4, #8]
	mov sl, r0
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #6]
	mov r3, sl
	lsls r2, r3, #3
	lsls r0, r0, #8
	adds r7, r2, r0
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r5, r0, r1
	ldr r0, _0805F3EC @ =gPlayer
	mov ip, r0
	ldr r3, [r0, #0x20]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0805F3A4
	movs r0, #3
	ldrsb r0, [r6, r0]
	lsls r0, r0, #3
	adds r2, r7, r0
	mov r1, ip
	ldr r1, [r1, #8]
	mov r8, r1
	asrs r1, r1, #8
	cmp r2, r1
	bgt _0805F3A4
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _0805F3A4
	mov r0, ip
	ldr r2, [r0, #0xc]
	asrs r1, r2, #8
	cmp r5, r1
	bgt _0805F3A4
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r0, r5, r0
	cmp r0, r1
	blt _0805F3A4
	mov r1, ip
	movs r0, #0x14
	ldrsh r1, [r1, r0]
	ldr r0, _0805F3F0 @ =0xFFFFFD00
	cmp r1, r0
	bge _0805F3A4
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0805F3A4
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	bne _0805F3A4
	ldr r0, _0805F3F4 @ =sub_805F3FC
	mov r1, sb
	str r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r3, r0
	mov r0, ip
	str r3, [r0, #0x20]
	ldr r0, [r4, #0x10]
	subs r0, r2, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	ldr r1, [r4, #0xc]
	mov r2, r8
	subs r1, r2, r1
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	strh r0, [r4, #0x14]
	movs r0, #8
	strh r0, [r4, #0x16]
_0805F3A4:
	ldr r1, _0805F3F8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F3CA
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F3CA
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F3D6
_0805F3CA:
	mov r3, sl
	strb r3, [r6]
	ldr r0, _0805F3E8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_0805F3D6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F3E8: .4byte gCurTask
_0805F3EC: .4byte gPlayer
_0805F3F0: .4byte 0xFFFFFD00
_0805F3F4: .4byte sub_805F3FC
_0805F3F8: .4byte gCamera

	thumb_func_start sub_805F3FC
sub_805F3FC: @ 0x0805F3FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _0805F440 @ =gCurTask
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r4]
	mov r8, r0
	ldrb r1, [r4, #8]
	mov ip, r1
	ldrh r5, [r4, #4]
	ldrh r6, [r4, #6]
	ldr r2, _0805F444 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	ands r1, r0
	mov sl, r3
	mov sb, r2
	cmp r1, #0
	beq _0805F448
	mov r3, ip
	mov r2, r8
	strb r3, [r2]
	mov r6, sl
	ldr r0, [r6]
	bl TaskDestroy
	b _0805F51C
	.align 2, 0
_0805F440: .4byte gCurTask
_0805F444: .4byte gPlayer
_0805F448:
	mov r0, ip
	lsls r1, r0, #3
	lsls r0, r5, #8
	adds r7, r1, r0
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r1, r6, #8
	adds r5, r0, r1
	ldrh r2, [r4, #0x16]
	ldrh r3, [r4, #0x14]
	adds r0, r2, r3
	ldr r6, _0805F52C @ =0x000003FF
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r4, #0x14]
	mov r1, sb
	adds r1, #0x24
	ldrb r0, [r1]
	adds r2, r2, r0
	strb r2, [r1]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	subs r0, r0, r1
	cmp r0, #0
	bge _0805F484
	ldr r2, _0805F530 @ =0xFFFFFD00
	adds r0, r1, r2
_0805F484:
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0805F534 @ =gSineTable
	movs r6, #0x14
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r1, [r0, r6]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x87
	muls r1, r0, r1
	asrs r1, r1, #6
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1, #0xc]
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, r0, r1
	asrs r0, r0, #6
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	mov r3, sb
	str r1, [r3, #8]
	ldr r1, _0805F538 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	subs r5, r5, r0
	movs r6, #0x14
	ldrsh r1, [r4, r6]
	ldr r0, _0805F53C @ =0x000003B6
	cmp r1, r0
	ble _0805F4F2
	ldr r0, [r3, #0x20]
	ldr r1, _0805F540 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _0805F544 @ =sub_805F2E8
	str r0, [r1, #8]
_0805F4F2:
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0805F50E
	adds r0, r5, #0
	adds r0, #0x80
	cmp r0, #0
	blt _0805F50E
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r5, r0
	ble _0805F51C
_0805F50E:
	mov r2, ip
	mov r1, r8
	strb r2, [r1]
	mov r3, sl
	ldr r0, [r3]
	bl TaskDestroy
_0805F51C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F52C: .4byte 0x000003FF
_0805F530: .4byte 0xFFFFFD00
_0805F534: .4byte gSineTable
_0805F538: .4byte gCamera
_0805F53C: .4byte 0x000003B6
_0805F540: .4byte 0xFFBFFFFF
_0805F544: .4byte sub_805F2E8

	thumb_func_start initSprite_Interactable_LoopGap_Start
initSprite_Interactable_LoopGap_Start: @ 0x0805F548
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0805F5AC @ =sub_805F098
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	str r6, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #8]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	ldrb r0, [r1, #8]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	subs r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	adds r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F5AC: .4byte sub_805F098

	thumb_func_start initSprite_Interactable_LoopGap_End
initSprite_Interactable_LoopGap_End: @ 0x0805F5B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0805F614 @ =sub_805F2E8
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	str r6, [r1]
	ldrb r0, [r6]
	strb r0, [r1, #8]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r6]
	ldrb r0, [r1, #8]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	adds r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	adds r0, #0x60
	lsls r0, r0, #8
	str r0, [r1, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F614: .4byte sub_805F2E8

	thumb_func_start initSprite_Interactable_Spikes_Up
initSprite_Interactable_Spikes_Up: @ 0x0805F618
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0805F6B0 @ =sub_805F810
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	ldr r3, _0805F6B4 @ =IWRAM_START + 0xC
	adds r2, r1, r3
	mov r1, sb
	str r1, [r0, #0x40]
	str r1, [r0, #0x3c]
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r3, r8
	str r3, [r0]
	ldrb r1, [r3]
	strb r1, [r0, #8]
	strb r6, [r0, #9]
	ldrb r0, [r3]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r2, #0x16]
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r2, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r3]
	ldr r0, _0805F6B8 @ =0x06011980
	str r0, [r2, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	mov r3, sb
	strh r3, [r2, #8]
	ldr r0, _0805F6BC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _0805F6C8
	ldr r1, _0805F6C0 @ =gUnknown_080D94D8
	ldr r0, _0805F6C4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0805F6CA
	.align 2, 0
_0805F6B0: .4byte sub_805F810
_0805F6B4: .4byte IWRAM_START + 0xC
_0805F6B8: .4byte 0x06011980
_0805F6BC: .4byte gGameMode
_0805F6C0: .4byte gUnknown_080D94D8
_0805F6C4: .4byte gCurrentLevel
_0805F6C8:
	ldr r0, _0805F710 @ =0x0000021E
_0805F6CA:
	strh r0, [r2, #0xa]
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x1c]
	adds r3, r2, #0
	adds r3, #0x21
	movs r0, #0xff
	strb r0, [r3]
	adds r3, #1
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	adds r0, r2, #0
	bl sub_8004558
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F710: .4byte 0x0000021E

	thumb_func_start initSprite_Interactable_Spikes_Down
initSprite_Interactable_Spikes_Down: @ 0x0805F714
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0805F7EC @ =sub_805F928
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0805F7F0 @ =IWRAM_START + 0xC
	adds r0, r3, r2
	mov r7, sb
	str r7, [r1, #0x40]
	str r7, [r1, #0x3c]
	movs r2, #0
	mov sl, r2
	strh r4, [r1, #4]
	strh r5, [r1, #6]
	mov r7, r8
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
	ldr r1, _0805F7F4 @ =0x06011980
	str r1, [r0, #4]
	movs r1, #0x88
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	ldr r2, _0805F7F8 @ =gUnknown_080D94D8
	ldr r1, _0805F7FC @ =gCurrentLevel
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	strh r1, [r0, #0xa]
	ldr r7, _0805F800 @ =IWRAM_START + 0x2C
	adds r1, r3, r7
	mov r2, sl
	strb r2, [r1]
	mov r7, sb
	strh r7, [r0, #0x14]
	mov r1, sb
	strh r1, [r0, #0x1c]
	ldr r7, _0805F804 @ =IWRAM_START + 0x2D
	adds r2, r3, r7
	movs r1, #0xff
	strb r1, [r2]
	ldr r1, _0805F808 @ =IWRAM_START + 0x2E
	adds r2, r3, r1
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _0805F80C @ =IWRAM_START + 0x31
	adds r3, r3, r2
	mov r7, sl
	strb r7, [r3]
	subs r1, #0x11
	str r1, [r0, #0x28]
	movs r1, #0xa8
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	bl sub_8004558
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7EC: .4byte sub_805F928
_0805F7F0: .4byte IWRAM_START + 0xC
_0805F7F4: .4byte 0x06011980
_0805F7F8: .4byte gUnknown_080D94D8
_0805F7FC: .4byte gCurrentLevel
_0805F800: .4byte IWRAM_START + 0x2C
_0805F804: .4byte IWRAM_START + 0x2D
_0805F808: .4byte IWRAM_START + 0x2E
_0805F80C: .4byte IWRAM_START + 0x31

	thumb_func_start sub_805F810
sub_805F810: @ 0x0805F810
	push {r4, r5, r6, lr}
	ldr r0, _0805F868 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805F86C @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	ldr r0, _0805F870 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805F878
	ldr r3, _0805F874 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80601F8
	b _0805F884
	.align 2, 0
_0805F868: .4byte gCurTask
_0805F86C: .4byte gCamera
_0805F870: .4byte gUnknown_03005424
_0805F874: .4byte gPlayer
_0805F878:
	ldr r3, _0805F900 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_8060440
_0805F884:
	ldr r0, _0805F904 @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #5
	bne _0805F8CE
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805F8CE
	ldr r0, _0805F908 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805F8CE
	ldr r0, [r4, #0x3c]
	movs r1, #0xc0
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0805F8B6
	ldr r0, _0805F900 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805F8B6:
	ldr r0, [r4, #0x3c]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0805F8CE
	ldr r0, _0805F900 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #9
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805F8CE:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805F8F2
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805F8F2
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805F910
_0805F8F2:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, _0805F90C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805F922
	.align 2, 0
_0805F900: .4byte gPlayer
_0805F904: .4byte gGameMode
_0805F908: .4byte gUnknown_030053E0
_0805F90C: .4byte gCurTask
_0805F910:
	ldrb r0, [r3]
	cmp r0, #5
	beq _0805F91C
	adds r0, r5, #0
	bl sub_8004558
_0805F91C:
	adds r0, r5, #0
	bl sub_80051E8
_0805F922:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_805F928
sub_805F928: @ 0x0805F928
	push {r4, r5, r6, lr}
	ldr r0, _0805F998 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805F99C @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	ldr r0, _0805F9A0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0805F97E
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805F97E
	ldr r0, _0805F9A4 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805F9BC
_0805F97E:
	ldr r0, _0805F9A8 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0805F9B0
	ldr r3, _0805F9AC @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_8060440
	b _0805F9BC
	.align 2, 0
_0805F998: .4byte gCurTask
_0805F99C: .4byte gCamera
_0805F9A0: .4byte gGameMode
_0805F9A4: .4byte gUnknown_030053E0
_0805F9A8: .4byte gUnknown_03005424
_0805F9AC: .4byte gPlayer
_0805F9B0:
	ldr r3, _0805FA34 @ =gPlayer
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80601F8
_0805F9BC:
	ldr r0, _0805FA38 @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #5
	bne _0805FA02
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805FA02
	ldr r0, _0805FA3C @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805FA02
	ldr r0, [r4, #0x3c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F9EC
	ldr r0, _0805FA34 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805F9EC:
	ldr r0, [r4, #0x3c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805FA02
	ldr r0, _0805FA34 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #9
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805FA02:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805FA26
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805FA26
	movs r0, #0x18
	ldrsh r1, [r5, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805FA44
_0805FA26:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, _0805FA40 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805FA66
	.align 2, 0
_0805FA34: .4byte gPlayer
_0805FA38: .4byte gGameMode
_0805FA3C: .4byte gUnknown_030053E0
_0805FA40: .4byte gCurTask
_0805FA44:
	ldrb r0, [r3]
	cmp r0, #5
	bne _0805FA5A
	movs r0, #3
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0805FA5A
	ldr r0, _0805FA6C @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FA66
_0805FA5A:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0805FA66:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA6C: .4byte gUnknown_030053E0

	thumb_func_start initSprite_Interactable_Spikes_LeftRight
initSprite_Interactable_Spikes_LeftRight: @ 0x0805FA70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
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
	ldr r0, _0805FB50 @ =sub_805FBA0
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0805FB54 @ =sub_8060CF4
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r6, r0
	ldr r1, _0805FB58 @ =IWRAM_START + 0xC
	adds r7, r6, r1
	movs r2, #0
	str r2, [r0, #0x40]
	str r2, [r0, #0x3c]
	movs r3, #0
	mov sb, r3
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r1, sl
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r3, r8
	strb r3, [r0, #9]
	mov r1, sl
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
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r1]
	movs r0, #0x10
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r7, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r7, #8]
	ldr r1, _0805FB5C @ =gUnknown_080D94D8
	ldr r0, _0805FB60 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r7, #0xa]
	ldr r0, _0805FB64 @ =IWRAM_START + 0x2C
	adds r1, r6, r0
	movs r0, #3
	strb r0, [r1]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r2, _0805FB68 @ =IWRAM_START + 0x2D
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r3, _0805FB6C @ =IWRAM_START + 0x2E
	adds r1, r6, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805FB70 @ =IWRAM_START + 0x31
	adds r6, r6, r0
	mov r1, sb
	strb r1, [r6]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	movs r1, #0x88
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	ldr r0, _0805FB74 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0805FB78
	mov r2, sl
	ldrb r0, [r2, #2]
	b _0805FB7C
	.align 2, 0
_0805FB50: .4byte sub_805FBA0
_0805FB54: .4byte sub_8060CF4
_0805FB58: .4byte IWRAM_START + 0xC
_0805FB5C: .4byte gUnknown_080D94D8
_0805FB60: .4byte gCurrentLevel
_0805FB64: .4byte IWRAM_START + 0x2C
_0805FB68: .4byte IWRAM_START + 0x2D
_0805FB6C: .4byte IWRAM_START + 0x2E
_0805FB70: .4byte IWRAM_START + 0x31
_0805FB74: .4byte gGameMode
_0805FB78:
	mov r3, sl
	ldrb r0, [r3, #2]
_0805FB7C:
	cmp r0, #0x19
	bne _0805FB88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_0805FB88:
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

	thumb_func_start sub_805FBA0
sub_805FBA0: @ 0x0805FBA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _0805FCAC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _0805FCB0 @ =IWRAM_START + 0xC
	adds r0, r0, r1
	mov sl, r0
	ldr r1, [sp, #4]
	ldr r1, [r1]
	str r1, [sp]
	ldr r3, [sp, #4]
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
	ldr r3, _0805FCB4 @ =gCamera
	ldr r0, [r3]
	lsrs r4, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	mov r0, sl
	strh r2, [r0, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	mov r3, sl
	strh r1, [r3, #0x18]
	ldr r0, _0805FCB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0805FC16
	ldr r1, [sp]
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0805FC16
	ldr r0, _0805FCBC @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805FC16
	b _0805FDA4
_0805FC16:
	lsls r0, r4, #0x10
	asrs r6, r0, #0x10
	lsls r0, r2, #0x10
	asrs r7, r0, #0x10
	ldr r5, _0805FCC0 @ =gPlayer
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r4, r0, #0
	ldr r0, _0805FCC4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #0
	beq _0805FCC8
	movs r2, #0x80
	lsls r2, r2, #9
	mov r8, r2
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _0805FC6C
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r2, #0
	strh r2, [r5, #0x12]
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x20]
	str r2, [r5, #0x3c]
_0805FC6C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r4
	cmp r0, #0
	beq _0805FD12
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq _0805FD12
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	subs r1, #0xb
	ands r0, r1
	str r0, [r5, #0x20]
	mov r0, sl
	str r0, [r5, #0x3c]
	b _0805FD12
	.align 2, 0
_0805FCAC: .4byte gCurTask
_0805FCB0: .4byte IWRAM_START + 0xC
_0805FCB4: .4byte gCamera
_0805FCB8: .4byte gGameMode
_0805FCBC: .4byte gUnknown_030053E0
_0805FCC0: .4byte gPlayer
_0805FCC4: .4byte gUnknown_03005424
_0805FCC8:
	movs r1, #0x80
	lsls r1, r1, #9
	mov r8, r1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0805FCF8
	mov r0, sl
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _0805FCF8
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	mov r3, sb
	strh r3, [r5, #0x12]
_0805FCF8:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r4
	cmp r0, #0
	beq _0805FD12
	ldr r2, _0805FD5C @ =gPlayer
	lsls r1, r4, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r2, #0xc]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	movs r0, #0
	strh r0, [r2, #0x12]
_0805FD12:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r4
	cmp r3, #0
	beq _0805FD60
	ldr r2, _0805FD5C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r4, r0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	movs r0, #0
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x14]
	movs r0, #0x19
	ldr r3, [sp]
	ldrb r3, [r3, #2]
	cmp r0, r3
	beq _0805FDA4
	adds r0, r2, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0805FDA4
	movs r0, #0x9a
	bl m4aSongNumStart
	b _0805FDA4
	.align 2, 0
_0805FD5C: .4byte gPlayer
_0805FD60:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq _0805FDA4
	ldr r2, _0805FE28 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r2, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r4, r0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	strh r3, [r2, #0x10]
	strh r3, [r2, #0x14]
	movs r0, #0x19
	ldr r3, [sp]
	ldrb r3, [r3, #2]
	cmp r0, r3
	bne _0805FDA4
	adds r0, r2, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0805FDA4
	movs r0, #0x9a
	bl m4aSongNumStart
_0805FDA4:
	ldr r0, _0805FE2C @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #5
	bne _0805FDF0
	ldr r1, [sp]
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0805FDF0
	ldr r0, _0805FE30 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805FDF0
	ldr r2, [sp, #4]
	ldr r0, [r2, #0x3c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FDD8
	ldr r0, _0805FE28 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805FDD8:
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x3c]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805FDF0
	ldr r0, _0805FE28 @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r2, #9
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0x20]
_0805FDF0:
	mov r2, sl
	ldrh r0, [r2, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0805FE16
	movs r1, #0x18
	ldrsh r0, [r2, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805FE16
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0805FE38
_0805FE16:
	ldr r1, [sp, #4]
	ldrb r0, [r1, #8]
	ldr r2, [sp]
	strb r0, [r2]
	ldr r0, _0805FE34 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0805FE5C
	.align 2, 0
_0805FE28: .4byte gPlayer
_0805FE2C: .4byte gGameMode
_0805FE30: .4byte gUnknown_030053E0
_0805FE34: .4byte gCurTask
_0805FE38:
	ldrb r0, [r3]
	cmp r0, #5
	bne _0805FE50
	ldr r3, [sp]
	movs r0, #3
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0805FE50
	ldr r0, _0805FE6C @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805FE5C
_0805FE50:
	mov r0, sl
	bl sub_8004558
	mov r0, sl
	bl sub_80051E8
_0805FE5C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FE6C: .4byte gUnknown_030053E0

	thumb_func_start initSprite_Interactable_Spikes_HidingUp
initSprite_Interactable_Spikes_HidingUp: @ 0x0805FE70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0805FF48 @ =sub_805FF68
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _0805FF4C @ =sub_8060CF4
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _0805FF50 @ =IWRAM_START + 0xC
	adds r5, r2, r1
	movs r3, #0
	str r3, [r0, #0x40]
	str r3, [r0, #0x3c]
	movs r7, #0
	mov sl, r7
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	movs r0, #0x10
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r5, #8]
	ldr r0, _0805FF54 @ =0x0000FFFF
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r0, _0805FF58 @ =IWRAM_START + 0x2C
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r7, _0805FF5C @ =IWRAM_START + 0x2D
	adds r1, r2, r7
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _0805FF60 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0805FF64 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	mov r7, sl
	strb r7, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	movs r0, #0x88
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF48: .4byte sub_805FF68
_0805FF4C: .4byte sub_8060CF4
_0805FF50: .4byte IWRAM_START + 0xC
_0805FF54: .4byte 0x0000FFFF
_0805FF58: .4byte IWRAM_START + 0x2C
_0805FF5C: .4byte IWRAM_START + 0x2D
_0805FF60: .4byte IWRAM_START + 0x2E
_0805FF64: .4byte IWRAM_START + 0x31

	thumb_func_start sub_805FF68
sub_805FF68: @ 0x0805FF68
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r0, #0
	str r0, [sp, #4]
	ldr r4, _0805FFD8 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0805FFDC @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0805FFCC
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0805FFCC
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0805FFE0
_0805FFCC:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, [r4]
	bl TaskDestroy
	b _08060028
	.align 2, 0
_0805FFD8: .4byte gCurTask
_0805FFDC: .4byte gCamera
_0805FFE0:
	ldr r0, _08060000 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060008
	ldr r3, _08060004 @ =gPlayer
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8060554
	b _08060018
	.align 2, 0
_08060000: .4byte gUnknown_03005424
_08060004: .4byte gPlayer
_08060008:
	ldr r3, _08060030 @ =gPlayer
	add r1, sp, #4
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_80609B4
_08060018:
	cmp r0, #0
	beq _08060028
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_08060028:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060030: .4byte gPlayer

	thumb_func_start initSprite_Interactable_Spikes_HidingDown
initSprite_Interactable_Spikes_HidingDown: @ 0x08060034
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0806010C @ =sub_806012C
	movs r2, #0x80
	lsls r2, r2, #6
	ldr r1, _08060110 @ =sub_8060CF4
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _08060114 @ =IWRAM_START + 0xC
	adds r5, r2, r1
	movs r3, #0
	str r3, [r0, #0x40]
	str r3, [r0, #0x3c]
	movs r7, #0
	mov sl, r7
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r7, r8
	strb r7, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r7, #2
	rsbs r7, r7, #0
	adds r0, r7, #0
	strb r0, [r1]
	movs r0, #0x10
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x88
	lsls r0, r0, #3
	strh r0, [r5, #0x1a]
	ldr r3, [sp, #8]
	strh r3, [r5, #8]
	ldr r0, _08060118 @ =0x0000FFFF
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r0, _0806011C @ =IWRAM_START + 0x2C
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	strh r3, [r5, #0x14]
	strh r3, [r5, #0x1c]
	ldr r7, _08060120 @ =IWRAM_START + 0x2D
	adds r1, r2, r7
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r0, _08060124 @ =IWRAM_START + 0x2E
	adds r1, r2, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08060128 @ =IWRAM_START + 0x31
	adds r2, r2, r1
	mov r7, sl
	strb r7, [r2]
	subs r0, #0x11
	str r0, [r5, #0x28]
	movs r0, #0xa8
	lsls r0, r0, #6
	str r0, [r5, #0x10]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806010C: .4byte sub_806012C
_08060110: .4byte sub_8060CF4
_08060114: .4byte IWRAM_START + 0xC
_08060118: .4byte 0x0000FFFF
_0806011C: .4byte IWRAM_START + 0x2C
_08060120: .4byte IWRAM_START + 0x2D
_08060124: .4byte IWRAM_START + 0x2E
_08060128: .4byte IWRAM_START + 0x31

	thumb_func_start sub_806012C
sub_806012C: @ 0x0806012C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	movs r0, #0
	str r0, [sp, #4]
	ldr r4, _0806019C @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _080601A0 @ =gCamera
	ldr r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r3, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08060190
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08060190
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080601A4
_08060190:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, [r4]
	bl TaskDestroy
	b _080601EC
	.align 2, 0
_0806019C: .4byte gCurTask
_080601A0: .4byte gCamera
_080601A4:
	ldr r0, _080601C4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080601CC
	ldr r3, _080601C8 @ =gPlayer
	add r0, sp, #4
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_80609B4
	b _080601DC
	.align 2, 0
_080601C4: .4byte gUnknown_03005424
_080601C8: .4byte gPlayer
_080601CC:
	ldr r3, _080601F4 @ =gPlayer
	add r1, sp, #4
	str r1, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8060554
_080601DC:
	cmp r0, #0
	beq _080601EC
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080601EC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080601F4: .4byte gPlayer

	thumb_func_start sub_80601F8
sub_80601F8: @ 0x080601F8
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
	ldr r2, _080602C8 @ =gCamera
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
	ldr r0, _080602CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080602FC
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080602FC
	ldr r0, _080602D0 @ =gUnknown_030053E0
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _080602FC
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r8, r0
	cmp r0, #0
	beq _080602FC
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
	bl memcpy
	movs r0, #0xc0
	lsls r0, r0, #0xc
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080602A4
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
_080602A4:
	ldr r0, _080602D4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080602D8
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
	b _080602EE
	.align 2, 0
_080602C8: .4byte gCamera
_080602CC: .4byte gGameMode
_080602D0: .4byte gUnknown_030053E0
_080602D4: .4byte gUnknown_03005424
_080602D8:
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
_080602EE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	bne _080603C6
_080602FC:
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
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	beq _0806042C
	movs r3, #0xc0
	lsls r3, r3, #0xa
	ands r3, r2
	cmp r3, #0
	beq _08060404
	ldr r0, _08060388 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	beq _0806038C
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _0806042C
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
	b _080603BC
	.align 2, 0
_08060388: .4byte gUnknown_03005424
_0806038C:
	movs r0, #0x80
	lsls r0, r0, #9
	mov sb, r0
	ands r2, r0
	cmp r2, #0
	beq _0806042C
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _080603D0
	lsls r0, r2, #0x18
	asrs r0, r0, #0x10
	ldr r1, [r5, #0xc]
	adds r1, r1, r0
	str r1, [r5, #0xc]
	mov r2, sl
	strh r2, [r5, #0x12]
_080603BC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0806042C
_080603C6:
	movs r0, #0x9a
	bl m4aSongNumStart
	movs r0, #1
	b _0806042E
_080603D0:
	cmp r7, #0
	beq _080603DC
	ldr r0, [r5, #0x20]
	movs r1, #8
	orrs r0, r1
	b _080603E4
_080603DC:
	ldr r0, [r5, #0x20]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
_080603E4:
	str r0, [r5, #0x20]
	mov r7, r8
	cmp r7, #0
	beq _080603F4
	ldr r0, [r5, #0x20]
	movs r1, #2
	orrs r0, r1
	b _080603FC
_080603F4:
	ldr r0, [r5, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
_080603FC:
	str r0, [r5, #0x20]
	ldr r0, [sp, #8]
	str r0, [r5, #0x3c]
	b _0806042C
_08060404:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0806042C
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
_0806042C:
	movs r0, #0
_0806042E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8060440
sub_8060440: @ 0x08060440
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r3, #0
	ldrb r3, [r2, #8]
	lsls r3, r3, #3
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r3, r3, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r2, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r2, _080604C8 @ =gCamera
	ldr r0, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	subs r0, r3, r0
	strh r0, [r6, #0x16]
	ldr r0, [r2, #4]
	lsrs r7, r1, #0x10
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0806054A
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	beq _0806054A
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _080604D0
	ldr r0, _080604CC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080604D0
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r5, r0
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	adds r0, #1
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	strh r3, [r4, #0x12]
	strh r3, [r4, #0x14]
	b _08060508
	.align 2, 0
_080604C8: .4byte gCamera
_080604CC: .4byte gUnknown_03005424
_080604D0:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r2
	cmp r0, #0
	beq _08060520
	ldr r0, _0806051C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08060520
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	subs r0, #1
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x14]
_08060508:
	adds r0, r4, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _0806054A
	movs r0, #0x9a
	bl m4aSongNumStart
	movs r0, #1
	b _0806054C
	.align 2, 0
_0806051C: .4byte gUnknown_03005424
_08060520:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _0806054A
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x14]
_0806054A:
	movs r0, #0
_0806054C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8060554
sub_8060554: @ 0x08060554
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r2
	adds r5, r3, #0
	ldr r0, _080605F4 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0
	str r4, [sp, #0xc]
	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2
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
	ldr r3, _080605F8 @ =gCamera
	ldr r0, [r3]
	lsrs r7, r2, #0x10
	str r7, [sp, #8]
	asrs r2, r2, #0x10
	mov r8, r2
	subs r0, r2, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r1, #0x10
	asrs r7, r1, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	cmp r4, #0x3b
	bhi _080605FC
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080605D0
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _080605D0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_080605D0:
	mov r0, sl
	lsls r1, r0, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080605F0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_080605F0:
	movs r0, #0
	b _0806099A
	.align 2, 0
_080605F4: .4byte gUnknown_03005590
_080605F8: .4byte gCamera
_080605FC:
	cmp r4, #0x3d
	bhi _08060660
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806061C
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _0806061C
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_0806061C:
	mov r2, sl
	lsls r1, r2, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0806063C
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_0806063C:
	ldr r1, _08060658 @ =gUnknown_080D94D8
	ldr r0, _0806065C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060928
	.align 2, 0
_08060658: .4byte gUnknown_080D94D8
_0806065C: .4byte gCurrentLevel
_08060660:
	cmp r4, #0x3f
	bhi _08060686
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060680
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060680
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060680:
	mov r3, sl
	lsls r1, r3, #2
	b _080608F4
_08060686:
	cmp r4, #0x7b
	bls _0806068C
	b _080608CE
_0806068C:
	adds r2, r6, #0
	adds r2, #0x20
	ldrb r0, [r2]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _080606AA
	cmp r1, #0
	bne _080606A0
	b _080607EA
_080606A0:
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	bne _080606AA
	b _080607EA
_080606AA:
	cmp r1, #0
	bne _080606B4
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_080606B4:
	ldr r1, _0806074C @ =gUnknown_080D94D8
	ldr r0, _08060750 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r2]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _08060786
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _080606FC
	b _08060998
_080606FC:
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
	bl memcpy
	ldr r0, _08060754 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060758
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
	b _0806076E
	.align 2, 0
_0806074C: .4byte gUnknown_080D94D8
_08060750: .4byte gCurrentLevel
_08060754: .4byte gUnknown_03005424
_08060758:
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
_0806076E:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
_08060772:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	bne _0806077E
	b _08060998
_0806077E:
	movs r0, #0x9a
	bl m4aSongNumStart
	b _08060998
_08060786:
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	cmp r2, #0
	bne _0806079A
	b _08060998
_0806079A:
	movs r4, #0x80
	lsls r4, r4, #9
	adds r3, r2, #0
	ands r3, r4
	cmp r3, #0
	beq _080607BE
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	ands r2, r4
	cmp r2, #0
	bne _080607BC
	b _08060998
_080607BC:
	b _08060772
_080607BE:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	bne _080607CA
	b _08060998
_080607CA:
	ldr r0, [r5, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r5, #0x20]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	strh r3, [r5, #0x14]
	b _08060998
_080607EA:
	ldr r7, [sp, #8]
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r3, #0x10
	asrs r7, r4, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r2, r0, #0
	adds r3, r4, #0
	cmp r2, #0
	beq _080608BE
	movs r4, #0x80
	lsls r4, r4, #9
	ands r0, r4
	cmp r0, #0
	beq _08060844
	ldr r0, _08060840 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060844
	adds r0, r6, #0
	mov r1, r8
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8060D08
	adds r2, r0, #0
	ands r2, r4
	cmp r2, #0
	beq _080608BE
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _080608BE
	b _0806077E
	.align 2, 0
_08060840: .4byte gUnknown_03005424
_08060844:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r2
	cmp r0, #0
	beq _08060894
	ldr r0, _08060890 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08060894
	asrs r0, r3, #0x10
	adds r1, r6, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
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
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _080608BE
	b _0806077E
	.align 2, 0
_08060890: .4byte gUnknown_03005424
_08060894:
	movs r0, #0xc0
	lsls r0, r0, #0xc
	ands r0, r2
	cmp r0, #0
	beq _080608BE
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
	movs r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x14]
_080608BE:
	mov r2, sl
	lsls r0, r2, #2
	mov r1, sb
	adds r1, #0x3c
	adds r1, r1, r0
	ldr r0, [r5, #0x20]
	str r0, [r1]
	b _08060998
_080608CE:
	ldr r3, [sp, #0xc]
	cmp r3, #0x7d
	bhi _0806093C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080608F0
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _080608F0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_080608F0:
	mov r4, sl
	lsls r1, r4, #2
_080608F4:
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060910
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060910:
	ldr r1, _08060934 @ =gUnknown_080D94D8
	ldr r0, _08060938 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060928:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b _08060998
	.align 2, 0
_08060934: .4byte gUnknown_080D94D8
_08060938: .4byte gCurrentLevel
_0806093C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060958
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060958
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060958:
	mov r7, sl
	lsls r1, r7, #2
	mov r0, sb
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060978
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060978:
	ldr r1, _080609AC @ =gUnknown_080D94D8
	ldr r0, _080609B0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
_08060998:
	movs r0, #1
_0806099A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080609AC: .4byte gUnknown_080D94D8
_080609B0: .4byte gCurrentLevel

	thumb_func_start sub_80609B4
sub_80609B4: @ 0x080609B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r7, r2, #0
	adds r5, r3, #0
	ldr r0, _08060A58 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0
	str r4, [sp, #0xc]
	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08060A5C @ =gCamera
	ldr r0, [r3]
	mov sb, r0
	lsrs r0, r2, #0x10
	str r0, [sp, #8]
	asrs r2, r2, #0x10
	mov r8, r2
	mov r0, sb
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1
	subs r0, r1, r0
	strh r0, [r6, #0x18]
	cmp r4, #0x3b
	bhi _08060A60
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A34
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A34
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A34:
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060A54
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060A54:
	movs r0, #0
	b _08060CDA
	.align 2, 0
_08060A58: .4byte gUnknown_03005590
_08060A5C: .4byte gCamera
_08060A60:
	cmp r4, #0x3d
	bhi _08060AC4
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A80
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A80
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A80:
	mov r4, sl
	lsls r1, r4, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060AA0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060AA0:
	ldr r1, _08060ABC @ =gUnknown_080D94D8
	ldr r0, _08060AC0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060C68
	.align 2, 0
_08060ABC: .4byte gUnknown_080D94D8
_08060AC0: .4byte gCurrentLevel
_08060AC4:
	cmp r4, #0x3f
	bhi _08060AEA
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060AE4
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060AE4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060AE4:
	mov r0, sl
	lsls r1, r0, #2
	b _08060C34
_08060AEA:
	cmp r4, #0x7b
	bls _08060AF0
	b _08060C0E
_08060AF0:
	adds r3, r6, #0
	adds r3, #0x20
	ldrb r0, [r3]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _08060B0A
	cmp r1, #0
	beq _08060BD4
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	beq _08060BD4
_08060B0A:
	cmp r1, #0
	bne _08060B14
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_08060B14:
	ldr r1, _08060BAC @ =gUnknown_080D94D8
	ldr r0, _08060BB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	beq _08060B46
	b _08060CD8
_08060B46:
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08060B5E
	b _08060CD8
_08060B5E:
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
	bl memcpy
	ldr r0, _08060BB4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060BB8
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _08060BCE
	.align 2, 0
_08060BAC: .4byte gUnknown_080D94D8
_08060BB0: .4byte gCurrentLevel
_08060BB4: .4byte gUnknown_03005424
_08060BB8:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_08060BCE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	b _08060BFC
_08060BD4:
	ldr r4, [sp, #8]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r1, sl
	lsls r2, r1, #2
	adds r1, r7, #0
	adds r1, #0x3c
	adds r1, r1, r2
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _08060CD8
_08060BFC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq _08060CD8
	movs r0, #0x9a
	bl m4aSongNumStart
	b _08060CD8
_08060C0E:
	ldr r2, [sp, #0xc]
	cmp r2, #0x7d
	bhi _08060C7C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C30
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C30
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C30:
	mov r4, sl
	lsls r1, r4, #2
_08060C34:
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060C50
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060C50:
	ldr r1, _08060C74 @ =gUnknown_080D94D8
	ldr r0, _08060C78 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060C68:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b _08060CD8
	.align 2, 0
_08060C74: .4byte gUnknown_080D94D8
_08060C78: .4byte gCurrentLevel
_08060C7C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C98
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C98
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C98:
	mov r0, sl
	lsls r1, r0, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060CB8
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060CB8:
	ldr r1, _08060CEC @ =gUnknown_080D94D8
	ldr r0, _08060CF0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
_08060CD8:
	movs r0, #1
_08060CDA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060CEC: .4byte gUnknown_080D94D8
_08060CF0: .4byte gCurrentLevel

	thumb_func_start sub_8060CF4
sub_8060CF4: @ 0x08060CF4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8060D08
sub_8060D08: @ 0x08060D08
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
	bl sub_800CCB8
	ldrb r1, [r5]
	subs r1, #1
	strb r1, [r5]
	ldrb r1, [r6]
	adds r1, #1
	strb r1, [r6]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_8060D34
sub_8060D34: @ 0x08060D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _08060E24 @ =gCurTask
	ldr r0, [r3]
	str r0, [sp]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, [r5]
	mov sb, r1
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	mov ip, r0
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _08060E28 @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r2, #0x80
	mov sl, r2
	mov r0, sl
	ands r0, r6
	mov sl, r0
	cmp r0, #0
	beq _08060D80
	b _08060E7A
_08060D80:
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r2, r0
	ldr r3, [r7, #8]
	str r3, [sp, #4]
	asrs r4, r3, #8
	cmp r1, r4
	bgt _08060E72
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r4
	blt _08060E72
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08060E72
	mov r3, sb
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08060E72
	cmp ip, r4
	bge _08060E3C
	ldrb r1, [r5, #9]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _08060E6C
	adds r1, r7, #0
	adds r1, #0x6d
	movs r0, #0x1b
	strb r0, [r1]
	mov r1, ip
	subs r0, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08060E2C @ =0x000003FF
	ands r0, r1
	movs r3, #0x14
	ldrsh r1, [r7, r3]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	str r1, [r7, #8]
	mov r3, r8
	lsls r2, r3, #8
	ldr r1, _08060E30 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08060E34 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r7, #0xc]
	mov r2, sl
	strh r2, [r7, #0x12]
	ldr r0, _08060E38 @ =sub_8060ED0
	ldr r3, [sp]
	str r0, [r3, #8]
	b _08060E7A
	.align 2, 0
_08060E24: .4byte gCurTask
_08060E28: .4byte gPlayer
_08060E2C: .4byte 0x000003FF
_08060E30: .4byte gSineTable
_08060E34: .4byte 0xFFFFE400
_08060E38: .4byte sub_8060ED0
_08060E3C:
	movs r0, #0x14
	ldrsh r1, [r7, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ldrb r3, [r5, #9]
	cmp r1, r0
	ble _08060E6C
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	bne _08060E6C
	adds r0, r7, #0
	adds r0, #0x5e
	ldr r1, _08060E68 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _08060E6C
	movs r0, #1
	orrs r0, r3
	b _08060E78
	.align 2, 0
_08060E68: .4byte gPlayerControls
_08060E6C:
	movs r0, #0xfe
	ands r0, r3
	b _08060E78
_08060E72:
	ldrb r1, [r5, #9]
	movs r0, #0xfe
	ands r0, r1
_08060E78:
	strb r0, [r5, #9]
_08060E7A:
	ldr r1, _08060EC8 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r2, r2, r0
	mov ip, r2
	ldr r0, [r1, #4]
	mov r3, r8
	subs r3, r3, r0
	mov r8, r3
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08060EA8
	mov r0, r8
	adds r0, #0x80
	cmp r0, #0
	blt _08060EA8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r8, r0
	ble _08060EB6
_08060EA8:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r2, _08060ECC @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
_08060EB6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060EC8: .4byte gCamera
_08060ECC: .4byte gCurTask

	thumb_func_start sub_8060ED0
sub_8060ED0: @ 0x08060ED0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08060F20 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r5, [r7]
	mov r8, r5
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _08060F24 @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sl, r0
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08060F28
	mov r1, r8
	strb r3, [r1]
	mov r5, ip
	ldr r0, [r5]
	bl TaskDestroy
	b _08061072
	.align 2, 0
_08060F20: .4byte gCurTask
_08060F24: .4byte gPlayer
_08060F28:
	ldr r2, [r4, #8]
	asrs r0, r2, #8
	subs r3, r0, r1
	movs r0, #0x8c
	lsls r0, r0, #2
	cmp r3, r0
	ble _08060F60
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _08060F46
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _08060F4C
_08060F46:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08060F4C:
	strb r0, [r1]
	ldr r0, _08060F58 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08060F5C @ =sub_8060D34
	str r0, [r1, #8]
	b _08061072
	.align 2, 0
_08060F58: .4byte gCurTask
_08060F5C: .4byte sub_8060D34
_08060F60:
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r3, r1
	ldr r0, _08060FC4 @ =0x000003FF
	mov r8, r0
	ands r3, r0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, #8]
	mov r0, sl
	lsls r2, r0, #8
	ldr r1, _08060FC8 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08060FCC @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0x10]
	cmp r1, r0
	bge _08060FD4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08060FD0 @ =sub_8060D34
	mov r1, sb
	str r0, [r1, #8]
	b _08061072
	.align 2, 0
_08060FC4: .4byte 0x000003FF
_08060FC8: .4byte gSineTable
_08060FCC: .4byte 0xFFFFE400
_08060FD0: .4byte sub_8060D34
_08060FD4:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061004 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08061010
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08061008 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806100C @ =sub_8060D34
	mov r5, sb
	str r0, [r5, #8]
	b _08061072
	.align 2, 0
_08061004: .4byte gPlayerControls
_08061008: .4byte 0x0000FB20
_0806100C: .4byte sub_8060D34
_08061010:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _08061072
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08061044
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _08061072
_08061044:
	ldr r1, _08061080 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r1, _08061084 @ =0xFFFFFEE6
	adds r0, r3, r1
	mov r5, r8
	ands r0, r5
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_08061072:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061080: .4byte gUnknown_080D672C
_08061084: .4byte 0xFFFFFEE6

	thumb_func_start sub_8061088
sub_8061088: @ 0x08061088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _08061178 @ =gCurTask
	ldr r0, [r3]
	str r0, [sp]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, [r5]
	mov sb, r1
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	mov ip, r0
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _0806117C @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r2, #0x80
	mov sl, r2
	mov r0, sl
	ands r0, r6
	mov sl, r0
	cmp r0, #0
	beq _080610D4
	b _080611D2
_080610D4:
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r2, r0
	ldr r3, [r7, #8]
	str r3, [sp, #4]
	asrs r4, r3, #8
	cmp r1, r4
	bgt _080611CA
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r4
	blt _080611CA
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080611CA
	mov r3, sb
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080611CA
	cmp ip, r4
	ble _08061190
	ldrb r1, [r5, #9]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _080611C4
	adds r1, r7, #0
	adds r1, #0x6d
	movs r0, #0x1b
	strb r0, [r1]
	mov r1, ip
	subs r0, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08061180 @ =0x000003FF
	ands r0, r1
	movs r3, #0x14
	ldrsh r1, [r7, r3]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	str r1, [r7, #8]
	mov r3, r8
	lsls r2, r3, #8
	ldr r1, _08061184 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061188 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r7, #0xc]
	mov r2, sl
	strh r2, [r7, #0x12]
	ldr r0, _0806118C @ =sub_8061228
	ldr r3, [sp]
	str r0, [r3, #8]
	b _080611D2
	.align 2, 0
_08061178: .4byte gCurTask
_0806117C: .4byte gPlayer
_08061180: .4byte 0x000003FF
_08061184: .4byte gSineTable
_08061188: .4byte 0xFFFFE400
_0806118C: .4byte sub_8061228
_08061190:
	movs r0, #0x14
	ldrsh r1, [r7, r0]
	ldr r0, _080611BC @ =0xFFFFFC00
	ldrb r3, [r5, #9]
	cmp r1, r0
	bge _080611C4
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	bne _080611C4
	adds r0, r7, #0
	adds r0, #0x5e
	ldr r1, _080611C0 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _080611C4
	movs r0, #1
	orrs r0, r3
	b _080611D0
	.align 2, 0
_080611BC: .4byte 0xFFFFFC00
_080611C0: .4byte gPlayerControls
_080611C4:
	movs r0, #0xfe
	ands r0, r3
	b _080611D0
_080611CA:
	ldrb r1, [r5, #9]
	movs r0, #0xfe
	ands r0, r1
_080611D0:
	strb r0, [r5, #9]
_080611D2:
	ldr r1, _08061220 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r2, r2, r0
	mov ip, r2
	ldr r0, [r1, #4]
	mov r3, r8
	subs r3, r3, r0
	mov r8, r3
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08061200
	mov r0, r8
	adds r0, #0x80
	cmp r0, #0
	blt _08061200
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r8, r0
	ble _0806120E
_08061200:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r2, _08061224 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
_0806120E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061220: .4byte gCamera
_08061224: .4byte gCurTask

	thumb_func_start sub_8061228
sub_8061228: @ 0x08061228
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061278 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r5, [r7]
	mov r8, r5
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _0806127C @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sl, r0
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _08061280
	mov r1, r8
	strb r3, [r1]
	mov r5, ip
	ldr r0, [r5]
	bl TaskDestroy
	b _080613CE
	.align 2, 0
_08061278: .4byte gCurTask
_0806127C: .4byte gPlayer
_08061280:
	ldr r2, [r4, #8]
	asrs r0, r2, #8
	subs r3, r0, r1
	ldr r0, _0806129C @ =0xFFFFFDD0
	cmp r3, r0
	bge _080612BC
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _080612A0
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _080612A6
	.align 2, 0
_0806129C: .4byte 0xFFFFFDD0
_080612A0:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_080612A6:
	strb r0, [r1]
	ldr r0, _080612B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080612B8 @ =sub_8061088
	str r0, [r1, #8]
	b _080613CE
	.align 2, 0
_080612B4: .4byte gCurTask
_080612B8: .4byte sub_8061088
_080612BC:
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r1, #0x80
	lsls r1, r1, #1
	adds r3, r3, r1
	ldr r0, _08061320 @ =0x000003FF
	mov r8, r0
	ands r3, r0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	adds r0, r2, r0
	str r0, [r4, #8]
	mov r0, sl
	lsls r2, r0, #8
	ldr r1, _08061324 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061328 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0x10]
	cmp r1, r0
	ble _08061330
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806132C @ =sub_8061088
	mov r1, sb
	str r0, [r1, #8]
	b _080613CE
	.align 2, 0
_08061320: .4byte 0x000003FF
_08061324: .4byte gSineTable
_08061328: .4byte 0xFFFFE400
_0806132C: .4byte sub_8061088
_08061330:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061360 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0806136C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08061364 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061368 @ =sub_8061088
	mov r5, sb
	str r0, [r5, #8]
	b _080613CE
	.align 2, 0
_08061360: .4byte gPlayerControls
_08061364: .4byte 0x0000FB20
_08061368: .4byte sub_8061088
_0806136C:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _080613CE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080613A0
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _080613CE
_080613A0:
	ldr r1, _080613DC @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r1, _080613E0 @ =0xFFFFFEE6
	adds r0, r3, r1
	mov r5, r8
	ands r0, r5
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_080613CE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080613DC: .4byte gUnknown_080D672C
_080613E0: .4byte 0xFFFFFEE6

	thumb_func_start initSprite_Interactable_CorkScrew_Start
initSprite_Interactable_CorkScrew_Start: @ 0x080613E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08061434 @ =sub_8060D34
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r6]
	strb r2, [r0, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	str r1, [r0, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061434: .4byte sub_8060D34

	thumb_func_start initSprite_Interactable_CorkScrew_End
initSprite_Interactable_CorkScrew_End: @ 0x08061438
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08061484 @ =sub_8061088
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x14
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r2, #2
	rsbs r2, r2, #0
	adds r1, r2, #0
	strb r1, [r6]
	ldr r1, _08061488 @ =0xFFFFFC00
	str r1, [r0, #0x10]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061484: .4byte sub_8061088
_08061488: .4byte 0xFFFFFC00

	thumb_func_start sub_806148C
sub_806148C: @ 0x0806148C
	push {r4, r5, lr}
	ldr r5, _080614DC @ =gPlayer
	ldr r4, [r5, #8]
	asrs r2, r4, #8
	subs r2, r2, r0
	lsls r3, r2, #4
	subs r3, r3, r2
	lsls r0, r3, #5
	subs r0, r0, r3
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r2, _080614E0 @ =0x000003FF
	ands r0, r2
	movs r3, #0x14
	ldrsh r2, [r5, r3]
	adds r4, r4, r2
	str r4, [r5, #8]
	lsls r1, r1, #8
	ldr r3, _080614E4 @ =gSineTable
	lsls r2, r0, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r2, r1
	ldr r1, _080614E8 @ =0xFFFFE400
	adds r2, r2, r1
	str r2, [r5, #0xc]
	movs r1, #0
	strh r1, [r5, #0x12]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080614DC: .4byte gPlayer
_080614E0: .4byte 0x000003FF
_080614E4: .4byte gSineTable
_080614E8: .4byte 0xFFFFE400

	thumb_func_start initSprite_Interactable_BouncyBar
initSprite_Interactable_BouncyBar: @ 0x080614EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov sl, r6
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080615E4 @ =sub_806160C
	ldr r2, _080615E8 @ =0x00002010
	ldr r1, _080615EC @ =TaskDestructor_80095E8
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, _080615F0 @ =IWRAM_START + 0xC
	adds r7, r4, r2
	movs r3, #0
	movs r2, #0
	strh r5, [r1, #4]
	mov r6, sl
	strh r6, [r1, #6]
	mov r0, sb
	str r0, [r1]
	ldrb r0, [r0]
	strb r0, [r1, #8]
	mov r6, r8
	strb r6, [r1, #9]
	ldr r6, _080615F4 @ =IWRAM_START + 0x3C
	adds r0, r4, r6
	strb r3, [r0]
	adds r6, #1
	adds r0, r4, r6
	strb r3, [r0]
	strh r2, [r1, #0x3e]
	ldr r1, _080615F8 @ =IWRAM_START + 0x40
	adds r0, r4, r1
	strh r2, [r0]
	mov r6, sb
	ldrb r0, [r6]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	strh r0, [r7, #0x16]
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	mov r1, sl
	lsls r6, r1, #8
	adds r0, r0, r6
	strh r0, [r7, #0x18]
	movs r6, #2
	rsbs r6, r6, #0
	adds r0, r6, #0
	mov r1, sb
	strb r0, [r1]
	movs r0, #0x18
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _080615FC @ =0x0000021A
	strh r0, [r7, #0xa]
	ldr r6, _08061600 @ =IWRAM_START + 0x2C
	adds r0, r4, r6
	ldr r3, [sp, #8]
	strb r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	ldr r2, [sp, #4]
	strh r2, [r7, #8]
	strh r2, [r7, #0x14]
	strh r2, [r7, #0x1c]
	ldr r0, _08061604 @ =IWRAM_START + 0x2D
	adds r1, r4, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08061608 @ =IWRAM_START + 0x2E
	adds r1, r4, r2
	movs r0, #0x10
	strb r0, [r1]
	adds r6, #5
	adds r4, r4, r6
	strb r3, [r4]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r7, #0x10]
	mov r2, sb
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080615D2
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r0, r1
	str r0, [r7, #0x10]
_080615D2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080615E4: .4byte sub_806160C
_080615E8: .4byte 0x00002010
_080615EC: .4byte TaskDestructor_80095E8
_080615F0: .4byte IWRAM_START + 0xC
_080615F4: .4byte IWRAM_START + 0x3C
_080615F8: .4byte IWRAM_START + 0x40
_080615FC: .4byte 0x0000021A
_08061600: .4byte IWRAM_START + 0x2C
_08061604: .4byte IWRAM_START + 0x2D
_08061608: .4byte IWRAM_START + 0x2E

	thumb_func_start sub_806160C
sub_806160C: @ 0x0806160C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080616D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r6, r1, r0
	ldr r4, _080616D8 @ =IWRAM_START + 0xC
	add r4, r8
	ldr r2, [r6]
	mov sl, r2
	ldrb r1, [r6, #8]
	lsls r1, r1, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov sb, r1
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r5, r1, r0
	ldr r1, _080616DC @ =gCamera
	ldr r0, [r1]
	mov r2, sb
	subs r0, r2, r0
	strh r0, [r4, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r4, #0x18]
	ldr r7, _080616E0 @ =gPlayer
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _08061750
	str r7, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #1
	bne _08061750
	ldrh r0, [r7, #0x12]
	lsls r2, r0, #0x10
	cmp r2, #0
	ble _08061750
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	adds r0, #4
	cmp r0, r5
	bge _08061750
	adds r1, r7, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	asrs r0, r2, #0x1a
	ldr r2, _080616E4 @ =IWRAM_START + 0x3C
	add r2, r8
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080616AA
	movs r0, #2
	strb r0, [r2]
_080616AA:
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, #0xa
	ldr r1, _080616E8 @ =IWRAM_START + 0x3D
	add r1, r8
	strb r0, [r1]
	ldr r1, _080616EC @ =gUnknown_080D94E8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x3e]
	ldr r0, [r7, #8]
	asrs r0, r0, #8
	mov r1, sb
	subs r2, r1, r0
	cmp r2, #0
	blt _080616F0
	adds r1, r2, #0
	b _080616F4
	.align 2, 0
_080616D4: .4byte gCurTask
_080616D8: .4byte IWRAM_START + 0xC
_080616DC: .4byte gCamera
_080616E0: .4byte gPlayer
_080616E4: .4byte IWRAM_START + 0x3C
_080616E8: .4byte IWRAM_START + 0x3D
_080616EC: .4byte gUnknown_080D94E8
_080616F0:
	mov r2, sb
	subs r1, r0, r2
_080616F4:
	adds r0, r6, #0
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, _0806173C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08061740 @ =sub_80617A4
	str r0, [r1, #8]
	ldr r2, _08061744 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, r6, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	movs r3, #2
	subs r0, r3, r0
	strb r0, [r2]
	ldr r0, _08061748 @ =0x0000021A
	strh r0, [r4, #0xa]
	ldrb r0, [r2]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	ldrb r0, [r2]
	subs r3, r3, r0
	strb r3, [r2]
	ldr r0, _0806174C @ =0x00000117
	bl m4aSongNumStart
	b _08061788
	.align 2, 0
_0806173C: .4byte gCurTask
_08061740: .4byte sub_80617A4
_08061744: .4byte gPlayer
_08061748: .4byte 0x0000021A
_0806174C: .4byte 0x00000117
_08061750:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08061774
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08061774
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08061788
_08061774:
	ldrb r0, [r6, #8]
	mov r1, sl
	strb r0, [r1]
	ldr r0, _08061784 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08061794
	.align 2, 0
_08061784: .4byte gCurTask
_08061788:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08061794:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_80617A4
sub_80617A4: @ 0x080617A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r6, _080618A4 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	adds r0, #0xc
	adds r5, r4, r0
	ldr r1, [r7]
	mov ip, r1
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r3, _080618A8 @ =gCamera
	ldr r0, [r3]
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r3, _080618AC @ =IWRAM_START + 0x3D
	adds r2, r4, r3
	ldrb r0, [r2]
	mov r8, r6
	cmp r0, #0
	beq _0806186E
	subs r0, #1
	strb r0, [r2]
	ldr r6, _080618B0 @ =gPlayer
	ldr r0, _080618B4 @ =IWRAM_START + 0x40
	adds r3, r4, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov sb, r1
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	mov r1, sb
	muls r1, r0, r1
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	str r0, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldrb r0, [r2]
	cmp r0, #0
	bne _0806186E
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x11
	asrs r1, r1, #0x12
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x18
	ble _0806182E
	movs r3, #0x18
_0806182E:
	ldr r1, _080618B8 @ =gUnknown_080D94F2
	ldr r2, _080618BC @ =IWRAM_START + 0x3C
	adds r2, r4, r2
	str r2, [sp]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	strh r2, [r6, #0x12]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	movs r3, #0x3e
	ldrsh r1, [r7, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r1, _080618C0 @ =gUnknown_080D94EE
	ldr r4, [sp]
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r3, r0
	asrs r0, r0, #1
	adds r2, r2, r0
	strh r2, [r6, #0x12]
	ldr r0, [r6, #0x20]
	ldr r1, _080618C4 @ =0xFFBFFFFF
	ands r0, r1
	ldr r1, _080618C8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x20]
_0806186E:
	ldrh r0, [r5, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08061892
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08061892
	movs r2, #0x18
	ldrsh r1, [r5, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080618CC
_08061892:
	ldrb r0, [r7, #8]
	mov r3, ip
	strb r0, [r3]
	mov r4, r8
	ldr r0, [r4]
	bl TaskDestroy
	b _080618F8
	.align 2, 0
_080618A4: .4byte gCurTask
_080618A8: .4byte gCamera
_080618AC: .4byte IWRAM_START + 0x3D
_080618B0: .4byte gPlayer
_080618B4: .4byte IWRAM_START + 0x40
_080618B8: .4byte gUnknown_080D94F2
_080618BC: .4byte IWRAM_START + 0x3C
_080618C0: .4byte gUnknown_080D94EE
_080618C4: .4byte 0xFFBFFFFF
_080618C8: .4byte 0xFFFFFEFF
_080618CC:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _080618F2
	movs r1, #0
	ldr r0, _08061908 @ =0x0000021A
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0806190C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08061910 @ =sub_806160C
	str r0, [r1, #8]
_080618F2:
	adds r0, r5, #0
	bl sub_80051E8
_080618F8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061908: .4byte 0x0000021A
_0806190C: .4byte gCurTask
_08061910: .4byte sub_806160C

	thumb_func_start sub_8061914
sub_8061914: @ 0x08061914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _08061A04 @ =gCurTask
	ldr r0, [r3]
	str r0, [sp]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, [r5]
	mov sb, r1
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	mov ip, r0
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _08061A08 @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r2, #0x80
	mov sl, r2
	mov r0, sl
	ands r0, r6
	mov sl, r0
	cmp r0, #0
	beq _08061960
	b _08061A5A
_08061960:
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r2, r0
	ldr r3, [r7, #8]
	str r3, [sp, #4]
	asrs r4, r3, #8
	cmp r1, r4
	bgt _08061A52
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r4
	blt _08061A52
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _08061A52
	mov r3, sb
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _08061A52
	cmp ip, r4
	bge _08061A1C
	ldrb r1, [r5, #9]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _08061A4C
	adds r1, r7, #0
	adds r1, #0x6d
	movs r0, #0x1b
	strb r0, [r1]
	mov r1, ip
	subs r0, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08061A0C @ =0x000003FF
	ands r0, r1
	movs r3, #0x14
	ldrsh r1, [r7, r3]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	str r1, [r7, #8]
	mov r3, r8
	lsls r2, r3, #8
	ldr r1, _08061A10 @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061A14 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r7, #0xc]
	mov r2, sl
	strh r2, [r7, #0x12]
	ldr r0, _08061A18 @ =sub_8061AB0
	ldr r3, [sp]
	str r0, [r3, #8]
	b _08061A5A
	.align 2, 0
_08061A04: .4byte gCurTask
_08061A08: .4byte gPlayer
_08061A0C: .4byte 0x000003FF
_08061A10: .4byte gSineTable
_08061A14: .4byte 0xFFFFE400
_08061A18: .4byte sub_8061AB0
_08061A1C:
	movs r0, #0x14
	ldrsh r1, [r7, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ldrb r3, [r5, #9]
	cmp r1, r0
	ble _08061A4C
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	bne _08061A4C
	adds r0, r7, #0
	adds r0, #0x5e
	ldr r1, _08061A48 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _08061A4C
	movs r0, #1
	orrs r0, r3
	b _08061A58
	.align 2, 0
_08061A48: .4byte gPlayerControls
_08061A4C:
	movs r0, #0xfe
	ands r0, r3
	b _08061A58
_08061A52:
	ldrb r1, [r5, #9]
	movs r0, #0xfe
	ands r0, r1
_08061A58:
	strb r0, [r5, #9]
_08061A5A:
	ldr r1, _08061AA8 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r2, r2, r0
	mov ip, r2
	ldr r0, [r1, #4]
	mov r3, r8
	subs r3, r3, r0
	mov r8, r3
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08061A88
	mov r0, r8
	adds r0, #0x80
	cmp r0, #0
	blt _08061A88
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r8, r0
	ble _08061A96
_08061A88:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r2, _08061AAC @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
_08061A96:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061AA8: .4byte gCamera
_08061AAC: .4byte gCurTask

	thumb_func_start sub_8061AB0
sub_8061AB0: @ 0x08061AB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061B00 @ =gCurTask
	ldr r0, [r0]
	mov sl, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r3, [r1]
	ldrh r0, [r1, #4]
	ldrh r2, [r1, #6]
	ldr r4, _08061B04 @ =gPlayer
	ldrb r7, [r1, #8]
	lsls r1, r7, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sb, r0
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r1, #0x80
	ands r6, r1
	cmp r6, #0
	beq _08061B08
	strb r7, [r3]
	ldr r2, _08061B00 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _08061C56
	.align 2, 0
_08061B00: .4byte gCurTask
_08061B04: .4byte gPlayer
_08061B08:
	ldr r2, [r4, #8]
	asrs r0, r2, #8
	mov r1, r8
	subs r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r7, r0, #8
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	ldr r1, _08061B78 @ =0x000003FF
	ands r7, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	str r2, [r4, #8]
	mov r0, sb
	lsls r3, r0, #8
	ldr r1, _08061B7C @ =gSineTable
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r1, _08061B80 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	asrs r2, r2, #8
	mov r0, r8
	subs r2, r2, r0
	cmp r2, #0x8c
	ble _08061B8C
	adds r0, #0x8c
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	bne _08061B6E
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x30
	strh r0, [r1]
_08061B6E:
	ldr r2, _08061B84 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08061B88 @ =sub_8061C70
	str r0, [r1, #8]
	b _08061C56
	.align 2, 0
_08061B78: .4byte 0x000003FF
_08061B7C: .4byte gSineTable
_08061B80: .4byte 0xFFFFE400
_08061B84: .4byte gCurTask
_08061B88: .4byte sub_8061C70
_08061B8C:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov r2, ip
	ldr r0, [r2, #0xc]
	cmp r1, r0
	bge _08061BB8
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061BB4 @ =sub_8061914
	mov r1, sl
	str r0, [r1, #8]
	b _08061C56
	.align 2, 0
_08061BB4: .4byte sub_8061914
_08061BB8:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061BE8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08061BF4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08061BEC @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061BF0 @ =sub_8061914
	mov r2, sl
	str r0, [r2, #8]
	b _08061C56
	.align 2, 0
_08061BE8: .4byte gPlayerControls
_08061BEC: .4byte 0x0000FB20
_08061BF0: .4byte sub_8061914
_08061BF4:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _08061C56
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08061C28
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _08061C56
_08061C28:
	ldr r1, _08061C64 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r1, _08061C68 @ =0xFFFFFEE6
	adds r0, r7, r1
	ldr r2, _08061C6C @ =0x000003FF
	ands r0, r2
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_08061C56:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061C64: .4byte gUnknown_080D672C
_08061C68: .4byte 0xFFFFFEE6
_08061C6C: .4byte 0x000003FF

	thumb_func_start sub_8061C70
sub_8061C70: @ 0x08061C70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061CC0 @ =gCurTask
	mov sb, r0
	ldr r1, [r0]
	mov r8, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r7, [r3]
	ldrh r0, [r3, #4]
	ldrh r2, [r3, #6]
	ldr r4, _08061CC4 @ =gPlayer
	ldrb r6, [r3, #8]
	lsls r1, r6, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov ip, r0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	mov sl, r0
	adds r5, r2, #0
	ands r5, r0
	cmp r5, #0
	beq _08061CC8
	strb r6, [r7]
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08061D96
	.align 2, 0
_08061CC0: .4byte gCurTask
_08061CC4: .4byte gPlayer
_08061CC8:
	ldrh r0, [r4, #0x14]
	adds r6, r0, #1
	strh r6, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x8c
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r5, [r4, #0x12]
	asrs r0, r0, #8
	mov r1, ip
	subs r0, r0, r1
	cmp r0, #0xbe
	ble _08061D14
	mov r0, ip
	adds r0, #0xbe
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	bne _08061D04
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x2f
	strh r0, [r1]
_08061D04:
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _08061D10 @ =sub_8061DA4
	str r0, [r1, #8]
	b _08061D96
	.align 2, 0
_08061D10: .4byte sub_8061DA4
_08061D14:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r3, #0xc]
	cmp r1, r0
	bge _08061D2C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	strh r6, [r4, #0x12]
	b _08061D4A
_08061D2C:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061D58 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08061D64
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	ldr r0, _08061D5C @ =0x0000FB20
	strh r0, [r4, #0x12]
_08061D4A:
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061D60 @ =sub_8061914
	mov r1, r8
	str r0, [r1, #8]
	b _08061D96
	.align 2, 0
_08061D58: .4byte gPlayerControls
_08061D5C: .4byte 0x0000FB20
_08061D60: .4byte sub_8061914
_08061D64:
	movs r5, #4
	ands r2, r5
	cmp r2, #0
	bne _08061D96
	mov r0, sl
	ands r0, r1
	cmp r0, #0
	beq _08061D96
	adds r0, r4, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
_08061D96:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8061DA4
sub_8061DA4: @ 0x08061DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08061DF8 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, [r7]
	mov r8, r3
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _08061DFC @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r5, r8
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r2, r0, r2
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	mov sl, ip
	cmp r6, #0
	beq _08061E00
	mov r1, r8
	strb r3, [r1]
	mov r3, ip
	ldr r0, [r3]
	bl TaskDestroy
	b _08061F4A
	.align 2, 0
_08061DF8: .4byte gCurTask
_08061DFC: .4byte gPlayer
_08061E00:
	ldr r0, [r4, #8]
	mov r8, r0
	asrs r0, r0, #8
	subs r3, r0, r1
	movs r0, #0xd4
	lsls r0, r0, #1
	cmp r3, r0
	ble _08061E38
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _08061E20
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _08061E26
_08061E20:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_08061E26:
	strb r0, [r1]
	mov r3, sl
	ldr r1, [r3]
	ldr r0, _08061E34 @ =sub_8061914
	str r0, [r1, #8]
	b _08061F4A
	.align 2, 0
_08061E34: .4byte sub_8061914
_08061E38:
	adds r2, #0xbe
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r1, _08061E9C @ =0x000003FF
	mov sl, r1
	ands r3, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	add r0, r8
	str r0, [r4, #8]
	lsls r2, r2, #8
	ldr r1, _08061EA0 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08061EA4 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	bge _08061EAC
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061EA8 @ =sub_8061914
	mov r1, sb
	str r0, [r1, #8]
	b _08061F4A
	.align 2, 0
_08061E9C: .4byte 0x000003FF
_08061EA0: .4byte gSineTable
_08061EA4: .4byte 0xFFFFE400
_08061EA8: .4byte sub_8061914
_08061EAC:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08061EDC @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08061EE8
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08061EE0 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08061EE4 @ =sub_8061914
	mov r3, sb
	str r0, [r3, #8]
	b _08061F4A
	.align 2, 0
_08061EDC: .4byte gPlayerControls
_08061EE0: .4byte 0x0000FB20
_08061EE4: .4byte sub_8061914
_08061EE8:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _08061F4A
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08061F1C
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _08061F4A
_08061F1C:
	ldr r1, _08061F58 @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r5, _08061F5C @ =0xFFFFFEE6
	adds r0, r3, r5
	mov r1, sl
	ands r0, r1
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_08061F4A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061F58: .4byte gUnknown_080D672C
_08061F5C: .4byte 0xFFFFFEE6

	thumb_func_start sub_8061F60
sub_8061F60: @ 0x08061F60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r3, _08062050 @ =gCurTask
	ldr r0, [r3]
	str r0, [sp]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r1, [r5]
	mov sb, r1
	ldrh r1, [r5, #4]
	ldrh r2, [r5, #6]
	ldrb r0, [r5, #8]
	lsls r0, r0, #3
	lsls r1, r1, #8
	adds r0, r0, r1
	mov ip, r0
	mov r1, sb
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov r8, r0
	ldr r7, _08062054 @ =gPlayer
	ldr r6, [r7, #0x20]
	movs r2, #0x80
	mov sl, r2
	mov r0, sl
	ands r0, r6
	mov sl, r0
	cmp r0, #0
	beq _08061FAC
	b _080620AA
_08061FAC:
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r2, r0
	ldr r3, [r7, #8]
	str r3, [sp, #4]
	asrs r4, r3, #8
	cmp r1, r4
	bgt _080620A2
	mov r2, sb
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r0, r1, r0
	cmp r0, r4
	blt _080620A2
	movs r0, #4
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	mov r3, r8
	adds r2, r3, r0
	ldr r0, [r7, #0xc]
	asrs r1, r0, #8
	cmp r2, r1
	bgt _080620A2
	mov r3, sb
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r0, r2, r0
	cmp r0, r1
	blt _080620A2
	cmp ip, r4
	ble _08062068
	ldrb r1, [r5, #9]
	movs r0, #1
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _0806209C
	adds r1, r7, #0
	adds r1, #0x6d
	movs r0, #0x1b
	strb r0, [r1]
	mov r1, ip
	subs r0, r4, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r1, _08062058 @ =0x000003FF
	ands r0, r1
	movs r3, #0x14
	ldrsh r1, [r7, r3]
	ldr r2, [sp, #4]
	adds r1, r2, r1
	str r1, [r7, #8]
	mov r3, r8
	lsls r2, r3, #8
	ldr r1, _0806205C @ =gSineTable
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08062060 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r7, #0xc]
	mov r2, sl
	strh r2, [r7, #0x12]
	ldr r0, _08062064 @ =sub_8062100
	ldr r3, [sp]
	str r0, [r3, #8]
	b _080620AA
	.align 2, 0
_08062050: .4byte gCurTask
_08062054: .4byte gPlayer
_08062058: .4byte 0x000003FF
_0806205C: .4byte gSineTable
_08062060: .4byte 0xFFFFE400
_08062064: .4byte sub_8062100
_08062068:
	movs r0, #0x14
	ldrsh r1, [r7, r0]
	ldr r0, _08062094 @ =0xFFFFFC00
	ldrb r3, [r5, #9]
	cmp r1, r0
	bge _0806209C
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	bne _0806209C
	adds r0, r7, #0
	adds r0, #0x5e
	ldr r1, _08062098 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	bne _0806209C
	movs r0, #1
	orrs r0, r3
	b _080620A8
	.align 2, 0
_08062094: .4byte 0xFFFFFC00
_08062098: .4byte gPlayerControls
_0806209C:
	movs r0, #0xfe
	ands r0, r3
	b _080620A8
_080620A2:
	ldrb r1, [r5, #9]
	movs r0, #0xfe
	ands r0, r1
_080620A8:
	strb r0, [r5, #9]
_080620AA:
	ldr r1, _080620F8 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r2, r2, r0
	mov ip, r2
	ldr r0, [r1, #4]
	mov r3, r8
	subs r3, r3, r0
	mov r8, r3
	mov r1, ip
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080620D8
	mov r0, r8
	adds r0, #0x80
	cmp r0, #0
	blt _080620D8
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r8, r0
	ble _080620E6
_080620D8:
	ldrb r0, [r5, #8]
	mov r1, sb
	strb r0, [r1]
	ldr r2, _080620FC @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
_080620E6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080620F8: .4byte gCamera
_080620FC: .4byte gCurTask

	thumb_func_start sub_8062100
sub_8062100: @ 0x08062100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062150 @ =gCurTask
	ldr r0, [r0]
	mov sl, r0
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	ldr r7, [r1]
	ldrh r0, [r1, #4]
	ldrh r2, [r1, #6]
	ldr r4, _08062154 @ =gPlayer
	ldrb r3, [r1, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r8, r1
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sb, r0
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r1, #0x80
	ands r6, r1
	cmp r6, #0
	beq _08062158
	strb r3, [r7]
	ldr r2, _08062150 @ =gCurTask
	ldr r0, [r2]
	bl TaskDestroy
	b _080622AE
	.align 2, 0
_08062150: .4byte gCurTask
_08062154: .4byte gPlayer
_08062158:
	ldr r2, [r4, #8]
	asrs r0, r2, #8
	mov r1, r8
	subs r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r7, r0, #8
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	ldr r1, _080621CC @ =0x000003FF
	ands r7, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	adds r2, r2, r0
	str r2, [r4, #8]
	mov r0, sb
	lsls r3, r0, #8
	ldr r1, _080621D0 @ =gSineTable
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldr r1, _080621D4 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	asrs r2, r2, #8
	mov r0, r8
	subs r2, r2, r0
	ldr r0, _080621D8 @ =0xFFFFFEE0
	cmp r2, r0
	bge _080621E4
	add r0, r8
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	bne _080621C0
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x31
	strh r0, [r1]
_080621C0:
	ldr r2, _080621DC @ =gCurTask
	ldr r1, [r2]
	ldr r0, _080621E0 @ =sub_80622C8
	str r0, [r1, #8]
	b _080622AE
	.align 2, 0
_080621CC: .4byte 0x000003FF
_080621D0: .4byte gSineTable
_080621D4: .4byte 0xFFFFE400
_080621D8: .4byte 0xFFFFFEE0
_080621DC: .4byte gCurTask
_080621E0: .4byte sub_80622C8
_080621E4:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov r2, ip
	ldr r0, [r2, #0xc]
	cmn r1, r0
	ble _08062210
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806220C @ =sub_8061F60
	mov r1, sl
	str r0, [r1, #8]
	b _080622AE
	.align 2, 0
_0806220C: .4byte sub_8061F60
_08062210:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08062240 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0806224C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08062244 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08062248 @ =sub_8061F60
	mov r2, sl
	str r0, [r2, #8]
	b _080622AE
	.align 2, 0
_08062240: .4byte gPlayerControls
_08062244: .4byte 0x0000FB20
_08062248: .4byte sub_8061F60
_0806224C:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _080622AE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08062280
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _080622AE
_08062280:
	ldr r1, _080622BC @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r1, _080622C0 @ =0xFFFFFEE6
	adds r0, r7, r1
	ldr r2, _080622C4 @ =0x000003FF
	ands r0, r2
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_080622AE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080622BC: .4byte gUnknown_080D672C
_080622C0: .4byte 0xFFFFFEE6
_080622C4: .4byte 0x000003FF

	thumb_func_start sub_80622C8
sub_80622C8: @ 0x080622C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062318 @ =gCurTask
	mov sb, r0
	ldr r1, [r0]
	mov r8, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r7, [r3]
	ldrh r0, [r3, #4]
	ldrh r2, [r3, #6]
	ldr r4, _0806231C @ =gPlayer
	ldrb r6, [r3, #8]
	lsls r1, r6, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov ip, r0
	ldr r2, [r4, #0x20]
	movs r0, #0x80
	mov sl, r0
	adds r5, r2, #0
	ands r5, r0
	cmp r5, #0
	beq _08062320
	strb r6, [r7]
	mov r1, sb
	ldr r0, [r1]
	bl TaskDestroy
	b _08062406
	.align 2, 0
_08062318: .4byte gCurTask
_0806231C: .4byte gPlayer
_08062320:
	ldrh r0, [r4, #0x14]
	adds r6, r0, #1
	strh r6, [r4, #0x14]
	ldr r7, _0806236C @ =0xFFFFFEE0
	adds r0, r1, r7
	lsls r0, r0, #8
	str r0, [r4, #8]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r5, [r4, #0x12]
	asrs r0, r0, #8
	mov r1, ip
	subs r0, r0, r1
	movs r1, #0xff
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08062374
	mov r0, ip
	subs r0, #0xff
	lsls r0, r0, #8
	str r0, [r4, #0xc]
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	bne _08062360
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x2f
	strh r0, [r1]
_08062360:
	mov r7, sb
	ldr r1, [r7]
	ldr r0, _08062370 @ =sub_8062414
	str r0, [r1, #8]
	b _08062406
	.align 2, 0
_0806236C: .4byte 0xFFFFFEE0
_08062370: .4byte sub_8062414
_08062374:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r3, #0xc]
	cmn r1, r0
	ble _0806239C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	strh r6, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08062398 @ =sub_8061F60
	mov r1, r8
	str r0, [r1, #8]
	b _08062406
	.align 2, 0
_08062398: .4byte sub_8061F60
_0806239C:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _080623C8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080623D4
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	strh r5, [r4, #0x10]
	ldr r0, _080623CC @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _080623D0 @ =sub_8061F60
	mov r7, r8
	str r0, [r7, #8]
	b _08062406
	.align 2, 0
_080623C8: .4byte gPlayerControls
_080623CC: .4byte 0x0000FB20
_080623D0: .4byte sub_8061F60
_080623D4:
	movs r5, #4
	ands r2, r5
	cmp r2, #0
	bne _08062406
	mov r0, sl
	ands r0, r1
	cmp r0, #0
	beq _08062406
	adds r0, r4, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r5
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
_08062406:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8062414
sub_8062414: @ 0x08062414
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08062468 @ =gCurTask
	mov ip, r0
	ldr r1, [r0]
	mov sb, r1
	ldrh r1, [r1, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r3, [r7]
	mov r8, r3
	ldrh r0, [r7, #4]
	ldrh r2, [r7, #6]
	ldr r4, _0806246C @ =gPlayer
	ldrb r3, [r7, #8]
	lsls r1, r3, #3
	lsls r0, r0, #8
	adds r1, r1, r0
	mov r5, r8
	ldrb r0, [r5, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r2, r0, r2
	ldr r5, [r4, #0x20]
	adds r6, r5, #0
	movs r0, #0x80
	ands r6, r0
	mov sl, ip
	cmp r6, #0
	beq _08062470
	mov r1, r8
	strb r3, [r1]
	mov r3, ip
	ldr r0, [r3]
	bl TaskDestroy
	b _080625BE
	.align 2, 0
_08062468: .4byte gCurTask
_0806246C: .4byte gPlayer
_08062470:
	ldr r0, [r4, #8]
	mov r8, r0
	asrs r0, r0, #8
	subs r3, r0, r1
	ldr r0, _08062490 @ =0xFFFFFE58
	cmp r3, r0
	bge _080624AC
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _08062494
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #2
	b _0806249A
	.align 2, 0
_08062490: .4byte 0xFFFFFE58
_08062494:
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #1
_0806249A:
	strb r0, [r1]
	mov r3, sl
	ldr r1, [r3]
	ldr r0, _080624A8 @ =sub_8061F60
	str r0, [r1, #8]
	b _080625BE
	.align 2, 0
_080624A8: .4byte sub_8061F60
_080624AC:
	subs r2, #0xc3
	lsls r1, r3, #4
	subs r1, r1, r3
	lsls r0, r1, #5
	subs r0, r0, r1
	lsls r0, r0, #1
	asrs r3, r0, #8
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r3, r3, r0
	ldr r1, _08062510 @ =0x000003FF
	mov sl, r1
	ands r3, r1
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	add r0, r8
	str r0, [r4, #8]
	lsls r2, r2, #8
	ldr r1, _08062514 @ =gSineTable
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08062518 @ =0xFFFFE400
	adds r0, r0, r1
	str r0, [r4, #0xc]
	strh r6, [r4, #0x12]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r7, #0xc]
	cmn r1, r0
	ble _08062520
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0806251C @ =sub_8061F60
	mov r1, sb
	str r0, [r1, #8]
	b _080625BE
	.align 2, 0
_08062510: .4byte 0x000003FF
_08062514: .4byte gSineTable
_08062518: .4byte 0xFFFFE400
_0806251C: .4byte sub_8061F60
_08062520:
	adds r1, r4, #0
	adds r1, #0x5e
	ldr r0, _08062550 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _0806255C
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	ldrh r0, [r4, #0x14]
	strh r0, [r4, #0x10]
	ldr r0, _08062554 @ =0x0000FB20
	strh r0, [r4, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08062558 @ =sub_8061F60
	mov r3, sb
	str r0, [r3, #8]
	b _080625BE
	.align 2, 0
_08062550: .4byte gPlayerControls
_08062554: .4byte 0x0000FB20
_08062558: .4byte sub_8061F60
_0806255C:
	movs r6, #4
	ands r5, r6
	cmp r5, #0
	bne _080625BE
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08062590
	adds r0, r4, #0
	adds r0, #0x64
	strh r6, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #9
	strb r0, [r4, #0x17]
	ldr r0, [r4, #0x20]
	orrs r0, r6
	str r0, [r4, #0x20]
	movs r0, #0x6d
	bl m4aSongNumStart
	b _080625BE
_08062590:
	ldr r1, _080625CC @ =gUnknown_080D672C
	adds r0, r4, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0x44
	adds r1, r4, #0
	adds r1, #0x68
	strh r0, [r1]
	ldr r5, _080625D0 @ =0xFFFFFEE6
	adds r0, r3, r5
	mov r1, sl
	ands r0, r1
	movs r1, #0x5e
	bl Div
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
_080625BE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080625CC: .4byte gUnknown_080D672C
_080625D0: .4byte 0xFFFFFEE6

	thumb_func_start initSprite_Interactable_Corkscrew3D_Start
initSprite_Interactable_Corkscrew3D_Start: @ 0x080625D4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062624 @ =sub_8061914
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r6]
	strb r2, [r0, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	str r1, [r0, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062624: .4byte sub_8061914

	thumb_func_start initSprite_Interactable_Corkscrew3D_End
initSprite_Interactable_Corkscrew3D_End: @ 0x08062628
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062678 @ =sub_8061F60
	movs r2, #0x80
	lsls r2, r2, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #0x10
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r6]
	strb r2, [r0, #9]
	movs r1, #0x80
	lsls r1, r1, #3
	str r1, [r0, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062678: .4byte sub_8061F60

	thumb_func_start sub_806267C
sub_806267C: @ 0x0806267C
	push {r4, r5, r6, lr}
	ldr r6, _080626CC @ =gPlayer
	ldr r5, [r6, #8]
	asrs r3, r5, #8
	subs r3, r3, r0
	lsls r4, r3, #4
	subs r4, r4, r3
	lsls r0, r4, #5
	subs r0, r0, r4
	lsls r0, r0, #1
	asrs r0, r0, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r0, r2
	ldr r2, _080626D0 @ =0x000003FF
	ands r0, r2
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	adds r5, r5, r2
	str r5, [r6, #8]
	lsls r1, r1, #8
	ldr r3, _080626D4 @ =gSineTable
	lsls r2, r0, #1
	adds r2, r2, r3
	ldrh r3, [r2]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x16
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r2, r1
	ldr r1, _080626D8 @ =0xFFFFE400
	adds r2, r2, r1
	str r2, [r6, #0xc]
	movs r1, #0
	strh r1, [r6, #0x12]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080626CC: .4byte gPlayer
_080626D0: .4byte 0x000003FF
_080626D4: .4byte gSineTable
_080626D8: .4byte 0xFFFFE400

	thumb_func_start initSprite_Interactable_StageGoal
initSprite_Interactable_StageGoal: @ 0x080626DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _080627B0 @ =sub_80627CC
	ldr r2, _080627B4 @ =0x00002010
	ldr r1, _080627B8 @ =sub_8062E7C
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r1, _080627BC @ =IWRAM_START + 0xC
	adds r5, r2, r1
	movs r7, #0
	movs r3, #0
	mov sl, r3
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	mov r1, sb
	str r1, [r0]
	ldrb r1, [r1]
	strb r1, [r0, #8]
	mov r3, r8
	strb r3, [r0, #9]
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	strh r0, [r5, #0x16]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	strh r0, [r5, #0x18]
	movs r3, #2
	rsbs r3, r3, #0
	adds r0, r3, #0
	strb r0, [r1]
	movs r0, #4
	str r2, [sp, #4]
	bl VramMalloc
	str r0, [r5, #4]
	movs r0, #0x85
	lsls r0, r0, #2
	strh r0, [r5, #0xa]
	ldr r2, [sp, #4]
	ldr r0, _080627C0 @ =IWRAM_START + 0x2C
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r3, _080627C4 @ =IWRAM_START + 0x2D
	adds r1, r2, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #1
	strh r0, [r5, #0x1a]
	mov r0, sl
	strh r0, [r5, #8]
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x1c]
	adds r3, #1
	adds r1, r2, r3
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _080627C8 @ =IWRAM_START + 0x31
	adds r2, r2, r0
	strb r7, [r2]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r5, #0x10]
	adds r0, r5, #0
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
_080627B0: .4byte sub_80627CC
_080627B4: .4byte 0x00002010
_080627B8: .4byte sub_8062E7C
_080627BC: .4byte IWRAM_START + 0xC
_080627C0: .4byte IWRAM_START + 0x2C
_080627C4: .4byte IWRAM_START + 0x2D
_080627C8: .4byte IWRAM_START + 0x31

	thumb_func_start sub_80627CC
sub_80627CC: @ 0x080627CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08062840 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r5, r0
	ldr r1, _08062844 @ =IWRAM_START + 0xC
	adds r4, r5, r1
	ldr r7, [r3]
	ldrb r1, [r3, #8]
	lsls r1, r1, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov ip, r1
	ldrb r1, [r7, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r6, r1, r0
	ldr r1, _08062848 @ =gCamera
	ldr r0, [r1]
	mov r2, ip
	subs r0, r2, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	subs r2, r6, r1
	strh r2, [r4, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	mov r8, sb
	cmp r0, r1
	bhi _08062832
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08062832
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0806284C
_08062832:
	ldrb r0, [r3, #8]
	strb r0, [r7]
	mov r2, r8
	ldr r0, [r2]
	bl TaskDestroy
	b _08062890
	.align 2, 0
_08062840: .4byte gCurTask
_08062844: .4byte IWRAM_START + 0xC
_08062848: .4byte gCamera
_0806284C:
	ldr r3, _080628A0 @ =gPlayer
	ldr r1, [r3, #0x20]
	ldr r0, _080628A4 @ =0x00400080
	ands r1, r0
	cmp r1, #0
	bne _0806288A
	str r3, [sp]
	str r1, [sp, #4]
	adds r0, r4, #0
	mov r1, ip
	adds r2, r6, #0
	movs r3, #0
	bl sub_800C204
	cmp r0, #1
	bne _0806288A
	movs r0, #0x85
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	ldr r0, _080628A8 @ =IWRAM_START + 0x2C
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080628AC @ =IWRAM_START + 0x2D
	adds r1, r5, r2
	movs r0, #0xff
	strb r0, [r1]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _080628B0 @ =sub_80628B4
	str r0, [r1, #8]
_0806288A:
	adds r0, r4, #0
	bl sub_80051E8
_08062890:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080628A0: .4byte gPlayer
_080628A4: .4byte 0x00400080
_080628A8: .4byte IWRAM_START + 0x2C
_080628AC: .4byte IWRAM_START + 0x2D
_080628B0: .4byte sub_80628B4

	thumb_func_start sub_80628B4
sub_80628B4: @ 0x080628B4
	push {r4, r5, r6, r7, lr}
	ldr r4, _08062918 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r0, #0xc
	adds r6, r1, r0
	ldr r7, [r5]
	ldrb r1, [r5, #8]
	lsls r1, r1, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r5, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _0806291C @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r6, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r6, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0806290A
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0806290A
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08062920
_0806290A:
	ldrb r0, [r5, #8]
	strb r0, [r7]
	ldr r0, [r4]
	bl TaskDestroy
	b _0806292C
	.align 2, 0
_08062918: .4byte gCurTask
_0806291C: .4byte gCamera
_08062920:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0806292C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8062934
sub_8062934: @ 0x08062934
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080629A0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [sp]
	ldrb r2, [r0, #8]
	mov sl, r2
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	mov r3, sl
	lsls r0, r3, #3
	lsls r1, r1, #8
	adds r7, r0, r1
	ldr r1, [sp]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	mov sb, r0
	ldr r0, _080629A4 @ =gGameMode
	ldrb r5, [r0]
	cmp r5, #2
	bls _080629B4
	ldr r2, _080629A8 @ =gPlayer
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r7, r0
	ble _08062980
	b _08062A96
_08062980:
	ldr r0, [r2, #0x20]
	ldr r1, _080629AC @ =0x8000008
	ands r0, r1
	cmp r0, #0
	beq _0806298C
	b _08062A96
_0806298C:
	adds r0, r2, #0
	adds r0, #0x6d
	movs r1, #0xa
	strb r1, [r0]
	ldr r0, _080629B0 @ =gUnknown_030054D0
	str r7, [r0]
	bl sub_8062B00
	b _08062A96
	.align 2, 0
_080629A0: .4byte gCurTask
_080629A4: .4byte gGameMode
_080629A8: .4byte gPlayer
_080629AC: .4byte 0x8000008
_080629B0: .4byte gUnknown_030054D0
_080629B4:
	ldr r4, _08062A08 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	cmp r7, r0
	bgt _08062A96
	ldr r3, [r4, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r3
	cmp r0, #0
	bne _08062A96
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #0xa
	strb r0, [r1]
	ldr r2, _08062A0C @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #0x21
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08062A10 @ =gUnknown_030054D0
	str r7, [r0]
	cmp r5, #0
	bne _08062A96
	movs r0, #2
	ands r3, r0
	cmp r3, #0
	bne _08062A96
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	ble _08062A96
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _08062A14
	movs r3, #0xc8
	mov r8, r3
	b _08062A3E
	.align 2, 0
_08062A08: .4byte gPlayer
_08062A0C: .4byte gUnknown_03005424
_08062A10: .4byte gUnknown_030054D0
_08062A14:
	movs r0, #0x90
	lsls r0, r0, #4
	cmp r1, r0
	bgt _08062A24
	movs r0, #0x96
	lsls r0, r0, #1
	mov r8, r0
	b _08062A3E
_08062A24:
	movs r0, #0xa0
	lsls r0, r0, #4
	movs r2, #0xc8
	lsls r2, r2, #2
	mov r8, r2
	cmp r1, r0
	bgt _08062A38
	movs r3, #0xfa
	lsls r3, r3, #1
	mov r8, r3
_08062A38:
	mov r0, r8
	cmp r0, #0
	beq _08062A96
_08062A3E:
	ldr r1, _08062AE0 @ =gUnknown_03005450
	ldr r5, [r1]
	mov r2, r8
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08062AE4 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08062A86
	ldr r0, _08062AE8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062A86
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08062AEC @ =gUnknown_03005448
	lsrs r0, r0, #0x10
	ldrb r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08062A7E
	movs r0, #0xff
_08062A7E:
	strb r0, [r1]
	ldr r1, _08062AF0 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08062A86:
	ldr r1, _08062AF4 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	ldr r1, [r1, #0xc]
	asrs r1, r1, #8
	mov r2, r8
	bl sub_801F3A4
_08062A96:
	ldr r1, _08062AF8 @ =gCamera
	ldr r0, [r1]
	subs r7, r7, r0
	ldr r0, [r1, #4]
	mov r1, sb
	subs r1, r1, r0
	mov sb, r1
	adds r1, r7, #0
	adds r1, #0x80
	movs r0, #0xf8
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08062AC0
	mov r0, sb
	adds r0, #0x80
	cmp r0, #0
	blt _08062AC0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp sb, r0
	ble _08062ACE
_08062AC0:
	mov r3, sl
	ldr r2, [sp]
	strb r3, [r2]
	ldr r0, _08062AFC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08062ACE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062AE0: .4byte gUnknown_03005450
_08062AE4: .4byte 0x0000C350
_08062AE8: .4byte gGameMode
_08062AEC: .4byte gUnknown_03005448
_08062AF0: .4byte gUnknown_030054A8
_08062AF4: .4byte gPlayer
_08062AF8: .4byte gCamera
_08062AFC: .4byte gCurTask

	thumb_func_start sub_8062B00
sub_8062B00: @ 0x08062B00
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r6, _08062BB0 @ =gMultiplayerPlayerTasks
	ldr r0, _08062BB4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0xc0
	lsls r7, r7, #0x12
	adds r5, r0, r7
	ldr r2, _08062BB8 @ =gPlayer
	adds r3, r2, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r3]
	strh r4, [r2, #0x32]
	ldr r0, [r5, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08062BAA
	ldr r0, [r6]
	cmp r0, #0
	beq _08062B60
	adds r1, r6, #0
	adds r3, r1, #0
	adds r3, #0xc
	movs r2, #1
_08062B44:
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	ldr r0, [r0, #0x5c]
	ands r0, r2
	cmp r0, #0
	beq _08062B54
	adds r4, #1
_08062B54:
	adds r1, #4
	cmp r1, r3
	bhi _08062B60
	ldr r0, [r1]
	cmp r0, #0
	bne _08062B44
_08062B60:
	ldr r0, _08062BB4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, [r5, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x5c]
	cmp r4, #0
	bne _08062B8E
	ldr r2, _08062BBC @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08062BC0 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08062B8E:
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
	ldr r0, _08062BC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08062BC8 @ =sub_8062D44
	str r0, [r1, #8]
	ldr r1, _08062BCC @ =gCamera
	adds r1, #0x50
	ldrh r2, [r1]
	movs r0, #4
	orrs r0, r2
	strh r0, [r1]
_08062BAA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062BB0: .4byte gMultiplayerPlayerTasks
_08062BB4: .4byte 0x04000128
_08062BB8: .4byte gPlayer
_08062BBC: .4byte gUnknown_03005424
_08062BC0: .4byte gUnknown_03005490
_08062BC4: .4byte gCurTask
_08062BC8: .4byte sub_8062D44
_08062BCC: .4byte gCamera

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 0x08062BD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r3, _08062C44 @ =gMultiplayerPlayerTasks
	ldr r5, _08062C48 @ =0x04000128
	ldr r0, [r5]
	ldr r2, _08062C4C @ =gPlayer
	adds r4, r2, #0
	adds r4, #0x37
	ldrb r1, [r4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	strh r1, [r2, #0x32]
	movs r4, #0
	ldr r0, [r3]
	mov sb, r3
	cmp r0, #0
	beq _08062C66
	ldr r0, _08062C50 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r7, #0x10
	adds r6, r5, #0
	ldr r2, _08062C54 @ =gUnknown_030054B4
	mov ip, r2
	mov r5, sb
_08062C0C:
	adds r2, r7, #0
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r7, #0
	lsls r1, r0
	ands r1, r3
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r1, r0
	cmp r2, r1
	beq _08062C58
	mov r1, ip
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08062C58
	movs r2, #1
	mov r8, r2
	b _08062C66
	.align 2, 0
_08062C44: .4byte gMultiplayerPlayerTasks
_08062C48: .4byte 0x04000128
_08062C4C: .4byte gPlayer
_08062C50: .4byte gMultiplayerConnections
_08062C54: .4byte gUnknown_030054B4
_08062C58:
	adds r5, #4
	adds r4, #1
	cmp r4, #3
	bhi _08062C66
	ldr r0, [r5]
	cmp r0, #0
	bne _08062C0C
_08062C66:
	movs r4, #0
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	beq _08062CF4
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	movs r7, #0x10
	ldr r6, _08062CC0 @ =0x04000128
	movs r5, #0
_08062C7C:
	ldr r0, _08062CC4 @ =gUnknown_030054B4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _08062CDC
	ldr r0, _08062CC8 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r2, r7, #0
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	adds r0, r7, #0
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	bne _08062CCC
	lsrs r0, r5, #0x18
	mov r2, r8
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	b _08062CDC
	.align 2, 0
_08062CC0: .4byte 0x04000128
_08062CC4: .4byte gUnknown_030054B4
_08062CC8: .4byte gMultiplayerConnections
_08062CCC:
	lsrs r0, r5, #0x18
	movs r2, #1
	mov r1, r8
	eors r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
_08062CDC:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #3
	bhi _08062CF4
	ldr r0, _08062D2C @ =gMultiplayerPlayerTasks
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08062C7C
_08062CF4:
	ldr r1, _08062D30 @ =gUnknown_03005424
	ldrh r0, [r1]
	movs r4, #4
	orrs r0, r4
	strh r0, [r1]
	ldr r1, _08062D34 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
	ldr r0, _08062D38 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08062D3C @ =sub_8062D44
	str r0, [r1, #8]
	ldr r0, _08062D40 @ =gCamera
	adds r0, #0x50
	ldrh r1, [r0]
	orrs r4, r1
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062D2C: .4byte gMultiplayerPlayerTasks
_08062D30: .4byte gUnknown_03005424
_08062D34: .4byte gUnknown_03005490
_08062D38: .4byte gCurTask
_08062D3C: .4byte sub_8062D44
_08062D40: .4byte gCamera

	thumb_func_start sub_8062D44
sub_8062D44: @ 0x08062D44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08062E14 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	movs r4, #0
	ldr r1, _08062E18 @ =gUnknown_030054B4
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08062E08
	movs r3, #0
	ldr r0, _08062E1C @ =gMultiplayerPlayerTasks
	ldr r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08062D98
	movs r6, #0x80
	lsls r6, r6, #1
	adds r2, r5, #0
_08062D76:
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	ldr r1, _08062E20 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08062D8A
	adds r4, #1
_08062D8A:
	adds r2, #4
	adds r3, #1
	cmp r3, #3
	bhi _08062D98
	ldr r0, [r2]
	cmp r0, #0
	bne _08062D76
_08062D98:
	cmp r4, #0
	beq _08062E08
	subs r0, r3, #1
	cmp r4, r0
	bhs _08062DAA
	ldr r0, _08062E24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08062E08
_08062DAA:
	ldr r0, [r5]
	cmp r0, #0
	beq _08062DFC
	mov ip, r5
	movs r6, #1
	ldr r5, _08062E28 @ =gPlayer
	movs r0, #0x5c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, _08062E24 @ =gGameMode
	mov r4, ip
_08062DC0:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r2, [r1, #0x5c]
	adds r3, r2, #0
	ands r3, r6
	cmp r3, #0
	bne _08062DEC
	ldrb r0, [r7]
	cmp r0, #4
	beq _08062DEC
	orrs r2, r6
	str r2, [r1, #0x5c]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x20]
	mov r1, r8
	strh r3, [r1]
_08062DEC:
	adds r4, #4
	mov r0, ip
	adds r0, #0xc
	cmp r4, r0
	bhi _08062DFC
	ldr r0, [r4]
	cmp r0, #0
	bne _08062DC0
_08062DFC:
	bl sub_8019F08
	ldr r0, _08062E2C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08062E08:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062E14: .4byte 0x04000128
_08062E18: .4byte gUnknown_030054B4
_08062E1C: .4byte gMultiplayerPlayerTasks
_08062E20: .4byte IWRAM_START + 0x54
_08062E24: .4byte gGameMode
_08062E28: .4byte gPlayer
_08062E2C: .4byte gCurTask

	thumb_func_start initSprite_Interactable_Toggle_StageGoal
initSprite_Interactable_Toggle_StageGoal: @ 0x08062E30
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062E74 @ =sub_8062934
	ldr r2, _08062E78 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
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
_08062E74: .4byte sub_8062934
_08062E78: .4byte 0x00002010

	thumb_func_start sub_8062E7C
sub_8062E7C: @ 0x08062E7C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_Checkpoint
initSprite_Interactable_Checkpoint: @ 0x08062E90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _08062ECC @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062EDC
	ldr r0, _08062ED0 @ =sub_8062FD8
	ldr r2, _08062ED4 @ =0x00002010
	ldr r1, _08062ED8 @ =sub_8063214
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	b _08062EEC
	.align 2, 0
_08062ECC: .4byte gUnknown_030055B0
_08062ED0: .4byte sub_8062FD8
_08062ED4: .4byte 0x00002010
_08062ED8: .4byte sub_8063214
_08062EDC:
	ldr r0, _08062FA8 @ =sub_806319C
	ldr r2, _08062FAC @ =0x00002010
	ldr r1, _08062FB0 @ =sub_8063214
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
_08062EEC:
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r0, _08062FB4 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r1, #0
	mov r8, r1
	mov r2, sl
	strh r2, [r6, #4]
	mov r0, sb
	strh r0, [r6, #6]
	str r7, [r6]
	ldrb r0, [r7]
	strb r0, [r6, #8]
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r6, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #4
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08062FB8 @ =0x00000213
	strh r0, [r4, #0xa]
	ldr r2, _08062FBC @ =IWRAM_START + 0x2C
	adds r0, r5, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	mov r2, r8
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08062FC0 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08062FC4 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08062FC8 @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	ldr r1, _08062FCC @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r2, r2, #0x18
	ldr r3, _08062FD0 @ =gUnknown_080D94F8
	lsrs r2, r2, #0x16
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r2, [r2]
	ldr r3, _08062FD4 @ =sub_8063228
	bl sub_8009628
	str r0, [r6, #0x3c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062FA8: .4byte sub_806319C
_08062FAC: .4byte 0x00002010
_08062FB0: .4byte sub_8063214
_08062FB4: .4byte IWRAM_START + 0xC
_08062FB8: .4byte 0x00000213
_08062FBC: .4byte IWRAM_START + 0x2C
_08062FC0: .4byte IWRAM_START + 0x2D
_08062FC4: .4byte IWRAM_START + 0x2E
_08062FC8: .4byte IWRAM_START + 0x31
_08062FCC: .4byte gCurrentLevel
_08062FD0: .4byte gUnknown_080D94F8
_08062FD4: .4byte sub_8063228

	thumb_func_start sub_8062FD8
sub_8062FD8: @ 0x08062FD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08063048 @ =gCurTask
	mov r8, r0
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r5, r0
	ldr r1, _0806304C @ =IWRAM_START + 0xC
	adds r4, r5, r1
	ldr r6, [r3]
	ldrb r1, [r3, #8]
	lsls r1, r1, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r7, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r1, _08063050 @ =gCamera
	ldr r0, [r1]
	subs r0, r7, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	subs r2, r2, r1
	strh r2, [r4, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08063034
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08063034
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08063054
_08063034:
	ldrb r0, [r3, #8]
	strb r0, [r6]
	ldr r0, [r3, #0x3c]
	bl TaskDestroy
	ldr r0, _08063048 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080630D4
	.align 2, 0
_08063048: .4byte gCurTask
_0806304C: .4byte IWRAM_START + 0xC
_08063050: .4byte gCamera
_08063054:
	ldr r0, _080630E0 @ =gPlayer
	mov ip, r0
	ldr r0, [r0, #0x20]
	ldr r1, _080630E4 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _080630C8
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	cmp r7, r0
	bgt _080630C8
	ldr r2, _080630E8 @ =gUnknown_080D63FC
	ldr r3, _080630EC @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r0]
	mov r0, ip
	adds r0, #0x74
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	mov r1, ip
	adds r1, #0x76
	strh r0, [r1]
	ldr r0, _080630F0 @ =gUnknown_030053E4
	ldr r0, [r0]
	mov r1, ip
	str r0, [r1, #0x78]
	ldr r1, _080630F4 @ =gUnknown_030055B0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080630A6
	adds r0, #1
	strb r0, [r1]
_080630A6:
	ldr r0, _080630F8 @ =0x00000213
	strh r0, [r4, #0xa]
	ldr r0, _080630FC @ =IWRAM_START + 0x2C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08063100 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _08063104 @ =sub_8063108
	str r0, [r1, #8]
	movs r0, #0x98
	bl m4aSongNumStart
_080630C8:
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_080630D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080630E0: .4byte gPlayer
_080630E4: .4byte 0x00400080
_080630E8: .4byte gUnknown_080D63FC
_080630EC: .4byte gCurrentLevel
_080630F0: .4byte gUnknown_030053E4
_080630F4: .4byte gUnknown_030055B0
_080630F8: .4byte 0x00000213
_080630FC: .4byte IWRAM_START + 0x2C
_08063100: .4byte IWRAM_START + 0x2D
_08063104: .4byte sub_8063108

	thumb_func_start sub_8063108
sub_8063108: @ 0x08063108
	push {r4, r5, r6, r7, lr}
	ldr r7, _08063174 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _08063178 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0806315E
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0806315E
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0806317C
_0806315E:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, [r4, #0x3c]
	bl TaskDestroy
	ldr r0, _08063174 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08063192
	.align 2, 0
_08063174: .4byte gCurTask
_08063178: .4byte gCamera
_0806317C:
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0806318C
	ldr r1, [r7]
	ldr r0, _08063198 @ =sub_806319C
	str r0, [r1, #8]
_0806318C:
	adds r0, r5, #0
	bl sub_80051E8
_08063192:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063198: .4byte sub_806319C

	thumb_func_start sub_806319C
sub_806319C: @ 0x0806319C
	push {r4, r5, r6, lr}
	ldr r0, _0806320C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r6, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r2, [r6, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _08063210 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	ldr r0, [r3, #4]
	subs r2, r2, r0
	strh r2, [r5, #0x18]
	adds r1, #0x80
	lsls r1, r1, #0x10
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _080631F2
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080631F2
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08063204
_080631F2:
	ldrb r0, [r4, #8]
	strb r0, [r6]
	ldr r0, [r4, #0x3c]
	bl TaskDestroy
	ldr r0, _0806320C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08063204:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806320C: .4byte gCurTask
_08063210: .4byte gCamera

	thumb_func_start sub_8063214
sub_8063214: @ 0x08063214
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_8063228
sub_8063228: @ 0x08063228
	push {r4, lr}
	ldr r0, _0806328C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #0x18
	ldr r1, _08063290 @ =gUnknown_080D94F8
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _08063294 @ =gAnimations
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [r0]
	ldm r2!, {r1}
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08063286
	ldm r2!, {r3}
	ldr r1, [r2]
	lsrs r2, r1, #0x10
	movs r0, #0xff
	ands r1, r0
	ldr r4, _08063298 @ =0x040000D4
	ldr r0, _0806329C @ =gUnknown_03002794
	ldr r0, [r0]
	lsls r3, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r3
	str r0, [r4]
	lsls r2, r2, #1
	ldr r0, _080632A0 @ =gBgPalette
	adds r2, r2, r0
	str r2, [r4, #4]
	lsrs r1, r1, #1
	movs r0, #0x84
	lsls r0, r0, #0x18
	orrs r1, r0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _080632A4 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
_08063286:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806328C: .4byte gCurrentLevel
_08063290: .4byte gUnknown_080D94F8
_08063294: .4byte gAnimations
_08063298: .4byte 0x040000D4
_0806329C: .4byte gUnknown_03002794
_080632A0: .4byte gBgPalette
_080632A4: .4byte gFlags

	thumb_func_start sub_80632A8
sub_80632A8: @ 0x080632A8
	push {r4, r5, r6, r7, lr}
	ldr r3, _0806330C @ =gCurTask
	ldr r7, [r3]
	ldrh r1, [r7, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, [r4]
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r6, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r2, _08063310 @ =gCamera
	ldr r0, [r2]
	subs r0, r6, r0
	ldr r2, [r2, #4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x10
	adds r0, r0, r1
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080632FE
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _080632FE
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08063314
_080632FE:
	ldrb r0, [r4, #8]
	strb r0, [r5]
	ldr r0, [r3]
	bl TaskDestroy
	b _08063396
	.align 2, 0
_0806330C: .4byte gCurTask
_08063310: .4byte gCamera
_08063314:
	ldr r0, _08063370 @ =gPlayer
	mov ip, r0
	ldr r0, [r0, #0x20]
	ldr r1, _08063374 @ =0x00400080
	ands r0, r1
	cmp r0, #0
	bne _08063388
	mov r1, ip
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	cmp r6, r0
	bgt _08063388
	ldr r2, _08063378 @ =gUnknown_080D63FC
	ldr r3, _0806337C @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r0]
	mov r0, ip
	adds r0, #0x74
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r0, [r0]
	mov r1, ip
	adds r1, #0x76
	strh r0, [r1]
	ldr r0, _08063380 @ =gUnknown_030053E4
	ldr r0, [r0]
	mov r1, ip
	str r0, [r1, #0x78]
	ldr r1, _08063384 @ =gUnknown_030055B0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08063366
	adds r0, #1
	strb r0, [r1]
_08063366:
	adds r0, r7, #0
	bl TaskDestroy
	b _08063396
	.align 2, 0
_08063370: .4byte gPlayer
_08063374: .4byte 0x00400080
_08063378: .4byte gUnknown_080D63FC
_0806337C: .4byte gCurrentLevel
_08063380: .4byte gUnknown_030053E4
_08063384: .4byte gUnknown_030055B0
_08063388:
	ldr r0, _0806339C @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063396
	ldr r0, [r3]
	bl TaskDestroy
_08063396:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806339C: .4byte gUnknown_030055B0

	thumb_func_start initSprite_Interactable_Toggle_Checkpoint
initSprite_Interactable_Toggle_Checkpoint: @ 0x080633A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	ldr r0, _080633EC @ =gUnknown_030055B0
	ldrb r1, [r0]
	cmp r1, #0
	bne _080633DC
	ldr r0, _080633F0 @ =sub_80632A8
	ldr r2, _080633F4 @ =0x00002010
	str r1, [sp]
	movs r1, #0x3c
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	str r4, [r0]
	ldrb r1, [r4]
	strb r1, [r0, #8]
	strb r7, [r0, #9]
_080633DC:
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080633EC: .4byte gUnknown_030055B0
_080633F0: .4byte sub_80632A8
_080633F4: .4byte 0x00002010

	thumb_func_start initSprite_Interactable051
initSprite_Interactable051: @ 0x080633F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
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
	ldr r0, _08063500 @ =sub_8063598
	movs r1, #0xff
	lsls r1, r1, #2
	ldr r2, _08063504 @ =0x00002010
	ldr r3, _08063508 @ =sub_80636F0
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r6
	mov sl, r0
	ldr r1, _0806350C @ =IWRAM_START + 0xC
	adds r7, r6, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	mov r2, sb
	str r2, [r0]
	ldrb r0, [r2]
	mov r1, sl
	strb r0, [r1, #8]
	mov r2, r8
	strb r2, [r1, #9]
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
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r4, _08063510 @ =gUnknown_080D9518
	ldr r0, [r4, #0x20]
	bl VramMalloc
	str r0, [r7, #4]
	ldrh r0, [r4, #0x24]
	strh r0, [r7, #0xa]
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r1, [r0]
	ldr r2, _08063514 @ =IWRAM_START + 0x2C
	adds r0, r6, r2
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	movs r0, #0
	strh r0, [r7, #8]
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x1c]
	adds r2, #1
	adds r1, r6, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08063518 @ =IWRAM_START + 0x2E
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0806351C @ =IWRAM_START + 0x31
	adds r6, r6, r1
	movs r2, #0
	strb r2, [r6]
	subs r0, #0x11
	str r0, [r7, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_8004558
	movs r2, #0
	movs r6, #0
_080634C0:
	movs r5, #0
	lsls r0, r2, #2
	mov r8, r0
	adds r1, r2, #1
	mov sb, r1
_080634CA:
	mov r0, r8
	adds r1, r0, r5
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	mov r1, sl
	adds r7, r1, r0
	strh r6, [r7, #0x16]
	strh r6, [r7, #0x18]
	cmp r2, #0
	bne _08063520
	lsls r4, r5, #3
	ldr r1, _08063510 @ =gUnknown_080D9518
	adds r0, r4, r1
	ldr r0, [r0]
	str r2, [sp, #0x14]
	bl VramMalloc
	str r0, [r7, #4]
	lsls r1, r5, #2
	add r1, sp
	adds r1, #4
	str r0, [r1]
	ldr r2, [sp, #0x14]
	b _0806352C
	.align 2, 0
_08063500: .4byte sub_8063598
_08063504: .4byte 0x00002010
_08063508: .4byte sub_80636F0
_0806350C: .4byte IWRAM_START + 0xC
_08063510: .4byte gUnknown_080D9518
_08063514: .4byte IWRAM_START + 0x2C
_08063518: .4byte IWRAM_START + 0x2E
_0806351C: .4byte IWRAM_START + 0x31
_08063520:
	lsls r0, r5, #2
	add r0, sp
	adds r0, #4
	ldr r0, [r0]
	str r0, [r7, #4]
	lsls r4, r5, #3
_0806352C:
	ldr r0, _08063594 @ =gUnknown_080D9518
	adds r1, r4, r0
	ldrh r0, [r1, #4]
	strh r0, [r7, #0xa]
	ldrb r1, [r1, #6]
	adds r0, r7, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r6, [r7, #8]
	strh r6, [r7, #0x14]
	strh r6, [r7, #0x1c]
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
	str r6, [r7, #0x10]
	adds r0, r7, #0
	str r2, [sp, #0x14]
	bl sub_8004558
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r2, [sp, #0x14]
	cmp r5, #3
	bls _080634CA
	mov r1, sb
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _080634C0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063594: .4byte gUnknown_080D9518

	thumb_func_start sub_8063598
sub_8063598: @ 0x08063598
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0806360C @ =gCurTask
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	adds r0, #0xc
	adds r5, r1, r0
	ldr r4, [r6]
	ldrb r1, [r6, #8]
	lsls r1, r1, #3
	ldrh r0, [r6, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	str r1, [sp]
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	ldrh r0, [r6, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	mov sl, r1
	ldr r1, _08063610 @ =gCamera
	ldr r0, [r1]
	ldr r3, [sp]
	subs r0, r3, r0
	strh r0, [r5, #0x16]
	ldr r1, [r1, #4]
	mov r7, sl
	subs r3, r7, r1
	strh r3, [r5, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08063600
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08063600
	lsls r1, r3, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08063614
_08063600:
	ldrb r0, [r6, #8]
	strb r0, [r4]
	ldr r0, [r2]
	bl TaskDestroy
	b _080636CE
	.align 2, 0
_0806360C: .4byte gCurTask
_08063610: .4byte gCamera
_08063614:
	adds r0, r5, #0
	bl sub_80051E8
	movs r7, #0x16
	ldrsh r3, [r5, r7]
	str r3, [sp]
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	mov sl, r0
	movs r0, #0
_08063628:
	movs r4, #0
	lsls r3, r0, #2
	mov sb, r3
	lsls r7, r0, #8
	mov r8, r7
	adds r0, #1
	str r0, [sp, #4]
_08063636:
	mov r0, sb
	adds r1, r0, r4
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r5, r6, r0
	adds r1, r5, #0
	adds r1, #0x30
	ldr r0, _080636E0 @ =gUnknown_03005590
	ldr r2, [r0]
	lsls r2, r2, #1
	add r2, r8
	ldr r3, _080636E4 @ =0x000003FF
	adds r0, r3, #0
	ands r2, r0
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r2, r7
	lsls r0, r0, #1
	ldr r3, _080636E8 @ =gSineTable
	adds r0, r0, r3
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r4, #1
	lsls r3, r4, #4
	subs r3, #8
	muls r0, r3, r0
	asrs r0, r0, #0xe
	ldr r7, [sp]
	adds r0, r7, r0
	strh r0, [r5, #0x16]
	lsls r0, r2, #1
	ldr r7, _080636E8 @ =gSineTable
	adds r0, r0, r7
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	add r0, sl
	strh r0, [r5, #0x18]
	strh r2, [r5, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #2]
	adds r3, r0, #0
	strh r3, [r1, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r1, #8]
	ldr r3, _080636EC @ =gUnknown_030054B8
	ldrb r0, [r3]
	adds r2, r0, #1
	strb r2, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0x83
	lsls r2, r2, #5
	orrs r0, r2
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl sub_8004860
	adds r0, r5, #0
	bl sub_80051E8
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #3
	bls _08063636
	ldr r7, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _08063628
_080636CE:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080636E0: .4byte gUnknown_03005590
_080636E4: .4byte 0x000003FF
_080636E8: .4byte gSineTable
_080636EC: .4byte gUnknown_030054B8

	thumb_func_start sub_80636F0
sub_80636F0: @ 0x080636F0
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x7c]
	bl VramFree
	ldr r1, _08063728 @ =IWRAM_START + 0xB8
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _0806372C @ =IWRAM_START + 0xF4
	adds r5, r5, r0
	ldr r0, [r5]
	bl VramFree
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063728: .4byte IWRAM_START + 0xB8
_0806372C: .4byte IWRAM_START + 0xF4
