.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, _080857CC @ =gCurTask
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r1, r0
	mov sb, r1          @ sb = carousel
	ldr r1, _080857D0 @ =0x0300000C
	adds r1, r0, r1
	str r1, [sp]        @ sp00 = s1
	ldr r2, _080857D4 @ =0x0300003C
	adds r2, r0, r2
	str r2, [sp, #4]    @ sp04 = s2
	mov r3, sb
	ldr r6, [r3]        @ r6 = me
	ldrb r2, [r3, #8]
	lsls r2, r2, #3
	ldrh r0, [r3, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10  @ r2 = worldX << 16
	ldrb r1, [r6, #1]
	lsls r1, r1, #3
	ldrh r0, [r3, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10  @ r1 = worldY << 16
	ldr r5, _080857D8 @ =gCamera
	ldrh r3, [r5]
	lsrs r7, r2, #0x10
	mov r8, r7  @ r8 = worldX
	asrs r2, r2, #0x10
	subs r3, r2, r3
	ldr r0, [sp]
	strh r3, [r0, #0x16] @ s->x = worldX - gCamera.x;
	ldrh r0, [r5, #2]
	lsrs r7, r1, #0x10
	str r7, [sp, #8]    @ sp08 = worldY
	asrs r1, r1, #0x10
	subs r0, r1, r0
	ldr r7, [sp]        @ r7 = sp00 = s1
	strh r0, [r7, #0x18] @ s->y = worldY - gCamera.y;
	ldr r0, [sp, #4]    @ r0 = sp04 = s2
	strh r3, [r0, #0x16]
	ldrh r0, [r7, #0x18]
	ldr r3, [sp, #4]    @ r0 = sp04 = s2
	strh r0, [r3, #0x18]
	movs r7, #0
	ldrsh r3, [r5, r7]
	movs r7, #0xb8
	lsls r7, r7, #1
	adds r0, r3, r7
	cmp r2, r0
	bgt _08085796
	adds r0, r3, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08085796
	movs r0, #2
	ldrsh r3, [r5, r0]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r0, r3, r2
	cmp r1, r0
	bgt _08085796
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bge _080857DC
_08085796:
	ldr r3, [sp]        @ r3 = sp00 = s1
	ldrh r0, [r3, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080857BC
	movs r7, #0x18
	ldrsh r0, [r3, r7]
	adds r0, #0x80
	cmp r0, #0
	blt _080857BC
	movs r0, #0x18
	ldrsh r1, [r3, r0]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _080857DC
_080857BC:
	mov r1, sb
	ldrb r0, [r1, #8]
	strb r0, [r6]
	ldr r0, [r4]
	bl TaskDestroy
	b _08085B94_return
	.align 2, 0
_080857CC: .4byte gCurTask
_080857D0: .4byte 0x0300000C
_080857D4: .4byte 0x0300003C
_080857D8: .4byte gCamera
_080857DC:
	movs r5, #0
	mov r2, r8
	lsls r2, r2, #0x10
	mov sl, r2          @ sl = worldX << 16
	ldr r6, _080857F4 @ =gPartner
	ldr r7, _080857F8 @ =gPlayer
_080857E8_loop:
	cmp r5, #0
	bne _080857F0
	cmp r5, #0
	beq _080857FC
_080857F0:
	ldr r0, [r6, #0x10]
	b _080857FE
	.align 2, 0
_080857F4: .4byte gPartner
_080857F8: .4byte gPlayer
_080857FC:
	ldr r0, [r7, #0x10]
_080857FE:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08085808
	b _08085B78_continue
_08085808:
	cmp r5, #0
	beq _08085824
	ldr r3, _0808581C @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #2
	beq _08085832
	ldr r3, _08085820 @ =gPlayer
	b _08085906
	.align 2, 0
_0808581C: .4byte gPartner + 0x59
_08085820: .4byte gPlayer
_08085824:
	ldr r1, _08085840 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r3, _08085844 @ =gPlayer
	cmp r0, #2
	beq _08085832
	b _08085906
_08085832:
	cmp r5, #0
	beq _0808584C
	ldr r2, _08085848 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r2, r0]
	b _08085852
	.align 2, 0
_08085840: .4byte gPlayer + 0x59
_08085844: .4byte gPlayer
_08085848: .4byte gPartner + 0x40
_0808584C:
	ldr r3, _08085864 @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r3, r0]
_08085852:
	cmp r0, #0x46
	bne _08085858
	b _08085B78_continue
_08085858:
	cmp r5, #0
	beq _0808586C
	ldr r1, _08085868 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _08085872
	.align 2, 0
_08085864: .4byte gPlayer + 0x40
_08085868: .4byte gPartner + 0x40
_0808586C:
	ldr r2, _08085884 @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r2, r0]
_08085872:
	cmp r0, #0x47
	bne _08085878
	b _08085B78_continue
_08085878:
	cmp r5, #0
	beq _0808588C
	ldr r3, _08085888 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r3, r0]
	b _08085892
	.align 2, 0
_08085884: .4byte gPlayer + 0x40
_08085888: .4byte gPartner + 0x40
_0808588C:
	ldr r1, _080858A4 @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r1, r0]
_08085892:
	cmp r0, #0x48
	bne _08085898
	b _08085B78_continue
_08085898:
	cmp r5, #0
	beq _080858AC
	ldr r2, _080858A8 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r2, r0]
	b _080858B2
	.align 2, 0
_080858A4: .4byte gPlayer + 0x40
_080858A8: .4byte gPartner + 0x40
_080858AC:
	ldr r3, _080858C4 @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r3, r0]
_080858B2:
	cmp r0, #0x49
	bne _080858B8
	b _08085B78_continue
_080858B8:
	cmp r5, #0
	beq _080858CC
	ldr r1, _080858C8 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _080858D2
	.align 2, 0
_080858C4: .4byte gPlayer + 0x40
_080858C8: .4byte gPartner + 0x40
_080858CC:
	ldr r2, _080858EC @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r2, r0]
_080858D2:
	cmp r0, #0x4a
	bne _080858D8
	b _08085B78_continue
_080858D8:
	cmp r5, #0
	beq _080858F8
	ldr r3, _080858F0 @ =gPartner + 0x40
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0x4b
	bne _080858E8
	b _08085B78_continue
_080858E8:
	ldr r3, _080858F4 @ =gPlayer
	b _08085906
	.align 2, 0
_080858EC: .4byte gPlayer + 0x40
_080858F0: .4byte gPartner + 0x40
_080858F4: .4byte gPlayer
_080858F8:
	ldr r1, _08085934 @ =gPlayer + 0x40
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r3, _08085938 @ =gPlayer
	cmp r0, #0x4b
	bne _08085906
	b _08085B78_continue
_08085906:
	mov r2, sl          @ r2 = sl = worldX << 16
	asrs r4, r2, #0x10  @ r4 = worldX
	ldr r1, [sp, #8]    @ r1 = sp08 = worldY
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10  @ r2 = worldY
	mov r8, r0          @ r8 = worldY << 16
	cmp r5, #0
	beq _08085918
	ldr r3, _0808593C @ =gPartner
_08085918:
	ldr r0, [sp]        @ r0 = sp00 = s1
	adds r1, r4, #0
	bl Coll_Player_PlatformCrumbling
	adds r1, r4, #0
	subs r1, #8
	cmp r5, #0
	beq _08085940
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	ble _0808594A
	b _08085B78_continue
	.align 2, 0
_08085934: .4byte gPlayer + 0x40
_08085938: .4byte gPlayer
_0808593C: .4byte gPartner
_08085940:
	ldr r0, [r7]
	asrs r0, r0, #8
	cmp r1, r0
	ble _0808594A
	b _08085B78_continue
_0808594A:
	mov r2, sl          @ r2 = sl = worldX << 16
	asrs r0, r2, #0x10
	adds r1, r0, #0
	adds r1, #8
	cmp r5, #0
	beq _08085960
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808596A
	b _08085B78_continue
_08085960:
	ldr r0, [r7]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808596A
	b _08085B78_continue
_0808596A:
	mov r3, r8          @ r3 = r8 = worldY << 16
	asrs r0, r3, #0x10
	adds r1, r0, #0
	subs r1, #0x30
	cmp r5, #0
	beq _08085980
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _0808598A
	b _08085B78_continue
_08085980:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _0808598A
	b _08085B78_continue
_0808598A:
	mov r1, r8          @ r1 = r8 = worldY << 16
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0xc
	cmp r5, #0
	beq _080859A0
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080859AA
	b _08085B78_continue
_080859A0:
	ldr r0, [r7, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _080859AA
	b _08085B78_continue
_080859AA:
	mov r2, sb          @ r2 = sb = carousel
	adds r2, #0x79
	movs r0, #1
	lsls r0, r5
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r5, #0
	beq _080859C6
	movs r2, #8
	ldrsh r0, [r6, r2]
	cmp r0, #0
	blt _080859CE
	b _080859DE
_080859C6:
	movs r3, #8
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _080859DE
_080859CE:
	cmp r5, #0
	beq _080859D8
	ldrh r0, [r6, #8]
	rsbs r0, r0, #0
	b _080859E8
_080859D8:
	ldrh r0, [r7, #8]
	rsbs r0, r0, #0
	b _080859E8
_080859DE:
	cmp r5, #0
	beq _080859E6
	ldrh r0, [r6, #8]
	b _080859E8
_080859E6:
	ldrh r0, [r7, #8]
_080859E8:
	lsls r0, r0, #2
	mov r1, sb          @ r1 = sb = carousel
	adds r1, #0x6e
	strh r0, [r1]
	mov r0, sl          @ r0 = sl = worldX << 16
	asrs r1, r0, #0x10
	cmp r5, #0
	beq _080859FC
	ldr r0, [r6]
	b _080859FE
_080859FC:
	ldr r0, [r7]
_080859FE:
	asrs r0, r0, #8
	subs r0, r0, r1
	adds r0, #0x30
	lsls r0, r0, #9
	movs r1, #0x60
	bl Div
	cmp r0, #0
	bge _08085A40
	mov r2, sl          @ r2 = sl = worldX << 16
	asrs r1, r2, #0x10
	cmp r5, #0
	beq _08085A1C
	ldr r0, [r6]
	b _08085A1E
_08085A1C:
	ldr r0, [r7]
_08085A1E:
	asrs r0, r0, #8
	subs r0, r0, r1
	adds r0, #0x30
	lsls r0, r0, #9
	movs r1, #0x60
	bl Div
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	ldr r2, _08085A3C @ =0x000003FF
	adds r0, r2, #0
	b _08085A66
	.align 2, 0
_08085A3C: .4byte 0x000003FF
_08085A40:
	mov r3, sl          @ r3 = sl = worldX << 16
	asrs r1, r3, #0x10
	cmp r5, #0
	beq _08085A4C
	ldr r0, [r6]
	b _08085A4E
_08085A4C:
	ldr r0, [r7]
_08085A4E:
	asrs r0, r0, #8
	subs r0, r0, r1
	adds r0, #0x30
	lsls r0, r0, #9
	movs r1, #0x60
	bl Div
	movs r1, #0xc0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r2, _08085A84 @ =0x000003FF
	adds r1, r2, #0
_08085A66:
	ands r1, r0
	mov r0, sb          @ r0 = sb = carousel
	adds r0, #0x6c
	movs r2, #0
	strh r1, [r0]
	mov r3, sb          @ r3 = sb = carousel
	str r2, [r3, #0x70]
	adds r0, #0xa
	strh r2, [r0]
	subs r0, #2
	strh r2, [r0]
	cmp r5, #0
	beq _08085A88
	strh r2, [r6, #8]
	b _08085A8A
	.align 2, 0
_08085A84: .4byte 0x000003FF
_08085A88:
	strh r5, [r7, #8]
_08085A8A:
	ldr r3, _08085A9C @ =gPlayer
	cmp r5, #0
	beq _08085AA0
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bgt _08085AA8
	b _08085AC2
	.align 2, 0
_08085A9C: .4byte gPlayer
_08085AA0:
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	cmp r0, #0
	ble _08085AC2
_08085AA8:
	mov r1, sb          @ r1 = sb = carousel
	adds r1, #0x78
	movs r0, #1
	strb r0, [r1]
	cmp r5, #0
	beq _08085ABC
	movs r0, #0xf0
	lsls r0, r0, #3
	strh r0, [r6, #0xc]
	b _08085ADC
_08085ABC:
	movs r0, #0xf0
	lsls r0, r0, #3
	b _08085ADA
_08085AC2:
	mov r0, sb          @ r0 = sb = carousel
	adds r0, #0x78
	movs r1, #0
	strb r1, [r0]
	cmp r5, #0
	beq _08085AD8
	ldr r0, _08085AD4 @ =0x0000F880
	strh r0, [r6, #0xc]
	b _08085ADC
	.align 2, 0
_08085AD4: .4byte 0x0000F880
_08085AD8:
	ldr r0, _08085AE8 @ =0x0000F880
_08085ADA:
	strh r0, [r3, #0xc]
_08085ADC:
	cmp r5, #0
	beq _08085AEC
	movs r2, #0
	strh r2, [r6, #0x38]
	b _08085AEE
	.align 2, 0
_08085AE8: .4byte 0x0000F880
_08085AEC:
	strh r5, [r3, #0x38]
_08085AEE:
	cmp r5, #0
	beq _08085AF8
	movs r0, #0
	strh r0, [r6, #0x3a]
	b _08085AFA
_08085AF8:
	strh r5, [r3, #0x3a]
_08085AFA:
	adds r0, r3, #0
	cmp r5, #0
	beq _08085B02
	ldr r0, _08085B14 @ =gPartner
_08085B02:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r5, #0
	beq _08085B1C
	movs r0, #0x21
	ldr r1, _08085B18 @ =gPartner + 0x40
	strb r0, [r1]
	b _08085B22
	.align 2, 0
_08085B14: .4byte gPartner
_08085B18: .4byte gPartner + 0x40
_08085B1C:
	movs r0, #0x21
	ldr r2, _08085B34 @ =gPlayer + 0x40
	strb r0, [r2]
_08085B22:
	cmp r5, #0
	beq _08085B38
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x10]
	b _08085B42
	.align 2, 0
_08085B34: .4byte gPlayer + 0x40
_08085B38:
	ldr r0, [r7, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r7, #0x10]
_08085B42:
	movs r0, #0xd1
	bl m4aSongNumStart
	ldr r0, _08085B60 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08085B64 @ =Task_RidingCarousel
	str r0, [r1, #8]
	cmp r5, #0
	beq _08085B6C
	ldr r3, _08085B68 @ =gPartner + 0x26
	ldrb r0, [r3]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	b _08085B78_continue
	.align 2, 0
_08085B60: .4byte gCurTask
_08085B64: .4byte Task_RidingCarousel
_08085B68: .4byte gPartner + 0x26
_08085B6C:
	ldr r1, _08085BA4 @ =gPlayer + 0x26
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	ldr r2, _08085BA4 @ =gPlayer + 0x26
	strb r0, [r2]
_08085B78_continue:
	adds r5, #1
	ldr r0, _08085BA8 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bge _08085B88
	b _080857E8_loop
_08085B88:
	ldr r0, [sp]        @ r0 = sp00 = s1
	bl DisplaySprite
	ldr r0, [sp, #4]    @ r0 = sp04 = s2
	bl DisplaySprite
_08085B94_return:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085BA4: .4byte gPlayer + 0x26
_08085BA8: .4byte gNumSingleplayerCharacters

.syntax divided
