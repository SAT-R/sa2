.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {lr}
	sub sp, #4
	ldr r0, _08039AB0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039AA8
	movs r0, #0
	ldr r1, _08039AB4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _08039AB8 @ =gUnknown_03002AE4
	ldr r0, _08039ABC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08039AC0 @ =gUnknown_03005390
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08039AC4 @ =gVramGraphicsCopyCursor
	ldr r0, _08039AC8 @ =gVramGraphicsCopyQueueIndex
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08039ACC @ =sub_8039AD4
	movs r1, #0
	str r1, [sp]
	ldr r2, _08039AD0 @ =0x00008888
	movs r3, #0
	bl TaskCreate
_08039AA8:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08039AB0: .4byte gPressedKeys
_08039AB4: .4byte 0x0000FFFF
_08039AB8: .4byte gUnknown_03002AE4
_08039ABC: .4byte gUnknown_0300287C
_08039AC0: .4byte gUnknown_03005390
_08039AC4: .4byte gVramGraphicsCopyCursor
_08039AC8: .4byte gVramGraphicsCopyQueueIndex
_08039ACC: .4byte sub_8039AD4
_08039AD0: .4byte 0x00008888

@; Start true area 53
	
.syntax divided
