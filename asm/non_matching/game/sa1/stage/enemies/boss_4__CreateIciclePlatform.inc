.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4]
	ldr r0, _08031A84 @ =sub_8031AB4
	movs r2, #0x88
	lsls r2, r2, #6
	movs r6, #0
	str r6, [sp]
	movs r1, #0x68
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	ldrb r1, [r4, #8]
	lsls r1, r1, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r7, _08031A88 @ =0x03000044
	adds r0, r3, r7
	movs r7, #0
	mov sl, r7
	strh r1, [r0]
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r4, _08031A8C @ =0x03000046
	adds r0, r3, r4
	strh r1, [r0]
	ldr r7, _08031A90 @ =gPseudoRandom
	mov r8, r7
	mov r1, r8
	ldr r0, [r1]
	ldr r5, _08031A94 @ =0x00196225
	adds r1, r0, #0
	muls r1, r5, r1
	ldr r4, _08031A98 @ =0x3C6EF35F
	adds r1, r1, r4
	str r1, [r7]
	lsrs r7, r1, #1
	movs r0, #0xf
	mov sb, r0
	ands r7, r0
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #2
	rsbs r0, r0, #0
	subs r0, #0xa
	lsls r0, r0, #8
	str r0, [r2, #0x4c]
	ldr r0, _08031A9C @ =0xFFFFE000
	str r0, [r2, #0x50]
	str r6, [r2, #0x54]
	movs r0, #0xa
	str r0, [r2, #0x58]
	adds r0, r1, #0
	muls r0, r5, r0
	adds r0, r0, r4
	muls r0, r5, r0
	adds r0, r0, r4
	mov r1, r8
	str r0, [r1]
	mov r4, sb
	ands r0, r4
	adds r0, #0xa
	str r0, [r2, #0x58]
	strh r6, [r2, #0x16]
	strh r6, [r2, #0x18]
	ldr r0, _08031AA0 @ =0x06012720
	str r0, [r2, #4]
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r2, #0x1a]
	strh r6, [r2, #8]
	ldr r0, _08031AA4 @ =0x00000276
	strh r0, [r2, #0xa]
	ldr r7, _08031AA8 @ =0x03000020
	adds r0, r3, r7
	mov r1, sl
	strb r1, [r0]
	strh r6, [r2, #0x14]
	strh r6, [r2, #0x1c]
	ldr r4, _08031AAC @ =0x03000021
	adds r1, r3, r4
	movs r0, #0xff
	strb r0, [r1]
	adds r7, #2
	adds r1, r3, r7
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08031AB0 @ =0x03000025
	adds r3, r3, r0
	mov r1, sl
	strb r1, [r3]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031A84: .4byte sub_8031AB4
_08031A88: .4byte 0x03000044
_08031A8C: .4byte 0x03000046
_08031A90: .4byte gPseudoRandom
_08031A94: .4byte 0x00196225
_08031A98: .4byte 0x3C6EF35F
_08031A9C: .4byte 0xFFFFE000
_08031AA0: .4byte 0x06012720
_08031AA4: .4byte 0x00000276
_08031AA8: .4byte 0x03000020
_08031AAC: .4byte 0x03000021
_08031AB0: .4byte 0x03000025

.syntax divided
