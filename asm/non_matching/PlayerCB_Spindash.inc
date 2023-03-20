.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0xc
	mov r8, r0
	adds r2, r6, #0
	adds r2, #0x68
	ldr r1, _080263F4 @ =PlayerCharacterIdleAnims
	adds r0, r6, #0
	adds r0, #0x85
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10      @ r7 = cAnim
	adds r0, r6, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08026408
	ldr r2, [r6, #0x20]
	ldr r0, _080263F8 @ =0xFFFFFBFF
	ands r2, r0
	str r2, [r6, #0x20]
	ldrh r0, [r6, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080263CE
	movs r1, #8
_080263CE:
	ldr r0, _080263FC @ =sSpinDashSpeeds
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _080263E4
	rsbs r1, r1, #0
_080263E4:
	strh r1, [r6, #0x14]
	ldr r1, _08026400 @ =gPlayer
	ldr r0, _08026404 @ =PlayerCB_8025A0C
	str r0, [r1]
	movs r0, #0x6e
	bl m4aSongNumStart
	b _080264B2
	.align 2, 0
_080263F4: .4byte PlayerCharacterIdleAnims
_080263F8: .4byte 0xFFFFFBFF
_080263FC: .4byte sSpinDashSpeeds
_08026400: .4byte gPlayer
_08026404: .4byte PlayerCB_8025A0C
_08026408:
	ldrh r4, [r6, #0x26]
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08026420
	asrs r0, r0, #0x15
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r0, #0
	bgt _08026420
	movs r4, #0
_08026420:
	adds r1, r6, #0
	adds r1, #0x5e
	ldr r0, _080264D8 @ =gPlayerControls
	ldrh r1, [r1]
	ldrh r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _08026490
	movs r0, #0x6d
	bl m4aSongNumStart
	ldr r2, _080264DC @ =gMPlayTable
	ldr r0, _080264E0 @ =gSongTable
	movs r1, #0xdb
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]       @ r1 = gSongTable[SE_SPIN_ATTACK].ms (music_player index)
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r1, _080264E4 @ =0x0000FFFF
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r2, #0x80
	rsbs r2, r2, #0
	ands r2, r4
	adds r0, r5, #0
	bl m4aMPlayPitchControl
	movs r0, #0x80
	lsls r0, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r2, r4, #0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #4
	cmp r0, r1
	bge _0802647E
	adds r2, r1, #0
_0802647E:
	adds r4, r2, #0
	adds r2, r6, #0
	adds r2, #0x6a
	movs r0, #1
	movs r1, #1
	strh r1, [r2]
	adds r1, r6, #0
	adds r1, #0x6c
	strb r0, [r1]
_08026490:
	strh r4, [r6, #0x26]
	cmp r7, #3
	bne _080264B2
	adds r2, r6, #0
	adds r2, #0x6a
	ldrh r0, [r2]
	cmp r0, #1
	bne _080264B2
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080264B2
	movs r0, #0
	strh r0, [r2]
_080264B2:
	ldr r0, [r6, #0x20]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08026598
	adds r0, r6, #0
	bl sub_80236C8
	adds r0, r6, #0
	bl sub_80232D0
	ldr r0, [r6, #0x20]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080264E8
	ldrh r0, [r6, #0x12]
	adds r0, #0xc
	b _080264EC
	.align 2, 0
_080264D8: .4byte gPlayerControls
_080264DC: .4byte gMPlayTable
_080264E0: .4byte gSongTable
_080264E4: .4byte 0x0000FFFF
_080264E8:
	ldrh r0, [r6, #0x12]
	adds r0, #0x2a
_080264EC:
	strh r0, [r6, #0x12]
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r3, _08026538 @ =gUnknown_03005424
	ldr r1, _0802653C @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026510
	ldrh r0, [r6, #0x12]
	rsbs r0, r0, #0
	strh r0, [r6, #0x12]
_08026510:
	ldrh r2, [r6, #0x12]
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08026520
	adds r2, r1, #0
_08026520:
	strh r2, [r6, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026540
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	b _08026548
	.align 2, 0
_08026538: .4byte gUnknown_03005424
_0802653C: .4byte gUnknown_0300544C
_08026540:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
_08026548:
	str r0, [r6, #0xc]
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #0
	bge _08026560
	adds r1, #2
	cmp r1, #0
	ble _0802656C
	b _0802656A
_08026560:
	cmp r1, #0
	ble _0802656C
	subs r1, #2
	cmp r1, #0
	bge _0802656C
_0802656A:
	movs r1, #0
_0802656C:
	strb r1, [r5]
	adds r0, r6, #0
	bl sub_8022190
	ldr r0, [r6, #0x20]
	movs r1, #0xa
	ands r0, r1
	cmp r0, #8
	beq _08026580
	b PlayerCB_Spindash_return
_08026580:
	ldr r1, _08026590 @ =gPlayer
	ldr r0, _08026594 @ =PlayerCB_8025318
	str r0, [r1]
	ldrh r0, [r6, #0x10]
	movs r1, #0
	strh r0, [r6, #0x14]
	strb r1, [r5]
	b PlayerCB_Spindash_return
	.align 2, 0
_08026590: .4byte gPlayer
_08026594: .4byte PlayerCB_8025318
_08026598:
	movs r1, #0x14
	ldrsh r3, [r6, r1]
	adds r0, r6, #0
	adds r0, #0x24
	ldrb r4, [r0]
	adds r1, r4, #0
	adds r1, #0x60
	movs r2, #0xff
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0xbf
	bgt _080265E2
	cmp r3, #0
	beq _080265E2
	ldr r1, _080265D4 @ =gSineTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	asrs r2, r0, #8
	cmp r3, #0
	ble _080265D8
	cmp r2, #0
	bgt _080265DE
	b _080265DC
	.align 2, 0
_080265D4: .4byte gSineTable
_080265D8:
	cmp r2, #0
	blt _080265DE
_080265DC:
	asrs r2, r0, #0xa
_080265DE:
	adds r3, r3, r2
	strh r3, [r6, #0x14]
_080265E2:
	adds r0, r6, #0
	bl sub_80232D0
	adds r0, r6, #0
	bl sub_8023260
	adds r0, r6, #0
	bl sub_8023128
	movs r0, #0x10
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #8]
	adds r0, r0, r1
	str r0, [r6, #8]
	ldr r3, _0802663C @ =gUnknown_03005424
	ldr r1, _08026640 @ =gUnknown_0300544C
	ldrh r0, [r3]
	ldrh r1, [r1]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026616
	ldrh r0, [r6, #0x12]
	rsbs r0, r0, #0
	strh r0, [r6, #0x12]
_08026616:
	ldrh r2, [r6, #0x12]
	movs r1, #0x12
	ldrsh r0, [r6, r1]
	movs r1, #0xf0
	lsls r1, r1, #4
	cmp r0, r1
	ble _08026626
	adds r2, r1, #0
_08026626:
	strh r2, [r6, #0x12]
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08026644
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	subs r0, r0, r1
	b _0802664C
	.align 2, 0
_0802663C: .4byte gUnknown_03005424
_08026640: .4byte gUnknown_0300544C
_08026644:
	movs r0, #0x12
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
_0802664C:
	str r0, [r6, #0xc]
	adds r0, r6, #0
	bl sub_8022D6C
	ldrh r0, [r6, #0x2a]
	movs r1, #0x2a
	ldrsh r2, [r6, r1]
	cmp r2, #0
	beq _08026662
	subs r0, #1
	b _0802668A
_08026662:
	ldrb r0, [r5]
	adds r0, #0x20
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq PlayerCB_Spindash_return
	movs r0, #0x14
	ldrsh r1, [r6, r0]
	cmp r1, #0
	bge _08026678
	rsbs r1, r1, #0
_08026678:
	ldr r0, _08026698 @ =0x000001DF
	cmp r1, r0
	bgt PlayerCB_Spindash_return
	strh r2, [r6, #0x14]
	ldr r0, [r6, #0x20]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x20]
	movs r0, #0x1e
_0802668A:
	strh r0, [r6, #0x2a]
PlayerCB_Spindash_return:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026698: .4byte 0x000001DF


.syntax divided
