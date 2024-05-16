.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r0, _08008CBC @ =gStageFlags
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080089EA
	b _08008DAC
_080089EA:
	ldr r0, _08008CC0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x18]
	ldr r0, [r1]
	str r0, [sp, #0x1c]
	ldr r0, _08008CC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08008A10
	ldr r0, [r1, #8]
	adds r0, #0xc
	str r0, [sp, #0x24]
	ldr r0, [r1, #4]
	adds r0, #0xc
	str r0, [sp, #0x20]
_08008A10:
	ldr r1, [sp, #0x1c]
	adds r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldm r1!, {r0}
	str r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r1, _08008CC8 @ =gCamera
	ldr r0, [r1]
	adds r2, r0, #0
	subs r2, #0x80
	str r2, [sp]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r0, r4
	str r0, [sp, #8]
	ldr r1, [r1, #4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r0, r1, r5
	str r0, [sp, #0xc]
	cmp r2, #0
	bge _08008A4E
	str r3, [sp]
_08008A4E:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08008A56
	str r3, [sp, #4]
_08008A56:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08008A5E
	str r3, [sp, #8]
_08008A5E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _08008A66
	str r3, [sp, #0xc]
_08008A66:
	ldr r0, [sp, #0x10]
	lsls r2, r0, #8
	ldr r0, [sp]
	cmp r0, r2
	blo _08008A74
	subs r0, r2, #1
	str r0, [sp]
_08008A74:
	ldr r3, [sp, #0x14]
	lsls r1, r3, #8
	ldr r0, [sp, #4]
	cmp r0, r1
	blo _08008A82
	subs r0, r1, #1
	str r0, [sp, #4]
_08008A82:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _08008A8C
	subs r0, r2, #1
	str r0, [sp, #8]
_08008A8C:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _08008A96
	subs r0, r1, #1
	str r0, [sp, #0xc]
_08008A96:
	ldr r0, [sp, #4]
	asrs r0, r0, #8
	mov r8, r0
	lsls r0, r0, #8
	ldr r3, [sp, #0xc]
	cmp r0, r3
	blo _08008AA6
	b _08008D94
_08008AA6:
	ldr r4, [sp, #0x14]
	cmp r8, r4
	blo _08008AAE
	b _08008D94
_08008AAE:
	ldr r0, [sp]
	asrs r7, r0, #8
	lsls r0, r7, #8
	ldr r2, [sp, #8]
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x34]
	cmp r0, r2
	blo _08008AC2
	b _08008D82
_08008AC2:
	ldr r0, [sp, #0x10]
	cmp r7, r0
	blo _08008ACA
	b _08008D82
_08008ACA:
	adds r1, r0, #0
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x1c]
	adds r0, r0, r4
	str r0, [sp, #0x28]
_08008AD8:
	ldr r0, _08008CC4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08008AE2
	b _08008CD4
_08008AE2:
	lsls r1, r7, #2
	ldr r5, [sp, #0x28]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r4, [sp, #0x10]
	mov r0, r8
	muls r0, r4, r0
	str r0, [sp, #0x2c]
	str r1, [sp, #0x38]
	adds r5, r7, #1
	str r5, [sp, #0x30]
	cmp r6, #0
	beq _08008B88
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08008B88
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008B1E:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008B72
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008B72
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008B72
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008B72
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008B72
	ldr r1, _08008CCC @ =gSpriteInits_Interactables
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008B72:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008B1E
_08008B88:
	ldr r5, [sp, #0x2c]
	lsls r0, r5, #2
	ldr r1, [sp, #0x20]
	adds r0, r0, r1
	ldr r4, [sp, #0x38]
	adds r0, r4, r0
	ldr r6, [r0]
	cmp r6, #0
	beq _08008C1A
	adds r0, r6, #0
	subs r0, #8
	adds r4, r1, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _08008C1A
	movs r0, #2
	rsbs r0, r0, #0
	mov sl, r0
	lsls r2, r7, #0x10
	mov sb, r2
	mov r3, r8
	lsls r3, r3, #0x10
	str r3, [sp, #0x3c]
_08008BC0:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sl
	blt _08008C04
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r5, r8
	lsls r0, r5, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008C04
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008C04
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008C04
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008C04
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	mov r2, sb
	lsrs r1, r2, #0x10
	ldr r5, [sp, #0x3c]
	lsrs r2, r5, #0x10
	bl CreateEntity_ItemBox
_08008C04:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	bne _08008BC0
_08008C1A:
	ldr r1, [sp, #0x2c]
	lsls r0, r1, #2
	ldr r4, [sp, #0x24]
	adds r0, r0, r4
	ldr r5, [sp, #0x38]
	adds r0, r5, r0
	ldr r6, [r0]
	cmp r6, #0
	bne _08008C2E
	b _08008D70
_08008C2E:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008C46
	b _08008D70
_08008C46:
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008C50:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008CA4
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008CA4
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008CA4
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008CA4
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008CA4
	ldr r1, _08008CD0 @ =gSpriteInits_Enemies
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008CA4:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008C50
	b _08008D70
	.align 2, 0
_08008CBC: .4byte gStageFlags
_08008CC0: .4byte gCurTask
_08008CC4: .4byte gGameMode
_08008CC8: .4byte gCamera
_08008CCC: .4byte gSpriteInits_Interactables
_08008CD0: .4byte gSpriteInits_Enemies
_08008CD4:
	lsls r0, r7, #2
	ldr r5, [sp, #0x28]
	adds r0, r0, r5
	ldr r6, [r0]
	adds r0, r7, #1
	str r0, [sp, #0x30]
	cmp r6, #0
	beq _08008D70
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _08008D70
	lsls r0, r7, #0x10
	mov sl, r0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sb, r2
_08008D06:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08008D5A
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08008D5A
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08008D5A
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08008D5A
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08008D5A
	ldr r1, _08008DBC @ =gSpriteInits_InteractablesMultiplayer
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r0, [r0]
	mov ip, r0
	adds r0, r5, #0
	mov r2, sl
	lsrs r1, r2, #0x10
	mov r4, sb
	lsrs r2, r4, #0x10
	bl _call_via_ip
_08008D5A:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08008D06
_08008D70:
	ldr r7, [sp, #0x30]
	adds r5, r7, #0
	lsls r0, r5, #8
	cmp r0, r2
	bhs _08008D82
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bhs _08008D82
	b _08008AD8
_08008D82:
	ldr r1, [sp, #0x34]
	mov r8, r1
	lsls r0, r1, #8
	cmp r0, r3
	bhs _08008D94
	ldr r2, [sp, #0x14]
	cmp r1, r2
	bhs _08008D94
	b _08008AAE
_08008D94:
	ldr r1, _08008DC0 @ =gCamera
	ldr r0, [r1]
	ldr r3, [sp, #0x18]
	str r0, [r3, #0xc]
	ldr r0, [r1, #4]
	str r0, [r3, #0x10]
	movs r0, #0
	strb r0, [r3, #0x14]
	ldr r0, _08008DC4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08008DC8 @ =Task_8008DCC
	str r0, [r1, #8]
_08008DAC:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08008DBC: .4byte gSpriteInits_InteractablesMultiplayer
_08008DC0: .4byte gCamera
_08008DC4: .4byte gCurTask
_08008DC8: .4byte Task_8008DCC

	
.syntax divided
