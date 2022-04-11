.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_801A51C
sub_801A51C: @ 0x0801A51C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r1, _0801A5D0 @ =gUnknown_03002260
	ldr r0, _0801A5D4 @ =gUnknown_080D5CE4
	str r0, [r1]
	ldr r1, _0801A5D8 @ =gUnknown_03002794
	ldr r0, _0801A5DC @ =gUnknown_080F40D4
	str r0, [r1]
	ldr r1, _0801A5E0 @ =gUnknown_03004D54
	ldr r0, _0801A5E4 @ =gUnknown_03001B60
	str r0, [r1]
	ldr r1, _0801A5E8 @ =gUnknown_030022C0
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r0, r2
	str r0, [r1]
	ldr r1, _0801A5EC @ =gUnknown_03005424
	ldr r0, _0801A5F0 @ =gUnknown_0300544C
	movs r2, #0
	strh r4, [r0]
	strh r4, [r1]
	ldr r0, _0801A5F4 @ =gUnknown_030059D8
	str r4, [r0]
	ldr r0, _0801A5F8 @ =gUnknown_03005844
	str r4, [r0]
	ldr r0, _0801A5FC @ =gUnknown_03005848
	str r4, [r0]
	ldr r0, _0801A600 @ =gUnknown_030059E0
	adds r0, #0x8c
	str r4, [r0]
	ldr r0, _0801A604 @ =gUnknown_03005960
	str r4, [r0, #0x5c]
	ldr r0, _0801A608 @ =gUnknown_030059D0
	str r4, [r0, #4]
	ldr r0, _0801A60C @ =gUnknown_03005660
	str r4, [r0, #0x10]
	ldr r0, _0801A610 @ =gUnknown_0300543C
	strb r2, [r0]
	ldr r0, _0801A614 @ =gUnknown_030054CC
	strb r2, [r0]
	ldr r0, _0801A618 @ =gUnknown_030054DC
	str r4, [r0]
	ldr r0, _0801A61C @ =gUnknown_03005B34
	strb r2, [r0]
	ldr r0, _0801A620 @ =gUnknown_030054C8
	strb r2, [r0]
	ldr r0, _0801A624 @ =gUnknown_030054E4
	strb r2, [r0]
	movs r1, #0
	movs r0, #0
	ldr r2, _0801A628 @ =gUnknown_030055A0
_0801A582:
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #3
	bls _0801A582
	movs r1, #0
	ldr r6, _0801A62C @ =gUnknown_03005500
	movs r2, #0
	ldr r5, _0801A630 @ =gUnknown_030054B4
	ldr r3, _0801A634 @ =gUnknown_030054D4
_0801A594:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	bls _0801A594
	bl sub_80723C4
	bl sub_807241C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0801A5BA
	bl sub_8072474
	movs r4, #1
_0801A5BA:
	ldr r5, _0801A638 @ =gUnknown_03001840
	ldr r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A63C
	bl sub_8081C0C
	b _0801A67C
	.align 2, 0
_0801A5D0: .4byte gUnknown_03002260
_0801A5D4: .4byte gUnknown_080D5CE4
_0801A5D8: .4byte gUnknown_03002794
_0801A5DC: .4byte gUnknown_080F40D4
_0801A5E0: .4byte gUnknown_03004D54
_0801A5E4: .4byte gUnknown_03001B60
_0801A5E8: .4byte gUnknown_030022C0
_0801A5EC: .4byte gUnknown_03005424
_0801A5F0: .4byte gUnknown_0300544C
_0801A5F4: .4byte gUnknown_030059D8
_0801A5F8: .4byte gUnknown_03005844
_0801A5FC: .4byte gUnknown_03005848
_0801A600: .4byte gUnknown_030059E0
_0801A604: .4byte gUnknown_03005960
_0801A608: .4byte gUnknown_030059D0
_0801A60C: .4byte gUnknown_03005660
_0801A610: .4byte gUnknown_0300543C
_0801A614: .4byte gUnknown_030054CC
_0801A618: .4byte gUnknown_030054DC
_0801A61C: .4byte gUnknown_03005B34
_0801A620: .4byte gUnknown_030054C8
_0801A624: .4byte gUnknown_030054E4
_0801A628: .4byte gUnknown_030055A0
_0801A62C: .4byte gUnknown_03005500
_0801A630: .4byte gUnknown_030054B4
_0801A634: .4byte gUnknown_030054D4
_0801A638: .4byte gUnknown_03001840
_0801A63C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801A650
	bl sub_808B3FC
	bl sub_80724C0
	b _0801A67C
_0801A650:
	cmp r4, #0
	bne _0801A65A
	bl sub_8063940
	b _0801A67C
_0801A65A:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r1, r0
	cmp r1, #0
	beq _0801A678
	bl sub_808D41C
	ldr r0, [r5]
	ldr r1, _0801A674 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r5]
	b _0801A67C
	.align 2, 0
_0801A674: .4byte 0xFFFFEFFF
_0801A678:
	bl sub_808B3FC
_0801A67C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
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
