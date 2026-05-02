.include "constants/constants.inc"

.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	adds r7, r3, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #0xc]
	movs r6, #0
	ldr r4, _0807B468 @ =gPartner
	ldr r5, _0807B46C @ =gPlayer
	movs r2, #4
	mov sl, r2
BumperCheckCollAndPosC3_loop: @ 0x0807B45A
	cmp r6, #0
	beq _0807B470
	ldr r0, [r4]
	mov r8, r0
	ldr r1, _0807B46C @ =gPlayer
	mov ip, r1
	b _0807B478
	.align 2, 0
_0807B468: .4byte gPartner
_0807B46C: .4byte gPlayer
_0807B470:
	ldr r2, [r5]
	mov r8, r2
	ldr r0, _0807B50C @ =gPlayer
	mov ip, r0
_0807B478:
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r7, #0x10
	asrs r2, r0, #0x10
	mov r3, ip
	cmp r6, #0
	beq _0807B48A
	ldr r3, _0807B510 @ =gPartner
_0807B48A:
	ldr r0, [sp, #4]
	bl Coll_Player_Entity_Intersection
	adds r2, r6, #1
	str r2, [sp, #0x10]
	cmp r0, #0
	bne _0807B49C
	bl _0807BC64
_0807B49C:
	ldr r0, _0807B514 @ =gGameMode
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #3
	beq _0807B4AA
	cmp r1, #5
	bne _0807B4FA
_0807B4AA:
	movs r1, #0
	ldr r2, _0807B518 @ =gMultiplayerPlayerTasks
	ldr r0, [r2]
	mov ip, r0
	adds r0, r6, #1
	str r0, [sp, #0x10]
	mov r0, ip
	cmp r0, #0
	beq _0807B4FA
	mov ip, r2
_0807B4BE:
	ldr r0, _0807B51C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	cmp r1, r0
	beq _0807B4E6
	lsls r0, r1, #2
	add r0, ip
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r0, r0, r2
	ldr r0, [r0, #0x5c]
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0807B4E6
	movs r0, #1
	str r0, [sp, #0xc]
_0807B4E6:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bhi _0807B4FA
	lsls r0, r1, #2
	add r0, ip
	ldr r0, [r0]
	cmp r0, #0
	bne _0807B4BE
_0807B4FA:
	cmp r6, #0
	beq _0807B520
	ldr r0, [r4, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807B52C
	b _0807B534
	.align 2, 0
_0807B50C: .4byte gPlayer
_0807B510: .4byte gPartner
_0807B514: .4byte gGameMode
_0807B518: .4byte gMultiplayerPlayerTasks
_0807B51C: .4byte 0x04000128
_0807B520:
	ldr r0, [r5, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0807B534
_0807B52C:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _0807B534
	b _0807BC64
_0807B534:
	ldr r2, [sp, #4]
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807B544
	b _0807B8C2
_0807B544:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	bne _0807B550
	b _0807B70A
_0807B550:
	mov r1, r8
	asrs r0, r1, #8
	ldr r2, [sp, #8]
	subs r0, r2, r0
	movs r1, #0x41
	subs r1, r1, r0
	cmp r6, #0
	beq _0807B56C
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	blt _0807B578
	b _0807BC64
_0807B56C:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	blt _0807B578
	b _0807BC64
_0807B578:
	cmp r6, #0
	beq _0807B584
	ldr r1, _0807B580 @ =gPartner + 0x59
	b _0807B586
	.align 2, 0
_0807B580: .4byte gPartner + 0x59
_0807B584:
	ldr r1, _0807B5A4 @ =gPlayer + 0x59
_0807B586:
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, _0807B5A8 @ =gPlayer
	mov ip, r2
	cmp r0, #1
	beq _0807B5BA
	cmp r6, #0
	beq _0807B5B0
	ldr r1, _0807B5AC @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	beq _0807B5BA
	b _0807B618
	.align 2, 0
_0807B5A4: .4byte gPlayer + 0x59
_0807B5A8: .4byte gPlayer
_0807B5AC: .4byte gPartner + 0x59
_0807B5B0:
	ldr r2, _0807B5CC @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #2
	bne _0807B618
_0807B5BA:
	cmp r6, #0
	beq _0807B5D4
	ldr r1, _0807B5D0 @ =gPartner + 0x3D
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0807B5E2
	b _0807B618
	.align 2, 0
_0807B5CC: .4byte gPlayer + 0x59
_0807B5D0: .4byte gPartner + 0x3D
_0807B5D4:
	mov r0, ip
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807B618
_0807B5E2:
	ldr r0, _0807B600 @ =gPlayer
	cmp r6, #0
	beq _0807B5EA
	ldr r0, _0807B604 @ =gPartner
_0807B5EA:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _0807B60C
	movs r0, #5
	ldr r2, _0807B608 @ =gPartner + 0x40
	strb r0, [r2]
	ldr r0, _0807B600 @ =gPlayer
	mov ip, r0
	b _0807B616
	.align 2, 0
_0807B600: .4byte gPlayer
_0807B604: .4byte gPartner
_0807B608: .4byte gPartner + 0x40
_0807B60C:
	movs r0, #5
	ldr r1, _0807B62C @ =gPlayer + 0x40
	strb r0, [r1]
	ldr r2, _0807B630 @ =gPlayer
	mov ip, r2
_0807B616:
	ldr r3, _0807B634 @ =gGameMode
_0807B618:
	ldrb r0, [r3]
	cmp r0, #3
	beq _0807B622
	cmp r0, #5
	bne _0807B63E
_0807B622:
	cmp r6, #0
	beq _0807B638
	movs r0, #0x1e
	strh r0, [r4, #0x1c]
	b _0807B63E
	.align 2, 0
_0807B62C: .4byte gPlayer + 0x40
_0807B630: .4byte gPlayer
_0807B634: .4byte gGameMode
_0807B638:
	movs r0, #0x1e
	mov r1, ip
	strh r0, [r1, #0x1c]
_0807B63E:
	cmp r6, #0
	beq _0807B64E
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B658
_0807B64E:
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807B658:
	cmp r6, #0
	beq _0807B666
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0807B66E
_0807B666:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_0807B66E:
	cmp r6, #0
	beq _0807B680
	ldr r0, [r4, #0x10]
	ldr r1, _0807B67C @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B688
	.align 2, 0
_0807B67C: .4byte 0xFFFFFEFF
_0807B680:
	ldr r0, [r5, #0x10]
	ldr r1, _0807B698 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
_0807B688:
	cmp r6, #0
	beq _0807B69C
	ldr r0, [r4, #0x10]
	mov r2, sl
	orrs r0, r2
	str r0, [r4, #0x10]
	b _0807B6A4
	.align 2, 0
_0807B698: .4byte 0xFFFFFEFF
_0807B69C:
	ldr r0, [r5, #0x10]
	mov r1, sl
	orrs r0, r1
	str r0, [r5, #0x10]
_0807B6A4:
	cmp r6, #0
	beq _0807B6B4
	ldr r0, [r4, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B6BE
_0807B6B4:
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807B6BE:
	mov r1, ip
	cmp r6, #0
	beq _0807B6C6
	ldr r1, _0807B6E0 @ =gPartner
_0807B6C6:
	movs r0, #6
	strb r0, [r1, #0xe]
	mov r1, ip
	cmp r6, #0
	beq _0807B6D2
	ldr r1, _0807B6E0 @ =gPartner
_0807B6D2:
	movs r0, #9
	strb r0, [r1, #0xf]
	cmp r6, #0
	beq _0807B6E8
	ldr r2, _0807B6E4 @ =0xFFFFFB50
	strh r2, [r4, #8]
	b _0807B6EE
	.align 2, 0
_0807B6E0: .4byte gPartner
_0807B6E4: .4byte 0xFFFFFB50
_0807B6E8:
	ldr r1, _0807B6FC @ =0xFFFFFB50
	mov r0, ip
	strh r1, [r0, #8]
_0807B6EE:
	cmp r6, #0
	beq _0807B700
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r4, #0xa]
	b _0807BC52
	.align 2, 0
_0807B6FC: .4byte 0xFFFFFB50
_0807B700:
	movs r0, #0x96
	lsls r0, r0, #3
	mov r2, ip
	strh r0, [r2, #0xa]
	b _0807BC52
_0807B70A:
	mov r1, r8
	asrs r0, r1, #8
	ldr r2, [sp, #8]
	subs r0, r0, r2
	movs r1, #0x41
	subs r1, r1, r0
	cmp r6, #0
	beq _0807B726
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	blt _0807B732
	b _0807BC64
_0807B726:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	blt _0807B732
	b _0807BC64
_0807B732:
	cmp r6, #0
	beq _0807B740
	ldr r1, _0807B73C @ =gPartner + 0x59
	b _0807B742
	.align 2, 0
_0807B73C: .4byte gPartner + 0x59
_0807B740:
	ldr r1, _0807B760 @ =gPlayer + 0x59
_0807B742:
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, _0807B764 @ =gPlayer
	mov ip, r2
	cmp r0, #1
	beq _0807B776
	cmp r6, #0
	beq _0807B76C
	ldr r1, _0807B768 @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	beq _0807B776
	b _0807B7D4
	.align 2, 0
_0807B760: .4byte gPlayer + 0x59
_0807B764: .4byte gPlayer
_0807B768: .4byte gPartner + 0x59
_0807B76C:
	ldr r2, _0807B788 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #2
	bne _0807B7D4
_0807B776:
	cmp r6, #0
	beq _0807B790
	ldr r1, _0807B78C @ =gPartner + 0x3D
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0807B79E
	b _0807B7D4
	.align 2, 0
_0807B788: .4byte gPlayer + 0x59
_0807B78C: .4byte gPartner + 0x3D
_0807B790:
	mov r0, ip
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807B7D4
_0807B79E:
	ldr r0, _0807B7BC @ =gPlayer
	cmp r6, #0
	beq _0807B7A6
	ldr r0, _0807B7C0 @ =gPartner
_0807B7A6:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _0807B7C8
	movs r0, #5
	ldr r2, _0807B7C4 @ =gPartner + 0x40
	strb r0, [r2]
	ldr r0, _0807B7BC @ =gPlayer
	mov ip, r0
	b _0807B7D2
	.align 2, 0
_0807B7BC: .4byte gPlayer
_0807B7C0: .4byte gPartner
_0807B7C4: .4byte gPartner + 0x40
_0807B7C8:
	movs r0, #5
	ldr r1, _0807B7E8 @ =gPlayer + 0x40
	strb r0, [r1]
	ldr r2, _0807B7EC @ =gPlayer
	mov ip, r2
_0807B7D2:
	ldr r3, _0807B7F0 @ =gGameMode
_0807B7D4:
	ldrb r0, [r3]
	cmp r0, #3
	beq _0807B7DE
	cmp r0, #5
	bne _0807B7FA
_0807B7DE:
	cmp r6, #0
	beq _0807B7F4
	movs r0, #0x1e
	strh r0, [r4, #0x1c]
	b _0807B7FA
	.align 2, 0
_0807B7E8: .4byte gPlayer + 0x40
_0807B7EC: .4byte gPlayer
_0807B7F0: .4byte gGameMode
_0807B7F4:
	movs r0, #0x1e
	mov r1, ip
	strh r0, [r1, #0x1c]
_0807B7FA:
	cmp r6, #0
	beq _0807B80A
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B814
_0807B80A:
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807B814:
	cmp r6, #0
	beq _0807B822
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0807B82A
_0807B822:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_0807B82A:
	cmp r6, #0
	beq _0807B83C
	ldr r0, [r4, #0x10]
	ldr r1, _0807B838 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B844
	.align 2, 0
_0807B838: .4byte 0xFFFFFEFF
_0807B83C:
	ldr r0, [r5, #0x10]
	ldr r1, _0807B854 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
_0807B844:
	cmp r6, #0
	beq _0807B858
	ldr r0, [r4, #0x10]
	mov r2, sl
	orrs r0, r2
	str r0, [r4, #0x10]
	b _0807B860
	.align 2, 0
_0807B854: .4byte 0xFFFFFEFF
_0807B858:
	ldr r0, [r5, #0x10]
	mov r1, sl
	orrs r0, r1
	str r0, [r5, #0x10]
_0807B860:
	cmp r6, #0
	beq _0807B870
	ldr r0, [r4, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B87A
_0807B870:
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807B87A:
	mov r1, ip
	cmp r6, #0
	beq _0807B882
	ldr r1, _0807B8A0 @ =gPartner
_0807B882:
	movs r0, #6
	strb r0, [r1, #0xe]
	mov r1, ip
	cmp r6, #0
	beq _0807B88E
	ldr r1, _0807B8A0 @ =gPartner
_0807B88E:
	movs r0, #9
	strb r0, [r1, #0xf]
	cmp r6, #0
	beq _0807B8A4
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r4, #8]
	b _0807B8AC
	.align 2, 0
_0807B8A0: .4byte gPartner
_0807B8A4:
	movs r0, #0x96
	lsls r0, r0, #3
	mov r2, ip
	strh r0, [r2, #8]
_0807B8AC:
	cmp r6, #0
	beq _0807B8B8
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r4, #0xa]
	b _0807BA82
_0807B8B8:
	movs r0, #0x96
	lsls r0, r0, #3
	mov r1, ip
	strh r0, [r1, #0xa]
	b _0807BA82
_0807B8C2:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	bne _0807B8CE
	b _0807BA9C
_0807B8CE:
	mov r1, r8
	asrs r0, r1, #8
	ldr r2, [sp, #8]
	subs r0, r2, r0
	adds r1, r0, #0
	subs r1, #0x3c
	cmp r6, #0
	beq _0807B8EA
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	bgt _0807B8F6
	b _0807BC64
_0807B8EA:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	bgt _0807B8F6
	b _0807BC64
_0807B8F6:
	cmp r6, #0
	beq _0807B904
	ldr r1, _0807B900 @ =gPartner + 0x59
	b _0807B906
	.align 2, 0
_0807B900: .4byte gPartner + 0x59
_0807B904:
	ldr r1, _0807B924 @ =gPlayer + 0x59
_0807B906:
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, _0807B928 @ =gPlayer
	mov ip, r2
	cmp r0, #1
	beq _0807B93A
	cmp r6, #0
	beq _0807B930
	ldr r1, _0807B92C @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	beq _0807B93A
	b _0807B998
	.align 2, 0
_0807B924: .4byte gPlayer + 0x59
_0807B928: .4byte gPlayer
_0807B92C: .4byte gPartner + 0x59
_0807B930:
	ldr r2, _0807B94C @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #2
	bne _0807B998
_0807B93A:
	cmp r6, #0
	beq _0807B954
	ldr r1, _0807B950 @ =gPartner + 0x3D
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0807B962
	b _0807B998
	.align 2, 0
_0807B94C: .4byte gPlayer + 0x59
_0807B950: .4byte gPartner + 0x3D
_0807B954:
	mov r0, ip
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807B998
_0807B962:
	ldr r0, _0807B980 @ =gPlayer
	cmp r6, #0
	beq _0807B96A
	ldr r0, _0807B984 @ =gPartner
_0807B96A:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _0807B98C
	movs r0, #5
	ldr r2, _0807B988 @ =gPartner + 0x40
	strb r0, [r2]
	ldr r0, _0807B980 @ =gPlayer
	mov ip, r0
	b _0807B996
	.align 2, 0
_0807B980: .4byte gPlayer
_0807B984: .4byte gPartner
_0807B988: .4byte gPartner + 0x40
_0807B98C:
	movs r0, #5
	ldr r1, _0807B9AC @ =gPlayer + 0x40
	strb r0, [r1]
	ldr r2, _0807B9B0 @ =gPlayer
	mov ip, r2
_0807B996:
	ldr r3, _0807B9B4 @ =gGameMode
_0807B998:
	ldrb r0, [r3]
	cmp r0, #3
	beq _0807B9A2
	cmp r0, #5
	bne _0807B9BE
_0807B9A2:
	cmp r6, #0
	beq _0807B9B8
	movs r0, #0x1e
	strh r0, [r4, #0x1c]
	b _0807B9BE
	.align 2, 0
_0807B9AC: .4byte gPlayer + 0x40
_0807B9B0: .4byte gPlayer
_0807B9B4: .4byte gGameMode
_0807B9B8:
	movs r0, #0x1e
	mov r1, ip
	strh r0, [r1, #0x1c]
_0807B9BE:
	cmp r6, #0
	beq _0807B9CE
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807B9D8
_0807B9CE:
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807B9D8:
	cmp r6, #0
	beq _0807B9E6
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0807B9EE
_0807B9E6:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_0807B9EE:
	cmp r6, #0
	beq _0807BA00
	ldr r0, [r4, #0x10]
	ldr r1, _0807B9FC @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807BA08
	.align 2, 0
_0807B9FC: .4byte 0xFFFFFEFF
_0807BA00:
	ldr r0, [r5, #0x10]
	ldr r1, _0807BA18 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
_0807BA08:
	cmp r6, #0
	beq _0807BA1C
	ldr r0, [r4, #0x10]
	mov r2, sl
	orrs r0, r2
	str r0, [r4, #0x10]
	b _0807BA24
	.align 2, 0
_0807BA18: .4byte 0xFFFFFEFF
_0807BA1C:
	ldr r0, [r5, #0x10]
	mov r1, sl
	orrs r0, r1
	str r0, [r5, #0x10]
_0807BA24:
	cmp r6, #0
	beq _0807BA34
	ldr r0, [r4, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807BA3E
_0807BA34:
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807BA3E:
	mov r1, ip
	cmp r6, #0
	beq _0807BA46
	ldr r1, _0807BA60 @ =gPartner
_0807BA46:
	movs r0, #6
	strb r0, [r1, #0xe]
	mov r1, ip
	cmp r6, #0
	beq _0807BA52
	ldr r1, _0807BA60 @ =gPartner
_0807BA52:
	movs r0, #9
	strb r0, [r1, #0xf]
	cmp r6, #0
	beq _0807BA68
	ldr r2, _0807BA64 @ =0xFFFFFB50
	strh r2, [r4, #8]
	b _0807BA6E
	.align 2, 0
_0807BA60: .4byte gPartner
_0807BA64: .4byte 0xFFFFFB50
_0807BA68:
	ldr r1, _0807BA78 @ =0xFFFFFB50
	mov r0, ip
	strh r1, [r0, #8]
_0807BA6E:
	cmp r6, #0
	beq _0807BA7C
	ldr r2, _0807BA78 @ =0xFFFFFB50
	strh r2, [r4, #0xa]
	b _0807BA82
	.align 2, 0
_0807BA78: .4byte 0xFFFFFB50
_0807BA7C:
	ldr r1, _0807BA98 @ =0xFFFFFB50
	mov r0, ip
	strh r1, [r0, #0xa]
_0807BA82:
	movs r0, #0xb8
	bl m4aSongNumStart
	ldr r1, [sp]
	adds r1, #0x4c
	movs r0, #0
	strb r0, [r1]
	movs r2, #1
	mov sb, r2
	b _0807BC64
	.align 2, 0
_0807BA98: .4byte 0xFFFFFB50
_0807BA9C:
	mov r1, r8
	asrs r0, r1, #8
	ldr r2, [sp, #8]
	subs r0, r0, r2
	adds r1, r0, #0
	subs r1, #0x3c
	cmp r6, #0
	beq _0807BAB8
	ldr r0, [r4, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	bgt _0807BAC4
	b _0807BC64
_0807BAB8:
	ldr r0, [r5, #4]
	asrs r0, r0, #8
	subs r0, r0, r7
	cmp r0, r1
	bgt _0807BAC4
	b _0807BC64
_0807BAC4:
	cmp r6, #0
	beq _0807BAD0
	ldr r1, _0807BACC @ =gPartner + 0x59
	b _0807BAD2
	.align 2, 0
_0807BACC: .4byte gPartner + 0x59
_0807BAD0:
	ldr r1, _0807BAF0 @ =gPlayer + 0x59
_0807BAD2:
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, _0807BAF4 @ =gPlayer
	mov ip, r2
	cmp r0, #1
	beq _0807BB06
	cmp r6, #0
	beq _0807BAFC
	ldr r1, _0807BAF8 @ =gPartner + 0x59
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #2
	beq _0807BB06
	b _0807BB64
	.align 2, 0
_0807BAF0: .4byte gPlayer + 0x59
_0807BAF4: .4byte gPlayer
_0807BAF8: .4byte gPartner + 0x59
_0807BAFC:
	ldr r2, _0807BB18 @ =gPlayer + 0x59
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #2
	bne _0807BB64
_0807BB06:
	cmp r6, #0
	beq _0807BB20
	ldr r1, _0807BB1C @ =gPartner + 0x3D
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0807BB2E
	b _0807BB64
	.align 2, 0
_0807BB18: .4byte gPlayer + 0x59
_0807BB1C: .4byte gPartner + 0x3D
_0807BB20:
	mov r0, ip
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807BB64
_0807BB2E:
	ldr r0, _0807BB4C @ =gPlayer
	cmp r6, #0
	beq _0807BB36
	ldr r0, _0807BB50 @ =gPartner
_0807BB36:
	bl Player_TransitionCancelFlyingAndBoost
	cmp r6, #0
	beq _0807BB58
	movs r0, #5
	ldr r2, _0807BB54 @ =gPartner + 0x40
	strb r0, [r2]
	ldr r0, _0807BB4C @ =gPlayer
	mov ip, r0
	b _0807BB62
	.align 2, 0
_0807BB4C: .4byte gPlayer
_0807BB50: .4byte gPartner
_0807BB54: .4byte gPartner + 0x40
_0807BB58:
	movs r0, #5
	ldr r1, _0807BB78 @ =gPlayer + 0x40
	strb r0, [r1]
	ldr r2, _0807BB7C @ =gPlayer
	mov ip, r2
_0807BB62:
	ldr r3, _0807BB80 @ =gGameMode
_0807BB64:
	ldrb r0, [r3]
	cmp r0, #3
	beq _0807BB6E
	cmp r0, #5
	bne _0807BB8A
_0807BB6E:
	cmp r6, #0
	beq _0807BB84
	movs r0, #0x1e
	strh r0, [r4, #0x1c]
	b _0807BB8A
	.align 2, 0
_0807BB78: .4byte gPlayer + 0x40
_0807BB7C: .4byte gPlayer
_0807BB80: .4byte gGameMode
_0807BB84:
	movs r0, #0x1e
	mov r1, ip
	strh r0, [r1, #0x1c]
_0807BB8A:
	cmp r6, #0
	beq _0807BB9A
	ldr r0, [r4, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807BBA4
_0807BB9A:
	ldr r0, [r5, #0x10]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807BBA4:
	cmp r6, #0
	beq _0807BBB2
	ldr r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r4, #0x10]
	b _0807BBBA
_0807BBB2:
	ldr r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	str r0, [r5, #0x10]
_0807BBBA:
	cmp r6, #0
	beq _0807BBCC
	ldr r0, [r4, #0x10]
	ldr r1, _0807BBC8 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807BBD4
	.align 2, 0
_0807BBC8: .4byte 0xFFFFFEFF
_0807BBCC:
	ldr r0, [r5, #0x10]
	ldr r1, _0807BBE4 @ =0xFFFFFEFF
	ands r0, r1
	str r0, [r5, #0x10]
_0807BBD4:
	cmp r6, #0
	beq _0807BBE8
	ldr r0, [r4, #0x10]
	mov r2, sl
	orrs r0, r2
	str r0, [r4, #0x10]
	b _0807BBF0
	.align 2, 0
_0807BBE4: .4byte 0xFFFFFEFF
_0807BBE8:
	ldr r0, [r5, #0x10]
	mov r1, sl
	orrs r0, r1
	str r0, [r5, #0x10]
_0807BBF0:
	cmp r6, #0
	beq _0807BC00
	ldr r0, [r4, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x10]
	b _0807BC0A
_0807BC00:
	ldr r0, [r5, #0x10]
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x10]
_0807BC0A:
	mov r1, ip
	cmp r6, #0
	beq _0807BC12
	ldr r1, _0807BC30 @ =gPartner
_0807BC12:
	movs r0, #6
	strb r0, [r1, #0xe]
	mov r1, ip
	cmp r6, #0
	beq _0807BC1E
	ldr r1, _0807BC30 @ =gPartner
_0807BC1E:
	movs r0, #9
	strb r0, [r1, #0xf]
	cmp r6, #0
	beq _0807BC34
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r4, #8]
	b _0807BC3C
	.align 2, 0
_0807BC30: .4byte gPartner
_0807BC34:
	movs r0, #0x96
	lsls r0, r0, #3
	mov r2, ip
	strh r0, [r2, #8]
_0807BC3C:
	cmp r6, #0
	beq _0807BC4C
	ldr r0, _0807BC48 @ =0xFFFFFB50
	strh r0, [r4, #0xa]
	b _0807BC52
	.align 2, 0
_0807BC48: .4byte 0xFFFFFB50
_0807BC4C:
	ldr r2, _0807BC70 @ =0xFFFFFB50
	mov r1, ip
	strh r2, [r1, #0xa]
_0807BC52:
	movs r0, #0xb8
	bl m4aSongNumStart
	ldr r1, [sp]
	adds r1, #0x4c
	movs r0, #0
	strb r0, [r1]
	movs r0, #1
	mov sb, r0
_0807BC64:
	cmp r6, #0
	beq _0807BC74
	mov r1, r8
	str r1, [r4]
	b _0807BC78
	.align 2, 0
_0807BC70: .4byte 0xFFFFFB50
_0807BC74:
	mov r2, r8
	str r2, [r5]
_0807BC78:
	ldr r6, [sp, #0x10]
	ldr r0, _0807BC9C @ =gNumSingleplayerCharacters
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bge _0807BC8A
	bl BumperCheckCollAndPosC3_loop
_0807BC8A:
	mov r0, sb
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807BC9C: .4byte gNumSingleplayerCharacters

.syntax divided
