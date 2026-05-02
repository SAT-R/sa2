.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080274F4 @ =gCurTask
	ldr r2, [r0]
	ldrh r0, [r2, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r7, r0, r1
	ldr r4, _080274F8 @ =0x03000030
	adds r3, r0, r4
	ldrh r0, [r2]
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r5, r0, r1
	adds r1, #0x44
	adds r1, r1, r0
	mov r8, r1
	movs r1, #0
	strh r1, [r3]
	ldr r2, _080274FC @ =0x03000094
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r0, #0
	bge _08027504
	ldr r2, _08027500 @ =0xFFFFFE00
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0802750C
	strh r1, [r3]
	b _0802750C
	.align 2, 0
_080274F4: .4byte gCurTask
_080274F8: .4byte 0x03000030
_080274FC: .4byte 0x03000094
_08027500: .4byte 0xFFFFFE00
_08027504:
	cmp r0, #0
	ble _0802750C
	rsbs r0, r1, #0
	strh r0, [r3]
_0802750C:
	adds r0, r7, #0
	adds r1, r3, #0
	bl UnusedTransform
	ldr r3, _0802759C @ =gSineTable
	ldr r0, _080275A0 @ =gSpriteTransformRotation
	ldrh r2, [r0]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r2, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r2, r0, #1
	adds r2, r2, r0
	ldr r3, _080275A4 @ =gSpriteTransformX
	ldr r4, _080275A8 @ =gCamera
	ldrh r0, [r4]
	ldrh r3, [r3]
	adds r0, r0, r3
	asrs r1, r1, #9
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r1, _080275AC @ =gSpriteTransformY
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	asrs r2, r2, #9
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080275E6
	lsls r0, r3, #0x10
	asrs r5, r0, #0x10
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	ldr r3, _080275B0 @ =gPlayer
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl Coll_Player_Entity_Intersection
	adds r6, r0, #0
	ldr r0, _080275B4 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _080275BC
	ldr r3, _080275B8 @ =gPartner
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl Coll_Player_Entity_Intersection
	adds r4, r0, #0
	b _080275BE
	.align 2, 0
_0802759C: .4byte gSineTable
_080275A0: .4byte gSpriteTransformRotation
_080275A4: .4byte gSpriteTransformX
_080275A8: .4byte gCamera
_080275AC: .4byte gSpriteTransformY
_080275B0: .4byte gPlayer
_080275B4: .4byte gNumSingleplayerCharacters
_080275B8: .4byte gPartner
_080275BC:
	movs r4, #0
_080275BE:
	movs r5, #0x80
	lsls r5, r5, #0xc
	cmp r6, r5
	bne _080275D4
	ldr r0, _080275F8 @ =gPlayer
	bl Coll_DamagePlayer
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_080275D4:
	cmp r4, r5
	bne _080275E6
	ldr r0, _080275FC @ =gPartner
	bl Coll_DamagePlayer
	mov r1, r8
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_080275E6:
	adds r0, r7, #0
	bl DisplaySprite
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080275F8: .4byte gPlayer
_080275FC: .4byte gPartner

.syntax divided
