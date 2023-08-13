.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r0, _08008E14 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08008DE6
	b _08009518
_08008DE6:
	ldr r0, _08008E18 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp, #0x28]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _08008E9E
	ldr r1, _08008E1C @ =gCamera
	ldr r3, [r1]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #0xc]
	subs r2, r3, r0
	adds r4, r1, #0
	adds r1, r0, #0
	cmp r2, #0
	blt _08008E20
	cmp r2, #0xf8
	bgt _08008E9E
	b _08008E26
	.align 2, 0
_08008E14: .4byte gUnknown_03005424
_08008E18: .4byte gCurTask
_08008E1C: .4byte gCamera
_08008E20:
	subs r0, r1, r3
	cmp r0, #0xf8
	bgt _08008E9E
_08008E26:
	ldr r3, [r4, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	subs r2, r3, r0
	cmp r2, #0
	blt _08008E38
	cmp r2, #0xd0
	bgt _08008E9E
	b _08008E3E
_08008E38:
	subs r0, r0, r3
	cmp r0, #0xd0
	bgt _08008E9E
_08008E3E:
	ldr r0, [sp, #0x28]
	ldr r0, [r0]
	str r0, [sp, #0x2c]
	ldr r0, _08008E84 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	beq _08008E5A
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #8]
	adds r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r2, #4]
	adds r0, #0xc
	str r0, [sp, #0x30]
_08008E5A:
	ldr r3, [sp, #0x2c]
	adds r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldm r3!, {r0}
	str r3, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	ldr r2, [r4]
	cmp r2, r1
	ble _08008E88
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r1, r1, r0
	str r1, [sp]
	adds r0, r2, r0
	b _08008E94
	.align 2, 0
_08008E84: .4byte gGameMode
_08008E88:
	adds r0, r2, #0
	subs r0, #0x80
	str r0, [sp]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0xc]
	subs r0, #0x80
_08008E94:
	str r0, [sp, #8]
	ldr r1, [sp, #0x28]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	beq _08008EA4
_08008E9E:
	bl SpawnMapEntities
	b _08009518
_08008EA4:
	ldr r0, [r4, #4]
	adds r3, r0, #0
	subs r3, #0x80
	str r3, [sp, #4]
	movs r5, #0x90
	lsls r5, r5, #1
	adds r2, r0, r5
	str r2, [sp, #0xc]
	ldr r5, [sp, #0x28]
	ldr r1, [r5, #0x10]
	cmp r0, r1
	ble _08008ECA
	add r0, sp, #0x10
	movs r3, #0x90
	lsls r3, r3, #1
	adds r1, r1, r3
	str r1, [r0, #4]
	str r2, [r0, #0xc]
	b _08008ED6
_08008ECA:
	add r1, sp, #0x10
	str r3, [r1, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	subs r0, #0x80
	str r0, [r1, #0xc]
_08008ED6:
	add r3, sp, #0x10
	ldr r1, [r4]
	adds r0, r1, #0
	subs r0, #0x80
	str r0, [sp, #0x10]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	str r0, [sp, #0x18]
	ldr r0, [sp]
	cmp r0, #0
	bge _08008EF2
	movs r0, #0
	str r0, [sp]
_08008EF2:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _08008EFC
	movs r0, #0
	str r0, [sp, #4]
_08008EFC:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _08008F06
	movs r0, #0
	str r0, [sp, #8]
_08008F06:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _08008F10
	movs r0, #0
	str r0, [sp, #0xc]
_08008F10:
	ldr r0, [sp]
	ldr r5, [sp, #0x20]
	lsls r2, r5, #8
	cmp r0, r2
	blo _08008F1E
	subs r0, r2, #1
	str r0, [sp]
_08008F1E:
	ldr r0, [sp, #4]
	ldr r5, [sp, #0x24]
	lsls r1, r5, #8
	cmp r0, r1
	blo _08008F2C
	subs r0, r1, #1
	str r0, [sp, #4]
_08008F2C:
	ldr r0, [sp, #8]
	cmp r0, r2
	blo _08008F36
	subs r0, r2, #1
	str r0, [sp, #8]
_08008F36:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _08008F40
	subs r0, r1, #1
	str r0, [sp, #0xc]
_08008F40:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bge _08008F4A
	movs r0, #0
	str r0, [sp, #0x10]
_08008F4A:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bge _08008F54
	movs r0, #0
	str r0, [sp, #0x14]
_08008F54:
	ldr r0, [r3, #8]
	cmp r0, #0
	bge _08008F5E
	movs r0, #0
	str r0, [r3, #8]
_08008F5E:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bge _08008F68
	movs r0, #0
	str r0, [r3, #0xc]
_08008F68:
	ldr r0, [sp, #0x10]
	cmp r0, r2
	blo _08008F72
	subs r0, r2, #1
	str r0, [sp, #0x10]
_08008F72:
	ldr r0, [r3, #4]
	cmp r0, r1
	blo _08008F7C
	subs r0, r1, #1
	str r0, [r3, #4]
_08008F7C:
	ldr r0, [r3, #8]
	cmp r0, r2
	blo _08008F86
	subs r0, r2, #1
	str r0, [r3, #8]
_08008F86:
	ldr r0, [r3, #0xc]
	cmp r0, r1
	blo _08008F90
	subs r0, r1, #1
	str r0, [r3, #0xc]
_08008F90:
	ldr r1, [r4]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #0xc]
	cmp r1, r0
	bne _08008F9C
	b _08009248
_08008F9C:
	ldr r0, [sp]
	ldr r2, [sp, #8]
	cmp r0, r2
	bne _08008FA6
	b _08009248
_08008FA6:
	ldr r0, [sp, #4]
	ldr r3, [sp, #0xc]
	cmp r0, r3
	bne _08008FB0
	b _08009248
_08008FB0:
	lsls r0, r0, #8
	b _08009236
_08008FB4:
	ldr r0, [sp]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	mov r5, r8
	adds r5, #1
	str r5, [sp, #0x44]
	cmp r0, r2
	blt _08008FC8
	b _08009232
_08008FC8:
	ldr r0, [sp, #0x20]
	cmp r7, r0
	blo _08008FD0
	b _08009232
_08008FD0:
	adds r1, r0, #0
	mov r0, r8
	muls r0, r1, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x2c]
	adds r0, r0, r4
	str r0, [sp, #0x38]
_08008FDE:
	ldr r0, _08009014 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _08008FE8
	b _08009190
_08008FE8:
	lsls r1, r7, #2
	ldr r5, [sp, #0x38]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r4, [sp, #0x20]
	mov r0, r8
	muls r0, r4, r0
	mov sb, r0
	mov sl, r1
	adds r5, r7, #1
	str r5, [sp, #0x40]
	cmp r6, #0
	beq _0800907C
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b _08009074
	.align 2, 0
_08009014: .4byte gGameMode
_08009018:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _08009066
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009066
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009066
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009066
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009066
	ldr r1, _0800909C @ =gSpriteInits_Interactables
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009066:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_08009074:
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	bne _08009018
_0800907C:
	mov r5, sb
	lsls r0, r5, #2
	ldr r1, [sp, #0x30]
	adds r0, r0, r1
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	beq _080090FA
	adds r0, r6, #0
	subs r0, #8
	adds r4, r1, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	b _080090F2
	.align 2, 0
_0800909C: .4byte gSpriteInits_Interactables
_080090A0:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r1, #2
	rsbs r1, r1, #0
	cmp r0, r1
	blt _080090E4
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _080090E4
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _080090E4
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080090E4
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _080090E4
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl CreateEntity_ItemBox
_080090E4:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
_080090F2:
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	bne _080090A0
_080090FA:
	mov r1, sb
	lsls r0, r1, #2
	ldr r4, [sp, #0x34]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	bne _0800910C
	b _0800921E
_0800910C:
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
	bne _08009124
	b _0800921E
_08009124:
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
_0800912A:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009174
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009174
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009174
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009174
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009174
	ldr r1, _0800918C @ =gSpriteInits_Enemies
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009174:
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
	bne _0800912A
	b _0800921E
	.align 2, 0
_0800918C: .4byte gSpriteInits_Enemies
_08009190:
	lsls r0, r7, #2
	ldr r5, [sp, #0x38]
	adds r0, r0, r5
	ldr r6, [r0]
	adds r0, r7, #1
	str r0, [sp, #0x40]
	cmp r6, #0
	beq _0800921E
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _0800921E
	movs r0, #2
	rsbs r0, r0, #0
	mov sb, r0
_080091BE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009208
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp]
	cmp r2, r0
	blt _08009208
	ldr r0, [sp, #8]
	cmp r2, r0
	bgt _08009208
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _08009208
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bgt _08009208
	ldr r1, _0800927C @ =gSpriteInits_InteractablesMultiplayer
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009208:
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
	bne _080091BE
_0800921E:
	ldr r5, [sp, #0x40]
	lsls r0, r5, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r7, #8
	cmp r0, r2
	bge _08009232
	ldr r0, [sp, #0x20]
	cmp r7, r0
	bhs _08009232
	b _08008FDE
_08009232:
	ldr r1, [sp, #0x44]
	lsls r0, r1, #0x10
_08009236:
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	bge _08009248
	ldr r4, [sp, #0x24]
	cmp r8, r4
	bhs _08009248
	b _08008FB4
_08009248:
	ldr r0, _08009280 @ =gCamera
	ldr r1, [r0, #4]
	ldr r5, [sp, #0x28]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bne _08009256
	b _0800950C
_08009256:
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bne _08009260
	b _0800950C
_08009260:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bne _0800926A
	b _0800950C
_0800926A:
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r0, r0, #8
	cmp r0, r3
	blt _08009278
	b _0800950C
_08009278:
	b _08009504
	.align 2, 0
_0800927C: .4byte gSpriteInits_InteractablesMultiplayer
_08009280: .4byte gCamera
_08009284:
	ldr r0, [sp, #0x10]
	lsls r0, r0, #8
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x44]
	cmp r1, r0
	blt _0800929A
	b _080094F4
_0800929A:
	ldr r3, [sp, #0x20]
	cmp r7, r3
	blo _080092A2
	b _080094F4
_080092A2:
	mov r0, r8
	muls r0, r3, r0
	lsls r0, r0, #2
	ldr r4, [sp, #0x2c]
	adds r0, r0, r4
	str r0, [sp, #0x3c]
_080092AE:
	ldr r0, _080092E0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #5
	bne _080092B8
	b _08009454
_080092B8:
	lsls r1, r7, #2
	ldr r5, [sp, #0x3c]
	adds r0, r1, r5
	ldr r6, [r0]
	ldr r2, [sp, #0x20]
	mov r0, r8
	muls r0, r2, r0
	mov sb, r0
	mov sl, r1
	adds r3, r7, #1
	str r3, [sp, #0x40]
	cmp r6, #0
	beq _08009344
	adds r0, r6, #0
	subs r0, #8
	ldr r4, [sp, #0x2c]
	adds r5, r4, r0
	movs r6, #0
	b _08009336
	.align 2, 0
_080092E0: .4byte gGameMode
_080092E4:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	movs r3, #2
	rsbs r3, r3, #0
	cmp r0, r3
	blt _08009332
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08009332
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _08009332
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _08009332
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _08009332
	ldr r1, _0800944C @ =gSpriteInits_Interactables
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009332:
	adds r5, #7
	adds r6, #1
_08009336:
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080092E4
_08009344:
	mov r3, sb
	lsls r0, r3, #2
	ldr r4, [sp, #0x30]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	beq _080093BE
	adds r0, r6, #0
	subs r0, #8
	adds r4, r4, r0
	movs r6, #0
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _080093BE
	subs r5, #1
_0800936C:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	blt _080093AC
	ldrb r1, [r4]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r4, #1]
	lsls r1, r1, #3
	mov r3, r8
	lsls r0, r3, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _080093AC
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _080093AC
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _080093AC
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _080093AC
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, r8
	bl CreateEntity_ItemBox
_080093AC:
	adds r4, #3
	adds r6, #1
	ldrb r1, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _0800936C
_080093BE:
	mov r3, sb
	lsls r0, r3, #2
	ldr r4, [sp, #0x34]
	adds r0, r0, r4
	add r0, sl
	ldr r6, [r0]
	cmp r6, #0
	bne _080093D0
	b _080094DE
_080093D0:
	adds r0, r6, #0
	subs r0, #8
	adds r5, r4, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080093E8
	b _080094DE
_080093E8:
	movs r3, #2
	rsbs r3, r3, #0
	mov sb, r3
_080093EE:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _08009438
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08009438
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _08009438
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _08009438
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _08009438
	ldr r1, _08009450 @ =gSpriteInits_Enemies
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_08009438:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080093EE
	b _080094DE
	.align 2, 0
_0800944C: .4byte gSpriteInits_Interactables
_08009450: .4byte gSpriteInits_Enemies
_08009454:
	lsls r0, r7, #2
	ldr r3, [sp, #0x3c]
	adds r0, r0, r3
	ldr r6, [r0]
	adds r4, r7, #1
	str r4, [sp, #0x40]
	cmp r6, #0
	beq _080094DE
	adds r0, r6, #0
	subs r0, #8
	ldr r1, [sp, #0x2c]
	adds r5, r1, r0
	movs r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	beq _080094DE
	movs r3, #2
	rsbs r3, r3, #0
	mov sb, r3
_08009482:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	blt _080094CC
	ldrb r1, [r5]
	lsls r1, r1, #3
	lsls r0, r7, #8
	adds r2, r1, r0
	ldrb r1, [r5, #1]
	lsls r1, r1, #3
	mov r4, r8
	lsls r0, r4, #8
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _080094CC
	ldr r0, [sp, #0x18]
	cmp r2, r0
	bgt _080094CC
	ldr r0, [sp, #0x14]
	cmp r1, r0
	blt _080094CC
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bgt _080094CC
	ldr r1, _08009528 @ =gSpriteInits_InteractablesMultiplayer
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl _call_via_r4
_080094CC:
	adds r5, #7
	adds r6, #1
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _08009482
_080094DE:
	ldr r3, [sp, #0x40]
	lsls r0, r3, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r7, #8
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bge _080094F4
	ldr r4, [sp, #0x20]
	cmp r7, r4
	bhs _080094F4
	b _080092AE
_080094F4:
	ldr r5, [sp, #0x44]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r0, #8
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bge _0800950C
_08009504:
	ldr r0, [sp, #0x24]
	cmp r8, r0
	bhs _0800950C
	b _08009284
_0800950C:
	ldr r0, _0800952C @ =gCamera
	ldr r1, [r0]
	ldr r2, [sp, #0x28]
	str r1, [r2, #0xc]
	ldr r0, [r0, #4]
	str r0, [r2, #0x10]
_08009518:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009528: .4byte gSpriteInits_InteractablesMultiplayer
_0800952C: .4byte gCamera


	
.syntax divided
