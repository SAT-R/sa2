.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 00
.endif

	thumb_func_start Task_Interactable_MusicPlant_GuitarString
Task_Interactable_MusicPlant_GuitarString: @ 0x08076204
	push {r4, r5, r6, lr}
	ldr r6, _08076240 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_807618C
	cmp r0, #0
	beq _08076222
	adds r0, r4, #0
	bl sub_807608C
_08076222:
	adds r0, r4, #0
	bl sub_8076320
	cmp r0, #0
	beq _08076248
	ldr r1, [r4, #0x30]
	ldr r2, _08076244 @ =IWRAM_START + 0x38
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r6]
	bl TaskDestroy
	b _0807624E
	.align 2, 0
_08076240: .4byte gCurTask
_08076244: .4byte IWRAM_START + 0x38
_08076248:
	adds r0, r4, #0
	bl sub_8076114
_0807624E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable_MusicPlant_GuitarString
TaskDestructor_Interactable_MusicPlant_GuitarString: @ 0x08076254
	bx lr
	.align 2, 0

	thumb_func_start sub_8076258
sub_8076258: @ 0x08076258
	push {r4, lr}
	ldr r4, _08076298 @ =gPlayer
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08076288
	bl Player_ClearMovestate_IsInScriptedSequence
	ldr r0, [r4, #0x20]
	ldr r1, _0807629C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x20]
	adds r1, r4, #0
	adds r1, #0x6d
	movs r0, #5
	strb r0, [r1]
	ldrh r0, [r4, #0x12]
	rsbs r0, r0, #0
	strh r0, [r4, #0x12]
	movs r0, #0xa2
	lsls r0, r0, #1
	bl m4aSongNumStart
_08076288:
	ldr r0, _080762A0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080762A4 @ =sub_8076000
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076298: .4byte gPlayer
_0807629C: .4byte 0xFFBFFFFF
_080762A0: .4byte gCurTask
_080762A4: .4byte sub_8076000

	thumb_func_start sub_80762A8
sub_80762A8: @ 0x080762A8
	ldr r0, _080762B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080762B8 @ =Task_Interactable_MusicPlant_GuitarString
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080762B4: .4byte gCurTask
_080762B8: .4byte Task_Interactable_MusicPlant_GuitarString

	thumb_func_start sub_80762BC
sub_80762BC: @ 0x080762BC
	push {lr}
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_080762C4:
	lsls r0, r1, #3
	adds r0, r2, r0
	strh r3, [r0, #2]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #5
	bls _080762C4
	adds r0, r2, #0
	bl sub_807608C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80762E0
sub_80762E0: @ 0x080762E0
	push {lr}
	adds r3, r0, #0
	ldr r2, _0807630C @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807631A
	ldr r0, [r3, #0x6c]
	adds r0, #0x18
	lsls r1, r0, #8
	ldr r0, [r2, #8]
	cmp r0, r1
	beq _0807631A
	cmp r0, r1
	ble _08076310
	subs r0, #0x80
	str r0, [r2, #8]
	cmp r0, r1
	bge _0807631A
	b _08076318
	.align 2, 0
_0807630C: .4byte gPlayer
_08076310:
	adds r0, #0x80
	str r0, [r2, #8]
	cmp r0, r1
	ble _0807631A
_08076318:
	str r1, [r2, #8]
_0807631A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8076320
sub_8076320: @ 0x08076320
	push {lr}
	ldr r1, [r0, #0x6c]
	ldr r3, _0807635C @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x70]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x82
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _08076358
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08076358
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08076360
_08076358:
	movs r0, #1
	b _08076362
	.align 2, 0
_0807635C: .4byte gCamera
_08076360:
	movs r0, #0
_08076362:
	pop {r1}
	bx r1
	.align 2, 0
