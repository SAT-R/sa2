.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start TaskDestructor_8080EF8
TaskDestructor_8080EF8: @ 0x08080EF8
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r2, _08080F24 @ =gUnknown_080E0140
	adds r1, #0x48
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0
	beq _08080F20
	ldr r0, [r3, #4]
	bl VramFree
_08080F20:
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_080E0140
