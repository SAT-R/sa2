
.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start Task_8019E70
Task_8019E70: @ 0x08019E70
	push {r4, lr}
	ldr r0, _08019EB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r3, r0, r1
	ldr r1, _08019EBC @ =gMultiplayerPlayerTasks
	ldr r2, _08019EC0 @ =IWRAM_START + 0x30
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	ldr r1, _08019EC4 @ =IWRAM_START + 0x50
	adds r0, r2, r1
	ldr r4, _08019EC8 @ =gCamera
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r3, #0x16]
	ldr r0, _08019ECC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08019ED4
	ldr r1, _08019ED0 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	ldr r1, [r4, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	subs r0, #0x20
	b _08019EE0
	.align 2, 0
_08019EB8: .4byte gCurTask
_08019EBC: .4byte gMultiplayerPlayerTasks
_08019EC0: .4byte IWRAM_START + 0x30
_08019EC4: .4byte IWRAM_START + 0x50
_08019EC8: .4byte gCamera
_08019ECC: .4byte gUnknown_03005424
_08019ED0: .4byte IWRAM_START + 0x52
_08019ED4:
	ldr r1, _08019EF0 @ =IWRAM_START + 0x52
	adds r0, r2, r1
	ldr r1, [r4, #4]
	ldrh r0, [r0]
	subs r0, r0, r1
	adds r0, #0x20
_08019EE0:
	strh r0, [r3, #0x18]
	adds r0, r3, #0
	bl DisplaySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019EF0: .4byte IWRAM_START + 0x52

	thumb_func_start TaskDestructor_8019EF4
TaskDestructor_8019EF4: @ 0x08019EF4
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
