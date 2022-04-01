.include "asm/macros.inc"

.syntax unified
.arm

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
	ldr r3, _08097144 @ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _08097148 @ =gUnknown_03007F00
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_08097144: .4byte 0x04000208
_08097148: .4byte gUnknown_03007F00

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

	thumb_func_start SoftReset2
SoftReset2: @ 0x08097158
	ldr r3, _08097170 @ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r3, _08097174 @ =gUnknown_03007FFA
	movs r2, #1
	strb r2, [r3]
	subs r3, #0xfa
	mov sp, r3
	movs r2, #1
	bics r0, r2
	svc #1
	svc #0
	.align 2, 0
_08097170: .4byte 0x04000208
_08097174: .4byte gUnknown_03007FFA
