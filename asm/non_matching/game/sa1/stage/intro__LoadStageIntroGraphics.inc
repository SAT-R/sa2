.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x44
	str r0, [sp, #0x30] @ sp30 = param0
	ldr r1, _08054E10 @ =gCurrentLevel
	ldrb r0, [r1]
	movs r2, #1
	ands r2, r0
	str r2, [sp, #0x34] @ sp34 = act = (gCurrentLevel % 2u)
	ldr r1, _08054E14 @ =gSelectedCharacter
	ldrb r0, [r1]
	adds r0, #6
	add r4, sp, #0x2c
	strb r0, [r4]
	mov r2, sp
	adds r2, #0x2b
	str r2, [sp, #0x38] @ sp38 = &sp00.unk2B
	movs r0, #6
	strb r0, [r2]   @ sp00.unk2B = 6;
	ldr r7, _08054E18 @ =gUiGraphics
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054E1C @ =gUiGraphics + 0x4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	movs r2, #0x20
	str r2, [sp, #0x24]
	mov r0, sp
	adds r0, #0x28
	str r0, [sp, #0x3c] @ sp3C = &sp00.unk28
	movs r1, #0xf
	strb r1, [r0]
	ldr r2, [sp, #0x30] @ r2 = sp30 = param0
	ldr r0, [r2, #4]
	str r0, [sp, #0xc]
	mov r0, sp
	adds r0, #0x2a
	str r0, [sp, #0x40] @ sp40 = &sp00.unk2A
	movs r1, #0xd
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _08054E20 @ =gUiGraphics + 0x8
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r2, sp
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054E24 @ =gUiGraphics + 0xC
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054E28 @ =gUiGraphics + 0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054E2C @ =gUiGraphics + 0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	ldrb r1, [r4]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08054E30 @ =gUiGraphics + 0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r0, #0xa
	strb r0, [r4]
	movs r0, #7
	ldr r2, [sp, #0x38] @ r2 = sp38 = &sp00.unk2B
	strb r0, [r2]
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r2, _08054E14 @ =gSelectedCharacter
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r1, r1, #0xb
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	movs r1, #0x8e
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	movs r2, #0x20
	str r2, [sp, #0x24]
	movs r1, #0xf
	ldr r0, [sp, #0x3c]
	strb r1, [r0]
	ldr r0, _08054E34 @ =0x06010800
	str r0, [sp, #0xc]
	movs r0, #0xd
	ldr r2, [sp, #0x40]
	strb r0, [r2]
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r1, sp
	movs r2, #0x92
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #8]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #9]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #0xa]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r0, #0x10
	strb r0, [r4]
	movs r0, #8
	ldr r1, [sp, #0x38] @ r1 = sp38 = &sp00.unk2B
	strb r0, [r1]
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	str r0, [sp, #0x14]
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	adds r2, #0x40
	mov sb, r2
	str r2, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r2, #6
	ldr r1, [sp, #0x3c]
	strb r2, [r1]
	ldr r1, [sp, #0x30] @ r1 = sp30 = param0
	ldr r0, [r1]
	str r0, [sp, #0xc]
	movs r0, #0xd
	ldr r2, [sp, #0x40]
	strb r0, [r2]
	movs r1, #0xe4
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r1, sp
	movs r2, #0xe6
	lsls r2, r2, #1
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #8]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #9]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #0xa]
	adds r2, #4
	adds r0, r7, r2
	ldr r0, [r0]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	ldr r1, _08054E10 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	mov sl, r4
	cmp r0, #0xd
	ble _08054C3A
	b _08054E5C
_08054C3A:
	movs r2, #0x11
	strb r2, [r4]
	movs r0, #9
	movs r1, #0x2b
	add r1, sp
	strb r0, [r1]
	ldr r2, _08054E38 @ =gUiGraphics + ((17 * 0x1C) + 0)
	ldr r0, [r2]
	movs r1, #0x92
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r2, _08054E3C @ =gUiGraphics + ((17 * 0x1C) + 0x4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	ldr r1, _08054E10 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, _08054E40 @ =gUnknown_08688378
	adds r0, r0, r2
	ldrb r0, [r0]
	movs r4, #0xc
	subs r0, r4, r0
	lsls r0, r0, #5
	str r0, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r1, #6
	add r2, sp, #0x28
	strb r1, [r2]
	ldr r1, [sp, #0x30] @ r1 = sp30 = param0
	ldr r0, [r1, #8]
	str r0, [sp, #0xc]
	movs r2, #0xd
	movs r0, #0x2a
	add r0, sp
	strb r2, [r0]
	ldr r1, _08054E44 @ =gUiGraphics + ((17 * 0x1C) + 0x8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _08054E48 @ =gUiGraphics + ((17 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r2, _08054E4C @ =gUiGraphics + ((17 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r2, _08054E50 @ =gUiGraphics + ((17 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r2, _08054E54 @ =gUiGraphics + ((17 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #0x11
	mov r0, sl
	strb r1, [r0]
	movs r2, #9
	movs r0, #0x2b
	add r0, sp
	strb r2, [r0]
	ldr r1, _08054E38 @ =gUiGraphics + ((17 * 0x1C) + 0)
	ldr r0, [r1]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	str r0, [sp, #0x14]
	ldr r2, _08054E3C @ =gUiGraphics + ((17 * 0x1C) + 0x4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	movs r0, #0x80
	str r0, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r1, #6
	add r2, sp, #0x28
	strb r1, [r2]
	ldr r1, [sp, #0x30] @ r1 = sp30 = param0
	ldr r0, [r1, #8]
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r0, r0, r2
	str r0, [sp, #0xc]
	movs r0, #0xd
	movs r1, #0x2a
	add r1, sp
	strb r0, [r1]
	ldr r2, _08054E44 @ =gUiGraphics + ((17 * 0x1C) + 0x8)
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _08054E48 @ =gUiGraphics + ((17 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r2, _08054E4C @ =gUiGraphics + ((17 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r2, _08054E50 @ =gUiGraphics + ((17 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r2, _08054E54 @ =gUiGraphics + ((17 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #0x11
	mov r0, sl
	strb r1, [r0]
	movs r2, #9
	movs r0, #0x2b
	add r0, sp
	strb r2, [r0]
	ldr r1, _08054E58 @ =gUnknown_08688386
	ldr r2, _08054E10 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #5
	ldr r2, _08054E38 @ =gUiGraphics + ((17 * 0x1C) + 0)
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r1, _08054E3C @ =gUiGraphics + ((17 * 0x1C) + 0x4)
	ldr r0, [r1]
	str r0, [sp, #0x20]
	ldr r2, _08054E10 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldr r1, _08054E40 @ =gUnknown_08688378
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	str r0, [sp, #0x18]
	movs r2, #0x20
	str r2, [sp, #0x24]
	movs r0, #6
	add r1, sp, #0x28
	strb r0, [r1]
	ldr r2, _08054E10 @ =gCurrentLevel
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldr r1, _08054E40 @ =gUnknown_08688378
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r4, r4, r0
	lsls r4, r4, #5
	ldr r2, [sp, #0x30] @ r2 = sp30 = param0
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [sp, #0xc]
	movs r0, #0xd
	movs r1, #0x2a
	add r1, sp
	strb r0, [r1]
	ldr r2, _08054E44 @ =gUiGraphics + ((17 * 0x1C) + 0x8)
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _08054E48 @ =gUiGraphics + ((17 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r2, _08054E4C @ =gUiGraphics + ((17 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r2, _08054E50 @ =gUiGraphics + ((17 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r2, _08054E54 @ =gUiGraphics + ((17 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #0x11
	mov r0, sl
	strb r1, [r0]
	movs r2, #9
	movs r0, #0x2b
	add r0, sp
	strb r2, [r0]
	ldr r1, _08054E38 @ =gUiGraphics + ((17 * 0x1C) + 0)
	ldr r0, [r1]
	adds r0, r0, r7
	str r0, [sp, #0x14]
	ldr r2, _08054E3C @ =gUiGraphics + ((17 * 0x1C) + 0x4)
	ldr r0, [r2]
	str r0, [sp, #0x20]
	movs r0, #0x20
	str r0, [sp, #0x18]
	str r0, [sp, #0x24]
	movs r1, #6
	add r2, sp, #0x28
	strb r1, [r2]
	ldr r1, [sp, #0x30] @ r1 = sp30 = param0
	ldr r0, [r1, #8]
	str r0, [sp, #0xc]
	movs r2, #0xd
	movs r0, #0x2a
	add r0, sp
	strb r2, [r0]
	ldr r1, _08054E44 @ =gUiGraphics + ((17 * 0x1C) + 0x8)
	ldr r0, [r1]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _08054E48 @ =gUiGraphics + ((17 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r2, _08054E4C @ =gUiGraphics + ((17 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r2, _08054E50 @ =gUiGraphics + ((17 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r2, _08054E54 @ =gUiGraphics + ((17 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #4
	str r1, [sp, #4]
	mov r0, sp
	movs r2, #1
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r1, [r0, #0xa]
	strb r2, [r0, #0xb]
	movs r1, #9
	bl sub_80535C8
	b _08054F14
	.align 2, 0
_08054E10: .4byte gCurrentLevel
_08054E14: .4byte gSelectedCharacter
_08054E18: .4byte gUiGraphics
_08054E1C: .4byte gUiGraphics + 0x4
_08054E20: .4byte gUiGraphics + 0x8
_08054E24: .4byte gUiGraphics + 0xC
_08054E28: .4byte gUiGraphics + 0x10
_08054E2C: .4byte gUiGraphics + 0x14
_08054E30: .4byte gUiGraphics + 0x18
_08054E34: .4byte 0x06010800
_08054E38: .4byte gUiGraphics + ((17 * 0x1C) + 0)
_08054E3C: .4byte gUiGraphics + ((17 * 0x1C) + 0x4)
_08054E40: .4byte gUnknown_08688378
_08054E44: .4byte gUiGraphics + ((17 * 0x1C) + 0x8)
_08054E48: .4byte gUiGraphics + ((17 * 0x1C) + 0xC)
_08054E4C: .4byte gUiGraphics + ((17 * 0x1C) + 0x10)
_08054E50: .4byte gUiGraphics + ((17 * 0x1C) + 0x14)
_08054E54: .4byte gUiGraphics + ((17 * 0x1C) + 0x18)
_08054E58: .4byte gUnknown_08688386
_08054E5C:
	movs r0, #0x12
	mov r1, sl
	strb r0, [r1]
	movs r0, #9
	movs r2, #0x2b
	add r2, sp
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, _080550C4 @ =gCurrentLevel
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r1, #0xe
	lsls r1, r1, #9
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080550C8 @ =gUiGraphics + 0x4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	mov r2, sb
	str r2, [sp, #0x18]
	movs r0, #0x20
	str r0, [sp, #0x24]
	movs r1, #6
	add r2, sp, #0x28
	strb r1, [r2]
	ldr r1, [sp, #0x30] @ r1 = sp30 = param0
	ldr r0, [r1, #8]
	str r0, [sp, #0xc]
	movs r2, #0xd
	movs r0, #0x2a
	add r0, sp
	strb r2, [r0]
	mov r2, sl
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080550CC @ =gUiGraphics + 0x8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r2, sp
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080550D0 @ =gUiGraphics + 0xC
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080550D4 @ =gUiGraphics + 0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080550D8 @ =gUiGraphics + 0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080550DC @ =gUiGraphics + 0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	mov r0, sp
	bl sub_80528AC
_08054F14:
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
	movs r1, #0xa
	movs r2, #0x2b
	add r2, sp
	strb r1, [r2]
	ldr r7, _080550E0 @ =gUiGraphics
	movs r0, #0xd2
	lsls r0, r0, #1
	adds r6, r7, r0
	ldr r0, [r6]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r0, r4
	ldr r2, [sp, #0x34]
	lsls r1, r2, #7
	adds r0, r0, r1
	str r0, [sp, #0x14]
	movs r0, #0x80
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x30] @ r1 = sp30 = param0
	ldr r0, [r1, #0x10]
	adds r0, r0, r4
	str r0, [sp, #0xc]
	movs r0, #9
	movs r2, #0x2a
	add r2, sp
	strb r0, [r2]
	movs r0, #0xd6
	lsls r0, r0, #1
	adds r5, r7, r0
	ldr r0, [r5]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _080550E4 @ =gUiGraphics + ((15 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r2, _080550E8 @ =gUiGraphics + ((15 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r2, _080550EC @ =gUiGraphics + ((15 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r2, _080550F0 @ =gUiGraphics + ((15 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r1, #0xf
	mov r0, sl
	strb r1, [r0]
	movs r2, #0xa
	movs r0, #0x2b
	add r0, sp
	strb r2, [r0]
	ldr r0, [r6]
	str r0, [sp, #0x14]
	movs r1, #0xd4
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	str r4, [sp, #0x18]
	ldr r2, [sp, #0x30] @ r2 = sp30 = param0
	ldr r0, [r2, #0x10]
	str r0, [sp, #0xc]
	movs r0, #0x20
	mov r8, r0
	str r0, [sp, #0x24]
	movs r1, #6
	mov sb, r1
	mov r2, sb
	add r0, sp, #0x28
	strb r2, [r0]
	movs r1, #0xd
	movs r2, #0x2a
	add r2, sp
	strb r1, [r2]
	ldr r0, [r5]
	str r0, [sp, #4]
	mov r1, sp
	ldr r2, _080550E4 @ =gUiGraphics + ((15 * 0x1C) + 0xC)
	ldr r0, [r2]
	strb r0, [r1, #8]
	ldr r2, _080550E8 @ =gUiGraphics + ((15 * 0x1C) + 0x10)
	ldr r0, [r2]
	strb r0, [r1, #9]
	ldr r2, _080550EC @ =gUiGraphics + ((15 * 0x1C) + 0x14)
	ldr r0, [r2]
	strb r0, [r1, #0xa]
	ldr r2, _080550F0 @ =gUiGraphics + ((15 * 0x1C) + 0x18)
	ldr r0, [r2]
	strb r0, [r1, #0xb]
	mov r0, sp
	bl sub_80528AC
	ldr r1, _080550F4 @ =gUnknown_08688398
	ldr r0, _080550C4 @ =gCurrentLevel
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #0x13
	mov r1, sl
	strb r0, [r1]
	movs r4, #2
	movs r2, #0x2b
	add r2, sp
	strb r4, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	str r0, [sp, #0x14]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r0, [r0]
	str r0, [sp, #0x20]
	movs r0, #0xe0
	lsls r0, r0, #3
	str r0, [sp, #0x18]
	mov r2, r8
	str r2, [sp, #0x24]
	mov r0, sb
	add r1, sp, #0x28
	strb r0, [r1]
	ldr r2, [sp, #0x30] @ r2 = sp30 = param0
	ldr r0, [r2, #0xc]
	str r0, [sp, #0xc]
	movs r0, #0xd
	movs r1, #0x2a
	add r1, sp
	strb r0, [r1]
	mov r2, sl
	ldrb r1, [r2]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	mov r2, sp
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #8]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #9]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xa]
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r1, r7, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	strb r0, [r2, #0xb]
	mov r0, sp
	bl sub_80528AC
	movs r0, #8
	str r0, [sp, #4]
	mov r0, sp
	strb r4, [r0, #8]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #9]
	movs r0, #4
	strb r0, [r1, #0xa]
	mov r0, sp
	strb r4, [r0, #0xb]
	movs r1, #2
	bl sub_80535C8
	add sp, #0x44
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080550C4: .4byte gCurrentLevel
_080550C8: .4byte gUiGraphics + 0x4
_080550CC: .4byte gUiGraphics + 0x8
_080550D0: .4byte gUiGraphics + 0xC
_080550D4: .4byte gUiGraphics + 0x10
_080550D8: .4byte gUiGraphics + 0x14
_080550DC: .4byte gUiGraphics + 0x18
_080550E0: .4byte gUiGraphics
_080550E4: .4byte gUiGraphics + ((15 * 0x1C) + 0xC)
_080550E8: .4byte gUiGraphics + ((15 * 0x1C) + 0x10)
_080550EC: .4byte gUiGraphics + ((15 * 0x1C) + 0x14)
_080550F0: .4byte gUiGraphics + ((15 * 0x1C) + 0x18)
_080550F4: .4byte gUnknown_08688398

.syntax divided
