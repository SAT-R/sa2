.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	ldr r0, _080614AC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x38]
	ldr r2, _080614B0 @ =0x03000052
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080614B8
	ldr r3, _080614B4 @ =0x03000050
	adds r0, r1, r3
	b _080614BC
	.align 2, 0
_080614AC: .4byte gCurTask
_080614B0: .4byte 0x03000052
_080614B4: .4byte 0x03000050
_080614B8:
	ldr r2, _08061554 @ =0x03000051
	adds r0, r1, r2
_080614BC:
	ldrb r0, [r0]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	adds r0, #0x52
	ldrb r1, [r0]
	cmp r1, #1
	beq _080614CC
	b _08061706
_080614CC:
	str r1, [sp, #0x48]
	bl UiGfxStackInit
	ldr r0, [sp, #0x38]
	adds r0, #0x50
	ldrb r7, [r0]
	ldr r1, [sp, #0x48]
	cmp r7, #0
	bne _0806156C
	add r6, sp, #0x2c
	movs r5, #0x80
	strb r5, [r6]
	mov r4, sp
	adds r4, #0x2b
	strb r1, [r4]
	ldr r0, _08061558 @ =gUnknown_086972F4
	str r0, [sp, #0x14]
	movs r0, #0xc8
	lsls r0, r0, #5
	str r0, [sp, #0x18]
	ldr r0, _0806155C @ =gUnknown_08698BF4
	str r0, [sp, #0x10]
	movs r3, #0xa0
	lsls r3, r3, #3
	mov r8, r3
	str r3, [sp, #0x1c]
	movs r0, #0x29
	add r0, sp
	mov sb, r0
	strb r1, [r0]
	movs r1, #0x2a
	add r1, sp
	mov sl, r1
	movs r0, #0x11
	strb r0, [r1]
	str r7, [sp, #4]
	mov r0, sp
	strb r7, [r0, #8]
	strb r7, [r0, #9]
	strb r7, [r0, #0xa]
	strb r7, [r0, #0xb]
	bl sub_80528AC
	strb r5, [r6]
	strb r7, [r4]
	ldr r0, _08061560 @ =gCharacterCards_Sonic_Tiles
	str r0, [sp, #0x14]
	movs r0, #0x9c
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, _08061564 @ =gCharacterCards_Sonic_Palette
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, _08061568 @ =gCharacterCards_Sonic_Layout
	str r0, [sp, #0x10]
	mov r2, r8
	str r2, [sp, #0x1c]
	add r0, sp, #0x28
	strb r7, [r0]
	mov r3, sb
	strb r7, [r3]
	movs r0, #0x15
	mov r1, sl
	strb r0, [r1]
	b _08061670
	.align 2, 0
_08061554: .4byte 0x03000051
_08061558: .4byte gUnknown_086972F4
_0806155C: .4byte gUnknown_08698BF4
_08061560: .4byte gCharacterCards_Sonic_Tiles
_08061564: .4byte gCharacterCards_Sonic_Palette
_08061568: .4byte gCharacterCards_Sonic_Layout
_0806156C:
	cmp r7, #1
	bne _080615F8
	add r2, sp, #0x2c
	mov r8, r2
	movs r4, #0
	movs r6, #0x80
	strb r6, [r2]
	mov r5, sp
	adds r5, #0x2b
	strb r1, [r5]
	ldr r0, _080615E4 @ =gUnknown_0869A9B4
	str r0, [sp, #0x14]
	movs r0, #0xe2
	lsls r0, r0, #5
	str r0, [sp, #0x18]
	ldr r0, _080615E8 @ =gUnknown_0869C5F4
	str r0, [sp, #0x10]
	movs r3, #0xa0
	lsls r3, r3, #3
	mov sb, r3
	str r3, [sp, #0x1c]
	movs r0, #0x29
	add r0, sp
	mov sl, r0
	strb r1, [r0]
	mov r7, sp
	adds r7, #0x2a
	movs r0, #0x11
	strb r0, [r7]
	str r4, [sp, #4]
	mov r0, sp
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r4, [r0, #0xa]
	strb r4, [r0, #0xb]
	bl sub_80528AC
	mov r1, r8
	strb r6, [r1]
	strb r4, [r5]
	ldr r0, _080615EC @ =gCharacterCards_Tails_Tiles
	str r0, [sp, #0x14]
	movs r0, #0xd0
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	ldr r0, _080615F0 @ =gCharacterCards_Tails_Palette
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, _080615F4 @ =gCharacterCards_Tails_Layout
	str r0, [sp, #0x10]
	mov r2, sb
	str r2, [sp, #0x1c]
	add r0, sp, #0x28
	strb r4, [r0]
	mov r3, sl
	strb r4, [r3]
	b _0806166C
	.align 2, 0
_080615E4: .4byte gUnknown_0869A9B4
_080615E8: .4byte gUnknown_0869C5F4
_080615EC: .4byte gCharacterCards_Tails_Tiles
_080615F0: .4byte gCharacterCards_Tails_Palette
_080615F4: .4byte gCharacterCards_Tails_Layout
_080615F8:
	cmp r7, #2
	bne _0806168C
	add r0, sp, #0x2c
	mov r8, r0
	movs r4, #0
	movs r6, #0x80
	strb r6, [r0]
	mov r5, sp
	adds r5, #0x2b
	strb r1, [r5]
	ldr r0, _08061678 @ =gUnknown_08690574
	str r0, [sp, #0x14]
	movs r0, #0xc0
	lsls r0, r0, #5
	str r0, [sp, #0x18]
	ldr r0, _0806167C @ =gUnknown_08691D74
	str r0, [sp, #0x10]
	movs r2, #0xa0
	lsls r2, r2, #3
	mov sb, r2
	str r2, [sp, #0x1c]
	movs r3, #0x29
	add r3, sp
	mov sl, r3
	strb r1, [r3]
	mov r7, sp
	adds r7, #0x2a
	movs r0, #0x11
	strb r0, [r7]
	str r4, [sp, #4]
	mov r0, sp
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r4, [r0, #0xa]
	strb r4, [r0, #0xb]
	bl sub_80528AC
	mov r0, r8
	strb r6, [r0]
	strb r4, [r5]
	ldr r0, _08061680 @ =gCharacterCards_Knuckles_Tiles
	str r0, [sp, #0x14]
	movs r0, #0xf8
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	ldr r0, _08061684 @ =gCharacterCards_Knuckles_Palette
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, _08061688 @ =gCharacterCards_Knuckles_Layout
	str r0, [sp, #0x10]
	mov r1, sb
	str r1, [sp, #0x1c]
	add r0, sp, #0x28
	strb r4, [r0]
	mov r2, sl
	strb r4, [r2]
_0806166C:
	movs r0, #0x15
	strb r0, [r7]
_08061670:
	mov r0, sp
	bl sub_80528AC
	b _08061706
	.align 2, 0
_08061678: .4byte gUnknown_08690574
_0806167C: .4byte gUnknown_08691D74
_08061680: .4byte gCharacterCards_Knuckles_Tiles
_08061684: .4byte gCharacterCards_Knuckles_Palette
_08061688: .4byte gCharacterCards_Knuckles_Layout
_0806168C:
	add r3, sp, #0x2c
	mov r8, r3
	movs r4, #0
	movs r6, #0x80
	strb r6, [r3]
	mov r5, sp
	adds r5, #0x2b
	strb r1, [r5]
	ldr r0, _08061780 @ =gUnknown_08693974
	str r0, [sp, #0x14]
	movs r0, #0xc4
	lsls r0, r0, #5
	str r0, [sp, #0x18]
	ldr r0, _08061784 @ =gUnknown_086951F4
	str r0, [sp, #0x10]
	movs r0, #0xa0
	lsls r0, r0, #3
	mov sb, r0
	str r0, [sp, #0x1c]
	movs r2, #0x29
	add r2, sp
	mov sl, r2
	strb r1, [r2]
	mov r7, sp
	adds r7, #0x2a
	movs r0, #0x11
	strb r0, [r7]
	str r4, [sp, #4]
	mov r0, sp
	strb r4, [r0, #8]
	strb r4, [r0, #9]
	strb r4, [r0, #0xa]
	strb r4, [r0, #0xb]
	bl sub_80528AC
	mov r3, r8
	strb r6, [r3]
	strb r4, [r5]
	ldr r0, _08061788 @ =gCharacterCards_Amy_Tiles
	str r0, [sp, #0x14]
	movs r0, #0x98
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	ldr r0, _0806178C @ =gCharacterCards_Amy_Palette
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, _08061790 @ =gCharacterCards_Amy_Layout
	str r0, [sp, #0x10]
	mov r0, sb
	str r0, [sp, #0x1c]
	add r0, sp, #0x28
	strb r4, [r0]
	mov r1, sl
	strb r4, [r1]
	movs r0, #0x15
	strb r0, [r7]
	mov r0, sp
	bl sub_80528AC
_08061706:
	movs r7, #0
	add r6, sp, #0x30
	ldr r2, [sp, #0x38]
	adds r2, #0x30
	mov sb, r2
	ldr r3, [sp, #0x38]
	adds r3, #0x54
	str r3, [sp, #0x40]
	ldr r0, _08061794 @ =gLoadedSaveGame
	adds r0, #0x20
	str r0, [sp, #0x44]
	mov r8, r6
	ldr r1, _08061798 @ =gSecondsTable
	mov sl, r1
_08061722:
	movs r0, #1
	ldr r2, [sp, #0x38]
	strh r0, [r2, #0x3e]
	adds r0, r7, #0
	adds r0, #0x21
	mov r3, r8
	strb r0, [r3]
	movs r0, #0x2c
	strh r0, [r2, #0x3a]
	lsls r4, r7, #4
	adds r4, #0x5c
	strh r4, [r2, #0x3c]
	mov r0, r8
	mov r1, sb
	bl sub_805321C
	movs r0, #7
	ldr r1, [sp, #0x38]
	strh r0, [r1, #0x3e]
	movs r0, #0x54
	strh r0, [r1, #0x3a]
	strh r4, [r1, #0x3c]
	ldr r2, [sp, #0x40]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r7
	lsls r0, r0, #2
	movs r1, #0xd8
	ldr r3, [sp, #0x3c]
	muls r1, r3, r1
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	ldr r5, [r0]
	ldr r0, _0806179C @ =0x00008C9F
	cmp r5, r0
	bls _080617A0
	movs r1, #0x29
	strb r1, [r6, #6]
	strb r1, [r6, #5]
	strb r1, [r6, #3]
	movs r0, #0x25
	strb r0, [r6, #2]
	strb r1, [r6]
	b _080617F6
	.align 2, 0
_08061780: .4byte gUnknown_08693974
_08061784: .4byte gUnknown_086951F4
_08061788: .4byte gCharacterCards_Amy_Tiles
_0806178C: .4byte gCharacterCards_Amy_Palette
_08061790: .4byte gCharacterCards_Amy_Layout
_08061794: .4byte gLoadedSaveGame
_08061798: .4byte gSecondsTable
_0806179C: .4byte 0x00008C9F
_080617A0:
	adds r0, r5, #0
	movs r1, #0x3c
	bl Div
	adds r4, r0, #0
	movs r1, #0x3c
	bl Div
	ldr r2, _08061820 @ =sZoneTimeSecondsTable
	lsls r0, r0, #1
	adds r1, r0, r2
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r2, r4, r2
	movs r1, #0
	ldrsh r2, [r2, r1]
	subs r2, r5, r2
	ldr r1, _08061824 @ =sZoneTimeMinutesTable
	adds r1, r0, r1
	ldrh r1, [r1]
	subs r2, r2, r1
	lsls r2, r2, #1
	ldr r3, _08061828 @ =gMillisUnpackTable
	adds r1, r2, #1
	adds r1, r1, r3
	ldrb r1, [r1]
	strb r1, [r6, #6]
	adds r2, r2, r3
	ldrb r1, [r2]
	strb r1, [r6, #5]
	adds r1, r4, #1
	add r1, sl
	ldrb r1, [r1]
	strb r1, [r6, #3]
	add r4, sl
	ldrb r1, [r4]
	strb r1, [r6, #2]
	adds r0, #1
	add r0, sl
	ldrb r0, [r0]
	strb r0, [r6]
_080617F6:
	movs r0, #0x2a
	mov r2, r8
	strb r0, [r2, #1]
	strb r0, [r2, #4]
	mov r0, r8
	mov r1, sb
	bl sub_805321C
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #2
	bls _08061722
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061820: .4byte sZoneTimeSecondsTable
_08061824: .4byte sZoneTimeMinutesTable
_08061828: .4byte gMillisUnpackTable

.syntax divided
