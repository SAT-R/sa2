.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	.set SOFT_RESET_DIRECT_BUF, 0x03007FFA
	.set RESET_EX_WRAM_FLAG,           0x1

	thumb_func_start ArcTan2
ArcTan2: @ 0x0809710C
	svc #0xa
	bx lr

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x08097110
	svc #0xc
	bx lr

	thumb_func_start CpuSet
CpuSet: @ 0x08097114
	svc #0xb
	bx lr

	thumb_func_start Div
Div: @ 0x08097118
	svc #6
	bx lr

	thumb_func_start DivRem
DivRem: @ 0x0809711C
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x08097124
	svc #0x11
	bx lr

	thumb_func_start MultiBoot
MultiBoot: @ 0x08097128
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

	thumb_func_start RLUnCompWram
RLUnCompWram: @ 0x08097130
	svc #0x14
	bx lr

	thumb_func_start SoftReset
SoftReset: @ 0x08097134
	ldr r3, _08097144 @ =REG_IME
	movs r2, #0
	strb r2, [r3]
	ldr r1, _08097148 @ =IWRAM_END - 0x100
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_08097144: .4byte REG_IME
_08097148: .4byte IWRAM_END - 0x100

	thumb_func_start Sqrt
Sqrt: @ 0x0809714C
	svc #8
	bx lr

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x08097150
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

	thumb_func_start SoftResetExram
SoftResetExram: @ 0x08097158
	ldr r3, =REG_IME
	movs r2, #0
	strb r2, [r3, #0]
	ldr r3, =SOFT_RESET_DIRECT_BUF
	movs r2, #1
	strb r2, [r3, #0]
	subs r3, #SOFT_RESET_DIRECT_BUF - 0x3007f00
	mov sp, r3
	movs r2, #RESET_EX_WRAM_FLAG
	bics r0, r2
	svc #1
	svc #0
	.align 2, 0
