.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_80745B4
sub_80745B4: @ 0x080745B4
	push {lr}
	ldr r1, [r0]
	ldr r3, _080745F8 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #4]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x9c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _080745F2
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080745F2
	subs r1, #0x80
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080745FC
_080745F2:
	movs r0, #1
	b _080745FE
	.align 2, 0
_080745F8: .4byte gCamera
_080745FC:
	movs r0, #0
_080745FE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_8074604
sub_8074604: @ 0x08074604
	push {lr}
	adds r2, r0, #0
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r0]
	movs r3, #0xe4
	lsls r3, r3, #1
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08074628 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08074628: .4byte gCurTask
