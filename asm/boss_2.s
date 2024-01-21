.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

	.global gUnknown_080D7B10
gUnknown_080D7B10:
    .incbin "baserom.gba", 0x000D7B10, 0x3

    .global gUnknown_080D7B13
gUnknown_080D7B13:
    .incbin "baserom.gba", 0x000D7B13, 0x30

    .global gUnknown_080D7B43
gUnknown_080D7B43:
    .incbin "baserom.gba", 0x000D7B43, 0xB

    .global gUnknown_080D7B4E
gUnknown_080D7B4E:
    .incbin "baserom.gba", 0x000D7B4E, 0x2

    .global gUnknown_080D7B50
gUnknown_080D7B50:
    .incbin "baserom.gba", 0x000D7B50, 0x18

    .global gUnknown_080D7B68
gUnknown_080D7B68:
    .incbin "baserom.gba", 0x000D7B68, 0x8

    .global gUnknown_080D7B70
gUnknown_080D7B70:
    .incbin "baserom.gba", 0x000D7B70, 0x20

    .global gUnknown_080D7B90
gUnknown_080D7B90:
    .incbin "baserom.gba", 0x000D7B90, 0x20

.text
.syntax unified
.arm

	thumb_func_start Task_803E520
Task_803E520: @ 0x0803E520
	push {r4, r5, lr}
	ldr r5, _0803E598 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	adds r0, r4, #0
	bl sub_803E63C
	adds r0, r4, #0
	bl sub_803DA8C
	adds r0, r4, #0
	bl sub_803D430
	adds r0, r4, #0
	bl sub_803D978
	adds r0, r4, #0
	bl sub_803E214
	ldr r2, _0803E59C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803E5A0 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803E5A4 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0803E5A8 @ =gStageTime
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x15
	bl Mod
	cmp r0, #0
	bne _0803E57A
	movs r0, #0x90
	bl m4aSongNumStart
_0803E57A:
	ldr r0, [r4, #0x68]
	subs r0, #1
	str r0, [r4, #0x68]
	cmp r0, #0
	bne _0803E590
	adds r0, r4, #0
	bl sub_803D368
	ldr r1, [r5]
	ldr r0, _0803E5AC @ =sub_803D2C0
	str r0, [r1, #8]
_0803E590:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803E598: .4byte gCurTask
_0803E59C: .4byte gPseudoRandom
_0803E5A0: .4byte 0x00196225
_0803E5A4: .4byte 0x3C6EF35F
_0803E5A8: .4byte gStageTime
_0803E5AC: .4byte sub_803D2C0

	thumb_func_start sub_803E5B0
sub_803E5B0: @ 0x0803E5B0
	push {r4, r5, r6, lr}
	ldr r6, _0803E624 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	ldr r1, _0803E628 @ =gCamera
	ldr r1, [r1]
	subs r5, r0, r1
	adds r0, r4, #0
	bl sub_803D754
	adds r0, r4, #0
	movs r1, #0
	bl sub_803D640
	adds r0, r4, #0
	bl sub_803D978
	adds r0, r4, #0
	bl sub_803E214
	ldr r2, _0803E62C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0803E630 @ =0x00196225
	muls r1, r0, r1
	ldr r0, _0803E634 @ =0x3C6EF35F
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, _0803E638 @ =gStageTime
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xd
	bl Mod
	cmp r0, #0
	bne _0803E606
	movs r0, #0x90
	bl m4aSongNumStart
_0803E606:
	movs r0, #0xc8
	rsbs r0, r0, #0
	cmp r5, r0
	bge _0803E61E
	adds r0, #0xb4
	movs r1, #0x8c
	movs r2, #1
	bl sub_802EF68
	ldr r0, [r6]
	bl TaskDestroy
_0803E61E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E624: .4byte gCurTask
_0803E628: .4byte gCamera
_0803E62C: .4byte gPseudoRandom
_0803E630: .4byte 0x00196225
_0803E634: .4byte 0x3C6EF35F
_0803E638: .4byte gStageTime

	thumb_func_start sub_803E63C
sub_803E63C: @ 0x0803E63C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r5, #0
_0803E646:
	ldr r1, [r6]
	asrs r1, r1, #8
	ldr r0, _0803E69C @ =gUnknown_080D7B10
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r0, r5, #3
	adds r4, r6, #0
	adds r4, #0x10
	adds r4, r4, r0
	ldr r0, [r4]
	asrs r0, r0, #8
	adds r0, #0x12
	adds r7, r7, r0
	ldr r2, _0803E6A0 @ =sub_801EC3C
	str r2, [sp]
	movs r2, #1
	movs r3, #8
	bl sub_801F100
	lsls r0, r0, #8
	ldr r1, [r4]
	adds r1, r1, r0
	str r1, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _0803E646
	adds r0, r7, #0
	movs r1, #3
	bl Div
	lsls r0, r0, #8
	ldr r1, _0803E6A4 @ =0xFFFFEE00
	adds r0, r0, r1
	str r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E69C: .4byte gUnknown_080D7B10
_0803E6A0: .4byte sub_801EC3C
_0803E6A4: .4byte 0xFFFFEE00

	thumb_func_start sub_803E6A8
sub_803E6A8: @ 0x0803E6A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x64]
	lsls r1, r0, #2
	adds r2, r1, r0
	ldr r3, _0803E6E8 @ =0x000003FF
	adds r1, r3, #0
	ands r2, r1
	adds r0, #1
	str r0, [r4, #0x64]
	adds r0, r4, #0
	adds r0, #0x71
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E6E2
	ldr r1, _0803E6EC @ =gSineTable
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xc0
	bl Div
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
_0803E6E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E6E8: .4byte 0x000003FF
_0803E6EC: .4byte gSineTable

	thumb_func_start sub_803E6F0
sub_803E6F0: @ 0x0803E6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	bl sub_803DB1C
	ldr r0, [r7, #0x68]
	cmp r0, #0
	bne _0803E750
	ldr r1, [r7]
	ldr r0, _0803E738 @ =0xFFFFF800
	adds r1, r1, r0
	ldr r2, [r7, #4]
	ldr r4, _0803E73C @ =0xFFFFEA00
	adds r2, r2, r4
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #8
	str r0, [sp]
	ldr r6, _0803E740 @ =gUnknown_080D7B13
	ldr r5, _0803E744 @ =gPseudoRandom
	ldr r4, [r5]
	ldr r0, _0803E748 @ =0x00196225
	muls r0, r4, r0
	ldr r4, _0803E74C @ =0x3C6EF35F
	adds r0, r0, r4
	str r0, [r5]
	movs r4, #0xf
	ands r0, r4
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_803E7D4
	movs r0, #0x71
	b _0803E75C
	.align 2, 0
_0803E738: .4byte 0xFFFFF800
_0803E73C: .4byte 0xFFFFEA00
_0803E740: .4byte gUnknown_080D7B13
_0803E744: .4byte gPseudoRandom
_0803E748: .4byte 0x00196225
_0803E74C: .4byte 0x3C6EF35F
_0803E750:
	cmp r0, #0x96
	bls _0803E758
	movs r0, #0x96
	str r0, [r7, #0x68]
_0803E758:
	ldr r0, [r7, #0x68]
	subs r0, #1
_0803E75C:
	str r0, [r7, #0x68]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_EggBomberTankMain
TaskDestructor_EggBomberTankMain: @ 0x0803E768
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r4, r0
	ldr r0, [r0, #0x6c]
	bl VramFree
	ldr r0, _0803E790 @ =IWRAM_START + 0x84
	adds r4, r4, r0
	ldr r0, [r4]
	bl VramFree
	ldr r1, _0803E794 @ =gActiveBossTask
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E790: .4byte IWRAM_START + 0x84
_0803E794: .4byte gActiveBossTask

@; Unused?
	thumb_func_start sub_803E798
sub_803E798: @ 0x0803E798
	push {lr}
	adds r2, r0, #0
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r3, r2, r0
	adds r1, r2, #0
	adds r1, #0x73
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E7CA
	movs r0, #0xa2
	lsls r0, r0, #2
	strh r0, [r3, #0xa]
	subs r0, #0xe4
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803E7D0 @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803E7CA:
	pop {r0}
	bx r0
	.align 2, 0
_0803E7D0: .4byte 0x000001A5

	thumb_func_start sub_803E7D4
sub_803E7D4: @ 0x0803E7D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #0x28]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0803E864 @ =sub_803E8DC
	movs r2, #0xc2
	lsls r2, r2, #7
	movs r1, #0
	str r1, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	ldr r1, _0803E868 @ =gCamera
	ldr r0, [r1]
	lsls r0, r0, #8
	mov r2, r8
	subs r0, r2, r0
	str r0, [r7]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	mov r1, sb
	subs r0, r1, r0
	str r0, [r7, #4]
	ldr r1, _0803E86C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r5, r0
	asrs r0, r0, #0xe
	strh r0, [r7, #8]
	lsls r0, r4, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xd
	strh r0, [r7, #0xa]
	strb r6, [r7, #0xc]
	mov r2, sl
	str r2, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r4, r0
	bls _0803E870
	movs r0, #0xf5
	bl m4aSongNumStart
	b _0803E876
	.align 2, 0
_0803E864: .4byte sub_803E8DC
_0803E868: .4byte gCamera
_0803E86C: .4byte gSineTable
_0803E870:
	movs r0, #0xf4
	bl m4aSongNumStart
_0803E876:
	adds r1, r7, #0
	adds r1, #0x14
	mov r4, r8
	asrs r0, r4, #8
	movs r3, #0
	movs r2, #0
	strh r0, [r1, #0x16]
	mov r4, sb
	asrs r0, r4, #8
	strh r0, [r1, #0x18]
	mov r4, sl
	ldr r0, [r4, #0x6c]
	str r0, [r1, #4]
	ldr r0, _0803E8D8 @ =0x00000287
	strh r0, [r1, #0xa]
	adds r0, r7, #0
	adds r0, #0x34
	strb r3, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r2, [r1, #8]
	strh r2, [r1, #0x14]
	strh r2, [r1, #0x1c]
	adds r2, r7, #0
	adds r2, #0x35
	movs r0, #0xff
	strb r0, [r2]
	adds r2, #1
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E8D8: .4byte 0x00000287

	thumb_func_start sub_803E8DC
sub_803E8DC: @ 0x0803E8DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r0, _0803E920 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0x14
	adds r6, r1, r0
	ldrh r0, [r7, #0xa]
	adds r0, #0x20
	strh r0, [r7, #0xa]
	ldr r0, _0803E924 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0803E92C
	movs r2, #8
	ldrsh r1, [r7, r2]
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	movs r0, #0xa
	ldrsh r1, [r7, r0]
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
	ldr r4, _0803E928 @ =gCamera
	b _0803E950
	.align 2, 0
_0803E920: .4byte gCurTask
_0803E924: .4byte gPlayer
_0803E928: .4byte gCamera
_0803E92C:
	movs r2, #8
	ldrsh r1, [r7, r2]
	ldr r2, _0803EA5C @ =gCamera
	ldr r0, [r2, #0x38]
	lsls r0, r0, #8
	subs r1, r1, r0
	ldr r0, [r7]
	subs r0, r0, r1
	str r0, [r7]
	movs r0, #0xa
	ldrsh r1, [r7, r0]
	ldr r0, [r2, #0x3c]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
	adds r4, r2, #0
_0803E950:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	adds r2, r4, #0
	ldr r1, [r2, #4]
	adds r1, #0xc
	adds r0, r0, r1
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r2, [r2]
	adds r1, r1, r2
	add r2, sp, #8
	str r2, [sp]
	ldr r2, _0803EA60 @ =sub_801EE64
	str r2, [sp, #4]
	movs r2, #1
	movs r3, #8
	bl sub_801E4E4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _0803E998
	lsls r1, r0, #8
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
	movs r2, #0xa
	ldrsh r0, [r7, r2]
	lsls r0, r0, #3
	rsbs r0, r0, #0
	movs r1, #0xa
	bl Div
	strh r0, [r7, #0xa]
_0803E998:
	ldr r0, [r7]
	asrs r0, r0, #8
	strh r0, [r6, #0x16]
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	strh r0, [r6, #0x18]
	ldr r0, [r7, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EA00
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r0, [r4]
	adds r1, r1, r0
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	ldr r0, [r4, #4]
	adds r2, r2, r0
	ldr r0, _0803EA64 @ =gPlayer
	str r0, [sp]
	adds r0, r6, #0
	movs r3, #0
	bl sub_800CA20
	adds r5, r0, #0
	cmp r5, #1
	bne _0803EA00
	ldr r2, [r7, #0x10]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E9FE
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r3, r2, #0
	adds r3, #0x73
	movs r0, #0x1e
	strb r0, [r3]
	ldr r0, _0803EA68 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r2, r1
	strb r5, [r0]
	ldr r0, _0803EA6C @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803E9FE:
	strb r5, [r7, #0xc]
_0803EA00:
	ldrb r0, [r7, #0xc]
	subs r0, #1
	strb r0, [r7, #0xc]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EA16
	ldr r0, [r7, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EADC
_0803EA16:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0xf
	ble _0803EA7C
	movs r0, #0xf2
	bl m4aSongNumStart
	ldr r3, [r6, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r3, r3, r2
	str r3, [sp, #0xc]
	ldr r5, _0803EA70 @ =0xFFFF0000
	ldr r0, [sp, #0x10]
	ands r5, r0
	ldr r0, _0803EA74 @ =0x0000027E
	orrs r5, r0
	ldr r0, _0803EA78 @ =0xFF00FFFF
	ands r5, r0
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r4, _0803EA5C @ =gCamera
	ldr r2, [r4]
	adds r1, r1, r2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	ldr r4, [r4, #4]
	adds r2, r2, r4
	str r5, [sp]
	bl sub_803EAF4
	b _0803EAB8
	.align 2, 0
_0803EA5C: .4byte gCamera
_0803EA60: .4byte sub_801EE64
_0803EA64: .4byte gPlayer
_0803EA68: .4byte 0x00000275
_0803EA6C: .4byte 0x000001A5
_0803EA70: .4byte 0xFFFF0000
_0803EA74: .4byte 0x0000027E
_0803EA78: .4byte 0xFF00FFFF
_0803EA7C:
	movs r0, #0xf3
	bl m4aSongNumStart
	ldr r3, [r6, #4]
	movs r1, #0xe8
	lsls r1, r1, #3
	adds r3, r3, r1
	str r3, [sp, #0xc]
	ldr r5, _0803EAC4 @ =0xFFFF0000
	ldr r2, [sp, #0x10]
	ands r5, r2
	ldr r0, _0803EAC8 @ =0x0000027F
	orrs r5, r0
	ldr r0, _0803EACC @ =0xFF00FFFF
	ands r5, r0
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	asrs r1, r1, #8
	ldr r6, _0803EAD0 @ =gCamera
	ldr r2, [r6]
	adds r1, r1, r2
	ldr r2, [r7, #4]
	asrs r2, r2, #8
	adds r4, #0xf
	adds r2, r2, r4
	ldr r4, [r6, #4]
	adds r2, r2, r4
	str r5, [sp]
	bl sub_803EAF4
_0803EAB8:
	ldr r0, _0803EAD4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803EAD8 @ =sub_803EC84
	str r0, [r1, #8]
	b _0803EAE8
	.align 2, 0
_0803EAC4: .4byte 0xFFFF0000
_0803EAC8: .4byte 0x0000027F
_0803EACC: .4byte 0xFF00FFFF
_0803EAD0: .4byte gCamera
_0803EAD4: .4byte gCurTask
_0803EAD8: .4byte sub_803EC84
_0803EADC:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_0803EAE8:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_803EAF4
sub_803EAF4: @ 0x0803EAF4
	sub sp, #4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov r8, r1
	mov sb, r2
	str r3, [sp, #0x28]
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r0, _0803EBA0 @ =sub_803EBBC
	movs r2, #0xc4
	lsls r2, r2, #7
	movs r6, #0
	str r6, [sp]
	movs r1, #0x44
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r3, r1
	ldr r2, _0803EBA4 @ =gCamera
	ldr r0, [r2]
	mov r7, r8
	subs r0, r7, r0
	str r0, [r1]
	ldr r0, [r2, #4]
	mov r2, sb
	subs r0, r2, r0
	str r0, [r1, #4]
	movs r7, #0
	mov sl, r7
	strh r6, [r1, #8]
	strh r6, [r1, #0xa]
	ldr r0, [sp, #4]
	str r0, [r1, #0x10]
	ldr r2, _0803EBA8 @ =IWRAM_START + 0x14
	adds r1, r3, r2
	mov r7, r8
	strh r7, [r1, #0x16]
	mov r0, sb
	strh r0, [r1, #0x18]
	str r4, [r1, #4]
	strh r5, [r1, #0xa]
	lsrs r2, r5, #0x10
	ldr r4, _0803EBAC @ =IWRAM_START + 0x34
	adds r0, r3, r4
	strb r2, [r0]
	movs r0, #0xc8
	lsls r0, r0, #3
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r7, _0803EBB0 @ =IWRAM_START + 0x35
	adds r2, r3, r7
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0803EBB4 @ =IWRAM_START + 0x36
	adds r2, r3, r0
	movs r0, #0x10
	strb r0, [r2]
	ldr r2, _0803EBB8 @ =IWRAM_START + 0x39
	adds r3, r3, r2
	mov r4, sl
	strb r4, [r3]
	subs r0, #0x11
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #0x10]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0
_0803EBA0: .4byte sub_803EBBC
_0803EBA4: .4byte gCamera
_0803EBA8: .4byte IWRAM_START + 0x14
_0803EBAC: .4byte IWRAM_START + 0x34
_0803EBB0: .4byte IWRAM_START + 0x35
_0803EBB4: .4byte IWRAM_START + 0x36
_0803EBB8: .4byte IWRAM_START + 0x39

	thumb_func_start sub_803EBBC
sub_803EBBC: @ 0x0803EBBC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803EC6C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x14
	adds r5, r1, r0
	ldr r6, _0803EC70 @ =gPlayer
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803EBEE
	ldr r2, _0803EC74 @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2, #0x38]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #4]
_0803EBEE:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	strh r0, [r5, #0x18]
	ldr r0, [r4, #0x10]
	adds r0, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803EC4C
	ldr r3, _0803EC74 @ =gCamera
	ldr r1, [r4]
	ldr r0, [r3]
	adds r1, r1, r0
	ldr r2, [r4, #4]
	ldr r0, [r3, #4]
	adds r2, r2, r0
	str r6, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl sub_800CA20
	adds r6, r0, #0
	cmp r6, #1
	bne _0803EC4C
	ldr r2, [r4, #0x10]
	adds r0, r2, #0
	adds r0, #0x72
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803EC4C
	movs r0, #0xc2
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r3, r2, #0
	adds r3, #0x73
	movs r0, #0x1e
	strb r0, [r3]
	ldr r0, _0803EC78 @ =0x00000275
	strh r0, [r1, #0xa]
	movs r1, #0xd2
	lsls r1, r1, #1
	adds r0, r2, r1
	strb r6, [r0]
	ldr r0, _0803EC7C @ =0x000001A5
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
_0803EC4C:
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _0803EC5E
	ldr r0, _0803EC6C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0803EC80 @ =sub_803EC84
	str r0, [r1, #8]
_0803EC5E:
	adds r0, r5, #0
	bl DisplaySprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803EC6C: .4byte gCurTask
_0803EC70: .4byte gPlayer
_0803EC74: .4byte gCamera
_0803EC78: .4byte 0x00000275
_0803EC7C: .4byte 0x000001A5
_0803EC80: .4byte sub_803EC84

	thumb_func_start sub_803EC84
sub_803EC84: @ 0x0803EC84
	push {lr}
	ldr r0, _0803EC94 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0803EC94: .4byte gCurTask
