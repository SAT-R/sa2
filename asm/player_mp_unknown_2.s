.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_PlayerMPUnk2
Task_PlayerMPUnk2: @ 0x0801A430
	push {r4, lr}
	ldr r0, _0801A46C @ =gCurTask
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r0, [r1, #2]
	adds r4, r0, #0
	cmp r4, #0
	beq _0801A476
	ldrh r2, [r1, #6]
	cmp r2, #0xe
	bhi _0801A470
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0801A498
	adds r0, r2, #1
	strh r0, [r1, #6]
	movs r0, #0
	strh r0, [r1, #4]
	b _0801A498
	.align 2, 0
_0801A46C: .4byte gCurTask
_0801A470:
	subs r0, #1
	strh r0, [r1, #2]
	b _0801A498
_0801A476:
	ldrh r2, [r1, #6]
	cmp r2, #0
	bne _0801A484
	adds r0, r3, #0
	bl TaskDestroy
	b _0801A4CA
_0801A484:
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0801A498
	subs r0, r2, #1
	strh r0, [r1, #6]
	strh r4, [r1, #4]
_0801A498:
	ldrh r1, [r1, #6]
	movs r0, #0xf
	ands r0, r1
	ldr r3, _0801A4D0 @ =gUnknown_030026D0
	lsls r1, r0, #0xc
	lsls r2, r0, #8
	orrs r1, r2
	lsls r2, r0, #4
	orrs r1, r2
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0801A4D4 @ =gBgCntRegs
	ldrh r0, [r1]
	movs r2, #0x40
	orrs r0, r2
	strh r0, [r1]
	ldrh r0, [r1, #2]
	orrs r0, r2
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	orrs r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r1, #6]
	orrs r2, r0
	strh r2, [r1, #6]
_0801A4CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A4D0: .4byte gUnknown_030026D0
_0801A4D4: .4byte gBgCntRegs

	thumb_func_start TaskDestructor_PlayerMPUnk2
TaskDestructor_PlayerMPUnk2: @ 0x0801A4D8
	push {r4, lr}
	ldr r0, _0801A50C @ =gUnknown_03005840
	movs r4, #0
	str r4, [r0]
	ldr r2, _0801A510 @ =gBgCntRegs
	ldrh r3, [r2]
	ldr r1, _0801A514 @ =0x0000FFBF
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2]
	ldrh r3, [r2, #2]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #2]
	ldrh r3, [r2, #4]
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	ands r1, r0
	strh r1, [r2, #6]
	ldr r0, _0801A518 @ =gUnknown_030026D0
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A50C: .4byte gUnknown_03005840
_0801A510: .4byte gBgCntRegs
_0801A514: .4byte 0x0000FFBF
_0801A518: .4byte gUnknown_030026D0
