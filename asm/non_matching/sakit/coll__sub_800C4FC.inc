.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0              @ sb = s
	mov sl, r1              @ sl = sx
	str r2, [sp]            @ sp00 = sy
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]        @ sp04 = r3 = hbIndex
	ldr r0, _0800C58C @ =gPlayer
	adds r0, #0x90
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0xc           @ r6 = sprPlayer
	lsls r1, r3, #3
	mov r0, sb
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C532
	b sub_800C4FC_return_0
_0800C532:
    @ This might confirm that all enemies
    @ use one "base struct", as sub_800C4FC is
    @ only called by enemies.
	ldr r0, _0800C590 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1              @ r8 = eb
	ldr r0, _0800C58C @ =gPlayer
	ldr r1, [r0, #0x20]
	movs r0, #0x80
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	beq _0800C550
	b sub_800C4FC_return_0
_0800C550:
	ldr r0, _0800C594 @ =gGameMode
	ldrb r1, [r0]
	mov ip, r0
	cmp r1, #2
	bls _0800C598
	mov r1, r8              @ r1 = r8 =eb
	ldr r0, [r1]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0800C598
	mov r2, sl
	lsls r5, r2, #0x10
	asrs r5, r5, #0x10
	ldr r0, [sp]
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateDustCloud
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateTrappedAnimal
	movs r0, #1
	b sub_800C4FC_return_1
	.align 2, 0
_0800C58C: .4byte gPlayer
_0800C590: .4byte gCurTask
_0800C594: .4byte gGameMode
_0800C598:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	beq _0800C5A4
	b _0800C73A
_0800C5A4:
	ldr r1, [r6, #0x30]     @ r1 = sprPlayer.hitboxes[1].index
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C674
	ldr r1, [sp, #4]        @ r1 = hbIndex
	lsls r2, r1, #3
	mov r0, sb
	adds r4, r0, r2         @ s->hitboxes[hbIndex]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r1, sl
	adds r3, r1, r5
	ldr r1, _0800C670 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x34
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C5EC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C5FE
	cmp r3, r1
	blt _0800C674
_0800C5EC:
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C5FE:
	add r2, sb
	adds r0, r2, #0
	adds r0, #0x2d
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp]
	adds r3, r0, r4
	ldr r1, _0800C670 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x35
	movs r5, #0
	ldrsb r5, [r1, r5]
	adds r1, r0, r5
	cmp r3, r1
	bgt _0800C636
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C648
	cmp r3, r1
	blt _0800C674
_0800C636:
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C674
_0800C648:
	mov r2, ip
	ldrb r0, [r2]
	cmp r0, #2
	bls _0800C666
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
_0800C666:
	ldr r0, _0800C670 @ =gPlayer
	bl sub_800CB18
	b sub_800C4FC_CreateAnimal
	.align 2, 0
_0800C670: .4byte gPlayer
_0800C674:
	ldr r1, [r6, #0x28]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0800C73A
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2c
	movs r5, #0
	ldrsb r5, [r0, r5]
	mov r0, sl
	adds r3, r0, r5
	ldr r1, _0800C730 @ =gPlayer
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2c
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r3, r1
	bgt _0800C6BC
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r3, r0
	cmp r0, r1
	bge _0800C6CE
	cmp r3, r1
	blt _0800C73A
_0800C6BC:
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r3
	blt _0800C73A
_0800C6CE:
	mov r0, sb
	adds r4, r0, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, [sp]
	adds r2, r1, r5
	ldr r1, _0800C730 @ =gPlayer
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, r1
	cmp r2, r3
	bgt _0800C70A
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r3
	bge _0800C71C
	cmp r2, r3
	blt _0800C73A
_0800C70A:
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r1
	adds r0, r3, r0
	cmp r0, r2
	blt _0800C73A
_0800C71C:
	ldr r0, _0800C730 @ =gPlayer
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800C734
	mov r2, ip
	ldrb r0, [r2]
	b _0800C7E8
	.align 2, 0
_0800C730: .4byte gPlayer
_0800C734:
	ldr r0, _0800C82C @ =gPlayer
	bl sub_800CBA4
_0800C73A:
	ldr r0, _0800C830 @ =gCheese
	ldr r0, [r0]
	cmp r0, #0
	bne _0800C744
	b sub_800C4FC_return_0
_0800C744:
	adds r3, r0, #0
	ldr r1, [r3, #0x4c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq sub_800C4FC_return_0
	ldr r0, [sp, #4]
	lsls r2, r0, #3
	mov r1, sb
	adds r5, r1, r2
	adds r0, r5, #0
	adds r0, #0x2c
	movs r6, #0
	ldrsb r6, [r0, r6]
	mov r0, sl
	adds r4, r0, r6
	ldr r0, [r3]
	asrs r0, r0, #8
	adds r1, r3, #0
	adds r1, #0x50
	movs r7, #0
	ldrsb r7, [r1, r7]
	adds r1, r0, r7
	cmp r4, r1
	bgt _0800C78C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r4, r0
	cmp r0, r1
	bge _0800C79E
	cmp r4, r1
	blt sub_800C4FC_return_0
_0800C78C:
	adds r0, r3, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r7
	adds r0, r1, r0
	cmp r0, r4
	blt sub_800C4FC_return_0
_0800C79E:
	mov r1, sb
	adds r4, r1, r2
	adds r0, r4, #0
	adds r0, #0x2d
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r0, [sp]
	adds r2, r0, r5
	ldr r0, [r3, #4]
	asrs r0, r0, #8
	movs r1, #0x51
	ldrsb r6, [r1, r3]
	adds r1, r0, r6
	cmp r2, r1
	bgt _0800C7D2
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r5
	adds r0, r2, r0
	cmp r0, r1
	bge _0800C7E4
	cmp r2, r1
	blt sub_800C4FC_return_0
_0800C7D2:
	adds r0, r3, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r6
	adds r0, r1, r0
	cmp r0, r2
	blt sub_800C4FC_return_0
_0800C7E4:
	ldr r0, _0800C834 @ =gGameMode
	ldrb r0, [r0]
_0800C7E8:
	cmp r0, #2
	bls sub_800C4FC_CreateAnimal
	bl sub_8019224
	movs r1, #3
	strb r1, [r0]
	mov r2, r8
	ldrh r1, [r2, #4]
	strb r1, [r0, #1]
	ldrh r1, [r2, #6]
	strb r1, [r0, #2]
	ldrb r1, [r2, #9]
	strb r1, [r0, #3]
sub_800C4FC_CreateAnimal:
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	ldr r1, [sp]
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateDustCloud
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateTrappedAnimal
	adds r0, r5, #0
	adds r1, r4, #0
	bl CreateEnemyDefeatScoreAndManageLives
	movs r0, #1
	b sub_800C4FC_return_1
	.align 2, 0
_0800C82C: .4byte gPlayer
_0800C830: .4byte gCheese
_0800C834: .4byte gGameMode
sub_800C4FC_return_0:
	movs r0, #0
sub_800C4FC_return_1:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
.syntax divided
