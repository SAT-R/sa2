
.syntax unified
.text
    push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0         @ r6 = s
	adds r7, r2, #0         @ r7 = spikes
	adds r5, r3, #0         @ r5 = player
	ldr r0, _08060A58 @ =gUnknown_03005590
	ldr r4, [r0]
	movs r0, #0x7f
	ands r4, r0             @ r4 = gUnknown_03005590 & 0x7F
	str r4, [sp, #0xc]

	movs r0, #0x60
	adds r0, r0, r5
	mov ip, r0              @ ip = &player->unk60
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r2              @ sl = player->unk60

	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0         @ r2 = screenX
	lsls r2, r2, #0x10

	ldrb r1, [r1, #1]       @ r1 = ia->y
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0         @ r1 = screenY
	lsls r1, r1, #0x10

	ldr r3, _08060A5C @ =gCamera
	ldr r0, [r3]            @ r3 = gCamera
	mov sb, r0              @ sb = gCamera.x
	lsrs r0, r2, #0x10
	str r0, [sp, #8]        @ sp08 = screenX

	asrs r2, r2, #0x10
	mov r8, r2
	mov r0, sb
	subs r2, r2, r0
	strh r2, [r6, #0x16]    @ s->x = screenX - gCamera.x
	ldr r0, [r3, #4]        @ r0 gCamera.y
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	mov sb, r1              @ sb = screenY
	subs r0, r1, r0
	strh r0, [r6, #0x18]    @ s->y = screenY - gCamera.y

	cmp r4, #0x3b
	bhi _08060A60

	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A34
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A34
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A34:
	mov r2, sl
	lsls r1, r2, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060A54
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060A54:
	movs r0, #0
	b sub_80609B4_return
	.align 2, 0
_08060A58: .4byte gUnknown_03005590
_08060A5C: .4byte gCamera
_08060A60:
	cmp r4, #0x3d
	bhi _08060AC4

	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060A80
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060A80
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060A80:
	mov r4, sl
	lsls r1, r4, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060AA0
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060AA0:
	ldr r1, _08060ABC @ =sSpikesOfZone
	ldr r0, _08060AC0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	b _08060C68
	.align 2, 0
_08060ABC: .4byte sSpikesOfZone
_08060AC0: .4byte gCurrentLevel
_08060AC4:
	cmp r4, #0x3f
	bhi _08060AEA
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060AE4
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060AE4
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060AE4:
	mov r0, sl
	lsls r1, r0, #2
	b _08060C34
_08060AEA:
	cmp r4, #0x7b
	bls _08060AF0
	b _08060C0E
_08060AF0:
	adds r3, r6, #0
	adds r3, #0x20
	ldrb r0, [r3]
	mov r4, ip
	ldrb r1, [r4]
	cmp r0, #0
	bne _08060B0A
	cmp r1, #0
	beq _08060BD4
	ldr r4, [sp, #0x30]
	ldr r0, [r4]
	cmp r0, #0
	beq _08060BD4
_08060B0A:
	cmp r1, #0
	bne _08060B14
	movs r0, #1
	ldr r1, [sp, #0x30]
	str r0, [r1]
_08060B14:
	ldr r1, _08060BAC @ =sSpikesOfZone
	ldr r0, _08060BB0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	movs r0, #0
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_800DF38
	movs r1, #0x80
	lsls r1, r1, #0xc
	cmp r0, r1
	beq _08060B46
	b sub_80609B4_return_1
_08060B46:
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_8060D08
	movs r1, #0xd0
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _08060B5E
	b sub_80609B4_return_1
_08060B5E:
	ldrb r4, [r5, #0x16]
	adds r4, #5
	rsbs r0, r4, #0
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r5, #0x17]
	movs r0, #1
	subs r0, r0, r3
	mov r2, sp
	adds r2, #5
	strb r0, [r2]
	mov r0, sp
	adds r0, #6
	strb r4, [r0]
	subs r3, #1
	adds r0, #1
	strb r3, [r0]
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _08060BB4 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08060BB8
	adds r0, r6, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	b _08060BCE
	.align 2, 0
_08060BAC: .4byte sSpikesOfZone
_08060BB0: .4byte gCurrentLevel
_08060BB4: .4byte gUnknown_03005424
_08060BB8:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sb
	mov r1, sp
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
_08060BCE:
	lsls r0, r0, #8
	str r0, [r5, #0xc]
	b _08060BFC
_08060BD4:
	ldr r4, [sp, #8]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_800CCB8
	mov r1, sl
	lsls r2, r1, #2
	adds r1, r7, #0
	adds r1, #0x3c
	adds r1, r1, r2
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq sub_80609B4_return_1
_08060BFC:
	adds r0, r5, #0
	bl sub_800CBA4
	cmp r0, #0
	beq sub_80609B4_return_1
	movs r0, #0x9a
	bl m4aSongNumStart
	b sub_80609B4_return_1
_08060C0E:
	ldr r2, [sp, #0xc]
	cmp r2, #0x7d
	bhi _08060C7C
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C30
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C30
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C30:
	mov r4, sl
	lsls r1, r4, #2
_08060C34:
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060C50
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060C50:
	ldr r1, _08060C74 @ =sSpikesOfZone
	ldr r0, _08060C78 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #2
_08060C68:
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
	b sub_80609B4_return_1
	.align 2, 0
_08060C74: .4byte sSpikesOfZone
_08060C78: .4byte gCurrentLevel
_08060C7C:
	ldr r1, [r5, #0x20]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08060C98
	ldr r0, [r5, #0x3c]
	cmp r0, r6
	bne _08060C98
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	str r1, [r5, #0x20]
_08060C98:
	mov r0, sl
	lsls r1, r0, #2
	adds r0, r7, #0
	adds r0, #0x3c
	adds r2, r0, r1
	ldr r0, [r2]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060CB8
	ldr r0, [r5, #0x20]
	subs r1, #0x41
	ands r0, r1
	str r0, [r5, #0x20]
	movs r0, #0
	str r0, [r2]
_08060CB8:
	ldr r1, _08060CEC @ =sSpikesOfZone
	ldr r0, _08060CF0 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0xa]
	adds r1, r6, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8004558
sub_80609B4_return_1:
	movs r0, #1
sub_80609B4_return:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08060CEC: .4byte sSpikesOfZone
_08060CF0: .4byte gCurrentLevel
    .syntax divided
