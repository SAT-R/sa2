.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_8080368
initSprite_8080368: @ 0x08080368
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080803F4 @ =Task_80806F4
	ldr r2, _080803F8 @ =0x00002010
	movs r5, #0
	str r5, [sp]
	movs r1, #0x24
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	str r5, [r2, #0x14]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	str r5, [r2, #0x1c]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080803F4: .4byte Task_80806F4
_080803F8: .4byte 0x00002010

.if 0
.endif
