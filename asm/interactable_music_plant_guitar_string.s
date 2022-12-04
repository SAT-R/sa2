.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_MusicPlant_GuitarString
initSprite_Interactable_MusicPlant_GuitarString: @ 0x08075E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	str r6, [sp, #4]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08075EE4 @ =Task_Interactable_MusicPlant_GuitarString
	ldr r2, _08075EE8 @ =0x00002010
	ldr r1, _08075EEC @ =TaskDestructor_Interactable_MusicPlant_GuitarString
	str r1, [sp]
	movs r1, #0x78
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r3, r0
	ldr r1, _08075EF0 @ =IWRAM_START + 0x3C
	adds r0, r3, r1
	movs r2, #0
	mov sl, r2
	movs r4, #0
	strh r5, [r7, #0x34]
	strh r6, [r7, #0x36]
	mov r1, sb
	str r1, [r7, #0x30]
	ldrb r2, [r1]
	ldr r6, _08075EF4 @ =IWRAM_START + 0x38
	adds r1, r3, r6
	strb r2, [r1]
	ldr r2, _08075EF8 @ =IWRAM_START + 0x39
	adds r1, r3, r2
	mov r6, r8
	strb r6, [r1]
	movs r1, #0x90
	lsls r1, r1, #3
	strh r1, [r0, #0x1a]
	strh r4, [r0, #8]
	strh r4, [r0, #0x14]
	strh r4, [r0, #0x1c]
	ldr r1, _08075EFC @ =IWRAM_START + 0x5D
	adds r2, r3, r1
	movs r1, #0xff
	strb r1, [r2]
	ldr r6, _08075F00 @ =IWRAM_START + 0x5E
	adds r2, r3, r6
	movs r1, #0x10
	strb r1, [r2]
	ldr r2, _08075F04 @ =IWRAM_START + 0x61
	adds r1, r3, r2
	mov r6, sl
	strb r6, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [r0, #0x10]
	ldr r1, _08075F08 @ =0x06013700
	str r1, [r0, #4]
	ldr r1, _08075F0C @ =0x0000023F
	strh r1, [r0, #0xa]
	ldr r1, _08075F10 @ =IWRAM_START + 0x5C
	adds r3, r3, r1
	movs r1, #0xf
	strb r1, [r3]
	mov r2, sb
	ldrb r1, [r2]
	lsls r1, r1, #3
	lsls r5, r5, #8
	adds r1, r1, r5
	str r1, [r7, #0x6c]
	ldrb r1, [r2, #1]
	lsls r1, r1, #3
	ldr r2, [sp, #4]
	lsls r6, r2, #8
	adds r1, r1, r6
	str r1, [r7, #0x70]
	movs r6, #2
	rsbs r6, r6, #0
	adds r1, r6, #0
	mov r2, sb
	strb r1, [r2]
	bl sub_8004558
	movs r3, #0
_08075EC8:
	lsls r0, r3, #3
	adds r2, r7, r0
	lsls r0, r3, #0xb
	movs r1, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	cmp r3, #5
	bhi _08075F3E
	lsls r0, r3, #2
	ldr r1, _08075F14 @ =_08075F18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08075EE4: .4byte Task_Interactable_MusicPlant_GuitarString
_08075EE8: .4byte 0x00002010
_08075EEC: .4byte TaskDestructor_Interactable_MusicPlant_GuitarString
_08075EF0: .4byte IWRAM_START + 0x3C
_08075EF4: .4byte IWRAM_START + 0x38
_08075EF8: .4byte IWRAM_START + 0x39
_08075EFC: .4byte IWRAM_START + 0x5D
_08075F00: .4byte IWRAM_START + 0x5E
_08075F04: .4byte IWRAM_START + 0x61
_08075F08: .4byte 0x06013700
_08075F0C: .4byte 0x0000023F
_08075F10: .4byte IWRAM_START + 0x5C
_08075F14: .4byte _08075F18
_08075F18: @ jump table
	.4byte _08075F30 @ case 0
	.4byte _08075F34 @ case 1
	.4byte _08075F38 @ case 2
	.4byte _08075F38 @ case 3
	.4byte _08075F34 @ case 4
	.4byte _08075F30 @ case 5
_08075F30:
	movs r0, #0
	b _08075F3C
_08075F34:
	movs r0, #0x80
	b _08075F3C
_08075F38:
	movs r0, #0x80
	lsls r0, r0, #1
_08075F3C:
	strh r0, [r2, #4]
_08075F3E:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #5
	bls _08075EC8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8075F58
sub_8075F58: @ 0x08075F58
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r0, _08075FA0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_80762E0
	movs r6, #0
_08075F70:
	lsls r0, r6, #3
	adds r2, r4, r0
	adds r0, r4, #0
	adds r0, #0x74
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r5, #2
	ldrsh r3, [r2, r5]
	subs r1, r1, r3
	movs r5, #4
	ldrsh r0, [r2, r5]
	muls r0, r1, r0
	lsls r0, r0, #8
	asrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	mov ip, r0
	adds r0, r3, #0
	cmp r1, r0
	bgt _08075FA4
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08075FBA
	.align 2, 0
_08075FA0: .4byte gCurTask
_08075FA4:
	subs r0, r1, r3
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	bgt _08075FB2
	movs r1, #0x80
_08075FB2:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	add r0, ip
	strh r0, [r2, #2]
_08075FBA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #5
	bls _08075F70
	ldr r2, _08075FFC @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08075FE6
	ldr r0, [r4, #0x70]
	subs r0, #0x10
	lsls r0, r0, #8
	movs r3, #0x12
	ldrsh r1, [r4, r3]
	adds r0, r0, r1
	str r0, [r2, #0xc]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
_08075FE6:
	cmp r7, #6
	bne _08075FF0
	adds r0, r4, #0
	bl sub_8076258
_08075FF0:
	adds r0, r4, #0
	bl sub_8076114
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075FFC: .4byte gPlayer

	thumb_func_start sub_8076000
sub_8076000: @ 0x08076000
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _08076028 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r3, #0
_08076012:
	lsls r0, r3, #3
	adds r1, r4, r0
	ldrh r2, [r1, #2]
	movs r6, #2
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bne _0807602C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0807605C
	.align 2, 0
_08076028: .4byte gCurTask
_0807602C:
	cmp r0, #0
	ble _08076044
	ldr r6, _08076040 @ =0xFFFFFF00
	adds r0, r2, r6
	movs r2, #0
	strh r0, [r1, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08076056
	b _08076054
	.align 2, 0
_08076040: .4byte 0xFFFFFF00
_08076044:
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r2, r6
	movs r2, #0
	strh r0, [r1, #2]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08076056
_08076054:
	strh r2, [r1, #2]
_08076056:
	ldrh r0, [r1, #2]
	rsbs r0, r0, #0
	strh r0, [r1, #2]
_0807605C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08076012
	cmp r5, #6
	bne _08076070
	adds r0, r4, #0
	bl sub_80762A8
_08076070:
	adds r0, r4, #0
	bl sub_807618C
	cmp r0, #0
	beq _08076080
	adds r0, r4, #0
	bl sub_80762BC
_08076080:
	adds r0, r4, #0
	bl sub_8076114
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_807608C
sub_807608C: @ 0x0807608C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _080760D0 @ =gPlayer
	ldr r4, [r1, #0x20]
	movs r0, #0x80
	ands r4, r0
	adds r5, r1, #0
	cmp r4, #0
	bne _080760E2
	bl sub_8029FF0
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #4
	strh r0, [r1]
	strh r4, [r5, #0x10]
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #1
	strh r0, [r5, #0x12]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, _080760D4 @ =0x000003FF
	cmp r1, r0
	bgt _080760D8
	adds r0, #1
	b _080760E0
	.align 2, 0
_080760D0: .4byte gPlayer
_080760D4: .4byte 0x000003FF
_080760D8:
	movs r0, #0xc0
	lsls r0, r0, #4
	cmp r1, r0
	ble _080760E2
_080760E0:
	strh r0, [r5, #0x12]
_080760E2:
	ldrh r0, [r5, #0x12]
	lsls r1, r0, #1
	adds r2, r6, #0
	adds r2, #0x74
	strh r1, [r2]
	lsls r0, r0, #0x11
	ldr r1, _08076108 @ =0x3FF0000
	cmp r0, r1
	bgt _080760FA
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r2]
_080760FA:
	ldr r0, _0807610C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08076110 @ =sub_8075F58
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08076108: .4byte 0x3FF0000
_0807610C: .4byte gCurTask
_08076110: .4byte sub_8075F58

	thumb_func_start sub_8076114
sub_8076114: @ 0x08076114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x3c
	movs r5, #0
	ldr r0, _08076188 @ =gCamera
	mov r8, r0
_08076126:
	lsls r0, r5, #3
	adds r3, r4, r0
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bge _08076134
	rsbs r0, r0, #0
_08076134:
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x10
	cmp r5, #2
	bls _08076142
	lsls r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r0, r0, #0x10
_08076142:
	ldr r2, [r4, #0x6c]
	adds r2, #4
	movs r7, #0
	ldrsh r1, [r3, r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r2, r2, r1
	mov r1, r8
	ldr r0, [r1]
	subs r2, r2, r0
	strh r2, [r6, #0x16]
	ldr r1, [r4, #0x70]
	ldrh r0, [r3, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	mov r2, r8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	strh r1, [r6, #0x18]
	adds r0, r6, #0
	bl sub_80051E8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	bls _08076126
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076188: .4byte gCamera

	thumb_func_start sub_807618C
sub_807618C: @ 0x0807618C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _080761F4 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080761FC
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _080761FC
	ldr r2, [r4, #0x6c]
	ldr r1, _080761F8 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x70]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r0, r2, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080761FC
	adds r0, #0x30
	cmp r0, r1
	blt _080761FC
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #9
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _080761FC
	adds r0, r3, #0
	adds r0, #9
	cmp r0, r2
	blt _080761FC
	movs r0, #1
	b _080761FE
	.align 2, 0
_080761F4: .4byte gPlayer
_080761F8: .4byte gCamera
_080761FC:
	movs r0, #0
_080761FE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable_MusicPlant_GuitarString
Task_Interactable_MusicPlant_GuitarString: @ 0x08076204
	push {r4, r5, r6, lr}
	ldr r6, _08076240 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_807618C
	cmp r0, #0
	beq _08076222
	adds r0, r4, #0
	bl sub_807608C
_08076222:
	adds r0, r4, #0
	bl sub_8076320
	cmp r0, #0
	beq _08076248
	ldr r1, [r4, #0x30]
	ldr r2, _08076244 @ =IWRAM_START + 0x38
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r6]
	bl TaskDestroy
	b _0807624E
	.align 2, 0
_08076240: .4byte gCurTask
_08076244: .4byte IWRAM_START + 0x38
_08076248:
	adds r0, r4, #0
	bl sub_8076114
_0807624E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable_MusicPlant_GuitarString
TaskDestructor_Interactable_MusicPlant_GuitarString: @ 0x08076254
	bx lr
	.align 2, 0

	thumb_func_start sub_8076258
sub_8076258: @ 0x08076258
	push {r4, lr}
	ldr r4, _08076298 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076288
	bl sub_802A004
	ldr r0, [r4, #0x20]
	ldr r1, _0807629C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
	movs r0, #0xa2
	lsls r0, r0, #1
	bl m4aSongNumStart
_08076288:
	ldr r0, _080762A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080762A4 @ =sub_8076000
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076298: .4byte gPlayer
_0807629C: .4byte 0xFFBFFFFF
_080762A0: .4byte gCurTask
_080762A4: .4byte sub_8076000

	thumb_func_start sub_80762A8
sub_80762A8: @ 0x080762A8
	ldr r0, _080762B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080762B8 @ =Task_Interactable_MusicPlant_GuitarString
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080762B4: .4byte gCurTask
_080762B8: .4byte Task_Interactable_MusicPlant_GuitarString

	thumb_func_start sub_80762BC
sub_80762BC: @ 0x080762BC
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_080762C4:
	lsls r0, r1, #3
	adds r0, r2, r0
	strh r3, [r0, #2]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #5
	bls _080762C4
	adds r0, r2, #0
	bl sub_807608C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80762E0
sub_80762E0: @ 0x080762E0
	push {lr}
	adds r3, r0, #0
	ldr r2, _0807630C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807631A
	ldr r0, [r3, #0x6c]
	adds r0, #0x18
	lsls r1, r0, #8
	ldr r0, [r2, #8]
	cmp r0, r1
	beq _0807631A
	cmp r0, r1
	ble _08076310
	subs r0, #0x80
	str r0, [r2, #8]
	cmp r0, r1
	bge _0807631A
	b _08076318
	.align 2, 0
_0807630C: .4byte gPlayer
_08076310:
	adds r0, #0x80
	str r0, [r2, #8]
	cmp r0, r1
	ble _0807631A
_08076318:
	str r1, [r2, #8]
_0807631A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076320
sub_8076320: @ 0x08076320
	push {lr}
	ldr r1, [r0, #0x6c]
	ldr r3, _0807635C @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x70]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x82
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _08076358
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08076358
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08076360
_08076358:
	movs r0, #1
	b _08076362
	.align 2, 0
_0807635C: .4byte gCamera
_08076360:
	movs r0, #0
_08076362:
	pop {r1}
	bx r1
	.align 2, 0
