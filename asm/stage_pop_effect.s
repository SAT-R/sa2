.include "asm/macros.inc"
.include "constants/constants.inc"

.arm
.syntax unified
.text

	thumb_func_start sub_800B9B8
sub_800B9B8: @ 0x0800B9B8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0800BA3C @ =sub_800BA58
	movs r1, #0x80
	lsls r1, r1, #6
	mov sb, r1
	movs r6, #0
	str r6, [sp]
	movs r1, #0x30
	mov r2, sb
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r2, r1
	movs r3, #0
	mov r8, r3
	strh r4, [r1, #0x16]
	strh r5, [r1, #0x18]
	ldr r0, _0800BA40 @ =0x06011000
	str r0, [r1, #4]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r1, #0x1a]
	strh r6, [r1, #8]
	ldr r0, _0800BA44 @ =0x000001DD
	strh r0, [r1, #0xa]
	ldr r3, _0800BA48 @ =IWRAM_START + 0x20
	adds r0, r2, r3
	mov r3, r8
	strb r3, [r0]
	strh r6, [r1, #0x14]
	strh r6, [r1, #0x1c]
	ldr r0, _0800BA4C @ =IWRAM_START + 0x21
	adds r3, r2, r0
	movs r0, #0xff
	strb r0, [r3]
	ldr r0, _0800BA50 @ =IWRAM_START + 0x22
	adds r3, r2, r0
	movs r0, #0x10
	strb r0, [r3]
	ldr r3, _0800BA54 @ =IWRAM_START + 0x25
	adds r2, r2, r3
	mov r0, r8
	strb r0, [r2]
	mov r3, sb
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA3C: .4byte sub_800BA58
_0800BA40: .4byte 0x06011000
_0800BA44: .4byte 0x000001DD
_0800BA48: .4byte IWRAM_START + 0x20
_0800BA4C: .4byte IWRAM_START + 0x21
_0800BA50: .4byte IWRAM_START + 0x22
_0800BA54: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800BA58
sub_800BA58: @ 0x0800BA58
	push {r4, r5, r6, r7, lr}
	ldr r7, _0800BAA4 @ =gCurTask
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldrh r0, [r4, #0x16]
	adds r5, r0, #0
	ldrh r6, [r4, #0x18]
	ldr r1, _0800BAA8 @ =gCamera
	ldr r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x16]
	ldr r1, [r1, #4]
	ldrh r0, [r4, #0x18]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800BA92
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r7]
	bl TaskDestroy
_0800BA92:
	adds r0, r4, #0
	bl sub_80051E8
	strh r5, [r4, #0x16]
	strh r6, [r4, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAA4: .4byte gCurTask
_0800BAA8: .4byte gCamera
