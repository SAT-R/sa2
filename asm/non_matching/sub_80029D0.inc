.include "asm/macros.inc"
.syntax unified
.text
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, _08002A18 @ =gTaskList
	ldr r4, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _08002A28
_080029E4:
	ldrh r0, [r4, #0x10]
	cmp r0, r2
	blo _08002A1C
_080029EA:
	cmp r0, r5
	bhs _08002A28
	adds r1, r4, #0
	ldrh r0, [r1, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r4, r0, r2
	ldr r2, _08002A18 @ =gTaskList
	ldr r0, [r2]
	cmp r1, r0
	beq _08002A0C
	ldr r0, [r2, #4]
	cmp r1, r0
	beq _08002A0C
	adds r0, r1, #0
	bl TaskDestroy
_08002A0C:
	movs r0, #0xc0
	lsls r0, r0, #0x12
	cmp r4, r0
	beq _08002A28
	ldrh r0, [r4, #0x10]
	b _080029EA
	.align 2, 0
_08002A18: .4byte gTaskList
_08002A1C:
	ldrh r0, [r4, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r4, r0, r1
	cmp r0, #0
	bne _080029E4
_08002A28:
	pop {r4, r5}
	pop {r0}
	bx r0
