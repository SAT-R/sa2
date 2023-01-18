.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 1
	thumb_func_start sub_8077F18
sub_8077F18: @ 0x08077F18
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #8]
	ldr r1, _08077F70 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0xc]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08077F6A
	movs r1, #0
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08077F6A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #6
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _08077F6A
	movs r2, #2
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _08077F74
_08077F6A:
	movs r0, #1
	b _08077F76
	.align 2, 0
_08077F70: .4byte gCamera
_08077F74:
	movs r0, #0
_08077F76:
	pop {r4, r5}
	pop {r1}
	bx r1
    
.endif
