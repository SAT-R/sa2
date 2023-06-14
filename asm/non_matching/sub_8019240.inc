.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080192A4 @ =gEntitiesManagerTask
	ldr r0, [r0]
	cmp r0, #0
	beq _0801929E
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r3, [r0]        @ r3 = ias
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, #4
	ldrb r2, [r4, #0xf]
	ldrb r1, [r4, #0x10]
	muls r0, r1, r0
	lsls r2, r2, #2
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r2, r2, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _0801929E
	subs r0, #8
	adds r2, r3, r0     @ r2 = cursor
	ldrb r1, [r4, #0x11]
	lsls r0, r1, #3
	subs r0, r0, r1
	adds r2, r2, r0
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08019296
	cmp r0, #1
	bne _0801929E
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0801929E
_08019296:
	movs r1, #3
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
_0801929E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080192A4: .4byte gEntitiesManagerTask

.syntax divided
