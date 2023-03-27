.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807C18C
sub_807C18C: @ 0x0807C18C
	push {lr}
	adds r3, r0, #0
	adds r0, #0xc
	ldr r1, _0807C1B4 @ =0x00000249
	strh r1, [r0, #0xa]
	adds r2, r3, #0
	adds r2, #0x2c
	movs r1, #2
	strb r1, [r2]
	adds r2, #2
	movs r1, #0x10
	strb r1, [r2]
	bl sub_8004558
	ldr r0, _0807C1B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C1BC @ =Task_Interactable_SkyCanyon_SmallSpinnyWindmill
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C1B4: .4byte 0x00000249
_0807C1B8: .4byte gCurTask
_0807C1BC: .4byte Task_Interactable_SkyCanyon_SmallSpinnyWindmill

	thumb_func_start sub_807C1C0
sub_807C1C0: @ 0x0807C1C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl sub_8004558
	ldr r0, [r5, #0x40]
	ldr r2, _0807C204 @ =gCamera
	ldr r1, [r2]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0x44]
	ldr r1, [r2, #4]
	subs r0, r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	ldr r1, _0807C208 @ =0xFFFFF3FF
	ands r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	ldr r0, [r4, #0x10]
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte gCamera
_0807C208: .4byte 0xFFFFF3FF

	thumb_func_start sub_807C20C
sub_807C20C: @ 0x0807C20C
	push {lr}
	ldr r1, [r0, #0x40]
	ldr r3, _0807C250 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x44]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x8c
	lsls r0, r0, #0x12
	cmp r1, r0
	bhi _0807C24A
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C24A
	subs r1, #0x40
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C254
_0807C24A:
	movs r0, #1
	b _0807C256
	.align 2, 0
_0807C250: .4byte gCamera
_0807C254:
	movs r0, #0
_0807C256:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C25C
sub_807C25C: @ 0x0807C25C
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C270 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C270: .4byte gCurTask
