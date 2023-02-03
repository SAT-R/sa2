.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_8080368
initSprite_8080368: @ 0x08080368
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r6, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r0, _080803F4 @ =Task_80806F4
	ldr r2, _080803F8 @ =0x00002010
	movs r5, #0
	str r5, [sp]
	movs r1, #0x24
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r2, r0
	str r5, [r2, #0x14]
	strh r5, [r2, #0x18]
	strh r5, [r2, #0x1a]
	str r5, [r2, #0x1c]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r4, r4, #8
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r2, #4]
	movs r4, #3
	ldrsb r4, [r1, r4]
	lsls r4, r4, #3
	strh r4, [r2, #8]
	movs r3, #4
	ldrsb r3, [r1, r3]
	lsls r3, r3, #3
	strh r3, [r2, #0xa]
	ldrb r1, [r1, #5]
	lsls r1, r1, #3
	adds r1, r4, r1
	strh r1, [r2, #0xc]
	mov r5, r8
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	subs r1, r1, r4
	strh r1, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x12]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080803F4: .4byte Task_80806F4
_080803F8: .4byte 0x00002010

	thumb_func_start sub_80803FC
sub_80803FC: @ 0x080803FC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #8
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	blt _08080412
	b _08080510
_08080412:
	ldr r0, _08080454 @ =gPlayer
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	adds r1, r2, r1
	lsls r1, r1, #8
	ldr r0, [r0, #8]
	cmp r0, r1
	ble _08080510
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _080804F8
	ldrh r0, [r5, #0x18]
	adds r2, r0, #1
	strh r2, [r5, #0x18]
	movs r0, #0x1a
	ldrsh r1, [r5, r0]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bge _08080502
	strh r2, [r5, #0x1a]
	ldr r0, _08080458 @ =gUnknown_030053E4
	ldr r0, [r0]
	ldr r1, [r5, #0x14]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0xe1
	lsls r0, r0, #3
	cmp r7, r0
	bls _0808045C
	movs r1, #5
	b _08080468
	.align 2, 0
_08080454: .4byte gPlayer
_08080458: .4byte gUnknown_030053E4
_0808045C:
	movs r0, #0x96
	lsls r0, r0, #3
	movs r1, #0xf
	cmp r7, r0
	bls _08080468
	movs r1, #0xa
_08080468:
	ldr r2, _080804D8 @ =gCourseTime
	ldrh r6, [r2]
	adds r0, r1, r6
	strh r0, [r2]
	ldr r0, _080804DC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x1d
	beq _080804AE
	ldrh r0, [r2]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _080804AE
	ldr r0, _080804E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _080804AE
	ldr r1, _080804E4 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xff
	bls _080804A6
	movs r0, #0xff
_080804A6:
	strb r0, [r1]
	ldr r1, _080804E8 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_080804AE:
	ldr r0, _080804E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080804C2
	ldr r1, _080804D8 @ =gCourseTime
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _080804C2
	movs r0, #0xff
	strh r0, [r1]
_080804C2:
	ldr r0, _080804EC @ =0x0000019B
	bl m4aSongNumStart
	bl InitSprite_Notif_RingBonus
	ldr r0, _080804F0 @ =gUnknown_030053E4
	ldr r0, [r0]
	str r0, [r5, #0x14]
	ldr r0, _080804F4 @ =gUnknown_03005B6C
	str r7, [r0]
	b _08080502
	.align 2, 0
_080804D8: .4byte gCourseTime
_080804DC: .4byte gCurrentLevel
_080804E0: .4byte gGameMode
_080804E4: .4byte gNumLives
_080804E8: .4byte gUnknown_030054A8
_080804EC: .4byte 0x0000019B
_080804F0: .4byte gUnknown_030053E4
_080804F4: .4byte gUnknown_03005B6C
_080804F8:
	movs r0, #1
	str r0, [r5, #0x1c]
	ldr r0, _08080508 @ =gUnknown_030053E4
	ldr r0, [r0]
	str r0, [r5, #0x14]
_08080502:
	ldr r0, _0808050C @ =gPlayer
	ldr r0, [r0, #8]
	b _0808053E
	.align 2, 0
_08080508: .4byte gUnknown_030053E4
_0808050C: .4byte gPlayer
_08080510:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	ldr r2, [r5]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r5, #0x20]
	cmp r1, r0
	ble _08080540
	ldr r3, _08080550 @ =gPlayer
	movs r1, #8
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r0, r0, #8
	ldr r1, [r3, #8]
	cmp r1, r0
	bge _08080540
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0808053C
	ldrh r0, [r5, #0x18]
	subs r0, #1
	strh r0, [r5, #0x18]
_0808053C:
	ldr r0, [r3, #8]
_0808053E:
	str r0, [r5, #0x20]
_08080540:
	ldr r0, _08080554 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08080558 @ =Task_80806F4
	str r0, [r1, #8]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080550: .4byte gPlayer
_08080554: .4byte gCurTask
_08080558: .4byte Task_80806F4

	thumb_func_start sub_808055C
sub_808055C: @ 0x0808055C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, [r5]
	ldr r1, _080805C0 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #4]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080805C4 @ =gPlayer
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r0, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r4, #8
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080805C8
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	adds r0, r2, r0
	cmp r1, r0
	bgt _080805C8
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	adds r0, r2, r0
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _080805C8
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	adds r0, r2, r0
	cmp r1, r0
	bgt _080805C8
	movs r0, #1
	b _080805CA
	.align 2, 0
_080805C0: .4byte gCamera
_080805C4: .4byte gPlayer
_080805C8:
	movs r0, #0
_080805CA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

@# -------------------------------------------------------

	thumb_func_start sub_80805D0
sub_80805D0: @ 0x080805D0
	push {r4, lr}
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _08080652
	ldr r0, _080805F8 @ =gPlayer
	ldr r2, [r0, #8]
	ldr r1, _080805FC @ =0x0000EFFF
	adds r3, r0, #0
	cmp r2, r1
	bgt _08080604
	ldr r1, [r3, #0xc]
	ldr r0, _08080600 @ =0x00011FFF
	cmp r1, r0
	bgt _08080604
	movs r2, #0xb4
	lsls r2, r2, #0xb
	movs r4, #0xd8
	lsls r4, r4, #0xa
	b _0808061C
	.align 2, 0
_080805F8: .4byte gPlayer
_080805FC: .4byte 0x0000EFFF
_08080600: .4byte 0x00011FFF
_08080604:
	ldr r1, [r3, #8]
	movs r0, #0xd2
	lsls r0, r0, #0xb
	cmp r1, r0
	ble _08080652
	ldr r1, [r3, #0xc]
	movs r0, #0xd8
	lsls r0, r0, #0xa
	cmp r1, r0
	ble _08080652
	ldr r2, _08080658 @ =0xFFFA6000
	ldr r4, _0808065C @ =0xFFFCA000
_0808061C:
	ldr r0, [r3, #8]
	adds r0, r0, r2
	str r0, [r3, #8]
	ldr r0, [r3, #0xc]
	adds r0, r0, r4
	str r0, [r3, #0xc]
	asrs r2, r2, #8
	asrs r4, r4, #8
	ldr r1, _08080660 @ =gCamera
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
	ldr r0, [r1, #0x20]
	adds r0, r0, r2
	str r0, [r1, #0x20]
	ldr r0, [r1, #0x10]
	adds r0, r0, r2
	str r0, [r1, #0x10]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #0x24]
	adds r0, r0, r4
	str r0, [r1, #0x24]
	ldr r0, [r1, #0x14]
	adds r0, r0, r4
	str r0, [r1, #0x14]
_08080652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080658: .4byte 0xFFFA6000
_0808065C: .4byte 0xFFFCA000
_08080660: .4byte gCamera

.if 0
.endif
