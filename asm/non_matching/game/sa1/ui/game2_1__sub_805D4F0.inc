.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _0805D5FC @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r0, r1
	ldr r0, [r5, #0x1c]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [r5, #0x18]
	ldrh r3, [r0, #6]
	adds r3, r3, r1
	ldr r0, [r5, #0xc]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	mov sb, r0
	ldr r0, [r5, #0x24]
	ldrh r0, [r0, #6]
	adds r7, r0, r1
	ldr r0, [r5, #0x10]
	ldrh r0, [r0, #6]
	adds r4, r0, r1
	ldr r0, [r5, #0x14]
	ldrh r0, [r0, #6]
	adds r6, r0, r1
	ldr r0, [r5, #0x20]
	ldrh r2, [r0, #6]
	adds r2, r2, r1
	ldrh r0, [r5, #0x28]
	mov r1, r8
	strh r0, [r1, #0x20]
	ldrh r0, [r5, #0x28]
	strh r0, [r3, #0x20]
	ldrh r0, [r5, #0x28]
	mov r1, sb
	strh r0, [r1, #0x20]
	ldrh r0, [r5, #0x28]
	strh r0, [r7, #0x20]
	ldrh r0, [r5, #0x28]
	strh r0, [r4, #0x20]
	ldrh r0, [r5, #0x28]
	strh r0, [r6, #0x20]
	ldrh r0, [r5, #0x28]
	strh r0, [r2, #0x20]
	movs r1, #0x28
	ldrsh r0, [r5, r1]
	cmp r0, #0xa9
	ble _0805D586
	ldrh r0, [r6, #0x26]
	cmp r0, #0
	beq _0805D576
	subs r0, #1
	strh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0805D570
	strh r0, [r6, #0x26]
_0805D570:
	ldr r0, [r7, #0x1c]
	adds r0, #0x64
	str r0, [r7, #0x1c]
_0805D576:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0805D586
	subs r0, #0x64
	str r0, [r4, #0x18]
	ldr r0, [r7, #0x1c]
	adds r0, #0x64
	str r0, [r7, #0x1c]
_0805D586:
	ldrh r1, [r5, #0x2a]
	ldr r0, _0805D600 @ =0x00000267
	adds r1, r1, r0
	ldrh r0, [r5, #0x28]
	adds r0, #1
	strh r0, [r5, #0x28]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r5, #0x2a]
	cmp r1, r0
	bge _0805D62C
	ldr r7, _0805D604 @ =gPlayer
	movs r1, #0x48
	adds r1, r1, r7
	mov sb, r1
	ldrh r0, [r1]
	subs r0, #0x10
	strh r0, [r1]
	movs r0, #0x4a
	adds r0, r0, r7
	mov r8, r0
	ldrh r0, [r0]
	subs r0, #0x10
	mov r1, r8
	strh r0, [r1]
	ldr r1, _0805D608 @ =0x0000FFFF
	movs r0, #0
	bl TasksDestroyInPriorityRange
	ldr r1, _0805D60C @ =gBackgroundsCopyQueueCursor
	ldr r0, _0805D610 @ =gBackgroundsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0805D614 @ =gBgSpritesCount
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0805D618 @ =gVramGraphicsCopyCursor
	ldr r0, _0805D61C @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r5, _0805D620 @ =gCourseTime
	ldr r6, [r5]
	bl CreateGameStage
	ldr r0, _0805D624 @ =gSpecialStageReturnX
	ldrh r0, [r0]
	mov r1, sb
	strh r0, [r1]
	ldr r0, _0805D628 @ =gSpecialStageReturnY
	ldrh r0, [r0]
	mov r1, r8
	strh r0, [r1]
	adds r1, r7, #0
	adds r1, #0x6e
	movs r0, #1
	strb r0, [r1]
	str r6, [r5]
	b _0805D674
	.align 2, 0
_0805D5FC: .4byte gCurTask
_0805D600: .4byte 0x00000267
_0805D604: .4byte gPlayer
_0805D608: .4byte 0x0000FFFF
_0805D60C: .4byte gBackgroundsCopyQueueCursor
_0805D610: .4byte gBackgroundsCopyQueueIndex
_0805D614: .4byte gBgSpritesCount
_0805D618: .4byte gVramGraphicsCopyCursor
_0805D61C: .4byte gVramGraphicsCopyQueueIndex
_0805D620: .4byte gCourseTime
_0805D624: .4byte gSpecialStageReturnX
_0805D628: .4byte gSpecialStageReturnY
_0805D62C:
	movs r0, #0x28
	ldrsh r1, [r5, r0]
	adds r0, r2, #0
	adds r0, #0xaa
	cmp r1, r0
	bne _0805D650
	mov r0, sb
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D64A
	movs r0, #0x9a
	bl m4aSongNumStart
	b _0805D650
_0805D64A:
	movs r0, #0x8d      @ SE_STAGE_RESULT_COUNTER_DONE
	bl m4aSongNumStart
_0805D650:
	movs r1, #0x28
	ldrsh r0, [r5, r1]
	cmp r0, #0xaa
	ble _0805D674
	adds r1, r0, #0
	ldrh r0, [r5, #0x2a]
	adds r0, #0xaa
	cmp r1, r0
	bge _0805D674
	adds r0, r1, #0
	movs r1, #4
	bl Mod
	cmp r0, #0
	bne _0805D674
	movs r0, #0x8c      @ SE_STAGE_RESULT_COUNTER
	bl m4aSongNumStart
_0805D674:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
