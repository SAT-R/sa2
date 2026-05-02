.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0     @ r7 = pole
	adds r5, r1, #0     @ r5 = s
	str r2, [sp]        @ sp00 = r2 = worldX
	str r3, [sp, #4]    @ sp04 = r3 = worldY
	movs r0, #0
	mov sl, r0          @ sl = 0
	mov sb, r0          @ sb = 0
	adds r0, r2, #0
	adds r0, #0xf
	lsls r0, r0, #8
	str r0, [sp, #8]    @ sp08 = qWorldX = Q(worldX + 15)
	ldr r1, _08078014 @ =gPlayer + 0x26
	mov r8, r1          @ r8  =r1 = &gPlayer->itemEffect
	adds r0, r5, #0
	adds r0, #0x21
	str r0, [sp, #0xc]  @ sp0C = &s->prevVariant
_08077FD0_loop:
	ldr r4, _08078018 @ =gPlayer
	mov r1, sb
	cmp r1, #0
	beq _08077FDA
	ldr r4, _0807801C @ =gPartner
_08077FDA:
	ldr r0, [sp]
	lsls r1, r0, #0x10
	ldr r0, [sp, #4]
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
	beq _0807808A_continue
	ldr r2, [r4, #0x10]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0807808A_continue
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _08078024
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _08078020 @ =0xFFFFFD00
	b _0807802A
	.align 2, 0
_08078014: .4byte gPlayer + 0x26
_08078018: .4byte gPlayer
_0807801C: .4byte gPartner
_08078020: .4byte 0xFFFFFD00
_08078024:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _080780AC @ =0xFFFFFAC0
_0807802A:
	cmp r1, r0
	bge _0807808A_continue
	movs r6, #1
	ands r2, r6
	cmp r2, #0
	beq _0807808A_continue
	adds r0, r4, #0
	bl Player_TransitionCancelFlyingAndBoost
	movs r0, #0xaf
	bl m4aSongNumStart
	ldr r1, [sp, #8]
	str r1, [r4]
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #0x80
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0xff
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	adds r0, #0xd6
	strh r0, [r5, #0xa]
	adds r0, r5, #0
	adds r0, #0x20
	strb r6, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x3e
	strb r0, [r2]
	movs r0, #0x1e
	strb r0, [r1]
	mov sl, r6
_0807808A_continue:
	movs r0, #1
	add sb, r0
	ldr r0, _080780B0 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	blt _08077FD0_loop
	mov r0, sl
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080780AC: .4byte 0xFFFFFAC0
_080780B0: .4byte gNumSingleplayerCharacters

.syntax divided
