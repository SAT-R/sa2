.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
	movs r2, #0
	str r2, [sp, #8]
	ldr r2, _08017F80 @ =gMultiplayerPlayerTasks
	lsls r0, r7, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	str r1, [sp]
	movs r6, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08017FD8
	ldr r0, _08017F84 @ =gGameMode
	ldrb r5, [r0]
	movs r0, #0x10
	mov ip, r0
	adds r4, r2, #0
	ldr r1, _08017F88 @ =0x04000128
	mov r8, r1
_08017F56:
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #4]
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	cmp r5, #3
	beq _08017F8C
	cmp r5, #5
	beq _08017F8C
	ldr r0, [r1, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08017FCA
	add sb, r1
	add sl, r1
	b _08017FCA
	.align 2, 0
_08017F80: .4byte gMultiplayerPlayerTasks
_08017F84: .4byte gGameMode
_08017F88: .4byte 0x04000128
_08017F8C:
	ldr r0, _08017FF8 @ =gMultiplayerConnections
	ldrb r3, [r0]
	mov r2, ip
	lsls r2, r6
	ands r2, r3
	adds r0, r6, #4
	asrs r2, r0
	mov r0, r8
	ldr r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	mov r0, ip
	lsls r0, r1
	ands r3, r0
	mov r1, r8
	ldr r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r0, #4
	asrs r3, r0
	cmp r2, r3
	beq _08017FCA
	ldr r2, _08017FFC @ =gMultiplayerRanks
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08017FCA
	movs r0, #1
	mov sb, r0
_08017FCA:
	adds r4, #4
	adds r6, #1
	cmp r6, #3
	bhi _08017FD8
	ldr r0, [r4]
	cmp r0, #0
	bne _08017F56
_08017FD8:
	ldr r1, _08017FFC @ =gMultiplayerRanks
	adds r0, r7, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08018000
	mov r2, sb
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	adds r0, r7, #0
	bl CreateMultiplayerFinishResult
	b _08018004
	.align 2, 0
_08017FF8: .4byte gMultiplayerConnections
_08017FFC: .4byte gMultiplayerRanks
_08018000:
	movs r0, #1
	str r0, [sp, #8]
_08018004:
	ldr r0, _08018180 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _0801801C
	mov r1, sl
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #4]
	subs r2, #1
	str r2, [sp, #0xc]
	cmp r0, #5
	bne _08018106
_0801801C:
	movs r6, #0
	ldr r0, _08018184 @ =gMultiplayerPlayerTasks
	ldr r0, [r0]
	mov r1, sl
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #4]
	subs r2, #1
	str r2, [sp, #0xc]
	cmp r0, #0
	beq _08018106
	movs r0, #0x10
	mov sl, r0
	mov r8, sl
	mov r1, r8
	lsls r1, r7
	mov r8, r1
	ldr r5, _08018188 @ =gPlayer
_08018040:
	cmp r6, r7
	beq _080180F4
	ldr r0, _0801818C @ =gMultiplayerRanks
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #1
	rsbs r2, r2, #0
	cmp r0, r2
	bne _080180F4
	ldr r0, _08018190 @ =gMultiplayerConnections
	ldrb r2, [r0]
	mov r0, sl
	lsls r0, r6
	ands r0, r2
	adds r1, r6, #4
	asrs r0, r1
	mov r1, r8
	ands r2, r1
	adds r1, r7, #4
	asrs r2, r1
	cmp r0, r2
	bne _080180F4
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	mov r2, sb
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl CreateMultiplayerFinishResult
	ldr r0, _08018194 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r6, r0
	bne _080180F4
	adds r0, r5, #0
	bl Player_TransitionCancelFlyingAndBoost
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x18
	ands r0, r1
	adds r1, #0x1c
	ands r0, r1
	subs r1, #0xc
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08018198 @ =0xFFFFFBFF
	ands r0, r1
	ldr r1, _0801819C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
	adds r4, r5, #0
	adds r4, #0x40
	movs r0, #0xf
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	movs r0, #6
	strb r0, [r5, #0xe]
	movs r0, #0xe
	strb r0, [r5, #0xf]
	adds r0, r5, #0
	adds r0, #0x3d
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r2, [r5, #0xc]
	strh r2, [r5, #8]
	ldr r1, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r2, [r5, #0x38]
	movs r0, #1
	orrs r1, r0
	movs r0, #0x1d
	strb r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #0x10
	orrs r1, r0
	str r1, [r5, #0x10]
_080180F4:
	adds r6, #1
	cmp r6, #3
	bhi _08018106
	ldr r0, _08018184 @ =gMultiplayerPlayerTasks
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08018040
_08018106:
	ldr r1, [sp]
	ldr r0, [r1, #0x5c]
	movs r2, #1
	orrs r0, r2
	str r0, [r1, #0x5c]
	mov r0, sb
	cmp r0, #0
	bne _08018130
	ldr r3, _080181A0 @ =gStageFlags
	ldrh r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08018130
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _080181A4 @ =gCourseTime
	movs r0, #0xe1
	lsls r0, r0, #4
	str r0, [r1]
_08018130:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	cmp r1, r2
	bhs _08018144
	ldr r0, _08018180 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _08018144
	cmp r0, #5
	bne _080181E4
_08018144:
	movs r6, #0
	ldr r0, _08018184 @ =gMultiplayerPlayerTasks
	ldr r0, [r0]
	cmp r0, #0
	beq _080181DA
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	movs r4, #0
	ldr r5, _08018188 @ =gPlayer
_08018158:
	cmp r6, r7
	beq _080181C2
	ldr r0, _0801818C @ =gMultiplayerRanks
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r8
	bne _080181C2
	ldr r0, _08018180 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #3
	beq _08018176
	cmp r0, #5
	bne _080181A8
_08018176:
	lsrs r0, r4, #0x18
	movs r1, #1
	bl CreateMultiplayerFinishResult
	b _080181C2
	.align 2, 0
_08018180: .4byte gGameMode
_08018184: .4byte gMultiplayerPlayerTasks
_08018188: .4byte gPlayer
_0801818C: .4byte gMultiplayerRanks
_08018190: .4byte gMultiplayerConnections
_08018194: .4byte 0x04000128
_08018198: .4byte 0xFFFFFBFF
_0801819C: .4byte 0xFFFFFEFF
_080181A0: .4byte gStageFlags
_080181A4: .4byte gCourseTime
_080181A8:
	lsrs r0, r4, #0x18
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl CreateMultiplayerFinishResult
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x10]
	movs r0, #0
	strh r0, [r5, #0x38]
_080181C2:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r4, r4, r0
	adds r6, #1
	cmp r6, #3
	bhi _080181DA
	ldr r0, _080181F4 @ =gMultiplayerPlayerTasks
	lsls r1, r6, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _08018158
_080181DA:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _080181E4
	bl CreateMultiplayerFinishHandler
_080181E4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080181F4: .4byte gMultiplayerPlayerTasks

.syntax divided
