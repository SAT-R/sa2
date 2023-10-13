
.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

.if 0
	thumb_func_start sub_8019CCC
sub_8019CCC: @ 0x08019CCC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18      @ r4 sioId
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r0, _08019D08 @ =gUnknown_030054B4
	adds r0, r4, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08019CEC
	b _08019E5E
_08019CEC:
	ldr r0, _08019D0C @ =Task_8019E70
	ldr r2, _08019D10 @ =0x00002010
	ldr r1, _08019D14 @ =TaskDestructor_8019EF4
	str r1, [sp]
	movs r1, #0x34
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r1, _08019D18 @ =gMultiplayerPlayerTasks
	b _08019D24
	.align 2, 0
_08019D08: .4byte gUnknown_030054B4
_08019D0C: .4byte Task_8019E70
_08019D10: .4byte 0x00002010
_08019D14: .4byte TaskDestructor_8019EF4
_08019D18: .4byte gMultiplayerPlayerTasks
_08019D1C:
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	bhi _08019D2A
_08019D24:
	ldr r0, [r1]
	cmp r0, #0
	bne _08019D1C
_08019D2A:
	cmp r6, #5
	bhi _08019D3C
	ldr r0, _08019D38 @ =gUnknown_030054B4
	adds r0, r4, r0
	strb r6, [r0]
	b _08019D44
	.align 2, 0
_08019D38: .4byte gUnknown_030054B4
_08019D3C:
	ldr r0, _08019D88 @ =gUnknown_030054B4
	adds r0, r4, r0
	subs r1, r5, #1
	strb r1, [r0]
_08019D44:
	adds r0, r2, #0     @ r0 = r2 = finish
	adds r0, #0x30
	movs r1, #0
	strb r4, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r4, r2, #0
	strh r1, [r4, #8]
	movs r0, #0xc
	bl VramMalloc
	str r0, [r4, #4]
	cmp r6, #5
	bne _08019D94
	ldr r3, _08019D8C @ =gUnknown_080D5768
	ldr r0, _08019D90 @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019D70
	movs r1, #0x38
_08019D70:
	adds r0, r1, r3
	ldrh r0, [r0, #0xc]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019D80
	movs r1, #0x38
_08019D80:
	adds r0, r1, r3
	ldrb r1, [r0, #0xe]
	b _08019DBC
	.align 2, 0
_08019D88: .4byte gUnknown_030054B4
_08019D8C: .4byte gUnknown_080D5768
_08019D90: .4byte gLoadedSaveGame
_08019D94:
	cmp r6, #4
	bne _08019DCC
	ldr r3, _08019DC4 @ =gUnknown_080D5768
	ldr r0, _08019DC8 @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DA8
	movs r1, #0x38
_08019DA8:
	adds r0, r1, r3
	ldrh r0, [r0, #0x14]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DB8
	movs r1, #0x38
_08019DB8:
	adds r0, r1, r3
	ldrb r1, [r0, #0x16]
_08019DBC:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08019E38
	.align 2, 0
_08019DC4: .4byte gUnknown_080D5768
_08019DC8: .4byte gLoadedSaveGame
_08019DCC:
	cmp r5, #2
	beq _08019DD8
	ldr r0, _08019E00 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #4
	bne _08019E0C
_08019DD8:
	ldr r3, _08019E04 @ =gUnknown_080D5768
	ldr r0, _08019E08 @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DE8
	movs r1, #0x38
_08019DE8:
	adds r0, r1, r3
	ldrh r0, [r0, #4]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019DF8
	movs r1, #0x38
_08019DF8:
	adds r0, r1, r3
	ldrb r0, [r0, #6]
	b _08019E30
	.align 2, 0
_08019E00: .4byte gGameMode
_08019E04: .4byte gUnknown_080D5768
_08019E08: .4byte gLoadedSaveGame
_08019E0C:
	ldr r3, _08019E68 @ =gUnknown_080D5768
	ldr r0, _08019E6C @ =gLoadedSaveGame
	ldr r2, [r0]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019E1C
	movs r1, #0x38
_08019E1C:
	adds r0, r1, r3
	ldrh r0, [r0, #0x1c]
	strh r0, [r4, #0xa]
	ldrb r0, [r2, #6]
	movs r1, #0
	cmp r0, #1
	bls _08019E2C
	movs r1, #0x38
_08019E2C:
	adds r0, r1, r3
	ldrb r0, [r0, #0x1e]
_08019E30:
	adds r0, r6, r0
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
_08019E38:
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r3, r4, #0
	adds r3, #0x22
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	str r1, [r4, #0x10]
	adds r0, r4, #0
	bl UpdateSpriteAnimation
_08019E5E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019E68: .4byte gUnknown_080D5768
_08019E6C: .4byte gLoadedSaveGame
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
