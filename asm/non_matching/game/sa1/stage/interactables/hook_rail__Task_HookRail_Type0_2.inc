.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08086E04 @ =gCurTask
	ldr r0, [r1]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r6, r0
	ldr r2, _08086E08 @ =0x0300000C
	adds r7, r6, r2
	ldr r3, [r4]
	str r3, [sp]
	ldrb r0, [r4, #8]
	lsls r0, r0, #3
	ldrh r1, [r4, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, [sp]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldrh r1, [r4, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov sb, r2
	ldr r5, _08086E0C @ =gPlayer
	ldr r0, [r5, #0x10]
	mov r8, r0
	movs r0, #0x80
	mov r1, r8
	ands r1, r0
	mov r8, r1
	cmp r1, #0
	beq _08086D14
	b _08086F10
_08086D14:
	movs r0, #0x40
	adds r0, r0, r5
	mov sb, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x26
	beq _08086D38
	adds r0, r5, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0x26
	mov r1, sb
	strb r0, [r1]
	ldr r3, [sp, #8]
	ldr r2, [sp, #4]
_08086D38:
	mov r0, r8
	strh r0, [r5, #0xa]
	ldr r1, _08086E10 @ =0x03000050
	adds r6, r6, r1
	ldrb r0, [r6]
	cmp r0, #0
	beq _08086E28
	ldr r0, [r4, #0x40]
	adds r0, #0x14
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x4c]
	adds r1, r1, r0
	str r1, [r4, #0x4c]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	ldr r3, _08086E14 @ =0xFFFFFA00
	adds r0, r0, r3
	adds r0, r0, r1
	str r0, [r5]
	lsls r0, r2, #0x10
	asrs r6, r0, #0x10
	movs r0, #0x8a
	lsls r0, r0, #1
	adds r1, r6, r0
	lsls r1, r1, #8
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #1
	adds r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #9
	adds r0, r6, r0
	ldr r1, _08086E18 @ =gCamera
	mov sl, r1
	ldrh r1, [r1, #2]
	subs r0, r0, r1
	adds r0, #0xf0
	strh r0, [r7, #0x18]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #8
	cmp r0, #2
	ble _08086E7E
	movs r0, #0xb4
	bl m4aSongNumStop
	adds r0, r5, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r0, [r5, #0x10]
	ldr r1, _08086E1C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	movs r0, #4
	mov r2, sb
	strb r0, [r2]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	ldr r3, _08086E04 @ =gCurTask
	ldr r1, [r3]
	ldr r0, _08086E20 @ =Task_HookRail_Shared1
	str r0, [r1, #8]
	ldr r0, [r4, #0x40]
	strh r0, [r5, #0xc]
	ldr r0, [r5, #4]
	ldr r1, _08086E24 @ =0xFFFFF600
	adds r0, r0, r1
	str r0, [r5, #4]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #9
	adds r0, r6, r0
	mov r2, sl
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	adds r0, #0x78
	strh r0, [r7, #0x18]
	adds r2, r5, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	ldr r1, [r5, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08086E7E
	ldr r0, [r5, #0x28]
	cmp r0, r7
	bne _08086E7E
	mov r3, r8
	str r3, [r5, #0x28]
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r5, #0x10]
	b _08086E7E
	.align 2, 0
_08086E04: .4byte gCurTask
_08086E08: .4byte 0x0300000C
_08086E0C: .4byte gPlayer
_08086E10: .4byte 0x03000050
_08086E14: .4byte 0xFFFFFA00
_08086E18: .4byte gCamera
_08086E1C: .4byte 0xFFBFFFFF
_08086E20: .4byte Task_HookRail_Shared1
_08086E24: .4byte 0xFFFFF600
_08086E28:
	ldr r0, [r4, #0x40]
	subs r0, #9
	str r0, [r4, #0x40]
	ldr r1, _08086EB4 @ =0xFFFFFA00
	cmp r0, r1
	bge _08086E36
	str r1, [r4, #0x40]
_08086E36:
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x4c]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	ldr r3, _08086EB4 @ =0xFFFFFA00
	adds r0, r0, r3
	adds r0, r0, r1
	str r0, [r5]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x26
	lsls r1, r1, #8
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #1
	subs r1, r1, r0
	str r1, [r5, #4]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #9
	subs r2, r2, r0
	ldr r0, _08086EB8 @ =gCamera
	ldrh r0, [r0, #2]
	subs r2, r2, r0
	strh r2, [r7, #0x18]
	ldr r0, [r5]
	ldr r1, [r4, #0x48]
	subs r0, r0, r1
	asrs r0, r0, #8
	movs r1, #0xf4
	rsbs r1, r1, #0
	cmp r0, r1
	bge _08086E7E
	movs r0, #1
	strb r0, [r6]
_08086E7E:
	ldr r0, _08086EBC @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #1
	bls _08086ECC
	ldr r0, _08086EC0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08086EC4 @ =gMultiSioRecv
	adds r1, r1, r0
	ldr r3, _08086EB8 @ =gCamera
	ldrh r0, [r1, #2]
	ldrh r2, [r3]
	subs r0, r0, r2
	adds r0, #5
	strh r0, [r7, #0x16]
	ldrh r0, [r1, #4]
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	subs r0, #0x24
	strh r0, [r7, #0x18]
	ldr r6, _08086EC8 @ =gPlayer
	adds r2, r3, #0
	b _08086EEA
	.align 2, 0
_08086EB4: .4byte 0xFFFFFA00
_08086EB8: .4byte gCamera
_08086EBC: .4byte gGameMode
_08086EC0: .4byte 0x04000128
_08086EC4: .4byte gMultiSioRecv
_08086EC8: .4byte gPlayer
_08086ECC:
	ldr r3, _08086F08 @ =gPlayer
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r2, _08086F0C @ =gCamera
	ldrh r1, [r2]
	subs r0, r0, r1
	adds r0, #5
	strh r0, [r7, #0x16]
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	subs r0, #0x24
	strh r0, [r7, #0x18]
	adds r6, r3, #0
_08086EEA:
	ldr r0, [r6]
	asrs r0, r0, #8
	ldrh r1, [r2]
	subs r0, r0, r1
	adds r0, #5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	subs r0, #0x24
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08086FDA
	.align 2, 0
_08086F08: .4byte gPlayer
_08086F0C: .4byte gCamera
_08086F10:
	ldr r0, _08086F70 @ =0x03000050
	adds r6, r6, r0
	ldrb r0, [r6]
	cmp r0, #0
	beq _08086F80
	ldr r0, [r4, #0x40]
	adds r0, #0x14
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x4c]
	adds r1, r1, r0
	str r1, [r4, #0x4c]
	asrs r1, r1, #9
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	ldr r1, _08086F74 @ =gCamera
	ldrh r1, [r1, #2]
	subs r0, r0, r1
	adds r0, #0xf0
	strh r0, [r7, #0x18]
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #8
	lsls r3, r3, #0x10
	mov r8, r3
	cmp r0, #2
	ble _08086FC4
	movs r0, #0xb4
	bl m4aSongNumStop
	ldr r2, _08086F78 @ =gCurTask
	ldr r1, [r2]
	ldr r0, _08086F7C @ =Task_HookRail_Shared1
	str r0, [r1, #8]
	ldr r1, [r5, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08086FC4
	ldr r0, [r5, #0x28]
	cmp r0, r7
	bne _08086FC4
	movs r0, #0
	str r0, [r5, #0x28]
	subs r0, #9
	ands r1, r0
	str r1, [r5, #0x10]
	b _08086FC4
	.align 2, 0
_08086F70: .4byte 0x03000050
_08086F74: .4byte gCamera
_08086F78: .4byte gCurTask
_08086F7C: .4byte Task_HookRail_Shared1
_08086F80:
	ldr r0, [r4, #0x40]
	subs r0, #9
	str r0, [r4, #0x40]
	ldr r1, _0808702C @ =0xFFFFFA00
	cmp r0, r1
	bge _08086F8E
	str r1, [r4, #0x40]
_08086F8E:
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x4c]
	lsls r2, r3, #0x10
	asrs r0, r2, #8
	adds r0, r0, r1
	ldr r1, [r4, #0x48]
	subs r0, r0, r1
	asrs r0, r0, #8
	movs r1, #0xf4
	rsbs r1, r1, #0
	mov r8, r2
	cmp r0, r1
	bge _08086FB0
	movs r0, #1
	strb r0, [r6]
_08086FB0:
	ldr r1, [r4, #0x4c]
	asrs r1, r1, #9
	mov r3, sb
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	ldr r1, _08087030 @ =gCamera
	ldrh r1, [r1, #2]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
_08086FC4:
	ldr r0, [r4, #0x4c]
	asrs r0, r0, #8
	mov r2, r8
	asrs r1, r2, #0x10
	adds r1, r1, r0
	ldr r0, _08087030 @ =gCamera
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r7, #0x16]
	ldrh r5, [r7, #0x16]
	ldrh r2, [r7, #0x18]
_08086FDA:
	lsls r0, r5, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x10
	adds r0, r0, r3
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08086FFE
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08086FFE
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0808703C
_08086FFE:
	ldr r2, _08087034 @ =gPlayer
	ldr r1, [r2, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808701A
	ldr r0, [r2, #0x28]
	cmp r0, r7
	bne _0808701A
	movs r0, #0
	str r0, [r2, #0x28]
	subs r0, #9
	ands r1, r0
	str r1, [r2, #0x10]
_0808701A:
	ldrb r0, [r4, #8]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r0, _08087038 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08087042
	.align 2, 0
_0808702C: .4byte 0xFFFFFA00
_08087030: .4byte gCamera
_08087034: .4byte gPlayer
_08087038: .4byte gCurTask
_0808703C:
	adds r0, r7, #0
	bl DisplaySprite
_08087042:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
