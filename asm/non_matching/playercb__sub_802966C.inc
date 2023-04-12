
.syntax unified
.text
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0xff
	ldr r5, [r4, #0x48]
	ldr r7, [r4, #0x4c]
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08029680
	b _0802980C
_08029680:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r2, [r0]
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	bne _08029690
	b _0802980C
_08029690:
	ldrh r3, [r4, #0x14]
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	mov ip, r3
	cmp r1, #0
	ble _08029734
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080296D2
	adds r0, r1, #0
	ldr r1, [r4, #0x44]
	cmp r0, r1
	bge _080296BC
	adds r0, r3, r5
	strh r0, [r4, #0x14]
	movs r2, #0x14
	ldrsh r0, [r4, r2]
	cmp r0, r1
	ble _080296C6
	strh r1, [r4, #0x14]
	b _080296C6
_080296BC:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_080296C6:
	ldr r0, [r4, #0x20]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0x20]
	b _0802983C
_080296D2:
	ldr r0, _080296F0 @ =0x000001FF
	cmp r1, r0
	ble _08029708
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080296F4
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _08029702
	.align 2, 0
_080296F0: .4byte 0x000001FF
_080296F4:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _08029702
	movs r6, #8
_08029702:
	mov r3, ip
	subs r0, r3, r7
	b _080297A2
_08029708:
	subs r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08029714
	b _0802983C
_08029714:
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029720
	b _0802983C
_08029720:
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r0, [r0]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080297FA
	movs r6, #7
	b _080297FA
_08029734:
	cmp r1, #0
	bge _080297C8
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08029770
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x44]
	rsbs r2, r0, #0
	cmp r1, r2
	ble _0802975C
	subs r0, r3, r5
	strh r0, [r4, #0x14]
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bge _08029766
	strh r2, [r4, #0x14]
	b _08029766
_0802975C:
	adds r1, r4, #0
	adds r1, #0x58
	ldrh r0, [r1]
	adds r0, r0, r5
	strh r0, [r1]
_08029766:
	ldr r0, [r4, #0x20]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0x20]
	b _0802983C
_08029770:
	ldr r0, _0802978C @ =0xFFFFFE00
	cmp r1, r0
	bgt _080297B2
	adds r0, r4, #0
	adds r0, #0x64
	ldrh r1, [r0]
	subs r0, r1, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08029790
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _0802979E
	.align 2, 0
_0802978C: .4byte 0xFFFFFE00
_08029790:
	adds r0, r4, #0
	adds r0, #0x54
	ldrh r0, [r0]
	movs r6, #7
	cmp r0, #3
	bls _0802979E
	movs r6, #8
_0802979E:
	mov r2, ip
	adds r0, r2, r7
_080297A2:
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl sub_8029FA4
	movs r0, #0x73
	bl m4aSongNumStart
	b _0802983C
_080297B2:
	adds r0, r3, r7
	strh r0, [r4, #0x14]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802983C
	ldr r0, [r4, #0x20]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802983C
	b _08029720
_080297C8:
	ldr r1, [r4, #0x20]
	movs r0, #1
	ands r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	cmp r1, r0
	beq _080297FA
	cmp r1, #0
	beq _080297E2
	subs r0, r3, r5
	b _080297E4
_080297E2:
	adds r0, r3, r5
_080297E4:
	strh r0, [r4, #0x14]
	movs r6, #9
	adds r0, r4, #0
	movs r1, #0xe
	bl sub_8023B5C
	movs r0, #6
	strb r0, [r4, #0x16]
	movs r0, #0xe
	strb r0, [r4, #0x17]
	b _0802983C
_080297FA:
	ldr r1, _08029804 @ =gPlayer
	ldr r0, _08029808 @ =PlayerCB_802A5C4
	str r0, [r1]
	b _0802983C
	.align 2, 0
_08029804: .4byte gPlayer
_08029808: .4byte PlayerCB_802A5C4
_0802980C:
	movs r3, #0x14
	ldrsh r0, [r4, r3]
	cmp r0, #0
	ble _08029820
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	ble _0802982E
	b _08029834
_08029820:
	cmp r0, #0
	bge _0802983A
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	blt _08029834
_0802982E:
	movs r1, #0
	movs r6, #0
	b _08029836
_08029834:
	movs r6, #9
_08029836:
	strh r1, [r4, #0x14]
	b _0802983C
_0802983A:
	movs r6, #0
_0802983C:
	ldr r0, [r4, #0x20]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08029860
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r2, #0xf9
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08029890
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08029890
_08029860:
	lsls r0, r6, #0x18
	asrs r1, r0, #0x18
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0802987C
	adds r2, r4, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, r1
	beq _08029890
	strh r1, [r2]
	b _08029890
_0802987C:
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _08029890
	movs r0, #9
	strh r0, [r1]
_08029890:
	adds r0, r4, #0
	bl sub_8023128
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
.syntax divided
