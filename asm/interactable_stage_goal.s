.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8062D44
sub_8062D44: @ 0x08062D44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08062E14 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	movs r4, #0
	ldr r1, _08062E18 @ =gUnknown_030054B4
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08062E08
	movs r3, #0
	ldr r0, _08062E1C @ =gMultiplayerPlayerTasks
	ldr r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08062D98
	movs r6, #0x80
	lsls r6, r6, #1
	adds r2, r5, #0
_08062D76:
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	ldr r1, _08062E20 @ =IWRAM_START + 0x54
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08062D8A
	adds r4, #1
_08062D8A:
	adds r2, #4
	adds r3, #1
	cmp r3, #3
	bhi _08062D98
	ldr r0, [r2]
	cmp r0, #0
	bne _08062D76
_08062D98:
	cmp r4, #0
	beq _08062E08
	subs r0, r3, #1
	cmp r4, r0
	bhs _08062DAA
	ldr r0, _08062E24 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08062E08
_08062DAA:
	ldr r0, [r5]
	cmp r0, #0
	beq _08062DFC
	mov ip, r5
	movs r6, #1
	ldr r5, _08062E28 @ =gPlayer
	movs r0, #0x5c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, _08062E24 @ =gGameMode
	mov r4, ip
_08062DC0:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r2, [r1, #0x5c]
	adds r3, r2, #0
	ands r3, r6
	cmp r3, #0
	bne _08062DEC
	ldrb r0, [r7]
	cmp r0, #4
	beq _08062DEC
	orrs r2, r6
	str r2, [r1, #0x5c]
	ldr r0, [r5, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x20]
	mov r1, r8
	strh r3, [r1]
_08062DEC:
	adds r4, #4
	mov r0, ip
	adds r0, #0xc
	cmp r4, r0
	bhi _08062DFC
	ldr r0, [r4]
	cmp r0, #0
	bne _08062DC0
_08062DFC:
	bl sub_8019F08
	ldr r0, _08062E2C @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08062E08:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062E14: .4byte 0x04000128
_08062E18: .4byte gUnknown_030054B4
_08062E1C: .4byte gMultiplayerPlayerTasks
_08062E20: .4byte IWRAM_START + 0x54
_08062E24: .4byte gGameMode
_08062E28: .4byte gPlayer
_08062E2C: .4byte gCurTask

	thumb_func_start initSprite_Interactable_Toggle_StageGoal
initSprite_Interactable_Toggle_StageGoal: @ 0x08062E30
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08062E74 @ =sub_8062934
	ldr r2, _08062E78 @ =0x00002010
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl TaskCreate
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	strh r4, [r0, #4]
	strh r5, [r0, #6]
	str r6, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #8]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062E74: .4byte sub_8062934
_08062E78: .4byte 0x00002010

	thumb_func_start TaskDestructor_8062E7C
TaskDestructor_8062E7C: @ 0x08062E7C
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	bl VramFree
	pop {r0}
	bx r0
