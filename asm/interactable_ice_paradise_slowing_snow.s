.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_IceParadise_SlowingSnow
initSprite_Interactable_IceParadise_SlowingSnow: @ 0x08077DA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08077E30 @ =Task_Interactable_IceParadise_SlowingSnow
	ldr r2, _08077E34 @ =0x00002010
	ldr r1, _08077E38 @ =TaskDestructor_Interactable_IceParadise_SlowingSnow
	str r1, [sp]
	movs r1, #0x18
	movs r3, #0
	bl TaskCreate
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r3, r0
	movs r1, #3
	ldrsb r1, [r4, r1]
	lsls r1, r1, #3
	strh r1, [r3]
	movs r2, #4
	ldrsb r2, [r4, r2]
	lsls r2, r2, #3
	strh r2, [r3, #2]
	ldrb r0, [r4, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	strh r1, [r3, #4]
	ldrb r0, [r4, #6]
	lsls r0, r0, #3
	adds r2, r2, r0
	strh r2, [r3, #6]
	str r4, [r3, #0x10]
	ldrb r0, [r4]
	strb r0, [r3, #0x14]
	mov r1, r8
	strb r1, [r3, #0x15]
	ldrb r0, [r4]
	lsls r0, r0, #3
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r3, #8]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	lsls r6, r6, #8
	adds r0, r0, r6
	str r0, [r3, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077E30: .4byte Task_Interactable_IceParadise_SlowingSnow
_08077E34: .4byte 0x00002010
_08077E38: .4byte TaskDestructor_Interactable_IceParadise_SlowingSnow

	thumb_func_start sub_8077E3C
sub_8077E3C: @ 0x08077E3C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08077EB8 @ =gPlayer
	ldr r1, [r6, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08077EC0
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08077EC0
	ldr r2, [r5, #8]
	ldr r1, _08077EBC @ =gCamera
	ldr r3, [r1]
	subs r2, r2, r3
	ldr r0, [r5, #0xc]
	ldr r4, [r1, #4]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [r6, #8]
	asrs r1, r1, #8
	subs r1, r1, r3
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	ldrsh r3, [r5, r0]
	adds r2, r2, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r2, r1
	bgt _08077EC0
	movs r6, #4
	ldrsh r0, [r5, r6]
	subs r0, r0, r3
	adds r0, r2, r0
	cmp r0, r1
	blt _08077EC0
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r1, #2
	ldrsh r2, [r5, r1]
	adds r3, r0, r2
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r3, r1
	bgt _08077EC0
	movs r4, #6
	ldrsh r0, [r5, r4]
	subs r0, r0, r2
	adds r0, r3, r0
	cmp r0, r1
	blt _08077EC0
	movs r0, #1
	b _08077EC2
	.align 2, 0
_08077EB8: .4byte gPlayer
_08077EBC: .4byte gCamera
_08077EC0:
	movs r0, #0
_08077EC2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Task_Interactable_IceParadise_SlowingSnow
Task_Interactable_IceParadise_SlowingSnow: @ 0x08077EC8
	push {r4, r5, lr}
	ldr r5, _08077F0C @ =gCurTask
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	adds r0, r4, #0
	bl sub_8077E3C
	cmp r0, #0
	beq _08077EEE
	ldr r2, _08077F10 @ =gPlayer
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	movs r0, #0xf3
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x14]
_08077EEE:
	adds r0, r4, #0
	bl sub_8077F18
	cmp r0, #0
	beq _08077F04
	ldr r0, [r4, #0x10]
	ldrb r1, [r4, #0x14]
	strb r1, [r0]
	ldr r0, [r5]
	bl TaskDestroy
_08077F04:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077F0C: .4byte gCurTask
_08077F10: .4byte gPlayer

	thumb_func_start TaskDestructor_Interactable_IceParadise_SlowingSnow
TaskDestructor_Interactable_IceParadise_SlowingSnow: @ 0x08077F14
	bx lr
	.align 2, 0

	thumb_func_start sub_8077F18
sub_8077F18: @ 0x08077F18
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #8]
	ldr r1, _08077F70 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	ldr r0, [r3, #0xc]
	ldr r1, [r1, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #4
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r5, #0x80
	rsbs r5, r5, #0
	cmp r0, r5
	blt _08077F6A
	movs r1, #0
	ldrsh r0, [r3, r1]
	adds r0, r2, r0
	movs r1, #0xb8
	lsls r1, r1, #1
	cmp r0, r1
	bgt _08077F6A
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r2, #6
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	cmp r0, r5
	blt _08077F6A
	movs r2, #2
	ldrsh r0, [r3, r2]
	adds r0, r1, r0
	movs r1, #0x90
	lsls r1, r1, #1
	cmp r0, r1
	ble _08077F74
_08077F6A:
	movs r0, #1
	b _08077F76
	.align 2, 0
_08077F70: .4byte gCamera
_08077F74:
	movs r0, #0
_08077F76:
	pop {r4, r5}
	pop {r1}
	bx r1
