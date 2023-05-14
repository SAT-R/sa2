.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.syntax unified
.arm

_entry:
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
	b _entry

sp_sys: .word IWRAM_END - 0x100
sp_irq: .word IWRAM_END - 0x60

	arm_func_start IntrMain
IntrMain: @ 0x0203B03C
	mov r3, REG_BASE
	add r3, r3, #OFFSET_REG_IE
	ldr r2, [r3]
	and r1, r2, r2, lsr #16
	mov r2, #0
	ands r0, r1, #INTR_FLAG_GAMEPAK
    bne . @ spin
	ands r0, r1, #INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_VBLANK
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_HBLANK
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_VCOUNT
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_TIMER0
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_TIMER1
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_TIMER2
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_DMA0
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_DMA1
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_DMA2
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_DMA3
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_KEYPAD
	bne IntrMain_FoundIntr
	add r2, r2, #4
	ands r0, r1, #INTR_FLAG_GAMEPAK
IntrMain_FoundIntr:
	strh r0, [r3, #2]
	ldr r1, =gIntrTable
	add r1, r1, r2
	ldr r0, [r1]
	bx r0
