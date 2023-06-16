.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_80510B0
Task_80510B0: @ 0x080510B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _080511C4 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0
	mov sb, r7
	adds r0, r7, #0
	bl sub_8004558
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	ldr r1, _080511C8 @ =IWRAM_START + 0x60
	adds r0, r4, r1
	ldr r2, [sp]
	ldrb r0, [r0]
	cmp r2, r0
	bhs _080511A4
	ldr r3, _080511CC @ =IWRAM_START + 0x61
	adds r3, r4, r3
	str r3, [sp, #4]
_080510E8:
	ldr r0, [sp, #4]
	add r0, sl
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051190
	ldr r0, [sp]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	mov r4, sl
	lsls r5, r4, #3
	movs r0, #0x30
	adds r0, r0, r7
	mov r8, r0
	adds r2, r0, r5
	lsls r4, r4, #2
	adds r0, r7, #0
	adds r0, #0x50
	adds r0, r0, r4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	adds r6, r7, #0
	adds r6, #0x34
	adds r3, r6, r5
	adds r0, r7, #0
	adds r0, #0x52
	adds r0, r0, r4
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r2, [r2]
	asrs r2, r2, #8
	ldr r1, _080511D0 @ =gCamera
	ldr r0, [r1]
	subs r2, r2, r0
	mov r0, sb
	strh r2, [r0, #0x16]
	ldr r0, [r3]
	asrs r0, r0, #8
	ldr r1, [r1, #4]
	subs r1, r0, r1
	mov r3, sb
	strh r1, [r3, #0x18]
	adds r2, #0x80
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r3, r8
	movs r4, #0xf8
	lsls r4, r4, #1
	cmp r2, r4
	bhi _08051170
	mov r2, sb
	movs r4, #0x18
	ldrsh r0, [r2, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _08051170
	lsls r1, r1, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _08051178
_08051170:
	ldr r1, [sp, #4]
	add r1, sl
	movs r0, #0
	strb r0, [r1]
_08051178:
	adds r0, r3, r5
	ldr r1, [r0]
	asrs r1, r1, #8
	adds r0, r6, r5
	ldr r2, [r0]
	asrs r2, r2, #8
	mov r0, sb
	bl sub_800C84C
	mov r0, sb
	bl sub_80051E8
_08051190:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp sl, r0
	blo _080510E8
_080511A4:
	ldr r0, [sp]
	cmp r0, #0
	bne _080511B2
	ldr r0, _080511C4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080511D4 @ =Task_DestroyProjectileTask
	str r0, [r1, #8]
_080511B2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080511C4: .4byte gCurTask
_080511C8: .4byte IWRAM_START + 0x60
_080511CC: .4byte IWRAM_START + 0x61
_080511D0: .4byte gCamera
_080511D4: .4byte Task_DestroyProjectileTask

	thumb_func_start Task_DestroyProjectileTask
Task_DestroyProjectileTask: @ 0x080511D8
	push {lr}
	ldr r0, _080511E8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	pop {r0}
	bx r0
	.align 2, 0
_080511E8: .4byte gCurTask

	thumb_func_start TaskDestructor_80511EC
TaskDestructor_80511EC: @ 0x080511EC
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0

	thumb_func_start TaskDestructor_8051200
TaskDestructor_8051200: @ 0x08051200
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
