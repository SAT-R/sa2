.include "asm/macros.inc"
.syntax unified
.arm

Init: @ 0x08000000
	b start_vector
	.include "asm/rom_header.inc"

start_vector:
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _080000F8 @ =gUnknown_03007FA0
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _080000F4 @ =gUnknown_03007F00
	ldr r1, _080001C0 @ =gUnknown_03007FFC
	add r0, pc, #0x18 @ =intr_main
	str r0, [r1]
	ldr r1, _080001C4 @ =AgbMain
	mov lr, pc
	bx r1
_080000F0:
	.byte 0xF2, 0xFF, 0xFF, 0xEA
_080000F4: .4byte gUnknown_03007F00
_080000F8: .4byte gUnknown_03007FA0

	arm_func_start intr_main
intr_main: @ 0x080000FC
	mov r3, #0x4000000
	add r3, r3, #0x200
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #0x2000
_08000114:
	bne _08000114
	ands r0, r1, #0xc0
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #1
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #2
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #4
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #8
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x10
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x20
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x100
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x200
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x400
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x800
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x1000
	bne _080001AC
	add r2, r2, #4
	ands r0, r1, #0x2000
_080001AC:
	strh r0, [r3, #2]
	ldr r1, _080001C8 @ =gIntrTable
	add r1, r1, r2
	ldr r0, [r1]
	bx r0
	.align 2, 0
_080001C0: .4byte gUnknown_03007FFC
_080001C4: .4byte AgbMain
_080001C8: .4byte gIntrTable
