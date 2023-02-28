.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_807AE60
sub_807AE60: @ 0x0807AE60
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0807AEA0 @ =gPlayer
	ldr r4, [r5, #0x20]
	movs r0, #0x80
	ands r4, r0
	cmp r4, #0
	bne _0807AF02
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	adds r3, r5, #0
	bl sub_800CCB8
	adds r1, r0, #0
	cmp r1, #0
	beq _0807AF02
	movs r2, #0x80
	lsls r2, r2, #9
	ands r2, r1
	cmp r2, #0
	beq _0807AEA4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r4, [r5, #0x12]
	movs r0, #2
	b _0807AF04
	.align 2, 0
_0807AEA0: .4byte gPlayer
_0807AEA4:
	movs r3, #0x80
	lsls r3, r3, #0xb
	ands r3, r1
	cmp r3, #0
	beq _0807AEC6
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r2, [r5, #0x10]
	movs r0, #1
	b _0807AF04
_0807AEC6:
	movs r2, #0x80
	lsls r2, r2, #0xc
	ands r2, r1
	cmp r2, #0
	beq _0807AEE8
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r5, #8]
	adds r0, r0, r1
	str r0, [r5, #8]
	strh r3, [r5, #0x10]
	movs r0, #3
	b _0807AF04
_0807AEE8:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AF02
	lsls r1, r1, #0x18
	asrs r1, r1, #0x10
	ldr r0, [r5, #0xc]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	strh r2, [r5, #0x12]
	movs r0, #4
	b _0807AF04
_0807AF02:
	movs r0, #0
_0807AF04:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807AF0C
sub_807AF0C: @ 0x0807AF0C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, _0807AF5C @ =gPlayer
	ldr r0, [r3, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807AF8A
	adds r5, r2, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #0x10
	strb r0, [r5]
	adds r4, r2, #0
	adds r4, #0x3b
	ldrb r0, [r4]
	adds r0, #0x10
	strb r0, [r4]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r1, [r2, #0x3c]
	ldr r2, [r2, #0x40]
	bl sub_800CDBC
	adds r1, r0, #0
	ldrb r0, [r5]
	adds r0, #0x10
	strb r0, [r5]
	ldrb r0, [r4]
	subs r0, #0x10
	strb r0, [r4]
	cmp r1, #0
	beq _0807AF8A
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0807AF60
	movs r0, #2
	b _0807AF8C
	.align 2, 0
_0807AF5C: .4byte gPlayer
_0807AF60:
	movs r0, #0x80
	lsls r0, r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0807AF6E
	movs r0, #1
	b _0807AF8C
_0807AF6E:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0807AF7C
	movs r0, #3
	b _0807AF8C
_0807AF7C:
	movs r0, #0x80
	lsls r0, r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0807AF8A
	movs r0, #4
	b _0807AF8C
_0807AF8A:
	movs r0, #0
_0807AF8C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Task_Interactable078
Task_Interactable078: @ 0x0807AF94
	push {r4, lr}
	ldr r0, _0807AFDC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0
	bl sub_807ACF4
	adds r0, r4, #0
	bl sub_807AE60
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0807AFCA
	adds r0, r4, #0
	bl sub_807AF0C
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0807AFCA
	ldr r0, _0807AFE0 @ =gPlayer
	bl sub_800CBA4
_0807AFCA:
	adds r0, r4, #0
	bl sub_807B028
	cmp r0, #0
	beq _0807AFE4
	adds r0, r4, #0
	bl sub_807B070
	b _0807AFEA
	.align 2, 0
_0807AFDC: .4byte gCurTask
_0807AFE0: .4byte gPlayer
_0807AFE4:
	adds r0, r4, #0
	bl sub_807B004
_0807AFEA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_Interactable078
TaskDestructor_Interactable078: @ 0x0807AFF0
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807B004
sub_807B004: @ 0x0807B004
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B024 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r1, r1, r2
	strh r1, [r0, #0x24]
	adds r0, #0xc
	bl sub_80051E8
	pop {r0}
	bx r0
	.align 2, 0
_0807B024: .4byte gCamera

	thumb_func_start sub_807B028
sub_807B028: @ 0x0807B028
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807B064 @ =gCamera
	ldr r2, [r3]
	subs r1, r1, r2
	ldr r0, [r0, #0x40]
	ldr r2, [r3, #4]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0807B060
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807B060
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807B068
_0807B060:
	movs r0, #1
	b _0807B06A
	.align 2, 0
_0807B064: .4byte gCamera
_0807B068:
	movs r0, #0
_0807B06A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807B070
sub_807B070: @ 0x0807B070
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807B084 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807B084: .4byte gCurTask
