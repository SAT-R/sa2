.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	adds r5, r1, #0
	adds r7, r2, #0
	mov r8, r3
	movs r0, #0
	str r0, [sp]
	movs r6, #0
	ldr r0, _08078214 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x19
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r1, _08078218 @ =gPlayer + 0x26
	mov sb, r1
	b _0807822C
	.align 2, 0
_08078214: .4byte gCurrentLevel
_08078218: .4byte gPlayer + 0x26
_0807821C:
	adds r6, #1
	ldr r0, _080782B8 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	blt _0807822C
	b _08078326
_0807822C:
	ldr r4, _080782BC @ =gPlayer
	cmp r6, #0
	beq _08078234
	ldr r4, _080782C0 @ =gPartner
_08078234:
	lsls r1, r7, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	adds r0, r5, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	adds r3, r4, #0
	bl Coll_Player_Entity_Intersection
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _0807821C
	adds r0, r4, #0
	adds r0, #0x59
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807826E
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807821C
_0807826E:
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0xaf
	bl m4aSongNumStart
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0x80
	orrs r0, r1
	mov r1, sb
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x10
	lsls r0, r0, #8
	str r0, [r4, #4]
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080782C4
	adds r0, r7, #0
	subs r0, #8
	lsls r0, r0, #8
	str r0, [r4]
	ldr r0, [r4, #0x10]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	b _080782D2
	.align 2, 0
_080782B8: .4byte gNumSingleplayerCharacters
_080782BC: .4byte gPlayer
_080782C0: .4byte gPartner
_080782C4:
	adds r0, r7, #0
	adds r0, #8
	lsls r0, r0, #8
	str r0, [r4]
	ldr r0, [r4, #0x10]
	movs r1, #1
	orrs r0, r1
_080782D2:
	str r0, [r4, #0x10]
	adds r1, r5, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080782EE
	ldr r0, _080782F4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne _080782F8
_080782EE:
	movs r0, #0xea
	lsls r0, r0, #1
	b _080782FC
	.align 2, 0
_080782F4: .4byte gCurrentLevel
_080782F8:
	movs r0, #0xeb
	lsls r0, r0, #1
_080782FC:
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #1
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	mov r1, sl
	adds r1, #0x3f
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x40
	ldrb r1, [r2]
	mov r0, sl
	adds r0, #0x3e
	strb r1, [r0]
	movs r0, #0x1f
	strb r0, [r2]
	movs r0, #1
	str r0, [sp]
_08078326:
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

.syntax divided
