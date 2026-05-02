
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08040EC0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _08040EC4 @ =0x03000030
	adds r5, r1, r0
	ldr r2, [sp, #4]
	mov sb, r2
	ldr r3, _08040EC8 @ =0x03000330
	adds r0, r1, r3
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r4, _08040ECC @ =0x03000334
	adds r1, r1, r4
	ldrh r1, [r1]
	str r1, [sp, #0xc]
	movs r0, #0
	str r0, [sp, #0x10]
	mov r0, sb
	bl UpdateSpriteAnimation
	movs r1, #0x2f
	str r1, [sp, #0x14]
_08040D9C:
	ldrh r0, [r5, #0xc]
	cmp r0, #0
	bne _08040DA4
	b _08041154
_08040DA4:
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
	asrs r7, r1, #8
	asrs r0, r0, #8
	mov r8, r0
	ldr r4, _08040ED0 @ =gCamera
	movs r1, #0
	ldrsh r0, [r4, r1]
	subs r0, r7, r0
	str r0, [sp, #0x18]
	movs r2, #2
	ldrsh r0, [r4, r2]
	mov r3, r8
	subs r3, r3, r0
	mov sl, r3
	ldr r6, _08040ED4 @ =gPlayer
	ldr r2, [r6, #0x64]
	ldrh r4, [r5, #0xc]
	mov ip, r4
	ldr r0, [sp, #0xc]
	cmp ip, r0
	ble _08040DE2
	b _08040EEC
_08040DE2:
	adds r0, r6, #0
	adds r0, #0x40
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0xf
	bne _08040DF8
	movs r3, #0x1c
	ldrsh r0, [r6, r3]
	cmp r0, #0
	beq _08040DF8
	b _08040EEC
_08040DF8:
	cmp r1, #0x28
	beq _08040EEC
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08040EEC
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
	bgt _08040E28
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _08040E34
	cmp r2, r1
	blt _08040EEC
_08040E28:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08040EEC
_08040E34:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08040E4E
	cmp r8, r1
	bge _08040E5A
	cmp r2, r1
	blt _08040EEC
_08040E4E:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08040EEC
_08040E5A:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r4, r8
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08040ED8 @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08040EDC @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	beq _08040EA8
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08040EA8
	ldr r0, _08040EE0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040EA8
	ldr r1, _08040EE4 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08040EE8 @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_08040EA8:
	ldr r0, _08040EE0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	bne _08040EBC
	ldr r1, _08040ED8 @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08040EBC
	movs r0, #0xff
	strh r0, [r1]
_08040EBC:
	movs r0, #0
	b _08041152
	.align 2, 0
_08040EC0: .4byte gCurTask
_08040EC4: .4byte 0x03000030
_08040EC8: .4byte 0x03000330
_08040ECC: .4byte 0x03000334
_08040ED0: .4byte gCamera
_08040ED4: .4byte gPlayer
_08040ED8: .4byte gRingCount
_08040EDC: .4byte gCurrentLevel
_08040EE0: .4byte gGameMode
_08040EE4: .4byte gNumLives
_08040EE8: .4byte gMusicManagerState
_08040EEC:
	ldr r0, _08040FE4 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _08040EFA
	b _08041000
_08040EFA:
	ldr r6, _08040FE8 @ =gPartner
	ldr r2, [r6, #0x64]
	ldr r0, [sp, #0xc]
	cmp ip, r0
	ble _08040F06
	b _08041000
_08040F06:
	adds r0, r6, #0
	adds r0, #0x40
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0xf
	bne _08040F1A
	movs r3, #0x1c
	ldrsh r0, [r6, r3]
	cmp r0, #0
	bne _08041000
_08040F1A:
	cmp r1, #0x28
	beq _08041000
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08041000
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
	bgt _08040F4A
	adds r0, r7, #0
	adds r0, #8
	cmp r0, r1
	bge _08040F56
	cmp r2, r1
	blt _08041000
_08040F4A:
	movs r0, #2
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08041000
_08040F56:
	mov r2, r8
	subs r2, #0x10
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	movs r3, #1
	ldrsb r3, [r4, r3]
	adds r1, r0, r3
	cmp r2, r1
	bgt _08040F70
	cmp r8, r1
	bge _08040F7C
	cmp r2, r1
	blt _08041000
_08040F70:
	movs r0, #3
	ldrsb r0, [r4, r0]
	subs r0, r0, r3
	adds r0, r1, r0
	cmp r0, r2
	blt _08041000
_08040F7C:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r4, r8
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl CreateCollectRingEffect
	ldr r1, _08040FEC @ =gRingCount
	ldrh r6, [r1]
	adds r0, r6, #1
	strh r0, [r1]
	ldr r0, _08040FF0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xd
	beq _08040FCA
	ldrh r0, [r1]
	movs r1, #0x64
	bl Div
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	cmp r4, r0
	beq _08040FCA
	ldr r0, _08040FF4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040FCA
	ldr r1, _08040FF8 @ =gNumLives
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08040FFC @ =gMusicManagerState
	movs r0, #0x10
	strb r0, [r1, #3]
_08040FCA:
	ldr r0, _08040FF4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #6
	bne _08040FDE
	ldr r1, _08040FEC @ =gRingCount
	ldrh r0, [r1]
	cmp r0, #0xff
	bls _08040FDE
	movs r0, #0xff
	strh r0, [r1]
_08040FDE:
	movs r0, #0
	b _08041152
	.align 2, 0
_08040FE4: .4byte gNumSingleplayerCharacters
_08040FE8: .4byte gPartner
_08040FEC: .4byte gRingCount
_08040FF0: .4byte gCurrentLevel
_08040FF4: .4byte gGameMode
_08040FF8: .4byte gNumLives
_08040FFC: .4byte gMusicManagerState
_08041000:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _08041034
	mov r0, r8
	subs r0, #0x10
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r1, _080410D4 @ =sa2__sub_801EC3C
	str r1, [sp]
	adds r1, r7, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sa2__sub_801F100
	cmp r0, #0
	bgt _08041034
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	subs r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08041034:
	ldr r4, [sp, #4]
	ldr r1, _080410D8 @ =0x00000336
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08041074
	movs r2, #0xa
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08041074
	movs r3, #0xe
	ldrsh r2, [r5, r3]
	ldr r0, _080410D4 @ =sa2__sub_801EC3C
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #8
	bl sa2__sub_801F100
	cmp r0, #0
	bgt _08041074
	lsls r1, r0, #8
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	ldrh r1, [r5, #0xa]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x12
	subs r0, r0, r1
	strh r0, [r5, #0xa]
_08041074:
	ldrh r0, [r5, #0xa]
	ldr r4, [sp, #8]
	subs r0, r0, r4
	strh r0, [r5, #0xa]
	ldr r0, [sp, #0x18]
	adds r0, #7
	cmp r0, #0xfe
	bhi _0804114E
	movs r0, #8
	rsbs r0, r0, #0
	cmp sl, r0
	ble _0804114E
	mov r0, sl
	cmp r0, #0xa7
	bgt _0804114E
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080410A4
	ldr r0, _080410DC @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804114E
_080410A4:
	mov r2, sb
	adds r2, #0x23
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _080410B6
	adds r1, r2, #0
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080410E0
_080410B6:
	movs r0, #0xff
	strb r0, [r2]
	mov r2, sp
	ldrh r3, [r2, #0x18]
	mov r2, sb
	strh r3, [r2, #0x16]
	mov r4, sl
	strh r4, [r2, #0x18]
	mov r0, sb
	bl DisplaySprite
	movs r0, #1
	str r0, [sp, #0x10]
	b _0804114E
	.align 2, 0
_080410D4: .4byte sa2__sub_801EC3C
_080410D8: .4byte 0x00000336
_080410DC: .4byte gStageTime
_080410E0:
	ldrb r0, [r1]
	lsls r0, r0, #3
	ldr r1, _08041174 @ =gOamMallocBuffer
	adds r4, r0, r1
	mov r1, sb
	ldrh r0, [r1, #0x1a]
	movs r2, #0xf8
	lsls r2, r2, #3
	adds r1, r2, #0
	ands r0, r1
	lsrs r0, r0, #6
	bl OamMalloc
	adds r3, r0, #0
	ldr r0, _08041178 @ =iwram_end
	ldr r0, [r0]
	cmp r0, r3
	beq _0804114E
	ldr r1, _0804117C @ =0x040000D4
	str r4, [r1]
	str r3, [r1, #4]
	ldr r0, _08041180 @ =0x80000003
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrh r2, [r3]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	ands r2, r0
	strh r2, [r3]
	mov r1, sb
	ldr r0, [r1, #0xc]
	ldrh r0, [r0, #0xa]
	mov r4, sl
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
	mov r4, sb
	ldr r0, [r4, #0xc]
	ldrh r0, [r0, #8]
	ldr r1, [sp, #0x18]
	subs r0, r1, r0
	ldr r4, _08041184 @ =0x000001FF
	adds r1, r4, #0
	ands r0, r1
	adds r2, r2, r0
	strh r2, [r3, #2]
_0804114E:
	ldrh r0, [r5, #0xc]
	subs r0, #1
_08041152:
	strh r0, [r5, #0xc]
_08041154:
	adds r5, #0x10
	ldr r0, [sp, #0x14]
	subs r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0
	blt _08041162
	b _08040D9C
_08041162:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041174: .4byte gOamMallocBuffer
_08041178: .4byte iwram_end
_0804117C: .4byte 0x040000D4
_08041180: .4byte 0x80000003
_08041184: .4byte 0x000001FF

.syntax divided
