.include "asm/macros.inc"
.include "constants/constants.inc"
    
.text
.syntax unified
.arm

@ Input:
    @ R0 = Player *
    @ R1 = Sprite * (player->unk90)
	thumb_func_start sub_8024B10
sub_8024B10: @ 0x08024B10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r5, #0xc
	adds r6, r1, #0
	ldr r0, _08024BBC @ =gCamera
	ldrh r3, [r0]
	ldrh r4, [r0, #4]
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08024B3A
	ldrh r1, [r5, #0x1e]
	ldr r0, _08024BC0 @ =0x0000FFFF
	cmp r1, r0
	bne _08024B3C
_08024B3A:
	movs r2, #1
_08024B3C:
	mov sb, r2
	ldr r2, [r7, #8]
	asrs r2, r2, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r5, #0x16]
	ldr r1, [r7, #0xc]
	asrs r1, r1, #8
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	strh r2, [r6, #6]
	strh r1, [r6, #8]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #9
	beq _08024B84
	cmp r0, #0x29
	beq _08024B84
	cmp r0, #0x3e
	beq _08024B84
	cmp r0, #0x3f
	beq _08024B84
	cmp r0, #0x57
	bne _08024C68
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08024C68
_08024B84:
	adds r0, r7, #0
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #2
	strh r0, [r6]
	ldr r1, [r5, #0x10]
	ldr r0, _08024BC4 @ =0xFFFFF3FF
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	movs r2, #0x20
	orrs r0, r2
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	orrs r1, r0
	str r1, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024BC8
	movs r0, #0xff
	lsls r0, r0, #8
	b _08024BCC
	.align 2, 0
_08024BBC: .4byte gCamera
_08024BC0: .4byte 0x0000FFFF
_08024BC4: .4byte 0xFFFFF3FF
_08024BC8:
	movs r0, #0x80
	lsls r0, r0, #1
_08024BCC:
	strh r0, [r6, #2]
	ldr r2, _08024C14 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024BE2
	ldrh r0, [r6, #2]
	rsbs r0, r0, #0
	strh r0, [r6, #2]
_08024BE2:
	movs r1, #2
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _08024BF0
	ldrh r0, [r6, #6]
	subs r0, #1
	strh r0, [r6, #6]
_08024BF0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08024C20
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
	ldrh r1, [r6]
	adds r1, r1, r0
	ldr r2, _08024C18 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _08024C1C @ =0x000003FF
	ands r0, r1
	strh r0, [r6]
	b _08024C26
	.align 2, 0
_08024C14: .4byte gUnknown_03005424
_08024C18: .4byte 0xFFFFFF00
_08024C1C: .4byte 0x000003FF
_08024C20:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #4]
_08024C26:
	movs r3, #2
	ldrsh r1, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r6, r3]
	adds r0, r7, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r6, #2]
	strh r0, [r6, #4]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	ldr r0, _08024C64 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8004860
	b _08024CC2
	.align 2, 0
_08024C64: .4byte gGameMode
_08024C68:
	movs r0, #0
	strh r0, [r6]
	ldr r2, [r5, #0x10]
	subs r0, #0x40
	ands r2, r0
	str r2, [r5, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024C88
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	str r2, [r5, #0x10]
	b _08024C94
_08024C88:
	ldr r0, _08024CAC @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r5, #0x10]
	ldrh r0, [r5, #0x16]
	adds r0, #1
	strh r0, [r5, #0x16]
_08024C94:
	ldr r0, _08024CB0 @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024CB4
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	b _08024CBA
	.align 2, 0
_08024CAC: .4byte 0xFFFFFBFF
_08024CB0: .4byte gUnknown_03005424
_08024CB4:
	ldr r0, [r5, #0x10]
	ldr r1, _08024D9C @ =0xFFFFF7FF
	ands r0, r1
_08024CBA:
	str r0, [r5, #0x10]
	adds r0, r5, #0
	bl UpdateSpriteAnimation
_08024CC2:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	ldr r1, [r7, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08024CF2
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08024CF8
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024CF2
	ldr r0, _08024DA4 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08024CF8
_08024CF2:
	adds r0, r5, #0
	bl DisplaySprite
_08024CF8:
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08024D02
	b _08024F5C
_08024D02:
	ldr r4, _08024DA8 @ =gMultiSioSend
	ldr r2, _08024DAC @ =gMultiplayerPlayerTasks
	ldr r0, _08024DB0 @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov ip, r1
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r4]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x7c
	asrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r0, [r7, #0xc]
	asrs r0, r0, #8
	strh r0, [r4, #4]
	ldrh r3, [r5, #0xa]
	strh r3, [r4, #6]
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	ldr r0, _08024DA0 @ =gGameMode
	ldrb r0, [r0]
	mov r8, r2
	cmp r0, #5
	bne _08024D6C
	ldr r1, _08024DB4 @ =gPlayerCharacterIdleAnims
	adds r0, r7, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	subs r1, r3, r1
	ldr r0, _08024DB8 @ =gRingCount
	ldrh r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r4, #6]
_08024D6C:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r7, #0x17]
	lsls r0, r0, #4
	ldrb r1, [r1]
	orrs r0, r1
	strb r0, [r4, #0xb]
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r4, #0xc]
	ldrh r0, [r6]
	lsrs r0, r0, #2
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x10]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024DBC
	ldrh r0, [r4, #8]
	movs r1, #1
	orrs r0, r1
	b _08024DC2
	.align 2, 0
_08024D9C: .4byte 0xFFFFF7FF
_08024DA0: .4byte gGameMode
_08024DA4: .4byte gStageTime
_08024DA8: .4byte gMultiSioSend
_08024DAC: .4byte gMultiplayerPlayerTasks
_08024DB0: .4byte 0x04000128
_08024DB4: .4byte gPlayerCharacterIdleAnims
_08024DB8: .4byte gRingCount
_08024DBC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DD8 @ =0x0000FFFE
	ands r0, r1
_08024DC2:
	strh r0, [r4, #8]
	ldr r1, [r7, #0x20]
	movs r0, #1
	ands r0, r1
	adds r2, r1, #0
	cmp r0, #0
	bne _08024DDC
	ldrh r1, [r4, #8]
	movs r0, #2
	orrs r0, r1
	b _08024DE2
	.align 2, 0
_08024DD8: .4byte 0x0000FFFE
_08024DDC:
	ldrh r1, [r4, #8]
	ldr r0, _08024DF8 @ =0x0000FFFD
	ands r0, r1
_08024DE2:
	strh r0, [r4, #8]
	ldr r0, _08024DFC @ =gUnknown_03005424
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024E00
	ldrh r1, [r4, #8]
	movs r0, #8
	orrs r0, r1
	b _08024E06
	.align 2, 0
_08024DF8: .4byte 0x0000FFFD
_08024DFC: .4byte gUnknown_03005424
_08024E00:
	ldrh r1, [r4, #8]
	ldr r0, _08024E38 @ =0x0000FFF7
	ands r0, r1
_08024E06:
	strh r0, [r4, #8]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08024E2E
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r2
	cmp r0, #0
	bne _08024E2E
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _08024E3C
_08024E2E:
	ldrh r1, [r4, #8]
	movs r0, #4
	orrs r0, r1
	b _08024E42
	.align 2, 0
_08024E38: .4byte 0x0000FFF7
_08024E3C:
	ldrh r1, [r4, #8]
	ldr r0, _08024E5C @ =0x0000FFFB
	ands r0, r1
_08024E42:
	strh r0, [r4, #8]
	mov r3, ip
	ldr r0, [r3, #0x5c]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08024E60
	ldrh r1, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	b _08024E66
	.align 2, 0
_08024E5C: .4byte 0x0000FFFB
_08024E60:
	ldrh r1, [r4, #8]
	ldr r0, _08024E7C @ =0x0000FEFF
	ands r0, r1
_08024E66:
	strh r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08024E80
	ldrh r1, [r4, #8]
	movs r0, #0x40
	orrs r0, r1
	b _08024E86
	.align 2, 0
_08024E7C: .4byte 0x0000FEFF
_08024E80:
	ldrh r1, [r4, #8]
	ldr r0, _08024EB8 @ =0x0000FFBF
	ands r0, r1
_08024E86:
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldr r2, _08024EBC @ =0x0000FFCF
	ands r2, r0
	strh r2, [r4, #8]
	ldr r3, _08024EC0 @ =gPlayer
	adds r0, r3, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0xc0
	lsls r1, r1, #6
	ands r0, r1
	lsrs r1, r0, #8
	orrs r1, r2
	strh r1, [r4, #8]
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024EC4
	movs r0, #0x80
	orrs r1, r0
	b _08024EC8
	.align 2, 0
_08024EB8: .4byte 0x0000FFBF
_08024EBC: .4byte 0x0000FFCF
_08024EC0: .4byte gPlayer
_08024EC4:
	ldr r0, _08024EDC @ =0x0000FF7F
	ands r1, r0
_08024EC8:
	strh r1, [r4, #8]
	mov r0, sb
	cmp r0, #0
	beq _08024EE0
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	b _08024EE6
	.align 2, 0
_08024EDC: .4byte 0x0000FF7F
_08024EE0:
	ldrh r1, [r4, #8]
	ldr r0, _08024F68 @ =0x0000F7FF
	ands r0, r1
_08024EE6:
	strh r0, [r4, #8]
	ldr r6, _08024F6C @ =0x04000128
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	mov r2, ip
	adds r2, #0x64
	strb r0, [r2]
	ldr r0, [r3, #0x20]
	movs r1, #8
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08024F4C
	movs r2, #0
	ldr r0, [r6]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08024F2C
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	beq _08024F4C
_08024F16:
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	ldr r0, [r3, #0x3c]
	cmp r0, r1
	bne _08024F2C
	strb r2, [r5]
_08024F2C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bhi _08024F4C
	ldr r0, _08024F6C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, r2
	beq _08024F2C
	lsls r0, r2, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _08024F16
_08024F4C:
	ldrh r0, [r4, #8]
	ldr r1, _08024F70 @ =0x0000F9FF
	ands r1, r0
	strh r1, [r4, #8]
	ldrb r0, [r5]
	lsls r0, r0, #9
	orrs r0, r1
	strh r0, [r4, #8]
_08024F5C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F68: .4byte 0x0000F7FF
_08024F6C: .4byte 0x04000128
_08024F70: .4byte 0x0000F9FF

;@ void sub_8024F74(Player* player, PlayerSpriteInfo* playerUnk94)
	thumb_func_start sub_8024F74
sub_8024F74: @ 0x08024F74
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r6, #0xc
	adds r4, r1, #0
	ldr r0, _08024FB4 @ =gCamera
	ldrh r3, [r0]
	ldrh r7, [r0, #4]
	ldr r0, _08024FB8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08024FC4
	ldr r0, _08024FBC @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08024FC0 @ =gMultiSioRecv
	adds r1, r1, r0
	ldrh r2, [r1, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r2, r2, r0
	strh r2, [r4, #6]
	ldrh r1, [r1, #4]
	b _08024FD4
	.align 2, 0
_08024FB4: .4byte gCamera
_08024FB8: .4byte gGameMode
_08024FBC: .4byte 0x04000128
_08024FC0: .4byte gMultiSioRecv
_08024FC4:
	ldr r1, [r5, #8]
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #6]
	ldr r1, [r5, #0xc]
	asrs r1, r1, #8
_08024FD4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r4, #8]
	adds r2, r6, #0
	adds r2, #0x22
	movs r0, #0x10
	strb r0, [r2]
	ldr r1, [r5, #0x20]
	movs r0, #0x40
	ands r0, r1
	mov sl, r1
	cmp r0, #0
	beq _08024FF4
	movs r0, #8
	strb r0, [r2]
_08024FF4:
	adds r0, r5, #0
	adds r0, #0x85
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #4
	bls _08025004
	b _08025306
_08025004:
	lsls r0, r1, #2
	ldr r1, _08025010 @ =_08025014
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025010: .4byte _08025014
_08025014: @ jump table
	.4byte _08025306 @ case 0
	.4byte _08025028 @ case 1
	.4byte _08025180 @ case 2
	.4byte _08025306 @ case 3
	.4byte _08025306 @ case 4
_08025028:
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov ip, r2
	ldr r1, _080250B0 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08025058
	cmp r2, #1
	beq _0802506E
_08025058:
	cmp r1, #4
	bne _08025060
	cmp r2, #0
	beq _0802506E
_08025060:
	cmp r3, #0x46
	beq _08025066
	b _08025306
_08025066:
	mov r0, ip
	cmp r0, #0
	beq _0802506E
	b _08025306
_0802506E:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0xb0
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _080250B4 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080250B8
	movs r0, #0xff
	lsls r0, r0, #8
	b _080250BC
	.align 2, 0
_080250B0: .4byte gPlayerCharacterIdleAnims
_080250B4: .4byte gUnknown_030054B8
_080250B8:
	movs r0, #0x80
	lsls r0, r0, #1
_080250BC:
	strh r0, [r4, #2]
	ldr r2, _08025104 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080250D2
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_080250D2:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080250E0
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_080250E0:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025110
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025108 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802510C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _08025116
	.align 2, 0
_08025104: .4byte gUnknown_03005424
_08025108: .4byte 0xFFFFFF00
_0802510C: .4byte 0x000003FF
_08025110:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_08025116:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025174
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	beq _0802515E
	b _08025306
_0802515E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025174
	ldr r0, _0802517C @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025174
	b _08025306
_08025174:
	adds r0, r6, #0
	bl DisplaySprite
	b _08025306
	.align 2, 0
_0802517C: .4byte gStageTime
_08025180:
	movs r3, #0x10
	ldrsh r2, [r5, r3]
	mov ip, r2
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	mov sb, r0
	adds r0, r5, #0
	adds r0, #0x68
	ldrh r3, [r0]
	adds r0, #2
	ldrh r2, [r0]
	mov r8, r2
	ldr r1, _080251F4 @ =gPlayerCharacterIdleAnims
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080251BC
	cmp r2, #1
	beq _080251D2
_080251BC:
	cmp r1, #4
	bne _080251C4
	cmp r2, #0
	beq _080251D2
_080251C4:
	cmp r3, #0x46
	beq _080251CA
	b _08025306
_080251CA:
	mov r2, r8
	cmp r2, #0
	beq _080251D2
	b _08025306
_080251D2:
	mov r3, ip
	cmp r3, #0
	bne _080251DE
	mov r0, sb
	cmp r0, #0
	beq _080251F8
_080251DE:
	mov r0, ip
	mov r1, sb
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	adds r0, #0x40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _08025208
	.align 2, 0
_080251F4: .4byte gPlayerCharacterIdleAnims
_080251F8:
	movs r0, #1
	mov r1, sl
	ands r0, r1
	movs r1, #0x40
	cmp r0, #0
	beq _08025206
	movs r1, #0xc0
_08025206:
	adds r0, r1, #0
_08025208:
	adds r1, r5, #0
	adds r1, #0xad
	strb r0, [r1]
	lsls r0, r0, #2
	strh r0, [r4]
	ldr r0, [r6, #0x10]
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
	ldr r2, _08025244 @ =gUnknown_030054B8
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	movs r0, #0x20
	orrs r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, [r6, #0x10]
	orrs r0, r1
	str r0, [r6, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08025248
	movs r0, #0xff
	lsls r0, r0, #8
	b _0802524C
	.align 2, 0
_08025244: .4byte gUnknown_030054B8
_08025248:
	movs r0, #0x80
	lsls r0, r0, #1
_0802524C:
	strh r0, [r4, #2]
	ldr r2, _08025294 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08025262
	ldrh r0, [r4, #2]
	rsbs r0, r0, #0
	strh r0, [r4, #2]
_08025262:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08025270
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_08025270:
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080252A0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
	ldrh r1, [r4]
	adds r1, r1, r0
	ldr r2, _08025298 @ =0xFFFFFF00
	adds r0, r2, #0
	subs r0, r0, r1
	ldr r1, _0802529C @ =0x000003FF
	ands r0, r1
	strh r0, [r4]
	b _080252A6
	.align 2, 0
_08025294: .4byte gUnknown_03005424
_08025298: .4byte 0xFFFFFF00
_0802529C: .4byte 0x000003FF
_080252A0:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #4]
_080252A6:
	movs r3, #2
	ldrsh r1, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #4
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r0, #0x82
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r0, r2, r0
	asrs r0, r0, #8
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8004860
	ldr r1, [r5, #0x20]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08025300
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r1, r0
	cmp r1, #0
	bne _08025306
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08025300
	ldr r0, _08025314 @ =gStageTime
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025306
_08025300:
	adds r0, r6, #0
	bl DisplaySprite
_08025306:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025314: .4byte gStageTime
