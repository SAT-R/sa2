.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start EwramInitHeap
EwramInitHeap: @ 0x08007B2C
	ldr r0, _08007B38 @ =gEwramHeap
	movs r1, #0
	str r1, [r0]
	ldr r1, _08007B3C @ =0x00020080
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_08007B38: .4byte gEwramHeap
_08007B3C: .4byte 0x00020080

	thumb_func_start EwramMalloc
EwramMalloc: @ 0x08007B40
	push {lr}
	adds r2, r0, #0
	adds r0, r2, #3
	lsrs r2, r0, #2
	cmp r2, #0
	beq _08007B96
	lsls r0, r2, #2
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _08007B68 @ =gEwramHeap
_08007B54:
	ldr r1, [r3, #4]
	cmp r2, r1
	bhi _08007B8C
	cmp r2, r1
	bne _08007B6C
	rsbs r0, r2, #0
	str r0, [r3, #4]
	adds r0, r3, #0
	adds r0, #8
	b _08007B9A
	.align 2, 0
_08007B68: .4byte gEwramHeap
_08007B6C:
	adds r0, r2, #0
	adds r0, #8
	cmp r0, r1
	bgt _08007B8C
	adds r1, r3, r2
	ldr r0, [r3]
	str r0, [r1]
	ldr r0, [r3, #4]
	subs r0, r0, r2
	str r0, [r1, #4]
	str r1, [r3]
	rsbs r0, r2, #0
	str r0, [r3, #4]
	adds r0, r3, #0
	adds r0, #8
	b _08007B9A
_08007B8C:
	ldr r0, [r3]
	cmp r0, #0
	beq _08007B96
	adds r3, r0, #0
	b _08007B54
_08007B96:
	ldr r0, _08007BA0 @ =gUnknown_020226D0
	ldr r0, [r0]
_08007B9A:
	pop {r1}
	bx r1
	.align 2, 0
_08007BA0: .4byte gUnknown_020226D0

	thumb_func_start EwramFree
EwramFree: @ 0x08007BA4
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08007C00
	ldr r0, _08007C08 @ =gUnknown_020226D0
	ldr r0, [r0]
	cmp r0, r1
	beq _08007C00
	subs r1, #8
	ldr r3, _08007C0C @ =gEwramHeap
	adds r4, r3, #0
	cmp r1, r3
	beq _08007BC6
_08007BBE:
	adds r3, r4, #0
	ldr r4, [r3]
	cmp r1, r4
	bne _08007BBE
_08007BC6:
	ldr r0, [r1, #4]
	cmp r0, #0
	bge _08007BD0
	rsbs r0, r0, #0
	str r0, [r1, #4]
_08007BD0:
	ldr r2, [r3, #4]
	adds r0, r3, r2
	cmp r0, r1
	bne _08007BE8
	cmp r2, #0
	ble _08007BE8
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, [r1, #4]
	adds r0, r2, r0
	str r0, [r3, #4]
	adds r1, r3, #0
_08007BE8:
	ldr r3, [r1, #4]
	adds r2, r1, r3
	ldr r0, [r1]
	cmp r2, r0
	bne _08007C00
	ldr r0, [r2, #4]
	cmp r0, #0
	ble _08007C00
	adds r0, r3, r0
	str r0, [r1, #4]
	ldr r0, [r2]
	str r0, [r1]
_08007C00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007C08: .4byte gUnknown_020226D0
_08007C0C: .4byte gEwramHeap
