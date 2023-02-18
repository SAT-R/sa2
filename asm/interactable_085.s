.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

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
