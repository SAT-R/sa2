.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _080665AC @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r2, r1
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sl, r0
	ldr r0, [r4, #0x24]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp]
	ldr r0, [r4, #0x28]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sb, r0
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [r4, #0x1c]
	ldrh r0, [r0, #6]
	adds r7, r0, r1
	ldr r0, [r4, #0x20]
	ldrh r0, [r0, #6]
	adds r6, r0, r1
	ldr r0, _080665B0 @ =0x03000040
	adds r2, r2, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r5, r0, #1
	movs r0, #0xaf
	lsls r0, r0, #2
	cmp r5, r0
	bls _080665CC
	ldr r1, _080665B4 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _080665B8 @ =gBackgroundsCopyQueueCursor
	ldr r0, _080665BC @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _080665C0 @ =gBgSpritesCount
	movs r0, #0
	strb r0, [r1]
	ldr r1, _080665C4 @ =gVramGraphicsCopyCursor
	ldr r0, _080665C8 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	bl CreateStaffCredits
	b _08066614
	.align 2, 0
_080665AC: .4byte gCurTask
_080665B0: .4byte 0x03000040
_080665B4: .4byte 0x0000FFFF
_080665B8: .4byte gBackgroundsCopyQueueCursor
_080665BC: .4byte gBackgroundsCopyQueueIndex
_080665C0: .4byte gBgSpritesCount
_080665C4: .4byte gVramGraphicsCopyCursor
_080665C8: .4byte gVramGraphicsCopyQueueIndex
_080665CC:
	ldr r0, _08066624 @ =0x0000029D
	cmp r5, r0
	bls _080665F2
	adds r0, #1
	cmp r5, r0
	bne _080665EC
	movs r1, #0
	strh r1, [r4]
	movs r2, #1
	movs r0, #1
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r1, [r4, #6]
	movs r0, #0xc0
	strh r0, [r4, #8]
	strb r2, [r4, #0xa]
_080665EC:
	adds r0, r4, #0
	bl sub_805423C
_080665F2:
	adds r0, r4, #0
	adds r0, #0x40
	strh r5, [r0]
	mov r0, sl
	strh r5, [r0, #0x3c]
	ldr r0, [sp]
	strh r5, [r0, #0x3c]
	ldr r0, [sp, #4]
	strh r5, [r0, #0x3c]
	ldr r0, [sp, #8]
	strh r5, [r0, #0x3c]
	mov r1, sb
	strh r5, [r1, #0x3c]
	mov r0, r8
	strh r5, [r0, #0x3c]
	strh r5, [r7, #0x3c]
	strh r5, [r6, #0x3c]
_08066614:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066624: .4byte 0x0000029D

.syntax divided
