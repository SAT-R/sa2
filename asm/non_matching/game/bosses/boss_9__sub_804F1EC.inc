.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0              @ r8 = unk558
	ldr r0, _0804F348 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r0, r1         @ r1 = boss
	ldr r2, _0804F34C @ =IWRAM_START + 0x1C
	adds r4, r0, r2         @ r4 = unk1C
	ldr r3, _0804F350 @ =IWRAM_START + 0x48
	adds r5, r0, r3         @ r5 = unk48
	ldr r6, _0804F354 @ =IWRAM_START + 0x98
	adds r6, r0, r6         @ r6 = unk98
	str r6, [sp, #0x10]     @ sp10 = unk98
	mov r0, r8
	adds r0, #0xc
	str r0, [sp, #0x14]     @ sp14 = s = unk558->s
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _0804F222
	b sub_804F1EC__return
_0804F222:
	mov r1, r8              @ r1 = r8 = unk558
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F23C
	ldr r0, _0804F358 @ =sub_8050DC8
	str r0, [r1]
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStop
_0804F23C:
	mov r2, r8              @ r2 = r8 = unk558
	ldr r0, [r2, #8]
	adds r7, r0, #2
	movs r0, #0xe8
	lsls r0, r0, #1
	cmp r7, r0
	ble _0804F24C
	adds r7, r0, #0
_0804F24C:
	mov r3, r8              @ r3 = r8 = unk558
	str r7, [r3, #8]
	movs r6, #0x20
	ldrsh r0, [r4, r6]
	lsls r0, r0, #8         @ r0 = Q(unk1C->unk20)
	ldr r1, [r4, #0x24]
	adds r1, r1, r0
	mov sl, r1              @ sl = qX = unk1C->qPos.x + Q(unk1C->unk20);
	movs r1, #0x22
	ldrsh r0, [r4, r1]
	lsls r0, r0, #8
	ldr r1, [r4, #0x28]
	adds r1, r1, r0
	mov sb, r1              @ sb = qY = unk1C->qPos.y + Q(unk1C->unk22);
	ldr r1, [r5, #0x44]
	asrs r1, r1, #8
	ldrh r5, [r5, #0x3a]
	adds r1, r1, r5
	movs r2, #0xc0
	lsls r2, r2, #2
	mov ip, r2
	add r1, ip
	ldr r3, _0804F35C @ =0x000003FF
	adds r4, r3, #0
	ands r1, r4
	ldr r3, _0804F360 @ =gSineTable
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	add sl, r0               @ qX +=
	lsls r0, r1, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r2, [r0, r6]
	lsls r0, r2, #3
	adds r0, r0, r2
	asrs r0, r0, #6
	add sb, r0              @ qY +=
	add r1, ip
	ands r1, r4
	adds r0, r1, r5
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r2, #0x26
	muls r0, r2, r0
	asrs r0, r0, #6
	add sl, r0               @ qX +=
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #6
	add sb, r0
	add r1, sp, #0xc        @ sp0C = sonicY
	add r0, sp, #8          @ sp08 ? sonicX
	bl SuperSonicGetPos
	ldr r0, [sp, #8]
	movs r1, #0xa0
	lsls r1, r1, #4
	add r1, sl
	movs r4, #2
	str r4, [sp]
	adds r2, r7, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r5, r7, r5
	str r4, [sp]
	mov r1, sb
	adds r2, r5, #0
	movs r3, #0xa
	bl sub_8085698
	adds r1, r0, #0
	str r1, [sp, #0xc]
	ldr r0, [sp, #8]
	bl SuperSonicSetPos
	mov r6, sl              @ r6 = sl = qX
	asrs r4, r6, #8
	mov r0, sb              @ r0 = sb = qY
	asrs r5, r0, #8
	ldr r0, [sp, #0x14]     @ r0 = s
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_804F010
	cmp r0, #1
	bne _0804F36C
	bl sub_802C798
	ldr r0, _0804F364 @ =sub_804F47C
	mov r1, r8              @ r1 = r8 = unk558
	str r0, [r1]
	movs r0, #0x78
	strh r0, [r1, #6]
	movs r0, #0xa
	strb r0, [r1, #4]
	ldr r0, _0804F368 @ =0x000002CB
	ldr r2, [sp, #0x14]     @ r2 = s
	strh r0, [r2, #0xa]
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2, #0x10]
	b sub_804F1EC__return
	.align 2, 0
_0804F348: .4byte gCurTask
_0804F34C: .4byte IWRAM_START + 0x1C
_0804F350: .4byte IWRAM_START + 0x48
_0804F354: .4byte IWRAM_START + 0x98
_0804F358: .4byte sub_8050DC8
_0804F35C: .4byte 0x000003FF
_0804F360: .4byte gSineTable
_0804F364: .4byte sub_804F47C
_0804F368: .4byte 0x000002CB
_0804F36C:
	movs r0, #0x87
	lsls r0, r0, #1
	bl m4aSongNumStartOrContinue
	ldr r1, _0804F474 @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	ldr r3, [sp, #0x14]     @ r3 = s
	strh r0, [r3, #0x16]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	strh r0, [r3, #0x18]
	ldr r0, [sp, #0x14]
	bl UpdateSpriteAnimation
	ldr r0, [sp, #0x14]
	bl DisplaySprite
	movs r6, #0
	movs r4, #2
	mov r8, r4              @ r8 = r4 = 2
_0804F396:
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, #0x10
	ldr r1, [sp, #0x10]     @ r1 = sp10 = unk98
	adds r5, r1, r0         @ r5 = unkA8 = unk98->unk10
	ldrb r1, [r5, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F458
	ldr r0, [r5, #0x18]
	mov r2, sb
	subs r0, r0, r2
	lsls r0, r0, #8
	asrs r0, r0, #0x10      @ r0 = Q()
	ldr r1, [r5, #0x14]
	mov r3, sl
	subs r1, r1, r3
	lsls r1, r1, #8
	asrs r1, r1, #0x10
	bl sub_8004418
	lsls r0, r0, #0x10
	ldr r4, _0804F478 @ =0xFED30000
	adds r0, r0, r4
	movs r1, #0xd3
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0804F3DC
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0804F430
_0804F3DC:
	ldr r4, [r5, #0x1c]
	adds r7, r4, #0
	adds r7, #0xa
	movs r0, #1
	strb r0, [r5, #6]
	str r7, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	mov r1, r8
	str r1, [sp]
	movs r1, #0xb0
	lsls r1, r1, #5
	add r1, sl
	adds r2, r7, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x18]
	adds r4, #0xaa
	mov r2, r8
	str r2, [sp]
	mov r1, sb
	adds r2, r4, #0
	movs r3, #0xa
	bl sub_8085698
	str r0, [r5, #0x18]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	movs r4, #0x5a
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0xe]
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	muls r0, r4, r0
	movs r1, #0x64
	bl Div
	strh r0, [r5, #0x10]
_0804F430:
	adds r0, r5, #0
	adds r0, #0x20          @ r0 = unkA8->spr20
	ldr r1, [r5, #0x14]
	asrs r1, r1, #8
	ldr r2, [r5, #0x18]
	asrs r2, r2, #8
	mov r4, sl              @ r4 = sl = qX
	asrs r3, r4, #8
	adds r3, #0x10
	str r3, [sp]
	mov r4, sb
	asrs r3, r4, #8
	str r3, [sp, #4]
	ldr r3, [sp, #0x14]     @ r3 = s
	bl sub_804EF68
	cmp r0, #1
	bne _0804F458
	movs r0, #0
	strb r0, [r5, #4]
_0804F458:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bls _0804F396
sub_804F1EC__return:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F474: .4byte gCamera
_0804F478: .4byte 0xFED30000

.syntax divided
