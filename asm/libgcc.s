.include "asm/macros.inc"

.syntax unified
.arm

	.align 2, 0
	thumb_func_start _call_via_r0
_call_via_r0: @ 0x080971AC
	bx r0
	nop

	thumb_func_start _call_via_r1
_call_via_r1: @ 0x080971B0
	bx r1
	nop

	thumb_func_start _call_via_r2
_call_via_r2: @ 0x080971B4
	bx r2
	nop

	thumb_func_start _call_via_r3
_call_via_r3: @ 0x080971B8
	bx r3
	nop

	thumb_func_start _call_via_r4
_call_via_r4: @ 0x080971BC
	bx r4
	nop

	thumb_func_start _call_via_r5
_call_via_r5: @ 0x080971C0
	bx r5
	nop

	thumb_func_start _call_via_r6
_call_via_r6: @ 0x080971C4
	bx r6
	nop

	thumb_func_start _call_via_r7
_call_via_r7: @ 0x080971C8
	bx r7
	nop

	thumb_func_start _call_via_r8
_call_via_r8: @ 0x080971CC
	bx r8
	nop

	thumb_func_start _call_via_r9
_call_via_r9: @ 0x080971D0
	bx sb
	nop

	thumb_func_start _call_via_sl
_call_via_sl: @ 0x080971D4
	bx sl
	nop

	thumb_func_start _call_via_fp
_call_via_fp: @ 0x080971D8
	bx fp
	nop

	thumb_func_start _call_via_ip
_call_via_ip: @ 0x080971DC
	bx ip
	nop

	thumb_func_start _call_via_sp
_call_via_sp: @ 0x080971E0
	bx sp
	nop

	thumb_func_start _call_via_lr
_call_via_lr: @ 0x080971E4
	bx lr
	nop
