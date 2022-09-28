.include "../asm/macros/function.inc"
.include "../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_020000c4
sub_020000c4: @ 0x020000C4
	push {lr}
	ldr r0, _020000DC @ =gUnknown_02000008
	ldr r1, [r0, #4]
	adds r2, r0, #0
	cmp r1, #4
	bhi _020000F8
	lsls r0, r1, #2
	ldr r1, _020000E0 @ =_020000E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_020000DC: .4byte gUnknown_02000008
_020000E0: .4byte _020000E4
_020000E4: @ jump table
	.4byte _020000F8 @ case 0
	.4byte _02000104 @ case 1
	.4byte _02000110 @ case 2
	.4byte _0200011C @ case 3
	.4byte _02000128 @ case 4
_020000F8:
	ldr r1, _02000100 @ =gUnknown_03003330
	movs r0, #0
	b _0200012C
	.align 2, 0
_02000100: .4byte gUnknown_03003330
_02000104:
	ldr r1, _0200010C @ =gUnknown_03003330
	movs r0, #1
	b _0200012C
	.align 2, 0
_0200010C: .4byte gUnknown_03003330
_02000110:
	ldr r1, _02000118 @ =gUnknown_03003330
	movs r0, #2
	b _0200012C
	.align 2, 0
_02000118: .4byte gUnknown_03003330
_0200011C:
	ldr r1, _02000124 @ =gUnknown_03003330
	movs r0, #3
	b _0200012C
	.align 2, 0
_02000124: .4byte gUnknown_03003330
_02000128:
	ldr r1, _02000164 @ =gUnknown_03003330
	movs r0, #4
_0200012C:
	strb r0, [r1, #0x10]
	ldr r0, [r2, #8]
	bl sub_02001528
	bl sub_0200019c
	bl sub_02000248
	bl sub_02000480
	bl sub_02000c6c
	bl sub_020018a0
	bl sub_0200be24
	bl sub_0200d27c
	ldr r1, _02000164 @ =gUnknown_03003330
	movs r0, #0
	strb r0, [r1, #0xf]
	movs r2, #0
	strh r0, [r1, #0xc]
	str r0, [r1, #8]
	strb r2, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
_02000164: .4byte gUnknown_03003330
