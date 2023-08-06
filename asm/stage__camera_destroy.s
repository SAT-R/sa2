.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start DestroyCameraMovementTask
DestroyCameraMovementTask: @ 0x0801E028
	push {r4, lr}
	ldr r4, _0801E03C @ =gCamera
	ldr r0, [r4, #0x5c]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E03C: .4byte gCamera

	thumb_func_start TaskDestructor_801E040
TaskDestructor_801E040: @ 0x0801E040
	push {r4, lr}
	ldr r1, _0801E090 @ =gCamera
	movs r0, #0
	str r0, [r1, #0x5c]
	ldr r4, _0801E094 @ =gCurrentLevel
	ldr r3, _0801E098 @ =gFlags
	movs r2, #0
	ldr r0, _0801E09C @ =gBgScrollRegs
	movs r1, #3
_0801E052:
	strh r2, [r0]
	strh r2, [r0, #2]
	adds r0, #4
	subs r1, #1
	cmp r1, #0
	bge _0801E052
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x1d
	bne _0801E080
	ldr r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0801E080
	ldr r1, _0801E0A0 @ =gIntrTable
	ldr r0, _0801E0A4 @ =gIntrTableTemplate
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	str r2, [r3]
_0801E080:
	ldr r0, [r3]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E090: .4byte gCamera
_0801E094: .4byte gCurrentLevel
_0801E098: .4byte gFlags
_0801E09C: .4byte gBgScrollRegs
_0801E0A0: .4byte gIntrTable
_0801E0A4: .4byte gIntrTableTemplate

	thumb_func_start Task_801E0A8
Task_801E0A8: @ 0x0801E0A8
	push {lr}
	ldr r2, _0801E0E8 @ =gDispCnt
	ldrh r1, [r2]
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _0801E0EC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0801E0CA
	ldr r0, _0801E0F0 @ =0x0000F7FF
	ands r1, r0
	strh r1, [r2]
_0801E0CA:
	ldr r0, _0801E0F4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _0801E0DA
	ldrh r1, [r2]
	ldr r0, _0801E0F8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
_0801E0DA:
	ldr r0, _0801E0FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0801E100 @ =Task_801E104
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0801E0E8: .4byte gDispCnt
_0801E0EC: .4byte gCurrentLevel
_0801E0F0: .4byte 0x0000F7FF
_0801E0F4: .4byte gGameMode
_0801E0F8: .4byte 0x0000DFFF
_0801E0FC: .4byte gCurTask
_0801E100: .4byte Task_801E104

	thumb_func_start Task_801E104
Task_801E104: @ 0x0801E104
	push {lr}
	bl sub_801C394
	ldr r1, _0801E114 @ =gUnknown_030054B8
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E114: .4byte gUnknown_030054B8
