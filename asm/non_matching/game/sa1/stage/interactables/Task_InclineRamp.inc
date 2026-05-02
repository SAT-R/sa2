.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _08075690 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r1, r0     @ r0 = ramp
	ldr r0, [r0]
	str r0, [sp]        @ sp00 = me
	ldr r2, _08075694 @ =0x03000008
	adds r0, r1, r2
	ldrb r0, [r0]
	str r0, [sp, #4]    @ sp04 = meX
	ldr r3, _08075698 @ =0x03000004
	adds r0, r1, r3
	ldrh r2, [r0]       @ r2 = regionX
	adds r3, #2
	adds r0, r1, r3
	ldrh r3, [r0]       @ r3 = regionY
	ldr r0, _0807569C @ =0x03000009
	adds r1, r1, r0
	ldrb r1, [r1]
	str r1, [sp, #8]    @ sp08 = incline
	ldr r1, [sp, #4]    @ sp04 = meX
	lsls r0, r1, #3
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0          @ sl = worldX
	ldr r2, [sp]
	ldrb r0, [r2, #1]
	lsls r0, r0, #3
	lsls r3, r3, #8
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0          @ r8 = worldY
	movs r4, #0
	ldr r5, _080756A0 @ =gPartner
	ldr r6, _080756A4 @ =gPlayer
_08075678_loop:
	cmp r4, #0
	beq _080756A8
	ldr r1, [r5, #0x10]
	movs r0, #0x80
	ands r1, r0
	mov r3, sl
	lsls r3, r3, #0x10
	mov sb, r3          @ sb = worldX << 16
	mov r0, r8
	lsls r7, r0, #0x10  @ r7 = worldY << 16
	b _080756B8
	.align 2, 0
_08075690: .4byte gCurTask
_08075694: .4byte 0x03000008
_08075698: .4byte 0x03000004
_0807569C: .4byte 0x03000009
_080756A0: .4byte gPartner
_080756A4: .4byte gPlayer
_080756A8:
	ldr r1, [r6, #0x10]
	movs r0, #0x80
	ands r1, r0
	mov r2, sl
	lsls r2, r2, #0x10
	mov sb, r2
	mov r3, r8
	lsls r7, r3, #0x10
_080756B8:
	cmp r1, #0
	beq _080756BE
	b _08075A08_continue
_080756BE:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10  @ r1 = sl = worldX
	mov sb, r0
	cmp r4, #0
	beq _080756D8
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	ble _080756E6
	mov r2, r8      @ r2 = r8 = worldY
	lsls r7, r2, #0x10
	b _08075A08_continue
_080756D8:
	ldr r0, [r6]
	asrs r0, r0, #8
	mov r3, r8
	lsls r7, r3, #0x10
	cmp r1, r0
	ble _080756E6
	b _08075A08_continue
_080756E6:
	mov r0, sb      @ r0 = sb = worldX << 16
	asrs r1, r0, #0x10
	ldr r2, [sp]    @ r2 = sp00 = me
	ldrb r0, [r2, #5]
	lsls r0, r0, #3
	adds r1, r1, r0
	cmp r4, #0
	beq _08075704
	ldr r0, [r5]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08075712
	mov r3, r8
	lsls r7, r3, #0x10
	b _08075A08_continue
_08075704:
	ldr r0, [r6]
	asrs r0, r0, #8
	mov r2, r8
	lsls r7, r2, #0x10
	cmp r1, r0
	bge _08075712
	b _08075A08_continue
_08075712:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	adds r7, r0, #0
	cmp r4, #0
	beq _08075728
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _08075732
	b _08075A08_continue
_08075728:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	ble _08075732
	b _08075A08_continue
_08075732:
	asrs r1, r7, #0x10
	ldr r2, [sp]
	ldrb r0, [r2, #6]
	lsls r0, r0, #3
	adds r1, r1, r0
	cmp r4, #0
	beq _0807574A
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08075754
	b _08075A08_continue
_0807574A:
	ldr r0, [r6, #4]
	asrs r0, r0, #8
	cmp r1, r0
	bge _08075754
	b _08075A08_continue
_08075754:
	ldr r3, [sp, #8]    @ r3 = sp08 = incline
	cmp r3, #0
	bne _0807575C
	b _080758AC
_0807575C:
	cmp r4, #0
	beq _0807576E
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _0807577C
	b _08075A08_continue
_0807576E:
	movs r2, #8
	ldrsh r1, [r6, r2]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bgt _0807577C
	b _08075A08_continue
_0807577C:
	cmp r4, #0
	beq _0807578C
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _08075796
_0807578C:
	ldr r0, [r6, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_08075796:
	cmp r4, #0
	beq _080757A4
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
	b _080757AC
_080757A4:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_080757AC:
	cmp r4, #0
	beq _080757C0
	ldr r0, [r5, #0x10]
	ldr r1, _080757BC @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _080757C8
	.align 2, 0
_080757BC: .4byte 0xFFFFFEFF
_080757C0:
	ldr r0, [r6, #0x10]
	ldr r1, _080757D8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x10]
_080757C8:
	cmp r4, #0
	beq _080757DC
	ldr r0, [r5, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _080757E6
	.align 2, 0
_080757D8: .4byte 0xFFFFFEFF
_080757DC:
	ldr r0, [r6, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_080757E6:
	ldr r0, _0807581C @ =gPlayer
	cmp r4, #0
	beq _080757EE
	ldr r0, _08075820 @ =gPartner
_080757EE:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _0807581C @ =gPlayer
	cmp r4, #0
	beq _080757FC
	ldr r1, _08075820 @ =gPartner
_080757FC:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r2, _0807581C @ =gPlayer
	adds r1, r2, #0
	cmp r4, #0
	beq _0807580A
	ldr r1, _08075820 @ =gPartner
_0807580A:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	cmp r4, #0
	beq _08075824
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r5, #0xa]
	b _0807582A
	.align 2, 0
_0807581C: .4byte gPlayer
_08075820: .4byte gPartner
_08075824:
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r2, #0xa]
_0807582A:
	cmp r4, #0
	beq _0807583C
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r1, [r5, #8]
	adds r0, r0, r1
	strh r0, [r5, #8]
	b _08075848
_0807583C:
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ldrh r1, [r6, #8]
	adds r0, r0, r1
	strh r0, [r6, #8]
_08075848:
	cmp r4, #0
	beq _0807585A
	movs r3, #8
	ldrsh r1, [r5, r3]
	movs r0, #0x88
	lsls r0, r0, #5
	cmp r1, r0
	bgt _08075866
	b _08075878
_0807585A:
	movs r0, #8
	ldrsh r1, [r2, r0]
	movs r0, #0x88
	lsls r0, r0, #5
	cmp r1, r0
	ble _08075878
_08075866:
	cmp r4, #0
	beq _08075872
	movs r0, #0x88
	lsls r0, r0, #5
	strh r0, [r5, #8]
	b _08075878
_08075872:
	movs r0, #0x88
	lsls r0, r0, #5
	strh r0, [r2, #8]
_08075878:
	adds r0, r2, #0
	cmp r4, #0
	beq _08075880
	ldr r0, _08075890 @ =gPartner
_08075880:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r4, #0
	beq _08075898
	movs r0, #0x11
	ldr r1, _08075894 @ =gPartner + 0x40
	strb r0, [r1]
	b _0807589E
	.align 2, 0
_08075890: .4byte gPartner
_08075894: .4byte gPartner + 0x40
_08075898:
	movs r0, #0x11
	ldr r2, _080758A8 @ =gPlayer + 0x40
	strb r0, [r2]
_0807589E:
	movs r0, #0xaa
	bl m4aSongNumStart
	b _08075A08_continue
	.align 2, 0
_080758A8: .4byte gPlayer + 0x40
_080758AC:
	cmp r4, #0
	beq _080758C0
	movs r3, #8
	ldrsh r1, [r5, r3]
	ldr r0, _080758BC @ =0xFFFFFC00
	cmp r1, r0
	blt _080758CC
	b _08075A08_continue
	.align 2, 0
_080758BC: .4byte 0xFFFFFC00
_080758C0:
	movs r0, #8
	ldrsh r1, [r6, r0]
	ldr r0, _080758DC @ =0xFFFFFC00
	cmp r1, r0
	blt _080758CC
	b _08075A08_continue
_080758CC:
	cmp r4, #0
	beq _080758E0
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _080758EA
	.align 2, 0
_080758DC: .4byte 0xFFFFFC00
_080758E0:
	ldr r0, [r6, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_080758EA:
	cmp r4, #0
	beq _080758F8
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
	b _08075900
_080758F8:
	ldr r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r6, #0x10]
_08075900:
	cmp r4, #0
	beq _08075914
	ldr r0, [r5, #0x10]
	ldr r1, _08075910 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
	b _0807591C
	.align 2, 0
_08075910: .4byte 0xFFFFFEFF
_08075914:
	ldr r0, [r6, #0x10]
	ldr r1, _0807592C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r6, #0x10]
_0807591C:
	cmp r4, #0
	beq _08075930
	ldr r0, [r5, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
	b _0807593A
	.align 2, 0
_0807592C: .4byte 0xFFFFFEFF
_08075930:
	ldr r0, [r6, #0x10]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0x10]
_0807593A:
	ldr r0, _08075970 @ =gPlayer
	cmp r4, #0
	beq _08075942
	ldr r0, _08075974 @ =gPartner
_08075942:
	movs r1, #0xe
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _08075970 @ =gPlayer
	cmp r4, #0
	beq _08075950
	ldr r1, _08075974 @ =gPartner
_08075950:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r2, _08075970 @ =gPlayer
	adds r1, r2, #0
	cmp r4, #0
	beq _0807595E
	ldr r1, _08075974 @ =gPartner
_0807595E:
	movs r0, #0xe
	strb r0, [r1, #0xf]
	cmp r4, #0
	beq _08075978
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r5, #0xa]
	b _0807597E
	.align 2, 0
_08075970: .4byte gPlayer
_08075974: .4byte gPartner
_08075978:
	movs r0, #0xf8
	lsls r0, r0, #8
	strh r0, [r2, #0xa]
_0807597E:
	cmp r4, #0
	beq _08075994
	ldr r1, _08075990 @ =0xFFFFFC00
	adds r0, r1, #0
	ldrh r3, [r5, #8]
	adds r0, r0, r3
	strh r0, [r5, #8]
	b _0807599E
	.align 2, 0
_08075990: .4byte 0xFFFFFC00
_08075994:
	ldr r1, _080759B0 @ =0xFFFFFC00
	adds r0, r1, #0
	ldrh r3, [r6, #8]
	adds r0, r0, r3
	strh r0, [r6, #8]
_0807599E:
	cmp r4, #0
	beq _080759B8
	movs r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, _080759B4 @ =0xFFFFEF00
	cmp r1, r0
	blt _080759C2
	b _080759DA
	.align 2, 0
_080759B0: .4byte 0xFFFFFC00
_080759B4: .4byte 0xFFFFEF00
_080759B8:
	movs r3, #8
	ldrsh r1, [r2, r3]
	ldr r0, _080759D0 @ =0xFFFFEF00
	cmp r1, r0
	bge _080759DA
_080759C2:
	cmp r4, #0
	beq _080759D4
	movs r0, #0xef
	lsls r0, r0, #8
	strh r0, [r5, #8]
	b _080759DA
	.align 2, 0
_080759D0: .4byte 0xFFFFEF00
_080759D4:
	movs r0, #0xef
	lsls r0, r0, #8
	strh r0, [r2, #8]
_080759DA:
	adds r0, r2, #0
	cmp r4, #0
	beq _080759E2
	ldr r0, _080759F4 @ =gPartner
_080759E2:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r4, #0
	beq _080759FC
	movs r0, #0x11
	ldr r1, _080759F8 @ =gPartner + 0x40
	strb r0, [r1]
	b _08075A02
	.align 2, 0
_080759F4: .4byte gPartner
_080759F8: .4byte gPartner + 0x40
_080759FC:
	movs r0, #0x11
	ldr r2, _08075A74 @ =gPlayer + 0x40
	strb r0, [r2]
_08075A02:
	movs r0, #0xaa
	bl m4aSongNumStart
_08075A08_continue:
	adds r4, #1
	ldr r0, _08075A78 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bge _08075A18_postloop
	b _08075678_loop
_08075A18_postloop:
	ldr r2, _08075A7C @ =gCamera
	ldrh r0, [r2]
	mov r3, sb      @ r3 = sb
	asrs r1, r3, #0x10
	subs r1, r1, r0
	ldrh r2, [r2, #2]
	asrs r0, r7, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0xf8
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _08075A54
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, #0
	blt _08075A54
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08075A64
_08075A54:
	mov r2, sp
	ldrb r3, [r2, #4]
	ldr r2, [sp]
	strb r3, [r2]
	ldr r0, _08075A80 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
_08075A64:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075A74: .4byte gPlayer + 0x40
_08075A78: .4byte gNumSingleplayerCharacters
_08075A7C: .4byte gCamera
_08075A80: .4byte gCurTask

.syntax divided
