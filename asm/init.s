.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	.align 2, 0

	thumb_func_start sub_801A684
sub_801A684: @ 0x0801A684
	push {lr}
	sub sp, #4
	ldr r0, _0801A6A4 @ =sub_801A6C8
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r1, _0801A6A8 @ =sub_801A6CC
	str r1, [sp]
	movs r1, #0
	movs r3, #0
	bl TaskCreate
	ldr r1, _0801A6AC @ =gUnknown_03005844
	str r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801A6A4: .4byte sub_801A6C8
_0801A6A8: .4byte sub_801A6CC
_0801A6AC: .4byte gUnknown_03005844

	thumb_func_start sub_801A6B0
sub_801A6B0: @ 0x0801A6B0
	push {r4, lr}
	ldr r4, _0801A6C4 @ =gUnknown_03005844
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A6C4: .4byte gUnknown_03005844

	thumb_func_start sub_801A6C8
sub_801A6C8: @ 0x0801A6C8
	bx lr
	.align 2, 0
