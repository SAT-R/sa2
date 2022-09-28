.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_02011950
sub_02011950: @ 0x02011950
	svc #0xa
	bx lr

	thumb_func_start sub_02011954
sub_02011954: @ 0x02011954
	svc #0xc
	bx lr

	thumb_func_start sub_02011958
sub_02011958: @ 0x02011958
	svc #0xb
	bx lr

	thumb_func_start sub_0201195c
sub_0201195c: @ 0x0201195C
	svc #6
	bx lr

	thumb_func_start sub_02011960
sub_02011960: @ 0x02011960
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_02011968
sub_02011968: @ 0x02011968
	svc #0x12
	bx lr

	thumb_func_start sub_0201196c
sub_0201196c: @ 0x0201196C
	svc #0x11
	bx lr

	thumb_func_start sub_02011970
sub_02011970: @ 0x02011970
	svc #0xf
	bx lr

	thumb_func_start sub_02011974
sub_02011974: @ 0x02011974
	svc #8
	bx lr

	thumb_func_start sub_02011978
sub_02011978: @ 0x02011978
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

	thumb_func_start sub_02011980
sub_02011980: @ 0x02011980
	ldr r3, _02011994 @ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r3, _02011998 @ =gUnknown_03007FFA
	movs r2, #0
	strb r2, [r3]
	subs r3, #0xfa
	mov sp, r3
	svc #1
	svc #0
	.align 2, 0
_02011994: .4byte 0x04000208
_02011998: .4byte gUnknown_03007FFA
