.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.arm
.syntax unified
.text

.if 0
.endif

	thumb_func_start Task_80302AC
Task_80302AC: @ 0x080302AC
	push {r4, r5, r6, r7, lr}
	ldr r1, _080302D4 @ =gCurTask
	ldr r2, [r1]
	ldrh r5, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r3, [r0]
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
	subs r3, #0x96
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

	thumb_func_start TaskDestructor_80303CC
TaskDestructor_80303CC: @ 0x080303CC
	push {lr}
	ldr r0, _080303F4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080303DE
	bl sub_8011328
_080303DE:
	ldr r0, _080303F8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080303F0
	ldr r2, _080303FC @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08030400 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
_080303F0:
	pop {r0}
	bx r0
	.align 2, 0
_080303F4: .4byte gCurrentLevel
_080303F8: .4byte gGameMode
_080303FC: .4byte gUnknown_03005424
_08030400: .4byte 0x0000FFDF

	thumb_func_start Task_UpdateStageLoadingScreen
Task_UpdateStageLoadingScreen: @ 0x08030404
	push {r4, lr}
	ldr r0, _08030444 @ =gCurTask
	ldr r4, [r0]
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	ldr r2, _08030448 @ =gBgPalette
	ldr r1, _0803044C @ =sZoneLoadingCharacterColors
	ldr r0, _08030450 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r2, _08030454 @ =gFlags
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	cmp r3, #0xc7
	bls _0803043E
	adds r0, r4, #0
	bl TaskDestroy
_0803043E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030444: .4byte gCurTask
_08030448: .4byte gBgPalette
_0803044C: .4byte sZoneLoadingCharacterColors
_08030450: .4byte gSelectedCharacter
_08030454: .4byte gFlags

	thumb_func_start TaskDestructor_nop_8030458
TaskDestructor_nop_8030458: @ 0x08030458
	bx lr
	.align 2, 0

	thumb_func_start TaskDestructor_803045C
TaskDestructor_803045C: @ 0x0803045C
	push {lr}
	ldrh r0, [r0, #6]
	ldr r1, _08030470 @ =IWRAM_START + 0x1B8
	adds r0, r0, r1
	ldr r0, [r0]
	bl VramFree
	pop {r0}
	bx r0
	.align 2, 0
_08030470: .4byte IWRAM_START + 0x1B8

	thumb_func_start TaskDestructor_8030474
TaskDestructor_8030474: @ 0x08030474
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #8]
	bl VramFree
	pop {r0}
	bx r0

    @ inline
	thumb_func_start sub_8030488
sub_8030488: @ 0x08030488
	push {r4, r5, lr}
	ldr r0, _080304D4 @ =gCurrentLevel
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080304CE
	lsls r0, r1, #0x18
	asrs r0, r0, #0x1a
	cmp r0, #7
	beq _080304CE
	ldr r0, _080304D8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	movs r4, #0
_080304AC:
	lsls r0, r4, #1
	adds r1, r0, r4
	ldr r0, [r5]
	ldr r0, [r0]
	subs r0, #0x96
	cmp r1, r0
	bhs _080304C4
	lsls r0, r1, #4
	adds r0, #4
	adds r0, r5, r0
	bl DisplaySprite
_080304C4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _080304AC
_080304CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080304D4: .4byte gCurrentLevel
_080304D8: .4byte gCurTask
