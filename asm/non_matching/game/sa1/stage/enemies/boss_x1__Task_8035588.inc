.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08035654 @ =gCurTask
	ldr r5, [r0]
	ldrh r0, [r5, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	mov r8, r0
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrh r3, [r0, #6]
	adds r1, r3, r1
	str r1, [sp]
	mov sb, r8
	movs r0, #0x4d
	mov sl, r0
	ldr r4, _08035658 @ =gSineTable
	ldr r1, _0803565C @ =0x0300008A
	adds r2, r3, r1
	movs r6, #0
	ldrsh r0, [r2, r6]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r0, [r0, r6]
	mov r1, sl
	muls r1, r0, r1
	ldrh r2, [r2]
	ldr r0, _08035660 @ =0x000001FF
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	mov r2, sl
	muls r2, r0, r2
	ldr r4, _08035664 @ =0x03000080
	adds r0, r3, r4
	ldrh r4, [r0]
	mov r6, r8
	strh r4, [r6, #0x3c]
	ldr r6, _08035668 @ =0x03000082
	adds r0, r3, r6
	ldrh r0, [r0]
	mov r6, r8
	strh r0, [r6, #0x3e]
	asrs r1, r1, #0xe
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	asrs r2, r2, #0xe
	adds r2, #0x16
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, _0803566C @ =0x03000086
	adds r3, r3, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #3
	bgt _080356B0
	ldrh r0, [r5, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r6, r0, r1
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r4, r0, #0x10
	ldr r3, _08035670 @ =gPlayer
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_800BF10
	adds r7, r0, #0
	ldr r0, _08035674 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _0803567C
	ldr r3, _08035678 @ =gPartner
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_800BF10
	b _0803567E
	.align 2, 0
_08035654: .4byte gCurTask
_08035658: .4byte gSineTable
_0803565C: .4byte 0x0300008A
_08035660: .4byte 0x000001FF
_08035664: .4byte 0x03000080
_08035668: .4byte 0x03000082
_0803566C: .4byte 0x03000086
_08035670: .4byte gPlayer
_08035674: .4byte gNumSingleplayerCharacters
_08035678: .4byte gPartner
_0803567C:
	movs r0, #0
_0803567E:
	cmp r7, #2
	beq _08035686
	cmp r0, #2
	bne _080356B0
_08035686:
	ldr r0, _08035744 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r0, r0, r4
	ldrh r1, [r0, #6]
	ldr r6, _08035748 @ =0x0300003C
	adds r3, r1, r6
	ldr r0, _0803574C @ =0x0300005C
	adds r2, r1, r0
	movs r0, #1
	strb r0, [r2]
	ldr r2, _08035750 @ =0x0300005D
	adds r1, r1, r2
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r3, #0x10]
	ldr r1, _08035754 @ =0xFFFFBFFF
	ands r0, r1
	str r0, [r3, #0x10]
_080356B0:
	ldr r2, _08035758 @ =gCamera
	ldrh r0, [r2]
	ldr r3, [sp, #4]
	lsls r1, r3, #0x10
	asrs r4, r1, #0x10
	subs r0, r4, r0
	mov r6, sb
	strh r0, [r6, #0x16]
	ldrh r0, [r2, #2]
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r5, r1, #0x10
	subs r0, r5, r0
	strh r0, [r6, #0x18]
	mov r0, sb
	bl UpdateSpriteAnimation
	mov r0, sb
	bl DisplaySprite
	ldr r0, [sp]
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08035732
	mov r3, r8
	ldrh r1, [r3, #0x30]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803571C
	ldr r2, _0803575C @ =gPseudoRandom
	ldr r1, [r2]
	ldr r0, _08035760 @ =0x00196225
	muls r1, r0, r1
	ldr r6, _08035764 @ =0x3C6EF35F
	adds r1, r1, r6
	str r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	adds r0, r4, r0
	subs r0, #0xf
	lsls r0, r0, #8
	movs r2, #0xf8
	lsls r2, r2, #0xd
	ands r1, r2
	asrs r1, r1, #0x10
	adds r1, r5, r1
	subs r1, #0xf
	lsls r1, r1, #8
	bl sub_8017540
_0803571C:
	mov r1, r8
	ldrh r0, [r1, #0x30]
	subs r0, #1
	strh r0, [r1, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08035732
	ldr r0, _08035744 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08035732:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035744: .4byte gCurTask
_08035748: .4byte 0x0300003C
_0803574C: .4byte 0x0300005C
_08035750: .4byte 0x0300005D
_08035754: .4byte 0xFFFFBFFF
_08035758: .4byte gCamera
_0803575C: .4byte gPseudoRandom
_08035760: .4byte 0x00196225
_08035764: .4byte 0x3C6EF35F

.syntax divided
