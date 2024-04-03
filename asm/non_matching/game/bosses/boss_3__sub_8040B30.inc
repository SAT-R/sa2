.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r2, r0, #0         @ r2 = totem
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18      @ r1 = i
	movs r6, #0
	cmp r1, #3
	bhi _08040B62
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r7, r2, r0         @ r7 = &totem->unk3C[i]
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	beq _08040B62
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040B66
_08040B62:
	movs r0, #0
	b _08040D62
_08040B66:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r0, r2
	mov sb, r0              @ sb = &totem->spr248
	ldr r2, [r7]
	lsls r2, r2, #8         @ r2 = (totem->unk3C[i].qWorldX << 8)
	ldr r0, [r7, #4]
	asrs r0, r0, #8         @ r0 = I(totem->unk3C[i].qWorldY)
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	adds r1, r1, r0         @ r1 = totem->unk3C[i].unk17 + I(qWorldY)
	lsls r1, r1, #0x10
	lsrs r0, r2, #0x10
	str r0, [sp, #0x44]     @ sp44 = (u16) I(totem->unk3C[i].qWorldX)
	asrs r4, r2, #0x10      @ r4 = (s16) I(totem->unk3C[i].qWorldX)
	lsrs r2, r1, #0x10
	mov sl, r2              @ sl = I(totem->unk3C[i].qWorldY) + totem->unk3C[i].unk17
	asrs r5, r1, #0x10      @ r5 = I(totem->unk3C[i].qWorldY) + totem->unk3C[i].unk17
	ldr r0, _08040C38 @ =gPlayer
	str r0, [sp]
	mov r0, sb
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_800C320
	cmp r0, #1
	bne _08040C64
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	movs r1, #0xff
	mov r8, r1              @ r8 = (u8)-1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040C5C
	ldr r1, _08040C3C @ =gCamera
	ldr r0, [r1]
	subs r0, r4, r0
	str r0, [sp, #0x18]
	ldr r0, [r1, #4]
	subs r0, r5, r0
	str r0, [sp, #0x1c]
	add r0, sp, #4          @ sp04 = info
	strh r6, [r0, #0x1c]
	adds r1, r0, #0         @ r1 = info
	movs r0, #0xf0
	lsls r0, r0, #2         @ r0 = 0x3C0
	strh r0, [r1, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #3
	strh r0, [r1, #0xe]
	ldr r0, _08040C40 @ =0x06012980
	str r0, [sp, #4]
	ldr r0, _08040C44 @ =0x0000026B
	strh r0, [r1, #8]
	adds r0, r1, #0
	strh r6, [r0, #0xa]
	str r6, [sp, #8]
	adds r1, r7, #0
	adds r1, #0x16
	bl CreateBossParticleWithExplosionUpdate
	ldr r1, _08040C48 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040C4C @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040C2E
	ldr r0, _08040C50 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040C2E
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040C54 @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040C26
	mov r0, r8
_08040C26:
	strb r0, [r1]
	ldr r1, _08040C58 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08040C2E:
	movs r0, #0x90
	bl m4aSongNumStart
	b _08040C62
	.align 2, 0
_08040C38: .4byte gPlayer
_08040C3C: .4byte gCamera
_08040C40: .4byte 0x06012980
_08040C44: .4byte 0x0000026B
_08040C48: .4byte gLevelScore
_08040C4C: .4byte 0x0000C350
_08040C50: .4byte gGameMode
_08040C54: .4byte gNumLives
_08040C58: .4byte gUnknown_030054A8
_08040C5C:
	movs r0, #0x8f
	bl m4aSongNumStart
_08040C62:
	movs r6, #1
_08040C64:
	ldr r1, [sp, #0x44]         @ r1 = sp44 = (u16) I(totem->unk3C[i].qWorldX)
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	lsls r0, r4, #8
	mov r2, sl                  @ r2 = sl = I(totem->unk3C[i].qWorldY) + totem->unk3C[i].unk17
	lsls r1, r2, #0x10
	asrs r5, r1, #0x10
	lsls r1, r5, #8
	bl Player_UpdateHomingPosition
	ldr r0, _08040D30 @ =gPlayer
	str r0, [sp]
	mov r0, sb                  @ r0 = sb = &totem->spr248
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl IsColliding_Cheese
	cmp r0, #1
	bne _08040D60
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	movs r1, #0xff
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08040D58
_middlestep:
	add r0, sp, #0x24
	ldr r2, _08040D34 @ =gCamera
	ldr r1, [r2]
	subs r1, r4, r1
	str r1, [r0, #0x14]
	ldr r1, [r2, #4]
	subs r1, r5, r1
	str r1, [r0, #0x18]
	strh r3, [r0, #0x1c]
	movs r1, #0xf0
	lsls r1, r1, #2
	strh r1, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #3
	strh r1, [r0, #0xe]
	ldr r1, _08040D38 @ =0x06012980
	str r1, [sp, #0x24]
	ldr r1, _08040D3C @ =0x0000026B
	strh r1, [r0, #8]
	strh r3, [r0, #0xa]
	str r3, [r0, #4]
	adds r1, r7, #0
	adds r1, #0x16
	bl CreateBossParticleWithExplosionUpdate
	ldr r1, _08040D40 @ =gLevelScore
	ldr r5, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r0, r5, r2
	str r0, [r1]
	ldr r4, _08040D44 @ =0x0000C350
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r0, #0
	cmp r6, r1
	beq _08040D1A
	ldr r0, _08040D48 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040D1A
	subs r0, r6, r1
	lsls r0, r0, #0x10
	ldr r1, _08040D4C @ =gNumLives
	lsrs r0, r0, #0x10
	ldrb r2, [r1]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _08040D12
	mov r0, r8
_08040D12:
	strb r0, [r1]
	ldr r1, _08040D50 @ =gUnknown_030054A8
	movs r0, #0x10
	strb r0, [r1, #3]
_08040D1A:
	movs r0, #0x90
	bl m4aSongNumStart
	ldr r0, _08040D30 @ =gPlayer
	bl Collision_AdjustPlayerSpeed
	ldr r0, _08040D54 @ =gUnknown_03005498
	ldr r1, [r0, #4]
	movs r0, #0
	strb r0, [r1, #0x15]
	b _08040D5E
	.align 2, 0
_08040D30: .4byte gPlayer
_08040D34: .4byte gCamera
_08040D38: .4byte 0x06012980
_08040D3C: .4byte 0x0000026B
_08040D40: .4byte gLevelScore
_08040D44: .4byte 0x0000C350
_08040D48: .4byte gGameMode
_08040D4C: .4byte gNumLives
_08040D50: .4byte gUnknown_030054A8
_08040D54: .4byte gUnknown_03005498
_08040D58:
	movs r0, #0x8f
	bl m4aSongNumStart
_08040D5E:
	movs r6, #1
_08040D60:
	adds r0, r6, #0
_08040D62:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

.syntax divided
