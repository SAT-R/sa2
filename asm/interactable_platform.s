.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_800EDF8
sub_800EDF8: @ 0x0800EDF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0800EE98 @ =gCurTask
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0800EE9C @ =IWRAM_START + 0xC
	adds r6, r1, r3
	ldr r7, [r4]
	ldr r5, _0800EEA0 @ =gGameMode
	mov r8, r5
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EE24
	adds r0, r4, #0
	bl sub_800F1B0
_0800EE24:
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldrb r2, [r7, #1]
	lsls r2, r2, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _0800EEA4 @ =gCamera
	ldr r0, [r3]
	lsrs r5, r1, #0x10
	mov sb, r5
	asrs r1, r1, #0x10
	subs r0, r1, r0
	strh r0, [r6, #0x16]
	ldr r0, [r3, #4]
	lsrs r3, r2, #0x10
	mov sl, r3
	asrs r2, r2, #0x10
	subs r0, r2, r0
	strh r0, [r6, #0x18]
	ldr r5, _0800EEA8 @ =gPlayer
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800EE76
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
_0800EE76:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, #2
	bls _0800EEB0
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800EEB0
	movs r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _0800EE98 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800EEAC @ =sub_800EFD0
	str r0, [r1, #8]
	b _0800EEE6
	.align 2, 0
_0800EE98: .4byte gCurTask
_0800EE9C: .4byte IWRAM_START + 0xC
_0800EEA0: .4byte gGameMode
_0800EEA4: .4byte gCamera
_0800EEA8: .4byte gPlayer
_0800EEAC: .4byte sub_800EFD0
_0800EEB0:
	ldrh r0, [r4, #0x3c]
	subs r0, #1
	strh r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0800EEE6
	strh r0, [r4, #0x3c]
	ldr r0, _0800EF50 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0800EF54 @ =sub_800EFD0
	str r0, [r1, #8]
	ldr r0, _0800EF58 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0800EEE6
	bl sub_8019224
	movs r2, #1
	strb r2, [r0]
	ldrh r1, [r4, #4]
	strb r1, [r0, #1]
	ldrh r1, [r4, #6]
	strb r1, [r0, #2]
	ldrb r1, [r4, #9]
	strb r1, [r0, #3]
	strb r2, [r0, #4]
_0800EEE6:
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0800EF5C @ =gCamera
	ldr r2, [r3]
	movs r5, #0xb8
	lsls r5, r5, #1
	adds r0, r2, r5
	cmp r1, r0
	bgt _0800EF1C
	adds r0, r2, #0
	subs r0, #0x80
	cmp r1, r0
	blt _0800EF1C
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0800EF1C
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0800EF60
_0800EF1C:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800EF40
	movs r5, #0x18
	ldrsh r0, [r6, r5]
	adds r0, #0x80
	cmp r0, #0
	blt _0800EF40
	movs r0, #0x18
	ldrsh r1, [r6, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800EF60
_0800EF40:
	ldrb r0, [r4, #8]
	strb r0, [r7]
	ldr r0, _0800EF50 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800EFBE
	.align 2, 0
_0800EF50: .4byte gCurTask
_0800EF54: .4byte sub_800EFD0
_0800EF58: .4byte gGameMode
_0800EF5C: .4byte gCamera
_0800EF60:
	ldr r2, _0800EF88 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800EF8C
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800EF8C
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800EF9E
	adds r0, r3, #0
	adds r0, #0x10
	b _0800EF9C
	.align 2, 0
_0800EF88: .4byte gPlayer
_0800EF8C:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800EF9E
	adds r0, r1, #0
	subs r0, #0x10
_0800EF9C:
	strh r0, [r2]
_0800EF9E:
	ldr r1, _0800EFCC @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800EFBE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EFCC: .4byte gSineTable

	thumb_func_start sub_800EFD0
sub_800EFD0: @ 0x0800EFD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800F048 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, #0xc
	adds r6, r4, r0
	ldr r1, [r5]
	mov r8, r1
	ldr r7, _0800F04C @ =gGameMode
	ldrb r0, [r7]
	cmp r0, #2
	bls _0800EFF8
	adds r0, r5, #0
	bl sub_800F1B0
_0800EFF8:
	ldr r2, _0800F050 @ =IWRAM_START + 0x4A
	adds r1, r4, r2
	ldrh r0, [r1]
	adds r0, #0x2a
	strh r0, [r1]
	movs r4, #0
	ldrsh r1, [r1, r4]
	ldr r0, [r5, #0x44]
	adds r0, r0, r1
	str r0, [r5, #0x44]
	ldrb r2, [r5, #8]
	lsls r2, r2, #3
	ldrh r0, [r5, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	mov r1, r8
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldrh r1, [r5, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _0800F054 @ =gCamera
	ldr r0, [r1]
	lsrs r4, r2, #0x10
	mov ip, r4
	asrs r2, r2, #0x10
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldrb r0, [r7]
	cmp r0, #2
	bls _0800F058
	ldr r0, [r1, #4]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x54]
	b _0800F062
	.align 2, 0
_0800F048: .4byte gCurTask
_0800F04C: .4byte gGameMode
_0800F050: .4byte IWRAM_START + 0x4A
_0800F054: .4byte gCamera
_0800F058:
	ldr r0, [r1, #4]
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r1, r1, r0
	ldr r0, [r5, #0x44]
_0800F062:
	asrs r0, r0, #8
	adds r1, r1, r0
	strh r1, [r6, #0x18]
	adds r7, r2, #0
	ldrh r0, [r5, #0x3c]
	adds r3, r0, #1
	strh r3, [r5, #0x3c]
	ldr r1, _0800F0A0 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #8
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0800F0C6
	ldr r0, [r4, #0x3c]
	cmp r0, r6
	bne _0800F0C6
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bls _0800F0A4
	movs r0, #2
	orrs r2, r0
	subs r0, #0xb
	ands r2, r0
	str r2, [r4, #0x20]
	adds r0, r5, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	strh r0, [r4, #0x12]
	b _0800F0C6
	.align 2, 0
_0800F0A0: .4byte gPlayer
_0800F0A4:
	adds r0, r5, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0800F0C6:
	ldrh r0, [r5, #0x3c]
	cmp r0, #0x1f
	bhi _0800F0F8
	mov r0, ip
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	asrs r2, r7, #0x10
	ldr r0, [r5, #0x44]
	asrs r0, r0, #8
	adds r2, r2, r0
	adds r0, r6, #0
	adds r3, r4, #0
	bl sub_800CCB8
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0800F0F8
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	str r0, [r4, #0xc]
_0800F0F8:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800F11C
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0800F11C
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0800F130
_0800F11C:
	ldrb r0, [r5, #8]
	mov r4, r8
	strb r0, [r4]
	ldr r0, _0800F12C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0800F18E
	.align 2, 0
_0800F12C: .4byte gCurTask
_0800F130:
	ldr r2, _0800F158 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0800F15C
	ldr r0, [r2, #0x3c]
	cmp r0, r6
	bne _0800F15C
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r3, [r0]
	adds r1, #0xf8
	adds r2, r0, #0
	cmp r3, r1
	beq _0800F16E
	adds r0, r3, #0
	adds r0, #0x10
	b _0800F16C
	.align 2, 0
_0800F158: .4byte gPlayer
_0800F15C:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800F16E
	adds r0, r1, #0
	subs r0, #0x10
_0800F16C:
	strh r0, [r2]
_0800F16E:
	ldr r1, _0800F198 @ =gSineTable
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1c
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_0800F18E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F198: .4byte gSineTable

	thumb_func_start TaskDestructor_800F19C
TaskDestructor_800F19C: @ 0x0800F19C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_800F1B0
sub_800F1B0: @ 0x0800F1B0
	ldr r1, [r0, #0x50]
	str r1, [r0, #0x54]
	ldr r1, [r0, #0x44]
	str r1, [r0, #0x50]
	bx lr
	.align 2, 0
