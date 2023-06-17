.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

@ Unused?
	thumb_func_start sub_802B584
sub_802B584: @ 0x0802B584
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r4, _0802B5BC @ =gPlayerControls
	mov r3, sp
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	movs r1, #0
	ldr r7, _0802B5C0 @ =gLoadedSaveGame
	movs r5, #0x80
	lsls r5, r5, #1
	movs r6, #1
_0802B5A0:
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	lsls r1, r2, #1
	add r1, sp
	ldrh r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _0802B5DA
	cmp r1, #1
	bgt _0802B5C4
	cmp r1, #0
	beq _0802B5CA
	b _0802B5F6
	.align 2, 0
_0802B5BC: .4byte gPlayerControls
_0802B5C0: .4byte gLoadedSaveGame
_0802B5C4:
	cmp r1, #2
	beq _0802B5E8
	b _0802B5F6
_0802B5CA:
	cmp r2, #2
	bne _0802B5D2
	strh r5, [r4]
	b _0802B5F6
_0802B5D2:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4]
	b _0802B5F6
_0802B5DA:
	cmp r2, #2
	bne _0802B5E2
	strh r5, [r4, #2]
	b _0802B5F6
_0802B5E2:
	lsls r1, r2
	strh r1, [r4, #2]
	b _0802B5F6
_0802B5E8:
	cmp r2, #2
	bne _0802B5F0
	strh r5, [r4, #4]
	b _0802B5F6
_0802B5F0:
	adds r0, r6, #0
	lsls r0, r2
	strh r0, [r4, #4]
_0802B5F6:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	ble _0802B5A0
	ldr r1, [r7]
	ldrh r0, [r4]
	strh r0, [r1, #0x2c]
	ldrh r0, [r4, #2]
	strh r0, [r1, #0x2e]
	ldrh r0, [r4, #4]
	strh r0, [r1, #0x30]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_802B61C
sub_802B61C: @ 0x0802B61C
	ldr r3, _0802B628 @ =gPlayerControls
	strh r0, [r3]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_0802B628: .4byte gPlayerControls
