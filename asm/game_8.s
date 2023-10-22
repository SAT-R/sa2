.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

.if 0
.endif

	thumb_func_start sub_802F038
sub_802F038: @ 0x0802F038
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r0, _0802F068 @ =gBgOffsetsHBlank
	ldr r3, [r0]
	lsls r0, r1, #1
	adds r3, r3, r0
	cmp r1, r2
	bhs _0802F060
_0802F052:
	strh r4, [r3]
	adds r3, #2
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r2
	blo _0802F052
_0802F060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F068: .4byte gBgOffsetsHBlank

	thumb_func_start Task_802F06C
Task_802F06C: @ 0x0802F06C
	push {r4, r5, lr}
	ldr r5, _0802F0A0 @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl NextTransitionFrame
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _0802F098
	movs r0, #0x3c
	strh r0, [r4, #6]
	ldr r1, [r5]
	ldr r0, _0802F0A4 @ =Task_802ED98
	str r0, [r1, #8]
_0802F098:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F0A0: .4byte gCurTask
_0802F0A4: .4byte Task_802ED98
