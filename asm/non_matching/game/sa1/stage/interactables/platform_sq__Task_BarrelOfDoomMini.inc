.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r0, _0807E4E0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r1
	mov r8, r0          @ r8 = platform
	ldr r0, _0807E4E4 @ =0x0300000C
	adds r0, r0, r1
	mov sl, r0          @ sl = s
	mov r1, r8
	ldr r1, [r1]
	str r1, [sp, #8]    @ sp08 = me
	mov r2, r8
	ldrb r0, [r2, #8]
	lsls r0, r0, #3
	ldrh r1, [r2, #4]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10  @ r3 = worldX
	ldr r4, [sp, #8]
	ldrb r0, [r4, #1]
	lsls r0, r0, #3
	ldrh r1, [r2, #6]
	lsls r1, r1, #8
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10  @ r4 = worldY
	ldr r0, [r2, #0x44]
	cmp r0, #0
	beq _0807E4F0
	cmp r0, #0
	bge _0807E4E8
	ldr r0, [r2, #0x3c]
	adds r0, #0x30
	str r0, [r2, #0x3c]
	b _0807E4F0
	.align 2, 0
_0807E4E0: .4byte gCurTask
_0807E4E4: .4byte 0x0300000C
_0807E4E8:
	mov r1, r8
	ldr r0, [r1, #0x3c]
	subs r0, #0x30
	str r0, [r1, #0x3c]
_0807E4F0:
	ldr r2, _0807E534 @ =gCamera
	ldrh r1, [r2]
	lsls r3, r3, #0x10  @ r3 = worldX << 16
	asrs r0, r3, #0x10
	subs r0, r0, r1
	mov r1, sl
	strh r0, [r1, #0x16]
	ldrh r0, [r2, #2]
	lsls r2, r4, #0x10  @ r2 = worldY << 16
	asrs r1, r2, #0x10
	subs r1, r1, r0
	mov r4, r8
	ldr r0, [r4, #0x44]
	asrs r0, r0, #8
	adds r1, r1, r0
	mov r0, sl
	strh r1, [r0, #0x18]
	movs r4, #0
	str r3, [sp, #0xc]  @ r3 = worldX << 16
	str r2, [sp, #0x10] @ r2 = worldY << 16
	ldr r6, _0807E538 @ =gPartner
	ldr r7, _0807E53C @ =gPlayer
	movs r1, #0
	str r1, [sp, #0x14]     @ r1 = sp14 = i * 4
	movs r2, #9
	rsbs r2, r2, #0
	mov sb, r2              @ sb = ~MOVESTATE_STOOD_ON_OBJ
_0807E526_loop:
	ldr r1, [sp, #0x14]     @ r1 = sp14 = i * 4
	add r1, sp
	cmp r4, #0
	beq _0807E540
	movs r3, #0xa
	ldrsh r0, [r6, r3]
	b _0807E544
	.align 2, 0
_0807E534: .4byte gCamera
_0807E538: .4byte gPartner
_0807E53C: .4byte gPlayer
_0807E540:
	movs r2, #0xa
	ldrsh r0, [r7, r2]
_0807E544:
	str r0, [r1]
	cmp r4, #0
	beq _0807E55C
	ldr r0, [r6, #0x10]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0807E56A
	ldr r3, _0807E558 @ =gPlayer
	b _0807E7D4
	.align 2, 0
_0807E558: .4byte gPlayer
_0807E55C:
	ldr r1, [r7, #0x10]
	movs r0, #8
	ands r1, r0
	ldr r3, _0807E578 @ =gPlayer
	cmp r1, #0
	bne _0807E56A
	b _0807E7D4
_0807E56A:
	cmp r4, #0
	beq _0807E57C
	ldr r0, [r6, #0x28]
	cmp r0, sl
	beq _0807E586
	ldr r3, _0807E578 @ =gPlayer
	b _0807E7D4
	.align 2, 0
_0807E578: .4byte gPlayer
_0807E57C:
	ldr r0, [r7, #0x28]
	ldr r3, _0807E590 @ =gPlayer
	cmp r0, sl
	beq _0807E586
	b _0807E7D4
_0807E586:
	cmp r4, #0
	beq _0807E594
	movs r0, #0
	strh r0, [r6, #0xa]
	b _0807E596
	.align 2, 0
_0807E590: .4byte gPlayer
_0807E594:
	strh r4, [r7, #0xa]
_0807E596:
	mov r3, r8
	ldr r1, [r3, #0x3c]
	cmp r4, #0
	beq _0807E5A6
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r6, #4]
	b _0807E5AC
_0807E5A6:
	ldr r0, [r7, #4]
	adds r0, r0, r1
	str r0, [r7, #4]
_0807E5AC:
	ldr r0, _0807E5C0 @ =gPlayerControls
	ldrh r1, [r0, #2]
	adds r2, r0, #0
	cmp r4, #0
	beq _0807E5C4
	ldrh r0, [r6, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _0807E5CC
	b _0807E638
	.align 2, 0
_0807E5C0: .4byte gPlayerControls
_0807E5C4:
	ldrh r0, [r7, #0x3a]
	ands r0, r1
	cmp r0, #0
	beq _0807E638
_0807E5CC:
	cmp r4, #0
	beq _0807E5DC
	ldrh r0, [r6, #0x38]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E5E6
	b _0807E638
_0807E5DC:
	ldrh r0, [r7, #0x38]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807E638
_0807E5E6:
	cmp r4, #0
	beq _0807E5FC
	ldr r1, _0807E5F8 @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	beq _0807E608
	b _0807E824_continue
	.align 2, 0
_0807E5F8: .4byte gPartner + 0x59
_0807E5FC:
	ldr r2, _0807E618 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #3
	beq _0807E608
	b _0807E824_continue
_0807E608:
	cmp r4, #0
	beq _0807E61C
	ldr r0, [r6, #0x10]
	mov r3, sb
	ands r0, r3
	str r0, [r6, #0x10]
	b _0807E624
	.align 2, 0
_0807E618: .4byte gPlayer + 0x59
_0807E61C:
	ldr r0, [r7, #0x10]
	mov r1, sb
	ands r0, r1
	str r0, [r7, #0x10]
_0807E624:
	cmp r4, #0
	beq _0807E630
	movs r0, #0xfa
	lsls r0, r0, #8
	strh r0, [r6, #0xa]
	b _0807E824_continue
_0807E630:
	movs r0, #0xfa
	lsls r0, r0, #8
	strh r0, [r7, #0xa]
	b _0807E824_continue
_0807E638:
	ldrh r1, [r2]
	cmp r4, #0
	beq _0807E648
	ldrh r0, [r6, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _0807E650
	b _0807E6D8
_0807E648:
	ldrh r0, [r7, #0x3a]
	ands r0, r1
	cmp r0, #0
	beq _0807E6D8
_0807E650:
	cmp r4, #0
	beq _0807E660
	ldrh r0, [r6, #0x38]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807E66A
	b _0807E6D8
_0807E660:
	ldrh r0, [r7, #0x38]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807E6D8
_0807E66A:
	cmp r4, #0
	beq _0807E680
	ldr r2, _0807E67C @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #3
	bne _0807E68A
	b _0807E6C0
	.align 2, 0
_0807E67C: .4byte gPartner + 0x59
_0807E680:
	ldr r3, _0807E6B4 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #3
	beq _0807E6C0
_0807E68A:
	ldr r0, _0807E6B8 @ =gPlayer
	cmp r4, #0
	beq _0807E692
	ldr r0, _0807E6BC @ =gPartner
_0807E692:
	movs r1, #9
	bl Player_HandleSpriteYOffsetChange
	ldr r1, _0807E6B8 @ =gPlayer
	cmp r4, #0
	beq _0807E6A0
	ldr r1, _0807E6BC @ =gPartner
_0807E6A0:
	movs r0, #6
	strb r0, [r1, #0xe]
	ldr r1, _0807E6B8 @ =gPlayer
	cmp r4, #0
	beq _0807E6AC
	ldr r1, _0807E6BC @ =gPartner
_0807E6AC:
	movs r0, #9
	strb r0, [r1, #0xf]
	b _0807E824_continue
	.align 2, 0
_0807E6B4: .4byte gPlayer + 0x59
_0807E6B8: .4byte gPlayer
_0807E6BC: .4byte gPartner
_0807E6C0:
	cmp r4, #0
	beq _0807E6CE
	ldr r0, [r6, #0x10]
	mov r1, sb
	ands r0, r1
	str r0, [r6, #0x10]
	b _0807E824_continue
_0807E6CE:
	ldr r0, [r7, #0x10]
	mov r2, sb
	ands r0, r2
	str r0, [r7, #0x10]
	b _0807E824_continue
_0807E6D8:
	ldrh r1, [r2]
	cmp r4, #0
	beq _0807E6F0
	ldrh r0, [r6, #0x3a]
	ands r0, r1
	cmp r0, #0
	bne _0807E6FA
	ldr r3, _0807E6EC @ =gPlayer
	b _0807E72E
	.align 2, 0
_0807E6EC: .4byte gPlayer
_0807E6F0:
	ldrh r0, [r7, #0x3a]
	ands r0, r1
	ldr r3, _0807E70C @ =gPlayer
	cmp r0, #0
	beq _0807E72E
_0807E6FA:
	mov r3, r8
	ldr r0, [r3, #0x3c]
	asrs r0, r0, #1
	ldr r1, _0807E710 @ =0xFFFFFC00
	adds r0, r0, r1
	cmp r4, #0
	beq _0807E714
	strh r0, [r6, #0xa]
	b _0807E716
	.align 2, 0
_0807E70C: .4byte gPlayer
_0807E710: .4byte 0xFFFFFC00
_0807E714:
	strh r0, [r7, #0xa]
_0807E716:
	cmp r4, #0
	beq _0807E724
	ldr r0, [r6, #0x10]
	mov r2, sb
	ands r0, r2
	str r0, [r6, #0x10]
	b _0807E824_continue
_0807E724:
	ldr r0, [r7, #0x10]
	mov r3, sb
	ands r0, r3
	str r0, [r7, #0x10]
	b _0807E824_continue
_0807E72E:
	cmp r4, #0
	beq _0807E73E
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r6, #4]
	b _0807E748
_0807E73E:
	ldr r0, [r7, #4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [r7, #4]
_0807E748:
	cmp r4, #0
	beq _0807E752
	movs r0, #1
	strh r0, [r6, #0xa]
	b _0807E756
_0807E752:
	movs r0, #1
	strh r0, [r3, #0xa]
_0807E756:
	mov r0, r8
	ldr r1, [r0, #0x40]
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]  @ r2 = sp0C = worldX << 16
	asrs r0, r2, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	mov r0, r8
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r4, #0
	beq _0807E77C
	ldr r3, _0807E798 @ =gPartner
_0807E77C:
	mov r0, sl
	adds r1, r5, #0
	bl Coll_Player_PlatformCrumbling
	cmp r0, #0
	bne _0807E7C0
	cmp r4, #0
	beq _0807E79C
	ldr r0, [r6, #0x10]
	mov r3, sb
	ands r0, r3
	str r0, [r6, #0x10]
	b _0807E7A4
	.align 2, 0
_0807E798: .4byte gPartner
_0807E79C:
	ldr r0, [r7, #0x10]
	mov r1, sb
	ands r0, r1
	str r0, [r7, #0x10]
_0807E7A4:
	cmp r4, #0
	beq _0807E7B8
	ldr r0, [r6, #4]
	ldr r2, _0807E7B4 @ =0xFFFFF800
	adds r0, r0, r2
	str r0, [r6, #4]
	b _0807E7C0
	.align 2, 0
_0807E7B4: .4byte 0xFFFFF800
_0807E7B8:
	ldr r0, [r7, #4]
	ldr r3, _0807E7CC @ =0xFFFFF800
	adds r0, r0, r3
	str r0, [r7, #4]
_0807E7C0:
	cmp r4, #0
	beq _0807E7D0
	movs r0, #0
	strh r0, [r6, #0xa]
	b _0807E824_continue
	.align 2, 0
_0807E7CC: .4byte 0xFFFFF800
_0807E7D0:
	strh r4, [r7, #0xa]
	b _0807E824_continue
_0807E7D4:
	mov r0, r8
	ldr r1, [r0, #0x40]
	asrs r1, r1, #8
	ldr r2, [sp, #0xc]  @ r2 = sp0C = worldX << 16
	asrs r0, r2, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	mov r0, r8
	ldr r1, [r0, #0x44]
	asrs r1, r1, #8
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r4, #0
	beq _0807E7FA
	ldr r3, _0807E8DC @ =gPartner
_0807E7FA:
	mov r0, sl
	adds r1, r5, #0
	bl Coll_Player_PlatformCrumbling
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0807E824_continue
	ldr r0, [sp, #0x14]      @ r1 = sp14 = i * 4
	add r0, sp
	ldr r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xa
	bl Div
	mov r3, r8
	ldr r1, [r3, #0x3c]
	adds r1, r1, r0
	str r1, [r3, #0x3c]
_0807E824_continue:
	ldr r0, [sp, #0x14]
	adds r0, #4
	str r0, [sp, #0x14]     @ r1 = sp14 = i * 4
	adds r4, #1
	ldr r0, _0807E8E0 @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bge _0807E83A
	b _0807E526_loop
_0807E83A:
	mov r2, r8
	ldr r1, [r2, #0x3c]
	ldr r0, _0807E8E4 @ =0x000026AC  @  9.900
	muls r0, r1, r0
	ldr r1, _0807E8E8 @ =0x00002710  @ 10.000
	bl Div
	mov r3, r8
	str r0, [r3, #0x3c]
	adds r0, #0x2f
	cmp r0, #0x5e
	bhi _0807E864
	ldr r1, [r3, #0x44]
	ldr r0, _0807E8EC @ =0xFFFFFD00
	cmp r1, r0
	ble _0807E864
	ldr r0, _0807E8F0 @ =0x000002FF
	cmp r1, r0
	bgt _0807E864
	movs r0, #0
	str r0, [r3, #0x3c]
_0807E864:
	mov r4, r8
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	str r0, [r4, #0x44]
	ldr r0, [sp, #0xc]
	asrs r3, r0, #0x10
	ldr r4, _0807E8F4 @ =gCamera
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0xb8
	lsls r2, r2, #1
	adds r0, r1, r2
	cmp r3, r0
	bgt _0807E8A4
	adds r0, r1, #0
	subs r0, #0x80
	cmp r3, r0
	blt _0807E8A4
	ldr r3, [sp, #0x10]
	asrs r2, r3, #0x10
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0807E8A4
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _0807E8FC
_0807E8A4:
	mov r4, sl
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0807E8CA
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _0807E8CA
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _0807E8FC
_0807E8CA:
	mov r3, r8
	ldrb r0, [r3, #8]
	ldr r4, [sp, #8]    @ r4 = me
	strb r0, [r4]
	ldr r0, _0807E8F8 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _0807E902
	.align 2, 0
_0807E8DC: .4byte gPartner
_0807E8E0: .4byte gNumSingleplayerCharacters
_0807E8E4: .4byte 0x000026AC
_0807E8E8: .4byte 0x00002710
_0807E8EC: .4byte 0xFFFFFD00
_0807E8F0: .4byte 0x000002FF
_0807E8F4: .4byte gCamera
_0807E8F8: .4byte gCurTask
_0807E8FC:
	mov r0, sl
	bl DisplaySprite
_0807E902:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

.syntax divided
