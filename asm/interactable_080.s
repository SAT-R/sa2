.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Task_Interactable080
Task_Interactable080: @ 0x0807B274
	push {r4, lr}
	ldr r0, _0807B2A4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_807B1F0
	cmp r0, #0
	beq _0807B292
	adds r0, r4, #0
	bl sub_807B2D0
_0807B292:
	adds r0, r4, #0
	bl sub_807B190
	cmp r0, #0
	beq _0807B2A8
	adds r0, r4, #0
	bl sub_807B398
	b _0807B2B4
	.align 2, 0
_0807B2A4: .4byte gCurTask
_0807B2A8:
	adds r0, r4, #0
	bl sub_807B318
	adds r0, r4, #0
	bl sub_807B350
_0807B2B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TaskDestructor_Interactable080
TaskDestructor_Interactable080: @ 0x0807B2BC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start sub_807B2D0
sub_807B2D0: @ 0x0807B2D0
	push {r4, lr}
	ldr r2, _0807B308 @ =gPlayer
	movs r1, #0x6d
	adds r1, r1, r2
	mov ip, r1
	movs r3, #0
	movs r1, #0xe
	mov r4, ip
	strb r1, [r4]
	adds r2, #0x6e
	strb r3, [r2]
	movs r1, #0x96
	lsls r1, r1, #2
	strh r1, [r0, #0x16]
	adds r0, #0x2c
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807B30C @ =0x00000129
	bl m4aSongNumStart
	ldr r0, _0807B310 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807B314 @ =sub_807B3B0
	str r0, [r1, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B308: .4byte gPlayer
_0807B30C: .4byte 0x00000129
_0807B310: .4byte gCurTask
_0807B314: .4byte sub_807B3B0

	thumb_func_start sub_807B318
sub_807B318: @ 0x0807B318
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0807B348 @ =gSineTable
	adds r2, r3, #0
	adds r2, #0x48
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	adds r1, r3, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r3, _0807B34C @ =0x000003FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0807B348: .4byte gSineTable
_0807B34C: .4byte 0x000003FF

	thumb_func_start sub_807B350
sub_807B350: @ 0x0807B350
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0xc
	ldr r1, [r3, #0x3c]
	ldr r2, _0807B394 @ =gCamera
	ldr r0, [r2]
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x44
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x16]
	ldr r1, [r3, #0x40]
	ldr r0, [r2, #4]
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x46
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	adds r1, r1, r0
	strh r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B394: .4byte gCamera

	thumb_func_start sub_807B398
sub_807B398: @ 0x0807B398
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807B3AC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807B3AC: .4byte gCurTask

	thumb_func_start sub_807B3B0
sub_807B3B0: @ 0x0807B3B0
	push {lr}
	ldr r0, _0807B3D4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0807B3D8
	adds r0, r2, #0
	bl sub_807B398
	b _0807B3DE
	.align 2, 0
_0807B3D4: .4byte gCurTask
_0807B3D8:
	adds r0, r2, #0
	bl sub_807B350
_0807B3DE:
	pop {r0}
	bx r0
	.align 2, 0
