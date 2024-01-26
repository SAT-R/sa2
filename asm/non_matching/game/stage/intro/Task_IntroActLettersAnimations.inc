.include "constants/gba_constants.inc"
.syntax unified
.text

	push {r4, r5, r6, r7, lr}
	ldr r1, _080302D4 @ =gCurTask
	ldr r2, [r1]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r3, [r0]        @ r3 = counter
	adds r0, r3, #0
	subs r0, #0x97
	mov ip, r1
	cmp r0, #0x27
	bls _080302D8
	cmp r3, #0xc7
	bls _080303BA
	adds r0, r2, #0
	bl TaskDestroy
	b _080303BA
	.align 2, 0
_080302D4: .4byte gCurTask
_080302D8:
	subs r3, #0x96      @ r3 = counter -= 150
	cmp r3, #0xd    
	bhi _0803031C
	movs r4, #0
	ldr r7, _08030310 @ =gCurrentLevel
	ldr r0, _08030314 @ =IWRAM_START + 0x1A
	adds r1, r5, r0
	ldr r5, _08030318 @ =sScreenPositions_ZoneLoadingActLetters
	movs r6, #0
_080302EA:
	subs r2, r3, r6
	cmp r2, #3
	ble _080302F2
	movs r2, #4
_080302F2:
	lsls r2, r2, #3
	ldrh r0, [r5]
	strh r0, [r1]
	adds r0, r2, #0
	subs r0, #0x20
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r5, #4
	adds r6, #3
	adds r4, #1
	cmp r4, #3
	bls _080302EA
	b _08030378
	.align 2, 0
_08030310: .4byte gCurrentLevel
_08030314: .4byte IWRAM_START + 0x1A
_08030318: .4byte sScreenPositions_ZoneLoadingActLetters
_0803031C:
	cmp r3, #0x11
	bhi _0803035C
	subs r3, #0xd
	ldr r1, _0803034C @ =gUnknown_080D7130
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r4, #0
	ldr r7, _08030350 @ =gCurrentLevel
	ldr r0, _08030354 @ =IWRAM_START + 0x1A
	adds r1, r5, r0
	ldr r3, _08030358 @ =sScreenPositions_ZoneLoadingActLetters
_08030336:
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r2
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r3, #4
	adds r4, #1
	cmp r4, #3
	bls _08030336
	b _08030378
	.align 2, 0
_0803034C: .4byte gUnknown_080D7130
_08030350: .4byte gCurrentLevel
_08030354: .4byte IWRAM_START + 0x1A
_08030358: .4byte sScreenPositions_ZoneLoadingActLetters
_0803035C:
	movs r4, #0
	ldr r7, _080303C0 @ =gCurrentLevel
	ldr r2, _080303C4 @ =IWRAM_START + 0x1A
	adds r1, r5, r2
	ldr r2, _080303C8 @ =sScreenPositions_ZoneLoadingActLetters
_08030366:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	adds r1, #0x30
	adds r2, #4
	adds r4, #1
	cmp r4, #3
	bls _08030366
_08030378:
@ inline of sub_8030488
	ldrb r1, [r7]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080303BA
	lsls r0, r1, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #7
	beq _080303BA
	mov r1, ip
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r5, r0, r2
	movs r4, #0
_08030398:
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r0, [r0]
	subs r0, #0x96
	cmp r1, r0
	bhs _080303B0
	lsls r0, r1, #4
	adds r0, #4
	adds r0, r5, r0
	bl DisplaySprite
_080303B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08030398
_080303BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080303C0: .4byte gCurrentLevel
_080303C4: .4byte IWRAM_START + 0x1A
_080303C8: .4byte sScreenPositions_ZoneLoadingActLetters

.syntax divided
