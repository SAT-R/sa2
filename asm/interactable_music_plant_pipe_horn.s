.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

    @ Also used for Horn
	thumb_func_start Handler_MusicPlant_Pipe_0
Handler_MusicPlant_Pipe_0: @ 0x08076F0C
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0, #6]
	movs r3, #4
	ldrsh r0, [r0, r3]
	ldr r3, [r2, #8]
	mov ip, r3
	rsbs r7, r0, #0
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	muls r0, r7, r0
	asrs r0, r0, #0xa
	mov r3, ip
	subs r0, r3, r0
	str r0, [r2, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r6, [r2, #0xc]
	rsbs r5, r1, #0
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	muls r0, r5, r0
	asrs r0, r0, #0xa
	subs r0, r6, r0
	str r0, [r2, #0x14]
	ldrh r0, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	ldrh r1, [r2, #0x1a]
	adds r3, r0, r1
	strh r3, [r2, #0x1a]
	lsls r1, r3, #0x10
	ldr r0, _08076F8C @ =0x3FF0000
	cmp r1, r0
	bls _08076F84
	ldr r1, _08076F90 @ =0xFFFFFC00
	adds r0, r3, r1
	strh r0, [r2, #0x1a]
	mov r3, ip
	subs r0, r3, r7
	str r0, [r2, #8]
	subs r0, r6, r5
	str r0, [r2, #0xc]
	ldrh r0, [r2, #0x18]
	adds r3, r0, #1
	strh r3, [r2, #0x18]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r0, _08076F94 @ =0x0000FFFF
	cmp r1, r0
	bne _08076F84
	orrs r3, r1
	strh r3, [r2, #0x18]
_08076F84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076F8C: .4byte 0x3FF0000
_08076F90: .4byte 0xFFFFFC00
_08076F94: .4byte 0x0000FFFF
