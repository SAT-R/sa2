.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _08074010 @ =gCurTask
	ldr r0, [r0]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r3, r0     @ r6 = proj = s
	mov r8, r6          @ r8 = proj = s
	ldr r1, _08074014 @ =0x0300004B
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08073FAE
	ldrh r0, [r6, #0x32]
	adds r0, #0x3c
	strh r0, [r6, #0x32]
_08073FAE:
	movs r2, #0x30
	ldrsh r0, [r6, r2]
	ldr r1, [r6, #0x34]
	adds r1, r1, r0
	str r1, [r6, #0x34]
	movs r7, #0x32
	ldrsh r0, [r6, r7]
	ldr r2, [r6, #0x38]
	adds r2, r2, r0
	str r2, [r6, #0x38]
	ldr r0, [r6, #0x3c]
	asrs r1, r1, #8
	adds r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r6, #0x44]
	asrs r2, r2, #8
	adds r0, r0, r2
	strh r0, [r6, #0x18]
	ldrh r0, [r6, #0x16]
	mov sl, r0              @ sl = s->x
	ldrh r1, [r6, #0x18]
	str r1, [sp, #0xc]      @ sp0C = s->y
	ldr r5, _08074018 @ =gSineTable
	ldr r2, _0807401C @ =0x0300004A
	adds r4, r3, r2
	ldrb r0, [r4]           @ r0 = proj->unk4A
	ldr r7, _08074020 @ =0x000003FF
	mov sb, r7              @ sb = 0x3FF
	lsls r0, r0, #3
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, #0x17          @ r7 = 1000
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10      @ r1 = divRes
	cmp r1, #0
	bge _0807402C
	movs r2, #0x30
	ldrsh r0, [r6, r2]
	adds r0, r1, r0
	ldr r1, _08074024 @ =0x0000FFFE
	cmp r0, r1
	ble _0807402C
	ldr r0, _08074028 @ =0x0000FFFF
	strh r0, [r6, #0x30]
	b _08074048
	.align 2, 0
_08074010: .4byte gCurTask
_08074014: .4byte 0x0300004B
_08074018: .4byte gSineTable
_0807401C: .4byte 0x0300004A
_08074020: .4byte 0x000003FF
_08074024: .4byte 0x0000FFFE
_08074028: .4byte 0x0000FFFF
_0807402C:
	ldrb r0, [r4]
	lsls r0, r0, #2
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r1, r7, #0
	bl Div
	ldrh r1, [r6, #0x30]
	adds r1, r1, r0
	strh r1, [r6, #0x30]
_08074048:
	ldr r1, _080740AC @ =gSineTable
	mov r4, r8          @ r4 = r8 = proj
	adds r4, #0x4a
	ldrb r0, [r4]
	lsls r0, r0, #3
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r0, r7
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xfa
	lsls r1, r1, #2
	bl Div
	mov r2, r8          @ r2 = r8 = proj
	ldr r1, [r2, #0x38]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	mov r7, r8          @ r7 = r8 = proj
	adds r7, #0x48
	ldrh r0, [r7]
	str r4, [sp, #0x10] @ sp10 = &proj->unk4A
	cmp r0, #0
	beq _0807407E
	subs r0, #1
	strh r0, [r7]
_0807407E:
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r1, r5, #0x10
	mov sb, r1      @ sb = r1 = s->x
	ldr r2, [sp, #0xc]
	lsls r4, r2, #0x10
	asrs r0, r4, #0x10
	mov sl, r0      @ sl = s->y
	adds r0, r6, #0
	mov r2, sl
	bl Coll_Player_Projectile
	cmp r0, #0
	bne _080740A0
	ldrh r0, [r7]
	cmp r0, #0
	bne _080740B0
_080740A0:
	mov r0, sb
	mov r1, sl
	bl CreatePenMk1SnowballDebris
	b _080741BC_destroy_n_return
	.align 2, 0
_080740AC: .4byte gSineTable
_080740B0:
	ldr r2, _080740F0 @ =gCamera
	ldrh r0, [r6, #0x16]
	ldrh r1, [r2]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldrh r0, [r6, #0x18]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	add r1, sp, #8
	str r1, [sp]
	ldr r0, _080740F4 @ =sa2__sub_801EE64
	str r0, [sp, #4]
	mov r0, sl
	mov r1, sb
	movs r2, #1
	movs r3, #8
	bl sa2__sub_801F07C
	adds r3, r0, #0
	cmp r3, #0
	ble _080740F8
	mov r0, r8
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080740EC
	mov r7, r8
	strh r1, [r7, #0x32]
_080740EC:
	movs r0, #1
	b _0807411E
	.align 2, 0
_080740F0: .4byte gCamera
_080740F4: .4byte sa2__sub_801EE64
_080740F8:
	mov r0, r8
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _08074118
	movs r0, #0
	ldr r1, [sp, #0x10] @ r1 = sp10 = &proj->unk4A
	strb r0, [r1]
	mov r7, r8
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _080740A0
_08074118:
	cmp r3, #0
	bge _08074120
	movs r0, #0
_0807411E:
	strb r0, [r2]
_08074120:
	ldrb r2, [r2]
	cmp r2, #0
	bne _08074174
	cmp r3, #0
	bge _08074138
	lsls r1, r3, #8
	mov r7, r8
	ldr r0, [r7, #0x38]
	adds r0, r0, r1
	str r0, [r7, #0x38]
	strh r2, [r7, #0x32]
	b _08074144
_08074138:
	lsls r0, r3, #6
	mov r1, r8
	ldrh r1, [r1, #0x32]
	adds r0, r0, r1
	mov r2, r8
	strh r0, [r2, #0x32]
_08074144:
	add r1, sp, #8
	ldr r7, [sp, #0x10] @ r7 = sp10 = &proj->unk4A
	ldrb r0, [r7]
	ldrb r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0807415E
	rsbs r0, r0, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0807415E:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x3f
	ble _08074170
_08074166_debr_destroy_ret:
	asrs r0, r5, #0x10  @ oldWorldX
	asrs r1, r4, #0x10  @ oldWorldY
	bl CreatePenMk1SnowballDebris
	b _080741BC_destroy_n_return
_08074170:
	ldr r0, [sp, #0x10] @ r0 = sp10 = &proj->unk4A
	strb r1, [r0]
_08074174:
	adds r0, r3, #5
	cmp r0, #5
	bhi _08074198
	add r0, sp, #8
	ldrb r1, [r0]
	adds r0, r1, #0
	adds r0, #0x3f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1c
	bls _08074166_debr_destroy_ret
	adds r0, r1, #0
	adds r0, #0x5d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1c
	bhi _080741CC
	b _08074166_debr_destroy_ret
_08074198:
	ldrh r0, [r6, #0x16]
	adds r0, #0x3c
	lsls r0, r0, #0x10
	movs r1, #0xb4
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080741BC_destroy_n_return
	movs r1, #0x18
	ldrsh r0, [r6, r1]
	adds r0, #0x3c
	cmp r0, #0
	blt _080741BC_destroy_n_return
	movs r2, #0x18
	ldrsh r1, [r6, r2]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	ble _080741CC
_080741BC_destroy_n_return:
	ldr r0, _080741C8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _080741D8_return
	.align 2, 0
_080741C8: .4byte gCurTask
_080741CC:
	adds r0, r6, #0
	bl UpdateSpriteAnimation
	adds r0, r6, #0
	bl DisplaySprite
_080741D8_return:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

.syntax divided
