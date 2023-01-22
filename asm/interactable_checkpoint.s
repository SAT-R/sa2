.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start initSprite_Interactable_Checkpoint
initSprite_Interactable_Checkpoint: @ 0x08062E90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldr r0, _08062ECC @ =gUnknown_030055B0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062EDC
	ldr r0, _08062ED0 @ =Task_8062FD8
	ldr r2, _08062ED4 @ =0x00002010
	ldr r1, _08062ED8 @ =TaskDestructor_8063214
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
	b _08062EEC
	.align 2, 0
_08062ECC: .4byte gUnknown_030055B0
_08062ED0: .4byte Task_8062FD8
_08062ED4: .4byte 0x00002010
_08062ED8: .4byte TaskDestructor_8063214
_08062EDC:
	ldr r0, _08062FA8 @ =Task_806319C
	ldr r2, _08062FAC @ =0x00002010
	ldr r1, _08062FB0 @ =TaskDestructor_8063214
	str r1, [sp]
	movs r1, #0x40
	movs r3, #0
	bl TaskCreate
_08062EEC:
	ldrh r5, [r0, #6]
	movs r6, #0xc0
	lsls r6, r6, #0x12
	adds r6, r5, r6
	ldr r0, _08062FB4 @ =IWRAM_START + 0xC
	adds r4, r5, r0
	movs r1, #0
	mov r8, r1
	mov r2, sl
	strh r2, [r6, #4]
	mov r0, sb
	strh r0, [r6, #6]
	str r7, [r6]
	ldrb r0, [r7]
	strb r0, [r6, #8]
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r6, #9]
	ldrb r0, [r7]
	lsls r0, r0, #3
	mov r2, sl
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x16]
	ldrb r0, [r7, #1]
	lsls r0, r0, #3
	mov r2, sb
	lsls r1, r2, #8
	adds r0, r0, r1
	strh r0, [r4, #0x18]
	movs r1, #2
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r7]
	movs r0, #4
	bl VramMalloc
	str r0, [r4, #4]
	ldr r0, _08062FB8 @ =0x00000213
	strh r0, [r4, #0xa]
	ldr r2, _08062FBC @ =IWRAM_START + 0x2C
	adds r0, r5, r2
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r4, #0x1a]
	mov r2, r8
	strh r2, [r4, #8]
	strh r2, [r4, #0x14]
	strh r2, [r4, #0x1c]
	ldr r0, _08062FC0 @ =IWRAM_START + 0x2D
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r2, _08062FC4 @ =IWRAM_START + 0x2E
	adds r1, r5, r2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08062FC8 @ =IWRAM_START + 0x31
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r4, #0x10]
	ldr r1, _08062FCC @ =gCurrentLevel
	ldrb r2, [r1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x1a
	lsls r2, r2, #0x18
	ldr r3, _08062FD0 @ =gUnknown_080D94F8
	lsrs r2, r2, #0x16
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r2, [r2]
	ldr r3, _08062FD4 @ =sub_8063228
	bl sub_8009628
	str r0, [r6, #0x3c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062FA8: .4byte Task_806319C
_08062FAC: .4byte 0x00002010
_08062FB0: .4byte TaskDestructor_8063214
_08062FB4: .4byte IWRAM_START + 0xC
_08062FB8: .4byte 0x00000213
_08062FBC: .4byte IWRAM_START + 0x2C
_08062FC0: .4byte IWRAM_START + 0x2D
_08062FC4: .4byte IWRAM_START + 0x2E
_08062FC8: .4byte IWRAM_START + 0x31
_08062FCC: .4byte gCurrentLevel
_08062FD0: .4byte gUnknown_080D94F8
_08062FD4: .4byte sub_8063228

.if 0
.endif
