.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start Task_801F214
Task_801F214: @ 0x0801F214
	push {r4, r5, r6, lr}
	ldr r2, _0801F25C @ =gCurTask
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, #0x1c
	adds r5, r1, r0
	ldr r3, _0801F260 @ =gPlayer
	ldr r1, [r3, #0x20]
	movs r0, #0x80
	ands r1, r0
	cmp r1, #0
	bne _0801F254
	ldrh r1, [r4, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801F264
	adds r1, r3, #0
	adds r1, #0x68
	ldrh r0, [r4, #0x16]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801F254
	adds r1, r3, #0
	adds r1, #0x6a
	ldrh r0, [r4, #0x18]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0801F264
_0801F254:
	adds r0, r6, #0
	bl TaskDestroy
	b _0801F398
	.align 2, 0
_0801F25C: .4byte gCurTask
_0801F260: .4byte gPlayer
_0801F264:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0801F278
	ldr r0, [r2]
	bl TaskDestroy
	b _0801F398
_0801F278:
	ldrh r1, [r4, #0x14]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	beq _0801F310
	cmp r0, #1
	bgt _0801F28C
	cmp r0, #0
	beq _0801F292
	b _0801F334
_0801F28C:
	cmp r0, #2
	beq _0801F32C
	b _0801F334
_0801F292:
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	beq _0801F2EC
	cmp r0, #0x20
	bne _0801F2F4
	ldr r0, _0801F2CC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801F2E0
	ldr r0, _0801F2D0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	ldr r1, _0801F2D4 @ =gMultiplayerPlayerTasks
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	ldr r2, _0801F2D8 @ =IWRAM_START + 0x50
	adds r1, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	str r1, [r4]
	ldr r1, _0801F2DC @ =IWRAM_START + 0x52
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0801F2F2
	.align 2, 0
_0801F2CC: .4byte gGameMode
_0801F2D0: .4byte 0x04000128
_0801F2D4: .4byte gMultiplayerPlayerTasks
_0801F2D8: .4byte IWRAM_START + 0x50
_0801F2DC: .4byte IWRAM_START + 0x52
_0801F2E0:
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	str r0, [r4]
	ldr r0, [r3, #0xc]
	asrs r0, r0, #8
	b _0801F2F2
_0801F2EC:
	ldr r0, _0801F308 @ =gUnknown_03005660
	movs r1, #4
	ldrsh r0, [r0, r1]
_0801F2F2:
	str r0, [r4, #4]
_0801F2F4:
	ldr r2, _0801F30C @ =gCamera
	ldr r0, [r4]
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F308: .4byte gUnknown_03005660
_0801F30C: .4byte gCamera
_0801F310:
	ldr r2, _0801F328 @ =gCamera
	ldr r0, [r4]
	adds r1, r2, #0
	adds r1, #0x52
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	adds r2, #0x54
	ldrh r1, [r2]
	subs r0, r0, r1
	b _0801F332
	.align 2, 0
_0801F328: .4byte gCamera
_0801F32C:
	ldr r0, [r4]
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
_0801F332:
	strh r0, [r5, #0x18]
_0801F334:
	ldrh r1, [r4, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801F35A
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801F352
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801F358
_0801F352:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F37C @ =0xFFFFFBFF
	ands r0, r1
_0801F358:
	str r0, [r5, #0x10]
_0801F35A:
	ldrh r1, [r4, #0x14]
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F38C
	ldr r0, _0801F380 @ =gUnknown_03005424
	ldrh r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801F384
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _0801F38A
	.align 2, 0
_0801F37C: .4byte 0xFFFFFBFF
_0801F380: .4byte gUnknown_03005424
_0801F384:
	ldr r0, [r5, #0x10]
	ldr r1, _0801F3A0 @ =0xFFFFF7FF
	ands r0, r1
_0801F38A:
	str r0, [r5, #0x10]
_0801F38C:
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_0801F398:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F3A0: .4byte 0xFFFFF7FF

.if 0
.endif
