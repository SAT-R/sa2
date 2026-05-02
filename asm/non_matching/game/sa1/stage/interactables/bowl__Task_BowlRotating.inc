.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08080BE4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0xc
	adds r0, r1, r0
	str r0, [sp]
	ldr r1, [r7]
	str r1, [sp, #0xc]
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	ldrh r1, [r7, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r1, _08080BE8 @ =gCamera
	ldrh r0, [r1]
	lsrs r6, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r0
	ldr r4, [sp]
	strh r2, [r4, #0x16]
	ldr r4, [r7, #0x48]
	ldr r3, [r7, #0x4c]
	cmp r4, r3
	bls _08080BEC
	ldrh r1, [r1, #2]
	ldr r0, [sp, #4]
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	subs r0, r0, r1
	lsrs r1, r4, #0xd
	adds r0, r0, r1
	ldr r1, [sp]
	strh r0, [r1, #0x18]
	ldr r0, [r7, #0x48]
	b _08080C00
	.align 2, 0
_08080BE4: .4byte gCurTask
_08080BE8: .4byte gCamera
_08080BEC:
	ldrh r1, [r1, #2]
	ldr r4, [sp, #4]
	lsls r2, r4, #0x10
	asrs r0, r2, #0x10
	subs r0, r0, r1
	lsrs r1, r3, #0xd
	adds r0, r0, r1
	ldr r1, [sp]
	strh r0, [r1, #0x18]
	ldr r0, [r7, #0x4c]
_08080C00:
	lsrs r0, r0, #0xd
	str r0, [sp, #8]
	str r2, [sp, #0x10]
	movs r5, #0
	lsls r6, r6, #0x10
	mov sl, r6
	adds r2, r7, #0
	adds r2, #0x51
	str r2, [sp, #0x18]
	ldr r6, _08080C20 @ =gPartner
	ldr r4, _08080C24 @ =gPlayer
	mov r8, r4
_08080C18_loop:
	cmp r5, #0
	beq _08080C28
	ldr r0, [r6, #0x10]
	b _08080C2C
	.align 2, 0
_08080C20: .4byte gPartner
_08080C24: .4byte gPlayer
_08080C28:
	mov r1, r8
	ldr r0, [r1, #0x10]
_08080C2C:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08080C36
	b _08080DF2
_08080C36:
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08080C46
	b _08080DF2
_08080C46:
	mov r4, sl
	asrs r1, r4, #0x10
	cmp r5, #0
	beq _08080C60
	ldr r0, [r6]
	asrs r0, r0, #8
	ldr r3, _08080C5C @ =gPlayer
	cmp r0, r1
	bgt _08080C6C
	b _08080C74
	.align 2, 0
_08080C5C: .4byte gPlayer
_08080C60:
	mov r2, r8
	ldr r0, [r2]
	asrs r0, r0, #8
	ldr r3, _08080C70 @ =gPlayer
	cmp r0, r1
	ble _08080C74
_08080C6C:
	movs r1, #0xa
	b _08080C76
	.align 2, 0
_08080C70: .4byte gPlayer
_08080C74:
	ldr r1, _08080CBC @ =0x0000FFF6
_08080C76:
	mov r4, sl
	asrs r0, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, [sp, #4]
	adds r0, #0xd
	ldr r2, [sp, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r5, #0
	beq _08080C96
	ldr r3, _08080CC0 @ =gPartner
_08080C96:
	ldr r0, [sp]
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _08080CA2
	b _08080DF2
_08080CA2:
	adds r0, r7, #0
	adds r0, #0x40
	adds r4, r7, #0
	adds r4, #0x42
	ldrh r3, [r0]
	ldrh r1, [r4]
	adds r2, r0, #0
	cmp r3, r1
	bls _08080CC4
	strh r3, [r4]
	ldr r0, [r7, #0x48]
	str r0, [r7, #0x4c]
	b _08080CCA
	.align 2, 0
_08080CBC: .4byte 0x0000FFF6
_08080CC0: .4byte gPartner
_08080CC4:
	strh r1, [r2]
	ldr r0, [r7, #0x4c]
	str r0, [r7, #0x48]
_08080CCA:
	movs r0, #1
	lsls r0, r5
	ldr r4, [sp, #0x18]
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov sb, r0
	ldr r0, [r7, #0x48]
	lsrs r4, r0, #8
	mov r0, sl
	asrs r1, r0, #0x10
	cmp r5, #0
	beq _08080CF0
	ldr r0, [r6]
	b _08080CF4
_08080CF0:
	mov r2, r8
	ldr r0, [r2]
_08080CF4:
	asrs r0, r0, #8
	subs r0, r0, r1
	adds r0, #0x30
	lsls r0, r0, #9
	movs r1, #0x60
	bl Div
	cmp r0, #0
	bge _08080D34
	mov r0, sl
	asrs r1, r0, #0x10
	cmp r5, #0
	beq _08080D12
	ldr r0, [r6]
	b _08080D16
_08080D12:
	mov r2, r8
	ldr r0, [r2]
_08080D16:
	asrs r0, r0, #8
	subs r0, r0, r1
	adds r0, #0x30
	lsls r0, r0, #9
	movs r1, #0x60
	bl Div
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r4, r2
	subs r1, r1, r0
	ldr r0, _08080D30 @ =0x000003FF
	b _08080D5C
	.align 2, 0
_08080D30: .4byte 0x000003FF
_08080D34:
	mov r0, sl
	asrs r1, r0, #0x10
	cmp r5, #0
	beq _08080D40
	ldr r0, [r6]
	b _08080D44
_08080D40:
	mov r2, r8
	ldr r0, [r2]
_08080D44:
	asrs r0, r0, #8
	subs r0, r0, r1
	adds r0, #0x30
	lsls r0, r0, #9
	movs r1, #0x60
	bl Div
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r4, r2
	adds r0, r0, r1
	ldr r1, _08080D6C @ =0x000003FF
_08080D5C:
	ands r0, r1
	movs r1, #0
	mov r4, sb
	strh r0, [r4]
	cmp r5, #0
	beq _08080D70
	strh r1, [r6, #0x38]
	b _08080D74
	.align 2, 0
_08080D6C: .4byte 0x000003FF
_08080D70:
	mov r0, r8
	strh r5, [r0, #0x38]
_08080D74:
	ldr r3, _08080D80 @ =gPlayer
	cmp r5, #0
	beq _08080D84
	movs r0, #0
	strh r0, [r6, #0x3a]
	b _08080D86
	.align 2, 0
_08080D80: .4byte gPlayer
_08080D84:
	strh r5, [r3, #0x3a]
_08080D86:
	adds r0, r3, #0
	cmp r5, #0
	beq _08080D8E
	ldr r0, _08080DA0 @ =gPartner
_08080D8E:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _08080DA8
	movs r0, #5
	ldr r1, _08080DA4 @ =gPartner + 0x40
	strb r0, [r1]
	b _08080DAE
	.align 2, 0
_08080DA0: .4byte gPartner
_08080DA4: .4byte gPartner + 0x40
_08080DA8:
	movs r0, #5
	ldr r2, _08080DC0 @ =gPlayer + 0x40
	strb r0, [r2]
_08080DAE:
	cmp r5, #0
	beq _08080DC4
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x10]
	b _08080DD0
	.align 2, 0
_08080DC0: .4byte gPlayer + 0x40
_08080DC4:
	mov r4, r8
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
_08080DD0:
	cmp r5, #0
	beq _08080DE8
	ldr r0, _08080DE4 @ =gPartner + 0x26
	ldrb r1, [r0]
	movs r0, #0x80
	orrs r0, r1
	ldr r1, _08080DE4 @ =gPartner + 0x26
	strb r0, [r1]
	b _08080DF2
	.align 2, 0
_08080DE4: .4byte gPartner + 0x26
_08080DE8:
	ldr r2, _08080E4C @ =gPlayer + 0x26
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_08080DF2:
	adds r5, #1
	ldr r0, _08080E50 @ =gNumSingleplayerCharacters
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r5, r1
	bge _08080E00
	b _08080C18_loop
_08080E00:
	movs r5, #0
	mov r8, r5
	ldr r4, _08080E54 @ =gPlayer
	mov sb, r4
_08080E08_loop:
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08080ECC
	adds r4, r7, #0
	adds r4, #0x48
	mov r2, r8
	adds r0, r4, r2
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x3c
	adds r0, r0, r1
	lsrs r2, r2, #8
	ldrh r0, [r0]
	adds r2, r2, r0
	adds r3, r7, #0
	adds r3, #0x50
	ldrb r1, [r3]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #6
	adds r2, r2, r0
	ldr r0, _08080E58 @ =0x000003FF
	ands r2, r0
	adds r6, r4, #0
	cmp r5, #0
	beq _08080E60
	ldr r4, _08080E5C @ =gPartner
	ldr r0, [r4, #0x10]
	b _08080E64
	.align 2, 0
_08080E4C: .4byte gPlayer + 0x26
_08080E50: .4byte gNumSingleplayerCharacters
_08080E54: .4byte gPlayer
_08080E58: .4byte 0x000003FF
_08080E5C: .4byte gPartner
_08080E60:
	mov r1, sb
	ldr r0, [r1, #0x10]
_08080E64:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08080ECC
	ldr r1, _08080E98 @ =gSineTable
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r1, #0x32
	bl Div
	mov r4, sl
	asrs r1, r4, #8
	adds r1, r1, r0
	cmp r5, #0
	beq _08080EA0
	ldr r0, _08080E9C @ =gPartner
	str r1, [r0]
	b _08080EA4
	.align 2, 0
_08080E98: .4byte gSineTable
_08080E9C: .4byte gPartner
_08080EA0:
	mov r2, sb
	str r1, [r2]
_08080EA4:
	ldr r4, [sp, #0x10]
	asrs r1, r4, #8
	ldr r0, _08080EC0 @ =0xFFFFEF00
	adds r1, r1, r0
	mov r2, r8
	adds r0, r6, r2
	ldr r0, [r0]
	lsrs r0, r0, #5
	adds r0, r1, r0
	cmp r5, #0
	beq _08080EC8
	ldr r4, _08080EC4 @ =gPartner
	str r0, [r4, #4]
	b _08080ECC
	.align 2, 0
_08080EC0: .4byte 0xFFFFEF00
_08080EC4: .4byte gPartner
_08080EC8:
	mov r1, sb
	str r0, [r1, #4]
_08080ECC:
	movs r2, #4
	add r8, r2
	adds r5, #1
	ldr r4, _08080F0C @ =gNumSingleplayerCharacters
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r5, r0
	blt _08080E08_loop
	movs r5, #0
	mov r8, r5
	mov sb, r5
_08080EE2_loop:
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08080FB0
	adds r1, r7, #0
	adds r1, #0x48
	mov r2, sb
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _08080F10 @ =0x000D8107
	adds r6, r1, #0
	cmp r2, r0
	bls _08080F60
	cmp r5, #0
	beq _08080F18
	ldr r0, _08080F14 @ =gPartner
	b _08080F1A
	.align 2, 0
_08080F0C: .4byte gNumSingleplayerCharacters
_08080F10: .4byte 0x000D8107
_08080F14: .4byte gPartner
_08080F18:
	ldr r0, _08080F48 @ =gPlayer
_08080F1A:
	ldr r1, [r0, #0x10]
	movs r0, #0x80
	ands r1, r0
	adds r2, r7, #0
	adds r2, #0x40
	cmp r1, #0
	bne _08080F6E
	adds r1, r7, #0
	adds r1, #0x40
	mov r4, r8
	adds r0, r1, r4
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldr r2, _08080F4C @ =0xFFFFF830
	adds r0, r0, r2
	lsls r3, r0, #1
	adds r2, r1, #0
	cmp r5, #0
	beq _08080F54
	ldr r0, _08080F50 @ =gPartner
	strh r3, [r0, #0xa]
	b _08080F6E
	.align 2, 0
_08080F48: .4byte gPlayer
_08080F4C: .4byte 0xFFFFF830
_08080F50: .4byte gPartner
_08080F54:
	ldr r0, _08080F5C @ =gPlayer
	strh r3, [r0, #0xa]
	b _08080F6E
	.align 2, 0
_08080F5C: .4byte gPlayer
_08080F60:
	adds r2, r7, #0
	adds r2, #0x40
	mov r4, r8
	adds r1, r2, r4
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
_08080F6E:
	mov r0, r8
	adds r4, r2, r0
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #0x18
	lsrs r1, r2, #0x10
	cmp r0, r1
	bls _08080F80
	strh r1, [r4]
_08080F80:
	ldrh r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #8
	bl Div
	ldr r1, [sp]
	adds r1, #0x22
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _08080FA4
	movs r0, #0x10
	strb r0, [r1]
_08080FA4:
	mov r0, sb
	adds r2, r6, r0
	ldrh r1, [r4]
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08080FB0:
	movs r1, #2
	add r8, r1
	movs r2, #4
	add sb, r2
	adds r5, #1
	ldr r4, _08081030 @ =gNumSingleplayerCharacters
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r5, r0
	blt _08080EE2_loop
	mov r0, sl
	asrs r2, r0, #0x10
	ldr r3, _08081034 @ =gCamera
	movs r4, #0
	ldrsh r1, [r3, r4]
	movs r4, #0xb8
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _08080FF8
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08080FF8
	ldr r0, [sp, #0x10]
	asrs r1, r0, #0x10
	movs r2, #2
	ldrsh r3, [r3, r2]
	subs r4, #0x50
	adds r0, r3, r4
	cmp r1, r0
	bgt _08080FF8
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bge _0808103C
_08080FF8:
	ldr r1, [sp]
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08081020
	ldr r2, [sp]
	movs r4, #0x18
	ldrsh r0, [r2, r4]
	adds r0, #0x80
	cmp r0, #0
	blt _08081020
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0808103C
_08081020:
	ldrb r0, [r7, #8]
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldr r0, _08081038 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0808126E
	.align 2, 0
_08081030: .4byte gNumSingleplayerCharacters
_08081034: .4byte gCamera
_08081038: .4byte gCurTask
_0808103C:
	movs r4, #0
	adds r2, r7, #0
	adds r2, #0x44
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r8, r0
	ldr r6, _08081088 @ =gPartner
	movs r1, #0x80
	mov sb, r1
	ldr r5, _0808108C @ =gPlayer
	movs r2, #0x26
	adds r2, r2, r5
	mov ip, r2
_08081056:
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08081066
	b _080811CA
_08081066:
	lsls r1, r4, #2
	adds r0, r7, #0
	adds r0, #0x48
	adds r2, r0, r1
	ldr r1, [r2]
	ldr r0, _08081090 @ =0x000D8107
	cmp r1, r0
	bhi _08081078
	b _080811CA
_08081078:
	adds r0, #1
	str r0, [r2]
	cmp r4, #0
	beq _08081094
	ldr r0, [r6, #0x10]
	mov r2, sb
	ands r0, r2
	b _0808109A
	.align 2, 0
_08081088: .4byte gPartner
_0808108C: .4byte gPlayer
_08081090: .4byte 0x000D8107
_08081094:
	ldr r0, [r5, #0x10]
	mov r1, sb
	ands r0, r1
_0808109A:
	adds r3, r7, #0
	adds r3, #0x50
	cmp r0, #0
	bne _080810DE
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0xf
	bhi _080810C4
	ldrb r1, [r3]
	movs r0, #0xb4
	muls r1, r0, r1
	cmp r4, #0
	beq _080810C0
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r6, #4]
	b _080810DE
_080810C0:
	ldr r0, [r5, #4]
	b _080810DA
_080810C4:
	cmp r4, #0
	beq _080810D4
	ldr r0, [r6, #4]
	movs r2, #0xb4
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [r6, #4]
	b _080810DE
_080810D4:
	ldr r0, [r5, #4]
	movs r1, #0xb4
	lsls r1, r1, #4
_080810DA:
	adds r0, r0, r1
	str r0, [r5, #4]
_080810DE:
	cmp r4, #0
	bne _080810E8
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080810E8:
	ldrb r0, [r3]
	cmp r0, #0x40
	bls _080811CA
	cmp r4, #0
	beq _080810FA
	ldr r0, [r6, #0x10]
	mov r2, sb
	ands r0, r2
	b _08081100
_080810FA:
	ldr r0, [r5, #0x10]
	mov r1, sb
	ands r0, r1
_08081100:
	cmp r0, #0
	bne _0808119A
	cmp r4, #0
	beq _08081118
	ldr r0, [r6, #0x10]
	ldr r1, _08081114 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
	b _08081120
	.align 2, 0
_08081114: .4byte 0xFFBFFFFF
_08081118:
	ldr r0, [r5, #0x10]
	ldr r1, _08081130 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
_08081120:
	cmp r4, #0
	beq _08081134
	ldr r0, [r6, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r6, #0x10]
	b _0808113C
	.align 2, 0
_08081130: .4byte 0xFFBFFFFF
_08081134:
	ldr r0, [r5, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
_0808113C:
	cmp r4, #0
	beq _0808114A
	ldr r0, [r6, #0x10]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r6, #0x10]
	b _08081152
_0808114A:
	ldr r0, [r5, #0x10]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r5, #0x10]
_08081152:
	cmp r4, #0
	beq _08081160
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
	b _08081168
_08081160:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_08081168:
	cmp r4, #0
	beq _08081172
	movs r0, #0
	strh r0, [r6, #8]
	b _08081174
_08081172:
	strh r4, [r5, #8]
_08081174:
	cmp r4, #0
	beq _0808117E
	movs r0, #0
	strh r0, [r6, #0xc]
	b _08081180
_0808117E:
	strh r4, [r5, #0xc]
_08081180:
	mov r2, sl
	asrs r0, r2, #8
	cmp r4, #0
	beq _0808118C
	str r0, [r6]
	b _0808118E
_0808118C:
	str r0, [r5]
_0808118E:
	movs r1, #1
	lsls r1, r4
	mov r2, r8
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_0808119A:
	ldr r0, _080811B4 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080811B8 @ =Task_Bowl3
	str r0, [r1, #8]
	cmp r4, #0
	beq _080811C0
	ldr r0, _080811BC @ =gPartner + 0x26
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	ldr r1, _080811BC @ =gPartner + 0x26
	strb r0, [r1]
	b _080811CA
	.align 2, 0
_080811B4: .4byte gCurTask
_080811B8: .4byte Task_Bowl3
_080811BC: .4byte gPartner + 0x26
_080811C0:
	mov r2, ip
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_080811CA:
	adds r4, #1
	ldr r1, _08081200 @ =gNumSingleplayerCharacters
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	bge _080811D8
	b _08081056
_080811D8:
	ldr r1, [sp, #0x14]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bls _080811EC
	movs r0, #0xf0
	strh r0, [r1]
_080811EC:
	ldr r2, [sp, #0x14]
	ldrh r0, [r2]
	cmp r0, #0x38
	bne _08081230
	movs r4, #0
	movs r5, #0x80
_080811F8:
	cmp r4, #0
	beq _08081208
	ldr r0, _08081204 @ =gPartner
	b _0808120A
	.align 2, 0
_08081200: .4byte gNumSingleplayerCharacters
_08081204: .4byte gPartner
_08081208:
	ldr r0, _08081228 @ =gPlayer
_0808120A:
	ldr r0, [r0, #0x10]
	ands r0, r5
	cmp r0, #0
	bne _08081218
	movs r0, #0xcf
	bl m4aSongNumStart
_08081218:
	adds r4, #1
	ldr r0, _0808122C @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	blt _080811F8
	b _08081262
	.align 2, 0
_08081228: .4byte gPlayer
_0808122C: .4byte gNumSingleplayerCharacters
_08081230:
	cmp r0, #0x70
	bne _08081262
	movs r4, #0
	movs r5, #0x80
_08081238:
	cmp r4, #0
	beq _08081244
	ldr r0, _08081240 @ =gPartner
	b _08081246
	.align 2, 0
_08081240: .4byte gPartner
_08081244:
	ldr r0, _08081280 @ =gPlayer
_08081246:
	ldr r0, [r0, #0x10]
	ands r0, r5
	cmp r0, #0
	bne _08081254
	movs r0, #0xd0
	bl m4aSongNumStart
_08081254:
	adds r4, #1
	ldr r0, _08081284 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	blt _08081238
_08081262:
	ldr r0, [sp]
	bl UpdateSpriteAnimation
	ldr r0, [sp]
	bl DisplaySprite
_0808126E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081280: .4byte gPlayer
_08081284: .4byte gNumSingleplayerCharacters

.syntax divided
