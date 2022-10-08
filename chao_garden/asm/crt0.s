.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm
	
    .global start_vector
start_vector:
	mov r0, #PSR_IRQ_MODE
	msr cpsr_fc, r0
	ldr sp, sp_irq
	mov r0, #PSR_SYS_MODE
	msr cpsr_fc, r0
	ldr sp, sp_sys
	ldr r1, =INTR_VECTOR
	adr r0, IntrMain
	str r0, [r1]
	ldr r1, =AgbMain
	mov lr, pc
	bx r1
	b start_vector

sp_sys: .word IWRAM_END - 0x100
sp_irq: .word IWRAM_END - 0x60

	arm_func_start IntrMain
IntrMain: @ 0x0200005C
	mov ip, #REG_BASE
	add r3, ip, #OFFSET_REG_IE
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #INTR_FLAG_GAMEPAK
	strbne r0, [r3, #-0x17c]
    bne . @ spin
	ands r0, r1, #INTR_FLAG_SERIAL
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_VBLANK
	strhne r0, [ip, #-8]
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_TIMER2
	bne IntrMain_FoundIntr
	add r2, r2, #4
IntrMain_FoundIntr:
	strh r0, [r3, #2]
	ldr r1, =gIntrTable
	add r1, r1, r2
	ldr r0, [r1]
	bx r0

	.align 2, 0
