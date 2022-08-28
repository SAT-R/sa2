.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_805D5C8
sub_805D5C8: @ 0x0805D5C8
	push {r4, lr}
	ldr r4, _0805D5FC @ =gCurTask
	ldr r0, [r4]
	ldrh r2, [r0, #6]
	ldr r0, _0805D600 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r1, r0
	ldr r3, _0805D604 @ =IWRAM_START + 0x31E
	adds r0, r2, r3
	movs r3, #0
	strb r1, [r0]
	ldr r0, _0805D608 @ =IWRAM_START + 0x31F
	adds r2, r2, r0
	strb r3, [r2]
	ldr r1, [r4]
	ldr r0, _0805D60C @ =sub_805D1F8
	str r0, [r1, #8]
	bl _call_via_r0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5FC: .4byte gCurTask
_0805D600: .4byte 0x04000128
_0805D604: .4byte IWRAM_START + 0x31E
_0805D608: .4byte IWRAM_START + 0x31F
_0805D60C: .4byte sub_805D1F8

	thumb_func_start sub_805D610
sub_805D610: @ 0x0805D610
	push {lr}
	ldr r0, _0805D638 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	ldr r2, _0805D63C @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0805D640 @ =gUnknown_030054D8
	ldrb r1, [r0]
	movs r0, #0
	movs r2, #0
	bl sub_80346C8
	pop {r0}
	bx r0
	.align 2, 0
_0805D638: .4byte gCurTask
_0805D63C: .4byte gFlags
_0805D640: .4byte gUnknown_030054D8

	thumb_func_start sub_805D644
sub_805D644: @ 0x0805D644
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #1
	ldr r7, _0805D688 @ =gUnknown_080D92B8
_0805D64E:
	ldr r0, _0805D68C @ =gUnknown_030055B8
	ldrb r0, [r0]
	asrs r0, r4
	ands r0, r5
	cmp r0, #0
	beq _0805D676
	lsls r2, r4, #1
	adds r2, r2, r4
	lsls r0, r2, #4
	adds r0, r6, r0
	adds r1, r4, #0
	ands r1, r5
	adds r1, r1, r7
	ldrb r1, [r1]
	strh r1, [r0, #0x16]
	lsls r2, r2, #3
	adds r2, #0x40
	strh r2, [r0, #0x18]
	bl sub_80051E8
_0805D676:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _0805D64E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D688: .4byte gUnknown_080D92B8
_0805D68C: .4byte gUnknown_030055B8
