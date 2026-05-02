.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	ldr r0, _0806E628 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0         @ r6 = proj
	ldr r0, [r6, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	strh r0, [r6, #0x16]
	ldr r0, _0806E62C @ =0x0300004C
	adds r5, r4, r0
	ldrh r0, [r5]
	adds r0, #0x28
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	strh r0, [r6, #0x18]
	ldrh r2, [r6, #0x18]
	str r2, [sp, #0x10]     @ sp10 = s->y
	ldrh r0, [r6, #0x16]
	str r0, [sp, #0xc]      @ sp0C = s->x
	movs r2, #0x16
	ldrsh r1, [r6, r2]
	mov sb, r1              @ sb = 
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0x10
	mov sl, r0
	asrs r7, r0, #0x10
	adds r0, r6, #0
	adds r2, r7, #0
	bl Coll_Player_Projectile
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	ldr r3, _0806E630 @ =gCamera
	ldrh r0, [r6, #0x16]
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldrh r2, [r6, #0x18]
	ldrh r1, [r3, #2]
	subs r2, r2, r1
	strh r2, [r6, #0x18]
	adds r0, #0x14
	lsls r0, r0, #0x10
	movs r1, #0x8a
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0806E61E
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x14
	cmp r0, #0
	blt _0806E61E
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0806E634
_0806E61E:
	ldr r0, _0806E628 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0806E782_return
	.align 2, 0
_0806E628: .4byte gCurTask
_0806E62C: .4byte 0x0300004C
_0806E630: .4byte gCamera
_0806E634:
	add r2, sp, #8
	str r2, [sp]
	ldr r0, _0806E794 @ =sa2__sub_801EE64
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, sb
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F07C
	mov sb, r0
	cmp r0, #0
	ble _0806E656
	mov r0, r8
	cmp r0, #0
	bne _0806E656
	b _0806E76A
_0806E656:
	mov r1, r8
	cmp r1, #0
	beq _0806E662
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1]
_0806E662:
	ldrh r1, [r5]
	ldr r2, [r6, #0x34]
	str r2, [sp, #0x14]
	movs r0, #0x2d
	strh r0, [r6, #0x30]
	movs r7, #0
	mov r0, sl
	str r0, [sp, #0x28]
	ldr r2, _0806E798 @ =0x0300004C
	adds r2, r4, r2
	str r2, [sp, #0x18] @ sp18 = unk4C
	ldr r0, _0806E79C @ =0x03000058
	adds r0, r4, r0
	str r0, [sp, #0x1c] @ sp1C = unk58
	ldr r2, _0806E7A0 @ =0x03000064
	adds r2, r4, r2
	str r2, [sp, #0x20] @ sp20 = unk64
	ldr r0, _0806E7A4 @ =0x03000034
	adds r0, r4, r0
	str r0, [sp, #0x38] @ sp38 = unk34
	ldr r2, _0806E7A8 @ =0x03000070
	adds r2, r4, r2
	str r2, [sp, #0x24] @ sp24 = unk70
	ldr r0, _0806E7AC @ =0x03000088
	adds r0, r4, r0
	str r0, [sp, #0x34] @ sp34 = unk88
	ldr r2, _0806E7B0 @ =0x03000021
	adds r2, r4, r2
	str r2, [sp, #0x30] @ sp30 = unk21
	ldr r0, _0806E7B4 @ =0x03000020
	adds r0, r4, r0
	str r0, [sp, #0x2c] @ sp2C = unk20
	ldr r2, _0806E7B8 @ =gSineTable
	mov sl, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
_0806E6AC:
	mov r0, r8
	lsls r4, r0, #2
	add r4, r8
	lsls r4, r4, #1
	ldr r2, _0806E7BC @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _0806E7C0 @ =0x00196225
	muls r0, r1, r0
	ldr r1, _0806E7C4 @ =0x3C6EF35F
	adds r0, r0, r1
	str r0, [r2]
	movs r1, #4
	bl Mod
	adds r1, r0, #0
	adds r1, #0x10
	rsbs r0, r4, #0
	bl Div
	lsls r4, r7, #1
	ldr r2, [sp, #0x18]
	adds r5, r2, r4     @ r5 = &proj->unk4C
	add r1, sp, #8
	ldrb r1, [r1]
	lsls r1, r1, #2
	movs r2, #0x7f
	ands r1, r2
	adds r2, #0x81
	adds r1, r1, r2
	lsls r1, r1, #1
	add r1, sl
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r0, r1, r0
	ldr r1, _0806E7C8 @ =0x00004E20
	bl __divsi3
	strh r0, [r5]
	ldr r1, [sp, #0x1c]
	adds r0, r1, r4
	mov r2, sp
	ldrh r2, [r2, #0xc]
	strh r2, [r0]
	ldr r0, [sp, #0x20]
	adds r4, r0, r4
	ldr r1, [sp, #0x28]
	asrs r0, r1, #0x10
	add r0, sb
	strh r0, [r4]
	lsls r4, r7, #2
	ldr r2, [sp, #0x38]
	adds r0, r2, r4
	ldr r1, [sp, #0x14]
	str r1, [r0]
	add r1, sp, #8
	lsls r0, r7, #3
	subs r0, #0x18
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0806E7CC @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #1
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0x1e
	bl Div
	ldr r1, [sp, #0x24]
	adds r4, r1, r4
	str r0, [r4]
	ldr r2, [sp, #0x34]
	adds r1, r2, r7
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #5
	bls _0806E6AC
	movs r0, #0xff
	ldr r1, [sp, #0x30]
	strb r0, [r1]
	ldr r0, _0806E7D0 @ =0x06012680
	str r0, [r6, #4]
	movs r1, #0
	ldr r0, _0806E7D4 @ =0x000001A5
	strh r0, [r6, #0xa]
	ldr r2, [sp, #0x2c]
	strb r1, [r2]
	ldr r0, _0806E7D8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0806E7DC @ =sub_806E7E0
	str r0, [r1, #8]
_0806E76A:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r6, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x10]
	strh r1, [r6, #0x18]
_0806E782_return:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E794: .4byte sa2__sub_801EE64
_0806E798: .4byte 0x0300004C
_0806E79C: .4byte 0x03000058
_0806E7A0: .4byte 0x03000064
_0806E7A4: .4byte 0x03000034
_0806E7A8: .4byte 0x03000070
_0806E7AC: .4byte 0x03000088
_0806E7B0: .4byte 0x03000021
_0806E7B4: .4byte 0x03000020
_0806E7B8: .4byte gSineTable
_0806E7BC: .4byte gPseudoRandom
_0806E7C0: .4byte 0x00196225
_0806E7C4: .4byte 0x3C6EF35F
_0806E7C8: .4byte 0x00004E20
_0806E7CC: .4byte 0x000003FF
_0806E7D0: .4byte 0x06012680
_0806E7D4: .4byte 0x000001A5
_0806E7D8: .4byte gCurTask
_0806E7DC: .4byte sub_806E7E0

.syntax divided
