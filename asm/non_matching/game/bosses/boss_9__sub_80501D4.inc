.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0              @ r8 = boss
	mov r6, r8
	adds r6, #0x1c          @ r6 = boss->unk1C
	adds r0, #0x48
	str r0, [sp, #0x10]     @ sp10 = boss->unk48
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	bne _08050298
	ldr r2, _08050248 @ =gStageFlags
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r1, r0
	strh r1, [r2]
	mov r3, r8              @ r3 = r8 = boss
	ldrb r4, [r3, #0xf]
	cmp r4, #0
	bne _0805026C
	ldr r5, _0805024C @ =0x000007B4
	add r5, r8
	ldr r0, [r5, #4]
	bl VramFree
	movs r0, #0x2a
	bl VramMalloc
	str r0, [r5, #4]
	movs r1, #0
	ldr r0, _08050250 @ =0x00000317
	strh r0, [r5, #0xa]
	ldr r0, _08050254 @ =0x000007D4
	add r0, r8
	strb r1, [r0]
	ldr r1, _08050258 @ =0x000007D5
	add r1, r8
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _0805025C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _08050260 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _08050264 @ =gWinRegs
	strh r4, [r0, #0xa]
	ldr r0, _08050268 @ =gBldRegs
	strh r4, [r0]
	strh r4, [r0, #2]
	movs r0, #1
	mov r4, r8
	strb r0, [r4, #0xf]
	b _0805027A
	.align 2, 0
_08050248: .4byte gStageFlags
_0805024C: .4byte 0x000007B4
_08050250: .4byte 0x00000317
_08050254: .4byte 0x000007D4
_08050258: .4byte 0x000007D5
_0805025C: .4byte gDispCnt
_08050260: .4byte 0x00007FFF
_08050264: .4byte gWinRegs
_08050268: .4byte gBldRegs
_0805026C:
	mov r7, r8
	ldrb r0, [r7, #0xc]
	cmp r0, #0
	beq _0805027A
	ldr r0, _0805028C @ =0x0000FFDF
	ands r1, r0
	strh r1, [r2]
_0805027A:
	mov r0, r8
	ldrh r1, [r0, #0x10]
	ldr r0, _08050290 @ =0x0000FFFE
	ands r0, r1
	mov r1, r8
	strh r0, [r1, #0x10]
	ldr r3, _08050294 @ =gStageFlags
	b _080502A4
	.align 2, 0
_0805028C: .4byte 0x0000FFDF
_08050290: .4byte 0x0000FFFE
_08050294: .4byte gStageFlags
_08050298:
	ldr r0, _080502BC @ =gStageFlags
	ldrh r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	strh r1, [r0]
	adds r3, r0, #0         @ r3 = gStageFlags
_080502A4:
	mov r2, r8              @ r2 = r8 = boss
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080502C8
	ldr r2, _080502C0 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _080502C4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	b _080502D6
	.align 2, 0
_080502BC: .4byte gStageFlags
_080502C0: .4byte gDispCnt
_080502C4: .4byte 0x0000FBFF
_080502C8:
	ldr r0, _0805057C @ =gDispCnt
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r0]
_080502D6:
	ldrh r1, [r3]
	movs r4, #0x80
	lsls r4, r4, #1         @ r4 = 0x100
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080502EA
	b sub_80501D4__return
_080502EA:
	movs r7, #0x20
	ldrsh r0, [r6, r7]      @ r0 = r6 = boss->unk1C
	lsls r0, r0, #8
	ldr r1, [r6, #0x24]
	adds r1, r1, r0
	mov sb, r1              @ sb = qX = unk1C->qPos.x + Q(unk1C->unk20);
	movs r1, #0x22
	ldrsh r0, [r6, r1]
	lsls r0, r0, #8
	ldr r1, [r6, #0x28]
	adds r1, r1, r0
	mov sl, r1              @ sl = qY = unk1C->qPos.y + Q(unk1C->unk22);
	ldr r2, [sp, #0x10]     @ r2 = boss->unk48
	ldr r0, [r2, #0x44]
	asrs r0, r0, #8         @ r0 = unk48->unk44
	ldrh r3, [r2, #0x3a]
	adds r7, r0, r3
	ldr r1, _08050580 @ =0x000003FF
	adds r0, r1, #0
	ands r7, r0             @ r7 = (I(unk48->qPos44) - unk48->unk3A) & ONE_CYCLE;
	ldr r3, _08050584 @ =gSineTable
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r0, r2]      @ r1 = COS(r7)
	ldr r0, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0         @ r0 = COS(r7) * gUnknown_080D89A5
	asrs r0, r0, #6
	add sb, r0              @ qX += ((COS(r7) * gUnknown_080D89A5) >> 6);
	lsls r0, r7, #1
	adds r0, r0, r3
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0              @ qY += ((SIN(r7) * gUnknown_080D89A5) >> 6);
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	str r1, [sp, #0x14]     @ sp14 = screenX = I(qX) - gCamera.x;
	mov r3, sl
	asrs r1, r3, #8
	ldr r0, [r2, #4]
	subs r1, r1, r0
	str r1, [sp, #0x18]     @ sp18 = screenY = I(qY) - gCamera.y;
	movs r0, #0x33
	str r0, [sp]
	ldr r1, [sp, #0x14]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, _08050590 @ =gBgAffineRegs
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x30
	bl sub_8003EE4
	ldr r0, _08050594 @ =0x000007C4
	add r0, r8
	str r5, [r0]
	movs r4, #0
	ldr r3, [sp, #0x10]
	adds r3, #0x4c          @ r3 = &unk48->unk4C
	ldr r0, [sp, #0x10]
	adds r0, #0x3a
	str r0, [sp, #0x20]     @ sp20 = &unk48->unk3A[0]
	ldr r1, [sp, #0x10]
	adds r1, #0x42
	str r1, [sp, #0x24]     @ sp24 = &unk48->unk42
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8              @ boss->capsule[0].unk10
	movs r2, #0
_08050392:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08050392
	ldr r6, _08050584 @ =gSineTable
	ldr r0, _08050598 @ =gStageTime
	ldr r0, [r0]
	lsls r0, r0, #1
	ldr r1, _0805059C @ =0x000001FF
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r3]
	mov r0, r8
	bl sub_80508C4
	mov r2, r8              @ r2 = r8
	ldrh r1, [r2, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080503FA
	ldr r5, _080505A0 @ =0x000007B4
	add r5, r8
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r5, #0x16]    @ s->x = screenX;
	mov r4, sp
	ldrh r4, [r4, #0x18]
	strh r4, [r5, #0x18]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r0, r5, #0
	bl DisplaySprite
_080503FA:
	adds r0, r7, #0
	adds r0, #0x8c          @ r0 = r7 + 0x8C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _080505A4 @ =0xFFFFFF00
	adds r1, r7, r0         @ r1 = (r7 + 0x8C) - Q(1)
	ldr r0, _08050580 @ =0x000003FF
	ands r1, r0             @ r1 = sinIndex = ((r7 + 0x8C) - Q(1)) & ONE_CYCLE
	movs r2, #0x80
	lsls r2, r2, #1         @ r2 = 0x100
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r0, r0, #2
	add sb, r0              @ qX += COS(sinIndex) >> 2;
	lsls r1, r1, #1
	adds r1, r1, r6
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r0, r0, #2
	add sl, r0              @ qY += SIN(sinIndex) >> 2;
	movs r4, #0
_0805042A:
	lsls r0, r4, #4
	adds r0, r0, r4
	lsls r0, r0, #2
	movs r1, #0xfe
	lsls r1, r1, #3
	adds r0, r0, r1
	mov r2, r8
	adds r5, r2, r0         @ r5 = capsule = boss->capsule[i];
	adds r6, r5, #0
	adds r6, #0x38          @ r6 = transform = capsule->transform
	adds r4, #1
	lsls r0, r4, #1
	ldr r3, [sp, #0x20]     @ r3 = sp20 = &unk48->unk3A[0]
	adds r0, r3, r0
	ldrh r0, [r0]           @ r0 = &unk48->unk3A[i]
	adds r7, r7, r0
	ldr r0, _08050580 @ =0x000003FF
	ands r7, r0             @ r7 = (r7 + unk48->unk3A[i]) & ONE_CYCLE;
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	lsls r0, r0, #1
	ldr r2, _08050584 @ =gSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r2, _08050588 @ =gUnknown_080D89A5
	adds r0, r4, r2
	ldrb r2, [r0]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0              @ qX += (COS(r7) * gUnknown_080D89A5[i]) >> 6;
	lsls r3, r7, #1
	str r3, [sp, #0x1c]
	ldr r1, _08050584 @ =gSineTable
	adds r0, r3, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0              @ qY += (SIN(r7) * gUnknown_080D89A5[i]) >> 6;
	mov r0, sb
	asrs r1, r0, #8
	ldr r2, _0805058C @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	strh r1, [r5, #0x16]    @ s->x = I(qX) - gCamera.x
	mov r3, sl
	asrs r0, r3, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]    @ s->y = I(qY) - gCamera.y
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r3, _080505AC @ =gUnknown_030054B8
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
	bls _0805042A
__post_loop:
	ldr r1, _08050584 @ =gSineTable
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r7, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]  @ r0 = COS(r7)
	ldr r3, _08050588 @ =gUnknown_080D89A5
	ldrb r2, [r3, #4]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0          @ qX += (COS(r7) * gUnknown_080D89A5[4]) >> 6
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0          @ qY += (SIN(r7) * gUnknown_080D89A5[4]) >> 6
	ldr r5, _080505B0 @ =0x000008BC
	add r5, r8
	ldr r6, _080505B4 @ =0x000008F4
	add r6, r8
	ldr r0, [sp, #0x24]
	ldrh r3, [r0]
	adds r3, r3, r7
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0x38]
	adds r3, r3, r1
	ldr r2, _08050580 @ =0x000003FF
	ands r3, r2
	mov r7, sb
	asrs r0, r7, #8
	ldr r2, _0805058C @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	mov r7, sl
	asrs r0, r7, #8
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	ldr r0, _080505A8 @ =0x00002060
	orrs r2, r0
	ldr r1, _080505AC @ =gUnknown_030054B8
	ldrb r0, [r1]
	adds r1, r0, #1
	ldr r7, _080505AC @ =gUnknown_030054B8
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
sub_80501D4__return:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805057C: .4byte gDispCnt
_08050580: .4byte 0x000003FF
_08050584: .4byte gSineTable
_08050588: .4byte gUnknown_080D89A5
_0805058C: .4byte gCamera
_08050590: .4byte gBgAffineRegs
_08050594: .4byte 0x000007C4
_08050598: .4byte gStageTime
_0805059C: .4byte 0x000001FF
_080505A0: .4byte 0x000007B4
_080505A4: .4byte 0xFFFFFF00
_080505A8: .4byte 0x00002060
_080505AC: .4byte gUnknown_030054B8
_080505B0: .4byte 0x000008BC
_080505B4: .4byte 0x000008F4

.syntax divided