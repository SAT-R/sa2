.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _08085C44 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sb, r1          @ sb = carousel
	ldr r1, _08085C48 @ =0x0300000C
	adds r1, r0, r1
	str r1, [sp]        @ sp00 = s1
	ldr r2, _08085C4C @ =0x0300003C
	adds r2, r0, r2
	str r2, [sp, #4]    @ sp04 = s2
	mov r3, sb
	ldr r3, [r3]
	str r3, [sp, #0x10] @ sp10 = me
	mov r4, sb
	ldrb r2, [r4, #8]
	lsls r2, r2, #3
	ldrh r0, [r4, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r3, [r3, #1]
	lsls r3, r3, #3
	ldrh r0, [r4, #6]
	lsls r0, r0, #8
	adds r3, r3, r0
	lsls r3, r3, #0x10
	ldr r1, _08085C50 @ =gCamera
	ldrh r0, [r1]
	lsrs r4, r2, #0x10
	str r4, [sp, #8]    @ sp08 = worldX
	asrs r2, r2, #0x10
	subs r2, r2, r0
	ldr r0, [sp]        @ r0 = sp00 = s1
	strh r2, [r0, #0x16]
	ldrh r1, [r1, #2]
	lsrs r4, r3, #0x10
	str r4, [sp, #0xc]  @ sp0C = worldY
	asrs r3, r3, #0x10
	subs r1, r3, r1
	mov r4, sb
	ldr r0, [r4, #0x70]
	lsrs r0, r0, #0xd
	adds r1, r1, r0
	adds r1, #2
	ldr r0, [sp]        @ r0 = sp00 = s1
	strh r1, [r0, #0x18]
	ldr r1, [sp, #4]    @ r1 = sp04 = s2
	strh r2, [r1, #0x16]
	ldrh r0, [r0, #0x18]
	adds r0, #2
	strh r0, [r1, #0x18]
	movs r5, #0
	ldr r4, _08085C54 @ =gPartner
	ldr r7, _08085C58 @ =gPlayer
	str r3, [sp, #0x14] @ sp14 = worldY
_08085C2C_loop:
	cmp r5, #0
	beq _08085C5C
	ldr r1, [r4, #0x10]
	movs r0, #0x80
	ands r1, r0
	ldr r2, [sp, #8]    @ r2 = sp08 = worldX
	lsls r2, r2, #0x10
	str r2, [sp, #0x18] @ sp18 = worldX << 16
	mov r3, sb
	adds r3, #0x79
	str r3, [sp, #0x1c] @ sp1C = &carousel->unk79
	b _08085C6E
	.align 2, 0
_08085C44: .4byte gCurTask
_08085C48: .4byte 0x0300000C
_08085C4C: .4byte 0x0300003C
_08085C50: .4byte gCamera
_08085C54: .4byte gPartner
_08085C58: .4byte gPlayer
_08085C5C:
	ldr r1, [r7, #0x10]
	movs r0, #0x80
	ands r1, r0
	ldr r0, [sp, #8]    @ r0 = sp08 = worldX
	lsls r0, r0, #0x10
	str r0, [sp, #0x18] @ sp18 = worldX << 16
	mov r2, sb
	adds r2, #0x79
	str r2, [sp, #0x1c] @ sp1C = &carousel->unk79
_08085C6E:
	cmp r1, #0
	bne _08085CAC
	mov r1, sb
	adds r1, #0x79
	ldrb r0, [r1]
	asrs r0, r5
	movs r3, #1
	ands r0, r3
	ldr r2, [sp, #8]    @ r2 = sp08 = worldX
	lsls r2, r2, #0x10
	str r2, [sp, #0x18] @ sp18 = worldX << 16
	str r1, [sp, #0x1c] @ sp1C = &carousel->unk79
	cmp r0, #0
	beq _08085CBC
	asrs r0, r2, #8
	cmp r5, #0
	beq _08085C94
	str r0, [r4]
	b _08085C96
_08085C94:
	str r0, [r7]
_08085C96:
	mov r3, sb
	ldr r0, [r3, #0x70]
	lsrs r0, r0, #0xd
	ldr r1, [sp, #0x14] @ r1 = worldY
	adds r0, r1, r0
	lsls r0, r0, #8
	cmp r5, #0
	beq _08085CAA
	str r0, [r4, #4]
	b _08085CAC
_08085CAA:
	str r0, [r7, #4]
_08085CAC:
	ldr r2, [sp, #0x1c] @ r2 = sp1C = &carousel->unk79
	ldrb r0, [r2]
	asrs r0, r5
	movs r3, #1
	ands r0, r3
	cmp r0, #0
	beq _08085CBC
	b _08085EE8_continue
_08085CBC:
	mov r1, sb
	ldr r0, [r1, #0x70]
	lsls r0, r0, #3
	ldr r2, [sp, #0x18] @ r2 = sp18 = worldX << 16
	asrs r1, r2, #0x10  @ r1 = worldX
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x14] @ r2 = worldY
	adds r6, r2, r0     @ r6 = worldY + 
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	ldr r3, _08085D08 @ =gPlayer
	ldr r0, [sp, #0xc]  @ r0 = sp0C = worldY
	lsls r0, r0, #0x10
	mov r8, r0          @ r8 = worldY << 16
	cmp r5, #0
	beq _08085CE2
	ldr r3, _08085D0C @ =gPartner
_08085CE2:
	ldr r0, [sp]        @ r0 = sp00 = s1
	bl Coll_Player_PlatformCrumbling
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _08085D14
	ldr r1, [sp, #0x1c] @ r1 = sp1C = &carousel->unk79
	ldrb r0, [r1]
	asrs r0, r5
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _08085D14
	lsls r0, r6, #8
	cmp r5, #0
	beq _08085D10
	str r0, [r4, #4]
	b _08085D6A
	.align 2, 0
_08085D08: .4byte gPlayer
_08085D0C: .4byte gPartner
_08085D10:
	str r0, [r7, #4]
	b _08085D6A
_08085D14:
	ldr r3, [sp, #0x18] @ r3 = sp18 = worldX << 16
	asrs r6, r3, #0x10
	mov r0, r8
	asrs r1, r0, #0x10
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	asrs r2, r1, #0x10
	ldr r3, _08085D58 @ =gPlayer
	cmp r5, #0
	beq _08085D30
	ldr r3, _08085D5C @ =gPartner
_08085D30:
	ldr r0, [sp]        @ r0 = sp00 = s1
	adds r1, r6, #0
	bl Coll_Player_Entity_Intersection
	cmp r0, #0
	bne _08085D6A
	ldr r3, [sp, #0x1c] @ r3 = sp1C = &carousel->unk79
	ldrb r0, [r3]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08085D6A
	cmp r5, #0
	beq _08085D60
	ldr r0, [r4, #0x10]
	subs r1, #0xa
	ands r0, r1
	str r0, [r4, #0x10]
	b _08085D6A
	.align 2, 0
_08085D58: .4byte gPlayer
_08085D5C: .4byte gPartner
_08085D60:
	ldr r0, [r7, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r7, #0x10]
_08085D6A:
	ldr r2, [sp, #0x18] @ r2 = sp18 = worldX << 16
	asrs r0, r2, #0x10
	adds r1, r0, #0
	subs r1, #8
	cmp r5, #0
	beq _08085D80
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _08085D8A
	b _08085EE8_continue
_08085D80:
	ldr r0, [r7]
	asrs r0, r0, #8
	cmp r1, r0
	ble _08085D8A
	b _08085EE8_continue
_08085D8A:
	ldr r3, [sp, #0x18] @ r3 = sp18 = worldX << 16
	asrs r0, r3, #0x10
	adds r1, r0, #0
	adds r1, #8
	cmp r5, #0
	beq _08085DA0
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08085DAA
	b _08085EE8_continue
_08085DA0:
	ldr r0, [r7]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08085DAA
	b _08085EE8_continue
_08085DAA:
	mov r1, r8
	asrs r0, r1, #0x10
	mov r3, sl
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	adds r3, r0, #0
	subs r3, #0x30
	cmp r5, #0
	beq _08085DC8
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r3, r0
	ble _08085DD2
	b _08085EE8_continue
_08085DC8:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r3, r0
	ble _08085DD2
	b _08085EE8_continue
_08085DD2:
	mov r1, r8
	asrs r0, r1, #0x10
	asrs r1, r2, #0x10
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0xc
	cmp r5, #0
	beq _08085DEC
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08085DF6
	b _08085EE8_continue
_08085DEC:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08085DF6
	b _08085EE8_continue
_08085DF6:
	mov r2, sb
	ldr r1, [r2, #0x70]
	ldr r0, _08085E18 @ =0x003C2A57
	cmp r1, r0
	bhi _08085EE8_continue
	movs r1, #1
	lsls r1, r5
	ldr r3, [sp, #0x1c] @ r3 = sp1C = &carousel->unk79
	ldrb r0, [r3]
	orrs r1, r0
	movs r0, #0
	strb r1, [r3]
	cmp r5, #0
	beq _08085E1C
	strh r0, [r4, #8]
	b _08085E1E
	.align 2, 0
_08085E18: .4byte 0x003C2A57
_08085E1C:
	strh r5, [r7, #8]
_08085E1E:
	ldr r2, _08085E30 @ =gPlayer
	cmp r5, #0
	beq _08085E34
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _08085E3C
	b _08085E4E
	.align 2, 0
_08085E30: .4byte gPlayer
_08085E34:
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _08085E4E
_08085E3C:
	cmp r5, #0
	beq _08085E48
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r4, #0xc]
	b _08085E60
_08085E48:
	movs r0, #0xf0
	lsls r0, r0, #3
	b _08085E5E
_08085E4E:
	cmp r5, #0
	beq _08085E5C
	ldr r0, _08085E58 @ =0x0000F880
	strh r0, [r4, #0xc]
	b _08085E60
	.align 2, 0
_08085E58: .4byte 0x0000F880
_08085E5C:
	ldr r0, _08085E6C @ =0x0000F880
_08085E5E:
	strh r0, [r2, #0xc]
_08085E60:
	cmp r5, #0
	beq _08085E70
	movs r0, #0
	strh r0, [r4, #0x38]
	b _08085E72
	.align 2, 0
_08085E6C: .4byte 0x0000F880
_08085E70:
	strh r5, [r2, #0x38]
_08085E72:
	cmp r5, #0
	beq _08085E7C
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _08085E7E
_08085E7C:
	strh r5, [r2, #0x3a]
_08085E7E:
	adds r0, r2, #0
	cmp r5, #0
	beq _08085E86
	ldr r0, _08085E98 @ =gPartner
_08085E86:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _08085EA0
	movs r0, #0x21
	ldr r1, _08085E9C @ =gPartner + 0x40
	strb r0, [r1]
	b _08085EA6
	.align 2, 0
_08085E98: .4byte gPartner
_08085E9C: .4byte gPartner + 0x40
_08085EA0:
	movs r0, #0x21
	ldr r2, _08085EB8 @ =gPlayer + 0x40
	strb r0, [r2]
_08085EA6:
	cmp r5, #0
	beq _08085EBC
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08085EC6
	.align 2, 0
_08085EB8: .4byte gPlayer + 0x40
_08085EBC:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r7, #0x10]
_08085EC6:
	cmp r5, #0
	beq _08085EDC
	ldr r3, _08085ED8 @ =gPartner + 0x26
	ldrb r1, [r3]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r3]
	b _08085EE8_continue
	.align 2, 0
_08085ED8: .4byte gPartner + 0x26
_08085EDC:
	ldr r0, _08085F1C @ =gPlayer + 0x26
	ldrb r1, [r0]
	movs r0, #0x80
	orrs r0, r1
	ldr r1, _08085F1C @ =gPlayer + 0x26
	strb r0, [r1]
_08085EE8_continue:
	adds r5, #1
	ldr r0, _08085F20 @ =gNumSingleplayerCharacters
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r5, r1
	bge _08085EF8
	b _08085C2C_loop
_08085EF8:
	mov r3, sb
	ldr r1, [r3, #0x70]
	ldr r0, _08085F24 @ =0x003C2A57
	cmp r1, r0
	bls _08085F9C
	movs r4, #0
	movs r0, #0x6e
	add r0, sb
	mov r8, r0          @ r8 = carousel->unk6E
	ldr r7, [sp]        @ r7 = sp00 = s1
	adds r7, #0x22      @ r7 = &s1->animSpeed
	ldr r6, _08085F28 @ =gPartner
	ldr r5, _08085F2C @ =gPlayer
_08085F12_loop:
	cmp r4, #0
	beq _08085F30
	ldr r0, [r6, #0x10]
	b _08085F32
	.align 2, 0
_08085F1C: .4byte gPlayer + 0x26
_08085F20: .4byte gNumSingleplayerCharacters
_08085F24: .4byte 0x003C2A57
_08085F28: .4byte gPartner
_08085F2C: .4byte gPlayer
_08085F30:
	ldr r0, [r5, #0x10]
_08085F32:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08085F8C
	ldr r1, [sp, #0x1c] @ r1 = sp1C = &carousel->unk79
	ldrb r0, [r1]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08085F8C
	mov r2, r8          @ r2 = r8 = carousel->unk6E
	ldrh r0, [r2]
	lsrs r0, r0, #2
	ldr r3, _08085F64 @ =0xFFFFF830
	adds r0, r0, r3
	lsls r0, r0, #1
	movs r1, #3
	bl Div
	cmp r4, #0
	beq _08085F68
	strh r0, [r6, #8]
	b _08085F6A
	.align 2, 0
_08085F64: .4byte 0xFFFFF830
_08085F68:
	strh r0, [r5, #8]
_08085F6A:
	mov r1, r8          @ r1 = r8 = carousel->unk6E
	ldrh r0, [r1]
	lsrs r0, r0, #2
	ldr r2, _08085F84 @ =0xFFFFF830
	adds r0, r0, r2
	lsls r0, r0, #1
	movs r1, #3
	bl Div
	cmp r4, #0
	beq _08085F88
	strh r0, [r6, #0xc]
	b _08085F8A
	.align 2, 0
_08085F84: .4byte 0xFFFFF830
_08085F88:
	strh r0, [r5, #0xc]
_08085F8A:
	ldr r2, _08085F98 @ =gNumSingleplayerCharacters
_08085F8C:
	adds r4, #1
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r4, r0
	blt _08085F12_loop
	b _08085FAC
	.align 2, 0
_08085F98: .4byte gNumSingleplayerCharacters
_08085F9C:
	mov r1, sb
	adds r1, #0x6e
	ldrh r0, [r1]
	adds r0, #0x40
	strh r0, [r1]
	mov r8, r1          @ r8 = carousel->unk6E
	ldr r7, [sp]        @ r7 = sp00 = s1
	adds r7, #0x22      @ r7 = &s1->animSpeed
_08085FAC:
	mov r3, r8          @ r3 = r8 = carousel->unk6E
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #8
	cmp r0, r1
	bls _08085FBA
	strh r1, [r3]
_08085FBA:
	mov r4, r8          @ r4 = r8 = carousel->unk6E
	ldrh r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	movs r1, #0xa0
	lsls r1, r1, #8
	bl Div
	strb r0, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _08085FDC
	movs r0, #0x10
	strb r0, [r7]
_08085FDC:
	mov r1, r8          @ r1 = r8 = carousel->unk6E
	ldrh r0, [r1]
	mov r2, sb
	ldr r1, [r2, #0x70]
	adds r1, r1, r0
	str r1, [r2, #0x70]
	ldr r3, [sp, #0x18] @ r3 = sp18 = worldX << 16
	asrs r2, r3, #0x10
	ldr r4, _0808605C @ =gCamera
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #0xb8
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08086020
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08086020
	ldr r1, [sp, #0xc]  @ r1 = sp0C = worldY
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r4, #0x90
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r3, r0
	bgt _08086020
	adds r0, r1, #0
	subs r0, #0x80
	cmp r3, r0
	bge _08086064
_08086020:
	ldr r1, [sp]        @ r1 = sp00 = s1
	ldrh r0, [r1, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08086048
	ldr r2, [sp]        @ r2 = sp00 = s1
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	adds r0, #0x80
	cmp r0, #0
	blt _08086048
	movs r4, #0x18
	ldrsh r1, [r2, r4]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08086064
_08086048:
	mov r1, sb
	ldrb r0, [r1, #8]
	ldr r2, [sp, #0x10] @ r2 = sp10 = me
	strb r0, [r2]
	ldr r0, _08086060 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0808640E
	.align 2, 0
_0808605C: .4byte gCamera
_08086060: .4byte gCurTask
_08086064:
	movs r5, #0
	movs r3, #0x74
	add r3, sb
	mov sl, r3      @ sl = &carousel->unk74
	ldr r4, _0808607C @ =gPartner
	ldr r6, _08086080 @ =gPlayer
	adds r7, r4, #0
	adds r7, #0x26
_08086074_loop:
	cmp r5, #0
	beq _08086084
	ldr r0, [r4, #0x10]
	b _08086086
	.align 2, 0
_0808607C: .4byte gPartner
_08086080: .4byte gPlayer
_08086084:
	ldr r0, [r6, #0x10]
_08086086:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08086090
	b _08086314
_08086090:
	ldr r1, [sp, #0x1c] @ r1 = sp1C = &carousel->unk79
	ldrb r0, [r1]
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080860A0
	b _08086314
_080860A0:
	mov r2, sb
	ldr r1, [r2, #0x70]
	ldr r0, _080860D4 @ =0x003C2A57
	cmp r1, r0
	bhi _080860AC
	b _0808637A_continue
_080860AC:
	adds r0, #1
	str r0, [r2, #0x70]
	adds r2, #0x76
	cmp r5, #0
	bne _080860BC
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_080860BC:
	ldrh r1, [r2]
	ldr r0, _080860D8 @ =0x0000012B
	cmp r1, r0
	bhi _080860E8
	cmp r5, #0
	beq _080860DC
	ldrh r0, [r4, #0x38]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080860E8
	b _0808637A_continue
	.align 2, 0
_080860D4: .4byte 0x003C2A57
_080860D8: .4byte 0x0000012B
_080860DC:
	ldrh r0, [r6, #0x38]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080860E8
	b _0808637A_continue
_080860E8:
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r2]
	cmp r5, #0
	beq _08086104
	ldrh r1, [r4, #0x38]
	movs r0, #0x20
	ands r1, r0
	ldr r2, _08086100 @ =gPlayer
	cmp r1, #0
	bne _08086110
	b _0808615C
	.align 2, 0
_08086100: .4byte gPlayer
_08086104:
	ldrh r1, [r6, #0x38]
	movs r0, #0x20
	ands r1, r0
	ldr r2, _08086120 @ =gPlayer
	cmp r1, #0
	beq _0808615C
_08086110:
	cmp r5, #0
	beq _08086124
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bgt _0808612C
	b _08086156
	.align 2, 0
_08086120: .4byte gPlayer
_08086124:
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	cmp r0, #0
	ble _08086156
_0808612C:
	cmp r5, #0
	beq _0808613A
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4, #0xc]
	b _08086142
_0808613A:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	rsbs r0, r0, #0
	strh r0, [r6, #0xc]
_08086142:
	cmp r5, #0
	beq _0808614C
_08086146:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	b _08086150
_0808614C:
	movs r1, #0xc
	ldrsh r0, [r2, r1]
_08086150:
	cmp r5, #0
	bne _080861C2
	b _080861C6
_08086156:
	cmp r5, #0
	bne _08086146
	b _0808614C
_0808615C:
	cmp r5, #0
	beq _0808616C
	ldrh r0, [r4, #0x38]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08086176
	b _08086198
_0808616C:
	ldrh r0, [r2, #0x38]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08086198
_08086176:
	cmp r5, #0
	beq _08086184
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0
	blt _080861A2
	b _08086156
_08086184:
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _08086156
	b _080861A2
_0808618E:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	strh r0, [r4, #0xc]
	b _08086156
_08086198:
	mov r0, sb
	adds r0, #0x78
	ldrb r0, [r0]
	cmp r0, #0
	bne _080861B0
_080861A2:
	cmp r5, #0
	bne _0808618E
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	rsbs r0, r0, #0
	strh r0, [r6, #0xc]
	b _08086156
_080861B0:
	cmp r5, #0
	beq _080861BA
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	b _080861BE
_080861BA:
	movs r1, #0xc
	ldrsh r0, [r2, r1]
_080861BE:
	cmp r5, #0
	beq _080861C6
_080861C2:
	strh r0, [r4, #8]
	b _080861C8
_080861C6:
	strh r0, [r2, #8]
_080861C8:
	movs r1, #1
	lsls r1, r5
	ldr r2, [sp, #0x1c] @ r2 = sp1C = &carousel->unk79
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	ldr r0, _080861F0 @ =gPlayer
	cmp r5, #0
	beq _080861DC
	ldr r0, _080861F4 @ =gPartner
_080861DC:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _080861FC
	ldr r0, [r4, #0x10]
	ldr r1, _080861F8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08086204
	.align 2, 0
_080861F0: .4byte gPlayer
_080861F4: .4byte gPartner
_080861F8: .4byte 0xFFBFFFFF
_080861FC:
	ldr r0, [r6, #0x10]
	ldr r1, _08086218 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08086204:
	ldr r2, _0808621C @ =gPlayer
	cmp r5, #0
	beq _08086220
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0808622A
	.align 2, 0
_08086218: .4byte 0xFFBFFFFF
_0808621C: .4byte gPlayer
_08086220:
	ldr r0, [r6, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_0808622A:
	cmp r5, #0
	beq _08086238
	ldr r0, [r4, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08086240
_08086238:
	ldr r0, [r6, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_08086240:
	cmp r5, #0
	beq _0808624E
	ldr r0, [r4, #0x10]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08086256
_0808624E:
	ldr r0, [r6, #0x10]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r6, #0x10]
_08086256:
	cmp r5, #0
	beq _08086264
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0808626C
_08086264:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_0808626C:
	cmp r5, #0
	beq _0808627C
	movs r0, #4
	ldr r3, _08086278 @ =gPartner + 0x40
	strb r0, [r3]
	b _08086284
	.align 2, 0
_08086278: .4byte gPartner + 0x40
_0808627C:
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #4
	strb r0, [r1]
_08086284:
	ldr r0, _080862B8 @ =gPlayer
	cmp r5, #0
	beq _0808628C
	ldr r0, _080862BC @ =gPartner
_0808628C:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _080862B8 @ =gPlayer
	cmp r5, #0
	beq _0808629A
	ldr r1, _080862BC @ =gPartner
_0808629A:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r2, _080862B8 @ =gPlayer
	adds r1, r2, #0
	cmp r5, #0
	beq _080862A8
	ldr r1, _080862BC @ =gPartner
_080862A8:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	cmp r5, #0
	beq _080862C0
	movs r0, #0
	strh r0, [r4, #0xa]
	b _080862C2
	.align 2, 0
_080862B8: .4byte gPlayer
_080862BC: .4byte gPartner
_080862C0:
	strh r5, [r2, #0xa]
_080862C2:
	ldr r1, [sp, #0x18] @ r1 = sp18 = worldX << 16
	asrs r0, r1, #8
	cmp r5, #0
	beq _080862CE
	str r0, [r4]
	b _080862D0
_080862CE:
	str r0, [r2]
_080862D0:
	ldr r0, _080862E8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080862EC @ =Task_ExitCarousel
	str r0, [r1, #8]
	cmp r5, #0
	beq _080862F0
	ldrb r1, [r7]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r7]
	b _080862FA
	.align 2, 0
_080862E8: .4byte gCurTask
_080862EC: .4byte Task_ExitCarousel
_080862F0:
	adds r2, #0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_080862FA:
	ldr r1, _0808630C @ =gPlayer + 0x64
	cmp r5, #0
	beq _08086302
	ldr r1, _08086310 @ =gPartner + 0x64
_08086302:
	ldr r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1, #0x26]
	b _0808637A_continue
	.align 2, 0
_0808630C: .4byte gPlayer + 0x64
_08086310: .4byte gPartner + 0x64
_08086314:
	cmp r5, #0
	beq _08086324
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0808632E
	b _0808637A_continue
_08086324:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0808637A_continue
_0808632E:
	mov r2, sb
	ldr r0, [r2, #0x70]
	ldr r1, _08086348 @ =0x003C2A58
	cmp r0, r1
	bls _0808633A
	str r1, [r2, #0x70]
_0808633A:
	cmp r5, #0
	beq _08086350
	ldr r0, [r4, #0x10]
	ldr r1, _0808634C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08086358
	.align 2, 0
_08086348: .4byte 0x003C2A58
_0808634C: .4byte 0xFFBFFFFF
_08086350:
	ldr r0, [r6, #0x10]
	ldr r1, _080863B4 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08086358:
	mov r2, sb
	adds r2, #0x76
	cmp r5, #0
	bne _08086366
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_08086366:
	ldrh r1, [r2]
	movs r3, #0x96
	lsls r3, r3, #0x11
	lsrs r0, r3, #0x10
	cmp r1, r0
	bls _0808637A_continue
	ldr r0, _080863B8 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080863BC @ =Task_ExitCarousel
	str r0, [r1, #8]
_0808637A_continue:
	adds r5, #1
	ldr r0, _080863C0 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bge _0808638A
	b _08086074_loop
_0808638A:
	mov r2, sl      @ r2 = sl = &carousel->unk74
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	mov r4, r8      @ r4 = r8 = carousel->unk6E
	ldrh r1, [r4]
	ldr r0, _080863C4 @ =0x000031FF
	cmp r1, r0
	bhi _080863C8
	cmp r1, #0
	beq _080863FC
	ldrh r0, [r2]
	movs r1, #0x19
	bl Mod
	cmp r0, #0
	bne _080863FC
	movs r0, #0xd1
	bl m4aSongNumStart
	b _080863FC
	.align 2, 0
_080863B4: .4byte 0xFFBFFFFF
_080863B8: .4byte gCurTask
_080863BC: .4byte Task_ExitCarousel
_080863C0: .4byte gNumSingleplayerCharacters
_080863C4: .4byte 0x000031FF
_080863C8:
	ldr r0, _080863E4 @ =0x00004AFF
	cmp r1, r0
	bhi _080863E8
	ldrh r0, [r2]
	movs r1, #0x10
	bl Mod
	cmp r0, #0
	bne _080863FC
	movs r0, #0xd2
	bl m4aSongNumStart
	b _080863FC
	.align 2, 0
_080863E4: .4byte 0x00004AFF
_080863E8:
	mov r1, sl      @ r1 = sl = &carousel->unk74
	ldrh r0, [r1]
	movs r1, #8
	bl Mod
	cmp r0, #0
	bne _080863FC
	movs r0, #0xd3
	bl m4aSongNumStart
_080863FC:
	ldr r0, [sp]        @ r0 = sp00 = s1
	bl UpdateSpriteAnimation
	ldr r0, [sp]        @ r0 = sp00 = s1
	bl DisplaySprite
	ldr r0, [sp, #4]    @ r0 = sp04 = s2
	bl DisplaySprite
_0808640E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
