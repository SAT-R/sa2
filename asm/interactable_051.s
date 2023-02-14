.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata    
    .global gUnknown_080D9518
gUnknown_080D9518:
    .incbin "baserom.gba", 0x000D9518, 0x28

.section .text
.syntax unified
.arm

	thumb_func_start TaskDestructor_80636F0
TaskDestructor_80636F0: @ 0x080636F0
	push {r4, r5, lr}
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #0x7c]
	bl VramFree
	ldr r1, _08063728 @ =IWRAM_START + 0xB8
	adds r0, r5, r1
	ldr r0, [r0]
	bl VramFree
	ldr r0, _0806372C @ =IWRAM_START + 0xF4
	adds r5, r5, r0
	ldr r0, [r5]
	bl VramFree
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063728: .4byte IWRAM_START + 0xB8
_0806372C: .4byte IWRAM_START + 0xF4
