.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
	thumb_func_start StageBgUpdateZone7Acts12
StageBgUpdateZone7Acts12: @ 0x0801E26C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0     @ r3 = x
	adds r7, r1, #0     @ r7 = y
	ldr r0, _0801E2C0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r4, #0
	movs r2, #0
	ldr r5, _0801E2C4 @ =sZone7BgTransitionRegions
	lsls r1, r1, #4
	adds r0, r1, r5
	ldrh r0, [r0]
	cmp r3, r0
	blt _0801E2B2
	adds r6, r5, #0     @ r6 = sZone7BgTransitionRegions
	movs r5, #1         @ r5 = r5 = 1
_0801E298:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bhi _0801E2B2
	lsls r0, r2, #1
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r3, r0
	bge _0801E298
	adds r4, r5, #0
	ands r4, r2
_0801E2B2:
	cmp r4, #0
	bne _0801E2C8
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801D9D4
	b _0801E2D0
	.align 2, 0
_0801E2C0: .4byte gCurrentLevel
_0801E2C4: .4byte sZone7BgTransitionRegions
_0801E2C8:
	adds r0, r3, #0
	adds r1, r7, #0
	bl sub_801DD7C
_0801E2D0:
	ldr r0, _0801E2DC @ =gPlayer
	adds r0, #0xa8
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E2DC: .4byte gPlayer
.endif
