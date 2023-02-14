.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata    
    .global gUnknown_080D9518
gUnknown_080D9518:
    .incbin "baserom.gba", 0x000D9518, 0x28

.section .text
.syntax unified
.arm

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

	thumb_func_start TaskDestructor_80636F0
TaskDestructor_80636F0: @ 0x080636F0
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
