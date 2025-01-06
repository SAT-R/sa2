
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0804AC44 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0         @ r7 = boss
	adds r0, #0x48
	adds r6, r4, r0
	adds r0, r7, #0
	bl sub_804CC98
	adds r0, r7, #0
	bl sub_804CA08
	adds r0, r7, #0
	bl sub_804AE40
	ldr r5, _0804AC48 @ =sArmFuncs
	ldr r1, _0804AC4C @ =0x03000000 + 0x3C
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	bl _call_via_r2
	ldr r2, _0804AC50 @ =0x03000000 + 0x3D
	adds r4, r4, r2
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r0, r7, #0
	movs r1, #1
	bl _call_via_r2
	adds r0, r7, #0
	bl sub_804C5B8
	adds r0, r7, #0
	bl sub_804C830
	adds r0, r7, #0
	bl sub_804CA70
	ldr r4, _0804AC54 @ =gPlayer
	ldr r0, [r4, #0xc]
	asrs r0, r0, #8
	cmp r0, #0xb8
	ble _0804ABC0
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, _0804AC58 @ =0x0000A819
	cmp r0, r1
	ble _0804ABC0
	adds r0, r4, #0
	bl sub_800CBA4
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABB4
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_0804ABB4:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABC0
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_0804ABC0:
	ldr r4, _0804AC54 @ =gPlayer
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	ldr r1, _0804AC5C @ =0x0000A84F
	cmp r0, r1
	ble _0804ABEA
	adds r0, r4, #0
	bl sub_800CBA4
	movs r1, #0x10
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABDE
	rsbs r0, r0, #0
	strh r0, [r4, #0x10]
_0804ABDE:
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _0804ABEA
	rsbs r0, r0, #0
	strh r0, [r4, #0x14]
_0804ABEA:
	ldrb r4, [r7, #8]
	cmp r4, #0
	beq _0804ABF2
	b _0804AD54
_0804ABF2:
	ldr r2, _0804AC60 @ =gFlags
	ldr r0, [r2]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2]
	ldr r0, _0804AC44 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _0804AC64 @ =Task_804AD68
	str r0, [r1, #8]
	movs r0, #0xff
	str r0, [r7, #0x14]
	bl Player_DisableInputAndBossTimer_FinalBoss
	ldr r2, _0804AC54 @ =gPlayer
	ldr r1, [r2, #0x20]
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r0, r2, #0
	adds r0, #0x5c
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0804AC68
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	movs r0, #0xfe
	lsls r0, r0, #8
	strh r0, [r2, #0x10]
	strh r4, [r2, #0x12]
	adds r1, #9
	movs r0, #5
	strb r0, [r1]
	b _0804AC6E
	.align 2, 0
_0804AC44: .4byte gCurTask
_0804AC48: .4byte sArmFuncs
_0804AC4C: .4byte 0x03000000 + 0x3C
_0804AC50: .4byte 0x03000000 + 0x3D
_0804AC54: .4byte gPlayer
_0804AC58: .4byte 0x0000A819
_0804AC5C: .4byte 0x0000A84F
_0804AC60: .4byte gFlags
_0804AC64: .4byte Task_804AD68
_0804AC68:
	strh r0, [r2, #0x14]
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x12]
_0804AC6E:
	movs r1, #0
	strh r1, [r6]
	strh r1, [r6, #4]
	movs r0, #1
	strh r0, [r6, #2]
	movs r0, #0x10
	strh r0, [r6, #6]
	ldr r0, _0804AD2C @ =0x00003FBF
	strh r0, [r6, #8]
	strh r1, [r6, #0xa]
	movs r6, #0         @ r6 = i = 0
	adds r0, r7, #0     @ r0 = r7 = boss
	adds r0, #0x18
	str r0, [sp]        @ sp00 = &boss->qUnk18[0][0]
	adds r1, r7, #0
	adds r1, #0x28
	str r1, [sp, #8]    @ sp08 = &boss->qUnk28[0]
	adds r2, r7, #0
	adds r2, #0x1c
	str r2, [sp, #4]    @ sp04 = &boss->qUnk18[0][1]
	adds r0, #0x1c
	str r0, [sp, #0xc]  @ sp08 = &boss->qUnk34[0][0]
	adds r1, #0xe
	str r1, [sp, #0x10] @ sp08 = &boss->qUnk34[0][1]
	movs r2, #0x3c
	adds r2, r2, r7
	mov sl, r2          @ sl = &boss->unk3C[0]
	movs r0, #0x30
	adds r0, r0, r7
	mov sb, r0          @ sb = &boss->qUnk30[0]
	ldr r1, _0804AD30 @ =gSineTable
	mov r8, r1          @ r8 = r1 = gSineTable
	movs r2, #2
	mov ip, r2          @ ip = r2 = 2
_0804ACB2:
	lsls r2, r6, #3     @ r2 = i * 8
	ldr r0, [sp]
	adds r3, r0, r2     @ r3 = &boss->qUnk18[i][0]
	lsls r5, r6, #1     @ r5 = i * 2
	ldr r1, [sp, #8]
	adds r4, r1, r5     @ r4 = &boss->qUnk28[i]
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldrh r0, [r4]
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	asrs r1, r1, #6
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
	lsls r1, r6, #2     @ r1 = i * 4
	ldr r2, [sp, #0xc]
	adds r0, r2, r1
	ldr r2, _0804AD34 @ =0xFFFFFE80
	strh r2, [r0]       @ boss->qUnk34[i][0] = -Q(1.5);
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	movs r0, #0xfd
	lsls r0, r0, #8
	strh r0, [r1]       @ boss->qUnk34[i][1] = -Q(3);
	mov r2, sl          @ r2 = sl = &boss->unk3C[0]
	adds r1, r2, r6
	movs r0, #7
	strb r0, [r1]
	add r5, sb
	movs r0, #0x3c
	strh r0, [r5]
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	adds r0, #0x90
	adds r1, r7, r0
	cmp r6, #0
	beq _0804AD38
	movs r0, #0xb0
	lsls r0, r0, #2
	b _0804AD3A
	.align 2, 0
_0804AD2C: .4byte 0x00003FBF
_0804AD30: .4byte gSineTable
_0804AD34: .4byte 0xFFFFFE80
_0804AD38:
	ldr r0, _0804AD64 @ =0x000002BF
_0804AD3A:
	strh r0, [r1, #0xa]
	adds r0, r1, #0
	adds r0, #0x20
	mov r2, ip
	strb r2, [r0]
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #1
	bls _0804ACB2
_0804AD54:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD64: .4byte 0x000002BF
	
.syntax divided
