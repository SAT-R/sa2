.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08028EEC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #4]    @ sp04 = shake
	ldr r3, _08028EF0 @ =gCamera
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #4
	ldrsh r1, [r1, r2]
	movs r4, #2
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	adds r1, #0x50
	cmp r0, r1
	bge _08028D1C
	b _08028EDC_return
_08028D1C:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]    @ sp08 = prevCamY
	movs r6, #0         @ r6 = i
	ldr r5, _08028EF4 @ =gPseudoRandom
	ldr r0, _08028EF8 @ =0x00196225
	mov r8, r0
	ldr r7, _08028EFC @ =0x3C6EF35F
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	str r2, [sp, #0xc]  @ sp0C = prevCamX
	ldr r3, _08028F00 @ =gSineTable
	mov sl, r3
	str r1, [sp, #0x10] @ sp10 = prevCamX << 16
_08028D3E_loop:
	ldr r0, [r5]
	mov r4, r8
	muls r4, r0, r4
	adds r0, r4, #0
	adds r0, r0, r7
	str r0, [r5]
	movs r4, #7
	ands r4, r0
	ldr r0, _08028F04 @ =gUnknown_080BB434
	adds r0, r4, r0
	ldrb r0, [r0]
	bl VramMalloc
	adds r1, r0, #0     @ r1 = tiles
	ldr r2, _08028F08 @ =gUnknown_080BB41C
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	ldr r0, _08028F0C @ =gUnknown_080BB42C
	adds r0, r4, r0
	ldrb r3, [r0]
	ldr r0, _08028F10 @ =TaskDestructor_NutsAndBolts
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #6
	bl CreateNutsAndBoltsTask
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0     @ r4 = strc
	ldr r0, [r5]
	mov r1, r8
	muls r1, r0, r1
	adds r1, r1, r7
	str r1, [r5]
	movs r0, #0xff
	ands r0, r1
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #8
	str r0, [r4, #0x30]
	ldr r0, [sp, #8]
	lsls r3, r0, #0x10
	asrs r0, r3, #8
	str r0, [r4, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	movs r0, #0xf8
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	movs r0, #0x28
	strh r0, [r4, #0x3e]
	ldr r0, _08028F14 @ =0x03000040
	adds r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2]
	mov r0, r8
	muls r0, r1, r0
	adds r0, r0, r7
	str r0, [r5]
	ldr r1, _08028F18 @ =0x000001FF
	ands r1, r0
	lsls r0, r1, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #6
	strh r0, [r4, #0x3a]
	movs r2, #0x3a
	ldrsh r0, [r4, r2]
	mov sb, r3
	cmp r0, #0
	bge _08028DD8
	rsbs r0, r0, #0
_08028DD8:
	strh r0, [r4, #0x3a]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	rsbs r0, r0, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0x38]
	adds r6, #1
	cmp r6, #2
	bls _08028D3E_loop
	movs r6, #0
	ldr r5, _08028EF4 @ =gPseudoRandom
	ldr r2, _08028EF8 @ =0x00196225
	mov r8, r2
	ldr r7, _08028EFC @ =0x3C6EF35F
	ldr r3, _08028F00 @ =gSineTable
	mov sl, r3
_08028E04_loop_2:
	ldr r0, [r5]
	mov r4, r8
	muls r4, r0, r4
	adds r0, r4, #0
	adds r0, r0, r7
	str r0, [r5]
	movs r4, #7
	ands r4, r0
	ldr r0, _08028F04 @ =gUnknown_080BB434
	adds r0, r4, r0
	ldrb r0, [r0]
	bl VramMalloc
	adds r1, r0, #0
	ldr r2, _08028F08 @ =gUnknown_080BB41C
	lsls r0, r4, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	ldr r0, _08028F0C @ =gUnknown_080BB42C
	adds r0, r4, r0
	ldrb r3, [r0]
	ldr r0, _08028F10 @ =TaskDestructor_NutsAndBolts
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #6
	bl CreateNutsAndBoltsTask
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	ldr r0, [r5]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r2, r7
	str r2, [r5]
	ldr r0, [sp, #0x10]
	asrs r1, r0, #0x10
	movs r0, #0xff
	ands r0, r2
	adds r1, r1, r0
	lsls r1, r1, #8
	str r1, [r4, #0x30]
	mov r1, sb
	asrs r0, r1, #8
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	movs r0, #0x28
	strh r0, [r4, #0x3e]
	ldr r0, _08028F14 @ =0x03000040
	adds r3, r3, r0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	mov r0, r8
	muls r0, r2, r0
	adds r0, r0, r7
	str r0, [r5]
	adds r1, #0xff
	ands r1, r0
	lsls r0, r1, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r0, r0, #5
	strh r0, [r4, #0x3a]
	movs r3, #0x3a
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bge _08028E9A
	rsbs r0, r0, #0
_08028E9A:
	strh r0, [r4, #0x3a]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #9
	rsbs r0, r0, #0
	asrs r0, r0, #0xe
	strh r0, [r4, #0x38]
	adds r6, #1
	cmp r6, #2
	bls _08028E04_loop_2
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0x80
	str r1, [sp]
	movs r1, #8
	movs r2, #0x10
	movs r3, #0xa
	bl CreateScreenShake
	ldr r4, [sp, #4]
	str r0, [r4]
	movs r0, #0xad
	bl m4aSongNumStart
	ldr r0, _08028EEC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08028F1C @ =Task_8028F20
	str r0, [r1, #8]
_08028EDC_return:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028EEC: .4byte gCurTask
_08028EF0: .4byte gCamera
_08028EF4: .4byte gPseudoRandom
_08028EF8: .4byte 0x00196225
_08028EFC: .4byte 0x3C6EF35F
_08028F00: .4byte gSineTable
_08028F04: .4byte gUnknown_080BB434
_08028F08: .4byte gUnknown_080BB41C
_08028F0C: .4byte gUnknown_080BB42C
_08028F10: .4byte TaskDestructor_NutsAndBolts
_08028F14: .4byte 0x03000040
_08028F18: .4byte 0x000001FF
_08028F1C: .4byte Task_8028F20

.syntax divided
