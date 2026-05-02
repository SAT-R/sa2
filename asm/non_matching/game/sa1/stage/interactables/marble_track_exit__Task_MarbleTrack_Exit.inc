.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _0808387C @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r4, r0     @ r7 = exit
	adds r0, #0xc
	adds r0, r4, r0
	str r0, [sp, #0x10] @ sp10 = s
	ldr r1, [r7]
	str r1, [sp, #0x14] @ sp14 = me
	ldrb r2, [r7, #8]
	lsls r2, r2, #3
	ldrh r0, [r7, #4]
	lsls r0, r0, #8
	adds r2, r2, r0
	lsls r2, r2, #0x10
	ldrb r1, [r1, #1]
	lsls r1, r1, #3
	ldrh r0, [r7, #6]
	lsls r0, r0, #8
	adds r1, r1, r0
	lsls r1, r1, #0x10
	ldr r3, _08083880 @ =gCamera
	ldrh r0, [r3]
	lsrs r5, r2, #0x10
	str r5, [sp]        @ sp00 = worldX
	asrs r2, r2, #0x10
	subs r2, r2, r0
	lsls r0, r2, #0x10
	lsrs r5, r0, #0x10  @ r5 = screenX
	ldrh r0, [r3, #2]
	lsrs r6, r1, #0x10
	str r6, [sp, #4]    @ sp04 = worldY
	asrs r1, r1, #0x10
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]    @ sp08 = screenY
	ldr r0, [sp, #0x10]
	strh r2, [r0, #0x16]    @ s->x = screenX;
	ldrh r0, [r3, #2]
	subs r1, r1, r0
	ldr r2, [sp, #0x10]
	strh r1, [r2, #0x18]    @ s->y = screenY;
	ldr r3, _08083884 @ =0x03000041
	adds r4, r4, r3
	ldrb r0, [r4]
	movs r6, #0
	str r6, [sp, #0xc]
	cmp r0, #0
	beq _08083868
	ldr r0, _08083888 @ =0x0000FFE8
	str r0, [sp, #0xc]
_08083868:
	movs r6, #0
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	ldr r4, _0808388C @ =gPartner
	ldr r5, _08083890 @ =gPlayer
	mov sl, r6      @ sl = i * 4
_08083874_loop:
	cmp r6, #0
	beq _08083894
	ldr r0, [r4, #0x10]
	b _08083896
	.align 2, 0
_0808387C: .4byte gCurTask
_08083880: .4byte gCamera
_08083884: .4byte 0x03000041
_08083888: .4byte 0x0000FFE8
_0808388C: .4byte gPartner
_08083890: .4byte gPlayer
_08083894:
	ldr r0, [r5, #0x10]
_08083896:
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080838A0
	b _08083D6A_continue
_080838A0:
	adds r2, r7, #0
	adds r2, #0x40
	ldrb r1, [r2]
	asrs r1, r6
	movs r0, #1
	ands r1, r0
	mov r8, r2      @ r8 = r2 = &exit->unk40
	cmp r1, #0
	bne _080838B4
	b _08083ADC
_080838B4:
	cmp r6, #0
	beq _080838C0
	ldrh r0, [r4, #0xa]
	adds r0, #0x2a
	strh r0, [r4, #0xa]
	b _080838C6
_080838C0:
	ldrh r0, [r5, #0xa]
	adds r0, #0x2a
	strh r0, [r5, #0xa]
_080838C6:
	adds r0, r7, #0
	adds r0, #0x4c
	mov r2, sl      @ r2 = sl = i * 4
	adds r1, r0, r2
	ldr r2, [r1]    @ r2 = exit->unk4C[i]
	mov sb, r0
	cmp r6, #0
	beq _080838DC
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	b _080838E0
_080838DC:
	movs r3, #0xa
	ldrsh r0, [r5, r3]
_080838E0:
	adds r0, r2, r0
	str r0, [r1]
	mov r0, sb
	add r0, sl      @ r0 = &exit->unk4C[i]
	ldr r0, [r0]
	cmp r6, #0
	beq _080838F2
	str r0, [r4, #4]
	b _080838F4
_080838F2:
	str r0, [r5, #4]
_080838F4:
	adds r0, r7, #0
	adds r0, #0x44
	add r0, sl
	ldr r0, [r0]
	cmp r6, #0
	beq _08083904
	str r0, [r4]
	b _08083906
_08083904:
	str r0, [r5]
_08083906:
	cmp r6, #0
	beq _08083918
	ldr r1, _08083914 @ =gPartner + 0x54
	ldrh r0, [r1]
	subs r0, #4
	strh r0, [r1]
	b _08083920
	.align 2, 0
_08083914: .4byte gPartner + 0x54
_08083918:
	ldr r2, _08083930 @ =gPlayer + 0x54
	ldrh r0, [r2]
	subs r0, #4
	strh r0, [r2]
_08083920:
	cmp r6, #0
	beq _08083938
	ldr r3, _08083934 @ =gPartner + 0x54
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #0xaf
	ble _08083942
	b _0808395E
	.align 2, 0
_08083930: .4byte gPlayer + 0x54
_08083934: .4byte gPartner + 0x54
_08083938:
	ldr r2, _08083950 @ =gPlayer + 0x54
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xaf
	bgt _0808395E
_08083942:
	cmp r6, #0
	beq _08083958
	movs r0, #0xb0
	ldr r1, _08083954 @ =gPartner + 0x54
	strh r0, [r1]
	b _0808395E
	.align 2, 0
_08083950: .4byte gPlayer + 0x54
_08083954: .4byte gPartner + 0x54
_08083958:
	movs r0, #0xb0
	ldr r2, _0808396C @ =gPlayer + 0x54
	strh r0, [r2]
_0808395E:
	cmp r6, #0
	beq _08083974
	ldr r3, _08083970 @ =gPartner + 0x54
	movs r1, #0
	ldrsh r0, [r3, r1]
	b _0808397A
	.align 2, 0
_0808396C: .4byte gPlayer + 0x54
_08083970: .4byte gPartner + 0x54
_08083974:
	ldr r2, _08083984 @ =gPlayer + 0x54
	movs r3, #0
	ldrsh r0, [r2, r3]
_0808397A:
	cmp r6, #0
	beq _0808398C
	ldr r1, _08083988 @ =gPartner + 0x56
	strh r0, [r1]
	b _08083990
	.align 2, 0
_08083984: .4byte gPlayer + 0x54
_08083988: .4byte gPartner + 0x56
_0808398C:
	ldr r2, _080839A0 @ =gPlayer + 0x56
	strh r0, [r2]
_08083990:
	cmp r6, #0
	beq _080839A4
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x10]
	b _080839AE
	.align 2, 0
_080839A0: .4byte gPlayer + 0x56
_080839A4:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x10]
_080839AE:
	cmp r6, #0
	beq _080839BE
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	b _080839C8
_080839BE:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x10]
_080839C8:
	cmp r6, #0
	beq _080839D6
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	cmp r0, #0
	bgt _080839E0
	b _08083D6A_continue
_080839D6:
	movs r1, #0xa
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _080839E0
	b _08083D6A_continue
_080839E0:
	ldr r0, _080839F8 @ =gPlayer
	cmp r6, #0
	beq _080839E8
	ldr r0, _080839FC @ =gPartner
_080839E8:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _08083A04
	movs r0, #5
	ldr r2, _08083A00 @ =gPartner + 0x40
	strb r0, [r2]
	b _08083A0A
	.align 2, 0
_080839F8: .4byte gPlayer
_080839FC: .4byte gPartner
_08083A00: .4byte gPartner + 0x40
_08083A04:
	movs r0, #5
	ldr r3, _08083A18 @ =gPlayer + 0x40
	strb r0, [r3]
_08083A0A:
	cmp r6, #0
	beq _08083A20
	ldr r0, [r4, #0x10]
	ldr r1, _08083A1C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08083A28
	.align 2, 0
_08083A18: .4byte gPlayer + 0x40
_08083A1C: .4byte 0xFFDFFFFF
_08083A20:
	ldr r0, [r5, #0x10]
	ldr r1, _08083A3C @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
_08083A28:
	ldr r0, _08083A40 @ =gPlayerControls
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	orrs r1, r0
	cmp r6, #0
	beq _08083A44
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	strh r1, [r4, #0x38]
	b _08083A4A
	.align 2, 0
_08083A3C: .4byte 0xFFDFFFFF
_08083A40: .4byte gPlayerControls
_08083A44:
	ldrh r0, [r5, #0x38]
	orrs r1, r0
	strh r1, [r5, #0x38]
_08083A4A:
	cmp r6, #0
	beq _08083A5C
	ldr r0, [r4, #0x10]
	ldr r1, _08083A58 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08083A64
	.align 2, 0
_08083A58: .4byte 0xFFBFFFFF
_08083A5C:
	ldr r0, [r5, #0x10]
	ldr r1, _08083A80 @ =0xFFBFFFFF
	ands r0, r1
	str r0, [r5, #0x10]
_08083A64:
	movs r1, #1
	lsls r1, r6
	mov r2, r8      @ r2 = r8 = &exit->unk40
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
	cmp r6, #0
	beq _08083A88
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r3, _08083A84 @ =gPartner + 0x54
	strh r0, [r3]
	b _08083A90
	.align 2, 0
_08083A80: .4byte 0xFFBFFFFF
_08083A84: .4byte gPartner + 0x54
_08083A88:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, _08083AA0 @ =gPlayer + 0x54
	strh r0, [r1]
_08083A90:
	cmp r6, #0
	beq _08083AA8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08083AA4 @ =gPartner + 0x56
	strh r0, [r2]
	b _08083AB0
	.align 2, 0
_08083AA0: .4byte gPlayer + 0x54
_08083AA4: .4byte gPartner + 0x56
_08083AA8:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r3, _08083AC4 @ =gPlayer + 0x56
	strh r0, [r3]
_08083AB0:
	cmp r6, #0
	beq _08083ACC
	ldr r0, _08083AC8 @ =gPartner + 0x26
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	ldr r1, _08083AC8 @ =gPartner + 0x26
	strb r0, [r1]
	b _08083D6A_continue
	.align 2, 0
_08083AC4: .4byte gPlayer + 0x56
_08083AC8: .4byte gPartner + 0x26
_08083ACC:
	ldr r2, _08083AD8 @ =gPlayer + 0x26
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	b _08083D6A_continue
	.align 2, 0
_08083AD8: .4byte gPlayer + 0x26
_08083ADC:
	ldr r0, _08083B0C @ =gPlayer + 0x6D
	cmp r6, #0
	beq _08083AE4
	ldr r0, _08083B10 @ =gPartner + 0x6D
_08083AE4:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7f
	bne _08083AF0
	b _08083D26
_08083AF0:
	ldr r0, [sp]        @ r0 = sp00 = worldX
	lsls r3, r0, #0x10
	asrs r2, r3, #0x10  @ r2 = sp00 = worldX
	ldr r0, [sp, #0xc]  @ sp0C = sp0C
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	adds r2, r2, r0
	cmp r6, #0
	beq _08083B14
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08083B1E
	b _08083D26
	.align 2, 0
_08083B0C: .4byte gPlayer + 0x6D
_08083B10: .4byte gPartner + 0x6D
_08083B14:
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08083B1E
	b _08083D26
_08083B1E:
	asrs r0, r3, #0x10  @ r0 = worldX
	asrs r1, r1, #0x10  @ r1 = sp0C
	adds r0, r0, r1
	adds r1, r0, #0
	adds r1, #0x18
	cmp r6, #0
	beq _08083B36
	ldr r0, [r4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08083B40
	b _08083D26
_08083B36:
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08083B40
	b _08083D26
_08083B40:
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	adds r2, r0, #0
	subs r2, #0x18
	cmp r6, #0
	beq _08083B58
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08083B62
	b _08083D26
_08083B58:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r2, r0
	ble _08083B62
	b _08083D26
_08083B62:
	asrs r0, r1, #0x10
	adds r1, r0, #0
	adds r1, #0x18
	cmp r6, #0
	beq _08083B76
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08083B80
	b _08083D26
_08083B76:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08083B80
	b _08083D26
_08083B80:
	mov r3, r8      @ r3 = r8 = &exit->unk40
	ldrb r1, [r3]
	asrs r1, r6
	movs r0, #1
	ands r1, r0
	ldr r3, _08083BA0 @ =gPlayer
	cmp r1, #0
	bne _08083BBC
	adds r0, r7, #0
	adds r0, #0x44
	mov r2, sl
	adds r1, r0, r2
	cmp r6, #0
	beq _08083BA4
	ldr r0, [r4]
	b _08083BA6
	.align 2, 0
_08083BA0: .4byte gPlayer
_08083BA4:
	ldr r0, [r5]
_08083BA6:
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x4c
	mov r2, sl
	adds r1, r0, r2
	cmp r6, #0
	beq _08083BB8
	ldr r0, [r4, #4]
	b _08083BBA
_08083BB8:
	ldr r0, [r3, #4]
_08083BBA:
	str r0, [r1]
_08083BBC:
	ldr r0, _08083BD8 @ =gPlayer
	cmp r6, #0
	beq _08083BC4
	ldr r0, _08083BDC @ =gPartner
_08083BC4:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _08083BE4
	ldr r0, [r4, #0x10]
	ldr r1, _08083BE0 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _08083BEC
	.align 2, 0
_08083BD8: .4byte gPlayer
_08083BDC: .4byte gPartner
_08083BE0: .4byte 0xFFFFFEFF
_08083BE4:
	ldr r0, [r5, #0x10]
	ldr r1, _08083BFC @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
_08083BEC:
	ldr r3, _08083C00 @ =gPlayer
	cmp r6, #0
	beq _08083C04
	ldr r0, [r4, #0x10]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08083C0C
	.align 2, 0
_08083BFC: .4byte 0xFFFFFEFF
_08083C00: .4byte gPlayer
_08083C04:
	ldr r0, [r5, #0x10]
	movs r1, #0x10
	orrs r0, r1
	str r0, [r5, #0x10]
_08083C0C:
	cmp r6, #0
	beq _08083C1A
	ldr r0, [r4, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08083C22
_08083C1A:
	ldr r0, [r5, #0x10]
	movs r1, #4
	orrs r0, r1
	str r0, [r5, #0x10]
_08083C22:
	cmp r6, #0
	beq _08083C30
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08083C38
_08083C30:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_08083C38:
	cmp r6, #0
	beq _08083C48
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08083C52
_08083C48:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r5, #0x10]
_08083C52:
	cmp r6, #0
	beq _08083C62
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r4, #0x10]
	b _08083C6C
_08083C62:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0x10]
_08083C6C:
	cmp r6, #0
	beq _08083C78
	movs r0, #0xfb
	lsls r0, r0, #8
	strh r0, [r4, #0xa]
	b _08083C7E
_08083C78:
	movs r0, #0xfb
	lsls r0, r0, #8
	strh r0, [r3, #0xa]
_08083C7E:
	cmp r6, #0
	beq _08083C88
	movs r0, #0
	strh r0, [r4, #8]
	b _08083C8A
_08083C88:
	strh r6, [r3, #8]
_08083C8A:
	cmp r6, #0
	beq _08083C94
	movs r0, #0
	strh r0, [r4, #0xc]
	b _08083C96
_08083C94:
	strh r6, [r3, #0xc]
_08083C96:
	cmp r6, #0
	beq _08083CA0
	movs r0, #0
	strh r0, [r4, #0x38]
	b _08083CA2
_08083CA0:
	strh r6, [r3, #0x38]
_08083CA2:
	cmp r6, #0
	beq _08083CAC
	movs r0, #0
	strh r0, [r4, #0x3a]
	b _08083CAE
_08083CAC:
	strh r6, [r3, #0x3a]
_08083CAE:
	ldr r0, _08083D08 @ =gPlayer
	cmp r6, #0
	beq _08083CB6
	ldr r0, _08083D0C @ =gPartner
_08083CB6:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08083D08 @ =gPlayer
	cmp r6, #0
	beq _08083CC4
	ldr r1, _08083D0C @ =gPartner
_08083CC4:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _08083D08 @ =gPlayer
	cmp r6, #0
	beq _08083CD0
	ldr r1, _08083D0C @ =gPartner
_08083CD0:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	movs r0, #0xaa
	bl m4aSongNumStart
	ldr r1, _08083D10 @ =gPlayer + 0x6D
	cmp r6, #0
	beq _08083CE2
	ldr r1, _08083D14 @ =gPartner + 0x6D
_08083CE2:
	movs r0, #0x7f
	strb r0, [r1]
	movs r1, #1
	lsls r1, r6
	mov r3, r8
	ldrb r0, [r3]
	orrs r1, r0
	movs r0, #0
	strb r1, [r3]
	cmp r6, #0
	beq _08083D1C
	ldr r1, _08083D18 @ =gPartner + 0x26
	ldrb r0, [r1]
	movs r1, #0x80
	orrs r0, r1
	ldr r2, _08083D18 @ =gPartner + 0x26
	strb r0, [r2]
	b _08083D26
	.align 2, 0
_08083D08: .4byte gPlayer
_08083D0C: .4byte gPartner
_08083D10: .4byte gPlayer + 0x6D
_08083D14: .4byte gPartner + 0x6D
_08083D18: .4byte gPartner + 0x26
_08083D1C:
	ldr r3, _08083D3C @ =gPlayer + 0x26
	ldrb r0, [r3]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
_08083D26:
	cmp r6, #0
	beq _08083D44
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	bne _08083D6A_continue
	ldr r3, _08083D40 @ =gPlayer
	b _08083D52
	.align 2, 0
_08083D3C: .4byte gPlayer + 0x26
_08083D40: .4byte gPlayer
_08083D44:
	ldr r1, [r5, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r1, r0
	ldr r3, _08083DD8 @ =gPlayer
	cmp r1, #0
	bne _08083D6A_continue
_08083D52:
	ldr r1, [sp]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r6, #0
	beq _08083D64
	ldr r3, _08083DDC @ =gPartner
_08083D64:
	ldr r0, [sp, #0x10]
	bl Coll_Player_Platform
_08083D6A_continue:
	movs r3, #4
	add sl, r3
	adds r6, #1
	ldr r0, _08083DE0 @ =gNumSingleplayerCharacters
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sb, r0
	cmp r6, r1
	bge _08083D7E
	b _08083874_loop
_08083D7E:
	ldr r5, [sp, #0x18]
	movs r6, #0x80
	lsls r6, r6, #0x10
	adds r1, r5, r6
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08083DA4
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08083DA4
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08083E42
_08083DA4:
	movs r2, #0
	ldr r3, _08083DE4 @ =gCurTask
	mov sl, r3
	movs r5, #0x40
	adds r5, r5, r7
	mov r8, r5
	ldr r4, _08083DDC @ =gPartner
	ldr r6, _08083DE8 @ =0xFFDFFFFF
	mov ip, r6
	ldr r3, _08083DD8 @ =gPlayer
	ldr r6, _08083DEC @ =0xFFBFFFFF
	ldr r5, _08083DF0 @ =gPlayerControls
_08083DBC_loop:
	mov r1, r8
	ldrb r0, [r1]
	asrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08083E26_continue
	cmp r2, #0
	beq _08083DF4
	ldr r0, [r4, #0x10]
	mov r1, ip
	ands r0, r1
	str r0, [r4, #0x10]
	b _08083DFC
	.align 2, 0
_08083DD8: .4byte gPlayer
_08083DDC: .4byte gPartner
_08083DE0: .4byte gNumSingleplayerCharacters
_08083DE4: .4byte gCurTask
_08083DE8: .4byte 0xFFDFFFFF
_08083DEC: .4byte 0xFFBFFFFF
_08083DF0: .4byte gPlayerControls
_08083DF4:
	ldr r0, [r3, #0x10]
	mov r1, ip
	ands r0, r1
	str r0, [r3, #0x10]
_08083DFC:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	orrs r1, r0
	cmp r2, #0
	beq _08083E0E
	ldrh r0, [r4, #0x38]
	orrs r1, r0
	strh r1, [r4, #0x38]
	b _08083E14
_08083E0E:
	ldrh r0, [r3, #0x38]
	orrs r1, r0
	strh r1, [r3, #0x38]
_08083E14:
	cmp r2, #0
	beq _08083E20
	ldr r0, [r4, #0x10]
	ands r0, r6
	str r0, [r4, #0x10]
	b _08083E26_continue
_08083E20:
	ldr r0, [r3, #0x10]
	ands r0, r6
	str r0, [r3, #0x10]
_08083E26_continue:
	adds r2, #1
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	blt _08083DBC_loop
	ldrb r0, [r7, #8]
	ldr r2, [sp, #0x14]
	strb r0, [r2]
	mov r3, sl
	ldr r0, [r3]
	bl TaskDestroy
	b _08083E4E
_08083E42:
	ldr r0, [sp, #0x10]
	bl UpdateSpriteAnimation
	ldr r0, [sp, #0x10]
	bl DisplaySprite
_08083E4E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
