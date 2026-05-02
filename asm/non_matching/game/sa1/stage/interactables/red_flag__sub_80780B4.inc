.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	adds r5, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r6, #0
	adds r0, r2, #0
	subs r0, #0xf
	lsls r0, r0, #8
	str r0, [sp, #0xc]
	ldr r1, _080780E4 @ =gPlayer + 0x26
	mov sl, r1
	adds r2, r5, #0
	adds r2, #0x21
	str r2, [sp, #0x10]
	b _08078122
	.align 2, 0
_080780E4: .4byte gPlayer + 0x26
_080780E8:
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	movs r0, #0xa8
	lsls r0, r0, #3
	cmp r1, r0
	ble _0807810E
	movs r7, #1
	ands r2, r7
	cmp r2, #0
	bne _0807810E
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0xaf
	bl m4aSongNumStart
	ldr r0, [sp, #0xc]
	str r0, [r4]
	b _08078180
_0807810E:
	adds r6, #1
	ldr r0, _080781D8 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bge _080781C4
	ldr r4, _080781DC @ =gPartner
	cmp r6, #0
	bne _08078130
_08078122:
	ldr r4, _080781E0 @ =gPlayer
	ldr r1, [sp]
	lsls r1, r1, #0x10
	str r1, [sp, #0x14]
	ldr r2, [sp, #4]
	lsls r2, r2, #0x10
	mov sb, r2
_08078130:
	adds r0, r5, #0
	ldr r3, [sp, #0x14]
	asrs r1, r3, #0x10
	mov r3, sb
	asrs r2, r3, #0x10
	adds r3, r4, #0
	bl Coll_Player_Entity_Intersection
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _0807810E
	ldr r2, [r4, #0x10]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0807810E
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _080780E8
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r1, r0
	ble _0807810E
	movs r7, #1
	ands r2, r7
	cmp r2, #0
	bne _0807810E
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0xaf
	bl m4aSongNumStart
	ldr r1, [sp, #0xc]
	str r1, [r4]
_08078180:
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	mov r2, sl
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xff
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	adds r0, #0xd6
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r7, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x3f
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x40
	ldrb r1, [r2]
	mov r0, r8
	adds r0, #0x3e
	strb r1, [r0]
	movs r0, #0x1e
	strb r0, [r2]
	movs r0, #1
	str r0, [sp, #8]
_080781C4:
	ldr r0, [sp, #8]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080781D8: .4byte gNumSingleplayerCharacters
_080781DC: .4byte gPartner
_080781E0: .4byte gPlayer

.syntax divided
