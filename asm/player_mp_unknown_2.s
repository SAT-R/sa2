.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

	thumb_func_start sub_801A384
sub_801A384: @ 0x0801A384
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0801A3C0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801A418
	ldr r0, _0801A3C4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _0801A418
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0801A3AC
	ldr r0, _0801A3C8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A418
_0801A3AC:
	cmp r1, #0x1d
	beq _0801A418
	ldr r5, _0801A3CC @ =gUnknown_03005840
	ldr r4, [r5]
	cmp r4, #0
	beq _0801A3D0
	movs r0, #0x96
	lsls r0, r0, #2
	strh r0, [r4, #2]
	b _0801A418
	.align 2, 0
_0801A3C0: .4byte gGameMode
_0801A3C4: .4byte gCurrentLevel
_0801A3C8: .4byte gUnknown_030054B0
_0801A3CC: .4byte gUnknown_03005840
_0801A3D0:
	ldr r0, _0801A420 @ =sub_801A430
	movs r2, #0xe0
	lsls r2, r2, #8
	ldr r1, _0801A424 @ =sub_801A4D8
	str r1, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [r5]
	strh r4, [r0]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	ldr r0, _0801A428 @ =gUnknown_030026D0
	strh r4, [r0]
	ldr r1, _0801A42C @ =gBgCntRegs
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
_0801A418:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A420: .4byte sub_801A430
_0801A424: .4byte sub_801A4D8
_0801A428: .4byte gUnknown_030026D0
_0801A42C: .4byte gBgCntRegs

	thumb_func_start sub_801A430
sub_801A430: @ 0x0801A430
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

	thumb_func_start sub_801A4D8
sub_801A4D8: @ 0x0801A4D8
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
