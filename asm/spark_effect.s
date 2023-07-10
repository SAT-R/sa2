.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

@; Creates a spark effect, might be unused?
	thumb_func_start CreateSparkEffect
CreateSparkEffect: @ 0x0801FAFC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0801FB60 @ =Task_801FB80
	ldr r2, _0801FB64 @ =0x00002001
	ldr r1, _0801FB68 @ =TaskDestructor_801FC18
	str r1, [sp]
	movs r1, #0x30
	movs r3, #0
	bl TaskCreate
	adds r6, r0, #0
	ldrh r5, [r6, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	movs r0, #0x14
	bl VramMalloc
	str r0, [r4, #4]
	movs r3, #0
	movs r2, #0
	strh r2, [r4, #8]
	ldr r0, _0801FB6C @ =0x00000351
	strh r0, [r4, #0xa]
	ldr r1, _0801FB70 @ =IWRAM_START + 0x20
	adds r0, r5, r1
	strb r3, [r0]
	ldr r0, _0801FB74 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r4, #0x1a]
	strh r2, [r4, #0x1c]
	ldr r0, _0801FB78 @ =IWRAM_START + 0x22
	adds r1, r5, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801FB7C @ =IWRAM_START + 0x25
	adds r5, r5, r1
	strb r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801FB60: .4byte Task_801FB80
_0801FB64: .4byte 0x00002001
_0801FB68: .4byte TaskDestructor_801FC18
_0801FB6C: .4byte 0x00000351
_0801FB70: .4byte IWRAM_START + 0x20
_0801FB74: .4byte IWRAM_START + 0x21
_0801FB78: .4byte IWRAM_START + 0x22
_0801FB7C: .4byte IWRAM_START + 0x25

	thumb_func_start Task_801FB80
Task_801FB80: @ 0x0801FB80
	push {r4, lr}
	ldr r3, _0801FBA4 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _0801FB9A
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	bne _0801FBAC
_0801FB9A:
	ldr r0, _0801FBA8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0801FC0C
	.align 2, 0
_0801FBA4: .4byte gPlayer
_0801FBA8: .4byte gCurTask
_0801FBAC:
	ldr r0, [r3, #0x68]
	cmp r0, #0x37
	bne _0801FC0C
	ldr r0, _0801FBF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r2, _0801FBF4 @ =gCamera
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r1, [r3, #0xc]
	asrs r1, r1, #8
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	adds r0, r0, r1
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r3, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801FBF8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	b _0801FBFE
	.align 2, 0
_0801FBF0: .4byte gCurTask
_0801FBF4: .4byte gCamera
_0801FBF8:
	ldr r0, [r4, #0x10]
	ldr r1, _0801FC14 @ =0xFFFFFBFF
	ands r0, r1
_0801FBFE:
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0801FC0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC14: .4byte 0xFFFFFBFF

	thumb_func_start TaskDestructor_801FC18
TaskDestructor_801FC18: @ 0x0801FC18
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
