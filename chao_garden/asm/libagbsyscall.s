.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	.set SOFT_RESET_DIRECT_BUF, 0x03007FFA

	thumb_func_start ArcTan2
ArcTan2: @ 0x02011950
	svc #0xa
	bx lr

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x02011954
	svc #0xc
	bx lr

	thumb_func_start CpuSet
CpuSet: @ 0x02011958
	svc #0xb
	bx lr

	thumb_func_start Div
Div: @ 0x0201195C
	svc #6
	bx lr

	thumb_func_start Mod
Mod: @ 0x02011960
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 0x02011968
	svc #0x12
	bx lr

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x0201196C
	svc #0x11
	bx lr

	thumb_func_start ObjAffineSet
ObjAffineSet: @ 0x02011970
	svc #0xf
	bx lr

	thumb_func_start Sqrt
Sqrt: @ 0x02011974
	svc #8
	bx lr

	thumb_func_start VBlankIntrWait
VBlankIntrWait: @ 0x02011978
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

	thumb_func_start SoftResetRom
SoftResetRom:
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
