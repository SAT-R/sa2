.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start Task_Interactable085
Task_Interactable085: @ 0x0807C274
	push {r4, lr}
	ldr r0, _0807C2C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r3, _0807C2C8 @ =gSineTable
	adds r0, #0x49
	adds r2, r1, r0
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #1
	ldr r3, _0807C2CC @ =IWRAM_START + 0x46
	adds r1, r1, r3
	strh r0, [r1]
	ldrb r0, [r2]
	adds r0, #2
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_807C424
	cmp r0, #0
	beq _0807C2B2
	adds r0, r4, #0
	bl sub_807C4A0
_0807C2B2:
	adds r0, r4, #0
	bl sub_807C598
	cmp r0, #0
	beq _0807C2D0
	adds r0, r4, #0
	bl sub_807C5E0
	b _0807C2DA
	.align 2, 0
_0807C2C4: .4byte gCurTask
_0807C2C8: .4byte gSineTable
_0807C2CC: .4byte IWRAM_START + 0x46
_0807C2D0:
	bl sub_807C614
	adds r0, r4, #0
	bl sub_807C558
_0807C2DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_807C2E0
sub_807C2E0: @ 0x0807C2E0
	push {r4, r5, lr}
	ldr r0, _0807C328 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0807C32C @ =gSineTable
	adds r0, #0x49
	adds r4, r1, r0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	ldr r2, _0807C330 @ =IWRAM_START + 0x46
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_807C52C
	ldrb r1, [r4]
	movs r0, #0x40
	subs r0, r0, r1
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807C334
	cmp r0, #6
	ble _0807C336
	movs r1, #6
	b _0807C336
	.align 2, 0
_0807C328: .4byte gCurTask
_0807C32C: .4byte gSineTable
_0807C330: .4byte IWRAM_START + 0x46
_0807C334:
	movs r1, #4
_0807C336:
	adds r2, r5, #0
	adds r2, #0x49
	ldrb r0, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _0807C34E
	adds r0, r5, #0
	bl sub_807C4EC
_0807C34E:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C360
sub_807C360: @ 0x0807C360
	push {r4, lr}
	ldr r0, _0807C388 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r3, r0
	adds r0, #0x49
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x80
	bne _0807C38C
	adds r0, r4, #0
	bl sub_807C504
	b _0807C3C4
	.align 2, 0
_0807C388: .4byte gCurTask
_0807C38C:
	cmp r0, #0x80
	bls _0807C3AC
	ldr r1, _0807C3A8 @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	b _0807C3BE
	.align 2, 0
_0807C3A8: .4byte gSineTable
_0807C3AC:
	ldr r1, _0807C3D4 @ =gSineTable
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r1, r0, #1
	adds r1, r1, r0
_0807C3BE:
	ldr r2, _0807C3D8 @ =IWRAM_START + 0x46
	adds r0, r3, r2
	strh r1, [r0]
_0807C3C4:
	bl sub_807C614
	adds r0, r4, #0
	bl sub_807C558
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C3D4: .4byte gSineTable
_0807C3D8: .4byte IWRAM_START + 0x46

	thumb_func_start sub_807C3DC
sub_807C3DC: @ 0x0807C3DC
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807C40C @ =gPlayer
	adds r0, #0x5e
	ldr r1, _0807C410 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807C41E
	adds r2, r3, #0
	adds r2, #0x48
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807C41E
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807C414
	movs r0, #1
	b _0807C41A
	.align 2, 0
_0807C40C: .4byte gPlayer
_0807C410: .4byte gPlayerControls
_0807C414:
	movs r0, #0xfe
	ands r0, r1
	movs r1, #2
_0807C41A:
	orrs r0, r1
	strb r0, [r2]
_0807C41E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_807C424
sub_807C424: @ 0x0807C424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0807C490 @ =gPlayer
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807C498
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0807C498
	ldr r2, [r4, #0x3c]
	ldr r1, _0807C494 @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r4, #0x40]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r2, #0
	subs r0, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r0, r1
	bgt _0807C498
	adds r0, #0x28
	cmp r0, r1
	blt _0807C498
	lsls r0, r6, #0x10
	asrs r3, r0, #0x10
	adds r1, r3, #0
	subs r1, #0xc
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bgt _0807C498
	adds r0, r3, #0
	adds r0, #0xc
	cmp r0, r2
	blt _0807C498
	movs r0, #1
	b _0807C49A
	.align 2, 0
_0807C490: .4byte gPlayer
_0807C494: .4byte gCamera
_0807C498:
	movs r0, #0
_0807C49A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_807C4A0
sub_807C4A0: @ 0x0807C4A0
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807C4DC @ =gPlayer
	adds r1, r3, #0
	adds r1, #0x6d
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x48
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r0, _0807C4E0 @ =0x0000FA80
	strh r0, [r3, #0x12]
	adds r0, r2, #0
	adds r0, #0x49
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	movs r0, #0x8e
	lsls r0, r0, #1
	bl m4aSongNumStart
	ldr r0, _0807C4E4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C4E8 @ =sub_807C2E0
	str r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_0807C4DC: .4byte gPlayer
_0807C4E0: .4byte 0x0000FA80
_0807C4E4: .4byte gCurTask
_0807C4E8: .4byte sub_807C2E0

	thumb_func_start sub_807C4EC
sub_807C4EC: @ 0x0807C4EC
	adds r0, #0x49
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0807C4FC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C500 @ =sub_807C6E4
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C4FC: .4byte gCurTask
_0807C500: .4byte sub_807C6E4

	thumb_func_start sub_807C504
sub_807C504: @ 0x0807C504
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x49
	strb r2, [r0]
	ldr r0, _0807C524 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C528 @ =Task_Interactable085
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C524: .4byte gCurTask
_0807C528: .4byte Task_Interactable085

	thumb_func_start sub_807C52C
sub_807C52C: @ 0x0807C52C
	push {lr}
	adds r3, r0, #0
	ldr r0, _0807C550 @ =gPlayer
	adds r0, #0x5e
	ldr r1, _0807C554 @ =gPlayerControls
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0807C54C
	adds r2, r3, #0
	adds r2, #0x48
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
_0807C54C:
	pop {r0}
	bx r0
	.align 2, 0
_0807C550: .4byte gPlayer
_0807C554: .4byte gPlayerControls

	thumb_func_start sub_807C558
sub_807C558: @ 0x0807C558
	push {r4, lr}
	adds r4, r0, #0
	bl sub_807C5F8
	ldr r2, [r4, #0x3c]
	ldr r3, _0807C594 @ =gCamera
	ldr r1, [r3]
	subs r2, r2, r1
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r2, r2, r1
	strh r2, [r0, #0x16]
	ldr r2, [r4, #0x40]
	ldr r1, [r3, #4]
	subs r2, r2, r1
	adds r4, #0x46
	ldrh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	adds r2, r2, r1
	strh r2, [r0, #0x18]
	bl sub_80051E8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C594: .4byte gCamera

	thumb_func_start sub_807C598
sub_807C598: @ 0x0807C598
	push {lr}
	ldr r1, [r0, #0x3c]
	ldr r3, _0807C5D4 @ =gCamera
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
	bhi _0807C5D0
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0807C5D0
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807C5D8
_0807C5D0:
	movs r0, #1
	b _0807C5DA
	.align 2, 0
_0807C5D4: .4byte gCamera
_0807C5D8:
	movs r0, #0
_0807C5DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_807C5E0
sub_807C5E0: @ 0x0807C5E0
	push {lr}
	ldr r1, [r0]
	ldrb r0, [r0, #8]
	strb r0, [r1]
	ldr r0, _0807C5F4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_0807C5F4: .4byte gCurTask

	thumb_func_start sub_807C5F8
sub_807C5F8: @ 0x0807C5F8
	ldr r0, _0807C610 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807C610: .4byte gCurTask

	thumb_func_start sub_807C614
sub_807C614: @ 0x0807C614
	ldr r0, _0807C634 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	adds r0, r0, r1
	ldr r0, [r0, #0x18]
	ldrh r1, [r0, #6]
	ldr r0, _0807C638 @ =IWRAM_START + 0x60
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807C634: .4byte gCurTask
_0807C638: .4byte IWRAM_START + 0x60

	thumb_func_start initSprite_Interactable085
initSprite_Interactable085: @ 0x0807C63C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0807C6CC @ =Task_Interactable085
	ldr r2, _0807C6D0 @ =0x00002010
	ldr r1, _0807C6D4 @ =TaskDestructor_Interactable085
	str r1, [sp]
	movs r1, #0x4c
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r2, r3, r2
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #3
	lsls r1, r4, #8
	adds r0, r0, r1
	str r0, [r2, #0x3c]
	mov r7, sb
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	lsls r1, r5, #8
	adds r0, r0, r1
	str r0, [r2, #0x40]
	ldr r1, _0807C6D8 @ =IWRAM_START + 0x44
	adds r0, r3, r1
	movs r6, #0
	movs r1, #0
	strh r1, [r0]
	ldr r7, _0807C6DC @ =IWRAM_START + 0x46
	adds r0, r3, r7
	strh r1, [r0]
	ldr r0, _0807C6E0 @ =IWRAM_START + 0x49
	adds r3, r3, r0
	strb r6, [r3]
	strh r4, [r2, #4]
	strh r5, [r2, #6]
	mov r1, sb
	str r1, [r2]
	ldrb r0, [r1]
	strb r0, [r2, #8]
	mov r7, r8
	strb r7, [r2, #9]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	mov r7, sb
	strb r0, [r7]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C6CC: .4byte Task_Interactable085
_0807C6D0: .4byte 0x00002010
_0807C6D4: .4byte TaskDestructor_Interactable085
_0807C6D8: .4byte IWRAM_START + 0x44
_0807C6DC: .4byte IWRAM_START + 0x46
_0807C6E0: .4byte IWRAM_START + 0x49

	thumb_func_start sub_807C6E4
sub_807C6E4: @ 0x0807C6E4
	push {r4, r5, lr}
	ldr r0, _0807C720 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_807C3DC
	ldr r0, _0807C724 @ =IWRAM_START + 0x49
	adds r4, r4, r0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807C70E
	adds r0, r5, #0
	bl sub_807C72C
_0807C70E:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C720: .4byte gCurTask
_0807C724: .4byte IWRAM_START + 0x49

	thumb_func_start TaskDestructor_Interactable085
TaskDestructor_Interactable085: @ 0x0807C728
	bx lr
	.align 2, 0

	thumb_func_start sub_807C72C
sub_807C72C: @ 0x0807C72C
	adds r0, #0x49
	movs r1, #0x40
	strb r1, [r0]
	ldr r0, _0807C73C @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C740 @ =sub_807C744
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C73C: .4byte gCurTask
_0807C740: .4byte sub_807C744

	thumb_func_start sub_807C744
sub_807C744: @ 0x0807C744
	push {r4, r5, lr}
	ldr r0, _0807C794 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	ldr r2, _0807C798 @ =gSineTable
	adds r0, #0x49
	adds r4, r1, r0
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	lsls r0, r0, #4
	ldr r2, _0807C79C @ =IWRAM_START + 0x46
	adds r1, r1, r2
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_807C3DC
	ldrb r0, [r4]
	adds r0, #8
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0807C784
	adds r0, r5, #0
	bl sub_807C7A0
_0807C784:
	bl sub_807C614
	adds r0, r5, #0
	bl sub_807C558
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C794: .4byte gCurTask
_0807C798: .4byte gSineTable
_0807C79C: .4byte IWRAM_START + 0x46

	thumb_func_start sub_807C7A0
sub_807C7A0: @ 0x0807C7A0
	adds r0, #0x49
	movs r1, #0x80
	strb r1, [r0]
	ldr r0, _0807C7B0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0807C7B4 @ =sub_807C360
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0807C7B0: .4byte gCurTask
_0807C7B4: .4byte sub_807C360
