.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

	.global start_vector
start_vector:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _020001B8 @ =gUnknown_03007FA0
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _020001B4 @ =gUnknown_03007F00
	ldr r1, _02000280 @ =gUnknown_03007FFC
	add r0, pc, #0x18 @ =sub_020001BC
	str r0, [r1]
	ldr r1, _02000284 @ =sub_02001898
	mov lr, pc
	bx r1
	b start_vector
	.align 2, 0
_020001B4: .4byte gUnknown_03007F00
_020001B8: .4byte gUnknown_03007FA0

	arm_func_start sub_020001BC
sub_020001BC: @ 0x020001BC
	mov r3, #0x4000000
	add r3, r3, #0x200
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #0x2000
_020001D4:
	bne _020001D4
	ands r0, r1, #0xc0
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #1
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #2
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #4
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #8
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x10
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x20
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x100
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x200
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x400
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x800
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x1000
	bne _0200026C
	add r2, r2, #4
	ands r0, r1, #0x2000
_0200026C:
	strh r0, [r3, #2]
	ldr r1, _02000288 @ =gUnknown_03000790
	add r1, r1, r2
	ldr r0, [r1]
	bx r0
	.align 2, 0
_02000280: .4byte gUnknown_03007FFC
_02000284: .4byte sub_02001898
_02000288: .4byte gUnknown_03000790