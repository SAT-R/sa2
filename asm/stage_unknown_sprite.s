.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0

	thumb_func_start sub_800A5F8
sub_800A5F8: @ 0x0800A5F8
	push {r4, r5, r6, lr}
	ldr r6, _0800A67C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0         @ r5 = su
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3e]
	ldrh r1, [r5, #0x3a]
	adds r0, r0, r1
	strh r0, [r5, #0x3a]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x30]
	adds r0, r0, r1
	str r0, [r5, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r5, r1]
	ldr r1, [r5, #0x34]
	adds r1, r1, r2
	str r1, [r5, #0x34]
	asrs r0, r0, #8
	ldr r3, _0800A680 @ =gCamera
	ldr r2, [r3]
	subs r0, r0, r2
	strh r0, [r5, #0x16]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r0, _0800A684 @ =IWRAM_START + 0x40
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800A64A
	subs r0, #1
	strh r0, [r4]
_0800A64A:
	ldrh r0, [r5, #0x16]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800A672
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	subs r0, #0x20
	cmp r0, #0xa0
	bgt _0800A672

	adds r0, r5, #0
	bl sub_8004558

	cmp r0, #0
	bne _0800A688
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800A688
_0800A672:
	ldr r0, [r6]
	bl TaskDestroy
	b _0800A68E
	.align 2, 0
_0800A67C: .4byte gCurTask
_0800A680: .4byte gCamera
_0800A684: .4byte IWRAM_START + 0x40
_0800A688:
	adds r0, r5, #0
	bl sub_80051E8
_0800A68E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800A694
sub_800A694: @ 0x0800A694
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
.endif
