.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r8, r0          @ r8 = boss
	mov r6, r8
	adds r6, #0x1c      @ r6 = boss->unk1C
	adds r0, #0x48
	str r0, [sp, #0x10]
	adds r0, #0x4c
	ldrb r4, [r0]
	cmp r4, #0
	bne _08050606
	movs r5, #0xf7
	lsls r5, r5, #3
	add r5, r8
	ldr r0, [r5]
	cmp r0, #0
	beq _080505FC
	bl VramFree
	str r4, [r5]
	ldr r2, _08050884 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050888 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0805088C @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050890 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
_080505FC:
	mov r2, r8
	ldrh r1, [r2, #0x10]
	ldr r0, _08050894 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #0x10]
_08050606:
	movs r3, #0x20
	ldrsh r0, [r6, r3]
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1
	movs r4, #0x22
	ldrsh r0, [r6, r4]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1
	ldr r7, [sp, #0x10]
	ldr r0, [r7, #0x44]
	asrs r0, r0, #8
	ldrh r1, [r7, #0x3a]
	adds r7, r0, r1
	ldr r2, _08050898 @ =0x000003FF
	adds r0, r2, #0
	ands r7, r0
	ldr r4, _0805089C @ =gSineTable
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r7, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080508A0 @ =gUnknown_080D89A5
	ldrb r3, [r0]
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r0, r7, #1
	adds r0, r0, r4
	movs r4, #0
	ldrsh r0, [r0, r4]
	muls r0, r3, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r3, _080508A4 @ =gCamera
	ldr r0, [r3]
	subs r1, r1, r0
	str r1, [sp, #0x14]
	mov r4, sl
	asrs r1, r4, #8
	ldr r0, [r3, #4]
	subs r6, r1, r0
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _080508A8 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r2, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r1, _080508AC @ =0x000007C4
	add r1, r8
	movs r0, #0
	str r0, [r1]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c
	ldr r2, [sp, #0x10]
	adds r2, #0x3a
	str r2, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	adds r0, #0x42
	str r0, [sp, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	movs r2, #0
_080506AE:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080506AE
	ldrb r2, [r3]
	mov r0, r8
	movs r1, #0xff
	bl sub_80508C4
	mov r2, r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080506FA
	ldr r5, _080508B0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]
	strh r6, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080506FA:
	adds r0, r7, #0
	adds r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0805089C @ =gSineTable
	ldr r4, _080508B4 @ =0xFFFFFF00
	adds r1, r7, r4
	ldr r0, _08050898 @ =0x000003FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r1, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	asrs r0, r0, #2
	add sb, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0
	movs r4, #0
_0805072C:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0
	adds r6, r5, #0
	adds r6, #0x38
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x1c]
	adds r0, r3, r0
	ldrh r0, [r0]
	adds r7, r7, r0
	ldr r0, _08050898 @ =0x000003FF
	ands r7, r0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _0805089C @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _080508A0 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	lsls r3, r7, #1
	str r3, [sp, #0x18]
	ldr r1, _0805089C @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080508B8 @ =gUnknown_030054B8
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r7, [r5, #0x38]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #2]
	adds r1, r0, #0
	strh r1, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bls _0805072C
	ldr r1, _0805089C @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, _080508A0 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0
	ldr r5, _080508BC @ =0x000008BC
	add r5, r8
	ldr r6, _080508C0 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x20]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050898 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _080508A4 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	movs r0, #0x83
	lsls r0, r0, #5
	orrs r2, r0
	ldr r1, _080508B8 @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080508B8 @ =gUnknown_030054B8
	strb r1, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	orrs r2, r0
	str r2, [r5, #0x10]
	strh r3, [r6]
	strh r4, [r6, #2]
	strh r4, [r6, #4]
	ldrh r0, [r5, #0x16]
	strh r0, [r6, #6]
	ldrh r0, [r5, #0x18]
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	adds r0, r5, #0
	bl DisplaySprite
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050884: .4byte gDispCnt
_08050888: .4byte 0x00007FFF
_0805088C: .4byte gWinRegs
_08050890: .4byte gBldRegs
_08050894: .4byte 0x0000FFFE
_08050898: .4byte 0x000003FF
_0805089C: .4byte gSineTable
_080508A0: .4byte gUnknown_080D89A5
_080508A4: .4byte gCamera
_080508A8: .4byte gBgAffineRegs
_080508AC: .4byte 0x000007C4
_080508B0: .4byte 0x000007B4
_080508B4: .4byte 0xFFFFFF00
_080508B8: .4byte gUnknown_030054B8
_080508BC: .4byte 0x000008BC
_080508C0: .4byte 0x000008F4

.syntax divided
