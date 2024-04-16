.include "asm/macros.inc"
.include "constants/constants.inc"
    
.text
.syntax unified
.arm

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
