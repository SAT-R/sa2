.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0              @ r8 = boss
	mov r7, r8
	adds r7, #0x88          @ r7 = s = boss->sub.spr70
	mov r1, r8              @ r1 = r8 = boss
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	ldr r4, _080419F8 @ =gCamera
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	mov r3, r8
	ldr r0, [r3, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	adds r7, #0x38
	mov r6, r8
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	ldr r1, [r4]
	subs r0, r0, r1
	strh r0, [r7, #0x16]
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	subs r0, #0xe
	strh r0, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	movs r5, #0
	ldr r0, _080419FC @ =gSineTable
	mov sb, r0
	adds r7, #0x30
	mov sl, r4
_080418E6:
	ldr r3, _08041A00 @ =gStageTime
	ldr r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	lsls r1, r5, #7
	adds r0, r0, r1
	ldr r4, _08041A04 @ =0x000003FF
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10          @ r6 = period
	mov r0, r8                  @ r0 = r8 = boss
	ldr r2, [r0, #4]
	asrs r2, r2, #8
	mov r1, sl
	ldr r0, [r1]
	subs r2, r2, r0
	movs r4, #0xfa
	lsls r4, r4, #1
	adds r3, r6, r4
	ldr r6, _08041A04 @ =0x000003FF
	ands r3, r6
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r3, r1
	lsls r0, r0, #1
	add r0, sb
	movs r4, #0
	ldrsh r1, [r0, r4]
	lsls r0, r1, #4
	adds r0, r0, r1
	adds r4, r5, #1
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r2, r2, r0
	strh r2, [r7, #0x16]
	mov r6, r8
	ldr r2, [r6, #8]
	asrs r2, r2, #8
	mov r1, sl
	ldr r0, [r1, #4]
	subs r2, r2, r0
	lsls r3, r3, #1
	add r3, sb
	movs r6, #0
	ldrsh r1, [r3, r6]
	lsls r0, r1, #4
	adds r0, r0, r1
	muls r0, r4, r0
	asrs r0, r0, #0xe
	adds r0, #0x14
	adds r2, r2, r0
	strh r2, [r7, #0x18]
	adds r0, r7, #0
	bl DisplaySprite
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	cmp r5, #2
	bls _080418E6
	ldr r4, _080419FC @ =gSineTable     @ r4 = gSineTable
	ldr r0, _08041A00 @ =gStageTime
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1                     @ r0 = (gStageTime * 12) + 512
	ldr r3, _08041A04 @ =0x000003FF
	ands r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10                  @ r6 = period
	movs r7, #0x90
	lsls r7, r7, #1
	add r7, r8                          @ r7 = &boss->sprTailTip
	mov r0, r8
	ldr r1, [r0, #4]
	asrs r1, r1, #8
	ldr r5, _080419F8 @ =gCamera
	ldr r0, [r5]
	subs r1, r1, r0
	movs r0, #0xfa
	lsls r0, r0, #1
	adds r2, r6, r0
	ands r2, r3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r3, [r0, r6]
	lsls r0, r3, #4
	subs r0, r0, r3
	asrs r0, r0, #0xc
	adds r1, r1, r0
	strh r1, [r7, #0x16]
	mov r0, r8
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r0, [r5, #4]
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r0, r2, #4
	subs r0, r0, r2
	asrs r0, r0, #0xc
	adds r0, #0x14
	adds r1, r1, r0
	strh r1, [r7, #0x18]
	adds r0, r7, #0
	bl UpdateSpriteAnimation
	adds r0, r7, #0
	bl DisplaySprite
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080419F8: .4byte gCamera
_080419FC: .4byte gSineTable
_08041A00: .4byte gStageTime
_08041A04: .4byte 0x000003FF
	
.syntax divided
