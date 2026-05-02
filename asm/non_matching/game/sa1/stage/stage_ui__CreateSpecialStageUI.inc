.include "constants/constants.inc"

.syntax unified
.text
	push {r4, lr}
	sub sp, #4
	movs r1, #0
	ldr r0, _0805422C @ =Task_SpecialStageUIMain
	movs r2, #0x8c
	lsls r2, r2, #5
	movs r4, #0
	str r1, [sp]
	movs r1, #0x50
	movs r3, #0
	bl TaskCreate
	adds r1, r0, #0
	ldrh r0, [r1, #6]
	ldr r2, _08054230 @ =0x03000040
	adds r0, r0, r2
	strh r4, [r0]
	ldrh r0, [r1, #6]
	ldr r1, _08054234 @ =0x0300004C
	adds r0, r0, r1
	strh r4, [r0]
	bl UiGfxStackInit
	bl sub_8054068
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805422C: .4byte Task_SpecialStageUIMain
_08054230: .4byte 0x03000040
_08054234: .4byte 0x0300004C

.syntax divided
