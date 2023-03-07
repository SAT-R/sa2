.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8062B00
sub_8062B00: @ 0x08062B00
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r6, _08062BB0 @ =gMultiplayerPlayerTasks
	ldr r0, _08062BB4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r7, #0xc0
	lsls r7, r7, #0x12
	adds r5, r0, r7
	ldr r2, _08062BB8 @ =gPlayer
	adds r3, r2, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r3]
	strh r4, [r2, #0x32]
	ldr r0, [r5, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08062BAA
	ldr r0, [r6]
	cmp r0, #0
	beq _08062B60
	adds r1, r6, #0
	adds r3, r1, #0
	adds r3, #0xc
	movs r2, #1
_08062B44:
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	adds r0, r0, r7
	ldr r0, [r0, #0x5c]
	ands r0, r2
	cmp r0, #0
	beq _08062B54
	adds r4, #1
_08062B54:
	adds r1, #4
	cmp r1, r3
	bhi _08062B60
	ldr r0, [r1]
	cmp r0, #0
	bne _08062B44
_08062B60:
	ldr r0, _08062BB4 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	ldr r0, [r5, #0x5c]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0x5c]
	cmp r4, #0
	bne _08062B8E
	ldr r2, _08062BBC @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08062BC0 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08062B8E:
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
	ldr r0, _08062BC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08062BC8 @ =sub_8062D44
	str r0, [r1, #8]
	ldr r1, _08062BCC @ =gCamera
	adds r1, #0x50
	ldrh r2, [r1]
	movs r0, #4
	orrs r0, r2
	strh r0, [r1]
_08062BAA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062BB0: .4byte gMultiplayerPlayerTasks
_08062BB4: .4byte 0x04000128
_08062BB8: .4byte gPlayer
_08062BBC: .4byte gUnknown_03005424
_08062BC0: .4byte gUnknown_03005490
_08062BC4: .4byte gCurTask
_08062BC8: .4byte sub_8062D44
_08062BCC: .4byte gCamera

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 0x08062BD0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r3, _08062C44 @ =gMultiplayerPlayerTasks
	ldr r5, _08062C48 @ =0x04000128
	ldr r0, [r5]
	ldr r2, _08062C4C @ =gPlayer
	adds r4, r2, #0
	adds r4, #0x37
	ldrb r1, [r4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	strh r1, [r2, #0x32]
	movs r4, #0
	ldr r0, [r3]
	mov sb, r3
	cmp r0, #0
	beq _08062C66
	ldr r0, _08062C50 @ =gMultiplayerConnections
	ldrb r3, [r0]
	movs r7, #0x10
	adds r6, r5, #0
	ldr r2, _08062C54 @ =gUnknown_030054B4
	mov ip, r2
	mov r5, sb
_08062C0C:
	adds r2, r7, #0
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, r7, #0
	lsls r1, r0
	ands r1, r3
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r1, r0
	cmp r2, r1
	beq _08062C58
	mov r1, ip
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08062C58
	movs r2, #1
	mov r8, r2
	b _08062C66
	.align 2, 0
_08062C44: .4byte gMultiplayerPlayerTasks
_08062C48: .4byte 0x04000128
_08062C4C: .4byte gPlayer
_08062C50: .4byte gMultiplayerConnections
_08062C54: .4byte gUnknown_030054B4
_08062C58:
	adds r5, #4
	adds r4, #1
	cmp r4, #3
	bhi _08062C66
	ldr r0, [r5]
	cmp r0, #0
	bne _08062C0C
_08062C66:
	movs r4, #0
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	beq _08062CF4
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	movs r7, #0x10
	ldr r6, _08062CC0 @ =0x04000128
	movs r5, #0
_08062C7C:
	ldr r0, _08062CC4 @ =gUnknown_030054B4
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _08062CDC
	ldr r0, _08062CC8 @ =gMultiplayerConnections
	ldrb r3, [r0]
	adds r2, r7, #0
	lsls r2, r4
	ands r2, r3
	adds r0, r4, #4
	asrs r2, r0
	ldr r1, [r6]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	adds r0, r7, #0
	lsls r0, r1
	ands r3, r0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	bne _08062CCC
	lsrs r0, r5, #0x18
	mov r2, r8
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
	b _08062CDC
	.align 2, 0
_08062CC0: .4byte 0x04000128
_08062CC4: .4byte gUnknown_030054B4
_08062CC8: .4byte gMultiplayerConnections
_08062CCC:
	lsrs r0, r5, #0x18
	movs r2, #1
	mov r1, r8
	eors r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_8019CCC
_08062CDC:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #3
	bhi _08062CF4
	ldr r0, _08062D2C @ =gMultiplayerPlayerTasks
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08062C7C
_08062CF4:
	ldr r1, _08062D30 @ =gUnknown_03005424
	ldrh r0, [r1]
	movs r4, #4
	orrs r0, r4
	strh r0, [r1]
	ldr r1, _08062D34 @ =gUnknown_03005490
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
	bl sub_8019224
	movs r1, #7
	strb r1, [r0]
	ldr r0, _08062D38 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08062D3C @ =sub_8062D44
	str r0, [r1, #8]
	ldr r0, _08062D40 @ =gCamera
	adds r0, #0x50
	ldrh r1, [r0]
	orrs r4, r1
	strh r4, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062D2C: .4byte gMultiplayerPlayerTasks
_08062D30: .4byte gUnknown_03005424
_08062D34: .4byte gUnknown_03005490
_08062D38: .4byte gCurTask
_08062D3C: .4byte sub_8062D44
_08062D40: .4byte gCamera

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
