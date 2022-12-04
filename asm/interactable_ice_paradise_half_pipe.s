.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_IceParadise_HalfPipe
initSprite_Interactable_IceParadise_HalfPipe: @ 0x0807868C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x1c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807871C @ =sub_8078940
	ldr r2, _08078720 @ =0x00002010
	ldr r1, _08078724 @ =sub_8078978
	str r1, [sp]
	movs r1, #0x20
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
	strh r7, [r3, #0x14]
	lsls r4, r4, #8
	ldrb r0, [r6]
	lsls r0, r0, #3
	adds r4, r4, r0
	str r4, [r3]
	lsls r5, r5, #8
	ldrb r0, [r6, #1]
	lsls r0, r0, #3
	adds r5, r5, r0
	str r5, [r3, #4]
	movs r1, #3
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	strh r1, [r3, #0xc]
	movs r2, #4
	ldrsb r2, [r6, r2]
	lsls r2, r2, #3
	strh r2, [r3, #0xe]
	ldrb r0, [r6, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #0x10]
	ldrb r0, [r6, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #0x12]
	str r6, [r3, #0x18]
	ldrb r0, [r6]
	strb r0, [r3, #0x1c]
	mov r1, r8
	strb r1, [r3, #0x1d]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807871C: .4byte sub_8078940
_08078720: .4byte 0x00002010
_08078724: .4byte sub_8078978

	thumb_func_start sub_8078728
sub_8078728: @ 0x08078728
	push {r4, r5, lr}
	ldr r0, _0807874C @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r5, _08078750 @ =gPlayer
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08078758
	ldr r0, _08078754 @ =0xFFFF7FFF
	ands r1, r0
	str r1, [r5, #0x20]
	b _0807877E
	.align 2, 0
_0807874C: .4byte gCurTask
_08078750: .4byte gPlayer
_08078754: .4byte 0xFFFF7FFF
_08078758:
	adds r0, r4, #0
	bl sub_80789AC
	cmp r0, #0
	bne _0807878C
	ldr r0, [r5, #0x20]
	ldr r1, _08078788 @ =0xFFFF7FFF
	ands r0, r1
	str r0, [r5, #0x20]
	adds r1, r5, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #0x3b
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _0807877E
	movs r0, #9
	strh r0, [r1]
_0807877E:
	adds r0, r4, #0
	bl sub_8078998
	b _080787BE
	.align 2, 0
_08078788: .4byte 0xFFFF7FFF
_0807878C:
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r5, #0x20]
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _080787A8
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r4]
	ldrh r2, [r4, #0xc]
	adds r1, r1, r2
	b _080787B2
_080787A8:
	ldr r0, [r4]
	ldrh r1, [r4, #0x10]
	adds r0, r0, r1
	ldr r1, [r5, #8]
	asrs r1, r1, #8
_080787B2:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r4, #0
	bl sub_80787C4
_080787BE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80787C4
sub_80787C4: @ 0x080787C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #6
	movs r2, #0x10
	ldrsh r1, [r5, r2]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _080787F4
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	cmp r0, r2
	ble _080787F0
	adds r1, r2, #0
_080787F0:
	adds r0, r1, #0
	b _080787F6
_080787F4:
	movs r0, #0
_080787F6:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r2, _08078894 @ =0x000003FF
	adds r0, r2, #0
	ands r4, r0
	ldr r6, _08078898 @ =gPlayer
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bge _08078812
	rsbs r0, r0, #0
_08078812:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08078826
	adds r2, r1, #0
_08078826:
	lsls r0, r2, #0x10
	asrs r0, r0, #8
	bl __divsi3
	movs r2, #0x12
	ldrsh r1, [r5, r2]
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	subs r1, #0x10
	asrs r3, r1, #1
	ldr r2, _0807889C @ =gSineTable
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	adds r2, r3, #0
	muls r2, r1, r2
	lsls r1, r3, #8
	adds r2, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r2, r0, #8
	ldr r0, [r5, #8]
	subs r0, r0, r2
	str r0, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #0x12]
	ldr r0, [r6, #0x20]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x20]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080788C0
	movs r0, #0x12
	ldrsh r1, [r5, r0]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0x1f
	bgt _080788A0
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #9
	b _080788BE
	.align 2, 0
_08078894: .4byte 0x000003FF
_08078898: .4byte gPlayer
_0807889C: .4byte gSineTable
_080788A0:
	cmp r3, #0x5f
	bgt _080788AC
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x3b
	b _080788BE
_080788AC:
	cmp r3, #0x9f
	bgt _080788B8
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x3c
	b _080788BE
_080788B8:
	adds r1, r6, #0
	adds r1, #0x64
	movs r0, #0x3d
_080788BE:
	strh r0, [r1]
_080788C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_80788C8
sub_80788C8: @ 0x080788C8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _08078930 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08078934 @ =gPlayer
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xc
	ldrsh r3, [r5, r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08078938
	movs r7, #0x10
	ldrsh r0, [r5, r7]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _08078938
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xe
	ldrsh r2, [r5, r1]
	adds r3, r0, r2
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r3, r1
	bgt _08078938
	movs r4, #0x12
	ldrsh r0, [r5, r4]
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _08078938
	movs r0, #1
	b _0807893A
	.align 2, 0
_08078930: .4byte gCamera
_08078934: .4byte gPlayer
_08078938:
	movs r0, #0
_0807893A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_8078940
sub_8078940: @ 0x08078940
	push {r4, lr}
	ldr r0, _08078974 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8078A60
	cmp r0, #0
	beq _0807895E
	adds r0, r4, #0
	bl sub_807897C
_0807895E:
	adds r0, r4, #0
	bl sub_80789FC
	cmp r0, #0
	beq _0807896E
	adds r0, r4, #0
	bl sub_8078AC4
_0807896E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078974: .4byte gCurTask

	thumb_func_start sub_8078978
sub_8078978: @ 0x08078978
	bx lr
	.align 2, 0

	thumb_func_start sub_807897C
sub_807897C: @ 0x0807897C
	ldr r1, _0807898C @ =gPlayer
	ldr r1, [r1, #0xc]
	str r1, [r0, #8]
	ldr r0, _08078990 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08078994 @ =sub_8078728
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807898C: .4byte gPlayer
_08078990: .4byte gCurTask
_08078994: .4byte sub_8078728

	thumb_func_start sub_8078998
sub_8078998: @ 0x08078998
	ldr r0, _080789A4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080789A8 @ =sub_8078940
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_080789A4: .4byte gCurTask
_080789A8: .4byte sub_8078940

	thumb_func_start sub_80789AC
sub_80789AC: @ 0x080789AC
	push {lr}
	adds r3, r0, #0
	ldr r2, _080789DC @ =gPlayer
	ldr r1, _080789E0 @ =0x000001FF
	adds r0, r1, #0
	ldrh r1, [r2, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _080789E4 @ =0x043E0000
	cmp r0, r1
	bls _080789F4
	adds r1, r2, #0
	adds r1, #0x5e
	ldr r0, _080789E8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _080789EC
	adds r0, r3, #0
	bl sub_80788C8
	b _080789F6
	.align 2, 0
_080789DC: .4byte gPlayer
_080789E0: .4byte 0x000001FF
_080789E4: .4byte 0x043E0000
_080789E8: .4byte gPlayerControls
_080789EC:
	adds r1, r2, #0
	adds r1, #0x6d
	movs r0, #3
	strb r0, [r1]
_080789F4:
	movs r0, #0
_080789F6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_80789FC
sub_80789FC: @ 0x080789FC
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldr r1, _08078A54 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #4]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #0x10
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08078A4E
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08078A4E
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x12
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _08078A4E
	movs r2, #0xe
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _08078A58
_08078A4E:
	movs r0, #1
	b _08078A5A
	.align 2, 0
_08078A54: .4byte gCamera
_08078A58:
	movs r0, #0
_08078A5A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_8078A60
sub_8078A60: @ 0x08078A60
	push {lr}
	adds r3, r0, #0
	ldr r1, _08078A94 @ =gPlayer
	ldr r2, [r1, #0x20]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08078AA2
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	bne _08078AA2
	adds r0, r1, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	beq _08078A88
	cmp r0, #9
	bne _08078AA2
_08078A88:
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _08078A98
	cmp r0, #1
	beq _08078AAC
	b _08078AB6
	.align 2, 0
_08078A94: .4byte gPlayer
_08078A98:
	movs r0, #0x10
	ldrsh r1, [r1, r0]
	ldr r0, _08078AA8 @ =0x0000023F
	cmp r1, r0
	bgt _08078AB6
_08078AA2:
	movs r0, #0
	b _08078ABC
	.align 2, 0
_08078AA8: .4byte 0x0000023F
_08078AAC:
	movs r2, #0x10
	ldrsh r1, [r1, r2]
	ldr r0, _08078AC0 @ =0xFFFFFDC0
	cmp r1, r0
	bgt _08078AA2
_08078AB6:
	adds r0, r3, #0
	bl sub_80788C8
_08078ABC:
	pop {r1}
	bx r1
	.align 2, 0
_08078AC0: .4byte 0xFFFFFDC0

	thumb_func_start sub_8078AC4
sub_8078AC4: @ 0x08078AC4
	push {lr}
	ldr r1, [r0, #0x18]
	ldrb r0, [r0, #0x1c]
	strb r0, [r1]
	ldr r0, _08078AD8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_08078AD8: .4byte gCurTask

	thumb_func_start initSprite_Interactable_IceParadise_HalfPipe_End
initSprite_Interactable_IceParadise_HalfPipe_End: @ 0x08078ADC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #1
	str r4, [sp]
	bl initSprite_Interactable_IceParadise_HalfPipe
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start initSprite_Interactable_IceParadise_HalfPipe_Start
initSprite_Interactable_IceParadise_HalfPipe_Start: @ 0x08078AFC
	push {r4, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0
	str r4, [sp]
	bl initSprite_Interactable_IceParadise_HalfPipe
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
