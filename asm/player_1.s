.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

.if 0
.endif

	thumb_func_start sub_8023128
sub_8023128: @ 0x08023128
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080231BA
	movs r1, #0x40
	cmp r0, #0
	blt _0802313C
	movs r1, #0xc0
_0802313C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _080231BA
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _08023182
	cmp r1, #1
	bgt _0802316E
	cmp r1, #0
	beq _08023178
	b _080231AE
_0802316E:
	cmp r1, #2
	beq _08023188
	cmp r1, #3
	beq _0802319A
	b _080231AE
_08023178:
	ldr r0, [r4, #0xc]
	adds r0, r0, r2
	str r0, [r4, #0xc]
	strh r1, [r4, #0x12]
	b _080231AE
_08023182:
	ldr r0, [r4, #8]
	subs r0, r0, r2
	b _0802319E
_08023188:
	ldr r0, [r4, #0xc]
	subs r0, r0, r2
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x20]
	orrs r0, r1
	str r0, [r4, #0x20]
	b _080231AE
_0802319A:
	ldr r0, [r4, #8]
	adds r0, r0, r2
_0802319E:
	str r0, [r4, #8]
	movs r2, #0
	strh r2, [r4, #0x10]
	ldr r0, [r4, #0x20]
	movs r1, #0x20
	orrs r0, r1
	str r0, [r4, #0x20]
	strh r2, [r4, #0x14]
_080231AE:
	adds r0, r4, #0
	adds r0, #0x62
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_080231BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_80231C0
sub_80231C0: @ 0x080231C0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _08023258
	movs r1, #0x40
	cmp r0, #0
	blt _080231D4
	movs r1, #0xc0
_080231D4:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802302C
	lsls r2, r0, #8
	cmp r2, #0
	bgt _08023258
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	asrs r1, r0, #6
	cmp r1, #1
	beq _0802321A
	cmp r1, #1
	bgt _08023206
	cmp r1, #0
	beq _08023210
	b _08023258
_08023206:
	cmp r1, #2
	beq _08023220
	cmp r1, #3
	beq _08023232
	b _08023258
_08023210:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	strh r1, [r5, #0x12]
	b _08023258
_0802321A:
	ldr r0, [r5, #8]
	subs r0, r0, r2
	b _08023236
_08023220:
	ldr r0, [r5, #0xc]
	subs r0, r0, r2
	str r0, [r5, #0xc]
	movs r0, #0
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0x20]
	orrs r0, r1
	str r0, [r5, #0x20]
	b _08023258
_08023232:
	ldr r0, [r5, #8]
	adds r0, r0, r2
_08023236:
	str r0, [r5, #8]
	movs r4, #0
	strh r4, [r5, #0x10]
	ldr r0, [r5, #0x20]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x20]
	adds r0, r5, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r5, #0x16]
	movs r0, #0xe
	strb r0, [r5, #0x17]
	strh r4, [r5, #0x14]
_08023258:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8023260
sub_8023260: @ 0x08023260
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, [r2, #0x40]
	movs r0, #0x14
	ldrsh r1, [r2, r0]
	lsls r0, r4, #0x10
	asrs r3, r0, #0x10
	cmp r1, r3
	ble _08023276
	strh r4, [r2, #0x14]
	b _08023282
_08023276:
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	cmn r0, r3
	bge _08023282
	rsbs r0, r4, #0
	strh r0, [r2, #0x14]
_08023282:
	movs r0, #0x14
	ldrsh r4, [r2, r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldr r5, _080232CC @ =gSineTable
	ldrb r3, [r0]
	lsls r0, r3, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	strh r0, [r2, #0x10]
	ldr r1, [r2, #0x20]
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080232B0
	strh r1, [r2, #0x12]
_080232B0:
	lsls r0, r3, #3
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x16
	muls r0, r4, r0
	asrs r0, r0, #8
	ldrh r1, [r2, #0x12]
	adds r0, r0, r1
	strh r0, [r2, #0x12]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080232CC: .4byte gSineTable

@ Called in boss battles.
@ It sets gBossRingsShallRespawn to TRUE, amongst other things
	thumb_func_start sub_80232D0
sub_80232D0: @ 0x080232D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r4, _080233A0 @ =gCamera
	ldr r0, [r7, #8]
	mov r8, r0
	ldr r1, [r7, #0xc]
	mov sb, r1
	adds r0, r7, #0
	adds r0, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080232F4
	b _08023486
_080232F4:
	ldr r1, _080233A4 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _08023316
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _08023312
	ldr r0, _080233A8 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023316
_08023312:
	cmp r1, #0x1d
	bne _080233C4
_08023316:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023324
	b _08023486
_08023324:
	ldr r0, _080233AC @ =gUnknown_080D650C
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r0, r2, r0
	ldr r1, [r0]
	cmp r1, #0
	bge _08023336
	b _08023486
_08023336:
	lsls r0, r1, #8
	cmp r8, r0
	bge _0802333E
	b _08023486
_0802333E:
	ldr r0, _080233B0 @ =gUnknown_080D661C
	adds r1, r2, r0
	ldr r5, [r1]
	adds r0, #4
	adds r0, r2, r0
	ldr r6, [r0]
	lsls r3, r5, #8
	add r8, r3
	lsls r1, r6, #8
	add sb, r1
	ldr r0, _080233B4 @ =gCheese
	ldr r2, [r0]
	cmp r2, #0
	beq _08023366
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_08023366:
	ldr r0, _080233B8 @ =gUnknown_030054FC
	str r3, [r0]
	ldr r0, _080233BC @ =gUnknown_030054E0
	str r1, [r0]
	adds r0, r3, #0
	bl sub_8039F14
	ldr r1, _080233C0 @ =gBossRingsShallRespawn
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, r0, r5
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r5
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r5
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	adds r0, r0, r6
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r6
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x14]
	adds r0, r0, r6
	str r0, [r4, #0x14]
	b _08023486
	.align 2, 0
_080233A0: .4byte gCamera
_080233A4: .4byte gCurrentLevel
_080233A8: .4byte gUnknown_030054B0
_080233AC: .4byte gUnknown_080D650C
_080233B0: .4byte gUnknown_080D661C
_080233B4: .4byte gCheese
_080233B8: .4byte gUnknown_030054FC
_080233BC: .4byte gUnknown_030054E0
_080233C0: .4byte gBossRingsShallRespawn
_080233C4:
	ldr r0, _080234B4 @ =gPlayer
	ldr r0, [r0, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08023486
	ldr r0, _080234B8 @ =gSpecialRingCount
	ldrb r0, [r0]
	cmp r0, #6
	bls _08023486
	ldr r0, _080234BC @ =gUnknown_080D650C
	mov r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r2, r1, #3
	adds r1, r2, r0
	ldr r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	blt _08023432
	lsls r0, r1, #8
	cmp r8, r0
	blt _08023432
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08023432
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08023432
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, r2, r0
	ldr r1, [r0]
	lsls r3, r1, #8
	add r8, r3
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, _080234C4 @ =gCheese
	ldr r2, [r0]
	cmp r2, #0
	beq _08023432
	ldr r0, [r2]
	adds r0, r0, r3
	str r0, [r2]
_08023432:
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r2, r0, #3
	adds r0, r5, #4
	adds r0, r2, r0
	ldr r0, [r0]
	cmp r0, #0
	blt _08023486
	lsls r0, r0, #8
	cmp sb, r0
	blt _08023486
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08023486
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08023486
	ldr r0, _080234C0 @ =gUnknown_080D661C
	adds r0, #4
	adds r0, r2, r0
	ldr r0, [r0]
	lsls r1, r0, #8
	lsls r3, r0, #0x10
	add sb, r3
	ldr r0, [r4, #4]
	adds r0, r0, r1
	str r0, [r4, #4]
	ldr r0, [r4, #0x24]
	adds r0, r0, r1
	str r0, [r4, #0x24]
	ldr r0, _080234C4 @ =gCheese
	ldr r2, [r0]
	cmp r2, #0
	beq _08023486
	ldr r0, [r2, #4]
	adds r0, r0, r3
	str r0, [r2, #4]
_08023486:
	ldr r1, [r7, #0x20]
	ldr r0, _080234C8 @ =0x80000080
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0x80
	bne _08023494
	b _08023604
_08023494:
	ldr r5, _080234CC @ =gCamera
	ldr r3, [r7, #0xc]
	cmp r6, #0
	blt _0802351C
	ldr r2, _080234D0 @ =gUnknown_03005424
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234D4
	ldr r0, [r5, #0x28]
	lsls r0, r0, #8
	cmp r3, r0
	bgt _080234E0
	b _080234E6
	.align 2, 0
_080234B4: .4byte gPlayer
_080234B8: .4byte gSpecialRingCount
_080234BC: .4byte gUnknown_080D650C
_080234C0: .4byte gUnknown_080D661C
_080234C4: .4byte gCheese
_080234C8: .4byte 0x80000080
_080234CC: .4byte gCamera
_080234D0: .4byte gUnknown_03005424
_080234D4:
	ldr r0, [r5, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
	movs r1, #1
	cmp r3, r0
	bge _080234E2
_080234E0:
	movs r1, #0
_080234E2:
	cmp r1, #0
	beq _0802351C
_080234E6:
	movs r0, #0x80
	orrs r0, r6
	str r0, [r7, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080234FC
	ldr r0, _080234F8 @ =0x0000FD60
	b _080234FE
	.align 2, 0
_080234F8: .4byte 0x0000FD60
_080234FC:
	ldr r0, _08023510 @ =0x0000FB20
_080234FE:
	strh r0, [r7, #0x12]
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08023514
	ldr r0, [r4, #0x28]
	lsls r0, r0, #8
	b _0802351A
	.align 2, 0
_08023510: .4byte 0x0000FB20
_08023514:
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #8
	subs r0, #1
_0802351A:
	mov sb, r0
_0802351C:
	ldr r1, _08023548 @ =gCurrentLevel
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	mov ip, r1
	cmp r0, #2
	beq _0802353E
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _0802353A
	ldr r0, _0802354C @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802353E
_0802353A:
	cmp r1, #0x1d
	bne _08023558
_0802353E:
	ldr r0, _08023550 @ =gUnknown_03005440
	ldrh r2, [r0]
	ldr r0, _08023554 @ =gUnknown_030054BC
	ldrh r3, [r0]
	b _0802355C
	.align 2, 0
_08023548: .4byte gCurrentLevel
_0802354C: .4byte gUnknown_030054B0
_08023550: .4byte gUnknown_03005440
_08023554: .4byte gUnknown_030054BC
_08023558:
	ldr r2, [r4, #0x28]
	ldr r3, [r4, #0x2c]
_0802355C:
	mov r5, r8
	mov r6, sb
	ldr r0, [r4, #0x30]
	lsls r0, r0, #8
	cmp r8, r0
	blt _08023576
	ldr r0, [r4, #0x34]
	lsls r0, r0, #8
	subs r1, r0, #1
	mov r0, r8
	cmp r0, r1
	ble _08023576
	adds r0, r1, #0
_08023576:
	mov r8, r0
	lsls r0, r2, #8
	cmp sb, r0
	blt _0802358A
	lsls r0, r3, #8
	subs r1, r0, #1
	mov r0, sb
	cmp r0, r1
	ble _0802358A
	adds r0, r1, #0
_0802358A:
	mov sb, r0
	cmp r8, r5
	beq _08023596
	movs r0, #0
	strh r0, [r7, #0x10]
	strh r0, [r7, #0x14]
_08023596:
	cmp sb, r6
	beq _080235A0
	movs r0, #0
	strh r0, [r7, #0x12]
	strh r0, [r7, #0x14]
_080235A0:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	beq _080235C0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x1c
	bne _080235BC
	ldr r0, _080235E4 @ =gUnknown_030054B0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080235C0
_080235BC:
	cmp r1, #0x1d
	bne _080235FC
_080235C0:
	ldr r0, [r4, #0x10]
	lsls r0, r0, #8
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
	cmp r8, r1
	bge _080235E8
	mov r8, r1
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x20]
	b _080235FC
	.align 2, 0
_080235E4: .4byte gUnknown_030054B0
_080235E8:
	movs r1, #0x9c
	lsls r1, r1, #9
	adds r0, r0, r1
	cmp r8, r0
	ble _080235FC
	mov r8, r0
	movs r0, #0xa0
	lsls r0, r0, #3
	strh r0, [r7, #0x14]
	strh r0, [r7, #0x10]
_080235FC:
	mov r2, r8
	str r2, [r7, #8]
	mov r0, sb
	str r0, [r7, #0xc]
_08023604:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.if 0
.endif
