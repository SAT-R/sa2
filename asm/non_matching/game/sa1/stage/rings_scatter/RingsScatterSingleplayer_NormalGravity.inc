
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _08041324 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08041328 @ =0x03000030
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sl, r2
	ldr r3, _0804132C @ =0x03000330
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _08041330 @ =0x03000334
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sl
	bl UpdateSpriteAnimation
	movs r1, #0x2f
	str r1, [sp, #0x14]
_080411C8:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _080411D0
	b _080415C0
_080411D0:
	movs r2, #8
	ldrsh r0, [r5, r2]
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [r5]
	movs r3, #0xa
	ldrsh r2, [r5, r3]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	asrs r1, r1, #8
	mov sb, r1
	mov r7, sb
	asrs r0, r0, #8
	mov r8, r0
	ldr r0, _08041334 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	bne _08041220
	ldr r0, _08041338 @ =gStageTime
	ldr r0, [r0]
	lsls r0, r0, #3
	mov r4, sb
	adds r1, r4, r0
	adds r2, r1, #0
	subs r2, #0x48
	ldr r0, _0804133C @ =0x00000A7F
	cmp r2, r0
	ble _0804121E
	adds r1, r2, #0
	adds r0, r1, #0
	movs r1, #0xa8
	lsls r1, r1, #4
	bl Mod
	adds r1, r0, #0
	adds r1, #0x48
_0804121E:
	mov sb, r1
_08041220:
	ldr r1, _08041340 @ =gCamera
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	movs r3, #2
	ldrsh r0, [r1, r3]
	mov r4, r8
	subs r4, r4, r0
	str r4, [sp, #0x1c]
	ldr r6, _08041344 @ =gPlayer
	ldr r2, [r6, #0x64]
	ldrh r0, [r5, #0xc]
	mov ip, r0
	ldr r1, [sp, #0xc]
	cmp ip, r1
	ble _08041244
	b _08041358
_08041244:
	adds r0, r6, #0
	adds r0, #0x40
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0xf
	bne _0804125A
	movs r3, #0x1c
	ldrsh r0, [r6, r3]
	cmp r0, #0
	beq _0804125A
	b _08041358
_0804125A:
	cmp r1, #0x28
	bne _08041260
	b _08041358
_08041260:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08041358
	adds r4, r2, #0
	adds r4, #0x38
	adds r2, r7, #0
	subs r2, #8
	ldr r0, [r6]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _0804128C
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _08041298
	cmp r2, r1
	blt _08041358
_0804128C:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08041358
_08041298:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080412B2
	cmp r8, r1
	bge _080412BE
	cmp r2, r1
	blt _08041358
_080412B2:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08041358
_080412BE:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r4, r8
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08041348 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08041334 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	beq _0804130C
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _0804130C
	ldr r0, _0804134C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804130C
	ldr r1, _08041350 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08041354 @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_0804130C:
	ldr r0, _0804134C @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	bne _08041320
	ldr r1, _08041348 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08041320
	movs r0, #0xff
	strh r0, [r1]
_08041320:
	movs r0, #0
	b _080415BE
	.align 2, 0
_08041324: .4byte gCurTask
_08041328: .4byte 0x03000030
_0804132C: .4byte 0x03000330
_08041330: .4byte 0x03000334
_08041334: .4byte gCurrentLevel
_08041338: .4byte gStageTime
_0804133C: .4byte 0x00000A7F
_08041340: .4byte gCamera
_08041344: .4byte gPlayer
_08041348: .4byte gRingCount
_0804134C: .4byte gGameMode
_08041350: .4byte gNumLives
_08041354: .4byte gMusicManagerState
_08041358:
	ldr r0, _08041450 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _08041366
	b _0804146C
_08041366:
	ldr r6, _08041454 @ =gPartner
	ldr r2, [r6, #0x64]
	ldr r0, [sp, #0xc]
	cmp ip, r0
	ble _08041372
	b _0804146C
_08041372:
	adds r0, r6, #0
	adds r0, #0x40
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0xf
	bne _08041386
	movs r3, #0x1c
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bne _0804146C
_08041386:
	cmp r1, #0x28
	beq _0804146C
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804146C
	adds r4, r2, #0
	adds r4, #0x38
	adds r2, r7, #0
	subs r2, #8
	ldr r0, [r6]
	asrs r0, r0, #8
	movs r3, #0
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080413B6
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _080413C2
	cmp r2, r1
	blt _0804146C
_080413B6:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0804146C
_080413C2:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _080413DC
	cmp r8, r1
	bge _080413E8
	cmp r2, r1
	blt _0804146C
_080413DC:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _0804146C
_080413E8:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r4, r8
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08041458 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _0804145C @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	beq _08041436
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08041436
	ldr r0, _08041460 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08041436
	ldr r1, _08041464 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08041468 @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_08041436:
	ldr r0, _08041460 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	bne _0804144A
	ldr r1, _08041458 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _0804144A
	movs r0, #0xff
	strh r0, [r1]
_0804144A:
	movs r0, #0
	b _080415BE
	.align 2, 0
_08041450: .4byte gNumSingleplayerCharacters
_08041454: .4byte gPartner
_08041458: .4byte gRingCount
_0804145C: .4byte gCurrentLevel
_08041460: .4byte gGameMode
_08041464: .4byte gNumLives
_08041468: .4byte gMusicManagerState
_0804146C:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	ble _0804149C
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _08041540 @ =sa2__sub_801EC3C
	str r0, [sp]
	mov r0, r8
	mov r1, sb
	movs r3, #8
	bl sa2__sub_801F100
	cmp r0, #0
	bgt _0804149C
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_0804149C:
	ldr r4, [sp, #4]
	ldr r1, _08041544 @ =0x00000336
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080414E0
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _080414E0
	mov r0, r8
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _08041540 @ =sa2__sub_801EC3C
	str r1, [sp]
	mov r1, sb
	movs r3, #8
	rsbs r3, r3, #0
	bl sa2__sub_801F100
	cmp r0, #0
	bgt _080414E0
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_080414E0:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	adds r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _080415BA
	movs r0, #8
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	ble _080415BA
	cmp r1, #0xa7
	bgt _080415BA
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _08041510
	ldr r0, _08041548 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080415BA
_08041510:
	mov r2, sl
	adds r2, #0x23
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _08041522
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0804154C
_08041522:
	movs r0, #0xff
	strb r0, [r2]
	mov r4, sp
	ldrh r0, [r4, #0x18]
	mov r4, sl
	strh r0, [r4, #0x16]
	mov r1, sp
	ldrh r1, [r1, #0x1c]
	strh r1, [r4, #0x18]
	mov r0, sl
	bl DisplaySprite
	movs r2, #1
	str r2, [sp, #0x10]
	b _080415BA
	.align 2, 0
_08041540: .4byte sa2__sub_801EC3C
_08041544: .4byte 0x00000336
_08041548: .4byte gStageTime
_0804154C:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _080415E0 @ =gOamMallocBuffer
	adds r4, r0, r1
	mov r3, sl
	ldrh r0, [r3, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _080415E4 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _080415BA
	ldr r1, _080415E8 @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _080415EC @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sl
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	ldr r4, [sp, #0x1c]
	subs r0, r4, r0
	movs r1, #0xff
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3]
	ldrh r2, [r3, #2]
	movs r1, #0xfe
	lsls r1, r1, #8
	adds r0, r1, #0
	ands r2, r0
	strh r2, [r3, #2]
	mov r4, sl
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _080415F0 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_080415BA:
	ldrh r0, [r5, #0xc]
	subs r0, #1
_080415BE:
	strh r0, [r5, #0xc]
_080415C0:
	adds r5, #0x10
	ldr r0, [sp, #0x14]
	subs r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0
	blt _080415CE
	b _080411C8
_080415CE:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080415E0: .4byte gOamMallocBuffer
_080415E4: .4byte iwram_end
_080415E8: .4byte 0x040000D4
_080415EC: .4byte 0x80000003
_080415F0: .4byte 0x000001FF

.syntax divided
