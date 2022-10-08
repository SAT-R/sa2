.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"

.syntax unified
.arm

_entry:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _0203B038 @ =gUnknown_03007FA0
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _0203B034 @ =gUnknown_03007F00
	ldr r1, _0203B100 @ =gUnknown_03007FFC
	add r0, pc, #0x18 @ =sub_0203b03c
	str r0, [r1]
	ldr r1, _0203B104 @ =sub_0203b26c
	mov lr, pc
	bx r1
	b _entry
	.align 2, 0
_0203B034: .4byte gUnknown_03007F00
_0203B038: .4byte gUnknown_03007FA0

	arm_func_start sub_0203b03c
sub_0203b03c: @ 0x0203B03C
	mov r3, #0x4000000
	add r3, r3, #0x200
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #0x2000
_0203B054:
	bne _0203B054
	ands r0, r1, #0xc0
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #1
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #2
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #4
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #8
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x10
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x20
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x100
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x200
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x400
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x800
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x1000
	bne _0203B0EC
	add r2, r2, #4
	ands r0, r1, #0x2000
_0203B0EC:
	strh r0, [r3, #2]
	ldr r1, _0203B108 @ =gUnknown_03000000
	add r1, r1, r2
	ldr r0, [r1]
	bx r0
_0203B100: .4byte gUnknown_03007FFC
_0203B104: .4byte sub_0203b26c
_0203B108: .4byte gUnknown_03000000
