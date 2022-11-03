.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"

.syntax unified
.arm

	.set SOFT_RESET_DIRECT_BUF, 0x03007FFA

	thumb_func_start CpuSet
CpuSet: @ 0x0203C0C0
	svc #0xb
	bx lr

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x0203C0C4
	svc #0x11
	bx lr

	thumb_func_start RegisterRamReset
RegisterRamReset: @ 0x0203C0C8
	svc #1
	bx lr

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x0203C0CC
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

	thumb_func_start SoftResetRom
SoftResetRom: @ 0x0203C0D4
	ldr r3, =REG_IME
	movs r2, #0
	strb r2, [r3, #0]
	ldr r3, =SOFT_RESET_DIRECT_BUF
	movs r2, #0
	strb r2, [r3, #0]
	subs r3, #SOFT_RESET_DIRECT_BUF - 0x3007f00
	mov sp, r3
	svc #1
	svc #0
    .align 2, 0
