.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

    .global gPlayerCharacterIdleAnims
gPlayerCharacterIdleAnims: @ 0x080D672C
    .2byte 0, 91, 182, 273, 364

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start DestroyRingsScatterTask
DestroyRingsScatterTask: @ 0x08021350
	push {r4, lr}
	ldr r4, _08021364 @ =gRingsScatterTask
	ldr r0, [r4]
	bl TaskDestroy
	movs r0, #0
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021364: .4byte gRingsScatterTask

	thumb_func_start Task_RingsScatter_Singleplayer
Task_RingsScatter_Singleplayer: @ 0x08021368
	push {lr}
	ldr r0, _0802137C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08021380
	bl RingsScatterSingleplayer_FlippedGravity
	b _08021384
	.align 2, 0
_0802137C: .4byte gUnknown_03005424
_08021380:
	bl RingsScatterSingleplayer_NormalGravity
_08021384:
	pop {r0}
	bx r0

	thumb_func_start Task_RingsScatter_MP_Multipak
Task_RingsScatter_MP_Multipak: @ 0x08021388
	push {lr}
	ldr r0, _0802139C @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080213A0
	bl RingsScatterMultipak_FlippedGravity
	b _080213A4
	.align 2, 0
_0802139C: .4byte gUnknown_03005424
_080213A0:
	bl RingsScatterMultipak_NormalGravity
_080213A4:
	pop {r0}
	bx r0

	thumb_func_start Task_RingsScatter_MP_Singlepak
Task_RingsScatter_MP_Singlepak: @ 0x080213A8
	push {lr}
	bl RingsScatterSinglepakMain
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_RingsScatter
TaskDestructor_RingsScatter: @ 0x080213B4
	ldr r1, _080213BC @ =gRingsScatterTask
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080213BC: .4byte gRingsScatterTask
