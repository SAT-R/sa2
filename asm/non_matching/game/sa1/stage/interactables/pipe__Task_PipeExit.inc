.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _080964B8 @ =gCurTask
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	add r0, r8
	str r0, [sp]
	ldr r2, [r0]
	str r2, [sp, #4]
	ldr r6, _080964BC @ =0x0300000C
	add r6, r8
	ldr r0, _080964C0 @ =0x0300003C
	add r0, r8
	ldrb r0, [r0]
	ldr r4, _080964C4 @ =gPlayer
	cmp r0, #0
	beq _080963D2
	ldr r4, _080964C8 @ =gPartner
_080963D2:
	ldr r3, [sp]
	ldrb r1, [r3, #8]
	lsls r1, r1, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldr r0, [sp, #4]
	ldrb r2, [r0, #1]
	lsls r2, r2, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	ldr r3, _080964CC @ =gCamera
	ldrh r0, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov sl, r1
	subs r0, r1, r0
	strh r0, [r6, #0x16]
	ldrh r0, [r3, #2]
	lsls r2, r2, #0x10
	asrs r7, r2, #0x10
	subs r0, r7, r0
	strh r0, [r6, #0x18]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	mov sb, r1
	adds r5, r0, #0
	ands r5, r1
	cmp r5, #0
	bne _080964EA
	movs r2, #0x80
	lsls r2, r2, #0xf
	ands r0, r2
	cmp r0, #0
	beq _080964DC
	movs r3, #0x6d
	adds r3, r3, r4
	mov sb, r3
	movs r1, #0
	ldrsb r1, [r3, r1]
	ldr r0, _080964D0 @ =0x0300003D
	add r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	bge _08096500
	adds r0, r6, #0
	mov r1, sl
	adds r2, r7, #0
	adds r3, r4, #0
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	beq _08096500
	ldr r1, _080964D4 @ =0x0300003E
	add r1, r8
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #6
	ands r0, r1
	subs r1, #0xfe
	ands r0, r1
	adds r1, #0xf0
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #5
	strb r0, [r1]
	lsls r0, r7, #8
	str r0, [r4, #4]
	mov r2, sl
	lsls r0, r2, #8
	str r0, [r4]
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	strh r5, [r4, #0xc]
	strh r5, [r4, #0x38]
	strh r5, [r4, #0x3a]
	movs r0, #0x7f
	mov r3, sb
	strb r0, [r3]
	adds r0, r4, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r4, #0xe]
	movs r0, #0xe
	strb r0, [r4, #0xf]
	ldr r0, _080964B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080964D8 @ =Task_809656C
	str r0, [r1, #8]
	adds r2, r4, #0
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	b _08096500
	.align 2, 0
_080964B8: .4byte gCurTask
_080964BC: .4byte 0x0300000C
_080964C0: .4byte 0x0300003C
_080964C4: .4byte gPlayer
_080964C8: .4byte gPartner
_080964CC: .4byte gCamera
_080964D0: .4byte 0x0300003D
_080964D4: .4byte 0x0300003E
_080964D8: .4byte Task_809656C
_080964DC:
	adds r0, r6, #0
	mov r1, sl
	adds r2, r7, #0
	adds r3, r4, #0
	bl Coll_Player_Platform
	b _08096500
_080964EA:
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r0, [r4, #0x10]
	mov r1, sb
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
_08096500:
	ldrh r0, [r6, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08096524
	movs r2, #0x18
	ldrsh r0, [r6, r2]
	adds r0, #0x80
	cmp r0, #0
	blt _08096524
	movs r3, #0x18
	ldrsh r1, [r6, r3]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08096544
_08096524:
	ldr r0, [sp]
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _08096536
	ldr r1, [sp]
	ldrb r0, [r1, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_08096536:
	ldr r0, _08096540 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0809655A
	.align 2, 0
_08096540: .4byte gCurTask
_08096544:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	ldr r0, [sp]
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809655A
	adds r0, r6, #0
	bl DisplaySprite
_0809655A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
