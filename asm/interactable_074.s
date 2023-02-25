.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Task_Interactable074
Task_Interactable074: @ 0x0807A1A8
	push {r4, r5, lr}
	ldr r0, _0807A1D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_807A104
	cmp r0, #0
	beq _0807A1C6
	adds r0, r4, #0
	bl sub_807A218
_0807A1C6:
	adds r0, r4, #0
	bl sub_807A094
	cmp r0, #0
	beq _0807A1DC
	adds r0, r4, #0
	bl sub_807A314
	b _0807A1F8
	.align 2, 0
_0807A1D8: .4byte gCurTask
_0807A1DC:
	adds r0, r4, #0
	bl sub_807A25C
	adds r0, r4, #0
	bl sub_807A2D0
	ldr r1, _0807A200 @ =IWRAM_START + 0x69
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A1F8
	adds r0, r4, #0
	bl sub_807A2AC
_0807A1F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A200: .4byte IWRAM_START + 0x69

	thumb_func_start TaskDestructor_Interactable074
TaskDestructor_Interactable074: @ 0x0807A204
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x70]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807A218
sub_807A218: @ 0x0807A218
	ldr r1, _0807A22C @ =gPlayer
	adds r1, #0x38
	ldrb r1, [r1]
	adds r0, #0x6a
	strb r1, [r0]
	ldr r0, _0807A230 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A234 @ =sub_8079EF8
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807A22C: .4byte gPlayer
_0807A230: .4byte gCurTask
_0807A234: .4byte sub_8079EF8

	thumb_func_start sub_807A238
sub_807A238: @ 0x0807A238
	ldr r1, _0807A250 @ =gPlayer
	adds r1, #0x38
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0807A254 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807A258 @ =Task_Interactable074
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807A250: .4byte gPlayer
_0807A254: .4byte gCurTask
_0807A258: .4byte Task_Interactable074

	thumb_func_start sub_807A25C
sub_807A25C: @ 0x0807A25C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0807A294 @ =gUnknown_03005590
	adds r0, #0x6c
	ldrb r1, [r0]
	ldr r0, [r2]
	adds r0, r0, r1
	ldr r3, _0807A298 @ =gUnknown_080E0064
	adds r1, r5, #0
	adds r1, #0x68
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r2, r1, r3
	ldrh r4, [r2]
	adds r3, #2
	adds r1, r1, r3
	ldrh r1, [r1]
	adds r1, r4, r1
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bhs _0807A29C
	adds r1, r5, #0
	adds r1, #0x69
	movs r0, #1
	b _0807A2A2
	.align 2, 0
_0807A294: .4byte gUnknown_03005590
_0807A298: .4byte gUnknown_080E0064
_0807A29C:
	adds r1, r5, #0
	adds r1, #0x69
	movs r0, #0
_0807A2A2:
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807A2AC
sub_807A2AC: @ 0x0807A2AC
	push {lr}
	adds r1, r0, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A2BE
	cmp r0, #1
	beq _0807A2C6
	b _0807A2CC
_0807A2BE:
	adds r0, r1, #0
	bl sub_8079F7C
	b _0807A2CC
_0807A2C6:
	adds r0, r1, #0
	bl sub_807A008
_0807A2CC:
	pop {r0}
	bx r0

	thumb_func_start sub_807A2D0
sub_807A2D0: @ 0x0807A2D0
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r1, #0x69
	ldrb r5, [r1]
	cmp r5, #0
	beq _0807A2F8
	adds r4, r0, #0
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807A30A
	ldr r0, _0807A2F4 @ =0x00000127
	bl m4aSongNumStart
	movs r0, #1
	strb r0, [r4]
	b _0807A30A
	.align 2, 0
_0807A2F4: .4byte 0x00000127
_0807A2F8:
	adds r4, r0, #0
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	beq _0807A30A
	ldr r0, _0807A310 @ =0x00000127
	bl m4aSongNumStop
	strb r5, [r4]
_0807A30A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A310: .4byte 0x00000127

	thumb_func_start sub_807A314
sub_807A314: @ 0x0807A314
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807A334 @ =0x00000127
	bl m4aSongNumStop
	ldr r1, [r4, #0x74]
	adds r4, #0x78
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r0, _0807A338 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A334: .4byte 0x00000127
_0807A338: .4byte gCurTask
