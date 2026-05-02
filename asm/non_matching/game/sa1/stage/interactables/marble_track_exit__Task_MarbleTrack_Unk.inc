.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _080829BC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r1]
	str r0, [sp, #0x10]
	ldrb r1, [r1, #8]
	lsls r1, r1, #3
	mov r2, r8
	ldrh r0, [r2, #4]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, [sp, #0x10]
	ldrb r2, [r3, #1]
	lsls r2, r2, #3
	mov r4, r8
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldr r3, _080829C0 @ =gCamera
	ldrh r0, [r3]
	lsrs r4, r1, #0x10
	str r4, [sp]
	asrs r1, r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	ldrh r0, [r3, #2]
	lsrs r1, r2, #0x10
	str r1, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	movs r4, #0
	ldr r5, _080829C4 @ =gPartner
	ldr r7, _080829C8 @ =gPlayer
	movs r2, #0
	str r2, [sp, #0x14]
	mov sl, r2
_080829B2:
	cmp r4, #0
	beq _080829CC
	ldr r0, [r5, #0x10]
	b _080829CE
	.align 2, 0
_080829BC: .4byte gCurTask
_080829C0: .4byte gCamera
_080829C4: .4byte gPartner
_080829C8: .4byte gPlayer
_080829CC:
	ldr r0, [r7, #0x10]
_080829CE:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080829D8
	b _08082DC8
_080829D8:
	mov r2, r8
	adds r2, #0x4c
	ldrb r1, [r2]
	asrs r1, r4
	movs r0, #1
	ands r1, r0
	mov sb, r2
	cmp r1, #0
	bne _080829EC
	b _08082C08
_080829EC:
	cmp r4, #0
	beq _080829F8
	ldrh r0, [r5, #0xa]
	adds r0, #0x2a
	strh r0, [r5, #0xa]
	b _080829FE
_080829F8:
	ldrh r0, [r7, #0xa]
	adds r0, #0x2a
	strh r0, [r7, #0xa]
_080829FE:
	cmp r4, #0
	beq _08082A08
	movs r3, #0xa
	ldrsh r1, [r5, r3]
	b _08082A0C
_08082A08:
	movs r0, #0xa
	ldrsh r1, [r7, r0]
_08082A0C:
	cmp r4, #0
	beq _08082A18
	ldr r0, [r5, #4]
	adds r0, r0, r1
	str r0, [r5, #4]
	b _08082A1E
_08082A18:
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
_08082A1E:
	mov r0, r8
	adds r0, #0x3c
	ldr r2, [sp, #0x14]
	adds r1, r0, r2
	ldr r2, [r1]
	mov ip, r0
	cmp r4, #0
	beq _08082A34
	movs r3, #0xa
	ldrsh r0, [r5, r3]
	b _08082A38
_08082A34:
	movs r3, #0xa
	ldrsh r0, [r7, r3]
_08082A38:
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _08082A64 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	asrs r0, r0, #0x19
	cmp r0, #1
	beq _08082A4E
	cmp r1, #0xf
	bne _08082ACE
_08082A4E:
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r2, r0, #8
	adds r1, r0, #0
	cmp r4, #0
	beq _08082A68
	ldr r0, [r5]
	cmp r0, r2
	blt _08082A6E
	b _08082A9C
	.align 2, 0
_08082A64: .4byte gCurrentLevel
_08082A68:
	ldr r0, [r7]
	cmp r0, r2
	bge _08082A9C
_08082A6E:
	cmp r4, #0
	beq _08082A7A
	ldr r0, [r5]
	adds r0, #0x80
	str r0, [r5]
	b _08082A80
_08082A7A:
	ldr r0, [r7]
	adds r0, #0x80
	str r0, [r7]
_08082A80:
	asrs r2, r1, #8
	cmp r4, #0
	beq _08082A8E
	ldr r0, [r5]
	cmp r0, r2
	bgt _08082A94
	b _08082ACE
_08082A8E:
	ldr r0, [r7]
	cmp r0, r2
	ble _08082ACE
_08082A94:
	asrs r0, r1, #8
	cmp r4, #0
	bne _08082AC8
	b _08082ACC
_08082A9C:
	cmp r4, #0
	beq _08082AA8
	ldr r0, [r5]
	subs r0, #0x80
	str r0, [r5]
	b _08082AAE
_08082AA8:
	ldr r0, [r7]
	subs r0, #0x80
	str r0, [r7]
_08082AAE:
	asrs r2, r1, #8
	cmp r4, #0
	beq _08082ABC
	ldr r0, [r5]
	cmp r0, r2
	blt _08082AC2
	b _08082ACE
_08082ABC:
	ldr r0, [r7]
	cmp r0, r2
	bge _08082ACE
_08082AC2:
	asrs r0, r1, #8
	cmp r4, #0
	beq _08082ACC
_08082AC8:
	str r0, [r5]
	b _08082ACE
_08082ACC:
	str r0, [r7]
_08082ACE:
	ldr r3, _08082B48 @ =gPlayer + 0x6D
	adds r0, r3, #0
	cmp r4, #0
	beq _08082AD8
	ldr r0, _08082B4C @ =gPartner + 0x6D
_08082AD8:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x4d
	adds r6, r1, #0
	ldrb r2, [r6]
	cmp r0, r2
	bgt _08082B18
	lsls r0, r4, #1
	subs r1, #9
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	mov r1, r8
	adds r1, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bhs _08082B18
	ldr r0, [sp, #0x14]
	add r0, ip
	ldr r1, [r0]
	asrs r1, r1, #8
	mov r0, r8
	adds r0, #0x4a
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08082B94
_08082B18:
	adds r0, r3, #0
	cmp r4, #0
	beq _08082B20
	ldr r0, _08082B4C @ =gPartner + 0x6D
_08082B20:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r6, [r6]
	cmp r0, r6
	bne _08082B80
	adds r1, r3, #0
	cmp r4, #0
	beq _08082B34
	ldr r1, _08082B4C @ =gPartner + 0x6D
_08082B34:
	movs r0, #0x7f
	strb r0, [r1]
	cmp r4, #0
	beq _08082B54
	ldr r0, [r5, #0x10]
	ldr r1, _08082B50 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08082B5C
	.align 2, 0
_08082B48: .4byte gPlayer + 0x6D
_08082B4C: .4byte gPartner + 0x6D
_08082B50: .4byte 0xFFBFFFFF
_08082B54:
	ldr r0, [r7, #0x10]
	ldr r1, _08082B6C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r7, #0x10]
_08082B5C:
	cmp r4, #0
	beq _08082B74
	ldr r3, _08082B70 @ =gPartner + 0x26
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _08082B80
	.align 2, 0
_08082B6C: .4byte 0xFFBFFFFF
_08082B70: .4byte gPartner + 0x26
_08082B74:
	ldr r0, _08082B90 @ =gPlayer + 0x26
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	ldr r1, _08082B90 @ =gPlayer + 0x26
	strb r0, [r1]
_08082B80:
	movs r1, #1
	lsls r1, r4
	mov r2, sb
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	b _08082E00
	.align 2, 0
_08082B90: .4byte gPlayer + 0x26
_08082B94:
	cmp r4, #0
	beq _08082BA4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08082BAE
_08082BA4:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r7, #0x10]
_08082BAE:
	adds r2, r3, #0
	subs r2, #0x6d
	cmp r4, #0
	beq _08082BBC
	mov r3, sl
	strh r3, [r5, #8]
	b _08082BBE
_08082BBC:
	strh r4, [r2, #8]
_08082BBE:
	cmp r4, #0
	beq _08082BC8
	mov r0, sl
	strh r0, [r5, #0xc]
	b _08082BCA
_08082BC8:
	strh r4, [r2, #0xc]
_08082BCA:
	ldr r0, _08082C00 @ =gPlayer
	cmp r4, #0
	beq _08082BD2
	ldr r0, _08082C04 @ =gPartner
_08082BD2:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08082C00 @ =gPlayer
	cmp r4, #0
	beq _08082BE0
	ldr r1, _08082C04 @ =gPartner
_08082BE0:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08082C00 @ =gPlayer
	cmp r4, #0
	beq _08082BEC
	ldr r1, _08082C04 @ =gPartner
_08082BEC:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #1
	lsls r0, r4
	mov r2, sb
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	b _08082E00
	.align 2, 0
_08082C00: .4byte gPlayer
_08082C04: .4byte gPartner
_08082C08:
	cmp r4, #0
	beq _08082C1E
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08082C2E
	mov r6, r8
	adds r6, #0x4d
	b _08082C48
_08082C1E:
	ldr r1, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r1, r0
	mov r6, r8
	adds r6, #0x4d
	cmp r1, #0
	beq _08082C48
_08082C2E:
	ldr r0, _08082C68 @ =gPlayer + 0x6D
	cmp r4, #0
	beq _08082C36
	ldr r0, _08082C6C @ =gPartner + 0x6D
_08082C36:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x4d
	adds r6, r1, #0
	ldrb r3, [r6]
	cmp r0, r3
	blt _08082C50
_08082C48:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08082C50
	b _08082E00
_08082C50:
	ldr r0, [sp]
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #0xc
	cmp r4, #0
	beq _08082C70
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08082C7A
	b _08082E00
	.align 2, 0
_08082C68: .4byte gPlayer + 0x6D
_08082C6C: .4byte gPartner + 0x6D
_08082C70:
	ldr r0, [r7]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08082C7A
	b _08082E00
_08082C7A:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0xc
	cmp r4, #0
	beq _08082C8E
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08082C98
	b _08082E00
_08082C8E:
	ldr r0, [r7]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08082C98
	b _08082E00
_08082C98:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #0xc
	cmp r4, #0
	beq _08082CB0
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08082CBA
	b _08082E00
_08082CB0:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08082CBA
	b _08082E00
_08082CBA:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0xc
	cmp r4, #0
	beq _08082CCE
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08082CD8
	b _08082E00
_08082CCE:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08082CD8
	b _08082E00
_08082CD8:
	lsls r0, r4, #1
	mov r1, r8
	adds r1, #0x44
	adds r1, r1, r0
	mov r3, sl
	strh r3, [r1]
	mov r0, r8
	adds r0, #0x3c
	ldr r1, [sp, #0x14]
	adds r0, r0, r1
	mov r2, sl
	str r2, [r0]
	cmp r4, #0
	beq _08082CFE
	ldr r0, [r5, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08082D06
_08082CFE:
	ldr r0, [r7, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r7, #0x10]
_08082D06:
	ldr r2, _08082D18 @ =gPlayer
	cmp r4, #0
	beq _08082D1C
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08082D26
	.align 2, 0
_08082D18: .4byte gPlayer
_08082D1C:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r7, #0x10]
_08082D26:
	cmp r4, #0
	beq _08082D30
	mov r3, sl
	strh r3, [r5, #0xa]
	b _08082D32
_08082D30:
	strh r4, [r2, #0xa]
_08082D32:
	cmp r4, #0
	beq _08082D3C
	mov r0, sl
	strh r0, [r5, #8]
	b _08082D3E
_08082D3C:
	strh r4, [r2, #8]
_08082D3E:
	cmp r4, #0
	beq _08082D48
	mov r1, sl
	strh r1, [r5, #0xc]
	b _08082D4A
_08082D48:
	strh r4, [r2, #0xc]
_08082D4A:
	ldr r0, _08082DA4 @ =gPlayer
	cmp r4, #0
	beq _08082D52
	ldr r0, _08082DA8 @ =gPartner
_08082D52:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08082DA4 @ =gPlayer
	cmp r4, #0
	beq _08082D60
	ldr r1, _08082DA8 @ =gPartner
_08082D60:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08082DA4 @ =gPlayer
	cmp r4, #0
	beq _08082D6C
	ldr r1, _08082DA8 @ =gPartner
_08082D6C:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #0xaa
	bl m4aSongNumStart
	movs r1, #1
	lsls r1, r4
	mov r2, sb
	ldrb r0, [r2]
	orrs r1, r0
	movs r2, #0
	mov r3, sb
	strb r1, [r3]
	ldr r1, _08082DAC @ =gPlayer + 0x6D
	cmp r4, #0
	beq _08082D8E
	ldr r1, _08082DB0 @ =gPartner + 0x6D
_08082D8E:
	ldrb r0, [r6]
	strb r0, [r1]
	cmp r4, #0
	beq _08082DB8
	ldr r1, _08082DB4 @ =gPartner + 0x26
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	ldr r2, _08082DB4 @ =gPartner + 0x26
	strb r0, [r2]
	b _08082E00
	.align 2, 0
_08082DA4: .4byte gPlayer
_08082DA8: .4byte gPartner
_08082DAC: .4byte gPlayer + 0x6D
_08082DB0: .4byte gPartner + 0x6D
_08082DB4: .4byte gPartner + 0x26
_08082DB8:
	ldr r3, _08082DC4 @ =gPlayer + 0x26
	ldrb r0, [r3]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	b _08082E00
	.align 2, 0
_08082DC4: .4byte gPlayer + 0x26
_08082DC8:
	mov r1, r8
	adds r1, #0x4c
	ldrb r3, [r1]
	adds r0, r3, #0
	asrs r0, r4
	movs r2, #1
	ands r0, r2
	mov sb, r1
	cmp r0, #0
	beq _08082E00
	adds r0, r2, #0
	lsls r0, r4
	bics r3, r0
	strb r3, [r1]
	cmp r4, #0
	beq _08082DF8
	ldr r0, [r5, #0x10]
	ldr r1, _08082DF4 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08082E00
	.align 2, 0
_08082DF4: .4byte 0xFFBFFFFF
_08082DF8:
	ldr r0, [r7, #0x10]
	ldr r1, _08082E8C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r7, #0x10]
_08082E00:
	ldr r0, [sp, #0x14]
	adds r0, #4
	str r0, [sp, #0x14]
	adds r4, #1
	ldr r0, _08082E90 @ =gNumSingleplayerCharacters
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov ip, r0
	cmp r4, r1
	bge _08082E16
	b _080829B2
_08082E16:
	mov r2, sb
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08082EC6
	ldr r3, [sp, #0xc]
	lsls r0, r3, #0x10
	movs r4, #0x80
	lsls r4, r4, #0x10
	adds r0, r0, r4
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08082E4A
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08082E4A
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r2, r0
	ble _08082EC6
_08082E4A:
	movs r2, #0
	ldr r3, _08082E94 @ =gCurTask
	mov sl, r3
	ldr r3, _08082E98 @ =gPlayer + 0x6D
	mov r6, r8
	adds r6, #0x4d
	ldr r7, _08082E9C @ =gPartner
	ldr r5, _08082E8C @ =0xFFBFFFFF
	adds r4, r3, #0
	subs r4, #0x6d
_08082E5E:
	adds r0, r3, #0
	cmp r2, #0
	beq _08082E66
	ldr r0, _08082EA0 @ =gPartner + 0x6D
_08082E66:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r6]
	cmp r0, r1
	bne _08082EAA
	mov r1, sb
	ldrb r0, [r1]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08082EAA
	cmp r2, #0
	beq _08082EA4
	ldr r0, [r7, #0x10]
	ands r0, r5
	str r0, [r7, #0x10]
	b _08082EAA
	.align 2, 0
_08082E8C: .4byte 0xFFBFFFFF
_08082E90: .4byte gNumSingleplayerCharacters
_08082E94: .4byte gCurTask
_08082E98: .4byte gPlayer + 0x6D
_08082E9C: .4byte gPartner
_08082EA0: .4byte gPartner + 0x6D
_08082EA4:
	ldr r0, [r4, #0x10]
	ands r0, r5
	str r0, [r4, #0x10]
_08082EAA:
	adds r2, #1
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blt _08082E5E
	mov r2, r8
	ldrb r0, [r2, #8]
	ldr r3, [sp, #0x10]
	strb r0, [r3]
	mov r4, sl
	ldr r0, [r4]
	bl TaskDestroy
_08082EC6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
