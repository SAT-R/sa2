.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _08088878 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	mov sb, r1          @ sb = r1 = rope
	ldr r0, [r1]        @ r0 = me
	str r0, [sp, #0xc]  @ sp0C = r0 = me
	ldrb r0, [r1, #8]
	lsls r0, r0, #3
	ldrh r1, [r1, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]    @ sp04 = worldX
	ldr r1, [sp, #0xc]
	ldrb r0, [r1, #1]
	lsls r0, r0, #3
	mov r2, sb      @ r2 = sb = rope
	ldrh r1, [r2, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]    @ sp08 = worldY
	movs r7, #0
	ldr r5, _0808887C @ =gPartner
	ldr r6, _08088880 @ =gPlayer
	movs r3, #0
	mov sl, r3
_08088870_loop:
	cmp r7, #0
	beq _08088884
	ldr r0, [r5, #0x10]
	b _08088886
	.align 2, 0
_08088878: .4byte gCurTask
_0808887C: .4byte gPartner
_08088880: .4byte gPlayer
_08088884:
	ldr r0, [r6, #0x10]
_08088886:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08088890
	b _08088F1C_p_is_dead
_08088890:
	mov r2, sb      @ r2 = sb = rope
	adds r2, #0x3c
	ldrb r1, [r2]
	asrs r1, r7
	movs r0, #1
	ands r1, r0
	str r2, [sp, #0x14] @ sp14 = rope->unk3C
	cmp r1, #0
	bne _080888A4
	b _08088CF8
_080888A4:
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x40
	mov r2, sl      @ r2 = sl = i*4
	adds r1, r0, r2
	ldr r2, [r1]
	adds r4, r0, #0 @ r4 = &rope->unk40
	cmp r2, #0xe7
	bgt _080888BA
	adds r0, r2, #0
	adds r0, #0x10
	str r0, [r1]
_080888BA:
	ldr r0, [r1]
	movs r2, #0x90
	lsls r2, r2, #4
	cmp r0, r2
	ble _080888C6
	str r2, [r1]
_080888C6:
	mov r2, sb      @ r2 = sb = rope
	adds r2, #0x48
	add r2, sl      @ r2 = sl = i*4
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [r2]
	ldr r3, [sp, #8]    @ r3 = sp08 = worldY
	lsls r1, r3, #0x10
	asrs r0, r1, #8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r0, r2
	str r1, [sp, #0x10] @ sp10 = worldY << 16
	cmp r7, #0
	beq _080888EA
	str r0, [r5, #4]
	b _080888EC
_080888EA:
	str r0, [r6, #4]
_080888EC:
	ldr r0, [sp, #4]    @ r0 = sp04 = worldX
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	ldr r0, [sp, #0xc]  @ r0 = sp0C = me
	movs r1, #3
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r2, r2, r0
	mov r8, r3
	adds r3, r1, #0
	cmp r7, #0
	beq _0808890E
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08088916
	b _080889FE
_0808890E:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r2, r0
	bgt _080889FE
_08088916:
	mov r2, r8
	asrs r1, r2, #0x10
	lsls r0, r3, #3
	adds r1, r1, r0
	ldr r3, [sp, #0xc]  @ r3 = sp0C = me
	ldrb r0, [r3, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	cmp r7, #0
	beq _08088934
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	bge _0808893C
	b _080889FE
_08088934:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	blt _080889FE
_0808893C:
	mov r1, sl      @ r1 = sl = i*4
	adds r0, r4, r1 @ r0 = &rope->unk40[i]
	ldr r1, [r0]
	cmp r7, #0
	beq _0808894E
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	b _08088954
_0808894E:
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
_08088954:
	cmp r7, #0
	beq _08088964
	ldrh r0, [r5, #0x38]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808896E
	b _08088978
_08088964:
	ldrh r0, [r6, #0x38]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08088978
_0808896E:
	mov r2, sl      @ r2 = sl = i*4
	adds r1, r4, r2 @ r1 = &rope->unk40[i]
	ldr r0, [r1]
	adds r0, #0x10
	b _0808899E
_08088978:
	cmp r7, #0
	beq _08088988
	ldrh r0, [r5, #0x38]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08088992
	b _080889A0
_08088988:
	ldrh r0, [r6, #0x38]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080889A0
_08088992:
	mov r3, sl      @ r3 = sl = i*4
	adds r1, r4, r3 @ r1 = &rope->unk40[i]
	ldr r0, [r1]
	cmp r0, #0xe8
	ble _080889A0
	subs r0, #0x10
_0808899E:
	str r0, [r1]
_080889A0:
	cmp r7, #0
	beq _080889A8
	ldr r0, [r5]
	b _080889AA
_080889A8:
	ldr r0, [r6]
_080889AA:
	asrs r0, r0, #8
	adds r3, r0, #0
	subs r3, #8
	cmp r7, #0
	beq _080889B8
	ldr r0, [r5, #4]
	b _080889BA
_080889B8:
	ldr r0, [r6, #4]
_080889BA:
	asrs r1, r0, #8
	cmp r7, #0
	beq _080889C8
	ldr r0, _080889C4 @ =gPartner + 0x27
	b _080889CA
	.align 2, 0
_080889C4: .4byte gPartner + 0x27
_080889C8:
	ldr r0, _080889F0 @ =gPlayer + 0x27
_080889CA:
	ldrb r2, [r0]
	ldr r0, _080889F4 @ =sa2__sub_801EB44
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #8
	rsbs r3, r3, #0
	bl sa2__sub_801F100
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _080889FE
	lsls r1, r0, #8
	cmp r7, #0
	beq _080889F8
	ldr r0, [r5]
	subs r0, r0, r1
	str r0, [r5]
	b _080889FE
	.align 2, 0
_080889F0: .4byte gPlayer + 0x27
_080889F4: .4byte sa2__sub_801EB44
_080889F8:
	ldr r0, [r6]
	subs r0, r0, r1
	str r0, [r6]
_080889FE:
	cmp r7, #0
	beq _08088A08
	movs r1, #0
	strh r1, [r5, #0xa]
	b _08088A0A
_08088A08:
	strh r7, [r6, #0xa]
_08088A0A:
	ldr r0, _08088A1C @ =gPlayerControls
	ldrh r1, [r0]
	cmp r7, #0
	beq _08088A20
	ldrh r0, [r5, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _08088A2A
	b _08088CD6
	.align 2, 0
_08088A1C: .4byte gPlayerControls
_08088A20:
	ldrh r0, [r6, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _08088A2A
	b _08088CD6
_08088A2A:
	mov r2, sl      @ r2 = sl = i*4
	adds r0, r4, r2 @ r0 = &rope->unk40[i]
	ldr r0, [r0]
	cmp r0, #0
	bge _08088A5A
	mov r3, r8
	asrs r1, r3, #0x10
	ldr r2, [sp, #0xc]  @ r2 = sp0C = me
	movs r0, #3
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, #2
	lsls r1, r1, #8
	cmp r7, #0
	beq _08088A4E
	str r1, [r5]
	b _08088A50
_08088A4E:
	str r1, [r6]
_08088A50:
	mov r3, sl      @ r3 = sl = i*4
	adds r0, r4, r3 @ r0 = &rope->unk40[i]
	movs r1, #0
	str r1, [r0]
	b _08088FC6
_08088A5A:
	ldr r0, _08088A74 @ =gPlayer
	cmp r7, #0
	beq _08088A62
	ldr r0, _08088A78 @ =gPartner
_08088A62:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r7, #0
	beq _08088A80
	ldr r0, [r5, #0x10]
	ldr r1, _08088A7C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088A88
	.align 2, 0
_08088A74: .4byte gPlayer
_08088A78: .4byte gPartner
_08088A7C: .4byte 0xFFDFFFFF
_08088A80:
	ldr r0, [r6, #0x10]
	ldr r1, _08088A9C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088A88:
	ldr r0, _08088AA0 @ =gPlayerControls
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	orrs r1, r0
	cmp r7, #0
	beq _08088AA4
	ldrh r0, [r5, #0x38]
	orrs r1, r0
	strh r1, [r5, #0x38]
	b _08088AAA
	.align 2, 0
_08088A9C: .4byte 0xFFDFFFFF
_08088AA0: .4byte gPlayerControls
_08088AA4:
	ldrh r0, [r6, #0x38]
	orrs r1, r0
	strh r1, [r6, #0x38]
_08088AAA:
	cmp r7, #0
	beq _08088ABC
	ldr r0, [r5, #0x10]
	ldr r1, _08088AB8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088AC4
	.align 2, 0
_08088AB8: .4byte 0xFFBFFFFF
_08088ABC:
	ldr r0, [r6, #0x10]
	ldr r1, _08088AD4 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088AC4:
	cmp r7, #0
	beq _08088AD8
	ldr r0, [r5, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08088AE0
	.align 2, 0
_08088AD4: .4byte 0xFFBFFFFF
_08088AD8:
	ldr r0, [r6, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r6, #0x10]
_08088AE0:
	cmp r7, #0
	beq _08088AEE
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08088AF6
_08088AEE:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_08088AF6:
	cmp r7, #0
	beq _08088B06
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088B10
_08088B06:
	ldr r0, [r6, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08088B10:
	cmp r7, #0
	beq _08088B24
	ldr r0, [r5, #0x10]
	ldr r1, _08088B20 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088B2C
	.align 2, 0
_08088B20: .4byte 0xFFFFFEFF
_08088B24:
	ldr r0, [r6, #0x10]
	ldr r1, _08088B3C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088B2C:
	cmp r7, #0
	beq _08088B44
	ldr r2, _08088B40 @ =gPartner + 0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	b _08088B4E
	.align 2, 0
_08088B3C: .4byte 0xFFFFFEFF
_08088B40: .4byte gPartner + 0x26
_08088B44:
	ldr r3, _08088B60 @ =gPlayer + 0x26
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
_08088B4E:
	cmp r7, #0
	beq _08088B64
	ldrh r0, [r5, #0x38]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08088B6E
	b _08088BC4
	.align 2, 0
_08088B60: .4byte gPlayer + 0x26
_08088B64:
	ldrh r0, [r6, #0x38]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08088BC4
_08088B6E:
	cmp r7, #0
	beq _08088B84
	ldrh r1, [r5, #0x38]
	movs r0, #0x40
	ands r1, r0
	ldr r3, _08088B80 @ =gPlayer
	cmp r1, #0
	bne _08088B90
	b _08088BB0
	.align 2, 0
_08088B80: .4byte gPlayer
_08088B84:
	ldrh r1, [r6, #0x38]
	movs r0, #0x40
	ands r1, r0
	ldr r3, _08088B9C @ =gPlayer
	cmp r1, #0
	beq _08088BB0
_08088B90:
	cmp r7, #0
	beq _08088BA4
	ldr r0, _08088BA0 @ =0x0000F940
	strh r0, [r5, #0xa]
	b _08088BFE
	.align 2, 0
_08088B9C: .4byte gPlayer
_08088BA0: .4byte 0x0000F940
_08088BA4:
	ldr r0, _08088BAC @ =0x0000F940
	strh r0, [r3, #0xa]
	b _08088BFE
	.align 2, 0
_08088BAC: .4byte 0x0000F940
_08088BB0:
	cmp r7, #0
	beq _08088BBC
	movs r0, #0xd8
	lsls r0, r0, #3
	strh r0, [r5, #0xa]
	b _08088BFE
_08088BBC:
	movs r0, #0xd8
	lsls r0, r0, #3
	strh r0, [r3, #0xa]
	b _08088BFE
_08088BC4:
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x50
	add r0, sl      @ r0 += sl = i*4
	ldr r0, [r0]
	movs r1, #0xf
	bl Div
	cmp r0, #0
	beq _08088BE8
	cmp r7, #0
	beq _08088BE2
	movs r0, #0xd8
	lsls r0, r0, #3
	strh r0, [r5, #0xa]
	b _08088BFC
_08088BE2:
	movs r0, #0xd8
	lsls r0, r0, #3
	b _08088BFA
_08088BE8:
	cmp r7, #0
	beq _08088BF8
	ldr r0, _08088BF4 @ =0x0000F940
	strh r0, [r5, #0xa]
	b _08088BFC
	.align 2, 0
_08088BF4: .4byte 0x0000F940
_08088BF8:
	ldr r0, _08088C08 @ =0x0000F940
_08088BFA:
	strh r0, [r6, #0xa]
_08088BFC:
	ldr r3, _08088C0C @ =gPlayer
_08088BFE:
	cmp r7, #0
	beq _08088C14
	movs r0, #5
	ldr r1, _08088C10 @ =gPartner + 0x40
	b _08088C1A
	.align 2, 0
_08088C08: .4byte 0x0000F940
_08088C0C: .4byte gPlayer
_08088C10: .4byte gPartner + 0x40
_08088C14:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #5
_08088C1A:
	strb r0, [r1]
	ldr r0, _08088C58 @ =gPlayer
	cmp r7, #0
	beq _08088C24
	ldr r0, _08088C5C @ =gPartner
_08088C24:
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08088C58 @ =gPlayer
	cmp r7, #0
	beq _08088C32
	ldr r1, _08088C5C @ =gPartner
_08088C32:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r3, _08088C58 @ =gPlayer
	adds r1, r3, #0
	cmp r7, #0
	beq _08088C40
	ldr r1, _08088C5C @ =gPartner
_08088C40:
	movs r0, #9
	strb r0, [r1, #0xf]
	ldr r2, [sp, #0x10] @ r2 = sp10 = worldY << 16
	asrs r0, r2, #8
	movs r1, #0x90
	lsls r1, r1, #4
	adds r0, r0, r1
	cmp r7, #0
	beq _08088C60
	str r0, [r5, #4]
	b _08088C62
	.align 2, 0
_08088C58: .4byte gPlayer
_08088C5C: .4byte gPartner
_08088C60:
	str r0, [r3, #4]
_08088C62:
	cmp r7, #0
	beq _08088C6C
	movs r2, #0
	strh r2, [r5, #0xc]
	b _08088C6E
_08088C6C:
	strh r7, [r3, #0xc]
_08088C6E:
	cmp r7, #0
	beq _08088C78
	movs r3, #0
	strh r3, [r5, #8]
	b _08088C7A
_08088C78:
	strh r7, [r3, #8]
_08088C7A:
	movs r1, #1
	lsls r1, r7
	ldr r2, [sp, #0x14] @ r2 = sp14 = rope->unk3C
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x50
	add r0, sl      @ r0 += sl = i*4
	movs r3, #0
	str r3, [r0]
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x3d
	adds r0, r0, r7
	movs r1, #0x14
	strb r1, [r0]
	ldr r3, _08088CEC @ =gPlayer + 0x64
	adds r0, r3, #0
	cmp r7, #0
	beq _08088CA4
	ldr r0, _08088CF0 @ =gPartner + 0x64
_08088CA4:
	ldr r2, [r0]
	adds r0, r3, #0
	cmp r7, #0
	beq _08088CAE
	ldr r0, _08088CF0 @ =gPartner + 0x64
_08088CAE:
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	ldr r1, _08088CF4 @ =0xFFFFCFFF
	ands r0, r1
	str r0, [r2, #0x1c]
	adds r0, r3, #0
	cmp r7, #0
	beq _08088CC0
	ldr r0, _08088CF0 @ =gPartner + 0x64
_08088CC0:
	ldr r2, [r0]
	adds r0, r3, #0
	cmp r7, #0
	beq _08088CCA
	ldr r0, _08088CF0 @ =gPartner + 0x64
_08088CCA:
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r2, #0x1c]
_08088CD6:
	mov r4, sb      @ r4 = sb = rope
	adds r4, #0x50
	add r4, sl      @ r4 += sl = i*4
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	movs r1, #0x1e
	bl Mod
	str r0, [r4]
	b _08088F54_continue
	.align 2, 0
_08088CEC: .4byte gPlayer + 0x64
_08088CF0: .4byte gPartner + 0x64
_08088CF4: .4byte 0xFFFFCFFF
_08088CF8:
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x3d
	adds r1, r0, r7
	ldrb r0, [r1]
	cmp r0, #0
	beq _08088D0A
	subs r0, #1
	strb r0, [r1]
	b _08088F54_continue
_08088D0A:
	ldr r0, [sp, #4]    @ r0 = sp04 = worldX
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10  @ r2 = worldX
	ldr r0, [sp, #0xc]  @ r0 = sp0C = me
	movs r1, #3
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r2, r2, r0
	mov r8, r3          @ r8 = r3 = worldX << 16
	adds r3, r1, #0
	cmp r7, #0
	beq _08088D2C
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08088D36
	b _08088F54_continue
_08088D2C:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08088D36
	b _08088F54_continue
_08088D36:
	mov r2, r8          @ r2 = r8 = worldX << 16
	asrs r1, r2, #0x10
	lsls r0, r3, #3
	adds r1, r1, r0
	ldr r3, [sp, #0xc]  @ r3 = sp0C = me
	ldrb r0, [r3, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	cmp r7, #0
	beq _08088D54
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08088D5E
	b _08088F54_continue
_08088D54:
	ldr r0, [r6]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08088D5E
	b _08088F54_continue
_08088D5E:
	ldr r0, [sp, #8]    @ r0 = sp08 = worldY
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10
	ldr r0, [sp, #0xc]  @ r0 = sp0C = me
	movs r1, #4
	ldrsb r1, [r0, r1]
	lsls r0, r1, #3
	adds r2, r2, r0
	str r3, [sp, #0x10] @ sp10 = worldY << 16
	adds r3, r1, #0
	cmp r7, #0
	beq _08088D80
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08088D8A
	b _08088F54_continue
_08088D80:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08088D8A
	b _08088F54_continue
_08088D8A:
	ldr r2, [sp, #0x10] @ r2 = sp10 = worldY << 16
	asrs r1, r2, #0x10
	lsls r0, r3, #3
	adds r1, r1, r0
	ldr r3, [sp, #0xc]  @ r3 = sp0C = me
	ldrb r0, [r3, #6]
	lsls r0, r0, #3
	adds r1, r1, r0
	cmp r7, #0
	beq _08088DA8
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08088DB2
	b _08088F54_continue
_08088DA8:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08088DB2
	b _08088F54_continue
_08088DB2:
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x40
	mov r2, sl      @ r2 = sl = i*4
	adds r1, r0, r2 @ r1 = &rope->unk40[i]
	adds r4, r0, #0 @ r4 = rope->unk40
	cmp r7, #0
	beq _08088DC6
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	b _08088DCA
_08088DC6:
	movs r2, #0xc
	ldrsh r0, [r6, r2]
_08088DCA:
	asrs r0, r0, #1
	str r0, [r1]
	ldr r3, _08088DF0 @ r3 = gPlayer
	mov r0, sl      @ r0 = sl = i*4
	adds r1, r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bge _08088DDE
	movs r2, #0
	str r2, [r1]
_08088DDE:
	mov r0, r8      @ r0 = r8 = worldX << 16
	asrs r1, r0, #8 @ r1 = Q(worldX)
	cmp r7, #0
	beq _08088DF4
	ldr r0, [r5]
	cmp r0, r1
	bgt _08088DFA
	b _08088E16
	.align 2, 0
_08088DF0: .4byte gPlayer
_08088DF4:
	ldr r0, [r3]
	cmp r0, r1
	ble _08088E16
_08088DFA:
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x48
	mov r1, sl      @ r1 = sl = i*4
	adds r2, r0, r1 @ r2 = &rope->unk48[i]
	mov r0, r8
	asrs r1, r0, #8
	cmp r7, #0
	beq _08088E10
	ldr r0, [r5]
	subs r0, r0, r1
	b _08088E2E
_08088E10:
	ldr r0, [r3]
	subs r0, r0, r1
	b _08088E2E
_08088E16:
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x48
	mov r1, sl      @ r1 = sl = i*4
	adds r2, r0, r1
	mov r0, r8
	asrs r1, r0, #8
	cmp r7, #0
	beq _08088E2A
	ldr r0, [r5]
	b _08088E2C
_08088E2A:
	ldr r0, [r3]
_08088E2C:
	subs r0, r1, r0
_08088E2E:
	str r0, [r2]
	ldr r0, _08088E4C @ =gPlayer
	cmp r7, #0
	beq _08088E38
	ldr r0, _08088E50 @ =gPartner
_08088E38:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r7, #0
	beq _08088E54
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08088E5E
	.align 2, 0
_08088E4C: .4byte gPlayer
_08088E50: .4byte gPartner
_08088E54:
	ldr r0, [r6, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r6, #0x10]
_08088E5E:
	ldr r3, _08088E70 @ =gPlayer
	cmp r7, #0
	beq _08088E74
	ldr r0, [r5, #0x10]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088E7E
	.align 2, 0
_08088E70: .4byte gPlayer
_08088E74:
	ldr r0, [r6, #0x10]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08088E7E:
	cmp r7, #0
	beq _08088E90
	ldr r0, [r5, #0x10]
	ldr r1, _08088E8C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088E98
	.align 2, 0
_08088E8C: .4byte 0xFFFFFEFF
_08088E90:
	ldr r0, [r6, #0x10]
	ldr r1, _08088EB0 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088E98:
	movs r0, #1
	lsls r0, r7
	ldr r2, [sp, #0x14] @ r2 = sp14 = rope->unk3C
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r7, #0
	beq _08088EB8
	movs r0, #0x22
	ldr r3, _08088EB4 @ =gPartner + 0x40
	strb r0, [r3]
	b _08088EC0
	.align 2, 0
_08088EB0: .4byte 0xFFFFFEFF
_08088EB4: .4byte gPartner + 0x40
_08088EB8:
	adds r1, r3, #0
	adds r1, #0x40
	movs r0, #0x22
	strb r0, [r1]
_08088EC0:
	ldr r0, _08088F00 @ =gPlayer
	cmp r7, #0
	beq _08088EC8
	ldr r0, _08088F04 @ =gPartner
_08088EC8:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08088F00 @ =gPlayer
	cmp r7, #0
	beq _08088ED6
	ldr r1, _08088F04 @ =gPartner
_08088ED6:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08088F00 @ =gPlayer
	cmp r7, #0
	beq _08088EE2
	ldr r1, _08088F04 @ =gPartner
_08088EE2:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	mov r0, sb      @ r0 = sb = rope
	adds r0, #0x50
	add r0, sl      @ r0 += sl = i*4
	movs r1, #0
	str r1, [r0]
	cmp r7, #0
	beq _08088F0C
	ldr r2, _08088F08 @ =gPartner + 0x26
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	b _08088F52
	.align 2, 0
_08088F00: .4byte gPlayer
_08088F04: .4byte gPartner
_08088F08: .4byte gPartner + 0x26
_08088F0C:
	ldr r3, _08088F18 @ =gPlayer + 0x26
	ldrb r0, [r3]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	b _08088F54_continue
	.align 2, 0
_08088F18: .4byte gPlayer + 0x26
_08088F1C_p_is_dead:
	mov r2, sb          @ r2 = sb = rope
	adds r2, #0x3c
	ldrb r1, [r2]
	asrs r1, r7
	movs r0, #1
	ands r1, r0
	str r2, [sp, #0x14] @ sp14 = rope->unk3C
	cmp r1, #0
	beq _08088F54_continue
	cmp r7, #0
	beq _08088F40
	ldr r0, [r5, #0x10]
	ldr r1, _08088F3C @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _08088F48
	.align 2, 0
_08088F3C: .4byte 0xFFBFFFFF
_08088F40:
	ldr r0, [r6, #0x10]
	ldr r1, _08088FD8 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r6, #0x10]
_08088F48:
	movs r1, #1
	lsls r1, r7
	ldr r2, [sp, #0x14] @ r2 = sp14 = rope->unk3C
	ldrb r0, [r2]
	bics r0, r1
_08088F52:
	strb r0, [r2]
_08088F54_continue:
	movs r3, #4
	add sl, r3      @ sl += 4
	adds r7, #1
	ldr r0, _08088FDC @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r7, r0
	bge _08088F68
	b _08088870_loop
_08088F68:
	ldr r0, [sp, #0x14] @ r0 = sp14 = rope->unk3C
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08088FC6
	ldr r2, _08088FE0 @ =gCamera
	ldrh r0, [r2]
	ldr r3, [sp, #4]    @ r3 = sp04 = worldX
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	ldrh r2, [r2, #2]
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08088FB6
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08088FB6
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08088FC6
_08088FB6:
	mov r2, sb      @ r2 = sb = rope
	ldrb r0, [r2, #8]
	ldr r3, [sp, #0xc]  @ r3 = sp0C = me
	strb r0, [r3]
	ldr r0, _08088FE4 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08088FC6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088FD8: .4byte 0xFFBFFFFF
_08088FDC: .4byte gNumSingleplayerCharacters
_08088FE0: .4byte gCamera
_08088FE4: .4byte gCurTask

.syntax divided
